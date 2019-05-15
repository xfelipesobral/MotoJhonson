<?php

    ini_set('display_errors',1);
    ini_set('display_startup_erros',1);
    error_reporting(E_ALL);

    require_once "ControllerUsuario.php";
    require_once "../mj_model/Motoboy.php";

    class ControllerMotoboy extends ControllerUsuario{

        public static function inserir($dados){
            $moto = new Motoboy;

            $moto->setCpf($dados["cpf"]);
            $moto->setVeiculo($dados["veiculo"]);
            $moto->setUsuario($dados["usuario"]);

            $moto->cadastrar();
        }

        //inserir_USUARIO_MOTOBOY
        public function inserir_UM($usuario, $motoboy){
            parent::inserir($usuario);
            self::inserir($motoboy);
        }

        public function verificar_login($usuario, $senha){
            $moto = new Motoboy;

            $moto->setUsuario($usuario);
            $moto->setSenha($senha);

            $this->criar_sessao($moto->verificar_usuario());
        }


    }

    $controller = new ControllerMotoboy;

    if(isset($_POST["acao"])){

        switch($_POST["acao"]){

            case "inserir_UM":
                echo $controller->inserir_UM($_POST["usuario"], $_POST["motoboy"]);
                break;

            case "login":
                $controller->verificar_login($_POST["usuario"], $_POST["senha"]);
                break;

            default:
                print("Acao invalida!");

        }

    }
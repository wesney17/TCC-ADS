<?php
include('verificaSessao2.php');
?>
<!DOCTYPE html>
<html lang="pt-br">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Consultar</title>
    <!-- Favicon -->
    <link rel="icon" href="../assets/img/brand/favicon.png" type="image/png">
    <!-- Fonts -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700">
    <!-- Icons -->
    <link rel="stylesheet" href="../assets/vendor/nucleo/css/nucleo.css" type="text/css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
    <link rel="stylesheet" href="../assets/vendor/@fortawesome/fontawesome-free/css/all.min.css" type="text/css">
    <!-- CSS -->
    <link rel="stylesheet" href="../assets/css/argon.css?v=1.2.0" type="text/css">
    <!-- Ajax -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css" />
    <!-- Bootstrap -->
    <script type="text/javascript" src="js/jquery-3.6.0.min.js"></script>
    <script type="text/javascript" src="js/bootstrap.min.js"></script>
    <!-- Sweetalert -->
    <script src="./js/sweetalert.js"></script>
</head>

<body>
    <!-- Sidenav -->
    <nav class="sidenav navbar navbar-vertical  fixed-left  navbar-expand-xs navbar-light bg-white" id="sidenav-main">
        <div class="scrollbar-inner">
            <!-- Brand -->
            <div class="sidenav-header  align-items-center">
                <a class="navbar-brand" href="javascript:void(0)">
                    <img src="./img/logo.jpeg" class="navbar-brand-img" alt="...">
                    <h2>DMW</h2>
                </a>
            </div>
            <div class="navbar-inner">
                <!-- Collapse -->
                <div class="collapse navbar-collapse" id="sidenav-collapse-main">
                    <!-- Nav items -->
                    <!-- Divider -->
                    <hr class="my-3">
                    <!-- Heading -->
                    <h6 class="navbar-heading p-0">
                        <span class="docs-normal">Acesso:</span>
                    </h6>
                    <ul class="navbar-nav">
                        <li class="nav-item">
                            <a class="nav-link" href="cadastroFuncionario.php">
                                <i class="bi bi-tools" style="font-size: 1rem; color: cornflowerblue;"></i>
                                <span class="nav-link-text">Funcionario</span>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="cadastroFornecedor.php">
                                <i class="ni ni-delivery-fast" style="font-size: 1rem; color: cornflowerblue;"></i>
                                <span class="nav-link-text">Fornecedor</span>
                            </a>

                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="produto.php">
                                <i class="bi bi-cart4" style="font-size: 1rem; color: cornflowerblue;"></i>
                                <span class="nav-link-text">Produto</span>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="cadastroCliente.php">
                                <i class="bi bi-person-lines-fill" style="font-size: 1rem; color: cornflowerblue;"></i>
                                <span class="nav-link-text">Cliente</span>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="ordemservicoEmpresa.php">
                                <i class="bi bi-clipboard-data" style="font-size: 1rem; color: cornflowerblue;"></i>
                                <span class="nav-link-text">Ordem de Serviço</span>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link active" href="consultar.php">
                                <i class="bi bi-search" style="font-size: 1rem; color: cornflowerblue;"></i>
                                <span class="nav-link-text">Consultar</span>
                            </a>
                        </li>
                        <li class="nav-item">
                            <button id="sair" type="button" class="text-dark nav-link m-2" style="background-color: transparent;
                            border: 0;color: #00f;cursor: pointer;display: inline-block;padding:0;margin:1em;position: relative;text-decoration: none;">
                                <i class="bi bi-x-octagon-fill text-danger p-3" style="font-size: 1rem; color: cornflowerblue;"></i>
                                Sair</button>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </nav>
    <!-- Main content -->
    <div class="main-content" id="panel">
        <!-- Topnav -->
        <nav class="navbar navbar-top navbar-expand navbar-dark bg-primary border-bottom">
            <div class="container-fluid">
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <!-- Navbar links -->
                    <ul class="navbar-nav align-items-center  ml-md-auto ">
                        <li class="nav-item d-xl-none">
                            <!-- Sidenav toggler -->
                            <div class="pr-3 sidenav-toggler fixed-right sidenav-toggler-dark" data-action="sidenav-pin" data-target="#sidenav-main">
                                <div class="sidenav-toggler-inner">
                                    <i class="sidenav-toggler-line"></i>
                                    <i class="sidenav-toggler-line"></i>
                                    <i class="sidenav-toggler-line"></i>
                                </div>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
        <!-- Header -->
        <div class="header bg-primary pb-6">
            <div class="container-fluid">
                <div class="header-body">
                    <div class="row align-items-center py-4">
                    </div>
                </div>
            </div>
        </div>
        <!-- Page content -->
        <div class="container-fluid mt--7">
            <div class="row mt--5">
                <div class="col-md-10 ml-auto mr-auto">
                    <div class="card card-upgrade">
                        <!-- Card header -->
                        <form action="" method="POST" id="retorno" name="retorno" class="formCon">
                            <div class="input-group-append p-2 mt-2">
                                <h2 class="px-0">Consultar:</h2>
                                <select name="consulta" id="consulta" class="btn-sm btn-primary dropdown-toggle" type="submit" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    <option selected>Selecione</option>
                                    <option class="dropdown-item text-white" value="Cliente" href="#">Cliente</option>
                                    <option class="dropdown-item text-white" value="Departamento" href="#">Departamento</option>
                                    <option class="dropdown-item text-white" value="Funcionario" href="#">Funcionario</option>
                                    <option class="dropdown-item text-white" value="Produto" href="#">Produto</option>
                                    <option class="dropdown-item text-white" value="Fornecedor" href="#">Fornecedor</option>
                                    <option class="dropdown-item text-white" value="Ordem_de_Servico" href="#">Ordem de Serviço</option>
                                </select>
                            </div>
                            <div class="input-group mb-3 p-2">
                                <input type="text" id="filtro" name="filtro" class="form-control" placeholder="Digite." aria-label="Recipient's username" aria-describedby="basic-addon2">
                                <div class="input-group-append">
                                    <input class="btn btn-primary" value="Pesquisar" type="submit">

                                    </input>
                                </div>
                            </div>
                        </form>

                        <!-- Light table -->
                        <table class="table table-hover">

                            <?php
                            //------------------- CHAMA O PROG DE CONSULTA A BASE DE DADOS LOCAL -------------------
                            include_once './php/readEmp.php';
                            // -----------------------------------FIM--------------------------------------------
                            ?>

                        </table>
                        <!-- Card footer -->
                        <div class="card-footer py-4">
                            <nav aria-label="...">
                                <ul class="pagination justify-content-end mb-0">
                                    <li class="page-item disabled">
                                        <a class="page-link" href="#" tabindex="-1">
                                            <i class="fas fa-angle-left"></i>
                                            <span class="sr-only">Previous</span>
                                        </a>
                                    </li>
                                    <li class="page-item active">
                                        <a class="page-link" href="#">1</a>
                                    </li>
                                    <li class="page-item">
                                        <a class="page-link" href="#">
                                            <i class="fas fa-angle-right"></i>
                                            <span class="sr-only">Next</span>
                                        </a>
                                    </li>
                                </ul>
                            </nav>
                        </div>
                    </div>
                    <!-- Footer -->
                    <footer class="footer pt-0" style="margin: auto;width: 100%;bottom: 0; position: fixed;">
                        <div class="row align-items-center justify-content-lg-between">
                            <div class="col-lg-6">
                                <div class="copyright text-center  text-lg-left  text-muted">
                                    &copy; 2021 <a href="index.html" class="font-weight-bold ml-1" target="_blank">DMW</a>
                                </div>
                            </div>
                        </div>
                    </footer>
                </div>
            </div>
        </div>
    </div>
    </div>
    <!-- Scripts -->

    <!-- Core -->
    <script src="../assets/vendor/jquery/dist/jquery.min.js"></script>
    <script src="../assets/vendor/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
    <script src="../assets/vendor/js-cookie/js.cookie.js"></script>
    <script src="../assets/vendor/jquery.scrollbar/jquery.scrollbar.min.js"></script>
    <script src="../assets/vendor/jquery-scroll-lock/dist/jquery-scrollLock.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
    <!-- Puxando o jquery e plugin "mask" do jquery -->
    <script type="text/javascript" src="js/jquery.mask.min.js"></script>
    <!-- JS -->
    <script src="./js/consultar.js"></script>
    <script src="./js/sair.js"></script>
</body>

</html>
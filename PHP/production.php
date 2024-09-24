<?php
if(isset($_POST['search']) && !empty($_POST['search_val']))
{
    printProduct();

    print_result($_POST['search_val']);

}
else
{
    printProduct();
}

function printProduct()
{
    ?>
    <form action="" method="post">
        <div class="container pt-3">
            <div class="row text-center">
                <div class="col">
                    <h1>Produktionsfirma</h1>
                </div>
            </div>
        </div>
        <div class="container pt-4">
            <div class="card shadow-sm">
                <div class="card-header">
                    <h2>Filmsuche</h2>
                </div>
                <div class="card-body">
                    <div class="row pt-3">
                        <div class="col">
                            <div class="input-group input-group-lg">
                                <span class="input-group-text" id="search_movie">Suche Film nach Produktionsfirma</span>
                                <input type="text" name="search_val" class="form-control" aria-label="Sizing example input" aria-describedby="search_movie">
                            </div>
                        </div>
                    </div>
                    <div class="row justify-content-center pt-5">
                        <div class="col-1">
                            <button type="submit" name="search" class="btn btn-primary btn-lg">Suchen</button>
                        </div>
                        <div class="col-1">
                            <button type="submit" class="btn btn-danger btn-lg">Abbrechen</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
    <?php
}

function print_result($search_val)
{
    ?>
    <div class="container pt-4">
        <div class="card shadow-sm">
            <div class="card-header">
                <h2>Suchergebnis</h2>
            </div>
            <div class="card-body">
                <div class="row pt-3">
                    <div class="col-3">
                        <h5>Gesuchte Produktionsfirma:</h5>
                    </div>
                    <div class="col">
                        <h5><b><?= $search_val ?></b></h5>
                    </div>
                </div>
                <div class="row pt-5">
                    <div class="col-3">
                        <h5>Gefundene Produktionsfirma:</h5>
                    </div>
                    <div class="col">
                        <h5><b><?= $search_val ?></b></h5>
                    </div>
                </div>
                <div class="row pt-5">
                    <div class="col-3">
                        <h5>Anzahl gefundener Filmtitel:</h5>
                    </div>
                    <div class="col">
                        <h5><b><?= $search_val ?></b></h5>
                    </div>
                </div>

            </div>
        </div>
    </div>

    <?php
}
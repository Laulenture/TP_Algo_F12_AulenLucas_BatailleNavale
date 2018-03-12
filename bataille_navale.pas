program : bataille_navale;

{Consignes : à rendre (via github) le 12 mars, la pascal du projet, l'algo si voulu.
    Au lieu d'utiliser un tableau à deux dimmentions pour représenter la grille de jeu, utiliser une structure cases pour décrire les cases occuper par les bateaux, de même un bateau seras décrit par un essemble de cases et la flotte de bateaux à couller sera représenté par un ensemble de bateaux.
    *1-Ecrire la structure case (ici "coordonnees") composé de deux champs ligne et colone des entier
    *2-Ecrire la structure bateau composé d'un essemble de n cases
    *3-Ecrire la structure flotte pour construire un ensemble de bateau
    4-Ecrire la fonction/procedure de création d'une case, elle prend en paramètre la ligne et la colonne associé à la case
    5-Ecrire une fonction de comparaison de deux cases, qui retournera VRAI ou FAUX
    6-Ecrire un fonction de création de bateau, elle retournera uns structure bateau correctement remplie
    7-Ecrire une fonction qui verifie qu'une case appartiens à un bateau, qui retourne VRAI ou FAUX, elle doit utiliser votre fonction de comparaison de cases
    8-Ecrire une fonction qui vérifie q'une case appartiens à une flotte de bateau, cette fonction devras utiliser votre fonction de vérification d'un bateau
    9-Le "gameplay" est libre, écrire le jeu de la bataille navale au complet
    10- GLHF}

uses crt;

CONST
    TAILLEMAX = 14;
    TAILLEMIN = 1;
    NBJOUEUR = 2;
    NBBATTEAUX = 5;
    TAILLEMAXBATEAUX = 6;

TYPE direction = (H,V);

TYPE confimation = (Y,N);

TYPE longueurBateau = 2..6;

TYPE tailleTableau = TAILLEMIN..TAILLEMAX;

TYPE coordonnees = RECORD
    x : INTEGER;
    y : INTEGER;
END;

TYPE bateau = RECORD
    casesBateau : ARRAY [1..TAILLEMAXBATEAUX] OF coordonnees;
    LongBateau : longueurBateau;
END;

TYPE flotte = RECORD
    bateaux : ARRAY [1..5] OF bateau;
END;


PROCEDURE creaCase (x,y : INTEGER; VAR flottes : ARRAY OF flotte; i,nbBateau : INTEGER);

    BEGIN
        flotte[i].bateaux[nbBateau].casesBateau[]
    END;


PROCEDURE creaBateau (i : INTEGER; VAR flottes : ARRAY OF flotte; nbBateau : INTEGER);

    VAR
        longueurBateau : INTEGER;     //indique la longueur du bateau actuel
        nbCase : INTEGER;       //indique quelle case du bateau est selectionné
        orientation : direction;        //indique l'orientation du bateau selectionné
        x,y : tailleTableau;       //utilisé comme coordonnées de base pour créer le bateau

    BEGIN
        longueur := nbBateau + 1;
        writeln('Placez votre bateau N°: ', nbBateau, ' sa longueur est de ', longueur, ' cases.');
        begin
        writeln('Voulez vous mettre votre bateau à l''horizontale (vers la droite) ou verticale (vers le bas) ? (H/V)');
        LIRE orientation
        writeln('Entrez les coordonnées de votre bateaux (la tableau fait ',TAILLEMAX,' sur ',TAILLEMAX,' cases)');
        IF orientation = H THEN
        begin
            repeat
                writeln('Entrez x');
                readln(x);
                IF (x + longueurBateau) <= TAILLEMAX THEN
                    writeln('Vous ne pouvez pas placer votre bateau ici, votre bateau est trop grand.');
            until ((x + longueurBateau)<= TAILLEMAX);
            writeln('Entrez y');
            readln(y);
        end;
        else
        begin
            writeln('Entrez x');
            readln(x);
            repeat
                writeln('Entrez y');
                readln(y);
                IF (y + longueurBateau) <= TAILLEMAX THEN
                    writeln('Vous ne pouvez pas placer votre bateau ici, votre bateau est trop grand.');
            until ((y + longueurBateau)<= TAILLEMAX);
        end;
        IF orientation = H THEN
        begin
            FOR nbCase := 1 TO longueur DO
            begin
                //x := x + (nbCase - 1);
                //creaCase(x,y,flottes,i,nbBateau);
            end;
        end;
        else
        begin
            FOR nbCase := 1 TO longueur DO
            begin
                //y := y + (nbCase - 1);
                //creaCase(x,y,flottes,i,nbBateau);
            end;
        end;
    END;


PROCEDURE creaFlotte (i : INTEGER; VAR flottes : ARRAY OF flotte);

    VAR
        nbBateau : INTEGER;     //indique quelle bateaux est selectionné

    BEGIN
        writeln('Joueur ', i, ', vous allez créer vos navires.');
        for nbBateau := 1 TO NBBATTEAUX do
        begin
            creaBateau(i,flottes,nbBateau);
        END;
    END;


VAR
    flottes : ARRAY [1..NBJOUEUR] OF flotte;
    i,j : INTEGER;

begin
    writeln('Bienvenue sur le jeu de le Bataille Navale !');
    FOR i := 1 TO NBJOUEUR DO
    begin
        creaFlotte(i)
    end;
end.
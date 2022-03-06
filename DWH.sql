CREATE TABLE permitType(
    [Permit Type]          INTEGER         PRIMARY KEY AUTOINCREMENT
                                      NOT NULL,

    [Permit Type Definition]       VARCHAR        NOT NULL
);

CREATE TABLE street (
    [ID]          INTEGER         PRIMARY KEY AUTOINCREMENT
                                      NOT NULL,

    [Street Name] VARCHAR NOT NULL,
    [Street Suffix] VARCHAR
);

CREATE TABLE numberStreet (
    [ID]          INTEGER         PRIMARY KEY AUTOINCREMENT
                                      NOT NULL,

    [Street Number] INTEGER NOT NULL,
    [Street Number Suffix] VARCHAR
);

CREATE TABLE pathTable (
    [ID]          INTEGER         PRIMARY KEY AUTOINCREMENT
                                      NOT NULL,

    [Street ID] INTEGER NOT NULL
                        REFERENCES street ([ID]),
    [Number ID] INTEGER NOT NULL
                        REFERENCES numberStreet ([ID]),
    [Lot] INTEGER,
    [Block] INTEGER
);

CREATE TABLE unit(
    [ID]          INTEGER         PRIMARY KEY AUTOINCREMENT
                                      NOT NULL,

    [Unit] INTEGER NOT NULL,
    [Unit Suffix]       VARCHAR        NOT NULL
);


CREATE TABLE unitEx(
    [Existing Units]          INTEGER         PRIMARY KEY AUTOINCREMENT
                                      NOT NULL,
    [Existing Use]       VARCHAR        NOT NULL
);

CREATE TABLE contEx(
    [Existing Construction Type]         INTEGER         PRIMARY KEY AUTOINCREMENT
                                      NOT NULL,
    [Existing Construction Type Description]       VARCHAR        NOT NULL
);

CREATE TABLE neib(
    [ID]         INTEGER         PRIMARY KEY AUTOINCREMENT
                                      NOT NULL,
    [Neighborhoods - Analysis Boundaries]       VARCHAR        NOT NULL,
    [Supervisor District] INTEGER,
    [Zipcode] INTEGER,
    [Location] VARCHAR
);


CREATE TABLE dateTable (
    [ID]          INTEGER         PRIMARY KEY AUTOINCREMENT
                                      NOT NULL,

    [Permit Creation Date]  DATE NOT NULL,

    [Current Status Date]  DATE NOT NULL,

    [Filed Date]   DATE,
    [Issued Date]   DATE,
    [Completed Date]  DATE,
     [First Construction Document Date]  DATE,
    [Permit Expiration Date]  DATE
);

CREATE TABLE permit_table (
    [Record ID]         INTEGER         PRIMARY KEY AUTOINCREMENT
                                      NOT NULL,
    [Permit Number] VARCHAR ,
    [Permit Type]     INTEGER        NOT NULL
                                      REFERENCES permitType ([Permit Type]),
    [DateID]       INTEGER        NOT NULL
                                     REFERENCES dateTable ([ID]),   
    [PathID]    INTEGER               NOT NULL
                                      REFERENCES pathTable ([ID]),
     [UnitID]    INTEGER              NOT NULL
                                      REFERENCES unit ([ID]),
    [Description]      VARCHAR ,
    [Current Status] VARCHAR ,
    [Structural Notification] VARCHAR (1),
    [Number of Existing Stories] INTEGER,
    [Number of Proposed Stories] INTEGER,
    [Voluntary Soft-Story Retrofit] VARCHAR (1),
    [Fire Only Permit] VARCHAR (1),
    [Estimated Cost] INTEGER,
    [Revised Cost] INTEGER,
    [Existing Units] INTEGER NOT NULL
                            REFERENCES unitEx([Existing Units]),
    [Proposed Units] INTEGER NOT NULL
                            REFERENCES unitEx([Existing Units]),
    [Plansets] INTEGER,
    [TIDF Compliance] VARCHAR (1),
    [Existing Construction Type] INTEGER NOT NULL
                            REFERENCES contEx([Existing Construction Type]),
    [Proposed Construction Type] INTEGER NOT NULL
                            REFERENCES contEx([Existing Construction Type]),
    [Site Permit] VARCHAR (1),
    [Neighborhoods - Analysis Boundaries] INTEGER NOT NULL
                            REFERENCES neib(ID)
);
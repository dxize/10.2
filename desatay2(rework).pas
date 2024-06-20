PROGRAM NormalString(INPUT, OUTPUT);
VAR
  COMPLETION, BRACKET, SKIPWR, SKIPRD, W1, W2, W3, W4, W5: CHAR; //SKIPWR = SKIP WRITE; SKIPRD = SKIP READ
BEGIN
  COMPLETION := ' ';
  BRACKET := ' ';
  SKIPWR := ' ';
  SKIPRD := ' ';
  W1 := ' ';
  W2 := ' ';
  W3 := ' ';
  W4 := ' ';
  W5 := ' ';
  WHILE NOT EOLN
  DO
    BEGIN
      IF COMPLETION <> '1'
      THEN
        BEGIN
          W1 := W2;
          W2 := W3;
          W3 := W4;
          W4 := W5
        END;  
      IF (COMPLETION <> '1') AND (SKIPRD <> '1')
      THEN
        READ(W5);
      IF SKIPRD <> '0'
      THEN
        SKIPRD := '0';
      IF (W5 <> ' ') AND (COMPLETION <> '1')
      THEN
        BEGIN
          IF W5 = 'E'
          THEN
            BEGIN
              W1 := W2;
              W2 := W3;
              W3 := W4;
              W4 := W5;
              READ(W5);
              IF W5 = 'N'
              THEN
                BEGIN
                  W1 := W2;
                  W2 := W3;
                  W3 := W4;
                  W4 := W5;
                  READ(W5);
                  IF W5 = 'D'
                  THEN
                    BEGIN
                      W1 := W2;
                      W2 := W3;
                      W3 := W4;
                      W4 := W5;
                      COMPLETION := '1';
                      SKIPRD := '0'
                    END  
                END
              ELSE
                BEGIN
                  WRITE(W4);
                  IF W5 <> ' '
                  THEN
                    WRITE(W5);
                  SKIPRD := '0'
                END  
            END
          ELSE
            BEGIN
              WRITE(W5);
              SKIPWR := '1';
              SKIPRD := '0'
            END  
        END;
      IF COMPLETION = '1'
      THEN
        BEGIN
          IF NOT EOLN
          THEN
            BEGIN
              READ(W5);
              IF W5 = '.'
              THEN
                BEGIN
                  WRITELN;
                  WRITE(W2, W3, W4, W5);
                  COMPLETION := '0'
                END;
              IF W5 = ';'
              THEN
                BEGIN
                  WRITELN;
                  WRITE(W2, W3, W4, W5);
                  COMPLETION := '0'
                END
            END    
          ELSE
            BEGIN    
              WRITELN;
              WRITE(W2, W3, W4);
              COMPLETION := '0'
            END  
        END;
      IF (W1 = 'B') AND (W2 = 'E') AND (W3 = 'G') AND (W4 = 'I') AND (W5 = 'N')
      THEN
        BEGIN
          WRITELN;
          WRITE('  ')
        END;
      IF W5 = '('
      THEN
        BRACKET := '1';
      IF (BRACKET = '1') AND (W5 <> ')')
      THEN
        BEGIN
          BRACKET := '0';
          WHILE (W5 <> ')') AND (NOT EOLN(INPUT))
          DO
            BEGIN
              READ(W5);
              WHILE W5 = ' '
              DO
                READ(W5);
              WHILE (W5 <> ' ') AND (W5 <> ',') AND (W5 <> ')') AND (NOT EOLN(INPUT))
              DO
                BEGIN
                  WRITE(W5);
                  READ(W5)
                END;
              IF W5 = ','
              THEN
                BEGIN
                  WRITE(W5);
                  WRITE(' ')
                END
              ELSE
                IF W5 <> ' '
                THEN
                  WRITE(W5)
            END  
        END;
      IF W5 = ')'
      THEN
        BEGIN
          READ(W5);
          IF W5 = ';'
          THEN
            SKIPWR := '0';
          SKIPRD := '1'
        END;  
      IF W5 = ';'
      THEN
        BEGIN
          SKIPRD := '0';
          IF SKIPWR <> '1'
          THEN
            WRITE(W5)
          ELSE
            SKIPWR := '0';
          WHILE (W5 = ';') AND (NOT EOLN(INPUT))
          DO
            BEGIN
              READ(W5);
              WHILE (W5 = ' ') AND (NOT EOLN(INPUT))
              DO
                READ(W5);
              IF W5 = ';'
              THEN
                WRITE(W5)
              ELSE
                IF W5 <> 'E'
                THEN
                  BEGIN 
                    IF W5 <> ' '
                    THEN
                      BEGIN
                        WRITELN;
                        WRITE('  ', W5)
                      END
                    ELSE
                      BEGIN
                         WHILE W5 = ' '
                         DO
                           READ(W5);
                         IF W5 = 'E'
                         THEN
                           SKIPRD := '1'
                         ELSE
                           BEGIN
                             WRITELN;
                             WRITE('  ', W5)
                           END;
                      END
                  END 
                ELSE
                  BEGIN
                    W1 := W2;
                    W2 := W3;
                    W3 := W4;
                    W4 := W5;
                    READ(W5);
                    IF W5 = 'N'
                    THEN
                      BEGIN
                        W1 := W2;
                        W2 := W3;
                        W3 := W4;
                        W4 := W5;
                        READ(W5);
                        IF W5 = 'D'
                        THEN
                          BEGIN
                            W1 := W2;
                            W2 := W3;
                            W3 := W4;
                            W4 := W5;
                            COMPLETION := '1'
                          END   
                      END
                    ELSE
                      BEGIN
                        WRITE(W4);
                        WRITE(W5)
                      END
                  END
            END   
        END
    END
END. 

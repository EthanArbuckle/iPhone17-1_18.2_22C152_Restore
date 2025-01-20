@interface NSScanner
+ (id)SQLParsingScannerWithSQL:(id)a3;
- (BOOL)_scanBalancedSubstringFromCharacter:(unsigned __int16)a3 appendToString:(id)a4;
- (BOOL)_scanSQLiteIdentifierCharactersIntoString:(id *)a3;
- (BOOL)_scanSQLiteIdentifierIntoString:(id *)a3;
- (BOOL)_scanTableSQLColumn:(id *)a3;
- (BOOL)_scanTableSQLConstraint:(id *)a3;
- (BOOL)_scanThroughQuoteWithDelimiter:(id)a3 appendToString:(id)a4;
- (BOOL)_scanUpToTopLevelDelimiters:(id)a3 intoString:(id *)a4;
- (BOOL)scanTableSQLColumns:(id *)a3 constraints:(id *)a4;
- (BOOL)scanTableSQLPreambleAndTableName:(id *)a3;
@end

@implementation NSScanner

+ (id)SQLParsingScannerWithSQL:(id)a3
{
  v3 = +[NSScanner scannerWithString:a3];
  [v3 setCaseSensitive:0];
  v4 = +[NSCharacterSet whitespaceAndNewlineCharacterSet];
  [v3 setCharactersToBeSkipped:v4];

  return v3;
}

- (BOOL)scanTableSQLPreambleAndTableName:(id *)a3
{
  if ([(NSScanner *)self scanString:@"CREATE" intoString:0]
    && [(NSScanner *)self scanString:@"TABLE" intoString:0])
  {
    id v10 = 0;
    unsigned int v5 = [(NSScanner *)self _scanSQLiteIdentifierIntoString:&v10];
    id v6 = v10;
    v7 = v6;
    if (v5)
    {
      sub_1003A63A4(v6);
      *a3 = (id)objc_claimAutoreleasedReturnValue();
      BOOL v8 = 1;
    }
    else
    {
      BOOL v8 = 0;
    }
  }
  else
  {
    BOOL v8 = 0;
    v7 = 0;
  }

  return v8;
}

- (BOOL)scanTableSQLColumns:(id *)a3 constraints:(id *)a4
{
  if (!-[NSScanner scanString:intoString:](self, "scanString:intoString:", @"("), 0)
    return 0;
  *a3 = +[NSMutableArray array];
  +[NSMutableArray array];
  id v7 = 0;
  *a4 = (id)objc_claimAutoreleasedReturnValue();
  do
  {
    BOOL v8 = v7;
    id v16 = v7;
    unsigned int v9 = [(NSScanner *)self _scanTableSQLColumn:&v16];
    id v7 = v16;

    if (!v9) {
      break;
    }
    [*a3 addObject:v7];
  }
  while ([(NSScanner *)self scanString:@"," intoString:0]);
  id v10 = 0;
  do
  {
    v11 = v10;
    id v15 = v10;
    unsigned int v12 = [(NSScanner *)self _scanTableSQLConstraint:&v15];
    id v10 = v15;

    if (!v12) {
      break;
    }
    [*a4 addObject:v10];
  }
  while ([(NSScanner *)self scanString:@"," intoString:0]);
  if ([*a3 count]
    && -[NSScanner scanString:intoString:](self, "scanString:intoString:", @""), 0))
  {
    BOOL v13 = [(NSScanner *)self isAtEnd];
  }
  else
  {
    BOOL v13 = 0;
  }

  return v13;
}

- (BOOL)_scanTableSQLColumn:(id *)a3
{
  NSUInteger v5 = [(NSScanner *)self scanLocation];
  id v20 = 0;
  unsigned int v6 = [(NSScanner *)self _scanSQLiteIdentifierIntoString:&v20];
  id v7 = v20;
  BOOL v8 = v7;
  if (!v6) {
    goto LABEL_5;
  }
  uint64_t v9 = qword_100808EE0;
  id v10 = v7;
  if (v9 != -1) {
    dispatch_once(&qword_100808EE0, &stru_10074D990);
  }
  v11 = (void *)qword_100808ED8;
  unsigned int v12 = [v10 uppercaseString];

  LODWORD(v11) = [v11 containsObject:v12];
  if (!v11)
  {
    v14 = objc_alloc_init(SQLiteTableColumn);
    id v15 = sub_1003A63A4(v10);
    [(SQLiteTableColumn *)v14 setName:v15];

    id v19 = 0;
    LODWORD(v15) = -[NSScanner _scanUpToTopLevelDelimiters:intoString:](self, "_scanUpToTopLevelDelimiters:intoString:", @","), &v19);
    id v16 = v19;
    if (v15) {
      [(SQLiteTableColumn *)v14 setQualifiers:v16];
    }
    v17 = v14;
    *a3 = v17;

    BOOL v13 = 1;
  }
  else
  {
LABEL_5:
    [(NSScanner *)self setScanLocation:v5];
    BOOL v13 = 0;
  }

  return v13;
}

- (BOOL)_scanTableSQLConstraint:(id *)a3
{
  return -[NSScanner _scanUpToTopLevelDelimiters:intoString:](self, "_scanUpToTopLevelDelimiters:intoString:", @","), a3);
}

- (BOOL)_scanSQLiteIdentifierIntoString:(id *)a3
{
  v4 = self;
  id v13 = 0;
  unsigned __int8 v5 = [(NSScanner *)self scanString:@"'" intoString:&v13];
  id v6 = v13;
  id v7 = v6;
  if (v5)
  {
    id v8 = v6;
  }
  else
  {
    id v12 = v6;
    unsigned int v9 = [(NSScanner *)v4 scanString:@"\"" intoString:&v12];
    id v8 = v12;

    if (!v9)
    {
      LOBYTE(v4) = [(NSScanner *)v4 _scanSQLiteIdentifierCharactersIntoString:a3];
      goto LABEL_8;
    }
  }
  id v10 = +[NSMutableString stringWithString:v8];
  LODWORD(v4) = [(NSScanner *)v4 _scanThroughQuoteWithDelimiter:v8 appendToString:v10];
  if (v4) {
    *a3 = v10;
  }

LABEL_8:
  return (char)v4;
}

- (BOOL)_scanSQLiteIdentifierCharactersIntoString:(id *)a3
{
  unsigned __int8 v5 = +[NSMutableCharacterSet alphanumericCharacterSet];
  [v5 addCharactersInString:@"_$"];
  LOBYTE(a3) = [(NSScanner *)self scanCharactersFromSet:v5 intoString:a3];

  return (char)a3;
}

- (BOOL)_scanUpToTopLevelDelimiters:(id)a3 intoString:(id *)a4
{
  id v6 = +[NSCharacterSet characterSetWithCharactersInString:a3];
  id v7 = +[NSMutableCharacterSet characterSetWithCharactersInString:](NSMutableCharacterSet, "characterSetWithCharactersInString:", @"\"'(");
  [v7 formUnionWithCharacterSet:v6];
  id v8 = +[NSMutableString string];
  id v18 = 0;
  unsigned int v9 = [(NSScanner *)self scanUpToCharactersFromSet:v7 intoString:&v18];
  id v10 = v18;
  if (v9) {
    [v8 appendString:v10];
  }
  if (![(NSScanner *)self isAtEnd])
  {
    while (1)
    {
      id v12 = [(NSScanner *)self string];
      id v13 = objc_msgSend(v12, "characterAtIndex:", -[NSScanner scanLocation](self, "scanLocation"));

      if ([v6 characterIsMember:v13]) {
        break;
      }
      [(NSScanner *)self _scanBalancedSubstringFromCharacter:v13 appendToString:v8];
      id v17 = v10;
      unsigned int v14 = [(NSScanner *)self scanUpToCharactersFromSet:v7 intoString:&v17];
      id v11 = v17;

      if (v14) {
        [v8 appendString:v11];
      }
      id v10 = v11;
      if ([(NSScanner *)self isAtEnd]) {
        goto LABEL_9;
      }
    }
  }
  id v11 = v10;
LABEL_9:
  id v15 = [v8 length];
  if (v15) {
    *a4 = v8;
  }

  return v15 != 0;
}

- (BOOL)_scanBalancedSubstringFromCharacter:(unsigned __int16)a3 appendToString:(id)a4
{
  unsigned __int16 v11 = a3;
  id v5 = a4;
  id v6 = +[NSString stringWithCharacters:&v11 length:1];
  [v5 appendString:v6];
  [(NSScanner *)self scanString:v6 intoString:0];
  if (v11 == 34 || v11 == 39)
  {
    LOBYTE(self) = [(NSScanner *)self _scanThroughQuoteWithDelimiter:v6 appendToString:v5];
  }
  else if (v11 == 40)
  {
    id v10 = 0;
    unsigned int v7 = -[NSScanner _scanUpToTopLevelDelimiters:intoString:](self, "_scanUpToTopLevelDelimiters:intoString:", @""), &v10);
    id v8 = v10;
    if (v7) {
      [v5 appendString:v8];
    }
    LODWORD(self) = -[NSScanner scanString:intoString:](self, "scanString:intoString:", @""), 0);
    if (self) {
      [v5 appendString:@""]);
    }
  }
  else
  {
    LOBYTE(self) = 0;
  }

  return (char)self;
}

- (BOOL)_scanThroughQuoteWithDelimiter:(id)a3 appendToString:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (![(NSScanner *)self isAtEnd])
  {
    do
    {
      id v12 = 0;
      unsigned int v8 = [(NSScanner *)self scanUpToString:v6 intoString:&v12];
      id v9 = v12;
      if (v8) {
        [v7 appendString:v9];
      }
      if ([(NSScanner *)self scanString:v6 intoString:0])
      {
        [v7 appendString:v6];
        if (![(NSScanner *)self scanString:v6 intoString:0])
        {

          BOOL v10 = 1;
          goto LABEL_9;
        }
        [v7 appendString:v6];
      }
    }
    while (![(NSScanner *)self isAtEnd]);
  }
  BOOL v10 = 0;
LABEL_9:

  return v10;
}

@end
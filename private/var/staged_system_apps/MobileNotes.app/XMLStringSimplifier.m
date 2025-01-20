@interface XMLStringSimplifier
+ (id)simplifiedStringFromString:(id)a3 isXML:(BOOL)a4;
- (id)simplifiedStringFromString:(id)a3 isXML:(BOOL)a4;
@end

@implementation XMLStringSimplifier

+ (id)simplifiedStringFromString:(id)a3 isXML:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  id v6 = objc_alloc_init((Class)objc_opt_class());
  v7 = [v6 simplifiedStringFromString:v5 isXML:v4];

  return v7;
}

- (id)simplifiedStringFromString:(id)a3 isXML:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  id v6 = [objc_alloc((Class)NSScanner) initWithString:v5];
  v7 = +[NSCharacterSet alphanumericCharacterSet];
  id v8 = [v7 mutableCopy];
  [v8 invert];
  id v9 = [v8 mutableCopy];
  v10 = v9;
  if (v4)
  {
    [v9 addCharactersInString:@"<"];
    [v8 removeCharactersInString:@"<"];
  }
  [v6 setCharactersToBeSkipped:0];
  v11 = +[NSMutableString string];
  if ([v5 length])
  {
    while (1)
    {
      if ([v6 isAtEnd])
      {
        id v18 = [v11 copy];
        goto LABEL_15;
      }
      id v12 = [v6 scanLocation];
      id v21 = 0;
      unsigned int v13 = [v6 scanUpToCharactersFromSet:v10 intoString:&v21];
      id v14 = v21;
      v15 = v14;
      if (v13 && [v14 length]) {
        [v11 appendString:v15];
      }
      if (([v6 isAtEnd] & 1) == 0)
      {
        v16 = [v6 string];
        v17 = objc_msgSend(v16, "substringWithRange:", objc_msgSend(v6, "scanLocation"), 1);

        LODWORD(v16) = [v17 isEqualToString:@"<"];
        if (v16)
        {
          [v6 scanUpToString:@">" intoString:0];
          [v6 scanString:@">" intoString:0];
        }
      }
      [v6 scanCharactersFromSet:v8 intoString:0];
      if ([v6 scanLocation] == v12) {
        break;
      }
    }
    NSLog(@"We didn't move at all in that iteration. That's not expected. Failing.");

    v19 = 0;
  }
  else
  {
    id v18 = v5;
LABEL_15:
    v19 = v18;
  }

  return v19;
}

@end
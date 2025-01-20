@interface NSString(CSVStringExtensions)
- (id)_copyCsvRows:()CSVStringExtensions usingDelimiter:columnCountIsConstant:;
- (void)copyCsvRows:()CSVStringExtensions;
@end

@implementation NSString(CSVStringExtensions)

- (id)_copyCsvRows:()CSVStringExtensions usingDelimiter:columnCountIsConstant:
{
  id v32 = a4;
  id v30 = objc_alloc_init(MEMORY[0x263EFF980]);
  *a3 = 0;
  *a5 = 1;
  v33 = [MEMORY[0x263F089C0] whitespaceAndNewlineCharacterSet];
  v8 = [MEMORY[0x263F08708] whitespaceCharacterSet];
  v9 = [v8 invertedSet];
  [v33 formIntersectionWithCharacterSet:v9];

  v10 = (void *)MEMORY[0x263F089C0];
  v11 = [NSString stringWithFormat:@"%@\"", v32];
  v12 = [v10 characterSetWithCharactersInString:v11];
  v31 = a3;
  v29 = a5;

  [v12 formUnionWithCharacterSet:v33];
  v13 = [MEMORY[0x263F08B08] scannerWithString:a1];
  [v13 setCharactersToBeSkipped:0];
  while (([v13 isAtEnd] & 1) == 0)
  {
    v14 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:10];
    id v15 = objc_alloc_init(MEMORY[0x263F089D8]);
    char v16 = 0;
    char v17 = 0;
    while ((v17 & 1) == 0)
    {
      v18 = (void *)MEMORY[0x23EC9A170]();
      id v35 = 0;
      int v19 = [v13 scanUpToCharactersFromSet:v12 intoString:&v35];
      id v20 = v35;
      if (v19) {
        [v15 appendString:v20];
      }
      if ([v13 isAtEnd])
      {
        [v14 addObject:v15];
        char v17 = 1;
        id v21 = v20;
        goto LABEL_23;
      }
      id v34 = v20;
      int v22 = [v13 scanCharactersFromSet:v33 intoString:&v34];
      id v21 = v34;

      if (v22)
      {
        id v23 = v21;
        if (v16) {
          goto LABEL_11;
        }
        [v14 addObject:v15];
        char v16 = 0;
        char v17 = 1;
      }
      else if ([v13 scanString:@"\"" intoString:0])
      {
        if ((v16 & 1) != 0 && [v13 scanString:@"\"" intoString:0])
        {
          [v15 appendString:@"\""];
          goto LABEL_12;
        }
        char v17 = 0;
        v16 ^= 1u;
      }
      else if ([v13 scanString:v32 intoString:0])
      {
        id v23 = v32;
        if (v16)
        {
LABEL_11:
          [v15 appendString:v23];
LABEL_12:
          char v17 = 0;
          char v16 = 1;
          goto LABEL_23;
        }
        [v14 addObject:v15];
        id v24 = objc_alloc_init(MEMORY[0x263F089D8]);

        v25 = [MEMORY[0x263F08708] whitespaceCharacterSet];
        [v13 scanCharactersFromSet:v25 intoString:0];

        char v16 = 0;
        char v17 = 0;
        id v15 = v24;
      }
      else
      {
        objc_msgSend(v13, "setScanLocation:", objc_msgSend(v13, "scanLocation") + 1);
        char v17 = 0;
      }
LABEL_23:
    }
    unint64_t v26 = [v14 count];
    if (v26)
    {
      [v30 addObject:v14];
      unint64_t v27 = *v31;
      if (*v31 && v26 != v27) {
        unsigned char *v29 = 0;
      }
      if (v26 > v27) {
        unint64_t *v31 = v26;
      }
    }
  }
  return v30;
}

- (void)copyCsvRows:()CSVStringExtensions
{
  char v14 = 0;
  v5 = (void *)[a1 _copyCsvRows:a3 usingDelimiter:@"," columnCountIsConstant:&v14];
  if (*a3 == 1 || v14 == 0)
  {
    unint64_t v13 = 0;
    char v12 = 0;
    v7 = (void *)[a1 _copyCsvRows:&v13 usingDelimiter:@";" columnCountIsConstant:&v12];
    v8 = v7;
    if (v13 >= 2 && v12 != 0)
    {
      id v10 = v7;

      *a3 = v13;
      v5 = v10;
    }
  }
  return v5;
}

@end
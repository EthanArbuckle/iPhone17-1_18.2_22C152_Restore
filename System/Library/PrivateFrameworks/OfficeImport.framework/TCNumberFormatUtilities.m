@interface TCNumberFormatUtilities
+ (id)cleanDateTimeFormatString:(id)a3 withMappings:(id)a4;
+ (id)cleanDateTimeSubstring:(id)a3 withMappings:(id)a4;
@end

@implementation TCNumberFormatUtilities

+ (id)cleanDateTimeFormatString:(id)a3 withMappings:(id)a4
{
  id v5 = a3;
  id v22 = a4;
  v6 = [MEMORY[0x263F089D8] string];
  if (v5)
  {
    char v7 = 0;
    char v8 = 0;
    while (1)
    {
      if (![v5 length])
      {
        v11 = v5;
        goto LABEL_32;
      }
      uint64_t v9 = [v5 rangeOfString:@"'"];
      uint64_t v10 = v9;
      if (!((v9 != 0) | v7 & 1)) {
        break;
      }
      if (v9 == 0x7FFFFFFFFFFFFFFFLL)
      {
        v11 = 0;
        v12 = v5;
        if ((v7 & 1) == 0) {
          goto LABEL_20;
        }
        goto LABEL_7;
      }
      if (!v9) {
        goto LABEL_24;
      }
      uint64_t v16 = [v5 substringToIndex:v9];
      v11 = [v5 substringFromIndex:v10 + 1];

      if (v16)
      {
        v12 = (void *)v16;
        if ((v7 & 1) == 0)
        {
LABEL_20:
          uint64_t v15 = [a1 cleanDateTimeSubstring:v12 withMappings:v22];
LABEL_21:
          v17 = v12;
          v18 = (void *)v15;

          if (!v18)
          {
            id v19 = 0;
            goto LABEL_33;
          }
          [v6 appendString:v18];
          if (v10 == 0x7FFFFFFFFFFFFFFFLL)
          {

            goto LABEL_32;
          }
          goto LABEL_26;
        }
LABEL_7:
        if ([v12 rangeOfString:@"\""] != 0x7FFFFFFFFFFFFFFFLL)
        {
          v13 = [MEMORY[0x263F089D8] stringWithString:v12];

          v12 = v13;
          objc_msgSend(v13, "replaceOccurrencesOfString:withString:options:range:", @"\", @"\"\", 2, 0, objc_msgSend(v13, "length"));
        }
        if (v8) {
          v14 = @"%@\"";
        }
        else {
          v14 = @"\"%@\"";
        }
        uint64_t v15 = objc_msgSend(NSString, "stringWithFormat:", v14, v12);
        goto LABEL_21;
      }
LABEL_25:
      v18 = 0;
LABEL_26:
      char v8 = 0;
      v7 ^= 1u;
      id v5 = v18;
LABEL_27:

      id v5 = v11;
      if (!v11) {
        goto LABEL_32;
      }
    }
    if ([v6 length])
    {
      if ((unint64_t)[v6 length] >= 2) {
        objc_msgSend(v6, "deleteCharactersInRange:", objc_msgSend(v6, "length") - 1, 1);
      }
      [v6 appendString:@"'"];
      char v7 = 1;
      v11 = [v5 substringFromIndex:1];
      char v8 = 1;
      goto LABEL_27;
    }
LABEL_24:
    v11 = [v5 substringFromIndex:1];

    goto LABEL_25;
  }
  v11 = 0;
LABEL_32:
  id v19 = v6;
LABEL_33:

  return v19;
}

+ (id)cleanDateTimeSubstring:(id)a3 withMappings:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (v5 && [v5 length])
  {
    if ([v5 rangeOfString:@"s:S"] != 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v7 = [v5 stringByReplacingOccurrencesOfString:@"s:S" withString:@"s.S"];

      id v5 = (id)v7;
    }
    v28 = [MEMORY[0x263F08708] characterSetWithCharactersInString:@"EMLdyYGDwFWhHKkmsSa"];
    v29 = [v28 invertedSet];
    char v8 = [MEMORY[0x263F089D8] string];
    if (v5)
    {
      while (1)
      {
        if (![v5 length]) {
          goto LABEL_28;
        }
        uint64_t v9 = [v5 rangeOfCharacterFromSet:v29];
        uint64_t v10 = v9;
        if (v9 == 0x7FFFFFFFFFFFFFFFLL) {
          break;
        }
        if (!v9)
        {
          uint64_t v11 = [v5 rangeOfCharacterFromSet:v28];
          if (v11 == 0x7FFFFFFFFFFFFFFFLL)
          {
            uint64_t v12 = 0;
          }
          else
          {
            uint64_t v22 = [v5 substringToIndex:v11];
            uint64_t v12 = [v5 substringFromIndex:v11];

            id v5 = (id)v22;
          }
          v23 = [MEMORY[0x263F08708] characterSetWithCharactersInString:@" ,.-:<>/"];
          v24 = [v23 invertedSet];

          if ([v5 rangeOfCharacterFromSet:v24] != 0x7FFFFFFFFFFFFFFFLL)
          {
            uint64_t v25 = [NSString stringWithFormat:@"\"%@\"", v5];

            id v5 = (id)v25;
          }
          [v8 appendString:v5];

          goto LABEL_26;
        }
        uint64_t v13 = [v5 substringToIndex:v9];
        uint64_t v12 = [v5 substringFromIndex:v10];

        if (v13) {
          goto LABEL_13;
        }
LABEL_27:
        id v5 = (id)v12;
        if (!v12) {
          goto LABEL_28;
        }
      }
      uint64_t v12 = 0;
      uint64_t v13 = (uint64_t)v5;
LABEL_13:
      id v5 = (id)v13;
      while ([v5 length])
      {
        v14 = (void *)MEMORY[0x263F08708];
        uint64_t v15 = [v5 substringToIndex:1];
        uint64_t v16 = [v14 characterSetWithCharactersInString:v15];
        v17 = [v16 invertedSet];

        uint64_t v18 = [v5 rangeOfCharacterFromSet:v17];
        if (v18 == 0x7FFFFFFFFFFFFFFFLL)
        {
          id v19 = 0;
        }
        else
        {
          uint64_t v20 = [v5 substringToIndex:v18];
          id v19 = [v5 substringFromIndex:v18];

          id v5 = (id)v20;
        }
        v21 = [v6 objectForKey:v5];
        if (!v21 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {

          id v26 = 0;
          id v5 = (id)v12;
          goto LABEL_31;
        }
        [v8 appendString:v21];

        id v5 = v19;
        if (!v19) {
          break;
        }
      }
LABEL_26:

      goto LABEL_27;
    }
LABEL_28:
    id v26 = v8;
LABEL_31:
  }
  else
  {
    id v26 = 0;
  }

  return v26;
}

@end
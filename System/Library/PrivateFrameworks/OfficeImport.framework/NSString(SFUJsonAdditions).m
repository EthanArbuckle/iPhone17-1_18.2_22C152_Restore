@interface NSString(SFUJsonAdditions)
- (uint64_t)sfu_appendJsonStringToString:()SFUJsonAdditions;
@end

@implementation NSString(SFUJsonAdditions)

- (uint64_t)sfu_appendJsonStringToString:()SFUJsonAdditions
{
  if (sfu_appendJsonStringToString__onceToken != -1) {
    dispatch_once(&sfu_appendJsonStringToString__onceToken, &__block_literal_global_15);
  }
  [a3 appendString:@"\""];
  if ([a1 rangeOfCharacterFromSet:sfu_appendJsonStringToString__escapeCharacters] != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v5 = [a1 length];
    v6 = (unsigned __int16 *)malloc_type_malloc(2 * v5, 0x1000040BDFB0063uLL);
    [a1 getCharacters:v6];
    if (!v5)
    {
LABEL_28:
      free(v6);
      return [a3 appendString:@"\""];
    }
    v7 = v6;
    while (1)
    {
      int v9 = *v7++;
      uint64_t v8 = v9;
      __int16 v14 = v9;
      if (v9 <= 33)
      {
        switch((int)v8)
        {
          case 8:
            v10 = a3;
            v11 = @"\\b";
            break;
          case 9:
            v10 = a3;
            v11 = @"\\t";
            break;
          case 10:
            v10 = a3;
            v11 = @"\\n";
            break;
          case 12:
            v10 = a3;
            v11 = @"\\f";
            break;
          case 13:
            v10 = a3;
            v11 = @"\\r";
            break;
          default:
            goto LABEL_23;
        }
        goto LABEL_27;
      }
      if ((int)v8 > 8231)
      {
        if (v8 == 8232)
        {
          v10 = a3;
          v11 = @"\\u2028";
        }
        else
        {
          if (v8 != 8233)
          {
LABEL_23:
            if (v8 < 0x20) {
              uint64_t v12 = objc_msgSend(NSString, "stringWithFormat:", @"\\u%.4x", v8);
            }
            else {
              uint64_t v12 = [NSString stringWithCharacters:&v14 length:1];
            }
            v11 = (__CFString *)v12;
            v10 = a3;
            goto LABEL_27;
          }
          v10 = a3;
          v11 = @"\\u2029";
        }
      }
      else if (v8 == 34)
      {
        v10 = a3;
        v11 = @"\\\"";
      }
      else
      {
        if (v8 != 92) {
          goto LABEL_23;
        }
        v10 = a3;
        v11 = @"\\\\"";
      }
LABEL_27:
      [v10 appendString:v11];
      if (!--v5) {
        goto LABEL_28;
      }
    }
  }
  [a3 appendString:a1];
  return [a3 appendString:@"\""];
}

@end
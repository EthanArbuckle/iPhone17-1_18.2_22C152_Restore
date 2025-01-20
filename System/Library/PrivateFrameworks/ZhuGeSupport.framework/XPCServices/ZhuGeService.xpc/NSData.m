@interface NSData
+ (id)dataFromHexString:(id)a3;
@end

@implementation NSData

+ (id)dataFromHexString:(id)a3
{
  id v3 = a3;
  __str[2] = 0;
  char v18 = 0;
  if ([v3 length]
    && (id v4 = [v3 length], v4 == (id)((unint64_t)objc_msgSend(v3, "length") & 0xFFFFFFFFFFFFFFFELL)))
  {
    id v5 = objc_alloc_init((Class)NSMutableData);
    unint64_t v6 = (unint64_t)[v3 length];
    if (v6 >= 2)
    {
      uint64_t v7 = 0;
      unint64_t v8 = v6 >> 1;
      while (2)
      {
        __str[0] = [v3 characterAtIndex:2 * v7];
        char v9 = 1;
        unsigned __int8 v10 = [v3 characterAtIndex:(2 * v7) | 1];
        uint64_t v11 = 0;
        __str[1] = v10;
        do
        {
          int v12 = __str[v11];
          unsigned int v13 = __str[v11];
          BOOL v14 = v12 >= 48 && v13 - 58 >= 7;
          if (!v14 || (v13 <= 0x66 ? (BOOL v15 = v13 - 71 > 0x19) : (BOOL v15 = 0), !v15))
          {

            goto LABEL_20;
          }
          char v16 = v9;
          char v9 = 0;
          uint64_t v11 = 1;
        }
        while ((v16 & 1) != 0);
        char v18 = strtol(__str, 0, 16);
        [v5 appendBytes:&v18 length:1];
        if (++v7 != v8) {
          continue;
        }
        break;
      }
    }
  }
  else
  {
LABEL_20:
    id v5 = 0;
  }

  return v5;
}

@end
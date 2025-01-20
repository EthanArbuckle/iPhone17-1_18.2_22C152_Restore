@interface PXISOFormatter
+ (id)stringForObjectValue:(id)a3;
- (BOOL)getObjectValue:(id *)a3 forString:(id)a4 range:(_NSRange *)a5 error:(id *)a6;
- (id)stringForObjectValue:(id)a3;
@end

@implementation PXISOFormatter

+ (id)stringForObjectValue:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v4 = [v3 integerValue];
      objc_msgSend(NSString, "stringWithFormat:", @"ISO %ld", v4);
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = 0;
    }
  }
  else
  {
    v5 = &stru_1F00B0030;
  }

  return v5;
}

- (BOOL)getObjectValue:(id *)a3 forString:(id)a4 range:(_NSRange *)a5 error:(id *)a6
{
  id v8 = a4;
  uint64_t v14 = 0;
  if ([v8 length])
  {
    v9 = [MEMORY[0x1E4F28FE8] scannerWithString:v8];
    [v9 scanString:@"ISO" intoString:0];
    int v10 = [v9 scanInteger:&v14];

    if (!v10)
    {
      if (!a6)
      {
        BOOL v12 = 0;
        goto LABEL_11;
      }
      v11 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:2048 userInfo:0];
      BOOL v12 = 0;
      a3 = a6;
      goto LABEL_8;
    }
  }
  else
  {
    uint64_t v14 = 0;
  }
  if (!a3)
  {
    BOOL v12 = 1;
    goto LABEL_11;
  }
  v11 = [NSNumber numberWithInteger:v14];
  BOOL v12 = 1;
LABEL_8:
  *a3 = v11;
LABEL_11:

  return v12;
}

- (id)stringForObjectValue:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [(id)objc_opt_class() stringForObjectValue:v3];

  return v4;
}

@end
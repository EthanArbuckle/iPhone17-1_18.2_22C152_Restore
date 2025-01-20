@interface PXShutterSpeedFormatter
+ (id)stringForObjectValue:(id)a3;
- (BOOL)getObjectValue:(id *)a3 forString:(id)a4 range:(_NSRange *)a5 error:(id *)a6;
- (id)stringForObjectValue:(id)a3;
@end

@implementation PXShutterSpeedFormatter

+ (id)stringForObjectValue:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v3 doubleValue];
      if (v4 > 0.0 && v4 < 0.5) {
        objc_msgSend(NSString, "stringWithFormat:", @"1/%ld s", llround(1.0 / v4));
      }
      else {
        objc_msgSend(NSString, "stringWithFormat:", @"%0.1f s", *(void *)&v4);
      }
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = 0;
    }
  }
  else
  {
    v6 = &stru_1F00B0030;
  }

  return v6;
}

- (BOOL)getObjectValue:(id *)a3 forString:(id)a4 range:(_NSRange *)a5 error:(id *)a6
{
  id v8 = a4;
  double v16 = 0.0;
  if ([v8 length])
  {
    uint64_t v14 = 0;
    uint64_t v15 = 0;
    v9 = [MEMORY[0x1E4F28FE8] scannerWithString:v8];
    if ([v9 scanInteger:&v15]
      && [v9 scanString:@"/" intoString:0]
      && [v9 scanInteger:&v14]
      && v14)
    {
      double v16 = (double)v15 / (double)v14;
    }
    else
    {
      [v9 setScanLocation:0];
      int v10 = [v9 scanDouble:&v16];

      if (!v10)
      {
        if (!a6)
        {
          BOOL v12 = 0;
          goto LABEL_16;
        }
        v11 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:2048 userInfo:0];
        BOOL v12 = 0;
        a3 = a6;
        goto LABEL_13;
      }
    }
  }
  else
  {
    double v16 = 0.0;
  }
  if (!a3)
  {
    BOOL v12 = 1;
    goto LABEL_16;
  }
  v11 = [NSNumber numberWithDouble:v16];
  BOOL v12 = 1;
LABEL_13:
  *a3 = v11;
LABEL_16:

  return v12;
}

- (id)stringForObjectValue:(id)a3
{
  id v3 = a3;
  double v4 = [(id)objc_opt_class() stringForObjectValue:v3];

  return v4;
}

@end
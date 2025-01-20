@interface PXApertureFormatter
+ (id)stringForObjectValue:(id)a3;
- (BOOL)getObjectValue:(id *)a3 forString:(id)a4 range:(_NSRange *)a5 error:(id *)a6;
- (id)stringForObjectValue:(id)a3;
@end

@implementation PXApertureFormatter

+ (id)stringForObjectValue:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v3 doubleValue];
      if (v4 - floor(v4) == 0.0) {
        v5 = @"ƒ/%0.0f";
      }
      else {
        v5 = @"ƒ/%0.4g";
      }
      objc_msgSend(NSString, "stringWithFormat:", v5, *(void *)&v4);
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
  double v14 = 0.0;
  if (![v8 length])
  {
    double v14 = 0.0;
    goto LABEL_8;
  }
  v9 = [MEMORY[0x1E4F28FE8] scannerWithString:v8];
  if ([v9 scanDouble:&v14])
  {

    goto LABEL_8;
  }
  if (([v9 scanString:@"ƒ/" intoString:0] & 1) == 0
    && ([v9 scanString:@"f/" intoString:0] & 1) == 0)
  {

    goto LABEL_12;
  }
  int v10 = [v9 scanDouble:&v14];

  if (!v10)
  {
LABEL_12:
    if (!a6)
    {
      BOOL v12 = 0;
      goto LABEL_15;
    }
    v11 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:2048 userInfo:0];
    BOOL v12 = 0;
    a3 = a6;
    goto LABEL_14;
  }
LABEL_8:
  if (a3)
  {
    v11 = [NSNumber numberWithDouble:v14];
    BOOL v12 = 1;
LABEL_14:
    *a3 = v11;
    goto LABEL_15;
  }
  BOOL v12 = 1;
LABEL_15:

  return v12;
}

- (id)stringForObjectValue:(id)a3
{
  id v3 = a3;
  double v4 = [(id)objc_opt_class() stringForObjectValue:v3];

  return v4;
}

@end
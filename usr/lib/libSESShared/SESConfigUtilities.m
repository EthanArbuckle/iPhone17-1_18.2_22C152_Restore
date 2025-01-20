@interface SESConfigUtilities
+ (float)getVersion:(id)a3 error:(id *)a4;
+ (id)validateKey:(id)a3 expectedClass:(Class)a4 dictionary:(id)a5;
@end

@implementation SESConfigUtilities

+ (float)getVersion:(id)a3 error:(id *)a4
{
  id v5 = a3;
  [v5 floatValue];
  float v7 = v6;
  if (a4 && v6 == 0.0)
  {
    v8 = SESDefaultLogObject();
    SESCreateAndLogError(0, v8, SESErrorDomain, 1, @"Invalid version from string %@", v9, v10, v11, (uint64_t)v5);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v7;
}

+ (id)validateKey:(id)a3 expectedClass:(Class)a4 dictionary:(id)a5
{
  id v6 = a3;
  float v7 = [a5 objectForKeyedSubscript:v6];
  if (v7)
  {
    if (objc_opt_isKindOfClass())
    {
      v8 = 0;
      goto LABEL_7;
    }
    uint64_t v9 = SESDefaultLogObject();
    SESCreateAndLogError(0, v9, SESErrorDomain, 1, @"Wrong class for key %@", v13, v14, v15, (uint64_t)v6);
  }
  else
  {
    uint64_t v9 = SESDefaultLogObject();
    SESCreateAndLogError(0, v9, SESErrorDomain, 4, @"Missing key %@", v10, v11, v12, (uint64_t)v6);
  v8 = };

LABEL_7:

  return v8;
}

@end
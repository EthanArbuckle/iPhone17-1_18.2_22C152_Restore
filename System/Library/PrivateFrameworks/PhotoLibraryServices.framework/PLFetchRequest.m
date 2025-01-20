@interface PLFetchRequest
+ (id)pl_importantFetchNameForFetchRequest:(id)a3;
- (NSString)pl_importantFetchName;
- (void)setPl_importantFetchName:(id)a3;
@end

@implementation PLFetchRequest

+ (id)pl_importantFetchNameForFetchRequest:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  id v4 = v3;
  if (objc_opt_isKindOfClass()) {
    v5 = v4;
  }
  else {
    v5 = 0;
  }
  id v6 = v5;

  if (v6)
  {
    v7 = objc_msgSend(v6, "pl_importantFetchName");
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void).cxx_destruct
{
}

- (void)setPl_importantFetchName:(id)a3
{
}

- (NSString)pl_importantFetchName
{
  return (NSString *)objc_getProperty(self, a2, 112, 1);
}

@end
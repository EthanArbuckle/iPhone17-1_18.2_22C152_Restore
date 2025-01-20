@interface CKShareSystemFieldsTransformer
+ (Class)transformedValueClass;
- (id)reverseTransformedValue:(id)a3;
@end

@implementation CKShareSystemFieldsTransformer

+ (Class)transformedValueClass
{
  return (Class)objc_opt_class();
}

- (id)reverseTransformedValue:(id)a3
{
  if (a3)
  {
    id v3 = a3;
    id v9 = 0;
    id v4 = [objc_alloc((Class)NSKeyedUnarchiver) initForReadingFromData:v3 error:&v9];

    id v5 = v9;
    if (v5)
    {
      v6 = +[REMLog cloudkit];
      if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
        sub_10074F1F4((uint64_t)v5, v6);
      }
    }
    id v7 = [objc_alloc((Class)CKShare) initWithCoder:v4];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

@end
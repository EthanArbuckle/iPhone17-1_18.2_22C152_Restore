@interface CKRecordSystemFieldsTransformer
+ (Class)transformedValueClass;
- (id)reverseTransformedValue:(id)a3;
- (id)transformedValue:(id)a3;
@end

@implementation CKRecordSystemFieldsTransformer

+ (Class)transformedValueClass
{
  return (Class)objc_opt_class();
}

- (id)transformedValue:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  v4 = REMDynamicCast();

  if (v4)
  {
    id v5 = [objc_alloc((Class)NSKeyedArchiver) initRequiringSecureCoding:1];
    [v4 encodeSystemFieldsWithCoder:v5];
    [v5 finishEncoding];
    v6 = [v5 encodedData];
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)reverseTransformedValue:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  v4 = REMDynamicCast();

  if (v4)
  {
    id v12 = 0;
    id v5 = [objc_alloc((Class)NSKeyedUnarchiver) initForReadingFromData:v4 error:&v12];
    id v6 = v12;
    v7 = v6;
    if (v5) {
      BOOL v8 = v6 == 0;
    }
    else {
      BOOL v8 = 0;
    }
    if (v8)
    {
      id v10 = [objc_alloc((Class)CKRecord) initWithCoder:v5];
    }
    else
    {
      v9 = +[REMLog cloudkit];
      if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
        sub_10074F138((uint64_t)v7, v9);
      }

      id v10 = 0;
    }
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

@end
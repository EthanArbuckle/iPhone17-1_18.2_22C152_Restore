@interface TRIPBValue
+ (id)mlr_listValueWithNSArray:(id)a3;
+ (id)mlr_valueWithBoolValue:(BOOL)a3;
+ (id)mlr_valueWithNullValue;
+ (id)mlr_valueWithObject:(id)a3;
@end

@implementation TRIPBValue

+ (id)mlr_listValueWithNSArray:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new();
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        v11 = [v4 valuesArray];
        v12 = +[TRIPBValue mlr_valueWithObject:v10];
        [v11 addObject:v12];
      }
      id v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  return v4;
}

+ (id)mlr_valueWithObject:(id)a3
{
  id v4 = a3;
  id v5 = objc_opt_new();
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v5 setStringValue:v4];
    goto LABEL_12;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v4 doubleValue];
    [v5 setNumberValue:];
    goto LABEL_12;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = +[TRIPBStruct mlr_structWithDictionary:v4];
    [v5 setStructValue:v6];
LABEL_9:

    goto LABEL_12;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = [a1 mlr_listValueWithNSArray:v4];
    [v5 setListValue:v6];
    goto LABEL_9;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v9 = +[NSString stringWithFormat:@"obj=%@", v4, NSLocalizedDescriptionKey];
    v13 = v9;
    uint64_t v10 = +[NSDictionary dictionaryWithObjects:&v13 forKeys:&v12 count:1];
    id v11 = +[NSException exceptionWithName:NSInvalidArgumentException reason:@"Unexpected type in obj" userInfo:v10];

    objc_exception_throw(v11);
  }
  id v7 = v4;

  id v5 = v7;
LABEL_12:

  return v5;
}

+ (id)mlr_valueWithBoolValue:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = objc_opt_new();
  [v4 setBoolValue:v3];

  return v4;
}

+ (id)mlr_valueWithNullValue
{
  v2 = objc_opt_new();
  [v2 setNullValue:0];

  return v2;
}

@end
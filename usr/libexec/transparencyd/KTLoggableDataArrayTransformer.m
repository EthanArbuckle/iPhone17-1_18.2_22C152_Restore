@interface KTLoggableDataArrayTransformer
+ (BOOL)allowsReverseTransformation;
+ (Class)transformedValueClass;
+ (id)name;
+ (void)registerTransformer;
- (id)allowedTopLevelClasses;
- (id)reverseTransformedValue:(id)a3;
- (id)transformedValue:(id)a3;
@end

@implementation KTLoggableDataArrayTransformer

- (id)allowedTopLevelClasses
{
  uint64_t v4 = objc_opt_class();
  v2 = +[NSArray arrayWithObjects:&v4 count:1];

  return v2;
}

+ (id)name
{
  return @"KTLoggableDataArrayTransformer";
}

+ (void)registerTransformer
{
  v3 = objc_alloc_init(KTLoggableDataArrayTransformer);
  v2 = +[KTLoggableDataArrayTransformer name];
  +[NSValueTransformer setValueTransformer:v3 forName:v2];
}

+ (BOOL)allowsReverseTransformation
{
  return 1;
}

+ (Class)transformedValueClass
{
  return (Class)objc_opt_class();
}

- (id)transformedValue:(id)a3
{
  id v3 = a3;
  id v8 = 0;
  uint64_t v4 = +[NSKeyedUnarchiver unarchivedObjectOfClass:objc_opt_class() fromData:v3 error:&v8];

  id v5 = v8;
  if (v5)
  {
    if (qword_10032EFD8 != -1) {
      dispatch_once(&qword_10032EFD8, &stru_1002C5A58);
    }
    v6 = qword_10032EFE0;
    if (os_log_type_enabled((os_log_t)qword_10032EFE0, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v10 = v5;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "failed to transform from data to KTLoggableDataArray: %@", buf, 0xCu);
    }
  }

  return v4;
}

- (id)reverseTransformedValue:(id)a3
{
  id v7 = 0;
  id v3 = +[NSKeyedArchiver archivedDataWithRootObject:a3 requiringSecureCoding:1 error:&v7];
  id v4 = v7;
  if (v4)
  {
    if (qword_10032EFD8 != -1) {
      dispatch_once(&qword_10032EFD8, &stru_1002C5A78);
    }
    id v5 = qword_10032EFE0;
    if (os_log_type_enabled((os_log_t)qword_10032EFE0, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v9 = v4;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "failed to transform from KTLoggableDataArray to data: %@", buf, 0xCu);
    }
  }

  return v3;
}

@end
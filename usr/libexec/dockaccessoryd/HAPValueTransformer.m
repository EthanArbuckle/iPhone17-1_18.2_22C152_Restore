@interface HAPValueTransformer
+ (Class)expectedClassForFormat:(unint64_t)a3;
+ (Class)expectedTransformedClassForFormat:(unint64_t)a3;
- (id)reverseTransformedValue:(id)a3 format:(unint64_t)a4 error:(id *)a5;
- (id)transformedValue:(id)a3 format:(unint64_t)a4 error:(id *)a5;
@end

@implementation HAPValueTransformer

+ (Class)expectedClassForFormat:(unint64_t)a3
{
  if (a3 - 1 > 0xE)
  {
    v4 = 0;
  }
  else
  {
    v4 = objc_opt_class();
  }
  return (Class)v4;
}

+ (Class)expectedTransformedClassForFormat:(unint64_t)a3
{
  return +[HAPValueTransformer expectedClassForFormat:a3];
}

- (id)transformedValue:(id)a3 format:(unint64_t)a4 error:(id *)a5
{
  id v7 = a3;
  if (v7
    && (id v8 = [(id)objc_opt_class() expectedClassForFormat:a4], (objc_opt_isKindOfClass() & 1) == 0))
  {
    v10 = +[NSString stringWithFormat:@"Value class, %@, is not of the expected class %@", objc_opt_class(), v8];
    v11 = sub_100083F74();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = sub_100083FD0(0);
      *(_DWORD *)buf = 138543618;
      v18 = v12;
      __int16 v19 = 2112;
      v20 = v10;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%{public}@[HAPValueTransformer] %@", buf, 0x16u);
    }
    if (a5)
    {
      NSErrorUserInfoKey v15 = NSLocalizedDescriptionKey;
      v16 = v10;
      v13 = +[NSDictionary dictionaryWithObjects:&v16 forKeys:&v15 count:1];
      *a5 = +[NSError errorWithDomain:@"HAPErrorDomain" code:-6756 userInfo:v13];
    }
    id v9 = 0;
  }
  else
  {
    id v9 = v7;
  }

  return v9;
}

- (id)reverseTransformedValue:(id)a3 format:(unint64_t)a4 error:(id *)a5
{
  id v7 = a3;
  if (v7
    && (id v8 = [(id)objc_opt_class() expectedTransformedClassForFormat:a4],
        (objc_opt_isKindOfClass() & 1) == 0))
  {
    v10 = +[NSString stringWithFormat:@"Value class, %@, is not of the expected class %@", objc_opt_class(), v8];
    v11 = sub_100083F74();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = sub_100083FD0(0);
      *(_DWORD *)buf = 138543618;
      v18 = v12;
      __int16 v19 = 2112;
      v20 = v10;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%{public}@[HAPValueTransformer] %@", buf, 0x16u);
    }
    if (a5)
    {
      NSErrorUserInfoKey v15 = NSLocalizedDescriptionKey;
      v16 = v10;
      v13 = +[NSDictionary dictionaryWithObjects:&v16 forKeys:&v15 count:1];
      *a5 = +[NSError errorWithDomain:@"HAPErrorDomain" code:-6756 userInfo:v13];
    }
    id v9 = 0;
  }
  else
  {
    id v9 = v7;
  }

  return v9;
}

@end
@interface DMDFetchDevicePropertiesOperation
+ (BOOL)validateRequest:(id)a3 error:(id *)a4;
+ (id)requiredEntitlements;
+ (id)whitelistedClassesForRequest;
- (void)runWithRequest:(id)a3;
@end

@implementation DMDFetchDevicePropertiesOperation

+ (id)whitelistedClassesForRequest
{
  uint64_t v2 = objc_opt_class();

  return +[NSSet setWithObject:v2];
}

+ (id)requiredEntitlements
{
  return &off_1000D2D20;
}

- (void)runWithRequest:(id)a3
{
  id v4 = a3;
  v5 = +[DMDDeviceController shared];
  v6 = [v4 propertyKeys];
  v7 = +[NSSet setWithArray:v6];
  id v16 = [v5 deviceWithKeys:v7];

  v8 = [v4 propertyKeys];

  v9 = [v16 dictionaryWithValuesForKeys:v8];
  id v10 = [v9 mutableCopy];

  v11 = +[NSNull null];
  v12 = [v10 allKeysForObject:v11];

  [v10 removeObjectsForKeys:v12];
  id v13 = objc_alloc((Class)DMFFetchDevicePropertiesResultObject);
  v14 = [v16 errorsForKeys];
  id v15 = [v13 initWithValuesByPropertyKey:v10 errorsByPropertyKey:v14];
  [(DMDFetchDevicePropertiesOperation *)self endOperationWithResultObject:v15];
}

+ (BOOL)validateRequest:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v10.receiver = a1;
  v10.super_class = (Class)&OBJC_METACLASS___DMDFetchDevicePropertiesOperation;
  if (!objc_msgSendSuper2(&v10, "validateRequest:error:", v6, a4)) {
    goto LABEL_6;
  }
  v7 = [v6 propertyKeys];

  if (!v7)
  {
    if (!a4) {
      goto LABEL_7;
    }
    uint64_t v11 = DMFInvalidParameterErrorKey;
    CFStringRef v12 = @"request.propertyKeys";
    v8 = +[NSDictionary dictionaryWithObjects:&v12 forKeys:&v11 count:1];
    DMFErrorWithCodeAndUserInfo();
    *a4 = (id)objc_claimAutoreleasedReturnValue();

LABEL_6:
    LOBYTE(a4) = 0;
    goto LABEL_7;
  }
  LOBYTE(a4) = 1;
LABEL_7:

  return (char)a4;
}

@end
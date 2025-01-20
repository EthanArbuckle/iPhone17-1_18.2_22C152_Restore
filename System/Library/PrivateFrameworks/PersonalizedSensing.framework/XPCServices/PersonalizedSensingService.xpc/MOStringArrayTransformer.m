@interface MOStringArrayTransformer
+ (BOOL)allowsReverseTransformation;
+ (Class)transformedValueClass;
- (id)reverseTransformedValue:(id)a3;
- (id)transformedValue:(id)a3;
@end

@implementation MOStringArrayTransformer

+ (Class)transformedValueClass
{
  return (Class)objc_opt_class();
}

+ (BOOL)allowsReverseTransformation
{
  return 1;
}

- (id)transformedValue:(id)a3
{
  id v3 = a3;
  if (!v3) {
    goto LABEL_8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v4 = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      -[MOStringArrayTransformer transformedValue:]();
    }
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = objc_opt_new();
    v6 = [v3 componentsJoinedByString:&stru_1000B50E8];
    v7 = [v6 dataUsingEncoding:4];
    [v5 appendData:v7];

    v8 = +[NSData dataWithData:v5];
  }
  else
  {
LABEL_8:
    v8 = 0;
  }

  return v8;
}

- (id)reverseTransformedValue:(id)a3
{
  id v3 = a3;
  if (!v3) {
    goto LABEL_9;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v4 = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      -[MOStringArrayTransformer reverseTransformedValue:]();
    }
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = [objc_alloc((Class)NSString) initWithData:v3 encoding:4];
    if ([v5 length])
    {
      v6 = [v5 componentsSeparatedByString:&stru_1000B50E8];
    }
    else
    {
      v6 = &__NSArray0__struct;
    }
  }
  else
  {
LABEL_9:
    v6 = 0;
  }

  return v6;
}

- (void)transformedValue:.cold.1()
{
  OUTLINED_FUNCTION_0_0();
  int v2 = 32;
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "Object is not of array type (in %s:%d)", v1, 0x12u);
}

- (void)reverseTransformedValue:.cold.1()
{
  OUTLINED_FUNCTION_0_0();
  int v2 = 49;
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "Object is not of data type (in %s:%d)", v1, 0x12u);
}

@end
@interface MODictionaryTransformer
+ (BOOL)allowsReverseTransformation;
+ (Class)transformedValueClass;
- (id)reverseTransformedValue:(id)a3;
- (id)transformedValue:(id)a3;
@end

@implementation MODictionaryTransformer

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
  id v5 = a3;
  if (!v5) {
    goto LABEL_8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v6 = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[MODictionaryTransformer transformedValue:]();
    }

    v7 = +[NSAssertionHandler currentHandler];
    [v7 handleFailureInMethod:a2 object:self file:@"MODictionaryTransformer.m" lineNumber:33 description:@"Object is not of dictionary type (in %s:%d)"];
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v8 = +[MODictionaryEncoder encodeDictionary:v5];
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
  id v5 = a3;
  if (!v5) {
    goto LABEL_8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v6 = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[MODictionaryTransformer reverseTransformedValue:]();
    }

    v7 = +[NSAssertionHandler currentHandler];
    [v7 handleFailureInMethod:a2 object:self file:@"MODictionaryTransformer.m" lineNumber:48 description:@"Object is not of data type (in %s:%d)", "-[MODictionaryTransformer reverseTransformedValue:]", 48];
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v8 = +[MODictionaryEncoder decodeToDictionary:v5];
  }
  else
  {
LABEL_8:
    v8 = 0;
  }

  return v8;
}

- (void)transformedValue:.cold.1()
{
  OUTLINED_FUNCTION_0_5();
  int v2 = 33;
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "Object is not of dictionary type (in %s:%d)", v1, 0x12u);
}

- (void)reverseTransformedValue:.cold.1()
{
  OUTLINED_FUNCTION_0_5();
  int v2 = 48;
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "Object is not of data type (in %s:%d)", v1, 0x12u);
}

@end
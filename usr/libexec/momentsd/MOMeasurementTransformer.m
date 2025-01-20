@interface MOMeasurementTransformer
+ (BOOL)allowsReverseTransformation;
+ (Class)transformedValueClass;
- (id)reverseTransformedValue:(id)a3;
- (id)transformedValue:(id)a3;
@end

@implementation MOMeasurementTransformer

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
      -[MOMeasurementTransformer transformedValue:]();
    }

    v7 = +[NSAssertionHandler currentHandler];
    [v7 handleFailureInMethod:a2 object:self file:@"MOMeasurementTransformer.m" lineNumber:30 description:@"Object is not of NSMeasurement (in %s:%d)", "-[MOMeasurementTransformer transformedValue:]", 30];
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v8 = +[NSKeyedArchiver archivedDataWithRootObject:v5 requiringSecureCoding:1 error:0];
    v9 = +[NSData dataWithData:v8];
  }
  else
  {
LABEL_8:
    v9 = 0;
  }

  return v9;
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
      -[MOMeasurementTransformer reverseTransformedValue:]();
    }

    v7 = +[NSAssertionHandler currentHandler];
    [v7 handleFailureInMethod:a2 object:self file:@"MOMeasurementTransformer.m" lineNumber:48 description:@"Object is not of data type (in %s:%d)", "-[MOMeasurementTransformer reverseTransformedValue:]", 48];
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v8 = +[NSKeyedUnarchiver unarchivedObjectOfClass:objc_opt_class() fromData:v5 error:0];
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
  int v2 = 30;
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "Object is not of NSMeasurement (in %s:%d)", v1, 0x12u);
}

- (void)reverseTransformedValue:.cold.1()
{
  OUTLINED_FUNCTION_0_5();
  int v2 = 48;
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "Object is not of data type (in %s:%d)", v1, 0x12u);
}

@end
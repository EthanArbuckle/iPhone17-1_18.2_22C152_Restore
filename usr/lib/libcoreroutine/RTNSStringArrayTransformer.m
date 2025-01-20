@interface RTNSStringArrayTransformer
+ (BOOL)allowsReverseTransformation;
+ (Class)transformedValueClass;
- (id)reverseTransformedValue:(id)a3;
- (id)transformedValue:(id)a3;
@end

@implementation RTNSStringArrayTransformer

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
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (!v3) {
    goto LABEL_8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v4 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v10 = 136315394;
      v11 = "-[RTNSStringArrayTransformer transformedValue:]";
      __int16 v12 = 1024;
      int v13 = 37;
      _os_log_error_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_ERROR, "Object is not of array type (in %s:%d)", (uint8_t *)&v10, 0x12u);
    }
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = objc_opt_new();
    v6 = [v3 componentsJoinedByString:&stru_1F3403328];
    v7 = [v6 dataUsingEncoding:4];
    [v5 appendData:v7];

    v8 = [MEMORY[0x1E4F1C9B8] dataWithData:v5];
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
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (!v3) {
    goto LABEL_9;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v4 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v8 = 136315394;
      v9 = "-[RTNSStringArrayTransformer reverseTransformedValue:]";
      __int16 v10 = 1024;
      int v11 = 54;
      _os_log_error_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_ERROR, "Object is not of data type (in %s:%d)", (uint8_t *)&v8, 0x12u);
    }
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = (void *)[[NSString alloc] initWithData:v3 encoding:4];
    if ([v5 length])
    {
      v6 = [v5 componentsSeparatedByString:&stru_1F3403328];
    }
    else
    {
      v6 = (void *)MEMORY[0x1E4F1CBF0];
    }
  }
  else
  {
LABEL_9:
    v6 = 0;
  }

  return v6;
}

@end
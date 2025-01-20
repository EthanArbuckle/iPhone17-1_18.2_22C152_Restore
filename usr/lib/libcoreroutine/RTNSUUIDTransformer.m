@interface RTNSUUIDTransformer
+ (BOOL)allowsReverseTransformation;
+ (Class)transformedValueClass;
- (id)reverseTransformedValue:(id)a3;
- (id)transformedValue:(id)a3;
@end

@implementation RTNSUUIDTransformer

- (id)reverseTransformedValue:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v4 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v8 = 136315394;
      v9 = "-[RTNSUUIDTransformer reverseTransformedValue:]";
      __int16 v10 = 1024;
      int v11 = 41;
      _os_log_error_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_ERROR, "Object is not of data type (in %s:%d)", (uint8_t *)&v8, 0x12u);
    }
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v3;
    if ([v5 bytes]) {
      v6 = [objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDBytes:[v5 bytes]];
    }
    else {
      v6 = 0;
    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)transformedValue:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v4 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v7 = 136315394;
      *(void *)&v7[4] = "-[RTNSUUIDTransformer transformedValue:]";
      *(_WORD *)&v7[12] = 1024;
      *(_DWORD *)&v7[14] = 27;
      _os_log_error_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_ERROR, "Object is not of UUID type (in %s:%d)", v7, 0x12u);
    }
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    *(void *)v7 = 0;
    *(void *)&v7[8] = 0;
    [v3 getUUIDBytes:v7];
    id v5 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v7 length:16];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

+ (Class)transformedValueClass
{
  return (Class)objc_opt_class();
}

+ (BOOL)allowsReverseTransformation
{
  return 1;
}

@end
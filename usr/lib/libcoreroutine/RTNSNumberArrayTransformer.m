@interface RTNSNumberArrayTransformer
+ (BOOL)allowsReverseTransformation;
+ (Class)transformedValueClass;
- (id)reverseTransformedValue:(id)a3;
- (id)transformedValue:(id)a3;
@end

@implementation RTNSNumberArrayTransformer

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
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v3 = (char *)a3;
  if (!v3) {
    goto LABEL_10;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v4 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v12 = "-[RTNSNumberArrayTransformer transformedValue:]";
      __int16 v13 = 1024;
      LODWORD(v14) = 34;
      _os_log_error_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_ERROR, "Object is not of array type (in %s:%d)", buf, 0x12u);
    }
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v10 = 0;
    v5 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v3 requiringSecureCoding:1 error:&v10];
    id v6 = v10;
    if (v6 || !v5)
    {
      v8 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v12 = v3;
        __int16 v13 = 2112;
        id v14 = v6;
        _os_log_error_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_ERROR, "failed number array serialization, value, %@, error, %@", buf, 0x16u);
      }

      id v7 = 0;
    }
    else
    {
      id v7 = v5;
    }
  }
  else
  {
LABEL_10:
    id v7 = 0;
  }

  return v7;
}

- (id)reverseTransformedValue:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v3 = (char *)a3;
  if (!v3) {
    goto LABEL_10;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v4 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v15 = "-[RTNSNumberArrayTransformer reverseTransformedValue:]";
      __int16 v16 = 1024;
      LODWORD(v17) = 61;
      _os_log_error_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_ERROR, "Object is not of data type (in %s:%d)", buf, 0x12u);
    }
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v6 = objc_opt_class();
    id v7 = [v5 setWithObjects:v6, objc_opt_class(), nil];
    id v13 = 0;
    v8 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClasses:v7 fromData:v3 error:&v13];
    id v9 = v13;
    if (v9 || !v8)
    {
      v11 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412546;
        uint64_t v15 = v3;
        __int16 v16 = 2112;
        id v17 = v9;
        _os_log_debug_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_DEBUG, "failed number array deserialization, value, %@, error, %@", buf, 0x16u);
      }

      id v10 = 0;
    }
    else
    {
      id v10 = v8;
    }
  }
  else
  {
LABEL_10:
    id v10 = 0;
  }

  return v10;
}

@end
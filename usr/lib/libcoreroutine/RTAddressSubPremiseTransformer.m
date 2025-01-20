@interface RTAddressSubPremiseTransformer
+ (BOOL)allowsReverseTransformation;
+ (Class)transformedValueClass;
- (id)reverseTransformedValue:(id)a3;
- (id)transformedValue:(id)a3;
@end

@implementation RTAddressSubPremiseTransformer

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
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (!v3) {
    goto LABEL_27;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v4 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      *(void *)&buf[4] = "-[RTAddressSubPremiseTransformer transformedValue:]";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 45;
      _os_log_error_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_ERROR, "Object is not of array type (in %s:%d)", buf, 0x12u);
    }
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v23 = v3;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    id v5 = v3;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v30 objects:v37 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v31;
      while (2)
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v31 != v8) {
            objc_enumerationMutation(v5);
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            v10 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
            if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136315394;
              *(void *)&buf[4] = "-[RTAddressSubPremiseTransformer transformedValue:]";
              *(_WORD *)&buf[12] = 1024;
              *(_DWORD *)&buf[14] = 53;
              _os_log_error_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_ERROR, "Object is not of RTAddressSubPremise type (in %s:%d)", buf, 0x12u);
            }
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {

            v11 = 0;
            goto LABEL_29;
          }
          ++v9;
        }
        while (v7 != v9);
        uint64_t v7 = [v5 countByEnumeratingWithState:&v30 objects:v37 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }

    *(void *)buf = 3735928559;
    *(_OWORD *)&buf[16] = 0u;
    long long v36 = 0u;
    *(void *)&buf[8] = [v5 count];
    v11 = objc_opt_new();
    [v11 appendBytes:buf length:48];
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v12 = v5;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v26 objects:v34 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v27;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v27 != v15) {
            objc_enumerationMutation(v12);
          }
          v17 = *(void **)(*((void *)&v26 + 1) + 8 * i);
          v18 = (void *)MEMORY[0x1E016D870]();
          v19 = [v17 subPremise];
          v20 = [v19 dataUsingEncoding:4];

          uint64_t v25 = 0;
          uint64_t v21 = [v17 subPremiseType];
          uint64_t v24 = 0;
          uint64_t v25 = v21;
          uint64_t v24 = [v20 length] + 16;
          [v11 appendBytes:&v24 length:8];
          [v11 appendBytes:&v25 length:8];
          [v11 appendData:v20];
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v26 objects:v34 count:16];
      }
      while (v14);
    }

LABEL_29:
    id v3 = v23;
  }
  else
  {
LABEL_27:
    v11 = 0;
  }

  return v11;
}

- (id)reverseTransformedValue:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (!v3) {
    goto LABEL_14;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v4 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      *(void *)&buf[4] = "-[RTAddressSubPremiseTransformer reverseTransformedValue:]";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 90;
      _os_log_error_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_ERROR, "Object is not of data type (in %s:%d)", buf, 0x12u);
    }
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v3;
    *(void *)buf = 3735928559;
    *(_OWORD *)&buf[8] = 0u;
    long long v19 = 0u;
    uint64_t v20 = 0;
    [v5 getBytes:buf length:48];
    uint64_t v6 = 0;
    if (*(void *)buf == 3735928559)
    {
      id v7 = objc_alloc(MEMORY[0x1E4F1CA48]);
      uint64_t v6 = (void *)[v7 initWithCapacity:*(void *)&buf[8]];
      if (*(void *)&buf[8])
      {
        unint64_t v8 = 0;
        uint64_t v9 = 48;
        do
        {
          v10 = (void *)MEMORY[0x1E016D870]();
          uint64_t v17 = 0;
          [v5 getBytes:&v17 range:v9];
          uint64_t v16 = 0;
          [v5 getBytes:&v16 range:v9 + 8, 8];
          v11 = [v5 subdataWithRange:NSMakeRange(v9 + 16, v17 - 16)];
          id v12 = (void *)[[NSString alloc] initWithData:v11 encoding:4];
          id v13 = objc_alloc(MEMORY[0x1E4F5CD88]);
          uint64_t v14 = (void *)[v13 initWithSubPremise:v12 subPremiseType:v16];
          if (v14) {
            [v6 addObject:v14];
          }
          v9 += v17;

          ++v8;
        }
        while (*(void *)&buf[8] > v8);
      }
    }
  }
  else
  {
LABEL_14:
    uint64_t v6 = 0;
  }

  return v6;
}

@end
@interface TIAnalyticsStringFieldSpec
- (BOOL)validate:(id)a3 error:(id *)a4;
- (NSArray)allowedValues;
- (TIAnalyticsStringFieldSpec)initWithName:(id)a3 allowedValues:(id)a4;
@end

@implementation TIAnalyticsStringFieldSpec

- (void).cxx_destruct
{
}

- (NSArray)allowedValues
{
  return self->_allowedValues;
}

- (BOOL)validate:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (v6)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if ([v6 length])
      {
        uint64_t v7 = [(TIAnalyticsStringFieldSpec *)self allowedValues];
        if (!v7
          || (v8 = (void *)v7,
              [(TIAnalyticsStringFieldSpec *)self allowedValues],
              v9 = objc_claimAutoreleasedReturnValue(),
              char v10 = [v9 containsObject:v6],
              v9,
              v8,
              (v10 & 1) != 0))
        {
          id v11 = 0;
          goto LABEL_15;
        }
        v12 = [(TIAnalyticsFieldSpec *)self name];
        [(TIAnalyticsFieldSpec *)self errorFromValue:v6, 13, @"Field '%@' must be one of the allowed values.", v12 code message];
      }
      else
      {
        v12 = [(TIAnalyticsFieldSpec *)self name];
        [(TIAnalyticsFieldSpec *)self errorFromValue:v6, 12, @"Field '%@' cannot be an empty string.", v12 code message];
      }
    }
    else
    {
      v12 = [(TIAnalyticsFieldSpec *)self name];
      [(TIAnalyticsFieldSpec *)self errorFromValue:v6, 10, @"Field '%@' must be a string.", v12 code message];
    }
    id v11 = (id)objc_claimAutoreleasedReturnValue();

    if (!a4) {
      goto LABEL_15;
    }
  }
  else
  {
    id v11 = [(TIAnalyticsFieldSpec *)self errorFromNil];
    if (!a4) {
      goto LABEL_15;
    }
  }
  if (v11)
  {
    id v11 = v11;
    *a4 = v11;
  }
LABEL_15:

  return v11 == 0;
}

- (TIAnalyticsStringFieldSpec)initWithName:(id)a3 allowedValues:(id)a4
{
  id v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)TIAnalyticsStringFieldSpec;
  uint64_t v7 = [(TIAnalyticsFieldSpec *)&v10 initWithName:a3];
  if (v7)
  {
    if (v6) {
      v8 = (void *)[objc_alloc(MEMORY[0x1E4F1C978]) initWithArray:v6 copyItems:1];
    }
    else {
      v8 = 0;
    }
    objc_storeStrong((id *)&v7->_allowedValues, v8);
    if (v6) {
  }
    }
  return v7;
}

@end
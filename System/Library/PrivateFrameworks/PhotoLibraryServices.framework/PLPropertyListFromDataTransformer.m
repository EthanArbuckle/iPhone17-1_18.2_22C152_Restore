@interface PLPropertyListFromDataTransformer
+ (BOOL)allowsReverseTransformation;
+ (Class)transformedValueClass;
- (id)reverseTransformedValue:(id)a3;
- (id)transformedValue:(id)a3;
@end

@implementation PLPropertyListFromDataTransformer

- (id)reverseTransformedValue:(id)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v6 = 0;
    v4 = [MEMORY[0x1E4F28F98] propertyListWithData:v3 options:0 format:0 error:&v6];
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)transformedValue:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (v3)
  {
    id v8 = 0;
    v4 = [MEMORY[0x1E4F28F98] dataWithPropertyList:v3 format:200 options:0 error:&v8];
    id v5 = v8;
    if (!v4)
    {
      uint64_t v6 = PLBackendGetLog();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v10 = v5;
        _os_log_impl(&dword_19B3C7000, v6, OS_LOG_TYPE_ERROR, "Unable to convert property list: %@", buf, 0xCu);
      }
    }
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (BOOL)allowsReverseTransformation
{
  return 1;
}

+ (Class)transformedValueClass
{
  return (Class)objc_opt_class();
}

@end
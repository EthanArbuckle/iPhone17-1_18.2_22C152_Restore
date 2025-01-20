@interface KTNSErrorValueTransformer
+ (BOOL)allowsReverseTransformation;
+ (Class)transformedValueClass;
+ (id)name;
+ (void)registerTransformer;
- (id)allowedTopLevelClasses;
- (id)reverseTransformedValue:(id)a3;
- (id)transformedValue:(id)a3;
@end

@implementation KTNSErrorValueTransformer

- (id)allowedTopLevelClasses
{
  v4[1] = *MEMORY[0x263EF8340];
  v4[0] = objc_opt_class();
  v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:1];

  return v2;
}

+ (id)name
{
  return @"KTNSErrorValueTransformer";
}

+ (void)registerTransformer
{
  v2 = (void *)MEMORY[0x263F08D50];
  v4 = objc_alloc_init(KTNSErrorValueTransformer);
  v3 = +[KTNSErrorValueTransformer name];
  [v2 setValueTransformer:v4 forName:v3];
}

+ (BOOL)allowsReverseTransformation
{
  return 1;
}

+ (Class)transformedValueClass
{
  return (Class)objc_opt_class();
}

- (id)transformedValue:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  v3 = (void *)MEMORY[0x263F08928];
  id v4 = a3;
  id v9 = 0;
  v5 = [v3 unarchivedObjectOfClass:objc_opt_class() fromData:v4 error:&v9];

  id v6 = v9;
  if (v6)
  {
    if (TRANSPARENCY_DEFAULT_LOG_BLOCK_11 != -1) {
      dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_11, &__block_literal_global_13);
    }
    v7 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_11;
    if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v11 = v6;
      _os_log_impl(&dword_226345000, v7, OS_LOG_TYPE_ERROR, "failed to transform from data to NSError: %@", buf, 0xCu);
    }
  }

  return v5;
}

uint64_t __46__KTNSErrorValueTransformer_transformedValue___block_invoke()
{
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_11 = (uint64_t)os_log_create("com.apple.Transparency", "default");

  return MEMORY[0x270F9A758]();
}

- (id)reverseTransformedValue:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = [MEMORY[0x263F16D80] cleanseErrorForXPC:v3];

    v5 = +[TransparencyError truncateUnderlyingErrorDepth:v4 maxDepth:10];

    id v10 = 0;
    id v6 = [MEMORY[0x263F08910] archivedDataWithRootObject:v5 requiringSecureCoding:1 error:&v10];
    id v7 = v10;
    if (!v6)
    {
      if (TRANSPARENCY_DEFAULT_LOG_BLOCK_11 != -1) {
        dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_11, &__block_literal_global_118_1);
      }
      v8 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_11;
      if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_11, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v12 = v7;
        _os_log_impl(&dword_226345000, v8, OS_LOG_TYPE_ERROR, "failed to transform from NSError to data: %@", buf, 0xCu);
      }
    }
  }
  else
  {
    id v6 = 0;
    v5 = v3;
  }

  return v6;
}

uint64_t __53__KTNSErrorValueTransformer_reverseTransformedValue___block_invoke()
{
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_11 = (uint64_t)os_log_create("com.apple.Transparency", "default");

  return MEMORY[0x270F9A758]();
}

@end
@interface NSValueTransformer(MTLPredefinedTransformerAdditions)
+ (id)mtl_BOOLeanValueTransformer;
+ (id)mtl_JSONArrayTransformerWithModelClass:()MTLPredefinedTransformerAdditions;
+ (id)mtl_JSONDictionaryTransformerWithModelClass:()MTLPredefinedTransformerAdditions;
+ (id)mtl_URLValueTransformer;
+ (id)mtl_UUIDValueTransformer;
+ (id)mtl_arrayMappingTransformerWithTransformer:()MTLPredefinedTransformerAdditions;
+ (id)mtl_dateTransformerWithDateFormat:()MTLPredefinedTransformerAdditions calendar:locale:timeZone:defaultDate:;
+ (id)mtl_numberTransformerWithNumberStyle:()MTLPredefinedTransformerAdditions locale:;
+ (id)mtl_transformerWithFormatter:()MTLPredefinedTransformerAdditions forObjectClass:;
+ (id)mtl_validatingTransformerForClass:()MTLPredefinedTransformerAdditions;
+ (id)mtl_valueMappingTransformerWithDictionary:()MTLPredefinedTransformerAdditions defaultValue:reverseDefaultValue:;
+ (uint64_t)mtl_dateTransformerWithDateFormat:()MTLPredefinedTransformerAdditions locale:;
+ (uint64_t)mtl_valueMappingTransformerWithDictionary:()MTLPredefinedTransformerAdditions;
@end

@implementation NSValueTransformer(MTLPredefinedTransformerAdditions)

+ (id)mtl_JSONArrayTransformerWithModelClass:()MTLPredefinedTransformerAdditions
{
  return +[MTLJSONAdapter arrayTransformerWithModelClass:](MTLJSONAdapter, "arrayTransformerWithModelClass:");
}

+ (id)mtl_JSONDictionaryTransformerWithModelClass:()MTLPredefinedTransformerAdditions
{
  return +[MTLJSONAdapter dictionaryTransformerWithModelClass:](MTLJSONAdapter, "dictionaryTransformerWithModelClass:");
}

+ (id)mtl_transformerWithFormatter:()MTLPredefinedTransformerAdditions forObjectClass:
{
  id v7 = a3;
  if (v7)
  {
    if (a4) {
      goto LABEL_3;
    }
  }
  else
  {
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, a1, @"NSValueTransformer+MTLPredefinedTransformerAdditions.m", 360, @"Invalid parameter not satisfying: %@", @"formatter != nil" object file lineNumber description];

    if (a4) {
      goto LABEL_3;
    }
  }
  v12 = [MEMORY[0x1E4F28B00] currentHandler];
  [v12 handleFailureInMethod:a2, a1, @"NSValueTransformer+MTLPredefinedTransformerAdditions.m", 361, @"Invalid parameter not satisfying: %@", @"objectClass != nil" object file lineNumber description];

LABEL_3:
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __101__NSValueTransformer_MTLPredefinedTransformerAdditions__mtl_transformerWithFormatter_forObjectClass___block_invoke;
  v16[3] = &unk_1E6556568;
  uint64_t v18 = a4;
  id v17 = v7;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __101__NSValueTransformer_MTLPredefinedTransformerAdditions__mtl_transformerWithFormatter_forObjectClass___block_invoke_2;
  v13[3] = &unk_1E6556590;
  id v14 = v17;
  uint64_t v15 = a4;
  id v8 = v17;
  v9 = +[MTLValueTransformer transformerUsingForwardBlock:v16 reverseBlock:v13];

  return v9;
}

+ (id)mtl_numberTransformerWithNumberStyle:()MTLPredefinedTransformerAdditions locale:
{
  v6 = (objc_class *)MEMORY[0x1E4F28EE0];
  id v7 = a4;
  id v8 = objc_alloc_init(v6);
  [v8 setNumberStyle:a3];
  [v8 setLocale:v7];

  v9 = objc_msgSend(a1, "mtl_transformerWithFormatter:forObjectClass:", v8, objc_opt_class());

  return v9;
}

+ (uint64_t)mtl_dateTransformerWithDateFormat:()MTLPredefinedTransformerAdditions locale:
{
  return objc_msgSend(a1, "mtl_dateTransformerWithDateFormat:calendar:locale:timeZone:defaultDate:", a3, 0, a4, 0, 0);
}

+ (id)mtl_dateTransformerWithDateFormat:()MTLPredefinedTransformerAdditions calendar:locale:timeZone:defaultDate:
{
  id v13 = a7;
  id v14 = a6;
  id v15 = a5;
  id v16 = a4;
  id v17 = a3;
  if (![v17 length])
  {
    v21 = [MEMORY[0x1E4F28B00] currentHandler];
    [v21 handleFailureInMethod:a2, a1, @"NSValueTransformer+MTLPredefinedTransformerAdditions.m", 334, @"Invalid parameter not satisfying: %@", @"dateFormat.length" object file lineNumber description];
  }
  id v18 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  [v18 setDateFormat:v17];

  [v18 setCalendar:v16];
  [v18 setLocale:v15];

  [v18 setTimeZone:v14];
  [v18 setDefaultDate:v13];

  v19 = objc_msgSend(MEMORY[0x1E4F29248], "mtl_transformerWithFormatter:forObjectClass:", v18, objc_opt_class());

  return v19;
}

+ (uint64_t)mtl_valueMappingTransformerWithDictionary:()MTLPredefinedTransformerAdditions
{
  return objc_msgSend(a1, "mtl_valueMappingTransformerWithDictionary:defaultValue:reverseDefaultValue:", a3, 0, 0);
}

+ (id)mtl_valueMappingTransformerWithDictionary:()MTLPredefinedTransformerAdditions defaultValue:reverseDefaultValue:
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (!v9)
  {
    v22 = [MEMORY[0x1E4F28B00] currentHandler];
    [v22 handleFailureInMethod:a2, a1, @"NSValueTransformer+MTLPredefinedTransformerAdditions.m", 309, @"Invalid parameter not satisfying: %@", @"dictionary != nil" object file lineNumber description];
  }
  uint64_t v12 = [v9 count];
  id v13 = (void *)MEMORY[0x1E4F1CAD0];
  id v14 = [v9 allValues];
  id v15 = [v13 setWithArray:v14];
  uint64_t v16 = [v15 count];

  if (v12 != v16)
  {
    v23 = [MEMORY[0x1E4F28B00] currentHandler];
    [v23 handleFailureInMethod:a2, a1, @"NSValueTransformer+MTLPredefinedTransformerAdditions.m", 310, @"Invalid parameter not satisfying: %@", @"dictionary.count == [[NSSet setWithArray:dictionary.allValues] count]" object file lineNumber description];
  }
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __132__NSValueTransformer_MTLPredefinedTransformerAdditions__mtl_valueMappingTransformerWithDictionary_defaultValue_reverseDefaultValue___block_invoke;
  v27[3] = &unk_1E65564F0;
  id v28 = v9;
  id v29 = v10;
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __132__NSValueTransformer_MTLPredefinedTransformerAdditions__mtl_valueMappingTransformerWithDictionary_defaultValue_reverseDefaultValue___block_invoke_2;
  v24[3] = &unk_1E6556540;
  id v25 = v28;
  id v26 = v11;
  id v17 = v11;
  id v18 = v28;
  id v19 = v10;
  v20 = +[MTLValueTransformer transformerUsingForwardBlock:v27 reverseBlock:v24];

  return v20;
}

+ (id)mtl_validatingTransformerForClass:()MTLPredefinedTransformerAdditions
{
  if (!a3)
  {
    id v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, a1, @"NSValueTransformer+MTLPredefinedTransformerAdditions.m", 287, @"Invalid parameter not satisfying: %@", @"modelClass != nil" object file lineNumber description];
  }
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __91__NSValueTransformer_MTLPredefinedTransformerAdditions__mtl_validatingTransformerForClass___block_invoke;
  v9[3] = &__block_descriptor_40_e16__32__0_8_B16__24lu32l8;
  v9[4] = a3;
  v4 = +[MTLValueTransformer transformerUsingForwardBlock:v9];
  return v4;
}

+ (id)mtl_arrayMappingTransformerWithTransformer:()MTLPredefinedTransformerAdditions
{
  id v5 = a3;
  if (!v5)
  {
    id v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, a1, @"NSValueTransformer+MTLPredefinedTransformerAdditions.m", 162, @"Invalid parameter not satisfying: %@", @"transformer != nil" object file lineNumber description];
  }
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __100__NSValueTransformer_MTLPredefinedTransformerAdditions__mtl_arrayMappingTransformerWithTransformer___block_invoke;
  aBlock[3] = &unk_1E6557238;
  id v6 = v5;
  id v15 = v6;
  id v7 = _Block_copy(aBlock);
  if ([(id)objc_opt_class() allowsReverseTransformation]
    && (v12[0] = MEMORY[0x1E4F143A8],
        v12[1] = 3221225472,
        v12[2] = __100__NSValueTransformer_MTLPredefinedTransformerAdditions__mtl_arrayMappingTransformerWithTransformer___block_invoke_2,
        v12[3] = &unk_1E6557238,
        id v13 = v6,
        id v8 = _Block_copy(v12),
        v13,
        v8))
  {
    id v9 = +[MTLValueTransformer transformerUsingForwardBlock:v7 reverseBlock:v8];
  }
  else
  {
    id v9 = +[MTLValueTransformer transformerUsingForwardBlock:v7];
  }

  return v9;
}

+ (id)mtl_BOOLeanValueTransformer
{
  if (mtl_BOOLeanValueTransformer_onceToken != -1) {
    dispatch_once(&mtl_BOOLeanValueTransformer_onceToken, &__block_literal_global_49);
  }
  v0 = (void *)mtl_BOOLeanValueTransformer_BOOLeanValueTransformer;
  return v0;
}

+ (id)mtl_UUIDValueTransformer
{
  if (mtl_UUIDValueTransformer_onceToken != -1) {
    dispatch_once(&mtl_UUIDValueTransformer_onceToken, &__block_literal_global_29);
  }
  v0 = (void *)mtl_UUIDValueTransformer_UUIDValueTransformer;
  return v0;
}

+ (id)mtl_URLValueTransformer
{
  if (mtl_URLValueTransformer_onceToken != -1) {
    dispatch_once(&mtl_URLValueTransformer_onceToken, &__block_literal_global_59691);
  }
  v0 = (void *)mtl_URLValueTransformer_URLValueTransformer;
  return v0;
}

@end
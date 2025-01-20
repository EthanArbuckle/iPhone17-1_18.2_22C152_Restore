@interface NSArray(PKEnhancedMerchantAdditions)
- (id)deepCopyWithZone:()PKEnhancedMerchantAdditions;
- (id)jsonString;
- (id)nonZeroUnsignedLongLongSetValue;
- (id)stringSetValue;
- (uint64_t)nonZeroUnsignedLongLongArrayValue;
- (uint64_t)stringArrayValue;
@end

@implementation NSArray(PKEnhancedMerchantAdditions)

- (id)jsonString
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v7 = 0;
  v1 = [MEMORY[0x1E4F28D90] dataWithJSONObject:a1 options:0 error:&v7];
  id v2 = v7;
  if (v2) {
    BOOL v3 = 1;
  }
  else {
    BOOL v3 = v1 == 0;
  }
  if (v3)
  {
    v4 = PKLogFacilityTypeGetObject(0xEuLL);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v9 = v2;
      _os_log_impl(&dword_190E10000, v4, OS_LOG_TYPE_DEFAULT, "Error serializing to JSON: %@", buf, 0xCu);
    }

    v5 = 0;
  }
  else
  {
    v5 = (void *)[[NSString alloc] initWithData:v1 encoding:4];
  }

  return v5;
}

- (id)deepCopyWithZone:()PKEnhancedMerchantAdditions
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __57__NSArray_PKEnhancedMerchantAdditions__deepCopyWithZone___block_invoke;
  v5[3] = &__block_descriptor_40_e8__16__0_8l;
  v5[4] = a3;
  BOOL v3 = objc_msgSend(a1, "pk_arrayBySafelyApplyingBlock:", v5);
  return v3;
}

- (uint64_t)nonZeroUnsignedLongLongArrayValue
{
  return objc_msgSend(a1, "pk_arrayBySafelyApplyingBlock:", &__block_literal_global_358_0);
}

- (id)nonZeroUnsignedLongLongSetValue
{
  v1 = [a1 nonZeroUnsignedLongLongArrayValue];
  if (v1)
  {
    id v2 = [MEMORY[0x1E4F1CAD0] setWithArray:v1];
  }
  else
  {
    id v2 = 0;
  }

  return v2;
}

- (uint64_t)stringArrayValue
{
  return objc_msgSend(a1, "pk_arrayBySafelyApplyingBlock:", &__block_literal_global_360_0);
}

- (id)stringSetValue
{
  v1 = [a1 stringArrayValue];
  if (v1)
  {
    id v2 = [MEMORY[0x1E4F1CAD0] setWithArray:v1];
  }
  else
  {
    id v2 = 0;
  }

  return v2;
}

@end
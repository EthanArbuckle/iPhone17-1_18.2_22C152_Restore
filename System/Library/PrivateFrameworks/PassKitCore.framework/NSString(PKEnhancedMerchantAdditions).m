@interface NSString(PKEnhancedMerchantAdditions)
- (id)jsonArrayValue;
- (id)jsonNonZeroUnsignedLongLongNSNumberArrayValue;
- (id)jsonNonZeroUnsignedLongLongNSNumberSetValue;
- (id)jsonStringSetValue;
- (id)nonZeroUnsignedLongLongNSNumberValue;
- (id)truncatedStringWithEllipsis;
@end

@implementation NSString(PKEnhancedMerchantAdditions)

- (id)nonZeroUnsignedLongLongNSNumberValue
{
  v2 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
  v3 = [a1 stringByTrimmingCharactersInSet:v2];

  v4 = [MEMORY[0x1E4F28FE8] scannerWithString:v3];
  uint64_t v8 = 0;
  v5 = 0;
  if ([v4 scanUnsignedLongLong:&v8]) {
    BOOL v6 = v8 == 0;
  }
  else {
    BOOL v6 = 1;
  }
  if (!v6)
  {
    v5 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:");
  }

  return v5;
}

- (id)jsonNonZeroUnsignedLongLongNSNumberArrayValue
{
  v1 = [a1 jsonArrayValue];
  v2 = v1;
  if (v1)
  {
    v3 = [v1 nonZeroUnsignedLongLongArrayValue];
  }
  else
  {
    v4 = PKLogFacilityTypeGetObject(0xEuLL);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)BOOL v6 = 0;
      _os_log_impl(&dword_190E10000, v4, OS_LOG_TYPE_DEFAULT, "Error parsing JSON, expected array", v6, 2u);
    }

    v3 = 0;
  }

  return v3;
}

- (id)jsonNonZeroUnsignedLongLongNSNumberSetValue
{
  v1 = [a1 jsonNonZeroUnsignedLongLongNSNumberArrayValue];
  if (v1)
  {
    v2 = [MEMORY[0x1E4F1CAD0] setWithArray:v1];
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

- (id)jsonArrayValue
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v1 = (void *)MEMORY[0x1E4F28D90];
  v2 = [a1 dataUsingEncoding:4];
  id v10 = 0;
  v3 = [v1 JSONObjectWithData:v2 options:0 error:&v10];
  id v4 = v10;

  if (v4) {
    BOOL v5 = 1;
  }
  else {
    BOOL v5 = v3 == 0;
  }
  if (v5)
  {
    BOOL v6 = PKLogFacilityTypeGetObject(0xEuLL);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v12 = v4;
      _os_log_impl(&dword_190E10000, v6, OS_LOG_TYPE_DEFAULT, "Error parsing JSON: %@", buf, 0xCu);
    }
  }
  else
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    if (isKindOfClass)
    {
      id v8 = v3;
      goto LABEL_12;
    }
  }
  id v8 = 0;
LABEL_12:

  return v8;
}

- (id)jsonStringSetValue
{
  v1 = [a1 jsonArrayValue];
  v2 = v1;
  if (v1)
  {
    v3 = objc_msgSend(v1, "pk_arrayBySafelyApplyingBlock:", &__block_literal_global_342);
    id v4 = [MEMORY[0x1E4F1CAD0] setWithArray:v3];
  }
  else
  {
    BOOL v5 = PKLogFacilityTypeGetObject(0xEuLL);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_190E10000, v5, OS_LOG_TYPE_DEFAULT, "Error parsing JSON, expected array", v7, 2u);
    }

    id v4 = 0;
  }

  return v4;
}

- (id)truncatedStringWithEllipsis
{
  if ((unint64_t)[a1 length] > 0x14)
  {
    v3 = [a1 substringToIndex:20];
    id v2 = [NSString stringWithFormat:@"%@%@", v3, @"..."];
  }
  else
  {
    id v2 = a1;
  }
  return v2;
}

@end
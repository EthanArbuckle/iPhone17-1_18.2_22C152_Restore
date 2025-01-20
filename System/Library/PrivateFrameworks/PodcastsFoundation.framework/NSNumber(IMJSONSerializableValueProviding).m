@interface NSNumber(IMJSONSerializableValueProviding)
- (id)im_jsonSerializableValue;
@end

@implementation NSNumber(IMJSONSerializableValueProviding)

- (id)im_jsonSerializableValue
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if (([a1 isEqualToNumber:*MEMORY[0x1E4F1D398]] & 1) != 0
    || ([a1 isEqualToNumber:*MEMORY[0x1E4F1D3A8]] & 1) != 0
    || [a1 isEqualToNumber:*MEMORY[0x1E4F1D3A0]])
  {
    v2 = _IMStoreLogCategoryDefault();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      int v5 = 138412290;
      v6 = a1;
      _os_log_impl(&dword_1AC9D5000, v2, OS_LOG_TYPE_ERROR, "NaN, +inf and -inf are not JSON serializable (%@)", (uint8_t *)&v5, 0xCu);
    }

    id v3 = 0;
  }
  else
  {
    id v3 = a1;
  }
  return v3;
}

@end
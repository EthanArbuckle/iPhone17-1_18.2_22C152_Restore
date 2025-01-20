@interface NSString(MatchScore)
- (BOOL)containsCJK;
- (uint64_t)composedLength;
- (uint64_t)hasCommonSubDomainPrefix;
- (uint64_t)hasSpecialAppPrefix;
- (uint64_t)startCJK;
@end

@implementation NSString(MatchScore)

- (uint64_t)composedLength
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  uint64_t v2 = [a1 length];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __38__NSString_MatchScore__composedLength__block_invoke;
  v5[3] = &unk_1E634CA78;
  v5[4] = &v6;
  objc_msgSend(a1, "enumerateSubstringsInRange:options:usingBlock:", 0, v2, 2, v5);
  uint64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (uint64_t)hasCommonSubDomainPrefix
{
  if (([a1 hasPrefix:@"www."] & 1) != 0
    || ([a1 hasPrefix:@"ww."] & 1) != 0)
  {
    return 1;
  }
  return [a1 hasPrefix:@"m."];
}

- (uint64_t)hasSpecialAppPrefix
{
  if ([a1 hasPrefix:@"my"] & 1) != 0 || (objc_msgSend(a1, "hasPrefix:", @"My")) {
    return 1;
  }
  return [a1 hasPrefix:@"i"];
}

- (BOOL)containsCJK
{
  if (containsCJK_onceToken != -1) {
    dispatch_once(&containsCJK_onceToken, &__block_literal_global_39);
  }
  return objc_msgSend((id)containsCJK_sRegex, "numberOfMatchesInString:options:range:", a1, 0, 0, objc_msgSend(a1, "length")) != 0;
}

- (uint64_t)startCJK
{
  uint64_t result = [a1 length];
  if (result)
  {
    uint64_t result = [a1 UTF8String];
    if (result)
    {
      if ((*(char *)result & 0x80000000) == 0) {
        return 0;
      }
      unint64_t v3 = *(unsigned __int8 *)result;
      if ((~(v3 >> 4) & 0xC) != 0) {
        return 0;
      }
      uint64_t v4 = utf8_byte_length_utf8_len_table_0[v3 >> 4];
      unsigned int v5 = v3 & utf8_to_code_point_utf8_first_char_mask_0[v4];
      uint64_t v4 = v4 <= 2 ? 2 : v4;
      uint64_t v6 = v4 - 1;
      v7 = (char *)(result + 1);
      do
      {
        unsigned int v8 = v5;
        char v9 = *v7++;
        unsigned int v5 = v9 & 0x3F | (v5 << 6);
        --v6;
      }
      while (v6);
      if (v5 >> 8 < 0x11) {
        return 0;
      }
      uint64_t result = 1;
      if ((v8 & 0x3FFFFFC) != 0x44 && ((v8 << 6) - 11904) >> 7 >= 0x197 && v5 - 65376 >= 0x50) {
        return 0;
      }
    }
  }
  return result;
}

@end
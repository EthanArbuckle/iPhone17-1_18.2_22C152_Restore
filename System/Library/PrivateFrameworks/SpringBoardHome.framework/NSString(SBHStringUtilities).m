@interface NSString(SBHStringUtilities)
- (id)sbh_stringByReplacingCharactersInSet:()SBHStringUtilities withString:;
- (uint64_t)sbh_stringByDeletingCharactersInSet:()SBHStringUtilities;
@end

@implementation NSString(SBHStringUtilities)

- (uint64_t)sbh_stringByDeletingCharactersInSet:()SBHStringUtilities
{
  return objc_msgSend(a1, "sbh_stringByReplacingCharactersInSet:withString:", a3, &stru_1F2FA0300);
}

- (id)sbh_stringByReplacingCharactersInSet:()SBHStringUtilities withString:
{
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)[a1 mutableCopy];
  uint64_t v9 = [v7 length];
  uint64_t v10 = [v8 length];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = 0;
    for (i = v10; i != v12; uint64_t v11 = i - v12)
    {
      uint64_t v14 = objc_msgSend(v8, "rangeOfCharacterFromSet:options:range:", v6, 0, v12, v11);
      if (v14 == 0x7FFFFFFFFFFFFFFFLL) {
        break;
      }
      uint64_t v12 = v14;
      uint64_t v16 = v15;
      if (v9) {
        objc_msgSend(v8, "replaceCharactersInRange:withString:", v14, v15, v7);
      }
      else {
        objc_msgSend(v8, "deleteCharactersInRange:", v14, v15);
      }
      uint64_t i = i + v9 - v16;
    }
  }

  return v8;
}

@end
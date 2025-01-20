@interface NSMutableString(PSGNSMutableString)
- (void)psg_removeCharactersFromSet:()PSGNSMutableString;
@end

@implementation NSMutableString(PSGNSMutableString)

- (void)psg_removeCharactersFromSet:()PSGNSMutableString
{
  id v7 = a3;
  uint64_t v4 = objc_msgSend(a1, "rangeOfCharacterFromSet:options:range:", v7, 2, 0, objc_msgSend(a1, "length"));
  if (v4 != 0x7FFFFFFFFFFFFFFFLL)
  {
    for (uint64_t i = v4;
          i != 0x7FFFFFFFFFFFFFFFLL;
          uint64_t i = objc_msgSend(a1, "rangeOfCharacterFromSet:options:range:", v7, 2, i, objc_msgSend(a1, "length") - i))
    {
      objc_msgSend(a1, "deleteCharactersInRange:", i, v5);
    }
  }
}

@end
@interface NSMutableString(ICSWriter)
- (id)controlCharacterSet;
- (uint64_t)_ICSEscapeParameterQuotedValue;
- (uint64_t)_ICSEscapeParameterValue;
- (uint64_t)_ICSEscapePropertyValue;
- (uint64_t)_ICSStripControlChracters;
- (void)_ICSRemoveCharactersFromSet:()ICSWriter;
@end

@implementation NSMutableString(ICSWriter)

- (void)_ICSRemoveCharactersFromSet:()ICSWriter
{
  id v6 = a3;
  while ([a1 length])
  {
    uint64_t v4 = [a1 rangeOfCharacterFromSet:v6];
    if (v4 == 0x7FFFFFFFFFFFFFFFLL) {
      break;
    }
    objc_msgSend(a1, "deleteCharactersInRange:", v4, v5);
  }
}

- (uint64_t)_ICSStripControlChracters
{
  v2 = objc_opt_class();
  objc_sync_enter(v2);
  if (!_ICSStripControlChracters_sCharSet)
  {
    uint64_t v3 = [a1 controlCharacterSet];
    uint64_t v4 = (void *)_ICSStripControlChracters_sCharSet;
    _ICSStripControlChracters_sCharSet = v3;

    [(id)_ICSStripControlChracters_sCharSet invert];
    uint64_t v5 = (void *)_ICSStripControlChracters_sCharSet;
    id v6 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
    [v5 formUnionWithCharacterSet:v6];

    [(id)_ICSStripControlChracters_sCharSet invert];
  }
  objc_sync_exit(v2);

  uint64_t v7 = _ICSStripControlChracters_sCharSet;
  return [a1 _ICSRemoveCharactersFromSet:v7];
}

- (id)controlCharacterSet
{
  if (controlCharacterSet_onceToken != -1) {
    dispatch_once(&controlCharacterSet_onceToken, &__block_literal_global_3);
  }
  v0 = (void *)controlCharacterSet_controlCharacterSet;
  return v0;
}

- (uint64_t)_ICSEscapePropertyValue
{
  objc_msgSend(a1, "replaceOccurrencesOfString:withString:options:range:", @"\\", @"\\\\", 0, 0, objc_msgSend(a1, "length"));
  objc_msgSend(a1, "replaceOccurrencesOfString:withString:options:range:", @";",
    @"\\;",
    0,
    0,
    [a1 length]);
  objc_msgSend(a1, "replaceOccurrencesOfString:withString:options:range:", @",", @"\\,", 0, 0, objc_msgSend(a1, "length"));
  objc_msgSend(a1, "replaceOccurrencesOfString:withString:options:range:", @"\r\n", @"\\n", 0, 0, objc_msgSend(a1, "length"));
  objc_msgSend(a1, "replaceOccurrencesOfString:withString:options:range:", @"\n", @"\\n", 0, 0, objc_msgSend(a1, "length"));
  uint64_t v2 = [a1 length];
  return objc_msgSend(a1, "replaceOccurrencesOfString:withString:options:range:", @"\r", @"\\n", 0, 0, v2);
}

- (uint64_t)_ICSEscapeParameterValue
{
  objc_msgSend(a1, "replaceOccurrencesOfString:withString:options:range:", @"\\", @"\\\\", 0, 0, objc_msgSend(a1, "length"));
  objc_msgSend(a1, "replaceOccurrencesOfString:withString:options:range:", @";",
    @"\\;",
    0,
    0,
    [a1 length]);
  objc_msgSend(a1, "replaceOccurrencesOfString:withString:options:range:", @":", @"\\:", 0, 0, objc_msgSend(a1, "length"));
  objc_msgSend(a1, "replaceOccurrencesOfString:withString:options:range:", @",", @"\\,", 0, 0, objc_msgSend(a1, "length"));
  objc_msgSend(a1, "replaceOccurrencesOfString:withString:options:range:", @"\r\n", @"\\n", 0, 0, objc_msgSend(a1, "length"));
  objc_msgSend(a1, "replaceOccurrencesOfString:withString:options:range:", @"\n", @"\\n", 0, 0, objc_msgSend(a1, "length"));
  objc_msgSend(a1, "replaceOccurrencesOfString:withString:options:range:", @"\r", @"\\n", 0, 0, objc_msgSend(a1, "length"));
  uint64_t v2 = [a1 length];
  return objc_msgSend(a1, "replaceOccurrencesOfString:withString:options:range:", @"\", @"\\\", 0, 0, v2);
}

- (uint64_t)_ICSEscapeParameterQuotedValue
{
  objc_msgSend(a1, "replaceOccurrencesOfString:withString:options:range:", @"\n", @"\\n", 0, 0, objc_msgSend(a1, "length"));
  uint64_t v2 = [a1 length];
  return objc_msgSend(a1, "replaceOccurrencesOfString:withString:options:range:", @"\"", &stru_1F3601330, 0, 0, v2);
}

@end
@interface NSString
@end

@implementation NSString

uint64_t __51__NSString_PhotosUIFoundation__px_firstLetterRange__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, unsigned char *a7)
{
  uint64_t result = objc_msgSend(*(id *)(a1 + 32), "rangeOfComposedCharacterSequencesForRange:", a3, 1);
  uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8);
  *(void *)(v10 + 32) = result;
  *(void *)(v10 + 40) = v11;
  *a7 = 1;
  return result;
}

uint64_t __78__NSString_PhotosUIFoundation__px_endsWithFullStopOrEquivalentPunctuationMark__block_invoke()
{
  uint64_t v0 = [MEMORY[0x263F08708] characterSetWithCharactersInString:@".!?…。"];
  uint64_t v1 = px_endsWithFullStopOrEquivalentPunctuationMark_fullStopPunctuationCharacterSet;
  px_endsWithFullStopOrEquivalentPunctuationMark_fullStopPunctuationCharacterSet = v0;

  return MEMORY[0x270F9A758](v0, v1);
}

id __48__NSString_PhotosUIFoundation__px_integerValues__block_invoke(uint64_t a1, void *a2)
{
  v2 = (void *)MEMORY[0x263F08708];
  id v3 = a2;
  v4 = [v2 whitespaceAndNewlineCharacterSet];
  v5 = [v3 stringByTrimmingCharactersInSet:v4];

  if ([v5 hasSuffix:@"k"] & 1) != 0 || (objc_msgSend(v5, "hasSuffix:", @"K"))
  {
    uint64_t v6 = 1000;
LABEL_4:
    uint64_t v7 = objc_msgSend(v5, "substringToIndex:", objc_msgSend(v5, "length") - 1);

    v5 = (void *)v7;
    goto LABEL_5;
  }
  uint64_t v6 = 1000000;
  if (([v5 hasSuffix:@"m"] & 1) != 0 || objc_msgSend(v5, "hasSuffix:", @"M")) {
    goto LABEL_4;
  }
  uint64_t v6 = 1;
LABEL_5:
  uint64_t v8 = [v5 integerValue];
  v9 = [NSNumber numberWithInteger:v8 * v6];

  return v9;
}

uint64_t __64__NSString_PhotosUIFoundation___excessiveLineHeightCharacterSet__block_invoke()
{
  uint64_t v0 = CTFontCopySystemUIFontExcessiveLineHeightCharacterSet();
  uint64_t v1 = _excessiveLineHeightCharacterSet_excessiveLineHeightCharacterSet;
  _excessiveLineHeightCharacterSet_excessiveLineHeightCharacterSet = v0;

  return MEMORY[0x270F9A758](v0, v1);
}

@end
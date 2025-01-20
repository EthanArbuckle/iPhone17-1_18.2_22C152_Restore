@interface NSLineMetrics
@end

@implementation NSLineMetrics

uint64_t __29___NSLineMetrics__hasShaping__block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, unsigned char *a5)
{
  uint64_t result = [a2 compositionLanguage];
  if ((unint64_t)(result - 2) <= 2)
  {
    *(void *)(*(void *)(a1 + 32) + 128) = 1;
    *a5 = 1;
  }
  return result;
}

uint64_t __103___NSLineMetrics__calculatePositions_hasAdvanceAdjustment_withCapacity_forAttributedString_range_line___block_invoke(int a1, CTRunRef run, const __CTRun *a3)
{
  CFRange StringRange = CTRunGetStringRange(run);
  CFRange v5 = CTRunGetStringRange(a3);
  uint64_t v6 = v5.location < StringRange.location;
  if (StringRange.location < v5.location) {
    uint64_t v6 = -1;
  }
  uint64_t v7 = v5.length < StringRange.length;
  if (StringRange.length < v5.length) {
    uint64_t v7 = -1;
  }
  if (v6) {
    return v6;
  }
  else {
    return v7;
  }
}

void __29___NSLineMetrics__hasShaping__block_invoke()
{
  id v0 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  id v3 = [@"ja zh yue wuu" componentsSeparatedByString:@" "];
  uint64_t v1 = [v0 initWithArray:v3];
  v2 = (void *)_hasShaping_cjShapingLanguages;
  _hasShaping_cjShapingLanguages = v1;
}

uint64_t __59___NSLineMetrics__initialAdvanceForCharacterAtIndex_range___block_invoke()
{
  _initialAdvanceForCharacterAtIndex_range__openingMarkCharacterSet = [MEMORY[0x1E4F28B88] characterSetWithCharactersInString:@"「『（〔【〖〈《｛‘“"];

  return MEMORY[0x1F41817F8]();
}

uint64_t __57___NSLineMetrics__finalAdvanceForCharacterAtIndex_range___block_invoke()
{
  _finalAdvanceForCharacterAtIndex_range__closingMarkCharacterSet = [MEMORY[0x1E4F28B88] characterSetWithCharactersInString:@"」』）〕】〗〉》｝’”。、\ff0c：；？！．"];

  return MEMORY[0x1F41817F8]();
}

@end
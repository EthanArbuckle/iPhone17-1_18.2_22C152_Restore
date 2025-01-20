@interface NSCharacterSet
@end

@implementation NSCharacterSet

void __62__NSCharacterSet_CRCharacterSet___crUnknownScriptCharacterSet__block_invoke()
{
  id v4 = [MEMORY[0x1E4F28E78] string];
  v0 = unicodeToNSString(57345);
  [v4 appendString:v0];

  v1 = unicodeToNSString(57346);
  [v4 appendString:v1];

  uint64_t v2 = [MEMORY[0x1E4F28B88] characterSetWithCharactersInString:v4];
  v3 = (void *)qword_1EB58CA00;
  qword_1EB58CA00 = v2;
}

void __78__NSCharacterSet_CRCharacterSet___crJapaneseKoreanAsUnknownScriptCharacterSet__block_invoke()
{
  id v3 = [MEMORY[0x1E4F28E78] string];
  v0 = unicodeToNSString(57346);
  [v3 appendString:v0];

  uint64_t v1 = [MEMORY[0x1E4F28B88] characterSetWithCharactersInString:v3];
  uint64_t v2 = (void *)qword_1EB58CA10;
  qword_1EB58CA10 = v1;
}

void __61__NSCharacterSet_CRCharacterSet___crBiDiMirroredCharacterSet__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F28B88] characterSetWithCharactersInString:@"()<>{}[]«»"];
  uint64_t v1 = (void *)qword_1EB58CA20;
  qword_1EB58CA20 = v0;
}

void __60__NSCharacterSet_CRCharacterSet___crBasicArabicCharacterSet__block_invoke()
{
  uint64_t v0 = (void *)MEMORY[0x1E4F28B88];
  id v3 = [&unk_1F39333E8 componentsJoinedByString:&stru_1F38EED68];
  uint64_t v1 = [v0 characterSetWithCharactersInString:v3];
  uint64_t v2 = (void *)qword_1EB58CA30;
  qword_1EB58CA30 = v1;
}

void __60__NSCharacterSet_CRCharacterSet___crArabicDigitCharacterSet__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F28B88] characterSetWithCharactersInString:@"٠١٢٣٤٥٦٧٨٩"];
  uint64_t v1 = (void *)qword_1EB58CA40;
  qword_1EB58CA40 = v0;
}

void __64__NSCharacterSet_CRCharacterSet___crArabicDiacriticCharacterSet__block_invoke()
{
  uint64_t v0 = (void *)MEMORY[0x1E4F28B88];
  id v3 = [&unk_1F3933400 componentsJoinedByString:&stru_1F38EED68];
  uint64_t v1 = [v0 characterSetWithCharactersInString:v3];
  uint64_t v2 = (void *)qword_1EB58CA50;
  qword_1EB58CA50 = v1;
}

void __71__NSCharacterSet_CRCharacterSet___crArabicTanweenDiacriticCharacterSet__block_invoke()
{
  uint64_t v0 = (void *)MEMORY[0x1E4F28B88];
  id v3 = [&unk_1F3933418 componentsJoinedByString:&stru_1F38EED68];
  uint64_t v1 = [v0 characterSetWithCharactersInString:v3];
  uint64_t v2 = (void *)qword_1EB58CA60;
  qword_1EB58CA60 = v1;
}

void __73__NSCharacterSet_CRCharacterSet___crArabicCombiningDiacriticCharacterSet__block_invoke()
{
  uint64_t v0 = (void *)MEMORY[0x1E4F28B88];
  id v3 = [&unk_1F3933430 componentsJoinedByString:&stru_1F38EED68];
  uint64_t v1 = [v0 characterSetWithCharactersInString:v3];
  uint64_t v2 = (void *)qword_1EB58CA70;
  qword_1EB58CA70 = v1;
}

void __61__NSCharacterSet_CRLineWrappingUtilities___crBOSCharacterSet__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F28B88] characterSetWithCharactersInString:@"¿\"'¡§"];
  uint64_t v1 = (void *)_MergedGlobals_18;
  _MergedGlobals_18 = v0;
}

void __61__NSCharacterSet_CRLineWrappingUtilities___crEOSCharacterSet__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F28B88] characterSetWithCharactersInString:@".．。｡?？!！:：;；"];
  uint64_t v1 = (void *)qword_1EB58CAF0;
  qword_1EB58CAF0 = v0;
}

void __76__NSCharacterSet_CRLineWrappingUtilities___crClosingPunctuationCharacterSet__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F28B88] characterSetWithCharactersInString:@"»）】]"]);
  uint64_t v1 = (void *)qword_1EB58CB00;
  qword_1EB58CB00 = v0;
}

void __61__NSCharacterSet_CRLineWrappingUtilities___crMOSCharacterSet__block_invoke()
{
  uint64_t v0 = ;
  uint64_t v1 = (void *)qword_1EB58CB10;
  qword_1EB58CB10 = v0;
}

@end
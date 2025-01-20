@interface NSString
@end

@implementation NSString

void __61__NSString_TSUNumberFormatStringUtilities__tsu_numberSymbols__block_invoke()
{
  uint64_t v0 = [MEMORY[0x263F08708] characterSetWithCharactersInString:@"0123456789#@"];
  v1 = (void *)tsu_numberSymbols_symbols;
  tsu_numberSymbols_symbols = v0;
}

void __47__NSString_TSUAdditions__tsu_escapeForIcuRegex__block_invoke()
{
  id v2 = [MEMORY[0x263F08708] characterSetWithCharactersInString:@"*?+[(){}^$|\\./"];
  objc_storeStrong((id *)&tsu_escapeForIcuRegex_icuRegexCharSet, v2);
  if (!tsu_escapeForIcuRegex_icuRegexCharSet)
  {
    uint64_t v0 = [NSString stringWithUTF8String:"-[NSString(TSUAdditions) tsu_escapeForIcuRegex]_block_invoke"];
    v1 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/NSString_TSUAdditions.m"];
    +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v0, v1, 381, 0, "invalid nil value for '%{public}s'", "icuRegexCharSet");

    +[OITSUAssertionHandler logBacktraceThrottled];
  }
}

CFStringTokenizerTokenType __80__NSString_TSUAdditions__tsu_setOfContainedWordsIncludingPunctuationAndSymbols___block_invoke(uint64_t a1, CFStringTokenizerRef tokenizer)
{
  do
  {
    while (1)
    {
      CFStringTokenizerTokenType Token = CFStringTokenizerAdvanceToNextToken(tokenizer);
      CFStringTokenizerTokenType v5 = Token;
      if (Token) {
        break;
      }
      if (CFStringTokenizerGetCurrentTokenRange(tokenizer).location == -1) {
        return v5;
      }
    }
    if (*(unsigned char *)(a1 + 32)) {
      BOOL v6 = 1;
    }
    else {
      BOOL v6 = (Token & 0x10) == 0;
    }
  }
  while (!v6);
  return v5;
}

void __63__NSString_TSUAdditions__tsu_stringWithoutAttachmentCharacters__block_invoke()
{
  __int16 v2 = -4;
  uint64_t v0 = [[NSString alloc] initWithCharacters:&v2 length:1];
  v1 = (void *)tsu_stringWithoutAttachmentCharacters_sAttachmentCharacter;
  tsu_stringWithoutAttachmentCharacters_sAttachmentCharacter = v0;
}

void __57__NSString_TSUAdditions__tsu_stringWithNormalizedHyphens__block_invoke()
{
  uint64_t v0 = [MEMORY[0x263F08708] characterSetWithCharactersInString:@"ـ‑-‐–—"];
  v1 = (void *)tsu_stringWithNormalizedHyphens_hyphenSet;
  tsu_stringWithNormalizedHyphens_hyphenSet = v0;
}

void __64__NSString_TSUAdditions__tsu_stringWithNormalizedQuotationMarks__block_invoke()
{
  uint64_t v0 = [MEMORY[0x263F08708] characterSetWithCharactersInString:@"'\"’‘‚“”„«»‹›」「』『"];
  v1 = (void *)tsu_stringWithNormalizedQuotationMarks_quotationSet;
  tsu_stringWithNormalizedQuotationMarks_quotationSet = v0;
}

void __86__NSString_TSUPersonNameComponents__tsu_localizedDisplayNameWithPersonNameComponents___block_invoke()
{
  uint64_t v0 = TSULogCreateCategory("TSUDefaultCat");
  v1 = (void *)TSUDefaultCat_log_t;
  TSUDefaultCat_log_t = v0;
}

void __66__NSString_TSULogAdditions__tsu_initRedactedWithFormat_arguments___block_invoke()
{
  id v3 = 0;
  uint64_t v0 = [objc_alloc(MEMORY[0x263F08AE8]) initWithPattern:@"<REDACT .*? REDACT>" options:8 error:&v3];
  id v1 = v3;
  __int16 v2 = (void *)tsu_initRedactedWithFormat_arguments__redactRegex;
  tsu_initRedactedWithFormat_arguments__redactRegex = v0;
}

void __59__NSString_SFUJsonAdditions__sfu_appendJsonStringToString___block_invoke()
{
  sfu_appendJsonStringToString__escapeCharacters = (uint64_t)(id)objc_msgSend(MEMORY[0x263F089C0], "characterSetWithRange:", 0, 32);
  [(id)sfu_appendJsonStringToString__escapeCharacters addCharactersInString:@"\"\\""];
  int v1 = 539566120;
  uint64_t v0 = (void *)[[NSString alloc] initWithCharacters:&v1 length:2];
  [(id)sfu_appendJsonStringToString__escapeCharacters addCharactersInString:v0];
}

void __86__NSString_TSWPAdditions__tswp_stringForValue_withListNumberFormat_includeFormatting___block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x263F089C0]);
  objc_msgSend(v0, "addCharactersInRange:", 46, 1);
  objc_msgSend(v0, "addCharactersInRange:", 40, 1);
  objc_msgSend(v0, "addCharactersInRange:", 41, 1);
  int v1 = (void *)+[NSString(TSWPAdditions) tswp_stringForValue:withListNumberFormat:includeFormatting:]::_formattingCharacterSet;
  +[NSString(TSWPAdditions) tswp_stringForValue:withListNumberFormat:includeFormatting:]::_formattingCharacterSet = (uint64_t)v0;
}

void __52__NSString_CSSEscaping__CM_stringByAddingCSSEscapes__block_invoke()
{
  uint64_t v0 = [MEMORY[0x263F08708] characterSetWithCharactersInString:@"\n\r\f"];
  int v1 = (void *)_MergedGlobals_54;
  _MergedGlobals_54 = v0;
}

@end
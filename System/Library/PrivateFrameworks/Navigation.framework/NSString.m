@interface NSString
@end

@implementation NSString

uint64_t __58__NSString_FormatExtras___navigation_formatterForOptions___block_invoke()
{
  qword_1EB59C050 = (uint64_t)objc_alloc_init(MEMORY[0x1E4F1C998]);
  return MEMORY[0x1F41817F8]();
}

uint64_t __64__NSString_FormatExtras___navigation_formattedStringForInteger___block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28EE0]);
  v1 = (void *)_MergedGlobals_21;
  _MergedGlobals_21 = (uint64_t)v0;

  v2 = (void *)_MergedGlobals_21;
  v3 = [MEMORY[0x1E4F1CA20] autoupdatingCurrentLocale];
  [v2 setLocale:v3];

  [(id)_MergedGlobals_21 setNumberStyle:1];
  v4 = (void *)_MergedGlobals_21;
  return [v4 setMinimumIntegerDigits:1];
}

uint64_t __100__NSString_FormatExtras___navigation_replacementForFormatToken_options_overrideVariables_useMetric___block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28EE0]);
  v1 = (void *)qword_1EB59C040;
  qword_1EB59C040 = (uint64_t)v0;

  v2 = (void *)qword_1EB59C040;
  return [v2 setNumberStyle:3];
}

uint64_t __43__NSString_FormatExtras___navigation_isCJK__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28E58]);
  v1 = (void *)qword_1EB59C060;
  qword_1EB59C060 = (uint64_t)v0;

  objc_msgSend((id)qword_1EB59C060, "addCharactersInRange:", 4352, 256);
  objc_msgSend((id)qword_1EB59C060, "addCharactersInRange:", 11904, 352);
  objc_msgSend((id)qword_1EB59C060, "addCharactersInRange:", 12272, 464);
  objc_msgSend((id)qword_1EB59C060, "addCharactersInRange:", 12800, 29392);
  objc_msgSend((id)qword_1EB59C060, "addCharactersInRange:", 44032, 11183);
  objc_msgSend((id)qword_1EB59C060, "addCharactersInRange:", 63744, 352);
  objc_msgSend((id)qword_1EB59C060, "addCharactersInRange:", 65072, 32);
  objc_msgSend((id)qword_1EB59C060, "addCharactersInRange:", 65280, 240);
  objc_msgSend((id)qword_1EB59C060, "addCharactersInRange:", 0x20000, 42711);
  v2 = (void *)qword_1EB59C060;
  return objc_msgSend(v2, "addCharactersInRange:", 194560, 542);
}

uint64_t __58__NSString_FormatExtras___navigation_stringForPower_unit___block_invoke()
{
  qword_1EB59C070 = (uint64_t)objc_alloc_init(MEMORY[0x1E4F28E30]);
  return MEMORY[0x1F41817F8]();
}

@end
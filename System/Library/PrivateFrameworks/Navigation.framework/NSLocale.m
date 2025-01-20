@interface NSLocale
@end

@implementation NSLocale

void __63__NSLocale_MNExtras___localeOverridesForLocaleWithCountryCode___block_invoke()
{
  v8[1] = *MEMORY[0x1E4F143B8];
  v7 = @"GB";
  v5[0] = *MEMORY[0x1E4F1C490];
  v0 = [NSNumber numberWithBool:0];
  v5[1] = @"MNLocaleUseYardForShortDistance";
  v6[0] = v0;
  v1 = [NSNumber numberWithBool:1];
  v6[1] = v1;
  v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:v5 count:2];
  v8[0] = v2;
  uint64_t v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];
  v4 = (void *)_MergedGlobals_32;
  _MergedGlobals_32 = v3;
}

@end
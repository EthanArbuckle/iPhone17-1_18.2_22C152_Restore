@interface SearchUILocalSuggestionCompletion
+ (BOOL)supportsResult:(id)a3 cardSection:(id)a4;
- (id)image;
- (id)prefixMatchExtensionString;
@end

@implementation SearchUILocalSuggestionCompletion

+ (BOOL)supportsResult:(id)a3 cardSection:(id)a4
{
  v4 = objc_msgSend(a4, "command", a3);
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (id)prefixMatchExtensionString
{
  v2 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v3 = [v2 localizedStringForKey:@"SEARCH_BAR_PLACEHOLDER" value:&stru_1F40279D8 table:0];

  return v3;
}

- (id)image
{
  return 0;
}

@end
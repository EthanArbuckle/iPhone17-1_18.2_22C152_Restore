@interface UIButton(PKUIUtilities)
- (void)pkui_updateConfigurationShowingActivityIndicator:()PKUIUtilities;
- (void)pkui_updateConfigurationWithFont:()PKUIUtilities;
- (void)pkui_updateConfigurationWithImage:()PKUIUtilities;
- (void)pkui_updateConfigurationWithTitle:()PKUIUtilities;
@end

@implementation UIButton(PKUIUtilities)

- (void)pkui_updateConfigurationWithTitle:()PKUIUtilities
{
  v4 = a3;
  v5 = [a1 configuration];
  v6 = [v5 attributedTitle];

  if ([v6 length])
  {
    v7 = objc_msgSend(v6, "attributesAtIndex:longestEffectiveRange:inRange:", 0, 0, 0, objc_msgSend(v6, "length"));
  }
  else
  {
    v7 = (void *)MEMORY[0x1E4F1CC08];
  }
  if (v4) {
    v8 = v4;
  }
  else {
    v8 = &stru_1EF1B5B50;
  }
  v11 = v8;
  v9 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v8 attributes:v7];
  v10 = [a1 configuration];
  [v10 setAttributedTitle:v9];
  [a1 setConfiguration:v10];
}

- (void)pkui_updateConfigurationWithFont:()PKUIUtilities
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [a1 configuration];
  v6 = [v5 attributedTitle];
  v7 = (void *)[v6 mutableCopy];

  uint64_t v10 = *MEMORY[0x1E4FB06F8];
  v11[0] = v4;
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1];

  objc_msgSend(v7, "setAttributes:range:", v8, 0, objc_msgSend(v7, "length"));
  v9 = [a1 configuration];
  [v9 setAttributedTitle:v7];
  [a1 setConfiguration:v9];
}

- (void)pkui_updateConfigurationWithImage:()PKUIUtilities
{
  id v4 = a3;
  id v5 = [a1 configuration];
  [v5 setImage:v4];

  [a1 setConfiguration:v5];
}

- (void)pkui_updateConfigurationShowingActivityIndicator:()PKUIUtilities
{
  id v5 = [a1 configuration];
  [v5 setShowsActivityIndicator:a3];
  [a1 setConfiguration:v5];
}

@end
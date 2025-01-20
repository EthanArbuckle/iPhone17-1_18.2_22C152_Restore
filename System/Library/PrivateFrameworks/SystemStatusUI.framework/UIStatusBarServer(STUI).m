@interface UIStatusBarServer(STUI)
+ (id)stui_doubleHeightStatusStringMapping;
+ (id)stui_getDoubleHeightStatusStringBackgroundActivityWithIdentifier:()STUI;
+ (void)stui_postDoubleHeightStatusString:()STUI forBackgroundActivityWithIdentifier:;
@end

@implementation UIStatusBarServer(STUI)

+ (id)stui_doubleHeightStatusStringMapping
{
  if (_MergedGlobals_45 != -1) {
    dispatch_once(&_MergedGlobals_45, &__block_literal_global_10);
  }
  v0 = (void *)qword_1EC05EF40;
  return v0;
}

+ (void)stui_postDoubleHeightStatusString:()STUI forBackgroundActivityWithIdentifier:
{
  id v9 = a3;
  id v6 = a4;
  v7 = objc_msgSend(a1, "stui_doubleHeightStatusStringMapping");
  [v7 setObject:v9 forKey:v6];
  uint64_t v8 = STUIStyleOverrideForBackgroundActivityIdentifier(v6);

  if (v8) {
    objc_msgSend(a1, "postDoubleHeightStatusString:forStyle:", v9, objc_msgSend(MEMORY[0x1E4FB1C68], "_defaultStyleForRequestedStyle:styleOverrides:activeStyleOverride:", 0, v8, 0));
  }
}

+ (id)stui_getDoubleHeightStatusStringBackgroundActivityWithIdentifier:()STUI
{
  id v4 = a3;
  v5 = objc_msgSend(a1, "stui_doubleHeightStatusStringMapping");
  id v6 = [v5 objectForKey:v4];
  if (!v6)
  {
    uint64_t v7 = STUIStyleOverrideForBackgroundActivityIdentifier(v4);
    if (v7)
    {
      id v6 = objc_msgSend(a1, "getDoubleHeightStatusStringForStyle:", objc_msgSend(MEMORY[0x1E4FB1C68], "_defaultStyleForRequestedStyle:styleOverrides:activeStyleOverride:", 0, v7, 0));
    }
    else
    {
      id v6 = 0;
    }
  }

  return v6;
}

@end
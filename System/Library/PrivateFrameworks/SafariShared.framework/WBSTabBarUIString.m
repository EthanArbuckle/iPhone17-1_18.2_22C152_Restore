@interface WBSTabBarUIString
+ (id)accessibilityLabelForNumberOfTabs:(unint64_t)a3 andNumberOfPinnedTabs:(unint64_t)a4;
@end

@implementation WBSTabBarUIString

+ (id)accessibilityLabelForNumberOfTabs:(unint64_t)a3 andNumberOfPinnedTabs:(unint64_t)a4
{
  if (a3)
  {
    v6 = NSString;
    if (a4)
    {
      v7 = _WBSLocalizedString();
      v8 = objc_msgSend(v6, "localizedStringWithFormat:", v7, a3, a4);
    }
    else
    {
      v9 = _WBSLocalizedString();
      v8 = objc_msgSend(v6, "localizedStringWithFormat:", v9, a3);
    }
  }
  else
  {
    v8 = _WBSLocalizedString();
  }
  return v8;
}

@end
@interface _UINavigationBarTitleFontProviderTV
- (id)defaultInlineTitleFont;
- (id)defaultTitleFont;
@end

@implementation _UINavigationBarTitleFontProviderTV

- (id)defaultTitleFont
{
  return (id)[off_1E52D39B8 preferredFontForTextStyle:@"UICTFontTextStyleEmphasizedTitle2"];
}

- (id)defaultInlineTitleFont
{
  return (id)[off_1E52D39B8 preferredFontForTextStyle:@"UICTFontTextStyleEmphasizedTitle2"];
}

@end
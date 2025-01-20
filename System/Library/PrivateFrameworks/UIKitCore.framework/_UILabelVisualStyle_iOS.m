@interface _UILabelVisualStyle_iOS
- (BOOL)shouldDelayStartMarquee;
- (BOOL)shouldDisableUpdateTextColorOnTraitCollectionChangeForAttributedString:(id)a3 attributes:(id)a4;
- (BOOL)updatesTextColorOnUserInterfaceStyleChanges;
- (id)defaultFont;
@end

@implementation _UILabelVisualStyle_iOS

- (BOOL)shouldDisableUpdateTextColorOnTraitCollectionChangeForAttributedString:(id)a3 attributes:(id)a4
{
  return 0;
}

- (id)defaultFont
{
  [off_1E52D39B8 defaultFontSize];
  return (id)objc_msgSend(off_1E52D39B8, "systemFontOfSize:");
}

- (BOOL)updatesTextColorOnUserInterfaceStyleChanges
{
  return 0;
}

- (BOOL)shouldDelayStartMarquee
{
  return 0;
}

@end
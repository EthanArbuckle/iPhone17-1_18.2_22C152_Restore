@interface UIInterfaceActionConcreteVisualStyle_iOSAlert
- (CGSize)minimumActionContentSize;
- (double)actionSectionSpacing;
- (id)_preferredActionFont;
- (id)_regularActionFont;
- (id)newActionBackgroundViewForViewState:(id)a3;
@end

@implementation UIInterfaceActionConcreteVisualStyle_iOSAlert

- (CGSize)minimumActionContentSize
{
  double v2 = 44.0;
  double v3 = 0.0;
  result.height = v2;
  result.width = v3;
  return result;
}

- (double)actionSectionSpacing
{
  return 8.0;
}

- (id)newActionBackgroundViewForViewState:(id)a3
{
  if (![a3 isHighlighted]) {
    return 0;
  }
  [(UIInterfaceActionConcreteVisualStyle_iOS *)self _highlightedView];
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_regularActionFont
{
  double v2 = [off_1E52D39C0 preferredFontDescriptorWithTextStyle:@"UICTFontTextStyleBody" addingSymbolicTraits:0x8000 options:2];
  double v3 = [off_1E52D39B8 fontWithDescriptor:v2 size:0.0];

  return v3;
}

- (id)_preferredActionFont
{
  double v2 = [off_1E52D39C0 preferredFontDescriptorWithTextStyle:@"UICTFontTextStyleHeadline" addingSymbolicTraits:0x8000 options:2];
  double v3 = [off_1E52D39B8 fontWithDescriptor:v2 size:0.0];

  return v3;
}

@end
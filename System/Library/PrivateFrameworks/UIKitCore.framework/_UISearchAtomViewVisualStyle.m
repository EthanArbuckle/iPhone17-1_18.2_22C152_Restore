@interface _UISearchAtomViewVisualStyle
- (UIBlurEffect)defaultAtomBackgroundBlurEffect;
- (UIBlurEffect)disabledAtomBackgroundBlurEffect;
- (UIColor)defaultAtomBackgroundColor;
- (UIColor)defaultSelectedAtomBackgroundColor;
- (UIColor)defaultSelectedTextAndImageColor;
- (UIColor)defaultTextAndImageColor;
- (UIColor)textContrastFallbackColor;
- (UIFont)defaultFont;
- (_UISearchAtomView)searchAtomView;
- (_UISearchAtomViewVisualStyle)initWithInstance:(id)a3;
- (double)contentHorizontalPadding;
- (double)cornerRadius;
- (double)disabledAlpha;
- (double)imageTextSpacing;
- (double)maximumAtomWidthFraction;
- (double)maximumFallbackWidth;
- (double)minimumConstrainedAtomWidth;
- (double)minimumTextConstrastRatio;
- (double)textVerticalPadding;
@end

@implementation _UISearchAtomViewVisualStyle

- (_UISearchAtomViewVisualStyle)initWithInstance:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_UISearchAtomViewVisualStyle;
  v5 = [(_UISearchAtomViewVisualStyle *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_searchAtomView, v4);
  }

  return v6;
}

- (double)disabledAlpha
{
  return 0.5;
}

- (double)maximumFallbackWidth
{
  return 157.0;
}

- (double)maximumAtomWidthFraction
{
  return 0.75;
}

- (double)minimumConstrainedAtomWidth
{
  return 94.0;
}

- (double)cornerRadius
{
  return 4.0;
}

- (double)contentHorizontalPadding
{
  return 4.0;
}

- (double)textVerticalPadding
{
  return 2.0;
}

- (double)imageTextSpacing
{
  return 4.0;
}

- (double)minimumTextConstrastRatio
{
  return 0.222222222;
}

- (UIColor)defaultTextAndImageColor
{
  return +[UIColor whiteColor];
}

- (UIColor)defaultSelectedTextAndImageColor
{
  return +[UIColor whiteColor];
}

- (UIColor)textContrastFallbackColor
{
  return +[UIColor blackColor];
}

- (UIColor)defaultAtomBackgroundColor
{
  return +[UIColor systemGrayColor];
}

- (UIBlurEffect)defaultAtomBackgroundBlurEffect
{
  return 0;
}

- (UIBlurEffect)disabledAtomBackgroundBlurEffect
{
  return 0;
}

- (UIColor)defaultSelectedAtomBackgroundColor
{
  return 0;
}

- (UIFont)defaultFont
{
  v2 = [off_1E52D39C0 defaultFontDescriptorWithTextStyle:@"UICTFontTextStyleBody" addingSymbolicTraits:0x8000 options:3];
  v3 = [off_1E52D39B8 fontWithDescriptor:v2 size:0.0];

  return (UIFont *)v3;
}

- (_UISearchAtomView)searchAtomView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_searchAtomView);
  return (_UISearchAtomView *)WeakRetained;
}

- (void).cxx_destruct
{
}

@end
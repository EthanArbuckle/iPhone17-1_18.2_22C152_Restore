@interface UIStaticScrollBar
@end

@implementation UIStaticScrollBar

id __44___UIStaticScrollBar__setupSubviewsIfNeeded__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = +[UIButton buttonWithType:0];
  [v4 setTranslatesAutoresizingMaskIntoConstraints:0];
  v5 = +[UIImageSymbolConfiguration configurationWithTextStyle:@"UICTFontTextStyleEmphasizedCallout" scale:3];
  v6 = +[UIImage systemImageNamed:v3 withConfiguration:v5];

  v7 = [v6 imageWithRenderingMode:2];
  [v4 setImage:v7 forState:0];

  [v4 addTarget:*(void *)(a1 + 32) action:sel_buttonTapped_ forControlEvents:64];
  return v4;
}

@end
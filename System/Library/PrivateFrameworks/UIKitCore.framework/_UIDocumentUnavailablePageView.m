@interface _UIDocumentUnavailablePageView
- (_UIDocumentUnavailablePageView)initWithFrame:(CGRect)a3;
@end

@implementation _UIDocumentUnavailablePageView

- (_UIDocumentUnavailablePageView)initWithFrame:(CGRect)a3
{
  v18.receiver = self;
  v18.super_class = (Class)_UIDocumentUnavailablePageView;
  v3 = -[UIView initWithFrame:](&v18, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    uint64_t v5 = *MEMORY[0x1E4F39EA8];
    v6 = [(UIView *)v3 layer];
    [v6 setCornerCurve:v5];

    v7 = [(UIView *)v4 layer];
    [v7 setCornerRadius:13.0];

    v8 = [(UIView *)v4 layer];
    LODWORD(v9) = 1028443341;
    [v8 setShadowOpacity:v9];

    v10 = [(UIView *)v4 layer];
    [v10 setShadowRadius:20.0];

    v11 = [(UIView *)v4 layer];
    objc_msgSend(v11, "setShadowOffset:", 0.0, 4.0);

    id v12 = +[UIColor blackColor];
    uint64_t v13 = [v12 CGColor];
    v14 = [(UIView *)v4 layer];
    [v14 setShadowColor:v13];

    v15 = +[UIColor tertiarySystemBackgroundColor];
    v16 = [v15 colorWithAlphaComponent:0.8];
    [(UIView *)v4 setBackgroundColor:v16];

    [(UIView *)v4 setMaximumContentSizeCategory:@"UICTContentSizeCategoryAccessibilityL"];
  }
  return v4;
}

@end
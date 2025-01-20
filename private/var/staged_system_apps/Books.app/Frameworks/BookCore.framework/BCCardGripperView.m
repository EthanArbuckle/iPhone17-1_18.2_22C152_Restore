@interface BCCardGripperView
+ (BCCardGripperView)cardGripperViewWithStyle:(int64_t)a3;
+ (id)_buttonImageForStyle:(int64_t)a3;
- (BCCardGripperView)initWithFrame:(CGRect)a3;
- (BCCardGripperView)initWithFrame:(CGRect)a3 style:(int64_t)a4;
- (BCCardGripperViewAccessibilityDelegate)accessibilityDelegate;
- (BOOL)_accessibilitySupportsActivateAction;
- (BOOL)accessibilityActivate;
- (BOOL)isAccessibilityElement;
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (CGSize)imageSize;
- (UIView)button;
- (UIViewController)menuViewController;
- (id)_accessibilityParentForFindingScrollParent;
- (id)accessibilityHint;
- (id)accessibilityLabel;
- (id)actionProvider;
- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4;
- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5;
- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4;
- (unint64_t)accessibilityTraits;
- (void)setAccessibilityDelegate:(id)a3;
- (void)setActionProvider:(id)a3;
- (void)setButton:(id)a3;
- (void)setMenuViewController:(id)a3;
@end

@implementation BCCardGripperView

+ (BCCardGripperView)cardGripperViewWithStyle:(int64_t)a3
{
  v3 = -[BCCardGripperView initWithFrame:style:]([BCCardGripperView alloc], "initWithFrame:style:", a3, CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);

  return v3;
}

+ (id)_buttonImageForStyle:(int64_t)a3
{
  if (a3 == 1)
  {
    v3 = +[UIImageSymbolConfiguration configurationWithPointSize:7 weight:3 scale:12.0];
    CFStringRef v4 = @"xmark";
    goto LABEL_5;
  }
  if (!a3)
  {
    v3 = +[UIImageSymbolConfiguration configurationWithPointSize:6 weight:3 scale:17.0];
    CFStringRef v4 = @"xmark.circle.fill";
LABEL_5:
    v5 = +[UIImage systemImageNamed:v4 withConfiguration:v3];
    v6 = +[UIColor tertiaryLabelColor];
    v7 = [v5 imageWithTintColor:v6 renderingMode:1];

    goto LABEL_7;
  }
  v7 = 0;
LABEL_7:

  return v7;
}

- (BCCardGripperView)initWithFrame:(CGRect)a3 style:(int64_t)a4
{
  v28.receiver = self;
  v28.super_class = (Class)BCCardGripperView;
  v5 = -[BCCardGripperView initWithFrame:](&v28, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v5)
  {
    v6 = [(id)objc_opt_class() _buttonImageForStyle:a4];
    v7 = [v6 imageWithAlignmentRectInsets:UIEdgeInsetsZero.top, UIEdgeInsetsZero.left, UIEdgeInsetsZero.bottom, UIEdgeInsetsZero.right];

    v27 = v7;
    [v7 size];
    v5->_imageSize.width = v8;
    v5->_imageSize.height = v9;
    v10 = (UIView *)[objc_alloc((Class)UIImageView) initWithImage:v7];
    button = v5->_button;
    v5->_button = v10;

    [(BCCardGripperView *)v5 addSubview:v5->_button];
    [(UIView *)v5->_button setTranslatesAutoresizingMaskIntoConstraints:0];
    v26 = [(BCCardGripperView *)v5 widthAnchor];
    v25 = [(UIView *)v5->_button widthAnchor];
    v24 = [v26 constraintEqualToAnchor:v25];
    v29[0] = v24;
    v23 = [(BCCardGripperView *)v5 heightAnchor];
    v12 = [(UIView *)v5->_button heightAnchor];
    v13 = [v23 constraintEqualToAnchor:v12];
    v29[1] = v13;
    v14 = [(UIView *)v5->_button centerXAnchor];
    v15 = [(BCCardGripperView *)v5 centerXAnchor];
    v16 = [v14 constraintEqualToAnchor:v15];
    v29[2] = v16;
    v17 = [(UIView *)v5->_button centerYAnchor];
    v18 = [(BCCardGripperView *)v5 centerYAnchor];
    v19 = [v17 constraintEqualToAnchor:v18];
    v29[3] = v19;
    v20 = +[NSArray arrayWithObjects:v29 count:4];
    +[NSLayoutConstraint activateConstraints:v20];

    id v21 = [objc_alloc((Class)UIPointerInteraction) initWithDelegate:v5];
    [(BCCardGripperView *)v5 addInteraction:v21];
  }
  return v5;
}

- (BCCardGripperView)initWithFrame:(CGRect)a3
{
  return -[BCCardGripperView initWithFrame:style:](self, "initWithFrame:style:", 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  [(BCCardGripperView *)self bounds];
  double Width = CGRectGetWidth(v27);
  [(BCCardGripperView *)self imageSize];
  double v9 = Width / v8;
  double v10 = v9 * -16.0;
  double v11 = v9 * -20.0;
  v12 = (char *)[UIApp userInterfaceLayoutDirection];
  if (v12 == (unsigned char *)&def_7D91C + 1) {
    double v13 = v10;
  }
  else {
    double v13 = v11;
  }
  if (v12 == (unsigned char *)&def_7D91C + 1) {
    double v14 = v11;
  }
  else {
    double v14 = v10;
  }
  [(BCCardGripperView *)self bounds];
  double v16 = v14 + v15;
  double v18 = v10 + v17;
  double v20 = v19 - (v14 + v13);
  double v22 = v21 - (v10 + v11);
  CGFloat v23 = x;
  CGFloat v24 = y;

  return CGRectContainsPoint(*(CGRect *)&v16, *(CGPoint *)&v23);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)_accessibilityParentForFindingScrollParent
{
  v3 = [(BCCardGripperView *)self _accessibilityAncestorIsKindOf:NSClassFromString(@"BCCardSetWideTouchScrollView")];
  if (!v3)
  {
    v5.receiver = self;
    v5.super_class = (Class)BCCardGripperView;
    v3 = [(BCCardGripperView *)&v5 _accessibilityParentForFindingScrollParent];
  }

  return v3;
}

- (id)accessibilityLabel
{
  v2 = IMCommonCoreBundle();
  v3 = [v2 localizedStringForKey:@"Close" value:&stru_2CE418 table:@"BCCommonCoreLocalizable"];

  return v3;
}

- (id)accessibilityHint
{
  v2 = IMCommonCoreBundle();
  v3 = [v2 localizedStringForKey:@"Double tap to dismiss the popover" value:&stru_2CE418 table:@"BCCommonCoreLocalizable"];

  return v3;
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)BCCardGripperView;
  return UIAccessibilityTraitButton | [(BCCardGripperView *)&v3 accessibilityTraits];
}

- (BOOL)_accessibilitySupportsActivateAction
{
  return 1;
}

- (BOOL)accessibilityActivate
{
  objc_super v3 = [(BCCardGripperView *)self accessibilityDelegate];
  [v3 accessibilityDidActivateGripperView:self];

  return 1;
}

- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5
{
  [(BCCardGripperView *)self bounds];

  return +[UIPointerRegion regionWithRect:identifier:](UIPointerRegion, "regionWithRect:identifier:", 0);
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  [(BCCardGripperView *)self bounds];
  double v7 = fmax(v5, v6);
  double v8 = +[UIBezierPath bezierPathWithOvalInRect:](UIBezierPath, "bezierPathWithOvalInRect:", (v5 - v7) * 0.5, (v6 - v7) * 0.5, v7, v7);
  double v9 = +[UIPointerShape shapeWithPath:v8];

  id v10 = [objc_alloc((Class)UITargetedPreview) initWithView:self];
  double v11 = +[UIPointerLiftEffect effectWithPreview:v10];
  v12 = +[UIPointerStyle styleWithEffect:v11 shape:v9];

  return v12;
}

- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_14EFC;
  v7[3] = &unk_2C3FC0;
  v7[4] = self;
  CFStringRef v4 = [(BCCardGripperView *)self actionProvider];
  double v5 = +[UIContextMenuConfiguration configurationWithIdentifier:0 previewProvider:v7 actionProvider:v4];

  return v5;
}

- (BCCardGripperViewAccessibilityDelegate)accessibilityDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_accessibilityDelegate);

  return (BCCardGripperViewAccessibilityDelegate *)WeakRetained;
}

- (void)setAccessibilityDelegate:(id)a3
{
}

- (CGSize)imageSize
{
  double width = self->_imageSize.width;
  double height = self->_imageSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (UIViewController)menuViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_menuViewController);

  return (UIViewController *)WeakRetained;
}

- (void)setMenuViewController:(id)a3
{
}

- (id)actionProvider
{
  return self->_actionProvider;
}

- (void)setActionProvider:(id)a3
{
}

- (UIView)button
{
  return self->_button;
}

- (void)setButton:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_button, 0);
  objc_storeStrong(&self->_actionProvider, 0);
  objc_destroyWeak((id *)&self->_menuViewController);

  objc_destroyWeak((id *)&self->_accessibilityDelegate);
}

@end
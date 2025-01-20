@interface BCNavigationBar
+ (double)padding;
+ (double)titlePadding;
- (BCNavigationBar)initWithCoder:(id)a3;
- (BCNavigationBar)initWithFrame:(CGRect)a3;
- (NSArray)leftItems;
- (NSArray)rightItems;
- (UINavigationItem)bc_item;
- (int64_t)_accessibilitySortPriority;
- (void)bc_commonInit;
- (void)setBackgroundHidden:(BOOL)a3;
- (void)setBc_item:(id)a3;
- (void)setHidden:(BOOL)a3;
- (void)setItems:(id)a3;
- (void)setItems:(id)a3 animated:(BOOL)a4;
- (void)setLeftItems:(id)a3;
- (void)setLeftItems:(id)a3 rightItems:(id)a4 title:(id)a5 animated:(BOOL)a6;
- (void)setLeftItems:(id)a3 rightItems:(id)a4 titleView:(id)a5 animated:(BOOL)a6;
- (void)setRightItems:(id)a3;
- (void)setSeparatorsVisible:(BOOL)a3;
- (void)setTitle:(id)a3;
@end

@implementation BCNavigationBar

- (BCNavigationBar)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)BCNavigationBar;
  v3 = -[BCNavigationBar initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    [(BCNavigationBar *)v3 bc_commonInit];
  }
  return v4;
}

- (BCNavigationBar)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)BCNavigationBar;
  v3 = [(BCNavigationBar *)&v6 initWithCoder:a3];
  v4 = v3;
  if (v3) {
    [(BCNavigationBar *)v3 bc_commonInit];
  }
  return v4;
}

+ (double)padding
{
  return 22.0;
}

+ (double)titlePadding
{
  return 16.0;
}

- (void)setHidden:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)BCNavigationBar;
  [(BCNavigationBar *)&v4 setHidden:a3];
  [(BCNavigationBar *)self setNeedsLayout];
}

- (void)setTitle:(id)a3
{
  id v4 = a3;
  v5 = [(BCNavigationBar *)self bc_item];
  [v5 setTitle:v4];

  id v6 = [(BCNavigationBar *)self bc_item];
  [v6 setTitleView:0];
}

- (void)setLeftItems:(id)a3
{
  id v4 = a3;
  id v5 = [(BCNavigationBar *)self bc_item];
  [v5 setLeftBarButtonItems:v4];
}

- (NSArray)leftItems
{
  v2 = [(BCNavigationBar *)self bc_item];
  v3 = [v2 leftBarButtonItems];

  return (NSArray *)v3;
}

- (void)setRightItems:(id)a3
{
  id v4 = a3;
  id v5 = [(BCNavigationBar *)self bc_item];
  [v5 setRightBarButtonItems:v4];
}

- (NSArray)rightItems
{
  v2 = [(BCNavigationBar *)self bc_item];
  v3 = [v2 rightBarButtonItems];

  return (NSArray *)v3;
}

- (void)setLeftItems:(id)a3 rightItems:(id)a4 titleView:(id)a5 animated:(BOOL)a6
{
  BOOL v6 = a6;
  id v16 = a5;
  id v10 = a4;
  id v11 = a3;
  v12 = [(BCNavigationBar *)self bc_item];
  [v12 setLeftBarButtonItems:v11 animated:v6];

  v13 = [(BCNavigationBar *)self bc_item];
  [v13 setRightBarButtonItems:v10 animated:v6];

  v14 = [(BCNavigationBar *)self bc_item];
  [v14 setTitle:0];

  v15 = [(BCNavigationBar *)self bc_item];
  [v15 setTitleView:v16];

  [v16 _accessibilitySetIsSpeakThisElement:0];
}

- (void)setLeftItems:(id)a3 rightItems:(id)a4 title:(id)a5 animated:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  v13 = [(BCNavigationBar *)self bc_item];
  [v13 setLeftBarButtonItems:v12 animated:v6];

  v14 = [(BCNavigationBar *)self bc_item];
  [v14 setRightBarButtonItems:v11 animated:v6];

  v15 = [(BCNavigationBar *)self bc_item];
  [v15 setTitle:v10];

  id v16 = [(BCNavigationBar *)self bc_item];
  [v16 setTitleView:0];
}

- (void)setSeparatorsVisible:(BOOL)a3
{
}

- (void)setBackgroundHidden:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(BCNavigationBar *)self bc_item];
  [v4 _setBackgroundHidden:v3];
}

- (void)setItems:(id)a3
{
  BOOL v3 = (objc_class *)objc_opt_class();
  v7 = NSStringFromClass(v3);
  BCReportAssertionFailureWithMessage((uint64_t)"/Library/Caches/com.apple.xbs/Sources/Alder/frameworks/BookCore/BookCore/Utilities/BCNavigationBar.m", 120, (uint64_t)"-[BCNavigationBar setItems:]", (uint64_t)"NO", @"%s is not supported by %@", v4, v5, v6, (uint64_t)"-[BCNavigationBar setItems:]");
}

- (void)setItems:(id)a3 animated:(BOOL)a4
{
  uint64_t v4 = (objc_class *)objc_opt_class();
  v8 = NSStringFromClass(v4);
  BCReportAssertionFailureWithMessage((uint64_t)"/Library/Caches/com.apple.xbs/Sources/Alder/frameworks/BookCore/BookCore/Utilities/BCNavigationBar.m", 125, (uint64_t)"-[BCNavigationBar setItems:animated:]", (uint64_t)"NO", @"%s is not supported by %@", v5, v6, v7, (uint64_t)"-[BCNavigationBar setItems:animated:]");
}

- (int64_t)_accessibilitySortPriority
{
  BOOL v3 = [(BCNavigationBar *)self nextResponder];
  NSClassFromString(@"BKPDFModernBookViewController");
  if (v3)
  {
    while ((objc_opt_isKindOfClass() & 1) == 0)
    {
      uint64_t v4 = [v3 nextResponder];

      BOOL v3 = (void *)v4;
      if (!v4) {
        goto LABEL_4;
      }
    }

    return 1000;
  }
  else
  {
LABEL_4:
    v6.receiver = self;
    v6.super_class = (Class)BCNavigationBar;
    return [(BCNavigationBar *)&v6 _accessibilitySortPriority];
  }
}

- (void)bc_commonInit
{
  BOOL v3 = (UINavigationItem *)objc_alloc_init((Class)UINavigationItem);
  bc_item = self->_bc_item;
  self->_bc_item = v3;

  uint64_t v7 = self->_bc_item;
  uint64_t v5 = +[NSArray arrayWithObjects:&v7 count:1];
  v6.receiver = self;
  v6.super_class = (Class)BCNavigationBar;
  [(BCNavigationBar *)&v6 setItems:v5 animated:0];
}

- (UINavigationItem)bc_item
{
  return self->_bc_item;
}

- (void)setBc_item:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
@interface WFKeyboardToolbarAccessoryView
- (BOOL)enableInputClicksWhenVisible;
- (BOOL)isPhoneUI;
- (NSArray)barItems;
- (UIToolbar)toolbar;
- (WFKeyboardToolbarAccessoryView)init;
- (double)borderedButtonWidthForButtonTitle:(id)a3 font:(id)a4;
- (double)inverseToolbarPadding;
- (double)keyboardButtonHeight;
- (id)borderedButtonItemWithTitle:(id)a3 target:(id)a4 action:(SEL)a5;
- (id)buttonImageWithSize:(CGSize)a3;
- (id)fixedSpaceItemOfWidth:(double)a3;
- (id)flexibleSpaceItem;
- (id)plainButtonItemWithTitle:(id)a3 bolded:(BOOL)a4 target:(id)a5 action:(SEL)a6;
- (void)appendBarItem:(id)a3;
- (void)drawRoundedRectangleInRect:(CGRect)a3 withContext:(CGContext *)a4 color:(id)a5 radius:(double)a6;
- (void)prependBarItem:(id)a3;
- (void)removeAllBarItems;
- (void)setBarItems:(id)a3;
@end

@implementation WFKeyboardToolbarAccessoryView

- (void).cxx_destruct
{
}

- (UIToolbar)toolbar
{
  return self->_toolbar;
}

- (BOOL)enableInputClicksWhenVisible
{
  return 1;
}

- (void)drawRoundedRectangleInRect:(CGRect)a3 withContext:(CGContext *)a4 color:(id)a5 radius:(double)a6
{
  double height = a3.size.height;
  double width = a3.size.width;
  double v9 = a3.origin.y;
  CGFloat y = a3.origin.y;
  double x = a3.origin.x;
  CGContextSetFillColorWithColor(a4, (CGColorRef)[a5 CGColor]);
  CGContextMoveToPoint(a4, x, v9 + a6);
  CGFloat v11 = v9 + height;
  CGContextAddLineToPoint(a4, x, v11 - a6);
  CGFloat v12 = x + a6;
  CGContextAddArc(a4, x + a6, v11 - a6, a6, 3.14159265, 1.57079633, 1);
  CGFloat v13 = x + width;
  CGContextAddLineToPoint(a4, v13 - a6, v11);
  CGContextAddArc(a4, v13 - a6, v11 - a6, a6, 1.57079633, 0.0, 1);
  CGContextAddLineToPoint(a4, v13, v9 + a6);
  CGContextAddArc(a4, v13 - a6, v9 + a6, a6, 0.0, -1.57079633, 1);
  CGContextAddLineToPoint(a4, v12, y);
  CGContextAddArc(a4, v12, v9 + a6, a6, -1.57079633, 3.14159265, 1);
  CGContextFillPath(a4);
}

- (id)buttonImageWithSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  if ([(WFKeyboardToolbarAccessoryView *)self isPhoneUI]) {
    double v6 = 4.0;
  }
  else {
    double v6 = 7.0;
  }
  v7 = [MEMORY[0x263F825C8] whiteColor];
  v8 = [MEMORY[0x263F825C8] colorWithRed:0.533 green:0.545 blue:0.561 alpha:1.0];
  v13.double width = width;
  v13.double height = height;
  UIGraphicsBeginImageContextWithOptions(v13, 0, 0.0);
  CurrentContext = UIGraphicsGetCurrentContext();
  CGContextSetBlendMode(CurrentContext, kCGBlendModeCopy);
  -[WFKeyboardToolbarAccessoryView drawRoundedRectangleInRect:withContext:color:radius:](self, "drawRoundedRectangleInRect:withContext:color:radius:", CurrentContext, v8, 0.0, 0.0, width, height, v6);
  -[WFKeyboardToolbarAccessoryView drawRoundedRectangleInRect:withContext:color:radius:](self, "drawRoundedRectangleInRect:withContext:color:radius:", CurrentContext, v7, 0.0, 0.0, width, height + -1.0, v6);
  v10 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();

  return v10;
}

- (id)fixedSpaceItemOfWidth:(double)a3
{
  v4 = (void *)[objc_alloc(MEMORY[0x263F824A8]) initWithBarButtonSystemItem:6 target:0 action:0];
  [v4 setWidth:a3];
  return v4;
}

- (id)flexibleSpaceItem
{
  v2 = (void *)[objc_alloc(MEMORY[0x263F824A8]) initWithBarButtonSystemItem:5 target:0 action:0];
  return v2;
}

- (id)borderedButtonItemWithTitle:(id)a3 target:(id)a4 action:(SEL)a5
{
  v8 = (void *)MEMORY[0x263F81708];
  id v9 = a4;
  id v10 = a3;
  CGFloat v11 = [v8 systemFontOfSize:14.0];
  [(WFKeyboardToolbarAccessoryView *)self borderedButtonWidthForButtonTitle:v10 font:v11];
  double v13 = v12;
  [(WFKeyboardToolbarAccessoryView *)self keyboardButtonHeight];
  double v15 = v14;
  v16 = -[WFKeyboardToolbarAccessoryView buttonImageWithSize:](self, "buttonImageWithSize:", v13, v14);
  v17 = [MEMORY[0x263F824E8] buttonWithType:0];
  objc_msgSend(v17, "setFrame:", 0.0, 0.0, v13, v15);
  v18 = [v17 titleLabel];
  [v18 setFont:v11];

  [v17 setBackgroundImage:v16 forState:0];
  [v17 setTitle:v10 forState:0];

  v19 = [MEMORY[0x263F825C8] blackColor];
  [v17 setTitleColor:v19 forState:0];

  [v17 addTarget:v9 action:a5 forControlEvents:64];
  v20 = (void *)[objc_alloc(MEMORY[0x263F824A8]) initWithCustomView:v17];

  return v20;
}

- (id)plainButtonItemWithTitle:(id)a3 bolded:(BOOL)a4 target:(id)a5 action:(SEL)a6
{
  id v10 = (void *)MEMORY[0x263F81708];
  id v11 = a5;
  id v12 = a3;
  if (a4) {
    [v10 boldSystemFontOfSize:16.0];
  }
  else {
  double v13 = [v10 systemFontOfSize:16.0];
  }
  [(WFKeyboardToolbarAccessoryView *)self borderedButtonWidthForButtonTitle:v12 font:v13];
  double v15 = v14;
  [(WFKeyboardToolbarAccessoryView *)self keyboardButtonHeight];
  double v17 = v16;
  v18 = [MEMORY[0x263F824E8] buttonWithType:1];
  objc_msgSend(v18, "setFrame:", 0.0, 0.0, v15, v17);
  v19 = [v18 titleLabel];
  [v19 setFont:v13];

  [v18 setTitle:v12 forState:0];
  [v18 addTarget:v11 action:a6 forControlEvents:64];

  v20 = (void *)[objc_alloc(MEMORY[0x263F824A8]) initWithCustomView:v18];
  return v20;
}

- (double)inverseToolbarPadding
{
  BOOL v2 = [(WFKeyboardToolbarAccessoryView *)self isPhoneUI];
  double result = -14.0;
  if (v2) {
    return -13.0;
  }
  return result;
}

- (double)keyboardButtonHeight
{
  BOOL v2 = [(WFKeyboardToolbarAccessoryView *)self isPhoneUI];
  double result = 34.0;
  if (v2) {
    return 30.0;
  }
  return result;
}

- (double)borderedButtonWidthForButtonTitle:(id)a3 font:(id)a4
{
  v15[1] = *MEMORY[0x263EF8340];
  uint64_t v14 = *MEMORY[0x263F814F0];
  v15[0] = a4;
  double v6 = NSDictionary;
  id v7 = a4;
  id v8 = a3;
  id v9 = [v6 dictionaryWithObjects:v15 forKeys:&v14 count:1];

  [v8 sizeWithAttributes:v9];
  double v11 = v10;

  BOOL v12 = [(WFKeyboardToolbarAccessoryView *)self isPhoneUI];
  double result = v11 + 17.0;
  if (!v12) {
    return 118.0;
  }
  return result;
}

- (BOOL)isPhoneUI
{
  BOOL v2 = [MEMORY[0x263F82670] currentDevice];
  BOOL v3 = [v2 userInterfaceIdiom] == 0;

  return v3;
}

- (void)removeAllBarItems
{
}

- (void)prependBarItem:(id)a3
{
  id v4 = a3;
  v5 = [(WFKeyboardToolbarAccessoryView *)self toolbar];
  double v6 = [v5 items];
  id v8 = (id)[v6 mutableCopy];

  [v8 insertObject:v4 atIndex:1];
  id v7 = [(WFKeyboardToolbarAccessoryView *)self toolbar];
  [v7 setItems:v8];
}

- (void)appendBarItem:(id)a3
{
  id v4 = a3;
  v5 = [(WFKeyboardToolbarAccessoryView *)self toolbar];
  id v8 = [v5 items];

  double v6 = (void *)[v8 mutableCopy];
  objc_msgSend(v6, "insertObject:atIndex:", v4, objc_msgSend(v8, "count") - 1);

  id v7 = [(WFKeyboardToolbarAccessoryView *)self toolbar];
  [v7 setItems:v6];
}

- (void)setBarItems:(id)a3
{
  id v4 = (void *)[a3 mutableCopy];
  v5 = v4;
  if (v4) {
    id v6 = v4;
  }
  else {
    id v6 = (id)objc_opt_new();
  }
  id v10 = v6;

  [(WFKeyboardToolbarAccessoryView *)self inverseToolbarPadding];
  id v7 = -[WFKeyboardToolbarAccessoryView fixedSpaceItemOfWidth:](self, "fixedSpaceItemOfWidth:");
  [v10 insertObject:v7 atIndex:0];

  [(WFKeyboardToolbarAccessoryView *)self inverseToolbarPadding];
  id v8 = -[WFKeyboardToolbarAccessoryView fixedSpaceItemOfWidth:](self, "fixedSpaceItemOfWidth:");
  [v10 addObject:v8];

  id v9 = [(WFKeyboardToolbarAccessoryView *)self toolbar];
  [v9 setItems:v10];
}

- (NSArray)barItems
{
  BOOL v2 = [(WFKeyboardToolbarAccessoryView *)self toolbar];
  BOOL v3 = [v2 items];
  id v4 = (void *)[v3 mutableCopy];

  [v4 removeObjectAtIndex:0];
  [v4 removeLastObject];
  if (v4) {
    v5 = v4;
  }
  else {
    v5 = (void *)MEMORY[0x263EFFA68];
  }
  id v6 = v5;

  return v6;
}

- (WFKeyboardToolbarAccessoryView)init
{
  [(WFKeyboardToolbarAccessoryView *)self keyboardButtonHeight];
  double v4 = v3 + 10.0;
  v5 = -[UIInputView initWithFrame:inputViewStyle:](self, "initWithFrame:inputViewStyle:", 0, 0.0, 0.0, 0.0, v3 + 10.0);
  if (v5)
  {
    id v6 = (UIToolbar *)objc_msgSend(objc_alloc(MEMORY[0x263F82D70]), "initWithFrame:", 0.0, 0.0, 0.0, v4);
    [(UIToolbar *)v6 setClipsToBounds:1];
    [(UIToolbar *)v6 setAutoresizingMask:6];
    id v7 = [MEMORY[0x263F825C8] clearColor];
    [(UIToolbar *)v6 setBackgroundColor:v7];

    id v8 = objc_opt_new();
    [(UIToolbar *)v6 setBackgroundImage:v8 forToolbarPosition:0 barMetrics:0];

    [(WFKeyboardToolbarAccessoryView *)v5 addSubview:v6];
    toolbar = v5->_toolbar;
    v5->_toolbar = v6;

    [(WFKeyboardToolbarAccessoryView *)v5 removeAllBarItems];
    id v10 = v5;
  }

  return v5;
}

@end
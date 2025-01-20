@interface ICHandwritingDebugWindow
+ (CGRect)preferredFrame;
+ (void)savePreferredFrame:(CGRect)a3;
- (BOOL)isDraggingWindow;
- (BOOL)isResizingWindow;
- (CGPoint)initialTouchLocation;
- (ICHandwritingDebugDelegate)delegate;
- (ICHandwritingDebugViewController)handwritingDebugViewController;
- (ICHandwritingDebugWindow)initWithDelegate:(id)a3;
- (UIView)resizeTriangle;
- (void)layoutSubviews;
- (void)refresh;
- (void)setDraggingWindow:(BOOL)a3;
- (void)setHandwritingDebugViewController:(id)a3;
- (void)setInitialTouchLocation:(CGPoint)a3;
- (void)setResizeTriangle:(id)a3;
- (void)setResizingWindow:(BOOL)a3;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
- (void)touchesMoved:(id)a3 withEvent:(id)a4;
- (void)updateResizeTriangleFrame;
@end

@implementation ICHandwritingDebugWindow

- (ICHandwritingDebugWindow)initWithDelegate:(id)a3
{
  id v4 = a3;
  [(id)objc_opt_class() preferredFrame];
  v37.receiver = self;
  v37.super_class = (Class)ICHandwritingDebugWindow;
  v5 = -[ICHandwritingDebugWindow initWithFrame:](&v37, sel_initWithFrame_);
  if (v5)
  {
    v6 = [[ICHandwritingDebugViewController alloc] initWithDelegate:v4];
    handwritingDebugViewController = v5->_handwritingDebugViewController;
    v5->_handwritingDebugViewController = v6;

    v8 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
    v9 = [(ICHandwritingDebugViewController *)v5->_handwritingDebugViewController view];
    [v9 setBackgroundColor:v8];

    v10 = (void *)[objc_alloc(MEMORY[0x1E4FB19E8]) initWithRootViewController:v5->_handwritingDebugViewController];
    [(ICHandwritingDebugWindow *)v5 setRootViewController:v10];
    v11 = [(ICHandwritingDebugWindow *)v5 rootViewController];
    v12 = [v11 view];
    v13 = [v12 layer];
    [v13 setCornerRadius:8.0];

    v14 = [(ICHandwritingDebugWindow *)v5 rootViewController];
    v15 = [v14 view];
    v16 = [v15 layer];
    [v16 setMasksToBounds:1];

    v17 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1EB0]), "initWithFrame:", 0.0, 0.0, 48.0, 48.0);
    [(ICHandwritingDebugWindow *)v5 setResizeTriangle:v17];

    CGAffineTransformMakeRotation(&v36, 0.785398163);
    v18 = [(ICHandwritingDebugWindow *)v5 resizeTriangle];
    CGAffineTransform v35 = v36;
    [v18 setTransform:&v35];

    v19 = [MEMORY[0x1E4FB1618] tintColor];
    v20 = [(ICHandwritingDebugWindow *)v5 resizeTriangle];
    [v20 setBackgroundColor:v19];

    v21 = [(ICHandwritingDebugWindow *)v5 resizeTriangle];
    v22 = [v21 layer];
    [v22 setZPosition:1000.0];

    v23 = [(ICHandwritingDebugWindow *)v5 rootViewController];
    v24 = [v23 view];
    v25 = [(ICHandwritingDebugWindow *)v5 resizeTriangle];
    [v24 addSubview:v25];

    v26 = [(ICHandwritingDebugWindow *)v5 layer];
    [v26 setCornerRadius:8.0];

    v27 = [(ICHandwritingDebugWindow *)v5 layer];
    LODWORD(v28) = 1050253722;
    [v27 setShadowOpacity:v28];

    v29 = [(ICHandwritingDebugWindow *)v5 layer];
    [v29 setShadowRadius:16.0];

    v30 = [(ICHandwritingDebugWindow *)v5 layer];
    objc_msgSend(v30, "setShadowOffset:", 0.0, 4.0);

    id v31 = [MEMORY[0x1E4FB1618] blackColor];
    uint64_t v32 = [v31 CGColor];
    v33 = [(ICHandwritingDebugWindow *)v5 layer];
    [v33 setShadowColor:v32];
  }
  return v5;
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)ICHandwritingDebugWindow;
  [(ICHandwritingDebugWindow *)&v3 layoutSubviews];
  [(ICHandwritingDebugWindow *)self updateResizeTriangleFrame];
}

- (void)updateResizeTriangleFrame
{
  id v11 = [(ICHandwritingDebugWindow *)self rootViewController];
  objc_super v3 = [v11 view];
  [v3 frame];
  double v5 = v4;
  v6 = [(ICHandwritingDebugWindow *)self rootViewController];
  v7 = [v6 view];
  [v7 frame];
  double v9 = v8;
  v10 = [(ICHandwritingDebugWindow *)self resizeTriangle];
  objc_msgSend(v10, "setCenter:", v5, v9);
}

- (ICHandwritingDebugDelegate)delegate
{
  v2 = [(ICHandwritingDebugWindow *)self handwritingDebugViewController];
  objc_super v3 = [v2 delegate];

  return (ICHandwritingDebugDelegate *)v3;
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  v17.receiver = self;
  v17.super_class = (Class)ICHandwritingDebugWindow;
  id v6 = a3;
  [(ICHandwritingDebugWindow *)&v17 touchesBegan:v6 withEvent:a4];
  v7 = objc_msgSend(v6, "anyObject", v17.receiver, v17.super_class);

  double v8 = [v7 view];
  double v9 = [(ICHandwritingDebugWindow *)self navigationController];
  v10 = [v9 navigationBar];
  int v11 = [v8 isDescendantOfView:v10];

  if (v11)
  {
    [(ICHandwritingDebugWindow *)self setDraggingWindow:1];
  }
  else
  {
    v12 = [v7 view];
    v13 = [(ICHandwritingDebugWindow *)self resizeTriangle];
    int v14 = [v12 isDescendantOfView:v13];

    if (v14) {
      [(ICHandwritingDebugWindow *)self setResizingWindow:1];
    }
  }
  v15 = [(ICHandwritingDebugWindow *)self navigationController];
  v16 = [v15 navigationBar];
  [v7 locationInView:v16];
  -[ICHandwritingDebugWindow setInitialTouchLocation:](self, "setInitialTouchLocation:");
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  v28.receiver = self;
  v28.super_class = (Class)ICHandwritingDebugWindow;
  id v6 = a3;
  [(ICHandwritingDebugWindow *)&v28 touchesMoved:v6 withEvent:a4];
  v7 = [(ICHandwritingDebugWindow *)self navigationController];
  double v8 = [v7 navigationBar];

  double v9 = [v6 anyObject];

  [v9 locationInView:v8];
  double v11 = v10;
  double v13 = v12;

  [(ICHandwritingDebugWindow *)self initialTouchLocation];
  double v15 = v11 - v14;
  [(ICHandwritingDebugWindow *)self initialTouchLocation];
  double v17 = v13 - v16;
  if ([(ICHandwritingDebugWindow *)self isDraggingWindow])
  {
    [(ICHandwritingDebugWindow *)self center];
    -[ICHandwritingDebugWindow setCenter:](self, "setCenter:", v15 + v18, v17 + v19);
  }
  else if ([(ICHandwritingDebugWindow *)self isResizingWindow])
  {
    [(ICHandwritingDebugWindow *)self frame];
    double v21 = v20;
    double v23 = v22;
    double v25 = v15 + v24;
    double v27 = v17 + v26;
    -[ICHandwritingDebugWindow setInitialTouchLocation:](self, "setInitialTouchLocation:", v11, v13);
    -[ICHandwritingDebugWindow setFrame:](self, "setFrame:", v21, v23, v25, v27);
  }
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  v6.receiver = self;
  v6.super_class = (Class)ICHandwritingDebugWindow;
  [(ICHandwritingDebugWindow *)&v6 touchesEnded:a3 withEvent:a4];
  [(ICHandwritingDebugWindow *)self setDraggingWindow:0];
  [(ICHandwritingDebugWindow *)self setResizingWindow:0];
  double v5 = objc_opt_class();
  [(ICHandwritingDebugWindow *)self frame];
  objc_msgSend(v5, "savePreferredFrame:");
}

- (void)refresh
{
  id v2 = [(ICHandwritingDebugWindow *)self handwritingDebugViewController];
  [v2 refresh];
}

+ (CGRect)preferredFrame
{
  id v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  uint64_t v3 = [v2 objectForKey:@"HandwritingWindowWidth"];
  double v4 = (void *)v3;
  double v5 = &unk_1F09A4328;
  if (v3) {
    double v5 = (void *)v3;
  }
  id v6 = v5;

  v7 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  uint64_t v8 = [v7 objectForKey:@"HandwritingWindowHeight"];
  double v9 = (void *)v8;
  double v10 = &unk_1F09A4340;
  if (v8) {
    double v10 = (void *)v8;
  }
  id v11 = v10;

  double v12 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  double v13 = [v12 objectForKey:@"HandwritingWindowX"];

  if (!v13)
  {
    double v14 = NSNumber;
    double v15 = [MEMORY[0x1E4FB1BA8] mainScreen];
    [v15 bounds];
    double v17 = v16;
    [v6 doubleValue];
    double v13 = [v14 numberWithDouble:v17 - v18 + -24.0];
  }
  double v19 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  double v20 = [v19 objectForKey:@"HandwritingWindowY"];

  if (!v20)
  {
    double v21 = NSNumber;
    double v22 = [MEMORY[0x1E4FB1BA8] mainScreen];
    [v22 bounds];
    double v24 = v23;
    [v11 doubleValue];
    double v20 = [v21 numberWithDouble:v24 - v25 + -44.0];
  }
  [v13 doubleValue];
  double v27 = v26;
  [v20 doubleValue];
  double v29 = v28;
  [v6 doubleValue];
  double v31 = v30;
  [v11 doubleValue];
  double v33 = v32;

  double v34 = v27;
  double v35 = v29;
  double v36 = v31;
  double v37 = v33;
  result.size.height = v37;
  result.size.width = v36;
  result.origin.y = v35;
  result.origin.x = v34;
  return result;
}

+ (void)savePreferredFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v7 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  [v7 setDouble:@"HandwritingWindowX" forKey:x];

  uint64_t v8 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  [v8 setDouble:@"HandwritingWindowY" forKey:y];

  double v9 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  [v9 setDouble:@"HandwritingWindowWidth" forKey:width];

  id v10 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  [v10 setDouble:@"HandwritingWindowHeight" forKey:height];
}

- (BOOL)isDraggingWindow
{
  return self->_draggingWindow;
}

- (void)setDraggingWindow:(BOOL)a3
{
  self->_draggingWindow = a3;
}

- (BOOL)isResizingWindow
{
  return self->_resizingWindow;
}

- (void)setResizingWindow:(BOOL)a3
{
  self->_resizingWindow = a3;
}

- (CGPoint)initialTouchLocation
{
  double x = self->_initialTouchLocation.x;
  double y = self->_initialTouchLocation.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setInitialTouchLocation:(CGPoint)a3
{
  self->_initialTouchLocation = a3;
}

- (UIView)resizeTriangle
{
  return self->_resizeTriangle;
}

- (void)setResizeTriangle:(id)a3
{
}

- (ICHandwritingDebugViewController)handwritingDebugViewController
{
  return self->_handwritingDebugViewController;
}

- (void)setHandwritingDebugViewController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_handwritingDebugViewController, 0);
  objc_storeStrong((id *)&self->_resizeTriangle, 0);
}

@end
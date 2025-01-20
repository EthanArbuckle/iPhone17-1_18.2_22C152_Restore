@interface RPTWindowCoordinateSpaceConverter
- (CGPoint)convertPoint:(CGPoint)a3;
- (CGRect)convertRect:(CGRect)a3;
- (CGSize)convertSize:(CGSize)a3;
- (CGVector)convertVector:(CGVector)a3;
- (UIScreen)screen;
- (UIWindow)window;
- (id)initFromWindow:(id)a3 toScreen:(id)a4;
- (id)nsScreen;
- (void)setNsScreen:(id)a3;
- (void)setScreen:(id)a3;
- (void)setWindow:(id)a3;
@end

@implementation RPTWindowCoordinateSpaceConverter

- (id)initFromWindow:(id)a3 toScreen:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)RPTWindowCoordinateSpaceConverter;
  v9 = [(RPTWindowCoordinateSpaceConverter *)&v12 init];
  p_isa = (id *)&v9->super.super.isa;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_window, a3);
    objc_storeStrong(p_isa + 2, a4);
  }

  return p_isa;
}

- (CGPoint)convertPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  v6 = [MEMORY[0x1E4F28F80] processInfo];
  int v7 = [v6 isiOSAppOnMac];

  if (v7)
  {
    id v8 = [(RPTWindowCoordinateSpaceConverter *)self window];
    v9 = [v8 nsWindowProxy];
    objc_msgSend(v9, "convertPointFromUIWindow:", x, y);
    double v11 = v10;
    double v13 = v12;

    v14 = [(RPTWindowCoordinateSpaceConverter *)self window];
    v15 = [v14 nsWindowProxy];
    objc_msgSend(v15, "convertPointToScreen:", v11, v13);
    double v17 = v16;
    double v19 = v18;

    v20 = [(RPTWindowCoordinateSpaceConverter *)self window];
    v21 = [v20 nsScreen];
    [v21 frame];
    double v22 = CGRectGetHeight(v29) - v19;
  }
  else
  {
    window = self->_window;
    v20 = [(UIScreen *)self->_screen fixedCoordinateSpace];
    -[UIWindow convertPoint:toCoordinateSpace:](window, "convertPoint:toCoordinateSpace:", v20, x, y);
    double v17 = v24;
    double v22 = v25;
  }

  double v26 = v17;
  double v27 = v22;
  result.double y = v27;
  result.double x = v26;
  return result;
}

- (CGSize)convertSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  window = self->_window;
  v6 = [(UIScreen *)self->_screen fixedCoordinateSpace];
  -[UIWindow convertRect:toCoordinateSpace:](window, "convertRect:toCoordinateSpace:", v6, 0.0, 0.0, width, height);
  double v8 = v7;
  double v10 = v9;

  double v11 = v8;
  double v12 = v10;
  result.double height = v12;
  result.double width = v11;
  return result;
}

- (CGRect)convertRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  window = self->_window;
  double v8 = [(UIScreen *)self->_screen fixedCoordinateSpace];
  -[UIWindow convertRect:toCoordinateSpace:](window, "convertRect:toCoordinateSpace:", v8, x, y, width, height);
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;

  double v17 = v10;
  double v18 = v12;
  double v19 = v14;
  double v20 = v16;
  result.size.double height = v20;
  result.size.double width = v19;
  result.origin.double y = v18;
  result.origin.double x = v17;
  return result;
}

- (CGVector)convertVector:(CGVector)a3
{
  ddouble y = a3.dy;
  ddouble x = a3.dx;
  -[RPTWindowCoordinateSpaceConverter convertPoint:](self, "convertPoint:", *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8));
  double v7 = v6;
  double v9 = v8;
  -[RPTWindowCoordinateSpaceConverter convertPoint:](self, "convertPoint:", dx, dy);
  double v11 = v10 - v7;
  double v13 = v12 - v9;
  result.ddouble y = v13;
  result.ddouble x = v11;
  return result;
}

- (UIWindow)window
{
  return self->_window;
}

- (void)setWindow:(id)a3
{
}

- (UIScreen)screen
{
  return self->_screen;
}

- (void)setScreen:(id)a3
{
}

- (id)nsScreen
{
  return self->_nsScreen;
}

- (void)setNsScreen:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_nsScreen, 0);
  objc_storeStrong((id *)&self->_screen, 0);
  objc_storeStrong((id *)&self->_window, 0);
}

@end
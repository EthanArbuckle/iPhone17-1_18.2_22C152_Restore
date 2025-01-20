@interface _UIMIDebugPointerView
- (_UIMIDebugPointerView)initWithFrame:(CGRect)a3;
- (void)setBounds:(CGRect)a3;
@end

@implementation _UIMIDebugPointerView

- (_UIMIDebugPointerView)initWithFrame:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  v22.receiver = self;
  v22.super_class = (Class)_UIMIDebugPointerView;
  v7 = -[UIView initWithFrame:](&v22, sel_initWithFrame_);
  if (v7)
  {
    v23.origin.CGFloat x = x;
    v23.origin.CGFloat y = y;
    v23.size.CGFloat width = width;
    v23.size.CGFloat height = height;
    [(UIView *)v7 _setCornerRadius:CGRectGetHeight(v23) * 0.5];
    v8 = [(UIView *)v7 layer];
    [v8 setAllowsEdgeAntialiasing:1];

    v9 = [(UIView *)v7 layer];
    [v9 setBorderWidth:1.0];

    id v10 = +[UIColor redColor];
    uint64_t v11 = [v10 CGColor];
    v12 = [(UIView *)v7 layer];
    [v12 setBorderColor:v11];

    [(UIView *)v7 setClipsToBounds:0];
    v13 = [UIView alloc];
    [(UIView *)v7 bounds];
    uint64_t v14 = -[UIView initWithFrame:](v13, "initWithFrame:");
    actualPointer = v7->_actualPointer;
    v7->_actualPointer = (UIView *)v14;

    v24.origin.CGFloat x = x;
    v24.origin.CGFloat y = y;
    v24.size.CGFloat width = width;
    v24.size.CGFloat height = height;
    [(UIView *)v7->_actualPointer _setCornerRadius:CGRectGetHeight(v24) * 0.5];
    v16 = [(UIView *)v7->_actualPointer layer];
    [v16 setAllowsEdgeAntialiasing:1];

    id v17 = +[UIColor systemBlueColor];
    uint64_t v18 = [v17 CGColor];
    v19 = [(UIView *)v7->_actualPointer layer];
    [v19 setBorderColor:v18];

    v20 = [(UIView *)v7->_actualPointer layer];
    [v20 setBorderWidth:1.0];

    [(UIView *)v7 addSubview:v7->_actualPointer];
  }
  return v7;
}

- (void)setBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  -[UIView setFrame:](self->_actualPointer, "setFrame:", a3.origin.x, a3.origin.y);
  [(UIView *)self bounds];
  actualPointer = self->_actualPointer;
  if (width == v8 && height == v6) {
    id v10 = (uint64_t *)MEMORY[0x1E4F39EA0];
  }
  else {
    id v10 = (uint64_t *)MEMORY[0x1E4F39EA8];
  }
  uint64_t v11 = *v10;
  id v12 = [(UIView *)actualPointer layer];
  [v12 setCornerCurve:v11];
}

- (void).cxx_destruct
{
}

@end
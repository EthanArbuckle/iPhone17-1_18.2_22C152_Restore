@interface _NTKKeylinePathView
- (CGSize)sizeThatFits:(CGSize)a3;
- (NTKKeylineTouchable)touchable;
- (_NTKKeylinePathView)initWithPath:(id)a3 secondPath:(id)a4 scale:(double)a5;
- (void)drawRect:(CGRect)a3;
- (void)setTouchable:(id)a3;
@end

@implementation _NTKKeylinePathView

- (_NTKKeylinePathView)initWithPath:(id)a3 secondPath:(id)a4 scale:(double)a5
{
  id v9 = a3;
  id v10 = a4;
  v18.receiver = self;
  v18.super_class = (Class)_NTKKeylinePathView;
  v11 = -[CLKUIColoringView initWithFrame:](&v18, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  if (v11)
  {
    memset(&v17, 0, sizeof(v17));
    CGAffineTransformMakeScale(&v17, a5, a5);
    CGAffineTransform location = v17;
    [v9 applyTransform:&location];
    CGAffineTransform location = v17;
    [v10 applyTransform:&location];
    objc_storeStrong((id *)&v11->_path, a3);
    objc_storeStrong((id *)&v11->_secondPath, a4);
    objc_initWeak((id *)&location, v11);
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __53___NTKKeylinePathView_initWithPath_secondPath_scale___block_invoke;
    v14[3] = &unk_1E62C2E30;
    objc_copyWeak(&v15, (id *)&location);
    v12 = +[NTKKeylineTouchable touchableWithHandler:v14];
    [(_NTKKeylinePathView *)v11 setTouchable:v12];

    objc_destroyWeak(&v15);
    objc_destroyWeak((id *)&location);
  }

  return v11;
}

- (void)drawRect:(CGRect)a3
{
  [(_NTKKeylinePathView *)self bounds];
  if (!CGRectIsEmpty(v7))
  {
    v4 = [(_NTKKeylinePathView *)self contentColor];
    [v4 set];

    [(UIBezierPath *)self->_path setLineWidth:1.5];
    [(UIBezierPath *)self->_path stroke];
    [(UIBezierPath *)self->_secondPath setLineWidth:1.5];
    secondPath = self->_secondPath;
    [(UIBezierPath *)secondPath stroke];
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  [(UIBezierPath *)self->_path bounds];
  double v4 = v3 + 1.5;
  double v6 = v5 + 1.5;
  result.height = v6;
  result.width = v4;
  return result;
}

- (NTKKeylineTouchable)touchable
{
  return self->touchable;
}

- (void)setTouchable:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->touchable, 0);
  objc_storeStrong((id *)&self->_secondPath, 0);

  objc_storeStrong((id *)&self->_path, 0);
}

@end
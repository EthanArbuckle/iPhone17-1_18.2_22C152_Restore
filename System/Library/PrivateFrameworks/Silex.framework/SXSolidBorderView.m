@interface SXSolidBorderView
- (SXSolidBorderView)initWithStrokeStyle:(id)a3;
- (SXStrokeStyle)strokeStyle;
@end

@implementation SXSolidBorderView

- (SXSolidBorderView)initWithStrokeStyle:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SXSolidBorderView;
  v6 = [(SXSolidBorderView *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_strokeStyle, a3);
    v8 = [v5 color];
    [(SXSolidBorderView *)v7 setBackgroundColor:v8];
  }
  return v7;
}

- (SXStrokeStyle)strokeStyle
{
  return self->_strokeStyle;
}

- (void).cxx_destruct
{
}

@end
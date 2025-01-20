@interface SXFillView
- (CGRect)contentFrame;
- (CGRect)fillFrameWithBoundingSize:(CGSize)a3;
- (CGRect)originalFrame;
- (SXDraggable)dragable;
- (SXFill)fill;
- (SXFillView)initWithFill:(id)a3;
- (void)setOriginalFrame:(CGRect)a3;
@end

@implementation SXFillView

- (SXFillView)initWithFill:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SXFillView;
  v6 = -[SXFillView initWithFrame:](&v9, sel_initWithFrame_, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_fill, a3);
  }

  return v7;
}

- (CGRect)fillFrameWithBoundingSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  double v5 = 0.0;
  double v6 = 0.0;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.y = v6;
  result.origin.x = v5;
  return result;
}

- (CGRect)contentFrame
{
  double v2 = *MEMORY[0x263F001A8];
  double v3 = *(double *)(MEMORY[0x263F001A8] + 8);
  double v4 = *(double *)(MEMORY[0x263F001A8] + 16);
  double v5 = *(double *)(MEMORY[0x263F001A8] + 24);
  result.size.double height = v5;
  result.size.double width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (SXFill)fill
{
  return self->_fill;
}

- (CGRect)originalFrame
{
  double x = self->_originalFrame.origin.x;
  double y = self->_originalFrame.origin.y;
  double width = self->_originalFrame.size.width;
  double height = self->_originalFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setOriginalFrame:(CGRect)a3
{
  self->_originalFrame = a3;
}

- (SXDraggable)dragable
{
  return self->_dragable;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dragable, 0);
  objc_storeStrong((id *)&self->_fill, 0);
}

@end
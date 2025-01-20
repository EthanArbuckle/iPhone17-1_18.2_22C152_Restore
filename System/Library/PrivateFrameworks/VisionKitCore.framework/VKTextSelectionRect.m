@interface VKTextSelectionRect
- (BOOL)containsEnd;
- (BOOL)containsPoint:(CGPoint)a3;
- (BOOL)containsStart;
- (BOOL)isVertical;
- (CGRect)rect;
- (NSString)_transcript;
- (UIBezierPath)_path;
- (VKQuad)quad;
- (VKTextSelectionRect)initWithRect:(CGRect)a3 containsStart:(BOOL)a4 containsEnd:(BOOL)a5 layoutDirection:(unint64_t)a6 quad:(id)a7;
- (VKTextSelectionRectCustomHandleInfo)_customHandleInfo;
- (id)handleInfoForQuad:(id)a3 origin:(CGPoint)a4;
- (id)summaryDescription;
- (int64_t)writingDirection;
- (unint64_t)layoutDirection;
- (void)setContainsEnd:(BOOL)a3;
- (void)setContainsStart:(BOOL)a3;
- (void)setLayoutDirection:(unint64_t)a3;
- (void)setRect:(CGRect)a3;
- (void)set_customHandleInfo:(id)a3;
- (void)set_path:(id)a3;
- (void)set_transcript:(id)a3;
@end

@implementation VKTextSelectionRect

- (VKTextSelectionRect)initWithRect:(CGRect)a3 containsStart:(BOOL)a4 containsEnd:(BOOL)a5 layoutDirection:(unint64_t)a6 quad:(id)a7
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v16 = a7;
  v24.receiver = self;
  v24.super_class = (Class)VKTextSelectionRect;
  v17 = [(VKTextSelectionRect *)&v24 init];
  v18 = v17;
  if (v17)
  {
    v17->_rect.origin.double x = x;
    v17->_rect.origin.double y = y;
    v17->_rect.size.CGFloat width = width;
    v17->_rect.size.CGFloat height = height;
    v17->_containsStart = a4;
    v17->_containsEnd = a5;
    v17->_layoutDirection = a6;
    uint64_t v19 = [v16 path];
    path = v18->__path;
    v18->__path = (UIBezierPath *)v19;

    uint64_t v21 = -[VKTextSelectionRect handleInfoForQuad:origin:](v18, "handleInfoForQuad:origin:", v16, x, y);
    customHandleInfo = v18->__customHandleInfo;
    v18->__customHandleInfo = (VKTextSelectionRectCustomHandleInfo *)v21;

    objc_storeStrong((id *)&v18->_quad, a7);
  }

  return v18;
}

- (id)handleInfoForQuad:(id)a3 origin:(CGPoint)a4
{
  double x = a4.x;
  id v5 = a3;
  v6 = objc_alloc_init(VKTextSelectionRectCustomHandleInfo);
  [v5 bottomLeft];
  [(VKTextSelectionRectCustomHandleInfo *)v6 setBottomLeft:VKMAddPoints(v7, v8, x)];
  [v5 bottomRight];
  [(VKTextSelectionRectCustomHandleInfo *)v6 setBottomRight:VKMAddPoints(v9, v10, x)];
  [v5 topLeft];
  [(VKTextSelectionRectCustomHandleInfo *)v6 setTopLeft:VKMAddPoints(v11, v12, x)];
  [v5 topRight];
  double v14 = v13;
  double v16 = v15;

  [(VKTextSelectionRectCustomHandleInfo *)v6 setTopRight:VKMAddPoints(v14, v16, x)];
  return v6;
}

- (BOOL)containsPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  [(VKTextSelectionRect *)self rect];
  double v6 = v15.origin.x;
  v14.double x = x;
  v14.double y = y;
  BOOL v7 = CGRectContainsPoint(v15, v14);
  if (v7)
  {
    double v8 = VKMSubtractPoints(x, y, v6);
    double v10 = v9;
    double v11 = [(VKTextSelectionRect *)self quad];
    char v12 = objc_msgSend(v11, "containsPoint:", v8, v10);

    LOBYTE(v7) = v12;
  }
  return v7;
}

- (id)summaryDescription
{
  v2 = NSString;
  [(VKTextSelectionRect *)self rect];
  BOOL v7 = VKMUIStringForRect(v3, v4, v5, v6);
  double v8 = [v2 stringWithFormat:@"%@", v7];

  return v8;
}

- (BOOL)isVertical
{
  return [(VKTextSelectionRect *)self layoutDirection] == 5;
}

- (int64_t)writingDirection
{
  return (([(VKTextSelectionRect *)self layoutDirection] - 2) & 0xFFFFFFFFFFFFFFFDLL) == 0;
}

- (CGRect)rect
{
  double x = self->_rect.origin.x;
  double y = self->_rect.origin.y;
  double width = self->_rect.size.width;
  double height = self->_rect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setRect:(CGRect)a3
{
  self->_rect = a3;
}

- (BOOL)containsStart
{
  return self->_containsStart;
}

- (void)setContainsStart:(BOOL)a3
{
  self->_containsStart = a3;
}

- (BOOL)containsEnd
{
  return self->_containsEnd;
}

- (void)setContainsEnd:(BOOL)a3
{
  self->_containsEnd = a3;
}

- (UIBezierPath)_path
{
  return self->__path;
}

- (void)set_path:(id)a3
{
}

- (VKTextSelectionRectCustomHandleInfo)_customHandleInfo
{
  return self->__customHandleInfo;
}

- (void)set_customHandleInfo:(id)a3
{
}

- (VKQuad)quad
{
  return self->_quad;
}

- (unint64_t)layoutDirection
{
  return self->_layoutDirection;
}

- (void)setLayoutDirection:(unint64_t)a3
{
  self->_layoutDirection = a3;
}

- (NSString)_transcript
{
  return self->__transcript;
}

- (void)set_transcript:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__transcript, 0);
  objc_storeStrong((id *)&self->_quad, 0);
  objc_storeStrong((id *)&self->__customHandleInfo, 0);
  objc_storeStrong((id *)&self->__path, 0);
}

@end
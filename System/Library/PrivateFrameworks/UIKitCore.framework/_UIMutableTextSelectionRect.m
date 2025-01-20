@interface _UIMutableTextSelectionRect
+ (id)selectionRectWithRect:(CGRect)a3 fromView:(id)a4;
- (BOOL)_drawsOwnHighlight;
- (BOOL)_ui_isKindOfTextSelectionRect;
- (BOOL)containsEnd;
- (BOOL)containsStart;
- (BOOL)isEqual:(id)a3;
- (BOOL)isVertical;
- (CGAffineTransform)transform;
- (CGRect)rect;
- (UIBezierPath)_path;
- (UITextSelectionRectCustomHandleInfo)_customHandleInfo;
- (_UIMutableTextSelectionRect)init;
- (id)description;
- (int64_t)writingDirection;
- (unint64_t)hash;
- (void)_setDrawsOwnHighlight:(BOOL)a3;
- (void)setContainsEnd:(BOOL)a3;
- (void)setContainsStart:(BOOL)a3;
- (void)setIsVertical:(BOOL)a3;
- (void)setRect:(CGRect)a3 fromView:(id)a4;
- (void)setTransform:(CGAffineTransform *)a3;
- (void)setWritingDirection:(int64_t)a3;
- (void)set_customHandleInfo:(id)a3;
- (void)set_path:(id)a3;
@end

@implementation _UIMutableTextSelectionRect

- (unint64_t)hash
{
  v2 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGRect:", self->_rect.origin.x, self->_rect.origin.y, self->_rect.size.width, self->_rect.size.height);
  unint64_t v3 = [v2 hash];

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__customHandleInfo, 0);
  objc_storeStrong((id *)&self->__path, 0);
}

- (void)setIsVertical:(BOOL)a3
{
  self->_isVertical = a3;
}

- (void)setContainsStart:(BOOL)a3
{
  self->_containsStart = a3;
}

- (void)setContainsEnd:(BOOL)a3
{
  self->_containsEnd = a3;
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

+ (id)selectionRectWithRect:(CGRect)a3 fromView:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v8 = a4;
  v9 = objc_opt_new();
  objc_msgSend(v9, "setRect:fromView:", v8, x, y, width, height);

  [v9 setWritingDirection:0];
  return v9;
}

- (void)setWritingDirection:(int64_t)a3
{
  self->_writingDirection = a3;
}

- (void)setRect:(CGRect)a3 fromView:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v15 = a4;
  v17.origin.double x = x;
  v17.origin.double y = y;
  v17.size.double width = width;
  v17.size.double height = height;
  if (CGRectIsNull(v17)
    || (v18.origin.double x = x, v18.origin.y = y, v18.size.width = width, v18.size.height = height, CGRectIsInfinite(v18)))
  {
    p_rect = &self->_rect;
    p_rect->origin.double x = x;
  }
  else
  {
    p_rect = &self->_rect;
    [v15 _currentScreenScale];
    double v11 = UIRectRoundToScale(x, y, width, height, v10);
    double y = v12;
    double width = v13;
    double height = v14;
    p_rect->origin.double x = v11;
  }
  p_rect->origin.double y = y;
  p_rect->size.double width = width;
  p_rect->size.double height = height;
}

- (_UIMutableTextSelectionRect)init
{
  v5.receiver = self;
  v5.super_class = (Class)_UIMutableTextSelectionRect;
  CGRect result = [(_UIMutableTextSelectionRect *)&v5 init];
  if (result)
  {
    uint64_t v3 = MEMORY[0x1E4F1DAB8];
    long long v4 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    *(_OWORD *)&result->_transform.a = *MEMORY[0x1E4F1DAB8];
    *(_OWORD *)&result->_transform.c = v4;
    *(_OWORD *)&result->_transform.tdouble x = *(_OWORD *)(v3 + 32);
  }
  return result;
}

- (UIBezierPath)_path
{
  return self->__path;
}

- (int64_t)writingDirection
{
  return self->_writingDirection;
}

- (CGAffineTransform)transform
{
  long long v3 = *(_OWORD *)&self[2].b;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[1].ty;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tdouble x = *(_OWORD *)&self[2].d;
  return self;
}

- (void)set_path:(id)a3
{
}

- (void)set_customHandleInfo:(id)a3
{
}

- (void)setTransform:(CGAffineTransform *)a3
{
  long long v4 = *(_OWORD *)&a3->c;
  long long v3 = *(_OWORD *)&a3->tx;
  *(_OWORD *)&self->_transform.a = *(_OWORD *)&a3->a;
  *(_OWORD *)&self->_transform.c = v4;
  *(_OWORD *)&self->_transform.tdouble x = v3;
}

- (BOOL)isVertical
{
  return self->_isVertical;
}

- (BOOL)containsStart
{
  return self->_containsStart;
}

- (BOOL)containsEnd
{
  return self->_containsEnd;
}

- (void)_setDrawsOwnHighlight:(BOOL)a3
{
  self->__drawsOwnHighlight = a3;
}

- (BOOL)_drawsOwnHighlight
{
  return self->__drawsOwnHighlight;
}

- (UITextSelectionRectCustomHandleInfo)_customHandleInfo
{
  return self->__customHandleInfo;
}

- (id)description
{
  long long v3 = NSString;
  uint64_t v4 = objc_opt_class();
  objc_super v5 = NSStringFromCGRect(self->_rect);
  v6 = [v3 stringWithFormat:@"<%@: %p rect = %@>", v4, self, v5];;

  return v6;
}

- (BOOL)_ui_isKindOfTextSelectionRect
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (_UIMutableTextSelectionRect *)a3;
  objc_super v5 = v4;
  if (v4 == self)
  {
    BOOL v6 = 1;
  }
  else if ([(_UIMutableTextSelectionRect *)v4 _ui_isKindOfTextSelectionRect])
  {
    v8.receiver = self;
    v8.super_class = (Class)_UIMutableTextSelectionRect;
    BOOL v6 = [(UITextSelectionRect *)&v8 isEqual:v5];
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

@end
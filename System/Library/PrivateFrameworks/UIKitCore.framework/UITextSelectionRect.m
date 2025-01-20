@interface UITextSelectionRect
+ (BOOL)endIsHorizontal:(id)a3;
+ (BOOL)startIsHorizontal:(id)a3;
+ (CGRect)endEdgeFromRects:(id)a3;
+ (CGRect)startEdgeFromRects:(id)a3;
+ (id)endCustomSelectionPathFromRects:(id)a3;
+ (id)endRectFromRects:(id)a3;
+ (id)startCustomSelectionPathFromRects:(id)a3;
+ (id)startRectFromRects:(id)a3;
- (BOOL)_drawsOwnHighlight;
- (BOOL)containsEnd;
- (BOOL)containsStart;
- (BOOL)isEqual:(id)a3;
- (BOOL)isVertical;
- (CGAffineTransform)transform;
- (CGRect)_endEdgeRect;
- (CGRect)_startEdgeRect;
- (CGRect)rect;
- (NSValue)_transform;
- (NSWritingDirection)writingDirection;
- (UIBezierPath)_path;
- (UISelectionGrabberCustomPath)_endCustomSelectionPath;
- (UISelectionGrabberCustomPath)_startCustomSelectionPath;
- (UITextSelectionRectCustomHandleInfo)_customHandleInfo;
- (UITextSelectionRectImpl)_isImpl;
- (double)baselineOffset;
- (id)mutableCopy;
- (id)range;
- (unint64_t)hash;
- (void)_appendToPath:(CGPath *)a3 cornerRadius:(double)a4 edgeInsets:(UIEdgeInsets)a5;
- (void)_setTransform:(id)a3;
- (void)setBaselineOffset:(double)a3;
@end

@implementation UITextSelectionRect

- (void).cxx_destruct
{
}

- (id)mutableCopy
{
  [(UITextSelectionRect *)self rect];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  v11 = +[UIWindow _applicationKeyWindow];
  v12 = +[_UIMutableTextSelectionRect selectionRectWithRect:fromView:](_UIMutableTextSelectionRect, "selectionRectWithRect:fromView:", v11, v4, v6, v8, v10);

  objc_msgSend(v12, "_setDrawsOwnHighlight:", -[UITextSelectionRect _drawsOwnHighlight](self, "_drawsOwnHighlight"));
  v13 = [(UITextSelectionRect *)self _customHandleInfo];
  objc_msgSend(v12, "set_customHandleInfo:", v13);

  objc_msgSend(v12, "setWritingDirection:", -[UITextSelectionRect writingDirection](self, "writingDirection"));
  objc_msgSend(v12, "setContainsStart:", -[UITextSelectionRect containsStart](self, "containsStart"));
  objc_msgSend(v12, "setContainsEnd:", -[UITextSelectionRect containsEnd](self, "containsEnd"));
  objc_msgSend(v12, "setIsVertical:", -[UITextSelectionRect isVertical](self, "isVertical"));
  [(UITextSelectionRect *)self transform];
  v16[0] = v16[3];
  v16[1] = v16[4];
  v16[2] = v16[5];
  [v12 setTransform:v16];
  v14 = [(UITextSelectionRect *)self _path];
  objc_msgSend(v12, "set_path:", v14);

  return v12;
}

+ (id)startRectFromRects:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if ([v3 count]
    && ([v3 lastObject],
        double v4 = objc_claimAutoreleasedReturnValue(),
        objc_opt_class(),
        char isKindOfClass = objc_opt_isKindOfClass(),
        v4,
        (isKindOfClass & 1) != 0))
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v6 = v3;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v15;
      while (2)
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v15 != v9) {
            objc_enumerationMutation(v6);
          }
          v11 = *(void **)(*((void *)&v14 + 1) + 8 * i);
          if (objc_msgSend(v11, "containsStart", (void)v14))
          {
            id v12 = v11;

            goto LABEL_14;
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }

    id v12 = [v6 objectAtIndex:0];
  }
  else
  {
    id v12 = 0;
  }
LABEL_14:

  return v12;
}

+ (CGRect)startEdgeFromRects:(id)a3
{
  id v3 = [a1 startRectFromRects:a3];
  [v3 _startEdgeRect];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  double v12 = v5;
  double v13 = v7;
  double v14 = v9;
  double v15 = v11;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

+ (id)endRectFromRects:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if ([v3 count]
    && ([v3 lastObject],
        double v4 = objc_claimAutoreleasedReturnValue(),
        objc_opt_class(),
        char isKindOfClass = objc_opt_isKindOfClass(),
        v4,
        (isKindOfClass & 1) != 0))
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v6 = v3;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v15;
      while (2)
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v15 != v9) {
            objc_enumerationMutation(v6);
          }
          double v11 = *(void **)(*((void *)&v14 + 1) + 8 * i);
          if (objc_msgSend(v11, "containsEnd", (void)v14))
          {
            id v12 = v11;

            goto LABEL_14;
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }

    id v12 = [v6 lastObject];
  }
  else
  {
    id v12 = 0;
  }
LABEL_14:

  return v12;
}

+ (CGRect)endEdgeFromRects:(id)a3
{
  id v3 = [a1 endRectFromRects:a3];
  [v3 _endEdgeRect];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  double v12 = v5;
  double v13 = v7;
  double v14 = v9;
  double v15 = v11;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

+ (id)startCustomSelectionPathFromRects:(id)a3
{
  id v3 = [a1 startRectFromRects:a3];
  double v4 = [v3 _endCustomSelectionPath];

  return v4;
}

+ (id)endCustomSelectionPathFromRects:(id)a3
{
  id v3 = [a1 endRectFromRects:a3];
  double v4 = [v3 _endCustomSelectionPath];

  return v4;
}

+ (BOOL)startIsHorizontal:(id)a3
{
  id v3 = [a1 startRectFromRects:a3];
  char v4 = [v3 isVertical] ^ 1;

  return v4;
}

+ (BOOL)endIsHorizontal:(id)a3
{
  id v3 = [a1 endRectFromRects:a3];
  char v4 = [v3 isVertical] ^ 1;

  return v4;
}

- (UISelectionGrabberCustomPath)_startCustomSelectionPath
{
  id v3 = [(UITextSelectionRect *)self _customHandleInfo];
  if (!v3)
  {
    char v4 = 0;
    goto LABEL_8;
  }
  char v4 = objc_alloc_init(UISelectionGrabberCustomPath);
  NSWritingDirection v5 = [(UITextSelectionRect *)self writingDirection];
  if ((unint64_t)(v5 + 1) >= 2)
  {
    if (v5 != NSWritingDirectionRightToLeft) {
      goto LABEL_8;
    }
    [v3 topRight];
    -[UISelectionGrabberCustomPath setTopPoint:](v4, "setTopPoint:");
    [v3 bottomRight];
  }
  else
  {
    [v3 topLeft];
    -[UISelectionGrabberCustomPath setTopPoint:](v4, "setTopPoint:");
    [v3 bottomLeft];
  }
  -[UISelectionGrabberCustomPath setBottomPoint:](v4, "setBottomPoint:");
LABEL_8:

  return v4;
}

- (UISelectionGrabberCustomPath)_endCustomSelectionPath
{
  id v3 = [(UITextSelectionRect *)self _customHandleInfo];
  if (!v3)
  {
    char v4 = 0;
    goto LABEL_8;
  }
  char v4 = objc_alloc_init(UISelectionGrabberCustomPath);
  NSWritingDirection v5 = [(UITextSelectionRect *)self writingDirection];
  if ((unint64_t)(v5 + 1) >= 2)
  {
    if (v5 != NSWritingDirectionRightToLeft) {
      goto LABEL_8;
    }
    [v3 topLeft];
    -[UISelectionGrabberCustomPath setTopPoint:](v4, "setTopPoint:");
    [v3 bottomLeft];
  }
  else
  {
    [v3 topRight];
    -[UISelectionGrabberCustomPath setTopPoint:](v4, "setTopPoint:");
    [v3 bottomRight];
  }
  -[UISelectionGrabberCustomPath setBottomPoint:](v4, "setBottomPoint:");
LABEL_8:

  return v4;
}

- (CGRect)_startEdgeRect
{
  [(UITextSelectionRect *)self rect];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  BOOL v11 = [(UITextSelectionRect *)self isVertical];
  NSWritingDirection v12 = [(UITextSelectionRect *)self writingDirection];
  if ((unint64_t)(v12 + 1) >= 2)
  {
    if (v12 == NSWritingDirectionRightToLeft)
    {
      if (v11)
      {
        double v6 = v6 + v10 + -1.0;
        double v10 = 1.0;
      }
      else
      {
        double v4 = v4 + v8 + -1.0;
        double v8 = 1.0;
      }
    }
  }
  else if (v11)
  {
    double v10 = 1.0;
  }
  else
  {
    double v8 = 1.0;
  }
  double v13 = v4;
  double v14 = v6;
  double v15 = v8;
  double v16 = v10;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- (CGRect)_endEdgeRect
{
  [(UITextSelectionRect *)self rect];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  BOOL v11 = [(UITextSelectionRect *)self isVertical];
  NSWritingDirection v12 = [(UITextSelectionRect *)self writingDirection];
  if ((unint64_t)(v12 + 1) >= 2)
  {
    double v13 = 1.0;
    if (v11) {
      double v14 = v8;
    }
    else {
      double v14 = 1.0;
    }
    if (!v11) {
      double v13 = v10;
    }
    if (v12 == NSWritingDirectionRightToLeft)
    {
      double v8 = v14;
      double v10 = v13;
    }
  }
  else if (v11)
  {
    double v6 = v6 + v10 + -1.0;
    double v10 = 1.0;
  }
  else
  {
    double v4 = v4 + v8 + -1.0;
    double v8 = 1.0;
  }
  double v15 = v4;
  double v16 = v6;
  double v17 = v8;
  double v18 = v10;
  result.size.height = v18;
  result.size.width = v17;
  result.origin.y = v16;
  result.origin.x = v15;
  return result;
}

- (CGRect)rect
{
  double v2 = *MEMORY[0x1E4F1DB20];
  double v3 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
  double v4 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
  double v5 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (NSWritingDirection)writingDirection
{
  return 0;
}

- (id)range
{
  return 0;
}

- (UITextSelectionRectImpl)_isImpl
{
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    double v3 = self;
  }
  else {
    double v3 = 0;
  }
  return (UITextSelectionRectImpl *)v3;
}

- (BOOL)containsEnd
{
  return 0;
}

- (BOOL)containsStart
{
  return 0;
}

- (BOOL)isVertical
{
  return 0;
}

- (BOOL)_drawsOwnHighlight
{
  return 0;
}

- (UIBezierPath)_path
{
  return 0;
}

- (UITextSelectionRectCustomHandleInfo)_customHandleInfo
{
  return 0;
}

- (BOOL)isEqual:(id)a3
{
  double v5 = (UITextSelectionRect *)a3;
  if (self == v5)
  {
    LOBYTE(v11) = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      double v6 = v5;
      double v7 = [(UITextSelectionRect *)self _path];
      if (v7 || ([(UITextSelectionRect *)v6 _path], (double v3 = objc_claimAutoreleasedReturnValue()) != 0))
      {
        double v8 = [(UITextSelectionRect *)self _path];
        double v9 = [(UITextSelectionRect *)v6 _path];
        int v10 = [v8 isEqual:v9];

        if (v7)
        {

          if (!v10) {
            goto LABEL_19;
          }
        }
        else
        {

          if ((v10 & 1) == 0) {
            goto LABEL_19;
          }
        }
      }
      [(UITextSelectionRect *)self transform];
      if (v6) {
        [(UITextSelectionRect *)v6 transform];
      }
      else {
        memset(&v29, 0, sizeof(v29));
      }
      if (CGAffineTransformEqualToTransform(&t1, &v29))
      {
        [(UITextSelectionRect *)self rect];
        CGFloat v13 = v12;
        CGFloat v15 = v14;
        CGFloat v17 = v16;
        CGFloat v19 = v18;
        [(UITextSelectionRect *)v6 rect];
        v32.origin.x = v20;
        v32.origin.y = v21;
        v32.size.width = v22;
        v32.size.height = v23;
        v31.origin.x = v13;
        v31.origin.y = v15;
        v31.size.width = v17;
        v31.size.height = v19;
        if (CGRectEqualToRect(v31, v32))
        {
          NSWritingDirection v24 = [(UITextSelectionRect *)self writingDirection];
          if (v24 == [(UITextSelectionRect *)v6 writingDirection])
          {
            BOOL v25 = [(UITextSelectionRect *)self containsStart];
            if (v25 == [(UITextSelectionRect *)v6 containsStart])
            {
              BOOL v26 = [(UITextSelectionRect *)self containsEnd];
              if (v26 == [(UITextSelectionRect *)v6 containsEnd])
              {
                BOOL v28 = [(UITextSelectionRect *)self isVertical];
                BOOL v11 = v28 ^ [(UITextSelectionRect *)v6 isVertical] ^ 1;
                goto LABEL_20;
              }
            }
          }
        }
      }
LABEL_19:
      LOBYTE(v11) = 0;
LABEL_20:

      goto LABEL_21;
    }
    LOBYTE(v11) = 0;
  }
LABEL_21:

  return v11;
}

- (unint64_t)hash
{
  double v3 = (void *)MEMORY[0x1E4F29238];
  [(UITextSelectionRect *)self rect];
  double v4 = objc_msgSend(v3, "valueWithCGRect:");
  uint64_t v5 = [v4 hash];

  uint64_t v6 = 257 * (257 * v5 + [(UITextSelectionRect *)self writingDirection]);
  uint64_t v7 = 257 * (v6 + [(UITextSelectionRect *)self containsStart]);
  uint64_t v8 = 257 * (v7 + [(UITextSelectionRect *)self containsEnd]);
  uint64_t v9 = v8 + [(UITextSelectionRect *)self isVertical] + 0x1060F140F0601;
  int v10 = [(UITextSelectionRect *)self _path];
  unint64_t v11 = v9 ^ [v10 hash];

  return v11;
}

- (CGAffineTransform)transform
{
  uint64_t v5 = [(UITextSelectionRect *)self _transform];

  if (v5)
  {
    uint64_t v7 = [(UITextSelectionRect *)self _transform];
    if (v7)
    {
      int v10 = v7;
      [v7 CGAffineTransformValue];
      uint64_t v7 = v10;
    }
    else
    {
      *(_OWORD *)&retstr->c = 0u;
      *(_OWORD *)&retstr->tx = 0u;
      *(_OWORD *)&retstr->a = 0u;
    }
  }
  else
  {
    uint64_t v8 = MEMORY[0x1E4F1DAB8];
    long long v9 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    *(_OWORD *)&retstr->a = *MEMORY[0x1E4F1DAB8];
    *(_OWORD *)&retstr->c = v9;
    *(_OWORD *)&retstr->tx = *(_OWORD *)(v8 + 32);
  }
  return result;
}

- (void)_appendToPath:(CGPath *)a3 cornerRadius:(double)a4 edgeInsets:(UIEdgeInsets)a5
{
  double right = a5.right;
  double bottom = a5.bottom;
  double left = a5.left;
  double top = a5.top;
  [(UITextSelectionRect *)self rect];
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  double v16 = v15;
  double v18 = v17;
  long long v19 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  v31[0] = *MEMORY[0x1E4F1DAB8];
  v31[1] = v19;
  v31[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  [(UITextSelectionRect *)self transform];
  if (CGAffineTransformIsIdentity(&v30))
  {
    CGFloat v20 = 0;
  }
  else
  {
    CGFloat v20 = (const CGAffineTransform *)v31;
    [(UITextSelectionRect *)self transform];
  }
  CGFloat v21 = [(UITextSelectionRect *)self _path];

  if (v21)
  {
    memset(&m, 0, sizeof(m));
    CGAffineTransformMakeTranslation(&m, v12, v14);
    id v22 = [(UITextSelectionRect *)self _path];
    CGPathAddPath(a3, &m, (CGPathRef)[v22 CGPath]);
  }
  else if (![(UITextSelectionRect *)self _drawsOwnHighlight])
  {
    double v23 = left + v12;
    double v24 = top + v14;
    double v25 = v16 - (left + right);
    double v26 = v18 - (top + bottom);
    if (a4 <= 2.22044605e-16)
    {
      CGPathAddRect(a3, v20, *(CGRect *)&v23);
    }
    else
    {
      CGFloat v27 = fmin(a4, v25 * 0.5);
      CGPathAddRoundedRect(a3, v20, *(CGRect *)&v23, v27, v27);
    }
  }
}

- (NSValue)_transform
{
  return self->_legacyTransform;
}

- (void)_setTransform:(id)a3
{
}

- (double)baselineOffset
{
  return self->_baselineOffset;
}

- (void)setBaselineOffset:(double)a3
{
  self->_baselineOffset = a3;
}

@end
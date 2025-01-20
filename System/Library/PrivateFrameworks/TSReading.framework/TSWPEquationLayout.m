@interface TSWPEquationLayout
- (BOOL)equationIsValid;
- (BOOL)wantsRoundedInlinePosition;
- (CGColor)textColor;
- (CGRect)frameForCulling;
- (EQKitLayout)equationLayout;
- (EQKitLayoutContext)equationLayoutContext;
- (TSDShadow)textShadow;
- (double)inlineCenteredAlignmentOffset;
- (double)inlineVerticalOffset;
- (id)computeLayoutGeometry;
- (void)dealloc;
- (void)setEquationLayoutContext:(id)a3;
- (void)validate;
- (void)willLayoutInlineWithTextAttributes:(__CFDictionary *)a3 columnWidth:(double)a4;
@end

@implementation TSWPEquationLayout

- (void)dealloc
{
  CGColorRelease(self->_textColor);
  v3.receiver = self;
  v3.super_class = (Class)TSWPEquationLayout;
  [(TSDLayout *)&v3 dealloc];
}

- (void)validate
{
  if (!self->_equationLayoutContext)
  {
    objc_super v3 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v4 = [NSString stringWithUTF8String:"-[TSWPEquationLayout validate]"];
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPEquationLayout.m"), 61, @"willLayoutInlineWithTextAttributes:columnWidth: should have been called before validate");
  }
  if (!self->_equationLayout && self->_equationLayoutContext)
  {
    v5 = (EQKitLayout *)objc_msgSend((id)-[TSDInfo equation](-[TSDLayout info](self, "info"), "equation"), "newLayout");
    self->_equationLayout = v5;
    [(EQKitLayout *)v5 layoutWithContext:self->_equationLayoutContext];
    [(EQKitLayout *)self->_equationLayout width];
    if (v6 <= 0.0
      || ([(EQKitLayout *)self->_equationLayout vsize], v7 <= 0.0)
      || ([(EQKitLayout *)self->_equationLayout erasableBounds], CGRectGetWidth(v10) <= 0.0))
    {
      BOOL v8 = 0;
    }
    else
    {
      [(EQKitLayout *)self->_equationLayout erasableBounds];
      BOOL v8 = CGRectGetHeight(v11) > 0.0;
    }
    self->_equationIsValid = v8;
  }
  v9.receiver = self;
  v9.super_class = (Class)TSWPEquationLayout;
  [(TSDLayout *)&v9 validate];
}

- (id)computeLayoutGeometry
{
  if (!self->_equationLayout || (equationLayoutContext = self->_equationLayoutContext) == 0)
  {
    uint64_t v4 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v5 = [NSString stringWithUTF8String:"-[TSWPEquationLayout computeLayoutGeometry]"];
    objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPEquationLayout.m"), 86, @"can't compute layout geometry before being validated");
    equationLayoutContext = self->_equationLayoutContext;
  }
  [(EQKitLayoutContext *)equationLayoutContext baseFontSize];
  double v7 = v6;
  [(EQKitLayoutContext *)self->_equationLayoutContext baseFontSize];
  if (self->_equationIsValid)
  {
    [(EQKitLayout *)self->_equationLayout width];
    double v7 = v9;
    [(EQKitLayout *)self->_equationLayout vsize];
  }
  double v10 = v8;
  CGRect v11 = [TSDLayoutGeometry alloc];
  long long v12 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
  v14[0] = *MEMORY[0x263F000D0];
  v14[1] = v12;
  v14[2] = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
  return -[TSDLayoutGeometry initWithSize:transform:](v11, "initWithSize:transform:", v14, v7, v10);
}

- (CGRect)frameForCulling
{
  [(EQKitLayout *)self->_equationLayout erasableBounds];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  [(TSDAbstractLayout *)self transform];
  v23.origin.double x = v4;
  v23.origin.double y = v6;
  v23.size.double width = v8;
  v23.size.double height = v10;
  CGRect v24 = CGRectApplyAffineTransform(v23, &v22);
  double x = v24.origin.x;
  double y = v24.origin.y;
  double width = v24.size.width;
  double height = v24.size.height;
  [(EQKitLayout *)self->_equationLayout height];
  double v15 = x + 0.0;
  double v17 = y + v16;
  if ([(TSDShadow *)self->_textShadow isEnabled])
  {
    -[TSDShadow shadowBoundsForRect:](self->_textShadow, "shadowBoundsForRect:", v15, v17, width, height);
    double v15 = v18;
    double v17 = v19;
    double width = v20;
    double height = v21;
  }
  v25.origin.double x = v15;
  v25.origin.double y = v17;
  v25.size.double width = width;
  v25.size.double height = height;
  return CGRectIntegral(v25);
}

- (double)inlineVerticalOffset
{
  if (!self->_equationLayout)
  {
    double v3 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v4 = [NSString stringWithUTF8String:"-[TSWPEquationLayout inlineVerticalOffset]"];
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPEquationLayout.m"), 117, @"can't compute vertical offset before being validated");
  }
  if (!self->_equationIsValid) {
    return 0.0;
  }
  equationLayout = self->_equationLayout;

  [(EQKitLayout *)equationLayout depth];
  return result;
}

- (double)inlineCenteredAlignmentOffset
{
  if (!self->_equationLayout)
  {
    double v3 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v4 = [NSString stringWithUTF8String:"-[TSWPEquationLayout inlineCenteredAlignmentOffset]"];
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPEquationLayout.m"), 131, @"can't compute vertical offset before being validated");
  }
  if (!self->_equationLayoutContext)
  {
    double v5 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v6 = [NSString stringWithUTF8String:"-[TSWPEquationLayout inlineCenteredAlignmentOffset]"];
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPEquationLayout.m"), 132, @"can't compute vertical offset without a layout context");
  }
  if (!self->_equationIsValid) {
    return 0.0;
  }
  [(EQKitLayout *)self->_equationLayout naturalAlignmentOffset];
  double v8 = v7;
  double v9 = 0.0;
  if (v7 != 1.79769313e308)
  {
    [(EQKitLayout *)self->_equationLayout width];
    double v9 = v10 * 0.5 - v8;
  }
  [(EQKitLayoutContext *)self->_equationLayoutContext containerWidth];
  double v12 = v11;
  [(EQKitLayout *)self->_equationLayout width];
  if (fabs(v9) <= (v12 - v13) * 0.5) {
    return v9;
  }
  else {
    return 0.0;
  }
}

- (void)willLayoutInlineWithTextAttributes:(__CFDictionary *)a3 columnWidth:(double)a4
{
  double v8 = [[TSWPEquationLayoutContext alloc] initWithTextAttributes:a3 columnWidth:a4];
  Value = (CGColor *)CFDictionaryGetValue(a3, (const void *)*MEMORY[0x263F03C60]);
  double v7 = (TSDShadow *)CFDictionaryGetValue(a3, @"TSWPShadow");
  if (![(TSWPEquationLayoutContext *)v8 isEqual:self->_equationLayoutContext])
  {

    self->_equationLayoutContext = (EQKitLayoutContext *)v8;
    self->_equationLayout = 0;
    [(TSDLayout *)self invalidateSize];
    [(TSDLayout *)self setNeedsDisplay];
  }
  if (!CGColorEqualToColor(Value, self->_textColor))
  {
    CGColorRelease(self->_textColor);
    self->_textColor = CGColorRetain(Value);
    [(TSDLayout *)self setNeedsDisplay];
  }
  if (v7 != self->_textShadow && !-[TSDShadow isEqual:](v7, "isEqual:"))
  {

    self->_textShadow = v7;
    [(TSDLayout *)self setNeedsDisplay];
  }
}

- (BOOL)wantsRoundedInlinePosition
{
  return 0;
}

- (EQKitLayout)equationLayout
{
  return self->_equationLayout;
}

- (EQKitLayoutContext)equationLayoutContext
{
  return self->_equationLayoutContext;
}

- (void)setEquationLayoutContext:(id)a3
{
}

- (BOOL)equationIsValid
{
  return self->_equationIsValid;
}

- (CGColor)textColor
{
  return self->_textColor;
}

- (TSDShadow)textShadow
{
  return self->_textShadow;
}

@end
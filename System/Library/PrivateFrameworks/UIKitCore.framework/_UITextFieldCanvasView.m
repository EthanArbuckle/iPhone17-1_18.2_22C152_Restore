@interface _UITextFieldCanvasView
- (BOOL)_enableAutoConstraining;
- (_UITextFieldCanvasView)init;
- (_UITextFieldCanvasView)initWithCoder:(id)a3;
- (void)drawRect:(CGRect)a3;
- (void)drawTextInRect:(CGRect)a3;
@end

@implementation _UITextFieldCanvasView

- (_UITextFieldCanvasView)init
{
  v5.receiver = self;
  v5.super_class = (Class)_UITextFieldCanvasView;
  v2 = [(UIView *)&v5 init];
  v3 = v2;
  if (v2) {
    _UITextFieldCanvasViewCommonInit(v2);
  }
  return v3;
}

- (_UITextFieldCanvasView)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)_UITextFieldCanvasView;
  v3 = [(UIView *)&v6 initWithCoder:a3];
  v4 = v3;
  if (v3) {
    _UITextFieldCanvasViewCommonInit(v3);
  }
  return v4;
}

- (BOOL)_enableAutoConstraining
{
  return 0;
}

- (void)drawTextInRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v7 = [(_UITextCanvasView *)self context];
  v8 = [v7 layoutManager];
  v9 = [v7 textContainer];
  [v7 textContainerOrigin];
  double v11 = v10;
  double v13 = v12;
  objc_msgSend(v8, "ensureLayoutForBoundingRect:inTextContainer:", v9, x, y, width, height);
  v50.origin.double x = x;
  v50.origin.double y = y;
  v50.size.double width = width;
  v50.size.double height = height;
  CGRect v51 = CGRectOffset(v50, -v11, -v13);
  uint64_t v14 = objc_msgSend(v8, "glyphRangeForBoundingRect:inTextContainer:", v9, v51.origin.x, v51.origin.y, v51.size.width, v51.size.height);
  uint64_t v16 = v15;
  ContextStack = GetContextStack(0);
  if (*(int *)ContextStack < 1) {
    v18 = 0;
  }
  else {
    v18 = (CGContext *)ContextStack[3 * (*(_DWORD *)ContextStack - 1) + 1];
  }
  if ([v7 _isPasscodeStyle])
  {
    CGContextSaveGState(v18);
    uint64_t v19 = [v7 _unobscuredSecureRange];
    uint64_t v21 = v19;
    uint64_t v22 = v20;
    if (v20) {
      uint64_t v23 = v19;
    }
    else {
      uint64_t v23 = v16;
    }
    if (v20) {
      uint64_t v24 = 0;
    }
    else {
      uint64_t v24 = v14;
    }
    uint64_t v25 = objc_msgSend(v8, "glyphRangeForCharacterRange:actualCharacterRange:", v24, v23, 0);
    uint64_t v27 = v26;
    uint64_t v28 = objc_msgSend(v8, "glyphRangeForCharacterRange:actualCharacterRange:", v21, v22, 0);
    uint64_t v30 = v29;
    [v7 _passcodeStyleAlpha];
    CGContextSetAlpha(v18, v31);
    CGContextSetAlpha(v18, 1.0);
    if (v27) {
      objc_msgSend(v8, "drawGlyphsForGlyphRange:atPoint:", v25, v27, v11, v13);
    }
    CGContextRestoreGState(v18);
    if (v30) {
      objc_msgSend(v8, "drawGlyphsForGlyphRange:atPoint:", v28, v30, v11, v13);
    }
  }
  else if (v16)
  {
    objc_msgSend(v8, "drawBackgroundForGlyphRange:atPoint:", v14, v16, v11, v13);
    [v8 usedRectForTextContainer:v9];
    CGRect v53 = CGRectOffset(v52, v11, v13);
    CGFloat v42 = v53.origin.y;
    CGFloat v43 = v53.origin.x;
    CGFloat v32 = v53.size.width;
    CGFloat v33 = v53.size.height;
    [v7 _clipRectForFadedEdges];
    CGFloat v35 = v34;
    CGFloat v37 = v36;
    CGFloat v39 = v38;
    CGFloat v41 = v40;
    v44[0] = MEMORY[0x1E4F143A8];
    v44[1] = 3221225472;
    v44[2] = __41___UITextFieldCanvasView_drawTextInRect___block_invoke;
    v44[3] = &unk_1E52DA520;
    id v45 = v8;
    uint64_t v46 = v14;
    uint64_t v47 = v16;
    double v48 = v11;
    double v49 = v13;
    _UITextCanvasDrawWithFadedEdgesInContext(v18, v44, v43, v42, v32, v33, v35, v37, v39, v41);
  }
}

- (void)drawRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8 = [(_UITextCanvasView *)self context];
  char v9 = objc_msgSend(v8, "drawTextInRectIfNeeded:", x, y, width, height);

  if ((v9 & 1) == 0)
  {
    -[_UITextFieldCanvasView drawTextInRect:](self, "drawTextInRect:", x, y, width, height);
  }
}

@end
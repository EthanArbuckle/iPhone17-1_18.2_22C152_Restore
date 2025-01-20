@interface UITextAttachmentView
- (CGPoint)cellBaselineOffset;
- (CGRect)cellFrameForTextContainer:(id)a3 proposedLineFragment:(CGRect)a4 glyphPosition:(CGPoint)a5 characterIndex:(unint64_t)a6;
- (CGSize)cellSize;
- (NSTextAttachment)attachment;
- (UITextAttachmentView)initWithContentView:(id)a3;
- (UITextAttachmentView)initWithTextAttachment:(id)a3 image:(id)a4;
- (id)contentView;
- (void)drawWithFrame:(CGRect)a3 inView:(id)a4 characterIndex:(unint64_t)a5;
- (void)drawWithFrame:(CGRect)a3 inView:(id)a4 characterIndex:(unint64_t)a5 layoutManager:(id)a6;
- (void)setAttachment:(id)a3;
@end

@implementation UITextAttachmentView

- (UITextAttachmentView)initWithContentView:(id)a3
{
  id v4 = a3;
  [v4 frame];
  v8.receiver = self;
  v8.super_class = (Class)UITextAttachmentView;
  v5 = -[UIView initWithFrame:](&v8, sel_initWithFrame_, 0.0, 0.0);
  if (v5)
  {
    [v4 setAutoresizingMask:18];
    [(UIView *)v5 addSubview:v4];
    v6 = +[UIColor clearColor];
    [(UIView *)v5 setBackgroundColor:v6];
  }
  return v5;
}

- (UITextAttachmentView)initWithTextAttachment:(id)a3 image:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_super v8 = (void *)MEMORY[0x1E4F442D8];
  v9 = [v6 fileType];
  v10 = [v8 _typeWithIdentifier:v9 allowUndeclared:1];

  if (([v10 conformsToType:*MEMORY[0x1E4F443D0]] & 1) != 0
    || [v10 conformsToType:*MEMORY[0x1E4F44460]])
  {
    if (v7)
    {
      v11 = [[_UIAnimatedAttachmentView alloc] initWithAttachment:v6];
      goto LABEL_8;
    }
  }
  else
  {
    int v12 = [v10 conformsToType:*MEMORY[0x1E4F44400]];
    if (v7 && v12)
    {
      v11 = [(UIImageView *)[_UITextAttachmentImageView alloc] initWithImage:v7];
LABEL_8:
      v13 = (_UITextAttachmentPlaceholderView *)v11;
      if (v11) {
        goto LABEL_10;
      }
    }
  }
  v13 = [(UIImageView *)[_UITextAttachmentPlaceholderView alloc] initWithImage:v7];
LABEL_10:
  v14 = [(UITextAttachmentView *)self initWithContentView:v13];
  v15 = v14;
  if (v14) {
    [(UITextAttachmentView *)v14 setAttachment:v6];
  }

  return v15;
}

- (id)contentView
{
  v2 = [(UIView *)self subviews];
  v3 = [v2 lastObject];

  return v3;
}

- (CGSize)cellSize
{
  v2 = [(UITextAttachmentView *)self attachment];
  [v2 bounds];
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (CGPoint)cellBaselineOffset
{
  v2 = [(UITextAttachmentView *)self attachment];
  [v2 bounds];
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.y = v8;
  result.x = v7;
  return result;
}

- (void)drawWithFrame:(CGRect)a3 inView:(id)a4 characterIndex:(unint64_t)a5
{
}

- (void)drawWithFrame:(CGRect)a3 inView:(id)a4 characterIndex:(unint64_t)a5 layoutManager:(id)a6
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v29 = a4;
  id v13 = a6;
  if (pthread_main_np() == 1)
  {
    -[UIView setFrame:](self, "setFrame:", x, y, width, height);
    if (v29 && v13)
    {
      v14 = [v13 temporaryAttributesAtCharacterIndex:a5 effectiveRange:0];
      v15 = [v14 objectForKey:@"NSViewTextAttachmentCellHelper"];

      if (!v15)
      {
        v16 = [(UITextAttachmentView *)self attachment];
        v15 = +[_UITextAttachmentViewHelper helperForAttachment:v16];

        v17 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", v15, @"NSViewTextAttachmentCellHelper", 0);
        objc_msgSend(v13, "addTemporaryAttributes:forCharacterRange:", v17, a5, 1);
      }
      id v18 = [(UIView *)self superview];

      if (v18 != v29)
      {
        [(UIView *)self removeFromSuperview];
        [v29 addSubview:self];
      }
    }
    else
    {
      ContextStack = GetContextStack(0);
      if (*(int *)ContextStack < 1) {
        v24 = 0;
      }
      else {
        v24 = (CGContext *)ContextStack[3 * (*(_DWORD *)ContextStack - 1) + 1];
      }
      CGContextSaveGState(v24);
      CGContextTranslateCTM(v24, x, y);
      v28 = [(UIView *)self layer];
      [v28 renderInContext:v24];

      CGContextRestoreGState(v24);
    }
  }
  else
  {
    v19 = [(UITextAttachmentView *)self attachment];
    v20 = [v19 image];

    if (v20)
    {
      v21 = GetContextStack(0);
      if (*(int *)v21 < 1) {
        v22 = 0;
      }
      else {
        v22 = (CGContext *)v21[3 * (*(_DWORD *)v21 - 1) + 1];
      }
      CGContextSaveGState(v22);
      CGContextTranslateCTM(v22, x, y + height);
      CGFloat v25 = *MEMORY[0x1E4F1DAD8];
      CGFloat v26 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
      CGContextScaleCTM(v22, 1.0, -1.0);
      v27 = (CGImage *)[v20 CGImage];
      v31.origin.double x = v25;
      v31.origin.double y = v26;
      v31.size.double width = width;
      v31.size.double height = height;
      CGContextDrawImage(v22, v31, v27);
      CGContextRestoreGState(v22);
    }
  }
}

- (CGRect)cellFrameForTextContainer:(id)a3 proposedLineFragment:(CGRect)a4 glyphPosition:(CGPoint)a5 characterIndex:(unint64_t)a6
{
  double y = a5.y;
  double x = a5.x;
  double height = a4.size.height;
  double width = a4.size.width;
  double v11 = a4.origin.y;
  double v12 = a4.origin.x;
  id v14 = a3;
  v15 = [(UITextAttachmentView *)self attachment];
  objc_msgSend(v15, "attachmentBoundsForTextContainer:proposedLineFragment:glyphPosition:characterIndex:", v14, a6, v12, v11, width, height, x, y);
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;
  double v23 = v22;

  double v24 = v17;
  double v25 = v19;
  double v26 = v21;
  double v27 = v23;
  result.size.double height = v27;
  result.size.double width = v26;
  result.origin.double y = v25;
  result.origin.double x = v24;
  return result;
}

- (NSTextAttachment)attachment
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_attachment);
  return (NSTextAttachment *)WeakRetained;
}

- (void)setAttachment:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
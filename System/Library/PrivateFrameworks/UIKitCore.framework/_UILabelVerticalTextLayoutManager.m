@interface _UILabelVerticalTextLayoutManager
- (CGRect)_boundingRectWithString:(id)a3 size:(CGSize)a4 options:(int64_t)a5 context:(id)a6;
- (CGRect)boundingRectWithString:(id)a3 size:(CGSize)a4 options:(int64_t)a5 attributes:(id)a6 context:(id)a7;
- (_UILabelVerticalTextLayoutManager)initWithConfiguration:(id)a3;
- (int64_t)lineBreakMode;
- (void)_drawWithAttributedString:(id)a3 rect:(CGRect)a4 options:(int64_t)a5 context:(id)a6;
- (void)drawWithString:(id)a3 rect:(CGRect)a4 options:(int64_t)a5 attributes:(id)a6 context:(id)a7;
- (void)setLineBreakMode:(int64_t)a3;
@end

@implementation _UILabelVerticalTextLayoutManager

- (_UILabelVerticalTextLayoutManager)initWithConfiguration:(id)a3
{
  v4 = (double *)a3;
  v14.receiver = self;
  v14.super_class = (Class)_UILabelVerticalTextLayoutManager;
  v5 = [(_UILabelVerticalTextLayoutManager *)&v14 init];
  if (v5)
  {
    v6 = (NSTextLayoutManager *)objc_alloc_init((Class)off_1E52D2EE0);
    layoutManager = v5->_layoutManager;
    v5->_layoutManager = v6;

    v8 = objc_alloc_init(_UIVerticalTextContainer);
    textContainer = v5->_textContainer;
    v5->_textContainer = &v8->super;

    [(NSTextContainer *)v5->_textContainer setLineBreakMode:4];
    -[NSTextContainer setMaximumNumberOfLines:](v5->_textContainer, "setMaximumNumberOfLines:", [v4 numberOfLines]);
    double v10 = 0.0;
    [(NSTextContainer *)v5->_textContainer setLineFragmentPadding:0.0];
    if (v4) {
      double v10 = v4[19];
    }
    v5->_scale = v10;
    [(NSTextLayoutManager *)v5->_layoutManager setTextContainer:v5->_textContainer];
    v11 = (NSTextContentStorage *)objc_alloc_init((Class)off_1E52D2EC8);
    contentStorage = v5->_contentStorage;
    v5->_contentStorage = v11;

    [(NSTextLayoutManager *)v5->_layoutManager replaceTextContentManager:v5->_contentStorage];
  }

  return v5;
}

- (CGRect)_boundingRectWithString:(id)a3 size:(CGSize)a4 options:(int64_t)a5 context:(id)a6
{
  double height = a4.height;
  double width = a4.width;
  -[NSTextContentStorage setAttributedString:](self->_contentStorage, "setAttributedString:", a3, a5, a6);
  [(NSTextContainer *)self->_textContainer size];
  if (v10 != width || v9 != height)
  {
    -[NSTextContainer setSize:](self->_textContainer, "setSize:", width, height);
    layoutManager = self->_layoutManager;
    v13 = [(NSTextLayoutManager *)layoutManager documentRange];
    [(NSTextLayoutManager *)layoutManager invalidateLayoutForRange:v13];
  }
  objc_super v14 = self->_layoutManager;
  v15 = [(NSTextLayoutManager *)v14 documentRange];
  [(NSTextLayoutManager *)v14 ensureLayoutForRange:v15];

  [(NSTextLayoutManager *)self->_layoutManager usageBoundsForTextContainer];
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;
  double scale = self->_scale;
  UICeilToScale(v23, scale);
  double v25 = v24;
  UICeilToScale(v21, scale);
  double v27 = v26;
  double v28 = v17;
  double v29 = v19;
  double v30 = v25;
  result.size.double height = v30;
  result.size.double width = v27;
  result.origin.y = v29;
  result.origin.x = v28;
  return result;
}

- (CGRect)boundingRectWithString:(id)a3 size:(CGSize)a4 options:(int64_t)a5 attributes:(id)a6 context:(id)a7
{
  double height = a4.height;
  double width = a4.width;
  v13 = (objc_class *)MEMORY[0x1E4F28B18];
  id v14 = a7;
  id v15 = a6;
  id v16 = a3;
  double v17 = (void *)[[v13 alloc] initWithString:v16 attributes:v15];

  -[_UILabelVerticalTextLayoutManager _boundingRectWithString:size:options:context:](self, "_boundingRectWithString:size:options:context:", v17, a5, v14, width, height);
  double v19 = v18;
  double v21 = v20;
  double v23 = v22;
  double v25 = v24;

  double v26 = v19;
  double v27 = v21;
  double v28 = v23;
  double v29 = v25;
  result.size.double height = v29;
  result.size.double width = v28;
  result.origin.y = v27;
  result.origin.x = v26;
  return result;
}

- (void)_drawWithAttributedString:(id)a3 rect:(CGRect)a4 options:(int64_t)a5 context:(id)a6
{
  CGFloat width = a4.size.width;
  ContextStack = GetContextStack(0);
  if (*(int *)ContextStack < 1) {
    double v9 = 0;
  }
  else {
    double v9 = (CGContext *)ContextStack[3 * (*(_DWORD *)ContextStack - 1) + 1];
  }
  CGContextTranslateCTM(v9, width, 0.0);
  CGContextRotateCTM(v9, 1.57079633);
  layoutManager = self->_layoutManager;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __84___UILabelVerticalTextLayoutManager__drawWithAttributedString_rect_options_context___block_invoke;
  v12[3] = &__block_descriptor_40_e30_B16__0__NSTextLayoutFragment_8l;
  v12[4] = v9;
  id v11 = [(NSTextLayoutManager *)layoutManager enumerateTextLayoutFragmentsFromLocation:0 options:0 usingBlock:v12];
}

- (void)drawWithString:(id)a3 rect:(CGRect)a4 options:(int64_t)a5 attributes:(id)a6 context:(id)a7
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v15 = (objc_class *)MEMORY[0x1E4F28B18];
  id v16 = a7;
  id v17 = a6;
  id v18 = a3;
  id v19 = (id)[[v15 alloc] initWithString:v18 attributes:v17];

  -[_UILabelVerticalTextLayoutManager _drawWithAttributedString:rect:options:context:](self, "_drawWithAttributedString:rect:options:context:", v19, a5, v16, x, y, width, height);
}

- (int64_t)lineBreakMode
{
  return self->_lineBreakMode;
}

- (void)setLineBreakMode:(int64_t)a3
{
  self->_lineBreakMode = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentStorage, 0);
  objc_storeStrong((id *)&self->_textContainer, 0);
  objc_storeStrong((id *)&self->_layoutManager, 0);
}

@end
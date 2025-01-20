@interface _UIInputViewContent
- (BOOL)_isToolbar;
- (CGSize)_contentSize;
- (CGSize)_sizeFittingContentViews;
- (_UIInputViewContent)initWithFrame:(CGRect)a3 inputView:(id)a4;
- (unint64_t)_unclippableCorners;
- (void)_setToolbarBackgroundImage:(id)a3;
- (void)_setToolbarBackgroundViewWithImage:(id)a3;
- (void)_updateCornerClipping;
- (void)addSubview:(id)a3;
- (void)set_unclippableCorners:(unint64_t)a3;
@end

@implementation _UIInputViewContent

- (void)_updateCornerClipping
{
  v3 = [(UIView *)self layer];
  [v3 setMask:0];

  LODWORD(v3) = [(UIView *)self _clipCorners];
  [(UIInputView *)self->_inputView _additionalClipHeight];
  uint64_t v5 = v3 & ~LODWORD(self->_unclippableCorners) & 3;
  if (v5)
  {
    double v6 = v4;
    v7 = +[UIKeyboardPreferencesController sharedPreferencesController];
    v8 = [v7 preferencesActions];
    [v8 rivenSizeFactor:10.0];
    CGFloat v10 = v9;

    Mutable = CGPathCreateMutable();
    [(UIView *)self bounds];
    double v13 = v12;
    [(UIView *)self bounds];
    UIKBAddRoundedRectToPath(Mutable, v5, 0, 0.0, 0.0, v13, v6 + v14, v10);
    id v17 = [MEMORY[0x1E4F39C88] layer];
    [v17 setPath:Mutable];
    id v15 = +[UIColor blackColor];
    objc_msgSend(v17, "setFillColor:", objc_msgSend(v15, "CGColor"));

    CGPathRelease(Mutable);
    v16 = [(UIView *)self layer];
    [v16 setMask:v17];
  }
}

- (void)_setToolbarBackgroundViewWithImage:(id)a3
{
  id v9 = a3;
  if ([(_UIInputViewContent *)self _isToolbar])
  {
    double v4 = [(UIView *)self subviews];
    uint64_t v5 = [v4 lastObject];

    if (v9)
    {
      double v6 = [v5 _backgroundView];
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0
        || ([v6 image], id v7 = (id)objc_claimAutoreleasedReturnValue(), v7, v7 != v9))
      {
        v8 = [[UIImageView alloc] initWithImage:v9];

        [(UIView *)v8 setAutoresizingMask:18];
        double v6 = v8;
      }
      [v5 _setBackgroundView:v6];
      if (v6)
      {
        [v5 bounds];
        objc_msgSend(v6, "setFrame:");

LABEL_10:
        goto LABEL_11;
      }
    }
    else
    {
      [v5 _setBackgroundView:0];
    }
    [v5 setNeedsLayout];
    goto LABEL_10;
  }
LABEL_11:
}

- (BOOL)_isToolbar
{
  v3 = [(UIView *)self subviews];
  if ([v3 count] == 1)
  {
    double v4 = [(UIView *)self subviews];
    uint64_t v5 = [v4 lastObject];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
  }
  else
  {
    char isKindOfClass = 0;
  }

  return isKindOfClass & 1;
}

- (void)set_unclippableCorners:(unint64_t)a3
{
  self->_unclippableCorners = a3;
}

- (_UIInputViewContent)initWithFrame:(CGRect)a3 inputView:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v10 = a4;
  v15.receiver = self;
  v15.super_class = (Class)_UIInputViewContent;
  v11 = -[UIView initWithFrame:](&v15, sel_initWithFrame_, x, y, width, height);
  double v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_inputView, a4);
    double v13 = v12;
  }

  return v12;
}

- (void)_setToolbarBackgroundImage:(id)a3
{
  id v16 = a3;
  if ([(_UIInputViewContent *)self _isToolbar])
  {
    double v4 = [(UIView *)self subviews];
    uint64_t v5 = [v4 lastObject];

    [v5 setBackgroundImage:v16 forToolbarPosition:0 barMetrics:0];
    [v5 bounds];
    double v10 = 1.0;
    if (!v16) {
      double v10 = 0.0;
    }
    CGRect v18 = CGRectOffset(*(CGRect *)&v6, 0.0, v10);
    double x = v18.origin.x;
    double y = v18.origin.y;
    double width = v18.size.width;
    double height = v18.size.height;
    objc_super v15 = [v5 _backgroundView];
    objc_msgSend(v15, "setFrame:", x, y, width, height);
  }
}

- (CGSize)_sizeFittingContentViews
{
  uint64_t v12 = 0;
  double v13 = (double *)&v12;
  uint64_t v14 = 0x2020000000;
  uint64_t v15 = 0;
  uint64_t v8 = 0;
  id v9 = (double *)&v8;
  uint64_t v10 = 0x2020000000;
  uint64_t v11 = 0;
  v2 = [(UIView *)self subviews];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __47___UIInputViewContent__sizeFittingContentViews__block_invoke;
  v7[3] = &unk_1E52F3B78;
  v7[4] = &v12;
  v7[5] = &v8;
  [v2 enumerateObjectsUsingBlock:v7];

  double v3 = v13[3];
  double v4 = v9[3];
  _Block_object_dispose(&v8, 8);
  _Block_object_dispose(&v12, 8);
  double v5 = v3;
  double v6 = v4;
  result.double height = v6;
  result.double width = v5;
  return result;
}

- (void)addSubview:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)_UIInputViewContent;
  [(UIView *)&v9 addSubview:a3];
  double contentWidth = self->_contentWidth;
  double contentHeight = self->_contentHeight;
  [(_UIInputViewContent *)self _sizeFittingContentViews];
  if (v6 != contentWidth || v7 != contentHeight)
  {
    self->_double contentWidth = v6;
    self->_double contentHeight = v7;
    [(UIInputView *)self->_inputView _setNeedsContentSizeUpdate];
  }
}

- (CGSize)_contentSize
{
  double contentWidth = self->_contentWidth;
  double contentHeight = self->_contentHeight;
  result.double height = contentHeight;
  result.double width = contentWidth;
  return result;
}

- (unint64_t)_unclippableCorners
{
  return self->_unclippableCorners;
}

- (void).cxx_destruct
{
}

@end
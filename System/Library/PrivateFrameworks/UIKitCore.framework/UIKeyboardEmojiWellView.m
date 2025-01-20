@interface UIKeyboardEmojiWellView
- (BOOL)isActiveSelection;
- (BOOL)isSelected;
- (BOOL)unreleasedHighlight;
- (CGSize)compositeImageSize;
- (NSArray)compositeImageRepresentation;
- (NSIndexPath)associatedIndexPath;
- (NSString)stringRepresentation;
- (UIColor)selectionBackgroundColor;
- (UIFont)labelFont;
- (UIKeyboardEmojiWellView)initWithFrame:(CGRect)a3;
- (UILabel)unreleasedBanner;
- (UIView)backgroundView;
- (UIView)wellContentView;
- (id)fontUsingSilhouette:(unint64_t)a3 size:(double)a4;
- (void)dragWillBegin:(id)a3;
- (void)layoutSubviews;
- (void)setActiveSelection:(BOOL)a3;
- (void)setAssociatedIndexPath:(id)a3;
- (void)setBackgroundView:(id)a3;
- (void)setCompositeImageRepresentation:(id)a3;
- (void)setCompositeImageSize:(CGSize)a3;
- (void)setLabelFont:(id)a3;
- (void)setSelected:(BOOL)a3;
- (void)setSelectionBackgroundColor:(id)a3;
- (void)setStringRepresentation:(id)a3;
- (void)setStringRepresentation:(id)a3 silhouette:(unint64_t)a4;
- (void)setUnreleasedBanner:(id)a3;
- (void)setUnreleasedHighlight:(BOOL)a3;
- (void)setWellContentView:(id)a3;
@end

@implementation UIKeyboardEmojiWellView

- (UIKeyboardEmojiWellView)initWithFrame:(CGRect)a3
{
  v13.receiver = self;
  v13.super_class = (Class)UIKeyboardEmojiWellView;
  v3 = -[UIView initWithFrame:](&v13, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [UIView alloc];
    v5 = -[UIView initWithFrame:](v4, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    [(UIKeyboardEmojiWellView *)v3 setBackgroundView:v5];

    v6 = [(UIKeyboardEmojiWellView *)v3 backgroundView];
    v7 = [v6 layer];
    [v7 setMasksToBounds:1];

    v8 = [(UIKeyboardEmojiWellView *)v3 backgroundView];
    v9 = [v8 layer];
    [v9 setCornerRadius:10.0];

    v10 = [(UIKeyboardEmojiWellView *)v3 backgroundView];
    [(UIView *)v3 addSubview:v10];

    v11 = [(UIKeyboardEmojiWellView *)v3 fontUsingSilhouette:0 size:32.0];
    [(UIKeyboardEmojiWellView *)v3 setLabelFont:v11];

    -[UIKeyboardEmojiWellView setCompositeImageSize:](v3, "setCompositeImageSize:", 34.0, 34.0);
    [(UIKeyboardEmojiWellView *)v3 setSelected:0];
  }
  return v3;
}

- (void)setWellContentView:(id)a3
{
  v5 = (UIView *)a3;
  wellContentView = self->_wellContentView;
  if (wellContentView != v5)
  {
    v7 = v5;
    [(UIView *)wellContentView removeFromSuperview];
    objc_storeStrong((id *)&self->_wellContentView, a3);
    [(UIView *)self addSubview:self->_wellContentView];
    v5 = v7;
  }
}

- (void)setCompositeImageRepresentation:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  objc_storeStrong((id *)&self->_compositeImageRepresentation, a3);
  v6 = [_UIKBCompositeImageView alloc];
  v7 = -[UIView initWithFrame:](v6, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  v8 = [MEMORY[0x1E4F1CA48] array];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v9 = v5;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v18;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v18 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void *)(*((void *)&v17 + 1) + 8 * v13);
        v15 = [UIImageView alloc];
        v16 = -[UIImageView initWithImage:](v15, "initWithImage:", v14, (void)v17);
        [v8 addObject:v16];

        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v11);
  }

  [(_UIKBCompositeImageView *)v7 setImageViews:v8];
  [(UIKeyboardEmojiWellView *)self compositeImageSize];
  -[_UIKBCompositeImageView setImageSize:](v7, "setImageSize:");
  [(UIKeyboardEmojiWellView *)self setWellContentView:v7];
}

- (void)setStringRepresentation:(id)a3
{
}

- (void)setStringRepresentation:(id)a3 silhouette:(unint64_t)a4
{
  objc_storeStrong((id *)&self->_stringRepresentation, a3);
  id v7 = a3;
  v8 = [UIKeyboardEmojiDraggableView alloc];
  uint64_t v11 = -[UIKeyboardEmojiDraggableView initWithFrame:](v8, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  id v9 = [(UIKeyboardEmojiWellView *)self labelFont];
  [v9 pointSize];
  uint64_t v10 = -[UIKeyboardEmojiWellView fontUsingSilhouette:size:](self, "fontUsingSilhouette:size:", a4);
  [(UIKeyboardEmojiDraggableView *)v11 setFont:v10];

  [(UIKeyboardEmojiDraggableView *)v11 setText:v7];
  [(UIKeyboardEmojiDraggableView *)v11 setDragEnabled:a4 == 0];
  [(UIKeyboardEmojiDraggableView *)v11 setDelegate:self];
  [(UIKeyboardEmojiWellView *)self setWellContentView:v11];
}

- (id)fontUsingSilhouette:(unint64_t)a3 size:(double)a4
{
  v31[2] = *MEMORY[0x1E4F143B8];
  if (a3 == 1)
  {
    uint64_t v10 = *(void *)off_1E52D6BA0;
    v24[0] = *(void *)off_1E52D6BA8;
    v24[1] = v10;
    v25[0] = &unk_1ED3F5280;
    v25[1] = &unk_1ED3F5298;
    id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:v24 count:2];
    v26 = v7;
    uint64_t v11 = (void *)MEMORY[0x1E4F1C978];
    uint64_t v12 = &v26;
LABEL_7:
    id v9 = [v11 arrayWithObjects:v12 count:1];
    goto LABEL_8;
  }
  if (a3 == 2)
  {
    uint64_t v13 = *(void *)off_1E52D6BA0;
    v21[0] = *(void *)off_1E52D6BA8;
    v21[1] = v13;
    v22[0] = &unk_1ED3F5280;
    v22[1] = &unk_1ED3F52B0;
    id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v21 count:2];
    v23 = v7;
    uint64_t v11 = (void *)MEMORY[0x1E4F1C978];
    uint64_t v12 = &v23;
    goto LABEL_7;
  }
  if (a3 != 3) {
    goto LABEL_10;
  }
  uint64_t v6 = *(void *)off_1E52D6BA0;
  v29[0] = *(void *)off_1E52D6BA8;
  uint64_t v5 = v29[0];
  v29[1] = v6;
  v30[0] = &unk_1ED3F5280;
  v30[1] = &unk_1ED3F5298;
  id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v30 forKeys:v29 count:2];
  v31[0] = v7;
  v27[0] = v5;
  v27[1] = v6;
  v28[0] = &unk_1ED3F5280;
  v28[1] = &unk_1ED3F52B0;
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:v27 count:2];
  v31[1] = v8;
  id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v31 count:2];

LABEL_8:
  if (v9)
  {
    uint64_t v14 = *(void *)off_1E52D6B78;
    v19[0] = *(void *)off_1E52D6B70;
    v19[1] = v14;
    v20[0] = v9;
    v20[1] = @"AppleColorEmoji";
    v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:2];
    v16 = [off_1E52D39C0 fontDescriptorWithFontAttributes:v15];

    long long v17 = [off_1E52D39B8 fontWithDescriptor:v16 size:a4];

    goto LABEL_11;
  }
LABEL_10:
  long long v17 = [off_1E52D39B8 fontWithName:@"AppleColorEmoji" size:a4];
LABEL_11:
  return v17;
}

- (void)setUnreleasedHighlight:(BOOL)a3
{
  v42[2] = *MEMORY[0x1E4F143B8];
  if (a3 && os_variant_has_internal_diagnostics())
  {
    uint64_t v6 = [(UIKeyboardEmojiWellView *)self unreleasedBanner];

    if (!v6)
    {
      id v7 = [UILabel alloc];
      [(UIView *)self bounds];
      v8 = -[UILabel initWithFrame:](v7, "initWithFrame:");
      [(UIKeyboardEmojiWellView *)self setUnreleasedBanner:v8];

      id v9 = [(UIKeyboardEmojiWellView *)self unreleasedBanner];
      [v9 setText:@"PRERELEASE"];

      uint64_t v10 = +[UIColor colorWithRed:1.0 green:0.0 blue:0.0 alpha:1.0];
      uint64_t v11 = [(UIKeyboardEmojiWellView *)self unreleasedBanner];
      [v11 setTextColor:v10];

      uint64_t v12 = [off_1E52D39B8 systemFontOfSize:10.0 weight:*(double *)off_1E52D6BD8];
      uint64_t v13 = [(UIKeyboardEmojiWellView *)self unreleasedBanner];
      [v13 setFont:v12];

      uint64_t v14 = [(UIKeyboardEmojiWellView *)self unreleasedBanner];
      [v14 setAdjustsFontSizeToFitWidth:1];

      v15 = [(UIKeyboardEmojiWellView *)self unreleasedBanner];
      [v15 setMinimumScaleFactor:0.5];

      v16 = [(UIKeyboardEmojiWellView *)self unreleasedBanner];
      [(UIView *)self addSubview:v16];

      long long v17 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
      *(_OWORD *)&v40.a = *MEMORY[0x1E4F1DAB8];
      *(_OWORD *)&v40.c = v17;
      *(_OWORD *)&v40.tx = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
      CGAffineTransformRotate(&v41, &v40, -0.785398163);
      long long v18 = [(UIKeyboardEmojiWellView *)self unreleasedBanner];
      CGAffineTransform v39 = v41;
      [v18 setTransform:&v39];

      long long v19 = [(UIKeyboardEmojiWellView *)self unreleasedBanner];
      [v19 setTranslatesAutoresizingMaskIntoConstraints:0];

      v38 = (void *)MEMORY[0x1E4F5B268];
      long long v20 = [(UIKeyboardEmojiWellView *)self unreleasedBanner];
      v21 = [v20 centerXAnchor];
      uint64_t v22 = [(UIView *)self centerXAnchor];
      v23 = [v21 constraintEqualToAnchor:v22];
      v42[0] = v23;
      v24 = [(UIKeyboardEmojiWellView *)self unreleasedBanner];
      v25 = [v24 centerYAnchor];
      v26 = [(UIView *)self centerYAnchor];
      v27 = [v25 constraintEqualToAnchor:v26];
      v42[1] = v27;
      v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:v42 count:2];
      [v38 activateConstraints:v28];
    }
    v29 = [(UIKeyboardEmojiWellView *)self unreleasedBanner];
    [v29 setHidden:0];

    v30 = [(UIKeyboardEmojiWellView *)self unreleasedBanner];
    [(UIView *)self bringSubviewToFront:v30];

    v31 = [(UIView *)self layer];
    objc_msgSend(v31, "setShadowOffset:", 3.0, 0.0);

    v32 = [(UIView *)self layer];
    [v32 setShadowRadius:3.0];

    id v33 = +[UIColor colorWithRed:1.0 green:0.0 blue:0.0 alpha:0.3];
    uint64_t v34 = [v33 CGColor];
    v35 = [(UIView *)self layer];
    [v35 setShadowColor:v34];

    v36 = [(UIView *)self layer];
    LODWORD(v37) = 0.5;
    [v36 setShadowOpacity:v37];
  }
  else
  {
    v4 = [(UIKeyboardEmojiWellView *)self unreleasedBanner];

    if (v4)
    {
      uint64_t v5 = [(UIKeyboardEmojiWellView *)self unreleasedBanner];
      [v5 removeFromSuperview];

      [(UIKeyboardEmojiWellView *)self setUnreleasedBanner:0];
    }
  }
}

- (void)setSelectionBackgroundColor:(id)a3
{
  objc_storeStrong((id *)&self->_selectionBackgroundColor, a3);
  id v5 = a3;
  id v6 = [(UIKeyboardEmojiWellView *)self backgroundView];
  [v6 setBackgroundColor:v5];
}

- (void)setSelected:(BOOL)a3
{
  self->_selected = a3;
  BOOL v3 = !a3;
  id v4 = [(UIKeyboardEmojiWellView *)self backgroundView];
  [v4 setHidden:v3];
}

- (void)setActiveSelection:(BOOL)a3
{
  if (a3)
  {
    if (!self->_activeSelection)
    {
      id v5 = +[UIColor systemBlueColor];
      [(UIKeyboardEmojiWellView *)self setSelectionBackgroundColor:v5];

      [(UIKeyboardEmojiWellView *)self setSelected:1];
    }
  }
  else
  {
    -[UIKeyboardEmojiWellView setSelected:](self, "setSelected:");
  }
  self->_activeSelection = a3;
}

- (void)layoutSubviews
{
  v50[1] = *MEMORY[0x1E4F143B8];
  v46.receiver = self;
  v46.super_class = (Class)UIKeyboardEmojiWellView;
  [(UIView *)&v46 layoutSubviews];
  BOOL v3 = [(UIKeyboardEmojiWellView *)self wellContentView];
  [(UIView *)self bounds];
  double v5 = v4;
  double v7 = v6;
  [(UIView *)self bounds];
  double v9 = v8;
  double v11 = v10;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v12 = v3;
    uint64_t v13 = [v12 text];
    uint64_t v49 = *(void *)off_1E52D2040;
    uint64_t v14 = v49;
    v15 = [v12 font];
    v50[0] = v15;
    v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v50 forKeys:&v49 count:1];
    [v13 sizeWithAttributes:v16];
    double v5 = v17;
    double v7 = v18;

    id v19 = [v12 text];
    uint64_t v47 = v14;
    long long v20 = [v12 font];

    v48 = v20;
    v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v48 forKeys:&v47 count:1];
    objc_msgSend(v19, "boundingRectWithSize:options:attributes:context:", 8, v21, 0, 1.79769313e308, 1.79769313e308);
    double v9 = v22;
    double v11 = v23;

LABEL_5:
    goto LABEL_6;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v19 = v3;
    [v19 imageSize];
    double v5 = v24;
    double v7 = v25;
    [v19 imageSize];
    double v9 = v26;
    double v11 = v27;
    goto LABEL_5;
  }
LABEL_6:
  [(UIView *)self bounds];
  double v30 = v29 + (v28 - v5) * 0.5;
  double v33 = v32 + (v31 - v7) * 0.5;
  [(UIView *)self bounds];
  CGFloat v36 = v35 + (v34 - v9) * 0.5;
  CGFloat v39 = v38 + (v37 - v11) * 0.5;
  CGAffineTransform v40 = [(UIKeyboardEmojiWellView *)self wellContentView];
  objc_msgSend(v40, "setFrame:", v30, v33, v5, v7);

  v51.origin.double x = v36;
  v51.origin.double y = v39;
  v51.size.double width = v9;
  v51.size.double height = v11;
  CGRect v52 = CGRectInset(v51, -4.0, -4.0);
  double x = v52.origin.x;
  double y = v52.origin.y;
  double width = v52.size.width;
  double height = v52.size.height;
  v45 = [(UIKeyboardEmojiWellView *)self backgroundView];
  objc_msgSend(v45, "setFrame:", x, y, width, height);
}

- (void)dragWillBegin:(id)a3
{
}

- (CGSize)compositeImageSize
{
  double width = self->_compositeImageSize.width;
  double height = self->_compositeImageSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setCompositeImageSize:(CGSize)a3
{
  self->_compositeImageSize = a3;
}

- (NSArray)compositeImageRepresentation
{
  return self->_compositeImageRepresentation;
}

- (UIFont)labelFont
{
  return self->_labelFont;
}

- (void)setLabelFont:(id)a3
{
}

- (NSString)stringRepresentation
{
  return self->_stringRepresentation;
}

- (BOOL)isSelected
{
  return self->_selected;
}

- (BOOL)isActiveSelection
{
  return self->_activeSelection;
}

- (UIColor)selectionBackgroundColor
{
  return self->_selectionBackgroundColor;
}

- (NSIndexPath)associatedIndexPath
{
  return self->_associatedIndexPath;
}

- (void)setAssociatedIndexPath:(id)a3
{
}

- (BOOL)unreleasedHighlight
{
  return self->_unreleasedHighlight;
}

- (UILabel)unreleasedBanner
{
  return self->_unreleasedBanner;
}

- (void)setUnreleasedBanner:(id)a3
{
}

- (UIView)wellContentView
{
  return self->_wellContentView;
}

- (UIView)backgroundView
{
  return self->_backgroundView;
}

- (void)setBackgroundView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_wellContentView, 0);
  objc_storeStrong((id *)&self->_unreleasedBanner, 0);
  objc_storeStrong((id *)&self->_associatedIndexPath, 0);
  objc_storeStrong((id *)&self->_selectionBackgroundColor, 0);
  objc_storeStrong((id *)&self->_stringRepresentation, 0);
  objc_storeStrong((id *)&self->_labelFont, 0);
  objc_storeStrong((id *)&self->_compositeImageRepresentation, 0);
}

@end
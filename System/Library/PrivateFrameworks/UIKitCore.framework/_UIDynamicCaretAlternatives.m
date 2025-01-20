@interface _UIDynamicCaretAlternatives
- (NSArray)alternativesButtons;
- (UIView)horizontalDivider;
- (UIView)verticalDivider;
- (_UIDynamicCaretAlternatives)initWithFrame:(CGRect)a3;
- (int64_t)indexOfButtonForPoint:(CGPoint)a3;
- (void)highlightButtonAtIndex:(int64_t)a3;
- (void)layoutSubviews;
- (void)setAlternativesButtons:(id)a3;
- (void)setButtonLabels:(id)a3;
- (void)setHorizontalDivider:(id)a3;
- (void)setVerticalDivider:(id)a3;
@end

@implementation _UIDynamicCaretAlternatives

- (_UIDynamicCaretAlternatives)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  v23.receiver = self;
  v23.super_class = (Class)_UIDynamicCaretAlternatives;
  v5 = -[UIView initWithFrame:](&v23, sel_initWithFrame_, a3.origin.x, a3.origin.y);
  v6 = v5;
  if (v5)
  {
    [(UIView *)v5 setOpaque:0];
    [(UIView *)v6 setUserInteractionEnabled:0];
    [(UIView *)v6 setAutoresizingMask:18];
    v7 = -[UIView initWithFrame:]([UIView alloc], "initWithFrame:", width * 0.5, 0.0, 1.0, height);
    [(_UIDynamicCaretAlternatives *)v6 setVerticalDivider:v7];

    v8 = +[UIColor colorWithWhite:1.0 alpha:0.15];
    v9 = [(_UIDynamicCaretAlternatives *)v6 verticalDivider];
    [v9 setBackgroundColor:v8];

    v10 = [(_UIDynamicCaretAlternatives *)v6 verticalDivider];
    [(UIView *)v6 addSubview:v10];

    v11 = -[UIView initWithFrame:]([UIView alloc], "initWithFrame:", 0.0, height * 0.5, 1.0, width);
    [(_UIDynamicCaretAlternatives *)v6 setHorizontalDivider:v11];

    v12 = +[UIColor colorWithWhite:1.0 alpha:0.15];
    v13 = [(_UIDynamicCaretAlternatives *)v6 horizontalDivider];
    [v13 setBackgroundColor:v12];

    v14 = [(_UIDynamicCaretAlternatives *)v6 horizontalDivider];
    [(UIView *)v6 addSubview:v14];

    v15 = [MEMORY[0x1E4F1CA48] array];
    double v16 = *MEMORY[0x1E4F1DB28];
    double v17 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v18 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v19 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    uint64_t v20 = 4;
    do
    {
      v21 = -[UIButton initWithFrame:]([UIButton alloc], "initWithFrame:", v16, v17, v18, v19);
      [(UIView *)v6 addSubview:v21];
      [v15 addObject:v21];

      --v20;
    }
    while (v20);
    [(_UIDynamicCaretAlternatives *)v6 setAlternativesButtons:v15];
  }
  return v6;
}

- (void)layoutSubviews
{
  v15.receiver = self;
  v15.super_class = (Class)_UIDynamicCaretAlternatives;
  [(UIView *)&v15 layoutSubviews];
  [(UIView *)self frame];
  double v4 = v3;
  double v6 = v5;
  [(UIView *)self center];
  double v8 = v7;
  double v10 = v9;
  v11 = [(_UIDynamicCaretAlternatives *)self verticalDivider];
  objc_msgSend(v11, "setFrame:", v8, 0.0, 1.0, v6);

  v12 = [(_UIDynamicCaretAlternatives *)self horizontalDivider];
  objc_msgSend(v12, "setFrame:", 0.0, v10, v4, 1.0);

  v13 = [(_UIDynamicCaretAlternatives *)self alternativesButtons];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __45___UIDynamicCaretAlternatives_layoutSubviews__block_invoke;
  v14[3] = &__block_descriptor_48_e25_v32__0__UIButton_8Q16_B24l;
  *(double *)&v14[4] = v8;
  *(double *)&v14[5] = v10;
  [v13 enumerateObjectsUsingBlock:v14];
}

- (void)setButtonLabels:(id)a3
{
  id v4 = a3;
  double v5 = [(_UIDynamicCaretAlternatives *)self alternativesButtons];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __47___UIDynamicCaretAlternatives_setButtonLabels___block_invoke;
  v7[3] = &unk_1E530AB70;
  id v8 = v4;
  id v6 = v4;
  [v5 enumerateObjectsUsingBlock:v7];
}

- (int64_t)indexOfButtonForPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v6 = [(_UIDynamicCaretAlternatives *)self alternativesButtons];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = 0;
    uint64_t v10 = *(void *)v17;
    while (2)
    {
      uint64_t v11 = 0;
      uint64_t v12 = v8 + v9;
      do
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v6);
        }
        v13 = *(void **)(*((void *)&v16 + 1) + 8 * v11);
        objc_msgSend(v13, "convertPoint:fromView:", self, x, y);
        if (objc_msgSend(v13, "pointInside:withEvent:", 0))
        {
          int64_t v14 = v9 + v11;
          goto LABEL_11;
        }
        ++v11;
      }
      while (v8 != v11);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
      uint64_t v9 = v12;
      if (v8) {
        continue;
      }
      break;
    }
  }
  int64_t v14 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_11:

  return v14;
}

- (void)highlightButtonAtIndex:(int64_t)a3
{
  if ((a3 & 0x8000000000000000) == 0)
  {
    double v5 = [(_UIDynamicCaretAlternatives *)self alternativesButtons];
    unint64_t v6 = [v5 count];

    if (v6 > a3)
    {
      id v8 = [(_UIDynamicCaretAlternatives *)self alternativesButtons];
      uint64_t v7 = [v8 objectAtIndex:a3];
      [v7 setHighlighted:1];
    }
  }
}

- (UIView)verticalDivider
{
  return self->_verticalDivider;
}

- (void)setVerticalDivider:(id)a3
{
}

- (UIView)horizontalDivider
{
  return self->_horizontalDivider;
}

- (void)setHorizontalDivider:(id)a3
{
}

- (NSArray)alternativesButtons
{
  return self->_alternativesButtons;
}

- (void)setAlternativesButtons:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alternativesButtons, 0);
  objc_storeStrong((id *)&self->_horizontalDivider, 0);
  objc_storeStrong((id *)&self->_verticalDivider, 0);
}

@end
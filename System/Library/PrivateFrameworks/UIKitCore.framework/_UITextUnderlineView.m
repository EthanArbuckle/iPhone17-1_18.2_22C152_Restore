@interface _UITextUnderlineView
- (BOOL)useDirectionalLightEffect;
- (CGRect)underlineFrameFromRect:(id)a3 underlineHeight:(double)a4;
- (NSArray)underlineRects;
- (_UITextUnderlineView)initWithFrame:(CGRect)a3;
- (void)addUnderlines:(id)a3 animated:(BOOL)a4;
- (void)clearAllUnderlinesAnimated:(BOOL)a3;
- (void)layoutSubviews;
- (void)removeUnderlines:(id)a3 animated:(BOOL)a4;
- (void)setUnderlineRects:(id)a3;
- (void)setUseDirectionalLightEffect:(BOOL)a3;
@end

@implementation _UITextUnderlineView

- (_UITextUnderlineView)initWithFrame:(CGRect)a3
{
  v10.receiver = self;
  v10.super_class = (Class)_UITextUnderlineView;
  v3 = -[_UITextSelectionHighlightView initWithFrame:](&v10, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(UIView *)v3 setUserInteractionEnabled:0];
    v4->_useDirectionalLightEffect = 0;
    v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    underlineViews = v4->_underlineViews;
    v4->_underlineViews = v5;

    v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    trackedUnderlineRects = v4->_trackedUnderlineRects;
    v4->_trackedUnderlineRects = v7;
  }
  return v4;
}

- (void)setUseDirectionalLightEffect:(BOOL)a3
{
  if (self->_useDirectionalLightEffect != a3)
  {
    self->_useDirectionalLightEffect = a3;
    baseView = self->_baseView;
    if (a3)
    {
      if (!baseView)
      {
        v7 = [UIVisualEffectView alloc];
        v8 = [(_UITextUnderlineView *)self effectForProofreadingUnderlines];
        v9 = [(UIVisualEffectView *)v7 initWithEffect:v8];
        objc_super v10 = self->_baseView;
        self->_baseView = v9;

        v11 = self->_baseView;
        [(UIView *)self insertSubview:v11 atIndex:0];
      }
    }
    else
    {
      v5 = [(UIView *)baseView superview];

      if (v5) {
        [(UIView *)self->_baseView removeFromSuperview];
      }
      v6 = self->_baseView;
      self->_baseView = 0;
    }
  }
}

- (void)setUnderlineRects:(id)a3
{
  id v6 = a3;
  if ([v6 count])
  {
    if (([(NSMutableArray *)self->_trackedUnderlineRects isEqualToArray:v6] & 1) == 0)
    {
      [(NSMutableArray *)self->_trackedUnderlineRects removeAllObjects];
      while (1)
      {
        unint64_t v4 = [(NSMutableArray *)self->_underlineViews count];
        if (v4 <= [v6 count]) {
          break;
        }
        v5 = [(NSMutableArray *)self->_underlineViews firstObject];
        [v5 removeFromSuperview];
        [(NSMutableArray *)self->_underlineViews removeObject:v5];
      }
      [(_UITextUnderlineView *)self addUnderlines:v6 animated:0];
      [(UIView *)self setNeedsLayout];
    }
  }
  else
  {
    [(_UITextUnderlineView *)self clearAllUnderlinesAnimated:0];
  }
}

- (NSArray)underlineRects
{
  return (NSArray *)self->_trackedUnderlineRects;
}

- (void)addUnderlines:(id)a3 animated:(BOOL)a4
{
  -[NSMutableArray addObjectsFromArray:](self->_trackedUnderlineRects, "addObjectsFromArray:", a3, a4);
  [(UIView *)self setNeedsLayout];
  uint64_t v5 = [(UIView *)self window];
  if (v5)
  {
    id v6 = (void *)v5;
    BOOL v7 = +[UIView _isInAnimationBlockWithAnimationsEnabled];

    if (v7)
    {
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v8[2] = __47___UITextUnderlineView_addUnderlines_animated___block_invoke;
      v8[3] = &unk_1E52D9F70;
      v8[4] = self;
      +[UIView performWithoutAnimation:v8];
    }
  }
}

- (void)removeUnderlines:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  BOOL v7 = [MEMORY[0x1E4F1CA48] array];
  if ([v6 count])
  {
    BOOL v15 = v4;
    unint64_t v8 = 0;
    do
    {
      v9 = [v6 objectAtIndex:v8];
      unint64_t v10 = [(NSMutableArray *)self->_trackedUnderlineRects indexOfObject:v9];
      if (v10 != 0x7FFFFFFFFFFFFFFFLL)
      {
        unint64_t v11 = v10;
        if (v10 < [(NSMutableArray *)self->_underlineViews count])
        {
          v12 = [(NSMutableArray *)self->_underlineViews objectAtIndex:v11];
          [v7 addObject:v12];
        }
      }

      ++v8;
    }
    while (v8 < [v6 count]);
    BOOL v4 = v15;
  }
  [(NSMutableArray *)self->_trackedUnderlineRects removeObjectsInArray:v6];
  if ([v7 count])
  {
    [(NSMutableArray *)self->_underlineViews removeObjectsInArray:v7];
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __50___UITextUnderlineView_removeUnderlines_animated___block_invoke;
    aBlock[3] = &unk_1E52DC3A0;
    id v21 = v7;
    v13 = _Block_copy(aBlock);
    v14 = v13;
    if (v4)
    {
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __50___UITextUnderlineView_removeUnderlines_animated___block_invoke_2;
      v18[3] = &unk_1E52DA040;
      id v19 = v13;
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __50___UITextUnderlineView_removeUnderlines_animated___block_invoke_3;
      v16[3] = &unk_1E52EDA60;
      v16[4] = self;
      id v17 = v19;
      +[UIView animateWithDuration:v18 animations:v16 completion:0.2];
    }
    else
    {
      (*((void (**)(void *, void))v13 + 2))(v13, 0);
      [(UIView *)self setNeedsLayout];
    }
  }
  else
  {
    [(UIView *)self setNeedsLayout];
  }
}

- (void)clearAllUnderlinesAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = (void *)[(NSMutableArray *)self->_underlineViews copy];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __51___UITextUnderlineView_clearAllUnderlinesAnimated___block_invoke;
  aBlock[3] = &unk_1E52DC3A0;
  id v6 = v5;
  id v13 = v6;
  BOOL v7 = _Block_copy(aBlock);
  [(NSMutableArray *)self->_underlineViews removeAllObjects];
  [(NSMutableArray *)self->_trackedUnderlineRects removeAllObjects];
  if (v3)
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __51___UITextUnderlineView_clearAllUnderlinesAnimated___block_invoke_2;
    v10[3] = &unk_1E52DA040;
    id v11 = v7;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __51___UITextUnderlineView_clearAllUnderlinesAnimated___block_invoke_3;
    v8[3] = &unk_1E52D9FE8;
    id v9 = v11;
    +[UIView animateWithDuration:v10 animations:v8 completion:0.2];
  }
  else
  {
    (*((void (**)(void *, void))v7 + 2))(v7, 0);
  }
}

- (void)layoutSubviews
{
  v19.receiver = self;
  v19.super_class = (Class)_UITextUnderlineView;
  [(_UITextSelectionHighlightView *)&v19 layoutSubviews];
  double x = *MEMORY[0x1E4F1DB28];
  double y = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double width = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double height = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  if ([(NSMutableArray *)self->_trackedUnderlineRects count])
  {
    unint64_t v7 = 0;
    do
    {
      CGMutablePathRef Mutable = CGPathCreateMutable();
      id v9 = [(NSMutableArray *)self->_trackedUnderlineRects objectAtIndex:v7];
      if ([v9 underlineType])
      {
        if (v7 >= [(NSMutableArray *)self->_underlineViews count])
        {
          id v11 = [UIView alloc];
          [v9 rect];
          unint64_t v10 = -[UIView initWithFrame:](v11, "initWithFrame:");
          v12 = [v9 underlineColor];
          if (!v12)
          {
            if ([(_UITextUnderlineView *)self useDirectionalLightEffect]) {
              +[UIColor insertionPointColor];
            }
            else {
            v12 = +[UIColor selectionHighlightColor];
            }
          }
          [(UIView *)v10 setBackgroundColor:v12];
          [(NSMutableArray *)self->_underlineViews addObject:v10];
          if ([(_UITextUnderlineView *)self useDirectionalLightEffect])
          {
            id v13 = [(UIVisualEffectView *)self->_baseView contentView];
            [v13 addSubview:v10];
          }
          else
          {
            [(UIView *)self addSubview:v10];
          }
        }
        else
        {
          unint64_t v10 = [(NSMutableArray *)self->_underlineViews objectAtIndex:v7];
        }
        [(_UITextUnderlineView *)self underlineFrameFromRect:v9 underlineHeight:2.0];
        -[UIView setFrame:](v10, "setFrame:");
        v14 = [(UIView *)v10 layer];
        [v14 setCornerRadius:1.0];

        [v9 rect];
        v22.origin.double x = v15;
        v22.origin.double y = v16;
        v22.size.double width = v17;
        v22.size.double height = v18;
        v20.origin.double x = x;
        v20.origin.double y = y;
        v20.size.double width = width;
        v20.size.double height = height;
        CGRect v21 = CGRectUnion(v20, v22);
        double x = v21.origin.x;
        double y = v21.origin.y;
        double width = v21.size.width;
        double height = v21.size.height;
        if (Mutable) {
          CFRelease(Mutable);
        }
      }
      ++v7;
    }
    while (v7 < [(NSMutableArray *)self->_trackedUnderlineRects count]);
  }
  if ([(_UITextUnderlineView *)self useDirectionalLightEffect]) {
    -[UIView setFrame:](self->_baseView, "setFrame:", x, y, width, height);
  }
}

- (CGRect)underlineFrameFromRect:(id)a3 underlineHeight:(double)a4
{
  id v4 = a3;
  [v4 fullRect];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  [v4 baselineOffset];
  double v12 = v11;

  double v13 = v8 + v12 + 2.0;
  double v14 = 2.0;
  double v15 = v6;
  double v16 = v10;
  result.size.double height = v14;
  result.size.double width = v16;
  result.origin.double y = v13;
  result.origin.double x = v15;
  return result;
}

- (BOOL)useDirectionalLightEffect
{
  return self->_useDirectionalLightEffect;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_baseView, 0);
  objc_storeStrong((id *)&self->_trackedUnderlineRects, 0);
  objc_storeStrong((id *)&self->_underlineViews, 0);
}

@end
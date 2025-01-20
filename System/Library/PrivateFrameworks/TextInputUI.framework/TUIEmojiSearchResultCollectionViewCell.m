@interface TUIEmojiSearchResultCollectionViewCell
+ (id)_createDraggableEmojiLabel;
+ (id)_createEmojiLabel;
+ (id)reuseIdentifier;
- (BOOL)dragEnabled;
- (NSAttributedString)displayedEmojiString;
- (TUIEmojiSearchResultCollectionViewCell)initWithFrame:(CGRect)a3;
- (_TUIKeyboardEmojiDraggableView)emojiLabel;
- (void)layoutSubviews;
- (void)setDisplayedEmojiString:(id)a3;
- (void)setDisplayedEmojiString:(id)a3 animated:(BOOL)a4 withAnimationOffset:(unint64_t)a5;
- (void)setDragEnabled:(BOOL)a3;
- (void)setHighlighted:(BOOL)a3;
@end

@implementation TUIEmojiSearchResultCollectionViewCell

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_emojiLabel, 0);
  objc_storeStrong((id *)&self->_displayedEmojiString, 0);
  objc_storeStrong((id *)&self->_animationToLabel, 0);
  objc_storeStrong((id *)&self->_animationFromLabel, 0);
}

- (_TUIKeyboardEmojiDraggableView)emojiLabel
{
  return self->_emojiLabel;
}

- (BOOL)dragEnabled
{
  return self->_dragEnabled;
}

- (NSAttributedString)displayedEmojiString
{
  return self->_displayedEmojiString;
}

- (void)setDragEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  if (objc_opt_respondsToSelector())
  {
    emojiLabel = self->_emojiLabel;
    [(_TUIKeyboardEmojiDraggableView *)emojiLabel setDragEnabled:v3];
  }
}

- (void)setDisplayedEmojiString:(id)a3 animated:(BOOL)a4 withAnimationOffset:(unint64_t)a5
{
  BOOL v6 = a4;
  id v9 = a3;
  p_displayedEmojiString = &self->_displayedEmojiString;
  if (![(NSAttributedString *)self->_displayedEmojiString isEqualToAttributedString:v9])
  {
    v11 = *p_displayedEmojiString;
    objc_storeStrong((id *)&self->_displayedEmojiString, a3);
    [(_TUIKeyboardEmojiDraggableView *)self->_emojiLabel setAttributedText:*p_displayedEmojiString];
    if (v6)
    {
      double v12 = (double)a5 * 0.03;
      ++self->_nestedAnimationCount;
      [(_TUIKeyboardEmojiDraggableView *)self->_emojiLabel setHidden:1];
      if (!self->_animationFromLabel)
      {
        v13 = [(id)objc_opt_class() _createEmojiLabel];
        animationFromLabel = self->_animationFromLabel;
        self->_animationFromLabel = v13;

        [(UILabel *)self->_animationFromLabel setAttributedText:v11];
        [(_TUIKeyboardEmojiDraggableView *)self->_emojiLabel frame];
        -[UILabel setFrame:](self->_animationFromLabel, "setFrame:");
        [(TUIEmojiSearchResultCollectionViewCell *)self addSubview:self->_animationFromLabel];
        v35[4] = self;
        v36[0] = MEMORY[0x1E4F143A8];
        v36[1] = 3221225472;
        v36[2] = __95__TUIEmojiSearchResultCollectionViewCell_setDisplayedEmojiString_animated_withAnimationOffset___block_invoke;
        v36[3] = &unk_1E55941A8;
        v36[4] = self;
        v35[0] = MEMORY[0x1E4F143A8];
        v35[1] = 3221225472;
        v35[2] = __95__TUIEmojiSearchResultCollectionViewCell_setDisplayedEmojiString_animated_withAnimationOffset___block_invoke_2;
        v35[3] = &unk_1E5593E00;
        [MEMORY[0x1E4FB1EB0] animateWithDuration:4 delay:v36 usingSpringWithDamping:v35 initialSpringVelocity:0.4 options:v12 animations:1.0 completion:1.0];
      }
      animationToLabel = self->_animationToLabel;
      if (animationToLabel)
      {
        v16 = animationToLabel;
        v17 = (void *)MEMORY[0x1E4FB1EB0];
        v33[0] = MEMORY[0x1E4F143A8];
        v33[1] = 3221225472;
        v33[2] = __95__TUIEmojiSearchResultCollectionViewCell_setDisplayedEmojiString_animated_withAnimationOffset___block_invoke_3;
        v33[3] = &unk_1E55941A8;
        v34 = v16;
        v31[0] = MEMORY[0x1E4F143A8];
        v31[1] = 3221225472;
        v31[2] = __95__TUIEmojiSearchResultCollectionViewCell_setDisplayedEmojiString_animated_withAnimationOffset___block_invoke_4;
        v31[3] = &unk_1E5593E00;
        v32 = v34;
        v18 = v34;
        [v17 animateWithDuration:4 delay:v33 options:v31 animations:0.2 completion:0.0];
      }
      v19 = [(id)objc_opt_class() _createEmojiLabel];
      v20 = self->_animationToLabel;
      self->_animationToLabel = v19;

      [(UILabel *)self->_animationToLabel setAttributedText:*p_displayedEmojiString];
      [(_TUIKeyboardEmojiDraggableView *)self->_emojiLabel frame];
      -[UILabel setFrame:](self->_animationToLabel, "setFrame:");
      [(TUIEmojiSearchResultCollectionViewCell *)self addSubview:self->_animationToLabel];
      v21 = self->_animationToLabel;
      [(UILabel *)v21 setAlpha:0.0];
      CGAffineTransformMakeScale(&v30, 0.001, 0.001);
      CGAffineTransform v29 = v30;
      [(UILabel *)v21 setTransform:&v29];
      v22 = (void *)MEMORY[0x1E4FB1EB0];
      v27[0] = MEMORY[0x1E4F143A8];
      v27[1] = 3221225472;
      v27[2] = __95__TUIEmojiSearchResultCollectionViewCell_setDisplayedEmojiString_animated_withAnimationOffset___block_invoke_5;
      v27[3] = &unk_1E55941A8;
      v28 = v21;
      v24[0] = MEMORY[0x1E4F143A8];
      v24[1] = 3221225472;
      v24[2] = __95__TUIEmojiSearchResultCollectionViewCell_setDisplayedEmojiString_animated_withAnimationOffset___block_invoke_6;
      v24[3] = &unk_1E5593E28;
      v25 = v28;
      v26 = self;
      v23 = v28;
      [v22 animateWithDuration:4 delay:v27 usingSpringWithDamping:v24 initialSpringVelocity:0.4 options:v12 animations:1.0 completion:1.0];
    }
  }
}

uint64_t __95__TUIEmojiSearchResultCollectionViewCell_setDisplayedEmojiString_animated_withAnimationOffset___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 640) setAlpha:0.0];
  CGAffineTransformMakeScale(&v5, 0.001, 0.001);
  v2 = *(void **)(*(void *)(a1 + 32) + 640);
  CGAffineTransform v4 = v5;
  return [v2 setTransform:&v4];
}

void __95__TUIEmojiSearchResultCollectionViewCell_setDisplayedEmojiString_animated_withAnimationOffset___block_invoke_2(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 640) removeFromSuperview];
  uint64_t v2 = *(void *)(a1 + 32);
  BOOL v3 = *(void **)(v2 + 640);
  *(void *)(v2 + 640) = 0;
}

uint64_t __95__TUIEmojiSearchResultCollectionViewCell_setDisplayedEmojiString_animated_withAnimationOffset___block_invoke_3(uint64_t a1)
{
  CGAffineTransformMakeScale(&v5, 0.001, 0.001);
  uint64_t v2 = *(void **)(a1 + 32);
  CGAffineTransform v4 = v5;
  return [v2 setTransform:&v4];
}

uint64_t __95__TUIEmojiSearchResultCollectionViewCell_setDisplayedEmojiString_animated_withAnimationOffset___block_invoke_4(uint64_t result, int a2)
{
  if (a2) {
    return [*(id *)(result + 32) removeFromSuperview];
  }
  return result;
}

uint64_t __95__TUIEmojiSearchResultCollectionViewCell_setDisplayedEmojiString_animated_withAnimationOffset___block_invoke_5(uint64_t a1)
{
  [*(id *)(a1 + 32) setAlpha:1.0];
  uint64_t v2 = *(void **)(a1 + 32);
  long long v3 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  v5[0] = *MEMORY[0x1E4F1DAB8];
  v5[1] = v3;
  v5[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  return [v2 setTransform:v5];
}

uint64_t __95__TUIEmojiSearchResultCollectionViewCell_setDisplayedEmojiString_animated_withAnimationOffset___block_invoke_6(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) removeFromSuperview];
  --*(void *)(*(void *)(a1 + 40) + 656);
  uint64_t v3 = *(void *)(a1 + 40);
  if (!*(void *)(v3 + 656))
  {
    CGAffineTransform v4 = *(void **)(v3 + 648);
    *(void *)(v3 + 648) = 0;

    CGAffineTransform v5 = *(void **)(*(void *)(a1 + 40) + 680);
    return [v5 setHidden:0];
  }
  return result;
}

- (void)setDisplayedEmojiString:(id)a3
{
}

- (void)setHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  v8.receiver = self;
  v8.super_class = (Class)TUIEmojiSearchResultCollectionViewCell;
  -[TUIEmojiSearchResultCollectionViewCell setHighlighted:](&v8, sel_setHighlighted_);
  CGAffineTransform v5 = [MEMORY[0x1E4FB1618] clearColor];
  if (v3)
  {
    uint64_t v6 = [MEMORY[0x1E4FB1618] systemFillColor];

    CGAffineTransform v5 = (void *)v6;
  }
  v7 = [(TUIEmojiSearchResultCollectionViewCell *)self backgroundView];
  [v7 setBackgroundColor:v5];
}

- (void)layoutSubviews
{
  v21.receiver = self;
  v21.super_class = (Class)TUIEmojiSearchResultCollectionViewCell;
  [(TUIEmojiSearchResultCollectionViewCell *)&v21 layoutSubviews];
  [(TUIEmojiSearchResultCollectionViewCell *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  v11 = [(TUIEmojiSearchResultCollectionViewCell *)self backgroundView];
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);

  double v12 = [(TUIEmojiSearchResultCollectionViewCell *)self contentView];
  [v12 bounds];
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;

  UIRectGetCenter();
  -[_TUIKeyboardEmojiDraggableView setCenter:](self->_emojiLabel, "setCenter:");
  -[_TUIKeyboardEmojiDraggableView setBounds:](self->_emojiLabel, "setBounds:", v14, v16, v18, v20);
}

- (TUIEmojiSearchResultCollectionViewCell)initWithFrame:(CGRect)a3
{
  v15.receiver = self;
  v15.super_class = (Class)TUIEmojiSearchResultCollectionViewCell;
  double v3 = -[TUIEmojiSearchResultCollectionViewCell initWithFrame:](&v15, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    uint64_t v4 = [(id)objc_opt_class() _createDraggableEmojiLabel];
    emojiLabel = v3->_emojiLabel;
    v3->_emojiLabel = (_TUIKeyboardEmojiDraggableView *)v4;

    double v6 = [(TUIEmojiSearchResultCollectionViewCell *)v3 contentView];
    [v6 addSubview:v3->_emojiLabel];

    double v7 = [MEMORY[0x1E4FB1618] clearColor];
    [(TUIEmojiSearchResultCollectionViewCell *)v3 setBackgroundColor:v7];

    id v8 = objc_alloc(MEMORY[0x1E4FB1EB0]);
    double v9 = objc_msgSend(v8, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    [(TUIEmojiSearchResultCollectionViewCell *)v3 setBackgroundView:v9];

    double v10 = [(TUIEmojiSearchResultCollectionViewCell *)v3 backgroundView];
    v11 = [v10 layer];
    [v11 setCornerRadius:5.0];

    double v12 = [(TUIEmojiSearchResultCollectionViewCell *)v3 backgroundView];
    double v13 = [v12 layer];
    [v13 setMasksToBounds:1];
  }
  return v3;
}

+ (id)_createEmojiLabel
{
  id v2 = objc_alloc(MEMORY[0x1E4FB1930]);
  double v3 = objc_msgSend(v2, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  [v3 setTextAlignment:1];
  [v3 setAdjustsFontSizeToFitWidth:1];
  [v3 setBaselineAdjustment:1];
  return v3;
}

+ (id)_createDraggableEmojiLabel
{
  double v3 = objc_msgSend(objc_alloc(NSClassFromString(&cfstr_Uikeyboardemoj.isa)), "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  if (objc_opt_respondsToSelector())
  {
    id v4 = v3;
  }
  else
  {
    id v4 = [a1 _createEmojiLabel];
  }
  double v5 = v4;

  return v5;
}

+ (id)reuseIdentifier
{
  return @"esearchresultcell";
}

@end
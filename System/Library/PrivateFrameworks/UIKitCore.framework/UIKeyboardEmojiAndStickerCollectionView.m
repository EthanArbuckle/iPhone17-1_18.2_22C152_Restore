@interface UIKeyboardEmojiAndStickerCollectionView
- (BOOL)isInSearchPopover;
- (UIKeyboardEmojiAndStickerCollectionView)initWithFrame:(CGRect)a3 collectionViewLayout:(id)a4 emojiGraphicsTraits:(id)a5;
- (UIKeyboardEmojiGraphicsTraits)emojiGraphicsTraits;
- (UIResponder)hitTestResponder;
- (id)accessibilityIdentifier;
- (id)backgroundColor;
- (id)closestCellForPoint:(CGPoint)a3;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (void)disableConflictingGestureRecognizers;
- (void)enableConflictingGestureRecognizers;
- (void)layoutSubviews;
- (void)setHitTestResponder:(id)a3;
- (void)setIsInSearchPopover:(BOOL)a3;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesCancelled:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
- (void)touchesMoved:(id)a3 withEvent:(id)a4;
- (void)willCancelVariants:(id)a3;
@end

@implementation UIKeyboardEmojiAndStickerCollectionView

- (UIKeyboardEmojiAndStickerCollectionView)initWithFrame:(CGRect)a3 collectionViewLayout:(id)a4 emojiGraphicsTraits:(id)a5
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v12 = a5;
  v19.receiver = self;
  v19.super_class = (Class)UIKeyboardEmojiAndStickerCollectionView;
  v13 = -[UICollectionView initWithFrame:collectionViewLayout:](&v19, sel_initWithFrame_collectionViewLayout_, a4, x, y, width, height);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_emojiGraphicsTraits, a5);
    v15 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    gestureRecognizersToEnable = v14->_gestureRecognizersToEnable;
    v14->_gestureRecognizersToEnable = v15;

    if (v12 && v12[8]) {
      [(UIScrollView *)v14 _setAutomaticContentOffsetAdjustmentEnabled:0];
    }
    v17 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v17 addObserver:v14 selector:sel_willCancelVariants_ name:@"UIKeyboardWillCancelEmojiVariants" object:0];
  }
  return v14;
}

- (id)accessibilityIdentifier
{
  return @"UIKeyboardEmojiAndStickerCollectionView Preview";
}

- (void)layoutSubviews
{
  v3 = [(UICollectionView *)self dataSource];

  if (v3)
  {
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __57__UIKeyboardEmojiAndStickerCollectionView_layoutSubviews__block_invoke;
    v4[3] = &unk_1E52D9F70;
    v4[4] = self;
    +[UIView performWithoutAnimation:v4];
  }
}

id __57__UIKeyboardEmojiAndStickerCollectionView_layoutSubviews__block_invoke(uint64_t a1)
{
  v2.receiver = *(id *)(a1 + 32);
  v2.super_class = (Class)UIKeyboardEmojiAndStickerCollectionView;
  return objc_msgSendSuper2(&v2, sel_layoutSubviews);
}

- (id)backgroundColor
{
  return +[UIColor clearColor];
}

- (id)closestCellForPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  [(UIKeyboardEmojiGraphicsTraits *)self->_emojiGraphicsTraits emojiKeyWidth];
  double v7 = v6;
  double v36 = x;
  double v8 = x - v6;
  double v9 = y - v6;
  double v10 = v6 + v6;
  double v11 = y;
  double v12 = y + v6 + v6;
  v13 = [(UICollectionView *)self collectionViewLayout];
  v14 = objc_msgSend(v13, "layoutAttributesForElementsInRect:", v8, v9, v10, v12);

  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id v15 = v14;
  uint64_t v16 = [v15 countByEnumeratingWithState:&v37 objects:v41 count:16];
  if (!v16)
  {
    v34 = 0;
    v18 = v15;
    goto LABEL_20;
  }
  uint64_t v17 = v16;
  v18 = 0;
  uint64_t v19 = *(void *)v38;
  double v20 = 1.79769313e308;
  do
  {
    for (uint64_t i = 0; i != v17; ++i)
    {
      if (*(void *)v38 != v19) {
        objc_enumerationMutation(v15);
      }
      v22 = *(void **)(*((void *)&v37 + 1) + 8 * i);
      [v22 frame];
      CGFloat v23 = v44.origin.x;
      CGFloat v24 = v44.origin.y;
      CGFloat width = v44.size.width;
      CGFloat height = v44.size.height;
      double v27 = vabdd_f64(CGRectGetMidX(v44), v36);
      v45.origin.double x = v23;
      v45.origin.double y = v24;
      v45.size.CGFloat width = width;
      v45.size.CGFloat height = height;
      double v28 = vabdd_f64(CGRectGetMidY(v45), v11);
      double v29 = v27 + v28;
      if (v27 <= v7 && v28 <= v7 && v29 < v20)
      {
        id v32 = v22;

        double v20 = v29;
        v18 = v32;
      }
    }
    uint64_t v17 = [v15 countByEnumeratingWithState:&v37 objects:v41 count:16];
  }
  while (v17);

  if (v18)
  {
    v33 = [v18 indexPath];
    v34 = [(UICollectionView *)self cellForItemAtIndexPath:v33];

LABEL_20:
    goto LABEL_22;
  }
  v34 = 0;
LABEL_22:

  return v34;
}

- (void)disableConflictingGestureRecognizers
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(UIView *)self superview];
  if (v3)
  {
    v4 = (void *)v3;
    do
    {
      long long v14 = 0u;
      long long v15 = 0u;
      long long v12 = 0u;
      long long v13 = 0u;
      v5 = objc_msgSend(v4, "gestureRecognizers", 0);
      uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v6)
      {
        uint64_t v7 = v6;
        uint64_t v8 = *(void *)v13;
        do
        {
          uint64_t v9 = 0;
          do
          {
            if (*(void *)v13 != v8) {
              objc_enumerationMutation(v5);
            }
            double v10 = *(void **)(*((void *)&v12 + 1) + 8 * v9);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              if ([v10 isEnabled])
              {
                [(NSMutableArray *)self->_gestureRecognizersToEnable addObject:v10];
                [v10 setEnabled:0];
              }
            }
            ++v9;
          }
          while (v7 != v9);
          uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
        }
        while (v7);
      }

      uint64_t v11 = [v4 superview];

      v4 = (void *)v11;
    }
    while (v11);
  }
}

- (void)enableConflictingGestureRecognizers
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v3 = self->_gestureRecognizersToEnable;
  uint64_t v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * v7++), "setEnabled:", 1, (void)v8);
      }
      while (v5 != v7);
      uint64_t v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }

  [(NSMutableArray *)self->_gestureRecognizersToEnable removeAllObjects];
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  id v30 = a3;
  id v6 = a4;
  if ([(UIKeyboardEmojiAndStickerCollectionView *)self isInSearchPopover])
  {
    uint64_t v7 = [v30 anyObject];
    [v7 locationInView:self];
    long long v8 = -[UIKeyboardEmojiAndStickerCollectionView closestCellForPoint:](self, "closestCellForPoint:");

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v9 = [v8 emoji];

      if (v9)
      {
        long long v10 = +[UIKeyboardImpl activeInstance];
        [v10 clearForwardingInputDelegateAndResign:0];
      }
    }
  }
  if ([(UIScrollView *)self isDragging]
    || ([(UIScrollView *)self contentOffset], v11 < 0.0))
  {
    BOOL v12 = 0;
  }
  else
  {
    [(UIScrollView *)self contentOffset];
    double v14 = v13;
    [(UIView *)self bounds];
    double v16 = v14 + v15;
    [(UIScrollView *)self contentSize];
    BOOL v12 = v16 <= v17;
  }
  if (_AXSVoiceOverTouchEnabled())
  {
    v18 = [(UICollectionView *)self collectionViewLayout];
    uint64_t v19 = [v18 scrollDirection];

    if (v19
      || [(UIScrollView *)self isDragging]
      || ([(UIScrollView *)self contentOffset], v20 < 0.0))
    {
      BOOL v21 = 0;
    }
    else
    {
      [(UIScrollView *)self contentOffset];
      double v26 = v25;
      [(UIView *)self bounds];
      double v28 = v26 + v27;
      [(UIScrollView *)self contentSize];
      BOOL v21 = v28 <= v29;
    }
    if (v19 != 1) {
      BOOL v12 = 0;
    }
    if (v21) {
      goto LABEL_19;
    }
  }
  if (v12)
  {
LABEL_19:
    [(UICollectionView *)self setScrollEnabled:0];
    [(UIKeyboardEmojiAndStickerCollectionView *)self disableConflictingGestureRecognizers];
    v22 = [(UICollectionView *)self indexPathsForSelectedItems];
    CGFloat v23 = [v22 firstObject];
    [(UICollectionView *)self deselectItemAtIndexPath:v23 animated:0];

    CGFloat v24 = [(UIKeyboardEmojiAndStickerCollectionView *)self hitTestResponder];
    [v24 touchesBegan:v30 withEvent:v6];
  }
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  if (![(UIScrollView *)self isDragging])
  {
    uint64_t v7 = [(UIKeyboardEmojiAndStickerCollectionView *)self hitTestResponder];
    [v7 touchesMoved:v8 withEvent:v6];

    self->_touchDidMove = 1;
  }
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  if (![(UIScrollView *)self isDragging])
  {
    uint64_t v7 = [(UIKeyboardEmojiAndStickerCollectionView *)self hitTestResponder];
    [v7 touchesEnded:v8 withEvent:v6];
  }
  [(UICollectionView *)self setScrollEnabled:1];
  [(UIKeyboardEmojiAndStickerCollectionView *)self enableConflictingGestureRecognizers];
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  if (![(UIScrollView *)self isDragging])
  {
    uint64_t v7 = [(UIKeyboardEmojiAndStickerCollectionView *)self hitTestResponder];
    [v7 touchesCancelled:v8 withEvent:v6];
  }
  [(UICollectionView *)self setScrollEnabled:1];
  [(UIKeyboardEmojiAndStickerCollectionView *)self enableConflictingGestureRecognizers];
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  v24.receiver = self;
  v24.super_class = (Class)UIKeyboardEmojiAndStickerCollectionView;
  -[UIScrollView hitTest:withEvent:](&v24, sel_hitTest_withEvent_, v7, x, y);
  id v8 = (UIKeyboardEmojiAndStickerCollectionView *)objc_claimAutoreleasedReturnValue();
  if (v8 == self)
  {
    long long v9 = -[UIKeyboardEmojiAndStickerCollectionView closestCellForPoint:](self, "closestCellForPoint:", x, y);
    if (v9)
    {
      -[UIView convertPoint:toView:](self, "convertPoint:toView:", v9, x, y);
      double v11 = v10;
      double v13 = v12;
      [v9 bounds];
      [v9 bounds];
      double v15 = v14 + -0.01;
      if (v11 < v14 + -0.01) {
        double v15 = v11;
      }
      if (v15 >= 0.0) {
        double v16 = v15;
      }
      else {
        double v16 = 0.0;
      }
      [v9 bounds];
      double v18 = v17 + -0.01;
      if (v13 < v17 + -0.01) {
        double v18 = v13;
      }
      if (v18 >= 0.0) {
        double v19 = v18;
      }
      else {
        double v19 = 0.0;
      }
      double v20 = objc_msgSend(v9, "hitTest:withEvent:", v7, v16, v19);
      BOOL v21 = v20;
      if (v20)
      {
        v22 = v20;

        self = v22;
      }
    }
    id v8 = self;
  }

  return v8;
}

- (void)willCancelVariants:(id)a3
{
  id v18 = a3;
  uint64_t v4 = [(UIView *)self window];

  if (v4)
  {
    uint64_t v5 = [v18 userInfo];
    id v6 = [v5 objectForKeyedSubscript:@"key"];

    id v7 = [v18 userInfo];
    id v8 = [v7 objectForKeyedSubscript:@"touch"];

    [v6 frame];
    double MidX = CGRectGetMidX(v20);
    [v6 frame];
    double MidY = CGRectGetMidY(v21);
    double v11 = [(UIView *)self superview];
    -[UIView convertPoint:fromView:](self, "convertPoint:fromView:", v11, MidX, MidY);
    double v13 = v12;
    double v15 = v14;

    double v16 = -[UIKeyboardEmojiAndStickerCollectionView closestCellForPoint:](self, "closestCellForPoint:", v13, v15);
    double v17 = [v16 emojiLabel];
    [v17 willCancelVariantsWithTouch:v8];
  }
}

- (UIKeyboardEmojiGraphicsTraits)emojiGraphicsTraits
{
  return (UIKeyboardEmojiGraphicsTraits *)objc_getProperty(self, a2, 3272, 1);
}

- (UIResponder)hitTestResponder
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_hitTestResponder);
  return (UIResponder *)WeakRetained;
}

- (void)setHitTestResponder:(id)a3
{
}

- (BOOL)isInSearchPopover
{
  return self->_isInSearchPopover;
}

- (void)setIsInSearchPopover:(BOOL)a3
{
  self->_isInSearchPopover = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_hitTestResponder);
  objc_storeStrong((id *)&self->_rearrangingPath, 0);
  objc_storeStrong((id *)&self->_gestureRecognizersToEnable, 0);
  objc_storeStrong((id *)&self->_lastTouchedEmojiCell, 0);
  objc_storeStrong((id *)&self->_emojiGraphicsTraits, 0);
}

@end
@interface UIKeyboardEmojiCollectionView
- (BOOL)isInSearchPopover;
- (UIKeyboardEmojiCollectionView)initWithFrame:(CGRect)a3 collectionViewLayout:(id)a4 emojiGraphicsTraits:(id)a5;
- (UIKeyboardEmojiGraphicsTraits)emojiGraphicsTraits;
- (UIResponder)hitTestResponder;
- (id)backgroundColor;
- (id)closestCellForPoint:(CGPoint)a3;
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

@implementation UIKeyboardEmojiCollectionView

- (UIKeyboardEmojiCollectionView)initWithFrame:(CGRect)a3 collectionViewLayout:(id)a4 emojiGraphicsTraits:(id)a5
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v12 = a5;
  v19.receiver = self;
  v19.super_class = (Class)UIKeyboardEmojiCollectionView;
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

- (void)layoutSubviews
{
  v3 = [(UICollectionView *)self dataSource];

  if (v3)
  {
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __47__UIKeyboardEmojiCollectionView_layoutSubviews__block_invoke;
    v4[3] = &unk_1E52D9F70;
    v4[4] = self;
    +[UIView performWithoutAnimation:v4];
  }
}

id __47__UIKeyboardEmojiCollectionView_layoutSubviews__block_invoke(uint64_t a1)
{
  v2.receiver = *(id *)(a1 + 32);
  v2.super_class = (Class)UIKeyboardEmojiCollectionView;
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
  v6 = -[UICollectionView indexPathForItemAtPoint:](self, "indexPathForItemAtPoint:");
  if (v6)
  {
    id v7 = [(UICollectionView *)self cellForItemAtIndexPath:v6];
    goto LABEL_12;
  }
  [(UIKeyboardEmojiGraphicsTraits *)self->_emojiGraphicsTraits emojiKeyWidth];
  double v9 = v8 * 0.5;
  double v10 = y - v8 * 0.5;
  v11 = -[UICollectionView indexPathForItemAtPoint:](self, "indexPathForItemAtPoint:", x, v10);

  if (v11)
  {
    v12 = -[UICollectionView indexPathForItemAtPoint:](self, "indexPathForItemAtPoint:", x, v10);
    v13 = [(UICollectionView *)self cellForItemAtIndexPath:v12];

    v14 = -[UICollectionView indexPathForItemAtPoint:](self, "indexPathForItemAtPoint:", x, y + v9);
    v15 = [(UICollectionView *)self cellForItemAtIndexPath:v14];

    [v13 frame];
    double v16 = vabdd_f64(CGRectGetMaxY(v40), y);
    [v15 frame];
    BOOL v17 = v16 < vabdd_f64(CGRectGetMinY(v41), y);
  }
  else
  {
    v18 = -[UICollectionView indexPathForItemAtPoint:](self, "indexPathForItemAtPoint:", x - v9, y);

    if (!v18)
    {
      v24 = -[UICollectionView indexPathForItemAtPoint:](self, "indexPathForItemAtPoint:", x - v9, v10);
      v13 = [(UICollectionView *)self cellForItemAtIndexPath:v24];

      v25 = -[UICollectionView indexPathForItemAtPoint:](self, "indexPathForItemAtPoint:", x - v9, y + v9);
      v26 = [(UICollectionView *)self cellForItemAtIndexPath:v25];

      v27 = -[UICollectionView indexPathForItemAtPoint:](self, "indexPathForItemAtPoint:", x + v9, v10);
      v28 = [(UICollectionView *)self cellForItemAtIndexPath:v27];

      v29 = -[UICollectionView indexPathForItemAtPoint:](self, "indexPathForItemAtPoint:", x + v9, y + v9);
      v30 = [(UICollectionView *)self cellForItemAtIndexPath:v29];

      [v13 frame];
      double v31 = vabdd_f64(CGRectGetMaxY(v44), y);
      [v26 frame];
      double v32 = vabdd_f64(CGRectGetMinY(v45), y);
      [v13 frame];
      double v33 = vabdd_f64(CGRectGetMaxX(v46), x);
      [v28 frame];
      double v34 = vabdd_f64(CGRectGetMinX(v47), x);
      BOOL v35 = v33 < v34 && v31 < v32;
      v36 = v13;
      if (!v35)
      {
        BOOL v37 = v33 >= v34 || v31 < v32;
        v36 = v26;
        if (v37)
        {
          if (v31 >= v32 || v33 < v34) {
            v36 = v30;
          }
          else {
            v36 = v28;
          }
        }
      }
      id v7 = v36;

      goto LABEL_11;
    }
    objc_super v19 = -[UICollectionView indexPathForItemAtPoint:](self, "indexPathForItemAtPoint:", x - v9, y);
    v13 = [(UICollectionView *)self cellForItemAtIndexPath:v19];

    v20 = -[UICollectionView indexPathForItemAtPoint:](self, "indexPathForItemAtPoint:", x + v9, y);
    v15 = [(UICollectionView *)self cellForItemAtIndexPath:v20];

    [v13 frame];
    double v21 = vabdd_f64(CGRectGetMaxX(v42), x);
    [v15 frame];
    BOOL v17 = v21 < vabdd_f64(CGRectGetMinX(v43), x);
  }
  if (v17) {
    v22 = v13;
  }
  else {
    v22 = v15;
  }
  id v7 = v22;

LABEL_11:
LABEL_12:

  return v7;
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
  if ([(UIKeyboardEmojiCollectionView *)self isInSearchPopover])
  {
    uint64_t v7 = [v30 anyObject];
    [v7 locationInView:self];
    long long v8 = -[UIKeyboardEmojiCollectionView closestCellForPoint:](self, "closestCellForPoint:");

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
    [(UIKeyboardEmojiCollectionView *)self disableConflictingGestureRecognizers];
    v22 = [(UICollectionView *)self indexPathsForSelectedItems];
    v23 = [v22 firstObject];
    [(UICollectionView *)self deselectItemAtIndexPath:v23 animated:0];

    v24 = [(UIKeyboardEmojiCollectionView *)self hitTestResponder];
    [v24 touchesBegan:v30 withEvent:v6];
  }
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  if (![(UIScrollView *)self isDragging])
  {
    uint64_t v7 = [(UIKeyboardEmojiCollectionView *)self hitTestResponder];
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
    uint64_t v7 = [(UIKeyboardEmojiCollectionView *)self hitTestResponder];
    [v7 touchesEnded:v8 withEvent:v6];
  }
  [(UICollectionView *)self setScrollEnabled:1];
  [(UIKeyboardEmojiCollectionView *)self enableConflictingGestureRecognizers];
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  if (![(UIScrollView *)self isDragging])
  {
    uint64_t v7 = [(UIKeyboardEmojiCollectionView *)self hitTestResponder];
    [v7 touchesCancelled:v8 withEvent:v6];
  }
  [(UICollectionView *)self setScrollEnabled:1];
  [(UIKeyboardEmojiCollectionView *)self enableConflictingGestureRecognizers];
}

- (void)willCancelVariants:(id)a3
{
  id v18 = a3;
  uint64_t v4 = [(UIView *)self window];

  if (v4)
  {
    uint64_t v5 = [v18 userInfo];
    id v6 = [v5 objectForKeyedSubscript:@"key"];

    uint64_t v7 = [v18 userInfo];
    id v8 = [v7 objectForKeyedSubscript:@"touch"];

    [v6 frame];
    double MidX = CGRectGetMidX(v20);
    [v6 frame];
    double MidY = CGRectGetMidY(v21);
    double v11 = [(UIView *)self superview];
    -[UIView convertPoint:fromView:](self, "convertPoint:fromView:", v11, MidX, MidY);
    double v13 = v12;
    double v15 = v14;

    double v16 = -[UIKeyboardEmojiCollectionView closestCellForPoint:](self, "closestCellForPoint:", v13, v15);
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
  objc_storeStrong((id *)&self->_gestureRecognizersToEnable, 0);
  objc_storeStrong((id *)&self->_lastTouchedEmojiCell, 0);
  objc_storeStrong((id *)&self->_emojiGraphicsTraits, 0);
}

@end
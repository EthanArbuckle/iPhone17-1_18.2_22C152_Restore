@interface UIKeyboardEmojiCategoryBar
+ (BOOL)wantsScreenTraits;
- (CGRect)categorySelectedCircleRect:(int64_t)a3;
- (CGRect)frameForDivider:(int)a3;
- (CGRect)paddedFrame;
- (UIKBEmojiHitTestResponder)hitTestResponder;
- (UIKeyboardEmojiCategoryBar)initWithFrame:(CGRect)a3 keyplane:(id)a4 key:(id)a5;
- (UIKeyboardEmojiCategoryBar)initWithFrame:(CGRect)a3 keyplane:(id)a4 key:(id)a5 screenTraits:(id)a6;
- (UIKeyboardEmojiGraphicsTraits)emojiGraphicsTraits;
- (UIView)scrubView;
- (unint64_t)flippedIndexForIndex:(unint64_t)a3;
- (unint64_t)selectedIndex;
- (unint64_t)selectedIndexForTouches:(id)a3;
- (void)animateScrubberToRect:(CGRect)a3;
- (void)dealloc;
- (void)didMoveToWindow;
- (void)dimKeys:(id)a3;
- (void)layoutSubviews;
- (void)prepareForDisplay;
- (void)removeFromSuperview;
- (void)setEmojiGraphicsTraits:(id)a3;
- (void)setHitTestResponder:(id)a3;
- (void)setScrubView:(id)a3;
- (void)setSelectedIndex:(unint64_t)a3;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesCancelled:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
- (void)touchesMoved:(id)a3 withEvent:(id)a4;
- (void)updateCategory;
- (void)updateCategoryOnBar:(unint64_t)a3;
- (void)updateToCategory:(int64_t)a3;
@end

@implementation UIKeyboardEmojiCategoryBar

+ (BOOL)wantsScreenTraits
{
  return 1;
}

- (UIKeyboardEmojiCategoryBar)initWithFrame:(CGRect)a3 keyplane:(id)a4 key:(id)a5 screenTraits:(id)a6
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v13 = a4;
  id v14 = a5;
  v15 = a6;
  v33.receiver = self;
  v33.super_class = (Class)UIKeyboardEmojiCategoryBar;
  v16 = -[UIView initWithFrame:](&v33, sel_initWithFrame_, x, y, width, height);
  if (v16)
  {
    if (!v15)
    {
      v17 = +[UIKeyboardImpl keyboardScreen];
      v18 = +[UIKeyboard activeKeyboard];
      +[UIKBScreenTraits traitsWithScreen:orientation:](UIKBScreenTraits, "traitsWithScreen:orientation:", v17, [v18 interfaceOrientation]);
      v15 = (unsigned char *)objc_claimAutoreleasedReturnValue();
    }
    uint64_t v19 = +[UIKeyboardEmojiGraphicsTraits emojiGraphicsTraitsWithScreenTraits:v15];
    emojiGraphicsTraits = v16->_emojiGraphicsTraits;
    v16->_emojiGraphicsTraits = (UIKeyboardEmojiGraphicsTraits *)v19;

    v16->_selectedIndedouble x = -1;
    v16->_isScrubbing = 0;
    v21 = +[UIColor clearColor];
    [(UIView *)v16 setBackgroundColor:v21];

    [(UIView *)v16 setOpaque:0];
    [v14 setState:16];
    [v14 setSelectedVariantIndex:v16->_selectedIndex];
    [(UIKBKeyView *)v16 updateForKeyplane:v13 key:v14];
    scrubView = v16->_scrubView;
    if (!scrubView)
    {
      [(UIKeyboardEmojiGraphicsTraits *)v16->_emojiGraphicsTraits categorySelectedCirWidth];
      v24 = -[UIView initWithFrame:]([UIKeyboardEmojiScrubBarView alloc], "initWithFrame:", 0.0, (height - v23) * 0.5, v23, v23);
      v25 = v16->_scrubView;
      v16->_scrubView = &v24->super;

      [(UIKeyboardEmojiGraphicsTraits *)v16->_emojiGraphicsTraits categorySelectedCirWidth];
      double v27 = v26 * 0.5;
      v28 = [(UIView *)v16->_scrubView layer];
      [v28 setCornerRadius:v27];

      v29 = v16->_scrubView;
      if (v29)
      {
        if (v15) {
          BOOL v30 = v15[35] != 0;
        }
        else {
          BOOL v30 = 0;
        }
        LOBYTE(v29[1].super.super.isa) = v30;
        scrubView = v16->_scrubView;
      }
      else
      {
        scrubView = 0;
      }
    }
    [(UIView *)v16 addSubview:scrubView];
    v31 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v31 addObserver:v16 selector:sel_receiveNotifictaion_ name:@"UIKeyboardEmojiDidScrollNotification" object:0];
  }
  return v16;
}

- (UIKeyboardEmojiCategoryBar)initWithFrame:(CGRect)a3 keyplane:(id)a4 key:(id)a5
{
  return -[UIKeyboardEmojiCategoryBar initWithFrame:keyplane:key:screenTraits:](self, "initWithFrame:keyplane:key:screenTraits:", a4, a5, 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)prepareForDisplay
{
  v10.receiver = self;
  v10.super_class = (Class)UIKeyboardEmojiCategoryBar;
  [(UIKBKeyView *)&v10 prepareForDisplay];
  v3 = +[UIKeyboardEmojiCategory enabledCategoryIndexes];
  v4 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  if ([v3 count])
  {
    unint64_t v5 = 0;
    do
    {
      v6 = +[UIKeyboardEmojiCategory categoryForType:](UIKeyboardEmojiCategory, "categoryForType:", +[UIKeyboardEmojiCategory categoryTypeForCategoryIndex:v5]);
      v7 = [[UIKBTree alloc] initWithType:8];
      v8 = [(UIKBKeyView *)self renderConfig];
      v9 = +[UIKeyboardEmojiGraphics emojiCategoryImagePath:v6 forRenderConfig:v8];
      [(UIKBTree *)v7 setDisplayString:v9];

      [v4 addObject:v7];
      ++v5;
    }
    while (v5 < [v3 count]);
  }
  [(UIKBKeyView *)self updateKeySubtrees:v4];
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self name:@"UIKeyboardEmojiDidScrollNotification" object:0];

  v4.receiver = self;
  v4.super_class = (Class)UIKeyboardEmojiCategoryBar;
  [(UIKBKeyView *)&v4 dealloc];
}

- (void)didMoveToWindow
{
  v3 = [(UIKeyboardEmojiKeyView *)self emojiKeyManager];
  objc_super v4 = [v3 lastViewedCategory];
  unint64_t v5 = +[UIKeyboardEmojiCategory categoryIndexForCategoryType:](UIKeyboardEmojiCategory, "categoryIndexForCategoryType:", [v4 categoryType]);

  [(UIKeyboardEmojiCategoryBar *)self updateCategoryOnBar:v5];
}

- (void)layoutSubviews
{
  v12.receiver = self;
  v12.super_class = (Class)UIKeyboardEmojiCategoryBar;
  [(UIView *)&v12 layoutSubviews];
  if (!self->_isScrubbing)
  {
    [(UIKeyboardEmojiCategoryBar *)self categorySelectedCircleRect:[(UIKeyboardEmojiCategoryBar *)self selectedIndex]];
    double v4 = v3;
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;
    v11 = [(UIKeyboardEmojiCategoryBar *)self scrubView];
    objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);
  }
}

- (void)dimKeys:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)UIKeyboardEmojiCategoryBar;
  [(UIKBKeyView *)&v19 dimKeys:v4];
  double v5 = [(UIView *)self subviews];

  if (v5)
  {
    uint64_t v15 = 0;
    v16 = &v15;
    uint64_t v17 = 0x2020000000;
    char v18 = 1;
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __38__UIKeyboardEmojiCategoryBar_dimKeys___block_invoke;
    v14[3] = &unk_1E52FBAF8;
    v14[4] = &v15;
    [v4 enumerateKeysAndObjectsUsingBlock:v14];
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    double v6 = [(UIView *)self subviews];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v10 objects:v20 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v11;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v11 != v8) {
            objc_enumerationMutation(v6);
          }
          [*(id *)(*((void *)&v10 + 1) + 8 * v9++) setHidden:*((unsigned char *)v16 + 24) == 0];
        }
        while (v7 != v9);
        uint64_t v7 = [v6 countByEnumeratingWithState:&v10 objects:v20 count:16];
      }
      while (v7);
    }

    _Block_object_dispose(&v15, 8);
  }
}

void __38__UIKeyboardEmojiCategoryBar_dimKeys___block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v8 = a3;
  if (([a2 integerValue] & 4) != 0)
  {
    [v8 doubleValue];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v7 != 0.0;
    *a4 = 1;
  }
}

- (void)updateToCategory:(int64_t)a3
{
  unint64_t v4 = +[UIKeyboardEmojiCategory categoryIndexForCategoryType:a3];
  [(UIKeyboardEmojiCategoryBar *)self updateCategoryOnBar:v4];
}

- (void)updateCategoryOnBar:(unint64_t)a3
{
  -[UIKeyboardEmojiCategoryBar setSelectedIndex:](self, "setSelectedIndex:");
  [(UIKBKeyView *)self updateKeySelectedVariantIndex:a3];
  if (!self->_isScrubbing)
  {
    [(UIKeyboardEmojiCategoryBar *)self categorySelectedCircleRect:a3];
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
    long long v13 = [(UIKeyboardEmojiCategoryBar *)self scrubView];
    objc_msgSend(v13, "setFrame:", v6, v8, v10, v12);

    id v14 = [(UIKBKeyView *)self renderConfig];
    int v15 = [v14 whiteText];

    if (v15)
    {
      [(UIView *)self setNeedsDisplay];
    }
  }
}

- (void)updateCategory
{
  double v3 = +[UIKeyboardImpl activeInstance];
  unint64_t v4 = [v3 feedbackGenerator];
  [v4 actionOccurred:1];

  int64_t v5 = +[UIKeyboardEmojiCategory categoryTypeForCategoryIndex:[(UIKeyboardEmojiCategoryBar *)self selectedIndex]];
  id v6 = [(UIKeyboardEmojiKeyView *)self emojiKeyManager];
  [v6 reloadForCategory:v5 withSender:self];
}

- (unint64_t)flippedIndexForIndex:(unint64_t)a3
{
  if (+[UIKeyboardEmojiCategory isRTLMode])
  {
    unint64_t v4 = +[UIKeyboardEmojiCategory enabledCategoryIndexes];
    uint64_t v5 = [v4 count];

    return v5 + ~a3;
  }
  return a3;
}

- (CGRect)paddedFrame
{
  emojiGraphicsTraits = self->_emojiGraphicsTraits;
  if (emojiGraphicsTraits && emojiGraphicsTraits->_isFirstPartyStickers)
  {
    unint64_t v4 = [(UIKBKeyView *)self key];
    [v4 paddedFrame];
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;

    [(UIView *)self frame];
    double v14 = v6 - v13;
    double v16 = v8 - v15;
  }
  else
  {
    [(UIView *)self bounds];
    double v10 = v17;
    double v12 = v18;
  }
  double v19 = v10;
  double v20 = v12;
  result.size.double height = v20;
  result.size.double width = v19;
  result.origin.double y = v16;
  result.origin.double x = v14;
  return result;
}

- (CGRect)frameForDivider:(int)a3
{
  [(UIKeyboardEmojiCategoryBar *)self paddedFrame];
  double v5 = v4 + 4.0;
  double v7 = v6 + -8.0;
  double v9 = v8 + 5.0;
  double v11 = v10 + -13.0;
  double v12 = +[UIKeyboardEmojiCategory enabledCategoryIndexes];
  int v13 = [v12 count];

  double v14 = round(v5 + ((v7 - (double)(v13 + 1)) / (double)v13 + 1.0) * (double)a3);
  double v15 = 1.0;
  double v16 = v9;
  double v17 = v11;
  result.size.double height = v17;
  result.size.double width = v15;
  result.origin.double y = v16;
  result.origin.double x = v14;
  return result;
}

- (void)animateScrubberToRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  double width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  double v8 = [(UIKeyboardEmojiCategoryBar *)self scrubView];
  [v8 frame];
  v16.origin.CGFloat x = x;
  v16.origin.CGFloat y = y;
  v16.size.double width = width;
  v16.size.CGFloat height = height;
  BOOL v9 = CGRectEqualToRect(v15, v16);

  if (!v9)
  {
    double v10 = [(UIKeyboardEmojiCategoryBar *)self scrubView];
    [v10 frame];
    BOOL v12 = v11 > width;

    double v13 = dbl_186B9A320[v12];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __52__UIKeyboardEmojiCategoryBar_animateScrubberToRect___block_invoke;
    v14[3] = &unk_1E52DA520;
    v14[4] = self;
    *(CGFloat *)&void v14[5] = x;
    *(CGFloat *)&v14[6] = y;
    *(double *)&v14[7] = width;
    *(CGFloat *)&v14[8] = height;
    +[UIView animateWithDuration:458752 delay:v14 options:0 animations:v13 completion:0.0];
  }
}

void __52__UIKeyboardEmojiCategoryBar_animateScrubberToRect___block_invoke(uint64_t a1)
{
  double v1 = *(double *)(a1 + 40);
  double v2 = *(double *)(a1 + 48);
  double v3 = *(double *)(a1 + 56);
  double v4 = *(double *)(a1 + 64);
  id v5 = [*(id *)(a1 + 32) scrubView];
  objc_msgSend(v5, "setFrame:", v1, v2, v3, v4);
}

- (CGRect)categorySelectedCircleRect:(int64_t)a3
{
  [(UIKeyboardEmojiCategoryBar *)self paddedFrame];
  double v6 = v5;
  double v8 = v7;
  BOOL v9 = +[UIKeyboardEmojiCategory enabledCategoryIndexes];
  double v10 = v8 / (double)(unint64_t)[v9 count];

  [(UIKeyboardEmojiGraphicsTraits *)self->_emojiGraphicsTraits categorySelectedCirWidth];
  double v12 = v11;
  double v13 = v6
      + (v10 - v11) * 0.5
      + v10 * (double)[(UIKeyboardEmojiCategoryBar *)self flippedIndexForIndex:a3];
  double v14 = [(UIKeyboardEmojiCategoryBar *)self scrubView];
  [v14 origin];
  double v16 = v15;

  double v17 = v13;
  double v18 = v16;
  double v19 = v12;
  double v20 = v12;
  result.size.CGFloat height = v20;
  result.size.double width = v19;
  result.origin.CGFloat y = v18;
  result.origin.CGFloat x = v17;
  return result;
}

- (void)removeFromSuperview
{
  self->_hitTestResponder = 0;
  v2.receiver = self;
  v2.super_class = (Class)UIKeyboardEmojiCategoryBar;
  [(UIKBKeyView *)&v2 removeFromSuperview];
}

- (void)setHitTestResponder:(id)a3
{
  self->_hitTestResponder = (UIKBEmojiHitTestResponder *)a3;
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  id v10 = a3;
  double v5 = [(UIKeyboardEmojiCategoryBar *)self hitTestResponder];
  char v6 = [v5 isTrackpadMode];

  if ((v6 & 1) == 0)
  {
    double v7 = [v10 anyObject];
    [v7 locationInView:self];
    self->_scrubStartXLocation = v8;
    BOOL v9 = [(UIKeyboardEmojiCategoryBar *)self hitTestResponder];
    [v9 prepareSliderBehaviorFeedback];
  }
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  id v32 = a3;
  double v5 = [(UIKeyboardEmojiCategoryBar *)self hitTestResponder];
  char v6 = [v5 isTrackpadMode];

  double v7 = v32;
  if ((v6 & 1) == 0)
  {
    double v8 = [v32 anyObject];
    [v8 locationInView:self];
    double v10 = v9;
    if (vabdd_f64(v9, self->_scrubStartXLocation) > 5.0)
    {
      self->_isScrubbing = 1;
      double v11 = [(UIKeyboardEmojiCategoryBar *)self scrubView];
      [v11 origin];
      double v13 = v12;
      [(UIView *)self frame];
      double v15 = v14;
      double v16 = [(UIKeyboardEmojiCategoryBar *)self scrubView];
      [v16 size];
      double v18 = v17;

      -[UIKeyboardEmojiCategoryBar animateScrubberToRect:](self, "animateScrubberToRect:", 0.0, v13, v15, v18);
      double v19 = [(UIKeyboardEmojiCategoryBar *)self scrubView];
      [v19 bounds];
      double v21 = v10 - v20;
      v22 = [(UIKeyboardEmojiCategoryBar *)self scrubView];
      [v22 bounds];
      double v24 = v21 / v23;

      double v25 = v24 >= 0.0 ? v24 : 0.0;
      double v26 = fmin(v25, 1.0);
      double v27 = +[UIKeyboardEmojiCategory isRTLMode] ? 1.0 - v26 : v26;
      v28 = [(UIKeyboardEmojiKeyView *)self emojiKeyManager];
      uint64_t v29 = [v28 reloadCategoryForOffsetPercentage:self withSender:v27];

      unint64_t v30 = [(UIKeyboardEmojiCategoryBar *)self selectedIndex];
      if (v30 != +[UIKeyboardEmojiCategory categoryIndexForCategoryType:v29])
      {
        [(UIKeyboardEmojiCategoryBar *)self setSelectedIndex:+[UIKeyboardEmojiCategory categoryIndexForCategoryType:v29]];
        [(UIKeyboardEmojiCategoryBar *)self updateCategoryOnBar:[(UIKeyboardEmojiCategoryBar *)self selectedIndex]];
        v31 = [(UIKeyboardEmojiCategoryBar *)self hitTestResponder];
        [v31 provideSliderBehaviorFeedback];
      }
    }

    double v7 = v32;
  }
}

- (unint64_t)selectedIndexForTouches:(id)a3
{
  id v4 = a3;
  double v5 = +[UIKeyboardEmojiCategory enabledCategoryIndexes];
  uint64_t v6 = [v5 count];

  uint64_t v7 = 0;
  uint64_t v8 = v6 - 1;
  uint64_t v9 = (v6 - 1) & ~((v6 - 1) >> 63);
  while (v9 != v7)
  {
    [(UIKeyboardEmojiCategoryBar *)self frameForDivider:++v7];
    double v11 = v10;
    double v12 = [v4 anyObject];
    [v12 locationInView:self];
    double v14 = v13;

    if (v11 >= v14)
    {
      uint64_t v8 = v7 - 1;
      break;
    }
  }
  unint64_t v15 = [(UIKeyboardEmojiCategoryBar *)self flippedIndexForIndex:v8];

  return v15;
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  id v9 = a3;
  double v5 = [(UIKeyboardEmojiCategoryBar *)self hitTestResponder];
  char v6 = [v5 isTrackpadMode];

  if ((v6 & 1) == 0)
  {
    if (self->_isScrubbing)
    {
      [(UIKeyboardEmojiCategoryBar *)self categorySelectedCircleRect:[(UIKeyboardEmojiCategoryBar *)self selectedIndex]];
      -[UIKeyboardEmojiCategoryBar animateScrubberToRect:](self, "animateScrubberToRect:");
      self->_isScrubbing = 0;
    }
    else
    {
      [(UIKeyboardEmojiCategoryBar *)self setSelectedIndex:[(UIKeyboardEmojiCategoryBar *)self selectedIndexForTouches:v9]];
      [(UIKeyboardEmojiCategoryBar *)self updateCategory];
      [(UIKeyboardEmojiCategoryBar *)self updateCategoryOnBar:[(UIKeyboardEmojiCategoryBar *)self selectedIndex]];
      uint64_t v7 = [(UIKeyboardEmojiCategoryBar *)self hitTestResponder];
      [v7 provideSliderBehaviorFeedback];
    }
    uint64_t v8 = [(UIKeyboardEmojiCategoryBar *)self hitTestResponder];
    [v8 finishSliderBehaviorFeedback];
  }
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  id v8 = a3;
  double v5 = [(UIKeyboardEmojiCategoryBar *)self hitTestResponder];
  char v6 = [v5 isTrackpadMode];

  if ((v6 & 1) == 0)
  {
    if (self->_isScrubbing)
    {
      [(UIKeyboardEmojiCategoryBar *)self categorySelectedCircleRect:[(UIKeyboardEmojiCategoryBar *)self selectedIndex]];
      -[UIKeyboardEmojiCategoryBar animateScrubberToRect:](self, "animateScrubberToRect:");
      [(UIKeyboardEmojiCategoryBar *)self updateCategory];
      self->_isScrubbing = 0;
      uint64_t v7 = [(UIKeyboardEmojiCategoryBar *)self hitTestResponder];
      [v7 finishSliderBehaviorFeedback];
    }
    else
    {
      [(UIKeyboardEmojiCategoryBar *)self setSelectedIndex:[(UIKeyboardEmojiCategoryBar *)self selectedIndexForTouches:v8]];
      [(UIKeyboardEmojiCategoryBar *)self updateCategory];
      [(UIKeyboardEmojiCategoryBar *)self updateCategoryOnBar:[(UIKeyboardEmojiCategoryBar *)self selectedIndex]];
    }
  }
}

- (unint64_t)selectedIndex
{
  return self->_selectedIndex;
}

- (void)setSelectedIndex:(unint64_t)a3
{
  self->_selectedIndeCGFloat x = a3;
}

- (UIView)scrubView
{
  return self->_scrubView;
}

- (void)setScrubView:(id)a3
{
}

- (UIKeyboardEmojiGraphicsTraits)emojiGraphicsTraits
{
  return self->_emojiGraphicsTraits;
}

- (void)setEmojiGraphicsTraits:(id)a3
{
}

- (UIKBEmojiHitTestResponder)hitTestResponder
{
  return self->_hitTestResponder;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_emojiGraphicsTraits, 0);
  objc_storeStrong((id *)&self->_scrubView, 0);
}

@end
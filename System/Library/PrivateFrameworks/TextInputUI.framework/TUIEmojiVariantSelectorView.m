@interface TUIEmojiVariantSelectorView
+ (id)emojiTextAttributes;
- (BOOL)_highlightCellAtLocation:(CGPoint)a3;
- (CGRect)originRect;
- (CGSize)_emojiCellSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (EMFEmojiToken)baseEmojiToken;
- (EMFEmojiToken)selectedVariant;
- (NSArray)allVariants;
- (NSArray)arrangedVariantCells;
- (TUIDrawingView)backgroundMaskView;
- (TUIDrawingView)borderView;
- (TUIEmojiVariantSelectorView)initWithFrame:(CGRect)a3 emojiToken:(id)a4 originRect:(CGRect)a5;
- (TUIEmojiVariantSelectorViewDelegate)delegate;
- (UIView)backdropView;
- (UIView)deepShadowView;
- (UIView)keyShadowView;
- (UIView)separatorView;
- (UIView)variantCellContainerView;
- (id)_backgroundBezierPathForContainerRect:(CGRect)a3 originRect:(CGRect)a4;
- (id)_variantCellAtLocation:(CGPoint)a3;
- (unint64_t)_numberOfVariants;
- (void)_unhighlightAllViews;
- (void)layoutSubviews;
- (void)setArrangedVariantCells:(id)a3;
- (void)setBackdropView:(id)a3;
- (void)setBackgroundMaskView:(id)a3;
- (void)setBaseEmojiToken:(id)a3;
- (void)setBorderView:(id)a3;
- (void)setDeepShadowView:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setKeyShadowView:(id)a3;
- (void)setOriginRect:(CGRect)a3;
- (void)setSeparatorView:(id)a3;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesCancelled:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
- (void)touchesMoved:(id)a3 withEvent:(id)a4;
@end

@implementation TUIEmojiVariantSelectorView

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_arrangedVariantCells, 0);
  objc_storeStrong((id *)&self->_baseEmojiToken, 0);
  objc_storeStrong((id *)&self->_separatorView, 0);
  objc_storeStrong((id *)&self->_borderView, 0);
  objc_storeStrong((id *)&self->_backgroundMaskView, 0);
  objc_storeStrong((id *)&self->_backdropView, 0);
  objc_storeStrong((id *)&self->_keyShadowView, 0);
  objc_storeStrong((id *)&self->_deepShadowView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_allVariants, 0);
  objc_storeStrong((id *)&self->_selectedVariant, 0);
  objc_storeStrong((id *)&self->_variantCellContainerView, 0);
}

- (void)setArrangedVariantCells:(id)a3
{
}

- (NSArray)arrangedVariantCells
{
  return self->_arrangedVariantCells;
}

- (void)setBaseEmojiToken:(id)a3
{
}

- (EMFEmojiToken)baseEmojiToken
{
  return self->_baseEmojiToken;
}

- (void)setOriginRect:(CGRect)a3
{
  self->_originRect = a3;
}

- (CGRect)originRect
{
  double x = self->_originRect.origin.x;
  double y = self->_originRect.origin.y;
  double width = self->_originRect.size.width;
  double height = self->_originRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setSeparatorView:(id)a3
{
}

- (UIView)separatorView
{
  return self->_separatorView;
}

- (void)setBorderView:(id)a3
{
}

- (TUIDrawingView)borderView
{
  return self->_borderView;
}

- (void)setBackgroundMaskView:(id)a3
{
}

- (TUIDrawingView)backgroundMaskView
{
  return self->_backgroundMaskView;
}

- (void)setBackdropView:(id)a3
{
}

- (UIView)backdropView
{
  return self->_backdropView;
}

- (void)setKeyShadowView:(id)a3
{
}

- (UIView)keyShadowView
{
  return self->_keyShadowView;
}

- (void)setDeepShadowView:(id)a3
{
}

- (UIView)deepShadowView
{
  return self->_deepShadowView;
}

- (void)setDelegate:(id)a3
{
}

- (TUIEmojiVariantSelectorViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (TUIEmojiVariantSelectorViewDelegate *)WeakRetained;
}

- (NSArray)allVariants
{
  return self->_allVariants;
}

- (EMFEmojiToken)selectedVariant
{
  return self->_selectedVariant;
}

- (UIView)variantCellContainerView
{
  return self->_variantCellContainerView;
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(TUIEmojiVariantSelectorView *)self _unhighlightAllViews];
  v8.receiver = self;
  v8.super_class = (Class)TUIEmojiVariantSelectorView;
  [(TUIEmojiVariantSelectorView *)&v8 touchesCancelled:v7 withEvent:v6];
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v8 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (!v8) {
    goto LABEL_11;
  }
  uint64_t v9 = v8;
  char v10 = 0;
  uint64_t v11 = *(void *)v20;
  do
  {
    for (uint64_t i = 0; i != v9; ++i)
    {
      if (*(void *)v20 != v11) {
        objc_enumerationMutation(v6);
      }
      [*(id *)(*((void *)&v19 + 1) + 8 * i) locationInView:self];
      v13 = -[TUIEmojiVariantSelectorView _variantCellAtLocation:](self, "_variantCellAtLocation:");
      v14 = v13;
      if (v13)
      {
        v15 = [v13 emojiToken];
        selectedVariant = self->_selectedVariant;
        self->_selectedVariant = v15;

        v17 = [(TUIEmojiVariantSelectorView *)self delegate];
        [v17 variantSelectorValueChanged:self];

        char v10 = 1;
      }
    }
    uint64_t v9 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
  }
  while (v9);
  if ((v10 & 1) == 0)
  {
LABEL_11:
    v18.receiver = self;
    v18.super_class = (Class)TUIEmojiVariantSelectorView;
    [(TUIEmojiVariantSelectorView *)&v18 touchesEnded:v6 withEvent:v7];
  }
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (!v8) {
    goto LABEL_12;
  }
  uint64_t v9 = v8;
  BOOL v10 = 0;
  uint64_t v11 = *(void *)v15;
  do
  {
    for (uint64_t i = 0; i != v9; ++i)
    {
      if (*(void *)v15 != v11) {
        objc_enumerationMutation(v6);
      }
      if (v10)
      {
        BOOL v10 = 1;
      }
      else
      {
        [*(id *)(*((void *)&v14 + 1) + 8 * i) locationInView:self];
        BOOL v10 = -[TUIEmojiVariantSelectorView _highlightCellAtLocation:](self, "_highlightCellAtLocation:");
      }
    }
    uint64_t v9 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  }
  while (v9);
  if (!v10)
  {
LABEL_12:
    v13.receiver = self;
    v13.super_class = (Class)TUIEmojiVariantSelectorView;
    [(TUIEmojiVariantSelectorView *)&v13 touchesMoved:v6 withEvent:v7];
  }
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (!v8) {
    goto LABEL_12;
  }
  uint64_t v9 = v8;
  BOOL v10 = 0;
  uint64_t v11 = *(void *)v15;
  do
  {
    for (uint64_t i = 0; i != v9; ++i)
    {
      if (*(void *)v15 != v11) {
        objc_enumerationMutation(v6);
      }
      if (v10)
      {
        BOOL v10 = 1;
      }
      else
      {
        [*(id *)(*((void *)&v14 + 1) + 8 * i) locationInView:self];
        BOOL v10 = -[TUIEmojiVariantSelectorView _highlightCellAtLocation:](self, "_highlightCellAtLocation:");
      }
    }
    uint64_t v9 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  }
  while (v9);
  if (!v10)
  {
LABEL_12:
    v13.receiver = self;
    v13.super_class = (Class)TUIEmojiVariantSelectorView;
    [(TUIEmojiVariantSelectorView *)&v13 touchesBegan:v6 withEvent:v7];
  }
}

- (BOOL)_highlightCellAtLocation:(CGPoint)a3
{
  v4 = -[TUIEmojiVariantSelectorView _variantCellAtLocation:](self, "_variantCellAtLocation:", a3.x, a3.y);
  if (v4)
  {
    [(TUIEmojiVariantSelectorView *)self _unhighlightAllViews];
    [v4 setHighlighted:1];
  }

  return v4 != 0;
}

- (id)_variantCellAtLocation:(CGPoint)a3
{
  CGFloat x = a3.x;
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  [(UIView *)self->_variantCellContainerView frame];
  UIRectGetCenter();
  CGFloat v6 = v5;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v7 = self->_arrangedVariantCells;
  id v8 = (id)[(NSArray *)v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v8; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v7);
        }
        uint64_t v11 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        objc_msgSend(v11, "frame", (void)v13);
        v20.CGFloat x = x;
        v20.double y = v6;
        if (CGRectContainsPoint(v21, v20))
        {
          id v8 = v11;
          goto LABEL_11;
        }
      }
      id v8 = (id)[(NSArray *)v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v8;
}

- (void)_unhighlightAllViews
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v2 = self->_arrangedVariantCells;
  uint64_t v3 = [(NSArray *)v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        objc_msgSend(*(id *)(*((void *)&v7 + 1) + 8 * v6++), "setHighlighted:", 0, (void)v7);
      }
      while (v4 != v6);
      uint64_t v4 = [(NSArray *)v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (void)layoutSubviews
{
  uint64_t v103 = *MEMORY[0x1E4F143B8];
  v101.receiver = self;
  v101.super_class = (Class)TUIEmojiVariantSelectorView;
  [(TUIEmojiVariantSelectorView *)&v101 layoutSubviews];
  [(TUIEmojiVariantSelectorView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9 - (CGRectGetHeight(self->_originRect) + 8.0);
  [(TUIEmojiVariantSelectorView *)self bounds];
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  uint64_t v19 = [(TUIEmojiVariantSelectorView *)self borderView];
  objc_msgSend(v19, "setFrame:", v12, v14, v16, v18);

  [(TUIEmojiVariantSelectorView *)self bounds];
  double v21 = v20;
  double v23 = v22;
  double v25 = v24;
  double v27 = v26;
  v28 = [(TUIEmojiVariantSelectorView *)self backdropView];
  objc_msgSend(v28, "setFrame:", v21, v23, v25, v27);

  v29 = [(TUIEmojiVariantSelectorView *)self variantCellContainerView];
  objc_msgSend(v29, "setFrame:", v4, v6, v8, v10);

  v30 = [(TUIEmojiVariantSelectorView *)self deepShadowView];
  objc_msgSend(v30, "setFrame:", v4, v6, v8, v10);

  double v85 = v6;
  double v86 = v4;
  v104.origin.CGFloat x = v4;
  v104.origin.double y = v6;
  double v87 = v8;
  v104.size.CGFloat width = v8;
  v104.size.CGFloat height = v10;
  v31 = CGPathCreateWithRect(v104, 0);
  v32 = [(TUIEmojiVariantSelectorView *)self deepShadowView];
  v33 = [v32 layer];
  [v33 setShadowPath:v31];

  if (v31) {
    CGPathRelease(v31);
  }
  v34 = [(TUIEmojiVariantSelectorView *)self superview];
  -[TUIEmojiVariantSelectorView convertRect:fromView:](self, "convertRect:fromView:", v34, self->_originRect.origin.x, self->_originRect.origin.y, self->_originRect.size.width, self->_originRect.size.height);
  double v36 = v35;
  double v38 = v37;
  double v40 = v39;
  double v42 = v41;

  CGFloat width = self->_originRect.size.width;
  CGFloat height = self->_originRect.size.height;
  v45 = [(TUIEmojiVariantSelectorView *)self keyShadowView];
  objc_msgSend(v45, "setFrame:", v36, v38, v40, v42);

  v105.origin.CGFloat x = 0.0;
  v105.origin.double y = 0.0;
  v105.size.CGFloat width = width;
  v105.size.CGFloat height = height;
  v46 = CGPathCreateWithRoundedRect(v105, 6.0, 6.0, 0);
  v47 = [(TUIEmojiVariantSelectorView *)self keyShadowView];
  v48 = [v47 layer];
  [v48 setShadowPath:v46];

  if (v46) {
    CGPathRelease(v46);
  }
  v49 = -[TUIEmojiVariantSelectorView _backgroundBezierPathForContainerRect:originRect:](self, "_backgroundBezierPathForContainerRect:originRect:", v86, v85, v87, v10, v36, v38, v40, v42);
  v50 = [(TUIEmojiVariantSelectorView *)self borderView];
  [v50 setPath:v49];

  v51 = [(TUIEmojiVariantSelectorView *)self backgroundMaskView];
  [v51 setPath:v49];

  uint64_t v52 = [(TUIEmojiVariantSelectorView *)self effectiveUserInterfaceLayoutDirection];
  [(TUIEmojiVariantSelectorView *)self _emojiCellSize];
  double v54 = v53;
  uint64_t v94 = 0;
  v95 = (CGRect *)&v94;
  uint64_t v96 = 0x4010000000;
  v97 = &unk_18D51D2C6;
  __asm { FMOV            V0.2D, #6.0 }
  long long v98 = _Q0;
  double v99 = v54;
  uint64_t v100 = v60;
  if (v52 == 1)
  {
    v61 = [(TUIEmojiVariantSelectorView *)self variantCellContainerView];
    [v61 frame];
    v95[1].origin.CGFloat x = v62 - (v54 + 6.0);
  }
  UIRectCenteredYInRect();
  p_CGFloat x = (void *)&v95->origin.x;
  v95[1].origin.CGFloat x = v64;
  p_x[5] = v65;
  p_x[6] = v66;
  p_x[7] = v67;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __45__TUIEmojiVariantSelectorView_layoutSubviews__block_invoke;
  aBlock[3] = &unk_1E5593E78;
  aBlock[4] = &v94;
  BOOL v93 = v52 == 1;
  v68 = (void (**)(void *, void *))_Block_copy(aBlock);
  v69 = [(NSArray *)self->_arrangedVariantCells firstObject];
  v68[2](v68, v69);
  if (v52 == 1)
  {
    [v69 frame];
    double v71 = v70 + -11.0;
    v72 = v95;
  }
  else
  {
    v72 = v95;
    double v71 = v95[1].origin.x + 4.0;
  }
  -[UIView setFrame:](self->_separatorView, "setFrame:", v71, 0.0, 1.0, v72[1].size.height + -6.0);
  [(UIView *)self->_separatorView frame];
  UIRectCenteredYInRect();
  -[UIView setFrame:](self->_separatorView, "setFrame:");
  [(UIView *)self->_separatorView frame];
  if (v52 == 1)
  {
    double v77 = v73 - (CGRectGetWidth(v95[1]) + 10.0);
    v78 = v95;
  }
  else
  {
    CGFloat v79 = CGRectGetWidth(*(CGRect *)&v73);
    v78 = v95;
    double v77 = v95[1].origin.x + v79 + 6.0 + 8.0;
  }
  v78[1].origin.CGFloat x = v77;
  long long v90 = 0u;
  long long v91 = 0u;
  long long v88 = 0u;
  long long v89 = 0u;
  v80 = -[NSArray subarrayWithRange:](self->_arrangedVariantCells, "subarrayWithRange:", 1, [(NSArray *)self->_arrangedVariantCells count] - 1);
  uint64_t v81 = [v80 countByEnumeratingWithState:&v88 objects:v102 count:16];
  if (v81)
  {
    uint64_t v82 = v81;
    uint64_t v83 = *(void *)v89;
    do
    {
      for (uint64_t i = 0; i != v82; ++i)
      {
        if (*(void *)v89 != v83) {
          objc_enumerationMutation(v80);
        }
        v68[2](v68, *(void **)(*((void *)&v88 + 1) + 8 * i));
      }
      uint64_t v82 = [v80 countByEnumeratingWithState:&v88 objects:v102 count:16];
    }
    while (v82);
  }

  _Block_object_dispose(&v94, 8);
}

double __45__TUIEmojiVariantSelectorView_layoutSubviews__block_invoke(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "setFrame:", *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 32), *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 48), *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 56));
  int v3 = *(unsigned __int8 *)(a1 + 40);
  double v4 = CGRectGetWidth(*(CGRect *)(*(void *)(*(void *)(a1 + 32) + 8) + 32)) + 6.0;
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  if (v3) {
    double v4 = -v4;
  }
  double result = *(double *)(v5 + 32) + v4;
  *(double *)(v5 + 32) = result;
  return result;
}

- (id)_backgroundBezierPathForContainerRect:(CGRect)a3 originRect:(CGRect)a4
{
  double height = a4.size.height;
  CGFloat width = a3.size.width;
  CGFloat v48 = a4.size.width;
  double y = a4.origin.y;
  CGFloat x = a4.origin.x;
  CGFloat v5 = a3.size.height;
  CGFloat v6 = a3.size.width;
  CGFloat v7 = a3.origin.y;
  CGFloat v8 = a3.origin.x;
  double v41 = *(double *)&TUIEmojiVariantSelectorBubbleRadius;
  double v9 = [MEMORY[0x1E4FB14C0] bezierPath];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __80__TUIEmojiVariantSelectorView__backgroundBezierPathForContainerRect_originRect___block_invoke;
  aBlock[3] = &unk_1E5593E50;
  id v10 = v9;
  id v51 = v10;
  double v11 = (void (**)(void *, uint64_t, uint64_t, double, double, double, double, double, double))_Block_copy(aBlock);
  v52.origin.CGFloat x = v8;
  v52.origin.double y = v7;
  v52.size.CGFloat width = v6;
  v52.size.double height = v5;
  double MaxY = CGRectGetMaxY(v52);
  CGFloat v13 = x;
  v53.origin.CGFloat x = x;
  v53.origin.double y = y;
  v53.size.CGFloat width = v48;
  v53.size.double height = height;
  double v14 = MaxY - CGRectGetMinY(v53);
  double v15 = y + v14;
  v54.size.double height = height - v14;
  double v40 = height - v14;
  v54.origin.CGFloat x = x;
  v54.origin.double y = v15;
  v54.size.CGFloat width = v48;
  double MinX = CGRectGetMinX(v54);
  v55.origin.CGFloat x = v8;
  CGFloat v42 = v7;
  v55.origin.double y = v7;
  v55.size.CGFloat width = width;
  v55.size.double height = v5;
  double v17 = vabdd_f64(MinX, CGRectGetMinX(v55));
  if (v17 >= *(double *)&TUIEmojiVariantSelectorBubbleRadius + *(double *)&TUIEmojiVariantSelectorBubbleRadius) {
    double v18 = v41;
  }
  else {
    double v18 = v17 * 0.5;
  }
  double v43 = v18;
  v56.origin.CGFloat x = x;
  v56.origin.double y = v15;
  v56.size.CGFloat width = v48;
  v56.size.double height = v40;
  double MaxX = CGRectGetMaxX(v56);
  v57.origin.CGFloat x = v8;
  v57.origin.double y = v7;
  v57.size.CGFloat width = width;
  v57.size.double height = v5;
  double v19 = vabdd_f64(MaxX, CGRectGetMaxX(v57));
  if (v19 >= *(double *)&TUIEmojiVariantSelectorBubbleRadius + *(double *)&TUIEmojiVariantSelectorBubbleRadius) {
    double v20 = v41;
  }
  else {
    double v20 = v19 * 0.5;
  }
  double v46 = v20;
  v58.origin.CGFloat x = x;
  v58.origin.double y = v15;
  v58.size.CGFloat width = v48;
  v58.size.double height = v40;
  double v21 = CGRectGetMinX(v58);
  v59.origin.CGFloat x = x;
  v59.origin.double y = v15;
  v59.size.CGFloat width = v48;
  v59.size.double height = v40;
  double v22 = CGRectGetMaxY(v59);
  objc_msgSend(v10, "moveToPoint:", v21 + 6.0, v22);
  objc_msgSend(v10, "_addRoundedCornerWithTrueCorner:radius:corner:clockwise:", 4, 0, v21, v22, 6.0, 6.0);
  v60.origin.CGFloat x = v13;
  v60.origin.double y = v15;
  v60.size.CGFloat width = v48;
  v60.size.double height = v40;
  double v23 = CGRectGetMinX(v60);
  v61.origin.CGFloat x = v13;
  v61.origin.double y = v15;
  v61.size.CGFloat width = v48;
  v61.size.double height = v40;
  CGFloat MinY = CGRectGetMinY(v61);
  double v25 = v41;
  v11[2](v11, 2, 1, v23, MinY, 0.0, v41, v43, v41);
  v62.origin.CGFloat x = v8;
  v62.origin.double y = v42;
  v62.size.CGFloat width = width;
  v62.size.double height = v5;
  double v26 = CGRectGetMinX(v62);
  v63.origin.CGFloat x = v8;
  v63.origin.double y = v42;
  v63.size.CGFloat width = width;
  v63.size.double height = v5;
  CGFloat v27 = CGRectGetMaxY(v63);
  v11[2](v11, 4, 0, v26, v27, v43, 0.0, v43, v41);
  v64.origin.CGFloat x = v8;
  v64.origin.double y = v42;
  v64.size.CGFloat width = width;
  v64.size.double height = v5;
  double v28 = CGRectGetMinX(v64);
  v65.origin.CGFloat x = v8;
  v65.origin.double y = v42;
  v65.size.CGFloat width = width;
  v65.size.double height = v5;
  CGFloat v29 = CGRectGetMinY(v65);
  v11[2](v11, 1, 0, v28, v29, 0.0, v25, v25, v25);
  v66.origin.CGFloat x = v8;
  v66.origin.double y = v42;
  v66.size.CGFloat width = width;
  v66.size.double height = v5;
  double v30 = CGRectGetMaxX(v66);
  v67.origin.CGFloat x = v8;
  v67.origin.double y = v42;
  v67.size.CGFloat width = width;
  v67.size.double height = v5;
  CGFloat v31 = CGRectGetMinY(v67);
  v11[2](v11, 2, 0, v30, v31, -v25, 0.0, v25, v25);
  v68.origin.CGFloat x = v8;
  v68.origin.double y = v42;
  v68.size.CGFloat width = width;
  v68.size.double height = v5;
  double v32 = CGRectGetMaxX(v68);
  v69.origin.CGFloat x = v8;
  v69.origin.double y = v42;
  v69.size.CGFloat width = width;
  v69.size.double height = v5;
  CGFloat v33 = CGRectGetMaxY(v69);
  v11[2](v11, 8, 0, v32, v33, 0.0, -v25, v46, v25);
  v70.origin.CGFloat x = v13;
  v70.origin.double y = v15;
  v70.size.CGFloat width = v48;
  v70.size.double height = v40;
  double v34 = CGRectGetMaxX(v70);
  v71.origin.CGFloat x = v13;
  v71.origin.double y = v15;
  v71.size.CGFloat width = v48;
  v71.size.double height = v40;
  CGFloat v35 = CGRectGetMinY(v71);
  v11[2](v11, 1, 1, v34, v35, v46, 0.0, v46, v41);
  v72.origin.CGFloat x = v13;
  v72.origin.double y = v15;
  v72.size.CGFloat width = v48;
  v72.size.double height = v40;
  double v36 = CGRectGetMaxX(v72);
  v73.origin.CGFloat x = v13;
  v73.origin.double y = v15;
  v73.size.CGFloat width = v48;
  v73.size.double height = v40;
  CGFloat v37 = CGRectGetMaxY(v73);
  v11[2](v11, 8, 0, v36, v37, 0.0, -6.0, 6.0, 6.0);
  [v10 closePath];
  id v38 = v10;

  return v38;
}

uint64_t __80__TUIEmojiVariantSelectorView__backgroundBezierPathForContainerRect_originRect___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, double a4, double a5, double a6, double a7, double a8, double a9)
{
  objc_msgSend(*(id *)(a1 + 32), "addLineToPoint:", a4 + a6, a5 + a7);
  double v16 = *(void **)(a1 + 32);
  return objc_msgSend(v16, "_addRoundedCornerWithTrueCorner:radius:corner:clockwise:", a2, a3, a4, a5, a8, a9);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  [(TUIEmojiVariantSelectorView *)self _emojiCellSize];
  double v5 = v4;
  double v7 = (v6 + 6.0) * (double)[(TUIEmojiVariantSelectorView *)self _numberOfVariants] + 15.0 + 6.0;
  double v8 = v5 + 6.0 + 6.0 + CGRectGetHeight(self->_originRect) + 8.0;
  double v9 = v7;
  result.double height = v8;
  result.CGFloat width = v9;
  return result;
}

- (unint64_t)_numberOfVariants
{
  v2 = [(EMFEmojiToken *)self->_baseEmojiToken skinToneVariants];
  unint64_t v3 = [v2 count];

  return v3;
}

- (CGSize)_emojiCellSize
{
  v2 = [(id)objc_opt_class() emojiTextAttributes];
  [@"🆒" sizeWithAttributes:v2];
  double v4 = v3;
  double v6 = v5;

  double v7 = v4 + 3.0;
  double v8 = v6 + 3.0 + 3.0;
  result.double height = v8;
  result.CGFloat width = v7;
  return result;
}

- (TUIEmojiVariantSelectorView)initWithFrame:(CGRect)a3 emojiToken:(id)a4 originRect:(CGRect)a5
{
  CGFloat height = a5.size.height;
  CGFloat width = a5.size.width;
  CGFloat y = a5.origin.y;
  CGFloat x = a5.origin.x;
  double v10 = a3.size.height;
  double v11 = a3.size.width;
  double v12 = a3.origin.y;
  double v13 = a3.origin.x;
  uint64_t v101 = *MEMORY[0x1E4F143B8];
  id v15 = a4;
  v99.receiver = self;
  v99.super_class = (Class)TUIEmojiVariantSelectorView;
  double v16 = -[TUIEmojiVariantSelectorView initWithFrame:](&v99, sel_initWithFrame_, v13, v12, v11, v10);
  double v17 = v16;
  if (v16)
  {
    v16->_originRect.origin.CGFloat x = x;
    v16->_originRect.origin.CGFloat y = y;
    v16->_originRect.size.CGFloat width = width;
    v16->_originRect.size.CGFloat height = height;
    objc_storeStrong((id *)&v16->_baseEmojiToken, a4);
    id v18 = objc_alloc(MEMORY[0x1E4FB1EB0]);
    double v19 = *MEMORY[0x1E4F1DB28];
    double v20 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v21 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v22 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    double v23 = objc_msgSend(v18, "initWithFrame:", *MEMORY[0x1E4F1DB28], v20, v21, v22);
    [(TUIEmojiVariantSelectorView *)v17 setDeepShadowView:v23];

    double v24 = [(TUIEmojiVariantSelectorView *)v17 deepShadowView];
    double v25 = [v24 layer];
    LODWORD(v26) = 1045220557;
    [v25 setShadowOpacity:v26];

    CGFloat v27 = [(TUIEmojiVariantSelectorView *)v17 deepShadowView];
    double v28 = [v27 layer];
    [v28 setShadowRadius:7.0];

    CGFloat v29 = [(TUIEmojiVariantSelectorView *)v17 deepShadowView];
    double v30 = [v29 layer];
    objc_msgSend(v30, "setShadowOffset:", 0.0, 6.0);

    CGFloat v31 = [(TUIEmojiVariantSelectorView *)v17 deepShadowView];
    double v32 = [v31 layer];
    [v32 setMasksToBounds:0];

    CGFloat v33 = [(TUIEmojiVariantSelectorView *)v17 deepShadowView];
    [v33 setUserInteractionEnabled:0];

    id v34 = [MEMORY[0x1E4FB1618] blackColor];
    uint64_t v35 = [v34 CGColor];
    double v36 = [(TUIEmojiVariantSelectorView *)v17 deepShadowView];
    CGFloat v37 = [v36 layer];
    [v37 setShadowColor:v35];

    id v38 = [(TUIEmojiVariantSelectorView *)v17 deepShadowView];
    [(TUIEmojiVariantSelectorView *)v17 addSubview:v38];

    double v39 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1EB0]), "initWithFrame:", v19, v20, v21, v22);
    [(TUIEmojiVariantSelectorView *)v17 setKeyShadowView:v39];

    double v40 = [(TUIEmojiVariantSelectorView *)v17 keyShadowView];
    double v41 = [v40 layer];
    LODWORD(v42) = 1050253722;
    [v41 setShadowOpacity:v42];

    double v43 = [(TUIEmojiVariantSelectorView *)v17 keyShadowView];
    v44 = [v43 layer];
    [v44 setShadowRadius:0.0];

    v45 = [(TUIEmojiVariantSelectorView *)v17 keyShadowView];
    double v46 = [v45 layer];
    objc_msgSend(v46, "setShadowOffset:", 0.0, 1.0);

    v47 = [(TUIEmojiVariantSelectorView *)v17 keyShadowView];
    CGFloat v48 = [v47 layer];
    [v48 setMasksToBounds:0];

    v49 = [(TUIEmojiVariantSelectorView *)v17 keyShadowView];
    [v49 setUserInteractionEnabled:0];

    id v50 = [MEMORY[0x1E4FB1618] blackColor];
    uint64_t v51 = [v50 CGColor];
    CGRect v52 = [(TUIEmojiVariantSelectorView *)v17 keyShadowView];
    CGRect v53 = [v52 layer];
    [v53 setShadowColor:v51];

    CGRect v54 = [(TUIEmojiVariantSelectorView *)v17 keyShadowView];
    [(TUIEmojiVariantSelectorView *)v17 addSubview:v54];

    CGRect v55 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1EB0]), "initWithFrame:", v19, v20, v21, v22);
    [(TUIEmojiVariantSelectorView *)v17 setBackdropView:v55];

    CGRect v56 = [MEMORY[0x1E4FB1618] colorWithDynamicProvider:&__block_literal_global_6925];
    CGRect v57 = [(TUIEmojiVariantSelectorView *)v17 backdropView];
    [v57 setBackgroundColor:v56];

    CGRect v58 = [(TUIEmojiVariantSelectorView *)v17 backdropView];
    CGRect v59 = [v58 layer];
    [v59 setMasksToBounds:1];

    CGRect v60 = [(TUIEmojiVariantSelectorView *)v17 backdropView];
    [v60 setUserInteractionEnabled:0];

    CGRect v61 = [(TUIEmojiVariantSelectorView *)v17 backdropView];
    [(TUIEmojiVariantSelectorView *)v17 addSubview:v61];

    CGRect v62 = -[TUIDrawingView initWithFrame:]([TUIDrawingView alloc], "initWithFrame:", v19, v20, v21, v22);
    [(TUIEmojiVariantSelectorView *)v17 setBackgroundMaskView:v62];

    CGRect v63 = [(TUIEmojiVariantSelectorView *)v17 backgroundMaskView];
    CGRect v64 = [(TUIEmojiVariantSelectorView *)v17 backdropView];
    [v64 setMaskView:v63];

    CGRect v65 = -[TUIDrawingView initWithFrame:]([TUIDrawingView alloc], "initWithFrame:", v19, v20, v21, v22);
    [(TUIEmojiVariantSelectorView *)v17 setBorderView:v65];

    CGRect v66 = [(TUIEmojiVariantSelectorView *)v17 borderView];
    [v66 setUserInteractionEnabled:0];

    id v67 = [MEMORY[0x1E4FB1618] clearColor];
    uint64_t v68 = [v67 CGColor];
    CGRect v69 = [(TUIEmojiVariantSelectorView *)v17 borderView];
    CGRect v70 = [v69 shapeLayer];
    [v70 setFillColor:v68];

    id v71 = [MEMORY[0x1E4FB1618] systemFillColor];
    uint64_t v72 = [v71 CGColor];
    CGRect v73 = [(TUIEmojiVariantSelectorView *)v17 borderView];
    v74 = [v73 shapeLayer];
    [v74 setStrokeColor:v72];

    v75 = [(TUIEmojiVariantSelectorView *)v17 borderView];
    v76 = [v75 shapeLayer];
    [v76 setLineWidth:1.0];

    double v77 = [(TUIEmojiVariantSelectorView *)v17 borderView];
    [(TUIEmojiVariantSelectorView *)v17 addSubview:v77];

    uint64_t v78 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1EB0]), "initWithFrame:", v19, v20, v21, v22);
    variantCellContainerView = v17->_variantCellContainerView;
    v17->_variantCellContainerView = (UIView *)v78;

    [(TUIEmojiVariantSelectorView *)v17 addSubview:v17->_variantCellContainerView];
    v80 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1EB0]), "initWithFrame:", v19, v20, v21, v22);
    [(TUIEmojiVariantSelectorView *)v17 setSeparatorView:v80];

    uint64_t v81 = [MEMORY[0x1E4FB1618] colorWithDynamicProvider:&__block_literal_global_6_6927];
    uint64_t v82 = [(TUIEmojiVariantSelectorView *)v17 separatorView];
    [v82 setBackgroundColor:v81];

    uint64_t v83 = [(TUIEmojiVariantSelectorView *)v17 variantCellContainerView];
    v84 = [(TUIEmojiVariantSelectorView *)v17 separatorView];
    [v83 addSubview:v84];

    double v85 = [MEMORY[0x1E4F1CA48] array];
    double v86 = [v15 skinToneVariants];
    long long v95 = 0u;
    long long v96 = 0u;
    long long v97 = 0u;
    long long v98 = 0u;
    uint64_t v87 = [v86 countByEnumeratingWithState:&v95 objects:v100 count:16];
    if (v87)
    {
      uint64_t v88 = v87;
      uint64_t v89 = *(void *)v96;
      do
      {
        for (uint64_t i = 0; i != v88; ++i)
        {
          if (*(void *)v96 != v89) {
            objc_enumerationMutation(v86);
          }
          long long v91 = -[TUIEmojiVariantCell initWithFrame:token:]([TUIEmojiVariantCell alloc], "initWithFrame:token:", *(void *)(*((void *)&v95 + 1) + 8 * i), v19, v20, v21, v22);
          [(TUIEmojiVariantCell *)v91 setVariantSelectorView:v17];
          v92 = [(TUIEmojiVariantSelectorView *)v17 variantCellContainerView];
          [v92 addSubview:v91];

          [(NSArray *)v85 addObject:v91];
        }
        uint64_t v88 = [v86 countByEnumeratingWithState:&v95 objects:v100 count:16];
      }
      while (v88);
    }
    arrangedVariantCells = v17->_arrangedVariantCells;
    v17->_arrangedVariantCells = v85;
  }
  return v17;
}

id __67__TUIEmojiVariantSelectorView_initWithFrame_emojiToken_originRect___block_invoke_2(uint64_t a1, void *a2)
{
  if ([a2 userInterfaceStyle] == 2) {
    [MEMORY[0x1E4FB1618] colorWithWhite:1.0 alpha:0.1];
  }
  else {
  v2 = UIKeyboardGetLightCandidateSeparatorColor();
  }
  return v2;
}

id __67__TUIEmojiVariantSelectorView_initWithFrame_emojiToken_originRect___block_invoke(uint64_t a1, void *a2)
{
  if ([a2 userInterfaceStyle] == 2) {
    [MEMORY[0x1E4FB1618] colorWithRed:0.42 green:0.42 blue:0.42 alpha:1.0];
  }
  else {
  v2 = [MEMORY[0x1E4FB1618] whiteColor];
  }
  return v2;
}

+ (id)emojiTextAttributes
{
  v6[1] = *MEMORY[0x1E4F143B8];
  uint64_t v5 = *MEMORY[0x1E4FB06F8];
  v2 = [MEMORY[0x1E4FB08E0] systemFontOfSize:32.0];
  v6[0] = v2;
  double v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1];

  return v3;
}

@end
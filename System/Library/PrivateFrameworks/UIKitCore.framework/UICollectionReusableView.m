@interface UICollectionReusableView
- (BOOL)_appliesLayoutAttributesMaskingToReusableView;
- (BOOL)_arePreferredAttributesValid;
- (BOOL)_automaticIntrinsicContentSizeInvalidationEnabled;
- (BOOL)_disableGroupOpacityInAnimations;
- (BOOL)_disableRasterizeInAnimations;
- (BOOL)_hasBeenReused;
- (BOOL)_hasNotifiedIsDisplaying;
- (BOOL)_isBeingReused;
- (BOOL)_isFocusableWhenStyledAsHeader;
- (BOOL)_isHiddenForReordering;
- (BOOL)_isInUpdateAnimation;
- (BOOL)_isStyledAsHeaderOrFooterFromLayoutAttributes:(id)a3;
- (BOOL)_shouldConstrainHeight;
- (BOOL)_shouldConstrainWidth;
- (BOOL)_wasDequeued;
- (BOOL)canBeEdited;
- (BOOL)isEditing;
- (NSString)_elementKind;
- (NSString)reuseIdentifier;
- (UICollectionReusableView)initWithCoder:(id)a3;
- (UICollectionReusableView)initWithFrame:(CGRect)a3;
- (UICollectionView)_collectionView;
- (UICollectionViewLayoutAttributes)_layoutAttributes;
- (UICollectionViewLayoutAttributes)preferredLayoutAttributesFittingAttributes:(UICollectionViewLayoutAttributes *)layoutAttributes;
- (UIEdgeInsets)_concreteDefaultLayoutMargins;
- (_WORD)_internalMaskView;
- (id)_preferredLayoutAttributesFittingAttributes:(id)a3 isAnimatingExistingView:(BOOL)a4;
- (id)_updateAnimationCompletionBlocks;
- (int64_t)_contentViewListStyleFromLayoutAttributes:(id)a3;
- (int64_t)_styleFromLayoutAttributes:(id)a3;
- (void)_addBackdropViewForMaskingIfNeeded;
- (void)_addUpdateAnimation;
- (void)_applyListEnvironmentTraitOverridesUsingNewListAttributes:(id)a3 previousListAttributes:(id)a4;
- (void)_clearUpdateAnimation;
- (void)_invalidatePreferredAttributes;
- (void)_markAsDequeued;
- (void)_notifyIsDisplaying:(BOOL)a3;
- (void)_removeExistingBackdropViewForMasking;
- (void)_setAutomaticIntrinsicContentSizeInvalidationEnabled:(BOOL)a3;
- (void)_setBaseLayoutAttributes:(id)a3;
- (void)_setCollectionView:(id)a3;
- (void)_setElementKind:(id)a3;
- (void)_setHiddenForReordering:(BOOL)a3;
- (void)_setHiddenForReuse:(BOOL)a3;
- (void)_setInternalMaskView:(_WORD *)a1;
- (void)_setIsBeingReused:(BOOL)a3;
- (void)_setLayoutAttributes:(id)a3;
- (void)_setLayoutAttributes:(id)a3 force:(BOOL)a4;
- (void)_setMaskView:(id)a3;
- (void)_setReuseIdentifier:(id)a3;
- (void)_setShouldConstrainHeight:(BOOL)a3;
- (void)_setShouldConstrainWidth:(BOOL)a3;
- (void)_updateDefaultLayoutMarginsUsingAttributes:(id)a3;
- (void)_updateMaskViewUsingAttributes:(id)a3;
- (void)_updateMaskingUsingAttributes:(id)a3;
- (void)_willRevealWithLayoutAttributes:(id)a3;
- (void)didMoveToSuperview;
- (void)encodeWithCoder:(id)a3;
- (void)invalidateIntrinsicContentSize;
- (void)prepareForReuse;
- (void)setPreferredAttributesValid:(BOOL)a3;
- (void)setTranslatesAutoresizingMaskIntoConstraints:(BOOL)a3;
@end

@implementation UICollectionReusableView

- (BOOL)_disableGroupOpacityInAnimations
{
  v2 = [(UIView *)self traitCollection];
  BOOL v3 = [v2 _userInterfaceRenderingMode] == 2;

  return v3;
}

- (BOOL)_disableRasterizeInAnimations
{
  v2 = [(UIView *)self traitCollection];
  BOOL v3 = [v2 _userInterfaceRenderingMode] == 2;

  return v3;
}

- (UIEdgeInsets)_concreteDefaultLayoutMargins
{
  if (dyld_program_sdk_at_least() && (*(_WORD *)&self->_reusableViewFlags & 0x4000) != 0)
  {
    double top = self->_defaultLayoutMargins.top;
    double left = self->_defaultLayoutMargins.left;
    double bottom = self->_defaultLayoutMargins.bottom;
    double right = self->_defaultLayoutMargins.right;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)UICollectionReusableView;
    [(UIView *)&v7 _concreteDefaultLayoutMargins];
  }
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)didMoveToSuperview
{
  if ((*(_WORD *)&self->_reusableViewFlags & 0x800) == 0) {
    objc_storeWeak((id *)&self->_collectionView, 0);
  }
  v3.receiver = self;
  v3.super_class = (Class)UICollectionReusableView;
  [(UIView *)&v3 didMoveToSuperview];
}

- (BOOL)_isStyledAsHeaderOrFooterFromLayoutAttributes:(id)a3
{
  objc_super v3 = (id *)a3;
  v4 = v3;
  if (v3 && ((_WORD)v3[36] & 3) == 0)
  {
    BOOL v7 = 1;
  }
  else
  {
    v5 = [v3 indexPath];
    uint64_t v6 = [v5 item];

    if (v6)
    {
      BOOL v7 = 0;
    }
    else
    {
      -[UICollectionViewLayoutAttributes _existingListAttributes](v4);
      v8 = (unsigned char *)objc_claimAutoreleasedReturnValue();
      if (v8) {
        BOOL v7 = v8[8] & 1;
      }
      else {
        BOOL v7 = 0;
      }
    }
  }

  return v7;
}

- (UICollectionViewLayoutAttributes)preferredLayoutAttributesFittingAttributes:(UICollectionViewLayoutAttributes *)layoutAttributes
{
  v4 = layoutAttributes;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_collectionView);
  uint64_t v6 = [WeakRetained collectionViewLayout];

  if (v6)
  {
    id v7 = objc_loadWeakRetained((id *)&self->_collectionView);
    v8 = [v7 collectionViewLayout];
    int v9 = [v8 _cellsShouldConferWithAutolayoutEngineForSizingInfo];

    if (!v9) {
      goto LABEL_14;
    }
  }
  BOOL v10 = [(UICollectionReusableView *)self _shouldConstrainWidth];
  BOOL v11 = [(UICollectionReusableView *)self _shouldConstrainHeight];
  if (v10 && v11) {
    goto LABEL_14;
  }
  if (v10) {
    float v12 = 1000.0;
  }
  else {
    float v12 = 50.0;
  }
  [(UICollectionReusableView *)self _updateDefaultLayoutMarginsUsingAttributes:v4];
  [(UICollectionViewLayoutAttributes *)v4 size];
  double v14 = v13;
  double v16 = v15;
  -[UIView systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:](self, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:");
  double v18 = v17;
  double v20 = v19;
  [(UICollectionViewLayoutAttributes *)v4 _listLayoutItemMaxWidth];
  if (v12 != 1000.0 && v21 != 0.0 && v18 > v21)
  {
    -[UIView systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:](self, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:");
    double v18 = v22;
    double v20 = v23;
  }
  if (v14 == v18 && v16 == v20)
  {
LABEL_14:
    v24 = v4;
  }
  else
  {
    v24 = (UICollectionViewLayoutAttributes *)[(UICollectionViewLayoutAttributes *)v4 copy];
    -[UICollectionViewLayoutAttributes setSize:](v24, "setSize:", v18, v20);
  }

  return v24;
}

- (void)_updateDefaultLayoutMarginsUsingAttributes:(id)a3
{
  v4 = (const UIEdgeInsets *)a3;
  __int16 reusableViewFlags = (__int16)self->_reusableViewFlags;
  unsigned int v6 = reusableViewFlags & 0x4000;
  if (v4) {
    int v7 = (LOWORD(v4[9].top) >> 9) & 1;
  }
  else {
    int v7 = 0;
  }
  if (v7 == v6 >> 14)
  {
    if ((reusableViewFlags & 0x4000) != 0)
    {
      if (v4)
      {
        v8 = &UIEdgeInsetsZero;
        p_double bottom = &UIEdgeInsetsZero.bottom;
        p_double left = &UIEdgeInsetsZero.left;
        if ((LOWORD(v4[9].top) & 0x200) != 0) {
          p_double right = &v4[10].right;
        }
        else {
          p_double right = &UIEdgeInsetsZero.right;
        }
        if ((LOWORD(v4[9].top) & 0x200) != 0)
        {
          p_double left = &v4[10].left;
          p_double bottom = &v4[10].bottom;
          v8 = v4 + 10;
        }
        double top = v8->top;
        double v13 = *p_bottom;
        double v14 = *p_left;
        double v15 = *p_right;
      }
      else
      {
        double v14 = 0.0;
        double v13 = 0.0;
        double v15 = 0.0;
        double top = 0.0;
      }
      unsigned int v6 = self->_defaultLayoutMargins.left != v14;
      if (self->_defaultLayoutMargins.top != top) {
        unsigned int v6 = 1;
      }
      if (self->_defaultLayoutMargins.right != v15) {
        unsigned int v6 = 1;
      }
      if (self->_defaultLayoutMargins.bottom != v13) {
        unsigned int v6 = 1;
      }
    }
  }
  else
  {
    unsigned int v6 = 1;
  }
  if (v7) {
    __int16 v16 = 0x4000;
  }
  else {
    __int16 v16 = 0;
  }
  *(_WORD *)&self->___int16 reusableViewFlags = v16 | reusableViewFlags & 0xBFFF;
  p_defaultLayoutMargins = &self->_defaultLayoutMargins;
  if (!v7)
  {
    *(_OWORD *)&p_defaultLayoutMargins->double top = 0u;
    *(_OWORD *)&self->_defaultLayoutMargins.double bottom = 0u;
    if (!v6) {
      goto LABEL_34;
    }
    goto LABEL_33;
  }
  if (v4)
  {
    double v18 = &UIEdgeInsetsZero;
    double v19 = &UIEdgeInsetsZero.bottom;
    double v20 = &UIEdgeInsetsZero.left;
    if ((LOWORD(v4[9].top) & 0x200) != 0) {
      double v21 = &v4[10].right;
    }
    else {
      double v21 = &UIEdgeInsetsZero.right;
    }
    if ((LOWORD(v4[9].top) & 0x200) != 0)
    {
      double v20 = &v4[10].left;
      double v19 = &v4[10].bottom;
      double v18 = v4 + 10;
    }
    CGFloat v22 = v18->top;
    CGFloat v23 = *v19;
    CGFloat v24 = *v20;
    CGFloat v25 = *v21;
  }
  else
  {
    CGFloat v24 = 0.0;
    CGFloat v23 = 0.0;
    CGFloat v25 = 0.0;
    CGFloat v22 = 0.0;
  }
  p_defaultLayoutMargins->double top = v22;
  self->_defaultLayoutMargins.double left = v24;
  self->_defaultLayoutMargins.double bottom = v23;
  self->_defaultLayoutMargins.double right = v25;
  if (v6) {
LABEL_33:
  }
    [(UIView *)self _updateInferredLayoutMargins];
LABEL_34:
  MEMORY[0x1F4181878]();
}

- (BOOL)_shouldConstrainWidth
{
  return (*(_WORD *)&self->_reusableViewFlags >> 12) & 1;
}

- (BOOL)_shouldConstrainHeight
{
  return (*(_WORD *)&self->_reusableViewFlags >> 13) & 1;
}

- (void)_applyListEnvironmentTraitOverridesUsingNewListAttributes:(id)a3 previousListAttributes:(id)a4
{
  if (a3 || !a4)
  {
    if (!a3) {
      return;
    }
    uint64_t v5 = _UIListEnvironmentFromListStyle(*((void *)a3 + 2));
    -[UIView _internalTraitOverrides](self);
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    [v6 setListEnvironment:v5];
  }
  else
  {
    -[UIView _internalTraitOverrides](self);
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    [v6 removeTrait:objc_opt_class()];
  }
}

- (int64_t)_contentViewListStyleFromLayoutAttributes:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = -[UICollectionViewLayoutAttributes _existingListAttributes]((id *)a3);
  v4 = (void *)v3;
  if (!v3) {
    goto LABEL_7;
  }
  unint64_t v5 = *(void *)(v3 + 16);
  if (v5 >= 5)
  {
    if (os_variant_has_internal_diagnostics())
    {
      int v7 = __UIFaultDebugAssertLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      {
        uint64_t v10 = v4[2];
        int v11 = 134217984;
        uint64_t v12 = v10;
        _os_log_fault_impl(&dword_1853B0000, v7, OS_LOG_TYPE_FAULT, "Unhandled _UICollectionViewListLayoutAppearanceStyle (%ld)", (uint8_t *)&v11, 0xCu);
      }
    }
    else
    {
      id v6 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &_contentViewListStyleFromLayoutAttributes____s_category)+ 8);
      if (!os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
LABEL_7:
        unint64_t v5 = -1;
        goto LABEL_8;
      }
      int v7 = v6;
      uint64_t v8 = v4[2];
      int v11 = 134217984;
      uint64_t v12 = v8;
      _os_log_impl(&dword_1853B0000, v7, OS_LOG_TYPE_ERROR, "Unhandled _UICollectionViewListLayoutAppearanceStyle (%ld)", (uint8_t *)&v11, 0xCu);
    }

    goto LABEL_7;
  }
LABEL_8:

  return v5;
}

- (void)_setLayoutAttributes:(id)a3
{
}

- (void)_setLayoutAttributes:(id)a3 force:(BOOL)a4
{
  id v7 = a3;
  if (a4
    || ![(UICollectionViewLayoutAttributes *)self->_layoutAttributes isEqual:v7]
    || ([v7 alpha], double v9 = v8, -[UIView alpha](self, "alpha"), vabdd_f64(v9, v10) > 0.0001))
  {
    [(UICollectionViewLayoutAttributes *)self->_layoutAttributes size];
    int v11 = -[UICollectionViewLayoutAttributes _existingListAttributes]((id *)&self->_layoutAttributes->super.isa);
    uint64_t v12 = (UICollectionViewLayoutAttributes *)[v7 copy];
    layoutAttributes = self->_layoutAttributes;
    self->_layoutAttributes = v12;

    double v14 = -[_UIKeyWindowSceneStack keyWindowSceneInStack]((id *)&self->_layoutAttributes->super.isa);

    if (v14)
    {
      double v15 = -[_UIKeyWindowSceneStack keyWindowSceneInStack]((id *)v7);
      [(UICollectionReusableView *)self _setReuseIdentifier:v15];
    }
    __int16 v16 = -[UICollectionViewLayoutAttributes _existingListAttributes]((id *)v7);
    [(UICollectionReusableView *)self _applyListEnvironmentTraitOverridesUsingNewListAttributes:v16 previousListAttributes:v11];

    [v7 center];
    -[UIView setCenter:](self, "setCenter:");
    if (dyld_program_sdk_at_least())
    {
      [v7 bounds];
      double v18 = v17;
      double v20 = v19;
      double v22 = v21;
      double v24 = v23;
      [v7 size];
      if (!_UISizeEqualToSizeWithPrecision(v22, v24, v25, v26, 0.0001))
      {
        v27 = [MEMORY[0x1E4F28B00] currentHandler];
        v48.width = v22;
        v48.height = v24;
        v28 = NSStringFromCGSize(v48);
        [v7 size];
        v29 = NSStringFromCGSize(v49);
        [v27 handleFailureInMethod:a2, self, @"UICollectionViewCell.m", 337, @"UICollectionViewReusableView received malformed layout attributes. attributes.bounds.size (%@) and attributes.size (%@) must be equal. This is a client error. Layout attributes: %@\nView: %@", v28, v29, v7, self object file lineNumber description];
      }
    }
    else
    {
      [(UIView *)self bounds];
      double v18 = v30;
      double v20 = v31;
      [v7 size];
      double v22 = v32;
      double v24 = v33;
    }
    -[UIView setBounds:](self, "setBounds:", v18, v20, v22, v24);
    [v7 alpha];
    -[UIView setAlpha:](self, "setAlpha:");
    if (v7)
    {
      [v7 transform3D];
    }
    else if (dyld_program_sdk_at_least())
    {
      long long v34 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 80);
      long long v44 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 64);
      long long v45 = v34;
      long long v35 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 112);
      long long v46 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 96);
      long long v47 = v35;
      long long v36 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 16);
      long long v40 = *MEMORY[0x1E4F39B10];
      long long v41 = v36;
      long long v37 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 48);
      long long v42 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 32);
      long long v43 = v37;
    }
    else
    {
      long long v46 = 0u;
      long long v47 = 0u;
      long long v44 = 0u;
      long long v45 = 0u;
      long long v42 = 0u;
      long long v43 = 0u;
      long long v40 = 0u;
      long long v41 = 0u;
    }
    v39[4] = v44;
    v39[5] = v45;
    v39[6] = v46;
    v39[7] = v47;
    v39[0] = v40;
    v39[1] = v41;
    v39[2] = v42;
    v39[3] = v43;
    [(UIView *)self setTransform3D:v39];
    [(UICollectionReusableView *)self _updateMaskingUsingAttributes:v7];
    [(UICollectionReusableView *)self _updateMaskViewUsingAttributes:v7];
    [(UICollectionReusableView *)self _updateDefaultLayoutMarginsUsingAttributes:v7];
    [(UICollectionReusableView *)self applyLayoutAttributes:v7];
    if (![(UICollectionReusableView *)self _isInUpdateAnimation]
      && +[UIView _isInAnimationBlockWithAnimationsEnabled])
    {
      v38[0] = MEMORY[0x1E4F143A8];
      v38[1] = 3221225472;
      v38[2] = __55__UICollectionReusableView__setLayoutAttributes_force___block_invoke;
      v38[3] = &unk_1E52DC3A0;
      v38[4] = self;
      +[UIView _addCompletion:v38];
    }
  }
}

- (void)_updateMaskingUsingAttributes:(id)a3
{
  uint64_t v13 = (unsigned __int16 *)a3;
  __int16 v4 = [(UICollectionReusableView *)self _appliesLayoutAttributesMaskingToReusableView];
  unint64_t v5 = [(UIView *)self layer];
  id v6 = v13;
  if (v13)
  {
    p___int16 reusableViewFlags = &self->_reusableViewFlags;
    __int16 v8 = *(_WORD *)p_reusableViewFlags;
    if (*(_DWORD *)&v4 & (v13[144] >> 4))
    {
      *(_WORD *)p___int16 reusableViewFlags = v8 | 0x10;
      [v5 setMasksToBounds:1];
      id v6 = v13;
      __int16 v8 = *(_WORD *)p_reusableViewFlags;
LABEL_8:
      unint64_t v9 = ((unint64_t)v6[144] >> 5) & 0xF;
      goto LABEL_9;
    }
  }
  else
  {
    p___int16 reusableViewFlags = &self->_reusableViewFlags;
    __int16 v8 = *(_WORD *)p_reusableViewFlags;
  }
  if ((v8 & 0x10) != 0)
  {
    [v5 setMasksToBounds:0];
    id v6 = v13;
    __int16 v8 = *(_WORD *)p_reusableViewFlags & 0xFFEF;
    *(_WORD *)p___int16 reusableViewFlags = v8;
  }
  if (v6) {
    goto LABEL_8;
  }
  unint64_t v9 = 0;
LABEL_9:
  if (v9 == 15) {
    char v10 = 0;
  }
  else {
    char v10 = v4;
  }
  if (v10)
  {
    *(_WORD *)p___int16 reusableViewFlags = v8 | 0x20;
    objc_msgSend(v5, "setMaskedCorners:");
    id v6 = v13;
  }
  else if ((v8 & 0x20) != 0)
  {
    [v5 setMaskedCorners:15];
    id v6 = v13;
    *(_WORD *)p_reusableViewFlags &= ~0x20u;
  }
  if (v6)
  {
    if (*((double *)v6 + 39) == 0.0) {
      char v11 = 0;
    }
    else {
      char v11 = v4;
    }
    __int16 v12 = *(_WORD *)p_reusableViewFlags;
    if (v11)
    {
      *(_WORD *)p___int16 reusableViewFlags = v12 | 0x40;
      objc_msgSend(v5, "setCornerRadius:");
      [v5 setCornerCurve:*MEMORY[0x1E4F39EA8]];
      goto LABEL_25;
    }
  }
  else
  {
    __int16 v12 = *(_WORD *)p_reusableViewFlags;
  }
  if ((v12 & 0x40) != 0)
  {
    [v5 setCornerRadius:0.0];
    [v5 setCornerCurve:*MEMORY[0x1E4F39EA0]];
    *(_WORD *)p_reusableViewFlags &= ~0x40u;
  }
LABEL_25:
}

- (BOOL)_isInUpdateAnimation
{
  return self->_updateAnimationCount > 0;
}

- (void)_updateMaskViewUsingAttributes:(id)a3
{
  __int16 v4 = (double *)a3;
  if (-[UICollectionViewLayoutAttributes _hasMaskViewFrame]((BOOL)v4))
  {
    unint64_t v5 = [(UIView *)self superview];
    if (v4)
    {
      double v6 = v4[30];
      double v7 = v4[31];
      double v8 = v4[32];
      double v9 = v4[33];
    }
    else
    {
      double v7 = 0.0;
      double v8 = 0.0;
      double v9 = 0.0;
      double v6 = 0.0;
    }
    -[UIView convertRect:fromView:](self, "convertRect:fromView:", v5, v6, v7, v8, v9);
    double v11 = v10;
    double v13 = v12;
    double v15 = v14;
    double v17 = v16;
    double v18 = -[UICollectionReusableView _internalMaskView](self);
    double v19 = v18;
    if (v18)
    {
      objc_msgSend(v18, "setFrame:", v11, v13, v15, v17);
      if (!v4) {
        goto LABEL_22;
      }
    }
    else
    {
      double v21 = -[_UICollectionViewMaskView initWithFrame:]([_UICollectionViewMaskView alloc], "initWithFrame:", v11, v13, v15, v17);
      -[UICollectionReusableView _setInternalMaskView:](self, v21);

      if (!v4)
      {
LABEL_22:

        goto LABEL_23;
      }
    }
    if (((_WORD)v4[36] & 0x400) != 0)
    {
      if (self->_updateAnimationCount < 1)
      {
        -[UICollectionReusableView _setInternalMaskView:](self, 0);
      }
      else
      {
        if (v19)
        {
          uint64_t v22 = v19[51] + 1;
          v19[51] = v22;
        }
        else
        {
          uint64_t v22 = 1;
        }
        uint64_t v29 = MEMORY[0x1E4F143A8];
        uint64_t v30 = 3221225472;
        double v31 = __59__UICollectionReusableView__updateMaskViewUsingAttributes___block_invoke;
        double v32 = &unk_1E52E5220;
        double v33 = v19;
        long long v34 = self;
        uint64_t v35 = v22;
        double v23 = &v29;
        if (self->_updateAnimationCount <= 0)
        {
          v28 = [MEMORY[0x1E4F28B00] currentHandler];
          [v28 handleFailureInMethod:sel__addUpdateAnimationCompletionBlock_, self, @"UICollectionViewCell.m", 672, @"UIKit internal bug: Attempting to add an update animation completion block without an inflight animation: %@", self, v29, v30, v31, v32 object file lineNumber description];
        }
        double v24 = -[UICollectionReusableView _updateAnimationCompletionBlocks](self);
        if (v24)
        {
          double v25 = _Block_copy(v23);
          [v24 addObject:v25];
        }
        else
        {
          double v26 = (void *)MEMORY[0x1E4F1CA48];
          double v25 = _Block_copy(v23);
          v27 = [v26 arrayWithObject:v25];
          objc_setAssociatedObject(self, &_UpdateCompletionBlocksKey, v27, (void *)1);
        }
      }
    }
    goto LABEL_22;
  }
  uint64_t v20 = -[UICollectionReusableView _internalMaskView](self);
  unint64_t v5 = (void *)v20;
  if (v20 && !*(void *)(v20 + 408)) {
    -[UICollectionReusableView _setInternalMaskView:](self, 0);
  }
LABEL_23:
}

- (_WORD)_internalMaskView
{
  if (a1)
  {
    if ((a1[232] & 0x80) != 0)
    {
      -[UIView _safeMaskView](a1);
      a1 = (_WORD *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      a1 = 0;
    }
    uint64_t v1 = vars8;
  }
  return a1;
}

- (BOOL)_appliesLayoutAttributesMaskingToReusableView
{
  return 1;
}

- (void)_setShouldConstrainWidth:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4096;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 reusableViewFlags = *(_WORD *)&self->_reusableViewFlags & 0xEFFF | v3;
}

- (void)_setShouldConstrainHeight:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 0x2000;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 reusableViewFlags = *(_WORD *)&self->_reusableViewFlags & 0xDFFF | v3;
}

- (UICollectionViewLayoutAttributes)_layoutAttributes
{
  return self->_layoutAttributes;
}

- (BOOL)_arePreferredAttributesValid
{
  return (*(_WORD *)&self->_reusableViewFlags >> 2) & 1;
}

- (int64_t)_styleFromLayoutAttributes:(id)a3
{
  __int16 v3 = -[UICollectionViewLayoutAttributes _existingListAttributes]((id *)a3);
  if (v3) {
    int64_t v4 = v3[2];
  }
  else {
    int64_t v4 = 0;
  }

  return v4;
}

- (UICollectionReusableView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)UICollectionReusableView;
  __int16 v3 = -[UIView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  int64_t v4 = v3;
  if (v3) {
    _UICollectionReusableViewCommonInit(v3);
  }
  return v4;
}

- (void)_setReuseIdentifier:(id)a3
{
}

- (void)setTranslatesAutoresizingMaskIntoConstraints:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    if ([(UIView *)self translatesAutoresizingMaskIntoConstraints])
    {
      if (dyld_program_sdk_at_least())
      {
        unint64_t v5 = *(NSObject **)(__UILogGetCategoryCachedImpl("LayoutConstraints", &setTranslatesAutoresizingMaskIntoConstraints____s_category)+ 8);
        if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        {
          objc_super v6 = v5;
          objc_opt_class();
          char isKindOfClass = objc_opt_isKindOfClass();
          double v8 = @"UICollectionReusableView";
          if (isKindOfClass) {
            double v8 = @"UICollectionViewCell";
          }
          *(_DWORD *)buf = 138412546;
          double v11 = v8;
          __int16 v12 = 2112;
          double v13 = self;
          _os_log_impl(&dword_1853B0000, v6, OS_LOG_TYPE_ERROR, "Changing the translatesAutoresizingMaskIntoConstraints property of a %@ that is managed by a UICollectionView is not supported, and will result in incorrect self-sizing. View: %@", buf, 0x16u);
        }
      }
    }
  }
  v9.receiver = self;
  v9.super_class = (Class)UICollectionReusableView;
  [(UIView *)&v9 setTranslatesAutoresizingMaskIntoConstraints:v3];
}

- (void)_markAsDequeued
{
  *(_WORD *)&self->_reusableViewFlags |= 1u;
}

- (void)_setElementKind:(id)a3
{
}

- (void)_setCollectionView:(id)a3
{
  *(_WORD *)&self->___int16 reusableViewFlags = *(_WORD *)&self->_reusableViewFlags & 0xF7FF | ((a3 != 0) << 11);
  objc_storeWeak((id *)&self->_collectionView, a3);
}

- (void)_setAutomaticIntrinsicContentSizeInvalidationEnabled:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 0x8000;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 reusableViewFlags = v3 & 0x8000 | *(_WORD *)&self->_reusableViewFlags & 0x7FFF;
}

- (BOOL)canBeEdited
{
  return 0;
}

- (BOOL)_hasNotifiedIsDisplaying
{
  return (*(_WORD *)&self->_reusableViewFlags >> 10) & 1;
}

- (void)_addUpdateAnimation
{
}

- (void)invalidateIntrinsicContentSize
{
  __int16 v3 = [(UICollectionReusableView *)self _collectionView];
  int64_t v4 = v3;
  if (v3)
  {
    [v3 _reusableViewDidInvalidateIntrinsicContentSize:self];
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)UICollectionReusableView;
    [(UIView *)&v5 invalidateIntrinsicContentSize];
  }
}

- (UICollectionView)_collectionView
{
  p_collectionView = &self->_collectionView;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_collectionView);
  if (!WeakRetained)
  {
    uint64_t v5 = objc_opt_class();
    id WeakRetained = _UIFallbackViewOfClassForReusableView(v5, self);
    if (WeakRetained) {
      objc_storeWeak((id *)p_collectionView, WeakRetained);
    }
  }
  id v6 = WeakRetained;

  return (UICollectionView *)v6;
}

- (id)_preferredLayoutAttributesFittingAttributes:(id)a3 isAnimatingExistingView:(BOOL)a4
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  *(_WORD *)&self->_reusableViewFlags |= 0xCu;
  [(UIView *)self updateTraitsIfNeeded];
  kdebug_trace();
  double v7 = [(UICollectionReusableView *)self preferredLayoutAttributesFittingAttributes:v6];
  kdebug_trace();
  if (!v7)
  {
    uint64_t v30 = [MEMORY[0x1E4F28B00] currentHandler];
    double v31 = [(UICollectionReusableView *)self _collectionView];
    [v30 handleFailureInMethod:a2, self, @"UICollectionViewCell.m", 756, @"Received nil preferred attributes from -preferredLayoutAttributesFittingAttributes: in view %@. Original attributes: %@. Collection view: %@", self, v6, v31 object file lineNumber description];
  }
  if (dyld_program_sdk_at_least())
  {
    [v7 frame];
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
    double v15 = v14;
    [(UIView *)self _currentScreenScale];
    double v17 = UIPointRoundToScale(v9, v11, v16);
    double v19 = v18;
    [(UIView *)self _currentScreenScale];
    double v21 = UISizeRoundToScale(v13, v15, v20);
    double v23 = v22;
    int v24 = dyld_program_sdk_at_least();
    BOOL IsDiscrete = UIRectIsDiscrete(v17, v19, v21, v23);
    if (v24)
    {
      if (!IsDiscrete)
      {
        double v26 = [MEMORY[0x1E4F28B00] currentHandler];
        v46.origin.x = v9;
        v46.origin.y = v11;
        v46.size.width = v13;
        v46.size.height = v15;
        v27 = NSStringFromCGRect(v46);
        v47.origin.x = v17;
        v47.origin.y = v19;
        v47.size.width = v21;
        v47.size.height = v23;
        v28 = NSStringFromCGRect(v47);
        [v26 handleFailureInMethod:a2, self, @"UICollectionViewCell.m", 775, @"Rounding frame (%@) from preferred layout attributes resulted in a frame with one or more invalid members (%@).\nLayout attributes: %@\nView: %@", v27, v28, v7, self object file lineNumber description];
      }
    }
    else if (!IsDiscrete)
    {
      double v32 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &_preferredLayoutAttributesFittingAttributes_isAnimatingExistingView____s_category)+ 8);
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        double v33 = v32;
        v49.origin.x = v9;
        v49.origin.y = v11;
        v49.size.width = v13;
        v49.size.height = v15;
        long long v34 = NSStringFromCGRect(v49);
        v50.origin.x = v17;
        v50.origin.y = v19;
        v50.size.width = v21;
        v50.size.height = v23;
        uint64_t v35 = NSStringFromCGRect(v50);
        *(_DWORD *)buf = 138413058;
        long long v37 = v34;
        __int16 v38 = 2112;
        v39 = v35;
        __int16 v40 = 2112;
        long long v41 = v7;
        __int16 v42 = 2112;
        long long v43 = self;
        _os_log_impl(&dword_1853B0000, v33, OS_LOG_TYPE_ERROR, "Rounding frame (%@) from preferred layout attributes resulted in a frame with one or more invalid members (%@).\nLayout attributes: %@\nView: %@", buf, 0x2Au);
      }
    }
    v48.origin.x = v17;
    v48.origin.y = v19;
    v48.size.width = v21;
    v48.size.height = v23;
    v51.origin.x = v9;
    v51.origin.y = v11;
    v51.size.width = v13;
    v51.size.height = v15;
    if (!CGRectEqualToRect(v48, v51)) {
      objc_msgSend(v7, "setFrame:", v17, v19, v21, v23);
    }
  }
  *(_WORD *)&self->_reusableViewFlags &= ~8u;

  return v7;
}

- (void)_clearUpdateAnimation
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  int64_t updateAnimationCount = self->_updateAnimationCount;
  if (updateAnimationCount <= 0)
  {
    double v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"UICollectionViewCell.m", 658, @"unbalanced ending to update animation which apparently never began for this view (%@)", self object file lineNumber description];

    self->_int64_t updateAnimationCount = updateAnimationCount - 1;
  }
  else
  {
    self->_int64_t updateAnimationCount = updateAnimationCount - 1;
    if (updateAnimationCount == 1)
    {
      int64_t v4 = -[UICollectionReusableView _updateAnimationCompletionBlocks](self);
      objc_setAssociatedObject(self, &_UpdateCompletionBlocksKey, 0, (void *)1);
      long long v14 = 0u;
      long long v15 = 0u;
      long long v12 = 0u;
      long long v13 = 0u;
      id v5 = v4;
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
            (*(void (**)(void))(*(void *)(*((void *)&v12 + 1) + 8 * v9++) + 16))();
          }
          while (v7 != v9);
          uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
        }
        while (v7);
      }
    }
  }
}

- (id)_updateAnimationCompletionBlocks
{
  uint64_t v1 = objc_getAssociatedObject(a1, &_UpdateCompletionBlocksKey);
  return v1;
}

- (void)_setIsBeingReused:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 512;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 reusableViewFlags = *(_WORD *)&self->_reusableViewFlags & 0xFDFF | v3;
}

- (BOOL)_isBeingReused
{
  return (*(_WORD *)&self->_reusableViewFlags >> 9) & 1;
}

- (void)_invalidatePreferredAttributes
{
  __int16 reusableViewFlags = (__int16)self->_reusableViewFlags;
  if ((reusableViewFlags & 8) == 0) {
    *(_WORD *)&self->___int16 reusableViewFlags = reusableViewFlags & 0xFFFB;
  }
}

- (void)_setHiddenForReuse:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if ([(UIView *)self _isHiddenForReuse] != a3)
  {
    unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("UICollectionViewCellReuse", &_MergedGlobals_83);
    if (*(unsigned char *)CategoryCachedImpl)
    {
      uint64_t v7 = *(NSObject **)(CategoryCachedImpl + 8);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        uint64_t v8 = v7;
        uint64_t v9 = objc_opt_class();
        double v10 = [(UICollectionReusableView *)self _layoutAttributes];
        double v11 = [(UICollectionReusableView *)self _collectionView];
        *(_DWORD *)buf = 138413314;
        uint64_t v18 = v9;
        __int16 v19 = 2048;
        double v20 = self;
        __int16 v21 = 1024;
        *(_DWORD *)double v22 = v3;
        *(_WORD *)&v22[4] = 2112;
        *(void *)&v22[6] = v10;
        __int16 v23 = 2112;
        int v24 = v11;
        _os_log_impl(&dword_1853B0000, v8, OS_LOG_TYPE_ERROR, "[%@ %p] _setHiddenForReuse: Setting hidden for reuse:%d on cell with attributes:%@ in collection view: %@", buf, 0x30u);
      }
    }
    unint64_t v6 = __UILogGetCategoryCachedImpl("UICollectionViewCellReuse", &qword_1EB2588B0);
    if (*(unsigned char *)v6)
    {
      long long v12 = *(NSObject **)(v6 + 8);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        long long v13 = v12;
        uint64_t v14 = objc_opt_class();
        long long v15 = [MEMORY[0x1E4F29060] callStackSymbols];
        *(_DWORD *)buf = 138412802;
        uint64_t v18 = v14;
        __int16 v19 = 2048;
        double v20 = self;
        __int16 v21 = 2112;
        *(void *)double v22 = v15;
        _os_log_impl(&dword_1853B0000, v13, OS_LOG_TYPE_ERROR, "[%@ %p] _setHiddenForReuse: Call stack: %@", buf, 0x20u);
      }
    }
  }
  v16.receiver = self;
  v16.super_class = (Class)UICollectionReusableView;
  [(UIView *)&v16 _setHiddenForReuse:v3];
}

- (void)_willRevealWithLayoutAttributes:(id)a3
{
  -[UICollectionViewLayoutAttributes _existingListAttributes]((id *)a3);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  int64_t v4 = -[UICollectionViewLayoutAttributes _existingListAttributes]((id *)&self->_layoutAttributes->super.isa);
  [(UICollectionReusableView *)self _applyListEnvironmentTraitOverridesUsingNewListAttributes:v5 previousListAttributes:v4];
}

- (NSString)reuseIdentifier
{
  return self->_reuseIdentifier;
}

- (BOOL)_wasDequeued
{
  return *(_WORD *)&self->_reusableViewFlags & 1;
}

- (BOOL)_hasBeenReused
{
  return (*(_WORD *)&self->_reusableViewFlags >> 1) & 1;
}

- (void)_notifyIsDisplaying:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 1024;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 reusableViewFlags = *(_WORD *)&self->_reusableViewFlags & 0xFBFF | v3;
}

- (NSString)_elementKind
{
  return self->_elementKind;
}

- (void)prepareForReuse
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  *(_WORD *)&self->___int16 reusableViewFlags = *(_WORD *)&self->_reusableViewFlags & 0xCFF9 | 2;
  __int16 v3 = -[UIView _safeMaskView](self);
  if (v3)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_collectionView);
      uint64_t v5 = [WeakRetained collectionViewLayout];
      unint64_t v6 = (void *)v5;
      if (v5)
      {
        uint64_t v7 = [*(id *)(v5 + 136) currentSwipeOccurrence];
        uint64_t v8 = v7;
        if (v7)
        {
          uint64_t v9 = [v7 swipedView];
          double v10 = -[UIView _safeMaskView](v9);

          if (v10 == v3)
          {
            if (os_variant_has_internal_diagnostics())
            {
              long long v12 = __UIFaultDebugAssertLog();
              if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
              {
                int v13 = 138412802;
                uint64_t v14 = self;
                __int16 v15 = 2112;
                id v16 = WeakRetained;
                __int16 v17 = 2112;
                uint64_t v18 = v8;
                _os_log_fault_impl(&dword_1853B0000, v12, OS_LOG_TYPE_FAULT, "UICollectionView internal inconsistency: unexpected removal of the current swipe occurrence's mask view. Please file a bug against UICollectionView. Reusable view: %@; Collection view: %@; Swipe occurrence: %@",
                  (uint8_t *)&v13,
                  0x20u);
              }
            }
            else
            {
              double v11 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &prepareForReuse___s_category_0) + 8);
              if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
              {
                int v13 = 138412802;
                uint64_t v14 = self;
                __int16 v15 = 2112;
                id v16 = WeakRetained;
                __int16 v17 = 2112;
                uint64_t v18 = v8;
                _os_log_impl(&dword_1853B0000, v11, OS_LOG_TYPE_ERROR, "UICollectionView internal inconsistency: unexpected removal of the current swipe occurrence's mask view. Please file a bug against UICollectionView. Reusable view: %@; Collection view: %@; Swipe occurrence: %@",
                  (uint8_t *)&v13,
                  0x20u);
              }
            }
          }
        }
      }
      -[UIView _setSafeMaskView:](self, 0);
    }
  }
  [(UICollectionReusableView *)self _notifyIsDisplaying:0];
}

- (void)_setMaskView:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)UICollectionReusableView;
  -[UIView _setMaskView:](&v5, sel__setMaskView_);
  if (a3) {
    [(UICollectionReusableView *)self _addBackdropViewForMaskingIfNeeded];
  }
  else {
    [(UICollectionReusableView *)self _removeExistingBackdropViewForMasking];
  }
}

- (void)_removeExistingBackdropViewForMasking
{
  __int16 v3 = objc_getAssociatedObject(self, &_UICollectionReusableViewBackdropViewForMasking);
  if (v3)
  {
    id v4 = v3;
    [v3 removeFromSuperview];
    objc_setAssociatedObject(self, &_UICollectionReusableViewBackdropViewForMasking, 0, (void *)1);
    __int16 v3 = v4;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_elementKind, 0);
  objc_storeStrong((id *)&self->_reuseIdentifier, 0);
  objc_destroyWeak((id *)&self->_collectionView);
  objc_storeStrong((id *)&self->_layoutAttributes, 0);
}

- (UICollectionReusableView)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)UICollectionReusableView;
  objc_super v5 = [(UIView *)&v10 initWithCoder:v4];
  if (v5)
  {
    unint64_t v6 = [v4 decodeObjectForKey:@"UIReuseIdentifier"];
    uint64_t v7 = [v6 copy];
    reuseIdentifier = v5->_reuseIdentifier;
    v5->_reuseIdentifier = (NSString *)v7;

    _UICollectionReusableViewCommonInit(v5);
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)UICollectionReusableView;
  [(UIView *)&v6 encodeWithCoder:v4];
  reuseIdentifier = self->_reuseIdentifier;
  if (reuseIdentifier) {
    [v4 encodeObject:reuseIdentifier forKey:@"UIReuseIdentifier"];
  }
}

- (void)_setHiddenForReordering:(BOOL)a3
{
}

- (BOOL)_isHiddenForReordering
{
  if (self) {
    return (*((void *)&self->super._viewFlags + 1) >> 17) & 1;
  }
  return (char)self;
}

- (void)_setBaseLayoutAttributes:(id)a3
{
  id v8 = a3;
  if (!-[UICollectionViewLayoutAttributes isEqual:](self->_layoutAttributes, "isEqual:"))
  {
    id v4 = (UICollectionViewLayoutAttributes *)[v8 copy];
    layoutAttributes = self->_layoutAttributes;
    self->_layoutAttributes = v4;

    objc_super v6 = -[_UIKeyWindowSceneStack keyWindowSceneInStack]((id *)&self->_layoutAttributes->super.isa);

    if (v6)
    {
      uint64_t v7 = -[_UIKeyWindowSceneStack keyWindowSceneInStack]((id *)v8);
      [(UICollectionReusableView *)self _setReuseIdentifier:v7];
    }
  }
}

void __55__UICollectionReusableView__setLayoutAttributes_force___block_invoke(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0 && ([*(id *)(a1 + 32) _isHiddenForReuse] & 1) == 0)
  {
    __int16 v3 = [*(id *)(a1 + 32) window];

    if (v3)
    {
      id v4 = *(void **)(a1 + 32);
      uint64_t v5 = v4[51];
      [v4 _setLayoutAttributes:v5 force:1];
    }
  }
}

- (void)_setInternalMaskView:(_WORD *)a1
{
  id v3 = a2;
  id v4 = v3;
  if (a1)
  {
    __int16 v5 = a1[232];
    if (v3)
    {
      a1[232] = v5 | 0x80;
      objc_super v6 = a1;
      uint64_t v7 = v4;
    }
    else
    {
      if ((v5 & 0x80) == 0) {
        goto LABEL_7;
      }
      a1[232] = v5 & 0xFF7F;
      objc_super v6 = a1;
      uint64_t v7 = 0;
      id v4 = 0;
    }
    -[UIView _setSafeMaskView:](v6, v4);
    id v4 = v7;
  }
LABEL_7:
}

void __59__UICollectionReusableView__updateMaskViewUsingAttributes___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  id v3 = -[UICollectionReusableView _internalMaskView](*(_WORD **)(a1 + 40));
  if (v2 == v3)
  {
    uint64_t v4 = *(void *)(a1 + 32);
    if (v4) {
      uint64_t v5 = *(void *)(v4 + 408);
    }
    else {
      uint64_t v5 = 0;
    }
    uint64_t v6 = *(void *)(a1 + 48);

    if (v5 == v6)
    {
      uint64_t v7 = *(_WORD **)(a1 + 40);
      -[UICollectionReusableView _setInternalMaskView:](v7, 0);
    }
  }
  else
  {
  }
}

- (void)_addBackdropViewForMaskingIfNeeded
{
  id v3 = objc_getAssociatedObject(self, &_UICollectionReusableViewBackdropViewForMasking);
  if (!v3)
  {
    uint64_t v4 = [_UIVisualEffectBackdropView alloc];
    [(UIView *)self bounds];
    value = -[_UIVisualEffectSubview initWithFrame:](v4, "initWithFrame:");
    [(UIView *)value setAutoresizingMask:18];
    [(UIView *)self insertSubview:value atIndex:0];
    objc_setAssociatedObject(self, &_UICollectionReusableViewBackdropViewForMasking, value, (void *)1);
    id v3 = value;
  }
}

- (BOOL)_isFocusableWhenStyledAsHeader
{
  return 0;
}

- (BOOL)_automaticIntrinsicContentSizeInvalidationEnabled
{
  return *(_WORD *)&self->_reusableViewFlags >> 15;
}

- (BOOL)isEditing
{
  return 0;
}

- (void)setPreferredAttributesValid:(BOOL)a3
{
  self->_preferredAttributesValid = a3;
}

@end
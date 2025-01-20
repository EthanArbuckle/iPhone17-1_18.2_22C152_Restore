@interface PXProtoFeatureView
- (BOOL)_needsUpdate;
- (BOOL)canBecomeFocused;
- (BOOL)isDisabled;
- (BOOL)isSelected;
- (BOOL)shouldUpdateContentOnResize;
- (BOOL)wantsContentView;
- (CGRect)_contentViewFrame;
- (CGSize)intrinsicContentSize;
- (CGSize)regularContentSize;
- (PXProtoFeature)feature;
- (UIColor)preferredBackgroundColor;
- (UIEdgeInsets)_contentInsets;
- (UIEdgeInsets)minimumMargins;
- (UIImageView)_removeIconView;
- (UIView)contentView;
- (double)recommendedCompactContentHeight;
- (void)_invalidateContent;
- (void)_setNeedsUpdate;
- (void)_updateContentIfNeeded;
- (void)_updateIfNeeded;
- (void)layoutSubviews;
- (void)performChanges:(id)a3;
- (void)prepareForReuse;
- (void)setDisabled:(BOOL)a3;
- (void)setFeature:(id)a3;
- (void)setSelected:(BOOL)a3;
- (void)updateContent;
@end

@implementation PXProtoFeatureView

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->__removeIconView, 0);
  objc_storeStrong((id *)&self->_feature, 0);
}

- (UIEdgeInsets)minimumMargins
{
  double top = self->_minimumMargins.top;
  double left = self->_minimumMargins.left;
  double bottom = self->_minimumMargins.bottom;
  double right = self->_minimumMargins.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (BOOL)shouldUpdateContentOnResize
{
  return self->_shouldUpdateContentOnResize;
}

- (UIView)contentView
{
  return self->_contentView;
}

- (UIImageView)_removeIconView
{
  return self->__removeIconView;
}

- (BOOL)isDisabled
{
  return self->_disabled;
}

- (BOOL)isSelected
{
  return self->_selected;
}

- (PXProtoFeature)feature
{
  return self->_feature;
}

- (void)_updateContentIfNeeded
{
  if (self->_needsUpdateFlags.content)
  {
    self->_needsUpdateFlags.content = 0;
    [(PXProtoFeatureView *)self updateContent];
  }
}

- (void)_invalidateContent
{
  self->_needsUpdateFlags.content = 1;
  [(PXProtoFeatureView *)self _setNeedsUpdate];
}

- (void)_updateIfNeeded
{
  if ([(PXProtoFeatureView *)self _needsUpdate])
  {
    BOOL isPerformingUpdates = self->_isPerformingUpdates;
    self->_BOOL isPerformingUpdates = 1;
    [(PXProtoFeatureView *)self _updateContentIfNeeded];
    self->_BOOL isPerformingUpdates = isPerformingUpdates;
  }
}

- (BOOL)_needsUpdate
{
  return self->_needsUpdateFlags.content;
}

- (void)_setNeedsUpdate
{
  if (!self->_isPerformingChanges && !self->_isPerformingUpdates)
  {
    id v4 = [MEMORY[0x1E4F28B00] currentHandler];
    [v4 handleFailureInMethod:a2 object:self file:@"PXProtoFeatureView.m" lineNumber:192 description:@"neither inside perform changes nor updates"];
  }
}

- (void)performChanges:(id)a3
{
  BOOL isPerformingChanges = self->_isPerformingChanges;
  self->_BOOL isPerformingChanges = 1;
  (*((void (**)(id, PXProtoFeatureView *))a3 + 2))(a3, self);
  self->_BOOL isPerformingChanges = isPerformingChanges;
  if (!isPerformingChanges)
  {
    [(PXProtoFeatureView *)self _updateIfNeeded];
  }
}

- (void)setDisabled:(BOOL)a3
{
  if (self->_disabled != a3)
  {
    self->_disabled = a3;
    [(PXProtoFeatureView *)self _invalidateContent];
  }
}

- (void)setSelected:(BOOL)a3
{
  if (self->_selected != a3)
  {
    self->_selected = a3;
    [(PXProtoFeatureView *)self _invalidateContent];
  }
}

- (void)setFeature:(id)a3
{
  v5 = (PXProtoFeature *)a3;
  if (self->_feature != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_feature, a3);
    [(PXProtoFeatureView *)self _invalidateContent];
    v5 = v6;
  }
}

- (UIEdgeInsets)_contentInsets
{
  if ([(PXProtoFeatureView *)self isSelected]) {
    double v3 = 22.0;
  }
  else {
    double v3 = 4.0;
  }
  [(PXProtoFeatureView *)self minimumMargins];
  if (v3 >= v5) {
    double v5 = v3;
  }
  double v8 = fmax(v7, 4.0);
  double v9 = fmax(v4, 4.0);
  double v10 = fmax(v6, 4.0);
  result.double right = v8;
  result.double bottom = v10;
  result.double left = v5;
  result.double top = v9;
  return result;
}

- (CGRect)_contentViewFrame
{
  [(PXProtoFeatureView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  [(PXProtoFeatureView *)self _contentInsets];
  double v13 = v12;
  double v15 = v14;
  double v17 = v8 - (v11 + v16);
  if (v17 < 0.0 || (double v15 = v13 + v15, v18 = v10 - v15, v10 - v15 < 0.0))
  {
    [(PXProtoFeatureView *)self bounds];
  }
  else
  {
    double v19 = v4 + v11;
    double v20 = v6 + v13;
  }
  result.size.height = v18;
  result.size.width = v17;
  result.origin.y = v20;
  result.origin.x = v19;
  return result;
}

- (void)updateContent
{
  if ([(PXProtoFeatureView *)self wantsContentView])
  {
    double v17 = [(PXProtoFeatureView *)self contentView];
    if (!v17)
    {
      id v3 = objc_alloc(MEMORY[0x1E4FB1EB0]);
      [(PXProtoFeatureView *)self _contentViewFrame];
      double v4 = (UIView *)objc_msgSend(v3, "initWithFrame:");
      contentView = self->_contentView;
      self->_contentView = v4;

      double v17 = v4;
      [(PXProtoFeatureView *)self addSubview:self->_contentView];
      id v6 = objc_alloc(MEMORY[0x1E4FB1838]);
      double v7 = objc_msgSend(MEMORY[0x1E4FB1818], "px_imageNamed:", @"PXProtoFeatureRemove");
      double v8 = (UIImageView *)[v6 initWithImage:v7];
      removeIconView = self->__removeIconView;
      self->__removeIconView = v8;

      [(UIImageView *)self->__removeIconView setHidden:1];
      [(PXProtoFeatureView *)self addSubview:self->__removeIconView];
    }
    double v10 = [(PXProtoFeatureView *)self preferredBackgroundColor];
    [(PXProtoFeatureView *)self setBackgroundColor:v10];

    double v11 = [(PXProtoFeatureView *)self layer];
    [v11 setCornerRadius:8.0];

    BOOL v12 = [(PXProtoFeatureView *)self isDisabled];
    double v13 = 1.0;
    if (v12) {
      double v13 = 0.25;
    }
    [(PXProtoFeatureView *)self setAlpha:v13];
    double v14 = [(UIView *)v17 layer];
    [v14 setCornerRadius:4.0];

    [(UIView *)v17 setClipsToBounds:1];
    uint64_t v15 = [(PXProtoFeatureView *)self isSelected] ^ 1;
    double v16 = [(PXProtoFeatureView *)self _removeIconView];
    [v16 setHidden:v15];
  }
}

- (BOOL)wantsContentView
{
  return 1;
}

- (UIColor)preferredBackgroundColor
{
  if ([(PXProtoFeatureView *)self isDisabled])
  {
    uint64_t v3 = [MEMORY[0x1E4FB1618] colorWithWhite:0.0 alpha:0.200000003];
LABEL_12:
    double v7 = (void *)v3;
    goto LABEL_15;
  }
  BOOL v4 = [(PXProtoFeatureView *)self isSelected];
  double v5 = [(PXProtoFeatureView *)self feature];
  if (v4)
  {
    if (objc_opt_respondsToSelector())
    {
      id v6 = [(PXProtoFeatureView *)self feature];
      double v7 = [v6 featureSelectedTintColor];

      if (v7) {
        goto LABEL_15;
      }
    }
    else
    {
    }
    uint64_t v3 = [(PXProtoFeatureView *)self tintColor];
    goto LABEL_12;
  }
  if (objc_opt_respondsToSelector())
  {
    double v8 = [(PXProtoFeatureView *)self feature];
    double v7 = [v8 featureTintColor];

    if (v7) {
      goto LABEL_15;
    }
  }
  else
  {
  }
  double v9 = [(PXProtoFeatureView *)self tintColor];
  double v7 = [v9 colorWithAlphaComponent:0.200000003];

LABEL_15:
  return (UIColor *)v7;
}

- (void)prepareForReuse
{
}

void __37__PXProtoFeatureView_prepareForReuse__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setFeature:0];
  [v2 setSelected:0];
  [v2 setDisabled:0];
}

- (void)layoutSubviews
{
  v22.receiver = self;
  v22.super_class = (Class)PXProtoFeatureView;
  [(PXProtoFeatureView *)&v22 layoutSubviews];
  if ([(PXProtoFeatureView *)self wantsContentView])
  {
    [(PXProtoFeatureView *)self _contentViewFrame];
    double v4 = v3;
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;
    [(PXProtoFeatureView *)self bounds];
    double MinX = CGRectGetMinX(v23);
    v24.origin.x = v4;
    v24.origin.y = v6;
    v24.size.width = v8;
    v24.size.height = v10;
    double v12 = (MinX + CGRectGetMinX(v24)) * 0.5;
    v25.origin.x = v4;
    v25.origin.y = v6;
    v25.size.width = v8;
    v25.size.height = v10;
    double MidY = CGRectGetMidY(v25);
    double v14 = [(PXProtoFeatureView *)self contentView];
    [v14 frame];
    double v16 = v15;
    double v18 = v17;

    double v19 = [(PXProtoFeatureView *)self contentView];
    objc_msgSend(v19, "setFrame:", v4, v6, v8, v10);

    double v20 = [(PXProtoFeatureView *)self _removeIconView];
    objc_msgSend(v20, "setCenter:", v12, MidY);

    if (v8 != v16 || v10 != v18)
    {
      if ([(PXProtoFeatureView *)self shouldUpdateContentOnResize])
      {
        v21[0] = MEMORY[0x1E4F143A8];
        v21[1] = 3221225472;
        v21[2] = __36__PXProtoFeatureView_layoutSubviews__block_invoke;
        v21[3] = &unk_1E5DD2CD0;
        v21[4] = self;
        [(PXProtoFeatureView *)self performChanges:v21];
      }
    }
  }
}

uint64_t __36__PXProtoFeatureView_layoutSubviews__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidateContent];
}

- (CGSize)regularContentSize
{
  double v4 = [MEMORY[0x1E4F28B00] currentHandler];
  double v5 = (objc_class *)objc_opt_class();
  double v6 = NSStringFromClass(v5);
  [v4 handleFailureInMethod:a2, self, @"PXProtoFeatureView.m", 53, @"Method %s is a responsibility of subclass %@", "-[PXProtoFeatureView regularContentSize]", v6 object file lineNumber description];

  abort();
}

- (double)recommendedCompactContentHeight
{
  return 22.0;
}

- (CGSize)intrinsicContentSize
{
  if (![(PXProtoFeatureView *)self wantsContentView])
  {
    double v15 = [MEMORY[0x1E4F28B00] currentHandler];
    double v16 = (objc_class *)objc_opt_class();
    double v17 = NSStringFromClass(v16);
    [v15 handleFailureInMethod:a2, self, @"PXProtoFeatureView.m", 43, @"Method %s is a responsibility of subclass %@", "-[PXProtoFeatureView intrinsicContentSize]", v17 object file lineNumber description];

    abort();
  }
  if ([(PXProtoFeatureView *)self isSelected]) {
    [(PXProtoFeatureView *)self compactContentSize];
  }
  else {
    [(PXProtoFeatureView *)self regularContentSize];
  }
  double v6 = v4;
  double v7 = v5;
  [(PXProtoFeatureView *)self _contentInsets];
  double v10 = v6 + v8 + v9;
  double v13 = v7 + v11 + v12;
  double v14 = v10;
  result.height = v13;
  result.width = v14;
  return result;
}

- (BOOL)canBecomeFocused
{
  return 1;
}

@end
@interface _UICollectionViewListHeaderFooter
+ (Class)_contentViewClass;
- (BOOL)_automaticallyUpdatesBackgroundViewConfiguration;
- (BOOL)_automaticallyUpdatesContentViewConfiguration;
- (CGSize)_contentTargetSizeForTargetSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5 forUseWithSizeThatFits:(BOOL)a6;
- (CGSize)sizeThatFits:(CGSize)a3;
- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5;
- (UIEdgeInsets)_contentViewInsets;
- (UITableConstants)_constants;
- (UIView)contentView;
- (_UIBackgroundViewConfiguration)_backgroundViewConfiguration;
- (_UICollectionViewListHeaderFooter)initWithCoder:(id)a3;
- (_UICollectionViewListHeaderFooter)initWithFrame:(CGRect)a3;
- (_UIContentViewConfiguration)_contentViewConfiguration;
- (id)_backgroundViewConfigurationProvider;
- (id)_contentViewConfigurationProvider;
- (id)_defaultBackgroundViewConfigurationProvider;
- (int64_t)_styleFromLayoutAttributes:(id)a3;
- (unint64_t)_viewConfigurationState;
- (void)_applyBackgroundViewConfiguration:(id)a3;
- (void)_didUpdateFocusInContext:(id)a3;
- (void)_layoutContentView;
- (void)_layoutSystemBackgroundView;
- (void)_performConfigurationStateUpdate;
- (void)_populateArchivedSubviews:(id)a3;
- (void)_resetBackgroundColor;
- (void)_resetBackgroundViewConfiguration;
- (void)_setAutomaticallyUpdatesBackgroundViewConfiguration:(BOOL)a3;
- (void)_setAutomaticallyUpdatesContentViewConfiguration:(BOOL)a3;
- (void)_setBackgroundViewConfiguration:(id)a3;
- (void)_setBackgroundViewConfigurationProvider:(id)a3;
- (void)_setContentViewConfiguration:(id)a3;
- (void)_setContentViewConfigurationProvider:(id)a3;
- (void)_setLayoutAttributes:(id)a3;
- (void)_setNeedsConfigurationStateUpdate;
- (void)_updateBackgroundViewConfigurationForState:(unint64_t)a3;
- (void)_updateConstants;
- (void)_updateContentViewConfigurationForState:(unint64_t)a3;
- (void)_updateDefaultBackgroundAppearance;
- (void)encodeWithCoder:(id)a3;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)setBackgroundColor:(id)a3;
- (void)setContentView:(id)a3;
- (void)setSemanticContentAttribute:(int64_t)a3;
- (void)setUserInteractionEnabled:(BOOL)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation _UICollectionViewListHeaderFooter

+ (Class)_contentViewClass
{
  return (Class)objc_opt_class();
}

- (_UICollectionViewListHeaderFooter)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)_UICollectionViewListHeaderFooter;
  v3 = -[UICollectionReusableView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    id v4 = objc_alloc((Class)[(id)objc_opt_class() _contentViewClass]);
    [(UIView *)v3 bounds];
    v5 = objc_msgSend(v4, "initWithFrame:");
    [(_UICollectionViewListHeaderFooter *)v3 setContentView:v5];

    _UICollectionViewListHeaderFooterCommonInit(v3);
  }
  return v3;
}

- (_UICollectionViewListHeaderFooter)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_UICollectionViewListHeaderFooter;
  v5 = [(UICollectionReusableView *)&v11 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectForKey:@"UIContentView"];
    contentView = v5->_contentView;
    v5->_contentView = (UIView *)v6;

    if (v5->_contentView)
    {
      -[UIView addSubview:](v5, "addSubview:");
    }
    else
    {
      id v8 = objc_alloc((Class)[(id)objc_opt_class() _contentViewClass]);
      [(UIView *)v5 bounds];
      v9 = objc_msgSend(v8, "initWithFrame:");
      [(_UICollectionViewListHeaderFooter *)v5 setContentView:v9];
    }
    _UICollectionViewListHeaderFooterCommonInit(v5);
  }

  return v5;
}

- (void)_populateArchivedSubviews:(id)a3
{
  id v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)_UICollectionViewListHeaderFooter;
  [(UIView *)&v5 _populateArchivedSubviews:v4];
  if (self->_systemBackgroundView) {
    objc_msgSend(v4, "removeObject:");
  }
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)_UICollectionViewListHeaderFooter;
  [(UICollectionReusableView *)&v6 encodeWithCoder:v4];
  contentView = self->_contentView;
  if (contentView) {
    [v4 encodeObject:contentView forKey:@"UIContentView"];
  }
}

- (void)prepareForReuse
{
  v3.receiver = self;
  v3.super_class = (Class)_UICollectionViewListHeaderFooter;
  [(UICollectionReusableView *)&v3 prepareForReuse];
  [(UIView *)self _removeAllAnimations:1];
  [(_UICollectionViewListHeaderFooter *)self _setNeedsConfigurationStateUpdate];
}

- (void)_setLayoutAttributes:(id)a3
{
  int v4 = *((unsigned __int16 *)&self->_headerFooterFlags + 2);
  id v5 = a3;
  *((_WORD *)&self->_headerFooterFlags + 2) = *(_WORD *)(&self->_headerFooterFlags + 1) & 0xFFF8 | [(_UICollectionViewListHeaderFooter *)self _styleFromLayoutAttributes:v5] & 7;
  v7.receiver = self;
  v7.super_class = (Class)_UICollectionViewListHeaderFooter;
  [(UICollectionReusableView *)&v7 _setLayoutAttributes:v5];

  [(UIView *)self->_contentView bounds];
  if (CGRectEqualToRect(v8, *MEMORY[0x1E4F1DB28])) {
    [(_UICollectionViewListHeaderFooter *)self _layoutContentView];
  }
  if (((*((unsigned __int16 *)&self->_headerFooterFlags + 2) ^ v4) & 7) != 0
    || ([(_UICollectionViewListHeaderFooter *)self _backgroundViewConfigurationProvider], objc_super v6 = objc_claimAutoreleasedReturnValue(), v6, !v6))
  {
    [(_UICollectionViewListHeaderFooter *)self _updateDefaultBackgroundAppearance];
  }
}

- (int64_t)_styleFromLayoutAttributes:(id)a3
{
  objc_super v3 = -[UICollectionViewLayoutAttributes _existingListAttributes]((id *)a3);
  if (v3) {
    int64_t v4 = v3[2];
  }
  else {
    int64_t v4 = 0;
  }

  return v4;
}

- (void)setUserInteractionEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = [(UIView *)self isUserInteractionEnabled];
  v6.receiver = self;
  v6.super_class = (Class)_UICollectionViewListHeaderFooter;
  [(UIView *)&v6 setUserInteractionEnabled:v3];
  if (v5 != [(UIView *)self isUserInteractionEnabled]) {
    [(_UICollectionViewListHeaderFooter *)self _setNeedsConfigurationStateUpdate];
  }
}

- (void)_setContentViewConfiguration:(id)a3
{
  id v5 = a3;
  Class contentViewConfigurationClass = self->_contentViewConfigurationClass;
  if (v5)
  {
    if ((*(_WORD *)(&self->_headerFooterFlags + 1) & 0x100) != 0 && !self->_contentViewConfigurationProvider)
    {
      id v15 = v5;
      unint64_t v7 = [(_UICollectionViewListHeaderFooter *)self _viewConfigurationState];
      CGRect v8 = [(UIView *)self traitCollection];
      uint64_t v9 = [v15 updatedConfigurationForState:v7 traitCollection:v8];

      if (!v9)
      {
        v14 = [MEMORY[0x1E4F28B00] currentHandler];
        [v14 handleFailureInMethod:a2, self, @"_UICollectionViewListHeaderFooter.m", 143, @"Updated configuration was nil for configuration: %@", v15 object file lineNumber description];
      }
      id v5 = (id)v9;
    }
    id v16 = v5;
    if (contentViewConfigurationClass)
    {
      Class v10 = self->_contentViewConfigurationClass;
      uint64_t v11 = objc_opt_class();
      self->_Class contentViewConfigurationClass = (Class)objc_opt_class();
      if (v10 == (Class)v11)
      {
        [(UIView *)self->_contentView setConfiguration:v16];
        goto LABEL_14;
      }
    }
    else
    {
      self->_Class contentViewConfigurationClass = (Class)objc_opt_class();
    }
    v13 = [v16 createContentView];
    [(_UICollectionViewListHeaderFooter *)self setContentView:v13];

    goto LABEL_14;
  }
  self->_Class contentViewConfigurationClass = (Class)objc_opt_class();
  if (!contentViewConfigurationClass) {
    return;
  }
  id v12 = objc_alloc((Class)[(id)objc_opt_class() _contentViewClass]);
  [(UIView *)self bounds];
  id v16 = (id)objc_msgSend(v12, "initWithFrame:");
  -[_UICollectionViewListHeaderFooter setContentView:](self, "setContentView:");
LABEL_14:
}

- (_UIContentViewConfiguration)_contentViewConfiguration
{
  if (self->_contentViewConfigurationClass)
  {
    v2 = [(UIView *)self->_contentView configuration];
  }
  else
  {
    v2 = 0;
  }
  return (_UIContentViewConfiguration *)v2;
}

- (void)_setAutomaticallyUpdatesContentViewConfiguration:(BOOL)a3
{
  if (a3)
  {
    id contentViewConfigurationProvider = self->_contentViewConfigurationProvider;
    int64_t v4 = &self->_headerFooterFlags + 1;
    __int16 v5 = *((_WORD *)&self->_headerFooterFlags + 2);
    if ((contentViewConfigurationProvider == 0) != ((v5 & 0x100) == 0)) {
      return;
    }
    if (!contentViewConfigurationProvider)
    {
      *(_WORD *)int64_t v4 = v5 | 0x100;
      [(_UICollectionViewListHeaderFooter *)self _setNeedsConfigurationStateUpdate];
      return;
    }
  }
  else
  {
    int64_t v4 = &self->_headerFooterFlags + 1;
    __int16 v5 = *((_WORD *)&self->_headerFooterFlags + 2);
    if ((v5 & 0x100) == 0) {
      return;
    }
  }
  *(_WORD *)int64_t v4 = v5 & 0xFEFF;
}

- (BOOL)_automaticallyUpdatesContentViewConfiguration
{
  return HIBYTE(*((unsigned __int16 *)&self->_headerFooterFlags + 2)) & 1;
}

- (void)_setContentViewConfigurationProvider:(id)a3
{
  if (self->_contentViewConfigurationProvider != a3)
  {
    if (a3) {
      *((_WORD *)&self->_headerFooterFlags + 2) &= ~0x100u;
    }
    int64_t v4 = (void *)[a3 copy];
    id contentViewConfigurationProvider = self->_contentViewConfigurationProvider;
    self->_id contentViewConfigurationProvider = v4;

    [(_UICollectionViewListHeaderFooter *)self _setNeedsConfigurationStateUpdate];
  }
}

- (id)_contentViewConfigurationProvider
{
  v2 = _Block_copy(self->_contentViewConfigurationProvider);
  return v2;
}

- (void)_updateContentViewConfigurationForState:(unint64_t)a3
{
  id contentViewConfigurationProvider = (void (**)(id, unint64_t))self->_contentViewConfigurationProvider;
  if (contentViewConfigurationProvider)
  {
    uint64_t v5 = contentViewConfigurationProvider[2](contentViewConfigurationProvider, a3);
    id v9 = (id)v5;
    objc_super v6 = self;
LABEL_3:
    [(_UICollectionViewListHeaderFooter *)v6 _setContentViewConfiguration:v5];
    unint64_t v7 = v9;
    goto LABEL_4;
  }
  if ((*(_WORD *)(&self->_headerFooterFlags + 1) & 0x100) == 0) {
    return;
  }
  unint64_t v7 = [(_UICollectionViewListHeaderFooter *)self _contentViewConfiguration];
  if (v7)
  {
    CGRect v8 = v7;
    objc_super v6 = self;
    id v9 = v8;
    uint64_t v5 = (uint64_t)v8;
    goto LABEL_3;
  }
LABEL_4:
}

- (void)setContentView:(id)a3
{
  uint64_t v5 = (UIView *)a3;
  contentView = self->_contentView;
  if (contentView != v5)
  {
    unint64_t v7 = v5;
    [(UIView *)contentView removeFromSuperview];
    objc_storeStrong((id *)&self->_contentView, a3);
    [(UIView *)v7 setSemanticContentAttribute:[(UIView *)self semanticContentAttribute]];
    uint64_t v5 = v7;
    if (v7)
    {
      [(UIView *)self addSubview:self->_contentView];
      uint64_t v5 = v7;
    }
  }
}

- (void)_setBackgroundViewConfiguration:(id)a3
{
  id v4 = a3;
  unsigned int v5 = *((unsigned __int16 *)&self->_headerFooterFlags + 2);
  int v6 = (v5 >> 6) & 1;
  id v8 = v4;
  if (v4) {
    int v6 = 1;
  }
  if (v6) {
    __int16 v7 = 64;
  }
  else {
    __int16 v7 = 0;
  }
  *((_WORD *)&self->_headerFooterFlags + 2) = v7 | v5 & 0xFFBF;
  if ((v5 & 0x20) == 0 && v6) {
    [(_UICollectionViewListHeaderFooter *)self _setBackgroundViewConfigurationProvider:0];
  }
  [(_UICollectionViewListHeaderFooter *)self _applyBackgroundViewConfiguration:v8];
}

- (void)_applyBackgroundViewConfiguration:(id)a3
{
  unsigned int v5 = (_UISystemBackgroundView *)a3;
  systemBackgroundView = self->_systemBackgroundView;
  if (v5)
  {
    __int16 v7 = v5;
    if ((*(_WORD *)(&self->_headerFooterFlags + 1) & 0x80) != 0 && !self->_backgroundViewConfigurationProvider)
    {
      id v15 = v5;
      unint64_t v8 = [(_UICollectionViewListHeaderFooter *)self _viewConfigurationState];
      id v9 = [(UIView *)self traitCollection];
      uint64_t v10 = [(_UISystemBackgroundView *)v15 updatedConfigurationForState:v8 traitCollection:v9];

      if (!v10)
      {
        v14 = [MEMORY[0x1E4F28B00] currentHandler];
        [v14 handleFailureInMethod:a2, self, @"_UICollectionViewListHeaderFooter.m", 236, @"Updated configuration was nil for configuration: %@", v15 object file lineNumber description];
      }
      __int16 v7 = (_UISystemBackgroundView *)v10;
    }
    id v16 = v7;
    if (systemBackgroundView)
    {
      [(_UISystemBackgroundView *)self->_systemBackgroundView setConfiguration:v7];
    }
    else
    {
      [(_UICollectionViewListHeaderFooter *)self _resetBackgroundColor];
      id v12 = [[_UISystemBackgroundView alloc] initWithConfiguration:v16];
      v13 = self->_systemBackgroundView;
      self->_systemBackgroundView = v12;

      [(UIView *)self insertSubview:self->_systemBackgroundView atIndex:0];
    }
    [(UIView *)self setNeedsLayout];
    uint64_t v11 = v16;
  }
  else
  {
    if (!systemBackgroundView) {
      return;
    }
    [(UIView *)self->_systemBackgroundView removeFromSuperview];
    uint64_t v11 = self->_systemBackgroundView;
    self->_systemBackgroundView = 0;
  }
}

- (_UIBackgroundViewConfiguration)_backgroundViewConfiguration
{
  return (_UIBackgroundViewConfiguration *)[(_UISystemBackgroundView *)self->_systemBackgroundView configuration];
}

- (void)_setAutomaticallyUpdatesBackgroundViewConfiguration:(BOOL)a3
{
  if (a3)
  {
    id backgroundViewConfigurationProvider = self->_backgroundViewConfigurationProvider;
    id v4 = &self->_headerFooterFlags + 1;
    __int16 v5 = *((_WORD *)&self->_headerFooterFlags + 2);
    if ((backgroundViewConfigurationProvider == 0) != ((v5 & 0x80) == 0)) {
      return;
    }
    if (!backgroundViewConfigurationProvider)
    {
      *(_WORD *)id v4 = v5 | 0x80;
      [(_UICollectionViewListHeaderFooter *)self _setNeedsConfigurationStateUpdate];
      return;
    }
  }
  else
  {
    id v4 = &self->_headerFooterFlags + 1;
    __int16 v5 = *((_WORD *)&self->_headerFooterFlags + 2);
    if ((v5 & 0x80) == 0) {
      return;
    }
  }
  *(_WORD *)id v4 = v5 & 0xFF7F;
}

- (BOOL)_automaticallyUpdatesBackgroundViewConfiguration
{
  return (*((unsigned __int16 *)&self->_headerFooterFlags + 2) >> 7) & 1;
}

- (void)_setBackgroundViewConfigurationProvider:(id)a3
{
  unsigned int v3 = *((unsigned __int16 *)&self->_headerFooterFlags + 2);
  int v4 = (v3 >> 5) & 1;
  if (a3) {
    int v4 = 1;
  }
  if (v4) {
    __int16 v5 = 32;
  }
  else {
    __int16 v5 = 0;
  }
  __int16 v6 = v5 | v3 & 0xFFDF;
  *((_WORD *)&self->_headerFooterFlags + 2) = v6;
  if (self->_backgroundViewConfigurationProvider != a3)
  {
    if (a3) {
      *((_WORD *)&self->_headerFooterFlags + 2) = v6 & 0xFF7F;
    }
    id v8 = a3;
    id v9 = (void *)[v8 copy];
    id backgroundViewConfigurationProvider = self->_backgroundViewConfigurationProvider;
    self->_id backgroundViewConfigurationProvider = v9;

    [(_UICollectionViewListHeaderFooter *)self _setNeedsConfigurationStateUpdate];
  }
}

- (id)_backgroundViewConfigurationProvider
{
  v2 = _Block_copy(self->_backgroundViewConfigurationProvider);
  return v2;
}

- (id)_defaultBackgroundViewConfigurationProvider
{
  uint64_t v2 = *(_WORD *)(&self->_headerFooterFlags + 1) & 7;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __80___UICollectionViewListHeaderFooter__defaultBackgroundViewConfigurationProvider__block_invoke;
  aBlock[3] = &__block_descriptor_40_e40____UIBackgroundViewConfiguration_16__0Q8l;
  aBlock[4] = v2;
  unsigned int v3 = _Block_copy(aBlock);
  return v3;
}

- (void)_updateDefaultBackgroundAppearance
{
  __int16 v2 = *((_WORD *)&self->_headerFooterFlags + 2);
  if ((v2 & 0x70) == 0)
  {
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __71___UICollectionViewListHeaderFooter__updateDefaultBackgroundAppearance__block_invoke;
    v4[3] = &unk_1E52D9F70;
    v4[4] = self;
    +[UIView _performSystemAppearanceModifications:v4];
    *((_WORD *)&self->_headerFooterFlags + 2) = *(_WORD *)(&self->_headerFooterFlags + 1) & 0xFF5F | v2 & 0x80;
  }
}

- (void)_resetBackgroundColor
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __58___UICollectionViewListHeaderFooter__resetBackgroundColor__block_invoke;
  v2[3] = &unk_1E52D9F70;
  v2[4] = self;
  +[UIView _performSystemAppearanceModifications:v2];
}

- (void)_resetBackgroundViewConfiguration
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __70___UICollectionViewListHeaderFooter__resetBackgroundViewConfiguration__block_invoke;
  v2[3] = &unk_1E52D9F70;
  v2[4] = self;
  +[UIView _performSystemAppearanceModifications:v2];
}

- (void)_updateBackgroundViewConfigurationForState:(unint64_t)a3
{
  id backgroundViewConfigurationProvider = (void (**)(id, unint64_t))self->_backgroundViewConfigurationProvider;
  if (backgroundViewConfigurationProvider)
  {
    uint64_t v5 = backgroundViewConfigurationProvider[2](backgroundViewConfigurationProvider, a3);
    id v9 = (id)v5;
    __int16 v6 = self;
LABEL_3:
    [(_UICollectionViewListHeaderFooter *)v6 _applyBackgroundViewConfiguration:v5];
    __int16 v7 = v9;
    goto LABEL_4;
  }
  if ((*(_WORD *)(&self->_headerFooterFlags + 1) & 0x80) == 0) {
    return;
  }
  __int16 v7 = [(_UICollectionViewListHeaderFooter *)self _backgroundViewConfiguration];
  if (v7)
  {
    id v8 = v7;
    __int16 v6 = self;
    id v9 = v8;
    uint64_t v5 = (uint64_t)v8;
    goto LABEL_3;
  }
LABEL_4:
}

- (unint64_t)_viewConfigurationState
{
  if ([(UIView *)self isUserInteractionEnabled]) {
    unint64_t v3 = 0;
  }
  else {
    unint64_t v3 = 2;
  }
  if ([(UIView *)self isFocused]) {
    return v3 | 8;
  }
  else {
    return v3;
  }
}

- (void)_setNeedsConfigurationStateUpdate
{
  *((_WORD *)&self->_headerFooterFlags + 2) |= 8u;
  if (+[UIView _isInAnimationBlockWithAnimationsEnabled])
  {
    [(_UICollectionViewListHeaderFooter *)self _performConfigurationStateUpdate];
  }
  else
  {
    [(UIView *)self setNeedsLayout];
  }
}

- (void)_performConfigurationStateUpdate
{
  __int16 v2 = *((_WORD *)&self->_headerFooterFlags + 2);
  if ((v2 & 8) != 0)
  {
    *((_WORD *)&self->_headerFooterFlags + 2) = v2 & 0xFFF7;
    int v4 = (void *)_UISetCurrentFallbackEnvironment(self);
    unint64_t v5 = [(_UICollectionViewListHeaderFooter *)self _viewConfigurationState];
    [(_UICollectionViewListHeaderFooter *)self _updateBackgroundViewConfigurationForState:v5];
    [(_UICollectionViewListHeaderFooter *)self _updateContentViewConfigurationForState:v5];
    [(_UICollectionViewListHeaderFooter *)self _updateViewConfigurationsWithState:v5];
    if (+[UIView _isInAnimationBlockWithAnimationsEnabled])
    {
      [(_UICollectionViewListHeaderFooter *)self _layoutSystemBackgroundView];
    }
    _UIRestorePreviousFallbackEnvironment(v4);
  }
}

- (void)_layoutSystemBackgroundView
{
  systemBackgroundView = self->_systemBackgroundView;
  if (systemBackgroundView)
  {
    [(_UISystemBackgroundView *)systemBackgroundView frameInContainerView:self];
    -[_UISystemBackgroundView setFrame:](self->_systemBackgroundView, "setFrame:");
    if (+[UIView _isInAnimationBlockWithAnimationsEnabled])
    {
      int v4 = self->_systemBackgroundView;
      [(UIView *)v4 layoutIfNeeded];
    }
  }
}

- (void)setBackgroundColor:(id)a3
{
  id v4 = a3;
  if (v4) {
    [(_UICollectionViewListHeaderFooter *)self _resetBackgroundViewConfiguration];
  }
  unsigned int v5 = *((unsigned __int16 *)&self->_headerFooterFlags + 2);
  int v6 = (v5 >> 4) & 1;
  if (v4) {
    int v6 = 1;
  }
  if (v6) {
    __int16 v7 = 16;
  }
  else {
    __int16 v7 = 0;
  }
  *((_WORD *)&self->_headerFooterFlags + 2) = v7 | v5 & 0xFFEF;
  v8.receiver = self;
  v8.super_class = (Class)_UICollectionViewListHeaderFooter;
  [(UIView *)&v8 setBackgroundColor:v4];
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)_UICollectionViewListHeaderFooter;
  [(UIView *)&v3 layoutSubviews];
  [(_UICollectionViewListHeaderFooter *)self _performConfigurationStateUpdate];
  [(_UICollectionViewListHeaderFooter *)self _layoutSystemBackgroundView];
  [(_UICollectionViewListHeaderFooter *)self _layoutContentView];
}

- (void)_layoutContentView
{
  if ([(UIView *)self->_contentView translatesAutoresizingMaskIntoConstraints])
  {
    [(UIView *)self bounds];
    double v4 = v3;
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;
    [(_UICollectionViewListHeaderFooter *)self _contentViewInsets];
    contentView = self->_contentView;
    -[UIView setFrame:](contentView, "setFrame:", v4 + v12, v6 + v11, v8 - (v12 + v14), v10 - (v11 + v13));
  }
}

- (void)traitCollectionDidChange:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)_UICollectionViewListHeaderFooter;
  [(UIView *)&v4 traitCollectionDidChange:a3];
  [(_UICollectionViewListHeaderFooter *)self _updateConstants];
  [(_UICollectionViewListHeaderFooter *)self _setNeedsConfigurationStateUpdate];
}

- (void)_updateConstants
{
  double v3 = [(UIView *)self traitCollection];
  _UITableConstantsForTraitCollection(v3);
  obj = (UITableConstants *)objc_claimAutoreleasedReturnValue();

  objc_super v4 = obj;
  if (obj != self->_constants)
  {
    objc_storeStrong((id *)&self->_constants, obj);
    [(_UICollectionViewListHeaderFooter *)self _updateDefaultBackgroundAppearance];
    objc_super v4 = obj;
  }
}

- (void)setSemanticContentAttribute:(int64_t)a3
{
  v6.receiver = self;
  v6.super_class = (Class)_UICollectionViewListHeaderFooter;
  -[UIView setSemanticContentAttribute:](&v6, sel_setSemanticContentAttribute_);
  double v5 = [(_UICollectionViewListHeaderFooter *)self contentView];
  [v5 setSemanticContentAttribute:a3];
}

- (CGSize)_contentTargetSizeForTargetSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5 forUseWithSizeThatFits:(BOOL)a6
{
  double height = a3.height;
  double width = a3.width;
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  [(_UICollectionViewListHeaderFooter *)self _contentViewInsets];
  double v14 = v13;
  double v16 = v15;
  double v17 = width - (v11 + v12);
  double v25 = height;
  double v18 = height - (v13 + v15);
  if (v17 < 0.0)
  {
    double v19 = v11;
    double v17 = 0.0;
    if (a4 >= 1000.0)
    {
      double v20 = v12;
      v21 = *(NSObject **)(__UILogGetCategoryCachedImpl("CollectionView", &_MergedGlobals_7_8) + 8);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134218754;
        double v28 = v19;
        __int16 v29 = 2048;
        double v30 = v20;
        __int16 v31 = 2048;
        double v32 = width;
        __int16 v33 = 2112;
        v34 = self;
        _os_log_impl(&dword_1853B0000, v21, OS_LOG_TYPE_ERROR, "The _UICollectionViewListHeaderFooter's content view insets (left: %g, right: %g) exceed the _UICollectionViewListHeaderFooter's target width of %g with required fitting priority. Header/footer: %@", buf, 0x2Au);
      }
    }
  }
  if (v18 < 0.0)
  {
    double v18 = 0.0;
    if (a5 >= 1000.0)
    {
      v22 = *(NSObject **)(__UILogGetCategoryCachedImpl("CollectionView", &qword_1EB25D5B0) + 8);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134218754;
        double v28 = v14;
        __int16 v29 = 2048;
        double v30 = v16;
        __int16 v31 = 2048;
        double v32 = v25;
        __int16 v33 = 2112;
        v34 = self;
        _os_log_impl(&dword_1853B0000, v22, OS_LOG_TYPE_ERROR, "The _UICollectionViewListHeaderFooter's content view insets (top: %g, bottom: %g) exceed the _UICollectionViewListHeaderFooter's target height of %g with required fitting priority. Header/footer: %@", buf, 0x2Au);
      }
    }
  }
  double v23 = 1.79769313e308;
  if (a5 < 1000.0 && a6) {
    double v24 = 1.79769313e308;
  }
  else {
    double v24 = v18;
  }
  if (a4 >= 1000.0 || !a6) {
    double v23 = v17;
  }
  result.double height = v24;
  result.double width = v23;
  return result;
}

- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5
{
  double height = a3.height;
  double width = a3.width;
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  [(_UICollectionViewListHeaderFooter *)self _performConfigurationStateUpdate];
  [(_UICollectionViewListHeaderFooter *)self _contentViewInsets];
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  [(_UICollectionViewListHeaderFooter *)self _layoutContentView];
  if (!self->_contentViewConfigurationClass
    || ![(UIView *)self->_contentView translatesAutoresizingMaskIntoConstraints])
  {
    double v28 = self;
    if ([(UIView *)v28 _wantsAutolayout]) {
      int v29 = 1;
    }
    else {
      int v29 = [(id)objc_opt_class() requiresConstraintBasedLayout];
    }
    if ([(UIView *)v28->_contentView _wantsAutolayout]
      || [(id)objc_opt_class() requiresConstraintBasedLayout])
    {
      if (!v29
        || (double v32 = v28, ![(UIView *)v28 needsUpdateConstraints])
        && (double v32 = v28,
            [(UIView *)v28->_contentView translatesAutoresizingMaskIntoConstraints]))
      {
        int has_internal_diagnostics = os_variant_has_internal_diagnostics();
        BOOL v34 = [(UIView *)v28->_contentView translatesAutoresizingMaskIntoConstraints];
        if (has_internal_diagnostics)
        {
          if (!v34)
          {
            v56 = __UIFaultDebugAssertLog();
            if (os_log_type_enabled(v56, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 138412290;
              v63 = v28;
              _os_log_fault_impl(&dword_1853B0000, v56, OS_LOG_TYPE_FAULT, "contentView of _UICollectionViewListHeaderFooter has translatesAutoresizingMaskIntoConstraints false and is missing constraints to the header/footer, which will cause substandard performance in header/footer autosizing. Please leave the contentView's translatesAutoresizingMaskIntoConstraints true or else provide constraints between the contentView and the header/footer. %@", buf, 0xCu);
            }
          }
        }
        else if (!v34)
        {
          v57 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &qword_1EB25D5B8) + 8);
          if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v63 = v28;
            _os_log_impl(&dword_1853B0000, v57, OS_LOG_TYPE_ERROR, "contentView of _UICollectionViewListHeaderFooter has translatesAutoresizingMaskIntoConstraints false and is missing constraints to the header/footer, which will cause substandard performance in header/footer autosizing. Please leave the contentView's translatesAutoresizingMaskIntoConstraints true or else provide constraints between the contentView and the header/footer. %@", buf, 0xCu);
          }
        }
        if ([(UIView *)v28->_contentView translatesAutoresizingMaskIntoConstraints])
        {
          [(UIView *)v28->_contentView _setHostsLayoutEngine:1];
        }
        double v32 = v28->_contentView;
      }
    }
    else
    {
      double v32 = v28;
      if (!v29)
      {
        v60.receiver = v28;
        v60.super_class = (Class)_UICollectionViewListHeaderFooter;
        *(float *)&double v30 = a4;
        *(float *)&double v31 = a5;
        -[UIView systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:](&v60, sel_systemLayoutSizeFittingSize_withHorizontalFittingPriority_verticalFittingPriority_, width, height, v30, v31);
        double v26 = v49;
        double v27 = v50;
        double v32 = v28;
LABEL_54:

        goto LABEL_55;
      }
    }
    [(UIView *)v32 _setWantsAutolayout];
    buf[0] = 1;
    if (v13 == 0.0 && v11 == 0.0 && v17 == 0.0 && v15 == 0.0
      || v32 != (_UICollectionViewListHeaderFooter *)v28->_contentView)
    {
      if (a5 == 50.0 && height == 0.0) {
        v38 = buf;
      }
      else {
        v38 = 0;
      }
      *(float *)&double v35 = a4;
      *(float *)&double v36 = a5;
      -[UIView _systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:hasIntentionallyCollapsedHeight:](v32, "_systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:hasIntentionallyCollapsedHeight:", v38, width, height, v35, v36);
      double v26 = v39;
      double v27 = v40;
    }
    else
    {
      *(float *)&double v35 = a4;
      *(float *)&double v36 = a5;
      -[_UICollectionViewListHeaderFooter _contentTargetSizeForTargetSize:withHorizontalFittingPriority:verticalFittingPriority:forUseWithSizeThatFits:](v28, "_contentTargetSizeForTargetSize:withHorizontalFittingPriority:verticalFittingPriority:forUseWithSizeThatFits:", 0, width, height, v35, v36);
      if (v44 == 0.0 && a5 == 50.0) {
        v46 = buf;
      }
      else {
        v46 = 0;
      }
      -[UIView _systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:hasIntentionallyCollapsedHeight:](v32, "_systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:hasIntentionallyCollapsedHeight:", v46);
      double v26 = v47 - (-v17 - v13);
      double v27 = v48 - (-v15 - v11);
    }
    if (v27 == 0.0 && buf[0] == 0)
    {
      -[_UICollectionViewListHeaderFooter sizeThatFits:](v28, "sizeThatFits:", width, height);
      double v26 = v42;
      double v27 = v43;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __119___UICollectionViewListHeaderFooter_systemLayoutSizeFittingSize_withHorizontalFittingPriority_verticalFittingPriority___block_invoke;
      block[3] = &unk_1E52D9F70;
      block[4] = v28;
      if (qword_1EB25D5C0 != -1) {
        dispatch_once(&qword_1EB25D5C0, block);
      }
    }
    goto LABEL_54;
  }
  double v58 = v13;
  double v59 = v11;
  double v20 = v15;
  *(float *)&double v18 = a4;
  *(float *)&double v19 = a5;
  -[_UICollectionViewListHeaderFooter _contentTargetSizeForTargetSize:withHorizontalFittingPriority:verticalFittingPriority:forUseWithSizeThatFits:](self, "_contentTargetSizeForTargetSize:withHorizontalFittingPriority:verticalFittingPriority:forUseWithSizeThatFits:", 1, width, height, v18, v19);
  -[UIView systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:](self->_contentView, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:");
  double v22 = v21;
  double v24 = v23;
  double v25 = self->_contentView;
  if (a4 != 1000.0 && v22 > 2777777.0 || a5 != 1000.0 && v24 > 2777777.0)
  {
    v53 = [MEMORY[0x1E4F28B00] currentHandler];
    v54 = objc_msgSend(NSString, "stringWithUTF8String:", "void _UIContentViewAssertValidFittingSize(UIView * _Nonnull __strong, CGSize, UILayoutPriority, UILayoutPriority)");
    v65.double width = v22;
    v65.double height = v24;
    v55 = NSStringFromCGSize(v65);
    [v53 handleFailureInFunction:v54, @"_UIContentViewShared.h", 66, @"Content view returned an invalid size %@ from -systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority: which is not allowed. If you have implemented a custom content view, you need to add constraints inside it so that its size is not ambiguous, or you need to manually compute and return a valid size. Content view: %@", v55, v25 file lineNumber description];
  }
  if (a4 >= 1000.0) {
    double v26 = width;
  }
  else {
    double v26 = v22 - (-v17 - v58);
  }
  if (a5 >= 1000.0) {
    double v27 = height;
  }
  else {
    double v27 = v24 - (-v20 - v59);
  }
LABEL_55:
  double v51 = v26;
  double v52 = v27;
  result.double height = v52;
  result.double width = v51;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  [(_UICollectionViewListHeaderFooter *)self _performConfigurationStateUpdate];
  if (self->_contentViewConfigurationClass)
  {
    [(_UICollectionViewListHeaderFooter *)self _layoutContentView];
    if (width == 0.0) {
      *(float *)&double v6 = 50.0;
    }
    else {
      *(float *)&double v6 = 1000.0;
    }
    if (height == 0.0) {
      *(float *)&double v7 = 50.0;
    }
    else {
      *(float *)&double v7 = 1000.0;
    }
    -[_UICollectionViewListHeaderFooter _contentTargetSizeForTargetSize:withHorizontalFittingPriority:verticalFittingPriority:forUseWithSizeThatFits:](self, "_contentTargetSizeForTargetSize:withHorizontalFittingPriority:verticalFittingPriority:forUseWithSizeThatFits:", 1, width, height, v6, v7);
    -[UIView systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:](self->_contentView, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:");
    double v9 = v8;
    double v11 = v10;
    [(_UICollectionViewListHeaderFooter *)self _contentViewInsets];
    double width = v9 - (-v13 - v14);
    double height = v11 - (-v12 - v15);
  }
  double v16 = width;
  double v17 = height;
  result.double height = v17;
  result.double width = v16;
  return result;
}

- (void)_didUpdateFocusInContext:(id)a3
{
  id v4 = a3;
  double v5 = [v4 previouslyFocusedView];
  if (v5 == self)
  {

LABEL_5:
    [(_UICollectionViewListHeaderFooter *)self _setNeedsConfigurationStateUpdate];
    goto LABEL_6;
  }
  double v6 = v5;
  double v7 = [v4 nextFocusedView];

  if (v7 == self) {
    goto LABEL_5;
  }
LABEL_6:
  v8.receiver = self;
  v8.super_class = (Class)_UICollectionViewListHeaderFooter;
  [(UIView *)&v8 _didUpdateFocusInContext:v4];
}

- (UIView)contentView
{
  return self->_contentView;
}

- (UIEdgeInsets)_contentViewInsets
{
  double top = self->_contentViewInsets.top;
  double left = self->_contentViewInsets.left;
  double bottom = self->_contentViewInsets.bottom;
  double right = self->_contentViewInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (UITableConstants)_constants
{
  return self->_constants;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_constants, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong(&self->_backgroundViewConfigurationProvider, 0);
  objc_storeStrong((id *)&self->_systemBackgroundView, 0);
  objc_storeStrong(&self->_contentViewConfigurationProvider, 0);
}

@end
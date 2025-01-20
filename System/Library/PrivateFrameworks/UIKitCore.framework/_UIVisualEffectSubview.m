@interface _UIVisualEffectSubview
- (BOOL)_shouldAnimatePropertyWithKey:(id)a3;
- (BOOL)disableGroupFiltering;
- (NSArray)filters;
- (NSArray)viewEffects;
- (_UIVisualEffectSubview)initWithFrame:(CGRect)a3;
- (_UIVisualEffectViewBackdropCaptureGroup)primaryCaptureGroup;
- (_UIVisualEffectViewParticipating)containedView;
- (_UIVisualEffectViewSubviewMonitoring)subviewMonitor;
- (id)_initialValueForLayer:(id)a3 keyPath:(id)a4 usePresentationValue:(BOOL)a5;
- (void)_monitoredView:(id)a3 willMoveFromSuperview:(id)a4 toSuperview:(id)a5;
- (void)applyIdentityFilterEffects;
- (void)applyIdentityViewEffects;
- (void)applyRequestedFilterEffects;
- (void)applyRequestedViewEffects;
- (void)layoutSubviews;
- (void)setContainedView:(id)a3;
- (void)setFilters:(id)a3;
- (void)setPrimaryCaptureGroup:(id)a3;
- (void)setSubviewMonitor:(id)a3;
- (void)setViewEffects:(id)a3;
- (void)willMoveToWindow:(id)a3;
@end

@implementation _UIVisualEffectSubview

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)_UIVisualEffectSubview;
  [(UIView *)&v3 layoutSubviews];
  if (self->_containedView)
  {
    [(UIView *)self bounds];
    -[_UIVisualEffectViewParticipating setFrame:](self->_containedView, "setFrame:");
  }
}

- (BOOL)_shouldAnimatePropertyWithKey:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)_UIVisualEffectSubview;
  if ([(UIView *)&v7 _shouldAnimatePropertyWithKey:v4]) {
    char ShouldAnimateKeyInternal = 1;
  }
  else {
    char ShouldAnimateKeyInternal = _UIVisualEffectSubviewShouldAnimateKeyInternal(self->_viewEffects, v4);
  }

  return ShouldAnimateKeyInternal;
}

- (_UIVisualEffectSubview)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)_UIVisualEffectSubview;
  objc_super v3 = -[UIView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  id v4 = v3;
  if (v3) {
    [(UIView *)v3 setUserInteractionEnabled:0];
  }
  return v4;
}

- (_UIVisualEffectViewParticipating)containedView
{
  return self->_containedView;
}

- (void)applyRequestedViewEffects
{
}

- (void)setViewEffects:(id)a3
{
  _UIVisualEffectSubviewSetViewEffects(self, self->_viewEffects, a3);
  id v4 = (NSArray *)objc_claimAutoreleasedReturnValue();
  viewEffects = self->_viewEffects;
  self->_viewEffects = v4;
}

- (void)setFilters:(id)a3
{
  _UIVisualEffectSubviewSetFilters(self, self->_filters, a3);
  id v4 = (NSArray *)objc_claimAutoreleasedReturnValue();
  filters = self->_filters;
  self->_filters = v4;
}

- (void)applyRequestedFilterEffects
{
}

- (NSArray)filters
{
  return self->_filters;
}

- (void)willMoveToWindow:(id)a3
{
  p_subviewMonitor = &self->_subviewMonitor;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_subviewMonitor);
  [WeakRetained _view:self willMoveToWindow:v5];
}

- (void)setSubviewMonitor:(id)a3
{
}

- (void)setPrimaryCaptureGroup:(id)a3
{
}

- (void)setContainedView:(id)a3
{
  id v5 = (_UIVisualEffectViewParticipating *)a3;
  containedView = self->_containedView;
  if (containedView != v5)
  {
    objc_super v7 = v5;
    [(_UIVisualEffectViewParticipating *)containedView removeFromSuperview];
    objc_storeStrong((id *)&self->_containedView, a3);
    [(UIView *)self addSubview:self->_containedView];
    [(UIView *)self setNeedsLayout];
    id v5 = v7;
  }
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_subviewMonitor);
  objc_storeStrong((id *)&self->_viewEffects, 0);
  objc_storeStrong((id *)&self->_containedView, 0);
  objc_storeStrong((id *)&self->_primaryCaptureGroup, 0);
  objc_storeStrong((id *)&self->_filters, 0);
}

- (void)applyIdentityViewEffects
{
}

- (void)applyIdentityFilterEffects
{
}

- (void)_monitoredView:(id)a3 willMoveFromSuperview:(id)a4 toSuperview:(id)a5
{
  id v10 = a3;
  id v8 = a4;
  if ([a5 isDescendantOfView:self]
    && ([v8 isDescendantOfView:self] & 1) == 0)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_subviewMonitor);
    [WeakRetained _view:self willGainDescendent:v10];
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_subviewMonitor);
    [WeakRetained _view:self willLoseDescendent:v10];
  }
}

- (BOOL)disableGroupFiltering
{
  return 0;
}

- (id)_initialValueForLayer:(id)a3 keyPath:(id)a4 usePresentationValue:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a4;
  v11.receiver = self;
  v11.super_class = (Class)_UIVisualEffectSubview;
  v9 = [(UIView *)&v11 _initialValueForLayer:a3 keyPath:v8 usePresentationValue:v5];
  if (!v9)
  {
    if ([v8 hasPrefix:@"filters."])
    {
      v9 = _UIVisualEffectSubviewFilterIdentityValueForKeypath(self->_filters, v8);
    }
    else
    {
      v9 = 0;
    }
  }

  return v9;
}

- (_UIVisualEffectViewBackdropCaptureGroup)primaryCaptureGroup
{
  return self->_primaryCaptureGroup;
}

- (NSArray)viewEffects
{
  return self->_viewEffects;
}

- (_UIVisualEffectViewSubviewMonitoring)subviewMonitor
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_subviewMonitor);
  return (_UIVisualEffectViewSubviewMonitoring *)WeakRetained;
}

@end
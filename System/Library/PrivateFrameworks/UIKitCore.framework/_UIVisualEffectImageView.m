@interface _UIVisualEffectImageView
- (BOOL)_shouldAnimatePropertyWithKey:(id)a3;
- (BOOL)disableGroupFiltering;
- (NSArray)filters;
- (NSArray)viewEffects;
- (_UIVisualEffectViewBackdropCaptureGroup)primaryCaptureGroup;
- (_UIVisualEffectViewParticipating)containedView;
- (_UIVisualEffectViewSubviewMonitoring)subviewMonitor;
- (id)_initialValueForLayer:(id)a3 keyPath:(id)a4 usePresentationValue:(BOOL)a5;
- (void)applyIdentityFilterEffects;
- (void)applyIdentityViewEffects;
- (void)applyRequestedFilterEffects;
- (void)applyRequestedViewEffects;
- (void)setContainedView:(id)a3;
- (void)setFilters:(id)a3;
- (void)setPrimaryCaptureGroup:(id)a3;
- (void)setViewEffects:(id)a3;
@end

@implementation _UIVisualEffectImageView

- (BOOL)_shouldAnimatePropertyWithKey:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)_UIVisualEffectImageView;
  if ([(UIImageView *)&v7 _shouldAnimatePropertyWithKey:v4]) {
    char ShouldAnimateKeyInternal = 1;
  }
  else {
    char ShouldAnimateKeyInternal = _UIVisualEffectSubviewShouldAnimateKeyInternal(self->_viewEffects, v4);
  }

  return ShouldAnimateKeyInternal;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_filters, 0);
  objc_storeStrong((id *)&self->_viewEffects, 0);
  objc_storeStrong((id *)&self->_primaryCaptureGroup, 0);
}

- (_UIVisualEffectViewSubviewMonitoring)subviewMonitor
{
  return 0;
}

- (BOOL)disableGroupFiltering
{
  return 0;
}

- (_UIVisualEffectViewParticipating)containedView
{
  return 0;
}

- (void)setContainedView:(id)a3
{
  if (a3)
  {
    id v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2, self, @"_UIVisualEffectSubview.m", 147, @"Invalid parameter not satisfying: %@", @"containedView == nil" object file lineNumber description];
  }
}

- (void)setViewEffects:(id)a3
{
  _UIVisualEffectSubviewSetViewEffects(self, self->_viewEffects, a3);
  id v4 = (NSArray *)objc_claimAutoreleasedReturnValue();
  viewEffects = self->_viewEffects;
  self->_viewEffects = v4;
}

- (void)applyRequestedViewEffects
{
}

- (void)applyIdentityViewEffects
{
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

- (void)applyIdentityFilterEffects
{
}

- (id)_initialValueForLayer:(id)a3 keyPath:(id)a4 usePresentationValue:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a4;
  v11.receiver = self;
  v11.super_class = (Class)_UIVisualEffectImageView;
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

- (void)setPrimaryCaptureGroup:(id)a3
{
}

- (NSArray)viewEffects
{
  return self->_viewEffects;
}

- (NSArray)filters
{
  return self->_filters;
}

@end
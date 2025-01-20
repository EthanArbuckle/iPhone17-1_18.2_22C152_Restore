@interface _UIVisualEffectBackdropView
+ (Class)layerClass;
- (BOOL)_shouldAnimatePropertyWithKey:(id)a3;
- (BOOL)isTransparentFocusItem;
- (_UIVisualEffectViewBackdropCaptureGroup)captureGroup;
- (int64_t)renderMode;
- (void)_applyScaleHintAsRequested:(BOOL)a3;
- (void)applyIdentityFilterEffects;
- (void)applyRequestedFilterEffects;
- (void)removeFromCurrentCaptureGroup;
- (void)setCaptureGroup:(id)a3;
- (void)setRenderMode:(int64_t)a3;
- (void)willMoveToWindow:(id)a3;
@end

@implementation _UIVisualEffectBackdropView

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (BOOL)_shouldAnimatePropertyWithKey:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)_UIVisualEffectBackdropView;
  if ([(_UIVisualEffectSubview *)&v7 _shouldAnimatePropertyWithKey:v4]) {
    char v5 = 1;
  }
  else {
    char v5 = [@"scale" isEqualToString:v4];
  }

  return v5;
}

- (void)setCaptureGroup:(id)a3
{
  char v5 = (_UIVisualEffectViewBackdropCaptureGroup *)a3;
  captureGroup = self->_captureGroup;
  if (captureGroup != v5)
  {
    objc_super v7 = v5;
    [(_UIVisualEffectViewBackdropCaptureGroup *)captureGroup removeBackdrop:self update:v5 == 0];
    objc_storeStrong((id *)&self->_captureGroup, a3);
    [(_UIVisualEffectViewBackdropCaptureGroup *)self->_captureGroup addBackdrop:self update:1];
    char v5 = v7;
  }
}

- (void)applyRequestedFilterEffects
{
  v3.receiver = self;
  v3.super_class = (Class)_UIVisualEffectBackdropView;
  [(_UIVisualEffectSubview *)&v3 applyRequestedFilterEffects];
  [(_UIVisualEffectBackdropView *)self _applyScaleHintAsRequested:1];
}

- (void)_applyScaleHintAsRequested:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  char v5 = [(_UIVisualEffectSubview *)self filters];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    double v9 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v13 + 1) + 8 * i) scaleHintAsRequested:v3];
        if (v9 < v11) {
          double v9 = v11;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }
  else
  {
    double v9 = 0.0;
  }

  double v12 = 1.0;
  if (v9 != 0.0) {
    double v12 = v9;
  }
  [(_UIVisualEffectViewBackdropCaptureGroup *)self->_captureGroup applyScaleHint:v12];
}

- (void)willMoveToWindow:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_UIVisualEffectBackdropView;
  [(_UIVisualEffectSubview *)&v9 willMoveToWindow:v5];
  if (v5)
  {
    BOOL v3 = [v5 screen];
    [v3 scale];
    double v7 = v6;
  }
  else
  {
    double v7 = 1.0;
  }
  uint64_t v8 = [(_UIVisualEffectBackdropView *)self backdropLayer];
  [v8 setRasterizationScale:v7];

  if (v5) {
}
  }

- (_UIVisualEffectViewBackdropCaptureGroup)captureGroup
{
  captureGroup = self->_captureGroup;
  if (!captureGroup)
  {
    id v4 = [[_UIVisualEffectViewBackdropCaptureGroup alloc] initWithBackdrop:self];
    id v5 = self->_captureGroup;
    self->_captureGroup = v4;

    captureGroup = self->_captureGroup;
  }
  return captureGroup;
}

- (void)setRenderMode:(int64_t)a3
{
  id v4 = [(_UIVisualEffectBackdropView *)self backdropLayer];
  [v4 setEnabled:a3 != 0];
  [v4 setCaptureOnly:a3 == 1];
}

- (void).cxx_destruct
{
}

- (int64_t)renderMode
{
  v2 = [(_UIVisualEffectBackdropView *)self backdropLayer];
  if ([v2 isEnabled])
  {
    if ([v2 captureOnly]) {
      int64_t v3 = 1;
    }
    else {
      int64_t v3 = 2;
    }
  }
  else
  {
    int64_t v3 = 0;
  }

  return v3;
}

- (void)removeFromCurrentCaptureGroup
{
  captureGroup = self->_captureGroup;
  if (captureGroup)
  {
    [(_UIVisualEffectViewBackdropCaptureGroup *)captureGroup removeBackdrop:self update:0];
    id v4 = self->_captureGroup;
    self->_captureGroup = 0;

    id v5 = [(_UIVisualEffectBackdropView *)self backdropLayer];
    [v5 setGroupName:0];
  }
}

- (void)applyIdentityFilterEffects
{
  v3.receiver = self;
  v3.super_class = (Class)_UIVisualEffectBackdropView;
  [(_UIVisualEffectSubview *)&v3 applyIdentityFilterEffects];
  [(_UIVisualEffectBackdropView *)self _applyScaleHintAsRequested:0];
}

- (BOOL)isTransparentFocusItem
{
  objc_super v3 = [(UIView *)self _focusBehavior];
  int v4 = [v3 supportsViewTransparency];

  if (v4) {
    return [(_UIVisualEffectBackdropView *)self renderMode] != 2;
  }
  v6.receiver = self;
  v6.super_class = (Class)_UIVisualEffectBackdropView;
  return [(UIView *)&v6 isTransparentFocusItem];
}

@end
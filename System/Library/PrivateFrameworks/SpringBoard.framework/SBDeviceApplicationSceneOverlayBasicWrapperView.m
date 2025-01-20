@interface SBDeviceApplicationSceneOverlayBasicWrapperView
- (BOOL)needsCounterRotation;
- (BOOL)shouldAllowTouchPassthroughIfTransparent;
- (BOOL)shouldLayoutOverlayImmediatelyForContainerGeometryChange;
- (SBDeviceApplicationSceneOverlayBasicWrapperView)initWithCounterRotationRequirement:(BOOL)a3;
- (int64_t)hostOrientation;
- (void)addObserver:(id)a3;
- (void)removeObserver:(id)a3;
- (void)setHostOrientation:(int64_t)a3;
- (void)setNeedsCounterRotation:(BOOL)a3;
- (void)setShouldAllowTouchPassthroughIfTransparent:(BOOL)a3;
- (void)setShouldLayoutOverlayImmediatelyForContainerGeometryChange:(BOOL)a3;
@end

@implementation SBDeviceApplicationSceneOverlayBasicWrapperView

- (SBDeviceApplicationSceneOverlayBasicWrapperView)initWithCounterRotationRequirement:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SBDeviceApplicationSceneOverlayBasicWrapperView;
  result = -[SBDeviceApplicationSceneOverlayBasicWrapperView initWithFrame:](&v5, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  if (result) {
    result->_needsCounterRotation = a3;
  }
  return result;
}

- (BOOL)needsCounterRotation
{
  return self->_needsCounterRotation;
}

- (void)setNeedsCounterRotation:(BOOL)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (self->_needsCounterRotation != a3)
  {
    self->_needsCounterRotation = a3;
    long long v9 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    v4 = (void *)[(NSHashTable *)self->_observers copy];
    uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v10;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v10 != v7) {
            objc_enumerationMutation(v4);
          }
          [*(id *)(*((void *)&v9 + 1) + 8 * v8++) overlayViewDidChangeCounterRotationRequirement:self];
        }
        while (v6 != v8);
        uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
      }
      while (v6);
    }
  }
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    observers = self->_observers;
    id v8 = v4;
    if (!observers)
    {
      uint64_t v6 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
      uint64_t v7 = self->_observers;
      self->_observers = v6;

      observers = self->_observers;
    }
    [(NSHashTable *)observers addObject:v8];
    id v4 = v8;
  }
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v7 = v4;
    [(NSHashTable *)self->_observers removeObject:v4];
    NSUInteger v5 = [(NSHashTable *)self->_observers count];
    id v4 = v7;
    if (!v5)
    {
      observers = self->_observers;
      self->_observers = 0;

      id v4 = v7;
    }
  }
}

- (int64_t)hostOrientation
{
  return self->_hostOrientation;
}

- (void)setHostOrientation:(int64_t)a3
{
  self->_hostOrientation = a3;
}

- (BOOL)shouldLayoutOverlayImmediatelyForContainerGeometryChange
{
  return self->_shouldLayoutOverlayImmediatelyForContainerGeometryChange;
}

- (void)setShouldLayoutOverlayImmediatelyForContainerGeometryChange:(BOOL)a3
{
  self->_shouldLayoutOverlayImmediatelyForContainerGeometryChange = a3;
}

- (BOOL)shouldAllowTouchPassthroughIfTransparent
{
  return self->_shouldAllowTouchPassthroughIfTransparent;
}

- (void)setShouldAllowTouchPassthroughIfTransparent:(BOOL)a3
{
  self->_shouldAllowTouchPassthroughIfTransparent = a3;
}

- (void).cxx_destruct
{
}

@end
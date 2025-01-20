@interface PUReviewScreenBarsModel
- (BOOL)_needsUpdateAvailableControls;
- (BOOL)isTransitioningWithCamera;
- (BOOL)lastControlAlignmentChangeForcedLayout;
- (BOOL)shouldBarsCounterrotate;
- (BOOL)shouldPlaceScrubberInScrubberBar;
- (BOOL)useVerticalControlLayout;
- (CGPoint)controlCenterAlignmentPoint;
- (NSDictionary)availableItemsByIdentifier;
- (NSSet)availableControls;
- (NSSet)enabledControls;
- (UIView)accessoryView;
- (void)_setAvailableControls:(id)a3;
- (void)_setEnabledControls:(id)a3;
- (void)_setNeedsUpdateAvailableControls:(BOOL)a3;
- (void)_updateAvailableControls;
- (void)invokeCallbackForBarButtonItemWithIdentifier:(int64_t)a3;
- (void)performChanges:(id)a3;
- (void)setAccessoryView:(id)a3;
- (void)setAvailableItemsByIdentifier:(id)a3;
- (void)setControlCenterAlignmentPoint:(CGPoint)a3;
- (void)setControlCenterAlignmentPoint:(CGPoint)a3 forceLayout:(BOOL)a4;
- (void)setShouldBarsCounterrotate:(BOOL)a3;
- (void)setShouldPlaceScrubberInScrubberBar:(BOOL)a3;
- (void)setTransitioningWithCamera:(BOOL)a3;
- (void)setUseVerticalControlLayout:(BOOL)a3;
@end

@implementation PUReviewScreenBarsModel

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessoryView, 0);
  objc_storeStrong((id *)&self->_enabledControls, 0);
  objc_storeStrong((id *)&self->_availableControls, 0);
  objc_storeStrong((id *)&self->_availableItemsByIdentifier, 0);
}

- (void)_setNeedsUpdateAvailableControls:(BOOL)a3
{
  self->__needsUpdateAvailableControls = a3;
}

- (BOOL)_needsUpdateAvailableControls
{
  return self->__needsUpdateAvailableControls;
}

- (BOOL)shouldBarsCounterrotate
{
  return self->_shouldBarsCounterrotate;
}

- (BOOL)useVerticalControlLayout
{
  return self->_useVerticalControlLayout;
}

- (BOOL)lastControlAlignmentChangeForcedLayout
{
  return self->_lastControlAlignmentChangeForcedLayout;
}

- (CGPoint)controlCenterAlignmentPoint
{
  double x = self->_controlCenterAlignmentPoint.x;
  double y = self->_controlCenterAlignmentPoint.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (BOOL)isTransitioningWithCamera
{
  return self->_transitioningWithCamera;
}

- (UIView)accessoryView
{
  return self->_accessoryView;
}

- (BOOL)shouldPlaceScrubberInScrubberBar
{
  return self->_shouldPlaceScrubberInScrubberBar;
}

- (void)_setEnabledControls:(id)a3
{
}

- (NSSet)enabledControls
{
  return self->_enabledControls;
}

- (void)_setAvailableControls:(id)a3
{
}

- (NSSet)availableControls
{
  return self->_availableControls;
}

- (NSDictionary)availableItemsByIdentifier
{
  return self->_availableItemsByIdentifier;
}

- (void)setShouldBarsCounterrotate:(BOOL)a3
{
  if (self->_shouldBarsCounterrotate != a3)
  {
    self->_shouldBarsCounterrotate = a3;
    [(PUReviewScreenBarsModel *)self signalChange:64];
  }
}

- (void)setUseVerticalControlLayout:(BOOL)a3
{
  if (self->_useVerticalControlLayout != a3)
  {
    self->_useVerticalControlLayout = a3;
    [(PUReviewScreenBarsModel *)self signalChange:16];
  }
}

- (void)setControlCenterAlignmentPoint:(CGPoint)a3 forceLayout:(BOOL)a4
{
  if (a3.x != self->_controlCenterAlignmentPoint.x || a3.y != self->_controlCenterAlignmentPoint.y)
  {
    self->_controlCenterAlignmentPoint = a3;
    self->_lastControlAlignmentChangeForcedLayout = 1;
    [(PUReviewScreenBarsModel *)self signalChange:32];
  }
}

- (void)setControlCenterAlignmentPoint:(CGPoint)a3
{
}

- (void)setTransitioningWithCamera:(BOOL)a3
{
  if (self->_transitioningWithCamera != a3)
  {
    self->_transitioningWithCamera = a3;
    [(PUReviewScreenBarsModel *)self signalChange:8];
  }
}

- (void)setShouldPlaceScrubberInScrubberBar:(BOOL)a3
{
  if (self->_shouldPlaceScrubberInScrubberBar != a3)
  {
    self->_shouldPlaceScrubberInScrubberBar = a3;
    [(PUReviewScreenBarsModel *)self signalChange:4];
  }
}

- (void)setAccessoryView:(id)a3
{
  v5 = (UIView *)a3;
  if (self->_accessoryView != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_accessoryView, a3);
    [(PUReviewScreenBarsModel *)self signalChange:4];
    v5 = v6;
  }
}

- (void)setAvailableItemsByIdentifier:(id)a3
{
  v4 = (NSDictionary *)a3;
  v5 = v4;
  if (self->_availableItemsByIdentifier != v4)
  {
    v9 = v4;
    char v6 = -[NSDictionary isEqual:](v4, "isEqual:");
    v5 = v9;
    if ((v6 & 1) == 0)
    {
      v7 = (NSDictionary *)[(NSDictionary *)v9 copy];
      availableItemsByIdentifier = self->_availableItemsByIdentifier;
      self->_availableItemsByIdentifier = v7;

      [(PUReviewScreenBarsModel *)self _updateAvailableControls];
      v5 = v9;
    }
  }
}

- (void)performChanges:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)PUReviewScreenBarsModel;
  [(PUReviewScreenBarsModel *)&v3 performChanges:a3];
}

- (void)_updateAvailableControls
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if (_updateAvailableControls_onceToken != -1) {
    dispatch_once(&_updateAvailableControls_onceToken, &__block_literal_global_76956);
  }
  objc_super v3 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithCapacity:", objc_msgSend((id)_updateAvailableControls_controlsByIdentifier, "count"));
  v17 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithCapacity:", objc_msgSend((id)_updateAvailableControls_controlsByIdentifier, "count"));
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v4 = (id)_updateAvailableControls_controlsByIdentifier;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v19 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v18 + 1) + 8 * i);
        v10 = [(PUReviewScreenBarsModel *)self availableItemsByIdentifier];
        v11 = [v10 objectForKeyedSubscript:v9];

        if (v11)
        {
          v12 = [(id)_updateAvailableControls_controlsByIdentifier objectForKeyedSubscript:v9];
          [v3 addObject:v12];
          if ([v11 isEnabled]) {
            [v17 addObject:v12];
          }
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v6);
  }

  v13 = [(PUReviewScreenBarsModel *)self availableControls];
  char v14 = [v3 isEqual:v13];

  if ((v14 & 1) == 0)
  {
    [(PUReviewScreenBarsModel *)self _setAvailableControls:v3];
    [(PUReviewScreenBarsModel *)self signalChange:1];
  }
  v15 = [(PUReviewScreenBarsModel *)self enabledControls];
  char v16 = [v17 isEqual:v15];

  if ((v16 & 1) == 0)
  {
    [(PUReviewScreenBarsModel *)self _setEnabledControls:v17];
    [(PUReviewScreenBarsModel *)self signalChange:2];
  }
}

void __51__PUReviewScreenBarsModel__updateAvailableControls__block_invoke()
{
  v3[6] = *MEMORY[0x1E4F143B8];
  v2[0] = &unk_1F078CB78;
  v2[1] = &unk_1F078CBA8;
  v3[0] = &unk_1F078CB90;
  v3[1] = &unk_1F078CBC0;
  v2[2] = &unk_1F078CBD8;
  v2[3] = &unk_1F078CC08;
  v3[2] = &unk_1F078CBF0;
  v3[3] = &unk_1F078CC20;
  v2[4] = &unk_1F078CC38;
  v2[5] = &unk_1F078CC68;
  v3[4] = &unk_1F078CC50;
  v3[5] = &unk_1F078CC80;
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:v2 count:6];
  v1 = (void *)_updateAvailableControls_controlsByIdentifier;
  _updateAvailableControls_controlsByIdentifier = v0;
}

- (void)invokeCallbackForBarButtonItemWithIdentifier:(int64_t)a3
{
  uint64_t v6 = [(PUReviewScreenBarsModel *)self availableItemsByIdentifier];
  uint64_t v7 = [NSNumber numberWithInteger:a3];
  id v16 = [v6 objectForKeyedSubscript:v7];

  v8 = (const char *)[v16 action];
  uint64_t v9 = [v16 target];
  v10 = v9;
  if (v9) {
    BOOL v11 = v8 == 0;
  }
  else {
    BOOL v11 = 1;
  }
  if (!v11)
  {
    v12 = [v9 methodSignatureForSelector:v8];
    if (!v12)
    {
      char v14 = [MEMORY[0x1E4F28B00] currentHandler];
      v15 = NSStringFromSelector(v8);
      [v14 handleFailureInMethod:a2, self, @"PUReviewScreenBarsModel.m", 33, @"target %@ does not appear to respond to selector %@", v10, v15 object file lineNumber description];
    }
    v13 = [MEMORY[0x1E4F1CA18] invocationWithMethodSignature:v12];
    [v13 setSelector:v8];
    [v13 setTarget:v10];
    [v13 setArgument:&v16 atIndex:2];
    [v13 invoke];
  }
}

@end
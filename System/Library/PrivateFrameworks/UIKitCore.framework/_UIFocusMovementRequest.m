@interface _UIFocusMovementRequest
- (BOOL)allowsDeferral;
- (BOOL)allowsFocusingCurrentItem;
- (BOOL)allowsOverridingPreferedFocusEnvironments;
- (BOOL)isMovementRequest;
- (BOOL)overridesDeferredFocusUpdate;
- (BOOL)requiresEnvironmentValidation;
- (BOOL)requiresNextFocusedItem;
- (BOOL)shouldPerformHapticFeedback;
- (BOOL)shouldPlayFocusSound;
- (BOOL)shouldScrollIfNecessary;
- (UIFocusSystem)focusSystem;
- (_UIFocusInputDeviceInfo)inputDeviceInfo;
- (_UIFocusItemInfo)focusedItemInfo;
- (_UIFocusMovementInfo)movementInfo;
- (_UIFocusMovementRequest)fallbackRequest;
- (_UIFocusMovementRequest)init;
- (_UIFocusMovementRequest)initWithFocusSystem:(id)a3;
- (_UIFocusSearchInfo)searchInfo;
- (id)_requestByRedirectingRequestToFocusSystem:(id)a3;
- (void)setFocusedItemInfo:(id)a3;
- (void)setInputDeviceInfo:(id)a3;
- (void)setMovementInfo:(id)a3;
- (void)setOverridesDeferredFocusUpdate:(BOOL)a3;
- (void)setSearchInfo:(id)a3;
- (void)setShouldPerformHapticFeedback:(BOOL)a3;
@end

@implementation _UIFocusMovementRequest

- (_UIFocusMovementRequest)init
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"_UIFocusMovementRequest.m" lineNumber:18 description:@"-init is not a valid initializer for this class."];

  return 0;
}

- (_UIFocusMovementRequest)initWithFocusSystem:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"_UIFocusMovementRequest.m", 24, @"Invalid parameter not satisfying: %@", @"focusSystem" object file lineNumber description];
  }
  v10.receiver = self;
  v10.super_class = (Class)_UIFocusMovementRequest;
  v6 = [(_UIFocusMovementRequest *)&v10 init];
  v7 = v6;
  if (v6) {
    objc_storeWeak((id *)&v6->_focusSystem, v5);
  }

  return v7;
}

- (id)_requestByRedirectingRequestToFocusSystem:(id)a3
{
  id v4 = a3;
  id v5 = [[_UIFocusMovementRequest alloc] initWithFocusSystem:v4];

  objc_storeStrong((id *)&v5->_movementInfo, self->_movementInfo);
  return v5;
}

- (_UIFocusItemInfo)focusedItemInfo
{
  focusedItemInfo = self->_focusedItemInfo;
  if (!focusedItemInfo)
  {
    id v4 = [(_UIFocusMovementRequest *)self focusSystem];
    id v5 = [v4 focusedItem];
    v6 = +[_UIFocusItemInfo infoWithItem:v5];
    v7 = self->_focusedItemInfo;
    self->_focusedItemInfo = v6;

    focusedItemInfo = self->_focusedItemInfo;
  }
  return focusedItemInfo;
}

- (_UIFocusMovementInfo)movementInfo
{
  movementInfo = self->_movementInfo;
  if (!movementInfo)
  {
    id v4 = +[_UIFocusMovementInfo _movementWithHeading:0 isInitial:1];
    id v5 = self->_movementInfo;
    self->_movementInfo = v4;

    movementInfo = self->_movementInfo;
  }
  return movementInfo;
}

- (_UIFocusSearchInfo)searchInfo
{
  searchInfo = self->_searchInfo;
  if (!searchInfo)
  {
    id v4 = +[_UIFocusSearchInfo defaultInfo];
    id v5 = self->_searchInfo;
    self->_searchInfo = v4;

    searchInfo = self->_searchInfo;
  }
  return searchInfo;
}

- (_UIFocusMovementRequest)fallbackRequest
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_focusSystem);
  id v4 = [WeakRetained _hostFocusSystem];

  if (v4)
  {
    id v5 = [(_UIFocusMovementRequest *)self _requestByRedirectingRequestToFocusSystem:v4];
  }
  else
  {
    id v5 = 0;
  }

  return (_UIFocusMovementRequest *)v5;
}

- (BOOL)isMovementRequest
{
  return 1;
}

- (BOOL)shouldScrollIfNecessary
{
  return 1;
}

- (BOOL)shouldPlayFocusSound
{
  return 1;
}

- (BOOL)requiresNextFocusedItem
{
  return 1;
}

- (BOOL)requiresEnvironmentValidation
{
  return 1;
}

- (BOOL)allowsFocusingCurrentItem
{
  return 0;
}

- (BOOL)allowsDeferral
{
  return 0;
}

- (BOOL)allowsOverridingPreferedFocusEnvironments
{
  return 0;
}

- (UIFocusSystem)focusSystem
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_focusSystem);
  return (UIFocusSystem *)WeakRetained;
}

- (BOOL)shouldPerformHapticFeedback
{
  return self->_shouldPerformHapticFeedback;
}

- (void)setShouldPerformHapticFeedback:(BOOL)a3
{
  self->_shouldPerformHapticFeedback = a3;
}

- (_UIFocusInputDeviceInfo)inputDeviceInfo
{
  return self->_inputDeviceInfo;
}

- (void)setInputDeviceInfo:(id)a3
{
}

- (void)setFocusedItemInfo:(id)a3
{
}

- (void)setMovementInfo:(id)a3
{
}

- (void)setSearchInfo:(id)a3
{
}

- (BOOL)overridesDeferredFocusUpdate
{
  return self->_overridesDeferredFocusUpdate;
}

- (void)setOverridesDeferredFocusUpdate:(BOOL)a3
{
  self->_overridesDeferredFocusUpdate = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchInfo, 0);
  objc_storeStrong((id *)&self->_movementInfo, 0);
  objc_storeStrong((id *)&self->_focusedItemInfo, 0);
  objc_storeStrong((id *)&self->_inputDeviceInfo, 0);
  objc_destroyWeak((id *)&self->_focusSystem);
}

@end
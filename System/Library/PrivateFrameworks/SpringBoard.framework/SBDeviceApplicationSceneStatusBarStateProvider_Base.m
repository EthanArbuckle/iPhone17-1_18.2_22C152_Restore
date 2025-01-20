@interface SBDeviceApplicationSceneStatusBarStateProvider_Base
- (BOOL)SB_conformsToSBApplicationSceneStatusBarDescribing;
- (BOOL)_statusBarAppearsOutsideOfAJailedApp;
- (BOOL)_statusBarHiddenGivenFallbackOrientation:(int64_t)a3;
- (BOOL)_suppressInheritedPartStyles;
- (BOOL)sceneWantsDeviceOrientationEventsEnabled;
- (BOOL)statusBarHidden;
- (CGRect)statusBarAvoidanceFrame;
- (FBScene)sceneToHandleStatusBarTapIfExists;
- (NSSet)backgroundActivitiesToSuppress;
- (NSString)description;
- (NSString)statusBarSceneIdentifier;
- (SBDeviceApplicationSceneHandle)classicApplicationSceneHandleIfExists;
- (SBDeviceApplicationSceneStatusBarBreadcrumbProvider)breadcrumbProvider;
- (SBDeviceApplicationSceneStatusBarStateProvider_Base)init;
- (_UIStatusBarData)overlayStatusBarData;
- (double)_statusBarAlpha;
- (double)statusBarAlpha;
- (id)_allObservers;
- (id)_observerRecords;
- (id)_statusBarPartStyles;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)statusBarPartStyles;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (int64_t)_defaultStatusBarStyle;
- (int64_t)_fallbackInterfaceOrientation;
- (int64_t)_statusBarOrientationGivenFallbackOrientation:(int64_t)a3;
- (int64_t)_statusBarStyle;
- (int64_t)_statusBarStyleForPartWithIdentifier:(id)a3 suppressingInherited:(BOOL)a4;
- (int64_t)defaultStatusBarStyle;
- (int64_t)statusBarOrientation;
- (int64_t)statusBarStyle;
- (int64_t)statusBarStyleForPartWithIdentifier:(id)a3;
- (void)addStatusBarObserver:(id)a3;
- (void)enumerateObserversWithBlock:(id)a3;
- (void)removeStatusBarObserver:(id)a3;
@end

@implementation SBDeviceApplicationSceneStatusBarStateProvider_Base

- (int64_t)statusBarOrientation
{
  if ([(SBDeviceApplicationSceneStatusBarStateProvider_Base *)self _statusBarAppearsOutsideOfAJailedApp])
  {
    if (__sb__runningInSpringBoard())
    {
      if (!SBFEffectiveDeviceClass() || SBFEffectiveDeviceClass() == 1) {
        return 1;
      }
    }
    else
    {
      v4 = [MEMORY[0x1E4F42948] currentDevice];
      uint64_t v5 = [v4 userInterfaceIdiom];

      if (!v5) {
        return 1;
      }
    }
  }
  int64_t v6 = [(SBDeviceApplicationSceneStatusBarStateProvider_Base *)self _fallbackInterfaceOrientation];
  return [(SBDeviceApplicationSceneStatusBarStateProvider_Base *)self _statusBarOrientationGivenFallbackOrientation:v6];
}

- (id)statusBarPartStyles
{
  if ([(SBDeviceApplicationSceneStatusBarStateProvider_Base *)self _statusBarAppearsOutsideOfAJailedApp])
  {
    v3 = 0;
  }
  else
  {
    v3 = [(SBDeviceApplicationSceneStatusBarStateProvider_Base *)self _statusBarPartStyles];
  }
  return v3;
}

- (double)statusBarAlpha
{
  if ([(SBDeviceApplicationSceneStatusBarStateProvider_Base *)self _statusBarAppearsOutsideOfAJailedApp])
  {
    return 1.0;
  }
  [(SBDeviceApplicationSceneStatusBarStateProvider_Base *)self _statusBarAlpha];
  return result;
}

- (int64_t)statusBarStyle
{
  if ([(SBDeviceApplicationSceneStatusBarStateProvider_Base *)self _statusBarAppearsOutsideOfAJailedApp])
  {
    return 1;
  }
  return [(SBDeviceApplicationSceneStatusBarStateProvider_Base *)self _statusBarStyle];
}

- (BOOL)statusBarHidden
{
  if ([(SBDeviceApplicationSceneStatusBarStateProvider_Base *)self _statusBarAppearsOutsideOfAJailedApp])
  {
    return 0;
  }
  int64_t v4 = [(SBDeviceApplicationSceneStatusBarStateProvider_Base *)self _fallbackInterfaceOrientation];
  return [(SBDeviceApplicationSceneStatusBarStateProvider_Base *)self _statusBarHiddenGivenFallbackOrientation:v4];
}

- (int64_t)defaultStatusBarStyle
{
  if ([(SBDeviceApplicationSceneStatusBarStateProvider_Base *)self _statusBarAppearsOutsideOfAJailedApp])
  {
    return 1;
  }
  return [(SBDeviceApplicationSceneStatusBarStateProvider_Base *)self _defaultStatusBarStyle];
}

- (void)addStatusBarObserver:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4)
  {
    observers = self->_observers;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __76__SBDeviceApplicationSceneStatusBarStateProvider_Base_addStatusBarObserver___block_invoke;
    v9[3] = &unk_1E6AFCD78;
    id v7 = v4;
    id v10 = v7;
    if (([(NSMutableArray *)observers bs_containsObjectPassingTest:v9] & 1) == 0)
    {
      v8 = [[_SBDeviceApplicationSceneStatusBarStateProviderObserverRecord alloc] initWithObserver:v7 andFlags:_SBDeviceApplicationSceneStatusBarStateObserverFlagsForObserver(v7)];
      [(NSMutableArray *)self->_observers addObject:v8];
    }
  }
}

- (void)enumerateObserversWithBlock:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = (void (**)(id, void *, unint64_t))a3;
  if (v5)
  {
    int64_t v6 = [MEMORY[0x1E4F1CA48] array];
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    v15 = self;
    id v7 = (void *)[(NSMutableArray *)self->_observers copy];
    uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v17 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = *(void **)(*((void *)&v16 + 1) + 8 * i);
          v13 = [v12 observer];
          unsigned int v14 = [v12 flags];
          if (v13)
          {
            unint64_t v3 = v3 & 0xFFFFFFFF00000000 | v14;
            v5[2](v5, v13, v3);
          }
          else
          {
            [v6 addObject:v12];
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v9);
    }

    [(NSMutableArray *)v15->_observers removeObjectsInArray:v6];
  }
}

- (int64_t)statusBarStyleForPartWithIdentifier:(id)a3
{
  id v4 = a3;
  if ([(SBDeviceApplicationSceneStatusBarStateProvider_Base *)self _statusBarAppearsOutsideOfAJailedApp])
  {
    int64_t v5 = 1;
  }
  else
  {
    int64_t v5 = [(SBDeviceApplicationSceneStatusBarStateProvider_Base *)self _statusBarStyleForPartWithIdentifier:v4 suppressingInherited:0];
  }

  return v5;
}

- (SBDeviceApplicationSceneStatusBarStateProvider_Base)init
{
  v6.receiver = self;
  v6.super_class = (Class)SBDeviceApplicationSceneStatusBarStateProvider_Base;
  v2 = [(SBDeviceApplicationSceneStatusBarStateProvider_Base *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA48] array];
    observers = v2->_observers;
    v2->_observers = (NSMutableArray *)v3;
  }
  return v2;
}

- (void)removeStatusBarObserver:(id)a3
{
  id v4 = a3;
  observers = self->_observers;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __79__SBDeviceApplicationSceneStatusBarStateProvider_Base_removeStatusBarObserver___block_invoke;
  v8[3] = &unk_1E6AFCD78;
  id v6 = v4;
  id v9 = v6;
  id v7 = [(NSMutableArray *)observers bs_firstObjectPassingTest:v8];
  if (v7) {
    [(NSMutableArray *)self->_observers removeObject:v7];
  }
}

- (id)_observerRecords
{
  return self->_observers;
}

- (BOOL)SB_conformsToSBApplicationSceneStatusBarDescribing
{
  return 1;
}

- (NSSet)backgroundActivitiesToSuppress
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"SBDeviceApplicationSceneStatusBarStateProvider_Base.m" lineNumber:142 description:@"subclasses must override!"];

  int64_t v5 = (void *)MEMORY[0x1E4F1CAD0];
  return (NSSet *)[v5 set];
}

- (CGRect)statusBarAvoidanceFrame
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"SBDeviceApplicationSceneStatusBarStateProvider_Base.m" lineNumber:148 description:@"subclasses must override!"];

  double v5 = *MEMORY[0x1E4F1DB28];
  double v6 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v7 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v8 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  result.size.height = v8;
  result.size.width = v7;
  result.origin.y = v6;
  result.origin.x = v5;
  return result;
}

- (BOOL)sceneWantsDeviceOrientationEventsEnabled
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"SBDeviceApplicationSceneStatusBarStateProvider_Base.m" lineNumber:154 description:@"subclasses must override!"];

  return 0;
}

- (_UIStatusBarData)overlayStatusBarData
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"SBDeviceApplicationSceneStatusBarStateProvider_Base.m" lineNumber:159 description:@"subclasses must override!"];

  return 0;
}

- (SBDeviceApplicationSceneStatusBarBreadcrumbProvider)breadcrumbProvider
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"SBDeviceApplicationSceneStatusBarStateProvider_Base.m" lineNumber:164 description:@"subclasses must override!"];

  return 0;
}

- (NSString)statusBarSceneIdentifier
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"SBDeviceApplicationSceneStatusBarStateProvider_Base.m" lineNumber:169 description:@"subclasses must override!"];

  return 0;
}

- (SBDeviceApplicationSceneHandle)classicApplicationSceneHandleIfExists
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"SBDeviceApplicationSceneStatusBarStateProvider_Base.m" lineNumber:174 description:@"subclasses must override!"];

  return 0;
}

- (FBScene)sceneToHandleStatusBarTapIfExists
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"SBDeviceApplicationSceneStatusBarStateProvider_Base.m" lineNumber:179 description:@"subclasses must override!"];

  return 0;
}

- (int64_t)_statusBarStyle
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"SBDeviceApplicationSceneStatusBarStateProvider_Base.m" lineNumber:186 description:@"subclasses must override!"];

  return 4;
}

- (int64_t)_defaultStatusBarStyle
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"SBDeviceApplicationSceneStatusBarStateProvider_Base.m" lineNumber:191 description:@"subclasses must override!"];

  return 4;
}

- (id)_statusBarPartStyles
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"SBDeviceApplicationSceneStatusBarStateProvider_Base.m" lineNumber:196 description:@"subclasses must override!"];

  return 0;
}

- (int64_t)_statusBarStyleForPartWithIdentifier:(id)a3 suppressingInherited:(BOOL)a4
{
  double v6 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3, a4);
  [v6 handleFailureInMethod:a2 object:self file:@"SBDeviceApplicationSceneStatusBarStateProvider_Base.m" lineNumber:201 description:@"subclasses must override!"];

  return 4;
}

- (double)_statusBarAlpha
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"SBDeviceApplicationSceneStatusBarStateProvider_Base.m" lineNumber:206 description:@"subclasses must override!"];

  return 0.0;
}

- (BOOL)_statusBarHiddenGivenFallbackOrientation:(int64_t)a3
{
  double v5 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  [v5 handleFailureInMethod:a2 object:self file:@"SBDeviceApplicationSceneStatusBarStateProvider_Base.m" lineNumber:211 description:@"subclasses must override!"];

  return 0;
}

- (int64_t)_statusBarOrientationGivenFallbackOrientation:(int64_t)a3
{
  double v5 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  [v5 handleFailureInMethod:a2 object:self file:@"SBDeviceApplicationSceneStatusBarStateProvider_Base.m" lineNumber:216 description:@"subclasses must override!"];

  return 0;
}

- (BOOL)_suppressInheritedPartStyles
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"SBDeviceApplicationSceneStatusBarStateProvider_Base.m" lineNumber:221 description:@"subclasses must override!"];

  return 0;
}

- (BOOL)_statusBarAppearsOutsideOfAJailedApp
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"SBDeviceApplicationSceneStatusBarStateProvider_Base.m" lineNumber:226 description:@"subclasses must override!"];

  return 0;
}

- (int64_t)_fallbackInterfaceOrientation
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"SBDeviceApplicationSceneStatusBarStateProvider_Base.m" lineNumber:231 description:@"subclasses must override!"];

  return 0;
}

- (id)_allObservers
{
  v2 = [(SBDeviceApplicationSceneStatusBarStateProvider_Base *)self _observerRecords];
  uint64_t v3 = objc_msgSend(v2, "bs_map:", &__block_literal_global_94);

  return v3;
}

- (NSString)description
{
  return (NSString *)[(SBDeviceApplicationSceneStatusBarStateProvider_Base *)self descriptionWithMultilinePrefix:0];
}

- (id)succinctDescription
{
  v2 = [(SBDeviceApplicationSceneStatusBarStateProvider_Base *)self succinctDescriptionBuilder];
  uint64_t v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)[MEMORY[0x1E4F4F718] builderWithObject:self];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  uint64_t v3 = [(SBDeviceApplicationSceneStatusBarStateProvider_Base *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = a3;
  double v5 = [(SBDeviceApplicationSceneStatusBarStateProvider_Base *)self succinctDescriptionBuilder];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __93__SBDeviceApplicationSceneStatusBarStateProvider_Base_descriptionBuilderWithMultilinePrefix___block_invoke;
  v10[3] = &unk_1E6AF5290;
  v10[4] = self;
  id v6 = v5;
  id v11 = v6;
  [v6 appendBodySectionWithName:0 multilinePrefix:v4 block:v10];

  double v7 = v11;
  id v8 = v6;

  return v8;
}

- (void).cxx_destruct
{
}

@end
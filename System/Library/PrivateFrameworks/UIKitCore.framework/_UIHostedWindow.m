@interface _UIHostedWindow
- (BOOL)__hostViewUnderlapsStatusBar;
- (BOOL)_allowsLinkPreviewInteractionInViewServices;
- (BOOL)_canPromoteFromKeyWindowStack;
- (BOOL)_extendsScreenSceneLifetime;
- (BOOL)_isWindowServerHostingManaged;
- (BOOL)_needsShakesWhenInactive;
- (BOOL)_preventsRootPresentationController;
- (BOOL)_shouldPropagateTraitCollectionChanges;
- (BOOL)_suppressFirstResponderWhenUserInteractionDisabled;
- (BOOL)_updatesSafeAreaInsetsOnRead;
- (BOOL)_usesWindowServerHitTesting;
- (BOOL)_wantsTraitPropagation;
- (CGRect)_usableBounds;
- (UIColor)_hostTintColor;
- (UITraitCollection)_hostTraitCollection;
- (_UIHostedWindow)initWithFrame:(CGRect)a3;
- (_UIHostedWindowDelegate)_hostedWindowDelegate;
- (double)_systemReferenceAngle;
- (id)_normalInheritedTintColor;
- (id)_remoteContentParent;
- (id)_systemReferenceAngleProvider;
- (id)_traitCollectionForSize:(CGSize)a3 parentCollection:(id)a4;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (int64_t)_defaultTintAdjustmentMode;
- (int64_t)_hostTintAdjustmentMode;
- (int64_t)_orientationForRootTransform;
- (int64_t)_orientationForSceneTransform;
- (int64_t)_orientationForViewTransform;
- (unint64_t)_systemReferenceAngleMode;
- (unsigned)contextID;
- (void)__setHostViewUnderlapsStatusBar:(BOOL)a3;
- (void)_configureContextOptions:(id)a3;
- (void)_didCreateRootPresentationController;
- (void)_didMoveFromScreen:(id)a3 toScreen:(id)a4;
- (void)_registerScrollToTopView:(id)a3;
- (void)_setFirstResponder:(id)a3;
- (void)_setHostBundleIdentifier:(uint64_t)a1;
- (void)_setHostTintAdjustmentMode:(int64_t)a3;
- (void)_setHostTintColor:(id)a3;
- (void)_setHostTraitCollection:(id)a3;
- (void)_setWantsTraitPropagation:(BOOL)a3;
- (void)_unregisterScrollToTopView:(id)a3;
- (void)_updateStrictTouchVerificationIfNecessary;
- (void)_updateWindowTraitsAndNotify:(BOOL)a3;
- (void)dealloc;
- (void)set_hostedWindowDelegate:(id)a3;
@end

@implementation _UIHostedWindow

- (_UIHostedWindow)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)_UIHostedWindow;
  v3 = -[UIWindow initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v3->_wantsTraitPropagation = 0;
    [(UIWindow *)v3 setKeepContextInBackground:1];
    [(UIWindow *)v4 setWindowLevel:-1.79769313e308];
    [(UIWindow *)v4 beginDisablingInterfaceAutorotation];
    if (_UITouchAuthenticationIsEnabledForCurrentProcess()) {
      [(UIView *)v4 setClipsToBounds:1];
    }
    v5 = v4;
  }

  return v4;
}

- (void)dealloc
{
  v3 = [(UIWindow *)self screen];
  v4 = [v3 _focusedWindow];

  if (v4 == self)
  {
    [v3 _setFocusedWindow:0];
    [v3 setNeedsFocusUpdate];
  }

  v5.receiver = self;
  v5.super_class = (Class)_UIHostedWindow;
  [(UIWindow *)&v5 dealloc];
}

- (BOOL)_isWindowServerHostingManaged
{
  return 0;
}

- (BOOL)_canPromoteFromKeyWindowStack
{
  return 0;
}

- (unsigned)contextID
{
  v2 = [(_UIHostedWindow *)self hostingHandle];
  unsigned int v3 = [v2 contextID];

  return v3;
}

- (BOOL)_extendsScreenSceneLifetime
{
  return 1;
}

- (BOOL)_usesWindowServerHitTesting
{
  return 1;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  v8 = +[UIKeyShortcutHUDService _existingHUDService];
  [v8 handleTouchEvent:v7];

  v11.receiver = self;
  v11.super_class = (Class)_UIHostedWindow;
  v9 = -[UIView hitTest:withEvent:](&v11, sel_hitTest_withEvent_, v7, x, y);

  return v9;
}

- (BOOL)_updatesSafeAreaInsetsOnRead
{
  return 0;
}

- (CGRect)_usableBounds
{
  v6.receiver = self;
  v6.super_class = (Class)_UIHostedWindow;
  [(UIWindow *)&v6 _usableBounds];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.double y = v3;
  result.origin.double x = v2;
  return result;
}

- (BOOL)_preventsRootPresentationController
{
  return 0;
}

- (void)_didCreateRootPresentationController
{
  v7.receiver = self;
  v7.super_class = (Class)_UIHostedWindow;
  [(UIWindow *)&v7 _didCreateRootPresentationController];
  double v3 = [(UIWindow *)self rootViewController];
  int v4 = [v3 conformsToProtocol:&unk_1ED688F38];

  if (v4)
  {
    double v5 = [(UIWindow *)self rootViewController];
    objc_super v6 = [(UIWindow *)self _rootPresentationController];
    [v6 _setClientRemotePresentationDelegate:v5];
  }
}

- (void)_registerScrollToTopView:(id)a3
{
  v9[1] = *MEMORY[0x1E4F143B8];
  v7.receiver = self;
  v7.super_class = (Class)_UIHostedWindow;
  id v4 = a3;
  [(UIWindow *)&v7 _registerScrollToTopView:v4];
  double v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
  v8 = @"_UIHostedWindowScrollToTopNotificationView";
  v9[0] = v4;
  objc_super v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:&v8 count:1];

  [v5 postNotificationName:@"_UIHostedWindowDidRegisterScrollToTopViewNotification" object:self userInfo:v6];
}

- (void)_unregisterScrollToTopView:(id)a3
{
  v9[1] = *MEMORY[0x1E4F143B8];
  v7.receiver = self;
  v7.super_class = (Class)_UIHostedWindow;
  id v4 = a3;
  [(UIWindow *)&v7 _unregisterScrollToTopView:v4];
  double v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
  v8 = @"_UIHostedWindowScrollToTopNotificationView";
  v9[0] = v4;
  objc_super v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:&v8 count:1];

  [v5 postNotificationName:@"_UIHostedWindowDidUnregisterScrollToTopViewNotification" object:self userInfo:v6];
}

- (BOOL)_needsShakesWhenInactive
{
  return 1;
}

- (int64_t)_orientationForViewTransform
{
  return 1;
}

- (int64_t)_orientationForRootTransform
{
  return 1;
}

- (int64_t)_orientationForSceneTransform
{
  return 1;
}

- (void)_setHostTintAdjustmentMode:(int64_t)a3
{
  if (self->_hostTintAdjustmentMode != a3)
  {
    self->_hostTintAdjustmentMode = a3;
    -[UIView _dispatchTintColorVisitorWithReasons:](self, 2);
  }
}

- (void)_setHostTintColor:(id)a3
{
  id v8 = a3;
  id v5 = [(_UIHostedWindow *)self _hostTintColor];
  if (v5 == v8)
  {
  }
  else
  {
    objc_super v6 = [(_UIHostedWindow *)self _hostTintColor];
    char v7 = [v6 isEqual:v8];

    if ((v7 & 1) == 0)
    {
      objc_storeStrong((id *)&self->__hostTintColor, a3);
      -[UIView _dispatchTintColorVisitorWithReasons:](self, 1);
    }
  }
}

- (id)_normalInheritedTintColor
{
  v8.receiver = self;
  v8.super_class = (Class)_UIHostedWindow;
  double v3 = [(UIWindow *)&v8 _normalInheritedTintColor];
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [(_UIHostedWindow *)self _hostTintColor];
  }
  objc_super v6 = v5;

  return v6;
}

- (int64_t)_defaultTintAdjustmentMode
{
  if ([(_UIHostedWindow *)self _hostTintAdjustmentMode])
  {
    return [(_UIHostedWindow *)self _hostTintAdjustmentMode];
  }
  else
  {
    v4.receiver = self;
    v4.super_class = (Class)_UIHostedWindow;
    return [(UIView *)&v4 _defaultTintAdjustmentMode];
  }
}

- (void)_configureContextOptions:(id)a3
{
  id v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)_UIHostedWindow;
  [(UIWindow *)&v5 _configureContextOptions:v4];
  [v4 setObject:*MEMORY[0x1E4F1CFC8] forKey:*MEMORY[0x1E4F39E68]];
  if (_UITouchAuthenticationIsEnabledForCurrentProcess()) {
    [v4 setObject:*MEMORY[0x1E4F1CFD0] forKey:*MEMORY[0x1E4F39E98]];
  }
}

- (void)_didMoveFromScreen:(id)a3 toScreen:(id)a4
{
  id v6 = a4;
  v7.receiver = self;
  v7.super_class = (Class)_UIHostedWindow;
  [(UIWindow *)&v7 _didMoveFromScreen:a3 toScreen:v6];
  if ([v6 supportsFocus])
  {
    [v6 _setFocusedWindow:self];
    [v6 setNeedsFocusUpdate];
  }
}

- (void)_setFirstResponder:(id)a3
{
  id v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)_UIHostedWindow;
  [(UIWindow *)&v6 _setFirstResponder:v4];
  if (v4)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->__hostedWindowDelegate);
    [WeakRetained hostedWindow:self didSetFirstResponder:v4];
  }
}

- (BOOL)_suppressFirstResponderWhenUserInteractionDisabled
{
  return 1;
}

- (id)_systemReferenceAngleProvider
{
  double v3 = [(UIWindow *)self rootViewController];
  int v4 = [v3 conformsToProtocol:&unk_1ED688D48];

  if (v4)
  {
    objc_super v5 = [(UIWindow *)self rootViewController];
  }
  else
  {
    objc_super v5 = 0;
  }
  return v5;
}

- (unint64_t)_systemReferenceAngleMode
{
  double v3 = [(_UIHostedWindow *)self _systemReferenceAngleProvider];
  int v4 = v3;
  if (v3)
  {
    id v5 = (id)[v3 _systemReferenceAngleModeFromHost];
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)_UIHostedWindow;
    id v5 = [(UIWindow *)&v8 _systemReferenceAngleMode];
  }
  unint64_t v6 = (unint64_t)v5;

  return v6;
}

- (double)_systemReferenceAngle
{
  double v3 = [(_UIHostedWindow *)self _systemReferenceAngleProvider];
  int v4 = v3;
  if (v3)
  {
    [v3 _systemReferenceAngleFromHost];
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)_UIHostedWindow;
    [(UIWindow *)&v8 _systemReferenceAngle];
  }
  double v6 = v5;

  return v6;
}

- (void)_updateStrictTouchVerificationIfNecessary
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  if (_UITouchAuthenticationIsEnabledForCurrentProcess())
  {
    if (self)
    {
      long long v3 = *(_OWORD *)&self->_hostAuditToken.val[4];
      long long v21 = *(_OWORD *)self->_hostAuditToken.val;
      long long v22 = v3;
    }
    else
    {
      long long v21 = 0u;
      long long v22 = 0u;
    }
    id v20 = 0;
    int v4 = [MEMORY[0x1E4F223F8] bundleRecordForAuditToken:&v21 error:&v20];
    id v5 = v20;
    if (v5)
    {
      double v6 = *(id *)(__UILogGetCategoryCachedImpl("UIViewService", &_MergedGlobals_3_29) + 8);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        uint64_t v7 = [v5 localizedDescription];
        objc_super v8 = (void *)v7;
        if (self) {
          hostBundleIdentifier = self->__hostBundleIdentifier;
        }
        else {
          hostBundleIdentifier = 0;
        }
        *(_DWORD *)buf = 138543618;
        uint64_t v24 = v7;
        __int16 v25 = 2114;
        v26 = hostBundleIdentifier;
        _os_log_impl(&dword_1853B0000, v6, OS_LOG_TYPE_ERROR, "Unable to fetch bundle record for host audit token: %{public}@, %{public}@", buf, 0x16u);
      }
    }
    v10 = [v4 SDKVersion];
    hostSDKVersion = self->_hostSDKVersion;
    self->_hostSDKVersion = v10;

    CFAllocatorRef v12 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    long long v13 = *(_OWORD *)&self->_hostAuditToken.val[4];
    *(_OWORD *)v19.val = *(_OWORD *)self->_hostAuditToken.val;
    *(_OWORD *)&v19.val[4] = v13;
    v14 = SecTaskCreateWithAuditToken(v12, &v19);
    if (v14)
    {
      v15 = v14;
      self->_hostIsInternal = (SecTaskGetCodeSignStatus(v14) & 0x4000000) != 0;
      CFRelease(v15);
    }
    else
    {
      self->_hostIsInternal = 0;
      v16 = *(NSObject **)(__UILogGetCategoryCachedImpl("UIViewService", &qword_1EB25CFE8) + 8);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        v17 = self->__hostBundleIdentifier;
        *(_DWORD *)buf = 138543362;
        uint64_t v24 = (uint64_t)v17;
        v18 = v16;
        _os_log_impl(&dword_1853B0000, v18, OS_LOG_TYPE_ERROR, "Unable to fetch task for host audit token: %{public}@", buf, 0xCu);
      }
    }
  }
}

- (BOOL)_allowsLinkPreviewInteractionInViewServices
{
  [(UIView *)self bounds];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  objc_super v11 = [(UIWindow *)self screen];
  [v11 bounds];
  v19.origin.double x = v12;
  v19.origin.double y = v13;
  v19.size.width = v14;
  v19.size.height = v15;
  v18.origin.double x = v4;
  v18.origin.double y = v6;
  v18.size.width = v8;
  v18.size.height = v10;
  BOOL v16 = CGRectContainsRect(v18, v19);

  return v16;
}

- (BOOL)_shouldPropagateTraitCollectionChanges
{
  if (self->_wantsTraitPropagation) {
    return 1;
  }
  hostTraitCollection = self->_hostTraitCollection;
  if (!hostTraitCollection) {
    return 1;
  }
  double v5 = +[UITraitCollection _emptyTraitCollection]();
  if ([(UITraitCollection *)hostTraitCollection isEqual:v5])
  {
    char v2 = 1;
  }
  else
  {
    CGFloat v6 = self->_hostTraitCollection;
    double v7 = +[UITraitCollection _defaultTraitCollection]();
    char v2 = [(UITraitCollection *)v6 isEqual:v7];
  }
  return v2;
}

- (void)_setHostTraitCollection:(id)a3
{
  id v4 = +[_UISceneHostingTraitCollectionPropagationClientComponent modifiedTraitCollectionForHostTraitCollection:a3];
  double v5 = (UITraitCollection *)v4;
  CGFloat v6 = v5;
  if (v5 != self->_hostTraitCollection)
  {
    CGFloat v8 = v5;
    BOOL v7 = -[UITraitCollection isEqual:](v5, "isEqual:");
    CGFloat v6 = v8;
    if (!v7)
    {
      objc_storeStrong((id *)&self->_hostTraitCollection, v4);
      [(_UIHostedWindow *)self _setWantsTraitPropagation:1];
      [(UIWindow *)self _updateWindowTraits];
      [(_UIHostedWindow *)self _setWantsTraitPropagation:0];
      CGFloat v6 = v8;
    }
  }
}

- (void)_updateWindowTraitsAndNotify:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(_UIHostedWindow *)self _shouldPropagateTraitCollectionChanges])
  {
    v5.receiver = self;
    v5.super_class = (Class)_UIHostedWindow;
    [(UIWindow *)&v5 _updateWindowTraitsAndNotify:v3];
  }
}

- (id)_traitCollectionForSize:(CGSize)a3 parentCollection:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  id v9 = a4;
  hostTraitCollection = self->_hostTraitCollection;
  if (!hostTraitCollection)
  {
    int v14 = 0;
    goto LABEL_16;
  }
  objc_super v11 = +[UITraitCollection _emptyTraitCollection]();
  CGFloat v12 = hostTraitCollection;
  CGFloat v13 = v11;
  if (v12 == v13)
  {
    int v14 = 0;
    id v4 = v12;
  }
  else
  {
    id v4 = v13;
    if (v13)
    {
      uint64_t v5 = [(UITraitCollection *)v12 isEqual:v13];

      if (v5)
      {
        int v14 = 0;
        goto LABEL_16;
      }
    }
    else
    {
    }
    CGFloat v15 = self->_hostTraitCollection;
    BOOL v16 = +[UITraitCollection _defaultTraitCollection]();
    CGFloat v12 = v15;
    v17 = v16;
    if (v12 != v17)
    {
      uint64_t v5 = (uint64_t)v17;
      if (v12 && v17)
      {
        BOOL v18 = [(UITraitCollection *)v12 isEqual:v17];

        if (v18)
        {
          int v14 = 1;
          goto LABEL_16;
        }
      }
      else
      {
      }
      CGRect v19 = self->_hostTraitCollection;

LABEL_19:
      goto LABEL_20;
    }
    int v14 = 1;
  }

  uint64_t v5 = (uint64_t)v12;
LABEL_16:
  v21.receiver = self;
  v21.super_class = (Class)_UIHostedWindow;
  -[UIWindow _traitCollectionForSize:parentCollection:](&v21, sel__traitCollectionForSize_parentCollection_, v9, width, height);
  CGRect v19 = (UITraitCollection *)objc_claimAutoreleasedReturnValue();
  if (v14) {

  }
  if (hostTraitCollection) {
    goto LABEL_19;
  }
LABEL_20:

  return v19;
}

- (id)_remoteContentParent
{
  char v2 = [(UIWindow *)self rootViewController];
  uint64_t v3 = objc_opt_class();
  id v4 = v2;
  if (v3)
  {
    if (objc_opt_isKindOfClass()) {
      uint64_t v5 = v4;
    }
    else {
      uint64_t v5 = 0;
    }
  }
  else
  {
    uint64_t v5 = 0;
  }
  id v6 = v5;

  return v6;
}

- (int64_t)_hostTintAdjustmentMode
{
  return self->_hostTintAdjustmentMode;
}

- (UIColor)_hostTintColor
{
  return self->__hostTintColor;
}

- (UITraitCollection)_hostTraitCollection
{
  return self->_hostTraitCollection;
}

- (BOOL)_wantsTraitPropagation
{
  return self->_wantsTraitPropagation;
}

- (void)_setWantsTraitPropagation:(BOOL)a3
{
  self->_wantsTraitPropagation = a3;
}

- (BOOL)__hostViewUnderlapsStatusBar
{
  return self->__hostViewUnderlapsStatusBar;
}

- (void)__setHostViewUnderlapsStatusBar:(BOOL)a3
{
  self->__hostViewUnderlapsStatusBar = a3;
}

- (_UIHostedWindowDelegate)_hostedWindowDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->__hostedWindowDelegate);
  return (_UIHostedWindowDelegate *)WeakRetained;
}

- (void)set_hostedWindowDelegate:(id)a3
{
}

- (void)_setHostBundleIdentifier:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 944), a2);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__hostBundleIdentifier, 0);
  objc_destroyWeak((id *)&self->__hostedWindowDelegate);
  objc_storeStrong((id *)&self->_hostSDKVersion, 0);
  objc_storeStrong((id *)&self->_hostTraitCollection, 0);
  objc_storeStrong((id *)&self->__hostTintColor, 0);
}

@end
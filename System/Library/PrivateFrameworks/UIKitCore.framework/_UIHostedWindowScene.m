@interface _UIHostedWindowScene
- (BOOL)_pushesTraitCollectionToScreen;
- (BOOL)_usesMinimumSafeAreaInsets;
- (CGSize)_preferredContentSize;
- (UIEdgeInsets)_safeAreaInsetsForInterfaceOrientation:(int64_t)a3;
- (_UIHostedWindowScene)initWithSession:(id)a3 connectionOptions:(id)a4;
- (void)_installLocalSheetPresentationControllerForWindow:(id)a3;
- (void)_invalidate;
- (void)_setPreferredContentSize:(CGSize)a3;
- (void)hostViewDidDisappear;
- (void)hostViewWillAppear;
- (void)hostViewWillDisappear;
- (void)sendAction:(id)a3;
@end

@implementation _UIHostedWindowScene

- (void)hostViewWillAppear
{
  id v2 = [(UIWindowScene *)self _delegateWindow];
  [v2 setUserInteractionEnabled:1];
}

- (void)hostViewWillDisappear
{
  id v2 = [(UIWindowScene *)self _delegateWindow];
  [v2 setUserInteractionEnabled:0];
}

- (void)hostViewDidDisappear
{
  id v3 = [(UIWindowScene *)self _delegateWindow];
  id v2 = [v3 _rootPresentationController];
  [v2 _resetRemoteDismissing];
}

- (void)sendAction:(id)a3
{
  id v4 = a3;
  if (pthread_main_np() == 1)
  {
    v5 = [(UIScene *)self _FBSScene];
    v6 = [MEMORY[0x1E4F1CAD0] setWithObject:v4];
    [v5 sendActions:v6];
  }
  else
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __35___UIHostedWindowScene_sendAction___block_invoke;
    v7[3] = &unk_1E52D9F98;
    v7[4] = self;
    id v8 = v4;
    dispatch_async(MEMORY[0x1E4F14428], v7);
  }
}

- (void)_setPreferredContentSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  id v5 = [(UIWindowScene *)self _contentSizePreferenceProvider];
  objc_msgSend(v5, "_setPreferredContentSize:", width, height);
}

- (CGSize)_preferredContentSize
{
  id v2 = [(UIWindowScene *)self _contentSizePreferenceProvider];
  [v2 _preferredContentSize];
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.double height = v8;
  result.double width = v7;
  return result;
}

- (_UIHostedWindowScene)initWithSession:(id)a3 connectionOptions:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)_UIHostedWindowScene;
  double v4 = [(UIWindowScene *)&v7 initWithSession:a3 connectionOptions:a4];
  double v5 = v4;
  if (v4) {
    [(UIWindowScene *)v4 _setKeepContextAssociationInBackground:1];
  }
  return v5;
}

- (void)_invalidate
{
  double v3 = [(UIWindowScene *)self _delegateWindow];
  [v3 setUserInteractionEnabled:0];

  v4.receiver = self;
  v4.super_class = (Class)_UIHostedWindowScene;
  [(UIWindowScene *)&v4 _invalidate];
}

- (BOOL)_pushesTraitCollectionToScreen
{
  return 0;
}

- (UIEdgeInsets)_safeAreaInsetsForInterfaceOrientation:(int64_t)a3
{
  double v5 = [(UIWindowScene *)self _displayInfoProvider];
  [v5 safeAreaInsetsPortrait];
  double v9 = v6;
  double v11 = v10;
  double v12 = v7;
  double v13 = v8;
  if (v10 != 0.0 || v6 != 0.0 || v8 != 0.0 || v7 != 0.0)
  {
    BOOL v14 = [(UIWindowScene *)self _shouldRotateSafeAreaInsetsToInterfaceOrientation];
    if (a3 == 4) {
      double v15 = v9;
    }
    else {
      double v15 = v13;
    }
    if (a3 == 4) {
      double v16 = v13;
    }
    else {
      double v16 = v12;
    }
    if (a3 == 4) {
      double v17 = v12;
    }
    else {
      double v17 = v11;
    }
    if (a3 == 4) {
      double v18 = v11;
    }
    else {
      double v18 = v9;
    }
    if (a3 == 3)
    {
      double v15 = v12;
      double v16 = v11;
      double v17 = v9;
      double v18 = v13;
    }
    if (a3 == 2)
    {
      double v15 = v11;
      double v16 = v9;
      double v17 = v13;
      double v18 = v12;
    }
    if (v14)
    {
      double v13 = v15;
      double v12 = v16;
      double v11 = v17;
      double v9 = v18;
    }
  }

  double v19 = v9;
  double v20 = v11;
  double v21 = v12;
  double v22 = v13;
  result.right = v22;
  result.bottom = v21;
  result.left = v20;
  result.top = v19;
  return result;
}

- (void)_installLocalSheetPresentationControllerForWindow:(id)a3
{
  id v8 = a3;
  id v4 = [(UIWindowScene *)self _delegateWindow];

  double v5 = v8;
  if (v4 == v8)
  {
    double v6 = [v8 _rootPresentationController];
    double v7 = [(UIWindowScene *)self _remoteSheetClientProvider];
    [v7 _setLocalSheetPresentationController:v6];

    double v5 = v8;
  }
}

- (BOOL)_usesMinimumSafeAreaInsets
{
  return 0;
}

@end
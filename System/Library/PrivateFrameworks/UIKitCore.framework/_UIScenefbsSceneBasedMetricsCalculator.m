@interface _UIScenefbsSceneBasedMetricsCalculator
- (UIWindowScene)_scene;
- (void)_setScene:(id)a3;
- (void)_updateMetricsOnWindows:(id)a3 animated:(BOOL)a4;
@end

@implementation _UIScenefbsSceneBasedMetricsCalculator

- (void)_setScene:(id)a3
{
}

- (void)_updateMetricsOnWindows:(id)a3 animated:(BOOL)a4
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  p_scene = &self->_scene;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_scene);
  v8 = [WeakRetained _effectiveSettings];
  uint64_t v50 = [v8 interfaceOrientation];

  id v9 = objc_loadWeakRetained((id *)p_scene);
  v10 = [v9 screen];
  uint64_t v11 = +[_UISceneLifecycleMultiplexer mostActiveWindowSceneOnScreen:v10];

  id v12 = objc_loadWeakRetained((id *)p_scene);
  LODWORD(v10) = [v12 _affectsScreenOrientation];
  char v13 = [(id)UIApp _viewServiceIgnoresSceneForLegacyInterfaceOrientation:v12];

  if (v10 && (v13 & 1) == 0)
  {
    id v14 = objc_loadWeakRetained((id *)p_scene);
    LODWORD(v15) = [v14 isEqual:v11];

    if ((v15 & 1) == 0 && !v11)
    {
      id v15 = objc_loadWeakRetained((id *)p_scene);

      if (v15)
      {
        id v16 = objc_loadWeakRetained((id *)p_scene);
        int v17 = [v16 _hasLifecycle];

        id v18 = objc_loadWeakRetained((id *)p_scene);
        int v19 = [v18 _isInternal];

        if (v19)
        {
          id v20 = objc_loadWeakRetained((id *)p_scene);
          int v21 = [v20 _affectsAppLifecycleIfInternal];
        }
        else
        {
          int v21 = 0;
        }
        id v22 = objc_loadWeakRetained((id *)p_scene);
        int v23 = [v22 _isConnecting];

        LODWORD(v15) = v17 & v23 & (v21 | ~v19);
      }
    }
    if (([(id)UIApp isFrontBoard] & 1) == 0 && v15)
    {
      id v24 = objc_loadWeakRetained((id *)p_scene);
      v25 = [v24 screen];
      [v25 _setInterfaceOrientation:v50];
    }
  }
  v47 = (void *)v11;
  id v26 = objc_loadWeakRetained((id *)p_scene);
  v51 = +[UIWindow _findWindowForControllingOverallAppearanceInWindowScene:v26];

  id v27 = objc_loadWeakRetained((id *)p_scene);
  char v52 = [v27 _sceneSessionRoleIsCarPlayOrNonInteractiveExternal];

  id v28 = objc_loadWeakRetained((id *)p_scene);
  int v29 = [v28 _canDynamicallySpecifySupportedInterfaceOrientations];

  location = (id *)p_scene;
  id v30 = objc_loadWeakRetained((id *)p_scene);
  _UISceneMetricsCalculatorApplySceneCornerRadiiToScreenIfNecessary(v30);

  long long v55 = 0u;
  long long v56 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  id v31 = v5;
  uint64_t v32 = [v31 countByEnumeratingWithState:&v53 objects:v57 count:16];
  uint64_t v33 = v50;
  if (v32)
  {
    uint64_t v34 = v32;
    uint64_t v35 = *(void *)v54;
    do
    {
      for (uint64_t i = 0; i != v34; ++i)
      {
        if (*(void *)v54 != v35) {
          objc_enumerationMutation(v31);
        }
        v37 = *(void **)(*((void *)&v53 + 1) + 8 * i);
        if (objc_msgSend(v37, "_isWindowServerHostingManaged", v47))
        {
          uint64_t v38 = v33;
          if (!v29) {
            goto LABEL_34;
          }
          BOOL v39 = ![v37 _canAffectStatusBarAppearance] || v51 == 0;
          uint64_t v38 = v33;
          if (v39) {
            goto LABEL_34;
          }
          id v40 = v51;
          id v41 = v37;
          if (v40 == v41)
          {
          }
          else
          {
            v42 = v41;
            if (v41)
            {
              char v43 = [v40 isEqual:v41];

              uint64_t v33 = v50;
              uint64_t v38 = v50;
              if (v43) {
                goto LABEL_34;
              }
            }
            else
            {
            }
            v44 = [v42 rootViewController];
            id v40 = [v44 _viewControllerForSupportedInterfaceOrientations];

            if (v40)
            {
              uint64_t v38 = objc_msgSend(v42, "_interfaceOrientationForSupportedOrientations:preferredOrientation:", objc_msgSend(v40, "__supportedInterfaceOrientations"), objc_msgSend(v42, "_preferredInterfaceOrientationForRootViewController"));
LABEL_33:

              uint64_t v33 = v50;
LABEL_34:
              if ((v52 & 1) != 0 || v38 == [v37 interfaceOrientation])
              {
                -[UIWindow _invalidateDeferredOrientationUpdate](v37);
                if ([(id)objc_opt_class() _transformLayerRotationsAreEnabled]) {
                  [v37 _sceneBoundsDidChange];
                }
                else {
                  [v37 _updateTransformLayer];
                }
              }
              else if (a4)
              {
                id v45 = objc_loadWeakRetained(location);
                v46 = [v45 screen];
                objc_msgSend(v37, "_updateToInterfaceOrientation:animated:", v38, objc_msgSend(v46, "_isPerformingSystemSnapshot") ^ 1);

                uint64_t v33 = v50;
              }
              else
              {
                [v37 _updateToInterfaceOrientation:v38 animated:0];
              }
              continue;
            }
          }
          uint64_t v38 = v50;
          goto LABEL_33;
        }
      }
      uint64_t v34 = [v31 countByEnumeratingWithState:&v53 objects:v57 count:16];
    }
    while (v34);
  }
}

- (UIWindowScene)_scene
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_scene);
  return (UIWindowScene *)WeakRetained;
}

- (void).cxx_destruct
{
}

@end
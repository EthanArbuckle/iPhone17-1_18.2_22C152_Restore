@interface SBPIPMorphAnimatorDataSource
- (BOOL)_isChamoisWindowingUIEnabledForAnimator:(id)a3;
- (BOOL)shouldProvideSourceClippingFrameInFixedCoordinateSpace:(id)a3;
- (CGRect)_appLayoutBoundingBoxForAnimator:(id)a3;
- (CGRect)sourceContentContainerFrameForAnimator:(id)a3;
- (CGRect)sourceContentFrameForAnimator:(id)a3;
- (CGRect)sourceSubviewFrame:(CGRect)a3 inScreenSpaceForAnimator:(id)a4;
- (CGRect)targetFinalFrameForAnimator:(id)a3;
- (PGPictureInPictureController)pegasusController;
- (SBPIPContentViewLayoutSettings)contentViewLayoutSettings;
- (SBPIPController)pipController;
- (SBPIPMorphAnimatorController)morphAnimatorController;
- (SBPIPMorphAnimatorDataSource)initWithMorphAnimatorController:(id)a3 pipController:(id)a4 pegasusController:(id)a5 contentViewLayoutSettings:(id)a6;
- (double)sourceBlackCurtainCornerRadiusForAnimator:(id)a3;
- (double)sourceCornerRadiusForAnimator:(id)a3;
- (double)targetFinalCornerRadiusForAnimator:(id)a3;
- (void)setContentViewLayoutSettings:(id)a3;
- (void)setMorphAnimatorController:(id)a3;
- (void)setPegasusController:(id)a3;
- (void)setPipController:(id)a3;
@end

@implementation SBPIPMorphAnimatorDataSource

- (SBPIPMorphAnimatorDataSource)initWithMorphAnimatorController:(id)a3 pipController:(id)a4 pegasusController:(id)a5 contentViewLayoutSettings:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v19.receiver = self;
  v19.super_class = (Class)SBPIPMorphAnimatorDataSource;
  v14 = [(SBPIPMorphAnimatorDataSource *)&v19 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_pipController, a4);
    objc_storeStrong((id *)&v15->_pegasusController, a5);
    objc_storeWeak((id *)&v15->_morphAnimatorController, v10);
    objc_storeStrong((id *)&v15->_contentViewLayoutSettings, a6);
    uint64_t v16 = [MEMORY[0x1E4F1CA60] dictionary];
    morphAnimatorToPegasusInitialFrame = v15->_morphAnimatorToPegasusInitialFrame;
    v15->_morphAnimatorToPegasusInitialFrame = (NSMutableDictionary *)v16;
  }
  return v15;
}

- (BOOL)_isChamoisWindowingUIEnabledForAnimator:(id)a3
{
  v3 = [a3 windowScene];
  v4 = [v3 switcherController];
  char v5 = [v4 isChamoisWindowingUIEnabled];

  return v5;
}

- (CGRect)_appLayoutBoundingBoxForAnimator:(id)a3
{
  if ([(SBPIPMorphAnimatorDataSource *)self _isChamoisWindowingUIEnabledForAnimator:a3])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_morphAnimatorController);
    [WeakRetained appLayoutBoundingBox];
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
  }
  else
  {
    double v6 = *MEMORY[0x1E4F1DB28];
    double v8 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v10 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v12 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  }
  double v13 = v6;
  double v14 = v8;
  double v15 = v10;
  double v16 = v12;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- (BOOL)shouldProvideSourceClippingFrameInFixedCoordinateSpace:(id)a3
{
  return ![(SBPIPMorphAnimatorDataSource *)self _isChamoisWindowingUIEnabledForAnimator:a3];
}

- (CGRect)sourceContentFrameForAnimator:(id)a3
{
  uint64_t v68 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_morphAnimatorController);
  int v6 = [WeakRetained targetProcessIdentifier];
  double v7 = [WeakRetained scenePersistenceIdentifier];
  [(SBPIPMorphAnimatorDataSource *)self sourceContentContainerFrameForAnimator:v4];
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  uint64_t v12 = [v4 direction];
  pegasusController = self->_pegasusController;
  double v14 = SBPIPApplicationForProcessIdentifier(pegasusController, v6);
  if (v12)
  {
    [(PGPictureInPictureController *)pegasusController preferredContentSizeForActivePictureInPictureWithApplication:v14 sceneSessionPersistentIdentifier:v7];
    double v16 = v15;
    double v18 = v17;

    if (v16 == 0.0 || v18 == 0.0)
    {
      objc_super v19 = [v4 windowScene];
      v20 = [(SBPIPController *)self->_pipController anyContentViewPresentedOnWindowScene:v19];
      [v20 frame];

      v21 = SBLogPIP();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
        [(SBPIPMorphAnimatorDataSource *)(uint64_t)v7 sourceContentFrameForAnimator:v21];
      }
    }
    UIRectGetCenter();
    UIRectCenteredAboutPoint();
    CGFloat v23 = v22;
    CGFloat v25 = v24;
    CGFloat v27 = v26;
    CGFloat v29 = v28;
  }
  else
  {
    [(PGPictureInPictureController *)pegasusController initialFrameForInteractivePictureInPictureAnimationEnteringBackgroundForApplication:v14 sceneSessionPersistentIdentifier:v7];
    double v31 = v30;
    double v33 = v32;
    double v35 = v34;
    double v37 = v36;

    v38 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithRect:", v31, v33, v35, v37);
    v39 = [v4 uuid];

    if (v39)
    {
      morphAnimatorToPegasusInitialFrame = self->_morphAnimatorToPegasusInitialFrame;
      v41 = [v4 uuid];
      uint64_t v42 = [(NSMutableDictionary *)morphAnimatorToPegasusInitialFrame objectForKey:v41];

      v38 = (void *)v42;
      if (!v42)
      {
        v38 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithRect:", v31, v33, v35, v37);
        v43 = self->_morphAnimatorToPegasusInitialFrame;
        v44 = [v4 uuid];
        [(NSMutableDictionary *)v43 setObject:v38 forKey:v44];
      }
    }
    objc_msgSend(v38, "rectValue", *(void *)&v33, *(void *)&v31);
    CGFloat x = v69.origin.x;
    CGFloat y = v69.origin.y;
    CGFloat width = v69.size.width;
    CGFloat height = v69.size.height;
    if (CGRectIsEmpty(v69))
    {
      CGFloat v23 = *MEMORY[0x1E4F1DB20];
      CGFloat v25 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
      CGFloat v27 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
      CGFloat v29 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
    }
    else
    {
      v70.origin.CGFloat x = x;
      v70.origin.CGFloat y = y;
      v70.size.CGFloat width = width;
      v70.size.CGFloat height = height;
      CGRect v71 = CGRectOffset(v70, v9, v11);
      CGFloat v23 = v71.origin.x;
      CGFloat v25 = v71.origin.y;
      CGFloat v27 = v71.size.width;
      CGFloat v29 = v71.size.height;
    }
    v49 = SBLogPIP();
    if (os_log_type_enabled(v49, OS_LOG_TYPE_DEBUG))
    {
      v54 = [v4 uuid];
      v72.origin.CGFloat y = v60;
      v72.origin.CGFloat x = v61;
      v72.size.CGFloat width = v35;
      v72.size.CGFloat height = v37;
      v55 = NSStringFromCGRect(v72);
      v56 = self->_morphAnimatorToPegasusInitialFrame;
      v57 = [v4 uuid];
      v58 = [(NSMutableDictionary *)v56 objectForKey:v57];
      [v58 rectValue];
      v59 = NSStringFromCGRect(v73);
      *(_DWORD *)buf = 138543874;
      v63 = v54;
      __int16 v64 = 2114;
      v65 = v55;
      __int16 v66 = 2114;
      v67 = v59;
      _os_log_debug_impl(&dword_1D85BA000, v49, OS_LOG_TYPE_DEBUG, "-sourceContentFrameForAnimator animatorUUID[%{public}@] pegasusInitialFrame[%{public}@] cachedInitialFrame[%{public}@]", buf, 0x20u);
    }
  }

  double v50 = v23;
  double v51 = v25;
  double v52 = v27;
  double v53 = v29;
  result.size.CGFloat height = v53;
  result.size.CGFloat width = v52;
  result.origin.CGFloat y = v51;
  result.origin.CGFloat x = v50;
  return result;
}

- (CGRect)sourceContentContainerFrameForAnimator:(id)a3
{
  p_morphAnimatorController = &self->_morphAnimatorController;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_morphAnimatorController);
  [(SBPIPMorphAnimatorDataSource *)self _appLayoutBoundingBoxForAnimator:v5];
  double v8 = v7;
  double v10 = v9;
  CGFloat v11 = [v5 windowScene];
  uint64_t v12 = [v11 switcherController];
  uint64_t v13 = [WeakRetained layoutRole];
  double v14 = [WeakRetained appLayout];
  uint64_t v15 = [v5 toOrientation];

  [v12 frameForItemWithRole:v13 inMainAppLayout:v14 interfaceOrientation:v15];
  CGFloat v17 = v16;
  CGFloat v19 = v18;
  CGFloat v21 = v20;
  CGFloat v23 = v22;

  v32.origin.CGFloat x = v17;
  v32.origin.CGFloat y = v19;
  v32.size.CGFloat width = v21;
  v32.size.CGFloat height = v23;
  CGRect v33 = CGRectOffset(v32, -v8, -v10);
  CGFloat x = v33.origin.x;
  CGFloat y = v33.origin.y;
  CGFloat width = v33.size.width;
  CGFloat height = v33.size.height;

  double v28 = x;
  double v29 = y;
  double v30 = width;
  double v31 = height;
  result.size.CGFloat height = v31;
  result.size.CGFloat width = v30;
  result.origin.CGFloat y = v29;
  result.origin.CGFloat x = v28;
  return result;
}

- (CGRect)sourceSubviewFrame:(CGRect)a3 inScreenSpaceForAnimator:(id)a4
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  [(SBPIPMorphAnimatorDataSource *)self _appLayoutBoundingBoxForAnimator:a4];
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v12 = x;
  CGFloat v13 = y;
  CGFloat v14 = width;
  CGFloat v15 = height;
  return CGRectOffset(*(CGRect *)&v12, v9, v11);
}

- (CGRect)targetFinalFrameForAnimator:(id)a3
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_morphAnimatorController);
  int v6 = [WeakRetained targetProcessIdentifier];
  double v7 = [WeakRetained scenePersistenceIdentifier];
  uint64_t v8 = [WeakRetained isGestureInitiated];
  if ([v4 direction])
  {
    CGFloat v9 = [v4 targetView];
    [v9 frame];
    CGFloat v11 = v10;
    CGFloat v13 = v12;
    CGFloat v15 = v14;
    CGFloat v17 = v16;
  }
  else
  {
    CGFloat v11 = *MEMORY[0x1E4F1DB20];
    CGFloat v13 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
    CGFloat v15 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
    CGFloat v17 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
    pegasusController = self->_pegasusController;
    CGFloat v19 = SBPIPApplicationForProcessIdentifier(pegasusController, v6);
    [(PGPictureInPictureController *)pegasusController preferredContentSizeForInteractivelyEnteringBackgroundForApplication:v19 sceneSessionPersistentIdentifier:v7];
    double v21 = v20;
    double v23 = v22;

    if (v21 > 0.0 && v23 > 0.0)
    {
      pipController = self->_pipController;
      CGFloat v25 = [v4 windowScene];
      -[SBPIPContentViewLayoutSettings defaultContentViewSizeForAspectRatio:](self->_contentViewLayoutSettings, "defaultContentViewSizeForAspectRatio:", v21, v23);
      double v27 = v26;
      double v29 = v28;
      unint64_t v30 = [(SBPIPContentViewLayoutSettings *)self->_contentViewLayoutSettings currentContentViewPosition];
      [(SBPIPContentViewLayoutSettings *)self->_contentViewLayoutSettings contentViewPadding];
      -[SBPIPController homeScreenInitialPIPFrameForWindowScene:withContentViewSize:position:padding:fromOrientation:toOrientation:shouldUpdate:gestureInitiated:](pipController, "homeScreenInitialPIPFrameForWindowScene:withContentViewSize:position:padding:fromOrientation:toOrientation:shouldUpdate:gestureInitiated:", v25, v30, [v4 fromOrientation], objc_msgSend(v4, "toOrientation"), 1, v8, v27, v29, v31);
      CGFloat v11 = v32;
      CGFloat v13 = v33;
      CGFloat v15 = v34;
      CGFloat v17 = v35;
    }
    CGFloat v9 = SBLogPIP();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v52.CGFloat width = v21;
      v52.CGFloat height = v23;
      double v36 = NSStringFromCGSize(v52);
      [v4 fromOrientation];
      double v37 = SBFStringForBSInterfaceOrientation();
      [v4 toOrientation];
      v38 = SBFStringForBSInterfaceOrientation();
      int v45 = 138543874;
      v46 = v36;
      __int16 v47 = 2114;
      v48 = v37;
      __int16 v49 = 2114;
      double v50 = v38;
      _os_log_impl(&dword_1D85BA000, v9, OS_LOG_TYPE_DEFAULT, "-targetFinalFrameForAnimator: preferredContentSize[%{public}@] fromOrientation[%{public}@] toOrientation[%{public}@]", (uint8_t *)&v45, 0x20u);
    }
  }

  v39 = SBLogPIP();
  if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
  {
    v53.origin.CGFloat x = v11;
    v53.origin.CGFloat y = v13;
    v53.size.CGFloat width = v15;
    v53.size.CGFloat height = v17;
    v40 = NSStringFromRect(v53);
    int v45 = 138543362;
    v46 = v40;
    _os_log_impl(&dword_1D85BA000, v39, OS_LOG_TYPE_DEFAULT, "-targetFinalFrameForAnimator: %{public}@", (uint8_t *)&v45, 0xCu);
  }
  double v41 = v11;
  double v42 = v13;
  double v43 = v15;
  double v44 = v17;
  result.size.CGFloat height = v44;
  result.size.CGFloat width = v43;
  result.origin.CGFloat y = v42;
  result.origin.CGFloat x = v41;
  return result;
}

- (double)targetFinalCornerRadiusForAnimator:(id)a3
{
  objc_msgSend(MEMORY[0x1E4F88578], "defaultContentCornerRadius", a3);
  return result;
}

- (double)sourceCornerRadiusForAnimator:(id)a3
{
  SBScreenDisplayCornerRadius();
  SBRectCornerRadiiForRadius();
  return result;
}

- (double)sourceBlackCurtainCornerRadiusForAnimator:(id)a3
{
  id v3 = a3;
  SBScreenDisplayCornerRadius();
  double v4 = 0.0;
  if ((BSFloatIsZero() & 1) == 0)
  {
    id v5 = [v3 windowScene];
    int v6 = [v5 switcherController];
    int v7 = [v6 isChamoisWindowingUIEnabled];

    if (v7)
    {
      uint64_t v8 = [v5 screen];
      CGFloat v9 = [v8 traitCollection];
      [v9 displayCornerRadius];
      double v4 = v10;
    }
    else
    {
      uint64_t v8 = +[SBMedusaDomain rootSettings];
      [v8 cornerRadiusForInnerCorners];
      double v4 = v11;
    }
  }
  return v4;
}

- (SBPIPController)pipController
{
  return self->_pipController;
}

- (void)setPipController:(id)a3
{
}

- (PGPictureInPictureController)pegasusController
{
  return self->_pegasusController;
}

- (void)setPegasusController:(id)a3
{
}

- (SBPIPMorphAnimatorController)morphAnimatorController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_morphAnimatorController);
  return (SBPIPMorphAnimatorController *)WeakRetained;
}

- (void)setMorphAnimatorController:(id)a3
{
}

- (SBPIPContentViewLayoutSettings)contentViewLayoutSettings
{
  return self->_contentViewLayoutSettings;
}

- (void)setContentViewLayoutSettings:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentViewLayoutSettings, 0);
  objc_destroyWeak((id *)&self->_morphAnimatorController);
  objc_storeStrong((id *)&self->_pegasusController, 0);
  objc_storeStrong((id *)&self->_pipController, 0);
  objc_storeStrong((id *)&self->_morphAnimatorToPegasusInitialFrame, 0);
}

- (void)sourceContentFrameForAnimator:(os_log_t)log .cold.1(uint64_t a1, int a2, os_log_t log)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3[0] = 67109378;
  v3[1] = a2;
  __int16 v4 = 2114;
  uint64_t v5 = a1;
  _os_log_error_impl(&dword_1D85BA000, log, OS_LOG_TYPE_ERROR, "Unexpectedly found size zero for preferredContentSizeForActivePictureInPictureWithApplication %d sceneId: %{public}@", (uint8_t *)v3, 0x12u);
}

@end
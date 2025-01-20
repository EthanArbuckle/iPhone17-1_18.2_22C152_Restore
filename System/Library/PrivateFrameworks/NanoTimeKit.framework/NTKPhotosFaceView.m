@interface NTKPhotosFaceView
- (BOOL)_canOperationProceed:(unint64_t)a3;
- (BOOL)_enqueuePreloadedPhoto:(id)a3 ifMatchingGeneration:(unint64_t)a4;
- (BOOL)_preloadNextPhoto;
- (BOOL)_shouldAnimationContinue:(BOOL)a3;
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (Class)photosFaceClass;
- (NTKCachedPhoto)presentedPhoto;
- (NTKPhotosFaceView)initWithFaceStyle:(int64_t)a3 forDevice:(id)a4 clientIdentifier:(id)a5;
- (double)_backgroundImageAlphaForEditMode:(int64_t)a3;
- (double)_timeLabelAlphaForEditMode:(int64_t)a3;
- (id)_analysisCacheKeyFor:(id)a3;
- (id)_analysisForAlignment:(unint64_t)a3;
- (id)_cachedAnalysisForKey:(id)a3;
- (id)_createAndCachePhotoAnalysisForKey:(id)a3 dateAlignment:(unint64_t)a4 image:(id)a5;
- (id)_dequeueToLoadIfMatchingGeneration:(unint64_t)a3;
- (void)_animationFinished:(BOOL)a3;
- (void)_animationStart;
- (void)_applyFrozen;
- (void)_applyOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5;
- (void)_clearPreloaded;
- (void)_configureForEditMode:(int64_t)a3;
- (void)_displayCachedPhoto:(id)a3 animated:(BOOL)a4 preroll:(BOOL)a5 completion:(id)a6;
- (void)_endScrubbingAnimated:(BOOL)a3 withCompletion:(id)a4;
- (void)_finalizeForSnapshotting:(id)a3;
- (void)_handleSingleTap:(id)a3;
- (void)_loadSnapshotContentViews;
- (void)_nextPhotoAnimated:(BOOL)a3 preroll:(BOOL)a4 method:(unint64_t)a5 completion:(id)a6;
- (void)_nextPhotoReadyAnimated:(BOOL)a3 preroll:(BOOL)a4 completion:(id)a5;
- (void)_operationIsDone;
- (void)_resetTapAnimationState;
- (void)_startBackgroundRefill;
- (void)_startScrubbingAnimated:(BOOL)a3 withCompletion:(id)a4;
- (void)_unloadSnapshotContentViews;
- (void)_updateContents:(BOOL)a3;
- (void)_updateDateAttributesAnimated:(BOOL)a3;
- (void)_updateDateAttributesAnimated:(BOOL)a3 completion:(id)a4;
- (void)_updateForResourceDirectoryChange:(id)a3;
- (void)_updateReader:(BOOL)a3;
- (void)layoutSubviews;
- (void)readerDidChange:(id)a3;
- (void)setPresentedPhoto:(id)a3;
@end

@implementation NTKPhotosFaceView

- (NTKPhotosFaceView)initWithFaceStyle:(int64_t)a3 forDevice:(id)a4 clientIdentifier:(id)a5
{
  v6.receiver = self;
  v6.super_class = (Class)NTKPhotosFaceView;
  result = [(NTKBasePhotosFaceView *)&v6 initWithFaceStyle:a3 forDevice:a4 clientIdentifier:a5];
  if (result) {
    result->_currentContent = 2989;
  }
  return result;
}

- (void)layoutSubviews
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v17.receiver = self;
  v17.super_class = (Class)NTKPhotosFaceView;
  id v3 = [(NTKBasePhotosFaceView *)&v17 layoutSubviews];
  if (NTKInternalBuild(v3, v4) && _os_feature_enabled_impl())
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    v5 = [(NTKBasePhotosFaceView *)self posterImageView];
    objc_super v6 = [v5 subviews];

    uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v18 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v14;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v14 != v9) {
            objc_enumerationMutation(v6);
          }
          v11 = *(void **)(*((void *)&v13 + 1) + 8 * v10);
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            [v11 setHidden:1];
          }
          ++v10;
        }
        while (v8 != v10);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v18 count:16];
      }
      while (v8);
    }

    v12 = [(NTKBasePhotosFaceView *)self posterImageView];
    MEMORY[0x1C1874A70]([v12 bounds]);
    -[UILabel setCenter:](self->_aplLabel, "setCenter:");
  }
}

- (void)_applyFrozen
{
  v3.receiver = self;
  v3.super_class = (Class)NTKPhotosFaceView;
  [(NTKBasePhotosFaceView *)&v3 _applyFrozen];
  [(UITapGestureRecognizer *)self->_singleTapGesture setEnabled:[(NTKBasePhotosFaceView *)self isInteractive]];
}

- (Class)photosFaceClass
{
  return (Class)objc_opt_class();
}

- (void)_loadSnapshotContentViews
{
  v29.receiver = self;
  v29.super_class = (Class)NTKPhotosFaceView;
  [(NTKBasePhotosFaceView *)&v29 _loadSnapshotContentViews];
  if ((*((unsigned char *)self + 1240) & 1) == 0)
  {
    *((unsigned char *)self + 1240) |= 1u;
    objc_super v3 = [(NTKFaceView *)self device];
    self->_deviceSizeClass = [v3 sizeClass];

    uint64_t v4 = [NTKRoundedCornerOverlayView alloc];
    [(NTKPhotosFaceView *)self bounds];
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
    long long v13 = [(NTKFaceView *)self device];
    long long v14 = -[NTKRoundedCornerOverlayView initWithFrame:forDeviceCornerRadius:](v4, "initWithFrame:forDeviceCornerRadius:", v13, v6, v8, v10, v12);
    photoTransitionCornerView = self->_photoTransitionCornerView;
    self->_photoTransitionCornerView = v14;

    [(UIView *)self->_photoTransitionCornerView setAlpha:0.0];
    long long v16 = [(NTKFaceView *)self contentView];
    objc_super v17 = self->_photoTransitionCornerView;
    v18 = [(NTKBasePhotosFaceView *)self cornerView];
    [v16 insertSubview:v17 aboveSubview:v18];

    uint64_t v19 = (NSMutableArray *)objc_opt_new();
    preloaded = self->_preloaded;
    self->_preloaded = v19;

    v21 = (NSMutableArray *)objc_opt_new();
    toload = self->_toload;
    self->_toload = v21;

    v23 = (UITapGestureRecognizer *)[objc_alloc(MEMORY[0x1E4FB1D38]) initWithTarget:self action:sel__handleSingleTap_];
    singleTapGesture = self->_singleTapGesture;
    self->_singleTapGesture = v23;

    [(UITapGestureRecognizer *)self->_singleTapGesture setDelegate:self];
    [(NTKPhotosFaceView *)self addGestureRecognizer:self->_singleTapGesture];
    uint64_t v25 = [(NTKPhotosFaceView *)self _updateContents:1];
    if (NTKInternalBuild(v25, v26))
    {
      if (_os_feature_enabled_impl())
      {
        v27 = [(NTKFaceView *)self timeView];
        [v27 setHidden:1];

        v28 = [(NTKFaceView *)self complicationContainerView];
        [v28 setHidden:1];
      }
    }
  }
}

- (void)_unloadSnapshotContentViews
{
  v9.receiver = self;
  v9.super_class = (Class)NTKPhotosFaceView;
  [(NTKBasePhotosFaceView *)&v9 _unloadSnapshotContentViews];
  if (*((unsigned char *)self + 1240))
  {
    *((unsigned char *)self + 1240) &= ~1u;
    [(UIView *)self->_photoTransitionCornerView removeFromSuperview];
    photoTransitionCornerView = self->_photoTransitionCornerView;
    self->_photoTransitionCornerView = 0;

    [(UIView *)self->_photoTransitionSnapshotView removeFromSuperview];
    photoTransitionSnapshotView = self->_photoTransitionSnapshotView;
    self->_photoTransitionSnapshotView = 0;

    [(NTKPhotosFaceView *)self removeGestureRecognizer:self->_singleTapGesture];
    singleTapGesture = self->_singleTapGesture;
    self->_singleTapGesture = 0;

    preloaded = self->_preloaded;
    self->_preloaded = 0;

    toload = self->_toload;
    self->_toload = 0;

    id enqueuePreloadedPhotoCompletion = self->_enqueuePreloadedPhotoCompletion;
    self->_id enqueuePreloadedPhotoCompletion = 0;

    ++self->_preloadGeneration;
  }
}

- (void)_applyOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  v13.receiver = self;
  v13.super_class = (Class)NTKPhotosFaceView;
  [(NTKBasePhotosFaceView *)&v13 _applyOption:v8 forCustomEditMode:a4 slot:a5];
  if (a4 == 14)
  {
    [(NTKPhotosFaceView *)self _updateDateAttributesAnimated:0];
  }
  else if (a4 == 12)
  {
    id v9 = v8;
    unint64_t currentContent = self->_currentContent;
    if (currentContent != [v9 photosContent])
    {
      double v11 = _NTKLoggingObjectForDomain(6, (uint64_t)"NTKLoggingDomainPhoto");
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        int v12 = [v9 photosContent];
        *(_DWORD *)buf = 67109120;
        int v15 = v12;
        _os_log_impl(&dword_1BC5A9000, v11, OS_LOG_TYPE_DEFAULT, "NTKPhotosFaceView: photosContent now set to %d", buf, 8u);
      }

      self->_unint64_t currentContent = [v9 photosContent];
      [(NTKPhotosFaceView *)self _updateContents:1];
    }
  }
}

- (void)_configureForEditMode:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)NTKPhotosFaceView;
  -[NTKBasePhotosFaceView _configureForEditMode:](&v5, sel__configureForEditMode_);
  if (a3 == 12) {
    [(NTKPhotosFaceView *)self _updateDateAttributesAnimated:1];
  }
}

- (void)_updateForResourceDirectoryChange:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)NTKPhotosFaceView;
  [(NTKFaceView *)&v4 _updateForResourceDirectoryChange:a3];
  [(NTKPhotosFaceView *)self _updateContents:0];
}

- (double)_timeLabelAlphaForEditMode:(int64_t)a3
{
  double result = 0.5;
  if (a3 != 12)
  {
    uint64_t v7 = v3;
    uint64_t v8 = v4;
    v6.receiver = self;
    v6.super_class = (Class)NTKPhotosFaceView;
    [(NTKBasePhotosFaceView *)&v6 _timeLabelAlphaForEditMode:0.5];
  }
  return result;
}

- (double)_backgroundImageAlphaForEditMode:(int64_t)a3
{
  double result = 1.0;
  if (a3 != 12)
  {
    uint64_t v7 = v3;
    uint64_t v8 = v4;
    v6.receiver = self;
    v6.super_class = (Class)NTKPhotosFaceView;
    [(NTKBasePhotosFaceView *)&v6 _backgroundImageAlphaForEditMode:1.0];
  }
  return result;
}

- (void)_startScrubbingAnimated:(BOOL)a3 withCompletion:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)NTKPhotosFaceView;
  [(NTKBackgroundImageFaceView *)&v5 _startScrubbingAnimated:a3 withCompletion:a4];
  *((unsigned char *)self + 1240) |= 2u;
}

- (void)_endScrubbingAnimated:(BOOL)a3 withCompletion:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)NTKPhotosFaceView;
  [(NTKBackgroundImageFaceView *)&v5 _endScrubbingAnimated:a3 withCompletion:a4];
  *((unsigned char *)self + 1240) &= ~2u;
}

- (void)_finalizeForSnapshotting:(id)a3
{
  id v4 = a3;
  objc_super v5 = _NTKLoggingObjectForDomain(4, (uint64_t)"NTKLoggingDomainSnapshot");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BC5A9000, v5, OS_LOG_TYPE_DEFAULT, "NTKPhotosFaceView _finalizeForSnapshotting", buf, 2u);
  }

  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __46__NTKPhotosFaceView__finalizeForSnapshotting___block_invoke;
  aBlock[3] = &unk_1E62C0718;
  id v6 = v4;
  id v14 = v6;
  uint64_t v7 = (void (**)(void))_Block_copy(aBlock);
  if ((self->_currentContent | 2) == 2)
  {
    uint64_t v8 = _NTKLoggingObjectForDomain(4, (uint64_t)"NTKLoggingDomainSnapshot");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BC5A9000, v8, OS_LOG_TYPE_DEFAULT, "NTKPhotosFaceView waiting for photos analysis", buf, 2u);
    }

    id v9 = _NTKPhotosAnalysisQueue();
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __46__NTKPhotosFaceView__finalizeForSnapshotting___block_invoke_66;
    v11[3] = &unk_1E62C0718;
    int v12 = v7;
    dispatch_async(v9, v11);
  }
  else
  {
    double v10 = _NTKLoggingObjectForDomain(4, (uint64_t)"NTKLoggingDomainSnapshot");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BC5A9000, v10, OS_LOG_TYPE_DEFAULT, "NTKPhotosFaceView nothing to wait for", buf, 2u);
    }

    v7[2](v7);
  }
}

void __46__NTKPhotosFaceView__finalizeForSnapshotting___block_invoke(uint64_t a1)
{
  dispatch_time_t v2 = dispatch_time(0, 500000000);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __46__NTKPhotosFaceView__finalizeForSnapshotting___block_invoke_2;
  block[3] = &unk_1E62C0718;
  id v4 = *(id *)(a1 + 32);
  dispatch_after(v2, MEMORY[0x1E4F14428], block);
}

uint64_t __46__NTKPhotosFaceView__finalizeForSnapshotting___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __46__NTKPhotosFaceView__finalizeForSnapshotting___block_invoke_66(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)_preloadNextPhoto
{
  unint64_t numberOfPhotos = self->_numberOfPhotos;
  if (numberOfPhotos) {
    [(NTKPhotosFaceView *)self _nextPhotoAnimated:0 preroll:1 method:2 completion:0];
  }
  return numberOfPhotos != 0;
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4 = (UITapGestureRecognizer *)a3;
  v7.receiver = self;
  v7.super_class = (Class)NTKPhotosFaceView;
  BOOL v5 = ![(NTKBackgroundImageFaceView *)&v7 gestureRecognizerShouldBegin:v4]
    || (*((unsigned char *)self + 1240) & 8) == 0
    || self->_singleTapGesture == v4;

  return v5;
}

- (void)readerDidChange:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __37__NTKPhotosFaceView_readerDidChange___block_invoke;
  v6[3] = &unk_1E62C09C0;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

void *__37__NTKPhotosFaceView_readerDidChange___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _clearPreloaded];
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 1320);
  *(void *)(*(void *)(a1 + 32) + 1320) = [*(id *)(a1 + 40) count];
  uint64_t v3 = *(void *)(a1 + 32);
  if (*(void *)(v3 + 1320))
  {
    id v4 = [[_NTKPhotoIndexGenerator alloc] initWithSize:*(void *)(*(void *)(a1 + 32) + 1320)];
    uint64_t v5 = *(void *)(a1 + 32);
    id v6 = *(void **)(v5 + 1256);
    *(void *)(v5 + 1256) = v4;
  }
  else
  {
    id v6 = *(void **)(v3 + 1256);
    *(void *)(v3 + 1256) = 0;
  }

  double result = *(void **)(a1 + 32);
  uint64_t v8 = result[165];
  if (v2)
  {
    if (!v8)
    {
      return (void *)[result setNoPhotosViewVisible:1];
    }
  }
  else if (v8)
  {
    [result setNoPhotosViewVisible:0];
    id v9 = *(void **)(a1 + 32);
    uint64_t v10 = [v9 isInteractive];
    return (void *)[v9 _nextPhotoAnimated:v10 preroll:0 method:3 completion:0];
  }
  return result;
}

- (BOOL)_shouldAnimationContinue:(BOOL)a3
{
  if (a3
    && [(NTKFaceView *)self dataMode] == 1
    && [(NTKBasePhotosFaceView *)self isInteractive]
    && self->_numberOfPhotos)
  {
    return 1;
  }
  [(NTKPhotosFaceView *)self _resetTapAnimationState];
  return 0;
}

- (void)_displayCachedPhoto:(id)a3 animated:(BOOL)a4 preroll:(BOOL)a5 completion:(id)a6
{
  BOOL v7 = a5;
  BOOL v8 = a4;
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  double v11 = (void (**)(id, void))a6;
  if (v10 && ([v10 photo], int v12 = objc_claimAutoreleasedReturnValue(), v12, v12))
  {
    objc_super v13 = [v10 image];
    [v13 scale];
    double v15 = v14;
    [v13 size];
    if (!v13 || ((v18 = v15 * v17, v15 * v16 >= 1.0) ? (BOOL v19 = v18 < 1.0) : (BOOL v19 = 1), v19))
    {
      if (v11) {
        v11[2](v11, 0);
      }
    }
    else
    {
      v20 = NTKGenerateMonochromeColorMatrixFromImage(v13);
      [(NTKBasePhotosFaceView *)self setMonochromeColorMatrix:v20];

      v21 = [v10 photo];
      [v21 crop];
      CGFloat v23 = v22;
      CGFloat v25 = v24;
      CGFloat v27 = v26;
      CGFloat v29 = v28;

      v68.origin.x = v23;
      v68.origin.y = v25;
      v68.size.width = v27;
      v68.size.height = v29;
      if (CGRectIsEmpty(v68)) {
        goto LABEL_10;
      }
      v69.origin.x = v23;
      v69.origin.y = v25;
      v69.size.width = v27;
      v69.size.height = v29;
      v70.origin.x = v23;
      v70.origin.y = v25;
      v70.size.width = v27;
      v70.size.height = v29;
      if (!CGRectEqualToRect(v69, v70))
      {
LABEL_10:
        v30 = _NTKLoggingObjectForDomain(6, (uint64_t)"NTKLoggingDomainPhoto");
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
        {
          v53 = [v10 photo];
          v54 = [v53 localIdentifier];
          *(_DWORD *)location = 138413314;
          *(void *)&location[4] = v54;
          __int16 v59 = 2048;
          CGFloat v60 = v23;
          __int16 v61 = 2048;
          CGFloat v62 = v25;
          __int16 v63 = 2048;
          CGFloat v64 = v27;
          __int16 v65 = 2048;
          CGFloat v66 = v29;
          _os_log_error_impl(&dword_1BC5A9000, v30, OS_LOG_TYPE_ERROR, "Bad crop on photo %@: { %.1f, %.1f, %.1f, %.1f }", location, 0x34u);
        }
        v31 = [(NTKFaceView *)self device];
        NTKPhotosDefaultCropForImage(v13, v31);
        double v33 = v32;
        double v35 = v34;
        double v37 = v36;
        double v39 = v38;

        v40 = [v10 photo];
        objc_msgSend(v40, "setCrop:", v33, v35, v37, v39);
      }
      v41 = [(NTKBasePhotosFaceView *)self posterImageView];
      [v41 setPhoto:v10 allowIris:1];

      [(NTKPhotosFaceView *)self setPresentedPhoto:v10];
      if (v7)
      {
        v42 = [(NTKBasePhotosFaceView *)self posterImageView];
        int v43 = [v42 isPhotoIris];

        if (v43)
        {
          v44 = [(NTKBasePhotosFaceView *)self posterImageView];
          [v44 prepareToPlayWithMode:2];
        }
      }
      objc_initWeak((id *)location, self);
      v55[0] = MEMORY[0x1E4F143A8];
      v55[1] = 3221225472;
      v55[2] = __69__NTKPhotosFaceView__displayCachedPhoto_animated_preroll_completion___block_invoke;
      v55[3] = &unk_1E62C3398;
      objc_copyWeak(&v57, (id *)location);
      v56 = v11;
      uint64_t v45 = [(NTKPhotosFaceView *)self _updateDateAttributesAnimated:v8 completion:v55];
      if (NTKInternalBuild(v45, v46) && _os_feature_enabled_impl())
      {
        if (!self->_aplLabel)
        {
          v47 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
          aplLabel = self->_aplLabel;
          self->_aplLabel = v47;

          v49 = [MEMORY[0x1E4FB08E0] systemFontOfSize:20.0];
          [(UILabel *)self->_aplLabel setFont:v49];

          v50 = [MEMORY[0x1E4FB1618] whiteColor];
          [(UILabel *)self->_aplLabel setTextColor:v50];

          v51 = [MEMORY[0x1E4FB1618] blackColor];
          [(UILabel *)self->_aplLabel setBackgroundColor:v51];

          v52 = [(NTKBasePhotosFaceView *)self posterImageView];
          [v52 addSubview:self->_aplLabel];
        }
        CLKUIComputeImageAPL();
      }

      objc_destroyWeak(&v57);
      objc_destroyWeak((id *)location);
    }
  }
  else if (v11)
  {
    v11[2](v11, 0);
  }
}

void __69__NTKPhotosFaceView__displayCachedPhoto_animated_preroll_completion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _updateImageToBlur];
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    (*(void (**)(uint64_t, uint64_t))(v2 + 16))(v2, 1);
  }
}

- (BOOL)_enqueuePreloadedPhoto:(id)a3 ifMatchingGeneration:(unint64_t)a4
{
  id v6 = a3;
  unint64_t preloadGeneration = self->_preloadGeneration;
  if (preloadGeneration == a4) {
    [(NSMutableArray *)self->_preloaded enqueueCachedPhoto:v6];
  }
  id enqueuePreloadedPhotoCompletion = self->_enqueuePreloadedPhotoCompletion;
  if (enqueuePreloadedPhotoCompletion)
  {
    id v9 = (void (**)(void *, BOOL))_Block_copy(enqueuePreloadedPhotoCompletion);
    id v10 = self->_enqueuePreloadedPhotoCompletion;
    self->_id enqueuePreloadedPhotoCompletion = 0;

    v9[2](v9, preloadGeneration == a4);
  }

  return preloadGeneration == a4;
}

- (id)_dequeueToLoadIfMatchingGeneration:(unint64_t)a3
{
  if (self->_preloadGeneration == a3)
  {
    uint64_t v3 = [(NSMutableArray *)self->_toload dequeueCachedPhoto];
  }
  else
  {
    uint64_t v3 = 0;
  }

  return v3;
}

- (void)_startBackgroundRefill
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = [(NSMutableArray *)self->_preloaded count];
  unint64_t v4 = [(NSMutableArray *)self->_toload count] + v3;
  if (v4 < 2)
  {
    unint64_t preloadGeneration = (void *)self->_preloadGeneration;
    unint64_t v7 = 2 - v4;
    do
    {
      int64_t v8 = [(_NTKPhotoIndexGenerator *)self->_generator nextSequential];
      id v9 = [(NTKPhotosReader *)self->_reader objectAtIndexedSubscript:v8];
      id v10 = [[NTKCachedPhoto alloc] initWithPhoto:v9 index:v8];
      [(NSMutableArray *)self->_toload enqueueCachedPhoto:v10];

      --v7;
    }
    while (v7);
    objc_initWeak(&buf, self);
    if (_NTKPhotosLoadQueue_onceToken != -1) {
      dispatch_once(&_NTKPhotosLoadQueue_onceToken, &__block_literal_global_212);
    }
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __43__NTKPhotosFaceView__startBackgroundRefill__block_invoke;
    v12[3] = &unk_1E62C34B8;
    double v11 = (id)_NTKPhotosLoadQueue___photoLoadQueue;
    objc_copyWeak(v13, &buf);
    v13[1] = preloadGeneration;
    dispatch_async(v11, v12);

    objc_destroyWeak(v13);
    objc_destroyWeak(&buf);
  }
  else if (v3 >= 3)
  {
    uint64_t v5 = _NTKLoggingObjectForDomain(6, (uint64_t)"NTKLoggingDomainPhoto");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 67109376;
      HIDWORD(buf) = v3;
      __int16 v15 = 1024;
      int v16 = 2;
      _os_log_impl(&dword_1BC5A9000, v5, OS_LOG_TYPE_DEFAULT, "_preloaded.count (%d) higher than _NTKPhotosMaxPreloadedPhotos (%d)", (uint8_t *)&buf, 0xEu);
    }
  }
}

void __43__NTKPhotosFaceView__startBackgroundRefill__block_invoke(uint64_t a1)
{
  uint64_t v2 = (id *)(a1 + 32);
  unint64_t v3 = MEMORY[0x1E4F14428];
  do
  {
    id WeakRetained = objc_loadWeakRetained(v2);
    if (!WeakRetained) {
      break;
    }
    uint64_t v5 = WeakRetained;
    uint64_t v15 = 0;
    int v16 = &v15;
    uint64_t v17 = 0x3032000000;
    double v18 = __Block_byref_object_copy__15;
    BOOL v19 = __Block_byref_object_dispose__15;
    id v20 = 0;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __43__NTKPhotosFaceView__startBackgroundRefill__block_invoke_76;
    block[3] = &unk_1E62C3468;
    void block[4] = WeakRetained;
    block[5] = &v15;
    block[6] = *(void *)(a1 + 40);
    dispatch_sync(v3, block);
    id v6 = (void *)v16[5];
    if (!v6)
    {
      _Block_object_dispose(&v15, 8);

      return;
    }
    uint64_t v10 = 0;
    double v11 = &v10;
    uint64_t v12 = 0x2020000000;
    char v13 = 0;
    char v13 = [v6 load] ^ 1;
    if (*((unsigned char *)v11 + 24))
    {
      int v7 = 1;
    }
    else
    {
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __43__NTKPhotosFaceView__startBackgroundRefill__block_invoke_2;
      v9[3] = &unk_1E62C3490;
      v9[4] = v5;
      v9[5] = &v10;
      uint64_t v8 = *(void *)(a1 + 40);
      v9[6] = &v15;
      v9[7] = v8;
      dispatch_sync(v3, v9);

      int v7 = *((unsigned __int8 *)v11 + 24);
    }
    _Block_object_dispose(&v10, 8);
    _Block_object_dispose(&v15, 8);
  }
  while (!v7);
}

void __43__NTKPhotosFaceView__startBackgroundRefill__block_invoke_76(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _dequeueToLoadIfMatchingGeneration:*(void *)(a1 + 48)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  unint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

uint64_t __43__NTKPhotosFaceView__startBackgroundRefill__block_invoke_2(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _enqueuePreloadedPhoto:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) ifMatchingGeneration:*(void *)(a1 + 56)];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result ^ 1;
  return result;
}

- (void)_clearPreloaded
{
  [(NSMutableArray *)self->_preloaded removeAllObjects];
  [(NSMutableArray *)self->_toload removeAllObjects];
  ++self->_preloadGeneration;
  id enqueuePreloadedPhotoCompletion = self->_enqueuePreloadedPhotoCompletion;
  self->_id enqueuePreloadedPhotoCompletion = 0;
}

- (void)_nextPhotoReadyAnimated:(BOOL)a3 preroll:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  BOOL v6 = a3;
  preloaded = self->_preloaded;
  id v9 = a5;
  id v10 = [(NSMutableArray *)preloaded dequeueCachedPhoto];
  [(NTKPhotosFaceView *)self _displayCachedPhoto:v10 animated:v6 preroll:v5 completion:v9];

  [(NTKPhotosFaceView *)self _startBackgroundRefill];
}

- (void)_nextPhotoAnimated:(BOOL)a3 preroll:(BOOL)a4 method:(unint64_t)a5 completion:(id)a6
{
  BOOL v7 = a4;
  BOOL v8 = a3;
  id v10 = a6;
  double v11 = (void (**)(void, void))v10;
  if (self->_numberOfPhotos)
  {
    if ((a5 & 0xFFFFFFFFFFFFFFFELL) == 2)
    {
      uint64_t v12 = [(NTKPhotosFaceView *)self presentedPhoto];
      [(NTKPhotosFaceView *)self _clearPreloaded];
      if (a5 == 3)
      {
        [(_NTKPhotoIndexGenerator *)self->_generator reset];
      }
      else if (self->_numberOfPhotos >= 2 && v12 != 0)
      {
        -[_NTKPhotoIndexGenerator setIndex:](self->_generator, "setIndex:", [v12 index]);
      }
    }
    if ([(NSMutableArray *)self->_preloaded count])
    {
      [(NTKPhotosFaceView *)self _nextPhotoReadyAnimated:v8 preroll:v7 completion:v11];
    }
    else
    {
      if (a5 == 2)
      {
        int64_t v16 = [(_NTKPhotoIndexGenerator *)self->_generator nextRandom];
      }
      else
      {
        if (!a5)
        {
          objc_initWeak(&location, self);
          uint64_t v20 = MEMORY[0x1E4F143A8];
          uint64_t v21 = 3221225472;
          double v22 = __66__NTKPhotosFaceView__nextPhotoAnimated_preroll_method_completion___block_invoke;
          CGFloat v23 = &unk_1E62C34E0;
          objc_copyWeak(&v25, &location);
          BOOL v26 = v8;
          BOOL v27 = v7;
          double v24 = v11;
          double v14 = _Block_copy(&v20);
          id enqueuePreloadedPhotoCompletion = self->_enqueuePreloadedPhotoCompletion;
          self->_id enqueuePreloadedPhotoCompletion = v14;

          [(NTKPhotosFaceView *)self _startBackgroundRefill];
          objc_destroyWeak(&v25);
          objc_destroyWeak(&location);
          goto LABEL_25;
        }
        int64_t v16 = [(_NTKPhotoIndexGenerator *)self->_generator nextSequential];
      }
      int64_t v17 = v16;
      double v18 = [(NTKPhotosReader *)self->_reader objectAtIndexedSubscript:v16];
      BOOL v19 = [[NTKCachedPhoto alloc] initWithPhoto:v18 index:v17];
      if ([(NTKCachedPhoto *)v19 load])
      {
        [(NTKPhotosFaceView *)self _displayCachedPhoto:v19 animated:v8 preroll:v7 completion:v11];
        [(NTKPhotosFaceView *)self _startBackgroundRefill];
      }
      else if (v11)
      {
        v11[2](v11, 0);
      }
    }
  }
  else if (v10)
  {
    (*((void (**)(id, void))v10 + 2))(v10, 0);
  }
LABEL_25:
}

void __66__NTKPhotosFaceView__nextPhotoAnimated_preroll_method_completion___block_invoke(uint64_t a1, int a2)
{
  if (a2)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    [WeakRetained _nextPhotoReadyAnimated:*(unsigned __int8 *)(a1 + 48) preroll:*(unsigned __int8 *)(a1 + 49) completion:*(void *)(a1 + 32)];
  }
  else
  {
    uint64_t v3 = *(void *)(a1 + 32);
    if (v3)
    {
      unint64_t v4 = *(void (**)(void))(v3 + 16);
      v4();
    }
  }
}

- (void)_animationFinished:(BOOL)a3
{
  BOOL v3 = a3;
  [(UIView *)self->_photoTransitionSnapshotView removeFromSuperview];
  photoTransitionSnapshotView = self->_photoTransitionSnapshotView;
  self->_photoTransitionSnapshotView = 0;

  *((unsigned char *)self + 1240) &= ~8u;
  if (self->_queuedTransitionCount) {
    BOOL v6 = !v3;
  }
  else {
    BOOL v6 = 1;
  }
  if (!v6 && [(NTKFaceView *)self dataMode] == 1)
  {
    --self->_queuedTransitionCount;
    [(NTKPhotosFaceView *)self _handleSingleTap:0];
  }
}

- (void)_animationStart
{
  memset(&v14, 0, sizeof(v14));
  CGAffineTransformMakeScale(&v14, 0.95, 0.95);
  CGAffineTransform v13 = v14;
  BOOL v3 = [(NTKBasePhotosFaceView *)self cornerView];
  CGAffineTransform v12 = v13;
  [v3 setTransform:&v12];

  CGAffineTransform v11 = v14;
  unint64_t v4 = [(NTKBasePhotosFaceView *)self posterImageView];
  CGAffineTransform v10 = v11;
  [v4 setTransform:&v10];

  BOOL v5 = [(NTKBasePhotosFaceView *)self posterImageView];
  [v5 setAlpha:0.0];

  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __36__NTKPhotosFaceView__animationStart__block_invoke;
  v9[3] = &unk_1E62BFF20;
  v9[4] = self;
  [MEMORY[0x1E4FB1EB0] animateWithDuration:2 delay:v9 options:0 animations:0.25 completion:0.1];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __36__NTKPhotosFaceView__animationStart__block_invoke_2;
  v8[3] = &unk_1E62BFF20;
  v8[4] = self;
  [MEMORY[0x1E4FB1EB0] animateWithDuration:2 delay:v8 options:0 animations:0.25 completion:0.0];
  v6[4] = self;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __36__NTKPhotosFaceView__animationStart__block_invoke_3;
  v7[3] = &unk_1E62BFF20;
  v7[4] = self;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __36__NTKPhotosFaceView__animationStart__block_invoke_4;
  v6[3] = &unk_1E62C2648;
  [MEMORY[0x1E4FB1EB0] animateWithDuration:131074 delay:v7 options:v6 animations:0.8 completion:0.0];
}

void __36__NTKPhotosFaceView__animationStart__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) posterImageView];
  long long v6 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  v8[0] = *MEMORY[0x1E4F1DAB8];
  long long v5 = v8[0];
  v8[1] = v6;
  long long v9 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  long long v4 = v9;
  [v2 setTransform:v8];

  BOOL v3 = [*(id *)(a1 + 32) cornerView];
  v7[0] = v5;
  v7[1] = v6;
  v7[2] = v4;
  [v3 setTransform:v7];
}

uint64_t __36__NTKPhotosFaceView__animationStart__block_invoke_2(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 1288) setAlpha:0.0];
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 1296);

  return [v2 setAlpha:0.0];
}

void __36__NTKPhotosFaceView__animationStart__block_invoke_3(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) posterImageView];
  [v1 setAlpha:1.0];
}

uint64_t __36__NTKPhotosFaceView__animationStart__block_invoke_4(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _animationFinished:a2];
}

- (void)_handleSingleTap:(id)a3
{
  id v4 = a3;
  if ([(NTKBasePhotosFaceView *)self isInteractive]
    && self->_numberOfPhotos >= 2
    && (*((unsigned char *)self + 1240) & 2) == 0)
  {
    if ((*((unsigned char *)self + 1240) & 8) != 0)
    {
      unint64_t queuedTransitionCount = self->_queuedTransitionCount;
      if (queuedTransitionCount <= 1) {
        self->_unint64_t queuedTransitionCount = queuedTransitionCount + 1;
      }
    }
    else
    {
      *((unsigned char *)self + 1240) |= 8u;
      long long v5 = [(NTKBasePhotosFaceView *)self posterImageView];
      long long v6 = [v5 snapshotViewAfterScreenUpdates:0];
      photoTransitionSnapshotView = self->_photoTransitionSnapshotView;
      self->_photoTransitionSnapshotView = v6;

      [(UIView *)self->_photoTransitionCornerView setAlpha:1.0];
      BOOL v8 = [(NTKFaceView *)self contentView];
      [v8 insertSubview:self->_photoTransitionSnapshotView belowSubview:self->_photoTransitionCornerView];

      objc_initWeak(&location, self);
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __38__NTKPhotosFaceView__handleSingleTap___block_invoke;
      v10[3] = &unk_1E62C3508;
      objc_copyWeak(&v11, &location);
      v10[4] = self;
      [(NTKPhotosFaceView *)self _nextPhotoAnimated:1 preroll:1 method:0 completion:v10];
      objc_destroyWeak(&v11);
      objc_destroyWeak(&location);
    }
  }
}

void __38__NTKPhotosFaceView__handleSingleTap___block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  long long v5 = WeakRetained;
  if (WeakRetained)
  {
    long long v9 = WeakRetained;
    int v6 = [WeakRetained _shouldAnimationContinue:a2];
    long long v5 = v9;
    if (v6)
    {
      BOOL v7 = [v9 posterImageView];
      int v8 = [v7 isPhotoIris];

      if (v8) {
        [*(id *)(a1 + 32) _playIrisOnSingleTap];
      }
      else {
        [v9 _animationStart];
      }
      long long v5 = v9;
    }
  }
}

- (void)_resetTapAnimationState
{
  [(UIView *)self->_photoTransitionSnapshotView removeFromSuperview];
  photoTransitionSnapshotView = self->_photoTransitionSnapshotView;
  self->_photoTransitionSnapshotView = 0;

  *((unsigned char *)self + 1240) &= ~8u;
  self->_unint64_t queuedTransitionCount = 0;
}

- (void)_updateDateAttributesAnimated:(BOOL)a3
{
}

- (void)_updateDateAttributesAnimated:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  int v6 = (void (**)(void))a4;
  unint64_t currentContent = self->_currentContent;
  switch(currentContent)
  {
    case 2uLL:
LABEL_4:
      int v8 = [(NTKPhotosFaceView *)self presentedPhoto];
      long long v9 = [(NTKPhotosFaceView *)self _analysisCacheKeyFor:v8];

      uint64_t v32 = 0;
      double v33 = &v32;
      uint64_t v34 = 0x3032000000;
      double v35 = __Block_byref_object_copy__15;
      double v36 = __Block_byref_object_dispose__15;
      id v37 = [(NTKPhotosFaceView *)self _cachedAnalysisForKey:v9];
      uint64_t v10 = v33[5];
      if (v10)
      {
        [(NTKBasePhotosFaceView *)self _setDateAttributes:v10 animated:v4];
      }
      else
      {
        CGAffineTransform v12 = [(NTKPhotosFaceView *)self presentedPhoto];
        CGAffineTransform v13 = [v12 image];

        if (v13)
        {
          objc_initWeak(&location, self);
          currentAnalysisOperationID = (void *)self->_currentAnalysisOperationID;
          uint64_t v15 = [(NTKPhotosFaceView *)self presentedPhoto];
          int64_t v16 = [v15 image];

          int64_t v17 = [(NTKBasePhotosFaceView *)self dateAlignment];
          double v18 = _NTKPhotosAnalysisQueue();
          block[0] = MEMORY[0x1E4F143A8];
          block[1] = 3221225472;
          block[2] = __62__NTKPhotosFaceView__updateDateAttributesAnimated_completion___block_invoke;
          block[3] = &unk_1E62C3558;
          objc_copyWeak(v29, &location);
          v29[1] = currentAnalysisOperationID;
          double v28 = &v32;
          id v19 = v9;
          v29[2] = v17;
          id v25 = v19;
          id v26 = v16;
          BOOL v30 = v4;
          BOOL v27 = v6;
          id v20 = v16;
          dispatch_async(v18, block);

          objc_destroyWeak(v29);
          objc_destroyWeak(&location);
LABEL_12:
          _Block_object_dispose(&v32, 8);

          goto LABEL_19;
        }
      }
      if (v6) {
        v6[2](v6);
      }
      goto LABEL_12;
    case 1uLL:
      id v11 = [(NTKPhotosFaceView *)self _analysisForAlignment:[(NTKBasePhotosFaceView *)self dateAlignment]];
      if (v11) {
        goto LABEL_9;
      }
      uint64_t v21 = _NTKLoggingObjectForDomain(6, (uint64_t)"NTKLoggingDomainPhoto");
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
        -[NTKPhotosFaceView _updateDateAttributesAnimated:completion:](self, v21);
      }

      if (NTKInternalBuild(v22, v23))
      {
        id v11 = +[NTKPhotoAnalysis invalidAnalysis];
        if (v11)
        {
LABEL_9:
          [(NTKBasePhotosFaceView *)self _setDateAttributes:v11 animated:v4];
        }
      }
      break;
    case 0uLL:
      goto LABEL_4;
  }
  if (v6) {
    v6[2](v6);
  }
LABEL_19:
}

void __62__NTKPhotosFaceView__updateDateAttributesAnimated_completion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if ([WeakRetained _canOperationProceed:*(void *)(a1 + 72)])
  {
    uint64_t v3 = [WeakRetained _createAndCachePhotoAnalysisForKey:*(void *)(a1 + 32) dateAlignment:*(void *)(a1 + 80) image:*(void *)(a1 + 40)];
    uint64_t v4 = *(void *)(*(void *)(a1 + 56) + 8);
    long long v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = v3;

    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __62__NTKPhotosFaceView__updateDateAttributesAnimated_completion___block_invoke_2;
    block[3] = &unk_1E62C3530;
    void block[4] = WeakRetained;
    id v12 = *(id *)(a1 + 40);
    char v14 = *(unsigned char *)(a1 + 88);
    long long v8 = *(_OWORD *)(a1 + 48);
    id v6 = (id)v8;
    long long v13 = v8;
    dispatch_sync(MEMORY[0x1E4F14428], block);

    BOOL v7 = v12;
LABEL_5:

    goto LABEL_6;
  }
  if (*(void *)(a1 + 48))
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __62__NTKPhotosFaceView__updateDateAttributesAnimated_completion___block_invoke_3;
    v9[3] = &unk_1E62C0718;
    id v10 = *(id *)(a1 + 48);
    dispatch_async(MEMORY[0x1E4F14428], v9);
    BOOL v7 = v10;
    goto LABEL_5;
  }
LABEL_6:
}

uint64_t __62__NTKPhotosFaceView__updateDateAttributesAnimated_completion___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) _operationIsDone];
  uint64_t v2 = *(void **)(a1 + 40);
  uint64_t v3 = [*(id *)(a1 + 32) presentedPhoto];
  uint64_t v4 = [v3 image];

  if (v2 == v4) {
    [*(id *)(a1 + 32) _setDateAttributes:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) animated:*(unsigned __int8 *)(a1 + 64)];
  }
  uint64_t result = *(void *)(a1 + 48);
  if (result)
  {
    id v6 = *(uint64_t (**)(void))(result + 16);
    return v6();
  }
  return result;
}

uint64_t __62__NTKPhotosFaceView__updateDateAttributesAnimated_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)_canOperationProceed:(unint64_t)a3
{
  long long v5 = _NTKPhotosAnalysisQueue();
  dispatch_assert_queue_V2(v5);

  uint64_t v8 = 0;
  long long v9 = &v8;
  uint64_t v10 = 0x2020000000;
  char v11 = 0;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __42__NTKPhotosFaceView__canOperationProceed___block_invoke;
  block[3] = &unk_1E62C3580;
  void block[5] = &v8;
  block[6] = a3;
  void block[4] = self;
  dispatch_sync(MEMORY[0x1E4F14428], block);
  LOBYTE(a3) = *((unsigned char *)v9 + 24);
  _Block_object_dispose(&v8, 8);
  return a3;
}

void *__42__NTKPhotosFaceView__canOperationProceed___block_invoke(void *result)
{
  uint64_t v1 = result[4];
  if ((*(unsigned char *)(v1 + 1240) & 4) == 0 && result[6] == *(void *)(v1 + 1272))
  {
    *(unsigned char *)(v1 + 1240) |= 4u;
    *(unsigned char *)(*(void *)(result[5] + 8) + 24) = 1;
  }
  return result;
}

- (void)_operationIsDone
{
  *((unsigned char *)self + 1240) &= ~4u;
}

- (void)_updateContents:(BOOL)a3
{
  BOOL v3 = a3;
  long long v5 = _NTKLoggingObjectForDomain(6, (uint64_t)"NTKLoggingDomainPhoto");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_1BC5A9000, v5, OS_LOG_TYPE_DEFAULT, "NTKPhotosFaceView: _updateContents", v6, 2u);
  }

  if (*((unsigned char *)self + 1240))
  {
    [(NTKPhotosFaceView *)self _updateReader:v3];
    [(NTKBasePhotosFaceView *)self setNoPhotosViewVisible:self->_numberOfPhotos == 0];
    [(NTKPhotosFaceView *)self _nextPhotoAnimated:[(NTKBasePhotosFaceView *)self isInteractive] preroll:0 method:3 completion:0];
  }
}

- (void)_updateReader:(BOOL)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if (self->_currentContent != 2989)
  {
    generator = [(NTKFaceView *)self resourceDirectory];
    if (!a3)
    {
      reader = self->_reader;
      if (reader)
      {
        long long v9 = [(NTKPhotosReader *)reader resourceDirectory];
        char v10 = NTKEqualStrings(v9, generator);

        if (v10)
        {
          p_super = _NTKLoggingObjectForDomain(6, (uint64_t)"NTKLoggingDomainPhoto");
          if (os_log_type_enabled(p_super, OS_LOG_TYPE_DEFAULT))
          {
            LOWORD(v20) = 0;
            _os_log_impl(&dword_1BC5A9000, p_super, OS_LOG_TYPE_DEFAULT, "_updateReader: resource dir didn't change; re-using existing reader",
              (uint8_t *)&v20,
              2u);
          }
LABEL_24:

          goto LABEL_25;
        }
      }
    }
    [(NTKPhotosFaceView *)self _clearPreloaded];
    unint64_t currentContent = self->_currentContent;
    if (currentContent)
    {
      if (currentContent == 1)
      {
        long long v13 = +[NTKPhotosReader readerForResourceDirectory:generator];
      }
      else
      {
        if (currentContent != 2) {
          goto LABEL_17;
        }
        long long v13 = +[NTKPhotosReader readerForMemoriesWithResourceDirectory:generator];
      }
    }
    else
    {
      long long v13 = +[NTKPhotosReader readerForSyncedAlbumWithResourceDirectory:generator];
    }
    char v14 = self->_reader;
    self->_reader = v13;

LABEL_17:
    [(NTKPhotosReader *)self->_reader setDelegate:self];
    unint64_t v15 = [(NTKPhotosReader *)self->_reader count];
    self->_unint64_t numberOfPhotos = v15;
    int64_t v16 = _NTKLoggingObjectForDomain(6, (uint64_t)"NTKLoggingDomainPhoto");
    int64_t v17 = v16;
    if (v15)
    {
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        unint64_t numberOfPhotos = self->_numberOfPhotos;
        int v20 = 138412546;
        uint64_t v21 = generator;
        __int16 v22 = 2048;
        unint64_t v23 = numberOfPhotos;
        _os_log_impl(&dword_1BC5A9000, v17, OS_LOG_TYPE_DEFAULT, "_updateReader: new reader for resource directory %@ (%ld)", (uint8_t *)&v20, 0x16u);
      }

      id v19 = [[_NTKPhotoIndexGenerator alloc] initWithSize:self->_numberOfPhotos];
      p_super = &self->_generator->super;
      self->_generator = v19;
    }
    else
    {
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        -[NTKPhotosFaceView _updateReader:]((uint64_t)generator, v17);
      }

      p_super = &self->_generator->super;
      self->_generator = 0;
    }
    goto LABEL_24;
  }
  uint64_t v4 = _NTKLoggingObjectForDomain(6, (uint64_t)"NTKLoggingDomainPhoto");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    -[NTKPhotosFaceView _updateReader:](v4);
  }

  [(NTKPhotosFaceView *)self _clearPreloaded];
  self->_unint64_t numberOfPhotos = 0;
  long long v5 = self->_reader;
  self->_reader = 0;

  generator = self->_generator;
  self->_generator = 0;
LABEL_25:
}

- (id)_analysisForAlignment:(unint64_t)a3
{
  long long v5 = [(NTKPhotosFaceView *)self presentedPhoto];
  id v6 = [v5 photo];
  BOOL v7 = [v6 analysisForAlignment:a3 deviceSizeClass:self->_deviceSizeClass];

  return v7;
}

- (id)_analysisCacheKeyFor:(id)a3
{
  uint64_t v4 = [a3 photo];
  unint64_t v5 = [(NTKBasePhotosFaceView *)self dateAlignment];
  switch(CLKDeviceCategoryForSizeClass())
  {
    case 1:
      BOOL v6 = v5 == 0;
      unsigned int v7 = 66;
      unsigned int v8 = 84;
      goto LABEL_8;
    case 2:
      BOOL v6 = v5 == 0;
      unsigned int v7 = 82;
      unsigned int v8 = 76;
      goto LABEL_8;
    case 3:
      BOOL v6 = v5 == 0;
      unsigned int v7 = 83;
      unsigned int v8 = 70;
      goto LABEL_8;
    case 4:
      BOOL v6 = v5 == 0;
      unsigned int v7 = 79;
      unsigned int v8 = 73;
      goto LABEL_8;
    case 5:
      BOOL v6 = v5 == 0;
      unsigned int v7 = 68;
      unsigned int v8 = 85;
LABEL_8:
      if (v6) {
        uint64_t v9 = v8;
      }
      else {
        uint64_t v9 = v7;
      }
      break;
    default:
      uint64_t v9 = 45;
      break;
  }
  char v10 = NSString;
  char v11 = [v4 localIdentifier];
  id v12 = [v4 modificationDate];
  long long v13 = [v10 stringWithFormat:@"%@~%@~%u~%c", v11, v12, 1, v9];

  return v13;
}

- (id)_cachedAnalysisForKey:(id)a3
{
  id v3 = a3;
  uint64_t v4 = +[NTKPhotoAnalysisFileCache sharedInstance];
  unint64_t v5 = [v4 photoAnalysisForIdentifier:v3];

  return v5;
}

- (id)_createAndCachePhotoAnalysisForKey:(id)a3 dateAlignment:(unint64_t)a4 image:(id)a5
{
  unint64_t deviceSizeClass = self->_deviceSizeClass;
  id v8 = a3;
  uint64_t v9 = +[NTKPhotoAnalysis analysisWithImage:a5 alignment:a4 deviceSizeClass:deviceSizeClass];
  char v10 = +[NTKPhotoAnalysisFileCache sharedInstance];
  [v10 setPhotoAnalysis:v9 forIdentifier:v8];

  return v9;
}

- (NTKCachedPhoto)presentedPhoto
{
  return self->_presentedPhoto;
}

- (void)setPresentedPhoto:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_presentedPhoto, 0);
  objc_storeStrong((id *)&self->_aplLabel, 0);
  objc_storeStrong((id *)&self->_toload, 0);
  objc_storeStrong((id *)&self->_preloaded, 0);
  objc_storeStrong(&self->_enqueuePreloadedPhotoCompletion, 0);
  objc_storeStrong((id *)&self->_photoTransitionCornerView, 0);
  objc_storeStrong((id *)&self->_photoTransitionSnapshotView, 0);
  objc_storeStrong((id *)&self->_singleTapGesture, 0);
  objc_storeStrong((id *)&self->_generator, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

- (void)_updateDateAttributesAnimated:(void *)a1 completion:(NSObject *)a2 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = [a1 presentedPhoto];
  uint64_t v4 = [v3 photo];
  unint64_t v5 = [v4 imageURL];
  int v6 = 138412290;
  unsigned int v7 = v5;
  _os_log_error_impl(&dword_1BC5A9000, a2, OS_LOG_TYPE_ERROR, "photo analysis missing for %@", (uint8_t *)&v6, 0xCu);
}

- (void)_updateReader:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_1BC5A9000, log, OS_LOG_TYPE_ERROR, "NTKPhotosFaceView: _createReader: _currentContent has not yet been set; no photos today!",
    v1,
    2u);
}

- (void)_updateReader:(uint64_t)a1 .cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1BC5A9000, a2, OS_LOG_TYPE_ERROR, "_updateReader: new reader for resource directory %@ is empty!", (uint8_t *)&v2, 0xCu);
}

@end
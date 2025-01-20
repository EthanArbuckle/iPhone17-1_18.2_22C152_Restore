@interface PUPhotoBrowserOneUpPresentationAdaptor
- (BOOL)_shouldDisableScroll;
- (NSSet)_photoTokensForHiddenAssetReferences;
- (PUPhotoBrowserZoomTransitionDelegate)zoomTransitionDelegate;
- (id)_photoTokenForAssetReference:(id)a3;
- (id)oneUpPresentationHelper:(id)a3 currentImageForAssetReference:(id)a4;
- (id)oneUpPresentationHelper:(id)a3 regionOfInterestForAssetReference:(id)a4 cropInsets:(UIEdgeInsets *)a5;
- (void)_setPhotoTokensForHiddenAssetReferences:(id)a3;
- (void)_setShouldDisableScroll:(BOOL)a3;
- (void)oneUpPresentationHelper:(id)a3 scrollAssetReferenceToVisible:(id)a4;
- (void)oneUpPresentationHelper:(id)a3 shouldDisableScroll:(BOOL)a4;
- (void)oneUpPresentationHelper:(id)a3 shouldHideAssetReferences:(id)a4;
- (void)setZoomTransitionDelegate:(id)a3;
@end

@implementation PUPhotoBrowserOneUpPresentationAdaptor

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__photoTokensForHiddenAssetReferences, 0);
  objc_destroyWeak((id *)&self->_zoomTransitionDelegate);
}

- (BOOL)_shouldDisableScroll
{
  return self->__shouldDisableScroll;
}

- (NSSet)_photoTokensForHiddenAssetReferences
{
  return self->__photoTokensForHiddenAssetReferences;
}

- (PUPhotoBrowserZoomTransitionDelegate)zoomTransitionDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_zoomTransitionDelegate);
  return (PUPhotoBrowserZoomTransitionDelegate *)WeakRetained;
}

- (void)oneUpPresentationHelper:(id)a3 shouldDisableScroll:(BOOL)a4
{
}

- (void)oneUpPresentationHelper:(id)a3 scrollAssetReferenceToVisible:(id)a4
{
  id v6 = [(PUPhotoBrowserOneUpPresentationAdaptor *)self _photoTokenForAssetReference:a4];
  v5 = [(PUPhotoBrowserOneUpPresentationAdaptor *)self zoomTransitionDelegate];
  [v5 zoomTransition:0 getFrame:0 inCoordinateSpace:0 contentMode:0 cropInsets:0 forPhotoToken:v6 operation:2];
}

- (void)oneUpPresentationHelper:(id)a3 shouldHideAssetReferences:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithCapacity:", objc_msgSend(v5, "count"));
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v14;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = -[PUPhotoBrowserOneUpPresentationAdaptor _photoTokenForAssetReference:](self, "_photoTokenForAssetReference:", *(void *)(*((void *)&v13 + 1) + 8 * v11), (void)v13);
        if (v12) {
          [v6 addObject:v12];
        }

        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v9);
  }

  [(PUPhotoBrowserOneUpPresentationAdaptor *)self _setPhotoTokensForHiddenAssetReferences:v6];
}

- (id)oneUpPresentationHelper:(id)a3 currentImageForAssetReference:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v14 = 0;
  long long v15 = &v14;
  uint64_t v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__54944;
  uint64_t v18 = __Block_byref_object_dispose__54945;
  id v19 = 0;
  if (self->_zoomTransitionDelegateFlags.respondsToTransitionImageForPhotoToken)
  {
    uint64_t v8 = [(PUPhotoBrowserOneUpPresentationAdaptor *)self _photoTokenForAssetReference:v7];
    uint64_t v9 = [(PUPhotoBrowserOneUpPresentationAdaptor *)self zoomTransitionDelegate];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __96__PUPhotoBrowserOneUpPresentationAdaptor_oneUpPresentationHelper_currentImageForAssetReference___block_invoke;
    v13[3] = &unk_1E5F28918;
    v13[4] = &v14;
    [v9 zoomTransition:0 transitionImageForPhotoToken:v8 callback:v13];

    uint64_t v10 = (void *)v15[5];
  }
  else
  {
    uint64_t v10 = 0;
  }
  id v11 = v10;
  _Block_object_dispose(&v14, 8);

  return v11;
}

void __96__PUPhotoBrowserOneUpPresentationAdaptor_oneUpPresentationHelper_currentImageForAssetReference___block_invoke(uint64_t a1, void *a2)
{
}

- (id)oneUpPresentationHelper:(id)a3 regionOfInterestForAssetReference:(id)a4 cropInsets:(UIEdgeInsets *)a5
{
  id v7 = a4;
  CGSize v8 = *(CGSize *)(MEMORY[0x1E4F1DB20] + 16);
  v28.origin = (CGPoint)*MEMORY[0x1E4F1DB20];
  v28.size = v8;
  uint64_t v27 = 0;
  uint64_t v9 = [(PUPhotoBrowserOneUpPresentationAdaptor *)self _photoTokenForAssetReference:v7];
  uint64_t v10 = [(PUPhotoBrowserOneUpPresentationAdaptor *)self zoomTransitionDelegate];
  id v26 = 0;
  [v10 zoomTransition:0 getFrame:&v28 inCoordinateSpace:&v26 contentMode:&v27 cropInsets:a5 forPhotoToken:v9 operation:0];
  id v11 = v26;

  if (v27 == 1)
  {
    v12 = [v7 asset];
    [v12 aspectRatio];
    double v14 = v13;

    double x = PURectWithAspectRatioFittingRect(v14, v28.origin.x, v28.origin.y, v28.size.width, v28.size.height);
    v28.origin.double x = x;
    v28.origin.CGFloat y = y;
    v28.size.CGFloat width = width;
    v28.size.CGFloat height = height;
  }
  else
  {
    CGFloat y = v28.origin.y;
    double x = v28.origin.x;
    CGFloat height = v28.size.height;
    CGFloat width = v28.size.width;
  }
  if (CGRectIsNull(*(CGRect *)&x))
  {
    id v19 = PXAssertGetLog();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1AE9F8000, v19, OS_LOG_TYPE_ERROR, "Supplied rect from zoom transition for creating region of interest was CGRectNull", buf, 2u);
    }
  }
  if (!v11)
  {
    v20 = PXAssertGetLog();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1AE9F8000, v20, OS_LOG_TYPE_ERROR, "Supplied coordinateSpace from zoom transition for creating region of interest was nil", buf, 2u);
    }
  }
  BOOL IsNull = CGRectIsNull(v28);
  v22 = 0;
  if (v11 && !IsNull)
  {
    id v23 = objc_alloc(MEMORY[0x1E4F912B8]);
    v22 = objc_msgSend(v23, "initWithRect:inCoordinateSpace:", v11, *(_OWORD *)&v28.origin, *(_OWORD *)&v28.size);
  }

  return v22;
}

- (void)_setShouldDisableScroll:(BOOL)a3
{
  if (self->__shouldDisableScroll == a3) {
    return;
  }
  BOOL v3 = a3;
  self->__shouldDisableScroll = a3;
  id v5 = [(PUPhotoBrowserOneUpPresentationAdaptor *)self zoomTransitionDelegate];
  if (v3)
  {
    if (self->_zoomTransitionDelegateFlags.respondsToWillBeginForOperation)
    {
      id v6 = v5;
      [v5 zoomTransition:0 willBeginForOperation:1 animated:1 interactive:1];
LABEL_7:
      id v5 = v6;
    }
  }
  else if (self->_zoomTransitionDelegateFlags.respondsToDidFinishForOperation)
  {
    id v6 = v5;
    [v5 zoomTransition:0 didFinishForOperation:1 animated:1 interactive:1];
    goto LABEL_7;
  }
}

- (void)_setPhotoTokensForHiddenAssetReferences:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  v4 = (NSSet *)a3;
  id v5 = v4;
  if (self->__photoTokensForHiddenAssetReferences != v4 && (-[NSSet isEqual:](v4, "isEqual:") & 1) == 0)
  {
    id v6 = self->__photoTokensForHiddenAssetReferences;
    id v7 = (NSSet *)[(NSSet *)v5 copy];
    photoTokensForHiddenAssetReferences = self->__photoTokensForHiddenAssetReferences;
    self->__photoTokensForHiddenAssetReferences = v7;

    uint64_t v9 = [(PUPhotoBrowserOneUpPresentationAdaptor *)self zoomTransitionDelegate];
    uint64_t v10 = v9;
    if (self->_zoomTransitionDelegateFlags.respondsToShouldHidePhotosTokens)
    {
      [v9 zoomTransition:0 shouldHidePhotoTokens:v5];
    }
    else if (self->_zoomTransitionDelegateFlags.respondsToSetVisibilityForPhotoToken)
    {
      long long v29 = 0u;
      long long v30 = 0u;
      long long v27 = 0u;
      long long v28 = 0u;
      id v11 = v6;
      uint64_t v12 = [(NSSet *)v11 countByEnumeratingWithState:&v27 objects:v32 count:16];
      if (v12)
      {
        uint64_t v13 = v12;
        uint64_t v14 = *(void *)v28;
        do
        {
          for (uint64_t i = 0; i != v13; ++i)
          {
            if (*(void *)v28 != v14) {
              objc_enumerationMutation(v11);
            }
            uint64_t v16 = *(void *)(*((void *)&v27 + 1) + 8 * i);
            if (![(NSSet *)v5 containsObject:v16]) {
              [v10 zoomTransition:0 setVisibility:1 forPhotoToken:v16];
            }
          }
          uint64_t v13 = [(NSSet *)v11 countByEnumeratingWithState:&v27 objects:v32 count:16];
        }
        while (v13);
      }

      long long v25 = 0u;
      long long v26 = 0u;
      long long v23 = 0u;
      long long v24 = 0u;
      v17 = v5;
      uint64_t v18 = [(NSSet *)v17 countByEnumeratingWithState:&v23 objects:v31 count:16];
      if (v18)
      {
        uint64_t v19 = v18;
        uint64_t v20 = *(void *)v24;
        do
        {
          for (uint64_t j = 0; j != v19; ++j)
          {
            if (*(void *)v24 != v20) {
              objc_enumerationMutation(v17);
            }
            uint64_t v22 = *(void *)(*((void *)&v23 + 1) + 8 * j);
            if (!-[NSSet containsObject:](v11, "containsObject:", v22, (void)v23)) {
              [v10 zoomTransition:0 setVisibility:0 forPhotoToken:v22];
            }
          }
          uint64_t v19 = [(NSSet *)v17 countByEnumeratingWithState:&v23 objects:v31 count:16];
        }
        while (v19);
      }
    }
  }
}

- (id)_photoTokenForAssetReference:(id)a3
{
  id v4 = a3;
  id v5 = [v4 asset];
  id v6 = [v4 assetCollection];

  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass()))
  {
    id v7 = [(PUPhotoBrowserOneUpPresentationAdaptor *)self zoomTransitionDelegate];
    CGSize v8 = [v7 zoomTransition:0 photoTokenForPhoto:v5 inCollection:v6];
  }
  else
  {
    CGSize v8 = 0;
  }

  return v8;
}

- (void)setZoomTransitionDelegate:(id)a3
{
  obuint64_t j = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_zoomTransitionDelegate);

  if (WeakRetained != obj)
  {
    id v5 = [(PUPhotoBrowserOneUpPresentationAdaptor *)self _photoTokensForHiddenAssetReferences];
    BOOL v6 = [(PUPhotoBrowserOneUpPresentationAdaptor *)self _shouldDisableScroll];
    [(PUPhotoBrowserOneUpPresentationAdaptor *)self _setPhotoTokensForHiddenAssetReferences:0];
    [(PUPhotoBrowserOneUpPresentationAdaptor *)self _setShouldDisableScroll:0];
    objc_storeWeak((id *)&self->_zoomTransitionDelegate, obj);
    self->_zoomTransitionDelegateFlags.respondsToTransitionImageForPhotoToken = objc_opt_respondsToSelector() & 1;
    self->_zoomTransitionDelegateFlags.respondsToWillBeginForOperation = objc_opt_respondsToSelector() & 1;
    self->_zoomTransitionDelegateFlags.respondsToDidFinishForOperation = objc_opt_respondsToSelector() & 1;
    self->_zoomTransitionDelegateFlags.respondsToWillBeginAnimationForOperation = objc_opt_respondsToSelector() & 1;
    self->_zoomTransitionDelegateFlags.respondsToDidFinishAnimationForOperation = objc_opt_respondsToSelector() & 1;
    self->_zoomTransitionDelegateFlags.respondsToShouldHidePhotosTokens = objc_opt_respondsToSelector() & 1;
    self->_zoomTransitionDelegateFlags.respondsToSetVisibilityForPhotoToken = objc_opt_respondsToSelector() & 1;
    [(PUPhotoBrowserOneUpPresentationAdaptor *)self _setPhotoTokensForHiddenAssetReferences:v5];
    [(PUPhotoBrowserOneUpPresentationAdaptor *)self _setShouldDisableScroll:v6];
  }
}

@end
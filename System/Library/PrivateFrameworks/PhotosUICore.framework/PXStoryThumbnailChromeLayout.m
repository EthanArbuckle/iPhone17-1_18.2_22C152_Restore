@interface PXStoryThumbnailChromeLayout
- (BOOL)isFavorite;
- (Class)viewClassForSpriteAtIndex:(unsigned int)a3 inLayout:(id)a4;
- (NSIndexSet)axSpriteIndexes;
- (NSNumber)alphaOverride;
- (PXStoryLayoutSpec)spec;
- (PXStoryModel)model;
- (PXStoryThumbnailActionPerformer)actionPerformer;
- (PXStoryThumbnailChromeLayout)init;
- (PXStoryThumbnailChromeLayout)initWithModel:(id)a3;
- (double)scaleFromTopRightCorner;
- (id)_baseConfigurationForButtonWithSystemImageName:(id)a3;
- (id)_buttonConfigurationForSpriteIndex:(unsigned int)a3;
- (id)viewUserDataForSpriteAtIndex:(unsigned int)a3 inLayout:(id)a4;
- (unint64_t)axFocusabilityForSpriteAtIndex:(unsigned int)a3;
- (void)_handleDetailsViewButton:(id)a3;
- (void)_handleFavoriteButton:(id)a3;
- (void)_handlePlayButton:(id)a3;
- (void)_invalidateContent;
- (void)_invalidateContentAlpha;
- (void)_invalidateContentVersion;
- (void)_invalidateIsFavorite;
- (void)_invalidateTransform;
- (void)_updateContent;
- (void)_updateContentAlpha;
- (void)_updateIsFavorite;
- (void)_updateTransform;
- (void)alphaDidChange;
- (void)getDetailedPresentedPlacement:(id)a3 forItemReference:(id)a4;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
- (void)referenceSizeDidChange;
- (void)setAlphaOverride:(id)a3;
- (void)setDetailedPlacementOverride:(id)a3 forItemReference:(id)a4;
- (void)setIsFavorite:(BOOL)a3;
- (void)setScaleFromTopRightCorner:(double)a3;
- (void)update;
@end

@implementation PXStoryThumbnailChromeLayout

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alphaOverride, 0);
  objc_storeStrong((id *)&self->_actionPerformer, 0);
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_axSpriteIndexes, 0);
}

- (NSNumber)alphaOverride
{
  return self->_alphaOverride;
}

- (BOOL)isFavorite
{
  return self->_isFavorite;
}

- (double)scaleFromTopRightCorner
{
  return self->_scaleFromTopRightCorner;
}

- (PXStoryThumbnailActionPerformer)actionPerformer
{
  return self->_actionPerformer;
}

- (PXStoryModel)model
{
  return self->_model;
}

- (unint64_t)axFocusabilityForSpriteAtIndex:(unsigned int)a3
{
  return 2;
}

- (NSIndexSet)axSpriteIndexes
{
  axSpriteIndexes = self->_axSpriteIndexes;
  if (!axSpriteIndexes)
  {
    uint64_t v4 = [(PXGLayout *)self localNumberOfSprites];
    v5 = (NSIndexSet *)objc_msgSend(objc_alloc(MEMORY[0x1E4F28D60]), "initWithIndexesInRange:", 0, v4);
    v6 = self->_axSpriteIndexes;
    self->_axSpriteIndexes = v5;

    axSpriteIndexes = self->_axSpriteIndexes;
  }
  return axSpriteIndexes;
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  id v11 = a3;
  if ((void *)ModelObservationContext_157500 != a5)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2 object:self file:@"PXStoryThumbnailChromeLayout.m" lineNumber:409 description:@"Code which should be unreachable has been reached"];

    abort();
  }
  if ((a4 & 0x200000000000) != 0)
  {
    [(PXStoryThumbnailChromeLayout *)self _invalidateIsFavorite];
    if ((a4 & 0x2000) == 0)
    {
LABEL_4:
      if ((a4 & 0x4000000000000000) == 0) {
        goto LABEL_5;
      }
LABEL_11:
      [(PXStoryThumbnailChromeLayout *)self _invalidateContentAlpha];
      if ((a4 & 0x8000000000000000) == 0) {
        goto LABEL_6;
      }
      goto LABEL_12;
    }
  }
  else if ((a4 & 0x2000) == 0)
  {
    goto LABEL_4;
  }
  [(PXStoryThumbnailChromeLayout *)self _invalidateContentVersion];
  if ((a4 & 0x4000000000000000) != 0) {
    goto LABEL_11;
  }
LABEL_5:
  if ((a4 & 0x8000000000000000) == 0) {
    goto LABEL_6;
  }
LABEL_12:
  [(PXStoryThumbnailChromeLayout *)self _invalidateTransform];
LABEL_6:
  v9 = [(PXStoryThumbnailChromeLayout *)self spec];
  if ([v9 thumbnailChromeShowsPlayButton])
  {

    if ((a4 & 0x2000000000000000) != 0) {
      [(PXStoryThumbnailChromeLayout *)self _invalidateContentVersion];
    }
  }
  else
  {
  }
}

- (void)setDetailedPlacementOverride:(id)a3 forItemReference:(id)a4
{
  if (a3)
  {
    v5 = NSNumber;
    [a3 chromeAlpha];
    objc_msgSend(v5, "numberWithDouble:");
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    [(PXStoryThumbnailChromeLayout *)self setAlphaOverride:v6];
  }
  else
  {
    -[PXStoryThumbnailChromeLayout setAlphaOverride:](self, "setAlphaOverride:");
  }
}

- (void)getDetailedPresentedPlacement:(id)a3 forItemReference:(id)a4
{
  id v5 = a3;
  [(PXGLayout *)self alpha];
  objc_msgSend(v5, "setChromeAlpha:");
}

- (void)_handleDetailsViewButton:(id)a3
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3 = [(PXStoryThumbnailChromeLayout *)self actionPerformer];
  uint64_t v4 = [v3 presentDetailsViewAction];

  if (!v4) {
    PXAssertGetLog();
  }
  id v5 = [v3 presentDetailsViewAction];
  v5[2]();
}

- (void)_handlePlayButton:(id)a3
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3 = [(PXStoryThumbnailChromeLayout *)self actionPerformer];
  uint64_t v4 = [v3 presentPlayerAction];

  if (!v4) {
    PXAssertGetLog();
  }
  id v5 = [v3 presentPlayerAction];
  v5[2]();
}

- (void)_handleFavoriteButton:(id)a3
{
  id v4 = a3;
  [(PXStoryThumbnailChromeLayout *)self setIsFavorite:[(PXStoryThumbnailChromeLayout *)self isFavorite] ^ 1];
  objc_initWeak(&location, self);
  id v5 = [(PXStoryThumbnailChromeLayout *)self actionPerformer];
  BOOL v6 = [(PXStoryThumbnailChromeLayout *)self isFavorite];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __54__PXStoryThumbnailChromeLayout__handleFavoriteButton___block_invoke;
  v7[3] = &unk_1E5DCE660;
  objc_copyWeak(&v8, &location);
  [v5 setFavorite:v6 completionHandler:v7];

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __54__PXStoryThumbnailChromeLayout__handleFavoriteButton___block_invoke(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    [WeakRetained _invalidateIsFavorite];
  }
}

- (id)_baseConfigurationForButtonWithSystemImageName:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(PXStoryChromeButtonConfiguration);
  [(PXStoryChromeButtonConfiguration *)v5 setSystemImageName:v4];

  [(PXStoryChromeButtonConfiguration *)v5 setTarget:self];
  BOOL v6 = [(PXStoryThumbnailChromeLayout *)self spec];
  v7 = [v6 thumbnailChromeButtonSpec];
  [(PXStoryChromeButtonConfiguration *)v5 setSpec:v7];

  [(PXStoryChromeButtonConfiguration *)v5 setPointerShape:1];
  PXEdgeInsetsMake();
}

- (id)_buttonConfigurationForSpriteIndex:(unsigned int)a3
{
  if (self->_actionMenuButtonSpriteIndex == a3)
  {
    id v4 = [(PXStoryThumbnailChromeLayout *)self _baseConfigurationForButtonWithSystemImageName:@"ellipsis.circle"];
    id v5 = +[PXMenuBuilder defaultStoryThumbnailActionsMenuWithModel:self->_model isFavorite:[(PXStoryThumbnailChromeLayout *)self isFavorite]];
    [v4 setMenu:v5];

    goto LABEL_13;
  }
  if (self->_favoriteButtonSpriteIndex == a3)
  {
    if ([(PXStoryThumbnailChromeLayout *)self isFavorite]) {
      BOOL v6 = @"suit.heart.fill";
    }
    else {
      BOOL v6 = @"suit.heart";
    }
    v7 = [(PXStoryThumbnailChromeLayout *)self _baseConfigurationForButtonWithSystemImageName:v6];
    id v4 = v7;
    id v8 = sel__handleFavoriteButton_;
  }
  else
  {
    if (self->_playButtonSpriteIndex == a3)
    {
      id v4 = [(PXStoryThumbnailChromeLayout *)self _baseConfigurationForButtonWithSystemImageName:@"play.fill"];
      [v4 setAction:sel__handlePlayButton_];
      v9 = [(PXStoryThumbnailChromeLayout *)self spec];
      v10 = [v9 thumbnailChromePlayButtonSpec];
      [v4 setSpec:v10];

      id v11 = [(PXStoryThumbnailChromeLayout *)self spec];
      v12 = [v11 thumbnailChromePlayButtonSpec];
      objc_msgSend(v4, "setBackgroundStyle:", objc_msgSend(v12, "backgroundStyle"));

      [v4 setBackgroundExtendsUnderLabel:1];
      v13 = PXLocalizedStringFromTable(@"InteractiveMemoryCardActionPlay", @"PhotosUICore");
      [v4 setLabel:v13];

      [v4 setPointerShape:0];
      goto LABEL_13;
    }
    if (self->_detailsViewButtonSpriteIndex != a3)
    {
      v20 = [MEMORY[0x1E4F28B00] currentHandler];
      [v20 handleFailureInMethod:a2 object:self file:@"PXStoryThumbnailChromeLayout.m" lineNumber:331 description:@"Code which should be unreachable has been reached"];

      abort();
    }
    id v4 = [(PXStoryThumbnailChromeLayout *)self _baseConfigurationForButtonWithSystemImageName:@"square.grid.3x3.fill"];
    v14 = [(PXStoryThumbnailChromeLayout *)self spec];
    v15 = [v14 thumbnailChromeDetailsViewButtonSpec];
    [v4 setSpec:v15];

    v16 = [(PXStoryThumbnailChromeLayout *)self spec];
    v17 = [v16 thumbnailChromeDetailsViewButtonSpec];
    objc_msgSend(v4, "setSystemImageStyle:", objc_msgSend(v17, "systemImageStyle"));

    id v8 = sel__handleDetailsViewButton_;
    v7 = v4;
  }
  [v7 setAction:v8];
LABEL_13:
  return v4;
}

- (id)viewUserDataForSpriteAtIndex:(unsigned int)a3 inLayout:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  [(PXGLayout *)self referenceSize];
  [(PXGLayout *)self geometryForSpriteAtIndex:v4];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v8 = 0u;
  [(PXStoryThumbnailChromeLayout *)self scaleFromTopRightCorner];
  PXPointSubtract();
}

- (Class)viewClassForSpriteAtIndex:(unsigned int)a3 inLayout:(id)a4
{
  id v7 = a4;
  if (self->_actionMenuButtonSpriteIndex != a3
    && self->_favoriteButtonSpriteIndex != a3
    && self->_playButtonSpriteIndex != a3
    && self->_detailsViewButtonSpriteIndex != a3)
  {
    long long v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2 object:self file:@"PXStoryThumbnailChromeLayout.m" lineNumber:292 description:@"Code which should be unreachable has been reached"];

    abort();
  }
  long long v8 = objc_opt_class();

  return (Class)v8;
}

- (void)_updateContentAlpha
{
  [(PXGLayout *)self alpha];
  double v4 = v3;
  id v5 = [(PXStoryThumbnailChromeLayout *)self alphaOverride];
  id v6 = v5;
  if (v5)
  {
    [v5 floatValue];
    double v4 = v7;
  }
  long long v8 = +[PXStorySettings sharedInstance];
  double v9 = 1.0;
  if ([v8 showFeedChromeOnHover])
  {
    long long v10 = [(PXStoryThumbnailChromeLayout *)self model];
    double v9 = (double)[v10 isHovering];
  }
  uint64_t v11 = [(PXGLayout *)self localNumberOfSprites];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __51__PXStoryThumbnailChromeLayout__updateContentAlpha__block_invoke;
  v12[3] = &unk_1E5DD20F0;
  v12[4] = self;
  *(double *)&v12[5] = v4;
  *(double *)&v12[6] = v9;
  [(PXGLayout *)self modifySpritesInRange:v11 << 32 state:v12];
}

void __51__PXStoryThumbnailChromeLayout__updateContentAlpha__block_invoke(uint64_t a1, unint64_t a2, uint64_t a3, float *a4)
{
  unint64_t v4 = HIDWORD(a2);
  if (HIDWORD(a2))
  {
    for (uint64_t i = 0; v4 != i; ++i)
    {
      double v8 = *(double *)(a1 + 40);
      double v9 = *(_DWORD **)(a1 + 32);
      if (i == v9[257])
      {
        if ([v9 isFavorite]) {
          goto LABEL_7;
        }
        double v9 = *(_DWORD **)(a1 + 32);
      }
      long long v10 = [v9 spec];
      char v11 = [v10 thumbnailChromeShowsPlayButton];

      if (v11)
      {
LABEL_7:
        if (i == *(_DWORD *)(*(void *)(a1 + 32) + 1032))
        {
          double v12 = fmax(v8 * 15.0 + -14.0, 0.0);
          if (v12 <= 1.0) {
            double v8 = v12;
          }
          else {
            double v8 = 1.0;
          }
        }
        goto LABEL_12;
      }
      double v8 = v8 * *(double *)(a1 + 48);
LABEL_12:
      float v13 = v8;
      *a4 = v13;
      a4 += 40;
    }
  }
}

- (void)_invalidateContentAlpha
{
  p_updateFlags = &self->_updateFlags;
  unint64_t needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_updateFlags.isPerformingUpdate)
    {
LABEL_6:
      p_updateFlags->unint64_t needsUpdate = needsUpdate | 8;
      return;
    }
LABEL_5:
    if ((self->_updateFlags.updated & 8) != 0)
    {
      id v5 = [MEMORY[0x1E4F28B00] currentHandler];
      id v6 = [NSString stringWithUTF8String:"-[PXStoryThumbnailChromeLayout _invalidateContentAlpha]"];
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, @"PXStoryThumbnailChromeLayout.m", 257, @"invalidating %lu after it already has been updated", 8);

      abort();
    }
    goto LABEL_6;
  }
  if (self->_updateFlags.isPerformingUpdate) {
    goto LABEL_5;
  }
  BOOL willPerformUpdate = self->_updateFlags.willPerformUpdate;
  p_updateFlags->unint64_t needsUpdate = 8;
  if (!willPerformUpdate)
  {
    [(PXGLayout *)self setNeedsUpdate];
  }
}

- (void)_updateContent
{
}

void __46__PXStoryThumbnailChromeLayout__updateContent__block_invoke(uint64_t a1, void *a2)
{
}

_DWORD *__46__PXStoryThumbnailChromeLayout__updateContent__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  result = *(_DWORD **)(a1 + 32);
  if (result[256] != -1)
  {
    uint64_t v9 = *(void *)(a1 + 48);
    long long v10 = objc_msgSend(result, "_buttonConfigurationForSpriteIndex:");
    CGFloat v11 = (*(double (**)(uint64_t, void *))(v9 + 16))(v9, v10);
    CGFloat v13 = v12;
    CGFloat v15 = v14;
    CGFloat v17 = v16;

    v18 = (float32x2_t *)(a3 + 32 * *(unsigned int *)(*(void *)(a1 + 32) + 1024));
    v87.origin.CGFloat x = v11;
    v87.origin.CGFloat y = v13;
    v87.size.width = v15;
    v87.size.height = v17;
    CGFloat MidX = CGRectGetMidX(v87);
    v88.origin.CGFloat x = v11;
    v88.origin.CGFloat y = v13;
    v88.size.width = v15;
    v88.size.height = v17;
    CGFloat MidY = CGRectGetMidY(v88);
    v89.origin.CGFloat x = v11;
    v89.origin.CGFloat y = v13;
    v89.size.width = v15;
    v89.size.height = v17;
    CGFloat Width = CGRectGetWidth(v89);
    v90.origin.CGFloat x = v11;
    v90.origin.CGFloat y = v13;
    v90.size.width = v15;
    v90.size.height = v17;
    CGFloat Height = CGRectGetHeight(v90);
    v22.f64[0] = Width;
    v22.f64[1] = Height;
    *(CGFloat *)v18 = MidX;
    *(CGFloat *)&v18[1] = MidY;
    v18[2] = (float32x2_t)0xC059000000000000;
    v18[3] = vcvt_f32_f64(v22);
    *(_WORD *)(a5 + 40 * *(unsigned int *)(*(void *)(a1 + 32) + 1024) + 32) = *(_WORD *)(*(void *)(a1 + 32)
                                                                                             + 1040);
    result = *(_DWORD **)(a1 + 32);
  }
  if (result[257] != -1)
  {
    uint64_t v23 = *(void *)(a1 + 48);
    v24 = objc_msgSend(result, "_buttonConfigurationForSpriteIndex:");
    CGFloat v25 = (*(double (**)(uint64_t, void *))(v23 + 16))(v23, v24);
    CGFloat v27 = v26;
    CGFloat v29 = v28;
    CGFloat v31 = v30;

    v32 = (float32x2_t *)(a3 + 32 * *(unsigned int *)(*(void *)(a1 + 32) + 1028));
    v91.origin.CGFloat x = v25;
    v91.origin.CGFloat y = v27;
    v91.size.width = v29;
    v91.size.height = v31;
    CGFloat v33 = CGRectGetMidX(v91);
    v92.origin.CGFloat x = v25;
    v92.origin.CGFloat y = v27;
    v92.size.width = v29;
    v92.size.height = v31;
    CGFloat v34 = CGRectGetMidY(v92);
    v93.origin.CGFloat x = v25;
    v93.origin.CGFloat y = v27;
    v93.size.width = v29;
    v93.size.height = v31;
    CGFloat v85 = CGRectGetWidth(v93);
    v94.origin.CGFloat x = v25;
    v94.origin.CGFloat y = v27;
    v94.size.width = v29;
    v94.size.height = v31;
    CGFloat v35 = CGRectGetHeight(v94);
    v36.f64[0] = v85;
    v36.f64[1] = v35;
    *(CGFloat *)v32 = v33;
    *(CGFloat *)&v32[1] = v34;
    v32[2] = (float32x2_t)0xC059000000000000;
    v32[3] = vcvt_f32_f64(v36);
    *(_WORD *)(a5 + 40 * *(unsigned int *)(*(void *)(a1 + 32) + 1028) + 32) = *(_WORD *)(*(void *)(a1 + 32)
                                                                                             + 1040);
    result = *(_DWORD **)(a1 + 32);
  }
  if (result[258] != -1)
  {
    v37 = [result rootLayout];
    v38 = [v37 coordinateSpace];

    v39 = [*(id *)(a1 + 32) model];
    v40 = [v39 presentedTitleFrame];
    [v40 rectInCoordinateSpace:v38];
    CGFloat v42 = v41;
    CGFloat v44 = v43;
    CGFloat v46 = v45;
    CGFloat v48 = v47;

    v49 = [*(id *)(a1 + 32) model];
    v50 = [v49 presentedSubtitleFrame];
    [v50 rectInCoordinateSpace:v38];
    CGFloat v52 = v51;
    CGFloat v54 = v53;
    CGFloat v56 = v55;
    CGFloat v58 = v57;

    v95.origin.CGFloat x = v42;
    v95.origin.CGFloat y = v44;
    v95.size.width = v46;
    v95.size.height = v48;
    v102.origin.CGFloat x = v52;
    v102.origin.CGFloat y = v54;
    v102.size.width = v56;
    v102.size.height = v58;
    CGRect v96 = CGRectUnion(v95, v102);
    CGFloat x = v96.origin.x;
    CGFloat y = v96.origin.y;
    CGFloat v61 = v96.size.width;
    CGFloat v62 = v96.size.height;
    double MinX = *MEMORY[0x1E4F1DB28];
    double v64 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v65 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    CGFloat v66 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    v103.origin.CGFloat x = *(CGFloat *)MEMORY[0x1E4F1DB28];
    v103.origin.CGFloat y = v64;
    v103.size.width = v65;
    v103.size.height = v66;
    if (!CGRectEqualToRect(v96, v103))
    {
      v67 = [*(id *)(a1 + 32) _buttonConfigurationForSpriteIndex:*(unsigned int *)(*(void *)(a1 + 32) + 1032)];
      +[PXStoryChromeButton sizeWithConfiguration:v67];
      double v65 = v68;
      CGFloat v66 = v69;

      v70 = [*(id *)(a1 + 32) model];
      uint64_t v71 = [v70 titleAlignment];

      CGFloat v72 = x;
      CGFloat v73 = y;
      CGFloat v74 = v61;
      CGFloat v75 = v62;
      if (v71 == 2)
      {
        double MinX = CGRectGetMaxX(*(CGRect *)&v72) - v65;
      }
      else if (v71)
      {
        double MinX = CGRectGetMidX(*(CGRect *)&v72) + v65 * -0.5;
      }
      else
      {
        double MinX = CGRectGetMinX(*(CGRect *)&v72);
      }
      v97.origin.CGFloat x = x;
      v97.origin.CGFloat y = y;
      v97.size.width = v61;
      v97.size.height = v62;
      double MaxY = CGRectGetMaxY(v97);
      [*(id *)(a1 + 40) thumbnailPlayButtonPadding];
      double v64 = MaxY + v77;
    }
    v78 = (float32x2_t *)(a3 + 32 * *(unsigned int *)(*(void *)(a1 + 32) + 1032));
    v98.origin.CGFloat x = MinX;
    v98.origin.CGFloat y = v64;
    v98.size.width = v65;
    v98.size.height = v66;
    CGFloat v79 = CGRectGetMidX(v98);
    v99.origin.CGFloat x = MinX;
    v99.origin.CGFloat y = v64;
    v99.size.width = v65;
    v99.size.height = v66;
    CGFloat v80 = CGRectGetMidY(v99);
    v100.origin.CGFloat x = MinX;
    v100.origin.CGFloat y = v64;
    v100.size.width = v65;
    v100.size.height = v66;
    CGFloat v86 = CGRectGetWidth(v100);
    v101.origin.CGFloat x = MinX;
    v101.origin.CGFloat y = v64;
    v101.size.width = v65;
    v101.size.height = v66;
    CGFloat v81 = CGRectGetHeight(v101);
    v82.f64[0] = v86;
    v82.f64[1] = v81;
    *(CGFloat *)v78 = v79;
    *(CGFloat *)&v78[1] = v80;
    v78[2] = (float32x2_t)0xC059000000000000;
    v78[3] = vcvt_f32_f64(v82);
    *(_WORD *)(a5 + 40 * *(unsigned int *)(*(void *)(a1 + 32) + 1032) + 32) = *(_WORD *)(*(void *)(a1 + 32)
                                                                                             + 1040);

    result = *(_DWORD **)(a1 + 32);
  }
  if (result[259] != -1)
  {
    v83 = [result _buttonConfigurationForSpriteIndex:result[258]];
    +[PXStoryChromeButton sizeWithConfiguration:v83];

    PXRectWithOriginAndSize();
  }
  return result;
}

- (void)_invalidateContent
{
  p_updateFlags = &self->_updateFlags;
  unint64_t needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_updateFlags.isPerformingUpdate)
    {
LABEL_6:
      p_updateFlags->unint64_t needsUpdate = needsUpdate | 4;
      return;
    }
LABEL_5:
    if ((self->_updateFlags.updated & 4) != 0)
    {
      id v5 = [MEMORY[0x1E4F28B00] currentHandler];
      id v6 = [NSString stringWithUTF8String:"-[PXStoryThumbnailChromeLayout _invalidateContent]"];
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, @"PXStoryThumbnailChromeLayout.m", 179, @"invalidating %lu after it already has been updated", 4);

      abort();
    }
    goto LABEL_6;
  }
  if (self->_updateFlags.isPerformingUpdate) {
    goto LABEL_5;
  }
  BOOL willPerformUpdate = self->_updateFlags.willPerformUpdate;
  p_updateFlags->unint64_t needsUpdate = 4;
  if (!willPerformUpdate)
  {
    [(PXGLayout *)self setNeedsUpdate];
  }
}

- (void)_invalidateContentVersion
{
}

- (void)_updateTransform
{
  [(PXGLayout *)self referenceSize];
  double v4 = v3;
  id v5 = [(PXStoryThumbnailChromeLayout *)self model];
  [v5 pressAnimationInfo];
  double v7 = v6;

  BOOL v8 = v4 >= v7 || v7 <= 0.0;
  double v9 = v4 / v7;
  if (v8) {
    double v9 = 1.0;
  }
  [(PXStoryThumbnailChromeLayout *)self setScaleFromTopRightCorner:v9];
}

- (void)_invalidateTransform
{
  p_updateFlags = &self->_updateFlags;
  unint64_t needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_updateFlags.isPerformingUpdate)
    {
LABEL_6:
      p_updateFlags->unint64_t needsUpdate = needsUpdate | 2;
      return;
    }
LABEL_5:
    if ((self->_updateFlags.updated & 2) != 0)
    {
      id v5 = [MEMORY[0x1E4F28B00] currentHandler];
      double v6 = [NSString stringWithUTF8String:"-[PXStoryThumbnailChromeLayout _invalidateTransform]"];
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, @"PXStoryThumbnailChromeLayout.m", 164, @"invalidating %lu after it already has been updated", 2);

      abort();
    }
    goto LABEL_6;
  }
  if (self->_updateFlags.isPerformingUpdate) {
    goto LABEL_5;
  }
  BOOL willPerformUpdate = self->_updateFlags.willPerformUpdate;
  p_updateFlags->unint64_t needsUpdate = 2;
  if (!willPerformUpdate)
  {
    [(PXGLayout *)self setNeedsUpdate];
  }
}

- (void)_updateIsFavorite
{
  id v3 = [(PXStoryThumbnailChromeLayout *)self model];
  -[PXStoryThumbnailChromeLayout setIsFavorite:](self, "setIsFavorite:", [v3 currentAssetCollectionIsFavorite]);
}

- (void)_invalidateIsFavorite
{
  p_updateFlags = &self->_updateFlags;
  unint64_t needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_updateFlags.isPerformingUpdate)
    {
LABEL_6:
      p_updateFlags->unint64_t needsUpdate = needsUpdate | 1;
      return;
    }
LABEL_5:
    if (self->_updateFlags.updated)
    {
      id v5 = [MEMORY[0x1E4F28B00] currentHandler];
      double v6 = [NSString stringWithUTF8String:"-[PXStoryThumbnailChromeLayout _invalidateIsFavorite]"];
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, @"PXStoryThumbnailChromeLayout.m", 156, @"invalidating %lu after it already has been updated", 1);

      abort();
    }
    goto LABEL_6;
  }
  if (self->_updateFlags.isPerformingUpdate) {
    goto LABEL_5;
  }
  BOOL willPerformUpdate = self->_updateFlags.willPerformUpdate;
  p_updateFlags->unint64_t needsUpdate = 1;
  if (!willPerformUpdate)
  {
    [(PXGLayout *)self setNeedsUpdate];
  }
}

- (void)update
{
  p_updateFlags = &self->_updateFlags;
  self->_updateFlags.BOOL willPerformUpdate = 0;
  unint64_t needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (self->_updateFlags.isPerformingUpdate)
    {
      BOOL v8 = [MEMORY[0x1E4F28B00] currentHandler];
      double v9 = [NSString stringWithUTF8String:"-[PXStoryThumbnailChromeLayout update]"];
      [v8 handleFailureInFunction:v9, @"PXStoryThumbnailChromeLayout.m", 138, @"Invalid parameter not satisfying: %@", @"!_updateFlags.isPerformingUpdate" file lineNumber description];

      unint64_t needsUpdate = p_updateFlags->needsUpdate;
    }
    p_updateFlags->isPerformingUpdate = 1;
    p_updateFlags->updated = 1;
    if (needsUpdate)
    {
      p_updateFlags->unint64_t needsUpdate = needsUpdate & 0xFFFFFFFFFFFFFFFELL;
      [(PXStoryThumbnailChromeLayout *)self _updateIsFavorite];
      if (!p_updateFlags->isPerformingUpdate)
      {
        double v16 = [MEMORY[0x1E4F28B00] currentHandler];
        CGFloat v17 = [NSString stringWithUTF8String:"-[PXStoryThumbnailChromeLayout update]"];
        [v16 handleFailureInFunction:v17, @"PXStoryThumbnailChromeLayout.m", 142, @"Invalid parameter not satisfying: %@", @"_updateFlags.isPerformingUpdate" file lineNumber description];
      }
    }
    unint64_t v5 = p_updateFlags->needsUpdate;
    p_updateFlags->updated |= 2uLL;
    if ((v5 & 2) != 0)
    {
      p_updateFlags->unint64_t needsUpdate = v5 & 0xFFFFFFFFFFFFFFFDLL;
      [(PXStoryThumbnailChromeLayout *)self _updateTransform];
    }
    if (!p_updateFlags->isPerformingUpdate)
    {
      long long v10 = [MEMORY[0x1E4F28B00] currentHandler];
      CGFloat v11 = [NSString stringWithUTF8String:"-[PXStoryThumbnailChromeLayout update]"];
      [v10 handleFailureInFunction:v11, @"PXStoryThumbnailChromeLayout.m", 145, @"Invalid parameter not satisfying: %@", @"_updateFlags.isPerformingUpdate" file lineNumber description];
    }
    unint64_t v6 = p_updateFlags->needsUpdate;
    p_updateFlags->updated |= 4uLL;
    if ((v6 & 4) != 0)
    {
      p_updateFlags->unint64_t needsUpdate = v6 & 0xFFFFFFFFFFFFFFFBLL;
      [(PXStoryThumbnailChromeLayout *)self _updateContent];
    }
    if (!p_updateFlags->isPerformingUpdate)
    {
      double v12 = [MEMORY[0x1E4F28B00] currentHandler];
      CGFloat v13 = [NSString stringWithUTF8String:"-[PXStoryThumbnailChromeLayout update]"];
      [v12 handleFailureInFunction:v13, @"PXStoryThumbnailChromeLayout.m", 148, @"Invalid parameter not satisfying: %@", @"_updateFlags.isPerformingUpdate" file lineNumber description];
    }
    unint64_t v7 = p_updateFlags->needsUpdate;
    p_updateFlags->updated |= 8uLL;
    if ((v7 & 8) != 0)
    {
      p_updateFlags->unint64_t needsUpdate = v7 & 0xFFFFFFFFFFFFFFF7;
      [(PXStoryThumbnailChromeLayout *)self _updateContentAlpha];
      unint64_t v7 = p_updateFlags->needsUpdate;
    }
    p_updateFlags->isPerformingUpdate = 0;
    if (v7)
    {
      double v14 = [MEMORY[0x1E4F28B00] currentHandler];
      CGFloat v15 = [NSString stringWithUTF8String:"-[PXStoryThumbnailChromeLayout update]"];
      objc_msgSend(v14, "handleFailureInFunction:file:lineNumber:description:", v15, @"PXStoryThumbnailChromeLayout.m", 151, @"still needing to update %lu after update pass", p_updateFlags->needsUpdate);
    }
  }
  v18.receiver = self;
  v18.super_class = (Class)PXStoryThumbnailChromeLayout;
  [(PXGCompositeLayout *)&v18 update];
}

- (void)setAlphaOverride:(id)a3
{
  unint64_t v7 = (NSNumber *)a3;
  unint64_t v5 = self->_alphaOverride;
  if (v5 == v7)
  {
  }
  else
  {
    char v6 = [(NSNumber *)v7 isEqual:v5];

    if ((v6 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_alphaOverride, a3);
      [(PXStoryThumbnailChromeLayout *)self _invalidateContentAlpha];
    }
  }
}

- (void)setIsFavorite:(BOOL)a3
{
  if (self->_isFavorite != a3)
  {
    self->_isFavorite = a3;
    [(PXStoryThumbnailChromeLayout *)self _invalidateContentVersion];
  }
}

- (void)setScaleFromTopRightCorner:(double)a3
{
  if (self->_scaleFromTopRightCorner != a3)
  {
    self->_scaleFromTopRightCorner = a3;
    [(PXStoryThumbnailChromeLayout *)self _invalidateContentVersion];
  }
}

- (PXStoryLayoutSpec)spec
{
  uint64_t v2 = [(PXStoryThumbnailChromeLayout *)self model];
  id v3 = [v2 layoutSpec];

  return (PXStoryLayoutSpec *)v3;
}

- (void)alphaDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)PXStoryThumbnailChromeLayout;
  [(PXGLayout *)&v3 alphaDidChange];
  [(PXStoryThumbnailChromeLayout *)self _invalidateContentAlpha];
}

- (void)referenceSizeDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)PXStoryThumbnailChromeLayout;
  [(PXGCompositeLayout *)&v3 referenceSizeDidChange];
  [(PXStoryThumbnailChromeLayout *)self _invalidateTransform];
  [(PXStoryThumbnailChromeLayout *)self _invalidateContent];
}

- (PXStoryThumbnailChromeLayout)initWithModel:(id)a3
{
  id v5 = a3;
  v18.receiver = self;
  v18.super_class = (Class)PXStoryThumbnailChromeLayout;
  char v6 = [(PXGAbsoluteCompositeLayout *)&v18 init];
  unint64_t v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_model, a3);
    [(PXStoryModel *)v7->_model registerChangeObserver:v7 context:ModelObservationContext_157500];
    uint64_t v8 = [v5 thumbnailActionPerformer];
    actionPerformer = v7->_actionPerformer;
    v7->_actionPerformer = (PXStoryThumbnailActionPerformer *)v8;

    long long v10 = [v5 layoutSpec];
    uint64_t v14 = 0;
    CGFloat v15 = &v14;
    uint64_t v16 = 0x2020000000;
    int v17 = 0;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __46__PXStoryThumbnailChromeLayout_initWithModel___block_invoke;
    aBlock[3] = &unk_1E5DC0218;
    aBlock[4] = &v14;
    CGFloat v11 = (uint64_t (**)(void *, uint64_t))_Block_copy(aBlock);
    v7->_favoriteButtonSpriteIndeCGFloat x = v11[2](v11, [v10 thumbnailChromeShowsFavoriteButton]);
    v7->_actionMenuButtonSpriteIndeCGFloat x = v11[2](v11, [v10 thumbnailChromeShowsActionMenuButton]);
    v7->_playButtonSpriteIndeCGFloat x = v11[2](v11, [v10 thumbnailChromeShowsPlayButton]);
    v7->_detailsViewButtonSpriteIndeCGFloat x = v11[2](v11, [v5 detailsViewButtonDisplayStyle] == 2);
    [(PXGLayout *)v7 addSpriteCount:*((unsigned int *)v15 + 6) withInitialState:&__block_literal_global_157560];
    [(PXGLayout *)v7 setContentSource:v7];
    [(PXStoryThumbnailChromeLayout *)v7 _invalidateIsFavorite];
    [(PXStoryThumbnailChromeLayout *)v7 _invalidateContentAlpha];

    _Block_object_dispose(&v14, 8);
  }

  return v7;
}

uint64_t __46__PXStoryThumbnailChromeLayout_initWithModel___block_invoke(uint64_t a1, int a2)
{
  if (!a2) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t result = *(unsigned int *)(v2 + 24);
  *(_DWORD *)(v2 + 24) = result + 1;
  return result;
}

void __46__PXStoryThumbnailChromeLayout_initWithModel___block_invoke_2(uint64_t a1, uint64_t a2, unsigned int *a3)
{
  if (*a3)
  {
    uint64_t v3 = 0;
    uint64_t v4 = 0;
    unint64_t v5 = 0;
    long long v6 = *((_OWORD *)off_1E5DAAF90 + 6);
    long long v7 = *((_OWORD *)off_1E5DAAF90 + 7);
    long long v8 = *((_OWORD *)off_1E5DAAF90 + 8);
    long long v9 = *((_OWORD *)off_1E5DAAF90 + 9);
    long long v10 = *((_OWORD *)off_1E5DAAF90 + 2);
    long long v11 = *((_OWORD *)off_1E5DAAF90 + 3);
    long long v12 = *((_OWORD *)off_1E5DAAF90 + 4);
    long long v13 = *((_OWORD *)off_1E5DAAF90 + 5);
    long long v14 = *(_OWORD *)off_1E5DAAF90;
    long long v15 = *((_OWORD *)off_1E5DAAF90 + 1);
    do
    {
      uint64_t v16 = (_OWORD *)(*((void *)a3 + 3) + v3);
      v16[6] = v6;
      v16[7] = v7;
      v16[8] = v8;
      v16[9] = v9;
      v16[2] = v10;
      v16[3] = v11;
      v16[4] = v12;
      v16[5] = v13;
      _OWORD *v16 = v14;
      v16[1] = v15;
      *(_WORD *)(*((void *)a3 + 4) + v4) = 2561;
      ++v5;
      v4 += 40;
      v3 += 160;
    }
    while (v5 < *a3);
  }
}

- (PXStoryThumbnailChromeLayout)init
{
  uint64_t v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXStoryThumbnailChromeLayout.m", 59, @"%s is not available as initializer", "-[PXStoryThumbnailChromeLayout init]");

  abort();
}

@end
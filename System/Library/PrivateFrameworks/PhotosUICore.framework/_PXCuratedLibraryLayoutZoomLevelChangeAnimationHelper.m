@interface _PXCuratedLibraryLayoutZoomLevelChangeAnimationHelper
- (BOOL)wantsDoubleSidedAnimations;
- (BOOL)wantsPresentationAdjustment;
- (_PXCuratedLibraryLayoutZoomLevelChangeAnimationHelper)initWithLayout:(id)a3;
- (double)animationDuration;
- (id)animation:(id)a3 doubleSidedAnimatedSpriteIndexesForModifiedSpriteIndexes:(id)a4 rootLayout:(id)a5 presentedGeometries:(id *)a6 styles:(id *)a7 infos:(id *)a8;
- (unsigned)highFrameRateReason;
- (void)_adjustGeometries:(id *)a3 styles:(id *)a4 infos:(id *)a5 spriteIndexRange:(_PXGSpriteIndexRange)a6 appearing:(BOOL)a7;
- (void)animation:(id)a3 adjustGeometries:(id *)a4 styles:(id *)a5 infos:(id *)a6 forSpriteAppearingIntoRootIndexRange:(_PXGSpriteIndexRange)a7;
- (void)animation:(id)a3 adjustGeometries:(id *)a4 styles:(id *)a5 infos:(id *)a6 forSpriteDisappearingFromRootIndexRange:(_PXGSpriteIndexRange)a7;
- (void)animation:(id)a3 adjustPresentedGeometries:(id *)a4 styles:(id *)a5 infos:(id *)a6 count:(unsigned int)a7;
- (void)animation:(id)a3 prepareWithRootLayout:(id)a4 viewportShift:(CGPoint)a5;
@end

@implementation _PXCuratedLibraryLayoutZoomLevelChangeAnimationHelper

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coordinateSpace, 0);
  objc_storeStrong((id *)&self->_nullSectionGeometryDescriptor, 0);
  objc_storeStrong((id *)&self->_visualPositionsChangeDetails, 0);
  objc_storeStrong((id *)&self->_changeDetails, 0);
  objc_storeStrong((id *)&self->_toLayoutSnapshotGeometryDescriptor, 0);
  objc_storeStrong((id *)&self->_fromLayoutSnapshotGeometryDescriptor, 0);
}

- (void)_adjustGeometries:(id *)a3 styles:(id *)a4 infos:(id *)a5 spriteIndexRange:(_PXGSpriteIndexRange)a6 appearing:(BOOL)a7
{
  void (**v37)(void *__return_ptr);
  PXCuratedLibraryLayoutSnapshotGeometryDescriptor *v38;
  uint64_t v39;
  long long v40;
  long long v41;
  int64x2_t v42;
  CGAffineTransform v43;
  uint64_t v44;
  char v45;
  long long v46;
  long long v47;
  uint64_t v48;
  void v49[2];
  int64x2_t v50;
  void v51[2];
  int64x2_t v52;
  long long v53;
  long long v54;
  uint64_t v55;
  void v56[5];
  void v57[5];
  void v58[5];
  void aBlock[5];
  uint64_t v60;

  BOOL v7 = a7;
  v60 = *MEMORY[0x1E4F143B8];
  v10 = +[PXCuratedLibrarySettings sharedInstance];
  if (v7)
  {
    v11 = self->_toLayoutSnapshotGeometryDescriptor;
    v12 = self->_fromLayoutSnapshotGeometryDescriptor;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __115___PXCuratedLibraryLayoutZoomLevelChangeAnimationHelper__adjustGeometries_styles_infos_spriteIndexRange_appearing___block_invoke;
    aBlock[3] = &unk_1E5DAEF90;
    aBlock[4] = self;
    v36 = _Block_copy(aBlock);
    v58[0] = MEMORY[0x1E4F143A8];
    v58[1] = 3221225472;
    v58[2] = __115___PXCuratedLibraryLayoutZoomLevelChangeAnimationHelper__adjustGeometries_styles_infos_spriteIndexRange_appearing___block_invoke_2;
    v58[3] = &unk_1E5DAEFB8;
    v58[4] = self;
    v37 = (void (**)(void *__return_ptr))_Block_copy(v58);
    int64_t v35 = [(PXVisualPositionsChangeDetails *)self->_visualPositionsChangeDetails anchorIndexAfterChanges];
    int64_t v33 = [(PXVisualPositionsChangeDetails *)self->_visualPositionsChangeDetails anchorIndexBeforeChanges];
  }
  else
  {
    v11 = self->_fromLayoutSnapshotGeometryDescriptor;
    v12 = self->_toLayoutSnapshotGeometryDescriptor;
    v57[0] = MEMORY[0x1E4F143A8];
    v57[1] = 3221225472;
    v57[2] = __115___PXCuratedLibraryLayoutZoomLevelChangeAnimationHelper__adjustGeometries_styles_infos_spriteIndexRange_appearing___block_invoke_3;
    v57[3] = &unk_1E5DAEF90;
    v57[4] = self;
    v36 = _Block_copy(v57);
    v56[0] = MEMORY[0x1E4F143A8];
    v56[1] = 3221225472;
    v56[2] = __115___PXCuratedLibraryLayoutZoomLevelChangeAnimationHelper__adjustGeometries_styles_infos_spriteIndexRange_appearing___block_invoke_4;
    v56[3] = &unk_1E5DAEFB8;
    v56[4] = self;
    v37 = (void (**)(void *__return_ptr))_Block_copy(v56);
    int64_t v35 = [(PXVisualPositionsChangeDetails *)self->_visualPositionsChangeDetails anchorIndexBeforeChanges];
    int64_t v33 = [(PXVisualPositionsChangeDetails *)self->_visualPositionsChangeDetails anchorIndexAfterChanges];
  }
  unint64_t v13 = HIDWORD(*(unint64_t *)&a6);
  [(PXCuratedLibraryLayoutSnapshotGeometryDescriptor *)v11 dataSourceIdentifier];
  [(PXCuratedLibraryLayoutSnapshotGeometryDescriptor *)v11 skimmingDataSourceIdentifier];
  [(PXCuratedLibraryLayoutSnapshotGeometryDescriptor *)v12 dataSourceIdentifier];
  v40 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 24);
  v41 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 8);
  v53 = v41;
  v54 = v40;
  v39 = *(void *)(MEMORY[0x1E4F1DAB8] + 40);
  v55 = v39;
  v14 = v11;
  v38 = v11;
  if (self->_transitionType == 2)
  {
    if ([(PXCuratedLibraryLayoutSnapshotGeometryDescriptor *)v11 zoomLevel] == 1)
    {
      [v10 nonAnchorYearsFadeSpeed];
      v34 = +[PXNonuniformTransform identityTransform];
    }
    else
    {
      v51[0] = [(PXCuratedLibraryLayoutSnapshotGeometryDescriptor *)v11 dataSourceIdentifier];
      v51[1] = v35;
      v42 = vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL);
      v52 = v42;
      v15 = [(PXCuratedLibraryLayoutSnapshotGeometryDescriptor *)v11 geometryDescriptorForSectionAtIndexPath:v51];
      v49[0] = [(PXCuratedLibraryLayoutSnapshotGeometryDescriptor *)v12 dataSourceIdentifier];
      v49[1] = v33;
      v50 = v42;
      v16 = [(PXCuratedLibraryLayoutSnapshotGeometryDescriptor *)v12 geometryDescriptorForSectionAtIndexPath:v49];
      uint64_t v17 = 0;
      if (v15 && v16)
      {
        memset(&v43, 0, 24);
        [v15 visualPosition];
        ((void (**)(CGAffineTransform *__return_ptr))v37)[2](&v43);
        if (*(void *)&v43.b == 1)
        {
          [v10 transitionScaleForDayNotMatchingMonths];
          uint64_t v18 = [(PXCuratedLibraryLayoutSnapshotGeometryDescriptor *)v12 zoomLevel];
          if (v18 <= [(PXCuratedLibraryLayoutSnapshotGeometryDescriptor *)v38 zoomLevel]) {
            [v10 nonAnchorDaysFadeSpeed];
          }
          else {
            [v10 nonAnchorMonthsFadeSpeed];
          }
          [(PXCuratedLibraryLayoutSnapshotGeometryDescriptor *)v12 visibleRect];
          PXRectGetCenter();
        }
        [v10 nonAnchorMonthsFadeSpeed];
        [v10 defaultZoomLevelTransitionMaximumScaleAroundAnchor];
        double v20 = v19;
        [v15 sectionRect];
        double v22 = v21;
        double v24 = v23;
        double v26 = v25;
        double v28 = v27;
        [v16 sectionRect];
        uint64_t v17 = +[PXNonuniformTransform horizontallyDominantTransformWithSourceRect:targetRect:coordinateSpace:minimumScale:maximumScale:](PXNonuniformTransform, "horizontallyDominantTransformWithSourceRect:targetRect:coordinateSpace:minimumScale:maximumScale:", self->_coordinateSpace, v22, v24, v26, v28, v29, v30, v31, v32, 1.0 / v20, *(void *)&v20);
      }
      v34 = (void *)v17;

      v14 = v38;
    }
  }
  else
  {
    v34 = 0;
  }
  [(PXCuratedLibraryLayoutSnapshotGeometryDescriptor *)v14 zoomLevel];
  [(PXCuratedLibraryLayoutSnapshotGeometryDescriptor *)v12 zoomLevel];
  [(PXCuratedLibraryLayoutSnapshotGeometryDescriptor *)v14 zoomLevel];
  [(PXCuratedLibraryLayoutSnapshotGeometryDescriptor *)v12 zoomLevel];
  if (v13)
  {
    v46 = v41;
    v47 = v40;
    v48 = v39;
    v45 = 0;
    v44 = 0;
    PXGSectionedSpriteTagDecompose();
  }
}

- (void)animation:(id)a3 adjustGeometries:(id *)a4 styles:(id *)a5 infos:(id *)a6 forSpriteDisappearingFromRootIndexRange:(_PXGSpriteIndexRange)a7
{
}

- (void)animation:(id)a3 adjustGeometries:(id *)a4 styles:(id *)a5 infos:(id *)a6 forSpriteAppearingIntoRootIndexRange:(_PXGSpriteIndexRange)a7
{
}

- (void)animation:(id)a3 prepareWithRootLayout:(id)a4 viewportShift:(CGPoint)a5
{
  double y = a5.y;
  double x = a5.x;
  id v10 = a3;
  id v11 = a4;
  if (v11)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_3;
    }
    v37 = [MEMORY[0x1E4F28B00] currentHandler];
    v40 = (objc_class *)objc_opt_class();
    v39 = NSStringFromClass(v40);
    v41 = objc_msgSend(v11, "px_descriptionForAssertionMessage");
    [v37 handleFailureInMethod:a2, self, @"PXCuratedLibraryLayoutAnimationHelper.m", 385, @"%@ should be an instance inheriting from %@, but it is %@", @"rootLayout", v39, v41 object file lineNumber description];
  }
  else
  {
    v37 = [MEMORY[0x1E4F28B00] currentHandler];
    v38 = (objc_class *)objc_opt_class();
    v39 = NSStringFromClass(v38);
    [v37 handleFailureInMethod:a2, self, @"PXCuratedLibraryLayoutAnimationHelper.m", 385, @"%@ should be an instance inheriting from %@, but it is nil", @"rootLayout", v39 object file lineNumber description];
  }

LABEL_3:
  -[PXCuratedLibraryLayoutSnapshotGeometryDescriptor setOffset:](self->_fromLayoutSnapshotGeometryDescriptor, "setOffset:", x, y);
  v12 = [[PXCuratedLibraryLayoutSnapshotGeometryDescriptor alloc] initWithLayout:v11];
  toLayoutSnapshotGeometryDescriptor = self->_toLayoutSnapshotGeometryDescriptor;
  self->_toLayoutSnapshotGeometryDescriptor = v12;

  v14 = [v11 viewModel];
  v15 = [v14 assetsDataSourceManager];

  int64_t v16 = [(PXCuratedLibraryLayoutSnapshotGeometryDescriptor *)self->_fromLayoutSnapshotGeometryDescriptor dataSourceIdentifier];
  int64_t v17 = [(PXCuratedLibraryLayoutSnapshotGeometryDescriptor *)self->_toLayoutSnapshotGeometryDescriptor dataSourceIdentifier];
  uint64_t v18 = [v15 changeHistory];
  double v19 = [v18 changeDetailsFromDataSourceIdentifier:v16 toDataSourceIdentifier:v17];
  changeDetails = self->_changeDetails;
  self->_changeDetails = v19;

  double v21 = [v15 visualPositionsChangeDetailsFromDataSourceIdentifier:v16 toDataSourceIdentifier:v17];
  visualPositionsChangeDetails = self->_visualPositionsChangeDetails;
  self->_visualPositionsChangeDetails = v21;

  self->_transitionType = [v15 transitionTypeFromDataSourceIdentifier:v16 toDataSourceIdentifier:v17];
  double v23 = [v11 spec];
  self->_shouldAlwaysFadeDecoration = [v23 userInterfaceIdiom] == 4;

  if (self->_visualPositionsChangeDetails)
  {
    double v24 = [(PXCuratedLibraryLayoutSnapshotGeometryDescriptor *)self->_fromLayoutSnapshotGeometryDescriptor sections];
    double v25 = [(PXCuratedLibraryLayoutSnapshotGeometryDescriptor *)self->_toLayoutSnapshotGeometryDescriptor sections];
    int64_t v26 = [(PXVisualPositionsChangeDetails *)self->_visualPositionsChangeDetails anchorIndexBeforeChanges];
    int64_t v44 = [(PXVisualPositionsChangeDetails *)self->_visualPositionsChangeDetails anchorIndexAfterChanges];
    int64_t v42 = v26;
    id v43 = v10;
    if ([v24 count])
    {
      double v27 = self->_visualPositionsChangeDetails;
      uint64_t v28 = [v24 firstIndex];
      if (v27)
      {
        [(PXVisualPositionsChangeDetails *)v27 visualPositionAfterApplyingChangesToIndex:v28];
        double v27 = v48;
      }
      double v29 = self->_visualPositionsChangeDetails;
      uint64_t v30 = [v24 lastIndex];
      if (v29)
      {
        [(PXVisualPositionsChangeDetails *)v29 visualPositionAfterApplyingChangesToIndex:v30];
        uint64_t v31 = v47;
      }
      else
      {
        uint64_t v31 = 0;
      }
      int64_t v26 = v42;
      [(PXCuratedLibraryLayoutSnapshotGeometryDescriptor *)self->_toLayoutSnapshotGeometryDescriptor extrapolateSectionsBetween:v27 and:v31 withAnchorSection:v44];
      id v10 = v43;
    }
    if ([v25 count])
    {
      double v32 = self->_visualPositionsChangeDetails;
      uint64_t v33 = [v25 firstIndex];
      if (v32)
      {
        [(PXVisualPositionsChangeDetails *)v32 visualPositionAfterRevertingChangesFromIndex:v33];
        double v32 = v46;
      }
      v34 = self->_visualPositionsChangeDetails;
      uint64_t v35 = [v25 lastIndex];
      if (v34)
      {
        [(PXVisualPositionsChangeDetails *)v34 visualPositionAfterRevertingChangesFromIndex:v35];
        uint64_t v36 = v45;
      }
      else
      {
        uint64_t v36 = 0;
      }
      int64_t v26 = v42;
      [(PXCuratedLibraryLayoutSnapshotGeometryDescriptor *)self->_fromLayoutSnapshotGeometryDescriptor extrapolateSectionsBetween:v32 and:v36 withAnchorSection:v42];
      id v10 = v43;
    }
    [(PXCuratedLibraryLayoutSnapshotGeometryDescriptor *)self->_fromLayoutSnapshotGeometryDescriptor compactifySectionsBeyondVisibleRectWithAnchorSection:v26];
    [(PXCuratedLibraryLayoutSnapshotGeometryDescriptor *)self->_toLayoutSnapshotGeometryDescriptor compactifySectionsBeyondVisibleRectWithAnchorSection:v44];
  }
}

- (void)animation:(id)a3 adjustPresentedGeometries:(id *)a4 styles:(id *)a5 infos:(id *)a6 count:(unsigned int)a7
{
  if (a7) {
    PXGSectionedSpriteTagDecompose();
  }
}

- (id)animation:(id)a3 doubleSidedAnimatedSpriteIndexesForModifiedSpriteIndexes:(id)a4 rootLayout:(id)a5 presentedGeometries:(id *)a6 styles:(id *)a7 infos:(id *)a8
{
  id v10 = (objc_class *)MEMORY[0x1E4F28E60];
  id v11 = a4;
  id v12 = objc_alloc_init(v10);
  int64_t v13 = [(PXCuratedLibraryLayoutSnapshotGeometryDescriptor *)self->_fromLayoutSnapshotGeometryDescriptor dataSourceIdentifier];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __168___PXCuratedLibraryLayoutZoomLevelChangeAnimationHelper_animation_doubleSidedAnimatedSpriteIndexesForModifiedSpriteIndexes_rootLayout_presentedGeometries_styles_infos___block_invoke;
  v16[3] = &unk_1E5DB6070;
  uint64_t v18 = a8;
  int64_t v19 = v13;
  id v14 = v12;
  id v17 = v14;
  [v11 enumerateIndexesUsingBlock:v16];

  return v14;
}

- (unsigned)highFrameRateReason
{
  return 2228227;
}

- (BOOL)wantsPresentationAdjustment
{
  return 1;
}

- (BOOL)wantsDoubleSidedAnimations
{
  return 1;
}

- (double)animationDuration
{
  v2 = +[PXCuratedLibrarySettings sharedInstance];
  [v2 defaultZoomLevelTransitionAnimationDuration];
  double v4 = v3;

  return v4;
}

- (_PXCuratedLibraryLayoutZoomLevelChangeAnimationHelper)initWithLayout:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)_PXCuratedLibraryLayoutZoomLevelChangeAnimationHelper;
  v5 = [(PXCuratedLibraryLayoutAnimationHelper *)&v13 initWithLayout:v4];
  if (v5)
  {
    v5->_userInterfaceDirection = [v4 userInterfaceDirection];
    v6 = [[PXCuratedLibraryLayoutSnapshotGeometryDescriptor alloc] initWithLayout:v4];
    fromLayoutSnapshotGeometryDescriptor = v5->_fromLayoutSnapshotGeometryDescriptor;
    v5->_fromLayoutSnapshotGeometryDescriptor = v6;

    v8 = objc_alloc_init(PXCuratedLibrarySectionGeometryDescriptor);
    nullSectionGeometryDescriptor = v5->_nullSectionGeometryDescriptor;
    v5->_nullSectionGeometryDescriptor = v8;

    id v10 = (UICoordinateSpace *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    coordinateSpace = v5->_coordinateSpace;
    v5->_coordinateSpace = v10;
  }
  return v5;
}

@end
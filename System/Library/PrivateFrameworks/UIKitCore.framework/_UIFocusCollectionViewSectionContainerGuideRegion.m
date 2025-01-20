@interface _UIFocusCollectionViewSectionContainerGuideRegion
- (BOOL)isEqual:(id)a3;
- (CGRect)sectionFrame;
- (UICollectionView)collectionView;
- (id)_fallbackFocusItemForMovementRequest:(id)a3 inFocusMap:(id)a4 withSnapshot:(id)a5;
- (id)_focusRegionWithAdjustedFrame:(CGRect)a3 coordinateSpace:(id)a4;
- (int64_t)section;
- (void)setCollectionView:(id)a3;
- (void)setSection:(int64_t)a3;
- (void)setSectionFrame:(CGRect)a3;
@end

@implementation _UIFocusCollectionViewSectionContainerGuideRegion

- (id)_focusRegionWithAdjustedFrame:(CGRect)a3 coordinateSpace:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)_UIFocusCollectionViewSectionContainerGuideRegion;
  v5 = -[_UIFocusContainerGuideRegion _focusRegionWithAdjustedFrame:coordinateSpace:](&v8, sel__focusRegionWithAdjustedFrame_coordinateSpace_, a4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v6 = [(_UIFocusCollectionViewSectionContainerGuideRegion *)self collectionView];
  [v5 setCollectionView:v6];

  objc_msgSend(v5, "setSection:", -[_UIFocusCollectionViewSectionContainerGuideRegion section](self, "section"));
  [(_UIFocusCollectionViewSectionContainerGuideRegion *)self sectionFrame];
  objc_msgSend(v5, "setSectionFrame:");
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)_UIFocusCollectionViewSectionContainerGuideRegion;
  if ([(_UIFocusContainerGuideRegion *)&v15 isEqual:v4])
  {
    id v5 = v4;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_collectionView);
    id v7 = objc_loadWeakRetained((id *)v5 + 10);
    id v8 = WeakRetained;
    id v9 = v7;
    v10 = v9;
    if (v8 == v9)
    {
    }
    else
    {
      if (v8) {
        BOOL v11 = v9 == 0;
      }
      else {
        BOOL v11 = 1;
      }
      if (v11)
      {

        goto LABEL_14;
      }
      int v13 = [v8 isEqual:v9];

      if (!v13) {
        goto LABEL_14;
      }
    }
    if (self->_section == *((void *)v5 + 11))
    {
      BOOL v12 = CGRectEqualToRect(self->_sectionFrame, *((CGRect *)v5 + 3));
LABEL_15:

      goto LABEL_16;
    }
LABEL_14:
    BOOL v12 = 0;
    goto LABEL_15;
  }
  BOOL v12 = 0;
LABEL_16:

  return v12;
}

- (id)_fallbackFocusItemForMovementRequest:(id)a3 inFocusMap:(id)a4 withSnapshot:(id)a5
{
  uint64_t v77 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_collectionView);

  if (WeakRetained)
  {
    uint64_t v70 = 0;
    v71 = &v70;
    uint64_t v72 = 0x3032000000;
    v73 = __Block_byref_object_copy__132;
    v74 = __Block_byref_object_dispose__132;
    id v75 = 0;
    id v12 = objc_loadWeakRetained((id *)&self->_collectionView);
    [v12 visibleBounds];
    CGFloat v14 = v13;
    CGFloat v16 = v15;
    CGFloat v18 = v17;
    CGFloat v20 = v19;

    [(_UIFocusCollectionViewSectionContainerGuideRegion *)self sectionFrame];
    CGFloat x = v79.origin.x;
    CGFloat y = v79.origin.y;
    CGFloat width = v79.size.width;
    CGFloat height = v79.size.height;
    if (!CGRectIsNull(v79))
    {
      v80.origin.CGFloat x = v14;
      v80.origin.CGFloat y = v16;
      v80.size.CGFloat width = v18;
      v80.size.CGFloat height = v20;
      if (!CGRectIsNull(v80))
      {
        v81.origin.CGFloat x = x;
        v81.origin.CGFloat y = y;
        v81.size.CGFloat width = width;
        v81.size.CGFloat height = height;
        CGRect v82 = CGRectStandardize(v81);
        CGFloat v58 = v82.origin.y;
        CGFloat v59 = v82.origin.x;
        CGFloat v56 = v82.size.height;
        CGFloat v57 = v82.size.width;
        v82.origin.CGFloat x = v14;
        v82.origin.CGFloat y = v16;
        v82.size.CGFloat width = v18;
        v82.size.CGFloat height = v20;
        CGRect v83 = CGRectStandardize(v82);
        CGFloat v54 = v83.origin.y;
        CGFloat v55 = v83.origin.x;
        CGFloat v25 = v83.size.width;
        CGFloat v26 = v83.size.height;
        v83.origin.CGFloat y = v58;
        v83.origin.CGFloat x = v59;
        v83.size.CGFloat height = v56;
        v83.size.CGFloat width = v57;
        double MinX = CGRectGetMinX(v83);
        v84.origin.CGFloat y = v54;
        v84.origin.CGFloat x = v55;
        v84.size.CGFloat width = v25;
        v84.size.CGFloat height = v26;
        if (MinX + 0.0001 <= CGRectGetMaxX(v84))
        {
          v85.origin.CGFloat y = v58;
          v85.origin.CGFloat x = v59;
          v85.size.CGFloat height = v56;
          v85.size.CGFloat width = v57;
          double MaxX = CGRectGetMaxX(v85);
          v86.origin.CGFloat y = v54;
          v86.origin.CGFloat x = v55;
          v86.size.CGFloat width = v25;
          v86.size.CGFloat height = v26;
          BOOL v28 = MaxX + -0.0001 >= CGRectGetMinX(v86);
        }
        else
        {
          BOOL v28 = 0;
        }
        v87.origin.CGFloat y = v58;
        v87.origin.CGFloat x = v59;
        v87.size.CGFloat height = v56;
        v87.size.CGFloat width = v57;
        double MinY = CGRectGetMinY(v87);
        v88.origin.CGFloat y = v54;
        v88.origin.CGFloat x = v55;
        v88.size.CGFloat width = v25;
        v88.size.CGFloat height = v26;
        if (MinY + 0.0001 <= CGRectGetMaxY(v88))
        {
          v89.origin.CGFloat y = v58;
          v89.origin.CGFloat x = v59;
          v89.size.CGFloat height = v56;
          v89.size.CGFloat width = v57;
          double MaxY = CGRectGetMaxY(v89);
          v90.origin.CGFloat y = v54;
          v90.origin.CGFloat x = v55;
          v90.size.CGFloat width = v25;
          v90.size.CGFloat height = v26;
          if (MaxY + -0.0001 >= CGRectGetMinY(v90) && v28)
          {
            id v34 = objc_loadWeakRetained((id *)&self->_collectionView);
            v64[0] = MEMORY[0x1E4F143A8];
            v64[1] = 3221225472;
            v64[2] = __114___UIFocusCollectionViewSectionContainerGuideRegion__fallbackFocusItemForMovementRequest_inFocusMap_withSnapshot___block_invoke;
            v64[3] = &unk_1E52FC528;
            v69 = &v70;
            id v65 = v8;
            id v66 = v9;
            id v67 = v10;
            v68 = self;
            [v34 _performWhileSuppressingPromiseRegionGeneration:v64];
          }
        }
      }
    }
    v35 = (void *)v71[5];
    if (!v35)
    {
      v91.origin.CGFloat x = v14;
      v91.origin.CGFloat y = v16;
      v91.size.CGFloat width = v18;
      v91.size.CGFloat height = v20;
      double v36 = CGRectGetWidth(v91);
      v92.origin.CGFloat x = v14;
      v92.origin.CGFloat y = v16;
      v92.size.CGFloat width = v18;
      v92.size.CGFloat height = v20;
      CGFloat v37 = CGRectGetHeight(v92) * -5.0;
      v93.origin.CGFloat x = v14;
      v93.origin.CGFloat y = v16;
      v93.size.CGFloat width = v18;
      v93.size.CGFloat height = v20;
      CGRect v94 = CGRectInset(v93, v36 * -5.0, v37);
      [(_UIFocusCollectionViewSectionContainerGuideRegion *)self sectionFrame];
      v97.origin.CGFloat x = v14;
      v97.origin.CGFloat y = v16;
      v97.size.CGFloat width = v18;
      v97.size.CGFloat height = v20;
      CGRect v96 = CGRectIntersection(v95, v97);
      double v38 = v96.origin.x;
      double v39 = v96.origin.y;
      double v40 = v96.size.width;
      double v41 = v96.size.height;
      id v42 = objc_loadWeakRetained((id *)&self->_collectionView);
      v43 = [v42 coordinateSpace];
      v44 = objc_msgSend(v42, "_focusPromiseRegionsInRect:inCoordinateSpace:inSection:", v43, -[_UIFocusCollectionViewSectionContainerGuideRegion section](self, "section"), v38, v39, v40, v41);

      v45 = [MEMORY[0x1E4F1CA48] array];
      long long v62 = 0u;
      long long v63 = 0u;
      long long v60 = 0u;
      long long v61 = 0u;
      id v46 = v44;
      uint64_t v47 = [v46 countByEnumeratingWithState:&v60 objects:v76 count:16];
      if (v47)
      {
        uint64_t v48 = *(void *)v61;
        do
        {
          for (uint64_t i = 0; i != v47; ++i)
          {
            if (*(void *)v61 != v48) {
              objc_enumerationMutation(v46);
            }
            v50 = objc_msgSend(*(id *)(*((void *)&v60 + 1) + 8 * i), "createPromiseRegion", *(void *)&v54, *(void *)&v55);
            [v45 addObject:v50];
          }
          uint64_t v47 = [v46 countByEnumeratingWithState:&v60 objects:v76 count:16];
        }
        while (v47);
      }

      uint64_t v51 = [v9 _nextFocusedItemForFocusMovementRequest:v8 inRegions:v45 withSnapshot:v10];
      v52 = (void *)v71[5];
      v71[5] = v51;

      v35 = (void *)v71[5];
    }
    id v29 = v35;
    _Block_object_dispose(&v70, 8);
  }
  else
  {
    id v29 = 0;
  }

  return v29;
}

- (UICollectionView)collectionView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_collectionView);
  return (UICollectionView *)WeakRetained;
}

- (void)setCollectionView:(id)a3
{
}

- (int64_t)section
{
  return self->_section;
}

- (void)setSection:(int64_t)a3
{
  self->_section = a3;
}

- (CGRect)sectionFrame
{
  double x = self->_sectionFrame.origin.x;
  double y = self->_sectionFrame.origin.y;
  double width = self->_sectionFrame.size.width;
  double height = self->_sectionFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setSectionFrame:(CGRect)a3
{
  self->_sectionFrame = a3;
}

- (void).cxx_destruct
{
}

@end
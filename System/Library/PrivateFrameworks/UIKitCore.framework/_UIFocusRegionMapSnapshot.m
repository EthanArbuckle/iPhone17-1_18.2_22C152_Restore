@interface _UIFocusRegionMapSnapshot
+ (id)combinedVisualRepresentationForSnapshots:(id)a3 scaleFactor:(double)a4;
- (BOOL)clipToSnapshotRect;
- (BOOL)isCommitted;
- (BOOL)isPrivateSnapshot;
- (CGPoint)visualRepresentationScreenCenter;
- (CGRect)_clippedRegionFrame:(CGRect)a3 isFocusGuide:(BOOL)a4;
- (CGRect)focusedRect;
- (CGRect)mapEntriesFrame;
- (CGRect)snapshottedRect;
- (CGRect)visualRepresentationMinimumArea;
- (NSArray)finalFocusableRegionMapEntries;
- (NSArray)sortedFocusContainerGuideMapEntries;
- (NSMutableArray)detectedFocusContainerGuideMapEntries;
- (NSMutableArray)detectedFocusableGuideMapEntries;
- (NSMutableArray)detectedFocusableViewMapEntries;
- (NSMutableArray)retainedPromiseRegions;
- (UIImage)visualRepresentation;
- (UIView)focusableRegionAncestorView;
- (UIView)rootView;
- (_UIFocusRegionMapSnapshotRequest)request;
- (id)_finalFocusableRegionMapEntriesFromMapEntries:(id)a3;
- (id)_finalFocusableRegionMapEntriesFromViewMapEntries:(id)a3 guideMapEntries:(id)a4;
- (id)_initWithRequest:(id)a3;
- (id)_snapshotByFulfillingPromiseFocusRegionEntry:(id)a3;
- (id)_sortedEligibleFocusContainerGuidesInArray:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)focusableRegionMapEntriesLimitedByFocusContainerGuide:(id)a3;
- (id)visualRepresentationWithMinimumArea:(CGRect)a3;
- (unint64_t)focusHeading;
- (void)_addFocusContainerGuide:(id)a3 withFrame:(CGRect)a4;
- (void)_addFocusableRegion:(id)a3 isFocusGuide:(BOOL)a4 withFrame:(CGRect)a5;
- (void)_commit;
- (void)_didChooseFocusCandidateRegion:(id)a3;
- (void)_occludeFocusInFrame:(CGRect)a3;
- (void)_punchHoleInMap:(id)a3 atFrame:(CGRect)a4;
- (void)_updateFinalFocusableRegionMapEntries;
- (void)_updateSortedFocusContainerGuideMapEntries;
- (void)setClipToSnapshotRect:(BOOL)a3;
- (void)setCommitted:(BOOL)a3;
- (void)setDetectedFocusContainerGuideMapEntries:(id)a3;
- (void)setDetectedFocusableGuideMapEntries:(id)a3;
- (void)setDetectedFocusableViewMapEntries:(id)a3;
- (void)setFinalFocusableRegionMapEntries:(id)a3;
- (void)setFocusHeading:(unint64_t)a3;
- (void)setFocusableRegionAncestorView:(id)a3;
- (void)setFocusedRect:(CGRect)a3;
- (void)setPrivateSnaphot:(BOOL)a3;
- (void)setRetainedPromiseRegions:(id)a3;
- (void)setSortedFocusContainerGuideMapEntries:(id)a3;
- (void)setVisualRepresentationMinimumArea:(CGRect)a3;
- (void)setVisualRepresentationScreenCenter:(CGPoint)a3;
@end

@implementation _UIFocusRegionMapSnapshot

- (id)_initWithRequest:(id)a3
{
  id v4 = a3;
  v35.receiver = self;
  v35.super_class = (Class)_UIFocusRegionMapSnapshot;
  v5 = [(_UIFocusRegionMapSnapshot *)&v35 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    request = v5->_request;
    v5->_request = (_UIFocusRegionMapSnapshotRequest *)v6;

    v8 = [v4 rootView];
    objc_storeWeak((id *)&v5->_rootView, v8);

    [v4 snapshotRect];
    if (CGRectIsEmpty(v36))
    {
      v9 = [v4 rootView];
      [v9 _focusRegionFrame];
      v5->_snapshottedRect.origin.x = v10;
      v5->_snapshottedRect.origin.y = v11;
      v5->_snapshottedRect.size.width = v12;
      v5->_snapshottedRect.size.height = v13;
    }
    else
    {
      [v4 snapshotRect];
      v5->_snapshottedRect.origin.x = v14;
      v5->_snapshottedRect.origin.y = v15;
      v5->_snapshottedRect.size.width = v16;
      v5->_snapshottedRect.size.height = v17;
    }
    [v4 focusedRect];
    v5->_focusedRect.origin.x = v18;
    v5->_focusedRect.origin.y = v19;
    v5->_focusedRect.size.width = v20;
    v5->_focusedRect.size.height = v21;
    v5->_focusHeading = [v4 focusHeading];
    v5->_clipToSnapshotRect = [v4 clipToSnapshotRect];
    [v4 visualRepresentationMinimumArea];
    v5->_visualRepresentationMinimumArea.origin.x = v22;
    v5->_visualRepresentationMinimumArea.origin.y = v23;
    v5->_visualRepresentationMinimumArea.size.width = v24;
    v5->_visualRepresentationMinimumArea.size.height = v25;
    v26 = [v4 focusableRegionAncestorView];
    objc_storeWeak((id *)&v5->_focusableRegionAncestorView, v26);

    v27 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    detectedFocusableViewMapEntries = v5->_detectedFocusableViewMapEntries;
    v5->_detectedFocusableViewMapEntries = v27;

    v29 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    detectedFocusableGuideMapEntries = v5->_detectedFocusableGuideMapEntries;
    v5->_detectedFocusableGuideMapEntries = v29;

    v31 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    detectedFocusContainerGuideMapEntries = v5->_detectedFocusContainerGuideMapEntries;
    v5->_detectedFocusContainerGuideMapEntries = v31;

    CGSize v33 = *(CGSize *)(MEMORY[0x1E4F1DB20] + 16);
    v5->_regionClipFrame.origin = (CGPoint)*MEMORY[0x1E4F1DB20];
    v5->_regionClipFrame.size = v33;
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [+[_UIFocusRegionMapSnapshot allocWithZone:a3] _initWithRequest:self->_request];
  uint64_t v5 = [(_UIFocusRegionMapSnapshotRequest *)self->_request copy];
  uint64_t v6 = (void *)*((void *)v4 + 8);
  *((void *)v4 + 8) = v5;

  id WeakRetained = objc_loadWeakRetained((id *)&self->_rootView);
  objc_storeWeak((id *)v4 + 9, WeakRetained);

  CGSize size = self->_snapshottedRect.size;
  *((_OWORD *)v4 + 12) = self->_snapshottedRect.origin;
  *((CGSize *)v4 + 13) = size;
  *((unsigned char *)v4 + 48) = self->_committed;
  CGSize v9 = self->_focusedRect.size;
  *((_OWORD *)v4 + 14) = self->_focusedRect.origin;
  *((CGSize *)v4 + 15) = v9;
  *((void *)v4 + 15) = self->_focusHeading;
  *((unsigned char *)v4 + 50) = self->_clipToSnapshotRect;
  CGSize v10 = self->_visualRepresentationMinimumArea.size;
  *((_OWORD *)v4 + 16) = self->_visualRepresentationMinimumArea.origin;
  *((CGSize *)v4 + 17) = v10;
  id v11 = objc_loadWeakRetained((id *)&self->_focusableRegionAncestorView);
  objc_storeWeak((id *)v4 + 16, v11);

  uint64_t v12 = [(NSMutableArray *)self->_retainedPromiseRegions mutableCopy];
  CGFloat v13 = (void *)*((void *)v4 + 14);
  *((void *)v4 + 14) = v12;

  uint64_t v14 = [(NSMutableArray *)self->_detectedFocusableViewMapEntries mutableCopy];
  CGFloat v15 = (void *)*((void *)v4 + 11);
  *((void *)v4 + 11) = v14;

  uint64_t v16 = [(NSMutableArray *)self->_detectedFocusableGuideMapEntries mutableCopy];
  CGFloat v17 = (void *)*((void *)v4 + 12);
  *((void *)v4 + 12) = v16;

  uint64_t v18 = [(NSMutableArray *)self->_detectedFocusContainerGuideMapEntries mutableCopy];
  CGFloat v19 = (void *)*((void *)v4 + 13);
  *((void *)v4 + 13) = v18;

  uint64_t v20 = [(NSArray *)self->_finalFocusableRegionMapEntries copy];
  CGFloat v21 = (void *)*((void *)v4 + 17);
  *((void *)v4 + 17) = v20;

  uint64_t v22 = [(NSArray *)self->_sortedFocusContainerGuideMapEntries copy];
  CGFloat v23 = (void *)*((void *)v4 + 10);
  *((void *)v4 + 10) = v22;

  return v4;
}

- (void)setFocusedRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  if (!CGRectEqualToRect(self->_focusedRect, a3))
  {
    self->_focusedRect.origin.CGFloat x = x;
    self->_focusedRect.origin.CGFloat y = y;
    self->_focusedRect.size.CGFloat width = width;
    self->_focusedRect.size.CGFloat height = height;
    v8.origin.CGFloat x = x;
    v8.origin.CGFloat y = y;
    v8.size.CGFloat width = width;
    v8.size.CGFloat height = height;
    self->_isFocusedRectEmptCGFloat y = CGRectIsEmpty(v8);
  }
}

- (CGRect)_clippedRegionFrame:(CGRect)a3 isFocusGuide:(BOOL)a4
{
  BOOL v4 = a4;
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  if ([(_UIFocusRegionMapSnapshot *)self clipToSnapshotRect])
  {
    [(_UIFocusRegionMapSnapshot *)self snapshottedRect];
    v41.origin.CGFloat x = x;
    v41.origin.CGFloat y = y;
    v41.size.CGFloat width = width;
    v41.size.CGFloat height = height;
    CGRect v35 = CGRectIntersection(v34, v41);
    CGFloat v10 = v35.origin.x;
    CGFloat v11 = v35.origin.y;
    CGFloat v12 = v35.size.width;
    CGFloat v13 = v35.size.height;
    if (!self->_isFocusedRectEmpty && v4 && !CGRectIsNull(v35))
    {
      if (self->_didSetRegionClipFrame)
      {
        CGFloat v14 = self->_regionClipFrame.origin.x;
        CGFloat v15 = self->_regionClipFrame.origin.y;
        CGFloat v16 = self->_regionClipFrame.size.width;
        CGFloat v17 = self->_regionClipFrame.size.height;
      }
      else
      {
        [(_UIFocusRegionMapSnapshot *)self snapshottedRect];
        CGFloat v19 = v18;
        CGFloat v21 = v20;
        CGFloat v23 = v22;
        CGFloat v25 = v24;
        [(_UIFocusRegionMapSnapshot *)self focusedRect];
        v42.origin.CGFloat x = v26;
        v42.origin.CGFloat y = v27;
        v42.size.CGFloat width = v28;
        v42.size.CGFloat height = v29;
        v36.origin.CGFloat x = v19;
        v36.origin.CGFloat y = v21;
        v36.size.CGFloat width = v23;
        v36.size.CGFloat height = v25;
        *(CGRect *)&CGFloat v14 = CGRectUnion(v36, v42);
        self->_regionClipFrame.origin.CGFloat x = v14;
        self->_regionClipFrame.origin.CGFloat y = v15;
        self->_regionClipFrame.size.CGFloat width = v16;
        self->_regionClipFrame.size.CGFloat height = v17;
        self->_didSetRegionClipFrame = 1;
      }
      v43.origin.CGFloat x = x;
      v43.origin.CGFloat y = y;
      v43.size.CGFloat width = width;
      v43.size.CGFloat height = height;
      CGRect v37 = CGRectIntersection(*(CGRect *)&v14, v43);
      CGFloat v10 = v37.origin.x;
      CGFloat v11 = v37.origin.y;
      CGFloat v12 = v37.size.width;
      CGFloat v13 = v37.size.height;
    }
    v38.origin.CGFloat x = v10;
    v38.origin.CGFloat y = v11;
    v38.size.CGFloat width = v12;
    v38.size.CGFloat height = v13;
    if (fabs(CGRectGetWidth(v38)) < 0.0001
      || (v39.origin.CGFloat x = v10,
          v39.origin.CGFloat y = v11,
          v39.size.CGFloat width = v12,
          v39.size.CGFloat height = v13,
          fabs(CGRectGetHeight(v39)) < 0.0001))
    {
      CGFloat v10 = *MEMORY[0x1E4F1DB20];
      CGFloat v11 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
      CGFloat v12 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
      CGFloat v13 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
    }
  }
  else
  {
    CGFloat v10 = x;
    CGFloat v11 = y;
    CGFloat v12 = width;
    CGFloat v13 = height;
  }
  double v30 = v10;
  double v31 = v11;
  double v32 = v12;
  double v33 = v13;
  result.size.CGFloat height = v33;
  result.size.CGFloat width = v32;
  result.origin.CGFloat y = v31;
  result.origin.CGFloat x = v30;
  return result;
}

- (void)_addFocusableRegion:(id)a3 isFocusGuide:(BOOL)a4 withFrame:(CGRect)a5
{
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  BOOL v9 = a4;
  id v25 = a3;
  -[_UIFocusRegionMapSnapshot _clippedRegionFrame:isFocusGuide:](self, "_clippedRegionFrame:isFocusGuide:", v9, x, y, width, height);
  double v11 = v27.origin.x;
  double v12 = v27.origin.y;
  double v13 = v27.size.width;
  double v14 = v27.size.height;
  BOOL IsNull = CGRectIsNull(v27);
  CGFloat v16 = v25;
  if (!IsNull)
  {
    if (v9)
    {
      [(_UIFocusRegionMapSnapshot *)self detectedFocusableGuideMapEntries];
    }
    else
    {
      CGFloat v17 = [(_UIFocusRegionMapSnapshot *)self detectedFocusableViewMapEntries];
      -[_UIFocusRegionMapSnapshot _punchHoleInMap:atFrame:](self, "_punchHoleInMap:atFrame:", v17, v11, v12, v13, v14);

      double v18 = [(_UIFocusRegionMapSnapshot *)self detectedFocusableGuideMapEntries];
      -[_UIFocusRegionMapSnapshot _punchHoleInMap:atFrame:](self, "_punchHoleInMap:atFrame:", v18, v11, v12, v13, v14);

      [(_UIFocusRegionMapSnapshot *)self detectedFocusContainerGuideMapEntries];
    CGFloat v19 = };
    -[_UIFocusRegionMapSnapshot _punchHoleInMap:atFrame:](self, "_punchHoleInMap:atFrame:", v19, v11, v12, v13, v14);

    double v20 = -[_UIFocusRegionMapEntry initWithFrame:originalRegionFrame:]([_UIFocusableRegionMapEntry alloc], "initWithFrame:originalRegionFrame:", v11, v12, v13, v14, x, y, width, height);
    [(_UIFocusableRegionMapEntry *)v20 setFocusableRegion:v25];
    [(_UIFocusableRegionMapEntry *)v20 setIsFocusGuide:v9];
    if (v9) {
      [(_UIFocusRegionMapSnapshot *)self detectedFocusableGuideMapEntries];
    }
    else {
    CGFloat v21 = [(_UIFocusRegionMapSnapshot *)self detectedFocusableViewMapEntries];
    }
    [v21 addObject:v20];

    if ([v25 _isPromiseFocusRegion])
    {
      retainedPromiseRegions = self->_retainedPromiseRegions;
      if (!retainedPromiseRegions)
      {
        CGFloat v23 = [MEMORY[0x1E4F1CA48] array];
        double v24 = self->_retainedPromiseRegions;
        self->_retainedPromiseRegions = v23;

        retainedPromiseRegions = self->_retainedPromiseRegions;
      }
      [(NSMutableArray *)retainedPromiseRegions addObject:v25];
    }

    CGFloat v16 = v25;
  }
}

- (void)_addFocusContainerGuide:(id)a3 withFrame:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v9 = a3;
  if (!self->_isFocusedRectEmpty)
  {
    id v18 = v9;
    unint64_t v10 = [(_UIFocusRegionMapSnapshot *)self focusHeading];
    id v9 = v18;
    if (v10)
    {
      -[_UIFocusRegionMapSnapshot _clippedRegionFrame:isFocusGuide:](self, "_clippedRegionFrame:isFocusGuide:", 1, x, y, width, height);
      double v11 = v20.origin.x;
      double v12 = v20.origin.y;
      double v13 = v20.size.width;
      double v14 = v20.size.height;
      BOOL IsNull = CGRectIsNull(v20);
      id v9 = v18;
      if (!IsNull)
      {
        CGFloat v16 = -[_UIFocusRegionMapEntry initWithFrame:originalRegionFrame:]([_UIFocusContainerGuideMapEntry alloc], "initWithFrame:originalRegionFrame:", v11, v12, v13, v14, x, y, width, height);
        [(_UIFocusContainerGuideMapEntry *)v16 setFocusContainerGuide:v18];
        -[_UIFocusContainerGuideMapEntry setFocusContainmentFrame:](v16, "setFocusContainmentFrame:", x, y, width, height);
        CGFloat v17 = [(_UIFocusRegionMapSnapshot *)self detectedFocusContainerGuideMapEntries];
        [v17 addObject:v16];

        id v9 = v18;
      }
    }
  }
}

- (void)_occludeFocusInFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  CGRect v8 = [(_UIFocusRegionMapSnapshot *)self detectedFocusableViewMapEntries];
  -[_UIFocusRegionMapSnapshot _punchHoleInMap:atFrame:](self, "_punchHoleInMap:atFrame:", v8, x, y, width, height);

  id v9 = [(_UIFocusRegionMapSnapshot *)self detectedFocusableGuideMapEntries];
  -[_UIFocusRegionMapSnapshot _punchHoleInMap:atFrame:](self, "_punchHoleInMap:atFrame:", v9, x, y, width, height);

  id v10 = [(_UIFocusRegionMapSnapshot *)self detectedFocusContainerGuideMapEntries];
  -[_UIFocusRegionMapSnapshot _punchHoleInMap:atFrame:](self, "_punchHoleInMap:atFrame:", v10, x, y, width, height);
}

- (void)_punchHoleInMap:(id)a3 atFrame:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  if ([v8 count])
  {
    id v9 = objc_alloc_init(MEMORY[0x1E4F28E60]);
    id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v11 = v8;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v19 != v14) {
            objc_enumerationMutation(v11);
          }
          CGFloat v16 = *(void **)(*((void *)&v18 + 1) + 8 * i);
          CGFloat v17 = objc_msgSend(v16, "_mapEntriesByOccludingWithFrame:", x, y, width, height, (void)v18);
          if (v17)
          {
            objc_msgSend(v9, "addIndex:", objc_msgSend(v11, "indexOfObject:", v16));
            [v10 addObjectsFromArray:v17];
          }
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v13);
    }

    [v11 removeObjectsAtIndexes:v9];
    [v11 addObjectsFromArray:v10];
  }
}

- (id)_finalFocusableRegionMapEntriesFromMapEntries:(id)a3
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v46 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v53 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  obuint64_t j = v4;
  uint64_t v6 = [obj countByEnumeratingWithState:&v53 objects:v58 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v54;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v54 != v8) {
          objc_enumerationMutation(obj);
        }
        id v10 = *(void **)(*((void *)&v53 + 1) + 8 * i);
        id v11 = [v10 focusableRegion];
        char v12 = [v5 containsObject:v11];

        if ((v12 & 1) == 0)
        {
          uint64_t v13 = [(_UIFocusRegionMapSnapshot *)self focusableRegionAncestorView];
          if (v13)
          {
            uint64_t v14 = (void *)v13;
            CGFloat v15 = [v10 focusableRegion];
            CGFloat v16 = [v15 _focusRegionView];
            [(_UIFocusRegionMapSnapshot *)self focusableRegionAncestorView];
            uint64_t v17 = v7;
            uint64_t v18 = v8;
            id v19 = v5;
            v21 = long long v20 = self;
            char v48 = [v16 isDescendantOfView:v21];

            self = v20;
            id v5 = v19;
            uint64_t v8 = v18;
            uint64_t v7 = v17;

            if ((v48 & 1) == 0)
            {
LABEL_12:
              CGRect v36 = [v10 focusableRegion];
              [v5 addObject:v36];

              continue;
            }
          }
          if ([v10 isFocusGuide])
          {
            double v22 = [v10 focusableRegion];
            if ([v22 _automaticallyDisableWhenIntersectingFocus])
            {
              [v10 frame];
              CGFloat v24 = v23;
              CGFloat v26 = v25;
              CGFloat v28 = v27;
              CGFloat v30 = v29;
              [(_UIFocusRegionMapSnapshot *)self focusedRect];
              v62.origin.double x = v31;
              v62.origin.double y = v32;
              v62.size.double width = v33;
              v62.size.double height = v34;
              v61.origin.double x = v24;
              v61.origin.double y = v26;
              v61.size.double width = v28;
              v61.size.double height = v30;
              BOOL v35 = CGRectIntersectsRect(v61, v62);

              if (v35) {
                goto LABEL_12;
              }
            }
            else
            {
            }
          }
          [v46 addObject:v10];
        }
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v53 objects:v58 count:16];
    }
    while (v7);
  }

  if ([v46 count] && objc_msgSend(v5, "count"))
  {
    long long v51 = 0u;
    long long v52 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    CGRect v37 = (void *)[v46 copy];
    uint64_t v38 = [v37 countByEnumeratingWithState:&v49 objects:v57 count:16];
    if (v38)
    {
      uint64_t v39 = v38;
      uint64_t v40 = *(void *)v50;
      do
      {
        for (uint64_t j = 0; j != v39; ++j)
        {
          if (*(void *)v50 != v40) {
            objc_enumerationMutation(v37);
          }
          CGRect v42 = *(void **)(*((void *)&v49 + 1) + 8 * j);
          CGRect v43 = [v42 focusableRegion];
          int v44 = [v5 containsObject:v43];

          if (v44) {
            [v46 removeObject:v42];
          }
        }
        uint64_t v39 = [v37 countByEnumeratingWithState:&v49 objects:v57 count:16];
      }
      while (v39);
    }
  }
  return v46;
}

- (id)_finalFocusableRegionMapEntriesFromViewMapEntries:(id)a3 guideMapEntries:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  uint64_t v7 = [(_UIFocusRegionMapSnapshot *)self _finalFocusableRegionMapEntriesFromMapEntries:a3];
  uint64_t v8 = [(_UIFocusRegionMapSnapshot *)self _finalFocusableRegionMapEntriesFromMapEntries:v6];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        uint64_t v14 = [(_UIFocusRegionMapSnapshot *)self detectedFocusContainerGuideMapEntries];
        [v13 frame];
        -[_UIFocusRegionMapSnapshot _punchHoleInMap:atFrame:](self, "_punchHoleInMap:atFrame:", v14);

        [v13 frame];
        -[_UIFocusRegionMapSnapshot _punchHoleInMap:atFrame:](self, "_punchHoleInMap:atFrame:", v7);
        [v7 addObject:v13];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v10);
  }

  return v7;
}

- (id)_sortedEligibleFocusContainerGuidesInArray:(id)a3
{
  uint64_t v85 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (![v4 count] || self->_isFocusedRectEmpty)
  {
    id v5 = [MEMORY[0x1E4F1C978] array];
    goto LABEL_36;
  }
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  id v73 = v4;
  id v74 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v79 = 0u;
  long long v80 = 0u;
  long long v81 = 0u;
  long long v82 = 0u;
  id v8 = v4;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v79 objects:v84 count:16];
  if (!v9) {
    goto LABEL_19;
  }
  uint64_t v10 = v9;
  uint64_t v11 = *(void *)v80;
  do
  {
    for (uint64_t i = 0; i != v10; ++i)
    {
      if (*(void *)v80 != v11) {
        objc_enumerationMutation(v8);
      }
      uint64_t v13 = *(void **)(*((void *)&v79 + 1) + 8 * i);
      uint64_t v14 = objc_msgSend(v13, "focusContainerGuide", v73);
      char v15 = [v7 containsObject:v14];

      if ((v15 & 1) == 0)
      {
        long long v16 = [v13 focusContainerGuide];
        if ([v16 _automaticallyDisableWhenIntersectingFocus])
        {
          [v13 frame];
          CGFloat v18 = v17;
          CGFloat v20 = v19;
          CGFloat v22 = v21;
          CGFloat v24 = v23;
          [(_UIFocusRegionMapSnapshot *)self focusedRect];
          v88.origin.double x = v25;
          v88.origin.double y = v26;
          v88.size.double width = v27;
          v88.size.double height = v28;
          v87.origin.double x = v18;
          v87.origin.double y = v20;
          v87.size.double width = v22;
          v87.size.double height = v24;
          BOOL v29 = CGRectIntersectsRect(v87, v88);

          if (v29)
          {
            CGFloat v30 = [v13 focusContainerGuide];
            CGFloat v31 = v7;
LABEL_16:
            [v31 addObject:v30];

            continue;
          }
        }
        else
        {
        }
        CGFloat v32 = [v13 focusContainerGuide];
        char v33 = [v74 containsObject:v32];

        if (v33) {
          continue;
        }
        [v6 addObject:v13];
        CGFloat v30 = [v13 focusContainerGuide];
        CGFloat v31 = v74;
        goto LABEL_16;
      }
    }
    uint64_t v10 = [v8 countByEnumeratingWithState:&v79 objects:v84 count:16];
  }
  while (v10);
LABEL_19:

  if ([v6 count])
  {
    long long v77 = 0u;
    long long v78 = 0u;
    long long v75 = 0u;
    long long v76 = 0u;
    CGFloat v34 = (void *)[v6 copy];
    uint64_t v35 = [v34 countByEnumeratingWithState:&v75 objects:v83 count:16];
    if (v35)
    {
      uint64_t v36 = v35;
      uint64_t v37 = *(void *)v76;
      double v38 = -1.0;
      do
      {
        for (uint64_t j = 0; j != v36; ++j)
        {
          if (*(void *)v76 != v37) {
            objc_enumerationMutation(v34);
          }
          uint64_t v40 = *(void **)(*((void *)&v75 + 1) + 8 * j);
          CGRect v41 = objc_msgSend(v40, "focusContainerGuide", v73);
          char v42 = [v7 containsObject:v41];

          if (v42) {
            goto LABEL_29;
          }
          if (v38 < 0.0)
          {
            [(_UIFocusRegionMapSnapshot *)self focusedRect];
            double v47 = _UIRectDeparturePointAlongFocusHeading([(_UIFocusRegionMapSnapshot *)self focusHeading], v43, v44, v45, v46);
            double v49 = v48;
            [(_UIFocusRegionMapSnapshot *)self snapshottedRect];
            double v54 = _UIRectDeparturePointAlongFocusHeading([(_UIFocusRegionMapSnapshot *)self focusHeading], v50, v51, v52, v53);
            _UIPointAxisAlignedDistanceAlongFocusHeading([(_UIFocusRegionMapSnapshot *)self focusHeading], v47, v49, v54, v55);
            double v38 = v56;
          }
          [(_UIFocusRegionMapSnapshot *)self focusedRect];
          double v61 = _UIRectDeparturePointAlongFocusHeading([(_UIFocusRegionMapSnapshot *)self focusHeading], v57, v58, v59, v60);
          double v63 = v62;
          [v40 focusContainmentFrame];
          double v68 = _UIRectDeparturePointAlongFocusHeading([(_UIFocusRegionMapSnapshot *)self focusHeading], v64, v65, v66, v67);
          _UIPointAxisAlignedDistanceAlongFocusHeading([(_UIFocusRegionMapSnapshot *)self focusHeading], v61, v63, v68, v69);
          objc_msgSend(v40, "setAxisAlignedDistanceFromFocusedRect:");
          [v40 axisAlignedDistanceFromFocusedRect];
          if (v70 > v38) {
LABEL_29:
          }
            [v6 removeObject:v40];
        }
        uint64_t v36 = [v34 countByEnumeratingWithState:&v75 objects:v83 count:16];
      }
      while (v36);
    }
  }
  id v71 = v6;
  id v5 = v71;
  if ((unint64_t)[v71 count] >= 2)
  {
    id v5 = [v71 sortedArrayUsingComparator:&__block_literal_global_207];
  }
  id v4 = v73;
LABEL_36:

  return v5;
}

- (void)_updateFinalFocusableRegionMapEntries
{
  id v5 = [(_UIFocusRegionMapSnapshot *)self detectedFocusableViewMapEntries];
  v3 = [(_UIFocusRegionMapSnapshot *)self detectedFocusableGuideMapEntries];
  id v4 = [(_UIFocusRegionMapSnapshot *)self _finalFocusableRegionMapEntriesFromViewMapEntries:v5 guideMapEntries:v3];
  [(_UIFocusRegionMapSnapshot *)self setFinalFocusableRegionMapEntries:v4];
}

- (void)_updateSortedFocusContainerGuideMapEntries
{
  id v4 = [(_UIFocusRegionMapSnapshot *)self detectedFocusContainerGuideMapEntries];
  v3 = [(_UIFocusRegionMapSnapshot *)self _sortedEligibleFocusContainerGuidesInArray:v4];
  [(_UIFocusRegionMapSnapshot *)self setSortedFocusContainerGuideMapEntries:v3];
}

- (void)_commit
{
  [(_UIFocusRegionMapSnapshot *)self _updateFinalFocusableRegionMapEntries];
  [(_UIFocusRegionMapSnapshot *)self _updateSortedFocusContainerGuideMapEntries];
  [(_UIFocusRegionMapSnapshot *)self setCommitted:1];
}

- (id)focusableRegionMapEntriesLimitedByFocusContainerGuide:(id)a3
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    uint64_t v39 = [MEMORY[0x1E4F28B00] currentHandler];
    [v39 handleFailureInMethod:a2, self, @"_UIFocusRegionMapSnapshot.m", 608, @"Invalid parameter not satisfying: %@", @"focusContainerGuide" object file lineNumber description];
  }
  [(_UIFocusRegionMapSnapshot *)self snapshottedRect];
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  [v5 _focusRegionFrame];
  CGFloat v15 = v14;
  CGFloat v17 = v16;
  CGFloat v19 = v18;
  CGFloat v21 = v20;
  [(_UIFocusRegionMapSnapshot *)self focusedRect];
  v51.origin.CGFloat x = v22;
  v51.origin.CGFloat y = v23;
  v51.size.CGFloat width = v24;
  v51.size.CGFloat height = v25;
  v47.origin.CGFloat x = v15;
  v47.origin.CGFloat y = v17;
  v47.size.CGFloat width = v19;
  v47.size.CGFloat height = v21;
  CGRect v52 = CGRectUnion(v47, v51);
  v48.origin.CGFloat x = v7;
  v48.origin.CGFloat y = v9;
  v48.size.CGFloat width = v11;
  v48.size.CGFloat height = v13;
  CGRect v49 = CGRectIntersection(v48, v52);
  CGFloat x = v49.origin.x;
  CGFloat y = v49.origin.y;
  CGFloat width = v49.size.width;
  CGFloat height = v49.size.height;
  id v30 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  CGFloat v31 = [(_UIFocusRegionMapSnapshot *)self finalFocusableRegionMapEntries];
  uint64_t v32 = [v31 countByEnumeratingWithState:&v40 objects:v44 count:16];
  if (v32)
  {
    uint64_t v33 = v32;
    uint64_t v34 = *(void *)v41;
    do
    {
      for (uint64_t i = 0; i != v33; ++i)
      {
        if (*(void *)v41 != v34) {
          objc_enumerationMutation(v31);
        }
        uint64_t v36 = *(void **)(*((void *)&v40 + 1) + 8 * i);
        [v36 frame];
        v53.origin.CGFloat x = x;
        v53.origin.CGFloat y = y;
        v53.size.CGFloat width = width;
        v53.size.CGFloat height = height;
        if (CGRectIntersectsRect(v50, v53)) {
          [v30 addObject:v36];
        }
      }
      uint64_t v33 = [v31 countByEnumeratingWithState:&v40 objects:v44 count:16];
    }
    while (v33);
  }

  uint64_t v37 = (void *)[v30 copy];
  return v37;
}

- (id)_snapshotByFulfillingPromiseFocusRegionEntry:(id)a3
{
  uint64_t v98 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (void *)[(_UIFocusRegionMapSnapshot *)self copy];
  if (v4
    && ([v4 focusableRegion],
        double v6 = objc_claimAutoreleasedReturnValue(),
        char v7 = [v6 _isPromiseFocusRegion],
        v6,
        (v7 & 1) != 0))
  {
    double v8 = [v4 focusableRegion];
    CGFloat v9 = [v8 _fulfillPromisedFocusRegion];

    if (v9)
    {
      long long v76 = v5;
      if (!_UIFocusItemIsFocusedOrFocusable(v9)) {
        goto LABEL_17;
      }
      [v9 _focusRegionFrame];
      CGFloat v11 = v10;
      CGFloat v13 = v12;
      CGFloat v15 = v14;
      CGFloat v17 = v16;
      [v4 originalRegionFrame];
      v101.origin.CGFloat x = v18;
      v101.origin.CGFloat y = v19;
      v101.size.CGFloat width = v20;
      v101.size.CGFloat height = v21;
      v100.origin.CGFloat x = v11;
      v100.origin.CGFloat y = v13;
      v100.size.CGFloat width = v15;
      v100.size.CGFloat height = v17;
      if (CGRectEqualToRect(v100, v101))
      {
        CGFloat v22 = v9;
        id v77 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        id v23 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        long long v86 = 0u;
        long long v87 = 0u;
        long long v88 = 0u;
        long long v89 = 0u;
        CGFloat v24 = [v5 detectedFocusableViewMapEntries];
        uint64_t v25 = [v24 countByEnumeratingWithState:&v86 objects:v96 count:16];
        if (v25)
        {
          uint64_t v26 = v25;
          uint64_t v27 = *(void *)v87;
          do
          {
            for (uint64_t i = 0; i != v26; ++i)
            {
              if (*(void *)v87 != v27) {
                objc_enumerationMutation(v24);
              }
              BOOL v29 = *(void **)(*((void *)&v86 + 1) + 8 * i);
              id v30 = [v29 focusableRegion];
              CGFloat v31 = [v4 focusableRegion];

              if (v30 == v31)
              {
                [v29 frame];
                uint64_t v32 = objc_msgSend(v29, "sliceWithFrame:");
                [v32 setFocusableRegion:v22];
                [v23 addObject:v32];
                [v77 addObject:v29];
              }
            }
            uint64_t v26 = [v24 countByEnumeratingWithState:&v86 objects:v96 count:16];
          }
          while (v26);
        }

        id v5 = v76;
        uint64_t v33 = [v76 detectedFocusableViewMapEntries];
        [v33 removeObjectsInArray:v77];

        uint64_t v34 = [v76 detectedFocusableViewMapEntries];
        [v34 addObjectsFromArray:v23];

        [v76 _updateFinalFocusableRegionMapEntries];
      }
      else
      {
LABEL_17:
        uint64_t v36 = [(_UIFocusRegionMapSnapshot *)self request];
        uint64_t v37 = (void *)[v36 copy];

        long long v75 = v9;
        [v37 setRootView:v9];
        double v38 = [v4 originalEntry];
        [v38 frame];
        objc_msgSend(v37, "setSnapshotRect:");

        id v77 = v37;
        id v23 = [v37 takeSnapshot];
        long long v82 = 0u;
        long long v83 = 0u;
        long long v84 = 0u;
        long long v85 = 0u;
        uint64_t v39 = [v4 originalEntry];
        long long v40 = [v39 occludingFrames];

        uint64_t v41 = [v40 countByEnumeratingWithState:&v82 objects:v95 count:16];
        if (v41)
        {
          uint64_t v42 = v41;
          uint64_t v43 = *(void *)v83;
          do
          {
            for (uint64_t j = 0; j != v42; ++j)
            {
              if (*(void *)v83 != v43) {
                objc_enumerationMutation(v40);
              }
              [*(id *)(*((void *)&v82 + 1) + 8 * j) CGRectValue];
              objc_msgSend(v23, "_occludeFocusInFrame:");
            }
            uint64_t v42 = [v40 countByEnumeratingWithState:&v82 objects:v95 count:16];
          }
          while (v42);
        }

        id v45 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        long long v78 = 0u;
        long long v79 = 0u;
        long long v80 = 0u;
        long long v81 = 0u;
        double v46 = [v76 detectedFocusableViewMapEntries];
        uint64_t v47 = [v46 countByEnumeratingWithState:&v78 objects:v94 count:16];
        if (v47)
        {
          uint64_t v48 = v47;
          uint64_t v49 = *(void *)v79;
          do
          {
            for (uint64_t k = 0; k != v48; ++k)
            {
              if (*(void *)v79 != v49) {
                objc_enumerationMutation(v46);
              }
              CGRect v51 = *(void **)(*((void *)&v78 + 1) + 8 * k);
              CGRect v52 = [v51 focusableRegion];
              CGRect v53 = [v4 focusableRegion];

              if (v52 == v53) {
                [v45 addObject:v51];
              }
            }
            uint64_t v48 = [v46 countByEnumeratingWithState:&v78 objects:v94 count:16];
          }
          while (v48);
        }

        double v54 = [v76 detectedFocusableViewMapEntries];
        [v54 removeObjectsInArray:v45];

        double v55 = [v76 detectedFocusableViewMapEntries];
        double v56 = [v23 detectedFocusableViewMapEntries];
        [v55 addObjectsFromArray:v56];

        double v57 = [v76 detectedFocusableGuideMapEntries];
        double v58 = [v23 detectedFocusableGuideMapEntries];
        [v57 addObjectsFromArray:v58];

        double v59 = [v76 detectedFocusContainerGuideMapEntries];
        double v60 = [v23 detectedFocusContainerGuideMapEntries];
        [v59 addObjectsFromArray:v60];

        id v5 = v76;
        [v76 _commit];

        CGFloat v22 = v75;
      }

      id v61 = v5;
    }
    else
    {
      id v62 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      long long v90 = 0u;
      long long v91 = 0u;
      long long v92 = 0u;
      long long v93 = 0u;
      double v63 = v5;
      double v64 = [v5 detectedFocusableViewMapEntries];
      uint64_t v65 = [v64 countByEnumeratingWithState:&v90 objects:v97 count:16];
      if (v65)
      {
        uint64_t v66 = v65;
        uint64_t v67 = *(void *)v91;
        do
        {
          for (uint64_t m = 0; m != v66; ++m)
          {
            if (*(void *)v91 != v67) {
              objc_enumerationMutation(v64);
            }
            double v69 = *(void **)(*((void *)&v90 + 1) + 8 * m);
            double v70 = [v69 focusableRegion];
            id v71 = [v4 focusableRegion];

            if (v70 == v71) {
              [v62 addObject:v69];
            }
          }
          uint64_t v66 = [v64 countByEnumeratingWithState:&v90 objects:v97 count:16];
        }
        while (v66);
      }

      id v5 = v63;
      v72 = [v63 detectedFocusableViewMapEntries];
      [v72 removeObjectsInArray:v62];

      [v63 _updateFinalFocusableRegionMapEntries];
      id v73 = v63;

      CGFloat v22 = 0;
    }
  }
  else
  {
    id v35 = v5;
  }

  return v5;
}

- (void)_didChooseFocusCandidateRegion:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = [(_UIFocusRegionMapSnapshot *)self finalFocusableRegionMapEntries];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        double v10 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        id v11 = [v10 focusableRegion];

        if (v11 == v4) {
          [v10 setFocusCandidate:1];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }
}

- (CGRect)mapEntriesFrame
{
  uint64_t v71 = *MEMORY[0x1E4F143B8];
  if ([(_UIFocusRegionMapSnapshot *)self isCommitted] && CGRectIsNull(self->_mapEntriesFrame))
  {
    CGFloat v3 = *MEMORY[0x1E4F1DB20];
    CGFloat v4 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
    CGFloat v5 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
    CGFloat v6 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
    long long v66 = 0u;
    long long v67 = 0u;
    long long v64 = 0u;
    long long v65 = 0u;
    uint64_t v7 = [(_UIFocusRegionMapSnapshot *)self detectedFocusableViewMapEntries];
    uint64_t v8 = [v7 countByEnumeratingWithState:&v64 objects:v70 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v65;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v65 != v10) {
            objc_enumerationMutation(v7);
          }
          long long v12 = *(void **)(*((void *)&v64 + 1) + 8 * v11);
          v72.origin.double x = v3;
          v72.origin.double y = v4;
          v72.size.double width = v5;
          v72.size.double height = v6;
          BOOL IsNull = CGRectIsNull(v72);
          [v12 frame];
          CGFloat v18 = v14;
          double v19 = v15;
          double v20 = v16;
          double v21 = v17;
          if (!IsNull)
          {
            v73.origin.double x = v3;
            v73.origin.double y = v4;
            v73.size.double width = v5;
            v73.size.double height = v6;
            *(CGRect *)&CGFloat v14 = CGRectUnion(v73, *(CGRect *)&v18);
          }
          CGFloat v3 = v14;
          CGFloat v4 = v15;
          CGFloat v5 = v16;
          CGFloat v6 = v17;
          ++v11;
        }
        while (v9 != v11);
        uint64_t v9 = [v7 countByEnumeratingWithState:&v64 objects:v70 count:16];
      }
      while (v9);
    }

    long long v62 = 0u;
    long long v63 = 0u;
    long long v60 = 0u;
    long long v61 = 0u;
    CGFloat v22 = [(_UIFocusRegionMapSnapshot *)self detectedFocusableGuideMapEntries];
    uint64_t v23 = [v22 countByEnumeratingWithState:&v60 objects:v69 count:16];
    if (v23)
    {
      uint64_t v24 = v23;
      uint64_t v25 = *(void *)v61;
      do
      {
        uint64_t v26 = 0;
        do
        {
          if (*(void *)v61 != v25) {
            objc_enumerationMutation(v22);
          }
          uint64_t v27 = *(void **)(*((void *)&v60 + 1) + 8 * v26);
          v74.origin.double x = v3;
          v74.origin.double y = v4;
          v74.size.double width = v5;
          v74.size.double height = v6;
          BOOL v28 = CGRectIsNull(v74);
          [v27 frame];
          CGFloat v33 = v29;
          double v34 = v30;
          double v35 = v31;
          double v36 = v32;
          if (!v28)
          {
            v75.origin.double x = v3;
            v75.origin.double y = v4;
            v75.size.double width = v5;
            v75.size.double height = v6;
            *(CGRect *)&CGFloat v29 = CGRectUnion(v75, *(CGRect *)&v33);
          }
          CGFloat v3 = v29;
          CGFloat v4 = v30;
          CGFloat v5 = v31;
          CGFloat v6 = v32;
          ++v26;
        }
        while (v24 != v26);
        uint64_t v24 = [v22 countByEnumeratingWithState:&v60 objects:v69 count:16];
      }
      while (v24);
    }

    long long v58 = 0u;
    long long v59 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    uint64_t v37 = [(_UIFocusRegionMapSnapshot *)self sortedFocusContainerGuideMapEntries];
    uint64_t v38 = [v37 countByEnumeratingWithState:&v56 objects:v68 count:16];
    if (v38)
    {
      uint64_t v39 = v38;
      uint64_t v40 = *(void *)v57;
      do
      {
        uint64_t v41 = 0;
        do
        {
          if (*(void *)v57 != v40) {
            objc_enumerationMutation(v37);
          }
          uint64_t v42 = *(void **)(*((void *)&v56 + 1) + 8 * v41);
          v76.origin.double x = v3;
          v76.origin.double y = v4;
          v76.size.double width = v5;
          v76.size.double height = v6;
          BOOL v43 = CGRectIsNull(v76);
          [v42 frame];
          CGFloat v48 = v44;
          double v49 = v45;
          double v50 = v46;
          double v51 = v47;
          if (!v43)
          {
            v77.origin.double x = v3;
            v77.origin.double y = v4;
            v77.size.double width = v5;
            v77.size.double height = v6;
            *(CGRect *)&CGFloat v44 = CGRectUnion(v77, *(CGRect *)&v48);
          }
          CGFloat v3 = v44;
          CGFloat v4 = v45;
          CGFloat v5 = v46;
          CGFloat v6 = v47;
          ++v41;
        }
        while (v39 != v41);
        uint64_t v39 = [v37 countByEnumeratingWithState:&v56 objects:v68 count:16];
      }
      while (v39);
    }

    self->_mapEntriesFrame.origin.double x = v3;
    self->_mapEntriesFrame.origin.double y = v4;
    self->_mapEntriesFrame.size.double width = v5;
    self->_mapEntriesFrame.size.double height = v6;
  }
  double x = self->_mapEntriesFrame.origin.x;
  double y = self->_mapEntriesFrame.origin.y;
  double width = self->_mapEntriesFrame.size.width;
  double height = self->_mapEntriesFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (UIImage)visualRepresentation
{
  visualRepresentation = self->_visualRepresentation;
  if (!visualRepresentation)
  {
    [(_UIFocusRegionMapSnapshot *)self visualRepresentationMinimumArea];
    -[_UIFocusRegionMapSnapshot visualRepresentationWithMinimumArea:](self, "visualRepresentationWithMinimumArea:");
    CGFloat v4 = (UIImage *)objc_claimAutoreleasedReturnValue();
    CGFloat v5 = self->_visualRepresentation;
    self->_visualRepresentation = v4;

    visualRepresentation = self->_visualRepresentation;
  }
  return visualRepresentation;
}

- (id)visualRepresentationWithMinimumArea:(CGRect)a3
{
  uint64_t v141 = *MEMORY[0x1E4F143B8];
  CGFloat v4 = [(_UIFocusRegionMapSnapshot *)self rootView];
  CGFloat v5 = [v4 _screen];

  [v5 bounds];
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  [(_UIFocusRegionMapSnapshot *)self focusedRect];
  IsEmptCGFloat y = CGRectIsEmpty(v143);
  [(_UIFocusRegionMapSnapshot *)self snapshottedRect];
  if (CGRectIsEmpty(v144))
  {
    BOOL v15 = 0;
  }
  else
  {
    [(_UIFocusRegionMapSnapshot *)self snapshottedRect];
    v176.origin.CGFloat x = v7;
    v176.origin.CGFloat y = v9;
    v176.size.CGFloat width = v11;
    v176.size.CGFloat height = v13;
    BOOL v15 = !CGRectEqualToRect(v145, v176);
  }
  if (_UIInternalPreferencesRevisionOnce != -1) {
    dispatch_once(&_UIInternalPreferencesRevisionOnce, &__block_literal_global_5_8);
  }
  int v16 = _UIInternalPreferencesRevisionVar;
  v123 = v5;
  if (_UIInternalPreferencesRevisionVar < 1
    || (int v116 = _UIInternalPreference_ShowFocusSnapshotViewSearchRect,
        _UIInternalPreferencesRevisionVar == _UIInternalPreference_ShowFocusSnapshotViewSearchRect))
  {
    BOOL v17 = 0;
  }
  else
  {
    do
    {
      BOOL v17 = v16 < v116;
      if (v16 < v116) {
        break;
      }
      _UIInternalPreferenceSync(v16, &_UIInternalPreference_ShowFocusSnapshotViewSearchRect, @"ShowFocusSnapshotViewSearchRect", (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateBool);
      int v116 = _UIInternalPreference_ShowFocusSnapshotViewSearchRect;
    }
    while (v16 != _UIInternalPreference_ShowFocusSnapshotViewSearchRect);
  }
  if (byte_1E8FD5244) {
    BOOL v18 = v17;
  }
  else {
    BOOL v18 = 0;
  }
  [(_UIFocusRegionMapSnapshot *)self mapEntriesFrame];
  CGFloat x = v19;
  CGFloat y = v20;
  CGFloat width = v21;
  CGFloat height = v22;
  if (v5)
  {
    v177.origin.CGFloat x = v7;
    v177.origin.CGFloat y = v9;
    v177.size.CGFloat width = v11;
    v177.size.CGFloat height = v13;
    CGRect v146 = CGRectUnion(*(CGRect *)&v19, v177);
    CGFloat x = v146.origin.x;
    CGFloat y = v146.origin.y;
    CGFloat width = v146.size.width;
    CGFloat height = v146.size.height;
  }
  if (!IsEmpty)
  {
    [(_UIFocusRegionMapSnapshot *)self focusedRect];
    v178.origin.CGFloat x = v27;
    v178.origin.CGFloat y = v28;
    v178.size.CGFloat width = v29;
    v178.size.CGFloat height = v30;
    v147.origin.CGFloat x = x;
    v147.origin.CGFloat y = y;
    v147.size.CGFloat width = width;
    v147.size.CGFloat height = height;
    CGRect v148 = CGRectUnion(v147, v178);
    CGFloat x = v148.origin.x;
    CGFloat y = v148.origin.y;
    CGFloat width = v148.size.width;
    CGFloat height = v148.size.height;
  }
  if (v15)
  {
    [(_UIFocusRegionMapSnapshot *)self snapshottedRect];
    v179.origin.CGFloat x = v31;
    v179.origin.CGFloat y = v32;
    v179.size.CGFloat width = v33;
    v179.size.CGFloat height = v34;
    v149.origin.CGFloat x = x;
    v149.origin.CGFloat y = y;
    v149.size.CGFloat width = width;
    v149.size.CGFloat height = height;
    CGRect v150 = CGRectUnion(v149, v179);
    CGFloat x = v150.origin.x;
    CGFloat y = v150.origin.y;
    CGFloat width = v150.size.width;
    CGFloat height = v150.size.height;
  }
  v151.origin.CGFloat x = x;
  v151.origin.CGFloat y = y;
  v151.size.CGFloat width = width;
  v151.size.CGFloat height = height;
  CGRect v152 = CGRectInset(v151, -90.0, -60.0);
  double v35 = v152.origin.x;
  double v36 = v152.origin.y;
  CGFloat v37 = v152.size.width;
  CGFloat v38 = v152.size.height;
  uint64_t v39 = [(_UIFocusRegionMapSnapshot *)self rootView];
  uint64_t v40 = [v39 _window];

  if (v40)
  {
    [v40 frame];
    _UIGraphicsBeginImageContextWithOptions(0, 0, v41, v42, 0.0);
    [v40 bounds];
    objc_msgSend(v40, "drawViewHierarchyInRect:afterScreenUpdates:", 1);
    BOOL v43 = _UIGraphicsGetImageFromCurrentImageContext(0);
    UIGraphicsEndImageContext();
  }
  else
  {
    BOOL v43 = 0;
  }
  _UIGraphicsBeginImageContextWithOptions(0, 0, v37, v38, 0.0);
  ContextStacuint64_t k = GetContextStack(0);
  v122 = v40;
  CGFloat v120 = v7;
  if (*(int *)ContextStack < 1) {
    double v45 = 0;
  }
  else {
    double v45 = (CGContext *)ContextStack[3 * (*(_DWORD *)ContextStack - 1) + 1];
  }
  id v46 = +[UIColor whiteColor];
  CGContextSetFillColorWithColor(v45, (CGColorRef)[v46 CGColor]);

  v153.origin.CGFloat x = *(CGFloat *)MEMORY[0x1E4F1DAD8];
  v153.origin.CGFloat y = *(CGFloat *)(MEMORY[0x1E4F1DAD8] + 8);
  v153.size.CGFloat width = v37;
  v153.size.CGFloat height = v38;
  CGContextFillRect(v45, v153);
  double v47 = -v36;
  dCGFloat x = -v35;
  if (v43)
  {
    CGFloat v48 = [(_UIFocusRegionMapSnapshot *)self rootView];
    double v49 = [v48 _window];
    [v49 frame];
    CGRect v155 = CGRectOffset(v154, dx, -v36);
    double v50 = v155.origin.x;
    CGFloat v51 = v155.origin.y;
    double v52 = v155.size.width;
    double v53 = v155.size.height;

    double v54 = v51;
    double v47 = -v36;
    objc_msgSend(v43, "drawInRect:blendMode:alpha:", 0, v50, v54, v52, v53, 0.3);
  }
  if (v5)
  {
    CGContextSaveGState(v45);
    v156.origin.CGFloat y = v119;
    v156.origin.CGFloat x = v120;
    v156.size.CGFloat height = v117;
    v156.size.CGFloat width = v118;
    CGRect v157 = CGRectOffset(v156, dx, v47);
    CGFloat v55 = v157.origin.x;
    CGFloat v56 = v157.origin.y;
    CGFloat v57 = v157.size.width;
    CGFloat v58 = v157.size.height;
    double MidX = CGRectGetMidX(v157);
    v158.origin.CGFloat x = v55;
    v158.origin.CGFloat y = v56;
    v158.size.CGFloat width = v57;
    v158.size.CGFloat height = v58;
    -[_UIFocusRegionMapSnapshot setVisualRepresentationScreenCenter:](self, "setVisualRepresentationScreenCenter:", MidX, CGRectGetMidY(v158));
    id v59 = +[UIColor blackColor];
    CGContextSetStrokeColorWithColor(v45, (CGColorRef)[v59 CGColor]);

    v159.origin.CGFloat x = v55;
    v159.origin.CGFloat y = v56;
    double v47 = -v36;
    v159.size.CGFloat width = v57;
    v159.size.CGFloat height = v58;
    CGContextStrokeRect(v45, v159);
    CGContextRestoreGState(v45);
  }
  if (!IsEmpty)
  {
    CGContextSaveGState(v45);
    [(_UIFocusRegionMapSnapshot *)self focusedRect];
    CGRect v161 = CGRectOffset(v160, dx, v47);
    CGFloat v60 = v161.origin.x;
    CGFloat v61 = v161.origin.y;
    CGFloat v62 = v161.size.width;
    CGFloat v63 = v161.size.height;
    long long v64 = +[UIColor redColor];
    id v65 = [v64 colorWithAlphaComponent:0.5];
    CGContextSetFillColorWithColor(v45, (CGColorRef)[v65 CGColor]);

    v162.origin.CGFloat x = v60;
    v162.origin.CGFloat y = v61;
    v162.size.CGFloat width = v62;
    v162.size.CGFloat height = v63;
    CGContextFillRect(v45, v162);
    id v66 = +[UIColor redColor];
    CGContextSetStrokeColorWithColor(v45, (CGColorRef)[v66 CGColor]);

    CGContextSetLineWidth(v45, 4.0);
    v163.origin.CGFloat x = v60;
    v163.origin.CGFloat y = v61;
    v163.size.CGFloat width = v62;
    v163.size.CGFloat height = v63;
    double v47 = -v36;
    CGContextStrokeRect(v45, v163);
    CGContextRestoreGState(v45);
  }
  if (v18)
  {
    CGContextSaveGState(v45);
    long long v67 = [(_UIFocusRegionMapSnapshot *)self request];
    [v67 viewSearchRect];
    CGRect v165 = CGRectOffset(v164, dx, v47);
    CGFloat v68 = v165.origin.x;
    CGFloat v69 = v165.origin.y;
    CGFloat v70 = v165.size.width;
    CGFloat v71 = v165.size.height;

    CGRect v72 = +[UIColor yellowColor];
    id v73 = [v72 colorWithAlphaComponent:0.1];
    CGContextSetFillColorWithColor(v45, (CGColorRef)[v73 CGColor]);

    v166.origin.CGFloat x = v68;
    v166.origin.CGFloat y = v69;
    double v47 = -v36;
    v166.size.CGFloat width = v70;
    v166.size.CGFloat height = v71;
    CGContextFillRect(v45, v166);
    CGContextRestoreGState(v45);
  }
  BOOL v74 = v15;
  if (v15)
  {
    CGContextSaveGState(v45);
    [(_UIFocusRegionMapSnapshot *)self snapshottedRect];
    CGRect v168 = CGRectOffset(v167, dx, v47);
    CGFloat v75 = v168.origin.x;
    CGFloat v76 = v168.origin.y;
    CGFloat v77 = v168.size.width;
    CGFloat v78 = v168.size.height;
    long long v79 = +[UIColor redColor];
    id v80 = [v79 colorWithAlphaComponent:0.1];
    CGContextSetFillColorWithColor(v45, (CGColorRef)[v80 CGColor]);

    v169.origin.CGFloat x = v75;
    v169.origin.CGFloat y = v76;
    double v47 = -v36;
    v169.size.CGFloat width = v77;
    v169.size.CGFloat height = v78;
    CGContextFillRect(v45, v169);
    CGContextRestoreGState(v45);
  }
  v124 = v43;
  BOOL v81 = v18;
  CGContextSaveGState(v45);
  long long v136 = 0u;
  long long v137 = 0u;
  long long v134 = 0u;
  long long v135 = 0u;
  long long v82 = [(_UIFocusRegionMapSnapshot *)self detectedFocusableViewMapEntries];
  uint64_t v83 = [v82 countByEnumeratingWithState:&v134 objects:v140 count:16];
  if (v83)
  {
    uint64_t v84 = v83;
    uint64_t v85 = *(void *)v135;
    do
    {
      for (uint64_t i = 0; i != v84; ++i)
      {
        if (*(void *)v135 != v85) {
          objc_enumerationMutation(v82);
        }
        long long v87 = *(void **)(*((void *)&v134 + 1) + 8 * i);
        long long v88 = [(_UIFocusRegionMapSnapshot *)self finalFocusableRegionMapEntries];
        objc_msgSend(v87, "drawVisualRepresentationInContext:imageFrame:isFinal:", v45, objc_msgSend(v88, "containsObject:", v87), v35, v36, v37, v38);
      }
      uint64_t v84 = [v82 countByEnumeratingWithState:&v134 objects:v140 count:16];
    }
    while (v84);
  }

  long long v132 = 0u;
  long long v133 = 0u;
  long long v130 = 0u;
  long long v131 = 0u;
  long long v89 = [(_UIFocusRegionMapSnapshot *)self detectedFocusableGuideMapEntries];
  uint64_t v90 = [v89 countByEnumeratingWithState:&v130 objects:v139 count:16];
  if (v90)
  {
    uint64_t v91 = v90;
    uint64_t v92 = *(void *)v131;
    do
    {
      for (uint64_t j = 0; j != v91; ++j)
      {
        if (*(void *)v131 != v92) {
          objc_enumerationMutation(v89);
        }
        v94 = *(void **)(*((void *)&v130 + 1) + 8 * j);
        v95 = [(_UIFocusRegionMapSnapshot *)self finalFocusableRegionMapEntries];
        objc_msgSend(v94, "drawVisualRepresentationInContext:imageFrame:isFinal:", v45, objc_msgSend(v95, "containsObject:", v94), v35, v36, v37, v38);
      }
      uint64_t v91 = [v89 countByEnumeratingWithState:&v130 objects:v139 count:16];
    }
    while (v91);
  }

  CGContextRestoreGState(v45);
  CGContextSaveGState(v45);
  long long v128 = 0u;
  long long v129 = 0u;
  long long v126 = 0u;
  long long v127 = 0u;
  v96 = [(_UIFocusRegionMapSnapshot *)self sortedFocusContainerGuideMapEntries];
  uint64_t v97 = [v96 countByEnumeratingWithState:&v126 objects:v138 count:16];
  if (v97)
  {
    uint64_t v98 = v97;
    uint64_t v99 = *(void *)v127;
    do
    {
      for (uint64_t k = 0; k != v98; ++k)
      {
        if (*(void *)v127 != v99) {
          objc_enumerationMutation(v96);
        }
        objc_msgSend(*(id *)(*((void *)&v126 + 1) + 8 * k), "drawVisualRepresentationInContext:imageFrame:", v45, v35, v36, v37, v38);
      }
      uint64_t v98 = [v96 countByEnumeratingWithState:&v126 objects:v138 count:16];
    }
    while (v98);
  }

  CGContextRestoreGState(v45);
  if (v81)
  {
    CGContextSaveGState(v45);
    CGRect v101 = [(_UIFocusRegionMapSnapshot *)self request];
    [v101 viewSearchRect];
    CGRect v171 = CGRectOffset(v170, dx, v47);
    CGFloat v102 = v171.origin.x;
    CGFloat v103 = v171.origin.y;
    CGFloat v104 = v171.size.width;
    CGFloat v105 = v171.size.height;

    v106 = +[UIColor yellowColor];
    id v107 = [v106 colorWithAlphaComponent:0.5];
    CGContextSetStrokeColorWithColor(v45, (CGColorRef)[v107 CGColor]);

    CGContextSetLineDash(v45, 0.0, &visualRepresentationWithMinimumArea__dashedLineLength, 1uLL);
    CGContextSetLineWidth(v45, 4.0);
    v172.origin.CGFloat x = v102;
    v172.origin.CGFloat y = v103;
    v172.size.CGFloat width = v104;
    v172.size.CGFloat height = v105;
    CGContextStrokeRect(v45, v172);
    CGContextRestoreGState(v45);
  }
  if (v74)
  {
    CGContextSaveGState(v45);
    [(_UIFocusRegionMapSnapshot *)self snapshottedRect];
    CGRect v174 = CGRectOffset(v173, dx, v47);
    CGFloat v108 = v174.origin.x;
    CGFloat v109 = v174.origin.y;
    CGFloat v110 = v174.size.width;
    CGFloat v111 = v174.size.height;
    v112 = +[UIColor redColor];
    id v113 = [v112 colorWithAlphaComponent:0.5];
    CGContextSetStrokeColorWithColor(v45, (CGColorRef)[v113 CGColor]);

    CGContextSetLineDash(v45, 0.0, &visualRepresentationWithMinimumArea__dashedLineLength_96, 1uLL);
    CGContextSetLineWidth(v45, 4.0);
    v175.origin.CGFloat x = v108;
    v175.origin.CGFloat y = v109;
    v175.size.CGFloat width = v110;
    v175.size.CGFloat height = v111;
    CGContextStrokeRect(v45, v175);
    CGContextRestoreGState(v45);
  }
  v114 = _UIGraphicsGetImageFromCurrentImageContext(0);
  UIGraphicsEndImageContext();

  return v114;
}

+ (id)combinedVisualRepresentationForSnapshots:(id)a3 scaleFactor:(double)a4
{
  uint64_t v98 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (![v5 count])
  {
    CGFloat v28 = 0;
    goto LABEL_68;
  }
  double v76 = a4;
  unint64_t v85 = [v5 count];
  uint64_t v6 = [off_1E52D39B8 preferredFontForTextStyle:@"UICTFontTextStyleHeadline"];
  double v7 = *MEMORY[0x1E4F1DB30];
  double v8 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  long long v90 = 0u;
  long long v91 = 0u;
  long long v92 = 0u;
  long long v93 = 0u;
  id v78 = v5;
  id v9 = v5;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v90 objects:v97 count:16];
  if (!v10)
  {
    LOBYTE(v16) = 1;
    double v14 = 0.0;
    double v15 = 0.0;
    int v17 = 1;
    goto LABEL_26;
  }
  uint64_t v11 = v10;
  uint64_t v12 = *(void *)v91;
  char v13 = 1;
  double v14 = 0.0;
  double v15 = 0.0;
  LOBYTE(v16) = 1;
  LOBYTE(v17) = 1;
  do
  {
    for (uint64_t i = 0; i != v11; ++i)
    {
      if (*(void *)v91 != v12) {
        objc_enumerationMutation(v9);
      }
      CGFloat v19 = *(void **)(*((void *)&v90 + 1) + 8 * i);
      double v20 = [v19 visualRepresentation];
      if (v13)
      {
        if (![v19 focusHeading] || (objc_msgSend(v19, "focusHeading") & 3) != 0)
        {
          unint64_t v16 = ((unint64_t)[v19 focusHeading] >> 1) & 1;
LABEL_12:
          [v20 size];
          double v7 = v7 + v21 + 0.0;
          [v19 visualRepresentationScreenCenter];
          if (v15 < v22) {
            double v15 = v22;
          }
          [v20 size];
          double v24 = v23 - v15;
          int v17 = 1;
          goto LABEL_19;
        }
        unint64_t v16 = ((unint64_t)[v19 focusHeading] >> 3) & 1;
      }
      else if (v17)
      {
        goto LABEL_12;
      }
      [v20 size];
      double v8 = v8 + v25 + 0.0;
      [v19 visualRepresentationScreenCenter];
      if (v15 < v26) {
        double v15 = v26;
      }
      [v20 size];
      int v17 = 0;
      double v24 = v27 - v15;
LABEL_19:
      if (v14 < v24) {
        double v14 = v24;
      }

      char v13 = 0;
    }
    uint64_t v11 = [v9 countByEnumeratingWithState:&v90 objects:v97 count:16];
    char v13 = 0;
  }
  while (v11);
LABEL_26:

  CGFloat v29 = objc_msgSend(NSString, "stringWithFormat:", @"%ld", objc_msgSend(v9, "count"));
  uint64_t v30 = *(void *)off_1E52D2048;
  v95[0] = *(void *)off_1E52D2040;
  v95[1] = v30;
  v96[0] = v6;
  CGFloat v31 = +[UIColor blackColor];
  v96[1] = v31;
  CGFloat v32 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v96 forKeys:v95 count:2];

  CGFloat v75 = v29;
  [v29 sizeWithAttributes:v32];
  if (v33 < v34) {
    double v33 = v34;
  }
  double v35 = v33 * 0.6;
  if (v17)
  {
    double v36 = v35 * 5.0 + -60.0;
    if (v35 * 5.0 < 60.0) {
      double v36 = 0.0;
    }
    if (v85 <= 1) {
      double v37 = 0.0;
    }
    else {
      double v37 = v36;
    }
    double v8 = v14 + v15 + v37;
  }
  else
  {
    double v38 = v35 * 6.0 + -90.0;
    if (v35 * 6.0 < 90.0) {
      double v38 = 0.0;
    }
    if (v85 <= 1) {
      double v37 = 0.0;
    }
    else {
      double v37 = v38;
    }
    double v7 = v14 + v15 + v37;
  }
  if (v16) {
    double v39 = v37;
  }
  else {
    double v39 = 0.0;
  }
  _UIGraphicsBeginImageContextWithOptions(0, 0, v7, v8, 0.0);
  ContextStacuint64_t k = GetContextStack(0);
  CGFloat v77 = (void *)v6;
  if (*(int *)ContextStack < 1) {
    CGFloat v41 = 0;
  }
  else {
    CGFloat v41 = (CGContext *)ContextStack[3 * (*(_DWORD *)ContextStack - 1) + 1];
  }
  id v42 = +[UIColor whiteColor];
  CGContextSetFillColorWithColor(v41, (CGColorRef)[v42 CGColor]);

  v100.origin.CGFloat x = *(CGFloat *)MEMORY[0x1E4F1DAD8];
  v100.origin.double y = *(CGFloat *)(MEMORY[0x1E4F1DAD8] + 8);
  double y = v100.origin.y;
  double v74 = *MEMORY[0x1E4F1DAD8];
  double v79 = v8;
  double v80 = v7;
  v100.size.CGFloat width = v7;
  v100.size.CGFloat height = v8;
  CGContextFillRect(v41, v100);
  long long v88 = 0u;
  long long v89 = 0u;
  long long v86 = 0u;
  long long v87 = 0u;
  obuint64_t j = v9;
  uint64_t v43 = [obj countByEnumeratingWithState:&v86 objects:v94 count:16];
  if (v43)
  {
    uint64_t v44 = v43;
    double v45 = v15 + v39;
    uint64_t v46 = *(void *)v87;
    if (v16) {
      double v47 = (v37 + 90.0) * 0.5;
    }
    else {
      double v47 = v80 - (v37 + 90.0) * 0.5;
    }
    double v48 = (v37 + 60.0) * 0.5;
    if ((v16 & 1) == 0) {
      double v48 = v8 - v48;
    }
    double v81 = v48;
    double v82 = v47;
    uint64_t v49 = 1;
    CGFloat v83 = v35;
    double v50 = 0.0;
    do
    {
      for (uint64_t j = 0; j != v44; ++j)
      {
        if (*(void *)v87 != v46) {
          objc_enumerationMutation(obj);
        }
        double v52 = *(void **)(*((void *)&v86 + 1) + 8 * j);
        double v53 = [v52 visualRepresentation];
        double v54 = objc_msgSend(NSString, "stringWithFormat:", @"%ld", v49 + j);
        [v54 sizeWithAttributes:v32];
        double v56 = v55;
        double v58 = v57;
        [v52 visualRepresentationScreenCenter];
        if (v17)
        {
          objc_msgSend(v53, "drawAtPoint:", v50, v45 - v60);
          [v53 size];
          double v50 = v50 + v61 + 0.0;
          if (v85 < 2) {
            goto LABEL_63;
          }
          [v53 size];
          double v63 = v56 * 0.5;
          double v64 = v50 - v62 * 0.5 - v56 * 0.5;
          double v65 = v58 * 0.5;
          double v66 = v81;
        }
        else
        {
          objc_msgSend(v53, "drawAtPoint:", v45 - v59, v50);
          [v53 size];
          double v50 = v50 + v67 + 0.0;
          if (v85 < 2) {
            goto LABEL_63;
          }
          double v63 = v56 * 0.5;
          double v64 = v82 - v56 * 0.5;
          [v53 size];
          double v66 = v50 - v68 * 0.5;
          double v65 = v58 * 0.5;
        }
        double v69 = v66 - v65;
        objc_msgSend(v54, "drawInRect:withAttributes:", v32, v64, v66 - v65, v56, v58);
        CGContextSetLineWidth(v41, 2.0);
        id v70 = +[UIColor blackColor];
        CGContextSetStrokeColorWithColor(v41, (CGColorRef)[v70 CGColor]);

        CGContextAddArc(v41, v64 + v63, v69 + v65, v83, 0.0, 6.28318531, 1);
        CGContextStrokePath(v41);
LABEL_63:
      }
      uint64_t v44 = [obj countByEnumeratingWithState:&v86 objects:v94 count:16];
      v49 += j;
    }
    while (v44);
  }

  CGFloat v28 = _UIGraphicsGetImageFromCurrentImageContext(0);
  UIGraphicsEndImageContext();
  if (v76 + -1.0 > 2.22044605e-16)
  {
    _UIGraphicsBeginImageContextWithOptions(0, 0, v80 * v76, v79 * v76, 0.0);
    objc_msgSend(v28, "drawInRect:", v74, y, v80 * v76, v79 * v76);
    uint64_t v71 = _UIGraphicsGetImageFromCurrentImageContext(0);
    UIGraphicsEndImageContext();

    CGFloat v28 = (void *)v71;
  }
  id v5 = v78;

LABEL_68:
  return v28;
}

- (_UIFocusRegionMapSnapshotRequest)request
{
  return self->_request;
}

- (UIView)rootView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_rootView);
  return (UIView *)WeakRetained;
}

- (CGRect)snapshottedRect
{
  double x = self->_snapshottedRect.origin.x;
  double y = self->_snapshottedRect.origin.y;
  double width = self->_snapshottedRect.size.width;
  double height = self->_snapshottedRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (BOOL)isCommitted
{
  return self->_committed;
}

- (void)setCommitted:(BOOL)a3
{
  self->_committed = a3;
}

- (BOOL)isPrivateSnapshot
{
  return self->_privateSnaphot;
}

- (void)setPrivateSnaphot:(BOOL)a3
{
  self->_privateSnaphot = a3;
}

- (NSArray)sortedFocusContainerGuideMapEntries
{
  return self->_sortedFocusContainerGuideMapEntries;
}

- (void)setSortedFocusContainerGuideMapEntries:(id)a3
{
}

- (NSMutableArray)detectedFocusableViewMapEntries
{
  return self->_detectedFocusableViewMapEntries;
}

- (void)setDetectedFocusableViewMapEntries:(id)a3
{
}

- (NSMutableArray)detectedFocusableGuideMapEntries
{
  return self->_detectedFocusableGuideMapEntries;
}

- (void)setDetectedFocusableGuideMapEntries:(id)a3
{
}

- (NSMutableArray)detectedFocusContainerGuideMapEntries
{
  return self->_detectedFocusContainerGuideMapEntries;
}

- (void)setDetectedFocusContainerGuideMapEntries:(id)a3
{
}

- (NSMutableArray)retainedPromiseRegions
{
  return self->_retainedPromiseRegions;
}

- (void)setRetainedPromiseRegions:(id)a3
{
}

- (CGRect)focusedRect
{
  double x = self->_focusedRect.origin.x;
  double y = self->_focusedRect.origin.y;
  double width = self->_focusedRect.size.width;
  double height = self->_focusedRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (unint64_t)focusHeading
{
  return self->_focusHeading;
}

- (void)setFocusHeading:(unint64_t)a3
{
  self->_focusHeading = a3;
}

- (BOOL)clipToSnapshotRect
{
  return self->_clipToSnapshotRect;
}

- (void)setClipToSnapshotRect:(BOOL)a3
{
  self->_clipToSnapshotRect = a3;
}

- (CGRect)visualRepresentationMinimumArea
{
  double x = self->_visualRepresentationMinimumArea.origin.x;
  double y = self->_visualRepresentationMinimumArea.origin.y;
  double width = self->_visualRepresentationMinimumArea.size.width;
  double height = self->_visualRepresentationMinimumArea.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setVisualRepresentationMinimumArea:(CGRect)a3
{
  self->_visualRepresentationMinimumArea = a3;
}

- (UIView)focusableRegionAncestorView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_focusableRegionAncestorView);
  return (UIView *)WeakRetained;
}

- (void)setFocusableRegionAncestorView:(id)a3
{
}

- (CGPoint)visualRepresentationScreenCenter
{
  double x = self->_visualRepresentationScreenCenter.x;
  double y = self->_visualRepresentationScreenCenter.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setVisualRepresentationScreenCenter:(CGPoint)a3
{
  self->_visualRepresentationScreenCenter = a3;
}

- (NSArray)finalFocusableRegionMapEntries
{
  return self->_finalFocusableRegionMapEntries;
}

- (void)setFinalFocusableRegionMapEntries:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_finalFocusableRegionMapEntries, 0);
  objc_destroyWeak((id *)&self->_focusableRegionAncestorView);
  objc_storeStrong((id *)&self->_retainedPromiseRegions, 0);
  objc_storeStrong((id *)&self->_detectedFocusContainerGuideMapEntries, 0);
  objc_storeStrong((id *)&self->_detectedFocusableGuideMapEntries, 0);
  objc_storeStrong((id *)&self->_detectedFocusableViewMapEntries, 0);
  objc_storeStrong((id *)&self->_sortedFocusContainerGuideMapEntries, 0);
  objc_destroyWeak((id *)&self->_rootView);
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong((id *)&self->_visualRepresentation, 0);
}

@end
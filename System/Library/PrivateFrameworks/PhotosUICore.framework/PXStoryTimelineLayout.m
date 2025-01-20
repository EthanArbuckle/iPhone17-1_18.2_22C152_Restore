@interface PXStoryTimelineLayout
- ($28FEB1B56BB3ED5175BFC6DE64DE503F)displayedTimeRange;
- ($6FCFBD36564ECBB6D9D1614A84D6F83D)clipsCornerRadius;
- ($6FCFBD36564ECBB6D9D1614A84D6F83D)cornerRadius;
- (BOOL)shouldSetContentSizeToReferenceSize;
- (CGRect)displayedTimelineRect;
- (NSIndexSet)supportedResourceKindsForClipLayouts;
- (PXStoryTimeline)displayedTimeline;
- (PXStoryTimelineLayout)init;
- (PXStoryTimelineLayoutSnapshot)presentedSnapshot;
- (PXStoryViewModeTransition)presentedTimelineTransition;
- (UIEdgeInsets)clippingInsets;
- (double)proposedZPositionForClipLayoutWithClipIdentifier:(int64_t)a3;
- (double)relativeZPositionAboveLegibilityGradients;
- (id)existingLayoutForClipWithIdentifier:(int64_t)a3;
- (int64_t)_sublayoutIndexForClipWithIdentifier:(int64_t)a3;
- (int64_t)viewMode;
- (void)_invalidateContent;
- (void)_updateContent;
- (void)alphaDidChange;
- (void)collectTapToRadarDiagnosticsIntoContainer:(id)a3;
- (void)didUpdate;
- (void)didUpdateClipLayout:(id)a3 frame:(CGRect)a4;
- (void)didUpdateTimelineContent;
- (void)enumerateClipLayouts:(id)a3;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
- (void)referenceDepthDidChange;
- (void)referenceSizeDidChange;
- (void)setClippingInsets:(UIEdgeInsets)a3;
- (void)setClipsCornerRadius:(id)a3;
- (void)setCornerRadius:(id)a3;
- (void)setDisplayedTimeRange:(id *)a3;
- (void)setDisplayedTimeline:(id)a3;
- (void)setDisplayedTimelineRect:(CGRect)a3;
- (void)setPresentedTimelineTransition:(id)a3;
- (void)setRelativeZPositionAboveLegibilityGradients:(double)a3;
- (void)update;
- (void)willUpdate;
- (void)willUpdateTimelineContent;
@end

@implementation PXStoryTimelineLayout

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_presentedTimelineTransition, 0);
  objc_storeStrong((id *)&self->_displayedTimeline, 0);
  objc_storeStrong((id *)&self->_supportedResourceKindsForClipLayouts, 0);
  objc_storeStrong((id *)&self->_clipLayoutReuseIdentifiersByClipIdentifier, 0);
  objc_storeStrong((id *)&self->_clipLayoutReuseIdentifiers, 0);
  objc_storeStrong((id *)&self->_clipIdentifiers, 0);
}

- (PXStoryViewModeTransition)presentedTimelineTransition
{
  return self->_presentedTimelineTransition;
}

- (double)relativeZPositionAboveLegibilityGradients
{
  return self->_relativeZPositionAboveLegibilityGradients;
}

- (UIEdgeInsets)clippingInsets
{
  double top = self->_clippingInsets.top;
  double left = self->_clippingInsets.left;
  double bottom = self->_clippingInsets.bottom;
  double right = self->_clippingInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- ($6FCFBD36564ECBB6D9D1614A84D6F83D)clipsCornerRadius
{
  *(void *)&result.var0.var1[2] = a2;
  *(void *)&result.var0.var0.var0 = self;
  return result;
}

- ($6FCFBD36564ECBB6D9D1614A84D6F83D)cornerRadius
{
  *(void *)&result.var0.var1[2] = a2;
  *(void *)&result.var0.var0.var0 = self;
  return result;
}

- (CGRect)displayedTimelineRect
{
  double x = self->_displayedTimelineRect.origin.x;
  double y = self->_displayedTimelineRect.origin.y;
  double width = self->_displayedTimelineRect.size.width;
  double height = self->_displayedTimelineRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- ($28FEB1B56BB3ED5175BFC6DE64DE503F)displayedTimeRange
{
  long long v3 = *(_OWORD *)&self[25].var0.var0;
  *(_OWORD *)&retstr->var0.var0 = *(_OWORD *)&self[24].var1.var1;
  *(_OWORD *)&retstr->var0.var3 = v3;
  *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)&self[25].var0.var3;
  return self;
}

- (PXStoryTimeline)displayedTimeline
{
  return self->_displayedTimeline;
}

- (NSIndexSet)supportedResourceKindsForClipLayouts
{
  return self->_supportedResourceKindsForClipLayouts;
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  char v6 = a4;
  id v9 = a3;
  if ((void *)TimelineTransitionObservationContext != a5)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2 object:self file:@"PXStoryTimelineLayout.m" lineNumber:417 description:@"Code which should be unreachable has been reached"];

    abort();
  }
  if ((v6 & 1) != 0 && !self->_isUpdatingTimelineContent)
  {
    id v11 = v9;
    [(PXStoryTimelineLayout *)self _invalidateContent];
    id v9 = v11;
  }
}

- (void)collectTapToRadarDiagnosticsIntoContainer:(id)a3
{
  id v4 = a3;
  id v9 = [(PXStoryTimelineLayout *)self displayedTimeline];
  v5 = [v9 description];
  char v6 = [v9 diagnosticDescription];
  v7 = [v5 stringByAppendingFormat:@"\n\n%@", v6];

  v8 = objc_msgSend(NSString, "stringWithFormat:", @"DisplayedTimeline-%p", self);
  [v4 addAttachmentWithText:v7 name:v8];
}

- (int64_t)_sublayoutIndexForClipWithIdentifier:(int64_t)a3
{
  clipLayoutReuseIdentifiersByClipIdentifier = self->_clipLayoutReuseIdentifiersByClipIdentifier;
  v5 = [NSNumber numberWithInteger:a3];
  char v6 = [(NSMutableDictionary *)clipLayoutReuseIdentifiersByClipIdentifier objectForKeyedSubscript:v5];

  int64_t v7 = [(NSMutableOrderedSet *)self->_clipLayoutReuseIdentifiers indexOfObject:v6];
  return v7;
}

- (double)proposedZPositionForClipLayoutWithClipIdentifier:(int64_t)a3
{
  return -0.100000001;
}

- (id)existingLayoutForClipWithIdentifier:(int64_t)a3
{
  int64_t v4 = [(PXStoryTimelineLayout *)self _sublayoutIndexForClipWithIdentifier:a3];
  if (v4 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v5 = 0;
  }
  else
  {
    v5 = [(PXGLayout *)self sublayoutAtIndex:v4 loadIfNeeded:0];
  }
  return v5;
}

- (void)enumerateClipLayouts:(id)a3
{
  id v4 = a3;
  clipIdentifiers = self->_clipIdentifiers;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __46__PXStoryTimelineLayout_enumerateClipLayouts___block_invoke;
  v7[3] = &unk_1E5DD06A8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(NSMutableIndexSet *)clipIdentifiers enumerateIndexesUsingBlock:v7];
}

void __46__PXStoryTimelineLayout_enumerateClipLayouts___block_invoke(uint64_t a1, uint64_t a2)
{
  long long v3 = [*(id *)(a1 + 32) existingLayoutForClipWithIdentifier:a2];
  if (v3)
  {
    id v4 = v3;
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    long long v3 = v4;
  }
}

- (void)_updateContent
{
  [(PXStoryTimelineLayout *)self willUpdateTimelineContent];
  [(PXGLayout *)self referenceSize];
  double v4 = v3;
  double v6 = v5;
  if ([(PXStoryTimelineLayout *)self shouldSetContentSizeToReferenceSize])
  {
    -[PXGAbsoluteCompositeLayout setContentSize:](self, "setContentSize:", v4, v6);
    [(PXStoryTimelineLayout *)self displayedTimeline];
    objc_claimAutoreleasedReturnValue();
    [(PXStoryTimelineLayout *)self displayedTimeRange];
    [(PXStoryTimelineLayout *)self displayedTimelineRect];
    [(PXStoryTimelineLayout *)self cornerRadius];
    [(PXStoryTimelineLayout *)self clipsCornerRadius];
    [(PXGLayout *)self referenceDepth];
    [(PXStoryTimelineLayout *)self clippingInsets];
    PXEdgeInsetsEqualToEdgeInsets();
  }
  [(PXGLayout *)self referenceSize];
  PXRectWithOriginAndSize();
}

PXStoryClipLayoutReuseIdentifier *__39__PXStoryTimelineLayout__updateContent__block_invoke(uint64_t a1, uint64_t a2)
{
  double v4 = *(void **)(*(void *)(a1 + 32) + 1040);
  double v5 = [NSNumber numberWithInteger:a2];
  double v6 = [v4 objectForKeyedSubscript:v5];

  if (!v6)
  {
    int64_t v7 = [*(id *)(a1 + 40) clipWithIdentifier:a2];
    double v6 = [[PXStoryClipLayoutReuseIdentifier alloc] initWithClip:v7];
    id v8 = *(void **)(*(void *)(a1 + 32) + 1040);
    id v9 = [NSNumber numberWithInteger:a2];
    [v8 setObject:v6 forKeyedSubscript:v9];
  }
  return v6;
}

uint64_t __39__PXStoryTimelineLayout__updateContent__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) containsIndex:*(void *)(a2 + 8)];
}

void __39__PXStoryTimelineLayout__updateContent__block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if (a2 >= 1)
  {
    uint64_t v15 = v5;
    uint64_t v16 = v6;
    uint64_t v7 = a2;
    id v9 = (void *)(a5 + 8);
    do
    {
      uint64_t v10 = *(void *)(a1 + 48);
      id v11 = *(unsigned int (**)(uint64_t, uint64_t *))(v10 + 16);
      uint64_t v13 = *(v9 - 1);
      memcpy(v14, v9, sizeof(v14));
      if (v11(v10, &v13))
      {
        v12 = (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
        if ([*(id *)(*(void *)(a1 + 32) + 1032) indexOfObject:v12] != 0x7FFFFFFFFFFFFFFFLL) {
          [*(id *)(a1 + 40) removeObject:v12];
        }
      }
      v9 += 96;
      --v7;
    }
    while (v7);
  }
}

void __39__PXStoryTimelineLayout__updateContent__block_invoke_4(uint64_t a1, uint64_t a2, _OWORD *a3, uint64_t a4, uint64_t a5)
{
  if (a2 >= 1)
  {
    uint64_t v5 = a2;
    double v83 = *((double *)off_1E5DAAF10 + 1);
    double v84 = *(double *)off_1E5DAAF10;
    double v81 = *((double *)off_1E5DAAF10 + 3);
    double v82 = *((double *)off_1E5DAAF10 + 2);
    uint64_t v7 = (void *)(a5 + 16);
    id v8 = (double *)(a4 + 16);
    do
    {
      uint64_t v10 = *(v7 - 2);
      uint64_t v9 = *(v7 - 1);
      memcpy(__dst, v7, sizeof(__dst));
      uint64_t v11 = *(void *)(a1 + 80);
      v12 = *(unsigned int (**)(uint64_t, uint64_t *))(v11 + 16);
      uint64_t v108 = v10;
      uint64_t v109 = v9;
      memcpy(v110, v7, sizeof(v110));
      if (v12(v11, &v108))
      {
        v93 = [*(id *)(a1 + 32) clipWithIdentifier:v10];
        [*(id *)(*(void *)(a1 + 40) + 1024) addIndex:v10];
        uint64_t v13 = (*(void (**)(void))(*(void *)(a1 + 88) + 16))();
        uint64_t v14 = [*(id *)(*(void *)(a1 + 40) + 1032) indexOfObject:v13];
        uint64_t v15 = v10;
        v94 = v13;
        uint64_t v92 = v5;
        if (v14 == 0x7FFFFFFFFFFFFFFFLL)
        {
          uint64_t v16 = *(void **)(a1 + 48);
          v106[0] = MEMORY[0x1E4F143A8];
          v106[1] = 3221225472;
          v106[2] = __39__PXStoryTimelineLayout__updateContent__block_invoke_5;
          v106[3] = &unk_1E5DBD9D8;
          id v17 = v13;
          id v107 = v17;
          v18 = [v16 objectsPassingTest:v106];
          v19 = [v18 anyObject];

          if (v19)
          {
            uint64_t v20 = [*(id *)(*(void *)(a1 + 40) + 1032) indexOfObject:v19];
            if (v20 == 0x7FFFFFFFFFFFFFFFLL)
            {
              v80 = [MEMORY[0x1E4F28B00] currentHandler];
              [v80 handleFailureInMethod:*(void *)(a1 + 96) object:*(void *)(a1 + 40) file:@"PXStoryTimelineLayout.m" lineNumber:284 description:@"Should be able to find a sublayout for a near match identifier"];
            }
            v21 = [*(id *)(a1 + 40) sublayoutAtIndex:v20 loadIfNeeded:0];
            uint64_t v85 = v20;
            [*(id *)(*(void *)(a1 + 40) + 1032) replaceObjectAtIndex:v20 withObject:v17];
            [*(id *)(a1 + 48) removeObject:v19];
            [*(id *)(a1 + 56) removeObject:v19];
          }
          else
          {
            v21 = objc_alloc_init(PXStoryClipLayout);
            [(PXStoryClipLayout *)v21 setTimelineLayout:*(void *)(a1 + 40)];
            [*(id *)(a1 + 40) configureClipLayout:v21];
            uint64_t v26 = [*(id *)(*(void *)(a1 + 40) + 1032) count];
            [*(id *)(*(void *)(a1 + 40) + 1032) addObject:v17];
            uint64_t v85 = v26;
            [*(id *)(a1 + 40) insertSublayout:v21 atIndex:v26];
          }
          uint64_t v15 = v10;

          uint64_t v5 = v92;
          v25 = v94;
        }
        else
        {
          uint64_t v22 = v14;
          v21 = [*(id *)(a1 + 40) sublayoutAtIndex:v14 loadIfNeeded:0];
          v23 = [*(id *)(*(void *)(a1 + 40) + 1032) objectAtIndexedSubscript:v22];

          _ZF = v23 == v94;
          v25 = v94;
          if (!_ZF) {
            [*(id *)(*(void *)(a1 + 40) + 1032) replaceObjectAtIndex:v22 withObject:v94];
          }
          uint64_t v85 = v22;
          [*(id *)(a1 + 48) removeObject:v94];
        }
        [(PXStoryClipLayout *)v21 setClip:v93];
        long long v27 = a3[1];
        v105[0] = *a3;
        v105[1] = v27;
        v105[2] = a3[2];
        [(PXStoryClipLayout *)v21 setClipTimeRange:v105];
        double v29 = *(v8 - 2);
        double v28 = *(v8 - 1);
        double v31 = *v8;
        double v30 = v8[1];
        [*(id *)(a1 + 40) alphaForClipLayout:v21];
        double v33 = v32;
        if (v9 != 3) {
          PXGCornerRadiusForSubrectFromContainerCornerRadiusAndRect();
        }
        int v34 = *(_DWORD *)(a1 + 184);
        int v35 = *(_DWORD *)(a1 + 188);
        int v95 = *(_DWORD *)(a1 + 192);
        int v96 = *(_DWORD *)(a1 + 196);
        [*(id *)(a1 + 40) proposedZPositionForClipLayoutWithClipIdentifier:v15];
        double v37 = v36 * *(double *)(a1 + 136);
        if (*(unsigned char *)(a1 + 216))
        {
          v38 = *(void **)(a1 + 64);
          uint64_t v39 = *(void *)(a1 + 144);
          uint64_t v40 = *(void *)(a1 + 40);
          uint64_t v108 = v15;
          uint64_t v109 = 3;
          memcpy(v110, __dst, sizeof(v110));
          objc_msgSend(v38, "frameForClipWithInfo:proposedFrame:inViewMode:layout:", &v108, v39, v40, v29, v28, v31, v30);
          double v29 = v41;
          double v28 = v42;
          double v31 = v43;
          double v30 = v44;
          v45 = *(void **)(a1 + 64);
          uint64_t v46 = *(void *)(a1 + 144);
          uint64_t v47 = *(void *)(a1 + 40);
          uint64_t v108 = v15;
          uint64_t v109 = 3;
          memcpy(v110, __dst, sizeof(v110));
          [v45 alphaForClipWithInfo:&v108 proposedAlpha:v46 inViewMode:v47 layout:v33];
          double v33 = v48;
          v49 = *(void **)(a1 + 64);
          uint64_t v50 = *(void *)(a1 + 144);
          uint64_t v51 = *(void *)(a1 + 40);
          uint64_t v108 = v15;
          uint64_t v109 = 3;
          memcpy(v110, __dst, sizeof(v110));
          [v49 zPositionForClipWithInfo:&v108 proposedZPosition:v50 inViewMode:v51 layout:v37];
          double v37 = v52;
          v53 = *(void **)(a1 + 64);
          uint64_t v54 = *(void *)(a1 + 144);
          uint64_t v55 = *(void *)(a1 + 40);
          uint64_t v108 = v15;
          uint64_t v109 = 3;
          memcpy(v110, __dst, sizeof(v110));
          LODWORD(v56) = v34;
          LODWORD(v57) = v35;
          LODWORD(v58) = v95;
          LODWORD(v59) = v96;
          objc_msgSend(v53, "cornerRadiusForClipWithInfo:proposedCornerRadius:inViewMode:layout:", &v108, v54, v55, v56, v57, v58, v59);
          int v34 = v60;
          int v35 = v61;
          int v95 = v62;
          int v96 = v63;
          v64 = *(void **)(a1 + 64);
          if (v64)
          {
            uint64_t v65 = *(void *)(a1 + 40);
            uint64_t v66 = *(void *)(a1 + 144);
            uint64_t v108 = v15;
            uint64_t v109 = 3;
            memcpy(v110, __dst, sizeof(v110));
            memset(v98, 0, sizeof(v98));
            __asm { FMOV            V0.2D, #1.0 }
            long long v99 = _Q0;
            [v64 contentsTransformOverrideForClipWithInfo:&v108 proposedOverride:v98 inViewMode:v66 layout:v65];
            double v86 = v100;
            double v87 = v101;
            double v88 = v103;
            double v89 = v102;
            double v90 = v104;
          }
          else
          {
            double v89 = 0.0;
            double v90 = 0.0;
            double v87 = 0.0;
            double v88 = 0.0;
            double v86 = 0.0;
          }
          uint64_t v5 = v92;
          v25 = v94;
        }
        else
        {
          double v89 = 0.0;
          double v90 = 1.0;
          double v87 = 0.0;
          double v88 = 1.0;
          double v86 = 0.0;
        }
        double v91 = v37;
        if (*(unsigned char *)(a1 + 217)) {
          PXEdgeInsetsBetweenRects();
        }
        double v71 = v30;
        [(PXGLayout *)v21 setAlpha:v33];
        LODWORD(v73) = v35;
        LODWORD(v72) = v34;
        LODWORD(v74) = v95;
        LODWORD(v75) = v96;
        -[PXStoryClipLayout setCornerRadius:](v21, "setCornerRadius:", v72, v73, v74, v75);
        -[PXStoryClipLayout setClippingInsets:](v21, "setClippingInsets:", v84, v83, v82, v81);
        [(PXStoryClipLayout *)v21 setManualContentsRectAmount:v86];
        -[PXStoryClipLayout setManualContentsRect:](v21, "setManualContentsRect:", v87, v89, v88, v90);
        [(PXGLayout *)v21 setReferenceDepth:*(double *)(a1 + 136)];
        double v76 = *(double *)(a1 + 136);
        [(PXGLayout *)v21 referenceDepth];
        double v78 = v77 / *(double *)(a1 + 136);
        [*(id *)(a1 + 40) relativeZPositionAboveLegibilityGradients];
        [(PXStoryClipLayout *)v21 setRelativeZPositionAboveLegibilityGradients:(v91 / v76 + v79) / v78];
        [*(id *)(a1 + 40) setZPosition:v85 forSublayoutAtIndex:v91];
        objc_msgSend(*(id *)(a1 + 40), "setFrame:forSublayoutAtIndex:", v85, v29, v28, v31, v71);
        [*(id *)(a1 + 56) removeObject:v25];
        [*(id *)(a1 + 72) removeIndex:v15];
        objc_msgSend(*(id *)(a1 + 40), "didUpdateClipLayout:frame:", v21, v29, v28, v31, v71);
      }
      v7 += 96;
      a3 += 3;
      v8 += 4;
      --v5;
    }
    while (v5);
  }
}

uint64_t __39__PXStoryTimelineLayout__updateContent__block_invoke_6(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = [*(id *)(*(void *)(a1 + 32) + 1032) indexOfObject:a2];
  [*(id *)(a1 + 32) removeSublayoutAtIndex:v3];
  double v4 = *(void **)(*(void *)(a1 + 32) + 1032);
  return [v4 removeObjectAtIndex:v3];
}

void __39__PXStoryTimelineLayout__updateContent__block_invoke_7(uint64_t a1, uint64_t a2)
{
  v2 = *(void **)(*(void *)(a1 + 32) + 1040);
  id v3 = [NSNumber numberWithInteger:a2];
  [v2 removeObjectForKey:v3];
}

uint64_t __39__PXStoryTimelineLayout__updateContent__block_invoke_5(uint64_t a1, void *a2, unsigned char *a3)
{
  uint64_t result = [a2 hasResourceEqualTo:*(void *)(a1 + 32)];
  *a3 = result;
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
      p_updateFlags->unint64_t needsUpdate = needsUpdate | 1;
      return;
    }
LABEL_5:
    if (self->_updateFlags.updated)
    {
      uint64_t v5 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v6 = [NSString stringWithUTF8String:"-[PXStoryTimelineLayout _invalidateContent]"];
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, @"PXStoryTimelineLayout.m", 200, @"invalidating %lu after it already has been updated", 1);

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

- (void)didUpdate
{
  v5.receiver = self;
  v5.super_class = (Class)PXStoryTimelineLayout;
  [(PXGCompositeLayout *)&v5 didUpdate];
  if (self->_updateFlags.willPerformUpdate)
  {
    id v3 = [MEMORY[0x1E4F28B00] currentHandler];
    double v4 = [NSString stringWithUTF8String:"-[PXStoryTimelineLayout didUpdate]"];
    [v3 handleFailureInFunction:v4, @"PXStoryTimelineLayout.m", 196, @"Invalid parameter not satisfying: %@", @"!_updateFlags.willPerformUpdate" file lineNumber description];
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
      objc_super v5 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v6 = [NSString stringWithUTF8String:"-[PXStoryTimelineLayout update]"];
      [v5 handleFailureInFunction:v6, @"PXStoryTimelineLayout.m", 186, @"Invalid parameter not satisfying: %@", @"!_updateFlags.isPerformingUpdate" file lineNumber description];

      unint64_t needsUpdate = p_updateFlags->needsUpdate;
    }
    p_updateFlags->isPerformingUpdate = 1;
    p_updateFlags->updated = 1;
    if (needsUpdate)
    {
      p_updateFlags->unint64_t needsUpdate = needsUpdate & 0xFFFFFFFFFFFFFFFELL;
      [(PXStoryTimelineLayout *)self _updateContent];
      unint64_t needsUpdate = p_updateFlags->needsUpdate;
    }
    p_updateFlags->isPerformingUpdate = 0;
    if (needsUpdate)
    {
      uint64_t v7 = [MEMORY[0x1E4F28B00] currentHandler];
      id v8 = [NSString stringWithUTF8String:"-[PXStoryTimelineLayout update]"];
      objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, @"PXStoryTimelineLayout.m", 190, @"still needing to update %lu after update pass", p_updateFlags->needsUpdate);
    }
  }
  v9.receiver = self;
  v9.super_class = (Class)PXStoryTimelineLayout;
  [(PXGCompositeLayout *)&v9 update];
}

- (void)willUpdate
{
  v5.receiver = self;
  v5.super_class = (Class)PXStoryTimelineLayout;
  [(PXGCompositeLayout *)&v5 willUpdate];
  self->_updateFlags.BOOL willPerformUpdate = 1;
  if (self->_updateFlags.isPerformingUpdate)
  {
    id v3 = [MEMORY[0x1E4F28B00] currentHandler];
    double v4 = [NSString stringWithUTF8String:"-[PXStoryTimelineLayout willUpdate]"];
    [v3 handleFailureInFunction:v4, @"PXStoryTimelineLayout.m", 182, @"Invalid parameter not satisfying: %@", @"!_updateFlags.isPerformingUpdate" file lineNumber description];
  }
}

- (BOOL)shouldSetContentSizeToReferenceSize
{
  return 1;
}

- (int64_t)viewMode
{
  return 100;
}

- (PXStoryTimelineLayoutSnapshot)presentedSnapshot
{
  id v3 = [PXStoryTimelineLayoutSnapshot alloc];
  double v4 = [(PXStoryTimelineLayout *)self displayedTimeline];
  [(PXStoryTimelineLayout *)self displayedTimelineRect];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  [(PXStoryTimelineLayout *)self displayedTimeRange];
  [(PXStoryTimelineLayout *)self clipsCornerRadius];
  LODWORD(v14) = v13;
  LODWORD(v16) = v15;
  LODWORD(v18) = v17;
  LODWORD(v20) = v19;
  v21 = -[PXStoryTimelineLayoutSnapshot initWithTimeline:timelineRect:timeRange:clipCornerRadius:](v3, "initWithTimeline:timelineRect:timeRange:clipCornerRadius:", v4, &v23, v6, v8, v10, v12, v14, v16, v18, v20);

  return v21;
}

- (void)didUpdateClipLayout:(id)a3 frame:(CGRect)a4
{
  id v5 = a3;
  id v6 = [(PXStoryTimelineLayout *)self displayedTimeline];
  [v6 originalSize];
  objc_msgSend(v5, "setDisplayedTimelineOriginalSize:");
}

- (void)referenceDepthDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)PXStoryTimelineLayout;
  [(PXGCompositeLayout *)&v3 referenceDepthDidChange];
  [(PXStoryTimelineLayout *)self _invalidateContent];
}

- (void)alphaDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)PXStoryTimelineLayout;
  [(PXGLayout *)&v3 alphaDidChange];
  [(PXStoryTimelineLayout *)self _invalidateContent];
}

- (void)referenceSizeDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)PXStoryTimelineLayout;
  [(PXGCompositeLayout *)&v3 referenceSizeDidChange];
  [(PXStoryTimelineLayout *)self _invalidateContent];
}

- (void)setRelativeZPositionAboveLegibilityGradients:(double)a3
{
  if (self->_relativeZPositionAboveLegibilityGradients != a3)
  {
    self->_relativeZPositionAboveLegibilityGradients = a3;
    [(PXStoryTimelineLayout *)self _invalidateContent];
  }
}

- (void)setClippingInsets:(UIEdgeInsets)a3
{
}

- (void)setClipsCornerRadius:(id)a3
{
  if (v3 != self->_clipsCornerRadius.var0.var0.topLeft
    || v4 != self->_clipsCornerRadius.var0.var0.topRight
    || v5 != self->_clipsCornerRadius.var0.var0.bottomLeft
    || v6 != self->_clipsCornerRadius.var0.var0.bottomRight)
  {
    self->_clipsCornerRadius.var0.var0.topLeft = v3;
    self->_clipsCornerRadius.var0.var0.topRight = v4;
    self->_clipsCornerRadius.var0.var0.bottomLeft = v5;
    self->_clipsCornerRadius.var0.var0.bottomRight = v6;
    [(PXStoryTimelineLayout *)self _invalidateContent];
  }
}

- (void)setCornerRadius:(id)a3
{
  if (v3 != self->_cornerRadius.var0.var0.topLeft
    || v4 != self->_cornerRadius.var0.var0.topRight
    || v5 != self->_cornerRadius.var0.var0.bottomLeft
    || v6 != self->_cornerRadius.var0.var0.bottomRight)
  {
    self->_cornerRadius.var0.var0.topLeft = v3;
    self->_cornerRadius.var0.var0.topRight = v4;
    self->_cornerRadius.var0.var0.bottomLeft = v5;
    self->_cornerRadius.var0.var0.bottomRight = v6;
    [(PXStoryTimelineLayout *)self _invalidateContent];
  }
}

- (void)setPresentedTimelineTransition:(id)a3
{
  double v8 = (PXStoryViewModeTransition *)a3;
  p_presentedTimelineTransition = &self->_presentedTimelineTransition;
  float v6 = self->_presentedTimelineTransition;
  if (v6 == v8)
  {
  }
  else
  {
    char v7 = [(PXStoryViewModeTransition *)v8 isEqual:v6];

    if ((v7 & 1) == 0)
    {
      [(PXStoryViewModeTransition *)*p_presentedTimelineTransition unregisterChangeObserver:self context:TimelineTransitionObservationContext];
      objc_storeStrong((id *)&self->_presentedTimelineTransition, a3);
      [(PXStoryViewModeTransition *)*p_presentedTimelineTransition registerChangeObserver:self context:TimelineTransitionObservationContext];
      [(PXStoryTimelineLayout *)self _invalidateContent];
    }
  }
}

- (void)didUpdateTimelineContent
{
  self->_isUpdatingTimelineContent = 0;
}

- (void)willUpdateTimelineContent
{
  self->_isUpdatingTimelineContent = 1;
}

- (void)setDisplayedTimelineRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  p_displayedTimelineRect = &self->_displayedTimelineRect;
  if (!CGRectEqualToRect(a3, self->_displayedTimelineRect))
  {
    p_displayedTimelineRect->origin.CGFloat x = x;
    p_displayedTimelineRect->origin.CGFloat y = y;
    p_displayedTimelineRect->size.CGFloat width = width;
    p_displayedTimelineRect->size.CGFloat height = height;
    [(PXStoryTimelineLayout *)self displayedTimelineRectDidChange];
  }
}

- (void)setDisplayedTimeRange:(id *)a3
{
  p_displayedTimeRange = &self->_displayedTimeRange;
  long long v6 = *(_OWORD *)&a3->var0.var3;
  *(_OWORD *)&range1.start.value = *(_OWORD *)&a3->var0.var0;
  *(_OWORD *)&range1.start.epoch = v6;
  *(_OWORD *)&range1.duration.timescale = *(_OWORD *)&a3->var1.var1;
  long long v7 = *(_OWORD *)&self->_displayedTimeRange.start.epoch;
  *(_OWORD *)&v10.start.value = *(_OWORD *)&self->_displayedTimeRange.start.value;
  *(_OWORD *)&v10.start.epoch = v7;
  *(_OWORD *)&v10.duration.timescale = *(_OWORD *)&self->_displayedTimeRange.duration.timescale;
  if (!CMTimeRangeEqual(&range1, &v10))
  {
    long long v8 = *(_OWORD *)&a3->var0.var0;
    long long v9 = *(_OWORD *)&a3->var1.var1;
    *(_OWORD *)&p_displayedTimeRange->start.epoch = *(_OWORD *)&a3->var0.var3;
    *(_OWORD *)&p_displayedTimeRange->duration.timescale = v9;
    *(_OWORD *)&p_displayedTimeRange->start.value = v8;
    [(PXStoryTimelineLayout *)self displayedTimeRangeDidChange];
  }
}

- (void)setDisplayedTimeline:(id)a3
{
  long long v7 = (PXStoryTimeline *)a3;
  float v5 = self->_displayedTimeline;
  if (v5 == v7)
  {
  }
  else
  {
    char v6 = [(PXStoryTimeline *)v7 isEqual:v5];

    if ((v6 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_displayedTimeline, a3);
      [(PXStoryTimelineLayout *)self displayedTimelineDidChange];
    }
  }
}

- (PXStoryTimelineLayout)init
{
  v13.receiver = self;
  v13.super_class = (Class)PXStoryTimelineLayout;
  v2 = [(PXGAbsoluteCompositeLayout *)&v13 init];
  if (v2)
  {
    float v3 = (NSMutableIndexSet *)objc_alloc_init(MEMORY[0x1E4F28E60]);
    clipIdentifiers = v2->_clipIdentifiers;
    v2->_clipIdentifiers = v3;

    float v5 = (NSMutableOrderedSet *)objc_alloc_init(MEMORY[0x1E4F1CA70]);
    clipLayoutReuseIdentifiers = v2->_clipLayoutReuseIdentifiers;
    v2->_clipLayoutReuseIdentifiers = v5;

    long long v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    clipLayoutReuseIdentifiersByClipIdentifier = v2->_clipLayoutReuseIdentifiersByClipIdentifier;
    v2->_clipLayoutReuseIdentifiersByClipIdentifier = v7;

    id v9 = objc_alloc_init(MEMORY[0x1E4F28E60]);
    [v9 addIndex:1];
    [v9 addIndex:3];
    [v9 addIndex:4];
    [v9 addIndex:5];
    uint64_t v10 = [v9 copy];
    supportedResourceKindsForClipLayouts = v2->_supportedResourceKindsForClipLayouts;
    v2->_supportedResourceKindsForClipLayouts = (NSIndexSet *)v10;
  }
  return v2;
}

@end
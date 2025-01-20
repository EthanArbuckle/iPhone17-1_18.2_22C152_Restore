@interface PXStoryFullsizeLayout
- ($0AC6E346AE4835514AAA8AC86D8F4844)activeTransition;
- ($28FEB1B56BB3ED5175BFC6DE64DE503F)strictVisibleTimeRange;
- ($6FCFBD36564ECBB6D9D1614A84D6F83D)cornerRadiusOverride;
- (BOOL)isAnimating;
- (CGRect)strictVisibleTimelineRect;
- (NSDictionary)zPositionsByClipIdentifier;
- (NSMutableIndexSet)previouslyReportedClipIdentifiers;
- (PXGEffect)auxiliaryTransitionEffect;
- (PXGEffect)transitionEffect;
- (PXStoryFullsizeLayout)initWithModel:(id)a3;
- (PXStoryFullsizeLayout)initWithModel:(id)a3 overrideStyleInfo:(id)a4;
- (PXStoryStyleDescriptor)overrideStyleInfo;
- (PXStoryTransitionController)transitionController;
- (double)alphaForClipLayout:(id)a3;
- (double)auxiliaryTransitionEffectAlpha;
- (double)proposedZPositionForClipLayoutWithClipIdentifier:(int64_t)a3;
- (double)textAlpha;
- (double)transitionEffectAlpha;
- (id)hitTestResultForSpriteIndex:(unsigned int)a3;
- (id)presentedSnapshot;
- (int64_t)viewMode;
- (void)_invalidateActiveTransition;
- (void)_invalidateClipZPositions;
- (void)_invalidateTransitionController;
- (void)_invalidateTransitionEffectSprites;
- (void)_invalidateVisibleClipsReporting;
- (void)_invalidateVisibleSegmentIdentifiers;
- (void)_updateActiveTransition;
- (void)_updateClipZPositions;
- (void)_updateTransitionController;
- (void)_updateTransitionEffectSprites;
- (void)_updateVisibleClipsReporting;
- (void)_updateVisibleSegmentIdentifiers;
- (void)applyTransitionEffectAlpha:(double)a3 auxiliaryEffectAlpha:(double)a4;
- (void)collectTapToRadarDiagnosticsIntoContainer:(id)a3;
- (void)configureClipLayout:(id)a3;
- (void)didBeginTransitionWithEffect:(id)a3 auxiliaryEffect:(id)a4;
- (void)didEndTransitionWithEffect:(id)a3 auxiliaryEffect:(id)a4;
- (void)didUpdateTimelineContent;
- (void)displayedTimelineDidChange;
- (void)entityManager:(id)a3 componentDidChange:(id)a4;
- (void)entityManagerDidChange;
- (void)getDetailedPresentedPlacement:(id)a3 forItemReference:(id)a4;
- (void)handleModelChange:(unint64_t)a3;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
- (void)referenceSizeDidChange;
- (void)setActiveTransition:(id)a3;
- (void)setAuxiliaryTransitionEffect:(id)a3;
- (void)setAuxiliaryTransitionEffectAlpha:(double)a3;
- (void)setCornerRadiusOverride:(id)a3;
- (void)setDetailedPlacementOverride:(id)a3 forItemReference:(id)a4;
- (void)setStrictVisibleTimeRange:(id *)a3;
- (void)setStrictVisibleTimelineRect:(CGRect)a3;
- (void)setTextAlpha:(double)a3;
- (void)setTransitionController:(id)a3;
- (void)setTransitionEffect:(id)a3;
- (void)setTransitionEffectAlpha:(double)a3;
- (void)setZPositionsByClipIdentifier:(id)a3;
- (void)update;
- (void)updateClipsCornerRadius;
- (void)updateDisplayedTimeRange;
- (void)updateDisplayedTimeline;
- (void)updateDisplayedTimelineRect;
- (void)updatePresentedTimelineTransition;
- (void)willUpdateTimelineContent;
@end

@implementation PXStoryFullsizeLayout

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previouslyReportedClipIdentifiers, 0);
  objc_storeStrong((id *)&self->_zPositionsByClipIdentifier, 0);
  objc_storeStrong((id *)&self->_auxiliaryTransitionEffect, 0);
  objc_storeStrong((id *)&self->_transitionEffect, 0);
  objc_storeStrong((id *)&self->_transitionController, 0);
  objc_storeStrong((id *)&self->_overrideStyleInfo, 0);
}

- ($6FCFBD36564ECBB6D9D1614A84D6F83D)cornerRadiusOverride
{
  *(void *)&result.var0.var1[2] = a2;
  *(void *)&result.var0.var0.var0 = self;
  return result;
}

- (NSMutableIndexSet)previouslyReportedClipIdentifiers
{
  return self->_previouslyReportedClipIdentifiers;
}

- (void)setZPositionsByClipIdentifier:(id)a3
{
}

- (NSDictionary)zPositionsByClipIdentifier
{
  return self->_zPositionsByClipIdentifier;
}

- (double)auxiliaryTransitionEffectAlpha
{
  return self->_auxiliaryTransitionEffectAlpha;
}

- (double)transitionEffectAlpha
{
  return self->_transitionEffectAlpha;
}

- (PXGEffect)auxiliaryTransitionEffect
{
  return self->_auxiliaryTransitionEffect;
}

- (PXGEffect)transitionEffect
{
  return self->_transitionEffect;
}

- ($0AC6E346AE4835514AAA8AC86D8F4844)activeTransition
{
  p_activeTransition = &self->_activeTransition;
  int64_t fromSegmentIdentifier = self->_activeTransition.fromSegmentIdentifier;
  int64_t toSegmentIdentifier = p_activeTransition->toSegmentIdentifier;
  result.var1 = toSegmentIdentifier;
  result.var0 = fromSegmentIdentifier;
  return result;
}

- (void)setTransitionController:(id)a3
{
}

- (PXStoryTransitionController)transitionController
{
  return self->_transitionController;
}

- ($28FEB1B56BB3ED5175BFC6DE64DE503F)strictVisibleTimeRange
{
  long long v3 = *(_OWORD *)&self[31].var1.var3;
  *(_OWORD *)&retstr->var0.var0 = *(_OWORD *)&self[31].var1.var0;
  *(_OWORD *)&retstr->var0.var3 = v3;
  *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)&self[32].var0.var1;
  return self;
}

- (CGRect)strictVisibleTimelineRect
{
  double x = self->_strictVisibleTimelineRect.origin.x;
  double y = self->_strictVisibleTimelineRect.origin.y;
  double width = self->_strictVisibleTimelineRect.size.width;
  double height = self->_strictVisibleTimelineRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setTextAlpha:(double)a3
{
  self->_textAlpha = a3;
}

- (double)textAlpha
{
  return self->_textAlpha;
}

- (PXStoryStyleDescriptor)overrideStyleInfo
{
  return self->_overrideStyleInfo;
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  id v8 = a3;
  if ((void *)TransitionControllerObservationContext == a5)
  {
    if (a4)
    {
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __54__PXStoryFullsizeLayout_observable_didChange_context___block_invoke;
      v10[3] = &unk_1E5DD36F8;
      v10[4] = self;
      [(PXGLayout *)self performChangesWithLocalUpdate:v10];
    }
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)PXStoryFullsizeLayout;
    [(PXStoryModelTimelineLayout *)&v9 observable:v8 didChange:a4 context:a5];
  }
}

uint64_t __54__PXStoryFullsizeLayout_observable_didChange_context___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidateActiveTransition];
}

- (void)collectTapToRadarDiagnosticsIntoContainer:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PXStoryFullsizeLayout;
  id v4 = a3;
  [(PXStoryTimelineLayout *)&v6 collectTapToRadarDiagnosticsIntoContainer:v4];
  v5 = [(PXStoryFullsizeLayout *)self transitionController];
  [v4 addSubprovider:v5];
}

- (void)entityManager:(id)a3 componentDidChange:(id)a4
{
  id v7 = a4;
  id v8 = a3;
  id v9 = [(PXGLayout *)self entityManager];

  if (v9 == v8)
  {
    v10 = [(PXStoryModelTimelineLayout *)self model];
    v11 = [v10 loadingStatusReporter];

    if (!v11)
    {
LABEL_6:

      goto LABEL_7;
    }
    id v12 = v7;
    if (v12)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
LABEL_5:
        id v13 = v12;
        uint64_t v14 = [v13 states];
        v21[0] = MEMORY[0x1E4F143A8];
        v21[1] = 3221225472;
        v21[2] = __58__PXStoryFullsizeLayout_entityManager_componentDidChange___block_invoke;
        v21[3] = &unk_1E5DBD650;
        uint64_t v24 = v14;
        id v22 = v13;
        id v23 = v11;
        id v15 = v13;
        [(PXStoryTimelineLayout *)self enumerateClipLayouts:v21];

        goto LABEL_6;
      }
      v16 = [MEMORY[0x1E4F28B00] currentHandler];
      v19 = (objc_class *)objc_opt_class();
      v18 = NSStringFromClass(v19);
      v20 = objc_msgSend(v12, "px_descriptionForAssertionMessage");
      [v16 handleFailureInMethod:a2, self, @"PXStoryFullsizeLayout.m", 606, @"%@ should be an instance inheriting from %@, but it is %@", @"changingComponent", v18, v20 object file lineNumber description];
    }
    else
    {
      v16 = [MEMORY[0x1E4F28B00] currentHandler];
      v17 = (objc_class *)objc_opt_class();
      v18 = NSStringFromClass(v17);
      [v16 handleFailureInMethod:a2, self, @"PXStoryFullsizeLayout.m", 606, @"%@ should be an instance inheriting from %@, but it is nil", @"changingComponent", v18 object file lineNumber description];
    }

    goto LABEL_5;
  }
LABEL_7:
}

void __58__PXStoryFullsizeLayout_entityManager_componentDidChange___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  unsigned int v5 = [a3 contentSpriteEntity];
  uint64_t v6 = *(unsigned __int8 *)(*(void *)(a1 + 48) + v5);
  if (v6 == 4)
  {
    uint64_t v7 = [*(id *)(a1 + 32) errorForEntity:v5];
  }
  else
  {
    uint64_t v7 = 0;
  }
  id v8 = (id)v7;
  [*(id *)(a1 + 40) notifyLoadingStatus:v6 error:v7 forClipIdentifier:a2];
}

- (void)setDetailedPlacementOverride:(id)a3 forItemReference:(id)a4
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PXStoryFullsizeLayout;
  [(PXGLayout *)&v11 setDetailedPlacementOverride:v6 forItemReference:a4];
  if (v6)
  {
    [v6 cornerRadius];
  }
  else
  {
    LODWORD(v7) = *(_DWORD *)off_1E5DAAF48;
    LODWORD(v8) = *((_DWORD *)off_1E5DAAF48 + 1);
    LODWORD(v9) = *((_DWORD *)off_1E5DAAF48 + 2);
    LODWORD(v10) = *((_DWORD *)off_1E5DAAF48 + 3);
  }
  -[PXStoryFullsizeLayout setCornerRadiusOverride:](self, "setCornerRadiusOverride:", v7, v8, v9, v10);
}

- (void)getDetailedPresentedPlacement:(id)a3 forItemReference:(id)a4
{
  id v7 = a3;
  v23.receiver = self;
  v23.super_class = (Class)PXStoryFullsizeLayout;
  [(PXGLayout *)&v23 getDetailedPresentedPlacement:v7 forItemReference:a4];
  [(PXStoryTimelineLayout *)self cornerRadius];
  int v9 = v8;
  int v11 = v10;
  int v13 = v12;
  int v15 = v14;
  v16 = [(PXStoryModelTimelineLayout *)self model];
  uint64_t v17 = [v16 viewMode];

  if (v17 == 1)
  {
    if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
    {
      id v22 = [MEMORY[0x1E4F28B00] currentHandler];
      objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXStoryFullsizeLayout.m", 586, @"%s must be called on the main thread", "-[PXStoryFullsizeLayout getDetailedPresentedPlacement:forItemReference:]");
    }
    int v9 = 0;
    int v11 = 0;
    int v13 = 0;
    int v15 = 0;
  }
  LODWORD(v18) = v9;
  LODWORD(v19) = v11;
  LODWORD(v20) = v13;
  LODWORD(v21) = v15;
  objc_msgSend(v7, "setCornerRadius:", v18, v19, v20, v21);
}

- (void)applyTransitionEffectAlpha:(double)a3 auxiliaryEffectAlpha:(double)a4
{
  [(PXStoryFullsizeLayout *)self setTransitionEffectAlpha:a3];
  [(PXStoryFullsizeLayout *)self setAuxiliaryTransitionEffectAlpha:a4];
}

- (void)didEndTransitionWithEffect:(id)a3 auxiliaryEffect:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(PXStoryFullsizeLayout *)self transitionEffect];

  if (v8 == v7) {
    [(PXStoryFullsizeLayout *)self setTransitionEffect:0];
  }
  id v9 = [(PXStoryFullsizeLayout *)self auxiliaryTransitionEffect];

  if (v9 == v6) {
    [(PXStoryFullsizeLayout *)self setAuxiliaryTransitionEffect:0];
  }
  [(PXStoryFullsizeLayout *)self setTransitionEffectAlpha:0.0];
  [(PXStoryFullsizeLayout *)self setAuxiliaryTransitionEffectAlpha:0.0];
}

- (void)didBeginTransitionWithEffect:(id)a3 auxiliaryEffect:(id)a4
{
  id v6 = a4;
  [(PXStoryFullsizeLayout *)self setTransitionEffect:a3];
  [(PXStoryFullsizeLayout *)self setAuxiliaryTransitionEffect:v6];

  if (a3) {
    double v7 = 1.0;
  }
  else {
    double v7 = 0.0;
  }
  [(PXStoryFullsizeLayout *)self setTransitionEffectAlpha:v7];
  if (v6) {
    double v8 = 1.0;
  }
  else {
    double v8 = 0.0;
  }
  [(PXStoryFullsizeLayout *)self setAuxiliaryTransitionEffectAlpha:v8];
}

- (void)_updateTransitionController
{
  id v2 = [(PXStoryFullsizeLayout *)self transitionController];
  [v2 performChanges:&__block_literal_global_84];
}

uint64_t __52__PXStoryFullsizeLayout__updateTransitionController__block_invoke(uint64_t a1, void *a2)
{
  return [a2 startPendingTransitionIfNeeded];
}

- (void)_invalidateTransitionController
{
  if (self->_timelineContentPostUpdateFlags.isPerformingUpdate
    && (self->_timelineContentPostUpdateFlags.updated & 0x800) != 0)
  {
    id v2 = [MEMORY[0x1E4F28B00] currentHandler];
    long long v3 = [NSString stringWithUTF8String:"-[PXStoryFullsizeLayout _invalidateTransitionController]"];
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"PXStoryFullsizeLayout.m", 536, @"invalidating %lu after it already has been updated", 2048);

    abort();
  }
  self->_timelineContentPostUpdateFlags.needsUpdate |= 0x800uLL;
}

- (void)_updateVisibleClipsReporting
{
  long long v3 = [(PXStoryModelTimelineLayout *)self model];
  id v4 = [v3 loadingStatusReporter];

  if (v4)
  {
    [(PXGLayout *)self contentSize];
    uint64_t v6 = v5;
    uint64_t v8 = v7;
    id v9 = [(PXStoryFullsizeLayout *)self previouslyReportedClipIdentifiers];
    int v10 = (void *)[v9 mutableCopy];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __53__PXStoryFullsizeLayout__updateVisibleClipsReporting__block_invoke;
    v19[3] = &unk_1E5DBD608;
    id v20 = v9;
    id v21 = v10;
    uint64_t v23 = 0;
    uint64_t v24 = 0;
    uint64_t v25 = v6;
    uint64_t v26 = v8;
    id v11 = v4;
    id v22 = v11;
    id v12 = v10;
    id v13 = v9;
    [(PXStoryTimelineLayout *)self enumerateClipLayouts:v19];
    uint64_t v14 = MEMORY[0x1E4F143A8];
    uint64_t v15 = 3221225472;
    v16 = __53__PXStoryFullsizeLayout__updateVisibleClipsReporting__block_invoke_2;
    uint64_t v17 = &unk_1E5DD3010;
    id v18 = v11;
    [v12 enumerateIndexesUsingBlock:&v14];
    objc_msgSend(v13, "removeIndexes:", v12, v14, v15, v16, v17);
  }
}

void __53__PXStoryFullsizeLayout__updateVisibleClipsReporting__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = [v5 clip];
  if (v6)
  {
    uint64_t v7 = v6;
    [v6 info];

    if (v9[1] == 1)
    {
      [*(id *)(a1 + 32) addIndex:a2];
      [*(id *)(a1 + 40) removeIndex:a2];
      [v5 frame];
      CGRect v11 = CGRectInset(v10, 10.0, 10.0);
      if (CGRectIntersectsRect(v11, *(CGRect *)(a1 + 56))) {
        uint64_t v8 = 2;
      }
      else {
        uint64_t v8 = 1;
      }
      [*(id *)(a1 + 48) notifyVisibility:v8 forClipIdentifier:a2];
    }
  }
  else
  {
    bzero(v9, 0x300uLL);
  }
}

uint64_t __53__PXStoryFullsizeLayout__updateVisibleClipsReporting__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) notifyVisibility:0 forClipIdentifier:a2];
}

- (void)_invalidateVisibleClipsReporting
{
  if (self->_postUpdateFlags.isPerformingUpdate && (self->_postUpdateFlags.updated & 0x100000) != 0)
  {
    id v2 = [MEMORY[0x1E4F28B00] currentHandler];
    long long v3 = [NSString stringWithUTF8String:"-[PXStoryFullsizeLayout _invalidateVisibleClipsReporting]"];
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"PXStoryFullsizeLayout.m", 506, @"invalidating %lu after it already has been updated", 0x100000);

    abort();
  }
  self->_postUpdateFlags.needsUpdate |= 0x100000uLL;
}

- (double)proposedZPositionForClipLayoutWithClipIdentifier:(int64_t)a3
{
  v12.receiver = self;
  v12.super_class = (Class)PXStoryFullsizeLayout;
  [(PXStoryTimelineLayout *)&v12 proposedZPositionForClipLayoutWithClipIdentifier:sel_proposedZPositionForClipLayoutWithClipIdentifier_];
  double v6 = v5;
  uint64_t v7 = [(PXStoryFullsizeLayout *)self zPositionsByClipIdentifier];
  uint64_t v8 = [NSNumber numberWithInteger:a3];
  id v9 = [v7 objectForKeyedSubscript:v8];

  if (v9)
  {
    [v9 floatValue];
    double v6 = v10;
  }

  return v6;
}

- (void)_updateTransitionEffectSprites
{
  if (self->_allowsTransitionEffects)
  {
    if (self->_transitionEffectSpriteIndex == -1) {
      self->_transitionEffectSpriteIndedouble x = [(PXGLayout *)self addSpriteWithInitialState:&__block_literal_global_131111];
    }
    if (self->_transitionAuxiliaryEffectSpriteIndex == -1) {
      self->_transitionAuxiliaryEffectSpriteIndedouble x = [(PXGLayout *)self addSpriteWithInitialState:&__block_literal_global_75];
    }
    v6[5] = 0;
    v6[6] = 0;
    [(PXGLayout *)self referenceSize];
    transitionEffectSpriteIndedouble x = self->_transitionEffectSpriteIndex;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __55__PXStoryFullsizeLayout__updateTransitionEffectSprites__block_invoke_3;
    v6[3] = &unk_1E5DBD5E0;
    v6[4] = self;
    v6[7] = v4;
    v6[8] = v5;
    [(PXGLayout *)self modifySpritesInRange:transitionEffectSpriteIndex | 0x200000000 fullState:v6];
  }
}

void __55__PXStoryFullsizeLayout__updateTransitionEffectSprites__block_invoke_3(uint64_t a1, uint64_t a2, long long *a3)
{
  uint64_t v5 = *(_DWORD **)(a1 + 32);
  if (v5[341] != -1)
  {
    double v6 = [v5 transitionEffect];
    int v7 = [v6 effectId];

    uint64_t v8 = *((void *)a3 + 2);
    [*(id *)(a1 + 32) referenceDepth];
    float v10 = v9 * -0.9;
    CGFloat v11 = *(double *)(a1 + 40);
    CGFloat v12 = *(double *)(a1 + 48);
    CGFloat v13 = *(double *)(a1 + 56);
    CGFloat v14 = *(double *)(a1 + 64);
    v52.origin.double x = v11;
    v52.origin.double y = v12;
    v52.size.double width = v13;
    v52.size.double height = v14;
    CGFloat MidX = CGRectGetMidX(v52);
    v53.origin.double x = v11;
    v53.origin.double y = v12;
    v53.size.double width = v13;
    v53.size.double height = v14;
    CGFloat MidY = CGRectGetMidY(v53);
    v54.origin.double x = v11;
    v54.origin.double y = v12;
    v54.size.double width = v13;
    v54.size.double height = v14;
    CGFloat Width = CGRectGetWidth(v54);
    v55.origin.double x = v11;
    v55.origin.double y = v12;
    v55.size.double width = v13;
    v55.size.double height = v14;
    CGFloat Height = CGRectGetHeight(v55);
    v18.f64[0] = Width;
    v18.f64[1] = Height;
    *(CGFloat *)uint64_t v8 = MidX;
    *(CGFloat *)(v8 + 8) = MidY;
    *(double *)(v8 + 16) = v10;
    *(float32x2_t *)(v8 + 24) = vcvt_f32_f64(v18);
    [*(id *)(a1 + 32) transitionEffectAlpha];
    *(float *)&double v19 = v19;
    **((_DWORD **)a3 + 3) = LODWORD(v19);
    id v20 = [*(id *)(a1 + 32) entityManager];
    id v21 = [v20 effectComponent];
    v47[0] = MEMORY[0x1E4F143A8];
    v47[1] = 3221225472;
    v47[2] = __55__PXStoryFullsizeLayout__updateTransitionEffectSprites__block_invoke_4;
    v47[3] = &__block_descriptor_76_e55_v16__0__PXGEffectComponent_PXGMutableEffectComponent__8l;
    long long v22 = a3[1];
    long long v48 = *a3;
    long long v49 = v22;
    uint64_t v50 = *((void *)a3 + 4);
    int v51 = v7;
    [v21 performChanges:v47];

    uint64_t v5 = *(_DWORD **)(a1 + 32);
  }
  if (v5[342] != -1)
  {
    uint64_t v23 = [v5 auxiliaryTransitionEffect];
    int v24 = [v23 effectId];

    uint64_t v25 = *((void *)a3 + 2);
    [*(id *)(a1 + 32) referenceDepth];
    float v27 = v26 * -0.4;
    CGFloat v28 = *(double *)(a1 + 40);
    CGFloat v29 = *(double *)(a1 + 48);
    CGFloat v30 = *(double *)(a1 + 56);
    CGFloat v31 = *(double *)(a1 + 64);
    v56.origin.double x = v28;
    v56.origin.double y = v29;
    v56.size.double width = v30;
    v56.size.double height = v31;
    CGFloat v32 = CGRectGetMidX(v56);
    v57.origin.double x = v28;
    v57.origin.double y = v29;
    v57.size.double width = v30;
    v57.size.double height = v31;
    CGFloat v33 = CGRectGetMidY(v57);
    v58.origin.double x = v28;
    v58.origin.double y = v29;
    v58.size.double width = v30;
    v58.size.double height = v31;
    CGFloat v41 = CGRectGetWidth(v58);
    v59.origin.double x = v28;
    v59.origin.double y = v29;
    v59.size.double width = v30;
    v59.size.double height = v31;
    CGFloat v34 = CGRectGetHeight(v59);
    v35.f64[0] = v41;
    v35.f64[1] = v34;
    *(CGFloat *)(v25 + 32) = v32;
    *(CGFloat *)(v25 + 40) = v33;
    *(double *)(v25 + 48) = v27;
    *(float32x2_t *)(v25 + 56) = vcvt_f32_f64(v35);
    [*(id *)(a1 + 32) auxiliaryTransitionEffectAlpha];
    *(float *)&double v36 = v36;
    *(_DWORD *)(*((void *)a3 + 3) + 160) = LODWORD(v36);
    v37 = [*(id *)(a1 + 32) entityManager];
    v38 = [v37 effectComponent];
    v42[0] = MEMORY[0x1E4F143A8];
    v42[1] = 3221225472;
    v42[2] = __55__PXStoryFullsizeLayout__updateTransitionEffectSprites__block_invoke_5;
    v42[3] = &__block_descriptor_76_e55_v16__0__PXGEffectComponent_PXGMutableEffectComponent__8l;
    long long v39 = a3[1];
    long long v43 = *a3;
    long long v44 = v39;
    uint64_t v45 = *((void *)a3 + 4);
    int v46 = v24;
    [v38 performChanges:v42];
  }
}

uint64_t __55__PXStoryFullsizeLayout__updateTransitionEffectSprites__block_invoke_4(uint64_t a1, id a2)
{
  int v3 = *(_DWORD *)(a1 + 72);
  uint64_t result = [a2 mutableEffectIds];
  *(_DWORD *)(result + 4 * **(unsigned int **)(a1 + 40)) = v3;
  return result;
}

uint64_t __55__PXStoryFullsizeLayout__updateTransitionEffectSprites__block_invoke_5(uint64_t a1, id a2)
{
  int v3 = *(_DWORD *)(a1 + 72);
  uint64_t result = [a2 mutableEffectIds];
  *(_DWORD *)(result + 4 * *(unsigned int *)(*(void *)(a1 + 40) + 4)) = v3;
  return result;
}

__n128 __55__PXStoryFullsizeLayout__updateTransitionEffectSprites__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int v3 = *(_OWORD **)(a3 + 24);
  long long v4 = *((_OWORD *)off_1E5DAAF90 + 5);
  v3[4] = *((_OWORD *)off_1E5DAAF90 + 4);
  v3[5] = v4;
  long long v5 = *((_OWORD *)off_1E5DAAF90 + 3);
  v3[2] = *((_OWORD *)off_1E5DAAF90 + 2);
  v3[3] = v5;
  long long v6 = *((_OWORD *)off_1E5DAAF90 + 9);
  v3[8] = *((_OWORD *)off_1E5DAAF90 + 8);
  v3[9] = v6;
  long long v7 = *((_OWORD *)off_1E5DAAF90 + 7);
  v3[6] = *((_OWORD *)off_1E5DAAF90 + 6);
  v3[7] = v7;
  long long v8 = *((_OWORD *)off_1E5DAAF90 + 1);
  *int v3 = *(_OWORD *)off_1E5DAAF90;
  v3[1] = v8;
  uint64_t v9 = *(void *)(a3 + 32);
  *(void *)(v9 + 32) = *((void *)off_1E5DAAF88 + 4);
  __n128 result = *(__n128 *)off_1E5DAAF88;
  long long v11 = *((_OWORD *)off_1E5DAAF88 + 1);
  *(_OWORD *)uint64_t v9 = *(_OWORD *)off_1E5DAAF88;
  *(_OWORD *)(v9 + 16) = v11;
  **(_WORD **)(a3 + 32) = 2304;
  return result;
}

__n128 __55__PXStoryFullsizeLayout__updateTransitionEffectSprites__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int v3 = *(_OWORD **)(a3 + 24);
  long long v4 = *((_OWORD *)off_1E5DAAF90 + 5);
  v3[4] = *((_OWORD *)off_1E5DAAF90 + 4);
  v3[5] = v4;
  long long v5 = *((_OWORD *)off_1E5DAAF90 + 3);
  v3[2] = *((_OWORD *)off_1E5DAAF90 + 2);
  v3[3] = v5;
  long long v6 = *((_OWORD *)off_1E5DAAF90 + 9);
  v3[8] = *((_OWORD *)off_1E5DAAF90 + 8);
  v3[9] = v6;
  long long v7 = *((_OWORD *)off_1E5DAAF90 + 7);
  v3[6] = *((_OWORD *)off_1E5DAAF90 + 6);
  v3[7] = v7;
  long long v8 = *((_OWORD *)off_1E5DAAF90 + 1);
  *int v3 = *(_OWORD *)off_1E5DAAF90;
  v3[1] = v8;
  uint64_t v9 = *(void *)(a3 + 32);
  *(void *)(v9 + 32) = *((void *)off_1E5DAAF88 + 4);
  __n128 result = *(__n128 *)off_1E5DAAF88;
  long long v11 = *((_OWORD *)off_1E5DAAF88 + 1);
  *(_OWORD *)uint64_t v9 = *(_OWORD *)off_1E5DAAF88;
  *(_OWORD *)(v9 + 16) = v11;
  **(_WORD **)(a3 + 32) = 2304;
  return result;
}

- (void)_invalidateTransitionEffectSprites
{
  p_postUpdateFlags = &self->_postUpdateFlags;
  unint64_t needsUpdate = self->_postUpdateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_postUpdateFlags.isPerformingUpdate)
    {
LABEL_6:
      p_postUpdateFlags->unint64_t needsUpdate = needsUpdate | 0x200000;
      return;
    }
LABEL_5:
    if ((self->_postUpdateFlags.updated & 0x200000) != 0)
    {
      long long v5 = [MEMORY[0x1E4F28B00] currentHandler];
      long long v6 = [NSString stringWithUTF8String:"-[PXStoryFullsizeLayout _invalidateTransitionEffectSprites]"];
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, @"PXStoryFullsizeLayout.m", 448, @"invalidating %lu after it already has been updated", 0x200000);

      abort();
    }
    goto LABEL_6;
  }
  if (self->_postUpdateFlags.isPerformingUpdate) {
    goto LABEL_5;
  }
  BOOL willPerformUpdate = self->_postUpdateFlags.willPerformUpdate;
  p_postUpdateFlags->unint64_t needsUpdate = 0x200000;
  if (!willPerformUpdate)
  {
    [(PXGLayout *)self setNeedsUpdate];
  }
}

- (void)_updateClipZPositions
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v4 = [(PXStoryFullsizeLayout *)self transitionController];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __46__PXStoryFullsizeLayout__updateClipZPositions__block_invoke;
  v7[3] = &unk_1E5DBD598;
  id v8 = v3;
  id v5 = v3;
  [v4 enumerateClipIdentifiersForPendingTransitionUsingBlock:v7];
  long long v6 = (void *)[v5 copy];
  [(PXStoryFullsizeLayout *)self setZPositionsByClipIdentifier:v6];
}

void __46__PXStoryFullsizeLayout__updateClipZPositions__block_invoke(uint64_t a1, uint64_t a2, int a3)
{
  double v5 = -0.1;
  if (a3) {
    double v5 = -0.6;
  }
  id v8 = [NSNumber numberWithDouble:v5];
  long long v6 = *(void **)(a1 + 32);
  long long v7 = [NSNumber numberWithInteger:a2];
  [v6 setObject:v8 forKeyedSubscript:v7];
}

- (void)_invalidateClipZPositions
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
      double v5 = [MEMORY[0x1E4F28B00] currentHandler];
      long long v6 = [NSString stringWithUTF8String:"-[PXStoryFullsizeLayout _invalidateClipZPositions]"];
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, @"PXStoryFullsizeLayout.m", 434, @"invalidating %lu after it already has been updated", 2);

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

- (void)setActiveTransition:(id)a3
{
  if (self->_activeTransition.fromSegmentIdentifier != a3.var0
    || self->_activeTransition.toSegmentIdentifier != a3.var1)
  {
    self->_activeTransition = ($8C9244E3D42D84E0B7FD6D08D56F93FB)a3;
    [(PXStoryModelTimelineLayout *)self invalidateDisplayedTimeline];
    [(PXStoryFullsizeLayout *)self _invalidateTransitionController];
    [(PXStoryFullsizeLayout *)self _invalidateClipZPositions];
  }
}

- (void)_updateActiveTransition
{
  id v5 = [(PXStoryFullsizeLayout *)self transitionController];
  uint64_t v3 = [v5 activeTransition];
  -[PXStoryFullsizeLayout setActiveTransition:](self, "setActiveTransition:", v3, v4);
}

- (void)_invalidateActiveTransition
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
      long long v6 = [NSString stringWithUTF8String:"-[PXStoryFullsizeLayout _invalidateActiveTransition]"];
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, @"PXStoryFullsizeLayout.m", 415, @"invalidating %lu after it already has been updated", 1);

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

- (void)_updateVisibleSegmentIdentifiers
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E60]);
  uint64_t v4 = [(PXStoryTimelineLayout *)self displayedTimeline];
  [(PXStoryFullsizeLayout *)self strictVisibleTimeRange];
  [(PXStoryFullsizeLayout *)self strictVisibleTimelineRect];
  id v5 = objc_msgSend(v4, "segmentIdentifiersInTimeRange:rect:", v14);

  [v3 addIndexes:v5];
  long long v6 = [(PXStoryFullsizeLayout *)self transitionController];
  uint64_t v7 = [v6 activeTransition];
  uint64_t v9 = v8;

  if (v7 | v9)
  {
    [v3 addIndex:v7];
    [v3 addIndex:v9];
  }
  float v10 = [(PXStoryModelTimelineLayout *)self model];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __57__PXStoryFullsizeLayout__updateVisibleSegmentIdentifiers__block_invoke;
  v12[3] = &unk_1E5DCEE38;
  id v13 = v3;
  id v11 = v3;
  [v10 performChanges:v12];
}

void __57__PXStoryFullsizeLayout__updateVisibleSegmentIdentifiers__block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = (id)[v2 copy];
  [v3 setVisibleSegmentIdentifiers:v4];
}

- (void)_invalidateVisibleSegmentIdentifiers
{
  if (self->_timelineContentUpdateFlags.isPerformingUpdate && (self->_timelineContentUpdateFlags.updated & 0x400) != 0)
  {
    id v2 = [MEMORY[0x1E4F28B00] currentHandler];
    id v3 = [NSString stringWithUTF8String:"-[PXStoryFullsizeLayout _invalidateVisibleSegmentIdentifiers]"];
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"PXStoryFullsizeLayout.m", 396, @"invalidating %lu after it already has been updated", 1024);

    abort();
  }
  self->_timelineContentUpdateFlags.needsUpdate |= 0x400uLL;
  [(PXStoryFullsizeLayout *)self _invalidateVisibleClipsReporting];
}

- (void)handleModelChange:(unint64_t)a3
{
  if ((a3 & 0x1000012016) != 0) {
    [(PXStoryModelTimelineLayout *)self invalidateDisplayedTimeline];
  }
  if ((a3 & 0x400000034) != 0) {
    [(PXStoryModelTimelineLayout *)self invalidateDisplayedTimeRange];
  }
  if ((a3 & 0x10000) != 0)
  {
    [(PXStoryModelTimelineLayout *)self invalidateDisplayedTimeRange];
    [(PXStoryModelTimelineLayout *)self invalidateClipsCornerRadius];
  }
  if ((a3 & 0x400000) != 0)
  {
    [(PXStoryModelTimelineLayout *)self invalidatePresentedTimelineTransition];
  }
}

- (void)didUpdateTimelineContent
{
  v9.receiver = self;
  v9.super_class = (Class)PXStoryFullsizeLayout;
  [(PXStoryTimelineLayout *)&v9 didUpdateTimelineContent];
  p_timelineContentPostUpdateFlags = &self->_timelineContentPostUpdateFlags;
  self->_timelineContentPostUpdateFlags.BOOL willPerformUpdate = 0;
  unint64_t needsUpdate = self->_timelineContentPostUpdateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (self->_timelineContentPostUpdateFlags.isPerformingUpdate)
    {
      id v5 = [MEMORY[0x1E4F28B00] currentHandler];
      long long v6 = [NSString stringWithUTF8String:"-[PXStoryFullsizeLayout didUpdateTimelineContent]"];
      [v5 handleFailureInFunction:v6, @"PXStoryFullsizeLayout.m", 372, @"Invalid parameter not satisfying: %@", @"!_timelineContentPostUpdateFlags.isPerformingUpdate" file lineNumber description];

      unint64_t needsUpdate = p_timelineContentPostUpdateFlags->needsUpdate;
    }
    self->_timelineContentPostUpdateFlags.isPerformingUpdate = 1;
    self->_timelineContentPostUpdateFlags.updated = 2048;
    if ((needsUpdate & 0x800) != 0)
    {
      p_timelineContentPostUpdateFlags->unint64_t needsUpdate = needsUpdate & 0xFFFFFFFFFFFFF7FFLL;
      [(PXStoryFullsizeLayout *)self _updateTransitionController];
      unint64_t needsUpdate = p_timelineContentPostUpdateFlags->needsUpdate;
    }
    self->_timelineContentPostUpdateFlags.isPerformingUpdate = 0;
    if (needsUpdate)
    {
      uint64_t v7 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v8 = [NSString stringWithUTF8String:"-[PXStoryFullsizeLayout didUpdateTimelineContent]"];
      objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, @"PXStoryFullsizeLayout.m", 376, @"still needing to update %lu after update pass", p_timelineContentPostUpdateFlags->needsUpdate);
    }
  }
}

- (void)willUpdateTimelineContent
{
  v9.receiver = self;
  v9.super_class = (Class)PXStoryFullsizeLayout;
  [(PXStoryTimelineLayout *)&v9 willUpdateTimelineContent];
  p_timelineContentUpdateFlags = &self->_timelineContentUpdateFlags;
  self->_timelineContentUpdateFlags.BOOL willPerformUpdate = 0;
  unint64_t needsUpdate = self->_timelineContentUpdateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (self->_timelineContentUpdateFlags.isPerformingUpdate)
    {
      id v5 = [MEMORY[0x1E4F28B00] currentHandler];
      long long v6 = [NSString stringWithUTF8String:"-[PXStoryFullsizeLayout willUpdateTimelineContent]"];
      [v5 handleFailureInFunction:v6, @"PXStoryFullsizeLayout.m", 363, @"Invalid parameter not satisfying: %@", @"!_timelineContentUpdateFlags.isPerformingUpdate" file lineNumber description];

      unint64_t needsUpdate = p_timelineContentUpdateFlags->needsUpdate;
    }
    self->_timelineContentUpdateFlags.isPerformingUpdate = 1;
    self->_timelineContentUpdateFlags.updated = 1024;
    if ((needsUpdate & 0x400) != 0)
    {
      p_timelineContentUpdateFlags->unint64_t needsUpdate = needsUpdate & 0xFFFFFFFFFFFFFBFFLL;
      [(PXStoryFullsizeLayout *)self _updateVisibleSegmentIdentifiers];
      unint64_t needsUpdate = p_timelineContentUpdateFlags->needsUpdate;
    }
    self->_timelineContentUpdateFlags.isPerformingUpdate = 0;
    if (needsUpdate)
    {
      uint64_t v7 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v8 = [NSString stringWithUTF8String:"-[PXStoryFullsizeLayout willUpdateTimelineContent]"];
      objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, @"PXStoryFullsizeLayout.m", 367, @"still needing to update %lu after update pass", p_timelineContentUpdateFlags->needsUpdate);
    }
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
      objc_super v9 = [MEMORY[0x1E4F28B00] currentHandler];
      float v10 = [NSString stringWithUTF8String:"-[PXStoryFullsizeLayout update]"];
      [v9 handleFailureInFunction:v10, @"PXStoryFullsizeLayout.m", 339, @"Invalid parameter not satisfying: %@", @"!_updateFlags.isPerformingUpdate" file lineNumber description];

      unint64_t needsUpdate = p_updateFlags->needsUpdate;
    }
    p_updateFlags->isPerformingUpdate = 1;
    p_updateFlags->updated = 1;
    if (needsUpdate)
    {
      p_updateFlags->unint64_t needsUpdate = needsUpdate & 0xFFFFFFFFFFFFFFFELL;
      [(PXStoryFullsizeLayout *)self _updateActiveTransition];
      if (!p_updateFlags->isPerformingUpdate)
      {
        uint64_t v17 = [MEMORY[0x1E4F28B00] currentHandler];
        float64x2_t v18 = [NSString stringWithUTF8String:"-[PXStoryFullsizeLayout update]"];
        [v17 handleFailureInFunction:v18, @"PXStoryFullsizeLayout.m", 343, @"Invalid parameter not satisfying: %@", @"_updateFlags.isPerformingUpdate" file lineNumber description];
      }
    }
    unint64_t v5 = p_updateFlags->needsUpdate;
    p_updateFlags->updated |= 2uLL;
    if ((v5 & 2) != 0)
    {
      p_updateFlags->unint64_t needsUpdate = v5 & 0xFFFFFFFFFFFFFFFDLL;
      [(PXStoryFullsizeLayout *)self _updateClipZPositions];
      unint64_t v5 = p_updateFlags->needsUpdate;
    }
    p_updateFlags->isPerformingUpdate = 0;
    if (v5)
    {
      id v11 = [MEMORY[0x1E4F28B00] currentHandler];
      CGFloat v12 = [NSString stringWithUTF8String:"-[PXStoryFullsizeLayout update]"];
      objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", v12, @"PXStoryFullsizeLayout.m", 346, @"still needing to update %lu after update pass", p_updateFlags->needsUpdate);
    }
  }
  v21.receiver = self;
  v21.super_class = (Class)PXStoryFullsizeLayout;
  [(PXStoryModelTimelineLayout *)&v21 update];
  p_postUpdateFlags = &self->_postUpdateFlags;
  self->_postUpdateFlags.BOOL willPerformUpdate = 0;
  unint64_t v7 = self->_postUpdateFlags.needsUpdate;
  if (v7)
  {
    if (self->_postUpdateFlags.isPerformingUpdate)
    {
      id v13 = [MEMORY[0x1E4F28B00] currentHandler];
      CGFloat v14 = [NSString stringWithUTF8String:"-[PXStoryFullsizeLayout update]"];
      [v13 handleFailureInFunction:v14, @"PXStoryFullsizeLayout.m", 350, @"Invalid parameter not satisfying: %@", @"!_postUpdateFlags.isPerformingUpdate" file lineNumber description];

      unint64_t v7 = p_postUpdateFlags->needsUpdate;
    }
    self->_postUpdateFlags.isPerformingUpdate = 1;
    self->_postUpdateFlags.updated = 0x100000;
    if ((v7 & 0x100000) != 0)
    {
      p_postUpdateFlags->unint64_t needsUpdate = v7 & 0xFFFFFFFFFFEFFFFFLL;
      [(PXStoryFullsizeLayout *)self _updateVisibleClipsReporting];
      if (!self->_postUpdateFlags.isPerformingUpdate)
      {
        double v19 = [MEMORY[0x1E4F28B00] currentHandler];
        id v20 = [NSString stringWithUTF8String:"-[PXStoryFullsizeLayout update]"];
        [v19 handleFailureInFunction:v20, @"PXStoryFullsizeLayout.m", 355, @"Invalid parameter not satisfying: %@", @"_postUpdateFlags.isPerformingUpdate" file lineNumber description];
      }
    }
    unint64_t v8 = p_postUpdateFlags->needsUpdate;
    self->_postUpdateFlags.updated |= 0x200000uLL;
    if ((v8 & 0x200000) != 0)
    {
      p_postUpdateFlags->unint64_t needsUpdate = v8 & 0xFFFFFFFFFFDFFFFFLL;
      [(PXStoryFullsizeLayout *)self _updateTransitionEffectSprites];
      unint64_t v8 = p_postUpdateFlags->needsUpdate;
    }
    self->_postUpdateFlags.isPerformingUpdate = 0;
    if (v8)
    {
      uint64_t v15 = [MEMORY[0x1E4F28B00] currentHandler];
      v16 = [NSString stringWithUTF8String:"-[PXStoryFullsizeLayout update]"];
      objc_msgSend(v15, "handleFailureInFunction:file:lineNumber:description:", v16, @"PXStoryFullsizeLayout.m", 358, @"still needing to update %lu after update pass", p_postUpdateFlags->needsUpdate);
    }
  }
}

- (void)updateClipsCornerRadius
{
}

- (void)updatePresentedTimelineTransition
{
  id v4 = [(PXStoryModelTimelineLayout *)self model];
  id v3 = [v4 viewModeTransition];
  [(PXStoryTimelineLayout *)self setPresentedTimelineTransition:v3];
}

- (void)updateDisplayedTimelineRect
{
}

- (void)setStrictVisibleTimeRange:(id *)a3
{
  p_strictVisibleTimeRange = &self->_strictVisibleTimeRange;
  long long v6 = *(_OWORD *)&a3->var0.var3;
  *(_OWORD *)&range1.start.value = *(_OWORD *)&a3->var0.var0;
  *(_OWORD *)&range1.start.epoch = v6;
  *(_OWORD *)&range1.duration.timescale = *(_OWORD *)&a3->var1.var1;
  long long v7 = *(_OWORD *)&self->_strictVisibleTimeRange.start.epoch;
  *(_OWORD *)&v10.start.value = *(_OWORD *)&self->_strictVisibleTimeRange.start.value;
  *(_OWORD *)&v10.start.epoch = v7;
  *(_OWORD *)&v10.duration.timescale = *(_OWORD *)&self->_strictVisibleTimeRange.duration.timescale;
  if (!CMTimeRangeEqual(&range1, &v10))
  {
    long long v8 = *(_OWORD *)&a3->var0.var0;
    long long v9 = *(_OWORD *)&a3->var1.var1;
    *(_OWORD *)&p_strictVisibleTimeRange->start.epoch = *(_OWORD *)&a3->var0.var3;
    *(_OWORD *)&p_strictVisibleTimeRange->duration.timescale = v9;
    *(_OWORD *)&p_strictVisibleTimeRange->start.value = v8;
    [(PXStoryFullsizeLayout *)self _invalidateVisibleSegmentIdentifiers];
  }
}

- (void)setStrictVisibleTimelineRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  p_strictVisibleTimelineRect = &self->_strictVisibleTimelineRect;
  if (!CGRectEqualToRect(a3, self->_strictVisibleTimelineRect))
  {
    p_strictVisibleTimelineRect->origin.CGFloat x = x;
    p_strictVisibleTimelineRect->origin.CGFloat y = y;
    p_strictVisibleTimelineRect->size.CGFloat width = width;
    p_strictVisibleTimelineRect->size.CGFloat height = height;
    [(PXStoryFullsizeLayout *)self _invalidateVisibleSegmentIdentifiers];
  }
}

- (void)displayedTimelineDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)PXStoryFullsizeLayout;
  [(PXStoryTimelineLayout *)&v3 displayedTimelineDidChange];
  [(PXStoryFullsizeLayout *)self _invalidateVisibleSegmentIdentifiers];
}

- (void)updateDisplayedTimeRange
{
  id v4 = [(PXStoryModelTimelineLayout *)self model];
  unint64_t v5 = [v4 timeline];
  uint64_t v31 = 0;
  CGFloat v32 = &v31;
  uint64_t v33 = 0x5010000000;
  CGFloat v34 = &unk_1AB5D584F;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __49__PXStoryFullsizeLayout_updateDisplayedTimeRange__block_invoke;
  aBlock[3] = &unk_1E5DBD570;
  id v6 = v5;
  id v29 = v6;
  CGFloat v30 = &v31;
  long long v7 = (void (**)(void *, uint64_t, double))_Block_copy(aBlock);
  v7[2](v7, [v4 currentSegmentIdentifier], 1.0);
  uint64_t v25 = 0;
  double v26 = 0.0;
  uint64_t v27 = 0;
  if (v4)
  {
    [v4 currentScrollPosition];
    uint64_t v8 = v25;
  }
  else
  {
    uint64_t v8 = 0;
  }
  v7[2](v7, v8, 1.0);
  v7[2](v7, v27, v26);
  long long v9 = *((_OWORD *)v32 + 4);
  long long v10 = *((_OWORD *)v32 + 2);
  v24[1] = *((_OWORD *)v32 + 3);
  v24[2] = v9;
  v24[0] = v10;
  [(PXStoryFullsizeLayout *)self setStrictVisibleTimeRange:v24];
  unint64_t v11 = [v4 viewMode];
  int v12 = 0;
  if (v11 <= 5)
  {
    if (((1 << v11) & 0x36) != 0)
    {
      int v12 = 1;
    }
    else if (!v11)
    {
      double v19 = [MEMORY[0x1E4F28B00] currentHandler];
      [v19 handleFailureInMethod:a2 object:self file:@"PXStoryFullsizeLayout.m" lineNumber:271 description:@"Code which should be unreachable has been reached"];

      abort();
    }
  }
  int v13 = [v4 isPerformingViewControllerTransition];
  CGFloat v14 = v32;
  if ((v12 & (v13 ^ 1)) == 1)
  {
    CMTimeMakeWithSeconds(&v22, -1.0, 600);
    long long v15 = *((_OWORD *)v14 + 3);
    v21[0] = *((_OWORD *)v14 + 2);
    v21[1] = v15;
    v21[2] = *((_OWORD *)v14 + 4);
    PXStoryTimeRangeInset((CMTime *)v21, &v22, &v23);
    CGFloat v14 = v32;
    long long v17 = *(_OWORD *)&v23.start.epoch;
    long long v16 = *(_OWORD *)&v23.duration.timescale;
    *((_OWORD *)v32 + 2) = *(_OWORD *)&v23.start.value;
    *((_OWORD *)v14 + 3) = v17;
    *((_OWORD *)v14 + 4) = v16;
  }
  long long v18 = *((_OWORD *)v14 + 3);
  v20[0] = *((_OWORD *)v14 + 2);
  v20[1] = v18;
  v20[2] = *((_OWORD *)v14 + 4);
  [(PXStoryTimelineLayout *)self setDisplayedTimeRange:v20];

  _Block_object_dispose(&v31, 8);
}

__n128 __49__PXStoryFullsizeLayout_updateDisplayedTimeRange__block_invoke(uint64_t a1, uint64_t a2, __n128 result)
{
  if (result.n128_f64[0] > 0.0)
  {
    uint64_t v17 = v3;
    uint64_t v18 = v4;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v14 = 0u;
    id v6 = *(void **)(a1 + 32);
    if (v6) {
      [v6 timeRangeForSegmentWithIdentifier:a2];
    }
    long long v7 = *(_OWORD **)(*(void *)(a1 + 40) + 8);
    long long v8 = v7[3];
    *(_OWORD *)&v12.start.value = v7[2];
    *(_OWORD *)&v12.start.epoch = v8;
    *(_OWORD *)&v12.duration.timescale = v7[4];
    v11[0] = v14;
    v11[1] = v15;
    v11[2] = v16;
    PXStoryTimeRangeUnion(&v12, (uint64_t)v11, (uint64_t)v13);
    uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
    long long v10 = v13[1];
    __n128 result = (__n128)v13[2];
    *(_OWORD *)(v9 + 32) = v13[0];
    *(_OWORD *)(v9 + 48) = v10;
    *(__n128 *)(v9 + 64) = result;
  }
  return result;
}

- (void)updateDisplayedTimeline
{
  uint64_t v3 = [(PXStoryModelTimelineLayout *)self model];
  id v4 = [v3 timeline];
  [(PXGLayout *)self referenceSize];
  double v6 = v5;
  double v8 = v7;
  uint64_t v9 = [v3 layoutSpec];
  [v9 interpageSpacing];
  double v11 = v10;

  CMTimeRange v12 = [[PXStoryPagedTimeline alloc] initWithOriginalTimeline:v4 interpageSpacing:v11];
  int v13 = [(PXStoryFullsizeLayout *)self transitionController];
  uint64_t v14 = [v13 activeTransition];
  uint64_t v16 = v15;

  if (v14 | v16)
  {
    uint64_t v17 = -[PXStoryTransitionTimeline initWithOriginalTimeline:transitionInfo:]([PXStoryTransitionTimeline alloc], "initWithOriginalTimeline:transitionInfo:", v12, v14, v16);

    CMTimeRange v12 = (PXStoryPagedTimeline *)v17;
  }
  uint64_t v35 = 0;
  long long v36 = (double *)&v35;
  uint64_t v37 = 0x2020000000;
  uint64_t v38 = 0;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __48__PXStoryFullsizeLayout_updateDisplayedTimeline__block_invoke;
  aBlock[3] = &unk_1E5DBD570;
  uint64_t v18 = v12;
  uint64_t v33 = v18;
  CGFloat v34 = &v35;
  double v19 = (void (**)(void *, void, double))_Block_copy(aBlock);
  long long v30 = 0uLL;
  CGFloat v31 = 0.0;
  if (v3)
  {
    [v3 currentScrollPosition];
    uint64_t v20 = v30;
  }
  else
  {
    uint64_t v20 = 0;
  }
  v19[2](v19, v20, 1.0);
  ((void (*)(void (**)(void *, void, double), CGFloat, double))v19[2])(v19, COERCE_CGFLOAT(*(void *)&v31), *((double *)&v30 + 1));
  memset(&v29, 0, sizeof(v29));
  CGAffineTransformMakeTranslation(&v29, -v36[3], 0.0);
  objc_super v21 = [PXStoryTransformedTimeline alloc];
  CGAffineTransform v28 = v29;
  CMTime v22 = [(PXStoryTransformedTimeline *)v21 initWithOriginalTimeline:v18 transform:&v28];

  CMTimeRange v23 = -[PXStoryResizedTimeline initWithOriginalTimeline:targetSize:options:]([PXStoryResizedTimeline alloc], "initWithOriginalTimeline:targetSize:options:", v22, [v3 viewMode] == 3, v6, v8);
  int v24 = [(PXStoryModelTimelineLayout *)self model];
  if ([v24 desiredPlayState]) {
    goto LABEL_9;
  }
  uint64_t v25 = [(PXStoryModelTimelineLayout *)self model];
  int v26 = [v25 shouldAspectFitCurrentSegment];

  if (v26)
  {
    uint64_t v27 = [PXStoryAspectFittingTimeline alloc];
    *(_OWORD *)&v28.a = v30;
    v28.c = v31;
    int v24 = v23;
    CMTimeRange v23 = [(PXStoryAspectFittingTimeline *)v27 initWithOriginalTimeline:v23 keySegmentMix:&v28];
LABEL_9:
  }
  [(PXStoryTimelineLayout *)self setDisplayedTimeline:v23];

  _Block_object_dispose(&v35, 8);
}

BOOL __48__PXStoryFullsizeLayout_updateDisplayedTimeline__block_invoke(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) frameForSegmentWithIdentifier:a2];
  CGFloat x = v7.origin.x;
  CGFloat y = v7.origin.y;
  CGFloat width = v7.size.width;
  CGFloat height = v7.size.height;
  BOOL result = CGRectIsNull(v7);
  if (!result)
  {
    v8.origin.CGFloat x = x;
    v8.origin.CGFloat y = y;
    v8.size.CGFloat width = width;
    v8.size.CGFloat height = height;
    CGRectGetMinX(v8);
    PXFloatByLinearlyInterpolatingFloats();
  }
  return result;
}

- (int64_t)viewMode
{
  id v2 = [(PXStoryModelTimelineLayout *)self model];
  if ([v2 viewMode] == 3) {
    int64_t v3 = 3;
  }
  else {
    int64_t v3 = 1;
  }

  return v3;
}

- (id)presentedSnapshot
{
  int64_t v3 = [PXStoryTimelineLayoutSnapshot alloc];
  id v4 = [(PXStoryTimelineLayout *)self displayedTimeline];
  [(PXStoryTimelineLayout *)self displayedTimelineRect];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  [(PXStoryFullsizeLayout *)self strictVisibleTimeRange];
  [(PXStoryTimelineLayout *)self clipsCornerRadius];
  LODWORD(v14) = v13;
  LODWORD(v16) = v15;
  LODWORD(v18) = v17;
  LODWORD(v20) = v19;
  objc_super v21 = -[PXStoryTimelineLayoutSnapshot initWithTimeline:timelineRect:timeRange:clipCornerRadius:](v3, "initWithTimeline:timelineRect:timeRange:clipCornerRadius:", v4, &v23, v6, v8, v10, v12, v14, v16, v18, v20);

  return v21;
}

- (double)alphaForClipLayout:(id)a3
{
  v12.receiver = self;
  v12.super_class = (Class)PXStoryFullsizeLayout;
  id v4 = a3;
  [(PXStoryTimelineLayout *)&v12 alphaForClipLayout:v4];
  double v6 = v5;
  double v7 = objc_msgSend(v4, "clip", v12.receiver, v12.super_class);

  double v8 = [v7 resource];
  uint64_t v9 = objc_msgSend(v8, "px_storyResourceKind");

  if (v9 == 3)
  {
    [(PXStoryFullsizeLayout *)self textAlpha];
    return v6 * v10;
  }
  return v6;
}

- (void)configureClipLayout:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)PXStoryFullsizeLayout;
  id v4 = a3;
  [(PXStoryModelTimelineLayout *)&v7 configureClipLayout:v4];
  double v5 = [(PXStoryModelTimelineLayout *)self model];
  objc_msgSend(v4, "setCanShowDynamicContent:", objc_msgSend(v5, "viewMode") != 3);

  double v6 = [(PXStoryFullsizeLayout *)self overrideStyleInfo];
  [v4 setOverrideStyleInfo:v6];

  [v4 setCanShowHUD:1];
  [v4 setCanAspectFitContent:1];
}

- (void)setCornerRadiusOverride:(id)a3
{
  if (v3 != self->_cornerRadiusOverride.var0.var0.topLeft
    || v4 != self->_cornerRadiusOverride.var0.var0.topRight
    || v5 != self->_cornerRadiusOverride.var0.var0.bottomLeft
    || v6 != self->_cornerRadiusOverride.var0.var0.bottomRight)
  {
    self->_cornerRadiusOverride.var0.var0.topLeft = v3;
    self->_cornerRadiusOverride.var0.var0.topRight = v4;
    self->_cornerRadiusOverride.var0.var0.bottomLeft = v5;
    self->_cornerRadiusOverride.var0.var0.bottomRight = v6;
    [(PXStoryModelTimelineLayout *)self invalidateClipsCornerRadius];
  }
}

- (void)setAuxiliaryTransitionEffectAlpha:(double)a3
{
}

- (void)setTransitionEffectAlpha:(double)a3
{
}

- (void)setAuxiliaryTransitionEffect:(id)a3
{
  float v5 = (PXGEffect *)a3;
  if (self->_auxiliaryTransitionEffect != v5)
  {
    float v6 = v5;
    objc_storeStrong((id *)&self->_auxiliaryTransitionEffect, a3);
    [(PXStoryFullsizeLayout *)self _invalidateTransitionEffectSprites];
    float v5 = v6;
  }
}

- (void)setTransitionEffect:(id)a3
{
  float v5 = (PXGEffect *)a3;
  if (self->_transitionEffect != v5)
  {
    float v6 = v5;
    objc_storeStrong((id *)&self->_transitionEffect, a3);
    [(PXStoryFullsizeLayout *)self _invalidateTransitionEffectSprites];
    float v5 = v6;
  }
}

- (id)hitTestResultForSpriteIndex:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  v16.receiver = self;
  v16.super_class = (Class)PXStoryFullsizeLayout;
  float v5 = -[PXGLayout hitTestResultForSpriteIndex:](&v16, sel_hitTestResultForSpriteIndex_);
  float v6 = [v5 layout];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    double v8 = [v5 layout];
    uint64_t v9 = [v8 clip];
    if (v9)
    {
      double v10 = v9;
      [v9 info];

      if (v15[1] != 1)
      {
LABEL_7:

        goto LABEL_8;
      }
      double v11 = [(PXFeedHitTestResult *)[PXStoryHitTestResult alloc] initWithSpriteIndex:v3 layout:self];
      objc_super v12 = [v8 clip];
      uint64_t v13 = -[PXStoryHitTestResult clipIdentifier:](v11, "clipIdentifier:", [v12 identifier]);

      float v5 = (void *)v13;
    }
    else
    {
      bzero(v15, 0x300uLL);
      double v11 = 0;
    }

    goto LABEL_7;
  }
LABEL_8:
  return v5;
}

- (void)entityManagerDidChange
{
  v11[1] = *MEMORY[0x1E4F143B8];
  v10.receiver = self;
  v10.super_class = (Class)PXStoryFullsizeLayout;
  [(PXGLayout *)&v10 entityManagerDidChange];
  uint64_t v3 = [(PXStoryFullsizeLayout *)self transitionController];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __47__PXStoryFullsizeLayout_entityManagerDidChange__block_invoke;
  v9[3] = &unk_1E5DBD548;
  v9[4] = self;
  [v3 performChanges:v9];

  [(PXStoryFullsizeLayout *)self _invalidateTransitionEffectSprites];
  float v4 = [(PXGLayout *)self entityManager];

  if (v4)
  {
    float v5 = [(PXGLayout *)self entityManager];
    float v6 = [(PXGLayout *)self entityManager];
    objc_super v7 = [v6 loadingStatus];
    v11[0] = v7;
    double v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
    [v5 registerObserver:self forComponents:v8];
  }
}

void __47__PXStoryFullsizeLayout_entityManagerDidChange__block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 entityManager];
  [v3 setEntityManager:v4];
}

- (void)referenceSizeDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)PXStoryFullsizeLayout;
  [(PXStoryTimelineLayout *)&v3 referenceSizeDidChange];
  [(PXStoryFullsizeLayout *)self _invalidateTransitionEffectSprites];
  [(PXStoryModelTimelineLayout *)self invalidateDisplayedTimeline];
  [(PXStoryModelTimelineLayout *)self invalidateDisplayedRect];
}

- (BOOL)isAnimating
{
  id v2 = [(PXStoryModelTimelineLayout *)self model];
  char v3 = [v2 isActuallyPlaying];

  return v3;
}

- (PXStoryFullsizeLayout)initWithModel:(id)a3
{
  return [(PXStoryFullsizeLayout *)self initWithModel:a3 overrideStyleInfo:0];
}

- (PXStoryFullsizeLayout)initWithModel:(id)a3 overrideStyleInfo:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v17.receiver = self;
  v17.super_class = (Class)PXStoryFullsizeLayout;
  double v8 = [(PXStoryModelTimelineLayout *)&v17 initWithModel:v6];
  uint64_t v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_overrideStyleInfo, a4);
    objc_super v10 = [[PXStoryTransitionController alloc] initWithModel:v6 transitionSource:v9];
    transitionController = v9->_transitionController;
    v9->_transitionController = v10;

    [(PXStoryTransitionController *)v9->_transitionController registerChangeObserver:v9 context:TransitionControllerObservationContext];
    v9->_transitionEffectSpriteIndeCGFloat x = -1;
    v9->_transitionAuxiliaryEffectSpriteIndeCGFloat x = -1;
    objc_super v12 = (NSDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    zPositionsByClipIdentifier = v9->_zPositionsByClipIdentifier;
    v9->_zPositionsByClipIdentifier = v12;

    double v14 = (NSMutableIndexSet *)objc_alloc_init(MEMORY[0x1E4F28E60]);
    previouslyReportedClipIdentifiers = v9->_previouslyReportedClipIdentifiers;
    v9->_previouslyReportedClipIdentifiers = v14;

    v9->_textAlpha = 1.0;
    v9->_cornerRadiusOverride = *($E57FD295544FE3DD2B3C272D7C23EB59 *)off_1E5DAAF48;
    v9->_allowsTransitionEffects = ([v6 options] & 2) == 0;
  }

  return v9;
}

@end
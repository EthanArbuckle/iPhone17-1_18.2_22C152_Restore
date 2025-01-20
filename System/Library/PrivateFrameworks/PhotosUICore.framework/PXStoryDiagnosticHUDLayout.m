@interface PXStoryDiagnosticHUDLayout
- (BOOL)_shouldDisplayContentForHUDType:(int64_t)a3;
- (NSAttributedString)HUDText;
- (NSAttributedString)badgeText;
- (NSTimer)timer;
- (PXStoryAnimationController)animationController;
- (PXStoryDiagnosticHUDDataSource)dataSource;
- (PXStoryDiagnosticHUDLayout)init;
- (PXStoryDiagnosticHUDLayout)initWithDataSource:(id)a3;
- (PXStoryModel)model;
- (PXStoryRelatedController)relatedController;
- (id)attributedStringForSpriteAtIndex:(unsigned int)a3 inLayout:(id)a4;
- (id)axSpriteIndexes;
- (id)stringAtIndex:(unsigned int)a3 inLayout:(id)a4;
- (id)stringAttributesAtIndex:(unsigned int)a3 inLayout:(id)a4;
- (int64_t)verticalAlignmentForStringAtIndex:(unsigned int)a3 inLayout:(id)a4;
- (void)_enumerateDiagnosticHUDContentProvidersUsingBlock:(id)a3;
- (void)_invalidateContent;
- (void)_invalidateControllers;
- (void)_invalidateModel;
- (void)_updateContent;
- (void)_updateControllers;
- (void)_updateHUDText;
- (void)_updateModel;
- (void)dealloc;
- (void)entityManager:(id)a3 componentDidChange:(id)a4;
- (void)entityManagerDidChange;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
- (void)safeAreaInsetsDidChange;
- (void)setAnimationController:(id)a3;
- (void)setHUDText:(id)a3;
- (void)setModel:(id)a3;
- (void)setRelatedController:(id)a3;
- (void)update;
@end

@implementation PXStoryDiagnosticHUDLayout

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_animationController, 0);
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_relatedController, 0);
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_badgeText, 0);
  objc_storeStrong((id *)&self->_HUDText, 0);
  objc_storeStrong((id *)&self->_loadingStatusComponent, 0);
}

- (PXStoryAnimationController)animationController
{
  return self->_animationController;
}

- (PXStoryModel)model
{
  return self->_model;
}

- (PXStoryRelatedController)relatedController
{
  return self->_relatedController;
}

- (NSTimer)timer
{
  return self->_timer;
}

- (PXStoryDiagnosticHUDDataSource)dataSource
{
  return self->_dataSource;
}

- (NSAttributedString)badgeText
{
  return self->_badgeText;
}

- (void)setHUDText:(id)a3
{
}

- (NSAttributedString)HUDText
{
  return self->_HUDText;
}

- (id)axSpriteIndexes
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F28D60]);
  return v2;
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  id v9 = a3;
  id v15 = v9;
  if ((void *)DataSourceObservationContext == a5)
  {
    v11 = [(PXStoryDiagnosticHUDLayout *)self dataSource];
    if (([v11 HUDStoryModelChangeDescriptor] & a4) != 0) {
      [(PXStoryDiagnosticHUDLayout *)self _invalidateModel];
    }
    if (([v11 HUDContentChangeDescriptor] & a4) != 0) {
      [(PXStoryDiagnosticHUDLayout *)self _invalidateContent];
    }

    goto LABEL_14;
  }
  if ((void *)ModelObservationContext_18008 != a5)
  {
    if ((void *)RelatedControllerObservationContext != a5 && AnimationControllerObservationContext != (void)a5)
    {
      v14 = [MEMORY[0x1E4F28B00] currentHandler];
      [v14 handleFailureInMethod:a2 object:self file:@"PXStoryDiagnosticHUDLayout.m" lineNumber:356 description:@"Code which should be unreachable has been reached"];

      abort();
    }
    goto LABEL_8;
  }
  if ((a4 & 0x1E01) != 0)
  {
    v12 = [(PXStoryDiagnosticHUDLayout *)self dataSource];
    int v13 = [v12 isHUDVisible];

    id v9 = v15;
    if (v13)
    {
LABEL_8:
      [(PXStoryDiagnosticHUDLayout *)self _invalidateContent];
LABEL_14:
      id v9 = v15;
    }
  }
}

- (void)entityManager:(id)a3 componentDidChange:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  id v7 = [v11 loadingStatus];
  if (v7 == v6)
  {
    BOOL hasPendingContentUpdate = self->_hasPendingContentUpdate;

    if (hasPendingContentUpdate)
    {
      v9.var0 = [(PXGLayout *)self entityForSpriteAtIndex:self->_HUDTextSpriteIndex];
      v10 = [v11 loadingStatus];
      LOBYTE(v9.var0) = [v10 stateForEntity:v9.var0];

      if ((LOBYTE(v9.var0) - 2) <= 2u)
      {
        [(PXStoryDiagnosticHUDLayout *)self _invalidateContent];
        self->_BOOL hasPendingContentUpdate = 0;
      }
    }
  }
  else
  {
  }
}

- (id)attributedStringForSpriteAtIndex:(unsigned int)a3 inLayout:(id)a4
{
  id v7 = a4;
  if (self->_HUDTextSpriteIndex == a3)
  {
    uint64_t v8 = [(PXStoryDiagnosticHUDLayout *)self HUDText];
  }
  else
  {
    if (self->_badgeSpriteIndex != a3)
    {
      id v11 = [MEMORY[0x1E4F28B00] currentHandler];
      [v11 handleFailureInMethod:a2 object:self file:@"PXStoryDiagnosticHUDLayout.m" lineNumber:319 description:@"Code which should be unreachable has been reached"];

      abort();
    }
    uint64_t v8 = [(PXStoryDiagnosticHUDLayout *)self badgeText];
  }
  $738B17BD11CC339B30296C0EA03CEC2B v9 = (void *)v8;

  return v9;
}

- (int64_t)verticalAlignmentForStringAtIndex:(unsigned int)a3 inLayout:(id)a4
{
  return 2;
}

- (id)stringAttributesAtIndex:(unsigned int)a3 inLayout:(id)a4
{
  return 0;
}

- (id)stringAtIndex:(unsigned int)a3 inLayout:(id)a4
{
  id v7 = a4;
  if (self->_HUDTextSpriteIndex == a3)
  {
    uint64_t v8 = [(PXStoryDiagnosticHUDLayout *)self HUDText];
  }
  else
  {
    if (self->_badgeSpriteIndex != a3)
    {
      v12 = [MEMORY[0x1E4F28B00] currentHandler];
      [v12 handleFailureInMethod:a2 object:self file:@"PXStoryDiagnosticHUDLayout.m" lineNumber:302 description:@"Code which should be unreachable has been reached"];

      abort();
    }
    uint64_t v8 = [(PXStoryDiagnosticHUDLayout *)self badgeText];
  }
  $738B17BD11CC339B30296C0EA03CEC2B v9 = v8;
  v10 = [v8 string];

  return v10;
}

- (void)_updateHUDText
{
  v29[2] = *MEMORY[0x1E4F143B8];
  v3 = [(PXStoryDiagnosticHUDLayout *)self dataSource];
  uint64_t v4 = [v3 diagnosticHUDType];
  unint64_t v5 = v4 - 1;
  if ((unint64_t)(v4 - 1) > 0x10
    || (uint64_t v6 = v4,
        [v3 diagnosticHUDContentProviderForType:v4],
        id v7 = objc_claimAutoreleasedReturnValue(),
        [(PXGLayout *)self contentSize],
        objc_msgSend(v7, "diagnosticTextForHUDType:displaySize:", v6),
        uint64_t v8 = (__CFString *)objc_claimAutoreleasedReturnValue(),
        v7,
        !v8))
  {
    uint64_t v8 = &stru_1F00B0030;
  }
  uint64_t v27 = *MEMORY[0x1E4FB0700];
  uint64_t v9 = v27;
  v10 = [MEMORY[0x1E4FB1618] yellowColor];
  v29[0] = v10;
  uint64_t v28 = *MEMORY[0x1E4FB06F8];
  uint64_t v11 = v28;
  v12 = [MEMORY[0x1E4FB08E0] monospacedSystemFontOfSize:14.0 weight:*MEMORY[0x1E4FB09A8]];
  v29[1] = v12;
  int v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v29 forKeys:&v27 count:2];

  v25[0] = v9;
  v14 = [MEMORY[0x1E4FB1618] yellowColor];
  v25[1] = v11;
  v26[0] = v14;
  id v15 = [MEMORY[0x1E4FB08E0] monospacedSystemFontOfSize:12.0 weight:*MEMORY[0x1E4FB09B8]];
  v26[1] = v15;
  v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:v25 count:2];

  id v17 = objc_alloc(MEMORY[0x1E4F28E48]);
  id v18 = [NSString alloc];
  if (v5 > 0x12) {
    v19 = @"None";
  }
  else {
    v19 = off_1E5DC50E0[v5];
  }
  v20 = v19;
  v21 = (void *)[v18 initWithFormat:@"%@\n\n", v20];
  v22 = (void *)[v17 initWithString:v21 attributes:v13];

  v23 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v8 attributes:v16];
  [v22 appendAttributedString:v23];
  v24 = (void *)[v22 copy];
  [(PXStoryDiagnosticHUDLayout *)self setHUDText:v24];
}

- (void)_updateContent
{
  [(PXStoryDiagnosticHUDLayout *)self _updateHUDText];
  [(PXGLayout *)self referenceSize];
  -[PXGLayout setContentSize:](self, "setContentSize:");
  v3 = [(PXStoryDiagnosticHUDLayout *)self dataSource];
  int v4 = [v3 isHUDVisible];
  if (v4) {
    LOBYTE(v4) = -[PXStoryDiagnosticHUDLayout _shouldDisplayContentForHUDType:](self, "_shouldDisplayContentForHUDType:", [v3 diagnosticHUDType]);
  }
  self->_wantsHUDContentVisible = v4;
  PXRectWithOriginAndSize();
}

void __44__PXStoryDiagnosticHUDLayout__updateContent__block_invoke()
{
}

- (void)_invalidateContent
{
  if ([(PXGLoadingStatusComponent *)self->_loadingStatusComponent stateForEntity:[(PXGLayout *)self entityForSpriteAtIndex:self->_HUDTextSpriteIndex]] == 1)
  {
    self->_BOOL hasPendingContentUpdate = 1;
    return;
  }
  ++self->_contentVersion;
  p_updateFlags = &self->_updateFlags;
  unint64_t needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_updateFlags.isPerformingUpdate)
    {
LABEL_8:
      p_updateFlags->unint64_t needsUpdate = needsUpdate | 4;
      return;
    }
LABEL_7:
    if ((self->_updateFlags.updated & 4) != 0)
    {
      uint64_t v6 = [MEMORY[0x1E4F28B00] currentHandler];
      id v7 = [NSString stringWithUTF8String:"-[PXStoryDiagnosticHUDLayout _invalidateContent]"];
      objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, @"PXStoryDiagnosticHUDLayout.m", 228, @"invalidating %lu after it already has been updated", 4);

      abort();
    }
    goto LABEL_8;
  }
  if (self->_updateFlags.isPerformingUpdate) {
    goto LABEL_7;
  }
  BOOL willPerformUpdate = self->_updateFlags.willPerformUpdate;
  p_updateFlags->unint64_t needsUpdate = 4;
  if (!willPerformUpdate)
  {
    [(PXGLayout *)self setNeedsUpdate];
  }
}

- (void)_updateControllers
{
  id v6 = [(PXStoryDiagnosticHUDLayout *)self dataSource];
  v3 = [(PXStoryDiagnosticHUDLayout *)self model];
  int v4 = [v6 HUDRelatedController];
  [(PXStoryDiagnosticHUDLayout *)self setRelatedController:v4];

  unint64_t v5 = [v3 animationController];
  [(PXStoryDiagnosticHUDLayout *)self setAnimationController:v5];
}

- (void)_invalidateControllers
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
      unint64_t v5 = [MEMORY[0x1E4F28B00] currentHandler];
      id v6 = [NSString stringWithUTF8String:"-[PXStoryDiagnosticHUDLayout _invalidateControllers]"];
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, @"PXStoryDiagnosticHUDLayout.m", 210, @"invalidating %lu after it already has been updated", 2);

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

- (void)_updateModel
{
  id v4 = [(PXStoryDiagnosticHUDLayout *)self dataSource];
  v3 = [v4 HUDStoryModel];
  [(PXStoryDiagnosticHUDLayout *)self setModel:v3];
}

- (void)_invalidateModel
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
      unint64_t v5 = [MEMORY[0x1E4F28B00] currentHandler];
      id v6 = [NSString stringWithUTF8String:"-[PXStoryDiagnosticHUDLayout _invalidateModel]"];
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, @"PXStoryDiagnosticHUDLayout.m", 202, @"invalidating %lu after it already has been updated", 1);

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
      id v7 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v8 = [NSString stringWithUTF8String:"-[PXStoryDiagnosticHUDLayout update]"];
      [v7 handleFailureInFunction:v8, @"PXStoryDiagnosticHUDLayout.m", 187, @"Invalid parameter not satisfying: %@", @"!_updateFlags.isPerformingUpdate" file lineNumber description];

      unint64_t needsUpdate = p_updateFlags->needsUpdate;
    }
    p_updateFlags->isPerformingUpdate = 1;
    p_updateFlags->updated = 1;
    if (needsUpdate)
    {
      p_updateFlags->unint64_t needsUpdate = needsUpdate & 0xFFFFFFFFFFFFFFFELL;
      [(PXStoryDiagnosticHUDLayout *)self _updateModel];
      if (!p_updateFlags->isPerformingUpdate)
      {
        int v13 = [MEMORY[0x1E4F28B00] currentHandler];
        v14 = [NSString stringWithUTF8String:"-[PXStoryDiagnosticHUDLayout update]"];
        [v13 handleFailureInFunction:v14, @"PXStoryDiagnosticHUDLayout.m", 191, @"Invalid parameter not satisfying: %@", @"_updateFlags.isPerformingUpdate" file lineNumber description];
      }
    }
    unint64_t v5 = p_updateFlags->needsUpdate;
    p_updateFlags->updated |= 2uLL;
    if ((v5 & 2) != 0)
    {
      p_updateFlags->unint64_t needsUpdate = v5 & 0xFFFFFFFFFFFFFFFDLL;
      [(PXStoryDiagnosticHUDLayout *)self _updateControllers];
    }
    if (!p_updateFlags->isPerformingUpdate)
    {
      uint64_t v9 = [MEMORY[0x1E4F28B00] currentHandler];
      v10 = [NSString stringWithUTF8String:"-[PXStoryDiagnosticHUDLayout update]"];
      [v9 handleFailureInFunction:v10, @"PXStoryDiagnosticHUDLayout.m", 194, @"Invalid parameter not satisfying: %@", @"_updateFlags.isPerformingUpdate" file lineNumber description];
    }
    unint64_t v6 = p_updateFlags->needsUpdate;
    p_updateFlags->updated |= 4uLL;
    if ((v6 & 4) != 0)
    {
      p_updateFlags->unint64_t needsUpdate = v6 & 0xFFFFFFFFFFFFFFFBLL;
      [(PXStoryDiagnosticHUDLayout *)self _updateContent];
      unint64_t v6 = p_updateFlags->needsUpdate;
    }
    p_updateFlags->isPerformingUpdate = 0;
    if (v6)
    {
      uint64_t v11 = [MEMORY[0x1E4F28B00] currentHandler];
      v12 = [NSString stringWithUTF8String:"-[PXStoryDiagnosticHUDLayout update]"];
      objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", v12, @"PXStoryDiagnosticHUDLayout.m", 197, @"still needing to update %lu after update pass", p_updateFlags->needsUpdate);
    }
  }
  v15.receiver = self;
  v15.super_class = (Class)PXStoryDiagnosticHUDLayout;
  [(PXGLayout *)&v15 update];
}

- (BOOL)_shouldDisplayContentForHUDType:(int64_t)a3
{
  return (unint64_t)(a3 - 1) < 0x11;
}

- (void)safeAreaInsetsDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)PXStoryDiagnosticHUDLayout;
  [(PXGLayout *)&v3 safeAreaInsetsDidChange];
  [(PXStoryDiagnosticHUDLayout *)self _invalidateContent];
}

- (void)entityManagerDidChange
{
  v11[1] = *MEMORY[0x1E4F143B8];
  v10.receiver = self;
  v10.super_class = (Class)PXStoryDiagnosticHUDLayout;
  [(PXGLayout *)&v10 entityManagerDidChange];
  objc_super v3 = [(PXGLayout *)self entityManager];
  id v4 = [v3 loadingStatus];
  loadingStatusComponent = self->_loadingStatusComponent;
  self->_loadingStatusComponent = v4;

  unint64_t v6 = [(PXGLayout *)self entityManager];
  id v7 = [(PXGLayout *)self entityManager];
  uint64_t v8 = [v7 loadingStatus];
  v11[0] = v8;
  uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
  [v6 registerObserver:self forComponents:v9];
}

- (void)_enumerateDiagnosticHUDContentProvidersUsingBlock:(id)a3
{
  id v4 = (void (**)(id, void *, unint64_t, unsigned char *))a3;
  unint64_t v5 = [(PXStoryDiagnosticHUDLayout *)self dataSource];
  unint64_t v6 = 0;
  char v8 = 0;
  do
  {
    id v7 = [v5 diagnosticHUDContentProviderForType:v6];
    if (v7) {
      v4[2](v4, v7, v6, &v8);
    }

    if (v6 > 0x12) {
      break;
    }
    ++v6;
  }
  while (!v8);
}

- (void)setAnimationController:(id)a3
{
  unint64_t v5 = (PXStoryAnimationController *)a3;
  animationController = self->_animationController;
  if (animationController != v5)
  {
    id v7 = v5;
    [(PXStoryAnimationController *)animationController unregisterChangeObserver:self context:AnimationControllerObservationContext];
    objc_storeStrong((id *)&self->_animationController, a3);
    [(PXStoryAnimationController *)self->_animationController registerChangeObserver:self context:AnimationControllerObservationContext];
    [(PXStoryDiagnosticHUDLayout *)self _invalidateContent];
    unint64_t v5 = v7;
  }
}

- (void)setRelatedController:(id)a3
{
  unint64_t v5 = (PXStoryRelatedController *)a3;
  if (self->_relatedController != v5)
  {
    unint64_t v6 = v5;
    objc_storeStrong((id *)&self->_relatedController, a3);
    [(PXStoryRelatedController *)self->_relatedController registerChangeObserver:self context:RelatedControllerObservationContext];
    unint64_t v5 = v6;
  }
}

- (void)setModel:(id)a3
{
  unint64_t v5 = (PXStoryModel *)a3;
  model = self->_model;
  if (model != v5)
  {
    id v7 = v5;
    [(PXStoryModel *)model unregisterChangeObserver:self context:ModelObservationContext_18008];
    objc_storeStrong((id *)&self->_model, a3);
    [(PXStoryModel *)self->_model registerChangeObserver:self context:ModelObservationContext_18008];
    [(PXStoryDiagnosticHUDLayout *)self _invalidateControllers];
    [(PXStoryDiagnosticHUDLayout *)self _invalidateContent];
    unint64_t v5 = v7;
  }
}

- (void)dealloc
{
  [(NSTimer *)self->_timer invalidate];
  v3.receiver = self;
  v3.super_class = (Class)PXStoryDiagnosticHUDLayout;
  [(PXGLayout *)&v3 dealloc];
}

- (PXStoryDiagnosticHUDLayout)initWithDataSource:(id)a3
{
  v21[2] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v19.receiver = self;
  v19.super_class = (Class)PXStoryDiagnosticHUDLayout;
  unint64_t v6 = [(PXGLayout *)&v19 init];
  id v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_dataSource, a3);
    char v8 = [(PXStoryDiagnosticHUDDataSource *)v7->_dataSource HUDObservable];
    [v8 registerChangeObserver:v7 context:DataSourceObservationContext];

    uint64_t v9 = objc_msgSend(MEMORY[0x1E4F1CB00], "px_scheduledTimerWithTimeInterval:weakTarget:selector:userInfo:repeats:", v7, sel__invalidateContent, 0, 1, 1.0);
    timer = v7->_timer;
    v7->_timer = (NSTimer *)v9;

    v7->_HUDTextSpriteIndex = [(PXGLayout *)v7 addSpriteWithInitialState:&__block_literal_global_18051];
    uint64_t v11 = +[PXStorySettings sharedInstance];
    if ([v11 allowsShowcase] && (objc_msgSend(v11, "disableShowcaseBadge") & 1) == 0)
    {
      v7->_badgeSpriteIndex = [(PXGLayout *)v7 addSpriteWithInitialState:&__block_literal_global_10];
      id v12 = objc_alloc(MEMORY[0x1E4F28B18]);
      v20[0] = *MEMORY[0x1E4FB0700];
      int v13 = [MEMORY[0x1E4FB1618] redColor];
      v21[0] = v13;
      v20[1] = *MEMORY[0x1E4FB06F8];
      v14 = [MEMORY[0x1E4FB08E0] monospacedSystemFontOfSize:26.0 weight:*MEMORY[0x1E4FB09A8]];
      v21[1] = v14;
      objc_super v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:v20 count:2];
      uint64_t v16 = [v12 initWithString:@" * Showcase Mode * " attributes:v15];
      badgeText = v7->_badgeText;
      v7->_badgeText = (NSAttributedString *)v16;
    }
    else
    {
      v7->_badgeSpriteIndex = -1;
    }
    [(PXGLayout *)v7 setContentSource:v7];
    [(PXStoryDiagnosticHUDLayout *)v7 _invalidateModel];
    [(PXStoryDiagnosticHUDLayout *)v7 _invalidateContent];
  }
  return v7;
}

__n128 __49__PXStoryDiagnosticHUDLayout_initWithDataSource___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  objc_super v3 = *(_OWORD **)(a3 + 24);
  long long v4 = *((_OWORD *)off_1E5DAAF90 + 7);
  v3[6] = *((_OWORD *)off_1E5DAAF90 + 6);
  v3[7] = v4;
  long long v5 = *((_OWORD *)off_1E5DAAF90 + 9);
  v3[8] = *((_OWORD *)off_1E5DAAF90 + 8);
  v3[9] = v5;
  long long v6 = *((_OWORD *)off_1E5DAAF90 + 3);
  v3[2] = *((_OWORD *)off_1E5DAAF90 + 2);
  v3[3] = v6;
  long long v7 = *((_OWORD *)off_1E5DAAF90 + 5);
  v3[4] = *((_OWORD *)off_1E5DAAF90 + 4);
  v3[5] = v7;
  __n128 result = *(__n128 *)off_1E5DAAF90;
  long long v9 = *((_OWORD *)off_1E5DAAF90 + 1);
  _OWORD *v3 = *(_OWORD *)off_1E5DAAF90;
  v3[1] = v9;
  uint64_t v10 = *(void *)(a3 + 32);
  *(unsigned char *)(v10 + 1) = 3;
  *(unsigned char *)(v10 + 34) = 2;
  return result;
}

__n128 __49__PXStoryDiagnosticHUDLayout_initWithDataSource___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  objc_super v3 = *(_OWORD **)(a3 + 24);
  long long v4 = *((_OWORD *)off_1E5DAAF90 + 7);
  v3[6] = *((_OWORD *)off_1E5DAAF90 + 6);
  v3[7] = v4;
  long long v5 = *((_OWORD *)off_1E5DAAF90 + 9);
  v3[8] = *((_OWORD *)off_1E5DAAF90 + 8);
  v3[9] = v5;
  long long v6 = *((_OWORD *)off_1E5DAAF90 + 3);
  v3[2] = *((_OWORD *)off_1E5DAAF90 + 2);
  v3[3] = v6;
  long long v7 = *((_OWORD *)off_1E5DAAF90 + 5);
  v3[4] = *((_OWORD *)off_1E5DAAF90 + 4);
  v3[5] = v7;
  __n128 result = *(__n128 *)off_1E5DAAF90;
  long long v9 = *((_OWORD *)off_1E5DAAF90 + 1);
  _OWORD *v3 = *(_OWORD *)off_1E5DAAF90;
  v3[1] = v9;
  uint64_t v10 = *(void *)(a3 + 32);
  *(unsigned char *)(v10 + 1) = 3;
  *(unsigned char *)(v10 + 34) = 2;
  return result;
}

- (PXStoryDiagnosticHUDLayout)init
{
  long long v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXStoryDiagnosticHUDLayout.m", 57, @"%s is not available as initializer", "-[PXStoryDiagnosticHUDLayout init]");

  abort();
}

@end
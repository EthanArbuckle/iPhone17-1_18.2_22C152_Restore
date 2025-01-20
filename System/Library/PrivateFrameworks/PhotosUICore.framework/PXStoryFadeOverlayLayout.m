@interface PXStoryFadeOverlayLayout
- (PXStoryFadeOverlayLayout)init;
- (PXStoryFadeOverlayLayout)initWithModel:(id)a3;
- (PXStoryModel)model;
- (id)colorAtIndex:(unsigned int)a3 inLayout:(id)a4;
- (void)_invalidateContent;
- (void)_updateContent;
- (void)alphaDidChange;
- (void)didUpdate;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
- (void)referenceSizeDidChange;
- (void)update;
- (void)willUpdate;
@end

@implementation PXStoryFadeOverlayLayout

- (void).cxx_destruct
{
}

- (PXStoryModel)model
{
  return self->_model;
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  id v9 = a3;
  if ((void *)ModelContext != a5)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2 object:self file:@"PXStoryFadeOverlayLayout.m" lineNumber:117 description:@"Code which should be unreachable has been reached"];

    abort();
  }
  if ((a4 & 0x400000000000) != 0)
  {
    id v11 = v9;
    [(PXStoryFadeOverlayLayout *)self _invalidateContent];
    id v9 = v11;
  }
}

- (id)colorAtIndex:(unsigned int)a3 inLayout:(id)a4
{
  id v7 = a4;
  if (self->_fadeSpriteIndex != a3)
  {
    v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2 object:self file:@"PXStoryFadeOverlayLayout.m" lineNumber:105 description:@"Code which should be unreachable has been reached"];

    abort();
  }
  v8 = v7;
  id v9 = +[PXStorySettings sharedInstance];
  int v10 = [v9 wantsHighContrastColors];

  if (v10) {
    [MEMORY[0x1E4FB1618] orangeColor];
  }
  else {
  id v11 = [MEMORY[0x1E4FB1618] blackColor];
  }

  return v11;
}

- (void)_updateContent
{
  [(PXGLayout *)self alpha];
  uint64_t v4 = v3;
  [(PXGLayout *)self referenceSize];
  uint64_t v6 = v5;
  uint64_t v8 = v7;
  -[PXGLayout setContentSize:](self, "setContentSize:");
  id v9 = [(PXStoryFadeOverlayLayout *)self model];
  uint64_t v10 = [(PXGLayout *)self localNumberOfSprites];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __42__PXStoryFadeOverlayLayout__updateContent__block_invoke;
  v13[3] = &unk_1E5DCA730;
  uint64_t v11 = v10 << 32;
  uint64_t v15 = v6;
  uint64_t v16 = v8;
  uint64_t v17 = v4;
  v13[4] = self;
  id v14 = v9;
  id v12 = v9;
  [(PXGLayout *)self modifySpritesInRange:v11 state:v13];
}

void __42__PXStoryFadeOverlayLayout__updateContent__block_invoke()
{
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
      uint64_t v6 = [NSString stringWithUTF8String:"-[PXStoryFadeOverlayLayout _invalidateContent]"];
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, @"PXStoryFadeOverlayLayout.m", 81, @"invalidating %lu after it already has been updated", 1);

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
  v5.super_class = (Class)PXStoryFadeOverlayLayout;
  [(PXGLayout *)&v5 didUpdate];
  if (self->_updateFlags.willPerformUpdate)
  {
    uint64_t v3 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v4 = [NSString stringWithUTF8String:"-[PXStoryFadeOverlayLayout didUpdate]"];
    [v3 handleFailureInFunction:v4, @"PXStoryFadeOverlayLayout.m", 77, @"Invalid parameter not satisfying: %@", @"!_updateFlags.willPerformUpdate" file lineNumber description];
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
      uint64_t v6 = [NSString stringWithUTF8String:"-[PXStoryFadeOverlayLayout update]"];
      [v5 handleFailureInFunction:v6, @"PXStoryFadeOverlayLayout.m", 67, @"Invalid parameter not satisfying: %@", @"!_updateFlags.isPerformingUpdate" file lineNumber description];

      unint64_t needsUpdate = p_updateFlags->needsUpdate;
    }
    p_updateFlags->isPerformingUpdate = 1;
    p_updateFlags->updated = 1;
    if (needsUpdate)
    {
      p_updateFlags->unint64_t needsUpdate = needsUpdate & 0xFFFFFFFFFFFFFFFELL;
      [(PXStoryFadeOverlayLayout *)self _updateContent];
      unint64_t needsUpdate = p_updateFlags->needsUpdate;
    }
    p_updateFlags->isPerformingUpdate = 0;
    if (needsUpdate)
    {
      uint64_t v7 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v8 = [NSString stringWithUTF8String:"-[PXStoryFadeOverlayLayout update]"];
      objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, @"PXStoryFadeOverlayLayout.m", 71, @"still needing to update %lu after update pass", p_updateFlags->needsUpdate);
    }
  }
  v9.receiver = self;
  v9.super_class = (Class)PXStoryFadeOverlayLayout;
  [(PXGLayout *)&v9 update];
}

- (void)willUpdate
{
  v5.receiver = self;
  v5.super_class = (Class)PXStoryFadeOverlayLayout;
  [(PXGLayout *)&v5 willUpdate];
  self->_updateFlags.BOOL willPerformUpdate = 1;
  if (self->_updateFlags.isPerformingUpdate)
  {
    uint64_t v3 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v4 = [NSString stringWithUTF8String:"-[PXStoryFadeOverlayLayout willUpdate]"];
    [v3 handleFailureInFunction:v4, @"PXStoryFadeOverlayLayout.m", 63, @"Invalid parameter not satisfying: %@", @"!_updateFlags.isPerformingUpdate" file lineNumber description];
  }
}

- (void)alphaDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)PXStoryFadeOverlayLayout;
  [(PXGLayout *)&v3 alphaDidChange];
  [(PXStoryFadeOverlayLayout *)self _invalidateContent];
}

- (void)referenceSizeDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)PXStoryFadeOverlayLayout;
  [(PXGLayout *)&v3 referenceSizeDidChange];
  [(PXStoryFadeOverlayLayout *)self _invalidateContent];
}

- (PXStoryFadeOverlayLayout)init
{
  uint64_t v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXStoryFadeOverlayLayout.m", 46, @"%s is not available as initializer", "-[PXStoryFadeOverlayLayout init]");

  abort();
}

- (PXStoryFadeOverlayLayout)initWithModel:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PXStoryFadeOverlayLayout;
  uint64_t v6 = [(PXGLayout *)&v9 init];
  uint64_t v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_model, a3);
    [v5 registerChangeObserver:v7 context:ModelContext];
    [(PXGLayout *)v7 setContentSource:v7];
    v7->_fadeSpriteIndex = [(PXGLayout *)v7 addSpriteWithInitialState:&__block_literal_global_246649];
  }

  return v7;
}

double __42__PXStoryFadeOverlayLayout_initWithModel___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
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
  long long v8 = *((_OWORD *)off_1E5DAAF90 + 1);
  *objc_super v3 = *(_OWORD *)off_1E5DAAF90;
  v3[1] = v8;
  uint64_t v9 = *(void *)(a3 + 32);
  *(unsigned char *)(v9 + 1) = 5;
  __asm { FMOV            V0.2S, #1.0 }
  *(double *)(v9 + 8) = result;
  return result;
}

@end
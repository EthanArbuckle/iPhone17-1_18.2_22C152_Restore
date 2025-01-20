@interface PXCuratedLibraryChapterHeaderLayout
- (BOOL)presentedAlternateAppearance;
- (CGSize)attributedTitleSize;
- (NSAttributedString)attributedTitle;
- (NSAttributedString)floatingAttributedTitle;
- (NSDictionary)floatingTitleDeemphasizedAttributes;
- (NSDictionary)floatingTitleEmphasizedAttributes;
- (NSDictionary)titleDeemphasizedAttributes;
- (NSDictionary)titleEmphasizedAttributes;
- (NSString)rawTitle;
- (PXAssetCollectionReference)assetCollectionReference;
- (PXCuratedLibraryChapterHeaderLayout)init;
- (PXCuratedLibraryChapterHeaderLayoutSpec)spec;
- (PXNumberAnimator)alternateAppearanceMixAnimator;
- (PXSimpleIndexPath)sectionIndexPath;
- (UIEdgeInsets)padding;
- (UIEdgeInsets)paddingForSpriteAtIndex:(unsigned int)a3 inLayout:(id)a4;
- (id)_createAttributedTitleWithEmphasizedAttributes:(id)a3 deemphasizedAttributes:(id)a4;
- (id)attributedStringForSpriteAtIndex:(unsigned int)a3 inLayout:(id)a4;
- (id)axSpriteIndexes;
- (id)hitTestResultForSpriteIndex:(unsigned int)a3;
- (id)imageConfigurationAtIndex:(unsigned int)a3 inLayout:(id)a4;
- (id)stringAtIndex:(unsigned int)a3 inLayout:(id)a4;
- (id)stringAttributesAtIndex:(unsigned int)a3 inLayout:(id)a4;
- (int64_t)verticalAlignmentForStringAtIndex:(unsigned int)a3 inLayout:(id)a4;
- (void)_handleAsyncRawTitle:(id)a3 generation:(int64_t)a4;
- (void)_invalidateAttributedTitle;
- (void)_invalidateChevron;
- (void)_updateSprites;
- (void)_updateTitle;
- (void)displayScaleDidChange;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
- (void)referenceOptionsDidChange;
- (void)referenceSizeDidChange;
- (void)setAssetCollectionReference:(id)a3;
- (void)setFloatingTitleDeemphasizedAttributes:(id)a3;
- (void)setFloatingTitleEmphasizedAttributes:(id)a3;
- (void)setPadding:(UIEdgeInsets)a3;
- (void)setPresentedAlternateAppearance:(BOOL)a3;
- (void)setRawTitle:(id)a3;
- (void)setSectionIndexPath:(PXSimpleIndexPath *)a3;
- (void)setSpec:(id)a3;
- (void)setTitleDeemphasizedAttributes:(id)a3;
- (void)setTitleEmphasizedAttributes:(id)a3;
- (void)update;
- (void)viewEnvironmentDidChange;
- (void)visibleRectDidChange;
@end

@implementation PXCuratedLibraryChapterHeaderLayout

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alternateAppearanceMixAnimator, 0);
  objc_storeStrong((id *)&self->_floatingTitleDeemphasizedAttributes, 0);
  objc_storeStrong((id *)&self->_titleDeemphasizedAttributes, 0);
  objc_storeStrong((id *)&self->_floatingTitleEmphasizedAttributes, 0);
  objc_storeStrong((id *)&self->_titleEmphasizedAttributes, 0);
  objc_storeStrong((id *)&self->_rawTitle, 0);
  objc_storeStrong((id *)&self->_spec, 0);
  objc_storeStrong((id *)&self->_assetCollectionReference, 0);
  objc_storeStrong((id *)&self->_floatingAttributedTitle, 0);
  objc_storeStrong((id *)&self->_attributedTitle, 0);
  objc_storeStrong((id *)&self->_asyncDateQueue, 0);
  objc_storeStrong((id *)&self->_axSpriteIndexes, 0);
  objc_storeStrong((id *)&self->_itemIdentifierBySpriteIndex, 0);
}

- (void)setPresentedAlternateAppearance:(BOOL)a3
{
  self->_presentedAlternateAppearance = a3;
}

- (BOOL)presentedAlternateAppearance
{
  return self->_presentedAlternateAppearance;
}

- (PXNumberAnimator)alternateAppearanceMixAnimator
{
  return self->_alternateAppearanceMixAnimator;
}

- (void)setFloatingTitleDeemphasizedAttributes:(id)a3
{
}

- (NSDictionary)floatingTitleDeemphasizedAttributes
{
  return self->_floatingTitleDeemphasizedAttributes;
}

- (NSDictionary)titleDeemphasizedAttributes
{
  return self->_titleDeemphasizedAttributes;
}

- (void)setFloatingTitleEmphasizedAttributes:(id)a3
{
}

- (NSDictionary)floatingTitleEmphasizedAttributes
{
  return self->_floatingTitleEmphasizedAttributes;
}

- (NSDictionary)titleEmphasizedAttributes
{
  return self->_titleEmphasizedAttributes;
}

- (NSString)rawTitle
{
  return self->_rawTitle;
}

- (void)setPadding:(UIEdgeInsets)a3
{
  self->_padding = a3;
}

- (UIEdgeInsets)padding
{
  double top = self->_padding.top;
  double left = self->_padding.left;
  double bottom = self->_padding.bottom;
  double right = self->_padding.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (PXCuratedLibraryChapterHeaderLayoutSpec)spec
{
  return self->_spec;
}

- (void)setSectionIndexPath:(PXSimpleIndexPath *)a3
{
  long long v3 = *(_OWORD *)&a3->item;
  *(_OWORD *)&self->_sectionIndexPath.dataSourceIdentifier = *(_OWORD *)&a3->dataSourceIdentifier;
  *(_OWORD *)&self->_sectionIndexPath.item = v3;
}

- (PXSimpleIndexPath)sectionIndexPath
{
  long long v3 = *(_OWORD *)&self[33].item;
  *(_OWORD *)&retstr->dataSourceIdentifier = *(_OWORD *)&self[33].dataSourceIdentifier;
  *(_OWORD *)&retstr->item = v3;
  return self;
}

- (PXAssetCollectionReference)assetCollectionReference
{
  return self->_assetCollectionReference;
}

- (id)axSpriteIndexes
{
  v2 = (void *)[(NSMutableIndexSet *)self->_axSpriteIndexes copy];
  return v2;
}

- (id)imageConfigurationAtIndex:(unsigned int)a3 inLayout:(id)a4
{
  v4 = [(PXCuratedLibraryChapterHeaderLayout *)self spec];
  v5 = [v4 chevronImageConfiguration];

  return v5;
}

- (UIEdgeInsets)paddingForSpriteAtIndex:(unsigned int)a3 inLayout:(id)a4
{
  double v4 = 6.0;
  double v5 = 0.0;
  double v6 = 6.0;
  double v7 = 0.0;
  result.double right = v7;
  result.double bottom = v6;
  result.double left = v5;
  result.double top = v4;
  return result;
}

- (id)attributedStringForSpriteAtIndex:(unsigned int)a3 inLayout:(id)a4
{
  id v7 = a4;
  v8 = [(NSArray *)self->_itemIdentifierBySpriteIndex objectAtIndexedSubscript:a3];
  v9 = v8;
  if (v8 == @"PXCuratedLibraryChapterHeaderLayoutItemTitle")
  {
    uint64_t v10 = [(PXCuratedLibraryChapterHeaderLayout *)self attributedTitle];
  }
  else
  {
    if (v8 != @"PXCuratedLibraryChapterHeaderLayoutItemFloatingTitle")
    {
      v13 = [MEMORY[0x1E4F28B00] currentHandler];
      [v13 handleFailureInMethod:a2 object:self file:@"PXCuratedLibraryChapterHeaderLayout.m" lineNumber:572 description:@"Code which should be unreachable has been reached"];

      abort();
    }
    uint64_t v10 = [(PXCuratedLibraryChapterHeaderLayout *)self floatingAttributedTitle];
  }
  v11 = (void *)v10;

  return v11;
}

- (int64_t)verticalAlignmentForStringAtIndex:(unsigned int)a3 inLayout:(id)a4
{
  return [(PXGLayout *)self referenceOptions] & 2;
}

- (id)stringAttributesAtIndex:(unsigned int)a3 inLayout:(id)a4
{
  id v7 = a4;
  v8 = [(NSArray *)self->_itemIdentifierBySpriteIndex objectAtIndexedSubscript:a3];
  if (v8 != @"PXCuratedLibraryChapterHeaderLayoutItemTitle"
    && v8 != @"PXCuratedLibraryChapterHeaderLayoutItemFloatingTitle")
  {
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2 object:self file:@"PXCuratedLibraryChapterHeaderLayout.m" lineNumber:555 description:@"Code which should be unreachable has been reached"];

    abort();
  }

  return 0;
}

- (id)stringAtIndex:(unsigned int)a3 inLayout:(id)a4
{
  id v7 = a4;
  v8 = [(NSArray *)self->_itemIdentifierBySpriteIndex objectAtIndexedSubscript:a3];
  if (v8 != @"PXCuratedLibraryChapterHeaderLayoutItemTitle"
    && v8 != @"PXCuratedLibraryChapterHeaderLayoutItemFloatingTitle")
  {
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2 object:self file:@"PXCuratedLibraryChapterHeaderLayout.m" lineNumber:547 description:@"Code which should be unreachable has been reached"];

    abort();
  }

  return &stru_1F00B0030;
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  char v6 = a4;
  id v9 = a3;
  if ((void *)AlternateAppearanceMixAnimatorObservationContext_100023 != a5)
  {
    v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2 object:self file:@"PXCuratedLibraryChapterHeaderLayout.m" lineNumber:536 description:@"Code which should be unreachable has been reached"];

    abort();
  }
  if ((v6 & 2) != 0)
  {
    id v18 = v9;
    uint64_t v10 = [(PXCuratedLibraryChapterHeaderLayout *)self alternateAppearanceMixAnimator];
    char v11 = [v10 isBeingMutated];

    id v9 = v18;
    if ((v11 & 1) == 0)
    {
      p_updateFlags = &self->_updateFlags;
      unint64_t needsUpdate = self->_updateFlags.needsUpdate;
      if (needsUpdate)
      {
        if (!self->_updateFlags.isPerformingUpdate)
        {
LABEL_9:
          p_updateFlags->unint64_t needsUpdate = needsUpdate | 1;
          goto LABEL_10;
        }
LABEL_8:
        if (self->_updateFlags.updated)
        {
          v16 = [MEMORY[0x1E4F28B00] currentHandler];
          v17 = [NSString stringWithUTF8String:"-[PXCuratedLibraryChapterHeaderLayout observable:didChange:context:]"];
          objc_msgSend(v16, "handleFailureInFunction:file:lineNumber:description:", v17, @"PXCuratedLibraryChapterHeaderLayout.m", 533, @"invalidating %lu after it already has been updated", 1);

          abort();
        }
        goto LABEL_9;
      }
      if (self->_updateFlags.isPerformingUpdate) {
        goto LABEL_8;
      }
      BOOL willPerformUpdate = self->_updateFlags.willPerformUpdate;
      p_updateFlags->unint64_t needsUpdate = 1;
      if (!willPerformUpdate)
      {
        [(PXGLayout *)self setNeedsUpdate];
        id v9 = v18;
      }
    }
  }
LABEL_10:
}

- (id)hitTestResultForSpriteIndex:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  if ([(PXCuratedLibraryChapterHeaderLayout *)self presentedAlternateAppearance])
  {
    double v5 = 0;
  }
  else
  {
    char v6 = [(PXCuratedLibraryChapterHeaderLayout *)self assetCollectionReference];
    id v7 = [(PXGLayout *)self spriteReferenceForSpriteIndex:v3 objectReference:0];
    v8 = [PXCuratedLibraryHitTestResult alloc];
    if (v6) {
      uint64_t v9 = [(PXCuratedLibraryHitTestResult *)v8 initWithControl:4 spriteReference:v7 layout:self assetCollectionReference:v6];
    }
    else {
      uint64_t v9 = [(PXCuratedLibraryHitTestResult *)v8 initWithControl:4 spriteReference:v7 layout:self];
    }
    double v5 = (void *)v9;
  }
  return v5;
}

- (void)referenceOptionsDidChange
{
  v8.receiver = self;
  v8.super_class = (Class)PXCuratedLibraryChapterHeaderLayout;
  [(PXGLayout *)&v8 referenceOptionsDidChange];
  [(PXCuratedLibraryChapterHeaderLayout *)self _invalidateAttributedTitle];
  p_updateFlags = &self->_updateFlags;
  unint64_t needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_updateFlags.isPerformingUpdate)
    {
LABEL_6:
      p_updateFlags->unint64_t needsUpdate = needsUpdate | 3;
      return;
    }
LABEL_5:
    if ((self->_updateFlags.updated & 3) != 0)
    {
      char v6 = [MEMORY[0x1E4F28B00] currentHandler];
      id v7 = [NSString stringWithUTF8String:"-[PXCuratedLibraryChapterHeaderLayout referenceOptionsDidChange]"];
      objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, @"PXCuratedLibraryChapterHeaderLayout.m", 508, @"invalidating %lu after it already has been updated", 3);

      abort();
    }
    goto LABEL_6;
  }
  if (self->_updateFlags.isPerformingUpdate) {
    goto LABEL_5;
  }
  BOOL willPerformUpdate = self->_updateFlags.willPerformUpdate;
  p_updateFlags->unint64_t needsUpdate = 3;
  if (!willPerformUpdate) {
    [(PXGLayout *)self setNeedsUpdate];
  }
}

- (void)viewEnvironmentDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)PXCuratedLibraryChapterHeaderLayout;
  [(PXGLayout *)&v3 viewEnvironmentDidChange];
  [(PXCuratedLibraryChapterHeaderLayout *)self _invalidateChevron];
}

- (void)displayScaleDidChange
{
  v8.receiver = self;
  v8.super_class = (Class)PXCuratedLibraryChapterHeaderLayout;
  [(PXGLayout *)&v8 displayScaleDidChange];
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
      char v6 = [MEMORY[0x1E4F28B00] currentHandler];
      id v7 = [NSString stringWithUTF8String:"-[PXCuratedLibraryChapterHeaderLayout displayScaleDidChange]"];
      objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, @"PXCuratedLibraryChapterHeaderLayout.m", 497, @"invalidating %lu after it already has been updated", 1);

      abort();
    }
    goto LABEL_6;
  }
  if (self->_updateFlags.isPerformingUpdate) {
    goto LABEL_5;
  }
  BOOL willPerformUpdate = self->_updateFlags.willPerformUpdate;
  p_updateFlags->unint64_t needsUpdate = 1;
  if (!willPerformUpdate) {
    [(PXGLayout *)self setNeedsUpdate];
  }
}

- (void)referenceSizeDidChange
{
  v8.receiver = self;
  v8.super_class = (Class)PXCuratedLibraryChapterHeaderLayout;
  [(PXGLayout *)&v8 referenceSizeDidChange];
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
      char v6 = [MEMORY[0x1E4F28B00] currentHandler];
      id v7 = [NSString stringWithUTF8String:"-[PXCuratedLibraryChapterHeaderLayout referenceSizeDidChange]"];
      objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, @"PXCuratedLibraryChapterHeaderLayout.m", 492, @"invalidating %lu after it already has been updated", 1);

      abort();
    }
    goto LABEL_6;
  }
  if (self->_updateFlags.isPerformingUpdate) {
    goto LABEL_5;
  }
  BOOL willPerformUpdate = self->_updateFlags.willPerformUpdate;
  p_updateFlags->unint64_t needsUpdate = 1;
  if (!willPerformUpdate) {
    [(PXGLayout *)self setNeedsUpdate];
  }
}

- (void)visibleRectDidChange
{
  v8.receiver = self;
  v8.super_class = (Class)PXCuratedLibraryChapterHeaderLayout;
  [(PXGLayout *)&v8 visibleRectDidChange];
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
      char v6 = [MEMORY[0x1E4F28B00] currentHandler];
      id v7 = [NSString stringWithUTF8String:"-[PXCuratedLibraryChapterHeaderLayout visibleRectDidChange]"];
      objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, @"PXCuratedLibraryChapterHeaderLayout.m", 487, @"invalidating %lu after it already has been updated", 1);

      abort();
    }
    goto LABEL_6;
  }
  if (self->_updateFlags.isPerformingUpdate) {
    goto LABEL_5;
  }
  BOOL willPerformUpdate = self->_updateFlags.willPerformUpdate;
  p_updateFlags->unint64_t needsUpdate = 1;
  if (!willPerformUpdate) {
    [(PXGLayout *)self setNeedsUpdate];
  }
}

- (CGSize)attributedTitleSize
{
}

- (id)_createAttributedTitleWithEmphasizedAttributes:(id)a3 deemphasizedAttributes:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_super v8 = [(PXCuratedLibraryChapterHeaderLayout *)self rawTitle];
  uint64_t v9 = [v8 componentsSeparatedByString:@""];

  id v10 = objc_alloc_init(MEMORY[0x1E4F28E48]);
  LODWORD(self) = ([(PXGLayout *)self referenceOptions] >> 1) & 1;
  v27[0] = 0;
  v27[1] = v27;
  v27[2] = 0x2020000000;
  char v28 = 0;
  uint64_t v17 = MEMORY[0x1E4F143A8];
  uint64_t v18 = 3221225472;
  v19 = __109__PXCuratedLibraryChapterHeaderLayout__createAttributedTitleWithEmphasizedAttributes_deemphasizedAttributes___block_invoke;
  v20 = &unk_1E5DB9688;
  id v11 = v10;
  id v21 = v11;
  v25 = v27;
  id v12 = v6;
  id v22 = v12;
  id v13 = v7;
  id v23 = v13;
  char v26 = (char)self;
  id v14 = v9;
  id v24 = v14;
  [v14 enumerateObjectsUsingBlock:&v17];
  v15 = objc_msgSend(v11, "copy", v17, v18, v19, v20);

  _Block_object_dispose(v27, 8);
  return v15;
}

void __109__PXCuratedLibraryChapterHeaderLayout__createAttributedTitleWithEmphasizedAttributes_deemphasizedAttributes___block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  double v5 = *(void **)(a1 + 32);
  id v6 = (objc_class *)MEMORY[0x1E4F28B18];
  id v7 = a2;
  id v8 = [v6 alloc];
  uint64_t v9 = 40;
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24)) {
    uint64_t v9 = 48;
  }
  id v10 = (void *)[v8 initWithString:v7 attributes:*(void *)(a1 + v9)];

  [v5 appendAttributedString:v10];
  if (*(unsigned char *)(a1 + 72) && [*(id *)(a1 + 56) count] - 1 > a3)
  {
    id v11 = *(void **)(a1 + 32);
    id v12 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:@"\n"];
    [v11 appendAttributedString:v12];
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) ^= 1u;
}

- (NSAttributedString)floatingAttributedTitle
{
  floatingAttributedTitle = self->_floatingAttributedTitle;
  if (!floatingAttributedTitle)
  {
    double v4 = [(PXCuratedLibraryChapterHeaderLayout *)self floatingTitleEmphasizedAttributes];
    double v5 = [(PXCuratedLibraryChapterHeaderLayout *)self floatingTitleDeemphasizedAttributes];
    id v6 = [(PXCuratedLibraryChapterHeaderLayout *)self _createAttributedTitleWithEmphasizedAttributes:v4 deemphasizedAttributes:v5];
    id v7 = self->_floatingAttributedTitle;
    self->_floatingAttributedTitle = v6;

    floatingAttributedTitle = self->_floatingAttributedTitle;
  }
  return floatingAttributedTitle;
}

- (NSAttributedString)attributedTitle
{
  attributedTitle = self->_attributedTitle;
  if (!attributedTitle)
  {
    double v4 = [(PXCuratedLibraryChapterHeaderLayout *)self titleEmphasizedAttributes];
    double v5 = [(PXCuratedLibraryChapterHeaderLayout *)self titleDeemphasizedAttributes];
    id v6 = [(PXCuratedLibraryChapterHeaderLayout *)self _createAttributedTitleWithEmphasizedAttributes:v4 deemphasizedAttributes:v5];
    id v7 = self->_attributedTitle;
    self->_attributedTitle = v6;

    attributedTitle = self->_attributedTitle;
  }
  return attributedTitle;
}

- (void)_handleAsyncRawTitle:(id)a3 generation:(int64_t)a4
{
  id v6 = a3;
  id v7 = v6;
  if (self->_asyncDateGeneration == a4)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __71__PXCuratedLibraryChapterHeaderLayout__handleAsyncRawTitle_generation___block_invoke;
    block[3] = &unk_1E5DD0D90;
    int64_t v10 = a4;
    block[4] = self;
    id v9 = v6;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

uint64_t __71__PXCuratedLibraryChapterHeaderLayout__handleAsyncRawTitle_generation___block_invoke(uint64_t result)
{
  if (*(void *)(result + 48) == *(void *)(*(void *)(result + 32) + 936)) {
    return [*(id *)(result + 32) setRawTitle:*(void *)(result + 40)];
  }
  return result;
}

- (void)_updateTitle
{
  v35[3] = *MEMORY[0x1E4F143B8];
  objc_super v3 = [(PXCuratedLibraryChapterHeaderLayout *)self spec];
  double v4 = [v3 titleFont];
  double v5 = [MEMORY[0x1E4FB0850] defaultParagraphStyle];
  id v6 = (void *)[v5 mutableCopy];

  [v6 setLineBreakMode:4];
  if (([(PXGLayout *)self referenceOptions] & 2) != 0) {
    [v6 setAlignment:2];
  }
  uint64_t v7 = *MEMORY[0x1E4FB06F8];
  v35[0] = v4;
  uint64_t v8 = *MEMORY[0x1E4FB0700];
  v33[0] = v7;
  v33[1] = v8;
  id v9 = [v3 titleEmphasizedColor];
  uint64_t v34 = *MEMORY[0x1E4FB0738];
  uint64_t v10 = v34;
  v35[1] = v9;
  v35[2] = v6;
  id v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v35 forKeys:v33 count:3];
  [(PXCuratedLibraryChapterHeaderLayout *)self setTitleEmphasizedAttributes:v11];

  v32[0] = v4;
  v31[0] = v7;
  v31[1] = v8;
  id v12 = [v3 floatingTitleEmphasizedColor];
  v31[2] = v10;
  v32[1] = v12;
  v32[2] = v6;
  id v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v32 forKeys:v31 count:3];
  [(PXCuratedLibraryChapterHeaderLayout *)self setFloatingTitleEmphasizedAttributes:v13];

  v30[0] = v4;
  v29[0] = v7;
  v29[1] = v8;
  id v14 = [v3 titleDeemphasizedColor];
  v29[2] = v10;
  v30[1] = v14;
  v30[2] = v6;
  v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v30 forKeys:v29 count:3];
  [(PXCuratedLibraryChapterHeaderLayout *)self setTitleDeemphasizedAttributes:v15];

  v28[0] = v4;
  v27[0] = v7;
  v27[1] = v8;
  v16 = [v3 floatingTitleDeemphasizedColor];
  v27[2] = v10;
  v28[1] = v16;
  v28[2] = v6;
  uint64_t v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:v27 count:3];
  [(PXCuratedLibraryChapterHeaderLayout *)self setFloatingTitleDeemphasizedAttributes:v17];

  LOBYTE(v17) = [v3 shouldAbbreviateMonth];
  uint64_t v18 = [(PXCuratedLibraryChapterHeaderLayout *)self assetCollectionReference];
  v19 = [v18 assetCollection];

  if (v17)
  {
    v20 = (void *)(self->_asyncDateGeneration + 1);
    self->_asyncDateGeneration = (int64_t)v20;
    objc_initWeak(&location, self);
    asyncDateQueue = self->_asyncDateQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __51__PXCuratedLibraryChapterHeaderLayout__updateTitle__block_invoke;
    block[3] = &unk_1E5DB9660;
    id v24 = v19;
    v25[1] = (id)3;
    objc_copyWeak(v25, &location);
    v25[2] = v20;
    dispatch_async(asyncDateQueue, block);
    objc_destroyWeak(v25);

    objc_destroyWeak(&location);
  }
  else
  {
    id v22 = [v19 localizedSubtitle];
    [(PXCuratedLibraryChapterHeaderLayout *)self setRawTitle:v22];
  }
}

void __51__PXCuratedLibraryChapterHeaderLayout__updateTitle__block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) localizedDateDescriptionWithOptions:*(void *)(a1 + 48)];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _handleAsyncRawTitle:v3 generation:*(void *)(a1 + 56)];
}

- (void)setTitleDeemphasizedAttributes:(id)a3
{
  uint64_t v8 = (NSDictionary *)a3;
  double v4 = self->_titleDeemphasizedAttributes;
  if (v4 == v8)
  {
  }
  else
  {
    char v5 = [(NSDictionary *)v8 isEqual:v4];

    if ((v5 & 1) == 0)
    {
      id v6 = (NSDictionary *)[(NSDictionary *)v8 copy];
      titleDeemphasizedAttributes = self->_titleDeemphasizedAttributes;
      self->_titleDeemphasizedAttributes = v6;

      [(PXCuratedLibraryChapterHeaderLayout *)self _invalidateAttributedTitle];
    }
  }
}

- (void)_invalidateChevron
{
  ++self->_chevronVersion;
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
      char v5 = [MEMORY[0x1E4F28B00] currentHandler];
      id v6 = [NSString stringWithUTF8String:"-[PXCuratedLibraryChapterHeaderLayout _invalidateChevron]"];
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, @"PXCuratedLibraryChapterHeaderLayout.m", 380, @"invalidating %lu after it already has been updated", 1);

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

- (void)_invalidateAttributedTitle
{
  attributedTitle = self->_attributedTitle;
  self->_attributedTitle = 0;

  floatingAttributedTitle = self->_floatingAttributedTitle;
  self->_floatingAttributedTitle = 0;

  self->_attributedTitleSize = *(CGSize *)off_1E5DAB030;
  ++self->_titleVersion;
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
      uint64_t v8 = [MEMORY[0x1E4F28B00] currentHandler];
      id v9 = [NSString stringWithUTF8String:"-[PXCuratedLibraryChapterHeaderLayout _invalidateAttributedTitle]"];
      objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, @"PXCuratedLibraryChapterHeaderLayout.m", 375, @"invalidating %lu after it already has been updated", 1);

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

- (void)setTitleEmphasizedAttributes:(id)a3
{
  uint64_t v8 = (NSDictionary *)a3;
  double v4 = self->_titleEmphasizedAttributes;
  if (v4 == v8)
  {
  }
  else
  {
    char v5 = [(NSDictionary *)v8 isEqual:v4];

    if ((v5 & 1) == 0)
    {
      id v6 = (NSDictionary *)[(NSDictionary *)v8 copy];
      titleEmphasizedAttributes = self->_titleEmphasizedAttributes;
      self->_titleEmphasizedAttributes = v6;

      [(PXCuratedLibraryChapterHeaderLayout *)self _invalidateAttributedTitle];
    }
  }
}

- (void)setRawTitle:(id)a3
{
  uint64_t v8 = (NSString *)a3;
  double v4 = self->_rawTitle;
  if (v4 == v8)
  {
  }
  else
  {
    BOOL v5 = [(NSString *)v4 isEqualToString:v8];

    if (!v5)
    {
      id v6 = (NSString *)[(NSString *)v8 copy];
      rawTitle = self->_rawTitle;
      self->_rawTitle = v6;

      [(PXCuratedLibraryChapterHeaderLayout *)self _invalidateAttributedTitle];
    }
  }
}

- (void)setAssetCollectionReference:(id)a3
{
  id v13 = (PXAssetCollectionReference *)a3;
  BOOL v5 = self->_assetCollectionReference;
  if (v5 == v13)
  {

LABEL_10:
    uint64_t v7 = v13;
    goto LABEL_11;
  }
  char v6 = [(PXAssetCollectionReference *)v13 isEqual:v5];

  uint64_t v7 = v13;
  if (v6) {
    goto LABEL_11;
  }
  objc_storeStrong((id *)&self->_assetCollectionReference, a3);
  p_updateFlags = &self->_updateFlags;
  unint64_t needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_updateFlags.isPerformingUpdate)
    {
LABEL_9:
      p_updateFlags->unint64_t needsUpdate = needsUpdate | 2;
      goto LABEL_10;
    }
LABEL_8:
    if ((self->_updateFlags.updated & 2) != 0)
    {
      id v11 = [MEMORY[0x1E4F28B00] currentHandler];
      id v12 = [NSString stringWithUTF8String:"-[PXCuratedLibraryChapterHeaderLayout setAssetCollectionReference:]"];
      objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", v12, @"PXCuratedLibraryChapterHeaderLayout.m", 351, @"invalidating %lu after it already has been updated", 2);

      abort();
    }
    goto LABEL_9;
  }
  if (self->_updateFlags.isPerformingUpdate) {
    goto LABEL_8;
  }
  BOOL willPerformUpdate = self->_updateFlags.willPerformUpdate;
  p_updateFlags->unint64_t needsUpdate = 2;
  uint64_t v7 = v13;
  if (!willPerformUpdate)
  {
    [(PXGLayout *)self setNeedsUpdate];
    goto LABEL_10;
  }
LABEL_11:
}

- (void)_updateSprites
{
}

uint64_t __53__PXCuratedLibraryChapterHeaderLayout__updateSprites__block_invoke(uint64_t a1, void *a2)
{
  return [a2 setValue:*(double *)(a1 + 32)];
}

uint64_t __53__PXCuratedLibraryChapterHeaderLayout__updateSprites__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 setValue:*(double *)(a1 + 32)];
}

uint64_t __53__PXCuratedLibraryChapterHeaderLayout__updateSprites__block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 setValue:*(double *)(a1 + 32)];
}

void __53__PXCuratedLibraryChapterHeaderLayout__updateSprites__block_invoke_4()
{
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
      char v6 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v7 = [NSString stringWithUTF8String:"-[PXCuratedLibraryChapterHeaderLayout update]"];
      [v6 handleFailureInFunction:v7, @"PXCuratedLibraryChapterHeaderLayout.m", 109, @"Invalid parameter not satisfying: %@", @"!_updateFlags.isPerformingUpdate" file lineNumber description];

      unint64_t needsUpdate = p_updateFlags->needsUpdate;
    }
    p_updateFlags->isPerformingUpdate = 1;
    p_updateFlags->updated = 2;
    if ((needsUpdate & 2) != 0)
    {
      p_updateFlags->unint64_t needsUpdate = needsUpdate & 0xFFFFFFFFFFFFFFFDLL;
      [(PXCuratedLibraryChapterHeaderLayout *)self _updateTitle];
      if (!p_updateFlags->isPerformingUpdate)
      {
        uint64_t v10 = [MEMORY[0x1E4F28B00] currentHandler];
        id v11 = [NSString stringWithUTF8String:"-[PXCuratedLibraryChapterHeaderLayout update]"];
        [v10 handleFailureInFunction:v11, @"PXCuratedLibraryChapterHeaderLayout.m", 113, @"Invalid parameter not satisfying: %@", @"_updateFlags.isPerformingUpdate" file lineNumber description];
      }
    }
    unint64_t v5 = p_updateFlags->needsUpdate;
    p_updateFlags->updated |= 1uLL;
    if (v5)
    {
      p_updateFlags->unint64_t needsUpdate = v5 & 0xFFFFFFFFFFFFFFFELL;
      [(PXCuratedLibraryChapterHeaderLayout *)self _updateSprites];
      unint64_t v5 = p_updateFlags->needsUpdate;
    }
    p_updateFlags->isPerformingUpdate = 0;
    if (v5)
    {
      uint64_t v8 = [MEMORY[0x1E4F28B00] currentHandler];
      id v9 = [NSString stringWithUTF8String:"-[PXCuratedLibraryChapterHeaderLayout update]"];
      objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, @"PXCuratedLibraryChapterHeaderLayout.m", 116, @"still needing to update %lu after update pass", p_updateFlags->needsUpdate);
    }
  }
  v12.receiver = self;
  v12.super_class = (Class)PXCuratedLibraryChapterHeaderLayout;
  [(PXGLayout *)&v12 update];
}

- (void)setSpec:(id)a3
{
  id v13 = (PXCuratedLibraryChapterHeaderLayoutSpec *)a3;
  unint64_t v5 = self->_spec;
  if (v5 == v13)
  {

LABEL_10:
    uint64_t v7 = v13;
    goto LABEL_11;
  }
  char v6 = [(PXCuratedLibraryChapterHeaderLayoutSpec *)v13 isEqual:v5];

  uint64_t v7 = v13;
  if (v6) {
    goto LABEL_11;
  }
  objc_storeStrong((id *)&self->_spec, a3);
  p_updateFlags = &self->_updateFlags;
  unint64_t needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_updateFlags.isPerformingUpdate)
    {
LABEL_9:
      p_updateFlags->unint64_t needsUpdate = needsUpdate | 3;
      goto LABEL_10;
    }
LABEL_8:
    if ((self->_updateFlags.updated & 3) != 0)
    {
      id v11 = [MEMORY[0x1E4F28B00] currentHandler];
      objc_super v12 = [NSString stringWithUTF8String:"-[PXCuratedLibraryChapterHeaderLayout setSpec:]"];
      objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", v12, @"PXCuratedLibraryChapterHeaderLayout.m", 105, @"invalidating %lu after it already has been updated", 3);

      abort();
    }
    goto LABEL_9;
  }
  if (self->_updateFlags.isPerformingUpdate) {
    goto LABEL_8;
  }
  BOOL willPerformUpdate = self->_updateFlags.willPerformUpdate;
  p_updateFlags->unint64_t needsUpdate = 3;
  uint64_t v7 = v13;
  if (!willPerformUpdate)
  {
    [(PXGLayout *)self setNeedsUpdate];
    goto LABEL_10;
  }
LABEL_11:
}

- (PXCuratedLibraryChapterHeaderLayout)init
{
  v10.receiver = self;
  v10.super_class = (Class)PXCuratedLibraryChapterHeaderLayout;
  v2 = [(PXGLayout *)&v10 init];
  id v3 = v2;
  if (v2)
  {
    [(PXGLayout *)v2 setContentSource:v2];
    v3->_attributedTitleSize = *(CGSize *)off_1E5DAB030;
    v3->_chevronSize = (CGSize)xmmword_1AB359B00;
    itemIdentifierBySpriteIndex = v3->_itemIdentifierBySpriteIndex;
    v3->_itemIdentifierBySpriteIndex = (NSArray *)MEMORY[0x1E4F1CBF0];

    unint64_t v5 = (NSMutableIndexSet *)objc_alloc_init(MEMORY[0x1E4F28E60]);
    axSpriteIndexes = v3->_axSpriteIndexes;
    v3->_axSpriteIndexes = v5;

    uint64_t v7 = [objc_alloc((Class)off_1E5DA74E8) initWithValue:0.0 epsilon:0.01];
    alternateAppearanceMixAnimator = v3->_alternateAppearanceMixAnimator;
    v3->_alternateAppearanceMixAnimator = (PXNumberAnimator *)v7;

    [(PXNumberAnimator *)v3->_alternateAppearanceMixAnimator registerChangeObserver:v3 context:AlternateAppearanceMixAnimatorObservationContext_100023];
    if (init_onceToken_100072 != -1) {
      dispatch_once(&init_onceToken_100072, &__block_literal_global_100073);
    }
    objc_storeStrong((id *)&v3->_asyncDateQueue, (id)init_asyncDateQueue_100074);
  }
  return v3;
}

void __43__PXCuratedLibraryChapterHeaderLayout_init__block_invoke()
{
  id v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v0 = dispatch_queue_attr_make_with_qos_class(v3, QOS_CLASS_USER_INITIATED, 0);
  dispatch_queue_t v1 = dispatch_queue_create("com.apple.photos.curatedlibrary-chapter-header-async-dates", v0);
  v2 = (void *)init_asyncDateQueue_100074;
  init_asyncDateQueue_100074 = (uint64_t)v1;
}

@end
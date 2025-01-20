@interface PXFeedDummyItemLayout
- (PXFeedDummyItemLayout)init;
- (id)attributedStringForSpriteAtIndex:(unsigned int)a3 inLayout:(id)a4;
- (id)axSpriteIndexes;
- (id)colorAtIndex:(unsigned int)a3 inLayout:(id)a4;
- (id)representedObject;
- (id)stringAtIndex:(unsigned int)a3 inLayout:(id)a4;
- (id)stringAttributesAtIndex:(unsigned int)a3 inLayout:(id)a4;
- (int64_t)verticalAlignmentForStringAtIndex:(unsigned int)a3 inLayout:(id)a4;
- (void)_invalidateContent;
- (void)_invalidateContentVersion;
- (void)_updateContent;
- (void)displayScaleDidChange;
- (void)referenceSizeDidChange;
- (void)setRepresentedObject:(id)a3;
- (void)update;
@end

@implementation PXFeedDummyItemLayout

- (void).cxx_destruct
{
}

- (id)representedObject
{
  return self->_representedObject;
}

- (id)axSpriteIndexes
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F28D60]);
  return v2;
}

- (id)attributedStringForSpriteAtIndex:(unsigned int)a3 inLayout:(id)a4
{
  id v7 = a4;
  if (self->_textSpriteIndex != a3)
  {
    v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2 object:self file:@"PXFeedDummyItemLayout.m" lineNumber:152 description:@"Code which should be unreachable has been reached"];

    abort();
  }

  return 0;
}

- (id)stringAttributesAtIndex:(unsigned int)a3 inLayout:(id)a4
{
  id v7 = a4;
  if (self->_textSpriteIndex != a3)
  {
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2 object:self file:@"PXFeedDummyItemLayout.m" lineNumber:144 description:@"Code which should be unreachable has been reached"];

    abort();
  }
  v8 = v7;
  if (stringAttributesAtIndex_inLayout__onceToken != -1) {
    dispatch_once(&stringAttributesAtIndex_inLayout__onceToken, &__block_literal_global_95289);
  }
  id v9 = (id)stringAttributesAtIndex_inLayout__attributes;

  return v9;
}

void __58__PXFeedDummyItemLayout_stringAttributesAtIndex_inLayout___block_invoke()
{
  v7[3] = *MEMORY[0x1E4F143B8];
  id v0 = objc_alloc_init(MEMORY[0x1E4FB0848]);
  [v0 setAlignment:1];
  [v0 setLineBreakMode:0];
  v6[0] = *MEMORY[0x1E4FB06F8];
  v1 = [MEMORY[0x1E4FB08E0] monospacedSystemFontOfSize:13.0 weight:*MEMORY[0x1E4FB09E0]];
  v7[0] = v1;
  v6[1] = *MEMORY[0x1E4FB0700];
  id v2 = [MEMORY[0x1E4FB1618] darkGrayColor];
  v7[1] = v2;
  v6[2] = *MEMORY[0x1E4FB0738];
  v3 = (void *)[v0 copy];
  v7[2] = v3;
  uint64_t v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:v6 count:3];
  v5 = (void *)stringAttributesAtIndex_inLayout__attributes;
  stringAttributesAtIndex_inLayout__attributes = v4;
}

- (id)stringAtIndex:(unsigned int)a3 inLayout:(id)a4
{
  id v7 = a4;
  if (self->_textSpriteIndex != a3)
  {
    v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2 object:self file:@"PXFeedDummyItemLayout.m" lineNumber:124 description:@"Code which should be unreachable has been reached"];

    abort();
  }
  v8 = v7;
  id v9 = [(PXFeedDummyItemLayout *)self representedObject];
  id v10 = [NSString alloc];
  v11 = (objc_class *)objc_opt_class();
  v12 = NSStringFromClass(v11);
  v13 = (void *)[v10 initWithFormat:@"<%@: %p>", v12, v9];

  return v13;
}

- (int64_t)verticalAlignmentForStringAtIndex:(unsigned int)a3 inLayout:(id)a4
{
  id v7 = a4;
  if (self->_textSpriteIndex != a3)
  {
    id v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2 object:self file:@"PXFeedDummyItemLayout.m" lineNumber:115 description:@"Code which should be unreachable has been reached"];

    abort();
  }

  return 0;
}

- (id)colorAtIndex:(unsigned int)a3 inLayout:(id)a4
{
  id v7 = a4;
  if (self->_backgroundSpriteIndex != a3)
  {
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2 object:self file:@"PXFeedDummyItemLayout.m" lineNumber:105 description:@"Code which should be unreachable has been reached"];

    abort();
  }
  v8 = v7;
  id v9 = [MEMORY[0x1E4FB1618] colorWithWhite:0.85 alpha:1.0];

  return v9;
}

- (void)_updateContent
{
  [(PXGLayout *)self referenceSize];
  uint64_t v4 = v3;
  uint64_t v6 = v5;
  -[PXGLayout setContentSize:](self, "setContentSize:");
  uint64_t v7 = [(PXGLayout *)self localNumberOfSprites];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __39__PXFeedDummyItemLayout__updateContent__block_invoke;
  v8[3] = &unk_1E5DB9010;
  v8[5] = v4;
  v8[6] = v6;
  v8[4] = self;
  [(PXGLayout *)self modifySpritesInRange:v7 << 32 fullState:v8];
}

void __39__PXFeedDummyItemLayout__updateContent__block_invoke()
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
      uint64_t v6 = [NSString stringWithUTF8String:"-[PXFeedDummyItemLayout _invalidateContent]"];
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, @"PXFeedDummyItemLayout.m", 75, @"invalidating %lu after it already has been updated", 1);

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

- (void)_invalidateContentVersion
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
      uint64_t v5 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v6 = [NSString stringWithUTF8String:"-[PXFeedDummyItemLayout update]"];
      [v5 handleFailureInFunction:v6, @"PXFeedDummyItemLayout.m", 61, @"Invalid parameter not satisfying: %@", @"!_updateFlags.isPerformingUpdate" file lineNumber description];

      unint64_t needsUpdate = p_updateFlags->needsUpdate;
    }
    p_updateFlags->isPerformingUpdate = 1;
    p_updateFlags->updated = 1;
    if (needsUpdate)
    {
      p_updateFlags->unint64_t needsUpdate = needsUpdate & 0xFFFFFFFFFFFFFFFELL;
      [(PXFeedDummyItemLayout *)self _updateContent];
      unint64_t needsUpdate = p_updateFlags->needsUpdate;
    }
    p_updateFlags->isPerformingUpdate = 0;
    if (needsUpdate)
    {
      uint64_t v7 = [MEMORY[0x1E4F28B00] currentHandler];
      v8 = [NSString stringWithUTF8String:"-[PXFeedDummyItemLayout update]"];
      objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, @"PXFeedDummyItemLayout.m", 65, @"still needing to update %lu after update pass", p_updateFlags->needsUpdate);
    }
  }
  v9.receiver = self;
  v9.super_class = (Class)PXFeedDummyItemLayout;
  [(PXGLayout *)&v9 update];
}

- (void)displayScaleDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)PXFeedDummyItemLayout;
  [(PXGLayout *)&v3 displayScaleDidChange];
  [(PXFeedDummyItemLayout *)self _invalidateContent];
}

- (void)referenceSizeDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)PXFeedDummyItemLayout;
  [(PXGLayout *)&v3 referenceSizeDidChange];
  [(PXFeedDummyItemLayout *)self _invalidateContent];
}

- (void)setRepresentedObject:(id)a3
{
  id v7 = a3;
  id v5 = self->_representedObject;
  if (v5 == v7)
  {
  }
  else
  {
    char v6 = [v7 isEqual:v5];

    if ((v6 & 1) == 0)
    {
      objc_storeStrong(&self->_representedObject, a3);
      [(PXFeedDummyItemLayout *)self _invalidateContentVersion];
    }
  }
}

- (PXFeedDummyItemLayout)init
{
  v5.receiver = self;
  v5.super_class = (Class)PXFeedDummyItemLayout;
  id v2 = [(PXGLayout *)&v5 init];
  objc_super v3 = v2;
  if (v2)
  {
    v2->_backgroundSpriteIndex = [(PXGLayout *)v2 addSpriteWithInitialState:0];
    v3->_textSpriteIndex = [(PXGLayout *)v3 addSpriteWithInitialState:0];
    [(PXGLayout *)v3 setContentSource:v3];
  }
  return v3;
}

@end
@interface PXGPPTRowItemLayout
- (PXGPPTRowItemLayout)init;
- (PXGPPTRowItemLayout)initWithColor:(id)a3;
- (UIColor)color;
- (id)colorAtIndex:(unsigned int)a3 inLayout:(id)a4;
- (void)_invalidateContent;
- (void)_updateContent;
- (void)referenceSizeDidChange;
- (void)update;
@end

@implementation PXGPPTRowItemLayout

- (void).cxx_destruct
{
}

- (UIColor)color
{
  return self->_color;
}

- (id)colorAtIndex:(unsigned int)a3 inLayout:(id)a4
{
  return self->_color;
}

- (void)_updateContent
{
  [(PXGLayout *)self referenceSize];
  double v4 = v3;
  [(PXGLayout *)self setContentSize:v3];
  uint64_t v5 = [(PXGLayout *)self localNumberOfSprites];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __37__PXGPPTRowItemLayout__updateContent__block_invoke;
  v6[3] = &unk_1E5DD20F0;
  *(double *)&v6[5] = v4;
  *(double *)&v6[6] = v4;
  v6[4] = self;
  [(PXGLayout *)self modifySpritesInRange:v5 << 32 state:v6];
}

void __37__PXGPPTRowItemLayout__updateContent__block_invoke()
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
      v6 = [NSString stringWithUTF8String:"-[PXGPPTRowItemLayout _invalidateContent]"];
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, @"PXGPPTRowStackLayout.m", 144, @"invalidating %lu after it already has been updated", 1);

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
      uint64_t v5 = [MEMORY[0x1E4F28B00] currentHandler];
      v6 = [NSString stringWithUTF8String:"-[PXGPPTRowItemLayout update]"];
      [v5 handleFailureInFunction:v6, @"PXGPPTRowStackLayout.m", 135, @"Invalid parameter not satisfying: %@", @"!_updateFlags.isPerformingUpdate" file lineNumber description];

      unint64_t needsUpdate = p_updateFlags->needsUpdate;
    }
    p_updateFlags->isPerformingUpdate = 1;
    p_updateFlags->updated = 1;
    if (needsUpdate)
    {
      p_updateFlags->unint64_t needsUpdate = needsUpdate & 0xFFFFFFFFFFFFFFFELL;
      [(PXGPPTRowItemLayout *)self _updateContent];
      unint64_t needsUpdate = p_updateFlags->needsUpdate;
    }
    p_updateFlags->isPerformingUpdate = 0;
    if (needsUpdate)
    {
      v7 = [MEMORY[0x1E4F28B00] currentHandler];
      v8 = [NSString stringWithUTF8String:"-[PXGPPTRowItemLayout update]"];
      objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, @"PXGPPTRowStackLayout.m", 139, @"still needing to update %lu after update pass", p_updateFlags->needsUpdate);
    }
  }
  v9.receiver = self;
  v9.super_class = (Class)PXGPPTRowItemLayout;
  [(PXGLayout *)&v9 update];
}

- (void)referenceSizeDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)PXGPPTRowItemLayout;
  [(PXGLayout *)&v3 referenceSizeDidChange];
  [(PXGPPTRowItemLayout *)self _invalidateContent];
}

- (PXGPPTRowItemLayout)initWithColor:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PXGPPTRowItemLayout;
  v6 = [(PXGLayout *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_color, a3);
    v7->_colorSpriteIndex = [(PXGLayout *)v7 addSpriteCount:1 withInitialState:0];
    [(PXGLayout *)v7 setContentSource:v7];
  }

  return v7;
}

- (PXGPPTRowItemLayout)init
{
  objc_super v3 = [MEMORY[0x1E4FB1618] clearColor];
  double v4 = [(PXGPPTRowItemLayout *)self initWithColor:v3];

  return v4;
}

@end
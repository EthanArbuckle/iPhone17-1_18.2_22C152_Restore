@interface PXGSingleViewLayout
- ($6FCFBD36564ECBB6D9D1614A84D6F83D)cornerRadius;
- (Class)contentViewClass;
- (Class)viewClassForSpriteAtIndex:(unsigned int)a3 inLayout:(id)a4;
- (PXGSingleViewLayout)init;
- (PXGSingleViewLayoutDelegate)delegate;
- (PXGSpriteReference)viewSpriteReference;
- (UIEdgeInsets)padding;
- (UIView)contentView;
- (float)zPosition;
- (id)axSpriteIndexes;
- (id)axSpriteIndexesInRect:(CGRect)a3;
- (id)hitTestResultForSpriteIndex:(unsigned int)a3;
- (id)viewUserDataForSpriteAtIndex:(unsigned int)a3 inLayout:(id)a4;
- (int64_t)style;
- (unsigned)viewSpriteIndex;
- (void)_invalidateContent;
- (void)_invalidateMediaVersion;
- (void)_updateContent;
- (void)alphaDidChange;
- (void)appearStateDidChange;
- (void)dealloc;
- (void)didUpdate;
- (void)displayScaleDidChange;
- (void)referenceSizeDidChange;
- (void)setContentView:(id)a3;
- (void)setContentViewClass:(Class)a3;
- (void)setCornerRadius:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setPadding:(UIEdgeInsets)a3;
- (void)setStyle:(int64_t)a3;
- (void)setZPosition:(float)a3;
- (void)update;
- (void)willUpdate;
@end

@implementation PXGSingleViewLayout

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_contentViewClass, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_axSpriteIndexes, 0);
}

- ($6FCFBD36564ECBB6D9D1614A84D6F83D)cornerRadius
{
  *(void *)&result.var0.var1[2] = a2;
  *(void *)&result.var0.var0.var0 = self;
  return result;
}

- (float)zPosition
{
  return self->_zPosition;
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

- (int64_t)style
{
  return self->_style;
}

- (void)setDelegate:(id)a3
{
}

- (PXGSingleViewLayoutDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PXGSingleViewLayoutDelegate *)WeakRetained;
}

- (Class)contentViewClass
{
  return self->_contentViewClass;
}

- (UIView)contentView
{
  return self->_contentView;
}

- (id)axSpriteIndexesInRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  CGFloat v8 = *MEMORY[0x1E4F1DAD8];
  CGFloat v9 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  [(PXGLayout *)self contentSize];
  v15.size.CGFloat width = v10;
  v15.size.CGFloat height = v11;
  v15.origin.CGFloat x = v8;
  v15.origin.CGFloat y = v9;
  v16.origin.CGFloat x = x;
  v16.origin.CGFloat y = y;
  v16.size.CGFloat width = width;
  v16.size.CGFloat height = height;
  if (CGRectIntersectsRect(v15, v16)) {
    v12 = self->_axSpriteIndexes;
  }
  else {
    v12 = (NSIndexSet *)objc_alloc_init(MEMORY[0x1E4F28D60]);
  }
  return v12;
}

- (id)axSpriteIndexes
{
  return self->_axSpriteIndexes;
}

- (id)viewUserDataForSpriteAtIndex:(unsigned int)a3 inLayout:(id)a4
{
  if ([(PXGSingleViewLayout *)self contentViewClass])
  {
    v5 = [(PXGSingleViewLayout *)self delegate];
    char v6 = objc_opt_respondsToSelector();

    if (v6)
    {
      v7 = [(PXGSingleViewLayout *)self delegate];
      CGFloat v8 = [v7 configurationForSingleViewLayout:self];
    }
    else
    {
      CGFloat v8 = 0;
    }
    [(PXGSingleViewUserData *)v8 setWeakLayout:self];
  }
  else
  {
    CGFloat v9 = [PXGSingleViewUserData alloc];
    CGFloat v10 = [(PXGSingleViewLayout *)self contentView];
    CGFloat v8 = [(PXGSingleViewUserData *)v9 initWithContentView:v10];
  }
  return v8;
}

- (Class)viewClassForSpriteAtIndex:(unsigned int)a3 inLayout:(id)a4
{
  v4 = [(PXGSingleViewLayout *)self contentViewClass];
  if (!v4) {
    v4 = (objc_class *)objc_opt_class();
  }
  return v4;
}

- (void)_updateContent
{
  uint64_t v4 = [(PXGSingleViewLayout *)self contentView];
  if (v4)
  {
    v5 = (void *)v4;
    char v6 = [(PXGSingleViewLayout *)self contentViewClass];

    if (v6)
    {
      v7 = [MEMORY[0x1E4F28B00] currentHandler];
      [v7 handleFailureInMethod:a2 object:self file:@"PXGSingleViewLayout.m" lineNumber:193 description:@"Content may be specified via contentView or contentViewClass but not both"];
    }
  }
  if ([(PXGLayout *)self localNumberOfSprites] != 1) {
    [(PXGLayout *)self applySpriteChangeDetails:0 countAfterChanges:1 initialState:0 modifyState:0];
  }
  [(PXGSingleViewLayout *)self padding];
  [(PXGLayout *)self referenceSize];
  PXEdgeInsetsInsetSize();
}

uint64_t __37__PXGSingleViewLayout__updateContent__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _WORD *a5)
{
  float v9 = *(float *)(a1 + 72);
  CGFloat v10 = *(double *)(a1 + 40);
  CGFloat v11 = *(double *)(a1 + 48);
  CGFloat v12 = *(double *)(a1 + 56);
  CGFloat v13 = *(double *)(a1 + 64);
  v30.origin.CGFloat x = v10;
  v30.origin.CGFloat y = v11;
  v30.size.CGFloat width = v12;
  v30.size.CGFloat height = v13;
  CGFloat MidX = CGRectGetMidX(v30);
  v31.origin.CGFloat x = v10;
  v31.origin.CGFloat y = v11;
  v31.size.CGFloat width = v12;
  v31.size.CGFloat height = v13;
  CGFloat MidY = CGRectGetMidY(v31);
  v32.origin.CGFloat x = v10;
  v32.origin.CGFloat y = v11;
  v32.size.CGFloat width = v12;
  v32.size.CGFloat height = v13;
  CGFloat Width = CGRectGetWidth(v32);
  v33.origin.CGFloat x = v10;
  v33.origin.CGFloat y = v11;
  v33.size.CGFloat width = v12;
  v33.size.CGFloat height = v13;
  CGFloat Height = CGRectGetHeight(v33);
  v17.f64[0] = Width;
  v17.f64[1] = Height;
  *(CGFloat *)a3 = MidX;
  *(CGFloat *)(a3 + 8) = MidY;
  *(double *)(a3 + 16) = v9;
  *(float32x2_t *)(a3 + 24) = vcvt_f32_f64(v17);
  long long v18 = *((_OWORD *)off_1E5DAAF90 + 1);
  *(_OWORD *)a4 = *(_OWORD *)off_1E5DAAF90;
  *(_OWORD *)(a4 + 16) = v18;
  long long v19 = *((_OWORD *)off_1E5DAAF90 + 5);
  *(_OWORD *)(a4 + 64) = *((_OWORD *)off_1E5DAAF90 + 4);
  *(_OWORD *)(a4 + 80) = v19;
  long long v20 = *((_OWORD *)off_1E5DAAF90 + 3);
  *(_OWORD *)(a4 + 32) = *((_OWORD *)off_1E5DAAF90 + 2);
  *(_OWORD *)(a4 + 48) = v20;
  long long v21 = *((_OWORD *)off_1E5DAAF90 + 9);
  *(_OWORD *)(a4 + 128) = *((_OWORD *)off_1E5DAAF90 + 8);
  *(_OWORD *)(a4 + 144) = v21;
  long long v22 = *((_OWORD *)off_1E5DAAF90 + 7);
  *(_OWORD *)(a4 + 96) = *((_OWORD *)off_1E5DAAF90 + 6);
  *(_OWORD *)(a4 + 112) = v22;
  [*(id *)(a1 + 32) alpha];
  *(float *)&double v23 = v23;
  *(_DWORD *)a4 = LODWORD(v23);
  uint64_t result = [*(id *)(a1 + 32) cornerRadius];
  *(_DWORD *)(a4 + 36) = v25;
  *(_DWORD *)(a4 + 40) = v26;
  *(_DWORD *)(a4 + 44) = v27;
  *(_DWORD *)(a4 + 48) = v28;
  *a5 = 2561;
  a5[16] = *(_WORD *)(*(void *)(a1 + 32) + 872);
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
      v5 = [MEMORY[0x1E4F28B00] currentHandler];
      char v6 = [NSString stringWithUTF8String:"-[PXGSingleViewLayout _invalidateContent]"];
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, @"PXGSingleViewLayout.m", 189, @"invalidating %lu after it already has been updated", 1);

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
  v5.super_class = (Class)PXGSingleViewLayout;
  [(PXGLayout *)&v5 didUpdate];
  if (self->_updateFlags.willPerformUpdate)
  {
    v3 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v4 = [NSString stringWithUTF8String:"-[PXGSingleViewLayout didUpdate]"];
    [v3 handleFailureInFunction:v4, @"PXGSingleViewLayout.m", 185, @"Invalid parameter not satisfying: %@", @"!_updateFlags.willPerformUpdate" file lineNumber description];
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
      char v6 = [NSString stringWithUTF8String:"-[PXGSingleViewLayout update]"];
      [v5 handleFailureInFunction:v6, @"PXGSingleViewLayout.m", 175, @"Invalid parameter not satisfying: %@", @"!_updateFlags.isPerformingUpdate" file lineNumber description];

      unint64_t needsUpdate = p_updateFlags->needsUpdate;
    }
    p_updateFlags->isPerformingUpdate = 1;
    p_updateFlags->updated = 1;
    if (needsUpdate)
    {
      p_updateFlags->unint64_t needsUpdate = needsUpdate & 0xFFFFFFFFFFFFFFFELL;
      [(PXGSingleViewLayout *)self _updateContent];
      unint64_t needsUpdate = p_updateFlags->needsUpdate;
    }
    p_updateFlags->isPerformingUpdate = 0;
    if (needsUpdate)
    {
      v7 = [MEMORY[0x1E4F28B00] currentHandler];
      CGFloat v8 = [NSString stringWithUTF8String:"-[PXGSingleViewLayout update]"];
      objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, @"PXGSingleViewLayout.m", 179, @"still needing to update %lu after update pass", p_updateFlags->needsUpdate);
    }
  }
  v9.receiver = self;
  v9.super_class = (Class)PXGSingleViewLayout;
  [(PXGLayout *)&v9 update];
}

- (void)willUpdate
{
  v5.receiver = self;
  v5.super_class = (Class)PXGSingleViewLayout;
  [(PXGLayout *)&v5 willUpdate];
  self->_updateFlags.BOOL willPerformUpdate = 1;
  if (self->_updateFlags.isPerformingUpdate)
  {
    v3 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v4 = [NSString stringWithUTF8String:"-[PXGSingleViewLayout willUpdate]"];
    [v3 handleFailureInFunction:v4, @"PXGSingleViewLayout.m", 171, @"Invalid parameter not satisfying: %@", @"!_updateFlags.isPerformingUpdate" file lineNumber description];
  }
}

- (id)hitTestResultForSpriteIndex:(unsigned int)a3
{
  if (a3)
  {
    CGFloat v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2 object:self file:@"PXGSingleViewLayout.m" lineNumber:161 description:@"Code which should be unreachable has been reached"];

    abort();
  }
  uint64_t v4 = -[PXGLayout spriteReferenceForSpriteIndex:](self, "spriteReferenceForSpriteIndex:");
  objc_super v5 = [(PXGSingleViewLayout *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) == 0
    || ([(PXGSingleViewLayout *)self delegate],
        v7 = objc_claimAutoreleasedReturnValue(),
        [v7 singleViewLayout:self hitTestResultForSpriteReference:v4],
        CGFloat v8 = (PXGHitTestResult *)objc_claimAutoreleasedReturnValue(),
        v7,
        !v8))
  {
    CGFloat v8 = [[PXGHitTestResult alloc] initWithSpriteReference:v4 layout:self identifier:@"PXGHitTestResultGenericSingleView" userData:0];
  }

  return v8;
}

- (void)_invalidateMediaVersion
{
}

- (unsigned)viewSpriteIndex
{
  return 0;
}

- (PXGSpriteReference)viewSpriteReference
{
  uint64_t v3 = [(PXGSingleViewLayout *)self viewSpriteIndex];
  return (PXGSpriteReference *)[(PXGLayout *)self spriteReferenceForSpriteIndex:v3];
}

- (void)setCornerRadius:(id)a3
{
  if (self->_cornerRadius.var0.var0.topLeft != v3
    || self->_cornerRadius.var0.var0.topRight != v4
    || self->_cornerRadius.var0.var0.bottomLeft != v5
    || self->_cornerRadius.var0.var0.bottomRight != v6)
  {
    self->_cornerRadius.var0.var0.topLeft = v3;
    self->_cornerRadius.var0.var0.topRight = v4;
    self->_cornerRadius.var0.var0.bottomLeft = v5;
    self->_cornerRadius.var0.var0.bottomRight = v6;
    [(PXGSingleViewLayout *)self _invalidateContent];
  }
}

- (void)setZPosition:(float)a3
{
  if (self->_zPosition != a3)
  {
    self->_zPosition = a3;
    [(PXGSingleViewLayout *)self _invalidateContent];
  }
}

- (void)setPadding:(UIEdgeInsets)a3
{
}

- (void)setStyle:(int64_t)a3
{
  if (self->_style != a3)
  {
    self->_style = a3;
    [(PXGSingleViewLayout *)self _invalidateContent];
  }
}

- (void)setContentViewClass:(Class)a3
{
  p_contentViewClass = &self->_contentViewClass;
  if (*p_contentViewClass != a3)
  {
    objc_storeStrong((id *)p_contentViewClass, a3);
    [(PXGSingleViewLayout *)self _invalidateMediaVersion];
  }
}

- (void)setContentView:(id)a3
{
  float v5 = (UIView *)a3;
  contentView = self->_contentView;
  if (contentView != v5)
  {
    object = v5;
    if (contentView) {
      objc_setAssociatedObject(contentView, (const void *)PXGSingleViewLayoutAssociationKey, 0, 0);
    }
    objc_storeStrong((id *)&self->_contentView, a3);
    if (object) {
      objc_setAssociatedObject(object, (const void *)PXGSingleViewLayoutAssociationKey, self, 0);
    }
    [(PXGSingleViewLayout *)self _invalidateMediaVersion];
    float v5 = object;
  }
}

- (void)alphaDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)PXGSingleViewLayout;
  [(PXGLayout *)&v3 alphaDidChange];
  [(PXGSingleViewLayout *)self _invalidateContent];
}

- (void)displayScaleDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)PXGSingleViewLayout;
  [(PXGLayout *)&v3 displayScaleDidChange];
  [(PXGSingleViewLayout *)self _invalidateContent];
}

- (void)referenceSizeDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)PXGSingleViewLayout;
  [(PXGLayout *)&v3 referenceSizeDidChange];
  [(PXGSingleViewLayout *)self _invalidateContent];
}

- (void)appearStateDidChange
{
  v6.receiver = self;
  v6.super_class = (Class)PXGSingleViewLayout;
  [(PXGLayout *)&v6 appearStateDidChange];
  objc_super v3 = [(PXGSingleViewLayout *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    float v5 = [(PXGSingleViewLayout *)self delegate];
    [v5 appearStateDidChangeForSingleViewLayout:self];
  }
}

- (void)dealloc
{
  contentView = self->_contentView;
  if (contentView) {
    objc_setAssociatedObject(contentView, (const void *)PXGSingleViewLayoutAssociationKey, 0, 0);
  }
  v4.receiver = self;
  v4.super_class = (Class)PXGSingleViewLayout;
  [(PXGLayout *)&v4 dealloc];
}

- (PXGSingleViewLayout)init
{
  v7.receiver = self;
  v7.super_class = (Class)PXGSingleViewLayout;
  v2 = [(PXGLayout *)&v7 init];
  objc_super v3 = v2;
  if (v2)
  {
    [(PXGLayout *)v2 setContentSource:v2];
    uint64_t v4 = [objc_alloc(MEMORY[0x1E4F28D60]) initWithIndex:0];
    axSpriteIndexes = v3->_axSpriteIndexes;
    v3->_axSpriteIndexes = (NSIndexSet *)v4;

    v3->_cornerRadius = *($E57FD295544FE3DD2B3C272D7C23EB59 *)off_1E5DAAF50;
  }
  return v3;
}

@end
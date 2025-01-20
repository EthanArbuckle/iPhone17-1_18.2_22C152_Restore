@interface PXGSublayoutComposition
- ($3E2DF284A90EA61521E3C11DCA85D21B)sublayoutGeometries;
- (CGRect)contentBounds;
- (CGRect)visibleRect;
- (CGSize)referenceSize;
- (PXGCompositeLayout)compositeLayout;
- (PXGLayout)layout;
- (PXGSublayoutDataStore)sublayoutDataStore;
- (UIEdgeInsets)sublayoutInsetsForStylableType:(int64_t)a3;
- (int64_t)anchorSublayoutIndexForAnchoredContentEdges:(unint64_t)a3;
- (int64_t)lastSublayoutDataStoreVersion;
- (int64_t)numberOfSublayouts;
- (void)enumerateSublayoutProvidersForRange:(_NSRange)a3 usingBlock:(id)a4;
- (void)invalidateEstimatedSublayoutGeometries;
- (void)invalidateSublayoutAttributes;
- (void)invalidateSublayoutContentSizes;
- (void)setCompositeLayout:(id)a3;
- (void)setLastSublayoutDataStoreVersion:(int64_t)a3;
- (void)setReferenceSize:(CGSize)a3;
- (void)setSublayoutDataStore:(id)a3;
- (void)setVisibleRect:(CGRect)a3;
- (void)updateEstimate;
- (void)updateEstimatedSublayoutGeometries;
- (void)updateSublayoutGeometriesFromAnchorSublayoutIndex:(int64_t)a3 usingSublayoutUpdateBlock:(id)a4;
@end

@implementation PXGSublayoutComposition

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sublayoutDataStore, 0);
  objc_destroyWeak((id *)&self->_compositeLayout);
}

- (CGSize)referenceSize
{
  double width = self->_referenceSize.width;
  double height = self->_referenceSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (CGRect)visibleRect
{
  double x = self->_visibleRect.origin.x;
  double y = self->_visibleRect.origin.y;
  double width = self->_visibleRect.size.width;
  double height = self->_visibleRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setSublayoutDataStore:(id)a3
{
}

- (PXGSublayoutDataStore)sublayoutDataStore
{
  return self->_sublayoutDataStore;
}

- (void)setCompositeLayout:(id)a3
{
}

- (PXGCompositeLayout)compositeLayout
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_compositeLayout);
  return (PXGCompositeLayout *)WeakRetained;
}

- (int64_t)lastSublayoutDataStoreVersion
{
  return self->_lastSublayoutDataStoreVersion;
}

- (CGRect)contentBounds
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  v5 = (objc_class *)objc_opt_class();
  v6 = NSStringFromClass(v5);
  [v4 handleFailureInMethod:a2, self, @"PXGSublayoutComposition.m", 168, @"Method %s is a responsibility of subclass %@", "-[PXGSublayoutComposition contentBounds]", v6 object file lineNumber description];

  abort();
}

- (void)updateSublayoutGeometriesFromAnchorSublayoutIndex:(int64_t)a3 usingSublayoutUpdateBlock:(id)a4
{
  id v6 = a4;
  v7 = [MEMORY[0x1E4F28B00] currentHandler];
  v8 = (objc_class *)objc_opt_class();
  v9 = NSStringFromClass(v8);
  [v7 handleFailureInMethod:a2, self, @"PXGSublayoutComposition.m", 164, @"Method %s is a responsibility of subclass %@", "-[PXGSublayoutComposition updateSublayoutGeometriesFromAnchorSublayoutIndex:usingSublayoutUpdateBlock:]", v9 object file lineNumber description];

  abort();
}

- (int64_t)anchorSublayoutIndexForAnchoredContentEdges:(unint64_t)a3
{
  if ((a3 & 3) != 0) {
    return 0;
  }
  if ((a3 & 0xC) != 0) {
    return [(PXGSublayoutComposition *)self numberOfSublayouts] - 1;
  }
  return 0x7FFFFFFFFFFFFFFFLL;
}

- (void)updateEstimatedSublayoutGeometries
{
  uint64_t v4 = [MEMORY[0x1E4F28B00] currentHandler];
  v5 = (objc_class *)objc_opt_class();
  id v6 = NSStringFromClass(v5);
  [v4 handleFailureInMethod:a2, self, @"PXGSublayoutComposition.m", 148, @"Method %s is a responsibility of subclass %@", "-[PXGSublayoutComposition updateEstimatedSublayoutGeometries]", v6 object file lineNumber description];

  abort();
}

- (void)invalidateEstimatedSublayoutGeometries
{
  if (self->_updateFlags.isPerformingUpdate && (self->_updateFlags.updated & 2) != 0)
  {
    v2 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v3 = [NSString stringWithUTF8String:"-[PXGSublayoutComposition invalidateEstimatedSublayoutGeometries]"];
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"PXGSublayoutComposition.m", 143, @"invalidating %lu after it already has been updated", 2);

    abort();
  }
  self->_updateFlags.needsUpdate |= 2uLL;
  id v4 = [(PXGSublayoutComposition *)self compositeLayout];
  [v4 compositionDidChange];
}

- (void)invalidateSublayoutContentSizes
{
  uint64_t v3 = [(PXGSublayoutComposition *)self numberOfSublayouts];
  id v4 = self;
  uint64_t v5 = [(PXGSublayoutComposition *)v4 sublayoutGeometries];
  if (v3 >= 1)
  {
    id v6 = (_OWORD *)(v5 + 32);
    long long v7 = *(_OWORD *)off_1E5DAB030;
    do
    {
      _OWORD *v6 = v7;
      id v6 = (_OWORD *)((char *)v6 + 136);
      --v3;
    }
    while (v3);
  }
  [(PXGSublayoutComposition *)v4 invalidateEstimatedSublayoutGeometries];
}

- (void)invalidateSublayoutAttributes
{
  if (self->_updateFlags.isPerformingUpdate && (self->_updateFlags.updated & 1) != 0)
  {
    v2 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v3 = [NSString stringWithUTF8String:"-[PXGSublayoutComposition invalidateSublayoutAttributes]"];
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"PXGSublayoutComposition.m", 126, @"invalidating %lu after it already has been updated", 1);

    abort();
  }
  self->_updateFlags.needsUpdate |= 1uLL;
}

- (void)updateEstimate
{
  uint64_t v3 = [(PXGSublayoutComposition *)self sublayoutDataStore];
  -[PXGSublayoutComposition setLastSublayoutDataStoreVersion:](self, "setLastSublayoutDataStoreVersion:", [v3 version]);

  self->_updateFlags.willPerformUpdate = 0;
  unint64_t needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (self->_updateFlags.isPerformingUpdate)
    {
      id v6 = [MEMORY[0x1E4F28B00] currentHandler];
      long long v7 = [NSString stringWithUTF8String:"-[PXGSublayoutComposition updateEstimate]"];
      [v6 handleFailureInFunction:v7, @"PXGSublayoutComposition.m", 115, @"Invalid parameter not satisfying: %@", @"!_updateFlags.isPerformingUpdate" file lineNumber description];

      unint64_t needsUpdate = self->_updateFlags.needsUpdate;
    }
    self->_updateFlags.isPerformingUpdate = 1;
    self->_updateFlags.updated = 1;
    if (needsUpdate)
    {
      self->_updateFlags.unint64_t needsUpdate = needsUpdate & 0xFFFFFFFFFFFFFFFELL;
      [(PXGSublayoutComposition *)self updateSublayoutAttributes];
      if (!self->_updateFlags.isPerformingUpdate)
      {
        v9 = [MEMORY[0x1E4F28B00] currentHandler];
        v10 = [NSString stringWithUTF8String:"-[PXGSublayoutComposition updateEstimate]"];
        [v9 handleFailureInFunction:v10, @"PXGSublayoutComposition.m", 119, @"Invalid parameter not satisfying: %@", @"_updateFlags.isPerformingUpdate" file lineNumber description];
      }
    }
    unint64_t v5 = self->_updateFlags.needsUpdate;
    self->_updateFlags.updated |= 2uLL;
    if ((v5 & 2) != 0)
    {
      self->_updateFlags.unint64_t needsUpdate = v5 & 0xFFFFFFFFFFFFFFFDLL;
      [(PXGSublayoutComposition *)self updateEstimatedSublayoutGeometries];
      unint64_t v5 = self->_updateFlags.needsUpdate;
    }
    self->_updateFlags.isPerformingUpdate = 0;
    if (v5)
    {
      id v11 = [MEMORY[0x1E4F28B00] currentHandler];
      v8 = [NSString stringWithUTF8String:"-[PXGSublayoutComposition updateEstimate]"];
      objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", v8, @"PXGSublayoutComposition.m", 122, @"still needing to update %lu after update pass", self->_updateFlags.needsUpdate);
    }
  }
}

- (void)enumerateSublayoutProvidersForRange:(_NSRange)a3 usingBlock:(id)a4
{
  NSUInteger length = a3.length;
  int64_t location = a3.location;
  id v8 = a4;
  int64_t v9 = location + length;
  v10 = [(PXGSublayoutComposition *)self sublayoutDataStore];
  uint64_t v11 = [v10 count];

  if ((uint64_t)(location + length) > v11)
  {
    v20 = [MEMORY[0x1E4F28B00] currentHandler];
    [v20 handleFailureInMethod:a2, self, @"PXGSublayoutComposition.m", 83, @"Invalid parameter not satisfying: %@", @"rangeMax <= self.sublayoutDataStore.count" object file lineNumber description];
  }
  uint64_t v30 = 0;
  v31 = &v30;
  uint64_t v32 = 0x2020000000;
  uint64_t v33 = 0x7FFFFFFFFFFFFFFFLL;
  uint64_t v26 = 0;
  v27 = &v26;
  uint64_t v28 = 0x2020000000;
  uint64_t v29 = 0;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __74__PXGSublayoutComposition_enumerateSublayoutProvidersForRange_usingBlock___block_invoke;
  aBlock[3] = &unk_1E5DC97D0;
  v23 = &v26;
  v24 = &v30;
  aBlock[4] = self;
  SEL v25 = a2;
  id v12 = v8;
  id v22 = v12;
  v13 = (void (**)(void *, int64_t))_Block_copy(aBlock);
  id v14 = [(PXGSublayoutComposition *)self sublayoutDataStore];
  uint64_t v15 = [v14 infos];

  if (location < v9)
  {
    v16 = v31;
    v17 = v27;
    v18 = (uint64_t *)(v15 + 16 * location + 8);
    while (1)
    {
      uint64_t v19 = *v18;
      if (v16[3] == 0x7FFFFFFFFFFFFFFFLL) {
        goto LABEL_8;
      }
      if (v19 != v17[3]) {
        break;
      }
LABEL_9:
      ++location;
      v18 += 2;
      if (!--length) {
        goto LABEL_10;
      }
    }
    v13[2](v13, location);
    v16 = v31;
    v17 = v27;
LABEL_8:
    v16[3] = location;
    v17[3] = v19;
    goto LABEL_9;
  }
LABEL_10:
  v13[2](v13, v9);

  _Block_object_dispose(&v26, 8);
  _Block_object_dispose(&v30, 8);
}

void __74__PXGSublayoutComposition_enumerateSublayoutProvidersForRange_usingBlock___block_invoke(void *a1)
{
  id v2 = *(id *)(*(void *)(a1[6] + 8) + 24);
  if (!v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F28B00] currentHandler];
    [v3 handleFailureInMethod:a1[8] object:a1[4] file:@"PXGSublayoutComposition.m" lineNumber:90 description:@"sublayout composition currently only works with sublayout providers"];
  }
  (*(void (**)(void))(a1[5] + 16))();
}

- (UIEdgeInsets)sublayoutInsetsForStylableType:(int64_t)a3
{
  double v3 = *(double *)off_1E5DAAF10;
  double v4 = *((double *)off_1E5DAAF10 + 1);
  double v5 = *((double *)off_1E5DAAF10 + 2);
  double v6 = *((double *)off_1E5DAAF10 + 3);
  result.right = v6;
  result.bottom = v5;
  result.left = v4;
  result.top = v3;
  return result;
}

- ($3E2DF284A90EA61521E3C11DCA85D21B)sublayoutGeometries
{
  id v2 = [(PXGSublayoutComposition *)self sublayoutDataStore];
  double v3 = ($3E2DF284A90EA61521E3C11DCA85D21B *)[v2 geometries];

  return v3;
}

- (int64_t)numberOfSublayouts
{
  id v2 = [(PXGSublayoutComposition *)self sublayoutDataStore];
  int64_t v3 = [v2 count];

  return v3;
}

- (void)setLastSublayoutDataStoreVersion:(int64_t)a3
{
  if (self->_lastSublayoutDataStoreVersion != a3)
  {
    self->_lastSublayoutDataStoreVersion = a3;
    [(PXGSublayoutComposition *)self invalidateSublayoutAttributes];
    [(PXGSublayoutComposition *)self invalidateEstimatedSublayoutGeometries];
  }
}

- (void)setVisibleRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  if (!CGRectEqualToRect(a3, self->_visibleRect))
  {
    self->_visibleRect.origin.CGFloat x = x;
    self->_visibleRect.origin.CGFloat y = y;
    self->_visibleRect.size.CGFloat width = width;
    self->_visibleRect.size.CGFloat height = height;
    [(PXGSublayoutComposition *)self visibleRectDidChange];
  }
}

- (void)setReferenceSize:(CGSize)a3
{
  if (a3.width != self->_referenceSize.width || a3.height != self->_referenceSize.height)
  {
    self->_referenceSize = a3;
    [(PXGSublayoutComposition *)self referenceSizeDidChange];
  }
}

- (PXGLayout)layout
{
  double v4 = [(PXGSublayoutComposition *)self compositeLayout];
  if (!v4)
  {
    double v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2, self, @"PXGSublayoutComposition.m", 31, @"missing layout on %@", self object file lineNumber description];
  }
  return (PXGLayout *)v4;
}

@end
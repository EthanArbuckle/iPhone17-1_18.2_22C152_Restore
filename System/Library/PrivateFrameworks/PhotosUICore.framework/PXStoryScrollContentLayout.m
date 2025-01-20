@interface PXStoryScrollContentLayout
- (CGPoint)_scrollOffsetForVisibleRectOrigin:(CGPoint)a3;
- (CGPoint)_scrollOffsetFromVisibleRect;
- (CGPoint)_visibleRectOriginForScrollOffset:(CGPoint)a3;
- (CGPoint)scrollOffset;
- (PXStoryScrollContentLayout)init;
- (PXStoryScrollContentLayoutDelegate)delegate;
- (UIEdgeInsets)scrollableOutsets;
- (void)_invalidateContentSize;
- (void)_setScrollOffset:(CGPoint)a3 updateScrollPosition:(BOOL)a4;
- (void)_updateContentSize;
- (void)referenceSizeDidChange;
- (void)setDelegate:(id)a3;
- (void)setScrollOffset:(CGPoint)a3;
- (void)setScrollableOutsets:(UIEdgeInsets)a3;
- (void)update;
- (void)visibleRectDidChange;
@end

@implementation PXStoryScrollContentLayout

- (void).cxx_destruct
{
}

- (PXStoryScrollContentLayoutDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PXStoryScrollContentLayoutDelegate *)WeakRetained;
}

- (CGPoint)scrollOffset
{
  double x = self->_scrollOffset.x;
  double y = self->_scrollOffset.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (UIEdgeInsets)scrollableOutsets
{
  double top = self->_scrollableOutsets.top;
  double left = self->_scrollableOutsets.left;
  double bottom = self->_scrollableOutsets.bottom;
  double right = self->_scrollableOutsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)_updateContentSize
{
  [(PXGLayout *)self referenceSize];
  double v4 = v3;
  double v6 = v5;
  [(PXStoryScrollContentLayout *)self scrollableOutsets];
  double v11 = v4 + v9 + v10;
  -[PXGLayout setContentSize:](self, "setContentSize:", v11, v6 + v7 + v8);
}

- (void)_invalidateContentSize
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
      double v5 = [MEMORY[0x1E4F28B00] currentHandler];
      double v6 = [NSString stringWithUTF8String:"-[PXStoryScrollContentLayout _invalidateContentSize]"];
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, @"PXStoryScrollContentLayout.m", 128, @"invalidating %lu after it already has been updated", 1);

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
      double v5 = [MEMORY[0x1E4F28B00] currentHandler];
      double v6 = [NSString stringWithUTF8String:"-[PXStoryScrollContentLayout update]"];
      [v5 handleFailureInFunction:v6, @"PXStoryScrollContentLayout.m", 119, @"Invalid parameter not satisfying: %@", @"!_updateFlags.isPerformingUpdate" file lineNumber description];

      unint64_t needsUpdate = p_updateFlags->needsUpdate;
    }
    p_updateFlags->isPerformingUpdate = 1;
    p_updateFlags->updated = 1;
    if (needsUpdate)
    {
      p_updateFlags->unint64_t needsUpdate = needsUpdate & 0xFFFFFFFFFFFFFFFELL;
      [(PXStoryScrollContentLayout *)self _updateContentSize];
      unint64_t needsUpdate = p_updateFlags->needsUpdate;
    }
    p_updateFlags->isPerformingUpdate = 0;
    if (needsUpdate)
    {
      double v7 = [MEMORY[0x1E4F28B00] currentHandler];
      double v8 = [NSString stringWithUTF8String:"-[PXStoryScrollContentLayout update]"];
      objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, @"PXStoryScrollContentLayout.m", 123, @"still needing to update %lu after update pass", p_updateFlags->needsUpdate);
    }
  }
  v9.receiver = self;
  v9.super_class = (Class)PXStoryScrollContentLayout;
  [(PXGLayout *)&v9 update];
}

- (CGPoint)_scrollOffsetForVisibleRectOrigin:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  [(PXStoryScrollContentLayout *)self scrollableOutsets];
  double v6 = x - v5;
  double v7 = y - v5;
  result.double y = v7;
  result.double x = v6;
  return result;
}

- (CGPoint)_visibleRectOriginForScrollOffset:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  [(PXStoryScrollContentLayout *)self scrollableOutsets];
  double v6 = x + v5;
  double v7 = y + v5;
  result.double y = v7;
  result.double x = v6;
  return result;
}

- (void)_setScrollOffset:(CGPoint)a3 updateScrollPosition:(BOOL)a4
{
  BOOL v4 = a4;
  double y = a3.y;
  double x = a3.x;
  if (a3.x != self->_scrollOffset.x || a3.y != self->_scrollOffset.y)
  {
    self->_scrollOffset = a3;
    if (self->_delegateRespondsTo.scrollOffsetDidChange)
    {
      objc_super v9 = [(PXStoryScrollContentLayout *)self delegate];
      [v9 scrollContentLayoutScrollOffsetDidChange:self];
    }
  }
  if (v4)
  {
    [(PXStoryScrollContentLayout *)self _scrollOffsetFromVisibleRect];
    if (x != v11 || y != v10)
    {
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __68__PXStoryScrollContentLayout__setScrollOffset_updateScrollPosition___block_invoke;
      v22[3] = &unk_1E5DB9010;
      v22[4] = self;
      *(double *)&v22[5] = x;
      *(double *)&v22[6] = y;
      [(PXGLayout *)self modifySpritesInRange:0x100000000 fullState:v22];
      [(PXStoryScrollContentLayout *)self scrollableOutsets];
      BOOL v17 = v16 <= 0.0 && v14 <= 0.0;
      uint64_t v18 = 8;
      if (v17) {
        uint64_t v18 = 0;
      }
      BOOL v19 = v15 > 0.0 || v13 > 0.0;
      v20 = -[PXGLayout createAnchorForScrollingSpriteAtIndex:toScrollPosition:padding:](self, "createAnchorForScrollingSpriteAtIndex:toScrollPosition:padding:", 0, v18 | v19, *(double *)off_1E5DAAF10, *((double *)off_1E5DAAF10 + 1), *((double *)off_1E5DAAF10 + 2), *((double *)off_1E5DAAF10 + 3));
      id v21 = (id)[v20 autoInvalidate];
    }
  }
}

void __68__PXStoryScrollContentLayout__setScrollOffset_updateScrollPosition___block_invoke(uint64_t a1)
{
}

- (void)setScrollOffset:(CGPoint)a3
{
}

- (void)setScrollableOutsets:(UIEdgeInsets)a3
{
}

- (CGPoint)_scrollOffsetFromVisibleRect
{
  [(PXGLayout *)self visibleRect];
  -[PXStoryScrollContentLayout _scrollOffsetForVisibleRectOrigin:](self, "_scrollOffsetForVisibleRectOrigin:");
  result.double y = v4;
  result.double x = v3;
  return result;
}

- (void)visibleRectDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)PXStoryScrollContentLayout;
  [(PXGLayout *)&v3 visibleRectDidChange];
  [(PXStoryScrollContentLayout *)self _scrollOffsetFromVisibleRect];
  -[PXStoryScrollContentLayout _setScrollOffset:updateScrollPosition:](self, "_setScrollOffset:updateScrollPosition:", 0);
}

- (void)referenceSizeDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)PXStoryScrollContentLayout;
  [(PXGLayout *)&v3 referenceSizeDidChange];
  [(PXStoryScrollContentLayout *)self _invalidateContentSize];
}

- (void)setDelegate:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained != obj)
  {
    id v5 = objc_storeWeak((id *)&self->_delegate, obj);
    self->_delegateRespondsTo.scrollOffsetDidChange = objc_opt_respondsToSelector() & 1;
  }
}

- (PXStoryScrollContentLayout)init
{
  v5.receiver = self;
  v5.super_class = (Class)PXStoryScrollContentLayout;
  v2 = [(PXGLayout *)&v5 init];
  objc_super v3 = v2;
  if (v2) {
    [(PXGLayout *)v2 addSpriteWithInitialState:0];
  }
  return v3;
}

@end
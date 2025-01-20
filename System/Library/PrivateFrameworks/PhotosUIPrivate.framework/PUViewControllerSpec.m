@interface PUViewControllerSpec
- (BOOL)_needsUpdateLayoutStyle;
- (BOOL)isPresentedForSecondScreen;
- (BOOL)isValid;
- (BOOL)prefersCompactLayoutForSplitScreen;
- (CGSize)_portraitOrientedSizeForSize:(CGSize)result;
- (CGSize)layoutReferenceSize;
- (CGSize)secondScreenSize;
- (NSHashTable)_changeObservers;
- (PUViewControllerSpec)init;
- (PUViewControllerSpecChange)currentChange;
- (UITraitCollection)traitCollection;
- (id)newSpecChange;
- (int64_t)_changeCount;
- (int64_t)currentLayoutStyle;
- (void)_didChange;
- (void)_invalidateLayoutStyle;
- (void)_publishChange:(id)a3;
- (void)_setChangeCount:(int64_t)a3;
- (void)_setCurrentChange:(id)a3;
- (void)_setCurrentLayoutStyle:(int64_t)a3;
- (void)_setNeedsUpdateLayoutStyle:(BOOL)a3;
- (void)_updateCurrentLayoutStyleIfNeeded;
- (void)_willChange;
- (void)assertInsideChangesBlock;
- (void)performChanges:(id)a3;
- (void)registerChangeObserver:(id)a3;
- (void)setLayoutReferenceSize:(CGSize)a3;
- (void)setPrefersCompactLayoutForSplitScreen:(BOOL)a3;
- (void)setPresentedForSecondScreen:(BOOL)a3;
- (void)setSecondScreenSize:(CGSize)a3;
- (void)setTraitCollection:(id)a3;
- (void)unregisterChangeObserver:(id)a3;
@end

@implementation PUViewControllerSpec

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentChange, 0);
  objc_storeStrong((id *)&self->__changeObservers, 0);
  objc_storeStrong((id *)&self->_traitCollection, 0);
}

- (PUViewControllerSpecChange)currentChange
{
  return self->_currentChange;
}

- (int64_t)currentLayoutStyle
{
  return self->_currentLayoutStyle;
}

- (void)_setNeedsUpdateLayoutStyle:(BOOL)a3
{
  self->__needsUpdateLayoutStyle = a3;
}

- (BOOL)_needsUpdateLayoutStyle
{
  return self->__needsUpdateLayoutStyle;
}

- (void)_setChangeCount:(int64_t)a3
{
  self->__changeCount = a3;
}

- (int64_t)_changeCount
{
  return self->__changeCount;
}

- (NSHashTable)_changeObservers
{
  return self->__changeObservers;
}

- (BOOL)prefersCompactLayoutForSplitScreen
{
  return self->_prefersCompactLayoutForSplitScreen;
}

- (CGSize)secondScreenSize
{
  double width = self->_secondScreenSize.width;
  double height = self->_secondScreenSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (BOOL)isPresentedForSecondScreen
{
  return self->_presentedForSecondScreen;
}

- (CGSize)layoutReferenceSize
{
  double width = self->_layoutReferenceSize.width;
  double height = self->_layoutReferenceSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (UITraitCollection)traitCollection
{
  return self->_traitCollection;
}

- (void)_setCurrentLayoutStyle:(int64_t)a3
{
  [(PUViewControllerSpec *)self assertInsideChangesBlock];
  if (self->_currentLayoutStyle != a3)
  {
    self->_currentLayoutStyle = a3;
    id v5 = [(PUViewControllerSpec *)self currentChange];
    [v5 setLayoutStyleChanged:1];
  }
}

- (void)_setCurrentChange:(id)a3
{
}

- (void)_updateCurrentLayoutStyleIfNeeded
{
  if ([(PUViewControllerSpec *)self _needsUpdateLayoutStyle])
  {
    v22 = [(PUViewControllerSpec *)self traitCollection];
    [(PUViewControllerSpec *)self layoutReferenceSize];
    id v5 = v22;
    if (v22)
    {
      double v6 = v3;
      double v7 = v4;
      uint64_t v8 = [v22 horizontalSizeClass];
      id v5 = v22;
      if (v8)
      {
        v9 = [MEMORY[0x1E4FB1BA8] mainScreen];
        [v9 _referenceBounds];
        double v11 = v10;
        double v13 = v12;

        -[PUViewControllerSpec _portraitOrientedSizeForSize:](self, "_portraitOrientedSizeForSize:", v6, v7);
        double v15 = v14;
        double v17 = v16;
        BOOL v18 = [(PUViewControllerSpec *)self prefersCompactLayoutForSplitScreen];
        [(PUViewControllerSpec *)self _setNeedsUpdateLayoutStyle:0];
        if ([v22 horizontalSizeClass] == 2
          && (v17 < v13 ? (BOOL v19 = 1) : (BOOL v19 = v15 < v11), [v22 verticalSizeClass] == 2 && (!v18 || !v19)))
        {
          uint64_t v20 = 4;
        }
        else
        {
          double v21 = fmin(v7, v6);
          if (v21 <= 400.0)
          {
            if (v21 <= 350.0) {
              uint64_t v20 = 1;
            }
            else {
              uint64_t v20 = 2;
            }
          }
          else
          {
            uint64_t v20 = 3;
          }
        }
        [(PUViewControllerSpec *)self _setCurrentLayoutStyle:v20];
        id v5 = v22;
      }
    }
  }
}

- (CGSize)_portraitOrientedSizeForSize:(CGSize)result
{
  if (result.width <= result.height) {
    double height = result.height;
  }
  else {
    double height = result.width;
  }
  if (result.width > result.height) {
    result.double width = result.height;
  }
  double v4 = height;
  result.double height = v4;
  return result;
}

- (void)_invalidateLayoutStyle
{
}

- (void)_publishChange:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 changed])
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    id v5 = [(PUViewControllerSpec *)self _changeObservers];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v12;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v12 != v8) {
            objc_enumerationMutation(v5);
          }
          double v10 = *(void **)(*((void *)&v11 + 1) + 8 * v9);
          if (objc_opt_respondsToSelector()) {
            [v10 viewControllerSpec:self didChange:v4];
          }
          ++v9;
        }
        while (v7 != v9);
        uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v7);
    }
  }
}

- (void)_didChange
{
  int64_t v3 = [(PUViewControllerSpec *)self _changeCount] - 1;
  [(PUViewControllerSpec *)self _setChangeCount:v3];
  if (!v3)
  {
    [(PUViewControllerSpec *)self updateIfNeeded];
    id v4 = [(PUViewControllerSpec *)self currentChange];
    [(PUViewControllerSpec *)self _setCurrentChange:0];
    [(PUViewControllerSpec *)self _publishChange:v4];
  }
}

- (void)_willChange
{
  int64_t v4 = [(PUViewControllerSpec *)self _changeCount];
  [(PUViewControllerSpec *)self _setChangeCount:v4 + 1];
  if (!v4)
  {
    id v5 = [(PUViewControllerSpec *)self newSpecChange];
    id v7 = v5;
    if (!v5)
    {
      uint64_t v6 = [MEMORY[0x1E4F28B00] currentHandler];
      [v6 handleFailureInMethod:a2, self, @"PUViewControllerSpec.m", 130, @"Invalid parameter not satisfying: %@", @"currentChange != nil" object file lineNumber description];

      id v5 = 0;
    }
    [(PUViewControllerSpec *)self _setCurrentChange:v5];
  }
}

- (id)newSpecChange
{
  return objc_alloc_init(PUViewControllerSpecChange);
}

- (void)setPrefersCompactLayoutForSplitScreen:(BOOL)a3
{
  BOOL v3 = a3;
  [(PUViewControllerSpec *)self assertInsideChangesBlock];
  if (self->_prefersCompactLayoutForSplitScreen != v3)
  {
    self->_prefersCompactLayoutForSplitScreen = v3;
    id v5 = [(PUViewControllerSpec *)self currentChange];
    [v5 setPrefersCompactLayoutForSplitScreenChanged:1];
  }
}

- (void)setSecondScreenSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  [(PUViewControllerSpec *)self assertInsideChangesBlock];
  if (width != self->_secondScreenSize.width || height != self->_secondScreenSize.height)
  {
    self->_secondScreenSize.double width = width;
    self->_secondScreenSize.double height = height;
    id v7 = [(PUViewControllerSpec *)self currentChange];
    [v7 setSecondScreenSizeChanged:1];
  }
}

- (void)setPresentedForSecondScreen:(BOOL)a3
{
  BOOL v3 = a3;
  [(PUViewControllerSpec *)self assertInsideChangesBlock];
  if (self->_presentedForSecondScreen != v3)
  {
    self->_presentedForSecondScreen = v3;
    id v5 = [(PUViewControllerSpec *)self currentChange];
    [v5 setPresentedForSecondScreenChanged:1];
  }
}

- (void)setLayoutReferenceSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  [(PUViewControllerSpec *)self assertInsideChangesBlock];
  if (width != self->_layoutReferenceSize.width || height != self->_layoutReferenceSize.height)
  {
    self->_layoutReferenceSize.double width = width;
    self->_layoutReferenceSize.double height = height;
    id v7 = [(PUViewControllerSpec *)self currentChange];
    [v7 setLayoutReferenceSizeChanged:1];

    [(PUViewControllerSpec *)self _invalidateLayoutStyle];
  }
}

- (void)setTraitCollection:(id)a3
{
  uint64_t v6 = (UITraitCollection *)a3;
  [(PUViewControllerSpec *)self assertInsideChangesBlock];
  if (self->_traitCollection != v6)
  {
    objc_storeStrong((id *)&self->_traitCollection, a3);
    id v5 = [(PUViewControllerSpec *)self currentChange];
    [v5 setTraitCollectionChanged:1];

    [(PUViewControllerSpec *)self _invalidateLayoutStyle];
  }
}

- (BOOL)isValid
{
  return [(PUViewControllerSpec *)self currentLayoutStyle] != 0;
}

- (void)assertInsideChangesBlock
{
  int64_t v4 = [(PUViewControllerSpec *)self currentChange];

  if (!v4)
  {
    id v5 = [MEMORY[0x1E4F28B00] currentHandler];
    [v5 handleFailureInMethod:a2 object:self file:@"PUViewControllerSpec.m" lineNumber:47 description:@"not within a change block"];
  }
}

- (void)unregisterChangeObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(PUViewControllerSpec *)self _changeObservers];
  [v5 removeObject:v4];
}

- (void)registerChangeObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(PUViewControllerSpec *)self _changeObservers];
  [v5 addObject:v4];
}

- (void)performChanges:(id)a3
{
  uint64_t v6 = (void (**)(void))a3;
  if (!v6)
  {
    id v5 = [MEMORY[0x1E4F28B00] currentHandler];
    [v5 handleFailureInMethod:a2, self, @"PUViewControllerSpec.m", 31, @"Invalid parameter not satisfying: %@", @"changes != NULL" object file lineNumber description];
  }
  [(PUViewControllerSpec *)self _willChange];
  v6[2]();
  [(PUViewControllerSpec *)self _didChange];
}

- (PUViewControllerSpec)init
{
  v6.receiver = self;
  v6.super_class = (Class)PUViewControllerSpec;
  v2 = [(PUViewControllerSpec *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    changeObservers = v2->__changeObservers;
    v2->__changeObservers = (NSHashTable *)v3;
  }
  return v2;
}

@end
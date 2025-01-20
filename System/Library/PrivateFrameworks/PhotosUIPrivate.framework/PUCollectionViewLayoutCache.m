@interface PUCollectionViewLayoutCache
- (BOOL)cachesResults;
- (BOOL)flipsHorizontallyInOppositeLayoutDirection;
- (CGSize)collectionViewContentSize;
- (PUCollectionViewLayoutCache)init;
- (PUCollectionViewLayoutCache)initWithProvider:(id)a3;
- (PUCollectionViewLayoutProvider)layoutProvider;
- (id)layoutAttributesForDecorationViewOfKind:(id)a3 atIndexPath:(id)a4;
- (id)layoutAttributesForElementsInRect:(CGRect)a3;
- (id)layoutAttributesForItemAtIndexPath:(id)a3;
- (id)layoutAttributesForSupplementaryViewOfKind:(id)a3 atIndexPath:(id)a4;
- (void)invalidateLayoutCache;
- (void)setCachesResults:(BOOL)a3;
@end

@implementation PUCollectionViewLayoutCache

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_layoutProvider);
  objc_storeStrong((id *)&self->_decorationViewLayoutAttributesByKind, 0);
  objc_storeStrong((id *)&self->_supplementaryViewLayoutAttributesByKind, 0);
  objc_storeStrong((id *)&self->_itemLayoutAttributesByIndexPath, 0);
}

- (void)setCachesResults:(BOOL)a3
{
  self->_cachesResults = a3;
}

- (BOOL)cachesResults
{
  return self->_cachesResults;
}

- (PUCollectionViewLayoutProvider)layoutProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_layoutProvider);
  return (PUCollectionViewLayoutProvider *)WeakRetained;
}

- (BOOL)flipsHorizontallyInOppositeLayoutDirection
{
  return 1;
}

- (void)invalidateLayoutCache
{
  [(NSMutableDictionary *)self->_itemLayoutAttributesByIndexPath removeAllObjects];
  [(NSMutableDictionary *)self->_supplementaryViewLayoutAttributesByKind removeAllObjects];
  decorationViewLayoutAttributesByKind = self->_decorationViewLayoutAttributesByKind;
  [(NSMutableDictionary *)decorationViewLayoutAttributesByKind removeAllObjects];
}

- (id)layoutAttributesForDecorationViewOfKind:(id)a3 atIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(NSMutableDictionary *)self->_decorationViewLayoutAttributesByKind objectForKey:v6];
  uint64_t v9 = [v8 objectForKey:v7];
  if (v9)
  {
    v10 = (void *)v9;
  }
  else if ((*(unsigned char *)&self->_layoutProviderFlags & 2) != 0)
  {
    v11 = [(PUCollectionViewLayoutCache *)self layoutProvider];
    v10 = [v11 layoutAttributesForDecorationViewOfKind:v6 atIndexPath:v7];

    if (v10 && [(PUCollectionViewLayoutCache *)self cachesResults])
    {
      decorationViewLayoutAttributesByKind = self->_decorationViewLayoutAttributesByKind;
      if (decorationViewLayoutAttributesByKind)
      {
        v13 = decorationViewLayoutAttributesByKind;
      }
      else
      {
        v13 = [MEMORY[0x1E4F1CA60] dictionary];
      }
      v14 = self->_decorationViewLayoutAttributesByKind;
      self->_decorationViewLayoutAttributesByKind = v13;

      if (!v8)
      {
        v8 = [MEMORY[0x1E4F1CA60] dictionary];
        [(NSMutableDictionary *)self->_decorationViewLayoutAttributesByKind setObject:v8 forKey:v6];
      }
      [v8 setObject:v10 forKey:v7];
    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)layoutAttributesForSupplementaryViewOfKind:(id)a3 atIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(NSMutableDictionary *)self->_supplementaryViewLayoutAttributesByKind objectForKey:v6];
  uint64_t v9 = [v8 objectForKey:v7];
  if (v9)
  {
    v10 = (void *)v9;
  }
  else if (*(unsigned char *)&self->_layoutProviderFlags)
  {
    v11 = [(PUCollectionViewLayoutCache *)self layoutProvider];
    v10 = [v11 layoutAttributesForSupplementaryViewOfKind:v6 atIndexPath:v7];

    if (v10 && [(PUCollectionViewLayoutCache *)self cachesResults])
    {
      supplementaryViewLayoutAttributesByKind = self->_supplementaryViewLayoutAttributesByKind;
      if (supplementaryViewLayoutAttributesByKind)
      {
        v13 = supplementaryViewLayoutAttributesByKind;
      }
      else
      {
        v13 = [MEMORY[0x1E4F1CA60] dictionary];
      }
      v14 = self->_supplementaryViewLayoutAttributesByKind;
      self->_supplementaryViewLayoutAttributesByKind = v13;

      if (!v8)
      {
        v8 = [MEMORY[0x1E4F1CA60] dictionary];
        [(NSMutableDictionary *)self->_supplementaryViewLayoutAttributesByKind setObject:v8 forKey:v6];
      }
      [v8 setObject:v10 forKey:v7];
    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)layoutAttributesForItemAtIndexPath:(id)a3
{
  id v4 = a3;
  v5 = [(NSMutableDictionary *)self->_itemLayoutAttributesByIndexPath objectForKey:v4];
  if (!v5)
  {
    id v7 = [(PUCollectionViewLayoutCache *)self layoutProvider];
    v5 = [v7 layoutAttributesForItemAtIndexPath:v4];

    if (v5)
    {
      if ([(PUCollectionViewLayoutCache *)self cachesResults])
      {
        itemLayoutAttributesByIndexPath = self->_itemLayoutAttributesByIndexPath;
        if (itemLayoutAttributesByIndexPath)
        {
          uint64_t v9 = itemLayoutAttributesByIndexPath;
        }
        else
        {
          uint64_t v9 = [MEMORY[0x1E4F1CA60] dictionary];
        }
        v10 = self->_itemLayoutAttributesByIndexPath;
        self->_itemLayoutAttributesByIndexPath = v9;

        [(NSMutableDictionary *)self->_itemLayoutAttributesByIndexPath setObject:v5 forKey:v4];
      }
    }
  }

  return v5;
}

- (id)layoutAttributesForElementsInRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v7 = [(PUCollectionViewLayoutCache *)self layoutProvider];
  v8 = objc_msgSend(v7, "layoutAttributesForElementsInRect:", x, y, width, height);

  return v8;
}

- (CGSize)collectionViewContentSize
{
  v2 = [(PUCollectionViewLayoutCache *)self layoutProvider];
  [v2 collectionViewContentSize];
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.double height = v8;
  result.double width = v7;
  return result;
}

- (PUCollectionViewLayoutCache)init
{
  return [(PUCollectionViewLayoutCache *)self initWithProvider:0];
}

- (PUCollectionViewLayoutCache)initWithProvider:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PUCollectionViewLayoutCache;
  double v5 = [(PUCollectionViewLayoutCache *)&v9 init];
  double v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_layoutProvider, v4);
    *(unsigned char *)&v6->_layoutProviderFlags = *(unsigned char *)&v6->_layoutProviderFlags & 0xFE | objc_opt_respondsToSelector() & 1;
    if (objc_opt_respondsToSelector()) {
      char v7 = 2;
    }
    else {
      char v7 = 0;
    }
    *(unsigned char *)&v6->_layoutProviderFlags = *(unsigned char *)&v6->_layoutProviderFlags & 0xFD | v7;
    v6->_cachesResults = 1;
  }

  return v6;
}

@end
@interface PUCollectionViewData
- (BOOL)hasReferenceIndexPath;
- (CGRect)currentContentBounds;
- (NSMutableArray)itemLayoutAttributes;
- (NSMutableDictionary)itemLayoutAttributesByIndexPath;
- (PUCollectionViewData)init;
- (int64_t)cachedPageCount;
- (void)invalidate;
- (void)setCurrentContentBounds:(CGRect)a3;
@end

@implementation PUCollectionViewData

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemLayoutAttributesByIndexPath, 0);
  objc_storeStrong((id *)&self->_itemLayoutAttributes, 0);
}

- (NSMutableDictionary)itemLayoutAttributesByIndexPath
{
  return self->_itemLayoutAttributesByIndexPath;
}

- (NSMutableArray)itemLayoutAttributes
{
  return self->_itemLayoutAttributes;
}

- (void)setCurrentContentBounds:(CGRect)a3
{
  self->_currentContentBounds = a3;
}

- (CGRect)currentContentBounds
{
  double x = self->_currentContentBounds.origin.x;
  double y = self->_currentContentBounds.origin.y;
  double width = self->_currentContentBounds.size.width;
  double height = self->_currentContentBounds.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (int64_t)cachedPageCount
{
  return self->_cachedPageCount;
}

- (BOOL)hasReferenceIndexPath
{
  return [(NSMutableArray *)self->_itemLayoutAttributes count] != 0;
}

- (void)invalidate
{
  CGSize v3 = *(CGSize *)(MEMORY[0x1E4F1DB28] + 16);
  self->_currentContentBounds.origin = (CGPoint)*MEMORY[0x1E4F1DB28];
  self->_currentContentBounds.size = v3;
  v4 = [MEMORY[0x1E4F1CA48] array];
  itemLayoutAttributes = self->_itemLayoutAttributes;
  self->_itemLayoutAttributes = v4;

  v6 = [MEMORY[0x1E4F1CA60] dictionary];
  itemLayoutAttributesByIndexPath = self->_itemLayoutAttributesByIndexPath;
  self->_itemLayoutAttributesByIndexPath = v6;
}

- (PUCollectionViewData)init
{
  v9.receiver = self;
  v9.super_class = (Class)PUCollectionViewData;
  v2 = [(PUCollectionViewData *)&v9 init];
  CGSize v3 = v2;
  if (v2)
  {
    v2->_cachedPageCount = 2;
    uint64_t v4 = [MEMORY[0x1E4F1CA48] array];
    itemLayoutAttributes = v3->_itemLayoutAttributes;
    v3->_itemLayoutAttributes = (NSMutableArray *)v4;

    uint64_t v6 = [MEMORY[0x1E4F1CA60] dictionary];
    itemLayoutAttributesByIndexPath = v3->_itemLayoutAttributesByIndexPath;
    v3->_itemLayoutAttributesByIndexPath = (NSMutableDictionary *)v6;
  }
  return v3;
}

@end
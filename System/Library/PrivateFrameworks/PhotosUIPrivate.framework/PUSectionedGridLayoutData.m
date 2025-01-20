@interface PUSectionedGridLayoutData
- (CGRect)currentContentBounds;
- (NSMutableArray)headerLayoutAttributes;
- (NSMutableDictionary)headerLayoutAttributesByVisualSection;
- (PUSectionedGridLayoutData)init;
- (int64_t)numberOfPagesToCache;
- (void)invalidate;
- (void)setCurrentContentBounds:(CGRect)a3;
@end

@implementation PUSectionedGridLayoutData

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_headerLayoutAttributesByVisualSection, 0);
  objc_storeStrong((id *)&self->_headerLayoutAttributes, 0);
}

- (NSMutableDictionary)headerLayoutAttributesByVisualSection
{
  return self->_headerLayoutAttributesByVisualSection;
}

- (NSMutableArray)headerLayoutAttributes
{
  return self->_headerLayoutAttributes;
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

- (int64_t)numberOfPagesToCache
{
  return self->_numberOfPagesToCache;
}

- (void)invalidate
{
  CGSize v3 = *(CGSize *)(MEMORY[0x1E4F1DB28] + 16);
  self->_currentContentBounds.origin = (CGPoint)*MEMORY[0x1E4F1DB28];
  self->_currentContentBounds.size = v3;
  v4 = [MEMORY[0x1E4F1CA48] array];
  headerLayoutAttributes = self->_headerLayoutAttributes;
  self->_headerLayoutAttributes = v4;

  v6 = [MEMORY[0x1E4F1CA60] dictionary];
  headerLayoutAttributesByVisualSection = self->_headerLayoutAttributesByVisualSection;
  self->_headerLayoutAttributesByVisualSection = v6;
}

- (PUSectionedGridLayoutData)init
{
  v9.receiver = self;
  v9.super_class = (Class)PUSectionedGridLayoutData;
  v2 = [(PUSectionedGridLayoutData *)&v9 init];
  CGSize v3 = v2;
  if (v2)
  {
    v2->_numberOfPagesToCache = 2;
    uint64_t v4 = [MEMORY[0x1E4F1CA48] array];
    headerLayoutAttributes = v3->_headerLayoutAttributes;
    v3->_headerLayoutAttributes = (NSMutableArray *)v4;

    uint64_t v6 = [MEMORY[0x1E4F1CA60] dictionary];
    headerLayoutAttributesByVisualSection = v3->_headerLayoutAttributesByVisualSection;
    v3->_headerLayoutAttributesByVisualSection = (NSMutableDictionary *)v6;
  }
  return v3;
}

@end
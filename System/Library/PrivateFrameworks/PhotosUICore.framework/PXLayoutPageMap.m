@interface PXLayoutPageMap
- (PXLayoutPageMap)initWithSources:(id)a3 contentRect:(CGRect)a4;
- (id)_screenPageForPoint:(CGPoint)a3;
- (id)description;
- (id)sourcesFromRect:(CGRect)a3;
- (void)_mapSources:(id)a3;
@end

@implementation PXLayoutPageMap

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sources, 0);
  objc_storeStrong((id *)&self->_pageMap, 0);
}

- (void)_mapSources:(id)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __31__PXLayoutPageMap__mapSources___block_invoke;
  v3[3] = &unk_1E5DB91D8;
  v3[4] = self;
  [a3 enumerateObjectsUsingBlock:v3];
}

void __31__PXLayoutPageMap__mapSources___block_invoke(uint64_t a1, void *a2)
{
  [a2 frame];
  CGFloat x = v6.origin.x;
  CGFloat y = v6.origin.y;
  CGFloat width = v6.size.width;
  CGFloat height = v6.size.height;
  CGRectGetMinX(v6);
  v7.origin.CGFloat x = x;
  v7.origin.CGFloat y = y;
  v7.size.CGFloat width = width;
  v7.size.CGFloat height = height;
  CGRectGetMinY(v7);
  PXPageAlignedRectForCGPoint();
}

- (id)sourcesFromRect:(CGRect)a3
{
  if (!CGRectIsNull(a3))
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F28E60]);
    PXPageKeyForCGPoint();
  }
  v4 = [MEMORY[0x1E4F1C978] array];
  return v4;
}

- (id)_screenPageForPoint:(CGPoint)a3
{
}

- (id)description
{
  v6.receiver = self;
  v6.super_class = (Class)PXLayoutPageMap;
  id v3 = [(PXLayoutPageMap *)&v6 description];
  v4 = [v3 stringByAppendingFormat:@"pageMap:%@", self->_pageMap];

  return v4;
}

- (PXLayoutPageMap)initWithSources:(id)a3 contentRect:(CGRect)a4
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  id v9 = a3;
  v18.receiver = self;
  v18.super_class = (Class)PXLayoutPageMap;
  v10 = [(PXLayoutPageMap *)&v18 init];
  if (v10)
  {
    v11 = [MEMORY[0x1E4F28F58] pointerFunctionsWithOptions:1282];
    v12 = [MEMORY[0x1E4F28F58] pointerFunctionsWithOptions:0];
    uint64_t v13 = [objc_alloc(MEMORY[0x1E4F28E10]) initWithKeyPointerFunctions:v11 valuePointerFunctions:v12 capacity:0];
    pageMap = v10->_pageMap;
    v10->_pageMap = (NSMapTable *)v13;

    v10->_contentRect.origin.CGFloat x = x;
    v10->_contentRect.origin.CGFloat y = y;
    v10->_contentRect.size.CGFloat width = width;
    v10->_contentRect.size.CGFloat height = height;
    uint64_t v15 = [v9 copy];
    sources = v10->_sources;
    v10->_sources = (NSArray *)v15;

    [(PXLayoutPageMap *)v10 _mapSources:v10->_sources];
  }

  return v10;
}

@end
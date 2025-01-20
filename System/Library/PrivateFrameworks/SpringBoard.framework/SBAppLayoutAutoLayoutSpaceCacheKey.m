@interface SBAppLayoutAutoLayoutSpaceCacheKey
+ (id)cacheKeyForSnapshotOfAppLayout:(id)a3 chamoisLayoutAttributes:(id)a4 containerBounds:(CGRect)a5 containerOrientation:(int64_t)a6 floatingDockHeight:(double)a7 hideStrips:(BOOL)a8 hideDock:(BOOL)a9;
- (BOOL)isEqual:(id)a3;
- (id)_initWithAppLayout:(id)a3 chamoisLayoutAttributes:(id)a4 containerBounds:(CGRect)a5 containerOrientation:(int64_t)a6 floatingDockHeight:(double)a7 hideStrips:(BOOL)a8 hideDock:(BOOL)a9;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (unint64_t)hash;
@end

@implementation SBAppLayoutAutoLayoutSpaceCacheKey

+ (id)cacheKeyForSnapshotOfAppLayout:(id)a3 chamoisLayoutAttributes:(id)a4 containerBounds:(CGRect)a5 containerOrientation:(int64_t)a6 floatingDockHeight:(double)a7 hideStrips:(BOOL)a8 hideDock:(BOOL)a9
{
  BOOL v9 = a9;
  BOOL v10 = a8;
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  id v19 = a4;
  id v20 = a3;
  v21 = objc_msgSend(objc_alloc((Class)a1), "_initWithAppLayout:chamoisLayoutAttributes:containerBounds:containerOrientation:floatingDockHeight:hideStrips:hideDock:", v20, v19, a6, v10, v9, x, y, width, height, a7);

  return v21;
}

- (id)_initWithAppLayout:(id)a3 chamoisLayoutAttributes:(id)a4 containerBounds:(CGRect)a5 containerOrientation:(int64_t)a6 floatingDockHeight:(double)a7 hideStrips:(BOOL)a8 hideDock:(BOOL)a9
{
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v19 = a3;
  id v20 = a4;
  v48.receiver = self;
  v48.super_class = (Class)SBAppLayoutAutoLayoutSpaceCacheKey;
  v21 = [(SBAppLayoutAutoLayoutSpaceCacheKey *)&v48 init];
  if (v21)
  {
    int64_t v40 = a6;
    BOOL v41 = a8;
    BOOL v42 = a9;
    uint64_t v22 = [v19 zOrderedItems];
    zOrderedItems = v21->_zOrderedItems;
    v39 = v21;
    v21->_zOrderedItems = (NSArray *)v22;

    v24 = (NSDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    long long v44 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    id obj = [v19 allItems];
    uint64_t v25 = [obj countByEnumeratingWithState:&v44 objects:v49 count:16];
    if (v25)
    {
      uint64_t v26 = v25;
      uint64_t v27 = *(void *)v45;
      do
      {
        for (uint64_t i = 0; i != v26; ++i)
        {
          if (*(void *)v45 != v27) {
            objc_enumerationMutation(obj);
          }
          uint64_t v29 = *(void *)(*((void *)&v44 + 1) + 8 * i);
          v30 = objc_msgSend(v19, "layoutAttributesForItem:", v29, v39);
          [v20 defaultWindowSize];
          double v32 = v31;
          double v34 = v33;
          [v20 screenEdgePadding];
          objc_msgSend(v30, "sizeInBounds:defaultSize:screenEdgePadding:", x, y, width, height, v32, v34, v35);
          v36 = +[_SBAppLayoutAutoLayoutSpaceCacheKeyDisplayItemRecord itemRecordForLayoutAttributes:size:containerBounds:](_SBAppLayoutAutoLayoutSpaceCacheKeyDisplayItemRecord, "itemRecordForLayoutAttributes:size:containerBounds:", v30);
          [(NSDictionary *)v24 setObject:v36 forKey:v29];
        }
        uint64_t v26 = [obj countByEnumeratingWithState:&v44 objects:v49 count:16];
      }
      while (v26);
    }

    v21 = v39;
    recordsForItems = v39->_recordsForItems;
    v39->_recordsForItems = v24;

    v39->_containerBounds.origin.double x = x;
    v39->_containerBounds.origin.double y = y;
    v39->_containerBounds.size.double width = width;
    v39->_containerBounds.size.double height = height;
    v39->_containerOrientation = v40;
    v39->_floatingDockHeight = a7;
    v39->_hideStrips = v41;
    v39->_hideDock = v42;
    v39->_hash = -1;
  }

  return v21;
}

- (unint64_t)hash
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  unint64_t result = self->_hash;
  if (result == -1)
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4F4F758]);
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    v5 = self->_zOrderedItems;
    uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v22;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v22 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = *(void *)(*((void *)&v21 + 1) + 8 * i);
          id v11 = (id)objc_msgSend(v4, "appendObject:", v10, (void)v21);
          v12 = [(NSDictionary *)self->_recordsForItems objectForKey:v10];
          [v12 _appendToHashBuilder:v4];
        }
        uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v21 objects:v25 count:16];
      }
      while (v7);
    }

    id v13 = (id)objc_msgSend(v4, "appendCGRect:", self->_containerBounds.origin.x, self->_containerBounds.origin.y, self->_containerBounds.size.width, self->_containerBounds.size.height);
    id v14 = (id)[v4 appendInteger:self->_containerOrientation];
    double floatingDockHeight = self->_floatingDockHeight;
    *(float *)&double floatingDockHeight = floatingDockHeight;
    id v16 = (id)[v4 appendFloat:floatingDockHeight];
    id v17 = (id)[v4 appendBool:self->_hideStrips];
    id v18 = (id)[v4 appendBool:self->_hideDock];
    unint64_t v19 = [v4 hash];
    unint64_t v20 = -2;
    if (v19 < 0xFFFFFFFFFFFFFFFELL) {
      unint64_t v20 = v19;
    }
    self->_hash = v20;

    return self->_hash;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (SBAppLayoutAutoLayoutSpaceCacheKey *)a3;
  if (v4 == self)
  {
    char v6 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      if (BSEqualArrays()
        && BSEqualDictionaries()
        && CGRectEqualToRect(self->_containerBounds, v5->_containerBounds)
        && self->_containerOrientation == v5->_containerOrientation
        && self->_floatingDockHeight == v5->_floatingDockHeight
        && BSEqualBools())
      {
        char v6 = BSEqualBools();
      }
      else
      {
        char v6 = 0;
      }
    }
    else
    {
      char v6 = 0;
    }
  }

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init(SBAppLayoutAutoLayoutSpaceCacheKey);
  uint64_t v5 = [(NSArray *)self->_zOrderedItems copy];
  zOrderedItems = v4->_zOrderedItems;
  v4->_zOrderedItems = (NSArray *)v5;

  uint64_t v7 = [(NSDictionary *)self->_recordsForItems copy];
  recordsForItems = v4->_recordsForItems;
  v4->_recordsForItems = (NSDictionary *)v7;

  CGPoint origin = self->_containerBounds.origin;
  v4->_containerBounds.size = self->_containerBounds.size;
  v4->_containerBounds.CGPoint origin = origin;
  v4->_containerOrientation = self->_containerOrientation;
  v4->_double floatingDockHeight = self->_floatingDockHeight;
  v4->_hideStrips = self->_hideStrips;
  v4->_hideDock = self->_hideDock;
  v4->_hash = self->_hash;
  return v4;
}

- (id)description
{
  return [(SBAppLayoutAutoLayoutSpaceCacheKey *)self descriptionWithMultilinePrefix:0];
}

- (id)succinctDescription
{
  v2 = [(SBAppLayoutAutoLayoutSpaceCacheKey *)self succinctDescriptionBuilder];
  v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  id v4 = (id)objc_msgSend(v3, "appendUnsignedInteger:withName:", -[NSArray count](self->_zOrderedItems, "count"), @"item(s)");
  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  v3 = [(SBAppLayoutAutoLayoutSpaceCacheKey *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SBAppLayoutAutoLayoutSpaceCacheKey *)self succinctDescriptionBuilder];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __76__SBAppLayoutAutoLayoutSpaceCacheKey_descriptionBuilderWithMultilinePrefix___block_invoke;
  v10[3] = &unk_1E6AF5290;
  v10[4] = self;
  id v6 = v5;
  id v11 = v6;
  [v6 appendBodySectionWithName:0 multilinePrefix:v4 block:v10];

  uint64_t v7 = v11;
  id v8 = v6;

  return v8;
}

id __76__SBAppLayoutAutoLayoutSpaceCacheKey_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id obj = *(id *)(*(void *)(a1 + 32) + 8);
  uint64_t v2 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v21 != v4) {
          objc_enumerationMutation(obj);
        }
        id v6 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        uint64_t v7 = *(void **)(a1 + 40);
        id v8 = [v6 uniqueIdentifier];
        BOOL v9 = [*(id *)(a1 + 40) activeMultilinePrefix];
        v18[0] = MEMORY[0x1E4F143A8];
        v18[1] = 3221225472;
        v18[2] = __76__SBAppLayoutAutoLayoutSpaceCacheKey_descriptionBuilderWithMultilinePrefix___block_invoke_2;
        v18[3] = &unk_1E6AF4E00;
        uint64_t v10 = *(void **)(a1 + 40);
        v18[4] = *(void *)(a1 + 32);
        v18[5] = v6;
        id v19 = v10;
        [v7 appendBodySectionWithName:v8 multilinePrefix:v9 block:v18];
      }
      uint64_t v3 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v3);
  }

  id v11 = (id)objc_msgSend(*(id *)(a1 + 40), "appendRect:withName:", @"containerBounds", *(double *)(*(void *)(a1 + 32) + 24), *(double *)(*(void *)(a1 + 32) + 32), *(double *)(*(void *)(a1 + 32) + 40), *(double *)(*(void *)(a1 + 32) + 48));
  v12 = *(void **)(a1 + 40);
  id v13 = BSInterfaceOrientationDescription();
  [v12 appendString:v13 withName:@"containerOrientation"];

  id v14 = (id)[*(id *)(a1 + 40) appendFloat:@"floatingDockHeight" withName:1 decimalPrecision:*(double *)(*(void *)(a1 + 32) + 64)];
  id v15 = (id)[*(id *)(a1 + 40) appendBool:*(unsigned __int8 *)(*(void *)(a1 + 32) + 72) withName:@"hideStrips"];
  return (id)[*(id *)(a1 + 40) appendBool:*(unsigned __int8 *)(*(void *)(a1 + 32) + 73) withName:@"hideDock"];
}

void __76__SBAppLayoutAutoLayoutSpaceCacheKey_descriptionBuilderWithMultilinePrefix___block_invoke_2(void *a1)
{
  id v2 = [*(id *)(a1[4] + 16) objectForKeyedSubscript:a1[5]];
  [v2 _appendToDescriptionBuilder:a1[6]];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recordsForItems, 0);
  objc_storeStrong((id *)&self->_zOrderedItems, 0);
}

@end
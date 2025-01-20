@interface PXSectionedLayoutSnapshot
+ (id)emptyLayoutSnapshot;
- (CGRect)frameForSectionAtIndex:(unint64_t)a3;
- (PXSectionedLayoutSnapshot)init;
- (PXSectionedLayoutSnapshot)initWithContentRect:(CGRect)a3;
- (PXSectionedLayoutSnapshot)initWithContentRect:(CGRect)a3 forSections:(id)a4;
- (_PXLayoutGeometry)geometryForItem:(SEL)a3;
- (id)description;
- (void)enumerateFramesForSectionsInRect:(CGRect)a3 usingBlock:(id)a4;
- (void)enumerateGeometriesForItemsInRect:(CGRect)a3 usingBlock:(id)a4;
@end

@implementation PXSectionedLayoutSnapshot

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pageMap, 0);
  objc_storeStrong((id *)&self->_sections, 0);
}

- (CGRect)frameForSectionAtIndex:(unint64_t)a3
{
  v6 = self->_sections;
  if ([(NSArray *)v6 count] <= a3)
  {
    v20 = [MEMORY[0x1E4F28B00] currentHandler];
    [v20 handleFailureInMethod:a2, self, @"PXSectionedLayoutSnapshot.m", 106, @"Sectioned snapshot asked for rect for section %lu, but there are only %lu sections:\r%@", a3, -[NSArray count](v6, "count"), v6 object file lineNumber description];
  }
  v7 = [(NSArray *)v6 objectAtIndexedSubscript:a3];
  [v7 frame];
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;

  double v16 = v9;
  double v17 = v11;
  double v18 = v13;
  double v19 = v15;
  result.size.height = v19;
  result.size.width = v18;
  result.origin.y = v17;
  result.origin.x = v16;
  return result;
}

- (void)enumerateFramesForSectionsInRect:(CGRect)a3 usingBlock:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  double v9 = (void (**)(id, uint64_t, unsigned char *, double, double, double, double))a4;
  -[PXLayoutPageMap sourcesFromRect:](self->_pageMap, "sourcesFromRect:", x, y, width, height);
  char v28 = 0;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v11 = [v10 countByEnumeratingWithState:&v24 objects:v29 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v25;
LABEL_3:
    uint64_t v14 = 0;
    while (1)
    {
      if (*(void *)v25 != v13) {
        objc_enumerationMutation(v10);
      }
      double v15 = *(void **)(*((void *)&v24 + 1) + 8 * v14);
      objc_msgSend(v15, "frame", (void)v24);
      double v17 = v16;
      double v19 = v18;
      double v21 = v20;
      double v23 = v22;
      v31.origin.double x = x;
      v31.origin.double y = y;
      v31.size.double width = width;
      v31.size.double height = height;
      v32.origin.double x = v17;
      v32.origin.double y = v19;
      v32.size.double width = v21;
      v32.size.double height = v23;
      if (CGRectIntersectsRect(v31, v32))
      {
        v9[2](v9, [v15 index], &v28, v17, v19, v21, v23);
        if (v28) {
          break;
        }
      }
      if (v12 == ++v14)
      {
        uint64_t v12 = [v10 countByEnumeratingWithState:&v24 objects:v29 count:16];
        if (v12) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
}

- (void)enumerateGeometriesForItemsInRect:(CGRect)a3 usingBlock:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v9 = a4;
  id v10 = -[PXLayoutPageMap sourcesFromRect:](self->_pageMap, "sourcesFromRect:", x, y, width, height);
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v34 objects:v38 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v35;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v35 != v13) {
          objc_enumerationMutation(v10);
        }
        double v15 = *(void **)(*((void *)&v34 + 1) + 8 * i);
        [v15 frame];
        CGFloat v17 = v16;
        CGFloat v19 = v18;
        CGFloat v21 = v20;
        CGFloat v23 = v22;
        v40.origin.double x = x;
        v40.origin.double y = y;
        v40.size.double width = width;
        v40.size.double height = height;
        v41.origin.double x = v17;
        v41.origin.double y = v19;
        v41.size.double width = v21;
        v41.size.double height = v23;
        if (CGRectIntersectsRect(v40, v41))
        {
          v24[0] = MEMORY[0x1E4F143A8];
          v24[1] = 3221225472;
          v24[2] = __74__PXSectionedLayoutSnapshot_enumerateGeometriesForItemsInRect_usingBlock___block_invoke;
          v24[3] = &unk_1E5DB0358;
          CGFloat v26 = v17;
          CGFloat v27 = v19;
          CGFloat v28 = v21;
          CGFloat v29 = v23;
          double v30 = x;
          double v31 = y;
          double v32 = width;
          double v33 = height;
          v24[4] = v15;
          id v25 = v9;
          [v15 enumerateGeometriesWithBlock:v24];
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v34 objects:v38 count:16];
    }
    while (v12);
  }
}

void __74__PXSectionedLayoutSnapshot_enumerateGeometriesForItemsInRect_usingBlock___block_invoke()
{
}

- (_PXLayoutGeometry)geometryForItem:(SEL)a3
{
  id v6 = a4;
  long long v7 = *((_OWORD *)off_1E5DAAFE8 + 7);
  *(_OWORD *)&retstr->var5 = *((_OWORD *)off_1E5DAAFE8 + 6);
  *(_OWORD *)&retstr->var6.origin.double y = v7;
  *(_OWORD *)&retstr->var6.size.double height = *((_OWORD *)off_1E5DAAFE8 + 8);
  retstr->var7.double height = *((CGFloat *)off_1E5DAAFE8 + 18);
  long long v8 = *((_OWORD *)off_1E5DAAFE8 + 3);
  *(_OWORD *)&retstr->var2.double height = *((_OWORD *)off_1E5DAAFE8 + 2);
  *(_OWORD *)&retstr->var3.b = v8;
  long long v9 = *((_OWORD *)off_1E5DAAFE8 + 5);
  *(_OWORD *)&retstr->var3.d = *((_OWORD *)off_1E5DAAFE8 + 4);
  *(_OWORD *)&retstr->var3.tdouble y = v9;
  long long v10 = *((_OWORD *)off_1E5DAAFE8 + 1);
  *(_OWORD *)&retstr->var0 = *(_OWORD *)off_1E5DAAFE8;
  *(_OWORD *)&retstr->var1.double y = v10;
  unint64_t v11 = objc_msgSend(v6, "px_section");
  if (v11 < [(NSArray *)self->_sections count])
  {
    uint64_t v12 = [(NSArray *)self->_sections objectAtIndexedSubscript:v11];
    unint64_t v13 = objc_msgSend(v6, "px_item");
    uint64_t v14 = objc_msgSend(v12, "geometriesWithKind:", objc_msgSend(v6, "px_kind"));
    if (v13 < [v14 count])
    {
      if (v14)
      {
        [v14 geometryAtIndex:v13];
      }
      else
      {
        CGFloat v25 = 0.0;
        long long v23 = 0u;
        long long v24 = 0u;
        long long v21 = 0u;
        long long v22 = 0u;
        long long v19 = 0u;
        long long v20 = 0u;
        long long v17 = 0u;
        long long v18 = 0u;
        long long v16 = 0u;
      }
      *(_OWORD *)&retstr->var5 = v22;
      *(_OWORD *)&retstr->var6.origin.double y = v23;
      *(_OWORD *)&retstr->var6.size.double height = v24;
      retstr->var7.double height = v25;
      *(_OWORD *)&retstr->var2.double height = v18;
      *(_OWORD *)&retstr->var3.b = v19;
      *(_OWORD *)&retstr->var3.d = v20;
      *(_OWORD *)&retstr->var3.tdouble y = v21;
      *(_OWORD *)&retstr->var0 = v16;
      *(_OWORD *)&retstr->var1.double y = v17;
      objc_msgSend(v12, "frame", v16, v17, v18, v19, v20, v21, v22, v23, v24, *(void *)&v25);
      PXPointAdd();
    }
  }
  return result;
}

- (id)description
{
  v6.receiver = self;
  v6.super_class = (Class)PXSectionedLayoutSnapshot;
  v3 = [(PXLayoutSnapshot *)&v6 description];
  v4 = [v3 stringByAppendingFormat:@"contents:%@", self->_sections];

  return v4;
}

- (PXSectionedLayoutSnapshot)initWithContentRect:(CGRect)a3 forSections:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v9 = a4;
  v16.receiver = self;
  v16.super_class = (Class)PXSectionedLayoutSnapshot;
  long long v10 = -[PXLayoutSnapshot initWithContentRect:](&v16, sel_initWithContentRect_, x, y, width, height);
  if (v10)
  {
    uint64_t v11 = [objc_alloc(MEMORY[0x1E4F1C978]) initWithArray:v9 copyItems:1];
    sections = v10->_sections;
    v10->_sections = (NSArray *)v11;

    unint64_t v13 = -[PXLayoutPageMap initWithSources:contentRect:]([PXLayoutPageMap alloc], "initWithSources:contentRect:", v10->_sections, x, y, width, height);
    pageMap = v10->_pageMap;
    v10->_pageMap = v13;
  }
  return v10;
}

- (PXSectionedLayoutSnapshot)initWithContentRect:(CGRect)a3
{
  v5 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXSectionedLayoutSnapshot.m", 38, @"%s is not available as initializer", "-[PXSectionedLayoutSnapshot initWithContentRect:]");

  abort();
}

- (PXSectionedLayoutSnapshot)init
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXSectionedLayoutSnapshot.m", 34, @"%s is not available as initializer", "-[PXSectionedLayoutSnapshot init]");

  abort();
}

+ (id)emptyLayoutSnapshot
{
  if (emptyLayoutSnapshot_onceToken != -1) {
    dispatch_once(&emptyLayoutSnapshot_onceToken, &__block_literal_global_14391);
  }
  v2 = (void *)emptyLayoutSnapshot_emptySnapshot;
  return v2;
}

void __48__PXSectionedLayoutSnapshot_emptyLayoutSnapshot__block_invoke()
{
  v0 = [PXSectionedLayoutSnapshot alloc];
  uint64_t v1 = -[PXSectionedLayoutSnapshot initWithContentRect:forSections:](v0, "initWithContentRect:forSections:", MEMORY[0x1E4F1CBF0], *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  v2 = (void *)emptyLayoutSnapshot_emptySnapshot;
  emptyLayoutSnapshot_emptySnapshot = v1;
}

@end
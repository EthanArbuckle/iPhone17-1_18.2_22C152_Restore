@interface TSDLayoutController
+ (id)allInteractiveLayoutControllers;
+ (void)temporaryLayoutControllerForInfos:(id)a3 useInBlock:(id)a4;
- (BOOL)isLayoutOffscreen;
- (CGRect)rectOfTopLevelLayouts;
- (TSDLayoutController)initWithCanvas:(id)a3;
- (id)ancestorLayoutOfLayout:(id)a3 orDelegateConformingToProtocol:(id)a4;
- (id)canvas;
- (id)layoutForInfo:(id)a3;
- (id)layoutForInfo:(id)a3 childOfLayout:(id)a4;
- (id)layoutGeometryProviderForLayout:(id)a3;
- (id)layoutsForInfo:(id)a3;
- (id)layoutsForInfos:(id)a3;
- (id)layoutsInRect:(CGRect)a3;
- (id)rootLayout;
- (id)sortLayoutsForDependencies:(id)a3;
- (id)validatedLayoutForInfo:(id)a3;
- (id)validatedLayoutForInfo:(id)a3 childOfLayout:(id)a4;
- (id)validatedLayoutsForInfo:(id)a3;
- (void)dealloc;
- (void)i_registerLayout:(id)a3;
- (void)i_removeAllLayouts;
- (void)i_unregisterLayout:(id)a3;
- (void)invalidateChildrenOfLayout:(id)a3;
- (void)invalidateLayout:(id)a3;
- (void)invalidateLayoutForRecreation:(id)a3;
- (void)preregisterLayout:(id)a3;
- (void)setInfos:(id)a3;
- (void)unregisterLayout:(id)a3;
- (void)validateLayoutWithDependencies:(id)a3;
- (void)validateLayouts;
- (void)validateLayouts:(id)a3;
- (void)validateLayoutsWithDependencies:(id)a3;
- (void)validateOrderedLayouts:(id)a3;
@end

@implementation TSDLayoutController

- (TSDLayoutController)initWithCanvas:(id)a3
{
  id v5 = a3;
  v20.receiver = self;
  v20.super_class = (Class)TSDLayoutController;
  v6 = [(TSDLayoutController *)&v20 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->mCanvas, a3);
    v8 = [[TSDRootLayout alloc] initWithLayoutController:v7];
    mRootLayout = v7->mRootLayout;
    v7->mRootLayout = v8;

    v7->mLayoutsByInfo = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, 0, MEMORY[0x263EFFF90]);
    v10 = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
    mInvalidLayouts = v7->mInvalidLayouts;
    v7->mInvalidLayouts = v10;

    v12 = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
    mInvalidChildrenLayouts = v7->mInvalidChildrenLayouts;
    v7->mInvalidChildrenLayouts = v12;

    v14 = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
    mLayoutsNeedingRecreating = v7->mLayoutsNeedingRecreating;
    v7->mLayoutsNeedingRecreating = v14;

    if ([v5 isCanvasInteractive])
    {
      v16 = (void *)TSDLayoutControllerAllInteractiveControllers;
      if (!TSDLayoutControllerAllInteractiveControllers)
      {
        id v17 = objc_alloc_init(MEMORY[0x263F7C870]);
        v18 = (void *)TSDLayoutControllerAllInteractiveControllers;
        TSDLayoutControllerAllInteractiveControllers = (uint64_t)v17;

        v16 = (void *)TSDLayoutControllerAllInteractiveControllers;
      }
      [v16 addObject:v7];
    }
  }

  return v7;
}

- (void)dealloc
{
  mCanvas = self->mCanvas;
  self->mCanvas = 0;

  [(id)TSDLayoutControllerAllInteractiveControllers removeObject:self];
  [(TSDAbstractLayout *)self->mRootLayout setChildren:0];
  mRootLayout = self->mRootLayout;
  self->mRootLayout = 0;

  mInvalidLayouts = self->mInvalidLayouts;
  self->mInvalidLayouts = 0;

  mInvalidChildrenLayouts = self->mInvalidChildrenLayouts;
  self->mInvalidChildrenLayouts = 0;

  mLayoutsNeedingRecreating = self->mLayoutsNeedingRecreating;
  self->mLayoutsNeedingRecreating = 0;

  mLayoutsByInfo = self->mLayoutsByInfo;
  if (mLayoutsByInfo)
  {
    CFRelease(mLayoutsByInfo);
    self->mLayoutsByInfo = 0;
  }
  v9.receiver = self;
  v9.super_class = (Class)TSDLayoutController;
  [(TSDLayoutController *)&v9 dealloc];
}

+ (id)allInteractiveLayoutControllers
{
  return (id)TSDLayoutControllerAllInteractiveControllers;
}

- (id)canvas
{
  return self->mCanvas;
}

- (id)rootLayout
{
  return self->mRootLayout;
}

+ (void)temporaryLayoutControllerForInfos:(id)a3 useInBlock:(id)a4
{
  id v5 = (void (**)(id, void *))a4;
  id v6 = a3;
  id v10 = [[TSDCanvas alloc] initForTemporaryLayout];
  v7 = [v10 layoutController];
  [v7 setInfos:v6];

  v8 = [v10 layoutController];
  [v8 validateLayouts];

  objc_super v9 = [v10 layoutController];
  v5[2](v5, v9);

  [v10 teardown];
}

- (void)setInfos:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v19;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v19 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v18 + 1) + 8 * v10);
        v12 = (void *)MEMORY[0x223CB9570](v7);
        v13 = -[TSDLayoutController layoutsForInfo:](self, "layoutsForInfo:", v11, (void)v18);
        v14 = v13;
        if (v13)
        {
          v15 = [v13 allObjects];
          [v5 addObjectsFromArray:v15];
        }
        else
        {
          v15 = objc_msgSend(objc_alloc((Class)objc_msgSend(v11, "layoutClass")), "initWithInfo:", v11);
          [v5 addObject:v15];
        }

        ++v10;
      }
      while (v8 != v10);
      uint64_t v7 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
      uint64_t v8 = v7;
    }
    while (v7);
  }

  v16 = [(TSDAbstractLayout *)self->mRootLayout children];
  char v17 = [v16 isEqual:v5];

  if ((v17 & 1) == 0)
  {
    [(TSDAbstractLayout *)self->mRootLayout setChildren:v5];
    [(TSDCanvas *)self->mCanvas layoutInvalidated];
  }
  objc_msgSend(v5, "makeObjectsPerformSelector:", sel_updateChildrenFromInfo, (void)v18);
}

- (void)invalidateLayout:(id)a3
{
  if (self->mValidatingLayout != a3)
  {
    -[NSMutableSet addObject:](self->mInvalidLayouts, "addObject:");
    mCanvas = self->mCanvas;
    [(TSDCanvas *)mCanvas layoutInvalidated];
  }
}

- (void)invalidateChildrenOfLayout:(id)a3
{
  [(NSMutableSet *)self->mInvalidChildrenLayouts addObject:a3];
  mCanvas = self->mCanvas;

  [(TSDCanvas *)mCanvas layoutInvalidated];
}

- (void)invalidateLayoutForRecreation:(id)a3
{
  [(NSMutableSet *)self->mLayoutsNeedingRecreating addObject:a3];
  mCanvas = self->mCanvas;

  [(TSDCanvas *)mCanvas layoutInvalidated];
}

- (id)layoutForInfo:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(TSDLayoutController *)self layoutsForInfo:v4];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = 0;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v5);
        }
        v11 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if (!v8 || [*(id *)(*((void *)&v14 + 1) + 8 * i) orderedBefore:v8])
        {
          id v12 = v11;

          uint64_t v8 = v12;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

- (id)layoutsForInfo:(id)a3
{
  CFDictionaryRef mLayoutsByInfo = self->mLayoutsByInfo;
  if (mLayoutsByInfo) {
    CFDictionaryRef mLayoutsByInfo = (const __CFDictionary *)CFDictionaryGetValue(mLayoutsByInfo, a3);
  }

  return mLayoutsByInfo;
}

- (id)layoutsForInfos:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = a3;
  objc_msgSend(MEMORY[0x263EFF9C0], "setWithCapacity:", objc_msgSend(v4, "count"));
  id v16 = (id)objc_claimAutoreleasedReturnValue();
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v18 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = [(TSDLayoutController *)self layoutForInfo:*(void *)(*((void *)&v17 + 1) + 8 * i)];
        objc_opt_class();
        v11 = TSUDynamicCast();
        id v12 = v11;
        if (v11)
        {
          v13 = [v11 partitioner];
          uint64_t v14 = objc_msgSend(v13, "i_layout");

          uint64_t v10 = (void *)v14;
        }
        if (v10) {
          [v16 addObject:v10];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v7);
  }

  return v16;
}

- (id)layoutForInfo:(id)a3 childOfLayout:(id)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v6 = a4;
  [(TSDLayoutController *)self layoutsForInfo:a3];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  id v8 = (id)[v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v8; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v7);
        }
        v11 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        objc_msgSend(v11, "parent", (void)v14);
        id v12 = (id)objc_claimAutoreleasedReturnValue();

        if (v12 == v6)
        {
          id v8 = v11;
          goto LABEL_11;
        }
      }
      id v8 = (id)[v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v8;
}

- (id)layoutsInRect:(CGRect)a3
{
  return -[TSDRootLayout childLayoutsInRect:](self->mRootLayout, "childLayoutsInRect:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (CGRect)rectOfTopLevelLayouts
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  double v3 = *MEMORY[0x263F001A8];
  double v2 = *(double *)(MEMORY[0x263F001A8] + 8);
  double v5 = *(double *)(MEMORY[0x263F001A8] + 16);
  double v4 = *(double *)(MEMORY[0x263F001A8] + 24);
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v6 = [(TSDAbstractLayout *)self->mRootLayout children];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v23;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v23 != v9) {
          objc_enumerationMutation(v6);
        }
        [*(id *)(*((void *)&v22 + 1) + 8 * v10) frameForCulling];
        double v3 = TSDUnionRect(v3, v2, v5, v4, v11, v12, v13, v14);
        double v2 = v15;
        double v5 = v16;
        double v4 = v17;
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v8);
  }

  double v18 = v3;
  double v19 = v2;
  double v20 = v5;
  double v21 = v4;
  result.size.height = v21;
  result.size.width = v20;
  result.origin.y = v19;
  result.origin.x = v18;
  return result;
}

- (void)validateLayouts
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  double v3 = self->mLayoutsNeedingRecreating;
  uint64_t v4 = [(NSMutableSet *)v3 countByEnumeratingWithState:&v34 objects:v39 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v35;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v35 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v34 + 1) + 8 * v7);
        uint64_t v9 = (void *)MEMORY[0x223CB9570]();
        uint64_t v10 = [v8 info];
        id v11 = objc_alloc((Class)[v10 layoutClass]);
        double v12 = [v8 info];
        double v13 = (void *)[v11 initWithInfo:v12];

        [(NSMutableSet *)self->mInvalidLayouts removeObject:v8];
        [(NSMutableSet *)self->mInvalidLayouts addObject:v13];
        double v14 = [v8 parent];
        [v14 replaceChild:v8 with:v13];

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [(NSMutableSet *)v3 countByEnumeratingWithState:&v34 objects:v39 count:16];
    }
    while (v5);
  }

  [(NSMutableSet *)self->mLayoutsNeedingRecreating removeAllObjects];
  if ([(NSMutableSet *)self->mInvalidChildrenLayouts count])
  {
    double v15 = (void *)[(NSMutableSet *)self->mInvalidChildrenLayouts copy];
    [(NSMutableSet *)self->mInvalidChildrenLayouts removeAllObjects];
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id v16 = v15;
    uint64_t v17 = [v16 countByEnumeratingWithState:&v30 objects:v38 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v31;
      do
      {
        uint64_t v20 = 0;
        do
        {
          if (*(void *)v31 != v19) {
            objc_enumerationMutation(v16);
          }
          [*(id *)(*((void *)&v30 + 1) + 8 * v20++) updateChildrenFromInfo];
        }
        while (v18 != v20);
        uint64_t v18 = [v16 countByEnumeratingWithState:&v30 objects:v38 count:16];
      }
      while (v18);
    }

    if ([(NSMutableSet *)self->mInvalidChildrenLayouts intersectsSet:v16])
    {
      double v21 = [MEMORY[0x263F7C7F0] currentHandler];
      long long v22 = [NSString stringWithUTF8String:"-[TSDLayoutController validateLayouts]"];
      long long v23 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDLayoutController.m"];
      [v21 handleFailureInFunction:v22, v23, 259, @"one of these layouts had invalidateChildren while updating: %@", self->mInvalidChildrenLayouts file lineNumber description];
    }
  }
  while ([(NSMutableSet *)self->mInvalidLayouts count])
  {
    long long v24 = self->mInvalidLayouts;
    long long v25 = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
    mInvalidLayouts = self->mInvalidLayouts;
    self->mInvalidLayouts = v25;

    [(TSDLayoutController *)self validateLayouts:v24];
    if ([(NSMutableSet *)self->mInvalidLayouts intersectsSet:v24])
    {
      uint64_t v27 = [MEMORY[0x263F7C7F0] currentHandler];
      v28 = [NSString stringWithUTF8String:"-[TSDLayoutController validateLayouts]"];
      v29 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDLayoutController.m"];
      [v27 handleFailureInFunction:v28, v29, 271, @"one of these layouts was invalidated while validating: %@", self->mInvalidLayouts file lineNumber description];
    }
  }
}

- (id)sortLayoutsForDependencies:(id)a3
{
  uint64_t v94 = *MEMORY[0x263EF8340];
  id v3 = a3;
  uint64_t v4 = (void *)[v3 mutableCopy];
  objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  id v56 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = objc_msgSend(objc_alloc(MEMORY[0x263F7C8A8]), "initWithCapacity:", objc_msgSend(v3, "count"));
  v59 = v3;
  uint64_t v6 = objc_msgSend(objc_alloc(MEMORY[0x263F7C8A8]), "initWithCapacity:", objc_msgSend(v3, "count"));
  long long v84 = 0u;
  long long v85 = 0u;
  long long v86 = 0u;
  long long v87 = 0u;
  id v7 = v4;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v84 objects:v93 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v85;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v85 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v84 + 1) + 8 * i);
        double v13 = [MEMORY[0x263EFF9C0] set];
        [v5 setObject:v13 forUncopiedKey:v12];

        double v14 = [MEMORY[0x263EFF9C0] set];
        [v6 setObject:v14 forUncopiedKey:v12];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v84 objects:v93 count:16];
    }
    while (v9);
  }

  long long v82 = 0u;
  long long v83 = 0u;
  long long v80 = 0u;
  long long v81 = 0u;
  obuint64_t j = v7;
  uint64_t v60 = [obj countByEnumeratingWithState:&v80 objects:v92 count:16];
  if (v60)
  {
    uint64_t v58 = *(void *)v81;
    do
    {
      for (uint64_t j = 0; j != v60; ++j)
      {
        if (*(void *)v81 != v58) {
          objc_enumerationMutation(obj);
        }
        id v16 = *(void **)(*((void *)&v80 + 1) + 8 * j);
        uint64_t v17 = (void *)MEMORY[0x263EFF9C0];
        uint64_t v18 = [v16 dependentLayouts];
        uint64_t v19 = [v17 setWithArray:v18];

        uint64_t v20 = (void *)MEMORY[0x263EFF9C0];
        double v21 = [v16 reliedOnLayouts];
        long long v22 = [v20 setWithSet:v21];

        [v22 intersectSet:v59];
        [v19 intersectSet:v59];
        v62 = [v6 objectForKey:v16];
        [v62 unionSet:v19];
        long long v78 = 0u;
        long long v79 = 0u;
        long long v76 = 0u;
        long long v77 = 0u;
        id v23 = v22;
        uint64_t v24 = [v23 countByEnumeratingWithState:&v76 objects:v91 count:16];
        if (v24)
        {
          uint64_t v25 = v24;
          uint64_t v26 = *(void *)v77;
          do
          {
            for (uint64_t k = 0; k != v25; ++k)
            {
              if (*(void *)v77 != v26) {
                objc_enumerationMutation(v23);
              }
              v28 = [v6 objectForKey:*(void *)(*((void *)&v76 + 1) + 8 * k)];
              [v28 addObject:v16];
            }
            uint64_t v25 = [v23 countByEnumeratingWithState:&v76 objects:v91 count:16];
          }
          while (v25);
        }

        v61 = [v5 objectForKey:v16];
        [v61 unionSet:v23];
        long long v74 = 0u;
        long long v75 = 0u;
        long long v72 = 0u;
        long long v73 = 0u;
        id v29 = v19;
        uint64_t v30 = [v29 countByEnumeratingWithState:&v72 objects:v90 count:16];
        if (v30)
        {
          uint64_t v31 = v30;
          uint64_t v32 = *(void *)v73;
          do
          {
            for (uint64_t m = 0; m != v31; ++m)
            {
              if (*(void *)v73 != v32) {
                objc_enumerationMutation(v29);
              }
              long long v34 = [v5 objectForKey:*(void *)(*((void *)&v72 + 1) + 8 * m)];
              [v34 addObject:v16];
            }
            uint64_t v31 = [v29 countByEnumeratingWithState:&v72 objects:v90 count:16];
          }
          while (v31);
        }
      }
      uint64_t v60 = [obj countByEnumeratingWithState:&v80 objects:v92 count:16];
    }
    while (v60);
  }

  long long v35 = [MEMORY[0x263EFF9C0] set];
  long long v68 = 0u;
  long long v69 = 0u;
  long long v70 = 0u;
  long long v71 = 0u;
  id v36 = obj;
  uint64_t v37 = [v36 countByEnumeratingWithState:&v68 objects:v89 count:16];
  if (v37)
  {
    uint64_t v38 = v37;
    uint64_t v39 = *(void *)v69;
    do
    {
      for (uint64_t n = 0; n != v38; ++n)
      {
        if (*(void *)v69 != v39) {
          objc_enumerationMutation(v36);
        }
        uint64_t v41 = *(void *)(*((void *)&v68 + 1) + 8 * n);
        v42 = [v5 objectForKey:v41];
        if (![v42 count]) {
          [v35 addObject:v41];
        }
      }
      uint64_t v38 = [v36 countByEnumeratingWithState:&v68 objects:v89 count:16];
    }
    while (v38);
  }

  if ([v36 count])
  {
    v63 = v36;
    while ([v35 count])
    {
      v43 = [v35 anyObject];
      [v35 removeObject:v43];
      [v36 removeObject:v43];
      [v56 addObject:v43];
      long long v66 = 0u;
      long long v67 = 0u;
      long long v64 = 0u;
      long long v65 = 0u;
      v44 = [v6 objectForKey:v43];
      uint64_t v45 = [v44 countByEnumeratingWithState:&v64 objects:v88 count:16];
      if (v45)
      {
        uint64_t v46 = v45;
        uint64_t v47 = *(void *)v65;
        do
        {
          for (iuint64_t i = 0; ii != v46; ++ii)
          {
            if (*(void *)v65 != v47) {
              objc_enumerationMutation(v44);
            }
            uint64_t v49 = *(void *)(*((void *)&v64 + 1) + 8 * ii);
            v50 = [v5 objectForKey:v49];
            if ([v50 count] == 1) {
              [v35 addObject:v49];
            }
            else {
              [v50 removeObject:v43];
            }
          }
          uint64_t v46 = [v44 countByEnumeratingWithState:&v64 objects:v88 count:16];
        }
        while (v46);
      }

      id v36 = v63;
      if (![v63 count]) {
        goto LABEL_54;
      }
    }
    v51 = [MEMORY[0x263F7C7F0] currentHandler];
    v52 = [NSString stringWithUTF8String:"-[TSDLayoutController sortLayoutsForDependencies:]"];
    v53 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDLayoutController.m"];
    [v51 handleFailureInFunction:v52 file:v53 lineNumber:334 description:@"Layout dependency loop"];

    v54 = [v36 allObjects];
    [v56 addObjectsFromArray:v54];
  }
LABEL_54:

  return v56;
}

- (void)validateOrderedLayouts:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if ([v9 shouldValidate])
        {
          objc_storeStrong((id *)&self->mValidatingLayout, v9);
          [v9 validate];
          mValidatingLayout = self->mValidatingLayout;
          self->mValidatingLayout = 0;

          [(NSMutableSet *)self->mInvalidLayouts removeObject:v9];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }
}

- (void)validateLayouts:(id)a3
{
  id v4 = [(TSDLayoutController *)self sortLayoutsForDependencies:a3];
  [(TSDLayoutController *)self validateOrderedLayouts:v4];
}

- (void)validateLayoutsWithDependencies:(id)a3
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v22 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  obuint64_t j = v4;
  uint64_t v23 = [obj countByEnumeratingWithState:&v29 objects:v34 count:16];
  if (v23)
  {
    uint64_t v21 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v23; ++i)
      {
        if (*(void *)v30 != v21) {
          objc_enumerationMutation(obj);
        }
        uint64_t v6 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        context = (void *)MEMORY[0x223CB9570]();
        id v7 = objc_alloc_init(MEMORY[0x263EFF9C0]);
        do
        {
          [v7 removeAllObjects];
          objc_msgSend(v6, "i_accumulateLayoutsIntoSet:", v7);
          if (![(NSMutableSet *)self->mInvalidChildrenLayouts count]) {
            break;
          }
          long long v27 = 0u;
          long long v28 = 0u;
          long long v25 = 0u;
          long long v26 = 0u;
          id v8 = v7;
          uint64_t v9 = [v8 countByEnumeratingWithState:&v25 objects:v33 count:16];
          if (!v9)
          {

            break;
          }
          uint64_t v10 = v9;
          char v11 = 0;
          uint64_t v12 = *(void *)v26;
          do
          {
            for (uint64_t j = 0; j != v10; ++j)
            {
              if (*(void *)v26 != v12) {
                objc_enumerationMutation(v8);
              }
              long long v14 = *(void **)(*((void *)&v25 + 1) + 8 * j);
              if ([(NSMutableSet *)self->mInvalidChildrenLayouts containsObject:v14])
              {
                [v14 updateChildrenFromInfo];
                [(NSMutableSet *)self->mInvalidChildrenLayouts removeObject:v14];
                char v11 = 1;
              }
            }
            uint64_t v10 = [v8 countByEnumeratingWithState:&v25 objects:v33 count:16];
          }
          while (v10);
        }
        while ((v11 & 1) != 0);
        [v22 unionSet:v7];
      }
      uint64_t v23 = [obj countByEnumeratingWithState:&v29 objects:v34 count:16];
    }
    while (v23);
  }

  [(TSDLayoutController *)self validateLayouts:v22];
  uint64_t v15 = [(TSDCanvas *)self->mCanvas delegate];
  if (v15)
  {
    uint64_t v16 = (void *)v15;
    uint64_t v17 = [(TSDCanvas *)self->mCanvas delegate];
    char v18 = objc_opt_respondsToSelector();

    if (v18)
    {
      uint64_t v19 = [(TSDCanvas *)self->mCanvas delegate];
      [v19 canvasDidValidateLayoutsWithDependencies:self->mCanvas];
    }
  }
}

- (void)validateLayoutWithDependencies:(id)a3
{
  id v4 = [MEMORY[0x263EFFA08] setWithObject:a3];
  [(TSDLayoutController *)self validateLayoutsWithDependencies:v4];
}

- (id)validatedLayoutForInfo:(id)a3
{
  id v3 = [(TSDLayoutController *)self validatedLayoutsForInfo:a3];
  id v4 = [v3 anyObject];

  return v4;
}

- (id)validatedLayoutsForInfo:(id)a3
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(TSDLayoutController *)self layoutsForInfo:v4];
  if (!v5)
  {
    uint64_t v6 = objc_msgSend(objc_alloc((Class)objc_msgSend(v4, "layoutClass")), "initWithInfo:", v4);
    if (v6)
    {
      uint64_t v5 = [MEMORY[0x263EFFA08] setWithObject:v6];
      [(TSDAbstractLayout *)self->mRootLayout addChild:v6];
      [(NSMutableSet *)self->mInvalidChildrenLayouts addObject:v6];
      [(NSMutableSet *)self->mInvalidLayouts addObject:v6];
    }
    else
    {
      uint64_t v5 = 0;
    }
  }
  if ([(NSMutableSet *)self->mInvalidChildrenLayouts intersectsSet:v5])
  {
    [v5 makeObjectsPerformSelector:sel_updateChildrenFromInfo];
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v7 = v5;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v22 objects:v27 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v23;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v23 != v10) {
            objc_enumerationMutation(v7);
          }
          [(NSMutableSet *)self->mInvalidChildrenLayouts removeObject:*(void *)(*((void *)&v22 + 1) + 8 * i)];
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v22 objects:v27 count:16];
      }
      while (v9);
    }
  }
  if ([(NSMutableSet *)self->mInvalidLayouts intersectsSet:v5])
  {
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v12 = v5;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v18 objects:v26 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v19;
      do
      {
        for (uint64_t j = 0; j != v14; ++j)
        {
          if (*(void *)v19 != v15) {
            objc_enumerationMutation(v12);
          }
          -[TSDLayoutController validateLayoutWithDependencies:](self, "validateLayoutWithDependencies:", *(void *)(*((void *)&v18 + 1) + 8 * j), (void)v18);
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v18 objects:v26 count:16];
      }
      while (v14);
    }
  }

  return v5;
}

- (id)validatedLayoutForInfo:(id)a3 childOfLayout:(id)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v6 = a4;
  [(TSDLayoutController *)self validatedLayoutsForInfo:a3];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  id v8 = (id)[v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v8; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v7);
        }
        char v11 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        objc_msgSend(v11, "parent", (void)v14);
        id v12 = (id)objc_claimAutoreleasedReturnValue();

        if (v12 == v6)
        {
          id v8 = v11;
          goto LABEL_11;
        }
      }
      id v8 = (id)[v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v8;
}

- (void)i_registerLayout:(id)a3
{
  id value = a3;
  [value willBeAddedToLayoutController:self];
  if (value && self->mLayoutsByInfo)
  {
    id v4 = [value info];
    if (v4)
    {
      uint64_t v5 = (__CFSet *)CFDictionaryGetValue(self->mLayoutsByInfo, v4);
      if (v5)
      {
        CFMutableSetRef Mutable = v5;
        CFRetain(v5);
      }
      else
      {
        CFMutableSetRef Mutable = CFSetCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, 0);
        CFDictionarySetValue(self->mLayoutsByInfo, v4, Mutable);
      }
      CFSetAddValue(Mutable, value);
      CFRelease(Mutable);
    }
    id v7 = [(TSDCanvas *)self->mCanvas canvasController];
    objc_msgSend(v7, "i_layoutRegistered:", value);
  }
  [(TSDCanvas *)self->mCanvas layoutInvalidated];
  [value wasAddedToLayoutController:self];
}

- (void)i_unregisterLayout:(id)a3
{
  id value = a3;
  [value willBeRemovedFromLayoutController:self];
  if (value && self->mLayoutsByInfo)
  {
    id v4 = [value info];
    if (v4)
    {
      uint64_t v5 = (__CFSet *)CFDictionaryGetValue(self->mLayoutsByInfo, v4);
      if (v5)
      {
        CFSetRef v6 = v5;
        CFSetRemoveValue(v5, value);
        if (!CFSetGetCount(v6)) {
          CFDictionaryRemoveValue(self->mLayoutsByInfo, v4);
        }
      }
    }
    id v7 = [(TSDCanvas *)self->mCanvas canvasController];
    objc_msgSend(v7, "i_layoutUnregistered:", value);
  }
  [(TSDCanvas *)self->mCanvas layoutInvalidated];
  [(NSMutableSet *)self->mInvalidLayouts removeObject:value];
  [(NSMutableSet *)self->mInvalidChildrenLayouts removeObject:value];
  [value wasRemovedFromLayoutController:self];
}

- (void)i_removeAllLayouts
{
  mRootLayout = self->mRootLayout;
  id v4 = [MEMORY[0x263EFF8C0] array];
  [(TSDAbstractLayout *)mRootLayout setChildren:v4];

  CFDictionaryRemoveAllValues(self->mLayoutsByInfo);
  [(NSMutableSet *)self->mInvalidLayouts removeAllObjects];
  mInvalidChildrenLayouts = self->mInvalidChildrenLayouts;

  [(NSMutableSet *)mInvalidChildrenLayouts removeAllObjects];
}

- (id)layoutGeometryProviderForLayout:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 parent];
  if (v5)
  {
    CFSetRef v6 = (void *)v5;
    while (1)
    {
      uint64_t v7 = TSUProtocolCast();
      if (v7) {
        break;
      }
      uint64_t v8 = [v6 parent];

      CFSetRef v6 = (void *)v8;
      if (!v8) {
        goto LABEL_5;
      }
    }
    uint64_t v10 = (void *)v7;
  }
  else
  {
LABEL_5:
    uint64_t v9 = [(TSDLayoutController *)self canvas];
    uint64_t v10 = [v9 layoutGeometryProviderForLayout:v4];

    CFSetRef v6 = 0;
  }

  return v10;
}

- (id)ancestorLayoutOfLayout:(id)a3 orDelegateConformingToProtocol:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    uint64_t v8 = [v6 parent];
    if (v8)
    {
      uint64_t v9 = (void *)v8;
      while (1)
      {
        uint64_t v10 = [v9 delegateConformingToProtocol:v7 forLayout:v6];
        if (v10)
        {
          id v12 = (void *)v10;
          id v11 = v9;
          goto LABEL_16;
        }
        if ([v9 conformsToProtocol:v7]) {
          break;
        }
        id v11 = [v9 parent];

        uint64_t v9 = v11;
        if (!v11) {
          goto LABEL_10;
        }
      }
      id v11 = v9;
      id v12 = v11;
    }
    else
    {
      id v11 = 0;
LABEL_10:
      uint64_t v13 = [(TSDLayoutController *)self canvas];
      long long v14 = [v13 canvasController];

      long long v15 = [v14 delegate];
      if (objc_opt_respondsToSelector())
      {
        id v12 = [v15 interactiveCanvasController:v14 delegateConformingToProtocol:v7 forLayout:v6];
      }
      else
      {
        id v12 = 0;
      }
    }
LABEL_16:
  }
  else
  {
    id v12 = 0;
  }

  return v12;
}

- (void)preregisterLayout:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  [(TSDLayoutController *)self i_registerLayout:v4];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v5 = objc_msgSend(v4, "children", 0);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        [(TSDLayoutController *)self preregisterLayout:*(void *)(*((void *)&v10 + 1) + 8 * v9++)];
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void)unregisterLayout:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  [(TSDLayoutController *)self i_unregisterLayout:v4];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v5 = objc_msgSend(v4, "children", 0);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        [(TSDLayoutController *)self unregisterLayout:*(void *)(*((void *)&v10 + 1) + 8 * v9++)];
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mValidatingLayout, 0);
  objc_storeStrong((id *)&self->mInvalidChildrenLayouts, 0);
  objc_storeStrong((id *)&self->mLayoutsNeedingRecreating, 0);
  objc_storeStrong((id *)&self->mInvalidLayouts, 0);
  objc_storeStrong((id *)&self->mRootLayout, 0);

  objc_storeStrong((id *)&self->mCanvas, 0);
}

- (BOOL)isLayoutOffscreen
{
  return 0;
}

@end
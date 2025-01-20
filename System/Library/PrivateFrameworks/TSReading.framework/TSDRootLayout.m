@interface TSDRootLayout
- (BOOL)isRootLayoutForInspectorGeometry;
- (BOOL)providesGuidesForChildLayouts;
- (CGPoint)applyAdaptiveLayoutTo:(id)a3 info:(id)a4 offset:(CGPoint)a5;
- (TSDRootLayout)initWithLayoutController:(id)a3;
- (id)childLayoutsInRect:(CGRect)a3;
- (id)layoutController;
- (id)p_shiftedObjects;
- (void)beginDynamicAdaptiveLayout;
- (void)dealloc;
- (void)endDynamicAdaptiveLayout;
@end

@implementation TSDRootLayout

- (TSDRootLayout)initWithLayoutController:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)TSDRootLayout;
  result = [(TSDAbstractLayout *)&v5 init];
  if (result)
  {
    result->mLayoutController = (TSDLayoutController *)a3;
    result->mSupportsAdaptiveLayout = 0;
    result->mShiftedObjects = 0;
  }
  return result;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)TSDRootLayout;
  [(TSDAbstractLayout *)&v3 dealloc];
}

- (id)layoutController
{
  return self->mLayoutController;
}

- (id)childLayoutsInRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v8 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  v9 = [(TSDAbstractLayout *)self children];
  uint64_t v10 = [(NSArray *)v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v16;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v16 != v12) {
          objc_enumerationMutation(v9);
        }
        objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * v13++), "addLayoutsInRect:toArray:deep:", v8, 0, x, y, width, height);
      }
      while (v11 != v13);
      uint64_t v11 = [(NSArray *)v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v11);
  }
  return v8;
}

- (BOOL)providesGuidesForChildLayouts
{
  return 1;
}

- (BOOL)isRootLayoutForInspectorGeometry
{
  return 1;
}

- (id)p_shiftedObjects
{
  if (!self->mSupportsAdaptiveLayout) {
    return 0;
  }
  id result = self->mShiftedObjects;
  if (!result)
  {
    id result = objc_alloc_init(MEMORY[0x263F7C8A8]);
    self->mShiftedObjects = (TSUPointerKeyDictionary *)result;
  }
  return result;
}

- (void)beginDynamicAdaptiveLayout
{
  self->mSupportsAdaptiveLayout = objc_msgSend(-[TSDLayoutController canvas](self->mLayoutController, "canvas"), "supportsAdaptiveLayout");
}

- (void)endDynamicAdaptiveLayout
{
  if (self->mSupportsAdaptiveLayout)
  {
    objc_super v3 = self->mShiftedObjects;
    self->mShiftedObjects = 0;
  }
}

- (CGPoint)applyAdaptiveLayoutTo:(id)a3 info:(id)a4 offset:(CGPoint)a5
{
  double y = a5.y;
  double x = a5.x;
  if (!self->mSupportsAdaptiveLayout)
  {
    uint64_t v10 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v11 = [NSString stringWithUTF8String:"-[TSDRootLayout applyAdaptiveLayoutTo:info:offset:]"];
    objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", v11, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDRootLayout.m"), 128, @"should not use this API");
  }
  objc_opt_class();
  uint64_t v12 = (void *)TSUDynamicCast();
  if (a3)
  {
    if ((TSDRootLayout *)[a3 parent] != self)
    {
      uint64_t v13 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
      uint64_t v14 = [NSString stringWithUTF8String:"-[TSDRootLayout applyAdaptiveLayoutTo:info:offset:]"];
      objc_msgSend(v13, "handleFailureInFunction:file:lineNumber:description:", v14, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDRootLayout.m"), 135, @"unexpected layout being shifted");
    }
    if ((void *)[a3 info] != v12)
    {
      long long v15 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
      uint64_t v16 = [NSString stringWithUTF8String:"-[TSDRootLayout applyAdaptiveLayoutTo:info:offset:]"];
      objc_msgSend(v15, "handleFailureInFunction:file:lineNumber:description:", v16, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDRootLayout.m"), 137, @"layout's info didn't match passed in info");
    }
  }
  double v18 = *MEMORY[0x263F00148];
  double v17 = *(double *)(MEMORY[0x263F00148] + 8);
  if (v12 && ([v12 isLocked] & 1) == 0)
  {
    id v19 = [(TSDRootLayout *)self p_shiftedObjects];
    if (!v19)
    {
      uint64_t v20 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
      uint64_t v21 = [NSString stringWithUTF8String:"-[TSDRootLayout applyAdaptiveLayoutTo:info:offset:]"];
      objc_msgSend(v20, "handleFailureInFunction:file:lineNumber:description:", v21, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDRootLayout.m"), 146, @"invalid nil value for '%s'", "shiftedObjects");
    }
    v22 = (void *)[v19 objectForKey:v12];
    double v17 = y;
    double v18 = x;
    if (a3)
    {
      double v17 = y;
      double v18 = x;
      if (v22)
      {
        [v22 CGPointValue];
        double v18 = TSDAddPoints(v23, v24, x);
        double v17 = v25;
      }
    }
    objc_msgSend(v19, "setObject:forUncopiedKey:", objc_msgSend(MEMORY[0x263F08D40], "valueWithCGPoint:", v18, v17), a4);
    if (a3) {
      objc_msgSend(a3, "offsetGeometryBy:", x, y);
    }
  }
  double v26 = v18;
  double v27 = v17;
  result.double y = v27;
  result.double x = v26;
  return result;
}

@end
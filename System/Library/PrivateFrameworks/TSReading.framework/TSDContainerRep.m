@interface TSDContainerRep
- (BOOL)canDrawInParallel;
- (BOOL)canSelectChildRep:(id)a3;
- (BOOL)mustDrawOnMainThreadForInteractiveCanvas;
- (TSDContainerInfo)containerInfo;
- (TSDMutableContainerInfo)mutableContainerInfo;
- (id)childReps;
- (id)hitRep:(CGPoint)a3;
- (id)hitRep:(CGPoint)a3 withGesture:(id)a4 passingTest:(id)a5;
- (id)hitRepChrome:(CGPoint)a3;
- (id)hitRepChrome:(CGPoint)a3 passingTest:(id)a4;
- (id)hitReps:(CGPoint)a3 withSlopBlock:(id)a4;
- (id)visibleChildLayouts;
- (void)addChildRep:(id)a3;
- (void)dealloc;
- (void)drawInContext:(CGContext *)a3;
- (void)insertChildRep:(id)a3 above:(id)a4;
- (void)insertChildRep:(id)a3 atIndex:(unint64_t)a4;
- (void)insertChildRep:(id)a3 below:(id)a4;
- (void)recursivelyPerformSelector:(SEL)a3 withObject:(id)a4 withObject:(id)a5;
- (void)recursivelyPerformSelectorIfImplemented:(SEL)a3 withObject:(id)a4 withObject:(id)a5;
- (void)removeChildRep:(id)a3;
- (void)replaceChildRep:(id)a3 with:(id)a4;
- (void)replaceContentsFromRep:(id)a3;
- (void)selectChildRep:(id)a3;
- (void)setChildReps:(id)a3;
- (void)updateChildrenFromLayout;
- (void)willReplaceContentsFromRep:(id)a3;
@end

@implementation TSDContainerRep

- (void)dealloc
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  mChildReps = self->mChildReps;
  uint64_t v4 = [(NSMutableArray *)mChildReps countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(mChildReps);
        }
        v8 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if ((TSDContainerRep *)[v8 parentRep] != self)
        {
          v9 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
          uint64_t v10 = [NSString stringWithUTF8String:"-[TSDContainerRep dealloc]"];
          objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDContainerRep.m"), 25, @"parentRep not correct");
        }
        [v8 setParentRep:0];
      }
      uint64_t v5 = [(NSMutableArray *)mChildReps countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v5);
  }

  v11.receiver = self;
  v11.super_class = (Class)TSDContainerRep;
  [(TSDRep *)&v11 dealloc];
}

- (TSDContainerInfo)containerInfo
{
  [(TSDRep *)self info];

  return (TSDContainerInfo *)TSUProtocolCast();
}

- (id)childReps
{
  return self->mChildReps;
}

- (BOOL)canSelectChildRep:(id)a3
{
  return 0;
}

- (void)selectChildRep:(id)a3
{
  v3 = objc_msgSend(MEMORY[0x263F7C7F0], "currentHandler", a3);
  uint64_t v4 = [NSString stringWithUTF8String:"-[TSDContainerRep selectChildRep:]"];
  uint64_t v5 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDContainerRep.m"];

  [v3 handleFailureInFunction:v4 file:v5 lineNumber:61 description:@"subclass should override this method"];
}

- (TSDMutableContainerInfo)mutableContainerInfo
{
  [(TSDRep *)self info];

  return (TSDMutableContainerInfo *)TSUProtocolCast();
}

- (void)setChildReps:(id)a3
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  mChildReps = self->mChildReps;
  if (mChildReps != a3 && (-[NSMutableArray isEqual:](mChildReps, "isEqual:") & 1) == 0)
  {
    if (a3) {
      uint64_t v6 = (void *)[objc_alloc(MEMORY[0x263EFFA08]) initWithArray:a3];
    }
    else {
      uint64_t v6 = 0;
    }
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    v7 = self->mChildReps;
    uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v24 objects:v29 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v25;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v25 != v10) {
            objc_enumerationMutation(v7);
          }
          long long v12 = *(void **)(*((void *)&v24 + 1) + 8 * i);
          if (([v6 containsObject:v12] & 1) == 0) {
            [v12 setParentRep:0];
          }
        }
        uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v24 objects:v29 count:16];
      }
      while (v9);
    }

    if (self->mChildReps) {
      long long v13 = (void *)[objc_alloc(MEMORY[0x263EFFA08]) initWithArray:self->mChildReps];
    }
    else {
      long long v13 = 0;
    }
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    uint64_t v14 = [a3 countByEnumeratingWithState:&v20 objects:v28 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v21;
      do
      {
        for (uint64_t j = 0; j != v15; ++j)
        {
          if (*(void *)v21 != v16) {
            objc_enumerationMutation(a3);
          }
          v18 = *(void **)(*((void *)&v20 + 1) + 8 * j);
          if (([v13 containsObject:v18] & 1) == 0)
          {
            [v18 parentRep];
            [(id)TSUProtocolCast() removeChildRep:v18];
            [v18 setParentRep:self];
          }
        }
        uint64_t v15 = [a3 countByEnumeratingWithState:&v20 objects:v28 count:16];
      }
      while (v15);
    }

    v19 = (NSMutableArray *)[a3 mutableCopy];
    self->mChildReps = v19;
  }
}

- (void)addChildRep:(id)a3
{
  mChildReps = self->mChildReps;
  if (mChildReps) {
    uint64_t v6 = [(NSMutableArray *)mChildReps count];
  }
  else {
    uint64_t v6 = 0;
  }

  [(TSDContainerRep *)self insertChildRep:a3 atIndex:v6];
}

- (void)insertChildRep:(id)a3 atIndex:(unint64_t)a4
{
  if (a3)
  {
    uint64_t v6 = [a3 parentRep];
    if (v6)
    {
      id v7 = a3;
      [a3 parentRep];
      [(id)TSUProtocolCast() removeChildRep:a3];
    }
    mChildReps = self->mChildReps;
    if (!mChildReps)
    {
      mChildReps = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
      self->mChildReps = mChildReps;
    }
    [(NSMutableArray *)mChildReps insertObject:a3 atIndex:a4];
    [a3 setParentRep:self];
    if (v6)
    {
    }
  }
}

- (void)insertChildRep:(id)a3 below:(id)a4
{
  mChildReps = self->mChildReps;
  if (mChildReps)
  {
    uint64_t v7 = [(NSMutableArray *)mChildReps indexOfObjectIdenticalTo:a4];
    if (v7 != 0x7FFFFFFFFFFFFFFFLL)
    {
      [(TSDContainerRep *)self insertChildRep:a3 atIndex:v7];
    }
  }
}

- (void)insertChildRep:(id)a3 above:(id)a4
{
  mChildReps = self->mChildReps;
  if (mChildReps)
  {
    uint64_t v7 = [(NSMutableArray *)mChildReps indexOfObjectIdenticalTo:a4];
    if (v7 != 0x7FFFFFFFFFFFFFFFLL)
    {
      [(TSDContainerRep *)self insertChildRep:a3 atIndex:v7 + 1];
    }
  }
}

- (void)removeChildRep:(id)a3
{
}

- (void)replaceChildRep:(id)a3 with:(id)a4
{
  mChildReps = self->mChildReps;
  if (mChildReps)
  {
    uint64_t v8 = -[NSMutableArray indexOfObjectIdenticalTo:](mChildReps, "indexOfObjectIdenticalTo:");
    if (v8 != 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v9 = v8;
      id v10 = a3;
      [(NSMutableArray *)self->mChildReps removeObjectAtIndex:v9];
      [a3 setParentRep:0];

      [(TSDContainerRep *)self insertChildRep:a4 atIndex:v9];
    }
  }
}

- (BOOL)mustDrawOnMainThreadForInteractiveCanvas
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v2 = [(TSDContainerRep *)self childReps];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
    while (2)
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        if ([*(id *)(*((void *)&v8 + 1) + 8 * v6) mustDrawOnMainThreadForInteractiveCanvas])
        {
          LOBYTE(v3) = 1;
          return v3;
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
      uint64_t v4 = v3;
      if (v3) {
        continue;
      }
      break;
    }
  }
  return v3;
}

- (BOOL)canDrawInParallel
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v2 = [(TSDContainerRep *)self childReps];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v10;
LABEL_3:
    uint64_t v6 = 0;
    while (1)
    {
      if (*(void *)v10 != v5) {
        objc_enumerationMutation(v2);
      }
      int v7 = [*(id *)(*((void *)&v9 + 1) + 8 * v6) canDrawInParallel];
      if (!v7) {
        break;
      }
      if (v4 == ++v6)
      {
        uint64_t v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
        if (v4) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    LOBYTE(v7) = 1;
  }
  return v7;
}

- (void)updateChildrenFromLayout
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v4 = [(TSDContainerRep *)self childReps];
  obuint64_t j = [(TSDContainerRep *)self visibleChildLayouts];
  uint64_t v5 = [obj count];
  if (v5 == [v4 count])
  {
    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    uint64_t v6 = [obj countByEnumeratingWithState:&v35 objects:v41 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = 0;
      uint64_t v9 = *(void *)v36;
LABEL_4:
      uint64_t v10 = 0;
      while (1)
      {
        if (*(void *)v36 != v9) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void *)(*((void *)&v35 + 1) + 8 * v10);
        if (objc_msgSend((id)objc_msgSend(v4, "objectAtIndex:", v8 + v10), "layout") != v11) {
          break;
        }
        if (v7 == ++v10)
        {
          uint64_t v7 = [obj countByEnumeratingWithState:&v35 objects:v41 count:16];
          v8 += v10;
          if (v7) {
            goto LABEL_4;
          }
          goto LABEL_10;
        }
      }
    }
    else
    {
LABEL_10:
      long long v33 = 0u;
      long long v34 = 0u;
      long long v31 = 0u;
      long long v32 = 0u;
      uint64_t v12 = [obj countByEnumeratingWithState:&v31 objects:v40 count:16];
      if (!v12) {
        goto LABEL_32;
      }
      uint64_t v13 = v12;
      uint64_t v14 = 0;
      uint64_t v15 = *(void *)v32;
LABEL_12:
      uint64_t v16 = v14;
      v14 += v13;
      while (1)
      {
        if (*(void *)v32 != v15) {
          objc_enumerationMutation(obj);
        }
        if ((TSDContainerRep *)objc_msgSend((id)objc_msgSend(v4, "objectAtIndex:", v16), "parentRep") != self) {
          break;
        }
        ++v16;
        if (!--v13)
        {
          uint64_t v13 = [obj countByEnumeratingWithState:&v31 objects:v40 count:16];
          if (v13) {
            goto LABEL_12;
          }
          goto LABEL_32;
        }
      }
    }
  }
  SEL v24 = a2;
  id v17 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  uint64_t v18 = [obj countByEnumeratingWithState:&v27 objects:v39 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v19; ++i)
      {
        if (*(void *)v28 != v20) {
          objc_enumerationMutation(obj);
        }
        long long v22 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        id v23 = -[TSDCanvas repForLayout:](self->super.mCanvas, "repForLayout:", v22, v24);
        if (v23) {
          goto LABEL_28;
        }
        id v23 = (id)objc_msgSend(objc_alloc((Class)objc_msgSend(v22, "repClassOverride")), "initWithLayout:canvas:", v22, self->super.mCanvas);
        [(TSDCanvas *)self->super.mCanvas delegate];
        if (objc_opt_respondsToSelector()) {
          [(TSDCanvasDelegate *)[(TSDCanvas *)self->super.mCanvas delegate] canvas:self->super.mCanvas willLayoutRep:v23];
        }
        if (v23)
        {
LABEL_28:
          [v17 addObject:v23];
        }
      }
      uint64_t v19 = [obj countByEnumeratingWithState:&v27 objects:v39 count:16];
    }
    while (v19);
  }
  objc_msgSend(v17, "sortUsingComparator:", &__block_literal_global_28, v24);
  [(TSDContainerRep *)self setChildReps:v17];

  a2 = v25;
LABEL_32:
  objc_msgSend(-[TSDContainerRep childReps](self, "childReps"), "makeObjectsPerformSelector:", a2);
}

uint64_t __43__TSDContainerRep_updateChildrenFromLayout__block_invoke()
{
  objc_opt_class();
  v0 = (void *)TSUDynamicCast();
  objc_opt_class();
  v1 = (void *)TSUDynamicCast();
  if [v0 forcesPlacementOnTop] && (objc_msgSend(v1, "forcesPlacementOnTop")) {
    return 0;
  }
  if ([v0 forcesPlacementOnTop]) {
    return 1;
  }
  return [v1 forcesPlacementOnTop] << 63 >> 63;
}

- (id)visibleChildLayouts
{
  id v2 = [(TSDRep *)self layout];

  return [(TSDAbstractLayout *)v2 children];
}

- (void)drawInContext:(CGContext *)a3
{
  CGContextSetFillColorWithColor(a3, (CGColorRef)objc_msgSend((id)objc_msgSend(MEMORY[0x263F7C808], "whiteColor"), "CGColor"));
  [(TSDRep *)self naturalBounds];

  CGContextFillRect(a3, *(CGRect *)&v5);
}

- (void)recursivelyPerformSelectorIfImplemented:(SEL)a3 withObject:(id)a4 withObject:(id)a5
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  v18.receiver = self;
  v18.super_class = (Class)TSDContainerRep;
  -[TSDRep recursivelyPerformSelectorIfImplemented:withObject:withObject:](&v18, sel_recursivelyPerformSelectorIfImplemented_withObject_withObject_);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v9 = [(TSDContainerRep *)self childReps];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v14 objects:v19 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v15;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v15 != v12) {
          objc_enumerationMutation(v9);
        }
        [*(id *)(*((void *)&v14 + 1) + 8 * v13++) recursivelyPerformSelectorIfImplemented:a3 withObject:a4 withObject:a5];
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v14 objects:v19 count:16];
    }
    while (v11);
  }
}

- (void)recursivelyPerformSelector:(SEL)a3 withObject:(id)a4 withObject:(id)a5
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  v18.receiver = self;
  v18.super_class = (Class)TSDContainerRep;
  -[TSDRep recursivelyPerformSelector:withObject:withObject:](&v18, sel_recursivelyPerformSelector_withObject_withObject_);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v9 = [(TSDContainerRep *)self childReps];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v14 objects:v19 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v15;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v15 != v12) {
          objc_enumerationMutation(v9);
        }
        [*(id *)(*((void *)&v14 + 1) + 8 * v13++) recursivelyPerformSelector:a3 withObject:a4 withObject:a5];
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v14 objects:v19 count:16];
    }
    while (v11);
  }
}

- (id)hitRepChrome:(CGPoint)a3 passingTest:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  uint64_t v32 = *MEMORY[0x263EF8340];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  uint64_t v6 = objc_msgSend(-[TSDContainerRep childRepsForHitTesting](self, "childRepsForHitTesting"), "reverseObjectEnumerator");
  uint64_t v7 = [v6 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v28;
    float64x2_t v21 = (float64x2_t)vdupq_lane_s64(*(uint64_t *)&x, 0);
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v28 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        uint64_t v12 = objc_msgSend((id)objc_msgSend(v11, "layout"), "geometry");
        if (v12)
        {
          [v12 inverseTransform];
          float64x2_t v13 = v24;
          float64x2_t v14 = v25;
          float64x2_t v15 = v26;
        }
        else
        {
          float64x2_t v25 = 0u;
          float64x2_t v26 = 0u;
          float64x2_t v15 = 0uLL;
          float64x2_t v13 = 0uLL;
          float64x2_t v14 = 0uLL;
          float64x2_t v24 = 0u;
        }
        long long v16 = objc_msgSend(v11, "hitRepChrome:passingTest:", a4, vaddq_f64(v15, vmlaq_f64(vmulq_n_f64(v14, y), v21, v13)));
        if (v16) {
          return v16;
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v27 objects:v31 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
  v23.receiver = self;
  v23.super_class = (Class)TSDContainerRep;
  id v17 = -[TSDRep hitRepChrome:](&v23, sel_hitRepChrome_, x, y);
  objc_super v18 = v17;
  if (a4 && v17 && !(*((unsigned int (**)(id, id))a4 + 2))(a4, v17)) {
    return 0;
  }
  return v18;
}

- (id)hitRepChrome:(CGPoint)a3
{
  return -[TSDContainerRep hitRepChrome:passingTest:](self, "hitRepChrome:passingTest:", 0, a3.x, a3.y);
}

- (id)hitRep:(CGPoint)a3 withGesture:(id)a4 passingTest:(id)a5
{
  double y = a3.y;
  double x = a3.x;
  uint64_t v34 = *MEMORY[0x263EF8340];
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  uint64_t v8 = objc_msgSend(-[TSDContainerRep childRepsForHitTesting](self, "childRepsForHitTesting"), "reverseObjectEnumerator");
  uint64_t v9 = [v8 countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v30;
    float64x2_t v23 = (float64x2_t)vdupq_lane_s64(*(uint64_t *)&x, 0);
    while (2)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v30 != v11) {
          objc_enumerationMutation(v8);
        }
        float64x2_t v13 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        float64x2_t v14 = objc_msgSend((id)objc_msgSend(v13, "layout"), "geometry");
        if (v14)
        {
          [v14 inverseTransform];
          float64x2_t v15 = v26;
          float64x2_t v16 = v27;
          float64x2_t v17 = v28;
        }
        else
        {
          float64x2_t v27 = 0u;
          float64x2_t v28 = 0u;
          float64x2_t v17 = 0uLL;
          float64x2_t v15 = 0uLL;
          float64x2_t v16 = 0uLL;
          float64x2_t v26 = 0u;
        }
        objc_super v18 = objc_msgSend(v13, "hitRep:withGesture:passingTest:", a4, a5, vaddq_f64(v17, vmlaq_f64(vmulq_n_f64(v16, y), v23, v15)));
        if (v18) {
          return v18;
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v29 objects:v33 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }
  v25.receiver = self;
  v25.super_class = (Class)TSDContainerRep;
  id v19 = -[TSDRep hitRep:](&v25, sel_hitRep_, x, y);
  uint64_t v20 = v19;
  if (a5 && v19 && !(*((unsigned int (**)(id, id))a5 + 2))(a5, v19)) {
    return 0;
  }
  return v20;
}

- (id)hitRep:(CGPoint)a3
{
  return -[TSDContainerRep hitRep:withGesture:passingTest:](self, "hitRep:withGesture:passingTest:", 0, 0, a3.x, a3.y);
}

- (id)hitReps:(CGPoint)a3 withSlopBlock:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  uint64_t v32 = *MEMORY[0x263EF8340];
  uint64_t v6 = (void *)[MEMORY[0x263EFF980] array];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  uint64_t v7 = objc_msgSend(-[TSDContainerRep childRepsForHitTesting](self, "childRepsForHitTesting"), "reverseObjectEnumerator");
  uint64_t v8 = [v7 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v28;
    float64x2_t v21 = (float64x2_t)vdupq_lane_s64(*(uint64_t *)&x, 0);
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v28 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        float64x2_t v13 = objc_msgSend((id)objc_msgSend(v12, "layout"), "geometry");
        if (v13)
        {
          [v13 inverseTransform];
          float64x2_t v14 = v24;
          float64x2_t v15 = v25;
          float64x2_t v16 = v26;
        }
        else
        {
          float64x2_t v25 = 0u;
          float64x2_t v26 = 0u;
          float64x2_t v16 = 0uLL;
          float64x2_t v14 = 0uLL;
          float64x2_t v15 = 0uLL;
          float64x2_t v24 = 0u;
        }
        float64x2_t v17 = objc_msgSend(v12, "hitReps:withSlopBlock:", a4, vaddq_f64(v16, vmlaq_f64(vmulq_n_f64(v15, y), v21, v14)));
        if ([v17 count]) {
          [v6 addObjectsFromArray:v17];
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v27 objects:v31 count:16];
    }
    while (v9);
  }
  v23.receiver = self;
  v23.super_class = (Class)TSDContainerRep;
  id v18 = -[TSDRep hitReps:withSlopBlock:](&v23, sel_hitReps_withSlopBlock_, a4, x, y);
  if ([v18 count]) {
    [v6 addObjectsFromArray:v18];
  }
  return v6;
}

- (void)willReplaceContentsFromRep:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  v19.receiver = self;
  v19.super_class = (Class)TSDContainerRep;
  -[TSDRep willReplaceContentsFromRep:](&v19, sel_willReplaceContentsFromRep_);
  objc_opt_class();
  id v4 = (void *)TSUDynamicCast();
  uint64_t v5 = objc_msgSend(-[TSDContainerRep childReps](self, "childReps"), "mutableCopy");
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v6 = objc_msgSend(v4, "childReps", 0);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v15 + 1) + 8 * v10);
        if ([v5 count])
        {
          uint64_t v12 = 0;
          while (1)
          {
            float64x2_t v13 = (void *)[v5 objectAtIndex:v12];
            uint64_t v14 = [v13 info];
            if (v14 == [v11 info]) {
              break;
            }
            if (++v12 >= (unint64_t)[v5 count]) {
              goto LABEL_12;
            }
          }
          [v13 willReplaceContentsFromRep:v11];
          [v5 removeObjectAtIndex:v12];
        }
LABEL_12:
        ++v10;
      }
      while (v10 != v8);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v20 count:16];
    }
    while (v8);
  }
}

- (void)replaceContentsFromRep:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  v19.receiver = self;
  v19.super_class = (Class)TSDContainerRep;
  -[TSDRep replaceContentsFromRep:](&v19, sel_replaceContentsFromRep_);
  objc_opt_class();
  id v4 = (void *)TSUDynamicCast();
  uint64_t v5 = objc_msgSend(-[TSDContainerRep childReps](self, "childReps"), "mutableCopy");
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v6 = objc_msgSend(v4, "childReps", 0);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v15 + 1) + 8 * v10);
        if ([v5 count])
        {
          uint64_t v12 = 0;
          while (1)
          {
            float64x2_t v13 = (void *)[v5 objectAtIndex:v12];
            uint64_t v14 = [v13 info];
            if (v14 == [v11 info]) {
              break;
            }
            if (++v12 >= (unint64_t)[v5 count]) {
              goto LABEL_12;
            }
          }
          [v13 replaceContentsFromRep:v11];
          [v5 removeObjectAtIndex:v12];
        }
LABEL_12:
        ++v10;
      }
      while (v10 != v8);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v20 count:16];
    }
    while (v8);
  }
}

@end
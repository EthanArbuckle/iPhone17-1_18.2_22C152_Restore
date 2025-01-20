@interface TSDGroupLayout
- (BOOL)allowsConnections;
- (BOOL)canAspectRatioLockBeChangedByUser;
- (BOOL)canFlip;
- (BOOL)providesGuidesForChildLayouts;
- (BOOL)resizeMayChangeAspectRatio;
- (BOOL)supportsParentRotation;
- (BOOL)supportsRotation;
- (CGRect)alignmentFrame;
- (CGRect)boundsForStandardKnobs;
- (CGSize)minimumSize;
- (id)additionalDependenciesForChildLayout:(id)a3;
- (id)computeInfoGeometryDuringResize;
- (id)computeLayoutGeometry;
- (id)descendentWrappables;
- (id)i_computeWrapPath;
- (id)i_externalWrapPath;
- (id)i_wrapPath;
- (id)layoutGeometryFromInfo;
- (id)p_childWrapPathsFrom:(id)a3;
- (id)reliedOnLayouts;
- (id)visibleGeometries;
- (int)wrapContainerMode;
- (void)beginDynamicOperation;
- (void)dealloc;
- (void)dragBy:(CGPoint)a3;
- (void)endDynamicOperation;
- (void)invalidate;
- (void)invalidateExteriorWrap;
- (void)p_createDynamicCopies;
- (void)p_destroyDynamicCopies;
- (void)p_invalidateDescendentWrapPaths;
- (void)p_invalidateParentForWrap;
- (void)processChangedProperty:(int)a3;
- (void)setDynamicGeometry:(id)a3;
- (void)setGeometry:(id)a3;
- (void)takeRotationFromTracker:(id)a3;
- (void)wrappableChildInvalidated;
@end

@implementation TSDGroupLayout

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)TSDGroupLayout;
  [(TSDLayout *)&v3 dealloc];
}

- (id)visibleGeometries
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  objc_super v3 = (void *)[MEMORY[0x263EFF980] array];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v26 = 0u;
  v4 = [(TSDAbstractLayout *)self geometry];
  if (v4)
  {
    [(TSDLayoutGeometry *)v4 transform];
  }
  else
  {
    long long v27 = 0u;
    long long v28 = 0u;
    long long v26 = 0u;
  }
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  v5 = [(TSDAbstractLayout *)self children];
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v22 objects:v30 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v23;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v23 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = (void *)[*(id *)(*((void *)&v22 + 1) + 8 * v9) visibleGeometries];
        long long v18 = 0u;
        long long v19 = 0u;
        long long v20 = 0u;
        long long v21 = 0u;
        uint64_t v11 = [v10 countByEnumeratingWithState:&v18 objects:v29 count:16];
        if (v11)
        {
          uint64_t v12 = v11;
          uint64_t v13 = *(void *)v19;
          do
          {
            uint64_t v14 = 0;
            do
            {
              if (*(void *)v19 != v13) {
                objc_enumerationMutation(v10);
              }
              v15 = *(void **)(*((void *)&v18 + 1) + 8 * v14);
              v17[0] = v26;
              v17[1] = v27;
              v17[2] = v28;
              objc_msgSend(v3, "addObject:", objc_msgSend(v15, "geometryByTransformingBy:", v17));
              ++v14;
            }
            while (v12 != v14);
            uint64_t v12 = [v10 countByEnumeratingWithState:&v18 objects:v29 count:16];
          }
          while (v12);
        }
        ++v9;
      }
      while (v9 != v7);
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v22 objects:v30 count:16];
    }
    while (v7);
  }
  return v3;
}

- (id)layoutGeometryFromInfo
{
  id result = self->mDynamicLayoutGeometry;
  if (!result)
  {
    v4 = [[TSDLayoutGeometry alloc] initWithInfoGeometry:[(TSDInfo *)[(TSDLayout *)self info] geometry]];
    return v4;
  }
  return result;
}

- (id)reliedOnLayouts
{
  v2 = (void *)MEMORY[0x263EFFA08];
  objc_super v3 = [(TSDAbstractLayout *)self children];
  return (id)[v2 setWithArray:v3];
}

- (id)additionalDependenciesForChildLayout:(id)a3
{
  v4[1] = *MEMORY[0x263EF8340];
  v4[0] = self;
  return (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:1];
}

- (id)computeLayoutGeometry
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v3 = [(TSDLayout *)self i_layoutGeometryProvider];
  id v4 = (id)[v3 layoutGeometryForLayout:self];
  if (!v4)
  {
    CGFloat x = *MEMORY[0x263F001A0];
    CGFloat y = *(double *)(MEMORY[0x263F001A0] + 8);
    CGFloat width = *(double *)(MEMORY[0x263F001A0] + 16);
    CGFloat height = *(double *)(MEMORY[0x263F001A0] + 24);
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    v10 = [(TSDAbstractLayout *)self children];
    uint64_t v11 = [(NSArray *)v10 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v16;
      do
      {
        uint64_t v14 = 0;
        do
        {
          if (*(void *)v16 != v13) {
            objc_enumerationMutation(v10);
          }
          objc_msgSend((id)objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * v14), "pureGeometry"), "frame");
          v23.origin.CGFloat x = x;
          v23.origin.CGFloat y = y;
          v23.size.CGFloat width = width;
          v23.size.CGFloat height = height;
          CGRect v22 = CGRectUnion(v21, v23);
          CGFloat x = v22.origin.x;
          CGFloat y = v22.origin.y;
          CGFloat width = v22.size.width;
          CGFloat height = v22.size.height;
          ++v14;
        }
        while (v12 != v14);
        uint64_t v12 = [(NSArray *)v10 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v12);
    }
    self->mBoundsForStandardKnobs.origin.CGFloat x = x;
    self->mBoundsForStandardKnobs.origin.CGFloat y = y;
    self->mBoundsForStandardKnobs.size.CGFloat width = width;
    self->mBoundsForStandardKnobs.size.CGFloat height = height;
    id v4 = [(TSDGroupLayout *)self layoutGeometryFromInfo];
    if (v3 && (objc_opt_respondsToSelector() & 1) != 0) {
      return (id)[v3 adjustLayoutGeometry:v4 forLayout:self];
    }
  }
  return v4;
}

- (void)processChangedProperty:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  if (a3 == 514) {
    objc_msgSend(-[TSDLayout layoutController](self, "layoutController"), "invalidateChildrenOfLayout:", self);
  }
  v5.receiver = self;
  v5.super_class = (Class)TSDGroupLayout;
  [(TSDLayout *)&v5 processChangedProperty:v3];
}

- (CGRect)boundsForStandardKnobs
{
  double x = self->mBoundsForStandardKnobs.origin.x;
  double y = self->mBoundsForStandardKnobs.origin.y;
  double width = self->mBoundsForStandardKnobs.size.width;
  double height = self->mBoundsForStandardKnobs.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (CGRect)alignmentFrame
{
  if (self) {
    [(TSDAbstractLayout *)self transform];
  }
  else {
    memset(&v3, 0, sizeof(v3));
  }
  return CGRectApplyAffineTransform(self->mBoundsForStandardKnobs, &v3);
}

- (void)beginDynamicOperation
{
  [(TSDGroupLayout *)self p_createDynamicCopies];
  v3.receiver = self;
  v3.super_class = (Class)TSDGroupLayout;
  [(TSDLayout *)&v3 beginDynamicOperation];
}

- (id)computeInfoGeometryDuringResize
{
  v2 = [(TSDAbstractLayout *)self geometry];
  return [(TSDLayoutGeometry *)v2 infoGeometry];
}

- (void)takeRotationFromTracker:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)TSDGroupLayout;
  -[TSDLayout takeRotationFromTracker:](&v10, sel_takeRotationFromTracker_);
  long long v8 = 0u;
  long long v9 = 0u;
  long long v7 = 0u;
  if (a3) {
    [a3 rotateTransform];
  }
  objc_super v5 = [(TSDLayout *)self originalGeometry];
  v6[0] = v7;
  v6[1] = v8;
  v6[2] = v9;
  [(TSDGroupLayout *)self setDynamicGeometry:[(TSDLayoutGeometry *)v5 geometryByTransformingBy:v6]];
  [(TSDLayout *)self invalidatePosition];
}

- (BOOL)canAspectRatioLockBeChangedByUser
{
  return 0;
}

- (BOOL)resizeMayChangeAspectRatio
{
  return 0;
}

- (CGSize)minimumSize
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  [(TSDLayoutGeometry *)[(TSDAbstractLayout *)self geometry] size];
  double v28 = v3;
  double v5 = v4;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  uint64_t v6 = (void *)[(TSDInfo *)[(TSDLayout *)self info] childInfos];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v31 objects:v35 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v32;
    double v10 = 0.0;
    double v11 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v32 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v13 = objc_msgSend(-[TSDLayout layoutController](self, "layoutController"), "layoutForInfo:childOfLayout:", *(void *)(*((void *)&v31 + 1) + 8 * i), self);
        objc_msgSend((id)objc_msgSend(v13, "geometry"), "size");
        CGFloat v15 = v14;
        CGFloat v17 = v16;
        [v13 minimumSize];
        CGFloat v19 = v18;
        CGFloat v21 = v20;
        CGRect v22 = (void *)[v13 geometry];
        if (v22) {
          [v22 transform];
        }
        else {
          memset(&v30, 0, sizeof(v30));
        }
        v38.origin.double x = 0.0;
        v38.origin.double y = 0.0;
        v38.size.double width = v15;
        v38.size.double height = v17;
        CGRect v39 = CGRectApplyAffineTransform(v38, &v30);
        double width = v39.size.width;
        double height = v39.size.height;
        long long v25 = objc_msgSend(v13, "geometry", v39.origin.x, v39.origin.y);
        if (v25) {
          [v25 transform];
        }
        else {
          memset(&v29, 0, sizeof(v29));
        }
        v40.origin.double x = 0.0;
        v40.origin.double y = 0.0;
        v40.size.double width = v19;
        v40.size.double height = v21;
        CGRect v41 = CGRectApplyAffineTransform(v40, &v29);
        if (width > 1.0) {
          double v11 = fmax(v11, v41.size.width / width);
        }
        if (height > 1.0) {
          double v10 = fmax(v10, v41.size.height / height);
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v31 objects:v35 count:16];
    }
    while (v8);
  }
  else
  {
    double v10 = 0.0;
    double v11 = 0.0;
  }
  double v26 = v28 * v11;
  double v27 = v5 * v10;
  result.double height = v27;
  result.double width = v26;
  return result;
}

- (void)endDynamicOperation
{
  [(TSDGroupLayout *)self p_destroyDynamicCopies];
  v3.receiver = self;
  v3.super_class = (Class)TSDGroupLayout;
  [(TSDLayout *)&v3 endDynamicOperation];
}

- (void)invalidate
{
  v3.receiver = self;
  v3.super_class = (Class)TSDGroupLayout;
  [(TSDLayout *)&v3 invalidate];
  [(TSDGroupLayout *)self p_invalidateParentForWrap];

  self->mCachedWrapPath = 0;
  self->mCachedExternalWrapPath = 0;
  if (([(TSDInfo *)[(TSDLayout *)self info] isInlineWithText] & 1) == 0) {
    *(unsigned char *)&self->super.super.mInvalidFlags |= 3u;
  }
}

- (void)invalidateExteriorWrap
{
  self->mCachedWrapPath = 0;
  self->mCachedExternalWrapPath = 0;
}

- (void)dragBy:(CGPoint)a3
{
  v4.receiver = self;
  v4.super_class = (Class)TSDGroupLayout;
  -[TSDLayout dragBy:](&v4, sel_dragBy_, a3.x, a3.y);
  [(TSDGroupLayout *)self p_invalidateParentForWrap];
}

- (void)setGeometry:(id)a3
{
  double v5 = [(TSDAbstractLayout *)self geometry];
  if (!v5 || ![(TSDLayoutGeometry *)v5 isEqual:a3]) {
    [(TSDGroupLayout *)self p_invalidateDescendentWrapPaths];
  }
  v6.receiver = self;
  v6.super_class = (Class)TSDGroupLayout;
  [(TSDAbstractLayout *)&v6 setGeometry:a3];
}

- (BOOL)providesGuidesForChildLayouts
{
  return 1;
}

- (BOOL)allowsConnections
{
  return 1;
}

- (BOOL)supportsParentRotation
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v2 = [(TSDAbstractLayout *)self children];
  uint64_t v3 = [(NSArray *)v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
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
      int v7 = [*(id *)(*((void *)&v9 + 1) + 8 * v6) supportsParentRotation];
      if (!v7) {
        break;
      }
      if (v4 == ++v6)
      {
        uint64_t v4 = [(NSArray *)v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
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

- (BOOL)supportsRotation
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v2 = [(TSDAbstractLayout *)self children];
  uint64_t v3 = [(NSArray *)v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
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
      int v7 = [*(id *)(*((void *)&v9 + 1) + 8 * v6) supportsParentRotation];
      if (!v7) {
        break;
      }
      if (v4 == ++v6)
      {
        uint64_t v4 = [(NSArray *)v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
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

- (BOOL)canFlip
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v2 = [(TSDAbstractLayout *)self children];
  uint64_t v3 = [(NSArray *)v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
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
      int v7 = [*(id *)(*((void *)&v9 + 1) + 8 * v6) canFlip];
      if (!v7) {
        break;
      }
      if (v4 == ++v6)
      {
        uint64_t v4 = [(NSArray *)v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
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

- (id)p_childWrapPathsFrom:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v5 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v6 = [a3 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v17;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(a3);
        }
        long long v10 = *(void **)(*((void *)&v16 + 1) + 8 * v9);
        objc_opt_class();
        long long v11 = (void *)TSUDynamicCast();
        if (v11)
        {
          long long v12 = v11;
          uint64_t v13 = objc_msgSend((id)objc_msgSend(v11, "i_wrapPath"), "copy");
          [v12 transform];
          [v13 transformUsingAffineTransform:&v15];
          [v5 addObject:v13];
        }
        else if ([v10 conformsToProtocol:&unk_26D79F3A0])
        {
          objc_msgSend(v5, "addObjectsFromArray:", -[TSDGroupLayout p_childWrapPathsFrom:](self, "p_childWrapPathsFrom:", objc_msgSend(v10, "descendentWrappables")));
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [a3 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v7);
  }
  return v5;
}

- (id)i_computeWrapPath
{
  id v2 = [(TSDGroupLayout *)self p_childWrapPathsFrom:[(TSDAbstractLayout *)self children]];
  return +[TSDBezierPath uniteBezierPaths:v2];
}

- (id)i_wrapPath
{
  id result = self->mCachedWrapPath;
  if (!result)
  {
    id result = +[TSDBezierPath uniteBezierPaths:[(TSDGroupLayout *)self p_childWrapPathsFrom:[(TSDAbstractLayout *)self children]]];
    self->mCachedWrapPath = (TSDBezierPath *)result;
  }
  return result;
}

- (id)i_externalWrapPath
{
  id result = self->mCachedExternalWrapPath;
  if (!result)
  {
    id result = +[TSDBezierPath exteriorOfBezierPath:[(TSDGroupLayout *)self i_wrapPath]];
    self->mCachedExternalWrapPath = (TSDBezierPath *)result;
  }
  return result;
}

- (void)wrappableChildInvalidated
{
  self->mCachedWrapPath = 0;
  self->mCachedExternalWrapPath = 0;
}

- (id)descendentWrappables
{
  return +[TSDLayout descendentWrappablesOfLayout:self];
}

- (int)wrapContainerMode
{
  return 0;
}

- (void)p_createDynamicCopies
{
  if (([(TSDInfo *)[(TSDLayout *)self info] isInlineWithText] & 1) == 0)
  {
    if (self->mDynamicLayoutGeometry)
    {
      uint64_t v3 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
      uint64_t v4 = [NSString stringWithUTF8String:"-[TSDGroupLayout p_createDynamicCopies]"];
      objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDGroupLayout.m"), 405, @"expected nil value for '%s'", "mDynamicLayoutGeometry");
    }
    self->mDynamicLayoutGeometrdouble y = (TSDLayoutGeometry *)[(TSDLayoutGeometry *)[(TSDAbstractLayout *)self geometry] copy];
  }
}

- (void)setDynamicGeometry:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)TSDGroupLayout;
  -[TSDLayout setDynamicGeometry:](&v5, sel_setDynamicGeometry_);
  if (([(TSDInfo *)[(TSDLayout *)self info] isInlineWithText] & 1) == 0)
  {

    self->mDynamicLayoutGeometrdouble y = (TSDLayoutGeometry *)[a3 copy];
  }
}

- (void)p_destroyDynamicCopies
{
  if (([(TSDInfo *)[(TSDLayout *)self info] isInlineWithText] & 1) == 0)
  {
    mDynamicLayoutGeometrdouble y = self->mDynamicLayoutGeometry;
    if (!mDynamicLayoutGeometry)
    {
      uint64_t v4 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
      uint64_t v5 = [NSString stringWithUTF8String:"-[TSDGroupLayout p_destroyDynamicCopies]"];
      objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDGroupLayout.m"), 422, @"invalid nil value for '%s'", "mDynamicLayoutGeometry");
      mDynamicLayoutGeometrdouble y = self->mDynamicLayoutGeometry;
    }

    self->mDynamicLayoutGeometrdouble y = 0;
  }
}

- (void)p_invalidateParentForWrap
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  if ([(TSDLayout *)self isBeingManipulated])
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    id v3 = [(TSDGroupLayout *)self descendentWrappables];
    uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v12;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v12 != v6) {
            objc_enumerationMutation(v3);
          }
          uint64_t v8 = *(void **)(*((void *)&v11 + 1) + 8 * i);
          if ([v8 wrapType])
          {
            uint64_t v9 = [v8 parent];
            if (v9)
            {
              long long v10 = (void *)v9;
              while ((objc_opt_respondsToSelector() & 1) == 0)
              {
                long long v10 = (void *)[v10 parent];
                if (!v10) {
                  goto LABEL_14;
                }
              }
              [v10 wrappableChildInvalidated:v8];
            }
          }
LABEL_14:
          ;
        }
        uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v5);
    }
  }
}

- (void)p_invalidateDescendentWrapPaths
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v2 = [(TSDGroupLayout *)self descendentWrappables];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        objc_opt_class();
        uint64_t v7 = (void *)TSUDynamicCast();
        if (v7) {
          [v7 invalidateExteriorWrap];
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }
}

@end
@interface TSDAbstractLayout
- (BOOL)canRotateChildLayout:(id)a3;
- (BOOL)isAxisAlignedUnflippedInRoot;
- (BOOL)isRootLayoutForInspectorGeometry;
- (BOOL)providesGuidesForChildLayouts;
- (BOOL)shouldSnapWhileResizing;
- (BOOL)supportsInspectorPositioning;
- (BOOL)supportsParentRotation;
- (BOOL)supportsResize;
- (BOOL)supportsRotation;
- (CGAffineTransform)transform;
- (CGAffineTransform)transformInParent;
- (CGAffineTransform)transformInRoot;
- (CGRect)alignmentFrame;
- (CGRect)alignmentFrameInRoot;
- (CGRect)frame;
- (CGRect)frameInParent;
- (CGRect)frameInRoot;
- (CGRect)rectInParent:(CGRect)a3;
- (CGRect)rectInRoot:(CGRect)a3;
- (NSArray)children;
- (TSDAbstractLayout)init;
- (TSDAbstractLayout)parent;
- (TSDAbstractLayout)root;
- (TSDLayoutGeometry)geometry;
- (double)interimPositionX;
- (double)interimPositionY;
- (id)additionalDependenciesForChildLayout:(id)a3;
- (id)delegateConformingToProtocol:(id)a3 forLayout:(id)a4;
- (id)geometryInParent;
- (id)geometryInRoot;
- (id)geometryInRoot:(id)a3;
- (id)layoutsForProvidingGuidesForChildLayouts;
- (id)parentLayoutForProvidingGuides;
- (id)visibleGeometries;
- (void)addChild:(id)a3;
- (void)addDescendentLayoutsToArray:(id)a3;
- (void)addLayoutsInRect:(CGRect)a3 toArray:(id)a4 deep:(BOOL)a5;
- (void)addLayoutsToArray:(id)a3;
- (void)dealloc;
- (void)exchangeChildAtIndex:(unint64_t)a3 withChildAtIndex:(unint64_t)a4;
- (void)fixTransformFromInterimPosition;
- (void)fixTransformFromLastInterimPosition;
- (void)insertChild:(id)a3 above:(id)a4;
- (void)insertChild:(id)a3 atIndex:(unint64_t)a4;
- (void)insertChild:(id)a3 below:(id)a4;
- (void)offsetGeometryBy:(CGPoint)a3;
- (void)p_fixTransformFromInterimPosition:(CGPoint)a3 interimPositionXSet:(BOOL)a4 interimPositionYSet:(BOOL)a5;
- (void)removeFromParent;
- (void)replaceChild:(id)a3 with:(id)a4;
- (void)setChildren:(id)a3;
- (void)setGeometry:(id)a3;
- (void)setInterimPositionX:(double)a3;
- (void)setInterimPositionY:(double)a3;
- (void)setParent:(id)a3;
@end

@implementation TSDAbstractLayout

- (TSDAbstractLayout)root
{
  mParent = self->mParent;
  if (mParent) {
    return [(TSDAbstractLayout *)mParent root];
  }
  else {
    return self;
  }
}

- (CGRect)alignmentFrame
{
  v2 = [(TSDAbstractLayout *)self geometry];

  [(TSDLayoutGeometry *)v2 frame];
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (TSDLayoutGeometry)geometry
{
  return self->mGeometry;
}

- (void)setInterimPositionY:(double)a3
{
  self->mInterimPosition.y = a3;
  self->mInterimPositionYSet = 1;
}

- (void)setInterimPositionX:(double)a3
{
  self->mInterimPosition.x = a3;
  self->mInterimPositionXSet = 1;
}

- (void)removeFromParent
{
}

- (TSDAbstractLayout)init
{
  v4.receiver = self;
  v4.super_class = (Class)TSDAbstractLayout;
  v2 = [(TSDAbstractLayout *)&v4 init];
  if (v2) {
    v2->mGeometry = objc_alloc_init(TSDLayoutGeometry);
  }
  return v2;
}

- (void)fixTransformFromInterimPosition
{
  self->mLastInterimPosition = self->mInterimPosition;
  *(_WORD *)&self->mLastInterimPositionXSet = *(_WORD *)&self->mInterimPositionXSet;
  self->mInterimPosition = (CGPoint)*MEMORY[0x263F00148];
  *(_WORD *)&self->mInterimPositionXSet = 0;
}

- (void)setGeometry:(id)a3
{
}

- (void)p_fixTransformFromInterimPosition:(CGPoint)a3 interimPositionXSet:(BOOL)a4 interimPositionYSet:(BOOL)a5
{
  BOOL v5 = a5;
  double y = a3.y;
  double v8 = 0.0;
  double v9 = 0.0;
  if (a4)
  {
    double x = a3.x;
    [(TSDAbstractLayout *)self alignmentFrameOriginForFixingInterimPosition];
    double v9 = x - a3.x;
  }
  if (v5)
  {
    [(TSDAbstractLayout *)self alignmentFrameOriginForFixingInterimPosition];
    double v8 = y - v11;
  }

  -[TSDAbstractLayout offsetGeometryBy:](self, "offsetGeometryBy:", v9, v8);
}

- (void)offsetGeometryBy:(CGPoint)a3
{
  if (a3.x != *MEMORY[0x263F00148] || a3.y != *(double *)(MEMORY[0x263F00148] + 8))
  {
    id v5 = -[TSDLayoutGeometry geometryByTranslatingBy:]([(TSDAbstractLayout *)self geometry], "geometryByTranslatingBy:", a3.x, a3.y);
    [(TSDAbstractLayout *)self setGeometry:v5];
  }
}

- (void)dealloc
{
  [(NSMutableArray *)self->mChildren makeObjectsPerformSelector:sel_setParent_ withObject:0];
  v3.receiver = self;
  v3.super_class = (Class)TSDAbstractLayout;
  [(TSDAbstractLayout *)&v3 dealloc];
}

- (id)geometryInParent
{
  objc_super v3 = (void *)[(TSDLayoutGeometry *)[(TSDAbstractLayout *)self geometry] mutableCopy];
  objc_super v4 = [(TSDAbstractLayout *)self->mParent geometry];
  if (v4) {
    [(TSDLayoutGeometry *)v4 transform];
  }
  else {
    memset(v6, 0, sizeof(v6));
  }
  [v3 transformBy:v6];
  return v3;
}

- (id)geometryInRoot
{
  objc_super v3 = [(TSDAbstractLayout *)self geometry];

  return [(TSDAbstractLayout *)self geometryInRoot:v3];
}

- (id)geometryInRoot:(id)a3
{
  objc_super v4 = (void *)[a3 mutableCopy];
  for (i = self->mParent; i; i = [(TSDAbstractLayout *)i parent])
  {
    double v6 = [(TSDAbstractLayout *)i geometry];
    if (v6)
    {
      [(TSDLayoutGeometry *)v6 transform];
    }
    else
    {
      long long v9 = 0u;
      long long v10 = 0u;
      long long v8 = 0u;
    }
    [v4 transformBy:&v8];
  }
  return v4;
}

- (id)visibleGeometries
{
  v3[1] = *MEMORY[0x263EF8340];
  v3[0] = [(TSDAbstractLayout *)self geometry];
  return (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v3 count:1];
}

- (CGAffineTransform)transform
{
  CGRect result = [(TSDAbstractLayout *)self geometry];
  if (result)
  {
    return (CGAffineTransform *)[(CGAffineTransform *)result transform];
  }
  else
  {
    *(_OWORD *)&retstr->c = 0u;
    *(_OWORD *)&retstr->tdouble x = 0u;
    *(_OWORD *)&retstr->a = 0u;
  }
  return result;
}

- (CGAffineTransform)transformInParent
{
  id v5 = [(TSDAbstractLayout *)self geometry];
  if (v5) {
    [(TSDLayoutGeometry *)v5 transform];
  }
  else {
    memset(&t1, 0, sizeof(t1));
  }
  double v6 = [(TSDAbstractLayout *)self->mParent geometry];
  if (v6) {
    [(TSDLayoutGeometry *)v6 transform];
  }
  else {
    memset(&v8, 0, sizeof(v8));
  }
  return CGAffineTransformConcat(retstr, &t1, &v8);
}

- (CGAffineTransform)transformInRoot
{
  *(_OWORD *)&retstr->c = 0u;
  *(_OWORD *)&retstr->tdouble x = 0u;
  *(_OWORD *)&retstr->a = 0u;
  CGRect result = [(TSDAbstractLayout *)self geometry];
  if (result)
  {
    CGRect result = (CGAffineTransform *)[(CGAffineTransform *)result transform];
  }
  else
  {
    *(_OWORD *)&retstr->c = 0u;
    *(_OWORD *)&retstr->tdouble x = 0u;
    *(_OWORD *)&retstr->a = 0u;
  }
  mParent = self->mParent;
  if (mParent)
  {
    do
    {
      v7 = (void *)[mParent geometry];
      if (v7)
      {
        long long v8 = *(_OWORD *)&retstr->c;
        v10[0] = *(_OWORD *)&retstr->a;
        v10[1] = v8;
        v10[2] = *(_OWORD *)&retstr->tx;
        [v7 transformByConcatenatingTransformTo:v10];
      }
      else
      {
        long long v12 = 0u;
        long long v13 = 0u;
        long long v11 = 0u;
      }
      long long v9 = v12;
      *(_OWORD *)&retstr->a = v11;
      *(_OWORD *)&retstr->c = v9;
      *(_OWORD *)&retstr->tdouble x = v13;
      CGRect result = (CGAffineTransform *)[mParent parent];
      mParent = result;
    }
    while (result);
  }
  return result;
}

- (CGRect)frame
{
  v2 = [(TSDAbstractLayout *)self geometry];

  [(TSDLayoutGeometry *)v2 frame];
  result.size.height = v6;
  result.size.width = v5;
  result.origin.double y = v4;
  result.origin.double x = v3;
  return result;
}

- (CGRect)frameInParent
{
  [(TSDLayoutGeometry *)[(TSDAbstractLayout *)self geometry] size];
  double v3 = TSDRectWithSize();

  [(TSDAbstractLayout *)self rectInParent:v3];
  result.size.height = v7;
  result.size.width = v6;
  result.origin.double y = v5;
  result.origin.double x = v4;
  return result;
}

- (CGRect)frameInRoot
{
  [(TSDLayoutGeometry *)[(TSDAbstractLayout *)self geometry] size];
  double v3 = TSDRectWithSize();

  [(TSDAbstractLayout *)self rectInRoot:v3];
  result.size.height = v7;
  result.size.width = v6;
  result.origin.double y = v5;
  result.origin.double x = v4;
  return result;
}

- (CGRect)rectInParent:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  if (self) {
    [(TSDAbstractLayout *)self transformInParent];
  }
  else {
    memset(&v7, 0, sizeof(v7));
  }
  v8.origin.CGFloat x = x;
  v8.origin.CGFloat y = y;
  v8.size.CGFloat width = width;
  v8.size.CGFloat height = height;
  return CGRectApplyAffineTransform(v8, &v7);
}

- (CGRect)rectInRoot:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  if (self) {
    [(TSDAbstractLayout *)self transformInRoot];
  }
  else {
    memset(&v7, 0, sizeof(v7));
  }
  v8.origin.CGFloat x = x;
  v8.origin.CGFloat y = y;
  v8.size.CGFloat width = width;
  v8.size.CGFloat height = height;
  return CGRectApplyAffineTransform(v8, &v7);
}

- (BOOL)isAxisAlignedUnflippedInRoot
{
  if (self) {
    [(TSDAbstractLayout *)self transformInRoot];
  }
  else {
    memset(v3, 0, sizeof(v3));
  }
  return TSDIsTransformAxisAlignedUnflipped((double *)v3);
}

- (BOOL)isRootLayoutForInspectorGeometry
{
  return 0;
}

- (BOOL)providesGuidesForChildLayouts
{
  return 0;
}

- (id)parentLayoutForProvidingGuides
{
  v2 = [(TSDAbstractLayout *)self parent];
  if ([(TSDAbstractLayout *)v2 providesGuidesForChildLayouts]) {
    return v2;
  }

  return [(TSDAbstractLayout *)v2 parentLayoutForProvidingGuides];
}

- (id)layoutsForProvidingGuidesForChildLayouts
{
  if (![(TSDAbstractLayout *)self providesGuidesForChildLayouts])
  {
    v2 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v3 = [NSString stringWithUTF8String:"-[TSDAbstractLayout layoutsForProvidingGuidesForChildLayouts]"];
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDAbstractLayout.m"), 155, @"This method should never be called on a layout which returns NO for providesGuidesForChildLayouts.");
  }
  return 0;
}

- (id)additionalDependenciesForChildLayout:(id)a3
{
  return 0;
}

- (void)setParent:(id)a3
{
  self->mParent = (TSDAbstractLayout *)a3;
}

- (NSArray)children
{
  return &self->mChildren->super;
}

- (void)setChildren:(id)a3
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  mChildren = self->mChildren;
  if (mChildren != a3 && (-[NSMutableArray isEqual:](mChildren, "isEqual:") & 1) == 0)
  {
    if (a3) {
      double v6 = (void *)[objc_alloc(MEMORY[0x263EFFA08]) initWithArray:a3];
    }
    else {
      double v6 = 0;
    }
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    CGAffineTransform v7 = self->mChildren;
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
            [v12 setParent:0];
          }
        }
        uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v24 objects:v29 count:16];
      }
      while (v9);
    }

    if (self->mChildren) {
      long long v13 = (void *)[objc_alloc(MEMORY[0x263EFFA08]) initWithArray:self->mChildren];
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
            [v18 removeFromParent];
            [v18 setParent:self];
          }
        }
        uint64_t v15 = [a3 countByEnumeratingWithState:&v20 objects:v28 count:16];
      }
      while (v15);
    }

    v19 = (NSMutableArray *)[a3 mutableCopy];
    self->mChildren = v19;
  }
}

- (void)addChild:(id)a3
{
  mChildren = self->mChildren;
  if (mChildren) {
    uint64_t v6 = [(NSMutableArray *)mChildren count];
  }
  else {
    uint64_t v6 = 0;
  }

  [(TSDAbstractLayout *)self insertChild:a3 atIndex:v6];
}

- (void)insertChild:(id)a3 atIndex:(unint64_t)a4
{
  if (a3)
  {
    uint64_t v6 = [a3 parent];
    if (v6)
    {
      id v7 = a3;
      [a3 removeFromParent];
    }
    mChildren = self->mChildren;
    if (!mChildren)
    {
      mChildren = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
      self->mChildren = mChildren;
    }
    [(NSMutableArray *)mChildren insertObject:a3 atIndex:a4];
    [a3 setParent:self];
    if (v6)
    {
    }
  }
}

- (void)insertChild:(id)a3 below:(id)a4
{
  mChildren = self->mChildren;
  if (mChildren)
  {
    uint64_t v7 = [(NSMutableArray *)mChildren indexOfObjectIdenticalTo:a4];
    if (v7 != 0x7FFFFFFFFFFFFFFFLL)
    {
      [(TSDAbstractLayout *)self insertChild:a3 atIndex:v7];
    }
  }
}

- (void)insertChild:(id)a3 above:(id)a4
{
  mChildren = self->mChildren;
  if (mChildren)
  {
    uint64_t v7 = [(NSMutableArray *)mChildren indexOfObjectIdenticalTo:a4];
    if (v7 != 0x7FFFFFFFFFFFFFFFLL)
    {
      [(TSDAbstractLayout *)self insertChild:a3 atIndex:v7 + 1];
    }
  }
}

- (void)replaceChild:(id)a3 with:(id)a4
{
  mChildren = self->mChildren;
  if (mChildren)
  {
    uint64_t v8 = -[NSMutableArray indexOfObjectIdenticalTo:](mChildren, "indexOfObjectIdenticalTo:");
    if (v8 != 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v9 = v8;
      id v10 = a3;
      [(NSMutableArray *)self->mChildren removeObjectAtIndex:v9];
      [a3 setParent:0];

      [(TSDAbstractLayout *)self insertChild:a4 atIndex:v9];
    }
  }
}

- (void)exchangeChildAtIndex:(unint64_t)a3 withChildAtIndex:(unint64_t)a4
{
  mChildren = self->mChildren;
  if (!mChildren)
  {
    uint64_t v8 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v9 = [NSString stringWithUTF8String:"-[TSDAbstractLayout exchangeChildAtIndex:withChildAtIndex:]"];
    objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDAbstractLayout.m"), 281, @"invalid nil value for '%s'", "mChildren");
    mChildren = self->mChildren;
  }
  if (a3 != a4 && mChildren)
  {
    unint64_t v10 = [(NSMutableArray *)mChildren count];
    if (v10 > a3 && v10 > a4)
    {
      uint64_t v15 = self->mChildren;
      [(NSMutableArray *)v15 exchangeObjectAtIndex:a3 withObjectAtIndex:a4];
    }
    else
    {
      long long v12 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
      uint64_t v13 = [NSString stringWithUTF8String:"-[TSDAbstractLayout exchangeChildAtIndex:withChildAtIndex:]"];
      uint64_t v14 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDAbstractLayout.m"];
      [v12 handleFailureInFunction:v13 file:v14 lineNumber:284 description:@"bad index"];
    }
  }
}

- (void)addLayoutsInRect:(CGRect)a3 toArray:(id)a4 deep:(BOOL)a5
{
  BOOL v5 = a5;
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  uint64_t v38 = *MEMORY[0x263EF8340];
  [(TSDAbstractLayout *)self frameForCulling];
  if (TSDIntersectsRect(v12, v13, v14, v15, x, y, width, height))
  {
    [a4 addObject:self];
    if (v5)
    {
      [(TSDAbstractLayout *)self frameForCulling];
      v43.origin.double x = x;
      v43.origin.double y = y;
      v43.size.double width = width;
      v43.size.double height = height;
      CGRect v40 = CGRectIntersection(v39, v43);
      CGFloat v16 = v40.origin.x;
      CGFloat v17 = v40.origin.y;
      CGFloat v18 = v40.size.width;
      CGFloat v19 = v40.size.height;
      memset(&v36, 0, sizeof(v36));
      long long v20 = [(TSDAbstractLayout *)self geometry];
      if (v20) {
        [(TSDLayoutGeometry *)v20 transform];
      }
      else {
        memset(&v35, 0, sizeof(v35));
      }
      CGAffineTransformInvert(&v36, &v35);
      CGAffineTransform v34 = v36;
      v41.origin.double x = v16;
      v41.origin.double y = v17;
      v41.size.double width = v18;
      v41.size.double height = v19;
      CGRect v42 = CGRectApplyAffineTransform(v41, &v34);
      double v21 = v42.origin.x;
      double v22 = v42.origin.y;
      double v23 = v42.size.width;
      double v24 = v42.size.height;
      long long v30 = 0u;
      long long v31 = 0u;
      long long v32 = 0u;
      long long v33 = 0u;
      long long v25 = [(TSDAbstractLayout *)self children];
      uint64_t v26 = [(NSArray *)v25 countByEnumeratingWithState:&v30 objects:v37 count:16];
      if (v26)
      {
        uint64_t v27 = v26;
        uint64_t v28 = *(void *)v31;
        do
        {
          uint64_t v29 = 0;
          do
          {
            if (*(void *)v31 != v28) {
              objc_enumerationMutation(v25);
            }
            objc_msgSend(*(id *)(*((void *)&v30 + 1) + 8 * v29++), "addLayoutsInRect:toArray:deep:", a4, 1, v21, v22, v23, v24);
          }
          while (v27 != v29);
          uint64_t v27 = [(NSArray *)v25 countByEnumeratingWithState:&v30 objects:v37 count:16];
        }
        while (v27);
      }
    }
  }
}

- (void)addLayoutsToArray:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  [a3 addObject:self];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  BOOL v5 = [(TSDAbstractLayout *)self children];
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
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
        [*(id *)(*((void *)&v10 + 1) + 8 * v9++) addLayoutsToArray:a3];
      }
      while (v7 != v9);
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void)addDescendentLayoutsToArray:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  double v4 = [(TSDAbstractLayout *)self children];
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * v8++) addLayoutsToArray:a3];
      }
      while (v6 != v8);
      uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (CGRect)alignmentFrameInRoot
{
  uint64_t v3 = [(TSDAbstractLayout *)self parent];
  [(TSDAbstractLayout *)self alignmentFrame];
  CGFloat x = v4;
  CGFloat y = v6;
  CGFloat width = v8;
  CGFloat height = v10;
  if (v3)
  {
    long long v12 = [(TSDAbstractLayout *)self parent];
    if (v12) {
      [(TSDAbstractLayout *)v12 transformInRoot];
    }
    else {
      memset(&v17, 0, sizeof(v17));
    }
    v18.origin.CGFloat x = x;
    v18.origin.CGFloat y = y;
    v18.size.CGFloat width = width;
    v18.size.CGFloat height = height;
    CGRect v19 = CGRectApplyAffineTransform(v18, &v17);
    CGFloat x = v19.origin.x;
    CGFloat y = v19.origin.y;
    CGFloat width = v19.size.width;
    CGFloat height = v19.size.height;
  }
  double v13 = x;
  double v14 = y;
  double v15 = width;
  double v16 = height;
  result.size.CGFloat height = v16;
  result.size.CGFloat width = v15;
  result.origin.CGFloat y = v14;
  result.origin.CGFloat x = v13;
  return result;
}

- (BOOL)shouldSnapWhileResizing
{
  if (self)
  {
    [(TSDAbstractLayout *)self transformInRoot];
  }
  else
  {
    long long v7 = 0u;
    long long v8 = 0u;
    long long v6 = 0u;
  }
  [(TSDLayoutGeometry *)[(TSDAbstractLayout *)self geometry] size];
  return TSDIsTransformAxisAlignedWithObjectSize((double *)&v6, v3, v4);
}

- (double)interimPositionX
{
  return self->mInterimPosition.x;
}

- (double)interimPositionY
{
  return self->mInterimPosition.y;
}

- (void)fixTransformFromLastInterimPosition
{
}

- (BOOL)supportsResize
{
  return 1;
}

- (BOOL)supportsInspectorPositioning
{
  return 1;
}

- (BOOL)supportsRotation
{
  return 0;
}

- (BOOL)supportsParentRotation
{
  return 1;
}

- (BOOL)canRotateChildLayout:(id)a3
{
  return 1;
}

- (id)delegateConformingToProtocol:(id)a3 forLayout:(id)a4
{
  return 0;
}

- (TSDAbstractLayout)parent
{
  return self->mParent;
}

@end
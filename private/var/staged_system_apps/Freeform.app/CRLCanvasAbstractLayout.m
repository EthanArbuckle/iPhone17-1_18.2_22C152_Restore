@interface CRLCanvasAbstractLayout
- (BOOL)canRotateChildLayout:(id)a3;
- (BOOL)exclusivelyProvidesGuidesForChildLayouts;
- (BOOL)isAxisAlignedUnflippedInRoot;
- (BOOL)isRootLayoutForInspectorGeometry;
- (BOOL)isRootLevelForInlineGeometry;
- (BOOL)providesGuidesForChildLayouts;
- (BOOL)shouldBeIncludedInParentFrameForCulling;
- (BOOL)shouldSnapWhileResizing;
- (BOOL)supportsCalloutAttributes;
- (BOOL)supportsRotation;
- (CGAffineTransform)transform;
- (CGAffineTransform)transformInParent;
- (CGAffineTransform)transformInRoot;
- (CGPoint)lastInterimPosition;
- (CGRect)alignmentFrame;
- (CGRect)alignmentFrameInParent;
- (CGRect)alignmentFrameInRoot;
- (CGRect)clipRect;
- (CGRect)clippedRectInRoot:(CGRect)a3;
- (CGRect)frame;
- (CGRect)frameForCullingInRoot;
- (CGRect)frameInParent;
- (CGRect)frameInRoot;
- (CGRect)rectInParent:(CGRect)a3;
- (CGRect)rectInRoot:(CGRect)a3;
- (CRLCanvasAbstractLayout)init;
- (CRLCanvasAbstractLayout)parent;
- (CRLCanvasAbstractLayout)parentLayoutForProvidingGuides;
- (CRLCanvasAbstractLayout)root;
- (CRLCanvasLayoutGeometry)geometry;
- (CRLCanvasLayoutGeometry)geometryInParent;
- (CRLCanvasLayoutGeometry)geometryInRoot;
- (NSArray)children;
- (NSArray)layoutsForProvidingGuidesForChildLayouts;
- (NSArray)visibleGeometries;
- (double)interimPositionX;
- (double)interimPositionY;
- (id)additionalDependenciesForChildLayout:(id)a3;
- (id)childLayoutContainingPossibleDescendentLayout:(id)a3;
- (id)geometryInRoot:(id)a3;
- (void)addChild:(id)a3;
- (void)addLayoutsInRect:(CGRect)a3 toArray:(id)a4 deep:(BOOL)a5;
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

@implementation CRLCanvasAbstractLayout

- (CRLCanvasAbstractLayout)init
{
  v8.receiver = self;
  v8.super_class = (Class)CRLCanvasAbstractLayout;
  v2 = [(CRLCanvasAbstractLayout *)&v8 init];
  if (v2)
  {
    v3 = objc_alloc_init(CRLCanvasLayoutGeometry);
    geometry = v2->_geometry;
    v2->_geometry = v3;

    v5 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    children = v2->_children;
    v2->_children = v5;
  }
  return v2;
}

- (CRLCanvasLayoutGeometry)geometryInParent
{
  v3 = [(CRLCanvasAbstractLayout *)self geometry];
  p_parent = &self->_parent;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parent);

  if (WeakRetained)
  {
    id v6 = [v3 mutableCopy];
    id v7 = objc_loadWeakRetained((id *)p_parent);
    objc_super v8 = [v7 geometry];
    v9 = v8;
    if (v8) {
      [v8 transform];
    }
    else {
      memset(v11, 0, sizeof(v11));
    }
    [v6 transformBy:v11];
  }
  else
  {
    id v6 = v3;
  }

  return (CRLCanvasLayoutGeometry *)v6;
}

- (CRLCanvasLayoutGeometry)geometryInRoot
{
  v3 = [(CRLCanvasAbstractLayout *)self geometry];
  v4 = [(CRLCanvasAbstractLayout *)self geometryInRoot:v3];

  return (CRLCanvasLayoutGeometry *)v4;
}

- (id)geometryInRoot:(id)a3
{
  id v4 = [a3 mutableCopy];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parent);
  if (WeakRetained)
  {
    id v6 = WeakRetained;
    do
    {
      id v7 = [v6 geometry:v11, v12, v13];
      objc_super v8 = v7;
      if (v7)
      {
        [v7 transform];
      }
      else
      {
        long long v12 = 0u;
        long long v13 = 0u;
        long long v11 = 0u;
      }
      [v4 transformBy:&v11];

      uint64_t v9 = [v6 parent];

      id v6 = (void *)v9;
    }
    while (v9);
  }

  return v4;
}

- (NSArray)visibleGeometries
{
  v2 = [(CRLCanvasAbstractLayout *)self geometry];
  v5 = v2;
  v3 = +[NSArray arrayWithObjects:&v5 count:1];

  return (NSArray *)v3;
}

- (CGAffineTransform)transform
{
  id v4 = [(CRLCanvasAbstractLayout *)self geometry];
  if (v4)
  {
    id v6 = v4;
    [v4 transform];
    id v4 = v6;
  }
  else
  {
    *(_OWORD *)&retstr->c = 0u;
    *(_OWORD *)&retstr->tx = 0u;
    *(_OWORD *)&retstr->a = 0u;
  }

  return result;
}

- (CGAffineTransform)transformInParent
{
  *(_OWORD *)&retstr->c = 0u;
  *(_OWORD *)&retstr->tx = 0u;
  *(_OWORD *)&retstr->a = 0u;
  v5 = [(CRLCanvasAbstractLayout *)self geometry];
  id v6 = v5;
  if (v5)
  {
    [v5 transform];
  }
  else
  {
    *(_OWORD *)&retstr->c = 0u;
    *(_OWORD *)&retstr->tx = 0u;
    *(_OWORD *)&retstr->a = 0u;
  }

  p_parent = &self->_parent;
  id WeakRetained = objc_loadWeakRetained((id *)p_parent);

  if (WeakRetained)
  {
    id v10 = objc_loadWeakRetained((id *)p_parent);
    long long v11 = [v10 geometry];
    long long v12 = v11;
    if (v11) {
      [v11 transform];
    }
    else {
      memset(&t2, 0, sizeof(t2));
    }
    long long v13 = *(_OWORD *)&retstr->c;
    *(_OWORD *)&v15.a = *(_OWORD *)&retstr->a;
    *(_OWORD *)&v15.c = v13;
    *(_OWORD *)&v15.tx = *(_OWORD *)&retstr->tx;
    CGAffineTransformConcat(&v17, &v15, &t2);
    long long v14 = *(_OWORD *)&v17.c;
    *(_OWORD *)&retstr->a = *(_OWORD *)&v17.a;
    *(_OWORD *)&retstr->c = v14;
    *(_OWORD *)&retstr->tx = *(_OWORD *)&v17.tx;
  }
  return result;
}

- (CGAffineTransform)transformInRoot
{
  *(_OWORD *)&retstr->c = 0u;
  *(_OWORD *)&retstr->tx = 0u;
  *(_OWORD *)&retstr->a = 0u;
  v5 = [(CRLCanvasAbstractLayout *)self geometry];
  id v6 = v5;
  if (v5)
  {
    [v5 transform];
  }
  else
  {
    *(_OWORD *)&retstr->c = 0u;
    *(_OWORD *)&retstr->tx = 0u;
    *(_OWORD *)&retstr->a = 0u;
  }

  result = (CGAffineTransform *)objc_loadWeakRetained((id *)&self->_parent);
  if (result)
  {
    objc_super v8 = result;
    do
    {
      uint64_t v9 = [(CGAffineTransform *)v8 geometry];
      id v10 = v9;
      if (v9)
      {
        long long v11 = *(_OWORD *)&retstr->c;
        v14[0] = *(_OWORD *)&retstr->a;
        v14[1] = v11;
        v14[2] = *(_OWORD *)&retstr->tx;
        [v9 transformByConcatenatingTransformTo:v14];
      }
      else
      {
        long long v16 = 0u;
        long long v17 = 0u;
        long long v15 = 0u;
      }
      long long v12 = v16;
      *(_OWORD *)&retstr->a = v15;
      *(_OWORD *)&retstr->c = v12;
      *(_OWORD *)&retstr->tx = v17;

      uint64_t v13 = [(CGAffineTransform *)v8 parent];

      objc_super v8 = (CGAffineTransform *)v13;
    }
    while (v13);
  }
  return result;
}

- (CGRect)frame
{
  v2 = [(CRLCanvasAbstractLayout *)self geometry];
  [v2 frame];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (CGRect)frameInParent
{
  double v3 = [(CRLCanvasAbstractLayout *)self geometry];
  [v3 size];
  [(CRLCanvasAbstractLayout *)self rectInParent:sub_100064070()];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  double v12 = v5;
  double v13 = v7;
  double v14 = v9;
  double v15 = v11;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (CGRect)frameInRoot
{
  double v3 = [(CRLCanvasAbstractLayout *)self geometry];
  [v3 size];
  [(CRLCanvasAbstractLayout *)self rectInRoot:sub_100064070()];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  double v12 = v5;
  double v13 = v7;
  double v14 = v9;
  double v15 = v11;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (CGRect)rectInParent:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  [(CRLCanvasAbstractLayout *)self transformInParent];
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
  [(CRLCanvasAbstractLayout *)self transformInRoot];
  v8.origin.CGFloat x = x;
  v8.origin.CGFloat y = y;
  v8.size.CGFloat width = width;
  v8.size.CGFloat height = height;
  return CGRectApplyAffineTransform(v8, &v7);
}

- (CGRect)clipRect
{
  v2 = [(CRLCanvasAbstractLayout *)self geometry];
  [v2 size];
  double v3 = sub_100064070();
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;

  double v10 = v3;
  double v11 = v5;
  double v12 = v7;
  double v13 = v9;
  result.size.CGFloat height = v13;
  result.size.CGFloat width = v12;
  result.origin.CGFloat y = v11;
  result.origin.CGFloat x = v10;
  return result;
}

- (CGRect)clippedRectInRoot:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  if (!CGRectIsNull(a3))
  {
    [(CRLCanvasAbstractLayout *)self clipRect];
    v33.origin.CGFloat x = v8;
    v33.origin.CGFloat y = v9;
    v33.size.CGFloat width = v10;
    v33.size.CGFloat height = v11;
    v27.origin.CGFloat x = x;
    v27.origin.CGFloat y = y;
    v27.size.CGFloat width = width;
    v27.size.CGFloat height = height;
    CGRect v28 = CGRectIntersection(v27, v33);
    CGFloat x = v28.origin.x;
    CGFloat y = v28.origin.y;
    CGFloat width = v28.size.width;
    CGFloat height = v28.size.height;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_parent);
    if (WeakRetained)
    {
      double v13 = WeakRetained;
      v29.origin.CGFloat x = x;
      v29.origin.CGFloat y = y;
      v29.size.CGFloat width = width;
      v29.size.CGFloat height = height;
      BOOL IsNull = CGRectIsNull(v29);

      if (!IsNull)
      {
        id v15 = objc_loadWeakRetained((id *)&self->_parent);
        long long v16 = [(CRLCanvasAbstractLayout *)self geometry];
        long long v17 = v16;
        if (v16) {
          [v16 transform];
        }
        else {
          memset(&v26, 0, sizeof(v26));
        }
        v30.origin.CGFloat x = x;
        v30.origin.CGFloat y = y;
        v30.size.CGFloat width = width;
        v30.size.CGFloat height = height;
        CGRect v31 = CGRectApplyAffineTransform(v30, &v26);
        [v15 clippedRectInRoot:v31.origin.x, v31.origin.y, v31.size.width, v31.size.height];
        CGFloat x = v18;
        CGFloat y = v19;
        CGFloat width = v20;
        CGFloat height = v21;
      }
    }
  }
  double v22 = x;
  double v23 = y;
  double v24 = width;
  double v25 = height;
  result.size.CGFloat height = v25;
  result.size.CGFloat width = v24;
  result.origin.CGFloat y = v23;
  result.origin.CGFloat x = v22;
  return result;
}

- (BOOL)isAxisAlignedUnflippedInRoot
{
  [(CRLCanvasAbstractLayout *)self transformInRoot];
  return sub_10007F9C0(&v3);
}

- (BOOL)isRootLayoutForInspectorGeometry
{
  return 0;
}

- (BOOL)isRootLevelForInlineGeometry
{
  return 0;
}

- (BOOL)providesGuidesForChildLayouts
{
  return 0;
}

- (BOOL)exclusivelyProvidesGuidesForChildLayouts
{
  return 0;
}

- (CRLCanvasAbstractLayout)parentLayoutForProvidingGuides
{
  v2 = [(CRLCanvasAbstractLayout *)self parent];
  if ([v2 providesGuidesForChildLayouts])
  {
    id v3 = v2;
  }
  else
  {
    id v3 = [v2 parentLayoutForProvidingGuides];
  }
  double v4 = v3;

  return (CRLCanvasAbstractLayout *)v4;
}

- (NSArray)layoutsForProvidingGuidesForChildLayouts
{
  if (![(CRLCanvasAbstractLayout *)self providesGuidesForChildLayouts])
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F9640);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010B2114();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F9660);
    }
    v2 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010668E0(v2);
    }
    id v3 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCanvasAbstractLayout layoutsForProvidingGuidesForChildLayouts]");
    double v4 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvasAbstractLayout.m"];
    +[CRLAssertionHandler handleFailureInFunction:v3 file:v4 lineNumber:177 isFatal:0 description:"This method should never be called on a layout which returns NO for providesGuidesForChildLayouts."];
  }
  return 0;
}

- (id)additionalDependenciesForChildLayout:(id)a3
{
  return 0;
}

- (CRLCanvasAbstractLayout)root
{
  p_parent = &self->_parent;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parent);
  if (WeakRetained)
  {
    id v5 = objc_loadWeakRetained((id *)p_parent);
    double v6 = [v5 root];
  }
  else
  {
    double v6 = self;
  }

  return v6;
}

- (void)setChildren:(id)a3
{
  double v4 = (NSMutableArray *)a3;
  children = self->_children;
  if (children != v4 && ([(NSMutableArray *)children isEqual:v4] & 1) == 0)
  {
    if (v4) {
      id v6 = [objc_alloc((Class)NSSet) initWithArray:v4];
    }
    else {
      id v6 = 0;
    }
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    double v7 = self->_children;
    id v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v26 objects:v31 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v27;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v27 != v10) {
            objc_enumerationMutation(v7);
          }
          double v12 = *(void **)(*((void *)&v26 + 1) + 8 * i);
          if (([v6 containsObject:v12] & 1) == 0) {
            [v12 setParent:0];
          }
        }
        id v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v26 objects:v31 count:16];
      }
      while (v9);
    }

    if (self->_children) {
      id v13 = [objc_alloc((Class)NSSet) initWithArray:self->_children];
    }
    else {
      id v13 = 0;
    }
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    double v14 = v4;
    id v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v22 objects:v30 count:16];
    if (v15)
    {
      id v16 = v15;
      uint64_t v17 = *(void *)v23;
      do
      {
        for (j = 0; j != v16; j = (char *)j + 1)
        {
          if (*(void *)v23 != v17) {
            objc_enumerationMutation(v14);
          }
          double v19 = *(void **)(*((void *)&v22 + 1) + 8 * (void)j);
          if ((objc_msgSend(v13, "containsObject:", v19, (void)v22) & 1) == 0)
          {
            [v19 removeFromParent];
            [v19 setParent:self];
          }
        }
        id v16 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v22 objects:v30 count:16];
      }
      while (v16);
    }

    if (v4) {
      double v4 = v14;
    }
    else {
      double v4 = (NSMutableArray *)&__NSArray0__struct;
    }
    double v20 = (NSMutableArray *)[(NSMutableArray *)v4 mutableCopy];
    double v21 = self->_children;
    self->_children = v20;
  }
}

- (void)removeFromParent
{
  uint64_t v3 = objc_opt_class();
  sub_1002469D0(v3, self);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_parent);
    [WeakRetained replaceChild:v5 with:0];
  }
}

- (void)addChild:(id)a3
{
  id v6 = a3;
  children = self->_children;
  if (children) {
    id v5 = [(NSMutableArray *)children count];
  }
  else {
    id v5 = 0;
  }
  [(CRLCanvasAbstractLayout *)self insertChild:v6 atIndex:v5];
}

- (void)insertChild:(id)a3 atIndex:(unint64_t)a4
{
  id v6 = a3;
  if (v6)
  {
    id v11 = v6;
    double v7 = [v6 parent];

    if (v7) {
      [v11 removeFromParent];
    }
    children = self->_children;
    if (!children)
    {
      id v9 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
      uint64_t v10 = self->_children;
      self->_children = v9;

      children = self->_children;
    }
    [(NSMutableArray *)children insertObject:v11 atIndex:a4];
    [v11 setParent:self];
    id v6 = v11;
  }
}

- (void)insertChild:(id)a3 below:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  children = self->_children;
  if (children)
  {
    id v8 = [(NSMutableArray *)children indexOfObjectIdenticalTo:v6];
    if (v8 != (id)0x7FFFFFFFFFFFFFFFLL) {
      [(CRLCanvasAbstractLayout *)self insertChild:v9 atIndex:v8];
    }
  }
}

- (void)insertChild:(id)a3 above:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  children = self->_children;
  if (children)
  {
    id v8 = (char *)[(NSMutableArray *)children indexOfObjectIdenticalTo:v6];
    if (v8 != (char *)0x7FFFFFFFFFFFFFFFLL) {
      [(CRLCanvasAbstractLayout *)self insertChild:v9 atIndex:v8 + 1];
    }
  }
}

- (void)replaceChild:(id)a3 with:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  children = self->_children;
  if (children)
  {
    id v8 = [(NSMutableArray *)children indexOfObjectIdenticalTo:v10];
    if (v8 != (id)0x7FFFFFFFFFFFFFFFLL)
    {
      id v9 = v8;
      [(NSMutableArray *)self->_children removeObjectAtIndex:v8];
      [v10 setParent:0];
      if (v6) {
        [(CRLCanvasAbstractLayout *)self insertChild:v6 atIndex:v9];
      }
    }
  }
}

- (void)exchangeChildAtIndex:(unint64_t)a3 withChildAtIndex:(unint64_t)a4
{
  children = self->_children;
  if (!children)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F9680);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010B223C();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F96A0);
    }
    id v8 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010668E0(v8);
    }
    id v9 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCanvasAbstractLayout exchangeChildAtIndex:withChildAtIndex:]");
    id v10 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvasAbstractLayout.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v9, v10, 276, 0, "invalid nil value for '%{public}s'", "_children");

    children = self->_children;
  }
  if (a3 != a4 && children)
  {
    id v11 = [(NSMutableArray *)children count];
    if ((unint64_t)v11 > a3 && (unint64_t)v11 > a4)
    {
      [(NSMutableArray *)self->_children exchangeObjectAtIndex:a3 withObjectAtIndex:a4];
    }
    else
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014F96C0);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_1010B21A8();
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014F96E0);
      }
      id v13 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_1010668E0(v13);
      }
      double v14 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCanvasAbstractLayout exchangeChildAtIndex:withChildAtIndex:]");
      id v15 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvasAbstractLayout.m"];
      +[CRLAssertionHandler handleFailureInFunction:v14 file:v15 lineNumber:279 isFatal:0 description:"bad index"];
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
  id v11 = a4;
  [(CRLCanvasAbstractLayout *)self frameForCulling];
  if (sub_10006525C(v12, v13, v14, v15, x, y, width, height))
  {
    [v11 addObject:self];
    if (v5)
    {
      [(CRLCanvasAbstractLayout *)self frameForCulling];
      v43.origin.double x = x;
      v43.origin.double y = y;
      v43.size.double width = width;
      v43.size.double height = height;
      CGRect v40 = CGRectIntersection(v39, v43);
      CGFloat v16 = v40.origin.x;
      CGFloat v17 = v40.origin.y;
      CGFloat v18 = v40.size.width;
      CGFloat v19 = v40.size.height;
      memset(&v37, 0, sizeof(v37));
      double v20 = [(CRLCanvasAbstractLayout *)self geometry];
      double v21 = v20;
      if (v20) {
        [v20 transform];
      }
      else {
        memset(&v36, 0, sizeof(v36));
      }
      CGAffineTransformInvert(&v37, &v36);

      CGAffineTransform v35 = v37;
      v41.origin.double x = v16;
      v41.origin.double y = v17;
      v41.size.double width = v18;
      v41.size.double height = v19;
      CGRect v42 = CGRectApplyAffineTransform(v41, &v35);
      double v22 = v42.origin.x;
      double v23 = v42.origin.y;
      double v24 = v42.size.width;
      double v25 = v42.size.height;
      long long v31 = 0u;
      long long v32 = 0u;
      long long v33 = 0u;
      long long v34 = 0u;
      long long v26 = [(CRLCanvasAbstractLayout *)self children];
      id v27 = [v26 countByEnumeratingWithState:&v31 objects:v38 count:16];
      if (v27)
      {
        id v28 = v27;
        uint64_t v29 = *(void *)v32;
        do
        {
          for (i = 0; i != v28; i = (char *)i + 1)
          {
            if (*(void *)v32 != v29) {
              objc_enumerationMutation(v26);
            }
            [*(id *)(*((void *)&v31 + 1) + 8 * i) addLayoutsInRect:v11 toArray:1 v22 v23 v24 v25];
          }
          id v28 = [v26 countByEnumeratingWithState:&v31 objects:v38 count:16];
        }
        while (v28);
      }
    }
  }
}

- (CGRect)frameForCullingInRoot
{
  [(CRLCanvasAbstractLayout *)self frameForCulling];
  CGFloat x = v3;
  CGFloat y = v5;
  CGFloat width = v7;
  CGFloat height = v9;
  id v11 = [(CRLCanvasAbstractLayout *)self parent];
  double v12 = v11;
  if (v11)
  {
    [v11 transformInRoot];
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

- (BOOL)shouldBeIncludedInParentFrameForCulling
{
  return 1;
}

- (CGRect)alignmentFrame
{
  v2 = [(CRLCanvasAbstractLayout *)self geometry];
  [v2 frame];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.size.CGFloat height = v14;
  result.size.CGFloat width = v13;
  result.origin.CGFloat y = v12;
  result.origin.CGFloat x = v11;
  return result;
}

- (CGRect)alignmentFrameInParent
{
  v2 = [(CRLCanvasAbstractLayout *)self geometryInParent];
  [v2 frame];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.size.CGFloat height = v14;
  result.size.CGFloat width = v13;
  result.origin.CGFloat y = v12;
  result.origin.CGFloat x = v11;
  return result;
}

- (CGRect)alignmentFrameInRoot
{
  double v3 = [(CRLCanvasAbstractLayout *)self parent];

  [(CRLCanvasAbstractLayout *)self alignmentFrame];
  CGFloat x = v4;
  CGFloat y = v6;
  CGFloat width = v8;
  CGFloat height = v10;
  if (v3)
  {
    double v12 = [(CRLCanvasAbstractLayout *)self parent];
    double v13 = v12;
    if (v12) {
      [v12 transformInRoot];
    }
    else {
      memset(&v18, 0, sizeof(v18));
    }
    v19.origin.CGFloat x = x;
    v19.origin.CGFloat y = y;
    v19.size.CGFloat width = width;
    v19.size.CGFloat height = height;
    CGRect v20 = CGRectApplyAffineTransform(v19, &v18);
    CGFloat x = v20.origin.x;
    CGFloat y = v20.origin.y;
    CGFloat width = v20.size.width;
    CGFloat height = v20.size.height;
  }
  double v14 = x;
  double v15 = y;
  double v16 = width;
  double v17 = height;
  result.size.CGFloat height = v17;
  result.size.CGFloat width = v16;
  result.origin.CGFloat y = v15;
  result.origin.CGFloat x = v14;
  return result;
}

- (BOOL)shouldSnapWhileResizing
{
  [(CRLCanvasAbstractLayout *)self transformInRoot];
  double v3 = [(CRLCanvasAbstractLayout *)self geometry];
  [v3 size];
  BOOL v6 = sub_10007F8A0(&v8, v4, v5);

  return v6;
}

- (double)interimPositionX
{
  return self->_interimPosition.x;
}

- (void)setInterimPositionX:(double)a3
{
  self->_interimPosition.CGFloat x = a3;
  self->_interimPositionXSet = 1;
}

- (double)interimPositionY
{
  return self->_interimPosition.y;
}

- (void)setInterimPositionY:(double)a3
{
  self->_interimPosition.CGFloat y = a3;
  self->_interimPositionYSet = 1;
}

- (void)fixTransformFromInterimPosition
{
  self->_lastInterimPosition = self->_interimPosition;
  *(_WORD *)&self->_lastInterimPositionXSet = *(_WORD *)&self->_interimPositionXSet;
  self->_interimPosition = CGPointZero;
  *(_WORD *)&self->_interimPositionXSet = 0;
}

- (void)fixTransformFromLastInterimPosition
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
    [(CRLCanvasAbstractLayout *)self alignmentFrameOriginForFixingInterimPosition];
    double v9 = x - a3.x;
  }
  if (v5)
  {
    [(CRLCanvasAbstractLayout *)self alignmentFrameOriginForFixingInterimPosition];
    double v8 = y - v11;
  }

  -[CRLCanvasAbstractLayout offsetGeometryBy:](self, "offsetGeometryBy:", v9, v8);
}

- (void)offsetGeometryBy:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  if (a3.x != CGPointZero.x || a3.y != CGPointZero.y)
  {
    id v8 = [(CRLCanvasAbstractLayout *)self geometry];
    double v7 = [v8 geometryByTranslatingBy:x, y];
    [(CRLCanvasAbstractLayout *)self setGeometry:v7];
  }
}

- (BOOL)supportsRotation
{
  return 0;
}

- (BOOL)canRotateChildLayout:(id)a3
{
  return 1;
}

- (BOOL)supportsCalloutAttributes
{
  return 0;
}

- (id)childLayoutContainingPossibleDescendentLayout:(id)a3
{
  id v4 = a3;
  BOOL v5 = v4;
  if (v4)
  {
    BOOL v6 = v4;
    do
    {
      double v7 = [v6 parent];

      if (v7 == self) {
        break;
      }
      uint64_t v8 = [v6 parent];

      BOOL v6 = (void *)v8;
    }
    while (v8);
  }
  else
  {
    BOOL v6 = 0;
  }
  double v9 = [v6 parent];

  if (v9 == self) {
    id v10 = v6;
  }
  else {
    id v10 = 0;
  }

  return v10;
}

- (CRLCanvasLayoutGeometry)geometry
{
  return self->_geometry;
}

- (void)setGeometry:(id)a3
{
}

- (CRLCanvasAbstractLayout)parent
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parent);

  return (CRLCanvasAbstractLayout *)WeakRetained;
}

- (void)setParent:(id)a3
{
}

- (CGPoint)lastInterimPosition
{
  double x = self->_lastInterimPosition.x;
  double y = self->_lastInterimPosition.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (NSArray)children
{
  return &self->_children->super;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_geometry, 0);
  objc_storeStrong((id *)&self->_children, 0);

  objc_destroyWeak((id *)&self->_parent);
}

@end
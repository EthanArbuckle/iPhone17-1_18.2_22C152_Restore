@interface TSDBezierSubpath
- (BOOL)allNodesSelected;
- (BOOL)canDeleteSelectedNodes;
- (BOOL)closeIfEndpointsAreEqual;
- (BOOL)hasSelectedNode;
- (BOOL)isCircular;
- (BOOL)isClosed;
- (BOOL)isRectangular;
- (CGRect)nodeBounds;
- (NSMutableArray)nodes;
- (TSDBezierNode)firstNode;
- (TSDBezierNode)lastNode;
- (TSDBezierPath)bezierPath;
- (TSDBezierSubpath)init;
- (double)distanceToPoint:(CGPoint)a3 elementIndex:(unint64_t *)a4 tValue:(double *)a5 threshold:(double)a6;
- (id)bezierNodeUnderPoint:(CGPoint)a3 withTransform:(CGAffineTransform *)a4 andTolerance:(double)a5 returningType:(int64_t *)a6;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)insertNodeAtPoint:(CGPoint)a3 tolerance:(double)a4;
- (id)nodeAfterNode:(id)a3;
- (id)nodePriorToNode:(id)a3;
- (id)splitEdgeAtIndex:(unint64_t)a3;
- (void)addNode:(id)a3;
- (void)addNodesToArray:(id)a3;
- (void)appendToBezierPath:(id)a3;
- (void)appendToBezierPath:(id)a3 selectedNodesOnly:(BOOL)a4 fromIndex:(unint64_t)a5;
- (void)convertToHobby;
- (void)dealloc;
- (void)deleteSelectedNodes;
- (void)deselectAllNodes;
- (void)offsetSelectedEdgesByDelta:(CGPoint)a3;
- (void)offsetSelectedNodesByDelta:(CGPoint)a3;
- (void)removeLastNode;
- (void)removeNode:(id)a3;
- (void)reverseDirection;
- (void)selectAllNodes;
- (void)setClosed:(BOOL)a3;
- (void)setNodes:(id)a3;
- (void)sharpenAllNodes;
- (void)smoothNode:(id)a3;
- (void)transformUsingAffineTransform:(CGAffineTransform *)a3;
- (void)updateReflectedState;
@end

@implementation TSDBezierSubpath

- (TSDBezierSubpath)init
{
  v4.receiver = self;
  v4.super_class = (Class)TSDBezierSubpath;
  v2 = [(TSDBezierSubpath *)&v4 init];
  if (v2) {
    v2->mNodes = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
  }
  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init((Class)objc_opt_class());
  objc_msgSend(v4, "setNodes:", (id)objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithArray:copyItems:", -[TSDBezierSubpath nodes](self, "nodes"), 1));
  [v4 setClosed:self->mClosed];
  return v4;
}

- (id)description
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  if (self->mClosed) {
    v6 = @"YES";
  }
  else {
    v6 = @"NO";
  }
  return (id)[v3 stringWithFormat:@"<%@ %p nodes=%p closed=%@>", v5, self, self->mNodes, v6];
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)TSDBezierSubpath;
  [(TSDBezierSubpath *)&v3 dealloc];
}

- (BOOL)isRectangular
{
  v42[4] = *MEMORY[0x263EF8340];
  int v3 = [(TSDBezierSubpath *)self isClosed];
  if (!v3) {
    return v3;
  }
  if ([(NSMutableArray *)self->mNodes count] != 4) {
    goto LABEL_24;
  }
  -[NSMutableArray getObjects:range:](self->mNodes, "getObjects:range:", v42, 0, 4);
  unint64_t v4 = 0;
  do
  {
    int v3 = [(id)v42[v4] isCollapsed];
    if (v3) {
      BOOL v5 = v4 >= 3;
    }
    else {
      BOOL v5 = 1;
    }
    ++v4;
  }
  while (!v5);
  if (v3)
  {
    uint64_t v6 = 0;
    v7 = (void **)v42;
    do
    {
      v8 = &v41[v6 - 1];
      v9 = *v7++;
      [v9 nodePoint];
      *(void *)v8 = v10;
      *((void *)v8 + 1) = v11;
      v6 += 2;
    }
    while (v6 != 8);
    unint64_t v12 = 0;
    v13 = v41;
    do
    {
      double v14 = *(v13 - 1);
      double v15 = *v13;
      v16 = &v41[2 * ((v12 + 1) & 3) - 1];
      double v17 = *v16;
      double v18 = v16[1];
      v19 = &v41[2 * ((v12 + 2) & 3) - 1];
      double v20 = *v19;
      double v21 = v19[1];
      double v22 = TSDDistance(v14, *v13, v17, v18);
      double v23 = TSDDistance(v17, v18, v20, v21);
      double v24 = vabdd_f64(TSDDistance(v14, v15, v20, v21), sqrt(v23 * v23 + v22 * v22));
      v13 += 2;
    }
    while (v24 <= 0.00100000005 && v12++ < 3);
    if (v24 <= 0.00100000005)
    {
      double v26 = TSDRectWithPoints(v40, v41[0], v41[1]);
      double v30 = TSDGrowRectToPoint(v26, v27, v28, v29, v41[3], v41[4]);
      double v34 = TSDGrowRectToPoint(v30, v31, v32, v33, v41[5], v41[6]);
      double v36 = v35;
      uint64_t v37 = 0;
      do
      {
        LOBYTE(v3) = TSDNearlyEqualPoints(v41[v37 - 1], v41[v37], v34, v36);
        if (v3) {
          break;
        }
        BOOL v38 = v37 == 6;
        v37 += 2;
      }
      while (!v38);
      return v3;
    }
LABEL_24:
    LOBYTE(v3) = 0;
  }
  return v3;
}

- (BOOL)isCircular
{
  BOOL v3 = [(TSDBezierSubpath *)self isClosed];
  if (v3)
  {
    unint64_t v4 = [(TSDBezierSubpath *)self bezierPath];
    LOBYTE(v3) = [(TSDBezierPath *)v4 isCircular];
  }
  return v3;
}

- (TSDBezierPath)bezierPath
{
  BOOL v3 = +[TSDBezierPath bezierPath];
  [(TSDBezierSubpath *)self appendToBezierPath:v3 selectedNodesOnly:0 fromIndex:0];
  return v3;
}

- (void)appendToBezierPath:(id)a3 selectedNodesOnly:(BOOL)a4 fromIndex:(unint64_t)a5
{
  BOOL v6 = a4;
  uint64_t v9 = [(NSMutableArray *)self->mNodes count];
  if (v9)
  {
    unint64_t v10 = v9;
    if (a5) {
      BOOL v11 = 1;
    }
    else {
      BOOL v11 = !self->mClosed;
    }
    char v12 = !v11;
    v13 = (void *)[(NSMutableArray *)self->mNodes objectAtIndexedSubscript:a5];
    [v13 nodePoint];
    double v15 = v14;
    double v17 = v16;
    objc_msgSend(a3, "moveToPoint:");
    char v18 = 0;
    unint64_t v19 = v10 + self->mClosed;
    unint64_t v20 = a5 + 1;
    do
    {
      if (v20 >= v19) {
        break;
      }
      double v21 = v17;
      double v22 = v15;
      double v23 = v13;
      v13 = (void *)[(NSMutableArray *)self->mNodes objectAtIndexedSubscript:v20 % v10];
      [v13 nodePoint];
      double v15 = v24;
      double v17 = v25;
      if (!v6 || [v23 isSelected] && objc_msgSend(v13, "isSelected"))
      {
        [v23 outControlPoint];
        double v27 = v26;
        double v29 = v28;
        [v13 inControlPoint];
        double v31 = v30;
        double v33 = v32;
        if (v18) {
          objc_msgSend(a3, "moveToPoint:", v22, v21);
        }
        if (TSDNearlyEqualPoints(v22, v21, v27, v29) && TSDNearlyEqualPoints(v31, v33, v15, v17)) {
          objc_msgSend(a3, "lineToPoint:", v15, v17);
        }
        else {
          objc_msgSend(a3, "curveToPoint:controlPoint1:controlPoint2:", v15, v17, v27, v29, v31, v33);
        }
        char v18 = 0;
      }
      else
      {
        char v12 = 0;
        char v18 = 1;
      }
      ++v20;
    }
    while (v13);
    if (v12)
    {
      [a3 closePath];
    }
  }
}

- (void)appendToBezierPath:(id)a3
{
}

- (void)updateReflectedState
{
}

- (void)reverseDirection
{
  BOOL v3 = (void *)[(NSMutableArray *)self->mNodes reverseObjectEnumerator];
  id v6 = objc_alloc_init(MEMORY[0x263EFF980]);
  uint64_t v4 = [v3 nextObject];
  if (v4)
  {
    BOOL v5 = (void *)v4;
    do
    {
      [v5 swapControlPoints];
      [v6 addObject:v5];
      BOOL v5 = (void *)[v3 nextObject];
    }
    while (v5);
  }
  [(TSDBezierSubpath *)self setNodes:v6];
}

- (void)transformUsingAffineTransform:(CGAffineTransform *)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  mNodes = self->mNodes;
  uint64_t v5 = [(NSMutableArray *)mNodes countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(mNodes);
        }
        uint64_t v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        long long v10 = *(_OWORD *)&a3->c;
        v11[0] = *(_OWORD *)&a3->a;
        v11[1] = v10;
        v11[2] = *(_OWORD *)&a3->tx;
        [v9 transformUsingAffineTransform:v11];
      }
      uint64_t v6 = [(NSMutableArray *)mNodes countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }
}

- (void)addNode:(id)a3
{
}

- (void)removeLastNode
{
}

- (id)nodePriorToNode:(id)a3
{
  uint64_t v4 = [(NSMutableArray *)self->mNodes indexOfObject:a3];
  uint64_t v5 = v4 - 1;
  if (v4 < 1)
  {
    if (self->mClosed)
    {
      mNodes = self->mNodes;
      return (id)[(NSMutableArray *)mNodes lastObject];
    }
    else
    {
      return 0;
    }
  }
  else
  {
    uint64_t v6 = self->mNodes;
    return (id)[(NSMutableArray *)v6 objectAtIndex:v5];
  }
}

- (id)nodeAfterNode:(id)a3
{
  unint64_t v4 = [(NSMutableArray *)self->mNodes indexOfObject:a3] + 1;
  if (v4 >= [(NSMutableArray *)self->mNodes count])
  {
    if (!self->mClosed) {
      return 0;
    }
    unint64_t v4 = 0;
  }
  mNodes = self->mNodes;

  return (id)[(NSMutableArray *)mNodes objectAtIndex:v4];
}

- (TSDBezierNode)firstNode
{
  return (TSDBezierNode *)[(NSMutableArray *)self->mNodes firstObject];
}

- (TSDBezierNode)lastNode
{
  BOOL mClosed = self->mClosed;
  mNodes = self->mNodes;
  if (mClosed) {
    return (TSDBezierNode *)[(NSMutableArray *)mNodes objectAtIndex:0];
  }
  else {
    return (TSDBezierNode *)[(NSMutableArray *)mNodes lastObject];
  }
}

- (void)offsetSelectedNodesByDelta:(CGPoint)a3
{
  double x = a3.x;
  uint64_t v17 = *MEMORY[0x263EF8340];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  mNodes = self->mNodes;
  uint64_t v5 = [(NSMutableArray *)mNodes countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(mNodes);
        }
        uint64_t v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if ([v9 isSelected])
        {
          [v9 nodePoint];
          objc_msgSend(v9, "moveToPoint:", TSDAddPoints(v10, v11, x));
        }
      }
      uint64_t v6 = [(NSMutableArray *)mNodes countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }
}

- (void)offsetSelectedEdgesByDelta:(CGPoint)a3
{
  double x = a3.x;
  uint64_t v5 = (void *)[(NSMutableArray *)self->mNodes objectEnumerator];
  char v6 = objc_msgSend((id)-[NSMutableArray lastObject](self->mNodes, "lastObject"), "isSelected");
  uint64_t v7 = [v5 nextObject];
  if (v7)
  {
    v8 = (void *)v7;
    do
    {
      if ((v6 & 1) != 0 || [v8 isSelected])
      {
        [v8 nodePoint];
        objc_msgSend(v8, "moveToPoint:", TSDAddPoints(v9, v10, x));
        char v6 = [v8 isSelected];
      }
      else
      {
        char v6 = 0;
      }
      v8 = (void *)[v5 nextObject];
    }
    while (v8);
  }
}

- (BOOL)allNodesSelected
{
  v2 = (void *)[(NSMutableArray *)self->mNodes reverseObjectEnumerator];
  do
  {
    BOOL v3 = (void *)[v2 nextObject];
    unint64_t v4 = v3;
  }
  while (v3 && ([v3 isSelected] & 1) != 0);
  return v4 == 0;
}

- (BOOL)hasSelectedNode
{
  v2 = (void *)[(NSMutableArray *)self->mNodes reverseObjectEnumerator];
  do
  {
    BOOL v3 = (void *)[v2 nextObject];
    unint64_t v4 = v3;
  }
  while (v3 && ![v3 isSelected]);
  return v4 != 0;
}

- (void)removeNode:(id)a3
{
}

- (BOOL)canDeleteSelectedNodes
{
  v2 = (void *)[(NSMutableArray *)self->mNodes objectEnumerator];
  int v3 = 0;
  unint64_t v4 = 0;
  do
  {
    uint64_t v5 = (void *)[v2 nextObject];
    char v6 = v5;
    if (!v5) {
      break;
    }
    int v7 = [v5 isSelected];
    v3 |= v7;
    v4 += v7 ^ 1u;
  }
  while ((v3 & 1) == 0 || v4 < 2);
  return v6 != 0;
}

- (void)deleteSelectedNodes
{
  int v3 = (void *)[(NSMutableArray *)self->mNodes objectEnumerator];
  unint64_t v4 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
  uint64_t v5 = [v3 nextObject];
  if (v5)
  {
    char v6 = (void *)v5;
    do
    {
      if (([v6 isSelected] & 1) == 0) {
        [(NSMutableArray *)v4 addObject:v6];
      }
      char v6 = (void *)[v3 nextObject];
    }
    while (v6);
  }

  self->mNodes = v4;
  if ((unint64_t)[(NSMutableArray *)v4 count] <= 1)
  {
    [(TSDBezierSubpath *)self setClosed:0];
  }
}

- (void)selectAllNodes
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  mNodes = self->mNodes;
  uint64_t v3 = [(NSMutableArray *)mNodes countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(mNodes);
        }
        [*(id *)(*((void *)&v7 + 1) + 8 * i) setSelected:1];
      }
      uint64_t v4 = [(NSMutableArray *)mNodes countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (void)deselectAllNodes
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  mNodes = self->mNodes;
  uint64_t v3 = [(NSMutableArray *)mNodes countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(mNodes);
        }
        [*(id *)(*((void *)&v7 + 1) + 8 * i) setSelected:0];
      }
      uint64_t v4 = [(NSMutableArray *)mNodes countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (double)distanceToPoint:(CGPoint)a3 elementIndex:(unint64_t *)a4 tValue:(double *)a5 threshold:(double)a6
{
  uint64_t v56 = *MEMORY[0x263EF8340];
  uint64_t v10 = [(NSMutableArray *)self->mNodes count];
  if (!v10) {
    return 1.79769313e308;
  }
  unint64_t v11 = v10;
  uint64_t v12 = (void *)[(NSMutableArray *)self->mNodes objectAtIndexedSubscript:0];
  [v12 nodePoint];
  double v14 = v13;
  double v16 = v15;
  unint64_t v17 = v11 + self->mClosed;
  double v45 = a6 * a6;
  if (v17 >= 2 && a6 * a6 < 1.79769313e308)
  {
    unint64_t v19 = 0;
    double v20 = 0.0;
    double v21 = 1.79769313e308;
    unint64_t v23 = 2;
    do
    {
      double v47 = v21;
      double v48 = v20;
      double v24 = (void *)-[NSMutableArray objectAtIndexedSubscript:](self->mNodes, "objectAtIndexedSubscript:", (v23 - 1) % v11, *(void *)&v45);
      [v24 nodePoint];
      double v26 = v25;
      double v28 = v27;
      [v12 outControlPoint];
      double v30 = v29;
      double v32 = v31;
      [v24 inControlPoint];
      double v34 = v33;
      double v36 = v35;
      if (TSDNearlyEqualPoints(v14, v16, v30, v32) && TSDNearlyEqualPoints(v34, v36, v26, v28))
      {
        v49.f64[0] = v14;
        v49.f64[1] = v16;
        double v50 = v26;
        double v51 = v28;
        double x = a3.x;
        double y = a3.y;
        TSDNearestPointOnLineToPoint(v49.f64, a3.x, a3.y);
        double v40 = v39;
        double v41 = TSDMixPoints(v49.f64[0], v49.f64[1], v50, v51, v39);
      }
      else
      {
        v49.f64[0] = v14;
        v49.f64[1] = v16;
        double v50 = v30;
        double v51 = v32;
        double v52 = v34;
        double v53 = v36;
        double v54 = v26;
        double v55 = v28;
        double x = a3.x;
        double y = a3.y;
        double v40 = TSDNearestPointOnCurveToPoint(&v49, a3.x, a3.y, 1.0);
        double v41 = TSDPointOnCurve(&v49, v40);
      }
      double v43 = TSDDistanceSquared(v41, v42, x, y);
      double v21 = v47;
      BOOL v44 = v43 < v47;
      if (v43 < v47)
      {
        double v21 = v43;
        unint64_t v19 = v23 - 2;
      }
      double v20 = v48;
      if (v44) {
        double v20 = v40;
      }
      if (v23 >= v17) {
        break;
      }
      ++v23;
      double v16 = v28;
      double v14 = v26;
      uint64_t v12 = v24;
    }
    while (v21 > v45);
  }
  else
  {
    unint64_t v19 = 0;
    double v20 = 0.0;
    double v21 = 1.79769313e308;
  }
  if (a4) {
    *a4 = v19;
  }
  if (a5) {
    *a5 = v20;
  }
  return sqrt(v21);
}

- (id)bezierNodeUnderPoint:(CGPoint)a3 withTransform:(CGAffineTransform *)a4 andTolerance:(double)a5 returningType:(int64_t *)a6
{
  double y = a3.y;
  double x = a3.x;
  unint64_t v11 = (void *)[(NSMutableArray *)[(TSDBezierSubpath *)self nodes] objectEnumerator];
  do
  {
    uint64_t v12 = (void *)[v11 nextObject];
    double v13 = v12;
    if (!v12) {
      break;
    }
    long long v14 = *(_OWORD *)&a4->c;
    v16[0] = *(_OWORD *)&a4->a;
    v16[1] = v14;
    v16[2] = *(_OWORD *)&a4->tx;
  }
  while (!objc_msgSend(v12, "underPoint:withTransform:andTolerance:returningType:", v16, a6, x, y, a5));
  return v13;
}

- (id)insertNodeAtPoint:(CGPoint)a3 tolerance:(double)a4
{
  double y = a3.y;
  double x = a3.x;
  long long v8 = (void *)[(NSMutableArray *)[(TSDBezierSubpath *)self nodes] objectEnumerator];
  id v9 = +[TSDBezierPath bezierPath];
  uint64_t v10 = [v8 nextObject];
  uint64_t v11 = [v8 nextObject];
  if (!v11) {
    return 0;
  }
  uint64_t v12 = (void *)v11;
  double v13 = (void *)v10;
  while (1)
  {
    [v9 removeAllPoints];
    [v13 nodePoint];
    objc_msgSend(v9, "moveToPoint:");
    [v12 nodePoint];
    double v15 = v14;
    double v17 = v16;
    [v13 outControlPoint];
    double v19 = v18;
    double v21 = v20;
    [v12 inControlPoint];
    objc_msgSend(v9, "curveToPoint:controlPoint1:controlPoint2:", v15, v17, v19, v21, v22, v23);
    id v9 = (id)[v9 bezierPathByFlatteningPath];
    if (objc_msgSend(v9, "pointOnPath:tolerance:", x, y, a4)) {
      break;
    }
    uint64_t v24 = [v8 nextObject];
    if (v24 || (v25 = [(TSDBezierSubpath *)self isClosed], uint64_t v24 = v10, v25))
    {
      double v13 = v12;
      uint64_t v12 = (void *)v24;
      if (v24) {
        continue;
      }
    }
    return 0;
  }
  [v13 nodePoint];
  double v28 = v27;
  double v30 = v29;
  [v13 outControlPoint];
  if (TSDNearlyEqualPoints(v28, v30, v31, v32)
    && ([v12 nodePoint],
        double v34 = v33,
        double v36 = v35,
        [v12 outControlPoint],
        TSDNearlyEqualPoints(v34, v36, v37, v38)))
  {
    [v13 nodePoint];
    double v41 = TSDDistance(x, y, v39, v40);
    [v12 nodePoint];
    double v43 = v42;
    double v45 = v44;
    [v13 nodePoint];
    double v48 = v41 / TSDDistance(v43, v45, v46, v47);
    [v12 nodePoint];
    double v50 = v49;
    double v52 = v51;
    [v13 nodePoint];
    double v54 = TSDSubtractPoints(v50, v52, v53);
    double v56 = TSDMultiplyPointScalar(v54, v55, v48);
    [v13 nodePoint];
    v59 = +[TSDBezierNode bezierNodeWithPoint:TSDAddPoints(v57, v58, v56)];
  }
  else
  {
    [v13 nodePoint];
    double v61 = v60;
    double v63 = v62;
    [v13 outControlPoint];
    double v65 = v64;
    double v67 = v66;
    [v12 inControlPoint];
    double v69 = v68;
    double v71 = v70;
    [v12 nodePoint];
    id v74 = +[TSDBezierSegment segmentFromPoint:outPoint:inPoint:toPoint:](TSDBezierSegment, "segmentFromPoint:outPoint:inPoint:toPoint:", v61, v63, v65, v67, v69, v71, v72, v73);
    objc_msgSend(v74, "parametricValueForPoint:", x, y);
    id v98 = 0;
    id v99 = 0;
    objc_msgSend(v74, "splitAtParametricValue:left:right:", &v99, &v98);
    [v13 nodePoint];
    double v76 = v75;
    double v78 = v77;
    [v13 outControlPoint];
    if (!TSDNearlyEqualPoints(v76, v78, v79, v80))
    {
      [v99 outPoint];
      objc_msgSend(v13, "setOutControlPoint:");
    }
    [v12 nodePoint];
    double v82 = v81;
    double v84 = v83;
    [v12 outControlPoint];
    if (!TSDNearlyEqualPoints(v82, v84, v85, v86))
    {
      [v98 inPoint];
      objc_msgSend(v12, "setInControlPoint:");
    }
    [v99 toPoint];
    double v88 = v87;
    double v90 = v89;
    [v99 inPoint];
    double v92 = v91;
    double v94 = v93;
    [v98 outPoint];
    v59 = +[TSDBezierNode bezierNodeWithPoint:inControlPoint:outControlPoint:](TSDBezierNode, "bezierNodeWithPoint:inControlPoint:outControlPoint:", v88, v90, v92, v94, v95, v96);
  }
  double v26 = v59;
  [(TSDBezierNode *)v59 setReflectedState:1];
  [(NSMutableArray *)self->mNodes insertObject:v26 atIndex:[(NSMutableArray *)self->mNodes indexOfObject:v12]];
  return v26;
}

- (CGRect)nodeBounds
{
  uint64_t v3 = (double *)MEMORY[0x263F001A8];
  CGFloat v4 = *(double *)(MEMORY[0x263F001A8] + 16);
  CGFloat v5 = *(double *)(MEMORY[0x263F001A8] + 24);
  if ([(NSMutableArray *)[(TSDBezierSubpath *)self nodes] count])
  {
    char v6 = (void *)[(NSMutableArray *)[(TSDBezierSubpath *)self nodes] objectEnumerator];
    objc_msgSend((id)objc_msgSend(v6, "nextObject"), "nodePoint");
    double v8 = v7;
    CGFloat v10 = v9;
    uint64_t v11 = [v6 nextObject];
    if (v11)
    {
      uint64_t v12 = (void *)v11;
      do
      {
        [v12 nodePoint];
        double v8 = TSDGrowRectToPoint(v8, v10, v4, v5, v13, v14);
        CGFloat v10 = v15;
        CGFloat v4 = v16;
        CGFloat v5 = v17;
        if ([v12 isSelected])
        {
          [v12 inControlPoint];
          double v20 = TSDGrowRectToPoint(v8, v10, v4, v5, v18, v19);
          CGFloat v22 = v21;
          CGFloat v24 = v23;
          CGFloat v26 = v25;
          [v12 outControlPoint];
          double v8 = TSDGrowRectToPoint(v20, v22, v24, v26, v27, v28);
          CGFloat v10 = v29;
          CGFloat v4 = v30;
          CGFloat v5 = v31;
        }
        uint64_t v12 = (void *)[v6 nextObject];
      }
      while (v12);
    }
  }
  else
  {
    double v8 = *v3;
    CGFloat v10 = v3[1];
  }
  double v32 = v8;
  double v33 = v10;
  double v34 = v4;
  double v35 = v5;
  result.size.height = v35;
  result.size.width = v34;
  result.origin.double y = v33;
  result.origin.double x = v32;
  return result;
}

- (void)sharpenAllNodes
{
}

- (void)smoothNode:(id)a3
{
  id v5 = -[TSDBezierSubpath nodePriorToNode:](self, "nodePriorToNode:");
  id v6 = [(TSDBezierSubpath *)self nodeAfterNode:a3];
  double v7 = v6;
  double v8 = *MEMORY[0x263F00148];
  double v9 = *(double *)(MEMORY[0x263F00148] + 8);
  if (v5)
  {
    [v5 nodePoint];
    double v11 = v10;
    double v13 = v12;
    [a3 nodePoint];
    double v15 = TSDSubtractPoints(v11, v13, v14);
    double v17 = v16;
    if (!v7)
    {
      [a3 nodePoint];
      double v19 = v18;
      double v21 = v20;
      double v22 = TSDMultiplyPointScalar(v15, v17, 0.330000013);
      double v23 = TSDAddPoints(v19, v21, v22);
      [a3 setInControlPoint:v23];
      return;
    }
  }
  else
  {
    double v15 = *MEMORY[0x263F00148];
    double v17 = *(double *)(MEMORY[0x263F00148] + 8);
    if (!v6) {
      return;
    }
  }
  [v7 nodePoint];
  double v25 = v24;
  double v27 = v26;
  [a3 nodePoint];
  double v29 = TSDSubtractPoints(v25, v27, v28);
  double v31 = v30;
  if (v5)
  {
    if (!TSDNearlyEqualPoints(v15, v17, v8, v9) && !TSDNearlyEqualPoints(v29, v31, v8, v9))
    {
      [a3 inControlPoint];
      double v39 = v38;
      double v41 = v40;
      [a3 nodePoint];
      if (TSDNearlyEqualPoints(v39, v41, v42, v43))
      {
        [a3 nodePoint];
        double v45 = v44;
        double v47 = v46;
        double v48 = TSDMultiplyPointScalar(v15, v17, 0.100000001);
        objc_msgSend(a3, "setInControlPoint:", TSDAddPoints(v45, v47, v48));
      }
      [a3 outControlPoint];
      double v50 = v49;
      double v52 = v51;
      [a3 nodePoint];
      if (TSDNearlyEqualPoints(v50, v52, v53, v54))
      {
        [a3 nodePoint];
        double v56 = v55;
        double v58 = v57;
        double v59 = TSDMultiplyPointScalar(v29, v31, 0.100000001);
        objc_msgSend(a3, "setOutControlPoint:", TSDAddPoints(v56, v58, v59));
      }
      [a3 inControlPoint];
      double v61 = v60;
      double v63 = v62;
      [a3 nodePoint];
      double v65 = TSDSubtractPoints(v61, v63, v64);
      double v67 = v66;
      double v68 = TSDPointLength(v65, v66);
      double v115 = TSDMultiplyPointScalar(v65, v67, 1.0 / v68);
      double v116 = v69;
      [a3 nodePoint];
      double v71 = v70;
      double v73 = v72;
      [a3 outControlPoint];
      double v75 = TSDSubtractPoints(v71, v73, v74);
      double v77 = v76;
      double v78 = TSDPointLength(v75, v76);
      double v79 = TSDMultiplyPointScalar(v75, v77, 1.0 / v78);
      double v81 = v80;
      double v82 = TSDPointLength(v15, v17);
      double v83 = v82 * 0.5 + (v68 - v82 * 0.5) * 0.699999988;
      double v84 = TSDPointLength(v29, v31) * 0.5;
      double v85 = v84 + (v78 - v84) * 0.699999988;
      double v86 = TSDAddPoints(v115, v116, v79);
      double v88 = TSDMultiplyPointScalar(v86, v87, 0.5);
      double v90 = v89;
      double v91 = TSDPointLength(v88, v89);
      if (v91 >= 0.5) {
        double v92 = TSDMultiplyPointScalar(v88, v90, 1.0 / v91);
      }
      else {
        double v92 = TSDRotatePoint90Degrees(0, v79, v81);
      }
      double v94 = v92;
      double v95 = v93;
      double v96 = v83 * TSDDotPoints(v115, v116, v92, v93);
      double v97 = -(v85 * TSDDotPoints(v79, v81, v94, v95));
      *(double *)v99.i64 = fabs(v96);
      *(double *)v100.i64 = v83 * 0.5;
      if (*(double *)v99.i64 < v83 * 0.5)
      {
        *(float *)v100.i32 = *(double *)v100.i64;
        *(float *)v99.i32 = v96;
        v101.i64[0] = 0x8000000080000000;
        v101.i64[1] = 0x8000000080000000;
        int8x16_t v100 = vbslq_s8(v101, v100, v99);
        double v96 = *(float *)v100.i32;
      }
      *(double *)v100.i64 = fabs(v97);
      *(double *)v98.i64 = v85 * 0.5;
      BOOL v102 = *(double *)v100.i64 < v85 * 0.5;
      *(float *)v98.i32 = v85 * 0.5;
      *(float *)v100.i32 = v97;
      v103.i64[0] = 0x8000000080000000;
      v103.i64[1] = 0x8000000080000000;
      *(double *)v98.i64 = *(float *)vbslq_s8(v103, v98, v100).i32;
      if (v102) {
        double v104 = *(double *)v98.i64;
      }
      else {
        double v104 = v97;
      }
      [a3 nodePoint];
      double v106 = v105;
      double v108 = v107;
      double v109 = TSDMultiplyPointScalar(v94, v95, v96);
      objc_msgSend(a3, "setInControlPoint:", TSDAddPoints(v106, v108, v109));
      [a3 nodePoint];
      double v111 = v110;
      double v113 = v112;
      double v114 = TSDMultiplyPointScalar(v94, v95, v104);
      objc_msgSend(a3, "setOutControlPoint:", TSDAddPoints(v111, v113, v114));
      [a3 setReflectedState:1];
    }
  }
  else
  {
    [a3 nodePoint];
    double v33 = v32;
    double v35 = v34;
    double v36 = TSDMultiplyPointScalar(v29, v31, 0.330000013);
    double v37 = TSDAddPoints(v33, v35, v36);
    [a3 setOutControlPoint:v37];
  }
}

- (BOOL)closeIfEndpointsAreEqual
{
  if ([(TSDBezierSubpath *)self isClosed])
  {
    LOBYTE(v3) = 0;
  }
  else
  {
    CGFloat v4 = [(TSDBezierSubpath *)self firstNode];
    id v5 = [(TSDBezierSubpath *)self lastNode];
    [(TSDBezierNode *)v5 nodePoint];
    double v7 = v6;
    double v9 = v8;
    [(TSDBezierNode *)v4 nodePoint];
    BOOL v3 = TSDNearlyEqualPoints(v7, v9, v10, v11);
    if (v3)
    {
      [(TSDBezierNode *)v5 inControlPoint];
      -[TSDBezierNode setInControlPoint:](v4, "setInControlPoint:");
      [(TSDBezierSubpath *)self removeLastNode];
      [(TSDBezierSubpath *)self setClosed:1];
    }
    [(TSDBezierNode *)v4 updateReflectedState];
  }
  return v3;
}

- (void)addNodesToArray:(id)a3
{
}

- (id)splitEdgeAtIndex:(unint64_t)a3
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v5 = (void *)-[NSMutableArray objectAtIndexedSubscript:](self->mNodes, "objectAtIndexedSubscript:");
  unint64_t v6 = a3 + 1;
  double v7 = (void *)[(NSMutableArray *)self->mNodes objectAtIndexedSubscript:(a3 + 1) % [(NSMutableArray *)self->mNodes count]];
  [v5 nodePoint];
  double v9 = v8;
  double v11 = v10;
  v38.f64[0] = v8;
  v38.f64[1] = v10;
  [v5 outControlPoint];
  double v13 = v12;
  double v15 = v14;
  double v39 = v12;
  double v40 = v14;
  [v7 inControlPoint];
  double v17 = v16;
  double v19 = v18;
  double v41 = v16;
  double v42 = v18;
  [v7 nodePoint];
  double v21 = v20;
  double v23 = v22;
  double v43 = v20;
  double v44 = v22;
  if (TSDNearlyEqualPoints(v9, v11, v13, v15) && TSDNearlyEqualPoints(v17, v19, v21, v23))
  {
    double v39 = TSDMixPoints(v9, v11, v21, v23, 0.333333333);
    double v40 = v24;
    double v41 = TSDMixPoints(v9, v11, v21, v23, 0.666666667);
    double v42 = v25;
  }
  double v26 = +[TSDBezierNode bezierNodeWithPoint:TSDPointOnCurve(&v38, 0.5)];
  [(TSDBezierNode *)v26 setReflectedState:2];
  [(TSDBezierNode *)v26 setType:3];
  [(NSMutableArray *)self->mNodes insertObject:v26 atIndex:v6];
  TSDCurveBetween(&v38, (uint64_t)v33, 0.0, 0.5);
  TSDCurveBetween(&v38, (uint64_t)v28, 0.5, 1.0);
  objc_msgSend(v5, "setOutControlPoint:", v34, v35);
  -[TSDBezierNode setInControlPoint:](v26, "setInControlPoint:", v36, v37);
  -[TSDBezierNode setOutControlPoint:](v26, "setOutControlPoint:", v29, v30);
  objc_msgSend(v7, "setInControlPoint:", v31, v32);
  return v26;
}

- (void)convertToHobby
{
  uint64_t v3 = [(NSMutableArray *)self->mNodes count];
  if (v3)
  {
    unint64_t v4 = v3;
    uint64_t v5 = [(TSDBezierSubpath *)self isClosed] ^ 1;
    unint64_t v6 = v4 - v5;
    if (v4 != v5)
    {
      uint64_t v7 = 0;
      do
      {
        float64_t v8 = (void *)[(NSMutableArray *)self->mNodes objectAtIndexedSubscript:v7];
        unint64_t v9 = v7 + 1;
        float64_t v10 = (void *)[(NSMutableArray *)self->mNodes objectAtIndexedSubscript:(v7 + 1) % v4];
        if ([v8 reflectedState])
        {
          [v8 setType:3];
        }
        else if (![v8 reflectedState])
        {
          [v8 setType:1];
          if (![v10 reflectedState])
          {
            [v8 nodePoint];
            double v12 = v11;
            double v14 = v13;
            [v8 outControlPoint];
            if (!TSDNearlyEqualPoints(v12, v14, v15, v16)
              || ([v10 nodePoint],
                  double v18 = v17,
                  double v20 = v19,
                  [v10 inControlPoint],
                  !TSDNearlyEqualPoints(v18, v20, v21, v22)))
            {
              [(TSDBezierSubpath *)self splitEdgeAtIndex:v7];
              ++v6;
              ++v4;
            }
          }
        }
        ++v7;
      }
      while (v9 < v6);
    }
  }
}

- (NSMutableArray)nodes
{
  return self->mNodes;
}

- (void)setNodes:(id)a3
{
}

- (BOOL)isClosed
{
  return self->mClosed;
}

- (void)setClosed:(BOOL)a3
{
  self->BOOL mClosed = a3;
}

@end
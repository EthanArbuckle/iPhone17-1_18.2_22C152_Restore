@interface CRLBezierSubpath
- (BOOL)allNodesSelected;
- (BOOL)canDeleteSelectedNodes;
- (BOOL)closeIfEndpointsAreEqual;
- (BOOL)hasSelectedNode;
- (BOOL)isCircular;
- (BOOL)isClosed;
- (BOOL)isRectangular;
- (CGPoint)calculateNewControlFromOriginalDelta:(CGPoint)a3 currentDelta:(CGPoint)a4 originalSmoothDelta:(CGPoint)a5 node:(CGPoint)a6;
- (CGRect)nodeBounds;
- (CRLBezierNode)firstNode;
- (CRLBezierNode)lastNode;
- (CRLBezierPath)bezierPath;
- (CRLBezierSubpath)init;
- (NSArray)nodes;
- (double)distanceToPoint:(CGPoint)a3 elementIndex:(unint64_t *)a4 tValue:(double *)a5 threshold:(double)a6;
- (id)bezierNodeUnderPoint:(CGPoint)a3 withTransform:(CGAffineTransform *)a4 andTolerance:(double)a5 returningType:(int64_t *)a6;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)nodeAfterNode:(id)a3;
- (id)nodePriorToNode:(id)a3;
- (id)splitEdgeAtIndex:(unint64_t)a3 atPercentage:(double)a4;
- (int64_t)updateSmoothNodes:(id)a3 from:(int64_t)a4 to:(int64_t)a5 closed:(BOOL)a6 addTemporaryNodes:(BOOL)a7;
- (void)addNode:(id)a3;
- (void)addNodesToArray:(id)a3;
- (void)addTemporarySmoothNodes;
- (void)appendToBezierPath:(id)a3;
- (void)appendToBezierPath:(id)a3 selectedNodesOnly:(BOOL)a4 fromIndex:(unint64_t)a5;
- (void)convertToHobby;
- (void)deleteSelectedNodes;
- (void)deselectAllNodes;
- (void)morphWithMorphInfo:(id)a3;
- (void)offsetSelectedEdgesByDelta:(CGPoint)a3;
- (void)offsetSelectedNodesByDelta:(CGPoint)a3;
- (void)removeLastNode;
- (void)removeNode:(id)a3;
- (void)removeTemporaryNodes;
- (void)reverseDirection;
- (void)selectAllNodes;
- (void)setClosed:(BOOL)a3;
- (void)setNodes:(id)a3;
- (void)sharpenAllNodes;
- (void)smoothAllNodes;
- (void)smoothNode:(id)a3;
- (void)transformUsingAffineTransform:(CGAffineTransform *)a3;
- (void)updateReflectedState;
- (void)updateSmoothNodes;
- (void)updateSmoothNodes:(id)a3 addTemporaryNodes:(BOOL)a4;
@end

@implementation CRLBezierSubpath

- (CRLBezierSubpath)init
{
  v6.receiver = self;
  v6.super_class = (Class)CRLBezierSubpath;
  v2 = [(CRLBezierSubpath *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    mNodes = v2->mNodes;
    v2->mNodes = v3;
  }
  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init((Class)objc_opt_class());
  id v5 = objc_alloc((Class)NSArray);
  objc_super v6 = [(CRLBezierSubpath *)self nodes];
  id v7 = [v5 initWithArray:v6 copyItems:1];

  [v4 setNodes:v7];
  [v4 setClosed:self->mClosed];

  return v4;
}

- (id)description
{
  v3 = (objc_class *)objc_opt_class();
  uint64_t v4 = NSStringFromClass(v3);
  id v5 = (void *)v4;
  if (self->mClosed) {
    CFStringRef v6 = @"YES";
  }
  else {
    CFStringRef v6 = @"NO";
  }
  id v7 = +[NSString stringWithFormat:@"<%@ %p nodes=%p closed=%@>", v4, self, self->mNodes, v6];

  return v7;
}

- (void)setNodes:(id)a3
{
  uint64_t v4 = (NSMutableArray *)[a3 mutableCopy];
  mNodes = self->mNodes;
  self->mNodes = v4;
}

- (BOOL)isRectangular
{
  unsigned int v3 = [(CRLBezierSubpath *)self isClosed];
  if (!v3) {
    return v3;
  }
  uint64_t v4 = [(CRLBezierSubpath *)self nodes];
  id v5 = [v4 count];

  if (v5 != (id)4) {
    goto LABEL_24;
  }
  memset(v45, 0, sizeof(v45));
  CFStringRef v6 = [(CRLBezierSubpath *)self nodes];
  [v6 getObjects:v45 range:0, 4];

  unint64_t v7 = 0;
  do
  {
    unsigned int v3 = [*((id *)v45 + v7) isCollapsed];
    if (v3) {
      BOOL v8 = v7 >= 3;
    }
    else {
      BOOL v8 = 1;
    }
    ++v7;
  }
  while (!v8);
  if (v3)
  {
    uint64_t v9 = 0;
    v10 = (void **)v45;
    do
    {
      v11 = &v44[v9 - 1];
      v12 = *v10++;
      [v12 nodePoint];
      *(void *)v11 = v13;
      *((void *)v11 + 1) = v14;
      v9 += 2;
    }
    while (v9 != 8);
    unint64_t v15 = 0;
    v16 = v44;
    do
    {
      double v17 = *(v16 - 1);
      double v18 = *v16;
      v19 = &v44[2 * ((v15 + 1) & 3) - 1];
      double v20 = *v19;
      double v21 = v19[1];
      v22 = &v44[2 * ((v15 + 2) & 3) - 1];
      double v23 = *v22;
      double v24 = v22[1];
      double v25 = sub_1000653B4(v17, *v16, v20, v21);
      double v26 = sub_1000653B4(v20, v21, v23, v24);
      double v27 = vabdd_f64(sub_1000653B4(v17, v18, v23, v24), sqrt(v26 * v26 + v25 * v25));
      v16 += 2;
    }
    while (v27 <= 0.00100000005 && v15++ < 3);
    if (v27 <= 0.00100000005)
    {
      double v29 = sub_100064044(v43, v44[0], v44[1]);
      double v33 = sub_100065928(v29, v30, v31, v32, v44[3]);
      double v37 = sub_100065928(v33, v34, v35, v36, v44[5]);
      double v39 = v38;
      uint64_t v40 = 0;
      do
      {
        LOBYTE(v3) = sub_100064084(v44[v40 - 1], v44[v40], v37, v39);
        if (v3) {
          break;
        }
        BOOL v41 = v40 == 6;
        v40 += 2;
      }
      while (!v41);
      return v3;
    }
LABEL_24:
    LOBYTE(v3) = 0;
  }
  return v3;
}

- (BOOL)isCircular
{
  BOOL v3 = [(CRLBezierSubpath *)self isClosed];
  if (v3)
  {
    uint64_t v4 = [(CRLBezierSubpath *)self bezierPath];
    unsigned __int8 v5 = [v4 isCircular];

    LOBYTE(v3) = v5;
  }
  return v3;
}

- (CRLBezierPath)bezierPath
{
  BOOL v3 = +[CRLBezierPath bezierPath];
  [(CRLBezierSubpath *)self appendToBezierPath:v3 selectedNodesOnly:0 fromIndex:0];

  return (CRLBezierPath *)v3;
}

- (void)appendToBezierPath:(id)a3 selectedNodesOnly:(BOOL)a4 fromIndex:(unint64_t)a5
{
  BOOL v6 = a4;
  id v37 = a3;
  BOOL v8 = [(CRLBezierSubpath *)self nodes];
  unint64_t v9 = (unint64_t)[v8 count];

  if (!v9) {
    goto LABEL_27;
  }
  if (a5) {
    BOOL v10 = 1;
  }
  else {
    BOOL v10 = !self->mClosed;
  }
  char v11 = !v10;
  v12 = [(CRLBezierSubpath *)self nodes];
  uint64_t v13 = [v12 objectAtIndexedSubscript:a5];

  [v13 nodePoint];
  double v15 = v14;
  double v17 = v16;
  [v37 moveToPoint:];
  char v18 = 0;
  v19 = (char *)(v9 + self->mClosed);
  unint64_t v20 = a5 + 1;
  while (1)
  {
    double v21 = v13;
    if (v20 >= (unint64_t)v19) {
      break;
    }
    double v22 = v17;
    double v23 = v15;
    double v24 = [(CRLBezierSubpath *)self nodes];
    uint64_t v13 = [v24 objectAtIndexedSubscript:v20 % v9];

    [v13 nodePoint];
    double v15 = v25;
    double v17 = v26;
    if (!v6 || [v21 isSelected] && objc_msgSend(v13, "isSelected"))
    {
      [v21 outControlPoint];
      double v28 = v27;
      double v30 = v29;
      [v13 inControlPoint];
      double v32 = v31;
      double v34 = v33;
      if (v18) {
        [v37 moveToPoint:v23, v22];
      }
      if (sub_100064084(v23, v22, v28, v30))
      {
        BOOL v35 = sub_100064084(v32, v34, v15, v17);
        CGFloat v36 = v37;
        if (v35)
        {
          [v37 lineToPoint:v15, v17];
LABEL_21:
          char v18 = 0;
          goto LABEL_22;
        }
      }
      else
      {
        CGFloat v36 = v37;
      }
      [v36 curveToPoint:v15 controlPoint1:v17 controlPoint2:v28 v30 v32 v34];
      goto LABEL_21;
    }
    char v11 = 0;
    char v18 = 1;
LABEL_22:

    ++v20;
    if (!v13)
    {
      double v21 = 0;
      break;
    }
  }
  if (v11) {
    [v37 closePath];
  }

LABEL_27:
}

- (void)appendToBezierPath:(id)a3
{
}

- (void)updateReflectedState
{
  id v2 = [(CRLBezierSubpath *)self nodes];
  [v2 makeObjectsPerformSelector:"updateReflectedState"];
}

- (void)reverseDirection
{
  BOOL v3 = [(CRLBezierSubpath *)self nodes];
  id v8 = [v3 reverseObjectEnumerator];

  id v4 = objc_alloc_init((Class)NSMutableArray);
  uint64_t v5 = [v8 nextObject];
  if (v5)
  {
    BOOL v6 = (void *)v5;
    do
    {
      [v6 swapControlPoints];
      [v4 addObject:v6];
      uint64_t v7 = [v8 nextObject];

      BOOL v6 = (void *)v7;
    }
    while (v7);
  }
  [(CRLBezierSubpath *)self setNodes:v4];
}

- (void)transformUsingAffineTransform:(CGAffineTransform *)a3
{
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = [(CRLBezierSubpath *)self nodes];
  id v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      id v8 = 0;
      do
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        unint64_t v9 = *(void **)(*((void *)&v12 + 1) + 8 * (void)v8);
        long long v10 = *(_OWORD *)&a3->c;
        v11[0] = *(_OWORD *)&a3->a;
        v11[1] = v10;
        v11[2] = *(_OWORD *)&a3->tx;
        [v9 transformUsingAffineTransform:v11];
        id v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }
}

- (void)addNode:(id)a3
{
}

- (void)removeNode:(id)a3
{
}

- (void)removeLastNode
{
}

- (id)nodePriorToNode:(id)a3
{
  id v4 = a3;
  id v5 = [(CRLBezierSubpath *)self nodes];
  uint64_t v6 = (uint64_t)[v5 indexOfObject:v4];

  if (v6 >= 1)
  {
    uint64_t v7 = [(CRLBezierSubpath *)self nodes];
    uint64_t v8 = [v7 objectAtIndex:v6 - 1];
LABEL_5:
    unint64_t v9 = (void *)v8;

    goto LABEL_6;
  }
  if (self->mClosed)
  {
    uint64_t v7 = [(CRLBezierSubpath *)self nodes];
    uint64_t v8 = [v7 lastObject];
    goto LABEL_5;
  }
  unint64_t v9 = 0;
LABEL_6:

  return v9;
}

- (id)nodeAfterNode:(id)a3
{
  id v4 = a3;
  id v5 = [(CRLBezierSubpath *)self nodes];
  uint64_t v6 = (char *)[v5 indexOfObject:v4];

  uint64_t v7 = v6 + 1;
  uint64_t v8 = [(CRLBezierSubpath *)self nodes];
  unint64_t v9 = (char *)[v8 count];

  if (v7 < v9)
  {
    long long v10 = [(CRLBezierSubpath *)self nodes];
    char v11 = v10;
    long long v12 = v7;
LABEL_5:
    long long v13 = [v10 objectAtIndex:v12];

    goto LABEL_7;
  }
  if (self->mClosed)
  {
    long long v10 = [(CRLBezierSubpath *)self nodes];
    char v11 = v10;
    long long v12 = 0;
    goto LABEL_5;
  }
  long long v13 = 0;
LABEL_7:

  return v13;
}

- (CRLBezierNode)firstNode
{
  id v2 = [(CRLBezierSubpath *)self nodes];
  BOOL v3 = [v2 firstObject];

  return (CRLBezierNode *)v3;
}

- (CRLBezierNode)lastNode
{
  BOOL mClosed = self->mClosed;
  BOOL v3 = [(CRLBezierSubpath *)self nodes];
  id v4 = v3;
  if (mClosed) {
    [v3 objectAtIndex:0];
  }
  else {
  id v5 = [v3 lastObject];
  }

  return (CRLBezierNode *)v5;
}

- (void)offsetSelectedNodesByDelta:(CGPoint)a3
{
  double x = a3.x;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = [(CRLBezierSubpath *)self nodes];
  id v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        unint64_t v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if ([v9 isSelected])
        {
          [v9 nodePoint];
          [v9 moveToPoint:sub_100064698(v10, v11, x)];
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }
}

- (void)offsetSelectedEdgesByDelta:(CGPoint)a3
{
  double x = a3.x;
  id v5 = [(CRLBezierSubpath *)self nodes];
  id v14 = [v5 objectEnumerator];

  id v6 = [(CRLBezierSubpath *)self nodes];
  uint64_t v7 = [v6 lastObject];

  unsigned __int8 v8 = [v7 isSelected];
  uint64_t v9 = [v14 nextObject];
  if (v9)
  {
    double v10 = (void *)v9;
    do
    {
      if ((v8 & 1) != 0 || [v10 isSelected])
      {
        [v10 nodePoint];
        [v10 moveToPoint:sub_100064698(v11, v12, x)];
        unsigned __int8 v8 = [v10 isSelected];
      }
      else
      {
        unsigned __int8 v8 = 0;
      }
      uint64_t v13 = [v14 nextObject];

      double v10 = (void *)v13;
    }
    while (v13);
  }
}

- (BOOL)allNodesSelected
{
  id v2 = [(CRLBezierSubpath *)self nodes];
  BOOL v3 = [v2 reverseObjectEnumerator];

  id v4 = 0;
  do
  {
    id v5 = v4;
    id v4 = [v3 nextObject];
  }
  while (v4 && ([v4 isSelected] & 1) != 0);

  return v4 == 0;
}

- (BOOL)hasSelectedNode
{
  id v2 = [(CRLBezierSubpath *)self nodes];
  BOOL v3 = [v2 reverseObjectEnumerator];

  id v4 = 0;
  do
  {
    id v5 = v4;
    id v4 = [v3 nextObject];
  }
  while (v4 && ![v4 isSelected]);

  return v4 != 0;
}

- (BOOL)canDeleteSelectedNodes
{
  id v2 = [(CRLBezierSubpath *)self nodes];
  BOOL v3 = [v2 objectEnumerator];

  int v4 = 0;
  unint64_t v5 = 0;
  id v6 = 0;
  do
  {
    uint64_t v7 = v6;
    id v6 = [v3 nextObject];

    if (!v6) {
      break;
    }
    unsigned int v8 = [v6 isSelected];
    v4 |= v8;
    v5 += v8 ^ 1;
  }
  while ((v4 & 1) == 0 || v5 < 2);

  return v6 != 0;
}

- (void)deleteSelectedNodes
{
  BOOL v3 = [(CRLBezierSubpath *)self nodes];
  id v10 = [v3 objectEnumerator];

  id v4 = objc_alloc_init((Class)NSMutableArray);
  uint64_t v5 = [v10 nextObject];
  if (v5)
  {
    id v6 = (void *)v5;
    do
    {
      if (([v6 isSelected] & 1) == 0) {
        [v4 addObject:v6];
      }
      uint64_t v7 = [v10 nextObject];

      id v6 = (void *)v7;
    }
    while (v7);
  }
  [(CRLBezierSubpath *)self setNodes:v4];
  unsigned int v8 = [(CRLBezierSubpath *)self nodes];
  id v9 = [v8 count];

  if ((unint64_t)v9 <= 1) {
    [(CRLBezierSubpath *)self setClosed:0];
  }
}

- (void)selectAllNodes
{
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v2 = [(CRLBezierSubpath *)self nodes];
  id v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      id v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(*((void *)&v7 + 1) + 8 * (void)v6) setSelected:1];
        id v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      id v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (void)deselectAllNodes
{
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v2 = [(CRLBezierSubpath *)self nodes];
  id v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      id v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(*((void *)&v7 + 1) + 8 * (void)v6) setSelected:0];
        id v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      id v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (double)distanceToPoint:(CGPoint)a3 elementIndex:(unint64_t *)a4 tValue:(double *)a5 threshold:(double)a6
{
  long long v10 = [(CRLBezierSubpath *)self nodes];
  unint64_t v11 = (unint64_t)[v10 count];

  if (!v11) {
    return 1.79769313e308;
  }
  double v12 = [(CRLBezierSubpath *)self nodes];
  uint64_t v13 = [v12 objectAtIndexedSubscript:0];

  [v13 nodePoint];
  unint64_t v16 = 0;
  unint64_t v17 = v11 + self->mClosed;
  double v18 = 0.0;
  double v19 = 1.79769313e308;
  v48 = a5;
  if (v17 < 2 || (double v20 = v14, v21 = v15, v22 = a6 * a6, v23 = 1.79769313e308, v49 = a6 * a6, a6 * a6 >= 1.79769313e308))
  {
    id v24 = v13;
    v45 = 0;
LABEL_17:
    if (!a4) {
      goto LABEL_19;
    }
  }
  else
  {
    id v24 = 0;
    unint64_t v16 = 0;
    double v19 = 1.79769313e308;
    unint64_t v25 = 2;
    while (1)
    {
      double v51 = v19;
      double v52 = v18;
      double v26 = [(CRLBezierSubpath *)self nodes];
      double v27 = [v26 objectAtIndexedSubscript:(v25 - 1) % v11];

      [v27 nodePoint];
      double v29 = v28;
      double v31 = v30;
      [v13 outControlPoint];
      double v33 = v32;
      double v35 = v34;
      [v27 inControlPoint];
      double v37 = v36;
      double v39 = v38;
      if (!sub_100064084(v20, v21, v33, v35)) {
        goto LABEL_8;
      }
      if (sub_100064084(v37, v39, v29, v31))
      {
        v53.f64[0] = v20;
        v53.f64[1] = v21;
        double v54 = v29;
        double v55 = v31;
        double x = a3.x;
        double y = a3.y;
        double v18 = sub_100347F0C(v53.f64, a3.x, a3.y);
        double v42 = sub_100065E00(v53.f64[0], v53.f64[1], v54, v55, v18);
      }
      else
      {
LABEL_8:
        v53.f64[0] = v20;
        v53.f64[1] = v21;
        double v54 = v33;
        double v55 = v35;
        double v56 = v37;
        double v57 = v39;
        double v58 = v29;
        double v59 = v31;
        double x = a3.x;
        double y = a3.y;
        double v18 = sub_100347FD4(&v53, a3.x, a3.y, 1.0);
        double v42 = sub_100064570(&v53, v18);
      }
      double v44 = sub_1000643CC(v42, v43, x, y);
      double v19 = v51;
      if (v44 >= v51)
      {
        double v18 = v52;
      }
      else
      {
        double v19 = v44;
        unint64_t v16 = v25 - 2;
      }
      id v24 = v27;

      if (v25 >= v17) {
        break;
      }
      ++v25;
      double v23 = v49;
      v45 = v24;
      double v21 = v31;
      double v20 = v29;
      uint64_t v13 = v24;
      if (v19 <= v49) {
        goto LABEL_17;
      }
    }
    v45 = v24;
    if (!a4) {
      goto LABEL_19;
    }
  }
  *a4 = v16;
LABEL_19:
  if (v48) {
    double *v48 = v18;
  }
  double v46 = sqrt(v19);

  return v46;
}

- (id)bezierNodeUnderPoint:(CGPoint)a3 withTransform:(CGAffineTransform *)a4 andTolerance:(double)a5 returningType:(int64_t *)a6
{
  double y = a3.y;
  double x = a3.x;
  unint64_t v11 = [(CRLBezierSubpath *)self nodes];
  double v12 = [v11 objectEnumerator];

  uint64_t v13 = 0;
  while (1)
  {
    double v14 = v13;
    uint64_t v13 = [v12 nextObject];

    if (!v13) {
      break;
    }
    long long v15 = *(_OWORD *)&a4->c;
    v18[0] = *(_OWORD *)&a4->a;
    v18[1] = v15;
    v18[2] = *(_OWORD *)&a4->tx;
    if (objc_msgSend(v13, "underPoint:withTransform:andTolerance:returningType:", v18, a6, x, y, a5))
    {
      id v16 = v13;
      break;
    }
  }

  return v13;
}

- (CGRect)nodeBounds
{
  CGFloat width = CGRectZero.size.width;
  CGFloat height = CGRectZero.size.height;
  uint64_t v5 = [(CRLBezierSubpath *)self nodes];
  id v6 = [v5 count];

  if (v6)
  {
    long long v7 = [(CRLBezierSubpath *)self nodes];
    long long v8 = [v7 objectEnumerator];

    long long v9 = [v8 nextObject];
    [v9 nodePoint];
    double x = v10;
    CGFloat y = v12;
    double v14 = [v8 nextObject];

    if (v14)
    {
      do
      {
        [v14 nodePoint];
        double x = sub_100065928(x, y, width, height, v15);
        CGFloat y = v16;
        CGFloat width = v17;
        CGFloat height = v18;
        if ([v14 isSelected])
        {
          [v14 inControlPoint];
          double v20 = sub_100065928(x, y, width, height, v19);
          CGFloat v22 = v21;
          CGFloat v24 = v23;
          CGFloat v26 = v25;
          [v14 outControlPoint];
          double x = sub_100065928(v20, v22, v24, v26, v27);
          CGFloat y = v28;
          CGFloat width = v29;
          CGFloat height = v30;
        }
        uint64_t v31 = [v8 nextObject];

        double v14 = (void *)v31;
      }
      while (v31);
    }
  }
  else
  {
    double x = CGRectZero.origin.x;
    CGFloat y = CGRectZero.origin.y;
  }
  double v32 = x;
  double v33 = y;
  double v34 = width;
  double v35 = height;
  result.size.CGFloat height = v35;
  result.size.CGFloat width = v34;
  result.origin.CGFloat y = v33;
  result.origin.double x = v32;
  return result;
}

- (void)sharpenAllNodes
{
  id v2 = [(CRLBezierSubpath *)self nodes];
  [v2 makeObjectsPerformSelector:"collapse"];
}

- (void)smoothNode:(id)a3
{
  id v113 = a3;
  id v4 = [(CRLBezierSubpath *)self nodePriorToNode:v113];
  uint64_t v5 = [(CRLBezierSubpath *)self nodeAfterNode:v113];
  id v6 = (void *)v5;
  double y = CGPointZero.y;
  if (v4)
  {
    [v4 nodePoint];
    double v9 = v8;
    double v11 = v10;
    [v113 nodePoint];
    double x = sub_100064680(v9, v11, v12);
    double v15 = v14;
    if (!v6)
    {
      [v113 nodePoint];
      double v17 = v16;
      double v19 = v18;
      double v20 = sub_1000646A4(x, v15, 0.330000013);
      [v113 setInControlPoint:sub_100064698(v17, v19, v20)];
      goto LABEL_22;
    }
  }
  else
  {
    double x = CGPointZero.x;
    double v15 = CGPointZero.y;
    if (!v5) {
      goto LABEL_22;
    }
  }
  [v6 nodePoint];
  double v22 = v21;
  double v24 = v23;
  [v113 nodePoint];
  double v26 = sub_100064680(v22, v24, v25);
  double v28 = v27;
  if (v4)
  {
    if (!sub_100064084(x, v15, CGPointZero.x, y) && !sub_100064084(v26, v28, CGPointZero.x, y))
    {
      [v113 inControlPoint];
      double v30 = v29;
      double v32 = v31;
      [v113 nodePoint];
      if (sub_100064084(v30, v32, v33, v34))
      {
        [v113 nodePoint];
        double v36 = v35;
        double v38 = v37;
        double v39 = sub_1000646A4(x, v15, 0.100000001);
        [v113 setInControlPoint:sub_100064698(v36, v38, v39)];
      }
      [v113 outControlPoint];
      double v41 = v40;
      double v43 = v42;
      [v113 nodePoint];
      if (sub_100064084(v41, v43, v44, v45))
      {
        [v113 nodePoint];
        double v47 = v46;
        double v49 = v48;
        double v50 = sub_1000646A4(v26, v28, 0.100000001);
        [v113 setOutControlPoint:sub_100064698(v47, v49, v50)];
      }
      [v113 inControlPoint];
      double v52 = v51;
      double v54 = v53;
      [v113 nodePoint];
      double v56 = sub_100064680(v52, v54, v55);
      double v58 = v57;
      double v59 = sub_100065398(v56, v57);
      double v111 = sub_1000646A4(v56, v58, 1.0 / v59);
      double v112 = v60;
      [v113 nodePoint];
      double v62 = v61;
      double v64 = v63;
      [v113 outControlPoint];
      double v66 = sub_100064680(v62, v64, v65);
      double v68 = v67;
      double v69 = sub_100065398(v66, v67);
      double v70 = sub_1000646A4(v66, v68, 1.0 / v69);
      double v72 = v71;
      double v73 = sub_100065398(x, v15);
      double v74 = v73 * 0.5 + (v59 - v73 * 0.5) * 0.699999988;
      double v75 = sub_100065398(v26, v28) * 0.5;
      double v76 = v75 + (v69 - v75) * 0.699999988;
      double v77 = sub_100064698(v111, v112, v70);
      double v79 = sub_1000646A4(v77, v78, 0.5);
      double v81 = v80;
      double v82 = sub_100065398(v79, v80);
      if (v82 >= 0.5) {
        double v83 = sub_1000646A4(v79, v81, 1.0 / v82);
      }
      else {
        double v83 = sub_100066394(0, v70, v72);
      }
      double v90 = v83;
      double v91 = v84;
      double v92 = v74 * sub_10006468C(v111, v112, v83, v84);
      double v93 = -(v76 * sub_10006468C(v70, v72, v90, v91));
      *(double *)v95.i64 = fabs(v92);
      *(double *)v96.i64 = v74 * 0.5;
      if (*(double *)v95.i64 < v74 * 0.5)
      {
        *(float *)v96.i32 = *(double *)v96.i64;
        *(float *)v95.i32 = v92;
        v97.i64[0] = 0x8000000080000000;
        v97.i64[1] = 0x8000000080000000;
        int8x16_t v96 = vbslq_s8(v97, v96, v95);
        double v92 = *(float *)v96.i32;
      }
      *(double *)v96.i64 = fabs(v93);
      *(double *)v94.i64 = v76 * 0.5;
      BOOL v98 = *(double *)v96.i64 < v76 * 0.5;
      *(float *)v94.i32 = v76 * 0.5;
      *(float *)v96.i32 = v93;
      v99.i64[0] = 0x8000000080000000;
      v99.i64[1] = 0x8000000080000000;
      *(double *)v94.i64 = *(float *)vbslq_s8(v99, v94, v96).i32;
      if (v98) {
        double v100 = *(double *)v94.i64;
      }
      else {
        double v100 = v93;
      }
      [v113 nodePoint];
      double v102 = v101;
      double v104 = v103;
      double v105 = sub_1000646A4(v90, v91, v92);
      [v113 setInControlPoint:sub_100064698(v102, v104, v105)];
      [v113 nodePoint];
      double v107 = v106;
      double v109 = v108;
      double v110 = sub_1000646A4(v90, v91, v100);
      [v113 setOutControlPoint:sub_100064698(v107, v109, v110)];
      [v113 setReflectedState:1];
    }
  }
  else
  {
    [v113 nodePoint];
    double v86 = v85;
    double v88 = v87;
    double v89 = sub_1000646A4(v26, v28, 0.330000013);
    [v113 setOutControlPoint:sub_100064698(v86, v88, v89)];
  }
LABEL_22:
}

- (BOOL)closeIfEndpointsAreEqual
{
  if ([(CRLBezierSubpath *)self isClosed])
  {
    LOBYTE(v3) = 0;
  }
  else
  {
    id v4 = [(CRLBezierSubpath *)self firstNode];
    uint64_t v5 = [(CRLBezierSubpath *)self lastNode];
    [v5 nodePoint];
    double v7 = v6;
    double v9 = v8;
    [v4 nodePoint];
    BOOL v3 = sub_100064084(v7, v9, v10, v11);
    if (v3)
    {
      [v5 inControlPoint];
      [v4 setInControlPoint:];
      [(CRLBezierSubpath *)self removeLastNode];
      [(CRLBezierSubpath *)self setClosed:1];
    }
    [v4 updateReflectedState];
  }
  return v3;
}

- (void)addNodesToArray:(id)a3
{
  id v4 = a3;
  id v5 = [(CRLBezierSubpath *)self nodes];
  [v4 addObjectsFromArray:v5];
}

- (id)splitEdgeAtIndex:(unint64_t)a3 atPercentage:(double)a4
{
  double v6 = [(CRLBezierSubpath *)self nodes];
  double v7 = [v6 objectAtIndexedSubscript:a3];

  double v8 = [(CRLBezierSubpath *)self nodes];
  unint64_t v9 = a3 + 1;
  double v10 = [(CRLBezierSubpath *)self nodes];
  double v11 = [v8 objectAtIndexedSubscript:(a3 + 1) % (unint64_t)[v10 count]];

  [v7 nodePoint];
  double v13 = v12;
  double v15 = v14;
  v45.f64[0] = v12;
  v45.f64[1] = v14;
  [v7 outControlPoint];
  double v17 = v16;
  double v19 = v18;
  double v46 = v16;
  double v47 = v18;
  [v11 inControlPoint];
  double v21 = v20;
  double v23 = v22;
  double v48 = v20;
  double v49 = v22;
  [v11 nodePoint];
  double v25 = v24;
  double v27 = v26;
  double v50 = v24;
  double v51 = v26;
  if (sub_100064084(v13, v15, v17, v19) && sub_100064084(v21, v23, v25, v27))
  {
    double v46 = sub_100065E00(v13, v15, v25, v27, 0.333333333);
    double v47 = v28;
    double v48 = sub_100065E00(v13, v15, v25, v27, 0.666666667);
    double v49 = v29;
  }
  double v30 = +[CRLBezierNode bezierNodeWithPoint:sub_100064570(&v45, a4)];
  [v30 setReflectedState:2];
  [v30 setType:3];
  double v31 = [(CRLBezierSubpath *)self nodes];
  id v32 = [v31 mutableCopy];

  [v32 insertObject:v30 atIndex:v9];
  [(CRLBezierSubpath *)self setNodes:v32];
  sub_100347D40(&v45, (uint64_t)v40, 0.0, a4);
  sub_100347D40(&v45, (uint64_t)v35, a4, 1.0);
  [v7 setOutControlPoint:v41, v42];
  [v30 setInControlPoint:v43, v44];
  [v30 setOutControlPoint:v36, v37];
  [v11 setInControlPoint:v38, v39];

  return v30;
}

- (void)convertToHobby
{
  BOOL v3 = [(CRLBezierSubpath *)self nodes];
  unint64_t v4 = (unint64_t)[v3 count];

  if (v4)
  {
    id v5 = (void *)([(CRLBezierSubpath *)self isClosed] ^ 1);
    double v6 = (char *)(v4 - (void)v5);
    if ((void *)v4 != v5)
    {
      uint64_t v7 = 0;
      do
      {
        double v8 = [(CRLBezierSubpath *)self nodes];
        unint64_t v9 = [v8 objectAtIndexedSubscript:v7];

        double v10 = [(CRLBezierSubpath *)self nodes];
        unint64_t v11 = v7 + 1;
        float64_t v12 = [v10 objectAtIndexedSubscript:(v7 + 1) % v4];

        if ([v9 reflectedState])
        {
          [v9 setType:3];
        }
        else if (![v9 reflectedState])
        {
          [v9 setType:1];
          if (![v12 reflectedState])
          {
            [v9 nodePoint];
            double v14 = v13;
            double v16 = v15;
            [v9 outControlPoint];
            if (!sub_100064084(v14, v16, v17, v18)
              || ([v12 nodePoint],
                  double v20 = v19,
                  double v22 = v21,
                  [v12 inControlPoint],
                  !sub_100064084(v20, v22, v23, v24)))
            {
              id v25 = [(CRLBezierSubpath *)self splitEdgeAtIndex:v7 atPercentage:0.5];
              ++v6;
              ++v4;
            }
          }
        }

        ++v7;
      }
      while (v11 < (unint64_t)v6);
    }
  }
}

- (NSArray)nodes
{
  return &self->mNodes->super;
}

- (BOOL)isClosed
{
  return self->mClosed;
}

- (void)setClosed:(BOOL)a3
{
  self->BOOL mClosed = a3;
}

- (void).cxx_destruct
{
}

- (void)smoothAllNodes
{
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  BOOL v3 = [(CRLBezierSubpath *)self nodes];
  id v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v8 + 1) + 8 * (void)v7) setType:3];
        uint64_t v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }

  [(CRLBezierSubpath *)self updateSmoothNodes];
}

- (CGPoint)calculateNewControlFromOriginalDelta:(CGPoint)a3 currentDelta:(CGPoint)a4 originalSmoothDelta:(CGPoint)a5 node:(CGPoint)a6
{
  double x = a6.x;
  CGFloat y = a5.y;
  CGFloat v7 = a5.x;
  double v8 = a4.y;
  CGFloat v9 = a4.x;
  CGFloat v10 = a3.y;
  CGFloat v11 = a3.x;
  double v12 = 1.0;
  double v13 = 0.0;
  if (!sub_100064084(a3.x, a3.y, a5.x, a5.y) && !sub_100064084(CGPointZero.x, CGPointZero.y, v7, y))
  {
    double v26 = v8;
    double v14 = sub_100065398(v11, v10);
    double v12 = v14 / sub_100065398(v7, y);
    double v15 = sub_100065C1C(v11, v10);
    double v13 = v15 - sub_100065C1C(v7, y);
    double v8 = v26;
  }
  double v16 = sub_100065398(v9, v8);
  long double v17 = v8;
  double v18 = v12 * v16;
  double v19 = sub_100065C1C(v9, v17);
  double v20 = sub_1000662E0(v13 + v19);
  double v22 = sub_1000646A4(v20, v21, v18);

  double v24 = sub_100064698(v22, v23, x);
  result.CGFloat y = v25;
  result.double x = v24;
  return result;
}

- (void)morphWithMorphInfo:(id)a3
{
  id v169 = a3;
  id v4 = [(CRLBezierSubpath *)self nodes];
  unint64_t v5 = (unint64_t)[v4 count];

  if (v5)
  {
    v163 = (char *)malloc_type_malloc(32 * v5, 0x9EDE2835uLL);
    v170 = (double *)malloc_type_malloc(16 * v5, 0x5AB53934uLL);
    uint64_t v6 = [(CRLBezierSubpath *)self isClosed] ^ 1;
    uint64_t v7 = v5 - v6;
    unint64_t v164 = v5;
    if (v5 != v6)
    {
      unint64_t v8 = 0;
      do
      {
        uint64_t v9 = v8++;
        CGFloat v10 = [(CRLBezierSubpath *)self nodes];
        CGFloat v11 = [v10 objectAtIndexedSubscript:v9];

        double v12 = [(CRLBezierSubpath *)self nodes];
        double v13 = [v12 objectAtIndexedSubscript:v8 % v5];

        if ([v11 type] == (id)1 && objc_msgSend(v13, "type") == (id)1)
        {
          double v14 = [v169 originalNodeForNode:v11];
          uint64_t v15 = [v169 originalNodeForNode:v13];
          double v16 = (void *)v15;
          if (v14 && v15 && [v14 type] == (id)1 && objc_msgSend(v16, "type") == (id)1)
          {
            id v175 = [v169 originalSubpathIndexForNode:v11];
            long double v17 = [v169 original];
            double v18 = [v17 subpaths];
            v173 = [v18 objectAtIndexedSubscript:v175];

            double v19 = (char *)[v169 originalNodeIndexForNode:v11];
            id v176 = [v169 originalNodeIndexForNode:v13];
            unint64_t v20 = (unint64_t)(v19 + 1);
            double v21 = v173;
            if ([v173 isClosed])
            {
              double v22 = [v173 nodes];
              v20 %= (unint64_t)[v22 count];

              double v21 = v173;
            }
            if ((id)v20 == v176)
            {
              [v11 nodePoint];
              double v24 = v23;
              double v26 = v25;
              [v13 nodePoint];
              _ZF = v24 == v28 && v26 == v27;
              if (_ZF
                || (([v14 nodePoint], double v31 = v30, v33 = v32, objc_msgSend(v16, "nodePoint"), v31 == v35)
                  ? (BOOL v36 = v33 == v34)
                  : (BOOL v36 = 0),
                    v36))
              {
                [v11 nodePoint];
                [v11 setOutControlPoint:];
                [v13 nodePoint];
                double v57 = v13;
              }
              else
              {
                float64x2_t v193 = 0u;
                float64x2_t v194 = 0u;
                float64x2_t v192 = 0u;
                [v14 nodePoint];
                double v38 = v37;
                double v40 = v39;
                [v16 nodePoint];
                double v42 = v41;
                double v44 = v43;
                [v11 nodePoint];
                CGFloat v46 = v45;
                double v48 = v47;
                [v13 nodePoint];
                sub_10007FD8C(1, (uint64_t)&v192, v38, v40, v42, v44, v46, v48, v49, v50);
                [v14 outControlPoint];
                [v11 setOutControlPoint:vaddq_f64(v194, vmlaq_n_f64(vmulq_n_f64(v193, v51), v192, v52))];
                [v16 inControlPoint];
                float64x2_t v55 = vaddq_f64(v194, vmlaq_n_f64(vmulq_n_f64(v193, v53), v192, v54));
                double v56 = v55.f64[1];
                double v57 = v13;
              }
              [v57 setInControlPoint:v55.f64[0] v56];
            }
          }
          unint64_t v5 = v164;
        }
      }
      while (v7 != v8);
    }
    uint64_t v58 = 0;
    uint64_t v59 = 0;
    if (v5 <= 1) {
      uint64_t v60 = 1;
    }
    else {
      uint64_t v60 = v5;
    }
    double v61 = v163 + 16;
    __asm { FMOV            V0.2D, #1.0 }
    long long v162 = _Q0;
    do
    {
      double v66 = [(CRLBezierSubpath *)self nodes];
      double v67 = [v66 objectAtIndex:v59];

      double v68 = [v169 originalNodeForNode:v67];
      double v69 = [v169 originalSmoothNodeForNode:v67];
      if (v68)
      {
        [v67 inControlPoint];
        double v71 = v70;
        double v73 = v72;
        [v67 nodePoint];
        double v75 = sub_100064680(v71, v73, v74);
        double v167 = v76;
        double v168 = v75;
        [v67 outControlPoint];
        double v78 = v77;
        double v80 = v79;
        [v67 nodePoint];
        double v82 = sub_100064680(v78, v80, v81);
        double v165 = v83;
        double v166 = v82;
        [v68 inControlPoint];
        double v85 = v84;
        double v87 = v86;
        [v68 nodePoint];
        double v89 = sub_100064680(v85, v87, v88);
        double v91 = v90;
        [v69 inControlPoint];
        double v93 = v92;
        double v95 = v94;
        [v69 nodePoint];
        double v97 = sub_100064680(v93, v95, v96);
        double v99 = v98;
        [v68 outControlPoint];
        double v101 = v100;
        double v103 = v102;
        [v68 nodePoint];
        double v105 = sub_100064680(v101, v103, v104);
        double v174 = v106;
        double v177 = v105;
        [v69 outControlPoint];
        double v108 = v107;
        double v110 = v109;
        [v69 nodePoint];
        double v112 = sub_100064680(v108, v110, v111);
        double v171 = v113;
        double v172 = v112;
        v179[0] = _NSConcreteStackBlock;
        v179[1] = 3221225472;
        v179[2] = sub_10044E76C;
        v179[3] = &unk_1014FA6C0;
        v179[4] = v170;
        v114 = objc_retainBlock(v179);
        ((void (*)(void *, uint64_t, double, double, double, double, double, double))v114[2])(v114, v58, v89, v91, v168, v167, v97, v99);
        ((void (*)(void *, uint64_t, double, double, double, double, double, double))v114[2])(v114, v58 + 1, v177, v174, v166, v165, v172, v171);
        [v67 nodePoint];
        -[CRLBezierSubpath calculateNewControlFromOriginalDelta:currentDelta:originalSmoothDelta:node:](self, "calculateNewControlFromOriginalDelta:currentDelta:originalSmoothDelta:node:", v89, v91, v168, v167, v97, v99, v115, v116);
        *(v61 - 2) = v117;
        *(v61 - 1) = v118;
        [v67 nodePoint];
        -[CRLBezierSubpath calculateNewControlFromOriginalDelta:currentDelta:originalSmoothDelta:node:](self, "calculateNewControlFromOriginalDelta:currentDelta:originalSmoothDelta:node:", v177, v174, v166, v165, v172, v171, v119, v120);
        *double v61 = v121;
        v61[1] = v122;
      }
      else
      {
        *(_OWORD *)&v170[2 * v59] = v162;
        [v67 inControlPoint];
        *(v61 - 2) = v123;
        *(v61 - 1) = v124;
        [v67 outControlPoint];
        *double v61 = v125;
        v61[1] = v126;
      }

      ++v59;
      v58 += 2;
      v61 += 4;
    }
    while (v60 != v59);
    uint64_t v127 = 0;
    v128 = v170 + 1;
    do
    {
      v129 = [(CRLBezierSubpath *)self nodes];
      v130 = [v129 objectAtIndex:v127];

      if ([v130 type] == (id)3 && (v127 || -[CRLBezierSubpath isClosed](self, "isClosed")))
      {
        double v131 = (*(v128 - 1) + *v128) * 0.5;
        *(v128 - 1) = v131;
        double *v128 = v131;
      }

      ++v127;
      v128 += 2;
    }
    while (v60 != v127);
    unint64_t v178 = v164 - ([(CRLBezierSubpath *)self isClosed] ^ 1);
    if (v178)
    {
      unint64_t v132 = 0;
      do
      {
        uint64_t v133 = v132++;
        v134 = [(CRLBezierSubpath *)self nodes];
        v135 = [v134 objectAtIndex:v133];

        v136 = [(CRLBezierSubpath *)self nodes];
        v137 = [v136 objectAtIndex:v132 % v164];

        [v135 nodePoint];
        v184.f64[0] = v138;
        v184.f64[1] = v139;
        [v135 outControlPoint];
        double v185 = v140;
        double v186 = v141;
        [v137 inControlPoint];
        double v187 = v142;
        double v188 = v143;
        [v137 nodePoint];
        uint64_t v189 = v144;
        uint64_t v190 = v145;
        [v135 nodePoint];
        v181[0].f64[0] = v146;
        v181[0].f64[1] = v147;
        uint64_t v148 = (2 * v133) | 1;
        v181[1] = *(float64x2_t *)&v163[16 * v148];
        v181[2] = *(float64x2_t *)&v163[32 * (v132 % v164)];
        [v137 nodePoint];
        uint64_t v182 = v149;
        uint64_t v183 = v150;
        sub_100347C70(&v184, (uint64_t)&v192);
        sub_100347C70(v181, (uint64_t)v191);
        unint64_t v151 = 0;
        *(double *)&uint64_t v152 = fmax(fmin((v170[v148] + v170[2 * (v132 % v164)]) * 0.5, 1.0), 0.0);
        double v153 = 1.0 - *(double *)&v152;
        float64x2_t v154 = (float64x2_t)vdupq_lane_s64(v152, 0);
        do
        {
          v155 = &v192.f64[v151 / 8];
          float64x2x2_t v195 = vld2q_f64(v155);
          v156 = (const double *)&v191[v151];
          float64x2x2_t v196 = vld2q_f64(v156);
          v197.val[0] = vmlaq_f64(vmulq_n_f64(v196.val[0], v153), v154, v195.val[0]);
          v197.val[1] = vmlaq_f64(vmulq_n_f64(v196.val[1], v153), v154, v195.val[1]);
          v157 = &v180[v151 / 0x10];
          vst2q_f64(v157->f64, v197);
          v151 += 32;
        }
        while (v151 != 64);
        sub_100347CBC(v180, (uint64_t)&v184);
        [v135 setOutControlPoint:v185, v186];
        [v137 setInControlPoint:v187, v188];
      }
      while (v132 != v178);
    }
    unint64_t v158 = [(CRLBezierSubpath *)self isClosed] ^ 1;
    unint64_t v159 = v164 - ([(CRLBezierSubpath *)self isClosed] ^ 1);
    if (v159 > v158)
    {
      do
      {
        v160 = [(CRLBezierSubpath *)self nodes];
        v161 = [v160 objectAtIndex:v158];

        if ([v161 type] == (id)3) {
          [v161 balanceControlPoints];
        }

        ++v158;
      }
      while (v159 != v158);
    }
    free(v170);
    free(v163);
  }
}

- (int64_t)updateSmoothNodes:(id)a3 from:(int64_t)a4 to:(int64_t)a5 closed:(BOOL)a6 addTemporaryNodes:(BOOL)a7
{
  BOOL v7 = a7;
  BOOL v8 = a6;
  id v11 = a3;
  double v12 = v11;
  int64_t v13 = a5 - a4;
  if (a5 - a4 >= 1)
  {
    int64_t v250 = 0;
    uint64_t v14 = 0;
    uint64_t v15 = v13 + 1;
    char v16 = a5 - a4 != 1 || v8;
    char v249 = v16;
    uint64_t size = 16 * v15;
    uint64_t v240 = 2 * v15;
    uint64_t v245 = 2 * v15 - 1;
    BOOL v253 = v8;
    BOOL v17 = !v8;
    if (v8) {
      int64_t v18 = v13 + 2;
    }
    else {
      int64_t v18 = a5 - a4;
    }
    uint64_t v257 = 8 * v15;
    float v19 = 1.0;
    if (!v17) {
      float v19 = 2.0;
    }
    int64_t v251 = a5 - a4;
    if (v17) {
      int64_t v20 = a5 - a4;
    }
    else {
      int64_t v20 = v13 + 1;
    }
    uint64_t v265 = v20;
    BOOL v247 = v7;
    int v244 = !v7;
    int64_t v242 = v18 - 1;
    unint64_t v243 = (unint64_t)(float)(v19 * (float)(unint64_t)(8 * v15));
    double v21 = 1.0;
    double v22 = -2.0;
    int64_t v238 = a4;
    int64_t v239 = a5;
    int64_t v270 = a5;
    uint64_t v263 = v13 + 1;
    int64_t v241 = 8 * a5 - 8 * a4 + 8;
    v248 = v11;
    unint64_t v252 = v18;
    while (1)
    {
      id v23 = [v12 count];
      if ((v249 & 1) == 0) {
        break;
      }
      int64_t v24 = (int64_t)v23;
      uint64_t v255 = v14;
      double v25 = (double *)malloc_type_malloc(size, 0x1000040451B5BE8uLL);
      double v26 = (double *)malloc_type_malloc(v257, 0x100004000313F17uLL);
      v266 = (double *)malloc_type_malloc(v257, 0x100004000313F17uLL);
      uint64_t v27 = 0;
      v261 = v25;
      double v28 = v25 + 1;
      v256 = v25 + 1;
      do
      {
        double v29 = [v12 objectAtIndex:(a4 + v27) % v24];
        [v29 nodePoint];
        double v31 = v30;
        double v33 = v32;

        double v34 = [v12 objectAtIndex:(a4 + v27 + 1) % v24];
        [v34 nodePoint];
        double v36 = v35;

        double v37 = sub_100064680(v31, v33, v36);
        *(v28 - 1) = v37;
        *double v28 = v38;
        v26[v27++] = sqrt(v38 * v38 + v37 * v37);
        v28 += 2;
      }
      while (v15 != v27);
      v258 = v26;
      unint64_t v39 = v252;
      if (v252 >= 2)
      {
        double v40 = v256;
        for (uint64_t i = 1; i != v252; ++i)
        {
          double v42 = *(v40 - 1);
          double v43 = v21 / (*v40 * *v40 + v42 * v42);
          v266[i % v15] = sub_1000662B0((v261[2 * (i % v15) + 1] * *v40 + v261[2 * (i % v15)] * v42) * v43, (v261[2 * (i % v15) + 1] * v42 - v261[2 * (i % v15)] * *v40) * v43);
          v40 += 2;
        }
      }
      double v44 = (__CLPK_doublereal *)malloc_type_malloc(v257, 0x100004000313F17uLL);
      v259 = (__CLPK_doublereal *)malloc_type_malloc(v257, 0x100004000313F17uLL);
      v260 = (__CLPK_doublereal *)malloc_type_malloc(v257, 0x100004000313F17uLL);
      double v45 = (__CLPK_doublereal *)malloc_type_malloc(v243, 0x358D1C7AuLL);
      BOOL v46 = v253;
      int64_t v47 = v251;
      double v48 = v266;
      double v49 = v44;
      v264 = v45;
      if (!v253)
      {
        double *v266 = 0.0;
        v266[v251] = 0.0;
        double v50 = [v12 objectAtIndex:a4 % v24];
        double v51 = [v12 objectAtIndex:(a4 + 1) % v24];
        id v52 = [v50 type];
        *double v49 = 0.0;
        if (v52 == (id)2)
        {
          __CLPK_doublereal *v259 = 1.0;
          __CLPK_doublereal *v260 = 0.0;
          [v50 outControlPoint];
          double v54 = v53;
          double v56 = v55;
          [v50 nodePoint];
          double v58 = sub_100064680(v54, v56, v57);
          double v60 = sub_1000662B0(v58, v59);
          [v51 nodePoint];
          double v62 = v61;
          double v64 = v63;
          [v50 nodePoint];
          double v66 = sub_100064680(v62, v64, v65);
          double v68 = sub_1000662B0(v66, v67);
          double v69 = sub_10006646C(v60 - v68);
        }
        else
        {
          __CLPK_doublereal *v259 = 3.0;
          __CLPK_doublereal *v260 = 3.0;
          double v69 = v266[1] * -3.0;
        }
        double *v264 = v69;
        double v70 = [v12 objectAtIndex:v270 % v24];

        if (v270 <= 0) {
          int64_t v71 = v24;
        }
        else {
          int64_t v71 = v270;
        }
        double v72 = [v12 objectAtIndex:(v71 - 1) % v24];

        if ([v70 type] == (id)2)
        {
          v49[v251] = 0.0;
          v259[v251] = 1.0;
          v260[v251] = 0.0;
          [v70 inControlPoint];
          double v74 = v73;
          double v76 = v75;
          [v70 nodePoint];
          double v78 = sub_100064680(v74, v76, v77);
          double v80 = sub_1000662B0(v78, v79);
          [v72 nodePoint];
          double v82 = v81;
          double v84 = v83;
          [v70 nodePoint];
          double v86 = sub_100064680(v82, v84, v85);
          double v88 = sub_1000662B0(v86, v87);
          double v89 = sub_10006646C(v80 - v88);
        }
        else
        {
          v49[v251] = 3.0;
          v259[v251] = 3.0;
          double v89 = 0.0;
          v260[v251] = 0.0;
        }
        v264[v251] = v89;

        double v45 = v264;
        BOOL v46 = v253;
        uint64_t v15 = v263;
        unint64_t v39 = v252;
        double v48 = v266;
      }
      double v90 = v260;
      double v91 = v261;
      if (v39 >= 2)
      {
        uint64_t v92 = 0;
        do
        {
          double v93 = v26[v92];
          uint64_t v94 = v92 + 2;
          uint64_t v95 = v92 + 1;
          uint64_t v96 = (v92 + 1) % v15;
          double v97 = v21 / v93;
          double v98 = v21 / v26[v96];
          v49[v96] = v97;
          v259[v96] = v97 + v98 + v97 + v98;
          v260[v96] = v98;
          v45[v96] = v97 * v22 * v48[v96] - v98 * v48[v94 % v15];
          uint64_t v92 = v95;
        }
        while (v242 != v95);
      }
      v254 = v49;
      if (v46)
      {
        double v99 = v260[v251];
        double v100 = *v259;
        double v101 = *v49;
        __CLPK_doublereal *v259 = *v259 + *v259;
        v259[v251] = v259[v251] + v99 * v101 / v100;
        if (v15 < v240)
        {
          bzero((char *)v45 + v241, v257);
          double v45 = v264;
          double v90 = v260;
        }
        v45[v15] = -v100;
        v45[v245] = v99;
        int v102 = sub_10044E978(v15, 2, v49 + 1, v259, v90, v45, v15);
        if (v102)
        {
          int v103 = v102;
          unsigned int v104 = +[CRLAssertionHandler _atomicIncrementAssertCount];
          if (qword_101719A70 != -1) {
            dispatch_once(&qword_101719A70, &stru_1014FA7A0);
          }
          uint64_t v105 = v103;
          double v106 = off_10166B4A0;
          if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 67110146;
            *(_DWORD *)&buf[4] = v104;
            *(_WORD *)v296 = 2082;
            *(void *)&v296[2] = "-[CRLBezierSubpath(Smoothing) updateSmoothNodes:from:to:closed:addTemporaryNodes:]";
            *(_WORD *)&v296[10] = 2082;
            *(void *)&v296[12] = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLEditableBezierPathSmoothing.m";
            *(_WORD *)&v296[20] = 1024;
            *(_DWORD *)&v296[22] = 502;
            *(_WORD *)&v296[26] = 2048;
            *(void *)&v296[28] = v105;
            _os_log_error_impl((void *)&_mh_execute_header, v106, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d dgtsv failure with error %ld", buf, 0x2Cu);
          }
          if (qword_101719A70 != -1) {
            dispatch_once(&qword_101719A70, &stru_1014FA7C0);
          }
          double v107 = off_10166B4A0;
          if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
          {
            v231 = v107;
            v232 = +[CRLAssertionHandler packedBacktraceString];
            *(_DWORD *)buf = 67109378;
            *(_DWORD *)&buf[4] = v104;
            *(_WORD *)v296 = 2114;
            *(void *)&v296[2] = v232;
            _os_log_error_impl((void *)&_mh_execute_header, v231, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);
          }
          double v108 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLBezierSubpath(Smoothing) updateSmoothNodes:from:to:closed:addTemporaryNodes:]");
          double v109 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLEditableBezierPathSmoothing.m"];
          +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v108, v109, 502, 0, "dgtsv failure with error %ld", v105);

          int64_t v47 = v251;
          uint64_t v15 = v263;
          double v91 = v261;
          double v48 = v266;
        }
        double v110 = -(*v264 - v101 * v264[v47] / v100) / (v264[v15] + v21 - v101 * v264[v245] / v100);
        double v111 = v264;
        uint64_t v112 = v15;
        do
        {
          *double v111 = *v111 + v110 * *(double *)((char *)v111 + v241);
          ++v111;
          --v112;
        }
        while (v112);
      }
      else
      {
        int v113 = sub_10044E978(v15, 1, v49 + 1, v259, v260, v45, v15);
        if (v113)
        {
          int v114 = v113;
          unsigned int v115 = +[CRLAssertionHandler _atomicIncrementAssertCount];
          if (qword_101719A70 != -1) {
            dispatch_once(&qword_101719A70, &stru_1014FA7E0);
          }
          uint64_t v116 = v114;
          uint64_t v117 = off_10166B4A0;
          if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 67110146;
            *(_DWORD *)&buf[4] = v115;
            *(_WORD *)v296 = 2082;
            *(void *)&v296[2] = "-[CRLBezierSubpath(Smoothing) updateSmoothNodes:from:to:closed:addTemporaryNodes:]";
            *(_WORD *)&v296[10] = 2082;
            *(void *)&v296[12] = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLEditableBezierPathSmoothing.m";
            *(_WORD *)&v296[20] = 1024;
            *(_DWORD *)&v296[22] = 513;
            *(_WORD *)&v296[26] = 2048;
            *(void *)&v296[28] = v116;
            _os_log_error_impl((void *)&_mh_execute_header, v117, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d dgtsv failure with error %ld", buf, 0x2Cu);
          }
          if (qword_101719A70 != -1) {
            dispatch_once(&qword_101719A70, &stru_1014FA800);
          }
          uint64_t v118 = off_10166B4A0;
          if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
          {
            v233 = v118;
            v234 = +[CRLAssertionHandler packedBacktraceString];
            *(_DWORD *)buf = 67109378;
            *(_DWORD *)&buf[4] = v115;
            *(_WORD *)v296 = 2114;
            *(void *)&v296[2] = v234;
            _os_log_error_impl((void *)&_mh_execute_header, v233, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);
          }
          double v119 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLBezierSubpath(Smoothing) updateSmoothNodes:from:to:closed:addTemporaryNodes:]");
          double v120 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLEditableBezierPathSmoothing.m"];
          +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v119, v120, 513, 0, "dgtsv failure with error %ld", v116);

          uint64_t v15 = v263;
          double v91 = v261;
          double v48 = v266;
        }
      }
      uint64_t obj = v24;
      if (v247)
      {
        uint64_t v121 = +[NSMutableArray array];
        if (v265 < 1)
        {
          char v262 = 1;
        }
        else
        {
          uint64_t v122 = 0;
          char v262 = 1;
          uint64_t v123 = v256;
          do
          {
            uint64_t v124 = v122 + 1;
            uint64_t v125 = (v122 + 1) % v15;
            double v126 = v264[v122];
            double v127 = sub_1000662E0(v126);
            double v129 = sub_100065910(v127, v128, *(v123 - 1), *v123);
            double v131 = v130;
            double v132 = sub_10044E8B0(v126, -v266[v125] - v264[v125]);
            double v133 = sub_1000646A4(v129, v131, -v132);
            double v135 = v134;
            double v136 = -v266[v125] - v264[v125];
            double v137 = sub_1000662E0(-v136);
            double v139 = sub_100065910(v137, v138, *(v123 - 1), *v123);
            double v141 = v140;
            double v142 = sub_10044E8B0(v136, v264[v122]);
            double v143 = sub_1000646A4(v139, v141, v142);
            double v145 = v144;
            float64_t v146 = [(CRLBezierSubpath *)self nodes];
            uint64_t v147 = a4 + v122;
            uint64_t v148 = [v146 objectAtIndex:(a4 + v122) % obj];

            uint64_t v149 = [(CRLBezierSubpath *)self nodes];
            uint64_t v150 = (v147 + 1) % obj;
            unint64_t v151 = [v149 objectAtIndex:v150];

            [v148 nodePoint];
            double v153 = v152;
            float64_t v155 = v154;
            [v151 nodePoint];
            double v157 = v156;
            uint64_t v159 = v158;
            double v160 = sub_100064698(v133, v135, v153);
            uint64_t v162 = v161;
            double v163 = sub_100064698(v143, v145, v157);
            uint64_t v165 = v164;
            *(double *)buf = v153;
            *(float64_t *)v296 = v155;
            [v148 outControlPoint];
            *(void *)&v296[8] = v166;
            *(void *)&v296[16] = v167;
            [v151 inControlPoint];
            *(void *)&v296[24] = v168;
            *(void *)&v296[32] = v169;
            double v297 = v157;
            uint64_t v298 = v159;
            v288.f64[0] = v153;
            v288.f64[1] = v155;
            double v289 = v160;
            uint64_t v290 = v162;
            double v291 = v163;
            uint64_t v292 = v165;
            double v293 = v157;
            uint64_t v294 = v159;
            double v170 = sub_100064570((float64x2_t *)buf, 0.5);
            double v172 = v171;
            double v173 = sub_100064570(&v288, 0.5);
            double v174 = sub_100064680(v170, v172, v173);
            if (sub_1000653A8(v174, v175) > 4.0)
            {
              sub_100347D40((float64x2_t *)buf, (uint64_t)v281, 0.0, 0.5);
              sub_100347D40((float64x2_t *)buf, (uint64_t)v276, 0.5, 1.0);
              [v148 setOutControlPoint:v282, v283];
              [v151 setInControlPoint:v279, v280];
              id v176 = +[CRLBezierNode bezierNodeWithPoint:inControlPoint:outControlPoint:](CRLBezierNode, "bezierNodeWithPoint:inControlPoint:outControlPoint:", v286, v287, v284, v285, v277, v278);
              [v176 setType:4];
              double v177 = +[NSNumber numberWithInteger:v150];
              unint64_t v178 = +[NSDictionary dictionaryWithObjectsAndKeys:v176, @"node", v177, @"index", 0];
              [v121 addObject:v178];

              char v262 = 0;
            }

            v123 += 2;
            uint64_t v122 = v124;
            uint64_t v15 = v263;
          }
          while (v265 != v124);
        }
        [v121 sortUsingFunction:sub_10044EE00 context:0];
        long long v273 = 0u;
        long long v274 = 0u;
        long long v271 = 0u;
        long long v272 = 0u;
        id obja = v121;
        id v219 = [obja countByEnumeratingWithState:&v271 objects:v275 count:16];
        if (v219)
        {
          id v220 = v219;
          uint64_t v221 = *(void *)v272;
          double v21 = 1.0;
          double v22 = -2.0;
          do
          {
            for (j = 0; j != v220; j = (char *)j + 1)
            {
              if (*(void *)v272 != v221) {
                objc_enumerationMutation(obja);
              }
              v223 = *(void **)(*((void *)&v271 + 1) + 8 * (void)j);
              v224 = [v223 objectForKey:@"index"];
              int64_t v225 = (int)[v224 intValue];

              v226 = [(CRLBezierSubpath *)self nodes];
              id v227 = [v226 mutableCopy];

              v228 = [v223 objectForKey:@"node"];
              [v227 insertObject:v228 atIndex:v225];

              [(CRLBezierSubpath *)self setNodes:v227];
              BOOL v229 = a4 <= v225;
              if (a4 > v225) {
                ++a4;
              }
              int64_t v230 = v270;
              if (!v229) {
                int64_t v230 = v270 + 1;
              }
              int64_t v270 = v230 + 1;
            }
            id v220 = [obja countByEnumeratingWithState:&v271 objects:v275 count:16];
          }
          while (v220);
        }
        else
        {
          double v21 = 1.0;
          double v22 = -2.0;
        }

        v250 += (int64_t)[obja count];
        int v218 = v262 & 1;
        double v12 = v248;
        uint64_t v15 = v263;
        double v91 = v261;
        double v26 = v258;
        double v48 = v266;
      }
      else if (v265 < 1)
      {
        int v218 = 1;
        double v12 = v248;
      }
      else
      {
        uint64_t v179 = 0;
        v180 = v256;
        do
        {
          uint64_t v181 = v179 + 1;
          uint64_t v182 = (v179 + 1) % v15;
          double v183 = v264[v179];
          double v184 = sub_1000662E0(v183);
          double v186 = sub_100065910(v184, v185, *(v180 - 1), *v180);
          double v188 = v187;
          double v189 = sub_10044E8B0(v183, -v48[v182] - v264[v182]);
          double v190 = sub_1000646A4(v186, v188, -v189);
          double v192 = v191;
          double v193 = -v48[v182] - v264[v182];
          double v194 = sub_1000662E0(-v193);
          double v196 = sub_100065910(v194, v195, *(v180 - 1), *v180);
          double v198 = v197;
          double v199 = sub_10044E8B0(v193, v264[v179]);
          double v200 = sub_1000646A4(v196, v198, v199);
          double v202 = v201;
          uint64_t v203 = a4 + v179;
          int64_t v204 = (a4 + v179) % v24;
          v205 = [v248 objectAtIndex:v204];
          [v205 nodePoint];
          double v207 = sub_100064698(v190, v192, v206);
          double v209 = v208;

          uint64_t v210 = (v203 + 1) % v24;
          v211 = [v248 objectAtIndex:v210];
          [v211 nodePoint];
          double v213 = sub_100064698(v200, v202, v212);
          double v215 = v214;

          double v48 = v266;
          v216 = [v248 objectAtIndex:v204];
          [v216 setOutControlPoint:v207, v209];

          v217 = [v248 objectAtIndex:v210];
          [v217 setInControlPoint:v213, v215];

          v180 += 2;
          uint64_t v179 = v181;
        }
        while (v265 != v181);
        int v218 = 1;
        double v91 = v261;
        double v12 = v248;
      }
      free(v254);
      free(v259);
      free(v260);
      free(v264);
      free(v91);
      free(v26);
      free(v48);
      if (((v218 | v244) & 1) == 0)
      {
        uint64_t v14 = v255 + 1;
        if (v255 != 3) {
          continue;
        }
      }
      goto LABEL_96;
    }
    v235 = [v12 objectAtIndex:v238];
    v236 = [v12 objectAtIndex:v239];
    if ([v235 type] != (id)2)
    {
      [v235 nodePoint];
      [v235 setOutControlPoint:];
    }
    if ([v236 type] != (id)2)
    {
      [v236 nodePoint];
      [v236 setInControlPoint:];
    }
  }
  int64_t v250 = 0;
LABEL_96:

  return v250;
}

- (void)updateSmoothNodes:(id)a3 addTemporaryNodes:(BOOL)a4
{
  BOOL v4 = a4;
  id v49 = a3;
  uint64_t v6 = (uint64_t)[v49 count];
  if (v6 < 2)
  {
    BOOL v7 = 0;
    BOOL v8 = 0;
    goto LABEL_70;
  }
  uint64_t v9 = v6;
  if (v4)
  {
    BOOL v7 = 0;
    BOOL v8 = 0;
  }
  else
  {
    uint64_t v10 = 0;
    BOOL v8 = 0;
    id v11 = 0;
    uint64_t v12 = v6 - 1;
    do
    {
      int64_t v13 = v8;
      BOOL v8 = [v49 objectAtIndex:v10];

      uint64_t v14 = v10 + 1;
      if (v10 + 1 < v9 || [(CRLBezierSubpath *)self isClosed])
      {
        if (v12 == v10) {
          uint64_t v15 = 0;
        }
        else {
          uint64_t v15 = v10 + 1;
        }
        BOOL v7 = [v49 objectAtIndex:v15];
      }
      else
      {
        BOOL v7 = 0;
      }

      if ([v8 type] == (id)1 && v7 && objc_msgSend(v7, "type") == (id)1)
      {
        [v8 nodePoint];
        [v8 setOutControlPoint:];
        [v7 nodePoint];
        [v7 setInControlPoint:];
      }
      if (![v8 type])
      {
        if ([v8 isCollapsed]) {
          uint64_t v16 = 1;
        }
        else {
          uint64_t v16 = 2;
        }
        [v8 setType:v16];
      }
      ++v10;
      id v11 = v7;
    }
    while (v9 != v14);
  }
  if ([(CRLBezierSubpath *)self isClosed])
  {
    uint64_t v17 = 0;
    while (1)
    {
      if ((v9 & ~(v9 >> 63)) == v17)
      {
        double v28 = (char *)[v49 count] - 1;
        double v29 = self;
        id v30 = v49;
        uint64_t v31 = 0;
        uint64_t v32 = 1;
        goto LABEL_69;
      }
      uint64_t v18 = v17;
      float v19 = [v49 objectAtIndex:v17];

      if ([v19 type] != (id)3 && objc_msgSend(v19, "type") != (id)4) {
        break;
      }
      ++v17;
      int64_t v20 = [v49 objectAtIndex:(v18 + 1) % v9];

      [v20 nodePoint];
      double v22 = v21;
      double v24 = v23;
      [v19 nodePoint];
      BOOL v7 = v20;
      BOOL v8 = v19;
      if (sub_100064084(v22, v24, v25, v26))
      {
        LOBYTE(v27) = 1;
        BOOL v7 = v20;
        goto LABEL_33;
      }
    }
    LOBYTE(v27) = 0;
    ++v17;
LABEL_33:
    BOOL v8 = v19;
  }
  else
  {
    LOBYTE(v27) = 0;
    uint64_t v17 = 0;
    uint64_t v18 = 0;
  }
  if (v18 >= v9 + v17) {
    goto LABEL_70;
  }
  uint64_t v48 = 0;
  char v33 = 0;
  do
  {
    BOOL v34 = v27;
    double v35 = v7;
    double v36 = v8;
    BOOL v8 = [v49 objectAtIndex:v18 % v9 v48];

    BOOL v7 = [v49 objectAtIndex:(v18 + 1) % v9];

    [v7 nodePoint];
    double v38 = v37;
    double v40 = v39;
    [v8 nodePoint];
    BOOL v27 = sub_100064084(v38, v40, v41, v42);
    id v43 = [v8 type];
    if (v33)
    {
      if (v43 == (id)3)
      {
        if (!v27) {
          goto LABEL_58;
        }
      }
      else
      {
        char v44 = [v8 type] != (id)4 || v27;
        if ((v44 & 1) == 0) {
          goto LABEL_58;
        }
      }
      int64_t v45 = [(CRLBezierSubpath *)self updateSmoothNodes:v49 from:v48 to:v18 closed:0 addTemporaryNodes:v4];
      char v33 = 0;
      v18 += v45;
      v9 += v45;
      if (!v4) {
        goto LABEL_59;
      }
      goto LABEL_63;
    }
    if (v43 != (id)3 && [v8 type] != (id)4) {
      goto LABEL_52;
    }
    if (!v27)
    {
      if (v34)
      {
LABEL_52:
        char v33 = 0;
        if (v4) {
          goto LABEL_63;
        }
LABEL_59:
        if (v27)
        {
LABEL_60:
          [v8 nodePoint:v48];
          [v8 setOutControlPoint:];
        }
        if (v34)
        {
          [v8 nodePoint];
          [v8 setInControlPoint:];
        }
LABEL_63:
        double v28 = (char *)v18;
        goto LABEL_64;
      }
      if (v18 <= 1) {
        uint64_t v46 = 1;
      }
      else {
        uint64_t v46 = v18;
      }
      uint64_t v48 = v46 - 1;
LABEL_58:
      char v33 = 1;
      if (!v4) {
        goto LABEL_59;
      }
      goto LABEL_63;
    }
    char v33 = 0;
    double v28 = (char *)v18;
    if (!v4) {
      goto LABEL_60;
    }
LABEL_64:
    uint64_t v18 = (uint64_t)(v28 + 1);
  }
  while ((uint64_t)(v28 + 1) < v9 + v17);
  char v47 = v33 ^ 1;
  if (v17) {
    char v47 = 1;
  }
  if ((v47 & 1) == 0)
  {
    double v29 = self;
    uint64_t v31 = v48;
    id v30 = v49;
    uint64_t v32 = 0;
LABEL_69:
    -[CRLBezierSubpath updateSmoothNodes:from:to:closed:addTemporaryNodes:](v29, "updateSmoothNodes:from:to:closed:addTemporaryNodes:", v30, v31, v28, v32, v4, v48);
  }
LABEL_70:
}

- (void)updateSmoothNodes
{
  id v3 = [(CRLBezierSubpath *)self nodes];
  [(CRLBezierSubpath *)self updateSmoothNodes:v3 addTemporaryNodes:0];
}

- (void)removeTemporaryNodes
{
  id v3 = [(CRLBezierSubpath *)self nodes];
  uint64_t v4 = (uint64_t)[v3 count];

  if (v4 >= 1)
  {
    for (uint64_t i = 0; i < v4; ++i)
    {
      uint64_t v6 = [(CRLBezierSubpath *)self nodes];
      BOOL v7 = [v6 objectAtIndex:i];

      if ([v7 type] == (id)4)
      {
        BOOL v8 = [(CRLBezierSubpath *)self nodes];
        id v9 = [v8 mutableCopy];

        [v9 removeObjectAtIndex:i];
        [(CRLBezierSubpath *)self updateSmoothNodes:v9 addTemporaryNodes:0];
        uint64_t v10 = [v9 objectAtIndex:i];
        [v10 nodePoint];
        v34.f64[0] = v11;
        v34.f64[1] = v12;
        int64_t v13 = [v9 objectAtIndex:i];
        [v13 outControlPoint];
        uint64_t v35 = v14;
        uint64_t v36 = v15;
        uint64_t v16 = v4 - 1;
        uint64_t v17 = [v9 objectAtIndex:(i + 1) % (v4 - 1)];
        [v17 inControlPoint];
        uint64_t v37 = v18;
        uint64_t v38 = v19;
        int64_t v20 = [v9 objectAtIndex:(i + 1) % (v4 - 1)];
        [v20 nodePoint];
        uint64_t v39 = v21;
        uint64_t v40 = v22;

        [v7 nodePoint];
        double v24 = v23;
        double v26 = v25;
        double v27 = sub_100064570(&v34, 0.5);
        double v28 = sub_100064680(v24, v26, v27);
        if (sub_1000653A8(v28, v29) < 16.0)
        {
          id v30 = [(CRLBezierSubpath *)self nodes];
          id v31 = [v30 mutableCopy];

          [v31 removeObjectAtIndex:i];
          [(CRLBezierSubpath *)self setNodes:v31];
          uint64_t v32 = [(CRLBezierSubpath *)self nodes];
          [(CRLBezierSubpath *)self updateSmoothNodes:v32 addTemporaryNodes:0];

          --i;
          uint64_t v4 = v16;
        }
      }
    }
  }
  char v33 = [(CRLBezierSubpath *)self nodes];
  [(CRLBezierSubpath *)self updateSmoothNodes:v33 addTemporaryNodes:0];
}

- (void)addTemporarySmoothNodes
{
  id v3 = [(CRLBezierSubpath *)self nodes];
  [(CRLBezierSubpath *)self updateSmoothNodes:v3 addTemporaryNodes:1];
}

@end
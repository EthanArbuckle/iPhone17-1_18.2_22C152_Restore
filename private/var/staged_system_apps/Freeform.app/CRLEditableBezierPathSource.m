@interface CRLEditableBezierPathSource
+ (CRLEditableBezierPathSource)editableBezierPathSourceWithBezierPath:(id)a3;
+ (CRLEditableBezierPathSource)editableBezierPathSourceWithPathSource:(id)a3;
+ (id)editableBezierPathSource;
- (BOOL)allNodesSelected;
- (BOOL)canCloseSelectedNodes;
- (BOOL)canConnectSelectedNodes;
- (BOOL)canCutAtSelectedNodes;
- (BOOL)canDeleteSelectedNodes;
- (BOOL)closeIfEndpointsAreEqual;
- (BOOL)deletingSelectedNodesWillDeleteShape;
- (BOOL)hasSelectedNode;
- (BOOL)isCircular;
- (BOOL)isClosed;
- (BOOL)isCompound;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualWithStrictComparison:(id)a3;
- (BOOL)isOpen;
- (BOOL)isRectangular;
- (CGAffineTransform)pathFlipTransform;
- (CGPath)pathWithoutFlips;
- (CGPath)subpathForSelection;
- (CGRect)nodeBounds;
- (CGSize)naturalSize;
- (CRLBezierNode)firstNode;
- (CRLBezierNode)lastNode;
- (CRLEditableBezierPathSource)init;
- (NSArray)nodeTypes;
- (NSArray)nodes;
- (NSArray)subpaths;
- (NSUUID)persistedUUID;
- (double)distanceToPoint:(CGPoint)a3 subpathIndex:(unint64_t *)a4 elementIndex:(unint64_t *)a5 tValue:(double *)a6 threshold:(double)a7;
- (id)bezierNodeUnderPoint:(CGPoint)a3 withTransform:(CGAffineTransform *)a4 andTolerance:(double)a5 returningType:(int64_t *)a6;
- (id)bezierPathWithoutFlips;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)inferredAccessibilityDescription;
- (id)inferredAccessibilityDescriptionNoShapeNames;
- (id)nodeAfterNode:(id)a3;
- (id)nodePriorToNode:(id)a3;
- (id)splitEdge:(int64_t)a3 at:(double)a4 fromSubpath:(int64_t)a5;
- (id)subpathsForConnectingUsingFirstSubpathFirstNode:(BOOL *)a3 andSecondPathFirstNode:(BOOL *)a4;
- (unint64_t)activeSubpath;
- (unint64_t)hash;
- (void)addNode:(id)a3;
- (void)addTemporarySmoothNodes;
- (void)alignToOrigin;
- (void)beginNewSubpath;
- (void)closePath;
- (void)closeSelectedNodes;
- (void)connectSelectedNodes;
- (void)convertToHobby;
- (void)curveToPoint:(CGPoint)a3 controlPoint1:(CGPoint)a4 controlPoint2:(CGPoint)a5;
- (void)cutAtSelectedNodes;
- (void)deleteSelectedEdges;
- (void)deleteSelectedNodes;
- (void)deleteSelectedNodesForced:(BOOL)a3;
- (void)deselectAllNodes;
- (void)lineToPoint:(CGPoint)a3;
- (void)morphWithMorphInfo:(id)a3;
- (void)moveToPoint:(CGPoint)a3;
- (void)offsetSelectedEdgesByDelta:(CGPoint)a3;
- (void)offsetSelectedNodesByDelta:(CGPoint)a3;
- (void)removeLastNode;
- (void)removeNode:(id)a3;
- (void)reverseDirection;
- (void)selectAllNodes;
- (void)selectSubpathForNode:(id)a3 toggle:(BOOL)a4;
- (void)setActiveSubpath:(unint64_t)a3;
- (void)setBezierPath:(id)a3;
- (void)setClosed:(BOOL)a3;
- (void)setLockedFlipTransform:(BOOL)a3;
- (void)setNaturalSize:(CGSize)a3;
- (void)setNodeTypes:(id)a3;
- (void)setNodes:(id)a3;
- (void)setPersistedUUID:(id)a3;
- (void)setSubpaths:(id)a3;
- (void)sharpenAllNodes;
- (void)smoothAllNodes;
- (void)smoothCurveToPoint:(CGPoint)a3 controlPoint1:(CGPoint)a4 controlPoint2:(CGPoint)a5;
- (void)smoothNode:(id)a3;
- (void)splitSelectedEdges;
- (void)splitSelectedNodes;
- (void)toggleNode:(id)a3 toType:(int64_t)a4 prevNode:(id)a5 nextNode:(id)a6;
- (void)toggleSelectedNodesToType:(int64_t)a3;
- (void)transformUsingAffineTransform:(CGAffineTransform *)a3;
- (void)updateSmoothNodes;
@end

@implementation CRLEditableBezierPathSource

- (CRLEditableBezierPathSource)init
{
  v7.receiver = self;
  v7.super_class = (Class)CRLEditableBezierPathSource;
  v2 = [(CRLEditableBezierPathSource *)&v7 init];
  if (v2)
  {
    v3 = objc_alloc_init(CRLBezierSubpath);
    v4 = [objc_alloc((Class)NSArray) initWithObjects:v3, 0];
    mSubpaths = v2->mSubpaths;
    v2->mSubpaths = v4;
  }
  return v2;
}

- (id)description
{
  v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  v5 = +[NSString stringWithFormat:@"<%@ %p subpaths=%p>", v4, self, self->mSubpaths];

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init((Class)objc_opt_class());
  [v4 setHasHorizontalFlip:[self hasHorizontalFlip]];
  [v4 setHasVerticalFlip:[self hasVerticalFlip]];
  id v5 = objc_alloc((Class)NSArray);
  v6 = [(CRLEditableBezierPathSource *)self subpaths];
  id v7 = [v5 initWithArray:v6 copyItems:1];

  [v4 setSubpaths:v7];
  return v4;
}

+ (id)editableBezierPathSource
{
  v2 = objc_alloc_init(CRLEditableBezierPathSource);

  return v2;
}

+ (CRLEditableBezierPathSource)editableBezierPathSourceWithPathSource:(id)a3
{
  id v4 = [a3 bezierPath];
  id v5 = [a1 editableBezierPathSourceWithBezierPath:v4];

  return (CRLEditableBezierPathSource *)v5;
}

+ (CRLEditableBezierPathSource)editableBezierPathSourceWithBezierPath:(id)a3
{
  id v3 = a3;
  id v4 = +[CRLEditableBezierPathSource editableBezierPathSource];
  [v4 setBezierPath:v3];

  return (CRLEditableBezierPathSource *)v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (CRLEditableBezierPathSource *)a3;
  if (v4 == self)
  {
    unsigned __int8 v8 = 1;
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)CRLEditableBezierPathSource;
    if ([(CRLPathSource *)&v10 isEqual:v4])
    {
      id v5 = v4;
      v6 = [(CRLPathSource *)self bezierPath];
      id v7 = [(CRLPathSource *)v5 bezierPath];

      unsigned __int8 v8 = [v6 isEqual:v7];
    }
    else
    {
      unsigned __int8 v8 = 0;
    }
  }

  return v8;
}

- (unint64_t)hash
{
  id v3 = [(CRLPathSource *)self bezierPath];
  BOOL v4 = [v3 hash] != 0;

  BOOL v8 = v4;
  v7.receiver = self;
  v7.super_class = (Class)CRLEditableBezierPathSource;
  id v5 = [(CRLPathSource *)&v7 hash];
  return sub_1000C8080((char *)&v8, 1, (uint64_t)v5);
}

- (BOOL)isEqualWithStrictComparison:(id)a3
{
  BOOL v4 = (CRLEditableBezierPathSource *)a3;
  if (v4 == self)
  {
    BOOL v10 = 1;
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)CRLEditableBezierPathSource;
    if ([(CRLPathSource *)&v12 isEqual:v4])
    {
      id v5 = v4;
      id v6 = [(CRLPathSource *)self bezierPath];
      objc_super v7 = (const CGPath *)[v6 CGPath];

      id v8 = [(CRLPathSource *)v5 bezierPath];
      v9 = (const CGPath *)[v8 CGPath];

      BOOL v10 = v7 == v9 || CGPathEqualToPath(v7, v9);
    }
    else
    {
      BOOL v10 = 0;
    }
  }

  return v10;
}

- (BOOL)closeIfEndpointsAreEqual
{
  id v3 = [(CRLEditableBezierPathSource *)self subpaths];
  BOOL v4 = [v3 objectAtIndex:self->mActiveSubpath];
  unsigned __int8 v5 = [v4 closeIfEndpointsAreEqual];

  return v5;
}

- (BOOL)isRectangular
{
  id v3 = [(CRLEditableBezierPathSource *)self subpaths];
  if ([v3 count] == (id)1)
  {
    BOOL v4 = [(CRLEditableBezierPathSource *)self subpaths];
    unsigned __int8 v5 = [v4 lastObject];
    unsigned __int8 v6 = [v5 isRectangular];
  }
  else
  {
    unsigned __int8 v6 = 0;
  }

  return v6;
}

- (BOOL)isCircular
{
  id v3 = [(CRLEditableBezierPathSource *)self subpaths];
  if ([v3 count] == (id)1)
  {
    BOOL v4 = [(CRLEditableBezierPathSource *)self subpaths];
    unsigned __int8 v5 = [v4 lastObject];
    unsigned __int8 v6 = [v5 isCircular];
  }
  else
  {
    unsigned __int8 v6 = 0;
  }

  return v6;
}

- (id)bezierPathWithoutFlips
{
  id v3 = +[CRLBezierPath bezierPath];
  [v3 moveToPoint:CGPointZero.x, CGPointZero.y];
  BOOL v4 = [(CRLEditableBezierPathSource *)self subpaths];
  [v4 makeObjectsPerformSelector:"appendToBezierPath:" withObject:v3];

  return v3;
}

- (CGPath)pathWithoutFlips
{
  id v2 = [(CRLEditableBezierPathSource *)self bezierPathWithoutFlips];
  id v3 = (CGPath *)[v2 CGPath];

  return v3;
}

- (void)convertToHobby
{
  id v2 = [(CRLEditableBezierPathSource *)self subpaths];
  [v2 makeObjectsPerformSelector:"convertToHobby"];
}

- (void)setBezierPath:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (uint64_t)[v4 elementCount];
  uint64_t v41 = 0;
  v42 = &v41;
  uint64_t v43 = 0x3032000000;
  v44 = sub_10018447C;
  v45 = sub_10018448C;
  id v46 = 0;
  uint64_t v35 = 0;
  v36 = &v35;
  uint64_t v37 = 0x3032000000;
  v38 = sub_10018447C;
  v39 = sub_10018448C;
  id v40 = 0;
  uint64_t v29 = 0;
  v30 = &v29;
  uint64_t v31 = 0x3032000000;
  v32 = sub_10018447C;
  v33 = sub_10018448C;
  id v34 = objc_alloc_init((Class)NSMutableArray);
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_100184494;
  v28[3] = &unk_1014DC1D0;
  v28[4] = &v35;
  v28[5] = &v29;
  v28[6] = &v41;
  unsigned __int8 v6 = objc_retainBlock(v28);
  if (v5 < 1)
  {
    id v8 = 0;
  }
  else
  {
    uint64_t v7 = 0;
    id v8 = 0;
    do
    {
      id v9 = [v4 elementAtIndex:v7 associatedPoints:&v47];
      if (v42[5]) {
        ((void (*)(void *))v6[2])(v6);
      }
      BOOL v10 = [(id)v36[5] lastNode];
      v11 = v10;
      switch((unint64_t)v9)
      {
        case 0uLL:
          uint64_t v12 = +[CRLBezierNode bezierNodeWithPoint:](CRLBezierNode, "bezierNodeWithPoint:", v47, v48);
          v13 = (void *)v42[5];
          v42[5] = v12;

          if (v7)
          {
            v14 = (void *)v36[5];
            v36[5] = 0;
            goto LABEL_17;
          }
          ((void (*)(void *))v6[2])(v6);
          break;
        case 1uLL:
          uint64_t v15 = +[CRLBezierNode bezierNodeWithPoint:](CRLBezierNode, "bezierNodeWithPoint:", v47, v48);

          [(id)v36[5] addNode:v15];
          id v8 = (void *)v15;
          break;
        case 2uLL:
          [v10 setOutControlPoint:v47, v48];
          [v11 setType:2];
          uint64_t v16 = +[CRLBezierNode bezierNodeWithPoint:inControlPoint:outControlPoint:](CRLBezierNode, "bezierNodeWithPoint:inControlPoint:outControlPoint:", v51, v52, v49, v50, v51, v52);

          [(id)v36[5] addNode:v16];
          id v8 = (void *)v16;
          break;
        case 3uLL:
          uint64_t v17 = [(id)v36[5] firstNode];
          v14 = (void *)v17;
          if (v11) {
            BOOL v18 = v17 == 0;
          }
          else {
            BOOL v18 = 1;
          }
          if (!v18)
          {
            [v11 nodePoint];
            double v20 = v19;
            double v22 = v21;
            [v14 nodePoint];
            if (sub_100064084(v20, v22, v23, v24))
            {
              [v11 inControlPoint];
              [v14 setInControlPoint:];
              [(id)v36[5] removeLastNode];
            }
          }
          [(id)v36[5] setClosed:1];
LABEL_17:

          break;
        default:
          break;
      }

      ++v7;
    }
    while (v5 != v7);
  }
  [(CRLEditableBezierPathSource *)self setSubpaths:v30[5]];
  v25 = [(CRLEditableBezierPathSource *)self subpaths];
  [v25 makeObjectsPerformSelector:"updateReflectedState"];

  v26 = +[NSUserDefaults standardUserDefaults];
  unsigned __int8 v27 = [v26 BOOLForKey:@"CRLCreateBezierNodesByDefault"];

  if ((v27 & 1) == 0) {
    [(CRLEditableBezierPathSource *)self convertToHobby];
  }

  _Block_object_dispose(&v29, 8);
  _Block_object_dispose(&v35, 8);

  _Block_object_dispose(&v41, 8);
}

- (void)setNodes:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_alloc_init(CRLBezierSubpath);
  [(CRLBezierSubpath *)v5 setNodes:v4];

  uint64_t v7 = v5;
  unsigned __int8 v6 = +[NSArray arrayWithObjects:&v7 count:1];
  [(CRLEditableBezierPathSource *)self setSubpaths:v6];
}

- (NSArray)nodes
{
  id v3 = objc_alloc_init((Class)NSMutableArray);
  id v4 = [(CRLEditableBezierPathSource *)self subpaths];
  [v4 makeObjectsPerformSelector:"addNodesToArray:" withObject:v3];

  id v5 = [v3 copy];

  return (NSArray *)v5;
}

- (void)reverseDirection
{
  id v4 = [(CRLEditableBezierPathSource *)self subpaths];
  id v3 = [v4 objectAtIndex:self->mActiveSubpath];
  [v3 reverseDirection];
}

- (void)setLockedFlipTransform:(BOOL)a3
{
  p_mLockedFlipTransform = &self->mLockedFlipTransform;
  v7[0].receiver = self;
  v7[0].super_class = (Class)CRLEditableBezierPathSource;
  [(objc_super *)v7 pathFlipTransform];
  objc_super v6 = v7[2];
  *(objc_super *)&p_mLockedFlipTransform->a = v7[1];
  *(objc_super *)&p_mLockedFlipTransform->c = v6;
  *(objc_super *)&p_mLockedFlipTransform->tx = v7[3];
  self->mHasLockedFlipTransform = a3;
}

- (void)beginNewSubpath
{
  id v3 = [(CRLEditableBezierPathSource *)self subpaths];
  id v4 = objc_alloc_init(CRLBezierSubpath);
  id v5 = [v3 arrayByAddingObject:v4];
  [(CRLEditableBezierPathSource *)self setSubpaths:v5];

  id v6 = [(CRLEditableBezierPathSource *)self subpaths];
  self->mActiveSubpath = (unint64_t)[v6 count] - 1;
}

- (CGAffineTransform)pathFlipTransform
{
  if (LOBYTE(self[1].d))
  {
    long long v3 = *(_OWORD *)&self[2].a;
    *(_OWORD *)&retstr->a = *(_OWORD *)&self[1].tx;
    *(_OWORD *)&retstr->c = v3;
    *(_OWORD *)&retstr->tx = *(_OWORD *)&self[2].c;
  }
  else
  {
    v4.receiver = self;
    v4.super_class = (Class)CRLEditableBezierPathSource;
    return (CGAffineTransform *)[(CGAffineTransform *)&v4 pathFlipTransform];
  }
  return self;
}

- (CGSize)naturalSize
{
  id v2 = [(CRLEditableBezierPathSource *)self bezierPathWithoutFlips];
  long long v3 = v2;
  if (v2)
  {
    [v2 bounds];
    CGFloat width = v4;
    CGFloat height = v6;
  }
  else
  {
    CGFloat width = CGSizeZero.width;
    CGFloat height = CGSizeZero.height;
  }

  double v8 = width;
  double v9 = height;
  result.CGFloat height = v9;
  result.CGFloat width = v8;
  return result;
}

- (void)setNaturalSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  double v6 = [(CRLEditableBezierPathSource *)self nodes];
  id v7 = [v6 count];

  if ((unint64_t)v7 >= 2)
  {
    [(CRLEditableBezierPathSource *)self naturalSize];
    if (v8 <= 0.0) {
      double v10 = 1.0;
    }
    else {
      double v10 = width / v8;
    }
    memset(&v23.c, 0, 32);
    if (v9 <= 0.0) {
      double v11 = 1.0;
    }
    else {
      double v11 = height / v9;
    }
    *(_OWORD *)&v23.a = 0uLL;
    CGAffineTransformMakeScale(&v23, v10, v11);
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    uint64_t v12 = [(CRLEditableBezierPathSource *)self subpaths];
    id v13 = [v12 countByEnumeratingWithState:&v19 objects:v24 count:16];
    if (v13)
    {
      id v14 = v13;
      uint64_t v15 = *(void *)v20;
      do
      {
        for (i = 0; i != v14; i = (char *)i + 1)
        {
          if (*(void *)v20 != v15) {
            objc_enumerationMutation(v12);
          }
          uint64_t v17 = *(void **)(*((void *)&v19 + 1) + 8 * i);
          CGAffineTransform v18 = v23;
          [v17 transformUsingAffineTransform:&v18];
        }
        id v14 = [v12 countByEnumeratingWithState:&v19 objects:v24 count:16];
      }
      while (v14);
    }
  }
}

- (void)transformUsingAffineTransform:(CGAffineTransform *)a3
{
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  double v4 = [(CRLEditableBezierPathSource *)self subpaths];
  id v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      double v8 = 0;
      do
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        double v9 = *(void **)(*((void *)&v12 + 1) + 8 * (void)v8);
        long long v10 = *(_OWORD *)&a3->c;
        v11[0] = *(_OWORD *)&a3->a;
        v11[1] = v10;
        v11[2] = *(_OWORD *)&a3->tx;
        [v9 transformUsingAffineTransform:v11];
        double v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }
}

- (void)alignToOrigin
{
  long long v3 = [(CRLPathSource *)self bezierPath];
  [v3 bounds];
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;

  v34.origin.x = v5;
  v34.origin.y = v7;
  v34.size.double width = v9;
  v34.size.double height = v11;
  double MinX = CGRectGetMinX(v34);
  v35.origin.x = v5;
  v35.origin.y = v7;
  v35.size.double width = v9;
  v35.size.double height = v11;
  double MinY = CGRectGetMinY(v35);
  LODWORD(v3) = [(CRLPathSource *)self hasHorizontalFlip];
  unsigned int v12 = [(CRLPathSource *)self hasVerticalFlip];
  double v13 = 1.0;
  if (v3) {
    double v14 = -1.0;
  }
  else {
    double v14 = 1.0;
  }
  if (v12) {
    double v13 = -1.0;
  }
  CGAffineTransformMakeScale(&v32, v14, v13);
  float64x2_t v15 = vaddq_f64(*(float64x2_t *)&v32.tx, vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&v32.c, MinY), *(float64x2_t *)&v32.a, MinX));
  double v16 = v15.f64[1];
  double v25 = v15.f64[0];
  if (!sub_100064084(v15.f64[0], v15.f64[1], CGPointZero.x, CGPointZero.y))
  {
    memset(&v31, 0, sizeof(v31));
    CGAffineTransformMakeTranslation(&v31, -v25, -v16);
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    uint64_t v17 = [(CRLEditableBezierPathSource *)self subpaths];
    id v18 = [v17 countByEnumeratingWithState:&v27 objects:v33 count:16];
    if (v18)
    {
      id v19 = v18;
      uint64_t v20 = *(void *)v28;
      do
      {
        long long v21 = 0;
        do
        {
          if (*(void *)v28 != v20) {
            objc_enumerationMutation(v17);
          }
          long long v22 = *(void **)(*((void *)&v27 + 1) + 8 * (void)v21);
          CGAffineTransform v26 = v31;
          [v22 transformUsingAffineTransform:&v26];
          long long v21 = (char *)v21 + 1;
        }
        while (v19 != v21);
        id v19 = [v17 countByEnumeratingWithState:&v27 objects:v33 count:16];
      }
      while (v19);
    }
  }
}

- (void)addNode:(id)a3
{
  id v4 = a3;
  id v6 = [(CRLEditableBezierPathSource *)self subpaths];
  CGFloat v5 = [v6 objectAtIndex:self->mActiveSubpath];
  [v5 addNode:v4];
}

- (void)removeLastNode
{
  id v4 = [(CRLEditableBezierPathSource *)self subpaths];
  long long v3 = [v4 objectAtIndex:self->mActiveSubpath];
  [v3 removeLastNode];
}

- (id)nodePriorToNode:(id)a3
{
  id v4 = a3;
  CGFloat v5 = [(CRLEditableBezierPathSource *)self subpaths];
  id v6 = [v5 objectAtIndex:self->mActiveSubpath];
  CGFloat v7 = [v6 nodePriorToNode:v4];

  return v7;
}

- (id)nodeAfterNode:(id)a3
{
  id v4 = a3;
  CGFloat v5 = [(CRLEditableBezierPathSource *)self subpaths];
  id v6 = [v5 objectAtIndex:self->mActiveSubpath];
  CGFloat v7 = [v6 nodeAfterNode:v4];

  return v7;
}

- (CRLBezierNode)firstNode
{
  long long v3 = [(CRLEditableBezierPathSource *)self subpaths];
  id v4 = [v3 objectAtIndex:self->mActiveSubpath];
  CGFloat v5 = [v4 firstNode];

  return (CRLBezierNode *)v5;
}

- (CRLBezierNode)lastNode
{
  long long v3 = [(CRLEditableBezierPathSource *)self subpaths];
  id v4 = [v3 objectAtIndex:self->mActiveSubpath];
  CGFloat v5 = [v4 lastNode];

  return (CRLBezierNode *)v5;
}

- (void)offsetSelectedNodesByDelta:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  CGFloat v5 = [(CRLEditableBezierPathSource *)self subpaths];
  id v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      CGFloat v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * (void)v9) offsetSelectedNodesByDelta:x, y];
        CGFloat v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void)offsetSelectedEdgesByDelta:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  CGFloat v5 = [(CRLEditableBezierPathSource *)self subpaths];
  id v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      CGFloat v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * (void)v9) offsetSelectedEdgesByDelta:x, y];
        CGFloat v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (BOOL)hasSelectedNode
{
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v2 = [(CRLEditableBezierPathSource *)self subpaths];
  id v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v8;
    while (2)
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(void *)v8 != v4) {
          objc_enumerationMutation(v2);
        }
        if ([*(id *)(*((void *)&v7 + 1) + 8 * i) hasSelectedNode])
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      id v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return (char)v3;
}

- (BOOL)allNodesSelected
{
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v2 = [(CRLEditableBezierPathSource *)self subpaths];
  id v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v10;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        if (![*(id *)(*((void *)&v9 + 1) + 8 * i) allNodesSelected])
        {
          BOOL v7 = 0;
          goto LABEL_11;
        }
      }
      id v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
  BOOL v7 = 1;
LABEL_11:

  return v7;
}

- (void)removeNode:(id)a3
{
  id v4 = a3;
  id v6 = [(CRLEditableBezierPathSource *)self subpaths];
  uint64_t v5 = [v6 objectAtIndex:self->mActiveSubpath];
  [v5 removeNode:v4];
}

- (BOOL)isCompound
{
  id v2 = [(CRLEditableBezierPathSource *)self subpaths];
  BOOL v3 = (unint64_t)[v2 count] > 1;

  return v3;
}

- (BOOL)canDeleteSelectedNodes
{
  unsigned __int8 v3 = [(CRLEditableBezierPathSource *)self isCompound];
  id v4 = [(CRLEditableBezierPathSource *)self subpaths];
  uint64_t v5 = v4;
  if ((v3 & 1) == 0)
  {
    long long v8 = [v4 lastObject];
    unsigned __int8 v10 = [v8 canDeleteSelectedNodes];
LABEL_9:

    id v6 = v5;
    goto LABEL_10;
  }
  id v6 = [v4 objectEnumerator];

  uint64_t v7 = [v6 nextObject];
  if (v7)
  {
    long long v8 = (void *)v7;
    while (![v8 hasSelectedNode]
         || [v8 canDeleteSelectedNodes])
    {
      uint64_t v9 = [v6 nextObject];

      long long v8 = (void *)v9;
      if (!v9) {
        goto LABEL_7;
      }
    }
    long long v12 = [(CRLEditableBezierPathSource *)self subpaths];
    uint64_t v5 = [v12 objectEnumerator];

    do
    {
      long long v13 = v8;
      long long v8 = [v5 nextObject];

      unsigned __int8 v10 = v8 != 0;
    }
    while (v8
         && [v8 hasSelectedNode]
         && ![v8 canDeleteSelectedNodes]);
    goto LABEL_9;
  }
LABEL_7:
  unsigned __int8 v10 = 1;
LABEL_10:

  return v10;
}

- (BOOL)deletingSelectedNodesWillDeleteShape
{
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v2 = [(CRLEditableBezierPathSource *)self subpaths];
  id v3 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v13;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v13 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        long long v8 = [v7 nodes];
        if ((unint64_t)[v8 count] < 3)
        {
        }
        else
        {
          if (![v7 hasSelectedNode])
          {

LABEL_15:
            BOOL v10 = 0;
            goto LABEL_16;
          }
          unsigned __int8 v9 = [v7 canDeleteSelectedNodes];

          if (v9) {
            goto LABEL_15;
          }
        }
      }
      id v4 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
  BOOL v10 = 1;
LABEL_16:

  return v10;
}

- (void)deleteSelectedNodesForced:(BOOL)a3
{
  uint64_t v5 = +[NSMutableArray array];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = [(CRLEditableBezierPathSource *)self subpaths];
  id v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        long long v11 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if ([v11 canDeleteSelectedNodes])
        {
          [v11 deleteSelectedNodes];
        }
        else if (a3 || [v11 allNodesSelected])
        {
          if ([v11 hasSelectedNode]) {
            [v5 addObject:v11];
          }
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  long long v12 = [(CRLEditableBezierPathSource *)self subpaths];
  id v13 = [v12 mutableCopy];

  [v13 removeObjectsInArray:v5];
  [(CRLEditableBezierPathSource *)self setSubpaths:v13];
}

- (void)deleteSelectedNodes
{
}

- (void)selectAllNodes
{
  id v2 = [(CRLEditableBezierPathSource *)self subpaths];
  [v2 makeObjectsPerformSelector:"selectAllNodes"];
}

- (void)deselectAllNodes
{
  id v2 = [(CRLEditableBezierPathSource *)self subpaths];
  [v2 makeObjectsPerformSelector:"deselectAllNodes"];
}

- (id)bezierNodeUnderPoint:(CGPoint)a3 withTransform:(CGAffineTransform *)a4 andTolerance:(double)a5 returningType:(int64_t *)a6
{
  double y = a3.y;
  double x = a3.x;
  long long v11 = [(CRLEditableBezierPathSource *)self subpaths];
  long long v12 = [v11 objectEnumerator];

  id v13 = 0;
  while (1)
  {
    long long v14 = v13;
    id v13 = [v12 nextObject];

    if (!v13) {
      break;
    }
    long long v15 = *(_OWORD *)&a4->c;
    v19[0] = *(_OWORD *)&a4->a;
    v19[1] = v15;
    v19[2] = *(_OWORD *)&a4->tx;
    uint64_t v16 = [v13 bezierNodeUnderPoint:v19 withTransform:a6 andTolerance:x, y, a5 returningType:];
    if (v16)
    {
      long long v17 = (void *)v16;
      goto LABEL_6;
    }
  }
  long long v17 = 0;
LABEL_6:

  return v17;
}

- (double)distanceToPoint:(CGPoint)a3 subpathIndex:(unint64_t *)a4 elementIndex:(unint64_t *)a5 tValue:(double *)a6 threshold:(double)a7
{
  double y = a3.y;
  double x = a3.x;
  id v13 = [(CRLEditableBezierPathSource *)self subpaths];
  id v14 = [v13 count];

  unint64_t v15 = 0;
  uint64_t v16 = 0;
  double v17 = 1.79769313e308;
  if (v14)
  {
    unint64_t v18 = 0;
    if (a7 < 1.79769313e308)
    {
      unint64_t v18 = 0;
      unint64_t v15 = 0;
      double v17 = 1.79769313e308;
      unint64_t v19 = 1;
      do
      {
        uint64_t v20 = [(CRLEditableBezierPathSource *)self subpaths];
        long long v21 = [v20 objectAtIndexedSubscript:v19 - 1];

        uint64_t v25 = 0;
        unint64_t v26 = 0;
        [v21 distanceToPoint:&v26 elementIndex:&v25 tValue:x y:y threshold:a7];
        if (v22 < v17)
        {
          unint64_t v15 = v26;
          uint64_t v16 = v25;
          unint64_t v18 = v19 - 1;
          double v17 = v22;
        }

        if (v19 >= (unint64_t)v14) {
          break;
        }
        ++v19;
      }
      while (v17 > a7);
    }
    if (a4) {
      goto LABEL_9;
    }
  }
  else
  {
    unint64_t v18 = 0;
    if (a4) {
LABEL_9:
    }
      *a4 = v18;
  }
  if (a5) {
    *a5 = v15;
  }
  if (a6) {
    *(void *)a6 = v16;
  }
  return v17;
}

- (CGRect)nodeBounds
{
  CGFloat x = CGRectZero.origin.x;
  CGFloat y = CGRectZero.origin.y;
  CGFloat width = CGRectZero.size.width;
  CGFloat height = CGRectZero.size.height;
  id v6 = [(CRLEditableBezierPathSource *)self subpaths];
  id v7 = [v6 objectEnumerator];

  uint64_t v8 = [v7 nextObject];
  if (v8)
  {
    uint64_t v9 = (void *)v8;
    do
    {
      [v9 nodeBounds];
      v22.origin.CGFloat x = v10;
      v22.origin.CGFloat y = v11;
      v22.size.CGFloat width = v12;
      v22.size.CGFloat height = v13;
      v19.origin.CGFloat x = x;
      v19.origin.CGFloat y = y;
      v19.size.CGFloat width = width;
      v19.size.CGFloat height = height;
      CGRect v20 = CGRectUnion(v19, v22);
      CGFloat x = v20.origin.x;
      CGFloat y = v20.origin.y;
      CGFloat width = v20.size.width;
      CGFloat height = v20.size.height;
      uint64_t v14 = [v7 nextObject];

      uint64_t v9 = (void *)v14;
    }
    while (v14);
  }

  double v15 = x;
  double v16 = y;
  double v17 = width;
  double v18 = height;
  result.size.CGFloat height = v18;
  result.size.CGFloat width = v17;
  result.origin.CGFloat y = v16;
  result.origin.CGFloat x = v15;
  return result;
}

- (void)toggleNode:(id)a3 toType:(int64_t)a4 prevNode:(id)a5 nextNode:(id)a6
{
  id v59 = a3;
  id v9 = a5;
  id v10 = a6;
  if ([v59 type] != (id)a4)
  {
    switch(a4)
    {
      case 1:
        [v59 setType:1];
        if ([v10 type] == (id)1)
        {
          [v59 nodePoint];
          [v59 setOutControlPoint:];
          [v10 nodePoint];
          [v10 setInControlPoint:];
        }
        if ([v9 type] == (id)1)
        {
          [v59 nodePoint];
          [v59 setInControlPoint:];
          [v9 nodePoint];
          [v9 setOutControlPoint:];
        }
        break;
      case 3:
        [v59 setType:3];
        break;
      case 2:
        [v59 nodePoint];
        double v12 = v11;
        double v14 = v13;
        [v59 outControlPoint];
        if (sub_100064084(v12, v14, v15, v16))
        {
          [v10 nodePoint];
          double v18 = v17;
          double v20 = v19;
          [v10 inControlPoint];
          if (sub_100064084(v18, v20, v21, v22))
          {
            [v59 nodePoint];
            double v24 = v23;
            double v26 = v25;
            [v10 nodePoint];
            [v59 setOutControlPoint:sub_100065E00(v24, v26, v27, v28, 0.333333333)];
            [v59 nodePoint];
            double v30 = v29;
            double v32 = v31;
            [v10 nodePoint];
            [v10 setInControlPoint:sub_100065E00(v30, v32, v33, v34, 0.666666667)];
          }
        }
        [v59 nodePoint];
        double v36 = v35;
        double v38 = v37;
        [v59 inControlPoint];
        if (sub_100064084(v36, v38, v39, v40))
        {
          [v9 nodePoint];
          double v42 = v41;
          double v44 = v43;
          [v9 outControlPoint];
          if (sub_100064084(v42, v44, v45, v46))
          {
            [v59 nodePoint];
            double v48 = v47;
            double v50 = v49;
            [v9 nodePoint];
            [v59 setInControlPoint:sub_100065E00(v48, v50, v51, v52, 0.333333333)];
            [v59 nodePoint];
            double v54 = v53;
            double v56 = v55;
            [v9 nodePoint];
            [v9 setOutControlPoint:sub_100065E00(v54, v56, v57, v58, 0.666666667)];
          }
        }
        [v59 setType:2];
        [v59 updateReflectedState];
        break;
    }
  }
}

- (void)toggleSelectedNodesToType:(int64_t)a3
{
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id obj = [(CRLEditableBezierPathSource *)self subpaths];
  id v19 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v19)
  {
    uint64_t v18 = *(void *)v23;
    do
    {
      for (i = 0; i != v19; i = (char *)i + 1)
      {
        if (*(void *)v23 != v18) {
          objc_enumerationMutation(obj);
        }
        id v4 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        uint64_t v5 = [v4 nodes];
        if ([v5 count])
        {
          unsigned int v6 = [v4 isClosed];
          if (v6)
          {
            id v7 = [v5 lastObject];
          }
          else
          {
            id v7 = 0;
          }
          uint64_t v8 = [v5 objectAtIndexedSubscript:0];
          id v9 = (char *)[v5 count];
          if (v9)
          {
            unint64_t v10 = (unint64_t)v9;
            double v11 = 0;
            double v12 = v9 - 1;
            do
            {
              double v13 = v11 + 1;
              if ((((unint64_t)(v11 + 1) >= v10) & ~v6) != 0)
              {
                double v15 = 0;
              }
              else
              {
                if (v12 == v11) {
                  double v14 = 0;
                }
                else {
                  double v14 = v11 + 1;
                }
                double v15 = [v5 objectAtIndexedSubscript:v14];
              }
              if ([v8 isSelected]) {
                [(CRLEditableBezierPathSource *)self toggleNode:v8 toType:a3 prevNode:v7 nextNode:v15];
              }
              id v16 = v8;

              double v11 = v13;
              uint64_t v8 = v15;
              id v7 = v16;
            }
            while ((char *)v10 != v13);
          }
          else
          {
            id v16 = v7;
            double v15 = v8;
          }
        }
      }
      id v19 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v19);
  }
}

- (void)sharpenAllNodes
{
  id v2 = [(CRLEditableBezierPathSource *)self subpaths];
  [v2 makeObjectsPerformSelector:"sharpenAllNodes"];
}

- (void)smoothNode:(id)a3
{
  id v10 = a3;
  id v4 = [(CRLEditableBezierPathSource *)self subpaths];
  uint64_t v5 = [v4 objectEnumerator];

  unsigned int v6 = 0;
  while (1)
  {
    id v7 = v6;
    unsigned int v6 = [v5 nextObject];

    if (!v6) {
      break;
    }
    uint64_t v8 = [v6 nodes];
    unsigned int v9 = [v8 containsObject:v10];

    if (v9)
    {
      [v6 smoothNode:v10];
      break;
    }
  }
}

- (void)smoothAllNodes
{
  id v2 = [(CRLEditableBezierPathSource *)self subpaths];
  [v2 makeObjectsPerformSelector:"smoothAllNodes"];
}

- (BOOL)isClosed
{
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v2 = [(CRLEditableBezierPathSource *)self subpaths];
  id v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v11;
    do
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(void *)v11 != v4) {
          objc_enumerationMutation(v2);
        }
        unsigned int v6 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        id v7 = [v6 nodes];
        if ([v7 count])
        {
          unsigned __int8 v8 = [v6 isClosed];

          if (v8)
          {
            LOBYTE(v3) = 1;
            goto LABEL_12;
          }
        }
        else
        {
        }
      }
      id v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v3);
  }
LABEL_12:

  return (char)v3;
}

- (BOOL)isOpen
{
  return ![(CRLEditableBezierPathSource *)self isClosed];
}

- (void)setClosed:(BOOL)a3
{
  BOOL v3 = a3;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v4 = [(CRLEditableBezierPathSource *)self subpaths];
  id v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      unsigned __int8 v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * (void)v8) setClosed:v3];
        unsigned __int8 v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (void)selectSubpathForNode:(id)a3 toggle:(BOOL)a4
{
  BOOL v4 = a4;
  id v12 = a3;
  id v6 = [(CRLEditableBezierPathSource *)self subpaths];
  uint64_t v7 = [v6 objectEnumerator];

  unsigned __int8 v8 = 0;
  while (1)
  {
    long long v9 = v8;
    unsigned __int8 v8 = [v7 nextObject];

    if (!v8) {
      break;
    }
    long long v10 = [v8 nodes];
    unsigned int v11 = [v10 containsObject:v12];

    if (v11)
    {
      if (v4 && [v8 allNodesSelected]) {
        [v8 deselectAllNodes];
      }
      else {
        [v8 selectAllNodes];
      }
      break;
    }
  }
}

- (id)subpathsForConnectingUsingFirstSubpathFirstNode:(BOOL *)a3 andSecondPathFirstNode:(BOOL *)a4
{
  *a3 = 0;
  *a4 = 0;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v6 = [(CRLEditableBezierPathSource *)self subpaths];
  id v7 = [v6 countByEnumeratingWithState:&v24 objects:v29 count:16];
  if (!v7)
  {
    long long v9 = 0;
LABEL_18:
    double v21 = 0;
LABEL_22:

    goto LABEL_24;
  }
  id v8 = v7;
  long long v23 = a4;
  long long v9 = 0;
  uint64_t v10 = *(void *)v25;
LABEL_3:
  uint64_t v11 = 0;
  while (1)
  {
    if (*(void *)v25 != v10) {
      objc_enumerationMutation(v6);
    }
    id v12 = *(void **)(*((void *)&v24 + 1) + 8 * v11);
    if ([v12 isClosed]) {
      goto LABEL_14;
    }
    long long v13 = [v12 nodes];
    id v14 = [v13 count];

    if (!v14) {
      goto LABEL_14;
    }
    double v15 = [v12 firstNode];
    unsigned int v16 = [v15 isSelected];

    if (v16) {
      break;
    }
LABEL_11:
    uint64_t v18 = [v12 lastNode];
    unsigned int v19 = [v18 isSelected];

    if (v19)
    {
      id v20 = v12;
      if (v9) {
        goto LABEL_20;
      }
      long long v9 = v20;
    }
LABEL_14:
    if (v8 == (id)++v11)
    {
      id v8 = [v6 countByEnumeratingWithState:&v24 objects:v29 count:16];
      if (v8) {
        goto LABEL_3;
      }
      goto LABEL_18;
    }
  }
  id v17 = v12;
  if (!v9)
  {
    *a3 = 1;
    long long v9 = v17;
    goto LABEL_11;
  }
  *long long v23 = 1;
LABEL_20:

  if (v12)
  {
    v28[0] = v9;
    v28[1] = v12;
    double v21 = +[NSArray arrayWithObjects:v28 count:2];
    id v6 = v12;
    goto LABEL_22;
  }
  double v21 = 0;
LABEL_24:

  return v21;
}

- (BOOL)canConnectSelectedNodes
{
  __int16 v5 = 0;
  id v2 = [(CRLEditableBezierPathSource *)self subpathsForConnectingUsingFirstSubpathFirstNode:(char *)&v5 + 1 andSecondPathFirstNode:&v5];
  BOOL v3 = v2 != 0;

  return v3;
}

- (void)connectSelectedNodes
{
  __int16 v18 = 0;
  BOOL v3 = [(CRLEditableBezierPathSource *)self subpathsForConnectingUsingFirstSubpathFirstNode:(char *)&v18 + 1 andSecondPathFirstNode:&v18];
  BOOL v4 = v3;
  if (v3)
  {
    __int16 v5 = [v3 objectAtIndexedSubscript:0];
    id v6 = [v4 objectAtIndexedSubscript:1];
    if (v5 == v6)
    {
      if (HIBYTE(v18) != v18) {
        [v5 setClosed:1];
      }
      goto LABEL_16;
    }
    id v7 = [(CRLEditableBezierPathSource *)self subpaths];
    id v8 = [v7 mutableCopy];

    if (HIBYTE(v18) || !(_BYTE)v18)
    {
      if (HIBYTE(v18) && !(_BYTE)v18)
      {
        long long v9 = [v6 nodes];
        id v10 = [v9 mutableCopy];

        uint64_t v11 = [v5 nodes];
        [v10 addObjectsFromArray:v11];

        [v6 setNodes:v10];
        id v12 = v5;
LABEL_14:
        [v8 removeObjectIdenticalTo:v12];

LABEL_15:
        [(CRLEditableBezierPathSource *)self setSubpaths:v8];

LABEL_16:
        goto LABEL_17;
      }
      if (HIBYTE(v18) | v18)
      {
        if (!HIBYTE(v18) || !(_BYTE)v18) {
          goto LABEL_15;
        }
        [v6 reverseDirection];
        double v15 = [v5 nodes];
        id v10 = [v15 mutableCopy];

        id v14 = [v6 nodes];
        unsigned int v16 = [v6 nodes];
        id v17 = +[NSIndexSet indexSetWithIndexesInRange:](NSIndexSet, "indexSetWithIndexesInRange:", 0, [v16 count]);
        [v10 insertObjects:v14 atIndexes:v17];

        goto LABEL_13;
      }
      [v6 reverseDirection];
    }
    long long v13 = [v5 nodes];
    id v10 = [v13 mutableCopy];

    id v14 = [v6 nodes];
    [v10 addObjectsFromArray:v14];
LABEL_13:

    [v5 setNodes:v10];
    id v12 = v6;
    goto LABEL_14;
  }
LABEL_17:
}

- (BOOL)canCloseSelectedNodes
{
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v2 = [(CRLEditableBezierPathSource *)self subpaths];
  id v3 = [v2 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v14;
    while (2)
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(void *)v14 != v4) {
          objc_enumerationMutation(v2);
        }
        id v6 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if (([v6 isClosed] & 1) == 0)
        {
          id v7 = [v6 nodes];
          id v8 = [v7 count];

          if (v8)
          {
            long long v9 = [v6 firstNode];
            if ([v9 isSelected])
            {

LABEL_14:
              LOBYTE(v3) = 1;
              goto LABEL_15;
            }
            id v10 = [v6 lastNode];
            unsigned __int8 v11 = [v10 isSelected];

            if (v11) {
              goto LABEL_14;
            }
          }
        }
      }
      id v3 = [v2 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_15:

  return (char)v3;
}

- (void)closeSelectedNodes
{
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v2 = [(CRLEditableBezierPathSource *)self subpaths];
  id v3 = [v2 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v17;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v17 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        if (([v7 isClosed] & 1) == 0)
        {
          id v8 = [v7 nodes];
          id v9 = [v8 count];

          if (v9)
          {
            id v10 = [v7 firstNode];
            if ([v10 isSelected])
            {
            }
            else
            {
              unsigned __int8 v11 = [v7 lastNode];
              unsigned int v12 = [v11 isSelected];

              if (!v12) {
                continue;
              }
            }
            long long v13 = [v7 firstNode];
            id v14 = [v13 type];

            if (v14 == (id)3)
            {
              long long v15 = [v7 firstNode];
              [v15 setType:1];
            }
            [v7 setClosed:1];
          }
        }
      }
      id v4 = [v2 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v4);
  }
}

- (void)deleteSelectedEdges
{
  id v2 = [(CRLEditableBezierPathSource *)self subpaths];
  id v38 = [v2 copy];

  id v3 = [v38 objectEnumerator];
  id v41 = objc_alloc_init((Class)NSMutableArray);
  double v39 = v3;
  uint64_t v4 = [v3 nextObject];
  if (!v4) {
    goto LABEL_33;
  }
  uint64_t v5 = (void *)v4;
  do
  {
    id v6 = [v5 nodes];
    id v7 = [v6 mutableCopy];

    uint64_t v8 = (uint64_t)[v7 count];
    id v9 = [v7 lastObject];
    unsigned int v10 = [v9 isSelected];

    if (v10) {
      [v5 setClosed:0];
    }
    if (v8 < 1)
    {
      unsigned int v12 = 0;
      id v15 = 0;
LABEL_29:
      [v41 addObject:v5];
      goto LABEL_32;
    }
    double v40 = v5;
    char v11 = 0;
    unsigned int v12 = 0;
    uint64_t v13 = 0;
    uint64_t v14 = 0;
    id v15 = 0;
    do
    {
      long long v16 = v15;
      long long v17 = [v7 objectAtIndex:v14];

      if (v16 && [v16 isSelected])
      {
        if (v14 - v13 < 2)
        {
LABEL_16:
          char v11 = 1;
          uint64_t v13 = v14;
          goto LABEL_17;
        }
        long long v18 = objc_alloc_init(CRLBezierSubpath);
        long long v19 = +[NSIndexSet indexSetWithIndexesInRange:](NSIndexSet, "indexSetWithIndexesInRange:", v13, v14 - v13);
        id v20 = [v7 objectsAtIndexes:v19];
        [(CRLBezierSubpath *)v18 setNodes:v20];

        [v41 addObject:v18];
        double v21 = [(CRLBezierSubpath *)v18 nodes];
        long long v22 = [v21 lastObject];

        [v22 nodePoint];
        [v22 setOutControlPoint:];
        if (v12 || ([v40 isClosed] & 1) == 0)
        {
          long long v24 = [(CRLBezierSubpath *)v18 nodes];
          long long v23 = [v24 objectAtIndex:0];

          [v23 nodePoint];
          [v23 setInControlPoint:];
          if (v12)
          {
LABEL_15:

            goto LABEL_16;
          }
        }
        else
        {
          long long v23 = v22;
        }
        unsigned int v12 = v18;
        goto LABEL_15;
      }
LABEL_17:
      id v15 = v17;

      ++v14;
    }
    while (v8 != v14);
    if ((v11 & 1) == 0)
    {
      uint64_t v5 = v40;
      goto LABEL_29;
    }
    uint64_t v25 = v8 - v13;
    uint64_t v5 = v40;
    if (v8 - v13 > 1 || (unsigned int v26 = [v40 isClosed], v25 == 1) && v26)
    {
      id v27 = objc_alloc_init((Class)NSMutableArray);
      double v28 = +[NSIndexSet indexSetWithIndexesInRange:](NSIndexSet, "indexSetWithIndexesInRange:", v13, v25);
      double v29 = [v7 objectsAtIndexes:v28];
      [v27 addObjectsFromArray:v29];

      if ([v40 isClosed])
      {
        double v30 = [(CRLBezierSubpath *)v12 nodes];
        id v31 = [v30 count];

        if (v31)
        {
          double v32 = [(CRLBezierSubpath *)v12 nodes];
          [v27 addObjectsFromArray:v32];
        }
        if (v12) {
          [v41 removeObjectIdenticalTo:v12];
        }
      }
      else
      {
        double v33 = [v27 objectAtIndex:0];
        [v33 nodePoint];
        [v33 setInControlPoint:];
        double v34 = [v27 lastObject];

        [v34 nodePoint];
        [v34 setOutControlPoint:];
      }
      double v35 = objc_alloc_init(CRLBezierSubpath);
      [(CRLBezierSubpath *)v35 setNodes:v27];
      [v41 addObject:v35];
    }
LABEL_32:

    uint64_t v36 = [v39 nextObject];

    uint64_t v5 = (void *)v36;
  }
  while (v36);
LABEL_33:
  [(CRLEditableBezierPathSource *)self setSubpaths:v41];
}

- (id)splitEdge:(int64_t)a3 at:(double)a4 fromSubpath:(int64_t)a5
{
  uint64_t v8 = [(CRLEditableBezierPathSource *)self subpaths];
  id v9 = [v8 objectAtIndexedSubscript:a5];

  unsigned int v10 = [v9 nodes];
  char v11 = v10;
  if (a3 <= 0)
  {
    unsigned int v12 = [v10 lastObject];
    uint64_t v13 = [v11 objectAtIndex:0];
    a3 = (int64_t)[v11 count];
  }
  else
  {
    unsigned int v12 = [v10 objectAtIndex:a3 - 1];
    uint64_t v13 = [v11 objectAtIndex:a3];
  }
  [v13 nodePoint];
  double v15 = v14;
  double v17 = v16;
  [v13 inControlPoint];
  if (sub_100064084(v15, v17, v18, v19)
    && ([v12 nodePoint],
        double v21 = v20,
        double v23 = v22,
        [v12 outControlPoint],
        sub_100064084(v21, v23, v24, v25)))
  {
    [v12 nodePoint];
    double v27 = v26;
    double v29 = v28;
    [v13 nodePoint];
    double v32 = +[CRLBezierNode bezierNodeWithPoint:](CRLBezierNode, "bezierNodeWithPoint:", (1.0 - a4) * v27 + a4 * v30, (1.0 - a4) * v29 + a4 * v31);
  }
  else
  {
    [v12 nodePoint];
    v44.f64[0] = v33;
    v44.f64[1] = v34;
    [v12 outControlPoint];
    uint64_t v45 = v35;
    uint64_t v46 = v36;
    [v13 inControlPoint];
    uint64_t v47 = v37;
    uint64_t v48 = v38;
    [v13 nodePoint];
    uint64_t v49 = v39;
    uint64_t v50 = v40;
    sub_100347D40(&v44, (uint64_t)v51, 0.0, a4);
    sub_100347D40(&v44, (uint64_t)v56, a4, 1.0);
    [v12 setOutControlPoint:v52, v53];
    [v13 setInControlPoint:v56[4], v56[5]];
    double v32 = +[CRLBezierNode bezierNodeWithPoint:inControlPoint:outControlPoint:](CRLBezierNode, "bezierNodeWithPoint:inControlPoint:outControlPoint:", v56[0], v56[1], v54, v55, v56[2], v56[3]);
  }
  id v41 = v32;
  [v32 setSelected:1];
  id v42 = [v11 mutableCopy];
  [v42 insertObject:v41 atIndex:a3];
  [v9 setNodes:v42];

  return v41;
}

- (void)splitSelectedEdges
{
  id v3 = [(CRLEditableBezierPathSource *)self subpaths];
  uint64_t v4 = (uint64_t)[v3 count];

  if (v4 >= 1)
  {
    for (uint64_t i = 0; i != v4; ++i)
    {
      id v6 = [(CRLEditableBezierPathSource *)self subpaths];
      id v7 = [v6 objectAtIndex:i];
      uint64_t v8 = [v7 nodes];

      uint64_t v9 = (uint64_t)[v8 count];
      if (v9 >= 1)
      {
        uint64_t v10 = v9;
        id v11 = 0;
        for (uint64_t j = 0; j < v10; ++j)
        {
          uint64_t v13 = v11;
          double v14 = [v8 objectAtIndex:j];

          if (v13)
          {
            if ([v13 isSelected])
            {
              id v15 = [(CRLEditableBezierPathSource *)self splitEdge:j++ at:i fromSubpath:0.5];
              ++v10;
            }
          }
          id v11 = v14;
        }
      }
    }
  }
}

- (void)splitSelectedNodes
{
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id obj = [(CRLEditableBezierPathSource *)self subpaths];
  id v2 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v2)
  {
    id v3 = v2;
    uint64_t v4 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v3; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v27 != v4) {
          objc_enumerationMutation(obj);
        }
        id v6 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        id v7 = [v6 nodes];
        id v8 = [v7 mutableCopy];

        uint64_t v9 = (char *)[v8 count];
        if (v9)
        {
          uint64_t v10 = v9;
          id v11 = 0;
          for (unint64_t j = 0; j < (unint64_t)v10; ++j)
          {
            uint64_t v13 = v11;
            id v11 = [v8 objectAtIndex:j];

            if ([v11 isSelected])
            {
              [v11 nodePoint];
              double v15 = v14;
              double v17 = v16;
              [v11 nodePoint];
              double v19 = v18;
              double v21 = v20;
              [v11 outControlPoint];
              double v24 = +[CRLBezierNode bezierNodeWithPoint:inControlPoint:outControlPoint:](CRLBezierNode, "bezierNodeWithPoint:inControlPoint:outControlPoint:", v15, v17, v19, v21, v22, v23);
              [v24 setSelected:0];
              [v11 nodePoint];
              [v11 setOutControlPoint:];
              [v8 insertObject:v24 atIndex:++j];
              ++v10;
            }
          }
        }
        [v6 setNodes:v8];
      }
      id v3 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v3);
  }
}

- (BOOL)canCutAtSelectedNodes
{
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v2 = [(CRLEditableBezierPathSource *)self subpaths];
  id v3 = [v2 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v18;
    while (2)
    {
      for (uint64_t i = 0; i != v4; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v18 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        id v8 = [v7 nodes];
        unsigned int v9 = [v7 isClosed];
        uint64_t v10 = (char *)[v8 count];
        if (v10)
        {
          unint64_t v11 = v9 ^ 1;
          unsigned int v12 = &v10[-([v7 isClosed] ^ 1)];
          if ((unint64_t)v12 > v11)
          {
            while (1)
            {
              uint64_t v13 = [v8 objectAtIndexedSubscript:v11];
              unsigned int v14 = [v13 isSelected];

              if (v14) {
                break;
              }
              if (v12 == (char *)++v11) {
                goto LABEL_10;
              }
            }

            BOOL v15 = 1;
            goto LABEL_15;
          }
        }
LABEL_10:
      }
      id v4 = [v2 countByEnumeratingWithState:&v17 objects:v21 count:16];
      BOOL v15 = 0;
      if (v4) {
        continue;
      }
      break;
    }
  }
  else
  {
    BOOL v15 = 0;
  }
LABEL_15:

  return v15;
}

- (void)cutAtSelectedNodes
{
  id v33 = objc_alloc_init((Class)NSMutableArray);
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v29 = self;
  id v3 = [(CRLEditableBezierPathSource *)self subpaths];
  id v4 = [v3 countByEnumeratingWithState:&v34 objects:v38 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v35;
    double v30 = v3;
    uint64_t v31 = *(void *)v35;
    do
    {
      id v7 = 0;
      id v32 = v5;
      do
      {
        if (*(void *)v35 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v34 + 1) + 8 * (void)v7);
        unsigned int v9 = [v8 nodes];
        id v10 = [v9 mutableCopy];

        if ([v10 count])
        {
          if ([v8 isClosed])
          {
            unint64_t v11 = (char *)[v10 count];
            if (v11)
            {
              unsigned int v12 = v11 - 1;
              while (1)
              {
                uint64_t v13 = [v10 objectAtIndexedSubscript:v12];
                if ([v13 isSelected]) {
                  break;
                }

                if (--v12 == (char *)-1)
                {
                  uint64_t v6 = v31;
                  id v5 = v32;
                  goto LABEL_16;
                }
              }
              [v13 setSelected:0];
              if (v12)
              {
                id v14 = objc_alloc_init((Class)NSMutableArray);
                BOOL v15 = [v10 subarrayWithRange:v12, [v10 count] - v12];
                [v14 addObjectsFromArray:v15];

                double v16 = [v10 subarrayWithRange:0, v12];
                [v14 addObjectsFromArray:v16];

                [v8 setNodes:v14];
                id v10 = v14;
              }
              uint64_t v6 = v31;
              id v5 = v32;
              id v17 = [v13 copy];
              [v10 addObject:v17];
              [v8 setClosed:0];
              [v8 setNodes:v10];
            }
          }
LABEL_16:
          if (([v8 isClosed] & 1) == 0)
          {
            long long v18 = (char *)[v10 count];
            long long v19 = v18 - 1;
            if ((unint64_t)(v18 - 1) >= 2)
            {
              uint64_t v20 = 1 - (void)v18;
              do
              {
                unint64_t v21 = (unint64_t)(v19 - 1);
                double v22 = [v10 objectAtIndexedSubscript:v19 - 1];
                if ([v22 isSelected])
                {
                  [v22 setSelected:0];
                  id v23 = [v22 copy];
                  id v24 = objc_alloc_init((Class)NSMutableArray);
                  [v24 addObject:v23];
                  double v25 = [v10 subarrayWithRange:v19, (char *)[v10 count] + v20];
                  [v24 addObjectsFromArray:v25];

                  long long v26 = objc_alloc_init(CRLBezierSubpath);
                  [(CRLBezierSubpath *)v26 setNodes:v24];
                  [v10 removeObjectsInRange:v19, (char *)[v10 count] + v20];
                  [v8 setNodes:v10];
                  [v33 addObject:v26];
                }
                ++v20;
                --v19;
              }
              while (v21 > 1);
              id v3 = v30;
              uint64_t v6 = v31;
              id v5 = v32;
            }
          }
        }

        id v7 = (char *)v7 + 1;
      }
      while (v7 != v5);
      id v5 = [v3 countByEnumeratingWithState:&v34 objects:v38 count:16];
    }
    while (v5);
  }

  long long v27 = [(CRLEditableBezierPathSource *)v29 subpaths];
  long long v28 = [v27 arrayByAddingObjectsFromArray:v33];
  [(CRLEditableBezierPathSource *)v29 setSubpaths:v28];
}

- (CGPath)subpathForSelection
{
  id v3 = +[CRLBezierPath bezierPath];
  id v4 = [(CRLEditableBezierPathSource *)self subpaths];
  id v5 = [v4 objectEnumerator];

  uint64_t v6 = [v5 nextObject];
  if (v6)
  {
    id v7 = (void *)v6;
    do
    {
      [v7 appendToBezierPath:v3 selectedNodesOnly:1 fromIndex:0];
      uint64_t v8 = [v5 nextObject];

      id v7 = (void *)v8;
    }
    while (v8);
  }
  id v9 = v3;
  id v10 = (CGPath *)[v9 CGPath];

  return v10;
}

- (NSArray)nodeTypes
{
  id v3 = +[NSMutableArray array];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id obj = [(CRLEditableBezierPathSource *)self subpaths];
  id v4 = [obj countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v5; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v22 != v6) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        long long v17 = 0u;
        long long v18 = 0u;
        long long v19 = 0u;
        long long v20 = 0u;
        id v9 = [v8 nodes];
        id v10 = [v9 countByEnumeratingWithState:&v17 objects:v25 count:16];
        if (v10)
        {
          id v11 = v10;
          uint64_t v12 = *(void *)v18;
          do
          {
            for (unint64_t j = 0; j != v11; unint64_t j = (char *)j + 1)
            {
              if (*(void *)v18 != v12) {
                objc_enumerationMutation(v9);
              }
              id v14 = +[NSNumber numberWithChar:](NSNumber, "numberWithChar:", (char)[*(id *)(*((void *)&v17 + 1) + 8 * (void)j) type]);
              [v3 addObject:v14];
            }
            id v11 = [v9 countByEnumeratingWithState:&v17 objects:v25 count:16];
          }
          while (v11);
        }
      }
      id v5 = [obj countByEnumeratingWithState:&v21 objects:v26 count:16];
    }
    while (v5);
  }

  return (NSArray *)v3;
}

- (void)setNodeTypes:(id)a3
{
  id v4 = a3;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id obj = [(CRLEditableBezierPathSource *)self subpaths];
  id v5 = [obj countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = 0;
    uint64_t v18 = *(void *)v24;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v24 != v18) {
          objc_enumerationMutation(obj);
        }
        id v9 = *(void **)(*((void *)&v23 + 1) + 8 * (void)v8);
        long long v19 = 0u;
        long long v20 = 0u;
        long long v21 = 0u;
        long long v22 = 0u;
        id v10 = [v9 nodes];
        id v11 = [v10 countByEnumeratingWithState:&v19 objects:v27 count:16];
        if (v11)
        {
          id v12 = v11;
          uint64_t v13 = *(void *)v20;
          do
          {
            id v14 = 0;
            do
            {
              if (*(void *)v20 != v13) {
                objc_enumerationMutation(v10);
              }
              BOOL v15 = *(void **)(*((void *)&v19 + 1) + 8 * (void)v14);
              double v16 = [v4 objectAtIndex:(char *)v14 + v7];
              [v15 setType:((int)[v16 intValue])];

              id v14 = (char *)v14 + 1;
            }
            while (v12 != v14);
            id v12 = [v10 countByEnumeratingWithState:&v19 objects:v27 count:16];
            v7 += (uint64_t)v14;
          }
          while (v12);
        }

        uint64_t v8 = (char *)v8 + 1;
      }
      while (v8 != v6);
      id v6 = [obj countByEnumeratingWithState:&v23 objects:v28 count:16];
    }
    while (v6);
  }
}

- (void)moveToPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  id v6 = [(CRLEditableBezierPathSource *)self subpaths];
  id v15 = [v6 lastObject];

  uint64_t v7 = [v15 nodes];
  id v8 = [v7 count];

  if (v8)
  {
    id v9 = [v15 nodes];
    id v10 = [v9 count];

    if (v10 == (id)1)
    {
      id v11 = [v15 nodes];
      id v12 = [v11 lastObject];

      -[CRLBezierSubpath setNodePoint:](v12, "setNodePoint:", x, y);
    }
    else
    {
      id v12 = objc_alloc_init(CRLBezierSubpath);
      uint64_t v13 = [(CRLEditableBezierPathSource *)self subpaths];
      id v14 = [v13 arrayByAddingObject:v12];
      [(CRLEditableBezierPathSource *)self setSubpaths:v14];
    }
  }
  else
  {
    +[CRLBezierNode bezierNodeWithPoint:](CRLBezierNode, "bezierNodeWithPoint:", x, y);
    id v12 = (CRLBezierSubpath *)objc_claimAutoreleasedReturnValue();
    [v15 addNode:v12];
  }
}

- (void)lineToPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  id v5 = [(CRLEditableBezierPathSource *)self subpaths];
  id v6 = [v5 lastObject];

  uint64_t v7 = [v6 nodes];
  id v8 = [v7 count];

  if (!v8)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014DC1F0);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010810A0();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014DC210);
    }
    id v9 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010668E0(v9);
    }
    id v10 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLEditableBezierPathSource lineToPoint:]");
    id v11 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLEditableBezierPathSource.m"];
    +[CRLAssertionHandler handleFailureInFunction:v10 file:v11 lineNumber:2047 isFatal:0 description:"cannot add line to subpath without move first"];
  }
  id v12 = +[CRLBezierNode bezierNodeWithPoint:](CRLBezierNode, "bezierNodeWithPoint:", x, y);
  [v6 addNode:v12];
}

- (void)curveToPoint:(CGPoint)a3 controlPoint1:(CGPoint)a4 controlPoint2:(CGPoint)a5
{
  double y = a5.y;
  double x = a5.x;
  double v7 = a4.y;
  double v8 = a4.x;
  double v9 = a3.y;
  double v10 = a3.x;
  id v11 = [(CRLEditableBezierPathSource *)self subpaths];
  id v12 = [v11 lastObject];

  uint64_t v13 = [v12 nodes];
  id v14 = [v13 count];

  if (!v14)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014DC230);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101081128();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014DC250);
    }
    id v15 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010668E0(v15);
    }
    double v16 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLEditableBezierPathSource curveToPoint:controlPoint1:controlPoint2:]");
    long long v17 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLEditableBezierPathSource.m"];
    +[CRLAssertionHandler handleFailureInFunction:v16 file:v17 lineNumber:2054 isFatal:0 description:"cannot add line to subpath without move first"];
  }
  uint64_t v18 = [v12 nodes];
  long long v19 = [v18 lastObject];

  [v19 setOutControlPoint:v8, v7];
  long long v20 = +[CRLBezierNode bezierNodeWithPoint:inControlPoint:outControlPoint:](CRLBezierNode, "bezierNodeWithPoint:inControlPoint:outControlPoint:", v10, v9, x, y, v10, v9);
  [v12 addNode:v20];
}

- (void)smoothCurveToPoint:(CGPoint)a3 controlPoint1:(CGPoint)a4 controlPoint2:(CGPoint)a5
{
  -[CRLEditableBezierPathSource curveToPoint:controlPoint1:controlPoint2:](self, "curveToPoint:controlPoint1:controlPoint2:", a3.x, a3.y, a4.x, a4.y, a5.x, a5.y);
  id v6 = [(CRLEditableBezierPathSource *)self subpaths];
  id v9 = [v6 lastObject];

  double v7 = [v9 nodes];
  double v8 = [v7 lastObject];

  [v8 setType:3];
}

- (void)closePath
{
  id v2 = [(CRLEditableBezierPathSource *)self subpaths];
  id v3 = [v2 lastObject];

  id v4 = [v3 nodes];
  id v5 = [v4 count];

  if ((unint64_t)v5 <= 1)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014DC270);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010811B0();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014DC290);
    }
    id v6 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010668E0(v6);
    }
    double v7 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLEditableBezierPathSource closePath]");
    double v8 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLEditableBezierPathSource.m"];
    +[CRLAssertionHandler handleFailureInFunction:v7 file:v8 lineNumber:2073 isFatal:0 description:"cannot close subpath without a line or curve segment"];
  }
  [v3 setClosed:1];
  id v9 = [v3 nodes];
  double v10 = [v9 objectAtIndex:0];

  id v11 = [v3 nodes];
  id v12 = [v11 lastObject];

  [v10 nodePoint];
  double v14 = v13;
  double v16 = v15;
  [v12 nodePoint];
  if (sub_100064084(v14, v16, v17, v18))
  {
    [v12 inControlPoint];
    [v10 setInControlPoint:];
    long long v19 = [v3 nodes];
    id v20 = [v19 mutableCopy];

    [v20 removeLastObject];
  }
}

- (id)inferredAccessibilityDescriptionNoShapeNames
{
  id v3 = [(CRLPathSource *)self userDefinedName];
  if (![v3 length])
  {
    id v4 = [(CRLPathSource *)self bezierPath];
    uint64_t v5 = [v4 inferredAccessibilityDescription];

    id v3 = (void *)v5;
  }

  return v3;
}

- (id)inferredAccessibilityDescription
{
  id v2 = [(CRLPathSource *)self bezierPath];
  id v3 = [v2 inferredAccessibilityDescription];

  return v3;
}

- (NSUUID)persistedUUID
{
  return self->mPersistedUUID;
}

- (void)setPersistedUUID:(id)a3
{
}

- (NSArray)subpaths
{
  return self->mSubpaths;
}

- (void)setSubpaths:(id)a3
{
}

- (unint64_t)activeSubpath
{
  return self->mActiveSubpath;
}

- (void)setActiveSubpath:(unint64_t)a3
{
  self->mActiveSubpath = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mPersistedUUID, 0);

  objc_storeStrong((id *)&self->mSubpaths, 0);
}

- (void)morphWithMorphInfo:(id)a3
{
  id v4 = a3;
  [(CRLEditableBezierPathSource *)self updateSmoothNodes];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v5 = [(CRLEditableBezierPathSource *)self subpaths];
  id v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      id v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * (void)v9) morphWithMorphInfo:v4];
        id v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void)updateSmoothNodes
{
  id v2 = [(CRLEditableBezierPathSource *)self subpaths];
  [v2 makeObjectsPerformSelector:"updateSmoothNodes"];
}

- (void)addTemporarySmoothNodes
{
  id v2 = [(CRLEditableBezierPathSource *)self subpaths];
  [v2 makeObjectsPerformSelector:"addTemporarySmoothNodes"];
}

@end
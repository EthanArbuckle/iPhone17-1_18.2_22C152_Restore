@interface TSDEditableBezierPathSource
+ (TSDEditableBezierPathSource)editableBezierPathSourceWithBezierPath:(id)a3;
+ (TSDEditableBezierPathSource)editableBezierPathSourceWithPathSource:(id)a3;
+ (id)editableBezierPathSource;
- (BOOL)allNodesSelected;
- (BOOL)bezierPathUnderPoint:(CGPoint)a3 withTransform:(CGAffineTransform *)a4 tolerance:(double)a5;
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
- (BOOL)isOpen;
- (BOOL)isRectangular;
- (CGAffineTransform)pathFlipTransform;
- (CGPath)pathWithoutFlips;
- (CGPath)subpathForSelection;
- (CGRect)nodeBounds;
- (CGSize)naturalSize;
- (Class)preferredRepClass;
- (NSArray)nodeTypes;
- (NSMutableArray)nodes;
- (NSMutableArray)subpaths;
- (TSDBezierNode)firstNode;
- (TSDBezierNode)lastNode;
- (TSDEditableBezierPathSource)init;
- (double)distanceToPoint:(CGPoint)a3 subpathIndex:(unint64_t *)a4 elementIndex:(unint64_t *)a5 tValue:(double *)a6 threshold:(double)a7;
- (id)bezierNodeUnderPoint:(CGPoint)a3 withTransform:(CGAffineTransform *)a4 andTolerance:(double)a5 returningType:(int64_t *)a6;
- (id)bezierPathWithoutFlips;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)insertNodeAtPoint:(CGPoint)a3 tolerance:(double)a4;
- (id)mixedObjectWithFraction:(double)a3 ofObject:(id)a4;
- (id)nodeAfterNode:(id)a3;
- (id)nodePriorToNode:(id)a3;
- (id)splitEdge:(int64_t)a3 at:(double)a4 fromSubpath:(int64_t)a5;
- (id)subpathsForConnectingUsingFirstSubpathFirstNode:(BOOL *)a3 andSecondPathFirstNode:(BOOL *)a4;
- (int64_t)mixingTypeWithObject:(id)a3;
- (void)addNode:(id)a3;
- (void)adjustGeometryForAlignToOrigin:(id)a3;
- (void)alignToOrigin;
- (void)closePath;
- (void)closeSelectedNodes;
- (void)connectSelectedNodes;
- (void)convertToHobby;
- (void)curveToPoint:(CGPoint)a3 controlPoint1:(CGPoint)a4 controlPoint2:(CGPoint)a5;
- (void)cutAtSelectedNodes;
- (void)dealloc;
- (void)deleteSelectedEdges;
- (void)deleteSelectedNodes;
- (void)deleteSelectedNodesForced:(BOOL)a3;
- (void)deselectAllNodes;
- (void)lineToPoint:(CGPoint)a3;
- (void)moveToPoint:(CGPoint)a3;
- (void)offsetSelectedEdgesByDelta:(CGPoint)a3;
- (void)offsetSelectedNodesByDelta:(CGPoint)a3;
- (void)removeLastNode;
- (void)removeNode:(id)a3;
- (void)reverseDirection;
- (void)selectAllNodes;
- (void)selectSubpathForNode:(id)a3 toggle:(BOOL)a4;
- (void)setBezierPath:(id)a3;
- (void)setClosed:(BOOL)a3;
- (void)setLockedFlipTransform:(BOOL)a3;
- (void)setNaturalSize:(CGSize)a3;
- (void)setNodeTypes:(id)a3;
- (void)setNodes:(id)a3;
- (void)setSubpaths:(id)a3;
- (void)sharpenAllNodes;
- (void)smoothAllNodes;
- (void)smoothCurveToPoint:(CGPoint)a3 controlPoint1:(CGPoint)a4 controlPoint2:(CGPoint)a5;
- (void)smoothNode:(id)a3;
- (void)splitSelectedEdges;
- (void)splitSelectedNodes;
- (void)toggleNode:(id)a3 toType:(int)a4 prevNode:(id)a5 nextNode:(id)a6;
- (void)toggleSelectedNodesToType:(int)a3;
- (void)transformUsingAffineTransform:(CGAffineTransform *)a3;
@end

@implementation TSDEditableBezierPathSource

- (TSDEditableBezierPathSource)init
{
  v5.receiver = self;
  v5.super_class = (Class)TSDEditableBezierPathSource;
  v2 = [(TSDEditableBezierPathSource *)&v5 init];
  if (v2)
  {
    v2->mSubpaths = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v3 = objc_alloc_init(TSDBezierSubpath);
    [(NSMutableArray *)v2->mSubpaths addObject:v3];
  }
  return v2;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  return (id)[v3 stringWithFormat:@"<%@ %p subpaths=%p>", NSStringFromClass(v4), self, self->mSubpaths];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init((Class)objc_opt_class());
  objc_msgSend(v4, "setHasHorizontalFlip:", -[TSDPathSource hasHorizontalFlip](self, "hasHorizontalFlip"));
  objc_msgSend(v4, "setHasVerticalFlip:", -[TSDPathSource hasVerticalFlip](self, "hasVerticalFlip"));
  objc_super v5 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithArray:copyItems:", -[TSDEditableBezierPathSource subpaths](self, "subpaths"), 1);
  [v4 setSubpaths:v5];
  id v6 = v5;
  return v4;
}

+ (id)editableBezierPathSource
{
  v2 = objc_alloc_init(TSDEditableBezierPathSource);

  return v2;
}

+ (TSDEditableBezierPathSource)editableBezierPathSourceWithPathSource:(id)a3
{
  uint64_t v4 = [a3 bezierPath];

  return (TSDEditableBezierPathSource *)[a1 editableBezierPathSourceWithBezierPath:v4];
}

+ (TSDEditableBezierPathSource)editableBezierPathSourceWithBezierPath:(id)a3
{
  uint64_t v4 = +[TSDEditableBezierPathSource editableBezierPathSource];
  [(TSDEditableBezierPathSource *)v4 setBezierPath:a3];
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self)
  {
    LOBYTE(v7) = 1;
  }
  else
  {
    uint64_t v12 = v3;
    uint64_t v13 = v4;
    v11.receiver = self;
    v11.super_class = (Class)TSDEditableBezierPathSource;
    unsigned int v7 = -[TSDPathSource isEqual:](&v11, sel_isEqual_);
    if (v7)
    {
      v8 = (const CGPath *)objc_msgSend(-[TSDPathSource bezierPath](self, "bezierPath"), "CGPath");
      v9 = (const CGPath *)objc_msgSend((id)objc_msgSend(a3, "bezierPath"), "CGPath");
      if (v8 == v9 || (unsigned int v7 = CGPathEqualToPath(v8, v9)) != 0) {
        LOBYTE(v7) = 1;
      }
    }
  }
  return v7;
}

- (BOOL)closeIfEndpointsAreEqual
{
  v2 = (void *)[(NSMutableArray *)self->mSubpaths objectAtIndex:self->mActiveSubpath];

  return [v2 closeIfEndpointsAreEqual];
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)TSDEditableBezierPathSource;
  [(TSDEditableBezierPathSource *)&v3 dealloc];
}

- (BOOL)isRectangular
{
  if ([(NSMutableArray *)self->mSubpaths count] != 1) {
    return 0;
  }
  objc_super v3 = (void *)[(NSMutableArray *)self->mSubpaths lastObject];

  return [v3 isRectangular];
}

- (BOOL)isCircular
{
  if ([(NSMutableArray *)self->mSubpaths count] != 1) {
    return 0;
  }
  objc_super v3 = (void *)[(NSMutableArray *)self->mSubpaths lastObject];

  return [v3 isCircular];
}

- (id)bezierPathWithoutFlips
{
  id v3 = +[TSDBezierPath bezierPath];
  objc_msgSend(v3, "moveToPoint:", *MEMORY[0x263F00148], *(double *)(MEMORY[0x263F00148] + 8));
  [(NSMutableArray *)self->mSubpaths makeObjectsPerformSelector:sel_appendToBezierPath_ withObject:v3];
  return v3;
}

- (CGPath)pathWithoutFlips
{
  id v2 = [(TSDEditableBezierPathSource *)self bezierPathWithoutFlips];

  return (CGPath *)[v2 CGPath];
}

- (void)convertToHobby
{
}

- (void)setBezierPath:(id)a3
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  uint64_t v5 = [a3 elementCount];
  uint64_t v35 = 0;
  v36 = &v35;
  uint64_t v37 = 0x3052000000;
  v38 = __Block_byref_object_copy__18;
  v39 = __Block_byref_object_dispose__18;
  uint64_t v40 = 0;
  uint64_t v29 = 0;
  v30 = &v29;
  uint64_t v31 = 0x3052000000;
  v32 = __Block_byref_object_copy__18;
  v33 = __Block_byref_object_dispose__18;
  uint64_t v34 = 0;

  mSubpaths = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
  self->mSubpaths = mSubpaths;
  uint64_t v22 = MEMORY[0x263EF8330];
  uint64_t v23 = 3221225472;
  v24 = __45__TSDEditableBezierPathSource_setBezierPath___block_invoke;
  v25 = &unk_2646B2698;
  v26 = self;
  v27 = &v29;
  v28 = &v35;
  if (v5 >= 1)
  {
    for (uint64_t i = 0; i != v5; ++i)
    {
      uint64_t v8 = objc_msgSend(a3, "elementAtIndex:associatedPoints:", i, &v41, v22, v23);
      if (v36[5]) {
        v24(&v22);
      }
      v9 = (void *)[(id)v30[5] lastNode];
      v10 = v9;
      switch(v8)
      {
        case 0:
          objc_super v11 = +[TSDBezierNode bezierNodeWithPoint:](TSDBezierNode, "bezierNodeWithPoint:", v41, v42);
          v36[5] = (uint64_t)v11;
          if (i) {
            v30[5] = 0;
          }
          else {
            v24(&v22);
          }
          break;
        case 1:
          uint64_t v12 = +[TSDBezierNode bezierNodeWithPoint:](TSDBezierNode, "bezierNodeWithPoint:", v41, v42);
          goto LABEL_10;
        case 2:
          objc_msgSend(v9, "setOutControlPoint:", v41, v42);
          [v10 setType:2];
          uint64_t v12 = +[TSDBezierNode bezierNodeWithPoint:inControlPoint:outControlPoint:](TSDBezierNode, "bezierNodeWithPoint:inControlPoint:outControlPoint:", v45, v46, v43, v44, v45, v46);
LABEL_10:
          [(id)v30[5] addNode:v12];
          break;
        case 3:
          uint64_t v13 = [(id)v30[5] firstNode];
          v14 = (void *)v13;
          if (v10) {
            BOOL v15 = v13 == 0;
          }
          else {
            BOOL v15 = 1;
          }
          if (!v15)
          {
            [v10 nodePoint];
            double v17 = v16;
            double v19 = v18;
            [v14 nodePoint];
            if (TSDNearlyEqualPoints(v17, v19, v20, v21))
            {
              [v10 inControlPoint];
              objc_msgSend(v14, "setInControlPoint:");
              [(id)v30[5] removeLastNode];
            }
          }
          [(id)v30[5] setClosed:1];
          break;
        default:
          continue;
      }
    }
    mSubpaths = self->mSubpaths;
  }
  -[NSMutableArray makeObjectsPerformSelector:](mSubpaths, "makeObjectsPerformSelector:", sel_updateReflectedState, v22, v23);
  if ((objc_msgSend((id)objc_msgSend(MEMORY[0x263EFFA40], "standardUserDefaults"), "BOOLForKey:", @"TSDCreateBezierNodesByDefault") & 1) == 0)-[TSDEditableBezierPathSource convertToHobby](self, "convertToHobby"); {
  _Block_object_dispose(&v29, 8);
  }
  _Block_object_dispose(&v35, 8);
}

uint64_t __45__TSDEditableBezierPathSource_setBezierPath___block_invoke(void *a1)
{
  id v2 = *(void **)(*(void *)(a1[5] + 8) + 40);
  if (!v2)
  {
    *(void *)(*(void *)(a1[5] + 8) + 40) = objc_alloc_init(TSDBezierSubpath);
    [*(id *)(a1[4] + 16) addObject:*(void *)(*(void *)(a1[5] + 8) + 40)];

    id v2 = *(void **)(*(void *)(a1[5] + 8) + 40);
  }
  uint64_t result = [v2 addNode:*(void *)(*(void *)(a1[6] + 8) + 40)];
  *(void *)(*(void *)(a1[6] + 8) + 40) = 0;
  return result;
}

- (void)setNodes:(id)a3
{
  self->mSubpaths = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
  uint64_t v5 = objc_alloc_init(TSDBezierSubpath);
  [(NSMutableArray *)self->mSubpaths addObject:v5];

  [(TSDBezierSubpath *)v5 setNodes:a3];
}

- (NSMutableArray)nodes
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF980]);
  [(NSMutableArray *)self->mSubpaths makeObjectsPerformSelector:sel_addNodesToArray_ withObject:v3];

  return (NSMutableArray *)v3;
}

- (void)reverseDirection
{
  id v2 = (void *)[(NSMutableArray *)self->mSubpaths objectAtIndex:self->mActiveSubpath];

  [v2 reverseDirection];
}

- (void)setLockedFlipTransform:(BOOL)a3
{
  p_mLockedFlipTransform = &self->mLockedFlipTransform;
  v7[0].receiver = self;
  v7[0].super_class = (Class)TSDEditableBezierPathSource;
  [(objc_super *)v7 pathFlipTransform];
  objc_super v6 = v7[2];
  *(objc_super *)&p_mLockedFlipTransform->a = v7[1];
  *(objc_super *)&p_mLockedFlipTransform->c = v6;
  *(objc_super *)&p_mLockedFlipTransform->tx = v7[3];
  self->mHasLockedFlipTransform = a3;
}

- (CGAffineTransform)pathFlipTransform
{
  if (LOBYTE(self->tx))
  {
    long long v3 = *(_OWORD *)&self[1].b;
    *(_OWORD *)&retstr->a = *(_OWORD *)&self->ty;
    *(_OWORD *)&retstr->c = v3;
    *(_OWORD *)&retstr->tx = *(_OWORD *)&self[1].d;
  }
  else
  {
    v4.receiver = self;
    v4.super_class = (Class)TSDEditableBezierPathSource;
    return (CGAffineTransform *)[(CGAffineTransform *)&v4 pathFlipTransform];
  }
  return self;
}

- (CGSize)naturalSize
{
  id v2 = [(TSDEditableBezierPathSource *)self bezierPathWithoutFlips];
  long long v3 = v2;
  if (v2)
  {
    [v2 bounds];
    double v5 = v4;
    double v7 = v6;
  }
  else
  {
    double v5 = *MEMORY[0x263F001B0];
    double v7 = *(double *)(MEMORY[0x263F001B0] + 8);
  }
  int v8 = [v3 isLineSegment];
  double v9 = 1.0;
  if (v5 >= 1.0) {
    double v10 = v5;
  }
  else {
    double v10 = 1.0;
  }
  if (v7 >= 1.0) {
    double v9 = v7;
  }
  if (v8) {
    double v11 = v7;
  }
  else {
    double v11 = v9;
  }
  if (v8) {
    double v12 = v5;
  }
  else {
    double v12 = v10;
  }
  result.height = v11;
  result.width = v12;
  return result;
}

- (Class)preferredRepClass
{
  return (Class)objc_opt_class();
}

- (void)setNaturalSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  uint64_t v48 = *MEMORY[0x263EF8340];
  if ((unint64_t)[(NSMutableArray *)[(TSDEditableBezierPathSource *)self nodes] count] >= 2)
  {
    [(TSDEditableBezierPathSource *)self naturalSize];
    if (v6 <= 0.0) {
      double v8 = 1.0;
    }
    else {
      double v8 = width / v6;
    }
    if (v7 <= 0.0) {
      double v9 = 1.0;
    }
    else {
      double v9 = height / v7;
    }
    long long v10 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
    *(_OWORD *)&v45.a = *MEMORY[0x263F000D0];
    *(_OWORD *)&v45.c = v10;
    *(_OWORD *)&v45.tx = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
    long long v31 = v10;
    long long v33 = *(_OWORD *)&v45.a;
    *(_OWORD *)&v44.a = *(_OWORD *)&v45.a;
    *(_OWORD *)&v44.c = v10;
    long long v29 = *(_OWORD *)&v45.tx;
    *(_OWORD *)&v44.tx = *(_OWORD *)&v45.tx;
    CGAffineTransformScale(&v45, &v44, v8, v9);
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    mSubpaths = self->mSubpaths;
    uint64_t v12 = [(NSMutableArray *)mSubpaths countByEnumeratingWithState:&v40 objects:v47 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v41;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v41 != v14) {
            objc_enumerationMutation(mSubpaths);
          }
          double v16 = *(void **)(*((void *)&v40 + 1) + 8 * i);
          CGAffineTransform v44 = v45;
          objc_msgSend(v16, "transformUsingAffineTransform:", &v44, v29, v31, v33);
        }
        uint64_t v13 = [(NSMutableArray *)mSubpaths countByEnumeratingWithState:&v40 objects:v47 count:16];
      }
      while (v13);
    }
    [(TSDEditableBezierPathSource *)self naturalSize];
    double v18 = v17;
    double v20 = v19;
    if (!TSDNearlyEqualSizes(v17, v19, width, height))
    {
      double v21 = width / v18;
      double v22 = 1.0;
      if (v18 <= 0.0) {
        double v21 = 1.0;
      }
      *(_OWORD *)&v45.a = v34;
      *(_OWORD *)&v45.c = v32;
      *(_OWORD *)&v45.tx = v30;
      if (v20 > 0.0) {
        double v22 = height / v20;
      }
      *(_OWORD *)&v39.a = v34;
      *(_OWORD *)&v39.c = v32;
      *(_OWORD *)&v39.tx = v30;
      CGAffineTransformScale(&v44, &v39, v21, v22);
      long long v35 = 0u;
      long long v36 = 0u;
      long long v37 = 0u;
      long long v38 = 0u;
      uint64_t v23 = self->mSubpaths;
      uint64_t v24 = [(NSMutableArray *)v23 countByEnumeratingWithState:&v35 objects:v46 count:16];
      if (v24)
      {
        uint64_t v25 = v24;
        uint64_t v26 = *(void *)v36;
        do
        {
          for (uint64_t j = 0; j != v25; ++j)
          {
            if (*(void *)v36 != v26) {
              objc_enumerationMutation(v23);
            }
            v28 = *(void **)(*((void *)&v35 + 1) + 8 * j);
            CGAffineTransform v44 = v45;
            [v28 transformUsingAffineTransform:&v44];
          }
          uint64_t v25 = [(NSMutableArray *)v23 countByEnumeratingWithState:&v35 objects:v46 count:16];
        }
        while (v25);
      }
    }
  }
}

- (void)transformUsingAffineTransform:(CGAffineTransform *)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  mSubpaths = self->mSubpaths;
  uint64_t v5 = [(NSMutableArray *)mSubpaths countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(mSubpaths);
        }
        double v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        long long v10 = *(_OWORD *)&a3->c;
        v11[0] = *(_OWORD *)&a3->a;
        v11[1] = v10;
        v11[2] = *(_OWORD *)&a3->tx;
        [v9 transformUsingAffineTransform:v11];
      }
      uint64_t v6 = [(NSMutableArray *)mSubpaths countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }
}

- (void)alignToOrigin
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  objc_msgSend(-[TSDEditableBezierPathSource bezierPathWithoutFlips](self, "bezierPathWithoutFlips"), "bounds");
  CGFloat x = v23.origin.x;
  CGFloat y = v23.origin.y;
  CGFloat width = v23.size.width;
  CGFloat height = v23.size.height;
  memset(&v20, 0, sizeof(v20));
  CGFloat v7 = -CGRectGetMinX(v23);
  v24.origin.CGFloat x = x;
  v24.origin.CGFloat y = y;
  v24.size.CGFloat width = width;
  v24.size.CGFloat height = height;
  CGFloat MinY = CGRectGetMinY(v24);
  CGAffineTransformMakeTranslation(&v20, v7, -MinY);
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  mSubpaths = self->mSubpaths;
  uint64_t v10 = [(NSMutableArray *)mSubpaths countByEnumeratingWithState:&v16 objects:v21 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v17;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v17 != v12) {
          objc_enumerationMutation(mSubpaths);
        }
        long long v14 = *(void **)(*((void *)&v16 + 1) + 8 * v13);
        CGAffineTransform v15 = v20;
        [v14 transformUsingAffineTransform:&v15];
        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [(NSMutableArray *)mSubpaths countByEnumeratingWithState:&v16 objects:v21 count:16];
    }
    while (v11);
  }
}

- (void)adjustGeometryForAlignToOrigin:(id)a3
{
}

- (void)addNode:(id)a3
{
  double v4 = (void *)[(NSMutableArray *)self->mSubpaths objectAtIndex:self->mActiveSubpath];

  [v4 addNode:a3];
}

- (void)removeLastNode
{
  id v2 = (void *)[(NSMutableArray *)self->mSubpaths objectAtIndex:self->mActiveSubpath];

  [v2 removeLastNode];
}

- (id)nodePriorToNode:(id)a3
{
  double v4 = (void *)[(NSMutableArray *)self->mSubpaths objectAtIndex:self->mActiveSubpath];

  return (id)[v4 nodePriorToNode:a3];
}

- (id)nodeAfterNode:(id)a3
{
  double v4 = (void *)[(NSMutableArray *)self->mSubpaths objectAtIndex:self->mActiveSubpath];

  return (id)[v4 nodeAfterNode:a3];
}

- (TSDBezierNode)firstNode
{
  id v2 = (void *)[(NSMutableArray *)self->mSubpaths objectAtIndex:self->mActiveSubpath];

  return (TSDBezierNode *)[v2 firstNode];
}

- (TSDBezierNode)lastNode
{
  id v2 = (void *)[(NSMutableArray *)self->mSubpaths objectAtIndex:self->mActiveSubpath];

  return (TSDBezierNode *)[v2 lastNode];
}

- (void)offsetSelectedNodesByDelta:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  uint64_t v15 = *MEMORY[0x263EF8340];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  mSubpaths = self->mSubpaths;
  uint64_t v6 = [(NSMutableArray *)mSubpaths countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(mSubpaths);
        }
        objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * i), "offsetSelectedNodesByDelta:", x, y);
      }
      uint64_t v7 = [(NSMutableArray *)mSubpaths countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void)offsetSelectedEdgesByDelta:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  uint64_t v15 = *MEMORY[0x263EF8340];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  mSubpaths = self->mSubpaths;
  uint64_t v6 = [(NSMutableArray *)mSubpaths countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(mSubpaths);
        }
        objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * i), "offsetSelectedEdgesByDelta:", x, y);
      }
      uint64_t v7 = [(NSMutableArray *)mSubpaths countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (BOOL)hasSelectedNode
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  mSubpaths = self->mSubpaths;
  uint64_t v3 = [(NSMutableArray *)mSubpaths countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    int v5 = 0;
    uint64_t v6 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(mSubpaths);
        }
        v5 |= [*(id *)(*((void *)&v9 + 1) + 8 * i) hasSelectedNode];
      }
      uint64_t v4 = [(NSMutableArray *)mSubpaths countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }
  else
  {
    LOBYTE(v5) = 0;
  }
  return v5 & 1;
}

- (BOOL)allNodesSelected
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  mSubpaths = self->mSubpaths;
  uint64_t v3 = [(NSMutableArray *)mSubpaths countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v10;
LABEL_3:
    uint64_t v6 = 0;
    while (1)
    {
      if (*(void *)v10 != v5) {
        objc_enumerationMutation(mSubpaths);
      }
      int v7 = [*(id *)(*((void *)&v9 + 1) + 8 * v6) allNodesSelected];
      if (!v7) {
        break;
      }
      if (v4 == ++v6)
      {
        uint64_t v4 = [(NSMutableArray *)mSubpaths countByEnumeratingWithState:&v9 objects:v13 count:16];
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

- (void)removeNode:(id)a3
{
  uint64_t v4 = (void *)[(NSMutableArray *)self->mSubpaths objectAtIndex:self->mActiveSubpath];

  [v4 removeNode:a3];
}

- (BOOL)isCompound
{
  return (unint64_t)[(NSMutableArray *)self->mSubpaths count] > 1;
}

- (BOOL)canDeleteSelectedNodes
{
  BOOL v3 = [(TSDEditableBezierPathSource *)self isCompound];
  mSubpaths = self->mSubpaths;
  if (v3)
  {
    uint64_t v5 = (void *)[(NSMutableArray *)mSubpaths objectEnumerator];
    uint64_t v6 = [v5 nextObject];
    if (!v6) {
      return 1;
    }
    int v7 = (void *)v6;
    while (![v7 hasSelectedNode]
         || [v7 canDeleteSelectedNodes])
    {
      int v7 = (void *)[v5 nextObject];
      if (!v7) {
        return 1;
      }
    }
    long long v11 = (void *)[(NSMutableArray *)self->mSubpaths objectEnumerator];
    do
    {
      long long v12 = (void *)[v11 nextObject];
      BOOL v8 = v12 != 0;
      if (!v12) {
        break;
      }
      long long v13 = v12;
      if (![v12 hasSelectedNode]) {
        break;
      }
    }
    while (![v13 canDeleteSelectedNodes]);
    return v8;
  }
  else
  {
    long long v10 = (void *)[(NSMutableArray *)mSubpaths lastObject];
    return [v10 canDeleteSelectedNodes];
  }
}

- (BOOL)deletingSelectedNodesWillDeleteShape
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  mSubpaths = self->mSubpaths;
  uint64_t v3 = [(NSMutableArray *)mSubpaths countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v11;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(mSubpaths);
        }
        int v7 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        if ((unint64_t)objc_msgSend((id)objc_msgSend(v7, "nodes"), "count") >= 3)
        {
          int v8 = [v7 hasSelectedNode];
          if (!v8) {
            return v8;
          }
          if ([v7 canDeleteSelectedNodes])
          {
            LOBYTE(v8) = 0;
            return v8;
          }
        }
      }
      uint64_t v4 = [(NSMutableArray *)mSubpaths countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
  LOBYTE(v8) = 1;
  return v8;
}

- (void)deleteSelectedNodesForced:(BOOL)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  uint64_t v5 = (void *)[MEMORY[0x263EFF980] array];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  mSubpaths = self->mSubpaths;
  uint64_t v7 = [(NSMutableArray *)mSubpaths countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(mSubpaths);
        }
        long long v11 = *(void **)(*((void *)&v12 + 1) + 8 * i);
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
      uint64_t v8 = [(NSMutableArray *)mSubpaths countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }
  [(NSMutableArray *)self->mSubpaths removeObjectsInArray:v5];
}

- (void)deleteSelectedNodes
{
}

- (void)selectAllNodes
{
}

- (void)deselectAllNodes
{
}

- (id)bezierNodeUnderPoint:(CGPoint)a3 withTransform:(CGAffineTransform *)a4 andTolerance:(double)a5 returningType:(int64_t *)a6
{
  double y = a3.y;
  double x = a3.x;
  long long v11 = (void *)[(NSMutableArray *)[(TSDEditableBezierPathSource *)self subpaths] objectEnumerator];
  do
  {
    id result = (id)[v11 nextObject];
    if (!result) {
      break;
    }
    long long v13 = *(_OWORD *)&a4->c;
    v14[0] = *(_OWORD *)&a4->a;
    v14[1] = v13;
    v14[2] = *(_OWORD *)&a4->tx;
    id result = (id)objc_msgSend(result, "bezierNodeUnderPoint:withTransform:andTolerance:returningType:", v14, a6, x, y, a5);
  }
  while (!result);
  return result;
}

- (double)distanceToPoint:(CGPoint)a3 subpathIndex:(unint64_t *)a4 elementIndex:(unint64_t *)a5 tValue:(double *)a6 threshold:(double)a7
{
  double y = a3.y;
  double x = a3.x;
  uint64_t v14 = [(NSMutableArray *)self->mSubpaths count];
  if (v14) {
    BOOL v15 = a7 < 1.79769313e308;
  }
  else {
    BOOL v15 = 0;
  }
  if (v15)
  {
    unint64_t v20 = v14;
    unint64_t v17 = 0;
    unint64_t v16 = 0;
    uint64_t v18 = 0;
    double v19 = 1.79769313e308;
    unint64_t v21 = 1;
    do
    {
      uint64_t v22 = (void *)[(NSMutableArray *)self->mSubpaths objectAtIndexedSubscript:v21 - 1];
      uint64_t v25 = 0;
      unint64_t v26 = 0;
      objc_msgSend(v22, "distanceToPoint:elementIndex:tValue:threshold:", &v26, &v25, x, y, a7);
      if (v23 < v19)
      {
        unint64_t v16 = v26;
        uint64_t v18 = v25;
        unint64_t v17 = v21 - 1;
        double v19 = v23;
      }
      if (v21 >= v20) {
        break;
      }
      ++v21;
    }
    while (v19 > a7);
  }
  else
  {
    unint64_t v16 = 0;
    unint64_t v17 = 0;
    uint64_t v18 = 0;
    double v19 = 1.79769313e308;
  }
  if (a4) {
    *a4 = v17;
  }
  if (a5) {
    *a5 = v16;
  }
  if (a6) {
    *(void *)a6 = v18;
  }
  return v19;
}

- (BOOL)bezierPathUnderPoint:(CGPoint)a3 withTransform:(CGAffineTransform *)a4 tolerance:(double)a5
{
  double y = a3.y;
  double x = a3.x;
  id v9 = [(TSDEditableBezierPathSource *)self bezierPathWithoutFlips];
  long long v10 = *(_OWORD *)&a4->c;
  v12[0] = *(_OWORD *)&a4->a;
  v12[1] = v10;
  v12[2] = *(_OWORD *)&a4->tx;
  [v9 transformUsingAffineTransform:v12];
  return objc_msgSend(v9, "pointOnPath:tolerance:", x, y, a5);
}

- (id)insertNodeAtPoint:(CGPoint)a3 tolerance:(double)a4
{
  double y = a3.y;
  double x = a3.x;
  uint64_t v7 = (void *)[(NSMutableArray *)self->mSubpaths objectEnumerator];
  while (1)
  {
    id result = (id)[v7 nextObject];
    if (!result) {
      break;
    }
    id v9 = result;
    if (objc_msgSend((id)objc_msgSend(result, "bezierPath"), "pointOnPath:tolerance:", x, y, a4))
    {
      return (id)objc_msgSend(v9, "insertNodeAtPoint:tolerance:", x, y, a4);
    }
  }
  return result;
}

- (CGRect)nodeBounds
{
  CGFloat x = *MEMORY[0x263F001A8];
  CGFloat y = *(double *)(MEMORY[0x263F001A8] + 8);
  CGFloat width = *(double *)(MEMORY[0x263F001A8] + 16);
  CGFloat height = *(double *)(MEMORY[0x263F001A8] + 24);
  uint64_t v6 = (void *)[(NSMutableArray *)[(TSDEditableBezierPathSource *)self subpaths] objectEnumerator];
  for (i = v6; ; uint64_t v6 = i)
  {
    uint64_t v8 = (void *)[v6 nextObject];
    if (!v8) {
      break;
    }
    [v8 nodeBounds];
    v20.origin.CGFloat x = v9;
    v20.origin.CGFloat y = v10;
    v20.size.CGFloat width = v11;
    v20.size.CGFloat height = v12;
    v17.origin.CGFloat x = x;
    v17.origin.CGFloat y = y;
    v17.size.CGFloat width = width;
    v17.size.CGFloat height = height;
    CGRect v18 = CGRectUnion(v17, v20);
    CGFloat x = v18.origin.x;
    CGFloat y = v18.origin.y;
    CGFloat width = v18.size.width;
    CGFloat height = v18.size.height;
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

- (void)toggleNode:(id)a3 toType:(int)a4 prevNode:(id)a5 nextNode:(id)a6
{
  if ([a3 type] != a4)
  {
    switch(a4)
    {
      case 1:
        [a3 setType:1];
        if ([a6 type] == 1)
        {
          [a3 nodePoint];
          objc_msgSend(a3, "setOutControlPoint:");
          [a6 nodePoint];
          objc_msgSend(a6, "setInControlPoint:");
        }
        if ([a5 type] == 1)
        {
          [a3 nodePoint];
          objc_msgSend(a3, "setInControlPoint:");
          [a5 nodePoint];
          objc_msgSend(a5, "setOutControlPoint:");
        }
        break;
      case 3:
        [a3 setType:3];
        break;
      case 2:
        [a3 nodePoint];
        double v11 = v10;
        double v13 = v12;
        [a3 outControlPoint];
        if (TSDNearlyEqualPoints(v11, v13, v14, v15))
        {
          [a6 nodePoint];
          double v17 = v16;
          double v19 = v18;
          [a6 inControlPoint];
          if (TSDNearlyEqualPoints(v17, v19, v20, v21))
          {
            [a3 nodePoint];
            double v23 = v22;
            double v25 = v24;
            [a6 nodePoint];
            objc_msgSend(a3, "setOutControlPoint:", TSDMixPoints(v23, v25, v26, v27, 0.333333333));
            [a3 nodePoint];
            double v29 = v28;
            double v31 = v30;
            [a6 nodePoint];
            objc_msgSend(a6, "setInControlPoint:", TSDMixPoints(v29, v31, v32, v33, 0.666666667));
          }
        }
        [a3 nodePoint];
        double v35 = v34;
        double v37 = v36;
        [a3 inControlPoint];
        if (TSDNearlyEqualPoints(v35, v37, v38, v39))
        {
          [a5 nodePoint];
          double v41 = v40;
          double v43 = v42;
          [a5 outControlPoint];
          if (TSDNearlyEqualPoints(v41, v43, v44, v45))
          {
            [a3 nodePoint];
            double v47 = v46;
            double v49 = v48;
            [a5 nodePoint];
            objc_msgSend(a3, "setInControlPoint:", TSDMixPoints(v47, v49, v50, v51, 0.333333333));
            [a3 nodePoint];
            double v53 = v52;
            double v55 = v54;
            [a5 nodePoint];
            objc_msgSend(a5, "setOutControlPoint:", TSDMixPoints(v53, v55, v56, v57, 0.666666667));
          }
        }
        [a3 setType:2];
        [a3 updateReflectedState];
        break;
    }
  }
}

- (void)toggleSelectedNodesToType:(int)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  obuint64_t j = self->mSubpaths;
  uint64_t v19 = [(NSMutableArray *)obj countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v19)
  {
    uint64_t v18 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v19; ++i)
      {
        if (*(void *)v22 != v18) {
          objc_enumerationMutation(obj);
        }
        uint64_t v5 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        uint64_t v6 = (void *)[v5 nodes];
        if ([v6 count])
        {
          int v7 = [v5 isClosed];
          uint64_t v8 = v7 ? [v6 lastObject] : 0;
          uint64_t v9 = [v6 objectAtIndexedSubscript:0];
          uint64_t v10 = [v6 count];
          if (v10)
          {
            unint64_t v11 = v10;
            uint64_t v12 = 0;
            uint64_t v13 = v10 - 1;
            do
            {
              double v14 = (void *)v9;
              uint64_t v15 = v12 + 1;
              if (((v12 + 1 >= v11) & ~v7) != 0)
              {
                uint64_t v9 = 0;
              }
              else
              {
                if (v13 == v12) {
                  uint64_t v16 = 0;
                }
                else {
                  uint64_t v16 = v12 + 1;
                }
                uint64_t v9 = [v6 objectAtIndexedSubscript:v16];
              }
              if ([v14 isSelected]) {
                [(TSDEditableBezierPathSource *)self toggleNode:v14 toType:a3 prevNode:v8 nextNode:v9];
              }
              uint64_t v12 = v15;
              uint64_t v8 = (uint64_t)v14;
            }
            while (v11 != v15);
          }
        }
      }
      uint64_t v19 = [(NSMutableArray *)obj countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v19);
  }
}

- (void)sharpenAllNodes
{
}

- (void)smoothNode:(id)a3
{
  uint64_t v4 = (void *)[(NSMutableArray *)self->mSubpaths objectEnumerator];
  while (1)
  {
    uint64_t v5 = (void *)[v4 nextObject];
    if (!v5) {
      break;
    }
    uint64_t v6 = v5;
    if (objc_msgSend((id)objc_msgSend(v5, "nodes"), "containsObject:", a3))
    {
      [v6 smoothNode:a3];
      return;
    }
  }
}

- (void)smoothAllNodes
{
}

- (BOOL)isClosed
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  mSubpaths = self->mSubpaths;
  uint64_t v3 = [(NSMutableArray *)mSubpaths countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v10;
    while (2)
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(mSubpaths);
        }
        int v7 = *(void **)(*((void *)&v9 + 1) + 8 * v6);
        if (objc_msgSend((id)objc_msgSend(v7, "nodes"), "count") && (objc_msgSend(v7, "isClosed") & 1) != 0)
        {
          LOBYTE(v3) = 1;
          return v3;
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t v3 = [(NSMutableArray *)mSubpaths countByEnumeratingWithState:&v9 objects:v13 count:16];
      uint64_t v4 = v3;
      if (v3) {
        continue;
      }
      break;
    }
  }
  return v3;
}

- (BOOL)isOpen
{
  return ![(TSDEditableBezierPathSource *)self isClosed];
}

- (void)setClosed:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v14 = *MEMORY[0x263EF8340];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  mSubpaths = self->mSubpaths;
  uint64_t v5 = [(NSMutableArray *)mSubpaths countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(mSubpaths);
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * i) setClosed:v3];
      }
      uint64_t v6 = [(NSMutableArray *)mSubpaths countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (void)selectSubpathForNode:(id)a3 toggle:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v6 = (void *)[(NSMutableArray *)self->mSubpaths objectEnumerator];
  while (1)
  {
    uint64_t v7 = (void *)[v6 nextObject];
    if (!v7) {
      break;
    }
    uint64_t v8 = v7;
    if (objc_msgSend((id)objc_msgSend(v7, "nodes"), "containsObject:", a3))
    {
      if (v4 && [v8 allNodesSelected])
      {
        [v8 deselectAllNodes];
      }
      else
      {
        [v8 selectAllNodes];
      }
      return;
    }
  }
}

- (id)subpathsForConnectingUsingFirstSubpathFirstNode:(BOOL *)a3 andSecondPathFirstNode:(BOOL *)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  *a3 = 0;
  *a4 = 0;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  mSubpaths = self->mSubpaths;
  id result = (id)[(NSMutableArray *)mSubpaths countByEnumeratingWithState:&v13 objects:v18 count:16];
  if (result)
  {
    id v8 = result;
    long long v9 = 0;
    uint64_t v10 = *(void *)v14;
    while (2)
    {
      long long v11 = 0;
      do
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(mSubpaths);
        }
        long long v12 = *(void **)(*((void *)&v13 + 1) + 8 * (void)v11);
        if (([v12 isClosed] & 1) == 0 && objc_msgSend((id)objc_msgSend(v12, "nodes"), "count"))
        {
          if (objc_msgSend((id)objc_msgSend(v12, "firstNode"), "isSelected"))
          {
            if (v9)
            {
              *a4 = 1;
LABEL_18:
              if (!v12) {
                return 0;
              }
              v17[0] = v9;
              v17[1] = v12;
              return (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v17 count:2];
            }
            *a3 = 1;
            long long v9 = v12;
          }
          if (objc_msgSend((id)objc_msgSend(v12, "lastNode"), "isSelected"))
          {
            if (v9) {
              goto LABEL_18;
            }
            long long v9 = v12;
          }
        }
        long long v11 = (char *)v11 + 1;
      }
      while (v8 != v11);
      id result = (id)[(NSMutableArray *)mSubpaths countByEnumeratingWithState:&v13 objects:v18 count:16];
      id v8 = result;
      if (result) {
        continue;
      }
      break;
    }
  }
  return result;
}

- (BOOL)canConnectSelectedNodes
{
  __int16 v3 = 0;
  return [(TSDEditableBezierPathSource *)self subpathsForConnectingUsingFirstSubpathFirstNode:(char *)&v3 + 1 andSecondPathFirstNode:&v3] != 0;
}

- (void)connectSelectedNodes
{
  __int16 v12 = 0;
  id v3 = [(TSDEditableBezierPathSource *)self subpathsForConnectingUsingFirstSubpathFirstNode:(char *)&v12 + 1 andSecondPathFirstNode:&v12];
  if (v3)
  {
    BOOL v4 = v3;
    uint64_t v5 = (void *)[v3 objectAtIndexedSubscript:0];
    uint64_t v6 = (void *)[v4 objectAtIndexedSubscript:1];
    if (v5 == v6)
    {
      if (HIBYTE(v12) != v12) {
        [v5 setClosed:1];
      }
    }
    else
    {
      uint64_t v7 = v6;
      if (!HIBYTE(v12) && (_BYTE)v12) {
        goto LABEL_12;
      }
      if (HIBYTE(v12) && !(_BYTE)v12)
      {
        objc_msgSend((id)objc_msgSend(v6, "nodes"), "addObjectsFromArray:", objc_msgSend(v5, "nodes"));
        mSubpaths = self->mSubpaths;
        long long v9 = v5;
LABEL_14:
        [(NSMutableArray *)mSubpaths removeObjectIdenticalTo:v9];
        return;
      }
      if (!(HIBYTE(v12) | v12))
      {
        [v6 reverseDirection];
LABEL_12:
        objc_msgSend((id)objc_msgSend(v5, "nodes"), "addObjectsFromArray:", objc_msgSend(v7, "nodes"));
LABEL_13:
        mSubpaths = self->mSubpaths;
        long long v9 = v7;
        goto LABEL_14;
      }
      if (HIBYTE(v12) && (_BYTE)v12)
      {
        [v6 reverseDirection];
        uint64_t v10 = (void *)[v5 nodes];
        uint64_t v11 = [v7 nodes];
        objc_msgSend(v10, "insertObjects:atIndexes:", v11, objc_msgSend(MEMORY[0x263F088D0], "indexSetWithIndexesInRange:", 0, objc_msgSend((id)objc_msgSend(v7, "nodes"), "count")));
        goto LABEL_13;
      }
    }
  }
}

- (BOOL)canCloseSelectedNodes
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  mSubpaths = self->mSubpaths;
  uint64_t v3 = [(NSMutableArray *)mSubpaths countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v10;
    while (2)
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(mSubpaths);
        }
        uint64_t v7 = *(void **)(*((void *)&v9 + 1) + 8 * v6);
        if (([v7 isClosed] & 1) == 0
          && objc_msgSend((id)objc_msgSend(v7, "nodes"), "count")
          && ((objc_msgSend((id)objc_msgSend(v7, "firstNode"), "isSelected") & 1) != 0
           || (objc_msgSend((id)objc_msgSend(v7, "lastNode"), "isSelected") & 1) != 0))
        {
          LOBYTE(v3) = 1;
          return v3;
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t v3 = [(NSMutableArray *)mSubpaths countByEnumeratingWithState:&v9 objects:v13 count:16];
      uint64_t v4 = v3;
      if (v3) {
        continue;
      }
      break;
    }
  }
  return v3;
}

- (void)closeSelectedNodes
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  mSubpaths = self->mSubpaths;
  uint64_t v3 = [(NSMutableArray *)mSubpaths countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(mSubpaths);
        }
        uint64_t v7 = *(void **)(*((void *)&v8 + 1) + 8 * i);
        if (([v7 isClosed] & 1) == 0
          && objc_msgSend((id)objc_msgSend(v7, "nodes"), "count")
          && ((objc_msgSend((id)objc_msgSend(v7, "firstNode"), "isSelected") & 1) != 0
           || objc_msgSend((id)objc_msgSend(v7, "lastNode"), "isSelected")))
        {
          if (objc_msgSend((id)objc_msgSend(v7, "firstNode"), "type") == 3) {
            objc_msgSend((id)objc_msgSend(v7, "firstNode"), "setType:", 1);
          }
          [v7 setClosed:1];
        }
      }
      uint64_t v4 = [(NSMutableArray *)mSubpaths countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }
}

- (void)deleteSelectedEdges
{
  long long v24 = (void *)[(NSMutableArray *)self->mSubpaths copy];
  id v2 = (void *)[v24 objectEnumerator];
  uint64_t v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
  uint64_t v26 = v2;
  uint64_t v4 = [v2 nextObject];
  if (v4)
  {
    uint64_t v5 = (void *)v4;
    do
    {
      uint64_t v6 = objc_msgSend((id)objc_msgSend(v5, "nodes"), "mutableCopy");
      uint64_t v7 = [v6 count];
      if (objc_msgSend((id)objc_msgSend(v6, "lastObject"), "isSelected")) {
        [v5 setClosed:0];
      }
      if (v7 < 1) {
        goto LABEL_23;
      }
      char v8 = 0;
      long long v9 = 0;
      uint64_t v10 = 0;
      uint64_t v11 = 0;
      long long v12 = 0;
      do
      {
        uint64_t v13 = [v6 objectAtIndex:v11];
        if (v12 && [v12 isSelected])
        {
          if (v11 - v10 >= 2)
          {
            uint64_t v14 = objc_alloc_init(TSDBezierSubpath);
            -[TSDBezierSubpath setNodes:](v14, "setNodes:", objc_msgSend(v6, "objectsAtIndexes:", objc_msgSend(MEMORY[0x263F088D0], "indexSetWithIndexesInRange:", v10, v11 - v10)));
            [(NSMutableArray *)v3 addObject:v14];

            long long v15 = (void *)[(NSMutableArray *)[(TSDBezierSubpath *)v14 nodes] lastObject];
            [v15 nodePoint];
            objc_msgSend(v15, "setOutControlPoint:");
            if (v9 || ([v5 isClosed] & 1) == 0)
            {
              long long v16 = (void *)[(NSMutableArray *)[(TSDBezierSubpath *)v14 nodes] objectAtIndex:0];
              [v16 nodePoint];
              objc_msgSend(v16, "setInControlPoint:");
            }
            if (!v9) {
              long long v9 = v14;
            }
          }
          char v8 = 1;
          uint64_t v10 = v11;
        }
        ++v11;
        long long v12 = (void *)v13;
      }
      while (v7 != v11);
      if (v8)
      {
        uint64_t v17 = v7 - v10;
        if (v17 > 1 || (int v18 = [v5 isClosed], v17 == 1) && v18)
        {
          uint64_t v19 = objc_alloc_init(TSDBezierSubpath);
          -[TSDBezierSubpath setNodes:](v19, "setNodes:", objc_msgSend(v6, "objectsAtIndexes:", objc_msgSend(MEMORY[0x263F088D0], "indexSetWithIndexesInRange:", v10, v17)));
          [(NSMutableArray *)v3 addObject:v19];

          int v20 = [v5 isClosed];
          long long v21 = [(TSDBezierSubpath *)v19 nodes];
          if (v20)
          {
            [(NSMutableArray *)v21 addObjectsFromArray:[(TSDBezierSubpath *)v9 nodes]];
            [(NSMutableArray *)v3 removeObjectIdenticalTo:v9];
          }
          else
          {
            long long v22 = (void *)[(NSMutableArray *)v21 objectAtIndex:0];
            [v22 nodePoint];
            objc_msgSend(v22, "setInControlPoint:");
            long long v23 = (void *)[(NSMutableArray *)[(TSDBezierSubpath *)v19 nodes] lastObject];
            [v23 nodePoint];
            objc_msgSend(v23, "setOutControlPoint:");
          }
        }
      }
      else
      {
LABEL_23:
        [(NSMutableArray *)v3 addObject:v5];
      }

      uint64_t v5 = (void *)[v26 nextObject];
    }
    while (v5);
  }

  self->mSubpaths = v3;
}

- (id)splitEdge:(int64_t)a3 at:(double)a4 fromSubpath:(int64_t)a5
{
  v52[8] = *(double *)MEMORY[0x263EF8340];
  uint64_t v7 = objc_msgSend((id)-[NSMutableArray objectAtIndex:](self->mSubpaths, "objectAtIndex:", a5), "nodes");
  char v8 = v7;
  if (a3 <= 0)
  {
    long long v9 = (void *)[v7 lastObject];
    uint64_t v10 = (void *)[v8 objectAtIndex:0];
    a3 = [v8 count];
  }
  else
  {
    long long v9 = (void *)[v7 objectAtIndex:a3 - 1];
    uint64_t v10 = (void *)[v8 objectAtIndex:a3];
  }
  [v10 nodePoint];
  double v12 = v11;
  double v14 = v13;
  [v10 inControlPoint];
  if (TSDNearlyEqualPoints(v12, v14, v15, v16)
    && ([v9 nodePoint],
        double v18 = v17,
        double v20 = v19,
        [v9 outControlPoint],
        TSDNearlyEqualPoints(v18, v20, v21, v22)))
  {
    [v9 nodePoint];
    double v24 = v23;
    double v26 = v25;
    [v10 nodePoint];
    double v29 = +[TSDBezierNode bezierNodeWithPoint:](TSDBezierNode, "bezierNodeWithPoint:", (1.0 - a4) * v24 + a4 * v27, (1.0 - a4) * v26 + a4 * v28);
  }
  else
  {
    [v9 nodePoint];
    v40.f64[0] = v30;
    v40.f64[1] = v31;
    [v9 outControlPoint];
    uint64_t v41 = v32;
    uint64_t v42 = v33;
    [v10 inControlPoint];
    uint64_t v43 = v34;
    uint64_t v44 = v35;
    [v10 nodePoint];
    uint64_t v45 = v36;
    uint64_t v46 = v37;
    TSDCurveBetween(&v40, (uint64_t)v47, 0.0, a4);
    TSDCurveBetween(&v40, (uint64_t)v52, a4, 1.0);
    objc_msgSend(v9, "setOutControlPoint:", v48, v49);
    objc_msgSend(v10, "setInControlPoint:", v52[4], v52[5]);
    double v29 = +[TSDBezierNode bezierNodeWithPoint:inControlPoint:outControlPoint:](TSDBezierNode, "bezierNodeWithPoint:inControlPoint:outControlPoint:", v52[0], v52[1], v50, v51, v52[2], v52[3]);
  }
  double v38 = v29;
  [(TSDBezierNode *)v29 setSelected:1];
  [v8 insertObject:v38 atIndex:a3];
  return v38;
}

- (void)splitSelectedEdges
{
  uint64_t v3 = [(NSMutableArray *)self->mSubpaths count];
  if (v3 >= 1)
  {
    uint64_t v4 = v3;
    for (uint64_t i = 0; i != v4; ++i)
    {
      uint64_t v6 = objc_msgSend((id)-[NSMutableArray objectAtIndex:](self->mSubpaths, "objectAtIndex:", i), "nodes");
      uint64_t v7 = [v6 count];
      if (v7 >= 1)
      {
        uint64_t v8 = v7;
        long long v9 = 0;
        for (uint64_t j = 0; j < v8; ++j)
        {
          uint64_t v11 = [v6 objectAtIndex:j];
          if (v9)
          {
            if ([v9 isSelected])
            {
              [(TSDEditableBezierPathSource *)self splitEdge:j++ at:i fromSubpath:0.5];
              ++v8;
            }
          }
          long long v9 = (void *)v11;
        }
      }
    }
  }
}

- (void)splitSelectedNodes
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  mSubpaths = self->mSubpaths;
  uint64_t v3 = [(NSMutableArray *)mSubpaths countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v24 != v5) {
          objc_enumerationMutation(mSubpaths);
        }
        uint64_t v7 = (void *)[*(id *)(*((void *)&v23 + 1) + 8 * i) nodes];
        uint64_t v8 = [v7 count];
        if (v8)
        {
          unint64_t v9 = v8;
          for (unint64_t j = 0; j < v9; ++j)
          {
            uint64_t v11 = (void *)[v7 objectAtIndex:j];
            if ([v11 isSelected])
            {
              [v11 nodePoint];
              double v13 = v12;
              double v15 = v14;
              [v11 nodePoint];
              double v17 = v16;
              double v19 = v18;
              [v11 outControlPoint];
              double v22 = +[TSDBezierNode bezierNodeWithPoint:inControlPoint:outControlPoint:](TSDBezierNode, "bezierNodeWithPoint:inControlPoint:outControlPoint:", v13, v15, v17, v19, v20, v21);
              [(TSDBezierNode *)v22 setSelected:0];
              [v11 nodePoint];
              objc_msgSend(v11, "setOutControlPoint:");
              [v7 insertObject:v22 atIndex:++j];
              ++v9;
            }
          }
        }
      }
      uint64_t v4 = [(NSMutableArray *)mSubpaths countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v4);
  }
}

- (BOOL)canCutAtSelectedNodes
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  mSubpaths = self->mSubpaths;
  uint64_t v3 = [(NSMutableArray *)mSubpaths countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v15 != v5) {
          objc_enumerationMutation(mSubpaths);
        }
        uint64_t v7 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        uint64_t v8 = (void *)[v7 nodes];
        int v9 = [v7 isClosed];
        uint64_t v10 = [v8 count];
        if (v10)
        {
          unint64_t v11 = v9 ^ 1u;
          unint64_t v12 = v10 - ([v7 isClosed] ^ 1);
          if (v12 > v11)
          {
            while ((objc_msgSend((id)objc_msgSend(v8, "objectAtIndexedSubscript:", v11), "isSelected") & 1) == 0)
            {
              if (v12 == ++v11) {
                goto LABEL_10;
              }
            }
            LOBYTE(v3) = 1;
            return v3;
          }
        }
LABEL_10:
        ;
      }
      uint64_t v4 = [(NSMutableArray *)mSubpaths countByEnumeratingWithState:&v14 objects:v18 count:16];
      LOBYTE(v3) = 0;
      if (v4) {
        continue;
      }
      break;
    }
  }
  return v3;
}

- (void)cutAtSelectedNodes
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v3 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  double v20 = self;
  obunint64_t j = self->mSubpaths;
  uint64_t v4 = [(NSMutableArray *)obj countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v22 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v24 != v22) {
          objc_enumerationMutation(obj);
        }
        uint64_t v7 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        uint64_t v8 = (void *)[v7 nodes];
        if ([v8 count])
        {
          if ([v7 isClosed])
          {
            uint64_t v9 = [v8 count];
            while (v9)
            {
              uint64_t v10 = (void *)[v8 objectAtIndexedSubscript:--v9];
              if ([v10 isSelected])
              {
                [v10 setSelected:0];
                if (v9)
                {
                  id v11 = objc_alloc_init(MEMORY[0x263EFF980]);
                  objc_msgSend(v11, "addObjectsFromArray:", objc_msgSend(v8, "subarrayWithRange:", v9, objc_msgSend(v8, "count") - v9));
                  objc_msgSend(v11, "addObjectsFromArray:", objc_msgSend(v8, "subarrayWithRange:", 0, v9));
                  [v7 setNodes:v11];

                  uint64_t v8 = v11;
                }
                unint64_t v12 = (void *)[v10 copy];
                objc_msgSend((id)objc_msgSend(v7, "nodes"), "addObject:", v12);

                [v7 setClosed:0];
                break;
              }
            }
          }
          if (([v7 isClosed] & 1) == 0)
          {
            uint64_t v13 = [v8 count];
            uint64_t v14 = v13 - 1;
            if ((unint64_t)(v13 - 1) >= 2)
            {
              uint64_t v15 = 1 - v13;
              do
              {
                unint64_t v16 = v14 - 1;
                long long v17 = (void *)[v8 objectAtIndexedSubscript:v14 - 1];
                if ([v17 isSelected])
                {
                  [v17 setSelected:0];
                  double v18 = objc_alloc_init(TSDBezierSubpath);
                  uint64_t v19 = (void *)[v17 copy];
                  [(NSMutableArray *)[(TSDBezierSubpath *)v18 nodes] addObject:v19];

                  -[NSMutableArray addObjectsFromArray:](-[TSDBezierSubpath nodes](v18, "nodes"), "addObjectsFromArray:", objc_msgSend(v8, "subarrayWithRange:", v14, objc_msgSend(v8, "count") + v15));
                  objc_msgSend(v8, "removeObjectsInRange:", v14, objc_msgSend(v8, "count") + v15);
                  [v3 addObject:v18];
                }
                ++v15;
                --v14;
              }
              while (v16 > 1);
            }
          }
        }
      }
      uint64_t v5 = [(NSMutableArray *)obj countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v5);
  }
  [(NSMutableArray *)v20->mSubpaths addObjectsFromArray:v3];
}

- (CGPath)subpathForSelection
{
  id v3 = +[TSDBezierPath bezierPath];
  uint64_t v4 = (void *)[(NSMutableArray *)self->mSubpaths objectEnumerator];
  for (i = v4; ; uint64_t v4 = i)
  {
    uint64_t v6 = (void *)[v4 nextObject];
    if (!v6) {
      break;
    }
    [v6 appendToBezierPath:v3 selectedNodesOnly:1 fromIndex:0];
  }

  return (CGPath *)[v3 CGPath];
}

- (NSArray)nodeTypes
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v3 = (NSArray *)[MEMORY[0x263EFF980] array];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  obuint64_t j = self->mSubpaths;
  uint64_t v4 = [(NSMutableArray *)obj countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v21 != v6) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        long long v16 = 0u;
        long long v17 = 0u;
        long long v18 = 0u;
        long long v19 = 0u;
        uint64_t v9 = (void *)[v8 nodes];
        uint64_t v10 = [v9 countByEnumeratingWithState:&v16 objects:v24 count:16];
        if (v10)
        {
          uint64_t v11 = v10;
          uint64_t v12 = *(void *)v17;
          do
          {
            for (uint64_t j = 0; j != v11; ++j)
            {
              if (*(void *)v17 != v12) {
                objc_enumerationMutation(v9);
              }
              -[NSArray addObject:](v3, "addObject:", objc_msgSend(NSNumber, "numberWithChar:", (char)objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * j), "type")));
            }
            uint64_t v11 = [v9 countByEnumeratingWithState:&v16 objects:v24 count:16];
          }
          while (v11);
        }
      }
      uint64_t v5 = [(NSMutableArray *)obj countByEnumeratingWithState:&v20 objects:v25 count:16];
    }
    while (v5);
  }
  return v3;
}

- (void)setNodeTypes:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  obuint64_t j = self->mSubpaths;
  uint64_t v4 = [(NSMutableArray *)obj countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = 0;
    uint64_t v7 = *(void *)v21;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v21 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void **)(*((void *)&v20 + 1) + 8 * v8);
        long long v16 = 0u;
        long long v17 = 0u;
        long long v18 = 0u;
        long long v19 = 0u;
        uint64_t v10 = (void *)[v9 nodes];
        uint64_t v11 = [v10 countByEnumeratingWithState:&v16 objects:v24 count:16];
        if (v11)
        {
          uint64_t v12 = v11;
          uint64_t v13 = *(void *)v17;
          do
          {
            uint64_t v14 = 0;
            do
            {
              if (*(void *)v17 != v13) {
                objc_enumerationMutation(v10);
              }
              objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * v14), "setType:", objc_msgSend((id)objc_msgSend(a3, "objectAtIndex:", v6 + v14), "intValue"));
              ++v14;
            }
            while (v12 != v14);
            uint64_t v12 = [v10 countByEnumeratingWithState:&v16 objects:v24 count:16];
            v6 += v14;
          }
          while (v12);
        }
        ++v8;
      }
      while (v8 != v5);
      uint64_t v5 = [(NSMutableArray *)obj countByEnumeratingWithState:&v20 objects:v25 count:16];
    }
    while (v5);
  }
}

- (void)moveToPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  uint64_t v6 = (void *)[(NSMutableArray *)self->mSubpaths lastObject];
  if (objc_msgSend((id)objc_msgSend(v6, "nodes"), "count"))
  {
    if (objc_msgSend((id)objc_msgSend(v6, "nodes"), "count") == 1)
    {
      uint64_t v7 = objc_msgSend((id)objc_msgSend(v6, "nodes"), "lastObject");
      objc_msgSend(v7, "setNodePoint:", x, y);
    }
    else
    {
      uint64_t v9 = objc_alloc_init(TSDBezierSubpath);
      [(NSMutableArray *)self->mSubpaths addObject:v9];
    }
  }
  else
  {
    uint64_t v8 = +[TSDBezierNode bezierNodeWithPoint:](TSDBezierNode, "bezierNodeWithPoint:", x, y);
    [v6 addNode:v8];
  }
}

- (void)lineToPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  uint64_t v5 = (void *)[(NSMutableArray *)self->mSubpaths lastObject];
  if (!objc_msgSend((id)objc_msgSend(v5, "nodes"), "count"))
  {
    uint64_t v6 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v7 = [NSString stringWithUTF8String:"-[TSDEditableBezierPathSource lineToPoint:]"];
    objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDEditableBezierPathSource.m"), 2291, @"cannot add line to subpath without move first");
  }
  uint64_t v8 = +[TSDBezierNode bezierNodeWithPoint:](TSDBezierNode, "bezierNodeWithPoint:", x, y);

  [v5 addNode:v8];
}

- (void)curveToPoint:(CGPoint)a3 controlPoint1:(CGPoint)a4 controlPoint2:(CGPoint)a5
{
  double y = a5.y;
  double x = a5.x;
  double v7 = a4.y;
  double v8 = a4.x;
  double v9 = a3.y;
  double v10 = a3.x;
  uint64_t v11 = (void *)[(NSMutableArray *)self->mSubpaths lastObject];
  if (!objc_msgSend((id)objc_msgSend(v11, "nodes"), "count"))
  {
    uint64_t v12 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v13 = [NSString stringWithUTF8String:"-[TSDEditableBezierPathSource curveToPoint:controlPoint1:controlPoint2:]"];
    objc_msgSend(v12, "handleFailureInFunction:file:lineNumber:description:", v13, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDEditableBezierPathSource.m"), 2299, @"cannot add line to subpath without move first");
  }
  objc_msgSend((id)objc_msgSend((id)objc_msgSend(v11, "nodes"), "lastObject"), "setOutControlPoint:", v8, v7);
  uint64_t v14 = +[TSDBezierNode bezierNodeWithPoint:inControlPoint:outControlPoint:](TSDBezierNode, "bezierNodeWithPoint:inControlPoint:outControlPoint:", v10, v9, x, y, v10, v9);

  [v11 addNode:v14];
}

- (void)smoothCurveToPoint:(CGPoint)a3 controlPoint1:(CGPoint)a4 controlPoint2:(CGPoint)a5
{
  -[TSDEditableBezierPathSource curveToPoint:controlPoint1:controlPoint2:](self, "curveToPoint:controlPoint1:controlPoint2:", a3.x, a3.y, a4.x, a4.y, a5.x, a5.y);
  uint64_t v6 = objc_msgSend((id)objc_msgSend((id)-[NSMutableArray lastObject](self->mSubpaths, "lastObject"), "nodes"), "lastObject");

  [v6 setType:3];
}

- (void)closePath
{
  id v3 = (void *)[(NSMutableArray *)self->mSubpaths lastObject];
  if ((unint64_t)objc_msgSend((id)objc_msgSend(v3, "nodes"), "count") <= 1)
  {
    uint64_t v4 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v5 = [NSString stringWithUTF8String:"-[TSDEditableBezierPathSource closePath]"];
    objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDEditableBezierPathSource.m"), 2320, @"cannot close subpath without a line or curve segment");
  }
  [v3 setClosed:1];
  uint64_t v6 = objc_msgSend((id)objc_msgSend(v3, "nodes"), "objectAtIndex:", 0);
  double v7 = objc_msgSend((id)objc_msgSend(v3, "nodes"), "lastObject");
  [v6 nodePoint];
  double v9 = v8;
  double v11 = v10;
  [v7 nodePoint];
  if (TSDNearlyEqualPoints(v9, v11, v12, v13))
  {
    [v7 inControlPoint];
    objc_msgSend(v6, "setInControlPoint:");
    objc_msgSend((id)objc_msgSend(v3, "nodes"), "removeLastObject");
  }
  uint64_t v14 = objc_alloc_init(TSDBezierSubpath);
  [(NSMutableArray *)self->mSubpaths addObject:v14];
}

- (int64_t)mixingTypeWithObject:(id)a3
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __52__TSDEditableBezierPathSource_mixingTypeWithObject___block_invoke;
  v4[3] = &unk_2646B1B58;
  v4[4] = a3;
  return TSDMixingTypeWithObject((unint64_t)self, (unint64_t)a3, (uint64_t)v4);
}

uint64_t __52__TSDEditableBezierPathSource_mixingTypeWithObject___block_invoke()
{
  objc_opt_class();
  if (!TSUDynamicCast())
  {
    v0 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v1 = [NSString stringWithUTF8String:"-[TSDEditableBezierPathSource mixingTypeWithObject:]_block_invoke"];
    objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDEditableBezierPathSource.m"), 2344, @"nil object after cast");
  }
  return 1;
}

- (id)mixedObjectWithFraction:(double)a3 ofObject:(id)a4
{
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __64__TSDEditableBezierPathSource_mixedObjectWithFraction_ofObject___block_invoke;
  v5[3] = &unk_2646B26C0;
  v5[4] = self;
  return (id)TSDMixingMixedObjectWithFraction(self, a4, (uint64_t)v5);
}

uint64_t __64__TSDEditableBezierPathSource_mixedObjectWithFraction_ofObject___block_invoke(uint64_t a1)
{
  return *(void *)(a1 + 32);
}

- (NSMutableArray)subpaths
{
  return self->mSubpaths;
}

- (void)setSubpaths:(id)a3
{
}

@end
@interface CMDiagramShapeHierarchyMapper
- (CGRect)boundsForNode:(id)a3;
- (CGRect)mapLogicalBoundsWithXRanges:(const void *)a3;
- (CGSize)sizeForNode:(id)a3 atIndex:(unint64_t)a4;
- (CMDiagramShapeHierarchyMapper)initWithOddDiagram:(id)a3 drawingContext:(id)a4 orientedBounds:(id)a5 identifier:(id)a6 parent:(id)a7;
- (id)infoForNode:(id)a3;
- (void)copyInfoForNode:(id)a3 depth:(int)a4;
- (void)mapAt:(id)a3 withState:(id)a4;
- (void)mapLayerNodes:(id)a3 at:(id)a4 scale:(float)a5 offsetX:(float)a6 offsetY:(float)a7 withState:(id)a8;
- (void)mapNode:(id)a3 at:(id)a4 scale:(float)a5 offsetX:(float)a6 offsetY:(float)a7 withState:(id)a8;
- (void)mapRangesForNode:(id)a3;
- (void)setAbsolutePositionOfNode:(id)a3 parentRow:(int)a4 parentXOffset:(float)a5 index:(unint64_t)a6;
- (void)setUpLayers;
@end

@implementation CMDiagramShapeHierarchyMapper

- (CMDiagramShapeHierarchyMapper)initWithOddDiagram:(id)a3 drawingContext:(id)a4 orientedBounds:(id)a5 identifier:(id)a6 parent:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v22.receiver = self;
  v22.super_class = (Class)CMDiagramShapeHierarchyMapper;
  v17 = [(CMDiagramShapeMapper *)&v22 initWithOddDiagram:v12 drawingContext:v13 orientedBounds:v14 identifier:v15 parent:v16];
  if (v17)
  {
    v18 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    mNodeInfoMap = v17->mNodeInfoMap;
    v17->mNodeInfoMap = v18;

    v17->super.mMaxMappableTreeDepth = 500;
    v17->super.mDefaultScale = 1.0;
    v17->mIsLayered = 0;
    [(CMDiagramShapeHierarchyMapper *)v17 setUpLayers];
    v20 = v17;
  }

  return v17;
}

- (void)setUpLayers
{
  if ([(NSString *)self->super.mIdentifier isEqualToString:@"hierarchy5"]
    || [(NSString *)self->super.mIdentifier isEqualToString:@"hierarchy6"])
  {
    self->mIsLayered = 1;
  }
}

- (void)mapAt:(id)a3 withState:(id)a4
{
  id v46 = a3;
  id v6 = a4;
  v7 = [(ODDDiagram *)self->super.super.mDiagram documentPoint];
  [(CMDiagramShapeHierarchyMapper *)self copyInfoForNode:v7 depth:0xFFFFFFFFLL];
  v8 = [(CMDiagramShapeHierarchyMapper *)self mapRangesForNode:v7];
  v9 = v8;
  v11 = (char *)*v8;
  v10 = (unsigned char *)v8[1];
  id v12 = (unsigned char *)(*v8 + 8);
  int64_t v13 = v10 - v12;
  if (v10 != v12) {
    memmove((void *)*v8, v12, v10 - v12);
  }
  v9[1] = &v11[v13];
  [(CMDiagramShapeHierarchyMapper *)self mapLogicalBoundsWithXRanges:v9];
  double v16 = v14;
  double v18 = v17;
  CGFloat v20 = v19;
  if (self->mIsLayered) {
    double v21 = v15 + 1.0;
  }
  else {
    double v21 = v15;
  }
  objc_super v22 = +[CMShapeUtils inscribedBoundsWithBounds:self->super.super.super.mOrientedBounds logicalBounds:v14];
  v23 = +[CMShapeUtils relatvieBoundsWithAbsoluteInnerBounds:v22 parentBounds:self->super.super.super.mOrientedBounds];
  mDiagramShapeBounds = self->super.mDiagramShapeBounds;
  self->super.mDiagramShapeBounds = v23;

  [v22 bounds];
  double Width = CGRectGetWidth(v48);
  v49.origin.x = v16;
  v49.origin.y = v18;
  v49.size.width = v21;
  v49.size.height = v20;
  float v26 = Width / CGRectGetWidth(v49);
  self->super.mDefaultScale = v26;
  [(CMDiagramShapeHierarchyMapper *)self setAbsolutePositionOfNode:v7 parentRow:4294967294 parentXOffset:0 index:0.0];
  [(CMDiagramShapeMapper *)self setDefaultFonSize];
  float v27 = v16;
  float v28 = -v27;
  float v29 = 1.0 - v27;
  if (self->mIsLayered) {
    float v30 = v29;
  }
  else {
    float v30 = v28;
  }
  v31 = [MEMORY[0x263F08680] transform];
  [(OADOrientedBounds *)self->super.super.super.mOrientedBounds bounds];
  double v33 = v32;
  [(OADOrientedBounds *)self->super.super.super.mOrientedBounds bounds];
  objc_msgSend(v31, "translateXBy:yBy:", v33);
  [(CMDrawingContext *)self->super.super.mDrawingContext addTransform:v31];
  if (self->mIsLayered)
  {
    [(OADOrientedBounds *)self->super.mDiagramShapeBounds bounds];
    double v34 = CGRectGetWidth(v50);
    [(OADOrientedBounds *)self->super.mDiagramShapeBounds bounds];
    float v35 = v34;
    double v37 = v36 + v18 * v26;
    *(float *)&double v38 = v37;
    *(float *)&double v37 = v26;
    *(float *)&double v36 = v35;
    [(CMDiagramShapeHierarchyMapper *)self mapLayerNodes:v7 at:v46 scale:v6 offsetX:v37 offsetY:v36 withState:v38];
  }
  [(OADOrientedBounds *)self->super.mDiagramShapeBounds bounds];
  double v40 = v39;
  [(OADOrientedBounds *)self->super.mDiagramShapeBounds bounds];
  float v41 = v18 + 0.200000003;
  double v42 = v40 + (float)(v30 * v26);
  float v43 = v42;
  double v45 = v44 + (float)(v41 * v26);
  *(float *)&double v42 = v45;
  *(float *)&double v45 = v26;
  *(float *)&double v44 = v43;
  [(CMDiagramShapeHierarchyMapper *)self mapNode:v7 at:v46 scale:v6 offsetX:v45 offsetY:v44 withState:v42];
  [(CMDiagramShapeHierarchyMapper *)self mapChildrenAt:v46 withState:v6];
  [(CMDrawingContext *)self->super.super.mDrawingContext restoreLastTransform];
}

- (void)copyInfoForNode:(id)a3 depth:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v16 = a3;
  id v6 = objc_alloc_init(CMDiagramNodeInfo);
  mNodeInfoMap = self->mNodeInfoMap;
  v8 = [MEMORY[0x263F08D40] valueWithNonretainedObject:v16];
  [(NSMutableDictionary *)mNodeInfoMap setObject:v6 forKey:v8];

  [(CMDiagramNodeInfo *)v6 setTreeDepth:v4];
  v9 = [v16 children];
  unint64_t v10 = [v9 count];
  if (v10)
  {
    uint64_t v11 = 0;
    uint64_t v12 = (v4 + 1);
    unsigned int v13 = 1;
    do
    {
      double v14 = [v9 objectAtIndex:v11];
      [(CMDiagramShapeHierarchyMapper *)self copyInfoForNode:v14 depth:v12];

      uint64_t v11 = v13;
    }
    while (v10 > v13++);
  }
}

- (void)mapRangesForNode:(id)a3
{
  id v4 = a3;
  v5 = [(CMDiagramShapeHierarchyMapper *)self infoForNode:v4];
  uint64_t v6 = [v5 xRanges];
  if (((*(void *)(v6 + 8) - *(void *)v6) & 0x7FFFFFFF8) != 0) {
    goto LABEL_104;
  }
  v7 = [v4 children];
  v112 = v7;
  unint64_t v8 = [v7 count];
  if (!v8) {
    goto LABEL_103;
  }
  v111 = v5;
  uint64_t v10 = 0;
  unsigned int v11 = 1;
  float v12 = 0.0;
  char v13 = 1;
  do
  {
    double v14 = [v112 objectAtIndex:v10];
    if (![v14 type])
    {
      if (v13)
      {
        ODIHRangeVector::boundingRange((float **)[(CMDiagramShapeHierarchyMapper *)self mapRangesForNode:v14]);
        if (v12 <= v15) {
          float v12 = v15;
        }
      }
      v13 ^= 1u;
    }

    uint64_t v10 = v11;
    BOOL v16 = v8 > v11++;
  }
  while (v16);
  id v110 = v4;
  uint64_t v17 = 0;
  LODWORD(v4) = 0;
  unsigned int v18 = 0;
  double v19 = (void *)(v6 + 16);
  float v20 = -v12;
  double v21 = v112;
  unint64_t v113 = v8;
  do
  {
    objc_super v22 = [v21 objectAtIndex:v17];
    v23 = [(CMDiagramShapeHierarchyMapper *)self infoForNode:v22];
    if ([v22 type]) {
      goto LABEL_67;
    }
    [v23 setExtraRowsBetweenParentAndSelf:((*(void *)(v6 + 8) - *(void *)v6) >> 3) - v4];
    [v23 setConnectToVerticalSide:1];
    v24 = [(CMDiagramShapeHierarchyMapper *)self mapRangesForNode:v22];
    *(float *)&double v25 = ODIHRangeVector::boundingRange((float **)v24);
    float v27 = *(float *)&v25 + (float)(v26 * -0.5);
    if (v4)
    {
      *(float *)&double v25 = -v27;
      [v23 addToXOffsetRelativeToParent:v25];
      uint64_t v28 = *v24;
      unint64_t v29 = v24[1] - *v24;
      if ((v29 & 0x7FFFFFFF8) != 0)
      {
        uint64_t v30 = (v29 >> 3);
        v31 = (float *)*v24;
        do
        {
          float *v31 = *v31 - v27;
          v31 += 2;
          --v30;
        }
        while (v30);
      }
      unint64_t v32 = v29 >> 3;
      if (v4 >= v32) {
        uint64_t v33 = v32;
      }
      else {
        uint64_t v33 = v4;
      }
      if (v33)
      {
        double v34 = *(float **)v6;
        int v35 = ((*(void *)(v6 + 8) - *(void *)v6) >> 3) - v4;
        double v36 = (float *)(v28 + 4);
        do
        {
          float v37 = *(v36 - 1) + (float)(*v36 * 0.5);
          double v38 = &v34[2 * v35];
          float v39 = *v38 - (float)(v38[1] * 0.5);
          *double v38 = (float)(v37 + v39) * 0.5;
          v38[1] = v37 - v39;
          ++v35;
          v36 += 2;
          --v33;
        }
        while (v33);
      }
      if (v4 >= v32)
      {
LABEL_66:
        LODWORD(v4) = 0;
        goto LABEL_67;
      }
      unint64_t v40 = v4;
      float v41 = *(float **)(v6 + 8);
      do
      {
        float v42 = *(float *)(v28 + 8 * v40) + (float)(*(float *)(v28 + 8 * v40 + 4) * 0.5);
        float v43 = (float)(v42 + 0.0) * 0.5;
        if ((unint64_t)v41 >= *v19)
        {
          double v44 = *(float **)v6;
          unint64_t v45 = (unint64_t)v41 - *(void *)v6;
          uint64_t v46 = (*v19 - *(void *)v6) >> 3;
          if (2 * (int)v46 <= (v45 >> 3) + 1) {
            unsigned int v47 = (v45 >> 3) + 1;
          }
          else {
            unsigned int v47 = 2 * v46;
          }
          if (v46 >= 0x7FFFFFFF) {
            unint64_t v48 = 0xFFFFFFFFLL;
          }
          else {
            unint64_t v48 = v47;
          }
          if (v48)
          {
            CGRect v49 = (char *)std::__allocate_at_least[abi:ne180100]<ChAllocator<EshComputedValue>>(v6 + 16, v48);
            uint64_t v51 = v50;
            double v44 = *(float **)v6;
            float v41 = *(float **)(v6 + 8);
          }
          else
          {
            CGRect v49 = 0;
            uint64_t v51 = 0;
          }
          v52 = (float *)&v49[v45 & 0x7FFFFFFF8];
          float *v52 = v43;
          v52[1] = v42;
          v53 = v52;
          if (v41 == v44)
          {
            unint64_t v8 = v113;
          }
          else
          {
            unint64_t v8 = v113;
            do
            {
              uint64_t v54 = *((void *)v41 - 1);
              v41 -= 2;
              *((void *)v53 - 1) = v54;
              v53 -= 2;
            }
            while (v41 != v44);
            double v44 = *(float **)v6;
          }
          float v41 = v52 + 2;
          *(void *)uint64_t v6 = v53;
          *(void *)(v6 + 8) = v52 + 2;
          *(void *)(v6 + 16) = &v49[8 * v51];
          if (v44) {
            operator delete(v44);
          }
        }
        else
        {
          *float v41 = v43;
          v41[1] = v42;
          v41 += 2;
        }
        *(void *)(v6 + 8) = v41;
        ++v40;
        uint64_t v28 = *v24;
      }
      while (v40 < ((unint64_t)(v24[1] - *v24) >> 3));
      LODWORD(v4) = 0;
      double v21 = v112;
    }
    else
    {
      float v55 = v20 - v27;
      *(float *)&double v25 = v55;
      [v23 addToXOffsetRelativeToParent:v25];
      uint64_t v56 = *v24;
      unint64_t v57 = v24[1] - *v24;
      if ((v57 & 0x7FFFFFFF8) == 0) {
        goto LABEL_66;
      }
      uint64_t v58 = (v57 >> 3);
      v59 = (float *)*v24;
      do
      {
        float *v59 = v55 + *v59;
        v59 += 2;
        --v58;
      }
      while (v58);
      unint64_t v60 = 0;
      v61 = *(float **)(v6 + 8);
      do
      {
        float v62 = *(float *)(v56 + 8 * v60) - (float)(*(float *)(v56 + 8 * v60 + 4) * 0.5);
        float v63 = (float)(v62 + 0.0) * 0.5;
        float v64 = 0.0 - v62;
        if ((unint64_t)v61 >= *v19)
        {
          v65 = *(float **)v6;
          unint64_t v66 = (unint64_t)v61 - *(void *)v6;
          uint64_t v67 = (*v19 - *(void *)v6) >> 3;
          if (2 * (int)v67 <= (v66 >> 3) + 1) {
            unsigned int v68 = (v66 >> 3) + 1;
          }
          else {
            unsigned int v68 = 2 * v67;
          }
          if (v67 >= 0x7FFFFFFF) {
            unint64_t v69 = 0xFFFFFFFFLL;
          }
          else {
            unint64_t v69 = v68;
          }
          if (v69)
          {
            v70 = (char *)std::__allocate_at_least[abi:ne180100]<ChAllocator<EshComputedValue>>(v6 + 16, v69);
            uint64_t v72 = v71;
            v65 = *(float **)v6;
            v61 = *(float **)(v6 + 8);
          }
          else
          {
            v70 = 0;
            uint64_t v72 = 0;
          }
          v73 = (float *)&v70[v66 & 0x7FFFFFFF8];
          float *v73 = v63;
          v73[1] = v64;
          v74 = v73;
          if (v61 != v65)
          {
            do
            {
              uint64_t v75 = *((void *)v61 - 1);
              v61 -= 2;
              *((void *)v74 - 1) = v75;
              v74 -= 2;
            }
            while (v61 != v65);
            v65 = *(float **)v6;
          }
          v61 = v73 + 2;
          *(void *)uint64_t v6 = v74;
          *(void *)(v6 + 8) = v73 + 2;
          *(void *)(v6 + 16) = &v70[8 * v72];
          if (v65) {
            operator delete(v65);
          }
        }
        else
        {
          float *v61 = v63;
          v61[1] = v64;
          v61 += 2;
        }
        *(void *)(v6 + 8) = v61;
        ++v60;
        uint64_t v56 = *v24;
        id v4 = (id)((unint64_t)(v24[1] - *v24) >> 3);
      }
      while (v60 < v4);
      double v21 = v112;
      unint64_t v8 = v113;
    }
LABEL_67:

    uint64_t v17 = ++v18;
  }
  while (v8 > v18);
  uint64_t v76 = 0;
  unsigned int v77 = 0;
  uint64_t v114 = 0;
  v115 = 0;
  uint64_t v116 = 0;
  do
  {
    v78 = [v21 objectAtIndex:v76];
    v79 = [(CMDiagramShapeHierarchyMapper *)self infoForNode:v78];
    if ([v78 type] == 2)
    {
      [v79 setExtraRowsBetweenParentAndSelf:(*(void *)(v6 + 8) - *(void *)v6) >> 3];
      v80 = [(CMDiagramShapeHierarchyMapper *)self mapRangesForNode:v78];
      double v81 = ODIHRangeVector::minDistanceTo(&v114, v80);
      float v82 = *(float *)&v81;
      v83 = (float *)*v80;
      unint64_t v84 = v80[1] - *v80;
      if ((v84 & 0x7FFFFFFF8) != 0)
      {
        uint64_t v85 = (v84 >> 3);
        do
        {
          float *v83 = *v83 - *(float *)&v81;
          v83 += 2;
          --v85;
        }
        while (v85);
      }
      ODIHRangeVector::operator+=(&v114, v80);
      *(float *)&double v86 = -v82;
      [v79 addToXOffsetRelativeToParent:v86];
    }

    uint64_t v76 = ++v77;
  }
  while (v8 > v77);
  v87 = (float *)v114;
  if ((((unint64_t)v115 - v114) & 0x7FFFFFFF8) != 0)
  {
    float v88 = *(float *)v114;
    uint64_t v89 = (((unint64_t)v115 - v114) >> 3);
    do
    {
      float *v87 = *v87 - v88;
      v87 += 2;
      --v89;
    }
    while (v89);
    uint64_t v90 = 0;
    float v91 = -v88;
    unsigned int v92 = 1;
    do
    {
      v93 = [v21 objectAtIndex:v90];
      v94 = [(CMDiagramShapeHierarchyMapper *)self infoForNode:v93];
      if ([v93 type] == 2)
      {
        *(float *)&double v95 = v91;
        [v94 addToXOffsetRelativeToParent:v95];
      }

      uint64_t v90 = v92;
      BOOL v16 = v8 > v92++;
    }
    while (v16);
    v87 = (float *)v114;
    if ((((unint64_t)v115 - v114) & 0x7FFFFFFF8) != 0)
    {
      unint64_t v96 = 0;
      v97 = *(void **)(v6 + 8);
      do
      {
        if ((unint64_t)v97 >= *v19)
        {
          unint64_t v98 = (unint64_t)v97 - *(void *)v6;
          uint64_t v99 = (*v19 - *(void *)v6) >> 3;
          unsigned int v100 = 2 * v99;
          if (2 * (int)v99 <= (v98 >> 3) + 1) {
            unsigned int v100 = (v98 >> 3) + 1;
          }
          if (v99 >= 0x7FFFFFFF) {
            unint64_t v101 = 0xFFFFFFFFLL;
          }
          else {
            unint64_t v101 = v100;
          }
          if (v101)
          {
            v102 = (char *)std::__allocate_at_least[abi:ne180100]<ChAllocator<EshComputedValue>>(v6 + 16, v101);
            uint64_t v104 = v103;
          }
          else
          {
            v102 = 0;
            uint64_t v104 = 0;
          }
          v105 = &v102[v98 & 0x7FFFFFFF8];
          *(void *)v105 = *(void *)&v87[2 * v96];
          v97 = v105 + 8;
          v107 = *(float **)v6;
          v106 = *(char **)(v6 + 8);
          if (v106 != *(char **)v6)
          {
            do
            {
              uint64_t v108 = *((void *)v106 - 1);
              v106 -= 8;
              *((void *)v105 - 1) = v108;
              v105 -= 8;
            }
            while (v106 != (char *)v107);
            v106 = *(char **)v6;
          }
          *(void *)uint64_t v6 = v105;
          *(void *)(v6 + 8) = v97;
          *(void *)(v6 + 16) = &v102[8 * v104];
          if (v106) {
            operator delete(v106);
          }
        }
        else
        {
          *v97++ = *(void *)&v87[2 * v96];
        }
        *(void *)(v6 + 8) = v97;
        ++v96;
        v87 = (float *)v114;
      }
      while (v96 < (((unint64_t)v115 - v114) >> 3));
    }
  }
  if (v87)
  {
    v115 = v87;
    operator delete(v87);
  }
  id v4 = v110;
  v5 = v111;
  v7 = v112;
LABEL_103:
  uint64_t v114 = 0x3F80000000000000;
  LODWORD(v9) = 1.0;
  objc_msgSend(v5, "setXRange:", 0.0, v9);
  std::vector<ODIHRange,ChAllocator<ODIHRange>>::insert(v6, *(char **)v6, &v114);

LABEL_104:
  return (void *)v6;
}

- (id)infoForNode:(id)a3
{
  mNodeInfoMap = self->mNodeInfoMap;
  id v4 = [MEMORY[0x263F08D40] valueWithNonretainedObject:a3];
  v5 = [(NSMutableDictionary *)mNodeInfoMap objectForKey:v4];

  return v5;
}

- (CGRect)mapLogicalBoundsWithXRanges:(const void *)a3
{
  float v4 = ODIHRangeVector::boundingRange((float **)a3);
  double v6 = (float)(v4 + (float)(v5 * -0.5));
  double v7 = v5;
  double v8 = (float)((float)((float)((*((void *)a3 + 1) - *(void *)a3) >> 3) * 0.6) + -0.2);
  double v9 = 0.0;
  result.size.height = v8;
  result.size.width = v7;
  result.origin.y = v9;
  result.origin.x = v6;
  return result;
}

- (void)setAbsolutePositionOfNode:(id)a3 parentRow:(int)a4 parentXOffset:(float)a5 index:(unint64_t)a6
{
  id v24 = a3;
  double v9 = -[CMDiagramShapeHierarchyMapper infoForNode:](self, "infoForNode:");
  [v9 xRange];
  float v11 = v10;
  int v13 = v12;
  uint64_t v14 = a4 + [v9 extraRowsBetweenParentAndSelf] + 1;
  [v9 setRow:v14];
  [v9 xOffsetRelativeToParent];
  float v16 = v15 + a5;
  *(float *)&double v17 = v11 + v16;
  LODWORD(v18) = v13;
  objc_msgSend(v9, "setXRange:", v17, v18);
  double v19 = [v24 children];
  uint64_t v20 = [v19 count];
  if (v20)
  {
    for (uint64_t i = 0; i != v20; ++i)
    {
      objc_super v22 = [v19 objectAtIndex:i];
      *(float *)&double v23 = v16;
      [(CMDiagramShapeHierarchyMapper *)self setAbsolutePositionOfNode:v22 parentRow:v14 parentXOffset:i index:v23];
    }
  }
}

- (CGSize)sizeForNode:(id)a3 atIndex:(unint64_t)a4
{
  id v5 = a3;
  [(CMDiagramShapeHierarchyMapper *)self boundsForNode:v5];
  CGFloat x = v16.origin.x;
  CGFloat y = v16.origin.y;
  CGFloat width = v16.size.width;
  CGFloat height = v16.size.height;
  double v10 = CGRectGetWidth(v16);
  float mDefaultScale = self->super.mDefaultScale;
  v17.origin.CGFloat x = x;
  v17.origin.CGFloat y = y;
  v17.size.CGFloat width = width;
  v17.size.CGFloat height = height;
  CGFloat v12 = CGRectGetHeight(v17) * mDefaultScale;

  double v13 = v10 * mDefaultScale;
  double v14 = v12;
  result.CGFloat height = v14;
  result.CGFloat width = v13;
  return result;
}

- (CGRect)boundsForNode:(id)a3
{
  v3 = [(CMDiagramShapeHierarchyMapper *)self infoForNode:a3];
  int v4 = [v3 row];
  [v3 xRange];
  double v6 = TSURectWithCenterAndSize(v5, (float)((float)v4 * 0.6), 0.800000012);
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;

  double v13 = v6;
  double v14 = v8;
  double v15 = v10;
  double v16 = v12;
  result.size.CGFloat height = v16;
  result.size.CGFloat width = v15;
  result.origin.CGFloat y = v14;
  result.origin.CGFloat x = v13;
  return result;
}

- (void)mapNode:(id)a3 at:(id)a4 scale:(float)a5 offsetX:(float)a6 offsetY:(float)a7 withState:(id)a8
{
  id v78 = a3;
  id v14 = a4;
  id v15 = a8;
  double v16 = [(CMDiagramShapeHierarchyMapper *)self infoForNode:v78];
  int v17 = [v16 treeDepth];

  if (v17 <= self->super.mMaxMappableTreeDepth)
  {
    if ((v17 & 0x80000000) == 0)
    {
      [(CMDiagramShapeHierarchyMapper *)self boundsForNode:v78];
      +[CMShapeUtils transformRect:scale:offsetX:offsetY:](CMShapeUtils, "transformRect:scale:offsetX:offsetY:");
      v77.origin.CGFloat x = v18;
      v77.origin.CGFloat y = v19;
      v77.size.CGFloat width = v20;
      v77.size.CGFloat height = v21;
      uint64_t v76 = -[OADOrientedBounds initWithBounds:]([OADOrientedBounds alloc], "initWithBounds:", v18, v19, v20, v21);
      uint64_t v75 = [(CMDiagramPointMapper *)[CMDiagramPointRoundedRectMapper alloc] initWithPoint:v78 drawingContext:self->super.super.mDrawingContext orientedBounds:v76 parent:self];
      [(CMDiagramPointRoundedRectMapper *)v75 mapAt:v14 withState:v15];
      if (v17)
      {
        objc_super v22 = [v78 parent];
        [(CMDiagramShapeHierarchyMapper *)self boundsForNode:v22];
        +[CMShapeUtils transformRect:scale:offsetX:offsetY:](CMShapeUtils, "transformRect:scale:offsetX:offsetY:");
        CGFloat v24 = v23;
        CGFloat v26 = v25;
        CGFloat v28 = v27;
        CGFloat v30 = v29;

        v31 = objc_alloc_init(OADPath);
        unint64_t v32 = [(CMDiagramShapeHierarchyMapper *)self infoForNode:v78];
        int v33 = [v32 connectToVerticalSide];

        if (v33)
        {
          v80.origin.CGFloat x = v24;
          v80.origin.CGFloat y = v26;
          v80.size.CGFloat width = v28;
          v80.size.CGFloat height = v30;
          double MidX = CGRectGetMidX(v80);
          if (MidX <= CGRectGetMinX(v77)
            || (v81.origin.CGFloat x = v24,
                v81.origin.CGFloat y = v26,
                v81.size.CGFloat width = v28,
                v81.size.CGFloat height = v30,
                double v35 = CGRectGetMidX(v81),
                v35 >= CGRectGetMaxX(v77)))
          {
            v85.origin.CGFloat x = v24;
            v85.origin.CGFloat y = v26;
            v85.size.CGFloat width = v28;
            v85.size.CGFloat height = v30;
            double v38 = CGRectGetMidX(v85);
            v86.origin.CGFloat x = v24;
            v86.origin.CGFloat y = v26;
            v86.size.CGFloat width = v28;
            v86.size.CGFloat height = v30;
            double MaxY = CGRectGetMaxY(v86);
            v87.origin.CGFloat x = v24;
            v87.origin.CGFloat y = v26;
            v87.size.CGFloat width = v28;
            v87.size.CGFloat height = v30;
            double v48 = CGRectGetMidX(v87);
            if (v48 >= CGRectGetMidX(v77)) {
              double MaxX = CGRectGetMaxX(v77);
            }
            else {
              double MaxX = CGRectGetMinX(v77);
            }
            double v36 = MaxX;
            double MidY = CGRectGetMidY(v77);
          }
          else
          {
            double MinX = CGRectGetMinX(v77);
            v82.origin.CGFloat x = v24;
            v82.origin.CGFloat y = v26;
            v82.size.CGFloat width = v28;
            v82.size.CGFloat height = v30;
            double MaxY = CGRectGetMaxY(v82);
            double v36 = CGRectGetMinX(v77);
            double MidY = CGRectGetMidY(v77);
            double v38 = MinX + -0.129999995;
          }
          unsigned int v50 = -[OADToPointPathElement initWithToPoint:]([OADMoveToPathElement alloc], "initWithToPoint:", (unint64_t)(int)v38 << 32, (unint64_t)(int)MaxY << 32);
          [(OADPath *)v31 addElement:v50];
          uint64_t v51 = -[OADToPointPathElement initWithToPoint:]([OADLineToPathElement alloc], "initWithToPoint:", (unint64_t)(int)v38 << 32, (unint64_t)(int)MidY << 32);

          [(OADPath *)v31 addElement:v51];
          unsigned int v47 = -[OADToPointPathElement initWithToPoint:]([OADLineToPathElement alloc], "initWithToPoint:", (unint64_t)(int)v36 << 32, (unint64_t)(int)MidY << 32);

          [(OADPath *)v31 addElement:v47];
        }
        else
        {
          v83.origin.CGFloat x = v24;
          v83.origin.CGFloat y = v26;
          v83.size.CGFloat width = v28;
          v83.size.CGFloat height = v30;
          double v74 = CGRectGetMidX(v83);
          v84.origin.CGFloat x = v24;
          v84.origin.CGFloat y = v26;
          v84.size.CGFloat width = v28;
          v84.size.CGFloat height = v30;
          double v39 = CGRectGetMaxY(v84);
          double MinX = CGRectGetMidX(v77);
          double MinY = CGRectGetMinY(v77);
          float v41 = -[OADToPointPathElement initWithToPoint:]([OADMoveToPathElement alloc], "initWithToPoint:", (unint64_t)(int)v74 << 32, (unint64_t)(int)v39 << 32);
          [(OADPath *)v31 addElement:v41];
          float v42 = [OADLineToPathElement alloc];
          float v43 = MinY + -10.0;
          unint64_t v44 = (unint64_t)(int)v43 << 32;
          unint64_t v45 = -[OADToPointPathElement initWithToPoint:](v42, "initWithToPoint:", (unint64_t)(int)v74 << 32, v44);

          [(OADPath *)v31 addElement:v45];
          uint64_t v46 = -[OADToPointPathElement initWithToPoint:]([OADLineToPathElement alloc], "initWithToPoint:", (unint64_t)(int)MinX << 32, v44);

          [(OADPath *)v31 addElement:v46];
          unsigned int v47 = -[OADToPointPathElement initWithToPoint:]([OADLineToPathElement alloc], "initWithToPoint:", (unint64_t)(int)MinX << 32, (unint64_t)(int)MinY << 32);

          [(OADPath *)v31 addElement:v47];
        }

        v52 = [CMDiagramPointMapper alloc];
        v53 = [v78 parentTransition];
        uint64_t v54 = [(CMDiagramPointMapper *)v52 initWithPoint:v53 drawingContext:self->super.super.mDrawingContext orientedBounds:v76 parent:self];

        [(CMDiagramPointMapper *)v54 applyDiagramStyleToShapeProperties];
        float v55 = [(CMDiagramPointMapper *)v54 stroke];
        uint64_t v56 = [(CMDiagramPointMapper *)v75 fill];
        if (v55
          && ([(OADStroke *)v55 fill],
              unint64_t v57 = objc_claimAutoreleasedReturnValue(),
              objc_opt_class(),
              char isKindOfClass = objc_opt_isKindOfClass(),
              v57,
              (isKindOfClass & 1) == 0))
        {
          v59 = v55;
        }
        else
        {
          v59 = objc_alloc_init(OADStroke);

          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            [(OADStroke *)v59 setFill:v56];
          }
          else
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v61 = [v56 stops];
              float v62 = [v61 objectAtIndexedSubscript:0];

              float v63 = objc_alloc_init(OADSolidFill);
              float v64 = [v62 color];
              [(OADSolidFill *)v63 setColor:v64];

              [(OADStroke *)v59 setFill:v63];
              uint64_t v56 = v63;
            }
          }
          LODWORD(v60) = 1.0;
          -[OADStroke setWidth:](v59, "setWidth:", v60, *(void *)&MinX);
        }
        +[CMShapeRenderer renderDiagramPath:fill:stroke:state:drawingContext:](CMShapeRenderer, "renderDiagramPath:fill:stroke:state:drawingContext:", v31, 0, v59, v15, self->super.super.mDrawingContext, *(void *)&MinX);
      }
    }
    v65 = [v78 children];
    uint64_t v66 = [v65 count];
    if (v66)
    {
      for (uint64_t i = 0; i != v66; ++i)
      {
        unsigned int v68 = [v65 objectAtIndex:i];
        *(float *)&double v69 = a5;
        *(float *)&double v70 = a6;
        *(float *)&double v71 = a7;
        [(CMDiagramShapeHierarchyMapper *)self mapNode:v68 at:v14 scale:v15 offsetX:v69 offsetY:v70 withState:v71];
      }
    }
  }
}

- (void)mapLayerNodes:(id)a3 at:(id)a4 scale:(float)a5 offsetX:(float)a6 offsetY:(float)a7 withState:(id)a8
{
  id v25 = a4;
  id v14 = a8;
  id v15 = [a3 children];
  unint64_t v16 = [v15 count];
  if (v16 >= 2)
  {
    double v17 = a6;
    unsigned int v18 = 2;
    uint64_t v19 = 1;
    do
    {
      double v20 = [v15 objectAtIndex:v19];
      double v21 = [(CMDiagramShapeHierarchyMapper *)self infoForNode:v20];
      objc_super v22 = -[OADOrientedBounds initWithBounds:]([OADOrientedBounds alloc], "initWithBounds:", 0.0, (float)(a7 + (float)((float)((float)(int)[v21 row] * 0.6) * a5)), v17, (float)(a5 * 0.4));
      double v23 = [(CMDiagramPointMapper *)[CMDiagramPointRoundedRectMapper alloc] initWithPoint:v20 drawingContext:self->super.super.mDrawingContext orientedBounds:v22 parent:self];
      [(CMDiagramPointRoundedRectMapper *)v23 mapAt:v25 withState:v14];

      uint64_t v19 = v18;
    }
    while (v16 > v18++);
  }
}

- (void).cxx_destruct
{
}

@end
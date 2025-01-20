@interface ODIHierarchy
+ (BOOL)mapIdentifier:(id)a3 state:(id)a4;
- (CGRect)boundsOfNode:(id)a3;
- (ODIHierarchy)initWithType:(int)a3 state:(id)a4;
- (id)infoForNode:(id)a3;
- (void)createInfoForNode:(id)a3 depth:(int)a4;
- (void)map;
- (void)mapLogicalBoundsWithXRanges:(const void *)a3;
- (void)mapNode:(id)a3;
- (void)mapRangesForNode:(id)a3;
- (void)setAbsolutePositionOfNode:(id)a3 parentRow:(int)a4 parentXOffset:(float)a5;
@end

@implementation ODIHierarchy

+ (BOOL)mapIdentifier:(id)a3 state:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v5 isEqualToString:@"orgChart1"])
  {
    uint64_t v7 = 1;
  }
  else if ([v5 isEqualToString:@"hierarchy3"])
  {
    uint64_t v7 = 3;
  }
  else
  {
    if (![v5 hasPrefix:@"hierarchy"])
    {
      BOOL v9 = 0;
      goto LABEL_8;
    }
    uint64_t v7 = 2;
  }
  v8 = [[ODIHierarchy alloc] initWithType:v7 state:v6];
  [(ODIHierarchy *)v8 map];

  BOOL v9 = 1;
LABEL_8:

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mNodeInfoMap, 0);
  objc_storeStrong((id *)&self->mState, 0);
}

- (ODIHierarchy)initWithType:(int)a3 state:(id)a4
{
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)ODIHierarchy;
  v8 = [(ODIHierarchy *)&v14 init];
  BOOL v9 = v8;
  if (v8)
  {
    if (a3 == 3) {
      int v10 = 1;
    }
    else {
      int v10 = 0x7FFFFFFF;
    }
    v8->mType = a3;
    v8->mMaxMappableTreeDepth = v10;
    objc_storeStrong((id *)&v8->mState, a4);
    v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    mNodeInfoMap = v9->mNodeInfoMap;
    v9->mNodeInfoMap = v11;
  }
  return v9;
}

- (id)infoForNode:(id)a3
{
  mNodeInfoMap = self->mNodeInfoMap;
  v4 = [MEMORY[0x263F08D40] valueWithPointer:a3];
  id v5 = [(NSMutableDictionary *)mNodeInfoMap objectForKey:v4];

  return v5;
}

- (void)createInfoForNode:(id)a3 depth:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v14 = a3;
  id v6 = objc_alloc_init(ODIHNodeInfo);
  mNodeInfoMap = self->mNodeInfoMap;
  v8 = [MEMORY[0x263F08D40] valueWithPointer:v14];
  [(NSMutableDictionary *)mNodeInfoMap setObject:v6 forKey:v8];

  [(ODIHNodeInfo *)v6 setTreeDepth:v4];
  BOOL v9 = [v14 children];
  uint64_t v10 = [v9 count];
  if (v10)
  {
    uint64_t v11 = 0;
    uint64_t v12 = (v4 + 1);
    do
    {
      v13 = [v9 objectAtIndex:v11];
      [(ODIHierarchy *)self createInfoForNode:v13 depth:v12];

      ++v11;
    }
    while (v10 != v11);
  }
}

- (void)mapRangesForNode:(id)a3
{
  id v138 = a3;
  v139 = -[ODIHierarchy infoForNode:](self, "infoForNode:");
  uint64_t v3 = [v139 xRanges];
  if (((*(void *)(v3 + 8) - *(void *)v3) & 0x7FFFFFFF8) != 0) {
    goto LABEL_147;
  }
  uint64_t v4 = [v138 children];
  v140 = v4;
  unint64_t v5 = [v4 count];
  if (!v5 || (int)[v139 treeDepth] >= self->mMaxMappableTreeDepth) {
    goto LABEL_146;
  }
  int mType = self->mType;
  if (mType != 1) {
    goto LABEL_110;
  }
  if ((int)[v139 treeDepth] < 1)
  {
    HIDWORD(v137) = 0;
  }
  else
  {
    HIDWORD(v137) = 0;
    for (unint64_t i = 0; i != v5; HIDWORD(v137) = i >= v5)
    {
      BOOL v9 = [v4 objectAtIndex:i];
      uint64_t v10 = [v9 children];
      uint64_t v11 = [v10 count];

      if (v11) {
        break;
      }
      ++i;
    }
  }
  uint64_t v12 = 0;
  if (v5 <= 1) {
    unint64_t v5 = 1;
  }
  char v13 = 1;
  float v14 = 0.0;
  do
  {
    v15 = [v4 objectAtIndex:v12];
    if (![v15 type])
    {
      if (v13)
      {
        ODIHRangeVector::boundingRange((float **)[(ODIHierarchy *)self mapRangesForNode:v15]);
        if (v14 < v16) {
          float v14 = v16;
        }
      }
      v13 ^= 1u;
    }

    ++v12;
  }
  while (v5 != v12);
  LODWORD(v17) = 0;
  uint64_t v18 = 0;
  v19 = (void *)(v3 + 16);
  float v20 = -v14;
  LODWORD(v137) = 1;
  do
  {
    v21 = objc_msgSend(v4, "objectAtIndex:", v18, v137);
    v22 = [(ODIHierarchy *)self infoForNode:v21];
    if ([v21 type]) {
      goto LABEL_81;
    }
    [v22 setExtraRowsBetweenParentAndSelf:((*(void *)(v3 + 8) - *(void *)v3) >> 3) - v17];
    [v22 setConnectToVerticalSide:1];
    v23 = [(ODIHierarchy *)self mapRangesForNode:v21];
    *(float *)&double v24 = ODIHRangeVector::boundingRange((float **)v23);
    float v26 = *(float *)&v24 + (float)(v25 * -0.5);
    if (v17)
    {
      *(float *)&double v24 = -v26;
      [v22 addToXOffsetRelativeToParent:v24];
      uint64_t v27 = *v23;
      unint64_t v28 = v23[1] - *v23;
      if ((v28 & 0x7FFFFFFF8) != 0)
      {
        uint64_t v29 = (v28 >> 3);
        v30 = (float *)*v23;
        do
        {
          float *v30 = *v30 - v26;
          v30 += 2;
          --v29;
        }
        while (v29);
      }
      unint64_t v31 = v28 >> 3;
      if (v31 >= v17) {
        uint64_t v32 = v17;
      }
      else {
        uint64_t v32 = v31;
      }
      if (v32)
      {
        v33 = *(float **)v3;
        int v34 = ((*(void *)(v3 + 8) - *(void *)v3) >> 3) - v17;
        v35 = (float *)(v27 + 4);
        do
        {
          float v36 = *(v35 - 1) + (float)(*v35 * 0.5);
          v37 = &v33[2 * v34];
          float v38 = *v37 - (float)(v37[1] * 0.5);
          float *v37 = (float)(v36 + v38) * 0.5;
          v37[1] = v36 - v38;
          ++v34;
          v35 += 2;
          --v32;
        }
        while (v32);
      }
      if (v17 >= v31)
      {
LABEL_77:
        LODWORD(v17) = 0;
        goto LABEL_81;
      }
      unint64_t v17 = v17;
      v39 = *(float **)(v3 + 8);
      do
      {
        float v40 = *(float *)(v27 + 8 * v17) + (float)(*(float *)(v27 + 8 * v17 + 4) * 0.5);
        float v41 = (float)(v40 + 0.0) * 0.5;
        if ((unint64_t)v39 >= *v19)
        {
          v42 = *(float **)v3;
          unint64_t v43 = (unint64_t)v39 - *(void *)v3;
          uint64_t v44 = (*v19 - *(void *)v3) >> 3;
          if (2 * (int)v44 <= (v43 >> 3) + 1) {
            unsigned int v45 = (v43 >> 3) + 1;
          }
          else {
            unsigned int v45 = 2 * v44;
          }
          if (v44 >= 0x7FFFFFFF) {
            unint64_t v46 = 0xFFFFFFFFLL;
          }
          else {
            unint64_t v46 = v45;
          }
          if (v46)
          {
            v47 = (char *)std::__allocate_at_least[abi:ne180100]<ChAllocator<EshComputedValue>>(v3 + 16, v46);
            uint64_t v49 = v48;
            v42 = *(float **)v3;
            v39 = *(float **)(v3 + 8);
          }
          else
          {
            v47 = 0;
            uint64_t v49 = 0;
          }
          v50 = (float *)&v47[v43 & 0x7FFFFFFF8];
          float *v50 = v41;
          v50[1] = v40;
          v51 = v50;
          if (v39 == v42)
          {
            uint64_t v4 = v140;
          }
          else
          {
            uint64_t v4 = v140;
            do
            {
              uint64_t v52 = *((void *)v39 - 1);
              v39 -= 2;
              *((void *)v51 - 1) = v52;
              v51 -= 2;
            }
            while (v39 != v42);
            v42 = *(float **)v3;
          }
          v39 = v50 + 2;
          *(void *)uint64_t v3 = v51;
          *(void *)(v3 + 8) = v50 + 2;
          *(void *)(v3 + 16) = &v47[8 * v49];
          if (v42) {
            operator delete(v42);
          }
        }
        else
        {
          float *v39 = v41;
          v39[1] = v40;
          v39 += 2;
        }
        *(void *)(v3 + 8) = v39;
        ++v17;
        uint64_t v27 = *v23;
      }
      while (v17 < ((unint64_t)(v23[1] - *v23) >> 3));
      LODWORD(v17) = 0;
    }
    else
    {
      float v53 = v20 - v26;
      *(float *)&double v24 = v53;
      [v22 addToXOffsetRelativeToParent:v24];
      uint64_t v54 = *v23;
      unint64_t v55 = v23[1] - *v23;
      uint64_t v56 = v55 & 0x7FFFFFFF8;
      if ((v55 & 0x7FFFFFFF8) == 0) {
        goto LABEL_77;
      }
      uint64_t v57 = (v55 >> 3);
      v58 = (float *)*v23;
      do
      {
        float *v58 = v53 + *v58;
        v58 += 2;
        --v57;
      }
      while (v57);
      if (v56)
      {
        unint64_t v59 = 0;
        v60 = *(float **)(v3 + 8);
        do
        {
          float v61 = *(float *)(v54 + 8 * v59) - (float)(*(float *)(v54 + 8 * v59 + 4) * 0.5);
          float v62 = (float)(v61 + 0.0) * 0.5;
          float v63 = 0.0 - v61;
          if ((unint64_t)v60 >= *v19)
          {
            v64 = *(float **)v3;
            unint64_t v65 = (unint64_t)v60 - *(void *)v3;
            uint64_t v66 = (*v19 - *(void *)v3) >> 3;
            if (2 * (int)v66 <= (v65 >> 3) + 1) {
              unsigned int v67 = (v65 >> 3) + 1;
            }
            else {
              unsigned int v67 = 2 * v66;
            }
            if (v66 >= 0x7FFFFFFF) {
              unint64_t v68 = 0xFFFFFFFFLL;
            }
            else {
              unint64_t v68 = v67;
            }
            if (v68)
            {
              v69 = (char *)std::__allocate_at_least[abi:ne180100]<ChAllocator<EshComputedValue>>(v3 + 16, v68);
              uint64_t v71 = v70;
              v64 = *(float **)v3;
              v60 = *(float **)(v3 + 8);
            }
            else
            {
              v69 = 0;
              uint64_t v71 = 0;
            }
            v72 = (float *)&v69[v65 & 0x7FFFFFFF8];
            float *v72 = v62;
            v72[1] = v63;
            v73 = v72;
            if (v60 != v64)
            {
              do
              {
                uint64_t v74 = *((void *)v60 - 1);
                v60 -= 2;
                *((void *)v73 - 1) = v74;
                v73 -= 2;
              }
              while (v60 != v64);
              v64 = *(float **)v3;
            }
            v60 = v72 + 2;
            *(void *)uint64_t v3 = v73;
            *(void *)(v3 + 8) = v72 + 2;
            *(void *)(v3 + 16) = &v69[8 * v71];
            if (v64) {
              operator delete(v64);
            }
          }
          else
          {
            float *v60 = v62;
            v60[1] = v63;
            v60 += 2;
          }
          *(void *)(v3 + 8) = v60;
          ++v59;
          uint64_t v54 = *v23;
          unint64_t v17 = (unint64_t)(v23[1] - *v23) >> 3;
        }
        while (v59 < v17);
      }
      else
      {
        LODWORD(v17) = 0;
      }
      uint64_t v4 = v140;
    }
    int mType = v137;
LABEL_81:

    ++v18;
  }
  while (v18 != v5);
  if ((v137 & 0x100000000) != 0)
  {
    uint64_t v75 = 0;
    int v76 = 0;
    uint64_t v77 = (*(void *)(v3 + 8) - *(void *)v3) >> 3;
    if ([v138 type]) {
      BOOL v78 = v77 == 0;
    }
    else {
      BOOL v78 = 0;
    }
    if (v78) {
      float v79 = 0.2;
    }
    else {
      float v79 = 0.53;
    }
    uint64_t v4 = v140;
    do
    {
      v80 = [v140 objectAtIndex:v75];
      if ([v80 type] == 2)
      {
        v81 = [(ODIHierarchy *)self infoForNode:v80];
        [v81 setConnectToVerticalSide:1];
        [v81 setExtraRowsBetweenParentAndSelf:(v76 + v77)];
        LODWORD(v82) = 1.0;
        objc_msgSend(v81, "setXRange:", 0.0, v82);
        *(float *)&double v83 = v79;
        [v81 setXOffsetRelativeToParent:v83];
        [v81 xRange];
        int v85 = v84;
        float v87 = v79 + v86;
        v89 = *(float **)(v3 + 8);
        unint64_t v88 = *(void *)(v3 + 16);
        if ((unint64_t)v89 >= v88)
        {
          v91 = *(float **)v3;
          unint64_t v92 = (unint64_t)v89 - *(void *)v3;
          unint64_t v93 = (v88 - *(void *)v3) >> 3;
          if (2 * (int)v93 <= (v92 >> 3) + 1) {
            unsigned int v94 = (v92 >> 3) + 1;
          }
          else {
            unsigned int v94 = 2 * v93;
          }
          if (v93 >= 0x7FFFFFFF) {
            unint64_t v95 = 0xFFFFFFFFLL;
          }
          else {
            unint64_t v95 = v94;
          }
          if (v95)
          {
            v96 = (char *)std::__allocate_at_least[abi:ne180100]<ChAllocator<EshComputedValue>>(v3 + 16, v95);
            uint64_t v98 = v97;
            v91 = *(float **)v3;
            v89 = *(float **)(v3 + 8);
          }
          else
          {
            v96 = 0;
            uint64_t v98 = 0;
          }
          v99 = &v96[v92 & 0x7FFFFFFF8];
          *(float *)v99 = v87;
          *((_DWORD *)v99 + 1) = v85;
          v100 = v99;
          if (v89 != v91)
          {
            do
            {
              uint64_t v101 = *((void *)v89 - 1);
              v89 -= 2;
              *((void *)v100 - 1) = v101;
              v100 -= 8;
            }
            while (v89 != v91);
            v91 = *(float **)v3;
          }
          v90 = (float *)(v99 + 8);
          *(void *)uint64_t v3 = v100;
          *(void *)(v3 + 8) = v99 + 8;
          *(void *)(v3 + 16) = &v96[8 * v98];
          if (v91) {
            operator delete(v91);
          }
        }
        else
        {
          float *v89 = v87;
          *((_DWORD *)v89 + 1) = v84;
          v90 = v89 + 2;
        }
        *(void *)(v3 + 8) = v90;
        ++v76;
      }
      ++v75;
    }
    while (v75 != v5);
    goto LABEL_146;
  }
LABEL_110:
  uint64_t v102 = 0;
  uint64_t v142 = 0;
  v143 = 0;
  uint64_t v144 = 0;
  do
  {
    v103 = [v4 objectAtIndex:v102];
    v104 = [(ODIHierarchy *)self infoForNode:v103];
    int v105 = [v103 type];
    if (mType != 1 || v105 == 2)
    {
      [v104 setExtraRowsBetweenParentAndSelf:(*(void *)(v3 + 8) - *(void *)v3) >> 3];
      v106 = [(ODIHierarchy *)self mapRangesForNode:v103];
      double v107 = ODIHRangeVector::minDistanceTo(&v142, v106);
      float v108 = *(float *)&v107;
      v109 = (float *)*v106;
      unint64_t v110 = v106[1] - *v106;
      if ((v110 & 0x7FFFFFFF8) != 0)
      {
        uint64_t v111 = (v110 >> 3);
        do
        {
          float *v109 = *v109 - *(float *)&v107;
          v109 += 2;
          --v111;
        }
        while (v111);
      }
      ODIHRangeVector::operator+=(&v142, v106);
      *(float *)&double v112 = -v108;
      [v104 addToXOffsetRelativeToParent:v112];
    }

    ++v102;
  }
  while (v102 != v5);
  v113 = (float *)v142;
  if ((((unint64_t)v143 - v142) & 0x7FFFFFFF8) != 0)
  {
    float v114 = *(float *)v142;
    float v115 = -*(float *)v142;
    uint64_t v116 = (((unint64_t)v143 - v142) >> 3);
    do
    {
      float *v113 = *v113 - v114;
      v113 += 2;
      --v116;
    }
    while (v116);
    for (uint64_t j = 0; j != v5; ++j)
    {
      v118 = [v4 objectAtIndex:j];
      v119 = [(ODIHierarchy *)self infoForNode:v118];
      int v120 = [v118 type];
      if (mType != 1 || v120 == 2)
      {
        *(float *)&double v121 = v115;
        [v119 addToXOffsetRelativeToParent:v121];
      }
    }
    v113 = (float *)v142;
    if ((((unint64_t)v143 - v142) & 0x7FFFFFFF8) != 0)
    {
      unint64_t v122 = 0;
      v123 = (void *)(v3 + 16);
      v124 = *(void **)(v3 + 8);
      do
      {
        if ((unint64_t)v124 >= *v123)
        {
          unint64_t v125 = (unint64_t)v124 - *(void *)v3;
          uint64_t v126 = (*v123 - *(void *)v3) >> 3;
          unsigned int v127 = 2 * v126;
          if (2 * (int)v126 <= (v125 >> 3) + 1) {
            unsigned int v127 = (v125 >> 3) + 1;
          }
          if (v126 >= 0x7FFFFFFF) {
            unint64_t v128 = 0xFFFFFFFFLL;
          }
          else {
            unint64_t v128 = v127;
          }
          if (v128)
          {
            v129 = (char *)std::__allocate_at_least[abi:ne180100]<ChAllocator<EshComputedValue>>(v3 + 16, v128);
            uint64_t v131 = v130;
          }
          else
          {
            v129 = 0;
            uint64_t v131 = 0;
          }
          v132 = &v129[v125 & 0x7FFFFFFF8];
          *(void *)v132 = *(void *)&v113[2 * v122];
          v124 = v132 + 8;
          v134 = *(float **)v3;
          v133 = *(char **)(v3 + 8);
          if (v133 != *(char **)v3)
          {
            do
            {
              uint64_t v135 = *((void *)v133 - 1);
              v133 -= 8;
              *((void *)v132 - 1) = v135;
              v132 -= 8;
            }
            while (v133 != (char *)v134);
            v133 = *(char **)v3;
          }
          *(void *)uint64_t v3 = v132;
          *(void *)(v3 + 8) = v124;
          *(void *)(v3 + 16) = &v129[8 * v131];
          if (v133) {
            operator delete(v133);
          }
        }
        else
        {
          *v124++ = *(void *)&v113[2 * v122];
        }
        *(void *)(v3 + 8) = v124;
        ++v122;
        v113 = (float *)v142;
      }
      while (v122 < (((unint64_t)v143 - v142) >> 3));
    }
  }
  uint64_t v4 = v140;
  if (v113)
  {
    v143 = v113;
    operator delete(v113);
  }
LABEL_146:
  uint64_t v142 = 0x3F80000000000000;
  LODWORD(v6) = 1.0;
  objc_msgSend(v139, "setXRange:", 0.0, v6);
  std::vector<ODIHRange,ChAllocator<ODIHRange>>::insert(v3, *(char **)v3, &v142);

LABEL_147:
  return (void *)v3;
}

- (void)mapLogicalBoundsWithXRanges:(const void *)a3
{
  float v5 = ODIHRangeVector::boundingRange((float **)a3);
  mState = self->mState;
  double v8 = (float)(v5 + (float)(v6 * -0.5));
  double v9 = (float)((float)((*((void *)a3 + 1) - *(void *)a3) >> 3) * 0.6);
  -[ODIState setLogicalBounds:](mState, "setLogicalBounds:", v8, -0.300000012, v6, v9);
}

- (void)setAbsolutePositionOfNode:(id)a3 parentRow:(int)a4 parentXOffset:(float)a5
{
  id v20 = a3;
  double v8 = -[ODIHierarchy infoForNode:](self, "infoForNode:");
  if ((int)[v8 treeDepth] <= self->mMaxMappableTreeDepth)
  {
    uint64_t v9 = a4 + [v8 extraRowsBetweenParentAndSelf] + 1;
    [v8 setRow:v9];
    [v8 xOffsetRelativeToParent];
    float v11 = v10;
    [v8 xRange];
    float v12 = v11 + a5;
    *(float *)&double v14 = v12 + v13;
    [v8 setXRange:v14];
    v15 = [v20 children];
    uint64_t v16 = [v15 count];
    if (v16)
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        uint64_t v18 = [v15 objectAtIndex:i];
        *(float *)&double v19 = v12;
        [(ODIHierarchy *)self setAbsolutePositionOfNode:v18 parentRow:v9 parentXOffset:v19];
      }
    }
  }
}

- (CGRect)boundsOfNode:(id)a3
{
  uint64_t v3 = [(ODIHierarchy *)self infoForNode:a3];
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
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- (void)mapNode:(id)a3
{
  id v55 = a3;
  int v4 = -[ODIHierarchy infoForNode:](self, "infoForNode:");
  int v5 = [v4 treeDepth];

  if (v5 <= self->mMaxMappableTreeDepth)
  {
    if ((v5 & 0x80000000) == 0)
    {
      [(ODIHierarchy *)self boundsOfNode:v55];
      double rect = v6;
      double v8 = v7;
      double v10 = v9;
      double v12 = v11;
      double v13 = +[ODIDrawable shapeGeometryForRectangle];
      double v14 = +[ODIDrawable addShapeWithBounds:rotation:geometry:state:](ODIDrawable, "addShapeWithBounds:rotation:geometry:state:", v13, self->mState, v8, v10, v12, rect, 0.0);

      +[ODIDrawable mapStyleFromPoint:v55 shape:v14 state:self->mState];
      +[ODIText mapTextFromPoint:v55 toShape:v14 isCentered:0 includeChildren:v5 == self->mMaxMappableTreeDepth state:self->mState];
      if (v5)
      {
        double v15 = [v55 parent];
        [(ODIHierarchy *)self boundsOfNode:v15];
        CGFloat v17 = v16;
        CGFloat v19 = v18;
        CGFloat v21 = v20;
        CGFloat v23 = v22;

        double v24 = objc_alloc_init(OITSUBezierPath);
        float v25 = [(ODIHierarchy *)self infoForNode:v55];
        int v26 = [v25 connectToVerticalSide];

        if (v26)
        {
          v57.origin.x = v17;
          v57.origin.y = v19;
          v57.size.width = v21;
          v57.size.height = v23;
          double MidX = CGRectGetMidX(v57);
          v58.origin.x = v8;
          v58.origin.y = v10;
          v58.size.width = v12;
          v58.size.height = rect;
          if (MidX <= CGRectGetMinX(v58)) {
            goto LABEL_9;
          }
          v59.origin.x = v17;
          v59.origin.y = v19;
          v59.size.width = v21;
          v59.size.height = v23;
          double v28 = CGRectGetMidX(v59);
          v60.origin.x = v8;
          v60.origin.y = v10;
          v60.size.width = v12;
          v60.size.height = rect;
          if (v28 >= CGRectGetMaxX(v60))
          {
LABEL_9:
            v69.origin.x = v17;
            v69.origin.y = v19;
            v69.size.width = v21;
            v69.size.height = v23;
            double v51 = CGRectGetMidX(v69);
            v70.origin.x = v17;
            v70.origin.y = v19;
            v70.size.width = v21;
            v70.size.height = v23;
            double MaxY = CGRectGetMaxY(v70);
            v71.origin.x = v17;
            v71.origin.y = v19;
            v71.size.width = v21;
            v71.size.height = v23;
            double v38 = CGRectGetMidX(v71);
            v72.origin.x = v8;
            v72.origin.y = v10;
            v72.size.width = v12;
            v72.size.height = rect;
            if (v38 >= CGRectGetMidX(v72))
            {
              v74.origin.x = v8;
              v74.origin.y = v10;
              v74.size.width = v12;
              v74.size.height = rect;
              double MaxX = CGRectGetMaxX(v74);
            }
            else
            {
              v73.origin.x = v8;
              v73.origin.y = v10;
              v73.size.width = v12;
              v73.size.height = rect;
              double MaxX = CGRectGetMinX(v73);
            }
            double v29 = MaxX;
            v75.origin.x = v8;
            v75.origin.y = v10;
            v75.size.width = v12;
            v75.size.height = rect;
            double MidY = CGRectGetMidY(v75);
          }
          else
          {
            v61.origin.x = v8;
            v61.origin.y = v10;
            v61.size.width = v12;
            v61.size.height = rect;
            double MinX = CGRectGetMinX(v61);
            v62.origin.x = v17;
            v62.origin.y = v19;
            v62.size.width = v21;
            v62.size.height = v23;
            double MaxY = CGRectGetMaxY(v62);
            v63.origin.x = v8;
            v63.origin.y = v10;
            v63.size.width = v12;
            v63.size.height = rect;
            double v29 = CGRectGetMinX(v63);
            v64.origin.x = v8;
            v64.origin.y = v10;
            v64.size.width = v12;
            v64.size.height = rect;
            double MidY = CGRectGetMidY(v64);
            double v51 = MinX + -0.129999995;
          }
          -[OITSUBezierPath moveToPoint:](v24, "moveToPoint:", v51, MaxY);
          -[OITSUBezierPath lineToPoint:](v24, "lineToPoint:", v51, MidY);
          -[OITSUBezierPath lineToPoint:](v24, "lineToPoint:", v29, MidY);
        }
        else
        {
          v65.origin.x = v17;
          v65.origin.y = v19;
          v65.size.width = v21;
          v65.size.height = v23;
          double v53 = CGRectGetMidX(v65);
          v66.origin.x = v17;
          v66.origin.y = v19;
          v66.size.width = v21;
          v66.size.height = v23;
          double v31 = CGRectGetMaxY(v66);
          v67.origin.x = v8;
          v67.origin.y = v10;
          v67.size.width = v12;
          v67.size.height = rect;
          double v32 = CGRectGetMidX(v67);
          v68.origin.x = v8;
          v68.origin.y = v10;
          v68.size.width = v12;
          v68.size.height = rect;
          double MinY = CGRectGetMinY(v68);
          int v34 = [(ODIHierarchy *)self infoForNode:v55];
          int v35 = [v34 row];

          -[OITSUBezierPath moveToPoint:](v24, "moveToPoint:", v53, v31);
          float v36 = ((double)v35 + -0.5) * 0.600000024;
          double v37 = v36;
          -[OITSUBezierPath lineToPoint:](v24, "lineToPoint:", v53, v36);
          -[OITSUBezierPath lineToPoint:](v24, "lineToPoint:", v32, v37);
          -[OITSUBezierPath lineToPoint:](v24, "lineToPoint:", v32, MinY);
        }
        mState = self->mState;
        if (v5 >= 3) {
          int v41 = 3;
        }
        else {
          int v41 = v5;
        }
        v42 = objc_msgSend(NSString, "stringWithFormat:", @"parChTrans1D%d", (v41 + 1));
        [(ODIState *)mState setDefaultStyleLabelName:v42 forPointType:3];

        [(ODIState *)self->mState logicalBounds];
        unint64_t v43 = +[ODIDrawable shapeGeometryForBezierPath:gSpace:](ODIDrawable, "shapeGeometryForBezierPath:gSpace:", v24);
        [(ODIState *)self->mState logicalBounds];
        uint64_t v44 = +[ODIDrawable addShapeWithBounds:rotation:geometry:state:](ODIDrawable, "addShapeWithBounds:rotation:geometry:state:", v43, self->mState);
        unsigned int v45 = [v55 parentTransition];
        +[ODIDrawable mapStyleAndTextFromPoint:v45 shape:v44 state:self->mState];
      }
    }
    unint64_t v46 = [v55 children];
    uint64_t v47 = [v46 count];
    if (v47)
    {
      for (uint64_t i = 0; i != v47; ++i)
      {
        uint64_t v49 = [v46 objectAtIndex:i];
        [(ODIHierarchy *)self mapNode:v49];
      }
    }
  }
}

- (void)map
{
  uint64_t v3 = [(ODIState *)self->mState diagram];
  id v10 = [v3 documentPoint];

  [(ODIHierarchy *)self createInfoForNode:v10 depth:0xFFFFFFFFLL];
  int v4 = [(ODIHierarchy *)self mapRangesForNode:v10];
  int v5 = v4;
  double v7 = (char *)*v4;
  double v6 = (unsigned char *)v4[1];
  double v8 = (unsigned char *)(*v4 + 8);
  int64_t v9 = v6 - v8;
  if (v6 != v8) {
    memmove((void *)*v4, v8, v6 - v8);
  }
  v5[1] = &v7[v9];
  [(ODIHierarchy *)self mapLogicalBoundsWithXRanges:v5];
  [(ODIHierarchy *)self setAbsolutePositionOfNode:v10 parentRow:4294967294 parentXOffset:0.0];
  [(ODIHierarchy *)self mapNode:v10];
}

@end
@interface ODIBending
+ (BOOL)mapIdentifier:(id)a3 state:(id)a4;
+ (unsigned)mapLogicalBoundsWithShapeSize:(CGSize)a3 spaceSize:(CGSize)a4 maxNodeCount:(unsigned int)a5 maxColumnCount:(unsigned int)a6 state:(id)a7;
- (ODIBending)initWithArrows:(BOOL)a3;
- (void)mapWithState:(id)a3;
- (void)setMaxColumnCount:(unsigned int)a3;
- (void)setMaxNodeCount:(unsigned int)a3;
- (void)setRectHeight:(float)a3;
@end

@implementation ODIBending

+ (BOOL)mapIdentifier:(id)a3 state:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (([v6 isEqualToString:@"default"] & 1) != 0
    || [v6 isEqualToString:@"matrix2"])
  {
    id v8 = objc_alloc((Class)a1);
    uint64_t v9 = 0;
LABEL_7:
    v10 = (void *)[v8 initWithArrows:v9];
    goto LABEL_8;
  }
  if (([v6 isEqualToString:@"process5"] & 1) != 0
    || [v6 hasPrefix:@"bProcess"])
  {
    id v8 = objc_alloc((Class)a1);
    uint64_t v9 = 1;
    goto LABEL_7;
  }
  if ([v6 isEqualToString:@"bList2"])
  {
    v12 = 0;
    +[ODIBendingList2 mapWithState:v7];
    BOOL v11 = 1;
    goto LABEL_17;
  }
  if ([v6 isEqualToString:@"matrix3"])
  {
    v10 = (void *)[objc_alloc((Class)a1) initWithArrows:0];
    LODWORD(v13) = 1.0;
    [v10 setRectHeight:v13];
    [v10 setMaxNodeCount:4];
    [v10 setMaxColumnCount:2];
  }
  else
  {
    if (![v6 isEqualToString:@"radial2"]) {
      goto LABEL_16;
    }
    v10 = (void *)[objc_alloc((Class)a1) initWithArrows:0];
    LODWORD(v14) = 1.0;
    [v10 setRectHeight:v14];
  }
LABEL_8:
  if (!v10)
  {
LABEL_16:
    v12 = 0;
    BOOL v11 = 0;
    goto LABEL_17;
  }
  [v10 mapWithState:v7];
  BOOL v11 = 1;
  v12 = v10;
LABEL_17:

  return v11;
}

- (ODIBending)initWithArrows:(BOOL)a3
{
  BOOL v3 = a3;
  v8.receiver = self;
  v8.super_class = (Class)ODIBending;
  v4 = [(ODIBending *)&v8 init];
  id v6 = v4;
  if (v4)
  {
    LODWORD(v5) = 1036831949;
    if (v3) {
      *(float *)&double v5 = 0.4;
    }
    v4->mSpaceWidth = *(float *)&v5;
    v4->mSpaceHeight = *(float *)&v5;
    v4->mWithArrows = v3;
    LODWORD(v5) = 1058642330;
    [(ODIBending *)v4 setRectHeight:v5];
    *(void *)&v6->mMaxNodeCount = -1;
  }
  return v6;
}

- (void)setRectHeight:(float)a3
{
  self->mRectHeight = a3;
}

- (void)setMaxNodeCount:(unsigned int)a3
{
  self->mMaxNodeCount = a3;
}

- (void)setMaxColumnCount:(unsigned int)a3
{
  self->mMaxColumnCount = a3;
}

- (void)mapWithState:(id)a3
{
  id v52 = a3;
  v4 = [v52 diagram];
  double v5 = [v4 documentPoint];
  id v6 = [v5 children];

  unsigned int v7 = [v6 count];
  if (self->mMaxNodeCount >= v7) {
    unsigned int mMaxNodeCount = v7;
  }
  else {
    unsigned int mMaxNodeCount = self->mMaxNodeCount;
  }
  unsigned int v9 = +[ODIBending mapLogicalBoundsWithShapeSize:spaceSize:maxNodeCount:maxColumnCount:state:](ODIBending, "mapLogicalBoundsWithShapeSize:spaceSize:maxNodeCount:maxColumnCount:state:", 1.0, self->mRectHeight, self->mSpaceWidth, self->mSpaceHeight);
  if (!v9) {
    goto LABEL_27;
  }
  unint64_t v46 = v9 - 1;
  if (v9 > v46 + mMaxNodeCount) {
    goto LABEL_27;
  }
  int v49 = 0;
  unsigned int v10 = 0;
  unsigned int v11 = mMaxNodeCount - 1;
  unsigned int v44 = v9 - 2;
  p_cache = ODIState.cache;
  uint64_t v47 = v9;
  LODWORD(v43) = (v46 + mMaxNodeCount) / v9;
  HIDWORD(v43) = v9;
  v45 = v6;
  do
  {
    unint64_t v13 = 0;
    uint64_t v48 = v11;
    float v14 = (float)v10;
    unsigned int v15 = v44;
    while (1)
    {
      v16 = objc_msgSend(v6, "objectAtIndex:", (v49 + v13), v43);
      float mRectHeight = self->mRectHeight;
      float mSpaceWidth = self->mSpaceWidth;
      float mSpaceHeight = self->mSpaceHeight;
      LODWORD(v20) = 1036831949;
      v21 = [p_cache + 13 shapeGeometryForRoundedRectangleWithRadius:v20];
      unsigned int v22 = (v10 & 1) != 0 ? v15 + 1 : v13;
      v23 = objc_msgSend(p_cache + 13, "addShapeWithBounds:rotation:geometry:state:", v21, v52, (float)((float)(mSpaceWidth + 1.0) * (float)v22), (float)((float)(mRectHeight + mSpaceHeight) * v14), 1.0, mRectHeight, 0.0);
      [p_cache + 13 mapStyleAndTextFromPoint:v16 shape:v23 state:v52];
      if (v48 == v13) {
        break;
      }
      if (self->mWithArrows)
      {
        if (v10)
        {
          if (v13 >= v46)
          {
            float v25 = (float)(self->mSpaceHeight * 0.5)
                + (float)(self->mRectHeight + (float)(v14 * (float)(self->mRectHeight + self->mSpaceHeight)));
            double v24 = 0.5;
            goto LABEL_20;
          }
          double v24 = (float)((float)(self->mSpaceWidth * 0.5)
                      + (float)((float)((float)v15 * (float)(self->mSpaceWidth + 1.0)) + 1.0));
          float v25 = (float)(self->mRectHeight * 0.5) + (float)(v14 * (float)(self->mRectHeight + self->mSpaceHeight));
          int v27 = 1127481344;
        }
        else
        {
          if (v13 < v46)
          {
            double v24 = (float)((float)(self->mSpaceWidth * 0.5)
                        + (float)((float)((float)v13 * (float)(self->mSpaceWidth + 1.0)) + 1.0));
            float v25 = (float)(self->mRectHeight * 0.5) + (float)(v14 * (float)(self->mRectHeight + self->mSpaceHeight));
            int v26 = 0;
LABEL_22:
            double v28 = TSURectWithCenterAndSize(v24, v25, *(double *)"");
            double v30 = v29;
            double v32 = v31;
            double v34 = v33;
            v35 = objc_msgSend(p_cache + 13, "shapeGeometryForRightArrowWithControlPoint:", 0.5, 0.15);
            v50 = v23;
            v51 = v16;
            unsigned int v36 = v15;
            LODWORD(v37) = v26;
            v38 = objc_msgSend(p_cache + 13, "addShapeWithBounds:rotation:geometry:state:", v35, v52, v28, v30, v32, v34, v37);
            v39 = v21;
            v40 = p_cache;
            v41 = p_cache + 13;
            v42 = [v51 siblingTransition];
            [v41 mapStyleAndTextFromPoint:v42 shape:v38 state:v52];

            id v6 = v45;
            p_cache = v40;
            v21 = v39;
            unsigned int v15 = v36;
            v23 = v50;
            v16 = v51;
            goto LABEL_23;
          }
          double v24 = (float)((float)((float)v46 * (float)(self->mSpaceWidth + 1.0)) + 0.5);
          float v25 = (float)(self->mSpaceHeight * 0.5)
              + (float)(self->mRectHeight + (float)(v14 * (float)(self->mRectHeight + self->mSpaceHeight)));
LABEL_20:
          int v27 = 1119092736;
        }
        int v26 = v27;
        goto LABEL_22;
      }
LABEL_23:

      ++v13;
      --v15;
      if (v47 == v13) {
        goto LABEL_26;
      }
    }

LABEL_26:
    ++v10;
    unsigned int v11 = v48 - HIDWORD(v43);
    v49 += v47;
  }
  while (v10 != v43);
LABEL_27:
}

+ (unsigned)mapLogicalBoundsWithShapeSize:(CGSize)a3 spaceSize:(CGSize)a4 maxNodeCount:(unsigned int)a5 maxColumnCount:(unsigned int)a6 state:(id)a7
{
  double height = a4.height;
  double width = a4.width;
  double v11 = a3.height;
  double v12 = a3.width;
  id v13 = a7;
  float v14 = [v13 diagram];
  unsigned int v15 = [v14 documentPoint];
  v16 = [v15 children];
  unsigned int v17 = [v16 count];

  if (v17 < a5) {
    a5 = v17;
  }
  if (a5 < a6) {
    a6 = a5;
  }
  v18 = [v13 diagramOrientedBounds];
  [v18 bounds];
  CGFloat v20 = v19;
  CGFloat v22 = v21;
  CGFloat v24 = v23;
  CGFloat v26 = v25;

  v46.origin.x = v20;
  v46.origin.y = v22;
  v46.size.double width = v24;
  v46.size.double height = v26;
  double v45 = CGRectGetWidth(v46);
  v47.origin.x = v20;
  v47.origin.y = v22;
  v47.size.double width = v24;
  v47.size.double height = v26;
  double v27 = CGRectGetHeight(v47);
  if (!a6) {
    goto LABEL_15;
  }
  unsigned int v28 = 0;
  unsigned int v29 = 0;
  unsigned int v32 = a6 + 1 > 2 ? a6 + 1 : 2;
  unsigned int v33 = v32 - 1;
  float v34 = 0.0;
  float v30 = v45;
  float v31 = v27;
  float v35 = v30 / v31;
  double v36 = 1.0;
  do
  {
    unsigned int v37 = v28 + 1;
    double v38 = width * (double)v28;
    float v39 = v38 + v36 * v12;
    float v40 = height * (double)((a5 + v28) / v37 - 1) + (double)((a5 + v28) / v37) * v11;
    float v41 = fminf((float)(v39 / v40) / v35, 1.0) / (v38 / v12 + v36);
    if (v34 * 0.999 < v41)
    {
      float v34 = v41;
      unsigned int v29 = v28 + 1;
    }
    double v36 = v36 + 1.0;
    ++v28;
  }
  while (v33 != v37);
  if (v29)
  {
    float v42 = width * (double)(v29 - 1) + (double)v29 * v12;
    float v43 = height * (double)((a5 - 1 + v29) / v29 - 1) + (double)((a5 - 1 + v29) / v29) * v11;
    objc_msgSend(v13, "setLogicalBounds:", 0.0, 0.0, v42, v43);
  }
  else
  {
LABEL_15:
    objc_msgSend(v13, "setLogicalBounds:", 0.0, 0.0, 0.0, 0.0);
    unsigned int v29 = 0;
  }

  return v29;
}

@end
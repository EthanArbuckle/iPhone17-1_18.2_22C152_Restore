@interface EQKitVBox
- (BOOL)appendOpticalAlignToSpec:(void *)a3 offset:(CGPoint)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)p_getTransform:(CGAffineTransform *)a3 fromDescendant:(id)a4;
- (CGRect)p_cacheErasableBounds;
- (EQKitVBox)init;
- (EQKitVBox)initWithChildBoxes:(id)a3;
- (EQKitVBox)initWithChildBoxes:(id)a3 pivotIndex:(unint64_t)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)pivotIndex;
- (void)p_cacheDimensionsForHeight:(double *)a3 depth:(double *)a4 width:(double *)a5;
- (void)renderIntoContext:(CGContext *)a3 offset:(CGPoint)a4;
@end

@implementation EQKitVBox

- (EQKitVBox)initWithChildBoxes:(id)a3 pivotIndex:(unint64_t)a4
{
  v6.receiver = self;
  v6.super_class = (Class)EQKitVBox;
  result = [(EQKitCompoundBox *)&v6 initWithChildBoxes:a3];
  if (result) {
    result->mPivotIndex = a4;
  }
  return result;
}

- (EQKitVBox)initWithChildBoxes:(id)a3
{
  return [(EQKitVBox *)self initWithChildBoxes:a3 pivotIndex:0];
}

- (EQKitVBox)init
{
  return [(EQKitVBox *)self initWithChildBoxes:0 pivotIndex:0];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  v5 = [(EQKitCompoundBox *)self childBoxes];
  unint64_t v6 = [(EQKitVBox *)self pivotIndex];

  return (id)[v4 initWithChildBoxes:v5 pivotIndex:v6];
}

- (BOOL)isEqual:(id)a3
{
  v3 = self;
  BOOL v4 = self == a3;
  LOBYTE(self) = self == a3;
  if (a3)
  {
    if (!v4)
    {
      LODWORD(self) = [a3 isMemberOfClass:objc_opt_class()];
      if (self)
      {
        uint64_t v6 = [(EQKitVBox *)v3 pivotIndex];
        if (v6 == [a3 pivotIndex])
        {
          v7 = [(EQKitCompoundBox *)v3 childBoxes];
          self = (EQKitVBox *)[a3 childBoxes];
          if (v7 == self)
          {
            LOBYTE(self) = 1;
          }
          else
          {
            v8 = self;
            LOBYTE(self) = 0;
            if (v7 && v8)
            {
              LOBYTE(self) = -[EQKitVBox isEqual:](v7, "isEqual:");
            }
          }
        }
        else
        {
          LOBYTE(self) = 0;
        }
      }
    }
  }
  return (char)self;
}

- (void)renderIntoContext:(CGContext *)a3 offset:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  uint64_t v26 = *MEMORY[0x263EF8340];
  v24.receiver = self;
  v24.super_class = (Class)EQKitVBox;
  -[EQKitBox renderIntoContext:offset:](&v24, sel_renderIntoContext_offset_);
  if (a3)
  {
    [(EQKitCompoundBox *)self height];
    double v9 = v8;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    v10 = [(EQKitCompoundBox *)self childBoxes];
    uint64_t v11 = [(NSArray *)v10 countByEnumeratingWithState:&v20 objects:v25 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      double v13 = y - v9;
      uint64_t v14 = *(void *)v21;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v21 != v14) {
            objc_enumerationMutation(v10);
          }
          v16 = *(void **)(*((void *)&v20 + 1) + 8 * i);
          [v16 layoutHeight];
          double v18 = v13 + v17;
          objc_msgSend(v16, "renderIntoContext:offset:", a3, x, v18);
          [v16 layoutDepth];
          double v13 = v18 + v19;
        }
        uint64_t v12 = [(NSArray *)v10 countByEnumeratingWithState:&v20 objects:v25 count:16];
      }
      while (v12);
    }
  }
}

- (BOOL)appendOpticalAlignToSpec:(void *)a3 offset:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  uint64_t v27 = *MEMORY[0x263EF8340];
  [(EQKitCompoundBox *)self height];
  if ((*((_DWORD *)a3 + 6) | 2) == 2
    && (double v9 = v8,
        long long v24 = 0u,
        long long v25 = 0u,
        long long v22 = 0u,
        long long v23 = 0u,
        v10 = [(EQKitCompoundBox *)self childBoxes],
        (uint64_t v11 = [(NSArray *)v10 countByEnumeratingWithState:&v22 objects:v26 count:16]) != 0))
  {
    uint64_t v12 = v11;
    int v13 = 0;
    double v14 = y - v9;
    uint64_t v15 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v23 != v15) {
          objc_enumerationMutation(v10);
        }
        double v17 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        [v17 layoutHeight];
        double v19 = v14 + v18;
        v13 |= objc_msgSend(v17, "appendOpticalAlignToSpec:offset:", a3, x, v19);
        [v17 layoutDepth];
        double v14 = v19 + v20;
      }
      uint64_t v12 = [(NSArray *)v10 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v12);
  }
  else
  {
    LOBYTE(v13) = 0;
  }
  return v13 & 1;
}

- (BOOL)p_getTransform:(CGAffineTransform *)a3 fromDescendant:(id)a4
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  if (a4 == self)
  {
LABEL_12:
    LOBYTE(v10) = 1;
  }
  else
  {
    [(EQKitCompoundBox *)self height];
    double v8 = v7;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    double v9 = [(EQKitCompoundBox *)self childBoxes];
    uint64_t v10 = [(NSArray *)v9 countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      double v12 = -v8;
      uint64_t v13 = *(void *)v25;
      while (2)
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v25 != v13) {
            objc_enumerationMutation(v9);
          }
          uint64_t v15 = *(void **)(*((void *)&v24 + 1) + 8 * i);
          [v15 layoutHeight];
          double v17 = v12 + v16;
          if (objc_msgSend(v15, "p_getTransform:fromDescendant:", a3, a4))
          {
            long long v19 = *(_OWORD *)&a3->c;
            *(_OWORD *)&v22.a = *(_OWORD *)&a3->a;
            *(_OWORD *)&v22.c = v19;
            *(_OWORD *)&v22.tdouble x = *(_OWORD *)&a3->tx;
            CGAffineTransformTranslate(&v23, &v22, 0.0, v17);
            long long v20 = *(_OWORD *)&v23.c;
            *(_OWORD *)&a3->a = *(_OWORD *)&v23.a;
            *(_OWORD *)&a3->c = v20;
            *(_OWORD *)&a3->tdouble x = *(_OWORD *)&v23.tx;
            goto LABEL_12;
          }
          [v15 layoutDepth];
          double v12 = v17 + v18;
        }
        uint64_t v11 = [(NSArray *)v9 countByEnumeratingWithState:&v24 objects:v28 count:16];
        LOBYTE(v10) = 0;
        if (v11) {
          continue;
        }
        break;
      }
    }
  }
  return v10;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  [(EQKitCompoundBox *)self height];
  uint64_t v6 = v5;
  [(EQKitCompoundBox *)self depth];
  uint64_t v8 = v7;
  [(EQKitCompoundBox *)self width];
  return (id)[v3 stringWithFormat:@"<%@ %p>: height=%f depth=%f width=%f childBoxes=%@ pivotIndex=%lu", v4, self, v6, v8, v9, -[EQKitCompoundBox childBoxes](self, "childBoxes"), -[EQKitVBox pivotIndex](self, "pivotIndex")];
}

- (void)p_cacheDimensionsForHeight:(double *)a3 depth:(double *)a4 width:(double *)a5
{
  if (a3 || a4 || a5)
  {
    if (a3) {
      *a3 = 0.0;
    }
    if (a4) {
      *a4 = 0.0;
    }
    if (a5) {
      *a5 = 0.0;
    }
    uint64_t v9 = [(EQKitCompoundBox *)self childBoxes];
    uint64_t v10 = [(NSArray *)v9 count];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = v10 - 1;
      unint64_t v13 = v10 - 1;
      if ([(EQKitVBox *)self pivotIndex] < v10 - 1) {
        unint64_t v13 = [(EQKitVBox *)self pivotIndex];
      }
      for (unint64_t i = 0; v11 != i; ++i)
      {
        id v15 = [(NSArray *)v9 objectAtIndex:i];
        double v16 = v15;
        if (i >= v13)
        {
          if (i <= v13)
          {
            if (a3)
            {
              if (v13) {
                [v15 layoutHeight];
              }
              else {
                [v15 height];
              }
              *a3 = v19 + *a3;
            }
            if (!a4) {
              goto LABEL_31;
            }
            if (v13 == v12) {
              [v16 depth];
            }
            else {
              [v16 layoutDepth];
            }
LABEL_29:
            double v18 = a4;
LABEL_30:
            *double v18 = v17 + *v18;
            goto LABEL_31;
          }
          if (a4)
          {
            [v15 layoutVSize];
            goto LABEL_29;
          }
        }
        else if (a3)
        {
          [v15 layoutVSize];
          double v18 = a3;
          goto LABEL_30;
        }
LABEL_31:
        if (a5)
        {
          double v20 = *a5;
          [v16 width];
          if (v20 <= v21) {
            [v16 width];
          }
          else {
            uint64_t v22 = *(void *)a5;
          }
          *(void *)a5 = v22;
        }
      }
    }
  }
}

- (CGRect)p_cacheErasableBounds
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  CGFloat x = *MEMORY[0x263F001A8];
  CGFloat y = *(double *)(MEMORY[0x263F001A8] + 8);
  CGFloat width = *(double *)(MEMORY[0x263F001A8] + 16);
  CGFloat height = *(double *)(MEMORY[0x263F001A8] + 24);
  [(EQKitCompoundBox *)self height];
  double v8 = v7;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  uint64_t v9 = [(EQKitCompoundBox *)self childBoxes];
  uint64_t v10 = [(NSArray *)v9 countByEnumeratingWithState:&v33 objects:v37 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    double v12 = -v8;
    uint64_t v13 = *(void *)v34;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        CGFloat v15 = x;
        if (*(void *)v34 != v13) {
          objc_enumerationMutation(v9);
        }
        double v16 = *(void **)(*((void *)&v33 + 1) + 8 * i);
        objc_msgSend(v16, "layoutHeight", *(void *)&v31);
        double v18 = v12 + v17;
        [v16 erasableBounds];
        CGFloat x = v19;
        CGFloat v21 = v20;
        CGFloat v23 = v22;
        double v32 = v18;
        double v25 = v18 + v24;
        [v16 layoutDepth];
        double v31 = v26;
        v39.origin.CGFloat x = v15;
        v39.origin.CGFloat y = y;
        v39.size.CGFloat width = width;
        v39.size.CGFloat height = height;
        if (CGRectIsEmpty(v39))
        {
          CGFloat y = v25;
          CGFloat width = v21;
          CGFloat height = v23;
        }
        else
        {
          v40.origin.CGFloat x = v15;
          v40.origin.CGFloat y = y;
          v40.size.CGFloat width = width;
          v40.size.CGFloat height = height;
          v43.origin.CGFloat x = x;
          v43.origin.CGFloat y = v25;
          v43.size.CGFloat width = v21;
          v43.size.CGFloat height = v23;
          CGRect v41 = CGRectUnion(v40, v43);
          CGFloat x = v41.origin.x;
          CGFloat y = v41.origin.y;
          CGFloat width = v41.size.width;
          CGFloat height = v41.size.height;
        }
        double v12 = v32 + v31;
      }
      uint64_t v11 = [(NSArray *)v9 countByEnumeratingWithState:&v33 objects:v37 count:16];
    }
    while (v11);
  }
  double v27 = x;
  double v28 = y;
  double v29 = width;
  double v30 = height;
  result.size.CGFloat height = v30;
  result.size.CGFloat width = v29;
  result.origin.CGFloat y = v28;
  result.origin.CGFloat x = v27;
  return result;
}

- (unint64_t)pivotIndex
{
  return self->mPivotIndex;
}

@end
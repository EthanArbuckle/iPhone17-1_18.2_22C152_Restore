@interface EQKitHBox
- (BOOL)appendOpticalAlignToSpec:(void *)a3 offset:(CGPoint)a4;
- (BOOL)p_getTransform:(CGAffineTransform *)a3 fromDescendant:(id)a4;
- (CGRect)p_cacheErasableBounds;
- (void)p_cacheDimensionsForHeight:(double *)a3 depth:(double *)a4 width:(double *)a5;
- (void)renderIntoContext:(CGContext *)a3 offset:(CGPoint)a4;
@end

@implementation EQKitHBox

- (void)renderIntoContext:(CGContext *)a3 offset:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  uint64_t v21 = *MEMORY[0x263EF8340];
  v19.receiver = self;
  v19.super_class = (Class)EQKitHBox;
  -[EQKitBox renderIntoContext:offset:](&v19, sel_renderIntoContext_offset_);
  if (a3)
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    v8 = [(EQKitCompoundBox *)self childBoxes];
    uint64_t v9 = [(NSArray *)v8 countByEnumeratingWithState:&v15 objects:v20 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v16 != v11) {
            objc_enumerationMutation(v8);
          }
          v13 = *(void **)(*((void *)&v15 + 1) + 8 * i);
          objc_msgSend(v13, "renderIntoContext:offset:", a3, x, y);
          [v13 width];
          double x = x + v14;
        }
        uint64_t v10 = [(NSArray *)v8 countByEnumeratingWithState:&v15 objects:v20 count:16];
      }
      while (v10);
    }
  }
}

- (BOOL)appendOpticalAlignToSpec:(void *)a3 offset:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  uint64_t v36 = *MEMORY[0x263EF8340];
  int v8 = *((_DWORD *)a3 + 6);
  if (v8 == 2)
  {
    [(EQKitCompoundBox *)self width];
    double v17 = v16;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v18 = [(NSArray *)[(EQKitCompoundBox *)self childBoxes] reverseObjectEnumerator];
    uint64_t v10 = [(NSEnumerator *)v18 countByEnumeratingWithState:&v26 objects:v34 count:16];
    if (v10)
    {
      uint64_t v19 = v10;
      double v20 = x + v17;
      uint64_t v21 = *(void *)v27;
LABEL_14:
      uint64_t v22 = 0;
      while (1)
      {
        if (*(void *)v27 != v21) {
          objc_enumerationMutation(v18);
        }
        v23 = *(void **)(*((void *)&v26 + 1) + 8 * v22);
        [v23 width];
        double v20 = v20 - v24;
        if (objc_msgSend(v23, "appendOpticalAlignToSpec:offset:", a3, v20, y)) {
          goto LABEL_21;
        }
        if (v19 == ++v22)
        {
          uint64_t v19 = [(NSEnumerator *)v18 countByEnumeratingWithState:&v26 objects:v34 count:16];
          LOBYTE(v10) = 0;
          if (v19) {
            goto LABEL_14;
          }
          return v10;
        }
      }
    }
  }
  else
  {
    if (v8)
    {
      LOBYTE(v10) = 0;
      return v10;
    }
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    uint64_t v9 = [(EQKitCompoundBox *)self childBoxes];
    uint64_t v10 = [(NSArray *)v9 countByEnumeratingWithState:&v30 objects:v35 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v31;
LABEL_5:
      uint64_t v13 = 0;
      while (1)
      {
        if (*(void *)v31 != v12) {
          objc_enumerationMutation(v9);
        }
        double v14 = *(void **)(*((void *)&v30 + 1) + 8 * v13);
        if (objc_msgSend(v14, "appendOpticalAlignToSpec:offset:", a3, x, y)) {
          break;
        }
        [v14 width];
        double x = x + v15;
        if (v11 == ++v13)
        {
          uint64_t v11 = [(NSArray *)v9 countByEnumeratingWithState:&v30 objects:v35 count:16];
          LOBYTE(v10) = 0;
          if (v11) {
            goto LABEL_5;
          }
          return v10;
        }
      }
LABEL_21:
      LOBYTE(v10) = 1;
    }
  }
  return v10;
}

- (BOOL)p_getTransform:(CGAffineTransform *)a3 fromDescendant:(id)a4
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  if (a4 == self)
  {
LABEL_12:
    LOBYTE(v7) = 1;
  }
  else
  {
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    v6 = [(EQKitCompoundBox *)self childBoxes];
    uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v20;
      double v10 = 0.0;
      while (2)
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v20 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v12 = *(void **)(*((void *)&v19 + 1) + 8 * i);
          if (objc_msgSend(v12, "p_getTransform:fromDescendant:", a3, a4))
          {
            long long v14 = *(_OWORD *)&a3->c;
            *(_OWORD *)&v17.a = *(_OWORD *)&a3->a;
            *(_OWORD *)&v17.c = v14;
            *(_OWORD *)&v17.tdouble x = *(_OWORD *)&a3->tx;
            CGAffineTransformTranslate(&v18, &v17, v10, 0.0);
            long long v15 = *(_OWORD *)&v18.c;
            *(_OWORD *)&a3->a = *(_OWORD *)&v18.a;
            *(_OWORD *)&a3->c = v15;
            *(_OWORD *)&a3->tdouble x = *(_OWORD *)&v18.tx;
            goto LABEL_12;
          }
          [v12 width];
          double v10 = v10 + v13;
        }
        uint64_t v8 = [(NSArray *)v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
        LOBYTE(v7) = 0;
        if (v8) {
          continue;
        }
        break;
      }
    }
  }
  return v7;
}

- (void)p_cacheDimensionsForHeight:(double *)a3 depth:(double *)a4 width:(double *)a5
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  if (!a3 && !a4 && !a5) {
    return;
  }
  if (a5) {
    *a5 = 0.0;
  }
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  uint64_t v8 = [(EQKitCompoundBox *)self childBoxes];
  uint64_t v9 = [(NSArray *)v8 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (!v9)
  {
    char v12 = 1;
    if (a3) {
      goto LABEL_34;
    }
    goto LABEL_36;
  }
  uint64_t v10 = v9;
  uint64_t v11 = *(void *)v25;
  char v12 = 1;
  do
  {
    uint64_t v13 = 0;
    do
    {
      if (*(void *)v25 != v11) {
        objc_enumerationMutation(v8);
      }
      long long v14 = *(void **)(*((void *)&v24 + 1) + 8 * v13);
      [v14 vsize];
      if (v15 == 0.0) {
        goto LABEL_24;
      }
      if (a3)
      {
        if ((v12 & 1) != 0 || (double v16 = *a3, [v14 height], v16 <= v17)) {
          [v14 height];
        }
        else {
          uint64_t v18 = *(void *)a3;
        }
        *(void *)a3 = v18;
      }
      if (a4)
      {
        if ((v12 & 1) != 0 || (double v19 = *a4, [v14 depth], v19 <= v20)) {
          [v14 depth];
        }
        else {
          uint64_t v21 = *(void *)a4;
        }
        char v12 = 0;
        *(void *)a4 = v21;
LABEL_24:
        if (!a5) {
          goto LABEL_26;
        }
LABEL_25:
        [v14 width];
        *a5 = v22 + *a5;
        goto LABEL_26;
      }
      char v12 = 0;
      if (a5) {
        goto LABEL_25;
      }
LABEL_26:
      ++v13;
    }
    while (v10 != v13);
    uint64_t v23 = [(NSArray *)v8 countByEnumeratingWithState:&v24 objects:v28 count:16];
    uint64_t v10 = v23;
  }
  while (v23);
  if (!a3) {
    goto LABEL_36;
  }
LABEL_34:
  if (v12) {
    *a3 = 0.0;
  }
LABEL_36:
  if (((a4 != 0) & v12) == 1) {
    *a4 = 0.0;
  }
}

- (CGRect)p_cacheErasableBounds
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  CGFloat x = *MEMORY[0x263F001A8];
  CGFloat y = *(double *)(MEMORY[0x263F001A8] + 8);
  CGFloat width = *(double *)(MEMORY[0x263F001A8] + 16);
  CGFloat height = *(double *)(MEMORY[0x263F001A8] + 24);
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  v6 = [(EQKitCompoundBox *)self childBoxes];
  uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v28;
    double v10 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v28 != v9) {
          objc_enumerationMutation(v6);
        }
        char v12 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        [v12 erasableBounds];
        CGFloat v14 = v13;
        CGFloat v16 = v15;
        CGFloat r2 = v17;
        double v19 = v10 + v18;
        [v12 width];
        double v26 = v20;
        v33.origin.CGFloat x = x;
        v33.origin.CGFloat y = y;
        v33.size.CGFloat width = width;
        v33.size.CGFloat height = height;
        if (CGRectIsEmpty(v33))
        {
          CGFloat x = v19;
          CGFloat y = v14;
          CGFloat width = v16;
          CGFloat height = r2;
        }
        else
        {
          v34.origin.CGFloat x = x;
          v34.origin.CGFloat y = y;
          v34.size.CGFloat width = width;
          v34.size.CGFloat height = height;
          v37.origin.CGFloat x = v19;
          v37.origin.CGFloat y = v14;
          v37.size.CGFloat width = v16;
          v37.size.CGFloat height = r2;
          CGRect v35 = CGRectUnion(v34, v37);
          CGFloat x = v35.origin.x;
          CGFloat y = v35.origin.y;
          CGFloat width = v35.size.width;
          CGFloat height = v35.size.height;
        }
        double v10 = v10 + v26;
      }
      uint64_t v8 = [(NSArray *)v6 countByEnumeratingWithState:&v27 objects:v31 count:16];
    }
    while (v8);
  }
  double v21 = x;
  double v22 = y;
  double v23 = width;
  double v24 = height;
  result.size.CGFloat height = v24;
  result.size.CGFloat width = v23;
  result.origin.CGFloat y = v22;
  result.origin.CGFloat x = v21;
  return result;
}

@end
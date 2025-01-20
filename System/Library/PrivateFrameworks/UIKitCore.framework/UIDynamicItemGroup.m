@interface UIDynamicItemGroup
- (CGAffineTransform)transform;
- (CGPoint)center;
- (CGRect)bounds;
- (NSArray)items;
- (UIDynamicItemGroup)initWithItems:(NSArray *)items;
- (void)setCenter:(CGPoint)a3;
- (void)setTransform:(CGAffineTransform *)a3;
@end

@implementation UIDynamicItemGroup

- (UIDynamicItemGroup)initWithItems:(NSArray *)items
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  v4 = items;
  v31.receiver = self;
  v31.super_class = (Class)UIDynamicItemGroup;
  v5 = [(UIDynamicItemGroup *)&v31 init];
  if (v5)
  {
    uint64_t v6 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
    itemsToOffsets = v5->_itemsToOffsets;
    v5->_itemsToOffsets = (NSMapTable *)v6;

    if ([(NSArray *)v4 count])
    {
      double v8 = unionRectOfItems(v4);
      v5->_center.x = v8 + v9 * 0.5;
      v5->_center.y = v11 + v10 * 0.5;
      long long v27 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      v12 = v4;
      uint64_t v13 = [(NSArray *)v12 countByEnumeratingWithState:&v27 objects:v32 count:16];
      if (v13)
      {
        uint64_t v14 = v13;
        uint64_t v15 = *(void *)v28;
        do
        {
          for (uint64_t i = 0; i != v14; ++i)
          {
            if (*(void *)v28 != v15) {
              objc_enumerationMutation(v12);
            }
            v17 = *(void **)(*((void *)&v27 + 1) + 8 * i);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v18 = (void *)MEMORY[0x1E4F1CA00];
              v19 = (objc_class *)objc_opt_class();
              v20 = NSStringFromClass(v19);
              [v18 raise:@"Invalid Argument", @"%@ cannot be initialized with items containing %@", v20, objc_opt_class() format];
            }
            v21 = v5->_itemsToOffsets;
            v22 = (void *)MEMORY[0x1E4F29238];
            [v17 center];
            v25 = objc_msgSend(v22, "valueWithCGPoint:", v23 - v5->_center.x, v24 - v5->_center.y);
            [(NSMapTable *)v21 setObject:v25 forKey:v17];
          }
          uint64_t v14 = [(NSArray *)v12 countByEnumeratingWithState:&v27 objects:v32 count:16];
        }
        while (v14);
      }
    }
  }

  return v5;
}

- (NSArray)items
{
  v2 = [(NSMapTable *)self->_itemsToOffsets keyEnumerator];
  v3 = [v2 allObjects];

  return (NSArray *)v3;
}

- (void)setCenter:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  double v5 = self->_center.x;
  double v6 = self->_center.y;
  self->_center = a3;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  v7 = [(UIDynamicItemGroup *)self items];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    double v10 = x - v5;
    double v11 = y - v6;
    uint64_t v12 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v18 != v12) {
          objc_enumerationMutation(v7);
        }
        uint64_t v14 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        [v14 center];
        objc_msgSend(v14, "setCenter:", v10 + v15, v11 + v16);
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v9);
  }
}

- (CGPoint)center
{
  double x = self->_center.x;
  double y = self->_center.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setTransform:(CGAffineTransform *)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  long long v5 = *(_OWORD *)&self->_transform.c;
  *(_OWORD *)&t1.a = *(_OWORD *)&self->_transform.a;
  *(_OWORD *)&t1.c = v5;
  *(_OWORD *)&t1.tdouble x = *(_OWORD *)&self->_transform.tx;
  long long v6 = *(_OWORD *)&a3->c;
  *(_OWORD *)&t2.a = *(_OWORD *)&a3->a;
  *(_OWORD *)&t2.c = v6;
  *(_OWORD *)&t2.tdouble x = *(_OWORD *)&a3->tx;
  if (!CGAffineTransformEqualToTransform(&t1, &t2))
  {
    long long v7 = *(_OWORD *)&a3->a;
    long long v8 = *(_OWORD *)&a3->tx;
    *(_OWORD *)&self->_transform.c = *(_OWORD *)&a3->c;
    *(_OWORD *)&self->_transform.tdouble x = v8;
    *(_OWORD *)&self->_transform.a = v7;
    uint64_t v9 = [(UIDynamicItemGroup *)self items];
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v22 objects:v28 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v23;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v23 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = *(void **)(*((void *)&v22 + 1) + 8 * i);
          objc_msgSend(v14, "center", v19);
          double v15 = [(NSMapTable *)self->_itemsToOffsets objectForKey:v14];
          [v15 CGPointValue];
          long long v19 = v16;
          double v20 = v17;

          objc_msgSend(v14, "setCenter:", vaddq_f64(vaddq_f64(*(float64x2_t *)&a3->tx, vaddq_f64(vmulq_n_f64(*(float64x2_t *)&a3->a, *(double *)&v19), vmulq_n_f64(*(float64x2_t *)&a3->c, v20))), (float64x2_t)self->_center));
          long long v18 = *(_OWORD *)&a3->c;
          v21[0] = *(_OWORD *)&a3->a;
          v21[1] = v18;
          v21[2] = *(_OWORD *)&a3->tx;
          [v14 setTransform:v21];
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v22 objects:v28 count:16];
      }
      while (v11);
    }
  }
}

- (CGRect)bounds
{
  v2 = [(UIDynamicItemGroup *)self items];
  unionRectOfItems(v2);
  double v4 = v3;
  double v6 = v5;

  double v7 = *MEMORY[0x1E4F1DAD8];
  double v8 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  double v9 = v4;
  double v10 = v6;
  result.size.height = v10;
  result.size.width = v9;
  result.origin.double y = v8;
  result.origin.double x = v7;
  return result;
}

- (CGAffineTransform)transform
{
  long long v3 = *(_OWORD *)&self[1].a;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self->tx;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tdouble x = *(_OWORD *)&self[1].c;
  return self;
}

- (void).cxx_destruct
{
}

@end
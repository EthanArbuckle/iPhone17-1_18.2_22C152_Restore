@interface _UIKBVoidSpace
- (_UIKBVoidSpace)init;
- (id)divideSpaceIntoNumberOfPieces:(unint64_t)a3;
- (void)addRect:(CGRect)a3;
@end

@implementation _UIKBVoidSpace

- (_UIKBVoidSpace)init
{
  v6.receiver = self;
  v6.super_class = (Class)_UIKBVoidSpace;
  v2 = [(_UIKBVoidSpace *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    distinctSpaces = v2->_distinctSpaces;
    v2->_distinctSpaces = v3;
  }
  return v2;
}

- (void)addRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  double MinX = CGRectGetMinX(a3);
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  v9 = self->_distinctSpaces;
  uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v25;
LABEL_3:
    uint64_t v13 = 0;
    while (1)
    {
      if (*(void *)v25 != v12) {
        objc_enumerationMutation(v9);
      }
      v14 = *(void **)(*((void *)&v24 + 1) + 8 * v13);
      objc_msgSend(v14, "CGRectValue", (void)v24);
      if (vabdd_f64(CGRectGetMaxX(v30), MinX) < 0.00000011920929) {
        break;
      }
      if (v11 == ++v13)
      {
        uint64_t v11 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v24 objects:v28 count:16];
        if (v11) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
    id v15 = v14;

    if (!v15) {
      goto LABEL_12;
    }
    [v15 CGRectValue];
    v33.origin.double x = x;
    v33.origin.double y = y;
    v33.size.double width = width;
    v33.size.double height = height;
    CGRect v32 = CGRectUnion(v31, v33);
    double v16 = v32.origin.x;
    double v17 = v32.origin.y;
    double v18 = v32.size.width;
    double v19 = v32.size.height;
    uint64_t v20 = [(NSMutableArray *)self->_distinctSpaces indexOfObject:v15];
    distinctSpaces = self->_distinctSpaces;
    v22 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGRect:", v16, v17, v18, v19);
    [(NSMutableArray *)distinctSpaces replaceObjectAtIndex:v20 withObject:v22];
  }
  else
  {
LABEL_9:

LABEL_12:
    v23 = self->_distinctSpaces;
    objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGRect:", x, y, width, height, (void)v24);
    id v15 = (id)objc_claimAutoreleasedReturnValue();
    [(NSMutableArray *)v23 addObject:v15];
  }
}

- (id)divideSpaceIntoNumberOfPieces:(unint64_t)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  v5 = [MEMORY[0x1E4F1CA48] array];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  objc_super v6 = self->_distinctSpaces;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v26 != v9) {
          objc_enumerationMutation(v6);
        }
        objc_msgSend(*(id *)(*((void *)&v25 + 1) + 8 * i), "CGRectValue", (void)v25);
        CGFloat v12 = v11;
        double v14 = v13;
        double v16 = v15;
        double v18 = v17;
        unint64_t v19 = [(NSMutableArray *)self->_distinctSpaces count];
        if (v16 > 0.0)
        {
          double v20 = v16 / (double)(a3 / v19);
          double v21 = v16;
          double v22 = v12;
          do
          {
            v32.origin.double x = v12;
            v32.origin.double y = v14;
            v32.size.double width = v16;
            v32.size.double height = v18;
            v33.origin.double x = v22;
            v33.origin.double y = v14;
            v33.size.double width = v20;
            v33.size.double height = v18;
            if (!CGRectContainsRect(v32, v33)) {
              break;
            }
            v23 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGRect:", v22, v14, v20, v18);
            [v5 addObject:v23];

            double v22 = v20 + v22;
            double v21 = v21 - v20;
          }
          while (v21 > 0.0);
        }
      }
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v8);
  }

  return v5;
}

- (void).cxx_destruct
{
}

@end
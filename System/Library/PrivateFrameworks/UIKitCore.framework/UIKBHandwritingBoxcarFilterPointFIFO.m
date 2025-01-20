@interface UIKBHandwritingBoxcarFilterPointFIFO
- (NSMutableArray)prevPoints;
- (UIKBHandwritingBoxcarFilterPointFIFO)initWithFIFO:(id)a3 width:(unint64_t)a4;
- (unint64_t)width;
- (void)addPoint:(id *)a3;
- (void)clear;
- (void)emitAveragedPoint;
- (void)flush;
- (void)setPrevPoints:(id)a3;
- (void)setWidth:(unint64_t)a3;
@end

@implementation UIKBHandwritingBoxcarFilterPointFIFO

- (UIKBHandwritingBoxcarFilterPointFIFO)initWithFIFO:(id)a3 width:(unint64_t)a4
{
  v9.receiver = self;
  v9.super_class = (Class)UIKBHandwritingBoxcarFilterPointFIFO;
  v5 = [(UIKBHandwritingPointFIFO *)&v9 initWithFIFO:a3];
  v6 = v5;
  if (v5)
  {
    [(UIKBHandwritingBoxcarFilterPointFIFO *)v5 setWidth:a4];
    v7 = [MEMORY[0x1E4F1CA48] array];
    [(UIKBHandwritingBoxcarFilterPointFIFO *)v6 setPrevPoints:v7];
  }
  return v6;
}

- (void)emitAveragedPoint
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  v3 = [(UIKBHandwritingBoxcarFilterPointFIFO *)self prevPoints];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v20;
    double v7 = 0.0;
    double v8 = 0.0;
    double v9 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v20 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v19 + 1) + 8 * i) UIKBHandwritingPointValue];
        double v9 = v9 + v11;
        double v8 = v8 + v12;
        double v7 = v7 + v13;
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v5);
  }
  else
  {
    double v7 = 0.0;
    double v8 = 0.0;
    double v9 = 0.0;
  }

  unint64_t v14 = [(UIKBHandwritingBoxcarFilterPointFIFO *)self width];
  double v15 = v9 / (double)v14;
  double v16 = v8 / (double)v14;
  double v17 = v7 / (double)v14;
  v18 = [(UIKBHandwritingBoxcarFilterPointFIFO *)self prevPoints];
  [v18 removeObjectAtIndex:0];

  -[UIKBHandwritingPointFIFO emitPoint:](self, "emitPoint:", v15, v16, v17);
}

- (void)addPoint:(id *)a3
{
  double v6 = v5;
  double v7 = v4;
  double v8 = v3;
  v10 = [(UIKBHandwritingBoxcarFilterPointFIFO *)self prevPoints];
  uint64_t v11 = [v10 count];

  if (v11)
  {
    double v12 = [(UIKBHandwritingBoxcarFilterPointFIFO *)self prevPoints];
    double v13 = [v12 lastObject];
    [v13 UIKBHandwritingPointValue];
    double v15 = v14;
    double v17 = v16;
    double v19 = v18;

    if (hypot(v15 - v8, v17 - v7) >= 2.0 || (double v20 = v6 - v19, v6 - v19 > 0.1))
    {
      long long v21 = [(UIKBHandwritingBoxcarFilterPointFIFO *)self prevPoints];
      long long v22 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithUIKBHandwritingPoint:", v8, v7, v6);
      [v21 addObject:v22];
    }
    v23 = [(UIKBHandwritingBoxcarFilterPointFIFO *)self prevPoints];
    uint64_t v24 = [v23 count];
    unint64_t v25 = [(UIKBHandwritingBoxcarFilterPointFIFO *)self width];

    if (v24 == v25)
    {
      [(UIKBHandwritingBoxcarFilterPointFIFO *)self emitAveragedPoint];
    }
  }
  else
  {
    v26 = [(UIKBHandwritingBoxcarFilterPointFIFO *)self prevPoints];
    v27 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithUIKBHandwritingPoint:", v8, v7, v6);
    [v26 addObject:v27];

    -[UIKBHandwritingPointFIFO emitPoint:](self, "emitPoint:", v8, v7, v6);
  }
}

- (void)flush
{
  double v3 = [(UIKBHandwritingBoxcarFilterPointFIFO *)self prevPoints];
  uint64_t v4 = [v3 count];
  unint64_t v5 = [(UIKBHandwritingBoxcarFilterPointFIFO *)self width];

  if (v4 == v5) {
    [(UIKBHandwritingBoxcarFilterPointFIFO *)self emitAveragedPoint];
  }
  double v6 = [(UIKBHandwritingBoxcarFilterPointFIFO *)self prevPoints];
  uint64_t v7 = [v6 count];

  if (v7)
  {
    double v8 = [(UIKBHandwritingBoxcarFilterPointFIFO *)self prevPoints];
    double v9 = [v8 lastObject];
    [v9 UIKBHandwritingPointValue];
    -[UIKBHandwritingPointFIFO emitPoint:](self, "emitPoint:");
  }
  v10 = [(UIKBHandwritingBoxcarFilterPointFIFO *)self prevPoints];
  [v10 removeAllObjects];

  v11.receiver = self;
  v11.super_class = (Class)UIKBHandwritingBoxcarFilterPointFIFO;
  [(UIKBHandwritingPointFIFO *)&v11 flush];
}

- (void)clear
{
  double v3 = [(UIKBHandwritingBoxcarFilterPointFIFO *)self prevPoints];
  [v3 removeAllObjects];

  v4.receiver = self;
  v4.super_class = (Class)UIKBHandwritingBoxcarFilterPointFIFO;
  [(UIKBHandwritingPointFIFO *)&v4 clear];
}

- (NSMutableArray)prevPoints
{
  return self->_prevPoints;
}

- (void)setPrevPoints:(id)a3
{
}

- (unint64_t)width
{
  return self->_width;
}

- (void)setWidth:(unint64_t)a3
{
  self->_width = a3;
}

- (void).cxx_destruct
{
}

@end
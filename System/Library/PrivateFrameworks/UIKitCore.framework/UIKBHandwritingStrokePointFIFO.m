@interface UIKBHandwritingStrokePointFIFO
- (TIHandwritingStrokes)strokes;
- (UIKBHandwritingStrokePointFIFO)initWithFIFO:(id)a3;
- (id)scaleStrokes:(double)a3;
- (void)addPoint:(id *)a3;
- (void)clear;
- (void)flush;
- (void)setStrokes:(id)a3;
@end

@implementation UIKBHandwritingStrokePointFIFO

- (UIKBHandwritingStrokePointFIFO)initWithFIFO:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)UIKBHandwritingStrokePointFIFO;
  v3 = [(UIKBHandwritingPointFIFO *)&v6 initWithFIFO:a3];
  if (v3)
  {
    v4 = objc_opt_new();
    [(UIKBHandwritingStrokePointFIFO *)v3 setStrokes:v4];
  }
  return v3;
}

- (void)addPoint:(id *)a3
{
  double v6 = v5;
  double v7 = v4;
  double v8 = v3;
  v10 = [(UIKBHandwritingStrokePointFIFO *)self strokes];
  objc_msgSend(v10, "addPoint:", v8, v7);

  v11.receiver = self;
  v11.super_class = (Class)UIKBHandwritingStrokePointFIFO;
  -[UIKBHandwritingPointFIFO addPoint:](&v11, sel_addPoint_, v8, v7, v6);
}

- (void)flush
{
  double v3 = [(UIKBHandwritingStrokePointFIFO *)self strokes];
  [v3 endStroke];

  v4.receiver = self;
  v4.super_class = (Class)UIKBHandwritingStrokePointFIFO;
  [(UIKBHandwritingPointFIFO *)&v4 flush];
}

- (void)clear
{
  double v3 = [(UIKBHandwritingStrokePointFIFO *)self strokes];
  [v3 removeAllStrokes];

  v4.receiver = self;
  v4.super_class = (Class)UIKBHandwritingStrokePointFIFO;
  [(UIKBHandwritingPointFIFO *)&v4 clear];
}

- (id)scaleStrokes:(double)a3
{
  if (a3 == 1.0)
  {
    id v5 = [(UIKBHandwritingStrokePointFIFO *)self strokes];
  }
  else
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4FAE2B8]);
    double v6 = [(UIKBHandwritingStrokePointFIFO *)self strokes];
    uint64_t v7 = [v6 numberOfStrokes];

    if (v7)
    {
      unint64_t v8 = 0;
      do
      {
        v9 = [(UIKBHandwritingStrokePointFIFO *)self strokes];
        uint64_t v10 = [v9 numberOfPointsInStrokeAtIndex:v8];

        if (v10)
        {
          for (uint64_t i = 0; i != v10; ++i)
          {
            v12 = [(UIKBHandwritingStrokePointFIFO *)self strokes];
            [v12 pointAtIndex:i inStrokeAtIndex:v8];
            double v14 = v13;
            double v16 = v15;

            objc_msgSend(v5, "addPoint:", v14 * a3, v16 * a3);
          }
        }
        [v5 endStroke];
        ++v8;
        v17 = [(UIKBHandwritingStrokePointFIFO *)self strokes];
        unint64_t v18 = [v17 numberOfStrokes];
      }
      while (v8 < v18);
    }
  }
  return v5;
}

- (TIHandwritingStrokes)strokes
{
  return self->_strokes;
}

- (void)setStrokes:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
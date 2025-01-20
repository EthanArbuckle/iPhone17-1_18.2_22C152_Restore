@interface UIKBHandwritingQuadCurvePointFIFO
- ($89C9DF7554150EC42DA90319EED2ADED)lastPoint;
- (NSMutableArray)prevPoints;
- (UIKBHandwritingQuadCurvePointFIFO)initWithFIFO:(id)a3 scale:(double)a4;
- (double)scale;
- (id)emissionHandler;
- (void)addPoint:(id *)a3;
- (void)clear;
- (void)flush;
- (void)setEmissionHandler:(id)a3;
- (void)setLastPoint:(id *)a3;
- (void)setPrevPoints:(id)a3;
- (void)setScale:(double)a3;
@end

@implementation UIKBHandwritingQuadCurvePointFIFO

- (UIKBHandwritingQuadCurvePointFIFO)initWithFIFO:(id)a3 scale:(double)a4
{
  v9.receiver = self;
  v9.super_class = (Class)UIKBHandwritingQuadCurvePointFIFO;
  v5 = [(UIKBHandwritingPointFIFO *)&v9 initWithFIFO:a3];
  v6 = v5;
  if (v5)
  {
    v5->_scale = a4;
    v7 = [MEMORY[0x1E4F1CA48] array];
    [(UIKBHandwritingQuadCurvePointFIFO *)v6 setPrevPoints:v7];
  }
  return v6;
}

- (void)addPoint:(id *)a3
{
  double v6 = v5;
  double v7 = v4;
  double v8 = v3;
  v61[1] = *MEMORY[0x1E4F143B8];
  v10 = [(UIKBHandwritingQuadCurvePointFIFO *)self prevPoints];
  v11 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithUIKBHandwritingPoint:", v8, v7, v6);
  [v10 addObject:v11];

  v12 = [(UIKBHandwritingQuadCurvePointFIFO *)self prevPoints];
  uint64_t v13 = [v12 count];

  if (v13 == 1)
  {
    -[UIKBHandwritingQuadCurvePointFIFO setLastPoint:](self, "setLastPoint:", v8, v7, v6);
    emissionHandler = (void (**)(id, void *))self->_emissionHandler;
    if (emissionHandler)
    {
      v15 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithUIKBHandwritingPoint:", v8, v7, v6);
      v61[0] = v15;
      v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v61 count:1];
      emissionHandler[2](emissionHandler, v16);
    }
  }
  else
  {
    v17 = [(UIKBHandwritingQuadCurvePointFIFO *)self prevPoints];
    uint64_t v18 = [v17 count];

    if (v18 == 3)
    {
      [(UIKBHandwritingQuadCurvePointFIFO *)self lastPoint];
      double v20 = v19;
      double v22 = v21;
      double v57 = v23;
      v24 = [(UIKBHandwritingQuadCurvePointFIFO *)self prevPoints];
      v25 = [v24 objectAtIndexedSubscript:1];
      [v25 UIKBHandwritingPointValue];
      double v27 = v26;
      double v29 = v28;
      double v31 = v30;

      v32 = [(UIKBHandwritingQuadCurvePointFIFO *)self prevPoints];
      v33 = [v32 objectAtIndexedSubscript:2];
      [v33 UIKBHandwritingPointValue];
      double v35 = v34;
      double v37 = v36;
      id v58 = v38;

      double v39 = (v27 + v35) * 0.5;
      double v40 = v29;
      double v41 = (v29 + v37) * 0.5;
      double v56 = v31;
      double v42 = (v31 + *(double *)&v58) * 0.5;
      v43 = [(UIKBHandwritingQuadCurvePointFIFO *)self prevPoints];
      [v43 removeObjectAtIndex:0];

      double v44 = v20;
      long double v45 = v20 - v27;
      double v46 = v22;
      double v59 = hypot(v45, v22 - v40);
      double v47 = v27;
      double v48 = (v59 + hypot(v27 - v39, v40 - v41)) * self->_scale;
      id v60 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:vcvtmd_u64_f64(v48)];
      if (v48 > 1.0)
      {
        int v49 = 2;
        do
        {
          float v50 = (float)(v49 - 1) / v48;
          float v51 = 1.0 - v50;
          v52 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithUIKBHandwritingPoint:", v39 * (float)(v50 * v50) + v44 * (float)(v51 * v51) + v47 * (float)((float)(v51 + v51) * v50), v41 * (float)(v50 * v50) + v46 * (float)(v51 * v51) + v40 * (float)((float)(v51 + v51) * v50), v42 * (float)(v50 * v50) + v57 * (float)(v51 * v51) + v56 * (float)((float)(v51 + v51) * v50));
          [v60 addObject:v52];

          double v53 = (double)v49++;
        }
        while (v48 > v53);
      }
      v54 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithUIKBHandwritingPoint:", v39, v41, v42);
      [v60 addObject:v54];

      -[UIKBHandwritingQuadCurvePointFIFO setLastPoint:](self, "setLastPoint:", v39, v41, v42);
      v55 = (void (**)(id, id))self->_emissionHandler;
      if (v55) {
        v55[2](v55, v60);
      }
    }
  }
}

- (void)flush
{
  double v3 = [(UIKBHandwritingQuadCurvePointFIFO *)self prevPoints];
  uint64_t v4 = [v3 count];

  if (v4)
  {
    [(UIKBHandwritingQuadCurvePointFIFO *)self lastPoint];
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;
    v11 = [(UIKBHandwritingQuadCurvePointFIFO *)self prevPoints];
    v12 = [v11 lastObject];
    [v12 UIKBHandwritingPointValue];
    double v14 = v13;
    double v16 = v15;
    double v28 = v17;

    double v27 = v14;
    double v18 = hypot(v14 - v6, v16 - v8) * self->_scale;
    double v19 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:vcvtmd_u64_f64(v18)];
    double v20 = 1.0;
    if (v18 > 1.0)
    {
      int v21 = 2;
      do
      {
        float v22 = v20 / v18;
        double v23 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithUIKBHandwritingPoint:", v6 + (v14 - v6) * v22, v8 + (v16 - v8) * v22, v10 + (v28 - v10) * v22, *(void *)&v27);
        [v19 addObject:v23];

        double v20 = (double)v21++;
      }
      while (v18 > v20);
    }
    v24 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithUIKBHandwritingPoint:", v27, v16, v28, *(void *)&v27);
    [v19 addObject:v24];

    v25 = [(UIKBHandwritingQuadCurvePointFIFO *)self prevPoints];
    [v25 removeAllObjects];

    emissionHandler = (void (**)(id, void *))self->_emissionHandler;
    if (emissionHandler) {
      emissionHandler[2](emissionHandler, v19);
    }
  }
  v29.receiver = self;
  v29.super_class = (Class)UIKBHandwritingQuadCurvePointFIFO;
  [(UIKBHandwritingPointFIFO *)&v29 flush];
}

- (void)clear
{
  double v3 = [(UIKBHandwritingQuadCurvePointFIFO *)self prevPoints];
  [v3 removeAllObjects];

  v4.receiver = self;
  v4.super_class = (Class)UIKBHandwritingQuadCurvePointFIFO;
  [(UIKBHandwritingPointFIFO *)&v4 clear];
}

- (id)emissionHandler
{
  return objc_getProperty(self, a2, 16, 1);
}

- (void)setEmissionHandler:(id)a3
{
}

- (double)scale
{
  return self->_scale;
}

- (void)setScale:(double)a3
{
  self->_scale = a3;
}

- (NSMutableArray)prevPoints
{
  return self->_prevPoints;
}

- (void)setPrevPoints:(id)a3
{
}

- ($89C9DF7554150EC42DA90319EED2ADED)lastPoint
{
  return self;
}

- (void)setLastPoint:(id *)a3
{
  self->_lastPoint.point.x = v3;
  self->_lastPoint.point.y = v4;
  self->_lastPoint.force = v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_prevPoints, 0);
  objc_storeStrong(&self->_emissionHandler, 0);
}

@end
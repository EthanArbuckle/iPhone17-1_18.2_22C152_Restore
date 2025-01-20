@interface TUIKBHandwritingQuadCurvePointFIFO
- ($A3FDCF30DC384BE5088F648E7E6F3572)lastPoint;
- (NSMutableArray)prevPoints;
- (TUIKBHandwritingQuadCurvePointFIFO)initWithFIFO:(id)a3 scale:(double)a4;
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

@implementation TUIKBHandwritingQuadCurvePointFIFO

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_prevPoints, 0);
  objc_storeStrong(&self->_emissionHandler, 0);
}

- (void)setLastPoint:(id *)a3
{
  self->_lastPoint.point.x = v3;
  self->_lastPoint.point.y = v4;
  self->_lastPoint.force = v5;
}

- ($A3FDCF30DC384BE5088F648E7E6F3572)lastPoint
{
  return self;
}

- (void)setPrevPoints:(id)a3
{
}

- (NSMutableArray)prevPoints
{
  return self->_prevPoints;
}

- (void)setScale:(double)a3
{
  self->_scale = a3;
}

- (double)scale
{
  return self->_scale;
}

- (void)setEmissionHandler:(id)a3
{
}

- (id)emissionHandler
{
  return objc_getProperty(self, a2, 16, 1);
}

- (void)clear
{
  CGFloat v3 = [(TUIKBHandwritingQuadCurvePointFIFO *)self prevPoints];
  [v3 removeAllObjects];

  v4.receiver = self;
  v4.super_class = (Class)TUIKBHandwritingQuadCurvePointFIFO;
  [(TUIKBHandwritingPointFIFO *)&v4 clear];
}

- (void)flush
{
  CGFloat v3 = [(TUIKBHandwritingQuadCurvePointFIFO *)self prevPoints];
  uint64_t v4 = [v3 count];

  if (v4)
  {
    [(TUIKBHandwritingQuadCurvePointFIFO *)self lastPoint];
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;
    v11 = [(TUIKBHandwritingQuadCurvePointFIFO *)self prevPoints];
    v12 = [v11 lastObject];
    [v12 TUIKBHandwritingPointValue];
    double v14 = v13;
    double v16 = v15;
    double v28 = v17;

    double v27 = v14;
    double v18 = hypot(v14 - v6, v16 - v8) * self->_scale;
    v19 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:vcvtmd_u64_f64(v18)];
    double v20 = 1.0;
    if (v18 > 1.0)
    {
      int v21 = 2;
      do
      {
        float v22 = v20 / v18;
        v23 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithTUIKBHandwritingPoint:", v6 + (v14 - v6) * v22, v8 + (v16 - v8) * v22, v10 + (v28 - v10) * v22, *(void *)&v27);
        [v19 addObject:v23];

        double v20 = (double)v21++;
      }
      while (v18 > v20);
    }
    v24 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithTUIKBHandwritingPoint:", v27, v16, v28, *(void *)&v27);
    [v19 addObject:v24];

    v25 = [(TUIKBHandwritingQuadCurvePointFIFO *)self prevPoints];
    [v25 removeAllObjects];

    emissionHandler = (void (**)(id, void *))self->_emissionHandler;
    if (emissionHandler) {
      emissionHandler[2](emissionHandler, v19);
    }
  }
  v29.receiver = self;
  v29.super_class = (Class)TUIKBHandwritingQuadCurvePointFIFO;
  [(TUIKBHandwritingPointFIFO *)&v29 flush];
}

- (void)addPoint:(id *)a3
{
  double v6 = v5;
  double v7 = v4;
  double v8 = v3;
  v57[1] = *MEMORY[0x1E4F143B8];
  double v10 = [(TUIKBHandwritingQuadCurvePointFIFO *)self prevPoints];
  v11 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithTUIKBHandwritingPoint:", v8, v7, v6);
  [v10 addObject:v11];

  v12 = [(TUIKBHandwritingQuadCurvePointFIFO *)self prevPoints];
  uint64_t v13 = [v12 count];

  if (v13 == 1)
  {
    -[TUIKBHandwritingQuadCurvePointFIFO setLastPoint:](self, "setLastPoint:", v8, v7, v6);
    emissionHandler = (void (**)(id, void *))self->_emissionHandler;
    if (emissionHandler)
    {
      double v15 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithTUIKBHandwritingPoint:", v8, v7, v6);
      v57[0] = v15;
      double v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v57 count:1];
      emissionHandler[2](emissionHandler, v16);
    }
  }
  else
  {
    double v17 = [(TUIKBHandwritingQuadCurvePointFIFO *)self prevPoints];
    uint64_t v18 = [v17 count];

    if (v18 == 3)
    {
      [(TUIKBHandwritingQuadCurvePointFIFO *)self lastPoint];
      double v20 = v19;
      double v52 = v21;
      double v54 = v22;
      v23 = [(TUIKBHandwritingQuadCurvePointFIFO *)self prevPoints];
      v24 = [v23 objectAtIndexedSubscript:1];
      [v24 TUIKBHandwritingPointValue];
      double v26 = v25;
      double v28 = v27;
      double v30 = v29;

      v31 = [(TUIKBHandwritingQuadCurvePointFIFO *)self prevPoints];
      v32 = [v31 objectAtIndexedSubscript:2];
      [v32 TUIKBHandwritingPointValue];
      double v34 = v33;
      double v36 = v35;
      double v38 = v37;

      double v39 = (v28 + v36) * 0.5;
      double v53 = v30;
      double v40 = (v30 + v38) * 0.5;
      v41 = [(TUIKBHandwritingQuadCurvePointFIFO *)self prevPoints];
      [v41 removeObjectAtIndex:0];

      double v55 = hypot(v20 - v26, v52 - v28);
      double v42 = (v26 + v34) * 0.5;
      double v43 = v28;
      double v44 = (v55 + hypot(v26 - v42, v28 - v39)) * self->_scale;
      id v56 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:vcvtmd_u64_f64(v44)];
      if (v44 > 1.0)
      {
        int v45 = 2;
        do
        {
          float v46 = (float)(v45 - 1) / v44;
          float v47 = 1.0 - v46;
          v48 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithTUIKBHandwritingPoint:", v26 * (float)((float)(v47 + v47) * v46) + (float)(v47 * v47) * v20 + (float)(v46 * v46) * v42, v43 * (float)((float)(v47 + v47) * v46) + (float)(v47 * v47) * v52 + (float)(v46 * v46) * v39, v53 * (float)((float)(v47 + v47) * v46) + (float)(v47 * v47) * v54 + (float)(v46 * v46) * v40);
          [v56 addObject:v48];

          double v49 = (double)v45++;
        }
        while (v44 > v49);
      }
      v50 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithTUIKBHandwritingPoint:", v42, v39, v40);
      [v56 addObject:v50];

      -[TUIKBHandwritingQuadCurvePointFIFO setLastPoint:](self, "setLastPoint:", v42, v39, v40);
      v51 = (void (**)(id, id))self->_emissionHandler;
      if (v51) {
        v51[2](v51, v56);
      }
    }
  }
}

- (TUIKBHandwritingQuadCurvePointFIFO)initWithFIFO:(id)a3 scale:(double)a4
{
  v9.receiver = self;
  v9.super_class = (Class)TUIKBHandwritingQuadCurvePointFIFO;
  double v5 = [(TUIKBHandwritingPointFIFO *)&v9 initWithFIFO:a3];
  double v6 = v5;
  if (v5)
  {
    v5->_scale = a4;
    double v7 = [MEMORY[0x1E4F1CA48] array];
    [(TUIKBHandwritingQuadCurvePointFIFO *)v6 setPrevPoints:v7];
  }
  return v6;
}

@end
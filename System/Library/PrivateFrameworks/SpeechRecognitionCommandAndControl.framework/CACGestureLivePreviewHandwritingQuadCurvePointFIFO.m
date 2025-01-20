@interface CACGestureLivePreviewHandwritingQuadCurvePointFIFO
- ($8F6F21C65DCD0A0F8AC24DFE540A6236)lastPoint;
- (CACGestureLivePreviewHandwritingQuadCurvePointFIFO)initWithFIFO:(id)a3 scale:(double)a4;
- (NSMutableArray)prevPoints;
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

@implementation CACGestureLivePreviewHandwritingQuadCurvePointFIFO

- (CACGestureLivePreviewHandwritingQuadCurvePointFIFO)initWithFIFO:(id)a3 scale:(double)a4
{
  v9.receiver = self;
  v9.super_class = (Class)CACGestureLivePreviewHandwritingQuadCurvePointFIFO;
  v5 = [(CACGestureLivePreviewHandwritingPointFIFO *)&v9 initWithFIFO:a3];
  v6 = v5;
  if (v5)
  {
    v5->_scale = a4;
    v7 = [MEMORY[0x263EFF980] array];
    [(CACGestureLivePreviewHandwritingQuadCurvePointFIFO *)v6 setPrevPoints:v7];
  }
  return v6;
}

- (void)addPoint:(id *)a3
{
  double v6 = v5;
  double v7 = v4;
  double v8 = v3;
  v56[1] = *MEMORY[0x263EF8340];
  v10 = [(CACGestureLivePreviewHandwritingQuadCurvePointFIFO *)self prevPoints];
  v11 = objc_msgSend(MEMORY[0x263F08D40], "valueWithCACGestureLivePreviewHandwritingPoint:", v8, v7, v6);
  [v10 addObject:v11];

  v12 = [(CACGestureLivePreviewHandwritingQuadCurvePointFIFO *)self prevPoints];
  uint64_t v13 = [v12 count];

  if (v13 == 1)
  {
    -[CACGestureLivePreviewHandwritingQuadCurvePointFIFO setLastPoint:](self, "setLastPoint:", v8, v7, v6);
    emissionHandler = (void (**)(id, void *))self->_emissionHandler;
    if (emissionHandler)
    {
      v15 = objc_msgSend(MEMORY[0x263F08D40], "valueWithCACGestureLivePreviewHandwritingPoint:", v8, v7, v6);
      v56[0] = v15;
      v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:v56 count:1];
      emissionHandler[2](emissionHandler, v16);
    }
  }
  else
  {
    v17 = [(CACGestureLivePreviewHandwritingQuadCurvePointFIFO *)self prevPoints];
    uint64_t v18 = [v17 count];

    if (v18 == 3)
    {
      [(CACGestureLivePreviewHandwritingQuadCurvePointFIFO *)self lastPoint];
      double v20 = v19;
      double v51 = v21;
      double v53 = v22;
      v23 = [(CACGestureLivePreviewHandwritingQuadCurvePointFIFO *)self prevPoints];
      v24 = [v23 objectAtIndexedSubscript:1];
      [v24 CACGestureLivePreviewHandwritingPointValue];
      double v26 = v25;
      double v28 = v27;
      double v30 = v29;

      v31 = [(CACGestureLivePreviewHandwritingQuadCurvePointFIFO *)self prevPoints];
      v32 = [v31 objectAtIndexedSubscript:2];
      [v32 CACGestureLivePreviewHandwritingPointValue];
      double v34 = v33;
      double v36 = v35;
      double v38 = v37;

      double v39 = (v28 + v36) * 0.5;
      double v52 = v30;
      double v40 = (v30 + v38) * 0.5;
      v41 = [(CACGestureLivePreviewHandwritingQuadCurvePointFIFO *)self prevPoints];
      [v41 removeObjectAtIndex:0];

      double v54 = hypot(v20 - v26, v51 - v28);
      double v42 = (v26 + v34) * 0.5;
      double v43 = v28;
      double v44 = (v54 + hypot(v26 - v42, v28 - v39)) * self->_scale;
      id v55 = [MEMORY[0x263EFF980] arrayWithCapacity:vcvtmd_u64_f64(v44)];
      if (v44 > 1.0)
      {
        int v45 = 1;
        do
        {
          float v46 = (float)v45 / v44;
          float v47 = 1.0 - v46;
          v48 = objc_msgSend(MEMORY[0x263F08D40], "valueWithCACGestureLivePreviewHandwritingPoint:", v26 * (float)((float)(v47 + v47) * v46) + (float)(v47 * v47) * v20 + (float)(v46 * v46) * v42, v43 * (float)((float)(v47 + v47) * v46) + (float)(v47 * v47) * v51 + (float)(v46 * v46) * v39, v52 * (float)((float)(v47 + v47) * v46) + (float)(v47 * v47) * v53 + (float)(v46 * v46) * v40);
          [v55 addObject:v48];

          ++v45;
        }
        while (v44 > (double)v45);
      }
      v49 = objc_msgSend(MEMORY[0x263F08D40], "valueWithCACGestureLivePreviewHandwritingPoint:", v42, v39, v40);
      [v55 addObject:v49];

      -[CACGestureLivePreviewHandwritingQuadCurvePointFIFO setLastPoint:](self, "setLastPoint:", v42, v39, v40);
      v50 = (void (**)(id, id))self->_emissionHandler;
      if (v50) {
        v50[2](v50, v55);
      }
    }
  }
}

- (void)flush
{
  double v3 = [(CACGestureLivePreviewHandwritingQuadCurvePointFIFO *)self prevPoints];
  uint64_t v4 = [v3 count];

  if (v4)
  {
    [(CACGestureLivePreviewHandwritingQuadCurvePointFIFO *)self lastPoint];
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;
    v11 = [(CACGestureLivePreviewHandwritingQuadCurvePointFIFO *)self prevPoints];
    v12 = [v11 lastObject];
    [v12 CACGestureLivePreviewHandwritingPointValue];
    double v14 = v13;
    double v16 = v15;
    double v28 = v17;

    double v27 = v14;
    double v18 = hypot(v14 - v6, v16 - v8) * self->_scale;
    double v19 = [MEMORY[0x263EFF980] arrayWithCapacity:vcvtmd_u64_f64(v18)];
    double v20 = 1.0;
    if (v18 > 1.0)
    {
      int v21 = 2;
      do
      {
        float v22 = v20 / v18;
        v23 = objc_msgSend(MEMORY[0x263F08D40], "valueWithCACGestureLivePreviewHandwritingPoint:", v6 + (v14 - v6) * v22, v8 + (v16 - v8) * v22, v10 + (v28 - v10) * v22, *(void *)&v27);
        [v19 addObject:v23];

        double v20 = (double)v21++;
      }
      while (v18 > v20);
    }
    v24 = objc_msgSend(MEMORY[0x263F08D40], "valueWithCACGestureLivePreviewHandwritingPoint:", v27, v16, v28, *(void *)&v27);
    [v19 addObject:v24];

    double v25 = [(CACGestureLivePreviewHandwritingQuadCurvePointFIFO *)self prevPoints];
    [v25 removeAllObjects];

    emissionHandler = (void (**)(id, void *))self->_emissionHandler;
    if (emissionHandler) {
      emissionHandler[2](emissionHandler, v19);
    }
  }
  v29.receiver = self;
  v29.super_class = (Class)CACGestureLivePreviewHandwritingQuadCurvePointFIFO;
  [(CACGestureLivePreviewHandwritingPointFIFO *)&v29 flush];
}

- (void)clear
{
  double v3 = [(CACGestureLivePreviewHandwritingQuadCurvePointFIFO *)self prevPoints];
  [v3 removeAllObjects];

  v4.receiver = self;
  v4.super_class = (Class)CACGestureLivePreviewHandwritingQuadCurvePointFIFO;
  [(CACGestureLivePreviewHandwritingPointFIFO *)&v4 clear];
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

- ($8F6F21C65DCD0A0F8AC24DFE540A6236)lastPoint
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
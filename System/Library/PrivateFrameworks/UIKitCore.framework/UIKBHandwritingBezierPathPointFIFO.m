@interface UIKBHandwritingBezierPathPointFIFO
- (NSMutableArray)prevPoints;
- (UIBezierPath)path;
- (UIKBHandwritingBezierPathPointFIFO)initWithFIFO:(id)a3;
- (id)emissionHandler;
- (void)addPoint:(id *)a3;
- (void)clear;
- (void)flush;
- (void)setEmissionHandler:(id)a3;
- (void)setPath:(id)a3;
- (void)setPrevPoints:(id)a3;
@end

@implementation UIKBHandwritingBezierPathPointFIFO

- (UIKBHandwritingBezierPathPointFIFO)initWithFIFO:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)UIKBHandwritingBezierPathPointFIFO;
  v3 = [(UIKBHandwritingPointFIFO *)&v7 initWithFIFO:a3];
  if (v3)
  {
    v4 = +[UIBezierPath bezierPath];
    [(UIKBHandwritingBezierPathPointFIFO *)v3 setPath:v4];

    v5 = [MEMORY[0x1E4F1CA48] array];
    [(UIKBHandwritingBezierPathPointFIFO *)v3 setPrevPoints:v5];
  }
  return v3;
}

- (void)addPoint:(id *)a3
{
  double v5 = v4;
  double v6 = v3;
  v70[2] = *MEMORY[0x1E4F143B8];
  v8 = [(UIKBHandwritingBezierPathPointFIFO *)self prevPoints];
  uint64_t v9 = [v8 count];

  if (!v9)
  {
    v10 = [(UIKBHandwritingBezierPathPointFIFO *)self path];
    [v10 removeAllPoints];
  }
  v11 = [(UIKBHandwritingBezierPathPointFIFO *)self prevPoints];
  v12 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGPoint:", v6, v5);
  [v11 addObject:v12];

  v13 = [(UIKBHandwritingBezierPathPointFIFO *)self prevPoints];
  uint64_t v14 = [v13 count];

  if (v14 == 1)
  {
    v15 = [(UIKBHandwritingBezierPathPointFIFO *)self path];
    objc_msgSend(v15, "moveToPoint:", v6, v5);

    emissionHandler = (void (**)(id, void *))self->_emissionHandler;
    if (emissionHandler)
    {
      id v68 = [(UIKBHandwritingBezierPathPointFIFO *)self prevPoints];
      v17 = (void *)[v68 copy];
      emissionHandler[2](emissionHandler, v17);
    }
  }
  else
  {
    v18 = [(UIKBHandwritingBezierPathPointFIFO *)self prevPoints];
    uint64_t v19 = [v18 count];

    v20 = [(UIKBHandwritingBezierPathPointFIFO *)self prevPoints];
    v21 = v20;
    if (v19 == 2)
    {
      v22 = [v20 objectAtIndexedSubscript:0];
      [v22 CGPointValue];
      double v24 = v23;
      double v26 = v25;

      v27 = [(UIKBHandwritingBezierPathPointFIFO *)self prevPoints];
      v28 = [v27 objectAtIndexedSubscript:1];
      [v28 CGPointValue];
      double v30 = v29;
      double v32 = v31;

      double v33 = (v24 + v30) * 0.5;
      double v34 = (v26 + v32) * 0.5;
      v35 = [(UIKBHandwritingBezierPathPointFIFO *)self path];
      objc_msgSend(v35, "addLineToPoint:", v33, v34);

      v36 = (void (**)(id, void *))self->_emissionHandler;
      if (v36)
      {
        v37 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGPoint:", v24, v26);
        v70[0] = v37;
        v38 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGPoint:", v33, v34);
        v70[1] = v38;
        v39 = [MEMORY[0x1E4F1C978] arrayWithObjects:v70 count:2];
        v36[2](v36, v39);
      }
    }
    else
    {
      uint64_t v40 = [v20 count];

      if (v40 == 3)
      {
        v41 = [(UIKBHandwritingBezierPathPointFIFO *)self prevPoints];
        v42 = [v41 objectAtIndexedSubscript:0];
        [v42 CGPointValue];
        double v44 = v43;
        double v46 = v45;

        v47 = [(UIKBHandwritingBezierPathPointFIFO *)self prevPoints];
        v48 = [v47 objectAtIndexedSubscript:1];
        [v48 CGPointValue];
        double v50 = v49;
        double v52 = v51;

        v53 = [(UIKBHandwritingBezierPathPointFIFO *)self prevPoints];
        v54 = [v53 objectAtIndexedSubscript:2];
        [v54 CGPointValue];
        double v56 = v55;
        double v58 = v57;

        double v59 = (v50 + v56) * 0.5;
        double v60 = (v52 + v58) * 0.5;
        v61 = [(UIKBHandwritingBezierPathPointFIFO *)self path];
        objc_msgSend(v61, "addQuadCurveToPoint:controlPoint:", v59, v60, v50, v52);

        v62 = [(UIKBHandwritingBezierPathPointFIFO *)self prevPoints];
        [v62 removeObjectAtIndex:0];

        v63 = (void (**)(id, void *))self->_emissionHandler;
        if (v63)
        {
          v64 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGPoint:", v44, v46);
          v69[0] = v64;
          v65 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGPoint:", v50, v52);
          v69[1] = v65;
          v66 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGPoint:", v59, v60);
          v69[2] = v66;
          v67 = [MEMORY[0x1E4F1C978] arrayWithObjects:v69 count:3];
          v63[2](v63, v67);
        }
      }
    }
  }
}

- (void)flush
{
  v21[2] = *MEMORY[0x1E4F143B8];
  double v3 = [(UIKBHandwritingBezierPathPointFIFO *)self path];
  [v3 currentPoint];
  double v5 = v4;
  double v7 = v6;

  v8 = [(UIKBHandwritingBezierPathPointFIFO *)self prevPoints];
  uint64_t v9 = [v8 lastObject];
  [v9 CGPointValue];
  double v11 = v10;
  double v13 = v12;

  uint64_t v14 = [(UIKBHandwritingBezierPathPointFIFO *)self path];
  objc_msgSend(v14, "addLineToPoint:", v11, v13);

  emissionHandler = (void (**)(id, void *))self->_emissionHandler;
  if (emissionHandler)
  {
    v16 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGPoint:", v5, v7);
    v21[0] = v16;
    v17 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGPoint:", v11, v13);
    v21[1] = v17;
    v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:2];
    emissionHandler[2](emissionHandler, v18);
  }
  uint64_t v19 = [(UIKBHandwritingBezierPathPointFIFO *)self prevPoints];
  [v19 removeAllObjects];

  v20.receiver = self;
  v20.super_class = (Class)UIKBHandwritingBezierPathPointFIFO;
  [(UIKBHandwritingPointFIFO *)&v20 flush];
}

- (void)clear
{
  double v3 = [(UIKBHandwritingBezierPathPointFIFO *)self prevPoints];
  [v3 removeAllObjects];

  double v4 = [(UIKBHandwritingBezierPathPointFIFO *)self path];
  [v4 removeAllPoints];

  v5.receiver = self;
  v5.super_class = (Class)UIKBHandwritingBezierPathPointFIFO;
  [(UIKBHandwritingPointFIFO *)&v5 clear];
}

- (UIBezierPath)path
{
  return self->_path;
}

- (void)setPath:(id)a3
{
}

- (id)emissionHandler
{
  return objc_getProperty(self, a2, 24, 1);
}

- (void)setEmissionHandler:(id)a3
{
}

- (NSMutableArray)prevPoints
{
  return self->_prevPoints;
}

- (void)setPrevPoints:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_prevPoints, 0);
  objc_storeStrong(&self->_emissionHandler, 0);
  objc_storeStrong((id *)&self->_path, 0);
}

@end
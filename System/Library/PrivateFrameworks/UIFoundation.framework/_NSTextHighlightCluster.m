@interface _NSTextHighlightCluster
- (BOOL)bottomNeighborExistsAtPoint:(uint64_t)a3 withinDistance:(double)a4 withLeftCornerExtensionDistance:(double)a5 withRightCornerExtensionDistance:(double)a6;
- (BOOL)topNeighborExistsAtPoint:(uint64_t)a3 withinDistance:(double)a4 withLeftCornerExtensionDistance:(double)a5 withRightCornerExtensionDistance:(double)a6;
- (uint64_t)addRunsWithTextRangeArray:(uint64_t)result;
- (void)accessBorderDict:(id)a3 forKey:(double)a4 usingBlock:(id)a5;
- (void)addToBorderDict:(id)a3 key:(double)a4 object:(CGRect)a5;
- (void)drawRunsUsingBlock:(uint64_t)a1;
- (void)initWithShapeProvider:(void *)a1;
- (void)registerMaxYOfRun:(id)a3;
- (void)registerMinYOfRun:(id)a3;
@end

@implementation _NSTextHighlightCluster

- (BOOL)topNeighborExistsAtPoint:(uint64_t)a3 withinDistance:(double)a4 withLeftCornerExtensionDistance:(double)a5 withRightCornerExtensionDistance:(double)a6
{
  if (!a1) {
    return 0;
  }
  v12 = *(void **)(a1 + 8);
  v13 = [NSNumber numberWithDouble:a5];
  v14 = [v12 objectForKey:v13];

  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x2020000000;
  char v21 = 0;
  if (v14 && [v14 count])
  {
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __132___NSTextHighlightCluster_topNeighborExistsAtPoint_withinDistance_withLeftCornerExtensionDistance_withRightCornerExtensionDistance___block_invoke;
    v17[3] = &unk_1E55C6E80;
    *(double *)&v17[6] = a4;
    *(double *)&v17[7] = a5;
    *(double *)&v17[8] = a6;
    v17[9] = a2;
    v17[10] = a3;
    v17[4] = a1;
    v17[5] = &v18;
    [v14 enumerateObjectsUsingBlock:v17];
  }
  BOOL v15 = *((unsigned char *)v19 + 24) != 0;
  _Block_object_dispose(&v18, 8);

  return v15;
}

- (BOOL)bottomNeighborExistsAtPoint:(uint64_t)a3 withinDistance:(double)a4 withLeftCornerExtensionDistance:(double)a5 withRightCornerExtensionDistance:(double)a6
{
  if (!a1) {
    return 0;
  }
  v12 = *(void **)(a1 + 16);
  v13 = [NSNumber numberWithDouble:a5];
  v14 = [v12 objectForKey:v13];

  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x2020000000;
  char v21 = 0;
  if (v14 && [v14 count])
  {
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __135___NSTextHighlightCluster_bottomNeighborExistsAtPoint_withinDistance_withLeftCornerExtensionDistance_withRightCornerExtensionDistance___block_invoke;
    v17[3] = &unk_1E55C6E80;
    *(double *)&v17[6] = a4;
    *(double *)&v17[7] = a5;
    *(double *)&v17[8] = a6;
    v17[9] = a2;
    v17[10] = a3;
    v17[4] = a1;
    v17[5] = &v18;
    [v14 enumerateObjectsUsingBlock:v17];
  }
  BOOL v15 = *((unsigned char *)v19 + 24) != 0;
  _Block_object_dispose(&v18, 8);

  return v15;
}

- (void)initWithShapeProvider:(void *)a1
{
  id v3 = a2;
  if (a1)
  {
    v12.receiver = a1;
    v12.super_class = (Class)_NSTextHighlightCluster;
    id v4 = objc_msgSendSuper2(&v12, sel_init);
    a1 = v4;
    if (v4)
    {
      objc_storeWeak((id *)v4 + 3, v3);
      uint64_t v5 = [MEMORY[0x1E4F1CA48] array];
      v6 = (void *)a1[4];
      a1[4] = v5;

      uint64_t v7 = [objc_alloc(MEMORY[0x1E4F28E10]) initWithKeyOptions:0 valueOptions:0 capacity:10];
      v8 = (void *)a1[1];
      a1[1] = v7;

      uint64_t v9 = [objc_alloc(MEMORY[0x1E4F28E10]) initWithKeyOptions:0 valueOptions:0 capacity:10];
      v10 = (void *)a1[2];
      a1[2] = v9;
    }
  }

  return a1;
}

- (uint64_t)addRunsWithTextRangeArray:(uint64_t)result
{
  if (result)
  {
    v2[0] = MEMORY[0x1E4F143A8];
    v2[1] = 3221225472;
    v2[2] = __53___NSTextHighlightCluster_addRunsWithTextRangeArray___block_invoke;
    v2[3] = &unk_1E55C6E30;
    v2[4] = result;
    return [a2 enumerateObjectsUsingBlock:v2];
  }
  return result;
}

- (void)addToBorderDict:(id)a3 key:(double)a4 object:(CGRect)a5
{
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  id v13 = a3;
  v10 = [NSNumber numberWithLong:(int)(a4 * 1000.0)];
  v11 = [v13 objectForKey:v10];
  if (!v11)
  {
    v11 = [MEMORY[0x1E4F1CA48] array];
    [v13 setObject:v11 forKey:v10];
  }
  objc_super v12 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithRect:", x, y, width, height);
  [v11 addObject:v12];
}

- (void)accessBorderDict:(id)a3 forKey:(double)a4 usingBlock:(id)a5
{
  id v7 = a5;
  v8 = NSNumber;
  id v9 = a3;
  v10 = [v8 numberWithLong:(int)(a4 * 1000.0)];
  v11 = [v9 objectForKey:v10];

  if (v11 && [v11 count])
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __62___NSTextHighlightCluster_accessBorderDict_forKey_usingBlock___block_invoke;
    v12[3] = &unk_1E55C6E58;
    id v13 = v7;
    [v11 enumerateObjectsUsingBlock:v12];
  }
}

- (void)registerMinYOfRun:(id)a3
{
  id v4 = (id *)a3;
  if (v4)
  {
    v33 = v4;
    if ([v4[7] count])
    {
      uint64_t v5 = NSNumber;
      uint64_t v6 = -[_NSTextHighlightRun firstSegment](v33);
      id v7 = (void *)v6;
      if (v6) {
        double v8 = *(double *)(v6 + 136);
      }
      else {
        double v8 = 0.0;
      }
      id v9 = [v5 numberWithDouble:v8];

      v10 = [(NSMapTable *)self->_topBordersOfRuns objectForKey:v9];
      if (!v10)
      {
        v10 = [MEMORY[0x1E4F1CA48] array];
        [(NSMapTable *)self->_topBordersOfRuns setObject:v10 forKey:v9];
      }
      v11 = (void *)MEMORY[0x1E4F29238];
      -[_NSTextHighlightRun firstSegment](v33);
      objc_super v12 = (double *)objc_claimAutoreleasedReturnValue();
      id v13 = v12;
      if (v12)
      {
        double v14 = v12[16];
        double v15 = v12[17];
        double v16 = v12[18];
        double v17 = v12[19];
      }
      else
      {
        double v15 = 0.0;
        double v16 = 0.0;
        double v17 = 0.0;
        double v14 = 0.0;
      }
      uint64_t v18 = objc_msgSend(v11, "valueWithRect:", v14, v15, v16, v17);
      [v10 addObject:v18];

      if ((unint64_t)[v33[7] count] >= 2)
      {
        v19 = NSNumber;
        uint64_t v20 = -[_NSTextHighlightRun secondSegment](v33);
        char v21 = (void *)v20;
        if (v20) {
          double v22 = *(double *)(v20 + 136);
        }
        else {
          double v22 = 0.0;
        }
        v23 = [v19 numberWithDouble:v22];

        v24 = [(NSMapTable *)self->_topBordersOfRuns objectForKey:v23];
        if (!v24)
        {
          v24 = [MEMORY[0x1E4F1CA48] array];
          [(NSMapTable *)self->_topBordersOfRuns setObject:v24 forKey:v23];
        }
        v25 = (void *)MEMORY[0x1E4F29238];
        -[_NSTextHighlightRun secondSegment](v33);
        v26 = (double *)objc_claimAutoreleasedReturnValue();
        v27 = v26;
        if (v26)
        {
          double v28 = v26[16];
          double v29 = v26[17];
          double v30 = v26[18];
          double v31 = v26[19];
        }
        else
        {
          double v29 = 0.0;
          double v30 = 0.0;
          double v31 = 0.0;
          double v28 = 0.0;
        }
        v32 = objc_msgSend(v25, "valueWithRect:", v28, v29, v30, v31);
        [v24 addObject:v32];
      }
    }
  }

  MEMORY[0x1F41817F8]();
}

- (void)registerMaxYOfRun:(id)a3
{
  id v4 = (id *)a3;
  if (v4)
  {
    v33 = v4;
    if ([v4[7] count])
    {
      uint64_t v5 = NSNumber;
      uint64_t v6 = -[_NSTextHighlightRun lastSegment](v33);
      id v7 = (void *)v6;
      if (v6) {
        double v8 = *(double *)(v6 + 136) + *(double *)(v6 + 152);
      }
      else {
        double v8 = 0.0;
      }
      id v9 = [v5 numberWithDouble:v8];

      v10 = [(NSMapTable *)self->_bottomBordersOfRuns objectForKey:v9];
      if (!v10)
      {
        v10 = [MEMORY[0x1E4F1CA48] array];
        [(NSMapTable *)self->_bottomBordersOfRuns setObject:v10 forKey:v9];
      }
      v11 = (void *)MEMORY[0x1E4F29238];
      -[_NSTextHighlightRun lastSegment](v33);
      objc_super v12 = (double *)objc_claimAutoreleasedReturnValue();
      id v13 = v12;
      if (v12)
      {
        double v14 = v12[16];
        double v15 = v12[17];
        double v16 = v12[18];
        double v17 = v12[19];
      }
      else
      {
        double v15 = 0.0;
        double v16 = 0.0;
        double v17 = 0.0;
        double v14 = 0.0;
      }
      uint64_t v18 = objc_msgSend(v11, "valueWithRect:", v14, v15, v16, v17);
      [v10 addObject:v18];

      if ((unint64_t)[v33[7] count] >= 2)
      {
        v19 = NSNumber;
        uint64_t v20 = -[_NSTextHighlightRun secondLastSegment](v33);
        char v21 = (void *)v20;
        if (v20) {
          double v22 = *(double *)(v20 + 136) + *(double *)(v20 + 152);
        }
        else {
          double v22 = 0.0;
        }
        v23 = [v19 numberWithDouble:v22];

        v24 = [(NSMapTable *)self->_bottomBordersOfRuns objectForKey:v23];
        if (!v24)
        {
          v24 = [MEMORY[0x1E4F1CA48] array];
          [(NSMapTable *)self->_bottomBordersOfRuns setObject:v24 forKey:v23];
        }
        v25 = (void *)MEMORY[0x1E4F29238];
        -[_NSTextHighlightRun secondLastSegment](v33);
        v26 = (double *)objc_claimAutoreleasedReturnValue();
        v27 = v26;
        if (v26)
        {
          double v28 = v26[16];
          double v29 = v26[17];
          double v30 = v26[18];
          double v31 = v26[19];
        }
        else
        {
          double v29 = 0.0;
          double v30 = 0.0;
          double v31 = 0.0;
          double v28 = 0.0;
        }
        v32 = objc_msgSend(v25, "valueWithRect:", v28, v29, v30, v31);
        [v24 addObject:v32];
      }
    }
  }

  MEMORY[0x1F41817F8]();
}

- (void)drawRunsUsingBlock:(uint64_t)a1
{
  id v3 = a2;
  id v4 = v3;
  if (a1)
  {
    uint64_t v5 = *(void **)(a1 + 32);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __46___NSTextHighlightCluster_drawRunsUsingBlock___block_invoke;
    v6[3] = &unk_1E55C6EA8;
    id v7 = v3;
    [v5 enumerateObjectsUsingBlock:v6];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_runs, 0);
  objc_destroyWeak((id *)&self->_shapeProvider);
  objc_storeStrong((id *)&self->_topBordersOfRuns, 0);

  objc_storeStrong((id *)&self->_bottomBordersOfRuns, 0);
}

@end
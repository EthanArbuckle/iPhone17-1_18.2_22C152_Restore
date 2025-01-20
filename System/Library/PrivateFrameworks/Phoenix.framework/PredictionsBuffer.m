@interface PredictionsBuffer
- ($7DEDF3842AEFB7F1E6DF5AF62E424A02)bestPredictionUsingPolicyOption:(int)a3;
- (PredictionsBuffer)initWithConfiguration:(id)a3;
- (id)description;
- (id)logBuffer;
- (id)predictionCounts;
- (void)addPrediction:(id)a3;
- (void)reset;
@end

@implementation PredictionsBuffer

- (PredictionsBuffer)initWithConfiguration:(id)a3
{
  v13 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = v13;
  v13 = 0;
  v11.receiver = v3;
  v11.super_class = (Class)PredictionsBuffer;
  v13 = [(PredictionsBuffer *)&v11 init];
  objc_storeStrong((id *)&v13, v13);
  if (v13)
  {
    id v10 = objc_alloc(MEMORY[0x263EFF980]);
    uint64_t v4 = objc_msgSend(v10, "initWithCapacity:", objc_msgSend(location[0], "maxPredictionBufferSize"));
    predictions = v13->_predictions;
    v13->_predictions = (NSMutableArray *)v4;

    objc_storeStrong((id *)&v13->_configuration, location[0]);
    uint64_t v6 = [objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:3];
    counts = v13->_counts;
    v13->_counts = (NSMutableArray *)v6;

    -[NSMutableArray setObject:atIndexedSubscript:](v13->_counts, "setObject:atIndexedSubscript:");
    [(NSMutableArray *)v13->_counts setObject:&unk_26EA41980 atIndexedSubscript:1];
    [(NSMutableArray *)v13->_counts setObject:&unk_26EA41980 atIndexedSubscript:2];
  }
  v9 = v13;
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v13, 0);
  return v9;
}

- (id)predictionCounts
{
  return self->_counts;
}

- (void)reset
{
}

- (void)addPrediction:(id)a3
{
  v48 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  unint64_t v45 = [(NSMutableArray *)v48->_predictions count];
  if (v45 >= [(AXPhoenixClassifierConfiguration *)v48->_configuration maxPredictionBufferSize])
  {
    id v46 = (id)[(NSMutableArray *)v48->_predictions objectAtIndex:0];
    uint64_t v44 = [v46 predictedClass];
    if (v44)
    {
      if (v44 == 1)
      {
        [v46 maxConfidence];
        double v39 = v7;
        [(AXPhoenixClassifierConfiguration *)v48->_configuration predictionConfidenceThreshold];
        double v9 = v8;
        double v3 = v39;
        if (v39 > v9)
        {
          v36 = NSNumber;
          id v38 = (id)[(NSMutableArray *)v48->_counts objectAtIndex:v39];
          id v37 = (id)objc_msgSend(v36, "numberWithUnsignedInteger:", objc_msgSend(v38, "unsignedIntegerValue") - 1);
          -[NSMutableArray setObject:atIndexedSubscript:](v48->_counts, "setObject:atIndexedSubscript:");
        }
      }
      else if (v44 == 2)
      {
        [v46 maxConfidence];
        double v35 = v10;
        [(AXPhoenixClassifierConfiguration *)v48->_configuration predictionConfidenceThreshold];
        double v12 = v11;
        double v3 = v35;
        if (v35 > v12)
        {
          v32 = NSNumber;
          id v34 = (id)[(NSMutableArray *)v48->_counts objectAtIndex:v35];
          id v33 = (id)objc_msgSend(v32, "numberWithUnsignedInteger:", objc_msgSend(v34, "unsignedIntegerValue") - 1);
          -[NSMutableArray setObject:atIndexedSubscript:](v48->_counts, "setObject:atIndexedSubscript:");
        }
      }
    }
    else
    {
      [v46 maxConfidence];
      double v43 = v4;
      [(AXPhoenixClassifierConfiguration *)v48->_configuration predictionConfidenceThreshold];
      double v6 = v5;
      double v3 = v43;
      if (v43 > v6)
      {
        v40 = NSNumber;
        id v42 = (id)[(NSMutableArray *)v48->_counts objectAtIndex:v43];
        id v41 = (id)objc_msgSend(v40, "numberWithUnsignedInteger:", objc_msgSend(v42, "unsignedIntegerValue") - 1);
        -[NSMutableArray setObject:atIndexedSubscript:](v48->_counts, "setObject:atIndexedSubscript:");
      }
    }
    -[NSMutableArray removeObjectAtIndex:](v48->_predictions, "removeObjectAtIndex:", 0, v3);
    objc_storeStrong(&v46, 0);
  }
  [(NSMutableArray *)v48->_predictions addObject:location[0]];
  uint64_t v31 = [location[0] predictedClass];
  if (v31)
  {
    if (v31 == 1)
    {
      [location[0] maxConfidence];
      double v26 = v15;
      [(AXPhoenixClassifierConfiguration *)v48->_configuration predictionConfidenceThreshold];
      if (v26 > v16)
      {
        v23 = NSNumber;
        id v25 = (id)[(NSMutableArray *)v48->_counts objectAtIndex:v26];
        id v24 = (id)objc_msgSend(v23, "numberWithUnsignedInteger:", objc_msgSend(v25, "unsignedIntegerValue") + 1);
        -[NSMutableArray setObject:atIndexedSubscript:](v48->_counts, "setObject:atIndexedSubscript:");
      }
    }
    else if (v31 == 2)
    {
      [location[0] maxConfidence];
      double v22 = v17;
      [(AXPhoenixClassifierConfiguration *)v48->_configuration predictionConfidenceThreshold];
      if (v22 > v18)
      {
        v19 = NSNumber;
        id v21 = (id)[(NSMutableArray *)v48->_counts objectAtIndex:v22];
        id v20 = (id)objc_msgSend(v19, "numberWithUnsignedInteger:", objc_msgSend(v21, "unsignedIntegerValue") + 1);
        -[NSMutableArray setObject:atIndexedSubscript:](v48->_counts, "setObject:atIndexedSubscript:");
      }
    }
  }
  else
  {
    [location[0] maxConfidence];
    double v30 = v13;
    [(AXPhoenixClassifierConfiguration *)v48->_configuration predictionConfidenceThreshold];
    if (v30 > v14)
    {
      v27 = NSNumber;
      id v29 = (id)[(NSMutableArray *)v48->_counts objectAtIndex:v30];
      id v28 = (id)objc_msgSend(v27, "numberWithUnsignedInteger:", objc_msgSend(v29, "unsignedIntegerValue") + 1);
      -[NSMutableArray setObject:atIndexedSubscript:](v48->_counts, "setObject:atIndexedSubscript:");
    }
  }
  objc_storeStrong(location, 0);
}

- ($7DEDF3842AEFB7F1E6DF5AF62E424A02)bestPredictionUsingPolicyOption:(int)a3
{
  char v13 = a3;
  uint64_t v12 = 0;
  id v9 = (id)[(NSMutableArray *)self->_counts objectAtIndexedSubscript:0];
  unint64_t v10 = [v9 unsignedIntegerValue];

  unint64_t v11 = v10;
  if (v13)
  {
    id v7 = (id)[(NSMutableArray *)self->_counts objectAtIndexedSubscript:1];
    unint64_t v8 = [v7 unsignedIntegerValue];

    if (v8 > v10)
    {
      unint64_t v11 = v8;
      uint64_t v12 = 1;
    }
  }
  if ((v13 & 2) != 0)
  {
    id v5 = (id)[(NSMutableArray *)self->_counts objectAtIndexedSubscript:2];
    unint64_t v6 = [v5 unsignedIntegerValue];

    if (v6 > v11)
    {
      unint64_t v11 = v6;
      uint64_t v12 = 2;
    }
  }
  unint64_t v3 = v12;
  unint64_t v4 = v11;
  result.var1 = v4;
  result.var0 = v3;
  return result;
}

- (id)logBuffer
{
  id v7 = self;
  v6[1] = (id)a2;
  v6[0] = objc_alloc_init(MEMORY[0x263EFF980]);
  predictions = v7->_predictions;
  id v5 = v6[0];
  -[NSMutableArray enumerateObjectsUsingBlock:](predictions, "enumerateObjectsUsingBlock:");
  id v4 = v6[0];
  objc_storeStrong(&v5, 0);
  objc_storeStrong(v6, 0);
  return v4;
}

void __30__PredictionsBuffer_logBuffer__block_invoke(id *a1, void *a2, void *a3, void *a4)
{
  v17[4] = *MEMORY[0x263EF8340];
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v14[3] = a3;
  v14[2] = a4;
  v14[1] = a1;
  v16[0] = @"noneScore";
  unint64_t v6 = NSNumber;
  [location[0] noneScore];
  id v12 = (id)objc_msgSend(v6, "numberWithDouble:");
  v17[0] = v12;
  v16[1] = @"doubleTapScore";
  id v7 = NSNumber;
  [location[0] doubleTapScore];
  id v11 = (id)objc_msgSend(v7, "numberWithDouble:");
  v17[1] = v11;
  v16[2] = @"tripleTapScore";
  unint64_t v8 = NSNumber;
  [location[0] tripleTapScore];
  id v10 = (id)objc_msgSend(v8, "numberWithDouble:");
  v17[2] = v10;
  v16[3] = @"predictedClass";
  id v9 = (id)objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(location[0], "predictedClass"));
  v17[3] = v9;
  v14[0] = (id)[NSDictionary dictionaryWithObjects:v17 forKeys:v16 count:4];

  [a1[4] addObject:v14[0]];
  objc_storeStrong(v14, 0);
  objc_storeStrong(location, 0);
}

- (id)description
{
  unint64_t v3 = NSString;
  id v5 = [(PredictionsBuffer *)self logBuffer];
  id v4 = (id)[v5 componentsJoinedByString:@":"];
  id v6 = (id)[v3 stringWithFormat:@"predictions[none,double,triple,class]: %@", v4];

  return v6;
}

- (void).cxx_destruct
{
}

@end
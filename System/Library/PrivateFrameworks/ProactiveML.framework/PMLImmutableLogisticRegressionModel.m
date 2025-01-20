@interface PMLImmutableLogisticRegressionModel
- (BOOL)intercept;
- (PMLImmutableLogisticRegressionModel)initWithChunk:(id)a3 intercept:(BOOL)a4;
- (PMLImmutableLogisticRegressionModel)initWithFloatsNoCopy:(const float *)a3 count:(int)a4 intercept:(BOOL)a5;
- (PMLImmutableLogisticRegressionModel)initWithPlist:(id)a3 chunks:(id)a4 context:(id)a5;
- (PMLImmutableLogisticRegressionModel)initWithWeights:(id)a3 intercept:(BOOL)a4;
- (id)predict:(id)a3;
- (id)toChunk;
- (id)toPlistWithChunks:(id)a3;
- (unint64_t)outputDimension;
@end

@implementation PMLImmutableLogisticRegressionModel

- (void).cxx_destruct
{
}

- (id)predict:(id)a3
{
  v21[2] = *MEMORY[0x263EF8340];
  id v5 = a3;
  v6 = v5;
  if (self->_intercept)
  {
    uint64_t v7 = [v5 vectorWithConstantColumn];

    v6 = (void *)v7;
  }
  uint64_t length = self->_length;
  if ([v6 length] != length)
  {
    v20 = [MEMORY[0x263F08690] currentHandler];
    [v20 handleFailureInMethod:a2, self, @"PMLImmutableLogisticRegressionModel.m", 71, @"Invalid covariates, length: %tu but model weights length: %d", objc_msgSend(v6, "length"), self->_length object file lineNumber description];
  }
  int v9 = [v6 numberOfNonZeroValues];
  id v10 = v6;
  v11 = (const sparse_index *)[v10 sparseIndices];
  id v12 = v10;
  float v13 = sparse_inner_product_dense_float(v9, (const float *)[v12 sparseValues], v11, self->_weights, 1);
  double v14 = 1.0 / (expf(-v13) + 1.0);
  float v15 = v14;
  *(float *)&double v14 = v15;
  v16 = [NSNumber numberWithFloat:v14];
  v21[0] = v16;
  v17 = [NSNumber numberWithDouble:1.0 - v15];
  v21[1] = v17;
  v18 = [MEMORY[0x263EFF8C0] arrayWithObjects:v21 count:2];

  return v18;
}

- (unint64_t)outputDimension
{
  return 2;
}

- (BOOL)intercept
{
  return self->_intercept;
}

- (id)toChunk
{
  return +[PMLDataChunkDenseFloatVector chunkWithVector:self->_weights count:self->_length];
}

- (PMLImmutableLogisticRegressionModel)initWithFloatsNoCopy:(const float *)a3 count:(int)a4 intercept:(BOOL)a5
{
  v9.receiver = self;
  v9.super_class = (Class)PMLImmutableLogisticRegressionModel;
  result = [(PMLImmutableLogisticRegressionModel *)&v9 init];
  if (result)
  {
    result->_weights = a3;
    result->_uint64_t length = a4;
    result->_intercept = a5;
  }
  return result;
}

- (PMLImmutableLogisticRegressionModel)initWithChunk:(id)a3 intercept:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  uint64_t v7 = -[PMLImmutableLogisticRegressionModel initWithFloatsNoCopy:count:intercept:](self, "initWithFloatsNoCopy:count:intercept:", [v6 vector], objc_msgSend(v6, "count"), v4);
  v8 = v7;
  if (v7) {
    objc_storeStrong(&v7->_backingObject, v6);
  }

  return v8;
}

- (PMLImmutableLogisticRegressionModel)initWithWeights:(id)a3 intercept:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  uint64_t v7 = -[PMLImmutableLogisticRegressionModel initWithFloatsNoCopy:count:intercept:](self, "initWithFloatsNoCopy:count:intercept:", [v6 values], objc_msgSend(v6, "length"), v4);
  v8 = v7;
  if (v7) {
    objc_storeStrong(&v7->_backingObject, v6);
  }

  return v8;
}

- (PMLImmutableLogisticRegressionModel)initWithPlist:(id)a3 chunks:(id)a4 context:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [v8 objectForKeyedSubscript:@"INTERCEPT"];
  uint64_t v12 = [v11 BOOLValue];

  float v13 = [v8 objectForKeyedSubscript:@"WEIGHTS"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    __assert_rtn("-[PMLImmutableLogisticRegressionModel(PMLPlistAndChunksSerialization) initWithPlist:chunks:context:]", "PMLDictionaryParameters.m", 203, "[__expr isKindOfClass:[NSNumber class]]");
  }
  double v14 = objc_msgSend(v9, "objectAtIndexedSubscript:", objc_msgSend(v13, "unsignedIntegerValue"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    __assert_rtn("-[PMLImmutableLogisticRegressionModel(PMLPlistAndChunksSerialization) initWithPlist:chunks:context:]", "PMLDictionaryParameters.m", 204, "[__expr isKindOfClass:[PMLDataChunkDenseFloatVector class]]");
  }
  float v15 = [(PMLImmutableLogisticRegressionModel *)self initWithChunk:v14 intercept:v12];

  return v15;
}

- (id)toPlistWithChunks:(id)a3
{
  v11[2] = *MEMORY[0x263EF8340];
  v10[0] = @"WEIGHTS";
  id v4 = a3;
  id v5 = [(PMLImmutableLogisticRegressionModel *)self toChunk];
  id v6 = internChunk(v5, v4);

  v10[1] = @"INTERCEPT";
  v11[0] = v6;
  uint64_t v7 = objc_msgSend(NSNumber, "numberWithBool:", -[PMLImmutableLogisticRegressionModel intercept](self, "intercept"));
  v11[1] = v7;
  id v8 = [NSDictionary dictionaryWithObjects:v11 forKeys:v10 count:2];

  return v8;
}

@end
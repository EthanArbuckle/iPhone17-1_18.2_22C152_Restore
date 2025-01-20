@interface PMLModelRegressor
+ (id)modelRegressorFromFloat:(float)a3;
+ (id)modelRegressorFromFloats:(id)a3;
+ (id)regressorVectorFrom:(id)a3;
- (PMLModelRegressor)initWithPlist:(id)a3 chunks:(id)a4 context:(id)a5;
- (PMLModelRegressor)initWithRegressorFromFloat:(float)a3;
- (const)inverseValues;
- (const)values;
- (id)denseVector;
- (id)initFromDictionary:(id)a3;
- (id)initModelRegressorFromFloats:(id)a3;
- (id)migrateDenseDoubleVectorToDenseFloatVector:(id)a3;
- (id)regressorFor:(int)a3;
- (id)toDictionary;
- (id)toPlistWithChunks:(id)a3;
- (int)count;
@end

@implementation PMLModelRegressor

- (PMLModelRegressor)initWithPlist:(id)a3 chunks:(id)a4 context:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = v8;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    __assert_rtn("-[PMLModelRegressor(PMLPlistAndChunksSerialization) initWithPlist:chunks:context:]", "PMLDictionaryParameters.m", 178, "[__expr isKindOfClass:[NSNumber class]]");
  }
  v12 = objc_msgSend(v9, "objectAtIndex:", objc_msgSend(v11, "unsignedIntegerValue"));
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  v14 = objc_msgSend(v9, "objectAtIndexedSubscript:", objc_msgSend(v11, "unsignedIntegerValue"));
  if (isKindOfClass)
  {
    v15 = [(PMLModelRegressor *)self migrateDenseDoubleVectorToDenseFloatVector:v14];
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      __assert_rtn("-[PMLModelRegressor(PMLPlistAndChunksSerialization) initWithPlist:chunks:context:]", "PMLDictionaryParameters.m", 186, "[__expr isKindOfClass:[PMLDataChunkDenseFloatVector class]]");
    }
    v16 = [v14 toVec];
    self = (PMLModelRegressor *)[(PMLModelRegressor *)self initModelRegressorFromFloats:v16];

    v15 = self;
  }

  return v15;
}

- (id)migrateDenseDoubleVectorToDenseFloatVector:(id)a3
{
  id v4 = a3;
  v5 = (float *)malloc_type_malloc(4 * (int)[v4 count], 0x100004052888210uLL);
  if ((int)[v4 count] >= 1)
  {
    uint64_t v6 = 0;
    do
    {
      id v7 = v4;
      float v8 = *(double *)([v7 vector] + 8 * v6);
      v5[v6++] = v8;
    }
    while (v6 < (int)[v7 count]);
  }
  id v9 = +[PMLDataChunkDenseFloatVector chunkWithVector:count:](PMLDataChunkDenseFloatVector, "chunkWithVector:count:", v5, [v4 count]);
  free(v5);
  id v10 = self;
  id v11 = [v9 toVec];
  id v12 = [(PMLModelRegressor *)v10 initModelRegressorFromFloats:v11];

  return v12;
}

- (id)toPlistWithChunks:(id)a3
{
  id v4 = self;
  id v5 = a3;
  uint64_t v6 = +[PMLDataChunkDenseFloatVector chunkWithVector:[(PMLModelRegressor *)v4 values] count:[(PMLModelRegressor *)v4 count]];
  id v7 = internChunk(v6, v5);

  return v7;
}

- (id)toDictionary
{
  v10[2] = *MEMORY[0x263EF8340];
  v9[0] = @"VALUES";
  v2 = self;
  v3 = arrayFromFloats((int *)[(PMLModelRegressor *)v2 values], [(PMLModelRegressor *)v2 count]);
  v9[1] = @"SHAPE";
  v10[0] = v3;
  id v4 = objc_msgSend(NSNumber, "numberWithInt:", -[PMLModelRegressor count](v2, "count"));
  v8[0] = v4;
  v8[1] = &unk_26D336278;
  id v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v8 count:2];
  v10[1] = v5;
  uint64_t v6 = [NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:2];

  return v6;
}

- (id)initFromDictionary:(id)a3
{
  id v4 = a3;
  id v5 = [v4 objectForKeyedSubscript:@"VALUES"];
  uint64_t v6 = [v4 objectForKeyedSubscript:@"SHAPE"];
  uint64_t v7 = [v5 count];
  float v8 = [v6 objectAtIndexedSubscript:0];
  if (v7 != [v8 unsignedIntegerValue]) {
    __assert_rtn("-[PMLModelRegressor(PMLMobileAssetParameterGetStrategy) initFromDictionary:]", "PMLDictionaryParameters.m", 73, "regressorArray.count == [shapeArray[0] unsignedIntegerValue]");
  }

  id v9 = v5;
  id v10 = malloc_type_malloc(4 * [v9 count], 0x100004052888210uLL);
  if ([v9 count])
  {
    unint64_t v11 = 0;
    do
    {
      id v12 = [v9 objectAtIndex:v11];
      [v12 floatValue];
      v10[v11] = v13;

      ++v11;
    }
    while (v11 < [v9 count]);
  }
  v14 = -[PMLDenseVector initWithFloatsNoCopy:count:freeWhenDone:]([PMLDenseVector alloc], "initWithFloatsNoCopy:count:freeWhenDone:", v10, [v9 count], 1);

  id v15 = [(PMLModelRegressor *)self initModelRegressorFromFloats:v14];
  return v15;
}

- (void).cxx_destruct
{
}

- (int)count
{
  return [(PMLDenseVector *)self->_data count];
}

- (const)inverseValues
{
  return [(PMLDenseVector *)self->_data ptr];
}

- (const)values
{
  return [(PMLDenseVector *)self->_data ptr];
}

- (id)regressorFor:(int)a3
{
  LODWORD(v3) = [(PMLModelRegressor *)self values][4 * a3];
  return +[PMLModelRegressor modelRegressorFromFloat:v3];
}

- (PMLModelRegressor)initWithRegressorFromFloat:(float)a3
{
  float v7 = a3;
  id v4 = [[PMLDenseVector alloc] initWithFloats:&v7 count:1];
  id v5 = [(PMLModelRegressor *)self initModelRegressorFromFloats:v4];

  return v5;
}

- (id)initModelRegressorFromFloats:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PMLModelRegressor;
  uint64_t v6 = [(PMLModelRegressor *)&v9 init];
  float v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_data, a3);
  }

  return v7;
}

- (id)denseVector
{
  return self->_data;
}

+ (id)regressorVectorFrom:(id)a3
{
  id v4 = a3;
  id v5 = -[PMLDenseVector initWithCount:]([PMLMutableDenseVector alloc], "initWithCount:", [v4 count]);
  if ([v4 count])
  {
    unint64_t v6 = 0;
    do
    {
      float v7 = (void *)MEMORY[0x223C7E5C0]();
      float v8 = [v4 objectAtIndexedSubscript:v6];
      [v8 floatValue];
      *(_DWORD *)([(PMLMutableDenseVector *)v5 mutablePtr] + 4 * v6) = v9;

      ++v6;
    }
    while (v6 < [v4 count]);
  }
  id v10 = [a1 modelRegressorFromFloats:v5];

  return v10;
}

+ (id)modelRegressorFromFloat:(float)a3
{
  id v4 = [PMLModelRegressor alloc];
  *(float *)&double v5 = a3;
  unint64_t v6 = [(PMLModelRegressor *)v4 initWithRegressorFromFloat:v5];
  return v6;
}

+ (id)modelRegressorFromFloats:(id)a3
{
  id v3 = a3;
  id v4 = [[PMLModelRegressor alloc] initModelRegressorFromFloats:v3];

  return v4;
}

@end
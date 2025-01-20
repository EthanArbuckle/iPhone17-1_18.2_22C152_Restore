@interface PMLModelWeights
+ (id)constWeightsOfLength:(int)a3 value:(float)a4;
+ (id)modelWeightsFromFloats:(id)a3;
+ (id)modelWeightsOfLength:(int)a3;
+ (id)modelWeightsOfLength:(int)a3 rng:(id)a4;
+ (id)modelWeightsOfLength:(int)a3 rngSeed:(unint64_t)a4;
+ (id)weightsFromNumbers:(id)a3;
+ (id)zeroWeightsOfLength:(int)a3;
- (PMLModelWeights)initWithCount:(int)a3;
- (PMLModelWeights)initWithPlist:(id)a3 chunks:(id)a4 context:(id)a5;
- (float)values;
- (id)asMutableDenseVector;
- (id)copy;
- (id)initFromDictionary:(id)a3;
- (id)initModelWeightsFromFloats:(id)a3;
- (id)migrateDenseDoubleVectorToDenseFloatVector:(id)a3;
- (id)sliceFrom:(int)a3 to:(int)a4;
- (id)toDictionary;
- (id)toPlistWithChunks:(id)a3;
- (id)weightsByAppendingWeights:(id)a3;
- (int)length;
- (void)processValuesInPlaceWithBlock:(id)a3;
@end

@implementation PMLModelWeights

- (PMLModelWeights)initWithPlist:(id)a3 chunks:(id)a4 context:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = v8;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    __assert_rtn("-[PMLModelWeights(PMLPlistAndChunksSerialization) initWithPlist:chunks:context:]", "PMLDictionaryParameters.m", 137, "[__expr isKindOfClass:[NSNumber class]]");
  }
  v12 = objc_msgSend(v9, "objectAtIndex:", objc_msgSend(v11, "unsignedIntegerValue"));
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  v14 = objc_msgSend(v9, "objectAtIndexedSubscript:", objc_msgSend(v11, "unsignedIntegerValue"));
  if (isKindOfClass)
  {
    v15 = [(PMLModelWeights *)self migrateDenseDoubleVectorToDenseFloatVector:v14];
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      __assert_rtn("-[PMLModelWeights(PMLPlistAndChunksSerialization) initWithPlist:chunks:context:]", "PMLDictionaryParameters.m", 146, "[__expr isKindOfClass:[PMLDataChunkDenseFloatVector class]]");
    }
    v16 = [v14 toVec];
    self = (PMLModelWeights *)[(PMLModelWeights *)self initModelWeightsFromFloats:v16];

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
  id v12 = [(PMLModelWeights *)v10 initModelWeightsFromFloats:v11];

  return v12;
}

- (id)toPlistWithChunks:(id)a3
{
  id v4 = self;
  id v5 = a3;
  uint64_t v6 = +[PMLDataChunkDenseFloatVector chunkWithVector:[(PMLModelWeights *)v4 values] count:[(PMLModelWeights *)v4 length]];
  id v7 = internChunk(v6, v5);

  return v7;
}

- (id)toDictionary
{
  v17[2] = *MEMORY[0x263EF8340];
  v3 = objc_opt_new();
  if ([(PMLModelWeights *)self length] >= 1)
  {
    uint64_t v4 = 0;
    do
    {
      id v5 = NSNumber;
      uint64_t v6 = self;
      LODWORD(v7) = [(PMLModelWeights *)v6 values][4 * v4];
      float v8 = [v5 numberWithFloat:v7];
      [v3 addObject:v8];

      ++v4;
    }
    while (v4 < [(PMLModelWeights *)v6 length]);
  }
  v16[0] = @"VALUES";
  id v9 = self;
  id v10 = arrayFromFloats((int *)[(PMLModelWeights *)v9 values], [(PMLModelWeights *)v9 length]);
  v16[1] = @"SHAPE";
  v17[0] = v10;
  id v11 = objc_msgSend(NSNumber, "numberWithInt:", -[PMLModelWeights length](v9, "length"));
  v15[0] = v11;
  v15[1] = &unk_26D336278;
  id v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v15 count:2];
  v17[1] = v12;
  v13 = [NSDictionary dictionaryWithObjects:v17 forKeys:v16 count:2];

  return v13;
}

- (id)initFromDictionary:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [v4 objectForKeyedSubscript:@"VALUES"];
  uint64_t v6 = [v4 objectForKeyedSubscript:@"SHAPE"];
  uint64_t v7 = [v5 count];
  float v8 = [v6 objectAtIndexedSubscript:0];
  if (v7 != [v8 unsignedIntegerValue]) {
    __assert_rtn("-[PMLModelWeights(PMLMobileAssetParameterGetStrategy) initFromDictionary:]", "PMLDictionaryParameters.m", 51, "weightArray.count == [shapeArray[0] unsignedIntegerValue]");
  }

  id v9 = v5;
  id v10 = -[PMLDenseVector initWithCount:]([PMLMutableDenseVector alloc], "initWithCount:", [v9 count]);
  id v11 = [(PMLMutableDenseVector *)v10 mutablePtr];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v12 = v9;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v21;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v21 != v15) {
          objc_enumerationMutation(v12);
        }
        objc_msgSend(*(id *)(*((void *)&v20 + 1) + 8 * v16), "floatValue", (void)v20);
        *(_DWORD *)v11++ = v17;
        ++v16;
      }
      while (v14 != v16);
      uint64_t v14 = [v12 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v14);
  }

  id v18 = [(PMLModelWeights *)self initModelWeightsFromFloats:v10];
  return v18;
}

- (void).cxx_destruct
{
}

- (id)copy
{
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)sliceFrom:(int)a3 to:(int)a4
{
  id v4 = [(PMLDenseVector *)self->_data sliceFrom:*(void *)&a3 to:*(void *)&a4];
  id v5 = +[PMLModelWeights modelWeightsFromFloats:v4];

  return v5;
}

- (id)weightsByAppendingWeights:(id)a3
{
  v3 = [(PMLDenseVector *)self->_data vecByAppendingVec:*((void *)a3 + 1)];
  id v4 = +[PMLModelWeights modelWeightsFromFloats:v3];

  return v4;
}

- (void)processValuesInPlaceWithBlock:(id)a3
{
}

- (int)length
{
  return [(PMLDenseVector *)self->_data count];
}

- (id)asMutableDenseVector
{
  return self->_data;
}

- (float)values
{
  return [(PMLMutableDenseVector *)self->_data mutablePtr];
}

- (PMLModelWeights)initWithCount:(int)a3
{
  id v4 = [(PMLDenseVector *)[PMLMutableDenseVector alloc] initWithCount:a3];
  id v5 = [(PMLModelWeights *)self initModelWeightsFromFloats:v4];

  return v5;
}

- (id)initModelWeightsFromFloats:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PMLModelWeights;
  uint64_t v6 = [(PMLModelWeights *)&v9 init];
  uint64_t v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_data, a3);
  }

  return v7;
}

+ (id)weightsFromNumbers:(id)a3
{
  id v3 = a3;
  id v4 = malloc_type_calloc([v3 count], 4uLL, 0x100004052888210uLL);
  if (!v4)
  {
    id v12 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF570] reason:@"malloc failed" userInfo:0];
    objc_exception_throw(v12);
  }
  id v5 = v4;
  if ([v3 count])
  {
    unint64_t v6 = 0;
    do
    {
      uint64_t v7 = [v3 objectAtIndexedSubscript:v6];
      [v7 floatValue];
      v5[v6] = v8;

      ++v6;
    }
    while (v6 < [v3 count]);
  }
  objc_super v9 = -[PMLDenseVector initWithFloatsNoCopy:count:freeWhenDone:]([PMLMutableDenseVector alloc], "initWithFloatsNoCopy:count:freeWhenDone:", v5, [v3 count], 1);
  id v10 = +[PMLModelWeights modelWeightsFromFloats:v9];

  return v10;
}

+ (id)constWeightsOfLength:(int)a3 value:(float)a4
{
  id v6 = objc_alloc((Class)a1);
  uint64_t v7 = [PMLMutableDenseVector alloc];
  int v8 = (float *)malloc_type_malloc(4 * a3, 0x100004052888210uLL);
  if (!v8)
  {
    id v14 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF570] reason:@"malloc failed" userInfo:0];
    objc_exception_throw(v14);
  }
  if (a3 >= 1)
  {
    uint64_t v9 = a3;
    id v10 = v8;
    do
    {
      *v10++ = a4;
      --v9;
    }
    while (v9);
  }
  id v11 = [(PMLDenseVector *)v7 initWithFloatsNoCopy:v8 count:a3 freeWhenDone:1];
  id v12 = (void *)[v6 initModelWeightsFromFloats:v11];

  return v12;
}

+ (id)zeroWeightsOfLength:(int)a3
{
  id v4 = objc_alloc((Class)a1);
  id v5 = [(PMLDenseVector *)[PMLMutableDenseVector alloc] initWithCount:a3];
  id v6 = (void *)[v4 initModelWeightsFromFloats:v5];

  return v6;
}

+ (id)modelWeightsOfLength:(int)a3 rngSeed:(unint64_t)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = (void *)[objc_alloc(MEMORY[0x263F61E88]) initWithSeed:a4];
  uint64_t v7 = [a1 modelWeightsOfLength:v4 rng:v6];

  return v7;
}

+ (id)modelWeightsOfLength:(int)a3
{
  return (id)[a1 modelWeightsOfLength:*(void *)&a3 rng:0];
}

+ (id)modelWeightsOfLength:(int)a3 rng:(id)a4
{
  id v6 = a4;
  id v7 = objc_alloc((Class)a1);
  int v8 = [PMLMutableDenseVector alloc];
  id v9 = v6;
  id v10 = v9;
  if (v9) {
    id v11 = v9;
  }
  else {
    id v11 = (id)objc_opt_new();
  }
  id v12 = v11;
  uint64_t v13 = (float *)malloc_type_malloc(4 * a3, 0x100004052888210uLL);
  if (!v13)
  {
    id v27 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF570] reason:@"malloc failed" userInfo:0];
    objc_exception_throw(v27);
  }
  id v14 = v13;
  uint64_t v15 = a3;
  if (a3 >= 1)
  {
    uint64_t v16 = 0;
    uint64_t v17 = a3;
    do
    {
      id v18 = v12;
      do
      {
        do
        {
          float v19 = (float)((float)(unint64_t)[v18 next] * 5.421e-20) * 2.0 + -1.0;
          float v20 = (float)((float)(unint64_t)[v18 next] * 5.421e-20) * 2.0 + -1.0;
          float v21 = (float)(v20 * v20) + (float)(v19 * v19);
        }
        while (v21 >= 1.0);
      }
      while (v21 < 7.81e-306);
      float v22 = logf(v21) * -2.0 / v21;
      float v23 = sqrtf(v22) * v19;

      v14[v16++] = v23;
    }
    while (v16 != v17);
  }

  v24 = [(PMLDenseVector *)v8 initWithFloatsNoCopy:v14 count:v15 freeWhenDone:1];
  uint64_t v25 = (void *)[v7 initModelWeightsFromFloats:v24];

  return v25;
}

+ (id)modelWeightsFromFloats:(id)a3
{
  id v3 = a3;
  id v4 = [[PMLModelWeights alloc] initModelWeightsFromFloats:v3];

  return v4;
}

@end
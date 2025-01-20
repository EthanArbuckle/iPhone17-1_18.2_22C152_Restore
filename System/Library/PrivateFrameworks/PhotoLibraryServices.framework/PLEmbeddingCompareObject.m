@interface PLEmbeddingCompareObject
- ($73DE6CFC58B34F5FFCF9CF852B54AD9C)llmTimeRange;
- (NSArray)vector;
- (NSString)assetUUID;
- (PLEmbeddingCompareObject)initWithAssetUUID:(id)a3 vector:(id)a4;
- (double)distanceBetweenVectors;
- (double)distanceToQueryVector:(id)a3;
- (unint64_t)modelType;
- (void)setModelType:(unint64_t)a3;
@end

@implementation PLEmbeddingCompareObject

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vector, 0);
  objc_storeStrong((id *)&self->_assetUUID, 0);
}

- (void)setModelType:(unint64_t)a3
{
  self->_modelType = a3;
}

- (unint64_t)modelType
{
  return self->_modelType;
}

- (double)distanceBetweenVectors
{
  return self->_distanceBetweenVectors;
}

- (NSArray)vector
{
  return self->_vector;
}

- (NSString)assetUUID
{
  return self->_assetUUID;
}

- ($73DE6CFC58B34F5FFCF9CF852B54AD9C)llmTimeRange
{
  uint64_t v3 = MEMORY[0x1E4F1FA30];
  long long v4 = *(_OWORD *)(MEMORY[0x1E4F1FA30] + 16);
  *(_OWORD *)&retstr->var0.var0 = *MEMORY[0x1E4F1FA30];
  *(_OWORD *)&retstr->var0.var3 = v4;
  *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)(v3 + 32);
  return self;
}

- (double)distanceToQueryVector:(id)a3
{
  id v5 = a3;
  if (![v5 count])
  {
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"PLEmbeddingCompareObject.m", 33, @"Invalid parameter not satisfying: %@", @"queryVector.count > 0" object file lineNumber description];
  }
  v6 = [(PLEmbeddingCompareObject *)self vector];
  +[PLEmbeddingUtilities cosineSimilarityBetweenVector:v6 secondVector:v5];
  double v8 = v7;

  self->_distanceBetweenVectors = v8;
  vector = self->_vector;
  self->_vector = 0;

  [(PLEmbeddingCompareObject *)self distanceBetweenVectors];
  return result;
}

- (PLEmbeddingCompareObject)initWithAssetUUID:(id)a3 vector:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = v8;
  if (v7)
  {
    if (v8) {
      goto LABEL_3;
    }
  }
  else
  {
    v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"PLEmbeddingCompareObject.m", 18, @"Invalid parameter not satisfying: %@", @"assetUUID" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
  }
  v17 = [MEMORY[0x1E4F28B00] currentHandler];
  [v17 handleFailureInMethod:a2, self, @"PLEmbeddingCompareObject.m", 19, @"Invalid parameter not satisfying: %@", @"vector" object file lineNumber description];

LABEL_3:
  v18.receiver = self;
  v18.super_class = (Class)PLEmbeddingCompareObject;
  v10 = [(PLEmbeddingCompareObject *)&v18 init];
  if (v10)
  {
    uint64_t v11 = [v7 copy];
    assetUUID = v10->_assetUUID;
    v10->_assetUUID = (NSString *)v11;

    uint64_t v13 = [v9 copy];
    vector = v10->_vector;
    v10->_vector = (NSArray *)v13;
  }
  return v10;
}

@end
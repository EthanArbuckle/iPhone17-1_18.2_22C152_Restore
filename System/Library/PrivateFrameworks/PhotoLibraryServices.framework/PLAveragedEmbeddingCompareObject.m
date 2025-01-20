@interface PLAveragedEmbeddingCompareObject
- ($73DE6CFC58B34F5FFCF9CF852B54AD9C)videoTimeRange;
- (PLAveragedEmbeddingCompareObject)initWithAssetUUID:(id)a3 timeRange:(id *)a4 averageDistanceBetweenVectors:(double)a5;
- (double)averageDistanceBetweenVectors;
@end

@implementation PLAveragedEmbeddingCompareObject

- ($73DE6CFC58B34F5FFCF9CF852B54AD9C)videoTimeRange
{
  long long v3 = *(_OWORD *)&self[1].var0.var3;
  *(_OWORD *)&retstr->var0.var0 = *(_OWORD *)&self[1].var0.var0;
  *(_OWORD *)&retstr->var0.var3 = v3;
  *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)&self[1].var1.var1;
  return self;
}

- (double)averageDistanceBetweenVectors
{
  return self->_averageDistanceBetweenVectors;
}

- (PLAveragedEmbeddingCompareObject)initWithAssetUUID:(id)a3 timeRange:(id *)a4 averageDistanceBetweenVectors:(double)a5
{
  v10.receiver = self;
  v10.super_class = (Class)PLAveragedEmbeddingCompareObject;
  result = [(PLEmbeddingCompareObject *)&v10 initWithAssetUUID:a3 vector:MEMORY[0x1E4F1CBF0]];
  if (result)
  {
    result->_averageDistanceBetweenVectors = a5;
    long long v8 = *(_OWORD *)&a4->var0.var0;
    long long v9 = *(_OWORD *)&a4->var1.var1;
    *(_OWORD *)&result->_videoTimeRange.start.epoch = *(_OWORD *)&a4->var0.var3;
    *(_OWORD *)&result->_videoTimeRange.duration.timescale = v9;
    *(_OWORD *)&result->_videoTimeRange.start.value = v8;
  }
  return result;
}

@end
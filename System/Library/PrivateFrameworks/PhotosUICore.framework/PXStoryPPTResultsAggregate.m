@interface PXStoryPPTResultsAggregate
- (NSDictionary)extraResultsDictionaryRepresentation;
- (PXStoryPPTResultsAggregate)init;
- (id)_keyForMeasure:(id)a3 configuration:(id)a4;
- (void)_addExtraResultsValue:(double)a3 metric:(int64_t)a4 forMeasure:(id)a5 configuration:(id)a6;
- (void)addValue:(double)a3 metric:(int64_t)a4 forMeasure:(id)a5 configuration:(id)a6;
@end

@implementation PXStoryPPTResultsAggregate

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extraResultsDictionaryRepresentation, 0);
  objc_storeStrong((id *)&self->_measureInfos, 0);
}

- (NSDictionary)extraResultsDictionaryRepresentation
{
  measureInfos = self->_measureInfos;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __66__PXStoryPPTResultsAggregate_extraResultsDictionaryRepresentation__block_invoke;
  v6[3] = &unk_1E5DBCD78;
  v6[4] = self;
  [(NSMutableDictionary *)measureInfos enumerateKeysAndObjectsUsingBlock:v6];
  v4 = (void *)[(NSMutableDictionary *)self->_extraResultsDictionaryRepresentation copy];
  return (NSDictionary *)v4;
}

void __66__PXStoryPPTResultsAggregate_extraResultsDictionaryRepresentation__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  id v19 = [v5 statistics];
  v7 = *(void **)(a1 + 32);
  [v19 mean];
  objc_msgSend(v7, "_addExtraResultsValue:metric:forMeasure:configuration:", objc_msgSend(v5, "metric"), v6, @"mean", v8);
  v9 = *(void **)(a1 + 32);
  [v19 standardDeviation];
  objc_msgSend(v9, "_addExtraResultsValue:metric:forMeasure:configuration:", objc_msgSend(v5, "metric"), v6, @"stdDev", v10);
  v11 = *(void **)(a1 + 32);
  [v19 min];
  objc_msgSend(v11, "_addExtraResultsValue:metric:forMeasure:configuration:", objc_msgSend(v5, "metric"), v6, @"min", v12);
  v13 = *(void **)(a1 + 32);
  [v19 max];
  objc_msgSend(v13, "_addExtraResultsValue:metric:forMeasure:configuration:", objc_msgSend(v5, "metric"), v6, @"max", v14);
  v15 = *(void **)(a1 + 32);
  [v19 first];
  double v17 = v16;
  uint64_t v18 = [v5 metric];

  [v15 _addExtraResultsValue:v18 metric:v6 forMeasure:@"first" configuration:v17];
}

- (id)_keyForMeasure:(id)a3 configuration:(id)a4
{
  id v5 = (objc_class *)NSString;
  id v6 = a3;
  id v7 = a4;
  id v8 = [v5 alloc];
  v9 = [v6 stringByReplacingOccurrencesOfString:@" " withString:&stru_1F00B0030];

  double v10 = [v7 stringByReplacingOccurrencesOfString:@" " withString:&stru_1F00B0030];

  v11 = (void *)[v8 initWithFormat:@"sub:%@:%@", v9, v10];
  return v11;
}

- (void)_addExtraResultsValue:(double)a3 metric:(int64_t)a4 forMeasure:(id)a5 configuration:(id)a6
{
  id v18 = a5;
  id v11 = a6;
  switch(a4)
  {
    case 1:
      if (a3 >= 0.1)
      {
        double v12 = @"s";
      }
      else
      {
        a3 = a3 * 1000.0;
        double v12 = @"ms";
      }
      break;
    case 2:
      double v12 = @"fps";
      break;
    case 0:
      double v17 = [MEMORY[0x1E4F28B00] currentHandler];
      [v17 handleFailureInMethod:a2 object:self file:@"PXStoryPPTResultsAggregate.m" lineNumber:53 description:@"Code which should be unreachable has been reached"];

      abort();
    default:
      double v12 = 0;
      a3 = 0.0;
      break;
  }
  v13 = [(PXStoryPPTResultsAggregate *)self _keyForMeasure:v18 configuration:v11];
  double v14 = [NSNumber numberWithDouble:a3];
  [(NSMutableDictionary *)self->_extraResultsDictionaryRepresentation setObject:v14 forKeyedSubscript:v13];

  extraResultsDictionaryRepresentation = self->_extraResultsDictionaryRepresentation;
  double v16 = [v13 stringByAppendingString:@"Units"];
  [(NSMutableDictionary *)extraResultsDictionaryRepresentation setObject:v12 forKeyedSubscript:v16];
}

- (void)addValue:(double)a3 metric:(int64_t)a4 forMeasure:(id)a5 configuration:(id)a6
{
  id v16 = a5;
  id v11 = a6;
  double v12 = [(NSMutableDictionary *)self->_measureInfos objectForKeyedSubscript:v16];
  if (v12)
  {
    v13 = v12;
    if ([(_PXStoryPPTMeasureInfo *)v12 metric] != a4)
    {
      double v14 = [MEMORY[0x1E4F28B00] currentHandler];
      [v14 handleFailureInMethod:a2, self, @"PXStoryPPTResultsAggregate.m", 41, @"metric mismatch for %@:%@", v16, v11 object file lineNumber description];
    }
  }
  else
  {
    v13 = [[_PXStoryPPTMeasureInfo alloc] initWithMetric:a4];
    [(NSMutableDictionary *)self->_measureInfos setObject:v13 forKeyedSubscript:v16];
  }
  [(PXStoryPPTResultsAggregate *)self _addExtraResultsValue:a4 metric:v16 forMeasure:v11 configuration:a3];
  v15 = [(_PXStoryPPTMeasureInfo *)v13 statistics];
  [v15 addValue:a3];
}

- (PXStoryPPTResultsAggregate)init
{
  v8.receiver = self;
  v8.super_class = (Class)PXStoryPPTResultsAggregate;
  v2 = [(PXStoryPPTResultsAggregate *)&v8 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    measureInfos = v2->_measureInfos;
    v2->_measureInfos = v3;

    id v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    extraResultsDictionaryRepresentation = v2->_extraResultsDictionaryRepresentation;
    v2->_extraResultsDictionaryRepresentation = v5;
  }
  return v2;
}

@end
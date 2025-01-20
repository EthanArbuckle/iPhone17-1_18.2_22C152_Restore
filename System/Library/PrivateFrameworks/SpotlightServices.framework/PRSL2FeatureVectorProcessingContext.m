@interface PRSL2FeatureVectorProcessingContext
- (PRSL2FeatureVectorProcessingContext)initWithFeatureOrder:(id)a3 withInflation:(unint64_t)a4 withInflatedIndexToSize:(id)a5;
- (unint64_t)expandedFeatureCount;
- (unsigned)expandedFeatureExecutionOrder;
- (void)dealloc;
- (void)setExpandedFeatureCount:(unint64_t)a3;
- (void)setExpandedFeatureExecutionOrder:(unsigned __int16 *)a3;
@end

@implementation PRSL2FeatureVectorProcessingContext

- (PRSL2FeatureVectorProcessingContext)initWithFeatureOrder:(id)a3 withInflation:(unint64_t)a4 withInflatedIndexToSize:(id)a5
{
  id v8 = a3;
  id v25 = a5;
  v28.receiver = self;
  v28.super_class = (Class)PRSL2FeatureVectorProcessingContext;
  v9 = [(PRSL2FeatureVectorProcessingContext *)&v28 init];
  if (v9)
  {
    unint64_t v10 = [v8 count] + a4;
    v9->_expandedFeatureCount = v10;
    v11 = (unsigned __int16 *)malloc_type_malloc(2 * v10, 0x27BB816FuLL);
    v12 = v11;
    if (v10) {
      memset(v11, 255, 2 * v10);
    }
    v13 = +[PRSL2FeatureVector getL2FeatureSet];
    uint64_t v14 = [v8 count];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = 0;
      for (uint64_t i = 0; i != v15; ++i)
      {
        id value = 0;
        uint64_t v27 = 0;
        id value = [v8 objectAtIndexedSubscript:i];
        LOWORD(v27) = 0;
        BYTE2(v27) = 0;
        v18 = CFSetGetValue(v13, &value);
        if (v18)
        {
          unsigned __int16 v19 = v18[4];
          v20 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:i];
          v21 = [v25 objectForKeyedSubscript:v20];

          if (v21)
          {
            for (unint64_t j = 0; j <= [v21 unsignedLongLongValue]; ++j)
              v12[v16 + j] = v19;
            v16 += j;
          }
          else
          {
            v12[v16++] = v19;
          }
        }
        else
        {
          +[SSADEventReporter reportBadDirectivesForModelType:0];
        }
      }
    }
    v9 = v24;
    v24->_expandedFeatureExecutionOrder = v12;
  }

  return v9;
}

- (void)dealloc
{
  expandedFeatureExecutionOrder = self->_expandedFeatureExecutionOrder;
  if (expandedFeatureExecutionOrder) {
    free(expandedFeatureExecutionOrder);
  }
  v4.receiver = self;
  v4.super_class = (Class)PRSL2FeatureVectorProcessingContext;
  [(PRSL2FeatureVectorProcessingContext *)&v4 dealloc];
}

- (unsigned)expandedFeatureExecutionOrder
{
  return self->_expandedFeatureExecutionOrder;
}

- (void)setExpandedFeatureExecutionOrder:(unsigned __int16 *)a3
{
  self->_expandedFeatureExecutionOrder = a3;
}

- (unint64_t)expandedFeatureCount
{
  return self->_expandedFeatureCount;
}

- (void)setExpandedFeatureCount:(unint64_t)a3
{
  self->_expandedFeatureCount = a3;
}

@end
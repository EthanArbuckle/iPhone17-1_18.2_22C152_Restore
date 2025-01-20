@interface SignpostAggregationAccumulator
- (BOOL)includeRawIntervals;
- (NSMutableDictionary)mutableSignatureToAccumulatorEntry;
- (SignpostAggregationAccumulator)init;
- (SignpostAggregationAccumulator)initWithIncludeRawIntervals:(BOOL)a3;
- (void)handleInterval:(id)a3;
@end

@implementation SignpostAggregationAccumulator

- (SignpostAggregationAccumulator)init
{
  return [(SignpostAggregationAccumulator *)self initWithIncludeRawIntervals:1];
}

- (SignpostAggregationAccumulator)initWithIncludeRawIntervals:(BOOL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)SignpostAggregationAccumulator;
  v4 = [(SignpostAggregationAccumulator *)&v8 init];
  if (v4)
  {
    uint64_t v5 = [MEMORY[0x1E4F1CA60] dictionary];
    mutableSignatureToAccumulatorEntry = v4->_mutableSignatureToAccumulatorEntry;
    v4->_mutableSignatureToAccumulatorEntry = (NSMutableDictionary *)v5;

    v4->_includeRawIntervals = a3;
  }
  return v4;
}

- (void)handleInterval:(id)a3
{
  id v16 = a3;
  v4 = +[SignpostAggregation _aggregationDescriptionStringForInterval:v16];
  uint64_t v5 = [v16 subsystem];
  v6 = [v16 category];
  v7 = [v16 name];
  objc_super v8 = +[SignpostAggregation _signatureForSubsystem:v5 category:v6 name:v7 aggregationDescription:v4];

  v9 = [(SignpostAggregationAccumulator *)self mutableSignatureToAccumulatorEntry];
  id v10 = [v9 objectForKeyedSubscript:v8];

  if (!v10)
  {
    v11 = [SignpostAggregationAccumulatorEntry alloc];
    v12 = [v16 subsystem];
    v13 = [v16 category];
    v14 = [v16 name];
    id v10 = [(SignpostAggregationAccumulatorEntry *)v11 _initWithSubsystem:v12 category:v13 name:v14 aggregationDescription:v4 includeRawIntervals:[(SignpostAggregationAccumulator *)self includeRawIntervals]];

    v15 = [(SignpostAggregationAccumulator *)self mutableSignatureToAccumulatorEntry];
    [v15 setObject:v10 forKeyedSubscript:v8];
  }
  [v10 _handleInterval:v16];
}

- (BOOL)includeRawIntervals
{
  return self->_includeRawIntervals;
}

- (NSMutableDictionary)mutableSignatureToAccumulatorEntry
{
  return self->_mutableSignatureToAccumulatorEntry;
}

- (void).cxx_destruct
{
}

@end
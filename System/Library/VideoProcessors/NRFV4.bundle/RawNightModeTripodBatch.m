@interface RawNightModeTripodBatch
- (BOOL)isFirstBatch;
- (BOOL)isLastBatch;
- (RawNightModeTripodBatch)initWithBatchSize:(unsigned int)a3 metalContext:(id)a4 accumulator:(id)a5;
- (id)accumulator;
- (id)metalContext;
- (id)referenceFrame;
- (int)prepareForProcessingIsFirst:(BOOL)a3 last:(BOOL)a4;
- (void)setAccumulator:(id)a3;
- (void)setMetalContext:(id)a3;
@end

@implementation RawNightModeTripodBatch

- (RawNightModeTripodBatch)initWithBatchSize:(unsigned int)a3 metalContext:(id)a4 accumulator:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)RawNightModeTripodBatch;
  v11 = [(RawNightModeTripodBatch *)&v16 init];
  if (v11
    && (uint64_t v12 = objc_opt_new(),
        nonReferenceFrames = v11->super._nonReferenceFrames,
        v11->super._nonReferenceFrames = (NSMutableArray *)v12,
        nonReferenceFrames,
        v11->super._batchSize = a3,
        objc_storeStrong((id *)&v11->_metalContext, a4),
        objc_storeStrong((id *)&v11->_accumulator, a5),
        v11->super._nonReferenceFrames))
  {
    v14 = v11;
  }
  else
  {
    FigDebugAssert3();
    v14 = 0;
  }

  return v14;
}

- (int)prepareForProcessingIsFirst:(BOOL)a3 last:(BOOL)a4
{
  self->_isFirstBatch = a3;
  self->_isLastBatch = a4;
  return 0;
}

- (id)metalContext
{
  return self->_metalContext;
}

- (void)setMetalContext:(id)a3
{
}

- (id)referenceFrame
{
  return self->_referenceFrame;
}

- (id)accumulator
{
  return self->_accumulator;
}

- (void)setAccumulator:(id)a3
{
}

- (BOOL)isFirstBatch
{
  return self->_isFirstBatch;
}

- (BOOL)isLastBatch
{
  return self->_isLastBatch;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accumulator, 0);
  objc_storeStrong((id *)&self->_referenceFrame, 0);

  objc_storeStrong((id *)&self->_metalContext, 0);
}

@end
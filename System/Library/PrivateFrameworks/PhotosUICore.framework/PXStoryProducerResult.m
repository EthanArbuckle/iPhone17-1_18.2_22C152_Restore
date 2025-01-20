@interface PXStoryProducerResult
+ (PXStoryProducerResult)nullResult;
- (BOOL)isDegraded;
- (BOOL)isEqual:(id)a3;
- (NSError)error;
- (NSNumber)fractionCompleted;
- (PXStoryProducerResult)init;
- (PXStoryProducerResult)initWithObject:(id)a3;
- (double)productionDuration;
- (id)deliveredNowWithRequestTime:(double)a3;
- (id)description;
- (id)error:(id)a3;
- (id)flags:(unint64_t)a3;
- (id)fractionCompleted:(float)a3;
- (id)object;
- (unint64_t)flags;
- (unint64_t)hash;
@end

@implementation PXStoryProducerResult

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_fractionCompleted, 0);
  objc_storeStrong(&self->_object, 0);
}

- (double)productionDuration
{
  return self->_productionDuration;
}

- (NSError)error
{
  return self->_error;
}

- (NSNumber)fractionCompleted
{
  return self->_fractionCompleted;
}

- (unint64_t)flags
{
  return self->_flags;
}

- (id)object
{
  return self->_object;
}

- (unint64_t)hash
{
  v3 = [(PXStoryProducerResult *)self object];
  uint64_t v4 = [v3 hash];
  unint64_t v5 = [(PXStoryProducerResult *)self flags] ^ v4;
  v6 = [(PXStoryProducerResult *)self error];
  unint64_t v7 = v5 ^ [v6 hash];

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (PXStoryProducerResult *)a3;
  if (v4 == self)
  {
    BOOL v9 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      unint64_t v5 = v4;
      id v6 = [(PXStoryProducerResult *)self object];
      id v7 = [(PXStoryProducerResult *)v5 object];
      if (v6 == v7)
      {
      }
      else
      {
        int v8 = [v6 isEqual:v7];

        if (!v8) {
          goto LABEL_13;
        }
      }
      unint64_t v10 = [(PXStoryProducerResult *)self flags];
      if (v10 != [(PXStoryProducerResult *)v5 flags])
      {
LABEL_13:
        BOOL v9 = 0;
LABEL_17:

        goto LABEL_18;
      }
      id v11 = [(PXStoryProducerResult *)self error];
      id v12 = [(PXStoryProducerResult *)v5 error];
      if (v11 == v12)
      {
      }
      else
      {
        int v13 = [v11 isEqual:v12];

        if (!v13)
        {
          BOOL v9 = 0;
LABEL_16:

          goto LABEL_17;
        }
      }
      [(PXStoryProducerResult *)self productionDuration];
      double v15 = v14;
      [(PXStoryProducerResult *)v5 productionDuration];
      BOOL v9 = v15 == v16;
      goto LABEL_16;
    }
    BOOL v9 = 0;
  }
LABEL_18:

  return v9;
}

- (id)description
{
  id v3 = [NSString alloc];
  uint64_t v4 = objc_opt_class();
  unint64_t v5 = [(PXStoryProducerResult *)self flags];
  id v6 = [(PXStoryProducerResult *)self object];
  id v7 = [(PXStoryProducerResult *)self error];
  int v8 = objc_msgSend(v3, "initWithFormat:", @"<%@ %p; flags: 0x%lX; object: %@, error: %@>",
                 v4,
                 self,
                 v5,
                 v6,
                 v7);

  return v8;
}

- (BOOL)isDegraded
{
  return [(PXStoryProducerResult *)self flags] & 1;
}

- (id)deliveredNowWithRequestTime:(double)a3
{
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  self->_productionDuration = v5 - a3;
  return self;
}

- (id)error:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  double v5 = (NSError *)a3;
  if (self->_error != v5)
  {
    objc_storeStrong((id *)&self->_error, a3);
    id v6 = PLStoryGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v8 = 138412546;
      BOOL v9 = v5;
      __int16 v10 = 2112;
      id v11 = self;
      _os_log_impl(&dword_1A9AE7000, v6, OS_LOG_TYPE_ERROR, "Producer result error: %@ %@", (uint8_t *)&v8, 0x16u);
    }
  }
  return self;
}

- (id)fractionCompleted:(float)a3
{
  if (a3 < 1.0) {
    self->_flags |= 1uLL;
  }
  objc_msgSend(NSNumber, "numberWithFloat:");
  uint64_t v4 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  fractionCompleted = self->_fractionCompleted;
  self->_fractionCompleted = v4;

  return self;
}

- (id)flags:(unint64_t)a3
{
  *((void *)self + 2) = a3;
  return self;
}

- (PXStoryProducerResult)initWithObject:(id)a3
{
  id v5 = a3;
  id v6 = [(PXStoryProducerResult *)self init];
  id v7 = v6;
  if (v6) {
    objc_storeStrong(&v6->_object, a3);
  }

  return v7;
}

- (PXStoryProducerResult)init
{
  v3.receiver = self;
  v3.super_class = (Class)PXStoryProducerResult;
  result = [(PXStoryProducerResult *)&v3 init];
  if (result) {
    result->_productionDuration = NAN;
  }
  return result;
}

+ (PXStoryProducerResult)nullResult
{
  v2 = objc_alloc_init(PXStoryProducerResult);
  return v2;
}

@end
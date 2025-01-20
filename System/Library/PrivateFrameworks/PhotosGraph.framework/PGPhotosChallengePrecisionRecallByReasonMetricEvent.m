@interface PGPhotosChallengePrecisionRecallByReasonMetricEvent
- (NSArray)payloads;
- (NSString)description;
@end

@implementation PGPhotosChallengePrecisionRecallByReasonMetricEvent

- (NSString)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = (objc_class *)objc_opt_class();
  v6 = NSStringFromClass(v5);
  v7 = [(PGPhotosChallengeMetricEvent *)self identifier];
  v8 = [(PGPhotosChallengePrecisionRecallByReasonMetricEvent *)self payloads];
  v9 = [v3 stringWithFormat:@"<%@: %p> %@:\nIdentifier:%@\nPayloads:%@", v4, self, v6, v7, v8];

  return (NSString *)v9;
}

- (NSArray)payloads
{
  v19[1] = *MEMORY[0x1E4F143B8];
  v3 = [(PGPhotosChallengeMetricEvent *)self evaluation];
  if (v3)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v13.receiver = self;
      v13.super_class = (Class)PGPhotosChallengePrecisionRecallByReasonMetricEvent;
      uint64_t v4 = [(PGPhotosChallengePrecisionRecallByReasonMetricEvent *)&v13 self];
      uint64_t v5 = [(PGPhotosChallengeMetricEvent *)self preparePayloadForPrecisionRecallEval:v4 withEvaluations:v3];
      goto LABEL_9;
    }
    v8 = +[PGLogging sharedLogging];
    v9 = [v8 loggingConnection];

    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v12 = [(PGPhotosChallengeMetricEvent *)self evaluation];
      *(_DWORD *)buf = 138412290;
      uint64_t v18 = objc_opt_class();
      _os_log_error_impl(&dword_1D1805000, v9, OS_LOG_TYPE_ERROR, "PGPhotosChallengePrecisionRecallByReasonMetricEvent: evaluation object is the wrong type (%@)", buf, 0xCu);
    }
    v14.receiver = self;
    v14.super_class = (Class)PGPhotosChallengePrecisionRecallByReasonMetricEvent;
    uint64_t v4 = [(PGPhotosChallengeMetricEvent *)&v14 payload];
    v16 = v4;
    v6 = (void *)MEMORY[0x1E4F1C978];
    v7 = &v16;
  }
  else
  {
    v15.receiver = self;
    v15.super_class = (Class)PGPhotosChallengePrecisionRecallByReasonMetricEvent;
    uint64_t v4 = [(PGPhotosChallengeMetricEvent *)&v15 payload];
    v19[0] = v4;
    v6 = (void *)MEMORY[0x1E4F1C978];
    v7 = (void **)v19;
  }
  uint64_t v5 = [v6 arrayWithObjects:v7 count:1];
LABEL_9:
  v10 = (void *)v5;

  return (NSArray *)v10;
}

@end
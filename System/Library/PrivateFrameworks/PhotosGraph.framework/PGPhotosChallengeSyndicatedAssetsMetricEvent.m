@interface PGPhotosChallengeSyndicatedAssetsMetricEvent
- (NSArray)payloads;
- (NSString)description;
@end

@implementation PGPhotosChallengeSyndicatedAssetsMetricEvent

- (NSString)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = (objc_class *)objc_opt_class();
  v6 = NSStringFromClass(v5);
  v7 = [(PGPhotosChallengeMetricEvent *)self identifier];
  v8 = [(PGPhotosChallengeSyndicatedAssetsMetricEvent *)self payloads];
  v9 = [v3 stringWithFormat:@"<%@: %p> %@:\nIdentifier:%@\nPayloads:%@", v4, self, v6, v7, v8];

  return (NSString *)v9;
}

- (NSArray)payloads
{
  v36[1] = *MEMORY[0x1E4F143B8];
  v3 = [(PGPhotosChallengeMetricEvent *)self evaluation];
  if (!v3)
  {
    v31.receiver = self;
    v31.super_class = (Class)PGPhotosChallengeSyndicatedAssetsMetricEvent;
    id obj = [(PGPhotosChallengeMetricEvent *)&v31 payload];
    v36[0] = obj;
    v17 = (id *)v36;
LABEL_15:
    id v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:1];
    goto LABEL_16;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v18 = +[PGLogging sharedLogging];
    v19 = [v18 loggingConnection];

    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      v21 = [(PGPhotosChallengeMetricEvent *)self evaluation];
      *(_DWORD *)buf = 138412290;
      uint64_t v35 = objc_opt_class();
      _os_log_error_impl(&dword_1D1805000, v19, OS_LOG_TYPE_ERROR, "PGPhotosChallengeSyndicatedAssetsMetricEvent: evaluation object is the wrong type (%@)", buf, 0xCu);
    }
    v30.receiver = self;
    v30.super_class = (Class)PGPhotosChallengeSyndicatedAssetsMetricEvent;
    id obj = [(PGPhotosChallengeMetricEvent *)&v30 payload];
    id v33 = obj;
    v17 = &v33;
    goto LABEL_15;
  }
  id v24 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id obj = [v3 evaluationByReason];
  uint64_t v4 = [obj countByEnumeratingWithState:&v26 objects:v32 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v23 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v27 != v23) {
          objc_enumerationMutation(obj);
        }
        uint64_t v7 = *(void *)(*((void *)&v26 + 1) + 8 * i);
        v8 = [v3 evaluationByReason];
        [v8 objectForKeyedSubscript:v7];
        v10 = v9 = v3;

        v25.receiver = self;
        v25.super_class = (Class)PGPhotosChallengeSyndicatedAssetsMetricEvent;
        v11 = [(PGPhotosChallengeMetricEvent *)&v25 payload];
        v12 = (void *)[v11 mutableCopy];

        [v12 setObject:v7 forKeyedSubscript:@"questionInfo"];
        v13 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v10, "falseNegatives"));
        [v12 setObject:v13 forKeyedSubscript:@"falseNegativeCount"];

        v14 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v10, "falsePositives"));
        [v12 setObject:v14 forKeyedSubscript:@"falsePositiveCount"];

        v15 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v10, "trueNegatives"));
        [v12 setObject:v15 forKeyedSubscript:@"trueNegativeCount"];

        v16 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v10, "truePositives"));
        [v12 setObject:v16 forKeyedSubscript:@"truePositiveCount"];

        [v24 addObject:v12];
        v3 = v9;
      }
      uint64_t v5 = [obj countByEnumeratingWithState:&v26 objects:v32 count:16];
    }
    while (v5);
  }
LABEL_16:

  return (NSArray *)v24;
}

@end
@interface CRTextResults
+ (id)linesFromTextFeatures:(id)a3;
- (CRTextDetectorResults)detectorResults;
- (CRTextFeature)titleTextFeature;
- (CRTextRecognizerResults)recognizerResults;
- (NSArray)lineFeatures;
- (NSArray)textFeatures;
- (NSDate)endTime;
- (NSDate)startTime;
- (int64_t)filteredOutFeatureCount;
- (void)setDetectorResults:(id)a3;
- (void)setEndTime:(id)a3;
- (void)setFilteredOutFeatureCount:(int64_t)a3;
- (void)setRecognizerResults:(id)a3;
- (void)setStartTime:(id)a3;
- (void)setTextFeatures:(id)a3;
- (void)setTitleTextFeature:(id)a3;
@end

@implementation CRTextResults

- (NSArray)lineFeatures
{
  v3 = objc_opt_class();
  v4 = [(CRTextResults *)self textFeatures];
  v5 = [v3 linesFromTextFeatures:v4];

  return (NSArray *)v5;
}

+ (id)linesFromTextFeatures:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = objc_opt_new();
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v20 != v7) {
          objc_enumerationMutation(v5);
        }
        v9 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        if ([v9 type] == 1)
        {
          long long v17 = 0u;
          long long v18 = 0u;
          long long v15 = 0u;
          long long v16 = 0u;
          v10 = objc_msgSend(v9, "subFeatures", 0);
          uint64_t v11 = [v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
          if (v11)
          {
            uint64_t v12 = *(void *)v16;
            do
            {
              for (uint64_t j = 0; j != v11; ++j)
              {
                if (*(void *)v16 != v12) {
                  objc_enumerationMutation(v10);
                }
                [v4 addObject:*(void *)(*((void *)&v15 + 1) + 8 * j)];
              }
              uint64_t v11 = [v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
            }
            while (v11);
          }
        }
        else
        {
          [v4 addObject:v9];
        }
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
    }
    while (v6);
  }

  return v4;
}

- (NSDate)startTime
{
  return self->_startTime;
}

- (void)setStartTime:(id)a3
{
}

- (NSDate)endTime
{
  return self->_endTime;
}

- (void)setEndTime:(id)a3
{
}

- (CRTextDetectorResults)detectorResults
{
  return self->_detectorResults;
}

- (void)setDetectorResults:(id)a3
{
}

- (CRTextRecognizerResults)recognizerResults
{
  return self->_recognizerResults;
}

- (void)setRecognizerResults:(id)a3
{
}

- (NSArray)textFeatures
{
  return self->_textFeatures;
}

- (void)setTextFeatures:(id)a3
{
}

- (CRTextFeature)titleTextFeature
{
  return self->_titleTextFeature;
}

- (void)setTitleTextFeature:(id)a3
{
}

- (int64_t)filteredOutFeatureCount
{
  return self->_filteredOutFeatureCount;
}

- (void)setFilteredOutFeatureCount:(int64_t)a3
{
  self->_filteredOutFeatureCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titleTextFeature, 0);
  objc_storeStrong((id *)&self->_textFeatures, 0);
  objc_storeStrong((id *)&self->_recognizerResults, 0);
  objc_storeStrong((id *)&self->_detectorResults, 0);
  objc_storeStrong((id *)&self->_endTime, 0);
  objc_storeStrong((id *)&self->_startTime, 0);
}

@end
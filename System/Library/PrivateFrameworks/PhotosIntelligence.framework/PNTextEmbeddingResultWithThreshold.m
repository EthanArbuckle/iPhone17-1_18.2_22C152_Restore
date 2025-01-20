@interface PNTextEmbeddingResultWithThreshold
- (NSArray)embedding;
- (NSNumber)calibrationVersion;
- (PNTextEmbeddingResultWithThreshold)initWithEmbedding:(id)a3 threshold:(id)a4;
- (id)calibratedThresholdForImageSearchWithBaseThreshold:(id)a3;
- (id)defaultThresholdForImageSearch;
@end

@implementation PNTextEmbeddingResultWithThreshold

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_calibrationVersion, 0);
  objc_storeStrong((id *)&self->_embedding, 0);
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_threshold, 0);
}

- (NSNumber)calibrationVersion
{
  return self->_calibrationVersion;
}

- (NSArray)embedding
{
  return self->_embedding;
}

- (id)calibratedThresholdForImageSearchWithBaseThreshold:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
  {
    v8 = log;
    [a3 floatValue];
    double v10 = v9;
    [(NSNumber *)self->_threshold floatValue];
    int v12 = 134218240;
    double v13 = v10;
    __int16 v14 = 2048;
    double v15 = v11;
    _os_log_error_impl(&dword_25934C000, v8, OS_LOG_TYPE_ERROR, "This version of PNTextEmbeddingService does not receive calibration parameters from MAD, so the given baseThreshold (%f) cannot be calibrated. Returning default threshold (%f)", (uint8_t *)&v12, 0x16u);
  }
  threshold = self->_threshold;
  return threshold;
}

- (id)defaultThresholdForImageSearch
{
  return self->_threshold;
}

- (PNTextEmbeddingResultWithThreshold)initWithEmbedding:(id)a3 threshold:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)PNTextEmbeddingResultWithThreshold;
  float v9 = [(PNTextEmbeddingResultWithThreshold *)&v15 init];
  double v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_embedding, a3);
    objc_storeStrong((id *)&v10->_threshold, a4);
    os_log_t v11 = os_log_create((const char *)*MEMORY[0x263F5DBE0], "PNTextEmbeddingService");
    log = v10->_log;
    v10->_log = (OS_os_log *)v11;

    calibrationVersion = v10->_calibrationVersion;
    v10->_calibrationVersion = 0;
  }
  return v10;
}

@end
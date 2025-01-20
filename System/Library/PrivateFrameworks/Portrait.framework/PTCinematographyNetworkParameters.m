@interface PTCinematographyNetworkParameters
- (BOOL)runOnlyWhenDetectorDidRun;
- (NSArray)inputSchemas;
- (NSSet)supportedDetectionTypes;
- (PTCinematographyNetworkParameters)initWithURL:(id)a3;
- (float)expectedFPS;
- (float)forgetDetectionsAfterSeconds;
- (id)_defaultSupportedDetectionTypes;
- (unint64_t)totalInputFloatCount;
- (void)_processInputSchemaDicts:(id)a3;
- (void)setExpectedFPS:(float)a3;
- (void)setForgetDetectionsAfterSeconds:(float)a3;
- (void)setInputSchemas:(id)a3;
- (void)setRunOnlyWhenDetectorDidRun:(BOOL)a3;
- (void)setSupportedDetectionTypes:(id)a3;
@end

@implementation PTCinematographyNetworkParameters

- (PTCinematographyNetworkParameters)initWithURL:(id)a3
{
  id v4 = a3;
  v5 = [MEMORY[0x1E4F1CA10] inputStreamWithURL:v4];
  [v5 open];
  id v23 = 0;
  v6 = [MEMORY[0x1E4F28D90] JSONObjectWithStream:v5 options:0 error:&v23];
  id v7 = v23;
  if (v7)
  {
    v8 = _PTLogSystem();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[PTCinematographyNetworkParameters initWithURL:]();
    }
LABEL_10:

    v18 = 0;
    goto LABEL_11;
  }
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    v8 = _PTLogSystem();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      [(PTCinematographyNetworkParameters *)v6 initWithURL:v8];
    }
    goto LABEL_10;
  }
  v22.receiver = self;
  v22.super_class = (Class)PTCinematographyNetworkParameters;
  v9 = [(PTCinematographyNetworkParameters *)&v22 init];
  if (v9)
  {
    v10 = [(objc_class *)v6 objectForKeyedSubscript:@"expected_fps"];
    [v10 floatValue];
    v9->_expectedFPS = v11;

    v12 = [(objc_class *)v6 objectForKeyedSubscript:@"detections"];
    v13 = [v12 objectForKeyedSubscript:@"forget_after_seconds"];
    [v13 floatValue];
    v9->_forgetDetectionsAfterSeconds = v14;

    v15 = [(objc_class *)v6 objectForKeyedSubscript:@"sync_with_detector"];
    v9->_runOnlyWhenDetectorDidRun = [v15 BOOLValue];

    v16 = [(objc_class *)v6 objectForKeyedSubscript:@"supported_detection_types"];
    if (v16) {
      [MEMORY[0x1E4F1CAD0] setWithArray:v16];
    }
    else {
    uint64_t v17 = [(PTCinematographyNetworkParameters *)v9 _defaultSupportedDetectionTypes];
    }
    supportedDetectionTypes = v9->_supportedDetectionTypes;
    v9->_supportedDetectionTypes = (NSSet *)v17;

    v21 = [(objc_class *)v6 objectForKeyedSubscript:@"input_schemas"];
    [(PTCinematographyNetworkParameters *)v9 _processInputSchemaDicts:v21];
  }
  self = v9;
  v18 = self;
LABEL_11:

  return v18;
}

- (void)_processInputSchemaDicts:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [MEMORY[0x1E4F1CA48] array];
  self->_totalInputFloatCount = 0;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v17;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v16 + 1) + 8 * v10);
        v12 = [PTCinematographyNetworkInputSchema alloc];
        v13 = -[PTCinematographyNetworkInputSchema initWithModelDictionary:](v12, "initWithModelDictionary:", v11, (void)v16);
        [v5 addObject:v13];
        self->_totalInputFloatCount += [(PTCinematographyNetworkInputSchema *)v13 count];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v8);
  }

  float v14 = (NSArray *)[v5 copy];
  inputSchemas = self->_inputSchemas;
  self->_inputSchemas = v14;
}

- (id)_defaultSupportedDetectionTypes
{
  return (id)[MEMORY[0x1E4F1CAD0] setWithArray:&unk_1F26C1168];
}

- (float)expectedFPS
{
  return self->_expectedFPS;
}

- (void)setExpectedFPS:(float)a3
{
  self->_expectedFPS = a3;
}

- (float)forgetDetectionsAfterSeconds
{
  return self->_forgetDetectionsAfterSeconds;
}

- (void)setForgetDetectionsAfterSeconds:(float)a3
{
  self->_forgetDetectionsAfterSeconds = a3;
}

- (BOOL)runOnlyWhenDetectorDidRun
{
  return self->_runOnlyWhenDetectorDidRun;
}

- (void)setRunOnlyWhenDetectorDidRun:(BOOL)a3
{
  self->_runOnlyWhenDetectorDidRun = a3;
}

- (NSSet)supportedDetectionTypes
{
  return (NSSet *)objc_getProperty(self, a2, 24, 1);
}

- (void)setSupportedDetectionTypes:(id)a3
{
}

- (NSArray)inputSchemas
{
  return (NSArray *)objc_getProperty(self, a2, 32, 1);
}

- (void)setInputSchemas:(id)a3
{
}

- (unint64_t)totalInputFloatCount
{
  return self->_totalInputFloatCount;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inputSchemas, 0);

  objc_storeStrong((id *)&self->_supportedDetectionTypes, 0);
}

- (void)initWithURL:(NSObject *)a3 .cold.1(objc_class *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v5 = NSStringFromClass(a1);
  OUTLINED_FUNCTION_0_5();
  uint64_t v7 = a2;
  _os_log_error_impl(&dword_1D0778000, a3, OS_LOG_TYPE_ERROR, "expected a dictionary, got a %@ from network parameters %@", v6, 0x16u);
}

- (void)initWithURL:.cold.2()
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_0_5();
  uint64_t v3 = v0;
  _os_log_error_impl(&dword_1D0778000, v1, OS_LOG_TYPE_ERROR, "error %@ reading network parameters %@", v2, 0x16u);
}

@end
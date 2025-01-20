@interface PTCinematographyNetwork
+ (BOOL)existsVersionString:(id)a3;
+ (NSString)defaultVersionString;
+ (id)defaultVersionStringForDetectionModel:(unint64_t)a3;
+ (id)earliestVersionString;
+ (id)firstExistingVersion:(id)a3;
+ (id)latestVersionString;
- (BOOL)_allNetworkDetectionsAreStaleAtTime:(id *)a3;
- (BOOL)_isNetworkCompatibleDetectionType:(unint64_t)a3;
- (BOOL)_loadEspressoNetwork:(id)a3;
- (BOOL)_shouldIgnoreNetworkPredictionIndex:(unint64_t)a3 time:(id *)a4;
- (BOOL)_shouldResetDetectionFromType:(unint64_t)a3 toType:(unint64_t)a4;
- (NSArray)inputSignals;
- (NSMutableArray)networkDetections;
- (NSMutableIndexSet)unusedIndexes;
- (NSString)versionString;
- (PTCinematographyDetection)lastFocusDetection;
- (PTCinematographyDetection)zeroDisparityDetection;
- (PTCinematographyNetwork)init;
- (PTCinematographyNetwork)initWithVersionString:(id)a3;
- (PTCinematographyNetworkParameters)params;
- (float)expectedFPS;
- (id)_asCinematographyDictionary;
- (id)_detectionAtNetworkIndex:(unint64_t)a3 frameDetections:(id)a4;
- (id)_initWithCinematographyDictionary:(id)a3;
- (id)_initWithNetwork:(id)a3 parameters:(id)a4;
- (id)stepWithFrameDetections:(id)a3;
- (int64_t)lastNetworkPredictionTrackID;
- (unint64_t)_allocateNetworkDetectionIndex;
- (unint64_t)_getLeastRecentNetworkDetectionIndex;
- (unint64_t)_networkPredictionIndex;
- (unint64_t)lastNetworkPredictionIndex;
- (void)_debugLogAllNetworkInputs;
- (void)_debugLogNetworkInputs;
- (void)_debugLogNetworkOutputs;
- (void)_forgetNetworkDetectionAtIndex:(unint64_t)a3;
- (void)_forgetNetworkDetectionsOlderThan:(id *)a3;
- (void)_getLeastRecentNetworkDetectionIndex;
- (void)_networkPredictionIndex;
- (void)_setDetection:(id)a3 asInputRow:(unint64_t)a4 time:(id *)a5 missing:(BOOL)a6;
- (void)_setMissingDetectionAtIndex:(unint64_t)a3 time:(id *)a4;
- (void)_setNetworkDetection:(id)a3 atIndex:(unint64_t)a4 time:(id *)a5;
- (void)_setNetworkDetectionsFromFrameDetections:(id)a3;
- (void)_setNetworkInputsFromNetworkDetections;
- (void)_updateLastNetworkPredictionIndex:(unint64_t)a3 time:(id *)a4;
- (void)dealloc;
- (void)setLastFocusDetection:(id)a3;
- (void)setLastNetworkPredictionIndex:(unint64_t)a3;
- (void)setLastNetworkPredictionTrackID:(int64_t)a3;
@end

@implementation PTCinematographyNetwork

+ (NSString)defaultVersionString
{
  v2 = [a1 firstExistingVersion:&unk_1F26C1000];
  v3 = v2;
  if (v2)
  {
    id v4 = v2;
  }
  else
  {
    id v4 = [&unk_1F26C1018 objectAtIndexedSubscript:0];
  }
  v5 = v4;

  return (NSString *)v5;
}

+ (id)defaultVersionStringForDetectionModel:(unint64_t)a3
{
  if (a3 == 1)
  {
    v3 = &unk_1F26C1030;
    uint64_t v4 = 0;
    goto LABEL_5;
  }
  if (a3 == 2)
  {
    v3 = &unk_1F26C1048;
    uint64_t v4 = 1;
LABEL_5:
    v5 = [v3 objectAtIndexedSubscript:v4];
    goto LABEL_7;
  }
  v5 = [a1 defaultVersionString];
LABEL_7:

  return v5;
}

+ (id)firstExistingVersion:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v4 = a3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if (objc_msgSend(a1, "existsVersionString:", v9, (void)v13))
        {
          id v11 = v9;
          v10 = v4;
          goto LABEL_13;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }

  v10 = _PTLogSystem();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
    +[PTCinematographyNetwork firstExistingVersion:]();
  }
  id v11 = 0;
LABEL_13:

  return v11;
}

+ (BOOL)existsVersionString:(id)a3
{
  uint64_t v4 = (void *)MEMORY[0x1E4F28B50];
  id v5 = a3;
  uint64_t v6 = [v4 bundleForClass:a1];
  uint64_t v7 = PTVersionStringWithComponents(v5, 1);

  v8 = [NSString stringWithFormat:@"cinematography_models/%@", v7];
  v9 = [v6 URLForResource:@"model.espresso" withExtension:@"net" subdirectory:v8];
  BOOL v10 = v9 != 0;

  return v10;
}

- (PTCinematographyNetwork)init
{
  v3 = [(id)objc_opt_class() defaultVersionString];
  uint64_t v4 = [(PTCinematographyNetwork *)self initWithVersionString:v3];

  return v4;
}

- (PTCinematographyNetwork)initWithVersionString:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  uint64_t v7 = PTVersionStringWithComponents(v5, 1);
  v8 = [NSString stringWithFormat:@"cinematography_models/%@", v7];
  v9 = [v6 URLForResource:@"model.espresso" withExtension:@"net" subdirectory:v8];
  if (v9)
  {
    BOOL v10 = [v6 URLForResource:@"model.parameters" withExtension:@"json" subdirectory:v8];
    if (!v10)
    {
      id v11 = _PTLogSystem();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v19 = v7;
        _os_log_impl(&dword_1D0778000, v11, OS_LOG_TYPE_DEFAULT, "no model parameters json file for version %@", buf, 0xCu);
      }
    }
    v12 = [[PTCinematographyNetworkParameters alloc] initWithURL:v10];
    if (v12)
    {
      long long v13 = [(PTCinematographyNetwork *)self _initWithNetwork:v9 parameters:v12];
      if (v13)
      {
        long long v14 = _PTLogSystem();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
          -[PTCinematographyNetwork initWithVersionString:]();
        }

        objc_storeStrong(v13 + 153, a3);
      }
      self = v13;
      long long v15 = self;
    }
    else
    {
      long long v16 = _PTLogSystem();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        -[PTCinematographyNetwork initWithVersionString:]();
      }

      long long v15 = 0;
    }
  }
  else
  {
    BOOL v10 = _PTLogSystem();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[PTCinematographyNetwork initWithVersionString:]();
    }
    long long v15 = 0;
  }

  return v15;
}

- (id)_initWithNetwork:(id)a3 parameters:(id)a4
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v39.receiver = self;
  v39.super_class = (Class)PTCinematographyNetwork;
  v8 = [(PTCinematographyNetwork *)&v39 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_params, a4);
    if ([(PTCinematographyNetwork *)v9 _loadEspressoNetwork:v6])
    {
      id v32 = v7;
      v9->_step_uint64_t i = -1;
      *(_OWORD *)&v9->_lastNetworkPredictionIndex = xmmword_1D081F990;
      BOOL v10 = [PTCinematographyDetection alloc];
      long long v37 = *MEMORY[0x1E4F1F9F0];
      uint64_t v38 = *(void *)(MEMORY[0x1E4F1F9F0] + 16);
      uint64_t v11 = -[PTCinematographyDetection initWithTime:rect:focusDistance:](v10, "initWithTime:rect:focusDistance:", &v37, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24), 0.0);
      zeroDisparityDetection = v9->_zeroDisparityDetection;
      v9->_zeroDisparityDetection = (PTCinematographyDetection *)v11;

      [(PTCinematographyDetection *)v9->_zeroDisparityDetection setDetectionType:101];
      [(PTCinematographyDetection *)v9->_zeroDisparityDetection setTrackIdentifier:0x1000000000];
      uint64_t v13 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v9->_x_in.height];
      networkDetections = v9->_networkDetections;
      v9->_networkDetections = (NSMutableArray *)v13;

      uint64_t v15 = [MEMORY[0x1E4F28E60] indexSet];
      unusedIndexes = v9->_unusedIndexes;
      v9->_unusedIndexes = (NSMutableIndexSet *)v15;

      v17 = [MEMORY[0x1E4F1CA48] array];
      long long v33 = 0u;
      long long v34 = 0u;
      long long v35 = 0u;
      long long v36 = 0u;
      uint64_t v18 = [(PTCinematographyNetwork *)v9 params];
      v19 = [v18 inputSchemas];

      uint64_t v20 = [v19 countByEnumeratingWithState:&v33 objects:v40 count:16];
      if (v20)
      {
        uint64_t v21 = v20;
        uint64_t v22 = *(void *)v34;
        do
        {
          for (uint64_t i = 0; i != v21; ++i)
          {
            if (*(void *)v34 != v22) {
              objc_enumerationMutation(v19);
            }
            v24 = *(void **)(*((void *)&v33 + 1) + 8 * i);
            v25 = [PTCinematographyNetworkSignal alloc];
            v26 = [v24 params];
            v27 = [(PTCinematographyNetworkSignal *)v25 initWithModelDictionary:v26];

            [v17 addObject:v27];
          }
          uint64_t v21 = [v19 countByEnumeratingWithState:&v33 objects:v40 count:16];
        }
        while (v21);
      }

      uint64_t v28 = [v17 copy];
      inputSignals = v9->_inputSignals;
      v9->_inputSignals = (NSArray *)v28;

      bzero(v9->_x_in.data, 4 * v9->_x_in.width * v9->_x_in.height);
      bzero(v9->_mask_in.data, 4 * v9->_mask_in.height);
      bzero(v9->_hx_out.data, 4 * v9->_hx_out.width * v9->_hx_out.height);
      bzero(v9->_cx_out.data, 4 * v9->_cx_out.width * v9->_cx_out.height);
      v30 = v9;
      id v7 = v32;
    }
    else
    {
      v17 = _PTLogSystem();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        -[PTCinematographyNetwork _initWithNetwork:parameters:]();
      }
      v30 = 0;
    }
  }
  else
  {
    v30 = 0;
  }

  return v30;
}

- (void)dealloc
{
  espresso_plan_destroy();
  espresso_context_destroy();
  v3.receiver = self;
  v3.super_class = (Class)PTCinematographyNetwork;
  [(PTCinematographyNetwork *)&v3 dealloc];
}

- (float)expectedFPS
{
  v2 = [(PTCinematographyNetwork *)self params];
  [v2 expectedFPS];
  float v4 = v3;

  return v4;
}

- (id)stepWithFrameDetections:(id)a3
{
  id v4 = a3;
  ++self->_step_i;
  [(PTCinematographyNetwork *)self _setNetworkDetectionsFromFrameDetections:v4];
  id v5 = [(PTCinematographyNetwork *)self params];
  if ([v5 runOnlyWhenDetectorDidRun]
    && ([v4 detectorDidRun], (uint64_t v6 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    id v7 = (void *)v6;
    v8 = [v4 detectorDidRun];
    char v9 = [v8 BOOLValue];

    if ((v9 & 1) == 0)
    {
      BOOL v10 = [(PTCinematographyNetwork *)self lastFocusDetection];

      uint64_t v11 = _PTLogSystem();
      BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG);
      if (v10)
      {
        if (v12) {
          -[PTCinematographyNetwork stepWithFrameDetections:].cold.5();
        }

        uint64_t v13 = [(PTCinematographyNetwork *)self lastFocusDetection];
        long long v14 = objc_msgSend(v4, "detectionForTrackIdentifier:", objc_msgSend(v13, "trackIdentifier"));
        uint64_t v15 = v14;
        if (v14)
        {
          id v16 = v14;
        }
        else
        {
          id v16 = [(PTCinematographyNetwork *)self lastFocusDetection];
        }
        v25 = v16;
      }
      else
      {
        if (v12) {
          -[PTCinematographyNetwork stepWithFrameDetections:].cold.4();
        }

        v25 = [v4 autoFocusDetection];
        [(PTCinematographyNetwork *)self setLastFocusDetection:v25];
      }
      goto LABEL_27;
    }
  }
  else
  {
  }
  long long v31 = 0uLL;
  uint64_t v32 = 0;
  if (v4) {
    [v4 presentationTime];
  }
  [(PTCinematographyNetwork *)self _setNetworkInputsFromNetworkDetections];
  v17 = _PTLogSystem();
  BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG);

  if (v18)
  {
    v19 = _PTLogSystem();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
      -[PTCinematographyNetwork stepWithFrameDetections:]();
    }

    [(PTCinematographyNetwork *)self _debugLogNetworkInputs];
  }
  uint64_t v20 = [(PTCinematographyNetwork *)self _networkPredictionIndex];
  uint64_t v21 = _PTLogSystem();
  BOOL v22 = os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG);

  if (v22)
  {
    v23 = _PTLogSystem();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG)) {
      -[PTCinematographyNetwork stepWithFrameDetections:]();
    }

    [(PTCinematographyNetwork *)self _debugLogNetworkOutputs];
  }
  long long v29 = v31;
  uint64_t v30 = v32;
  if ([(PTCinematographyNetwork *)self _shouldIgnoreNetworkPredictionIndex:v20 time:&v29])
  {
    v24 = _PTLogSystem();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG)) {
      -[PTCinematographyNetwork stepWithFrameDetections:](self, v20);
    }

    uint64_t v20 = 0;
  }
  v25 = [(PTCinematographyNetwork *)self _detectionAtNetworkIndex:v20 frameDetections:v4];
  if (!v25)
  {
    v25 = [v4 autoFocusDetection];
  }
  long long v29 = v31;
  uint64_t v30 = v32;
  [(PTCinematographyNetwork *)self _updateLastNetworkPredictionIndex:v20 time:&v29];
LABEL_27:
  v26 = [(PTCinematographyNetwork *)self params];
  int v27 = [v26 runOnlyWhenDetectorDidRun];

  if (v27) {
    [(PTCinematographyNetwork *)self setLastFocusDetection:v25];
  }

  return v25;
}

- (void)_updateLastNetworkPredictionIndex:(unint64_t)a3 time:(id *)a4
{
  uint64_t v7 = [(PTCinematographyNetwork *)self lastNetworkPredictionIndex];
  v8 = [(PTCinematographyNetwork *)self networkDetections];
  char v9 = [v8 objectAtIndexedSubscript:a3];
  uint64_t v10 = [v9 trackIdentifier];

  int64_t v11 = [(PTCinematographyNetwork *)self lastNetworkPredictionTrackID];
  if (!v7) {
    goto LABEL_9;
  }
  int64_t v12 = v11;
  if (v11 == v10) {
    goto LABEL_9;
  }
  uint64_t v13 = [(PTCinematographyNetwork *)self unusedIndexes];
  if ([v13 containsIndex:v7])
  {
LABEL_8:

    goto LABEL_9;
  }
  long long v14 = [(PTCinematographyNetwork *)self networkDetections];
  uint64_t v15 = [v14 objectAtIndexedSubscript:v7];
  if ([v15 trackIdentifier] != v12)
  {

    goto LABEL_8;
  }
  id v16 = [(PTCinematographyNetwork *)self networkDetections];
  v17 = [v16 objectAtIndexedSubscript:v7];
  BOOL v18 = v17;
  if (v17) {
    [v17 time];
  }
  else {
    memset(&time1, 0, sizeof(time1));
  }
  $3CC8671D27C23BF42ADDB32F2B5E48AE v21 = *a4;
  int32_t v19 = CMTimeCompare(&time1, (CMTime *)&v21);

  if (v19 < 0)
  {
    uint64_t v20 = _PTLogSystem();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
      -[PTCinematographyNetwork _updateLastNetworkPredictionIndex:time:](self, v7);
    }

    [(PTCinematographyNetwork *)self _forgetNetworkDetectionAtIndex:v7];
  }
LABEL_9:
  [(PTCinematographyNetwork *)self setLastNetworkPredictionIndex:a3];
  [(PTCinematographyNetwork *)self setLastNetworkPredictionTrackID:v10];
}

- (BOOL)_isNetworkCompatibleDetectionType:(unint64_t)a3
{
  id v4 = [(PTCinematographyNetwork *)self params];
  id v5 = [v4 supportedDetectionTypes];
  uint64_t v6 = [NSNumber numberWithUnsignedInteger:a3];
  char v7 = [v5 containsObject:v6];

  return v7;
}

- (BOOL)_loadEspressoNetwork:(id)a3
{
  id v4 = a3;
  context = (void *)espresso_create_context();
  self->_context = context;
  if (context)
  {
    plan = (void *)espresso_create_plan();
    self->_plan = plan;
    if (plan)
    {
      id v7 = [v4 path];
      [v7 UTF8String];
      int v8 = espresso_plan_add_network();

      if (v8)
      {
        char v9 = _PTLogSystem();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
          -[PTCinematographyNetwork _loadEspressoNetwork:]2();
        }
      }
      else if (espresso_plan_build())
      {
        char v9 = _PTLogSystem();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
          -[PTCinematographyNetwork _loadEspressoNetwork:]1();
        }
      }
      else
      {
        [@"x" UTF8String];
        if (espresso_network_bind_buffer())
        {
          int64_t v12 = _PTLogSystem();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
            -[PTCinematographyNetwork _loadEspressoNetwork:]0();
          }
        }
        [@"hx_in" UTF8String];
        if (espresso_network_bind_buffer())
        {
          uint64_t v13 = _PTLogSystem();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
            -[PTCinematographyNetwork _loadEspressoNetwork:].cold.9();
          }
        }
        [@"cx_in" UTF8String];
        if (espresso_network_bind_buffer())
        {
          long long v14 = _PTLogSystem();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
            -[PTCinematographyNetwork _loadEspressoNetwork:].cold.8();
          }
        }
        [@"mask" UTF8String];
        if (espresso_network_bind_buffer())
        {
          uint64_t v15 = _PTLogSystem();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
            -[PTCinematographyNetwork _loadEspressoNetwork:].cold.7();
          }
        }
        [@"hx_out" UTF8String];
        if (espresso_network_bind_buffer())
        {
          id v16 = _PTLogSystem();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
            -[PTCinematographyNetwork _loadEspressoNetwork:].cold.6();
          }
        }
        [@"cx_out" UTF8String];
        if (espresso_network_bind_buffer())
        {
          v17 = _PTLogSystem();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
            -[PTCinematographyNetwork _loadEspressoNetwork:].cold.5();
          }
        }
        [@"pred" UTF8String];
        if (espresso_network_bind_buffer())
        {
          BOOL v18 = _PTLogSystem();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
            -[PTCinematographyNetwork _loadEspressoNetwork:].cold.4();
          }
        }
        unint64_t height = self->_x_in.height;
        p_unint64_t height = &self->_x_in.height;
        if (height)
        {
          BOOL v10 = 1;
          goto LABEL_14;
        }
        char v9 = _PTLogSystem();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
          -[PTCinematographyNetwork _loadEspressoNetwork:]((uint64_t)p_height, v9, v21, v22, v23, v24, v25, v26);
        }
      }
    }
    else
    {
      char v9 = _PTLogSystem();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        -[PTCinematographyNetwork _loadEspressoNetwork:](v9);
      }
    }
  }
  else
  {
    char v9 = _PTLogSystem();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[PTCinematographyNetwork _loadEspressoNetwork:](v9);
    }
  }

  BOOL v10 = 0;
LABEL_14:

  return v10;
}

- (BOOL)_shouldIgnoreNetworkPredictionIndex:(unint64_t)a3 time:(id *)a4
{
  if (!a3) {
    return 0;
  }
  int64_t v7 = [(PTCinematographyNetwork *)self lastNetworkPredictionTrackID];
  int v8 = [(PTCinematographyNetwork *)self networkDetections];
  char v9 = [v8 objectAtIndexedSubscript:a3];
  uint64_t v10 = [v9 trackIdentifier];

  if (v7 == v10) {
    return 0;
  }
  int64_t v11 = [(PTCinematographyNetwork *)self networkDetections];
  int64_t v12 = [v11 objectAtIndexedSubscript:a3];
  uint64_t v13 = v12;
  if (v12) {
    [v12 time];
  }
  else {
    memset(&time1, 0, sizeof(time1));
  }
  $3CC8671D27C23BF42ADDB32F2B5E48AE v16 = *a4;
  int32_t v15 = CMTimeCompare(&time1, (CMTime *)&v16);

  if ((v15 & 0x80000000) == 0) {
    return 0;
  }
  if (![(PTCinematographyNetwork *)self lastNetworkPredictionIndex]) {
    return 1;
  }
  $3CC8671D27C23BF42ADDB32F2B5E48AE v16 = *a4;
  return [(PTCinematographyNetwork *)self _allNetworkDetectionsAreStaleAtTime:&v16];
}

- (BOOL)_allNetworkDetectionsAreStaleAtTime:(id *)a3
{
  id v5 = [(PTCinematographyNetwork *)self networkDetections];
  unint64_t v6 = [v5 count];

  if (v6 < 2) {
    return 1;
  }
  unint64_t v7 = 1;
  while (1)
  {
    int v8 = [(PTCinematographyNetwork *)self unusedIndexes];
    char v9 = [v8 containsIndex:v7];

    if ((v9 & 1) == 0)
    {
      uint64_t v10 = [(PTCinematographyNetwork *)self networkDetections];
      int64_t v11 = [v10 objectAtIndexedSubscript:v7];
      int64_t v12 = v11;
      if (v11) {
        [v11 time];
      }
      else {
        memset(&time1, 0, sizeof(time1));
      }
      $3CC8671D27C23BF42ADDB32F2B5E48AE v17 = *a3;
      int32_t v13 = CMTimeCompare(&time1, (CMTime *)&v17);

      if (!v13) {
        break;
      }
    }
    ++v7;
    long long v14 = [(PTCinematographyNetwork *)self networkDetections];
    unint64_t v15 = [v14 count];

    if (v7 >= v15) {
      return 1;
    }
  }
  return 0;
}

- (void)_setNetworkDetectionsFromFrameDetections:(id)a3
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1E4F1CA80];
  unint64_t v6 = [v4 allTrackIdentifiersForCinematicChoice];
  unint64_t v7 = [v5 setWithArray:v6];

  memset(&v42, 0, sizeof(v42));
  if (v4) {
    [v4 presentationTime];
  }
  int v8 = [(PTCinematographyNetwork *)self networkDetections];
  uint64_t v9 = [v8 count];

  if (v9)
  {
    CMTime v41 = v42;
    [(PTCinematographyNetwork *)self _setMissingDetectionAtIndex:0 time:&v41];
  }
  else
  {
    uint64_t v10 = [(PTCinematographyNetwork *)self zeroDisparityDetection];
    CMTime v41 = v42;
    [(PTCinematographyNetwork *)self _setNetworkDetection:v10 atIndex:0 time:&v41];
  }
  [(PTCinematographyNetworkParameters *)self->_params forgetDetectionsAfterSeconds];
  if (v11 > 0.0)
  {
    double v12 = v11;
    memset(&v41, 0, sizeof(v41));
    if (v4) {
      [v4 presentationTime];
    }
    else {
      memset(&lhs, 0, sizeof(lhs));
    }
    CMTimeMakeWithSeconds(&rhs, v12, 90000);
    CMTimeSubtract(&v41, &lhs, &rhs);
    CMTime v38 = v41;
    [(PTCinematographyNetwork *)self _forgetNetworkDetectionsOlderThan:&v38];
  }
  int32_t v13 = [(PTCinematographyNetwork *)self networkDetections];
  unint64_t v14 = [v13 count];

  if (v14 >= 2)
  {
    unint64_t v15 = 1;
    do
    {
      $3CC8671D27C23BF42ADDB32F2B5E48AE v16 = [(PTCinematographyNetwork *)self unusedIndexes];
      char v17 = [v16 containsIndex:v15];

      if ((v17 & 1) == 0)
      {
        BOOL v18 = [(PTCinematographyNetwork *)self networkDetections];
        int32_t v19 = [v18 objectAtIndexedSubscript:v15];
        uint64_t v20 = [v19 trackIdentifier];

        uint64_t v21 = [NSNumber numberWithInteger:v20];
        LODWORD(v19) = [v7 containsObject:v21];

        if (v19)
        {
          uint64_t v22 = [v4 detectionForTrackIdentifier:v20];
          CMTime v41 = v42;
          [(PTCinematographyNetwork *)self _setNetworkDetection:v22 atIndex:v15 time:&v41];
          uint64_t v23 = [NSNumber numberWithInteger:v20];
          [v7 removeObject:v23];
        }
        else
        {
          CMTime v41 = v42;
          [(PTCinematographyNetwork *)self _setMissingDetectionAtIndex:v15 time:&v41];
        }
      }
      ++v15;
      uint64_t v24 = [(PTCinematographyNetwork *)self networkDetections];
      unint64_t v25 = [v24 count];
    }
    while (v15 < v25);
  }
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v26 = v7;
  uint64_t v27 = [v26 countByEnumeratingWithState:&v34 objects:v43 count:16];
  if (v27)
  {
    uint64_t v28 = v27;
    uint64_t v29 = *(void *)v35;
    do
    {
      for (uint64_t i = 0; i != v28; ++i)
      {
        if (*(void *)v35 != v29) {
          objc_enumerationMutation(v26);
        }
        uint64_t v31 = PTTrackIDFromNumber(*(void **)(*((void *)&v34 + 1) + 8 * i));
        uint64_t v32 = objc_msgSend(v4, "detectionForTrackIdentifier:", v31, (void)v34);
        if (-[PTCinematographyNetwork _isNetworkCompatibleDetectionType:](self, "_isNetworkCompatibleDetectionType:", [v32 detectionType]))
        {
          unint64_t v33 = [(PTCinematographyNetwork *)self _allocateNetworkDetectionIndex];
          CMTime v41 = v42;
          [(PTCinematographyNetwork *)self _setNetworkDetection:v32 atIndex:v33 time:&v41];
        }
      }
      uint64_t v28 = [v26 countByEnumeratingWithState:&v34 objects:v43 count:16];
    }
    while (v28);
  }
}

- (void)_setNetworkInputsFromNetworkDetections
{
  float v3 = [(PTCinematographyNetwork *)self networkDetections];
  uint64_t v4 = [v3 count];

  if (v4)
  {
    unint64_t v5 = 0;
    do
    {
      unint64_t v6 = [(PTCinematographyNetwork *)self unusedIndexes];
      if ([v6 containsIndex:v5]) {
        float v7 = 0.0;
      }
      else {
        float v7 = 1.0;
      }
      *((float *)self->_mask_in.data + v5) = v7;

      ++v5;
      int v8 = [(PTCinematographyNetwork *)self networkDetections];
      unint64_t v9 = [v8 count];
    }
    while (v5 < v9);
  }
  memcpy(self->_hx_in.data, self->_hx_out.data, 4 * self->_hx_in.width * self->_hx_in.height);
  data = self->_cx_in.data;
  float v11 = self->_cx_out.data;
  size_t v12 = 4 * self->_cx_in.width * self->_cx_in.height;

  memcpy(data, v11, v12);
}

- (unint64_t)_networkPredictionIndex
{
  espresso_plan_execute_sync();
  unint64_t height = self->_pred_out.height;
  if (height < 2)
  {
    unint64_t v4 = 0;
  }
  else
  {
    unint64_t v4 = 0;
    data = (float *)self->_pred_out.data;
    float v6 = *data;
    for (uint64_t i = 1; i != height; ++i)
    {
      if (v6 < data[i])
      {
        unint64_t v4 = i;
        float v6 = data[i];
      }
    }
  }
  int v8 = _PTLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[PTCinematographyNetwork _networkPredictionIndex]();
  }

  return v4;
}

- (id)_detectionAtNetworkIndex:(unint64_t)a3 frameDetections:(id)a4
{
  id v6 = a4;
  float v7 = [(PTCinematographyNetwork *)self unusedIndexes];
  int v8 = [v7 containsIndex:a3];

  if (v8)
  {
    unint64_t v9 = _PTLogSystem();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[PTCinematographyNetwork _detectionAtNetworkIndex:frameDetections:](a3, v9);
    }
  }
  else
  {
    if (!a3) {
      goto LABEL_10;
    }
    uint64_t v10 = [(PTCinematographyNetwork *)self networkDetections];
    unint64_t v11 = [v10 count];

    if (v11 > a3)
    {
      size_t v12 = [(PTCinematographyNetwork *)self networkDetections];
      int32_t v13 = [v12 objectAtIndexedSubscript:a3];
      uint64_t v14 = [v13 trackIdentifier];

      unint64_t v15 = [v6 detectionForTrackIdentifier:v14];
      $3CC8671D27C23BF42ADDB32F2B5E48AE v16 = v15;
      if (v15)
      {
        a3 = v15;
      }
      else
      {
        BOOL v18 = [(PTCinematographyNetwork *)self networkDetections];
        int32_t v19 = [v18 objectAtIndexedSubscript:a3];
        a3 = [v19 copy];
      }
      goto LABEL_10;
    }
  }
  a3 = 0;
LABEL_10:

  return (id)a3;
}

- (void)_setDetection:(id)a3 asInputRow:(unint64_t)a4 time:(id *)a5 missing:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  unint64_t width = self->_x_in.width;
  size_t v12 = (char *)self->_x_in.data + 4 * width * a4;
  int32_t v13 = [PTCinematographyNetworkPayload alloc];
  $3CC8671D27C23BF42ADDB32F2B5E48AE v25 = *a5;
  uint64_t v14 = [(PTCinematographyNetworkPayload *)v13 initWithTime:&v25 detection:v10 missing:v6];
  unint64_t v15 = [[PTCinematographyNetworkFloatOutputStream alloc] initWithDestination:v12 count:width];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v16 = [(PTCinematographyNetwork *)self inputSignals];
  uint64_t v17 = [v16 countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v22;
    do
    {
      uint64_t v20 = 0;
      do
      {
        if (*(void *)v22 != v19) {
          objc_enumerationMutation(v16);
        }
        [*(id *)(*((void *)&v21 + 1) + 8 * v20++) writePayload:v14 toStream:v15];
      }
      while (v18 != v20);
      uint64_t v18 = [v16 countByEnumeratingWithState:&v21 objects:v26 count:16];
    }
    while (v18);
  }
}

- (id)_initWithCinematographyDictionary:(id)a3
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  unint64_t v5 = [v4 objectForKeyedSubscript:@"version"];
  BOOL v6 = [(PTCinematographyNetwork *)self initWithVersionString:v5];

  if (v6)
  {
    float v7 = [v4 objectForKeyedSubscript:@"_step_i"];
    v6->_step_uint64_t i = [v7 integerValue];

    id v8 = [v4 objectForKeyedSubscript:@"_network_detections"];
    objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v8, "count"));
    unint64_t v9 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
    long long v41 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    id v10 = v8;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v41 objects:&v45 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v42;
      do
      {
        uint64_t v14 = 0;
        do
        {
          if (*(void *)v42 != v13) {
            objc_enumerationMutation(v10);
          }
          uint64_t v15 = *(void *)(*((void *)&v41 + 1) + 8 * v14);
          $3CC8671D27C23BF42ADDB32F2B5E48AE v16 = [PTCinematographyDetection alloc];
          id v17 = -[PTCinematographyDetection _initWithCinematographyDictionary:](v16, "_initWithCinematographyDictionary:", v15, (void)v41);
          [(NSMutableArray *)v9 addObject:v17];

          ++v14;
        }
        while (v12 != v14);
        uint64_t v12 = [v10 countByEnumeratingWithState:&v41 objects:&v45 count:16];
      }
      while (v12);
    }

    networkDetections = v6->_networkDetections;
    v6->_networkDetections = v9;

    uint64_t v19 = [v4 objectForKeyedSubscript:@"_last_focus_detection"];
    if (v19)
    {
      uint64_t v20 = [[PTCinematographyDetection alloc] _initWithCinematographyDictionary:v19];
      lastFocusDetection = v6->_lastFocusDetection;
      v6->_lastFocusDetection = v20;
    }
    uint64_t v22 = objc_msgSend(MEMORY[0x1E4F28E60], "indexSet", (void)v41);
    unusedIndexes = v6->_unusedIndexes;
    v6->_unusedIndexes = (NSMutableIndexSet *)v22;

    if ((unint64_t)[(NSMutableArray *)v6->_networkDetections count] >= 2)
    {
      unint64_t v24 = 1;
      do
      {
        $3CC8671D27C23BF42ADDB32F2B5E48AE v25 = [(NSMutableArray *)v6->_networkDetections objectAtIndexedSubscript:v24];
        int v26 = [v25 _isInvalid];

        if (v26) {
          [(NSMutableIndexSet *)v6->_unusedIndexes addIndex:v24];
        }
        ++v24;
      }
      while (v24 < [(NSMutableArray *)v6->_networkDetections count]);
    }
    uint64_t v27 = [v4 objectForKeyedSubscript:@"_hx_out"];
    long long v28 = *(_OWORD *)&v6->_hx_out.stride_batch_number;
    long long v53 = *(_OWORD *)&v6->_hx_out.stride_height;
    long long v54 = v28;
    uint64_t v55 = *(void *)&v6->_hx_out.storage_type;
    long long v29 = *(_OWORD *)&v6->_hx_out.width;
    long long v49 = *(_OWORD *)&v6->_hx_out.stride[2];
    long long v50 = v29;
    long long v30 = *(_OWORD *)&v6->_hx_out.sequence_length;
    long long v51 = *(_OWORD *)&v6->_hx_out.channels;
    long long v52 = v30;
    long long v31 = *(_OWORD *)v6->_hx_out.dim;
    long long v45 = *(_OWORD *)&v6->_hx_out.data;
    long long v46 = v31;
    long long v32 = *(_OWORD *)v6->_hx_out.stride;
    long long v47 = *(_OWORD *)&v6->_hx_out.dim[2];
    long long v48 = v32;
    SetEspressoArray((uint64_t *)&v45, v27);

    unint64_t v33 = [v4 objectForKeyedSubscript:@"_cx_out"];
    long long v34 = *(_OWORD *)&v6->_cx_out.stride_batch_number;
    long long v53 = *(_OWORD *)&v6->_cx_out.stride_height;
    long long v54 = v34;
    uint64_t v55 = *(void *)&v6->_cx_out.storage_type;
    long long v35 = *(_OWORD *)&v6->_cx_out.width;
    long long v49 = *(_OWORD *)&v6->_cx_out.stride[2];
    long long v50 = v35;
    long long v36 = *(_OWORD *)&v6->_cx_out.sequence_length;
    long long v51 = *(_OWORD *)&v6->_cx_out.channels;
    long long v52 = v36;
    long long v37 = *(_OWORD *)v6->_cx_out.dim;
    long long v45 = *(_OWORD *)&v6->_cx_out.data;
    long long v46 = v37;
    long long v38 = *(_OWORD *)v6->_cx_out.stride;
    long long v47 = *(_OWORD *)&v6->_cx_out.dim[2];
    long long v48 = v38;
    SetEspressoArray((uint64_t *)&v45, v33);

    objc_super v39 = v6;
  }

  return v6;
}

- (id)_asCinematographyDictionary
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  float v3 = objc_opt_new();
  [v3 setObject:self->_versionString forKeyedSubscript:@"version"];
  id v4 = [NSNumber numberWithInteger:self->_step_i];
  [v3 setObject:v4 forKeyedSubscript:@"_step_i"];

  id v5 = [(PTCinematographyNetwork *)self networkDetections];
  BOOL v6 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v5, "count"));
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v30 objects:&v34 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v31;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v31 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = objc_msgSend(*(id *)(*((void *)&v30 + 1) + 8 * i), "_asCinematographyDictionary", (void)v30);
        [v6 addObject:v12];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v30 objects:&v34 count:16];
    }
    while (v9);
  }

  uint64_t v13 = (void *)[v6 copy];
  [v3 setObject:v13 forKeyedSubscript:@"_network_detections"];

  uint64_t v14 = [(PTCinematographyNetwork *)self lastFocusDetection];
  uint64_t v15 = [v14 _asCinematographyDictionary];
  [v3 setObject:v15 forKeyedSubscript:@"_last_focus_detection"];

  long long v16 = *(_OWORD *)&self->_hx_out.stride_batch_number;
  long long v42 = *(_OWORD *)&self->_hx_out.stride_height;
  long long v43 = v16;
  uint64_t v44 = *(void *)&self->_hx_out.storage_type;
  long long v17 = *(_OWORD *)&self->_hx_out.width;
  long long v38 = *(_OWORD *)&self->_hx_out.stride[2];
  long long v39 = v17;
  long long v18 = *(_OWORD *)&self->_hx_out.sequence_length;
  long long v40 = *(_OWORD *)&self->_hx_out.channels;
  long long v41 = v18;
  long long v19 = *(_OWORD *)self->_hx_out.dim;
  long long v34 = *(_OWORD *)&self->_hx_out.data;
  long long v35 = v19;
  long long v20 = *(_OWORD *)self->_hx_out.stride;
  long long v36 = *(_OWORD *)&self->_hx_out.dim[2];
  long long v37 = v20;
  long long v21 = CopyEspressoArray((int **)&v34);
  [v3 setObject:v21 forKeyedSubscript:@"_hx_out"];

  long long v22 = *(_OWORD *)&self->_cx_out.stride_batch_number;
  long long v42 = *(_OWORD *)&self->_cx_out.stride_height;
  long long v43 = v22;
  uint64_t v44 = *(void *)&self->_cx_out.storage_type;
  long long v23 = *(_OWORD *)&self->_cx_out.width;
  long long v38 = *(_OWORD *)&self->_cx_out.stride[2];
  long long v39 = v23;
  long long v24 = *(_OWORD *)&self->_cx_out.sequence_length;
  long long v40 = *(_OWORD *)&self->_cx_out.channels;
  long long v41 = v24;
  long long v25 = *(_OWORD *)self->_cx_out.dim;
  long long v34 = *(_OWORD *)&self->_cx_out.data;
  long long v35 = v25;
  long long v26 = *(_OWORD *)self->_cx_out.stride;
  long long v36 = *(_OWORD *)&self->_cx_out.dim[2];
  long long v37 = v26;
  uint64_t v27 = CopyEspressoArray((int **)&v34);
  [v3 setObject:v27 forKeyedSubscript:@"_cx_out"];

  long long v28 = (void *)[v3 copy];

  return v28;
}

- (unint64_t)_getLeastRecentNetworkDetectionIndex
{
  float v3 = [(PTCinematographyNetwork *)self networkDetections];
  if ((unint64_t)[v3 count] <= 1) {
    -[PTCinematographyNetwork _getLeastRecentNetworkDetectionIndex]();
  }

  memset(&v23, 0, sizeof(v23));
  id v4 = [(PTCinematographyNetwork *)self networkDetections];
  id v5 = [v4 objectAtIndexedSubscript:1];
  BOOL v6 = v5;
  if (v5) {
    [v5 time];
  }
  else {
    memset(&v23, 0, sizeof(v23));
  }

  id v7 = [(PTCinematographyNetwork *)self networkDetections];
  unint64_t v8 = [v7 count];

  if (v8 < 3) {
    return 1;
  }
  unint64_t v9 = 1;
  unint64_t v10 = 2;
  do
  {
    uint64_t v11 = [(PTCinematographyNetwork *)self networkDetections];
    uint64_t v12 = [v11 objectAtIndexedSubscript:v10];
    uint64_t v13 = v12;
    if (v12) {
      [v12 time];
    }
    else {
      memset(&time1, 0, sizeof(time1));
    }
    CMTime v21 = v23;
    int32_t v14 = CMTimeCompare(&time1, &v21);

    if (v14 < 0)
    {
      uint64_t v15 = [(PTCinematographyNetwork *)self networkDetections];
      long long v16 = [v15 objectAtIndexedSubscript:v10];
      long long v17 = v16;
      if (v16) {
        [v16 time];
      }
      else {
        memset(&v21, 0, sizeof(v21));
      }
      CMTime v23 = v21;

      unint64_t v9 = v10;
    }
    ++v10;
    long long v18 = [(PTCinematographyNetwork *)self networkDetections];
    unint64_t v19 = [v18 count];
  }
  while (v10 < v19);
  return v9;
}

- (void)_forgetNetworkDetectionAtIndex:(unint64_t)a3
{
  id v5 = [(PTCinematographyNetwork *)self unusedIndexes];
  char v6 = [v5 containsIndex:a3];

  if ((v6 & 1) == 0)
  {
    id v7 = [(PTCinematographyNetwork *)self networkDetections];
    unint64_t v8 = [v7 objectAtIndexedSubscript:a3];
    [v8 _setInvalid:1];

    id v9 = [(PTCinematographyNetwork *)self unusedIndexes];
    [v9 addIndex:a3];
  }
}

- (void)_forgetNetworkDetectionsOlderThan:(id *)a3
{
  id v5 = [(PTCinematographyNetwork *)self networkDetections];
  unint64_t v6 = [v5 count];

  if (v6 >= 2)
  {
    unint64_t v7 = 1;
    do
    {
      unint64_t v8 = [(PTCinematographyNetwork *)self networkDetections];
      id v9 = [v8 objectAtIndexedSubscript:v7];
      unint64_t v10 = v9;
      if (v9) {
        [v9 time];
      }
      else {
        memset(&time1, 0, sizeof(time1));
      }
      $3CC8671D27C23BF42ADDB32F2B5E48AE v14 = *a3;
      int32_t v11 = CMTimeCompare(&time1, (CMTime *)&v14);

      if (v11 < 0) {
        [(PTCinematographyNetwork *)self _forgetNetworkDetectionAtIndex:v7];
      }
      ++v7;
      uint64_t v12 = [(PTCinematographyNetwork *)self networkDetections];
      unint64_t v13 = [v12 count];
    }
    while (v7 < v13);
  }
}

- (unint64_t)_allocateNetworkDetectionIndex
{
  float v3 = [(PTCinematographyNetwork *)self networkDetections];
  unint64_t v4 = [v3 count];

  id v5 = [(PTCinematographyNetwork *)self unusedIndexes];
  uint64_t v6 = [v5 count];

  if (v6)
  {
    unint64_t v7 = [(PTCinematographyNetwork *)self unusedIndexes];
    unint64_t v4 = [v7 firstIndex];
  }
  if (v4 < self->_x_in.height) {
    return v4;
  }

  return [(PTCinematographyNetwork *)self _getLeastRecentNetworkDetectionIndex];
}

- (void)_setMissingDetectionAtIndex:(unint64_t)a3 time:(id *)a4
{
  if (self->_x_in.height <= a3) {
    -[PTCinematographyNetwork _setMissingDetectionAtIndex:time:]();
  }
  unint64_t v7 = [(PTCinematographyNetwork *)self networkDetections];
  if ([v7 count] <= a3) {
    -[PTCinematographyNetwork _setMissingDetectionAtIndex:time:]();
  }

  if (a3)
  {
    unint64_t v8 = _PTLogSystem();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      -[PTCinematographyNetwork _setMissingDetectionAtIndex:time:]();
    }
  }
  id v9 = [(PTCinematographyNetwork *)self networkDetections];
  unint64_t v10 = [v9 objectAtIndexedSubscript:a3];
  long long v11 = *(_OWORD *)&a4->var0;
  int64_t var3 = a4->var3;
  [(PTCinematographyNetwork *)self _setDetection:v10 asInputRow:a3 time:&v11 missing:1];
}

- (BOOL)_shouldResetDetectionFromType:(unint64_t)a3 toType:(unint64_t)a4
{
  if (a3 == 1 && a4 == 2) {
    return 1;
  }
  return a3 == 2 && a4 == 1;
}

- (void)_setNetworkDetection:(id)a3 atIndex:(unint64_t)a4 time:(id *)a5
{
  id v8 = a3;
  if (self->_x_in.height <= a4) {
    -[PTCinematographyNetwork _setNetworkDetection:atIndex:time:]();
  }
  id v9 = v8;
  unint64_t v10 = [(PTCinematographyNetwork *)self networkDetections];
  if ([v10 count] < a4) {
    -[PTCinematographyNetwork _setNetworkDetection:atIndex:time:]();
  }

  long long v11 = _PTLogSystem();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    -[PTCinematographyNetwork _setNetworkDetection:atIndex:time:]((uint64_t)v9, a4);
  }

  uint64_t v12 = [(PTCinematographyNetwork *)self networkDetections];
  if ([v12 count] == a4) {
    goto LABEL_12;
  }
  unint64_t v13 = [(PTCinematographyNetwork *)self unusedIndexes];
  if ([v13 containsIndex:a4])
  {
LABEL_11:

LABEL_12:
    goto LABEL_13;
  }
  $3CC8671D27C23BF42ADDB32F2B5E48AE v14 = [(PTCinematographyNetwork *)self networkDetections];
  uint64_t v15 = [v14 objectAtIndexedSubscript:a4];
  uint64_t v16 = [v15 trackIdentifier];
  if (v16 != [v9 trackIdentifier])
  {

    goto LABEL_11;
  }
  long long v22 = [(PTCinematographyNetwork *)self networkDetections];
  long long v17 = [v22 objectAtIndexedSubscript:a4];
  BOOL v18 = -[PTCinematographyNetwork _shouldResetDetectionFromType:toType:](self, "_shouldResetDetectionFromType:toType:", [v17 detectionType], objc_msgSend(v9, "detectionType"));

  if (v18)
  {
LABEL_13:
    unint64_t v19 = [(PTCinematographyNetwork *)self unusedIndexes];
    [v19 removeIndex:a4];

    long long v23 = *(_OWORD *)&a5->var0;
    int64_t var3 = a5->var3;
    [(PTCinematographyNetwork *)self _setDetection:v9 asInputRow:a4 time:&v23 missing:0];
    bzero((char *)self->_hx_out.data + 4 * self->_hx_out.width * a4, 4 * self->_hx_out.width);
    bzero((char *)self->_cx_out.data + 4 * self->_cx_out.width * a4, 4 * self->_cx_out.width);
    goto LABEL_14;
  }
  long long v23 = *(_OWORD *)&a5->var0;
  int64_t var3 = a5->var3;
  [(PTCinematographyNetwork *)self _setDetection:v9 asInputRow:a4 time:&v23 missing:0];
LABEL_14:
  long long v20 = (void *)[v9 copy];
  CMTime v21 = [(PTCinematographyNetwork *)self networkDetections];
  [v21 setObject:v20 atIndexedSubscript:a4];
}

- (void)_debugLogNetworkInputs
{
  float v3 = [(PTCinematographyNetwork *)self networkDetections];
  uint64_t v4 = [v3 count];

  if (v4)
  {
    unint64_t v5 = 0;
    do
    {
      if (*((float *)self->_mask_in.data + v5) == 1.0) {
        _DebugLogEspressoBufferRow(&self->_x_in.data, v5);
      }
      ++v5;
      uint64_t v6 = [(PTCinematographyNetwork *)self networkDetections];
      unint64_t v7 = [v6 count];
    }
    while (v5 < v7);
  }
}

- (void)_debugLogNetworkOutputs
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = 134218242;
  uint64_t v2 = 0;
  OUTLINED_FUNCTION_6();
  _os_log_debug_impl(&dword_1D0778000, v0, OS_LOG_TYPE_DEBUG, "%zu: %@", (uint8_t *)&v1, 0x16u);
}

- (void)_debugLogAllNetworkInputs
{
}

+ (id)earliestVersionString
{
  uint64_t v2 = [a1 firstExistingVersion:&unk_1F26C1060];
  uint64_t v3 = v2;
  if (v2)
  {
    id v4 = v2;
  }
  else
  {
    id v4 = [&unk_1F26C1078 firstObject];
  }
  unint64_t v5 = v4;

  return v5;
}

+ (id)latestVersionString
{
  uint64_t v3 = [&unk_1F26C1090 reverseObjectEnumerator];
  id v4 = [v3 allObjects];
  unint64_t v5 = [a1 firstExistingVersion:v4];
  uint64_t v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    id v7 = [&unk_1F26C10A8 lastObject];
  }
  id v8 = v7;

  return v8;
}

- (NSString)versionString
{
  return (NSString *)objc_getProperty(self, a2, 1224, 1);
}

- (PTCinematographyNetworkParameters)params
{
  return (PTCinematographyNetworkParameters *)objc_getProperty(self, a2, 1232, 1);
}

- (NSArray)inputSignals
{
  return (NSArray *)objc_getProperty(self, a2, 1240, 1);
}

- (PTCinematographyDetection)zeroDisparityDetection
{
  return (PTCinematographyDetection *)objc_getProperty(self, a2, 1248, 1);
}

- (NSMutableArray)networkDetections
{
  return (NSMutableArray *)objc_getProperty(self, a2, 1256, 1);
}

- (NSMutableIndexSet)unusedIndexes
{
  return (NSMutableIndexSet *)objc_getProperty(self, a2, 1264, 1);
}

- (PTCinematographyDetection)lastFocusDetection
{
  return (PTCinematographyDetection *)objc_getProperty(self, a2, 1272, 1);
}

- (void)setLastFocusDetection:(id)a3
{
}

- (unint64_t)lastNetworkPredictionIndex
{
  return self->_lastNetworkPredictionIndex;
}

- (void)setLastNetworkPredictionIndex:(unint64_t)a3
{
  self->_lastNetworkPredictionIndex = a3;
}

- (int64_t)lastNetworkPredictionTrackID
{
  return self->_lastNetworkPredictionTrackID;
}

- (void)setLastNetworkPredictionTrackID:(int64_t)a3
{
  self->_lastNetworkPredictionTrackID = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastFocusDetection, 0);
  objc_storeStrong((id *)&self->_unusedIndexes, 0);
  objc_storeStrong((id *)&self->_networkDetections, 0);
  objc_storeStrong((id *)&self->_zeroDisparityDetection, 0);
  objc_storeStrong((id *)&self->_inputSignals, 0);
  objc_storeStrong((id *)&self->_params, 0);

  objc_storeStrong((id *)&self->_versionString, 0);
}

+ (void)firstExistingVersion:.cold.1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_1D0778000, v0, v1, "unable to find espresso model for version in %@", v2, v3, v4, v5, v6);
}

- (void)initWithVersionString:.cold.1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_1D0778000, v0, v1, "cannot find espresso model for version %@", v2, v3, v4, v5, v6);
}

- (void)initWithVersionString:.cold.2()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_1D0778000, v0, v1, "malformed model.parameters.json for version %@", v2, v3, v4, v5, v6);
}

- (void)initWithVersionString:.cold.3()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1D0778000, v0, v1, "Cinematography network version %@", v2, v3, v4, v5, v6);
}

- (void)_initWithNetwork:parameters:.cold.1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_1D0778000, v0, v1, "espresso error loading network %@", v2, v3, v4, v5, v6);
}

- (void)stepWithFrameDetections:(void *)a1 .cold.1(void *a1, uint64_t a2)
{
  uint64_t v3 = [a1 networkDetections];
  uint64_t v4 = [v3 objectAtIndexedSubscript:a2];
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_10(&dword_1D0778000, v5, v6, "ignoring network decision to focus on stale track: %@", v7, v8, v9, v10, v11);
}

- (void)stepWithFrameDetections:.cold.2()
{
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_7(&dword_1D0778000, v0, v1, "network outputs:", v2, v3, v4, v5, v6);
}

- (void)stepWithFrameDetections:.cold.3()
{
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_7(&dword_1D0778000, v0, v1, "network inputs:", v2, v3, v4, v5, v6);
}

- (void)stepWithFrameDetections:.cold.4()
{
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_7(&dword_1D0778000, v0, v1, "network repeating last decision, but there is none, so autofocus", v2, v3, v4, v5, v6);
}

- (void)stepWithFrameDetections:.cold.5()
{
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_7(&dword_1D0778000, v0, v1, "network repeating last decision", v2, v3, v4, v5, v6);
}

- (void)_updateLastNetworkPredictionIndex:(void *)a1 time:(uint64_t)a2 .cold.1(void *a1, uint64_t a2)
{
  uint64_t v3 = [a1 networkDetections];
  uint64_t v4 = [v3 objectAtIndexedSubscript:a2];
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_10(&dword_1D0778000, v5, v6, "network forgetting stale detection: %@", v7, v8, v9, v10, v11);
}

- (void)_loadEspressoNetwork:(os_log_t)log .cold.1(os_log_t log)
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  v1[0] = 67109120;
  v1[1] = 0;
  _os_log_error_impl(&dword_1D0778000, log, OS_LOG_TYPE_ERROR, "espresso error unable to create context for engine %d on default system device", (uint8_t *)v1, 8u);
}

- (void)_loadEspressoNetwork:(os_log_t)log .cold.2(os_log_t log)
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  v1[0] = 67109120;
  v1[1] = 0;
  _os_log_error_impl(&dword_1D0778000, log, OS_LOG_TYPE_ERROR, "espresso error unable to create plan for engine %d on default system device", (uint8_t *)v1, 8u);
}

- (void)_loadEspressoNetwork:(uint64_t)a3 .cold.3(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1D0778000, a2, a3, "espresso error binding network (_x_in.height == %zd)", a5, a6, a7, a8, 0);
}

- (void)_loadEspressoNetwork:.cold.4()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_1D0778000, v0, v1, "espresso error %d binding %@ to %s", v2, v3, v4, v5, v6);
}

- (void)_loadEspressoNetwork:.cold.5()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_1D0778000, v0, v1, "espresso error %d binding %@ to %s", v2, v3, v4, v5, v6);
}

- (void)_loadEspressoNetwork:.cold.6()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_1D0778000, v0, v1, "espresso error %d binding %@ to %s", v2, v3, v4, v5, v6);
}

- (void)_loadEspressoNetwork:.cold.7()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_1D0778000, v0, v1, "espresso error %d binding %@ to %s", v2, v3, v4, v5, v6);
}

- (void)_loadEspressoNetwork:.cold.8()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_1D0778000, v0, v1, "espresso error %d binding %@ to %s", v2, v3, v4, v5, v6);
}

- (void)_loadEspressoNetwork:.cold.9()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_1D0778000, v0, v1, "espresso error %d binding %@ to %s", v2, v3, v4, v5, v6);
}

- (void)_loadEspressoNetwork:.cold.10()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_1D0778000, v0, v1, "espresso error %d binding %@ to %s", v2, v3, v4, v5, v6);
}

- (void)_loadEspressoNetwork:.cold.11()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_12(&dword_1D0778000, v0, v1, "espresso error %d building plan for %@");
}

- (void)_loadEspressoNetwork:.cold.12()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_12(&dword_1D0778000, v0, v1, "espresso error %d loading network %@");
}

- (void)_networkPredictionIndex
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1D0778000, v0, v1, "raw prediction: %zd", v2, v3, v4, v5, v6);
}

- (void)_detectionAtNetworkIndex:(uint64_t)a1 frameDetections:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [NSNumber numberWithUnsignedLong:a1];
  OUTLINED_FUNCTION_4();
  _os_log_error_impl(&dword_1D0778000, a2, OS_LOG_TYPE_ERROR, "error: network predicts disabled index %@", v4, 0xCu);
}

- (void)_getLeastRecentNetworkDetectionIndex
{
  __assert_rtn("-[PTCinematographyNetwork _getLeastRecentNetworkDetectionIndex]", "PTCinematographyNetwork.m", 684, "self.networkDetections.count >= 2");
}

- (void)_setMissingDetectionAtIndex:time:.cold.1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1D0778000, v0, v1, "_setMissingDetection[%ld]", v2, v3, v4, v5, v6);
}

- (void)_setMissingDetectionAtIndex:time:.cold.2()
{
}

- (void)_setMissingDetectionAtIndex:time:.cold.3()
{
}

- (void)_setNetworkDetection:atIndex:time:.cold.1()
{
  __assert_rtn("-[PTCinematographyNetwork _setNetworkDetection:atIndex:time:]", "PTCinematographyNetwork.m", 756, "i <= self.networkDetections.count");
}

- (void)_setNetworkDetection:(uint64_t)a1 atIndex:(uint64_t)a2 time:.cold.2(uint64_t a1, uint64_t a2)
{
  LODWORD(v4) = 134218242;
  *(void *)((char *)&v4 + 4) = a2;
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_11(&dword_1D0778000, v2, v3, "_setNetworkDetection[%ld]: %@", (void)v4, DWORD2(v4));
}

- (void)_setNetworkDetection:atIndex:time:.cold.3()
{
}

@end
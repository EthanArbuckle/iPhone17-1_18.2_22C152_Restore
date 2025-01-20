@interface PRDataRecorder
+ (id)generateFilename;
+ (id)generateTemporaryDirectoryURL;
- (NSMutableArray)estimatorInput;
- (NSMutableArray)estimatorOutput;
- (NSMutableArray)measurements;
- (NSMutableArray)rangeEstimatorOutput;
- (NSMutableDictionary)customData;
- (PRDataRecorder)init;
- (id)stopAndSave;
- (id)writeToURL;
- (void)discardSensorData;
- (void)recordCustomData:(id)a3 forKey:(id)a4;
- (void)recordEstimatorInput:(id)a3;
- (void)recordPoseMeasurement:(id)a3;
- (void)recordProximityMeasurement:(id)a3;
- (void)recordRangeEstimate:(id)a3;
- (void)recordTargetEstimates:(id)a3;
- (void)recordTargetMovingStateChanged:(BOOL)a3 atTime:(double)a4;
- (void)setCustomData:(id)a3;
- (void)setEstimatorInput:(id)a3;
- (void)setEstimatorOutput:(id)a3;
- (void)setMeasurements:(id)a3;
- (void)setRangeEstimatorOutput:(id)a3;
- (void)writeSensorDataToURL:(id)a3;
@end

@implementation PRDataRecorder

+ (id)generateFilename
{
  v2 = [MEMORY[0x263EFF910] date];
  id v3 = objc_alloc_init(MEMORY[0x263F08790]);
  [v3 setDateFormat:@"dd-MM-yyyy-HH-mm-ss"];
  v4 = [v3 stringFromDate:v2];

  return v4;
}

+ (id)generateTemporaryDirectoryURL
{
  v2 = [MEMORY[0x263F08850] defaultManager];
  uint64_t v5 = 0;
  id v3 = [v2 URLForDirectory:9 inDomain:1 appropriateForURL:0 create:1 error:&v5];

  return v3;
}

- (PRDataRecorder)init
{
  v9.receiver = self;
  v9.super_class = (Class)PRDataRecorder;
  v2 = [(PRDataRecorder *)&v9 init];
  if (v2)
  {
    id v3 = [MEMORY[0x263EFF980] array];
    [(PRDataRecorder *)v2 setMeasurements:v3];

    v4 = [MEMORY[0x263EFF980] array];
    [(PRDataRecorder *)v2 setEstimatorInput:v4];

    uint64_t v5 = [MEMORY[0x263EFF980] array];
    [(PRDataRecorder *)v2 setEstimatorOutput:v5];

    v6 = [MEMORY[0x263EFF980] array];
    [(PRDataRecorder *)v2 setRangeEstimatorOutput:v6];

    v7 = [MEMORY[0x263EFF9A0] dictionary];
    [(PRDataRecorder *)v2 setCustomData:v7];
  }
  return v2;
}

- (void)discardSensorData
{
  id v3 = [(PRDataRecorder *)self measurements];
  [v3 removeAllObjects];

  v4 = [(PRDataRecorder *)self estimatorInput];
  [v4 removeAllObjects];

  uint64_t v5 = [(PRDataRecorder *)self estimatorOutput];
  [v5 removeAllObjects];

  v6 = [(PRDataRecorder *)self rangeEstimatorOutput];
  [v6 removeAllObjects];

  id v7 = [(PRDataRecorder *)self customData];
  [v7 removeAllObjects];
}

- (void)recordProximityMeasurement:(id)a3
{
  v18[4] = *MEMORY[0x263EF8340];
  v18[0] = @"proximity";
  v17[0] = @"type";
  v17[1] = @"range";
  v4 = NSNumber;
  id v5 = a3;
  objc_msgSend(v5, "range_m");
  *(float *)&double v6 = v6;
  id v7 = [v4 numberWithFloat:v6];
  v18[1] = v7;
  v17[2] = @"rangeUncertainty";
  v8 = NSNumber;
  objc_msgSend(v5, "range_unc_m");
  *(float *)&double v9 = v9;
  v10 = [v8 numberWithFloat:v9];
  v18[2] = v10;
  v17[3] = @"time";
  v11 = NSNumber;
  objc_msgSend(v5, "mach_absolute_time_sec");
  double v13 = v12;

  v14 = [v11 numberWithDouble:v13];
  v18[3] = v14;
  v15 = [NSDictionary dictionaryWithObjects:v18 forKeys:v17 count:4];

  v16 = [(PRDataRecorder *)self measurements];
  [v16 addObject:v15];
}

- (void)recordPoseMeasurement:(id)a3
{
  v19[3] = *MEMORY[0x263EF8340];
  id v4 = a3;
  [v4 pose];
  v17[0] = v5;
  v17[1] = v6;
  v17[2] = v7;
  v17[3] = v8;
  double v9 = [MEMORY[0x263EFF8F8] dataWithBytes:v17 length:64];
  v19[0] = @"pose";
  v18[0] = @"type";
  v18[1] = @"data";
  v10 = [v9 base64EncodedStringWithOptions:0];
  v19[1] = v10;
  v18[2] = @"time";
  v11 = NSNumber;
  [v4 timestamp];
  double v13 = v12;

  v14 = [v11 numberWithDouble:v13];
  v19[2] = v14;
  v15 = [NSDictionary dictionaryWithObjects:v19 forKeys:v18 count:3];

  v16 = [(PRDataRecorder *)self measurements];
  [v16 addObject:v15];
}

- (void)recordEstimatorInput:(id)a3
{
  v51[8] = *MEMORY[0x263EF8340];
  v50[0] = @"time";
  id v3 = NSNumber;
  id v4 = a3;
  [v4 timestamp];
  v46 = objc_msgSend(v3, "numberWithDouble:");
  v51[0] = v46;
  v50[1] = @"prior_time";
  long long v5 = NSNumber;
  [v4 priorTimestamp];
  v45 = objc_msgSend(v5, "numberWithDouble:");
  v51[1] = v45;
  v50[2] = @"subsequent_time";
  long long v6 = NSNumber;
  [v4 subsequentTimestamp];
  v44 = objc_msgSend(v6, "numberWithDouble:");
  v51[2] = v44;
  v50[3] = @"quat";
  long long v7 = NSNumber;
  [v4 rotation];
  v43 = objc_msgSend(v7, "numberWithFloat:");
  v49[0] = v43;
  long long v8 = NSNumber;
  [v4 rotation];
  LODWORD(v9) = HIDWORD(v9);
  v42 = [v8 numberWithFloat:v9];
  v49[1] = v42;
  v10 = NSNumber;
  [v4 rotation];
  LODWORD(v12) = v11;
  v41 = [v10 numberWithFloat:v12];
  v49[2] = v41;
  double v13 = NSNumber;
  [v4 rotation];
  LODWORD(v15) = v14;
  v40 = [v13 numberWithFloat:v15];
  v49[3] = v40;
  v39 = [MEMORY[0x263EFF8C0] arrayWithObjects:v49 count:4];
  v51[3] = v39;
  v50[4] = @"trans";
  v16 = NSNumber;
  [v4 translation];
  v38 = objc_msgSend(v16, "numberWithFloat:");
  v48[0] = v38;
  v17 = NSNumber;
  [v4 translation];
  LODWORD(v18) = HIDWORD(v18);
  v19 = [v17 numberWithFloat:v18];
  v48[1] = v19;
  v20 = NSNumber;
  [v4 translation];
  LODWORD(v22) = v21;
  v23 = [v20 numberWithFloat:v22];
  v48[2] = v23;
  v24 = [MEMORY[0x263EFF8C0] arrayWithObjects:v48 count:3];
  v51[4] = v24;
  v50[5] = @"range";
  v25 = NSNumber;
  v26 = [v4 proximity];
  objc_msgSend(v26, "range_m");
  *(float *)&double v27 = v27;
  v28 = [v25 numberWithFloat:v27];
  v51[5] = v28;
  v50[6] = @"rangeUncertainty";
  v29 = NSNumber;
  v30 = [v4 proximity];
  objc_msgSend(v30, "range_unc_m");
  *(float *)&double v31 = v31;
  v32 = [v29 numberWithFloat:v31];
  v51[6] = v32;
  v50[7] = @"antenna";
  v33 = NSNumber;
  v34 = [v4 proximity];

  v35 = objc_msgSend(v33, "numberWithInteger:", objc_msgSend(v34, "antenna_type"));
  v51[7] = v35;
  v36 = [NSDictionary dictionaryWithObjects:v51 forKeys:v50 count:8];

  v37 = [(PRDataRecorder *)self estimatorInput];
  [v37 addObject:v36];
}

- (void)recordTargetEstimates:(id)a3
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v3 = a3;
  v30 = [MEMORY[0x263EFF980] array];
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id obj = v3;
  uint64_t v31 = [obj countByEnumeratingWithState:&v32 objects:v39 count:16];
  if (v31)
  {
    uint64_t v29 = *(void *)v33;
    do
    {
      uint64_t v4 = 0;
      do
      {
        if (*(void *)v33 != v29) {
          objc_enumerationMutation(obj);
        }
        long long v5 = *(void **)(*((void *)&v32 + 1) + 8 * v4);
        v37[0] = @"target";
        long long v6 = NSNumber;
        [v5 vector];
        long long v7 = objc_msgSend(v6, "numberWithFloat:");
        v36[0] = v7;
        long long v8 = NSNumber;
        [v5 vector];
        LODWORD(v9) = HIDWORD(v9);
        v10 = [v8 numberWithFloat:v9];
        v36[1] = v10;
        int v11 = NSNumber;
        [v5 vector];
        LODWORD(v13) = v12;
        int v14 = [v11 numberWithFloat:v13];
        v36[2] = v14;
        double v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:v36 count:3];
        v38[0] = v15;
        v37[1] = @"uncertainty";
        v16 = NSNumber;
        [v5 uncertainty];
        double v18 = [v16 numberWithDouble:v17];
        v38[1] = v18;
        v37[2] = @"weight";
        v19 = NSNumber;
        [v5 weight];
        int v21 = [v19 numberWithDouble:v20];
        v38[2] = v21;
        v37[3] = @"time";
        double v22 = NSNumber;
        [v5 timestamp];
        v23 = objc_msgSend(v22, "numberWithDouble:");
        v38[3] = v23;
        v37[4] = @"verticalState";
        v24 = objc_msgSend(NSNumber, "numberWithUnsignedLong:", objc_msgSend(v5, "verticalState"));
        v38[4] = v24;
        v25 = [NSDictionary dictionaryWithObjects:v38 forKeys:v37 count:5];

        [v30 addObject:v25];
        ++v4;
      }
      while (v31 != v4);
      uint64_t v31 = [obj countByEnumeratingWithState:&v32 objects:v39 count:16];
    }
    while (v31);
  }

  v26 = [(PRDataRecorder *)self estimatorOutput];
  [v26 addObject:v30];
}

- (void)recordRangeEstimate:(id)a3
{
  v14[3] = *MEMORY[0x263EF8340];
  v14[0] = @"range";
  v13[0] = @"type";
  v13[1] = @"range";
  uint64_t v4 = NSNumber;
  id v5 = a3;
  [v5 range];
  long long v6 = objc_msgSend(v4, "numberWithFloat:");
  v14[1] = v6;
  v13[2] = @"time";
  long long v7 = NSNumber;
  [v5 timestamp];
  double v9 = v8;

  v10 = [v7 numberWithDouble:v9];
  v14[2] = v10;
  int v11 = [NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:3];

  int v12 = [(PRDataRecorder *)self rangeEstimatorOutput];
  [v12 addObject:v11];
}

- (void)recordTargetMovingStateChanged:(BOOL)a3 atTime:(double)a4
{
  BOOL v4 = a3;
  v11[2] = *MEMORY[0x263EF8340];
  v10[0] = @"time";
  long long v6 = [NSNumber numberWithDouble:a4];
  v10[1] = @"moving";
  v11[0] = v6;
  long long v7 = [NSNumber numberWithBool:v4];
  v11[1] = v7;
  double v8 = [NSDictionary dictionaryWithObjects:v11 forKeys:v10 count:2];

  double v9 = [(PRDataRecorder *)self estimatorInput];
  [v9 addObject:v8];
}

- (void)recordCustomData:(id)a3 forKey:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(PRDataRecorder *)self customData];
  [v8 setObject:v7 forKey:v6];
}

- (void)writeSensorDataToURL:(id)a3
{
  BOOL v4 = (objc_class *)MEMORY[0x263EFF9E0];
  id v5 = a3;
  id v12 = (id)[[v4 alloc] initWithURL:v5 append:0];

  [v12 open];
  id v6 = [(PRDataRecorder *)self customData];
  id v7 = (void *)[v6 mutableCopy];

  id v8 = [(PRDataRecorder *)self measurements];
  [v7 setObject:v8 forKey:@"measurements"];

  double v9 = [(PRDataRecorder *)self estimatorInput];
  [v7 setObject:v9 forKey:@"estimator_input"];

  v10 = [(PRDataRecorder *)self estimatorOutput];
  [v7 setObject:v10 forKey:@"estimator_output"];

  int v11 = [(PRDataRecorder *)self rangeEstimatorOutput];
  [v7 setObject:v11 forKey:@"range_estimator_output"];

  [MEMORY[0x263F08900] writeJSONObject:v7 toStream:v12 options:1 error:0];
  [v12 close];
}

- (id)stopAndSave
{
  id v3 = [(PRDataRecorder *)self writeToURL];
  [(PRDataRecorder *)self stopAndDiscard];
  return v3;
}

- (id)writeToURL
{
  id v3 = +[PRDataRecorder generateFilename];
  BOOL v4 = +[PRDataRecorder generateTemporaryDirectoryURL];
  id v5 = [NSString stringWithFormat:@"%@.json", v3];
  id v6 = [v4 URLByAppendingPathComponent:v5];
  [(PRDataRecorder *)self writeSensorDataToURL:v6];

  id v7 = [v4 URLByAppendingPathComponent:v3];

  return v7;
}

- (NSMutableArray)measurements
{
  return self->_measurements;
}

- (void)setMeasurements:(id)a3
{
}

- (NSMutableArray)estimatorInput
{
  return self->_estimatorInput;
}

- (void)setEstimatorInput:(id)a3
{
}

- (NSMutableArray)estimatorOutput
{
  return self->_estimatorOutput;
}

- (void)setEstimatorOutput:(id)a3
{
}

- (NSMutableArray)rangeEstimatorOutput
{
  return self->_rangeEstimatorOutput;
}

- (void)setRangeEstimatorOutput:(id)a3
{
}

- (NSMutableDictionary)customData
{
  return self->_customData;
}

- (void)setCustomData:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_customData, 0);
  objc_storeStrong((id *)&self->_rangeEstimatorOutput, 0);
  objc_storeStrong((id *)&self->_estimatorOutput, 0);
  objc_storeStrong((id *)&self->_estimatorInput, 0);
  objc_storeStrong((id *)&self->_measurements, 0);
}

@end
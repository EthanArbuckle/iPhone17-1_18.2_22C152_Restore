@interface MXMOSSignpostProbe
+ (id)probeHostLive;
+ (id)probeHostSystemLogArchiveWithRelativeTimeInterval:(double)a3;
+ (id)probeHostSystemLogArchiveWithStartDate:(id)a3 endDate:(id)a4;
+ (id)probeHostSystemLogArchiveWithStartDate:(id)a3 endDate:(id)a4 startMachTime:(unint64_t)a5 stopMachTime:(unint64_t)a6;
+ (id)probeWithLogArchivePath:(id)a3;
+ (id)probeWithLogArchivePath:(id)a3 startDate:(id)a4 endDate:(id)a5;
+ (id)probeWithLogArchivePath:(id)a3 startDate:(id)a4 endDate:(id)a5 startMachTime:(unint64_t)a6 stopMachTime:(unint64_t)a7;
- (MXMOSSignpostProbe)initWithLogArchive:(id)a3;
- (MXMOSSignpostProbe)initWithLogArchive:(id)a3 startDate:(id)a4 endDate:(id)a5;
- (MXMOSSignpostProbe)initWithMode:(unint64_t)a3;
- (MXMOSSignpostProbe)initWithMode:(unint64_t)a3 logArchive:(id)a4 startDate:(id)a5 endDate:(id)a6;
- (MXMOSSignpostProbe)initWithMode:(unint64_t)a3 logArchive:(id)a4 startDate:(id)a5 endDate:(id)a6 startMachTime:(unint64_t)a7 stopMachTime:(unint64_t)a8;
- (id)_buildSampleSetWithData:(id)a3 tag:(id)a4 unit:(id)a5 attributes:(id)a6 signpostObject:(id)a7;
- (id)sampleWithTimeout:(double)a3 stopReason:(unint64_t *)a4;
- (void)_addAnimationFrameCountToData:(id)a3 fromSignpostAnimationInterval:(id)a4;
- (void)_addAnimationFrameRateToData:(id)a3 fromSignpostAnimationInterval:(id)a4;
- (void)_addAnimationGlitchTimeRatioToData:(id)a3 fromSignpostAnimationInterval:(id)a4;
- (void)_addAnimationGlitchesTotalDurationToData:(id)a3 fromSignpostAnimationInterval:(id)a4;
- (void)_addAnimationNumberOfGlitchesToData:(id)a3 fromSignpostAnimationInterval:(id)a4;
- (void)_beginUpdates;
- (void)_buildData:(id)a3 attributes:(id)a4 signpostEvent:(id)a5;
- (void)_buildData:(id)a3 signpostAnimationInterval:(id)a4;
- (void)_buildData:(id)a3 signpostInterval:(id)a4;
- (void)_setupProcessingBlocks;
- (void)_setupProcessingFilter;
- (void)_stopUpdates;
- (void)dealloc;
@end

@implementation MXMOSSignpostProbe

+ (id)probeHostLive
{
  v2 = (void *)[objc_alloc((Class)a1) initWithMode:0];
  return v2;
}

+ (id)probeHostSystemLogArchiveWithRelativeTimeInterval:(double)a3
{
  id v4 = objc_alloc((Class)a1);
  v5 = [MEMORY[0x263EFF910] dateWithTimeIntervalSinceNow:-a3];
  v6 = [MEMORY[0x263EFF910] date];
  v7 = (void *)[v4 initWithMode:1 logArchive:0 startDate:v5 endDate:v6];

  return v7;
}

+ (id)probeHostSystemLogArchiveWithStartDate:(id)a3 endDate:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = (void *)[objc_alloc((Class)a1) initWithMode:1 logArchive:0 startDate:v7 endDate:v6];

  return v8;
}

+ (id)probeHostSystemLogArchiveWithStartDate:(id)a3 endDate:(id)a4 startMachTime:(unint64_t)a5 stopMachTime:(unint64_t)a6
{
  id v10 = a4;
  id v11 = a3;
  v12 = (void *)[objc_alloc((Class)a1) initWithMode:1 logArchive:0 startDate:v11 endDate:v10 startMachTime:a5 stopMachTime:a6];

  return v12;
}

+ (id)probeWithLogArchivePath:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) initWithMode:2 logArchive:v4 startDate:0 endDate:0];

  return v5;
}

+ (id)probeWithLogArchivePath:(id)a3 startDate:(id)a4 endDate:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = (void *)[objc_alloc((Class)a1) initWithMode:2 logArchive:v10 startDate:v9 endDate:v8];

  return v11;
}

+ (id)probeWithLogArchivePath:(id)a3 startDate:(id)a4 endDate:(id)a5 startMachTime:(unint64_t)a6 stopMachTime:(unint64_t)a7
{
  id v12 = a5;
  id v13 = a4;
  id v14 = a3;
  v15 = (void *)[objc_alloc((Class)a1) initWithMode:2 logArchive:v14 startDate:v13 endDate:v12 startMachTime:a6 stopMachTime:a7];

  return v15;
}

- (MXMOSSignpostProbe)initWithMode:(unint64_t)a3
{
  v10.receiver = self;
  v10.super_class = (Class)MXMOSSignpostProbe;
  id v4 = [(MXMProbe *)&v10 init];
  v5 = v4;
  if (v4)
  {
    logArchivePath = v4->_logArchivePath;
    v4->_logArchivePath = 0;

    v5->_mode = a3;
    id v7 = (SignpostSupportObjectExtractor *)objc_alloc_init(MEMORY[0x263F6C5A8]);
    extractor = v5->_extractor;
    v5->_extractor = v7;

    [(MXMOSSignpostProbe *)v5 _setupProcessingBlocks];
  }
  return v5;
}

- (MXMOSSignpostProbe)initWithMode:(unint64_t)a3 logArchive:(id)a4 startDate:(id)a5 endDate:(id)a6
{
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = [(MXMOSSignpostProbe *)self initWithMode:a3];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_logArchivePath, a4);
    objc_storeStrong((id *)&v15->_startDate, a5);
    objc_storeStrong((id *)&v15->_endDate, a6);
  }

  return v15;
}

- (MXMOSSignpostProbe)initWithMode:(unint64_t)a3 logArchive:(id)a4 startDate:(id)a5 endDate:(id)a6 startMachTime:(unint64_t)a7 stopMachTime:(unint64_t)a8
{
  self->_startMachContTime = a7;
  self->_stopMachContTime = a8;
  return [(MXMOSSignpostProbe *)self initWithMode:a3 logArchive:a4 startDate:a5 endDate:a6];
}

- (MXMOSSignpostProbe)initWithLogArchive:(id)a3
{
  return [(MXMOSSignpostProbe *)self initWithMode:2 logArchive:a3 startDate:0 endDate:0];
}

- (MXMOSSignpostProbe)initWithLogArchive:(id)a3 startDate:(id)a4 endDate:(id)a5
{
  return [(MXMOSSignpostProbe *)self initWithMode:2 logArchive:a3 startDate:a4 endDate:a5];
}

- (void)_setupProcessingFilter
{
  id v13 = [MEMORY[0x263EFF980] array];
  v3 = [(MXMProbe *)self filter];
  id v4 = [v3 attributeFilterWithName:@"os_signpost subsystem"];
  v5 = [v4 stringValue];

  id v6 = [(MXMProbe *)self filter];
  id v7 = [v6 attributeFilterWithName:@"os_signpost category"];
  id v8 = [v7 stringValue];

  if (v5)
  {
    id v9 = (void *)[objc_alloc(MEMORY[0x263F6C5C0]) initWithSubsystem:v5 category:v8];
    [v13 addObject:v9];
  }
  if ([v13 count])
  {
    id v10 = objc_alloc(MEMORY[0x263F6C5C8]);
    id v11 = [MEMORY[0x263EFFA08] setWithArray:v13];
    id v12 = (void *)[v10 initWithEntries:v11];

    [(SignpostSupportObjectExtractor *)self->_extractor setSubsystemCategoryFilter:v12];
  }
}

- (void)_setupProcessingBlocks
{
  objc_initWeak(&location, self);
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __44__MXMOSSignpostProbe__setupProcessingBlocks__block_invoke;
  aBlock[3] = &unk_264525320;
  objc_copyWeak(&v21, &location);
  v3 = _Block_copy(aBlock);
  extractor = self->_extractor;
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __44__MXMOSSignpostProbe__setupProcessingBlocks__block_invoke_2;
  v18[3] = &unk_264525348;
  objc_copyWeak(&v19, &location);
  [(SignpostSupportObjectExtractor *)extractor setEmitEventProcessingBlock:v18];
  v5 = self->_extractor;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __44__MXMOSSignpostProbe__setupProcessingBlocks__block_invoke_3;
  v15[3] = &unk_264525370;
  objc_copyWeak(&v17, &location);
  id v6 = v3;
  id v16 = v6;
  [(SignpostSupportObjectExtractor *)v5 setIntervalCompletionProcessingBlock:v15];
  id v7 = self->_extractor;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __44__MXMOSSignpostProbe__setupProcessingBlocks__block_invoke_4;
  v12[3] = &unk_264525398;
  objc_copyWeak(&v14, &location);
  id v8 = v6;
  id v13 = v8;
  [(SignpostSupportObjectExtractor *)v7 setAnimationIntervalCompletionProcessingBlock:v12];
  id v9 = self->_extractor;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __44__MXMOSSignpostProbe__setupProcessingBlocks__block_invoke_5;
  v10[3] = &unk_2645253C0;
  objc_copyWeak(&v11, &location);
  [(SignpostSupportObjectExtractor *)v9 setProcessingCompletionBlock:v10];
  objc_destroyWeak(&v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&v17);
  objc_destroyWeak(&v19);

  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);
}

uint64_t __44__MXMOSSignpostProbe__setupProcessingBlocks__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (!WeakRetained) {
    goto LABEL_5;
  }
  v5 = [v3 beginEvent];
  if ((unint64_t)[v5 timeRecordedMachContinuousTime] >= WeakRetained[13])
  {
    id v6 = [v3 endEvent];
    unint64_t v7 = [v6 timeRecordedMachContinuousTime];
    unint64_t v8 = WeakRetained[13];

    if (v7 >= v8)
    {
      id v11 = [v3 endEvent];
      if ((unint64_t)[v11 timeRecordedMachContinuousTime] <= WeakRetained[14])
      {
        id v12 = [v3 beginEvent];
        unint64_t v13 = [v12 timeRecordedMachContinuousTime];
        unint64_t v14 = WeakRetained[14];

        if (v13 <= v14)
        {
          objc_opt_class();
          char isKindOfClass = objc_opt_isKindOfClass();
          uint64_t v16 = WeakRetained[16];
          if (isKindOfClass) {
            [WeakRetained _buildData:v16 signpostAnimationInterval:v3];
          }
          else {
            [WeakRetained _buildData:v16 signpostInterval:v3];
          }
          goto LABEL_5;
        }
      }
      else
      {
      }
      uint64_t v9 = 0;
      goto LABEL_6;
    }
  }
  else
  {
  }
LABEL_5:
  uint64_t v9 = 1;
LABEL_6:

  return v9;
}

uint64_t __44__MXMOSSignpostProbe__setupProcessingBlocks__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained _buildData:WeakRetained[16] attributes:0 signpostEvent:v3];
  }

  return 1;
}

uint64_t __44__MXMOSSignpostProbe__setupProcessingBlocks__block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = WeakRetained;
  if (!WeakRetained || WeakRetained[13] && WeakRetained[14])
  {
    uint64_t v6 = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    [WeakRetained _buildData:WeakRetained[16] signpostInterval:v3];
    uint64_t v6 = 1;
  }

  return v6;
}

uint64_t __44__MXMOSSignpostProbe__setupProcessingBlocks__block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = WeakRetained;
  if (!WeakRetained || WeakRetained[13] && WeakRetained[14])
  {
    uint64_t v6 = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    [WeakRetained _buildData:WeakRetained[16] signpostAnimationInterval:v3];
    uint64_t v6 = 1;
  }

  return v6;
}

void __44__MXMOSSignpostProbe__setupProcessingBlocks__block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    unint64_t v7 = _MXMGetLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v19 = 138412290;
      id v20 = v5;
      _os_log_impl(&dword_21FA7B000, v7, OS_LOG_TYPE_ERROR, "Extractor finished due to an error: '%@'.", (uint8_t *)&v19, 0xCu);
    }
  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v9 = WeakRetained;
  if (WeakRetained)
  {
    id v10 = (void *)WeakRetained[16];
    id v11 = [WeakRetained filter];
    uint64_t v12 = [v10 dataMatchingFilter:v11];
    unint64_t v13 = (void *)v9[16];
    v9[16] = v12;

    unint64_t v14 = v9[15];
    if (v14)
    {
      dispatch_semaphore_signal(v14);
      v15 = _MXMGetLog();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        LOWORD(v19) = 0;
        uint64_t v16 = "Extractor finished and we've signaled the sampling caller.";
LABEL_13:
        id v17 = v15;
        os_log_type_t v18 = OS_LOG_TYPE_DEBUG;
        goto LABEL_14;
      }
    }
    else
    {
      [v9 _stopUpdates];
      v15 = _MXMGetLog();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        LOWORD(v19) = 0;
        uint64_t v16 = "Extractor finished and we've manually stopped updates.";
        goto LABEL_13;
      }
    }
  }
  else
  {
    v15 = _MXMGetLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      LOWORD(v19) = 0;
      uint64_t v16 = "Extractor called processingCompletionBlock but self is nil!";
      id v17 = v15;
      os_log_type_t v18 = OS_LOG_TYPE_INFO;
LABEL_14:
      _os_log_impl(&dword_21FA7B000, v17, v18, v16, (uint8_t *)&v19, 2u);
    }
  }
}

- (id)_buildSampleSetWithData:(id)a3 tag:(id)a4 unit:(id)a5 attributes:(id)a6 signpostObject:(id)a7
{
  v66[4] = *MEMORY[0x263EF8340];
  id v64 = a3;
  id v63 = a4;
  id v62 = a5;
  id v11 = a6;
  id v12 = a7;
  unint64_t v13 = v11;
  if (!v11)
  {
    unint64_t v13 = [MEMORY[0x263EFF9C0] set];
  }
  v61 = [v12 name];
  v60 = +[MXMSampleAttribute attributeWithName:@"os_signpost name" stringValue:v61];
  v66[0] = v60;
  unint64_t v14 = [v12 subsystem];
  v15 = +[MXMSampleAttribute attributeWithName:@"os_signpost subsystem" stringValue:v14];
  v66[1] = v15;
  uint64_t v16 = [v12 category];
  id v17 = +[MXMSampleAttribute attributeWithName:@"os_signpost category" stringValue:v16];
  v66[2] = v17;
  os_log_type_t v18 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v12, "signpostId"));
  int v19 = +[MXMSampleAttribute attributeWithName:@"os_signpost identifier" numericValue:v18];
  v66[3] = v19;
  id v20 = [MEMORY[0x263EFF8C0] arrayWithObjects:v66 count:4];
  v59 = v13;
  uint64_t v21 = [v13 setByAddingObjectsFromArray:v20];
  v65 = (void *)[v21 mutableCopy];

  if (!v11) {
  v22 = [v12 string1Name];
  }

  v23 = v65;
  if (v22)
  {
    v24 = [v12 string1Name];
    v25 = +[MXMSampleAttribute attributeWithName:@"os_signpost telemetry string1 name" stringValue:v24];
    [v65 addObject:v25];

    v26 = [v12 string1Value];
    v27 = +[MXMSampleAttribute attributeWithName:@"os_signpost telemetry string1 value" stringValue:v26];
    [v65 addObject:v27];
  }
  v28 = [v12 string2Name];

  if (v28)
  {
    v29 = [v12 string2Name];
    v30 = +[MXMSampleAttribute attributeWithName:@"os_signpost telemetry string2 name" stringValue:v29];
    [v65 addObject:v30];

    v31 = [v12 string2Value];
    v32 = +[MXMSampleAttribute attributeWithName:@"os_signpost telemetry string2 value" stringValue:v31];
    [v65 addObject:v32];
  }
  v33 = [v12 number1Value];

  if (v33)
  {
    v34 = [MXMMutableSampleSet alloc];
    v35 = +[MXMOSSignpostSampleTag telemetryNumber1];
    v36 = [v12 number1Name];
    v37 = +[MXMSampleAttribute attributeWithName:@"os_signpost telemetry number1 name" stringValue:v36];
    v38 = [v65 setByAddingObject:v37];
    v39 = [(MXMSampleSet *)v34 initWithTag:v35 unit:0 attributes:v38];
    [v64 appendSet:v39];

    v23 = v65;
    v40 = [v12 number1Value];
    [v40 doubleValue];
    double v42 = v41;
    v43 = +[MXMOSSignpostSampleTag telemetryNumber1];
    id v44 = (id)objc_msgSend(v64, "appendDoubleValue:tag:timestamp:", v43, objc_msgSend(v12, "startNanoseconds"), v42);
  }
  v45 = [v12 number2Value];

  if (v45)
  {
    v46 = [MXMMutableSampleSet alloc];
    v47 = +[MXMOSSignpostSampleTag telemetryNumber2];
    v48 = [v12 number2Name];
    v49 = +[MXMSampleAttribute attributeWithName:@"os_signpost telemetry number2 name" stringValue:v48];
    v50 = [v23 setByAddingObject:v49];
    v51 = [(MXMSampleSet *)v46 initWithTag:v47 unit:0 attributes:v50];
    [v64 appendSet:v51];

    v23 = v65;
    v52 = [v12 number2Value];
    [v52 doubleValue];
    double v54 = v53;
    v55 = +[MXMOSSignpostSampleTag telemetryNumber2];
    id v56 = (id)objc_msgSend(v64, "appendDoubleValue:tag:timestamp:", v55, objc_msgSend(v12, "startNanoseconds"), v54);
  }
  v57 = [(MXMSampleSet *)[MXMMutableSampleSet alloc] initWithTag:v63 unit:v62 attributes:v23];

  return v57;
}

- (void)_buildData:(id)a3 attributes:(id)a4 signpostEvent:(id)a5
{
  id v17 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = v8;
  if (!v8)
  {
    id v10 = [MEMORY[0x263EFFA08] set];
  }
  id v11 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v9, "processID"));
  id v12 = +[MXMSampleAttribute attributeWithName:@"Process Identifier" numericValue:v11];
  unint64_t v13 = [v10 setByAddingObject:v12];

  if (!v8) {
  unint64_t v14 = +[MXMOSSignpostSampleTag timestamp];
  }
  v15 = [MEMORY[0x263F08C98] nanoseconds];
  uint64_t v16 = [(MXMOSSignpostProbe *)self _buildSampleSetWithData:v17 tag:v14 unit:v15 attributes:v13 signpostObject:v9];

  objc_msgSend(v16, "appendDoubleValue:timestamp:", objc_msgSend(v9, "startMachContinuousTime"), (double)(unint64_t)objc_msgSend(v9, "startNanoseconds"));
  [v17 appendSet:v16];
}

- (void)_buildData:(id)a3 signpostInterval:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [v6 beginEvent];
  [(MXMOSSignpostProbe *)self _buildData:v7 attributes:0 signpostEvent:v8];

  id v9 = [v6 endEvent];
  [(MXMOSSignpostProbe *)self _buildData:v7 attributes:0 signpostEvent:v9];

  id v10 = +[MXMOSSignpostSampleTag duration];
  id v11 = [MEMORY[0x263F08C98] nanoseconds];
  id v14 = [(MXMOSSignpostProbe *)self _buildSampleSetWithData:v7 tag:v10 unit:v11 attributes:0 signpostObject:v6];

  double v12 = (double)(unint64_t)[v6 durationNanoseconds];
  uint64_t v13 = [v6 startMachContinuousTime];

  [v14 appendDoubleValue:v13 timestamp:v12];
  [v7 appendSet:v14];
}

- (void)_buildData:(id)a3 signpostAnimationInterval:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(MXMOSSignpostProbe *)self _buildData:v7 signpostInterval:v6];
  [(MXMOSSignpostProbe *)self _addAnimationFrameRateToData:v7 fromSignpostAnimationInterval:v6];
  [(MXMOSSignpostProbe *)self _addAnimationFrameCountToData:v7 fromSignpostAnimationInterval:v6];
  [(MXMOSSignpostProbe *)self _addAnimationGlitchTimeRatioToData:v7 fromSignpostAnimationInterval:v6];
  [(MXMOSSignpostProbe *)self _addAnimationNumberOfGlitchesToData:v7 fromSignpostAnimationInterval:v6];
  [(MXMOSSignpostProbe *)self _addAnimationGlitchesTotalDurationToData:v7 fromSignpostAnimationInterval:v6];
}

- (void)_addAnimationFrameRateToData:(id)a3 fromSignpostAnimationInterval:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = +[MXMOSSignpostSampleTag animationFrameRate];
  id v9 = [MEMORY[0x263F08CC8] framesPerSecond];
  id v13 = [(MXMOSSignpostProbe *)self _buildSampleSetWithData:v7 tag:v8 unit:v9 attributes:0 signpostObject:v6];

  [v6 frameRate];
  double v11 = v10;
  uint64_t v12 = [v6 startMachContinuousTime];

  [v13 appendDoubleValue:v12 timestamp:v11];
  [v7 appendSet:v13];
}

- (void)_addAnimationFrameCountToData:(id)a3 fromSignpostAnimationInterval:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = +[MXMOSSignpostSampleTag animationFrameCount];
  id v9 = +[MXMUnitFrame frames];
  id v12 = [(MXMOSSignpostProbe *)self _buildSampleSetWithData:v7 tag:v8 unit:v9 attributes:0 signpostObject:v6];

  double v10 = (double)(unint64_t)[v6 frameCount];
  uint64_t v11 = [v6 startMachContinuousTime];

  [v12 appendDoubleValue:v11 timestamp:v10];
  [v7 appendSet:v12];
}

- (void)_addAnimationGlitchTimeRatioToData:(id)a3 fromSignpostAnimationInterval:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = +[MXMOSSignpostSampleTag animationGlitchTimeRatio];
  id v9 = +[MXMUnitHitch timeRatio];
  id v17 = [(MXMOSSignpostProbe *)self _buildSampleSetWithData:v7 tag:v8 unit:v9 attributes:0 signpostObject:v6];

  [v6 glitchTimeRatioMsPerS];
  objc_msgSend(v17, "appendDoubleValue:timestamp:", objc_msgSend(v6, "startMachContinuousTime"), v10);
  [v7 appendSet:v17];
  uint64_t v11 = +[MXMOSSignpostSampleTag animationNonFirstFrameGlitchTimeRatioAdjusted];
  id v12 = +[MXMUnitHitch timeRatio];
  id v13 = [(MXMOSSignpostProbe *)self _buildSampleSetWithData:v7 tag:v11 unit:v12 attributes:0 signpostObject:v6];

  [v6 nonFirstFrameGlitchTimeRatioAdjustedMsPerS];
  double v15 = v14;
  uint64_t v16 = [v6 startMachContinuousTime];

  [v13 appendDoubleValue:v16 timestamp:v15];
  [v7 appendSet:v13];
}

- (void)_addAnimationNumberOfGlitchesToData:(id)a3 fromSignpostAnimationInterval:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = +[MXMOSSignpostSampleTag animationNumberOfGlitches];
  id v9 = +[MXMUnitHitch hitches];
  id v17 = [(MXMOSSignpostProbe *)self _buildSampleSetWithData:v7 tag:v8 unit:v9 attributes:0 signpostObject:v6];

  double v10 = [v6 glitches];
  objc_msgSend(v17, "appendDoubleValue:timestamp:", objc_msgSend(v6, "startMachContinuousTime"), (double)(unint64_t)objc_msgSend(v10, "count"));

  [v7 appendSet:v17];
  uint64_t v11 = +[MXMOSSignpostSampleTag animationNonFirstFrameNumberOfGlitches];
  id v12 = +[MXMUnitHitch hitches];
  id v13 = [(MXMOSSignpostProbe *)self _buildSampleSetWithData:v7 tag:v11 unit:v12 attributes:0 signpostObject:v6];

  double v14 = [v6 nonFirstFrameGlitches];
  double v15 = (double)(unint64_t)[v14 count];
  uint64_t v16 = [v6 startMachContinuousTime];

  [v13 appendDoubleValue:v16 timestamp:v15];
  [v7 appendSet:v13];
}

- (void)_addAnimationGlitchesTotalDurationToData:(id)a3 fromSignpostAnimationInterval:(id)a4
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = +[MXMOSSignpostSampleTag animationGlitchesTotalDuration];
  id v9 = [MEMORY[0x263F08C98] milliseconds];
  double v10 = [(MXMOSSignpostProbe *)self _buildSampleSetWithData:v6 tag:v8 unit:v9 attributes:0 signpostObject:v7];

  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  uint64_t v11 = [v7 glitches];
  uint64_t v12 = [v11 countByEnumeratingWithState:&v32 objects:v37 count:16];
  double v13 = 0.0;
  double v14 = 0.0;
  if (v12)
  {
    uint64_t v15 = v12;
    uint64_t v16 = *(void *)v33;
    do
    {
      uint64_t v17 = 0;
      do
      {
        if (*(void *)v33 != v16) {
          objc_enumerationMutation(v11);
        }
        [*(id *)(*((void *)&v32 + 1) + 8 * v17) durationMs];
        double v14 = v14 + v18;
        ++v17;
      }
      while (v15 != v17);
      uint64_t v15 = [v11 countByEnumeratingWithState:&v32 objects:v37 count:16];
    }
    while (v15);
  }

  objc_msgSend(v10, "appendDoubleValue:timestamp:", objc_msgSend(v7, "startMachContinuousTime"), v14);
  [v6 appendSet:v10];
  int v19 = +[MXMOSSignpostSampleTag animationNonFirstFrameGlitchesTotalDuration];
  id v20 = [MEMORY[0x263F08C98] milliseconds];
  uint64_t v21 = [(MXMOSSignpostProbe *)self _buildSampleSetWithData:v6 tag:v19 unit:v20 attributes:0 signpostObject:v7];

  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  v22 = objc_msgSend(v7, "nonFirstFrameGlitches", 0);
  uint64_t v23 = [v22 countByEnumeratingWithState:&v28 objects:v36 count:16];
  if (v23)
  {
    uint64_t v24 = v23;
    uint64_t v25 = *(void *)v29;
    double v13 = 0.0;
    do
    {
      uint64_t v26 = 0;
      do
      {
        if (*(void *)v29 != v25) {
          objc_enumerationMutation(v22);
        }
        [*(id *)(*((void *)&v28 + 1) + 8 * v26) durationMs];
        double v13 = v13 + v27;
        ++v26;
      }
      while (v24 != v26);
      uint64_t v24 = [v22 countByEnumeratingWithState:&v28 objects:v36 count:16];
    }
    while (v24);
  }

  objc_msgSend(v21, "appendDoubleValue:timestamp:", objc_msgSend(v7, "startMachContinuousTime"), v13);
  [v6 appendSet:v21];
}

- (void)_beginUpdates
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  v31.receiver = self;
  v31.super_class = (Class)MXMOSSignpostProbe;
  [(MXMProbe *)&v31 _beginUpdates];
  id v4 = +[MXMSampleData data];
  data = self->_data;
  self->_data = v4;

  [(MXMOSSignpostProbe *)self _setupProcessingFilter];
  unint64_t mode = self->_mode;
  if (mode == 2)
  {
    extractor = self->_extractor;
    uint64_t v15 = [(NSURL *)self->_logArchivePath absoluteString];
    startDate = self->_startDate;
    endDate = self->_endDate;
    id v28 = 0;
    [(SignpostSupportObjectExtractor *)extractor processLogArchiveWithPath:v15 startDate:startDate endDate:endDate errorOut:&v28];
    id v9 = v28;

    double v10 = _MXMGetLog();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_12;
    }
    logArchivePath = self->_logArchivePath;
    int v19 = self->_startDate;
    id v20 = self->_endDate;
    *(_DWORD *)buf = 138412802;
    long long v33 = logArchivePath;
    __int16 v34 = 2112;
    long long v35 = v19;
    __int16 v36 = 2112;
    v37 = v20;
    uint64_t v11 = "Began extracting signposts from archive (%@ [nil is the system]) with dates: %@ to %@.";
LABEL_10:
    uint64_t v12 = v10;
    uint32_t v13 = 32;
    goto LABEL_11;
  }
  if (mode == 1)
  {
    uint64_t v21 = self->_extractor;
    v22 = self->_startDate;
    uint64_t v23 = self->_endDate;
    id v29 = 0;
    [(SignpostSupportObjectExtractor *)v21 processLogArchiveWithPath:0 startDate:v22 endDate:v23 errorOut:&v29];
    id v9 = v29;
    double v10 = _MXMGetLog();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_12;
    }
    uint64_t v24 = self->_startDate;
    uint64_t v25 = self->_endDate;
    *(_DWORD *)buf = 138412802;
    long long v33 = 0;
    __int16 v34 = 2112;
    long long v35 = v24;
    __int16 v36 = 2112;
    v37 = v25;
    uint64_t v11 = "Began extracting signposts from system log archive (%@ [nil is the system]) with dates: %@ to %@.";
    goto LABEL_10;
  }
  if (mode) {
    return;
  }
  id v7 = self->_extractor;
  id v8 = [(MXMProbe *)self updateQueue];
  id v30 = 0;
  [(SignpostSupportObjectExtractor *)v7 processNotificationsWithIntervalTimeoutInSeconds:60 shouldCalculateAnimationFramerate:0 targetQueue:v8 errorOut:&v30];
  id v9 = v30;

  double v10 = _MXMGetLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    uint64_t v11 = "Began extracting signposts with live notification.";
    uint64_t v12 = v10;
    uint32_t v13 = 2;
LABEL_11:
    _os_log_impl(&dword_21FA7B000, v12, OS_LOG_TYPE_DEBUG, v11, buf, v13);
  }
LABEL_12:

  if (v9)
  {
    uint64_t v26 = [MEMORY[0x263F08690] currentHandler];
    double v27 = [v9 description];
    [v26 handleFailureInMethod:a2 object:self file:@"MXMOSSignpostProbe.m" lineNumber:463 description:v27];
  }
}

- (void)_stopUpdates
{
  v3.receiver = self;
  v3.super_class = (Class)MXMOSSignpostProbe;
  [(MXMProbe *)&v3 _stopUpdates];
  [(SignpostSupportObjectExtractor *)self->_extractor stopProcessing];
  [(MXMProbe *)self _handleIncomingData:self->_data];
}

- (id)sampleWithTimeout:(double)a3 stopReason:(unint64_t *)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v6 = (OS_dispatch_semaphore *)dispatch_semaphore_create(0);
  finishedProcessingSema = self->_finishedProcessingSema;
  self->_finishedProcessingSema = v6;

  [(MXMOSSignpostProbe *)self _beginUpdates];
  id v8 = _MXMGetLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134217984;
    double v18 = a3;
    _os_log_impl(&dword_21FA7B000, v8, OS_LOG_TYPE_DEBUG, "Created finish process semaphore, now waiting up to %f seconds.", buf, 0xCu);
  }

  id v9 = self->_finishedProcessingSema;
  dispatch_time_t v10 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
  intptr_t v11 = dispatch_semaphore_wait(v9, v10);
  uint64_t v12 = _MXMGetLog();
  BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG);
  if (v11)
  {
    if (v13)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21FA7B000, v12, OS_LOG_TYPE_DEBUG, "Failed to stop waiting for stop processing semaphore.", buf, 2u);
    }

    [(SignpostSupportObjectExtractor *)self->_extractor stopProcessing];
  }
  else
  {
    if (v13)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21FA7B000, v12, OS_LOG_TYPE_DEBUG, "Succesfully waited for stop processing semaphore.", buf, 2u);
    }
  }
  v16.receiver = self;
  v16.super_class = (Class)MXMOSSignpostProbe;
  [(MXMProbe *)&v16 _stopUpdates];
  data = self->_data;
  return data;
}

- (void)dealloc
{
  [(SignpostSupportObjectExtractor *)self->_extractor setProcessingCompletionBlock:0];
  [(SignpostSupportObjectExtractor *)self->_extractor stopProcessing];
  extractor = self->_extractor;
  self->_extractor = 0;

  v4.receiver = self;
  v4.super_class = (Class)MXMOSSignpostProbe;
  [(MXMOSSignpostProbe *)&v4 dealloc];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_finishedProcessingSema, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_logArchivePath, 0);
  objc_storeStrong((id *)&self->_extractor, 0);
}

@end
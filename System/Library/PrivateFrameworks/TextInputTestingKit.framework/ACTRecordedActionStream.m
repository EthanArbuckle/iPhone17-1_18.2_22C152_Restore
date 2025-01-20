@interface ACTRecordedActionStream
+ (id)userActionStreamWithParameters:(id)a3 delegate:(id)a4;
- (ACTRecordedActionStream)initWithParameters:(id)a3 delegate:(id)a4;
- (ACTUserActionStreamDelegate)delegate;
- (ACTUserActionStreaming)dataSynthesizer;
- (ACTUserMentalCursor)cursor;
- (BOOL)inPartialCandidateSelection;
- (BOOL)isFinished;
- (NSArray)touchEventsForInputSegments;
- (NSString)intendedText;
- (TIErrorGenerator)errorGenerator;
- (TIKeyboardTyperUserModel)userModel;
- (TTKTestCase)testCase;
- (double)lastTimestamp;
- (id)nextUserAction;
- (unint64_t)touchEventCursor;
- (unsigned)randomNumberSeed;
- (void)configureWithParameters:(id)a3;
- (void)setCursor:(id)a3;
- (void)setDataSynthesizer:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setErrorGenerator:(id)a3;
- (void)setLastTimestamp:(double)a3;
- (void)setRandomNumberSeed:(unsigned int)a3;
- (void)setTestCase:(id)a3;
- (void)setTouchEventCursor:(unint64_t)a3;
- (void)setTouchEventsForInputSegments:(id)a3;
- (void)setUserModel:(id)a3;
- (void)stepCursor;
@end

@implementation ACTRecordedActionStream

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataSynthesizer, 0);
  objc_storeStrong((id *)&self->_touchEventsForInputSegments, 0);
  objc_storeStrong((id *)&self->_testCase, 0);
  objc_storeStrong((id *)&self->_cursor, 0);
  objc_storeStrong((id *)&self->_userModel, 0);
  objc_storeStrong((id *)&self->_errorGenerator, 0);
}

- (void)setDataSynthesizer:(id)a3
{
}

- (ACTUserActionStreaming)dataSynthesizer
{
  return (ACTUserActionStreaming *)objc_getProperty(self, a2, 80, 1);
}

- (void)setTouchEventCursor:(unint64_t)a3
{
  self->_touchEventCursor = a3;
}

- (unint64_t)touchEventCursor
{
  return self->_touchEventCursor;
}

- (void)setTouchEventsForInputSegments:(id)a3
{
}

- (NSArray)touchEventsForInputSegments
{
  return self->_touchEventsForInputSegments;
}

- (void)setTestCase:(id)a3
{
}

- (TTKTestCase)testCase
{
  return self->_testCase;
}

- (void)setLastTimestamp:(double)a3
{
  self->_lastTimestamp = a3;
}

- (double)lastTimestamp
{
  return self->_lastTimestamp;
}

- (void)setCursor:(id)a3
{
}

- (ACTUserMentalCursor)cursor
{
  return self->_cursor;
}

- (void)setRandomNumberSeed:(unsigned int)a3
{
  self->_randomNumberSeed = a3;
}

- (unsigned)randomNumberSeed
{
  return self->_randomNumberSeed;
}

- (void)setUserModel:(id)a3
{
}

- (TIKeyboardTyperUserModel)userModel
{
  return self->_userModel;
}

- (void)setErrorGenerator:(id)a3
{
}

- (TIErrorGenerator)errorGenerator
{
  return self->_errorGenerator;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (ACTUserActionStreamDelegate *)a3;
}

- (ACTUserActionStreamDelegate)delegate
{
  return self->_delegate;
}

- (BOOL)isFinished
{
  v3 = [(ACTRecordedActionStream *)self cursor];
  if ([v3 atEndOfText])
  {
    v4 = [(ACTRecordedActionStream *)self dataSynthesizer];
    char v5 = [v4 isFinished];
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

- (BOOL)inPartialCandidateSelection
{
  return 0;
}

- (void)stepCursor
{
  v3 = [(ACTRecordedActionStream *)self touchEventsForInputSegments];
  v4 = [(ACTRecordedActionStream *)self cursor];
  objc_msgSend(v3, "objectAtIndex:", objc_msgSend(v4, "segmentCursor"));
  id v17 = (id)objc_claimAutoreleasedReturnValue();

  [(ACTRecordedActionStream *)self setTouchEventCursor:[(ACTRecordedActionStream *)self touchEventCursor] + 1];
  if (![v17 count]
    || (unint64_t v5 = -[ACTRecordedActionStream touchEventCursor](self, "touchEventCursor"), v5 < [v17 count]))
  {
    v6 = [(ACTRecordedActionStream *)self dataSynthesizer];
    v7 = [v6 intendedText];
    if (![v7 length])
    {
LABEL_9:

      goto LABEL_10;
    }
    v8 = [(ACTRecordedActionStream *)self dataSynthesizer];
    int v9 = [v8 isFinished];

    if (!v9) {
      goto LABEL_11;
    }
  }
  v10 = [(ACTRecordedActionStream *)self cursor];
  int v11 = [v10 advanceSegmentCursor];

  if (!v11) {
    goto LABEL_11;
  }
  [(ACTRecordedActionStream *)self setTouchEventCursor:0];
  v12 = [(ACTRecordedActionStream *)self touchEventsForInputSegments];
  v13 = [(ACTRecordedActionStream *)self cursor];
  v14 = objc_msgSend(v12, "objectAtIndex:", objc_msgSend(v13, "segmentCursor"));
  uint64_t v15 = [v14 count];

  if (!v15)
  {
    v6 = [(ACTRecordedActionStream *)self cursor];
    v7 = [v6 currentInternalSegment];
    v16 = [(ACTRecordedActionStream *)self dataSynthesizer];
    [v16 setIntendedText:v7];

    goto LABEL_9;
  }
  v6 = [(ACTRecordedActionStream *)self dataSynthesizer];
  [v6 setIntendedText:&stru_26F2B7E50];
LABEL_10:

LABEL_11:
}

- (id)nextUserAction
{
  if ([(ACTRecordedActionStream *)self isFinished])
  {
    v3 = 0;
  }
  else
  {
    v4 = [(ACTRecordedActionStream *)self touchEventsForInputSegments];
    unint64_t v5 = [(ACTRecordedActionStream *)self cursor];
    v6 = objc_msgSend(v4, "objectAtIndex:", objc_msgSend(v5, "segmentCursor"));

    if ([v6 count])
    {
      v7 = objc_msgSend(v6, "objectAtIndex:", -[ACTRecordedActionStream touchEventCursor](self, "touchEventCursor"));
      v3 = [[ACTTouchEvent alloc] initWithTouchEvent:v7];
      v8 = [(ACTRecordedActionStream *)self cursor];
      -[ACTUserAction setInputSegment:](v3, "setInputSegment:", [v8 segmentCursor]);
    }
    else
    {
      v7 = [(ACTRecordedActionStream *)self dataSynthesizer];
      v3 = [v7 nextUserAction];
    }

    [(ACTRecordedActionStream *)self stepCursor];
  }
  return v3;
}

- (NSString)intendedText
{
  v2 = [(ACTRecordedActionStream *)self cursor];
  v3 = [v2 intendedText];

  return (NSString *)v3;
}

- (void)configureWithParameters:(id)a3
{
  uint64_t v60 = *MEMORY[0x263EF8340];
  v3 = [a3 objectForKey:@"TTKTestCase"];
  v42 = [MEMORY[0x263EFF980] array];
  v41 = [MEMORY[0x263EFF980] array];
  long long v54 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  v39 = v3;
  id obj = [v3 records];
  uint64_t v44 = [obj countByEnumeratingWithState:&v54 objects:v59 count:16];
  if (v44)
  {
    unint64_t v4 = 0;
    uint64_t v43 = *(void *)v55;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v55 != v43) {
          objc_enumerationMutation(obj);
        }
        uint64_t v46 = v5;
        v6 = *(void **)(*((void *)&v54 + 1) + 8 * v5);
        v7 = [MEMORY[0x263EFF980] array];
        long long v50 = 0u;
        long long v51 = 0u;
        long long v52 = 0u;
        long long v53 = 0u;
        v45 = v6;
        id v47 = [v6 touchDataCollection];
        uint64_t v49 = [v47 countByEnumeratingWithState:&v50 objects:v58 count:16];
        if (v49)
        {
          uint64_t v48 = *(void *)v51;
          do
          {
            for (uint64_t i = 0; i != v49; ++i)
            {
              if (*(void *)v51 != v48) {
                objc_enumerationMutation(v47);
              }
              int v9 = *(void **)(*((void *)&v50 + 1) + 8 * i);
              v10 = [v9 samples];
              uint64_t v11 = [v10 count];

              if (v11)
              {
                unint64_t v12 = 0;
                do
                {
                  v13 = [v9 samples];
                  v14 = [v13 objectAtIndex:v12];

                  if ([v14 stage] == 7)
                  {
                    if (v12)
                    {
                      uint64_t v15 = [v9 samples];
                      if (v12 + 1 == [v15 count]) {
                        uint64_t v16 = 2;
                      }
                      else {
                        uint64_t v16 = 1;
                      }
                    }
                    else
                    {
                      uint64_t v16 = 0;
                    }
                  }
                  else
                  {
                    uint64_t v16 = [v14 stage];
                  }
                  if (([v14 pathIndex] & 0x8000000000000000) == 0) {
                    unint64_t v4 = [v14 pathIndex];
                  }
                  id v17 = (void *)MEMORY[0x263F7E688];
                  [v14 point];
                  double v19 = v18;
                  double v21 = v20;
                  [v14 radius];
                  double v23 = v22;
                  [v14 timeStamp];
                  v25 = objc_msgSend(v17, "touchEventWithStage:location:radius:timestamp:pathIndex:forcedKeyCode:", v16, v4, -1, v19, v21, v23, v24);
                  [v7 addObject:v25];

                  ++v12;
                  v26 = [v9 samples];
                  unint64_t v27 = [v26 count];
                }
                while (v12 < v27);
              }
              unint64_t v4 = (v4 + 1) % 0xC;
            }
            uint64_t v49 = [v47 countByEnumeratingWithState:&v50 objects:v58 count:16];
          }
          while (v49);
        }

        [v7 sortUsingComparator:&__block_literal_global_5412];
        if ((unint64_t)[v7 count] < 2)
        {
LABEL_30:
          v31 = [v45 primaryIntendedText];
          [v42 addObject:v31];

          v32 = (void *)[v7 copy];
          [v41 addObject:v32];

          goto LABEL_32;
        }
        v28 = [v7 firstObject];
        if ([v28 stage])
        {
        }
        else
        {
          v29 = [v7 lastObject];
          int v30 = [v29 stage];

          if (v30 == 2) {
            goto LABEL_30;
          }
        }
        NSLog(&cfstr_WarningAfterTi.isa);
LABEL_32:

        uint64_t v5 = v46 + 1;
      }
      while (v46 + 1 != v44);
      uint64_t v44 = [obj countByEnumeratingWithState:&v54 objects:v59 count:16];
    }
    while (v44);
  }

  v33 = [ACTUserMentalCursor alloc];
  v34 = (void *)[v42 copy];
  v35 = (void *)[v42 copy];
  v36 = [(ACTUserMentalCursor *)v33 initWithInternalSegments:v34 externalSegments:v35];
  [(ACTRecordedActionStream *)self setCursor:v36];

  v37 = (void *)[v41 copy];
  [(ACTRecordedActionStream *)self setTouchEventsForInputSegments:v37];

  [(ACTRecordedActionStream *)self setTouchEventCursor:0];
}

uint64_t __51__ACTRecordedActionStream_configureWithParameters___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  [v4 timestamp];
  double v7 = v6;
  [v5 timestamp];
  if (v7 >= v8)
  {
    [v4 timestamp];
    double v11 = v10;
    [v5 timestamp];
    uint64_t v9 = v11 != v12;
  }
  else
  {
    uint64_t v9 = -1;
  }

  return v9;
}

- (ACTRecordedActionStream)initWithParameters:(id)a3 delegate:(id)a4
{
  v29[2] = *MEMORY[0x263EF8340];
  id v6 = a3;
  double v7 = (ACTUserActionStreamDelegate *)a4;
  v27.receiver = self;
  v27.super_class = (Class)ACTRecordedActionStream;
  double v8 = [(ACTRecordedActionStream *)&v27 init];
  if (v8)
  {
    uint64_t v9 = objc_alloc_init(ACTUserMentalCursor);
    cursor = v8->_cursor;
    v8->_cursor = v9;

    touchEventsForInputSegments = v8->_touchEventsForInputSegments;
    v8->_touchEventsForInputSegments = (NSArray *)MEMORY[0x263EFFA68];

    uint64_t v12 = MEMORY[0x263EFFA80];
    v8->_delegate = v7;
    v28[0] = @"BASE_KEY_FOR_VARIANTS";
    v28[1] = @"DECOMPOSE_INPUT_STRING";
    v29[0] = v12;
    uint64_t v13 = objc_msgSend(v6, "objectForKeyedSubscript:");
    v14 = (void *)v13;
    if (v13) {
      uint64_t v15 = v13;
    }
    else {
      uint64_t v15 = v12;
    }
    v29[1] = v15;
    uint64_t v16 = [NSDictionary dictionaryWithObjects:v29 forKeys:v28 count:2];

    uint64_t v17 = +[ACTUserActionStreamFactory userActionStreamWithParameters:v16 delegate:v8->_delegate];
    dataSynthesizer = v8->_dataSynthesizer;
    v8->_dataSynthesizer = (ACTUserActionStreaming *)v17;
  }
  [(ACTRecordedActionStream *)v8 configureWithParameters:v6];
  double v19 = [(ACTRecordedActionStream *)v8 touchEventsForInputSegments];
  double v20 = [(ACTRecordedActionStream *)v8 cursor];
  double v21 = objc_msgSend(v19, "objectAtIndex:", objc_msgSend(v20, "segmentCursor"));
  uint64_t v22 = [v21 count];

  if (!v22)
  {
    double v23 = [(ACTRecordedActionStream *)v8 cursor];
    double v24 = [v23 currentInternalSegment];
    v25 = [(ACTRecordedActionStream *)v8 dataSynthesizer];
    [v25 setIntendedText:v24];
  }
  return v8;
}

+ (id)userActionStreamWithParameters:(id)a3 delegate:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  double v7 = [[ACTRecordedActionStream alloc] initWithParameters:v6 delegate:v5];

  return v7;
}

@end
@interface RCPEventStream
+ (RCPEventStream)eventStreamWithData:(id)a3 error:(id *)a4;
+ (RCPEventStream)eventStreamWithFileURL:(id)a3 error:(id *)a4;
+ (RCPEventStream)eventStreamWithStudyLogFileURL:(id)a3 error:(id *)a4;
- (NSArray)events;
- (NSMutableArray)rawEvents;
- (RCPEventEnvironment)environment;
- (RCPEventStream)init;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dataRepresentation;
- (id)emptyCopy;
- (id)statistics;
- (id)streamByAddingEventsFromStream:(id)a3 withDistance:(double)a4;
- (id)timingStatistics;
- (id)trimmedFrom:(unint64_t)a3 to:(unint64_t)a4;
- (void)_addEvent:(id)a3;
- (void)enumerateEventsUsingBlock:(id)a3;
- (void)filterEventsUsingBlock:(id)a3;
- (void)setEnvironment:(id)a3;
- (void)setEvents:(id)a3;
- (void)transformDigitizerEventLocationsWithTransform:(CGAffineTransform *)a3;
- (void)writeToURL:(id)a3;
@end

@implementation RCPEventStream

- (RCPEventEnvironment)environment
{
  return self->_environment;
}

- (RCPEventStream)init
{
  v8.receiver = self;
  v8.super_class = (Class)RCPEventStream;
  v2 = [(RCPEventStream *)&v8 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA48] array];
    rawEvents = v2->_rawEvents;
    v2->_rawEvents = (NSMutableArray *)v3;

    uint64_t v5 = +[RCPEventEnvironment currentEnvironment];
    environment = v2->_environment;
    v2->_environment = (RCPEventEnvironment *)v5;
  }
  return v2;
}

- (NSArray)events
{
  return (NSArray *)[MEMORY[0x1E4F1C978] arrayWithArray:self->_rawEvents];
}

- (void)setEvents:(id)a3
{
  rawEvents = self->_rawEvents;
  id v5 = a3;
  [(NSMutableArray *)rawEvents removeAllObjects];
  [(NSMutableArray *)self->_rawEvents addObjectsFromArray:v5];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rawEvents, 0);
  objc_storeStrong((id *)&self->_environment, 0);
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_opt_class();
  id v5 = [(RCPEventStream *)self dataRepresentation];
  id v9 = 0;
  v6 = [v4 eventStreamWithData:v5 error:&v9];
  id v7 = v9;

  if (!v6) {
    NSLog(&cfstr_Error.isa, v7);
  }

  return v6;
}

- (id)dataRepresentation
{
  v11[2] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA58]);
  [v3 appendBytes:objc_msgSend(@"RECAP0", "UTF8String"), 6 length];
  v4 = (void *)[objc_alloc(MEMORY[0x1E4F28DB0]) initRequiringSecureCoding:0];
  v10[0] = @"env";
  id v5 = [(RCPEventStream *)self environment];
  v10[1] = @"events";
  v11[0] = v5;
  v6 = [(RCPEventStream *)self rawEvents];
  v11[1] = v6;
  id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:2];
  [v4 encodeObject:v7 forKey:*MEMORY[0x1E4F284E8]];

  [v4 finishEncoding];
  objc_super v8 = [v4 encodedData];
  [v3 appendData:v8];

  return v3;
}

- (void)writeToURL:(id)a3
{
  id v4 = a3;
  id v5 = [(RCPEventStream *)self dataRepresentation];
  [v5 writeToURL:v4 options:1 error:0];
}

- (id)trimmedFrom:(unint64_t)a3 to:(unint64_t)a4
{
  if (a4 < a3)
  {
    id v5 = (RCPEventStream *)[(RCPEventStream *)self copy];
    goto LABEL_15;
  }
  uint64_t v8 = [(NSMutableArray *)self->_rawEvents count] - 1;
  int64_t v9 = 0;
  if (![(NSMutableArray *)self->_rawEvents count]) {
    goto LABEL_12;
  }
  unint64_t v10 = 0;
  while (1)
  {
    v11 = [(NSMutableArray *)self->_rawEvents objectAtIndexedSubscript:v10];
    unint64_t v12 = [v11 timestamp];

    if (v12 >= a3) {
      break;
    }
    int64_t v9 = ++v10;
LABEL_9:
    if (v10 >= [(NSMutableArray *)self->_rawEvents count]) {
      goto LABEL_12;
    }
  }
  v13 = [(NSMutableArray *)self->_rawEvents objectAtIndexedSubscript:v10];
  unint64_t v14 = [v13 timestamp];

  if (v14 <= a4)
  {
    ++v10;
    goto LABEL_9;
  }
  uint64_t v8 = v10;
LABEL_12:
  id v5 = objc_alloc_init(RCPEventStream);
  if (v8 > v9)
  {
    v15 = -[NSMutableArray subarrayWithRange:](self->_rawEvents, "subarrayWithRange:", v9, v8 - v9);
    [(RCPEventStream *)v5 setEvents:v15];
  }
  v16 = [(RCPEventStream *)self environment];
  [(RCPEventStream *)v5 setEnvironment:v16];

LABEL_15:
  return v5;
}

- (id)streamByAddingEventsFromStream:(id)a3 withDistance:(double)a4
{
  id v6 = a3;
  id v7 = (id *)objc_opt_new();
  uint64_t v8 = [(RCPEventStream *)self environment];
  [v7 setEnvironment:v8];
  int64_t v9 = [(RCPEventStream *)self events];
  [v7 setEvents:v9];

  unint64_t v10 = [(RCPEventStream *)self environment];
  v11 = [(NSMutableArray *)self->_rawEvents lastObject];
  objc_msgSend(v10, "timeIntervalForMachAbsoluteTime:", objc_msgSend(v11, "deliveryTimestamp"));
  double v13 = v12;
  unint64_t v14 = [v6 environment];
  v15 = [v6 events];
  v16 = [v15 firstObject];
  objc_msgSend(v14, "timeIntervalForMachAbsoluteTime:", objc_msgSend(v16, "deliveryTimestamp"));
  double v18 = v13 - v17 + a4;

  id v19 = v7[2];
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __62__RCPEventStream_streamByAddingEventsFromStream_withDistance___block_invoke;
  v25[3] = &unk_1E5D77258;
  double v28 = v18;
  id v26 = v8;
  id v27 = v19;
  id v20 = v19;
  id v21 = v8;
  [v6 enumerateEventsUsingBlock:v25];

  v22 = v27;
  v23 = v7;

  return v23;
}

void __62__RCPEventStream_streamByAddingEventsFromStream_withDistance___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  objc_msgSend(v3, "timeIntervalForMachAbsoluteTime:", objc_msgSend(v4, "deliveryTimestamp"));
  id v6 = *(void **)(a1 + 40);
  id v7 = [v4 eventAdjustedForDeliveryTimeInterval:*(void *)(a1 + 32) eventEnvironment:v5 + *(double *)(a1 + 48)];

  [v6 addObject:v7];
}

- (id)emptyCopy
{
  id v3 = objc_opt_new();
  id v4 = [(RCPEventStream *)self environment];
  [v3 setEnvironment:v4];

  return v3;
}

- (void)_addEvent:(id)a3
{
}

+ (RCPEventStream)eventStreamWithData:(id)a3 error:(id *)a4
{
  v47[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  unint64_t v6 = [@"RECAP0" length];
  if ([v5 length] >= v6)
  {
    id v7 = [NSString alloc];
    id v8 = v5;
    int64_t v9 = objc_msgSend(v7, "initWithBytes:length:encoding:", objc_msgSend(v8, "bytes"), v6, 4);
    char v10 = [v9 isEqual:@"RECAP0"];

    if (v10)
    {
      v11 = objc_msgSend(v8, "subdataWithRange:", v6, objc_msgSend(v8, "length") - v6);
      id v44 = 0;
      double v12 = (void *)[objc_alloc(MEMORY[0x1E4F28DC0]) initForReadingFromData:v11 error:&v44];
      id v13 = v44;
      id v14 = v13;
      if (!v12)
      {
        v23 = (FILE *)*MEMORY[0x1E4F143C8];
        id v24 = [v13 description];
        fprintf(v23, "error: decoder returned nil with error:%s.\n\n", (const char *)[v24 UTF8String]);

        if (a4)
        {
          id v14 = v14;
          id v20 = 0;
          *a4 = v14;
        }
        else
        {
          id v20 = 0;
        }
        goto LABEL_31;
      }
      v41[0] = MEMORY[0x1E4F143A8];
      v41[1] = 3221225472;
      v41[2] = __44__RCPEventStream_eventStreamWithData_error___block_invoke;
      v41[3] = &unk_1E5D77280;
      id v15 = v13;
      id v42 = v15;
      v43 = a4;
      v16 = (unsigned int (**)(void, void))MEMORY[0x1AD0ECCD0](v41);
      [v12 setRequiresSecureCoding:0];
      double v17 = [v12 decodeObjectForKey:*MEMORY[0x1E4F284E8]];
      if (!v17)
      {
        id v14 = [v12 error];

        v25 = (FILE *)*MEMORY[0x1E4F143C8];
        id v26 = [v14 description];
        fprintf(v25, "error: this file contains no root object:%s\n\n", (const char *)[v26 UTF8String]);

        if (a4)
        {
          id v14 = v14;
          id v20 = 0;
          *a4 = v14;
        }
        else
        {
          id v20 = 0;
        }
        goto LABEL_30;
      }
      double v18 = (id *)objc_opt_new();
      objc_opt_class();
      id v19 = v18 + 2;
      if (objc_opt_isKindOfClass())
      {
        fputs("warning: this event stream appears to be from ≈2015 C.E. and may not work on current OS versions. Proceed with caution.\n\n", (FILE *)*MEMORY[0x1E4F143C8]);
        objc_storeStrong(v18 + 2, v17);
        id v14 = v15;
      }
      else
      {
        uint64_t v27 = [v17 objectForKey:@"events"];
        id v28 = *v19;
        *id v19 = (id)v27;

        id v14 = [v12 error];

        if (!((unsigned int (**)(void, const char *))v16)[2](v16, "decoding events")) {
          goto LABEL_28;
        }
        v36 = v16;
        if (![*v19 count]) {
          fputs("warning: this event stream contains no events\n\n", (FILE *)*MEMORY[0x1E4F143C8]);
        }
        long long v39 = 0u;
        long long v40 = 0u;
        long long v37 = 0u;
        long long v38 = 0u;
        id v29 = *v19;
        uint64_t v30 = [v29 countByEnumeratingWithState:&v37 objects:v45 count:16];
        if (v30)
        {
          uint64_t v31 = v30;
          uint64_t v32 = *(void *)v38;
          do
          {
            for (uint64_t i = 0; i != v31; ++i)
            {
              if (*(void *)v38 != v32) {
                objc_enumerationMutation(v29);
              }
              [*(id *)(*((void *)&v37 + 1) + 8 * i) hidEvent];
              IOHIDEventSetAttributeData();
            }
            uint64_t v31 = [v29 countByEnumeratingWithState:&v37 objects:v45 count:16];
          }
          while (v31);
        }

        v34 = [v17 objectForKey:@"env"];
        [v18 setEnvironment:v34];

        v16 = v36;
        if (!((unsigned int (**)(void, const char *))v36)[2](v36, "decoding environment"))
        {
LABEL_28:
          id v20 = 0;
          goto LABEL_29;
        }
        id v20 = [v18 environment];

        if (!v20)
        {
          fputs("error: this event stream contains no environment\n\n", (FILE *)*MEMORY[0x1E4F143C8]);
          goto LABEL_29;
        }
      }
      id v20 = v18;
LABEL_29:

LABEL_30:
LABEL_31:

      goto LABEL_32;
    }
  }
  if (!a4)
  {
    id v20 = 0;
    goto LABEL_33;
  }
  id v21 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v22 = kRPCEventStreamErrorDomainFile;
  uint64_t v46 = *MEMORY[0x1E4F28588];
  v47[0] = @"Wrong file format.";
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v47 forKeys:&v46 count:1];
  [v21 errorWithDomain:v22 code:1 userInfo:v11];
  id v20 = 0;
  *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_32:

LABEL_33:
  return (RCPEventStream *)v20;
}

BOOL __44__RCPEventStream_eventStreamWithData_error___block_invoke(uint64_t a1, const char *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    id v5 = (FILE *)*MEMORY[0x1E4F143C8];
    id v6 = [*(id *)(a1 + 32) description];
    fprintf(v5, "error: %s:%s\n\n", a2, (const char *)[v6 UTF8String]);

    if (*(void *)(a1 + 40)) {
      **(void **)(a1 + 40) = *(id *)(a1 + 32);
    }
  }
  return v2 == 0;
}

+ (RCPEventStream)eventStreamWithFileURL:(id)a3 error:(id *)a4
{
  id v6 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:a3 options:1 error:a4];
  if (v6)
  {
    id v7 = [a1 eventStreamWithData:v6 error:a4];
  }
  else
  {
    id v7 = 0;
  }

  return (RCPEventStream *)v7;
}

+ (RCPEventStream)eventStreamWithStudyLogFileURL:(id)a3 error:(id *)a4
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F1CA10]) initWithURL:v5];
  [v6 open];
  id v7 = [MEMORY[0x1E4F28D90] JSONObjectWithStream:v6 options:4 error:a4];
  [v6 close];
  if (v7)
  {
    long long v38 = v6;
    id v39 = v5;
    uint64_t v46 = objc_alloc_init(RCPEventStream);
    long long v52 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    long long v37 = v7;
    id obj = v7;
    uint64_t v42 = [obj countByEnumeratingWithState:&v52 objects:v57 count:16];
    if (v42)
    {
      uint64_t v41 = *(void *)v53;
      id v8 = @"data";
      unint64_t v9 = 0x1E4F1C000uLL;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v53 != v41) {
            objc_enumerationMutation(obj);
          }
          uint64_t v45 = v10;
          v11 = *(void **)(*((void *)&v52 + 1) + 8 * v10);
          double v12 = [v11 objectForKeyedSubscript:@"start"];
          id v13 = [v12 objectForKeyedSubscript:@"date"];

          id v14 = [v11 objectForKeyedSubscript:@"start"];
          id v15 = [v14 objectForKeyedSubscript:@"timestamp"];

          v16 = [(RCPEventStream *)v46 environment];
          double v17 = (void *)MEMORY[0x1E4F1C9C8];
          [v13 doubleValue];
          double v18 = objc_msgSend(v17, "dateWithTimeIntervalSince1970:");
          objc_msgSend(v16, "setStartDate:machAbsoluteTime:", v18, objc_msgSend(v15, "unsignedLongLongValue"));

          id v19 = (void *)MEMORY[0x1E4F1C9C8];
          [v13 doubleValue];
          id v20 = objc_msgSend(v19, "dateWithTimeIntervalSince1970:");
          v43 = v15;
          id v44 = v13;
          NSLog(&cfstr_StartdateStart.isa, v13, v20, v15);

          long long v50 = 0u;
          long long v51 = 0u;
          long long v48 = 0u;
          long long v49 = 0u;
          id v47 = [v11 objectForKeyedSubscript:@"entries"];
          uint64_t v21 = [v47 countByEnumeratingWithState:&v48 objects:v56 count:16];
          if (v21)
          {
            uint64_t v22 = v21;
            uint64_t v23 = *(void *)v49;
            do
            {
              for (uint64_t i = 0; i != v22; ++i)
              {
                if (*(void *)v49 != v23) {
                  objc_enumerationMutation(v47);
                }
                v25 = *(void **)(*((void *)&v48 + 1) + 8 * i);
                id v26 = [v25 objectForKeyedSubscript:v8];
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  uint64_t v27 = [v26 objectForKeyedSubscript:@"description"];
                  int v28 = [v27 isEqualToString:@"FromHID"];

                  if (v28)
                  {
                    id v29 = [v25 objectForKeyedSubscript:v8];
                    uint64_t v30 = [v29 objectForKeyedSubscript:@"RawCollectionData"];

                    if (v30)
                    {
                      uint64_t v31 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v30 options:0];
                      if (v31)
                      {
                        uint64_t v32 = (const void *)MEMORY[0x1AD0EC5F0](0, v31);
                        v33 = v8;
                        unint64_t v34 = v9;
                        v35 = +[RCPEvent eventWithHIDEvent:v32 deliveryTimeStamp:IOHIDEventGetTimeStamp()];
                        [(NSMutableArray *)v46->_rawEvents addObject:v35];
                        CFRelease(v32);

                        unint64_t v9 = v34;
                        id v8 = v33;
                      }
                    }
                  }
                }
              }
              uint64_t v22 = [v47 countByEnumeratingWithState:&v48 objects:v56 count:16];
            }
            while (v22);
          }

          uint64_t v10 = v45 + 1;
        }
        while (v45 + 1 != v42);
        uint64_t v42 = [obj countByEnumeratingWithState:&v52 objects:v57 count:16];
      }
      while (v42);
    }

    id v6 = v38;
    id v5 = v39;
    id v7 = v37;
  }
  else
  {
    uint64_t v46 = 0;
  }

  return v46;
}

- (id)statistics
{
  id v3 = objc_opt_new();
  id v4 = [(RCPEventStream *)self rawEvents];
  id v5 = [(RCPEventStream *)self environment];
  id v6 = [(RCPEventStream *)self environment];
  [v5 speedFactorToAdjustRecordingEnvironment:v6];
  double v8 = v7;

  unint64_t v9 = objc_msgSend(NSString, "stringWithFormat:", @"%ld Events", objc_msgSend(v4, "count"));
  [v3 addObject:v9];

  uint64_t v10 = NSString;
  v11 = [v4 lastObject];
  uint64_t v12 = [v11 deliveryTimestamp];
  id v13 = [v4 firstObject];
  id v14 = objc_msgSend(v10, "stringWithFormat:", @"%0.4fs total duration (%0.4fx original)", RCPTimeIntervalFromMachTimestamp(v12 - objc_msgSend(v13, "deliveryTimestamp")) / v8, 1.0 / v8);
  [v3 addObject:v14];

  id v15 = [v3 componentsJoinedByString:@", "];

  return v15;
}

- (id)timingStatistics
{
  id v3 = objc_opt_new();
  id v4 = [(RCPEventStream *)self environment];
  id v5 = [(RCPEventStream *)self environment];
  [v4 speedFactorToAdjustRecordingEnvironment:v5];
  uint64_t v7 = v6;

  v16[0] = 0;
  v16[1] = v16;
  v16[2] = 0x3032000000;
  v16[3] = __Block_byref_object_copy__1;
  v16[4] = __Block_byref_object_dispose__1;
  id v17 = 0;
  double v8 = [(RCPEventStream *)self rawEvents];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __34__RCPEventStream_timingStatistics__block_invoke;
  v12[3] = &unk_1E5D772A8;
  id v14 = v16;
  id v9 = v3;
  id v13 = v9;
  uint64_t v15 = v7;
  [v8 enumerateObjectsUsingBlock:v12];

  uint64_t v10 = [v9 componentsJoinedByString:@", "];

  _Block_object_dispose(v16, 8);
  return v10;
}

void __34__RCPEventStream_timingStatistics__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  if (*(void *)(v5 + 40))
  {
    uint64_t v6 = *(void **)(a1 + 32);
    uint64_t v7 = NSString;
    double v8 = RCPTimeIntervalFromMachTimestamp([v3 deliveryTimestamp]);
    double v9 = (v8
        - RCPTimeIntervalFromMachTimestamp([*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) deliveryTimestamp]))
       * *(double *)(a1 + 48);
    [v4 hidEvent];
    unint64_t TimeStamp = IOHIDEventGetTimeStamp();
    double v11 = RCPTimeIntervalFromMachTimestamp(TimeStamp);
    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) hidEvent];
    unint64_t v12 = IOHIDEventGetTimeStamp();
    id v13 = [v7 stringWithFormat:@"%0.9fs, (%0.9fs)", *(void *)&v9, v11 - RCPTimeIntervalFromMachTimestamp(v12)];
    [v6 addObject:v13];

    uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  }
  id v14 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

- (void)enumerateEventsUsingBlock:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(RCPEventStream *)self rawEvents];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __44__RCPEventStream_enumerateEventsUsingBlock___block_invoke;
  v7[3] = &unk_1E5D772D0;
  id v8 = v4;
  id v6 = v4;
  [v5 enumerateObjectsUsingBlock:v7];
}

uint64_t __44__RCPEventStream_enumerateEventsUsingBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)filterEventsUsingBlock:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_new();
  uint64_t v8 = MEMORY[0x1E4F143A8];
  uint64_t v9 = 3221225472;
  uint64_t v10 = __41__RCPEventStream_filterEventsUsingBlock___block_invoke;
  double v11 = &unk_1E5D772F8;
  id v12 = v5;
  id v13 = v4;
  id v6 = v5;
  id v7 = v4;
  [(RCPEventStream *)self enumerateEventsUsingBlock:&v8];
  -[RCPEventStream setEvents:](self, "setEvents:", v6, v8, v9, v10, v11);
}

void __41__RCPEventStream_filterEventsUsingBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ((*(unsigned int (**)(void))(*(void *)(a1 + 40) + 16))()) {
    [*(id *)(a1 + 32) addObject:v3];
  }
}

- (void)transformDigitizerEventLocationsWithTransform:(CGAffineTransform *)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = [(RCPEventStream *)self events];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = [*(id *)(*((void *)&v12 + 1) + 8 * v8) hidEvent];
        long long v10 = *(_OWORD *)&a3->c;
        v11[0] = *(_OWORD *)&a3->a;
        v11[1] = v10;
        v11[2] = *(_OWORD *)&a3->tx;
        RCPHIDEventTransformLocation(v9, v11);
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }
}

- (void)setEnvironment:(id)a3
{
}

- (NSMutableArray)rawEvents
{
  return self->_rawEvents;
}

@end
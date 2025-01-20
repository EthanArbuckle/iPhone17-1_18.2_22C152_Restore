@interface SFBLERecorder
- (BOOL)recordDevice:(id)a3 data:(id)a4 rssi:(id)a5 info:(id)a6 error:(id *)a7;
- (BOOL)replayNextRecording;
- (BOOL)saveToDirectory:(id)a3;
- (SFBLERecorder)initWithPayloadType:(int64_t)a3;
- (SFBLERecorder)initWithRecordingURL:(id)a3;
- (SFBLERecorderReplayDelegate)replayDelegate;
- (int64_t)payloadType;
- (void)setReplayDelegate:(id)a3;
@end

@implementation SFBLERecorder

- (SFBLERecorder)initWithPayloadType:(int64_t)a3
{
  v10.receiver = self;
  v10.super_class = (Class)SFBLERecorder;
  v4 = [(SFBLERecorder *)&v10 init];
  v5 = v4;
  if (v4)
  {
    v4->_payloadType = a3;
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    recordings = v5->_recordings;
    v5->_recordings = v6;

    v8 = v5;
  }

  return v5;
}

- (SFBLERecorder)initWithRecordingURL:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)SFBLERecorder;
  v5 = [(SFBLERecorder *)&v14 init];
  if (v5)
  {
    v6 = (void *)[objc_alloc(MEMORY[0x1E4F1C9E8]) initWithContentsOfURL:v4];
    v7 = v6;
    if (v6)
    {
      v8 = [v6 objectForKeyedSubscript:@"payloadType"];
      if (v8 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        v9 = [v7 objectForKeyedSubscript:@"recordings"];
        if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
          v5->_payloadType = [v8 integerValue];
          uint64_t v10 = [v9 mutableCopy];
          recordings = v5->_recordings;
          v5->_recordings = (NSMutableArray *)v10;

          v12 = v5;
        }
        else
        {
          v12 = 0;
        }
      }
      else
      {
        v12 = 0;
      }
    }
    else
    {
      v12 = 0;
    }
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (BOOL)recordDevice:(id)a3 data:(id)a4 rssi:(id)a5 info:(id)a6 error:(id *)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  if (v15)
  {
    v16 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v15 requiringSecureCoding:1 error:a7];
    if (!v16)
    {
      BOOL v17 = 0;
      goto LABEL_14;
    }
  }
  else
  {
    v16 = 0;
  }
  id v18 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  if (v13)
  {
    v19 = (void *)[v13 copy];
    [v18 setObject:v19 forKeyedSubscript:@"data"];
  }
  if (v12)
  {
    v20 = [v12 UUIDString];
    [v18 setObject:v20 forKeyedSubscript:@"device"];
  }
  if (v16) {
    [v18 setObject:v16 forKeyedSubscript:@"infoData"];
  }
  if (v14) {
    [v18 setObject:v14 forKeyedSubscript:@"rssi"];
  }
  v21 = NSNumber;
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  v22 = objc_msgSend(v21, "numberWithDouble:");
  [v18 setObject:v22 forKeyedSubscript:@"timestamp"];

  recordings = self->_recordings;
  v24 = (void *)[v18 copy];
  [(NSMutableArray *)recordings addObject:v24];

  BOOL v17 = 1;
LABEL_14:

  return v17;
}

- (BOOL)replayNextRecording
{
  unint64_t replayIndex = self->_replayIndex;
  unint64_t v4 = [(NSMutableArray *)self->_recordings count];
  unint64_t v15 = replayIndex;
  if (replayIndex < v4)
  {
    recordings = self->_recordings;
    ++self->_replayIndex;
    v6 = -[NSMutableArray objectAtIndexedSubscript:](recordings, "objectAtIndexedSubscript:");
    v7 = [v6 objectForKeyedSubscript:@"device"];
    if (v7) {
      v8 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v7];
    }
    else {
      v8 = 0;
    }
    v9 = [v6 objectForKeyedSubscript:@"infoData"];
    if (v9)
    {
      uint64_t v10 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v9 error:0];
    }
    else
    {
      uint64_t v10 = 0;
    }
    id WeakRetained = objc_loadWeakRetained((id *)&self->_replayDelegate);
    id v12 = [v6 objectForKeyedSubscript:@"data"];
    id v13 = [v6 objectForKeyedSubscript:@"rssi"];
    [WeakRetained recorder:self replayDevice:v8 data:v12 rssi:v13 info:v10];
  }
  return v15 < v4;
}

- (BOOL)saveToDirectory:(id)a3
{
  v30[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 isFileURL] && -[NSMutableArray count](self->_recordings, "count"))
  {
    id v28 = 0;
    int v5 = [v4 getResourceValue:&v28 forKey:*MEMORY[0x1E4F1C628] error:0];
    id v6 = v28;
    v7 = v6;
    if (v5 && [v6 BOOLValue])
    {
      v8 = [(NSMutableArray *)self->_recordings firstObject];
      v9 = [v8 objectForKeyedSubscript:@"timestamp"];

      if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        id v10 = objc_alloc_init(MEMORY[0x1E4F28C10]);
        v11 = [MEMORY[0x1E4F1CA20] localeWithLocaleIdentifier:@"en_US_POSIX"];
        [v10 setLocale:v11];

        [v10 setDateFormat:@"yyyy-MM-dd_HH-mm-ss"];
        id v12 = (void *)MEMORY[0x1E4F1C9C8];
        [v9 doubleValue];
        id v13 = objc_msgSend(v12, "dateWithTimeIntervalSinceReferenceDate:");
        id v14 = NSString;
        unint64_t v15 = [v10 stringFromDate:v13];
        v16 = [v14 stringWithFormat:@"SFBLERecording_%@.xml", v15];

        BOOL v17 = [v4 URLByAppendingPathComponent:v16];
        if (v17)
        {
          v29[0] = @"payloadType";
          [NSNumber numberWithInteger:self->_payloadType];
          v27 = v16;
          id v18 = v13;
          v19 = v9;
          id v20 = v4;
          v22 = v21 = v7;
          v29[1] = @"recordings";
          v30[0] = v22;
          v23 = (void *)[(NSMutableArray *)self->_recordings copy];
          v30[1] = v23;
          v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v30 forKeys:v29 count:2];
          char v25 = [v24 writeToURL:v17 atomically:1];

          v7 = v21;
          id v4 = v20;
          v9 = v19;
          id v13 = v18;
          v16 = v27;
        }
        else
        {
          char v25 = 0;
        }
      }
      else
      {
        char v25 = 0;
      }
    }
    else
    {
      char v25 = 0;
    }
  }
  else
  {
    char v25 = 0;
  }

  return v25;
}

- (int64_t)payloadType
{
  return self->_payloadType;
}

- (SFBLERecorderReplayDelegate)replayDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_replayDelegate);

  return (SFBLERecorderReplayDelegate *)WeakRetained;
}

- (void)setReplayDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_replayDelegate);

  objc_storeStrong((id *)&self->_recordings, 0);
}

@end
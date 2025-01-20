@interface IPASloMoOperation
+ (id)operationFromFileURL:(id)a3;
- ($222789CE95D16A76D31543149FD45E96)timeRange;
- (BOOL)isEqualToOperation:(id)a3;
- (BOOL)isMigratable;
- (IPASloMoOperation)initWithOperation:(id)a3;
- (IPASloMoOperation)initWithSettingsDictionary:(id)a3;
- (IPASloMoOperation)initWithTimeRange:(id *)a3 rate:(float)a4;
- (float)rate;
- (id)copyWithZone:(_NSZone *)a3;
- (id)debugDescription;
- (id)identifier;
- (id)internalRepresentation;
- (id)settingsDictionary;
@end

@implementation IPASloMoOperation

- (id)debugDescription
{
  [(IPASloMoOperation *)self timeRange];
  [(IPASloMoOperation *)self rate];
  float v4 = v3;
  v5 = NSString;
  uint64_t v6 = objc_opt_class();
  memset(&range, 0, sizeof(range));
  v7 = (__CFString *)CMTimeRangeCopyDescription((CFAllocatorRef)*MEMORY[0x1E4F1CF80], &range);
  v8 = [v5 stringWithFormat:@"<%@:%p timeRange=%@ rate=%f>", v6, self, v7, v4];

  return v8;
}

- (id)identifier
{
  v2 = @"SloMo";
  return @"SloMo";
}

- ($222789CE95D16A76D31543149FD45E96)timeRange
{
  long long v3 = *(_OWORD *)&self->var1.var0;
  *(_OWORD *)&retstr->var0.var0 = *(_OWORD *)&self->var0.var1;
  *(_OWORD *)&retstr->var0.var3 = v3;
  *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)&self->var1.var3;
  return self;
}

- (float)rate
{
  return self->_rate;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = [(IPAEditOperation *)+[IPASloMoOperation allocWithZone:a3] init];
  long long v6 = *(_OWORD *)&self->_timeRange.start.epoch;
  long long v5 = *(_OWORD *)&self->_timeRange.duration.timescale;
  *(_OWORD *)((char *)result + 8) = *(_OWORD *)&self->_timeRange.start.value;
  *(_OWORD *)((char *)result + 24) = v6;
  *(_OWORD *)((char *)result + 40) = v5;
  *((_DWORD *)result + 14) = LODWORD(self->_rate);
  return result;
}

- (BOOL)isEqualToOperation:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    [(IPASloMoOperation *)self timeRange];
    [(IPASloMoOperation *)self rate];
    float v7 = v6;
    memset(v19, 0, sizeof(v19));
    if (v5) {
      [v5 timeRange];
    }
    [v5 rate];
    float v9 = v8;
    CMTimeRange range = v19[1];
    CMTimeRange otherRange = v19[0];
    if (CMTimeRangeContainsTimeRange(&range, &otherRange))
    {
      CMTimeRange range = v19[0];
      CMTimeRange otherRange = v19[1];
      BOOL v10 = CMTimeRangeContainsTimeRange(&range, &otherRange) != 0;
    }
    else
    {
      BOOL v10 = 0;
    }
    range.start = v19[1].duration;
    long long v16 = *MEMORY[0x1E4F1FA48];
    *(_OWORD *)&otherRange.start.value = *MEMORY[0x1E4F1FA48];
    CMTimeEpoch v12 = *(void *)(MEMORY[0x1E4F1FA48] + 16);
    otherRange.start.epoch = v12;
    if (CMTimeCompare(&range.start, &otherRange.start))
    {
      BOOL v13 = 0;
    }
    else
    {
      range.start = v19[0].duration;
      *(_OWORD *)&otherRange.start.value = v16;
      otherRange.start.epoch = v12;
      BOOL v13 = CMTimeCompare(&range.start, &otherRange.start) == 0;
    }
    BOOL v14 = v10 || v13;
    BOOL v11 = v7 == v9 && v14;
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

- (id)settingsDictionary
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v2 = [(IPASloMoOperation *)self internalRepresentation];
  long long v3 = [v2 propertyListDictionary];
  id v4 = v3;
  if (v3)
  {
    id v5 = [v3 objectForKeyedSubscript:@"adjustmentData"];
    if (v5)
    {
      id v10 = 0;
      float v6 = +[IPAAdjustmentStackSerializer propertyListFromData:v5 error:&v10];
      id v7 = v10;
      if (!v6)
      {
        float v8 = IPAAdjustmentGetLog();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v12 = v7;
          _os_log_impl(&dword_1DD3FD000, v8, OS_LOG_TYPE_DEFAULT, "got back nil settings plist from PFVideoAdustments, error:%@", buf, 0xCu);
        }
      }
    }
    else
    {
      _PFAssertContinueHandler();
      float v6 = 0;
    }
  }
  else
  {
    float v6 = 0;
  }

  return v6;
}

- (IPASloMoOperation)initWithSettingsDictionary:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)IPASloMoOperation;
  id v5 = [(IPAEditOperation *)&v16 init];
  if (v5)
  {
    float v6 = [v4 objectForKeyedSubscript:@"slowMotion"];
    if (v6)
    {
      id v15 = 0;
      id v7 = +[IPAAdjustmentStackSerializer dataFromPropertyList:v4 error:&v15];
      id v8 = v15;
      if (v7)
      {
        float v9 = (void *)[objc_alloc(MEMORY[0x1E4F8CE18]) initWithFormatIdentifier:@"com.apple.video.slomo" formatVersion:@"1.1" data:v7 baseVersion:0 editorBundleID:0 renderTypes:0];

        if (v9)
        {
          [v9 slowMotionTimeRange];
          long long v10 = *(_OWORD *)buf;
          long long v11 = v19;
          *(_OWORD *)(v5 + 24) = v18;
          *(_OWORD *)(v5 + 40) = v11;
          *(_OWORD *)(v5 + 8) = v10;
          [v9 slowMotionRate];
          *((_DWORD *)v5 + 14) = v12;
LABEL_10:

          goto LABEL_11;
        }
      }
      else
      {
        uint64_t v13 = IPAAdjustmentGetLog();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          *(void *)&uint8_t buf[4] = v4;
          _os_log_impl(&dword_1DD3FD000, v13, OS_LOG_TYPE_DEFAULT, "unable to serialize %@ to data", buf, 0xCu);
        }
      }
    }
    float v9 = v5;
    id v5 = 0;
    goto LABEL_10;
  }
LABEL_11:

  return (IPASloMoOperation *)v5;
}

- (IPASloMoOperation)initWithOperation:(id)a3
{
  id v4 = (char *)a3;
  v10.receiver = self;
  v10.super_class = (Class)IPASloMoOperation;
  id v5 = [(IPAEditOperation *)&v10 initWithOperation:v4];
  float v6 = (IPASloMoOperation *)v5;
  if (v5)
  {
    long long v8 = *(_OWORD *)(v4 + 24);
    long long v7 = *(_OWORD *)(v4 + 40);
    *(_OWORD *)(v5 + 8) = *(_OWORD *)(v4 + 8);
    *(_OWORD *)(v5 + 24) = v8;
    *(_OWORD *)(v5 + 40) = v7;
    *((_DWORD *)v5 + 14) = *((_DWORD *)v4 + 14);
  }

  return v6;
}

- (IPASloMoOperation)initWithTimeRange:(id *)a3 rate:(float)a4
{
  if (a4 <= 0.0 || a4 > 1.0)
  {
    _PFAssertContinueHandler();
LABEL_11:

    return 0;
  }
  if ((a3->var0.var2 & 1) == 0 || (a3->var1.var2 & 1) == 0 || a3->var1.var3 || a3->var1.var0 < 0)
  {
    long long v8 = *(_OWORD *)&a3->var0.var3;
    *(_OWORD *)&range.start.value = *(_OWORD *)&a3->var0.var0;
    *(_OWORD *)&range.start.epoch = v8;
    *(_OWORD *)&range.duration.timescale = *(_OWORD *)&a3->var1.var1;
    int v12 = (__CFString *)CMTimeRangeCopyDescription((CFAllocatorRef)*MEMORY[0x1E4F1CF80], &range);
    _PFAssertContinueHandler();

    goto LABEL_11;
  }
  v13.receiver = self;
  v13.super_class = (Class)IPASloMoOperation;
  id result = [(IPAEditOperation *)&v13 init];
  if (result)
  {
    long long v11 = *(_OWORD *)&a3->var0.var3;
    long long v10 = *(_OWORD *)&a3->var1.var1;
    *(_OWORD *)&result->_timeRange.start.value = *(_OWORD *)&a3->var0.var0;
    *(_OWORD *)&result->_timeRange.start.epoch = v11;
    *(_OWORD *)&result->_timeRange.duration.timescale = v10;
    result->_rate = a4;
  }
  return result;
}

- (BOOL)isMigratable
{
  return 1;
}

+ (id)operationFromFileURL:(id)a3
{
  long long v3 = (objc_class *)MEMORY[0x1E4F8CE18];
  id v4 = a3;
  id v5 = (void *)[[v3 alloc] initWithURL:v4];

  if (v5)
  {
    float v6 = [IPASloMoOperation alloc];
    [v5 slowMotionTimeRange];
    [v5 slowMotionRate];
    long long v7 = -[IPASloMoOperation initWithTimeRange:rate:](v6, "initWithTimeRange:rate:", &v9);
  }
  else
  {
    long long v7 = 0;
  }

  return v7;
}

- (id)internalRepresentation
{
  id v3 = objc_alloc(MEMORY[0x1E4F8CE18]);
  *(float *)&double v4 = self->_rate;
  long long v5 = *(_OWORD *)&self->_timeRange.start.epoch;
  v8[0] = *(_OWORD *)&self->_timeRange.start.value;
  v8[1] = v5;
  v8[2] = *(_OWORD *)&self->_timeRange.duration.timescale;
  float v6 = (void *)[v3 initWithSlowMotionTimeRange:v8 rate:v4];
  return v6;
}

@end
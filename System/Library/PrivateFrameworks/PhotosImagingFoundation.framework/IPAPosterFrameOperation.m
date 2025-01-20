@interface IPAPosterFrameOperation
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)frameTime;
- (BOOL)isEqualToOperation:(id)a3;
- (BOOL)isMigratable;
- (IPAPosterFrameOperation)initWithFrameTime:(id *)a3;
- (IPAPosterFrameOperation)initWithOperation:(id)a3;
- (IPAPosterFrameOperation)initWithSettingsDictionary:(id)a3;
- (id)debugDescription;
- (id)identifier;
- (id)settingsDictionary;
@end

@implementation IPAPosterFrameOperation

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)frameTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)&self->var1;
  return self;
}

- (BOOL)isEqualToOperation:(id)a3
{
  v4 = (char *)a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    CMTime time1 = (CMTime)self->_frameTime;
    long long v5 = *(_OWORD *)(v4 + 8);
    v8.epoch = *((void *)v4 + 3);
    *(_OWORD *)&v8.value = v5;
    BOOL v6 = CMTimeCompare(&time1, &v8) == 0;
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (id)debugDescription
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  CMTime time = (CMTime)self->_frameTime;
  long long v5 = (__CFString *)CMTimeCopyDescription((CFAllocatorRef)*MEMORY[0x1E4F1CF80], &time);
  BOOL v6 = [v3 stringWithFormat:@"<%@:%p frameTime=%@>", v4, self, v5];

  return v6;
}

- (id)identifier
{
  v2 = @"PosterFrame";
  return @"PosterFrame";
}

- (id)settingsDictionary
{
  v9[1] = *MEMORY[0x1E4F143B8];
  CFAllocatorRef v2 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  $95D729B680665BEAEFA1D6FCA8238556 frameTime = self->_frameTime;
  CFDictionaryRef v3 = CMTimeCopyAsDictionary((CMTime *)&frameTime, v2);
  CFDictionaryRef v4 = v3;
  if (v3)
  {
    CMTime v8 = @"frameTime";
    v9[0] = v3;
    long long v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:&v8 count:1];
  }
  else
  {
    long long v5 = 0;
  }

  return v5;
}

- (IPAPosterFrameOperation)initWithSettingsDictionary:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)IPAPosterFrameOperation;
  long long v5 = [(IPAEditOperation *)&v10 init];
  if (v5)
  {
    BOOL v6 = [v4 objectForKeyedSubscript:@"frameTime"];

    CMTimeMakeFromDictionary(&v9, (CFDictionaryRef)v6);
    long long v7 = *(_OWORD *)&v9.value;
    *((void *)v5 + 3) = v9.epoch;
    *(_OWORD *)(v5 + 8) = v7;
  }

  return (IPAPosterFrameOperation *)v5;
}

- (IPAPosterFrameOperation)initWithOperation:(id)a3
{
  id v4 = (char *)a3;
  v9.receiver = self;
  v9.super_class = (Class)IPAPosterFrameOperation;
  long long v5 = [(IPAEditOperation *)&v9 initWithOperation:v4];
  BOOL v6 = (IPAPosterFrameOperation *)v5;
  if (v5)
  {
    uint64_t v7 = *((void *)v4 + 3);
    *(_OWORD *)(v5 + 8) = *(_OWORD *)(v4 + 8);
    *((void *)v5 + 3) = v7;
  }

  return v6;
}

- (IPAPosterFrameOperation)initWithFrameTime:(id *)a3
{
  CFDictionaryRef v3 = self;
  if (a3->var2)
  {
    v9.receiver = self;
    v9.super_class = (Class)IPAPosterFrameOperation;
    BOOL v6 = [(IPAEditOperation *)&v9 init];
    if (v6)
    {
      int64_t var3 = a3->var3;
      *(_OWORD *)(v6 + 8) = *(_OWORD *)&a3->var0;
      *((void *)v6 + 3) = var3;
    }
    CFDictionaryRef v3 = v6;
    id v4 = v3;
  }
  else
  {
    _PFAssertContinueHandler();
    id v4 = 0;
  }

  return v4;
}

- (BOOL)isMigratable
{
  return 1;
}

@end
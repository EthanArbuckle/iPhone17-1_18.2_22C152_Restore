@interface PXCurrentTimeRecord
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)currentTime;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)sampleTime;
- (BOOL)isValid;
- (PXCurrentTimeRecord)initWithSampleTime:(id *)a3;
- (PXCurrentTimeRecord)initWithSampleTime:(id *)a3 rate:(float)a4;
- (float)rate;
- (id)description;
@end

@implementation PXCurrentTimeRecord

- (BOOL)isValid
{
  return self->_isValid;
}

- (float)rate
{
  return self->_rate;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)sampleTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = ($95D729B680665BEAEFA1D6FCA8238556)self[1];
  return self;
}

- (id)description
{
  id v3 = [NSString alloc];
  [(PXCurrentTimeRecord *)self sampleTime];
  v4 = (__CFString *)CMTimeCopyDescription(0, &time);
  v5 = [NSNumber numberWithDouble:self->_sampleTimestamp];
  [(PXCurrentTimeRecord *)self rate];
  double v7 = v6;
  [(PXCurrentTimeRecord *)self currentTime];
  v8 = (__CFString *)CMTimeCopyDescription(0, &v11);
  v9 = objc_msgSend(v3, "initWithFormat:", @"<%@ %p; Sample Time: %@, Sample Timestamp: %@; Rate: %.2f; Current Time: %@>",
                 self,
                 self,
                 v4,
                 v5,
                 *(void *)&v7,
                 v8);

  return v9;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)currentTime
{
  result = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)[(PXCurrentTimeRecord *)self isValid];
  if (result)
  {
    CFAbsoluteTime v6 = CFAbsoluteTimeGetCurrent() - self->_sampleTimestamp;
    [(PXCurrentTimeRecord *)self rate];
    Float64 v8 = v6 * v7;
    [(PXCurrentTimeRecord *)self sampleTime];
    CMTimeMakeWithSeconds(&v10, v8, PXAudioDefaultCMTimeScale);
    return ($3CC8671D27C23BF42ADDB32F2B5E48AE *)CMTimeAdd((CMTime *)retstr, &lhs, &v10);
  }
  else
  {
    uint64_t v9 = MEMORY[0x1E4F1F9F8];
    *(_OWORD *)&retstr->var0 = *MEMORY[0x1E4F1F9F8];
    retstr->var3 = *(void *)(v9 + 16);
  }
  return result;
}

- (PXCurrentTimeRecord)initWithSampleTime:(id *)a3 rate:(float)a4
{
  v9.receiver = self;
  v9.super_class = (Class)PXCurrentTimeRecord;
  CFAbsoluteTime v6 = [(PXCurrentTimeRecord *)&v9 init];
  if (v6)
  {
    *((CFAbsoluteTime *)v6 + 1) = CFAbsoluteTimeGetCurrent();
    int64_t var3 = a3->var3;
    *(_OWORD *)(v6 + 24) = *(_OWORD *)&a3->var0;
    *((void *)v6 + 5) = var3;
    *((float *)v6 + 5) = a4;
    v6[16] = a3->var2 & 1;
  }
  return (PXCurrentTimeRecord *)v6;
}

- (PXCurrentTimeRecord)initWithSampleTime:(id *)a3
{
  return [(PXCurrentTimeRecord *)self initWithSampleTime:&v4 rate:COERCE_DOUBLE(__PAIR64__(HIDWORD(a3->var0), 1.0))];
}

@end
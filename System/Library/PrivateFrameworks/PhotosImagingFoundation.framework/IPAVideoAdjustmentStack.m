@interface IPAVideoAdjustmentStack
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)naturalDuration;
- (id)_debugDescriptionSuffix;
- (id)copyWithZone:(_NSZone *)a3;
- (id)minimumVersionForFormat:(id)a3;
- (void)setNaturalDuration:(id *)a3;
@end

@implementation IPAVideoAdjustmentStack

- (void)setNaturalDuration:(id *)a3
{
  int64_t var3 = a3->var3;
  *(_OWORD *)&self->_naturalDuration.value = *(_OWORD *)&a3->var0;
  self->_naturalDuration.epoch = var3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)naturalDuration
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = ($95D729B680665BEAEFA1D6FCA8238556)self[1];
  return self;
}

- (id)_debugDescriptionSuffix
{
  v2 = NSString;
  CMTime time = (CMTime)self->_naturalDuration;
  v3 = (__CFString *)CMTimeCopyDescription((CFAllocatorRef)*MEMORY[0x1E4F1CF80], &time);
  v4 = [v2 stringWithFormat:@"naturalDuration=%@>", v3];

  return v4;
}

- (id)minimumVersionForFormat:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"com.apple.video.slomo"])
  {
    v5 = @"1.1";
LABEL_5:
    v6 = v5;
    goto LABEL_7;
  }
  if ([v4 isEqualToString:@"com.apple.video"])
  {
    v5 = @"1.0";
    goto LABEL_5;
  }
  v8.receiver = self;
  v8.super_class = (Class)IPAVideoAdjustmentStack;
  v5 = [(IPAAdjustmentStack *)&v8 minimumVersionForFormat:v4];
LABEL_7:

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)IPAVideoAdjustmentStack;
  id result = [(IPAAdjustmentStack *)&v6 copyWithZone:a3];
  int64_t epoch = self->_naturalDuration.epoch;
  *(_OWORD *)((char *)result + 24) = *(_OWORD *)&self->_naturalDuration.value;
  *((void *)result + 5) = epoch;
  return result;
}

@end
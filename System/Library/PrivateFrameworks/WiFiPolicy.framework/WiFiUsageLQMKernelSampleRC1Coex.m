@interface WiFiUsageLQMKernelSampleRC1Coex
+ (id)sampleWithStruct:(rc1Coex *)a3 andTimestamp:(id)a4;
- (NSDate)timestamp;
- (WiFiUsageLQMKernelSampleRC1Coex)initWithStruct:(rc1Coex *)a3 andTimestamp:(id)a4;
- (double)duration;
- (unint64_t)rc1DurationPerc;
- (void)setDuration:(double)a3;
- (void)setRc1DurationPerc:(unint64_t)a3;
- (void)setTimestamp:(id)a3;
@end

@implementation WiFiUsageLQMKernelSampleRC1Coex

+ (id)sampleWithStruct:(rc1Coex *)a3 andTimestamp:(id)a4
{
  id v5 = a4;
  uint64_t var0 = a3->var0;
  if (var0)
  {
    NSLog(&cfstr_SUnknownVersio.isa, "+[WiFiUsageLQMKernelSampleRC1Coex sampleWithStruct:andTimestamp:]", var0);
    v7 = 0;
  }
  else
  {
    v7 = [[WiFiUsageLQMKernelSampleRC1Coex alloc] initWithStruct:a3 andTimestamp:v5];
  }

  return v7;
}

- (WiFiUsageLQMKernelSampleRC1Coex)initWithStruct:(rc1Coex *)a3 andTimestamp:(id)a4
{
  v6 = (NSDate *)a4;
  v12.receiver = self;
  v12.super_class = (Class)WiFiUsageLQMKernelSampleRC1Coex;
  v7 = [(WiFiUsageLQMKernelSampleRC1Coex *)&v12 init];
  timestamp = v7->_timestamp;
  v7->_timestamp = v6;
  v9 = v6;

  unint64_t v10 = +[WiFiUsageLQMTransformations ratioWithValue:Over:WithScale:](WiFiUsageLQMTransformations, "ratioWithValue:Over:WithScale:", a3->var1, a3->var2, +[WiFiUsageLQMTransformations ratioScale]);
  v7->_rc1DurationPerc = v10;
  return v7;
}

- (NSDate)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(id)a3
{
}

- (double)duration
{
  return self->_duration;
}

- (void)setDuration:(double)a3
{
  self->_duration = a3;
}

- (unint64_t)rc1DurationPerc
{
  return self->_rc1DurationPerc;
}

- (void)setRc1DurationPerc:(unint64_t)a3
{
  self->_rc1DurationPerc = a3;
}

- (void).cxx_destruct
{
}

@end
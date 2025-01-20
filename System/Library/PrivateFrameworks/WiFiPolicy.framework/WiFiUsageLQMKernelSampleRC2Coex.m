@interface WiFiUsageLQMKernelSampleRC2Coex
+ (id)sampleWithStruct:(rc2Coex *)a3 andTimestamp:(id)a4;
- (NSDate)timestamp;
- (WiFiUsageLQMKernelSampleRC2Coex)initWithStruct:(rc2Coex *)a3 andTimestamp:(id)a4;
- (double)duration;
- (unint64_t)rc2DurationPerc;
- (void)setDuration:(double)a3;
- (void)setRc2DurationPerc:(unint64_t)a3;
- (void)setTimestamp:(id)a3;
@end

@implementation WiFiUsageLQMKernelSampleRC2Coex

+ (id)sampleWithStruct:(rc2Coex *)a3 andTimestamp:(id)a4
{
  id v5 = a4;
  uint64_t var0 = a3->var0;
  if (var0)
  {
    NSLog(&cfstr_SUnknownVersio.isa, "+[WiFiUsageLQMKernelSampleRC2Coex sampleWithStruct:andTimestamp:]", var0);
    v7 = 0;
  }
  else
  {
    v7 = [[WiFiUsageLQMKernelSampleRC2Coex alloc] initWithStruct:a3 andTimestamp:v5];
  }

  return v7;
}

- (WiFiUsageLQMKernelSampleRC2Coex)initWithStruct:(rc2Coex *)a3 andTimestamp:(id)a4
{
  v6 = (NSDate *)a4;
  v12.receiver = self;
  v12.super_class = (Class)WiFiUsageLQMKernelSampleRC2Coex;
  v7 = [(WiFiUsageLQMKernelSampleRC2Coex *)&v12 init];
  timestamp = v7->_timestamp;
  v7->_timestamp = v6;
  v9 = v6;

  unint64_t v10 = +[WiFiUsageLQMTransformations ratioWithValue:Over:WithScale:](WiFiUsageLQMTransformations, "ratioWithValue:Over:WithScale:", a3->var1, a3->var2, +[WiFiUsageLQMTransformations ratioScale]);
  v7->_rc2DurationPerc = v10;
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

- (unint64_t)rc2DurationPerc
{
  return self->_rc2DurationPerc;
}

- (void)setRc2DurationPerc:(unint64_t)a3
{
  self->_rc2DurationPerc = a3;
}

- (void).cxx_destruct
{
}

@end
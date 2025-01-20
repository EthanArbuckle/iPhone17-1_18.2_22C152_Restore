@interface WiFiUsageLQMKernelSampleCCA
+ (id)sampleWithStruct:(ccaStats *)a3 andTimestamp:(id)a4;
- (NSDate)timestamp;
- (WiFiUsageLQMKernelSampleCCA)initWithStruct:(ccaStats *)a3 andTimestamp:(id)a4;
- (double)duration;
- (unint64_t)interference;
- (unint64_t)interferenceSleepPerc;
- (unint64_t)interferenceWakePerc;
- (unint64_t)otherCca;
- (unint64_t)otherCcaSleepPerc;
- (unint64_t)otherCcaWakePerc;
- (unint64_t)selfCca;
- (unint64_t)selfCcaSleepPerc;
- (unint64_t)selfCcaWakePerc;
- (void)setDuration:(double)a3;
- (void)setTimestamp:(id)a3;
@end

@implementation WiFiUsageLQMKernelSampleCCA

+ (id)sampleWithStruct:(ccaStats *)a3 andTimestamp:(id)a4
{
  id v5 = a4;
  uint64_t var0 = a3->var0;
  if (var0)
  {
    NSLog(&cfstr_SUnknownVersio.isa, "+[WiFiUsageLQMKernelSampleCCA sampleWithStruct:andTimestamp:]", var0);
    v7 = 0;
  }
  else
  {
    v7 = [[WiFiUsageLQMKernelSampleCCA alloc] initWithStruct:a3 andTimestamp:v5];
  }

  return v7;
}

- (WiFiUsageLQMKernelSampleCCA)initWithStruct:(ccaStats *)a3 andTimestamp:(id)a4
{
  id v7 = a4;
  unint64_t v18 = 0;
  unint64_t v19 = 0;
  unint64_t v20 = 0;
  +[WiFiUsageLQMTransformations ccaStatsWithDuration:a3->var1 ccaSelf:a3->var2 ccaOther:a3->var3 interference:a3->var4];
  unint64_t v15 = 0;
  unint64_t v16 = 0;
  unint64_t v17 = 0;
  +[WiFiUsageLQMTransformations ccaStatsWithDuration:a3->var5 ccaSelf:a3->var6 ccaOther:a3->var7 interference:a3->var8];
  unint64_t v12 = 0;
  unint64_t v13 = 0;
  unint64_t v14 = 0;
  +[WiFiUsageLQMTransformations ccaStatsWithDuration:a3->var9 ccaSelf:a3->var10 ccaOther:a3->var11 interference:a3->var12];
  v11.receiver = self;
  v11.super_class = (Class)WiFiUsageLQMKernelSampleCCA;
  v8 = [(WiFiUsageLQMKernelSampleCCA *)&v11 init];
  objc_storeStrong((id *)&v8->_timestamp, a4);
  v8->_selfCca = v18;
  v8->_otherCca = v19;
  v8->_interference = v20;
  v8->_selfCcaSleepPerc = v15;
  v8->_otherCcaSleepPerc = v16;
  v8->_interferenceSleepPerc = v17;
  v8->_selfCcaWakePerc = v12;
  v8->_otherCcaWakePerc = v13;
  v8->_interferenceWakePerc = v14;
  v9 = v8;

  return v9;
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

- (unint64_t)selfCca
{
  return self->_selfCca;
}

- (unint64_t)otherCca
{
  return self->_otherCca;
}

- (unint64_t)interference
{
  return self->_interference;
}

- (unint64_t)selfCcaSleepPerc
{
  return self->_selfCcaSleepPerc;
}

- (unint64_t)otherCcaSleepPerc
{
  return self->_otherCcaSleepPerc;
}

- (unint64_t)interferenceSleepPerc
{
  return self->_interferenceSleepPerc;
}

- (unint64_t)selfCcaWakePerc
{
  return self->_selfCcaWakePerc;
}

- (unint64_t)otherCcaWakePerc
{
  return self->_otherCcaWakePerc;
}

- (unint64_t)interferenceWakePerc
{
  return self->_interferenceWakePerc;
}

- (void).cxx_destruct
{
}

@end
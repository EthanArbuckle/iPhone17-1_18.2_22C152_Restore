@interface WiFiUsageLQMKernelSampleOfdmDesense
+ (id)allLQMProperties;
+ (id)featureFromFieldName:(id)a3;
+ (id)sampleWithStruct:(id *)a3 andTimestamp:(id)a4;
- (NSDate)timestamp;
- (NSString)desenseReason;
- (WiFiUsageLQMKernelSampleOfdmDesense)initWithStruct:(id *)a3 andTimestamp:(id)a4;
- (double)duration;
- (unint64_t)bPhyDesense;
- (unint64_t)ofdmDesense;
- (void)setBPhyDesense:(unint64_t)a3;
- (void)setDesenseReason:(id)a3;
- (void)setDuration:(double)a3;
- (void)setOfdmDesense:(unint64_t)a3;
- (void)setTimestamp:(id)a3;
@end

@implementation WiFiUsageLQMKernelSampleOfdmDesense

+ (id)sampleWithStruct:(id *)a3 andTimestamp:(id)a4
{
  id v5 = a4;
  uint64_t var0 = a3->var0;
  if (var0)
  {
    NSLog(&cfstr_SUnknownVersio.isa, "+[WiFiUsageLQMKernelSampleOfdmDesense sampleWithStruct:andTimestamp:]", var0);
    v7 = 0;
  }
  else
  {
    v7 = [[WiFiUsageLQMKernelSampleOfdmDesense alloc] initWithStruct:a3 andTimestamp:v5];
  }

  return v7;
}

- (WiFiUsageLQMKernelSampleOfdmDesense)initWithStruct:(id *)a3 andTimestamp:(id)a4
{
  v6 = (NSDate *)a4;
  v14.receiver = self;
  v14.super_class = (Class)WiFiUsageLQMKernelSampleOfdmDesense;
  v7 = [(WiFiUsageLQMKernelSampleOfdmDesense *)&v14 init];
  timestamp = v7->_timestamp;
  v7->_timestamp = v6;
  v9 = v6;

  unint64_t var2 = a3->var2;
  v7->_ofdmDesense = a3->var1;
  v7->_bPhyDesense = var2;
  uint64_t v11 = +[WiFiUsageLQMTransformations ofdmDesenseReason:a3->var3];
  desenseReason = v7->_desenseReason;
  v7->_desenseReason = (NSString *)v11;

  return v7;
}

+ (id)featureFromFieldName:(id)a3
{
  return @"mode";
}

+ (id)allLQMProperties
{
  v2 = (void *)MEMORY[0x1E4F1CA80];
  v7.receiver = a1;
  v7.super_class = (Class)&OBJC_METACLASS___WiFiUsageLQMKernelSampleOfdmDesense;
  v3 = objc_msgSendSuper2(&v7, sel_allLQMProperties);
  v4 = [v2 setWithSet:v3];

  [v4 addObject:@"desenseReason"];
  id v5 = (void *)[v4 copy];

  return v5;
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

- (unint64_t)ofdmDesense
{
  return self->_ofdmDesense;
}

- (void)setOfdmDesense:(unint64_t)a3
{
  self->_ofdmDesense = a3;
}

- (unint64_t)bPhyDesense
{
  return self->_bPhyDesense;
}

- (void)setBPhyDesense:(unint64_t)a3
{
  self->_bPhyDesense = a3;
}

- (NSString)desenseReason
{
  return self->_desenseReason;
}

- (void)setDesenseReason:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_desenseReason, 0);

  objc_storeStrong((id *)&self->_timestamp, 0);
}

@end
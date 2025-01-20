@interface WiFiUsageLQMKernelSampleSecurityErrors
+ (id)featureFromFieldName:(id)a3;
+ (id)sampleWithStruct:(rxSecurityInfo *)a3 andTimestamp:(id)a4;
- (NSDate)timestamp;
- (WiFiUsageLQMKernelSampleSecurityErrors)initWithStruct:(rxSecurityInfo *)a3 andTimestamp:(id)a4;
- (double)duration;
- (unint64_t)rxUcastReplayError;
- (unint64_t)rxmcastDecryptError;
- (unint64_t)rxmcastReplayError;
- (unint64_t)rxucastDecryptError;
- (void)setDuration:(double)a3;
- (void)setRxUcastReplayError:(unint64_t)a3;
- (void)setRxmcastDecryptError:(unint64_t)a3;
- (void)setRxmcastReplayError:(unint64_t)a3;
- (void)setRxucastDecryptError:(unint64_t)a3;
- (void)setTimestamp:(id)a3;
@end

@implementation WiFiUsageLQMKernelSampleSecurityErrors

+ (id)sampleWithStruct:(rxSecurityInfo *)a3 andTimestamp:(id)a4
{
  id v5 = a4;
  uint64_t var0 = a3->var0;
  if (var0)
  {
    NSLog(&cfstr_SUnknownVersio.isa, "+[WiFiUsageLQMKernelSampleSecurityErrors sampleWithStruct:andTimestamp:]", var0);
    v7 = 0;
  }
  else
  {
    v7 = [[WiFiUsageLQMKernelSampleSecurityErrors alloc] initWithStruct:a3 andTimestamp:v5];
  }

  return v7;
}

- (WiFiUsageLQMKernelSampleSecurityErrors)initWithStruct:(rxSecurityInfo *)a3 andTimestamp:(id)a4
{
  v6 = (NSDate *)a4;
  v12.receiver = self;
  v12.super_class = (Class)WiFiUsageLQMKernelSampleSecurityErrors;
  v7 = [(WiFiUsageLQMKernelSampleSecurityErrors *)&v12 init];
  timestamp = v7->_timestamp;
  v7->_timestamp = v6;

  unint64_t var2 = a3->var2;
  v7->_rxUcastReplayError = a3->var1;
  v7->_rxucastDecryptError = var2;
  unint64_t var4 = a3->var4;
  v7->_rxmcastReplayError = a3->var3;
  v7->_rxmcastDecryptError = var4;
  return v7;
}

+ (id)featureFromFieldName:(id)a3
{
  return @"sum";
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

- (unint64_t)rxUcastReplayError
{
  return self->_rxUcastReplayError;
}

- (void)setRxUcastReplayError:(unint64_t)a3
{
  self->_rxUcastReplayError = a3;
}

- (unint64_t)rxucastDecryptError
{
  return self->_rxucastDecryptError;
}

- (void)setRxucastDecryptError:(unint64_t)a3
{
  self->_rxucastDecryptError = a3;
}

- (unint64_t)rxmcastReplayError
{
  return self->_rxmcastReplayError;
}

- (void)setRxmcastReplayError:(unint64_t)a3
{
  self->_rxmcastReplayError = a3;
}

- (unint64_t)rxmcastDecryptError
{
  return self->_rxmcastDecryptError;
}

- (void)setRxmcastDecryptError:(unint64_t)a3
{
  self->_rxmcastDecryptError = a3;
}

- (void).cxx_destruct
{
}

@end
@interface SPStackshotProviderSnapshot
- (SATimestamp)timestamp;
- (SPStackshotProvider)stackshotProvider;
- (SPStackshotProviderSnapshot)initWithStackshotProvider:(id)a3 timestamp:(id)a4 numSamples:(int)a5 numSamplesAvoidedDueToAudio:(int)a6;
- (int)numSamples;
- (int)numSamplesAvoidedDueToAudio;
- (void)dealloc;
@end

@implementation SPStackshotProviderSnapshot

- (SPStackshotProviderSnapshot)initWithStackshotProvider:(id)a3 timestamp:(id)a4 numSamples:(int)a5 numSamplesAvoidedDueToAudio:(int)a6
{
  v12.receiver = self;
  v12.super_class = (Class)SPStackshotProviderSnapshot;
  v10 = [(SPStackshotProviderSnapshot *)&v12 init];
  if (v10)
  {
    v10->_stackshotProvider = (SPStackshotProvider *)a3;
    v10->_timestamp = (SATimestamp *)a4;
    v10->_numSamples = a5;
    v10->_numSamplesAvoidedDueToAudio = a6;
  }
  return v10;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)SPStackshotProviderSnapshot;
  [(SPStackshotProviderSnapshot *)&v3 dealloc];
}

- (SPStackshotProvider)stackshotProvider
{
  return self->_stackshotProvider;
}

- (SATimestamp)timestamp
{
  return self->_timestamp;
}

- (int)numSamples
{
  return self->_numSamples;
}

- (int)numSamplesAvoidedDueToAudio
{
  return self->_numSamplesAvoidedDueToAudio;
}

@end
@interface VUITimedMetadataAudioSmoothingConfig
- (VUITimedMetadataAudioSmoothingConfig)init;
- (double)durationToRetainAudioEntity;
- (void)setDurationToRetainAudioEntity:(double)a3;
@end

@implementation VUITimedMetadataAudioSmoothingConfig

- (VUITimedMetadataAudioSmoothingConfig)init
{
  v3.receiver = self;
  v3.super_class = (Class)VUITimedMetadataAudioSmoothingConfig;
  result = [(VUITimedMetadataAudioSmoothingConfig *)&v3 init];
  if (result) {
    result->_durationToRetainAudioEntity = 60.0;
  }
  return result;
}

- (double)durationToRetainAudioEntity
{
  return self->_durationToRetainAudioEntity;
}

- (void)setDurationToRetainAudioEntity:(double)a3
{
  self->_durationToRetainAudioEntity = a3;
}

@end
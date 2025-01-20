@interface VUIAutoPlayConfig
- (BOOL)autoPlayVideoSound;
- (BOOL)disableBackgroundMediaPlayback;
- (VUIAutoPlayConfig)init;
- (double)autoPlayDelayInterval;
- (void)setAutoPlayDelayInterval:(double)a3;
- (void)setAutoPlayVideoSound:(BOOL)a3;
@end

@implementation VUIAutoPlayConfig

- (void)setAutoPlayVideoSound:(BOOL)a3
{
  self->_autoPlayVideoSound = a3;
}

- (void)setAutoPlayDelayInterval:(double)a3
{
  self->_autoPlayDelayInterval = a3;
}

- (VUIAutoPlayConfig)init
{
  v5.receiver = self;
  v5.super_class = (Class)VUIAutoPlayConfig;
  v2 = [(VUIAutoPlayConfig *)&v5 init];
  v3 = v2;
  if (v2)
  {
    v2->_autoPlayDelayInterval = 0.0;
    v2->_autoPlayVideoSound = 0;
    v2->_disableBackgroundMediaPlayback = +[VUIFeaturesConfiguration BOOLValueForKey:@"disableBackgroundMediaPlayback" fromDictionary:0 defaultValue:0];
  }
  return v3;
}

- (double)autoPlayDelayInterval
{
  return self->_autoPlayDelayInterval;
}

- (BOOL)autoPlayVideoSound
{
  return self->_autoPlayVideoSound;
}

- (BOOL)disableBackgroundMediaPlayback
{
  return self->_disableBackgroundMediaPlayback;
}

@end
@interface RCPlaybackSettings
- (BOOL)enhanced;
- (BOOL)hasCustomizedPlaybackSettings;
- (BOOL)hasMultipleTracks;
- (BOOL)silenceRemoved;
- (NSString)uuid;
- (RCPlaybackSettings)initWithUUID:(id)a3 enhanced:(BOOL)a4 silenceRemoved:(BOOL)a5 playbackSpeed:(float)a6 layerMix:(float)a7 hasMultipleTracks:(BOOL)a8;
- (float)layerMix;
- (float)playbackSpeed;
- (void)setEnhanced:(BOOL)a3;
- (void)setHasMultipleTracks:(BOOL)a3;
- (void)setLayerMix:(float)a3;
- (void)setPlaybackSpeed:(float)a3;
- (void)setSilenceRemoved:(BOOL)a3;
- (void)setUuid:(id)a3;
@end

@implementation RCPlaybackSettings

- (RCPlaybackSettings)initWithUUID:(id)a3 enhanced:(BOOL)a4 silenceRemoved:(BOOL)a5 playbackSpeed:(float)a6 layerMix:(float)a7 hasMultipleTracks:(BOOL)a8
{
  id v15 = a3;
  v19.receiver = self;
  v19.super_class = (Class)RCPlaybackSettings;
  v16 = [(RCPlaybackSettings *)&v19 init];
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_uuid, a3);
    v17->_enhanced = a4;
    v17->_silenceRemoved = a5;
    v17->_playbackSpeed = a6;
    v17->_layerMix = a7;
    v17->_hasMultipleTracks = a8;
  }

  return v17;
}

- (BOOL)hasCustomizedPlaybackSettings
{
  if ([(RCPlaybackSettings *)self enhanced]) {
    return 1;
  }
  if ([(RCPlaybackSettings *)self silenceRemoved]) {
    return 1;
  }
  [(RCPlaybackSettings *)self playbackSpeed];
  if (v3 != 1.0) {
    return 1;
  }
  [(RCPlaybackSettings *)self layerMix];
  return v5 != 0.0;
}

- (NSString)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
}

- (BOOL)enhanced
{
  return self->_enhanced;
}

- (void)setEnhanced:(BOOL)a3
{
  self->_enhanced = a3;
}

- (BOOL)silenceRemoved
{
  return self->_silenceRemoved;
}

- (void)setSilenceRemoved:(BOOL)a3
{
  self->_silenceRemoved = a3;
}

- (float)playbackSpeed
{
  return self->_playbackSpeed;
}

- (void)setPlaybackSpeed:(float)a3
{
  self->_playbackSpeed = a3;
}

- (float)layerMix
{
  return self->_layerMix;
}

- (void)setLayerMix:(float)a3
{
  self->_layerMix = a3;
}

- (BOOL)hasMultipleTracks
{
  return self->_hasMultipleTracks;
}

- (void)setHasMultipleTracks:(BOOL)a3
{
  self->_hasMultipleTracks = a3;
}

- (void).cxx_destruct
{
}

@end
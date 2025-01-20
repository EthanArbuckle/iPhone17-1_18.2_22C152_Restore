@interface _NACVolumeObserverRecord
- (BOOL)isMuted;
- (BOOL)isVolumeControlAvailable;
- (BOOL)isVolumeWarningEnabled;
- (MPAVRoutingController)routingController;
- (MPVolumeController)volumeController;
- (NACEventThrottler)throttler;
- (NACVolumeController)nacVolumeController;
- (float)EUVolumeLimit;
- (int64_t)volumeWarningState;
- (void)setEUVolumeLimit:(float)a3;
- (void)setMuted:(BOOL)a3;
- (void)setNacVolumeController:(id)a3;
- (void)setRoutingController:(id)a3;
- (void)setThrottler:(id)a3;
- (void)setVolumeControlAvailable:(BOOL)a3;
- (void)setVolumeController:(id)a3;
- (void)setVolumeWarningEnabled:(BOOL)a3;
- (void)setVolumeWarningState:(int64_t)a3;
@end

@implementation _NACVolumeObserverRecord

- (BOOL)isVolumeControlAvailable
{
  return self->_volumeControlAvailable;
}

- (void)setVolumeControlAvailable:(BOOL)a3
{
  self->_volumeControlAvailable = a3;
}

- (BOOL)isVolumeWarningEnabled
{
  return self->_volumeWarningEnabled;
}

- (void)setVolumeWarningEnabled:(BOOL)a3
{
  self->_volumeWarningEnabled = a3;
}

- (int64_t)volumeWarningState
{
  return self->_volumeWarningState;
}

- (void)setVolumeWarningState:(int64_t)a3
{
  self->_volumeWarningState = a3;
}

- (BOOL)isMuted
{
  return self->_muted;
}

- (void)setMuted:(BOOL)a3
{
  self->_muted = a3;
}

- (float)EUVolumeLimit
{
  return self->_EUVolumeLimit;
}

- (void)setEUVolumeLimit:(float)a3
{
  self->_EUVolumeLimit = a3;
}

- (NACEventThrottler)throttler
{
  return self->_throttler;
}

- (void)setThrottler:(id)a3
{
}

- (MPVolumeController)volumeController
{
  return self->_volumeController;
}

- (void)setVolumeController:(id)a3
{
}

- (MPAVRoutingController)routingController
{
  return self->_routingController;
}

- (void)setRoutingController:(id)a3
{
}

- (NACVolumeController)nacVolumeController
{
  return self->_nacVolumeController;
}

- (void)setNacVolumeController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nacVolumeController, 0);
  objc_storeStrong((id *)&self->_routingController, 0);
  objc_storeStrong((id *)&self->_volumeController, 0);

  objc_storeStrong((id *)&self->_throttler, 0);
}

@end
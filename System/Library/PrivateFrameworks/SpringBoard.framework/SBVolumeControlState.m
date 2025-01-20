@interface SBVolumeControlState
- (BOOL)currentRouteHasVolumeControl;
- (BOOL)isAudioPlayingSomewhere;
- (BOOL)isCallOrFaceTimeActive;
- (BOOL)isFullyMuted;
- (BOOL)isHostingAppOnLockScreen;
- (BOOL)isLocked;
- (BOOL)isRingerMuted;
- (BOOL)isShowingLockScreenMediaControls;
- (NSString)activeVolumeCategoryName;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setActiveVolumeCategoryName:(id)a3;
- (void)setAudioPlayingSomewhere:(BOOL)a3;
- (void)setCallOrFaceTimeActive:(BOOL)a3;
- (void)setCurrentRouteHasVolumeControl:(BOOL)a3;
- (void)setFullyMuted:(BOOL)a3;
- (void)setHostingAppOnLockScreen:(BOOL)a3;
- (void)setLocked:(BOOL)a3;
- (void)setRingerMuted:(BOOL)a3;
- (void)setShowingLockScreenMediaControls:(BOOL)a3;
@end

@implementation SBVolumeControlState

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(SBVolumeControlState);
  v5 = [(SBVolumeControlState *)self activeVolumeCategoryName];
  [(SBVolumeControlState *)v4 setActiveVolumeCategoryName:v5];

  [(SBVolumeControlState *)v4 setAudioPlayingSomewhere:[(SBVolumeControlState *)self isAudioPlayingSomewhere]];
  [(SBVolumeControlState *)v4 setCallOrFaceTimeActive:[(SBVolumeControlState *)self isCallOrFaceTimeActive]];
  [(SBVolumeControlState *)v4 setCurrentRouteHasVolumeControl:[(SBVolumeControlState *)self currentRouteHasVolumeControl]];
  [(SBVolumeControlState *)v4 setFullyMuted:[(SBVolumeControlState *)self isFullyMuted]];
  [(SBVolumeControlState *)v4 setLocked:[(SBVolumeControlState *)self isLocked]];
  [(SBVolumeControlState *)v4 setHostingAppOnLockScreen:[(SBVolumeControlState *)self isHostingAppOnLockScreen]];
  [(SBVolumeControlState *)v4 setShowingLockScreenMediaControls:[(SBVolumeControlState *)self isShowingLockScreenMediaControls]];
  return v4;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  v4 = [(SBVolumeControlState *)self activeVolumeCategoryName];
  [v3 appendString:v4 withName:@"activeVolumeCategoryName"];

  id v5 = (id)objc_msgSend(v3, "appendBool:withName:", -[SBVolumeControlState isAudioPlayingSomewhere](self, "isAudioPlayingSomewhere"), @"isAudioPlayingSomewhere");
  id v6 = (id)objc_msgSend(v3, "appendBool:withName:", -[SBVolumeControlState isCallOrFaceTimeActive](self, "isCallOrFaceTimeActive"), @"isCallOrFaceTimeActive");
  id v7 = (id)objc_msgSend(v3, "appendBool:withName:", -[SBVolumeControlState currentRouteHasVolumeControl](self, "currentRouteHasVolumeControl"), @"currentRouteHasVolumeControl");
  id v8 = (id)objc_msgSend(v3, "appendBool:withName:", -[SBVolumeControlState isFullyMuted](self, "isFullyMuted"), @"isFullyMuted");
  id v9 = (id)objc_msgSend(v3, "appendBool:withName:", -[SBVolumeControlState isLocked](self, "isLocked"), @"isLocked");
  id v10 = (id)objc_msgSend(v3, "appendBool:withName:", -[SBVolumeControlState isHostingAppOnLockScreen](self, "isHostingAppOnLockScreen"), @"isHostingAppOnLockScreen");
  id v11 = (id)objc_msgSend(v3, "appendBool:withName:", -[SBVolumeControlState isShowingLockScreenMediaControls](self, "isShowingLockScreenMediaControls"), @"isShowingLockScreenMediaControls");
  v12 = [v3 build];

  return v12;
}

- (NSString)activeVolumeCategoryName
{
  return self->_activeVolumeCategoryName;
}

- (void)setActiveVolumeCategoryName:(id)a3
{
}

- (BOOL)isAudioPlayingSomewhere
{
  return self->_isAudioPlayingSomewhere;
}

- (void)setAudioPlayingSomewhere:(BOOL)a3
{
  self->_isAudioPlayingSomewhere = a3;
}

- (BOOL)isCallOrFaceTimeActive
{
  return self->_isCallOrFaceTimeActive;
}

- (void)setCallOrFaceTimeActive:(BOOL)a3
{
  self->_isCallOrFaceTimeActive = a3;
}

- (BOOL)currentRouteHasVolumeControl
{
  return self->_currentRouteHasVolumeControl;
}

- (void)setCurrentRouteHasVolumeControl:(BOOL)a3
{
  self->_currentRouteHasVolumeControl = a3;
}

- (BOOL)isFullyMuted
{
  return self->_isFullyMuted;
}

- (void)setFullyMuted:(BOOL)a3
{
  self->_isFullyMuted = a3;
}

- (BOOL)isRingerMuted
{
  return self->_isRingerMuted;
}

- (void)setRingerMuted:(BOOL)a3
{
  self->_isRingerMuted = a3;
}

- (BOOL)isLocked
{
  return self->_isLocked;
}

- (void)setLocked:(BOOL)a3
{
  self->_isLocked = a3;
}

- (BOOL)isHostingAppOnLockScreen
{
  return self->_isHostingAppOnLockScreen;
}

- (void)setHostingAppOnLockScreen:(BOOL)a3
{
  self->_isHostingAppOnLockScreen = a3;
}

- (BOOL)isShowingLockScreenMediaControls
{
  return self->_isShowingLockScreenMediaControls;
}

- (void)setShowingLockScreenMediaControls:(BOOL)a3
{
  self->_isShowingLockScreenMediaControls = a3;
}

- (void).cxx_destruct
{
}

@end
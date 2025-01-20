@interface _NACVolumeRecord
+ (BOOL)supportsSecureCoding;
- (BOOL)isMuted;
- (BOOL)isVolumeControlAvailable;
- (BOOL)isVolumeWarningEnabled;
- (NSMutableSet)observers;
- (_NACVolumeRecord)initWithCoder:(id)a3;
- (float)EUVolumeLimit;
- (float)volumeValue;
- (int64_t)volumeWarningState;
- (void)encodeWithCoder:(id)a3;
- (void)setEUVolumeLimit:(float)a3;
- (void)setMuted:(BOOL)a3;
- (void)setVolumeControlAvailable:(BOOL)a3;
- (void)setVolumeValue:(float)a3;
- (void)setVolumeWarningEnabled:(BOOL)a3;
- (void)setVolumeWarningState:(int64_t)a3;
@end

@implementation _NACVolumeRecord

- (_NACVolumeRecord)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_NACVolumeRecord;
  v5 = [(_NACVolumeRecord *)&v11 init];
  if (v5)
  {
    v6 = NSStringFromSelector(sel_volumeValue);
    [v4 decodeFloatForKey:v6];
    v5->_volumeValue = v7;

    v8 = NSStringFromSelector(sel_isVolumeControlAvailable);
    v5->_volumeControlAvailable = [v4 decodeBoolForKey:v8];

    v9 = NSStringFromSelector(sel_isMuted);
    v5->_muted = [v4 decodeBoolForKey:v9];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  float volumeValue = self->_volumeValue;
  id v5 = a3;
  v6 = NSStringFromSelector(sel_volumeValue);
  *(float *)&double v7 = volumeValue;
  [v5 encodeFloat:v6 forKey:v7];

  BOOL volumeControlAvailable = self->_volumeControlAvailable;
  v9 = NSStringFromSelector(sel_isVolumeControlAvailable);
  [v5 encodeBool:volumeControlAvailable forKey:v9];

  BOOL muted = self->_muted;
  NSStringFromSelector(sel_isMuted);
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  [v5 encodeBool:muted forKey:v11];
}

- (NSMutableSet)observers
{
  observers = self->_observers;
  if (!observers)
  {
    id v4 = [MEMORY[0x263EFF9C0] set];
    id v5 = self->_observers;
    self->_observers = v4;

    observers = self->_observers;
  }

  return observers;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (float)volumeValue
{
  return self->_volumeValue;
}

- (void)setVolumeValue:(float)a3
{
  self->_float volumeValue = a3;
}

- (BOOL)isVolumeControlAvailable
{
  return self->_volumeControlAvailable;
}

- (void)setVolumeControlAvailable:(BOOL)a3
{
  self->_BOOL volumeControlAvailable = a3;
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
  self->_BOOL muted = a3;
}

- (float)EUVolumeLimit
{
  return self->_EUVolumeLimit;
}

- (void)setEUVolumeLimit:(float)a3
{
  self->_EUVolumeLimit = a3;
}

- (void).cxx_destruct
{
}

@end
@interface TLAlertConfiguration
+ (BOOL)supportsSecureCoding;
- (BOOL)_hasCustomAudioVolume;
- (BOOL)isEqual:(id)a3;
- (BOOL)isForPreview;
- (BOOL)prefersToDisallowExternalPlayback;
- (BOOL)shouldForcePlayingAtUserSelectedAudioVolume;
- (BOOL)shouldIgnoreAccessibilityDisabledVibrationSetting;
- (BOOL)shouldIgnoreRingerSwitch;
- (BOOL)shouldRepeat;
- (NSDictionary)externalVibrationPattern;
- (NSString)audioCategory;
- (NSString)toneIdentifier;
- (NSString)topic;
- (NSString)vibrationIdentifier;
- (NSURL)externalToneFileURL;
- (NSURL)externalVibrationPatternFileURL;
- (TLAlertConfiguration)initWithCoder:(id)a3;
- (TLAlertConfiguration)initWithType:(int64_t)a3;
- (double)_audioPlaybackInitiationDelay;
- (double)_audioVolumeRampingDuration;
- (double)maximumDuration;
- (float)audioVolume;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)targetDevice;
- (int64_t)type;
- (unint64_t)externalToneMediaLibraryItemIdentifier;
- (unint64_t)hash;
- (void)_freeze;
- (void)_setAudioPlaybackInitiationDelay:(double)a3;
- (void)_setAudioVolumeRampingDuration:(double)a3;
- (void)_throwForFrozenInstance;
- (void)encodeWithCoder:(id)a3;
- (void)setAudioCategory:(id)a3;
- (void)setAudioVolume:(float)a3;
- (void)setExternalToneFileURL:(id)a3;
- (void)setExternalToneMediaLibraryItemIdentifier:(unint64_t)a3;
- (void)setExternalVibrationPattern:(id)a3;
- (void)setExternalVibrationPatternFileURL:(id)a3;
- (void)setForPreview:(BOOL)a3;
- (void)setMaximumDuration:(double)a3;
- (void)setPrefersToDisallowExternalPlayback:(BOOL)a3;
- (void)setShouldForcePlayingAtUserSelectedAudioVolume:(BOOL)a3;
- (void)setShouldIgnoreAccessibilityDisabledVibrationSetting:(BOOL)a3;
- (void)setShouldIgnoreRingerSwitch:(BOOL)a3;
- (void)setShouldRepeat:(BOOL)a3;
- (void)setTargetDevice:(int64_t)a3;
- (void)setToneIdentifier:(id)a3;
- (void)setTopic:(id)a3;
- (void)setVibrationIdentifier:(id)a3;
@end

@implementation TLAlertConfiguration

- (TLAlertConfiguration)initWithType:(int64_t)a3
{
  v15.receiver = self;
  v15.super_class = (Class)TLAlertConfiguration;
  v4 = [(TLAlertConfiguration *)&v15 init];
  v5 = v4;
  if (v4)
  {
    topic = v4->_topic;
    v4->_unint64_t type = a3;
    v4->_topic = (NSString *)&stru_1F35F7550;

    toneIdentifier = v5->_toneIdentifier;
    v5->_toneIdentifier = (NSString *)&stru_1F35F7550;

    vibrationIdentifier = v5->_vibrationIdentifier;
    v5->_vibrationIdentifier = (NSString *)&stru_1F35F7550;

    audioCategory = v5->_audioCategory;
    v5->_audioCategory = (NSString *)&stru_1F35F7550;

    unint64_t type = v5->_type;
    BOOL v11 = type >= 0x1C;
    BOOL v13 = type == 28;
    uint64_t v12 = (1 << type) & 0x10006002;
    BOOL v13 = !v13 && v11 || v12 == 0;
    if (!v13) {
      v5->_shouldRepeat = 1;
    }
    v5->_audioVolume = 1.0;
    v5->_targetDevice = 0;
  }
  return v5;
}

- (unint64_t)hash
{
  int64_t type = self->_type;
  NSUInteger v4 = [(NSString *)self->_topic hash];
  NSUInteger v5 = [(NSString *)self->_toneIdentifier hash];
  NSUInteger v6 = [(NSString *)self->_vibrationIdentifier hash];
  uint64_t v7 = [(NSURL *)self->_externalToneFileURL hash];
  unint64_t externalToneMediaLibraryItemIdentifier = self->_externalToneMediaLibraryItemIdentifier;
  uint64_t v9 = [(NSDictionary *)self->_externalVibrationPattern hash];
  uint64_t v10 = [(NSURL *)self->_externalVibrationPatternFileURL hash];
  NSUInteger v11 = [(NSString *)self->_audioCategory hash];
  unint64_t v12 = llroundf(self->_audioVolume * 1000.0);
  double v13 = self->_maximumDuration * 10000.0;
  unint64_t v14 = llround(v13);
  LODWORD(v13) = *(_DWORD *)&self->_forPreview;
  uint32x4_t v15 = vmovl_u16((uint16x4_t)vceqz_s16((int16x4_t)*(_OWORD *)&vmovl_u8(*(uint8x8_t *)&v13)));
  v16.i64[0] = v15.u32[0];
  v16.i64[1] = v15.u32[1];
  int8x16_t v17 = (int8x16_t)vshrq_n_s64(vshlq_n_s64(v16, 0x38uLL), 0x38uLL);
  v16.i64[0] = v15.u32[2];
  v16.i64[1] = v15.u32[3];
  int8x16_t v18 = vbicq_s8((int8x16_t)xmmword_1DB982760, (int8x16_t)vshrq_n_s64(vshlq_n_s64(v16, 0x38uLL), 0x38uLL));
  int8x16_t v19 = vbicq_s8((int8x16_t)xmmword_1DB982770, v17);
  unint64_t v20 = llround(self->_audioPlaybackInitiationDelay * 10000.0);
  uint64_t v21 = 100000000;
  if (self->_shouldForcePlayingAtUserSelectedAudioVolume) {
    uint64_t v22 = 100000000;
  }
  else {
    uint64_t v22 = 0;
  }
  if (!self->_shouldIgnoreAccessibilityDisabledVibrationSetting) {
    uint64_t v21 = 0;
  }
  uint64_t v23 = 100;
  if (!self->_hasCustomAudioVolume) {
    uint64_t v23 = 0;
  }
  int8x16_t v24 = veorq_s8(v19, v18);
  return *(void *)&veor_s8(*(int8x8_t *)v24.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v24, v24, 8uLL)) ^ v22 ^ (v21 | v23) ^ type ^ externalToneMediaLibraryItemIdentifier ^ llround(self->_audioVolumeRampingDuration * 10000.0) ^ v20 ^ (1000000000 * self->_targetDevice) ^ v12 ^ v11 ^ v14 ^ v10 ^ v9 ^ v7 ^ v6 ^ v5 ^ v4;
}

- (BOOL)isEqual:(id)a3
{
  NSUInteger v4 = (TLAlertConfiguration *)a3;
  if (self == v4)
  {
    BOOL v13 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      NSUInteger v5 = v4;
      BOOL v13 = self->_type == v5->_type
         && ((topic = self->_topic, topic == v5->_topic) || -[NSString isEqualToString:](topic, "isEqualToString:"))
         && ((toneIdentifier = self->_toneIdentifier, toneIdentifier == v5->_toneIdentifier)
          || -[NSString isEqualToString:](toneIdentifier, "isEqualToString:"))
         && ((vibrationIdentifier = self->_vibrationIdentifier, vibrationIdentifier == v5->_vibrationIdentifier)
          || -[NSString isEqualToString:](vibrationIdentifier, "isEqualToString:"))
         && ((externalToneFileURL = self->_externalToneFileURL, externalToneFileURL == v5->_externalToneFileURL)
          || -[NSURL isEqual:](externalToneFileURL, "isEqual:"))
         && self->_externalToneMediaLibraryItemIdentifier == v5->_externalToneMediaLibraryItemIdentifier
         && ((externalVibrationPattern = self->_externalVibrationPattern,
              externalVibrationPattern == v5->_externalVibrationPattern)
          || -[NSDictionary isEqualToDictionary:](externalVibrationPattern, "isEqualToDictionary:"))
         && ((externalVibrationPatternFileURL = self->_externalVibrationPatternFileURL,
              externalVibrationPatternFileURL == v5->_externalVibrationPatternFileURL)
          || -[NSURL isEqual:](externalVibrationPatternFileURL, "isEqual:"))
         && ((audioCategory = self->_audioCategory, audioCategory == v5->_audioCategory)
          || -[NSString isEqualToString:](audioCategory, "isEqualToString:"))
         && self->_forPreview == v5->_forPreview
         && vabds_f32(self->_audioVolume, v5->_audioVolume) < 0.00000011921
         && vabdd_f64(self->_maximumDuration, v5->_maximumDuration) < 0.00000011920929
         && self->_prefersToDisallowExternalPlayback == v5->_prefersToDisallowExternalPlayback
         && self->_shouldRepeat == v5->_shouldRepeat
         && self->_shouldIgnoreRingerSwitch == v5->_shouldIgnoreRingerSwitch
         && self->_shouldForcePlayingAtUserSelectedAudioVolume == v5->_shouldForcePlayingAtUserSelectedAudioVolume
         && self->_shouldIgnoreAccessibilityDisabledVibrationSetting == v5->_shouldIgnoreAccessibilityDisabledVibrationSetting
         && self->_targetDevice == v5->_targetDevice
         && self->_hasCustomAudioVolume == v5->_hasCustomAudioVolume
         && self->_audioPlaybackInitiationDelay == v5->_audioPlaybackInitiationDelay
         && self->_audioVolumeRampingDuration == v5->_audioVolumeRampingDuration;
    }
    else
    {
      BOOL v13 = 0;
    }
  }

  return v13;
}

- (id)description
{
  v3 = (void *)MEMORY[0x1E4F28E78];
  NSUInteger v4 = (objc_class *)objc_opt_class();
  NSUInteger v5 = NSStringFromClass(v4);
  NSUInteger v6 = [v3 stringWithFormat:@"<%@: %p", v5, self];

  uint64_t v7 = _TLAlertTypeGetHumanReadableDescription(self->_type);
  [v6 appendFormat:@"; int64_t type = %@", v7];

  if ([(NSString *)self->_topic length]) {
    [v6 appendFormat:@"; topic = \"%@\"", self->_topic];
  }
  if ([(NSString *)self->_toneIdentifier length]) {
    [v6 appendFormat:@"; toneIdentifier = \"%@\"", self->_toneIdentifier];
  }
  if ([(NSString *)self->_vibrationIdentifier length]) {
    [v6 appendFormat:@"; vibrationIdentifier = \"%@\"", self->_vibrationIdentifier];
  }
  if (self->_externalToneFileURL) {
    [v6 appendFormat:@"; externalToneFileURL = %@", self->_externalToneFileURL];
  }
  if (self->_externalToneMediaLibraryItemIdentifier) {
    objc_msgSend(v6, "appendFormat:", @"; unint64_t externalToneMediaLibraryItemIdentifier = %llu",
  }
      self->_externalToneMediaLibraryItemIdentifier);
  if (self->_externalVibrationPattern) {
    [v6 appendString:@"; has externalVibrationPattern"];
  }
  if (self->_externalVibrationPatternFileURL) {
    objc_msgSend(v6, "appendFormat:", @"; externalVibrationPatternFileURL = %@",
  }
      self->_externalVibrationPatternFileURL);
  if ([(NSString *)self->_audioCategory length]) {
    [v6 appendFormat:@"; audioCategory = \"%@\"", self->_audioCategory];
  }
  if (self->_hasCustomAudioVolume) {
    objc_msgSend(v6, "appendFormat:", @"; audioVolume = %f", self->_audioVolume);
  }
  if (self->_forPreview) {
    [v6 appendString:@"; isForPreview = YES"];
  }
  if (self->_maximumDuration > 0.00000011920929) {
    objc_msgSend(v6, "appendFormat:", @"; maximumDuration = %f", *(void *)&self->_maximumDuration);
  }
  if (self->_prefersToDisallowExternalPlayback) {
    [v6 appendString:@"; prefersToDisallowExternalPlayback = YES"];
  }
  if (self->_shouldRepeat) {
    [v6 appendString:@"; shouldRepeat = YES"];
  }
  if (self->_shouldIgnoreRingerSwitch) {
    [v6 appendString:@"; shouldIgnoreRingerSwitch = YES"];
  }
  if (self->_shouldForcePlayingAtUserSelectedAudioVolume) {
    [v6 appendString:@"; shouldForcePlayingAtUserSelectedAudioVolume = YES"];
  }
  if (self->_shouldIgnoreAccessibilityDisabledVibrationSetting) {
    [v6 appendString:@"; shouldIgnoreAccessibilityDisabledVibrationSetting = YES"];
  }
  unint64_t targetDevice = self->_targetDevice;
  if (targetDevice)
  {
    uint64_t v9 = _TLAlertTargetDeviceGetHumanReadableDescription(targetDevice);
    [v6 appendFormat:@"; unint64_t targetDevice = %@", v9];
  }
  if (self->_audioPlaybackInitiationDelay > 0.00000011920929) {
    objc_msgSend(v6, "appendFormat:", @"; audioPlaybackInitiationDelay = %f",
  }
      *(void *)&self->_audioPlaybackInitiationDelay);
  if (self->_audioVolumeRampingDuration > 0.00000011920929) {
    objc_msgSend(v6, "appendFormat:", @"; audioVolumeRampingDuration = %f",
  }
      *(void *)&self->_audioVolumeRampingDuration);
  [v6 appendString:@">"];

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  NSUInteger v4 = [[TLAlertConfiguration alloc] initWithType:self->_type];
  if (v4)
  {
    uint64_t v5 = [(NSString *)self->_topic copy];
    topic = v4->_topic;
    v4->_topic = (NSString *)v5;

    uint64_t v7 = [(NSString *)self->_toneIdentifier copy];
    toneIdentifier = v4->_toneIdentifier;
    v4->_toneIdentifier = (NSString *)v7;

    uint64_t v9 = [(NSString *)self->_vibrationIdentifier copy];
    vibrationIdentifier = v4->_vibrationIdentifier;
    v4->_vibrationIdentifier = (NSString *)v9;

    uint64_t v11 = [(NSURL *)self->_externalToneFileURL copy];
    externalToneFileURL = v4->_externalToneFileURL;
    v4->_externalToneFileURL = (NSURL *)v11;

    v4->_unint64_t externalToneMediaLibraryItemIdentifier = self->_externalToneMediaLibraryItemIdentifier;
    uint64_t v13 = [(NSDictionary *)self->_externalVibrationPattern copy];
    externalVibrationPattern = v4->_externalVibrationPattern;
    v4->_externalVibrationPattern = (NSDictionary *)v13;

    uint64_t v15 = [(NSURL *)self->_externalVibrationPatternFileURL copy];
    externalVibrationPatternFileURL = v4->_externalVibrationPatternFileURL;
    v4->_externalVibrationPatternFileURL = (NSURL *)v15;

    uint64_t v17 = [(NSString *)self->_audioCategory copy];
    audioCategory = v4->_audioCategory;
    v4->_audioCategory = (NSString *)v17;

    v4->_audioVolume = self->_audioVolume;
    v4->_forPreview = self->_forPreview;
    v4->_maximumDuration = self->_maximumDuration;
    v4->_prefersToDisallowExternalPlayback = self->_prefersToDisallowExternalPlayback;
    v4->_shouldRepeat = self->_shouldRepeat;
    v4->_shouldIgnoreRingerSwitch = self->_shouldIgnoreRingerSwitch;
    v4->_shouldForcePlayingAtUserSelectedAudioVolume = self->_shouldForcePlayingAtUserSelectedAudioVolume;
    v4->_shouldIgnoreAccessibilityDisabledVibrationSetting = self->_shouldIgnoreAccessibilityDisabledVibrationSetting;
    v4->_unint64_t targetDevice = self->_targetDevice;
    v4->_hasCustomAudioVolume = self->_hasCustomAudioVolume;
    v4->_audioPlaybackInitiationDelay = self->_audioPlaybackInitiationDelay;
    v4->_audioVolumeRampingDuration = self->_audioVolumeRampingDuration;
  }
  return v4;
}

- (TLAlertConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = -[TLAlertConfiguration initWithType:](self, "initWithType:", [v4 decodeIntegerForKey:@"type"]);
  if (v5)
  {
    NSUInteger v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"topic"];
    uint64_t v7 = [v6 copy];
    topic = v5->_topic;
    v5->_topic = (NSString *)v7;

    uint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"toneIdentifier"];
    uint64_t v10 = [v9 copy];
    toneIdentifier = v5->_toneIdentifier;
    v5->_toneIdentifier = (NSString *)v10;

    unint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"vibrationIdentifier"];
    uint64_t v13 = [v12 copy];
    vibrationIdentifier = v5->_vibrationIdentifier;
    v5->_vibrationIdentifier = (NSString *)v13;

    uint64_t v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"externalToneFileURL"];
    uint64_t v16 = [v15 copy];
    externalToneFileURL = v5->_externalToneFileURL;
    v5->_externalToneFileURL = (NSURL *)v16;

    v5->_unint64_t externalToneMediaLibraryItemIdentifier = [v4 decodeInt64ForKey:@"externalToneMediaLibraryItemIdentifier"];
    int8x16_t v18 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v19 = objc_opt_class();
    uint64_t v20 = objc_opt_class();
    uint64_t v21 = objc_opt_class();
    uint64_t v22 = objc_opt_class();
    uint64_t v23 = objc_opt_class();
    int8x16_t v24 = objc_msgSend(v18, "setWithObjects:", v19, v20, v21, v22, v23, objc_opt_class(), 0);
    v25 = [v4 decodeObjectOfClasses:v24 forKey:@"externalVibrationPattern"];
    uint64_t v26 = [v25 copy];
    externalVibrationPattern = v5->_externalVibrationPattern;
    v5->_externalVibrationPattern = (NSDictionary *)v26;

    v28 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"externalVibrationPatternFileURL"];
    uint64_t v29 = [v28 copy];
    externalVibrationPatternFileURL = v5->_externalVibrationPatternFileURL;
    v5->_externalVibrationPatternFileURL = (NSURL *)v29;

    v31 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"audioCategory"];
    uint64_t v32 = [v31 copy];
    audioCategory = v5->_audioCategory;
    v5->_audioCategory = (NSString *)v32;

    [v4 decodeFloatForKey:@"audioVolume"];
    v5->_audioVolume = v34;
    v5->_forPreview = [v4 decodeBoolForKey:@"isForPreview"];
    [v4 decodeDoubleForKey:@"maximumDuration"];
    v5->_maximumDuration = v35;
    v5->_prefersToDisallowExternalPlayback = [v4 decodeBoolForKey:@"prefersToDisallowExternalPlayback"];
    v5->_shouldRepeat = [v4 decodeBoolForKey:@"shouldRepeat"];
    v5->_shouldIgnoreRingerSwitch = [v4 decodeBoolForKey:@"shouldIgnoreRingerSwitch"];
    v5->_shouldForcePlayingAtUserSelectedAudioVolume = [v4 decodeBoolForKey:@"shouldForcePlayingAtUserSelectedAudioVolume"];
    v5->_shouldIgnoreAccessibilityDisabledVibrationSetting = [v4 decodeBoolForKey:@"shouldIgnoreAccessibilityDisabledVibrationSetting"];
    v36 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"targetDevice"];
    v5->_unint64_t targetDevice = TLAlertTargetDeviceFromString(v36);
    v5->_hasCustomAudioVolume = [v4 decodeBoolForKey:@"hasCustomAudioVolume"];
    [v4 decodeDoubleForKey:@"audioPlaybackInitiationDelay"];
    v5->_audioPlaybackInitiationDelay = v37;
    [v4 decodeDoubleForKey:@"audioVolumeRampingDuration"];
    v5->_audioVolumeRampingDuration = v38;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t type = self->_type;
  id v5 = a3;
  [v5 encodeInteger:type forKey:@"type"];
  [v5 encodeObject:self->_topic forKey:@"topic"];
  [v5 encodeObject:self->_toneIdentifier forKey:@"toneIdentifier"];
  [v5 encodeObject:self->_vibrationIdentifier forKey:@"vibrationIdentifier"];
  [v5 encodeObject:self->_externalToneFileURL forKey:@"externalToneFileURL"];
  [v5 encodeInt64:self->_externalToneMediaLibraryItemIdentifier forKey:@"externalToneMediaLibraryItemIdentifier"];
  [v5 encodeObject:self->_externalVibrationPattern forKey:@"externalVibrationPattern"];
  [v5 encodeObject:self->_externalVibrationPatternFileURL forKey:@"externalVibrationPatternFileURL"];
  [v5 encodeObject:self->_audioCategory forKey:@"audioCategory"];
  *(float *)&double v6 = self->_audioVolume;
  [v5 encodeFloat:@"audioVolume" forKey:v6];
  [v5 encodeBool:self->_forPreview forKey:@"isForPreview"];
  [v5 encodeDouble:@"maximumDuration" forKey:self->_maximumDuration];
  [v5 encodeBool:self->_prefersToDisallowExternalPlayback forKey:@"prefersToDisallowExternalPlayback"];
  [v5 encodeBool:self->_shouldRepeat forKey:@"shouldRepeat"];
  [v5 encodeBool:self->_shouldIgnoreRingerSwitch forKey:@"shouldIgnoreRingerSwitch"];
  [v5 encodeBool:self->_shouldForcePlayingAtUserSelectedAudioVolume forKey:@"shouldForcePlayingAtUserSelectedAudioVolume"];
  [v5 encodeBool:self->_shouldIgnoreAccessibilityDisabledVibrationSetting forKey:@"shouldIgnoreAccessibilityDisabledVibrationSetting"];
  NSStringFromTLAlertTargetDevice(self->_targetDevice);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  [v5 encodeObject:v7 forKey:@"targetDevice"];
  [v5 encodeBool:self->_hasCustomAudioVolume forKey:@"hasCustomAudioVolume"];
  [v5 encodeDouble:@"audioPlaybackInitiationDelay" forKey:self->_audioPlaybackInitiationDelay];
  [v5 encodeDouble:@"audioVolumeRampingDuration" forKey:self->_audioVolumeRampingDuration];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)_freeze
{
  self->_isFrozen = 1;
}

- (void)_throwForFrozenInstance
{
  if (self->_isFrozen) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"Instances of TLAlertConfiguration cannot be mutated once they've been used to make an instance of TLAlert. Please make a copy of the TLAlertConfiguration instead."];
  }
}

- (void)setTopic:(id)a3
{
  id v10 = a3;
  [(TLAlertConfiguration *)self _throwForFrozenInstance];
  id v4 = (NSString *)[v10 copy];
  topic = self->_topic;
  self->_topic = v4;

  int64_t type = self->_type;
  if (type == 13)
  {
    if (self->_hasCustomRepeatingFlag) {
      goto LABEL_15;
    }
    self->_shouldRepeat = [v10 isEqualToString:@"TLAlertTopicAlarmGoToSleep"] ^ 1;
    int64_t type = self->_type;
  }
  if (type == 1)
  {
    if (self->_hasCustomRepeatingFlag) {
      goto LABEL_15;
    }
    BOOL v7 = ([v10 isEqualToString:@"TLAlertTopicIncomingCallFaceTimeGroupInvitation"] & 1) == 0
      && ![v10 isEqualToString:@"TLAlertTopicIncomingCallFaceTimeParticipantJoined"];
    self->_shouldRepeat = v7;
    int64_t type = self->_type;
  }
  if (type == 16)
  {
    int v8 = [v10 isEqualToString:@"TLAlertTopicSystemNotificationFindMyDevice"];
    double v9 = 0.0;
    if (v8) {
      double v9 = 5.0;
    }
    self->_audioPlaybackInitiationDelay = v9;
    self->_audioVolumeRampingDuration = v9;
  }
LABEL_15:
}

- (void)setToneIdentifier:(id)a3
{
  id v4 = a3;
  [(TLAlertConfiguration *)self _throwForFrozenInstance];
  id v5 = (NSString *)[v4 copy];

  toneIdentifier = self->_toneIdentifier;
  self->_toneIdentifier = v5;
}

- (void)setVibrationIdentifier:(id)a3
{
  id v4 = a3;
  [(TLAlertConfiguration *)self _throwForFrozenInstance];
  id v5 = (NSString *)[v4 copy];

  vibrationIdentifier = self->_vibrationIdentifier;
  self->_vibrationIdentifier = v5;
}

- (void)setExternalToneFileURL:(id)a3
{
  id v4 = a3;
  [(TLAlertConfiguration *)self _throwForFrozenInstance];
  id v5 = (NSURL *)[v4 copy];

  externalToneFileURL = self->_externalToneFileURL;
  self->_externalToneFileURL = v5;
}

- (void)setExternalToneMediaLibraryItemIdentifier:(unint64_t)a3
{
  self->_unint64_t externalToneMediaLibraryItemIdentifier = a3;
}

- (void)setExternalVibrationPattern:(id)a3
{
  id v4 = a3;
  [(TLAlertConfiguration *)self _throwForFrozenInstance];
  id v5 = (NSDictionary *)[v4 copy];

  externalVibrationPattern = self->_externalVibrationPattern;
  self->_externalVibrationPattern = v5;
}

- (void)setExternalVibrationPatternFileURL:(id)a3
{
  id v4 = a3;
  [(TLAlertConfiguration *)self _throwForFrozenInstance];
  id v5 = (NSURL *)[v4 copy];

  externalVibrationPatternFileURL = self->_externalVibrationPatternFileURL;
  self->_externalVibrationPatternFileURL = v5;
}

- (void)setAudioCategory:(id)a3
{
  id v4 = a3;
  [(TLAlertConfiguration *)self _throwForFrozenInstance];
  id v5 = (NSString *)[v4 copy];

  audioCategory = self->_audioCategory;
  self->_audioCategory = v5;
}

- (void)setAudioVolume:(float)a3
{
  self->_audioVolume = a3;
  self->_hasCustomAudioVolume = 1;
}

- (void)setForPreview:(BOOL)a3
{
  self->_forPreview = a3;
}

- (void)setMaximumDuration:(double)a3
{
  self->_maximumDuration = a3;
}

- (void)setPrefersToDisallowExternalPlayback:(BOOL)a3
{
  self->_prefersToDisallowExternalPlayback = a3;
}

- (void)setShouldRepeat:(BOOL)a3
{
  self->_shouldRepeat = a3;
  self->_hasCustomRepeatingFlag = 1;
}

- (void)setShouldIgnoreRingerSwitch:(BOOL)a3
{
  self->_shouldIgnoreRingerSwitch = a3;
}

- (void)setShouldForcePlayingAtUserSelectedAudioVolume:(BOOL)a3
{
  self->_shouldForcePlayingAtUserSelectedAudioVolume = a3;
}

- (void)setShouldIgnoreAccessibilityDisabledVibrationSetting:(BOOL)a3
{
  self->_shouldIgnoreAccessibilityDisabledVibrationSetting = a3;
}

- (void)setTargetDevice:(int64_t)a3
{
  self->_unint64_t targetDevice = a3;
}

- (void)_setAudioPlaybackInitiationDelay:(double)a3
{
  self->_audioPlaybackInitiationDelay = a3;
}

- (void)_setAudioVolumeRampingDuration:(double)a3
{
  self->_audioVolumeRampingDuration = a3;
}

- (BOOL)_hasCustomAudioVolume
{
  return self->_hasCustomAudioVolume;
}

- (double)_audioPlaybackInitiationDelay
{
  return self->_audioPlaybackInitiationDelay;
}

- (double)_audioVolumeRampingDuration
{
  return self->_audioVolumeRampingDuration;
}

- (int64_t)type
{
  return self->_type;
}

- (NSString)topic
{
  return self->_topic;
}

- (NSString)toneIdentifier
{
  return self->_toneIdentifier;
}

- (NSString)vibrationIdentifier
{
  return self->_vibrationIdentifier;
}

- (NSURL)externalToneFileURL
{
  return self->_externalToneFileURL;
}

- (unint64_t)externalToneMediaLibraryItemIdentifier
{
  return self->_externalToneMediaLibraryItemIdentifier;
}

- (NSDictionary)externalVibrationPattern
{
  return self->_externalVibrationPattern;
}

- (NSURL)externalVibrationPatternFileURL
{
  return self->_externalVibrationPatternFileURL;
}

- (NSString)audioCategory
{
  return self->_audioCategory;
}

- (float)audioVolume
{
  return self->_audioVolume;
}

- (BOOL)isForPreview
{
  return self->_forPreview;
}

- (double)maximumDuration
{
  return self->_maximumDuration;
}

- (BOOL)prefersToDisallowExternalPlayback
{
  return self->_prefersToDisallowExternalPlayback;
}

- (BOOL)shouldRepeat
{
  return self->_shouldRepeat;
}

- (BOOL)shouldIgnoreRingerSwitch
{
  return self->_shouldIgnoreRingerSwitch;
}

- (BOOL)shouldForcePlayingAtUserSelectedAudioVolume
{
  return self->_shouldForcePlayingAtUserSelectedAudioVolume;
}

- (BOOL)shouldIgnoreAccessibilityDisabledVibrationSetting
{
  return self->_shouldIgnoreAccessibilityDisabledVibrationSetting;
}

- (int64_t)targetDevice
{
  return self->_targetDevice;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_audioCategory, 0);
  objc_storeStrong((id *)&self->_externalVibrationPatternFileURL, 0);
  objc_storeStrong((id *)&self->_externalVibrationPattern, 0);
  objc_storeStrong((id *)&self->_externalToneFileURL, 0);
  objc_storeStrong((id *)&self->_vibrationIdentifier, 0);
  objc_storeStrong((id *)&self->_toneIdentifier, 0);

  objc_storeStrong((id *)&self->_topic, 0);
}

@end
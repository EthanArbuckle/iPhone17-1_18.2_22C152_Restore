@interface MTSound
+ (BOOL)supportsSecureCoding;
+ (id)_loadDefaultAlarmSound;
+ (id)_loadDefaultTimerSound;
+ (id)defaultSoundForCategory:(unint64_t)a3;
+ (id)descriptionForCategory:(unint64_t)a3;
+ (id)songSoundWithIdentifier:(id)a3 vibrationIdentifier:(id)a4 volume:(id)a5;
+ (id)toneSoundWithIdentifier:(id)a3 vibrationIdentifer:(id)a4 volume:(id)a5;
+ (int64_t)_alertTypeForCategory:(unint64_t)a3;
+ (void)_saveDefaultAlarmSound:(id)a3;
+ (void)_saveDefaultTimerSound:(id)a3;
+ (void)setDefaultSound:(id)a3 forCategory:(unint64_t)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToSound:(id)a3;
- (BOOL)isSilent;
- (MTSound)initWithCoder:(id)a3;
- (MTSound)initWithMediaItemIdentifier:(id)a3 vibrationIdentifier:(id)a4 volume:(id)a5;
- (MTSound)initWithSound:(id)a3 usingVolume:(id)a4;
- (MTSound)initWithToneIdentifier:(id)a3 vibrationIdentifer:(id)a4 volume:(id)a5;
- (NSNumber)mediaItemIdentifier;
- (NSNumber)soundVolume;
- (NSString)description;
- (NSString)toneIdentifier;
- (NSString)vibrationIdentifier;
- (id)previewWithCompletionHandler:(id)a3;
- (id)soundByUpdatingVibrationIdentifier:(id)a3;
- (id)soundByUpdatingVolume:(id)a3;
- (id)unSound;
- (id)unSoundForCategory:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)soundType;
- (void)encodeWithCoder:(id)a3;
- (void)updatePreview:(id)a3;
@end

@implementation MTSound

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_soundVolume, 0);
  objc_storeStrong((id *)&self->_vibrationIdentifier, 0);
  objc_storeStrong((id *)&self->_mediaItemIdentifier, 0);
  objc_storeStrong((id *)&self->_toneIdentifier, 0);
}

- (MTSound)initWithCoder:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)MTSound;
  v5 = [(MTSound *)&v16 init];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MTSoundType"];
    v5->_soundType = [v6 unsignedIntegerValue];

    uint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MTSoundToneID"];
    toneIdentifier = v5->_toneIdentifier;
    v5->_toneIdentifier = (NSString *)v7;

    uint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MTSoundMediaItemID"];
    mediaItemIdentifier = v5->_mediaItemIdentifier;
    v5->_mediaItemIdentifier = (NSNumber *)v9;

    uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MTSoundVibrationID"];
    vibrationIdentifier = v5->_vibrationIdentifier;
    v5->_vibrationIdentifier = (NSString *)v11;

    uint64_t v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MTSoundVolume"];
    soundVolume = v5->_soundVolume;
    v5->_soundVolume = (NSNumber *)v13;
  }
  return v5;
}

- (NSString)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(MTSound *)self toneIdentifier];
  v6 = [(MTSound *)self mediaItemIdentifier];
  uint64_t v7 = [(MTSound *)self vibrationIdentifier];
  v8 = [(MTSound *)self soundVolume];
  uint64_t v9 = [v3 stringWithFormat:@"<%@:%p toneID: %@, mediaItemID: %@, vibeID: %@, volume: %@", v4, self, v5, v6, v7, v8];

  return (NSString *)v9;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v4 = (void *)MEMORY[0x1E4F28ED0];
  id v5 = a3;
  v6 = objc_msgSend(v4, "numberWithUnsignedInteger:", -[MTSound soundType](self, "soundType"));
  [v5 encodeObject:v6 forKey:@"MTSoundType"];

  uint64_t v7 = [(MTSound *)self toneIdentifier];
  [v5 encodeObject:v7 forKey:@"MTSoundToneID"];

  v8 = [(MTSound *)self mediaItemIdentifier];
  [v5 encodeObject:v8 forKey:@"MTSoundMediaItemID"];

  uint64_t v9 = [(MTSound *)self vibrationIdentifier];
  [v5 encodeObject:v9 forKey:@"MTSoundVibrationID"];

  id v10 = [(MTSound *)self soundVolume];
  [v5 encodeObject:v10 forKey:@"MTSoundVolume"];
}

- (NSString)vibrationIdentifier
{
  return self->_vibrationIdentifier;
}

- (NSString)toneIdentifier
{
  return self->_toneIdentifier;
}

- (NSNumber)soundVolume
{
  return self->_soundVolume;
}

- (NSNumber)mediaItemIdentifier
{
  return self->_mediaItemIdentifier;
}

- (unint64_t)soundType
{
  return self->_soundType;
}

+ (id)defaultSoundForCategory:(unint64_t)a3
{
  switch(a3)
  {
    case 0uLL:
      uint64_t v4 = +[MTSound _loadDefaultAlarmSound];
      break;
    case 1uLL:
      uint64_t v4 = +[MTSound _loadDefaultTimerSound];
      break;
    case 2uLL:
    case 4uLL:
      v3 = 0;
      goto LABEL_7;
    case 3uLL:
      v3 = &unk_1EEE11EC0;
LABEL_7:
      uint64_t v4 = +[MTSound toneSoundWithIdentifier:0 vibrationIdentifer:0 volume:v3];
      break;
    default:
      NSLog(&cfstr_UnexpectedMtso.isa, a2, a3);
      uint64_t v4 = 0;
      break;
  }
  return v4;
}

+ (id)_loadDefaultTimerSound
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v2 = +[MTUserDefaults sharedUserDefaults];
  v3 = [v2 objectForKey:@"MTDefaultTimerToneID"];

  objc_opt_class();
  id v4 = v3;
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }
  id v6 = v5;

  uint64_t v7 = v4;
  if (!v6)
  {
    v8 = [MEMORY[0x1E4FAF5F0] sharedToneManager];
    uint64_t v7 = [v8 defaultToneIdentifierForAlertType:14];
  }
  uint64_t v9 = +[MTSound toneSoundWithIdentifier:v7 vibrationIdentifer:0 volume:0];
  id v10 = MTLogForCategory(0);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138412290;
    uint64_t v13 = v9;
    _os_log_impl(&dword_19CC95000, v10, OS_LOG_TYPE_DEFAULT, "[Sound] Default timer sound is %@", (uint8_t *)&v12, 0xCu);
  }

  return v9;
}

+ (id)toneSoundWithIdentifier:(id)a3 vibrationIdentifer:(id)a4 volume:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = [[MTSound alloc] initWithToneIdentifier:v9 vibrationIdentifer:v8 volume:v7];

  return v10;
}

- (MTSound)initWithToneIdentifier:(id)a3 vibrationIdentifer:(id)a4 volume:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v20.receiver = self;
  v20.super_class = (Class)MTSound;
  uint64_t v11 = [(MTSound *)&v20 init];
  int v12 = v11;
  if (v11)
  {
    v11->_soundType = 2;
    uint64_t v13 = [v8 copy];
    toneIdentifier = v12->_toneIdentifier;
    v12->_toneIdentifier = (NSString *)v13;

    uint64_t v15 = [v9 copy];
    vibrationIdentifier = v12->_vibrationIdentifier;
    v12->_vibrationIdentifier = (NSString *)v15;

    uint64_t v17 = [v10 copy];
    soundVolume = v12->_soundVolume;
    v12->_soundVolume = (NSNumber *)v17;
  }
  return v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)unSound
{
  return [(MTSound *)self unSoundForCategory:0];
}

+ (int64_t)_alertTypeForCategory:(unint64_t)a3
{
  int64_t v3 = 13;
  if (a3 == 1) {
    int64_t v3 = 14;
  }
  if (a3 == 4) {
    return 17;
  }
  else {
    return v3;
  }
}

- (id)unSoundForCategory:(unint64_t)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = MTLogForCategory(0);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [(id)objc_opt_class() descriptionForCategory:a3];
    int v20 = 138543618;
    v21 = self;
    __int16 v22 = 2114;
    v23 = v6;
    _os_log_impl(&dword_19CC95000, v5, OS_LOG_TYPE_DEFAULT, "[Sound] Converting %{public}@ to UNNotificationSound for category %{public}@", (uint8_t *)&v20, 0x16u);
  }
  id v7 = objc_msgSend(MEMORY[0x1E4F445C0], "soundWithAlertType:", objc_msgSend((id)objc_opt_class(), "_alertTypeForCategory:", a3));
  id v8 = v7;
  if (a3 == 4)
  {
    [v7 setShouldRepeat:0];
  }
  else if (a3 == 2)
  {
    [v7 setShouldRepeat:0];
    [v8 setAlertTopic:*MEMORY[0x1E4FAF608]];
  }
  else
  {
    [v7 setShouldRepeat:1];
    [v8 setShouldIgnoreRingerSwitch:1];
    id v9 = +[MTUserDefaults sharedUserDefaults];
    uint64_t v10 = [v9 integerForKey:@"MTAlertSoundDuration" defaultValue:15];

    [v8 setMaximumDuration:(double)(60 * v10)];
    uint64_t v11 = [(MTSound *)self soundVolume];
    [v8 setAudioVolume:v11];

    if (a3 == 3) {
      [v8 setAlertTopic:*MEMORY[0x1E4FAF610]];
    }
    int v12 = [(MTSound *)self vibrationIdentifier];
    [v8 setVibrationIdentifier:v12];

    unint64_t v13 = [(MTSound *)self soundType];
    if (v13 == 3)
    {
      uint64_t v15 = [(MTSound *)self mediaItemIdentifier];
      uint64_t v16 = [v15 integerValue];

      [v8 setToneMediaLibraryItemIdentifier:v16];
    }
    else if (v13 == 2)
    {
      uint64_t v14 = [(MTSound *)self toneIdentifier];
      [v8 setToneIdentifier:v14];
    }
  }
  uint64_t v17 = MTLogForCategory(0);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v8, "mt_Description");
    v18 = (MTSound *)objc_claimAutoreleasedReturnValue();
    int v20 = 138412290;
    v21 = v18;
    _os_log_impl(&dword_19CC95000, v17, OS_LOG_TYPE_DEFAULT, "[Sound] Made %@", (uint8_t *)&v20, 0xCu);
  }
  return v8;
}

+ (void)setDefaultSound:(id)a3 forCategory:(unint64_t)a4
{
  id v5 = a3;
  id v6 = v5;
  if (v5)
  {
    if (a4 - 2 < 3) {
      goto LABEL_10;
    }
    id v7 = v5;
    if (a4 == 1)
    {
      id v5 = (id)+[MTSound _saveDefaultTimerSound:v5];
    }
    else if (a4)
    {
      NSLog(&cfstr_UnexpectedMtso.isa, v5, a4);
    }
    else
    {
      id v5 = (id)+[MTSound _saveDefaultAlarmSound:v5];
    }
  }
  else
  {
    id v7 = 0;
    NSLog(&cfstr_SoundMustBeNon.isa, 0);
  }
  id v6 = v7;
LABEL_10:
  MEMORY[0x1F41817F8](v5, v6);
}

+ (id)descriptionForCategory:(unint64_t)a3
{
  if (a3 < 5) {
    return off_1E5916968[a3];
  }
  NSLog(&cfstr_UnexpectedMtso.isa, a2, a3);
  return 0;
}

+ (id)songSoundWithIdentifier:(id)a3 vibrationIdentifier:(id)a4 volume:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  uint64_t v10 = [[MTSound alloc] initWithMediaItemIdentifier:v9 vibrationIdentifier:v8 volume:v7];

  return v10;
}

- (MTSound)initWithMediaItemIdentifier:(id)a3 vibrationIdentifier:(id)a4 volume:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v20.receiver = self;
  v20.super_class = (Class)MTSound;
  uint64_t v11 = [(MTSound *)&v20 init];
  int v12 = v11;
  if (v11)
  {
    v11->_soundType = 3;
    uint64_t v13 = [v8 copy];
    mediaItemIdentifier = v12->_mediaItemIdentifier;
    v12->_mediaItemIdentifier = (NSNumber *)v13;

    uint64_t v15 = [v9 copy];
    vibrationIdentifier = v12->_vibrationIdentifier;
    v12->_vibrationIdentifier = (NSString *)v15;

    uint64_t v17 = [v10 copy];
    soundVolume = v12->_soundVolume;
    v12->_soundVolume = (NSNumber *)v17;
  }
  return v12;
}

- (MTSound)initWithSound:(id)a3 usingVolume:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v19.receiver = self;
  v19.super_class = (Class)MTSound;
  id v8 = [(MTSound *)&v19 init];
  if (v8)
  {
    v8->_soundType = [v6 soundType];
    id v9 = [v6 mediaItemIdentifier];
    uint64_t v10 = [v9 copy];
    mediaItemIdentifier = v8->_mediaItemIdentifier;
    v8->_mediaItemIdentifier = (NSNumber *)v10;

    int v12 = [v6 vibrationIdentifier];
    uint64_t v13 = [v12 copy];
    vibrationIdentifier = v8->_vibrationIdentifier;
    v8->_vibrationIdentifier = (NSString *)v13;

    uint64_t v15 = [v6 toneIdentifier];
    uint64_t v16 = [v15 copy];
    toneIdentifier = v8->_toneIdentifier;
    v8->_toneIdentifier = (NSString *)v16;

    objc_storeStrong((id *)&v8->_soundVolume, a4);
  }

  return v8;
}

- (id)soundByUpdatingVibrationIdentifier:(id)a3
{
  id v4 = a3;
  if ([(MTSound *)self soundType] == 3)
  {
    id v5 = [(MTSound *)self mediaItemIdentifier];
    id v6 = [(MTSound *)self soundVolume];
    +[MTSound songSoundWithIdentifier:v5 vibrationIdentifier:v4 volume:v6];
  }
  else
  {
    id v5 = [(MTSound *)self toneIdentifier];
    id v6 = [(MTSound *)self soundVolume];
    +[MTSound toneSoundWithIdentifier:v5 vibrationIdentifer:v4 volume:v6];
  id v7 = };

  return v7;
}

- (id)soundByUpdatingVolume:(id)a3
{
  id v4 = a3;
  if ([(MTSound *)self soundType] == 3)
  {
    id v5 = [(MTSound *)self mediaItemIdentifier];
    id v6 = [(MTSound *)self vibrationIdentifier];
    +[MTSound songSoundWithIdentifier:v5 vibrationIdentifier:v6 volume:v4];
  }
  else
  {
    id v5 = [(MTSound *)self toneIdentifier];
    id v6 = [(MTSound *)self vibrationIdentifier];
    +[MTSound toneSoundWithIdentifier:v5 vibrationIdentifer:v6 volume:v4];
  id v7 = };

  return v7;
}

+ (id)_loadDefaultAlarmSound
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  v2 = +[MTUserDefaults sharedUserDefaults];
  int64_t v3 = [v2 objectForKey:@"MTDefaultAlarmSoundType"];

  objc_opt_class();
  id v4 = v3;
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }
  id v6 = v5;

  unint64_t v7 = [v6 unsignedIntegerValue];
  if (v7 >= 4)
  {
    NSLog(&cfstr_SoundTypeInteg.isa, v7);
    uint64_t v8 = 2;
  }
  else
  {
    if (v7 <= 2) {
      uint64_t v8 = 2;
    }
    else {
      uint64_t v8 = v7;
    }
    if (v7 == 3)
    {
      id v9 = +[MTUserDefaults sharedUserDefaults];
      uint64_t v10 = [v9 objectForKey:@"MTDefaultAlarmMediaItemID"];

      objc_opt_class();
      id v11 = v10;
      if (objc_opt_isKindOfClass()) {
        int v12 = v11;
      }
      else {
        int v12 = 0;
      }
      id v13 = v12;

      id v14 = 0;
LABEL_19:
      objc_super v19 = MTLogForCategory(0);
      BOOL v20 = os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT);
      if (v8 == 3 && v13 == 0)
      {
        if (v20)
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_19CC95000, v19, OS_LOG_TYPE_DEFAULT, "[Sound] No media item ID is specified in defaults. Switch to the tone type and use the ToneLibrary default", buf, 2u);
        }

        objc_super v19 = [MEMORY[0x1E4FAF5F0] sharedToneManager];
        uint64_t v22 = [v19 defaultToneIdentifierForAlertType:13];

        id v13 = 0;
        uint64_t v8 = 2;
        id v14 = (id)v22;
      }
      else if (v20)
      {
        *(_DWORD *)buf = 138412546;
        id v36 = v14;
        __int16 v37 = 2112;
        id v38 = v13;
        _os_log_impl(&dword_19CC95000, v19, OS_LOG_TYPE_DEFAULT, "[Sound] Alarm sound from stored defaults (toneID: %@, mediaItemID: %@)", buf, 0x16u);
      }
      goto LABEL_31;
    }
  }
  uint64_t v15 = +[MTUserDefaults sharedUserDefaults];
  uint64_t v16 = [v15 objectForKey:@"MTDefaultAlarmToneID"];

  objc_opt_class();
  id v17 = v16;
  if (objc_opt_isKindOfClass()) {
    v18 = v17;
  }
  else {
    v18 = 0;
  }
  id v14 = v18;

  if (v14)
  {
    id v13 = 0;
    goto LABEL_19;
  }
  v23 = MTLogForCategory(0);
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19CC95000, v23, OS_LOG_TYPE_DEFAULT, "[Sound] No tone ID is specified in defaults. Fall back to the ToneLibrary default", buf, 2u);
  }

  objc_super v19 = [MEMORY[0x1E4FAF5F0] sharedToneManager];
  id v14 = [v19 defaultToneIdentifierForAlertType:13];
  id v13 = 0;
  uint64_t v8 = 2;
LABEL_31:

  uint64_t v24 = +[MTUserDefaults sharedUserDefaults];
  v25 = [v24 objectForKey:@"MTDefaultAlarmVibrationID"];

  objc_opt_class();
  id v26 = v25;
  if (objc_opt_isKindOfClass()) {
    v27 = v26;
  }
  else {
    v27 = 0;
  }
  id v28 = v27;

  v29 = MTLogForCategory(0);
  BOOL v30 = os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT);
  if (v28)
  {
    if (v30)
    {
      *(_DWORD *)buf = 138412290;
      id v36 = v28;
      _os_log_impl(&dword_19CC95000, v29, OS_LOG_TYPE_DEFAULT, "[Sound] Alarm vibration from stored defaults (vibrationID: %@)", buf, 0xCu);
    }
    v31 = v26;
  }
  else
  {
    if (v30)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19CC95000, v29, OS_LOG_TYPE_DEFAULT, "[Sound] No vibration ID is specified in defaults. Use the ToneLibrary default", buf, 2u);
    }

    v29 = [MEMORY[0x1E4FAF5F8] sharedVibrationManager];
    v31 = [v29 defaultVibrationIdentifierForAlertType:13];
  }

  if (v8 == 3) {
    +[MTSound songSoundWithIdentifier:v13 vibrationIdentifier:v31 volume:0];
  }
  else {
  v32 = +[MTSound toneSoundWithIdentifier:v14 vibrationIdentifer:v31 volume:0];
  }
  v33 = MTLogForCategory(0);
  if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v36 = v32;
    _os_log_impl(&dword_19CC95000, v33, OS_LOG_TYPE_DEFAULT, "[Sound] Default alarm sound is %@", buf, 0xCu);
  }

  return v32;
}

+ (void)_saveDefaultAlarmSound:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [v3 toneIdentifier];
  id v5 = [v3 mediaItemIdentifier];
  id v6 = +[MTUserDefaults sharedUserDefaults];
  unint64_t v7 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", objc_msgSend(v3, "soundType"));
  [v6 setObject:v7 forKey:@"MTDefaultAlarmSoundType"];

  uint64_t v8 = +[MTUserDefaults sharedUserDefaults];
  [v8 setObject:v4 forKey:@"MTDefaultAlarmToneID"];

  id v9 = +[MTUserDefaults sharedUserDefaults];
  [v9 setObject:v5 forKey:@"MTDefaultAlarmMediaItemID"];

  uint64_t v10 = +[MTUserDefaults sharedUserDefaults];
  id v11 = [v3 vibrationIdentifier];
  [v10 setObject:v11 forKey:@"MTDefaultAlarmVibrationID"];

  int v12 = MTLogForCategory(0);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    id v13 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", objc_msgSend(v3, "soundType"));
    id v14 = [v3 vibrationIdentifier];
    int v15 = 138413058;
    uint64_t v16 = v13;
    __int16 v17 = 2112;
    v18 = v4;
    __int16 v19 = 2112;
    BOOL v20 = v5;
    __int16 v21 = 2112;
    uint64_t v22 = v14;
    _os_log_impl(&dword_19CC95000, v12, OS_LOG_TYPE_DEFAULT, "[Sound] Storing Alarm Defaults (soundTypeKey: %@, toneIDKey: %@, mediaItemIDKey: %@, vibrationIDKey: %@)", (uint8_t *)&v15, 0x2Au);
  }
}

+ (void)_saveDefaultTimerSound:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [v3 toneIdentifier];
  uint64_t v5 = [v3 soundType];

  if (v5 != 2)
  {
    NSLog(&cfstr_TimersOnlySupp.isa);

    id v4 = 0;
  }
  id v6 = +[MTUserDefaults sharedUserDefaults];
  [v6 setObject:v4 forKey:@"MTDefaultTimerToneID"];

  unint64_t v7 = MTLogForCategory(0);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412290;
    id v9 = v4;
    _os_log_impl(&dword_19CC95000, v7, OS_LOG_TYPE_DEFAULT, "[Sound] Storing Timer Defaults (toneIDKey: %@)", (uint8_t *)&v8, 0xCu);
  }
}

- (unint64_t)hash
{
  id v3 = [(MTSound *)self toneIdentifier];
  uint64_t v4 = [v3 hash];
  uint64_t v5 = [(MTSound *)self mediaItemIdentifier];
  uint64_t v6 = [v5 hash] ^ v4;
  unint64_t v7 = [(MTSound *)self vibrationIdentifier];
  unint64_t v8 = v6 ^ [v7 hash];

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  id v5 = v4;
  if (objc_opt_isKindOfClass()) {
    uint64_t v6 = v5;
  }
  else {
    uint64_t v6 = 0;
  }
  id v7 = v6;

  if (v7) {
    BOOL v8 = [(MTSound *)self isEqualToSound:v7];
  }
  else {
    BOOL v8 = 0;
  }

  return v8;
}

- (BOOL)isEqualToSound:(id)a3
{
  id v6 = a3;
  unint64_t v7 = [(MTSound *)self soundType];
  if (v7 == [v6 soundType])
  {
    BOOL v8 = [(MTSound *)self toneIdentifier];
    id v9 = [v6 toneIdentifier];
    if (v8 != v9)
    {
      uint64_t v10 = [(MTSound *)self toneIdentifier];
      id v3 = [v6 toneIdentifier];
      v35 = v10;
      if (![v10 isEqual:v3])
      {
        char v11 = 0;
        goto LABEL_23;
      }
    }
    int v12 = [(MTSound *)self mediaItemIdentifier];
    id v13 = [v6 mediaItemIdentifier];
    if (v12 != v13)
    {
      id v14 = [(MTSound *)self mediaItemIdentifier];
      id v4 = [v6 mediaItemIdentifier];
      if (![v14 isEqual:v4])
      {
        char v11 = 0;
LABEL_21:

LABEL_22:
        if (v8 == v9)
        {
LABEL_24:

          goto LABEL_25;
        }
LABEL_23:

        goto LABEL_24;
      }
      v33 = v14;
    }
    uint64_t v15 = [(MTSound *)self vibrationIdentifier];
    uint64_t v16 = [v6 vibrationIdentifier];
    v34 = (void *)v15;
    if ((void *)v15 == v16)
    {
      v29 = v4;
      BOOL v30 = v13;
    }
    else
    {
      __int16 v17 = [(MTSound *)self vibrationIdentifier];
      v31 = [v6 vibrationIdentifier];
      v32 = v17;
      if (!objc_msgSend(v17, "isEqual:"))
      {
        char v11 = 0;
        id v26 = v34;
        goto LABEL_19;
      }
      v29 = v4;
      BOOL v30 = v13;
    }
    v18 = [(MTSound *)self soundVolume];
    uint64_t v19 = [v6 soundVolume];
    if (v18 == (void *)v19)
    {

      char v11 = 1;
    }
    else
    {
      BOOL v20 = (void *)v19;
      __int16 v21 = [(MTSound *)self soundVolume];
      [v6 soundVolume];
      id v28 = v9;
      uint64_t v22 = v8;
      uint64_t v23 = v12;
      v25 = uint64_t v24 = v3;
      char v11 = [v21 isEqual:v25];

      id v3 = v24;
      int v12 = v23;
      BOOL v8 = v22;
      id v9 = v28;
    }
    id v26 = v34;
    id v4 = v29;
    id v13 = v30;
    if (v34 == v16)
    {
LABEL_20:

      id v14 = v33;
      if (v12 == v13) {
        goto LABEL_22;
      }
      goto LABEL_21;
    }
LABEL_19:

    goto LABEL_20;
  }
  char v11 = 0;
LABEL_25:

  return v11;
}

- (BOOL)isSilent
{
  if ([(MTSound *)self soundType] != 2) {
    return 0;
  }
  id v3 = [(MTSound *)self toneIdentifier];
  char v4 = [v3 isEqualToString:*MEMORY[0x1E4FAF638]];

  return v4;
}

- (id)previewWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4FAF5E8]) initWithType:13];
  [v5 setTopic:*MEMORY[0x1E4FAF610]];
  id v6 = [(MTSound *)self toneIdentifier];
  [v5 setToneIdentifier:v6];

  unint64_t v7 = [(MTSound *)self vibrationIdentifier];
  [v5 setVibrationIdentifier:v7];

  BOOL v8 = [(MTSound *)self soundVolume];
  [v8 floatValue];
  objc_msgSend(v5, "setAudioVolume:");

  [v5 setShouldRepeat:0];
  [v5 setForPreview:1];
  id v9 = [MEMORY[0x1E4FAF5E0] alertWithConfiguration:v5];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __40__MTSound_previewWithCompletionHandler___block_invoke;
  v12[3] = &unk_1E5916948;
  id v13 = v4;
  id v10 = v4;
  [v9 playWithCompletionHandler:v12];

  return v9;
}

void __40__MTSound_previewWithCompletionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id v6 = [MEMORY[0x1E4F7A0F0] mtMainThreadScheduler];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __40__MTSound_previewWithCompletionHandler___block_invoke_2;
  v8[3] = &unk_1E5916920;
  id v10 = *(id *)(a1 + 32);
  uint64_t v11 = a2;
  id v9 = v5;
  id v7 = v5;
  [v6 performBlock:v8];
}

uint64_t __40__MTSound_previewWithCompletionHandler___block_invoke_2(void *a1)
{
  uint64_t result = a1[5];
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, a1[6], a1[4]);
  }
  return result;
}

- (void)updatePreview:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [(MTSound *)self soundVolume];
    [v5 floatValue];
    objc_msgSend(v4, "_updateAudioVolumeDynamicallyToValue:");
  }
}

@end
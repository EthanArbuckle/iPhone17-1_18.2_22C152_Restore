@interface TLAlert
+ (BOOL)_stopAllAlerts;
+ (BOOL)_watchPrefersSalientToneAndVibration;
+ (TLAlert)alertWithConfiguration:(id)a3;
+ (int64_t)_currentOverridePolicyForType:(int64_t)a3;
+ (void)_setCurrentOverridePolicy:(int64_t)a3 forType:(int64_t)a4;
+ (void)_setWatchPrefersSalientToneAndVibration:(BOOL)a3;
+ (void)playAlertForType:(int64_t)a3;
+ (void)playToneAndVibrationForType:(int64_t)a3;
- (BOOL)_hasSynchronizedVibrationUnmatchedWithTone;
- (BOOL)playWithCompletionHandler:(id)a3 targetQueue:(id)a4;
- (NSString)toneIdentifier;
- (NSString)vibrationIdentifier;
- (TLAlert)initWithType:(int64_t)a3;
- (TLAlert)initWithType:(int64_t)a3 accountIdentifier:(id)a4;
- (TLAlert)initWithType:(int64_t)a3 toneIdentifier:(id)a4 vibrationIdentifier:(id)a5;
- (TLAlertConfiguration)configuration;
- (TLAlertPlaybackObserver)playbackObserver;
- (id)_descriptionForDebugging:(BOOL)a3;
- (id)_initWithConfiguration:(id)a3 toneIdentifier:(id)a4 vibrationIdentifier:(id)a5 hasSynchronizedVibrationUnmatchedWithTone:(BOOL)a6;
- (id)debugDescription;
- (id)description;
- (int64_t)type;
- (void)_updateAudioVolumeDynamicallyToValue:(float)a3;
- (void)play;
- (void)playWithCompletionHandler:(id)a3;
- (void)preheatWithCompletionHandler:(id)a3;
- (void)setPlaybackObserver:(id)a3;
- (void)stop;
- (void)stopWithOptions:(id)a3;
@end

@implementation TLAlert

+ (void)playToneAndVibrationForType:(int64_t)a3
{
}

- (TLAlert)initWithType:(int64_t)a3
{
  v4 = [[TLAlertConfiguration alloc] initWithType:a3];
  v5 = +[TLAlert alertWithConfiguration:v4];

  return v5;
}

- (TLAlert)initWithType:(int64_t)a3 accountIdentifier:(id)a4
{
  id v6 = a4;
  v7 = [[TLAlertConfiguration alloc] initWithType:a3];
  [(TLAlertConfiguration *)v7 setTopic:v6];

  v8 = +[TLAlert alertWithConfiguration:v7];

  return v8;
}

- (TLAlert)initWithType:(int64_t)a3 toneIdentifier:(id)a4 vibrationIdentifier:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  v10 = [[TLAlertConfiguration alloc] initWithType:a3];
  [(TLAlertConfiguration *)v10 setToneIdentifier:v9];

  [(TLAlertConfiguration *)v10 setVibrationIdentifier:v8];
  v11 = +[TLAlert alertWithConfiguration:v10];

  return v11;
}

- (BOOL)playWithCompletionHandler:(id)a3 targetQueue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v20 = 0;
  v21 = &v20;
  uint64_t v22 = 0x2020000000;
  char v23 = 1;
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x2020000000;
  char v19 = 1;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __61__TLAlert_Deprecated__playWithCompletionHandler_targetQueue___block_invoke;
  v11[3] = &unk_1E6C212C8;
  v14 = &v16;
  v15 = &v20;
  id v8 = v6;
  id v13 = v8;
  id v9 = v7;
  id v12 = v9;
  [(TLAlert *)self playWithCompletionHandler:v11];
  *((unsigned char *)v17 + 24) = 0;
  LOBYTE(self) = *((unsigned char *)v21 + 24);

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v20, 8);

  return (char)self;
}

void __61__TLAlert_Deprecated__playWithCompletionHandler_targetQueue___block_invoke(void *a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (*(unsigned char *)(*(void *)(a1[6] + 8) + 24))
  {
    if (a2 == 5) {
      *(unsigned char *)(*(void *)(a1[7] + 8) + 24) = 0;
    }
  }
  else
  {
    id v6 = (void (**)(void))a1[5];
    if (v6)
    {
      id v8 = v5;
      id v7 = a1[4];
      if (v7) {
        dispatch_async(v7, v6);
      }
      else {
        v6[2](v6);
      }
      id v5 = v8;
    }
  }
}

+ (void)playAlertForType:(int64_t)a3
{
  v4 = [[TLAlertConfiguration alloc] initWithType:a3];
  v3 = +[TLAlert alertWithConfiguration:v4];
  [v3 playWithCompletionHandler:0];
}

+ (TLAlert)alertWithConfiguration:(id)a3
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  v4 = a3;
  uint64_t v5 = [v4 type];
  if ((unint64_t)(v5 - 1) > 0x1C)
  {
    char v19 = 0;
    goto LABEL_27;
  }
  unint64_t v6 = v5;
  v51 = (objc_class *)a1;
  id v7 = [v4 toneIdentifier];
  id v8 = [v4 externalToneFileURL];
  uint64_t v9 = [v4 externalToneMediaLibraryItemIdentifier];
  v10 = [v4 vibrationIdentifier];
  v11 = [v4 externalVibrationPattern];
  v54 = [v4 externalVibrationPatternFileURL];
  uint64_t v12 = [v4 topic];
  uint64_t v50 = [v4 targetDevice];
  uint64_t v13 = +[TLToneManager sharedToneManager];
  v52 = (void *)v13;
  v53 = (void *)v12;
  if (v8)
  {
    v14 = NSString;
    uint64_t v15 = [v8 path];
    uint64_t v16 = [MEMORY[0x1E4F29128] UUID];
    v17 = [v16 UUIDString];
    uint64_t v18 = [v14 stringWithFormat:@"externalTone:%@-%@", v15, v17];

    id v7 = (void *)v15;
LABEL_11:

    id v7 = (void *)v18;
    goto LABEL_12;
  }
  if (v9)
  {
    uint64_t v20 = NSString;
    v21 = [MEMORY[0x1E4F29128] UUID];
    uint64_t v22 = [v21 UUIDString];
    uint64_t v18 = [v20 stringWithFormat:@"mediaLibrary:%llu-%@", v9, v22];

    id v7 = v21;
    goto LABEL_11;
  }
  char v23 = (void *)v13;
  if (![v7 length] || !v50 && (objc_msgSend(v23, "toneWithIdentifierIsValid:", v7) & 1) == 0)
  {
    uint64_t v18 = [v23 currentToneIdentifierForAlertType:v6 topic:v12];
    goto LABEL_11;
  }
LABEL_12:
  v24 = +[TLCapabilitiesManager sharedCapabilitiesManager];
  int v25 = [v24 hasVibratorCapability];

  v26 = v11;
  if (!v25)
  {
    uint64_t v34 = 0;
    char v35 = 1;
    goto LABEL_20;
  }
  v27 = +[TLVibrationManager sharedVibrationManager];
  if (!v11)
  {
    if (v54)
    {
      v36 = NSString;
      v37 = [v54 path];
      v38 = [MEMORY[0x1E4F29128] UUID];
      [v38 UUIDString];
      v40 = v39 = v27;
      uint64_t v33 = [v36 stringWithFormat:@"externalVibration:%@-%@", v37, v40];

      v27 = v39;
      goto LABEL_18;
    }
    if (!-[NSObject length](v10, "length") || ([v27 vibrationWithIdentifierIsValid:v10] & 1) == 0)
    {
      if (v50 == 1) {
        [v27 _synchronizedVibrationIdentifierForToneIdentifier:v7 targetDevice:1];
      }
      else {
      uint64_t v43 = [v27 currentVibrationIdentifierForAlertType:v6 topic:v53];
      }

      v10 = v43;
      v26 = 0;
    }
    char v55 = 1;
    v44 = [v27 _sanitizeVibrationIdentifier:v10 forAlertType:v6 topic:0 targetDevice:v50 correspondingToneIdentifier:v7 didFallbackToCurrentVibrationIdentifier:&v55];
    uint64_t v45 = [v44 isEqualToString:v10];
    if (v45)
    {
      uint64_t v34 = 0;
      if (![v10 hasPrefix:@"synchronizedvibration:"] || !v55) {
        goto LABEL_45;
      }
      v46 = TLLogPlayback();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        v57 = v10;
        __int16 v58 = 2114;
        v59 = v7;
        _os_log_impl(&dword_1DB936000, v46, OS_LOG_TYPE_DEFAULT, "Instantiating alert with synchronized vibration (%{public}@), which does not match the associated tone (%{public}@).", buf, 0x16u);
      }
    }
    else
    {
      v47 = TLLogPlayback();
      if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
      {
        NSStringFromTLAlertType(v6);
        v49 = uint64_t v48 = v45;
        *(_DWORD *)buf = 138544130;
        v57 = v10;
        __int16 v58 = 2114;
        v59 = v49;
        __int16 v60 = 2114;
        v61 = v7;
        __int16 v62 = 2114;
        v63 = v44;
        _os_log_impl(&dword_1DB936000, v47, OS_LOG_TYPE_DEFAULT, "Sanitizing vibrationIdentifier: %{public}@, for alert type: %{public}@, toneIdentifier: %{public}@. Using instead vibrationIdentifier: %{public}@.", buf, 0x2Au);

        uint64_t v45 = v48;
      }

      v46 = v10;
      v10 = v44;
    }

    uint64_t v34 = v45;
    v26 = 0;
LABEL_45:

    goto LABEL_19;
  }
  v28 = NSString;
  uint64_t v29 = [v11 hash];
  v30 = [MEMORY[0x1E4F29128] UUID];
  [v30 UUIDString];
  v32 = v31 = v27;
  uint64_t v33 = [v28 stringWithFormat:@"externalVibration:%llu-%@", v29, v32];

  v27 = v31;
LABEL_18:
  uint64_t v34 = 0;
  v10 = v33;
LABEL_19:
  char v35 = [v10 isEqualToString:@"<none>"] ^ 1;

LABEL_20:
  if (![v7 isEqualToString:@"<none>"] || (v35 & 1) != 0)
  {
    char v19 = (void *)[[v51 alloc] _initWithConfiguration:v4 toneIdentifier:v7 vibrationIdentifier:v10 hasSynchronizedVibrationUnmatchedWithTone:v34];
  }
  else
  {
    v41 = TLLogPlayback();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v57 = v4;
      _os_log_impl(&dword_1DB936000, v41, OS_LOG_TYPE_DEFAULT, "Nothing to be played for alert configuration: %{public}@. Returning a nil alert.", buf, 0xCu);
    }

    char v19 = 0;
  }

LABEL_27:

  return (TLAlert *)v19;
}

- (id)_initWithConfiguration:(id)a3 toneIdentifier:(id)a4 vibrationIdentifier:(id)a5 hasSynchronizedVibrationUnmatchedWithTone:(BOOL)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  v22.receiver = self;
  v22.super_class = (Class)TLAlert;
  v14 = [(TLAlert *)&v22 init];
  if (v14)
  {
    uint64_t v15 = +[TLCapabilitiesManager sharedCapabilitiesManager];
    int v16 = [v15 isInternalInstall];

    if (v16) {
      v14->_instanceIndex = atomic_fetch_add(&_initWithConfiguration_toneIdentifier_vibrationIdentifier_hasSynchronizedVibrationUnmatchedWithTone___TLAlertLastAllocatedInstanceIndex, 1uLL)+ 1;
    }
    [v11 _freeze];
    objc_storeStrong((id *)&v14->_configuration, a3);
    v14->_type = [v11 type];
    uint64_t v17 = [v12 copy];
    toneIdentifier = v14->_toneIdentifier;
    v14->_toneIdentifier = (NSString *)v17;

    uint64_t v19 = [v13 copy];
    vibrationIdentifier = v14->_vibrationIdentifier;
    v14->_vibrationIdentifier = (NSString *)v19;

    v14->_hasSynchronizedVibrationUnmatchedWithTone = a6;
  }

  return v14;
}

- (void)play
{
}

- (void)playWithCompletionHandler:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = TLLogPlayback();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = [(TLAlert *)self debugDescription];
    id v7 = (void *)v6;
    id v8 = "!= NULL";
    if (!v4) {
      id v8 = "== NULL";
    }
    int v10 = 138543618;
    uint64_t v11 = v6;
    __int16 v12 = 2082;
    id v13 = v8;
    _os_log_impl(&dword_1DB936000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: -play…: completionHandler %{public}s.", (uint8_t *)&v10, 0x16u);
  }
  uint64_t v9 = +[TLAlertController sharedAlertController];
  [v9 playAlert:self withCompletionHandler:v4];
}

- (void)stop
{
}

- (void)stopWithOptions:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = TLLogPlayback();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    uint64_t v11 = self;
    __int16 v12 = 2114;
    id v13 = v4;
    _os_log_impl(&dword_1DB936000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: -stop…: options = %{public}@.", buf, 0x16u);
  }

  uint64_t v6 = (void *)[v4 copy];
  id v7 = +[TLAlertController sharedAlertController];
  uint64_t v9 = self;
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v9 count:1];
  [v7 stopPlayingAlerts:v8 withOptions:v6 playbackCompletionType:2];
}

- (void)preheatWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = +[TLAlertController sharedAlertController];
  [v5 preheatForAlert:self completionHandler:v4];
}

+ (BOOL)_watchPrefersSalientToneAndVibration
{
  v2 = +[TLToneManager sharedToneManager];
  char v3 = [v2 _watchPrefersSalientNotifications];

  return v3;
}

+ (void)_setWatchPrefersSalientToneAndVibration:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = +[TLToneManager sharedToneManager];
  [v4 _setWatchPrefersSalientNotifications:v3];
}

+ (int64_t)_currentOverridePolicyForType:(int64_t)a3
{
  id v4 = +[TLToneManager sharedToneManager];
  int64_t v5 = [v4 _currentOverridePolicyForAlertType:a3];

  return v5;
}

+ (void)_setCurrentOverridePolicy:(int64_t)a3 forType:(int64_t)a4
{
  id v6 = +[TLToneManager sharedToneManager];
  [v6 _setCurrentOverridePolicy:a3 forAlertType:a4];
}

+ (BOOL)_stopAllAlerts
{
  v2 = TLLogPlayback();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_1DB936000, v2, OS_LOG_TYPE_DEFAULT, "+[TLAlert _stopAllAlerts] was called.", v6, 2u);
  }

  BOOL v3 = +[TLAlertController sharedAlertController];
  char v4 = [v3 stopAllAlerts];

  return v4;
}

- (void)_updateAudioVolumeDynamicallyToValue:(float)a3
{
  id v6 = +[TLAlertController sharedAlertController];
  *(float *)&double v5 = a3;
  [v6 updateAudioVolumeDynamicallyForAlert:self toValue:v5];
}

- (id)_descriptionForDebugging:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = objc_alloc(MEMORY[0x1E4F28E78]);
  id v6 = (objc_class *)objc_opt_class();
  id v7 = NSStringFromClass(v6);
  id v8 = (void *)[v5 initWithFormat:@"<%@: %p", v7, self];

  if (self->_instanceIndex >= 1) {
    objc_msgSend(v8, "appendFormat:", @" [%ld]", self->_instanceIndex);
  }
  if (v3)
  {
    uint64_t v9 = [(TLAlertConfiguration *)self->_configuration description];
  }
  else
  {
    int v10 = NSString;
    uint64_t v11 = (objc_class *)objc_opt_class();
    __int16 v12 = NSStringFromClass(v11);
    configuration = self->_configuration;
    uint64_t v14 = _TLAlertTypeGetHumanReadableDescription(self->_type);
    uint64_t v9 = [v10 stringWithFormat:@"<%@: %p type = %@>", v12, configuration, v14];;
  }
  [v8 appendFormat:@"; configuration = %@", v9];
  if ([(NSString *)self->_toneIdentifier length]) {
    [v8 appendFormat:@"; toneIdentifier = \"%@\"", self->_toneIdentifier];
  }
  if ([(NSString *)self->_vibrationIdentifier length]) {
    [v8 appendFormat:@"; vibrationIdentifier = \"%@\"", self->_vibrationIdentifier];
  }
  [v8 appendString:@">"];

  return v8;
}

- (id)description
{
  return [(TLAlert *)self _descriptionForDebugging:0];
}

- (id)debugDescription
{
  return [(TLAlert *)self _descriptionForDebugging:1];
}

- (BOOL)_hasSynchronizedVibrationUnmatchedWithTone
{
  return self->_hasSynchronizedVibrationUnmatchedWithTone;
}

- (TLAlertPlaybackObserver)playbackObserver
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_playbackObserver);

  return (TLAlertPlaybackObserver *)WeakRetained;
}

- (void)setPlaybackObserver:(id)a3
{
}

- (TLAlertConfiguration)configuration
{
  return self->_configuration;
}

- (int64_t)type
{
  return self->_type;
}

- (NSString)toneIdentifier
{
  return self->_toneIdentifier;
}

- (NSString)vibrationIdentifier
{
  return self->_vibrationIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vibrationIdentifier, 0);
  objc_storeStrong((id *)&self->_toneIdentifier, 0);
  objc_storeStrong((id *)&self->_configuration, 0);

  objc_destroyWeak((id *)&self->_playbackObserver);
}

@end
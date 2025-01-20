@interface TLSystemSound
- (BOOL)isValid;
- (BOOL)requiresLongFormPlayback;
- (NSURL)soundFileURL;
- (TLSystemSound)initWithSoundFileURL:(id)a3 soundID:(unsigned int)a4 requiresLongFormPlayback:(BOOL)a5;
- (id)_description;
- (id)description;
- (unsigned)soundID;
- (void)_ensureUnderlyingSoundCreated;
- (void)_prepareForDealloc;
- (void)beginRequiringUnderlyingSoundLoaded;
- (void)dealloc;
- (void)endRequiringUnderlyingSoundLoaded;
@end

@implementation TLSystemSound

- (TLSystemSound)initWithSoundFileURL:(id)a3 soundID:(unsigned int)a4 requiresLongFormPlayback:(BOOL)a5
{
  id v8 = a3;
  v14.receiver = self;
  v14.super_class = (Class)TLSystemSound;
  v9 = [(TLSystemSound *)&v14 init];
  v10 = v9;
  if (v9)
  {
    v9->_lock._os_unfair_lock_opaque = 0;
    uint64_t v11 = [v8 copy];
    soundFileURL = v10->_soundFileURL;
    v10->_soundFileURL = (NSURL *)v11;

    v10->_soundID = a4;
    v10->_requiresLongFormPlayback = a5;
  }

  return v10;
}

- (void)dealloc
{
  p_lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(p_lock);
  [(TLSystemSound *)self _prepareForDealloc];
  os_unfair_lock_unlock(p_lock);
  v4.receiver = self;
  v4.super_class = (Class)TLSystemSound;
  [(TLSystemSound *)&v4 dealloc];
}

- (void)_prepareForDealloc
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  os_unfair_lock_assert_owner(&self->_lock);
  if (self->_shouldDisposeOfSoundID)
  {
    OSStatus v3 = AudioServicesDisposeSystemSoundID(self->_soundID);
    objc_super v4 = TLLogPlayback();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = [(TLSystemSound *)self _description];
      uint64_t soundID = self->_soundID;
      int v7 = 138543874;
      id v8 = v5;
      __int16 v9 = 2048;
      uint64_t v10 = soundID;
      __int16 v11 = 2048;
      uint64_t v12 = v3;
      _os_log_impl(&dword_1DB936000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: -_prepareForDealloc. AudioServicesDisposeSystemSoundID for uint64_t soundID = %lu returned %ld.", (uint8_t *)&v7, 0x20u);
    }
  }
}

- (id)description
{
  p_lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(p_lock);
  objc_super v4 = [(TLSystemSound *)self _description];
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (id)_description
{
  os_unfair_lock_assert_owner(&self->_lock);
  OSStatus v3 = (void *)MEMORY[0x1E4F28E78];
  objc_super v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [v3 stringWithFormat:@"<%@: %p", v5, self];

  if (self->_soundFileURL) {
    [v6 appendFormat:@"; soundFileURL = %@", self->_soundFileURL];
  }
  unsigned int soundID = self->_soundID;
  if (soundID == kSystemSoundID_InvalidTone)
  {
    id v8 = @"; wasSoundCreated = NO";
LABEL_7:
    [v6 appendString:v8];
    goto LABEL_9;
  }
  if (soundID == kSystemSoundID_NoneTone)
  {
    id v8 = @"; soundID = kSystemSoundID_NoneTone";
    goto LABEL_7;
  }
  objc_msgSend(v6, "appendFormat:", @"; unsigned int soundID = %lu", self->_soundID);
LABEL_9:
  if (self->_requiresLongFormPlayback) {
    [v6 appendString:@"; requiresLongFormPlayback = YES"];
  }
  [v6 appendString:@">"];

  return v6;
}

- (BOOL)isValid
{
  os_unfair_lock_assert_not_owner(&self->_lock);
  unsigned int v3 = [(TLSystemSound *)self soundID];
  return v3 != kSystemSoundID_NoneTone && v3 != kSystemSoundID_InvalidTone;
}

- (unsigned)soundID
{
  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(p_lock);
  [(TLSystemSound *)v2 _ensureUnderlyingSoundCreated];
  LODWORD(v2) = v2->_soundID;
  os_unfair_lock_unlock(p_lock);
  return v2;
}

- (void)beginRequiringUnderlyingSoundLoaded
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  unsigned int v3 = [a1 _description];
  int v4 = 138543362;
  v5 = v3;
  _os_log_debug_impl(&dword_1DB936000, a2, OS_LOG_TYPE_DEBUG, "%{public}@: -beginRequiringUnderlyingSoundLoaded.", (uint8_t *)&v4, 0xCu);
}

- (void)endRequiringUnderlyingSoundLoaded
{
}

- (void)_ensureUnderlyingSoundCreated
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  os_unfair_lock_assert_owner(&self->_lock);
  if (self->_soundID == kSystemSoundID_InvalidTone)
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    int v4 = v3;
    soundFileURL = self->_soundFileURL;
    if (soundFileURL) {
      [v3 setObject:soundFileURL forKey:*MEMORY[0x1E4F18A00]];
    }
    if (self->_requiresLongFormPlayback) {
      [v4 setObject:MEMORY[0x1E4F1CC38] forKey:*MEMORY[0x1E4F18A08]];
    }
    if (![v4 count]) {
      goto LABEL_10;
    }
    int SystemSoundIDWithOptions = AudioServicesCreateSystemSoundIDWithOptions();
    int v7 = TLLogPlayback();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = [(TLSystemSound *)self _description];
      __int16 v9 = self->_soundFileURL;
      uint64_t soundID = self->_soundID;
      int v11 = 138544130;
      uint64_t v12 = v8;
      __int16 v13 = 2114;
      objc_super v14 = v9;
      __int16 v15 = 2048;
      uint64_t v16 = soundID;
      __int16 v17 = 2048;
      uint64_t v18 = SystemSoundIDWithOptions;
      _os_log_impl(&dword_1DB936000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: -_ensureUnderlyingSoundCreated. AudioServicesCreateSystemSoundIDWithOptions for URL %{public}@ produced uint64_t soundID = %lu and returned %ld.", (uint8_t *)&v11, 0x2Au);
    }
    if (!SystemSoundIDWithOptions) {
      self->_shouldDisposeOfSoundID = 1;
    }
    else {
LABEL_10:
    }
      self->_uint64_t soundID = kSystemSoundID_NoneTone;
  }
}

- (NSURL)soundFileURL
{
  return self->_soundFileURL;
}

- (BOOL)requiresLongFormPlayback
{
  return self->_requiresLongFormPlayback;
}

- (void).cxx_destruct
{
}

@end
@interface _UIDefaultFocusSoundPlayer
+ (id)sharedInstance;
- (NSMutableDictionary)focusSoundPools;
- (NSMutableDictionary)urlPools;
- (NSTimer)unregisterTimer;
- (OS_dispatch_queue)soundQueue;
- (id)_init;
- (void)_playSystemSound:(unsigned int)a3 behavior:(unsigned int)a4 withVolume:(double)a5 pan:(double)a6;
- (void)_registerForSystemSoundsIfNecessary;
- (void)dealloc;
- (void)playSoundWithFocusSound:(int64_t)a3 volume:(double)a4 pan:(double)a5;
- (void)playSoundWithURL:(id)a3 volume:(double)a4 pan:(double)a5;
- (void)setFocusSoundPools:(id)a3;
- (void)setSoundQueue:(id)a3;
- (void)setUnregisterTimer:(id)a3;
- (void)setUrlPools:(id)a3;
@end

@implementation _UIDefaultFocusSoundPlayer

- (id)_init
{
  v15.receiver = self;
  v15.super_class = (Class)_UIDefaultFocusSoundPlayer;
  v2 = [(_UIDefaultFocusSoundPlayer *)&v15 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    urlPools = v2->_urlPools;
    v2->_urlPools = v3;

    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    focusSoundPools = v2->_focusSoundPools;
    v2->_focusSoundPools = v5;

    v7 = [[_UIFocusSoundPool alloc] initWithSystemSoundID:1125];
    [(NSMutableDictionary *)v2->_focusSoundPools setObject:v7 forKeyedSubscript:&unk_1ED3F40F8];

    v8 = [[_UIFocusSoundPool alloc] initWithSystemSoundID:1127];
    [(NSMutableDictionary *)v2->_focusSoundPools setObject:v8 forKeyedSubscript:&unk_1ED3F4110];

    v9 = [[_UIFocusSoundPool alloc] initWithSystemSoundID:1126];
    [(NSMutableDictionary *)v2->_focusSoundPools setObject:v9 forKeyedSubscript:&unk_1ED3F4128];

    v10 = [[_UIFocusSoundPool alloc] initWithSystemSoundID:1124];
    [(NSMutableDictionary *)v2->_focusSoundPools setObject:v10 forKeyedSubscript:&unk_1ED3F4140];

    v11 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
    dispatch_queue_t v12 = dispatch_queue_create("com.apple.UIKit.FocusSounds", v11);
    soundQueue = v2->_soundQueue;
    v2->_soundQueue = (OS_dispatch_queue *)v12;

    [(_UIDefaultFocusSoundPlayer *)v2 _registerForSystemSoundsIfNecessary];
  }
  return v2;
}

- (void)_registerForSystemSoundsIfNecessary
{
  unregisterTimer = self->_unregisterTimer;
  if (unregisterTimer)
  {
    [(NSTimer *)unregisterTimer invalidate];
    v4 = self->_unregisterTimer;
    self->_unregisterTimer = 0;
  }
  else
  {
    v4 = +[UIDevice currentDevice];
    [v4 _registerForSystemSounds:self];
  }

  objc_initWeak(&location, self);
  v5 = (void *)MEMORY[0x1E4F1CB00];
  uint64_t v9 = MEMORY[0x1E4F143A8];
  uint64_t v10 = 3221225472;
  v11 = __65___UIDefaultFocusSoundPlayer__registerForSystemSoundsIfNecessary__block_invoke;
  dispatch_queue_t v12 = &unk_1E52DAB28;
  objc_copyWeak(&v13, &location);
  v6 = [v5 timerWithTimeInterval:0 repeats:&v9 block:10.0];
  v7 = self->_unregisterTimer;
  self->_unregisterTimer = v6;

  v8 = objc_msgSend(MEMORY[0x1E4F1CAC0], "mainRunLoop", v9, v10, v11, v12);
  [v8 addTimer:self->_unregisterTimer forMode:*MEMORY[0x1E4F1C4B0]];

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

+ (id)sharedInstance
{
  if (_MergedGlobals_1049 != -1) {
    dispatch_once(&_MergedGlobals_1049, &__block_literal_global_212);
  }
  v2 = (void *)qword_1EB260738;
  return v2;
}

- (void)dealloc
{
  unregisterTimer = self->_unregisterTimer;
  if (unregisterTimer)
  {
    [(NSTimer *)unregisterTimer invalidate];
    v4 = self->_unregisterTimer;
    self->_unregisterTimer = 0;
  }
  v5 = +[UIDevice currentDevice];
  [v5 _unregisterForSystemSounds:self];

  v6.receiver = self;
  v6.super_class = (Class)_UIDefaultFocusSoundPlayer;
  [(_UIDefaultFocusSoundPlayer *)&v6 dealloc];
}

- (void)playSoundWithURL:(id)a3 volume:(double)a4 pan:(double)a5
{
  id v9 = a3;
  if (!v9)
  {
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"_UIFocusSoundGenerator.m", 368, @"Invalid parameter not satisfying: %@", @"url" object file lineNumber description];

    id v9 = 0;
  }
  if (fabs(a4) >= 2.22044605e-16)
  {
    id v12 = v9;
    uint64_t v10 = [(NSMutableDictionary *)self->_urlPools objectForKeyedSubscript:v9];
    if (!v10)
    {
      uint64_t v10 = [[_UIFocusSoundPool alloc] initWithSoundFileURL:v12];
      [(NSMutableDictionary *)self->_urlPools setObject:v10 forKeyedSubscript:v12];
    }
    [(_UIDefaultFocusSoundPlayer *)self _playSystemSound:[(_UIFocusSoundPool *)v10 playableSystemSoundID] behavior:[(_UIFocusSoundPool *)v10 originalSystemSoundID] withVolume:a4 pan:a5];

    id v9 = v12;
  }
}

- (void)playSoundWithFocusSound:(int64_t)a3 volume:(double)a4 pan:(double)a5
{
  if (a3 && fabs(a4) >= 2.22044605e-16)
  {
    focusSoundPools = self->_focusSoundPools;
    id v9 = objc_msgSend(NSNumber, "numberWithInteger:");
    id v10 = [(NSMutableDictionary *)focusSoundPools objectForKeyedSubscript:v9];

    -[_UIDefaultFocusSoundPlayer _playSystemSound:behavior:withVolume:pan:](self, "_playSystemSound:behavior:withVolume:pan:", [v10 playableSystemSoundID], objc_msgSend(v10, "originalSystemSoundID"), a4, a5);
  }
}

- (void)_playSystemSound:(unsigned int)a3 behavior:(unsigned int)a4 withVolume:(double)a5 pan:(double)a6
{
  [(_UIDefaultFocusSoundPlayer *)self _registerForSystemSoundsIfNecessary];
  v11 = +[UIDevice currentDevice];
  int v12 = [v11 _isSystemSoundEnabled];

  if (v12)
  {
    soundQueue = self->_soundQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __71___UIDefaultFocusSoundPlayer__playSystemSound_behavior_withVolume_pan___block_invoke;
    block[3] = &__block_descriptor_56_e5_v8__0l;
    *(double *)&block[4] = a5;
    *(double *)&block[5] = a6;
    unsigned int v15 = a4;
    unsigned int v16 = a3;
    dispatch_async(soundQueue, block);
  }
}

- (NSMutableDictionary)urlPools
{
  return self->_urlPools;
}

- (void)setUrlPools:(id)a3
{
}

- (NSMutableDictionary)focusSoundPools
{
  return self->_focusSoundPools;
}

- (void)setFocusSoundPools:(id)a3
{
}

- (OS_dispatch_queue)soundQueue
{
  return self->_soundQueue;
}

- (void)setSoundQueue:(id)a3
{
}

- (NSTimer)unregisterTimer
{
  return self->_unregisterTimer;
}

- (void)setUnregisterTimer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unregisterTimer, 0);
  objc_storeStrong((id *)&self->_soundQueue, 0);
  objc_storeStrong((id *)&self->_focusSoundPools, 0);
  objc_storeStrong((id *)&self->_urlPools, 0);
}

@end
@interface SoundClassificationListener
+ (id)sharedInstance;
- (BOOL)isFalsePositive:(double)a3;
- (SoundClassificationListener)init;
- (void)dealloc;
- (void)startListen;
- (void)stopListen;
@end

@implementation SoundClassificationListener

- (void)stopListen
{
  self->isListenerON = 0;
}

- (void)startListen
{
  if (!self->isListenerON) {
    self->isListenerON = 1;
  }
}

- (BOOL)isFalsePositive:(double)a3
{
  return 0;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)SoundClassificationListener;
  [(SoundClassificationListener *)&v2 dealloc];
}

- (SoundClassificationListener)init
{
  v3.receiver = self;
  v3.super_class = (Class)SoundClassificationListener;
  result = [(SoundClassificationListener *)&v3 init];
  if (result)
  {
    result->isListenerON = 0;
    *(_OWORD *)&result->mLastSoundClassEvent.startTimeSecs = xmmword_222805870;
    result->mLastSoundClassEvent.type = 0;
    result->mSoundClassEventIndex = 0;
  }
  return result;
}

+ (id)sharedInstance
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __45__SoundClassificationListener_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (+[SoundClassificationListener sharedInstance]::onceToken != -1) {
    dispatch_once(&+[SoundClassificationListener sharedInstance]::onceToken, block);
  }
  objc_super v2 = (void *)+[SoundClassificationListener sharedInstance]::sharedSoundClassificationListener;

  return v2;
}

uint64_t __45__SoundClassificationListener_sharedInstance__block_invoke(uint64_t a1)
{
  +[SoundClassificationListener sharedInstance]::sharedSoundClassificationListener = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));

  return MEMORY[0x270F9A758]();
}

@end
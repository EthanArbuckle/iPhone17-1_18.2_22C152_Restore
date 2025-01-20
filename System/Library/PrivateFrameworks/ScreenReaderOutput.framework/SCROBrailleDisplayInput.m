@interface SCROBrailleDisplayInput
+ (id)sharedInstance;
- (BOOL)currentBrailleChordBeganWithSpacebar;
- (BOOL)currentBrailleChordContainsNonSpacebarChordableKey;
- (BOOL)currentBrailleChordContainsSpacebar;
- (BOOL)isQuiet;
- (BOOL)memorizeNextKeyImmediately;
- (BOOL)newDown;
- (BOOL)prepareToMemorizeNextKey;
- (BOOL)requestPrepareToMemorizeNextKey;
- (BOOL)skipBrailleKeyboardKeyTranslation;
- (BOOL)spacebarIsDown;
- (BOOL)willMemorizeNow;
- (__CFArray)currentBrailleChord;
- (__CFArray)currentChord;
- (__CFSet)downBrailleDots;
- (__CFSet)downKeys;
- (double)brailleCharExponentialMovingAverage;
- (double)brailleTranslationTimeout;
- (double)busySince;
- (double)lastBrailleChordPosted;
- (double)lastBrailleChordTypingTime;
- (double)memorizeNextKeyImmediatelyTimeout;
- (double)nextWillMemorizeNotificationTime;
- (double)quietSince;
- (unsigned)currentBrailleModifiers;
- (unsigned)currentHIDCommand;
- (unsigned)downBrailleModifiers;
- (unsigned)routerEvent;
- (void)dealloc;
- (void)setBrailleCharExponentialMovingAverage:(double)a3;
- (void)setBrailleTranslationTimeout:(double)a3;
- (void)setBusySince:(double)a3;
- (void)setCurrentBrailleChord:(__CFArray *)a3;
- (void)setCurrentBrailleChordBeganWithSpacebar:(BOOL)a3;
- (void)setCurrentBrailleChordContainsNonSpacebarChordableKey:(BOOL)a3;
- (void)setCurrentBrailleChordContainsSpacebar:(BOOL)a3;
- (void)setCurrentBrailleModifiers:(unsigned int)a3;
- (void)setCurrentChord:(__CFArray *)a3;
- (void)setCurrentHIDCommand:(unsigned int)a3;
- (void)setDownBrailleDots:(__CFSet *)a3;
- (void)setDownBrailleModifiers:(unsigned int)a3;
- (void)setDownKeys:(__CFSet *)a3;
- (void)setIsQuiet:(BOOL)a3;
- (void)setLastBrailleChordPosted:(double)a3;
- (void)setLastBrailleChordTypingTime:(double)a3;
- (void)setMemorizeNextKeyImmediately:(BOOL)a3;
- (void)setMemorizeNextKeyImmediatelyTimeout:(double)a3;
- (void)setNewDown:(BOOL)a3;
- (void)setNextWillMemorizeNotificationTime:(double)a3;
- (void)setPrepareToMemorizeNextKey:(BOOL)a3;
- (void)setQuietSince:(double)a3;
- (void)setRequestPrepareToMemorizeNextKey:(BOOL)a3;
- (void)setRouterEvent:(unsigned int)a3;
- (void)setSkipBrailleKeyboardKeyTranslation:(BOOL)a3;
- (void)setSpacebarIsDown:(BOOL)a3;
- (void)setWillMemorizeNow:(BOOL)a3;
@end

@implementation SCROBrailleDisplayInput

- (void)dealloc
{
  downKeys = self->_downKeys;
  if (downKeys)
  {
    CFRelease(downKeys);
    self->_downKeys = 0;
  }
  currentChord = self->_currentChord;
  if (currentChord)
  {
    CFRelease(currentChord);
    self->_currentChord = 0;
  }
  currentBrailleChord = self->_currentBrailleChord;
  if (currentBrailleChord)
  {
    CFRelease(currentBrailleChord);
    self->_currentBrailleChord = 0;
  }
  downBrailleDots = self->_downBrailleDots;
  if (downBrailleDots)
  {
    CFRelease(downBrailleDots);
    self->_downBrailleDots = 0;
  }
  v7.receiver = self;
  v7.super_class = (Class)SCROBrailleDisplayInput;
  [(SCROBrailleDisplayInput *)&v7 dealloc];
}

+ (id)sharedInstance
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __41__SCROBrailleDisplayInput_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, block);
  }
  v2 = (void *)sharedInstance_instance;

  return v2;
}

uint64_t __41__SCROBrailleDisplayInput_sharedInstance__block_invoke(uint64_t a1)
{
  sharedInstance_instance = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));

  return MEMORY[0x270F9A758]();
}

- (double)quietSince
{
  return self->_quietSince;
}

- (void)setQuietSince:(double)a3
{
  self->_quietSince = a3;
}

- (double)busySince
{
  return self->_busySince;
}

- (void)setBusySince:(double)a3
{
  self->_busySince = a3;
}

- (double)nextWillMemorizeNotificationTime
{
  return self->_nextWillMemorizeNotificationTime;
}

- (void)setNextWillMemorizeNotificationTime:(double)a3
{
  self->_nextWillMemorizeNotificationTime = a3;
}

- (double)memorizeNextKeyImmediatelyTimeout
{
  return self->_memorizeNextKeyImmediatelyTimeout;
}

- (void)setMemorizeNextKeyImmediatelyTimeout:(double)a3
{
  self->_memorizeNextKeyImmediatelyTimeout = a3;
}

- (BOOL)prepareToMemorizeNextKey
{
  return self->_prepareToMemorizeNextKey;
}

- (void)setPrepareToMemorizeNextKey:(BOOL)a3
{
  self->_prepareToMemorizeNextKey = a3;
}

- (BOOL)requestPrepareToMemorizeNextKey
{
  return self->_requestPrepareToMemorizeNextKey;
}

- (void)setRequestPrepareToMemorizeNextKey:(BOOL)a3
{
  self->_requestPrepareToMemorizeNextKey = a3;
}

- (BOOL)memorizeNextKeyImmediately
{
  return self->_memorizeNextKeyImmediately;
}

- (void)setMemorizeNextKeyImmediately:(BOOL)a3
{
  self->_memorizeNextKeyImmediately = a3;
}

- (BOOL)willMemorizeNow
{
  return self->_willMemorizeNow;
}

- (void)setWillMemorizeNow:(BOOL)a3
{
  self->_willMemorizeNow = a3;
}

- (BOOL)isQuiet
{
  return self->_isQuiet;
}

- (void)setIsQuiet:(BOOL)a3
{
  self->_isQuiet = a3;
}

- (BOOL)newDown
{
  return self->_newDown;
}

- (void)setNewDown:(BOOL)a3
{
  self->_newDown = a3;
}

- (__CFArray)currentChord
{
  return self->_currentChord;
}

- (void)setCurrentChord:(__CFArray *)a3
{
  self->_currentChord = a3;
}

- (__CFSet)downKeys
{
  return self->_downKeys;
}

- (void)setDownKeys:(__CFSet *)a3
{
  self->_downKeys = a3;
}

- (unsigned)routerEvent
{
  return self->_routerEvent;
}

- (void)setRouterEvent:(unsigned int)a3
{
  self->_routerEvent = a3;
}

- (BOOL)currentBrailleChordContainsSpacebar
{
  return self->_currentBrailleChordContainsSpacebar;
}

- (void)setCurrentBrailleChordContainsSpacebar:(BOOL)a3
{
  self->_currentBrailleChordContainsSpacebar = a3;
}

- (BOOL)currentBrailleChordBeganWithSpacebar
{
  return self->_currentBrailleChordBeganWithSpacebar;
}

- (void)setCurrentBrailleChordBeganWithSpacebar:(BOOL)a3
{
  self->_currentBrailleChordBeganWithSpacebar = a3;
}

- (BOOL)currentBrailleChordContainsNonSpacebarChordableKey
{
  return self->_currentBrailleChordContainsNonSpacebarChordableKey;
}

- (void)setCurrentBrailleChordContainsNonSpacebarChordableKey:(BOOL)a3
{
  self->_currentBrailleChordContainsNonSpacebarChordableKey = a3;
}

- (BOOL)spacebarIsDown
{
  return self->_spacebarIsDown;
}

- (void)setSpacebarIsDown:(BOOL)a3
{
  self->_spacebarIsDown = a3;
}

- (BOOL)skipBrailleKeyboardKeyTranslation
{
  return self->_skipBrailleKeyboardKeyTranslation;
}

- (void)setSkipBrailleKeyboardKeyTranslation:(BOOL)a3
{
  self->_skipBrailleKeyboardKeyTranslation = a3;
}

- (double)lastBrailleChordTypingTime
{
  return self->_lastBrailleChordTypingTime;
}

- (void)setLastBrailleChordTypingTime:(double)a3
{
  self->_lastBrailleChordTypingTime = a3;
}

- (__CFArray)currentBrailleChord
{
  return self->_currentBrailleChord;
}

- (void)setCurrentBrailleChord:(__CFArray *)a3
{
  self->_currentBrailleChord = a3;
}

- (__CFSet)downBrailleDots
{
  return self->_downBrailleDots;
}

- (void)setDownBrailleDots:(__CFSet *)a3
{
  self->_downBrailleDots = a3;
}

- (unsigned)currentHIDCommand
{
  return self->_currentHIDCommand;
}

- (void)setCurrentHIDCommand:(unsigned int)a3
{
  self->_currentHIDCommand = a3;
}

- (unsigned)currentBrailleModifiers
{
  return self->_currentBrailleModifiers;
}

- (void)setCurrentBrailleModifiers:(unsigned int)a3
{
  self->_currentBrailleModifiers = a3;
}

- (unsigned)downBrailleModifiers
{
  return self->_downBrailleModifiers;
}

- (void)setDownBrailleModifiers:(unsigned int)a3
{
  self->_downBrailleModifiers = a3;
}

- (double)lastBrailleChordPosted
{
  return self->_lastBrailleChordPosted;
}

- (void)setLastBrailleChordPosted:(double)a3
{
  self->_lastBrailleChordPosted = a3;
}

- (double)brailleCharExponentialMovingAverage
{
  return self->_brailleCharExponentialMovingAverage;
}

- (void)setBrailleCharExponentialMovingAverage:(double)a3
{
  self->_brailleCharExponentialMovingAverage = a3;
}

- (double)brailleTranslationTimeout
{
  return self->_brailleTranslationTimeout;
}

- (void)setBrailleTranslationTimeout:(double)a3
{
  self->_brailleTranslationTimeout = a3;
}

@end
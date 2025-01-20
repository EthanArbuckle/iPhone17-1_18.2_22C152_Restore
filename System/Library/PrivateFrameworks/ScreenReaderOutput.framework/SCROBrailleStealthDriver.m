@interface SCROBrailleStealthDriver
- (BOOL)isDriverLoaded;
- (BOOL)isInputEnabled;
- (BOOL)isSleeping;
- (BOOL)postsKeyboardEvents;
- (BOOL)setMainCells:(const char *)a3 length:(int64_t)a4;
- (BOOL)setStatusCells:(const char *)a3 length:(int64_t)a4;
- (BOOL)supportsBlinkingCursor;
- (BOOL)unloadDriver;
- (SCROBrailleStealthDriver)init;
- (id)getInputEvents;
- (id)modelIdentifier;
- (int)brailleInputMode;
- (int)loadDriverWithIOElement:(id)a3;
- (int64_t)mainSize;
- (int64_t)statusSize;
- (unint64_t)interfaceVersion;
- (void)dealloc;
@end

@implementation SCROBrailleStealthDriver

- (SCROBrailleStealthDriver)init
{
  v3.receiver = self;
  v3.super_class = (Class)SCROBrailleStealthDriver;
  result = [(SCROBrailleStealthDriver *)&v3 init];
  if (result) {
    result->_isDriverLoaded = 0;
  }
  return result;
}

- (void)dealloc
{
  [(SCROBrailleStealthDriver *)self unloadDriver];
  v3.receiver = self;
  v3.super_class = (Class)SCROBrailleStealthDriver;
  [(SCROBrailleStealthDriver *)&v3 dealloc];
}

- (unint64_t)interfaceVersion
{
  return 4;
}

- (int)loadDriverWithIOElement:(id)a3
{
  if (self->_isDriverLoaded) {
    [(SCROBrailleStealthDriver *)self unloadDriver];
  }
  modelIdentifier = self->_modelIdentifier;
  self->_modelIdentifier = (NSString *)@"com.apple.scrod.braille.driver.stealth.caption";

  *(_OWORD *)&self->_mainSize = xmmword_21C6B98C0;
  self->_isDriverLoaded = 1;
  return 0;
}

- (BOOL)unloadDriver
{
  if (self->_isDriverLoaded) {
    self->_isDriverLoaded = 0;
  }
  return 1;
}

- (BOOL)isDriverLoaded
{
  return 0;
}

- (BOOL)isSleeping
{
  return 0;
}

- (id)modelIdentifier
{
  return self->_modelIdentifier;
}

- (BOOL)supportsBlinkingCursor
{
  return 0;
}

- (BOOL)isInputEnabled
{
  return 0;
}

- (BOOL)postsKeyboardEvents
{
  return 0;
}

- (int)brailleInputMode
{
  return 0;
}

- (int64_t)mainSize
{
  return self->_mainSize;
}

- (int64_t)statusSize
{
  return self->_statusSize;
}

- (id)getInputEvents
{
  return 0;
}

- (BOOL)setMainCells:(const char *)a3 length:(int64_t)a4
{
  return 1;
}

- (BOOL)setStatusCells:(const char *)a3 length:(int64_t)a4
{
  return 1;
}

- (void).cxx_destruct
{
}

@end
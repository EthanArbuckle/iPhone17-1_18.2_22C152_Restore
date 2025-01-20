@interface SCROVirtualBrailleDriver
- (BOOL)isDriverLoaded;
- (BOOL)isInputEnabled;
- (BOOL)isSleeping;
- (BOOL)postsKeyboardEvents;
- (BOOL)setMainCells:(const char *)a3 length:(int64_t)a4;
- (BOOL)setStatusCells:(const char *)a3 length:(int64_t)a4;
- (BOOL)supportsBlinkingCursor;
- (BOOL)unloadDriver;
- (SCROVirtualBrailleDriver)initWithMainSize:(int64_t)a3 delegate:(id)a4;
- (id)getInputEvents;
- (id)modelIdentifier;
- (int)brailleInputMode;
- (int)loadDriverWithIOElement:(id)a3;
- (int64_t)mainSize;
- (int64_t)statusSize;
- (unint64_t)interfaceVersion;
- (void)enqueueDot:(int64_t)a3 down:(BOOL)a4;
- (void)enqueuePan:(BOOL)a3 down:(BOOL)a4;
- (void)enqueueRouter:(unint64_t)a3 down:(BOOL)a4;
- (void)enqueueSpaceWithDown:(BOOL)a3;
@end

@implementation SCROVirtualBrailleDriver

- (SCROVirtualBrailleDriver)initWithMainSize:(int64_t)a3 delegate:(id)a4
{
  id v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)SCROVirtualBrailleDriver;
  v8 = [(SCROVirtualBrailleDriver *)&v16 init];
  v9 = v8;
  if (v8)
  {
    v8->_mainSize = a3;
    objc_storeStrong((id *)&v8->_delegate, a4);
    v10 = objc_opt_new();
    if (a3 >= 1)
    {
      do
      {
        [v10 appendString:@"⠀"];
        --a3;
      }
      while (a3);
    }
    mainCells = v9->_mainCells;
    v9->_mainCells = (NSString *)v10;
    id v12 = v10;

    uint64_t v13 = objc_opt_new();
    enqueuedEvents = v9->_enqueuedEvents;
    v9->_enqueuedEvents = (NSMutableArray *)v13;
  }
  return v9;
}

- (int)loadDriverWithIOElement:(id)a3
{
  return 0;
}

- (int64_t)mainSize
{
  return self->_mainSize;
}

- (int64_t)statusSize
{
  return 0;
}

- (id)modelIdentifier
{
  return @"com.apple.scrod.braille.driver.virtual";
}

- (unint64_t)interfaceVersion
{
  return 4;
}

- (int)brailleInputMode
{
  return 2;
}

- (BOOL)postsKeyboardEvents
{
  return 1;
}

- (id)getInputEvents
{
  [(NSLock *)self->_eventLock lock];
  v3 = (void *)[(NSMutableArray *)self->_enqueuedEvents copy];
  [(NSMutableArray *)self->_enqueuedEvents removeAllObjects];
  [(NSLock *)self->_eventLock unlock];

  return v3;
}

- (BOOL)isDriverLoaded
{
  return 1;
}

- (BOOL)isInputEnabled
{
  return 1;
}

- (BOOL)isSleeping
{
  return 0;
}

- (BOOL)setMainCells:(const char *)a3 length:(int64_t)a4
{
  id v7 = objc_opt_new();
  if (self->_mainSize >= 1)
  {
    int64_t v8 = 0;
    do
    {
      if (v8 >= a4)
      {
        [v7 appendString:@"⠀"];
      }
      else
      {
        v9 = (void *)[objc_alloc(MEMORY[0x263F2BA70]) initWithBits:a3[v8]];
        v10 = [v9 unicode];

        [v7 appendString:v10];
      }
      ++v8;
    }
    while (v8 < self->_mainSize);
  }
  mainCells = self->_mainCells;
  self->_mainCells = (NSString *)v7;
  id v12 = v7;

  [(SCROVirtualBrailleDriverDelegate *)self->_delegate didSetMainCells:v12];
  return 1;
}

- (void)enqueuePan:(BOOL)a3 down:(BOOL)a4
{
  if (a4) {
    int v5 = 65542;
  }
  else {
    int v5 = 6;
  }
  if (a3) {
    int v6 = 8608;
  }
  else {
    int v6 = 8624;
  }
  uint64_t v7 = v5 | v6;
  [(NSLock *)self->_eventLock lock];
  enqueuedEvents = self->_enqueuedEvents;
  v9 = [NSNumber numberWithUnsignedInt:v7];
  [(NSMutableArray *)enqueuedEvents addObject:v9];

  eventLock = self->_eventLock;

  [(NSLock *)eventLock unlock];
}

- (void)enqueueDot:(int64_t)a3 down:(BOOL)a4
{
  if ((unint64_t)(a3 - 9) >= 0xFFFFFFFFFFFFFFF8)
  {
    uint64_t v16 = v5;
    uint64_t v17 = v4;
    if (a4) {
      int v11 = 65538;
    }
    else {
      int v11 = 2;
    }
    uint64_t v12 = v11 | ((a3 << 8) - 256) & 0xFFFEFFFF;
    [(NSLock *)self->_eventLock lock];
    enqueuedEvents = self->_enqueuedEvents;
    v14 = [NSNumber numberWithUnsignedInt:v12];
    [(NSMutableArray *)enqueuedEvents addObject:v14];

    eventLock = self->_eventLock;
    [(NSLock *)eventLock unlock];
  }
}

- (void)enqueueSpaceWithDown:(BOOL)a3
{
  if (a3) {
    uint64_t v4 = 67586;
  }
  else {
    uint64_t v4 = 2050;
  }
  [(NSLock *)self->_eventLock lock];
  enqueuedEvents = self->_enqueuedEvents;
  uint64_t v6 = [NSNumber numberWithUnsignedInt:v4];
  [(NSMutableArray *)enqueuedEvents addObject:v6];

  eventLock = self->_eventLock;

  [(NSLock *)eventLock unlock];
}

- (void)enqueueRouter:(unint64_t)a3 down:(BOOL)a4
{
  if (a4) {
    int v5 = 0x10000;
  }
  else {
    int v5 = 0;
  }
  uint64_t v6 = (a3 << 8) & 0xFFFEFFFF | v5;
  [(NSLock *)self->_eventLock lock];
  enqueuedEvents = self->_enqueuedEvents;
  uint64_t v8 = [NSNumber numberWithUnsignedInt:v6];
  [(NSMutableArray *)enqueuedEvents addObject:v8];

  eventLock = self->_eventLock;

  [(NSLock *)eventLock unlock];
}

- (BOOL)setStatusCells:(const char *)a3 length:(int64_t)a4
{
  return 1;
}

- (BOOL)supportsBlinkingCursor
{
  return 1;
}

- (BOOL)unloadDriver
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventLock, 0);
  objc_storeStrong((id *)&self->_enqueuedEvents, 0);
  objc_storeStrong((id *)&self->_mainCells, 0);

  objc_storeStrong((id *)&self->_delegate, 0);
}

@end
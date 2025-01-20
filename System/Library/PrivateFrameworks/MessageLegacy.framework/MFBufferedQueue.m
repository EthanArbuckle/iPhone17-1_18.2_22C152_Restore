@interface MFBufferedQueue
- (BOOL)_flush;
- (BOOL)addItem:(id)a3;
- (BOOL)flushIfNecessary;
- (BOOL)handleItems:(id)a3;
- (BOOL)isEmpty;
- (MFBufferedQueue)init;
- (MFBufferedQueue)initWithMaximumSize:(unsigned int)a3 latency:(double)a4;
- (double)maximumLatency;
- (unint64_t)sizeForItem:(id)a3;
- (unsigned)maximumSize;
- (unsigned)size;
- (void)dealloc;
- (void)removeAllObjects;
- (void)setMaximumLatency:(double)a3;
- (void)setMaximumSize:(unsigned int)a3;
@end

@implementation MFBufferedQueue

- (MFBufferedQueue)initWithMaximumSize:(unsigned int)a3 latency:(double)a4
{
  v9.receiver = self;
  v9.super_class = (Class)MFBufferedQueue;
  v6 = [(MFBufferedQueue *)&v9 init];
  if (v6)
  {
    CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
    v6->_maximumSize = a3;
    v6->_maximumLatency = a4;
    v6->_timeOfLastFlush = Current;
  }
  return v6;
}

- (MFBufferedQueue)init
{
  return [(MFBufferedQueue *)self initWithMaximumSize:0 latency:1.0];
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)MFBufferedQueue;
  [(MFBufferedQueue *)&v3 dealloc];
}

- (BOOL)addItem:(id)a3
{
  self->_currentSize += -[MFBufferedQueue sizeForItem:](self, "sizeForItem:");
  queue = self->_queue;
  if (!queue)
  {
    queue = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    self->_queue = queue;
  }
  [(NSMutableArray *)queue addObject:a3];
  [(MFBufferedQueue *)self flushIfNecessary];
  return 1;
}

- (void)removeAllObjects
{
  self->_timeOfLastFlush = CFAbsoluteTimeGetCurrent();
  self->_currentSize = 0;
}

- (BOOL)_flush
{
  if ([(NSMutableArray *)self->_queue count])
  {
    objc_super v3 = (void *)[objc_alloc(MEMORY[0x1E4F1C978]) initWithArray:self->_queue];
    [(MFBufferedQueue *)self removeAllObjects];
    if (v3)
    {
      BOOL v4 = [(MFBufferedQueue *)self handleItems:v3];

      return v4;
    }
  }
  else
  {
    [(MFBufferedQueue *)self removeAllObjects];
  }
  return 1;
}

- (BOOL)flushIfNecessary
{
  if (self->_currentSize < self->_maximumSize
    && CFAbsoluteTimeGetCurrent() <= self->_timeOfLastFlush + self->_maximumLatency)
  {
    return 1;
  }
  return [(MFBufferedQueue *)self _flush];
}

- (BOOL)isEmpty
{
  return [(NSMutableArray *)self->_queue count] == 0;
}

- (unint64_t)sizeForItem:(id)a3
{
  return 1;
}

- (BOOL)handleItems:(id)a3
{
  return 1;
}

- (unsigned)size
{
  return self->_currentSize;
}

- (unsigned)maximumSize
{
  return self->_maximumSize;
}

- (void)setMaximumSize:(unsigned int)a3
{
  self->_maximumSize = a3;
}

- (double)maximumLatency
{
  return self->_maximumLatency;
}

- (void)setMaximumLatency:(double)a3
{
  self->_maximumLatency = a3;
}

@end
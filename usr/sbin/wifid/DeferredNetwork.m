@interface DeferredNetwork
- (BOOL)doesContain:(__WiFiNetwork *)a3;
- (BOOL)setDeferredNetwork:(__WiFiNetwork *)a3;
- (DeferredNetwork)init;
- (NSString)ssid;
- (double)timeSinceFirstDeferral:(__WiFiNetwork *)a3;
- (void)dealloc;
- (void)reset;
@end

@implementation DeferredNetwork

- (DeferredNetwork)init
{
  v7.receiver = self;
  v7.super_class = (Class)DeferredNetwork;
  v4 = [(DeferredNetwork *)&v7 init];
  v5 = v4;
  if (v4)
  {
    v4->_firstSeen = 0.0;
    v4->_history = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
  }
  return v5;
}

- (void)dealloc
{
  history = self->_history;
  if (history) {

  }
  v5.receiver = self;
  v5.super_class = (Class)DeferredNetwork;
  [(DeferredNetwork *)&v5 dealloc];
}

- (BOOL)doesContain:(__WiFiNetwork *)a3
{
  history = self->_history;
  if (history) {
    unsigned __int8 v7 = [(NSMutableArray *)history containsObject:a3];
  }
  else {
    unsigned __int8 v7 = 0;
  }
  return v7;
}

- (BOOL)setDeferredNetwork:(__WiFiNetwork *)a3
{
  history = self->_history;
  if (history)
  {
    if (![(NSMutableArray *)self->_history count])
    {
      +[NSDate timeIntervalSinceReferenceDate];
      self->_firstSeen = v7;
      self->_ssid = (NSString *)[(id)sub_10001A43C(a3) copy];
    }
    if ((unint64_t)[(NSMutableArray *)self->_history count] >= 0xA) {
      [(NSMutableArray *)self->_history removeObjectAtIndex:0];
    }
    [(NSMutableArray *)self->_history addObject:a3];
  }
  return history != 0;
}

- (double)timeSinceFirstDeferral:(__WiFiNetwork *)a3
{
  history = self->_history;
  if (history && [(NSMutableArray *)history count] && self->_firstSeen != 0.0)
  {
    +[NSDate timeIntervalSinceReferenceDate];
    double v8 = v7 - self->_firstSeen;
  }
  else
  {
    if (qword_10027DD68) {
      [(id)qword_10027DD68 WFLog:3, "%s: %@ not previously time-deferred", "-[DeferredNetwork timeSinceFirstDeferral:]", sub_10001A43C(a3) message];
    }
    double v8 = 0.0;
  }
  return v8;
}

- (void)reset
{
  self->_firstSeen = 0.0;
  [(NSMutableArray *)self->_history removeAllObjects];
}

- (NSString)ssid
{
  return self->_ssid;
}

@end
@interface RBPLEvent
- (RBPLEvent)initWithevent:(unint64_t)a3 identity:(id)a4 assertionCount:(int)a5 pid:(int)a6;
- (RBSProcessIdentity)identity;
- (int)assertionCount;
- (int)pid;
- (unint64_t)event;
@end

@implementation RBPLEvent

- (void).cxx_destruct
{
}

- (RBPLEvent)initWithevent:(unint64_t)a3 identity:(id)a4 assertionCount:(int)a5 pid:(int)a6
{
  id v11 = a4;
  v15.receiver = self;
  v15.super_class = (Class)RBPLEvent;
  v12 = [(RBPLEvent *)&v15 init];
  v13 = v12;
  if (v12)
  {
    v12->_event = a3;
    objc_storeStrong((id *)&v12->_identity, a4);
    v13->_assertionCount = a5;
    v13->_pid = a6;
  }

  return v13;
}

- (int)pid
{
  return self->_pid;
}

- (RBSProcessIdentity)identity
{
  return self->_identity;
}

- (unint64_t)event
{
  return self->_event;
}

- (int)assertionCount
{
  return self->_assertionCount;
}

@end
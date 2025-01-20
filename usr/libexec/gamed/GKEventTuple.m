@interface GKEventTuple
- (id)context;
- (unint64_t)eventType;
- (void)setContext:(id)a3;
- (void)setEventType:(unint64_t)a3;
@end

@implementation GKEventTuple

- (unint64_t)eventType
{
  return self->_eventType;
}

- (void)setEventType:(unint64_t)a3
{
  self->_eventType = a3;
}

- (id)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
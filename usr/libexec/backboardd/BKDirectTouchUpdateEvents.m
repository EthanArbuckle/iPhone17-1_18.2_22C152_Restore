@interface BKDirectTouchUpdateEvents
- (void)invalidate;
@end

@implementation BKDirectTouchUpdateEvents

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_directTouchState, 0);
  objc_storeStrong((id *)&self->_didUpdateEventCollector, 0);

  objc_storeStrong((id *)&self->_updateGenerations, 0);
}

- (void)invalidate
{
  directTouchState = self->_directTouchState;
  self->_directTouchState = 0;
}

@end
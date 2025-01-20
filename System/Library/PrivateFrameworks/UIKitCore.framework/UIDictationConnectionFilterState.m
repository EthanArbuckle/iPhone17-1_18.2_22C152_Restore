@interface UIDictationConnectionFilterState
- (__CFString)transform;
- (id)pendingDictationCommand;
- (void)setPendingDictationCommand:(id)a3;
- (void)setTransform:(__CFString *)a3;
@end

@implementation UIDictationConnectionFilterState

- (__CFString)transform
{
  return self->_transform;
}

- (void)setTransform:(__CFString *)a3
{
  self->_transform = a3;
}

- (id)pendingDictationCommand
{
  return self->_pendingDictationCommand;
}

- (void)setPendingDictationCommand:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
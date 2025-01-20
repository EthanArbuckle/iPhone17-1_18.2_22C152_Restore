@interface SBInvalidateItemContainerBackdropEventResponse
- (SBInvalidateItemContainerBackdropEventResponse)initWithUpdateMode:(int64_t)a3;
- (int64_t)type;
- (int64_t)updateMode;
@end

@implementation SBInvalidateItemContainerBackdropEventResponse

- (SBInvalidateItemContainerBackdropEventResponse)initWithUpdateMode:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SBInvalidateItemContainerBackdropEventResponse;
  result = [(SBChainableModifierEventResponse *)&v5 init];
  if (result) {
    result->_updateMode = a3;
  }
  return result;
}

- (int64_t)type
{
  return 30;
}

- (int64_t)updateMode
{
  return self->_updateMode;
}

@end
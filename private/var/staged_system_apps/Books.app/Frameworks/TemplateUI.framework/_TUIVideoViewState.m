@interface _TUIVideoViewState
- (BOOL)muted;
- (_TUIVideoViewState)initWithMuteState:(BOOL)a3;
@end

@implementation _TUIVideoViewState

- (_TUIVideoViewState)initWithMuteState:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_TUIVideoViewState;
  result = [(_TUIVideoViewState *)&v5 init];
  if (result) {
    result->_muted = a3;
  }
  return result;
}

- (BOOL)muted
{
  return self->_muted;
}

@end
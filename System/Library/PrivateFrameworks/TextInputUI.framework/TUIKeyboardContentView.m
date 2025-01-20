@interface TUIKeyboardContentView
- (BOOL)_userInteractionStateDeterminesLayerHitTestState;
@end

@implementation TUIKeyboardContentView

- (BOOL)_userInteractionStateDeterminesLayerHitTestState
{
  return 1;
}

@end
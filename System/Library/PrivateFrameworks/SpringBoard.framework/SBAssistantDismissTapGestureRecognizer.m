@interface SBAssistantDismissTapGestureRecognizer
- (BOOL)_shouldReceiveTouch:(id)a3 withEvent:(id)a4;
@end

@implementation SBAssistantDismissTapGestureRecognizer

- (BOOL)_shouldReceiveTouch:(id)a3 withEvent:(id)a4
{
  id v5 = a3;
  v6 = SBHIDEventTouchIdentifiersForHitTestCategory([a4 _hidEvent], 1);
  unsigned int v7 = [v5 _touchIdentifier];

  LOBYTE(v5) = [v6 containsIndex:v7] ^ 1;
  return (char)v5;
}

@end
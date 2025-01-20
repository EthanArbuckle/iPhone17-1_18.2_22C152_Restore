@interface TMLUIBarButtonItemActionTarget
- (void)action:(id)a3;
@end

@implementation TMLUIBarButtonItemActionTarget

- (void)action:(id)a3
{
  objc_msgSend_emitTMLSignal_withArguments_(a3, a2, v3, @"action", 0);
}

@end
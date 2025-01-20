@interface STKMutableSessionBehavior
- (void)setDismissesAfterUserEvent:(BOOL)a3;
- (void)setShouldSendResponseUponDisplay:(BOOL)a3;
- (void)setTimeout:(double)a3;
@end

@implementation STKMutableSessionBehavior

- (void)setTimeout:(double)a3
{
  self->super._timeout = a3;
}

- (void)setShouldSendResponseUponDisplay:(BOOL)a3
{
  self->super._shouldSendResponseUponDisplay = a3;
}

- (void)setDismissesAfterUserEvent:(BOOL)a3
{
  self->super._dismissesAfterUserEvent = a3;
}

@end
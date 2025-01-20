@interface PageTurnController
- (void)quicklyTurnedPagesTimerFired:(id)a3;
@end

@implementation PageTurnController

- (void)quicklyTurnedPagesTimerFired:(id)a3
{
  *(void *)self->pageTurned = 0;
}

@end
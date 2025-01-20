@interface SBNotificationBannerDestinationTestActionRunner
- (BOOL)shouldForwardAction;
- (void)executeAction:(id)a3 fromOrigin:(id)a4 endpoint:(id)a5 withParameters:(id)a6 completion:(id)a7;
- (void)setShouldForwardAction:(BOOL)a3;
@end

@implementation SBNotificationBannerDestinationTestActionRunner

- (void)executeAction:(id)a3 fromOrigin:(id)a4 endpoint:(id)a5 withParameters:(id)a6 completion:(id)a7
{
  if (a7) {
    (*((void (**)(id, uint64_t))a7 + 2))(a7, 1);
  }
}

- (BOOL)shouldForwardAction
{
  return self->_shouldForwardAction;
}

- (void)setShouldForwardAction:(BOOL)a3
{
  self->_shouldForwardAction = a3;
}

@end
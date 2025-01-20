@interface SBSecureAppViewController
- (BOOL)handleEvent:(id)a3;
- (void)_updateDisplayLayoutElementForActivation:(id)a3;
@end

@implementation SBSecureAppViewController

- (BOOL)handleEvent:(id)a3
{
  id v4 = a3;
  if ([v4 type] == 13)
  {
    v5 = [v4 value];
    int v6 = [v5 BOOLValue];

    if (v6)
    {
      v7 = [(SBDashBoardHostedAppViewController *)self delegate];
      [v7 secureAppViewControllerDidAuthenticate:self];
    }
  }
  v10.receiver = self;
  v10.super_class = (Class)SBSecureAppViewController;
  BOOL v8 = [(SBDashBoardHostedAppViewController *)&v10 handleEvent:v4];

  return v8;
}

- (void)_updateDisplayLayoutElementForActivation:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SBSecureAppViewController;
  id v3 = a3;
  [(SBDashBoardHostedAppViewController *)&v7 _updateDisplayLayoutElementForActivation:v3];
  id v4 = +[SBCoverSheetPresentationManager sharedInstance];
  v5 = [v4 coverSheetWindow];
  [v5 level];
  [v3 setLevel:(uint64_t)v6];
}

@end
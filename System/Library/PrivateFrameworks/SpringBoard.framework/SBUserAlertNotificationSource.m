@interface SBUserAlertNotificationSource
- (BOOL)canPresentMultipleAlertItemsSimultaneously;
- (BOOL)presentsAlertItemsModally;
- (NCNotificationDispatcher)dispatcher;
- (SBUserAlertNotificationSource)initWithDispatcher:(id)a3;
- (void)alertItemsController:(id)a3 didDeactivateAlertItem:(id)a4 forReason:(int)a5;
- (void)alertItemsController:(id)a3 willActivateAlertItem:(id)a4;
- (void)dealloc;
- (void)dismissAlertItem:(id)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)presentAlertItem:(id)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)setDispatcher:(id)a3;
@end

@implementation SBUserAlertNotificationSource

- (SBUserAlertNotificationSource)initWithDispatcher:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SBUserAlertNotificationSource;
  v6 = [(SBUserAlertNotificationSource *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_dispatcher, a3);
    v8 = +[SBAlertItemsController sharedInstance];
    [v8 addObserver:v7];
  }
  return v7;
}

- (void)dealloc
{
  v3 = +[SBAlertItemsController sharedInstance];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)SBUserAlertNotificationSource;
  [(SBUserAlertNotificationSource *)&v4 dealloc];
}

- (BOOL)presentsAlertItemsModally
{
  return 0;
}

- (BOOL)canPresentMultipleAlertItemsSimultaneously
{
  return 1;
}

- (void)presentAlertItem:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  v9 = (void (**)(void))a5;
  v7 = [MEMORY[0x1E4FB37F0] notificationRequestForLockScreenWithAlertItem:a3];
  v8 = [(SBUserAlertNotificationSource *)self dispatcher];
  [v8 postNotificationWithRequest:v7];

  if (v9) {
    v9[2]();
  }
}

- (void)dismissAlertItem:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  v9 = (void (**)(void))a5;
  v7 = [MEMORY[0x1E4FB37F0] notificationRequestForLockScreenWithAlertItem:a3];
  v8 = [(SBUserAlertNotificationSource *)self dispatcher];
  [v8 withdrawNotificationWithRequest:v7];

  if (v9) {
    v9[2]();
  }
}

- (void)alertItemsController:(id)a3 willActivateAlertItem:(id)a4
{
  id v7 = a4;
  if ([v7 allowInCar])
  {
    id v5 = [MEMORY[0x1E4FB37F0] notificationRequestForCarPlayWithAlertItem:v7];
    v6 = [(SBUserAlertNotificationSource *)self dispatcher];
    [v6 postNotificationWithRequest:v5];
  }
}

- (void)alertItemsController:(id)a3 didDeactivateAlertItem:(id)a4 forReason:(int)a5
{
  id v12 = a3;
  id v8 = a4;
  v9 = v8;
  if (a5 != 1 && [v8 allowInCar])
  {
    objc_super v10 = [MEMORY[0x1E4FB37F0] notificationRequestForCarPlayWithAlertItem:v9];
    v11 = [(SBUserAlertNotificationSource *)self dispatcher];
    [v11 withdrawNotificationWithRequest:v10];
  }
}

- (NCNotificationDispatcher)dispatcher
{
  return self->_dispatcher;
}

- (void)setDispatcher:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
@interface COSTinkerHealthSharingSyncSetupController
- (COSTinkerHealthSharingSyncSetupController)init;
- (void)setDelegate:(id)a3;
- (void)setupSharingIfReady;
- (void)viewDidAppear:(BOOL)a3;
@end

@implementation COSTinkerHealthSharingSyncSetupController

- (COSTinkerHealthSharingSyncSetupController)init
{
  v3 = objc_alloc_init(COSTinkerHealthSharingSetupDelegate);
  v7.receiver = self;
  v7.super_class = (Class)COSTinkerHealthSharingSyncSetupController;
  v4 = [(COSTinkerHealthSharingSyncSetupController *)&v7 initWithStyle:1 delegate:v3];
  v5 = v4;
  if (v4)
  {
    objc_storeStrong((id *)&v4->_setupDelegate, v3);
    [(COSTinkerHealthSharingSetupDelegate *)v5->_setupDelegate setPresentingController:v5];
  }

  return v5;
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)COSTinkerHealthSharingSyncSetupController;
  [(COSTinkerHealthSharingSyncSetupController *)&v4 viewDidAppear:a3];
  self->_viewDidAppear = 1;
  [(COSTinkerHealthSharingSyncSetupController *)self setupSharingIfReady];
}

- (void)setDelegate:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10002EFB8;
  v4[3] = &unk_100243908;
  v4[4] = self;
  id v5 = a3;
  id v3 = v5;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v4);
}

- (void)setupSharingIfReady
{
  if (self->_viewDidAppear && self->_didSetDelegate) {
    [(COSTinkerHealthSharingSyncSetupController *)self setupSharing];
  }
}

- (void).cxx_destruct
{
}

@end
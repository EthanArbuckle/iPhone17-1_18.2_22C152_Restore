@interface BFFFinishSetupFaceIDViewController
- (BFFFinishSetupFaceIDViewController)init;
- (NSString)passcode;
- (id)completion;
- (void)faceIDViewController:(id)a3 didCompleteWithResult:(unint64_t)a4 pushedViewControllers:(id)a5;
- (void)setCompletion:(id)a3;
- (void)setPasscode:(id)a3;
@end

@implementation BFFFinishSetupFaceIDViewController

- (BFFFinishSetupFaceIDViewController)init
{
  v6.receiver = self;
  v6.super_class = (Class)BFFFinishSetupFaceIDViewController;
  v2 = [(BFFFaceIDViewController *)&v6 init];
  v3 = v2;
  if (v2)
  {
    [(BFFFaceIDViewController *)v2 setFaceIDViewControllerDelegate:v2];
    [(BFFFaceIDViewController *)v3 setCompletesOnCancel:1];
    v4 = [MEMORY[0x263F67FF0] currentDevice];
    [(BFFFaceIDViewController *)v3 setDeviceProvider:v4];

    [(BFFFaceIDViewController *)v3 setEnrollmentConfiguration:1];
  }
  return v3;
}

- (void)faceIDViewController:(id)a3 didCompleteWithResult:(unint64_t)a4 pushedViewControllers:(id)a5
{
  id v10 = a3;
  id v7 = a5;
  completion = (void (**)(void))self->_completion;
  if (completion)
  {
    completion[2]();
    id v9 = self->_completion;
    self->_completion = 0;
  }
}

- (NSString)passcode
{
  return self->_passcode;
}

- (void)setPasscode:(id)a3
{
}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_passcode, 0);
}

@end
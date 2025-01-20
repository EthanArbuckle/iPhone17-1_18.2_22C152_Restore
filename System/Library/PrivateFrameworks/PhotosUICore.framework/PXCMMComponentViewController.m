@interface PXCMMComponentViewController
- (PXCMMComponentViewController)initWithCoder:(id)a3;
- (PXCMMComponentViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (PXCMMComponentViewController)initWithSession:(id)a3;
- (PXCMMSession)session;
- (double)preferredContentHeightForWidth:(double)a3;
@end

@implementation PXCMMComponentViewController

- (void).cxx_destruct
{
}

- (PXCMMSession)session
{
  return self->_session;
}

- (double)preferredContentHeightForWidth:(double)a3
{
  return 0.0;
}

- (PXCMMComponentViewController)initWithSession:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PXCMMComponentViewController;
  v6 = [(PXCMMComponentViewController *)&v9 initWithNibName:0 bundle:0];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_session, a3);
  }

  return v7;
}

- (PXCMMComponentViewController)initWithCoder:(id)a3
{
  id v5 = a3;
  v6 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXCMMComponentViewController.m", 27, @"%s is not available as initializer", "-[PXCMMComponentViewController initWithCoder:]");

  abort();
}

- (PXCMMComponentViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  objc_super v9 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXCMMComponentViewController.m", 23, @"%s is not available as initializer", "-[PXCMMComponentViewController initWithNibName:bundle:]");

  abort();
}

@end
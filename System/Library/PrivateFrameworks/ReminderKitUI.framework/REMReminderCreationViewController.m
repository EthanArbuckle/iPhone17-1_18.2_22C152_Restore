@interface REMReminderCreationViewController
- (REMReminderCreationDelegate)delegate;
- (REMReminderCreationViewController)initWithDelegate:(id)a3;
- (void)remoteViewControllerDidLoad:(id)a3 setupCompletion:(id)a4;
- (void)sendDidCreate:(BOOL)a3 error:(id)a4;
- (void)viewServiceDidCancel;
- (void)viewServiceDidFailWithError:(id)a3;
- (void)viewServiceDidFinish;
@end

@implementation REMReminderCreationViewController

- (REMReminderCreationViewController)initWithDelegate:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)REMReminderCreationViewController;
  v6 = [(REMReminderCreationViewController *)&v9 initWithNibName:0 bundle:0];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_delegate, a3);
  }

  return v7;
}

- (void)sendDidCreate:(BOOL)a3 error:(id)a4
{
  BOOL v4 = a3;
  id v9 = a4;
  v6 = [(REMReminderCreationViewController *)self delegate];
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    v8 = [(REMReminderCreationViewController *)self delegate];
    [v8 reminderCreationViewController:self didCreateReminder:v4 error:v9];
  }
}

- (void)remoteViewControllerDidLoad:(id)a3 setupCompletion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [REMReminderCreationContext alloc];
  id v9 = [(REMReminderCreationViewController *)self delegate];
  v10 = [(REMReminderCreationContext *)v8 initWithDelegate:v9];

  [v7 displayForCreationWithContext:v10 completion:v6];
}

- (void)viewServiceDidCancel
{
  v3.receiver = self;
  v3.super_class = (Class)REMReminderCreationViewController;
  [(REMReminderServiceViewController *)&v3 viewServiceDidCancel];
  [(REMReminderCreationViewController *)self sendDidCreate:0 error:0];
}

- (void)viewServiceDidFailWithError:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)REMReminderCreationViewController;
  id v4 = a3;
  [(REMReminderServiceViewController *)&v5 viewServiceDidFailWithError:v4];
  -[REMReminderCreationViewController sendDidCreate:error:](self, "sendDidCreate:error:", 0, v4, v5.receiver, v5.super_class);
}

- (void)viewServiceDidFinish
{
  v3.receiver = self;
  v3.super_class = (Class)REMReminderCreationViewController;
  [(REMReminderServiceViewController *)&v3 viewServiceDidFinish];
  [(REMReminderCreationViewController *)self sendDidCreate:1 error:0];
}

- (REMReminderCreationDelegate)delegate
{
  return self->_delegate;
}

- (void).cxx_destruct
{
}

@end
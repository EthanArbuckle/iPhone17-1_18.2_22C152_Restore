@interface BridgedAccountPageViewControllerFactory
- (SKAccountPageViewControllerDelegate)delegate;
- (id)createAccountPageViewControllerFor:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation BridgedAccountPageViewControllerFactory

- (id)createAccountPageViewControllerFor:(id)a3
{
  v4 = (objc_class *)MEMORY[0x1E4F3C2A0];
  id v5 = a3;
  v6 = (void *)[[v4 alloc] initWithAccountURL:v5];

  v7 = [(BridgedAccountPageViewControllerFactory *)self delegate];
  [v6 setDelegate:v7];

  return v6;
}

- (SKAccountPageViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SKAccountPageViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
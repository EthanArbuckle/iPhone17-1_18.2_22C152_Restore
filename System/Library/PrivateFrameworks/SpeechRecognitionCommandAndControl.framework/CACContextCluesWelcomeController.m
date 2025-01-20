@interface CACContextCluesWelcomeController
- (BOOL)_canShowWhileLocked;
- (CACContextCluesWelcomeControllerDelegate)delegate;
- (void)setDelegate:(id)a3;
@end

@implementation CACContextCluesWelcomeController

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (CACContextCluesWelcomeControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (CACContextCluesWelcomeControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
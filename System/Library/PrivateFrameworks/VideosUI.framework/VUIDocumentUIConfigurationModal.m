@interface VUIDocumentUIConfigurationModal
- (BOOL)isModalOverModalAllowed;
- (BOOL)shouldPresentOnPresentingViewController;
- (void)setModalOverModalAllowed:(BOOL)a3;
- (void)setPresentOnPresentingVC:(BOOL)a3;
@end

@implementation VUIDocumentUIConfigurationModal

- (BOOL)isModalOverModalAllowed
{
  return self->_modalOverModalAllowed;
}

- (void)setModalOverModalAllowed:(BOOL)a3
{
  self->_modalOverModalAllowed = a3;
}

- (BOOL)shouldPresentOnPresentingViewController
{
  return self->_presentOnPresentingVC;
}

- (void)setPresentOnPresentingVC:(BOOL)a3
{
  self->_presentOnPresentingVC = a3;
}

@end
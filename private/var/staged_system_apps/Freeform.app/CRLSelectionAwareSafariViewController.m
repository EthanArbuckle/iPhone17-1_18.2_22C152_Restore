@interface CRLSelectionAwareSafariViewController
- (BOOL)staysOpenOnSelectionChange;
- (CRLSelectionAwareSafariViewController)initWithURL:(id)a3;
@end

@implementation CRLSelectionAwareSafariViewController

- (CRLSelectionAwareSafariViewController)initWithURL:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CRLSelectionAwareSafariViewController;
  result = [(CRLSelectionAwareSafariViewController *)&v4 initWithURL:a3];
  if (result) {
    result->_staysOpenOnSelectionChange = 1;
  }
  return result;
}

- (BOOL)staysOpenOnSelectionChange
{
  return self->_staysOpenOnSelectionChange;
}

@end
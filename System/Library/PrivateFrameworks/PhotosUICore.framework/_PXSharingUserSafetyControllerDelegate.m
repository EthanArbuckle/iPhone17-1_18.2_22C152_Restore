@interface _PXSharingUserSafetyControllerDelegate
- (id)action;
- (void)configureAction:(id)a3;
- (void)didConfirmForInterventionViewController:(id)a3;
- (void)didRejectForInterventionViewController:(id)a3;
@end

@implementation _PXSharingUserSafetyControllerDelegate

- (void).cxx_destruct
{
}

- (id)action
{
  return self->_action;
}

- (void)didRejectForInterventionViewController:(id)a3
{
  [a3 dismissViewControllerAnimated:1 completion:0];
  v4 = [(_PXSharingUserSafetyControllerDelegate *)self action];

  if (v4)
  {
    v5 = [(_PXSharingUserSafetyControllerDelegate *)self action];
    v5[2](v5, 0);
  }
}

- (void)didConfirmForInterventionViewController:(id)a3
{
  [a3 dismissViewControllerAnimated:1 completion:0];
  v4 = [(_PXSharingUserSafetyControllerDelegate *)self action];

  if (v4)
  {
    v5 = [(_PXSharingUserSafetyControllerDelegate *)self action];
    v5[2](v5, 1);
  }
}

- (void)configureAction:(id)a3
{
  v4 = _Block_copy(a3);
  id action = self->_action;
  self->_id action = v4;
}

@end
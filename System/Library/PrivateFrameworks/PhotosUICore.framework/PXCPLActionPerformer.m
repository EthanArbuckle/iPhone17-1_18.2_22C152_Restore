@interface PXCPLActionPerformer
- (PXCPLUIStatus)cplUIStatus;
- (void)performActionWithCPLUIStatus:(id)a3 completionHandler:(id)a4;
@end

@implementation PXCPLActionPerformer

- (void).cxx_destruct
{
}

- (PXCPLUIStatus)cplUIStatus
{
  return self->_cplUIStatus;
}

- (void)performActionWithCPLUIStatus:(id)a3 completionHandler:(id)a4
{
  v7 = (PXCPLUIStatus *)a3;
  id v10 = a4;
  if (!v7)
  {
    v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"PXCPLActionPerformer.m", 20, @"Invalid parameter not satisfying: %@", @"cplUIStatus" object file lineNumber description];
  }
  cplUIStatus = self->_cplUIStatus;
  self->_cplUIStatus = v7;

  [(PXActionPerformer *)self performActionWithCompletionHandler:v10];
}

@end
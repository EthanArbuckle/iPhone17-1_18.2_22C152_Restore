@interface PXCMMActionPerformer
- (BOOL)canPerformActionWithSession:(id)a3;
- (NSProgress)progress;
- (PXCMMSession)session;
- (id)createActionProgress;
- (id)performActionWithSession:(id)a3 completionHandler:(id)a4;
- (void)setProgress:(id)a3;
@end

@implementation PXCMMActionPerformer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_progress, 0);
  objc_storeStrong((id *)&self->_session, 0);
}

- (void)setProgress:(id)a3
{
}

- (NSProgress)progress
{
  return self->_progress;
}

- (PXCMMSession)session
{
  return self->_session;
}

- (id)createActionProgress
{
  return 0;
}

- (id)performActionWithSession:(id)a3 completionHandler:(id)a4
{
  v7 = (PXCMMSession *)a3;
  id v8 = a4;
  if (!v7)
  {
    v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"PXCMMActionManager.m", 93, @"Invalid parameter not satisfying: %@", @"session" object file lineNumber description];
  }
  session = self->_session;
  self->_session = v7;

  v10 = [(PXCMMActionPerformer *)self createActionProgress];
  [(PXCMMActionPerformer *)self setProgress:v10];

  [(PXActionPerformer *)self performActionWithCompletionHandler:v8];
  v11 = [(PXCMMActionPerformer *)self progress];

  return v11;
}

- (BOOL)canPerformActionWithSession:(id)a3
{
  return 1;
}

@end
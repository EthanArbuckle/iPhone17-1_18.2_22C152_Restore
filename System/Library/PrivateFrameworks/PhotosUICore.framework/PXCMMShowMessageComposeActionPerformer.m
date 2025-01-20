@interface PXCMMShowMessageComposeActionPerformer
- (NSURL)shareURL;
- (id)performActionWithSession:(id)a3 completionHandler:(id)a4;
- (void)performMessageComposeActionWithSession:(id)a3 shareURL:(id)a4 completionHandler:(id)a5;
@end

@implementation PXCMMShowMessageComposeActionPerformer

- (void).cxx_destruct
{
}

- (NSURL)shareURL
{
  return self->_shareURL;
}

- (id)performActionWithSession:(id)a3 completionHandler:(id)a4
{
  v6 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3, a4);
  [v6 handleFailureInMethod:a2 object:self file:@"PXCMMActionManager.m" lineNumber:206 description:@"Message composition requires a share URL"];

  return 0;
}

- (void)performMessageComposeActionWithSession:(id)a3 shareURL:(id)a4 completionHandler:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (!v10)
  {
    v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"PXCMMActionManager.m", 200, @"Invalid parameter not satisfying: %@", @"shareURL" object file lineNumber description];
  }
  objc_storeStrong((id *)&self->_shareURL, a4);
  v14.receiver = self;
  v14.super_class = (Class)PXCMMShowMessageComposeActionPerformer;
  id v12 = [(PXCMMActionPerformer *)&v14 performActionWithSession:v9 completionHandler:v11];
}

@end
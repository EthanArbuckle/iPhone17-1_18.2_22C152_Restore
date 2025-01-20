@interface SFRemoteAutoFillScanAction
+ (void)actionForURL:(id)a3 completion:(id)a4;
- (NSString)message;
- (NSString)title;
- (NSURL)url;
- (void)performWithCompletion:(id)a3;
- (void)setMessage:(id)a3;
- (void)setTitle:(id)a3;
- (void)setUrl:(id)a3;
@end

@implementation SFRemoteAutoFillScanAction

+ (void)actionForURL:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __54__SFRemoteAutoFillScanAction_actionForURL_completion___block_invoke;
  v9[3] = &unk_1E5BBC8C0;
  id v10 = v5;
  id v11 = v6;
  id v7 = v6;
  id v8 = v5;
  dispatch_async(MEMORY[0x1E4F14428], v9);
}

void __54__SFRemoteAutoFillScanAction_actionForURL_completion___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) absoluteString];
  int v3 = [v2 hasPrefix:@"https://autofill.apple.com/"];

  if (v3)
  {
    if (gLogCategory_SFRemoteAutoFillScanAction <= 50
      && (gLogCategory_SFRemoteAutoFillScanAction != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    id v8 = objc_alloc_init(SFRemoteAutoFillScanAction);
    id v5 = SFLocalizedStringForKey(@"PROX_AUTOFILL_QR_MESSAGE");
    [(SFRemoteAutoFillScanAction *)v8 setMessage:v5];

    id v6 = SFLocalizedStringForKey(@"PROX_AUTOFILL_QR_TITLE");
    [(SFRemoteAutoFillScanAction *)v8 setTitle:v6];

    [(SFRemoteAutoFillScanAction *)v8 setUrl:*(void *)(a1 + 32)];
    v4 = v8;
  }
  else
  {
    v4 = 0;
  }
  uint64_t v7 = *(void *)(a1 + 40);
  if (v7)
  {
    v9 = v4;
    (*(void (**)(uint64_t))(v7 + 16))(v7);
    v4 = v9;
  }
}

- (void)performWithCompletion:(id)a3
{
  id v4 = a3;
  if (gLogCategory_SFRemoteAutoFillScanAction <= 50
    && (gLogCategory_SFRemoteAutoFillScanAction != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  id v5 = objc_alloc_init(SFClient);
  url = self->_url;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __52__SFRemoteAutoFillScanAction_performWithCompletion___block_invoke;
  v9[3] = &unk_1E5BBE0F8;
  id v10 = v5;
  id v11 = v4;
  uint64_t v7 = v5;
  id v8 = v4;
  [(SFClient *)v7 triggerProximityAutoFillDetectedWithURL:url completion:v9];
}

void __52__SFRemoteAutoFillScanAction_performWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    if (gLogCategory_SFRemoteAutoFillScanAction <= 60
      && (gLogCategory_SFRemoteAutoFillScanAction != -1 || _LogCategory_Initialize()))
    {
LABEL_7:
      LogPrintF();
    }
  }
  else if (gLogCategory_SFRemoteAutoFillScanAction <= 50 {
         && (gLogCategory_SFRemoteAutoFillScanAction != -1 || _LogCategory_Initialize()))
  }
  {
    goto LABEL_7;
  }
  uint64_t v3 = *(void *)(a1 + 40);
  if (v3) {
    (*(void (**)(uint64_t, id))(v3 + 16))(v3, v4);
  }
  [*(id *)(a1 + 32) invalidate];
}

- (NSString)message
{
  return self->_message;
}

- (void)setMessage:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSURL)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_title, 0);

  objc_storeStrong((id *)&self->_message, 0);
}

@end
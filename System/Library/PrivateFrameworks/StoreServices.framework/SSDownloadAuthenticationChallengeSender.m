@interface SSDownloadAuthenticationChallengeSender
- (SSDownloadAuthenticationChallengeSender)initWithAuthenticationSession:(id)a3;
- (SSDownloadAuthenticationSession)authenticationSession;
- (void)cancelAuthenticationChallenge:(id)a3;
- (void)continueWithoutCredentialForAuthenticationChallenge:(id)a3;
- (void)dealloc;
- (void)performDefaultHandlingForAuthenticationChallenge:(id)a3;
- (void)rejectProtectionSpaceAndContinueWithChallenge:(id)a3;
- (void)useCredential:(id)a3 forAuthenticationChallenge:(id)a4;
@end

@implementation SSDownloadAuthenticationChallengeSender

- (SSDownloadAuthenticationChallengeSender)initWithAuthenticationSession:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SSDownloadAuthenticationChallengeSender;
  v4 = [(SSDownloadAuthenticationChallengeSender *)&v6 init];
  if (v4)
  {
    v4->_dispatchQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.StoreServices.SSDownloadAuthenticationChallengeSender", 0);
    v4->_session = (SSDownloadAuthenticationSession *)a3;
  }
  return v4;
}

- (void)dealloc
{
  dispatch_release((dispatch_object_t)self->_dispatchQueue);

  v3.receiver = self;
  v3.super_class = (Class)SSDownloadAuthenticationChallengeSender;
  [(SSDownloadAuthenticationChallengeSender *)&v3 dealloc];
}

- (SSDownloadAuthenticationSession)authenticationSession
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3052000000;
  v9 = __Block_byref_object_copy__35;
  v10 = __Block_byref_object_dispose__35;
  uint64_t v11 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __64__SSDownloadAuthenticationChallengeSender_authenticationSession__block_invoke;
  v5[3] = &unk_1E5BA7688;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  objc_super v3 = (SSDownloadAuthenticationSession *)(id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

id __64__SSDownloadAuthenticationChallengeSender_authenticationSession__block_invoke(uint64_t a1)
{
  id result = *(id *)(*(void *)(a1 + 32) + 16);
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (void)cancelAuthenticationChallenge:(id)a3
{
  objc_super v3 = [(SSDownloadAuthenticationChallengeSender *)self authenticationSession];
  [(SSDownloadAuthenticationSession *)v3 _finishWithType:1000 credential:0];
}

- (void)continueWithoutCredentialForAuthenticationChallenge:(id)a3
{
  objc_super v3 = [(SSDownloadAuthenticationChallengeSender *)self authenticationSession];
  [(SSDownloadAuthenticationSession *)v3 _finishWithType:1001 credential:0];
}

- (void)performDefaultHandlingForAuthenticationChallenge:(id)a3
{
  objc_super v3 = [(SSDownloadAuthenticationChallengeSender *)self authenticationSession];
  [(SSDownloadAuthenticationSession *)v3 _finishWithType:1003 credential:0];
}

- (void)rejectProtectionSpaceAndContinueWithChallenge:(id)a3
{
  objc_super v3 = [(SSDownloadAuthenticationChallengeSender *)self authenticationSession];
  [(SSDownloadAuthenticationSession *)v3 _finishWithType:1004 credential:0];
}

- (void)useCredential:(id)a3 forAuthenticationChallenge:(id)a4
{
  v5 = [(SSDownloadAuthenticationChallengeSender *)self authenticationSession];
  [(SSDownloadAuthenticationSession *)v5 _finishWithType:1002 credential:a3];
}

@end
@interface MusicTermsVerificationOperation
+ (BOOL)requiresTermsVerification;
- (BOOL)isExecuting;
- (BOOL)isFinished;
- (MusicTermsVerificationOperation)init;
- (MusicTermsVerificationOperation)initWithAdditionalPresentationHandler:(id)a3;
- (NSError)error;
- (SSVFairPlaySAPSession)SAPSession;
- (id)_newTermsUpdateOperationWithAcceptedStoreTermsVersion:(unint64_t)a3;
- (id)additionalPresentationHandler;
- (void)_cleanUpTermsAgreementViewController:(id)a3;
- (void)_dismissTermsAgreementViewControllerWithCompletionHandler:(id)a3;
- (void)_finishWithError:(id)a3;
- (void)_updateSubscriptionStatus;
- (void)setSAPSession:(id)a3;
- (void)start;
- (void)termsAgreementViewController:(id)a3 didRequestSendByEmailToEmailAddress:(id)a4;
- (void)termsAgreementViewControllerDidAcceptTerms:(id)a3;
- (void)termsAgreementViewControllerDidCancel:(id)a3;
@end

@implementation MusicTermsVerificationOperation

- (MusicTermsVerificationOperation)init
{
  v6.receiver = self;
  v6.super_class = (Class)MusicTermsVerificationOperation;
  v2 = [(MusicTermsVerificationOperation *)&v6 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.FuseUI.MusicTermsVerificationOperation.accessQueue", (dispatch_queue_attr_t)&_dispatch_queue_attr_concurrent);
    accessQueue = v2->_accessQueue;
    v2->_accessQueue = (OS_dispatch_queue *)v3;
  }
  return v2;
}

- (MusicTermsVerificationOperation)initWithAdditionalPresentationHandler:(id)a3
{
  id v4 = a3;
  v5 = [(MusicTermsVerificationOperation *)self init];
  if (v5)
  {
    id v6 = [v4 copy];
    id additionalPresentationHandler = v5->_additionalPresentationHandler;
    v5->_id additionalPresentationHandler = v6;
  }
  return v5;
}

- (BOOL)isExecuting
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = __46__MusicTermsVerificationOperation_isExecuting__block_invoke;
  v5[3] = &unk_CCB800;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __46__MusicTermsVerificationOperation_isExecuting__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 32);
  return result;
}

- (BOOL)isFinished
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = __45__MusicTermsVerificationOperation_isFinished__block_invoke;
  v5[3] = &unk_CCB800;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __45__MusicTermsVerificationOperation_isFinished__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 33);
  return result;
}

- (void)start
{
  if ([(MusicTermsVerificationOperation *)self isCancelled])
  {
    [(MusicTermsVerificationOperation *)self willChangeValueForKey:@"isFinished"];
    accessQueue = self->_accessQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = __40__MusicTermsVerificationOperation_start__block_invoke;
    block[3] = &unk_CCB970;
    block[4] = self;
    dispatch_barrier_async(accessQueue, block);
    [(MusicTermsVerificationOperation *)self didChangeValueForKey:@"isFinished"];
  }
  else
  {
    [(MusicTermsVerificationOperation *)self willChangeValueForKey:@"isExecuting"];
    id v4 = self->_accessQueue;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = __40__MusicTermsVerificationOperation_start__block_invoke_2;
    v7[3] = &unk_CCB970;
    v7[4] = self;
    dispatch_barrier_async(v4, v7);
    [(MusicTermsVerificationOperation *)self didChangeValueForKey:@"isExecuting"];
    if ([(id)objc_opt_class() requiresTermsVerification]
      && self->_additionalPresentationHandler)
    {
      v6[0] = _NSConcreteStackBlock;
      v6[1] = 3221225472;
      v6[2] = __40__MusicTermsVerificationOperation_start__block_invoke_3;
      v6[3] = &unk_CCB970;
      v6[4] = self;
      v5 = objc_retainBlock(v6);
      if (+[NSThread isMainThread]) {
        ((void (*)(void *))v5[2])(v5);
      }
      else {
        dispatch_async((dispatch_queue_t)&_dispatch_main_q, v5);
      }
    }
    else
    {
      [(MusicTermsVerificationOperation *)self _finishWithError:0];
    }
  }
}

uint64_t __40__MusicTermsVerificationOperation_start__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 33) = 1;
  return result;
}

uint64_t __40__MusicTermsVerificationOperation_start__block_invoke_2(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 32) = 1;
  return result;
}

void __40__MusicTermsVerificationOperation_start__block_invoke_3(uint64_t a1)
{
  v2 = objc_alloc_init(MusicTermsAgreementViewController);
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 48);
  *(void *)(v3 + 48) = v2;

  objc_setAssociatedObject(*(id *)(*(void *)(a1 + 32) + 48), _MusicTermsVerificationOperationAssociatedObjectKey, *(id *)(a1 + 32), (char *)&def_3B9D84 + 1);
  [*(id *)(*(void *)(a1 + 32) + 48) setDelegate:];
  [*(id *)(*(void *)(a1 + 32) + 48) setLoading:1];
  id v5 = [objc_alloc((Class)UINavigationController) initWithRootViewController:*(void *)(*(void *)(a1 + 32) + 48)];
  [v5 setModalPresentationStyle:2];
  (*(void (**)(void))(*(void *)(*(void *)(a1 + 32) + 56) + 16))();
  uint64_t v6 = dispatch_get_global_queue(0, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __40__MusicTermsVerificationOperation_start__block_invoke_4;
  block[3] = &unk_CCB970;
  block[4] = *(void *)(a1 + 32);
  dispatch_async(v6, block);
}

void __40__MusicTermsVerificationOperation_start__block_invoke_4(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _newTermsUpdateOperationWithAcceptedStoreTermsVersion:0];
  objc_initWeak(&location, v2);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = __40__MusicTermsVerificationOperation_start__block_invoke_5;
  v3[3] = &unk_CCB9E8;
  objc_copyWeak(&v4, &location);
  v3[4] = *(void *)(a1 + 32);
  [v2 setCompletionBlock:v3];
  [v2 start];
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

void __40__MusicTermsVerificationOperation_start__block_invoke_5(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v3 = WeakRetained;
  if (WeakRetained)
  {
    id v4 = [WeakRetained error];
    id v5 = v4;
    if (v4)
    {
      uint64_t v6 = [v4 domain];
      if ([v6 isEqualToString:SSErrorDomain]) {
        BOOL v7 = [v5 code] == (char *)&stru_68.addr + 4;
      }
      else {
        BOOL v7 = 0;
      }

      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = __40__MusicTermsVerificationOperation_start__block_invoke_8;
      v11[3] = &unk_CCB9C0;
      v11[4] = *(void *)(a1 + 32);
      BOOL v13 = v7;
      id v12 = v5;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, v11);
      v10 = v12;
    }
    else
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = __40__MusicTermsVerificationOperation_start__block_invoke_6;
      block[3] = &unk_CCB998;
      id v8 = v3;
      uint64_t v9 = *(void *)(a1 + 32);
      id v15 = v8;
      uint64_t v16 = v9;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
      v10 = v15;
    }
  }
  else
  {
    [*(id *)(a1 + 32) _finishWithError:0];
  }
}

void __40__MusicTermsVerificationOperation_start__block_invoke_6(uint64_t a1)
{
  if ([*(id *)(a1 + 32) hasAcceptedLatestTerms])
  {
    [*(id *)(a1 + 40) _updateSubscriptionStatus];
    id v2 = *(void **)(a1 + 40);
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = __40__MusicTermsVerificationOperation_start__block_invoke_7;
    v6[3] = &unk_CCB970;
    v6[4] = v2;
    [v2 _dismissTermsAgreementViewControllerWithCompletionHandler:v6];
  }
  else
  {
    *(void *)(*(void *)(a1 + 40) + 8) = [*(id *)(a1 + 32) latestStoreTermsVersion];
    [*(id *)(*(void *)(a1 + 40) + 48) setLoading:0];
    uint64_t v3 = *(void **)(a1 + 32);
    id v4 = *(void **)(*(void *)(a1 + 40) + 48);
    id v5 = [v3 termsContentText];
    [v4 setTermsText:v5];
  }
}

id __40__MusicTermsVerificationOperation_start__block_invoke_7(uint64_t a1)
{
  return [*(id *)(a1 + 32) _finishWithError:0];
}

void __40__MusicTermsVerificationOperation_start__block_invoke_8(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = __40__MusicTermsVerificationOperation_start__block_invoke_9;
  v2[3] = &unk_CCB9C0;
  v2[4] = v1;
  char v4 = *(unsigned char *)(a1 + 48);
  id v3 = *(id *)(a1 + 40);
  [v1 _dismissTermsAgreementViewControllerWithCompletionHandler:v2];
}

id __40__MusicTermsVerificationOperation_start__block_invoke_9(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  if (*(unsigned char *)(a1 + 48)) {
    uint64_t v3 = *(void *)(a1 + 40);
  }
  else {
    uint64_t v3 = 0;
  }
  return [v2 _finishWithError:v3];
}

- (void)termsAgreementViewControllerDidAcceptTerms:(id)a3
{
  id v4 = a3;
  [v4 setAccepting:1];
  id v5 = [(MusicTermsVerificationOperation *)self _newTermsUpdateOperationWithAcceptedStoreTermsVersion:self->_acceptingTermsVersion];
  objc_initWeak(&location, v5);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = __78__MusicTermsVerificationOperation_termsAgreementViewControllerDidAcceptTerms___block_invoke;
  v11[3] = &unk_CCBA38;
  objc_copyWeak(&v13, &location);
  v11[4] = self;
  id v6 = v4;
  id v12 = v6;
  [v5 setCompletionBlock:v11];
  BOOL v7 = dispatch_get_global_queue(0, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __78__MusicTermsVerificationOperation_termsAgreementViewControllerDidAcceptTerms___block_invoke_7;
  block[3] = &unk_CCB970;
  id v10 = v5;
  id v8 = v5;
  dispatch_async(v7, block);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

void __78__MusicTermsVerificationOperation_termsAgreementViewControllerDidAcceptTerms___block_invoke(id *a1)
{
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  uint64_t v3 = WeakRetained;
  if (WeakRetained)
  {
    id v4 = [WeakRetained error];
    id v5 = v4;
    if (v4)
    {
      id v6 = [v4 domain];
      if ([v6 isEqualToString:SSErrorDomain]) {
        BOOL v7 = [v5 code] == (char *)&stru_68.addr + 4;
      }
      else {
        BOOL v7 = 0;
      }

      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = __78__MusicTermsVerificationOperation_termsAgreementViewControllerDidAcceptTerms___block_invoke_4;
      v10[3] = &unk_CCBA10;
      BOOL v13 = v7;
      v10[4] = a1[4];
      id v11 = v5;
      id v12 = a1[5];
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, v10);
    }
    else
    {
      [a1[4] _updateSubscriptionStatus];
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = __78__MusicTermsVerificationOperation_termsAgreementViewControllerDidAcceptTerms___block_invoke_2;
      block[3] = &unk_CCB970;
      void block[4] = a1[4];
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
    }
  }
  else
  {
    id v8 = a1[4];
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = __78__MusicTermsVerificationOperation_termsAgreementViewControllerDidAcceptTerms___block_invoke_6;
    v9[3] = &unk_CCB970;
    v9[4] = v8;
    [v8 _dismissTermsAgreementViewControllerWithCompletionHandler:v9];
  }
}

id __78__MusicTermsVerificationOperation_termsAgreementViewControllerDidAcceptTerms___block_invoke_2(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = __78__MusicTermsVerificationOperation_termsAgreementViewControllerDidAcceptTerms___block_invoke_3;
  v3[3] = &unk_CCB970;
  v3[4] = v1;
  return [v1 _dismissTermsAgreementViewControllerWithCompletionHandler:v3];
}

id __78__MusicTermsVerificationOperation_termsAgreementViewControllerDidAcceptTerms___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _finishWithError:0];
}

void __78__MusicTermsVerificationOperation_termsAgreementViewControllerDidAcceptTerms___block_invoke_4(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 56))
  {
    id v2 = *(void **)(a1 + 32);
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = __78__MusicTermsVerificationOperation_termsAgreementViewControllerDidAcceptTerms___block_invoke_5;
    v12[3] = &unk_CCB998;
    v12[4] = v2;
    id v13 = *(id *)(a1 + 40);
    [v2 _dismissTermsAgreementViewControllerWithCompletionHandler:v12];
  }
  else
  {
    [*(id *)(a1 + 48) setAccepting:0];
    uint64_t v3 = +[NSBundle mainBundle];
    id v4 = [v3 localizedStringForKey:@"Your request couldn’t be completed." value:&stru_D2EE90 table:0];
    id v5 = +[NSBundle mainBundle];
    id v6 = [v5 localizedStringForKey:@"Your agreement to the Terms and Conditions couldn’t be submitted. Try again later." value:&stru_D2EE90 table:0];
    id v11 = +[UIAlertController alertControllerWithTitle:v4 message:v6 preferredStyle:1];

    BOOL v7 = +[NSBundle mainBundle];
    id v8 = [v7 localizedStringForKey:@"OK" value:&stru_D2EE90 table:0];
    uint64_t v9 = +[UIAlertAction actionWithTitle:v8 style:0 handler:0];

    [v11 addAction:v9];
    uint64_t v10 = *(void *)(*(void *)(a1 + 32) + 56);
    if (v10) {
      (*(void (**)(uint64_t, id))(v10 + 16))(v10, v11);
    }
  }
}

id __78__MusicTermsVerificationOperation_termsAgreementViewControllerDidAcceptTerms___block_invoke_5(uint64_t a1)
{
  return [*(id *)(a1 + 32) _finishWithError:*(void *)(a1 + 40)];
}

id __78__MusicTermsVerificationOperation_termsAgreementViewControllerDidAcceptTerms___block_invoke_6(uint64_t a1)
{
  return [*(id *)(a1 + 32) _finishWithError:0];
}

id __78__MusicTermsVerificationOperation_termsAgreementViewControllerDidAcceptTerms___block_invoke_7(uint64_t a1)
{
  return [*(id *)(a1 + 32) start];
}

- (void)termsAgreementViewControllerDidCancel:(id)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = __73__MusicTermsVerificationOperation_termsAgreementViewControllerDidCancel___block_invoke;
  v3[3] = &unk_CCB970;
  v3[4] = self;
  [(MusicTermsVerificationOperation *)self _dismissTermsAgreementViewControllerWithCompletionHandler:v3];
}

void __73__MusicTermsVerificationOperation_termsAgreementViewControllerDidCancel___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  SSError();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v1 _finishWithError:v2];
}

- (void)termsAgreementViewController:(id)a3 didRequestSendByEmailToEmailAddress:(id)a4
{
  id v5 = a4;
  if ([v5 length])
  {
    id v6 = [[MusicTermsSendByEmailOperation alloc] initWithEmailAddress:v5];
    BOOL v7 = [(MusicTermsVerificationOperation *)self SAPSession];
    if (v7) {
      [(MusicTermsSendByEmailOperation *)v6 setSAPSession:v7];
    }
    id v8 = dispatch_get_global_queue(0, 0);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = __100__MusicTermsVerificationOperation_termsAgreementViewController_didRequestSendByEmailToEmailAddress___block_invoke;
    block[3] = &unk_CCB970;
    id v11 = v6;
    uint64_t v9 = v6;
    dispatch_async(v8, block);
  }
}

id __100__MusicTermsVerificationOperation_termsAgreementViewController_didRequestSendByEmailToEmailAddress___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) start];
}

- (NSError)error
{
  uint64_t v6 = 0;
  BOOL v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__1;
  uint64_t v10 = __Block_byref_object_dispose__1;
  id v11 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = __40__MusicTermsVerificationOperation_error__block_invoke;
  v5[3] = &unk_CCB800;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSError *)v3;
}

void __40__MusicTermsVerificationOperation_error__block_invoke(uint64_t a1)
{
}

- (SSVFairPlaySAPSession)SAPSession
{
  uint64_t v6 = 0;
  BOOL v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__1;
  uint64_t v10 = __Block_byref_object_dispose__1;
  id v11 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = __45__MusicTermsVerificationOperation_SAPSession__block_invoke;
  v5[3] = &unk_CCB800;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (SSVFairPlaySAPSession *)v3;
}

void __45__MusicTermsVerificationOperation_SAPSession__block_invoke(uint64_t a1)
{
}

- (void)setSAPSession:(id)a3
{
  id v4 = a3;
  accessQueue = self->_accessQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = __49__MusicTermsVerificationOperation_setSAPSession___block_invoke;
  v7[3] = &unk_CCB998;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_barrier_async(accessQueue, v7);
}

void __49__MusicTermsVerificationOperation_setSAPSession___block_invoke(uint64_t a1)
{
}

+ (BOOL)requiresTermsVerification
{
  id v2 = +[MPCloudServiceStatusController sharedController];
  id v3 = [v2 musicSubscriptionStatus];
  [v3 termsStatusList];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  id v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v15;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v15 != v6) {
          objc_enumerationMutation(v4);
        }
        id v8 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if (objc_msgSend(v8, "type", (void)v14) == (char *)&def_3B9D84 + 1)
        {
          id v5 = v8;
          goto LABEL_11;
        }
      }
      id v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  id v9 = [v5 currentVersion];
  id v10 = [v5 acceptedVersion];
  BOOL v12 = (uint64_t)v9 > 0 && (uint64_t)v10 < (uint64_t)v9;

  return v12;
}

- (void)_cleanUpTermsAgreementViewController:(id)a3
{
}

- (void)_dismissTermsAgreementViewControllerWithCompletionHandler:(id)a3
{
  id v9 = (void (**)(void))a3;
  id v4 = [(MusicTermsAgreementViewController *)self->_termsAgreementViewController navigationController];
  id v5 = v4;
  if (v4
    && ([v4 presentingViewController],
        uint64_t v6 = objc_claimAutoreleasedReturnValue(),
        [v6 presentedViewController],
        BOOL v7 = objc_claimAutoreleasedReturnValue(),
        v7,
        v6,
        v7 == v5))
  {
    id v8 = [v5 presentingViewController];
    [v8 dismissViewControllerAnimated:1 completion:v9];
  }
  else if (v9)
  {
    v9[2]();
  }
}

- (void)_finishWithError:(id)a3
{
  id v4 = a3;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __52__MusicTermsVerificationOperation__finishWithError___block_invoke;
  block[3] = &unk_CCB970;
  void block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  [(MusicTermsVerificationOperation *)self willChangeValueForKey:@"isExecuting"];
  [(MusicTermsVerificationOperation *)self willChangeValueForKey:@"isFinished"];
  accessQueue = self->_accessQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = __52__MusicTermsVerificationOperation__finishWithError___block_invoke_2;
  v7[3] = &unk_CCB998;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_barrier_async(accessQueue, v7);
  [(MusicTermsVerificationOperation *)self didChangeValueForKey:@"isExecuting"];
  [(MusicTermsVerificationOperation *)self didChangeValueForKey:@"isFinished"];
}

void __52__MusicTermsVerificationOperation__finishWithError___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _cleanUpTermsAgreementViewController:*(void *)(*(void *)(a1 + 32) + 48)];
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 48);
  *(void *)(v2 + 48) = 0;
}

void __52__MusicTermsVerificationOperation__finishWithError___block_invoke_2(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 33) = 1;
  *(unsigned char *)(*(void *)(a1 + 32) + 32) = 0;
}

- (id)_newTermsUpdateOperationWithAcceptedStoreTermsVersion:(unint64_t)a3
{
  id v4 = [[MusicTermsUpdateOperation alloc] initWithAcceptedStoreTermsVersion:a3 termsContext:@"subscription"];
  id v5 = [(MusicTermsVerificationOperation *)self SAPSession];
  if (v5) {
    [(MusicTermsUpdateOperation *)v4 setSAPSession:v5];
  }

  return v4;
}

- (void)_updateSubscriptionStatus
{
  uint64_t v2 = +[SSVSubscriptionStatusCoordinator sharedCoordinator];
  uint64_t v5 = SSVSubscriptionStatusOptionIgnoreCache;
  id v6 = &__kCFBooleanTrue;
  id v3 = +[NSDictionary dictionaryWithObjects:&v6 forKeys:&v5 count:1];
  [v2 getStatusWithOptions:v3 statusBlock:&__block_literal_global_3];

  id v4 = +[MPCloudServiceStatusController sharedController];
  [v4 refreshMusicSubscriptionStatus];
}

- (id)additionalPresentationHandler
{
  return objc_getProperty(self, a2, 56, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_additionalPresentationHandler, 0);
  objc_storeStrong((id *)&self->_termsAgreementViewController, 0);
  objc_storeStrong((id *)&self->_SAPSession, 0);
  objc_storeStrong((id *)&self->_error, 0);

  objc_storeStrong((id *)&self->_accessQueue, 0);
}

@end
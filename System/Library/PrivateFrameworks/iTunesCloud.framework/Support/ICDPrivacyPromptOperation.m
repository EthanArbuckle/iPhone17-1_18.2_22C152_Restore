@interface ICDPrivacyPromptOperation
- (ICDPrivacyPromptOperation)initWithPrivacyIdentifier:(id)a3;
- (ICDPrivacyPromptOperation)initWithPrivacyIdentifier:(id)a3 identity:(id)a4;
- (id)completionHandler;
- (void)_didCompleteWithPrivacyPromptStatus:(int64_t)a3 error:(id)a4;
- (void)_handleRemoteAlertActionWithResult:(BOOL)a3;
- (void)cancel;
- (void)execute;
- (void)remoteAlertHandle:(id)a3 didInvalidateWithError:(id)a4;
- (void)remoteAlertHandleDidDeactivate:(id)a3;
- (void)setCompletionHandler:(id)a3;
@end

@implementation ICDPrivacyPromptOperation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteAlertHandle, 0);
  objc_storeStrong((id *)&self->_userIdentity, 0);
  objc_storeStrong((id *)&self->_privacyIdentifier, 0);

  objc_storeStrong(&self->_completionHandler, 0);
}

- (void)_handleRemoteAlertActionWithResult:(BOOL)a3
{
  BOOL v3 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  v6 = os_log_create("com.apple.amp.itunescloudd", "Default");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v15 = self;
    __int16 v16 = 1024;
    BOOL v17 = v3;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: Remote alert action handler was called with didContinue = %{BOOL}u.", buf, 0x12u);
  }

  os_unfair_lock_lock(p_lock);
  v7 = self->_privacyIdentifier;
  v8 = self->_remoteAlertHandle;
  remoteAlertHandle = self->_remoteAlertHandle;
  self->_remoteAlertHandle = 0;

  BOOL wasCancelled = self->_wasCancelled;
  os_unfair_lock_unlock(p_lock);
  [(SBSRemoteAlertHandle *)v8 unregisterObserver:self];
  if (wasCancelled)
  {
    v11 = os_log_create("com.apple.amp.itunescloudd", "Default");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v15 = self;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%{public}@: Operation was already cancelled. Aborting.", buf, 0xCu);
    }

    v12 = +[NSError errorWithDomain:ICErrorDomain code:-7004 userInfo:0];
    [(ICDPrivacyPromptOperation *)self finishWithError:v12];
  }
  else
  {
    if (!v3)
    {
      [(ICDPrivacyPromptOperation *)self _didCompleteWithPrivacyPromptStatus:1 error:0];
      goto LABEL_10;
    }
    v12 = +[ICPrivacyInfo sharedPrivacyInfoForUserIdentity:self->_userIdentity];
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_1000FA13C;
    v13[3] = &unk_1001BDE80;
    v13[4] = self;
    [v12 acknowledgePrivacyPolicyForIdentifier:v7 completionHandler:v13];
  }

LABEL_10:
}

- (void)_didCompleteWithPrivacyPromptStatus:(int64_t)a3 error:(id)a4
{
  id v6 = a4;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(&self->_lock);
  v7 = self->_remoteAlertHandle;
  remoteAlertHandle = self->_remoteAlertHandle;
  self->_remoteAlertHandle = 0;

  v9 = (void (**)(id, int64_t, id))objc_retainBlock(self->_completionHandler);
  BOOL hasInvokedCompletionHandler = self->_hasInvokedCompletionHandler;
  if (!self->_hasInvokedCompletionHandler) {
    self->_BOOL hasInvokedCompletionHandler = 1;
  }
  os_unfair_lock_unlock(&self->_lock);
  if (v7) {
    [(SBSRemoteAlertHandle *)v7 unregisterObserver:self];
  }
  if (hasInvokedCompletionHandler)
  {
    v11 = os_log_create("com.apple.amp.itunescloudd", "Default");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)BOOL v17 = 138543362;
      *(void *)&v17[4] = self;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%{public}@: Request is already finished. Skipping running completion logic a second time.", v17, 0xCu);
    }

    goto LABEL_24;
  }
  if ((unint64_t)a3 <= 3)
  {
    v12 = off_1001BDED0[a3];
    if (v6) {
      goto LABEL_11;
    }
LABEL_15:
    v13 = os_log_create("com.apple.amp.itunescloudd", "Default");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)BOOL v17 = 138543618;
      *(void *)&v17[4] = self;
      *(_WORD *)&v17[12] = 2114;
      *(void *)&v17[14] = v12;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%{public}@: Did complete privacy prompt with status: %{public}@.", v17, 0x16u);
    }
    goto LABEL_21;
  }
  v12 = 0;
  if (!v6) {
    goto LABEL_15;
  }
LABEL_11:
  v13 = [v6 debugDescription];
  v14 = os_log_create("com.apple.amp.itunescloudd", "Default");
  BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_ERROR);
  if (v13)
  {
    if (v15)
    {
      *(_DWORD *)BOOL v17 = 138543618;
      *(void *)&v17[4] = self;
      *(_WORD *)&v17[12] = 2114;
      *(void *)&v17[14] = v13;
      __int16 v16 = "%{public}@: %{public}@.";
LABEL_19:
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, v16, v17, 0x16u);
    }
  }
  else if (v15)
  {
    *(_DWORD *)BOOL v17 = 138543618;
    *(void *)&v17[4] = self;
    *(_WORD *)&v17[12] = 2114;
    *(void *)&v17[14] = v6;
    __int16 v16 = "%{public}@: Encountered error: %{public}@.";
    goto LABEL_19;
  }

LABEL_21:
  if (v9) {
    v9[2](v9, a3, v6);
  }
  -[ICDPrivacyPromptOperation finishWithError:](self, "finishWithError:", v6, *(_OWORD *)v17, *(void *)&v17[16]);
LABEL_24:
}

- (void)remoteAlertHandle:(id)a3 didInvalidateWithError:(id)a4
{
  id v5 = a4;
  os_unfair_lock_assert_not_owner(&self->_lock);
  id v6 = os_log_create("com.apple.amp.itunescloudd", "Default");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138543618;
    v8 = self;
    __int16 v9 = 2114;
    id v10 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: Remote alert handle did invalidate with error: %{public}@.", (uint8_t *)&v7, 0x16u);
  }

  [(ICDPrivacyPromptOperation *)self _didCompleteWithPrivacyPromptStatus:1 error:0];
}

- (void)remoteAlertHandleDidDeactivate:(id)a3
{
  os_unfair_lock_assert_not_owner(&self->_lock);
  v4 = os_log_create("com.apple.amp.itunescloudd", "Default");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138543362;
    id v6 = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: Remote alert handle did deactivate.", (uint8_t *)&v5, 0xCu);
  }

  [(ICDPrivacyPromptOperation *)self _didCompleteWithPrivacyPromptStatus:1 error:0];
}

- (void)execute
{
  p_lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(p_lock);
  v33 = self->_privacyIdentifier;
  BOOL wasCancelled = self->_wasCancelled;
  os_unfair_lock_unlock(p_lock);
  if (wasCancelled)
  {
    int v5 = os_log_create("com.apple.amp.itunescloudd", "Default");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = self;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: Operation was cancelled upon beginning execution. Aborting.", buf, 0xCu);
    }

    id v6 = +[NSError errorWithDomain:ICErrorDomain code:-7004 userInfo:0];
    [(ICDPrivacyPromptOperation *)self finishWithError:v6];
  }
  else
  {
    int v7 = +[ICPrivacyInfo sharedPrivacyInfoForUserIdentity:self->_userIdentity];
    unsigned __int8 v8 = [v7 privacyAcknowledgementRequiredForIdentifier:v33];

    if (v8)
    {
      __int16 v9 = +[ICPrivacyInfo _onboardingKitPrivacyIdentifierForPrivacyIdentifier:v33];
      if (v9)
      {
        uint64_t v35 = 0;
        v36 = &v35;
        uint64_t v37 = 0x2050000000;
        id v10 = (void *)qword_1001F39E0;
        uint64_t v38 = qword_1001F39E0;
        if (!qword_1001F39E0)
        {
          *(void *)buf = _NSConcreteStackBlock;
          *(void *)&buf[8] = 3221225472;
          *(void *)&buf[16] = sub_1000FAE10;
          v42 = &unk_1001BE9E8;
          v43 = &v35;
          sub_1000FAE10((uint64_t)buf);
          id v10 = (void *)v36[3];
        }
        v11 = v10;
        _Block_object_dispose(&v35, 8);
        id v12 = [[v11 alloc] initWithServiceName:@"com.apple.ios.StoreKitUIService" viewControllerClassName:@"ServicePrivacyPromptViewController"];
        uint64_t v35 = 0;
        v36 = &v35;
        uint64_t v37 = 0x2050000000;
        v13 = (void *)qword_1001F39F0;
        uint64_t v38 = qword_1001F39F0;
        if (!qword_1001F39F0)
        {
          *(void *)buf = _NSConcreteStackBlock;
          *(void *)&buf[8] = 3221225472;
          *(void *)&buf[16] = sub_1000FAED8;
          v42 = &unk_1001BE9E8;
          v43 = &v35;
          sub_1000FAED8((uint64_t)buf);
          v13 = (void *)v36[3];
        }
        v14 = v13;
        _Block_object_dispose(&v35, 8);
        id v15 = objc_alloc_init(v14);
        uint64_t v35 = 0;
        v36 = &v35;
        uint64_t v37 = 0x2050000000;
        __int16 v16 = (void *)qword_1001F39F8;
        uint64_t v38 = qword_1001F39F8;
        if (!qword_1001F39F8)
        {
          *(void *)buf = _NSConcreteStackBlock;
          *(void *)&buf[8] = 3221225472;
          *(void *)&buf[16] = sub_1000FAFA0;
          v42 = &unk_1001BE9E8;
          v43 = &v35;
          sub_1000FAFA0((uint64_t)buf);
          __int16 v16 = (void *)v36[3];
        }
        BOOL v17 = v16;
        _Block_object_dispose(&v35, 8);
        id v18 = objc_alloc_init(v17);
        uint64_t v35 = 0;
        v36 = &v35;
        uint64_t v37 = 0x2050000000;
        v19 = (void *)qword_1001F3A08;
        uint64_t v38 = qword_1001F3A08;
        if (!qword_1001F3A08)
        {
          *(void *)buf = _NSConcreteStackBlock;
          *(void *)&buf[8] = 3221225472;
          *(void *)&buf[16] = sub_1000FB068;
          v42 = &unk_1001BE9E8;
          v43 = &v35;
          sub_1000FB068((uint64_t)buf);
          v19 = (void *)v36[3];
        }
        v20 = v19;
        _Block_object_dispose(&v35, 8);
        v34[0] = _NSConcreteStackBlock;
        v34[1] = 3221225472;
        v34[2] = sub_1000FB130;
        v34[3] = &unk_1001BDE58;
        v34[4] = self;
        id v21 = [[v20 alloc] initWithInfo:v18 timeout:0 forResponseOnQueue:v34 withHandler:0.0];
        v22 = +[NSSet setWithObject:v21];
        [v15 setActions:v22];

        CFStringRef v39 = @"privacyIdentifier";
        v40 = v9;
        v23 = +[NSDictionary dictionaryWithObjects:&v40 forKeys:&v39 count:1];
        [v15 setUserInfo:v23];

        uint64_t v35 = 0;
        v36 = &v35;
        uint64_t v37 = 0x2050000000;
        v24 = (void *)qword_1001F3A10;
        uint64_t v38 = qword_1001F3A10;
        if (!qword_1001F3A10)
        {
          *(void *)buf = _NSConcreteStackBlock;
          *(void *)&buf[8] = 3221225472;
          *(void *)&buf[16] = sub_1000FB1A4;
          v42 = &unk_1001BE9E8;
          v43 = &v35;
          sub_1000FB1A4((uint64_t)buf);
          v24 = (void *)v36[3];
        }
        id v25 = v24;
        _Block_object_dispose(&v35, 8);
        id v26 = [v25 newHandleWithDefinition:v12 configurationContext:v15];
        if (v26)
        {
          v27 = os_log_create("com.apple.amp.itunescloudd", "Default");
          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543618;
            *(void *)&uint8_t buf[4] = self;
            *(_WORD *)&buf[12] = 2114;
            *(void *)&buf[14] = v26;
            _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "%{public}@: Remote alert handle created for privacy prompt: %{public}@.", buf, 0x16u);
          }

          [v26 registerObserver:self];
          os_unfair_lock_lock(p_lock);
          if (self->_wasCancelled)
          {
            os_unfair_lock_unlock(p_lock);
            v28 = os_log_create("com.apple.amp.itunescloudd", "Default");
            if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543618;
              *(void *)&uint8_t buf[4] = self;
              *(_WORD *)&buf[12] = 2114;
              *(void *)&buf[14] = v26;
              _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "%{public}@: Operation was cancelled right before activating remote alert handle: %{public}@. Aborting.", buf, 0x16u);
            }

            v29 = +[NSError errorWithDomain:ICErrorDomain code:-7004 userInfo:0];
            [(ICDPrivacyPromptOperation *)self finishWithError:v29];
          }
          else
          {
            objc_storeStrong((id *)&self->_remoteAlertHandle, v26);
            os_unfair_lock_unlock(p_lock);
            v32 = os_log_create("com.apple.amp.itunescloudd", "Default");
            if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543618;
              *(void *)&uint8_t buf[4] = self;
              *(_WORD *)&buf[12] = 2114;
              *(void *)&buf[14] = v26;
              _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "%{public}@: Activating remote alert handle for privacy prompt: %{public}@.", buf, 0x16u);
            }

            [v26 activateWithContext:0];
          }
        }
        else
        {
          v31 = +[NSError msv_errorWithDomain:ICErrorDomain code:0 debugDescription:@"Failed to create remote alert handle for privacy prompt."];
          [(ICDPrivacyPromptOperation *)self _didCompleteWithPrivacyPromptStatus:3 error:v31];
        }
      }
      else
      {
        v30 = +[NSError msv_errorWithDomain:ICErrorDomain code:-7002 debugDescription:@"Unsupported privacy identifier for prompting the user to acknowledge the latest privacy policy."];
        [(ICDPrivacyPromptOperation *)self _didCompleteWithPrivacyPromptStatus:3 error:v30];
      }
    }
    else
    {
      [(ICDPrivacyPromptOperation *)self _didCompleteWithPrivacyPromptStatus:0 error:0];
    }
  }
}

- (void)cancel
{
  p_lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  v7.receiver = self;
  v7.super_class = (Class)ICDPrivacyPromptOperation;
  [(ICDPrivacyPromptOperation *)&v7 cancel];
  os_unfair_lock_lock(p_lock);
  v4 = self->_remoteAlertHandle;
  remoteAlertHandle = self->_remoteAlertHandle;
  self->_remoteAlertHandle = 0;

  self->_BOOL wasCancelled = 1;
  os_unfair_lock_unlock(p_lock);
  if (v4)
  {
    id v6 = os_log_create("com.apple.amp.itunescloudd", "Default");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      __int16 v9 = self;
      __int16 v10 = 2114;
      v11 = v4;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: Deactivating remote alert handle for privacy prompt: %{public}@.", buf, 0x16u);
    }

    [(SBSRemoteAlertHandle *)v4 unregisterObserver:self];
    [(SBSRemoteAlertHandle *)v4 invalidate];
  }
}

- (void)setCompletionHandler:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_assert_not_owner(p_lock);
  os_unfair_lock_lock(p_lock);
  id v6 = [v5 copy];

  id completionHandler = self->_completionHandler;
  self->_id completionHandler = v6;

  os_unfair_lock_unlock(p_lock);
}

- (id)completionHandler
{
  p_lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(p_lock);
  id v4 = objc_retainBlock(self->_completionHandler);
  os_unfair_lock_unlock(p_lock);
  id v5 = objc_retainBlock(v4);

  return v5;
}

- (ICDPrivacyPromptOperation)initWithPrivacyIdentifier:(id)a3 identity:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ICDPrivacyPromptOperation;
  __int16 v9 = [(ICDPrivacyPromptOperation *)&v12 init];
  __int16 v10 = v9;
  if (v9)
  {
    v9->_lock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v9->_privacyIdentifier, a3);
    objc_storeStrong((id *)&v10->_userIdentity, a4);
  }

  return v10;
}

- (ICDPrivacyPromptOperation)initWithPrivacyIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = +[ICUserIdentity activeAccount];
  id v6 = [(ICDPrivacyPromptOperation *)self initWithPrivacyIdentifier:v4 identity:v5];

  return v6;
}

@end
@interface MediaSocialAuthenticationCoordinator
- (BOOL)isFinished;
- (MediaSocialAuthenticationCoordinator)initWithDispatchQueue:(id)a3;
- (MediaSocialAuthenticationDelegate)delegate;
- (id)_enqueueOperationIfNecessaryWithAccountIdentifier:(id)a3;
- (id)_newAuthenticateOperationWithAccountIdentifier:(id)a3;
- (void)_finishResponse:(id)a3;
- (void)authenticateForPostWithIdentifier:(int64_t)a3 accountIdentifier:(id)a4;
- (void)authenticateForUploadWithIdentifier:(int64_t)a3 accountIdentifier:(id)a4;
- (void)setDelegate:(id)a3;
@end

@implementation MediaSocialAuthenticationCoordinator

- (MediaSocialAuthenticationCoordinator)initWithDispatchQueue:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MediaSocialAuthenticationCoordinator;
  v6 = [(MediaSocialAuthenticationCoordinator *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_dispatchQueue, a3);
    v8 = (ISOperationQueue *)objc_alloc_init((Class)ISOperationQueue);
    operationQueue = v7->_operationQueue;
    v7->_operationQueue = v8;

    [(ISOperationQueue *)v7->_operationQueue setMaxConcurrentOperationCount:1];
    [(ISOperationQueue *)v7->_operationQueue setName:@"com.apple.itunesstored.MediaSocialAuthenticationCoordinator"];
  }

  return v7;
}

- (void)authenticateForPostWithIdentifier:(int64_t)a3 accountIdentifier:(id)a4
{
  id v5 = [(MediaSocialAuthenticationCoordinator *)self _enqueueOperationIfNecessaryWithAccountIdentifier:a4];
  [v5 addPostIdentifier:a3];
}

- (void)authenticateForUploadWithIdentifier:(int64_t)a3 accountIdentifier:(id)a4
{
  id v5 = [(MediaSocialAuthenticationCoordinator *)self _enqueueOperationIfNecessaryWithAccountIdentifier:a4];
  [v5 addUploadIdentifier:a3];
}

- (BOOL)isFinished
{
  return [(NSMutableArray *)self->_pendingResponses count] == 0;
}

- (id)_enqueueOperationIfNecessaryWithAccountIdentifier:(id)a3
{
  id v20 = a3;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  v4 = self->_pendingResponses;
  id v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (!v5)
  {

LABEL_13:
    v14 = objc_alloc_init(MediaSocialAuthenticationResponse);
    [(MediaSocialAuthenticationResponse *)v14 setAccountIdentifier:v20];
    pendingResponses = self->_pendingResponses;
    if (!pendingResponses)
    {
      v16 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
      v17 = self->_pendingResponses;
      self->_pendingResponses = v16;

      pendingResponses = self->_pendingResponses;
    }
    -[NSMutableArray addObject:](pendingResponses, "addObject:", v14, v20);
    id v18 = [(MediaSocialAuthenticationCoordinator *)self _newAuthenticateOperationWithAccountIdentifier:v20];
    objc_initWeak(&location, v18);
    objc_initWeak(&from, self);
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_1000C7B38;
    v21[3] = &unk_1003A5E78;
    objc_copyWeak(&v23, &from);
    objc_copyWeak(&v24, &location);
    v6 = v14;
    v22 = v6;
    [v18 setCompletionBlock:v21];
    [(ISOperationQueue *)self->_operationQueue addOperation:v18];

    objc_destroyWeak(&v24);
    objc_destroyWeak(&v23);
    objc_destroyWeak(&from);
    objc_destroyWeak(&location);

    goto LABEL_16;
  }
  v6 = 0;
  uint64_t v7 = *(void *)v28;
  do
  {
    for (i = 0; i != v5; i = (char *)i + 1)
    {
      if (*(void *)v28 != v7) {
        objc_enumerationMutation(v4);
      }
      v9 = *(void **)(*((void *)&v27 + 1) + 8 * i);
      v10 = objc_msgSend(v9, "accountIdentifier", v20);
      objc_super v11 = [v9 accountIdentifier];
      unsigned int v12 = [v10 isEqual:v11];

      if (v12)
      {
        v13 = v9;

        v6 = v13;
      }
    }
    id v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v27 objects:v31 count:16];
  }
  while (v5);

  if (!v6) {
    goto LABEL_13;
  }
LABEL_16:

  return v6;
}

- (void)_finishResponse:(id)a3
{
  id v6 = a3;
  -[NSMutableArray removeObject:](self->_pendingResponses, "removeObject:");
  if (![(NSMutableArray *)self->_pendingResponses count])
  {
    pendingResponses = self->_pendingResponses;
    self->_pendingResponses = 0;
  }
  id v5 = [(MediaSocialAuthenticationCoordinator *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v5 authenticationCoordinator:self didFinishAuthenticationWithResponse:v6];
  }
}

- (id)_newAuthenticateOperationWithAccountIdentifier:(id)a3
{
  id v3 = a3;
  id v4 = [objc_alloc((Class)SSMutableAuthenticationContext) initWithAccountIdentifier:v3];
  [v4 setCanCreateNewAccount:0];
  [v4 setCanSetActiveAccount:0];
  [v4 setPromptStyle:1];
  id v5 = +[SSAccountStore defaultStore];
  id v6 = [v5 accountWithUniqueIdentifier:v3];

  uint64_t v7 = [v6 accountName];
  if ([v7 length])
  {
    v8 = +[NSBundle bundleWithIdentifier:@"com.apple.storeservices"];
    v9 = [v8 localizedStringForKey:@"MEDIA_SOCIAL_ENTER_PASSWORD_FORMAT_%@" value:&stru_1003B9B00 table:@"MediaSocial"];
    v10 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v9, v7);
    [v4 setReasonDescription:v10];
  }
  else
  {
    v8 = +[NSBundle bundleWithIdentifier:@"com.apple.storeservices"];
    v9 = [v8 localizedStringForKey:@"MEDIA_SOCIAL_ENTER_PASSWORD_NO_ACCOUNT" value:&stru_1003B9B00 table:@"MediaSocial"];
    [v4 setReasonDescription:v9];
  }

  id v11 = [objc_alloc((Class)ISStoreAuthenticateOperation) initWithAuthenticationContext:v4];
  return v11;
}

- (MediaSocialAuthenticationDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MediaSocialAuthenticationDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingResponses, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end
@interface MusicKit_SoftLinking_MPRequestResponseController
- (BOOL)controller:(id)a3 shouldRetryFailedRequestWithError:(id)a4;
- (MusicKit_SoftLinking_MPCPlayerRequest)request;
- (MusicKit_SoftLinking_MPCPlayerResponse)response;
- (MusicKit_SoftLinking_MPRequestResponseController)init;
- (MusicKit_SoftLinking_MPRequestResponseController)initWithUnderlyingRequestResponseController:(id)a3;
- (id)responseHandler;
- (id)shouldRetryFailedRequestWithErrorHandler;
- (void)beginAutomaticResponseLoading;
- (void)controller:(id)a3 defersResponseReplacement:(id)a4;
- (void)endAutomaticResponseLoading;
- (void)reloadIfNeeded;
- (void)setNeedsReload;
- (void)setNeedsReloadForSignificantRequestChange;
- (void)setRequest:(id)a3;
- (void)setResponseHandler:(id)a3;
- (void)setShouldRetryFailedRequestWithErrorHandler:(id)a3;
@end

@implementation MusicKit_SoftLinking_MPRequestResponseController

- (MusicKit_SoftLinking_MPCPlayerResponse)response
{
  return (MusicKit_SoftLinking_MPCPlayerResponse *)[(MPRequestResponseController *)self->_underlyingRequestResponseController response];
}

- (void)setShouldRetryFailedRequestWithErrorHandler:(id)a3
{
}

- (void)setResponseHandler:(id)a3
{
}

- (void)beginAutomaticResponseLoading
{
}

- (void)controller:(id)a3 defersResponseReplacement:(id)a4
{
  id v7 = a3;
  (*((void (**)(id))a4 + 2))(a4);
  if (self->_responseHandler)
  {
    v6 = [v7 response];
    (*((void (**)(void))self->_responseHandler + 2))();
  }
}

- (void)setRequest:(id)a3
{
  underlyingRequestResponseController = self->_underlyingRequestResponseController;
  id v4 = [a3 _underlyingPlayerRequest];
  [(MPRequestResponseController *)underlyingRequestResponseController setRequest:v4];
}

- (MusicKit_SoftLinking_MPRequestResponseController)init
{
  v8.receiver = self;
  v8.super_class = (Class)MusicKit_SoftLinking_MPRequestResponseController;
  v2 = [(MusicKit_SoftLinking_MPRequestResponseController *)&v8 init];
  if (v2)
  {
    uint64_t v10 = 0;
    v11 = &v10;
    uint64_t v12 = 0x2050000000;
    v3 = (void *)getMPRequestResponseControllerClass_softClass;
    uint64_t v13 = getMPRequestResponseControllerClass_softClass;
    if (!getMPRequestResponseControllerClass_softClass)
    {
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __getMPRequestResponseControllerClass_block_invoke;
      v9[3] = &unk_1E6D453B0;
      v9[4] = &v10;
      __getMPRequestResponseControllerClass_block_invoke((uint64_t)v9);
      v3 = (void *)v11[3];
    }
    id v4 = v3;
    _Block_object_dispose(&v10, 8);
    v5 = (MPRequestResponseController *)objc_alloc_init(v4);
    underlyingRequestResponseController = v2->_underlyingRequestResponseController;
    v2->_underlyingRequestResponseController = v5;

    [(MPRequestResponseController *)v2->_underlyingRequestResponseController setDelegate:v2];
  }
  return v2;
}

- (MusicKit_SoftLinking_MPRequestResponseController)initWithUnderlyingRequestResponseController:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MusicKit_SoftLinking_MPRequestResponseController;
  v6 = [(MusicKit_SoftLinking_MPRequestResponseController *)&v9 init];
  id v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_underlyingRequestResponseController, a3);
  }

  return v7;
}

- (MusicKit_SoftLinking_MPCPlayerRequest)request
{
  v3 = [MusicKit_SoftLinking_MPCPlayerRequest alloc];
  id v4 = [(MPRequestResponseController *)self->_underlyingRequestResponseController request];
  id v5 = [(MusicKit_SoftLinking_MPCPlayerRequest *)v3 initWithUnderlyingPlayerRequest:v4];

  return v5;
}

- (void)endAutomaticResponseLoading
{
}

- (void)setNeedsReload
{
}

- (void)setNeedsReloadForSignificantRequestChange
{
}

- (void)reloadIfNeeded
{
}

- (BOOL)controller:(id)a3 shouldRetryFailedRequestWithError:(id)a4
{
  shouldRetryFailedRequestWithErrorHandler = (uint64_t (**)(id, id))self->_shouldRetryFailedRequestWithErrorHandler;
  if (shouldRetryFailedRequestWithErrorHandler) {
    return shouldRetryFailedRequestWithErrorHandler[2](shouldRetryFailedRequestWithErrorHandler, a4);
  }
  else {
    return 1;
  }
}

- (id)responseHandler
{
  return self->_responseHandler;
}

- (id)shouldRetryFailedRequestWithErrorHandler
{
  return self->_shouldRetryFailedRequestWithErrorHandler;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_shouldRetryFailedRequestWithErrorHandler, 0);
  objc_storeStrong(&self->_responseHandler, 0);
  objc_storeStrong((id *)&self->_underlyingRequestResponseController, 0);
}

@end
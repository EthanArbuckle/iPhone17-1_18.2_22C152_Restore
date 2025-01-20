@interface PKBannerPresentable
- (BNPresentableContext)presentableContext;
- (BOOL)isDraggingInteractionEnabled;
- (BOOL)providesHostedContent;
- (NSString)requestIdentifier;
- (NSString)requesterIdentifier;
- (PKBannerPresentable)init;
- (SBUISystemApertureElement)systemApertureElementViewController;
- (UIViewController)viewController;
- (void)_finish;
- (void)_revoke;
- (void)presentableDidAppearAsBanner:(id)a3;
- (void)presentableDidDisappearAsBanner:(id)a3 withReason:(id)a4;
- (void)presentableWillAppearAsBanner:(id)a3;
- (void)presentableWillDisappearAsBanner:(id)a3 withReason:(id)a4;
- (void)presentableWillNotAppearAsBanner:(id)a3 withReason:(id)a4;
- (void)setPresentableContext:(id)a3;
- (void)userInteractionDidEndForBannerForPresentable:(id)a3;
- (void)userInteractionWillBeginForBannerForPresentable:(id)a3;
@end

@implementation PKBannerPresentable

- (PKBannerPresentable)init
{
  return 0;
}

void __43__PKBannerPresentable__postWithCompletion___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = v5;
  if (v6) {
    (*(void (**)(uint64_t, id, uint64_t))(v6 + 16))(v6, v5, a3);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)_revoke
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (a1 && !*(unsigned char *)(a1 + 25))
  {
    *(unsigned char *)(a1 + 25) = 1;
    if (!*(unsigned char *)(a1 + 26))
    {
LABEL_11:
      [*(id *)(a1 + 40) setPresentable:0];
      [*(id *)(a1 + 40) revoked];
      -[PKBannerPresentable _finish](a1);
      return;
    }
    *(unsigned char *)(a1 + 26) = 0;
    id v2 = -[PKBannerPresentationManager _source](*(void *)(a1 + 8));
    uint64_t v3 = *(void *)(a1 + 16);
    id v11 = 0;
    v4 = [v2 revokePresentableWithRequestIdentifier:v3 reason:@"dismiss" animated:1 userInfo:0 error:&v11];
    id v5 = v11;

    uint64_t v6 = PKLogFacilityTypeGetObject();
    BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
    if (v4)
    {
      if (v7)
      {
        *(_DWORD *)buf = 134217984;
        uint64_t v13 = a1;
        v8 = "PKBannerPresentable (%p): revoked.";
        v9 = v6;
        uint32_t v10 = 12;
LABEL_9:
        _os_log_impl(&dword_19F450000, v9, OS_LOG_TYPE_DEFAULT, v8, buf, v10);
      }
    }
    else if (v7)
    {
      *(_DWORD *)buf = 134218242;
      uint64_t v13 = a1;
      __int16 v14 = 2112;
      id v15 = v5;
      v8 = "PKBannerPresentable (%p): failed to revoke - %@.";
      v9 = v6;
      uint32_t v10 = 22;
      goto LABEL_9;
    }

    goto LABEL_11;
  }
}

- (void)_finish
{
  if (a1)
  {
    id v2 = *(void **)(a1 + 48);
    *(void *)(a1 + 48) = 0;

    uint64_t v3 = *(const void **)(a1 + 56);
    if (v3)
    {
      id v5 = (void (**)(id, uint64_t, void))_Block_copy(v3);
      v4 = *(void **)(a1 + 56);
      *(void *)(a1 + 56) = 0;

      v5[2](v5, a1, *(unsigned __int8 *)(a1 + 24));
    }
  }
}

- (NSString)requesterIdentifier
{
  manager = self->_manager;
  if (manager) {
    uint64_t v3 = manager->_requesterIdentifier;
  }
  else {
    uint64_t v3 = 0;
  }

  return v3;
}

- (NSString)requestIdentifier
{
  return self->_requestIdentifier;
}

- (BOOL)isDraggingInteractionEnabled
{
  return 1;
}

- (BOOL)providesHostedContent
{
  return 1;
}

- (UIViewController)viewController
{
  return (UIViewController *)self->_viewController;
}

- (SBUISystemApertureElement)systemApertureElementViewController
{
  return self->_viewController;
}

- (void)presentableWillAppearAsBanner:(id)a3
{
  id v4 = a3;
  if (objc_opt_respondsToSelector()) {
    [(PKBannerViewController *)self->_viewController presentableWillAppearAsBanner:v4];
  }
}

- (void)presentableDidAppearAsBanner:(id)a3
{
  id v7 = a3;
  if (objc_opt_respondsToSelector()) {
    [(PKBannerViewController *)self->_viewController presentableDidAppearAsBanner:v7];
  }
  id didStartHandler = self->_didStartHandler;
  if (didStartHandler)
  {
    id v5 = (void (**)(void *, PKBannerPresentable *))_Block_copy(didStartHandler);
    id v6 = self->_didStartHandler;
    self->_id didStartHandler = 0;

    v5[2](v5, self);
  }
}

- (void)presentableWillDisappearAsBanner:(id)a3 withReason:(id)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (self->_needsRevoke)
  {
    self->_needsRevoke = 0;
    v8 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 134218242;
      uint32_t v10 = self;
      __int16 v11 = 2112;
      id v12 = v7;
      _os_log_impl(&dword_19F450000, v8, OS_LOG_TYPE_DEFAULT, "PKBannerPresentable (%p): implicitly revoked due to disappearance - %@.", (uint8_t *)&v9, 0x16u);
    }
  }
  if (objc_opt_respondsToSelector()) {
    [(PKBannerViewController *)self->_viewController presentableWillDisappearAsBanner:v6 withReason:v7];
  }
  -[PKBannerPresentable _finish]((uint64_t)self);
}

- (void)presentableDidDisappearAsBanner:(id)a3 withReason:(id)a4
{
  id v7 = a3;
  id v6 = a4;
  if (objc_opt_respondsToSelector()) {
    [(PKBannerViewController *)self->_viewController presentableDidDisappearAsBanner:v7 withReason:v6];
  }
  -[PKBannerPresentable _revoke]((uint64_t)self);
}

- (void)presentableWillNotAppearAsBanner:(id)a3 withReason:(id)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (self->_needsRevoke)
  {
    self->_needsRevoke = 0;
    v8 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 134218242;
      uint32_t v10 = self;
      __int16 v11 = 2112;
      id v12 = v7;
      _os_log_impl(&dword_19F450000, v8, OS_LOG_TYPE_DEFAULT, "PKBannerPresentable (%p): implicitly revoked due to appearance failure - %@.", (uint8_t *)&v9, 0x16u);
    }
  }
  if (objc_opt_respondsToSelector()) {
    [(PKBannerViewController *)self->_viewController presentableWillNotAppearAsBanner:v6 withReason:v7];
  }
  -[PKBannerPresentable _revoke]((uint64_t)self);
}

- (void)userInteractionWillBeginForBannerForPresentable:(id)a3
{
  id v4 = a3;
  if (objc_opt_respondsToSelector()) {
    [(PKBannerViewController *)self->_viewController userInteractionWillBeginForBannerForPresentable:v4];
  }
}

- (void)userInteractionDidEndForBannerForPresentable:(id)a3
{
  id v4 = a3;
  if (objc_opt_respondsToSelector()) {
    [(PKBannerViewController *)self->_viewController userInteractionDidEndForBannerForPresentable:v4];
  }
}

- (BNPresentableContext)presentableContext
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presentableContext);

  return (BNPresentableContext *)WeakRetained;
}

- (void)setPresentableContext:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_presentableContext);
  objc_storeStrong(&self->_didFinishHandler, 0);
  objc_storeStrong(&self->_didStartHandler, 0);
  objc_storeStrong((id *)&self->_viewController, 0);
  objc_storeStrong(&self->_factory, 0);

  objc_storeStrong((id *)&self->_requestIdentifier, 0);
}

@end
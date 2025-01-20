@interface PKIdentityAuthorizationController
- (DIIdentityAuthorizationController)wrapped;
- (PKIdentityAuthorizationController)init;
- (void)cancelRequest;
- (void)checkCanRequestDocument:(id)descriptor completion:(void *)completion;
- (void)requestDocument:(PKIdentityRequest *)request completion:(void *)completion;
- (void)setWrapped:(id)a3;
@end

@implementation PKIdentityAuthorizationController

- (PKIdentityAuthorizationController)init
{
  v8.receiver = self;
  v8.super_class = (Class)PKIdentityAuthorizationController;
  v2 = [(PKIdentityAuthorizationController *)&v8 init];
  v3 = PKLogFacilityTypeGetObject(0x1EuLL);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_190E10000, v3, OS_LOG_TYPE_DEFAULT, "PKIdentityAuthorizationController init", v7, 2u);
  }

  v4 = (DIIdentityAuthorizationController *)objc_alloc_init(MEMORY[0x1E4F5C1A8]);
  wrapped = v2->_wrapped;
  v2->_wrapped = v4;

  return v2;
}

- (void)checkCanRequestDocument:(id)descriptor completion:(void *)completion
{
  id v6 = descriptor;
  v7 = completion;
  objc_super v8 = PKLogFacilityTypeGetObject(0x1EuLL);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_190E10000, v8, OS_LOG_TYPE_DEFAULT, "PKIdentityAuthorizationController checkCanRequestDocument", buf, 2u);
  }

  v9 = DIIdentityDocumentDescriptorFromPKIdentityDocumentDescriptor(v6);
  if (v9)
  {
    wrapped = self->_wrapped;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __72__PKIdentityAuthorizationController_checkCanRequestDocument_completion___block_invoke;
    v11[3] = &unk_1E56D8798;
    v11[4] = self;
    id v12 = v7;
    [(DIIdentityAuthorizationController *)wrapped checkCanRequestDocument:v9 completion:v11];
  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_190E10000, v8, OS_LOG_TYPE_DEFAULT, "PKIdentityAuthorizationController checkCanRequestDocument cannot convert descriptor to underlying representation", buf, 2u);
    }

    (*((void (**)(void *, void))v7 + 2))(v7, 0);
  }
}

uint64_t __72__PKIdentityAuthorizationController_checkCanRequestDocument_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)requestDocument:(PKIdentityRequest *)request completion:(void *)completion
{
  id v6 = request;
  v7 = completion;
  objc_super v8 = PKLogFacilityTypeGetObject(0x1EuLL);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_190E10000, v8, OS_LOG_TYPE_DEFAULT, "PKIdentityAuthorizationController requestDocumemnt", buf, 2u);
  }

  v9 = [(PKIdentityRequest *)v6 asDIIdentityRequest];
  wrapped = self->_wrapped;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __64__PKIdentityAuthorizationController_requestDocument_completion___block_invoke;
  v12[3] = &unk_1E56ECD30;
  v12[4] = self;
  id v13 = v7;
  id v11 = v7;
  [(DIIdentityAuthorizationController *)wrapped requestDocument:v9 completion:v12];
}

void __64__PKIdentityAuthorizationController_requestDocument_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  v7 = v6;
  if (v6)
  {
    PKIdentityErrorFromDIIdentityError(v6);
    objc_super v8 = (PKIdentityDocument *)objc_claimAutoreleasedReturnValue();
    v9 = PKLogFacilityTypeGetObject(0x1EuLL);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 138412290;
      v14 = v8;
      _os_log_impl(&dword_190E10000, v9, OS_LOG_TYPE_DEFAULT, "PKIdentityAuthorizationController requestDocument returning error %@", (uint8_t *)&v13, 0xCu);
    }
LABEL_8:

    v10 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    goto LABEL_9;
  }
  if (v5)
  {
    objc_super v8 = [[PKIdentityDocument alloc] initWithDIIdentityDocument:v5];
    v9 = PKLogFacilityTypeGetObject(0x1EuLL);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v13) = 0;
      _os_log_impl(&dword_190E10000, v9, OS_LOG_TYPE_DEFAULT, "PKIdentityAuthorizationController requestDocument returning successfully", (uint8_t *)&v13, 2u);
    }
    goto LABEL_8;
  }
  id v11 = PKLogFacilityTypeGetObject(0x1EuLL);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v13) = 0;
    _os_log_impl(&dword_190E10000, v11, OS_LOG_TYPE_DEFAULT, "PKIdentityAuthorizationController requestDocument returned document is nil", (uint8_t *)&v13, 2u);
  }

  uint64_t v12 = *(void *)(a1 + 40);
  objc_super v8 = [MEMORY[0x1E4F28C58] errorWithDomain:@"PKIdentityErrorDomain" code:0 userInfo:0];
  v10 = *(void (**)(void))(v12 + 16);
LABEL_9:
  v10();
}

- (void)cancelRequest
{
  v3 = PKLogFacilityTypeGetObject(0x1EuLL);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_190E10000, v3, OS_LOG_TYPE_DEFAULT, "PKIdentityAuthorizationController cancelRequest", v4, 2u);
  }

  [(DIIdentityAuthorizationController *)self->_wrapped cancelRequest];
}

- (DIIdentityAuthorizationController)wrapped
{
  return self->_wrapped;
}

- (void)setWrapped:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
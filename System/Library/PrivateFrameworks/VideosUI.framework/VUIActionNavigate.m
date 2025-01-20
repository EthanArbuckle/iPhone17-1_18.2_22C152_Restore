@interface VUIActionNavigate
- (VUIActionNavigate)initWithDocument:(id)a3 appContext:(id)a4;
- (VUIDocumentDataSource)document;
- (void)performWithTargetResponder:(id)a3 completionHandler:(id)a4;
@end

@implementation VUIActionNavigate

- (VUIActionNavigate)initWithDocument:(id)a3 appContext:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)VUIActionNavigate;
  v9 = [(VUIActionNavigate *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_document, a3);
    objc_storeWeak((id *)&v10->_appContext, v8);
  }

  return v10;
}

- (void)performWithTargetResponder:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  document = self->_document;
  id v8 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_appContext);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __66__VUIActionNavigate_performWithTargetResponder_completionHandler___block_invoke;
  v11[3] = &unk_1E6DF3DD0;
  id v12 = v6;
  id v10 = v6;
  +[VUIApplicationRouter handleDocumentDataSource:document targetResponder:v8 appContext:WeakRetained documentOptions:MEMORY[0x1E4F1CC08] completion:v11];
}

uint64_t __66__VUIActionNavigate_performWithTargetResponder_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
  }
  return result;
}

- (VUIDocumentDataSource)document
{
  return self->_document;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_document, 0);
  objc_destroyWeak((id *)&self->_appContext);
}

@end
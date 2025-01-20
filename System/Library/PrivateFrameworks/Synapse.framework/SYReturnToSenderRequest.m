@interface SYReturnToSenderRequest
- (BOOL)shouldCreateNewMessage;
- (BOOL)verifyParameters;
- (NSString)documentIndexKey;
- (SYDocument)document;
- (SYDocumentAttributes)storedDocumentAttributes;
- (SYReturnToSenderRequest)init;
- (void)performWithServiceProxy:(id)a3 completion:(id)a4;
- (void)setDocument:(id)a3;
- (void)setShouldCreateNewMessage:(BOOL)a3;
- (void)setStoredDocumentAttributes:(id)a3;
- (void)verifyParameters;
@end

@implementation SYReturnToSenderRequest

- (SYReturnToSenderRequest)init
{
  v3.receiver = self;
  v3.super_class = (Class)SYReturnToSenderRequest;
  result = [(SYReturnToSenderRequest *)&v3 init];
  if (result) {
    result->_shouldCreateNewMessage = 0;
  }
  return result;
}

- (BOOL)verifyParameters
{
  objc_super v3 = [(SYReturnToSenderRequest *)self document];
  id v11 = 0;
  v4 = [v3 documentAttributesWithError:&v11];
  id v5 = v11;
  [(SYReturnToSenderRequest *)self setStoredDocumentAttributes:v4];

  v6 = [(SYReturnToSenderRequest *)self storedDocumentAttributes];

  if (!v6)
  {
    v7 = os_log_create("com.apple.synapse", "DocumentWorkflows");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      [(SYReturnToSenderRequest *)self verifyParameters];
    }
  }
  v8 = [(SYReturnToSenderRequest *)self storedDocumentAttributes];
  BOOL v9 = v8 != 0;

  return v9;
}

- (NSString)documentIndexKey
{
  v2 = [(SYReturnToSenderRequest *)self storedDocumentAttributes];
  objc_super v3 = [v2 indexKey];

  return (NSString *)v3;
}

- (void)performWithServiceProxy:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [(SYReturnToSenderRequest *)self document];
  BOOL v9 = [(SYReturnToSenderRequest *)self storedDocumentAttributes];
  BOOL v10 = [(SYReturnToSenderRequest *)self shouldCreateNewMessage];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __62__SYReturnToSenderRequest_performWithServiceProxy_completion___block_invoke;
  v12[3] = &unk_1E64641F8;
  v12[4] = self;
  id v13 = v6;
  id v11 = v6;
  [v7 returnToSenderDocument:v8 withAttributes:v9 shouldCreateNewMessage:v10 completion:v12];
}

void __62__SYReturnToSenderRequest_performWithServiceProxy_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ((a2 & 1) == 0)
  {
    id v6 = os_log_create("com.apple.synapse", "DocumentWorkflows");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      id v7 = [*(id *)(a1 + 32) document];
      v8 = [v7 fileURL];
      BOOL v9 = [*(id *)(a1 + 32) storedDocumentAttributes];
      BOOL v10 = [v9 sender];
      id v11 = [v10 name];
      int v13 = 138412546;
      v14 = v8;
      __int16 v15 = 2112;
      v16 = v11;
      _os_log_impl(&dword_1C2C5F000, v6, OS_LOG_TYPE_INFO, "Unable to return document at url: %@, to sender: %@", (uint8_t *)&v13, 0x16u);
    }
  }
  uint64_t v12 = *(void *)(a1 + 40);
  if (v12) {
    (*(void (**)(uint64_t, uint64_t, id))(v12 + 16))(v12, a2, v5);
  }
}

- (SYDocument)document
{
  return self->_document;
}

- (void)setDocument:(id)a3
{
}

- (BOOL)shouldCreateNewMessage
{
  return self->_shouldCreateNewMessage;
}

- (void)setShouldCreateNewMessage:(BOOL)a3
{
  self->_shouldCreateNewMessage = a3;
}

- (SYDocumentAttributes)storedDocumentAttributes
{
  return self->_storedDocumentAttributes;
}

- (void)setStoredDocumentAttributes:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storedDocumentAttributes, 0);
  objc_storeStrong((id *)&self->_document, 0);
}

- (void)verifyParameters
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v5 = [a1 document];
  id v6 = [v5 fileURL];
  int v7 = 138412546;
  v8 = v6;
  __int16 v9 = 2112;
  uint64_t v10 = a2;
  _os_log_error_impl(&dword_1C2C5F000, a3, OS_LOG_TYPE_ERROR, "Document doesn't have required attributes at url: %@, error: %@", (uint8_t *)&v7, 0x16u);
}

@end
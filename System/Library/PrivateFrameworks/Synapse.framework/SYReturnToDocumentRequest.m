@interface SYReturnToDocumentRequest
- (BOOL)verifyParameters;
- (NSString)documentIndexKey;
- (SYDocumentAttributes)documentAttributes;
- (void)performWithServiceProxy:(id)a3 completion:(id)a4;
- (void)setDocumentAttributes:(id)a3;
- (void)verifyParameters;
@end

@implementation SYReturnToDocumentRequest

- (BOOL)verifyParameters
{
  v2 = [(SYReturnToDocumentRequest *)self documentAttributes];

  if (!v2)
  {
    v3 = os_log_create("com.apple.synapse", "DocumentWorkflows");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      -[SYReturnToDocumentRequest verifyParameters](v3);
    }
  }
  return v2 != 0;
}

- (NSString)documentIndexKey
{
  v2 = [(SYReturnToDocumentRequest *)self documentAttributes];
  v3 = [v2 indexKey];

  return (NSString *)v3;
}

- (void)performWithServiceProxy:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [(SYReturnToDocumentRequest *)self documentAttributes];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __64__SYReturnToDocumentRequest_performWithServiceProxy_completion___block_invoke;
  v10[3] = &unk_1E6463968;
  id v11 = v6;
  id v9 = v6;
  [v7 returnToSenderDocument:0 withAttributes:v8 shouldCreateNewMessage:0 completion:v10];
}

uint64_t __64__SYReturnToDocumentRequest_performWithServiceProxy_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (SYDocumentAttributes)documentAttributes
{
  return self->_documentAttributes;
}

- (void)setDocumentAttributes:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)verifyParameters
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1C2C5F000, log, OS_LOG_TYPE_ERROR, "documentAttributes can't be nil.", v1, 2u);
}

@end
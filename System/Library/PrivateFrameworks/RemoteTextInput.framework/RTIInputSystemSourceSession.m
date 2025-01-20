@interface RTIInputSystemSourceSession
- (RTIDataPayload)currentForwardingDataPayload;
- (RTIInputSystemPayloadDelegate)forwardingPayloadDelegate;
- (RTIInputSystemPayloadDelegate)payloadDelegate;
- (RTIInputSystemSourceSession)init;
- (id)sessionIndependentPayloadDelegate;
- (unint64_t)payloadVersion;
- (void)addSessionDelegate:(id)a3;
- (void)flushOperations;
- (void)handleForwardingResponseActionPayload:(id)a3;
- (void)handleTextActionPayload:(id)a3;
- (void)notifySessionDelegateDidBegin:(id)a3;
- (void)setForwardingPayloadDelegate:(id)a3;
- (void)setPayloadDelegate:(id)a3;
- (void)setSessionDelegate:(id)a3;
@end

@implementation RTIInputSystemSourceSession

- (RTIInputSystemSourceSession)init
{
  v3.receiver = self;
  v3.super_class = (Class)RTIInputSystemSourceSession;
  result = [(RTIInputSystemSourceSession *)&v3 init];
  if (result) {
    result->_payloadVersion = 1;
  }
  return result;
}

- (void)flushOperations
{
  objc_super v3 = [(RTIInputSystemSession *)self textOperations];

  if (v3)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_payloadDelegate);
    if (WeakRetained)
    {
      v5 = WeakRetained;
      id v6 = objc_loadWeakRetained((id *)&self->_payloadDelegate);
      char v7 = objc_opt_respondsToSelector();

      if (v7)
      {
        v8 = objc_alloc_init(RTIInputSystemDataPayload);
        v9 = [(RTIInputSystemSession *)self textOperations];
        [(RTIInputSystemDataPayload *)v8 setTextOperations:v9];

        id v10 = objc_loadWeakRetained((id *)&self->_payloadDelegate);
        [v10 handleTextActionPayload:v8];
      }
    }
    v11 = [(RTIInputSystemSession *)self textOperations];
    v12 = [(RTIInputSystemSession *)self documentState];
    [(RTIInputSystemSession *)self _applyLocalTextOperations:v11 toDocumentState:v12];

    [(RTIInputSystemSession *)self setTextOperations:0];
  }
}

- (void)notifySessionDelegateDidBegin:(id)a3
{
  id v5 = a3;
  if (objc_opt_respondsToSelector())
  {
    v4 = [(RTIInputSystemSession *)self beginOptions];
    [v5 inputSessionDidBegin:self options:v4];
  }
  else if (objc_opt_respondsToSelector())
  {
    [v5 inputSessionDidBegin:self];
  }
}

- (void)setSessionDelegate:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)RTIInputSystemSourceSession;
  id v4 = a3;
  [(RTIInputSystemSession *)&v5 setSessionDelegate:v4];
  -[RTIInputSystemSourceSession notifySessionDelegateDidBegin:](self, "notifySessionDelegateDidBegin:", v4, v5.receiver, v5.super_class);
}

- (void)addSessionDelegate:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)RTIInputSystemSourceSession;
  id v4 = a3;
  [(RTIInputSystemSession *)&v5 addSessionDelegate:v4];
  -[RTIInputSystemSourceSession notifySessionDelegateDidBegin:](self, "notifySessionDelegateDidBegin:", v4, v5.receiver, v5.super_class);
}

- (RTIDataPayload)currentForwardingDataPayload
{
  objc_super v3 = +[RTIInputSystemDataPayload payloadWithData:0 version:[(RTIInputSystemSourceSession *)self payloadVersion]];
  id v4 = [(RTIInputSystemSession *)self documentTraits];
  [v3 setDocumentTraits:v4];

  objc_super v5 = [(RTIInputSystemSession *)self documentState];
  [v3 setDocumentState:v5];

  id v6 = [(RTIInputSystemSession *)self _textOperations];
  [v3 setTextOperations:v6];

  char v7 = [(RTIInputSystemSession *)self uuid];
  [v3 setSessionUUID:v7];

  [v3 updateData];
  return (RTIDataPayload *)v3;
}

- (void)handleForwardingResponseActionPayload:(id)a3
{
  id v16 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_payloadDelegate);
  if (WeakRetained)
  {
    objc_super v5 = WeakRetained;
    id v6 = objc_loadWeakRetained((id *)&self->_payloadDelegate);
    char v7 = objc_opt_respondsToSelector();

    if (v7)
    {
      id v8 = objc_loadWeakRetained((id *)&self->_payloadDelegate);
      [v8 handleTextActionPayload:v16];
    }
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v9 = v16;
  }
  else
  {
    id v10 = [v16 data];
    +[RTIInputSystemDataPayload payloadWithData:version:](RTIInputSystemDataPayload, "payloadWithData:version:", v10, [v16 version]);
    id v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  unint64_t payloadVersion = self->_payloadVersion;
  unint64_t v12 = [v16 version];
  if (payloadVersion >= v12) {
    unint64_t v13 = v12;
  }
  else {
    unint64_t v13 = payloadVersion;
  }
  self->_unint64_t payloadVersion = v13;
  v14 = [v9 textOperations];
  v15 = [(RTIInputSystemSession *)self documentState];
  [(RTIInputSystemSession *)self _applyLocalTextOperations:v14 toDocumentState:v15];
}

- (void)handleTextActionPayload:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(RTIInputSystemSourceSession *)self forwardingPayloadDelegate];

  if (v5)
  {
    id v6 = [(RTIInputSystemSourceSession *)self forwardingPayloadDelegate];
    [v6 handleTextActionPayload:v4];
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    char v7 = (void *)[v4 copy];
  }
  else
  {
    id v8 = [v4 data];
    char v7 = +[RTIInputSystemDataPayload payloadWithData:version:](RTIInputSystemDataPayload, "payloadWithData:version:", v8, [v4 version]);
  }
  unint64_t payloadVersion = self->_payloadVersion;
  unint64_t v10 = [v4 version];
  if (payloadVersion >= v10) {
    unint64_t v11 = v10;
  }
  else {
    unint64_t v11 = payloadVersion;
  }
  self->_unint64_t payloadVersion = v11;
  if ([v7 version] == 1)
  {
    unint64_t v12 = [v7 sessionUUID];

    if (v12)
    {
      unint64_t v13 = [v7 sessionUUID];
      [(RTIInputSystemSession *)self setUuid:v13];
    }
    v14 = [v7 data];

    if (!v14)
    {
      v23[0] = MEMORY[0x1E4F143A8];
      v23[1] = 3221225472;
      v23[2] = __55__RTIInputSystemSourceSession_handleTextActionPayload___block_invoke;
      v23[3] = &unk_1E583C210;
      v23[4] = self;
      [(RTIInputSystemSession *)self enumerateSessionDelegatesUsingBlock:v23];
    }
    v15 = [v7 documentTraits];

    if (v15)
    {
      id v16 = [v7 documentTraits];
      v17 = (void *)[v16 copy];
      [(RTIInputSystemSession *)self setDocumentTraits:v17];

      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __55__RTIInputSystemSourceSession_handleTextActionPayload___block_invoke_2;
      v22[3] = &unk_1E583C210;
      v22[4] = self;
      [(RTIInputSystemSession *)self enumerateSessionDelegatesUsingBlock:v22];
    }
    v18 = [v7 documentState];

    if (v18)
    {
      v19 = [v7 documentState];
      v20 = (void *)[v19 copy];
      [(RTIInputSystemSession *)self setDocumentState:v20];

      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __55__RTIInputSystemSourceSession_handleTextActionPayload___block_invoke_3;
      v21[3] = &unk_1E583C210;
      v21[4] = self;
      [(RTIInputSystemSession *)self enumerateSessionDelegatesUsingBlock:v21];
    }
  }
}

void __55__RTIInputSystemSourceSession_handleTextActionPayload___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector())
  {
    [v3 inputSessionDidEnd:*(void *)(a1 + 32) options:0];
  }
  else if (objc_opt_respondsToSelector())
  {
    [v3 inputSessionDidEnd:*(void *)(a1 + 32)];
  }
}

void __55__RTIInputSystemSourceSession_handleTextActionPayload___block_invoke_2(uint64_t a1, void *a2)
{
  id v5 = a2;
  if (objc_opt_respondsToSelector())
  {
    id v3 = *(void **)(a1 + 32);
    id v4 = [v3 documentTraits];
    [v5 inputSession:v3 documentTraitsDidChange:v4];
  }
}

void __55__RTIInputSystemSourceSession_handleTextActionPayload___block_invoke_3(uint64_t a1, void *a2)
{
  id v5 = a2;
  if (objc_opt_respondsToSelector())
  {
    id v3 = *(void **)(a1 + 32);
    id v4 = [v3 documentState];
    [v5 inputSession:v3 documentStateDidChange:v4];
  }
}

- (id)sessionIndependentPayloadDelegate
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v2 = RTILogFacility();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315138;
    id v5 = "-[RTIInputSystemSourceSession sessionIndependentPayloadDelegate]";
    _os_log_impl(&dword_19AFFA000, v2, OS_LOG_TYPE_DEFAULT, "%s  WARNING: -sessionIndependentPayloadDelegate is not implemented for this sourceSession", (uint8_t *)&v4, 0xCu);
  }

  return 0;
}

- (RTIInputSystemPayloadDelegate)forwardingPayloadDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_forwardingPayloadDelegate);
  return (RTIInputSystemPayloadDelegate *)WeakRetained;
}

- (void)setForwardingPayloadDelegate:(id)a3
{
}

- (unint64_t)payloadVersion
{
  return self->_payloadVersion;
}

- (RTIInputSystemPayloadDelegate)payloadDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_payloadDelegate);
  return (RTIInputSystemPayloadDelegate *)WeakRetained;
}

- (void)setPayloadDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_payloadDelegate);
  objc_destroyWeak((id *)&self->_forwardingPayloadDelegate);
}

@end
@interface _UIKeyboardImplProxy
- (TIKeyboardInputManagerToImplProtocol)delegate;
- (void)processPayloadInfo:(id)a3;
- (void)pushAutocorrections:(id)a3 requestToken:(id)a4;
- (void)pushCandidateResultSet:(id)a3 requestToken:(id)a4;
- (void)setDelegate:(id)a3;
@end

@implementation _UIKeyboardImplProxy

- (void)setDelegate:(id)a3
{
}

- (void)processPayloadInfo:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __43___UIKeyboardImplProxy_processPayloadInfo___block_invoke;
  v6[3] = &unk_1E52D9F98;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

- (void)pushAutocorrections:(id)a3 requestToken:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __57___UIKeyboardImplProxy_pushAutocorrections_requestToken___block_invoke;
  block[3] = &unk_1E52DCB30;
  block[4] = self;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

- (void)pushCandidateResultSet:(id)a3 requestToken:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __60___UIKeyboardImplProxy_pushCandidateResultSet_requestToken___block_invoke;
  block[3] = &unk_1E52DCB30;
  block[4] = self;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

- (TIKeyboardInputManagerToImplProtocol)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (TIKeyboardInputManagerToImplProtocol *)WeakRetained;
}

- (void).cxx_destruct
{
}

@end
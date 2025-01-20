@interface _UINavigationBarTitleRenamerRemoteSession
+ (BOOL)supportsBSXPCSecureCoding;
- (BOOL)_client_textFieldShouldEndEditingWithText:(id)a3;
- (BOOL)_isServerSide;
- (BOOL)_server_textFieldShouldEndEditingWithText:(id)a3;
- (BOOL)_textFieldShouldEndEditingWithText:(id)a3;
- (FBSSceneIdentityToken)sceneOriginIdentityToken;
- (FPSandboxingURLWrapper)urlWrapper;
- (NSURL)fileURL;
- (_UINavigationBarTitleRenamerRemoteSession)initWithBSXPCCoder:(id)a3;
- (_UINavigationBarTitleRenamerRemoteSession)initWithFileURL:(id)a3 iconMetadata:(id)a4 error:(id *)a5 scene:(id)a6;
- (_UINavigationBarTitleRenamerRemoteSession)initWithSuggestedTitle:(id)a3 iconMetadata:(id)a4 scene:(id)a5;
- (_UIOServiceConnection)connection;
- (_UIOverlayService)overlayService;
- (id)_client_willBeginRenamingWithText:(id)a3 selectedRange:(_NSRange *)a4;
- (id)_server_willBeginRenamingWithText:(id)a3 selectedRange:(_NSRange *)a4;
- (id)_willBeginRenamingWithText:(id)a3 selectedRange:(_NSRange *)a4;
- (id)createRenamerContentView;
- (void)_attemptLocalRenameForFileURL:(id)a3 proposedName:(id)a4 completionHandler:(id)a5;
- (void)_client_cancelSessionAndNotify:(BOOL)a3;
- (void)_client_fileRenameDidEnd:(id)a3;
- (void)_client_fileRenameDidFail:(id)a3 proposedName:(id)a4;
- (void)_client_sessionDidEnd;
- (void)_client_sessionDidStartInRenamer:(id)a3;
- (void)_client_textFieldDidEndEditingWithText:(id)a3;
- (void)_server_cancelSessionAndNotify:(BOOL)a3;
- (void)_server_fileRenameDidEnd:(id)a3;
- (void)_server_fileRenameDidFail:(id)a3 proposedName:(id)a4;
- (void)_server_sessionDidEnd;
- (void)_server_sessionDidStartInRenamer:(id)a3;
- (void)_server_textFieldDidEndEditingWithText:(id)a3;
- (void)_textFieldDidEndEditingWithText:(id)a3;
- (void)_updateSessionWithAction:(int64_t)a3;
- (void)cancelSession;
- (void)cancelSessionAndNotify:(BOOL)a3;
- (void)dealloc;
- (void)encodeWithBSXPCCoder:(id)a3;
- (void)fileRenameDidEnd:(id)a3;
- (void)fileRenameDidFail:(id)a3 proposedName:(id)a4;
- (void)overlayServiceDidInvalidate:(id)a3;
- (void)serviceConnectionDidInvalidate:(id)a3;
- (void)sessionDidEnd;
- (void)sessionDidStartInRenamer:(id)a3;
- (void)setConnection:(id)a3;
@end

@implementation _UINavigationBarTitleRenamerRemoteSession

- (_UINavigationBarTitleRenamerRemoteSession)initWithSuggestedTitle:(id)a3 iconMetadata:(id)a4 scene:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (_UIApplicationProcessIsOverlayUI())
  {
    v20 = [MEMORY[0x1E4F28B00] currentHandler];
    [v20 handleFailureInMethod:a2 object:self file:@"_UINavigationBarTitleRenamerRemoteSession.m" lineNumber:348 description:@"initializing a remote session in this process is not allowed outside of decoding a session from another process."];
  }
  v21.receiver = self;
  v21.super_class = (Class)_UINavigationBarTitleRenamerRemoteSession;
  v12 = [(_UINavigationBarTitleRenamerSession *)&v21 initWithSuggestedTitle:v9 iconMetadata:v10];
  if (v12)
  {
    v13 = (_UIOverlayService *)objc_opt_new();
    [(_UIOverlayService *)v13 setDelegate:v12];
    [(_UIOverlayService *)v13 prewarmConnection];
    overlayService = v12->_overlayService;
    v12->_overlayService = v13;
    v15 = v13;

    v16 = [v11 _FBSScene];
    uint64_t v17 = [v16 identityToken];
    sceneOriginIdentityToken = v12->_sceneOriginIdentityToken;
    v12->_sceneOriginIdentityToken = (FBSSceneIdentityToken *)v17;

    v12->_currentState = 1;
  }

  return v12;
}

- (_UINavigationBarTitleRenamerRemoteSession)initWithFileURL:(id)a3 iconMetadata:(id)a4 error:(id *)a5 scene:(id)a6
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a6;
  id v13 = a4;
  if (_UIApplicationProcessIsOverlayUI())
  {
    v25 = [MEMORY[0x1E4F28B00] currentHandler];
    [v25 handleFailureInMethod:a2 object:self file:@"_UINavigationBarTitleRenamerRemoteSession.m" lineNumber:376 description:@"initializing a remote session in this process is not allowed outside of decoding a session from another process."];
  }
  v14 = [v11 lastPathComponent];
  v15 = [v14 stringByDeletingPathExtension];
  v16 = [(_UINavigationBarTitleRenamerRemoteSession *)self initWithSuggestedTitle:v15 iconMetadata:v13 scene:v12];

  if (!v16) {
    goto LABEL_9;
  }
  int v17 = [v11 startAccessingSecurityScopedResource];
  id v29 = 0;
  uint64_t v18 = [getFPSandboxingURLWrapperClass() wrapperWithURL:v11 readonly:0 error:&v29];
  id v19 = v29;
  urlWrapper = v16->_urlWrapper;
  v16->_urlWrapper = (FPSandboxingURLWrapper *)v18;

  if (v17) {
    [v11 stopAccessingSecurityScopedResource];
  }
  if (v19)
  {
    id v21 = v19;
    *a5 = v21;
    unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("OOPRename", &initWithFileURL_iconMetadata_error_scene____s_category);
    if (*(unsigned char *)CategoryCachedImpl)
    {
      v26 = *(NSObject **)(CategoryCachedImpl + 8);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        v27 = v26;
        v28 = [(_UINavigationBarTitleRenamerSession *)v16 sessionIdentifier];
        *(_DWORD *)buf = 138412546;
        v31 = v28;
        __int16 v32 = 2112;
        id v33 = v21;
        _os_log_impl(&dword_1853B0000, v27, OS_LOG_TYPE_ERROR, "[%@] Unable to get sandbox extension for URL. Session will behave like a local session: %@", buf, 0x16u);
      }
    }

    v23 = 0;
  }
  else
  {
LABEL_9:
    v23 = v16;
  }

  return v23;
}

- (void)dealloc
{
  [(_UINavigationBarTitleRenamerRemoteSession *)self setConnection:0];
  v3.receiver = self;
  v3.super_class = (Class)_UINavigationBarTitleRenamerRemoteSession;
  [(_UINavigationBarTitleRenamerRemoteSession *)&v3 dealloc];
}

- (id)createRenamerContentView
{
  objc_super v3 = [(_UINavigationBarTitleRenamerRemoteSession *)self overlayService];

  if (v3)
  {
    v4 = [[_UINavigationBarTitleRenameRemoteView alloc] initWithSession:self];
  }
  else
  {
    v4 = [[_UINavigationBarTitleRenameTextField alloc] initWithSession:self];
    v5 = [(_UINavigationBarTitleRenamerRemoteSession *)self sceneOriginIdentityToken];
    [(_UINavigationBarTitleRenameRemoteView *)v4 _setLayeringSceneIdentity:v5];
  }
  return v4;
}

- (NSURL)fileURL
{
  v2 = [(_UINavigationBarTitleRenamerRemoteSession *)self urlWrapper];
  objc_super v3 = [v2 url];

  return (NSURL *)v3;
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  id v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)_UINavigationBarTitleRenamerRemoteSession;
  [(_UINavigationBarTitleRenamerSession *)&v6 encodeWithBSXPCCoder:v4];
  urlWrapper = self->_urlWrapper;
  if (urlWrapper) {
    [v4 encodeObject:urlWrapper forKey:@"_UINavigationBarTitleRenamerRemoteSessionURLWrapper"];
  }
  [v4 encodeObject:self->_sceneOriginIdentityToken forKey:@"_UINavigationBarTitleRenamerRemoteSessionSceneOriginIdentityToken"];
}

- (_UINavigationBarTitleRenamerRemoteSession)initWithBSXPCCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_UINavigationBarTitleRenamerRemoteSession;
  v5 = [(_UINavigationBarTitleRenamerSession *)&v11 initWithBSXPCCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:getFPSandboxingURLWrapperClass() forKey:@"_UINavigationBarTitleRenamerRemoteSessionURLWrapper"];
    urlWrapper = v5->_urlWrapper;
    v5->_urlWrapper = (FPSandboxingURLWrapper *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_UINavigationBarTitleRenamerRemoteSessionSceneOriginIdentityToken"];
    sceneOriginIdentityToken = v5->_sceneOriginIdentityToken;
    v5->_sceneOriginIdentityToken = (FBSSceneIdentityToken *)v8;

    v5->_currentState = 1;
  }

  return v5;
}

- (BOOL)_isServerSide
{
  v2 = [(_UINavigationBarTitleRenamerRemoteSession *)self connection];
  BOOL v3 = v2 != 0;

  return v3;
}

- (void)sessionDidStartInRenamer:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("OOPRename", &sessionDidStartInRenamer____s_category);
  if (*(unsigned char *)CategoryCachedImpl)
  {
    uint64_t v6 = *(NSObject **)(CategoryCachedImpl + 8);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = v6;
      [(_UINavigationBarTitleRenamerSession *)self sessionIdentifier];
      *(void *)((char *)&v9 + 4) = LODWORD(v9) = 138412290;
      uint64_t v8 = *(void **)((char *)&v9 + 4);
      _os_log_impl(&dword_1853B0000, v7, OS_LOG_TYPE_ERROR, "[%@] Session did start.", (uint8_t *)&v9, 0xCu);
    }
  }
  id v13 = 0;
  *(void *)&long long v9 = self;
  *((void *)&v9 + 1) = v4;
  uint64_t v10 = 0;
  uint64_t v11 = 0;
  uint64_t v12 = 0;
  id v14 = 0;
  handleEvent(stateMachineSpec_6, self->_currentState, 0, (uint64_t)&v9, (uint64_t *)&self->_currentState);
}

- (void)sessionDidEnd
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("OOPRename", &sessionDidEnd___s_category);
  if (*(unsigned char *)CategoryCachedImpl)
  {
    id v4 = *(NSObject **)(CategoryCachedImpl + 8);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = v4;
      [(_UINavigationBarTitleRenamerSession *)self sessionIdentifier];
      *(void *)&v7[4] = *(_DWORD *)v7 = 138412290;
      uint64_t v6 = *(void **)&v7[4];
      _os_log_impl(&dword_1853B0000, v5, OS_LOG_TYPE_ERROR, "[%@] Session did end.", v7, 0xCu);
    }
  }
  long long v9 = 0u;
  long long v8 = 0u;
  *(_OWORD *)&v7[8] = 0u;
  *(void *)v7 = self;
  handleEvent(stateMachineSpec_6, self->_currentState, 4, (uint64_t)v7, (uint64_t *)&self->_currentState);
}

- (void)cancelSessionAndNotify:(BOOL)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("OOPRename", &cancelSessionAndNotify____s_category);
  if (*(unsigned char *)CategoryCachedImpl)
  {
    uint64_t v6 = *(NSObject **)(CategoryCachedImpl + 8);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = v6;
      [(_UINavigationBarTitleRenamerSession *)self sessionIdentifier];
      *(void *)&v9[4] = *(_DWORD *)long long v9 = 138412290;
      long long v8 = *(void **)&v9[4];
      _os_log_impl(&dword_1853B0000, v7, OS_LOG_TYPE_ERROR, "[%@] Session did cancel.", v9, 0xCu);
    }
  }
  long long v10 = 0u;
  long long v11 = 0u;
  *(_OWORD *)&v9[8] = 0u;
  *(void *)long long v9 = self;
  BYTE8(v10) = a3;
  handleEvent(stateMachineSpec_6, self->_currentState, 7, (uint64_t)v9, (uint64_t *)&self->_currentState);
}

- (void)cancelSession
{
}

- (id)_willBeginRenamingWithText:(id)a3 selectedRange:(_NSRange *)a4
{
  id v6 = a3;
  uint64_t v12 = 0;
  id v13 = 0;
  v9[0] = self;
  v9[1] = 0;
  id v10 = v6;
  long long v11 = a4;
  id v14 = 0;
  if ((handleEvent(stateMachineSpec_6, self->_currentState, 1, (uint64_t)v9, (uint64_t *)&self->_currentState) & 1) == 0) {
    [(_UINavigationBarTitleRenamerRemoteSession *)self cancelSessionAndNotify:1];
  }
  id v7 = v10;

  return v7;
}

- (BOOL)_textFieldShouldEndEditingWithText:(id)a3
{
  id v4 = a3;
  v7[0] = self;
  v7[1] = 0;
  v7[2] = v4;
  long long v8 = 0u;
  long long v9 = 0u;
  if ((handleEvent(stateMachineSpec_6, self->_currentState, 2, (uint64_t)v7, (uint64_t *)&self->_currentState) & 1) == 0) {
    [(_UINavigationBarTitleRenamerRemoteSession *)self cancelSessionAndNotify:1];
  }
  char v5 = BYTE9(v8);

  return v5;
}

- (void)_textFieldDidEndEditingWithText:(id)a3
{
  id v4 = a3;
  v5[0] = self;
  v5[1] = 0;
  v5[2] = v4;
  long long v6 = 0u;
  long long v7 = 0u;
  if ((handleEvent(stateMachineSpec_6, self->_currentState, 3, (uint64_t)v5, (uint64_t *)&self->_currentState) & 1) == 0) {
    [(_UINavigationBarTitleRenamerRemoteSession *)self cancelSessionAndNotify:1];
  }
}

- (void)fileRenameDidFail:(id)a3 proposedName:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("OOPRename", &fileRenameDidFail_proposedName____s_category);
  if (*(unsigned char *)CategoryCachedImpl)
  {
    id v10 = *(NSObject **)(CategoryCachedImpl + 8);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      long long v11 = v10;
      [(_UINavigationBarTitleRenamerSession *)self sessionIdentifier];
      *(void *)&v13[4] = *(_DWORD *)id v13 = 138412546;
      *(_WORD *)&v13[12] = 2112;
      *(void *)&v13[14] = v6;
      uint64_t v12 = *(void **)&v13[4];
      _os_log_impl(&dword_1853B0000, v11, OS_LOG_TYPE_ERROR, "[%@] Session file rename did fail: %@", v13, 0x16u);
    }
  }
  *(void *)id v13 = self;
  *(void *)&v13[8] = 0;
  uint64_t v14 = 0;
  uint64_t v15 = 0;
  *(void *)&v13[16] = v7;
  id v9 = v6;
  id v16 = v9;
  id v17 = 0;
  if ((handleEvent(stateMachineSpec_6, self->_currentState, 5, (uint64_t)v13, (uint64_t *)&self->_currentState) & 1) == 0) {
    [(_UINavigationBarTitleRenamerRemoteSession *)self cancelSessionAndNotify:1];
  }
}

- (void)fileRenameDidEnd:(id)a3
{
  id v6 = 0;
  v5[0] = self;
  memset(&v5[1], 0, 32);
  id v4 = a3;
  id v7 = v4;
  if ((handleEvent(stateMachineSpec_6, *(void *)(v5[0] + 56), 6, (uint64_t)v5, (uint64_t *)(v5[0] + 56)) & 1) == 0) {
    [(_UINavigationBarTitleRenamerRemoteSession *)self cancelSessionAndNotify:1];
  }
}

- (void)overlayServiceDidInvalidate:(id)a3
{
}

- (void)_updateSessionWithAction:(int64_t)a3
{
  char v5 = [_UIONavigationBarTitleRenamerConnectionAction alloc];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __70___UINavigationBarTitleRenamerRemoteSession__updateSessionWithAction___block_invoke;
  v8[3] = &unk_1E5302940;
  v8[4] = self;
  id v6 = [(_UIONavigationBarTitleRenamerConnectionAction *)v5 initWithSession:self action:a3 responseHandler:v8];
  id v7 = [(_UINavigationBarTitleRenamerRemoteSession *)self overlayService];
  [v7 sendOverlayAction:v6];
}

- (void)_client_sessionDidStartInRenamer:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)_UINavigationBarTitleRenamerRemoteSession;
  [(_UINavigationBarTitleRenamerSession *)&v4 sessionDidStartInRenamer:a3];
  [(_UINavigationBarTitleRenamerRemoteSession *)self _updateSessionWithAction:0];
}

- (void)_client_sessionDidEnd
{
  v3.receiver = self;
  v3.super_class = (Class)_UINavigationBarTitleRenamerRemoteSession;
  [(_UINavigationBarTitleRenamerSession *)&v3 sessionDidEnd];
  [(_UINavigationBarTitleRenamerRemoteSession *)self _updateSessionWithAction:1];
}

- (void)_client_cancelSessionAndNotify:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)_UINavigationBarTitleRenamerRemoteSession;
  [(_UINavigationBarTitleRenamerSession *)&v5 cancelSession];
  if (v3) {
    [(_UINavigationBarTitleRenamerRemoteSession *)self _updateSessionWithAction:2];
  }
}

- (id)_client_willBeginRenamingWithText:(id)a3 selectedRange:(_NSRange *)a4
{
  v6.receiver = self;
  v6.super_class = (Class)_UINavigationBarTitleRenamerRemoteSession;
  objc_super v4 = [(_UINavigationBarTitleRenamerSession *)&v6 _willBeginRenamingWithText:a3 selectedRange:a4];
  return v4;
}

- (BOOL)_client_textFieldShouldEndEditingWithText:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)_UINavigationBarTitleRenamerRemoteSession;
  return [(_UINavigationBarTitleRenamerSession *)&v4 _textFieldShouldEndEditingWithText:a3];
}

- (void)_client_textFieldDidEndEditingWithText:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)_UINavigationBarTitleRenamerRemoteSession;
  [(_UINavigationBarTitleRenamerSession *)&v3 _textFieldDidEndEditingWithText:a3];
}

- (void)_attemptLocalRenameForFileURL:(id)a3 proposedName:(id)a4 completionHandler:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = dispatch_get_global_queue(25, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __106___UINavigationBarTitleRenamerRemoteSession__attemptLocalRenameForFileURL_proposedName_completionHandler___block_invoke;
  block[3] = &unk_1E52E3298;
  id v15 = v7;
  id v16 = v8;
  id v17 = v9;
  id v11 = v9;
  id v12 = v8;
  id v13 = v7;
  dispatch_async(v10, block);
}

- (void)_client_fileRenameDidFail:(id)a3 proposedName:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(_UINavigationBarTitleRenamerRemoteSession *)self fileURL];
  id v9 = [v6 domain];
  if (![v9 isEqualToString:*MEMORY[0x1E4F281F8]] || objc_msgSend(v6, "code") != 4)
  {

    goto LABEL_6;
  }

  if (!v8)
  {
LABEL_6:
    id v10 = [(_UINavigationBarTitleRenamerSession *)self attachedRenamer];
    [v10 _session:self fileRenameDidFail:v6];

    goto LABEL_7;
  }
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __84___UINavigationBarTitleRenamerRemoteSession__client_fileRenameDidFail_proposedName___block_invoke;
  v11[3] = &unk_1E53070D0;
  v11[4] = self;
  [(_UINavigationBarTitleRenamerRemoteSession *)self _attemptLocalRenameForFileURL:v8 proposedName:v7 completionHandler:v11];
LABEL_7:
}

- (void)_client_fileRenameDidEnd:(id)a3
{
  id v4 = a3;
  id v5 = [(_UINavigationBarTitleRenamerSession *)self attachedRenamer];
  [v5 _session:self fileRenameDidEnd:v4];
}

- (void)setConnection:(id)a3
{
  id v5 = (_UIOServiceConnection *)a3;
  connection = self->_connection;
  id v7 = v5;
  if (connection != v5)
  {
    [(_UIOServiceConnection *)connection removeObserver:self];
    objc_storeStrong((id *)&self->_connection, a3);
    [(_UIOServiceConnection *)v7 addObserver:self];
  }
}

- (void)serviceConnectionDidInvalidate:(id)a3
{
}

- (void)_server_sessionDidStartInRenamer:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)_UINavigationBarTitleRenamerRemoteSession;
  [(_UINavigationBarTitleRenamerSession *)&v3 sessionDidStartInRenamer:a3];
}

- (void)_server_sessionDidEnd
{
  v2.receiver = self;
  v2.super_class = (Class)_UINavigationBarTitleRenamerRemoteSession;
  [(_UINavigationBarTitleRenamerSession *)&v2 sessionDidEnd];
}

- (void)_server_cancelSessionAndNotify:(BOOL)a3
{
  BOOL v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)_UINavigationBarTitleRenamerRemoteSession;
  [(_UINavigationBarTitleRenamerSession *)&v7 cancelSession];
  if (v3)
  {
    id v5 = +[_UIONavigationBarTitleRenamerRemoteSessionAction didCancelSession:self responseHandler:&__block_literal_global_63_4];
    id v6 = [(_UINavigationBarTitleRenamerRemoteSession *)self connection];
    [v6 sendAction:v5];
  }
}

- (id)_server_willBeginRenamingWithText:(id)a3 selectedRange:(_NSRange *)a4
{
  id v6 = a3;
  objc_super v7 = [(_UINavigationBarTitleRenamerRemoteSession *)self fileURL];
  if (v7)
  {
    id v8 = v6;
  }
  else
  {
    id v9 = dispatch_group_create();
    dispatch_group_enter(v9);
    uint64_t v27 = 0;
    v28 = &v27;
    uint64_t v29 = 0x3032000000;
    v30 = __Block_byref_object_copy__182;
    v31 = __Block_byref_object_dispose__182;
    id v32 = 0;
    uint64_t v21 = 0;
    v22 = (_NSRange *)&v21;
    uint64_t v23 = 0x3010000000;
    uint64_t v25 = 0;
    uint64_t v26 = 0;
    v24 = &unk_186D7DBA7;
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __93___UINavigationBarTitleRenamerRemoteSession__server_willBeginRenamingWithText_selectedRange___block_invoke;
    v17[3] = &unk_1E5307118;
    id v19 = &v27;
    v20 = &v21;
    id v10 = v9;
    uint64_t v18 = v10;
    id v11 = +[_UIONavigationBarTitleRenamerRemoteSessionAction willBeginRenamingActionWithSession:text:selectedRange:responseHandler:](_UIONavigationBarTitleRenamerRemoteSessionAction, "willBeginRenamingActionWithSession:text:selectedRange:responseHandler:", self, v6, a4->location, a4->length, v17);
    id v12 = [(_UINavigationBarTitleRenamerRemoteSession *)self connection];
    [v12 sendAction:v11];

    dispatch_time_t v13 = dispatch_time(0, 2000000000);
    dispatch_group_wait(v10, v13);
    uint64_t v14 = v28;
    if (v28[5])
    {
      *a4 = v22[2];
      id v15 = (void *)v14[5];
    }
    else
    {
      [(_UINavigationBarTitleRenamerRemoteSession *)self cancelSessionAndNotify:1];
      id v15 = v6;
    }
    id v8 = v15;

    _Block_object_dispose(&v21, 8);
    _Block_object_dispose(&v27, 8);
  }
  return v8;
}

- (BOOL)_server_textFieldShouldEndEditingWithText:(id)a3
{
  id v4 = a3;
  id v5 = [(_UINavigationBarTitleRenamerRemoteSession *)self fileURL];
  BOOL v6 = 1;
  if (!v5)
  {
    objc_super v7 = dispatch_group_create();
    dispatch_group_enter(v7);
    uint64_t v19 = 0;
    v20 = &v19;
    uint64_t v21 = 0x2020000000;
    char v22 = 1;
    uint64_t v13 = MEMORY[0x1E4F143A8];
    uint64_t v14 = 3221225472;
    id v15 = __87___UINavigationBarTitleRenamerRemoteSession__server_textFieldShouldEndEditingWithText___block_invoke;
    id v16 = &unk_1E5307140;
    uint64_t v18 = &v19;
    id v8 = v7;
    id v17 = v8;
    id v9 = +[_UIONavigationBarTitleRenamerRemoteSessionAction shouldEndEditingActionWithSession:self text:v4 responseHandler:&v13];
    id v10 = [(_UINavigationBarTitleRenamerRemoteSession *)self connection];
    [v10 sendAction:v9];

    dispatch_time_t v11 = dispatch_time(0, 2000000000);
    dispatch_group_wait(v8, v11);
    BOOL v6 = *((unsigned char *)v20 + 24) != 0;

    _Block_object_dispose(&v19, 8);
  }

  return v6;
}

- (void)_server_textFieldDidEndEditingWithText:(id)a3
{
  id v4 = a3;
  id v5 = [(_UINavigationBarTitleRenamerRemoteSession *)self fileURL];
  if (v5)
  {
    objc_initWeak(&location, self);
    BOOL v6 = [v5 lastPathComponent];
    objc_super v7 = [v6 stringByDeletingPathExtension];
    int v8 = [v7 isEqual:v4];

    if (v8)
    {
      [(_UINavigationBarTitleRenamerRemoteSession *)self fileRenameDidEnd:v5];
    }
    else
    {
      char v11 = [v5 startAccessingSecurityScopedResource];
      uint64_t v21 = 0;
      char v22 = &v21;
      uint64_t v23 = 0x2050000000;
      id v12 = (void *)qword_1EB258658;
      uint64_t v24 = qword_1EB258658;
      if (!qword_1EB258658)
      {
        v20[0] = MEMORY[0x1E4F143A8];
        v20[1] = 3221225472;
        v20[2] = __getDOCRenameSupportClass_block_invoke;
        v20[3] = &unk_1E52D9900;
        v20[4] = &v21;
        __getDOCRenameSupportClass_block_invoke((uint64_t)v20);
        id v12 = (void *)v22[3];
      }
      id v13 = v12;
      _Block_object_dispose(&v21, 8);
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __84___UINavigationBarTitleRenamerRemoteSession__server_textFieldDidEndEditingWithText___block_invoke;
      v14[3] = &unk_1E5307168;
      objc_copyWeak(&v17, &location);
      id v15 = v4;
      char v18 = v11;
      id v16 = v5;
      objc_msgSend(v13, "_spi_renameDocumentAtURL:proposedName:completionHandler:", v16, v15, v14);

      objc_destroyWeak(&v17);
    }
    objc_destroyWeak(&location);
  }
  else
  {
    id v9 = +[_UIONavigationBarTitleRenamerRemoteSessionAction didEndEditingActionWithSession:self text:v4 responseHandler:&__block_literal_global_65_2];
    id v10 = [(_UINavigationBarTitleRenamerRemoteSession *)self connection];
    [v10 sendAction:v9];
  }
}

- (void)_server_fileRenameDidFail:(id)a3 proposedName:(id)a4
{
  id v6 = +[_UIONavigationBarTitleRenamerRemoteSessionAction fileRenameDidFailInSession:self withError:a3 proposedName:a4 responseHandler:&__block_literal_global_67_4];
  id v5 = [(_UINavigationBarTitleRenamerRemoteSession *)self connection];
  [v5 sendAction:v6];
}

- (void)_server_fileRenameDidEnd:(id)a3
{
  id v5 = +[_UIONavigationBarTitleRenamerRemoteSessionAction fileRenameDidEndInSession:self withFinalURL:a3 responseHandler:&__block_literal_global_69_2];
  id v4 = [(_UINavigationBarTitleRenamerRemoteSession *)self connection];
  [v4 sendAction:v5];
}

- (FPSandboxingURLWrapper)urlWrapper
{
  return self->_urlWrapper;
}

- (FBSSceneIdentityToken)sceneOriginIdentityToken
{
  return self->_sceneOriginIdentityToken;
}

- (_UIOverlayService)overlayService
{
  return self->_overlayService;
}

- (_UIOServiceConnection)connection
{
  return self->_connection;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_overlayService, 0);
  objc_storeStrong((id *)&self->_sceneOriginIdentityToken, 0);
  objc_storeStrong((id *)&self->_urlWrapper, 0);
}

@end
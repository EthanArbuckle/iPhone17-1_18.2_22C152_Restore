@interface _UIONavigationBarTitleRenamerConnectionAction
- (BOOL)isPermitted;
- (SBSKeyboardFocusService)kfService;
- (_UIONavigationBarTitleRenamerConnectionAction)initWithSession:(id)a3 action:(int64_t)a4 responseHandler:(id)a5;
- (void)_addViewToHierarchyForConnection:(id)a3 session:(id)a4;
- (void)_removeViewFromHierarchyForConnection:(id)a3 session:(id)a4;
- (void)_setupKeyboardEventDeferralForConnection:(id)a3;
- (void)_teardownKeyboardEventDeferralForConnection:(id)a3;
- (void)performActionFromConnection:(id)a3;
- (void)setKfService:(id)a3;
@end

@implementation _UIONavigationBarTitleRenamerConnectionAction

- (_UIONavigationBarTitleRenamerConnectionAction)initWithSession:(id)a3 action:(int64_t)a4 responseHandler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = objc_alloc_init(MEMORY[0x1E4F4F7A0]);
  v11 = [NSNumber numberWithInteger:a4];
  [v10 setObject:v11 forSetting:0];

  if ((unint64_t)(a4 - 1) >= 2)
  {
    if (!a4) {
      [v10 setObject:v8 forSetting:1];
    }
  }
  else
  {
    v12 = [v8 sessionIdentifier];
    [v10 setObject:v12 forSetting:2];
  }
  v13 = (void *)MEMORY[0x1E4F4F670];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __88___UIONavigationBarTitleRenamerConnectionAction_initWithSession_action_responseHandler___block_invoke;
  v19[3] = &unk_1E52EE548;
  id v20 = v9;
  id v14 = v9;
  v15 = [v13 responderWithHandler:v19];
  v18.receiver = self;
  v18.super_class = (Class)_UIONavigationBarTitleRenamerConnectionAction;
  v16 = [(_UIOServerAction *)&v18 initWithOriginContext:0 info:v10 responder:v15];

  return v16;
}

- (BOOL)isPermitted
{
  return 1;
}

- (void)_setupKeyboardEventDeferralForConnection:(id)a3
{
  v4 = [a3 server];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __90___UIONavigationBarTitleRenamerConnectionAction__setupKeyboardEventDeferralForConnection___block_invoke;
  v5[3] = &unk_1E53001A0;
  v5[4] = self;
  [v4 awaitDisplayDelegateForAction:self sceneType:2 timeout:v5 completion:1.0];
}

- (void)_teardownKeyboardEventDeferralForConnection:(id)a3
{
  v4 = [a3 server];
  v5 = [v4 displayDelegateForAction:self sceneType:2];
  id v9 = [v5 windowScene];

  v6 = [(_UIONavigationBarTitleRenamerConnectionAction *)self kfService];
  v7 = [v9 _FBSScene];
  id v8 = [v7 identityToken];
  [v6 removeKeyboardFocusFromSceneIdentity:v8 processID:getpid()];

  [(_UIONavigationBarTitleRenamerConnectionAction *)self setKfService:0];
}

- (void)_addViewToHierarchyForConnection:(id)a3 session:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v7 renamerContentView];
  id v9 = [v8 superview];

  if (!v9)
  {
    id v10 = [v6 server];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __90___UIONavigationBarTitleRenamerConnectionAction__addViewToHierarchyForConnection_session___block_invoke;
    v11[3] = &unk_1E530E5E8;
    v11[4] = self;
    id v12 = v7;
    id v13 = v8;
    [v10 awaitDisplayDelegateForAction:self sceneType:2 timeout:v11 completion:1.0];
  }
}

- (void)_removeViewFromHierarchyForConnection:(id)a3 session:(id)a4
{
  objc_msgSend(a4, "existingRenamerContentView", a3);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [v4 removeFromSuperview];
}

- (void)performActionFromConnection:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(_UIONavigationBarTitleRenamerConnectionAction *)self canSendResponse])
  {
    v5 = [(_UIONavigationBarTitleRenamerConnectionAction *)self info];
    id v6 = [v5 objectForSetting:0];
    uint64_t v7 = (int)[v6 intValue];

    id v8 = +[_UINavigationBarTitleRenamer renameServer];
    if (v7 == 2)
    {
      v15 = [(_UIONavigationBarTitleRenamerConnectionAction *)self info];
      id v10 = [v15 objectForSetting:2];

      if (v10)
      {
        v16 = [v8 sessionWithIdentifier:v10];
        if (v16)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            [v16 cancelSessionAndNotify:0];
LABEL_16:
            [(_UIONavigationBarTitleRenamerConnectionAction *)self _removeViewFromHierarchyForConnection:v4 session:v16];
            [(_UIONavigationBarTitleRenamerConnectionAction *)self _teardownKeyboardEventDeferralForConnection:v4];
            goto LABEL_17;
          }
        }
LABEL_19:
        objc_super v18 = [MEMORY[0x1E4F28C58] errorWithDomain:0x1ED12F8C0 code:1 userInfo:0];
        v19 = (void *)[objc_alloc(MEMORY[0x1E4F4F678]) initWithInfo:0 error:v18];
        [(_UIONavigationBarTitleRenamerConnectionAction *)self sendResponse:v19];

        goto LABEL_20;
      }
    }
    else
    {
      if (v7 != 1)
      {
        if (v7)
        {
LABEL_28:
          id v10 = (void *)[objc_alloc(MEMORY[0x1E4F4F678]) initWithInfo:0 error:0];
          [(_UIONavigationBarTitleRenamerConnectionAction *)self sendResponse:v10];
          goto LABEL_29;
        }
        id v9 = [(_UIONavigationBarTitleRenamerConnectionAction *)self info];
        id v10 = [v9 objectForSetting:1];

        if (v10)
        {
          long long v25 = 0u;
          long long v26 = 0u;
          v11 = [v4 connection];
          id v12 = [v11 remoteProcess];
          id v13 = [v12 auditToken];
          id v14 = v13;
          if (v13)
          {
            [v13 realToken];
          }
          else
          {
            long long v25 = 0u;
            long long v26 = 0u;
          }

          id v20 = [v10 fileURL];
          uint64_t v21 = [v20 fileSystemRepresentation];

          *(_OWORD *)buf = v25;
          long long v28 = v26;
          if (!sandbox_check_by_audit_token())
          {
            -[_UIONavigationBarTitleRenamerConnectionAction _setupKeyboardEventDeferralForConnection:](self, "_setupKeyboardEventDeferralForConnection:", v4, v21);
            [v10 setConnection:v4];
            [v8 startSession:v10];
            [(_UIONavigationBarTitleRenamerConnectionAction *)self _addViewToHierarchyForConnection:v4 session:v10];
            goto LABEL_27;
          }
          unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("OOPRename", &performActionFromConnection____s_category);
          if ((*(unsigned char *)CategoryCachedImpl & 1) == 0) {
            goto LABEL_27;
          }
          v23 = *(NSObject **)(CategoryCachedImpl + 8);
          if (!os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
            goto LABEL_27;
          }
          v16 = v23;
          v24 = objc_msgSend(v10, "sessionIdentifier", v21);
          *(_DWORD *)buf = 138412290;
          *(void *)&buf[4] = v24;
          _os_log_impl(&dword_1853B0000, v16, OS_LOG_TYPE_ERROR, "[%@] Dropping connection due to failed sandbox validation.", buf, 0xCu);

LABEL_17:
LABEL_27:

          goto LABEL_28;
        }
        goto LABEL_18;
      }
      v17 = [(_UIONavigationBarTitleRenamerConnectionAction *)self info];
      id v10 = [v17 objectForSetting:2];

      if (v10)
      {
        v16 = [v8 sessionWithIdentifier:v10];
        if (v16)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            [v8 endSession:v16];
            goto LABEL_16;
          }
        }
        goto LABEL_19;
      }
    }
LABEL_18:
    id v10 = [MEMORY[0x1E4F28C58] errorWithDomain:0x1ED12F8C0 code:-1 userInfo:0];
    v16 = [objc_alloc(MEMORY[0x1E4F4F678]) initWithInfo:0 error:v10];
    [(_UIONavigationBarTitleRenamerConnectionAction *)self sendResponse:v16];
LABEL_20:

LABEL_29:
  }
}

- (SBSKeyboardFocusService)kfService
{
  return self->_kfService;
}

- (void)setKfService:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
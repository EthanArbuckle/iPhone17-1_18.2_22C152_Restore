@interface _UIONavigationBarTitleRenamerRemoteSessionAction
+ (id)_actionWithSettings:(id)a3 responseHandler:(id)a4;
+ (id)didCancelSession:(id)a3 responseHandler:(id)a4;
+ (id)didEndEditingActionWithSession:(id)a3 text:(id)a4 responseHandler:(id)a5;
+ (id)fileRenameDidEndInSession:(id)a3 withFinalURL:(id)a4 responseHandler:(id)a5;
+ (id)fileRenameDidFailInSession:(id)a3 withError:(id)a4 proposedName:(id)a5 responseHandler:(id)a6;
+ (id)shouldEndEditingActionWithSession:(id)a3 text:(id)a4 responseHandler:(id)a5;
+ (id)willBeginRenamingActionWithSession:(id)a3 text:(id)a4 selectedRange:(_NSRange)a5 responseHandler:(id)a6;
- (_NSRange)selectedRange;
- (id)error;
- (id)finalURL;
- (id)text;
- (int)_action;
- (void)handleClientActionToOverlayService:(id)a3;
@end

@implementation _UIONavigationBarTitleRenamerRemoteSessionAction

+ (id)_actionWithSettings:(id)a3 responseHandler:(id)a4
{
  id v6 = a4;
  v7 = (void *)MEMORY[0x1E4F4F670];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __88___UIONavigationBarTitleRenamerRemoteSessionAction__actionWithSettings_responseHandler___block_invoke;
  v13[3] = &unk_1E52EE548;
  id v14 = v6;
  id v8 = v6;
  id v9 = a3;
  v10 = [v7 responderWithHandler:v13];
  v11 = (void *)[objc_alloc((Class)a1) initWithInfo:v9 responder:v10];

  return v11;
}

+ (id)willBeginRenamingActionWithSession:(id)a3 text:(id)a4 selectedRange:(_NSRange)a5 responseHandler:(id)a6
{
  NSUInteger length = a5.length;
  NSUInteger location = a5.location;
  v11 = (objc_class *)MEMORY[0x1E4F4F7A0];
  id v12 = a6;
  id v13 = a4;
  id v14 = a3;
  id v15 = objc_alloc_init(v11);
  [v15 setObject:&unk_1ED3F6FF0 forSetting:0];
  v16 = [v14 sessionIdentifier];

  [v15 setObject:v16 forSetting:1];
  [v15 setObject:v13 forSetting:2];

  v17 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithRange:", location, length);
  [v15 setObject:v17 forSetting:3];

  v18 = [a1 _actionWithSettings:v15 responseHandler:v12];

  return v18;
}

+ (id)shouldEndEditingActionWithSession:(id)a3 text:(id)a4 responseHandler:(id)a5
{
  id v8 = (objc_class *)MEMORY[0x1E4F4F7A0];
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  id v12 = objc_alloc_init(v8);
  [v12 setObject:&unk_1ED3F7008 forSetting:0];
  id v13 = [v11 sessionIdentifier];

  [v12 setObject:v13 forSetting:1];
  [v12 setObject:v10 forSetting:2];

  id v14 = [a1 _actionWithSettings:v12 responseHandler:v9];

  return v14;
}

+ (id)didEndEditingActionWithSession:(id)a3 text:(id)a4 responseHandler:(id)a5
{
  id v8 = (objc_class *)MEMORY[0x1E4F4F7A0];
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  id v12 = objc_alloc_init(v8);
  [v12 setObject:&unk_1ED3F7020 forSetting:0];
  id v13 = [v11 sessionIdentifier];

  [v12 setObject:v13 forSetting:1];
  [v12 setObject:v10 forSetting:2];

  id v14 = [a1 _actionWithSettings:v12 responseHandler:v9];

  return v14;
}

+ (id)didCancelSession:(id)a3 responseHandler:(id)a4
{
  id v6 = (objc_class *)MEMORY[0x1E4F4F7A0];
  id v7 = a4;
  id v8 = a3;
  id v9 = objc_alloc_init(v6);
  [v9 setObject:&unk_1ED3F7038 forSetting:0];
  id v10 = [v8 sessionIdentifier];

  [v9 setObject:v10 forSetting:1];
  id v11 = [a1 _actionWithSettings:v9 responseHandler:v7];

  return v11;
}

+ (id)fileRenameDidFailInSession:(id)a3 withError:(id)a4 proposedName:(id)a5 responseHandler:(id)a6
{
  id v10 = (objc_class *)MEMORY[0x1E4F4F7A0];
  id v11 = a6;
  id v12 = a5;
  id v13 = a4;
  id v14 = a3;
  id v15 = objc_alloc_init(v10);
  [v15 setObject:&unk_1ED3F7050 forSetting:0];
  v16 = [v14 sessionIdentifier];

  [v15 setObject:v16 forSetting:1];
  v17 = objc_msgSend(v13, "bs_secureEncoded");

  [v15 setObject:v17 forSetting:5];
  [v15 setObject:v12 forSetting:2];

  v18 = [a1 _actionWithSettings:v15 responseHandler:v11];

  return v18;
}

+ (id)fileRenameDidEndInSession:(id)a3 withFinalURL:(id)a4 responseHandler:(id)a5
{
  id v8 = (objc_class *)MEMORY[0x1E4F4F7A0];
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  id v12 = objc_alloc_init(v8);
  [v12 setObject:&unk_1ED3F7068 forSetting:0];
  id v13 = [v11 sessionIdentifier];

  [v12 setObject:v13 forSetting:1];
  [v12 setObject:v10 forSetting:4];

  id v14 = [a1 _actionWithSettings:v12 responseHandler:v9];

  return v14;
}

- (int)_action
{
  v2 = [(_UIONavigationBarTitleRenamerRemoteSessionAction *)self info];
  v3 = [v2 objectForSetting:0];
  int v4 = [v3 intValue];

  return v4;
}

- (id)text
{
  if ([(_UIONavigationBarTitleRenamerRemoteSessionAction *)self _action] == 3)
  {
    id v7 = [MEMORY[0x1E4F28B00] currentHandler];
    id v8 = NSStringFromSelector(a2);
    [v7 handleFailureInMethod:a2, self, @"_UIONavigationBarTitleRenamerRemoteSessionAction.m", 154, @"%@ is not supported for action of kind %d", v8, -[_UIONavigationBarTitleRenamerRemoteSessionAction _action](self, "_action") object file lineNumber description];
  }
  int v4 = [(_UIONavigationBarTitleRenamerRemoteSessionAction *)self info];
  v5 = [v4 objectForSetting:2];

  return v5;
}

- (_NSRange)selectedRange
{
  if ([(_UIONavigationBarTitleRenamerRemoteSessionAction *)self _action])
  {
    id v11 = [MEMORY[0x1E4F28B00] currentHandler];
    id v12 = NSStringFromSelector(a2);
    [v11 handleFailureInMethod:a2, self, @"_UIONavigationBarTitleRenamerRemoteSessionAction.m", 160, @"%@ is not supported for action of kind %d", v12, -[_UIONavigationBarTitleRenamerRemoteSessionAction _action](self, "_action") object file lineNumber description];
  }
  int v4 = [(_UIONavigationBarTitleRenamerRemoteSessionAction *)self info];
  v5 = [v4 objectForSetting:3];
  uint64_t v6 = [v5 rangeValue];
  NSUInteger v8 = v7;

  NSUInteger v9 = v6;
  NSUInteger v10 = v8;
  result.NSUInteger length = v10;
  result.NSUInteger location = v9;
  return result;
}

- (id)error
{
  if ([(_UIONavigationBarTitleRenamerRemoteSessionAction *)self _action] != 4)
  {
    NSUInteger v9 = [MEMORY[0x1E4F28B00] currentHandler];
    NSUInteger v10 = NSStringFromSelector(a2);
    [v9 handleFailureInMethod:a2, self, @"_UIONavigationBarTitleRenamerRemoteSessionAction.m", 166, @"%@ is not supported for action of kind %d", v10, -[_UIONavigationBarTitleRenamerRemoteSessionAction _action](self, "_action") object file lineNumber description];
  }
  int v4 = (void *)MEMORY[0x1E4F28C58];
  v5 = [(_UIONavigationBarTitleRenamerRemoteSessionAction *)self info];
  uint64_t v6 = [v5 objectForSetting:5];
  NSUInteger v7 = objc_msgSend(v4, "bs_secureDecodedFromData:", v6);

  return v7;
}

- (id)finalURL
{
  if ([(_UIONavigationBarTitleRenamerRemoteSessionAction *)self _action] != 5)
  {
    NSUInteger v7 = [MEMORY[0x1E4F28B00] currentHandler];
    NSUInteger v8 = NSStringFromSelector(a2);
    [v7 handleFailureInMethod:a2, self, @"_UIONavigationBarTitleRenamerRemoteSessionAction.m", 172, @"%@ is not supported for action of kind %d", v8, -[_UIONavigationBarTitleRenamerRemoteSessionAction _action](self, "_action") object file lineNumber description];
  }
  int v4 = [(_UIONavigationBarTitleRenamerRemoteSessionAction *)self info];
  v5 = [v4 objectForSetting:4];

  return v5;
}

- (void)handleClientActionToOverlayService:(id)a3
{
  id v5 = a3;
  if ([(_UIONavigationBarTitleRenamerRemoteSessionAction *)self canSendResponse])
  {
    uint64_t v6 = [(_UIONavigationBarTitleRenamerRemoteSessionAction *)self info];
    NSUInteger v7 = [v6 objectForSetting:1];

    NSUInteger v8 = [(_UIONavigationBarTitleRenamerRemoteSessionAction *)self info];
    NSUInteger v9 = [v8 objectForSetting:2];

    NSUInteger v10 = [v5 delegate];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v26 = [MEMORY[0x1E4F28B00] currentHandler];
      [v26 handleFailureInMethod:a2, self, @"_UIONavigationBarTitleRenamerRemoteSessionAction.m", 188, @"Invalid parameter not satisfying: %@", @"[session isKindOfClass:[_UINavigationBarTitleRenamerRemoteSession class]]" object file lineNumber description];
    }
    id v11 = [v10 sessionIdentifier];
    char v12 = [v11 isEqual:v7];

    if ((v12 & 1) == 0)
    {
      v27 = [MEMORY[0x1E4F28B00] currentHandler];
      [v27 handleFailureInMethod:a2, self, @"_UIONavigationBarTitleRenamerRemoteSessionAction.m", 189, @"Invalid parameter not satisfying: %@", @"[session.sessionIdentifier isEqual:sessionID]" object file lineNumber description];
    }
    switch([(_UIONavigationBarTitleRenamerRemoteSessionAction *)self _action])
    {
      case 0:
        uint64_t v28 = [(_UIONavigationBarTitleRenamerRemoteSessionAction *)self selectedRange];
        uint64_t v29 = v13;
        id v14 = [(_UIONavigationBarTitleRenamerRemoteSessionAction *)self text];
        id v15 = [v10 _willBeginRenamingWithText:v14 selectedRange:&v28];

        v16 = +[_UIONavigationBarTitleRenamerRemoteSessionResponse willBeginRenamingResponseWithText:selectedRange:](_UIONavigationBarTitleRenamerRemoteSessionResponse, "willBeginRenamingResponseWithText:selectedRange:", v15, v28, v29);
        [(_UIONavigationBarTitleRenamerRemoteSessionAction *)self sendResponse:v16];

        break;
      case 1:
        v17 = [(_UIONavigationBarTitleRenamerRemoteSessionAction *)self text];
        uint64_t v18 = [v10 _textFieldShouldEndEditingWithText:v17];

        uint64_t v19 = +[_UIONavigationBarTitleRenamerRemoteSessionResponse shouldEndEditingResponse:v18];
        goto LABEL_14;
      case 2:
        v20 = [(_UIONavigationBarTitleRenamerRemoteSessionAction *)self text];
        [v10 _textFieldDidEndEditingWithText:v20];

        uint64_t v21 = 2;
        goto LABEL_13;
      case 3:
        [v10 cancelSessionAndNotify:0];
        uint64_t v21 = 3;
        goto LABEL_13;
      case 4:
        v22 = [(_UIONavigationBarTitleRenamerRemoteSessionAction *)self error];
        v23 = [(_UIONavigationBarTitleRenamerRemoteSessionAction *)self text];
        [v10 fileRenameDidFail:v22 proposedName:v23];

        uint64_t v21 = 4;
        goto LABEL_13;
      case 5:
        v24 = [(_UIONavigationBarTitleRenamerRemoteSessionAction *)self finalURL];
        [v10 fileRenameDidEnd:v24];

        uint64_t v21 = 5;
LABEL_13:
        uint64_t v19 = +[_UIONavigationBarTitleRenamerRemoteSessionResponse successResponseForAction:v21];
LABEL_14:
        v25 = (void *)v19;
        [(_UIONavigationBarTitleRenamerRemoteSessionAction *)self sendResponse:v19];

        break;
      default:
        break;
    }
  }
}

@end
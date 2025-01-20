@interface WTUIActionClientToHost
+ (id)_settingForActionType:(int64_t)a3 session:(id)a4;
+ (id)actionForBeginTextPlaceholder;
+ (id)actionForCompositionSession:(id)a3 didReceiveText:(id)a4 replacementRange:(_NSRange)a5 inContext:(id)a6 finished:(BOOL)a7;
+ (id)actionForCopyText:(id)a3;
+ (id)actionForDidBeginWritingToolsSession:(id)a3 contexts:(id)a4;
+ (id)actionForDidEndWritingToolsSession:(id)a3 accepted:(BOOL)a4;
+ (id)actionForEnableIntelligentEntryFieldView:(BOOL)a3;
+ (id)actionForEnableSmallDetent:(BOOL)a3;
+ (id)actionForEndTextPlaceholderWillInsertText:(BOOL)a3 completion:(id)a4;
+ (id)actionForEndWritingToolsWithError:(id)a3;
+ (id)actionForEnrollmentBegan;
+ (id)actionForEnrollmentDismissed;
+ (id)actionForHandOffFromUCBWithPrompt:(id)a3;
+ (id)actionForPromptEntryModeUpdateWithState:(int64_t)a3;
+ (id)actionForProofreadingSession:(id)a3 didReceiveSuggestions:(id)a4 processedRange:(_NSRange)a5 inContext:(id)a6 finished:(BOOL)a7;
+ (id)actionForProofreadingSession:(id)a3 didUpdateState:(int64_t)a4 forSuggestionWithUUID:(id)a5 inContext:(id)a6;
+ (id)actionForRedo;
+ (id)actionForReplaceSelectionWithText:(id)a3;
+ (id)actionForResetPresentationSelectedDetent;
+ (id)actionForSetFeedbackHiddenDetentEnabled:(BOOL)a3;
+ (id)actionForShowAlertWithTitle:(id)a3 message:(id)a4 buttonTitle:(id)a5 buttonAction:(id)a6;
+ (id)actionForShowContentWarningWithTitle:(id)a3 message:(id)a4;
+ (id)actionForShowPhotosPickerSessionBegan;
+ (id)actionForShowPhotosPickerSessionDismissed;
+ (id)actionForShowSmartReplyQuestionnaireWithRect:(CGRect)a3;
+ (id)actionForUndo;
+ (id)actionForUpdateKeyboardPosition:(CGRect)a3 preferredContentSizeChanged:(BOOL)a4;
+ (id)actionForWillBeginWritingToolsSession:(id)a3 requestContextsCompletion:(id)a4;
+ (id)actionForWritingToolsSession:(id)a3 didReceiveAction:(int64_t)a4;
- (void)performActionForSceneController:(id)a3;
@end

@implementation WTUIActionClientToHost

+ (id)actionForWillBeginWritingToolsSession:(id)a3 requestContextsCompletion:(id)a4
{
  id v6 = a4;
  v7 = [a1 _settingForActionType:1 session:a3];
  v8 = (void *)MEMORY[0x263F29BB8];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __90__WTUIActionClientToHost_actionForWillBeginWritingToolsSession_requestContextsCompletion___block_invoke;
  v13[3] = &unk_26558E708;
  id v14 = v6;
  id v9 = v6;
  v10 = [v8 responderWithHandler:v13];
  v11 = (void *)[objc_alloc((Class)a1) initWithInfo:v7 responder:v10];

  return v11;
}

void __90__WTUIActionClientToHost_actionForWillBeginWritingToolsSession_requestContextsCompletion___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 info];
  id v5 = [v3 objectForSetting:13];

  v4 = [v5 array];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (id)actionForWritingToolsSession:(id)a3 didReceiveAction:(int64_t)a4
{
  id v6 = [a1 _settingForActionType:3 session:a3];
  v7 = [NSNumber numberWithInteger:a4];
  [v6 setObject:v7 forSetting:8];

  v8 = (void *)[objc_alloc((Class)a1) initWithInfo:v6 responder:0];

  return v8;
}

+ (id)actionForDidBeginWritingToolsSession:(id)a3 contexts:(id)a4
{
  id v6 = a4;
  v7 = [a1 _settingForActionType:2 session:a3];
  v8 = (void *)[objc_alloc(MEMORY[0x263F29D10]) initWithArray:v6];

  [v7 setObject:v8 forSetting:2];
  id v9 = (void *)[objc_alloc((Class)a1) initWithInfo:v7 responder:0];

  return v9;
}

+ (id)actionForDidEndWritingToolsSession:(id)a3 accepted:(BOOL)a4
{
  id v5 = [a1 _settingForActionType:4 session:a3];
  [v5 setFlag:BSSettingFlagForBool() forSetting:3];
  id v6 = (void *)[objc_alloc((Class)a1) initWithInfo:v5 responder:0];

  return v6;
}

+ (id)actionForEndWritingToolsWithError:(id)a3
{
  v13[3] = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x263F29C78]);
  [v5 setObject:&unk_270DB9F00 forSetting:1];
  if (v4)
  {
    v12[0] = @"domain";
    id v6 = [v4 domain];
    v13[0] = v6;
    v12[1] = @"code";
    v7 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v4, "code"));
    v13[1] = v7;
    v12[2] = @"userInfo";
    v8 = [v4 userInfo];
    v13[2] = v8;
    id v9 = [NSDictionary dictionaryWithObjects:v13 forKeys:v12 count:3];
    [v5 setObject:v9 forSetting:17];
  }
  v10 = (void *)[objc_alloc((Class)a1) initWithInfo:v5 responder:0];

  return v10;
}

+ (id)actionForProofreadingSession:(id)a3 didReceiveSuggestions:(id)a4 processedRange:(_NSRange)a5 inContext:(id)a6 finished:(BOOL)a7
{
  NSUInteger length = a5.length;
  NSUInteger location = a5.location;
  id v12 = a6;
  id v13 = a4;
  id v14 = [a1 _settingForActionType:6 session:a3];
  v15 = (void *)[objc_alloc(MEMORY[0x263F29D10]) initWithArray:v13];

  [v14 setObject:v15 forSetting:10];
  v16 = objc_msgSend(MEMORY[0x263F08D40], "valueWithRange:", location, length);
  [v14 setObject:v16 forSetting:7];

  [v14 setObject:v12 forSetting:11];
  [v14 setFlag:BSSettingFlagForBool() forSetting:4];
  v17 = (void *)[objc_alloc((Class)a1) initWithInfo:v14 responder:0];

  return v17;
}

+ (id)actionForProofreadingSession:(id)a3 didUpdateState:(int64_t)a4 forSuggestionWithUUID:(id)a5 inContext:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = [a1 _settingForActionType:7 session:a3];
  id v13 = [NSNumber numberWithInteger:a4];
  [v12 setObject:v13 forSetting:12];

  [v12 setObject:v11 forSetting:9];
  [v12 setObject:v10 forSetting:11];

  id v14 = (void *)[objc_alloc((Class)a1) initWithInfo:v12 responder:0];

  return v14;
}

+ (id)actionForCompositionSession:(id)a3 didReceiveText:(id)a4 replacementRange:(_NSRange)a5 inContext:(id)a6 finished:(BOOL)a7
{
  NSUInteger length = a5.length;
  NSUInteger location = a5.location;
  id v12 = a6;
  id v13 = a4;
  id v14 = [a1 _settingForActionType:8 session:a3];
  v15 = objc_alloc_init(WTUIBSCompatibleAttributedString);
  [(WTBSCompatibleAttributedString *)v15 setAttributedString:v13];

  [v14 setObject:v15 forSetting:5];
  v16 = objc_msgSend(MEMORY[0x263F08D40], "valueWithRange:", location, length);
  [v14 setObject:v16 forSetting:7];

  [v14 setObject:v12 forSetting:11];
  [v14 setFlag:BSSettingFlagForBool() forSetting:4];
  v17 = (void *)[objc_alloc((Class)a1) initWithInfo:v14 responder:0];

  return v17;
}

+ (id)actionForEnrollmentBegan
{
  id v3 = objc_alloc_init(MEMORY[0x263F29C78]);
  [v3 setObject:&unk_270DB9F18 forSetting:1];
  id v4 = (void *)[objc_alloc((Class)a1) initWithInfo:v3 responder:0];

  return v4;
}

+ (id)actionForEnrollmentDismissed
{
  id v3 = objc_alloc_init(MEMORY[0x263F29C78]);
  [v3 setObject:&unk_270DB9F30 forSetting:1];
  id v4 = (void *)[objc_alloc((Class)a1) initWithInfo:v3 responder:0];

  return v4;
}

+ (id)actionForShowPhotosPickerSessionBegan
{
  id v3 = objc_alloc_init(MEMORY[0x263F29C78]);
  [v3 setObject:&unk_270DB9F48 forSetting:1];
  id v4 = (void *)[objc_alloc((Class)a1) initWithInfo:v3 responder:0];

  return v4;
}

+ (id)actionForShowPhotosPickerSessionDismissed
{
  id v3 = objc_alloc_init(MEMORY[0x263F29C78]);
  [v3 setObject:&unk_270DB9F60 forSetting:1];
  id v4 = (void *)[objc_alloc((Class)a1) initWithInfo:v3 responder:0];

  return v4;
}

+ (id)actionForReplaceSelectionWithText:(id)a3
{
  id v4 = (objc_class *)MEMORY[0x263F29C78];
  id v5 = a3;
  id v6 = objc_alloc_init(v4);
  [v6 setObject:&unk_270DB9F78 forSetting:1];
  v7 = objc_alloc_init(WTUIBSCompatibleAttributedString);
  [(WTBSCompatibleAttributedString *)v7 setAttributedString:v5];

  [v6 setObject:v7 forSetting:5];
  v8 = (void *)[objc_alloc((Class)a1) initWithInfo:v6 responder:0];

  return v8;
}

+ (id)actionForCopyText:(id)a3
{
  id v4 = (objc_class *)MEMORY[0x263F29C78];
  id v5 = a3;
  id v6 = objc_alloc_init(v4);
  [v6 setObject:&unk_270DB9F90 forSetting:1];
  v7 = objc_alloc_init(WTUIBSCompatibleAttributedString);
  [(WTBSCompatibleAttributedString *)v7 setAttributedString:v5];

  [v6 setObject:v7 forSetting:5];
  v8 = (void *)[objc_alloc((Class)a1) initWithInfo:v6 responder:0];

  return v8;
}

+ (id)actionForUndo
{
  id v3 = objc_alloc_init(MEMORY[0x263F29C78]);
  [v3 setObject:&unk_270DB9FA8 forSetting:1];
  id v4 = (void *)[objc_alloc((Class)a1) initWithInfo:v3 responder:0];

  return v4;
}

+ (id)actionForRedo
{
  id v3 = objc_alloc_init(MEMORY[0x263F29C78]);
  [v3 setObject:&unk_270DB9FC0 forSetting:1];
  id v4 = (void *)[objc_alloc((Class)a1) initWithInfo:v3 responder:0];

  return v4;
}

+ (id)actionForBeginTextPlaceholder
{
  id v3 = objc_alloc_init(MEMORY[0x263F29C78]);
  [v3 setObject:&unk_270DB9FD8 forSetting:1];
  id v4 = (void *)[objc_alloc((Class)a1) initWithInfo:v3 responder:0];

  return v4;
}

+ (id)actionForEndTextPlaceholderWillInsertText:(BOOL)a3 completion:(id)a4
{
  id v5 = a4;
  id v6 = objc_alloc_init(MEMORY[0x263F29C78]);
  [v6 setObject:&unk_270DB9FF0 forSetting:1];
  [v6 setFlag:BSSettingFlagForBool() forSetting:14];
  if (v5)
  {
    v7 = (void *)MEMORY[0x263F29BB8];
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __79__WTUIActionClientToHost_actionForEndTextPlaceholderWillInsertText_completion___block_invoke;
    v11[3] = &unk_26558E708;
    id v12 = v5;
    v8 = [v7 responderWithHandler:v11];
  }
  else
  {
    v8 = 0;
  }
  id v9 = (void *)[objc_alloc((Class)a1) initWithInfo:v6 responder:v8];

  return v9;
}

uint64_t __79__WTUIActionClientToHost_actionForEndTextPlaceholderWillInsertText_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (id)actionForEnableSmallDetent:(BOOL)a3
{
  id v4 = objc_alloc_init(MEMORY[0x263F29C78]);
  [v4 setObject:&unk_270DBA008 forSetting:1];
  [v4 setFlag:BSSettingFlagForBool() forSetting:15];
  id v5 = (void *)[objc_alloc((Class)a1) initWithInfo:v4 responder:0];

  return v5;
}

+ (id)actionForSetFeedbackHiddenDetentEnabled:(BOOL)a3
{
  id v4 = objc_alloc_init(MEMORY[0x263F29C78]);
  [v4 setObject:&unk_270DBA020 forSetting:1];
  [v4 setFlag:BSSettingFlagForBool() forSetting:21];
  id v5 = (void *)[objc_alloc((Class)a1) initWithInfo:v4 responder:0];

  return v5;
}

+ (id)actionForEnableIntelligentEntryFieldView:(BOOL)a3
{
  id v4 = objc_alloc_init(MEMORY[0x263F29C78]);
  [v4 setObject:&unk_270DBA038 forSetting:1];
  [v4 setFlag:BSSettingFlagForBool() forSetting:16];
  id v5 = (void *)[objc_alloc((Class)a1) initWithInfo:v4 responder:0];

  return v5;
}

+ (id)actionForShowContentWarningWithTitle:(id)a3 message:(id)a4
{
  id v6 = (objc_class *)MEMORY[0x263F29C78];
  id v7 = a4;
  id v8 = a3;
  id v9 = objc_alloc_init(v6);
  [v9 setObject:&unk_270DBA050 forSetting:1];
  [v9 setObject:v8 forSetting:18];

  [v9 setObject:v7 forSetting:19];
  id v10 = (void *)[objc_alloc((Class)a1) initWithInfo:v9 responder:0];

  return v10;
}

+ (id)actionForShowAlertWithTitle:(id)a3 message:(id)a4 buttonTitle:(id)a5 buttonAction:(id)a6
{
  id v10 = a6;
  id v11 = (objc_class *)MEMORY[0x263F29C78];
  id v12 = a5;
  id v13 = a4;
  id v14 = a3;
  id v15 = objc_alloc_init(v11);
  [v15 setObject:&unk_270DBA068 forSetting:1];
  [v15 setObject:v14 forSetting:18];

  [v15 setObject:v13 forSetting:19];
  [v15 setObject:v12 forSetting:23];

  if (v10)
  {
    v16 = (void *)MEMORY[0x263F29BB8];
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __87__WTUIActionClientToHost_actionForShowAlertWithTitle_message_buttonTitle_buttonAction___block_invoke;
    v20[3] = &unk_26558E708;
    id v21 = v10;
    v17 = [v16 responderWithHandler:v20];
  }
  else
  {
    v17 = 0;
  }
  v18 = (void *)[objc_alloc((Class)a1) initWithInfo:v15 responder:v17];

  return v18;
}

uint64_t __87__WTUIActionClientToHost_actionForShowAlertWithTitle_message_buttonTitle_buttonAction___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (id)actionForShowSmartReplyQuestionnaireWithRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v8 = objc_alloc_init(MEMORY[0x263F29C78]);
  [v8 setObject:&unk_270DBA080 forSetting:1];
  id v9 = objc_msgSend(MEMORY[0x263F08D40], "valueWithCGRect:", x, y, width, height);
  [v8 setObject:v9 forSetting:20];

  id v10 = (void *)[objc_alloc((Class)a1) initWithInfo:v8 responder:0];

  return v10;
}

+ (id)actionForHandOffFromUCBWithPrompt:(id)a3
{
  id v4 = (objc_class *)MEMORY[0x263F29C78];
  id v5 = a3;
  id v6 = objc_alloc_init(v4);
  [v6 setObject:&unk_270DBA098 forSetting:1];
  [v6 setObject:v5 forSetting:24];

  id v7 = (void *)[objc_alloc((Class)a1) initWithInfo:v6 responder:0];

  return v7;
}

+ (id)_settingForActionType:(int64_t)a3 session:(id)a4
{
  id v5 = (objc_class *)MEMORY[0x263F29C78];
  id v6 = a4;
  id v7 = objc_alloc_init(v5);
  id v8 = [NSNumber numberWithInteger:a3];
  [v7 setObject:v8 forSetting:1];

  [v7 setObject:v6 forSetting:6];

  return v7;
}

+ (id)actionForResetPresentationSelectedDetent
{
  id v3 = objc_alloc_init(MEMORY[0x263F29C78]);
  [v3 setObject:&unk_270DBA0B0 forSetting:1];
  id v4 = (void *)[objc_alloc((Class)a1) initWithInfo:v3 responder:0];

  return v4;
}

- (void)performActionForSceneController:(id)a3
{
  id v4 = a3;
  id v5 = [(WTUIActionClientToHost *)self info];
  id v6 = [v4 delegate];

  id v7 = [v5 objectForSetting:6];
  id v8 = [(WTUIActionClientToHost *)self info];
  id v9 = [v8 objectForSetting:1];
  uint64_t v10 = [v9 integerValue];

  switch(v10)
  {
    case 1:
      v60[0] = MEMORY[0x263EF8330];
      v60[1] = 3221225472;
      v60[2] = __58__WTUIActionClientToHost_performActionForSceneController___block_invoke;
      v60[3] = &unk_26558E730;
      v60[4] = self;
      [v6 willBeginWritingToolsSession:v7 requestContexts:v60];
      break;
    case 2:
      id v11 = [v5 objectForSetting:2];
      id v12 = [v11 array];
      [v6 didBeginWritingToolsSession:v7 contexts:v12];
      goto LABEL_24;
    case 3:
      id v13 = [v5 objectForSetting:8];
      uint64_t v14 = [v13 integerValue];

      [v6 writingToolsSession:v7 didReceiveAction:v14];
      break;
    case 4:
      objc_msgSend(v6, "didEndWritingToolsSession:accepted:", v7, objc_msgSend(v5, "BOOLForSetting:", 3));
      break;
    case 5:
      id v15 = [v5 objectForSetting:17];
      v16 = v15;
      if (v15)
      {
        v17 = (void *)MEMORY[0x263F087E8];
        v18 = [v15 objectForKeyedSubscript:@"domain"];
        v19 = [v16 objectForKeyedSubscript:@"code"];
        uint64_t v20 = [v19 integerValue];
        id v21 = [v16 objectForKeyedSubscript:@"userInfo"];
        v22 = [v17 errorWithDomain:v18 code:v20 userInfo:v21];
      }
      else
      {
        v22 = 0;
      }
      [v6 endWritingToolsWithError:v22];

      goto LABEL_41;
    case 6:
      id v11 = [v5 objectForSetting:10];
      uint64_t v23 = [v11 array];
      if (v23) {
        id v12 = (void *)v23;
      }
      else {
        id v12 = (void *)MEMORY[0x263EFFA68];
      }
      v24 = [v5 objectForSetting:7];
      uint64_t v25 = [v24 rangeValue];
      uint64_t v27 = v26;

      v28 = [v5 objectForSetting:11];
      objc_msgSend(v6, "proofreadingSession:didReceiveSuggestions:processedRange:inContext:finished:", v7, v12, v25, v27, v28, objc_msgSend(v5, "BOOLForSetting:", 4));
      goto LABEL_14;
    case 7:
      v29 = [v5 objectForSetting:12];
      uint64_t v30 = [v29 integerValue];

      id v11 = [v5 objectForSetting:9];
      v31 = [v5 objectForSetting:11];
      [v6 proofreadingSession:v7 didUpdateState:v30 forSuggestionWithUUID:v11 inContext:v31];

      goto LABEL_25;
    case 8:
      id v11 = [v5 objectForSetting:5];
      id v12 = [v11 attributedString];
      v32 = [v5 objectForSetting:7];
      uint64_t v33 = [v32 rangeValue];
      uint64_t v35 = v34;

      v28 = [v5 objectForSetting:11];
      objc_msgSend(v6, "compositionSession:didReceiveText:replacementRange:inContext:finished:", v7, v12, v33, v35, v28, objc_msgSend(v5, "BOOLForSetting:", 4));
LABEL_14:

      goto LABEL_24;
    case 9:
      id v11 = [v5 objectForSetting:5];
      id v12 = [v11 attributedString];
      [v6 replaceSelectionWithText:v12];
      goto LABEL_24;
    case 10:
      id v11 = [v5 objectForSetting:5];
      id v12 = [v11 attributedString];
      [v6 copyText:v12];
      goto LABEL_24;
    case 11:
      [v6 undo];
      break;
    case 12:
      [v6 redo];
      break;
    case 13:
      [v6 beginTextPlaceholder];
      break;
    case 14:
      uint64_t v36 = [v5 BOOLForSetting:14];
      v59[0] = MEMORY[0x263EF8330];
      v59[1] = 3221225472;
      v59[2] = __58__WTUIActionClientToHost_performActionForSceneController___block_invoke_2;
      v59[3] = &unk_26558E530;
      v59[4] = self;
      [v6 endTextPlaceholderAndWillInsertText:v36 completion:v59];
      break;
    case 15:
      objc_msgSend(v6, "enableSmallDetent:", objc_msgSend(v5, "BOOLForSetting:", 15));
      break;
    case 16:
      objc_msgSend(v6, "enableIntelligentEntryFieldView:", objc_msgSend(v5, "BOOLForSetting:", 16));
      break;
    case 17:
      id v11 = [v5 objectForSetting:18];
      id v12 = [v5 objectForSetting:19];
      [v6 showContentWarningWithTitle:v11 message:v12];
LABEL_24:

      goto LABEL_25;
    case 18:
      v37 = [v5 objectForSetting:20];
      [v37 CGRectValue];
      double v39 = v38;
      double v41 = v40;
      double v43 = v42;
      double v45 = v44;

      objc_msgSend(v6, "showSmartReplyQuestionnaireWithRect:", v39, v41, v43, v45);
      break;
    case 19:
      objc_msgSend(v6, "setFeedbackHiddenDetentEnabled:", objc_msgSend(v5, "BOOLForSetting:", 21));
      break;
    case 20:
      [v6 enrollmentBegan];
      break;
    case 21:
      [v6 enrollmentDismissed];
      break;
    case 22:
      v46 = [v5 objectForSetting:22];
      id v11 = v46;
      if (v46) {
        objc_msgSend(v6, "updatePromptEntryState:", objc_msgSend(v46, "integerValue"));
      }
      goto LABEL_25;
    case 23:
      v22 = [v5 objectForSetting:18];
      v47 = [v5 objectForSetting:19];
      v48 = [v5 objectForSetting:23];
      v58[0] = MEMORY[0x263EF8330];
      v58[1] = 3221225472;
      v58[2] = __58__WTUIActionClientToHost_performActionForSceneController___block_invoke_3;
      v58[3] = &unk_26558E530;
      v58[4] = self;
      [v6 showAlertWithTitle:v22 message:v47 buttonTitle:v48 buttonAction:v58];

LABEL_41:
      break;
    case 24:
      id v11 = [v5 objectForSetting:24];
      [v6 handOffFromUCBWithPrompt:v11];
LABEL_25:

      break;
    case 25:
      [v6 photosPickerSessionBegan];
      break;
    case 26:
      [v6 photosPickerSessionDismissed];
      break;
    case 27:
      [v6 resetPresentationSelectedDetent];
      break;
    case 28:
      v49 = [v5 objectForSetting:20];
      [v49 CGRectValue];
      double v51 = v50;
      double v53 = v52;
      double v55 = v54;
      double v57 = v56;

      objc_msgSend(v6, "writingToolsDidUpdateKeyboardPosition:preferredContentSizeChanging:", objc_msgSend(v5, "BOOLForSetting:", 25), v51, v53, v55, v57);
      break;
    default:
      break;
  }
}

void __58__WTUIActionClientToHost_performActionForSceneController___block_invoke(uint64_t a1, void *a2)
{
  id v3 = (objc_class *)MEMORY[0x263F29C78];
  id v4 = a2;
  id v8 = objc_alloc_init(v3);
  id v5 = (void *)[objc_alloc(MEMORY[0x263F29D10]) initWithArray:v4];

  [v8 setObject:v5 forSetting:13];
  id v6 = *(void **)(a1 + 32);
  id v7 = [MEMORY[0x263F29BC0] responseWithInfo:v8];
  [v6 sendResponse:v7];
}

void __58__WTUIActionClientToHost_performActionForSceneController___block_invoke_2(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v2 = [MEMORY[0x263F29BC0] response];
  [v1 sendResponse:v2];
}

void __58__WTUIActionClientToHost_performActionForSceneController___block_invoke_3(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v2 = [MEMORY[0x263F29BC0] response];
  [v1 sendResponse:v2];
}

+ (id)actionForPromptEntryModeUpdateWithState:(int64_t)a3
{
  id v5 = objc_alloc_init(MEMORY[0x263F29C78]);
  [v5 setObject:&unk_270DBA0C8 forSetting:1];
  id v6 = [NSNumber numberWithInteger:a3];
  [v5 setObject:v6 forSetting:22];

  id v7 = (void *)[objc_alloc((Class)a1) initWithInfo:v5 responder:0];

  return v7;
}

+ (id)actionForUpdateKeyboardPosition:(CGRect)a3 preferredContentSizeChanged:(BOOL)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v9 = objc_alloc_init(MEMORY[0x263F29C78]);
  [v9 setObject:&unk_270DBA0E0 forSetting:1];
  uint64_t v10 = objc_msgSend(MEMORY[0x263F08D40], "valueWithCGRect:", x, y, width, height);
  [v9 setObject:v10 forSetting:20];

  [v9 setFlag:BSSettingFlagForBool() forSetting:25];
  id v11 = (void *)[objc_alloc((Class)a1) initWithInfo:v9 responder:0];

  return v11;
}

@end
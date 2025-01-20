@interface UIReturnToDocumentAction
@end

@implementation UIReturnToDocumentAction

uint64_t __54___UIReturnToDocumentAction__hasReturnToSenderFeature__block_invoke()
{
  uint64_t result = _os_feature_enabled_impl();
  _MergedGlobals_1240 = result;
  return result;
}

void __47___UIReturnToDocumentAction_actionWithFileURL___block_invoke(uint64_t a1, void *a2)
{
  v26[1] = *MEMORY[0x1E4F143B8];
  v3 = a2;
  if (*(void *)(a1 + 32) && ([*(id *)(a1 + 40) _hasReturnToSenderFeature] & 1) != 0)
  {
    uint64_t v22 = 0;
    v23 = &v22;
    uint64_t v24 = 0x2050000000;
    v4 = (void *)getSYDocumentAttributesClass_softClass;
    uint64_t v25 = getSYDocumentAttributesClass_softClass;
    if (!getSYDocumentAttributesClass_softClass)
    {
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __getSYDocumentAttributesClass_block_invoke;
      v21[3] = &unk_1E52D9900;
      v21[4] = &v22;
      __getSYDocumentAttributesClass_block_invoke((uint64_t)v21);
      v4 = (void *)v23[3];
    }
    id v5 = v4;
    _Block_object_dispose(&v22, 8);
    v6 = [v5 documentAttributesForFileAtURL:*(void *)(a1 + 32)];
    if (v6)
    {
      v7 = _UILocalizedString(@"ACTION_TITLE_RETURNTOSENDER", @"Title of the return to sender button in the document menu", @"Shared with You");
      v8 = +[UIImage systemImageNamed:@"envelope"];
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __47___UIReturnToDocumentAction_actionWithFileURL___block_invoke_2;
      v19[3] = &unk_1E52DB038;
      id v9 = v6;
      id v20 = v9;
      v10 = +[UIAction actionWithTitle:v7 image:v8 identifier:@"com.apple.returntodocument" handler:v19];

      v11 = [v9 sender];
      v12 = [v11 name];
      v13 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
      v14 = [v12 stringByTrimmingCharactersInSet:v13];

      if (v14 && [v14 length])
      {
        v15 = NSString;
        v16 = _UILocalizedString(@"ACTION_SUBTITLE_RETURNTOSENDER_FORMAT", @"Subtitle for the return to sender button in the document menu. Must have one placeholder that will be replaced with the originator's name.", @"From %@");
        v17 = objc_msgSend(v15, "stringWithFormat:", v16, v14);
        [v10 setSubtitle:v17];
      }
      v26[0] = v10;
      v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:1];
      v3[2](v3, v18);
    }
    else
    {
      v3[2](v3, (void *)MEMORY[0x1E4F1CBF0]);
    }
  }
  else
  {
    v3[2](v3, (void *)MEMORY[0x1E4F1CBF0]);
  }
}

void __47___UIReturnToDocumentAction_actionWithFileURL___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v19 = 0;
  id v20 = &v19;
  uint64_t v21 = 0x2050000000;
  v4 = (void *)qword_1EB2634D8;
  uint64_t v22 = qword_1EB2634D8;
  if (!qword_1EB2634D8)
  {
    *(void *)&long long buf = MEMORY[0x1E4F143A8];
    *((void *)&buf + 1) = 3221225472;
    uint64_t v24 = __getSYDocumentWorkflowsClientClass_block_invoke;
    uint64_t v25 = &unk_1E52D9900;
    v26 = &v19;
    __getSYDocumentWorkflowsClientClass_block_invoke((uint64_t)&buf);
    v4 = (void *)v20[3];
  }
  id v5 = v4;
  _Block_object_dispose(&v19, 8);
  id v6 = objc_alloc_init(v5);
  uint64_t v19 = 0;
  id v20 = &v19;
  uint64_t v21 = 0x2050000000;
  v7 = (void *)qword_1EB2634E0;
  uint64_t v22 = qword_1EB2634E0;
  if (!qword_1EB2634E0)
  {
    *(void *)&long long buf = MEMORY[0x1E4F143A8];
    *((void *)&buf + 1) = 3221225472;
    uint64_t v24 = __getSYReturnToDocumentRequestClass_block_invoke;
    uint64_t v25 = &unk_1E52D9900;
    v26 = &v19;
    __getSYReturnToDocumentRequestClass_block_invoke((uint64_t)&buf);
    v7 = (void *)v20[3];
  }
  v8 = v7;
  _Block_object_dispose(&v19, 8);
  id v9 = objc_alloc_init(v8);
  [v9 setDocumentAttributes:*(void *)(a1 + 32)];
  v10 = [v3 sender];
  if (_IsKindOfUIView((uint64_t)v10))
  {
    v11 = [v3 sender];

    if (v11) {
      goto LABEL_13;
    }
  }
  else
  {
  }
  if (os_variant_has_internal_diagnostics())
  {
    v15 = __UIFaultDebugAssertLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = 0;
      _os_log_fault_impl(&dword_1853B0000, v15, OS_LOG_TYPE_FAULT, "Invoked return to document action from an unknown sender: %@", (uint8_t *)&buf, 0xCu);
    }
  }
  else
  {
    v12 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &qword_1EB2634D0) + 8);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = 0;
      _os_log_impl(&dword_1853B0000, v12, OS_LOG_TYPE_ERROR, "Invoked return to document action from an unknown sender: %@", (uint8_t *)&buf, 0xCu);
    }
  }
  v11 = 0;
LABEL_13:
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __47___UIReturnToDocumentAction_actionWithFileURL___block_invoke_19;
  v16[3] = &unk_1E5302D18;
  id v17 = v6;
  id v18 = v11;
  id v13 = v11;
  id v14 = v6;
  [v14 performRequest:v9 completion:v16];
}

void __47___UIReturnToDocumentAction_actionWithFileURL___block_invoke_19(uint64_t a1, char a2, void *a3)
{
  id v12 = a3;
  id v5 = *(id *)(a1 + 32);
  if (v12 && (a2 & 1) == 0)
  {
    id v6 = [*(id *)(a1 + 40) _viewControllerForAncestor];
    if (v6)
    {
      v7 = [v12 localizedDescription];
      v8 = [v12 localizedFailureReason];
      id v9 = +[UIAlertController alertControllerWithTitle:v7 message:v8 preferredStyle:1];

      v10 = _UILocalizedString(@"RETURNTOSENDER_ERROR_DISMISS_BUTTON", @"Button of an error showing when the return to document action failed", @"Dismiss");
      v11 = +[UIAlertAction actionWithTitle:v10 style:0 handler:0];
      [v9 addAction:v11];

      [v6 presentViewController:v9 animated:1 completion:0];
    }
  }
}

@end
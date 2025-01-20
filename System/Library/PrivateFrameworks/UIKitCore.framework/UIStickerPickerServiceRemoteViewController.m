@interface UIStickerPickerServiceRemoteViewController
@end

@implementation UIStickerPickerServiceRemoteViewController

void __77___UIStickerPickerServiceRemoteViewController_serviceViewControllerInterface__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1ED700DC0];
  v1 = (void *)_MergedGlobals_1052;
  _MergedGlobals_1052 = v0;

  v2 = (void *)_MergedGlobals_1052;
  v3 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v4 = objc_opt_class();
  v5 = objc_msgSend(v3, "setWithObjects:", v4, objc_opt_class(), 0);
  [v2 setClasses:v5 forSelector:sel_addStickerToStoreWithRepresentations_completionHandler_ argumentIndex:0 ofReply:0];

  v6 = (void *)_MergedGlobals_1052;
  v7 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v8 = objc_opt_class();
  v9 = objc_msgSend(v7, "setWithObjects:", v8, objc_opt_class(), 0);
  [v6 setClasses:v9 forSelector:sel_addStickerToStoreWithRepresentations_completionWithStickerIDs_ argumentIndex:0 ofReply:0];

  v10 = (void *)_MergedGlobals_1052;
  v11 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v12 = objc_opt_class();
  uint64_t v13 = objc_opt_class();
  uint64_t v14 = objc_opt_class();
  uint64_t v15 = objc_opt_class();
  v16 = objc_msgSend(v11, "setWithObjects:", v12, v13, v14, v15, objc_opt_class(), 0);
  [v10 setClasses:v16 forSelector:sel_addStickerToStoreWithRepresentations_completionWithStickerIDs_ argumentIndex:1 ofReply:1];

  v17 = (void *)_MergedGlobals_1052;
  v18 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v19 = objc_opt_class();
  v20 = objc_msgSend(v18, "setWithObjects:", v19, objc_opt_class(), 0);
  [v17 setClasses:v20 forSelector:sel_addStickerToStoreWithRepresentations_sourceRect_completion_ argumentIndex:0 ofReply:0];

  v21 = (void *)_MergedGlobals_1052;
  v22 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v23 = objc_opt_class();
  uint64_t v24 = objc_opt_class();
  uint64_t v25 = objc_opt_class();
  uint64_t v26 = objc_opt_class();
  v27 = objc_msgSend(v22, "setWithObjects:", v23, v24, v25, v26, objc_opt_class(), 0);
  [v21 setClasses:v27 forSelector:sel_addStickerToStoreWithRepresentations_sourceRect_completion_ argumentIndex:0 ofReply:1];

  v28 = (void *)_MergedGlobals_1052;
  v29 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v30 = objc_opt_class();
  uint64_t v31 = objc_opt_class();
  uint64_t v32 = objc_opt_class();
  uint64_t v33 = objc_opt_class();
  v34 = objc_msgSend(v29, "setWithObjects:", v30, v31, v32, v33, objc_opt_class(), 0);
  [v28 setClasses:v34 forSelector:sel_animatedStickerCreationProgressChanged_progress_ argumentIndex:0 ofReply:0];

  v35 = (void *)_MergedGlobals_1052;
  id v36 = [MEMORY[0x1E4F1CAD0] setWithObject:objc_opt_class()];
  [v35 setClasses:v36 forSelector:sel_setHostBundleID_ argumentIndex:0 ofReply:0];
}

void __64___UIStickerPickerServiceRemoteViewController_exportedInterface__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1ED54C8D8];
  v1 = (void *)qword_1EB2607B8;
  qword_1EB2607B8 = v0;

  v2 = (void *)qword_1EB2607B8;
  v3 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v4 = objc_opt_class();
  v5 = objc_msgSend(v3, "setWithObjects:", v4, objc_opt_class(), 0);
  [v2 setClasses:v5 forSelector:sel_stageStickerWithIdentifier_representations_name_externalURI_accessibilityLabel_ argumentIndex:1 ofReply:0];

  v6 = (void *)qword_1EB2607B8;
  v7 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_opt_class();
  uint64_t v11 = objc_opt_class();
  uint64_t v12 = objc_opt_class();
  uint64_t v13 = objc_opt_class();
  objc_msgSend(v7, "setWithObjects:", v8, v9, v10, v11, v12, v13, objc_opt_class(), 0);
  id v14 = (id)objc_claimAutoreleasedReturnValue();
  [v6 setClasses:v14 forSelector:sel_stageSticker_ argumentIndex:0 ofReply:0];
}

@end
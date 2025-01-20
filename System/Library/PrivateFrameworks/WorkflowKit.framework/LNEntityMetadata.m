@interface LNEntityMetadata
@end

@implementation LNEntityMetadata

void __82__LNEntityMetadata_Strings__wf_descriptionClassForEntityType_appBundleIdentifier___block_invoke()
{
  v64[11] = *MEMORY[0x1E4F143B8];
  v63[0] = *MEMORY[0x1E4FB4AA8];
  v61[0] = @"CalendarEntity";
  v40 = self;
  v62[0] = v40;
  v61[1] = @"CalendarScreenType";
  v39 = self;
  v62[1] = v39;
  v38 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v62 forKeys:v61 count:2];
  v64[0] = v38;
  v63[1] = *MEMORY[0x1E4FB4B10];
  v59 = @"MTLinkTab";
  v37 = self;
  v60 = v37;
  v36 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v60 forKeys:&v59 count:1];
  v64[1] = v36;
  v63[2] = *MEMORY[0x1E4FB4AC8];
  v57 = @"DOCFileEntity";
  v35 = self;
  v58 = v35;
  v34 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v58 forKeys:&v57 count:1];
  v64[2] = v34;
  v63[3] = *MEMORY[0x1E4FB4AE8];
  v55[0] = @"AccountEntity";
  v33 = self;
  v56[0] = v33;
  v55[1] = @"MailboxEntity";
  v32 = self;
  v56[1] = v32;
  v55[2] = @"MessageEntity";
  v31 = self;
  v56[2] = v31;
  v30 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v56 forKeys:v55 count:3];
  v64[3] = v30;
  v63[4] = *MEMORY[0x1E4FB4B00];
  v53[0] = @"CKChatItem";
  v29 = self;
  v54[0] = v29;
  v53[1] = @"CKConversation";
  v28 = self;
  v54[1] = v28;
  v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v54 forKeys:v53 count:2];
  v64[4] = v27;
  v63[5] = *MEMORY[0x1E4FB4B30];
  v51[0] = @"AccountEntity";
  v26 = self;
  v52[0] = v26;
  v51[1] = @"AppLocationEntity";
  v25 = self;
  v52[1] = v25;
  v51[2] = @"FolderEntity";
  v24 = self;
  v52[2] = v24;
  v51[3] = @"NoteEntity";
  v23 = self;
  v52[3] = v23;
  v51[4] = @"TagEntity";
  v22 = self;
  v52[4] = v22;
  v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v52 forKeys:v51 count:5];
  v64[5] = v21;
  v63[6] = *MEMORY[0x1E4FB4B50];
  v49[0] = @"TTRListEntity";
  v20 = self;
  v50[0] = v20;
  v49[1] = @"TTRReminderEntity";
  v19 = self;
  v50[1] = v19;
  v49[2] = @"TTRSmartListEntity";
  v18 = self;
  v50[2] = v18;
  v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v50 forKeys:v49 count:3];
  v64[6] = v17;
  v63[7] = *MEMORY[0x1E4FB4B58];
  v47[0] = @"TabEntity";
  v16 = self;
  v48[0] = v16;
  v47[1] = @"TabGroupEntity";
  v15 = self;
  v48[1] = v15;
  v47[2] = @"ReadingListItemEntity";
  v14 = self;
  v48[2] = v14;
  v47[3] = @"BookmarkEntity";
  v13 = self;
  v48[3] = v13;
  v47[4] = @"ViewEntity";
  v12 = self;
  v48[4] = v12;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v48 forKeys:v47 count:5];
  v64[7] = v11;
  v63[8] = *MEMORY[0x1E4FB4BE8];
  v45[0] = @"RootNavigationDestination";
  v0 = self;
  v45[1] = @"WFWorkflowReference";
  v46[0] = v0;
  v1 = self;
  v46[1] = v1;
  v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v46 forKeys:v45 count:2];
  v64[8] = v2;
  v63[9] = *MEMORY[0x1E4FB4BD0];
  v43[0] = @"RCFolderEntity";
  v3 = self;
  v44[0] = v3;
  v43[1] = @"RCRecordingEntity";
  v4 = self;
  v44[1] = v4;
  v43[2] = @"RCUIElementEntity";
  v5 = self;
  v44[2] = v5;
  v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v44 forKeys:v43 count:3];
  v64[9] = v6;
  v63[10] = *MEMORY[0x1E4FB4AA0];
  v41 = @"BookAppEntity";
  v7 = self;
  v42 = v7;
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v42 forKeys:&v41 count:1];
  v64[10] = v8;
  uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v64 forKeys:v63 count:11];
  v10 = (void *)wf_descriptionClassForEntityType_appBundleIdentifier__descriptionClassForEntityTypeByAppBundleIdentifier;
  wf_descriptionClassForEntityType_appBundleIdentifier__descriptionClassForEntityTypeByAppBundleIdentifier = v9;
}

BOOL __116__LNEntityMetadata_Workflow__wf_contentItemClassWithQueryMetadata_appBundleIdentifier_displayedAppBundleIdentifier___block_invoke(uint64_t a1, void *a2, const char *a3, id block)
{
  v7 = imp_implementationWithBlock(block);
  ClassMethod = class_getClassMethod(*(Class *)(a1 + 32), a3);
  TypeEncoding = method_getTypeEncoding(ClassMethod);
  Class = object_getClass(a2);
  return class_addMethod(Class, a3, v7, TypeEncoding);
}

id __116__LNEntityMetadata_Workflow__wf_contentItemClassWithQueryMetadata_appBundleIdentifier_displayedAppBundleIdentifier___block_invoke_2(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

id __116__LNEntityMetadata_Workflow__wf_contentItemClassWithQueryMetadata_appBundleIdentifier_displayedAppBundleIdentifier___block_invoke_3(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

id __116__LNEntityMetadata_Workflow__wf_contentItemClassWithQueryMetadata_appBundleIdentifier_displayedAppBundleIdentifier___block_invoke_4(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

id __116__LNEntityMetadata_Workflow__wf_contentItemClassWithQueryMetadata_appBundleIdentifier_displayedAppBundleIdentifier___block_invoke_5(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  if (!v2) {
    v2 = *(void **)(a1 + 40);
  }
  return v2;
}

@end
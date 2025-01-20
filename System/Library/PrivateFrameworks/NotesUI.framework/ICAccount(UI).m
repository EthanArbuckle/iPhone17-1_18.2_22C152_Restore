@interface ICAccount(UI)
+ (id)globalVirtualCallNotesFolder;
+ (id)globalVirtualMathNotesFolder;
+ (id)globalVirtualRecentlyDeletedMathNotesFolder;
+ (id)globalVirtualSharedWithYouFolder;
+ (id)globalVirtualSystemPaperFolder;
+ (id)localizedLocalAccountNameMidSentence:()UI;
- (ICVirtualSmartFolderItemIdentifier)virtualCallNotesFolder;
- (ICVirtualSmartFolderItemIdentifier)virtualMathNotesFolder;
- (ICVirtualSmartFolderItemIdentifier)virtualSystemPaperFolder;
@end

@implementation ICAccount(UI)

+ (id)globalVirtualSystemPaperFolder
{
  if (globalVirtualSystemPaperFolder_once != -1) {
    dispatch_once(&globalVirtualSystemPaperFolder_once, &__block_literal_global_22);
  }
  v0 = (void *)globalVirtualSystemPaperFolder_identifier;
  return v0;
}

+ (id)globalVirtualSharedWithYouFolder
{
  if (globalVirtualSharedWithYouFolder_once != -1) {
    dispatch_once(&globalVirtualSharedWithYouFolder_once, &__block_literal_global_54);
  }
  v0 = (void *)globalVirtualSharedWithYouFolder_identifier;
  return v0;
}

+ (id)globalVirtualMathNotesFolder
{
  if (globalVirtualMathNotesFolder_once != -1) {
    dispatch_once(&globalVirtualMathNotesFolder_once, &__block_literal_global_24);
  }
  v0 = (void *)globalVirtualMathNotesFolder_identifier;
  return v0;
}

+ (id)globalVirtualCallNotesFolder
{
  if (globalVirtualCallNotesFolder_once != -1) {
    dispatch_once(&globalVirtualCallNotesFolder_once, &__block_literal_global_26);
  }
  v0 = (void *)globalVirtualCallNotesFolder_identifier;
  return v0;
}

+ (id)localizedLocalAccountNameMidSentence:()UI
{
  uint64_t v9 = 0;
  v10 = &v9;
  uint64_t v11 = 0x2050000000;
  v4 = (void *)getACUILocalizationClass_softClass;
  uint64_t v12 = getACUILocalizationClass_softClass;
  if (!getACUILocalizationClass_softClass)
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __getACUILocalizationClass_block_invoke;
    v8[3] = &unk_1E5FD95C0;
    v8[4] = &v9;
    __getACUILocalizationClass_block_invoke((uint64_t)v8);
    v4 = (void *)v10[3];
  }
  id v5 = v4;
  _Block_object_dispose(&v9, 8);
  v6 = [v5 localizedTitleForLocalSourceOfDataclass:*MEMORY[0x1E4F175F0] usedAtBeginningOfSentence:a3 ^ 1u];
  return v6;
}

+ (id)globalVirtualRecentlyDeletedMathNotesFolder
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __60__ICAccount_UI__globalVirtualRecentlyDeletedMathNotesFolder__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (globalVirtualRecentlyDeletedMathNotesFolder_once != -1) {
    dispatch_once(&globalVirtualRecentlyDeletedMathNotesFolder_once, block);
  }
  v1 = (void *)globalVirtualRecentlyDeletedMathNotesFolder_identifier;
  return v1;
}

- (ICVirtualSmartFolderItemIdentifier)virtualSystemPaperFolder
{
  objc_getAssociatedObject(a1, &ICAccountVirtualSystemPaperFolderIdentifier);
  v2 = (ICVirtualSmartFolderItemIdentifier *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    v3 = [ICVirtualSmartFolderItemIdentifier alloc];
    v4 = +[ICFolderListSectionIdentifier systemSectionIdentifier];
    id v5 = [a1 objectID];
    v2 = [(ICVirtualSmartFolderItemIdentifier *)v3 initWithType:@"ICVirtualSmartFolderItemIdentifierTypeSystemPaper" parentIdentifier:v4 accountObjectID:v5];

    objc_setAssociatedObject(a1, &ICAccountVirtualSystemPaperFolderIdentifier, v2, (void *)1);
  }
  return v2;
}

- (ICVirtualSmartFolderItemIdentifier)virtualMathNotesFolder
{
  objc_getAssociatedObject(a1, &ICAccountVirtualMathNotesFolderIdentifier);
  v2 = (ICVirtualSmartFolderItemIdentifier *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    v3 = [ICVirtualSmartFolderItemIdentifier alloc];
    v4 = +[ICFolderListSectionIdentifier systemSectionIdentifier];
    id v5 = [a1 objectID];
    v2 = [(ICVirtualSmartFolderItemIdentifier *)v3 initWithType:@"ICVirtualSmartFolderItemIdentifierTypeMathNotes" parentIdentifier:v4 accountObjectID:v5];

    objc_setAssociatedObject(a1, &ICAccountVirtualMathNotesFolderIdentifier, v2, (void *)1);
  }
  return v2;
}

- (ICVirtualSmartFolderItemIdentifier)virtualCallNotesFolder
{
  objc_getAssociatedObject(a1, &ICAccountVirtualCallNotesFolderIdentifier);
  v2 = (ICVirtualSmartFolderItemIdentifier *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    v3 = [ICVirtualSmartFolderItemIdentifier alloc];
    v4 = +[ICFolderListSectionIdentifier systemSectionIdentifier];
    id v5 = [a1 objectID];
    v2 = [(ICVirtualSmartFolderItemIdentifier *)v3 initWithType:@"ICVirtualSmartFolderItemIdentifierTypeCallNotes" parentIdentifier:v4 accountObjectID:v5];

    objc_setAssociatedObject(a1, &ICAccountVirtualCallNotesFolderIdentifier, v2, (void *)1);
  }
  return v2;
}

@end
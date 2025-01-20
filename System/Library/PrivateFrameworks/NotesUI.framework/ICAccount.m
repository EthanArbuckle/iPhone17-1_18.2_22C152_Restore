@interface ICAccount
@end

@implementation ICAccount

void __49__ICAccount_UI__globalVirtualSharedWithYouFolder__block_invoke()
{
  v0 = [ICVirtualSmartFolderItemIdentifier alloc];
  id v3 = +[ICFolderListSectionIdentifier systemSectionIdentifier];
  uint64_t v1 = [(ICVirtualSmartFolderItemIdentifier *)v0 initWithType:@"ICVirtualSmartFolderItemIdentifierTypeSharedWithYou" parentIdentifier:v3];
  v2 = (void *)globalVirtualSharedWithYouFolder_identifier;
  globalVirtualSharedWithYouFolder_identifier = v1;
}

void __45__ICAccount_UI__globalVirtualMathNotesFolder__block_invoke()
{
  v0 = [ICVirtualSmartFolderItemIdentifier alloc];
  id v3 = +[ICFolderListSectionIdentifier systemSectionIdentifier];
  uint64_t v1 = [(ICVirtualSmartFolderItemIdentifier *)v0 initWithType:@"ICVirtualSmartFolderItemIdentifierTypeMathNotes" parentIdentifier:v3];
  v2 = (void *)globalVirtualMathNotesFolder_identifier;
  globalVirtualMathNotesFolder_identifier = v1;
}

void __47__ICAccount_UI__globalVirtualSystemPaperFolder__block_invoke()
{
  v0 = [ICVirtualSmartFolderItemIdentifier alloc];
  id v3 = +[ICFolderListSectionIdentifier systemSectionIdentifier];
  uint64_t v1 = [(ICVirtualSmartFolderItemIdentifier *)v0 initWithType:@"ICVirtualSmartFolderItemIdentifierTypeSystemPaper" parentIdentifier:v3];
  v2 = (void *)globalVirtualSystemPaperFolder_identifier;
  globalVirtualSystemPaperFolder_identifier = v1;
}

void __45__ICAccount_UI__globalVirtualCallNotesFolder__block_invoke()
{
  v0 = [ICVirtualSmartFolderItemIdentifier alloc];
  id v3 = +[ICFolderListSectionIdentifier systemSectionIdentifier];
  uint64_t v1 = [(ICVirtualSmartFolderItemIdentifier *)v0 initWithType:@"ICVirtualSmartFolderItemIdentifierTypeCallNotes" parentIdentifier:v3];
  v2 = (void *)globalVirtualCallNotesFolder_identifier;
  globalVirtualCallNotesFolder_identifier = v1;
}

void __60__ICAccount_UI__globalVirtualRecentlyDeletedMathNotesFolder__block_invoke(uint64_t a1)
{
  v2 = [ICVirtualSmartFolderItemIdentifier alloc];
  id v5 = [*(id *)(a1 + 32) globalVirtualMathNotesFolder];
  uint64_t v3 = [(ICVirtualSmartFolderItemIdentifier *)v2 initWithType:@"ICVirtualSmartFolderItemIdentifierTypeRecentlyDeletedMathNotes" parentIdentifier:v5];
  v4 = (void *)globalVirtualRecentlyDeletedMathNotesFolder_identifier;
  globalVirtualRecentlyDeletedMathNotesFolder_identifier = v3;
}

@end
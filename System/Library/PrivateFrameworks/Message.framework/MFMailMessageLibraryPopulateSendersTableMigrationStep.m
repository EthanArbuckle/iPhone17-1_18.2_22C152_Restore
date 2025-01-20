@interface MFMailMessageLibraryPopulateSendersTableMigrationStep
+ (int)runWithConnection:(id)a3;
@end

@implementation MFMailMessageLibraryPopulateSendersTableMigrationStep

+ (int)runWithConnection:(id)a3
{
  id v3 = a3;
  v4 = +[MailAccount mailAccounts];
  v5 = objc_msgSend(v4, "ef_compactMap:", &__block_literal_global_42);

  id v6 = objc_alloc_init(MEMORY[0x1E4F1B980]);
  int v7 = [MEMORY[0x1E4F60BA8] runWithConnection:v3 sentMailboxURLs:v5 contactStore:v6] ^ 1;

  return v7;
}

id __75__MFMailMessageLibraryPopulateSendersTableMigrationStep_runWithConnection___block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 mailboxUidOfType:4 createIfNeeded:0];
  id v3 = [v2 URL];

  return v3;
}

@end
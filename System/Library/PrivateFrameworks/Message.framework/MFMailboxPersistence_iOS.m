@interface MFMailboxPersistence_iOS
+ (OS_dispatch_queue)mailboxCacheQueue;
- (BOOL)createMailbox:(id)a3 parentMailboxID:(id)a4;
- (BOOL)deleteMailbox:(id)a3;
- (BOOL)mailboxURLIsGmailLabel:(id)a3;
- (BOOL)moveMailbox:(id)a3 newParentMailboxID:(id)a4;
- (BOOL)renameMailbox:(id)a3 newName:(id)a4;
- (EDMailboxRowID_s)insertDatabaseRowForMailboxURL:(id)a3;
- (MFMailMessageLibrary)library;
- (MFMailboxPersistence_iOS)initWithMailboxProvider:(id)a3 database:(id)a4 library:(id)a5;
- (id)mailboxDatabaseIDsForMailboxObjectIDs:(id)a3 createIfNecessary:(BOOL)a4;
- (id)mailboxDatabaseIDsForMailboxURLStrings:(id)a3;
- (id)mailboxURLForMailboxDatabaseID:(EDMailboxRowID_s)a3;
- (void)recordFrecencyEventWithMailboxesWithIDs:(id)a3;
- (void)serverCountsForMailboxScope:(id)a3 block:(id)a4;
- (void)testRecordFrecencyEventsForAllMailboxes;
- (void)testResetFrecencyForAllMailboxes;
@end

@implementation MFMailboxPersistence_iOS

- (BOOL)mailboxURLIsGmailLabel:(id)a3
{
  return 0;
}

- (void)serverCountsForMailboxScope:(id)a3 block:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [MEMORY[0x1E4F60318] allMailboxesScope];

  if (v8 == v6)
  {
    v13 = 0;
LABEL_9:
    v14 = [(EDMailboxPersistence *)self database];
    v15 = [NSString stringWithUTF8String:"-[MFMailboxPersistence_iOS serverCountsForMailboxScope:block:]"];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __62__MFMailboxPersistence_iOS_serverCountsForMailboxScope_block___block_invoke;
    v17[3] = &unk_1E5D3F1D8;
    id v16 = v13;
    id v18 = v16;
    id v19 = v7;
    objc_msgSend(v14, "__performReadWithCaller:usingBlock:", v15, v17);

    goto LABEL_10;
  }
  char v20 = 0;
  v9 = [v6 allMailboxObjectIDsWithMailboxTypeResolver:self forExclusion:&v20];
  v10 = [(MFMailboxPersistence_iOS *)self mailboxDatabaseIDsForMailboxObjectIDs:v9 createIfNecessary:0];
  if ([v10 count])
  {
    v11 = [MEMORY[0x1E4F60E78] column:*MEMORY[0x1E4F60D08]];
    v12 = v11;
    if (v20) {
      [v11 notIn:v10];
    }
    else {
    v13 = [v11 in:v10];
    }

    goto LABEL_9;
  }

LABEL_10:
}

- (id)mailboxDatabaseIDsForMailboxObjectIDs:(id)a3 createIfNecessary:(BOOL)a4
{
  id v6 = a3;
  id v7 = [(MFMailboxPersistence_iOS *)self library];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __84__MFMailboxPersistence_iOS_mailboxDatabaseIDsForMailboxObjectIDs_createIfNecessary___block_invoke;
  v11[3] = &unk_1E5D3F190;
  BOOL v14 = a4;
  id v12 = v7;
  v13 = self;
  id v8 = v7;
  v9 = objc_msgSend(v6, "ef_compactMap:", v11);

  return v9;
}

- (MFMailMessageLibrary)library
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_library);
  return (MFMailMessageLibrary *)WeakRetained;
}

- (MFMailboxPersistence_iOS)initWithMailboxProvider:(id)a3 database:(id)a4 library:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [v10 persistence];
  id v12 = [v11 hookRegistry];
  v15.receiver = self;
  v15.super_class = (Class)MFMailboxPersistence_iOS;
  v13 = [(EDMailboxPersistence *)&v15 initWithMailboxProvider:v8 database:v9 hookRegistry:v12];

  if (v13) {
    objc_storeWeak((id *)&v13->_library, v10);
  }

  return v13;
}

+ (OS_dispatch_queue)mailboxCacheQueue
{
  if (mailboxCacheQueue_onceToken != -1) {
    dispatch_once(&mailboxCacheQueue_onceToken, &__block_literal_global_39);
  }
  v2 = (void *)mailboxCacheQueue_queue;
  return (OS_dispatch_queue *)v2;
}

- (id)mailboxDatabaseIDsForMailboxURLStrings:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    v5 = [v4 allObjects];
    id v6 = objc_msgSend(v5, "ef_longestCommonPrefix");

    uint64_t v14 = 0;
    objc_super v15 = &v14;
    uint64_t v16 = 0x3032000000;
    v17 = __Block_byref_object_copy__14;
    id v18 = __Block_byref_object_dispose__14;
    id v19 = (id)0xAAAAAAAAAAAAAAAALL;
    id v19 = [MEMORY[0x1E4F1CA60] dictionary];
    id v7 = [(EDMailboxPersistence *)self database];
    id v8 = [NSString stringWithUTF8String:"-[MFMailboxPersistence_iOS mailboxDatabaseIDsForMailboxURLStrings:]"];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __67__MFMailboxPersistence_iOS_mailboxDatabaseIDsForMailboxURLStrings___block_invoke;
    v11[3] = &unk_1E5D3C500;
    void v11[4] = v6;
    id v12 = v4;
    v13 = &v14;
    objc_msgSend(v7, "__performReadWithCaller:usingBlock:", v8, v11);

    id v9 = (id)v15[5];
    _Block_object_dispose(&v14, 8);
  }
  else
  {
    id v9 = (id)MEMORY[0x1E4F1CC08];
  }

  return v9;
}

- (EDMailboxRowID_s)insertDatabaseRowForMailboxURL:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F60B88]);
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x2810000000;
  id v19 = "";
  uint64_t v20 = 0;
  id v6 = [(EDMailboxPersistence *)self database];
  id v7 = [NSString stringWithUTF8String:"-[MFMailboxPersistence_iOS insertDatabaseRowForMailboxURL:]"];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __59__MFMailboxPersistence_iOS_insertDatabaseRowForMailboxURL___block_invoke;
  v12[3] = &unk_1E5D3C500;
  id v8 = v5;
  id v13 = v8;
  id v9 = v4;
  id v14 = v9;
  objc_super v15 = &v16;
  objc_msgSend(v6, "__performWriteWithCaller:usingBlock:", v7, v12);

  v10.var0 = v17[4];
  _Block_object_dispose(&v16, 8);

  return v10;
}

- (id)mailboxURLForMailboxDatabaseID:(EDMailboxRowID_s)a3
{
  if (a3.var0)
  {
    uint64_t v9 = 0;
    EDMailboxRowID_s v10 = &v9;
    uint64_t v11 = 0x3032000000;
    id v12 = __Block_byref_object_copy__14;
    id v13 = __Block_byref_object_dispose__14;
    id v14 = 0;
    id v4 = [(EDMailboxPersistence *)self database];
    id v5 = [NSString stringWithUTF8String:"-[MFMailboxPersistence_iOS mailboxURLForMailboxDatabaseID:]"];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __59__MFMailboxPersistence_iOS_mailboxURLForMailboxDatabaseID___block_invoke;
    v8[3] = &unk_1E5D3CDD8;
    v8[4] = &v9;
    v8[5] = a3.var0;
    objc_msgSend(v4, "__performReadWithCaller:usingBlock:", v5, v8);

    id v6 = (id)v10[5];
    _Block_object_dispose(&v9, 8);
  }
  else
  {
    id v6 = 0;
  }
  return v6;
}

- (BOOL)createMailbox:(id)a3 parentMailboxID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(EDMailboxPersistence *)self mailboxProvider];
  uint64_t v9 = [v8 legacyMailboxForObjectID:v7];

  EDMailboxRowID_s v10 = [v9 account];
  uint64_t v11 = [v10 newMailboxWithParent:v9 name:v6];
  if (v11) {
    [v10 saveState];
  }

  return v11 != 0;
}

- (BOOL)deleteMailbox:(id)a3
{
  id v4 = a3;
  id v5 = [(EDMailboxPersistence *)self mailboxProvider];
  id v6 = [v5 legacyMailboxForObjectID:v4];

  id v7 = [v6 account];
  char v8 = [v7 deleteMailbox:v6];

  return v8;
}

- (BOOL)moveMailbox:(id)a3 newParentMailboxID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  char v8 = [(EDMailboxPersistence *)self mailboxProvider];
  uint64_t v9 = [v8 legacyMailboxForObjectID:v6];

  EDMailboxRowID_s v10 = [(EDMailboxPersistence *)self mailboxProvider];
  uint64_t v11 = [v10 legacyMailboxForObjectID:v7];

  id v12 = [v11 account];
  LOBYTE(v10) = [v12 moveMailbox:v9 intoParent:v11];

  return (char)v10;
}

- (BOOL)renameMailbox:(id)a3 newName:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  char v8 = [(EDMailboxPersistence *)self mailboxProvider];
  uint64_t v9 = [v8 legacyMailboxForObjectID:v6];

  EDMailboxRowID_s v10 = [v9 account];
  LOBYTE(v8) = [v10 renameMailbox:v9 newName:v7];

  return (char)v8;
}

- (void)recordFrecencyEventWithMailboxesWithIDs:(id)a3
{
  id v6 = a3;
  id v4 = [(MFMailboxPersistence_iOS *)self library];
  id v5 = [v4 mailboxFrecencyController];
  [v5 recordEventWithMailboxIDs:v6];
}

- (void)testRecordFrecencyEventsForAllMailboxes
{
  id v3 = [(MFMailboxPersistence_iOS *)self library];
  v2 = [v3 mailboxFrecencyController];
  [v2 testRecordFrecencyEventsForAllMailboxes];
}

- (void)testResetFrecencyForAllMailboxes
{
  id v3 = [(MFMailboxPersistence_iOS *)self library];
  v2 = [v3 mailboxFrecencyController];
  [v2 testResetFrecencyForAllMailboxes];
}

- (void).cxx_destruct
{
}

@end
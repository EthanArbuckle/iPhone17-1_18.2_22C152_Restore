@interface MFMailboxPersistence
@end

@implementation MFMailboxPersistence

uint64_t __62__MFMailboxPersistence_iOS_serverCountsForMailboxScope_block___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = objc_alloc(MEMORY[0x1E4F60EF8]);
  v5 = [MEMORY[0x1E4F60B90] mailboxesTableName];
  v6 = (void *)[v4 initWithResultColumn:@"url" table:v5];

  [v6 addResultColumn:@"server_unread_count"];
  [v6 addResultColumn:@"most_recent_status_count"];
  [v6 addResultColumn:@"last_sync_status_count"];
  [v6 setWhere:*(void *)(a1 + 32)];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __62__MFMailboxPersistence_iOS_serverCountsForMailboxScope_block___block_invoke_2;
  v9[3] = &unk_1E5D3C9F0;
  id v10 = *(id *)(a1 + 40);
  uint64_t v7 = [v3 executeSelectStatement:v6 withBlock:v9 error:0];

  return v7;
}

id __84__MFMailboxPersistence_iOS_mailboxDatabaseIDsForMailboxObjectIDs_createIfNecessary___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 url];
  v5 = [v4 absoluteString];

  uint64_t v6 = [*(id *)(a1 + 32) mailboxIDForURLString:v5 createIfNecessary:0];
  uint64_t v7 = *MEMORY[0x1E4F5FCC8];
  if (v6 == *MEMORY[0x1E4F5FCC8])
  {
    if (*(unsigned char *)(a1 + 48))
    {
      v8 = [*(id *)(a1 + 40) mailboxProvider];
      v9 = [v8 legacyMailboxForObjectID:v3];

      if (v9) {
        uint64_t v6 = [*(id *)(a1 + 32) mailboxIDForURLString:v5 createIfNecessary:1];
      }
    }
  }
  if (v6 == v7)
  {
    id v10 = 0;
  }
  else
  {
    id v10 = [MEMORY[0x1E4F28ED0] numberWithLongLong:v6];
  }

  return v10;
}

void __62__MFMailboxPersistence_iOS_serverCountsForMailboxScope_block___block_invoke_2(uint64_t a1, void *a2)
{
  id v10 = a2;
  id v3 = [v10 objectAtIndexedSubscript:0];
  id v4 = [v3 stringValue];

  v5 = (void *)[objc_alloc(MEMORY[0x1E4F1CB10]) initWithString:v4];
  uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F60310]) initWithURL:v5];
  uint64_t v7 = [v10 objectAtIndexedSubscript:1];
  [v7 integerValue];

  v8 = [v10 objectAtIndexedSubscript:2];
  [v8 integerValue];

  v9 = [v10 objectAtIndexedSubscript:3];
  [v9 integerValue];

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __45__MFMailboxPersistence_iOS_mailboxCacheQueue__block_invoke()
{
  v2 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.mail.account.mailbox-cache", v2);
  v1 = (void *)mailboxCacheQueue_queue;
  mailboxCacheQueue_queue = (uint64_t)v0;
}

uint64_t __67__MFMailboxPersistence_iOS_mailboxDatabaseIDsForMailboxURLStrings___block_invoke(uint64_t a1, void *a2)
{
  v17[2] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = v3;
  if (*(void *)(a1 + 32))
  {
    v5 = [v3 preparedStatementForQueryString:@"SELECT rowid, url FROM mailboxes WHERE substr(url, 1, :length) IS :pattern ;"];
    uint64_t v6 = *(void **)(a1 + 32);
    v16[0] = @":pattern";
    v16[1] = @":length";
    v17[0] = v6;
    uint64_t v7 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", objc_msgSend(v6, "length"));
    v17[1] = v7;
    v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:2];
  }
  else
  {
    v5 = [v3 preparedStatementForQueryString:@"SELECT rowid, url FROM mailboxes;"];
    v8 = (void *)MEMORY[0x1E4F1CC08];
  }
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __67__MFMailboxPersistence_iOS_mailboxDatabaseIDsForMailboxURLStrings___block_invoke_2;
  v13[3] = &unk_1E5D3D378;
  id v9 = *(id *)(a1 + 40);
  uint64_t v10 = *(void *)(a1 + 48);
  id v14 = v9;
  uint64_t v15 = v10;
  uint64_t v11 = [v5 executeWithNamedBindings:v8 usingBlock:v13 error:0];

  return v11;
}

void __67__MFMailboxPersistence_iOS_mailboxDatabaseIDsForMailboxURLStrings___block_invoke_2(uint64_t a1, void *a2)
{
  id v7 = a2;
  id v3 = [v7 objectAtIndexedSubscript:1];
  id v4 = [v3 stringValue];

  if ([*(id *)(a1 + 32) containsObject:v4])
  {
    v5 = [v7 objectAtIndexedSubscript:0];
    uint64_t v6 = [v5 numberValue];

    if (v6 && v4) {
      [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setObject:v6 forKeyedSubscript:v4];
    }
  }
}

uint64_t __59__MFMailboxPersistence_iOS_insertDatabaseRowForMailboxURL___block_invoke(uint64_t a1, void *a2)
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "insertGeneration:", objc_msgSend(v3, "transactionGeneration"));
  id v4 = [v3 preparedStatementForQueryString:@"INSERT OR IGNORE INTO mailboxes (url) values (?);"];
  [v3 clearLastInsertedDatabaseID];
  v5 = [*(id *)(a1 + 40) absoluteString];
  v13[0] = v5;
  uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
  [v4 executeWithIndexedBindings:v6 usingBlock:&__block_literal_global_33 error:0];

  uint64_t v7 = [v3 lastInsertedDatabaseID];
  if (v7)
  {
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 32) = v7;
  }
  else
  {

    id v4 = [v3 preparedStatementForQueryString:@"SELECT rowid FROM mailboxes WHERE url = ?"];;
    v8 = [*(id *)(a1 + 40) absoluteString];
    v12 = v8;
    id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:1];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __59__MFMailboxPersistence_iOS_insertDatabaseRowForMailboxURL___block_invoke_3;
    v11[3] = &unk_1E5D3C7E8;
    v11[4] = *(void *)(a1 + 48);
    [v4 executeWithIndexedBindings:v9 usingBlock:v11 error:0];
  }
  return 1;
}

void __59__MFMailboxPersistence_iOS_insertDatabaseRowForMailboxURL___block_invoke_3(uint64_t a1, void *a2)
{
  id v4 = a2;
  id v3 = [v4 objectAtIndexedSubscript:0];
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 32) = [v3 int64Value];
}

uint64_t __59__MFMailboxPersistence_iOS_mailboxURLForMailboxDatabaseID___block_invoke(uint64_t a1, void *a2)
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v3 = [a2 preparedStatementForQueryString:@"SELECT url FROM mailboxes WHERE rowid IS :rowid ;"];
  id v9 = @":rowid";
  id v4 = [MEMORY[0x1E4F28ED0] numberWithUnsignedLongLong:*(void *)(a1 + 40)];
  v10[0] = v4;
  v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __59__MFMailboxPersistence_iOS_mailboxURLForMailboxDatabaseID___block_invoke_2;
  v8[3] = &unk_1E5D3C7E8;
  v8[4] = *(void *)(a1 + 32);
  uint64_t v6 = [v3 executeWithNamedBindings:v5 usingBlock:v8 error:0];

  return v6;
}

void __59__MFMailboxPersistence_iOS_mailboxURLForMailboxDatabaseID___block_invoke_2(uint64_t a1, void *a2)
{
  id v8 = a2;
  id v3 = [v8 objectAtIndexedSubscript:0];
  id v4 = [v3 stringValue];

  if (v4)
  {
    uint64_t v5 = objc_msgSend(MEMORY[0x1E4F1CB10], "ef_urlWithString:", v4);
    uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
    uint64_t v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;
  }
}

@end
@interface MFDADeferredStoreDraftOperation
+ (BOOL)supportsSecureCoding;
+ (id)log;
- (BOOL)translateToLocalActionWithConnection:(id)a3;
- (MFDADeferredStoreDraftOperation)initWithCoder:(id)a3;
- (MFDADeferredStoreDraftOperation)initWithMessageIDHeader:(id)a3 mailbox:(id)a4;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation MFDADeferredStoreDraftOperation

+ (id)log
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __38__MFDADeferredStoreDraftOperation_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_369 != -1) {
    dispatch_once(&log_onceToken_369, block);
  }
  v2 = (void *)log_log_368;
  return v2;
}

void __38__MFDADeferredStoreDraftOperation_log__block_invoke(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email", (const char *)[v3 UTF8String]);
  v2 = (void *)log_log_368;
  log_log_368 = (uint64_t)v1;
}

- (MFDADeferredStoreDraftOperation)initWithMessageIDHeader:(id)a3 mailbox:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)MFDADeferredStoreDraftOperation;
  v8 = [(MFDADeferredStoreDraftOperation *)&v15 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    messageIDHeader = v8->_messageIDHeader;
    v8->_messageIDHeader = (NSString *)v9;

    uint64_t v11 = [v7 copy];
    folderID = v8->_folderID;
    v8->_folderID = (NSString *)v11;

    v13 = v8;
  }

  return v8;
}

- (MFDADeferredStoreDraftOperation)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)MFDADeferredStoreDraftOperation;
  v5 = [(MFDADeferredStoreDraftOperation *)&v12 init];
  if (v5)
  {
    if (([v4 allowsKeyedCoding] & 1) == 0) {
      __assert_rtn("-[MFDADeferredStoreDraftOperation initWithCoder:]", "MFMailMessageLibraryLocalActionsTablesMigrationStep.m", 684, "[aDecoder allowsKeyedCoding] && \"aDecoder must allow keyed coding\"");
    }
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MessageID"];
    messageIDHeader = v5->_messageIDHeader;
    v5->_messageIDHeader = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"FolderID"];
    folderID = v5->_folderID;
    v5->_folderID = (NSString *)v8;

    v10 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  if (([v4 allowsKeyedCoding] & 1) == 0) {
    __assert_rtn("-[MFDADeferredStoreDraftOperation encodeWithCoder:]", "MFMailMessageLibraryLocalActionsTablesMigrationStep.m", 693, "[aCoder allowsKeyedCoding] && \"aCoder must allow keyed coding\"");
  }
  [v4 encodeObject:self->_messageIDHeader forKey:@"MessageID"];
  [v4 encodeObject:self->_folderID forKey:@"FolderID"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)translateToLocalActionWithConnection:(id)a3
{
  v37[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v29 = 0;
  v30 = &v29;
  uint64_t v31 = 0x3032000000;
  v32 = __Block_byref_object_copy__15;
  v33 = __Block_byref_object_dispose__15;
  id v34 = 0;
  uint64_t v23 = 0;
  v24 = &v23;
  uint64_t v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__15;
  v27 = __Block_byref_object_dispose__15;
  id v28 = 0;
  id v4 = [v3 preparedStatementForQueryString:@"SELECT ROWID, mailbox FROM messages JOIN WHERE message_id = ? LIMIT 1"];
  v5 = [MEMORY[0x1E4F28ED0] numberWithLongLong:MFStringHashForMessageIDHeader()];
  v37[0] = v5;
  uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v37 count:1];
  id v21 = 0;
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __72__MFDADeferredStoreDraftOperation_translateToLocalActionWithConnection___block_invoke;
  v22[3] = &unk_1E5D3D130;
  v22[4] = &v29;
  v22[5] = &v23;
  char v7 = [v4 executeWithIndexedBindings:v6 usingBlock:v22 error:&v21];
  id v8 = v21;

  if (v7)
  {
    if (v24[5])
    {
      uint64_t v9 = [v3 preparedStatementForQueryString:@"INSERT INTO local_message_actions (action_type, mailbox, source_mailbox, destination_mailbox, user_initiated) VALUES (2, ?, NULL, ?, 0)"];
      v36[0] = v24[5];
      v36[1] = v36[0];
      v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v36 count:2];
      id v20 = v8;
      int v11 = [v9 executeWithIndexedBindings:v10 usingBlock:0 error:&v20];
      id v12 = v20;

      if (!v11)
      {
        [v3 handleError:v12 message:@"Inserting append action"];
        char v14 = 0;
LABEL_10:

        id v8 = v12;
        goto LABEL_11;
      }
      uint64_t v13 = [v3 lastInsertedDatabaseID];

      id v8 = v12;
    }
    else
    {
      uint64_t v13 = 0;
    }
    uint64_t v9 = [v3 preparedStatementForQueryString:@"INSERT INTO action_messages (action, message, remote_id, destination_message, action_phase) VALUES (?, NULL, NULL, ?, 3)"];
    objc_super v15 = [MEMORY[0x1E4F28ED0] numberWithLongLong:v13];
    uint64_t v16 = v30[5];
    v35[0] = v15;
    v35[1] = v16;
    v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v35 count:2];
    id v19 = v8;
    char v14 = [v9 executeWithIndexedBindings:v17 usingBlock:0 error:&v19];
    id v12 = v19;

    if ((v14 & 1) == 0) {
      [v3 handleError:v12 message:@"Inserting message for append"];
    }
    goto LABEL_10;
  }
  [v3 handleError:v8 message:@"Selecting message for append"];
  char v14 = 0;
LABEL_11:

  _Block_object_dispose(&v23, 8);
  _Block_object_dispose(&v29, 8);

  return v14;
}

void __72__MFDADeferredStoreDraftOperation_translateToLocalActionWithConnection___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v14 = a2;
  uint64_t v6 = [v14 objectAtIndexedSubscript:0];
  uint64_t v7 = [v6 numberValue];
  uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;

  v10 = [v14 objectAtIndexedSubscript:1];
  uint64_t v11 = [v10 numberValue];
  uint64_t v12 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = v11;

  *a4 = 1;
}

- (id)description
{
  id v3 = NSString;
  v7.receiver = self;
  v7.super_class = (Class)MFDADeferredStoreDraftOperation;
  id v4 = [(MFDADeferredStoreDraftOperation *)&v7 description];
  v5 = [v3 stringWithFormat:@"%@ message-id \"%@\"", v4, self->_messageIDHeader];

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_folderID, 0);
  objc_storeStrong((id *)&self->_messageIDHeader, 0);
}

@end
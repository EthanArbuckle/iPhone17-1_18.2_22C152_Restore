@interface MFDADeferredMessageMoveOperation
+ (BOOL)supportsSecureCoding;
+ (id)log;
- (BOOL)translateToLocalActionWithConnection:(id)a3;
- (MFDADeferredMessageMoveOperation)initWithCoder:(id)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation MFDADeferredMessageMoveOperation

+ (id)log
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __39__MFDADeferredMessageMoveOperation_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_304 != -1) {
    dispatch_once(&log_onceToken_304, block);
  }
  v2 = (void *)log_log_303;
  return v2;
}

void __39__MFDADeferredMessageMoveOperation_log__block_invoke(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email", (const char *)[v3 UTF8String]);
  v2 = (void *)log_log_303;
  log_log_303 = (uint64_t)v1;
}

- (MFDADeferredMessageMoveOperation)initWithCoder:(id)a3
{
  v29[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)MFDADeferredMessageMoveOperation;
  v5 = [(MFDADeferredMessageMoveOperation *)&v26 init];
  if (v5)
  {
    if (([v4 allowsKeyedCoding] & 1) == 0) {
      __assert_rtn("-[MFDADeferredMessageMoveOperation initWithCoder:]", "MFMailMessageLibraryLocalActionsTablesMigrationStep.m", 546, "[aDecoder allowsKeyedCoding] && \"aDecoder must allow keyed coding\"");
    }
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SourceMailbox"];
    sourceMailboxID = v5->_sourceMailboxID;
    v5->_sourceMailboxID = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"DestinationMailbox"];
    destinationMailboxID = v5->_destinationMailboxID;
    v5->_destinationMailboxID = (NSString *)v8;

    v10 = (void *)MEMORY[0x1E4F1CAD0];
    v29[0] = objc_opt_class();
    v29[1] = objc_opt_class();
    v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:2];
    v12 = [v10 setWithArray:v11];
    uint64_t v13 = [v4 decodeObjectOfClasses:v12 forKey:@"SourceRemoteIDs"];
    sourceRemoteIDs = v5->_sourceRemoteIDs;
    v5->_sourceRemoteIDs = (NSArray *)v13;

    v15 = (void *)MEMORY[0x1E4F1CAD0];
    v28[0] = objc_opt_class();
    v28[1] = objc_opt_class();
    v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:2];
    v17 = [v15 setWithArray:v16];
    uint64_t v18 = [v4 decodeObjectOfClasses:v17 forKey:@"OriginalFlags"];
    originalFlags = v5->_originalFlags;
    v5->_originalFlags = (NSArray *)v18;

    v20 = (void *)MEMORY[0x1E4F1CAD0];
    v27[0] = objc_opt_class();
    v27[1] = objc_opt_class();
    v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:2];
    v22 = [v20 setWithArray:v21];
    uint64_t v23 = [v4 decodeObjectOfClasses:v22 forKey:@"TemporaryIDs"];
    temporaryRemoteIDs = v5->_temporaryRemoteIDs;
    v5->_temporaryRemoteIDs = (NSArray *)v23;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  if (([v4 allowsKeyedCoding] & 1) == 0) {
    __assert_rtn("-[MFDADeferredMessageMoveOperation encodeWithCoder:]", "MFMailMessageLibraryLocalActionsTablesMigrationStep.m", 558, "[aCoder allowsKeyedCoding] && \"aCoder must allow keyed coding\"");
  }
  [v4 encodeObject:self->_sourceMailboxID forKey:@"SourceMailbox"];
  [v4 encodeObject:self->_destinationMailboxID forKey:@"DestinationMailbox"];
  [v4 encodeObject:self->_sourceRemoteIDs forKey:@"SourceRemoteIDs"];
  [v4 encodeObject:self->_originalFlags forKey:@"OriginalFlags"];
  [v4 encodeObject:self->_temporaryRemoteIDs forKey:@"TemporaryIDs"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)translateToLocalActionWithConnection:(id)a3
{
  uint64_t v81 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(NSArray *)self->_sourceRemoteIDs count])
  {
    NSUInteger v5 = [(NSArray *)self->_sourceRemoteIDs count];
    if (v5 == [(NSArray *)self->_temporaryRemoteIDs count])
    {
      v36 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSArray count](self->_temporaryRemoteIDs, "count"));
      *(void *)buf = 0;
      *(void *)&buf[8] = buf;
      *(void *)&buf[16] = 0x3032000000;
      v78 = __Block_byref_object_copy__15;
      v79 = __Block_byref_object_dispose__15;
      id v80 = 0;
      uint64_t v68 = 0;
      v69 = &v68;
      uint64_t v70 = 0x3032000000;
      v71 = __Block_byref_object_copy__15;
      v72 = __Block_byref_object_dispose__15;
      id v73 = 0;
      id v6 = [NSString alloc];
      v7 = [(NSArray *)self->_temporaryRemoteIDs valueForKey:@"ef_quotedSQLEscapedString"];
      uint64_t v8 = [v7 componentsJoinedByString:@", "];
      v37 = (void *)[v6 initWithFormat:@"SELECT messages.ROWID, messages.mailbox, mailboxes.url FROM messages JOIN mailboxes ON messages.mailbox = mailboxes.ROWID WHERE remote_id IN (%@)", v8];

      v9 = [v4 preparedStatementForQueryString:v37];
      uint64_t v62 = 0;
      v63 = &v62;
      uint64_t v64 = 0x3032000000;
      v65 = __Block_byref_object_copy__15;
      v66 = __Block_byref_object_dispose__15;
      id v67 = 0;
      uint64_t v58 = 0;
      v59 = &v58;
      uint64_t v60 = 0x2020000000;
      char v61 = -86;
      v54[0] = MEMORY[0x1E4F143A8];
      v54[1] = 3221225472;
      v54[2] = __73__MFDADeferredMessageMoveOperation_translateToLocalActionWithConnection___block_invoke;
      v54[3] = &unk_1E5D3F4A8;
      v10 = v36;
      v55 = v10;
      v56 = buf;
      v57 = &v68;
      v11 = (id *)(v63 + 5);
      id obj = (id)v63[5];
      v35 = v9;
      LOBYTE(v9) = [v9 executeUsingBlock:v54 error:&obj];
      objc_storeStrong(v11, obj);
      char v61 = (char)v9;
      v12 = v59;
      if (!*((unsigned char *)v59 + 24))
      {
        [v4 handleError:v63[5] message:@"Selecting messages with temporary remote IDs"];
        v12 = v59;
      }
      uint64_t v47 = 0;
      v48 = &v47;
      uint64_t v49 = 0x3032000000;
      v50 = __Block_byref_object_copy__15;
      v51 = __Block_byref_object_dispose__15;
      id v52 = 0;
      if (!*((unsigned char *)v12 + 24)) {
        goto LABEL_24;
      }
      uint64_t v13 = [(id)v69[5] URLByDeletingLastPathComponent];
      v14 = [v13 URLByAppendingPathComponent:self->_sourceMailboxID];

      unint64_t v15 = 0x1E4F1C000uLL;
      if (v14)
      {
        v16 = [v4 preparedStatementForQueryString:@"SELECT ROWID FROM mailboxes WHERE URL = ? LIMIT 1"];
        v17 = [v14 absoluteString];
        v76 = v17;
        uint64_t v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v76 count:1];
        v46[0] = MEMORY[0x1E4F143A8];
        v46[1] = 3221225472;
        v46[2] = __73__MFDADeferredMessageMoveOperation_translateToLocalActionWithConnection___block_invoke_2;
        v46[3] = &unk_1E5D3C7E8;
        v46[4] = &v47;
        v19 = (id *)(v63 + 5);
        id v45 = (id)v63[5];
        char v20 = [v16 executeWithIndexedBindings:v18 usingBlock:v46 error:&v45];
        objc_storeStrong(v19, v45);
        unint64_t v15 = 0x1E4F1C000;
        *((unsigned char *)v59 + 24) = v20;

        if (!*((unsigned char *)v59 + 24)) {
          [v4 handleError:v63[5] message:@"Selecting source mailbox"];
        }
        if (!v48[5])
        {
          v21 = +[MFDADeferredMessageMoveOperation log];
          if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
          {
            v22 = [MEMORY[0x1E4F60E00] partiallyRedactedStringForString:self->_sourceMailboxID];
            [(MFDADeferredMessageMoveOperation *)v22 translateToLocalActionWithConnection:v21];
          }
        }
      }
      else
      {
        v16 = +[MFDADeferredMessageMoveOperation log];
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          v27 = [MEMORY[0x1E4F60E00] partiallyRedactedStringForString:self->_sourceMailboxID];
          [(MFDADeferredMessageMoveOperation *)v27 translateToLocalActionWithConnection:v16];
        }
      }

      if (!v48[5]) {
        goto LABEL_24;
      }
      id v28 = [v4 preparedStatementForQueryString:@"INSERT INTO local_message_actions (action_type, mailbox, source_mailbox, destination_mailbox, user_initiated) VALUES (6, ?, ?, ?, 0)"];
      v74[0] = v48[5];
      v74[1] = v74[0];
      v74[2] = *(void *)(*(void *)&buf[8] + 40);
      v29 = [*(id *)(v15 + 2424) arrayWithObjects:v74 count:3];
      v30 = (id *)(v63 + 5);
      id v44 = (id)v63[5];
      char v31 = [v28 executeWithIndexedBindings:v29 usingBlock:0 error:&v44];
      objc_storeStrong(v30, v44);
      *((unsigned char *)v59 + 24) = v31;

      if (*((unsigned char *)v59 + 24))
      {
        uint64_t v32 = [v4 lastInsertedDatabaseID];

        if (!v32)
        {
LABEL_24:
          BOOL v26 = *((unsigned char *)v59 + 24) != 0;
          _Block_object_dispose(&v47, 8);

          _Block_object_dispose(&v58, 8);
          _Block_object_dispose(&v62, 8);

          _Block_object_dispose(&v68, 8);
          _Block_object_dispose(buf, 8);

          goto LABEL_25;
        }
        v33 = [v4 preparedStatementForQueryString:@"INSERT INTO action_messages (action, message, remote_id, destination_message, action_phase) VALUES (?, NULL, ?, ?, 3)"];
        v38[0] = MEMORY[0x1E4F143A8];
        v38[1] = 3221225472;
        v38[2] = __73__MFDADeferredMessageMoveOperation_translateToLocalActionWithConnection___block_invoke_349;
        v38[3] = &unk_1E5D3F4D0;
        v38[4] = self;
        id v39 = v33;
        v41 = &v58;
        v42 = &v62;
        uint64_t v43 = v32;
        id v40 = v4;
        id v28 = v33;
        [v10 enumerateObjectsUsingBlock:v38];
      }
      else
      {
        [v4 handleError:v63[5] message:@"Inserting move action"];
      }

      goto LABEL_24;
    }
  }
  v10 = +[MFDADeferredMessageMoveOperation log];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    NSUInteger v23 = [(NSArray *)self->_sourceRemoteIDs count];
    NSUInteger v24 = [(NSArray *)self->_temporaryRemoteIDs count];
    v25 = [MEMORY[0x1E4F60E00] partiallyRedactedStringForString:self->_sourceMailboxID];
    *(_DWORD *)buf = 134218498;
    *(void *)&buf[4] = v23;
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = v24;
    *(_WORD *)&buf[22] = 2114;
    v78 = v25;
    _os_log_impl(&dword_1A7EFF000, v10, OS_LOG_TYPE_DEFAULT, "Not enough _sourceRemoteIDs(%ld) or _temporaryRemoteIDs(%ld) to migrate for source mailbox %{public}@", buf, 0x20u);
  }
  BOOL v26 = 1;
LABEL_25:

  return v26;
}

void __73__MFDADeferredMessageMoveOperation_translateToLocalActionWithConnection___block_invoke(uint64_t a1, void *a2)
{
  id v14 = a2;
  id v3 = [v14 objectAtIndexedSubscript:0];
  id v4 = [v3 numberValue];

  if (v4) {
    [*(id *)(a1 + 32) addObject:v4];
  }
  if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)
    || !*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
  {
    NSUInteger v5 = [v14 objectAtIndexedSubscript:1];
    uint64_t v6 = [v5 numberValue];
    uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;

    v9 = [v14 objectAtIndexedSubscript:2];
    v10 = [v9 stringValue];

    if (v10)
    {
      uint64_t v11 = [objc_alloc(MEMORY[0x1E4F1CB10]) initWithString:v10];
      uint64_t v12 = *(void *)(*(void *)(a1 + 48) + 8);
      uint64_t v13 = *(void **)(v12 + 40);
      *(void *)(v12 + 40) = v11;
    }
  }
}

void __73__MFDADeferredMessageMoveOperation_translateToLocalActionWithConnection___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v10 = a2;
  uint64_t v6 = [v10 objectAtIndexedSubscript:0];
  uint64_t v7 = [v6 numberValue];
  uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8);
  v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;

  *a4 = 1;
}

void __73__MFDADeferredMessageMoveOperation_translateToLocalActionWithConnection___block_invoke_349(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  v14[3] = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  uint64_t v8 = [*(id *)(*(void *)(a1 + 32) + 8) objectAtIndexedSubscript:a3];
  v9 = *(void **)(a1 + 40);
  id v10 = [NSNumber numberWithLongLong:*(void *)(a1 + 72)];
  v14[0] = v10;
  v14[1] = v8;
  v14[2] = v7;
  uint64_t v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:3];
  uint64_t v12 = *(void *)(*(void *)(a1 + 64) + 8);
  id obj = *(id *)(v12 + 40);
  LOBYTE(v9) = [v9 executeWithIndexedBindings:v11 usingBlock:0 error:&obj];
  objc_storeStrong((id *)(v12 + 40), obj);
  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = (_BYTE)v9;

  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
  {
    [*(id *)(a1 + 48) handleError:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) message:@"Inserting message for move"];
    *a4 = 1;
  }
}

- (id)description
{
  id v3 = NSString;
  v7.receiver = self;
  v7.super_class = (Class)MFDADeferredMessageMoveOperation;
  id v4 = [(MFDADeferredMessageMoveOperation *)&v7 description];
  NSUInteger v5 = [v3 stringWithFormat:@"%@ source \"%@\", destination \"%@\", %lu messages", v4, self->_sourceMailboxID, self->_destinationMailboxID, -[NSArray count](self->_sourceRemoteIDs, "count")];

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_destinationMailboxID, 0);
  objc_storeStrong((id *)&self->_sourceMailboxID, 0);
  objc_storeStrong((id *)&self->_temporaryRemoteIDs, 0);
  objc_storeStrong((id *)&self->_originalFlags, 0);
  objc_storeStrong((id *)&self->_sourceRemoteIDs, 0);
}

- (void)translateToLocalActionWithConnection:(NSObject *)a3 .cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138543362;
  *(void *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_0(&dword_1A7EFF000, a3, (uint64_t)a3, "Unable to find source mailbox URL for source mailbox id: %{public}@", (uint8_t *)a2);
}

- (void)translateToLocalActionWithConnection:(NSObject *)a3 .cold.2(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138543362;
  *(void *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_0(&dword_1A7EFF000, a3, (uint64_t)a3, "Unable to find source mailbox in database for source mailbox id: %{public}@", (uint8_t *)a2);
}

@end
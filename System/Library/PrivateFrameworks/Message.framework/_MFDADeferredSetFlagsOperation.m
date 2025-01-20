@interface _MFDADeferredSetFlagsOperation
+ (BOOL)supportsSecureCoding;
+ (id)log;
- (BOOL)translateToLocalActionWithConnection:(id)a3;
- (_MFDADeferredSetFlagsOperation)initWithCoder:(id)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation _MFDADeferredSetFlagsOperation

+ (id)log
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __37___MFDADeferredSetFlagsOperation_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_223 != -1) {
    dispatch_once(&log_onceToken_223, block);
  }
  v2 = (void *)log_log_222;
  return v2;
}

- (_MFDADeferredSetFlagsOperation)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_MFDADeferredSetFlagsOperation;
  v5 = [(_MFDADeferredSetFlagsOperation *)&v9 init];
  if (v5)
  {
    if (([v4 allowsKeyedCoding] & 1) == 0) {
      __assert_rtn("-[_MFDADeferredSetFlagsOperation initWithCoder:]", "MFMailMessageLibraryLocalActionsTablesMigrationStep.m", 374, "[aDecoder allowsKeyedCoding] && \"aDecoder must allow keyed coding\"");
    }
    v5->_onFlags = [v4 decodeInt64ForKey:@"OnFlags"];
    v5->_offFlags = [v4 decodeInt64ForKey:@"OffFlags"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MessageID"];
    messageID = v5->_messageID;
    v5->_messageID = (NSString *)v6;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  if (([v4 allowsKeyedCoding] & 1) == 0) {
    __assert_rtn("-[_MFDADeferredSetFlagsOperation encodeWithCoder:]", "MFMailMessageLibraryLocalActionsTablesMigrationStep.m", 384, "[aCoder allowsKeyedCoding] && \"aCoder must allow keyed coding\"");
  }
  [v4 encodeInt64:self->_onFlags forKey:@"OnFlags"];
  [v4 encodeInt64:self->_offFlags forKey:@"OffFlags"];
  [v4 encodeObject:self->_messageID forKey:@"MessageID"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)translateToLocalActionWithConnection:(id)a3
{
  v41[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  unint64_t onFlags = self->_onFlags;
  unint64_t offFlags = self->_offFlags;
  id v36 = 0;
  id v37 = 0;
  p_messageID = &self->_messageID;
  int v8 = [(_MFOfflineCacheOperation *)self databaseID:&v37 andMailbox:&v36 forMessageWithRemoteID:self->_messageID connection:v4];
  id v31 = v37;
  id v9 = v36;
  if (!v9)
  {
    v13 = +[_MFDADeferredSetFlagsOperation log];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      [(_MFDADeferredSetFlagsOperation *)(uint64_t *)&self->_messageID translateToLocalActionWithConnection:v19];
    }
    goto LABEL_13;
  }
  if (v8)
  {
    v10 = [v4 preparedStatementForQueryString:@"INSERT INTO local_message_actions (action_type, mailbox, source_mailbox, destination_mailbox, user_initiated) VALUES (3, ?, NULL, NULL, 0)"];
    v41[0] = v9;
    v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v41 count:1];
    id v35 = 0;
    int v12 = [v10 executeWithIndexedBindings:v11 usingBlock:0 error:&v35];
    v13 = v35;

    if (v12)
    {
      uint64_t v30 = [v4 lastInsertedDatabaseID];

      if ((onFlags & 1 | offFlags & 1) == 1)
      {
        v10 = [v4 preparedStatementForQueryString:@"INSERT INTO action_flags (action, flag_type, flag_value) VALUES (?, 1, ?)"];
        v40[0] = [MEMORY[0x1E4F28ED0] numberWithLongLong:v30];
        v29 = (void *)v40[0];
        v14 = [MEMORY[0x1E4F28ED0] numberWithBool:onFlags & 1];
        v40[1] = v14;
        v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v40 count:2];
        v34 = v13;
        char v16 = [v10 executeWithIndexedBindings:v15 usingBlock:0 error:&v34];
        v28 = v34;

        if ((v16 & 1) == 0)
        {
          [v4 handleError:v28 message:@"Inserting read flag change"];
          LOBYTE(v8) = 0;
          v13 = v28;
          goto LABEL_12;
        }

        int v17 = (onFlags >> 1) & 1 | (offFlags >> 1) & 1;
        v18 = v28;
        if ((v17 & 1) == 0)
        {
LABEL_18:
          v10 = [v4 preparedStatementForQueryString:@"INSERT INTO action_messages (action, message, remote_id, destination_message, action_phase) VALUES (?, ?, ?, NULL, 0)", v28];
          v26 = [MEMORY[0x1E4F28ED0] numberWithLongLong:v30];
          v38[0] = v26;
          v38[1] = v31;
          v38[2] = *p_messageID;
          v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:v38 count:3];
          v32 = v18;
          LOBYTE(v8) = [v10 executeWithIndexedBindings:v27 usingBlock:0 error:&v32];
          v13 = v32;

          if ((v8 & 1) == 0) {
            [v4 handleError:v13 message:@"Inserting message for flag change"];
          }
          goto LABEL_12;
        }
      }
      else
      {
        char v21 = onFlags | offFlags;
        v18 = v13;
        if ((v21 & 2) == 0) {
          goto LABEL_18;
        }
      }
      v10 = [v4 preparedStatementForQueryString:@"INSERT INTO action_flags (action, flag_type, flag_value) VALUES (?, 4, ?)", v28];
      v22 = [MEMORY[0x1E4F28ED0] numberWithLongLong:v30];
      v39[0] = v22;
      v23 = [MEMORY[0x1E4F28ED0] numberWithBool:(onFlags >> 1) & 1];
      v39[1] = v23;
      v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:v39 count:2];
      v33 = v18;
      int v25 = [v10 executeWithIndexedBindings:v24 usingBlock:0 error:&v33];
      v13 = v33;

      if (v25)
      {

        v18 = v13;
        goto LABEL_18;
      }
      [v4 handleError:v13 message:@"Inserting flagged flag change"];
    }
    else
    {
      [v4 handleError:v13 message:@"Inserting flag change action"];
    }
    LOBYTE(v8) = 0;
LABEL_12:

LABEL_13:
  }

  return v8;
}

- (id)description
{
  v3 = NSString;
  v7.receiver = self;
  v7.super_class = (Class)_MFDADeferredSetFlagsOperation;
  id v4 = [(_MFDADeferredSetFlagsOperation *)&v7 description];
  v5 = [v3 stringWithFormat:@"%@ message-id \"%@\", on-flags %llu, off-flags %llu", v4, self->_messageID, self->_onFlags, self->_offFlags];

  return v5;
}

- (void).cxx_destruct
{
}

- (void)translateToLocalActionWithConnection:(uint64_t)a3 .cold.1(uint64_t *a1, NSObject *a2, uint64_t a3)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *a1;
  int v4 = 138412290;
  uint64_t v5 = v3;
  OUTLINED_FUNCTION_0(&dword_1A7EFF000, a2, a3, "DAMessageID: %@ and corresponding mailboxNumber not found.", (uint8_t *)&v4);
}

@end
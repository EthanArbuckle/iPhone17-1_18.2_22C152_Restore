@interface _MFDADeferredDeleteMessageOperation
+ (BOOL)supportsSecureCoding;
+ (id)log;
- (BOOL)translateToLocalActionWithConnection:(id)a3;
- (_MFDADeferredDeleteMessageOperation)initWithCoder:(id)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation _MFDADeferredDeleteMessageOperation

+ (id)log
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __42___MFDADeferredDeleteMessageOperation_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_280 != -1) {
    dispatch_once(&log_onceToken_280, block);
  }
  v2 = (void *)log_log_279;
  return v2;
}

- (_MFDADeferredDeleteMessageOperation)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_MFDADeferredDeleteMessageOperation;
  v5 = [(_MFDADeferredDeleteMessageOperation *)&v9 init];
  if (v5)
  {
    if (([v4 allowsKeyedCoding] & 1) == 0) {
      __assert_rtn("-[_MFDADeferredDeleteMessageOperation initWithCoder:]", "MFMailMessageLibraryLocalActionsTablesMigrationStep.m", 472, "[aDecoder allowsKeyedCoding] && \"aDecoder must allow keyed coding\"");
    }
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
    __assert_rtn("-[_MFDADeferredDeleteMessageOperation encodeWithCoder:]", "MFMailMessageLibraryLocalActionsTablesMigrationStep.m", 480, "[aCoder allowsKeyedCoding] && \"aCoder must allow keyed coding\"");
  }
  [v4 encodeObject:self->_messageID forKey:@"MessageID"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)translateToLocalActionWithConnection:(id)a3
{
  v23[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v20 = 0;
  id v21 = 0;
  p_messageID = (uint64_t *)&self->_messageID;
  LODWORD(v6) = [(_MFOfflineCacheOperation *)self databaseID:&v21 andMailbox:&v20 forMessageWithRemoteID:self->_messageID connection:v4];
  id v7 = v21;
  id v8 = v20;
  if (v8)
  {
    if (v6)
    {
      objc_super v9 = [v4 preparedStatementForQueryString:@"INSERT INTO local_message_actions (action_type, mailbox, source_mailbox, destination_mailbox, user_initiated) VALUES (5, ?, ?, NULL, 0)"];
      v23[0] = v8;
      v23[1] = v8;
      v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:2];
      id v19 = 0;
      int v11 = [v9 executeWithIndexedBindings:v10 usingBlock:0 error:&v19];
      v12 = v19;

      if (v11)
      {
        uint64_t v6 = [v4 lastInsertedDatabaseID];

        if (!v6)
        {
          LOBYTE(v6) = 1;
          goto LABEL_13;
        }
        objc_super v9 = [v4 preparedStatementForQueryString:@"INSERT INTO action_messages (action, message, remote_id, destination_message, action_phase) VALUES (?, ?, ?, NULL, 4)"];
        v13 = [MEMORY[0x1E4F28ED0] numberWithLongLong:v6];
        v22[0] = v13;
        v22[1] = v7;
        v22[2] = *p_messageID;
        v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:3];
        v18 = v12;
        LOBYTE(v6) = [v9 executeWithIndexedBindings:v14 usingBlock:0 error:&v18];
        v15 = v18;

        if ((v6 & 1) == 0) {
          [v4 handleError:v15 message:@"Inserting message for delete"];
        }
        v12 = v15;
      }
      else
      {
        [v4 handleError:v12 message:@"Inserting delete action"];
        LOBYTE(v6) = 0;
      }
    }
    else
    {
      v12 = 0;
    }
  }
  else
  {
    v12 = +[_MFDADeferredDeleteMessageOperation log];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      [(_MFDADeferredSetFlagsOperation *)p_messageID translateToLocalActionWithConnection:v16];
    }
  }
LABEL_13:

  return v6;
}

- (id)description
{
  v3 = NSString;
  v7.receiver = self;
  v7.super_class = (Class)_MFDADeferredDeleteMessageOperation;
  id v4 = [(_MFDADeferredDeleteMessageOperation *)&v7 description];
  v5 = [v3 stringWithFormat:@"%@ message-id \"%@\"", v4, self->_messageID];

  return v5;
}

- (void).cxx_destruct
{
}

@end
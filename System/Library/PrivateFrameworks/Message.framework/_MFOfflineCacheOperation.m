@interface _MFOfflineCacheOperation
+ (BOOL)supportsSecureCoding;
- (BOOL)databaseID:(id *)a3 andMailbox:(id *)a4 forMessageWithRemoteID:(id)a5 connection:(id)a6;
- (BOOL)translateToLocalActionWithConnection:(id)a3;
@end

@implementation _MFOfflineCacheOperation

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)translateToLocalActionWithConnection:(id)a3
{
  return 1;
}

- (BOOL)databaseID:(id *)a3 andMailbox:(id *)a4 forMessageWithRemoteID:(id)a5 connection:(id)a6
{
  v30[1] = *MEMORY[0x1E4F143B8];
  id v9 = a5;
  id v10 = a6;
  uint64_t v24 = 0;
  v25 = &v24;
  uint64_t v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__15;
  v28 = __Block_byref_object_dispose__15;
  id v29 = 0;
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__15;
  v22 = __Block_byref_object_dispose__15;
  id v23 = 0;
  v11 = [v10 preparedStatementForQueryString:@"SELECT ROWID, mailbox FROM messages WHERE remote_id = ? LIMIT 1"];
  v30[0] = v9;
  v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:1];
  id v16 = 0;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __84___MFOfflineCacheOperation_databaseID_andMailbox_forMessageWithRemoteID_connection___block_invoke;
  v17[3] = &unk_1E5D3D130;
  v17[4] = &v24;
  v17[5] = &v18;
  char v13 = [v11 executeWithIndexedBindings:v12 usingBlock:v17 error:&v16];
  id v14 = v16;

  if ((v13 & 1) == 0) {
    [v10 handleError:v14 message:@"Fetching database ID and mailbox for message"];
  }
  if (a3) {
    *a3 = (id) v25[5];
  }
  if (a4) {
    *a4 = (id) v19[5];
  }

  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v24, 8);

  return v13;
}

@end
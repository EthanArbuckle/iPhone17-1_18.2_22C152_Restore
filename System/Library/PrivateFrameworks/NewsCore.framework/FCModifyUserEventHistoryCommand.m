@interface FCModifyUserEventHistoryCommand
- (BOOL)mergeLocalRecord:(id)a3 withRemoteRecord:(id)a4;
- (FCModifyUserEventHistoryCommand)initWithSessionID:(id)a3 data:(id)a4;
- (FCModifyUserEventHistoryCommand)initWithSessions:(id)a3;
- (id)ckRecordWithSessionID:(id)a3 data:(id)a4;
@end

@implementation FCModifyUserEventHistoryCommand

- (id)ckRecordWithSessionID:(id)a3 data:(id)a4
{
  uint64_t v5 = qword_1EB5D1B00;
  id v6 = a4;
  id v7 = a3;
  if (v5 != -1) {
    dispatch_once(&qword_1EB5D1B00, &__block_literal_global_166);
  }
  id v8 = objc_alloc(MEMORY[0x1E4F1A2F8]);
  v9 = (void *)[v8 initWithRecordName:v7 zoneID:_MergedGlobals_217];

  v10 = (void *)[objc_alloc(MEMORY[0x1E4F1A2D8]) initWithRecordType:@"UserEventHistorySession" recordID:v9];
  [v10 setObject:v6 forKeyedSubscript:@"sessionData"];

  return v10;
}

uint64_t __62__FCModifyUserEventHistoryCommand_ckRecordWithSessionID_data___block_invoke()
{
  id v0 = objc_alloc(MEMORY[0x1E4F1A320]);
  uint64_t v1 = [v0 initWithZoneName:@"UserEventHistory" ownerName:*MEMORY[0x1E4F19C08]];
  uint64_t v2 = _MergedGlobals_217;
  _MergedGlobals_217 = v1;
  return MEMORY[0x1F41817F8](v1, v2);
}

- (FCModifyUserEventHistoryCommand)initWithSessionID:(id)a3 data:(id)a4
{
  v10[1] = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [(FCModifyUserEventHistoryCommand *)self ckRecordWithSessionID:a3 data:a4];
  v10[0] = v5;
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
  v9.receiver = self;
  v9.super_class = (Class)FCModifyUserEventHistoryCommand;
  id v7 = [(FCModifyRecordsCommand *)&v9 initWithLocalRecords:v6 merge:0];

  return v7;
}

- (FCModifyUserEventHistoryCommand)initWithSessions:(id)a3
{
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __52__FCModifyUserEventHistoryCommand_initWithSessions___block_invoke;
  v9[3] = &unk_1E5B5A640;
  v4 = self;
  v10 = v4;
  uint64_t v5 = objc_msgSend(a3, "fc_arrayByTransformingWithBlock:", v9);
  v8.receiver = v4;
  v8.super_class = (Class)FCModifyUserEventHistoryCommand;
  id v6 = [(FCModifyRecordsCommand *)&v8 initWithLocalRecords:v5 merge:0];

  return v6;
}

id __52__FCModifyUserEventHistoryCommand_initWithSessions___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = a2;
  v4 = [v3 identifier];
  uint64_t v5 = [v3 compressedData];

  id v6 = [v2 ckRecordWithSessionID:v4 data:v5];

  return v6;
}

- (BOOL)mergeLocalRecord:(id)a3 withRemoteRecord:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    id v7 = (objc_class *)NSString;
    id v8 = a4;
    id v9 = a3;
    v10 = (void *)[[v7 alloc] initWithFormat:@"FCModifyUserEventHistoryCommand Asked to merge local and remote records Local Record: %@, Remote Record: %@", v9, v8];

    *(_DWORD *)buf = 136315906;
    v12 = "-[FCModifyUserEventHistoryCommand mergeLocalRecord:withRemoteRecord:]";
    __int16 v13 = 2080;
    v14 = "FCModifyUserEventHistoryCommand.m";
    __int16 v15 = 1024;
    int v16 = 45;
    __int16 v17 = 2114;
    v18 = v10;
    _os_log_fault_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "*** Assertion failure (Identifier: UnexpectedUserEventHistoryMerge) : %s %s:%d %{public}@", buf, 0x26u);
  }
  return 0;
}

@end
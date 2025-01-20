@interface VCCompanionSyncSerializer
- (id)changeFromData:(id)a3 ofType:(int64_t)a4;
- (id)dataFromChange:(id)a3;
@end

@implementation VCCompanionSyncSerializer

- (id)changeFromData:(id)a3 ofType:(int64_t)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = (void *)MEMORY[0x1C87C4C10]();
  v6 = [[VCPBChange alloc] initWithData:v4];
  v7 = (objc_class *)VCSYChangeClassFromMessageType([(VCPBChange *)v6 messageType]);
  if (v7)
  {
    v8 = v7;
    id v9 = [v7 alloc];
    v10 = [(VCPBChange *)v6 uniqueID];
    int v11 = [(VCPBChange *)v6 changeType];
    uint64_t v12 = 1;
    if (v11 == 2) {
      uint64_t v12 = 2;
    }
    if (v11 == 3) {
      uint64_t v13 = 3;
    }
    else {
      uint64_t v13 = v12;
    }
    id v14 = (id)[v9 initWithObjectIdentifier:v10 changeType:v13];

    v15 = [(VCPBChange *)v6 message];
    uint64_t v16 = [v15 length];

    if (!v16) {
      goto LABEL_10;
    }
    id v17 = objc_alloc(MEMORY[0x1E4F94090]);
    v18 = [(VCPBChange *)v6 message];
    v19 = (void *)[v17 initWithData:v18];

    id v27 = 0;
    int v20 = [v14 readFrom:v19 error:&v27];
    id v21 = v27;
    v22 = v21;
    if (v20)
    {

LABEL_10:
      id v14 = v14;
      v23 = v14;
      goto LABEL_18;
    }
    v25 = getWFWatchSyncLogObject();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315650;
      v29 = "-[VCCompanionSyncSerializer changeFromData:ofType:]";
      __int16 v30 = 2114;
      v31 = v8;
      __int16 v32 = 2114;
      v33 = v22;
      _os_log_impl(&dword_1C7D7E000, v25, OS_LOG_TYPE_FAULT, "%s Failed to deserialize %{public}@: %{public}@", buf, 0x20u);
    }

    v23 = [MEMORY[0x1E4F59E90] degenerateChange];
  }
  else
  {
    v24 = getWFWatchSyncLogObject();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315394;
      v29 = "-[VCCompanionSyncSerializer changeFromData:ofType:]";
      __int16 v30 = 1024;
      LODWORD(v31) = [(VCPBChange *)v6 messageType];
      _os_log_impl(&dword_1C7D7E000, v24, OS_LOG_TYPE_FAULT, "%s Unknown message type (%i) when deserializing, dropping change", buf, 0x12u);
    }

    v23 = [MEMORY[0x1E4F59E90] degenerateChange];
    id v14 = 0;
  }

LABEL_18:

  return v23;
}

- (id)dataFromChange:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  v3 = a3;
  id v4 = v3;
  if (v3 && ([v3 conformsToProtocol:&unk_1F2283498] & 1) != 0)
  {
    v5 = objc_alloc_init(VCPBChange);
    v6 = (void *)MEMORY[0x1C87C4C10]();
    v7 = [v4 objectIdentifier];
    [(VCPBChange *)v5 setUniqueID:v7];

    uint64_t v8 = [v4 changeType];
    if (v8 == 2) {
      unsigned int v9 = 2;
    }
    else {
      unsigned int v9 = 1;
    }
    if (v8 == 3) {
      uint64_t v10 = 3;
    }
    else {
      uint64_t v10 = v9;
    }
    [(VCPBChange *)v5 setChangeType:v10];
    -[VCPBChange setMessageType:](v5, "setMessageType:", [(id)objc_opt_class() messageType]);
    int v11 = objc_opt_new();
    id v19 = 0;
    char v12 = [v4 writeTo:v11 error:&v19];
    id v13 = v19;
    if (v12)
    {
      id v14 = [v11 immutableData];
      [(VCPBChange *)v5 setMessage:v14];

      v15 = [(VCPBChange *)v5 data];
    }
    else
    {
      id v17 = getWFWatchSyncLogObject();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315650;
        id v21 = "-[VCCompanionSyncSerializer dataFromChange:]";
        __int16 v22 = 2114;
        v23 = v4;
        __int16 v24 = 2114;
        id v25 = v13;
        _os_log_impl(&dword_1C7D7E000, v17, OS_LOG_TYPE_FAULT, "%s Failed to serialize %{public}@: %{public}@", buf, 0x20u);
      }

      v15 = 0;
    }

    uint64_t v16 = v4;
  }
  else
  {

    uint64_t v16 = getWFWatchSyncLogObject();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315394;
      id v21 = "-[VCCompanionSyncSerializer dataFromChange:]";
      __int16 v22 = 2114;
      v23 = v4;
      _os_log_impl(&dword_1C7D7E000, v16, OS_LOG_TYPE_FAULT, "%s Cannot serialize %{public}@, it does not conform to VCSYChange", buf, 0x16u);
    }
    v15 = 0;
  }

  return v15;
}

@end
@interface WBSPasswordWarningTopFraudTargets
- (NSArray)financialFraudTargets;
- (NSArray)fraudTargets;
- (NSArray)highPriorityFraudTargets;
- (WBSPasswordWarningTopFraudTargets)initWithHighPriorityTargets:(id)a3 targets:(id)a4 financialTargets:(id)a5;
- (WBSPasswordWarningTopFraudTargets)initWithSnapshotData:(id)a3 error:(id *)a4;
@end

@implementation WBSPasswordWarningTopFraudTargets

- (WBSPasswordWarningTopFraudTargets)initWithHighPriorityTargets:(id)a3 targets:(id)a4 financialTargets:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v20.receiver = self;
  v20.super_class = (Class)WBSPasswordWarningTopFraudTargets;
  v11 = [(WBSPasswordWarningTopFraudTargets *)&v20 init];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    highPriorityFraudTargets = v11->_highPriorityFraudTargets;
    v11->_highPriorityFraudTargets = (NSArray *)v12;

    uint64_t v14 = [v9 copy];
    fraudTargets = v11->_fraudTargets;
    v11->_fraudTargets = (NSArray *)v14;

    uint64_t v16 = [v10 copy];
    financialFraudTargets = v11->_financialFraudTargets;
    v11->_financialFraudTargets = (NSArray *)v16;

    v18 = v11;
  }

  return v11;
}

- (WBSPasswordWarningTopFraudTargets)initWithSnapshotData:(id)a3 error:(id *)a4
{
  v56[1] = *MEMORY[0x1E4F143B8];
  v6 = objc_msgSend(MEMORY[0x1E4F1C9E8], "safari_dictionaryWithJSONOrPropertyListData:", a3);
  v7 = v6;
  if (v6)
  {
    id v8 = [v6 objectForKeyedSubscript:@"highPriorityFraudTargets"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v9 = [v7 objectForKeyedSubscript:@"fraudTargets"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v10 = [v7 objectForKeyedSubscript:@"financialFraudTargets"];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          self = [(WBSPasswordWarningTopFraudTargets *)self initWithHighPriorityTargets:v8 targets:v9 financialTargets:v10];
          v11 = self;
LABEL_19:

LABEL_20:
          goto LABEL_21;
        }
        v36 = WBS_LOG_CHANNEL_PREFIXPasswords();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
        {
          -[WBSPasswordWarningTopFraudTargets initWithSnapshotData:error:](v36, v37, v38, v39, v40, v41, v42, v43);
          if (!a4) {
            goto LABEL_18;
          }
          goto LABEL_17;
        }
        if (a4)
        {
LABEL_17:
          v44 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v45 = *MEMORY[0x1E4F281F8];
          v46 = [NSString stringWithFormat:@"TopFraudTargets plist missing %@ key", @"financialFraudTargets", *MEMORY[0x1E4F28568]];
          v50 = v46;
          v47 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v50 forKeys:&v49 count:1];
          *a4 = [v44 errorWithDomain:v45 code:259 userInfo:v47];
        }
LABEL_18:
        v11 = 0;
        goto LABEL_19;
      }
      v25 = WBS_LOG_CHANNEL_PREFIXPasswords();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        -[WBSPasswordWarningTopFraudTargets initWithSnapshotData:error:](v25, v26, v27, v28, v29, v30, v31, v32);
        if (a4) {
          goto LABEL_14;
        }
      }
      else if (a4)
      {
LABEL_14:
        v33 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v34 = *MEMORY[0x1E4F281F8];
        uint64_t v51 = *MEMORY[0x1E4F28568];
        id v10 = [NSString stringWithFormat:@"TopFraudTargets plist missing %@ key", @"fraudTargets"];
        v52 = v10;
        v35 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v52 forKeys:&v51 count:1];
        *a4 = [v33 errorWithDomain:v34 code:259 userInfo:v35];

        goto LABEL_18;
      }
      v11 = 0;
      goto LABEL_20;
    }
    v15 = WBS_LOG_CHANNEL_PREFIXPasswords();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      -[WBSPasswordWarningTopFraudTargets initWithSnapshotData:error:].cold.4(v15, v16, v17, v18, v19, v20, v21, v22);
      if (a4) {
        goto LABEL_11;
      }
    }
    else if (a4)
    {
LABEL_11:
      v23 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v24 = *MEMORY[0x1E4F281F8];
      uint64_t v53 = *MEMORY[0x1E4F28568];
      id v9 = [NSString stringWithFormat:@"TopFraudTargets plist missing %@ key", @"highPriorityFraudTargets"];
      v54 = v9;
      id v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v54 forKeys:&v53 count:1];
      [v23 errorWithDomain:v24 code:259 userInfo:v10];
      v11 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_19;
    }
    v11 = 0;
    goto LABEL_21;
  }
  uint64_t v12 = WBS_LOG_CHANNEL_PREFIXPasswords();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    -[WBSPasswordWarningTopFraudTargets initWithSnapshotData:error:](v12);
    if (a4) {
      goto LABEL_8;
    }
LABEL_24:
    v11 = 0;
    goto LABEL_22;
  }
  if (!a4) {
    goto LABEL_24;
  }
LABEL_8:
  v13 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v14 = *MEMORY[0x1E4F281F8];
  uint64_t v55 = *MEMORY[0x1E4F28568];
  v56[0] = @"Failed to decode topFraudTargets plist data.";
  id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v56 forKeys:&v55 count:1];
  [v13 errorWithDomain:v14 code:259 userInfo:v8];
  v11 = 0;
  *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_21:

LABEL_22:
  return v11;
}

- (NSArray)highPriorityFraudTargets
{
  return self->_highPriorityFraudTargets;
}

- (NSArray)fraudTargets
{
  return self->_fraudTargets;
}

- (NSArray)financialFraudTargets
{
  return self->_financialFraudTargets;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_financialFraudTargets, 0);
  objc_storeStrong((id *)&self->_fraudTargets, 0);
  objc_storeStrong((id *)&self->_highPriorityFraudTargets, 0);
}

- (void)initWithSnapshotData:(os_log_t)log error:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1B728F000, log, OS_LOG_TYPE_ERROR, "Failed to decode TopFraudTargets plist data.", v1, 2u);
}

- (void)initWithSnapshotData:(uint64_t)a3 error:(uint64_t)a4 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithSnapshotData:(uint64_t)a3 error:(uint64_t)a4 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithSnapshotData:(uint64_t)a3 error:(uint64_t)a4 .cold.4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end
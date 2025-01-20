@interface PGTrialSession
- (PGTrialSession)init;
- (TRIClient)trialClient;
- (id)arrayForFactorName:(id)a3 withNamespaceType:(unsigned __int16)a4;
- (id)dictionaryForFactorName:(id)a3 withNamespaceType:(unsigned __int16)a4;
- (id)levelForFactorName:(id)a3 withNamespaceType:(unsigned __int16)a4;
- (id)namespaceNameForNamespaceType:(unsigned __int16)a3;
- (void)setTrialClient:(id)a3;
@end

@implementation PGTrialSession

- (void).cxx_destruct
{
}

- (void)setTrialClient:(id)a3
{
}

- (TRIClient)trialClient
{
  return self->_trialClient;
}

- (id)namespaceNameForNamespaceType:(unsigned __int16)a3
{
  if ((a3 - 1) > 4) {
    return @"UNKNOWN";
  }
  else {
    return off_1E68E98C8[(unsigned __int16)(a3 - 1)];
  }
}

- (id)arrayForFactorName:(id)a3 withNamespaceType:(unsigned __int16)a4
{
  uint64_t v4 = a4;
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v6 = a3;
  v7 = [(PGTrialSession *)self levelForFactorName:v6 withNamespaceType:v4];
  v8 = [v7 fileValue];
  if ([v8 hasPath])
  {
    v9 = [v8 path];
    uint64_t v10 = [objc_alloc(MEMORY[0x1E4F1C978]) initWithContentsOfFile:v9];
    if (v10)
    {
      v11 = (void *)v10;
      goto LABEL_10;
    }
    v13 = +[PGLogging sharedLogging];
    v14 = [v13 loggingConnection];

    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      int v16 = 138412290;
      v17 = v9;
      _os_log_impl(&dword_1D1805000, v14, OS_LOG_TYPE_INFO, "[TrialSession] failed to load array at filepath %@", (uint8_t *)&v16, 0xCu);
    }
  }
  else
  {
    v12 = +[PGLogging sharedLogging];
    v9 = [v12 loggingConnection];

    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      int v16 = 138412290;
      v17 = v6;
      _os_log_impl(&dword_1D1805000, v9, OS_LOG_TYPE_INFO, "[TrialSession] levelFile.hasPath evaluated to false for factor name %@", (uint8_t *)&v16, 0xCu);
    }
  }
  v11 = 0;
LABEL_10:

  return v11;
}

- (id)dictionaryForFactorName:(id)a3 withNamespaceType:(unsigned __int16)a4
{
  uint64_t v4 = a4;
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v6 = a3;
  v7 = [(PGTrialSession *)self levelForFactorName:v6 withNamespaceType:v4];
  v8 = [v7 fileValue];
  if ([v8 hasPath])
  {
    v9 = [v8 path];
    uint64_t v10 = [objc_alloc(MEMORY[0x1E4F1C9E8]) initWithContentsOfFile:v9];
    if (v10)
    {
      v11 = (void *)v10;
      goto LABEL_10;
    }
    v13 = +[PGLogging sharedLogging];
    v14 = [v13 loggingConnection];

    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      int v16 = 138412290;
      v17 = v9;
      _os_log_impl(&dword_1D1805000, v14, OS_LOG_TYPE_INFO, "[TrialSession] failed to load dictionary at filepath %@", (uint8_t *)&v16, 0xCu);
    }
  }
  else
  {
    v12 = +[PGLogging sharedLogging];
    v9 = [v12 loggingConnection];

    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      int v16 = 138412290;
      v17 = v6;
      _os_log_impl(&dword_1D1805000, v9, OS_LOG_TYPE_INFO, "[TrialSession] levelFile.hasPath evaluated to false for factor name %@", (uint8_t *)&v16, 0xCu);
    }
  }
  v11 = 0;
LABEL_10:

  return v11;
}

- (id)levelForFactorName:(id)a3 withNamespaceType:(unsigned __int16)a4
{
  uint64_t v4 = a4;
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v6 = (__CFString *)a3;
  v7 = [(PGTrialSession *)self namespaceNameForNamespaceType:v4];
  if (v7)
  {
    v8 = [(TRIClient *)self->_trialClient levelForFactor:v6 withNamespaceName:v7];
    if (v8) {
      goto LABEL_12;
    }
    v9 = +[PGLogging sharedLogging];
    uint64_t v10 = [v9 loggingConnection];

    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      int v15 = 138412290;
      int v16 = v6;
      v11 = "[TrialSession] nil level found for factor name %@";
LABEL_10:
      _os_log_impl(&dword_1D1805000, v10, OS_LOG_TYPE_INFO, v11, (uint8_t *)&v15, 0xCu);
    }
  }
  else
  {
    v12 = +[PGLogging sharedLogging];
    uint64_t v10 = [v12 loggingConnection];

    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      if (v4 > 5) {
        v13 = @"unknown";
      }
      else {
        v13 = off_1E68E9898[v4];
      }
      int v15 = 138412290;
      int v16 = v13;
      v11 = "[TrialSession] no namespaceName found for namespaceType %@";
      goto LABEL_10;
    }
  }

  v8 = 0;
LABEL_12:

  return v8;
}

- (PGTrialSession)init
{
  v6.receiver = self;
  v6.super_class = (Class)PGTrialSession;
  v2 = [(PGTrialSession *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4FB0098] clientWithIdentifier:235];
    trialClient = v2->_trialClient;
    v2->_trialClient = (TRIClient *)v3;
  }
  return v2;
}

@end
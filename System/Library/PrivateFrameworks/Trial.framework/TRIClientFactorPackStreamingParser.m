@interface TRIClientFactorPackStreamingParser
- (BOOL)hasFactorPackId;
- (BOOL)hasSelectedNamespace;
- (NSData)data;
- (NSString)factorPackId;
- (TRIClientFactorPackStreamingParser)initWithData:(id)a3 error:(id *)a4;
- (TRIClientSelectedNamespace)selectedNamespace;
- (id)downloadedFactorsWithPaths:(id)a3;
- (unsigned)_fieldTagForFieldName:(id)a3;
- (void)_parseWithHandleFactorLevel:(id)a3;
@end

@implementation TRIClientFactorPackStreamingParser

- (BOOL)hasFactorPackId
{
  return self->_factorPackId != 0;
}

- (NSString)factorPackId
{
  if (self->_factorPackId) {
    return self->_factorPackId;
  }
  else {
    return (NSString *)&stru_1EEFB6D68;
  }
}

- (BOOL)hasSelectedNamespace
{
  return self->_selectedNamespace != 0;
}

- (TRIClientSelectedNamespace)selectedNamespace
{
  selectedNamespace = self->_selectedNamespace;
  if (selectedNamespace) {
    v3 = (void *)[(TRIClientSelectedNamespace *)selectedNamespace copy];
  }
  else {
    v3 = objc_opt_new();
  }
  return (TRIClientSelectedNamespace *)v3;
}

- (TRIClientFactorPackStreamingParser)initWithData:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = (void *)MEMORY[0x19F3AD060]();
  v12.receiver = self;
  v12.super_class = (Class)TRIClientFactorPackStreamingParser;
  v8 = [(TRIClientFactorPackStreamingParser *)&v12 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_data, a3);
    [(TRIClientFactorPackStreamingParser *)v9 _parseWithHandleFactorLevel:0];
  }
  v10 = v9;

  return v10;
}

- (unsigned)_fieldTagForFieldName:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = (void *)MEMORY[0x19F3AD060]();
  v5 = [MEMORY[0x1E4FB0530] descriptor];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v6 = [v5 fields];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v19;
LABEL_3:
    uint64_t v10 = 0;
    while (1)
    {
      if (*(void *)v19 != v9) {
        objc_enumerationMutation(v6);
      }
      v11 = [*(id *)(*((void *)&v18 + 1) + 8 * v10) name];
      char v12 = [v3 isEqualToString:v11];

      if (v12) {
        break;
      }
      if (v8 == ++v10)
      {
        uint64_t v8 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
        if (v8) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
    unsigned int v14 = TRIPBFieldTag();

    if (v14 == -1) {
      goto LABEL_10;
    }
  }
  else
  {
LABEL_9:

LABEL_10:
    v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"TRIClientFactorPackStreaming.m", 91, @"Failed to determine field tag for \"%@\"", v3 object file lineNumber description];

    unsigned int v14 = -1;
  }

  return v14;
}

- (void)_parseWithHandleFactorLevel:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  v4 = (void (**)(id, void *, uint8_t *))a3;
  context = (void *)MEMORY[0x19F3AD060]();
  uint64_t v5 = [(TRIClientFactorPackStreamingParser *)self _fieldTagForFieldName:@"factorPackId"];
  uint64_t v6 = [(TRIClientFactorPackStreamingParser *)self _fieldTagForFieldName:@"selectedNamespace"];
  uint64_t v7 = [(TRIClientFactorPackStreamingParser *)self _fieldTagForFieldName:@"factorLevelArray"];
  uint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4FB05C0]) initWithData:self->_data];
  uint64_t v9 = [v8 readTag];
  if (v9)
  {
    uint64_t v11 = v9;
    *(void *)&long long v10 = 67109120;
    long long v24 = v10;
    do
    {
      if (v11 == v5)
      {
        if (self->_factorPackId)
        {
          char v12 = v8;
          uint64_t v13 = v5;
LABEL_21:
          objc_msgSend(v12, "skipField:", v13, v24);
          goto LABEL_22;
        }
        v17 = (void *)MEMORY[0x19F3AD060]();
        long long v18 = [v8 readString];
        factorPackId = self->_factorPackId;
        self->_factorPackId = v18;
      }
      else
      {
        if (v11 != v6)
        {
          if (v11 == v7)
          {
            if (v4)
            {
              unsigned int v14 = (void *)MEMORY[0x19F3AD060]();
              v15 = objc_opt_new();
              [v8 readMessage:v15 extensionRegistry:0];
              buf[0] = 0;
              v4[2](v4, v15, buf);
              int v16 = buf[0];

              if (v16) {
                break;
              }
              goto LABEL_22;
            }
            char v12 = v8;
            uint64_t v13 = v7;
          }
          else
          {
            if (!self->_emittedUnrecognizedFieldWarning)
            {
              long long v20 = TRILogCategory_ClientFramework();
              if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = v24;
                int v27 = v11;
                _os_log_impl(&dword_19D909000, v20, OS_LOG_TYPE_INFO, "TRIClientFactorPackStreamingParser: skipping unrecognized tag: %u", buf, 8u);
              }

              self->_emittedUnrecognizedFieldWarning = 1;
            }
            char v12 = v8;
            uint64_t v13 = v11;
          }
          goto LABEL_21;
        }
        if (self->_selectedNamespace)
        {
          char v12 = v8;
          uint64_t v13 = v6;
          goto LABEL_21;
        }
        long long v21 = (void *)MEMORY[0x19F3AD060]();
        v22 = (TRIClientSelectedNamespace *)objc_opt_new();
        selectedNamespace = self->_selectedNamespace;
        self->_selectedNamespace = v22;

        [v8 readMessage:self->_selectedNamespace extensionRegistry:0];
      }
LABEL_22:
      uint64_t v11 = objc_msgSend(v8, "readTag", v24);
    }
    while (v11);
  }
}

- (id)downloadedFactorsWithPaths:(id)a3
{
  v4 = [a3 treatmentsDir];
  uint64_t v5 = [(TRIClientFactorPackStreamingParser *)self selectedNamespace];
  uint64_t v6 = [v5 name];

  uint64_t v7 = [(TRIClientFactorPackStreamingParser *)self factorPackId];
  uint64_t v8 = objc_opt_new();
  uint64_t v15 = MEMORY[0x1E4F143A8];
  uint64_t v16 = 3221225472;
  v17 = __65__TRIClientFactorPackStreamingParser_downloadedFactorsWithPaths___block_invoke;
  long long v18 = &unk_1E596A360;
  id v19 = v8;
  id v20 = v4;
  id v21 = v6;
  id v22 = v7;
  id v9 = v7;
  id v10 = v6;
  id v11 = v4;
  id v12 = v8;
  [(TRIClientFactorPackStreamingParser *)self enumerateFactorLevelsWithBlock:&v15];
  uint64_t v13 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithSet:", v12, v15, v16, v17, v18);

  return v13;
}

void __65__TRIClientFactorPackStreamingParser_downloadedFactorsWithPaths___block_invoke(void *a1, void *a2)
{
  id v27 = a2;
  if ([v27 hasFactor])
  {
    id v3 = [v27 factor];
    int v4 = [v3 hasName];

    if (v4)
    {
      uint64_t v5 = [v27 factor];
      uint64_t v6 = [v5 name];

      uint64_t v7 = [v27 level];
      uint64_t v8 = [v7 fileOrDirectoryLevelWithIsDir:0];

      if ([v8 hasPath]
        && ([MEMORY[0x1E4F28CB8] defaultManager],
            id v9 = objc_claimAutoreleasedReturnValue(),
            [v8 path],
            id v10 = objc_claimAutoreleasedReturnValue(),
            int v11 = [v9 fileExistsAtPath:v10],
            v10,
            v9,
            v11))
      {
        id v12 = (void *)a1[4];
        uint64_t v13 = [v27 factor];
        unsigned int v14 = [v13 name];
        [v12 addObject:v14];
      }
      else
      {
        uint64_t v15 = [v27 level];
        int v16 = [v15 levelOneOfCase];

        if (v16 != 104)
        {
LABEL_11:

          goto LABEL_12;
        }
        v17 = (void *)MEMORY[0x19F3AD060]();
        long long v18 = (void *)a1[5];
        id v19 = [NSString alloc];
        uint64_t v20 = a1[6];
        uint64_t v21 = a1[7];
        id v22 = [v6 triFilenameForFactorName];
        uint64_t v23 = (void *)[v19 initWithFormat:@"%@/factorPacks/%@/maRefs/%@", v20, v21, v22];
        uint64_t v13 = [v18 stringByAppendingPathComponent:v23];

        long long v24 = [MEMORY[0x1E4F28CB8] defaultManager];
        LODWORD(v23) = [v24 fileExistsAtPath:v13];

        if (!v23)
        {
LABEL_10:

          goto LABEL_11;
        }
        v25 = (void *)a1[4];
        unsigned int v14 = [v27 factor];
        v26 = [v14 name];
        [v25 addObject:v26];
      }
      goto LABEL_10;
    }
  }
LABEL_12:
}

- (NSData)data
{
  return self->_data;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_selectedNamespace, 0);
  objc_storeStrong((id *)&self->_factorPackId, 0);
}

@end
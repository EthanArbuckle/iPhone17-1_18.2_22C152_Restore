@interface WBSOnDeviceSearchSuggestionsModel
- (BOOL)_readNextChild:(_WBSSearchSuggestionCandidate *)a3;
- (WBSOnDeviceSearchSuggestionsModel)initWithModelFileAtPath:(id)a3;
- (id)_readNextNumberOfBytesAsString:(unsigned int)a3 success:(BOOL *)a4;
- (unsigned)_readMaxScoreAsRootAtAddress:(unsigned int)a3 withLeafCandidate:(_WBSSearchSuggestionCandidate *)a4 success:(BOOL *)a5;
- (unsigned)_readNextNumberOfBytesAsInt:(unsigned int)a3 success:(BOOL *)a4;
- (unsigned)addressSize;
- (unsigned)scoreSize;
- (vector<_WBSSearchSuggestionCandidate,)readTreeNodeWithCandidate:()vector<_WBSSearchSuggestionCandidate;
@end

@implementation WBSOnDeviceSearchSuggestionsModel

- (WBSOnDeviceSearchSuggestionsModel)initWithModelFileAtPath:(id)a3
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v40.receiver = self;
  v40.super_class = (Class)WBSOnDeviceSearchSuggestionsModel;
  v5 = [(WBSOnDeviceSearchSuggestionsModel *)&v40 init];
  if (!v5)
  {
LABEL_15:
    v23 = 0;
    goto LABEL_16;
  }
  uint64_t v6 = [MEMORY[0x1E4F28CB0] fileHandleForReadingAtPath:v4];
  modelFileHandle = v5->_modelFileHandle;
  v5->_modelFileHandle = (NSFileHandle *)v6;

  v8 = v5->_modelFileHandle;
  if (!v8)
  {
    v24 = WBS_LOG_CHANNEL_PREFIXOfflineSearchSuggestions();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      -[WBSOnDeviceSearchSuggestionsModel initWithModelFileAtPath:]((uint64_t)v4, v24, v25, v26, v27, v28, v29, v30);
    }
    goto LABEL_15;
  }
  id v39 = 0;
  v9 = [(NSFileHandle *)v8 readDataUpToLength:2 error:&v39];
  id v10 = v39;
  if (v10 || [v9 length] != 2)
  {
    v21 = (id)WBS_LOG_CHANNEL_PREFIXOfflineSearchSuggestions();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      v22 = objc_msgSend(v10, "safari_privacyPreservingError");
      -[WBSOnDeviceSearchSuggestionsModel initWithModelFileAtPath:].cold.4((uint64_t)v4, v22, buf, v21);
    }
  }
  else
  {
    v11 = (unsigned __int8 *)[v9 bytes];
    unsigned int v12 = *v11;
    v5->_addressSize = v12;
    unsigned int v13 = v11[1];
    v5->_scoreSize = v13;
    if (v12 - 5 > 0xFFFFFFFB)
    {
      if (v13 - 5 > 0xFFFFFFFB)
      {
        v23 = v5;
        goto LABEL_12;
      }
      v32 = WBS_LOG_CHANNEL_PREFIXOfflineSearchSuggestions();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
        -[WBSOnDeviceSearchSuggestionsModel initWithModelFileAtPath:]((uint64_t)v4, v32, v33, v34, v35, v36, v37, v38);
      }
    }
    else
    {
      v14 = WBS_LOG_CHANNEL_PREFIXOfflineSearchSuggestions();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        -[WBSOnDeviceSearchSuggestionsModel initWithModelFileAtPath:]((uint64_t)v4, v14, v15, v16, v17, v18, v19, v20);
      }
    }
  }
  v23 = 0;
LABEL_12:

LABEL_16:
  return v23;
}

- (vector<_WBSSearchSuggestionCandidate,)readTreeNodeWithCandidate:()vector<_WBSSearchSuggestionCandidate
{
  retstr->var0 = 0;
  retstr->var1 = 0;
  retstr->var2.var0 = 0;
  if (!a4->var2)
  {
    uint64_t v6 = self;
    char v21 = 0;
    BOOL v19 = 0;
    uint64_t v18 = 0;
    uint64_t v20 = &stru_1EFBE3CF8;
    int v7 = unk_1EFC6FE28(self, "_readMaxScoreAsRootAtAddress:withLeafCandidate:success:", a4->var1, &v18, &v21);
    if (v21)
    {
      int v8 = v7;
      if (!v19) {
        goto LABEL_14;
      }
      objc_storeStrong((id *)&v20, a4->var3);
      var1 = retstr->var1;
      if (var1 >= retstr->var2.var0)
      {
        v11 = (_WBSSearchSuggestionCandidate *)std::vector<_WBSSearchSuggestionCandidate>::__push_back_slow_path<_WBSSearchSuggestionCandidate const&>((unint64_t *)retstr, &v18);
      }
      else
      {
        if (!var1)
        {
LABEL_18:
          __break(1u);
          return self;
        }
        uint64_t v10 = v18;
        var1->var2 = v19;
        *(void *)&var1->var0 = v10;
        var1->var3 = v20;
        v11 = var1 + 1;
      }
      retstr->var1 = v11;
LABEL_14:
      while (1)
      {
        BOOL v16 = 0;
        uint64_t v15 = 0;
        uint64_t v17 = &stru_1EFBE3CF8;
        uint64_t v17 = (__CFString *)a4->var3;

        LODWORD(v15) = v8;
        self = (vector<_WBSSearchSuggestionCandidate, std::allocator<_WBSSearchSuggestionCandidate>> *)unk_1EFC6FE30(v6, "_readNextChild:", &v15);
        if ((self & 1) == 0) {
          break;
        }
        unsigned int v12 = retstr->var1;
        if (v12 >= retstr->var2.var0)
        {
          v14 = (_WBSSearchSuggestionCandidate *)std::vector<_WBSSearchSuggestionCandidate>::__push_back_slow_path<_WBSSearchSuggestionCandidate const&>((unint64_t *)retstr, &v15);
        }
        else
        {
          if (!v12) {
            goto LABEL_18;
          }
          uint64_t v13 = v15;
          v12->var2 = v16;
          *(void *)&v12->var0 = v13;
          v12->var3 = v17;
          v14 = v12 + 1;
        }
        retstr->var1 = v14;
      }
    }
  }
  return self;
}

- (BOOL)_readNextChild:(_WBSSearchSuggestionCandidate *)a3
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  char v46 = 0;
  uint64_t v5 = [(WBSOnDeviceSearchSuggestionsModel *)self _readNextNumberOfBytesAsInt:1 success:&v46];
  if (v46) {
    BOOL v6 = v5 == 0;
  }
  else {
    BOOL v6 = 1;
  }
  if (!v6)
  {
    uint64_t v8 = [(WBSOnDeviceSearchSuggestionsModel *)self _readNextNumberOfBytesAsString:v5 success:&v46];
    v9 = (void *)v8;
    if (!v46)
    {
      BOOL v7 = 0;
LABEL_31:

      return v7;
    }
    uint64_t v10 = [a3->var3 stringByAppendingString:v8];
    id var3 = a3->var3;
    a3->id var3 = v10;

    modelFileHandle = self->_modelFileHandle;
    id v45 = 0;
    uint64_t v13 = [(NSFileHandle *)modelFileHandle readDataUpToLength:1 error:&v45];
    id v14 = v45;
    if ([v13 length] != 1 || v14)
    {
      v22 = (id)WBS_LOG_CHANNEL_PREFIXOfflineSearchSuggestions();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v14, "safari_privacyPreservingDescription");
        objc_claimAutoreleasedReturnValue();
        -[WBSOnDeviceSearchSuggestionsModel _readNextChild:]();
      }
    }
    else
    {
      unsigned __int8 v15 = *(unsigned char *)[v13 bytes];
      uint64_t v16 = 20;
      if ((v15 & 1) == 0) {
        uint64_t v16 = 16;
      }
      size_t v17 = *(unsigned int *)((char *)&self->super.isa + v16);
      if ((v17 - 2) < 4)
      {
        uint64_t v18 = self->_modelFileHandle;
        id v44 = 0;
        BOOL v19 = [(NSFileHandle *)v18 readDataUpToLength:(v17 - 1) error:&v44];
        id v14 = v44;
        if ([v19 length] == v17 - 1 && v14 == 0)
        {
          v32 = (const void *)[v19 bytes];
          uint64_t v33 = (unsigned __int8 *)malloc_type_malloc(v17, 0x3FDF8503uLL);
          uint64_t v34 = v33;
          if (v33)
          {
            *uint64_t v33 = v15;
            memcpy(v33 + 1, v32, (v17 - 1));
            unsigned int v35 = byteArrayToInteger(v34, v17) >> 1;
            free(v34);
            if (v15)
            {
              a3->var1 = v35;
              a3->var2 = 0;
              BOOL v7 = 1;
            }
            else
            {
              a3->var0 = v35;
              BOOL v7 = 1;
              a3->var2 = 1;
            }
            goto LABEL_21;
          }
          uint64_t v36 = WBS_LOG_CHANNEL_PREFIXOfflineSearchSuggestions();
          if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
            -[WBSOnDeviceSearchSuggestionsModel _readNextChild:](v36, v37, v38, v39, v40, v41, v42, v43);
          }
        }
        else
        {
          char v21 = (id)WBS_LOG_CHANNEL_PREFIXOfflineSearchSuggestions();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(v14, "safari_privacyPreservingDescription");
            objc_claimAutoreleasedReturnValue();
            -[WBSOnDeviceSearchSuggestionsModel _readNextChild:]();
          }
        }
        BOOL v7 = 0;
LABEL_21:

LABEL_30:
        goto LABEL_31;
      }
      v23 = WBS_LOG_CHANNEL_PREFIXOfflineSearchSuggestions();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
        -[WBSOnDeviceSearchSuggestionsModel _readNextChild:].cold.4(v23, v24, v25, v26, v27, v28, v29, v30);
      }
      id v14 = 0;
    }
    BOOL v7 = 0;
    goto LABEL_30;
  }
  return 0;
}

- (unsigned)_readMaxScoreAsRootAtAddress:(unsigned int)a3 withLeafCandidate:(_WBSSearchSuggestionCandidate *)a4 success:(BOOL *)a5
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __92__WBSOnDeviceSearchSuggestionsModel__readMaxScoreAsRootAtAddress_withLeafCandidate_success___block_invoke;
  v18[3] = &__block_descriptor_40_e8_v12__0B8l;
  v18[4] = a5;
  uint64_t v8 = (void (**)(void, void))MEMORY[0x1AD0C4F80](v18, a2);
  modelFileHandle = self->_modelFileHandle;
  id v17 = 0;
  [(NSFileHandle *)modelFileHandle seekToOffset:a3 error:&v17];
  id v10 = v17;
  if (v10)
  {
    v11 = (id)WBS_LOG_CHANNEL_PREFIXOfflineSearchSuggestions();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v10, "safari_privacyPreservingDescription");
      objc_claimAutoreleasedReturnValue();
      -[WBSOnDeviceSearchSuggestionsModel _readMaxScoreAsRootAtAddress:withLeafCandidate:success:]();
    }

    v8[2](v8, 0);
    goto LABEL_5;
  }
  v19[0] = 0;
  unsigned int v14 = [(WBSOnDeviceSearchSuggestionsModel *)self _readNextNumberOfBytesAsInt:self->_scoreSize success:v19];
  if (v19[0])
  {
    unsigned int v15 = v14;
    if ((v14 & 1) == 0)
    {
LABEL_11:
      v8[2](v8, 1);
      unsigned int v12 = v15 >> 1;
      goto LABEL_6;
    }
    unsigned int v16 = [(WBSOnDeviceSearchSuggestionsModel *)self _readNextNumberOfBytesAsInt:self->_scoreSize success:v19];
    if (v19[0])
    {
      a4->var2 = 1;
      a4->var0 = v16;
      goto LABEL_11;
    }
  }
  v8[2](v8, 0);
LABEL_5:
  unsigned int v12 = -1;
LABEL_6:

  return v12;
}

uint64_t __92__WBSOnDeviceSearchSuggestionsModel__readMaxScoreAsRootAtAddress_withLeafCandidate_success___block_invoke(uint64_t result, char a2)
{
  v2 = *(unsigned char **)(result + 32);
  if (v2) {
    unsigned char *v2 = a2;
  }
  return result;
}

- (unsigned)_readNextNumberOfBytesAsInt:(unsigned int)a3 success:(BOOL *)a4
{
  v15[8] = *MEMORY[0x1E4F143B8];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __73__WBSOnDeviceSearchSuggestionsModel__readNextNumberOfBytesAsInt_success___block_invoke;
  v15[3] = &__block_descriptor_40_e8_v12__0B8l;
  v15[4] = a4;
  uint64_t v6 = MEMORY[0x1AD0C4F80](v15, a2);
  BOOL v7 = (void (**)(void, void))v6;
  if (a3)
  {
    modelFileHandle = self->_modelFileHandle;
    id v14 = 0;
    v9 = [(NSFileHandle *)modelFileHandle readDataUpToLength:a3 error:&v14];
    id v10 = v14;
    if ([v9 length] == a3 && v10 == 0)
    {
      v7[2](v7, 1);
      a3 = byteArrayToInteger((unsigned __int8 *)[v9 bytes], a3);
    }
    else
    {
      unsigned int v12 = (id)WBS_LOG_CHANNEL_PREFIXOfflineSearchSuggestions();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v10, "safari_privacyPreservingDescription");
        objc_claimAutoreleasedReturnValue();
        -[WBSOnDeviceSearchSuggestionsModel _readNextNumberOfBytesAsInt:success:]();
      }

      v7[2](v7, 0);
      a3 = 0;
    }
  }
  else
  {
    (*(void (**)(uint64_t, void))(v6 + 16))(v6, 0);
  }

  return a3;
}

uint64_t __73__WBSOnDeviceSearchSuggestionsModel__readNextNumberOfBytesAsInt_success___block_invoke(uint64_t result, char a2)
{
  v2 = *(unsigned char **)(result + 32);
  if (v2) {
    unsigned char *v2 = a2;
  }
  return result;
}

- (id)_readNextNumberOfBytesAsString:(unsigned int)a3 success:(BOOL *)a4
{
  v18[8] = *MEMORY[0x1E4F143B8];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __76__WBSOnDeviceSearchSuggestionsModel__readNextNumberOfBytesAsString_success___block_invoke;
  v18[3] = &__block_descriptor_40_e8_v12__0B8l;
  v18[4] = a4;
  uint64_t v6 = MEMORY[0x1AD0C4F80](v18, a2);
  BOOL v7 = (void (**)(void, void))v6;
  if (a3)
  {
    modelFileHandle = self->_modelFileHandle;
    uint64_t v9 = a3;
    id v17 = 0;
    id v10 = [(NSFileHandle *)modelFileHandle readDataUpToLength:a3 error:&v17];
    id v11 = v17;
    if ([v10 length] == v9 && v11 == 0)
    {
      v7[2](v7, 1);
      uint64_t v15 = [v10 bytes];
      id v14 = (void *)[[NSString alloc] initWithBytes:v15 length:v9 encoding:4];
    }
    else
    {
      uint64_t v13 = (id)WBS_LOG_CHANNEL_PREFIXOfflineSearchSuggestions();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v11, "safari_privacyPreservingDescription");
        objc_claimAutoreleasedReturnValue();
        -[WBSOnDeviceSearchSuggestionsModel _readNextNumberOfBytesAsString:success:]();
      }

      v7[2](v7, 0);
      id v14 = 0;
    }
  }
  else
  {
    (*(void (**)(uint64_t, void))(v6 + 16))(v6, 0);
    id v14 = 0;
  }

  return v14;
}

uint64_t __76__WBSOnDeviceSearchSuggestionsModel__readNextNumberOfBytesAsString_success___block_invoke(uint64_t result, char a2)
{
  v2 = *(unsigned char **)(result + 32);
  if (v2) {
    unsigned char *v2 = a2;
  }
  return result;
}

- (unsigned)scoreSize
{
  return self->_scoreSize;
}

- (unsigned)addressSize
{
  return self->_addressSize;
}

- (void).cxx_destruct
{
}

- (void)initWithModelFileAtPath:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithModelFileAtPath:(uint64_t)a3 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithModelFileAtPath:(uint64_t)a3 .cold.3(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithModelFileAtPath:(uint8_t *)buf .cold.4(uint64_t a1, void *a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138543618;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2114;
  *(void *)(buf + 14) = a2;
  _os_log_error_impl(&dword_1A6B5F000, log, OS_LOG_TYPE_ERROR, "Unable to read model header values for file at path: %{public}@ with error: %{public}@", buf, 0x16u);
}

- (void)_readNextChild:.cold.1()
{
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_2(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0_3(&dword_1A6B5F000, v3, v4, "Failed to read child node: %{public}@", v5);
}

- (void)_readNextChild:(uint64_t)a3 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_readNextChild:(uint64_t)a3 .cold.4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_readMaxScoreAsRootAtAddress:withLeafCandidate:success:.cold.1()
{
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_2(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0_3(&dword_1A6B5F000, v3, v4, "Failed to seek to address in file: %{public}@", v5);
}

- (void)_readNextNumberOfBytesAsInt:success:.cold.1()
{
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_2(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0_3(&dword_1A6B5F000, v3, v4, "Failed to read in bytes as integer %{public}@", v5);
}

- (void)_readNextNumberOfBytesAsString:success:.cold.1()
{
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_2(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0_3(&dword_1A6B5F000, v3, v4, "Failed to bytes as strings: %{public}@", v5);
}

@end
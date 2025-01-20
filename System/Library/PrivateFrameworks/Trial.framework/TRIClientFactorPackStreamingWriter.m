@interface TRIClientFactorPackStreamingWriter
+ (BOOL)copySourceFactorPack:(id)a3 toDestPath:(id)a4 error:(id *)a5 modifyFactorLevel:(id)a6;
- (BOOL)_streamExecWithError:(id *)a3 block:(id)a4;
- (BOOL)closeWithError:(id *)a3;
- (TRIClientFactorPackStreamingWriter)initWithPath:(id)a3;
- (unsigned)_fieldNumberForFieldName:(id)a3;
- (void)appendFactorLevel:(id)a3;
- (void)writeFactorPackId:(id)a3;
- (void)writeSelectedNamespace:(id)a3;
@end

@implementation TRIClientFactorPackStreamingWriter

- (TRIClientFactorPackStreamingWriter)initWithPath:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)TRIClientFactorPackStreamingWriter;
  v5 = [(TRIClientFactorPackStreamingWriter *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CAA8] outputStreamToFileAtPath:v4 append:0];
    underlying = v5->_underlying;
    v5->_underlying = (NSOutputStream *)v6;

    uint64_t v8 = [objc_alloc(MEMORY[0x1E4FB05C8]) initWithOutputStream:v5->_underlying];
    stream = v5->_stream;
    v5->_stream = (TRIPBCodedOutputStream *)v8;
  }
  return v5;
}

- (unsigned)_fieldNumberForFieldName:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = (void *)MEMORY[0x19F3AD060]();
  v5 = [MEMORY[0x1E4FB0530] descriptor];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v6 = [v5 fields];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v20;
LABEL_3:
    uint64_t v10 = 0;
    while (1)
    {
      if (*(void *)v20 != v9) {
        objc_enumerationMutation(v6);
      }
      objc_super v11 = *(void **)(*((void *)&v19 + 1) + 8 * v10);
      v12 = [v11 name];
      char v13 = [v3 isEqualToString:v12];

      if (v13) {
        break;
      }
      if (v8 == ++v10)
      {
        uint64_t v8 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
        if (v8) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
    unsigned int v15 = [v11 number];

    if (v15 == -1) {
      goto LABEL_10;
    }
  }
  else
  {
LABEL_9:

LABEL_10:
    v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"TRIClientFactorPackStreaming.m", 209, @"Failed to determine field number for \"%@\"", v3 object file lineNumber description];

    unsigned int v15 = -1;
  }

  return v15;
}

- (BOOL)_streamExecWithError:(id *)a3 block:(id)a4
{
  uint64_t v7 = (void (**)(id, TRIPBCodedOutputStream *))a4;
  if (!self->_stream)
  {
    uint64_t v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2 object:self file:@"TRIClientFactorPackStreaming.m" lineNumber:216 description:@"writing a field to a closed stream"];
  }
  firstError = self->_firstError;
  if (firstError)
  {
    if (a3)
    {
      objc_storeStrong(a3, firstError);
      LOBYTE(a3) = 0;
    }
  }
  else
  {
    v7[2](v7, self->_stream);
    LOBYTE(a3) = 1;
  }

  return (char)a3;
}

- (void)writeFactorPackId:(id)a3
{
  id v5 = a3;
  if (self->_hasFactorPackId)
  {
    uint64_t v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2 object:self file:@"TRIClientFactorPackStreaming.m" lineNumber:243 description:@"writeFactorPackId: must be called no more than once"];
  }
  self->_hasFactorPackId = 1;
  if (!self->_firstError)
  {
    unsigned int v6 = [(TRIClientFactorPackStreamingWriter *)self _fieldNumberForFieldName:@"factorPackId"];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __56__TRIClientFactorPackStreamingWriter_writeFactorPackId___block_invoke;
    v8[3] = &unk_1E596A388;
    unsigned int v10 = v6;
    id v9 = v5;
    [(TRIClientFactorPackStreamingWriter *)self _streamExecWithError:0 block:v8];
  }
}

uint64_t __56__TRIClientFactorPackStreamingWriter_writeFactorPackId___block_invoke(uint64_t a1, void *a2)
{
  return [a2 writeString:*(unsigned int *)(a1 + 40) value:*(void *)(a1 + 32)];
}

- (void)writeSelectedNamespace:(id)a3
{
  id v5 = a3;
  if (self->_hasSelectedNamespace)
  {
    uint64_t v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2 object:self file:@"TRIClientFactorPackStreaming.m" lineNumber:255 description:@"writeSelectedNamespace: must be called no more than once"];
  }
  self->_hasSelectedNamespace = 1;
  if (!self->_firstError)
  {
    unsigned int v6 = [(TRIClientFactorPackStreamingWriter *)self _fieldNumberForFieldName:@"selectedNamespace"];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __61__TRIClientFactorPackStreamingWriter_writeSelectedNamespace___block_invoke;
    v8[3] = &unk_1E596A388;
    unsigned int v10 = v6;
    id v9 = v5;
    [(TRIClientFactorPackStreamingWriter *)self _streamExecWithError:0 block:v8];
  }
}

uint64_t __61__TRIClientFactorPackStreamingWriter_writeSelectedNamespace___block_invoke(uint64_t a1, void *a2)
{
  return [a2 writeMessage:*(unsigned int *)(a1 + 40) value:*(void *)(a1 + 32)];
}

- (void)appendFactorLevel:(id)a3
{
  id v4 = a3;
  if (!self->_firstError)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __56__TRIClientFactorPackStreamingWriter_appendFactorLevel___block_invoke;
    block[3] = &unk_1E596A0B0;
    block[4] = self;
    if (qword_1EB3B77C0 != -1) {
      dispatch_once(&qword_1EB3B77C0, block);
    }
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __56__TRIClientFactorPackStreamingWriter_appendFactorLevel___block_invoke_2;
    v5[3] = &unk_1E596A388;
    int v7 = _MergedGlobals_6;
    id v6 = v4;
    [(TRIClientFactorPackStreamingWriter *)self _streamExecWithError:0 block:v5];
  }
}

void __56__TRIClientFactorPackStreamingWriter_appendFactorLevel___block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x19F3AD060]();
  _MergedGlobals_6 = [*(id *)(a1 + 32) _fieldNumberForFieldName:@"factorLevelArray"];
}

uint64_t __56__TRIClientFactorPackStreamingWriter_appendFactorLevel___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 writeMessage:*(unsigned int *)(a1 + 40) value:*(void *)(a1 + 32)];
}

- (BOOL)closeWithError:(id *)a3
{
  [(TRIPBCodedOutputStream *)self->_stream flush];
  stream = self->_stream;
  self->_stream = 0;

  if (a3) {
    objc_storeStrong(a3, self->_firstError);
  }
  return self->_firstError == 0;
}

+ (BOOL)copySourceFactorPack:(id)a3 toDestPath:(id)a4 error:(id *)a5 modifyFactorLevel:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a6;
  v12 = [[TRIClientFactorPackStreamingWriter alloc] initWithPath:v10];
  if ([v9 hasFactorPackId])
  {
    char v13 = [v9 factorPackId];
    [(TRIClientFactorPackStreamingWriter *)v12 writeFactorPackId:v13];
  }
  if ([v9 hasSelectedNamespace])
  {
    v14 = [v9 selectedNamespace];
    [(TRIClientFactorPackStreamingWriter *)v12 writeSelectedNamespace:v14];
  }
  uint64_t v26 = 0;
  v27 = &v26;
  uint64_t v28 = 0x2020000000;
  char v29 = 0;
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __94__TRIClientFactorPackStreamingWriter_copySourceFactorPack_toDestPath_error_modifyFactorLevel___block_invoke;
  v22[3] = &unk_1E596A3B0;
  id v15 = v11;
  id v24 = v15;
  v25 = &v26;
  v16 = v12;
  v23 = v16;
  [v9 enumerateFactorLevelsWithBlock:v22];
  BOOL v17 = [(TRIClientFactorPackStreamingWriter *)v16 closeWithError:a5];
  if (*((unsigned char *)v27 + 24))
  {
    if (a5)
    {
      v18 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"TRIGeneralErrorDomain" code:1 userInfo:0];
      id v19 = *a5;
      *a5 = v18;
    }
    BOOL v20 = 0;
  }
  else
  {
    BOOL v20 = v17;
  }

  _Block_object_dispose(&v26, 8);
  return v20;
}

uint64_t __94__TRIClientFactorPackStreamingWriter_copySourceFactorPack_toDestPath_error_modifyFactorLevel___block_invoke(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  uint64_t v5 = (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  uint64_t v6 = v5;
  if (v5)
  {
    uint64_t v8 = v5;
    uint64_t v5 = [*(id *)(a1 + 32) appendFactorLevel:v5];
    uint64_t v6 = v8;
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
    *a3 = 1;
  }
  return MEMORY[0x1F41817F8](v5, v6);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_firstError, 0);
  objc_storeStrong((id *)&self->_stream, 0);
  objc_storeStrong((id *)&self->_underlying, 0);
}

@end
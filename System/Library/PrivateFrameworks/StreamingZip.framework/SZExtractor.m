@interface SZExtractor
+ (BOOL)supportsSecureCoding;
+ (id)knownSZExtractorImplementations;
+ (int)servicePIDWithError:(id *)a3;
- (BOOL)_isValidObject;
- (BOOL)_synchronouslyPrepareForExtractionAtOffset:(unint64_t *)a3;
- (BOOL)doesConsumeExtractedData;
- (BOOL)hasHadPostSetupMethodsCalled;
- (BOOL)isEqual:(id)a3;
- (BOOL)isLocalExtractor;
- (BOOL)needsPreparation;
- (BOOL)privileged;
- (NSDictionary)options;
- (NSError)error;
- (NSString)description;
- (NSString)extractionPath;
- (NSXPCConnection)unzipServiceConnection;
- (OS_dispatch_queue)serialQueue;
- (SZExtractor)init;
- (SZExtractor)initWithCoder:(id)a3;
- (SZExtractor)initWithOptions:(id)a3;
- (SZExtractor)initWithPath:(id)a3 md5Hashes:(id)a4 hashedChunkSize:(unint64_t)a5 resumptionOffset:(unint64_t *)a6;
- (SZExtractor)initWithPath:(id)a3 options:(id)a4;
- (SZExtractor)initWithPath:(id)a3 options:(id)a4 resumptionOffset:(unint64_t *)a5;
- (SZExtractor)initWithPath:(id)a3 resumptionOffset:(unint64_t *)a4;
- (SZExtractorDelegate)delegate;
- (SZExtractorDelegate)extractorDelegate;
- (SZExtractorInternalDelegate)internalExtractorDelegate;
- (StreamingUnzipper)inProcessUnzipper;
- (id)_serviceConnectionWithError:(id *)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)initForLocalExtractionWithPath:(id)a3 options:(id)a4 resumptionOffset:(unint64_t *)a5;
- (id)initForRemoteExtractionWithPath:(id)a3 options:(id)a4 resumptionOffset:(unint64_t *)a5;
- (unint64_t)hash;
- (unint64_t)lastResumptionOffset;
- (void)_invalidateObject;
- (void)_prepareForExtractionSynchronously:(BOOL)a3 withCompletionBlock:(id)a4;
- (void)_prepareForLocalExtraction:(id)a3;
- (void)_prepareForRemoteExtractionSynchronously:(BOOL)a3 withCompletionBlock:(id)a4;
- (void)_setUpWithPath:(id)a3 options:(id)a4;
- (void)_suspendStreamWithCompletionBlockSynchronously:(BOOL)a3 completion:(id)a4;
- (void)encodeWithCoder:(id)a3;
- (void)finishStreamWithCompletionBlock:(id)a3;
- (void)prepareForExtraction:(id)a3;
- (void)prepareForExtractionToPath:(id)a3 completionBlock:(id)a4;
- (void)setActiveExtractorDelegateMethods:(int)a3;
- (void)setError:(id)a3;
- (void)setExtractionPath:(id)a3;
- (void)setExtractorDelegate:(id)a3;
- (void)setHasHadPostSetupMethodsCalled:(BOOL)a3;
- (void)setLastResumptionOffset:(unint64_t)a3;
- (void)setNeedsPreparation:(BOOL)a3;
- (void)setPrivileged:(BOOL)a3;
- (void)supplyBytes:(id)a3 withCompletionBlock:(id)a4;
- (void)suspendStreamWithCompletionBlock:(id)a3;
- (void)terminateStreamWithError:(id)a3 completionBlock:(id)a4;
@end

@implementation SZExtractor

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_internalExtractorDelegate, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_inProcessUnzipper, 0);
  objc_storeStrong((id *)&self->_unzipServiceConnection, 0);
  objc_storeStrong((id *)&self->_options, 0);

  objc_storeStrong((id *)&self->_extractionPath, 0);
}

- (SZExtractor)initWithOptions:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SZExtractor;
  v5 = [(SZExtractor *)&v8 init];
  v6 = v5;
  if (v5) {
    [(SZExtractor *)v5 _setUpWithPath:0 options:v4];
  }

  return v6;
}

- (void)_setUpWithPath:(id)a3 options:(id)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  objc_super v8 = [v7 objectForKeyedSubscript:@"SZExtractorOptionsHashesArray"];
  if (v8)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v9 = v8;
      if ((unint64_t)[v9 count] < 2) {
        goto LABEL_6;
      }
      uint64_t v10 = [v7 objectForKeyedSubscript:@"SZExtractorOptionsHashedChunkSize"];
      if (v10)
      {
        v11 = (void *)v10;
        v12 = [v7 objectForKeyedSubscript:@"SZExtractorOptionsHashedChunkSize"];
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();

        if (isKindOfClass)
        {
LABEL_6:

          goto LABEL_7;
        }
      }
      v23 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v24 = *MEMORY[0x1E4F1C3C8];
      v25 = @"SZExtractor requires SZExtractorOptionsHashedChunkSize if passing multiple hashes in SZExtractorOptionsHashesArray";
    }
    else
    {
      v19 = NSString;
      v20 = (objc_class *)objc_opt_class();
      v21 = NSStringFromClass(v20);
      uint64_t v22 = [v19 stringWithFormat:@"SZExtractorOptionsHashesArray must be an array, but is a %@", v21];

      v23 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v24 = *MEMORY[0x1E4F1C3C8];
      v25 = (__CFString *)v22;
    }
    id v26 = [v23 exceptionWithName:v24 reason:v25 userInfo:0];
    objc_exception_throw(v26);
  }
LABEL_7:
  v14 = (NSString *)[v6 copy];
  extractionPath = self->_extractionPath;
  self->_extractionPath = v14;

  v16 = (NSDictionary *)[v7 copy];
  options = self->_options;
  self->_options = v16;

  v18 = SZGetLoggingHandle();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    v28 = self;
    __int16 v29 = 2112;
    id v30 = v6;
    __int16 v31 = 2112;
    id v32 = v7;
    _os_log_impl(&dword_1DD5BF000, v18, OS_LOG_TYPE_DEFAULT, "%@: initialized with path: %@ options: %@", buf, 0x20u);
  }
}

+ (id)knownSZExtractorImplementations
{
  if (knownSZExtractorImplementations_onceToken != -1) {
    dispatch_once(&knownSZExtractorImplementations_onceToken, &__block_literal_global);
  }
  v2 = (void *)knownSZExtractorImplementations_result;

  return v2;
}

void __68__SZExtractor_KnownImplementations__knownSZExtractorImplementations__block_invoke()
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v0 = [MEMORY[0x1E4F1CA80] setWithObject:objc_opt_class()];
  if (dlopen("/System/Library/PrivateFrameworks/InstallCoordination.framework/InstallCoordination", 9))
  {
    uint64_t v2 = 0;
    char v3 = 1;
    *(void *)&long long v1 = 136315138;
    long long v11 = v1;
    do
    {
      char v4 = v3;
      v5 = off_1E6CD1340[v2];
      Class Class = objc_getClass(v5);
      if (Class)
      {
        [v0 addObject:Class];
      }
      else
      {
        id v7 = SZGetLoggingHandle();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = v11;
          v13 = (char *)v5;
          _os_log_impl(&dword_1DD5BF000, v7, OS_LOG_TYPE_DEFAULT, "Unable to find class %s", buf, 0xCu);
        }
      }
      char v3 = 0;
      uint64_t v2 = 1;
    }
    while ((v4 & 1) != 0);
  }
  else
  {
    objc_super v8 = SZGetLoggingHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v13 = dlerror();
      _os_log_impl(&dword_1DD5BF000, v8, OS_LOG_TYPE_DEFAULT, "Unable to open InstallCoordination library: %s\n", buf, 0xCu);
    }
  }
  uint64_t v9 = objc_msgSend(v0, "copy", v11);
  uint64_t v10 = (void *)knownSZExtractorImplementations_result;
  knownSZExtractorImplementations_result = v9;
}

- (void)setHasHadPostSetupMethodsCalled:(BOOL)a3
{
  self->_hasHadPostSetupMethodsCalled = a3;
}

- (BOOL)hasHadPostSetupMethodsCalled
{
  return self->_hasHadPostSetupMethodsCalled;
}

- (void)setNeedsPreparation:(BOOL)a3
{
  self->_needsPreparation = a3;
}

- (BOOL)isLocalExtractor
{
  return self->_isLocalExtractor;
}

- (void)setError:(id)a3
{
}

- (NSError)error
{
  return self->_error;
}

- (SZExtractorInternalDelegate)internalExtractorDelegate
{
  return self->_internalExtractorDelegate;
}

- (OS_dispatch_queue)serialQueue
{
  return self->_serialQueue;
}

- (StreamingUnzipper)inProcessUnzipper
{
  return self->_inProcessUnzipper;
}

- (NSXPCConnection)unzipServiceConnection
{
  return self->_unzipServiceConnection;
}

- (void)setLastResumptionOffset:(unint64_t)a3
{
  self->_lastResumptionOffset = a3;
}

- (unint64_t)lastResumptionOffset
{
  return self->_lastResumptionOffset;
}

- (void)setPrivileged:(BOOL)a3
{
  self->_privileged = a3;
}

- (BOOL)privileged
{
  return self->_privileged;
}

- (NSDictionary)options
{
  return self->_options;
}

- (void)setExtractionPath:(id)a3
{
}

- (NSString)extractionPath
{
  return self->_extractionPath;
}

- (NSString)description
{
  char v3 = [(SZExtractor *)self extractionPath];

  if (v3)
  {
    char v4 = [(SZExtractor *)self extractionPath];
    v5 = [v4 lastPathComponent];

    id v6 = [(SZExtractor *)self extractionPath];
    id v7 = [v6 stringByDeletingLastPathComponent];
    objc_super v8 = [v7 lastPathComponent];

    uint64_t v9 = [NSString stringWithFormat:@"pathEnding:%@/%@", v8, v5];
  }
  else
  {
    uint64_t v9 = @"path:nil";
  }
  uint64_t v10 = NSString;
  long long v11 = (objc_class *)objc_opt_class();
  v12 = NSStringFromClass(v11);
  BOOL v13 = [(SZExtractor *)self needsPreparation];
  uint64_t v14 = [(SZExtractor *)self unzipServiceConnection];
  v15 = [(SZExtractor *)self error];
  uint64_t v16 = 89;
  if (v14) {
    uint64_t v17 = 89;
  }
  else {
    uint64_t v17 = 78;
  }
  if (v13) {
    uint64_t v16 = 78;
  }
  v18 = [v10 stringWithFormat:@"<%@<%p> prepared:%c valid:%c %@ error:%@>", v12, self, v16, v17, v9, v15];

  return (NSString *)v18;
}

- (void)setActiveExtractorDelegateMethods:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v5 = SZGetLoggingHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    BOOL v13 = self;
    __int16 v14 = 1024;
    int v15 = v3;
    _os_log_impl(&dword_1DD5BF000, v5, OS_LOG_TYPE_DEFAULT, "%@: setting active extractor delegate methods to 0x%x", buf, 0x12u);
  }

  id v6 = [(SZExtractor *)self inProcessUnzipper];

  if (v6)
  {
    id v7 = [(SZExtractor *)self serialQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __49__SZExtractor_setActiveExtractorDelegateMethods___block_invoke;
    block[3] = &unk_1E6CD1C70;
    block[4] = self;
    int v11 = v3;
    dispatch_async(v7, block);
  }
  else
  {
    id v7 = [(SZExtractor *)self unzipServiceConnection];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __49__SZExtractor_setActiveExtractorDelegateMethods___block_invoke_2;
    v9[3] = &unk_1E6CD1C98;
    v9[4] = self;
    objc_super v8 = [v7 remoteObjectProxyWithErrorHandler:v9];
    [v8 setActiveDelegateMethods:v3];
  }
}

void __49__SZExtractor_setActiveExtractorDelegateMethods___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) inProcessUnzipper];
  [v2 setActiveDelegateMethods:*(unsigned int *)(a1 + 40)];
}

void __49__SZExtractor_setActiveExtractorDelegateMethods___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  char v4 = SZGetLoggingHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 138412546;
    uint64_t v7 = v5;
    __int16 v8 = 2112;
    id v9 = v3;
    _os_log_error_impl(&dword_1DD5BF000, v4, OS_LOG_TYPE_ERROR, "%@: Failed to set delegate methods enabled: %@", (uint8_t *)&v6, 0x16u);
  }
}

- (SZExtractorDelegate)extractorDelegate
{
  uint64_t v2 = [(SZExtractor *)self internalExtractorDelegate];
  id v3 = (void *)v2;
  if (v2) {
    id WeakRetained = objc_loadWeakRetained((id *)(v2 + 8));
  }
  else {
    id WeakRetained = 0;
  }

  return (SZExtractorDelegate *)WeakRetained;
}

- (SZExtractorDelegate)delegate
{
  uint64_t v2 = [(SZExtractor *)self internalExtractorDelegate];
  id v3 = (void *)v2;
  if (v2) {
    id WeakRetained = objc_loadWeakRetained((id *)(v2 + 8));
  }
  else {
    id WeakRetained = 0;
  }

  return (SZExtractorDelegate *)WeakRetained;
}

- (void)setExtractorDelegate:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  char v4 = (char *)a3;
  if ([(SZExtractor *)self needsPreparation])
  {
    uint64_t v5 = SZGetLoggingHandle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v13 = 138412546;
      __int16 v14 = self;
      __int16 v15 = 2080;
      uint64_t v16 = "-[SZExtractor setExtractorDelegate:]";
      int v6 = "%@: %s was called before -[SZExtractor prepareForExtraction:]; this doesn't do anything";
LABEL_20:
      _os_log_error_impl(&dword_1DD5BF000, v5, OS_LOG_TYPE_ERROR, v6, (uint8_t *)&v13, 0x16u);
      goto LABEL_17;
    }
    goto LABEL_17;
  }
  BOOL v7 = [(SZExtractor *)self _isValidObject];
  __int16 v8 = SZGetLoggingHandle();
  uint64_t v5 = v8;
  if (!v7)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v13 = 138412546;
      __int16 v14 = self;
      __int16 v15 = 2080;
      uint64_t v16 = "-[SZExtractor setExtractorDelegate:]";
      int v6 = "%@: %s was called on an invalidated object";
      goto LABEL_20;
    }
LABEL_17:

    goto LABEL_18;
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 138412546;
    __int16 v14 = self;
    __int16 v15 = 2048;
    uint64_t v16 = v4;
    _os_log_impl(&dword_1DD5BF000, v5, OS_LOG_TYPE_DEFAULT, "%@: Setting extractor delegate to 0x%p", (uint8_t *)&v13, 0x16u);
  }

  [(SZExtractor *)self setHasHadPostSetupMethodsCalled:1];
  char v9 = objc_opt_respondsToSelector();
  if (objc_opt_respondsToSelector()) {
    LODWORD(v10) = v9 & 1 | 2;
  }
  else {
    LODWORD(v10) = v9 & 1;
  }
  if (objc_opt_respondsToSelector()) {
    uint64_t v10 = v10 | 4;
  }
  else {
    uint64_t v10 = v10;
  }
  uint64_t v11 = [(SZExtractor *)self internalExtractorDelegate];
  v12 = (void *)v11;
  if (v11) {
    objc_storeWeak((id *)(v11 + 8), v4);
  }

  [(SZExtractor *)self setActiveExtractorDelegateMethods:v10];
LABEL_18:
}

- (BOOL)doesConsumeExtractedData
{
  return 0;
}

- (void)terminateStreamWithError:(id)a3 completionBlock:(id)a4
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  int v6 = (SZExtractor *)a3;
  BOOL v7 = (void (**)(id, uint64_t))a4;
  __int16 v8 = SZGetLoggingHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    uint64_t v33 = self;
    __int16 v34 = 2112;
    v35 = v6;
    _os_log_impl(&dword_1DD5BF000, v8, OS_LOG_TYPE_DEFAULT, "%@: terminating stream with error %@", buf, 0x16u);
  }

  char v9 = [(SZExtractor *)self error];

  if (v9)
  {
    uint64_t v10 = SZGetLoggingHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      uint64_t v22 = [(SZExtractor *)self error];
      *(_DWORD *)buf = 138412546;
      uint64_t v33 = self;
      __int16 v34 = 2112;
      v35 = v22;
      _os_log_error_impl(&dword_1DD5BF000, v10, OS_LOG_TYPE_ERROR, "%@: terminate called on extractor that had already returned error %@", buf, 0x16u);
    }
    uint64_t v11 = [(SZExtractor *)self error];
    goto LABEL_18;
  }
  if ([(SZExtractor *)self needsPreparation])
  {
    v12 = SZGetLoggingHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v33 = (SZExtractor *)"-[SZExtractor terminateStreamWithError:completionBlock:]";
      __int16 v34 = 2112;
      v35 = self;
      _os_log_error_impl(&dword_1DD5BF000, v12, OS_LOG_TYPE_ERROR, "%s called before -[SZExtractor prepareForExtraction:] on %@", buf, 0x16u);
    }

    _CreateError((uint64_t)"-[SZExtractor terminateStreamWithError:completionBlock:]", 993, @"SZExtractorErrorDomain", 3, 0, 0, @"%s called before -[SZExtractor prepareForExtraction:] on %@", v13, (uint64_t)"-[SZExtractor terminateStreamWithError:completionBlock:]");
    uint64_t v11 = LABEL_17:;
LABEL_18:
    v21 = (void *)v11;
    v7[2](v7, v11);

    goto LABEL_19;
  }
  if (![(SZExtractor *)self _isValidObject])
  {
    v19 = SZGetLoggingHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v33 = (SZExtractor *)"-[SZExtractor terminateStreamWithError:completionBlock:]";
      __int16 v34 = 2112;
      v35 = self;
      _os_log_error_impl(&dword_1DD5BF000, v19, OS_LOG_TYPE_ERROR, "%s called on an invalidated object: %@", buf, 0x16u);
    }

    _CreateError((uint64_t)"-[SZExtractor terminateStreamWithError:completionBlock:]", 999, @"SZExtractorErrorDomain", 3, 0, 0, @"%s called on an invalidated object: %@", v20, (uint64_t)"-[SZExtractor terminateStreamWithError:completionBlock:]");
    goto LABEL_17;
  }
  [(SZExtractor *)self setHasHadPostSetupMethodsCalled:1];
  [(SZExtractor *)self setError:v6];
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __56__SZExtractor_terminateStreamWithError_completionBlock___block_invoke;
  v30[3] = &unk_1E6CD19C8;
  v30[4] = self;
  __int16 v31 = v7;
  __int16 v14 = (void *)MEMORY[0x1E01BA840](v30);
  __int16 v15 = [(SZExtractor *)self inProcessUnzipper];

  if (v15)
  {
    uint64_t v16 = [(SZExtractor *)self serialQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __56__SZExtractor_terminateStreamWithError_completionBlock___block_invoke_2;
    block[3] = &unk_1E6CD1A68;
    block[4] = self;
    __int16 v29 = v14;
    id v17 = v14;
    dispatch_async(v16, block);

    v18 = v29;
  }
  else
  {
    v23 = [(SZExtractor *)self unzipServiceConnection];
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __56__SZExtractor_terminateStreamWithError_completionBlock___block_invoke_3;
    v26[3] = &unk_1E6CD1C48;
    v27 = v14;
    id v24 = v14;
    v25 = [v23 remoteObjectProxyWithErrorHandler:v26];
    [v25 terminateStreamWithReply:v24];

    v18 = v27;
  }

LABEL_19:
}

void __56__SZExtractor_terminateStreamWithError_completionBlock___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  char v4 = SZGetLoggingHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 138412546;
    uint64_t v7 = v5;
    __int16 v8 = 2112;
    id v9 = v3;
    _os_log_impl(&dword_1DD5BF000, v4, OS_LOG_TYPE_DEFAULT, "%@: calling completion block with error %@", (uint8_t *)&v6, 0x16u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  [*(id *)(a1 + 32) _invalidateObject];
}

void __56__SZExtractor_terminateStreamWithError_completionBlock___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) inProcessUnzipper];
  [v2 terminateStreamWithReply:*(void *)(a1 + 40)];
}

uint64_t __56__SZExtractor_terminateStreamWithError_completionBlock___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)finishStreamWithCompletionBlock:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  char v4 = (void (**)(id, uint64_t))a3;
  uint64_t v5 = SZGetLoggingHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v30 = self;
    _os_log_impl(&dword_1DD5BF000, v5, OS_LOG_TYPE_DEFAULT, "%@: finishing stream", buf, 0xCu);
  }

  int v6 = [(SZExtractor *)self error];

  if (v6)
  {
    uint64_t v7 = SZGetLoggingHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v19 = [(SZExtractor *)self error];
      *(_DWORD *)buf = 138412546;
      id v30 = self;
      __int16 v31 = 2112;
      id v32 = v19;
      _os_log_error_impl(&dword_1DD5BF000, v7, OS_LOG_TYPE_ERROR, "%@: finish called on extractor that had already returned error %@", buf, 0x16u);
    }
    uint64_t v8 = [(SZExtractor *)self error];
    goto LABEL_18;
  }
  if ([(SZExtractor *)self needsPreparation])
  {
    id v9 = SZGetLoggingHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      id v30 = (SZExtractor *)"-[SZExtractor finishStreamWithCompletionBlock:]";
      __int16 v31 = 2112;
      id v32 = self;
      _os_log_error_impl(&dword_1DD5BF000, v9, OS_LOG_TYPE_ERROR, "%s called before -[SZExtractor prepareForExtraction:] on %@", buf, 0x16u);
    }

    _CreateError((uint64_t)"-[SZExtractor finishStreamWithCompletionBlock:]", 949, @"SZExtractorErrorDomain", 3, 0, 0, @"%s called before -[SZExtractor prepareForExtraction:] on %@", v10, (uint64_t)"-[SZExtractor finishStreamWithCompletionBlock:]");
    uint64_t v8 = LABEL_17:;
LABEL_18:
    v18 = (void *)v8;
    v4[2](v4, v8);

    goto LABEL_19;
  }
  if (![(SZExtractor *)self _isValidObject])
  {
    uint64_t v16 = SZGetLoggingHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      id v30 = (SZExtractor *)"-[SZExtractor finishStreamWithCompletionBlock:]";
      __int16 v31 = 2112;
      id v32 = self;
      _os_log_error_impl(&dword_1DD5BF000, v16, OS_LOG_TYPE_ERROR, "%s called on an invalidated object: %@", buf, 0x16u);
    }

    _CreateError((uint64_t)"-[SZExtractor finishStreamWithCompletionBlock:]", 955, @"SZExtractorErrorDomain", 3, 0, 0, @"%s called on an invalidated object: %@", v17, (uint64_t)"-[SZExtractor finishStreamWithCompletionBlock:]");
    goto LABEL_17;
  }
  [(SZExtractor *)self setHasHadPostSetupMethodsCalled:1];
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __47__SZExtractor_finishStreamWithCompletionBlock___block_invoke;
  v27[3] = &unk_1E6CD19C8;
  v27[4] = self;
  v28 = v4;
  uint64_t v11 = (void *)MEMORY[0x1E01BA840](v27);
  v12 = [(SZExtractor *)self inProcessUnzipper];

  if (v12)
  {
    uint64_t v13 = [(SZExtractor *)self serialQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __47__SZExtractor_finishStreamWithCompletionBlock___block_invoke_2;
    block[3] = &unk_1E6CD1A68;
    block[4] = self;
    id v26 = v11;
    id v14 = v11;
    dispatch_async(v13, block);

    __int16 v15 = v26;
  }
  else
  {
    uint64_t v20 = [(SZExtractor *)self unzipServiceConnection];
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __47__SZExtractor_finishStreamWithCompletionBlock___block_invoke_3;
    v23[3] = &unk_1E6CD1C48;
    id v24 = v11;
    id v21 = v11;
    uint64_t v22 = [v20 remoteObjectProxyWithErrorHandler:v23];
    [v22 finishStreamWithReply:v21];

    __int16 v15 = v24;
  }

LABEL_19:
}

void __47__SZExtractor_finishStreamWithCompletionBlock___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  char v4 = SZGetLoggingHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 138412546;
    uint64_t v7 = v5;
    __int16 v8 = 2112;
    id v9 = v3;
    _os_log_impl(&dword_1DD5BF000, v4, OS_LOG_TYPE_DEFAULT, "%@: calling completion block with error %@", (uint8_t *)&v6, 0x16u);
  }

  if (v3) {
    [*(id *)(a1 + 32) setError:v3];
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  [*(id *)(a1 + 32) _invalidateObject];
}

void __47__SZExtractor_finishStreamWithCompletionBlock___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) inProcessUnzipper];
  [v2 finishStreamWithReply:*(void *)(a1 + 40)];
}

uint64_t __47__SZExtractor_finishStreamWithCompletionBlock___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)suspendStreamWithCompletionBlock:(id)a3
{
}

- (void)_suspendStreamWithCompletionBlockSynchronously:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  int v6 = (void (**)(id, void, uint64_t))a4;
  uint64_t v7 = SZGetLoggingHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v32 = self;
    _os_log_impl(&dword_1DD5BF000, v7, OS_LOG_TYPE_DEFAULT, "%@: suspending stream", buf, 0xCu);
  }

  __int16 v8 = [(SZExtractor *)self error];

  if (v8)
  {
    id v9 = SZGetLoggingHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      uint64_t v20 = [(SZExtractor *)self error];
      *(_DWORD *)buf = 138412546;
      id v32 = self;
      __int16 v33 = 2112;
      __int16 v34 = v20;
      _os_log_error_impl(&dword_1DD5BF000, v9, OS_LOG_TYPE_ERROR, "%@: suspend called on extractor that had already returned error %@", buf, 0x16u);
    }
    uint64_t v10 = [(SZExtractor *)self error];
    goto LABEL_18;
  }
  if ([(SZExtractor *)self needsPreparation])
  {
    uint64_t v11 = SZGetLoggingHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      id v32 = (SZExtractor *)"-[SZExtractor _suspendStreamWithCompletionBlockSynchronously:completion:]";
      __int16 v33 = 2112;
      __int16 v34 = self;
      _os_log_error_impl(&dword_1DD5BF000, v11, OS_LOG_TYPE_ERROR, "%s called before -[SZExtractor prepareForExtraction:] on %@", buf, 0x16u);
    }

    _CreateError((uint64_t)"-[SZExtractor _suspendStreamWithCompletionBlockSynchronously:completion:]", 891, @"SZExtractorErrorDomain", 3, 0, 0, @"%s called before -[SZExtractor prepareForExtraction:] on %@", v12, (uint64_t)"-[SZExtractor _suspendStreamWithCompletionBlockSynchronously:completion:]");
    uint64_t v10 = LABEL_17:;
LABEL_18:
    v19 = (void *)v10;
    v6[2](v6, 0, v10);

    goto LABEL_19;
  }
  if (![(SZExtractor *)self _isValidObject])
  {
    uint64_t v17 = SZGetLoggingHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      id v32 = (SZExtractor *)"-[SZExtractor _suspendStreamWithCompletionBlockSynchronously:completion:]";
      __int16 v33 = 2112;
      __int16 v34 = self;
      _os_log_error_impl(&dword_1DD5BF000, v17, OS_LOG_TYPE_ERROR, "%s called on an invalidated object: %@", buf, 0x16u);
    }

    _CreateError((uint64_t)"-[SZExtractor _suspendStreamWithCompletionBlockSynchronously:completion:]", 897, @"SZExtractorErrorDomain", 3, 0, 0, @"%s called on an invalidated object: %@", v18, (uint64_t)"-[SZExtractor _suspendStreamWithCompletionBlockSynchronously:completion:]");
    goto LABEL_17;
  }
  [(SZExtractor *)self setHasHadPostSetupMethodsCalled:1];
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __73__SZExtractor__suspendStreamWithCompletionBlockSynchronously_completion___block_invoke;
  v29[3] = &unk_1E6CD1C20;
  v29[4] = self;
  id v30 = v6;
  uint64_t v13 = (void *)MEMORY[0x1E01BA840](v29);
  id v14 = [(SZExtractor *)self inProcessUnzipper];

  if (v14)
  {
    __int16 v15 = [(SZExtractor *)self serialQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __73__SZExtractor__suspendStreamWithCompletionBlockSynchronously_completion___block_invoke_2;
    block[3] = &unk_1E6CD1A68;
    block[4] = self;
    id v28 = v13;
    id v16 = v13;
    dispatch_async(v15, block);
  }
  else
  {
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __73__SZExtractor__suspendStreamWithCompletionBlockSynchronously_completion___block_invoke_3;
    v25[3] = &unk_1E6CD1C48;
    id v26 = v13;
    id v21 = v13;
    uint64_t v22 = (void *)MEMORY[0x1E01BA840](v25);
    v23 = [(SZExtractor *)self unzipServiceConnection];
    id v24 = v23;
    if (v4) {
      [v23 synchronousRemoteObjectProxyWithErrorHandler:v22];
    }
    else {
    id v16 = [v23 remoteObjectProxyWithErrorHandler:v22];
    }

    [v16 suspendStreamWithReply:v21];
  }

LABEL_19:
}

void __73__SZExtractor__suspendStreamWithCompletionBlockSynchronously_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  int v6 = SZGetLoggingHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = *(void *)(a1 + 32);
    int v8 = 138412802;
    uint64_t v9 = v7;
    __int16 v10 = 2048;
    uint64_t v11 = a2;
    __int16 v12 = 2112;
    id v13 = v5;
    _os_log_impl(&dword_1DD5BF000, v6, OS_LOG_TYPE_DEFAULT, "%@: calling completion block with offset %llu, error %@", (uint8_t *)&v8, 0x20u);
  }

  if (v5) {
    [*(id *)(a1 + 32) setError:v5];
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  [*(id *)(a1 + 32) _invalidateObject];
}

void __73__SZExtractor__suspendStreamWithCompletionBlockSynchronously_completion___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) inProcessUnzipper];
  [v2 suspendStreamWithReply:*(void *)(a1 + 40)];
}

uint64_t __73__SZExtractor__suspendStreamWithCompletionBlockSynchronously_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)supplyBytes:(id)a3 withCompletionBlock:(id)a4
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 length];
  uint64_t v9 = SZGetTraceHandle();
  if (os_signpost_enabled(v9))
  {
    *(_DWORD *)buf = 138412546;
    *(void *)&uint8_t buf[4] = self;
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = v8;
    _os_signpost_emit_with_name_impl(&dword_1DD5BF000, v9, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "SUPPLY_BYTES", "%@: Supply bytes with length %lu began", buf, 0x16u);
  }

  v50[0] = MEMORY[0x1E4F143A8];
  v50[1] = 3221225472;
  v50[2] = __47__SZExtractor_supplyBytes_withCompletionBlock___block_invoke;
  v50[3] = &unk_1E6CD1A90;
  uint64_t v52 = v8;
  id v10 = v7;
  id v51 = v10;
  uint64_t v11 = (void (**)(void, void, void))MEMORY[0x1E01BA840](v50);
  __int16 v12 = [(SZExtractor *)self error];

  if (v12)
  {
    id v13 = SZGetLoggingHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v23 = [(SZExtractor *)self error];
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = self;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v23;
      _os_log_error_impl(&dword_1DD5BF000, v13, OS_LOG_TYPE_ERROR, "%@: supply called on extractor that had already returned error %@", buf, 0x16u);
    }
    uint64_t v14 = [(SZExtractor *)self error];
    ((void (**)(void, void *, uint64_t))v11)[2](v11, v14, 1);
  }
  else if ([(SZExtractor *)self needsPreparation])
  {
    __int16 v15 = SZGetLoggingHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      *(void *)&uint8_t buf[4] = "-[SZExtractor supplyBytes:withCompletionBlock:]";
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = self;
      _os_log_error_impl(&dword_1DD5BF000, v15, OS_LOG_TYPE_ERROR, "%s called before -[SZExtractor prepareForExtraction:] on %@", buf, 0x16u);
    }

    uint64_t v14 = _CreateError((uint64_t)"-[SZExtractor supplyBytes:withCompletionBlock:]", 704, @"SZExtractorErrorDomain", 3, 0, 0, @"%s called before -[SZExtractor prepareForExtraction:] on %@", v16, (uint64_t)"-[SZExtractor supplyBytes:withCompletionBlock:]");
    ((void (**)(void, void *, uint64_t))v11)[2](v11, v14, 1);
  }
  else if ([(SZExtractor *)self _isValidObject])
  {
    [(SZExtractor *)self setHasHadPostSetupMethodsCalled:1];
    uint64_t v14 = (void *)[v6 copy];
    v48[0] = MEMORY[0x1E4F143A8];
    v48[1] = 3221225472;
    v48[2] = __47__SZExtractor_supplyBytes_withCompletionBlock___block_invoke_182;
    v48[3] = &unk_1E6CD1AB8;
    v48[4] = self;
    v49 = v11;
    uint64_t v17 = (void *)MEMORY[0x1E01BA840](v48);
    uint64_t v18 = [(SZExtractor *)self inProcessUnzipper];

    if (v18)
    {
      v19 = [(SZExtractor *)self serialQueue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __47__SZExtractor_supplyBytes_withCompletionBlock___block_invoke_2;
      block[3] = &unk_1E6CD1AE0;
      block[4] = self;
      id v46 = v14;
      id v47 = v17;
      id v20 = v17;
      dispatch_async(v19, block);
    }
    else
    {
      dispatch_group_t v24 = dispatch_group_create();
      *(void *)buf = 0;
      *(void *)&buf[8] = buf;
      *(void *)&buf[16] = 0x3032000000;
      v54 = __Block_byref_object_copy_;
      v55 = __Block_byref_object_dispose_;
      id v56 = 0;
      v43[0] = 0;
      v43[1] = v43;
      v43[2] = 0x2020000000;
      char v44 = 0;
      v39[0] = MEMORY[0x1E4F143A8];
      v39[1] = 3221225472;
      v39[2] = __47__SZExtractor_supplyBytes_withCompletionBlock___block_invoke_189;
      v39[3] = &unk_1E6CD1B08;
      v41 = buf;
      v42 = v43;
      v25 = v24;
      v40 = v25;
      id v26 = (void *)MEMORY[0x1E01BA840](v39);
      v27 = [(SZExtractor *)self serialQueue];
      v31[0] = MEMORY[0x1E4F143A8];
      v31[1] = 3221225472;
      v31[2] = __47__SZExtractor_supplyBytes_withCompletionBlock___block_invoke_2_191;
      v31[3] = &unk_1E6CD1BF8;
      id v32 = v14;
      __int16 v33 = v25;
      __int16 v34 = self;
      id v35 = v26;
      id v36 = v17;
      v37 = buf;
      v38 = v43;
      id v28 = v17;
      id v29 = v26;
      id v30 = v25;
      dispatch_async(v27, v31);

      _Block_object_dispose(v43, 8);
      _Block_object_dispose(buf, 8);
    }
  }
  else
  {
    id v21 = SZGetLoggingHandle();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      *(void *)&uint8_t buf[4] = "-[SZExtractor supplyBytes:withCompletionBlock:]";
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = self;
      _os_log_error_impl(&dword_1DD5BF000, v21, OS_LOG_TYPE_ERROR, "%s called on an invalidated object: %@", buf, 0x16u);
    }

    uint64_t v14 = _CreateError((uint64_t)"-[SZExtractor supplyBytes:withCompletionBlock:]", 710, @"SZExtractorErrorDomain", 3, 0, 0, @"%s called on an invalidated object: %@", v22, (uint64_t)"-[SZExtractor supplyBytes:withCompletionBlock:]");
    ((void (**)(void, void *, uint64_t))v11)[2](v11, v14, 1);
  }
}

void __47__SZExtractor_supplyBytes_withCompletionBlock___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  BOOL v4 = SZGetTraceHandle();
  if (os_signpost_enabled(v4))
  {
    uint64_t v5 = *(void *)(a1 + 40);
    if (v3) {
      int v6 = 78;
    }
    else {
      int v6 = 89;
    }
    int v7 = 134218240;
    uint64_t v8 = v5;
    __int16 v9 = 1024;
    int v10 = v6;
    _os_signpost_emit_with_name_impl(&dword_1DD5BF000, v4, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "SUPPLY_BYTES", "Supply bytes with length %lu succeeded: %c", (uint8_t *)&v7, 0x12u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __47__SZExtractor_supplyBytes_withCompletionBlock___block_invoke_182(uint64_t a1, void *a2, int a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  int v6 = SZGetLoggingHandle();
  int v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      int v11 = 138412546;
      uint64_t v12 = v8;
      __int16 v13 = 2112;
      id v14 = v5;
      _os_log_error_impl(&dword_1DD5BF000, v7, OS_LOG_TYPE_ERROR, "%@: calling completion block with error %@", (uint8_t *)&v11, 0x16u);
    }

    [*(id *)(a1 + 32) setError:v5];
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    [*(id *)(a1 + 32) _invalidateObject];
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v9 = *(void *)(a1 + 32);
      if (a3) {
        int v10 = 89;
      }
      else {
        int v10 = 78;
      }
      int v11 = 138412546;
      uint64_t v12 = v9;
      __int16 v13 = 1024;
      LODWORD(v14) = v10;
      _os_log_debug_impl(&dword_1DD5BF000, v7, OS_LOG_TYPE_DEBUG, "%@: calling completion block with no error, dataComplete=%c", (uint8_t *)&v11, 0x12u);
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void __47__SZExtractor_supplyBytes_withCompletionBlock___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) inProcessUnzipper];
  [v2 supplyBytes:*(void *)(a1 + 40) withReply:*(void *)(a1 + 48)];
}

void __47__SZExtractor_supplyBytes_withCompletionBlock___block_invoke_189(uint64_t a1, void *a2, char a3, uint64_t a4)
{
  id v11 = a2;
  uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v10 = *(void *)(v8 + 40);
  uint64_t v9 = (id *)(v8 + 40);
  if (!v10) {
    objc_storeStrong(v9, a2);
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = a3;
  pthread_mutex_lock(&_sAvailableExtractionMemoryMutex);
  _sAvailableExtractionMemory += a4;
  pthread_cond_broadcast(&_sAvailableExtractionMemoryCondition);
  pthread_mutex_unlock(&_sAvailableExtractionMemoryMutex);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __47__SZExtractor_supplyBytes_withCompletionBlock___block_invoke_2_191(uint64_t a1)
{
  uint64_t v73 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) length];
  if ((unint64_t)(v2 - 5242881) >= 0xFFFFFFFFFFB00000)
  {
    unint64_t v3 = v2;
    pthread_mutex_lock(&_sAvailableExtractionMemoryMutex);
    if (_sAvailableExtractionMemory >= v3) {
      _sAvailableExtractionMemory -= v3;
    }
    else {
      unint64_t v3 = 0;
    }
    pthread_mutex_unlock(&_sAvailableExtractionMemoryMutex);
  }
  else
  {
    unint64_t v3 = 0;
  }
  if (v3 == [*(id *)(a1 + 32) length])
  {
    BOOL v4 = SZGetLoggingHandle();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134217984;
      *(void *)&uint8_t buf[4] = v3;
      _os_log_debug_impl(&dword_1DD5BF000, v4, OS_LOG_TYPE_DEBUG, "Supplying entire byte range data of length %lu", buf, 0xCu);
    }

    dispatch_group_enter(*(dispatch_group_t *)(a1 + 40));
    id v5 = SZGetTraceHandle();
    if (os_signpost_enabled(v5))
    {
      *(_DWORD *)buf = 134217984;
      *(void *)&uint8_t buf[4] = v3;
      _os_signpost_emit_with_name_impl(&dword_1DD5BF000, v5, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "DATA_OVER_XPC", "Sending buffer of size %lu to the unzip service over XPC", buf, 0xCu);
    }

    int v6 = [*(id *)(a1 + 48) unzipServiceConnection];
    v61[0] = MEMORY[0x1E4F143A8];
    v61[1] = 3221225472;
    v61[2] = __47__SZExtractor_supplyBytes_withCompletionBlock___block_invoke_195;
    v61[3] = &unk_1E6CD1B30;
    v62 = *(id *)(a1 + 56);
    unint64_t v63 = v3;
    int v7 = [v6 remoteObjectProxyWithErrorHandler:v61];
    uint64_t v8 = *(void *)(a1 + 32);
    v58[0] = MEMORY[0x1E4F143A8];
    v58[1] = 3221225472;
    v58[2] = __47__SZExtractor_supplyBytes_withCompletionBlock___block_invoke_196;
    v58[3] = &unk_1E6CD1A90;
    id v59 = *(id *)(a1 + 56);
    unint64_t v60 = v3;
    [v7 supplyBytes:v8 withReply:v58];

    uint64_t v9 = v62;
    goto LABEL_62;
  }
  uint64_t v10 = SZGetTraceHandle();
  if (os_signpost_enabled(v10))
  {
    uint64_t v11 = [*(id *)(a1 + 32) length];
    *(_DWORD *)buf = 134217984;
    *(void *)&uint8_t buf[4] = v11;
    _os_signpost_emit_with_name_impl(&dword_1DD5BF000, v10, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "FRAGMENT_DATA", "Starting fragmentation of the supplied buffer of length : %lu", buf, 0xCu);
  }

  if ([*(id *)(a1 + 32) length])
  {
    unint64_t v12 = 0;
    unint64_t v41 = 0;
    uint64_t v13 = 0x7FFFFFFFFFFFFFFFLL;
    while (1)
    {
      uint64_t v54 = 0;
      v55 = &v54;
      uint64_t v56 = 0x2020000000;
      uint64_t v57 = 0;
      if (v13 == 0x7FFFFFFFFFFFFFFFLL) {
        break;
      }
      unint64_t v18 = v13 - v12 + v41;
      if (v18)
      {
        pthread_mutex_lock(&_sAvailableExtractionMemoryMutex);
        unint64_t v19 = _sAvailableExtractionMemory;
        if (!((unint64_t)_sAvailableExtractionMemory >> 17))
        {
          do
          {
            pthread_cond_wait(&_sAvailableExtractionMemoryCondition, &_sAvailableExtractionMemoryMutex);
            unint64_t v19 = _sAvailableExtractionMemory;
          }
          while ((unint64_t)_sAvailableExtractionMemory < 0x20000);
        }
        if (v19 < v18) {
          unint64_t v18 = v19;
        }
        _sAvailableExtractionMemory = v19 - v18;
        pthread_mutex_unlock(&_sAvailableExtractionMemoryMutex);
        id v20 = (unint64_t *)(v55 + 3);
      }
      else
      {
        id v20 = (unint64_t *)&v57;
      }
      unint64_t *v20 = v18;
      id v21 = SZGetLoggingHandle();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v36 = v55[3];
        *(_DWORD *)buf = 134218752;
        *(void *)&uint8_t buf[4] = v36;
        *(_WORD *)&buf[12] = 2048;
        *(void *)&buf[14] = v12;
        *(_WORD *)&buf[22] = 2048;
        v71 = (void *)v13;
        LOWORD(v72) = 2048;
        *(void *)((char *)&v72 + 2) = v41;
        _os_log_debug_impl(&dword_1DD5BF000, v21, OS_LOG_TYPE_DEBUG, "Reserved %ld bytes at %ld for too-big partial range {%lu, %lu}", buf, 0x2Au);
      }

LABEL_49:
      v25 = SZGetLoggingHandle();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v35 = v55[3];
        *(_DWORD *)buf = 134218240;
        *(void *)&uint8_t buf[4] = v35;
        *(_WORD *)&buf[12] = 2048;
        *(void *)&buf[14] = v12;
        _os_log_debug_impl(&dword_1DD5BF000, v25, OS_LOG_TYPE_DEBUG, "Supplying byte range data of length %lu at location %lu", buf, 0x16u);
      }

      id v26 = (void *)MEMORY[0x1E01BA640]();
      v27 = objc_msgSend(*(id *)(a1 + 32), "subdataWithRange:", v12, v55[3]);
      dispatch_group_enter(*(dispatch_group_t *)(a1 + 40));
      id v28 = SZGetTraceHandle();
      if (os_signpost_enabled(v28))
      {
        uint64_t v29 = [v27 length];
        *(_DWORD *)buf = 134217984;
        *(void *)&uint8_t buf[4] = v29;
        _os_signpost_emit_with_name_impl(&dword_1DD5BF000, v28, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "DATA_OVER_XPC", "Sending buffer of size %lu to the unzip service over XPC", buf, 0xCu);
      }

      id v30 = [*(id *)(a1 + 48) unzipServiceConnection];
      v49[0] = MEMORY[0x1E4F143A8];
      v49[1] = 3221225472;
      v49[2] = __47__SZExtractor_supplyBytes_withCompletionBlock___block_invoke_223;
      v49[3] = &unk_1E6CD1B80;
      id v51 = *(id *)(a1 + 56);
      uint64_t v52 = &v54;
      id v31 = v27;
      id v50 = v31;
      id v32 = [v30 remoteObjectProxyWithErrorHandler:v49];
      v45[0] = MEMORY[0x1E4F143A8];
      v45[1] = 3221225472;
      v45[2] = __47__SZExtractor_supplyBytes_withCompletionBlock___block_invoke_224;
      v45[3] = &unk_1E6CD1BA8;
      id v47 = *(id *)(a1 + 56);
      v48 = &v54;
      id v33 = v31;
      id v46 = v33;
      [v32 supplyBytes:v33 withReply:v45];

      v12 += v55[3];
      if (v13 == 0x7FFFFFFFFFFFFFFFLL) {
        goto LABEL_58;
      }
      if (v12 >= v41 + v13)
      {
        __int16 v34 = SZGetLoggingHandle();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 134218240;
          *(void *)&uint8_t buf[4] = v13;
          *(_WORD *)&buf[12] = 2048;
          *(void *)&buf[14] = v41;
          _os_log_debug_impl(&dword_1DD5BF000, v34, OS_LOG_TYPE_DEBUG, "Active partial range {%lu, %lu} exhausted", buf, 0x16u);
        }

        unint64_t v41 = 0;
LABEL_58:
        uint64_t v13 = 0x7FFFFFFFFFFFFFFFLL;
      }
      _Block_object_dispose(&v54, 8);
      if (v12 >= [*(id *)(a1 + 32) length]) {
        goto LABEL_60;
      }
    }
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3010000000;
    v71 = &unk_1DD5EDFA5;
    long long v72 = xmmword_1DD5E4260;
    id v14 = *(void **)(a1 + 32);
    v53[0] = MEMORY[0x1E4F143A8];
    v53[1] = 3221225472;
    v53[2] = __47__SZExtractor_supplyBytes_withCompletionBlock___block_invoke_198;
    v53[3] = &unk_1E6CD1B58;
    v53[5] = buf;
    v53[6] = v12;
    v53[4] = &v54;
    [v14 enumerateByteRangesUsingBlock:v53];
    if (!v55[3])
    {
      uint64_t v13 = *(void *)(*(void *)&buf[8] + 32);
      if (v13 == 0x7FFFFFFFFFFFFFFFLL) {
        __assert_rtn("-[SZExtractor supplyBytes:withCompletionBlock:]_block_invoke_2", "SZExtractor.m", 822, "NSNotFound != lastByteRange.location");
      }
      unint64_t v15 = *(void *)(*(void *)&buf[8] + 40);
      if (v15 > 0x500000)
      {
        pthread_mutex_lock(&_sAvailableExtractionMemoryMutex);
        unint64_t v22 = _sAvailableExtractionMemory;
        if (!((unint64_t)_sAvailableExtractionMemory >> 17))
        {
          do
          {
            pthread_cond_wait(&_sAvailableExtractionMemoryCondition, &_sAvailableExtractionMemoryMutex);
            unint64_t v22 = _sAvailableExtractionMemory;
          }
          while ((unint64_t)_sAvailableExtractionMemory < 0x20000);
        }
        if (v22 >= v15) {
          unint64_t v23 = v15;
        }
        else {
          unint64_t v23 = v22;
        }
        _sAvailableExtractionMemory = v22 - v23;
        pthread_mutex_unlock(&_sAvailableExtractionMemoryMutex);
        v55[3] = v23;
        dispatch_group_t v24 = SZGetLoggingHandle();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v38 = v55[3];
          *(_DWORD *)v64 = 134218496;
          uint64_t v65 = v38;
          __int16 v66 = 2048;
          uint64_t v67 = v13;
          __int16 v68 = 2048;
          unint64_t v69 = v15;
          _os_log_debug_impl(&dword_1DD5BF000, v24, OS_LOG_TYPE_DEBUG, "Reserved %ld bytes for too-big partial range {%lu, %lu}", v64, 0x20u);
        }

        unint64_t v41 = v15;
        goto LABEL_48;
      }
      uint64_t v16 = SZGetLoggingHandle();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v37 = *(void *)(*(void *)&buf[8] + 40);
        *(_DWORD *)v64 = 134217984;
        uint64_t v65 = v37;
        _os_log_debug_impl(&dword_1DD5BF000, v16, OS_LOG_TYPE_DEBUG, "Waiting for %lu bytes to become available", v64, 0xCu);
      }

      unint64_t v17 = *(void *)(*(void *)&buf[8] + 40);
      if (v17)
      {
        pthread_mutex_lock(&_sAvailableExtractionMemoryMutex);
        while (_sAvailableExtractionMemory < v17)
          pthread_cond_wait(&_sAvailableExtractionMemoryCondition, &_sAvailableExtractionMemoryMutex);
        _sAvailableExtractionMemory -= v17;
        pthread_mutex_unlock(&_sAvailableExtractionMemoryMutex);
      }
      v55[3] = v17;
    }
    uint64_t v13 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_48:
    _Block_object_dispose(buf, 8);
    goto LABEL_49;
  }
LABEL_60:
  uint64_t v9 = SZGetTraceHandle();
  if (os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1DD5BF000, v9, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "FRAGMENT_DATA", "Ending fragmentation of the supplied buffer", buf, 2u);
  }
LABEL_62:

  v39 = *(NSObject **)(a1 + 40);
  v40 = [*(id *)(a1 + 48) serialQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __47__SZExtractor_supplyBytes_withCompletionBlock___block_invoke_228;
  block[3] = &unk_1E6CD1BD0;
  id v43 = *(id *)(a1 + 64);
  long long v44 = *(_OWORD *)(a1 + 72);
  dispatch_group_notify(v39, v40, block);
}

void __47__SZExtractor_supplyBytes_withCompletionBlock___block_invoke_195(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  uint64_t v2 = SZGetTraceHandle();
  if (os_signpost_enabled(v2))
  {
    uint64_t v3 = *(void *)(a1 + 40);
    int v4 = 134217984;
    uint64_t v5 = v3;
    _os_signpost_emit_with_name_impl(&dword_1DD5BF000, v2, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "DATA_OVER_XPC", "Finished (Succeeded: N) processing buffer of size %lu sent to the unzip service over XPC", (uint8_t *)&v4, 0xCu);
  }
}

void __47__SZExtractor_supplyBytes_withCompletionBlock___block_invoke_196(uint64_t a1, uint64_t a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  int v4 = SZGetTraceHandle();
  if (os_signpost_enabled(v4))
  {
    uint64_t v5 = *(void *)(a1 + 40);
    if (a2) {
      int v6 = 78;
    }
    else {
      int v6 = 89;
    }
    v7[0] = 67109376;
    v7[1] = v6;
    __int16 v8 = 2048;
    uint64_t v9 = v5;
    _os_signpost_emit_with_name_impl(&dword_1DD5BF000, v4, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "DATA_OVER_XPC", "Finished (Succeeded: %c) processing buffer of size %lu sent to the unzip service over XPC", (uint8_t *)v7, 0x12u);
  }
}

void __47__SZExtractor_supplyBytes_withCompletionBlock___block_invoke_198(void *a1, uint64_t a2, unint64_t a3, unint64_t a4, unsigned char *a5)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (a3 + a4 <= a1[6])
  {
    uint64_t v10 = SZGetLoggingHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      int v15 = 134218240;
      unint64_t v16 = a3;
      __int16 v17 = 2048;
      unint64_t v18 = a4;
      _os_log_debug_impl(&dword_1DD5BF000, v10, OS_LOG_TYPE_DEBUG, "Already processed {%lu, %lu}", (uint8_t *)&v15, 0x16u);
    }
  }
  else
  {
    if (a4 - 5242881 >= 0xFFFFFFFFFFB00000)
    {
      pthread_mutex_lock(&_sAvailableExtractionMemoryMutex);
      if (_sAvailableExtractionMemory >= a4)
      {
        _sAvailableExtractionMemory -= a4;
        unint64_t v9 = a4;
      }
      else
      {
        unint64_t v9 = 0;
      }
      pthread_mutex_unlock(&_sAvailableExtractionMemoryMutex);
    }
    else
    {
      unint64_t v9 = 0;
    }
    uint64_t v11 = SZGetLoggingHandle();
    BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG);
    if (v9 == a4)
    {
      if (v12)
      {
        unint64_t v14 = *(void *)(*(void *)(a1[4] + 8) + 24);
        int v15 = 134218240;
        unint64_t v16 = a4;
        __int16 v17 = 2048;
        unint64_t v18 = v14;
        _os_log_debug_impl(&dword_1DD5BF000, v11, OS_LOG_TYPE_DEBUG, "Reserved %ld bytes; adding to existing length %ld",
          (uint8_t *)&v15,
          0x16u);
      }

      *(void *)(*(void *)(a1[4] + 8) + 24) += a4;
    }
    else
    {
      if (v12)
      {
        int v15 = 134218240;
        unint64_t v16 = a3;
        __int16 v17 = 2048;
        unint64_t v18 = a4;
        _os_log_debug_impl(&dword_1DD5BF000, v11, OS_LOG_TYPE_DEBUG, "Failed to reserve last range; falling out with last range {%lu, %lu}",
          (uint8_t *)&v15,
          0x16u);
      }

      uint64_t v13 = *(void *)(a1[5] + 8);
      *(void *)(v13 + 32) = a3;
      *(void *)(v13 + 40) = a4;
      *a5 = 1;
    }
  }
}

void __47__SZExtractor_supplyBytes_withCompletionBlock___block_invoke_223(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  uint64_t v2 = SZGetTraceHandle();
  if (os_signpost_enabled(v2))
  {
    uint64_t v3 = [*(id *)(a1 + 32) length];
    int v4 = 134217984;
    uint64_t v5 = v3;
    _os_signpost_emit_with_name_impl(&dword_1DD5BF000, v2, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "DATA_OVER_XPC", "Finished (Succeeded: N) processing buffer of size %lu sent to the unzip service over XPC", (uint8_t *)&v4, 0xCu);
  }
}

void __47__SZExtractor_supplyBytes_withCompletionBlock___block_invoke_224(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  int v4 = SZGetTraceHandle();
  if (os_signpost_enabled(v4))
  {
    if (v3) {
      int v5 = 78;
    }
    else {
      int v5 = 89;
    }
    uint64_t v6 = [*(id *)(a1 + 32) length];
    v7[0] = 67109376;
    v7[1] = v5;
    __int16 v8 = 2048;
    uint64_t v9 = v6;
    _os_signpost_emit_with_name_impl(&dword_1DD5BF000, v4, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "DATA_OVER_XPC", "Finished (Succeeded: %c) processing buffer of size %lu sent to the unzip service over XPC", (uint8_t *)v7, 0x12u);
  }
}

uint64_t __47__SZExtractor_supplyBytes_withCompletionBlock___block_invoke_228(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[4] + 16))(a1[4], *(void *)(*(void *)(a1[5] + 8) + 40), *(unsigned __int8 *)(*(void *)(a1[6] + 8) + 24));
}

- (BOOL)needsPreparation
{
  uint64_t v2 = [(SZExtractor *)self serialQueue];
  BOOL v3 = v2 == 0;

  return v3;
}

- (BOOL)_isValidObject
{
  BOOL v3 = [(SZExtractor *)self unzipServiceConnection];
  if (v3)
  {
    BOOL v4 = 1;
  }
  else
  {
    int v5 = [(SZExtractor *)self inProcessUnzipper];
    BOOL v4 = v5 != 0;
  }
  return v4;
}

- (void)_invalidateObject
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if ([(SZExtractor *)self _isValidObject])
  {
    BOOL v3 = SZGetLoggingHandle();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 138412290;
      __int16 v8 = self;
      _os_log_impl(&dword_1DD5BF000, v3, OS_LOG_TYPE_DEFAULT, "%@: invalidating", (uint8_t *)&v7, 0xCu);
    }

    BOOL v4 = [(SZExtractor *)self unzipServiceConnection];
    [v4 invalidate];

    unzipServiceConnection = self->_unzipServiceConnection;
    self->_unzipServiceConnection = 0;

    inProcessUnzipper = self->_inProcessUnzipper;
    self->_inProcessUnzipper = 0;
  }
}

- (void)prepareForExtractionToPath:(id)a3 completionBlock:(id)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  __int16 v8 = SZGetLoggingHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412546;
    uint64_t v10 = self;
    __int16 v11 = 2112;
    id v12 = v6;
    _os_log_impl(&dword_1DD5BF000, v8, OS_LOG_TYPE_DEFAULT, "%@: preparing for extraction to path %@", (uint8_t *)&v9, 0x16u);
  }

  [(SZExtractor *)self setExtractionPath:v6];
  [(SZExtractor *)self prepareForExtraction:v7];
}

- (void)prepareForExtraction:(id)a3
{
}

- (void)_prepareForExtractionSynchronously:(BOOL)a3 withCompletionBlock:(id)a4
{
  BOOL v4 = a3;
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = (void (**)(id, void, uint64_t))a4;
  id v7 = SZGetLoggingHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    unint64_t v22 = self;
    _os_log_impl(&dword_1DD5BF000, v7, OS_LOG_TYPE_DEFAULT, "%@: preparing", buf, 0xCu);
  }

  __int16 v8 = [(SZExtractor *)self extractionPath];

  if (!v8)
  {
    __int16 v11 = SZGetLoggingHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1DD5BF000, v11, OS_LOG_TYPE_ERROR, "extractionPath was nil. Did you mean to call -prepareForExtractionToPath:completionBlock: instead?", buf, 2u);
    }

    _CreateError((uint64_t)"-[SZExtractor _prepareForExtractionSynchronously:withCompletionBlock:]", 622, @"SZExtractorErrorDomain", 3, 0, 0, @"extractionPath was nil. Did you mean to call -prepareForExtractionToPath:completionBlock: instead?", v12, v20);
    goto LABEL_11;
  }
  if ([(SZExtractor *)self hasHadPostSetupMethodsCalled])
  {
    int v9 = SZGetLoggingHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      unint64_t v22 = (SZExtractor *)"-[SZExtractor _prepareForExtractionSynchronously:withCompletionBlock:]";
      _os_log_error_impl(&dword_1DD5BF000, v9, OS_LOG_TYPE_ERROR, "Calling %s after any calls to other non-init methods on this instance is an error.", buf, 0xCu);
    }

    _CreateError((uint64_t)"-[SZExtractor _prepareForExtractionSynchronously:withCompletionBlock:]", 628, @"SZExtractorErrorDomain", 3, 0, 0, @"Calling %s after any calls to other non-init methods on this instance is an error.", v10, (uint64_t)"-[SZExtractor _prepareForExtractionSynchronously:withCompletionBlock:]");
    uint64_t v13 = LABEL_11:;
LABEL_12:
    unint64_t v14 = (void *)v13;
    v6[2](v6, 0, v13);

    goto LABEL_13;
  }
  if ([(SZExtractor *)self needsPreparation])
  {
    if ([(SZExtractor *)self isLocalExtractor]) {
      [(SZExtractor *)self _prepareForLocalExtraction:v6];
    }
    else {
      [(SZExtractor *)self _prepareForRemoteExtractionSynchronously:v4 withCompletionBlock:v6];
    }
  }
  else
  {
    int v15 = [(SZExtractor *)self error];

    unint64_t v16 = SZGetLoggingHandle();
    BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);
    if (v15)
    {
      if (v17)
      {
        unint64_t v18 = [(SZExtractor *)self error];
        *(_DWORD *)buf = 138412546;
        unint64_t v22 = self;
        __int16 v23 = 2112;
        unint64_t v24 = (unint64_t)v18;
        _os_log_impl(&dword_1DD5BF000, v16, OS_LOG_TYPE_DEFAULT, "%@: prepare called on extractor that had already returned error %@", buf, 0x16u);
      }
      uint64_t v13 = [(SZExtractor *)self error];
      goto LABEL_12;
    }
    if (v17)
    {
      unint64_t v19 = [(SZExtractor *)self lastResumptionOffset];
      *(_DWORD *)buf = 138412546;
      unint64_t v22 = self;
      __int16 v23 = 2048;
      unint64_t v24 = v19;
      _os_log_impl(&dword_1DD5BF000, v16, OS_LOG_TYPE_DEFAULT, "%@: prepare called on object that was already prepared; returning resumption offset %llu",
        buf,
        0x16u);
    }

    v6[2](v6, [(SZExtractor *)self lastResumptionOffset], 0);
  }
LABEL_13:
}

- (void)_prepareForLocalExtraction:(id)a3
{
  id v4 = a3;
  int v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  id v6 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.StreamingZip.SZExtractor_in_process", v5);
  serialQueue = self->_serialQueue;
  self->_serialQueue = v6;

  __int16 v8 = [(SZExtractor *)self serialQueue];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __42__SZExtractor__prepareForLocalExtraction___block_invoke;
  v10[3] = &unk_1E6CD1A68;
  v10[4] = self;
  id v11 = v4;
  id v9 = v4;
  dispatch_sync(v8, v10);
}

void __42__SZExtractor__prepareForLocalExtraction___block_invoke(uint64_t a1)
{
  v37[1] = *MEMORY[0x1E4F143B8];
  id v2 = [[StreamingUnzipper alloc] initForClient:@"In-process unzipper" connection:0];
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 48);
  *(void *)(v3 + 48) = v2;

  int v5 = objc_alloc_init(SZExtractorInternalDelegate);
  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = *(void **)(v6 + 64);
  *(void *)(v6 + 64) = v5;

  __int16 v8 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v9 = [*(id *)(a1 + 32) extractionPath];
  char v10 = [v8 fileExistsAtPath:v9];

  if (v10) {
    goto LABEL_4;
  }
  uint64_t v36 = *MEMORY[0x1E4F28330];
  id v11 = [NSNumber numberWithUnsignedShort:16877];
  v37[0] = v11;
  uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v37 forKeys:&v36 count:1];

  uint64_t v13 = [MEMORY[0x1E4F28CB8] defaultManager];
  unint64_t v14 = [*(id *)(a1 + 32) extractionPath];
  id v31 = 0;
  int v15 = [v13 createDirectoryAtPath:v14 withIntermediateDirectories:1 attributes:v12 error:&v31];
  dispatch_queue_t v16 = (dispatch_queue_t)v31;

  if (v15)
  {

LABEL_4:
    BOOL v17 = [*(id *)(a1 + 32) inProcessUnzipper];
    unint64_t v18 = [*(id *)(a1 + 32) extractionPath];
    unint64_t v19 = [*(id *)(a1 + 32) options];
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __42__SZExtractor__prepareForLocalExtraction___block_invoke_2;
    v30[3] = &unk_1E6CD1A40;
    v30[4] = *(void *)(a1 + 32);
    [v17 setupUnzipperWithOutputPath:v18 sandboxExtensionToken:0 options:v19 withReply:v30];

    uint64_t v20 = [*(id *)(a1 + 32) internalExtractorDelegate];
    id v21 = [*(id *)(a1 + 32) inProcessUnzipper];
    [v21 setInProcessExtractorDelegate:v20];

    uint64_t v12 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v16 = dispatch_queue_create("com.apple.StreamingZip.SZExtractor_in_proces_delegate", v12);
    unint64_t v22 = [*(id *)(a1 + 32) inProcessUnzipper];
    [v22 setInProcessDelegateQueue:v16];
    goto LABEL_8;
  }
  __int16 v23 = SZGetLoggingHandle();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
  {
    uint64_t v29 = [*(id *)(a1 + 32) extractionPath];
    *(_DWORD *)buf = 138412546;
    id v33 = v29;
    __int16 v34 = 2112;
    dispatch_queue_t v35 = v16;
    _os_log_error_impl(&dword_1DD5BF000, v23, OS_LOG_TYPE_ERROR, "Failed to create extraction directory at path %@: %@", buf, 0x16u);
  }
  unint64_t v24 = [*(id *)(a1 + 32) extractionPath];
  unint64_t v22 = _CreateError((uint64_t)"-[SZExtractor _prepareForLocalExtraction:]_block_invoke", 594, @"SZExtractorErrorDomain", 1, v16, 0, @"Failed to create extraction directory at path %@: %@", v25, (uint64_t)v24);

  [*(id *)(a1 + 32) setError:v22];
LABEL_8:

  uint64_t v26 = *(void *)(a1 + 40);
  uint64_t v27 = [*(id *)(a1 + 32) lastResumptionOffset];
  id v28 = [*(id *)(a1 + 32) error];
  (*(void (**)(uint64_t, uint64_t, void *))(v26 + 16))(v26, v27, v28);
}

uint64_t __42__SZExtractor__prepareForLocalExtraction___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  [*(id *)(a1 + 32) setError:a2];
  int v5 = *(void **)(a1 + 32);

  return [v5 setLastResumptionOffset:a3];
}

- (void)_prepareForRemoteExtractionSynchronously:(BOOL)a3 withCompletionBlock:(id)a4
{
  id v6 = a4;
  id v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  __int16 v8 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.StreamingZip.SZExtractorBufferSubmissionQueue", v7);
  serialQueue = self->_serialQueue;
  self->_serialQueue = v8;

  char v10 = [(SZExtractor *)self serialQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __76__SZExtractor__prepareForRemoteExtractionSynchronously_withCompletionBlock___block_invoke;
  block[3] = &unk_1E6CD1A18;
  void block[4] = self;
  id v13 = v6;
  BOOL v14 = a3;
  id v11 = v6;
  dispatch_sync(v10, block);
}

void __76__SZExtractor__prepareForRemoteExtractionSynchronously_withCompletionBlock___block_invoke(uint64_t a1)
{
  uint64_t v80 = *MEMORY[0x1E4F143B8];
  bzero(__s, 0x400uLL);
  id v2 = *(void **)(a1 + 32);
  id v71 = 0;
  uint64_t v3 = [v2 _serviceConnectionWithError:&v71];
  id v4 = (char *)v71;
  int v5 = *(void **)(*(void *)(a1 + 32) + 40);
  *(void *)(*(void *)(a1 + 32) + 40) = v3;

  id v6 = [*(id *)(a1 + 32) unzipServiceConnection];
  LODWORD(v3) = v6 == 0;

  if (!v3)
  {
    id v7 = objc_alloc_init(SZExtractorInternalDelegate);
    uint64_t v8 = *(void *)(a1 + 32);
    id v9 = *(void **)(v8 + 64);
    *(void *)(v8 + 64) = v7;

    os_unfair_lock_lock((os_unfair_lock_t)&SZConfiguredStreamingUnzipDelegateProtocolInterface_lock);
    id WeakRetained = objc_loadWeakRetained(&SZConfiguredStreamingUnzipDelegateProtocolInterface_weakInterface);
    if (!WeakRetained)
    {
      id WeakRetained = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F38D26C8];
      objc_storeWeak(&SZConfiguredStreamingUnzipDelegateProtocolInterface_weakInterface, WeakRetained);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)&SZConfiguredStreamingUnzipDelegateProtocolInterface_lock);
    id v11 = [*(id *)(a1 + 32) unzipServiceConnection];
    [v11 setExportedInterface:WeakRetained];

    uint64_t v12 = [*(id *)(a1 + 32) internalExtractorDelegate];
    id v13 = [*(id *)(a1 + 32) unzipServiceConnection];
    [v13 setExportedObject:v12];

    objc_initWeak((id *)location, *(id *)(a1 + 32));
    v69[0] = MEMORY[0x1E4F143A8];
    v69[1] = 3221225472;
    v69[2] = __76__SZExtractor__prepareForRemoteExtractionSynchronously_withCompletionBlock___block_invoke_2;
    v69[3] = &unk_1E6CD19A0;
    objc_copyWeak(&v70, (id *)location);
    uint64_t v14 = [*(id *)(a1 + 32) unzipServiceConnection];
    [(id)v14 setInterruptionHandler:v69];

    v67[0] = MEMORY[0x1E4F143A8];
    v67[1] = 3221225472;
    v67[2] = __76__SZExtractor__prepareForRemoteExtractionSynchronously_withCompletionBlock___block_invoke_2_119;
    v67[3] = &unk_1E6CD19A0;
    objc_copyWeak(&v68, (id *)location);
    int v15 = [*(id *)(a1 + 32) unzipServiceConnection];
    [v15 setInvalidationHandler:v67];

    objc_destroyWeak(&v68);
    objc_destroyWeak(&v70);
    objc_destroyWeak((id *)location);
    dispatch_queue_t v16 = [*(id *)(a1 + 32) unzipServiceConnection];
    [v16 resume];

    BOOL v17 = [MEMORY[0x1E4F28CB8] defaultManager];
    unint64_t v18 = [*(id *)(a1 + 32) extractionPath];
    LOBYTE(v14) = [v17 fileExistsAtPath:v18];

    if (v14)
    {
      unint64_t v19 = v4;
    }
    else
    {
      uint64_t v77 = *MEMORY[0x1E4F28330];
      uint64_t v20 = [NSNumber numberWithUnsignedShort:16877];
      v78 = v20;
      id v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v78 forKeys:&v77 count:1];

      unint64_t v22 = [MEMORY[0x1E4F28CB8] defaultManager];
      __int16 v23 = [*(id *)(a1 + 32) extractionPath];
      __int16 v66 = v4;
      int v24 = [v22 createDirectoryAtPath:v23 withIntermediateDirectories:1 attributes:v21 error:&v66];
      unint64_t v19 = v66;

      if (!v24)
      {
        v40 = SZGetLoggingHandle();
        if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
        {
          unint64_t v60 = [*(id *)(a1 + 32) extractionPath];
          *(_DWORD *)location = 138412546;
          *(void *)&location[4] = v60;
          __int16 v73 = 2112;
          v74 = v19;
          _os_log_error_impl(&dword_1DD5BF000, v40, OS_LOG_TYPE_ERROR, "Failed to create extraction directory at path %@: %@", location, 0x16u);
        }
        unint64_t v41 = [*(id *)(a1 + 32) extractionPath];
        id v43 = _CreateError((uint64_t)"-[SZExtractor _prepareForRemoteExtractionSynchronously:withCompletionBlock:]_block_invoke", 510, @"SZExtractorErrorDomain", 1, v19, 0, @"Failed to create extraction directory at path %@: %@", v42, (uint64_t)v41);

        [*(id *)(a1 + 32) setError:v43];
LABEL_22:
        id v4 = v19;
        goto LABEL_23;
      }
    }
    id v25 = [MEMORY[0x1E4F28CB8] defaultManager];
    uint64_t v26 = [*(id *)(a1 + 32) extractionPath];
    BOOL v27 = realpath_DARWIN_EXTSN((const char *)[v25 fileSystemRepresentationWithPath:v26], __s) == 0;

    if (v27)
    {
      uint64_t v35 = *__error();
      uint64_t v36 = SZGetLoggingHandle();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      {
        v58 = [*(id *)(a1 + 32) extractionPath];
        id v59 = strerror(v35);
        *(_DWORD *)location = 138412802;
        *(void *)&location[4] = v58;
        __int16 v73 = 2080;
        v74 = __s;
        __int16 v75 = 2080;
        v76 = v59;
        _os_log_error_impl(&dword_1DD5BF000, v36, OS_LOG_TYPE_ERROR, "Failed to realpath \"%@\" at \"%s\": %s", location, 0x20u);
      }
      uint64_t v37 = [*(id *)(a1 + 32) extractionPath];
      strerror(v35);
      v39 = _CreateError((uint64_t)"-[SZExtractor _prepareForRemoteExtractionSynchronously:withCompletionBlock:]_block_invoke", 517, (void *)*MEMORY[0x1E4F28798], v35, 0, 0, @"Failed to realpath \"%@\" at \"%s\": %s", v38, (uint64_t)v37);

      [*(id *)(a1 + 32) setError:v39];
    }
    else
    {
      id v28 = (void *)sandbox_extension_issue_file();
      if (v28)
      {
        uint64_t v29 = [MEMORY[0x1E4F28CB8] defaultManager];
        id v30 = [v29 stringWithFileSystemRepresentation:__s length:strlen(__s)];

        v64[0] = MEMORY[0x1E4F143A8];
        v64[1] = 3221225472;
        v64[2] = __76__SZExtractor__prepareForRemoteExtractionSynchronously_withCompletionBlock___block_invoke_2_135;
        v64[3] = &unk_1E6CD19C8;
        uint8_t v64[4] = *(void *)(a1 + 32);
        id v65 = *(id *)(a1 + 40);
        id v31 = (void *)MEMORY[0x1E01BA840](v64);
        BOOL v32 = *(unsigned char *)(a1 + 48) == 0;
        id v33 = [*(id *)(a1 + 32) unzipServiceConnection];
        __int16 v34 = v33;
        if (v32) {
          [v33 remoteObjectProxyWithErrorHandler:v31];
        }
        else {
        uint64_t v56 = [v33 synchronousRemoteObjectProxyWithErrorHandler:v31];
        }

        uint64_t v57 = [*(id *)(a1 + 32) options];
        v62[0] = MEMORY[0x1E4F143A8];
        v62[1] = 3221225472;
        v62[2] = __76__SZExtractor__prepareForRemoteExtractionSynchronously_withCompletionBlock___block_invoke_2_140;
        v62[3] = &unk_1E6CD19F0;
        v62[4] = *(void *)(a1 + 32);
        id v63 = *(id *)(a1 + 40);
        [v56 setupUnzipperWithOutputPath:v30 sandboxExtensionToken:v28 options:v57 withReply:v62];

        free(v28);
        goto LABEL_28;
      }
      uint64_t v44 = *__error();
      v45 = SZGetLoggingHandle();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
      {
        v61 = strerror(v44);
        *(_DWORD *)location = 136315394;
        *(void *)&location[4] = __s;
        __int16 v73 = 2080;
        v74 = v61;
        _os_log_error_impl(&dword_1DD5BF000, v45, OS_LOG_TYPE_ERROR, "Failed to issue sandbox extension for \"%s\" : %s", location, 0x16u);
      }

      strerror(v44);
      id v47 = _CreateError((uint64_t)"-[SZExtractor _prepareForRemoteExtractionSynchronously:withCompletionBlock:]_block_invoke", 525, (void *)*MEMORY[0x1E4F28798], v44, 0, 0, @"Failed to issue sandbox extension for \"%s\" : %s", v46, (uint64_t)__s);
      [*(id *)(a1 + 32) setError:v47];
    }
    goto LABEL_22;
  }
  [*(id *)(a1 + 32) setError:v4];
LABEL_23:
  v48 = SZGetLoggingHandle();
  if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
  {
    v49 = *(void **)(a1 + 32);
    uint64_t v50 = [v49 lastResumptionOffset];
    id v51 = [*(id *)(a1 + 32) error];
    *(_DWORD *)location = 138412802;
    *(void *)&location[4] = v49;
    __int16 v73 = 2048;
    v74 = (char *)v50;
    __int16 v75 = 2112;
    v76 = v51;
    _os_log_impl(&dword_1DD5BF000, v48, OS_LOG_TYPE_DEFAULT, "%@: calling prepare completion block with offset %llu, error %@", location, 0x20u);
  }
  uint64_t v52 = *(void *)(a1 + 40);
  uint64_t v53 = [*(id *)(a1 + 32) lastResumptionOffset];
  uint64_t v54 = [*(id *)(a1 + 32) error];
  (*(void (**)(uint64_t, uint64_t, void *))(v52 + 16))(v52, v53, v54);

  v55 = [*(id *)(a1 + 32) error];

  if (v55) {
    [*(id *)(a1 + 32) _invalidateObject];
  }
  unint64_t v19 = v4;
LABEL_28:
}

void __76__SZExtractor__prepareForRemoteExtractionSynchronously_withCompletionBlock___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = SZGetLoggingHandle();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    LOWORD(v5) = 0;
    _os_log_error_impl(&dword_1DD5BF000, v2, OS_LOG_TYPE_ERROR, "Connection interrupted to streaming unzip service.", (uint8_t *)&v5, 2u);
  }

  id v4 = _CreateError((uint64_t)"-[SZExtractor _prepareForRemoteExtractionSynchronously:withCompletionBlock:]_block_invoke", 490, (void *)*MEMORY[0x1E4F281F8], 4097, 0, 0, @"Connection interrupted to streaming unzip service.", v3, v5);
  [WeakRetained setError:v4];

  [WeakRetained _invalidateObject];
}

void __76__SZExtractor__prepareForRemoteExtractionSynchronously_withCompletionBlock___block_invoke_2_119(uint64_t a1)
{
  v7[1] = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v3 = *MEMORY[0x1E4F281F8];
  uint64_t v6 = *MEMORY[0x1E4F28568];
  v7[0] = @"Connection invalidated to streaming unzip service.";
  id v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:&v6 count:1];
  uint64_t v5 = [v2 errorWithDomain:v3 code:4099 userInfo:v4];
  [WeakRetained setError:v5];

  [WeakRetained _invalidateObject];
}

void __76__SZExtractor__prepareForRemoteExtractionSynchronously_withCompletionBlock___block_invoke_2_135(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = SZGetLoggingHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 138412546;
    uint64_t v7 = v5;
    __int16 v8 = 2112;
    id v9 = v3;
    _os_log_error_impl(&dword_1DD5BF000, v4, OS_LOG_TYPE_ERROR, "%@: prepare returning error %@", (uint8_t *)&v6, 0x16u);
  }

  [*(id *)(a1 + 32) setError:v3];
  [*(id *)(a1 + 32) setLastResumptionOffset:0];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  [*(id *)(a1 + 32) _invalidateObject];
}

void __76__SZExtractor__prepareForRemoteExtractionSynchronously_withCompletionBlock___block_invoke_2_140(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (v5) {
    [*(id *)(a1 + 32) setError:v5];
  }
  [*(id *)(a1 + 32) setLastResumptionOffset:a3];
  int v6 = SZGetLoggingHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = *(void *)(a1 + 32);
    int v8 = 138412802;
    uint64_t v9 = v7;
    __int16 v10 = 2048;
    uint64_t v11 = a3;
    __int16 v12 = 2112;
    id v13 = v5;
    _os_log_impl(&dword_1DD5BF000, v6, OS_LOG_TYPE_DEFAULT, "%@: calling prepare completion block with offset %llu, error %@", (uint8_t *)&v8, 0x20u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  if (v5) {
    [*(id *)(a1 + 32) _invalidateObject];
  }
}

- (id)_serviceConnectionWithError:(id *)a3
{
  if ([(SZExtractor *)self privileged]) {
    id v4 = @"com.apple.StreamingUnzipService.privileged";
  }
  else {
    id v4 = @"com.apple.StreamingUnzipService";
  }
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F29268]) initWithServiceName:v4];
  if (v5)
  {
    os_unfair_lock_lock((os_unfair_lock_t)&SZConfiguredStreamingUnzipProtocolInterface_lock);
    id WeakRetained = objc_loadWeakRetained(&SZConfiguredStreamingUnzipProtocolInterface_weakInterface);
    if (!WeakRetained)
    {
      id WeakRetained = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F38D4810];
      objc_storeWeak(&SZConfiguredStreamingUnzipProtocolInterface_weakInterface, WeakRetained);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)&SZConfiguredStreamingUnzipProtocolInterface_lock);
    [v5 setRemoteObjectInterface:WeakRetained];

    id v7 = 0;
  }
  else
  {
    int v8 = SZGetLoggingHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v11) = 0;
      _os_log_error_impl(&dword_1DD5BF000, v8, OS_LOG_TYPE_ERROR, "Failed to create NSXPCConnection", (uint8_t *)&v11, 2u);
    }

    _CreateError((uint64_t)"-[SZExtractor _serviceConnectionWithError:]", 447, @"SZExtractorErrorDomain", 1, 0, 0, @"Failed to create NSXPCConnection", v9, v11);
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    if (a3)
    {
      id v7 = v7;
      *a3 = v7;
    }
  }

  return v5;
}

- (BOOL)_synchronouslyPrepareForExtractionAtOffset:(unint64_t *)a3
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 1;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __58__SZExtractor__synchronouslyPrepareForExtractionAtOffset___block_invoke;
  v5[3] = &unk_1E6CD1978;
  v5[4] = self;
  v5[5] = &v6;
  v5[6] = a3;
  [(SZExtractor *)self _prepareForExtractionSynchronously:1 withCompletionBlock:v5];
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __58__SZExtractor__synchronouslyPrepareForExtractionAtOffset___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5)
  {
    uint64_t v6 = SZGetLoggingHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      int v8 = 138412546;
      uint64_t v9 = v7;
      __int16 v10 = 2112;
      id v11 = v5;
      _os_log_error_impl(&dword_1DD5BF000, v6, OS_LOG_TYPE_ERROR, "%@: prepare for extraction failed: %@", (uint8_t *)&v8, 0x16u);
    }

    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
  }
  else
  {
    **(void **)(a1 + 48) = a2;
  }
}

- (id)initForLocalExtractionWithPath:(id)a3 options:(id)a4 resumptionOffset:(unint64_t *)a5
{
  uint64_t v6 = [(SZExtractor *)self initWithPath:a3 options:a4];
  uint64_t v7 = v6;
  if (v6
    && (v6->_isLocalExtractor = 1,
        ![(SZExtractor *)v6 _synchronouslyPrepareForExtractionAtOffset:a5]))
  {
    int v8 = 0;
  }
  else
  {
    int v8 = v7;
  }

  return v8;
}

- (id)initForRemoteExtractionWithPath:(id)a3 options:(id)a4 resumptionOffset:(unint64_t *)a5
{
  uint64_t v6 = [(SZExtractor *)self initWithPath:a3 options:a4];
  uint64_t v7 = v6;
  if (v6
    && (v6->_isLocalExtractor = 0,
        ![(SZExtractor *)v6 _synchronouslyPrepareForExtractionAtOffset:a5]))
  {
    int v8 = 0;
  }
  else
  {
    int v8 = v7;
  }

  return v8;
}

- (SZExtractor)initWithPath:(id)a3 md5Hashes:(id)a4 hashedChunkSize:(unint64_t)a5 resumptionOffset:(unint64_t *)a6
{
  __int16 v10 = (void *)MEMORY[0x1E4F1C9E8];
  id v11 = NSNumber;
  id v12 = a4;
  id v13 = a3;
  uint64_t v14 = [v11 numberWithUnsignedLongLong:a5];
  int v15 = objc_msgSend(v10, "dictionaryWithObjectsAndKeys:", @"SZExtractorHashTypeMD5", @"SZExtractorOptionsHashType", v12, @"SZExtractorOptionsHashesArray", v14, @"SZExtractorOptionsHashedChunkSize", 0);

  dispatch_queue_t v16 = [(SZExtractor *)self initWithPath:v13 options:v15 resumptionOffset:a6];
  return v16;
}

- (SZExtractor)initWithPath:(id)a3 options:(id)a4 resumptionOffset:(unint64_t *)a5
{
  uint64_t v6 = [(SZExtractor *)self initWithPath:a3 options:a4];
  uint64_t v7 = v6;
  if (v6
    && ![(SZExtractor *)v6 _synchronouslyPrepareForExtractionAtOffset:a5])
  {
    int v8 = 0;
  }
  else
  {
    int v8 = v7;
  }

  return v8;
}

- (SZExtractor)initWithPath:(id)a3 resumptionOffset:(unint64_t *)a4
{
  return [(SZExtractor *)self initWithPath:a3 options:0 resumptionOffset:a4];
}

- (SZExtractor)initWithPath:(id)a3 options:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)SZExtractor;
  int v8 = [(SZExtractor *)&v11 init];
  uint64_t v9 = v8;
  if (v8) {
    [(SZExtractor *)v8 _setUpWithPath:v6 options:v7];
  }

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  id v5 = [(SZExtractor *)self extractionPath];
  id v6 = [(SZExtractor *)self options];
  id v7 = (unsigned char *)[v4 initWithPath:v5 options:v6];

  if (self->_isLocalExtractor) {
    v7[9] = 1;
  }
  if (self->_privileged) {
    v7[8] = 1;
  }
  return v7;
}

- (unint64_t)hash
{
  char v3 = [(SZExtractor *)self extractionPath];

  id v4 = [(SZExtractor *)self options];
  unint64_t v5 = [v4 hash];
  if (v3)
  {
    id v6 = [(SZExtractor *)self extractionPath];
    v5 ^= [v6 hash];
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    id v6 = [v5 options];
    id v7 = [(SZExtractor *)self options];
    int v8 = [v6 isEqual:v7];

    if (!v8) {
      goto LABEL_13;
    }
    uint64_t v9 = [v5 extractionPath];
    if (v9)
    {
      __int16 v10 = (void *)v9;
      objc_super v11 = [(SZExtractor *)self extractionPath];

      if (!v11) {
        goto LABEL_13;
      }
    }
    id v12 = [v5 extractionPath];
    if (v12)
    {
    }
    else
    {
      id v21 = [(SZExtractor *)self extractionPath];

      if (v21) {
        goto LABEL_13;
      }
    }
    uint64_t v13 = [v5 extractionPath];
    if (v13)
    {
      uint64_t v14 = (void *)v13;
      uint64_t v15 = [(SZExtractor *)self extractionPath];
      if (v15)
      {
        dispatch_queue_t v16 = (void *)v15;
        BOOL v17 = [v5 extractionPath];
        unint64_t v18 = [(SZExtractor *)self extractionPath];
        int v19 = [v17 isEqual:v18];

        if (v19) {
          goto LABEL_15;
        }
LABEL_13:
        LOBYTE(v20) = 0;
LABEL_16:

        goto LABEL_17;
      }
    }
LABEL_15:
    int v22 = [v5 privileged];
    int v20 = v22 ^ [(SZExtractor *)self privileged] ^ 1;
    goto LABEL_16;
  }
  LOBYTE(v20) = 0;
LABEL_17:

  return v20;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (![(SZExtractor *)self needsPreparation]
    && [(SZExtractor *)self _isValidObject])
  {
    id v5 = SZGetLoggingHandle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      __int16 v10 = self;
      _os_log_impl(&dword_1DD5BF000, v5, OS_LOG_TYPE_DEFAULT, "%@: suspending stream in preparation for serializing ourselves", buf, 0xCu);
    }

    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __31__SZExtractor_encodeWithCoder___block_invoke;
    v8[3] = &unk_1E6CD1950;
    v8[4] = self;
    [(SZExtractor *)self _suspendStreamWithCompletionBlockSynchronously:1 completion:v8];
  }
  [v4 encodeObject:self->_options forKey:@"options"];
  extractionPath = self->_extractionPath;
  if (extractionPath) {
    [v4 encodeObject:extractionPath forKey:@"extractionPath"];
  }
  [v4 encodeBool:self->_isLocalExtractor forKey:@"isLocalExtractor"];
  [v4 encodeBool:self->_privileged forKey:@"privileged"];
  id v7 = SZGetLoggingHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    __int16 v10 = self;
    _os_log_impl(&dword_1DD5BF000, v7, OS_LOG_TYPE_DEFAULT, "%@: serialized", buf, 0xCu);
  }
}

void __31__SZExtractor_encodeWithCoder___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    id v5 = SZGetLoggingHandle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      int v7 = 138412546;
      uint64_t v8 = v6;
      __int16 v9 = 2112;
      id v10 = v4;
      _os_log_error_impl(&dword_1DD5BF000, v5, OS_LOG_TYPE_ERROR, "%@: Suspending stream prior to encoding failed with error: %@", (uint8_t *)&v7, 0x16u);
    }
  }
}

- (SZExtractor)initWithCoder:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)SZExtractor;
  id v5 = [(SZExtractor *)&v15 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodePropertyListForKey:@"options"];
    options = v5->_options;
    v5->_options = (NSDictionary *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"extractionPath"];
    extractionPath = v5->_extractionPath;
    v5->_extractionPath = (NSString *)v8;

    v5->_isLocalExtractor = [v4 decodeBoolForKey:@"isLocalExtractor"];
    v5->_privileged = [v4 decodeBoolForKey:@"privileged"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v10 = [v4 connection];
      v5->_isLocalExtractor = 0;
      uint64_t v11 = [v10 valueForEntitlement:@"com.apple.private.SZExtractor.privileged"];
      char v12 = [v11 BOOLValue];

      if ((v12 & 1) == 0) {
        v5->_privileged = 0;
      }
    }
    uint64_t v13 = SZGetLoggingHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      BOOL v17 = v5;
      _os_log_impl(&dword_1DD5BF000, v13, OS_LOG_TYPE_DEFAULT, "%@: deserialized", buf, 0xCu);
    }
  }
  return v5;
}

- (SZExtractor)init
{
  os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
  _os_log_send_and_compose_impl();
  result = (SZExtractor *)_os_crash_msg();
  __break(1u);
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (int)servicePIDWithError:(id *)a3
{
  uint64_t v20 = 0;
  id v21 = (id *)&v20;
  uint64_t v22 = 0x3032000000;
  __int16 v23 = __Block_byref_object_copy_;
  int v24 = __Block_byref_object_dispose_;
  id v25 = 0;
  uint64_t v16 = 0;
  BOOL v17 = &v16;
  uint64_t v18 = 0x2020000000;
  int v19 = -1;
  id v4 = [SZExtractor alloc];
  id v5 = [(SZExtractor *)v4 initWithOptions:MEMORY[0x1E4F1CC08]];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __44__SZExtractor_Testing__servicePIDWithError___block_invoke;
  v15[3] = &unk_1E6CD1CC0;
  v15[4] = &v20;
  uint64_t v6 = (void *)MEMORY[0x1E01BA840](v15);
  int v7 = v21;
  id obj = v21[5];
  uint64_t v8 = [(SZExtractor *)v5 _serviceConnectionWithError:&obj];
  objc_storeStrong(v7 + 5, obj);
  if (!v8)
  {
    id v10 = 0;
    if (!a3) {
      goto LABEL_9;
    }
    goto LABEL_7;
  }
  [v8 resume];
  __int16 v9 = [v8 synchronousRemoteObjectProxyWithErrorHandler:v6];
  id v10 = v9;
  if (v9)
  {
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __44__SZExtractor_Testing__servicePIDWithError___block_invoke_2;
    v13[3] = &unk_1E6CD1CE8;
    v13[4] = &v20;
    v13[5] = &v16;
    [v9 getPidForTestingWithReply:v13];
  }
  if (a3)
  {
LABEL_7:
    if (*((_DWORD *)v17 + 6) == -1) {
      *a3 = v21[5];
    }
  }
LABEL_9:
  [v8 invalidate];
  int v11 = *((_DWORD *)v17 + 6);

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v20, 8);

  return v11;
}

void __44__SZExtractor_Testing__servicePIDWithError___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = SZGetLoggingHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v7 = 138412290;
    id v8 = v3;
    _os_log_error_impl(&dword_1DD5BF000, v4, OS_LOG_TYPE_ERROR, "remoteObjectProxy returning error %@", (uint8_t *)&v7, 0xCu);
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
}

void __44__SZExtractor_Testing__servicePIDWithError___block_invoke_2(uint64_t a1, int a2, void *a3)
{
  id v6 = a3;
  if (a2 < 0)
  {
    id v7 = v6;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
    id v6 = v7;
  }
  else
  {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  }
}

@end
@interface STRemoteExtractor
+ (BOOL)supportsSecureCoding;
+ (id)STAEAExtractorWithOptions:(id)a3;
+ (id)fullReplacementSTAEAExtractor:(id)a3;
+ (id)incrementalPatchSTAEAExtractor:(id)a3 srcDirectory:(id)a4;
- (BOOL)dataStreamStarted;
- (BOOL)doesConsumeExtractedData;
- (BOOL)finalBytesSent;
- (BOOL)isInvalid;
- (BOOL)isPrepared;
- (BOOL)privileged;
- (BOOL)setSourceDirectory:(id)a3 sandboxExtension:(id)a4;
- (BOOL)suppressCompletionsDuringShutdown;
- (ExtractionServiceInfo)extractionServiceInfo;
- (NSData)archiveID;
- (NSData)asymmetricDecryptionKey;
- (NSData)signingPublicKey;
- (NSData)symmetricDecryptionKey;
- (NSDictionary)options;
- (NSError)error;
- (NSString)pluginBundlePath;
- (NSString)pluginDirectory;
- (NSString)sessionID;
- (NSString)sourceDirectory;
- (NSXPCConnection)extractionServiceConnection;
- (OS_dispatch_queue)ioQueue;
- (OS_dispatch_queue)reservationQueue;
- (STExtractionOriginator)internalExtractionOriginator;
- (STExtractorDelegate)extractorDelegate;
- (STRemoteExtractor)init;
- (STRemoteExtractor)initWithCoder:(id)a3;
- (STRemoteExtractor)initWithOptions:(id)a3;
- (id)_reserveExtractionMemory;
- (id)copyWithZone:(_NSZone *)a3;
- (id)createOutputDir:(id)a3;
- (unint64_t)lastResumptionOffset;
- (unint64_t)requiredExtractionMemory;
- (unint64_t)reservedExtractionMemory;
- (void)_checkForInvalidExtractionMemoryReservation;
- (void)_invalidate;
- (void)_releaseExtractionMemory;
- (void)_sendData:(id)a3 completion:(id)a4;
- (void)dealloc;
- (void)doesConsumeExtractedData;
- (void)encodeWithCoder:(id)a3;
- (void)finishStreamWithCompletionBlock:(id)a3;
- (void)init;
- (void)prepareForExtractionToPath:(id)a3 completionBlock:(id)a4;
- (void)remote_extractionCompleteAtArchivePath:(id)a3;
- (void)remote_extractionEnteredPassthroughMode;
- (void)remote_setExtractionProgress:(double)a3;
- (void)setArchiveID:(id)a3;
- (void)setAsymmetricDecryptionKey:(id)a3;
- (void)setDataStreamStarted:(BOOL)a3;
- (void)setError:(id)a3;
- (void)setExtractorDelegate:(id)a3;
- (void)setFinalBytesSent:(BOOL)a3;
- (void)setIsInvalid:(BOOL)a3;
- (void)setIsPrepared:(BOOL)a3;
- (void)setLastResumptionOffset:(unint64_t)a3;
- (void)setOption:(id)a3 forKey:(id)a4;
- (void)setPluginBundlePath:(id)a3;
- (void)setPluginDirectory:(id)a3;
- (void)setPrivileged:(BOOL)a3;
- (void)setRequiredExtractionMemory:(unint64_t)a3;
- (void)setReservedExtractionMemory:(unint64_t)a3;
- (void)setSessionID:(id)a3;
- (void)setSigningPublicKey:(id)a3;
- (void)setSourceDirectory:(id)a3;
- (void)setSymmetricDecryptionKey:(id)a3;
- (void)supplyBytes:(id)a3 withCompletionBlock:(id)a4;
- (void)suppressCompletionsDuringShutdown;
- (void)suspendStreamWithCompletionBlock:(id)a3;
- (void)terminateStreamWithError:(id)a3 completionBlock:(id)a4;
@end

@implementation STRemoteExtractor

+ (id)STAEAExtractorWithOptions:(id)a3
{
  id v3 = a3;
  v4 = [[STRemoteExtractor alloc] initWithOptions:v3];
  if (v3)
  {
    v5 = [v3 objectForKeyedSubscript:@"STAEAExtractorSourceDirectory"];
    if (v5)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        p_super = STGetLogHandle();
        if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR)) {
          +[STRemoteExtractor(STAEAExtractor) STAEAExtractorWithOptions:]();
        }
        v6 = v4;
        goto LABEL_18;
      }
      v6 = [v3 objectForKeyedSubscript:@"STAEAExtractorSourceDirectorySandboxExtension<Private>"];
      if (v6)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v7 = STGetLogHandle();
          if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
            +[STRemoteExtractor(STAEAExtractor) STAEAExtractorWithOptions:]();
          }

          p_super = &v4->super;
LABEL_18:

          v4 = 0;
          goto LABEL_11;
        }
      }
      else
      {
        [(STRemoteExtractor *)v4 setSourceDirectory:v5 sandboxExtension:0];
      }
    }
LABEL_11:
  }
  return v4;
}

+ (id)fullReplacementSTAEAExtractor:(id)a3
{
  v10[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    v9[0] = @"STRemoteExtractorPluginBundleName";
    v9[1] = @"STRemoteExtractorSessionID";
    v10[0] = @"STAEAExtractionPlugin";
    v10[1] = v4;
    v6 = [NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:2];
    v7 = [a1 STAEAExtractorWithOptions:v6];
  }
  else
  {
    v6 = STGetLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      +[STRemoteExtractor(STAEAExtractor) fullReplacementSTAEAExtractor:]();
    }
    v7 = 0;
  }

  return v7;
}

+ (id)incrementalPatchSTAEAExtractor:(id)a3 srcDirectory:(id)a4
{
  v14[3] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = v7;
  if (v6)
  {
    if (v7)
    {
      v13[0] = @"STRemoteExtractorPluginBundleName";
      v13[1] = @"STRemoteExtractorSessionID";
      v14[0] = @"STAEAExtractionPlugin";
      v14[1] = v6;
      v13[2] = @"STAEAExtractorSourceDirectory";
      v14[2] = v7;
      v9 = [NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:3];
      v10 = [a1 STAEAExtractorWithOptions:v9];
      goto LABEL_4;
    }
    v12 = STGetLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      +[STRemoteExtractor(STAEAExtractor) incrementalPatchSTAEAExtractor:srcDirectory:]();
    }
  }
  else
  {
    v12 = STGetLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      +[STRemoteExtractor(STAEAExtractor) incrementalPatchSTAEAExtractor:srcDirectory:]();
    }
  }

  v9 = 0;
  v10 = 0;
LABEL_4:

  return v10;
}

- (NSData)symmetricDecryptionKey
{
  v2 = [(STRemoteExtractor *)self options];
  id v3 = [v2 objectForKeyedSubscript:@"STAEAExtractorSymmetricEncryptionKey<Private>"];

  return (NSData *)v3;
}

- (void)setSymmetricDecryptionKey:(id)a3
{
}

- (NSData)asymmetricDecryptionKey
{
  v2 = [(STRemoteExtractor *)self options];
  id v3 = [v2 objectForKeyedSubscript:@"STAEAExtractorAsymmetricDecryptionKey<Private>"];

  return (NSData *)v3;
}

- (void)setAsymmetricDecryptionKey:(id)a3
{
}

- (NSData)signingPublicKey
{
  v2 = [(STRemoteExtractor *)self options];
  id v3 = [v2 objectForKeyedSubscript:@"STAEAExtractorSigningPublicKey<Private>"];

  return (NSData *)v3;
}

- (void)setSigningPublicKey:(id)a3
{
}

- (NSString)sourceDirectory
{
  v2 = [(STRemoteExtractor *)self options];
  id v3 = [v2 objectForKeyedSubscript:@"STAEAExtractorSourceDirectory"];

  return (NSString *)v3;
}

- (void)setSourceDirectory:(id)a3
{
}

- (BOOL)setSourceDirectory:(id)a3 sandboxExtension:(id)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  bzero(__s, 0x400uLL);
  id v6 = (void *)MEMORY[0x263F08850];
  id v7 = a3;
  id v8 = [v6 defaultManager];
  v9 = (const char *)[v8 fileSystemRepresentationWithPath:v7];

  v10 = realpath_DARWIN_EXTSN(v9, __s);
  if (!v10)
  {
    v14 = STGetLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[STRemoteExtractor(STAEAExtractor) setSourceDirectory:sandboxExtension:]();
    }
    goto LABEL_9;
  }
  v11 = [MEMORY[0x263F08850] defaultManager];
  v12 = [v11 stringWithFileSystemRepresentation:__s length:strlen(__s)];
  [(STRemoteExtractor *)self setOption:v12 forKey:@"STAEAExtractorSourceDirectory"];

  uint64_t v13 = sandbox_extension_issue_file();
  if (!v13)
  {
    v14 = STGetLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[STRemoteExtractor(STAEAExtractor) setSourceDirectory:sandboxExtension:]((uint64_t)__s, v14);
    }
LABEL_9:
    BOOL v15 = 0;
    goto LABEL_4;
  }
  v14 = [NSString stringWithCString:v13 encoding:4];
  [(STRemoteExtractor *)self setOption:v14 forKey:@"STAEAExtractorSourceDirectorySandboxExtension<Private>"];
  BOOL v15 = 1;
LABEL_4:

  return v15;
}

- (NSData)archiveID
{
  v2 = [(STRemoteExtractor *)self options];
  id v3 = [v2 objectForKeyedSubscript:@"STAEAExtractorArchiveID"];

  return (NSData *)v3;
}

- (void)setArchiveID:(id)a3
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (STRemoteExtractor)init
{
  id v3 = STGetLogHandle();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    -[STRemoteExtractor init](v3);
  }

  return 0;
}

- (STRemoteExtractor)initWithOptions:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)STRemoteExtractor;
  v5 = [(STRemoteExtractor *)&v9 init];
  if (v5)
  {
    if (v4)
    {
      uint64_t v6 = [v4 mutableCopy];
    }
    else
    {
      uint64_t v6 = [MEMORY[0x263EFF9A0] dictionary];
    }
    options = v5->_options;
    v5->_options = (NSMutableDictionary *)v6;
  }
  [(STRemoteExtractor *)v5 setIsPrepared:0];
  [(STRemoteExtractor *)v5 setIsInvalid:0];
  [(STRemoteExtractor *)v5 setDataStreamStarted:0];
  [(STRemoteExtractor *)v5 setFinalBytesSent:0];

  return v5;
}

- (STRemoteExtractor)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(STRemoteExtractor *)self initWithOptions:0];
  if (v5)
  {
    uint64_t v6 = [v4 decodePropertyListForKey:@"options"];
    options = v5->_options;
    v5->_options = (NSMutableDictionary *)v6;

    v5->_privileged = [v4 decodeBoolForKey:@"privileged"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v8 = [v4 connection];
      objc_super v9 = [v8 valueForEntitlement:@"com.apple.private.STRemoteExtractor.privileged"];
      char v10 = [v9 BOOLValue];

      if ((v10 & 1) == 0) {
        v5->_privileged = 0;
      }
    }
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  id v4 = [(STRemoteExtractor *)self options];
  [v5 encodeObject:v4 forKey:@"options"];

  objc_msgSend(v5, "encodeBool:forKey:", -[STRemoteExtractor privileged](self, "privileged"), @"privileged");
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  id v5 = [(STRemoteExtractor *)self options];
  uint64_t v6 = (void *)[v4 initWithOptions:v5];

  objc_msgSend(v6, "setPrivileged:", -[STRemoteExtractor privileged](self, "privileged"));
  return v6;
}

- (void)dealloc
{
  [(STRemoteExtractor *)self _invalidate];
  v3.receiver = self;
  v3.super_class = (Class)STRemoteExtractor;
  [(STRemoteExtractor *)&v3 dealloc];
}

- (void)setOption:(id)a3 forKey:(id)a4
{
}

- (id)createOutputDir:(id)a3
{
  v21[1] = *MEMORY[0x263EF8340];
  id v3 = a3;
  uint64_t v20 = *MEMORY[0x263F08078];
  id v4 = [NSNumber numberWithUnsignedShort:16877];
  v21[0] = v4;
  id v5 = [NSDictionary dictionaryWithObjects:v21 forKeys:&v20 count:1];

  uint64_t v6 = STGetLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v17 = "-[STRemoteExtractor createOutputDir:]";
    __int16 v18 = 2112;
    id v19 = v3;
    _os_log_impl(&dword_21FAFD000, v6, OS_LOG_TYPE_DEFAULT, "%{public}s: Creating output dir: %@", buf, 0x16u);
  }

  id v7 = [MEMORY[0x263F08850] defaultManager];
  id v15 = 0;
  char v8 = [v7 createDirectoryAtPath:v3 withIntermediateDirectories:1 attributes:v5 error:&v15];
  id v9 = v15;

  char v10 = 0;
  if ((v8 & 1) == 0)
  {
    v12 = STGetLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[STRemoteExtractor createOutputDir:]();
    }

    uint64_t v13 = STExtractorErrorDomain;
    v14 = [NSString stringWithFormat:@"Failed to create extraction directory at path %@: %@", v3, 0];
    char v10 = STCreateError(v13, 4, v14, v9, (uint64_t)"-[STRemoteExtractor createOutputDir:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/StreamingExtractor/StreamingExtractor_Framework/STRemoteExtractor.m", 363);
  }
  return v10;
}

- (NSString)pluginBundlePath
{
  v2 = [(STRemoteExtractor *)self options];
  id v3 = [v2 objectForKeyedSubscript:@"STRemoteExtractorPluginBundlePath"];

  return (NSString *)v3;
}

- (void)setPluginBundlePath:(id)a3
{
}

- (NSString)pluginDirectory
{
  v2 = [(STRemoteExtractor *)self options];
  id v3 = [v2 objectForKeyedSubscript:@"STRemoteExtractorPluginDirectory"];

  return (NSString *)v3;
}

- (void)setPluginDirectory:(id)a3
{
}

- (NSString)sessionID
{
  v2 = [(STRemoteExtractor *)self options];
  id v3 = [v2 objectForKeyedSubscript:@"STRemoteExtractorSessionID"];

  return (NSString *)v3;
}

- (void)setSessionID:(id)a3
{
}

- (BOOL)suppressCompletionsDuringShutdown
{
  v2 = [(STRemoteExtractor *)self options];
  id v3 = [v2 objectForKeyedSubscript:@"STRemoteExtractorSuppressCompletionsDuringShutdown"];

  if (!v3)
  {
LABEL_7:
    char v4 = 1;
    goto LABEL_8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v5 = STGetLogHandle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[STRemoteExtractor suppressCompletionsDuringShutdown]();
    }

    goto LABEL_7;
  }
  char v4 = [v3 BOOLValue];
LABEL_8:

  return v4;
}

- (id)_reserveExtractionMemory
{
  id v3 = [(STRemoteExtractor *)self extractionServiceInfo];
  char v4 = [v3 reserveExtractionMemory:self];

  return v4;
}

- (void)_releaseExtractionMemory
{
  id v3 = [(STRemoteExtractor *)self extractionServiceInfo];
  [v3 releaseExtractionMemory:self];
}

- (void)_checkForInvalidExtractionMemoryReservation
{
  if ([(STRemoteExtractor *)self isInvalid])
  {
    id v3 = [(STRemoteExtractor *)self extractionServiceInfo];
    [v3 extractionBecameInvalid];
  }
}

- (BOOL)doesConsumeExtractedData
{
  v2 = [(STRemoteExtractor *)self options];
  id v3 = [v2 objectForKeyedSubscript:@"STRemoteExtractorDoesConsumeExtractedData"];

  if (!v3)
  {
LABEL_7:
    char v4 = 0;
    goto LABEL_8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v5 = STGetLogHandle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[STRemoteExtractor doesConsumeExtractedData]();
    }

    goto LABEL_7;
  }
  char v4 = [v3 BOOLValue];
LABEL_8:

  return v4;
}

- (void)prepareForExtractionToPath:(id)a3 completionBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v6)
  {
    v14 = STGetLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[STRemoteExtractor prepareForExtractionToPath:completionBlock:]();
    }

    id v15 = STExtractorErrorDomain;
    uint64_t v13 = [NSString stringWithFormat:@"No path to extract to"];
    v16 = v15;
    uint64_t v17 = 3;
    __int16 v18 = v13;
    uint64_t v19 = 505;
    goto LABEL_15;
  }
  char v8 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.StreamingExtractor.STRemoteExtractorIOQueue", 0);
  ioQueue = self->_ioQueue;
  self->_ioQueue = v8;

  if (!self->_ioQueue)
  {
    uint64_t v20 = STGetLogHandle();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      -[STRemoteExtractor prepareForExtractionToPath:completionBlock:]();
    }

    v21 = STExtractorErrorDomain;
    uint64_t v13 = [NSString stringWithFormat:@"Failed to create displatch queue for I/O"];
    v16 = v21;
    uint64_t v17 = 1;
    __int16 v18 = v13;
    uint64_t v19 = 508;
    goto LABEL_15;
  }
  dispatch_get_global_queue(21, 0);
  char v10 = (OS_dispatch_queue *)objc_claimAutoreleasedReturnValue();
  reservationQueue = self->_reservationQueue;
  self->_reservationQueue = v10;

  if (!self->_reservationQueue)
  {
    v22 = STGetLogHandle();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      -[STRemoteExtractor prepareForExtractionToPath:completionBlock:]();
    }

    v23 = STExtractorErrorDomain;
    uint64_t v13 = [NSString stringWithFormat:@"Failed to get global concurrent queue for extraction memory reservations"];
    v16 = v23;
    uint64_t v17 = 1;
    __int16 v18 = v13;
    uint64_t v19 = 511;
LABEL_15:
    v24 = STCreateError(v16, v17, v18, 0, (uint64_t)"-[STRemoteExtractor prepareForExtractionToPath:completionBlock:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/StreamingExtractor/StreamingExtractor_Framework/STRemoteExtractor.m", v19);
    [(STRemoteExtractor *)self setError:v24];

    goto LABEL_5;
  }
  v12 = [(STRemoteExtractor *)self ioQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __64__STRemoteExtractor_prepareForExtractionToPath_completionBlock___block_invoke;
  block[3] = &unk_264528CE8;
  id v26 = v6;
  v27 = self;
  id v28 = v7;
  dispatch_async(v12, block);

  uint64_t v13 = v26;
LABEL_5:
}

void __64__STRemoteExtractor_prepareForExtractionToPath_completionBlock___block_invoke(uint64_t a1)
{
  uint64_t v114 = *MEMORY[0x263EF8340];
  bzero(__s, 0x400uLL);
  memset(&v100, 0, sizeof(v100));
  v112[0] = 0;
  v112[1] = 0;
  v2 = STGetLogHandle();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = *(char **)(a1 + 32);
    *(_DWORD *)buf = 136446466;
    v102 = "-[STRemoteExtractor prepareForExtractionToPath:completionBlock:]_block_invoke";
    __int16 v103 = 2112;
    v104 = v3;
    _os_log_impl(&dword_21FAFD000, v2, OS_LOG_TYPE_DEFAULT, "%{public}s: path: %@", buf, 0x16u);
  }

  if ([*(id *)(a1 + 40) isPrepared])
  {
    v67 = STGetLogHandle();
    if (os_log_type_enabled(v67, OS_LOG_TYPE_ERROR)) {
      __64__STRemoteExtractor_prepareForExtractionToPath_completionBlock___block_invoke_cold_1();
    }

    v68 = STExtractorErrorDomain;
    v48 = [NSString stringWithFormat:@"-prepare... called on already prepared extractor"];
    v69 = STCreateError(v68, 8, v48, 0, (uint64_t)"-[STRemoteExtractor prepareForExtractionToPath:completionBlock:]_block_invoke", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/StreamingExtractor/StreamingExtractor_Framework/STRemoteExtractor.m", 528);
    [*(id *)(a1 + 40) setError:v69];

    goto LABEL_47;
  }
  char v4 = [*(id *)(a1 + 40) pluginBundlePath];
  if (!v4)
  {
    id v5 = [*(id *)(a1 + 40) pluginDirectory];
    BOOL v6 = v5 == 0;

    if (v6)
    {
      char v8 = [*(id *)(a1 + 40) options];
      char v4 = [v8 objectForKeyedSubscript:@"STRemoteExtractorPluginBundleName"];
    }
    else
    {
      id v7 = NSString;
      char v8 = [*(id *)(a1 + 40) pluginDirectory];
      v111[0] = v8;
      id v9 = NSString;
      char v10 = [*(id *)(a1 + 40) options];
      v11 = [v10 objectForKeyedSubscript:@"STRemoteExtractorPluginBundleName"];
      v12 = [v9 stringWithFormat:@"%@.bundle", v11];
      v111[1] = v12;
      uint64_t v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v111 count:2];
      char v4 = [v7 pathWithComponents:v13];
    }
    if (!v4)
    {
      v70 = STGetLogHandle();
      if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR)) {
        __64__STRemoteExtractor_prepareForExtractionToPath_completionBlock___block_invoke_cold_2();
      }

      v71 = STExtractorErrorDomain;
      v48 = [NSString stringWithFormat:@"-prepare... called without valid plugin bundle/path"];
      v72 = STCreateError(v71, 8, v48, 0, (uint64_t)"-[STRemoteExtractor prepareForExtractionToPath:completionBlock:]_block_invoke", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/StreamingExtractor/StreamingExtractor_Framework/STRemoteExtractor.m", 538);
      [*(id *)(a1 + 40) setError:v72];

LABEL_47:
      char v4 = 0;
LABEL_57:
      v47 = 0;
      goto LABEL_58;
    }
  }
  v14 = (id *)(a1 + 40);
  if ([*(id *)(a1 + 40) privileged]) {
    id v15 = @"com.apple.STExtractionService.privileged";
  }
  else {
    id v15 = @"com.apple.STExtractionService";
  }
  uint64_t v16 = [objc_alloc(MEMORY[0x263F08D68]) initWithServiceName:v15];
  uint64_t v17 = (void *)*((void *)*v14 + 7);
  *((void *)*v14 + 7) = v16;

  __int16 v18 = [*v14 extractionServiceConnection];
  BOOL v19 = v18 == 0;

  if (v19)
  {
    v73 = STGetLogHandle();
    if (os_log_type_enabled(v73, OS_LOG_TYPE_ERROR)) {
      __64__STRemoteExtractor_prepareForExtractionToPath_completionBlock___block_invoke_cold_3();
    }

    v74 = STExtractorErrorDomain;
    v48 = [NSString stringWithFormat:@"Failed to create NSXPCConnection"];
    v75 = STCreateError(v74, 2, v48, 0, (uint64_t)"-[STRemoteExtractor prepareForExtractionToPath:completionBlock:]_block_invoke", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/StreamingExtractor/StreamingExtractor_Framework/STRemoteExtractor.m", 550);
    [*(id *)(a1 + 40) setError:v75];

    goto LABEL_57;
  }
  uint64_t v20 = objc_alloc_init(STExtractionOriginator);
  uint64_t v21 = *(void *)(a1 + 40);
  v22 = *(void **)(v21 + 72);
  *(void *)(v21 + 72) = v20;

  v23 = *(void **)(a1 + 40);
  v24 = [v23 internalExtractionOriginator];
  [v24 setOriginator:v23];

  v25 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26D158C90];
  id v26 = [*(id *)(a1 + 40) extractionServiceConnection];
  [v26 setRemoteObjectInterface:v25];

  v27 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26D1576D0];
  id v28 = [*(id *)(a1 + 40) extractionServiceConnection];
  [v28 setExportedInterface:v27];

  v29 = [*(id *)(a1 + 40) internalExtractionOriginator];
  v30 = [*(id *)(a1 + 40) extractionServiceConnection];
  [v30 setExportedObject:v29];

  uint64_t v31 = +[ExtractionServiceInfo extractionServiceInfoForPluginBundlePath:v4];
  v32 = *(void **)(*(void *)(a1 + 40) + 64);
  *(void *)(*(void *)(a1 + 40) + 64) = v31;

  v33 = [*(id *)(a1 + 40) extractionServiceInfo];
  LODWORD(v29) = v33 == 0;

  if (v29)
  {
    v76 = STGetLogHandle();
    if (os_log_type_enabled(v76, OS_LOG_TYPE_ERROR)) {
      __64__STRemoteExtractor_prepareForExtractionToPath_completionBlock___block_invoke_cold_4();
    }

    v77 = STExtractorErrorDomain;
    v48 = [NSString stringWithFormat:@"Unable to create internal ExtractionServiceInfo object to track extraction service"];
    v78 = STCreateError(v77, 1, v48, 0, (uint64_t)"-[STRemoteExtractor prepareForExtractionToPath:completionBlock:]_block_invoke", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/StreamingExtractor/StreamingExtractor_Framework/STRemoteExtractor.m", 561);
    [*(id *)(a1 + 40) setError:v78];

    goto LABEL_57;
  }
  v34 = [*(id *)(a1 + 40) extractionServiceInfo];
  v35 = [v34 uuid];
  [v35 getUUIDBytes:v112];

  v36 = [*(id *)(a1 + 40) extractionServiceConnection];
  v37 = [v36 _xpcConnection];
  xpc_connection_set_oneshot_instance();

  objc_initWeak((id *)buf, *(id *)(a1 + 40));
  v98[0] = MEMORY[0x263EF8330];
  v98[1] = 3221225472;
  v98[2] = __64__STRemoteExtractor_prepareForExtractionToPath_completionBlock___block_invoke_2;
  v98[3] = &unk_264528CC0;
  objc_copyWeak(&v99, (id *)buf);
  uint64_t v38 = [*(id *)(a1 + 40) extractionServiceConnection];
  [(id)v38 setInterruptionHandler:v98];

  v96[0] = MEMORY[0x263EF8330];
  v96[1] = 3221225472;
  v96[2] = __64__STRemoteExtractor_prepareForExtractionToPath_completionBlock___block_invoke_4;
  v96[3] = &unk_264528CC0;
  objc_copyWeak(&v97, (id *)buf);
  v39 = [*(id *)(a1 + 40) extractionServiceConnection];
  [v39 setInvalidationHandler:v96];

  objc_destroyWeak(&v97);
  objc_destroyWeak(&v99);
  objc_destroyWeak((id *)buf);
  v40 = [*(id *)(a1 + 40) extractionServiceConnection];
  [v40 resume];

  v41 = [MEMORY[0x263F08850] defaultManager];
  LOBYTE(v38) = [v41 fileExistsAtPath:*(void *)(a1 + 32)];

  if ((v38 & 1) == 0)
  {
    uint64_t v42 = [*(id *)(a1 + 40) createOutputDir:*(void *)(a1 + 32)];
    [*(id *)(a1 + 40) setError:v42];

    v43 = [*(id *)(a1 + 40) error];
    LOBYTE(v42) = v43 == 0;

    if ((v42 & 1) == 0)
    {
      v48 = STGetLogHandle();
      if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR)) {
        __64__STRemoteExtractor_prepareForExtractionToPath_completionBlock___block_invoke_cold_10();
      }
      goto LABEL_57;
    }
  }
  id v44 = [MEMORY[0x263F08850] defaultManager];
  v45 = realpath_DARWIN_EXTSN((const char *)[v44 fileSystemRepresentationWithPath:*(void *)(a1 + 32)], __s);

  if (!v45)
  {
    v79 = STGetLogHandle();
    if (os_log_type_enabled(v79, OS_LOG_TYPE_ERROR)) {
      __64__STRemoteExtractor_prepareForExtractionToPath_completionBlock___block_invoke_cold_5();
    }

    int v80 = *__error();
    v48 = [NSString stringWithFormat:@"Failed to realpath \"%@\" at \"%s\": %s", *(void *)(a1 + 32), __s, strerror(v80)];
    v81 = STCreateError((void *)*MEMORY[0x263F08438], v80, v48, 0, (uint64_t)"-[STRemoteExtractor prepareForExtractionToPath:completionBlock:]_block_invoke", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/StreamingExtractor/StreamingExtractor_Framework/STRemoteExtractor.m", 607);
    [*(id *)(a1 + 40) setError:v81];

    goto LABEL_57;
  }
  v46 = [MEMORY[0x263F08850] defaultManager];
  v47 = [v46 stringWithFileSystemRepresentation:__s length:strlen(__s)];

  v100.st_mode = 0;
  if (stat(__s, &v100))
  {
    v48 = 0;
  }
  else
  {
    if ((v100.st_mode & 0xF000) == 0x4000) {
      goto LABEL_21;
    }
    v61 = STGetLogHandle();
    if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446466;
      v102 = "-[STRemoteExtractor prepareForExtractionToPath:completionBlock:]_block_invoke";
      __int16 v103 = 2080;
      v104 = __s;
      _os_log_impl(&dword_21FAFD000, v61, OS_LOG_TYPE_DEFAULT, "%{public}s: Existing path is not a directory - removing and recreating: %s", buf, 0x16u);
    }

    v62 = [MEMORY[0x263F08850] defaultManager];
    id v95 = 0;
    char v63 = [v62 removeItemAtPath:v47 error:&v95];
    v48 = v95;

    if ((v63 & 1) == 0)
    {
      v64 = STGetLogHandle();
      if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR)) {
        __64__STRemoteExtractor_prepareForExtractionToPath_completionBlock___block_invoke_cold_9((uint64_t)__s, (uint64_t)v48, v64);
      }

      v65 = STGetLogHandle();
      if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR)) {
        __64__STRemoteExtractor_prepareForExtractionToPath_completionBlock___block_invoke_cold_8(v65);
      }
    }
  }
  v49 = [*(id *)(a1 + 40) createOutputDir:v47];
  [*(id *)(a1 + 40) setError:v49];

  v50 = [*(id *)(a1 + 40) error];
  LODWORD(v49) = v50 == 0;

  if (v49)
  {

LABEL_21:
    v51 = (void *)sandbox_extension_issue_file();
    if (!v51)
    {
      v52 = STGetLogHandle();
      if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR)) {
        __64__STRemoteExtractor_prepareForExtractionToPath_completionBlock___block_invoke_cold_6((uint64_t)__s, v52);
      }
    }
    v53 = [*(id *)(a1 + 40) extractionServiceConnection];
    v93[0] = MEMORY[0x263EF8330];
    v93[1] = 3221225472;
    v93[2] = __64__STRemoteExtractor_prepareForExtractionToPath_completionBlock___block_invoke_104;
    v93[3] = &unk_264528D10;
    v93[4] = *(void *)(a1 + 40);
    id v94 = *(id *)(a1 + 48);
    v54 = [v53 remoteObjectProxyWithErrorHandler:v93];

    [*(id *)(a1 + 40) setIsPrepared:1];
    v55 = [*(id *)(a1 + 40) options];
    v56 = (void *)[v55 mutableCopy];

    v109 = @"STRemoteExtractorFrameworkPath";
    v57 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v58 = [v57 bundlePath];
    v110 = v58;
    v59 = [NSDictionary dictionaryWithObjects:&v110 forKeys:&v109 count:1];
    [v56 addEntriesFromDictionary:v59];

    if (v51)
    {
      v60 = [NSString stringWithCString:v51 encoding:4];
    }
    else
    {
      v60 = 0;
    }
    v91[0] = MEMORY[0x263EF8330];
    v91[1] = 3221225472;
    v91[2] = __64__STRemoteExtractor_prepareForExtractionToPath_completionBlock___block_invoke_2_108;
    v91[3] = &unk_264528D60;
    v66 = *(void **)(a1 + 48);
    v91[4] = *(void *)(a1 + 40);
    id v92 = v66;
    objc_msgSend(v54, "remote_prepareForExtractionToPath:sandboxExtensionToken:options:withCompletionBlock:", v47, v60, v56, v91);
    if (v51)
    {

      free(v51);
    }
    else
    {
    }
    goto LABEL_40;
  }
  v90 = STGetLogHandle();
  if (os_log_type_enabled(v90, OS_LOG_TYPE_ERROR)) {
    __64__STRemoteExtractor_prepareForExtractionToPath_completionBlock___block_invoke_cold_7();
  }

LABEL_58:
  v82 = STGetLogHandle();
  if (os_log_type_enabled(v82, OS_LOG_TYPE_DEFAULT))
  {
    v83 = *(void **)(a1 + 40);
    uint64_t v84 = [v83 lastResumptionOffset];
    v85 = [*(id *)(a1 + 40) error];
    *(_DWORD *)buf = 136446978;
    v102 = "-[STRemoteExtractor prepareForExtractionToPath:completionBlock:]_block_invoke";
    __int16 v103 = 2112;
    v104 = (char *)v83;
    __int16 v105 = 2048;
    uint64_t v106 = v84;
    __int16 v107 = 2112;
    v108 = v85;
    _os_log_impl(&dword_21FAFD000, v82, OS_LOG_TYPE_DEFAULT, "%{public}s: %@: calling prepare completion block with offset %llu, error %@", buf, 0x2Au);
  }
  uint64_t v86 = *(void *)(a1 + 48);
  uint64_t v87 = [*(id *)(a1 + 40) lastResumptionOffset];
  v88 = [*(id *)(a1 + 40) error];
  (*(void (**)(uint64_t, uint64_t, void *))(v86 + 16))(v86, v87, v88);

  v89 = [*(id *)(a1 + 40) error];
  LOBYTE(v86) = v89 == 0;

  if ((v86 & 1) == 0) {
    [*(id *)(a1 + 40) _invalidate];
  }
LABEL_40:
}

void __64__STRemoteExtractor_prepareForExtractionToPath_completionBlock___block_invoke_2(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    char v4 = [WeakRetained ioQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __64__STRemoteExtractor_prepareForExtractionToPath_completionBlock___block_invoke_3;
    block[3] = &unk_264528CC0;
    objc_copyWeak(&v6, v1);
    dispatch_async(v4, block);

    objc_destroyWeak(&v6);
  }
}

uint64_t __64__STRemoteExtractor_prepareForExtractionToPath_completionBlock___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    char v4 = WeakRetained;
    if (([WeakRetained isInvalid] & 1) == 0)
    {
      v2 = STCreateError((void *)*MEMORY[0x263F07F70], 4097, @"Connection interrupted to streaming extraction service", 0, (uint64_t)"-[STRemoteExtractor prepareForExtractionToPath:completionBlock:]_block_invoke_3", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/StreamingExtractor/StreamingExtractor_Framework/STRemoteExtractor.m", 575);
      [v4 setError:v2];

      [v4 _invalidate];
    }
  }
  return MEMORY[0x270F9A758]();
}

void __64__STRemoteExtractor_prepareForExtractionToPath_completionBlock___block_invoke_4(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    char v4 = [WeakRetained ioQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __64__STRemoteExtractor_prepareForExtractionToPath_completionBlock___block_invoke_5;
    block[3] = &unk_264528CC0;
    objc_copyWeak(&v6, v1);
    dispatch_async(v4, block);

    objc_destroyWeak(&v6);
  }
}

uint64_t __64__STRemoteExtractor_prepareForExtractionToPath_completionBlock___block_invoke_5(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    char v4 = WeakRetained;
    if (([WeakRetained isInvalid] & 1) == 0)
    {
      v2 = STCreateError((void *)*MEMORY[0x263F07F70], 4099, @"Connection invalidated to streaming extraction service", 0, (uint64_t)"-[STRemoteExtractor prepareForExtractionToPath:completionBlock:]_block_invoke_5", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/StreamingExtractor/StreamingExtractor_Framework/STRemoteExtractor.m", 590);
      [v4 setError:v2];

      [v4 _invalidate];
    }
  }
  return MEMORY[0x270F9A758]();
}

void __64__STRemoteExtractor_prepareForExtractionToPath_completionBlock___block_invoke_104(uint64_t a1, void *a2)
{
  id v3 = a2;
  char v4 = STGetLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __64__STRemoteExtractor_prepareForExtractionToPath_completionBlock___block_invoke_104_cold_1();
  }

  id v5 = [*(id *)(a1 + 32) ioQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __64__STRemoteExtractor_prepareForExtractionToPath_completionBlock___block_invoke_105;
  block[3] = &unk_264528CE8;
  id v6 = *(void **)(a1 + 40);
  void block[4] = *(void *)(a1 + 32);
  id v9 = v3;
  id v10 = v6;
  id v7 = v3;
  dispatch_async(v5, block);
}

uint64_t __64__STRemoteExtractor_prepareForExtractionToPath_completionBlock___block_invoke_105(uint64_t a1)
{
  [*(id *)(a1 + 32) setError:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) setLastResumptionOffset:0];
  [*(id *)(a1 + 32) _invalidate];
  uint64_t result = *(void *)(a1 + 48);
  if (result)
  {
    id v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

void __64__STRemoteExtractor_prepareForExtractionToPath_completionBlock___block_invoke_2_108(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a4;
  id v9 = STGetLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 136446978;
    v23 = "-[STRemoteExtractor prepareForExtractionToPath:completionBlock:]_block_invoke_2";
    __int16 v24 = 2112;
    uint64_t v25 = v10;
    __int16 v26 = 2048;
    uint64_t v27 = a3;
    __int16 v28 = 2112;
    id v29 = v8;
    _os_log_impl(&dword_21FAFD000, v9, OS_LOG_TYPE_DEFAULT, "%{public}s: %@: prepare completed with offset %llu, error %@", buf, 0x2Au);
  }

  v11 = [*(id *)(a1 + 32) ioQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __64__STRemoteExtractor_prepareForExtractionToPath_completionBlock___block_invoke_109;
  block[3] = &unk_264528D38;
  uint64_t v12 = *(void *)(a1 + 32);
  uint64_t v13 = *(void **)(a1 + 40);
  id v17 = v8;
  uint64_t v18 = v12;
  uint64_t v21 = a3;
  id v19 = v7;
  id v20 = v13;
  id v14 = v7;
  id v15 = v8;
  dispatch_async(v11, block);
}

uint64_t __64__STRemoteExtractor_prepareForExtractionToPath_completionBlock___block_invoke_109(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  if (*(void *)(a1 + 32))
  {
    objc_msgSend(*(id *)(a1 + 40), "setError:");
    [*(id *)(a1 + 40) _invalidate];
  }
  [*(id *)(a1 + 40) setLastResumptionOffset:*(void *)(a1 + 64)];
  [*(id *)(a1 + 40) setRequiredExtractionMemory:1024];
  if (*(void *)(a1 + 48))
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v2 = [*(id *)(a1 + 48) objectForKeyedSubscript:@"STRemoteExtractorMemoryFootprint"];
      if (v2)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          objc_msgSend(*(id *)(a1 + 40), "setRequiredExtractionMemory:", objc_msgSend(v2, "unsignedLongLongValue"));
        }
      }
    }
  }
  id v3 = STGetLogHandle();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    char v4 = *(void **)(a1 + 40);
    int v10 = 136446722;
    v11 = "-[STRemoteExtractor prepareForExtractionToPath:completionBlock:]_block_invoke";
    __int16 v12 = 2112;
    uint64_t v13 = v4;
    __int16 v14 = 2048;
    uint64_t v15 = [v4 requiredExtractionMemory];
    _os_log_impl(&dword_21FAFD000, v3, OS_LOG_TYPE_DEFAULT, "%{public}s: %@: extractor requires %zu bytes extraction memory", (uint8_t *)&v10, 0x20u);
  }

  id v5 = STGetLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = *(void *)(a1 + 64);
    uint64_t v8 = *(void *)(a1 + 32);
    id v7 = *(void **)(a1 + 40);
    int v10 = 136446978;
    v11 = "-[STRemoteExtractor prepareForExtractionToPath:completionBlock:]_block_invoke";
    __int16 v12 = 2112;
    uint64_t v13 = v7;
    __int16 v14 = 2048;
    uint64_t v15 = v6;
    __int16 v16 = 2112;
    uint64_t v17 = v8;
    _os_log_impl(&dword_21FAFD000, v5, OS_LOG_TYPE_DEFAULT, "%{public}s: %@: calling prepare completion block with offset %llu, error %@", (uint8_t *)&v10, 0x2Au);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 56) + 16))();
}

- (void)_invalidate
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  if (![(STRemoteExtractor *)self isInvalid])
  {
    id v3 = STGetLogHandle();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 136446466;
      uint64_t v8 = "-[STRemoteExtractor _invalidate]";
      __int16 v9 = 2112;
      int v10 = self;
      _os_log_impl(&dword_21FAFD000, v3, OS_LOG_TYPE_DEFAULT, "%{public}s: %@: invalidating", (uint8_t *)&v7, 0x16u);
    }
  }
  [(STRemoteExtractor *)self setIsInvalid:1];
  char v4 = [(STRemoteExtractor *)self extractionServiceConnection];

  if (v4)
  {
    id v5 = [(STRemoteExtractor *)self extractionServiceConnection];
    [v5 invalidate];

    extractionServiceConnection = self->_extractionServiceConnection;
    self->_extractionServiceConnection = 0;
  }
  [(STRemoteExtractor *)self _releaseExtractionMemory];
  [(STRemoteExtractor *)self _checkForInvalidExtractionMemoryReservation];
}

- (void)_sendData:(id)a3 completion:(id)a4
{
  uint64_t v109 = *MEMORY[0x263EF8340];
  id v65 = a3;
  id v60 = a4;
  char v63 = self;
  uint64_t v6 = [(STRemoteExtractor *)self error];

  if (v6)
  {
    v50 = STGetLogHandle();
    if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR)) {
      -[STRemoteExtractor _sendData:completion:].cold.7(self);
    }

    v46 = [(STRemoteExtractor *)self error];
    if (v46) {
      goto LABEL_71;
    }
    goto LABEL_72;
  }
  if (![(STRemoteExtractor *)self isPrepared])
  {
    v51 = STGetLogHandle();
    if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR)) {
      -[STRemoteExtractor _sendData:completion:].cold.6();
    }

    v52 = STExtractorErrorDomain;
    v53 = [NSString stringWithFormat:@"%s called before -prepareForExtraction on %@", "-[STRemoteExtractor _sendData:completion:]", self];
    v46 = STCreateError(v52, 7, v53, 0, (uint64_t)"-[STRemoteExtractor _sendData:completion:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/StreamingExtractor/StreamingExtractor_Framework/STRemoteExtractor.m", 739);

    goto LABEL_70;
  }
  if ([(STRemoteExtractor *)self isInvalid])
  {
    v54 = STGetLogHandle();
    if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR)) {
      -[STRemoteExtractor _sendData:completion:]();
    }

    v55 = STExtractorErrorDomain;
    v56 = [NSString stringWithFormat:@"-supplyBytes: called on invalid extractor"];
    v46 = STCreateError(v55, 8, v56, 0, (uint64_t)"-[STRemoteExtractor _sendData:completion:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/StreamingExtractor/StreamingExtractor_Framework/STRemoteExtractor.m", 740);

    goto LABEL_70;
  }
  int v7 = [(STRemoteExtractor *)self extractionServiceConnection];

  if (!v7)
  {
    v57 = STGetLogHandle();
    if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR)) {
      -[STRemoteExtractor _sendData:completion:]();
    }

    v58 = STExtractorErrorDomain;
    v59 = [NSString stringWithFormat:@"no service connection for extraction service"];
    v46 = STCreateError(v58, 1, v59, 0, (uint64_t)"-[STRemoteExtractor _sendData:completion:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/StreamingExtractor/StreamingExtractor_Framework/STRemoteExtractor.m", 742);

    goto LABEL_70;
  }
  dispatch_group_t v8 = dispatch_group_create();
  v95[0] = 0;
  v95[1] = v95;
  v95[2] = 0x3032000000;
  v95[3] = __Block_byref_object_copy_;
  v95[4] = __Block_byref_object_dispose_;
  id v96 = 0;
  v93[0] = 0;
  v93[1] = v93;
  v93[2] = 0x2020000000;
  char v94 = 0;
  v89[0] = MEMORY[0x263EF8330];
  v89[1] = 3221225472;
  v89[2] = __42__STRemoteExtractor__sendData_completion___block_invoke;
  v89[3] = &unk_264528D88;
  v91 = v95;
  id v92 = v93;
  dispatch_group_t group = v8;
  dispatch_group_t v90 = group;
  v61 = (void *)MEMORY[0x223C5AA30](v89);
  unint64_t v9 = [v65 length];
  if (v9 - 4194305 >= 0xFFFFFFFFFFC00000)
  {
    pthread_mutex_lock(&_sAvailableExtractionBufferMutex);
    if (_sAvailableExtractionBuffer >= v9) {
      _sAvailableExtractionBuffer -= v9;
    }
    else {
      unint64_t v9 = 0;
    }
    pthread_mutex_unlock(&_sAvailableExtractionBufferMutex);
  }
  else
  {
    unint64_t v9 = 0;
  }
  if (v9 != [v65 length])
  {
    __int16 v16 = STGetLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
      -[STRemoteExtractor _sendData:completion:].cold.5(v108, [v65 length], v16);
    }

    uint64_t v17 = STGetSignpostHandle();
    if (os_signpost_enabled(v17))
    {
      uint64_t v18 = [v65 length];
      *(_DWORD *)buf = 134217984;
      *(void *)&uint8_t buf[4] = v18;
      _os_signpost_emit_with_name_impl(&dword_21FAFD000, v17, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "FRAGMENT_DATA", "Starting fragmentation of supplied buffer (%lu bytes)", buf, 0xCu);
    }

    unint64_t v19 = 0;
    v64 = 0;
    uint64_t v20 = 0x7FFFFFFFFFFFFFFFLL;
    while (1)
    {
      if (v19 >= [v65 length])
      {
        uint64_t v15 = STGetSignpostHandle();
        if (os_signpost_enabled(v15))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_21FAFD000, v15, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "FRAGMENT_DATA", "Ending fragmentation of the supplied buffer", buf, 2u);
        }
        goto LABEL_68;
      }
      uint64_t v79 = 0;
      int v80 = &v79;
      uint64_t v81 = 0x2020000000;
      uint64_t v82 = 0;
      if (v20 == 0x7FFFFFFFFFFFFFFFLL) {
        break;
      }
      unint64_t v24 = (unint64_t)v64 + v20 - v19;
      if (v24)
      {
        pthread_mutex_lock(&_sAvailableExtractionBufferMutex);
        unint64_t v25 = _sAvailableExtractionBuffer;
        if (!((unint64_t)_sAvailableExtractionBuffer >> 17))
        {
          do
          {
            pthread_cond_wait(&_sAvailableExtractionBufferCondition, &_sAvailableExtractionBufferMutex);
            unint64_t v25 = _sAvailableExtractionBuffer;
          }
          while ((unint64_t)_sAvailableExtractionBuffer < 0x20000);
        }
        if (v25 < v24) {
          unint64_t v24 = v25;
        }
        _sAvailableExtractionBuffer = v25 - v24;
        pthread_mutex_unlock(&_sAvailableExtractionBufferMutex);
        __int16 v26 = v80;
      }
      else
      {
        __int16 v26 = &v79;
      }
      v26[3] = v24;
      uint64_t v27 = STGetLogHandle();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v42 = v80[3];
        *(_DWORD *)buf = 136447234;
        *(void *)&uint8_t buf[4] = "-[STRemoteExtractor _sendData:completion:]";
        *(_WORD *)&buf[12] = 2048;
        *(void *)&buf[14] = v42;
        *(_WORD *)&buf[22] = 2048;
        v98 = (void *)v19;
        *(_WORD *)id v99 = 2048;
        *(void *)&v99[2] = v20;
        *(_WORD *)&v99[10] = 2048;
        *(void *)&v99[12] = v64;
        _os_log_debug_impl(&dword_21FAFD000, v27, OS_LOG_TYPE_DEBUG, "%{public}s: Reserved %ld bytes at %ld for too-big partial range {%lu, %lu}", buf, 0x34u);
      }

LABEL_55:
      uint64_t v31 = STGetLogHandle();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
      {
        v41 = (void *)v80[3];
        *(_DWORD *)buf = 136446722;
        *(void *)&uint8_t buf[4] = "-[STRemoteExtractor _sendData:completion:]";
        *(_WORD *)&buf[12] = 2048;
        *(void *)&buf[14] = v19;
        *(_WORD *)&buf[22] = 2048;
        v98 = v41;
        _os_log_debug_impl(&dword_21FAFD000, v31, OS_LOG_TYPE_DEBUG, "%{public}s: Supplying byte range {%lu, %lu}", buf, 0x20u);
      }

      v32 = objc_msgSend(v65, "subdataWithRange:", v19, v80[3]);
      dispatch_group_enter(group);
      v33 = STGetSignpostHandle();
      if (os_signpost_enabled(v33))
      {
        uint64_t v34 = [v32 length];
        *(_DWORD *)buf = 134217984;
        *(void *)&uint8_t buf[4] = v34;
        _os_signpost_emit_with_name_impl(&dword_21FAFD000, v33, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "DATA_OVER_XPC", "Sending buffer (%lu bytes) to the extraction service over XPC", buf, 0xCu);
      }

      v35 = [(STRemoteExtractor *)v63 extractionServiceConnection];
      v74[0] = MEMORY[0x263EF8330];
      v74[1] = 3221225472;
      v74[2] = __42__STRemoteExtractor__sendData_completion___block_invoke_138;
      v74[3] = &unk_264528E28;
      id v36 = v61;
      id v76 = v36;
      v77 = &v79;
      id v37 = v32;
      id v75 = v37;
      uint64_t v38 = [v35 remoteObjectProxyWithErrorHandler:v74];
      v70[0] = MEMORY[0x263EF8330];
      v70[1] = 3221225472;
      v70[2] = __42__STRemoteExtractor__sendData_completion___block_invoke_139;
      v70[3] = &unk_264528E50;
      id v72 = v36;
      v73 = &v79;
      id v39 = v37;
      id v71 = v39;
      objc_msgSend(v38, "remote_supplyBytes:withCompletionBlock:", v39, v70);

      v19 += v80[3];
      if (v20 != 0x7FFFFFFFFFFFFFFFLL)
      {
        if (v19 < (unint64_t)v64 + v20) {
          goto LABEL_65;
        }
        v40 = STGetLogHandle();
        if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136446722;
          *(void *)&uint8_t buf[4] = "-[STRemoteExtractor _sendData:completion:]";
          *(_WORD *)&buf[12] = 2048;
          *(void *)&buf[14] = v20;
          *(_WORD *)&buf[22] = 2048;
          v98 = v64;
          _os_log_debug_impl(&dword_21FAFD000, v40, OS_LOG_TYPE_DEBUG, "%{public}s: Active partial range {%lu, %lu} exhausted", buf, 0x20u);
        }

        v64 = 0;
      }
      uint64_t v20 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_65:

      _Block_object_dispose(&v79, 8);
    }
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3010000000;
    v98 = &unk_21FB0BA17;
    *(_OWORD *)id v99 = xmmword_21FB09470;
    v78[0] = MEMORY[0x263EF8330];
    v78[1] = 3221225472;
    v78[2] = __42__STRemoteExtractor__sendData_completion___block_invoke_132;
    v78[3] = &unk_264528E00;
    v78[5] = buf;
    v78[6] = v19;
    v78[4] = &v79;
    [v65 enumerateByteRangesUsingBlock:v78];
    if (!v80[3])
    {
      uint64_t v20 = *(void *)(*(void *)&buf[8] + 32);
      if (v20 == 0x7FFFFFFFFFFFFFFFLL)
      {
        v47 = STGetLogHandle();
        if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR)) {
          -[STRemoteExtractor _sendData:completion:].cold.4();
        }

        v48 = STExtractorErrorDomain;
        v49 = [NSString stringWithFormat:@"internal error processing byte ranges"];
        v46 = STCreateError(v48, 1, v49, 0, (uint64_t)"-[STRemoteExtractor _sendData:completion:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/StreamingExtractor/StreamingExtractor_Framework/STRemoteExtractor.m", 836);

        _Block_object_dispose(buf, 8);
        _Block_object_dispose(&v79, 8);
        goto LABEL_69;
      }
      unint64_t v21 = *(void *)(*(void *)&buf[8] + 40);
      if (v21 > 0x400000)
      {
        pthread_mutex_lock(&_sAvailableExtractionBufferMutex);
        unint64_t v28 = _sAvailableExtractionBuffer;
        if (!((unint64_t)_sAvailableExtractionBuffer >> 17))
        {
          do
          {
            pthread_cond_wait(&_sAvailableExtractionBufferCondition, &_sAvailableExtractionBufferMutex);
            unint64_t v28 = _sAvailableExtractionBuffer;
          }
          while ((unint64_t)_sAvailableExtractionBuffer < 0x20000);
        }
        if (v28 >= v21) {
          unint64_t v29 = v21;
        }
        else {
          unint64_t v29 = v28;
        }
        _sAvailableExtractionBuffer = v28 - v29;
        pthread_mutex_unlock(&_sAvailableExtractionBufferMutex);
        v80[3] = v29;
        uint64_t v30 = STGetLogHandle();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v44 = v80[3];
          *(_DWORD *)stat v100 = 136446978;
          v101 = "-[STRemoteExtractor _sendData:completion:]";
          __int16 v102 = 2048;
          uint64_t v103 = v44;
          __int16 v104 = 2048;
          uint64_t v105 = v20;
          __int16 v106 = 2048;
          unint64_t v107 = v21;
          _os_log_debug_impl(&dword_21FAFD000, v30, OS_LOG_TYPE_DEBUG, "%{public}s: Reserved %ld bytes for too-big partial range {%lu, %lu}", v100, 0x2Au);
        }

        v64 = (void *)v21;
        goto LABEL_54;
      }
      v22 = STGetLogHandle();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v43 = *(void *)(*(void *)&buf[8] + 40);
        *(_DWORD *)stat v100 = 136446466;
        v101 = "-[STRemoteExtractor _sendData:completion:]";
        __int16 v102 = 2048;
        uint64_t v103 = v43;
        _os_log_debug_impl(&dword_21FAFD000, v22, OS_LOG_TYPE_DEBUG, "%{public}s: Waiting for %lu bytes to become available", v100, 0x16u);
      }

      unint64_t v23 = *(void *)(*(void *)&buf[8] + 40);
      if (v23)
      {
        pthread_mutex_lock(&_sAvailableExtractionBufferMutex);
        while (_sAvailableExtractionBuffer < v23)
          pthread_cond_wait(&_sAvailableExtractionBufferCondition, &_sAvailableExtractionBufferMutex);
        _sAvailableExtractionBuffer -= v23;
        pthread_mutex_unlock(&_sAvailableExtractionBufferMutex);
      }
      v80[3] = v23;
    }
    uint64_t v20 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_54:
    _Block_object_dispose(buf, 8);
    goto LABEL_55;
  }
  int v10 = STGetLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    -[STRemoteExtractor _sendData:completion:](v9, v10);
  }

  dispatch_group_enter(group);
  uint64_t v11 = STGetSignpostHandle();
  if (os_signpost_enabled(v11))
  {
    *(_DWORD *)buf = 134217984;
    *(void *)&uint8_t buf[4] = v9;
    _os_signpost_emit_with_name_impl(&dword_21FAFD000, v11, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "DATA_OVER_XPC", "Sending buffer (%lu bytes) to extraction service over XPC", buf, 0xCu);
  }

  __int16 v12 = [(STRemoteExtractor *)self extractionServiceConnection];
  v86[0] = MEMORY[0x263EF8330];
  v86[1] = 3221225472;
  v86[2] = __42__STRemoteExtractor__sendData_completion___block_invoke_126;
  v86[3] = &unk_264528DB0;
  uint64_t v13 = v61;
  uint64_t v87 = v13;
  unint64_t v88 = v9;
  __int16 v14 = [v12 remoteObjectProxyWithErrorHandler:v86];
  v83[0] = MEMORY[0x263EF8330];
  v83[1] = 3221225472;
  v83[2] = __42__STRemoteExtractor__sendData_completion___block_invoke_127;
  v83[3] = &unk_264528DD8;
  uint64_t v84 = v13;
  unint64_t v85 = v9;
  objc_msgSend(v14, "remote_supplyBytes:withCompletionBlock:", v65, v83);

  uint64_t v15 = v87;
LABEL_68:

  v45 = [(STRemoteExtractor *)v63 ioQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __42__STRemoteExtractor__sendData_completion___block_invoke_140;
  block[3] = &unk_264528E78;
  v68 = v95;
  void block[4] = v63;
  id v67 = v60;
  v69 = v93;
  dispatch_group_notify(group, v45, block);

  v46 = 0;
LABEL_69:

  _Block_object_dispose(v93, 8);
  _Block_object_dispose(v95, 8);

LABEL_70:
  if (v46) {
LABEL_71:
  }
    (*((void (**)(id, void *, uint64_t))v60 + 2))(v60, v46, 1);
LABEL_72:
}

void __42__STRemoteExtractor__sendData_completion___block_invoke(uint64_t a1, void *a2, char a3, uint64_t a4)
{
  id v11 = a2;
  uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v10 = *(void *)(v8 + 40);
  unint64_t v9 = (id *)(v8 + 40);
  if (!v10) {
    objc_storeStrong(v9, a2);
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = a3;
  pthread_mutex_lock(&_sAvailableExtractionBufferMutex);
  _sAvailableExtractionBuffer += a4;
  pthread_cond_signal(&_sAvailableExtractionBufferCondition);
  pthread_mutex_unlock(&_sAvailableExtractionBufferMutex);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __42__STRemoteExtractor__sendData_completion___block_invoke_126(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v3 = a2;
  char v4 = STGetLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __42__STRemoteExtractor__sendData_completion___block_invoke_126_cold_1((uint64_t)v3, v4);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  id v5 = STGetSignpostHandle();
  if (os_signpost_enabled(v5))
  {
    uint64_t v6 = *(void *)(a1 + 40);
    int v7 = 134217984;
    uint64_t v8 = v6;
    _os_signpost_emit_with_name_impl(&dword_21FAFD000, v5, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "DATA_OVER_XPC", "Finished (FAILED) processing buffer (%lu bytes) sent to extraction service over XPC", (uint8_t *)&v7, 0xCu);
  }
}

void __42__STRemoteExtractor__sendData_completion___block_invoke_127(uint64_t a1, uint64_t a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  char v4 = STGetSignpostHandle();
  if (os_signpost_enabled(v4))
  {
    id v5 = "FAILED";
    uint64_t v6 = *(void *)(a1 + 40);
    if (!a2) {
      id v5 = "SUCCEEDED";
    }
    int v7 = 136315394;
    uint64_t v8 = v5;
    __int16 v9 = 2048;
    uint64_t v10 = v6;
    _os_signpost_emit_with_name_impl(&dword_21FAFD000, v4, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "DATA_OVER_XPC", "Finished (%s) processing buffer (%lu bytes) sent to extraction service over XPC", (uint8_t *)&v7, 0x16u);
  }
}

void __42__STRemoteExtractor__sendData_completion___block_invoke_132(void *a1, uint64_t a2, uint64_t a3, unint64_t a4, unsigned char *a5)
{
  if (a3 + a4 <= a1[6])
  {
    uint64_t v10 = STGetLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      __42__STRemoteExtractor__sendData_completion___block_invoke_132_cold_3();
    }
  }
  else
  {
    if (a4 - 4194305 >= 0xFFFFFFFFFFC00000)
    {
      pthread_mutex_lock(&_sAvailableExtractionBufferMutex);
      if (_sAvailableExtractionBuffer >= a4)
      {
        _sAvailableExtractionBuffer -= a4;
        unint64_t v9 = a4;
      }
      else
      {
        unint64_t v9 = 0;
      }
      pthread_mutex_unlock(&_sAvailableExtractionBufferMutex);
    }
    else
    {
      unint64_t v9 = 0;
    }
    uint64_t v11 = STGetLogHandle();
    BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG);
    if (v9 == a4)
    {
      if (v12) {
        __42__STRemoteExtractor__sendData_completion___block_invoke_132_cold_1();
      }

      *(void *)(*(void *)(a1[4] + 8) + 24) += a4;
    }
    else
    {
      if (v12) {
        __42__STRemoteExtractor__sendData_completion___block_invoke_132_cold_2();
      }

      uint64_t v13 = *(void *)(a1[5] + 8);
      *(void *)(v13 + 32) = a3;
      *(void *)(v13 + 40) = a4;
      *a5 = 1;
    }
  }
}

void __42__STRemoteExtractor__sendData_completion___block_invoke_138(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  v2 = STGetSignpostHandle();
  if (os_signpost_enabled(v2))
  {
    uint64_t v3 = [*(id *)(a1 + 32) length];
    int v4 = 134217984;
    uint64_t v5 = v3;
    _os_signpost_emit_with_name_impl(&dword_21FAFD000, v2, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "DATA_OVER_XPC", "Finished (FAILED) processing buffer (%lu bytes) sent to extraction service over XPC", (uint8_t *)&v4, 0xCu);
  }
}

void __42__STRemoteExtractor__sendData_completion___block_invoke_139(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v3 = a2;
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  int v4 = STGetSignpostHandle();
  if (os_signpost_enabled(v4))
  {
    if (v3) {
      uint64_t v5 = "FAILED";
    }
    else {
      uint64_t v5 = "SUCCEEDED";
    }
    uint64_t v6 = [*(id *)(a1 + 32) length];
    int v7 = 136315394;
    uint64_t v8 = v5;
    __int16 v9 = 2048;
    uint64_t v10 = v6;
    _os_signpost_emit_with_name_impl(&dword_21FAFD000, v4, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "DATA_OVER_XPC", "Finished (%s) processing buffer (%lu bytes) sent to extraction service over XPC", (uint8_t *)&v7, 0x16u);
  }
}

uint64_t __42__STRemoteExtractor__sendData_completion___block_invoke_140(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  id v3 = STGetLogHandle();
  int v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __42__STRemoteExtractor__sendData_completion___block_invoke_140_cold_2();
    }

    [*(id *)(a1 + 32) setError:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
    [*(id *)(a1 + 32) _invalidate];
    uint64_t v5 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  }
  else
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
      __42__STRemoteExtractor__sendData_completion___block_invoke_140_cold_1();
    }

    uint64_t v5 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  }
  return v5();
}

- (void)supplyBytes:(id)a3 withCompletionBlock:(id)a4
{
  uint64_t v52 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 length];
  v43[0] = MEMORY[0x263EF8330];
  v43[1] = 3221225472;
  v43[2] = __53__STRemoteExtractor_supplyBytes_withCompletionBlock___block_invoke;
  v43[3] = &unk_264528EA0;
  v43[4] = self;
  uint64_t v45 = v8;
  id v9 = v7;
  id v44 = v9;
  uint64_t v10 = (void (**)(void, void, void))MEMORY[0x223C5AA30](v43);
  uint64_t v11 = STGetLogHandle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    v47 = (STRemoteExtractor *)"-[STRemoteExtractor supplyBytes:withCompletionBlock:]";
    __int16 v48 = 2112;
    v49 = self;
    __int16 v50 = 2048;
    uint64_t v51 = v8;
    _os_log_impl(&dword_21FAFD000, v11, OS_LOG_TYPE_DEFAULT, "%{public}s: %@: -supplyBytes:[%lu bytes]", buf, 0x20u);
  }

  BOOL v12 = STGetSignpostHandle();
  if (os_signpost_enabled(v12))
  {
    *(_DWORD *)buf = 138412546;
    v47 = self;
    __int16 v48 = 2048;
    v49 = (STRemoteExtractor *)v8;
    _os_signpost_emit_with_name_impl(&dword_21FAFD000, v12, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "SUPPLY_BYTES", "%@: -supplyBytes:[%lu bytes] began", buf, 0x16u);
  }

  if (v6)
  {
    uint64_t v13 = [(STRemoteExtractor *)self error];

    if (v13)
    {
      unint64_t v28 = STGetLogHandle();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
        -[STRemoteExtractor supplyBytes:withCompletionBlock:].cold.7(self);
      }

      uint64_t v20 = [(STRemoteExtractor *)self error];
      goto LABEL_36;
    }
    if (![(STRemoteExtractor *)self isPrepared])
    {
      unint64_t v29 = STGetLogHandle();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
        -[STRemoteExtractor supplyBytes:withCompletionBlock:].cold.6();
      }

      uint64_t v30 = STExtractorErrorDomain;
      uint64_t v31 = [NSString stringWithFormat:@"%s called before -prepareForExtraction on %@", "-[STRemoteExtractor supplyBytes:withCompletionBlock:]", self];
      uint64_t v20 = STCreateError(v30, 7, v31, 0, (uint64_t)"-[STRemoteExtractor supplyBytes:withCompletionBlock:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/StreamingExtractor/StreamingExtractor_Framework/STRemoteExtractor.m", 953);

      goto LABEL_36;
    }
    if ([(STRemoteExtractor *)self isInvalid])
    {
      v32 = STGetLogHandle();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
        -[STRemoteExtractor supplyBytes:withCompletionBlock:]();
      }

      v33 = STExtractorErrorDomain;
      unint64_t v23 = [NSString stringWithFormat:@"-supplyBytes: called on invalid extractor"];
      unint64_t v24 = v33;
      uint64_t v25 = 8;
      __int16 v26 = v23;
      uint64_t v27 = 954;
    }
    else
    {
      __int16 v14 = [(STRemoteExtractor *)self ioQueue];

      if (v14)
      {
        uint64_t v15 = [(STRemoteExtractor *)self extractionServiceConnection];

        if (v15)
        {
          uint64_t v16 = [v6 copy];
          if (v16)
          {
            uint64_t v17 = (void *)v16;
            uint64_t v18 = [(STRemoteExtractor *)self ioQueue];
            block[0] = MEMORY[0x263EF8330];
            block[1] = 3221225472;
            block[2] = __53__STRemoteExtractor_supplyBytes_withCompletionBlock___block_invoke_160;
            block[3] = &unk_264528CE8;
            void block[4] = self;
            id v19 = v17;
            id v41 = v19;
            uint64_t v42 = v10;
            dispatch_async(v18, block);

            uint64_t v20 = 0;
            goto LABEL_13;
          }
          uint64_t v38 = STGetLogHandle();
          if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR)) {
            -[STRemoteExtractor supplyBytes:withCompletionBlock:].cold.5();
          }

          id v39 = STExtractorErrorDomain;
          unint64_t v23 = [NSString stringWithFormat:@"unable to copy bytes"];
          unint64_t v24 = v39;
          uint64_t v25 = 1;
          __int16 v26 = v23;
          uint64_t v27 = 961;
        }
        else
        {
          id v36 = STGetLogHandle();
          if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
            -[STRemoteExtractor supplyBytes:withCompletionBlock:].cold.4();
          }

          id v37 = STExtractorErrorDomain;
          unint64_t v23 = [NSString stringWithFormat:@"no service connection for extraction service"];
          unint64_t v24 = v37;
          uint64_t v25 = 1;
          __int16 v26 = v23;
          uint64_t v27 = 957;
        }
      }
      else
      {
        uint64_t v34 = STGetLogHandle();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
          -[STRemoteExtractor supplyBytes:withCompletionBlock:]();
        }

        v35 = STExtractorErrorDomain;
        unint64_t v23 = [NSString stringWithFormat:@"no ioQueue"];
        unint64_t v24 = v35;
        uint64_t v25 = 1;
        __int16 v26 = v23;
        uint64_t v27 = 956;
      }
    }
  }
  else
  {
    unint64_t v21 = STGetLogHandle();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      -[STRemoteExtractor supplyBytes:withCompletionBlock:]();
    }

    v22 = STExtractorErrorDomain;
    unint64_t v23 = [NSString stringWithFormat:@"no bytes supplied to -supplyBytes"];
    unint64_t v24 = v22;
    uint64_t v25 = 3;
    __int16 v26 = v23;
    uint64_t v27 = 950;
  }
  uint64_t v20 = STCreateError(v24, v25, v26, 0, (uint64_t)"-[STRemoteExtractor supplyBytes:withCompletionBlock:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/StreamingExtractor/StreamingExtractor_Framework/STRemoteExtractor.m", v27);

LABEL_36:
  if (v20) {
    ((void (**)(void, void *, uint64_t))v10)[2](v10, v20, 1);
  }
  id v19 = 0;
LABEL_13:
}

void __53__STRemoteExtractor_supplyBytes_withCompletionBlock___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v3 = a2;
  int v4 = STGetSignpostHandle();
  if (os_signpost_enabled(v4))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = *(void *)(a1 + 48);
    id v7 = "failed";
    if (!v3) {
      id v7 = "succeeded";
    }
    int v12 = 138412802;
    uint64_t v13 = v5;
    __int16 v14 = 2048;
    uint64_t v15 = v6;
    __int16 v16 = 2080;
    uint64_t v17 = v7;
    _os_signpost_emit_with_name_impl(&dword_21FAFD000, v4, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "SUPPLY_BYTES", "%@: -supplyBytes:[%lu bytes] %s", (uint8_t *)&v12, 0x20u);
  }

  if (!v3) {
    goto LABEL_13;
  }
  uint64_t v8 = [v3 userInfo];

  if (!v8) {
    goto LABEL_13;
  }
  id v9 = [v3 userInfo];
  uint64_t v10 = [v9 objectForKeyedSubscript:@"ErrorCausedBySystemShuttingDown"];

  if (!v10 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {

LABEL_13:
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    goto LABEL_14;
  }
  int v11 = [v10 BOOLValue];

  if (!v11 || ([*(id *)(a1 + 32) suppressCompletionsDuringShutdown] & 1) == 0) {
    goto LABEL_13;
  }
LABEL_14:
}

void __53__STRemoteExtractor_supplyBytes_withCompletionBlock___block_invoke_160(uint64_t a1)
{
  uint64_t v2 = (id *)(a1 + 32);
  id v3 = [*(id *)(a1 + 32) error];

  if (v3)
  {
    uint64_t v8 = STGetLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __53__STRemoteExtractor_supplyBytes_withCompletionBlock___block_invoke_160_cold_4(v2);
    }

    id v9 = [*v2 error];
  }
  else if ([*v2 isPrepared])
  {
    if ([*v2 isInvalid])
    {
      uint64_t v13 = STGetLogHandle();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        __53__STRemoteExtractor_supplyBytes_withCompletionBlock___block_invoke_160_cold_1();
      }

      __int16 v14 = STExtractorErrorDomain;
      uint64_t v15 = [NSString stringWithFormat:@"-supplyBytes: called on invalid extractor"];
      __int16 v16 = v14;
      uint64_t v17 = 8;
      uint64_t v18 = v15;
      uint64_t v19 = 970;
    }
    else
    {
      int v4 = [*v2 extractionServiceConnection];

      if (v4)
      {
        v25[0] = MEMORY[0x263EF8330];
        v25[1] = 3221225472;
        v25[2] = __53__STRemoteExtractor_supplyBytes_withCompletionBlock___block_invoke_2;
        v25[3] = &unk_264528CE8;
        uint64_t v5 = *(void **)(a1 + 40);
        v25[4] = *(void *)(a1 + 32);
        id v26 = v5;
        id v27 = *(id *)(a1 + 48);
        uint64_t v6 = (void (**)(void))MEMORY[0x223C5AA30](v25);
        if ([*(id *)(a1 + 32) dataStreamStarted])
        {
          v6[2](v6);
        }
        else
        {
          id v7 = [*(id *)(a1 + 32) reservationQueue];
          block[0] = MEMORY[0x263EF8330];
          block[1] = 3221225472;
          block[2] = __53__STRemoteExtractor_supplyBytes_withCompletionBlock___block_invoke_4;
          block[3] = &unk_264528F18;
          void block[4] = *(void *)(a1 + 32);
          unint64_t v23 = v6;
          id v24 = *(id *)(a1 + 48);
          dispatch_async(v7, block);
        }
        return;
      }
      uint64_t v20 = STGetLogHandle();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        __53__STRemoteExtractor_supplyBytes_withCompletionBlock___block_invoke_160_cold_2();
      }

      unint64_t v21 = STExtractorErrorDomain;
      uint64_t v15 = [NSString stringWithFormat:@"no service connection for extraction service"];
      __int16 v16 = v21;
      uint64_t v17 = 1;
      uint64_t v18 = v15;
      uint64_t v19 = 972;
    }
    id v9 = STCreateError(v16, v17, v18, 0, (uint64_t)"-[STRemoteExtractor supplyBytes:withCompletionBlock:]_block_invoke", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/StreamingExtractor/StreamingExtractor_Framework/STRemoteExtractor.m", v19);
  }
  else
  {
    uint64_t v10 = STGetLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      __53__STRemoteExtractor_supplyBytes_withCompletionBlock___block_invoke_160_cold_3();
    }

    int v11 = STExtractorErrorDomain;
    int v12 = [NSString stringWithFormat:@"%s called before -prepareForExtraction on %@", "-[STRemoteExtractor supplyBytes:withCompletionBlock:]_block_invoke", *v2];
    id v9 = STCreateError(v11, 7, v12, 0, (uint64_t)"-[STRemoteExtractor supplyBytes:withCompletionBlock:]_block_invoke", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/StreamingExtractor/StreamingExtractor_Framework/STRemoteExtractor.m", 969);
  }
  if (v9)
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

void __53__STRemoteExtractor_supplyBytes_withCompletionBlock___block_invoke_2(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __53__STRemoteExtractor_supplyBytes_withCompletionBlock___block_invoke_3;
  v3[3] = &unk_264528EC8;
  v3[4] = v1;
  id v4 = *(id *)(a1 + 48);
  [v1 _sendData:v2 completion:v3];
}

void __53__STRemoteExtractor_supplyBytes_withCompletionBlock___block_invoke_3(uint64_t a1, void *a2, int a3)
{
  id v5 = a2;
  if (v5 || a3) {
    [*(id *)(a1 + 32) _releaseExtractionMemory];
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __53__STRemoteExtractor_supplyBytes_withCompletionBlock___block_invoke_4(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _reserveExtractionMemory];
  id v3 = [*(id *)(a1 + 32) ioQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __53__STRemoteExtractor_supplyBytes_withCompletionBlock___block_invoke_5;
  v7[3] = &unk_264528EF0;
  id v4 = *(void **)(a1 + 40);
  v7[4] = *(void *)(a1 + 32);
  id v8 = v4;
  dispatch_async(v3, v7);

  if (v2) {
    (*(void (**)(void, void *, uint64_t, uint64_t, uint64_t))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), v2, 1, v5, v6);
  }
}

uint64_t __53__STRemoteExtractor_supplyBytes_withCompletionBlock___block_invoke_5(uint64_t a1)
{
  [*(id *)(a1 + 32) setDataStreamStarted:1];
  uint64_t v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v2();
}

- (void)suspendStreamWithCompletionBlock:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(STRemoteExtractor *)self ioQueue];

  if (v5)
  {
    uint64_t v6 = [(STRemoteExtractor *)self ioQueue];
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __54__STRemoteExtractor_suspendStreamWithCompletionBlock___block_invoke;
    v11[3] = &unk_264528EF0;
    v11[4] = self;
    id v12 = v4;
    dispatch_async(v6, v11);
  }
  else
  {
    id v7 = STGetLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[STRemoteExtractor suspendStreamWithCompletionBlock:]();
    }

    id v8 = STExtractorErrorDomain;
    id v9 = [NSString stringWithFormat:@"no ioQueue"];
    uint64_t v10 = STCreateError(v8, 1, v9, 0, (uint64_t)"-[STRemoteExtractor suspendStreamWithCompletionBlock:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/StreamingExtractor/StreamingExtractor_Framework/STRemoteExtractor.m", 1034);

    if (v10)
    {
      (*((void (**)(id, void, void *))v4 + 2))(v4, 0, v10);
    }
  }
}

void __54__STRemoteExtractor_suspendStreamWithCompletionBlock___block_invoke(uint64_t a1)
{
  uint64_t v2 = (id *)(a1 + 32);
  id v3 = [*(id *)(a1 + 32) error];

  if (v3)
  {
    id v4 = STGetLogHandle();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __54__STRemoteExtractor_suspendStreamWithCompletionBlock___block_invoke_cold_4((uint64_t)v2);
    }

    uint64_t v5 = *(void *)(a1 + 40);
    uint64_t v6 = [*(id *)(a1 + 32) error];
    (*(void (**)(uint64_t, void, void *))(v5 + 16))(v5, 0, v6);
    goto LABEL_9;
  }
  if ([*v2 isPrepared])
  {
    if ([*v2 isInvalid])
    {
      uint64_t v19 = STGetLogHandle();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        __54__STRemoteExtractor_suspendStreamWithCompletionBlock___block_invoke_cold_1();
      }

      uint64_t v20 = STExtractorErrorDomain;
      __int16 v14 = [NSString stringWithFormat:@"-suspendStreamWithCompletionBlock: called on invalid extractor"];
      uint64_t v15 = v20;
      uint64_t v16 = 8;
      uint64_t v17 = v14;
      uint64_t v18 = 1047;
    }
    else
    {
      id v7 = [*v2 extractionServiceConnection];

      if (v7)
      {
        v25[0] = MEMORY[0x263EF8330];
        v25[1] = 3221225472;
        v25[2] = __54__STRemoteExtractor_suspendStreamWithCompletionBlock___block_invoke_2;
        v25[3] = &unk_264528F68;
        id v8 = *(void **)(a1 + 40);
        v25[4] = *(void *)(a1 + 32);
        id v26 = v8;
        id v9 = (void *)MEMORY[0x223C5AA30](v25);
        uint64_t v10 = [*(id *)(a1 + 32) extractionServiceConnection];
        v23[0] = MEMORY[0x263EF8330];
        v23[1] = 3221225472;
        v23[2] = __54__STRemoteExtractor_suspendStreamWithCompletionBlock___block_invoke_171;
        v23[3] = &unk_264528F90;
        id v24 = v9;
        id v11 = v9;
        uint64_t v6 = [v10 remoteObjectProxyWithErrorHandler:v23];

        objc_msgSend(v6, "remote_suspendStreamWithCompletionBlock:", v11);
LABEL_9:

        return;
      }
      unint64_t v21 = STGetLogHandle();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
        __54__STRemoteExtractor_suspendStreamWithCompletionBlock___block_invoke_cold_2();
      }

      v22 = STExtractorErrorDomain;
      __int16 v14 = [NSString stringWithFormat:@"%@: no connection to extraction service", *v2];
      uint64_t v15 = v22;
      uint64_t v16 = 5;
      uint64_t v17 = v14;
      uint64_t v18 = 1049;
    }
  }
  else
  {
    id v12 = STGetLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      __54__STRemoteExtractor_suspendStreamWithCompletionBlock___block_invoke_cold_3();
    }

    uint64_t v13 = STExtractorErrorDomain;
    __int16 v14 = [NSString stringWithFormat:@"%s called before prepare on %@", "-[STRemoteExtractor suspendStreamWithCompletionBlock:]_block_invoke", *v2];
    uint64_t v15 = v13;
    uint64_t v16 = 5;
    uint64_t v17 = v14;
    uint64_t v18 = 1046;
  }
  uint64_t v6 = STCreateError(v15, v16, v17, 0, (uint64_t)"-[STRemoteExtractor suspendStreamWithCompletionBlock:]_block_invoke", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/StreamingExtractor/StreamingExtractor_Framework/STRemoteExtractor.m", v18);

  if (v6)
  {
    (*(void (**)(void, void, void *))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, v6);
    goto LABEL_9;
  }
}

void __54__STRemoteExtractor_suspendStreamWithCompletionBlock___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = [*(id *)(a1 + 32) ioQueue];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  void v9[2] = __54__STRemoteExtractor_suspendStreamWithCompletionBlock___block_invoke_3;
  v9[3] = &unk_264528F40;
  uint64_t v12 = a2;
  id v7 = *(void **)(a1 + 40);
  v9[4] = *(void *)(a1 + 32);
  id v10 = v5;
  id v11 = v7;
  id v8 = v5;
  dispatch_async(v6, v9);
}

uint64_t __54__STRemoteExtractor_suspendStreamWithCompletionBlock___block_invoke_3(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  uint64_t v2 = STGetLogHandle();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 56);
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
    int v7 = 136446978;
    id v8 = "-[STRemoteExtractor suspendStreamWithCompletionBlock:]_block_invoke_3";
    __int16 v9 = 2112;
    uint64_t v10 = v4;
    __int16 v11 = 2048;
    uint64_t v12 = v3;
    __int16 v13 = 2112;
    uint64_t v14 = v5;
    _os_log_impl(&dword_21FAFD000, v2, OS_LOG_TYPE_DEFAULT, "%{public}s: %@: calling suspend completion block with offset %llu, error %@", (uint8_t *)&v7, 0x2Au);
  }

  if (*(void *)(a1 + 40)) {
    objc_msgSend(*(id *)(a1 + 32), "setError:");
  }
  [*(id *)(a1 + 32) _invalidate];
  return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
}

uint64_t __54__STRemoteExtractor_suspendStreamWithCompletionBlock___block_invoke_171(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)finishStreamWithCompletionBlock:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(STRemoteExtractor *)self ioQueue];

  if (v5)
  {
    uint64_t v6 = [(STRemoteExtractor *)self ioQueue];
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __53__STRemoteExtractor_finishStreamWithCompletionBlock___block_invoke;
    v11[3] = &unk_264528EF0;
    v11[4] = self;
    id v12 = v4;
    dispatch_async(v6, v11);
  }
  else
  {
    int v7 = STGetLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[STRemoteExtractor finishStreamWithCompletionBlock:]();
    }

    id v8 = STExtractorErrorDomain;
    __int16 v9 = [NSString stringWithFormat:@"no ioQueue"];
    uint64_t v10 = STCreateError(v8, 1, v9, 0, (uint64_t)"-[STRemoteExtractor finishStreamWithCompletionBlock:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/StreamingExtractor/StreamingExtractor_Framework/STRemoteExtractor.m", 1098);

    if (v10)
    {
      (*((void (**)(id, void *))v4 + 2))(v4, v10);
    }
  }
}

void __53__STRemoteExtractor_finishStreamWithCompletionBlock___block_invoke(uint64_t a1)
{
  uint64_t v2 = (id *)(a1 + 32);
  uint64_t v3 = [*(id *)(a1 + 32) error];

  if (v3)
  {
    id v4 = STGetLogHandle();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __53__STRemoteExtractor_finishStreamWithCompletionBlock___block_invoke_cold_4((uint64_t)v2);
    }

    uint64_t v5 = *(void *)(a1 + 40);
    uint64_t v6 = [*(id *)(a1 + 32) error];
    (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v6);
    goto LABEL_9;
  }
  if ([*v2 isPrepared])
  {
    if ([*v2 isInvalid])
    {
      uint64_t v19 = STGetLogHandle();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        __53__STRemoteExtractor_finishStreamWithCompletionBlock___block_invoke_cold_1();
      }

      uint64_t v20 = STExtractorErrorDomain;
      uint64_t v14 = [NSString stringWithFormat:@"-supplyBytes: called on invalid extractor"];
      uint64_t v15 = v20;
      uint64_t v16 = 8;
      uint64_t v17 = v14;
      uint64_t v18 = 1111;
    }
    else
    {
      int v7 = [*v2 extractionServiceConnection];

      if (v7)
      {
        v25[0] = MEMORY[0x263EF8330];
        v25[1] = 3221225472;
        v25[2] = __53__STRemoteExtractor_finishStreamWithCompletionBlock___block_invoke_2;
        v25[3] = &unk_264528D10;
        id v8 = *(void **)(a1 + 40);
        v25[4] = *(void *)(a1 + 32);
        id v26 = v8;
        __int16 v9 = (void *)MEMORY[0x223C5AA30](v25);
        uint64_t v10 = [*(id *)(a1 + 32) extractionServiceConnection];
        v23[0] = MEMORY[0x263EF8330];
        v23[1] = 3221225472;
        v23[2] = __53__STRemoteExtractor_finishStreamWithCompletionBlock___block_invoke_172;
        v23[3] = &unk_264528F90;
        id v24 = v9;
        id v11 = v9;
        uint64_t v6 = [v10 remoteObjectProxyWithErrorHandler:v23];

        objc_msgSend(v6, "remote_finishStreamWithCompletionBlock:", v11);
LABEL_9:

        return;
      }
      unint64_t v21 = STGetLogHandle();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
        __53__STRemoteExtractor_finishStreamWithCompletionBlock___block_invoke_cold_2();
      }

      v22 = STExtractorErrorDomain;
      uint64_t v14 = [NSString stringWithFormat:@"%@: no connection to extraction service", *v2];
      uint64_t v15 = v22;
      uint64_t v16 = 5;
      uint64_t v17 = v14;
      uint64_t v18 = 1113;
    }
  }
  else
  {
    id v12 = STGetLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      __53__STRemoteExtractor_finishStreamWithCompletionBlock___block_invoke_cold_3();
    }

    __int16 v13 = STExtractorErrorDomain;
    uint64_t v14 = [NSString stringWithFormat:@"%s called before prepare on %@", "-[STRemoteExtractor finishStreamWithCompletionBlock:]_block_invoke", *v2];
    uint64_t v15 = v13;
    uint64_t v16 = 5;
    uint64_t v17 = v14;
    uint64_t v18 = 1110;
  }
  uint64_t v6 = STCreateError(v15, v16, v17, 0, (uint64_t)"-[STRemoteExtractor finishStreamWithCompletionBlock:]_block_invoke", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/StreamingExtractor/StreamingExtractor_Framework/STRemoteExtractor.m", v18);

  if (v6)
  {
    (*(void (**)(void, void *))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), v6);
    goto LABEL_9;
  }
}

void __53__STRemoteExtractor_finishStreamWithCompletionBlock___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) ioQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __53__STRemoteExtractor_finishStreamWithCompletionBlock___block_invoke_3;
  block[3] = &unk_264528CE8;
  uint64_t v5 = *(void **)(a1 + 40);
  void block[4] = *(void *)(a1 + 32);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  dispatch_async(v4, block);
}

uint64_t __53__STRemoteExtractor_finishStreamWithCompletionBlock___block_invoke_3(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  uint64_t v2 = STGetLogHandle();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    int v6 = 136446722;
    int v7 = "-[STRemoteExtractor finishStreamWithCompletionBlock:]_block_invoke_3";
    __int16 v8 = 2112;
    uint64_t v9 = v3;
    __int16 v10 = 2112;
    uint64_t v11 = v4;
    _os_log_impl(&dword_21FAFD000, v2, OS_LOG_TYPE_DEFAULT, "%{public}s: %@: calling finish completion block - error %@", (uint8_t *)&v6, 0x20u);
  }

  if (*(void *)(a1 + 40)) {
    objc_msgSend(*(id *)(a1 + 32), "setError:");
  }
  [*(id *)(a1 + 32) _invalidate];
  return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
}

uint64_t __53__STRemoteExtractor_finishStreamWithCompletionBlock___block_invoke_172(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)terminateStreamWithError:(id)a3 completionBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  __int16 v8 = [(STRemoteExtractor *)self ioQueue];

  if (v8)
  {
    uint64_t v9 = [(STRemoteExtractor *)self ioQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __62__STRemoteExtractor_terminateStreamWithError_completionBlock___block_invoke;
    block[3] = &unk_264528FB8;
    void block[4] = self;
    id v16 = v7;
    id v15 = v6;
    dispatch_async(v9, block);
  }
  else
  {
    __int16 v10 = STGetLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[STRemoteExtractor terminateStreamWithError:completionBlock:]();
    }

    uint64_t v11 = STExtractorErrorDomain;
    uint64_t v12 = [NSString stringWithFormat:@"no ioQueue"];
    __int16 v13 = STCreateError(v11, 1, v12, 0, (uint64_t)"-[STRemoteExtractor terminateStreamWithError:completionBlock:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/StreamingExtractor/StreamingExtractor_Framework/STRemoteExtractor.m", 1161);

    if (v13)
    {
      (*((void (**)(id, void *))v7 + 2))(v7, v13);
    }
  }
}

void __62__STRemoteExtractor_terminateStreamWithError_completionBlock___block_invoke(uint64_t a1)
{
  uint64_t v2 = (id *)(a1 + 32);
  uint64_t v3 = [*(id *)(a1 + 32) error];

  if (v3)
  {
    uint64_t v4 = STGetLogHandle();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __62__STRemoteExtractor_terminateStreamWithError_completionBlock___block_invoke_cold_4((uint64_t)v2);
    }

    uint64_t v5 = *(void *)(a1 + 48);
    id v6 = [*(id *)(a1 + 32) error];
    (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v6);
    goto LABEL_9;
  }
  if ([*v2 isPrepared])
  {
    if ([*v2 isInvalid])
    {
      uint64_t v18 = STGetLogHandle();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        __62__STRemoteExtractor_terminateStreamWithError_completionBlock___block_invoke_cold_1();
      }

      uint64_t v19 = STExtractorErrorDomain;
      __int16 v13 = [NSString stringWithFormat:@"-supplyBytes: called on invalid extractor"];
      uint64_t v14 = v19;
      uint64_t v15 = 8;
      id v16 = v13;
      uint64_t v17 = 1174;
    }
    else
    {
      id v7 = [*v2 extractionServiceConnection];

      if (v7)
      {
        v24[0] = MEMORY[0x263EF8330];
        v24[1] = 3221225472;
        v24[2] = __62__STRemoteExtractor_terminateStreamWithError_completionBlock___block_invoke_2;
        v24[3] = &unk_264528D10;
        v24[4] = *(void *)(a1 + 32);
        id v25 = *(id *)(a1 + 48);
        __int16 v8 = (void *)MEMORY[0x223C5AA30](v24);
        uint64_t v9 = [*(id *)(a1 + 32) extractionServiceConnection];
        v22[0] = MEMORY[0x263EF8330];
        v22[1] = 3221225472;
        v22[2] = __62__STRemoteExtractor_terminateStreamWithError_completionBlock___block_invoke_173;
        v22[3] = &unk_264528F90;
        id v23 = v8;
        id v10 = v8;
        id v6 = [v9 remoteObjectProxyWithErrorHandler:v22];

        objc_msgSend(v6, "remote_terminateStreamWithError:completionBlock:", *(void *)(a1 + 40), v10);
LABEL_9:

        return;
      }
      uint64_t v20 = STGetLogHandle();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        __62__STRemoteExtractor_terminateStreamWithError_completionBlock___block_invoke_cold_2();
      }

      unint64_t v21 = STExtractorErrorDomain;
      __int16 v13 = [NSString stringWithFormat:@"%@: no connection to extraction service", *v2];
      uint64_t v14 = v21;
      uint64_t v15 = 5;
      id v16 = v13;
      uint64_t v17 = 1176;
    }
  }
  else
  {
    uint64_t v11 = STGetLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      __62__STRemoteExtractor_terminateStreamWithError_completionBlock___block_invoke_cold_3();
    }

    uint64_t v12 = STExtractorErrorDomain;
    __int16 v13 = [NSString stringWithFormat:@"%s called before prepare on %@", "-[STRemoteExtractor terminateStreamWithError:completionBlock:]_block_invoke", *v2];
    uint64_t v14 = v12;
    uint64_t v15 = 5;
    id v16 = v13;
    uint64_t v17 = 1173;
  }
  id v6 = STCreateError(v14, v15, v16, 0, (uint64_t)"-[STRemoteExtractor terminateStreamWithError:completionBlock:]_block_invoke", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/StreamingExtractor/StreamingExtractor_Framework/STRemoteExtractor.m", v17);

  if (v6)
  {
    (*(void (**)(void, void *))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), v6);
    goto LABEL_9;
  }
}

void __62__STRemoteExtractor_terminateStreamWithError_completionBlock___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) ioQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __62__STRemoteExtractor_terminateStreamWithError_completionBlock___block_invoke_3;
  block[3] = &unk_264528CE8;
  uint64_t v5 = *(void **)(a1 + 40);
  void block[4] = *(void *)(a1 + 32);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  dispatch_async(v4, block);
}

uint64_t __62__STRemoteExtractor_terminateStreamWithError_completionBlock___block_invoke_3(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  uint64_t v2 = STGetLogHandle();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    int v6 = 136446722;
    id v7 = "-[STRemoteExtractor terminateStreamWithError:completionBlock:]_block_invoke_3";
    __int16 v8 = 2112;
    uint64_t v9 = v3;
    __int16 v10 = 2112;
    uint64_t v11 = v4;
    _os_log_impl(&dword_21FAFD000, v2, OS_LOG_TYPE_DEFAULT, "%{public}s: %@: calling terminate completion block - error %@", (uint8_t *)&v6, 0x20u);
  }

  if (*(void *)(a1 + 40)) {
    objc_msgSend(*(id *)(a1 + 32), "setError:");
  }
  [*(id *)(a1 + 32) _invalidate];
  return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
}

uint64_t __62__STRemoteExtractor_terminateStreamWithError_completionBlock___block_invoke_173(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)remote_setExtractionProgress:(double)a3
{
  uint64_t v4 = [(STRemoteExtractor *)self extractorDelegate];
  if (v4)
  {
    uint64_t v5 = (void *)v4;
    if (objc_opt_respondsToSelector()) {
      [v5 setExtractionProgress:a3];
    }
  }
  MEMORY[0x270F9A790]();
}

- (void)remote_extractionCompleteAtArchivePath:(id)a3
{
  id v5 = a3;
  uint64_t v4 = [(STRemoteExtractor *)self extractorDelegate];
  if (v4 && (objc_opt_respondsToSelector() & 1) != 0) {
    [v4 extractionCompleteAtArchivePath:v5];
  }
}

- (void)remote_extractionEnteredPassthroughMode
{
  uint64_t v2 = [(STRemoteExtractor *)self extractorDelegate];
  if (v2)
  {
    uint64_t v3 = (void *)v2;
    if (objc_opt_respondsToSelector()) {
      [v3 extractionEnteredPassthroughMode];
    }
  }
  MEMORY[0x270F9A790]();
}

- (NSDictionary)options
{
  return &self->_options->super;
}

- (STExtractorDelegate)extractorDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_extractorDelegate);
  return (STExtractorDelegate *)WeakRetained;
}

- (void)setExtractorDelegate:(id)a3
{
}

- (BOOL)privileged
{
  return self->_privileged;
}

- (void)setPrivileged:(BOOL)a3
{
  self->_privileged = a3;
}

- (unint64_t)lastResumptionOffset
{
  return self->_lastResumptionOffset;
}

- (void)setLastResumptionOffset:(unint64_t)a3
{
  self->_lastResumptionOffset = a3;
}

- (OS_dispatch_queue)ioQueue
{
  return self->_ioQueue;
}

- (OS_dispatch_queue)reservationQueue
{
  return self->_reservationQueue;
}

- (NSXPCConnection)extractionServiceConnection
{
  return self->_extractionServiceConnection;
}

- (ExtractionServiceInfo)extractionServiceInfo
{
  return self->_extractionServiceInfo;
}

- (STExtractionOriginator)internalExtractionOriginator
{
  return self->_internalExtractionOriginator;
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (BOOL)isPrepared
{
  return self->_isPrepared;
}

- (void)setIsPrepared:(BOOL)a3
{
  self->_isPrepared = a3;
}

- (BOOL)isInvalid
{
  return self->_isInvalid;
}

- (void)setIsInvalid:(BOOL)a3
{
  self->_isInvalid = a3;
}

- (BOOL)dataStreamStarted
{
  return self->_dataStreamStarted;
}

- (void)setDataStreamStarted:(BOOL)a3
{
  self->_dataStreamStarted = a3;
}

- (BOOL)finalBytesSent
{
  return self->_finalBytesSent;
}

- (void)setFinalBytesSent:(BOOL)a3
{
  self->_finalBytesSent = a3;
}

- (unint64_t)requiredExtractionMemory
{
  return self->_requiredExtractionMemory;
}

- (void)setRequiredExtractionMemory:(unint64_t)a3
{
  self->_requiredExtractionMemory = a3;
}

- (unint64_t)reservedExtractionMemory
{
  return self->_reservedExtractionMemory;
}

- (void)setReservedExtractionMemory:(unint64_t)a3
{
  self->_reservedExtractionMemory = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_internalExtractionOriginator, 0);
  objc_storeStrong((id *)&self->_extractionServiceInfo, 0);
  objc_storeStrong((id *)&self->_extractionServiceConnection, 0);
  objc_storeStrong((id *)&self->_reservationQueue, 0);
  objc_storeStrong((id *)&self->_ioQueue, 0);
  objc_destroyWeak((id *)&self->_extractorDelegate);
  objc_storeStrong((id *)&self->_options, 0);
}

- (void)init
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  int v1 = 136446466;
  uint64_t v2 = "-[STRemoteExtractor init]";
  __int16 v3 = 2080;
  uint64_t v4 = "-[STRemoteExtractor init]";
  _os_log_error_impl(&dword_21FAFD000, log, OS_LOG_TYPE_ERROR, "%{public}s: %s not available.", (uint8_t *)&v1, 0x16u);
}

- (void)createOutputDir:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_21FAFD000, v0, v1, "%{public}s: %s: AssertMacros: %s, %s file: %s, line: %d\n", v2, v3, v4, v5, 2u);
}

- (void)suppressCompletionsDuringShutdown
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_21FAFD000, v0, v1, "%{public}s: %s: AssertMacros: %s, %s file: %s, line: %d\n", v2, v3, v4, v5, 2u);
}

- (void)doesConsumeExtractedData
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_21FAFD000, v0, v1, "%{public}s: %s: AssertMacros: %s, %s file: %s, line: %d\n", v2, v3, v4, v5, 2u);
}

- (void)prepareForExtractionToPath:completionBlock:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_21FAFD000, v0, v1, "%{public}s: %s: AssertMacros: %s, %s file: %s, line: %d\n", v2, v3, v4, v5, 2u);
}

- (void)prepareForExtractionToPath:completionBlock:.cold.2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_21FAFD000, v0, v1, "%{public}s: %s: AssertMacros: %s, %s file: %s, line: %d\n", v2, v3, v4, v5, 2u);
}

- (void)prepareForExtractionToPath:completionBlock:.cold.3()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_21FAFD000, v0, v1, "%{public}s: %s: AssertMacros: %s, %s file: %s, line: %d\n", v2, v3, v4, v5, 2u);
}

void __64__STRemoteExtractor_prepareForExtractionToPath_completionBlock___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_21FAFD000, v0, v1, "%{public}s: %s: AssertMacros: %s, %s file: %s, line: %d\n", v2, v3, v4, v5, 2u);
}

void __64__STRemoteExtractor_prepareForExtractionToPath_completionBlock___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_21FAFD000, v0, v1, "%{public}s: %s: AssertMacros: %s, %s file: %s, line: %d\n", v2, v3, v4, v5, 2u);
}

void __64__STRemoteExtractor_prepareForExtractionToPath_completionBlock___block_invoke_cold_3()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_21FAFD000, v0, v1, "%{public}s: %s: AssertMacros: %s, %s file: %s, line: %d\n", v2, v3, v4, v5, 2u);
}

void __64__STRemoteExtractor_prepareForExtractionToPath_completionBlock___block_invoke_cold_4()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_21FAFD000, v0, v1, "%{public}s: %s: AssertMacros: %s, %s file: %s, line: %d\n", v2, v3, v4, v5, 2u);
}

void __64__STRemoteExtractor_prepareForExtractionToPath_completionBlock___block_invoke_cold_5()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_21FAFD000, v0, v1, "%{public}s: %s: AssertMacros: %s, %s file: %s, line: %d\n", v2, v3, v4, v5, 2u);
}

void __64__STRemoteExtractor_prepareForExtractionToPath_completionBlock___block_invoke_cold_6(uint64_t a1, NSObject *a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  int v4 = *__error();
  uint64_t v5 = __error();
  int v6 = strerror(*v5);
  int v7 = 136446978;
  __int16 v8 = "-[STRemoteExtractor prepareForExtractionToPath:completionBlock:]_block_invoke";
  __int16 v9 = 2080;
  uint64_t v10 = a1;
  __int16 v11 = 1024;
  int v12 = v4;
  __int16 v13 = 2080;
  uint64_t v14 = v6;
  _os_log_error_impl(&dword_21FAFD000, a2, OS_LOG_TYPE_ERROR, "%{public}s: Failed to issue sandbox extension for \"%s\" : %d (%s)", (uint8_t *)&v7, 0x26u);
}

void __64__STRemoteExtractor_prepareForExtractionToPath_completionBlock___block_invoke_cold_7()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_21FAFD000, v0, v1, "%{public}s: %s: AssertMacros: %s, %s file: %s, line: %d\n", v2, v3, v4, v5, 2u);
}

void __64__STRemoteExtractor_prepareForExtractionToPath_completionBlock___block_invoke_cold_8(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 136446210;
  uint64_t v2 = "-[STRemoteExtractor prepareForExtractionToPath:completionBlock:]_block_invoke";
  _os_log_error_impl(&dword_21FAFD000, log, OS_LOG_TYPE_ERROR, "%{public}s: Trying to create it anyway.", (uint8_t *)&v1, 0xCu);
}

void __64__STRemoteExtractor_prepareForExtractionToPath_completionBlock___block_invoke_cold_9(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)uint64_t v3 = 136446722;
  *(void *)&v3[4] = "-[STRemoteExtractor prepareForExtractionToPath:completionBlock:]_block_invoke";
  *(_WORD *)&v3[12] = 2080;
  *(void *)&v3[14] = a1;
  *(_WORD *)&v3[22] = 2112;
  OUTLINED_FUNCTION_8(&dword_21FAFD000, a2, a3, "%{public}s: Failed to remove existing path: %s (%@)", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16], a2);
}

void __64__STRemoteExtractor_prepareForExtractionToPath_completionBlock___block_invoke_cold_10()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_21FAFD000, v0, v1, "%{public}s: %s: AssertMacros: %s, %s file: %s, line: %d\n", v2, v3, v4, v5, 2u);
}

void __64__STRemoteExtractor_prepareForExtractionToPath_completionBlock___block_invoke_104_cold_1()
{
  OUTLINED_FUNCTION_16(*MEMORY[0x263EF8340]);
  *(_DWORD *)uint64_t v3 = 136446722;
  *(void *)&v3[4] = "-[STRemoteExtractor prepareForExtractionToPath:completionBlock:]_block_invoke";
  *(_WORD *)&v3[12] = 2112;
  *(void *)&v3[14] = v0;
  *(_WORD *)&v3[22] = 2112;
  OUTLINED_FUNCTION_8(&dword_21FAFD000, v1, v2, "%{public}s: %@: prepare returning error %@", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16], v1);
}

- (void)_sendData:completion:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_21FAFD000, v0, v1, "%{public}s: %s: AssertMacros: %s, %s file: %s, line: %d\n", v2, v3, v4, v5, 2u);
}

- (void)_sendData:completion:.cold.2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_21FAFD000, v0, v1, "%{public}s: %s: AssertMacros: %s, %s file: %s, line: %d\n", v2, v3, v4, v5, 2u);
}

- (void)_sendData:(uint64_t)a1 completion:(NSObject *)a2 .cold.3(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int v2 = 136446466;
  uint64_t v3 = "-[STRemoteExtractor _sendData:completion:]";
  __int16 v4 = 2048;
  uint64_t v5 = a1;
  _os_log_debug_impl(&dword_21FAFD000, a2, OS_LOG_TYPE_DEBUG, "%{public}s: Supplying entire byte range of data (%lu bytes)", (uint8_t *)&v2, 0x16u);
}

- (void)_sendData:completion:.cold.4()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_21FAFD000, v0, v1, "%{public}s: %s: AssertMacros: %s, %s file: %s, line: %d\n", v2, v3, v4, v5, 2u);
}

- (void)_sendData:(os_log_t)log completion:.cold.5(uint8_t *buf, uint64_t a2, os_log_t log)
{
  *(_DWORD *)buf = 136446466;
  *(void *)(buf + 4) = "-[STRemoteExtractor _sendData:completion:]";
  *((_WORD *)buf + 6) = 2048;
  *(void *)(buf + 14) = a2;
  _os_log_debug_impl(&dword_21FAFD000, log, OS_LOG_TYPE_DEBUG, "%{public}s: Starting to send %lu bytes to extractor in chunks", buf, 0x16u);
}

- (void)_sendData:completion:.cold.6()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_21FAFD000, v0, v1, "%{public}s: %s: AssertMacros: %s, %s file: %s, line: %d\n", v2, v3, v4, v5, 2u);
}

- (void)_sendData:(void *)a1 completion:.cold.7(void *a1)
{
  OUTLINED_FUNCTION_13(*MEMORY[0x263EF8340]);
  uint64_t v5 = [v4 error];
  uint64_t v15 = (uint64_t)v5;
  id v6 = [v1 stringWithFormat:@"-supplyBytes called on extractor that has already returned an error: %@"];
  uint64_t v7 = [v6 UTF8String];
  if (v7)
  {
    __int16 v8 = (void *)v2[360];
    a1 = [a1 error];
    uint64_t v15 = (uint64_t)a1;
    uint64_t v2 = [v8 stringWithFormat:@"-supplyBytes called on extractor that has already returned an error: %@"];
    [v2 UTF8String];
  }
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_5(&dword_21FAFD000, v9, v10, "%{public}s: %s: AssertMacros: %s, %s file: %s, line: %d\n", v11, v12, v13, v14, v15, v16, 2u);
  if (v7)
  {
  }
}

void __42__STRemoteExtractor__sendData_completion___block_invoke_126_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int v2 = 136446466;
  uint64_t v3 = "-[STRemoteExtractor _sendData:completion:]_block_invoke";
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  _os_log_error_impl(&dword_21FAFD000, a2, OS_LOG_TYPE_ERROR, "%{public}s: got error from remote connection: %@", (uint8_t *)&v2, 0x16u);
}

void __42__STRemoteExtractor__sendData_completion___block_invoke_132_cold_1()
{
  OUTLINED_FUNCTION_16(*MEMORY[0x263EF8340]);
  uint64_t v1 = *(void *)(*(void *)(v0 + 8) + 24);
  int v4 = 136446978;
  uint64_t v5 = "-[STRemoteExtractor _sendData:completion:]_block_invoke";
  __int16 v6 = 2048;
  uint64_t v7 = v2;
  __int16 v8 = 2048;
  uint64_t v9 = v1;
  __int16 v10 = 2048;
  uint64_t v11 = v1 + v2;
  _os_log_debug_impl(&dword_21FAFD000, v3, OS_LOG_TYPE_DEBUG, "%{public}s: Reserved %ld bytes; adding to existing length: %ld bytes; total reserved: %lu bytes",
    (uint8_t *)&v4,
    0x2Au);
}

void __42__STRemoteExtractor__sendData_completion___block_invoke_132_cold_2()
{
  int v2 = 136446722;
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_15(&dword_21FAFD000, v0, v1, "%{public}s: Failed to reserve last range; falling out with last range {%lu, %lu}",
    v2);
}

void __42__STRemoteExtractor__sendData_completion___block_invoke_132_cold_3()
{
  int v2 = 136446722;
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_15(&dword_21FAFD000, v0, v1, "%{public}s: Already processed {%lu, %lu}", v2);
}

void __42__STRemoteExtractor__sendData_completion___block_invoke_140_cold_1()
{
  OUTLINED_FUNCTION_16(*MEMORY[0x263EF8340]);
  v2[0] = 136446722;
  OUTLINED_FUNCTION_14();
  __int16 v3 = 2080;
  uint64_t v4 = v0;
  _os_log_debug_impl(&dword_21FAFD000, v1, OS_LOG_TYPE_DEBUG, "%{public}s: %@: calling supplyBytes: completion block with no error; dataComplete = %s",
    (uint8_t *)v2,
    0x20u);
}

void __42__STRemoteExtractor__sendData_completion___block_invoke_140_cold_2()
{
  OUTLINED_FUNCTION_16(*MEMORY[0x263EF8340]);
  int v2 = 136446722;
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_8(&dword_21FAFD000, v0, v1, "%{public}s: %@: calling supplyBytes: completion block with error %@", v2);
}

- (void)supplyBytes:withCompletionBlock:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_21FAFD000, v0, v1, "%{public}s: %s: AssertMacros: %s, %s file: %s, line: %d\n", v2, v3, v4, v5, 2u);
}

- (void)supplyBytes:withCompletionBlock:.cold.2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_21FAFD000, v0, v1, "%{public}s: %s: AssertMacros: %s, %s file: %s, line: %d\n", v2, v3, v4, v5, 2u);
}

- (void)supplyBytes:withCompletionBlock:.cold.3()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_21FAFD000, v0, v1, "%{public}s: %s: AssertMacros: %s, %s file: %s, line: %d\n", v2, v3, v4, v5, 2u);
}

- (void)supplyBytes:withCompletionBlock:.cold.4()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_21FAFD000, v0, v1, "%{public}s: %s: AssertMacros: %s, %s file: %s, line: %d\n", v2, v3, v4, v5, 2u);
}

- (void)supplyBytes:withCompletionBlock:.cold.5()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_21FAFD000, v0, v1, "%{public}s: %s: AssertMacros: %s, %s file: %s, line: %d\n", v2, v3, v4, v5, 2u);
}

- (void)supplyBytes:withCompletionBlock:.cold.6()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_21FAFD000, v0, v1, "%{public}s: %s: AssertMacros: %s, %s file: %s, line: %d\n", v2, v3, v4, v5, 2u);
}

- (void)supplyBytes:(void *)a1 withCompletionBlock:.cold.7(void *a1)
{
  OUTLINED_FUNCTION_13(*MEMORY[0x263EF8340]);
  uint64_t v5 = [v4 error];
  uint64_t v15 = (uint64_t)v5;
  id v6 = [v1 stringWithFormat:@"-supplyBytes called on extractor that has already returned an error: %@"];
  uint64_t v7 = [v6 UTF8String];
  if (v7)
  {
    __int16 v8 = (void *)v2[360];
    a1 = [a1 error];
    uint64_t v15 = (uint64_t)a1;
    uint64_t v2 = [v8 stringWithFormat:@"-supplyBytes called on extractor that has already returned an error: %@"];
    [v2 UTF8String];
  }
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_5(&dword_21FAFD000, v9, v10, "%{public}s: %s: AssertMacros: %s, %s file: %s, line: %d\n", v11, v12, v13, v14, v15, v16, 2u);
  if (v7)
  {
  }
}

void __53__STRemoteExtractor_supplyBytes_withCompletionBlock___block_invoke_160_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_21FAFD000, v0, v1, "%{public}s: %s: AssertMacros: %s, %s file: %s, line: %d\n", v2, v3, v4, v5, 2u);
}

void __53__STRemoteExtractor_supplyBytes_withCompletionBlock___block_invoke_160_cold_2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_21FAFD000, v0, v1, "%{public}s: %s: AssertMacros: %s, %s file: %s, line: %d\n", v2, v3, v4, v5, 2u);
}

void __53__STRemoteExtractor_supplyBytes_withCompletionBlock___block_invoke_160_cold_3()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_21FAFD000, v0, v1, "%{public}s: %s: AssertMacros: %s, %s file: %s, line: %d\n", v2, v3, v4, v5, 2u);
}

void __53__STRemoteExtractor_supplyBytes_withCompletionBlock___block_invoke_160_cold_4(id *a1)
{
  OUTLINED_FUNCTION_13(*MEMORY[0x263EF8340]);
  uint64_t v5 = [*v4 error];
  uint64_t v15 = (uint64_t)v5;
  id v6 = [v1 stringWithFormat:@"-supplyBytes called on extractor that has already returned an error: %@"];
  uint64_t v7 = [v6 UTF8String];
  if (v7)
  {
    __int16 v8 = (void *)v2[360];
    a1 = [*a1 error];
    uint64_t v15 = (uint64_t)a1;
    uint64_t v2 = [v8 stringWithFormat:@"-supplyBytes called on extractor that has already returned an error: %@"];
    [v2 UTF8String];
  }
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_5(&dword_21FAFD000, v9, v10, "%{public}s: %s: AssertMacros: %s, %s file: %s, line: %d\n", v11, v12, v13, v14, v15, v16, 2u);
  if (v7)
  {
  }
}

- (void)suspendStreamWithCompletionBlock:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_21FAFD000, v0, v1, "%{public}s: %s: AssertMacros: %s, %s file: %s, line: %d\n", v2, v3, v4, v5, 2u);
}

void __54__STRemoteExtractor_suspendStreamWithCompletionBlock___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_21FAFD000, v0, v1, "%{public}s: %s: AssertMacros: %s, %s file: %s, line: %d\n", v2, v3, v4, v5, 2u);
}

void __54__STRemoteExtractor_suspendStreamWithCompletionBlock___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_21FAFD000, v0, v1, "%{public}s: %s: AssertMacros: %s, %s file: %s, line: %d\n", v2, v3, v4, v5, 2u);
}

void __54__STRemoteExtractor_suspendStreamWithCompletionBlock___block_invoke_cold_3()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_21FAFD000, v0, v1, "%{public}s: %s: AssertMacros: %s, %s file: %s, line: %d\n", v2, v3, v4, v5, 2u);
}

void __54__STRemoteExtractor_suspendStreamWithCompletionBlock___block_invoke_cold_4(uint64_t a1)
{
  uint64_t v1 = [(id)OUTLINED_FUNCTION_12(a1) error];
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_9(&dword_21FAFD000, v2, v3, "%{public}s: %@: suspend called on extractor that has already returned an error %@", v4, v5, v6, v7, 2u);
}

- (void)finishStreamWithCompletionBlock:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_21FAFD000, v0, v1, "%{public}s: %s: AssertMacros: %s, %s file: %s, line: %d\n", v2, v3, v4, v5, 2u);
}

void __53__STRemoteExtractor_finishStreamWithCompletionBlock___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_21FAFD000, v0, v1, "%{public}s: %s: AssertMacros: %s, %s file: %s, line: %d\n", v2, v3, v4, v5, 2u);
}

void __53__STRemoteExtractor_finishStreamWithCompletionBlock___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_21FAFD000, v0, v1, "%{public}s: %s: AssertMacros: %s, %s file: %s, line: %d\n", v2, v3, v4, v5, 2u);
}

void __53__STRemoteExtractor_finishStreamWithCompletionBlock___block_invoke_cold_3()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_21FAFD000, v0, v1, "%{public}s: %s: AssertMacros: %s, %s file: %s, line: %d\n", v2, v3, v4, v5, 2u);
}

void __53__STRemoteExtractor_finishStreamWithCompletionBlock___block_invoke_cold_4(uint64_t a1)
{
  uint64_t v1 = [(id)OUTLINED_FUNCTION_12(a1) error];
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_9(&dword_21FAFD000, v2, v3, "%{public}s: %@: finish called on extractor that has already returned an error %@", v4, v5, v6, v7, 2u);
}

- (void)terminateStreamWithError:completionBlock:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_21FAFD000, v0, v1, "%{public}s: %s: AssertMacros: %s, %s file: %s, line: %d\n", v2, v3, v4, v5, 2u);
}

void __62__STRemoteExtractor_terminateStreamWithError_completionBlock___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_21FAFD000, v0, v1, "%{public}s: %s: AssertMacros: %s, %s file: %s, line: %d\n", v2, v3, v4, v5, 2u);
}

void __62__STRemoteExtractor_terminateStreamWithError_completionBlock___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_21FAFD000, v0, v1, "%{public}s: %s: AssertMacros: %s, %s file: %s, line: %d\n", v2, v3, v4, v5, 2u);
}

void __62__STRemoteExtractor_terminateStreamWithError_completionBlock___block_invoke_cold_3()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_21FAFD000, v0, v1, "%{public}s: %s: AssertMacros: %s, %s file: %s, line: %d\n", v2, v3, v4, v5, 2u);
}

void __62__STRemoteExtractor_terminateStreamWithError_completionBlock___block_invoke_cold_4(uint64_t a1)
{
  uint64_t v1 = [(id)OUTLINED_FUNCTION_12(a1) error];
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_9(&dword_21FAFD000, v2, v3, "%{public}s: %@: terminate called on extractor that has already returned an error: %@", v4, v5, v6, v7, 2u);
}

@end
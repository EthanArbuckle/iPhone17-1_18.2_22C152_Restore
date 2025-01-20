@interface STAEAExtractor
- (NSData)archiveID;
- (NSData)asymmetricDecryptionKey;
- (NSData)signingPublicKey;
- (NSData)symmetricDecryptionKey;
- (NSDictionary)options;
- (NSError)error;
- (NSString)sourceDirectory;
- (NSString)sourceDirectorySandboxExtension;
- (STAEAExtractor)initWithOptions:(id)a3 delegate:(id)a4;
- (STExtractionPluginDelegate)delegate;
- (int)aeaContextCallback:(AEAContext_impl *)a3;
- (int)extractionProgress:(float)a3;
- (int)processEntryMessage:(unsigned int)a3 path:(const char *)a4 data:(void *)a5;
- (unint64_t)extractionMemoryFootprint;
- (unint64_t)sandboxToken;
- (unsigned)isComplete;
- (void)dealloc;
- (void)finishStreamWithCompletionBlock:(id)a3;
- (void)invalidate;
- (void)prepareForExtractionToPath:(id)a3 withCompletionBlock:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setError:(id)a3;
- (void)setIsComplete:(unsigned __int8)a3;
- (void)setSandboxToken:(unint64_t)a3;
- (void)supplyBytes:(id)a3 withCompletionBlock:(id)a4;
- (void)suspendStreamWithCompletionBlock:(id)a3;
- (void)terminateStreamWithError:(id)a3 completionBlock:(id)a4;
@end

@implementation STAEAExtractor

- (STAEAExtractor)initWithOptions:(id)a3 delegate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = sub_20C0();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446210;
    v36 = "-[STAEAExtractor initWithOptions:delegate:]";
    _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "%{public}s: Initializing extractor", buf, 0xCu);
  }

  self->_extractor = 0;
  self->_offset = 0;
  path = self->_path;
  self->_path = 0;

  session = self->_session;
  self->_session = 0;

  v34.receiver = self;
  v34.super_class = (Class)STAEAExtractor;
  v11 = [(STAEAExtractor *)&v34 init];
  if (v11)
  {
    v12 = (NSDictionary *)[v6 copy];
    options = v11->_options;
    v11->_options = v12;

    if (objc_opt_respondsToSelector())
    {
      uint64_t v14 = [v7 sessionID];
      v15 = v11->_session;
      v11->_session = (NSString *)v14;
    }
    else
    {
      v15 = +[NSUUID UUID];
      uint64_t v16 = [v15 UUIDString];
      v17 = v11->_session;
      v11->_session = (NSString *)v16;
    }
    v18 = sub_20C0();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      v19 = v11->_session;
      *(_DWORD *)buf = 138412546;
      v36 = (const char *)v19;
      __int16 v37 = 2082;
      v38 = "-[STAEAExtractor initWithOptions:delegate:]";
      _os_log_impl(&dword_0, v18, OS_LOG_TYPE_DEFAULT, "[%@] %{public}s: new AEA extractor", buf, 0x16u);
    }

    uint64_t v20 = [v6 objectForKeyedSubscript:@"STAEAExtractorSymmetricEncryptionKey<Private>"];
    symmetricDecryptionKey = v11->_symmetricDecryptionKey;
    v11->_symmetricDecryptionKey = (NSData *)v20;

    if (v11->_symmetricDecryptionKey && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      v33 = sub_20C0();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
        sub_4B0C();
      }
    }
    else
    {
      uint64_t v22 = [v6 objectForKeyedSubscript:@"STAEAExtractorAsymmetricDecryptionKey<Private>"];
      asymmetricDecryptionKey = v11->_asymmetricDecryptionKey;
      v11->_asymmetricDecryptionKey = (NSData *)v22;

      if (v11->_asymmetricDecryptionKey && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        v33 = sub_20C0();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
          sub_4A68();
        }
      }
      else
      {
        uint64_t v24 = [v6 objectForKeyedSubscript:@"STAEAExtractorSigningPublicKey<Private>"];
        signingPublicKey = v11->_signingPublicKey;
        v11->_signingPublicKey = (NSData *)v24;

        if (v11->_signingPublicKey && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
        {
          v33 = sub_20C0();
          if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
            sub_49C4();
          }
        }
        else
        {
          uint64_t v26 = [v6 objectForKeyedSubscript:@"STAEAExtractorSourceDirectory"];
          sourceDirectory = v11->_sourceDirectory;
          v11->_sourceDirectory = (NSString *)v26;

          if (v11->_sourceDirectory && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
          {
            v33 = sub_20C0();
            if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
              sub_4920();
            }
          }
          else
          {
            uint64_t v28 = [v6 objectForKeyedSubscript:@"STAEAExtractorSourceDirectorySandboxExtension<Private>"];
            sourceDirectorySandboxExtension = v11->_sourceDirectorySandboxExtension;
            v11->_sourceDirectorySandboxExtension = (NSString *)v28;

            if (v11->_sourceDirectorySandboxExtension && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
            {
              v33 = sub_20C0();
              if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
                sub_487C();
              }
            }
            else
            {
              uint64_t v30 = [v6 objectForKeyedSubscript:@"STAEAExtractorArchiveID"];
              archiveID = v11->_archiveID;
              v11->_archiveID = (NSData *)v30;

              if (!v11->_archiveID || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
              {
                [(STAEAExtractor *)v11 setDelegate:v7];
                [(STAEAExtractor *)v11 setIsComplete:0];
                [(STAEAExtractor *)v11 setSandboxToken:-1];
                goto LABEL_22;
              }
              v33 = sub_20C0();
              if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
                sub_47D8();
              }
            }
          }
        }
      }
    }

    v11 = 0;
  }
LABEL_22:

  return v11;
}

- (void)dealloc
{
  [(STAEAExtractor *)self invalidate];
  v3.receiver = self;
  v3.super_class = (Class)STAEAExtractor;
  [(STAEAExtractor *)&v3 dealloc];
}

- (void)invalidate
{
  p_extractor = &self->_extractor;
  if (self->_extractor)
  {
    AAAssetExtractorDestroy();
    *p_extractor = 0;
    p_extractor[1] = 0;
  }
  if ([(STAEAExtractor *)self sandboxToken] != -1)
  {
    [(STAEAExtractor *)self sandboxToken];
    sandbox_extension_release();
    [(STAEAExtractor *)self setSandboxToken:-1];
  }
}

- (unint64_t)extractionMemoryFootprint
{
  return 20971520;
}

- (int)extractionProgress:(float)a3
{
  v5 = [(STAEAExtractor *)self delegate];

  if (v5)
  {
    id v6 = [(STAEAExtractor *)self delegate];
    [v6 setExtractionProgress:a3];
  }
  return 0;
}

- (int)aeaContextCallback:(AEAContext_impl *)a3
{
  v5 = [(STAEAExtractor *)self archiveID];

  if (v5)
  {
    size_t buf_size = 0;
    if (!a3)
    {
      v44 = sub_20C0();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR)) {
        sub_4F88();
      }

      v45 = STExtractorErrorDomain;
      id v6 = +[NSString stringWithFormat:@"No AEA context and archiveID is required. Likely an incorrectly formatted archive."];
      v33 = v45;
      objc_super v34 = v6;
      uint64_t v35 = 207;
      goto LABEL_24;
    }
    if (AEAContextGetFieldBlob(a3, 0x12u, 0, 0x20uLL, buf, &buf_size))
    {
      v46 = sub_20C0();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR)) {
        sub_50D0();
      }

      v47 = STExtractorErrorDomain;
      id v6 = +[NSString stringWithFormat:@"Failed to get archive identifier from extractor context - identifier is required"];
      v33 = v47;
      objc_super v34 = v6;
      uint64_t v35 = 210;
      goto LABEL_24;
    }
    id v6 = +[NSData dataWithBytesNoCopy:buf length:buf_size freeWhenDone:0];
    id v7 = [(STAEAExtractor *)self archiveID];
    unsigned __int8 v8 = [v7 isEqualToData:v6];

    if ((v8 & 1) == 0)
    {
      v48 = sub_20C0();
      if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR)) {
        sub_502C();
      }

      v49 = STExtractorErrorDomain;
      v36 = [(STAEAExtractor *)self archiveID];
      v50 = +[NSString stringWithFormat:@"Archive identifier mismatch.  Archive: %@ - Expected: %@", v6, v36];
      v51 = sub_20AC(v49, 6, v50, 0, (uint64_t)"-[STAEAExtractor aeaContextCallback:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/StreamingExtractor/AEAExtractionPlugin/STAEAExtractorPlugin.m", 213);
      [(STAEAExtractor *)self setError:v51];

      goto LABEL_25;
    }
  }
  v9 = [(STAEAExtractor *)self asymmetricDecryptionKey];

  if (v9)
  {
    v10 = sub_20C0();
    v11 = v10;
    if (!a3)
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        sub_4EE4();
      }

      v52 = STExtractorErrorDomain;
      id v6 = +[NSString stringWithFormat:@"No AEA context and decryption key was provided. Archive is not encrypted."];
      v33 = v52;
      objc_super v34 = v6;
      uint64_t v35 = 218;
      goto LABEL_24;
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      session = self->_session;
      v13 = [(STAEAExtractor *)self asymmetricDecryptionKey];
      id v14 = [v13 length];
      *(_DWORD *)buf = 138412802;
      v60 = session;
      __int16 v61 = 2082;
      v62 = "-[STAEAExtractor aeaContextCallback:]";
      __int16 v63 = 2048;
      id v64 = v14;
      _os_log_impl(&dword_0, v11, OS_LOG_TYPE_DEFAULT, "[%@] %{public}s: Setting asymmetric key on AEA context (%lu bytes)", buf, 0x20u);
    }
    id v15 = [(STAEAExtractor *)self asymmetricDecryptionKey];
    uint64_t v16 = (const uint8_t *)[v15 bytes];
    v17 = [(STAEAExtractor *)self asymmetricDecryptionKey];
    id v18 = [v17 length];
    v19 = a3;
    AEAContextField v20 = 11;
    AEAContextFieldRepresentation v21 = 1;
  }
  else
  {
    uint64_t v22 = [(STAEAExtractor *)self symmetricDecryptionKey];

    if (!v22) {
      goto LABEL_17;
    }
    v23 = sub_20C0();
    uint64_t v24 = v23;
    if (!a3)
    {
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
        sub_4D9C();
      }

      v55 = STExtractorErrorDomain;
      id v6 = +[NSString stringWithFormat:@"No AEA context and decryption key was provided. Archive is not encrypted."];
      v33 = v55;
      objc_super v34 = v6;
      uint64_t v35 = 223;
      goto LABEL_24;
    }
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      v25 = self->_session;
      uint64_t v26 = [(STAEAExtractor *)self asymmetricDecryptionKey];
      id v27 = [v26 length];
      *(_DWORD *)buf = 138412802;
      v60 = v25;
      __int16 v61 = 2082;
      v62 = "-[STAEAExtractor aeaContextCallback:]";
      __int16 v63 = 2048;
      id v64 = v27;
      _os_log_impl(&dword_0, v24, OS_LOG_TYPE_DEFAULT, "[%@] %{public}s: Setting symmetric key on AEA context (%lu bytes)", buf, 0x20u);
    }
    id v15 = [(STAEAExtractor *)self symmetricDecryptionKey];
    uint64_t v16 = (const uint8_t *)[v15 bytes];
    v17 = [(STAEAExtractor *)self symmetricDecryptionKey];
    id v18 = [v17 length];
    v19 = a3;
    AEAContextField v20 = 9;
    AEAContextFieldRepresentation v21 = 0;
  }
  int v28 = AEAContextSetFieldBlob(v19, v20, v21, v16, (size_t)v18);

  if (v28 == -1)
  {
    v42 = sub_20C0();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR)) {
      sub_4E40();
    }

    v43 = STExtractorErrorDomain;
    id v6 = +[NSString stringWithFormat:@"Failed to set encryption key on extractor context"];
    v33 = v43;
    objc_super v34 = v6;
    uint64_t v35 = 228;
    goto LABEL_24;
  }
LABEL_17:
  v29 = [(STAEAExtractor *)self signingPublicKey];

  if (v29)
  {
    if (!a3)
    {
      v53 = sub_20C0();
      if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR)) {
        sub_4BB0();
      }

      v54 = STExtractorErrorDomain;
      id v6 = +[NSString stringWithFormat:@"Archive is not signed - signing key was provided and is required"];
      v33 = v54;
      objc_super v34 = v6;
      uint64_t v35 = 234;
      goto LABEL_24;
    }
    unsigned int FieldUInt = AEAContextGetFieldUInt(a3, 0);
    if (FieldUInt <= 5 && ((1 << FieldUInt) & 0x2A) != 0)
    {
      v31 = sub_20C0();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
        sub_4CF8();
      }

      v32 = STExtractorErrorDomain;
      id v6 = +[NSString stringWithFormat:@"Archive is not signed - signing key was provided"];
      v33 = v32;
      objc_super v34 = v6;
      uint64_t v35 = 237;
LABEL_24:
      v36 = sub_20AC(v33, 6, v34, 0, (uint64_t)"-[STAEAExtractor aeaContextCallback:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/StreamingExtractor/AEAExtractionPlugin/STAEAExtractorPlugin.m", v35);
      [(STAEAExtractor *)self setError:v36];
LABEL_25:

      return -1;
    }
    id v38 = [(STAEAExtractor *)self signingPublicKey];
    v39 = (const uint8_t *)[v38 bytes];
    v40 = [(STAEAExtractor *)self signingPublicKey];
    int v41 = AEAContextSetFieldBlob(a3, 7u, 1u, v39, (size_t)[v40 length]);

    if (v41 == -1)
    {
      v56 = sub_20C0();
      if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR)) {
        sub_4C54();
      }

      v57 = STExtractorErrorDomain;
      id v6 = +[NSString stringWithFormat:@"Failed to set signing key on extractor context"];
      v33 = v57;
      objc_super v34 = v6;
      uint64_t v35 = 240;
      goto LABEL_24;
    }
  }
  return 0;
}

- (int)processEntryMessage:(unsigned int)a3 path:(const char *)a4 data:(void *)a5
{
  if (a3 == 92 && ![(STAEAExtractor *)self isComplete])
  {
    [(STAEAExtractor *)self setIsComplete:1];
    id v6 = [(STAEAExtractor *)self delegate];
    [v6 extractionCompleteAtArchivePath:self->_path];
  }
  return 0;
}

- (void)prepareForExtractionToPath:(id)a3 withCompletionBlock:(id)a4
{
  id v7 = a3;
  unsigned __int8 v8 = (void (**)(id, void, void *))a4;
  v9 = sub_20C0();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    session = self->_session;
    *(_DWORD *)buf = 138412802;
    v48 = session;
    __int16 v49 = 2082;
    v50 = "-[STAEAExtractor prepareForExtractionToPath:withCompletionBlock:]";
    __int16 v51 = 2112;
    int64_t v52 = (int64_t)v7;
    _os_log_impl(&dword_0, v9, OS_LOG_TYPE_DEFAULT, "[%@] %{public}s: Preparing to extract to %@", buf, 0x20u);
  }

  objc_storeStrong((id *)&self->_path, a3);
  AAThreadErrorContextEnter();
  id v11 = v7;
  [v11 UTF8String];
  p_int64_t offset = &self->_offset;
  v13 = (AAAssetExtractor_impl *)AAAssetExtractorCreate();
  self->_extractor = v13;
  id v14 = sub_20C0();
  id v15 = v14;
  if (!v13)
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_5174();
    }

    int v28 = +[NSString stringWithFormat:@"Couldn't create extractor"];
    v29 = v28;
    uint64_t v30 = 331;
    goto LABEL_31;
  }
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v16 = self->_session;
    int64_t offset = self->_offset;
    *(_DWORD *)buf = 138412802;
    v48 = v16;
    __int16 v49 = 2082;
    v50 = "-[STAEAExtractor prepareForExtractionToPath:withCompletionBlock:]";
    __int16 v51 = 2048;
    int64_t v52 = offset;
    _os_log_impl(&dword_0, v15, OS_LOG_TYPE_DEFAULT, "[%@] %{public}s: starting extraction offset: %llu", buf, 0x20u);
  }

  id v18 = [(STAEAExtractor *)self sourceDirectory];

  if (!v18)
  {
LABEL_10:
    uint64_t v23 = AAAssetExtractorSetParameterCallback();
    if (v23)
    {
      uint64_t v31 = v23;
      v32 = sub_20C0();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
        sub_5404();
      }

      int v28 = +[NSString stringWithFormat:@"Couldn't set extractor context callback, returned %d", v31];
      v29 = v28;
      uint64_t v30 = 346;
    }
    else
    {
      uint64_t v24 = AAAssetExtractorSetParameterCallback();
      if (v24)
      {
        uint64_t v33 = v24;
        objc_super v34 = sub_20C0();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
          sub_5360();
        }

        int v28 = +[NSString stringWithFormat:@"Couldn't set extractor progress callback, returned %d", v33];
        v29 = v28;
        uint64_t v30 = 349;
      }
      else
      {
        uint64_t v25 = AAAssetExtractorSetParameterCallback();
        if (v25)
        {
          uint64_t v35 = v25;
          v36 = sub_20C0();
          if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
            sub_52BC();
          }

          int v28 = +[NSString stringWithFormat:@"Couldn't set extractor entry message callback, returned %d", v35];
          v29 = v28;
          uint64_t v30 = 352;
        }
        else
        {
          uint64_t v26 = AAAssetExtractorSetParameterPtr();
          if (!v26)
          {
            AAThreadErrorContextLeave();
            id v27 = 0;
            goto LABEL_15;
          }
          uint64_t v37 = v26;
          id v38 = sub_20C0();
          if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR)) {
            sub_5218();
          }

          int v28 = +[NSString stringWithFormat:@"Couldn't set extractor progress arg, returned %d", v37];
          v29 = v28;
          uint64_t v30 = 355;
        }
      }
    }
LABEL_31:
    id v27 = STCreateAEAError(v28, (uint64_t)"-[STAEAExtractor prepareForExtractionToPath:withCompletionBlock:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/StreamingExtractor/AEAExtractionPlugin/STAEAExtractorPlugin.m", v30);

    goto LABEL_15;
  }
  v19 = [(STAEAExtractor *)self sourceDirectorySandboxExtension];

  if (v19
    && ([(STAEAExtractor *)self sourceDirectorySandboxExtension],
        id v20 = objc_claimAutoreleasedReturnValue(),
        [v20 UTF8String],
        [(STAEAExtractor *)self setSandboxToken:sandbox_extension_consume()],
        v20,
        [(STAEAExtractor *)self sandboxToken] == -1))
  {
    v42 = sub_20C0();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR)) {
      sub_554C();
    }

    v43 = STExtractorErrorDomain;
    v44 = __error();
    v45 = strerror(*v44);
    v46 = +[NSString stringWithFormat:@"Couldn't acquire sandbox extension: %s (%d)", v45, *__error()];
    id v27 = sub_20AC(v43, 10, v46, 0, (uint64_t)"-[STAEAExtractor prepareForExtractionToPath:withCompletionBlock:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/StreamingExtractor/AEAExtractionPlugin/STAEAExtractorPlugin.m", 338);

    AAThreadErrorContextLeave();
  }
  else
  {
    id v21 = [(STAEAExtractor *)self sourceDirectory];
    [v21 UTF8String];
    uint64_t v22 = AAAssetExtractorSetParameterPtr();

    if (!v22) {
      goto LABEL_10;
    }
    v39 = sub_20C0();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR)) {
      sub_54A8();
    }

    v40 = [(STAEAExtractor *)self sourceDirectory];
    int v41 = +[NSString stringWithFormat:@"Couldn't set input directory \"%@\", returned %d", v40, v22];
    id v27 = STCreateAEAError(v41, (uint64_t)"-[STAEAExtractor prepareForExtractionToPath:withCompletionBlock:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/StreamingExtractor/AEAExtractionPlugin/STAEAExtractorPlugin.m", 342);
  }
LABEL_15:
  v8[2](v8, *p_offset, v27);
}

- (void)supplyBytes:(id)a3 withCompletionBlock:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void, BOOL))a4;
  uint64_t v31 = 0;
  v32 = &v31;
  uint64_t v33 = 0x3032000000;
  objc_super v34 = sub_3B40;
  uint64_t v35 = sub_3B50;
  id v36 = 0;
  id v8 = [v6 length];
  uint64_t v27 = 0;
  int v28 = &v27;
  uint64_t v29 = 0x2020000000;
  char v30 = 0;
  v9 = [(STAEAExtractor *)self error];
  BOOL v10 = v9 == 0;

  if (v10)
  {
    if (self->_extractor)
    {
      id v11 = sub_20C0();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        session = self->_session;
        int64_t offset = self->_offset;
        *(_DWORD *)buf = 138413058;
        id v38 = session;
        __int16 v39 = 2082;
        v40 = "-[STAEAExtractor supplyBytes:withCompletionBlock:]";
        __int16 v41 = 2048;
        id v42 = v8;
        __int16 v43 = 2048;
        int64_t v44 = offset;
        _os_log_impl(&dword_0, v11, OS_LOG_TYPE_DEFAULT, "[%@] %{public}s: Received %zu bytes for extraction, offset %lld", buf, 0x2Au);
      }

      AAThreadErrorContextEnter();
      *((unsigned char *)v28 + 24) = 1;
      v26[0] = _NSConcreteStackBlock;
      v26[1] = 3221225472;
      v26[2] = sub_3B58;
      v26[3] = &unk_8270;
      v26[4] = self;
      v26[5] = &v31;
      v26[6] = &v27;
      v26[7] = v8;
      [v6 enumerateByteRangesUsingBlock:v26];
    }
    else
    {
      id v21 = sub_20C0();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
        sub_5694();
      }

      uint64_t v22 = STExtractorErrorDomain;
      uint64_t v23 = +[NSString stringWithFormat:@"Extractor is NULL"];
      uint64_t v24 = sub_20AC(v22, 1, v23, 0, (uint64_t)"-[STAEAExtractor supplyBytes:withCompletionBlock:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/StreamingExtractor/AEAExtractionPlugin/STAEAExtractorPlugin.m", 376);
      uint64_t v25 = (void *)v32[5];
      v32[5] = v24;
    }
  }
  else
  {
    id v20 = sub_20C0();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      sub_5738();
    }
  }
  if (*((unsigned char *)v28 + 24)) {
    AAThreadErrorContextLeave();
  }
  if (v32[5])
  {
    id v14 = [(STAEAExtractor *)self error];
    BOOL v15 = v14 == 0;

    if (v15) {
      [(STAEAExtractor *)self setError:v32[5]];
    }
  }
  else
  {
    uint64_t v16 = [(STAEAExtractor *)self error];
    BOOL v17 = v16 == 0;

    if (!v17)
    {
      uint64_t v18 = [(STAEAExtractor *)self error];
      v19 = (void *)v32[5];
      v32[5] = v18;
    }
  }
  v7[2](v7, v32[5], [(STAEAExtractor *)self isComplete] != 0);
  _Block_object_dispose(&v27, 8);
  _Block_object_dispose(&v31, 8);
}

- (void)suspendStreamWithCompletionBlock:(id)a3
{
  v4 = (void (**)(id, int64_t, void *))a3;
  v5 = sub_20C0();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    session = self->_session;
    *(_DWORD *)buf = 138412546;
    uint64_t v26 = session;
    __int16 v27 = 2082;
    int v28 = "-[STAEAExtractor suspendStreamWithCompletionBlock:]";
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "[%@] %{public}s: Suspending extraction", buf, 0x16u);
  }

  if (!self->_extractor)
  {
    id v14 = sub_20C0();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_58D4();
    }

    BOOL v15 = STExtractorErrorDomain;
    uint64_t v16 = +[NSString stringWithFormat:@"No extractor to suspend"];
    uint64_t v17 = sub_20AC(v15, 7, v16, 0, (uint64_t)"-[STAEAExtractor suspendStreamWithCompletionBlock:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/StreamingExtractor/AEAExtractionPlugin/STAEAExtractorPlugin.m", 461);
    goto LABEL_14;
  }
  AAThreadErrorContextEnter();
  id v7 = sub_20C0();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = self->_session;
    *(_DWORD *)buf = 138412546;
    uint64_t v26 = v8;
    __int16 v27 = 2082;
    int v28 = "-[STAEAExtractor suspendStreamWithCompletionBlock:]";
    _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "[%@] %{public}s: Calling AAAssetExtractorDestroy()", buf, 0x16u);
  }

  uint64_t v9 = AAAssetExtractorDestroy();
  self->_extractor = 0;
  if (v9 >= 2)
  {
    uint64_t v24 = sub_20C0();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      sub_5954();
    }

    uint64_t v16 = +[NSString stringWithFormat:@"failed to suspend stream: %d", v9];
    uint64_t v17 = STCreateAEAError(v16, (uint64_t)"-[STAEAExtractor suspendStreamWithCompletionBlock:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/StreamingExtractor/AEAExtractionPlugin/STAEAExtractorPlugin.m", 449);
LABEL_14:
    uint64_t v18 = (void *)v17;

    goto LABEL_19;
  }
  BOOL v10 = sub_20C0();
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
  if (v9 == 1)
  {
    if (v11)
    {
      v12 = self->_session;
      int64_t offset = self->_offset;
      *(_DWORD *)buf = 138412802;
      uint64_t v26 = v12;
      __int16 v27 = 2082;
      int v28 = "-[STAEAExtractor suspendStreamWithCompletionBlock:]";
      __int16 v29 = 2048;
      int64_t v30 = offset;
      _os_log_impl(&dword_0, v10, OS_LOG_TYPE_DEFAULT, "[%@] %{public}s: successfully suspended stream with offset: %llu", buf, 0x20u);
    }
  }
  else
  {
    if (v11)
    {
      v19 = self->_session;
      int64_t v20 = self->_offset;
      *(_DWORD *)buf = 138412802;
      uint64_t v26 = v19;
      __int16 v27 = 2082;
      int v28 = "-[STAEAExtractor suspendStreamWithCompletionBlock:]";
      __int16 v29 = 2048;
      int64_t v30 = v20;
      _os_log_impl(&dword_0, v10, OS_LOG_TYPE_DEFAULT, "[%@] %{public}s: AAAssetExtractorDestroy() was successful but stream was not suspended (offset: %llu) - stream was already complete", buf, 0x20u);
    }

    self->_int64_t offset = 0;
  }
  AAThreadErrorContextLeave();
  uint64_t v18 = 0;
LABEL_19:
  id v21 = [(STAEAExtractor *)self error];

  if (!v21 && v18) {
    [(STAEAExtractor *)self setError:v18];
  }
  int64_t v22 = self->_offset;
  uint64_t v23 = [(STAEAExtractor *)self error];
  v4[2](v4, v22, v23);
}

- (void)finishStreamWithCompletionBlock:(id)a3
{
  v4 = (void (**)(id, void *))a3;
  v5 = sub_20C0();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    session = self->_session;
    *(_DWORD *)buf = 138412546;
    uint64_t v17 = session;
    __int16 v18 = 2082;
    v19 = "-[STAEAExtractor finishStreamWithCompletionBlock:]";
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "[%@] %{public}s: Finishing extraction", buf, 0x16u);
  }

  if (!self->_extractor) {
    goto LABEL_12;
  }
  AAThreadErrorContextEnter();
  id v7 = sub_20C0();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = self->_session;
    *(_DWORD *)buf = 138412546;
    uint64_t v17 = v8;
    __int16 v18 = 2082;
    v19 = "-[STAEAExtractor finishStreamWithCompletionBlock:]";
    _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "[%@] %{public}s: Calling AAAssetExtractorDestroy()", buf, 0x16u);
  }

  uint64_t v9 = AAAssetExtractorDestroy();
  self->_extractor = 0;
  self->_int64_t offset = 0;
  if (!v9)
  {
    AAThreadErrorContextLeave();
LABEL_12:
    BOOL v15 = 0;
    goto LABEL_15;
  }
  uint64_t v10 = v9;
  BOOL v11 = sub_20C0();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
    sub_59F8();
  }

  if ((int)v10 < 1)
  {
    v12 = +[NSString stringWithFormat:@"Couldn't destroy extractor (%d)", v10];
    v13 = v12;
    uint64_t v14 = 498;
  }
  else
  {
    v12 = +[NSString stringWithFormat:@"Extraction not complete (%d)", v10];
    v13 = v12;
    uint64_t v14 = 496;
  }
  BOOL v15 = STCreateAEAError(v12, (uint64_t)"-[STAEAExtractor finishStreamWithCompletionBlock:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/StreamingExtractor/AEAExtractionPlugin/STAEAExtractorPlugin.m", v14);

LABEL_15:
  v4[2](v4, v15);
}

- (void)terminateStreamWithError:(id)a3 completionBlock:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, id))a4;
  id v8 = sub_20C0();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
    sub_5AE0();
  }

  if (self->_extractor)
  {
    uint64_t v9 = sub_20C0();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      session = self->_session;
      int v13 = 138412546;
      uint64_t v14 = session;
      __int16 v15 = 2082;
      uint64_t v16 = "-[STAEAExtractor terminateStreamWithError:completionBlock:]";
      _os_log_impl(&dword_0, v9, OS_LOG_TYPE_DEFAULT, "[%@] %{public}s: Calling AAAssetExtractorDestroy", (uint8_t *)&v13, 0x16u);
    }

    int v11 = AAAssetExtractorDestroy();
    self->_extractor = 0;
    self->_int64_t offset = 0;
    if (v11)
    {
      v12 = sub_20C0();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        sub_5A6C();
      }
    }
  }
  v7[2](v7, v6);
}

- (NSDictionary)options
{
  return self->_options;
}

- (STExtractionPluginDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (STExtractionPluginDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (unsigned)isComplete
{
  return self->_isComplete;
}

- (void)setIsComplete:(unsigned __int8)a3
{
  self->_isComplete = a3;
}

- (NSData)symmetricDecryptionKey
{
  return self->_symmetricDecryptionKey;
}

- (NSData)asymmetricDecryptionKey
{
  return self->_asymmetricDecryptionKey;
}

- (NSData)signingPublicKey
{
  return self->_signingPublicKey;
}

- (NSString)sourceDirectory
{
  return self->_sourceDirectory;
}

- (NSString)sourceDirectorySandboxExtension
{
  return self->_sourceDirectorySandboxExtension;
}

- (unint64_t)sandboxToken
{
  return self->_sandboxToken;
}

- (void)setSandboxToken:(unint64_t)a3
{
  self->_sandboxToken = a3;
}

- (NSData)archiveID
{
  return self->_archiveID;
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_archiveID, 0);
  objc_storeStrong((id *)&self->_sourceDirectorySandboxExtension, 0);
  objc_storeStrong((id *)&self->_sourceDirectory, 0);
  objc_storeStrong((id *)&self->_signingPublicKey, 0);
  objc_storeStrong((id *)&self->_asymmetricDecryptionKey, 0);
  objc_storeStrong((id *)&self->_symmetricDecryptionKey, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_session, 0);

  objc_storeStrong((id *)&self->_path, 0);
}

@end
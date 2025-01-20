@interface SZExtractor
+ (BOOL)supportsSecureCoding;
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
- (void)setDelegate:(id)a3;
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
  v3 = [(SZExtractor *)self extractionPath];

  if (v3)
  {
    v4 = [(SZExtractor *)self extractionPath];
    v5 = [v4 lastPathComponent];

    v6 = [(SZExtractor *)self extractionPath];
    v7 = [v6 stringByDeletingLastPathComponent];
    v8 = [v7 lastPathComponent];

    v9 = +[NSString stringWithFormat:@"pathEnding:%@/%@", v8, v5];
  }
  else
  {
    v9 = @"path:nil";
  }
  v10 = (objc_class *)objc_opt_class();
  v11 = NSStringFromClass(v10);
  unsigned int v12 = [(SZExtractor *)self needsPreparation];
  v13 = [(SZExtractor *)self unzipServiceConnection];
  v14 = [(SZExtractor *)self error];
  uint64_t v15 = 89;
  if (v13) {
    uint64_t v16 = 89;
  }
  else {
    uint64_t v16 = 78;
  }
  if (v12) {
    uint64_t v15 = 78;
  }
  v17 = +[NSString stringWithFormat:@"<%@<%p> prepared:%c valid:%c %@ error:%@>", v11, self, v15, v16, v9, v14];

  return (NSString *)v17;
}

- (void)setActiveExtractorDelegateMethods:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  v5 = sub_100003788();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v13 = self;
    __int16 v14 = 1024;
    int v15 = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@: setting active extractor delegate methods to 0x%x", buf, 0x12u);
  }

  v6 = [(SZExtractor *)self inProcessUnzipper];

  if (v6)
  {
    v7 = [(SZExtractor *)self serialQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100004210;
    block[3] = &unk_100028A50;
    block[4] = self;
    int v11 = v3;
    dispatch_async(v7, block);
  }
  else
  {
    v7 = [(SZExtractor *)self unzipServiceConnection];
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100004264;
    v9[3] = &unk_100028A78;
    v9[4] = self;
    v8 = [v7 remoteObjectProxyWithErrorHandler:v9];
    [v8 setActiveDelegateMethods:v3];
  }
}

- (SZExtractorDelegate)extractorDelegate
{
  uint64_t v2 = [(SZExtractor *)self internalExtractorDelegate];
  uint64_t v3 = (void *)v2;
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
  uint64_t v3 = (void *)v2;
  if (v2) {
    id WeakRetained = objc_loadWeakRetained((id *)(v2 + 8));
  }
  else {
    id WeakRetained = 0;
  }

  return (SZExtractorDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void)setExtractorDelegate:(id)a3
{
  v4 = (char *)a3;
  if ([(SZExtractor *)self needsPreparation])
  {
    v5 = sub_100003788();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v13 = 138412546;
      __int16 v14 = self;
      __int16 v15 = 2080;
      uint64_t v16 = "-[SZExtractor setExtractorDelegate:]";
      v6 = "%@: %s was called before -[SZExtractor prepareForExtraction:]; this doesn't do anything";
LABEL_20:
      _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, v6, (uint8_t *)&v13, 0x16u);
      goto LABEL_17;
    }
    goto LABEL_17;
  }
  unsigned __int8 v7 = [(SZExtractor *)self _isValidObject];
  v8 = sub_100003788();
  v5 = v8;
  if ((v7 & 1) == 0)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v13 = 138412546;
      __int16 v14 = self;
      __int16 v15 = 2080;
      uint64_t v16 = "-[SZExtractor setExtractorDelegate:]";
      v6 = "%@: %s was called on an invalidated object";
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
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@: Setting extractor delegate to 0x%p", (uint8_t *)&v13, 0x16u);
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
  unsigned int v12 = (void *)v11;
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
  v6 = (SZExtractor *)a3;
  unsigned __int8 v7 = (void (**)(id, uint64_t))a4;
  v8 = sub_100003788();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v33 = self;
    __int16 v34 = 2112;
    v35 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%@: terminating stream with error %@", buf, 0x16u);
  }

  char v9 = [(SZExtractor *)self error];

  if (v9)
  {
    uint64_t v10 = sub_100003788();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v22 = [(SZExtractor *)self error];
      *(_DWORD *)buf = 138412546;
      v33 = self;
      __int16 v34 = 2112;
      v35 = v22;
      _os_log_error_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "%@: terminate called on extractor that had already returned error %@", buf, 0x16u);
    }
    uint64_t v11 = [(SZExtractor *)self error];
    goto LABEL_18;
  }
  if ([(SZExtractor *)self needsPreparation])
  {
    unsigned int v12 = sub_100003788();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v33 = (SZExtractor *)"-[SZExtractor terminateStreamWithError:completionBlock:]";
      __int16 v34 = 2112;
      v35 = self;
      _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%s called before -[SZExtractor prepareForExtraction:] on %@", buf, 0x16u);
    }

    sub_100004A7C((uint64_t)"-[SZExtractor terminateStreamWithError:completionBlock:]", 993, @"SZExtractorErrorDomain", 3, 0, 0, @"%s called before -[SZExtractor prepareForExtraction:] on %@", v13, (uint64_t)"-[SZExtractor terminateStreamWithError:completionBlock:]");
    uint64_t v11 = LABEL_17:;
LABEL_18:
    v21 = (void *)v11;
    v7[2](v7, v11);

    goto LABEL_19;
  }
  if (![(SZExtractor *)self _isValidObject])
  {
    v19 = sub_100003788();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v33 = (SZExtractor *)"-[SZExtractor terminateStreamWithError:completionBlock:]";
      __int16 v34 = 2112;
      v35 = self;
      _os_log_error_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "%s called on an invalidated object: %@", buf, 0x16u);
    }

    sub_100004A7C((uint64_t)"-[SZExtractor terminateStreamWithError:completionBlock:]", 999, @"SZExtractorErrorDomain", 3, 0, 0, @"%s called on an invalidated object: %@", v20, (uint64_t)"-[SZExtractor terminateStreamWithError:completionBlock:]");
    goto LABEL_17;
  }
  [(SZExtractor *)self setHasHadPostSetupMethodsCalled:1];
  [(SZExtractor *)self setError:v6];
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  v30[2] = sub_100004C1C;
  v30[3] = &unk_1000287A8;
  v30[4] = self;
  v31 = v7;
  __int16 v14 = objc_retainBlock(v30);
  __int16 v15 = [(SZExtractor *)self inProcessUnzipper];

  if (v15)
  {
    uint64_t v16 = [(SZExtractor *)self serialQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100004D00;
    block[3] = &unk_100028848;
    block[4] = self;
    v29 = v14;
    v17 = v14;
    dispatch_async(v16, block);

    v18 = v29;
  }
  else
  {
    v23 = [(SZExtractor *)self unzipServiceConnection];
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_100004D54;
    v26[3] = &unk_100028A28;
    v27 = v14;
    v24 = v14;
    v25 = [v23 remoteObjectProxyWithErrorHandler:v26];
    [v25 terminateStreamWithReply:v24];

    v18 = v27;
  }

LABEL_19:
}

- (void)finishStreamWithCompletionBlock:(id)a3
{
  v4 = (void (**)(id, uint64_t))a3;
  v5 = sub_100003788();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v30 = self;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@: finishing stream", buf, 0xCu);
  }

  v6 = [(SZExtractor *)self error];

  if (v6)
  {
    unsigned __int8 v7 = sub_100003788();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v19 = [(SZExtractor *)self error];
      *(_DWORD *)buf = 138412546;
      v30 = self;
      __int16 v31 = 2112;
      v32 = v19;
      _os_log_error_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "%@: finish called on extractor that had already returned error %@", buf, 0x16u);
    }
    uint64_t v8 = [(SZExtractor *)self error];
    goto LABEL_18;
  }
  if ([(SZExtractor *)self needsPreparation])
  {
    char v9 = sub_100003788();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v30 = (SZExtractor *)"-[SZExtractor finishStreamWithCompletionBlock:]";
      __int16 v31 = 2112;
      v32 = self;
      _os_log_error_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%s called before -[SZExtractor prepareForExtraction:] on %@", buf, 0x16u);
    }

    sub_100004A7C((uint64_t)"-[SZExtractor finishStreamWithCompletionBlock:]", 949, @"SZExtractorErrorDomain", 3, 0, 0, @"%s called before -[SZExtractor prepareForExtraction:] on %@", v10, (uint64_t)"-[SZExtractor finishStreamWithCompletionBlock:]");
    uint64_t v8 = LABEL_17:;
LABEL_18:
    v18 = (void *)v8;
    v4[2](v4, v8);

    goto LABEL_19;
  }
  if (![(SZExtractor *)self _isValidObject])
  {
    uint64_t v16 = sub_100003788();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v30 = (SZExtractor *)"-[SZExtractor finishStreamWithCompletionBlock:]";
      __int16 v31 = 2112;
      v32 = self;
      _os_log_error_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "%s called on an invalidated object: %@", buf, 0x16u);
    }

    sub_100004A7C((uint64_t)"-[SZExtractor finishStreamWithCompletionBlock:]", 955, @"SZExtractorErrorDomain", 3, 0, 0, @"%s called on an invalidated object: %@", v17, (uint64_t)"-[SZExtractor finishStreamWithCompletionBlock:]");
    goto LABEL_17;
  }
  [(SZExtractor *)self setHasHadPostSetupMethodsCalled:1];
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_1000051A4;
  v27[3] = &unk_1000287A8;
  v27[4] = self;
  v28 = v4;
  uint64_t v11 = objc_retainBlock(v27);
  unsigned int v12 = [(SZExtractor *)self inProcessUnzipper];

  if (v12)
  {
    uint64_t v13 = [(SZExtractor *)self serialQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100005298;
    block[3] = &unk_100028848;
    block[4] = self;
    v26 = v11;
    __int16 v14 = v11;
    dispatch_async(v13, block);

    __int16 v15 = v26;
  }
  else
  {
    uint64_t v20 = [(SZExtractor *)self unzipServiceConnection];
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_1000052EC;
    v23[3] = &unk_100028A28;
    v24 = v11;
    v21 = v11;
    v22 = [v20 remoteObjectProxyWithErrorHandler:v23];
    [v22 finishStreamWithReply:v21];

    __int16 v15 = v24;
  }

LABEL_19:
}

- (void)suspendStreamWithCompletionBlock:(id)a3
{
}

- (void)_suspendStreamWithCompletionBlockSynchronously:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  v6 = (void (**)(id, void, uint64_t))a4;
  unsigned __int8 v7 = sub_100003788();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v32 = self;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%@: suspending stream", buf, 0xCu);
  }

  uint64_t v8 = [(SZExtractor *)self error];

  if (v8)
  {
    char v9 = sub_100003788();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      uint64_t v20 = [(SZExtractor *)self error];
      *(_DWORD *)buf = 138412546;
      v32 = self;
      __int16 v33 = 2112;
      __int16 v34 = v20;
      _os_log_error_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%@: suspend called on extractor that had already returned error %@", buf, 0x16u);
    }
    uint64_t v10 = [(SZExtractor *)self error];
    goto LABEL_18;
  }
  if ([(SZExtractor *)self needsPreparation])
  {
    uint64_t v11 = sub_100003788();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v32 = (SZExtractor *)"-[SZExtractor _suspendStreamWithCompletionBlockSynchronously:completion:]";
      __int16 v33 = 2112;
      __int16 v34 = self;
      _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "%s called before -[SZExtractor prepareForExtraction:] on %@", buf, 0x16u);
    }

    sub_100004A7C((uint64_t)"-[SZExtractor _suspendStreamWithCompletionBlockSynchronously:completion:]", 891, @"SZExtractorErrorDomain", 3, 0, 0, @"%s called before -[SZExtractor prepareForExtraction:] on %@", v12, (uint64_t)"-[SZExtractor _suspendStreamWithCompletionBlockSynchronously:completion:]");
    uint64_t v10 = LABEL_17:;
LABEL_18:
    v19 = (void *)v10;
    v6[2](v6, 0, v10);

    goto LABEL_19;
  }
  if (![(SZExtractor *)self _isValidObject])
  {
    uint64_t v17 = sub_100003788();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v32 = (SZExtractor *)"-[SZExtractor _suspendStreamWithCompletionBlockSynchronously:completion:]";
      __int16 v33 = 2112;
      __int16 v34 = self;
      _os_log_error_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "%s called on an invalidated object: %@", buf, 0x16u);
    }

    sub_100004A7C((uint64_t)"-[SZExtractor _suspendStreamWithCompletionBlockSynchronously:completion:]", 897, @"SZExtractorErrorDomain", 3, 0, 0, @"%s called on an invalidated object: %@", v18, (uint64_t)"-[SZExtractor _suspendStreamWithCompletionBlockSynchronously:completion:]");
    goto LABEL_17;
  }
  [(SZExtractor *)self setHasHadPostSetupMethodsCalled:1];
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_100005780;
  v29[3] = &unk_100028A00;
  v29[4] = self;
  v30 = v6;
  uint64_t v13 = objc_retainBlock(v29);
  __int16 v14 = [(SZExtractor *)self inProcessUnzipper];

  if (v14)
  {
    __int16 v15 = [(SZExtractor *)self serialQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100005888;
    block[3] = &unk_100028848;
    block[4] = self;
    id v28 = v13;
    uint64_t v16 = v13;
    dispatch_async(v15, block);
  }
  else
  {
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_1000058DC;
    v25[3] = &unk_100028A28;
    id v26 = v13;
    v21 = v13;
    v22 = objc_retainBlock(v25);
    v23 = [(SZExtractor *)self unzipServiceConnection];
    v24 = v23;
    if (v4) {
      [v23 synchronousRemoteObjectProxyWithErrorHandler:v22];
    }
    else {
    uint64_t v16 = [v23 remoteObjectProxyWithErrorHandler:v22];
    }

    [v16 suspendStreamWithReply:v21];
  }

LABEL_19:
}

- (void)supplyBytes:(id)a3 withCompletionBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 length];
  char v9 = sub_100003830();
  if (os_signpost_enabled(v9))
  {
    *(_DWORD *)buf = 138412546;
    *(void *)&uint8_t buf[4] = self;
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = v8;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v9, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "SUPPLY_BYTES", "%@: Supply bytes with length %lu began", buf, 0x16u);
  }

  v50[0] = _NSConcreteStackBlock;
  v50[1] = 3221225472;
  v50[2] = sub_100005FA8;
  v50[3] = &unk_100028870;
  id v52 = v8;
  id v10 = v7;
  id v51 = v10;
  uint64_t v11 = objc_retainBlock(v50);
  uint64_t v12 = [(SZExtractor *)self error];

  if (v12)
  {
    uint64_t v13 = sub_100003788();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v23 = [(SZExtractor *)self error];
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = self;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v23;
      _os_log_error_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%@: supply called on extractor that had already returned error %@", buf, 0x16u);
    }
    id v14 = [(SZExtractor *)self error];
    ((void (*)(void *, id, uint64_t))v11[2])(v11, v14, 1);
  }
  else if ([(SZExtractor *)self needsPreparation])
  {
    __int16 v15 = sub_100003788();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      *(void *)&uint8_t buf[4] = "-[SZExtractor supplyBytes:withCompletionBlock:]";
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = self;
      _os_log_error_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%s called before -[SZExtractor prepareForExtraction:] on %@", buf, 0x16u);
    }

    sub_100004A7C((uint64_t)"-[SZExtractor supplyBytes:withCompletionBlock:]", 704, @"SZExtractorErrorDomain", 3, 0, 0, @"%s called before -[SZExtractor prepareForExtraction:] on %@", v16, (uint64_t)"-[SZExtractor supplyBytes:withCompletionBlock:]");
    id v14 = (id)objc_claimAutoreleasedReturnValue();
    ((void (*)(void *, id, uint64_t))v11[2])(v11, v14, 1);
  }
  else if ([(SZExtractor *)self _isValidObject])
  {
    [(SZExtractor *)self setHasHadPostSetupMethodsCalled:1];
    id v14 = [v6 copy];
    v48[0] = _NSConcreteStackBlock;
    v48[1] = 3221225472;
    v48[2] = sub_1000060AC;
    v48[3] = &unk_100028898;
    v48[4] = self;
    v49 = v11;
    uint64_t v17 = objc_retainBlock(v48);
    uint64_t v18 = [(SZExtractor *)self inProcessUnzipper];

    if (v18)
    {
      v19 = [(SZExtractor *)self serialQueue];
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100006230;
      block[3] = &unk_1000288C0;
      block[4] = self;
      id v46 = v14;
      id v47 = v17;
      uint64_t v20 = v17;
      dispatch_async(v19, block);
    }
    else
    {
      dispatch_group_t v24 = dispatch_group_create();
      *(void *)buf = 0;
      *(void *)&buf[8] = buf;
      *(void *)&buf[16] = 0x3032000000;
      v54 = sub_100006284;
      v55 = sub_100006294;
      id v56 = 0;
      v43[0] = 0;
      v43[1] = v43;
      v43[2] = 0x2020000000;
      char v44 = 0;
      v39[0] = _NSConcreteStackBlock;
      v39[1] = 3221225472;
      v39[2] = sub_10000629C;
      v39[3] = &unk_1000288E8;
      v41 = buf;
      v42 = v43;
      v25 = v24;
      v40 = v25;
      id v26 = objc_retainBlock(v39);
      v27 = [(SZExtractor *)self serialQueue];
      v31[0] = _NSConcreteStackBlock;
      v31[1] = 3221225472;
      v31[2] = sub_100006354;
      v31[3] = &unk_1000289D8;
      id v32 = v14;
      __int16 v33 = v25;
      __int16 v34 = self;
      id v35 = v26;
      id v36 = v17;
      v37 = buf;
      v38 = v43;
      id v28 = v17;
      v29 = v26;
      v30 = v25;
      dispatch_async(v27, v31);

      _Block_object_dispose(v43, 8);
      _Block_object_dispose(buf, 8);
    }
  }
  else
  {
    v21 = sub_100003788();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      *(void *)&uint8_t buf[4] = "-[SZExtractor supplyBytes:withCompletionBlock:]";
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = self;
      _os_log_error_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "%s called on an invalidated object: %@", buf, 0x16u);
    }

    sub_100004A7C((uint64_t)"-[SZExtractor supplyBytes:withCompletionBlock:]", 710, @"SZExtractorErrorDomain", 3, 0, 0, @"%s called on an invalidated object: %@", v22, (uint64_t)"-[SZExtractor supplyBytes:withCompletionBlock:]");
    id v14 = (id)objc_claimAutoreleasedReturnValue();
    ((void (*)(void *, id, uint64_t))v11[2])(v11, v14, 1);
  }
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
    v5 = [(SZExtractor *)self inProcessUnzipper];
    BOOL v4 = v5 != 0;
  }
  return v4;
}

- (void)_invalidateObject
{
  if ([(SZExtractor *)self _isValidObject])
  {
    BOOL v3 = sub_100003788();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 138412290;
      id v8 = self;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%@: invalidating", (uint8_t *)&v7, 0xCu);
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
  id v6 = a3;
  id v7 = a4;
  id v8 = sub_100003788();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412546;
    id v10 = self;
    __int16 v11 = 2112;
    id v12 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%@: preparing for extraction to path %@", (uint8_t *)&v9, 0x16u);
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
  id v6 = (void (**)(id, void, uint64_t))a4;
  id v7 = sub_100003788();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v22 = self;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%@: preparing", buf, 0xCu);
  }

  id v8 = [(SZExtractor *)self extractionPath];

  if (!v8)
  {
    __int16 v11 = sub_100003788();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "extractionPath was nil. Did you mean to call -prepareForExtractionToPath:completionBlock: instead?", buf, 2u);
    }

    sub_100004A7C((uint64_t)"-[SZExtractor _prepareForExtractionSynchronously:withCompletionBlock:]", 622, @"SZExtractorErrorDomain", 3, 0, 0, @"extractionPath was nil. Did you mean to call -prepareForExtractionToPath:completionBlock: instead?", v12, v20);
    goto LABEL_11;
  }
  if ([(SZExtractor *)self hasHadPostSetupMethodsCalled])
  {
    int v9 = sub_100003788();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v22 = (SZExtractor *)"-[SZExtractor _prepareForExtractionSynchronously:withCompletionBlock:]";
      _os_log_error_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Calling %s after any calls to other non-init methods on this instance is an error.", buf, 0xCu);
    }

    sub_100004A7C((uint64_t)"-[SZExtractor _prepareForExtractionSynchronously:withCompletionBlock:]", 628, @"SZExtractorErrorDomain", 3, 0, 0, @"Calling %s after any calls to other non-init methods on this instance is an error.", v10, (uint64_t)"-[SZExtractor _prepareForExtractionSynchronously:withCompletionBlock:]");
    uint64_t v13 = LABEL_11:;
LABEL_12:
    id v14 = (void *)v13;
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
    __int16 v15 = [(SZExtractor *)self error];

    uint64_t v16 = sub_100003788();
    BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);
    if (v15)
    {
      if (v17)
      {
        uint64_t v18 = [(SZExtractor *)self error];
        *(_DWORD *)buf = 138412546;
        uint64_t v22 = self;
        __int16 v23 = 2112;
        unint64_t v24 = (unint64_t)v18;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%@: prepare called on extractor that had already returned error %@", buf, 0x16u);
      }
      uint64_t v13 = [(SZExtractor *)self error];
      goto LABEL_12;
    }
    if (v17)
    {
      unint64_t v19 = [(SZExtractor *)self lastResumptionOffset];
      *(_DWORD *)buf = 138412546;
      uint64_t v22 = self;
      __int16 v23 = 2048;
      unint64_t v24 = v19;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%@: prepare called on object that was already prepared; returning resumption offset %llu",
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
  v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  id v6 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.StreamingZip.SZExtractor_in_process", v5);
  serialQueue = self->_serialQueue;
  self->_serialQueue = v6;

  id v8 = [(SZExtractor *)self serialQueue];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100007AC4;
  v10[3] = &unk_100028848;
  v10[4] = self;
  id v11 = v4;
  id v9 = v4;
  dispatch_sync(v8, v10);
}

- (void)_prepareForRemoteExtractionSynchronously:(BOOL)a3 withCompletionBlock:(id)a4
{
  id v6 = a4;
  id v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  id v8 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.StreamingZip.SZExtractorBufferSubmissionQueue", v7);
  serialQueue = self->_serialQueue;
  self->_serialQueue = v8;

  uint64_t v10 = [(SZExtractor *)self serialQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100017F50;
  block[3] = &unk_1000287F8;
  block[4] = self;
  id v13 = v6;
  BOOL v14 = a3;
  id v11 = v6;
  dispatch_sync(v10, block);
}

- (id)_serviceConnectionWithError:(id *)a3
{
  if ([(SZExtractor *)self privileged]) {
    CFStringRef v4 = @"com.apple.StreamingUnzipService.privileged";
  }
  else {
    CFStringRef v4 = @"com.apple.StreamingUnzipService";
  }
  id v5 = [objc_alloc((Class)NSXPCConnection) initWithServiceName:v4];
  if (v5)
  {
    id v6 = sub_100018E18();
    [v5 setRemoteObjectInterface:v6];

    id v7 = 0;
  }
  else
  {
    id v8 = sub_100003788();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v11) = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "Failed to create NSXPCConnection", (uint8_t *)&v11, 2u);
    }

    sub_100004A7C((uint64_t)"-[SZExtractor _serviceConnectionWithError:]", 447, @"SZExtractorErrorDomain", 1, 0, 0, @"Failed to create NSXPCConnection", v9, v11);
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
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100018F68;
  v5[3] = &unk_100028758;
  v5[4] = self;
  v5[5] = &v6;
  v5[6] = a3;
  [(SZExtractor *)self _prepareForExtractionSynchronously:1 withCompletionBlock:v5];
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (id)initForLocalExtractionWithPath:(id)a3 options:(id)a4 resumptionOffset:(unint64_t *)a5
{
  uint64_t v6 = [(SZExtractor *)self initWithPath:a3 options:a4];
  id v7 = v6;
  if (v6
    && (v6->_isLocalExtractor = 1,
        ![(SZExtractor *)v6 _synchronouslyPrepareForExtractionAtOffset:a5]))
  {
    uint64_t v8 = 0;
  }
  else
  {
    uint64_t v8 = v7;
  }

  return v8;
}

- (id)initForRemoteExtractionWithPath:(id)a3 options:(id)a4 resumptionOffset:(unint64_t *)a5
{
  uint64_t v6 = [(SZExtractor *)self initWithPath:a3 options:a4];
  id v7 = v6;
  if (v6
    && (v6->_isLocalExtractor = 0,
        ![(SZExtractor *)v6 _synchronouslyPrepareForExtractionAtOffset:a5]))
  {
    uint64_t v8 = 0;
  }
  else
  {
    uint64_t v8 = v7;
  }

  return v8;
}

- (SZExtractor)initWithPath:(id)a3 md5Hashes:(id)a4 hashedChunkSize:(unint64_t)a5 resumptionOffset:(unint64_t *)a6
{
  id v10 = a4;
  id v11 = a3;
  uint64_t v12 = +[NSNumber numberWithUnsignedLongLong:a5];
  id v13 = +[NSDictionary dictionaryWithObjectsAndKeys:@"SZExtractorHashTypeMD5", @"SZExtractorOptionsHashType", v10, @"SZExtractorOptionsHashesArray", v12, @"SZExtractorOptionsHashedChunkSize", 0];

  BOOL v14 = [(SZExtractor *)self initWithPath:v11 options:v13 resumptionOffset:a6];
  return v14;
}

- (SZExtractor)initWithPath:(id)a3 options:(id)a4 resumptionOffset:(unint64_t *)a5
{
  uint64_t v6 = [(SZExtractor *)self initWithPath:a3 options:a4];
  id v7 = v6;
  if (v6
    && ![(SZExtractor *)v6 _synchronouslyPrepareForExtractionAtOffset:a5])
  {
    uint64_t v8 = 0;
  }
  else
  {
    uint64_t v8 = v7;
  }

  return v8;
}

- (SZExtractor)initWithPath:(id)a3 resumptionOffset:(unint64_t *)a4
{
  return [(SZExtractor *)self initWithPath:a3 options:0 resumptionOffset:a4];
}

- (SZExtractor)initWithOptions:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SZExtractor;
  id v5 = [(SZExtractor *)&v8 init];
  uint64_t v6 = v5;
  if (v5) {
    [(SZExtractor *)v5 _setUpWithPath:0 options:v4];
  }

  return v6;
}

- (SZExtractor)initWithPath:(id)a3 options:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)SZExtractor;
  objc_super v8 = [(SZExtractor *)&v11 init];
  char v9 = v8;
  if (v8) {
    [(SZExtractor *)v8 _setUpWithPath:v6 options:v7];
  }

  return v9;
}

- (void)_setUpWithPath:(id)a3 options:(id)a4
{
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
        objc_super v11 = (void *)v10;
        uint64_t v12 = [v7 objectForKeyedSubscript:@"SZExtractorOptionsHashedChunkSize"];
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();

        if (isKindOfClass)
        {
LABEL_6:

          goto LABEL_7;
        }
      }
      NSExceptionName v22 = NSInvalidArgumentException;
      CFStringRef v23 = @"SZExtractor requires SZExtractorOptionsHashedChunkSize if passing multiple hashes in SZExtractorOptionsHashesArray";
    }
    else
    {
      unint64_t v19 = (objc_class *)objc_opt_class();
      uint64_t v20 = NSStringFromClass(v19);
      uint64_t v21 = +[NSString stringWithFormat:@"SZExtractorOptionsHashesArray must be an array, but is a %@", v20];

      NSExceptionName v22 = NSInvalidArgumentException;
      CFStringRef v23 = (const __CFString *)v21;
    }
    id v24 = +[NSException exceptionWithName:v22 reason:v23 userInfo:0];
    objc_exception_throw(v24);
  }
LABEL_7:
  BOOL v14 = (NSString *)[v6 copy];
  extractionPath = self->_extractionPath;
  self->_extractionPath = v14;

  uint64_t v16 = (NSDictionary *)[v7 copy];
  options = self->_options;
  self->_options = v16;

  uint64_t v18 = sub_100003788();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    id v26 = self;
    __int16 v27 = 2112;
    id v28 = v6;
    __int16 v29 = 2112;
    id v30 = v7;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "%@: initialized with path: %@ options: %@", buf, 0x20u);
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [(id)objc_opt_class() allocWithZone:a3];
  id v5 = [(SZExtractor *)self extractionPath];
  id v6 = [(SZExtractor *)self options];
  id v7 = [v4 initWithPath:v5 options:v6];

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
  unint64_t v5 = (unint64_t)[v4 hash];
  if (v3)
  {
    id v6 = [(SZExtractor *)self extractionPath];
    v5 ^= (unint64_t)[v6 hash];
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
    unsigned int v8 = [v6 isEqual:v7];

    if (!v8) {
      goto LABEL_13;
    }
    uint64_t v9 = [v5 extractionPath];
    if (v9)
    {
      uint64_t v10 = (void *)v9;
      objc_super v11 = [(SZExtractor *)self extractionPath];

      if (!v11) {
        goto LABEL_13;
      }
    }
    uint64_t v12 = [v5 extractionPath];
    if (v12)
    {
    }
    else
    {
      uint64_t v21 = [(SZExtractor *)self extractionPath];

      if (v21) {
        goto LABEL_13;
      }
    }
    uint64_t v13 = [v5 extractionPath];
    if (v13)
    {
      BOOL v14 = (void *)v13;
      uint64_t v15 = [(SZExtractor *)self extractionPath];
      if (v15)
      {
        uint64_t v16 = (void *)v15;
        BOOL v17 = [v5 extractionPath];
        uint64_t v18 = [(SZExtractor *)self extractionPath];
        unsigned int v19 = [v17 isEqual:v18];

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
    unsigned int v22 = [v5 privileged];
    unsigned int v20 = v22 ^ [(SZExtractor *)self privileged] ^ 1;
    goto LABEL_16;
  }
  LOBYTE(v20) = 0;
LABEL_17:

  return v20;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  if (![(SZExtractor *)self needsPreparation]
    && [(SZExtractor *)self _isValidObject])
  {
    id v5 = sub_100003788();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v10 = self;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@: suspending stream in preparation for serializing ourselves", buf, 0xCu);
    }

    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100019A08;
    v8[3] = &unk_100028730;
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
  id v7 = sub_100003788();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v10 = self;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%@: serialized", buf, 0xCu);
  }
}

- (SZExtractor)initWithCoder:(id)a3
{
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
      uint64_t v10 = [v4 connection];
      v5->_isLocalExtractor = 0;
      objc_super v11 = [v10 valueForEntitlement:@"com.apple.private.SZExtractor.privileged"];
      unsigned __int8 v12 = [v11 BOOLValue];

      if ((v12 & 1) == 0) {
        v5->_privileged = 0;
      }
    }
    uint64_t v13 = sub_100003788();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      BOOL v17 = v5;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%@: deserialized", buf, 0xCu);
    }
  }
  return v5;
}

- (SZExtractor)init
{
  os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
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
  uint64_t v19 = 0;
  unsigned int v20 = (id *)&v19;
  uint64_t v21 = 0x3032000000;
  unsigned int v22 = sub_100006284;
  CFStringRef v23 = sub_100006294;
  id v24 = 0;
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x2020000000;
  int v18 = -1;
  id v4 = [[SZExtractor alloc] initWithOptions:&__NSDictionary0__struct];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100019FE8;
  v14[3] = &unk_100028AA0;
  v14[4] = &v19;
  id v5 = objc_retainBlock(v14);
  uint64_t v6 = v20;
  id obj = v20[5];
  id v7 = [(SZExtractor *)v4 _serviceConnectionWithError:&obj];
  objc_storeStrong(v6 + 5, obj);
  if (!v7)
  {
    uint64_t v9 = 0;
    if (!a3) {
      goto LABEL_9;
    }
    goto LABEL_7;
  }
  [v7 resume];
  uint64_t v8 = [v7 synchronousRemoteObjectProxyWithErrorHandler:v5];
  uint64_t v9 = v8;
  if (v8)
  {
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_10001A0B4;
    v12[3] = &unk_100028AC8;
    v12[4] = &v19;
    v12[5] = &v15;
    [v8 getPidForTestingWithReply:v12];
  }
  if (a3)
  {
LABEL_7:
    if (*((_DWORD *)v16 + 6) == -1) {
      *a3 = v20[5];
    }
  }
LABEL_9:
  [v7 invalidate];
  int v10 = *((_DWORD *)v16 + 6);

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v19, 8);

  return v10;
}

@end
@interface CSHealthWrapMessage
+ (id)newOutputFileURL;
+ (id)newOutputFileURLInDirectory:(id)a3;
- (BOOL)_run:(id)a3 error:(id *)a4;
- (BOOL)_startWithOutputStream:(id)a3 error:(id *)a4;
- (BOOL)appendData:(id)a3 error:(id *)a4;
- (BOOL)appendDataFromFileURL:(id)a3 error:(id *)a4;
- (BOOL)finalizeWithError:(id *)a3;
- (BOOL)startWithError:(id *)a3;
- (BOOL)startWithOutputFileURL:(id)a3 error:(id *)a4;
- (BOOL)startWithOutputStream:(id)a3 shouldClose:(BOOL)a4 error:(id *)a5;
- (CSHealthWrapMessage)initWithConfiguration:(id)a3;
- (CSHealthWrapMessage)initWithUUID:(id)a3 senderUUID:(id)a4 studyUUID:(id)a5 channel:(id)a6 payloadType:(id)a7 startDate:(id)a8 endDate:(id)a9 payloadIdentifier:(id)a10 applicationData:(id)a11 certificate:(__SecCertificate *)cf;
- (CSHealthWrapMessageConfiguration)configuration;
- (NSURL)outputURL;
- (id)_codableKeyValuePairsFromDictionary:(id)a3;
- (void)_cleanup;
- (void)_finalize;
- (void)_writeDataToCompressor:(id)a3;
- (void)dealloc;
- (void)receiveSinkContent:(id)a3;
- (void)sinkContentFinished;
@end

@implementation CSHealthWrapMessage

- (CSHealthWrapMessage)initWithUUID:(id)a3 senderUUID:(id)a4 studyUUID:(id)a5 channel:(id)a6 payloadType:(id)a7 startDate:(id)a8 endDate:(id)a9 payloadIdentifier:(id)a10 applicationData:(id)a11 certificate:(__SecCertificate *)cf
{
  id v42 = a3;
  id v19 = a4;
  id v41 = a5;
  id v20 = a6;
  id v21 = a7;
  id v22 = a8;
  id v23 = a9;
  id v24 = a10;
  id v25 = a11;
  v43.receiver = self;
  v43.super_class = (Class)CSHealthWrapMessage;
  v26 = [(CSHealthWrapMessage *)&v43 init];
  v27 = v26;
  if (v26)
  {
    *(_WORD *)&v26->_compressionEnabled = 1;
    *(_WORD *)&v26->_shouldCloseStream = 1;
    objc_storeStrong((id *)&v26->_uuid, a3);
    objc_storeStrong((id *)&v27->_studyUUID, a5);
    uint64_t v28 = +[GPBMessage message];
    payloadHeader = v27->_payloadHeader;
    v27->_payloadHeader = (CSHWProtoPayloadHeader *)v28;

    id v30 = [v24 copy];
    [(CSHWProtoPayloadHeader *)v27->_payloadHeader setPayloadIdentifier:v30];

    v44[0] = 0;
    v44[1] = 0;
    [v19 getUUIDBytes:v44];
    v31 = +[NSData dataWithBytes:v44 length:16];
    [(CSHWProtoPayloadHeader *)v27->_payloadHeader setSubjectUuid:v31];

    id v32 = [v20 copy];
    [(CSHWProtoPayloadHeader *)v27->_payloadHeader setChannel:v32];

    id v33 = [v21 copy];
    [(CSHWProtoPayloadHeader *)v27->_payloadHeader setPayloadType:v33];

    if (v22)
    {
      [v22 timeIntervalSinceReferenceDate];
      [(CSHWProtoPayloadHeader *)v27->_payloadHeader setStartDate:(uint64_t)v34];
    }
    if (v23)
    {
      [v23 timeIntervalSinceReferenceDate];
      [(CSHWProtoPayloadHeader *)v27->_payloadHeader setEndDate:(uint64_t)v35];
    }
    if (v25)
    {
      id v36 = [v25 copy];
      [(CSHWProtoPayloadHeader *)v27->_payloadHeader setApplicationData:v36];
    }
    CFRetain(cf);
    v27->_certificate = cf;
    v37 = dispatch_get_global_queue(0, 0);
    dispatch_queue_t v38 = dispatch_queue_create("healthwrap_message", 0);
    encryptQueue = v27->_encryptQueue;
    v27->_encryptQueue = (OS_dispatch_queue *)v38;

    dispatch_set_target_queue((dispatch_object_t)v27->_encryptQueue, v37);
  }

  return v27;
}

- (CSHealthWrapMessage)initWithConfiguration:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    v17 = +[NSAssertionHandler currentHandler];
    [v17 handleFailureInMethod:a2, self, @"CSHealthWrapMessage.m", 141, @"Invalid parameter not satisfying: %@", @"configuration != nil" object file lineNumber description];
  }
  id v19 = [v4 messageUUID];
  v5 = [v4 subjectUUID];
  v6 = [v4 studyUUID];
  v7 = [v4 channel];
  v8 = [v4 payloadType];
  v9 = [v4 startDate];
  v10 = [v4 endDate];
  v11 = [v4 payloadIdentifier];
  v12 = [v4 applicationData];
  v13 = -[CSHealthWrapMessage initWithUUID:senderUUID:studyUUID:channel:payloadType:startDate:endDate:payloadIdentifier:applicationData:certificate:](self, "initWithUUID:senderUUID:studyUUID:channel:payloadType:startDate:endDate:payloadIdentifier:applicationData:certificate:", v19, v5, v6, v7, v8, v9, v10, v11, v12, [v4 certificate]);

  if (v13)
  {
    objc_storeStrong((id *)&v13->_configuration, a3);
    if ([(CSHealthWrapMessageConfiguration *)v13->_configuration disableCompression]) {
      v13->_compressionEnabled = 0;
    }
    v14 = [v4 keyValuePairs];
    v15 = [(CSHealthWrapMessage *)v13 _codableKeyValuePairsFromDictionary:v14];
    [(CSHWProtoPayloadHeader *)v13->_payloadHeader setKeyValuePairsArray:v15];
  }
  return v13;
}

- (void)dealloc
{
  certificate = self->_certificate;
  if (certificate)
  {
    CFRelease(certificate);
    self->_certificate = 0;
  }
  outputStream = self->_outputStream;
  if (outputStream)
  {
    CFWriteStreamSetDispatchQueue((CFWriteStreamRef)outputStream, 0);
    outputStream = self->_outputStream;
  }
  if (self->_shouldCloseStream)
  {
    [(NSOutputStream *)outputStream close];
    outputURL = self->_outputURL;
    self->_outputURL = 0;

    outputStream = self->_outputStream;
  }
  self->_outputStream = 0;

  v6.receiver = self;
  v6.super_class = (Class)CSHealthWrapMessage;
  [(CSHealthWrapMessage *)&v6 dealloc];
}

- (id)_codableKeyValuePairsFromDictionary:(id)a3
{
  if (a3)
  {
    id v3 = a3;
    +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v3 count]);
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_10001C07C;
    v6[3] = &unk_10039B1D0;
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    id v7 = v4;
    [v3 enumerateKeysAndObjectsUsingBlock:v6];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (BOOL)startWithError:(id *)a3
{
  id v5 = [(id)objc_opt_class() newOutputFileURL];
  LOBYTE(a3) = [(CSHealthWrapMessage *)self startWithOutputFileURL:v5 error:a3];

  return (char)a3;
}

+ (id)newOutputFileURL
{
  id v3 = NSTemporaryDirectory();
  id v4 = +[NSURL fileURLWithPath:v3];
  id v5 = [a1 newOutputFileURLInDirectory:v4];

  return v5;
}

+ (id)newOutputFileURLInDirectory:(id)a3
{
  id v3 = a3;
  id v4 = +[NSUUID UUID];
  id v5 = [v4 UUIDString];
  objc_super v6 = +[NSString stringWithFormat:@"%@-%@", @"HealthWrap-", v5];

  id v7 = [v3 URLByAppendingPathComponent:v6];

  return v7;
}

- (BOOL)_startWithOutputStream:(id)a3 error:(id *)a4
{
  id v7 = (__CFWriteStream *)a3;
  *(_WORD *)&self->_started = 257;
  objc_storeStrong((id *)&self->_outputStream, a3);
  CFWriteStreamSetDispatchQueue(v7, (dispatch_queue_t)self->_encryptQueue);
  v8 = [CSHealthWrapEncryptor alloc];
  LOBYTE(v15) = self->_compressionEnabled;
  v9 = [(CSHealthWrapEncryptor *)v8 initWithOutputStream:v7 certificate:self->_certificate algorithm:0 options:1 keySize:32 uuid:self->_uuid studyUUID:self->_studyUUID compressionEnabled:v15];
  encryptor = self->_encryptor;
  self->_encryptor = v9;

  BOOL v11 = 0;
  if ([(CSHealthWrapEncryptor *)self->_encryptor startWithError:a4])
  {
    if (self->_compressionEnabled)
    {
      v12 = [[_CSCompressionEngine alloc] initWithFunction:0 algorithm:1 destination:self];
      compressionEngine = self->_compressionEngine;
      self->_compressionEngine = v12;
    }
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_10001C4E4;
    v16[3] = &unk_10039B1F8;
    v16[4] = self;
    BOOL v11 = [(CSHealthWrapMessage *)self _run:v16 error:a4];
  }

  return v11;
}

- (BOOL)startWithOutputStream:(id)a3 shouldClose:(BOOL)a4 error:(id *)a5
{
  id v9 = a3;
  if (self->_started)
  {
    v13 = +[NSAssertionHandler currentHandler];
    [v13 handleFailureInMethod:a2 object:self file:@"CSHealthWrapMessage.m" lineNumber:265 description:@"Started twice without a reset"];
  }
  outputURL = self->_outputURL;
  self->_outputURL = 0;

  self->_startedWithStream = 1;
  self->_shouldCloseStream = a4;
  BOOL v11 = [(CSHealthWrapMessage *)self _startWithOutputStream:v9 error:a5];

  return v11;
}

- (BOOL)startWithOutputFileURL:(id)a3 error:(id *)a4
{
  id v7 = (NSURL *)a3;
  if (self->_started)
  {
    v13 = +[NSAssertionHandler currentHandler];
    [v13 handleFailureInMethod:a2 object:self file:@"CSHealthWrapMessage.m" lineNumber:273 description:@"Started twice without a reset"];
  }
  outputURL = self->_outputURL;
  self->_outputURL = v7;
  id v9 = v7;

  *(_WORD *)&self->_shouldCloseStream = 1;
  id v10 = [objc_alloc((Class)NSOutputStream) initWithURL:v9 append:0];

  [v10 open];
  BOOL v11 = [(CSHealthWrapMessage *)self _startWithOutputStream:v10 error:a4];

  return v11;
}

- (BOOL)appendDataFromFileURL:(id)a3 error:(id *)a4
{
  id v6 = [a3 path];
  int v7 = open((const char *)[v6 UTF8String], 0);
  if (v7 == -1)
  {
    NSErrorUserInfoKey v30 = NSLocalizedDescriptionKey;
    v13 = +[NSString stringWithFormat:@"Unable to open file %@", v6];
    v31 = v13;
    v14 = +[NSDictionary dictionaryWithObjects:&v31 forKeys:&v30 count:1];
    *a4 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:22 userInfo:v14];

    goto LABEL_6;
  }
  int v8 = v7;
  memset(&v23, 0, sizeof(v23));
  if (fstat(v7, &v23))
  {
    NSErrorUserInfoKey v28 = NSLocalizedDescriptionKey;
    id v9 = +[NSString stringWithFormat:@"Unable to stat file %@", v6];
    v29 = v9;
    id v10 = +[NSDictionary dictionaryWithObjects:&v29 forKeys:&v28 count:1];
    NSErrorDomain v11 = NSPOSIXErrorDomain;
    uint64_t v12 = 2;
LABEL_4:
    *a4 = +[NSError errorWithDomain:v11 code:v12 userInfo:v10];

    close(v8);
LABEL_6:
    BOOL v15 = 0;
    goto LABEL_7;
  }
  v17 = mmap(0, v23.st_size, 1, 2, v8, 0);
  if (v17 == (void *)-1)
  {
    NSErrorUserInfoKey v26 = NSLocalizedDescriptionKey;
    id v9 = +[NSString stringWithFormat:@"mmap failed for file %@", v6];
    v27 = v9;
    id v10 = +[NSDictionary dictionaryWithObjects:&v27 forKeys:&v26 count:1];
    NSErrorDomain v11 = NSPOSIXErrorDomain;
    uint64_t v12 = 12;
    goto LABEL_4;
  }
  v18 = v17;
  id v19 = objc_alloc((Class)NSData);
  id v20 = [v19 initWithBytesNoCopy:v18 length:v23.st_size deallocator:NSDataDeallocatorUnmap];
  close(v8);
  if (v20)
  {
    BOOL v15 = [(CSHealthWrapMessage *)self appendData:v20 error:a4];
  }
  else
  {
    NSErrorUserInfoKey v24 = NSLocalizedDescriptionKey;
    id v21 = +[NSString stringWithFormat:@"data alloc failed for file %@", v6];
    id v25 = v21;
    id v22 = +[NSDictionary dictionaryWithObjects:&v25 forKeys:&v24 count:1];
    *a4 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:12 userInfo:v22];

    BOOL v15 = 0;
  }

LABEL_7:
  return v15;
}

- (BOOL)appendData:(id)a3 error:(id *)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10001CB7C;
  v7[3] = &unk_10039B220;
  int v8 = self;
  id v9 = a3;
  id v5 = v9;
  LOBYTE(a4) = [(CSHealthWrapMessage *)v8 _run:v7 error:a4];

  return (char)a4;
}

- (void)_finalize
{
  if (self->_compressionEnabled)
  {
    [(_CSCompressionEngine *)self->_compressionEngine sourceContentFinished];
  }
  else
  {
    encryptor = self->_encryptor;
    id obj = 0;
    unsigned __int8 v4 = [(CSHealthWrapEncryptor *)encryptor finalizeWithError:&obj];
    id v5 = obj;
    self->_lastSuccess = v4;
    objc_storeStrong((id *)&self->_lastError, v5);
  }
  if (self->_startedWithStream)
  {
    outputStream = self->_outputStream;
    if (outputStream)
    {
      CFWriteStreamSetDispatchQueue((CFWriteStreamRef)outputStream, 0);
      if (self->_shouldCloseStream) {
        [(NSOutputStream *)self->_outputStream close];
      }
      int v7 = self->_outputStream;
      self->_outputStream = 0;
    }
  }
}

- (BOOL)finalizeWithError:(id *)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10001CC88;
  v4[3] = &unk_10039B1F8;
  v4[4] = self;
  return [(CSHealthWrapMessage *)self _run:v4 error:a3];
}

- (BOOL)_run:(id)a3 error:(id *)a4
{
  self->_BOOL lastSuccess = 1;
  (*((void (**)(id, SEL))a3 + 2))(a3, a2);
  BOOL lastSuccess = self->_lastSuccess;
  if (!self->_lastSuccess)
  {
    [(CSHealthWrapMessage *)self _cleanup];
    *a4 = self->_lastError;
  }
  return lastSuccess;
}

- (void)_writeDataToCompressor:(id)a3
{
  lastError = (NSError *)a3;
  unint64_t v14 = bswap64((unint64_t)[(NSError *)lastError length]);
  id v5 = +[NSData dataWithBytes:&v14 length:8];
  if (self->_compressionEnabled)
  {
    [(_CSCompressionEngine *)self->_compressionEngine writeSourceContent:v5];
    [(_CSCompressionEngine *)self->_compressionEngine writeSourceContent:lastError];
  }
  else
  {
    encryptor = self->_encryptor;
    id v13 = 0;
    unsigned __int8 v7 = [(CSHealthWrapEncryptor *)encryptor appendData:v5 error:&v13];
    id v8 = v13;
    self->_BOOL lastSuccess = v7;
    id v9 = self->_encryptor;
    id v12 = v8;
    unsigned __int8 v10 = [(CSHealthWrapEncryptor *)v9 appendData:lastError error:&v12];

    NSErrorDomain v11 = (NSError *)v12;
    self->_BOOL lastSuccess = v10;
    lastError = self->_lastError;
    self->_lastError = v11;
  }
}

- (void)_cleanup
{
  compressionEngine = self->_compressionEngine;
  self->_compressionEngine = 0;

  [(CSHealthWrapEncryptor *)self->_encryptor finalizeWithError:0];
  encryptor = self->_encryptor;
  self->_encryptor = 0;

  if (self->_shouldCloseStream) {
    [(NSOutputStream *)self->_outputStream close];
  }
  outputStream = self->_outputStream;
  self->_outputStream = 0;

  self->_startedWithStream = 0;
  if (self->_outputURL)
  {
    id v6 = +[NSFileManager defaultManager];
    [v6 removeItemAtURL:self->_outputURL error:0];

    outputURL = self->_outputURL;
    self->_outputURL = 0;
  }
  self->_started = 0;
}

- (NSURL)outputURL
{
  return self->_outputURL;
}

- (void)receiveSinkContent:(id)a3
{
  id v4 = a3;
  encryptQueue = self->_encryptQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10001CF30;
  v7[3] = &unk_10039B220;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(encryptQueue, v7);
}

- (void)sinkContentFinished
{
  encryptQueue = self->_encryptQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001CFF8;
  block[3] = &unk_10039B1F8;
  block[4] = self;
  dispatch_sync(encryptQueue, block);
}

- (CSHealthWrapMessageConfiguration)configuration
{
  return self->_configuration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_lastError, 0);
  objc_storeStrong((id *)&self->_encryptQueue, 0);
  objc_storeStrong((id *)&self->_outputStream, 0);
  objc_storeStrong((id *)&self->_outputURL, 0);
  objc_storeStrong((id *)&self->_encryptor, 0);
  objc_storeStrong((id *)&self->_compressionEngine, 0);
  objc_storeStrong((id *)&self->_studyUUID, 0);
  objc_storeStrong((id *)&self->_uuid, 0);

  objc_storeStrong((id *)&self->_payloadHeader, 0);
}

@end
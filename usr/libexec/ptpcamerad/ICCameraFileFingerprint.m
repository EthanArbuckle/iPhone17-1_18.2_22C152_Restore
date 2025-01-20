@interface ICCameraFileFingerprint
- (ICCameraFileFingerprint)init;
- (NSString)zeroByteFileFingerprint;
- (id)fingerprintForData:(id)a3 error:(id *)a4;
- (id)fingerprintForFD:(int)a3 error:(id *)a4;
- (id)fingerprintForFileAtURL:(id)a3 error:(id *)a4;
- (id)fixupFileHandleError:(id)a3;
- (void)_createSignatureGenerator;
@end

@implementation ICCameraFileFingerprint

- (ICCameraFileFingerprint)init
{
  v3.receiver = self;
  v3.super_class = (Class)ICCameraFileFingerprint;
  return [(ICCameraFileFingerprint *)&v3 init];
}

- (id)fixupFileHandleError:(id)a3
{
  id v3 = a3;
  v4 = [v3 domain];
  unsigned int v5 = [v4 isEqualToString:NSCocoaErrorDomain];

  if (v5)
  {
    v6 = [v3 userInfo];
    v7 = [v6 objectForKey:NSUnderlyingErrorKey];

    if (!v7)
    {
      v8 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, [v3 code], 0);
      v9 = [v3 userInfo];
      id v10 = [v9 mutableCopy];
      v11 = v10;
      if (v10)
      {
        id v12 = v10;
      }
      else
      {
        id v12 = +[NSMutableDictionary dictionary];
      }
      v13 = v12;

      [v13 setObject:v8 forKey:NSUnderlyingErrorKey];
      uint64_t v14 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSCocoaErrorDomain, [v3 code], v13);

      id v3 = (id)v14;
    }
  }

  return v3;
}

- (void)_createSignatureGenerator
{
  v2 = [@"MYSUPERSECRECTKEYPADDEDTO32BYTES" dataUsingEncoding:4];
  id v3 = (void **)MMCSSignatureGeneratorCreateWithBoundaryKey();

  return v3;
}

- (id)fingerprintForFileAtURL:(id)a3 error:(id *)a4
{
  v6 = +[NSFileHandle fileHandleForReadingFromURL:error:](NSFileHandle, "fileHandleForReadingFromURL:error:", a3);
  v7 = v6;
  if (v6)
  {
    v8 = -[ICCameraFileFingerprint fingerprintForFD:error:](self, "fingerprintForFD:error:", [v6 fileDescriptor], a4);
    [v7 closeFile];
  }
  else if (a4)
  {
    [(ICCameraFileFingerprint *)self fixupFileHandleError:*a4];
    v8 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)fingerprintForData:(id)a3 error:(id *)a4
{
  id v5 = a3;
  [(ICCameraFileFingerprint *)self _createSignatureGenerator];
  id v6 = v5;
  [v6 bytes];
  [v6 length];

  MMCSSignatureGeneratorUpdate();
  uint64_t v7 = MMCSSignatureGeneratorFinish();
  id v8 = [objc_alloc((Class)NSData) initWithBytesNoCopy:v7 length:MMCSSignatureAndSchemeSize() freeWhenDone:1];
  v9 = [v8 base64EncodedStringWithOptions:0];

  return v9;
}

- (id)fingerprintForFD:(int)a3 error:(id *)a4
{
  lseek(a3, 0, 0);
  id v6 = malloc_type_malloc(0x20000uLL, 0xCD74D96CuLL);
  uint64_t v7 = [(ICCameraFileFingerprint *)self _createSignatureGenerator];
  while (1)
  {
    ssize_t v8 = read(a3, v6, 0x20000uLL);
    if (!v8) {
      break;
    }
    if (v8 == -1)
    {
      MMCSSignatureGeneratorFinish();
      uint64_t v7 = 0;
      break;
    }
    MMCSSignatureGeneratorUpdate();
  }
  if (v6) {
    free(v6);
  }
  if (v7)
  {
    uint64_t v9 = MMCSSignatureGeneratorFinish();
    id v10 = [objc_alloc((Class)NSData) initWithBytesNoCopy:v9 length:MMCSSignatureAndSchemeSize() freeWhenDone:1];
    v11 = [v10 base64EncodedStringWithOptions:0];
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (NSString)zeroByteFileFingerprint
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (!self->_zeroByteFileFingerprint)
  {
    v4 = +[NSData data];
    id v10 = 0;
    id v5 = [(ICCameraFileFingerprint *)self fingerprintForData:v4 error:&v10];
    id v6 = v10;
    zeroByteFileFingerprint = self->_zeroByteFileFingerprint;
    self->_zeroByteFileFingerprint = v5;
  }
  os_unfair_lock_unlock(p_lock);
  ssize_t v8 = self->_zeroByteFileFingerprint;

  return v8;
}

- (void).cxx_destruct
{
}

@end
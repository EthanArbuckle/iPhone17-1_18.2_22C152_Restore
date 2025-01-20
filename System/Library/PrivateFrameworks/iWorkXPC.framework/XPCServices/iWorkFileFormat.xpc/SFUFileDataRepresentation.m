@interface SFUFileDataRepresentation
- (BOOL)hasSameLocationAs:(id)a3;
- (BOOL)isCryptoKeyIdenticalToKey:(id)a3;
- (BOOL)isEncrypted;
- (BOOL)isReadable;
- (SFUFileDataRepresentation)initWithCopyOfData:(id)a3 path:(id)a4;
- (SFUFileDataRepresentation)initWithCopyOfData:(id)a3 path:(id)a4 cryptoKey:(id)a5;
- (SFUFileDataRepresentation)initWithInputStream:(id)a3 cryptoKey:(id)a4 dataLength:(int64_t)a5;
- (SFUFileDataRepresentation)initWithPath:(id)a3;
- (SFUFileDataRepresentation)initWithPath:(id)a3 cryptoKey:(id)a4 dataLength:(int64_t)a5;
- (SFUFileDataRepresentation)initWithPath:(id)a3 sharedFileDescriptor:(int)a4;
- (SFUFileDataRepresentation)initWithPath:(id)a3 sharedFileDescriptor:(int)a4 cryptoKey:(id)a5 dataLength:(int64_t)a6;
- (id)description;
- (id)inputStream;
- (id)path;
- (int64_t)dataLength;
- (int64_t)encodedLength;
- (unsigned)fileType;
- (void)dealloc;
- (void)deleteFileWhenDone;
- (void)readFileAttributes;
- (void)setFileType:(unsigned int)a3;
@end

@implementation SFUFileDataRepresentation

- (SFUFileDataRepresentation)initWithPath:(id)a3
{
  return [(SFUFileDataRepresentation *)self initWithPath:a3 sharedFileDescriptor:0xFFFFFFFFLL cryptoKey:0 dataLength:0];
}

- (SFUFileDataRepresentation)initWithPath:(id)a3 sharedFileDescriptor:(int)a4
{
  return [(SFUFileDataRepresentation *)self initWithPath:a3 sharedFileDescriptor:*(void *)&a4 cryptoKey:0 dataLength:0];
}

- (SFUFileDataRepresentation)initWithPath:(id)a3 cryptoKey:(id)a4 dataLength:(int64_t)a5
{
  return [(SFUFileDataRepresentation *)self initWithPath:a3 sharedFileDescriptor:0xFFFFFFFFLL cryptoKey:a4 dataLength:a5];
}

- (SFUFileDataRepresentation)initWithPath:(id)a3 sharedFileDescriptor:(int)a4 cryptoKey:(id)a5 dataLength:(int64_t)a6
{
  if (!a3)
  {
    int v11 = +[TSUAssertionHandler _atomicIncrementAssertCount];
    if (TSUAssertCat_init_token != -1) {
      dispatch_once(&TSUAssertCat_init_token, &stru_1001CD9E8);
    }
    v12 = TSUAssertCat_log_t;
    if (os_log_type_enabled((os_log_t)TSUAssertCat_log_t, OS_LOG_TYPE_ERROR)) {
      sub_100167F40(v11, v12);
    }
    +[TSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](TSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[SFUFileDataRepresentation initWithPath:sharedFileDescriptor:cryptoKey:dataLength:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/iWorkXPC/shared/utility/sf/SFUFileDataRepresentation.m"), 48, 0, "Invalid parameter not satisfying: %{public}s", "path != nil");
    +[TSUAssertionHandler logBacktraceThrottled];
  }
  v13 = [(SFUFileDataRepresentation *)self init];
  if (v13)
  {
    v13->mPath = (NSString *)a3;
    v14 = (SFUCryptoKey *)a5;
    v13->mCryptoKey = v14;
    if (v14) {
      v13->mPlaintextDataLength = a6;
    }
    v13->mSharedFd = a4;
    [(SFUFileDataRepresentation *)v13 path];
  }
  return v13;
}

- (SFUFileDataRepresentation)initWithCopyOfData:(id)a3 path:(id)a4
{
  return [(SFUFileDataRepresentation *)self initWithCopyOfData:a3 path:a4 cryptoKey:0];
}

- (SFUFileDataRepresentation)initWithCopyOfData:(id)a3 path:(id)a4 cryptoKey:(id)a5
{
  if (a3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0
      || !objc_msgSend(objc_msgSend(a3, "path"), "isEqualToString:", a4)
      || ([a3 isCryptoKeyIdenticalToKey:a5] & 1) == 0)
    {
      id v10 = [a3 bufferedInputStream];
      unlink((const char *)[a4 fileSystemRepresentation]);
      int v11 = [[SFUFileOutputStream alloc] initWithPath:a4];
      v12 = v11;
      if (a5)
      {
        v13 = [[SFUCryptoOutputStream alloc] initForEncryptionWithOutputStream:v11 key:a5];
      }
      else
      {
        v13 = v11;
      }
      while (1)
      {
        uint64_t v16 = 0;
        id v15 = [v10 readToOwnBuffer:&v16 size:-1];
        if (!v15) {
          break;
        }
        [(SFUFileOutputStream *)v13 writeBuffer:v16 size:v15];
      }
      [v10 close];
      [(SFUFileOutputStream *)v13 close];
    }
    return -[SFUFileDataRepresentation initWithPath:cryptoKey:dataLength:](self, "initWithPath:cryptoKey:dataLength:", a4, a5, [a3 dataLength]);
  }
  else
  {

    return 0;
  }
}

- (SFUFileDataRepresentation)initWithInputStream:(id)a3 cryptoKey:(id)a4 dataLength:(int64_t)a5
{
  v8 = [(SFUFileDataRepresentation *)self init];
  if (v8)
  {
    v9 = (SFUCryptoKey *)a4;
    v8->mCryptoKey = v9;
    if (v9) {
      v8->mPlaintextDataLength = a5;
    }
    v8->mInputStream = (SFUInputStream *)a3;
  }
  return v8;
}

- (void)dealloc
{
  if (self->mDeleteFileWhenDone && self->mPath) {
    [+[NSFileManager defaultManager] removeItemAtPath:self->mPath error:0];
  }

  v3.receiver = self;
  v3.super_class = (Class)SFUFileDataRepresentation;
  [(SFUFileDataRepresentation *)&v3 dealloc];
}

- (id)description
{
  return +[NSString stringWithFormat:@"<SFUFileDataRepresentation %p: path %@>", self, self->mPath];
}

- (id)path
{
  return self->mPath;
}

- (unsigned)fileType
{
  return self->mFileType;
}

- (void)setFileType:(unsigned int)a3
{
  id v5 = [(SFUFileDataRepresentation *)self path];
  objc_sync_enter(self);
  if (v5)
  {
    id v6 = [objc_alloc((Class)NSNumber) initWithUnsignedLong:a3];
    id v7 = objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithObjectsAndKeys:", v6, NSFileHFSTypeCode, 0);
    [+[NSFileManager defaultManager] setAttributes:v7 ofItemAtPath:v5 error:0];
  }
  self->mFileType = a3;
  objc_sync_exit(self);
}

- (BOOL)isReadable
{
  return [(SFUFileDataRepresentation *)self path] != 0;
}

- (int64_t)dataLength
{
  if (self->mCryptoKey) {
    return self->mPlaintextDataLength;
  }
  else {
    return [(SFUFileDataRepresentation *)self encodedLength];
  }
}

- (int64_t)encodedLength
{
  return self->mFileLength;
}

- (BOOL)isEncrypted
{
  return self->mCryptoKey != 0;
}

- (BOOL)isCryptoKeyIdenticalToKey:(id)a3
{
  mCryptoKey = self->mCryptoKey;
  BOOL result = ((unint64_t)a3 | (unint64_t)mCryptoKey) == 0;
  if (a3)
  {
    if (mCryptoKey) {
      return [a3 isEqual:mCryptoKey];
    }
  }
  return result;
}

- (id)inputStream
{
  int mSharedFd = self->mSharedFd;
  if (mSharedFd == -1 || pread(mSharedFd, 0, 0, 0) == -1) {
    v4 = [[SFUFileInputStream alloc] initWithPath:[(SFUFileDataRepresentation *)self path] offset:0 length:[(SFUFileDataRepresentation *)self encodedLength]];
  }
  else {
    v4 = [[SFUFileInputStream alloc] initWithFileDescriptor:SFUDup(self->mSharedFd) offset:0 length:[(SFUFileDataRepresentation *)self encodedLength]];
  }
  id v5 = v4;
  if (self->mCryptoKey) {
    BOOL v6 = v4 == 0;
  }
  else {
    BOOL v6 = 1;
  }
  if (!v6)
  {
    id v7 = [[SFUCryptoInputStream alloc] initForDecryptionWithInputStream:v4 key:self->mCryptoKey];

    id v5 = v7;
  }
  return v5;
}

- (BOOL)hasSameLocationAs:(id)a3
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  id v5 = [(SFUFileDataRepresentation *)self path];
  id v6 = [a3 path];
  return [v5 isEqualToString:v6];
}

- (void)deleteFileWhenDone
{
  self->mDeleteFileWhenDone = 1;
}

- (void)readFileAttributes
{
  if (!self->mHasFileAttributes)
  {
    objc_sync_enter(self);
    if (!self->mHasFileAttributes)
    {
      objc_super v3 = [+[NSFileManager defaultManager] attributesOfItemAtPath:[(SFUFileDataRepresentation *)self path] error:0];
      v4 = v3;
      if (v3)
      {
        id v5 = [(NSDictionary *)v3 objectForKey:NSFileSize];
        if (v5) {
          self->mFileLength = (int64_t)[v5 unsignedLongLongValue];
        }
        id v6 = [(NSDictionary *)v4 objectForKey:NSFileHFSTypeCode];
        if (v6) {
          self->mFileType = [v6 unsignedIntValue];
        }
        __dmb(0xBu);
        self->mHasFileAttributes = 1;
      }
    }
    objc_sync_exit(self);
  }
}

@end
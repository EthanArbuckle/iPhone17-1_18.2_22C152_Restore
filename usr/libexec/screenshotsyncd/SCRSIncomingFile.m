@interface SCRSIncomingFile
- (NSURL)URL;
- (SCRSIncomingFile)initWithIDSURL:(id)a3;
- (void)dealloc;
- (void)unlinkURL;
@end

@implementation SCRSIncomingFile

- (SCRSIncomingFile)initWithIDSURL:(id)a3
{
  id v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)SCRSIncomingFile;
  v5 = [(SCRSIncomingFile *)&v26 init];
  if (v5)
  {
    uint64_t v6 = os_transaction_create();
    transaction = v5->_transaction;
    v5->_transaction = (OS_os_transaction *)v6;

    v8 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", [v4 fileSystemRepresentation]);
    v9 = [v8 pathExtension];
    v10 = [v8 stringByDeletingPathExtension];
    v11 = [v10 pathExtension];

    if ([v11 length] && (objc_msgSend(v11, "isEqualToString:", v9) & 1) == 0)
    {
      id v12 = v11;

      v9 = v12;
    }
    v13 = +[NSUUID UUID];
    v14 = [v13 UUIDString];
    id v15 = [v9 length];
    CFStringRef v16 = @".";
    if (!v15) {
      CFStringRef v16 = &stru_100004338;
    }
    v17 = +[NSString stringWithFormat:@"incoming-%@%@%@", v14, v16, v9];

    v18 = NSTemporaryDirectory();
    v19 = [v18 stringByAppendingPathComponent:v17];

    id v20 = v8;
    v21 = (const char *)[v20 fileSystemRepresentation];
    id v22 = v19;
    link(v21, (const char *)[v22 fileSystemRepresentation]);
    uint64_t v23 = +[NSURL fileURLWithPath:v22 isDirectory:0];
    URL = v5->_URL;
    v5->_URL = (NSURL *)v23;
  }
  return v5;
}

- (void)dealloc
{
  [(SCRSIncomingFile *)self unlinkURL];
  transaction = self->_transaction;
  self->_transaction = 0;

  v4.receiver = self;
  v4.super_class = (Class)SCRSIncomingFile;
  [(SCRSIncomingFile *)&v4 dealloc];
}

- (void)unlinkURL
{
  URL = self->_URL;
  if (URL)
  {
    unlink([(NSURL *)URL fileSystemRepresentation]);
    objc_super v4 = self->_URL;
    self->_URL = 0;
  }
}

- (NSURL)URL
{
  return self->_URL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_URL, 0);

  objc_storeStrong((id *)&self->_transaction, 0);
}

@end
@interface NPTOTemporaryFile
- (NPTOTemporaryFile)initWithPathExtension:(id)a3;
- (NSURL)URL;
- (void)dealloc;
@end

@implementation NPTOTemporaryFile

- (NPTOTemporaryFile)initWithPathExtension:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)NPTOTemporaryFile;
  v5 = [(NPTOTemporaryFile *)&v14 init];
  if (v5)
  {
    v6 = NSTemporaryDirectory();
    v7 = +[NSUUID UUID];
    v8 = [v7 UUIDString];
    v9 = [v6 stringByAppendingPathComponent:v8];
    v10 = [v9 stringByAppendingPathExtension:v4];
    uint64_t v11 = +[NSURL fileURLWithPath:v10];
    URL = v5->_URL;
    v5->_URL = (NSURL *)v11;
  }
  return v5;
}

- (void)dealloc
{
  v3 = +[NSFileManager defaultManager];
  [v3 removeItemAtURL:self->_URL error:0];

  v4.receiver = self;
  v4.super_class = (Class)NPTOTemporaryFile;
  [(NPTOTemporaryFile *)&v4 dealloc];
}

- (NSURL)URL
{
  return self->_URL;
}

- (void).cxx_destruct
{
}

@end
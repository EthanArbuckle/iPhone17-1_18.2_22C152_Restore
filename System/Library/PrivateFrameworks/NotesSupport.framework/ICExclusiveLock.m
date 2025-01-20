@interface ICExclusiveLock
- (BOOL)tryLock;
- (ICExclusiveLock)init;
- (ICExclusiveLock)initWithName:(id)a3 cachePath:(id)a4;
- (id)name;
- (void)dealloc;
- (void)lock;
- (void)setName:(id)a3;
- (void)unlock;
@end

@implementation ICExclusiveLock

- (void)unlock
{
  int fd = self->_fd;
  if (fd != -1)
  {
    close(fd);
    self->_int fd = -1;
  }
}

- (void)lock
{
  if (self->_fd == -1) {
    self->_int fd = open([(NSString *)self->_fullPath fileSystemRepresentation], 544, 448);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fullPath, 0);
  objc_storeStrong((id *)&self->_cachePath, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

- (ICExclusiveLock)initWithName:(id)a3 cachePath:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)ICExclusiveLock;
  v9 = [(ICExclusiveLock *)&v15 init];
  v10 = v9;
  if (v9)
  {
    if (!v7 || !v8)
    {
      id v14 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF4A0] reason:@"You must pass a name cachePath into initWithName:" userInfo:0];
      objc_exception_throw(v14);
    }
    objc_storeStrong((id *)&v9->_name, a3);
    objc_storeStrong((id *)&v10->_cachePath, a4);
    uint64_t v11 = [(NSString *)v10->_cachePath stringByAppendingPathComponent:v10->_name];
    fullPath = v10->_fullPath;
    v10->_fullPath = (NSString *)v11;

    v10->_int fd = -1;
  }

  return v10;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)ICExclusiveLock;
  [(ICExclusiveLock *)&v2 dealloc];
}

- (ICExclusiveLock)init
{
  return [(ICExclusiveLock *)self initWithName:0 cachePath:0];
}

- (BOOL)tryLock
{
  if (self->_fd != -1) {
    return 1;
  }
  int v4 = open([(NSString *)self->_fullPath fileSystemRepresentation], 548, 448);
  self->_int fd = v4;
  return v4 != -1;
}

- (void)setName:(id)a3
{
  id v12 = a3;
  p_name = &self->_name;
  if (![(NSString *)self->_name isEqualToString:v12])
  {
    if (self->_fd != -1)
    {
      id v7 = &self->_name;
      name = self->_name;
      id v8 = v7[1];
      v9 = [(NSString *)v8 stringByAppendingPathComponent:name];
      v10 = [(NSString *)v8 stringByAppendingPathComponent:v12];

      uint64_t v11 = [MEMORY[0x263F08850] defaultManager];
      [v11 moveItemAtPath:v9 toPath:v10 error:0];
    }
    objc_storeStrong((id *)p_name, a3);
  }
  MEMORY[0x270F9A758]();
}

- (id)name
{
  return self->_name;
}

@end
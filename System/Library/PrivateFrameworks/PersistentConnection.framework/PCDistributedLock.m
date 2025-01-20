@interface PCDistributedLock
- (BOOL)_lockBlocking:(BOOL)a3;
- (BOOL)tryLock;
- (PCDistributedLock)initWithName:(id)a3;
- (PCDistributedLock)initWithPath:(id)a3;
- (void)dealloc;
- (void)lock;
- (void)unlock;
@end

@implementation PCDistributedLock

- (PCDistributedLock)initWithPath:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PCDistributedLock;
  v5 = [(PCDistributedLock *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    path = v5->_path;
    v5->_path = (NSString *)v6;

    v5->_fd = -1;
  }

  return v5;
}

- (PCDistributedLock)initWithName:(id)a3
{
  id v4 = a3;
  v5 = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, 1uLL, 1);
  uint64_t v6 = [v5 objectAtIndex:0];

  v7 = (void *)[[NSString alloc] initWithFormat:@".%@.lock", v4];
  v8 = [v6 stringByAppendingPathComponent:v7];
  objc_super v9 = [(PCDistributedLock *)self initWithPath:v8];

  return v9;
}

- (void)dealloc
{
  if (self->_fd != -1) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8], @"%@ at path '%@' is being deallocated while locked", objc_opt_class(), self->_path format];
  }
  v3.receiver = self;
  v3.super_class = (Class)PCDistributedLock;
  [(PCDistributedLock *)&v3 dealloc];
}

- (BOOL)_lockBlocking:(BOOL)a3
{
  BOOL v3 = a3;
  if (self->_fd != -1) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8], @"%@ at path '%@' is already locked", objc_opt_class(), self->_path format];
  }
  if (v3) {
    int v5 = 544;
  }
  else {
    int v5 = 548;
  }
  int v6 = open([(NSString *)self->_path fileSystemRepresentation], v5, 420);
  self->_int fd = v6;
  if (v6 == -1)
  {
    if (*__error() == 1)
    {
      chmod([(NSString *)self->_path fileSystemRepresentation], 0x1A4u);
      int fd = open([(NSString *)self->_path fileSystemRepresentation], v5, 420);
      self->_int fd = fd;
    }
    else
    {
      int fd = self->_fd;
    }
    if (fd == -1 && (v3 || *__error() != 35))
    {
      v8 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v9 = *MEMORY[0x1E4F1C3B8];
      uint64_t v10 = objc_opt_class();
      path = self->_path;
      v12 = __error();
      [v8 raise:v9, @"Unable to take %@ at path '%@': %s", v10, path, strerror(*v12) format];
    }
  }
  return self->_fd != -1;
}

- (BOOL)tryLock
{
  return [(PCDistributedLock *)self _lockBlocking:0];
}

- (void)lock
{
}

- (void)unlock
{
  int fd = self->_fd;
  if (fd == -1)
  {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8], @"%@ at path '%@' is not locked", objc_opt_class(), self->_path format];
    int fd = self->_fd;
  }
  close(fd);
  self->_int fd = -1;
}

- (void).cxx_destruct
{
}

@end
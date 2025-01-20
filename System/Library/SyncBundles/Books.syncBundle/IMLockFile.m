@interface IMLockFile
- (BOOL)_lock:(BOOL)a3 blocking:(BOOL)a4;
- (BOOL)lock:(BOOL)a3;
- (BOOL)locked;
- (BOOL)tryLock:(BOOL)a3;
- (IMLockFile)initWithPath:(id)a3;
- (NSString)path;
- (void)dealloc;
- (void)unlock;
@end

@implementation IMLockFile

- (IMLockFile)initWithPath:(id)a3
{
  v4 = [(IMLockFile *)self init];
  if (v4)
  {
    v4->_path = (NSString *)a3;
    v4->_fd = -1;
    v4->_locked = 0;
  }
  return v4;
}

- (void)dealloc
{
  [(IMLockFile *)self unlock];

  v3.receiver = self;
  v3.super_class = (Class)IMLockFile;
  [(IMLockFile *)&v3 dealloc];
}

- (BOOL)_lock:(BOOL)a3 blocking:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  if (![(IMLockFile *)self locked])
  {
    if ([(NSString *)[(IMLockFile *)self path] length])
    {
      int v7 = open([(NSString *)[(IMLockFile *)self path] fileSystemRepresentation], 16777728, 438);
      self->_fd = v7;
      if (v7 != -1)
      {
        int v8 = v5 ? 2 : 1;
        int v9 = v4 ? 0 : 4;
        self->_locked = flock(v7, v9 | v8) != -1;
        if (![(IMLockFile *)self locked])
        {
          close(self->_fd);
          self->_fd = -1;
        }
      }
    }
  }

  return [(IMLockFile *)self locked];
}

- (BOOL)lock:(BOOL)a3
{
  return [(IMLockFile *)self _lock:a3 blocking:1];
}

- (BOOL)tryLock:(BOOL)a3
{
  return [(IMLockFile *)self _lock:a3 blocking:0];
}

- (void)unlock
{
  if ([(IMLockFile *)self locked])
  {
    flock(self->_fd, 8);
    close(self->_fd);
    self->_fd = -1;
    self->_locked = 0;
  }
}

- (NSString)path
{
  return self->_path;
}

- (BOOL)locked
{
  return self->_locked;
}

@end
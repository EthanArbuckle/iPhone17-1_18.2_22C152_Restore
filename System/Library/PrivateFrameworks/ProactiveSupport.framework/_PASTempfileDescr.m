@interface _PASTempfileDescr
+ (id)tempfileDescrWithFd:(int)a3 path:(id)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToTempfileDescr:(id)a3;
- (NSString)path;
- (_PASTempfileDescr)initWithFd:(int)a3 path:(id)a4;
- (int)fd;
- (unint64_t)hash;
@end

@implementation _PASTempfileDescr

- (void).cxx_destruct
{
}

- (NSString)path
{
  return self->_path;
}

- (int)fd
{
  return self->_fd;
}

- (unint64_t)hash
{
  uint64_t fd = self->_fd;
  return [(NSString *)self->_path hash] - fd + 32 * fd;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (_PASTempfileDescr *)a3;
  v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(_PASTempfileDescr *)self isEqualToTempfileDescr:v5];

  return v6;
}

- (BOOL)isEqualToTempfileDescr:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4
    && (int fd = self->_fd, fd == [v4 fd])
    && (int v7 = self->_path != 0,
        [v5 path],
        v8 = objc_claimAutoreleasedReturnValue(),
        int v9 = v8 == 0,
        v8,
        v7 != v9))
  {
    path = self->_path;
    if (path)
    {
      v11 = [v5 path];
      char v12 = [(NSString *)path isEqual:v11];
    }
    else
    {
      char v12 = 1;
    }
  }
  else
  {
    char v12 = 0;
  }

  return v12;
}

- (_PASTempfileDescr)initWithFd:(int)a3 path:(id)a4
{
  id v8 = a4;
  if (!v8)
  {
    char v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"_PASFileUtils.m", 197, @"Invalid parameter not satisfying: %@", @"path" object file lineNumber description];
  }
  v13.receiver = self;
  v13.super_class = (Class)_PASTempfileDescr;
  int v9 = [(_PASTempfileDescr *)&v13 init];
  v10 = v9;
  if (v9)
  {
    v9->_int fd = a3;
    objc_storeStrong((id *)&v9->_path, a4);
  }

  return v10;
}

+ (id)tempfileDescrWithFd:(int)a3 path:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  int v7 = (void *)[objc_alloc((Class)a1) initWithFd:v4 path:v6];

  return v7;
}

@end
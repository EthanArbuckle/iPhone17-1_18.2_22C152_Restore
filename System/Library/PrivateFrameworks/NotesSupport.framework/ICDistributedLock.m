@interface ICDistributedLock
+ (id)lockWithPath:(id)a3;
- (BOOL)tryLock;
- (ICDistributedLock)init;
- (ICDistributedLock)initWithPath:(id)a3;
- (NSDate)lockDate;
- (id)description;
- (void)breakLock;
- (void)dealloc;
- (void)invalidate;
@end

@implementation ICDistributedLock

- (ICDistributedLock)init
{
  uint64_t v3 = objc_msgSend(NSString, "stringWithFormat:", @"%s should not be used.", "-[ICDistributedLock init]");

  objc_exception_throw((id)[MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF488] reason:v3 userInfo:0]);
}

+ (id)lockWithPath:(id)a3
{
  uint64_t v3 = (void *)[objc_allocWithZone((Class)a1) initWithPath:a3];
  return v3;
}

- (ICDistributedLock)initWithPath:(id)a3
{
  if (objc_msgSend((id)objc_msgSend(MEMORY[0x263F08850], "defaultManager"), "directoryCanBeCreatedAtPath:", a3))
  {
    v7.receiver = self;
    v7.super_class = (Class)ICDistributedLock;
    v5 = [(ICDistributedLock *)&v7 init];
    v5->threadLock = (NSLock *)[objc_allocWithZone(MEMORY[0x263F08958]) init];
    v5->lockName = (NSString *)[a3 copyWithZone:0];
    v5->hasLock = 0;
  }
  else
  {

    return 0;
  }
  return v5;
}

- (void)invalidate
{
  if (self->hasLock && self->lockName) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x263F08850], "defaultManager"), "removeItemAtPath:error:", self->lockName, 0);
  }

  self->lockName = 0;
  self->hasLock = 0;
  [(NSLock *)self->threadLock unlock];

  self->threadLock = 0;
}

- (void)dealloc
{
  [(ICDistributedLock *)self invalidate];
  v3.receiver = self;
  v3.super_class = (Class)ICDistributedLock;
  [(ICDistributedLock *)&v3 dealloc];
}

- (BOOL)tryLock
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  [(NSLock *)self->threadLock lock];
  if (self->hasLock
    || ![(NSString *)self->lockName getFileSystemRepresentation:v5 maxLength:1024]|| mkdir(v5, 0x1FFu))
  {
    [(NSLock *)self->threadLock unlock];
    return 0;
  }
  else
  {
    BOOL v3 = 1;
    self->hasLock = 1;
    [(NSLock *)self->threadLock unlock];
  }
  return v3;
}

- (void)breakLock
{
  [(NSLock *)self->threadLock lock];
  objc_msgSend((id)objc_msgSend(MEMORY[0x263F08850], "defaultManager"), "removeItemAtPath:error:", self->lockName, 0);
  self->hasLock = 0;
  threadLock = self->threadLock;
  [(NSLock *)threadLock unlock];
}

- (NSDate)lockDate
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  memset(&v4.st_mtimespec, 0, 96);
  if (!-[NSString getFileSystemRepresentation:maxLength:](self->lockName, "getFileSystemRepresentation:maxLength:", v5, 1024, 0, 0, 0, 0, 0, 0))return 0; {
  if (stat(v5, &v4) < 0)
  }
    double v2 = 0.0;
  else {
    double v2 = (double)v4.st_mtimespec.tv_sec - *MEMORY[0x263EFFAF8] + (double)v4.st_mtimespec.tv_nsec * 0.000000001;
  }
  return (NSDate *)[MEMORY[0x263EFF910] dateWithTimeIntervalSinceReferenceDate:v2];
}

- (id)description
{
  BOOL v3 = NSString;
  stat v4 = (objc_class *)objc_opt_class();
  Name = class_getName(v4);
  uint64_t v6 = "YES";
  if (!self->hasLock) {
    uint64_t v6 = "NO";
  }
  return (id)[v3 stringWithFormat:@"%s(%p) locked: %s  path: '%@'", Name, self, v6, self->lockName];
}

@end
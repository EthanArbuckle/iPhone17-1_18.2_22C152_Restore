@interface RDFileURLs
+ (void)initialize;
- (RDFileURLs)init;
- (void)dealloc;
@end

@implementation RDFileURLs

+ (void)initialize
{
  if ((id)objc_opt_class() == a1) {
    qword_10006EB60 = (uint64_t)os_log_create("com.apple.SensorKit", "RDFileURLs");
  }
}

- (RDFileURLs)init
{
  self;
  v3 = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, 1uLL, 1);
  if ([(NSArray *)v3 count])
  {
    v4 = +[NSURL fileURLWithPath:[(NSArray *)v3 firstObject] isDirectory:1];
    if (!self) {
      return self;
    }
  }
  else
  {
    v4 = 0;
    if (!self) {
      return self;
    }
  }
  v6.receiver = self;
  v6.super_class = (Class)RDFileURLs;
  self = [(RDFileURLs *)&v6 init];
  if (self) {
    self->_rootDir = v4;
  }
  return self;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)RDFileURLs;
  [(RDFileURLs *)&v3 dealloc];
}

@end
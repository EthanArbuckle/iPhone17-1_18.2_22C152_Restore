@interface RDArchiver
+ (void)initialize;
- (void)dealloc;
@end

@implementation RDArchiver

+ (void)initialize
{
  if ((id)objc_opt_class() == a1) {
    qword_10006EB08 = (uint64_t)os_log_create("com.apple.SensorKit", "Archiver");
  }
}

- (void)dealloc
{
  if (self->_valid)
  {
    archive_write_free();
    close(self->_fd);
  }
  objc_setProperty_nonatomic(self, a2, 0, 32);
  v3.receiver = self;
  v3.super_class = (Class)RDArchiver;
  [(RDArchiver *)&v3 dealloc];
}

@end
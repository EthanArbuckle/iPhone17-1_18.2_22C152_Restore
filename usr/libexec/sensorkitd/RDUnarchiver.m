@interface RDUnarchiver
+ (void)initialize;
- (void)dealloc;
@end

@implementation RDUnarchiver

+ (void)initialize
{
  if ((id)objc_opt_class() == a1) {
    qword_10006EAE8 = (uint64_t)os_log_create("com.apple.SensorKit", "Unarchiver");
  }
}

- (void)dealloc
{
  if (self->_readValid) {
    archive_read_free();
  }
  if (self->_writeValid) {
    archive_write_free();
  }

  self->_outputURL = 0;
  v3.receiver = self;
  v3.super_class = (Class)RDUnarchiver;
  [(RDUnarchiver *)&v3 dealloc];
}

@end
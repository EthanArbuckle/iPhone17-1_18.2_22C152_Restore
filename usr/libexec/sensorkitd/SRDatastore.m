@interface SRDatastore
+ (void)initialize;
- (void)dealloc;
@end

@implementation SRDatastore

+ (void)initialize
{
  if ((id)objc_opt_class() == a1) {
    qword_10006EC70 = (uint64_t)os_log_create("com.apple.SensorKit", "Datastore");
  }
}

- (void)dealloc
{
  if (self)
  {
    objc_setProperty_atomic(self, a2, 0, 40);
    objc_setProperty_atomic(self, v3, 0, 48);
    objc_setProperty_atomic(self, v4, 0, 56);
  }

  self->_defaults = 0;
  v5.receiver = self;
  v5.super_class = (Class)SRDatastore;
  [(SRDatastore *)&v5 dealloc];
}

@end
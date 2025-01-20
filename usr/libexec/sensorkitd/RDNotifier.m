@interface RDNotifier
+ (void)initialize;
- (void)dealloc;
@end

@implementation RDNotifier

+ (void)initialize
{
  if ((id)objc_opt_class() == a1) {
    qword_10006EBC0 = (uint64_t)os_log_create("com.apple.SensorKit", "RDNotifier");
  }
}

- (void)dealloc
{
  if (self)
  {
    objc_setProperty_nonatomic(self, a2, 0, 16);
    objc_setProperty_nonatomic(self, v3, 0, 24);
    objc_setProperty_nonatomic(self, v4, 0, 32);
    objc_setProperty_nonatomic(self, v5, 0, 40);
  }
  dispatch_release((dispatch_object_t)self->_q);
  v6.receiver = self;
  v6.super_class = (Class)RDNotifier;
  [(RDNotifier *)&v6 dealloc];
}

@end
@interface RDCacheDelete
+ (void)initialize;
- (void)dealloc;
@end

@implementation RDCacheDelete

+ (void)initialize
{
  if ((id)objc_opt_class() == a1) {
    qword_10002A9E8 = (uint64_t)os_log_create("com.apple.SensorKit", "RDCacheDelete");
  }
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)RDCacheDelete;
  [(RDCacheDelete *)&v3 dealloc];
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_analyticsDelegate);

  objc_destroyWeak((id *)&self->_delegate);
}

@end
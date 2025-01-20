@interface RDClientInterestCache
+ (void)initialize;
- (void)cache:(id)a3 willEvictObject:(id)a4;
- (void)dealloc;
@end

@implementation RDClientInterestCache

+ (void)initialize
{
  if ((id)objc_opt_class() == a1) {
    qword_10006EAA8 = (uint64_t)os_log_create("com.apple.SensorKit", "ClientInterestCache");
  }
}

- (void)dealloc
{
  if (self)
  {
    objc_setProperty_nonatomic(self, a2, 0, 8);
    objc_setProperty_nonatomic(self, v3, 0, 16);
    objc_setProperty_nonatomic(self, v4, 0, 24);
  }
  v5.receiver = self;
  v5.super_class = (Class)RDClientInterestCache;
  [(RDClientInterestCache *)&v5 dealloc];
}

- (void)cache:(id)a3 willEvictObject:(id)a4
{
  v6 = qword_10006EAA8;
  if (os_log_type_enabled((os_log_t)qword_10006EAA8, OS_LOG_TYPE_DEBUG))
  {
    int v7 = 138543618;
    id v8 = a4;
    __int16 v9 = 2050;
    id v10 = a3;
    _os_log_debug_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "Evicting %{public}@ from cache: %{public}p", (uint8_t *)&v7, 0x16u);
  }
}

@end
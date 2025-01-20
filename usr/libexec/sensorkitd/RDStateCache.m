@interface RDStateCache
+ (void)initialize;
- (id)description;
- (void)dealloc;
@end

@implementation RDStateCache

+ (void)initialize
{
  if ((id)objc_opt_class() == a1) {
    qword_10006EBF0 = (uint64_t)os_log_create("com.apple.SensorKit", "RDStateCache");
  }
}

- (void)dealloc
{
  self->_fileURLs = 0;
  objc_setProperty_nonatomic(self, v3, 0, 96);
  objc_setProperty_nonatomic(self, v4, 0, 104);
  v5.receiver = self;
  v5.super_class = (Class)RDStateCache;
  [(RDStateCache *)&v5 dealloc];
}

- (id)description
{
  uint64_t v3 = mach_continuous_time();
  if (qword_10006EC88 != -1) {
    dispatch_once(&qword_10006EC88, &stru_10005CDC0);
  }
  unint64_t v4 = qword_10006EC90;
  double v5 = *(double *)&qword_10006EC98;
  double v6 = *(double *)&qword_10006ECA0;
  TMConvertTicksToSeconds();
  if (v4 >= v3) {
    double v7 = -v7;
  }
  return +[NSString stringWithFormat:@"SRAbsoluteTimeGetCurrent(): %f, %@", v6 + v5 + v7, [sub_100028838((NSDictionary *)self) description]];
}

@end
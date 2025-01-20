@interface CLIndoorTileEvictionPolicy
+ (BOOL)supportsSecureCoding;
- (BOOL)forceClean;
- (BOOL)tileLastModified:(double)a3 needsEvictionAt:(double)a4;
- (CLIndoorTileEvictionPolicy)init;
- (CLIndoorTileEvictionPolicy)initWithCoder:(id)a3;
- (OS_xpc_object)activity;
- (double)maxModifiedAge;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setActivity:(id)a3;
- (void)setForceClean:(BOOL)a3;
- (void)setMaxModifiedAge:(double)a3;
@end

@implementation CLIndoorTileEvictionPolicy

- (CLIndoorTileEvictionPolicy)init
{
  v7.receiver = self;
  v7.super_class = (Class)CLIndoorTileEvictionPolicy;
  v2 = [(CLIndoorTileEvictionPolicy *)&v7 init];
  v3 = v2;
  if (v2)
  {
    v2->_forceClean = 0;
    activity = v2->_activity;
    v2->_maxModifiedAge = 604800.0;
    v2->_activity = 0;

    v5 = v3;
  }

  return v3;
}

- (BOOL)tileLastModified:(double)a3 needsEvictionAt:(double)a4
{
  if (qword_10047BEF8 != -1)
  {
    dispatch_once(&qword_10047BEF8, &stru_10045FF20);
    objc_super v7 = qword_10047BF00;
    if (os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_INFO)) {
      goto LABEL_3;
    }
LABEL_5:
    double v8 = a4 - a3;
    return v8 >= self->_maxModifiedAge;
  }
  objc_super v7 = qword_10047BF00;
  if (!os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_INFO)) {
    goto LABEL_5;
  }
LABEL_3:
  double v8 = a4 - a3;
  double maxModifiedAge = self->_maxModifiedAge;
  int v11 = 134350080;
  double v12 = a4;
  __int16 v13 = 2050;
  double v14 = a3;
  __int16 v15 = 2050;
  double v16 = a4 - a3;
  __int16 v17 = 2050;
  double v18 = maxModifiedAge;
  __int16 v19 = 1024;
  BOOL v20 = a4 - a3 >= maxModifiedAge;
  _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "@EvictCheck, modified, %{public}.1f, %{public}.1f, ages, %{public}.1f, %{public}.1f, evict, %d", (uint8_t *)&v11, 0x30u);
  return v8 >= self->_maxModifiedAge;
}

- (void).cxx_destruct
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CLIndoorTileEvictionPolicy)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CLIndoorTileEvictionPolicy;
  v5 = [(CLIndoorTileEvictionPolicy *)&v10 init];
  if (v5)
  {
    [v4 decodeDoubleForKey:@"_maxModifiedAge"];
    v5->_double maxModifiedAge = v6;
    v5->_forceClean = [v4 decodeBoolForKey:@"_forceClean"];
    activity = v5->_activity;
    v5->_activity = 0;

    double v8 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  [v5 encodeDouble:@"_maxModifiedAge" forKey:self->_maxModifiedAge];
  double v4 = 0.0;
  if (self->_forceClean) {
    double v4 = 1.0;
  }
  [v5 encodeDouble:@"_forceClean" forKey:v4];
}

- (id)description
{
  CFStringRef v2 = @"YES";
  if (self->_forceClean) {
    CFStringRef v3 = @"YES";
  }
  else {
    CFStringRef v3 = @"NO";
  }
  if (!self->_activity) {
    CFStringRef v2 = @"NO";
  }
  return +[NSString stringWithFormat:@"CLIndoorTileEvictionPolicy[maxModifiedAge=%lfs,forceClean=%@,xpc_activity=%@]", *(void *)&self->_maxModifiedAge, v3, v2];
}

- (double)maxModifiedAge
{
  return self->_maxModifiedAge;
}

- (void)setMaxModifiedAge:(double)a3
{
  self->_double maxModifiedAge = a3;
}

- (BOOL)forceClean
{
  return self->_forceClean;
}

- (void)setForceClean:(BOOL)a3
{
  self->_forceClean = a3;
}

- (OS_xpc_object)activity
{
  return self->_activity;
}

- (void)setActivity:(id)a3
{
}

@end
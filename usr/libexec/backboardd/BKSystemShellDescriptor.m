@interface BKSystemShellDescriptor
+ (BKSystemShellDescriptor)new;
+ (id)build:(id)a3;
- (BKSystemShellDescriptor)init;
- (BOOL)isEqual:(id)a3;
- (NSString)bundleIdentifier;
- (NSString)bundlePath;
- (NSString)debugDescription;
- (NSString)description;
- (NSString)jobLabel;
- (double)systemIdleSleepInterval;
- (id)copyWithZone:(_NSZone *)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)succinctDescription;
- (int)pid;
- (int64_t)watchdogType;
- (unint64_t)hash;
- (void)appendDescriptionToStream:(id)a3;
@end

@implementation BKSystemShellDescriptor

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_jobLabel, 0);
  objc_storeStrong((id *)&self->_bundlePath, 0);

  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

- (int64_t)watchdogType
{
  return self->_watchdogType;
}

- (double)systemIdleSleepInterval
{
  return self->_systemIdleSleepInterval;
}

- (int)pid
{
  return self->_pid;
}

- (NSString)jobLabel
{
  return self->_jobLabel;
}

- (NSString)bundlePath
{
  return self->_bundlePath;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)appendDescriptionToStream:(id)a3
{
  id v11 = a3;
  v4 = BSProcessDescriptionForPID();
  [v11 appendString:v4 withName:0];

  if (([v11 hasSuccinctStyle] & 1) == 0)
  {
    id v5 = [v11 appendObject:self->_bundleIdentifier withName:@"bundleIdentifier"];
    id v6 = [v11 appendObject:self->_bundlePath withName:@"bundlePath"];
    id v7 = [v11 appendObject:self->_jobLabel withName:@"jobLabel"];
    id v8 = [v11 appendDouble:@"systemIdleSleepInterval" withName:2 decimalPrecision:self->_systemIdleSleepInterval];
    int64_t watchdogType = self->_watchdogType;
    if (watchdogType)
    {
      if (watchdogType == 1)
      {
        v10 = @"shell";
      }
      else
      {
        v10 = +[NSString stringWithFormat:@"<unknown:%lX>", self->_watchdogType];
      }
    }
    else
    {
      v10 = @"BackBoard";
    }
    [v11 appendString:v10 withName:@"watchdogType"];
  }
}

- (id)succinctDescription
{
  v3 = +[BSDescriptionStyle succinctStyle];
  v4 = +[BSDescriptionStream descriptionForRootObject:self withStyle:v3];

  return v4;
}

- (NSString)debugDescription
{
  v3 = +[BSDescriptionStyle debugStyle];
  v4 = +[BSDescriptionStream descriptionForRootObject:self withStyle:v3];

  return (NSString *)v4;
}

- (NSString)description
{
  return (NSString *)+[BSDescriptionStream descriptionForRootObject:self];
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  v4 = [BKMutableSystemShellDescriptor alloc];

  return sub_10008385C(v4, self);
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [BKSystemShellDescriptor alloc];

  return sub_10008385C(v4, self);
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = (double *)v4;
    BOOL v6 = BSEqualObjects()
      && BSEqualObjects()
      && BSEqualObjects()
      && *((_DWORD *)v5 + 8) == self->_pid
      && v5[5] == self->_systemIdleSleepInterval
      && *((void *)v5 + 6) == self->_watchdogType;
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_bundleIdentifier hash];
  unint64_t v4 = [(NSString *)self->_bundlePath hash] ^ v3;
  unint64_t v5 = v4 ^ [(NSString *)self->_jobLabel hash];
  BOOL v6 = +[NSNumber numberWithInt:self->_pid];
  unint64_t v7 = v5 ^ (unint64_t)[v6 hash];

  id v8 = +[NSNumber numberWithDouble:self->_systemIdleSleepInterval];
  unint64_t v9 = (unint64_t)[v8 hash];

  v10 = +[NSNumber numberWithInteger:self->_watchdogType];
  unint64_t v11 = v7 ^ v9 ^ (unint64_t)[v10 hash];

  unint64_t v12 = 0x94D049BB133111EBLL
      * ((0xBF58476D1CE4E5B9 * (v11 ^ (v11 >> 30))) ^ ((0xBF58476D1CE4E5B9 * (v11 ^ (v11 >> 30))) >> 27));
  return v12 ^ (v12 >> 31);
}

- (BKSystemShellDescriptor)init
{
  unint64_t v4 = +[NSString stringWithFormat:@"cannot directly allocate BKSystemShellDescriptor"];
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    unint64_t v5 = NSStringFromSelector(a2);
    BOOL v6 = (objc_class *)objc_opt_class();
    unint64_t v7 = NSStringFromClass(v6);
    int v9 = 138544642;
    v10 = v5;
    __int16 v11 = 2114;
    unint64_t v12 = v7;
    __int16 v13 = 2048;
    v14 = self;
    __int16 v15 = 2114;
    CFStringRef v16 = @"BKSystemShellDescriptor.m";
    __int16 v17 = 1024;
    int v18 = 33;
    __int16 v19 = 2114;
    v20 = v4;
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v9, 0x3Au);
  }
  [v4 UTF8String];
  result = (BKSystemShellDescriptor *)_bs_set_crash_log_message();
  __break(0);
  return result;
}

+ (BKSystemShellDescriptor)new
{
  unint64_t v4 = +[NSString stringWithFormat:@"cannot directly allocate BKSystemShellDescriptor"];
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    unint64_t v5 = NSStringFromSelector(a2);
    BOOL v6 = (objc_class *)objc_opt_class();
    unint64_t v7 = NSStringFromClass(v6);
    int v9 = 138544642;
    v10 = v5;
    __int16 v11 = 2114;
    unint64_t v12 = v7;
    __int16 v13 = 2048;
    id v14 = a1;
    __int16 v15 = 2114;
    CFStringRef v16 = @"BKSystemShellDescriptor.m";
    __int16 v17 = 1024;
    int v18 = 38;
    __int16 v19 = 2114;
    v20 = v4;
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v9, 0x3Au);
  }
  [v4 UTF8String];
  result = (BKSystemShellDescriptor *)_bs_set_crash_log_message();
  __break(0);
  return result;
}

+ (id)build:(id)a3
{
  NSUInteger v3 = (void (**)(id, id))a3;
  id v4 = sub_1000838F4([BKMutableSystemShellDescriptor alloc]);
  v3[2](v3, v4);

  id v5 = [v4 copy];

  return v5;
}

@end
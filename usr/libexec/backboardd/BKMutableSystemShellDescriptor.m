@interface BKMutableSystemShellDescriptor
- (void)setBundleIdentifier:(id)a3;
- (void)setBundlePath:(id)a3;
- (void)setJobLabel:(id)a3;
- (void)setPid:(int)a3;
- (void)setSystemIdleSleepInterval:(double)a3;
- (void)setWatchdogType:(int64_t)a3;
@end

@implementation BKMutableSystemShellDescriptor

- (void)setWatchdogType:(int64_t)a3
{
  self->super._watchdogType = a3;
}

- (void)setSystemIdleSleepInterval:(double)a3
{
  self->super._systemIdleSleepInterval = a3;
}

- (void)setPid:(int)a3
{
  self->super._pid = a3;
}

- (void)setJobLabel:(id)a3
{
  id v15 = a3;
  if (v15)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v7 = (objc_class *)[v15 classForCoder];
      if (!v7) {
        v7 = (objc_class *)objc_opt_class();
      }
      v8 = NSStringFromClass(v7);
      v9 = (objc_class *)objc_opt_class();
      v10 = NSStringFromClass(v9);
      v11 = +[NSString stringWithFormat:@"Value for '%@' was of unexpected class %@. Expected %@.", @"jobLabel", v8, v10];

      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        v12 = NSStringFromSelector(a2);
        v13 = (objc_class *)objc_opt_class();
        v14 = NSStringFromClass(v13);
        *(_DWORD *)buf = 138544642;
        v17 = v12;
        __int16 v18 = 2114;
        v19 = v14;
        __int16 v20 = 2048;
        v21 = self;
        __int16 v22 = 2114;
        CFStringRef v23 = @"BKSystemShellDescriptor.m";
        __int16 v24 = 1024;
        int v25 = 204;
        __int16 v26 = 2114;
        v27 = v11;
        _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
      }
      [v11 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x10008315CLL);
    }
  }

  v5 = (NSString *)[v15 copy];
  jobLabel = self->super._jobLabel;
  self->super._jobLabel = v5;
}

- (void)setBundlePath:(id)a3
{
  id v15 = a3;
  if (v15)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v7 = (objc_class *)[v15 classForCoder];
      if (!v7) {
        v7 = (objc_class *)objc_opt_class();
      }
      v8 = NSStringFromClass(v7);
      v9 = (objc_class *)objc_opt_class();
      v10 = NSStringFromClass(v9);
      v11 = +[NSString stringWithFormat:@"Value for '%@' was of unexpected class %@. Expected %@.", @"bundlePath", v8, v10];

      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        v12 = NSStringFromSelector(a2);
        v13 = (objc_class *)objc_opt_class();
        v14 = NSStringFromClass(v13);
        *(_DWORD *)buf = 138544642;
        v17 = v12;
        __int16 v18 = 2114;
        v19 = v14;
        __int16 v20 = 2048;
        v21 = self;
        __int16 v22 = 2114;
        CFStringRef v23 = @"BKSystemShellDescriptor.m";
        __int16 v24 = 1024;
        int v25 = 198;
        __int16 v26 = 2114;
        v27 = v11;
        _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
      }
      [v11 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x100083358);
    }
  }

  v5 = (NSString *)[v15 copy];
  bundlePath = self->super._bundlePath;
  self->super._bundlePath = v5;
}

- (void)setBundleIdentifier:(id)a3
{
  id v15 = a3;
  if (v15)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v7 = (objc_class *)[v15 classForCoder];
      if (!v7) {
        v7 = (objc_class *)objc_opt_class();
      }
      v8 = NSStringFromClass(v7);
      v9 = (objc_class *)objc_opt_class();
      v10 = NSStringFromClass(v9);
      v11 = +[NSString stringWithFormat:@"Value for '%@' was of unexpected class %@. Expected %@.", @"bundleIdentifier", v8, v10];

      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        v12 = NSStringFromSelector(a2);
        v13 = (objc_class *)objc_opt_class();
        v14 = NSStringFromClass(v13);
        *(_DWORD *)buf = 138544642;
        v17 = v12;
        __int16 v18 = 2114;
        v19 = v14;
        __int16 v20 = 2048;
        v21 = self;
        __int16 v22 = 2114;
        CFStringRef v23 = @"BKSystemShellDescriptor.m";
        __int16 v24 = 1024;
        int v25 = 192;
        __int16 v26 = 2114;
        v27 = v11;
        _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
      }
      [v11 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x100083554);
    }
  }

  v5 = (NSString *)[v15 copy];
  bundleIdentifier = self->super._bundleIdentifier;
  self->super._bundleIdentifier = v5;
}

@end
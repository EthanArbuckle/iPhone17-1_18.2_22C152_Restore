@interface BKDigitizerTouchStreamClient
- (BKDigitizerTouchStreamClient)init;
- (NSString)description;
- (void)appendDescriptionToFormatter:(id)a3;
- (void)dealloc;
@end

@implementation BKDigitizerTouchStreamClient

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_processName, 0);
  objc_storeStrong((id *)&self->_processDeathWatcher, 0);
  objc_storeStrong((id *)&self->_touchDestination, 0);

  objc_destroyWeak((id *)&self->_parent);
}

- (void)appendDescriptionToFormatter:(id)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100095F64;
  v3[3] = &unk_1000F8E50;
  v3[4] = a3;
  v3[5] = self;
  [a3 appendProem:self block:v3];
}

- (NSString)description
{
  return (NSString *)+[BSDescriptionStream descriptionForRootObject:self];
}

- (void)dealloc
{
  if (self && self->_valid)
  {
    v4 = +[NSString stringWithFormat:@"dealloc without previous -invalidate"];
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      v5 = NSStringFromSelector(a2);
      v6 = (objc_class *)objc_opt_class();
      v7 = NSStringFromClass(v6);
      *(_DWORD *)buf = 138544642;
      v10 = v5;
      __int16 v11 = 2114;
      v12 = v7;
      __int16 v13 = 2048;
      v14 = self;
      __int16 v15 = 2114;
      CFStringRef v16 = @"BKDigitizerTouchStreamClient.m";
      __int16 v17 = 1024;
      int v18 = 45;
      __int16 v19 = 2114;
      v20 = v4;
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v4 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x100096234);
  }
  v8.receiver = self;
  v8.super_class = (Class)BKDigitizerTouchStreamClient;
  [(BKDigitizerTouchStreamClient *)&v8 dealloc];
}

- (BKDigitizerTouchStreamClient)init
{
  v6.receiver = self;
  v6.super_class = (Class)BKDigitizerTouchStreamClient;
  v2 = [(BKDigitizerTouchStreamClient *)&v6 init];
  v3 = v2;
  if (v2)
  {
    *(_WORD *)&v2->_dispatchMode = 1;
    BSContinuousMachTimeNow();
    v3->_creationTime = v4;
    v3->_valid = 1;
  }
  return v3;
}

@end
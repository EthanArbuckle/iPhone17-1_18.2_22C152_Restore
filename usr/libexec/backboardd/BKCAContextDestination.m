@interface BKCAContextDestination
- (BKCAContextDestination)initWithContextID:(unsigned int)a3 clientPort:(unsigned int)a4;
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (id)copyWithZone:(_NSZone *)a3;
- (id)succinctDescription;
- (unint64_t)hash;
- (void)appendDescriptionToFormatter:(id)a3;
- (void)appendSuccinctDescriptionToFormatter:(id)a3;
@end

@implementation BKCAContextDestination

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init((Class)objc_opt_class());
  *((_DWORD *)v4 + 2) = self->_contextID;
  *((_DWORD *)v4 + 3) = self->_clientPort;
  objc_storeStrong((id *)v4 + 2, self->_inheritedSceneHostSettings);
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  id v6 = v4;
  if (v5)
  {
    if (objc_opt_isKindOfClass()) {
      v7 = v6;
    }
    else {
      v7 = 0;
    }
  }
  else
  {
    v7 = 0;
  }
  v8 = v7;

  BOOL v9 = v8 && self->_contextID == v8[2] && self->_clientPort == v8[3];
  return v9;
}

- (BKCAContextDestination)initWithContextID:(unsigned int)a3 clientPort:(unsigned int)a4
{
  if (!a3)
  {
    BOOL v9 = +[NSString stringWithFormat:@"Invalid condition not satisfying: %@", *(void *)&a4, @"contextID != 0"];
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      v10 = NSStringFromSelector(a2);
      v11 = (objc_class *)objc_opt_class();
      v12 = NSStringFromClass(v11);
      *(_DWORD *)buf = 138544642;
      v19 = v10;
      __int16 v20 = 2114;
      v21 = v12;
      __int16 v22 = 2048;
      v23 = self;
      __int16 v24 = 2114;
      CFStringRef v25 = @"BKCAContextDestination.m";
      __int16 v26 = 1024;
      int v27 = 19;
      __int16 v28 = 2114;
      v29 = v9;
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v9 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x10000A5A0);
  }
  if (a4 + 1 <= 1)
  {
    v13 = +[NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"(((clientPort) != 0) && ((clientPort) != ((mach_port_name_t) ~0)))"];
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      v14 = NSStringFromSelector(a2);
      v15 = (objc_class *)objc_opt_class();
      v16 = NSStringFromClass(v15);
      *(_DWORD *)buf = 138544642;
      v19 = v14;
      __int16 v20 = 2114;
      v21 = v16;
      __int16 v22 = 2048;
      v23 = self;
      __int16 v24 = 2114;
      CFStringRef v25 = @"BKCAContextDestination.m";
      __int16 v26 = 1024;
      int v27 = 20;
      __int16 v28 = 2114;
      v29 = v13;
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v13 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x10000A698);
  }
  v17.receiver = self;
  v17.super_class = (Class)BKCAContextDestination;
  result = [(BKCAContextDestination *)&v17 init];
  if (result)
  {
    result->_contextID = a3;
    result->_clientPort = a4;
  }
  return result;
}

- (unint64_t)hash
{
  v2 = +[NSNumber numberWithUnsignedInt:self->_contextID];
  id v3 = [v2 hash];

  return (unint64_t)v3;
}

- (void).cxx_destruct
{
}

- (void)appendDescriptionToFormatter:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100045F20;
  v4[3] = &unk_1000F8E50;
  uint64_t v5 = self;
  id v6 = a3;
  id v3 = v6;
  [v3 appendProem:v5 block:v4];
}

- (void)appendSuccinctDescriptionToFormatter:(id)a3
{
  id v7 = a3;
  id v4 = [v7 appendUInt64:self->_contextID withName:@"contextID" format:1];
  id v5 = [v7 appendUInt64:self->_clientPort withName:@"clientPort" format:1];
  id v6 = [v7 appendObject:self->_inheritedSceneHostSettings withName:@"inheritedSceneHostSettings" skipIfNil:1];
}

- (id)succinctDescription
{
  id v3 = objc_alloc_init((Class)BSDescriptionStream);
  [(BKCAContextDestination *)self appendSuccinctDescriptionToFormatter:v3];
  id v4 = [v3 description];

  return v4;
}

- (NSString)description
{
  return (NSString *)+[BSDescriptionStream descriptionForRootObject:self];
}

@end
@interface UACornerActionManagerHandler
- (BOOL)active;
- (BOOL)resume;
- (BOOL)suspend;
- (BOOL)suspended;
- (BOOL)terminate;
- (BOOL)terminated;
- (NSString)name;
- (NSUUID)uuid;
- (UACornerActionManager)manager;
- (UACornerActionManagerHandler)initWithManager:(id)a3 name:(id)a4;
- (id)statusString;
- (int64_t)priority;
- (void)setName:(id)a3;
- (void)setSuspended:(BOOL)a3;
@end

@implementation UACornerActionManagerHandler

- (int64_t)priority
{
  return self->_priority;
}

- (BOOL)suspended
{
  v2 = self;
  objc_sync_enter(v2);
  BOOL suspended = v2->_suspended;
  objc_sync_exit(v2);

  return suspended;
}

- (UACornerActionManagerHandler)initWithManager:(id)a3 name:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)UACornerActionManagerHandler;
  v9 = [(UACornerActionManagerHandler *)&v13 init];
  if (v9)
  {
    uint64_t v10 = +[NSUUID UUID];
    uuid = v9->_uuid;
    v9->_uuid = (NSUUID *)v10;

    objc_storeStrong((id *)&v9->_manager, a3);
    objc_storeStrong((id *)&v9->_name, a4);
    v9->_BOOL suspended = 1;
  }

  return v9;
}

- (UACornerActionManager)manager
{
  return (UACornerActionManager *)objc_getProperty(self, a2, 24, 1);
}

- (BOOL)active
{
  return 1;
}

- (void)setSuspended:(BOOL)a3
{
  BOOL v3 = a3;
  v4 = self;
  objc_sync_enter(v4);
  if (v4->_suspended != v3)
  {
    v5 = sub_10000BA18(0);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v6 = [(UACornerActionManagerHandler *)v4 name];
      id v7 = (void *)v6;
      id v8 = "resumed";
      if (v3) {
        id v8 = "suspended";
      }
      int v9 = 138543618;
      uint64_t v10 = v6;
      __int16 v11 = 2082;
      v12 = v8;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "HANDLER: %{public}@ is being %{public}s", (uint8_t *)&v9, 0x16u);
    }
    if (v3) {
      [(UACornerActionManagerHandler *)v4 suspend];
    }
    else {
      [(UACornerActionManagerHandler *)v4 resume];
    }
  }
  objc_sync_exit(v4);
}

- (BOOL)suspend
{
  v2 = self;
  objc_sync_enter(v2);
  BOOL suspended = v2->_suspended;
  if (!v2->_suspended)
  {
    v4 = sub_10000BA18(0);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      v5 = [(UACornerActionManagerHandler *)v2 name];
      int v7 = 138543362;
      id v8 = v5;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "HANDLER: %{public}@ is being suspended(was not)", (uint8_t *)&v7, 0xCu);
    }
    v2->_BOOL suspended = 1;
  }
  objc_sync_exit(v2);

  return !suspended;
}

- (BOOL)resume
{
  v2 = self;
  objc_sync_enter(v2);
  BOOL suspended = v2->_suspended;
  if (v2->_suspended)
  {
    v4 = sub_10000BA18(0);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      v5 = [(UACornerActionManagerHandler *)v2 name];
      int v7 = 138543362;
      id v8 = v5;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "HANDLER: %{public}@ is being resumed(was suspended)", (uint8_t *)&v7, 0xCu);
    }
    v2->_BOOL suspended = 0;
  }
  objc_sync_exit(v2);

  return suspended;
}

- (BOOL)terminate
{
  BOOL v3 = sub_10000BA18(0);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    v4 = [(UACornerActionManagerHandler *)self name];
    unsigned int v5 = [(UACornerActionManagerHandler *)self terminated];
    CFStringRef v6 = &stru_1000C6800;
    if (v5) {
      CFStringRef v6 = @"(was already terminated)";
    }
    int v9 = 138543618;
    uint64_t v10 = v4;
    __int16 v11 = 2114;
    CFStringRef v12 = v6;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "HANDLER: %{public}@ is being terminated %{public}@", (uint8_t *)&v9, 0x16u);
  }
  unsigned __int8 v7 = [(UACornerActionManagerHandler *)self terminated];
  if ((v7 & 1) == 0)
  {
    if (![(UACornerActionManagerHandler *)self suspended]) {
      [(UACornerActionManagerHandler *)self suspend];
    }
    self->_terminated = 1;
  }
  return v7 ^ 1;
}

- (id)statusString
{
  BOOL v3 = [(UACornerActionManagerHandler *)self name];
  if (v3) {
    [(UACornerActionManagerHandler *)self name];
  }
  else {
  v4 = +[NSString stringWithCString:object_getClassName(self) encoding:4];
  }
  unsigned int v5 = +[NSString stringWithFormat:@"%@: %@\n", v4, self];

  return v5;
}

- (NSUUID)uuid
{
  return (NSUUID *)objc_getProperty(self, a2, 16, 1);
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setName:(id)a3
{
}

- (BOOL)terminated
{
  return self->_terminated;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_manager, 0);

  objc_storeStrong((id *)&self->_uuid, 0);
}

@end
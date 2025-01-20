@interface WAMessageSubmitter
- (WAMessageSubmitter)initWithMessageGroupType:(int64_t)a3;
- (id)submitMessage:(id)a3;
- (int64_t)groupTypeForThisSubmitter;
- (void)setGroupTypeForThisSubmitter:(int64_t)a3;
@end

@implementation WAMessageSubmitter

- (WAMessageSubmitter)initWithMessageGroupType:(int64_t)a3
{
  v8.receiver = self;
  v8.super_class = (Class)WAMessageSubmitter;
  v4 = [(WAMessageSubmitter *)&v8 init];
  if (!v4)
  {
    v6 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v10 = "-[WAMessageSubmitter initWithMessageGroupType:]";
      __int16 v11 = 1024;
      int v12 = 26;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "%{public}s::%d:failed in super-init", buf, 0x12u);
    }

    v7 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      v10 = "-[WAMessageSubmitter initWithMessageGroupType:]";
      __int16 v11 = 1024;
      int v12 = 32;
      __int16 v13 = 2048;
      int64_t v14 = a3;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "%{public}s::%d:Error configuring groupType: %ld", buf, 0x1Cu);
    }
  }
  return v4;
}

- (id)submitMessage:(id)a3
{
  v3 = NSStringFromSelector(a2);
  +[NSException raise:NSInternalInconsistencyException, @"Never use %@ for WAMessage.", v3 format];

  return 0;
}

- (int64_t)groupTypeForThisSubmitter
{
  return self->_groupTypeForThisSubmitter;
}

- (void)setGroupTypeForThisSubmitter:(int64_t)a3
{
  self->_groupTypeForThisSubmitter = a3;
}

@end
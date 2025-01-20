@interface DownloadPolicy
+ (Class)databaseEntityClass;
+ (id)defaultProperties;
- (NSData)policyData;
- (SSDownloadPolicy)downloadPolicy;
- (id)copyWithZone:(_NSZone *)a3;
- (void)dealloc;
- (void)setPolicyData:(id)a3;
@end

@implementation DownloadPolicy

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)DownloadPolicy;
  [(DownloadPolicy *)&v3 dealloc];
}

- (SSDownloadPolicy)downloadPolicy
{
  result = self->_cachedPolicy;
  if (!result)
  {
    result = [(DownloadPolicy *)self policyData];
    if (result)
    {
      uint64_t v11 = 0;
      self->_cachedPolicy = (SSDownloadPolicy *)+[NSKeyedUnarchiver unarchivedObjectOfClass:objc_opt_class() fromData:result error:&v11];
      if (v11)
      {
        id v4 = +[SSLogConfig sharedStoreServicesConfig];
        if (!v4) {
          id v4 = +[SSLogConfig sharedConfig];
        }
        unsigned int v5 = [v4 shouldLog];
        if ([v4 shouldLogToDisk]) {
          int v6 = v5 | 2;
        }
        else {
          int v6 = v5;
        }
        if (!os_log_type_enabled((os_log_t)[v4 OSLogObject], OS_LOG_TYPE_ERROR)) {
          v6 &= 2u;
        }
        if (v6)
        {
          uint64_t v7 = objc_opt_class();
          int v12 = 138543618;
          uint64_t v13 = v7;
          __int16 v14 = 2114;
          uint64_t v15 = v11;
          LODWORD(v10) = 22;
          uint64_t v8 = _os_log_send_and_compose_impl();
          if (v8)
          {
            v9 = (void *)v8;
            +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v8, 4, &v12, v10);
            free(v9);
            SSFileLog();
          }
        }
      }
      return self->_cachedPolicy;
    }
    else
    {
      self->_cachedPolicy = 0;
    }
  }
  return result;
}

- (NSData)policyData
{
  return (NSData *)[(DownloadPolicy *)self valueForProperty:@"policy_data"];
}

- (void)setPolicyData:(id)a3
{
  self->_cachedPolicy = 0;
}

+ (Class)databaseEntityClass
{
  return (Class)objc_opt_class();
}

+ (id)defaultProperties
{
  return +[NSArray arrayWithObjects:@"policy_data", 0];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4.receiver = self;
  v4.super_class = (Class)DownloadPolicy;
  return [(DownloadPolicy *)&v4 copyWithZone:a3];
}

@end
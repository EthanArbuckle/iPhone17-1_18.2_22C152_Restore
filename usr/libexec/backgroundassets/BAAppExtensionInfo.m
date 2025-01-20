@interface BAAppExtensionInfo
+ (BOOL)supportsSecureCoding;
- (BAAppExtensionInfo)init;
- (BAAppExtensionInfo)initWithApplicationInfo:(id)a3;
- (BAAppExtensionInfo)initWithCoder:(id)a3;
- (NSNumber)restrictedDownloadSizeRemaining;
- (NSNumber)restrictedEssentialDownloadSizeRemaining;
- (void)encodeWithCoder:(id)a3;
- (void)setRestrictedDownloadSizeRemaining:(id)a3;
- (void)setRestrictedEssentialDownloadSizeRemaining:(id)a3;
@end

@implementation BAAppExtensionInfo

- (BAAppExtensionInfo)initWithApplicationInfo:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BAAppExtensionInfo;
  v5 = [(BAAppExtensionInfo *)&v9 init];
  if (v5)
  {
    if ([v4 hasLaunchedApplication])
    {
      [(BAAppExtensionInfo *)v5 setRestrictedDownloadSizeRemaining:0];
      [(BAAppExtensionInfo *)v5 setRestrictedEssentialDownloadSizeRemaining:0];
    }
    else
    {
      v6 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v4 remainingDownloadAllowanceWithNecessity:0]);
      [(BAAppExtensionInfo *)v5 setRestrictedDownloadSizeRemaining:v6];

      v7 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v4 remainingDownloadAllowanceWithNecessity:1]);
      [(BAAppExtensionInfo *)v5 setRestrictedEssentialDownloadSizeRemaining:v7];
    }
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BAAppExtensionInfo)init
{
  result = (BAAppExtensionInfo *)os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT);
  if (result)
  {
    int v3 = 136315138;
    id v4 = "BAAppExtensionInfo cannot be constructed using -init.";
    _os_log_fault_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT, "BUG IN CLIENT OF BackgroundAssets: %s", (uint8_t *)&v3, 0xCu);
  }
  qword_1000694C8 = (uint64_t)"BUG IN CLIENT OF BackgroundAssets: BAAppExtensionInfo cannot be constructed using -init.";
  __break(1u);
  return result;
}

- (BAAppExtensionInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)BAAppExtensionInfo;
  v5 = [(BAAppExtensionInfo *)&v13 init];
  if (v5)
  {
    if ([v4 containsValueForKey:@"restrictedDownloadSizeRemaining"])
    {
      v6 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", objc_opt_class(), 0);
      uint64_t v7 = [v4 decodeObjectOfClasses:v6 forKey:@"restrictedDownloadSizeRemaining"];
      restrictedDownloadSizeRemaining = v5->_restrictedDownloadSizeRemaining;
      v5->_restrictedDownloadSizeRemaining = (NSNumber *)v7;
    }
    if ([v4 containsValueForKey:@"restrictedEssentialDownloadSizeRemaining"])
    {
      objc_super v9 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", objc_opt_class(), 0);
      uint64_t v10 = [v4 decodeObjectOfClasses:v9 forKey:@"restrictedEssentialDownloadSizeRemaining"];
      restrictedEssentialDownloadSizeRemaining = v5->_restrictedEssentialDownloadSizeRemaining;
      v5->_restrictedEssentialDownloadSizeRemaining = (NSNumber *)v10;
    }
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v8 = a3;
  id v4 = [(BAAppExtensionInfo *)self restrictedDownloadSizeRemaining];

  if (v4)
  {
    v5 = [(BAAppExtensionInfo *)self restrictedDownloadSizeRemaining];
    [v8 encodeObject:v5 forKey:@"restrictedDownloadSizeRemaining"];
  }
  v6 = [(BAAppExtensionInfo *)self restrictedEssentialDownloadSizeRemaining];

  if (v6)
  {
    uint64_t v7 = [(BAAppExtensionInfo *)self restrictedEssentialDownloadSizeRemaining];
    [v8 encodeObject:v7 forKey:@"restrictedEssentialDownloadSizeRemaining"];
  }
}

- (NSNumber)restrictedDownloadSizeRemaining
{
  return (NSNumber *)objc_getProperty(self, a2, 8, 1);
}

- (void)setRestrictedDownloadSizeRemaining:(id)a3
{
}

- (NSNumber)restrictedEssentialDownloadSizeRemaining
{
  return (NSNumber *)objc_getProperty(self, a2, 16, 1);
}

- (void)setRestrictedEssentialDownloadSizeRemaining:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_restrictedEssentialDownloadSizeRemaining, 0);

  objc_storeStrong((id *)&self->_restrictedDownloadSizeRemaining, 0);
}

@end
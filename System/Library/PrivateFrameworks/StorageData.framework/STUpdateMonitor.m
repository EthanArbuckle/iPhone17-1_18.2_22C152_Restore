@interface STUpdateMonitor
+ (id)sharedMonitor;
- (NSString)bundleIdentifier;
- (NSString)currentUpdateName;
- (int64_t)currentUpdateSize;
@end

@implementation STUpdateMonitor

+ (id)sharedMonitor
{
  if (sharedMonitor_onceToken != -1) {
    dispatch_once(&sharedMonitor_onceToken, &__block_literal_global_6);
  }
  return 0;
}

- (int64_t)currentUpdateSize
{
  return self->_currentUpdateSize;
}

- (NSString)currentUpdateName
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (NSString)bundleIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);

  objc_storeStrong((id *)&self->_currentUpdateName, 0);
}

@end
@interface NUANFDebugSettingsProvider
- (BOOL)testingConditionEnabled;
- (BOOL)viewportDebuggingEnabled;
@end

@implementation NUANFDebugSettingsProvider

- (BOOL)viewportDebuggingEnabled
{
  return self->_viewportDebuggingEnabled;
}

- (BOOL)testingConditionEnabled
{
  return self->_testingConditionEnabled;
}

@end
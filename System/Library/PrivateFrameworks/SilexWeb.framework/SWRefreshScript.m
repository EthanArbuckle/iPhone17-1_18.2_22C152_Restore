@interface SWRefreshScript
- (BOOL)queueable;
- (NSString)executableScript;
- (NSString)identifier;
- (WKUserScript)userScript;
@end

@implementation SWRefreshScript

- (NSString)identifier
{
  return (NSString *)@"refresh";
}

- (BOOL)queueable
{
  return 0;
}

- (NSString)executableScript
{
  return (NSString *)@"var event = new Event('ANRefresh'); document.dispatchEvent(event);";
}

- (WKUserScript)userScript
{
  return self->userScript;
}

- (void).cxx_destruct
{
}

@end
@interface SWSetupScript
- (BOOL)queueable;
- (NSString)executableScript;
- (NSString)identifier;
- (WKUserScript)userScript;
@end

@implementation SWSetupScript

- (NSString)identifier
{
  return (NSString *)@"setup";
}

- (WKUserScript)userScript
{
  v2 = objc_msgSend(objc_alloc(MEMORY[0x263F1FA40]), "initWithSource:injectionTime:forMainFrameOnly:", @"var applenews = {};",
                 0,
                 1);
  return (WKUserScript *)v2;
}

- (NSString)executableScript
{
  return self->executableScript;
}

- (BOOL)queueable
{
  return self->queueable;
}

- (void).cxx_destruct
{
}

@end
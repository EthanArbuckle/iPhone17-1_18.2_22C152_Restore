@interface SWConfigurationScript
- (BOOL)queueable;
- (NSString)configuration;
- (NSString)executableScript;
- (NSString)identifier;
- (SWConfigurationScript)initWithConfiguration:(id)a3;
- (WKUserScript)userScript;
@end

@implementation SWConfigurationScript

- (SWConfigurationScript)initWithConfiguration:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v10.receiver = self;
    v10.super_class = (Class)SWConfigurationScript;
    v5 = [(SWConfigurationScript *)&v10 init];
    if (v5)
    {
      uint64_t v6 = [v4 copy];
      configuration = v5->_configuration;
      v5->_configuration = (NSString *)v6;
    }
    self = v5;
    v8 = self;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (NSString)identifier
{
  return (NSString *)@"configuration";
}

- (BOOL)queueable
{
  return 0;
}

- (WKUserScript)userScript
{
  if ([(NSString *)self->_configuration length])
  {
    v3 = [NSString stringWithFormat:@"applenews.configuration = %@", self->_configuration];
    id v4 = (void *)[objc_alloc(MEMORY[0x263F1FA40]) initWithSource:v3 injectionTime:0 forMainFrameOnly:1];
  }
  else
  {
    id v4 = 0;
  }
  return (WKUserScript *)v4;
}

- (NSString)executableScript
{
  v3 = [(NSString *)self->_configuration length];
  if (v3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"                            var oldConfiguration = applenews.configuration;                             applenews.configuration = %@;                             var detail = {newConfiguration: applenews.configuration, oldConfiguration: oldConfiguration};                             var event = new CustomEvent('ANConfigurationChanged', {detail: detail});                             document.dispatchEvent(event);",
    v3 = self->_configuration);
  }
  return (NSString *)v3;
}

- (NSString)configuration
{
  return self->_configuration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->userScript, 0);
}

@end
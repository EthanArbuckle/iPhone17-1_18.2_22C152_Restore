@interface FMDCommandHandlerAccessoryConfiguration
- (FMDCommandHandlerAccessoryConfiguration)initWithParams:(id)a3 supportedAccessoryRegistry:(id)a4;
- (FMDSupportedAccessoryRegistry)supportedAccessoryRegistry;
- (void)handleCommand;
- (void)setSupportedAccessoryRegistry:(id)a3;
@end

@implementation FMDCommandHandlerAccessoryConfiguration

- (FMDCommandHandlerAccessoryConfiguration)initWithParams:(id)a3 supportedAccessoryRegistry:(id)a4
{
  id v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)FMDCommandHandlerAccessoryConfiguration;
  v7 = [(FMDCommandHandler *)&v10 initWithParams:a3 provider:0];
  v8 = v7;
  if (v7) {
    [(FMDCommandHandlerAccessoryConfiguration *)v7 setSupportedAccessoryRegistry:v6];
  }

  return v8;
}

- (void)handleCommand
{
  v3 = [(FMDCommandHandler *)self commandParams];
  id v5 = [v3 objectForKeyedSubscript:@"supportedAccessories"];

  v4 = [(FMDCommandHandlerAccessoryConfiguration *)self supportedAccessoryRegistry];
  [v4 updateSupportedAccessories:v5 completion:0];
}

- (FMDSupportedAccessoryRegistry)supportedAccessoryRegistry
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_supportedAccessoryRegistry);

  return (FMDSupportedAccessoryRegistry *)WeakRetained;
}

- (void)setSupportedAccessoryRegistry:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
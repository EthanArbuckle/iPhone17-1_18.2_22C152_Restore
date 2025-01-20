@interface SASBoardServicesConfiguration
+ (id)configuration;
+ (id)new;
- (NSString)machServiceIdentifier;
- (NSString)presentationDomain;
- (NSString)presentationIdentifier;
- (NSString)signalDomain;
- (NSString)signalIdentifier;
- (SASBoardServicesConfiguration)init;
- (id)_init;
- (id)domainForService:(int64_t)a3;
- (id)identifierForService:(int64_t)a3;
- (void)setMachServiceIdentifier:(id)a3;
- (void)setPresentationDomain:(id)a3;
- (void)setPresentationIdentifier:(id)a3;
- (void)setSignalDomain:(id)a3;
- (void)setSignalIdentifier:(id)a3;
@end

@implementation SASBoardServicesConfiguration

+ (id)configuration
{
  if (configuration_onceToken != -1) {
    dispatch_once(&configuration_onceToken, &__block_literal_global_6);
  }
  v2 = (void *)configuration_sharedConfiguration;
  return v2;
}

- (NSString)machServiceIdentifier
{
  return self->_machServiceIdentifier;
}

- (id)identifierForService:(int64_t)a3
{
  if (a3 == 1)
  {
    v3 = [(SASBoardServicesConfiguration *)self signalIdentifier];
  }
  else
  {
    if (a3) {
      goto LABEL_6;
    }
    v3 = [(SASBoardServicesConfiguration *)self presentationIdentifier];
  }
  a2 = v3;
LABEL_6:
  return (id)(id)a2;
}

- (NSString)signalIdentifier
{
  return self->_signalIdentifier;
}

uint64_t __46__SASBoardServicesConfiguration_configuration__block_invoke()
{
  configuration_sharedConfiguration = [[SASBoardServicesConfiguration alloc] _init];
  return MEMORY[0x1F41817F8]();
}

- (id)_init
{
  v5.receiver = self;
  v5.super_class = (Class)SASBoardServicesConfiguration;
  v2 = [(SASBoardServicesConfiguration *)&v5 init];
  v3 = v2;
  if (v2)
  {
    [(SASBoardServicesConfiguration *)v2 setMachServiceIdentifier:@"com.apple.siri.activation.service"];
    [(SASBoardServicesConfiguration *)v3 setPresentationDomain:@"com.apple.siri.activation"];
    [(SASBoardServicesConfiguration *)v3 setPresentationIdentifier:@"com.apple.siri.activation.presentation"];
    [(SASBoardServicesConfiguration *)v3 setSignalDomain:@"com.apple.siri.activation"];
    [(SASBoardServicesConfiguration *)v3 setSignalIdentifier:@"com.apple.siri.activation.signal"];
  }
  return v3;
}

- (void)setSignalIdentifier:(id)a3
{
}

- (void)setSignalDomain:(id)a3
{
}

- (void)setPresentationIdentifier:(id)a3
{
}

- (void)setPresentationDomain:(id)a3
{
}

- (void)setMachServiceIdentifier:(id)a3
{
}

- (SASBoardServicesConfiguration)init
{
  return 0;
}

+ (id)new
{
  return 0;
}

- (id)domainForService:(int64_t)a3
{
  if (a3 == 1)
  {
    v3 = [(SASBoardServicesConfiguration *)self signalDomain];
  }
  else
  {
    if (a3) {
      goto LABEL_6;
    }
    v3 = [(SASBoardServicesConfiguration *)self presentationDomain];
  }
  a2 = v3;
LABEL_6:
  return (id)(id)a2;
}

- (NSString)presentationDomain
{
  return self->_presentationDomain;
}

- (NSString)presentationIdentifier
{
  return self->_presentationIdentifier;
}

- (NSString)signalDomain
{
  return self->_signalDomain;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_signalIdentifier, 0);
  objc_storeStrong((id *)&self->_signalDomain, 0);
  objc_storeStrong((id *)&self->_presentationIdentifier, 0);
  objc_storeStrong((id *)&self->_presentationDomain, 0);
  objc_storeStrong((id *)&self->_machServiceIdentifier, 0);
}

@end
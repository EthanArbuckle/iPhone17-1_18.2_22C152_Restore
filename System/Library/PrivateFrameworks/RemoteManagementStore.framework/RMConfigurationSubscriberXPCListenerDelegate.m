@interface RMConfigurationSubscriberXPCListenerDelegate
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (Class)publisherClass;
- (NSArray)applicatorClasses;
- (RMConfigurationSubscriberXPCListenerDelegate)initWithApplicators:(id)a3 publisherClass:(Class)a4;
@end

@implementation RMConfigurationSubscriberXPCListenerDelegate

- (RMConfigurationSubscriberXPCListenerDelegate)initWithApplicators:(id)a3 publisherClass:(Class)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)RMConfigurationSubscriberXPCListenerDelegate;
  v8 = [(RMConfigurationSubscriberXPCListenerDelegate *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_applicatorClasses, a3);
    objc_storeStrong((id *)&v9->_publisherClass, a4);
  }

  return v9;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a4;
  v6 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_2708CE440];
  [v5 setExportedInterface:v6];

  id v7 = +[RMConfigurationSubscriberService newConfigurationSubscriberServiceWithXPCConnection:v5];
  v8 = [(RMConfigurationSubscriberXPCListenerDelegate *)self applicatorClasses];

  if (v8)
  {
    v9 = [(RMConfigurationSubscriberXPCListenerDelegate *)self applicatorClasses];
    v10 = +[RMConfigurationSubscriberDelegate sharedDelegateWithApplicators:v9];
    [v7 setSubscriberDelegate:v10];
  }
  if ([(RMConfigurationSubscriberXPCListenerDelegate *)self publisherClass])
  {
    objc_super v11 = +[RMStatusPublisherDelegate sharedDelegateWithPublisherClass:[(RMConfigurationSubscriberXPCListenerDelegate *)self publisherClass]];
    [v7 setPublisherDelegate:v11];
  }
  [v5 setExportedObject:v7];
  [v5 resume];

  return 1;
}

- (NSArray)applicatorClasses
{
  return self->_applicatorClasses;
}

- (Class)publisherClass
{
  return self->_publisherClass;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_publisherClass, 0);
  objc_storeStrong((id *)&self->_applicatorClasses, 0);
}

@end
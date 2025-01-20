@interface _STKRemoteAlertDescriptor
- (BOOL)isValid;
- (BSAction)BSAction;
- (NSString)serviceIdentifier;
- (NSString)viewControllerName;
- (STKSessionAction)action;
- (_STKRemoteAlertDescriptor)initWithAction:(id)a3 viewControllerName:(id)a4;
- (id)debugDescription;
- (id)description;
@end

@implementation _STKRemoteAlertDescriptor

- (_STKRemoteAlertDescriptor)initWithAction:(id)a3 viewControllerName:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)_STKRemoteAlertDescriptor;
  v9 = [(_STKRemoteAlertDescriptor *)&v15 init];
  v10 = v9;
  if (v8 && v9)
  {
    serviceIdentifier = v9->_serviceIdentifier;
    v9->_serviceIdentifier = (NSString *)@"com.apple.CTNotifyUIService";

    objc_storeStrong((id *)&v10->_viewControllerName, a4);
    objc_storeStrong((id *)&v10->_action, a3);
    uint64_t v12 = [v7 _BSAction];
    BSAction = v10->_BSAction;
    v10->_BSAction = (BSAction *)v12;
  }
  return v10;
}

- (BOOL)isValid
{
  return self->_serviceIdentifier && self->_viewControllerName != 0;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<_STKRemoteAlertDescriptor:%p - service: %@, vc: %@, action: <BSAction:%p>", self, self->_serviceIdentifier, self->_viewControllerName, self->_BSAction];
}

- (id)debugDescription
{
  return (id)[NSString stringWithFormat:@"<_STKRemoteAlertDescriptor:%p - service: %@, vc: %@, action: %@", self, self->_serviceIdentifier, self->_viewControllerName, self->_BSAction];
}

- (NSString)serviceIdentifier
{
  return self->_serviceIdentifier;
}

- (NSString)viewControllerName
{
  return self->_viewControllerName;
}

- (STKSessionAction)action
{
  return self->_action;
}

- (BSAction)BSAction
{
  return self->_BSAction;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_BSAction, 0);
  objc_storeStrong((id *)&self->_action, 0);
  objc_storeStrong((id *)&self->_viewControllerName, 0);

  objc_storeStrong((id *)&self->_serviceIdentifier, 0);
}

@end
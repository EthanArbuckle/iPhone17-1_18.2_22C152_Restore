@interface STKSessionBehavior
- (BOOL)dismissesAfterUserEvent;
- (BOOL)shouldSendResponseUponDisplay;
- (STKSessionBehavior)initWithXPCDictionary:(id)a3;
- (double)timeout;
- (void)encodeWithXPCDictionary:(id)a3;
@end

@implementation STKSessionBehavior

- (void)encodeWithXPCDictionary:(id)a3
{
  double timeout = self->_timeout;
  xpc_object_t xdict = a3;
  xpc_dictionary_set_double(xdict, "_timeout", timeout);
  xpc_dictionary_set_BOOL(xdict, "_shouldSendResponseUponDisplay", self->_shouldSendResponseUponDisplay);
  xpc_dictionary_set_BOOL(xdict, "_dismissesAfterUserEvent", self->_dismissesAfterUserEvent);
}

- (STKSessionBehavior)initWithXPCDictionary:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)STKSessionBehavior;
  v5 = [(STKSessionBehavior *)&v7 init];
  if (v5)
  {
    v5->_double timeout = xpc_dictionary_get_double(v4, "_timeout");
    v5->_shouldSendResponseUponDisplay = xpc_dictionary_get_BOOL(v4, "_shouldSendResponseUponDisplay");
    v5->_dismissesAfterUserEvent = xpc_dictionary_get_BOOL(v4, "_dismissesAfterUserEvent");
  }

  return v5;
}

- (double)timeout
{
  return self->_timeout;
}

- (BOOL)shouldSendResponseUponDisplay
{
  return self->_shouldSendResponseUponDisplay;
}

- (BOOL)dismissesAfterUserEvent
{
  return self->_dismissesAfterUserEvent;
}

@end
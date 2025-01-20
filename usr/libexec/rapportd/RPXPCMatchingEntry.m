@interface RPXPCMatchingEntry
- (BOOL)appSignIn;
- (BOOL)state;
- (NSDictionary)event;
- (NSString)angelAssertionName;
- (NSString)angelJobLabel;
- (NSString)serviceType;
- (RPServer)server;
- (id)handler;
- (unint64_t)token;
- (void)setAngelAssertionName:(id)a3;
- (void)setAngelJobLabel:(id)a3;
- (void)setAppSignIn:(BOOL)a3;
- (void)setEvent:(id)a3;
- (void)setHandler:(id)a3;
- (void)setServer:(id)a3;
- (void)setServiceType:(id)a3;
- (void)setState:(BOOL)a3;
- (void)setToken:(unint64_t)a3;
@end

@implementation RPXPCMatchingEntry

- (BOOL)appSignIn
{
  return self->_appSignIn;
}

- (void)setAppSignIn:(BOOL)a3
{
  self->_appSignIn = a3;
}

- (NSDictionary)event
{
  return self->_event;
}

- (void)setEvent:(id)a3
{
}

- (id)handler
{
  return self->_handler;
}

- (void)setHandler:(id)a3
{
}

- (RPServer)server
{
  return self->_server;
}

- (void)setServer:(id)a3
{
}

- (BOOL)state
{
  return self->_state;
}

- (void)setState:(BOOL)a3
{
  self->_state = a3;
}

- (unint64_t)token
{
  return self->_token;
}

- (void)setToken:(unint64_t)a3
{
  self->_token = a3;
}

- (NSString)serviceType
{
  return self->_serviceType;
}

- (void)setServiceType:(id)a3
{
  self->_serviceType = (NSString *)a3;
}

- (NSString)angelJobLabel
{
  return self->_angelJobLabel;
}

- (void)setAngelJobLabel:(id)a3
{
  self->_angelJobLabel = (NSString *)a3;
}

- (NSString)angelAssertionName
{
  return self->_angelAssertionName;
}

- (void)setAngelAssertionName:(id)a3
{
  self->_angelAssertionName = (NSString *)a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_server, 0);
  objc_storeStrong(&self->_handler, 0);

  objc_storeStrong((id *)&self->_event, 0);
}

@end
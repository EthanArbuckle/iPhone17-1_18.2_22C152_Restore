@interface TCCDEvent
- (NSString)subjectIdentifier;
- (OS_xpc_object)xpcObject;
- (TCCDEvent)initWithEventType:(unint64_t)a3 accessRecord:(id)a4;
- (TCCDEvent)initWithEventType:(unint64_t)a3 service:(id)a4 subjectIdentifierType:(unint64_t)a5 subjectIdentifier:(id)a6 authValue:(unint64_t)a7;
- (TCCDService)service;
- (id)description;
- (unint64_t)authValue;
- (unint64_t)eventType;
- (unint64_t)subjectIdentifierType;
@end

@implementation TCCDEvent

- (TCCDEvent)initWithEventType:(unint64_t)a3 service:(id)a4 subjectIdentifierType:(unint64_t)a5 subjectIdentifier:(id)a6 authValue:(unint64_t)a7
{
  id v13 = a4;
  id v14 = a6;
  v20.receiver = self;
  v20.super_class = (Class)TCCDEvent;
  v15 = [(TCCDEvent *)&v20 init];
  v16 = v15;
  if (v15)
  {
    v15->_eventType = a3;
    objc_storeStrong((id *)&v15->_service, a4);
    v16->_subjectIdentifierType = a5;
    v17 = (NSString *)[v14 copy];
    subjectIdentifier = v16->_subjectIdentifier;
    v16->_subjectIdentifier = v17;

    v16->_authValue = a7;
  }

  return v16;
}

- (TCCDEvent)initWithEventType:(unint64_t)a3 accessRecord:(id)a4
{
  id v6 = a4;
  v7 = [v6 subjectIdentity];
  v8 = [v6 accessObject];
  v9 = [v8 serviceObject];
  uint64_t v10 = (int)[v7 identifierAuthority];
  v11 = [v7 identifier];
  id v12 = [v6 authorizationValue];

  id v13 = [(TCCDEvent *)self initWithEventType:a3 service:v9 subjectIdentifierType:v10 subjectIdentifier:v11 authValue:v12];
  return v13;
}

- (OS_xpc_object)xpcObject
{
  xpc_object_t v3 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v3, "event_type", self->_eventType);
  id v4 = [(TCCDService *)self->_service name];
  xpc_dictionary_set_string(v3, "service", (const char *)[v4 UTF8String]);

  xpc_dictionary_set_uint64(v3, "TCCD_MSG_IDENTITY_TYPE_KEY", self->_subjectIdentifierType);
  xpc_dictionary_set_string(v3, "TCCD_MSG_IDENTITY_ID_KEY", [(NSString *)self->_subjectIdentifier UTF8String]);
  xpc_dictionary_set_uint64(v3, "auth_value", self->_authValue);
  return (OS_xpc_object *)v3;
}

- (id)description
{
  uint64_t v3 = objc_opt_class();
  unint64_t v4 = self->_eventType - 1;
  if (v4 > 2) {
    v5 = "Unknown";
  }
  else {
    v5 = off_1000960D0[v4];
  }
  uint64_t v6 = [(TCCDService *)self->_service name];
  v7 = (void *)v6;
  unint64_t v8 = self->_subjectIdentifierType - 1;
  if (v8 > 2) {
    v9 = "Bundle ID";
  }
  else {
    v9 = off_1000960E8[v8];
  }
  uint64_t v10 = +[NSString stringWithFormat:@"<%@: type=%s, service=%@, identifier_type=%s, identifier=%@>", v3, v5, v6, v9, self->_subjectIdentifier];

  return v10;
}

- (unint64_t)eventType
{
  return self->_eventType;
}

- (TCCDService)service
{
  return self->_service;
}

- (unint64_t)subjectIdentifierType
{
  return self->_subjectIdentifierType;
}

- (NSString)subjectIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (unint64_t)authValue
{
  return self->_authValue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subjectIdentifier, 0);
  objc_storeStrong((id *)&self->_service, 0);
}

@end
@interface PALTCCAttributionResolver
- (PALTCCAttributionResolver)init;
- (id)resolveAttributionForTCCAccess:(id)a3 clientProvidedIdentity:(id)a4;
@end

@implementation PALTCCAttributionResolver

- (PALTCCAttributionResolver)init
{
  v6.receiver = self;
  v6.super_class = (Class)PALTCCAttributionResolver;
  v2 = [(PALTCCAttributionResolver *)&v6 init];
  if (v2)
  {
    os_log_t v3 = os_log_create("com.apple.PrivacyAccounting", "PALTCCAttributionResolver");
    logger = v2->_logger;
    v2->_logger = (OS_os_log *)v3;
  }
  return v2;
}

- (id)resolveAttributionForTCCAccess:(id)a3 clientProvidedIdentity:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [v6 accessor];
  id v9 = [v8 identifierType];

  if (v9 == (id)2)
  {
    v10 = [v6 accessor];
    v11 = v10;
    if (v10) {
      [v10 auditToken];
    }
    v13 = PAAuthenticatedClientIdentity();

    if (v13)
    {
      v14 = (void *)tcc_object_copy_description();
      if (os_log_type_enabled((os_log_t)self->_logger, OS_LOG_TYPE_DEBUG)) {
        sub_100006CD0();
      }
      id v15 = [objc_alloc((Class)PAApplication) initWithTCCIdentity:v13];
      if (v15)
      {
        id v12 = [v6 copyWithNewAccessor:v15];
      }
      else
      {
        if (os_log_type_enabled((os_log_t)self->_logger, OS_LOG_TYPE_ERROR)) {
          sub_100006C58();
        }
        id v12 = 0;
      }
    }
    else
    {
      id v12 = 0;
    }
  }
  else
  {
    id v12 = v6;
  }

  return v12;
}

- (void).cxx_destruct
{
}

@end
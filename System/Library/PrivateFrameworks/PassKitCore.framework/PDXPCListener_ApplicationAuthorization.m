@interface PDXPCListener_ApplicationAuthorization
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (PDXPCListener_ApplicationAuthorization)init;
@end

@implementation PDXPCListener_ApplicationAuthorization

- (PDXPCListener_ApplicationAuthorization)init
{
  return 0;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a4;
  int v6 = [v5 processIdentifier];
  v7 = [v5 valueForEntitlement:@"com.apple.wallet.application-authorization"];
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0) || ![v7 BOOLValue])
  {
    v11 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      int v13 = 134218240;
      id v14 = v5;
      __int16 v15 = 2048;
      uint64_t v16 = v6;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "PDApplicationAuthorizationHandle: rejecting connection %p - remote process %ld missing entitlement com.apple.wallet.application-authorization.", (uint8_t *)&v13, 0x16u);
    }

    goto LABEL_12;
  }
  v8 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    int v13 = 134218240;
    id v14 = v5;
    __int16 v15 = 2048;
    uint64_t v16 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "PDApplicationAuthorizationHandle: accepting connection %p for remote process %ld.", (uint8_t *)&v13, 0x16u);
  }

  server = self->_server;
  if (!server || sub_10001135C((uint64_t)server, v6) != 1)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 134217984;
      id v14 = v5;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "PDApplicationAuthorizationHandle: invalidating connection %p - passd not initialized.", (uint8_t *)&v13, 0xCu);
    }

LABEL_12:
    BOOL v10 = 0;
    goto LABEL_13;
  }
  sub_10034C21C((uint64_t)PDApplicationAuthorizationHandle, v5, self->_server);
  BOOL v10 = 1;
LABEL_13:

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_server, 0);
  objc_storeStrong((id *)&self->_listener, 0);
}

@end
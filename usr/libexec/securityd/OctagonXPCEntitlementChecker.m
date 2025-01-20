@interface OctagonXPCEntitlementChecker
+ (BOOL)conformsToProtocol:(id)a3;
+ (id)createWithManager:(id)a3 entitlementBearer:(id)a4;
- (OTManager)manager;
- (OctagonEntitlementBearerProtocol)entitlementBearer;
- (OctagonXPCEntitlementChecker)initWithManager:(id)a3 entitlementBearer:(id)a4;
- (id)methodSignatureForSelector:(SEL)a3;
- (void)failFetchAccountSettings:(id)a3 reply:(id)a4;
- (void)failFetchAccountWideSettingsWithForceFetch:(BOOL)a3 arguments:(id)a4 reply:(id)a5;
- (void)failFetchEscrowContents:(id)a3 reply:(id)a4;
- (void)failFetchTrustedSecureElementIdentities:(id)a3 reply:(id)a4;
- (void)failPersistAccountSettings:(id)a3 setting:(id)a4 reply:(id)a5;
- (void)failRemoveLocalSecureElementIdentityPeerID:(id)a3 secureElementIdentityPeerID:(id)a4 reply:(id)a5;
- (void)failSetAccountSetting:(id)a3 setting:(id)a4 reply:(id)a5;
- (void)failSetLocalSecureElementIdentity:(id)a3 secureElementIdentity:(id)a4 reply:(id)a5;
- (void)forwardInvocation:(id)a3;
- (void)setEntitlementBearer:(id)a3;
- (void)setManager:(id)a3;
@end

@implementation OctagonXPCEntitlementChecker

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entitlementBearer, 0);

  objc_storeStrong((id *)&self->_manager, 0);
}

- (void)setEntitlementBearer:(id)a3
{
}

- (OctagonEntitlementBearerProtocol)entitlementBearer
{
  return (OctagonEntitlementBearerProtocol *)objc_getProperty(self, a2, 16, 1);
}

- (void)setManager:(id)a3
{
}

- (OTManager)manager
{
  return (OTManager *)objc_getProperty(self, a2, 8, 1);
}

- (void)failPersistAccountSettings:(id)a3 setting:(id)a4 reply:(id)a5
{
  uint64_t v6 = kSecEntitlementPrivateOctagonWalrus;
  id v7 = a5;
  id v9 = +[NSString stringWithFormat:@"Missing entitlement '%@'", v6];
  v8 = +[NSError errorWithDomain:NSOSStatusErrorDomain code:-34018 description:v9];
  (*((void (**)(id, void *))a5 + 2))(v7, v8);
}

- (void)failFetchAccountWideSettingsWithForceFetch:(BOOL)a3 arguments:(id)a4 reply:(id)a5
{
  uint64_t v6 = kSecEntitlementPrivateOctagonWalrus;
  id v7 = a5;
  id v9 = +[NSString stringWithFormat:@"Missing entitlement '%@'", v6];
  v8 = +[NSError errorWithDomain:NSOSStatusErrorDomain code:-34018 description:v9];
  (*((void (**)(id, void, void *))a5 + 2))(v7, 0, v8);
}

- (void)failFetchAccountSettings:(id)a3 reply:(id)a4
{
  uint64_t v5 = kSecEntitlementPrivateOctagonWalrus;
  id v6 = a4;
  id v8 = +[NSString stringWithFormat:@"Missing entitlement '%@'", v5];
  id v7 = +[NSError errorWithDomain:NSOSStatusErrorDomain code:-34018 description:v8];
  (*((void (**)(id, void, void *))a4 + 2))(v6, 0, v7);
}

- (void)failSetAccountSetting:(id)a3 setting:(id)a4 reply:(id)a5
{
  uint64_t v6 = kSecEntitlementPrivateOctagonWalrus;
  id v7 = a5;
  id v9 = +[NSString stringWithFormat:@"Missing entitlement '%@'", v6];
  id v8 = +[NSError errorWithDomain:NSOSStatusErrorDomain code:-34018 description:v9];
  (*((void (**)(id, void *))a5 + 2))(v7, v8);
}

- (void)failFetchTrustedSecureElementIdentities:(id)a3 reply:(id)a4
{
  uint64_t v5 = kSecEntitlementPrivateOctagonSecureElement;
  id v6 = a4;
  id v8 = +[NSString stringWithFormat:@"Missing entitlement '%@'", v5];
  id v7 = +[NSError errorWithDomain:NSOSStatusErrorDomain code:-34018 description:v8];
  (*((void (**)(id, void, void *))a4 + 2))(v6, 0, v7);
}

- (void)failRemoveLocalSecureElementIdentityPeerID:(id)a3 secureElementIdentityPeerID:(id)a4 reply:(id)a5
{
  uint64_t v6 = kSecEntitlementPrivateOctagonSecureElement;
  id v7 = a5;
  id v9 = +[NSString stringWithFormat:@"Missing entitlement '%@'", v6];
  id v8 = +[NSError errorWithDomain:NSOSStatusErrorDomain code:-34018 description:v9];
  (*((void (**)(id, void *))a5 + 2))(v7, v8);
}

- (void)failSetLocalSecureElementIdentity:(id)a3 secureElementIdentity:(id)a4 reply:(id)a5
{
  uint64_t v6 = kSecEntitlementPrivateOctagonSecureElement;
  id v7 = a5;
  id v9 = +[NSString stringWithFormat:@"Missing entitlement '%@'", v6];
  id v8 = +[NSError errorWithDomain:NSOSStatusErrorDomain code:-34018 description:v9];
  (*((void (**)(id, void *))a5 + 2))(v7, v8);
}

- (void)failFetchEscrowContents:(id)a3 reply:(id)a4
{
  uint64_t v5 = kSecEntitlementPrivateOctagonEscrow;
  id v6 = a4;
  id v8 = +[NSString stringWithFormat:@"Missing entitlement '%@'", v5];
  id v7 = +[NSError errorWithDomain:NSOSStatusErrorDomain code:-34018 description:v8];
  (*((void (**)(id, void, void, void, void *))a4 + 2))(v6, 0, 0, 0, v7);
}

- (void)forwardInvocation:(id)a3
{
  id v4 = a3;
  if (sel_isEqual((SEL)[v4 selector], "fetchEscrowContents:reply:"))
  {
    uint64_t v5 = [(OctagonXPCEntitlementChecker *)self entitlementBearer];
    id v6 = [v5 valueForEntitlement:kSecEntitlementPrivateOctagonEscrow];

    if (!v6)
    {
      v20 = sub_10000B070("SecError");
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        v21 = [(OctagonXPCEntitlementChecker *)self entitlementBearer];
        int v35 = 138412546;
        v36 = v21;
        __int16 v37 = 2112;
        uint64_t v38 = kSecEntitlementPrivateOctagonEscrow;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Client %@ does not have entitlement %@, rejecting rpc", (uint8_t *)&v35, 0x16u);
      }
      v22 = "failFetchEscrowContents:reply:";
      goto LABEL_37;
    }
  }
  if (sel_isEqual((SEL)[v4 selector], "setLocalSecureElementIdentity:secureElementIdentity:reply:"))
  {
    id v7 = [(OctagonXPCEntitlementChecker *)self entitlementBearer];
    id v8 = [v7 valueForEntitlement:kSecEntitlementPrivateOctagonSecureElement];

    if (!v8)
    {
      v23 = sub_10000B070("SecError");
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        v24 = [(OctagonXPCEntitlementChecker *)self entitlementBearer];
        int v35 = 138412546;
        v36 = v24;
        __int16 v37 = 2112;
        uint64_t v38 = kSecEntitlementPrivateOctagonSecureElement;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Client %@ does not have entitlement %@, rejecting rpc", (uint8_t *)&v35, 0x16u);
      }
      v22 = "failSetLocalSecureElementIdentity:secureElementIdentity:reply:";
      goto LABEL_37;
    }
  }
  if (sel_isEqual((SEL)[v4 selector], "removeLocalSecureElementIdentityPeerID:secureElementIdentityPeerID:reply:"))
  {
    id v9 = [(OctagonXPCEntitlementChecker *)self entitlementBearer];
    v10 = [v9 valueForEntitlement:kSecEntitlementPrivateOctagonSecureElement];

    if (!v10)
    {
      v25 = sub_10000B070("SecError");
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        v26 = [(OctagonXPCEntitlementChecker *)self entitlementBearer];
        int v35 = 138412546;
        v36 = v26;
        __int16 v37 = 2112;
        uint64_t v38 = kSecEntitlementPrivateOctagonSecureElement;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Client %@ does not have entitlement %@, rejecting rpc", (uint8_t *)&v35, 0x16u);
      }
      v22 = "failRemoveLocalSecureElementIdentityPeerID:secureElementIdentityPeerID:reply:";
      goto LABEL_37;
    }
  }
  if (sel_isEqual((SEL)[v4 selector], "fetchTrustedSecureElementIdentities:reply:"))
  {
    v11 = [(OctagonXPCEntitlementChecker *)self entitlementBearer];
    v12 = [v11 valueForEntitlement:kSecEntitlementPrivateOctagonSecureElement];

    if (!v12)
    {
      v27 = sub_10000B070("SecError");
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        v28 = [(OctagonXPCEntitlementChecker *)self entitlementBearer];
        int v35 = 138412546;
        v36 = v28;
        __int16 v37 = 2112;
        uint64_t v38 = kSecEntitlementPrivateOctagonSecureElement;
        _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Client %@ does not have entitlement %@, rejecting rpc", (uint8_t *)&v35, 0x16u);
      }
      v22 = "failFetchTrustedSecureElementIdentities:reply:";
      goto LABEL_37;
    }
  }
  if (sel_isEqual((SEL)[v4 selector], "setAccountSetting:setting:reply:"))
  {
    v13 = [(OctagonXPCEntitlementChecker *)self entitlementBearer];
    v14 = [v13 valueForEntitlement:kSecEntitlementPrivateOctagonWalrus];

    if (!v14)
    {
      v29 = sub_10000B070("SecError");
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        v30 = [(OctagonXPCEntitlementChecker *)self entitlementBearer];
        int v35 = 138412546;
        v36 = v30;
        __int16 v37 = 2112;
        uint64_t v38 = kSecEntitlementPrivateOctagonWalrus;
        _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "Client %@ does not have entitlement %@, rejecting rpc", (uint8_t *)&v35, 0x16u);
      }
      v22 = "failSetAccountSetting:setting:reply:";
      goto LABEL_37;
    }
  }
  if (sel_isEqual((SEL)[v4 selector], "fetchAccountSettings:reply:"))
  {
    v15 = [(OctagonXPCEntitlementChecker *)self entitlementBearer];
    v16 = [v15 valueForEntitlement:kSecEntitlementPrivateOctagonWalrus];

    if (!v16)
    {
      v31 = sub_10000B070("SecError");
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        v32 = [(OctagonXPCEntitlementChecker *)self entitlementBearer];
        int v35 = 138412546;
        v36 = v32;
        __int16 v37 = 2112;
        uint64_t v38 = kSecEntitlementPrivateOctagonWalrus;
        _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "Client %@ does not have entitlement %@, rejecting rpc", (uint8_t *)&v35, 0x16u);
      }
      v22 = "failFetchAccountSettings:reply:";
      goto LABEL_37;
    }
  }
  if (sel_isEqual((SEL)[v4 selector], "fetchAccountWideSettingsWithForceFetch:arguments:reply:"))
  {
    v17 = [(OctagonXPCEntitlementChecker *)self entitlementBearer];
    v18 = [v17 valueForEntitlement:kSecEntitlementPrivateOctagonWalrus];

    if (!v18)
    {
      v33 = sub_10000B070("SecError");
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        v34 = [(OctagonXPCEntitlementChecker *)self entitlementBearer];
        int v35 = 138412546;
        v36 = v34;
        __int16 v37 = 2112;
        uint64_t v38 = kSecEntitlementPrivateOctagonWalrus;
        _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "Client %@ does not have entitlement %@, rejecting rpc", (uint8_t *)&v35, 0x16u);
      }
      v22 = "failFetchAccountWideSettingsWithForceFetch:arguments:reply:";
LABEL_37:
      [v4 setSelector:v22];
      [v4 invokeWithTarget:self];
      goto LABEL_38;
    }
  }
  v19 = [(OctagonXPCEntitlementChecker *)self manager];
  [v4 invokeWithTarget:v19];

LABEL_38:
}

- (id)methodSignatureForSelector:(SEL)a3
{
  id v4 = [(OctagonXPCEntitlementChecker *)self manager];
  uint64_t v5 = [v4 methodSignatureForSelector:a3];

  return v5;
}

- (OctagonXPCEntitlementChecker)initWithManager:(id)a3 entitlementBearer:(id)a4
{
  id v6 = (OTManager *)a3;
  id v7 = (OctagonEntitlementBearerProtocol *)a4;
  manager = self->_manager;
  self->_manager = v6;
  id v9 = v6;

  entitlementBearer = self->_entitlementBearer;
  self->_entitlementBearer = v7;

  return self;
}

+ (id)createWithManager:(id)a3 entitlementBearer:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [[OctagonXPCEntitlementChecker alloc] initWithManager:v6 entitlementBearer:v5];

  return v7;
}

+ (BOOL)conformsToProtocol:(id)a3
{
  id v3 = a3;
  unsigned __int8 v4 = [(id)objc_opt_class() conformsToProtocol:v3];

  return v4;
}

@end
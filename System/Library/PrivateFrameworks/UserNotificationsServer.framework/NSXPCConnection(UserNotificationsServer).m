@interface NSXPCConnection(UserNotificationsServer)
- (id)uns_clientAuditToken;
- (id)uns_clientBundleProxy;
- (id)uns_getClientConnectionDetails;
- (uint64_t)_uns_connection:()UserNotificationsServer isAuthorizedToSendNotificationsForBundleIdentifier:;
- (uint64_t)_uns_connection:()UserNotificationsServer isAuthorizedToSendNotificationsForManagementDomainOfBundleIdentifier:;
- (uint64_t)_uns_connection:()UserNotificationsServer valueForEntitlementKey:matchesValue:;
- (uint64_t)uns_hasEntitlement:()UserNotificationsServer capability:;
- (uint64_t)uns_isAllowedFromDaemon;
- (uint64_t)uns_isAllowedToReadSettings;
- (uint64_t)uns_isAllowedToRequestUserNotificationsForBundleIdentifier:()UserNotificationsServer;
- (uint64_t)uns_isAllowedToWriteSettings;
- (uint64_t)uns_isInternalUserNotificationsTool;
- (uint64_t)uns_requestContainsDisallowedPrivateUserInfo:()UserNotificationsServer;
- (void)uns_isAllowedFromDaemon;
- (void)uns_isAllowedToReadSettings;
- (void)uns_isAllowedToWriteSettings;
- (void)uns_setConnectionDetails:()UserNotificationsServer;
@end

@implementation NSXPCConnection(UserNotificationsServer)

- (id)uns_clientBundleProxy
{
  v2 = objc_msgSend(a1, "uns_clientAuditToken");
  v3 = v2;
  if (v2) {
    [v2 pid];
  }
  else {
    [a1 processIdentifier];
  }
  v4 = BSBundleIDForPID();
  v5 = [MEMORY[0x263F01888] bundleProxyForIdentifier:v4];

  return v5;
}

- (id)uns_clientAuditToken
{
  v2 = objc_msgSend(a1, "uns_getClientConnectionDetails");
  v3 = [v2 auditToken];
  v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    v6 = (void *)MEMORY[0x263F29BE0];
    [a1 auditToken];
    id v5 = [v6 tokenFromAuditToken:&v9];
  }
  v7 = v5;

  return v7;
}

- (id)uns_getClientConnectionDetails
{
  return objc_getAssociatedObject(a1, &kUNClientConnectionDetailsKey);
}

- (uint64_t)uns_isAllowedToRequestUserNotificationsForBundleIdentifier:()UserNotificationsServer
{
  id v4 = a3;
  if ((objc_msgSend(a1, "uns_isAllowedFromDaemon") & 1) == 0)
  {
    [a1 processIdentifier];
    v6 = BSBundleIDForPID();
    if ([v6 isEqual:v4])
    {
      v7 = 0;
    }
    else
    {
      v7 = [MEMORY[0x263F018C0] pluginKitProxyForIdentifier:v6];
      v8 = [v7 containingBundle];
      uint64_t v9 = [v8 bundleIdentifier];
      char v10 = [v9 isEqual:v4];

      if ((v10 & 1) == 0)
      {
        v11 = (void *)MEMORY[0x263F29BE0];
        v12 = [a1 _xpcConnection];
        v13 = [v11 tokenFromXPCConnection:v12];

        if (objc_msgSend(a1, "_uns_connection:isAuthorizedToSendNotificationsForBundleIdentifier:", v13, v4))
        {
        }
        else
        {
          char v14 = objc_msgSend(a1, "_uns_connection:isAuthorizedToSendNotificationsForManagementDomainOfBundleIdentifier:", v13, v4);

          if ((v14 & 1) == 0)
          {
            v15 = [a1 _xpcConnection];
            char HasEntitlement = BSXPCConnectionHasEntitlement();

            if ((HasEntitlement & 1) == 0)
            {
              v17 = [a1 _xpcConnection];
              char v18 = BSXPCConnectionHasEntitlement();

              if ((v18 & 1) == 0)
              {
                v19 = [a1 _xpcConnection];
                char v20 = BSXPCConnectionHasEntitlement();

                if ((v20 & 1) == 0)
                {
                  v21 = [a1 _xpcConnection];
                  char v22 = BSXPCConnectionHasEntitlement();

                  if ((v22 & 1) == 0)
                  {
                    v23 = [a1 _xpcConnection];
                    char v24 = BSXPCConnectionHasEntitlement();

                    if ((v24 & 1) == 0)
                    {
                      v36 = *MEMORY[0x263F1E010];
                      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E010], OS_LOG_TYPE_ERROR)) {
                        -[NSXPCConnection(UserNotificationsServer) uns_isAllowedToRequestUserNotificationsForBundleIdentifier:]((uint64_t)v4, v36);
                      }
                      uint64_t v5 = 0;
                      goto LABEL_20;
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
    v25 = [v7 protocol];
    int v26 = [v25 isEqualToString:*MEMORY[0x263F84348]];

    if (v26)
    {
      v27 = [v7 bundleIdentifier];
      uint64_t v5 = [MEMORY[0x263F84270] isAccessToNotificationCenterAllowedForServiceExtensionWithIdentifier:v27];
      if ((v5 & 1) == 0)
      {
        v28 = *MEMORY[0x263F1E010];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E010], OS_LOG_TYPE_ERROR)) {
          -[NSXPCConnection(UserNotificationsServer) uns_isAllowedToRequestUserNotificationsForBundleIdentifier:]((uint64_t)v27, v28, v29, v30, v31, v32, v33, v34);
        }
      }
    }
    else
    {
      uint64_t v5 = 1;
    }
LABEL_20:

    goto LABEL_21;
  }
  uint64_t v5 = 1;
LABEL_21:

  return v5;
}

- (uint64_t)uns_isAllowedFromDaemon
{
  v1 = [a1 _xpcConnection];
  uint64_t HasEntitlement = BSXPCConnectionHasEntitlement();

  if ((HasEntitlement & 1) == 0)
  {
    if (_os_feature_enabled_impl())
    {
      v3 = *MEMORY[0x263F1E010];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E010], OS_LOG_TYPE_ERROR)) {
        -[NSXPCConnection(UserNotificationsServer) uns_isAllowedFromDaemon](v3);
      }
    }
  }
  return HasEntitlement;
}

- (void)uns_setConnectionDetails:()UserNotificationsServer
{
}

- (void)uns_isAllowedFromDaemon
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_22289A000, log, OS_LOG_TYPE_ERROR, "Entitlement is required to forward requests", v1, 2u);
}

- (uint64_t)uns_requestContainsDisallowedPrivateUserInfo:()UserNotificationsServer
{
  id v4 = [a3 allKeys];
  int v5 = [v4 containsObject:@"com.apple.private.untool.override"];

  if (!v5) {
    return 0;
  }
  v6 = (os_log_t *)MEMORY[0x263F1E010];
  v7 = *MEMORY[0x263F1E010];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E010], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22289A000, v7, OS_LOG_TYPE_DEFAULT, "Request contains Apple private userInfo, checking request's entitlement...", buf, 2u);
  }
  int v8 = objc_msgSend(a1, "uns_isInternalUserNotificationsTool");
  uint64_t v9 = *v6;
  if (v8)
  {
    BOOL v10 = os_log_type_enabled(*v6, OS_LOG_TYPE_DEFAULT);
    uint64_t result = 0;
    if (!v10) {
      return result;
    }
    *(_WORD *)v12 = 0;
    _os_log_impl(&dword_22289A000, v9, OS_LOG_TYPE_DEFAULT, "Request is allowed for Apple private userInfo.", v12, 2u);
    return 0;
  }
  if (os_log_type_enabled(*v6, OS_LOG_TYPE_ERROR)) {
    -[NSXPCConnection(UserNotificationsServer) uns_requestContainsDisallowedPrivateUserInfo:](v9);
  }
  return 1;
}

- (uint64_t)uns_isAllowedToReadSettings
{
  uint64_t v1 = objc_msgSend(a1, "uns_hasEntitlement:capability:", @"com.apple.private.usernotifications.settings", @"read");
  if ((v1 & 1) == 0)
  {
    v2 = *MEMORY[0x263F1E010];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E010], OS_LOG_TYPE_ERROR)) {
      [(NSXPCConnection(UserNotificationsServer) *)v2 uns_isAllowedToReadSettings];
    }
  }
  return v1;
}

- (uint64_t)uns_isAllowedToWriteSettings
{
  uint64_t v1 = objc_msgSend(a1, "uns_hasEntitlement:capability:", @"com.apple.private.usernotifications.settings", @"write");
  if ((v1 & 1) == 0)
  {
    v2 = *MEMORY[0x263F1E010];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E010], OS_LOG_TYPE_ERROR)) {
      [(NSXPCConnection(UserNotificationsServer) *)v2 uns_isAllowedToWriteSettings];
    }
  }
  return v1;
}

- (uint64_t)uns_hasEntitlement:()UserNotificationsServer capability:
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [a1 valueForEntitlement:v6];
  if (!v8 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v12 = *MEMORY[0x263F1E010];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E010], OS_LOG_TYPE_ERROR)) {
      -[NSXPCConnection(UserNotificationsServer) uns_hasEntitlement:capability:]((uint64_t)v6, (uint64_t)v7, v12);
    }
    goto LABEL_7;
  }
  uint64_t v9 = [MEMORY[0x263EFFA08] setWithArray:v8];
  if (!v9)
  {
LABEL_7:
    uint64_t v11 = 0;
    goto LABEL_8;
  }
  BOOL v10 = v9;
  uint64_t v11 = [v9 containsObject:v7];

LABEL_8:
  return v11;
}

- (uint64_t)uns_isInternalUserNotificationsTool
{
  if (objc_msgSend(a1, "uns_isAllowedFromDaemon")
    && (objc_msgSend(a1, "uns_getClientConnectionDetails"), (v2 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    uint64_t v3 = v2;
    uint64_t v4 = [v2 isInternalTool];
  }
  else
  {
    uint64_t v5 = (void *)MEMORY[0x263F29BE0];
    id v6 = [a1 _xpcConnection];
    uint64_t v3 = [v5 tokenFromXPCConnection:v6];

    uint64_t v4 = objc_msgSend(v3, "unc_isInternalUserNotificationsTool");
  }
  uint64_t v7 = v4;

  return v7;
}

- (uint64_t)_uns_connection:()UserNotificationsServer isAuthorizedToSendNotificationsForBundleIdentifier:
{
  return objc_msgSend(a1, "_uns_connection:valueForEntitlementKey:matchesValue:", a3, @"com.apple.private.usernotifications.bundle-identifiers", a4);
}

- (uint64_t)_uns_connection:()UserNotificationsServer isAuthorizedToSendNotificationsForManagementDomainOfBundleIdentifier:
{
  id v6 = a3;
  id v7 = a4;
  id v14 = 0;
  uint64_t v8 = (void *)[objc_alloc(MEMORY[0x263F01878]) initWithBundleIdentifier:v7 allowPlaceholder:1 error:&v14];
  id v9 = v14;
  BOOL v10 = [v8 managementDomain];
  if (v9)
  {
    uint64_t v11 = (void *)*MEMORY[0x263F1E010];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E010], OS_LOG_TYPE_ERROR)) {
      -[NSXPCConnection(UserNotificationsServer) _uns_connection:isAuthorizedToSendNotificationsForManagementDomainOfBundleIdentifier:]((uint64_t)v7, v11, v9);
    }
    uint64_t v12 = 0;
  }
  else
  {
    uint64_t v12 = objc_msgSend(a1, "_uns_connection:valueForEntitlementKey:matchesValue:", v6, @"com.apple.private.usernotifications.app-management-domains", v10);
  }

  return v12;
}

- (uint64_t)_uns_connection:()UserNotificationsServer valueForEntitlementKey:matchesValue:
{
  v14[1] = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if ([v9 length])
  {
    BOOL v10 = [v7 valueForEntitlement:v8];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v14[0] = v10;
      uint64_t v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v14 count:1];

      BOOL v10 = (void *)v11;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      uint64_t v12 = [v10 containsObject:v9];
    }
    else {
      uint64_t v12 = 0;
    }
  }
  else
  {
    uint64_t v12 = 0;
  }

  return v12;
}

- (void)uns_requestContainsDisallowedPrivateUserInfo:()UserNotificationsServer .cold.1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_22289A000, log, OS_LOG_TYPE_ERROR, "Request is NOT allowed for Apple private userInfo!", v1, 2u);
}

- (void)uns_isAllowedToRequestUserNotificationsForBundleIdentifier:()UserNotificationsServer .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)uns_isAllowedToRequestUserNotificationsForBundleIdentifier:()UserNotificationsServer .cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int v2 = 138543618;
  uint64_t v3 = @"com.apple.private.usernotifications.bundle-identifiers";
  __int16 v4 = 2114;
  uint64_t v5 = a1;
  _os_log_error_impl(&dword_22289A000, a2, OS_LOG_TYPE_ERROR, "Entitlment '%{public}@' for %{public}@ required to request user notifications", (uint8_t *)&v2, 0x16u);
}

- (void)uns_isAllowedToReadSettings
{
}

- (void)uns_isAllowedToWriteSettings
{
}

- (void)uns_hasEntitlement:()UserNotificationsServer capability:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = 138543618;
  uint64_t v4 = a1;
  __int16 v5 = 2114;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_22289A000, log, OS_LOG_TYPE_ERROR, "Entitlement '%{public}@' for capability '%{public}@' is not valid because it is not an NSArray", (uint8_t *)&v3, 0x16u);
}

- (void)_uns_connection:()UserNotificationsServer isAuthorizedToSendNotificationsForManagementDomainOfBundleIdentifier:.cold.1(uint64_t a1, void *a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  __int16 v5 = a2;
  uint64_t v6 = [a3 localizedDescription];
  uint64_t v7 = (void *)v6;
  id v8 = @"<null>";
  if (v6) {
    id v8 = (__CFString *)v6;
  }
  int v9 = 138543618;
  uint64_t v10 = a1;
  __int16 v11 = 2114;
  uint64_t v12 = v8;
  _os_log_error_impl(&dword_22289A000, v5, OS_LOG_TYPE_ERROR, "Failed to lookup application record to get management domain for '%{public}@'. Error: '%{public}@'", (uint8_t *)&v9, 0x16u);
}

@end
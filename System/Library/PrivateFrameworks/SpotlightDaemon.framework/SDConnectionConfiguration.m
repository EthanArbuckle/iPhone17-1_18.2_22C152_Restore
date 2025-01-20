@interface SDConnectionConfiguration
- (BOOL)allowMail;
- (BOOL)allowMessagesContent;
- (BOOL)allowNotifications;
- (BOOL)allowOpenJournalFile;
- (BOOL)allowPhotosLibraryDeletion;
- (BOOL)internal;
- (BOOL)isExtension;
- (BOOL)isManaged;
- (BOOL)isPrivate;
- (BOOL)managedIndexNonSandboxAllowed;
- (BOOL)privateIndexNonSandboxAllowed;
- (BOOL)quotaDisabled;
- (BOOL)searchInternal;
- (NSSet)allowedBundleIDs;
- (NSString)bundleID;
- (NSString)personaID;
- (NSString)protectionClass;
- (OS_xpc_object)connection;
- (SDConnectionConfiguration)initWithConnection:(id)a3 isManaged:(BOOL)a4;
- (SDConnectionConfiguration)initWithConnection:(id)a3 isPrivate:(BOOL)a4;
- (SDConnectionConfiguration)initWithConnection:(id)a3 isPrivate:(BOOL)a4 isManaged:(BOOL)a5;
- (int)entitledAttributes;
- (int)pid;
- (unsigned)egid;
- (unsigned)euid;
- (void)setConnection:(id)a3;
@end

@implementation SDConnectionConfiguration

- (OS_xpc_object)connection
{
  return self->_connection;
}

- (BOOL)searchInternal
{
  return self->_searchInternal;
}

- (SDConnectionConfiguration)initWithConnection:(id)a3 isPrivate:(BOOL)a4
{
  return [(SDConnectionConfiguration *)self initWithConnection:a3 isPrivate:a4 isManaged:0];
}

- (SDConnectionConfiguration)initWithConnection:(id)a3 isPrivate:(BOOL)a4 isManaged:(BOOL)a5
{
  uint64_t v53 = *MEMORY[0x263EF8340];
  v9 = (_xpc_connection_s *)a3;
  v51.receiver = self;
  v51.super_class = (Class)SDConnectionConfiguration;
  v10 = [(SDConnectionConfiguration *)&v51 init];
  v11 = v10;
  if (!v10) {
    goto LABEL_58;
  }
  objc_storeStrong((id *)&v10->_connection, a3);
  v11->_unsigned int pid = xpc_connection_get_pid(v9);
  v11->_euid = xpc_connection_get_euid(v9);
  v11->_egid = xpc_connection_get_egid(v9);
  v11->_isExtension = xpc_connection_is_extension();
  v11->_isPrivate = a4;
  v11->_isManaged = a5;
  xpc_connection_get_audit_token();
  CFAllocatorRef v12 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  memset(&token, 0, sizeof(token));
  v13 = SecTaskCreateWithAuditToken(v12, &token);
  if (v13)
  {
    v14 = v13;
    v11->_internal = checkBooleanEntitlement(v13, (const __CFString *)*MEMORY[0x263F02B80]);
    v11->_searchInternal = checkBooleanEntitlement(v14, (const __CFString *)*MEMORY[0x263F02BA8]);
    v11->_quotaDisabled = checkBooleanEntitlement(v14, @"com.apple.developer.corespotlight.disablequota");
    v11->_privateIndexNonSandboxAllowed = checkBooleanEntitlement(v14, (const __CFString *)*MEMORY[0x263F02B90]);
    v11->_managedIndexNonSandboxAllowed = checkBooleanEntitlement(v14, (const __CFString *)*MEMORY[0x263F02B88]);
    v11->_entitledAttributes = 0;
    if (checkBooleanEntitlement(v14, @"com.apple.spotlight.entitledattributes")) {
      v11->_entitledAttributes |= 1u;
    }
    if (checkBooleanEntitlement(v14, @"com.apple.spotlight.photos.entitledattributes")) {
      v11->_entitledAttributes |= 2u;
    }
    if (checkBooleanEntitlement(v14, @"com.apple.spotlight.documentunderstanding.entitledattributes")) {
      v11->_entitledAttributes |= 4u;
    }
    v11->_allowMail = checkBooleanEntitlement(v14, (const __CFString *)*MEMORY[0x263F02B98]);
    v11->_allowPhotosLibraryDeletion = checkBooleanEntitlement(v14, (const __CFString *)*MEMORY[0x263F02B78]);
    v11->_allowOpenJournalFile = checkBooleanEntitlement(v14, (const __CFString *)*MEMORY[0x263F02B70]);
    v15 = (void *)SecTaskCopyValueForEntitlement(v14, (CFStringRef)*MEMORY[0x263F02BA0], 0);
    if (v15)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v16 = [MEMORY[0x263EFFA08] setWithArray:v15];
        allowedBundleIDs = v11->_allowedBundleIDs;
        v11->_allowedBundleIDs = (NSSet *)v16;
      }
    }

    v18 = (void *)SecTaskCopyValueForEntitlement(v14, (CFStringRef)*MEMORY[0x263F02BB0], 0);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_storeStrong((id *)&v11->_bundleID, v18);
    }
    else
    {
      if (v11->_isExtension)
      {
        v19 = [MEMORY[0x263F5E718] defaultManager];
        uint64_t v20 = [v19 containingAppForPlugInWithPid:v11->_pid];
        bundleID = v11->_bundleID;
        v11->_bundleID = (NSString *)v20;

        if (!v11->_bundleID)
        {
          v22 = [v19 informationForPlugInWithPid:v11->_pid];
          uint64_t v23 = [v22 objectForKeyedSubscript:*MEMORY[0x263F5E730]];
          v24 = v11->_bundleID;
          v11->_bundleID = (NSString *)v23;
        }
      }
      p_bundleID = (void **)&v11->_bundleID;
      if (!v11->_bundleID)
      {
        CFTypeRef v26 = SecTaskCopyValueForEntitlement(v14, @"application-identifier", 0);

        v18 = (void *)v26;
        if (!v26) {
          v18 = (void *)SecTaskCopySigningIdentifier(v14, 0);
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          objc_storeStrong((id *)&v11->_bundleID, v18);
          *(void *)token.val = 0;
          if (CPCopyBundleIdentifierAndTeamFromApplicationIdentifier())
          {
            if (*(void *)token.val)
            {
              id v27 = objc_alloc(MEMORY[0x263F01858]);
              v50 = (void *)[v27 initWithBundleIdentifier:*(void *)token.val error:0];
              v28 = [v50 containingBundleRecord];
              v29 = [v28 bundleIdentifier];

              if (v29) {
                id v30 = v29;
              }
              else {
                id v30 = *(id *)token.val;
              }
              v31 = *p_bundleID;
              *p_bundleID = v30;
            }
          }
        }
      }
    }
    v32 = (id *)&v11->_bundleID;
    if (!v11->_bundleID || !objc_msgSend(&unk_26D0C8C08, "containsObject:")) {
      goto LABEL_35;
    }
    if (checkBooleanEntitlement(v14, @"com.apple.private.corespotlight.allownotifications"))
    {
      v11->_allowNotifications = 1;
LABEL_40:
      if (*v32)
      {
        int v36 = objc_msgSend(&unk_26D0C8C20, "containsObject:");
        if (v36) {
          LOBYTE(v36) = checkBooleanEntitlement(v14, @"com.apple.private.corespotlight.allowmessagescontent");
        }
      }
      else
      {
        LOBYTE(v36) = 0;
      }
      v11->_allowMessagesContent = v36;
      v37 = (void *)SecTaskCopyValueForEntitlement(v14, (CFStringRef)*MEMORY[0x263F02B68], 0);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0
        || (v38 = (void *)SecTaskCopyValueForEntitlement(v14, (CFStringRef)*MEMORY[0x263F02B60], 0),
            v37,
            objc_opt_class(),
            id v39 = 0,
            v37 = v38,
            (objc_opt_isKindOfClass() & 1) != 0))
      {
        id v39 = v37;
        v38 = v39;
      }
      uint64_t v40 = CSSanitizeProtectionClass();
      protectionClass = v11->_protectionClass;
      v11->_protectionClass = (NSString *)v40;

      CFRelease(v14);
      goto LABEL_48;
    }
    if (*v32)
    {
      char v33 = [*v32 isEqualToString:@"com.apple.assistant_service"];
      v11->_allowNotifications = v33;
      if (v33) {
        goto LABEL_40;
      }
    }
    else
    {
LABEL_35:
      v11->_allowNotifications = 0;
    }
    if ([(NSSet *)v11->_allowedBundleIDs containsObject:@"com.apple.usernotificationsd"])
    {
      v34 = (void *)[(NSSet *)v11->_allowedBundleIDs mutableCopy];
      [v34 removeObject:@"com.apple.usernotificationsd"];
      objc_storeStrong((id *)&v11->_allowedBundleIDs, v34);
      v35 = logForCSLogCategoryDefault();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG)) {
        -[SDConnectionConfiguration initWithConnection:isPrivate:isManaged:]((uint64_t *)&v11->_bundleID, v35);
      }
    }
    goto LABEL_40;
  }
LABEL_48:
  if (!a4 && !a5)
  {
    v42 = [MEMORY[0x263F841B0] sharedManager];
    v43 = [v42 currentPersona];
    uint64_t v44 = [v43 userPersonaUniqueString];
    personaID = v11->_personaID;
    v11->_personaID = (NSString *)v44;
  }
  if (v11->_bundleID || v11->_searchInternal)
  {
    v46 = logForCSLogCategoryDefault();
    if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int pid = v11->_pid;
      v48 = v11->_bundleID;
      token.val[0] = 67109378;
      token.val[1] = pid;
      LOWORD(token.val[2]) = 2112;
      *(void *)((char *)&token.val[2] + 2) = v48;
      _os_log_impl(&dword_21F1CE000, v46, OS_LOG_TYPE_DEFAULT, "pid: %d bundleID: %@", (uint8_t *)&token, 0x12u);
    }
  }
  else
  {
    v46 = logForCSLogCategoryDefault();
    if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR)) {
      -[SDConnectionConfiguration initWithConnection:isPrivate:isManaged:]((uint64_t)v9, v46);
    }
  }

LABEL_58:
  return v11;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (NSString)personaID
{
  return self->_personaID;
}

- (int)entitledAttributes
{
  return self->_entitledAttributes;
}

- (BOOL)allowNotifications
{
  return self->_allowNotifications;
}

- (BOOL)internal
{
  return self->_internal;
}

- (BOOL)quotaDisabled
{
  return self->_quotaDisabled;
}

- (NSString)protectionClass
{
  return self->_protectionClass;
}

- (int)pid
{
  return self->_pid;
}

- (BOOL)isPrivate
{
  return self->_isPrivate;
}

- (BOOL)isExtension
{
  return self->_isExtension;
}

- (unsigned)euid
{
  return self->_euid;
}

- (BOOL)allowPhotosLibraryDeletion
{
  return self->_allowPhotosLibraryDeletion;
}

- (BOOL)allowOpenJournalFile
{
  return self->_allowOpenJournalFile;
}

- (BOOL)allowMail
{
  return self->_allowMail;
}

- (BOOL)privateIndexNonSandboxAllowed
{
  return self->_privateIndexNonSandboxAllowed;
}

- (SDConnectionConfiguration)initWithConnection:(id)a3 isManaged:(BOOL)a4
{
  return [(SDConnectionConfiguration *)self initWithConnection:a3 isPrivate:0 isManaged:a4];
}

- (void)setConnection:(id)a3
{
}

- (NSSet)allowedBundleIDs
{
  return self->_allowedBundleIDs;
}

- (unsigned)egid
{
  return self->_egid;
}

- (BOOL)managedIndexNonSandboxAllowed
{
  return self->_managedIndexNonSandboxAllowed;
}

- (BOOL)isManaged
{
  return self->_isManaged;
}

- (BOOL)allowMessagesContent
{
  return self->_allowMessagesContent;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allowedBundleIDs, 0);
  objc_storeStrong((id *)&self->_personaID, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_protectionClass, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

- (void)initWithConnection:(uint64_t)a1 isPrivate:(NSObject *)a2 isManaged:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_21F1CE000, a2, OS_LOG_TYPE_ERROR, "Could not resolve bundle from %@", (uint8_t *)&v2, 0xCu);
}

- (void)initWithConnection:(uint64_t *)a1 isPrivate:(NSObject *)a2 isManaged:.cold.2(uint64_t *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v2 = *a1;
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_debug_impl(&dword_21F1CE000, a2, OS_LOG_TYPE_DEBUG, "Unallowing notifications for bid %@ not in allow list", (uint8_t *)&v3, 0xCu);
}

@end
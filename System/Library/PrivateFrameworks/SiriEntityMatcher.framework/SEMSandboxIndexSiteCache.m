@interface SEMSandboxIndexSiteCache
- (SEMSandboxIndexSiteCache)initWithManagerDirectory:(id)a3 sharedOverrideCache:(id)a4 readOnly:(BOOL)a5;
- (id)openUserVaultTransaction:(id *)a3 forPersonaIdentifier:(id)a4 error:(id *)a5;
- (void)spoofUserVaultAvailableForPersonaIdentifier:(id)a3;
- (void)spoofUserVaultUnavailableForPersonaIdentifier:(id)a3;
- (void)spoofUserVaultUnavailableSoonForPersonaIdentifier:(id)a3;
@end

@implementation SEMSandboxIndexSiteCache

- (SEMSandboxIndexSiteCache)initWithManagerDirectory:(id)a3 sharedOverrideCache:(id)a4 readOnly:(BOOL)a5
{
  BOOL v5 = a5;
  id v9 = a4;
  v13.receiver = self;
  v13.super_class = (Class)SEMSandboxIndexSiteCache;
  v10 = [(SEMIndexSiteCache *)&v13 initWithManagerDirectory:a3 readOnly:v5];
  v11 = v10;
  if (v10) {
    objc_storeStrong((id *)&v10->_personaToUserVaultDirectoryMap, a4);
  }

  return v11;
}

- (id)openUserVaultTransaction:(id *)a3 forPersonaIdentifier:(id)a4 error:(id *)a5
{
  v25[1] = *MEMORY[0x263EF8340];
  id v7 = a4;
  v10 = objc_msgSend_objectForKey_(self->_personaToUserVaultDirectoryMap, v8, (uint64_t)v7, v9);
  if (!v10)
  {
    v11 = (void *)MEMORY[0x263F087E8];
    uint64_t v24 = *MEMORY[0x263F07F80];
    v12 = NSString;
    objc_super v13 = (objc_class *)objc_opt_class();
    v14 = NSStringFromClass(v13);
    v17 = objc_msgSend_stringWithFormat_(v12, v15, @"%@ - spoofed UserVault has not been created for persona: %@", v16, v14, v7);
    v25[0] = v17;
    v19 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v18, (uint64_t)v25, (uint64_t)&v24, 1);
    v21 = objc_msgSend_errorWithDomain_code_userInfo_(v11, v20, 0x2709E1490, 4, v19);
    v22 = v21;
    if (a5 && v21) {
      *a5 = v21;
    }
  }
  return v10;
}

- (void)spoofUserVaultAvailableForPersonaIdentifier:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v7 = objc_msgSend_stringByAppendingPathComponent_(@"SandboxUserVault", v5, (uint64_t)v4, v6);
  v8 = NSURL;
  v12 = objc_msgSend_managerDirectory(self, v9, v10, v11);
  v14 = objc_msgSend_fileURLWithPath_isDirectory_relativeToURL_(v8, v13, (uint64_t)v7, 1, v12);

  id v20 = 0;
  v15 = sub_25C7EFC30(v14, &v20);
  id v17 = v20;
  if (v15)
  {
    objc_msgSend_setObject_forKey_(self->_personaToUserVaultDirectoryMap, v16, (uint64_t)v14, (uint64_t)v4);
    v18 = qword_26B3549D8;
    if (os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v22 = "-[SEMSandboxIndexSiteCache spoofUserVaultAvailableForPersonaIdentifier:]";
      __int16 v23 = 2112;
      uint64_t v24 = v15;
      _os_log_impl(&dword_25C7CA000, v18, OS_LOG_TYPE_INFO, "%s Created spoofed UserVault: %@", buf, 0x16u);
    }
  }
  else
  {
    v19 = qword_26B3549D8;
    if (os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v22 = "-[SEMSandboxIndexSiteCache spoofUserVaultAvailableForPersonaIdentifier:]";
      __int16 v23 = 2112;
      uint64_t v24 = v14;
      __int16 v25 = 2112;
      id v26 = v17;
      _os_log_error_impl(&dword_25C7CA000, v19, OS_LOG_TYPE_ERROR, "%s Failed to create spoofed UserVault directory: %@ error: %@", buf, 0x20u);
    }
  }
}

- (void)spoofUserVaultUnavailableSoonForPersonaIdentifier:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v8 = objc_msgSend_objectForKey_(self->_personaToUserVaultDirectoryMap, v5, (uint64_t)v4, v6);
  if (v8)
  {
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = sub_25C807FE8;
    v11[3] = &unk_2654DE398;
    v11[4] = self;
    objc_msgSend_runAsPersonaIdentifier_block_(SEMPersonaUtilities, v7, (uint64_t)v4, (uint64_t)v11);
    uint64_t v9 = qword_26B3549D8;
    if (os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      objc_super v13 = "-[SEMSandboxIndexSiteCache spoofUserVaultUnavailableSoonForPersonaIdentifier:]";
      __int16 v14 = 2112;
      id v15 = v8;
      _os_log_impl(&dword_25C7CA000, v9, OS_LOG_TYPE_INFO, "%s Signaled unavailable soon for spoofed UserVault: %@", buf, 0x16u);
    }
  }
  else
  {
    uint64_t v10 = qword_26B3549D8;
    if (os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      objc_super v13 = "-[SEMSandboxIndexSiteCache spoofUserVaultUnavailableSoonForPersonaIdentifier:]";
      __int16 v14 = 2112;
      id v15 = v4;
      _os_log_error_impl(&dword_25C7CA000, v10, OS_LOG_TYPE_ERROR, "%s No spoofed UserVault has been created for persona: %@", buf, 0x16u);
    }
  }
}

- (void)spoofUserVaultUnavailableForPersonaIdentifier:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v9 = objc_msgSend_objectForKey_(self->_personaToUserVaultDirectoryMap, v5, (uint64_t)v4, v6);
  if (v9)
  {
    objc_msgSend_removeObjectForKey_(self->_personaToUserVaultDirectoryMap, v7, (uint64_t)v4, v8);
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = sub_25C8081B0;
    v13[3] = &unk_2654DE398;
    v13[4] = self;
    objc_msgSend_runAsPersonaIdentifier_block_(SEMPersonaUtilities, v10, (uint64_t)v4, (uint64_t)v13);
    uint64_t v11 = qword_26B3549D8;
    if (os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      id v15 = "-[SEMSandboxIndexSiteCache spoofUserVaultUnavailableForPersonaIdentifier:]";
      __int16 v16 = 2112;
      id v17 = v9;
      _os_log_impl(&dword_25C7CA000, v11, OS_LOG_TYPE_INFO, "%s Fully removed spoofed UserVault: %@", buf, 0x16u);
    }
  }
  else
  {
    v12 = qword_26B3549D8;
    if (os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      id v15 = "-[SEMSandboxIndexSiteCache spoofUserVaultUnavailableForPersonaIdentifier:]";
      __int16 v16 = 2112;
      id v17 = v4;
      _os_log_error_impl(&dword_25C7CA000, v12, OS_LOG_TYPE_ERROR, "%s No spoofed UserVault has been created for persona: %@", buf, 0x16u);
    }
  }
}

- (void).cxx_destruct
{
}

@end
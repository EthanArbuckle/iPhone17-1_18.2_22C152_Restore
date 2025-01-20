@interface PDSRegistrar
- (BOOL)addRegistration:(id)a3 toUser:(id)a4 error:(id *)a5;
- (BOOL)batchUpdateRegistrations:(id)a3 forUser:(id)a4 error:(id *)a5;
- (BOOL)deleteRegistration:(id)a3 fromUser:(id)a4 error:(id *)a5;
- (BOOL)ensureRegistrationPresent:(id)a3 forUser:(id)a4 error:(id *)a5;
- (BOOL)removeAllRegistrationsFromUser:(id)a3 error:(id *)a4;
- (BOOL)removeRegistration:(id)a3 fromUser:(id)a4 error:(id *)a5;
- (NSString)clientID;
- (PDSRegistrar)initWithClientID:(id)a3 error:(id *)a4;
- (PDSRemoteVendor)remoteVendor;
- (id)_activeRegistrationsFromEntries:(id)a3;
- (id)_registrationsFromEntries:(id)a3;
- (id)_wrappedErrorForFailedRemote:(id)a3;
- (id)_wrappedErrorForGivenError:(id)a3 XPCError:(id)a4;
- (id)activeUsersWithError:(id *)a3;
- (id)allEntriesWithError:(id *)a3;
- (id)allRegistrationsForUser:(id)a3 error:(id *)a4;
- (id)allRegistrationsWithError:(id *)a3;
- (id)currentRegistrationsForUser:(id)a3 error:(id *)a4;
- (id)description;
- (id)usersWithError:(id *)a3;
- (void)activeUsersWithCompletion:(id)a3;
- (void)allEntriesWithCompletion:(id)a3;
- (void)allRegistrationsForUser:(id)a3 completion:(id)a4;
- (void)allRegistrationsWithCompletion:(id)a3;
- (void)currentRegistrationsForUser:(id)a3 completion:(id)a4;
- (void)setClientID:(id)a3;
- (void)setRemoteVendor:(id)a3;
- (void)usersWithCompletion:(id)a3;
@end

@implementation PDSRegistrar

- (id)activeUsersWithError:(id *)a3
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  v5 = pds_defaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = self;
    _os_log_impl(&dword_21E879000, v5, OS_LOG_TYPE_DEFAULT, "PDSRegistrar activeUsersWithError {self: %@}", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v37 = 0x3032000000;
  v38 = __Block_byref_object_copy__0;
  v39 = __Block_byref_object_dispose__0;
  id v40 = 0;
  remoteVendor = self->_remoteVendor;
  v29[0] = MEMORY[0x263EF8330];
  v29[1] = 3221225472;
  v29[2] = __37__PDSRegistrar_activeUsersWithError___block_invoke;
  v29[3] = &unk_2644CC2A0;
  v29[4] = &buf;
  v7 = [(PDSRemoteVendor *)remoteVendor synchronousRemoteObjectProxyWithErrorHandler:v29];
  uint64_t v23 = 0;
  v24 = &v23;
  uint64_t v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__0;
  v27 = __Block_byref_object_dispose__0;
  id v28 = 0;
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__0;
  v21 = __Block_byref_object_dispose__0;
  id v22 = 0;
  if (v7)
  {
    v8 = [(PDSRegistrar *)self clientID];
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __37__PDSRegistrar_activeUsersWithError___block_invoke_2;
    v16[3] = &unk_2644CC368;
    v16[4] = &v23;
    v16[5] = &v17;
    [v7 activeUsersWithClientID:v8 withCompletion:v16];

    uint64_t v9 = v24[5];
  }
  else
  {
    uint64_t v9 = 0;
  }
  v10 = [(PDSRegistrar *)self _wrappedErrorForGivenError:v9 XPCError:*(void *)(*((void *)&buf + 1) + 40)];
  v11 = v10;
  if (a3 && v10) {
    *a3 = v10;
  }
  v12 = pds_defaultLog();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v13 = v18[5];
    *(_DWORD *)v30 = 138412802;
    v31 = self;
    __int16 v32 = 2112;
    v33 = v11;
    __int16 v34 = 2112;
    uint64_t v35 = v13;
    _os_log_impl(&dword_21E879000, v12, OS_LOG_TYPE_DEFAULT, "PDSRegistrar completed activeUsersWithError {self: %@, overallError: %@, response: %@}", v30, 0x20u);
  }

  id v14 = (id)v18[5];
  _Block_object_dispose(&v17, 8);

  _Block_object_dispose(&v23, 8);
  _Block_object_dispose(&buf, 8);

  return v14;
}

- (NSString)clientID
{
  return self->_clientID;
}

- (PDSRegistrar)initWithClientID:(id)a3 error:(id *)a4
{
  v36[1] = *MEMORY[0x263EF8340];
  id v8 = a3;
  if (!v8)
  {
    v26 = [MEMORY[0x263F08690] currentHandler];
    [v26 handleFailureInMethod:a2, self, @"PDSRegistrar.m", 25, @"Invalid parameter not satisfying: %@", @"clientID" object file lineNumber description];
  }
  v28.receiver = self;
  v28.super_class = (Class)PDSRegistrar;
  uint64_t v9 = [(PDSRegistrar *)&v28 init];
  if (v9)
  {
    uint64_t v10 = +[PDSRemoteRegistry remoteVendorForClientID:v8];
    remoteVendor = v9->_remoteVendor;
    v9->_remoteVendor = (PDSRemoteVendor *)v10;

    objc_storeStrong((id *)&v9->_clientID, a3);
    v12 = pds_defaultLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412290;
      v30 = v9;
      _os_log_impl(&dword_21E879000, v12, OS_LOG_TYPE_DEFAULT, "PDSRegistrar create {self: %@}", buf, 0xCu);
    }

    uint64_t v13 = v9->_remoteVendor;
    id v27 = 0;
    int v14 = [(PDSRemoteVendor *)v13 validateConnectionWithError:&v27];
    id v15 = v27;
    v16 = v15;
    if (v14)
    {
      uint64_t v17 = 0;
    }
    else
    {
      if (v15)
      {
        uint64_t v35 = *MEMORY[0x263F08608];
        v36[0] = v15;
        v18 = [NSDictionary dictionaryWithObjects:v36 forKeys:&v35 count:1];
      }
      else
      {
        v18 = 0;
      }
      uint64_t v19 = [v16 domain];
      int v20 = [v19 isEqualToString:PDSXPCErrorDomain];

      if (v20) {
        uint64_t v21 = -200;
      }
      else {
        uint64_t v21 = -201;
      }
      id v22 = [MEMORY[0x263F087E8] errorWithDomain:PDSRegistrarErrorDomain code:v21 userInfo:v18];
      uint64_t v17 = v22;
      if (a4) {
        *a4 = v22;
      }

      uint64_t v9 = 0;
    }
    uint64_t v23 = pds_defaultLog();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      v24 = "NO";
      *(_DWORD *)long long buf = 138412802;
      v30 = v9;
      if (v14) {
        v24 = "YES";
      }
      __int16 v31 = 2080;
      __int16 v32 = v24;
      __int16 v33 = 2112;
      __int16 v34 = v17;
      _os_log_impl(&dword_21E879000, v23, OS_LOG_TYPE_DEFAULT, "PDSRegistrar completed validation {self: %@, connected: %s, error: %@}", buf, 0x20u);
    }
  }
  return v9;
}

- (BOOL)addRegistration:(id)a3 toUser:(id)a4 error:(id *)a5
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  v11 = v10;
  if (v9)
  {
    if (v10) {
      goto LABEL_3;
    }
  }
  else
  {
    v24 = [MEMORY[0x263F08690] currentHandler];
    [v24 handleFailureInMethod:a2, self, @"PDSRegistrar.m", 59, @"Invalid parameter not satisfying: %@", @"registration" object file lineNumber description];

    if (v11) {
      goto LABEL_3;
    }
  }
  uint64_t v25 = [MEMORY[0x263F08690] currentHandler];
  [v25 handleFailureInMethod:a2, self, @"PDSRegistrar.m", 60, @"Invalid parameter not satisfying: %@", @"user" object file lineNumber description];

LABEL_3:
  v12 = pds_defaultLog();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412802;
    *(void *)&uint8_t buf[4] = v9;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v11;
    *(_WORD *)&buf[22] = 2112;
    v39 = self;
    _os_log_impl(&dword_21E879000, v12, OS_LOG_TYPE_DEFAULT, "PDSRegistrar addRegistration %@ for user %@ {self: %@}", buf, 0x20u);
  }

  *(void *)long long buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  v39 = (PDSRegistrar *)__Block_byref_object_copy__0;
  id v40 = __Block_byref_object_dispose__0;
  id v41 = 0;
  remoteVendor = self->_remoteVendor;
  v33[0] = MEMORY[0x263EF8330];
  v33[1] = 3221225472;
  v33[2] = __45__PDSRegistrar_addRegistration_toUser_error___block_invoke;
  v33[3] = &unk_2644CC2A0;
  v33[4] = buf;
  int v14 = [(PDSRemoteVendor *)remoteVendor synchronousRemoteObjectProxyWithErrorHandler:v33];
  uint64_t v27 = 0;
  objc_super v28 = &v27;
  uint64_t v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__0;
  __int16 v31 = __Block_byref_object_dispose__0;
  id v32 = 0;
  if (v14)
  {
    id v15 = [PDSEntry alloc];
    v16 = [(PDSRegistrar *)self clientID];
    uint64_t v17 = [(PDSEntry *)v15 initWithUser:v11 registration:v9 clientID:v16];

    v18 = [MEMORY[0x263EFFA08] setWithObject:v17];
    v26[0] = MEMORY[0x263EF8330];
    v26[1] = 3221225472;
    v26[2] = __45__PDSRegistrar_addRegistration_toUser_error___block_invoke_2;
    v26[3] = &unk_2644CC2A0;
    v26[4] = &v27;
    [v14 storeEntries:v18 deleteEntries:0 withCompletion:v26];

    uint64_t v19 = v28[5];
  }
  else
  {
    uint64_t v19 = 0;
  }
  int v20 = [(PDSRegistrar *)self _wrappedErrorForGivenError:v19 XPCError:*(void *)(*(void *)&buf[8] + 40)];
  uint64_t v21 = v20;
  if (a5 && v20) {
    *a5 = v20;
  }
  id v22 = pds_defaultLog();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)__int16 v34 = 138412546;
    uint64_t v35 = self;
    __int16 v36 = 2112;
    uint64_t v37 = v21;
    _os_log_impl(&dword_21E879000, v22, OS_LOG_TYPE_DEFAULT, "PDSRegistrar completed addRegistration {self: %@, overallError: %@}", v34, 0x16u);
  }

  _Block_object_dispose(&v27, 8);
  _Block_object_dispose(buf, 8);

  return v21 == 0;
}

void __45__PDSRegistrar_addRegistration_toUser_error___block_invoke(uint64_t a1, void *a2)
{
}

void __45__PDSRegistrar_addRegistration_toUser_error___block_invoke_2(uint64_t a1, void *a2)
{
}

- (BOOL)ensureRegistrationPresent:(id)a3 forUser:(id)a4 error:(id *)a5
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  v11 = v10;
  if (v9)
  {
    if (v10) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v29 = [MEMORY[0x263F08690] currentHandler];
    [v29 handleFailureInMethod:a2, self, @"PDSRegistrar.m", 85, @"Invalid parameter not satisfying: %@", @"registration" object file lineNumber description];

    if (v11) {
      goto LABEL_3;
    }
  }
  v30 = [MEMORY[0x263F08690] currentHandler];
  [v30 handleFailureInMethod:a2, self, @"PDSRegistrar.m", 86, @"Invalid parameter not satisfying: %@", @"user" object file lineNumber description];

LABEL_3:
  v12 = pds_defaultLog();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412802;
    *(void *)&uint8_t buf[4] = v9;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v11;
    *(_WORD *)&buf[22] = 2112;
    v44 = self;
    _os_log_impl(&dword_21E879000, v12, OS_LOG_TYPE_DEFAULT, "PDSRegistrar ensureRegistrationPresent %@ for user %@ {self: %@}", buf, 0x20u);
  }

  *(void *)long long buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  v44 = (PDSRegistrar *)__Block_byref_object_copy__0;
  v45 = __Block_byref_object_dispose__0;
  id v46 = 0;
  remoteVendor = self->_remoteVendor;
  v38[0] = MEMORY[0x263EF8330];
  v38[1] = 3221225472;
  v38[2] = __56__PDSRegistrar_ensureRegistrationPresent_forUser_error___block_invoke;
  v38[3] = &unk_2644CC2A0;
  v38[4] = buf;
  int v14 = [(PDSRemoteVendor *)remoteVendor synchronousRemoteObjectProxyWithErrorHandler:v38];
  uint64_t v32 = 0;
  __int16 v33 = &v32;
  uint64_t v34 = 0x3032000000;
  uint64_t v35 = __Block_byref_object_copy__0;
  __int16 v36 = __Block_byref_object_dispose__0;
  id v37 = 0;
  if (v14)
  {
    id v15 = [PDSEntry alloc];
    v16 = [(PDSRegistrar *)self clientID];
    uint64_t v17 = [(PDSEntry *)v15 initWithUser:v11 registration:v9 clientID:v16];

    v18 = [MEMORY[0x263EFFA08] setWithObject:v17];
    v31[0] = MEMORY[0x263EF8330];
    v31[1] = 3221225472;
    v31[2] = __56__PDSRegistrar_ensureRegistrationPresent_forUser_error___block_invoke_2;
    v31[3] = &unk_2644CC2A0;
    v31[4] = &v32;
    [v14 storeEntries:v18 deleteEntries:0 withCompletion:v31];

    uint64_t v19 = v33[5];
  }
  else
  {
    uint64_t v19 = 0;
  }
  int v20 = [(PDSRegistrar *)self _wrappedErrorForGivenError:v19 XPCError:*(void *)(*(void *)&buf[8] + 40)];
  uint64_t v21 = v20;
  if (v20)
  {
    id v22 = [v20 userInfo];
    uint64_t v23 = [v22 objectForKey:*MEMORY[0x263F08608]];

    if (v23)
    {
      v24 = [v23 domain];
      int v25 = [v24 isEqualToString:PDSCDCacheErrorDomain];

      if (v25)
      {
        uint64_t v26 = [v23 code];
        if (v26 == -402 || v26 == -400)
        {

          uint64_t v21 = 0;
        }
      }
    }
    if (a5) {
      *a5 = v21;
    }
  }
  uint64_t v27 = pds_defaultLog();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)v39 = 138412546;
    id v40 = self;
    __int16 v41 = 2112;
    uint64_t v42 = v21;
    _os_log_impl(&dword_21E879000, v27, OS_LOG_TYPE_DEFAULT, "PDSRegistrar completed ensureRegistrationPresent {self: %@, overallError: %@}", v39, 0x16u);
  }

  _Block_object_dispose(&v32, 8);
  _Block_object_dispose(buf, 8);

  return v21 == 0;
}

void __56__PDSRegistrar_ensureRegistrationPresent_forUser_error___block_invoke(uint64_t a1, void *a2)
{
}

void __56__PDSRegistrar_ensureRegistrationPresent_forUser_error___block_invoke_2(uint64_t a1, void *a2)
{
}

- (BOOL)batchUpdateRegistrations:(id)a3 forUser:(id)a4 error:(id *)a5
{
  uint64_t v57 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  __int16 v33 = v8;
  if (!v8)
  {
    id v28 = v9;
    uint64_t v29 = [MEMORY[0x263F08690] currentHandler];
    [v29 handleFailureInMethod:a2, self, @"PDSRegistrar.m", 135, @"Invalid parameter not satisfying: %@", @"registrations" object file lineNumber description];

    id v9 = v28;
  }
  uint64_t v34 = v9;
  if (!v9)
  {
    v30 = [MEMORY[0x263F08690] currentHandler];
    [v30 handleFailureInMethod:a2, self, @"PDSRegistrar.m", 136, @"Invalid parameter not satisfying: %@", @"user" object file lineNumber description];
  }
  id v10 = pds_defaultLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = self;
    _os_log_impl(&dword_21E879000, v10, OS_LOG_TYPE_DEFAULT, "PDSRegistrar batchUpdateRegistrations {self: %@}", (uint8_t *)&buf, 0xCu);
  }

  v11 = pds_oversizedLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v33;
    _os_log_impl(&dword_21E879000, v11, OS_LOG_TYPE_DEFAULT, "Batch Registrations: %@", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v53 = 0x3032000000;
  v54 = __Block_byref_object_copy__0;
  v55 = __Block_byref_object_dispose__0;
  id v56 = 0;
  remoteVendor = self->_remoteVendor;
  v46[0] = MEMORY[0x263EF8330];
  v46[1] = 3221225472;
  v46[2] = __55__PDSRegistrar_batchUpdateRegistrations_forUser_error___block_invoke;
  v46[3] = &unk_2644CC2A0;
  v46[4] = &buf;
  [(PDSRemoteVendor *)remoteVendor synchronousRemoteObjectProxyWithErrorHandler:v46];
  uint64_t v40 = 0;
  __int16 v41 = &v40;
  uint64_t v42 = 0x3032000000;
  v43 = __Block_byref_object_copy__0;
  v44 = __Block_byref_object_dispose__0;
  uint64_t v32 = v45 = 0;
  if (v32)
  {
    id v13 = objc_alloc_init(MEMORY[0x263EFF9C0]);
    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    id v14 = v33;
    uint64_t v15 = [v14 countByEnumeratingWithState:&v36 objects:v51 count:16];
    if (v15)
    {
      uint64_t v16 = *(void *)v37;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v37 != v16) {
            objc_enumerationMutation(v14);
          }
          uint64_t v18 = *(void *)(*((void *)&v36 + 1) + 8 * i);
          uint64_t v19 = [PDSEntry alloc];
          int v20 = [(PDSRegistrar *)self clientID];
          uint64_t v21 = [(PDSEntry *)v19 initWithUser:v34 registration:v18 clientID:v20];

          [v13 addObject:v21];
        }
        uint64_t v15 = [v14 countByEnumeratingWithState:&v36 objects:v51 count:16];
      }
      while (v15);
    }

    id v22 = [(PDSRegistrar *)self clientID];
    v35[0] = MEMORY[0x263EF8330];
    v35[1] = 3221225472;
    v35[2] = __55__PDSRegistrar_batchUpdateRegistrations_forUser_error___block_invoke_2;
    v35[3] = &unk_2644CC2A0;
    v35[4] = &v40;
    [v32 batchUpdateEntries:v13 forClientID:v22 withCompletion:v35];

    uint64_t v23 = v41[5];
  }
  else
  {
    uint64_t v23 = 0;
  }
  v24 = [(PDSRegistrar *)self _wrappedErrorForGivenError:v23 XPCError:*(void *)(*((void *)&buf + 1) + 40)];
  int v25 = v24;
  if (a5 && v24) {
    *a5 = v24;
  }
  uint64_t v26 = pds_defaultLog();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)uint64_t v47 = 138412546;
    v48 = self;
    __int16 v49 = 2112;
    v50 = v25;
    _os_log_impl(&dword_21E879000, v26, OS_LOG_TYPE_DEFAULT, "PDSRegistrar completed batchUpdateRegistrations {self: %@, overallError: %@}", v47, 0x16u);
  }

  _Block_object_dispose(&v40, 8);
  _Block_object_dispose(&buf, 8);

  return v25 == 0;
}

void __55__PDSRegistrar_batchUpdateRegistrations_forUser_error___block_invoke(uint64_t a1, void *a2)
{
}

void __55__PDSRegistrar_batchUpdateRegistrations_forUser_error___block_invoke_2(uint64_t a1, void *a2)
{
}

- (BOOL)removeRegistration:(id)a3 fromUser:(id)a4 error:(id *)a5
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = (uint64_t (*)(uint64_t, uint64_t))a4;
  v11 = v10;
  if (v9)
  {
    if (v10) {
      goto LABEL_3;
    }
  }
  else
  {
    v24 = [MEMORY[0x263F08690] currentHandler];
    [v24 handleFailureInMethod:a2, self, @"PDSRegistrar.m", 168, @"Invalid parameter not satisfying: %@", @"registration" object file lineNumber description];

    if (v11) {
      goto LABEL_3;
    }
  }
  int v25 = [MEMORY[0x263F08690] currentHandler];
  [v25 handleFailureInMethod:a2, self, @"PDSRegistrar.m", 169, @"Invalid parameter not satisfying: %@", @"user" object file lineNumber description];

LABEL_3:
  v12 = pds_defaultLog();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412802;
    *(void *)&uint8_t buf[4] = self;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v9;
    *(_WORD *)&buf[22] = 2112;
    long long v39 = v11;
    _os_log_impl(&dword_21E879000, v12, OS_LOG_TYPE_DEFAULT, "PDSRegistrar removeRegistration {self: %@, registration: %@, user: %@}", buf, 0x20u);
  }

  *(void *)long long buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  long long v39 = __Block_byref_object_copy__0;
  uint64_t v40 = __Block_byref_object_dispose__0;
  id v41 = 0;
  remoteVendor = self->_remoteVendor;
  v33[0] = MEMORY[0x263EF8330];
  v33[1] = 3221225472;
  v33[2] = __50__PDSRegistrar_removeRegistration_fromUser_error___block_invoke;
  v33[3] = &unk_2644CC2A0;
  v33[4] = buf;
  id v14 = [(PDSRemoteVendor *)remoteVendor synchronousRemoteObjectProxyWithErrorHandler:v33];
  uint64_t v27 = 0;
  id v28 = &v27;
  uint64_t v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__0;
  __int16 v31 = __Block_byref_object_dispose__0;
  id v32 = 0;
  if (v14)
  {
    uint64_t v15 = [PDSEntry alloc];
    uint64_t v16 = [(PDSRegistrar *)self clientID];
    uint64_t v17 = [(PDSEntry *)v15 initWithUser:v11 registration:v9 clientID:v16 state:2];

    uint64_t v18 = [MEMORY[0x263EFFA08] setWithObject:v17];
    v26[0] = MEMORY[0x263EF8330];
    v26[1] = 3221225472;
    v26[2] = __50__PDSRegistrar_removeRegistration_fromUser_error___block_invoke_2;
    v26[3] = &unk_2644CC2A0;
    v26[4] = &v27;
    [v14 storeEntries:v18 deleteEntries:0 withCompletion:v26];

    uint64_t v19 = v28[5];
  }
  else
  {
    uint64_t v19 = 0;
  }
  int v20 = [(PDSRegistrar *)self _wrappedErrorForGivenError:v19 XPCError:*(void *)(*(void *)&buf[8] + 40)];
  uint64_t v21 = v20;
  if (a5 && v20) {
    *a5 = v20;
  }
  id v22 = pds_defaultLog();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)uint64_t v34 = 138412546;
    uint64_t v35 = self;
    __int16 v36 = 2112;
    long long v37 = v21;
    _os_log_impl(&dword_21E879000, v22, OS_LOG_TYPE_DEFAULT, "PDSRegistrar completed removeRegistration {self: %@, overallError: %@}", v34, 0x16u);
  }

  _Block_object_dispose(&v27, 8);
  _Block_object_dispose(buf, 8);

  return v21 == 0;
}

void __50__PDSRegistrar_removeRegistration_fromUser_error___block_invoke(uint64_t a1, void *a2)
{
}

void __50__PDSRegistrar_removeRegistration_fromUser_error___block_invoke_2(uint64_t a1, void *a2)
{
}

- (BOOL)removeAllRegistrationsFromUser:(id)a3 error:(id *)a4
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v7 = a3;
  if (!v7)
  {
    uint64_t v17 = [MEMORY[0x263F08690] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"PDSRegistrar.m", 194, @"Invalid parameter not satisfying: %@", @"user" object file lineNumber description];
  }
  id v8 = pds_defaultLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412546;
    *(void *)&uint8_t buf[4] = self;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v7;
    _os_log_impl(&dword_21E879000, v8, OS_LOG_TYPE_DEFAULT, "PDSRegistrar removeAllRegistrations {self: %@, user: %@}", buf, 0x16u);
  }

  *(void *)long long buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  __int16 v31 = __Block_byref_object_copy__0;
  id v32 = __Block_byref_object_dispose__0;
  id v33 = 0;
  remoteVendor = self->_remoteVendor;
  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = __53__PDSRegistrar_removeAllRegistrationsFromUser_error___block_invoke;
  v25[3] = &unk_2644CC2A0;
  v25[4] = buf;
  id v10 = [(PDSRemoteVendor *)remoteVendor synchronousRemoteObjectProxyWithErrorHandler:v25];
  uint64_t v19 = 0;
  int v20 = &v19;
  uint64_t v21 = 0x3032000000;
  id v22 = __Block_byref_object_copy__0;
  uint64_t v23 = __Block_byref_object_dispose__0;
  id v24 = 0;
  if (v10)
  {
    v11 = [(PDSRegistrar *)self clientID];
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __53__PDSRegistrar_removeAllRegistrationsFromUser_error___block_invoke_2;
    v18[3] = &unk_2644CC2A0;
    v18[4] = &v19;
    [v10 removeAllEntriesForUser:v7 withClientID:v11 withCompletion:v18];

    uint64_t v12 = v20[5];
  }
  else
  {
    uint64_t v12 = 0;
  }
  id v13 = [(PDSRegistrar *)self _wrappedErrorForGivenError:v12 XPCError:*(void *)(*(void *)&buf[8] + 40)];
  id v14 = v13;
  if (a4 && v13) {
    *a4 = v13;
  }
  uint64_t v15 = pds_defaultLog();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)uint64_t v26 = 138412546;
    uint64_t v27 = self;
    __int16 v28 = 2112;
    uint64_t v29 = v14;
    _os_log_impl(&dword_21E879000, v15, OS_LOG_TYPE_DEFAULT, "PDSRegistrar completed removeAllRegistrations {self: %@, overallError: %@}", v26, 0x16u);
  }

  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(buf, 8);

  return v14 == 0;
}

void __53__PDSRegistrar_removeAllRegistrationsFromUser_error___block_invoke(uint64_t a1, void *a2)
{
}

void __53__PDSRegistrar_removeAllRegistrationsFromUser_error___block_invoke_2(uint64_t a1, void *a2)
{
}

- (id)currentRegistrationsForUser:(id)a3 error:(id *)a4
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v7 = a3;
  if (!v7)
  {
    uint64_t v19 = [MEMORY[0x263F08690] currentHandler];
    [v19 handleFailureInMethod:a2, self, @"PDSRegistrar.m", 218, @"Invalid parameter not satisfying: %@", @"user" object file lineNumber description];
  }
  id v8 = pds_defaultLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412546;
    *(void *)&uint8_t buf[4] = self;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v7;
    _os_log_impl(&dword_21E879000, v8, OS_LOG_TYPE_DEFAULT, "PDSRegistrar currentRegistrationsForUser {self: %@, user: %@}", buf, 0x16u);
  }

  *(void *)long long buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  id v41 = __Block_byref_object_copy__0;
  uint64_t v42 = __Block_byref_object_dispose__0;
  id v43 = 0;
  remoteVendor = self->_remoteVendor;
  v33[0] = MEMORY[0x263EF8330];
  v33[1] = 3221225472;
  v33[2] = __50__PDSRegistrar_currentRegistrationsForUser_error___block_invoke;
  v33[3] = &unk_2644CC2A0;
  v33[4] = buf;
  id v10 = [(PDSRemoteVendor *)remoteVendor synchronousRemoteObjectProxyWithErrorHandler:v33];
  uint64_t v27 = 0;
  __int16 v28 = &v27;
  uint64_t v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__0;
  __int16 v31 = __Block_byref_object_dispose__0;
  id v32 = 0;
  uint64_t v21 = 0;
  id v22 = &v21;
  uint64_t v23 = 0x3032000000;
  id v24 = __Block_byref_object_copy__0;
  int v25 = __Block_byref_object_dispose__0;
  id v26 = 0;
  if (v10)
  {
    v11 = [(PDSRegistrar *)self clientID];
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __50__PDSRegistrar_currentRegistrationsForUser_error___block_invoke_2;
    v20[3] = &unk_2644CC318;
    v20[4] = self;
    v20[5] = &v21;
    v20[6] = &v27;
    [v10 entriesForUser:v7 clientID:v11 withCompletion:v20];

    uint64_t v12 = v28[5];
  }
  else
  {
    uint64_t v12 = 0;
  }
  id v13 = [(PDSRegistrar *)self _wrappedErrorForGivenError:v12 XPCError:*(void *)(*(void *)&buf[8] + 40)];
  id v14 = v13;
  if (a4 && v13) {
    *a4 = v13;
  }
  uint64_t v15 = pds_defaultLog();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v16 = v22[5];
    *(_DWORD *)uint64_t v34 = 138412802;
    uint64_t v35 = self;
    __int16 v36 = 2112;
    long long v37 = v14;
    __int16 v38 = 2112;
    uint64_t v39 = v16;
    _os_log_impl(&dword_21E879000, v15, OS_LOG_TYPE_DEFAULT, "PDSRegistrar completed currentRegistrationsForUser {self: %@, overallError: %@, response: %@}", v34, 0x20u);
  }

  id v17 = (id)v22[5];
  _Block_object_dispose(&v21, 8);

  _Block_object_dispose(&v27, 8);
  _Block_object_dispose(buf, 8);

  return v17;
}

void __50__PDSRegistrar_currentRegistrationsForUser_error___block_invoke(uint64_t a1, void *a2)
{
}

void __50__PDSRegistrar_currentRegistrationsForUser_error___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = [*(id *)(a1 + 32) _activeRegistrationsFromEntries:a2];
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;

  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v5;
}

- (void)currentRegistrationsForUser:(id)a3 completion:(id)a4
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = (void (**)(void, void, void))v8;
  if (v7)
  {
    if (v8) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v16 = [MEMORY[0x263F08690] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"PDSRegistrar.m", 244, @"Invalid parameter not satisfying: %@", @"user" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
  }
  id v17 = [MEMORY[0x263F08690] currentHandler];
  [v17 handleFailureInMethod:a2, self, @"PDSRegistrar.m", 245, @"Invalid parameter not satisfying: %@", @"completion" object file lineNumber description];

LABEL_3:
  id v10 = pds_defaultLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412546;
    id v22 = self;
    __int16 v23 = 2112;
    id v24 = v7;
    _os_log_impl(&dword_21E879000, v10, OS_LOG_TYPE_DEFAULT, "PDSRegistrar async currentRegistrationsForUser {self: %@, user: %@}", buf, 0x16u);
  }

  remoteVendor = self->_remoteVendor;
  id v20 = 0;
  uint64_t v12 = [(PDSRemoteVendor *)remoteVendor remoteObjectProxyWithError:&v20];
  id v13 = v20;
  if (v12)
  {
    id v14 = [(PDSRegistrar *)self clientID];
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __55__PDSRegistrar_currentRegistrationsForUser_completion___block_invoke;
    v18[3] = &unk_2644CC340;
    v18[4] = self;
    uint64_t v19 = v9;
    [v12 entriesForUser:v7 clientID:v14 withCompletion:v18];
  }
  else
  {
    uint64_t v15 = [(PDSRegistrar *)self _wrappedErrorForFailedRemote:v13];
    v9[2](v9, 0, v15);

    id v13 = (id)v15;
  }
}

void __55__PDSRegistrar_currentRegistrationsForUser_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = pds_defaultLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = *(void *)(a1 + 32);
    int v12 = 138412802;
    uint64_t v13 = v8;
    __int16 v14 = 2112;
    id v15 = v6;
    __int16 v16 = 2112;
    id v17 = v5;
    _os_log_impl(&dword_21E879000, v7, OS_LOG_TYPE_DEFAULT, "PDSRegistrar completed async currentRegistrationsForUser {self: %@, error: %@, response: %@}", (uint8_t *)&v12, 0x20u);
  }

  uint64_t v9 = *(void *)(a1 + 40);
  id v10 = [*(id *)(a1 + 32) _activeRegistrationsFromEntries:v5];
  v11 = [*(id *)(a1 + 32) _wrappedErrorForGivenError:v6 XPCError:0];
  (*(void (**)(uint64_t, void *, void *))(v9 + 16))(v9, v10, v11);
}

void __37__PDSRegistrar_activeUsersWithError___block_invoke(uint64_t a1, void *a2)
{
}

void __37__PDSRegistrar_activeUsersWithError___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
  id v8 = a3;
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

- (void)activeUsersWithCompletion:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (!v5)
  {
    int v12 = [MEMORY[0x263F08690] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"PDSRegistrar.m", 287, @"Invalid parameter not satisfying: %@", @"completion" object file lineNumber description];
  }
  uint64_t v6 = pds_defaultLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412290;
    id v17 = self;
    _os_log_impl(&dword_21E879000, v6, OS_LOG_TYPE_DEFAULT, "PDSRegistrar async activeUsersWithError {self: %@}", buf, 0xCu);
  }

  remoteVendor = self->_remoteVendor;
  id v15 = 0;
  id v8 = [(PDSRemoteVendor *)remoteVendor remoteObjectProxyWithError:&v15];
  id v9 = v15;
  if (v8)
  {
    id v10 = [(PDSRegistrar *)self clientID];
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __42__PDSRegistrar_activeUsersWithCompletion___block_invoke;
    v13[3] = &unk_2644CC340;
    v13[4] = self;
    id v14 = v5;
    [v8 activeUsersWithClientID:v10 withCompletion:v13];
  }
  else
  {
    uint64_t v11 = [(PDSRegistrar *)self _wrappedErrorForFailedRemote:v9];
    (*((void (**)(id, void, uint64_t))v5 + 2))(v5, 0, v11);

    id v9 = (id)v11;
  }
}

void __42__PDSRegistrar_activeUsersWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = pds_defaultLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = *(void *)(a1 + 32);
    int v11 = 138412802;
    uint64_t v12 = v8;
    __int16 v13 = 2112;
    id v14 = v6;
    __int16 v15 = 2112;
    id v16 = v5;
    _os_log_impl(&dword_21E879000, v7, OS_LOG_TYPE_DEFAULT, "PDSRegistrar completed async activeUsersWithError {self: %@, error: %@, response: %@}", (uint8_t *)&v11, 0x20u);
  }

  uint64_t v9 = *(void *)(a1 + 40);
  id v10 = [*(id *)(a1 + 32) _wrappedErrorForGivenError:v6 XPCError:0];
  (*(void (**)(uint64_t, id, void *))(v9 + 16))(v9, v5, v10);
}

- (id)usersWithError:(id *)a3
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v5 = pds_defaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = self;
    _os_log_impl(&dword_21E879000, v5, OS_LOG_TYPE_DEFAULT, "PDSRegistrar usersWithError {self: %@}", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v37 = 0x3032000000;
  __int16 v38 = __Block_byref_object_copy__0;
  uint64_t v39 = __Block_byref_object_dispose__0;
  id v40 = 0;
  remoteVendor = self->_remoteVendor;
  v29[0] = MEMORY[0x263EF8330];
  v29[1] = 3221225472;
  v29[2] = __31__PDSRegistrar_usersWithError___block_invoke;
  v29[3] = &unk_2644CC2A0;
  v29[4] = &buf;
  id v7 = [(PDSRemoteVendor *)remoteVendor synchronousRemoteObjectProxyWithErrorHandler:v29];
  uint64_t v23 = 0;
  id v24 = &v23;
  uint64_t v25 = 0x3032000000;
  id v26 = __Block_byref_object_copy__0;
  uint64_t v27 = __Block_byref_object_dispose__0;
  id v28 = 0;
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x3032000000;
  id v20 = __Block_byref_object_copy__0;
  uint64_t v21 = __Block_byref_object_dispose__0;
  id v22 = 0;
  if (v7)
  {
    uint64_t v8 = [(PDSRegistrar *)self clientID];
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __31__PDSRegistrar_usersWithError___block_invoke_2;
    v16[3] = &unk_2644CC368;
    v16[4] = &v23;
    v16[5] = &v17;
    [v7 usersWithClientID:v8 withCompletion:v16];

    uint64_t v9 = v24[5];
  }
  else
  {
    uint64_t v9 = 0;
  }
  id v10 = [(PDSRegistrar *)self _wrappedErrorForGivenError:v9 XPCError:*(void *)(*((void *)&buf + 1) + 40)];
  int v11 = v10;
  if (a3 && v10) {
    *a3 = v10;
  }
  uint64_t v12 = pds_defaultLog();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v13 = v18[5];
    *(_DWORD *)v30 = 138412802;
    __int16 v31 = self;
    __int16 v32 = 2112;
    id v33 = v11;
    __int16 v34 = 2112;
    uint64_t v35 = v13;
    _os_log_impl(&dword_21E879000, v12, OS_LOG_TYPE_DEFAULT, "PDSRegistrar completed usersWithError {self: %@, overallError: %@, response: %@}", v30, 0x20u);
  }

  id v14 = (id)v18[5];
  _Block_object_dispose(&v17, 8);

  _Block_object_dispose(&v23, 8);
  _Block_object_dispose(&buf, 8);

  return v14;
}

void __31__PDSRegistrar_usersWithError___block_invoke(uint64_t a1, void *a2)
{
}

void __31__PDSRegistrar_usersWithError___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
  id v8 = a3;
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

- (void)usersWithCompletion:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v5 = a3;
  uint64_t v6 = pds_defaultLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412290;
    uint64_t v17 = self;
    _os_log_impl(&dword_21E879000, v6, OS_LOG_TYPE_DEFAULT, "PDSRegistrar async usersWithError {self: %@}", buf, 0xCu);
  }

  if (!v5)
  {
    uint64_t v12 = [MEMORY[0x263F08690] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"PDSRegistrar.m", 332, @"Invalid parameter not satisfying: %@", @"completion" object file lineNumber description];
  }
  remoteVendor = self->_remoteVendor;
  id v15 = 0;
  id v8 = [(PDSRemoteVendor *)remoteVendor remoteObjectProxyWithError:&v15];
  id v9 = v15;
  if (v8)
  {
    id v10 = [(PDSRegistrar *)self clientID];
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __36__PDSRegistrar_usersWithCompletion___block_invoke;
    v13[3] = &unk_2644CC340;
    v13[4] = self;
    id v14 = v5;
    [v8 usersWithClientID:v10 withCompletion:v13];
  }
  else
  {
    uint64_t v11 = [(PDSRegistrar *)self _wrappedErrorForFailedRemote:v9];
    (*((void (**)(id, void, uint64_t))v5 + 2))(v5, 0, v11);

    id v9 = (id)v11;
  }
}

void __36__PDSRegistrar_usersWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = pds_defaultLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = *(void *)(a1 + 32);
    int v11 = 138412802;
    uint64_t v12 = v8;
    __int16 v13 = 2112;
    id v14 = v6;
    __int16 v15 = 2112;
    id v16 = v5;
    _os_log_impl(&dword_21E879000, v7, OS_LOG_TYPE_DEFAULT, "PDSRegistrar completed async usersWithError {self: %@, error: %@, response: %@}", (uint8_t *)&v11, 0x20u);
  }

  uint64_t v9 = *(void *)(a1 + 40);
  id v10 = [*(id *)(a1 + 32) _wrappedErrorForGivenError:v6 XPCError:0];
  (*(void (**)(uint64_t, id, void *))(v9 + 16))(v9, v5, v10);
}

- (id)allRegistrationsForUser:(id)a3 error:(id *)a4
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v7 = a3;
  if (!v7)
  {
    uint64_t v19 = [MEMORY[0x263F08690] currentHandler];
    [v19 handleFailureInMethod:a2, self, @"PDSRegistrar.m", 346, @"Invalid parameter not satisfying: %@", @"user" object file lineNumber description];
  }
  uint64_t v8 = pds_defaultLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412546;
    *(void *)&uint8_t buf[4] = self;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v7;
    _os_log_impl(&dword_21E879000, v8, OS_LOG_TYPE_DEFAULT, "PDSRegistrar allRegistrationsForUser {self: %@, user: %@}", buf, 0x16u);
  }

  *(void *)long long buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  uint64_t v41 = __Block_byref_object_copy__0;
  uint64_t v42 = __Block_byref_object_dispose__0;
  id v43 = 0;
  remoteVendor = self->_remoteVendor;
  v33[0] = MEMORY[0x263EF8330];
  v33[1] = 3221225472;
  v33[2] = __46__PDSRegistrar_allRegistrationsForUser_error___block_invoke;
  v33[3] = &unk_2644CC2A0;
  v33[4] = buf;
  id v10 = [(PDSRemoteVendor *)remoteVendor synchronousRemoteObjectProxyWithErrorHandler:v33];
  uint64_t v27 = 0;
  id v28 = &v27;
  uint64_t v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__0;
  __int16 v31 = __Block_byref_object_dispose__0;
  id v32 = 0;
  uint64_t v21 = 0;
  id v22 = &v21;
  uint64_t v23 = 0x3032000000;
  id v24 = __Block_byref_object_copy__0;
  uint64_t v25 = __Block_byref_object_dispose__0;
  id v26 = 0;
  if (v10)
  {
    int v11 = [(PDSRegistrar *)self clientID];
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __46__PDSRegistrar_allRegistrationsForUser_error___block_invoke_2;
    v20[3] = &unk_2644CC318;
    v20[4] = self;
    v20[5] = &v21;
    v20[6] = &v27;
    [v10 entriesForUser:v7 clientID:v11 withCompletion:v20];

    uint64_t v12 = v28[5];
  }
  else
  {
    uint64_t v12 = 0;
  }
  __int16 v13 = [(PDSRegistrar *)self _wrappedErrorForGivenError:v12 XPCError:*(void *)(*(void *)&buf[8] + 40)];
  id v14 = v13;
  if (a4 && v13) {
    *a4 = v13;
  }
  __int16 v15 = pds_defaultLog();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v16 = v22[5];
    *(_DWORD *)__int16 v34 = 138412802;
    uint64_t v35 = self;
    __int16 v36 = 2112;
    uint64_t v37 = v14;
    __int16 v38 = 2112;
    uint64_t v39 = v16;
    _os_log_impl(&dword_21E879000, v15, OS_LOG_TYPE_DEFAULT, "PDSRegistrar completed allRegistrationsForUser {self: %@, overallError: %@, response: %@}", v34, 0x20u);
  }

  id v17 = (id)v22[5];
  _Block_object_dispose(&v21, 8);

  _Block_object_dispose(&v27, 8);
  _Block_object_dispose(buf, 8);

  return v17;
}

void __46__PDSRegistrar_allRegistrationsForUser_error___block_invoke(uint64_t a1, void *a2)
{
}

void __46__PDSRegistrar_allRegistrationsForUser_error___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = [*(id *)(a1 + 32) _registrationsFromEntries:a2];
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;

  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v5;
}

- (void)allRegistrationsForUser:(id)a3 completion:(id)a4
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = (void (**)(void, void, void))v8;
  if (v7)
  {
    if (v8) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v16 = [MEMORY[0x263F08690] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"PDSRegistrar.m", 372, @"Invalid parameter not satisfying: %@", @"user" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
  }
  id v17 = [MEMORY[0x263F08690] currentHandler];
  [v17 handleFailureInMethod:a2, self, @"PDSRegistrar.m", 373, @"Invalid parameter not satisfying: %@", @"completion" object file lineNumber description];

  uint64_t v18 = [MEMORY[0x263F08690] currentHandler];
  [v18 handleFailureInMethod:a2, self, @"PDSRegistrar.m", 374, @"Invalid parameter not satisfying: %@", @"completion" object file lineNumber description];

LABEL_3:
  id v10 = pds_defaultLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412546;
    uint64_t v23 = self;
    __int16 v24 = 2112;
    id v25 = v7;
    _os_log_impl(&dword_21E879000, v10, OS_LOG_TYPE_DEFAULT, "PDSRegistrar async allRegistrationsForUser {self: %@, user: %@}", buf, 0x16u);
  }

  remoteVendor = self->_remoteVendor;
  id v21 = 0;
  uint64_t v12 = [(PDSRemoteVendor *)remoteVendor remoteObjectProxyWithError:&v21];
  id v13 = v21;
  if (v12)
  {
    id v14 = [(PDSRegistrar *)self clientID];
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __51__PDSRegistrar_allRegistrationsForUser_completion___block_invoke;
    v19[3] = &unk_2644CC340;
    v19[4] = self;
    id v20 = v9;
    [v12 entriesForUser:v7 clientID:v14 withCompletion:v19];
  }
  else
  {
    uint64_t v15 = [(PDSRegistrar *)self _wrappedErrorForFailedRemote:v13];
    v9[2](v9, 0, v15);

    id v13 = (id)v15;
  }
}

void __51__PDSRegistrar_allRegistrationsForUser_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = pds_defaultLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = *(void *)(a1 + 32);
    int v12 = 138412802;
    uint64_t v13 = v8;
    __int16 v14 = 2112;
    id v15 = v6;
    __int16 v16 = 2112;
    id v17 = v5;
    _os_log_impl(&dword_21E879000, v7, OS_LOG_TYPE_DEFAULT, "PDSRegistrar completed async allRegistrationsForUser {self: %@, error: %@, response: %@}", (uint8_t *)&v12, 0x20u);
  }

  uint64_t v9 = *(void *)(a1 + 40);
  id v10 = [*(id *)(a1 + 32) _registrationsFromEntries:v5];
  int v11 = [*(id *)(a1 + 32) _wrappedErrorForGivenError:v6 XPCError:0];
  (*(void (**)(uint64_t, void *, void *))(v9 + 16))(v9, v10, v11);
}

- (id)allRegistrationsWithError:(id *)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v5 = pds_defaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412290;
    id v10 = self;
    _os_log_impl(&dword_21E879000, v5, OS_LOG_TYPE_DEFAULT, "PDSRegistrar allRegistrations {self: %@}", (uint8_t *)&v9, 0xCu);
  }

  id v6 = [(PDSRegistrar *)self allEntriesWithError:a3];
  id v7 = [(PDSRegistrar *)self _registrationsFromEntries:v6];

  return v7;
}

- (void)allRegistrationsWithCompletion:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (!v5)
  {
    uint64_t v8 = [MEMORY[0x263F08690] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"PDSRegistrar.m", 398, @"Invalid parameter not satisfying: %@", @"completion" object file lineNumber description];
  }
  id v6 = pds_defaultLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412290;
    int v12 = self;
    _os_log_impl(&dword_21E879000, v6, OS_LOG_TYPE_DEFAULT, "PDSRegistrar async allRegistrations {self: %@}", buf, 0xCu);
  }

  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __47__PDSRegistrar_allRegistrationsWithCompletion___block_invoke;
  v9[3] = &unk_2644CC340;
  v9[4] = self;
  id v10 = v5;
  id v7 = v5;
  [(PDSRegistrar *)self allEntriesWithCompletion:v9];
}

void __47__PDSRegistrar_allRegistrationsWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = pds_defaultLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = *(void *)(a1 + 32);
    int v11 = 138412802;
    uint64_t v12 = v8;
    __int16 v13 = 2112;
    id v14 = v6;
    __int16 v15 = 2112;
    id v16 = v5;
    _os_log_impl(&dword_21E879000, v7, OS_LOG_TYPE_DEFAULT, "PDSRegistrar completed async allRegistrations {self: %@, error: %@, response: %@}", (uint8_t *)&v11, 0x20u);
  }

  uint64_t v9 = *(void *)(a1 + 40);
  id v10 = [*(id *)(a1 + 32) _registrationsFromEntries:v5];
  (*(void (**)(uint64_t, void *, id))(v9 + 16))(v9, v10, v6);
}

- (id)allEntriesWithError:(id *)a3
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v5 = pds_defaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = self;
    _os_log_impl(&dword_21E879000, v5, OS_LOG_TYPE_DEFAULT, "PDSRegistrar allEntries {self: %@}", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v37 = 0x3032000000;
  __int16 v38 = __Block_byref_object_copy__0;
  uint64_t v39 = __Block_byref_object_dispose__0;
  id v40 = 0;
  remoteVendor = self->_remoteVendor;
  v29[0] = MEMORY[0x263EF8330];
  v29[1] = 3221225472;
  v29[2] = __36__PDSRegistrar_allEntriesWithError___block_invoke;
  v29[3] = &unk_2644CC2A0;
  v29[4] = &buf;
  id v7 = [(PDSRemoteVendor *)remoteVendor synchronousRemoteObjectProxyWithErrorHandler:v29];
  uint64_t v23 = 0;
  __int16 v24 = &v23;
  uint64_t v25 = 0x3032000000;
  uint64_t v26 = __Block_byref_object_copy__0;
  uint64_t v27 = __Block_byref_object_dispose__0;
  id v28 = 0;
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x3032000000;
  id v20 = __Block_byref_object_copy__0;
  id v21 = __Block_byref_object_dispose__0;
  id v22 = 0;
  if (v7)
  {
    uint64_t v8 = [(PDSRegistrar *)self clientID];
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __36__PDSRegistrar_allEntriesWithError___block_invoke_2;
    v16[3] = &unk_2644CC368;
    v16[4] = &v17;
    v16[5] = &v23;
    [v7 entriesForClientID:v8 withCompletion:v16];

    uint64_t v9 = v24[5];
  }
  else
  {
    uint64_t v9 = 0;
  }
  id v10 = [(PDSRegistrar *)self _wrappedErrorForGivenError:v9 XPCError:*(void *)(*((void *)&buf + 1) + 40)];
  int v11 = v10;
  if (a3 && v10) {
    *a3 = v10;
  }
  uint64_t v12 = pds_defaultLog();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v13 = v18[5];
    *(_DWORD *)v30 = 138412802;
    __int16 v31 = self;
    __int16 v32 = 2112;
    id v33 = v11;
    __int16 v34 = 2112;
    uint64_t v35 = v13;
    _os_log_impl(&dword_21E879000, v12, OS_LOG_TYPE_DEFAULT, "PDSRegistrar completed allEntries {self: %@, overallError: %@, response: %@}", v30, 0x20u);
  }

  id v14 = (id)v18[5];
  _Block_object_dispose(&v17, 8);

  _Block_object_dispose(&v23, 8);
  _Block_object_dispose(&buf, 8);

  return v14;
}

void __36__PDSRegistrar_allEntriesWithError___block_invoke(uint64_t a1, void *a2)
{
}

void __36__PDSRegistrar_allEntriesWithError___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

- (void)allEntriesWithCompletion:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = pds_defaultLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412290;
    uint64_t v17 = self;
    _os_log_impl(&dword_21E879000, v6, OS_LOG_TYPE_DEFAULT, "PDSRegistrar async allEntries {self: %@}", buf, 0xCu);
  }

  if (!v5)
  {
    uint64_t v12 = [MEMORY[0x263F08690] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"PDSRegistrar.m", 435, @"Invalid parameter not satisfying: %@", @"completion" object file lineNumber description];
  }
  remoteVendor = self->_remoteVendor;
  id v15 = 0;
  uint64_t v8 = [(PDSRemoteVendor *)remoteVendor remoteObjectProxyWithError:&v15];
  id v9 = v15;
  if (v8)
  {
    id v10 = [(PDSRegistrar *)self clientID];
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __41__PDSRegistrar_allEntriesWithCompletion___block_invoke;
    v13[3] = &unk_2644CC340;
    v13[4] = self;
    id v14 = v5;
    [v8 entriesForClientID:v10 withCompletion:v13];
  }
  else
  {
    uint64_t v11 = [(PDSRegistrar *)self _wrappedErrorForFailedRemote:v9];
    (*((void (**)(id, void, uint64_t))v5 + 2))(v5, 0, v11);

    id v9 = (id)v11;
  }
}

void __41__PDSRegistrar_allEntriesWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = pds_defaultLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = *(void *)(a1 + 32);
    int v11 = 138412802;
    uint64_t v12 = v8;
    __int16 v13 = 2112;
    id v14 = v6;
    __int16 v15 = 2112;
    id v16 = v5;
    _os_log_impl(&dword_21E879000, v7, OS_LOG_TYPE_DEFAULT, "PDSRegistrar completed async allEntries {self: %@, error: %@, response: %@}", (uint8_t *)&v11, 0x20u);
  }

  uint64_t v9 = *(void *)(a1 + 40);
  id v10 = [*(id *)(a1 + 32) _wrappedErrorForGivenError:v6 XPCError:0];
  (*(void (**)(uint64_t, id, void *))(v9 + 16))(v9, v5, v10);
}

- (BOOL)deleteRegistration:(id)a3 fromUser:(id)a4 error:(id *)a5
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = (uint64_t (*)(uint64_t, uint64_t))a4;
  int v11 = v10;
  if (v9)
  {
    if (v10) {
      goto LABEL_3;
    }
  }
  else
  {
    __int16 v24 = [MEMORY[0x263F08690] currentHandler];
    [v24 handleFailureInMethod:a2, self, @"PDSRegistrar.m", 449, @"Invalid parameter not satisfying: %@", @"registration" object file lineNumber description];

    if (v11) {
      goto LABEL_3;
    }
  }
  uint64_t v25 = [MEMORY[0x263F08690] currentHandler];
  [v25 handleFailureInMethod:a2, self, @"PDSRegistrar.m", 450, @"Invalid parameter not satisfying: %@", @"user" object file lineNumber description];

LABEL_3:
  uint64_t v12 = pds_defaultLog();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412802;
    *(void *)&uint8_t buf[4] = self;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v9;
    *(_WORD *)&buf[22] = 2112;
    uint64_t v39 = v11;
    _os_log_impl(&dword_21E879000, v12, OS_LOG_TYPE_DEFAULT, "PDSRegistrar deleteRegistration {self: %@, registration: %@, user: %@}", buf, 0x20u);
  }

  *(void *)long long buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  uint64_t v39 = __Block_byref_object_copy__0;
  id v40 = __Block_byref_object_dispose__0;
  id v41 = 0;
  remoteVendor = self->_remoteVendor;
  v33[0] = MEMORY[0x263EF8330];
  v33[1] = 3221225472;
  v33[2] = __50__PDSRegistrar_deleteRegistration_fromUser_error___block_invoke;
  v33[3] = &unk_2644CC2A0;
  v33[4] = buf;
  id v14 = [(PDSRemoteVendor *)remoteVendor synchronousRemoteObjectProxyWithErrorHandler:v33];
  uint64_t v27 = 0;
  id v28 = &v27;
  uint64_t v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__0;
  __int16 v31 = __Block_byref_object_dispose__0;
  id v32 = 0;
  if (v14)
  {
    __int16 v15 = [PDSEntry alloc];
    id v16 = [(PDSRegistrar *)self clientID];
    uint64_t v17 = [(PDSEntry *)v15 initWithUser:v11 registration:v9 clientID:v16 state:2];

    uint64_t v18 = [MEMORY[0x263EFFA08] setWithObject:v17];
    v26[0] = MEMORY[0x263EF8330];
    v26[1] = 3221225472;
    v26[2] = __50__PDSRegistrar_deleteRegistration_fromUser_error___block_invoke_2;
    v26[3] = &unk_2644CC2A0;
    uint8_t v26[4] = &v27;
    [v14 storeEntries:0 deleteEntries:v18 withCompletion:v26];

    uint64_t v19 = v28[5];
  }
  else
  {
    uint64_t v19 = 0;
  }
  id v20 = [(PDSRegistrar *)self _wrappedErrorForGivenError:v19 XPCError:*(void *)(*(void *)&buf[8] + 40)];
  id v21 = v20;
  if (a5 && v20) {
    *a5 = v20;
  }
  id v22 = pds_defaultLog();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)__int16 v34 = 138412546;
    uint64_t v35 = self;
    __int16 v36 = 2112;
    uint64_t v37 = v21;
    _os_log_impl(&dword_21E879000, v22, OS_LOG_TYPE_DEFAULT, "PDSRegistrar completed deleteRegistration {self: %@, overallError: %@}", v34, 0x16u);
  }

  _Block_object_dispose(&v27, 8);
  _Block_object_dispose(buf, 8);

  return v21 == 0;
}

void __50__PDSRegistrar_deleteRegistration_fromUser_error___block_invoke(uint64_t a1, void *a2)
{
}

void __50__PDSRegistrar_deleteRegistration_fromUser_error___block_invoke_2(uint64_t a1, void *a2)
{
}

- (id)_wrappedErrorForFailedRemote:(id)a3
{
  v9[1] = *MEMORY[0x263EF8340];
  id v3 = a3;
  v4 = v3;
  if (v3)
  {
    uint64_t v8 = *MEMORY[0x263F08608];
    v9[0] = v3;
    id v5 = [NSDictionary dictionaryWithObjects:v9 forKeys:&v8 count:1];
  }
  else
  {
    id v5 = 0;
  }
  id v6 = [MEMORY[0x263F087E8] errorWithDomain:PDSRegistrarErrorDomain code:-201 userInfo:v5];

  return v6;
}

- (id)_wrappedErrorForGivenError:(id)a3 XPCError:(id)a4
{
  v25[1] = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = v6;
  if (v6)
  {
    uint64_t v8 = (void *)MEMORY[0x263F087E8];
    id v9 = PDSRegistrarErrorDomain;
    uint64_t v24 = *MEMORY[0x263F08608];
    v25[0] = v6;
    id v10 = [NSDictionary dictionaryWithObjects:v25 forKeys:&v24 count:1];
    int v11 = v8;
    uint64_t v12 = v9;
    uint64_t v13 = -201;
LABEL_3:
    id v14 = [v11 errorWithDomain:v12 code:v13 userInfo:v10];

    goto LABEL_4;
  }
  if (v5)
  {
    id v16 = [v5 domain];
    int v17 = [v16 isEqualToString:PDSCDCacheErrorDomain];

    uint64_t v18 = (void *)MEMORY[0x263F087E8];
    uint64_t v19 = PDSRegistrarErrorDomain;
    if (v17)
    {
      uint64_t v22 = *MEMORY[0x263F08608];
      id v23 = v5;
      id v10 = [NSDictionary dictionaryWithObjects:&v23 forKeys:&v22 count:1];
      int v11 = v18;
      uint64_t v12 = v19;
      uint64_t v13 = -202;
    }
    else
    {
      uint64_t v20 = *MEMORY[0x263F08608];
      id v21 = v5;
      id v10 = [NSDictionary dictionaryWithObjects:&v21 forKeys:&v20 count:1];
      int v11 = v18;
      uint64_t v12 = v19;
      uint64_t v13 = -203;
    }
    goto LABEL_3;
  }
  id v14 = 0;
LABEL_4:

  return v14;
}

- (id)_activeRegistrationsFromEntries:(id)a3
{
  if (a3)
  {
    v4 = objc_msgSend(a3, "__imArrayByApplyingBlock:", &__block_literal_global_1);
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

id __48__PDSRegistrar__activeRegistrationsFromEntries___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 state] == 2)
  {
    uint64_t v3 = 0;
  }
  else
  {
    uint64_t v3 = [v2 registration];
  }

  return v3;
}

- (id)_registrationsFromEntries:(id)a3
{
  if (a3)
  {
    v4 = objc_msgSend(a3, "__imArrayByApplyingBlock:", &__block_literal_global_31);
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

uint64_t __42__PDSRegistrar__registrationsFromEntries___block_invoke(uint64_t a1, void *a2)
{
  return [a2 registration];
}

- (id)description
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"<%@: %p; clientID = \"%@\">",
               objc_opt_class(),
               self,
               self->_clientID);
}

- (void)setClientID:(id)a3
{
}

- (PDSRemoteVendor)remoteVendor
{
  return self->_remoteVendor;
}

- (void)setRemoteVendor:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteVendor, 0);
  objc_storeStrong((id *)&self->_clientID, 0);
}

@end
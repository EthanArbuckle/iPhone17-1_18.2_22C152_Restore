@interface MCEDUClassroomPayloadHandler
- (BOOL)_installWithError:(id *)a3;
- (BOOL)installWithInstaller:(id)a3 options:(id)a4 interactionClient:(id)a5 outError:(id *)a6;
- (BOOL)isInstalled;
- (BOOL)setConfiguration:(id)a3 error:(id *)a4;
- (id)_persistentIDForPayloadUUID:(id)a3 requireIdentity:(BOOL)a4 error:(id *)a5;
- (id)configurationWithError:(id *)a3;
- (void)_remove;
- (void)remove;
- (void)unsetAside;
@end

@implementation MCEDUClassroomPayloadHandler

- (id)configurationWithError:(id *)a3
{
  if (objc_opt_class())
  {
    uint64_t v18 = 0;
    v19 = &v18;
    uint64_t v20 = 0x3032000000;
    v21 = sub_1000215E0;
    v22 = sub_1000215F0;
    id v23 = 0;
    uint64_t v12 = 0;
    v13 = &v12;
    uint64_t v14 = 0x3032000000;
    v15 = sub_1000215E0;
    v16 = sub_1000215F0;
    id v17 = 0;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_1000215F8;
    v8[3] = &unk_1000EB880;
    v10 = &v18;
    v11 = &v12;
    v4 = dispatch_semaphore_create(0);
    v9 = v4;
    +[CRKClassroomConfiguration fetchConfiguration:v8];
    dispatch_semaphore_wait(v4, 0xFFFFFFFFFFFFFFFFLL);
    if (a3) {
      *a3 = (id) v13[5];
    }
    a3 = (id *)(id)v19[5];

    _Block_object_dispose(&v12, 8);
    _Block_object_dispose(&v18, 8);
  }
  else if (a3)
  {
    uint64_t v5 = MCInternalErrorDomain;
    v6 = MCErrorArray();
    +[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", v5, 4, v6, MCErrorTypeFatal, 0);
    *a3 = (id)objc_claimAutoreleasedReturnValue();

    a3 = 0;
  }

  return a3;
}

- (BOOL)setConfiguration:(id)a3 error:(id *)a4
{
  id v5 = a3;
  if (objc_opt_class())
  {
    uint64_t v13 = 0;
    uint64_t v14 = &v13;
    uint64_t v15 = 0x3032000000;
    v16 = sub_1000215E0;
    id v17 = sub_1000215F0;
    id v18 = 0;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100021868;
    v10[3] = &unk_1000EB5F0;
    uint64_t v12 = &v13;
    v6 = dispatch_semaphore_create(0);
    v11 = v6;
    +[CRKClassroomConfiguration setConfiguration:v5 completion:v10];
    dispatch_semaphore_wait(v6, 0xFFFFFFFFFFFFFFFFLL);
    if (a4) {
      *a4 = (id) v14[5];
    }
    LOBYTE(a4) = v14[5] == 0;

    _Block_object_dispose(&v13, 8);
  }
  else if (a4)
  {
    uint64_t v7 = MCInternalErrorDomain;
    v8 = MCErrorArray();
    +[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", v7, 4, v8, MCErrorTypeFatal, 0);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

    LOBYTE(a4) = 0;
  }

  return (char)a4;
}

- (id)_persistentIDForPayloadUUID:(id)a3 requireIdentity:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  if (!v8)
  {
    a5 = 0;
    goto LABEL_14;
  }
  v9 = [(MCNewPayloadHandler *)self profileHandler];
  v10 = [v9 persistentIDForCertificateUUID:v8];

  if (!v10)
  {
    if (!a5) {
      goto LABEL_13;
    }
    uint64_t v14 = MCEDUClassroomErrorDomain;
    uint64_t v15 = MCErrorArray();
    +[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", v14, 45002, v15, MCErrorTypeFatal, v8, 0);
    *a5 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_12;
  }
  if (v6)
  {
    v11 = [(MCNewPayloadHandler *)self profileHandler];
    uint64_t v12 = [v11 profile];
    id v13 = +[MCKeychain copyIdentityWithPersistentID:useSystemKeychain:](MCKeychain, "copyIdentityWithPersistentID:useSystemKeychain:", v10, [v12 isInstalledForSystem]);

    if (v13)
    {
      CFRelease(v13);
      goto LABEL_6;
    }
    if (!a5) {
      goto LABEL_13;
    }
    uint64_t v16 = MCEDUClassroomErrorDomain;
    id v17 = [(MCNewPayloadHandler *)self payload];
    id v18 = [v17 friendlyName];
    v19 = MCErrorArray();
    +[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", v16, 45003, v19, MCErrorTypeFatal, v18, 0);
    *a5 = (id)objc_claimAutoreleasedReturnValue();

LABEL_12:
    a5 = 0;
    goto LABEL_13;
  }
LABEL_6:
  a5 = v10;
LABEL_13:

LABEL_14:

  return a5;
}

- (BOOL)_installWithError:(id *)a3
{
  id v5 = [(MCNewPayloadHandler *)self payload];
  id v50 = 0;
  BOOL v6 = [(MCEDUClassroomPayloadHandler *)self configurationWithError:&v50];
  id v7 = v50;

  if (!v6)
  {
    if (v7)
    {
      if (a3)
      {
        uint64_t v11 = MCEDUClassroomErrorDomain;
        v9 = MCErrorArray();
        v10 = +[NSError MCErrorWithDomain:code:descriptionArray:underlyingError:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:underlyingError:errorType:", v11, 45000, v9, v7, MCErrorTypeFatal, 0);
        goto LABEL_7;
      }
LABEL_40:
      BOOL v12 = 0;
      goto LABEL_41;
    }
    id v13 = [v5 payloadCertificatePersistentID];

    if (!v13)
    {
      uint64_t v14 = [v5 payloadCertificateUUID];
      uint64_t v15 = [(MCEDUClassroomPayloadHandler *)self _persistentIDForPayloadUUID:v14 requireIdentity:1 error:a3];
      [v5 setPayloadCertificatePersistentID:v15];
    }
    uint64_t v16 = [v5 leaderPayloadCertificateAnchorPersistentID];

    if (!v16)
    {
      v9 = objc_opt_new();
      long long v46 = 0u;
      long long v47 = 0u;
      long long v48 = 0u;
      long long v49 = 0u;
      v21 = [v5 leaderPayloadCertificateAnchorUUID];
      id v22 = [v21 countByEnumeratingWithState:&v46 objects:v52 count:16];
      if (v22)
      {
        id v23 = v22;
        uint64_t v24 = *(void *)v47;
LABEL_20:
        uint64_t v25 = 0;
        while (1)
        {
          if (*(void *)v47 != v24) {
            objc_enumerationMutation(v21);
          }
          uint64_t v26 = [(MCEDUClassroomPayloadHandler *)self _persistentIDForPayloadUUID:*(void *)(*((void *)&v46 + 1) + 8 * v25) requireIdentity:0 error:a3];
          if (!v26) {
            goto LABEL_36;
          }
          v27 = (void *)v26;
          [v9 addObject:v26];

          if (v23 == (id)++v25)
          {
            id v23 = [v21 countByEnumeratingWithState:&v46 objects:v52 count:16];
            if (v23) {
              goto LABEL_20;
            }
            break;
          }
        }
      }

      id v28 = [v9 copy];
      [v5 setLeaderPayloadCertificateAnchorPersistentID:v28];
    }
    id v17 = [v5 memberPayloadCertificateAnchorPersistentID];

    if (v17) {
      goto LABEL_13;
    }
    v9 = objc_opt_new();
    long long v42 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    v21 = [v5 memberPayloadCertificateAnchorUUID];
    id v29 = [v21 countByEnumeratingWithState:&v42 objects:v51 count:16];
    if (!v29)
    {
LABEL_35:

      id v35 = [v9 copy];
      [v5 setMemberPayloadCertificateAnchorPersistentID:v35];

LABEL_13:
      id v18 = [v5 resourcePayloadCertificatePersistentID];
      if (v18)
      {
      }
      else
      {
        v36 = [v5 resourcePayloadCertificateUUID];

        if (v36)
        {
          v37 = [v5 resourcePayloadCertificateUUID];
          v38 = [(MCEDUClassroomPayloadHandler *)self _persistentIDForPayloadUUID:v37 requireIdentity:1 error:a3];
          [v5 setResourcePayloadCertificatePersistentID:v38];

          v39 = [v5 resourcePayloadCertificatePersistentID];

          if (!v39)
          {
            id v7 = 0;
            goto LABEL_40;
          }
        }
      }
      v9 = [v5 configuration];
      id v41 = 0;
      BOOL v12 = [(MCEDUClassroomPayloadHandler *)self setConfiguration:v9 error:&v41];
      id v7 = v41;
      if (a3 && !v12)
      {
        uint64_t v19 = MCEDUClassroomErrorDomain;
        uint64_t v20 = MCErrorArray();
        +[NSError MCErrorWithDomain:code:descriptionArray:underlyingError:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:underlyingError:errorType:", v19, 45000, v20, v7, MCErrorTypeFatal, 0);
        *a3 = (id)objc_claimAutoreleasedReturnValue();
      }
      goto LABEL_8;
    }
    id v30 = v29;
    uint64_t v31 = *(void *)v43;
LABEL_29:
    uint64_t v32 = 0;
    while (1)
    {
      if (*(void *)v43 != v31) {
        objc_enumerationMutation(v21);
      }
      uint64_t v33 = [(MCEDUClassroomPayloadHandler *)self _persistentIDForPayloadUUID:*(void *)(*((void *)&v42 + 1) + 8 * v32) requireIdentity:0 error:a3];
      if (!v33) {
        break;
      }
      v34 = (void *)v33;
      [v9 addObject:v33];

      if (v30 == (id)++v32)
      {
        id v30 = [v21 countByEnumeratingWithState:&v42 objects:v51 count:16];
        if (v30) {
          goto LABEL_29;
        }
        goto LABEL_35;
      }
    }
LABEL_36:

    id v7 = 0;
    BOOL v12 = 0;
    goto LABEL_8;
  }
  if (!a3) {
    goto LABEL_40;
  }
  uint64_t v8 = MCEDUClassroomErrorDomain;
  v9 = MCErrorArray();
  v10 = +[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", v8, 45001, v9, MCErrorTypeFatal, 0);
LABEL_7:
  BOOL v12 = 0;
  *a3 = v10;
LABEL_8:

LABEL_41:
  return v12;
}

- (BOOL)installWithInstaller:(id)a3 options:(id)a4 interactionClient:(id)a5 outError:(id *)a6
{
  return -[MCEDUClassroomPayloadHandler _installWithError:](self, "_installWithError:", a6, a4, a5);
}

- (void)_remove
{
}

- (void)remove
{
  v3 = [(MCNewPayloadHandler *)self profileHandler];
  unsigned __int8 v4 = [v3 isSetAside];

  if ((v4 & 1) == 0)
  {
    [(MCEDUClassroomPayloadHandler *)self _remove];
  }
}

- (BOOL)isInstalled
{
  v2 = [(MCEDUClassroomPayloadHandler *)self configurationWithError:0];
  BOOL v3 = v2 != 0;

  return v3;
}

- (void)unsetAside
{
}

@end
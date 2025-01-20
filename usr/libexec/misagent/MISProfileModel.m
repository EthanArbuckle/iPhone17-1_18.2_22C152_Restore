@interface MISProfileModel
- (BOOL)isProfileInstalled:(id)a3;
- (BOOL)queryCMSBlobForProfile:(id)a3 forcingXML:(BOOL)a4 handler:(id)a5;
- (MISProfileModel)initWithDB:(id)a3;
- (id)getCertPrimaryKey:(id)a3;
- (int)insertProfile:(void *)a3;
- (int)removeProfile:(id)a3;
- (void)queryProfile:(id)a3;
@end

@implementation MISProfileModel

- (MISProfileModel)initWithDB:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MISProfileModel;
  v5 = [(MISProfileModel *)&v9 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_weak_db, v4);
    v7 = v6;
  }

  return v6;
}

- (BOOL)queryCMSBlobForProfile:(id)a3 forcingXML:(BOOL)a4 handler:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_weak_db);
  if (v8)
  {
    if (!v6) {
      goto LABEL_4;
    }
    uint64_t v22 = 0;
    v23 = &v22;
    uint64_t v24 = 0x2020000000;
    char v25 = 0;
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_1000087BC;
    v20[3] = &unk_100010760;
    id v21 = v8;
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_10000882C;
    v17[3] = &unk_100010B08;
    v19 = &v22;
    id v18 = v9;
    unsigned int v11 = [WeakRetained executeQuery:@"SELECT cms_blob FROM xml_profiles_cache WHERE uuid = @uuid" withBind:v20 withResults:v17];
    int v12 = *((unsigned __int8 *)v23 + 24);
    BOOL v13 = v11 == 0;

    _Block_object_dispose(&v22, 8);
    if (!v12)
    {
LABEL_4:
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = sub_10000884C;
      v15[3] = &unk_100010760;
      id v16 = v8;
      BOOL v13 = [WeakRetained executeQuery:@"SELECT cms_blob FROM profiles WHERE uuid = @uuid" withBind:v15 withResults:v9] == 0;
    }
  }
  else
  {
    BOOL v13 = 0;
  }

  return v13;
}

- (void)queryProfile:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    uint64_t v8 = 0;
    id v9 = &v8;
    uint64_t v10 = 0x2020000000;
    uint64_t v11 = 0;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_1000089A0;
    v7[3] = &unk_1000109C8;
    v7[4] = &v8;
    [(MISProfileModel *)self queryCMSBlobForProfile:v4 forcingXML:0 handler:v7];
    v5 = (void *)v9[3];
    _Block_object_dispose(&v8, 8);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)isProfileInstalled:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_weak_db);
  if (v4)
  {
    uint64_t v13 = 0;
    v14 = &v13;
    uint64_t v15 = 0x2020000000;
    char v16 = 0;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100008BAC;
    v11[3] = &unk_100010760;
    id v12 = v4;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100008C1C;
    v8[3] = &unk_100010B30;
    uint64_t v10 = &v13;
    id v9 = v12;
    [WeakRetained executeQuery:@"SELECT uuid FROM profiles WHERE uuid = @uuid" withBind:v11 withResults:v8];
    BOOL v6 = *((unsigned char *)v14 + 24) != 0;

    _Block_object_dispose(&v13, 8);
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (int)insertProfile:(void *)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_weak_db);
  v29 = MISProvisioningProfileGetUUID();
  v27 = MISProvisioningProfileGetName();
  uint64_t v24 = MISProvisioningProfileGetDeveloperCertificatesHashes();
  v26 = MISProvisioningProfileGetTeamIdentifier();
  char v25 = MISProvisioningProfileGetExpirationDate();
  DataRepresentation = (void *)MISProfileCreateDataRepresentation();
  v23 = MISProvisioningProfileGetEntitlements();
  v30 = MISProvisioningProfileGetEmbeddedDER();
  if ([v30 length])
  {
    v5 = (void *)MISProfileCreateWithData();
    if (MISProvisioningProfileValidateSignature())
    {
      int v6 = 4;
    }
    else
    {
      int v6 = [(MISProfileModel *)self insertProfile:v5];
      if (!v6)
      {
        v58[0] = _NSConcreteStackBlock;
        v58[1] = 3221225472;
        v58[2] = sub_10000927C;
        v58[3] = &unk_100010878;
        id v59 = v29;
        id v60 = DataRepresentation;
        int v6 = [WeakRetained executeQuery:@"INSERT INTO xml_profiles_cache VALUES (@uuid, @cms_blob)", v58, 0 withBind withResults];
      }
    }
  }
  else
  {
    BOOL v7 = MISProvisioningProfileProvisionsAllDevices() != 0;
    BOOL v8 = MISProvisioningProfileIsForLocalProvisioning() != 0;
    BOOL v9 = MISProvisioningProfileIsAppleInternalProfile() != 0;
    BOOL v10 = MISProvisioningProfileIsForBetaDeployment() != 0;
    BOOL v11 = MISProfileIsDEREncoded() != 0;
    uint64_t v54 = 0;
    v55 = &v54;
    uint64_t v56 = 0x2020000000;
    unsigned int v57 = 0;
    v43[0] = _NSConcreteStackBlock;
    v43[1] = 3221225472;
    v43[2] = sub_100009330;
    v43[3] = &unk_100010B58;
    id v12 = v29;
    id v44 = v12;
    id v45 = v26;
    id v46 = v27;
    id v47 = v25;
    BOOL v49 = v7;
    BOOL v50 = v9;
    BOOL v51 = v8;
    BOOL v52 = v10;
    id v48 = DataRepresentation;
    BOOL v53 = v11;
    unsigned int v57 = [WeakRetained executeQuery:@"INSERT INTO profiles VALUES (@uuid, @team_id, NULL, @name, @expires, @is_for_all_devices, @is_apple_internal, @is_local, @is_beta, @cms_blob, @is_der)", v43, 0 withBind withResults];
    int v6 = *((_DWORD *)v55 + 6);
    if (!v6)
    {
      long long v41 = 0u;
      long long v42 = 0u;
      long long v39 = 0u;
      long long v40 = 0u;
      id v13 = v24;
      id v14 = [v13 countByEnumeratingWithState:&v39 objects:v61 count:16];
      if (v14)
      {
        uint64_t v15 = *(void *)v40;
        id obj = v13;
        while (2)
        {
          for (i = 0; i != v14; i = (char *)i + 1)
          {
            if (*(void *)v40 != v15) {
              objc_enumerationMutation(obj);
            }
            v17 = [(MISProfileModel *)self getCertPrimaryKey:*(void *)(*((void *)&v39 + 1) + 8 * i)];
            if (!v17)
            {
              int v6 = 1;
LABEL_19:

              v20 = obj;
              goto LABEL_20;
            }
            v36[0] = _NSConcreteStackBlock;
            v36[1] = 3221225472;
            v36[2] = sub_100009520;
            v36[3] = &unk_100010878;
            id v37 = v12;
            id v18 = v17;
            id v38 = v18;
            int v6 = [WeakRetained executeQuery:@"INSERT INTO certificate_provisioning_cache VALUES (NULL, @uuid, @leaf_pk)", v36, 0 withBind withResults];
            *((_DWORD *)v55 + 6) = v6;

            if (v6) {
              goto LABEL_19;
            }
          }
          id v13 = obj;
          id v14 = [obj countByEnumeratingWithState:&v39 objects:v61 count:16];
          if (v14) {
            continue;
          }
          break;
        }
      }

      v19 = [WeakRetained Entitlements];
      v32[0] = _NSConcreteStackBlock;
      v32[1] = 3221225472;
      v32[2] = sub_1000095BC;
      v32[3] = &unk_100010B80;
      v35 = &v54;
      id v33 = WeakRetained;
      id v34 = v12;
      [v19 emitEntitlementPredicates:v23 predicateHandler:v32];

      int v6 = *((_DWORD *)v55 + 6);
      v20 = v33;
LABEL_20:
    }
    _Block_object_dispose(&v54, 8);
  }
  return v6;
}

- (int)removeProfile:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_weak_db);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100009724;
  v9[3] = &unk_100010760;
  id v10 = v4;
  id v6 = v4;
  int v7 = [WeakRetained executeQuery:@"DELETE FROM profiles WHERE uuid = @uuid" withBind:v9 withResults:0];

  return v7;
}

- (id)getCertPrimaryKey:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_weak_db);
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x3032000000;
  v17 = sub_10000999C;
  id v18 = sub_1000099AC;
  id v19 = 0;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1000099B4;
  v12[3] = &unk_100010760;
  id v6 = v4;
  id v13 = v6;
  if ([WeakRetained executeQuery:@"INSERT OR IGNORE INTO certificates VALUES (NULL, @cert)", v12, 0 withBind withResults])
  {
    id v7 = 0;
  }
  else
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100009A30;
    v10[3] = &unk_100010760;
    id v11 = v6;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100009AAC;
    v9[3] = &unk_1000109C8;
    void v9[4] = &v14;
    if ([WeakRetained executeQuery:@"SELECT pk FROM certificates WHERE leaf = @cert" withBind:v10 withResults:v9])id v7 = 0; {
    else
    }
      id v7 = (id)v15[5];
  }
  _Block_object_dispose(&v14, 8);

  return v7;
}

- (void).cxx_destruct
{
}

@end
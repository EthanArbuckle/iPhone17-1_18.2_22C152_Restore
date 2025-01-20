@interface MISDBManager
- (BOOL)isProfileInstalled:(id)a3;
- (BOOL)queryCMSBlobForProfile:(id)a3 forcingXML:(BOOL)a4 handler:(id)a5;
- (BOOL)setupSchema;
- (MISEntitlementsModel)Entitlements;
- (MISProfileModel)Profiles;
- (id)allCMSBlobs;
- (id)allProfiles;
- (id)findProfilesMatchingEntitlements:(id)a3 withCertificate:(id)a4;
- (id)findProfilesMatchingPredicates:(id)a3 withCertificate:(id)a4;
- (id)findProfilesWithCertificate:(id)a3;
- (int)insertProfile:(void *)a3;
- (int)removeProfile:(id)a3;
- (void)queryProfile:(id)a3;
- (void)setEntitlements:(id)a3;
- (void)setProfiles:(id)a3;
@end

@implementation MISDBManager

- (BOOL)setupSchema
{
  v18.receiver = self;
  v18.super_class = (Class)MISDBManager;
  if (![(SQLDB *)&v18 setupSchema]) {
    return 0;
  }
  if ([(SQLDB *)self checkpoint])
  {
    v10 = sub_100006ABC();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_10000A784(v10);
    }

    abort();
  }
  v3 = [[MISProfileModel alloc] initWithDB:self];
  Profiles = self->Profiles;
  self->Profiles = v3;

  v5 = [[MISEntitlementsModel alloc] initWithDB:self];
  Entitlements = self->Entitlements;
  self->Entitlements = v5;

  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x2020000000;
  int v17 = 0;
  v12[0] = 0;
  v12[1] = v12;
  v12[2] = 0x3032000000;
  v12[3] = sub_1000033F8;
  v12[4] = sub_100003408;
  id v13 = 0;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100003410;
  v11[3] = &unk_100010788;
  v11[4] = self;
  v11[5] = v12;
  v11[6] = &v14;
  unsigned int v7 = [(SQLDB *)self transaction:v11 immediate:1];
  *((_DWORD *)v15 + 6) = v7;
  BOOL v8 = v7 == 0;
  _Block_object_dispose(v12, 8);

  _Block_object_dispose(&v14, 8);
  return v8;
}

- (BOOL)queryCMSBlobForProfile:(id)a3 forcingXML:(BOOL)a4 handler:(id)a5
{
  return [(MISProfileModel *)self->Profiles queryCMSBlobForProfile:a3 forcingXML:a4 handler:a5];
}

- (void)queryProfile:(id)a3
{
  return [(MISProfileModel *)self->Profiles queryProfile:a3];
}

- (BOOL)isProfileInstalled:(id)a3
{
  return [(MISProfileModel *)self->Profiles isProfileInstalled:a3];
}

- (int)insertProfile:(void *)a3
{
  uint64_t v6 = 0;
  unsigned int v7 = &v6;
  uint64_t v8 = 0x2020000000;
  int v9 = 0;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100003C48;
  v5[3] = &unk_1000107B0;
  v5[5] = &v6;
  v5[6] = a3;
  v5[4] = self;
  [(SQLDB *)self transaction:v5];
  int v3 = *((_DWORD *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (int)removeProfile:(id)a3
{
  uint64_t v10 = 0;
  v11 = &v10;
  uint64_t v12 = 0x2020000000;
  int v13 = 0;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100003DA8;
  v6[3] = &unk_1000107D8;
  int v9 = &v10;
  unsigned int v7 = self;
  id v3 = a3;
  id v8 = v3;
  [(SQLDB *)v7 transaction:v6];
  int v4 = *((_DWORD *)v11 + 6);

  _Block_object_dispose(&v10, 8);
  return v4;
}

- (id)allCMSBlobs
{
  +[NSMutableArray arrayWithCapacity:20];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100003F2C;
  v10[3] = &unk_100010800;
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  id v11 = v3;
  [(SQLDB *)self executeQuery:@"SELECT cms_blob FROM profiles WHERE is_der = 0" withBind:0 withResults:v10];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100003FB8;
  v8[3] = &unk_100010800;
  id v4 = v3;
  id v9 = v4;
  [(SQLDB *)self executeQuery:@"SELECT cms_blob as blob FROM xml_profiles_cache" withBind:0 withResults:v8];
  v5 = v9;
  id v6 = v4;

  return v6;
}

- (id)allProfiles
{
  +[NSMutableArray arrayWithCapacity:20];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100004104;
  v5[3] = &unk_100010800;
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  id v6 = v3;
  [(SQLDB *)self executeQuery:@"SELECT uuid, team_id, name, expires, is_for_all_devices, is_apple_internal, is_local, is_beta FROM profiles" withBind:0 withResults:v5];

  return v3;
}

- (id)findProfilesMatchingEntitlements:(id)a3 withCertificate:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = +[NSMutableArray arrayWithCapacity:10];
  id v9 = [(MISDBManager *)self Entitlements];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100004284;
  v13[3] = &unk_100010828;
  id v14 = v8;
  id v10 = v8;
  [v9 emitEntitlementPredicates:v7 predicateHandler:v13];

  id v11 = [(MISDBManager *)self findProfilesMatchingPredicates:v10 withCertificate:v6];

  return v11;
}

- (id)findProfilesMatchingPredicates:(id)a3 withCertificate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[NSMutableArray arrayWithCapacity:2];
  if (v7) {
    CFStringRef v9 = @"SELECT uuid FROM certificate_provisioning_cache JOIN certificates ON certificates.pk = leaf_pk WHERE certificates.leaf = @cert";
  }
  else {
    CFStringRef v9 = @"SELECT uuid FROM profiles";
  }
  +[NSMutableString stringWithCapacity:1024];
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_100004494;
  v23[3] = &unk_100010850;
  id v24 = (id)objc_claimAutoreleasedReturnValue();
  id v10 = v24;
  [v6 enumerateObjectsUsingBlock:v23];
  id v11 = +[NSString stringWithFormat:@"WITH predicates(idx, predicate) AS (VALUES %@), filteredProfileUUIDs(uuid) AS (%@) SELECT * FROM (SELECT profiles.uuid, profiles.team_id, profiles.name, profiles.expires, profiles.is_for_all_devices, profiles.is_apple_internal, profiles.is_local, profiles.is_beta, profiles.is_der, COUNT(DISTINCT predicates.idx) as matchCount FROM filteredProfileUUIDs JOIN profiles ON profiles.uuid = filteredProfileUUIDs.uuid JOIN entitlements_provisioning_cache ON entitlements_provisioning_cache.uuid = filteredProfileUUIDs.uuid CROSS JOIN predicates WHERE profiles.is_apple_internal OR ((entitlements_provisioning_cache.wildcard = 0 AND entitlements_provisioning_cache.predicate = predicates.predicate) OR (entitlements_provisioning_cache.wildcard = 1 AND glob(entitlements_provisioning_cache.predicate, predicates.predicate))) GROUP BY profiles.uuid, profiles.is_apple_internal) AS aggregated WHERE aggregated.matchCount = @totalPredicates OR aggregated.is_apple_internal ORDER BY  aggregated.is_der DESC, aggregated.is_local ASC, aggregated.is_for_all_devices ASC", v10, v9];
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_1000044EC;
  v20[3] = &unk_100010878;
  id v21 = v7;
  id v22 = v6;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_100004670;
  v18[3] = &unk_100010800;
  id v12 = v8;
  id v19 = v12;
  id v13 = v6;
  id v14 = v7;
  [(SQLDB *)self executeQuery:v11 withBind:v20 withResults:v18];

  v15 = v19;
  id v16 = v12;

  return v16;
}

- (id)findProfilesWithCertificate:(id)a3
{
  id v4 = a3;
  v5 = +[NSMutableArray arrayWithCapacity:2];
  CFStringRef v6 = @"SELECT uuid FROM certificate_provisioning_cache JOIN certificates ON certificates.pk = leaf_pk WHERE certificates.leaf = @cert";
  if (!v4) {
    CFStringRef v6 = @"SELECT uuid FROM profiles";
  }
  id v7 = +[NSString stringWithFormat:@"WITH filteredProfileUUIDs(uuid) AS (%@) SELECT profiles.uuid, profiles.team_id, profiles.name, profiles.expires, profiles.is_for_all_devices, profiles.is_apple_internal, profiles.is_local, profiles.is_beta, profiles.is_der FROM filteredProfileUUIDs JOIN profiles ON profiles.uuid = filteredProfileUUIDs.uuid ORDER BY  profiles.is_der DESC, profiles.is_local ASC, profiles.is_for_all_devices ASC", v6];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100004834;
  v15[3] = &unk_100010760;
  id v16 = v4;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1000048C8;
  v13[3] = &unk_100010800;
  id v8 = v5;
  id v14 = v8;
  id v9 = v4;
  [(SQLDB *)self executeQuery:v7 withBind:v15 withResults:v13];

  id v10 = v14;
  id v11 = v8;

  return v11;
}

- (MISEntitlementsModel)Entitlements
{
  return (MISEntitlementsModel *)objc_getProperty(self, a2, 48, 1);
}

- (void)setEntitlements:(id)a3
{
}

- (MISProfileModel)Profiles
{
  return (MISProfileModel *)objc_getProperty(self, a2, 56, 1);
}

- (void)setProfiles:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->Profiles, 0);

  objc_storeStrong((id *)&self->Entitlements, 0);
}

@end
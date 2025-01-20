@interface MIAppReferenceManager
+ (id)defaultManager;
- (BOOL)_countFinalReferences:(unint64_t *)a3 inBundleContainer:(id)a4 withError:(id *)a5;
- (BOOL)_countReferencesWithType:(int)a3 atBaseURL:(id)a4 count:(unint64_t *)a5 withError:(id *)a6;
- (BOOL)_countTemporaryReferences:(unint64_t *)a3 inBundleContainer:(id)a4 withError:(id *)a5;
- (BOOL)_removeReferenceAtURL:(id)a3 personaUniqueString:(id)a4 inBundleContainer:(id)a5 wasLastReference:(BOOL *)a6 resultingPersonaUniqueStrings:(id *)a7 error:(id *)a8;
- (BOOL)_updateReferenceAtURL:(id)a3 byAddingPersonaUniqueString:(id)a4 resultingPersonaUniqueStrings:(id *)a5 error:(id *)a6;
- (BOOL)_updateReferenceAtURL:(id)a3 byRemovingPersonaUniqueString:(id)a4 resultingPersonaUniqueStrings:(id *)a5 error:(id *)a6;
- (BOOL)addReferenceForIdentity:(id)a3 inDomain:(unint64_t)a4 forUserWithID:(unsigned int)a5 resultingPersonaUniqueStrings:(id *)a6 error:(id *)a7;
- (BOOL)addReferenceForUserWithID:(unsigned int)a3 personaUniqueString:(id)a4 byRemovingTemporaryReference:(BOOL)a5 inBundleContainer:(id)a6 resultingPersonaUniqueStrings:(id *)a7 error:(id *)a8;
- (BOOL)addTemporaryReferenceForUserWithID:(unsigned int)a3 personaUniqueString:(id)a4 inBundleContainer:(id)a5 error:(id *)a6;
- (BOOL)finalizeTemporaryReference:(id)a3 resultingPersonaUniqueStrings:(id *)a4 error:(id *)a5;
- (BOOL)removeReferenceForIdentity:(id)a3 inDomain:(unint64_t)a4 forUserWithID:(unsigned int)a5 wasLastReference:(BOOL *)a6 resultingPersonaUniqueStrings:(id *)a7 error:(id *)a8;
- (BOOL)removeReferenceForUserWithID:(unsigned int)a3 personaUniqueString:(id)a4 inBundleContainer:(id)a5 wasLastReference:(BOOL *)a6 resultingPersonaUniqueStrings:(id *)a7 error:(id *)a8;
- (BOOL)removeTemporaryReferenceForUserWithID:(unsigned int)a3 personaUniqueString:(id)a4 inBundleContainer:(id)a5 wasLastReference:(BOOL *)a6 error:(id *)a7;
- (BOOL)revokeTemporaryReference:(id)a3 wasLastReference:(BOOL *)a4 error:(id *)a5;
- (MIAppReferenceManager)init;
- (id)_referenceURLForUserWithID:(unsigned int)a3 inBundleContainer:(id)a4;
- (id)_temporaryReferenceURLForUserWithID:(unsigned int)a3 inBundleContainer:(id)a4;
- (id)addTemporaryReferenceForIdentity:(id)a3 inDomain:(unint64_t)a4 forUserWithID:(unsigned int)a5 error:(id *)a6;
- (id)personaUniqueStringsForAppWithBundleID:(id)a3 domain:(unint64_t)a4 forUserWithID:(unsigned int)a5 error:(id *)a6;
- (id)personaUniqueStringsForAppWithBundleID:(id)a3 error:(id *)a4;
- (id)referencesForIdentifier:(id)a3 inDomain:(unint64_t)a4 error:(id *)a5;
- (void)enumerateAppReferencesWithBlock:(id)a3;
@end

@implementation MIAppReferenceManager

+ (id)defaultManager
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100055B7C;
  block[3] = &unk_10008CC28;
  block[4] = a1;
  if (qword_1000A60B0 != -1) {
    dispatch_once(&qword_1000A60B0, block);
  }
  v2 = (void *)qword_1000A60A8;

  return v2;
}

- (MIAppReferenceManager)init
{
  v3.receiver = self;
  v3.super_class = (Class)MIAppReferenceManager;
  return [(MIAppReferenceManager *)&v3 init];
}

- (BOOL)addReferenceForIdentity:(id)a3 inDomain:(unint64_t)a4 forUserWithID:(unsigned int)a5 resultingPersonaUniqueStrings:(id *)a6 error:(id *)a7
{
  uint64_t v9 = *(void *)&a5;
  id v12 = a3;
  v13 = [v12 bundleID];
  id v24 = 0;
  v14 = +[MIBundleContainer appBundleContainerForIdentifier:v13 inDomain:a4 withError:&v24];
  id v15 = v24;

  if (v14)
  {
    v16 = [v12 personaUniqueString];
    id v22 = v15;
    id v23 = 0;
    BOOL v17 = [(MIAppReferenceManager *)self addReferenceForUserWithID:v9 personaUniqueString:v16 byRemovingTemporaryReference:0 inBundleContainer:v14 resultingPersonaUniqueStrings:&v23 error:&v22];
    id v18 = v23;
    id v19 = v22;

    id v15 = v19;
    if (!a7) {
      goto LABEL_7;
    }
  }
  else
  {
    id v18 = 0;
    BOOL v17 = 0;
    if (!a7) {
      goto LABEL_7;
    }
  }
  if (!v17) {
    *a7 = v15;
  }
LABEL_7:
  char v20 = !v17;
  if (!a6) {
    char v20 = 1;
  }
  if ((v20 & 1) == 0) {
    *a6 = v18;
  }

  return v17;
}

- (BOOL)removeReferenceForIdentity:(id)a3 inDomain:(unint64_t)a4 forUserWithID:(unsigned int)a5 wasLastReference:(BOOL *)a6 resultingPersonaUniqueStrings:(id *)a7 error:(id *)a8
{
  uint64_t v11 = *(void *)&a5;
  id v14 = a3;
  id v15 = [v14 bundleID];
  id v26 = 0;
  v16 = +[MIBundleContainer appBundleContainerForIdentifier:v15 inDomain:a4 withError:&v26];
  id v17 = v26;

  if (v16)
  {
    id v18 = [v14 personaUniqueString];
    id v24 = v17;
    id v25 = 0;
    BOOL v19 = [(MIAppReferenceManager *)self removeReferenceForUserWithID:v11 personaUniqueString:v18 inBundleContainer:v16 wasLastReference:a6 resultingPersonaUniqueStrings:&v25 error:&v24];
    id v20 = v25;
    id v21 = v24;

    id v17 = v21;
    if (!a8) {
      goto LABEL_7;
    }
  }
  else
  {
    id v20 = 0;
    BOOL v19 = 0;
    if (!a8) {
      goto LABEL_7;
    }
  }
  if (!v19) {
    *a8 = v17;
  }
LABEL_7:
  char v22 = !v19;
  if (!a7) {
    char v22 = 1;
  }
  if ((v22 & 1) == 0) {
    *a7 = v20;
  }

  return v19;
}

- (id)addTemporaryReferenceForIdentity:(id)a3 inDomain:(unint64_t)a4 forUserWithID:(unsigned int)a5 error:(id *)a6
{
  uint64_t v7 = *(void *)&a5;
  id v10 = a3;
  uint64_t v11 = [v10 bundleID];
  id v22 = 0;
  id v12 = +[MIBundleContainer appBundleContainerForIdentifier:v11 inDomain:a4 withError:&v22];
  id v13 = v22;

  if (v12)
  {
    id v14 = [v10 personaUniqueString];
    id v21 = v13;
    unsigned int v15 = [(MIAppReferenceManager *)self addTemporaryReferenceForUserWithID:v7 personaUniqueString:v14 inBundleContainer:v12 error:&v21];
    id v16 = v21;

    if (v15)
    {
      id v17 = objc_alloc((Class)MIAppReference);
      id v18 = +[NSUUID UUID];
      id v19 = [v17 initWithReferenceUUID:v18 identity:v10 domain:a4 uid:v7];
    }
    else
    {
      id v19 = 0;
    }
    id v13 = v16;
    if (!a6) {
      goto LABEL_10;
    }
  }
  else
  {
    id v19 = 0;
    if (!a6) {
      goto LABEL_10;
    }
  }
  if (!v19) {
    *a6 = v13;
  }
LABEL_10:

  return v19;
}

- (BOOL)finalizeTemporaryReference:(id)a3 resultingPersonaUniqueStrings:(id *)a4 error:(id *)a5
{
  id v8 = a3;
  uint64_t v9 = [v8 identity];
  id v10 = [v9 bundleID];
  id v22 = 0;
  uint64_t v11 = +[MIBundleContainer appBundleContainerForIdentifier:inDomain:withError:](MIBundleContainer, "appBundleContainerForIdentifier:inDomain:withError:", v10, [v8 domain], &v22);
  id v12 = v22;

  if (v11)
  {
    id v13 = [v8 uid];
    id v14 = [v9 personaUniqueString];
    id v20 = v12;
    id v21 = 0;
    BOOL v15 = [(MIAppReferenceManager *)self addReferenceForUserWithID:v13 personaUniqueString:v14 byRemovingTemporaryReference:1 inBundleContainer:v11 resultingPersonaUniqueStrings:&v21 error:&v20];
    id v16 = v21;
    id v17 = v20;

    id v12 = v17;
    if (!a5) {
      goto LABEL_7;
    }
  }
  else
  {
    id v16 = 0;
    BOOL v15 = 0;
    if (!a5) {
      goto LABEL_7;
    }
  }
  if (!v15) {
    *a5 = v12;
  }
LABEL_7:
  char v18 = !v15;
  if (!a4) {
    char v18 = 1;
  }
  if ((v18 & 1) == 0) {
    *a4 = v16;
  }

  return v15;
}

- (BOOL)revokeTemporaryReference:(id)a3 wasLastReference:(BOOL *)a4 error:(id *)a5
{
  id v8 = a3;
  uint64_t v9 = [v8 identity];
  id v10 = [v9 bundleID];
  id v19 = 0;
  uint64_t v11 = +[MIBundleContainer appBundleContainerForIdentifier:inDomain:withError:](MIBundleContainer, "appBundleContainerForIdentifier:inDomain:withError:", v10, [v8 domain], &v19);
  id v12 = v19;

  if (v11)
  {
    id v13 = [v8 uid];
    id v14 = [v9 personaUniqueString];
    id v18 = v12;
    BOOL v15 = [(MIAppReferenceManager *)self removeTemporaryReferenceForUserWithID:v13 personaUniqueString:v14 inBundleContainer:v11 wasLastReference:a4 error:&v18];
    id v16 = v18;

    id v12 = v16;
    if (!a5) {
      goto LABEL_7;
    }
  }
  else
  {
    BOOL v15 = 0;
    if (!a5) {
      goto LABEL_7;
    }
  }
  if (!v15) {
    *a5 = v12;
  }
LABEL_7:

  return v15;
}

- (id)_referenceURLForUserWithID:(unsigned int)a3 inBundleContainer:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  v5 = [a4 referenceStorageURL];
  v6 = +[NSString stringWithFormat:@"user_%d/%@", v4, @"AppReferences"];
  uint64_t v7 = [v5 URLByAppendingPathComponent:v6 isDirectory:0];

  return v7;
}

- (id)_temporaryReferenceURLForUserWithID:(unsigned int)a3 inBundleContainer:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  v5 = [a4 referenceStorageURL];
  v6 = +[NSString stringWithFormat:@"user_%d/%@", v4, @"TemporaryAppReferences"];
  uint64_t v7 = [v5 URLByAppendingPathComponent:v6 isDirectory:0];

  return v7;
}

- (BOOL)_updateReferenceAtURL:(id)a3 byAddingPersonaUniqueString:(id)a4 resultingPersonaUniqueStrings:(id *)a5 error:(id *)a6
{
  id v9 = a3;
  id v10 = a4;
  uint64_t v11 = +[MIFileManager defaultManager];
  id v38 = 0;
  id v12 = +[MIAppReferenceMetadata referenceMetadataFromURL:v9 error:&v38];
  id v13 = v38;
  id v14 = v13;
  if (!v12)
  {
    id v17 = [v13 domain];
    v33 = a6;
    if ([v17 isEqualToString:NSCocoaErrorDomain])
    {
      id v18 = [v14 code];

      if (v18 == (id)260)
      {
        id v19 = [v9 URLByDeletingLastPathComponent];
        id v20 = [v19 URLByDeletingLastPathComponent];
        id v37 = v14;
        unsigned int v21 = [v11 createDirectoryAtURL:v20 withIntermediateDirectories:0 mode:493 error:&v37];
        id v22 = v37;

        if (v21)
        {
          id v36 = v22;
          unsigned __int8 v23 = [v11 createDirectoryAtURL:v19 withIntermediateDirectories:0 mode:493 error:&v36];
          id v14 = v36;

          if (v23)
          {
            id v12 = objc_opt_new();

            a6 = v33;
            goto LABEL_14;
          }
          id v22 = v14;
        }

LABEL_27:
        id v16 = 0;
        id v12 = 0;
        goto LABEL_31;
      }
    }
    else
    {
    }
    id v35 = 0;
    unsigned __int8 v26 = [v11 removeItemAtURL:v9 error:&v35];
    id v19 = v35;
    if ((v26 & 1) == 0 && (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 3))
    {
      v31 = [v9 path];
      id v32 = v19;
      MOLogWrite();
    }
    v27 = (void *)MIInstallerErrorDomain;
    v28 = [v9 path:v31, v32];
    sub_100014A08((uint64_t)"-[MIAppReferenceManager _updateReferenceAtURL:byAddingPersonaUniqueString:resultingPersonaUniqueStrings:error:]", 222, v27, 4, v14, 0, @"Failed to deserialize temporary references from %@", v29, (uint64_t)v28);
    id v22 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_27;
  }
  BOOL v15 = [v12 personas];
  id v16 = [v15 mutableCopy];

  if (!v16)
  {
LABEL_14:
    id v16 = (id)objc_opt_new();
    goto LABEL_15;
  }
  if (![v16 count])
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT)) {
      sub_10005A534(v9);
    }
    if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 3)
    {
      v31 = [v9 path];
      MOLogWrite();
    }
  }
LABEL_15:
  if ((objc_msgSend(v16, "containsObject:", v10, v31) & 1) == 0)
  {
    v33 = a6;
    [v16 addObject:v10];
    id v24 = [v16 copy];
    [v12 setPersonas:v24];

    id v34 = v14;
    LOBYTE(v24) = [v12 serializeToURL:v9 error:&v34];
    id v22 = v34;

    if (v24)
    {
      id v14 = v22;
      goto LABEL_18;
    }
    if (qword_1000A60B8 && *(int *)(qword_1000A60B8 + 44) < 3)
    {
LABEL_32:
      id v14 = v22;
      if (v33)
      {
        id v14 = v22;
        BOOL v25 = 0;
        id *v33 = v14;
      }
      else
      {
        BOOL v25 = 0;
      }
      goto LABEL_35;
    }
    id v19 = [v9 path];
    MOLogWrite();
LABEL_31:

    goto LABEL_32;
  }
LABEL_18:
  if (a5)
  {
    *a5 = +[NSSet setWithArray:v16];
  }
  BOOL v25 = 1;
LABEL_35:

  return v25;
}

- (BOOL)_updateReferenceAtURL:(id)a3 byRemovingPersonaUniqueString:(id)a4 resultingPersonaUniqueStrings:(id *)a5 error:(id *)a6
{
  id v9 = a3;
  id v10 = a4;
  uint64_t v11 = +[MIFileManager defaultManager];
  id v40 = 0;
  id v12 = +[MIAppReferenceMetadata referenceMetadataFromURL:v9 error:&v40];
  id v13 = v40;
  id v14 = v13;
  if (!v12)
  {
    unsigned int v21 = [v13 domain];
    if ([v21 isEqualToString:NSCocoaErrorDomain])
    {
      id v22 = [v14 code];

      if (v22 == (id)260)
      {

        id v16 = 0;
        if (!a5)
        {
          BOOL v29 = 1;
          id v14 = 0;
          goto LABEL_38;
        }
        id v14 = 0;
LABEL_12:
        unsigned __int8 v23 = 0;
LABEL_36:
        id v32 = v23;
        *a5 = v32;

        goto LABEL_37;
      }
    }
    else
    {
    }
    id v39 = 0;
    unsigned __int8 v25 = [v11 removeItemAtURL:v9 error:&v39];
    id v24 = v39;
    if ((v25 & 1) == 0 && (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 3))
    {
      id v34 = [v9 path];
      id v36 = v24;
      MOLogWrite();
    }
    unsigned __int8 v26 = (void *)MIInstallerErrorDomain;
    v27 = [v9 path:v34, v36];
    sub_100014A08((uint64_t)"-[MIAppReferenceManager _updateReferenceAtURL:byRemovingPersonaUniqueString:resultingPersonaUniqueStrings:error:]", 280, v26, 4, v14, 0, @"Failed to deserialize temporary references from %@", v28, (uint64_t)v27);
    id v20 = (id)objc_claimAutoreleasedReturnValue();

    id v16 = 0;
    goto LABEL_20;
  }
  BOOL v15 = [v12 personas];
  id v16 = [v15 mutableCopy];

  if (!v16)
  {
    if (!a5) {
      goto LABEL_37;
    }
    goto LABEL_12;
  }
  if ([v16 containsObject:v10])
  {
    [v16 removeObject:v10];
    id v18 = [v16 copy];
    [v12 setPersonas:v18];

    if (![v16 count])
    {
      id v37 = v14;
      unsigned __int8 v30 = [v11 removeItemAtURL:v9 error:&v37];
      id v31 = v37;

      if (v30)
      {
        id v14 = v31;
      }
      else
      {
        if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 3)
        {
          id v35 = [v9 path];
          MOLogWrite();
        }
        id v14 = 0;
      }
LABEL_34:
      if (a5)
      {
        unsigned __int8 v23 = +[NSSet setWithArray:v16];
        goto LABEL_36;
      }
LABEL_37:
      BOOL v29 = 1;
      goto LABEL_38;
    }
    id v38 = v14;
    unsigned __int8 v19 = [v12 serializeToURL:v9 error:&v38];
    id v20 = v38;

    if (v19)
    {
      id v14 = v20;
      goto LABEL_34;
    }
    if (qword_1000A60B8 && *(int *)(qword_1000A60B8 + 44) < 3) {
      goto LABEL_21;
    }
    id v24 = [v9 path];
    MOLogWrite();
  }
  else
  {
    sub_100014A08((uint64_t)"-[MIAppReferenceManager _updateReferenceAtURL:byRemovingPersonaUniqueString:resultingPersonaUniqueStrings:error:]", 289, MIInstallerErrorDomain, 4, 0, 0, @"Persona %@ not found in %@", v17, (uint64_t)v10);
    id v20 = (id)objc_claimAutoreleasedReturnValue();
    id v24 = v14;
  }
LABEL_20:

LABEL_21:
  id v14 = v20;
  if (a6)
  {
    id v14 = v20;
    BOOL v29 = 0;
    *a6 = v14;
  }
  else
  {
    BOOL v29 = 0;
  }
LABEL_38:

  return v29;
}

- (BOOL)_countReferencesWithType:(int)a3 atBaseURL:(id)a4 count:(unint64_t *)a5 withError:(id *)a6
{
  id v9 = a4;
  uint64_t v23 = 0;
  id v24 = &v23;
  uint64_t v25 = 0x2020000000;
  uint64_t v26 = 0;
  uint64_t v17 = 0;
  id v18 = (id *)&v17;
  uint64_t v19 = 0x3032000000;
  id v20 = sub_100056E3C;
  unsigned int v21 = sub_100056E4C;
  id v22 = 0;
  id v10 = +[MIFileManager defaultManager];
  if ([v10 itemDoesNotExistAtURL:v9])
  {
    if (a5) {
      *a5 = 0;
    }
    BOOL v11 = 1;
  }
  else
  {
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_100056E54;
    v15[3] = &unk_10008DB88;
    int v16 = a3;
    v15[4] = &v17;
    v15[5] = &v23;
    id v12 = [v10 traverseDirectoryAtURL:v9 withBlock:v15];
    if (v12) {
      objc_storeStrong(v18 + 5, v12);
    }
    id v13 = v18[5];
    BOOL v11 = v13 == 0;
    if (v13)
    {
      if (a6) {
        *a6 = v13;
      }
    }
    else if (a5)
    {
      *a5 = v24[3];
    }
  }
  _Block_object_dispose(&v17, 8);

  _Block_object_dispose(&v23, 8);
  return v11;
}

- (BOOL)_countFinalReferences:(unint64_t *)a3 inBundleContainer:(id)a4 withError:(id *)a5
{
  id v8 = [a4 referenceStorageURL];
  LOBYTE(a5) = [(MIAppReferenceManager *)self _countReferencesWithType:2 atBaseURL:v8 count:a3 withError:a5];

  return (char)a5;
}

- (BOOL)_countTemporaryReferences:(unint64_t *)a3 inBundleContainer:(id)a4 withError:(id *)a5
{
  id v8 = [a4 referenceStorageURL];
  LOBYTE(a5) = [(MIAppReferenceManager *)self _countReferencesWithType:1 atBaseURL:v8 count:a3 withError:a5];

  return (char)a5;
}

- (BOOL)addTemporaryReferenceForUserWithID:(unsigned int)a3 personaUniqueString:(id)a4 inBundleContainer:(id)a5 error:(id *)a6
{
  uint64_t v8 = *(void *)&a3;
  id v10 = a4;
  BOOL v11 = [(MIAppReferenceManager *)self _temporaryReferenceURLForUserWithID:v8 inBundleContainer:a5];
  LOBYTE(a6) = [(MIAppReferenceManager *)self _updateReferenceAtURL:v11 byAddingPersonaUniqueString:v10 resultingPersonaUniqueStrings:0 error:a6];

  return (char)a6;
}

- (BOOL)addReferenceForUserWithID:(unsigned int)a3 personaUniqueString:(id)a4 byRemovingTemporaryReference:(BOOL)a5 inBundleContainer:(id)a6 resultingPersonaUniqueStrings:(id *)a7 error:(id *)a8
{
  BOOL v11 = a5;
  uint64_t v12 = *(void *)&a3;
  id v14 = a4;
  id v15 = a6;
  int v16 = [(MIAppReferenceManager *)self _referenceURLForUserWithID:v12 inBundleContainer:v15];
  if (v11
    && ![(MIAppReferenceManager *)self removeTemporaryReferenceForUserWithID:v12 personaUniqueString:v14 inBundleContainer:v15 wasLastReference:0 error:a8])
  {
    BOOL v17 = 0;
  }
  else
  {
    BOOL v17 = [(MIAppReferenceManager *)self _updateReferenceAtURL:v16 byAddingPersonaUniqueString:v14 resultingPersonaUniqueStrings:a7 error:a8];
  }

  return v17;
}

- (BOOL)_removeReferenceAtURL:(id)a3 personaUniqueString:(id)a4 inBundleContainer:(id)a5 wasLastReference:(BOOL *)a6 resultingPersonaUniqueStrings:(id *)a7 error:(id *)a8
{
  id v14 = a4;
  id v15 = a5;
  unsigned int v16 = [(MIAppReferenceManager *)self _updateReferenceAtURL:a3 byRemovingPersonaUniqueString:v14 resultingPersonaUniqueStrings:a7 error:a8];
  BOOL v17 = v16;
  if (a6 && v16)
  {
    uint64_t v29 = 0;
    uint64_t v30 = 0;
    id v28 = 0;
    unsigned __int8 v18 = [(MIAppReferenceManager *)self _countFinalReferences:&v30 inBundleContainer:v15 withError:&v28];
    id v19 = v28;
    if ((v18 & 1) == 0)
    {
      if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 3)
      {
        id v24 = v19;
        MOLogWrite();
      }

      id v19 = 0;
    }
    id v27 = v19;
    unsigned __int8 v20 = -[MIAppReferenceManager _countTemporaryReferences:inBundleContainer:withError:](self, "_countTemporaryReferences:inBundleContainer:withError:", &v29, v15, &v27, v24);
    id v21 = v27;

    uint64_t v22 = qword_1000A60B8;
    if ((v20 & 1) == 0)
    {
      if (qword_1000A60B8 && *(int *)(qword_1000A60B8 + 44) < 3)
      {
LABEL_13:
        if (*(int *)(v22 + 44) < 5)
        {
LABEL_15:
          *a6 = v30 + v29 == 0;

          goto LABEL_16;
        }
LABEL_14:
        uint64_t v26 = [v15 identifier:v25];
        MOLogWrite();

        goto LABEL_15;
      }
      id v25 = v21;
      MOLogWrite();
      uint64_t v22 = qword_1000A60B8;
    }
    if (!v22) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }
LABEL_16:

  return v17;
}

- (BOOL)removeTemporaryReferenceForUserWithID:(unsigned int)a3 personaUniqueString:(id)a4 inBundleContainer:(id)a5 wasLastReference:(BOOL *)a6 error:(id *)a7
{
  uint64_t v10 = *(void *)&a3;
  id v12 = a5;
  id v13 = a4;
  id v14 = [(MIAppReferenceManager *)self _temporaryReferenceURLForUserWithID:v10 inBundleContainer:v12];
  LOBYTE(a7) = [(MIAppReferenceManager *)self _removeReferenceAtURL:v14 personaUniqueString:v13 inBundleContainer:v12 wasLastReference:a6 resultingPersonaUniqueStrings:0 error:a7];

  return (char)a7;
}

- (BOOL)removeReferenceForUserWithID:(unsigned int)a3 personaUniqueString:(id)a4 inBundleContainer:(id)a5 wasLastReference:(BOOL *)a6 resultingPersonaUniqueStrings:(id *)a7 error:(id *)a8
{
  uint64_t v12 = *(void *)&a3;
  id v14 = a5;
  id v15 = a4;
  unsigned int v16 = [(MIAppReferenceManager *)self _referenceURLForUserWithID:v12 inBundleContainer:v14];
  LOBYTE(a8) = [(MIAppReferenceManager *)self _removeReferenceAtURL:v16 personaUniqueString:v15 inBundleContainer:v14 wasLastReference:a6 resultingPersonaUniqueStrings:a7 error:a8];

  return (char)a8;
}

- (void)enumerateAppReferencesWithBlock:(id)a3
{
  if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 3) {
    MOLogWrite();
  }
}

- (id)referencesForIdentifier:(id)a3 inDomain:(unint64_t)a4 error:(id *)a5
{
  id v28 = a3;
  uint64_t v26 = objc_opt_new();
  uint64_t v7 = sub_10000EBF4();
  int v8 = sub_10000EB14();
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v9 = v7;
  id v10 = [v9 countByEnumeratingWithState:&v30 objects:v34 count:16];
  id v27 = v9;
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = 0;
    uint64_t v13 = *(void *)v31;
LABEL_3:
    uint64_t v14 = 0;
    while (1)
    {
      if (*(void *)v31 != v13) {
        objc_enumerationMutation(v9);
      }
      id v15 = [*(id *)(*((void *)&v30 + 1) + 8 * v14) uid];
      id v16 = v15;
      if (a4 != 3 || v8 == v15)
      {
        id v29 = v12;
        id v17 = [(MIAppReferenceManager *)self personaUniqueStringsForAppWithBundleID:v28 domain:a4 forUserWithID:v15 error:&v29];
        id v18 = v29;

        if (!v17)
        {

          unsigned __int8 v20 = a5;
          id v21 = v26;
          if (a5) {
            goto LABEL_20;
          }
          goto LABEL_22;
        }
        id v19 = +[NSNumber numberWithUnsignedInt:v16];
        [v26 setObject:v17 forKeyedSubscript:v19];

        uint64_t v12 = v18;
        id v9 = v27;
      }
      if (v11 == (id)++v14)
      {
        id v11 = [v9 countByEnumeratingWithState:&v30 objects:v34 count:16];
        if (v11) {
          goto LABEL_3;
        }
        goto LABEL_16;
      }
    }
  }
  uint64_t v12 = 0;
LABEL_16:

  id v21 = v26;
  if ([v26 count])
  {
    id v17 = [v26 copy];
    id v18 = v12;
  }
  else
  {
    sub_100014A08((uint64_t)"-[MIAppReferenceManager referencesForIdentifier:inDomain:error:]", 511, MIInstallerErrorDomain, 4, 0, 0, @"Unexpectedly got no references for %@ for users %@", v22, (uint64_t)v28);
    id v18 = (id)objc_claimAutoreleasedReturnValue();

    id v17 = 0;
  }
  unsigned __int8 v20 = a5;
  if (a5)
  {
LABEL_20:
    if (!v17) {
      *unsigned __int8 v20 = v18;
    }
  }
LABEL_22:
  id v23 = v17;

  return v23;
}

- (id)personaUniqueStringsForAppWithBundleID:(id)a3 domain:(unint64_t)a4 forUserWithID:(unsigned int)a5 error:(id *)a6
{
  uint64_t v7 = *(void *)&a5;
  id v27 = 0;
  id v9 = +[MIBundleContainer appBundleContainerForIdentifier:a3 inDomain:a4 withError:&v27];
  id v10 = v27;
  if (v9)
  {
    id v11 = [(MIAppReferenceManager *)self _referenceURLForUserWithID:v7 inBundleContainer:v9];
    id v26 = v10;
    uint64_t v12 = +[MIAppReferenceMetadata referenceMetadataFromURL:v11 error:&v26];
    id v13 = v26;

    if (v12)
    {
      uint64_t v14 = [v12 personas];
      id v15 = v14;
      if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) < 7) {
        goto LABEL_18;
      }
      id v16 = [v14 count];
      id v17 = [v11 path];
      id v24 = v15;
      id v25 = v17;
      id v23 = v16;
      MOLogWrite();
      goto LABEL_6;
    }
    id v19 = [v13 domain];
    if ([v19 isEqualToString:NSCocoaErrorDomain])
    {
      id v20 = [v13 code];

      if (v20 == (id)260)
      {

        id v13 = (id)qword_1000A60B8;
        if (qword_1000A60B8)
        {
          if (*(int *)(qword_1000A60B8 + 44) >= 7)
          {
            id v17 = [v11 path];
            id v23 = v17;
            MOLogWrite();
            id v13 = 0;
            id v15 = &__NSArray0__struct;
LABEL_6:

LABEL_18:
            id v18 = +[NSSet setWithArray:](NSSet, "setWithArray:", v15, v23, v24, v25);
LABEL_19:
            id v10 = v13;
            if (!a6) {
              goto LABEL_22;
            }
            goto LABEL_20;
          }
          id v13 = 0;
        }
        id v15 = &__NSArray0__struct;
        goto LABEL_18;
      }
    }
    else
    {
    }
    id v18 = 0;
    uint64_t v12 = 0;
    id v15 = 0;
    goto LABEL_19;
  }
  id v18 = 0;
  id v11 = 0;
  uint64_t v12 = 0;
  id v15 = 0;
  if (!a6) {
    goto LABEL_22;
  }
LABEL_20:
  if (!v18) {
    *a6 = v10;
  }
LABEL_22:
  id v21 = v18;

  return v21;
}

- (id)personaUniqueStringsForAppWithBundleID:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = [(MIAppReferenceManager *)self personaUniqueStringsForAppWithBundleID:v6 domain:2 forUserWithID:sub_10000EB14() error:a4];

  return v7;
}

@end
@interface MISafeHarborManager
+ (id)defaultManager;
- (BOOL)registerSafeHarborAtURL:(id)a3 withOptions:(id)a4 forIdentifier:(id)a5 forPersona:(id)a6 ofType:(unint64_t)a7 error:(id *)a8;
- (BOOL)removeSafeHarborWithIdentifier:(id)a3 forPersona:(id)a4 ofType:(unint64_t)a5 options:(id)a6 error:(id *)a7;
- (id)safeHarborListForType:(unint64_t)a3 forPersona:(id)a4 withError:(id *)a5;
@end

@implementation MISafeHarborManager

+ (id)defaultManager
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10004B334;
  block[3] = &unk_10008CC28;
  block[4] = a1;
  if (qword_1000A6068 != -1) {
    dispatch_once(&qword_1000A6068, block);
  }
  v2 = (void *)qword_1000A6060;

  return v2;
}

- (BOOL)registerSafeHarborAtURL:(id)a3 withOptions:(id)a4 forIdentifier:(id)a5 forPersona:(id)a6 ofType:(unint64_t)a7 error:(id *)a8
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v17 = a6;
  if (a7 > 7 || ((1 << a7) & 0x94) == 0)
  {
    sub_100014A08((uint64_t)"-[MISafeHarborManager registerSafeHarborAtURL:withOptions:forIdentifier:forPersona:ofType:error:]", 257, MIInstallerErrorDomain, 25, 0, 0, @"Safe harbors are not supported for container type %ld", v16, a7);
    id v20 = (id)objc_claimAutoreleasedReturnValue();
    if (!a8) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
  sub_100054F88(v15);
  v18 = +[MIHelperServiceClient sharedInstance];
  id v23 = 0;
  unsigned int v19 = [v18 createSafeHarborWithIdentifier:v15 forPersona:v17 containerType:a7 andMigrateDataFrom:v13 withError:&v23];
  id v20 = v23;

  if (v19)
  {

    BOOL v21 = 1;
LABEL_12:
    sub_1000550D8(v15);
    goto LABEL_13;
  }
  if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 3) {
    MOLogWrite();
  }
  if (a8) {
LABEL_9:
  }
    *a8 = v20;
LABEL_10:

  BOOL v21 = 0;
  if (a7 <= 7 && ((1 << a7) & 0x94) != 0) {
    goto LABEL_12;
  }
LABEL_13:

  return v21;
}

- (BOOL)removeSafeHarborWithIdentifier:(id)a3 forPersona:(id)a4 ofType:(unint64_t)a5 options:(id)a6 error:(id *)a7
{
  id v11 = a3;
  id v12 = a4;
  id v30 = a6;
  if (a5 > 7 || ((1 << a5) & 0x94) == 0)
  {
    v24 = sub_100014A08((uint64_t)"-[MISafeHarborManager removeSafeHarborWithIdentifier:forPersona:ofType:options:error:]", 312, MIInstallerErrorDomain, 25, 0, 0, @"Safe harbors are not supported for container type %ld", v13, a5);
    if (!a7) {
      goto LABEL_20;
    }
    goto LABEL_19;
  }
  sub_100054F88(v11);
  id v33 = 0;
  id v14 = +[MIContainer containerWithIdentifier:v11 forPersona:v12 ofContentClass:a5 createIfNeeded:0 created:0 error:&v33];
  id v15 = v33;
  id v17 = v15;
  if (!v14)
  {
    v24 = sub_100014A08((uint64_t)"-[MISafeHarborManager removeSafeHarborWithIdentifier:forPersona:ofType:options:error:]", 321, MIInstallerErrorDomain, 26, v15, 0, @"Safe harbor with identifier %@ persona %@ of type %ld not found", v16, (uint64_t)v11);
    goto LABEL_18;
  }
  id v32 = v15;
  v18 = [v14 infoValueForKey:@"com.apple.MobileContainerManager.SafeHarborInfo" error:&v32];
  id v19 = v32;

  if (v18)
  {
    id v31 = v19;
    unsigned int v20 = [v14 removeUnderlyingContainerWaitingForDeletion:0 error:&v31];
    id v21 = v31;

    if (v20)
    {

      BOOL v23 = 1;
LABEL_22:
      sub_1000550D8(v11);
      goto LABEL_23;
    }
    v24 = sub_100014A08((uint64_t)"-[MISafeHarborManager removeSafeHarborWithIdentifier:forPersona:ofType:options:error:]", 337, MIInstallerErrorDomain, 4, v21, 0, @"Failed to destroy safe harbor container %@", v22, (uint64_t)v14);

    id v19 = v14;
    id v14 = v18;
    goto LABEL_17;
  }
  v25 = [v19 domain];
  if (![v25 isEqualToString:MIContainerManagerErrorDomain])
  {

    goto LABEL_15;
  }
  id v26 = [v19 code];

  if (v26 != (id)24)
  {
LABEL_15:
    uint64_t v28 = sub_100014A08((uint64_t)"-[MISafeHarborManager removeSafeHarborWithIdentifier:forPersona:ofType:options:error:]", 331, MIInstallerErrorDomain, 4, v19, 0, @"Unable to get safe harbor container attribute from container %@ : %@", v27, (uint64_t)v14);
    goto LABEL_16;
  }
  uint64_t v28 = sub_100014A08((uint64_t)"-[MISafeHarborManager removeSafeHarborWithIdentifier:forPersona:ofType:options:error:]", 329, MIInstallerErrorDomain, 26, v19, 0, @"Safe harbor with identifier %@ persona %@ of type %ld was already installed.", v27, (uint64_t)v11);
LABEL_16:
  v24 = (void *)v28;
LABEL_17:

  id v17 = v14;
LABEL_18:

  if (a7) {
LABEL_19:
  }
    *a7 = v24;
LABEL_20:

  BOOL v23 = 0;
  if (a5 <= 7 && ((1 << a5) & 0x94) != 0) {
    goto LABEL_22;
  }
LABEL_23:

  return v23;
}

- (id)safeHarborListForType:(unint64_t)a3 forPersona:(id)a4 withError:(id *)a5
{
  id v31 = a4;
  id v33 = +[NSMutableDictionary dictionaryWithCapacity:0];
  if (a3 > 7 || ((1 << a3) & 0x94) == 0)
  {
    sub_100014A08((uint64_t)"-[MISafeHarborManager safeHarborListForType:forPersona:withError:]", 384, MIInstallerErrorDomain, 25, 0, 0, @"Safe harbors are not supported for container type %ld", v5, a3);
    id v12 = (id)objc_claimAutoreleasedReturnValue();
    id v26 = 0;
    goto LABEL_43;
  }
  sub_100055588();
  id v41 = 0;
  v6 = +[MIContainer containersWithClass:a3 personaUniqueString:v31 error:&v41];
  id v7 = v41;
  v9 = v7;
  if (!v6)
  {
    sub_100014A08((uint64_t)"-[MISafeHarborManager safeHarborListForType:forPersona:withError:]", 393, MIInstallerErrorDomain, 4, v7, 0, @"Failed to get list of containers of type %ld for persona %@: %@", v8, a3);
    id v12 = (id)objc_claimAutoreleasedReturnValue();
    id v26 = 0;
    goto LABEL_42;
  }
  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id obj = v6;
  id v10 = [obj countByEnumeratingWithState:&v37 objects:v42 count:16];
  if (!v10)
  {
    id v12 = v9;
    goto LABEL_41;
  }
  uint64_t v11 = *(void *)v38;
  uint64_t v34 = MIContainerManagerErrorDomain;
  id v12 = v9;
  do
  {
    uint64_t v13 = 0;
    id v14 = v12;
    do
    {
      if (*(void *)v38 != v11) {
        objc_enumerationMutation(obj);
      }
      id v15 = *(void **)(*((void *)&v37 + 1) + 8 * (void)v13);
      id v36 = v14;
      id v17 = [v15 infoValueForKey:@"com.apple.MobileContainerManager.SafeHarborInfo" error:&v36];
      id v12 = v36;

      if (v17)
      {
        objc_opt_class();
        id v18 = v17;
        if (objc_opt_isKindOfClass()) {
          id v19 = v18;
        }
        else {
          id v19 = 0;
        }

        if (v19)
        {
          id v22 = [v18 mutableCopy];
          BOOL v23 = [v15 containerURL];
          v24 = [v23 path];

          if (v24)
          {
            [v22 setObject:v24 forKeyedSubscript:@"HarborPathKey"];
            v25 = [v15 identifier];
            if (v25)
            {
              [v33 setObject:v22 forKeyedSubscript:v25];
            }
            else if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 3)
            {
              MOLogWrite();
            }
          }
          else if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 3)
          {
            MOLogWrite();
          }
        }
        else if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 3)
        {
          goto LABEL_22;
        }
      }
      else
      {
        unsigned int v20 = [v12 domain];
        if ([v20 isEqualToString:v34])
        {
          BOOL v21 = [v12 code] == (id)24;

          if (v21) {
            goto LABEL_35;
          }
        }
        else
        {
        }
        if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 3) {
LABEL_22:
        }
          MOLogWrite();
      }
LABEL_35:

      uint64_t v13 = (char *)v13 + 1;
      id v14 = v12;
    }
    while (v10 != v13);
    id v10 = [obj countByEnumeratingWithState:&v37 objects:v42 count:16];
  }
  while (v10);
LABEL_41:

  id v26 = [v33 copy];
  v9 = obj;
LABEL_42:

LABEL_43:
  if (a5 && !v26) {
    *a5 = v12;
  }

  if (a3 <= 7 && ((1 << a3) & 0x94) != 0) {
    sub_100055718(v27, v28);
  }

  return v26;
}

@end
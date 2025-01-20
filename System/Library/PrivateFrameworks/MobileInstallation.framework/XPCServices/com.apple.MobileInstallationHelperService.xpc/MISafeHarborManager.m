@interface MISafeHarborManager
+ (id)defaultManager;
- (BOOL)fromMIH_createSafeHarborWithIdentifier:(id)a3 forPersona:(id)a4 containerType:(unint64_t)a5 andMigrateDataFrom:(id)a6 containsOneOrMoreSymlinks:(BOOL)a7 withError:(id *)a8;
@end

@implementation MISafeHarborManager

+ (id)defaultManager
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000A4F8;
  block[3] = &unk_100020A98;
  block[4] = a1;
  if (qword_100025B40 != -1) {
    dispatch_once(&qword_100025B40, block);
  }
  v2 = (void *)qword_100025B38;
  return v2;
}

- (BOOL)fromMIH_createSafeHarborWithIdentifier:(id)a3 forPersona:(id)a4 containerType:(unint64_t)a5 andMigrateDataFrom:(id)a6 containsOneOrMoreSymlinks:(BOOL)a7 withError:(id *)a8
{
  BOOL v9 = a7;
  id v60 = a3;
  id v59 = a4;
  id v13 = a6;
  uint64_t v77 = 0;
  v78 = &v77;
  uint64_t v79 = 0x3032000000;
  v80 = sub_10000AE34;
  v81 = sub_10000AE44;
  id v82 = 0;
  v58 = [v13 URLByAppendingPathComponent:@"Container" isDirectory:1];
  v14 = [v13 URLByAppendingPathComponent:@"Info" isDirectory:1];
  v61 = [v14 URLByAppendingPathComponent:@"Info.plist" isDirectory:0];
  v15 = +[MIFileManager defaultManager];
  v17 = v15;
  if (a5 > 7 || ((1 << a5) & 0x94) == 0)
  {
    uint64_t v22 = _CreateAndLogError((uint64_t)"-[MISafeHarborManager fromMIH_createSafeHarborWithIdentifier:forPersona:containerType:andMigrateDataFrom:containsOneOrMoreSymlinks:withError:]", 71, MIInstallerErrorDomain, 25, 0, 0, @"Safe harbors are not supported for container type %ld", v16, a5);
LABEL_12:
    id v23 = (id)v22;
    v24 = 0;
    v25 = 0;
    goto LABEL_13;
  }
  if (v9)
  {
    if ([v15 itemIsSymlinkAtURL:v58 error:0])
    {
      v19 = @"Safe harbor's Container directory at %@ is unexpectedly a symlink.";
      uint64_t v20 = 79;
      uint64_t v21 = (uint64_t)v58;
LABEL_11:
      uint64_t v22 = _CreateAndLogError((uint64_t)"-[MISafeHarborManager fromMIH_createSafeHarborWithIdentifier:forPersona:containerType:andMigrateDataFrom:containsOneOrMoreSymlinks:withError:]", v20, MIInstallerErrorDomain, 160, 0, 0, v19, v18, v21);
      goto LABEL_12;
    }
    if ([v17 itemIsSymlinkAtURL:v14 error:0])
    {
      v19 = @"Safe harbor's Info directory at %@ is unexpectedly a symlink.";
      uint64_t v20 = 84;
      uint64_t v21 = (uint64_t)v14;
      goto LABEL_11;
    }
    if ([v17 itemIsSymlinkAtURL:v61 error:0])
    {
      v19 = @"Safe harbor's Info.plist at %@ is unexpectedly a symlink.";
      uint64_t v20 = 89;
      uint64_t v21 = (uint64_t)v61;
      goto LABEL_11;
    }
  }
  id v76 = 0;
  v25 = +[NSDictionary dictionaryWithContentsOfURL:v61 error:&v76];
  id v31 = v76;
  if (!v25)
  {
    _CreateAndLogError((uint64_t)"-[MISafeHarborManager fromMIH_createSafeHarborWithIdentifier:forPersona:containerType:andMigrateDataFrom:containsOneOrMoreSymlinks:withError:]", 98, MIInstallerErrorDomain, 31, v31, 0, @"Could not load safe harbor Info.plist at path %@", v30, (uint64_t)v61);
    id v23 = (id)objc_claimAutoreleasedReturnValue();
    v24 = 0;
    v25 = 0;
    goto LABEL_39;
  }
  id v75 = v31;
  v32 = +[MIDataContainer containerWithIdentifier:v60 forPersona:v59 ofContentClass:a5 createIfNeeded:0 created:0 error:&v75];
  id v23 = v75;

  if (v32)
  {

    _CreateAndLogError((uint64_t)"-[MISafeHarborManager fromMIH_createSafeHarborWithIdentifier:forPersona:containerType:andMigrateDataFrom:containsOneOrMoreSymlinks:withError:]", 107, MIInstallerErrorDomain, 32, 0, 0, @"Safe harbor already exists with identifier %@ persona %@ for type %ld", v33, (uint64_t)v60);
    id v34 = (id)objc_claimAutoreleasedReturnValue();
    v24 = 0;
    id v26 = 0;
    id v31 = v23;
LABEL_25:
    id v23 = v34;
    goto LABEL_40;
  }
  id v31 = [v23 domain];
  if (![v31 isEqualToString:MIContainerManagerErrorDomain])
  {
LABEL_38:
    v24 = 0;
    goto LABEL_39;
  }
  id v36 = [v23 code];

  if (v36 == (id)21)
  {
    id v74 = v23;
    v24 = +[MIDataContainer tempContainerWithIdentifier:v60 forPersona:v59 ofContentClass:a5 error:&v74];
    id v31 = v74;

    if (v24)
    {
      id v26 = [v24 containerURL];
      if (v26)
      {
        id v73 = v31;
        unsigned __int8 v55 = [v24 setInfoValue:v25 forKey:@"com.apple.MobileContainerManager.SafeHarborInfo" error:&v73];
        id v39 = v73;

        if ((v55 & 1) == 0)
        {
          id v31 = v39;
          _CreateAndLogError((uint64_t)"-[MISafeHarborManager fromMIH_createSafeHarborWithIdentifier:forPersona:containerType:andMigrateDataFrom:containsOneOrMoreSymlinks:withError:]", 129, MIInstallerErrorDomain, 21, v39, 0, @"Failed to set safe harbor attribute on new safe harbor container with identifier %@ persona %@ type %ld: %@", v40, (uint64_t)v60);
          id v34 = (id)objc_claimAutoreleasedReturnValue();
          goto LABEL_25;
        }
        v52 = v39;
        v53 = +[NSString stringWithFormat:@"%@/%ld", v60, a5];
        v41 = +[MIDaemonConfiguration sharedInstance];
        v42 = [v41 dataContainerRootItemNames];

        v66[0] = _NSConcreteStackBlock;
        v66[1] = 3221225472;
        v66[2] = sub_10000AE4C;
        v66[3] = &unk_100020AC0;
        BOOL v72 = a5 != 7;
        id v56 = v53;
        id v67 = v56;
        id v43 = v42;
        id v68 = v43;
        id v26 = v26;
        id v69 = v26;
        id v70 = v17;
        v71 = &v77;
        id v54 = v70;
        id v31 = [v70 enumerateURLsForItemsInDirectoryAtURL:v58 ignoreSymlinks:1 withBlock:v66];

        v44 = (void *)v78[5];
        if (v44)
        {
          id v34 = v44;
          goto LABEL_25;
        }
        if (v31)
        {
          id v57 = [v58 path];
          _CreateAndLogError((uint64_t)"-[MISafeHarborManager fromMIH_createSafeHarborWithIdentifier:forPersona:containerType:andMigrateDataFrom:containsOneOrMoreSymlinks:withError:]", 197, MIInstallerErrorDomain, 21, v31, 0, @"Failed to enumerate URLs for items in safe harbor's container directory at %@ : %@", v45, (uint64_t)v57);
          id v23 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          id v65 = 0;
          unsigned __int8 v46 = [v24 recreateDefaultStructureWithError:&v65];
          id v47 = v65;
          id v31 = v47;
          if ((v46 & 1) == 0)
          {
            _CreateAndLogError((uint64_t)"-[MISafeHarborManager fromMIH_createSafeHarborWithIdentifier:forPersona:containerType:andMigrateDataFrom:containsOneOrMoreSymlinks:withError:]", 203, MIInstallerErrorDomain, 21, v47, 0, @"Failed to recreate default container structure for container with identifier %@ persona %@ type %ld: %@", v48, (uint64_t)v60);
            id v34 = (id)objc_claimAutoreleasedReturnValue();
            goto LABEL_25;
          }
          id v64 = v47;
          unsigned __int8 v49 = [v24 makeContainerLiveWithError:&v64];
          id v57 = v64;

          if (v49)
          {
            id v63 = v57;
            unsigned __int8 v51 = [v54 removeItemAtURL:v13 error:&v63];
            id v23 = v63;

            if ((v51 & 1) != 0 || gLogHandle && *(int *)(gLogHandle + 44) < 3)
            {
              BOOL v29 = 1;
              goto LABEL_27;
            }
            id v28 = [v13 path];
            MOLogWrite();
            BOOL v29 = 1;
            goto LABEL_21;
          }
          _CreateAndLogError((uint64_t)"-[MISafeHarborManager fromMIH_createSafeHarborWithIdentifier:forPersona:containerType:andMigrateDataFrom:containsOneOrMoreSymlinks:withError:]", 209, MIInstallerErrorDomain, 21, v57, 0, @"Failed to make safe harbor active for container with identifier %@ persona %@ type %ld: %@", v50, (uint64_t)v60);
          id v23 = (id)objc_claimAutoreleasedReturnValue();
        }
        id v31 = v57;
LABEL_40:

        if (!a8) {
          goto LABEL_15;
        }
        goto LABEL_14;
      }
      _CreateAndLogError((uint64_t)"-[MISafeHarborManager fromMIH_createSafeHarborWithIdentifier:forPersona:containerType:andMigrateDataFrom:containsOneOrMoreSymlinks:withError:]", 123, MIInstallerErrorDomain, 21, 0, 0, @"Failed to get URL for new safe harbor container with identifier %@ persona %@ type %ld: %@", v38, (uint64_t)v60);
      id v23 = (id)objc_claimAutoreleasedReturnValue();
LABEL_39:
      id v26 = 0;
      goto LABEL_40;
    }
    _CreateAndLogError((uint64_t)"-[MISafeHarborManager fromMIH_createSafeHarborWithIdentifier:forPersona:containerType:andMigrateDataFrom:containsOneOrMoreSymlinks:withError:]", 117, MIInstallerErrorDomain, 21, v31, 0, @"Failed to create container with identifier %@ of type %ld: %@", v37, (uint64_t)v60);
    id v23 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_38;
  }
  v24 = 0;
LABEL_13:
  id v26 = 0;
  if (a8) {
LABEL_14:
  }
    *a8 = v23;
LABEL_15:
  if (!v24)
  {
    BOOL v29 = 0;
    goto LABEL_27;
  }
  id v62 = 0;
  unsigned __int8 v27 = [v24 removeUnderlyingContainerWaitingForDeletion:0 error:&v62];
  id v28 = v62;
  if ((v27 & 1) == 0 && (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)) {
    MOLogWrite();
  }
  BOOL v29 = 0;
LABEL_21:

LABEL_27:
  _Block_object_dispose(&v77, 8);

  return v29;
}

@end
@interface MIInstaller
+ (id)installerForURL:(id)a3 identity:(id)a4 domain:(unint64_t)a5 options:(id)a6 operationType:(unint64_t)a7 forClient:(id)a8;
- (BOOL)_applyStagedUpdateForUUID:(id)a3 withError:(id *)a4;
- (BOOL)_extractPackageContainedSymlink:(BOOL *)a3 withError:(id *)a4;
- (BOOL)_installInstallable:(id)a3 containingSymlink:(BOOL)a4 error:(id *)a5;
- (BOOL)_installProvisioningProfilesAtStagingRootWithError:(id *)a3;
- (BOOL)_installProvisioningProfilesFromUserOptionsWithError:(id *)a3;
- (BOOL)_setupPackageStateWithError:(id *)a3;
- (BOOL)_takeOwnershipOfInstallableContainingSymlink:(BOOL *)a3 error:(id *)a4;
- (BOOL)_writeLockBundle:(id)a3 error:(id *)a4;
- (BOOL)applyStagedUpdateForUUID:(id)a3 withError:(id *)a4;
- (BOOL)performInstallationWithError:(id *)a3;
- (BOOL)removeAndReportAbandonedContainersWithIncorrectPersonaForBundleContainer:(id)a3 withError:(id *)a4;
- (BOOL)terminationAssertionReleased;
- (LSRecordPromise)recordPromise;
- (MIAppIdentity)identity;
- (MIClientConnection)client;
- (MIInstallOptions)options;
- (MIInstaller)init;
- (MIInstaller)initWithURL:(id)a3 identity:(id)a4 domain:(unint64_t)a5 options:(id)a6 operationType:(unint64_t)a7 forClient:(id)a8;
- (NSArray)lockedIdentifiers;
- (NSArray)receipt;
- (NSString)stagedJournalEntryUniqueID;
- (NSURL)installURL;
- (NSURL)stagingRoot;
- (NSURL)stagingURL;
- (id)_bundleInDirectory:(id)a3 withBundleID:(id)a4 error:(id *)a5;
- (id)_discoverInstallableWithError:(id *)a3;
- (id)_identifiersToLockBundleIdentifier:(id)a3 error:(id *)a4;
- (id)_manifestPathForBase:(id)a3 withIdentifier:(id)a4 patchType:(unsigned __int8 *)a5 error:(id *)a6;
- (unint64_t)installOperationType;
- (unint64_t)installationDomain;
- (unint64_t)preflightAndPatchTime;
- (unint64_t)stagingTime;
- (unint64_t)verificationTime;
- (unint64_t)waitingTime;
- (unsigned)packageFormat;
- (void)_fireCallbackWithStatus:(id)a3;
- (void)_fireCallbackWithStatus:(id)a3 percentComplete:(unsigned int)a4;
- (void)_logOperationCompletionWithStartTime:(unint64_t)a3 distributorID:(id)a4;
- (void)_writeLockIdentifiers:(id)a3;
- (void)dealloc;
- (void)setIdentity:(id)a3;
- (void)setInstallOperationType:(unint64_t)a3;
- (void)setInstallURL:(id)a3;
- (void)setLockedIdentifiers:(id)a3;
- (void)setPackageFormat:(unsigned __int8)a3;
- (void)setPreflightAndPatchTime:(unint64_t)a3;
- (void)setStagingRoot:(id)a3;
- (void)setStagingTime:(unint64_t)a3;
- (void)setStagingURL:(id)a3;
- (void)setTerminationAssertionReleased:(BOOL)a3;
- (void)setVerificationTime:(unint64_t)a3;
- (void)setWaitingTime:(unint64_t)a3;
@end

@implementation MIInstaller

- (MIInstaller)init
{
}

- (MIInstaller)initWithURL:(id)a3 identity:(id)a4 domain:(unint64_t)a5 options:(id)a6 operationType:(unint64_t)a7 forClient:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a6;
  id v17 = a8;
  v23.receiver = self;
  v23.super_class = (Class)MIInstaller;
  v18 = [(MIInstaller *)&v23 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_installURL, a3);
    objc_storeStrong((id *)&v19->_identity, a4);
    unint64_t v20 = 2;
    if (a5 != 1) {
      unint64_t v20 = a5;
    }
    v19->_installationDomain = v20;
    objc_storeStrong((id *)&v19->_options, a6);
    objc_storeStrong((id *)&v19->_client, a8);
    v19->_installOperationType = a7;
  }

  return v19;
}

- (void)dealloc
{
  v3 = [(MIInstaller *)self lockedIdentifiers];

  if (v3)
  {
    v4 = [(MIInstaller *)self lockedIdentifiers];
    sub_1000550D8(v4);

    [(MIInstaller *)self setLockedIdentifiers:0];
  }
  uint64_t v5 = [(MIInstaller *)self client];
  if (v5)
  {
    v6 = (void *)v5;
    unsigned __int8 v7 = [(MIInstaller *)self terminationAssertionReleased];

    if ((v7 & 1) == 0)
    {
      v8 = [(MIInstaller *)self client];
      [v8 releaseTerminationAssertion];

      [(MIInstaller *)self setTerminationAssertionReleased:1];
    }
  }
  v9.receiver = self;
  v9.super_class = (Class)MIInstaller;
  [(MIInstaller *)&v9 dealloc];
}

+ (id)installerForURL:(id)a3 identity:(id)a4 domain:(unint64_t)a5 options:(id)a6 operationType:(unint64_t)a7 forClient:(id)a8
{
  id v13 = a8;
  id v14 = a6;
  id v15 = a4;
  id v16 = a3;
  id v17 = [objc_alloc((Class)objc_opt_class()) initWithURL:v16 identity:v15 domain:a5 options:v14 operationType:a7 forClient:v13];

  return v17;
}

- (void)_fireCallbackWithStatus:(id)a3 percentComplete:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  id v7 = [(MIInstaller *)self client];
  [v7 sendProgressWithStatus:v6 percentComplete:v4];
}

- (void)_fireCallbackWithStatus:(id)a3
{
  id v4 = a3;
  id v5 = [(MIInstaller *)self client];
  [v5 sendProgressWithStatus:v4];
}

- (BOOL)_takeOwnershipOfInstallableContainingSymlink:(BOOL *)a3 error:(id *)a4
{
  BOOL v21 = 0;
  id v7 = +[MIHelperServiceClient sharedInstance];
  v8 = [(MIInstaller *)self installURL];
  objc_super v9 = [(MIInstaller *)self options];
  id v20 = 0;
  v10 = [v7 stageItemAtURL:v8 options:v9 containedSymlink:&v21 error:&v20];
  id v11 = v20;

  if (v10)
  {
    if (a3) {
      *a3 = v21;
    }
    [(MIInstaller *)self setInstallURL:v10];
  }
  else
  {
    v12 = [v11 domain];
    id v13 = (void *)MIInstallerErrorDomain;
    unsigned __int8 v14 = [v12 isEqualToString:MIInstallerErrorDomain];

    if (v14)
    {
      if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 3) {
        MOLogWrite();
      }
    }
    else
    {
      id v15 = [(MIInstaller *)self installURL];
      id v16 = [v15 path];
      uint64_t v18 = sub_100014A08((uint64_t)"-[MIInstaller _takeOwnershipOfInstallableContainingSymlink:error:]", 191, v13, 103, v11, 0, @"Failed to transfer ownership of path %@ to installd", v17, (uint64_t)v16);

      id v11 = (id)v18;
    }
    if (a4)
    {
      id v11 = v11;
      *a4 = v11;
    }
  }

  return v10 != 0;
}

- (BOOL)_setupPackageStateWithError:(id *)a3
{
  memset(&v74, 0, sizeof(v74));
  id v5 = [(MIInstaller *)self installURL];
  int v6 = lstat((const char *)[v5 fileSystemRepresentation], &v74);

  if (v6)
  {
    id v7 = (void *)MIInstallerErrorDomain;
    v8 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:*__error() userInfo:0];
    uint64_t v82 = MIPathArgumentErrorKey;
    objc_super v9 = [(MIInstaller *)self installURL];
    v10 = [v9 path];
    v83 = v10;
    id v11 = +[NSDictionary dictionaryWithObjects:&v83 forKeys:&v82 count:1];
    id v12 = [(MIInstaller *)self installURL];
    id v13 = [v12 fileSystemRepresentation];
    unsigned __int8 v14 = __error();
    strerror(*v14);
    sub_100014A08((uint64_t)"-[MIInstaller _setupPackageStateWithError:]", 223, v7, 3, v8, v11, @"Can't stat %s: %s", v15, (uint64_t)v13);
    id v16 = (id)objc_claimAutoreleasedReturnValue();

LABEL_3:
LABEL_8:

    v25 = 0;
    goto LABEL_9;
  }
  id v17 = [(MIInstaller *)self installURL];
  LOBYTE(value) = 110;
  id v18 = v17;
  ssize_t v19 = getxattr((const char *)[v18 fileSystemRepresentation], "com.apple.streamingzip.incomplete_extraction", &value, 1uLL, 0, 1);
  if (v19 == -1)
  {
    if (*__error() == 93) {
      goto LABEL_18;
    }
    if (*__error() == 34) {
      goto LABEL_6;
    }
  }
  else if ((v19 & 0x8000000000000000) == 0)
  {
LABEL_6:

    id v20 = (void *)MIInstallerErrorDomain;
    v80[0] = MIPathArgumentErrorKey;
    v8 = [(MIInstaller *)self installURL];
    BOOL v21 = [v8 path];
    v80[1] = @"LegacyErrorString";
    v81[0] = v21;
    v81[1] = @"PackageInspectionFailed";
    v22 = +[NSDictionary dictionaryWithObjects:v81 forKeys:v80 count:2];
    id v23 = [(MIInstaller *)self installURL];
    id v64 = [v23 fileSystemRepresentation];
    sub_100014A08((uint64_t)"-[MIInstaller _setupPackageStateWithError:]", 230, v20, 3, 0, v22, @"Archive we've been requested to install at %s is an incomplete download.", v24, (uint64_t)v64);
LABEL_7:
    id v16 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_8;
  }
  if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 3)
  {
    v28 = (char *)[v18 fileSystemRepresentation];
    v29 = __error();
    v67 = v28;
    v68 = strerror(*v29);
    uint64_t v63 = (uint64_t)"com.apple.streamingzip.incomplete_extraction";
    MOLogWrite();
  }
LABEL_18:

  int v30 = v74.st_mode & 0xF000;
  if (v30 != 0x4000)
  {
    if (v30 != 0x8000)
    {
      v45 = (void *)MIInstallerErrorDomain;
      uint64_t v76 = MIPathArgumentErrorKey;
      v8 = [(MIInstaller *)self installURL];
      objc_super v9 = [v8 path];
      v77 = v9;
      v10 = +[NSDictionary dictionaryWithObjects:&v77 forKeys:&v76 count:1];
      sub_100014A08((uint64_t)"-[MIInstaller _setupPackageStateWithError:]", 277, v45, 3, 0, v10, @"Unrecognized package file type 0%o", v46, v74.st_mode);
      id v16 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_3;
    }
    if (!v74.st_size)
    {
      v49 = (void *)MIInstallerErrorDomain;
      v78[0] = MIPathArgumentErrorKey;
      v8 = [(MIInstaller *)self installURL];
      BOOL v21 = [v8 path];
      v78[1] = @"LegacyErrorString";
      v79[0] = v21;
      v79[1] = @"PackageExtractionFailed";
      v22 = +[NSDictionary dictionaryWithObjects:v79 forKeys:v78 count:2];
      id v23 = [(MIInstaller *)self installURL];
      id v66 = [v23 fileSystemRepresentation];
      sub_100014A08((uint64_t)"-[MIInstaller _setupPackageStateWithError:]", 243, v49, 3, 0, v22, @"Archive we've been requested to install at %s is 0 bytes. That can't be a valid ipa.", v50, (uint64_t)v66);
      goto LABEL_7;
    }
    id v31 = [(MIInstaller *)self installURL];
    int value = 0;
    id v32 = v31;
    int v33 = open((const char *)[v32 fileSystemRepresentation], 256);
    if (v33 < 0)
    {
      if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 3)
      {
        id v51 = [v32 fileSystemRepresentation];
        v52 = __error();
        uint64_t v63 = (uint64_t)v51;
        v67 = strerror(*v52);
        MOLogWrite();
      }
      goto LABEL_45;
    }
    int v34 = v33;
    ssize_t v35 = read(v33, &value, 4uLL);
    if (v35 == 4)
    {
      if (value == 67324752)
      {
        close(v34);

        goto LABEL_48;
      }
      if (qword_1000A60B8 && *(int *)(qword_1000A60B8 + 44) < 3) {
        goto LABEL_44;
      }
      uint64_t v72 = 3;
      uint64_t v73 = 4;
      uint64_t v70 = 80;
      uint64_t v71 = 75;
      v68 = (char *)(value << 8 >> 24);
      v69 = (char *)(value >> 24);
      uint64_t v63 = (char)value;
      v67 = (char *)((__int16)value >> 8);
    }
    else
    {
      v53 = (char *)v35;
      if (qword_1000A60B8 && *(int *)(qword_1000A60B8 + 44) < 3) {
        goto LABEL_44;
      }
      v54 = (char *)[v32 fileSystemRepresentation];
      v55 = __error();
      v68 = v54;
      v69 = strerror(*v55);
      uint64_t v63 = 4;
      v67 = v53;
    }
    MOLogWrite();
LABEL_44:
    close(v34);
LABEL_45:

    if (qword_1000A60B8 && *(int *)(qword_1000A60B8 + 44) < 3) {
      goto LABEL_49;
    }
    id v32 = [(MIInstaller *)self installURL];
    uint64_t v63 = (uint64_t)[v32 fileSystemRepresentation];
    MOLogWrite();
LABEL_48:

LABEL_49:
    -[MIInstaller setPackageFormat:](self, "setPackageFormat:", 1, v63);
    goto LABEL_50;
  }
  v36 = [(MIInstaller *)self installURL];
  v37 = [v36 URLByAppendingPathComponent:@"Payload" isDirectory:1];

  v38 = [(MIInstaller *)self installURL];
  v39 = [v38 URLByAppendingPathComponent:@"AssetData" isDirectory:1];

  v40 = [(MIInstaller *)self options];
  unsigned int v41 = [v40 isSystemAppInstall];

  if (v41
    && (+[MIFileManager defaultManager],
        v42 = objc_claimAutoreleasedReturnValue(),
        unsigned __int8 v43 = [v42 itemExistsAtURL:v39],
        v42,
        (v43 & 1) != 0))
  {
    unsigned __int8 v44 = 4;
  }
  else
  {
    v47 = +[MIFileManager defaultManager];
    unsigned int v48 = [v47 itemExistsAtURL:v37];

    if (v48) {
      unsigned __int8 v44 = 3;
    }
    else {
      unsigned __int8 v44 = 2;
    }
  }
  -[MIInstaller setPackageFormat:](self, "setPackageFormat:", v44, v63);

LABEL_50:
  v56 = +[MIDaemonConfiguration sharedInstance];
  v25 = [v56 stagingRootForSystemContent];

  if (v25)
  {
    v58 = [(MIInstaller *)self installURL];
    v59 = [v58 URLByDeletingLastPathComponent];
    [(MIInstaller *)self setStagingRoot:v59];

    v60 = [(MIInstaller *)self stagingRoot];

    if (v60)
    {
      v61 = [(MIInstaller *)self stagingRoot];
      BOOL v26 = 1;
      v62 = [v61 URLByAppendingPathComponent:@"extracted" isDirectory:1];
      [(MIInstaller *)self setStagingURL:v62];

      id v16 = 0;
      goto LABEL_12;
    }
    id v16 = 0;
  }
  else
  {
    sub_100014A08((uint64_t)"-[MIInstaller _setupPackageStateWithError:]", 285, MIInstallerErrorDomain, 4, 0, 0, @"Failed to get staging root path", v57, v65);
    id v16 = (id)objc_claimAutoreleasedReturnValue();
  }
LABEL_9:
  if (a3)
  {
    id v16 = v16;
    BOOL v26 = 0;
    *a3 = v16;
  }
  else
  {
    BOOL v26 = 0;
  }
LABEL_12:

  return v26;
}

- (BOOL)_extractPackageContainedSymlink:(BOOL *)a3 withError:(id *)a4
{
  id v7 = +[MIFileManager defaultManager];
  if ([(MIInstaller *)self packageFormat] != 1)
  {
    id v14 = [(MIInstaller *)self stagingURL];
    if ([(MIInstaller *)self packageFormat] == 2)
    {
      v22 = [(MIInstaller *)self installURL];
      id v23 = [v22 pathExtension];

      unsigned __int8 v24 = [v23 isEqualToString:@"app"];
      v25 = [(MIInstaller *)self installURL];
      BOOL v26 = [v25 lastPathComponent];
      v27 = v26;
      if ((v24 & 1) == 0)
      {
        uint64_t v28 = [v26 stringByAppendingString:@".app"];

        v27 = (void *)v28;
      }

      uint64_t v29 = [v14 URLByAppendingPathComponent:v27 isDirectory:1];

      int v30 = [(MIInstaller *)self stagingURL];
      id v49 = 0;
      unsigned __int8 v31 = [v7 createDirectoryAtURL:v30 withIntermediateDirectories:0 mode:493 error:&v49];
      id v32 = v49;

      if ((v31 & 1) == 0 && (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 3))
      {
        unsigned __int8 v44 = [(MIInstaller *)self stagingURL];
        v45 = v32;
        MOLogWrite();
      }
      id v14 = (id)v29;
    }
    else
    {
      id v32 = 0;
    }
    if (qword_1000A60B8 && *(int *)(qword_1000A60B8 + 44) >= 7)
    {
      ssize_t v35 = [(MIInstaller *)self installURL];
      v36 = [v35 path];
      [v14 path];
      v45 = unsigned __int8 v44 = v36;
      MOLogWrite();
    }
    v37 = [(MIInstaller *)self installURL];
    id v48 = v32;
    unsigned __int8 v38 = [v7 moveItemAtURL:v37 toURL:v14 error:&v48];
    id v11 = v48;

    if (v38)
    {
      BOOL v20 = 1;
      goto LABEL_31;
    }
    v39 = (void *)MIInstallerErrorDomain;
    v40 = [(MIInstaller *)self installURL];
    unsigned int v41 = [v40 path];
    v47 = [v14 path];
    sub_100014A08((uint64_t)"-[MIInstaller _extractPackageContainedSymlink:withError:]", 349, v39, 5, v11, &off_100097948, @"Failed to move %@ to %@", v42, (uint64_t)v41);
    id v21 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_29;
  }
  v8 = [(MIInstaller *)self installURL];
  objc_super v9 = [(MIInstaller *)self stagingURL];
  id v52 = 0;
  unsigned __int8 v10 = +[MIBOMWrapper extractZipArchiveAtURL:v8 toURL:v9 withError:&v52];
  id v11 = v52;

  if (v10)
  {
    id v12 = [(MIInstaller *)self installURL];
    id v51 = 0;
    unsigned __int8 v13 = [v7 removeItemAtURL:v12 error:&v51];
    id v14 = v51;

    if ((v13 & 1) == 0 && (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 3))
    {
      uint64_t v15 = [(MIInstaller *)self installURL];
      unsigned __int8 v44 = [v15 path];
      v45 = v14;
      MOLogWrite();
    }
    id v16 = [(MIInstaller *)self stagingURL];
    id v17 = +[MIDaemonConfiguration sharedInstance];
    id v18 = [v17 uid];
    ssize_t v19 = +[MIDaemonConfiguration sharedInstance];
    id v50 = v11;
    BOOL v20 = 1;
    LOBYTE(v18) = [v7 standardizeOwnershipAtURL:v16 toUID:v18 GID:objc_msgSend(v19, "gid") removeACLs:1 setProtectionClass:1 foundSymlink:a3 error:&v50];
    id v21 = v50;

    if (v18) {
      goto LABEL_30;
    }
    if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 3) {
      MOLogWrite();
    }
LABEL_29:
    BOOL v20 = 0;
LABEL_30:
    id v11 = v21;
    goto LABEL_31;
  }
  if (qword_1000A60B8 && *(int *)(qword_1000A60B8 + 44) < 3)
  {
    BOOL v20 = 0;
    if (!a4) {
      goto LABEL_33;
    }
    goto LABEL_32;
  }
  id v14 = [(MIInstaller *)self installURL];
  int v33 = [v14 path];
  int v34 = [(MIInstaller *)self stagingURL];
  uint64_t v46 = [v34 path];
  MOLogWrite();

  BOOL v20 = 0;
LABEL_31:

  if (a4) {
LABEL_32:
  }
    *a4 = v11;
LABEL_33:

  return v20;
}

- (id)_manifestPathForBase:(id)a3 withIdentifier:(id)a4 patchType:(unsigned __int8 *)a5 error:(id *)a6
{
  id v8 = a3;
  id v9 = a4;
  unsigned __int8 v10 = [@"com.apple.deltainstallcommands." stringByAppendingString:v9];
  id v11 = [v8 URLByAppendingPathComponent:v10 isDirectory:0];

  id v12 = [@"com.apple.parallelpatchinfo." stringByAppendingString:v9];
  uint64_t v13 = [v8 URLByAppendingPathComponent:v12 isDirectory:0];

  id v14 = [@"com.apple.parallelpatcharchive." stringByAppendingString:v9];
  uint64_t v15 = [v8 URLByAppendingPathComponent:v14 isDirectory:0];

  id v16 = +[MIFileManager defaultManager];
  id v41 = 0;
  LODWORD(v14) = [v16 itemIsFileAtURL:v15 error:&v41];
  id v17 = v41;
  unsigned __int8 v38 = v11;
  if (v14)
  {
    *a5 = 3;
    id v18 = v15;
    if (qword_1000A60B8 && *(int *)(qword_1000A60B8 + 44) >= 7)
    {
      ssize_t v19 = (void *)v13;
      MOLogWrite();
    }
    else
    {
      ssize_t v19 = (void *)v13;
    }
    id v21 = 0;
    goto LABEL_17;
  }
  id v40 = 0;
  unsigned int v20 = [v16 itemIsFileAtURL:v11 error:&v40];
  id v21 = v40;
  if (v20)
  {
    *a5 = 1;
    id v18 = v11;
    if (qword_1000A60B8 && *(int *)(qword_1000A60B8 + 44) >= 7)
    {
      ssize_t v19 = (void *)v13;
      MOLogWrite();
    }
    else
    {
      ssize_t v19 = (void *)v13;
    }
LABEL_17:
    unsigned __int8 v24 = 0;
    id v23 = v17;
    goto LABEL_18;
  }
  id v39 = v17;
  ssize_t v19 = (void *)v13;
  unsigned int v22 = [v16 itemIsFileAtURL:v13 error:&v39];
  id v23 = v39;

  if (v22)
  {
    *a5 = 2;
    id v18 = v19;
    if (qword_1000A60B8 && *(int *)(qword_1000A60B8 + 44) >= 7) {
      MOLogWrite();
    }
    goto LABEL_15;
  }
  *a5 = 0;
  v27 = [v21 domain];
  if (![v27 isEqualToString:NSPOSIXErrorDomain] || objc_msgSend(v21, "code") != (id)2) {
    goto LABEL_34;
  }
  uint64_t v28 = [v23 domain];
  if (([v28 isEqualToString:NSPOSIXErrorDomain] & 1) == 0)
  {

LABEL_34:
    goto LABEL_35;
  }
  id v36 = [v23 code];

  if (v36 != (id)2)
  {
LABEL_35:
    uint64_t v29 = [v21 domain];
    if ([v29 isEqualToString:NSPOSIXErrorDomain])
    {
      id v30 = [v21 code];

      if (v30 == (id)2) {
        unsigned __int8 v31 = v23;
      }
      else {
        unsigned __int8 v31 = v21;
      }
      if (v30 == (id)2) {
        id v32 = v19;
      }
      else {
        id v32 = v38;
      }
    }
    else
    {

      unsigned __int8 v31 = v21;
      id v32 = v38;
    }
    id v33 = v31;
    id v34 = v32;
    unsigned __int8 v24 = sub_100014A08((uint64_t)"-[MIInstaller _manifestPathForBase:withIdentifier:patchType:error:]", 400, MIInstallerErrorDomain, 8, v33, &off_100097970, @"Failed to determine if patch URL %@ for application %@ exists. Failing.", v35, (uint64_t)v34);

    id v18 = 0;
LABEL_18:
    v25 = a6;
    if (!a6) {
      goto LABEL_21;
    }
    goto LABEL_19;
  }
  if (!qword_1000A60B8)
  {
    id v18 = 0;
LABEL_15:
    unsigned __int8 v24 = 0;
    goto LABEL_18;
  }
  v25 = a6;
  if (*(int *)(qword_1000A60B8 + 44) >= 7) {
    MOLogWrite();
  }
  id v18 = 0;
  unsigned __int8 v24 = 0;
  if (a6)
  {
LABEL_19:
    if (!v18) {
      id *v25 = v24;
    }
  }
LABEL_21:

  return v18;
}

- (id)_bundleInDirectory:(id)a3 withBundleID:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v34 = 0;
  uint64_t v35 = &v34;
  uint64_t v36 = 0x3032000000;
  v37 = sub_1000257FC;
  unsigned __int8 v38 = sub_10002580C;
  id v39 = 0;
  uint64_t v28 = 0;
  uint64_t v29 = (id *)&v28;
  uint64_t v30 = 0x3032000000;
  unsigned __int8 v31 = sub_1000257FC;
  id v32 = sub_10002580C;
  id v33 = 0;
  id v9 = objc_opt_new();
  unsigned __int8 v10 = +[MIFileManager defaultManager];
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_100025814;
  v22[3] = &unk_10008D478;
  BOOL v26 = &v28;
  id v11 = v8;
  id v23 = v11;
  v27 = &v34;
  id v12 = v7;
  id v24 = v12;
  id v13 = v9;
  id v25 = v13;
  id v14 = [v10 enumerateURLsForItemsInDirectoryAtURL:v12 ignoreSymlinks:1 withBlock:v22];

  if (v29[5])
  {
LABEL_4:
    id v15 = 0;
    if (!a5) {
      goto LABEL_7;
    }
    goto LABEL_5;
  }
  if (v14)
  {
    objc_storeStrong(v29 + 5, v14);
    goto LABEL_4;
  }
  if (!v35[5])
  {
    if ([v13 count]) {
      sub_100014A08((uint64_t)"-[MIInstaller _bundleInDirectory:withBundleID:error:]", 469, MIInstallerErrorDomain, 180, 0, 0, @"The item being installed did not contain an app with bundle ID \"%@\", but it did contain app(s) with bundle ID(s): %@", v18, (uint64_t)v11);
    }
    else {
    uint64_t v19 = sub_100014A08((uint64_t)"-[MIInstaller _bundleInDirectory:withBundleID:error:]", 471, MIInstallerErrorDomain, 6, 0, &off_1000979C0, @"The item being installed did not contain any installable apps.", v18, v21);
    }
    id v20 = v29[5];
    v29[5] = (id)v19;
  }
  id v15 = (id)v35[5];
  if (a5)
  {
LABEL_5:
    if (!v15) {
      *a5 = v29[5];
    }
  }
LABEL_7:
  id v16 = v15;

  _Block_object_dispose(&v28, 8);
  _Block_object_dispose(&v34, 8);

  return v16;
}

- (id)_identifiersToLockBundleIdentifier:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = objc_opt_new();
  [v7 addObject:v6];
  id v8 = [(MIInstaller *)self options];
  id v9 = [v8 linkedParentBundleID];

  if (v9) {
    [v7 addObject:v9];
  }
  sub_100054F80(v6);
  unsigned __int8 v10 = +[MIContainerLinkManager sharedInstanceForDomain:[(MIInstaller *)self installationDomain]];
  id v19 = 0;
  id v20 = 0;
  unsigned int v11 = [v10 getLinkedParent:&v20 forChild:v6 error:&v19];
  id v12 = v20;
  id v13 = v19;
  sub_1000550D8(v6);
  if (v11)
  {
    if (v12) {
      [v7 addObject:v12];
    }
  }
  else
  {
    if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 3)
    {
      id v17 = v6;
      id v18 = v13;
      MOLogWrite();
    }

    id v13 = 0;
  }
  id v14 = [v7 copy:v17 v18];
  id v15 = v14;
  if (a4 && !v14) {
    *a4 = v13;
  }

  return v15;
}

- (void)_writeLockIdentifiers:(id)a3
{
  id v4 = a3;
  [(MIInstaller *)self _fireCallbackWithStatus:@"TakingInstallLock"];
  [(MIInstaller *)self setLockedIdentifiers:v4];
  uint64_t v5 = mach_absolute_time();
  sub_100054F88(v4);

  uint64_t v6 = (mach_absolute_time() - v5) * qword_1000A60C0 / HIDWORD(qword_1000A60C0);

  [(MIInstaller *)self setWaitingTime:v6];
}

- (BOOL)_writeLockBundle:(id)a3 error:(id *)a4
{
  uint64_t v6 = [a3 identifier];
  id v10 = 0;
  id v7 = [(MIInstaller *)self _identifiersToLockBundleIdentifier:v6 error:&v10];
  id v8 = v10;

  if (v7)
  {
    [(MIInstaller *)self _writeLockIdentifiers:v7];
  }
  else if (a4)
  {
    *a4 = v8;
  }

  return v7 != 0;
}

- (BOOL)removeAndReportAbandonedContainersWithIncorrectPersonaForBundleContainer:(id)a3 withError:(id *)a4
{
  id v6 = a3;
  id v7 = +[MIDaemonConfiguration sharedInstance];
  unsigned int v8 = [v7 deviceHasPersonas];

  if (!v8)
  {
    BOOL v17 = 1;
    goto LABEL_56;
  }
  id v9 = [(MIInstaller *)self identity];
  id v10 = [v9 bundleID];
  v61 = [v9 personaUniqueString];
  unsigned int v11 = +[MIUserManagement sharedInstance];
  id v12 = objc_opt_new();
  id v13 = +[MIUserManagement sharedInstance];
  id v70 = 0;
  id v14 = [v13 multiPersonaSADAppBundleIDsWithError:&v70];
  id v15 = (__CFString *)v70;

  if (!v14)
  {
    id obj = 0;
    id v16 = 0;
    if (!a4) {
      goto LABEL_54;
    }
    goto LABEL_7;
  }
  if ([v14 containsObject:v10])
  {
    id obj = 0;
    id v16 = 0;
    BOOL v17 = 1;
    goto LABEL_55;
  }
  v56 = v14;
  v69 = v15;
  id v18 = +[MIContainer allContainersForAllPersonasForIdentifier:v10 options:2 error:&v69];
  id v19 = v69;

  if (!v18)
  {
    sub_100014A08((uint64_t)"-[MIInstaller removeAndReportAbandonedContainersWithIncorrectPersonaForBundleContainer:withError:]", 597, MIInstallerErrorDomain, 4, v19, 0, @"Failed to query containers for %@", v20, (uint64_t)v10);
    id v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
    id obj = 0;
    id v16 = 0;
    goto LABEL_53;
  }
  uint64_t v57 = v12;
  uint64_t v58 = (uint64_t)v10;
  id v52 = a4;
  v53 = v11;
  v54 = v9;
  id v55 = v6;
  long long v67 = 0u;
  long long v68 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  id obj = v18;
  id v21 = [obj countByEnumeratingWithState:&v65 objects:v71 count:16];
  if (!v21)
  {
    char v60 = 0;
    goto LABEL_42;
  }
  id v22 = v21;
  char v60 = 0;
  uint64_t v23 = *(void *)v66;
  do
  {
    id v24 = 0;
    id v25 = v19;
    do
    {
      if (*(void *)v66 != v23) {
        objc_enumerationMutation(obj);
      }
      BOOL v26 = *(void **)(*((void *)&v65 + 1) + 8 * (void)v24);
      v27 = [v26 personaUniqueString:v49, v50, v51];
      if (v27 && ([v61 isEqualToString:v27] & 1) != 0)
      {
        id v19 = v25;
        goto LABEL_37;
      }
      char v64 = 0;
      uint64_t v28 = +[MIHelperServiceClient sharedInstance];
      uint64_t v29 = [v26 containerURL];
      id v30 = [v26 containerClass];
      uint64_t v63 = v25;
      unsigned __int8 v31 = [v28 dataContainer:v29 ofContainerType:v30 isEmpty:&v64 error:&v63];
      id v19 = v63;

      if ((v31 & 1) == 0)
      {
        if (qword_1000A60B8 && *(int *)(qword_1000A60B8 + 44) < 3) {
          goto LABEL_36;
        }
        uint64_t v50 = v58;
        CFStringRef v51 = v19;
        id v49 = v26;
        goto LABEL_28;
      }
      v60 |= v64 == 0;
      if (v27
        || (+[MIGlobalConfiguration sharedInstance],
            id v32 = objc_claimAutoreleasedReturnValue(),
            [v32 primaryPersonaString],
            id v33 = objc_claimAutoreleasedReturnValue(),
            unsigned int v34 = [v61 isEqualToString:v33],
            v33,
            v32,
            !v34))
      {
        if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 5)
        {
          if (v64) {
            CFStringRef v36 = @"without";
          }
          else {
            CFStringRef v36 = @"with";
          }
          uint64_t v50 = v58;
          CFStringRef v51 = v36;
          id v49 = v26;
          MOLogWrite();
        }
        [v57 addObject:v26, v49];
        goto LABEL_36;
      }
      if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 3)
      {
        CFStringRef v35 = @"without";
        if (!v64) {
          CFStringRef v35 = @"with";
        }
        id v49 = v26;
        uint64_t v50 = (uint64_t)v35;
LABEL_28:
        MOLogWrite();
      }
LABEL_36:
      id v25 = v19;
LABEL_37:

      id v24 = (char *)v24 + 1;
    }
    while (v22 != v24);
    id v22 = [obj countByEnumeratingWithState:&v65 objects:v71 count:16];
  }
  while (v22);
LABEL_42:

  id v12 = v57;
  if ([v57 count])
  {
    v37 = [v57 objectAtIndexedSubscript:0];
    id v16 = [v37 personaUniqueString];

    id v6 = v55;
    id v10 = (void *)v58;
    unsigned int v11 = v53;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT)) {
      sub_1000586B0(v58, (uint64_t)v16, (uint64_t)v61);
    }
    if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 3) {
      MOLogWrite();
    }
    unsigned __int8 v38 = (__CFString *)objc_opt_new();
    [(__CFString *)v38 setObject:v58 forKeyedSubscript:@"bundleID"];
    id v39 = +[NSNumber numberWithBool:v55 == 0];
    [(__CFString *)v38 setObject:v39 forKeyedSubscript:@"isFreshInstall"];

    id v40 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v53 personaTypeForPersonaUniqueString:v61]);
    [(__CFString *)v38 setObject:v40 forKeyedSubscript:@"requestedPersonaType"];

    id v41 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v53 personaTypeForPersonaUniqueString:v16]);
    [(__CFString *)v38 setObject:v41 forKeyedSubscript:@"erroneousPersonaType"];

    uint64_t v42 = +[NSNumber numberWithBool:v60 & 1];
    [(__CFString *)v38 setObject:v42 forKeyedSubscript:@"hasAbandonedUserData"];

    unsigned __int8 v43 = (void *)MIInstallerErrorDomain;
    id v44 = [(__CFString *)v38 copy];
    sub_10000EE74(v43, @"InvalidPersonaError", @"AbandonedErroneousContainers", @"Concurrent app install container cleanup", v44);

    v62 = v19;
    unsigned int v45 = +[MIContainer removeContainers:v57 waitForDeletion:0 error:&v62];
    id v15 = v62;

    if (v45)
    {

      BOOL v17 = 1;
      id v9 = v54;
      goto LABEL_51;
    }
    uint64_t v47 = sub_100014A08((uint64_t)"-[MIInstaller removeAndReportAbandonedContainersWithIncorrectPersonaForBundleContainer:withError:]", 646, v43, 4, v15, 0, @"Failed to delete erroneous containers associated with persona %@ for %@", v46, (uint64_t)v16);

    id v19 = v38;
    id v15 = (__CFString *)v47;
    id v9 = v54;
    a4 = v52;
LABEL_53:

    id v14 = v56;
    if (!a4)
    {
LABEL_54:
      BOOL v17 = 0;
      goto LABEL_55;
    }
LABEL_7:
    id v15 = v15;
    BOOL v17 = 0;
    *a4 = v15;
    goto LABEL_55;
  }
  id v16 = 0;
  BOOL v17 = 1;
  id v15 = v19;
  id v9 = v54;
  id v6 = v55;
  id v10 = (void *)v58;
  unsigned int v11 = v53;
LABEL_51:
  id v14 = v56;
LABEL_55:

LABEL_56:
  return v17;
}

- (id)_discoverInstallableWithError:(id *)a3
{
  uint64_t v5 = [(MIInstaller *)self options];
  id v6 = [v5 bundleIdentifier];

  if (v6)
  {
    switch([(MIInstaller *)self packageFormat])
    {
      case 1u:
      case 3u:
        unsigned int v8 = [(MIInstaller *)self stagingURL];
        id v9 = v8;
        CFStringRef v10 = @"Payload";
        goto LABEL_10;
      case 2u:
        id v16 = [(MIInstaller *)self stagingURL];
        goto LABEL_11;
      case 4u:
        unsigned int v8 = [(MIInstaller *)self stagingURL];
        id v9 = v8;
        CFStringRef v10 = @"AssetData";
LABEL_10:
        id v16 = [v8 URLByAppendingPathComponent:v10 isDirectory:1];

LABEL_11:
        id v18 = [(MIInstaller *)self options];
        unint64_t v19 = (unint64_t)[v18 installTargetType];

        v110[0] = 0;
        BOOL v17 = [(MIInstaller *)self _bundleInDirectory:v16 withBundleID:v6 error:v110];
        id v20 = v110[0];
        id v15 = v20;
        if (!v17) {
          goto LABEL_28;
        }
        id v109 = v20;
        unsigned int v21 = [(MIInstaller *)self _writeLockBundle:v17 error:&v109];
        id v22 = v109;

        if (!v21) {
          goto LABEL_27;
        }
        uint64_t v23 = [(MIInstaller *)self identity];
        id v108 = v22;
        unsigned int v24 = [v23 resolvePersonaWithError:&v108];
        id v15 = v108;

        if (!v24) {
          goto LABEL_28;
        }
        unsigned int v25 = [v17 bundleType];
        unsigned int v26 = v25;
        if (v25 <= 4 && ((1 << v25) & 0x16) != 0)
        {
          unint64_t v27 = [(MIInstaller *)self installationDomain];
          uint64_t v28 = [v17 identifier];
          if (v27 == 3)
          {
            id v107 = v15;
            uint64_t v29 = &v107;
            uint64_t v30 = +[MIBundleContainer privateAppBundleContainerWithIdentifier:v28 createIfNeeded:0 created:0 error:&v107];
          }
          else
          {
            id v106 = v15;
            uint64_t v29 = &v106;
            uint64_t v30 = +[MIBundleContainer appBundleContainerWithIdentifier:v28 createIfNeeded:0 created:0 error:&v106];
          }
          unsigned __int8 v31 = (void *)v30;
          id v32 = *v29;

          if (v31)
          {
            id v33 = [v31 bundle];

            if (!v33)
            {
              if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 3)
              {
                uint64_t v80 = [v17 identifier];
                MOLogWrite();
              }
              uint64_t v96 = [v17 identifier:v80];
              id v105 = v32;
              unsigned __int8 v34 = [v31 removeUnderlyingContainerWaitingForDeletion:0 error:&v105];
              id v35 = v105;

              if (v34)
              {
                CFStringRef v36 = (void *)v96;
              }
              else
              {
                CFStringRef v36 = (void *)v96;
                if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 3)
                {
                  uint64_t v80 = v96;
                  id v81 = v35;
                  MOLogWrite();
                }

                id v35 = 0;
              }

              unsigned __int8 v31 = 0;
              id v32 = v35;
            }
          }
          if (_os_feature_enabled_impl())
          {
            id v104 = v32;
            unsigned int v41 = [(MIInstaller *)self removeAndReportAbandonedContainersWithIncorrectPersonaForBundleContainer:v31 withError:&v104];
            id v15 = v104;

            id v32 = v15;
            if (!v41)
            {
LABEL_69:

              if (a3) {
                goto LABEL_29;
              }
              goto LABEL_70;
            }
          }
          if (v31)
          {
            uint64_t v42 = [v31 bundle];
            unsigned __int8 v43 = [v42 isPlaceholder];

            if ((v43 & 1) == 0 && v19 == 2)
            {
              v97 = [MIInstallableParallelPlaceholder alloc];
              v92 = [(MIInstaller *)self stagingURL];
              unsigned int v89 = [(MIInstaller *)self packageFormat];
              v86 = [(MIInstaller *)self identity];
              unint64_t v44 = [(MIInstaller *)self installationDomain];
              unsigned int v45 = [(MIInstaller *)self options];
              id v103 = v32;
              uint64_t v46 = [(MIInstallableBundle *)v97 initWithBundle:v17 inStagingRoot:v92 packageFormat:v89 identity:v86 domain:v44 installOptions:v45 existingBundleContainer:v31 operationType:[(MIInstaller *)self installOperationType] error:&v103];
              id v15 = v103;

              uint64_t v47 = (MIInstallableBundlePatch *)v46;
              if (!v46) {
                goto LABEL_69;
              }
LABEL_76:

              id v40 = v47;
              goto LABEL_71;
            }
            if (v19 == 3)
            {
              CFStringRef v51 = [v31 bundle];
              unsigned __int8 v52 = [v51 isPlaceholder];

              if ((v52 & 1) == 0 && (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 5))
              {
                uint64_t v80 = [v17 identifier:v80 v81];
                MOLogWrite();
              }
            }
          }
          else if (v19 == 3)
          {
            id v48 = (void *)MIInstallerErrorDomain;
            id v49 = [v17 identifier];
            sub_100014A08((uint64_t)"-[MIInstaller _discoverInstallableWithError:]", 760, v48, 26, 0, 0, @"Application %@ not found to downgrade to placeholder.", v50, (uint64_t)v49);
            id v15 = (id)objc_claimAutoreleasedReturnValue();

            goto LABEL_69;
          }
          v98 = v31;
          unsigned __int8 v102 = 0;
          v93 = [(MIInstaller *)self stagingURL];
          v53 = [v17 identifier];
          id v101 = v32;
          uint64_t v54 = [(MIInstaller *)self _manifestPathForBase:v93 withIdentifier:v53 patchType:&v102 error:&v101];
          id v15 = v101;

          id v55 = (void *)v54;
          if (v54)
          {
            if (!v98)
            {
              long long v68 = (void *)MIInstallerErrorDomain;
              unsigned int v69 = v102 - 1;
              if (v69 > 2) {
                CFStringRef v70 = @"Invalid";
              }
              else {
                CFStringRef v70 = *(&off_10008D508 + (char)v69);
              }
              uint64_t v73 = [v17 identifier];
              sub_100014A08((uint64_t)"-[MIInstaller _discoverInstallableWithError:]", 771, v68, 8, 0, &off_1000979E8, @"%@ patch submitted for application %@ that's not installed. Failing.", v74, (uint64_t)v70);
              goto LABEL_66;
            }
            v56 = [v98 bundle];
            unsigned int v57 = [v56 isPlaceholder];

            if (v57)
            {
              v59 = (void *)MIInstallerErrorDomain;
              unsigned int v60 = v102 - 1;
              if (v60 > 2) {
                CFStringRef v61 = @"Invalid";
              }
              else {
                CFStringRef v61 = *(&off_10008D508 + (char)v60);
              }
              uint64_t v73 = [v17 identifier];
              sub_100014A08((uint64_t)"-[MIInstaller _discoverInstallableWithError:]", 774, v59, 8, 0, &off_100097A10, @"%@ patch submitted for application %@ that's just a placeholder. Failing.", v75, (uint64_t)v61);
              uint64_t v76 = LABEL_66:;

              id v15 = (id)v73;
              unsigned __int8 v31 = v98;
LABEL_67:

              id v15 = (id)v76;
LABEL_68:

              goto LABEL_69;
            }
            if ((v19 & 0xFFFFFFFFFFFFFFFELL) == 2)
            {
              unsigned int v71 = v102 - 1;
              unsigned __int8 v31 = v98;
              if (v71 > 2) {
                CFStringRef v72 = @"Invalid";
              }
              else {
                CFStringRef v72 = *(&off_10008D508 + (char)v71);
              }
              uint64_t v76 = sub_100014A08((uint64_t)"-[MIInstaller _discoverInstallableWithError:]", 777, MIInstallerErrorDomain, 25, v15, 0, @"%@ patch supplied but install target type was placeholder or downgrade. This doesn't make sense.", v58, (uint64_t)v72);
              goto LABEL_67;
            }
            v88 = [MIInstallableBundlePatch alloc];
            v91 = [(MIInstaller *)self stagingURL];
            unsigned int v85 = [(MIInstaller *)self packageFormat];
            v78 = [(MIInstaller *)self identity];
            unint64_t v84 = [(MIInstaller *)self installationDomain];
            [(MIInstaller *)self options];
            v79 = v95 = v55;
            id v100 = v15;
            LOBYTE(v83) = v102;
            unsigned __int8 v31 = v98;
            uint64_t v47 = [(MIInstallableBundlePatch *)v88 initWithBundle:v17 inStagingRoot:v91 packageFormat:v85 identity:v78 domain:v84 installOptions:v79 manifestURL:v95 existingBundleContainer:v98 patchType:v83 operationType:[(MIInstaller *)self installOperationType] error:&v100];
            id v67 = v100;

            id v55 = v95;
            id v15 = v67;
            if (!v47) {
              goto LABEL_68;
            }
          }
          else
          {
            unsigned __int8 v31 = v98;
            if (v15) {
              goto LABEL_68;
            }
            v94 = [MIInstallableBundle alloc];
            v87 = [(MIInstaller *)self stagingURL];
            unsigned int v90 = [(MIInstaller *)self packageFormat];
            v62 = [(MIInstaller *)self identity];
            unint64_t v63 = [(MIInstaller *)self installationDomain];
            char v64 = [(MIInstaller *)self options];
            unint64_t v65 = [(MIInstaller *)self installOperationType];
            id v99 = 0;
            unint64_t v66 = v63;
            id v55 = 0;
            uint64_t v47 = [(MIInstallableBundle *)v94 initWithBundle:v17 inStagingRoot:v87 packageFormat:v90 identity:v62 domain:v66 installOptions:v64 existingBundleContainer:v98 operationType:v65 error:&v99];
            id v15 = v99;

            unsigned __int8 v31 = v98;
            id v67 = v15;
            if (!v47) {
              goto LABEL_68;
            }
          }

          id v15 = v67;
          goto LABEL_76;
        }
        v37 = (void *)MIInstallerErrorDomain;
        unsigned __int8 v38 = [v17 bundleURL];
        uint64_t v82 = [v38 path];
        sub_100014A08((uint64_t)"-[MIInstaller _discoverInstallableWithError:]", 819, v37, 4, 0, 0, @"Got unexpected bundle type %d at %@", v39, v26);
        id v22 = (id)objc_claimAutoreleasedReturnValue();

LABEL_27:
        id v15 = v22;
LABEL_28:
        if (a3) {
          goto LABEL_29;
        }
        goto LABEL_70;
      default:
        id v14 = (void *)MIInstallerErrorDomain;
        uint64_t v80 = [(MIInstaller *)self packageFormat];
        id v12 = @"Unknown package format: %hhu";
        uint64_t v13 = 689;
        unsigned int v11 = v14;
        goto LABEL_6;
    }
  }
  unsigned int v11 = (void *)MIInstallerErrorDomain;
  id v12 = @"Caller did not supply bundle identifer in install options";
  uint64_t v13 = 672;
LABEL_6:
  sub_100014A08((uint64_t)"-[MIInstaller _discoverInstallableWithError:]", v13, v11, 4, 0, 0, v12, v7, v80);
  id v15 = (id)objc_claimAutoreleasedReturnValue();
  id v16 = 0;
  BOOL v17 = 0;
  if (a3)
  {
LABEL_29:
    id v15 = v15;
    id v40 = 0;
    *a3 = v15;
    goto LABEL_71;
  }
LABEL_70:
  id v40 = 0;
LABEL_71:

  return v40;
}

- (BOOL)_installProvisioningProfilesFromUserOptionsWithError:(id *)a3
{
  uint64_t v5 = [(MIInstaller *)self options];
  id v6 = [v5 provisioningProfiles];
  if (v6)
  {
    id v22 = self;
    uint64_t v23 = a3;
    [v5 provisioningProfileInstallFailureIsFatal];
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    unsigned int v24 = v6;
    id v7 = v6;
    unsigned int v8 = (char *)[v7 countByEnumeratingWithState:&v25 objects:v31 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v26;
      while (2)
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(void *)v26 != v10) {
            objc_enumerationMutation(v7);
          }
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v12 = MIInstallProfileWithData();
            if (MIIsFatalMISProfileInstallationError())
            {
              id v14 = (void *)MIInstallerErrorDomain;
              v29[0] = @"LegacyErrorString";
              v29[1] = MILibMISErrorNumberKey;
              v30[0] = @"ApplicationVerificationFailed";
              id v15 = +[NSNumber numberWithInt:v12];
              v30[1] = v15;
              id v16 = +[NSDictionary dictionaryWithObjects:v30 forKeys:v29 count:2];
              BOOL v17 = [(MIInstaller *)v22 installURL];
              unsigned int v21 = MIErrorStringForMISError();
              sub_100014A08((uint64_t)"-[MIInstaller _installProvisioningProfilesFromUserOptionsWithError:]", 857, v14, 13, 0, v16, @"Failed to install local provisioning profile from user options for %@ : 0x%08x (%@)", v18, (uint64_t)v17);
              id v19 = (id)objc_claimAutoreleasedReturnValue();

              if (v23)
              {
                id v19 = v19;
                BOOL v13 = 0;
                *uint64_t v23 = v19;
              }
              else
              {
                BOOL v13 = 0;
              }
              goto LABEL_20;
            }
          }
          else if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 3)
          {
            MOLogWrite();
          }
        }
        id v9 = (char *)[v7 countByEnumeratingWithState:&v25 objects:v31 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }

    id v19 = 0;
    BOOL v13 = 1;
LABEL_20:
    id v6 = v24;
  }
  else
  {
    id v19 = 0;
    BOOL v13 = 1;
  }

  return v13;
}

- (BOOL)_installProvisioningProfilesAtStagingRootWithError:(id *)a3
{
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x3032000000;
  id v20 = sub_1000257FC;
  unsigned int v21 = sub_10002580C;
  id v22 = 0;
  uint64_t v5 = [(MIInstaller *)self stagingRoot];
  id v6 = [v5 URLByAppendingPathComponent:@"ProvisioningProfiles" isDirectory:1];

  id v7 = [(MIInstaller *)self options];
  unsigned __int8 v8 = [v7 provisioningProfileInstallFailureIsFatal];

  id v9 = +[MIFileManager defaultManager];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100027524;
  v15[3] = &unk_10008D4A0;
  unsigned __int8 v16 = v8;
  v15[4] = self;
  v15[5] = &v17;
  uint64_t v10 = [v9 enumerateURLsForItemsInDirectoryAtURL:v6 ignoreSymlinks:1 withBlock:v15];

  if (v10)
  {
    unsigned int v11 = [v10 domain];
    if ([v11 isEqualToString:NSPOSIXErrorDomain])
    {
      id v12 = [v10 code];

      if (v12 == (id)2) {
        goto LABEL_9;
      }
    }
    else
    {
    }
    if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 3) {
      MOLogWrite();
    }
  }
LABEL_9:
  BOOL v13 = (void *)v18[5];
  if (a3 && v13) {
    *a3 = v13;
  }

  _Block_object_dispose(&v17, 8);
  return v13 == 0;
}

- (BOOL)_installInstallable:(id)a3 containingSymlink:(BOOL)a4 error:(id *)a5
{
  BOOL v5 = a4;
  id v7 = a3;
  uint64_t v118 = 0;
  v119 = (id *)&v118;
  uint64_t v120 = 0x3032000000;
  v121 = sub_1000257FC;
  v122 = sub_10002580C;
  id v123 = 0;
  unint64_t v96 = [(MIInstaller *)self installOperationType];
  v117[0] = _NSConcreteStackBlock;
  v117[1] = 3221225472;
  v117[2] = sub_100028504;
  v117[3] = &unk_10008D4C8;
  v117[4] = self;
  [v7 setProgressBlock:v117];
  if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 5)
  {
    id v93 = v7;
    MOLogWrite();
  }
  unsigned __int8 v8 = [v7 bundle];
  id v9 = [v8 identifier];

  uint64_t v10 = [(MIInstaller *)self identity];
  id v99 = [v10 personaUniqueString];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v13 = v7;
    id v14 = [v13 existingBundleContainer];

    if (v14 && v96 == 1)
    {
      uint64_t v15 = 13;
LABEL_34:

      uint64_t v16 = v15;
      goto LABEL_35;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v15 = 1;
      goto LABEL_34;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v15 = 2;
      goto LABEL_34;
    }
    if ([v13 isPlaceholderInstall])
    {
      uint64_t v17 = [v13 existingBundleContainer];
      if (v17)
      {
        uint64_t v18 = [v13 existingBundleContainer];
        uint64_t v19 = [v18 bundle];
        unsigned __int8 v20 = [v19 isPlaceholder];

        if (v20)
        {
          uint64_t v15 = 3;
          goto LABEL_34;
        }
      }
    }
    if ([v13 isPlaceholderInstall])
    {
      uint64_t v15 = 4;
      goto LABEL_34;
    }
    unsigned int v21 = [v13 existingBundleContainer];
    if (v21)
    {
      id v22 = [v13 existingBundleContainer];
      if (v22)
      {
        uint64_t v23 = [v13 existingBundleContainer];
        unsigned int v24 = [v23 bundle];
        unsigned __int8 v25 = [v24 isPlaceholder];

        if (v25) {
          goto LABEL_22;
        }
      }
      else
      {
      }
      long long v26 = [v13 existingBundleContainer];
      if (v26)
      {
        long long v27 = [v13 existingBundleContainer];
        long long v28 = [v27 bundle];
        if ([v28 isPlaceholder])
        {
        }
        else
        {
          uint64_t v29 = [(MIInstaller *)self options];
          id v30 = [v29 installTargetType];

          if (v30 == (id)3)
          {
            uint64_t v15 = 6;
            goto LABEL_34;
          }
        }
      }
      unsigned __int8 v31 = [v13 existingBundleContainer];
      if (v31)
      {
        id v32 = [v13 existingBundleContainer];
        id v33 = [v32 bundle];
        unsigned int v34 = [v33 isPlaceholder];

        if (v34) {
          uint64_t v15 = 8;
        }
        else {
          uint64_t v15 = 7;
        }
      }
      else
      {
        uint64_t v15 = 8;
      }
      goto LABEL_34;
    }
LABEL_22:
    uint64_t v15 = 5;
    goto LABEL_34;
  }
  uint64_t v16 = 0;
LABEL_35:
  uint64_t v98 = v16;
  _MILogTransactionStep(v16, 1, 1, v9, v99, 0, v11, v12, v94);
  uint64_t v35 = mach_absolute_time();
  if (v5)
  {
    CFStringRef v36 = +[MIFileManager defaultManager];
    v37 = [v7 bundle];
    unsigned __int8 v38 = [v37 bundleURL];
    uint64_t v39 = v119;
    id obj = v119[5];
    unsigned __int8 v40 = [v36 validateSymlinksInURLDoNotEscapeURL:v38 error:&obj];
    objc_storeStrong(v39 + 5, obj);

    if ((v40 & 1) == 0)
    {
      if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 3)
      {
        unsigned int v57 = [v7 bundle];
        uint64_t v58 = [v57 bundleURL];
        id v95 = [v58 path];
        MOLogWrite();
      }
      id v49 = 0;
      goto LABEL_119;
    }
  }
  if (qword_1000A5FE8 != -1) {
    dispatch_once(&qword_1000A5FE8, &stru_10008D4E8);
  }
  unint64_t v44 = (id)qword_1000A5FE0;
  if (os_signpost_enabled(v44))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v44, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "PreflightAndPatch", "Start preflighting and patching", buf, 2u);
  }

  unsigned int v45 = v119 + 5;
  id v115 = v119[5];
  unsigned __int8 v46 = [v7 performPreflightWithError:&v115];
  objc_storeStrong(v45, v115);
  if (v46)
  {
    [(MIInstaller *)self setPreflightAndPatchTime:(mach_absolute_time() - v35) * qword_1000A60C0 / HIDWORD(qword_1000A60C0)];
    if (qword_1000A5FE8 != -1) {
      dispatch_once(&qword_1000A5FE8, &stru_10008D4E8);
    }
    uint64_t v47 = (id)qword_1000A5FE0;
    if (os_signpost_enabled(v47))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v47, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "PreflightAndPatch", "End preflighting and patching [succeeded]", buf, 2u);
    }
    int v48 = 0;
  }
  else
  {
    if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 3) {
      MOLogWrite();
    }
    if (qword_1000A5FE8 != -1) {
      dispatch_once(&qword_1000A5FE8, &stru_10008D4E8);
    }
    uint64_t v47 = (id)qword_1000A5FE0;
    if (os_signpost_enabled(v47))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v47, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "PreflightAndPatch", "End preflighting and patching [failed]", buf, 2u);
    }
    int v48 = 10;
  }

  id v49 = 0;
  if (v48 != 10)
  {
    uint64_t v50 = mach_absolute_time();
    if (qword_1000A5FE8 != -1) {
      dispatch_once(&qword_1000A5FE8, &stru_10008D4E8);
    }
    unsigned __int8 v52 = (id)qword_1000A5FE0;
    if (os_signpost_enabled(v52))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v52, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "Verification", "Start code sign verification", buf, 2u);
    }

    v53 = v119 + 5;
    id v114 = v119[5];
    unsigned __int8 v54 = [v7 performVerificationWithError:&v114];
    objc_storeStrong(v53, v114);
    if (v54)
    {
      [(MIInstaller *)self setVerificationTime:(mach_absolute_time() - v50) * qword_1000A60C0 / HIDWORD(qword_1000A60C0)];
      if (qword_1000A5FE8 != -1) {
        dispatch_once(&qword_1000A5FE8, &stru_10008D4E8);
      }
      id v55 = (id)qword_1000A5FE0;
      if (os_signpost_enabled(v55))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v55, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "Verification", "End code sign verification [succeeded]", buf, 2u);
      }
      int v56 = 0;
    }
    else
    {
      if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 3) {
        MOLogWrite();
      }
      if (qword_1000A5FE8 != -1) {
        dispatch_once(&qword_1000A5FE8, &stru_10008D4E8);
      }
      id v55 = (id)qword_1000A5FE0;
      if (os_signpost_enabled(v55))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v55, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "Verification", "End code sign verification [failed]", buf, 2u);
      }
      int v56 = 10;
    }

    id v49 = 0;
    if (v56 != 10)
    {
      unsigned int v60 = v119 + 5;
      id v113 = v119[5];
      int v61 = [v7 performInstallationWithError:&v113];
      objc_storeStrong(v60, v113);
      if (v61)
      {
        int v62 = 0;
      }
      else
      {
        if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 3) {
          MOLogWrite();
        }
        int v62 = 10;
      }
      id v49 = 0;
      if (v62 != 10)
      {
        char v64 = v119 + 5;
        id v112 = v119[5];
        int v65 = [v7 postFlightInstallationWithError:&v112];
        objc_storeStrong(v64, v112);
        if (v65)
        {
          int v66 = 0;
        }
        else
        {
          if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 3) {
            MOLogWrite();
          }
          int v66 = 10;
        }
        id v49 = 0;
        if (v66 != 10)
        {
          if (v96 == 1)
          {
            long long v68 = v119;
            id v110 = v119[5];
            id v111 = 0;
            unsigned __int8 v69 = [v7 stageBackgroundUpdate:&v111 withError:&v110];
            id v70 = v111;
            id v71 = v111;
            objc_storeStrong(v68 + 5, v110);
            if (v69)
            {
              objc_storeStrong((id *)&self->_stagedJournalEntryUniqueID, v70);
              CFStringRef v72 = [(MIInstaller *)self lockedIdentifiers];

              if (v72)
              {
                uint64_t v73 = [(MIInstaller *)self lockedIdentifiers];
                sub_1000550D8(v73);

                [(MIInstaller *)self setLockedIdentifiers:0];
              }
              int v74 = 39;
            }
            else
            {
              int v74 = 10;
            }
          }
          else
          {
            uint64_t v75 = v119 + 5;
            id v109 = v119[5];
            unsigned __int8 v76 = [v7 finalizeInstallationWithError:&v109];
            objc_storeStrong(v75, v109);
            if (v76)
            {
              int v74 = 0;
            }
            else
            {
              if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 3) {
                MOLogWrite();
              }
              int v74 = 10;
            }
          }
          id v49 = 0;
          if (v74 != 39)
          {
            if (v74 == 10) {
              goto LABEL_119;
            }
            v78 = v119;
            id v108 = v119[5];
            id v49 = [v7 launchServicesBundleRecordsWithError:&v108];
            objc_storeStrong(v78 + 5, v108);
            if (v49)
            {
              int v79 = 0;
            }
            else
            {
              if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 3)
              {
                id v95 = v119[5];
                MOLogWrite();
              }
              int v79 = 10;
            }
            if (v79 == 10) {
              goto LABEL_119;
            }
            uint64_t v80 = [(MIInstaller *)self lockedIdentifiers];

            if (v80)
            {
              id v81 = [(MIInstaller *)self lockedIdentifiers];
              sub_1000550D8(v81);

              [(MIInstaller *)self setLockedIdentifiers:0];
            }
            uint64_t v82 = [(MIInstaller *)self client];
            [v82 releaseTerminationAssertion];

            [(MIInstaller *)self setTerminationAssertionReleased:1];
            *(void *)buf = 0;
            id v105 = buf;
            uint64_t v106 = 0x2020000000;
            char v107 = 0;
            uint64_t v83 = sub_10000EC48();
            block[0] = _NSConcreteStackBlock;
            block[1] = 3221225472;
            block[2] = sub_100028514;
            block[3] = &unk_10008CCA0;
            id v84 = v7;
            id v101 = v84;
            unsigned __int8 v102 = &v118;
            id v103 = buf;
            dispatch_sync(v83, block);

            if (v105[24])
            {

              _Block_object_dispose(buf, 8);
              goto LABEL_119;
            }
            v87 = [v84 recordPromise];
            recordPromise = self->_recordPromise;
            self->_recordPromise = v87;

            _Block_object_dispose(buf, 8);
          }
          if ([v49 count]) {
            unsigned int v89 = v49;
          }
          else {
            unsigned int v89 = (NSArray *)&__NSArray0__struct;
          }
          receipt = self->_receipt;
          self->_receipt = v89;

          char v85 = 1;
          _MILogTransactionStep(v98, 2, 1, v9, v99, 0, v91, v92, (uint64_t)v95);
          goto LABEL_124;
        }
      }
    }
  }
LABEL_119:
  if (v9 && v98) {
    _MILogTransactionStep(v98, 2, 0, v9, v99, 0, v41, v42, (uint64_t)v95);
  }
  char v85 = 0;
  if (a5) {
    *a5 = v119[5];
  }
LABEL_124:

  _Block_object_dispose(&v118, 8);
  return v85 & 1;
}

- (void)_logOperationCompletionWithStartTime:(unint64_t)a3 distributorID:(id)a4
{
  id v9 = a4;
  BOOL v5 = [(MIInstaller *)self options];
  id v6 = [(MIInstaller *)self identity];
  id v7 = [v6 bundleID];

  mach_absolute_time();
  if ((id)[(MIInstaller *)self installOperationType] == (id)1)
  {
    if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 5)
    {
LABEL_11:
      unsigned __int8 v8 = [v5 installTypeSummaryString];
      [(MIInstaller *)self stagingTime];
      [(MIInstaller *)self waitingTime];
      [(MIInstaller *)self preflightAndPatchTime];
      [(MIInstaller *)self verificationTime];
      goto LABEL_12;
    }
  }
  else if ((id)[(MIInstaller *)self installOperationType] == (id)2)
  {
    if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 5)
    {
      unsigned __int8 v8 = [v5 installTypeSummaryString];
LABEL_12:
      MOLogWrite();
    }
  }
  else if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 5)
  {
    goto LABEL_11;
  }
}

- (BOOL)performInstallationWithError:(id *)a3
{
  unsigned __int8 v59 = 0;
  uint64_t v5 = mach_absolute_time();
  id v6 = +[MIDaemonConfiguration sharedInstance];
  CFStringRef v51 = [v6 installationBlacklist];

  unint64_t v7 = [(MIInstaller *)self installOperationType];
  if (v7 == 1)
  {
    if (qword_1000A5FE8 != -1) {
      dispatch_once(&qword_1000A5FE8, &stru_10008D4E8);
    }
    unsigned __int8 v8 = qword_1000A5FE0;
    if (os_signpost_enabled((os_log_t)qword_1000A5FE0))
    {
      *(_WORD *)buf = 0;
      id v9 = "StageUpdate";
      uint64_t v10 = "Start update staging";
LABEL_10:
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v8, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, v9, v10, buf, 2u);
    }
  }
  else
  {
    if (qword_1000A5FE8 != -1) {
      dispatch_once(&qword_1000A5FE8, &stru_10008D4E8);
    }
    unsigned __int8 v8 = qword_1000A5FE0;
    if (os_signpost_enabled((os_log_t)qword_1000A5FE0))
    {
      *(_WORD *)buf = 0;
      id v9 = "Install";
      uint64_t v10 = "Start installation";
      goto LABEL_10;
    }
  }
  if (qword_1000A5FE8 != -1) {
    dispatch_once(&qword_1000A5FE8, &stru_10008D4E8);
  }
  uint64_t v11 = qword_1000A5FE0;
  if (os_signpost_enabled((os_log_t)qword_1000A5FE0))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v11, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "Stage", "Start staging", buf, 2u);
  }
  id v58 = 0;
  unsigned __int8 v12 = [(MIInstaller *)self _takeOwnershipOfInstallableContainingSymlink:&v59 error:&v58];
  id v13 = v58;
  if ((v12 & 1) == 0)
  {
    if (qword_1000A5FE8 != -1) {
      dispatch_once(&qword_1000A5FE8, &stru_10008D4E8);
    }
    uint64_t v23 = qword_1000A5FE0;
    if (!os_signpost_enabled((os_log_t)qword_1000A5FE0)) {
      goto LABEL_43;
    }
    *(_WORD *)buf = 0;
    goto LABEL_42;
  }
  if (qword_1000A60B8 && *(int *)(qword_1000A60B8 + 44) >= 7)
  {
    id v14 = [(MIInstaller *)self installURL];
    id v49 = [v14 path];
    MOLogWrite();
  }
  id v57 = v13;
  unsigned __int8 v15 = -[MIInstaller _setupPackageStateWithError:](self, "_setupPackageStateWithError:", &v57, v49);
  id v16 = v57;

  if ((v15 & 1) == 0)
  {
    if (qword_1000A5FE8 != -1) {
      dispatch_once(&qword_1000A5FE8, &stru_10008D4E8);
    }
    unsigned int v24 = qword_1000A5FE0;
    if (os_signpost_enabled((os_log_t)qword_1000A5FE0))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v24, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "Stage", "End staging [failed]", buf, 2u);
    }
    uint64_t v19 = 0;
    goto LABEL_37;
  }
  [(MIInstaller *)self _fireCallbackWithStatus:@"CreatingStagingDirectory" percentComplete:5];
  [(MIInstaller *)self _fireCallbackWithStatus:@"ExtractingPackage" percentComplete:15];
  id v56 = v16;
  unsigned __int8 v17 = [(MIInstaller *)self _extractPackageContainedSymlink:&v59 withError:&v56];
  id v13 = v56;

  if ((v17 & 1) == 0)
  {
    if (qword_1000A5FE8 != -1) {
      dispatch_once(&qword_1000A5FE8, &stru_10008D4E8);
    }
    uint64_t v23 = qword_1000A5FE0;
    if (!os_signpost_enabled((os_log_t)qword_1000A5FE0)) {
      goto LABEL_43;
    }
    *(_WORD *)buf = 0;
LABEL_42:
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v23, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "Stage", "End staging [failed]", buf, 2u);
LABEL_43:
    uint64_t v19 = 0;
    unsigned int v21 = 0;
    BOOL v25 = 0;
    goto LABEL_44;
  }
  [(MIInstaller *)self _fireCallbackWithStatus:@"InspectingPackage" percentComplete:20];
  if (qword_1000A5FE8 != -1) {
    dispatch_once(&qword_1000A5FE8, &stru_10008D4E8);
  }
  uint64_t v18 = qword_1000A5FE0;
  if (os_signpost_enabled((os_log_t)qword_1000A5FE0))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v18, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "Stage", "End staging [succeeded]", buf, 2u);
  }
  [(MIInstaller *)self setStagingTime:(mach_absolute_time() - v5) * qword_1000A60C0 / HIDWORD(qword_1000A60C0)];
  id v55 = v13;
  uint64_t v19 = [(MIInstaller *)self _discoverInstallableWithError:&v55];
  id v16 = v55;

  if (!v19)
  {
LABEL_37:
    unsigned int v21 = 0;
    BOOL v25 = 0;
    id v13 = v16;
    goto LABEL_44;
  }
  uint64_t v50 = a3;
  unsigned __int8 v20 = [(MIInstaller *)self lockedIdentifiers];
  unsigned int v21 = +[NSSet setWithArray:v20];

  if ([v51 intersectsSet:v21])
  {
    sub_100014A08((uint64_t)"-[MIInstaller performInstallationWithError:]", 1185, MIInstallerErrorDomain, 7, 0, &off_100097A38, @"Found blacklisted app in identifiers to be installed: %@", v22, (uint64_t)v21);
    id v13 = (id)objc_claimAutoreleasedReturnValue();

LABEL_80:
    BOOL v25 = 0;
    goto LABEL_81;
  }
  id v54 = v16;
  unsigned int v44 = [(MIInstaller *)self _installProvisioningProfilesAtStagingRootWithError:&v54];
  id v13 = v54;

  if (!v44) {
    goto LABEL_80;
  }
  id v53 = v13;
  unsigned int v45 = [(MIInstaller *)self _installProvisioningProfilesFromUserOptionsWithError:&v53];
  id v46 = v53;

  if (!v45)
  {
    BOOL v25 = 0;
    id v13 = v46;
    goto LABEL_81;
  }
  id v52 = v46;
  unsigned int v47 = [(MIInstaller *)self _installInstallable:v19 containingSymlink:v59 error:&v52];
  id v13 = v52;

  if (!v47) {
    goto LABEL_80;
  }
  int v48 = [v19 installedDistributorID];
  [(MIInstaller *)self _logOperationCompletionWithStartTime:v5 distributorID:v48];

  BOOL v25 = 1;
LABEL_81:
  a3 = v50;
LABEL_44:
  if (v7 == 1)
  {
    if (qword_1000A5FE8 != -1) {
      dispatch_once(&qword_1000A5FE8, &stru_10008D4E8);
    }
    long long v26 = qword_1000A5FE0;
    if (os_signpost_enabled((os_log_t)qword_1000A5FE0))
    {
      long long v27 = "failed";
      if (v25) {
        long long v27 = "succeeded";
      }
      *(_DWORD *)buf = 136315138;
      int v61 = v27;
      long long v28 = "StageUpdate";
      uint64_t v29 = "End staging update [%s]";
LABEL_57:
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v26, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, v28, v29, buf, 0xCu);
    }
  }
  else
  {
    if (qword_1000A5FE8 != -1) {
      dispatch_once(&qword_1000A5FE8, &stru_10008D4E8);
    }
    long long v26 = qword_1000A5FE0;
    if (os_signpost_enabled((os_log_t)qword_1000A5FE0))
    {
      id v30 = "failed";
      if (v25) {
        id v30 = "succeeded";
      }
      *(_DWORD *)buf = 136315138;
      int v61 = v30;
      long long v28 = "Install";
      uint64_t v29 = "End installation [%s]";
      goto LABEL_57;
    }
  }
  unsigned __int8 v31 = [(MIInstaller *)self lockedIdentifiers];

  if (v31)
  {
    id v32 = [(MIInstaller *)self lockedIdentifiers];
    sub_1000550D8(v32);

    [(MIInstaller *)self setLockedIdentifiers:0];
  }
  uint64_t v33 = [(MIInstaller *)self client];
  if (v33)
  {
    unsigned int v34 = (void *)v33;
    unsigned __int8 v35 = [(MIInstaller *)self terminationAssertionReleased];

    if ((v35 & 1) == 0)
    {
      CFStringRef v36 = [(MIInstaller *)self client];
      [v36 releaseTerminationAssertion];

      [(MIInstaller *)self setTerminationAssertionReleased:1];
    }
  }
  v37 = [(MIInstaller *)self stagingRoot];

  if (v37)
  {
    uint64_t v39 = +[MIFileManager defaultManager];
    unsigned __int8 v40 = [(MIInstaller *)self stagingRoot];
    [v39 removeItemAtURL:v40 error:0];
  }
  if (v13) {
    char v41 = 1;
  }
  else {
    char v41 = v25;
  }
  if ((v41 & 1) == 0)
  {
    sub_100014A08((uint64_t)"-[MIInstaller performInstallationWithError:]", 1232, MIInstallerErrorDomain, 1, 0, 0, @"No error was specified but the operation failed.", v38, (uint64_t)v49);
    id v13 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (a3) {
    char v42 = v25;
  }
  else {
    char v42 = 1;
  }
  if ((v42 & 1) == 0) {
    *a3 = v13;
  }

  return v25;
}

- (BOOL)_applyStagedUpdateForUUID:(id)a3 withError:(id *)a4
{
  id v5 = a3;
  uint64_t v59 = 0;
  unsigned int v60 = (id *)&v59;
  uint64_t v61 = 0x3032000000;
  int v62 = sub_1000257FC;
  unint64_t v63 = sub_10002580C;
  id v64 = 0;
  id v6 = [(MIInstaller *)self identity];
  unint64_t v7 = [v6 bundleID];
  v58[0] = _NSConcreteStackBlock;
  v58[1] = 3221225472;
  v58[2] = sub_100029848;
  v58[3] = &unk_10008D4C8;
  v58[4] = self;
  id v46 = objc_retainBlock(v58);
  uint64_t v43 = mach_absolute_time();
  if (!v5)
  {
    uint64_t v28 = sub_100014A08((uint64_t)"-[MIInstaller _applyStagedUpdateForUUID:withError:]", 1259, MIInstallerErrorDomain, 217, 0, 0, @"Finalizing staged install operation is missing staged bundle UUID", v8, v40);
    uint64_t v10 = 0;
    id v45 = 0;
    id v16 = 0;
    uint64_t v11 = 0;
LABEL_19:
    id v14 = 0;
LABEL_20:
    uint64_t v29 = 0;
    receipt = (NSArray *)v60[5];
    v60[5] = (id)v28;
LABEL_21:

    goto LABEL_24;
  }
  if (qword_1000A5FE8 != -1) {
    dispatch_once(&qword_1000A5FE8, &stru_10008D4E8);
  }
  id v9 = qword_1000A5FE0;
  if (os_signpost_enabled((os_log_t)qword_1000A5FE0))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v9, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "InstallStagedUpdate", "Start Applying Staged Update", buf, 2u);
  }
  uint64_t v10 = [v6 personaUniqueString];
  uint64_t v11 = +[MIJournal sharedInstance];
  id v14 = [v11 journalEntryForUniqueIdentifier:v5];
  if (!v14)
  {
    uint64_t v28 = sub_100014A08((uint64_t)"-[MIInstaller _applyStagedUpdateForUUID:withError:]", 1269, MIInstallerErrorDomain, 218, 0, 0, @"Failed to find matching journal entry for making staged install live operation: %@", v13, (uint64_t)v5);
    id v45 = 0;
    id v16 = 0;
    goto LABEL_19;
  }
  if (qword_1000A60B8 && *(int *)(qword_1000A60B8 + 44) >= 7)
  {
    uint64_t v40 = (uint64_t)v14;
    MOLogWrite();
  }
  _MILogTransactionStep(14, 1, 1, v7, v10, 0, v12, v13, v40);
  [v14 setProgressBlock:v46];
  unsigned __int8 v15 = v60;
  id obj = v60[5];
  id v16 = [(MIInstaller *)self _identifiersToLockBundleIdentifier:v7 error:&obj];
  objc_storeStrong(v15 + 5, obj);
  if (!v16)
  {
    id v45 = 0;
    goto LABEL_23;
  }
  [(MIInstaller *)self _writeLockIdentifiers:v16];
  unsigned __int8 v17 = v60;
  id v56 = v60[5];
  unsigned __int8 v18 = [v14 makeStagedBackgroundUpdateLive:&v56];
  objc_storeStrong(v17 + 5, v56);
  if ((v18 & 1) == 0)
  {
    uint64_t v28 = sub_100014A08((uint64_t)"-[MIInstaller _applyStagedUpdateForUUID:withError:]", 1288, MIInstallerErrorDomain, 4, 0, 0, @"Failed to make staged background update live for app identity: %@", v19, (uint64_t)v6);
    id v45 = 0;
    goto LABEL_20;
  }
  id v45 = [v14 bundleRecordsToRegister];
  unsigned __int8 v20 = [(MIInstaller *)self lockedIdentifiers];

  if (v20)
  {
    unsigned int v21 = [(MIInstaller *)self lockedIdentifiers];
    sub_1000550D8(v21);

    [(MIInstaller *)self setLockedIdentifiers:0];
  }
  uint64_t v22 = [(MIInstaller *)self client];
  [v22 releaseTerminationAssertion];

  [(MIInstaller *)self setTerminationAssertionReleased:1];
  uint64_t v52 = 0;
  id v53 = &v52;
  uint64_t v54 = 0x2020000000;
  char v55 = 0;
  uint64_t v23 = sub_10000EC48();
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100029858;
  block[3] = &unk_10008CCA0;
  id v14 = v14;
  id v49 = v14;
  uint64_t v50 = &v59;
  CFStringRef v51 = &v52;
  dispatch_sync(v23, block);

  LODWORD(v23) = *((unsigned __int8 *)v53 + 24);
  _Block_object_dispose(&v52, 8);
  if (!v23)
  {
    [(MIInstaller *)self _logOperationCompletionWithStartTime:v43 distributorID:@"Unknown"];
    unsigned int v24 = [v14 recordPromise];
    recordPromise = self->_recordPromise;
    self->_recordPromise = v24;

    if ([v45 count])
    {
      long long v26 = (NSArray *)v45;
      receipt = self->_receipt;
      id v45 = v26;
      self->_receipt = v26;
    }
    else
    {
      receipt = self->_receipt;
      self->_receipt = (NSArray *)&__NSArray0__struct;
    }
    uint64_t v29 = 1;
    goto LABEL_21;
  }
LABEL_23:
  uint64_t v29 = 0;
LABEL_24:
  if (qword_1000A5FE8 != -1) {
    dispatch_once(&qword_1000A5FE8, &stru_10008D4E8);
  }
  id v30 = qword_1000A5FE0;
  if (os_signpost_enabled((os_log_t)qword_1000A5FE0))
  {
    uint64_t v33 = "failed";
    if (v29) {
      uint64_t v33 = "succeeded";
    }
    *(_DWORD *)buf = 136315138;
    int v66 = v33;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v30, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "InstallStagedUpdate", "End staging update installation [%s]", buf, 0xCu);
  }
  _MILogTransactionStep(14, 2, v29, v7, v10, 0, v31, v32, v41);
  if ((v29 & 1) == 0)
  {
    unsigned int v34 = [(MIInstaller *)self lockedIdentifiers];

    if (v34)
    {
      unsigned __int8 v35 = [(MIInstaller *)self lockedIdentifiers];
      sub_1000550D8(v35);

      [(MIInstaller *)self setLockedIdentifiers:0];
    }
    if (![(MIInstaller *)self terminationAssertionReleased])
    {
      CFStringRef v36 = [(MIInstaller *)self client];
      [v36 releaseTerminationAssertion];
    }
    if (v14)
    {
      id v47 = 0;
      unsigned __int8 v37 = [v11 purgeJournalEntry:v14 withError:&v47];
      id v38 = v47;
      if ((v37 & 1) == 0 && (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 3)) {
        MOLogWrite();
      }
    }
    else
    {
      id v38 = 0;
    }
    if (a4) {
      *a4 = v60[5];
    }
  }
  _Block_object_dispose(&v59, 8);

  return v29;
}

- (BOOL)applyStagedUpdateForUUID:(id)a3 withError:(id *)a4
{
  return [(MIInstaller *)self _applyStagedUpdateForUUID:a3 withError:a4];
}

- (NSArray)receipt
{
  return self->_receipt;
}

- (LSRecordPromise)recordPromise
{
  return self->_recordPromise;
}

- (NSString)stagedJournalEntryUniqueID
{
  return self->_stagedJournalEntryUniqueID;
}

- (NSURL)installURL
{
  return self->_installURL;
}

- (void)setInstallURL:(id)a3
{
}

- (unint64_t)installationDomain
{
  return self->_installationDomain;
}

- (MIInstallOptions)options
{
  return self->_options;
}

- (MIClientConnection)client
{
  return self->_client;
}

- (NSURL)stagingRoot
{
  return self->_stagingRoot;
}

- (void)setStagingRoot:(id)a3
{
}

- (NSURL)stagingURL
{
  return self->_stagingURL;
}

- (void)setStagingURL:(id)a3
{
}

- (unsigned)packageFormat
{
  return self->_packageFormat;
}

- (void)setPackageFormat:(unsigned __int8)a3
{
  self->_packageFormat = a3;
}

- (NSArray)lockedIdentifiers
{
  return self->_lockedIdentifiers;
}

- (void)setLockedIdentifiers:(id)a3
{
}

- (MIAppIdentity)identity
{
  return self->_identity;
}

- (void)setIdentity:(id)a3
{
}

- (BOOL)terminationAssertionReleased
{
  return self->_terminationAssertionReleased;
}

- (void)setTerminationAssertionReleased:(BOOL)a3
{
  self->_terminationAssertionReleased = a3;
}

- (unint64_t)stagingTime
{
  return self->_stagingTime;
}

- (void)setStagingTime:(unint64_t)a3
{
  self->_stagingTime = a3;
}

- (unint64_t)waitingTime
{
  return self->_waitingTime;
}

- (void)setWaitingTime:(unint64_t)a3
{
  self->_waitingTime = a3;
}

- (unint64_t)preflightAndPatchTime
{
  return self->_preflightAndPatchTime;
}

- (void)setPreflightAndPatchTime:(unint64_t)a3
{
  self->_preflightAndPatchTime = a3;
}

- (unint64_t)verificationTime
{
  return self->_verificationTime;
}

- (void)setVerificationTime:(unint64_t)a3
{
  self->_verificationTime = a3;
}

- (unint64_t)installOperationType
{
  return self->_installOperationType;
}

- (void)setInstallOperationType:(unint64_t)a3
{
  self->_installOperationType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identity, 0);
  objc_storeStrong((id *)&self->_lockedIdentifiers, 0);
  objc_storeStrong((id *)&self->_stagingURL, 0);
  objc_storeStrong((id *)&self->_stagingRoot, 0);
  objc_storeStrong((id *)&self->_client, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_installURL, 0);
  objc_storeStrong((id *)&self->_stagedJournalEntryUniqueID, 0);
  objc_storeStrong((id *)&self->_recordPromise, 0);

  objc_storeStrong((id *)&self->_receipt, 0);
}

@end
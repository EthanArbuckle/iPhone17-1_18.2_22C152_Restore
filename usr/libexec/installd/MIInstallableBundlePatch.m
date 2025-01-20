@interface MIInstallableBundlePatch
- (BOOL)_applyDeltaPatchWithError:(id *)a3;
- (BOOL)_applyParallelPatchProcessingArchiveSection:(BOOL)a3 withError:(id *)a4;
- (BOOL)applyPatchWithError:(id *)a3;
- (MIInstallableBundlePatch)initWithBundle:(id)a3 inStagingRoot:(id)a4 packageFormat:(unsigned __int8)a5 identity:(id)a6 domain:(unint64_t)a7 installOptions:(id)a8 manifestURL:(id)a9 existingBundleContainer:(id)a10 patchType:(unsigned __int8)a11 operationType:(unint64_t)a12 error:(id *)a13;
- (NSString)existingBundleShortVersion;
- (NSString)existingBundleVersion;
- (NSString)patchTypeName;
- (NSString)updatedBundleShortVersion;
- (NSString)updatedBundleVersion;
- (NSURL)manifestURL;
- (unsigned)patchType;
@end

@implementation MIInstallableBundlePatch

- (MIInstallableBundlePatch)initWithBundle:(id)a3 inStagingRoot:(id)a4 packageFormat:(unsigned __int8)a5 identity:(id)a6 domain:(unint64_t)a7 installOptions:(id)a8 manifestURL:(id)a9 existingBundleContainer:(id)a10 patchType:(unsigned __int8)a11 operationType:(unint64_t)a12 error:(id *)a13
{
  uint64_t v16 = a5;
  id v52 = a9;
  v53.receiver = self;
  v53.super_class = (Class)MIInstallableBundlePatch;
  v20 = -[MIInstallableBundle initWithBundle:inStagingRoot:packageFormat:identity:domain:installOptions:existingBundleContainer:operationType:error:](&v53, "initWithBundle:inStagingRoot:packageFormat:identity:domain:installOptions:existingBundleContainer:operationType:error:", a3, a4, v16, a6, a7, a8);
  v22 = v20;
  if (!v20) {
    goto LABEL_6;
  }
  if (!a10)
  {
    if (a13)
    {
      sub_100014A08((uint64_t)"-[MIInstallableBundlePatch initWithBundle:inStagingRoot:packageFormat:identity:domain:installOptions:manifestURL:existingBundleContainer:patchType:operationType:error:]", 48, MIInstallerErrorDomain, 4, 0, 0, @"No installed app container supplied for patch update.", v21, (uint64_t)a10);
      v47 = 0;
      *a13 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v47 = 0;
    }
    goto LABEL_15;
  }
  v23 = v52;
  if (v52)
  {
    if (a11)
    {
      objc_storeStrong((id *)&v20->_manifestURL, a9);
      v24 = [(MIInstallable *)v22 bundle];
      v25 = [v24 infoPlistSubset];
      v26 = [v25 objectForKeyedSubscript:kCFBundleVersionKey];
      uint64_t v27 = sub_100015170(v26);
      updatedBundleVersion = v22->_updatedBundleVersion;
      v22->_updatedBundleVersion = (NSString *)v27;

      v29 = [(MIInstallable *)v22 bundle];
      v30 = [v29 infoPlistSubset];
      uint64_t v31 = _kCFBundleShortVersionStringKey;
      v32 = [v30 objectForKeyedSubscript:_kCFBundleShortVersionStringKey];
      uint64_t v33 = sub_100015170(v32);
      updatedBundleShortVersion = v22->_updatedBundleShortVersion;
      v22->_updatedBundleShortVersion = (NSString *)v33;

      v35 = [(MIInstallableBundle *)v22 existingBundleContainer];
      v36 = [v35 bundle];
      v37 = [v36 infoPlistSubset];
      v38 = [v37 objectForKeyedSubscript:kCFBundleVersionKey];
      uint64_t v39 = sub_100015170(v38);
      existingBundleVersion = v22->_existingBundleVersion;
      v22->_existingBundleVersion = (NSString *)v39;

      v41 = [(MIInstallableBundle *)v22 existingBundleContainer];
      v42 = [v41 bundle];
      v43 = [v42 infoPlistSubset];
      v44 = [v43 objectForKeyedSubscript:v31];
      uint64_t v45 = sub_100015170(v44);
      existingBundleShortVersion = v22->_existingBundleShortVersion;
      v22->_existingBundleShortVersion = (NSString *)v45;

      v22->_patchType = a11;
LABEL_6:
      v47 = v22;
LABEL_15:
      v23 = v52;
      goto LABEL_16;
    }
    if (a13)
    {
      v48 = (void *)MIInstallerErrorDomain;
      v49 = @"No patch type supplied for patch update.";
      uint64_t v50 = 58;
      goto LABEL_13;
    }
LABEL_17:
    v47 = 0;
    goto LABEL_16;
  }
  if (!a13) {
    goto LABEL_17;
  }
  v48 = (void *)MIInstallerErrorDomain;
  v49 = @"No manifest supplied for patch update.";
  uint64_t v50 = 53;
LABEL_13:
  sub_100014A08((uint64_t)"-[MIInstallableBundlePatch initWithBundle:inStagingRoot:packageFormat:identity:domain:installOptions:manifestURL:existingBundleContainer:patchType:operationType:error:]", v50, v48, 4, 0, 0, v49, v21, (uint64_t)a10);
  v47 = 0;
  *a13 = (id)objc_claimAutoreleasedReturnValue();
LABEL_16:

  return v47;
}

- (NSString)patchTypeName
{
  unsigned int v2 = [(MIInstallableBundlePatch *)self patchType] - 1;
  if (v2 > 2) {
    return (NSString *)@"Invalid";
  }
  else {
    return &off_10008D760[(char)v2]->isa;
  }
}

- (BOOL)_applyDeltaPatchWithError:(id *)a3
{
  v5 = [(MIInstallableBundle *)self existingBundleContainer];
  v6 = [v5 bundle];
  v7 = [v6 bundleURL];
  v8 = [v7 URLByAppendingPathComponent:@"Info.plist" isDirectory:0];

  v55[1] = 0;
  v9 = MICreateSHA256Digest();
  id v11 = 0;
  if (!v9)
  {
    uint64_t v27 = sub_100014A08((uint64_t)"-[MIInstallableBundlePatch _applyDeltaPatchWithError:]", 91, MIInstallerErrorDomain, 8, v11, &off_100097A60, @"Failed to get Info.plist hash for %@", v10, (uint64_t)v8);

    v14 = 0;
    if (a3) {
      goto LABEL_8;
    }
LABEL_12:
    BOOL v26 = 0;
    id v11 = v27;
    goto LABEL_13;
  }
  v12 = [(MIInstallableBundle *)self existingBundleContainer];
  v13 = [v12 bundle];
  v14 = [v13 supportedDevices];

  objc_opt_class();
  if ((sub_100014D8C(v14) & 1) == 0)
  {
    uint64_t v27 = sub_100014A08((uint64_t)"-[MIInstallableBundlePatch _applyDeltaPatchWithError:]", 97, MIInstallerErrorDomain, 87, 0, &off_100097A88, @"Existing app's SupportedDevices Info.plist key does not contain only string values.", v15, v37);

    if (a3) {
      goto LABEL_8;
    }
    goto LABEL_12;
  }
  uint64_t v39 = a3;
  v41 = v8;
  MIAssertHighResourceUsage();
  v55[0] = 0;
  id v52 = [(MIInstallableBundle *)self existingBundleContainer];
  uint64_t v50 = [v52 bundle];
  id v48 = [v50 bundleURL];
  id v44 = [v48 fileSystemRepresentation];
  v47 = [(MIInstallable *)self bundle];
  id v46 = [v47 bundleURL];
  id v43 = [v46 fileSystemRepresentation];
  id v45 = [(MIInstallableBundlePatch *)self manifestURL];
  id v42 = [v45 fileSystemRepresentation];
  id v16 = [(MIInstallableBundlePatch *)self existingBundleVersion];
  id v17 = [v16 UTF8String];
  id v18 = [(MIInstallableBundlePatch *)self existingBundleShortVersion];
  uint64_t v54 = (uint64_t)v14;
  id v19 = [v18 UTF8String];
  v40 = v9;
  uint64_t v20 = (uint64_t)[v9 UTF8String];
  uint64_t v21 = [(MIInstallableBundle *)self existingBundleContainer];
  v22 = [v21 bundle];
  id v23 = [v22 executableURL];
  id v24 = [v23 fileSystemRepresentation];
  uint64_t v25 = (uint64_t)v19;
  v14 = (void *)v54;
  LOBYTE(v20) = sub_10000930C((uint64_t)v44, (uint64_t)v43, (uint64_t)v42, (uint64_t)v17, v25, v20, (uint64_t)v24, v54, 0, v55);

  MIClearResourceAssertion();
  if ((v20 & 1) == 0)
  {
    v49 = (void *)MIInstallerErrorDomain;
    CFErrorRef v51 = v55[0];
    objc_super v53 = [(MIInstallableBundle *)self existingBundleContainer];
    v28 = [v53 bundle];
    v29 = [v28 bundleURL];
    v30 = [v29 path];
    uint64_t v31 = [(MIInstallable *)self bundle];
    v32 = [v31 bundleURL];
    uint64_t v33 = [v32 path];
    v34 = [(MIInstallableBundlePatch *)self manifestURL];
    v38 = [v34 path];
    uint64_t v27 = sub_100014A08((uint64_t)"-[MIInstallableBundlePatch _applyDeltaPatchWithError:]", 116, v49, 8, v51, &off_100097AB0, @"Could not hardlink copy %@ to %@ with manifest %@", v35, (uint64_t)v30);

    if (v55[0])
    {
      CFRelease(v55[0]);
      v55[0] = 0;
    }
    v9 = v40;
    v8 = v41;
    a3 = v39;
    v14 = (void *)v54;
    if (!v39) {
      goto LABEL_12;
    }
LABEL_8:
    id v11 = v27;
    BOOL v26 = 0;
    *a3 = v11;
    goto LABEL_13;
  }
  BOOL v26 = 1;
  v9 = v40;
  v8 = v41;
LABEL_13:

  return v26;
}

- (BOOL)_applyParallelPatchProcessingArchiveSection:(BOOL)a3 withError:(id *)a4
{
  BOOL v4 = a3;
  v55 = 0;
  v6 = +[MIDaemonConfiguration sharedInstance];
  unsigned int v43 = [v6 uid];
  v7 = +[MIDaemonConfiguration sharedInstance];
  unsigned int v41 = [v7 gid];

  if (v4) {
    int v8 = 256;
  }
  else {
    int v8 = 258;
  }
  v9 = [(MIInstallableBundle *)self existingBundleContainer];
  uint64_t v10 = [v9 bundle];
  id v11 = [v10 bundleURL];
  id v39 = [v11 fileSystemRepresentation];
  v45[1] = v39;
  v12 = [(MIInstallable *)self bundle];
  id v13 = [v12 bundleURL];
  id v14 = [v13 fileSystemRepresentation];
  v45[2] = v14;
  id v15 = [(MIInstallableBundlePatch *)self manifestURL];
  id v16 = [v15 fileSystemRepresentation];
  v45[3] = v16;
  int v46 = v8;
  char v47 = 15;
  __int16 v48 = 0;
  char v49 = 0;
  unsigned int v50 = v43;
  unsigned int v51 = v41;
  long long v52 = xmmword_1000659E0;
  objc_super v53 = &v55;
  uint64_t v54 = 0;

  if (qword_1000A60B8 && *(int *)(qword_1000A60B8 + 44) >= 7)
  {
    id v36 = v14;
    id v37 = v16;
    id v34 = v39;
    MOLogWrite();
  }
  MIAssertHighResourceUsage();
  int v17 = DirectoryPatch();
  MIClearResourceAssertion();
  if (v17)
  {
    int v42 = v17;
    id v18 = (void *)MIInstallerErrorDomain;
    id v19 = v55;
    id v44 = [(MIInstallableBundle *)self existingBundleContainer];
    uint64_t v20 = [v44 bundle];
    uint64_t v21 = [v20 bundleURL];
    v22 = [v21 path];
    id v23 = [(MIInstallable *)self bundle];
    id v24 = [v23 bundleURL];
    uint64_t v25 = [v24 path];
    BOOL v26 = [(MIInstallableBundlePatch *)self manifestURL];
    v38 = [v26 path];
    sub_100014A08((uint64_t)"-[MIInstallableBundlePatch _applyParallelPatchProcessingArchiveSection:withError:]", 182, v18, 8, v19, &off_100097AD8, @"DirectoryPatch failed for %@ to %@ with manifest %@", v27, (uint64_t)v22);
    id v28 = (id)objc_claimAutoreleasedReturnValue();

    if (v19) {
    if (a4)
    }
    {
      id v28 = v28;
      *a4 = v28;
    }
    int v17 = v42;
  }
  else
  {
    v29 = +[MIFileManager defaultManager];
    v30 = [(MIInstallableBundlePatch *)self manifestURL];
    v45[0] = 0;
    unsigned __int8 v31 = [v29 removeItemAtURL:v30 error:v45];
    id v28 = v45[0];

    if ((v31 & 1) == 0 && (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 3))
    {
      v32 = [(MIInstallableBundlePatch *)self manifestURL];
      uint64_t v35 = [v32 path];
      MOLogWrite();
    }
  }

  return v17 == 0;
}

- (BOOL)applyPatchWithError:(id *)a3
{
  id v5 = [(MIInstallableBundlePatch *)self manifestURL];

  if (!v5) {
    goto LABEL_18;
  }
  v6 = [(MIInstallable *)self progressBlock];
  ((void (**)(void, const __CFString *, uint64_t))v6)[2](v6, @"PatchingApplication", 35);

  if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 5)
  {
    v7 = [(MIInstallableBundlePatch *)self patchTypeName];
    int v8 = [(MIInstallable *)self bundle];
    v9 = [v8 identifier];
    uint64_t v10 = [(MIInstallableBundlePatch *)self existingBundleVersion];
    id v11 = [(MIInstallableBundlePatch *)self existingBundleShortVersion];
    v12 = [(MIInstallableBundlePatch *)self updatedBundleVersion];
    [(MIInstallableBundlePatch *)self updatedBundleShortVersion];
    uint64_t v33 = v32 = v12;
    v30 = v10;
    unsigned __int8 v31 = v11;
    uint64_t v27 = v7;
    v29 = v9;
    MOLogWrite();
  }
  unsigned int v13 = [(MIInstallableBundlePatch *)self patchType];
  if (v13 == 1)
  {
    id v35 = 0;
    unsigned int v15 = [(MIInstallableBundlePatch *)self _applyDeltaPatchWithError:&v35];
    id v5 = v35;
    if (v15) {
      goto LABEL_13;
    }
    goto LABEL_20;
  }
  if (v13 != 2)
  {
    if (v13 == 3)
    {
      uint64_t v14 = 1;
      goto LABEL_12;
    }
    id v5 = 0;
LABEL_20:
    if (!a3) {
      goto LABEL_24;
    }
    goto LABEL_21;
  }
  uint64_t v14 = 0;
LABEL_12:
  id v34 = 0;
  unsigned __int8 v16 = [(MIInstallableBundlePatch *)self _applyParallelPatchProcessingArchiveSection:v14 withError:&v34];
  id v5 = v34;
  if ((v16 & 1) == 0) {
    goto LABEL_20;
  }
LABEL_13:
  int v17 = +[MIDaemonConfiguration sharedInstance];
  if (([v17 allowPatchWithoutSinf] & 1) == 0)
  {
    id v18 = [(MIInstallable *)self installOptions];
    id v19 = [v18 sinfData];
    if (v19)
    {

      goto LABEL_16;
    }
    v22 = [(MIInstallable *)self bundle];
    unsigned int v23 = [v22 needsSinf];

    if (!v23) {
      goto LABEL_17;
    }
    uint64_t v25 = sub_100014A08((uint64_t)"-[MIInstallableBundlePatch applyPatchWithError:]", 245, MIInstallerErrorDomain, 60, 0, &off_100097B00, @"Client requesting patch installation did not supply a new SINF for an app that requires one to function", v24, v28);

    id v5 = (id)v25;
    if (!a3)
    {
LABEL_24:
      BOOL v21 = 0;
      goto LABEL_25;
    }
LABEL_21:
    id v5 = v5;
    BOOL v21 = 0;
    *a3 = v5;
    goto LABEL_25;
  }
LABEL_16:

LABEL_17:
  uint64_t v20 = [(MIInstallable *)self bundle];
  [v20 removeSinf];

LABEL_18:
  BOOL v21 = 1;
LABEL_25:

  return v21;
}

- (NSString)existingBundleVersion
{
  return self->_existingBundleVersion;
}

- (NSString)existingBundleShortVersion
{
  return self->_existingBundleShortVersion;
}

- (NSString)updatedBundleVersion
{
  return self->_updatedBundleVersion;
}

- (NSString)updatedBundleShortVersion
{
  return self->_updatedBundleShortVersion;
}

- (NSURL)manifestURL
{
  return self->_manifestURL;
}

- (unsigned)patchType
{
  return self->_patchType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_manifestURL, 0);
  objc_storeStrong((id *)&self->_updatedBundleShortVersion, 0);
  objc_storeStrong((id *)&self->_updatedBundleVersion, 0);
  objc_storeStrong((id *)&self->_existingBundleShortVersion, 0);

  objc_storeStrong((id *)&self->_existingBundleVersion, 0);
}

@end
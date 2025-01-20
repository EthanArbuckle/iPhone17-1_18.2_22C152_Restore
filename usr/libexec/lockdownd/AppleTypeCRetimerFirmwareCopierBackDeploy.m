@interface AppleTypeCRetimerFirmwareCopierBackDeploy
- (AppleTypeCRetimerFirmwareCopierBackDeploy)initWithOptions:(id)a3 logFunction:(void *)a4 logContext:(void *)a5;
- (BOOL)copyFirmwareToDestinationBundleWithError:(id *)a3;
- (BOOL)createDestinationBundleFirmwareDirectoryFor:(id)a3 error:(id *)a4;
- (BOOL)parseOptions:(id)a3;
- (id)description;
- (id)readFirmwareFileDataWithError:(id *)a3;
- (id)rtKitKeyFromBuildIdentityDict:(id)a3;
@end

@implementation AppleTypeCRetimerFirmwareCopierBackDeploy

- (AppleTypeCRetimerFirmwareCopierBackDeploy)initWithOptions:(id)a3 logFunction:(void *)a4 logContext:(void *)a5
{
  id v8 = a3;
  v13.receiver = self;
  v13.super_class = (Class)AppleTypeCRetimerFirmwareCopierBackDeploy;
  v9 = [(AppleTypeCRetimerRestoreInfoHelperBackDeploy *)&v13 initWithOptions:v8 logFunction:a4 logContext:a5];
  v10 = v9;
  if (v9)
  {
    if (![(AppleTypeCRetimerFirmwareCopierBackDeploy *)v9 parseOptions:v8])
    {
      v11 = 0;
      goto LABEL_6;
    }
    [(AppleTypeCRetimerRestoreInfoHelperBackDeploy *)v10 verboseLog:@"%@", v10];
  }
  v11 = v10;
LABEL_6:

  return v11;
}

- (BOOL)parseOptions:(id)a3
{
  id v4 = a3;
  id v5 = [v4 objectForKeyedSubscript:@"BuildIdentity"];
  if (v5)
  {
    id v6 = [(AppleTypeCRetimerFirmwareCopierBackDeploy *)self rtKitKeyFromBuildIdentityDict:v5];
    if (!v6)
    {
      [(AppleTypeCRetimerRestoreInfoHelperBackDeploy *)self log:@"Could not find RTKitOS key in build identity dictionary"];
      BOOL v25 = 0;
LABEL_20:

      goto LABEL_21;
    }
    id v7 = [v5 objectForKeyedSubscript:v6];
    id v8 = [v7 objectForKeyedSubscript:@"Info"];
    v9 = v8;
    if (!v8)
    {
      [(AppleTypeCRetimerRestoreInfoHelperBackDeploy *)self log:@"Could not find RTKitOS info dictionary"];
      BOOL v25 = 0;
LABEL_19:

      goto LABEL_20;
    }
    id v10 = [v8 objectForKeyedSubscript:@"Path"];
    v11 = v10;
    if (v10)
    {
      id v12 = [v10 copy];
      objc_super v13 = *(void **)(&self->super._verbose + 1);
      *(void *)(&self->super._verbose + 1) = v12;

      v14 = (NSURL *)[v4 objectForKeyedSubscript:@"FirmwareData"];
      v15 = *(NSURL **)((char *)&self->_destBundlePathURL + 1);
      *(NSURL **)((char *)&self->_destBundlePathURL + 1) = v14;

      if (*(NSURL **)((char *)&self->_destBundlePathURL + 1)) {
        goto LABEL_12;
      }
      id v16 = [v4 objectForKeyedSubscript:@"BundleDataDict"];
      if (v16)
      {
        id v28 = v16;
        v17 = (NSData *)[v16 objectForKeyedSubscript:v6];
        v18 = *(NSData **)((char *)&self->_firmwareOverrideData + 1);
        *(NSData **)((char *)&self->_firmwareOverrideData + 1) = v17;

        [(AppleTypeCRetimerRestoreInfoHelperBackDeploy *)self log:@"Attempt to use '%@' firmware from BundleDataDict: %@", v6, *(NSData **)((char *)&self->_firmwareOverrideData + 1)];
        id v16 = v28;
      }

      if (*(NSURL **)((char *)&self->_destBundlePathURL + 1) || *(NSData **)((char *)&self->_firmwareOverrideData + 1)) {
        goto LABEL_12;
      }
      id v19 = [v4 objectForKeyedSubscript:@"BundlePath"];
      if (v19)
      {
        v20 = v19;
        v21 = (NSString *)[v19 URLByAppendingPathComponent:*(void *)(&self->super._verbose + 1)];
        v22 = *(NSString **)((char *)&self->_firmwarePathSuffix + 1);
        *(NSString **)((char *)&self->_firmwarePathSuffix + 1) = v21;

LABEL_12:
        v23 = (NSURL *)[v4 objectForKeyedSubscript:@"DestBundlePath"];
        v24 = *(NSURL **)((char *)&self->_firmwareBundleURL + 1);
        *(NSURL **)((char *)&self->_firmwareBundleURL + 1) = v23;

        BOOL v25 = 1;
LABEL_18:

        goto LABEL_19;
      }
      CFStringRef v26 = @"Could not find bundle path";
    }
    else
    {
      CFStringRef v26 = @"Could not find RTKitOS path";
    }
    [(AppleTypeCRetimerRestoreInfoHelperBackDeploy *)self log:v26];
    BOOL v25 = 0;
    goto LABEL_18;
  }
  [(AppleTypeCRetimerRestoreInfoHelperBackDeploy *)self log:@"Could not find build identity dictionary"];
  BOOL v25 = 0;
LABEL_21:

  return v25;
}

- (id)rtKitKeyFromBuildIdentityDict:(id)a3
{
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v3 = a3;
  id v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v12;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if (objc_msgSend(v8, "hasPrefix:", @"Timer,RTKitOS", (void)v11))
        {
          id v9 = v8;
          goto LABEL_11;
        }
      }
      id v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  id v9 = 0;
LABEL_11:

  return v9;
}

- (BOOL)createDestinationBundleFirmwareDirectoryFor:(id)a3 error:(id *)a4
{
  uint64_t v6 = +[NSURL fileURLWithPath:a3];
  id v7 = [(NSURL *)v6 URLByDeletingLastPathComponent];
  id v8 = +[NSFileManager defaultManager];
  id v9 = [(NSURL *)v7 path];
  unsigned __int8 v10 = [(NSFileManager *)v8 createDirectoryAtPath:v9 withIntermediateDirectories:1 attributes:0 error:a4];

  if ((v10 & 1) == 0)
  {
    long long v11 = [(NSURL *)v7 path];
    [(AppleTypeCRetimerRestoreInfoHelperBackDeploy *)self log:@"Failed to create destination bundle firmware directory at '%@' (%@)", v11, *a4];
  }
  return v10;
}

- (BOOL)copyFirmwareToDestinationBundleWithError:(id *)a3
{
  id v4 = *(NSURL **)((char *)&self->_firmwareBundleURL + 1);
  if (v4)
  {
    id v5 = [v4 path];
    uint64_t v6 = +[NSString stringWithFormat:@"%@/%@", v5, *(void *)(&self->super._verbose + 1)];

    id v7 = +[NSURL fileURLWithPath:v6];
    id v8 = +[NSFileManager defaultManager];
    id v9 = [(NSURL *)v7 URLByDeletingLastPathComponent];
    unsigned __int8 v10 = +[NSFileManager defaultManager];
    long long v11 = [(NSURL *)v9 path];
    id v33 = 0;
    unsigned __int8 v12 = [(NSFileManager *)v10 createDirectoryAtPath:v11 withIntermediateDirectories:1 attributes:0 error:&v33];
    id v13 = v33;

    if ((v12 & 1) == 0 && ([v13 isFileExistsError] & 1) == 0)
    {
      v23 = [(NSURL *)v9 path];
      [(AppleTypeCRetimerRestoreInfoHelperBackDeploy *)self log:@"Failed to create directory at '%@' (%@)", v23, v13];

      if (!a3)
      {
LABEL_21:
        BOOL v20 = 0;
        goto LABEL_22;
      }
      BOOL v20 = 0;
      *a3 = v13;
      goto LABEL_22;
    }
    long long v14 = [(NSURL *)v7 path];
    unsigned int v15 = [(NSFileManager *)v8 fileExistsAtPath:v14];

    if (v15)
    {
      id v32 = 0;
      unsigned __int8 v16 = [(NSFileManager *)v8 removeItemAtURL:v7 error:&v32];
      id v17 = v32;
      id v18 = v17;
      if ((v16 & 1) == 0)
      {
        v27 = [(NSURL *)v7 path];
        [(AppleTypeCRetimerRestoreInfoHelperBackDeploy *)self log:@"Failed to remove file at '%@' (%@)", v27, v18];
        goto LABEL_17;
      }
    }
    id v19 = *(NSURL **)((char *)&self->_destBundlePathURL + 1);
    if (v19)
    {
      BOOL v20 = 1;
      if (([v19 writeToURL:v7 atomically:1] & 1) == 0)
      {
        v21 = [(NSURL *)v7 path];
        [(AppleTypeCRetimerRestoreInfoHelperBackDeploy *)self log:@"Failed to write firmware file data to '%@'", v21];
        v22 = v21;
LABEL_20:

        goto LABEL_21;
      }
LABEL_22:

      return v20;
    }
    v24 = +[NSFileManager defaultManager];
    uint64_t v25 = *(uint64_t *)((char *)&self->_firmwarePathSuffix + 1);
    id v31 = 0;
    unsigned __int8 v26 = [(NSFileManager *)v24 copyItemAtURL:v25 toURL:v7 error:&v31];
    id v18 = v31;

    if (v26)
    {

      BOOL v20 = 1;
      goto LABEL_22;
    }
    v27 = (NSString *)[*(id *)((char *)&self->_firmwarePathSuffix + 1) path];
    id v28 = [(NSURL *)v7 path];
    [(AppleTypeCRetimerRestoreInfoHelperBackDeploy *)self log:@"Failed to copy firmware from '%@' to '%@' (%@)", v27, v28, v18];

LABEL_17:
    if (a3) {
      *a3 = v18;
    }
    v22 = (NSString *)v18;
    goto LABEL_20;
  }
  return 1;
}

- (id)readFirmwareFileDataWithError:(id *)a3
{
  id v4 = *(NSURL **)((char *)&self->_destBundlePathURL + 1);
  if (v4 || (id v4 = *(NSData **)((char *)&self->_firmwareOverrideData + 1)) != 0)
  {
    id v5 = v4;
  }
  else
  {
    uint64_t v8 = *(uint64_t *)((char *)&self->_firmwarePathSuffix + 1);
    id v11 = 0;
    id v5 = +[NSData dataWithContentsOfURL:v8 options:0 error:&v11];
    id v9 = v11;
    if (!v5)
    {
      id v10 = [*(id *)((char *)&self->_firmwarePathSuffix + 1) path];
      [(AppleTypeCRetimerRestoreInfoHelperBackDeploy *)self log:@"Failed to read firmware file at '%@' (%@)", v10, v9];

      if (a3) {
        *a3 = v9;
      }
    }
  }

  return v5;
}

- (id)description
{
  id v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  id v5 = +[NSMutableString stringWithFormat:@"%@:\n", v4];

  [(NSMutableString *)v5 appendFormat:@"\tFirmware path suffix: %@\n", *(void *)(&self->super._verbose + 1)];
  id v6 = [*(id *)((char *)&self->_firmwarePathSuffix + 1) path];
  [(NSMutableString *)v5 appendFormat:@"\tFirmware bundle path: %@\n", v6];

  id v7 = *(NSURL **)((char *)&self->_firmwareBundleURL + 1);
  if (v7)
  {
    id v8 = [v7 path];
    [(NSMutableString *)v5 appendFormat:@"\tDestination Bundle Path: %@\n", v8];
  }
  id v9 = +[NSString stringWithString:v5];

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)((char *)&self->_firmwareOverrideData + 1), 0);
  objc_storeStrong((id *)((char *)&self->_destBundlePathURL + 1), 0);
  objc_storeStrong((id *)((char *)&self->_firmwareBundleURL + 1), 0);
  objc_storeStrong((id *)((char *)&self->_firmwarePathSuffix + 1), 0);

  objc_storeStrong((id *)(&self->super._verbose + 1), 0);
}

@end
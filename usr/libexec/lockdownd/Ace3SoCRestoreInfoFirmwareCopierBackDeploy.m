@interface Ace3SoCRestoreInfoFirmwareCopierBackDeploy
- (Ace3SoCRestoreInfoFirmwareCopierBackDeploy)initWithOptions:(id)a3 logFunction:(void *)a4 logContext:(void *)a5;
- (BOOL)copyFirmwareToDestinationBundleWithError:(id *)a3;
- (BOOL)parseOptions:(id)a3;
- (id)firmwareKeyFromBuildIdentityDict:(id)a3 deviceInfo:(id)a4;
- (id)readFirmwareFileDataWithError:(id *)a3;
@end

@implementation Ace3SoCRestoreInfoFirmwareCopierBackDeploy

- (Ace3SoCRestoreInfoFirmwareCopierBackDeploy)initWithOptions:(id)a3 logFunction:(void *)a4 logContext:(void *)a5
{
  id v8 = a3;
  v13.receiver = self;
  v13.super_class = (Class)Ace3SoCRestoreInfoFirmwareCopierBackDeploy;
  v9 = [(Ace3SoCRestoreInfoHelperBackDeploy *)&v13 initWithOptions:v8 logFunction:a4 logContext:a5];
  v10 = v9;
  if (v9
    && (-[Ace3SoCRestoreInfoHelperBackDeploy verboseLog:](v9, "verboseLog:", @"%s: input options: %@", "-[Ace3SoCRestoreInfoFirmwareCopierBackDeploy initWithOptions:logFunction:logContext:]", v8), ![(Ace3SoCRestoreInfoFirmwareCopierBackDeploy *)v10 parseOptions:v8]))
  {
    v11 = 0;
  }
  else
  {
    v11 = v10;
  }

  return v11;
}

- (id)firmwareKeyFromBuildIdentityDict:(id)a3 deviceInfo:(id)a4
{
  return 0;
}

- (BOOL)parseOptions:(id)a3
{
  id v4 = a3;
  v5 = [v4 objectForKeyedSubscript:@"BuildIdentity"];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"DeviceInfo"];
    if (!v6) {
      [(Ace3SoCRestoreInfoHelperBackDeploy *)self log:@"Warning: Could not find device info dictionary"];
    }
    if ([v5 count])
    {
      uint64_t v7 = [(Ace3SoCRestoreInfoFirmwareCopierBackDeploy *)self firmwareKeyFromBuildIdentityDict:v5 deviceInfo:v6];
      if (!v7)
      {
        [(Ace3SoCRestoreInfoHelperBackDeploy *)self log:@"Could not find firmware key in build identity dictionary"];
LABEL_26:
        BOOL v16 = 0;
        goto LABEL_27;
      }
      id v8 = (void *)v7;
      v9 = [v5 objectForKeyedSubscript:v7];
      v10 = [v9 objectForKeyedSubscript:@"Info"];
      if (v10)
      {
        v11 = v10;
        v12 = [v10 objectForKeyedSubscript:@"Path"];
        objc_super v13 = v12;
        if (v12)
        {
          v14 = (NSURL *)[v12 copy];
          v15 = *(NSURL **)((char *)&self->_destBundlePathURL + 1);
          *(NSURL **)((char *)&self->_destBundlePathURL + 1) = v14;

LABEL_11:
          v17 = [v4 objectForKeyedSubscript:@"FirmwareData"];
          v18 = *(NSURL **)((char *)&self->_firmwareBundleURL + 1);
          *(NSURL **)((char *)&self->_firmwareBundleURL + 1) = v17;

          uint64_t v19 = *(uint64_t *)((char *)&self->_firmwareBundleURL + 1);
          if (v19)
          {
            [(Ace3SoCRestoreInfoHelperBackDeploy *)self log:@"Detected firmware override"];
            uint64_t v19 = *(uint64_t *)((char *)&self->_firmwareBundleURL + 1);
          }
          if (!v19 && v8)
          {
            v20 = [v4 objectForKeyedSubscript:@"BundleDataDict"];
            v21 = v20;
            if (v20)
            {
              v22 = [v20 objectForKeyedSubscript:v8];
              v23 = *(NSData **)((char *)&self->_firmwareOverrideData + 1);
              *(NSData **)((char *)&self->_firmwareOverrideData + 1) = v22;

              [(Ace3SoCRestoreInfoHelperBackDeploy *)self log:@"Attempt to use '%@' firmware from BundleDataDict: %@", v8, *(NSData **)((char *)&self->_firmwareOverrideData + 1)];
            }

            uint64_t v19 = *(uint64_t *)((char *)&self->_firmwareBundleURL + 1);
          }
          if (v19 || *(NSData **)((char *)&self->_firmwareOverrideData + 1)) {
            goto LABEL_20;
          }
          if (*(NSURL **)((char *)&self->_destBundlePathURL + 1))
          {
            v27 = [v4 objectForKeyedSubscript:@"BundlePath"];
            if (v27)
            {
              v28 = v27;
              v29 = [v27 URLByAppendingPathComponent:*(NSURL **)((char *)&self->_destBundlePathURL + 1)];
              v30 = *(NSString **)((char *)&self->_firmwarePathSuffix + 1);
              *(NSString **)((char *)&self->_firmwarePathSuffix + 1) = v29;

LABEL_20:
              uint64_t v24 = [v4 objectForKeyedSubscript:@"DestBundlePath"];
              v25 = *(void **)(&self->super._verbose + 1);
              *(void *)(&self->super._verbose + 1) = v24;

              BOOL v16 = 1;
LABEL_27:

              goto LABEL_28;
            }
            CFStringRef v31 = @"Could not find bundle path";
          }
          else
          {
            CFStringRef v31 = @"Firmware override must be specified if build identity dictionary is empty";
          }
          [(Ace3SoCRestoreInfoHelperBackDeploy *)self log:v31];
          goto LABEL_25;
        }
        [(Ace3SoCRestoreInfoHelperBackDeploy *)self log:@"Could not find firmware path"];
      }
      else
      {
        [(Ace3SoCRestoreInfoHelperBackDeploy *)self log:@"Could not find firmware info dictionary"];
      }

LABEL_25:
      goto LABEL_26;
    }
    [(Ace3SoCRestoreInfoHelperBackDeploy *)self log:@"Detected empty build identity dictionary"];
    id v8 = 0;
    goto LABEL_11;
  }
  [(Ace3SoCRestoreInfoHelperBackDeploy *)self log:@"Could not find build identity dictionary"];
  BOOL v16 = 0;
LABEL_28:

  return v16;
}

- (BOOL)copyFirmwareToDestinationBundleWithError:(id *)a3
{
  id v4 = *(void **)(&self->super._verbose + 1);
  if (v4 && *(NSURL **)((char *)&self->_destBundlePathURL + 1))
  {
    v6 = [v4 path];
    uint64_t v7 = +[NSString stringWithFormat:@"%@/%@", v6, *(NSURL **)((char *)&self->_destBundlePathURL + 1)];

    id v8 = +[NSURL fileURLWithPath:v7];
    v9 = +[NSFileManager defaultManager];
    v10 = [v8 URLByDeletingLastPathComponent];
    v11 = +[NSFileManager defaultManager];
    v12 = [v10 path];
    id v32 = 0;
    unsigned __int8 v13 = [v11 createDirectoryAtPath:v12 withIntermediateDirectories:1 attributes:0 error:&v32];
    id v14 = v32;

    if ((v13 & 1) == 0 && ([v14 isFileExistsError] & 1) == 0)
    {
      v23 = [v10 path];
      [(Ace3SoCRestoreInfoHelperBackDeploy *)self log:@"Failed to create directory at '%@' (%@)", v23, v14];

      if (a3)
      {
        BOOL v21 = 0;
        *a3 = v14;
LABEL_22:

        return v21;
      }
LABEL_21:
      BOOL v21 = 0;
      goto LABEL_22;
    }
    v15 = [v8 path];
    unsigned int v16 = [v9 fileExistsAtPath:v15];

    if (v16)
    {
      id v31 = 0;
      unsigned __int8 v17 = [v9 removeItemAtURL:v8 error:&v31];
      id v18 = v31;
      id v19 = v18;
      if ((v17 & 1) == 0)
      {
        v27 = [v8 path];
        [(Ace3SoCRestoreInfoHelperBackDeploy *)self log:@"Failed to remove file at '%@' (%@)", v27, v19];
LABEL_18:

        if (a3) {
          *a3 = v19;
        }

        goto LABEL_21;
      }
    }
    v20 = *(NSURL **)((char *)&self->_firmwareBundleURL + 1);
    if (v20)
    {
      BOOL v21 = 1;
      if (([v20 writeToURL:v8 atomically:1] & 1) == 0)
      {
        v22 = [v8 path];
        [(Ace3SoCRestoreInfoHelperBackDeploy *)self log:@"Failed to write firmware file data to '%@'", v22];

        BOOL v21 = 0;
      }
      goto LABEL_22;
    }
    uint64_t v24 = +[NSFileManager defaultManager];
    uint64_t v25 = *(uint64_t *)((char *)&self->_firmwarePathSuffix + 1);
    id v30 = 0;
    unsigned __int8 v26 = [v24 copyItemAtURL:v25 toURL:v8 error:&v30];
    id v19 = v30;

    if (v26)
    {

      BOOL v21 = 1;
      goto LABEL_22;
    }
    v27 = [*(id *)((char *)&self->_firmwarePathSuffix + 1) path];
    v28 = [v8 path];
    [(Ace3SoCRestoreInfoHelperBackDeploy *)self log:@"Failed to copy firmware from '%@' to '%@' (%@)", v27, v28, v19];

    goto LABEL_18;
  }
  [(Ace3SoCRestoreInfoHelperBackDeploy *)self log:@"Not copying firmware to destination bundle"];
  return 1;
}

- (id)readFirmwareFileDataWithError:(id *)a3
{
  v3 = *(NSURL **)((char *)&self->_firmwareBundleURL + 1);
  if (v3 || (v3 = *(NSData **)((char *)&self->_firmwareOverrideData + 1)) != 0)
  {
    id v5 = v3;
  }
  else
  {
    uint64_t v8 = *(uint64_t *)((char *)&self->_firmwarePathSuffix + 1);
    id v11 = 0;
    id v5 = +[NSData dataWithContentsOfURL:v8 options:0 error:&v11];
    id v9 = v11;
    if (!v5)
    {
      v10 = [*(id *)((char *)&self->_firmwarePathSuffix + 1) path];
      [(Ace3SoCRestoreInfoHelperBackDeploy *)self log:@"Failed to read firmware file at '%@' (%@)", v10, v9];

      if (a3) {
        *a3 = v9;
      }
    }
  }

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)((char *)&self->_firmwareOverrideData + 1), 0);
  objc_storeStrong((id *)((char *)&self->_firmwareBundleURL + 1), 0);
  objc_storeStrong((id *)((char *)&self->_firmwarePathSuffix + 1), 0);
  objc_storeStrong((id *)((char *)&self->_destBundlePathURL + 1), 0);

  objc_storeStrong((id *)(&self->super._verbose + 1), 0);
}

@end
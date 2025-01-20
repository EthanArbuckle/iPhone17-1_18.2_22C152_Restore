@interface Ace3SoCRestoreInfoFirmwareCopierOS
- (Ace3SoCRestoreInfoFirmwareCopierOS)initWithOptions:(id)a3 logFunction:(void *)a4 logContext:(void *)a5;
- (BOOL)copyFirmwareToDestinationBundleWithError:(id *)a3;
- (BOOL)parseOptions:(id)a3;
- (id)firmwareKeyFromBuildIdentityDict:(id)a3 deviceInfo:(id)a4;
- (id)readFirmwareFileDataWithError:(id *)a3;
@end

@implementation Ace3SoCRestoreInfoFirmwareCopierOS

- (Ace3SoCRestoreInfoFirmwareCopierOS)initWithOptions:(id)a3 logFunction:(void *)a4 logContext:(void *)a5
{
  id v8 = a3;
  v13.receiver = self;
  v13.super_class = (Class)Ace3SoCRestoreInfoFirmwareCopierOS;
  v9 = [(Ace3SoCRestoreInfoHelperOS *)&v13 initWithOptions:v8 logFunction:a4 logContext:a5];
  v10 = v9;
  if (v9
    && (-[Ace3SoCRestoreInfoHelperOS verboseLog:](v9, "verboseLog:", @"%s: input options: %@", "-[Ace3SoCRestoreInfoFirmwareCopierOS initWithOptions:logFunction:logContext:]", v8), ![(Ace3SoCRestoreInfoFirmwareCopierOS *)v10 parseOptions:v8]))
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
      [(Ace3SoCRestoreInfoHelperOS *)self log:@"Warning: Could not find device info dictionary"];
    }
    if ([v5 count])
    {
      uint64_t v7 = [(Ace3SoCRestoreInfoFirmwareCopierOS *)self firmwareKeyFromBuildIdentityDict:v5 deviceInfo:v6];
      if (!v7)
      {
        [(Ace3SoCRestoreInfoHelperOS *)self log:@"Could not find firmware key in build identity dictionary"];
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
          v14 = (NSString *)[v12 copy];
          firmwarePathSuffix = self->_firmwarePathSuffix;
          self->_firmwarePathSuffix = v14;

LABEL_11:
          v17 = [v4 objectForKeyedSubscript:@"FirmwareData"];
          firmwareOverrideData = self->_firmwareOverrideData;
          self->_firmwareOverrideData = v17;

          v19 = self->_firmwareOverrideData;
          if (v19)
          {
            [(Ace3SoCRestoreInfoHelperOS *)self log:@"Detected firmware override"];
            v19 = self->_firmwareOverrideData;
          }
          if (!v19 && v8)
          {
            v20 = [v4 objectForKeyedSubscript:@"BundleDataDict"];
            v21 = v20;
            if (v20)
            {
              v22 = [v20 objectForKeyedSubscript:v8];
              firmwareInBundleDataDict = self->_firmwareInBundleDataDict;
              self->_firmwareInBundleDataDict = v22;

              [(Ace3SoCRestoreInfoHelperOS *)self log:@"Attempt to use '%@' firmware from BundleDataDict: %@", v8, self->_firmwareInBundleDataDict];
            }

            v19 = self->_firmwareOverrideData;
          }
          if (v19 || self->_firmwareInBundleDataDict) {
            goto LABEL_20;
          }
          if (self->_firmwarePathSuffix)
          {
            v27 = [v4 objectForKeyedSubscript:@"BundlePath"];
            if (v27)
            {
              v28 = v27;
              v29 = [v27 URLByAppendingPathComponent:self->_firmwarePathSuffix];
              firmwareBundleURL = self->_firmwareBundleURL;
              self->_firmwareBundleURL = v29;

LABEL_20:
              v24 = [v4 objectForKeyedSubscript:@"DestBundlePath"];
              destBundlePathURL = self->_destBundlePathURL;
              self->_destBundlePathURL = v24;

              BOOL v16 = 1;
LABEL_27:

              goto LABEL_28;
            }
            v31 = @"Could not find bundle path";
          }
          else
          {
            v31 = @"Firmware override must be specified if build identity dictionary is empty";
          }
          [(Ace3SoCRestoreInfoHelperOS *)self log:v31];
          goto LABEL_25;
        }
        [(Ace3SoCRestoreInfoHelperOS *)self log:@"Could not find firmware path"];
      }
      else
      {
        [(Ace3SoCRestoreInfoHelperOS *)self log:@"Could not find firmware info dictionary"];
      }

LABEL_25:
      goto LABEL_26;
    }
    [(Ace3SoCRestoreInfoHelperOS *)self log:@"Detected empty build identity dictionary"];
    id v8 = 0;
    goto LABEL_11;
  }
  [(Ace3SoCRestoreInfoHelperOS *)self log:@"Could not find build identity dictionary"];
  BOOL v16 = 0;
LABEL_28:

  return v16;
}

- (BOOL)copyFirmwareToDestinationBundleWithError:(id *)a3
{
  destBundlePathURL = self->_destBundlePathURL;
  if (destBundlePathURL && self->_firmwarePathSuffix)
  {
    v6 = NSString;
    uint64_t v7 = [(NSURL *)destBundlePathURL path];
    id v8 = [v6 stringWithFormat:@"%@/%@", v7, self->_firmwarePathSuffix];

    v9 = [NSURL fileURLWithPath:v8];
    v10 = [MEMORY[0x263F08850] defaultManager];
    v11 = [v9 URLByDeletingLastPathComponent];
    v12 = [MEMORY[0x263F08850] defaultManager];
    objc_super v13 = [v11 path];
    id v33 = 0;
    char v14 = [v12 createDirectoryAtPath:v13 withIntermediateDirectories:1 attributes:0 error:&v33];
    id v15 = v33;

    if ((v14 & 1) == 0 && ([v15 isFileExistsError] & 1) == 0)
    {
      v24 = [v11 path];
      [(Ace3SoCRestoreInfoHelperOS *)self log:@"Failed to create directory at '%@' (%@)", v24, v15];

      if (a3)
      {
        BOOL v22 = 0;
        *a3 = v15;
LABEL_22:

        return v22;
      }
LABEL_21:
      BOOL v22 = 0;
      goto LABEL_22;
    }
    BOOL v16 = [v9 path];
    int v17 = [v10 fileExistsAtPath:v16];

    if (v17)
    {
      id v32 = 0;
      char v18 = [v10 removeItemAtURL:v9 error:&v32];
      id v19 = v32;
      id v20 = v19;
      if ((v18 & 1) == 0)
      {
        v28 = [v9 path];
        [(Ace3SoCRestoreInfoHelperOS *)self log:@"Failed to remove file at '%@' (%@)", v28, v20];
LABEL_18:

        if (a3) {
          *a3 = v20;
        }

        goto LABEL_21;
      }
    }
    firmwareOverrideData = self->_firmwareOverrideData;
    if (firmwareOverrideData)
    {
      BOOL v22 = 1;
      if (![(NSData *)firmwareOverrideData writeToURL:v9 atomically:1])
      {
        v23 = [v9 path];
        [(Ace3SoCRestoreInfoHelperOS *)self log:@"Failed to write firmware file data to '%@'", v23];

        BOOL v22 = 0;
      }
      goto LABEL_22;
    }
    v25 = [MEMORY[0x263F08850] defaultManager];
    firmwareBundleURL = self->_firmwareBundleURL;
    id v31 = 0;
    char v27 = [v25 copyItemAtURL:firmwareBundleURL toURL:v9 error:&v31];
    id v20 = v31;

    if (v27)
    {

      BOOL v22 = 1;
      goto LABEL_22;
    }
    v28 = [(NSURL *)self->_firmwareBundleURL path];
    v29 = [v9 path];
    [(Ace3SoCRestoreInfoHelperOS *)self log:@"Failed to copy firmware from '%@' to '%@' (%@)", v28, v29, v20];

    goto LABEL_18;
  }
  [(Ace3SoCRestoreInfoHelperOS *)self log:@"Not copying firmware to destination bundle"];
  return 1;
}

- (id)readFirmwareFileDataWithError:(id *)a3
{
  firmwareOverrideData = self->_firmwareOverrideData;
  if (firmwareOverrideData || (firmwareOverrideData = self->_firmwareInBundleDataDict) != 0)
  {
    v5 = firmwareOverrideData;
  }
  else
  {
    firmwareBundleURL = self->_firmwareBundleURL;
    id v11 = 0;
    v5 = [MEMORY[0x263EFF8F8] dataWithContentsOfURL:firmwareBundleURL options:0 error:&v11];
    id v9 = v11;
    if (!v5)
    {
      v10 = [(NSURL *)self->_firmwareBundleURL path];
      [(Ace3SoCRestoreInfoHelperOS *)self log:@"Failed to read firmware file at '%@' (%@)", v10, v9];

      if (a3) {
        *a3 = v9;
      }
    }
  }

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_firmwareInBundleDataDict, 0);
  objc_storeStrong((id *)&self->_firmwareOverrideData, 0);
  objc_storeStrong((id *)&self->_firmwareBundleURL, 0);
  objc_storeStrong((id *)&self->_firmwarePathSuffix, 0);

  objc_storeStrong((id *)&self->_destBundlePathURL, 0);
}

@end
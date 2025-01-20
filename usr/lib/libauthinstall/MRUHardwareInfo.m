@interface MRUHardwareInfo
- (BOOL)productionStatus;
- (BOOL)securityMode;
- (MRUHardwareInfo)initWithChipID:(unsigned int)a3 chipRev:(unsigned int)a4 boardID:(unsigned int)a5 securityEpoch:(unsigned int)a6 productionStatus:(BOOL)a7 securityMode:(BOOL)a8 securityDomain:(unsigned int)a9 ecid:(unint64_t)a10;
- (MRUHardwareInfo)initWithCoder:(id)a3;
- (MRUHardwareInfo)initWithOptions:(id)a3 error:(id *)a4;
- (NSDictionary)asDictionary;
- (id)description;
- (unint64_t)ecid;
- (unsigned)boardID;
- (unsigned)chipID;
- (unsigned)chipRev;
- (unsigned)securityDomain;
- (unsigned)securityEpoch;
- (void)encodeWithCoder:(id)a3;
@end

@implementation MRUHardwareInfo

- (MRUHardwareInfo)initWithChipID:(unsigned int)a3 chipRev:(unsigned int)a4 boardID:(unsigned int)a5 securityEpoch:(unsigned int)a6 productionStatus:(BOOL)a7 securityMode:(BOOL)a8 securityDomain:(unsigned int)a9 ecid:(unint64_t)a10
{
  v17.receiver = self;
  v17.super_class = (Class)MRUHardwareInfo;
  result = [(MRUHardwareInfo *)&v17 init];
  if (result)
  {
    result->_chipID = a3;
    result->_chipRev = a4;
    result->_boardID = a5;
    result->_securityEpoch = a6;
    result->_productionStatus = a7;
    result->_securityMode = a8;
    result->_securityDomain = a9;
    result->_ecid = a10;
  }
  return result;
}

- (MRUHardwareInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)MRUHardwareInfo;
  v5 = [(MRUHardwareInfo *)&v24 init];
  if (!v5) {
    goto LABEL_25;
  }
  v6 = [v4 decodeObjectForKey:@"chipID"];
  v7 = v6;
  if (v6)
  {
    v5->_chipID = [(MRUHardwareInfo *)v6 unsignedIntValue];
    v8 = [v4 decodeObjectForKey:@"chipRev"];
    if (!v8)
    {

LABEL_24:
      v7 = 0;
      goto LABEL_26;
    }
    v9 = v8;
    v5->_chipRev = [v8 unsignedIntValue];
    v10 = [v4 decodeObjectForKey:@"boardID"];
    v11 = v10;
    if (v10)
    {
      v5->_boardID = [v10 unsignedIntValue];
      v12 = [v4 decodeObjectForKey:@"securityEpoch"];
      v13 = v12;
      if (v12)
      {
        v5->_securityEpoch = [v12 unsignedIntValue];
        v14 = [v4 decodeObjectForKey:@"productionStatus"];
        v15 = v14;
        if (v14)
        {
          v5->_productionStatus = [v14 unsignedIntValue] != 0;
          v16 = [v4 decodeObjectForKey:@"securityMode"];
          objc_super v17 = v16;
          if (v16)
          {
            v5->_securityMode = [v16 unsignedIntValue] != 0;
            v18 = [v4 decodeObjectForKey:@"securityDomain"];
            v19 = v18;
            if (v18)
            {
              v5->_securityDomain = [v18 unsignedIntValue];
              v20 = [v4 decodeObjectForKey:@"ecid"];
              if (v20)
              {
                v23 = v20;
                int v21 = 0;
                v5->_ecid = [v20 unsignedLongLongValue];
                v20 = v23;
              }
              else
              {
                int v21 = 1;
              }
            }
            else
            {
              int v21 = 1;
            }
          }
          else
          {
            int v21 = 1;
          }
        }
        else
        {
          int v21 = 1;
        }
      }
      else
      {
        int v21 = 1;
      }
    }
    else
    {
      int v21 = 1;
    }

    if (v21) {
      goto LABEL_24;
    }
LABEL_25:
    v7 = v5;
  }
LABEL_26:

  return v7;
}

- (MRUHardwareInfo)initWithOptions:(id)a3 error:(id *)a4
{
  v65[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  v49.receiver = self;
  v49.super_class = (Class)MRUHardwareInfo;
  v7 = [(MRUHardwareInfo *)&v49 init];
  if (!v7) {
    goto LABEL_39;
  }
  v8 = [v6 objectForKeyedSubscript:@"chipID"];
  if (!v8)
  {
    if (*a4)
    {
      v25 = (void *)MEMORY[0x263F087E8];
      uint64_t v64 = *MEMORY[0x263F08320];
      v26 = [NSString stringWithFormat:@"No chipID in options dict"];
      v65[0] = v26;
      v27 = [NSDictionary dictionaryWithObjects:v65 forKeys:&v64 count:1];
      *a4 = [v25 errorWithDomain:@"com.apple.Manta.MantaRestoreUtils" code:1 userInfo:v27];
    }
    goto LABEL_38;
  }
  v9 = v8;
  v7->_chipID = [v8 unsignedIntValue];
  v10 = [v6 objectForKeyedSubscript:@"bundlePath"];
  if (!v10)
  {
    if (*a4)
    {
      v28 = (void *)MEMORY[0x263F087E8];
      uint64_t v62 = *MEMORY[0x263F08320];
      v29 = [NSString stringWithFormat:@"No chipRev in options dict"];
      v63 = v29;
      v30 = [NSDictionary dictionaryWithObjects:&v63 forKeys:&v62 count:1];
      *a4 = [v28 errorWithDomain:@"com.apple.Manta.MantaRestoreUtils" code:1 userInfo:v30];
    }
    goto LABEL_38;
  }
  v11 = v10;
  v7->_chipRev = [v10 unsignedIntValue];
  v12 = [v6 objectForKeyedSubscript:@"boardID"];
  v13 = v12;
  if (!v12)
  {
    if (!*a4)
    {
      int v24 = 1;
      goto LABEL_37;
    }
    v31 = (void *)MEMORY[0x263F087E8];
    uint64_t v60 = *MEMORY[0x263F08320];
    v15 = [NSString stringWithFormat:@"No boardID in options dict"];
    v61 = v15;
    int v24 = 1;
    uint64_t v32 = [NSDictionary dictionaryWithObjects:&v61 forKeys:&v60 count:1];
    v33 = v31;
    objc_super v17 = (void *)v32;
    *a4 = [v33 errorWithDomain:@"com.apple.Manta.MantaRestoreUtils" code:1 userInfo:v32];
    goto LABEL_35;
  }
  v7->_boardID = [v12 unsignedIntValue];
  v14 = [v6 objectForKeyedSubscript:@"securityEpoch"];
  v15 = v14;
  if (v14)
  {
    v7->_securityEpoch = [v14 unsignedIntValue];
    v16 = [v6 objectForKeyedSubscript:@"productionStatus"];
    objc_super v17 = v16;
    if (!v16)
    {
      if (!*a4)
      {
        int v24 = 1;
LABEL_35:

        goto LABEL_36;
      }
      id v46 = (id)MEMORY[0x263F087E8];
      uint64_t v56 = *MEMORY[0x263F08320];
      uint64_t v48 = [NSString stringWithFormat:@"No productionStatus in options dict"];
      uint64_t v57 = v48;
      int v21 = [NSDictionary dictionaryWithObjects:&v57 forKeys:&v56 count:1];
      objc_super v17 = 0;
      *a4 = [v46 errorWithDomain:@"com.apple.Manta.MantaRestoreUtils" code:1 userInfo:v21];
      int v24 = 1;
      goto LABEL_33;
    }
    v7->_productionStatus = [v16 BOOLValue];
    v18 = [v6 objectForKeyedSubscript:@"securityMode"];
    v19 = v18;
    if (v18)
    {
      uint64_t v48 = (uint64_t)v18;
      v7->_securityMode = [v18 BOOLValue];
      v20 = [v6 objectForKeyedSubscript:@"securityDomain"];
      int v21 = v20;
      if (v20)
      {
        v7->_securityDomain = [v20 unsignedIntValue];
        v22 = [v6 objectForKeyedSubscript:@"ecid"];
        if (v22)
        {
          v23 = v22;
          int v24 = 0;
          v7->_ecid = [v22 unsignedLongLongValue];
          v22 = v23;
LABEL_32:

LABEL_33:
          v19 = (void *)v48;
          goto LABEL_34;
        }
        if (!*a4)
        {
          int v24 = 1;
          goto LABEL_32;
        }
        v42 = (void *)MEMORY[0x263F087E8];
        uint64_t v50 = *MEMORY[0x263F08320];
        v45 = [NSString stringWithFormat:@"No ecid in options dict"];
        v51 = v45;
        [NSDictionary dictionaryWithObjects:&v51 forKeys:&v50 count:1];
        v39 = v38 = v17;
        *a4 = [v42 errorWithDomain:@"com.apple.Manta.MantaRestoreUtils" code:1 userInfo:v39];

        objc_super v17 = v38;
        v22 = 0;
      }
      else
      {
        if (!*a4)
        {
          int v24 = 1;
          goto LABEL_33;
        }
        v44 = (void *)MEMORY[0x263F087E8];
        uint64_t v52 = *MEMORY[0x263F08320];
        uint64_t v36 = [NSString stringWithFormat:@"No securityDomain in options dict"];
        uint64_t v53 = v36;
        [NSDictionary dictionaryWithObjects:&v53 forKeys:&v52 count:1];
        v37 = id v47 = v17;
        *a4 = [v44 errorWithDomain:@"com.apple.Manta.MantaRestoreUtils" code:1 userInfo:v37];

        v22 = (void *)v36;
        objc_super v17 = v47;
      }
    }
    else
    {
      if (!*a4)
      {
        int v24 = 1;
        goto LABEL_34;
      }
      uint64_t v48 = 0;
      v43 = (void *)MEMORY[0x263F087E8];
      uint64_t v54 = *MEMORY[0x263F08320];
      int v21 = [NSString stringWithFormat:@"No securityMode in options dict"];
      v55 = v21;
      uint64_t v35 = [NSDictionary dictionaryWithObjects:&v55 forKeys:&v54 count:1];
      *a4 = [v43 errorWithDomain:@"com.apple.Manta.MantaRestoreUtils" code:1 userInfo:v35];
      v22 = (void *)v35;
    }
    int v24 = 1;
    goto LABEL_32;
  }
  if (*a4)
  {
    v34 = (void *)MEMORY[0x263F087E8];
    uint64_t v58 = *MEMORY[0x263F08320];
    objc_super v17 = [NSString stringWithFormat:@"No securityEpoch in options dict"];
    v59 = v17;
    v19 = [NSDictionary dictionaryWithObjects:&v59 forKeys:&v58 count:1];
    *a4 = [v34 errorWithDomain:@"com.apple.Manta.MantaRestoreUtils" code:1 userInfo:v19];
    int v24 = 1;
LABEL_34:

    goto LABEL_35;
  }
  int v24 = 1;
LABEL_36:

LABEL_37:
  if (!v24)
  {
LABEL_39:
    v40 = v7;
    goto LABEL_40;
  }
LABEL_38:
  v40 = 0;
LABEL_40:

  return v40;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = NSNumber;
  uint64_t chipID = self->_chipID;
  id v6 = a3;
  v7 = [v4 numberWithUnsignedInt:chipID];
  [v6 encodeObject:v7 forKey:@"chipID"];

  v8 = [NSNumber numberWithUnsignedInt:self->_chipRev];
  [v6 encodeObject:v8 forKey:@"chipRev"];

  v9 = [NSNumber numberWithUnsignedInt:self->_boardID];
  [v6 encodeObject:v9 forKey:@"boardID"];

  v10 = [NSNumber numberWithUnsignedInt:self->_securityEpoch];
  [v6 encodeObject:v10 forKey:@"securityEpoch"];

  v11 = [NSNumber numberWithBool:self->_productionStatus];
  [v6 encodeObject:v11 forKey:@"productionStatus"];

  v12 = [NSNumber numberWithBool:self->_securityMode];
  [v6 encodeObject:v12 forKey:@"securityMode"];

  v13 = [NSNumber numberWithUnsignedInt:self->_securityDomain];
  [v6 encodeObject:v13 forKey:@"securityDomain"];

  id v14 = [NSNumber numberWithUnsignedLongLong:self->_ecid];
  [v6 encodeObject:v14 forKey:@"ecid"];
}

- (NSDictionary)asDictionary
{
  v14[8] = *MEMORY[0x263EF8340];
  v13[0] = @"chipID";
  v3 = [NSNumber numberWithUnsignedInt:self->_chipID];
  v14[0] = v3;
  v13[1] = @"bundlePath";
  id v4 = [NSNumber numberWithUnsignedInt:self->_chipRev];
  v14[1] = v4;
  v13[2] = @"boardID";
  v5 = [NSNumber numberWithUnsignedInt:self->_boardID];
  v14[2] = v5;
  v13[3] = @"securityEpoch";
  id v6 = [NSNumber numberWithUnsignedInt:self->_securityEpoch];
  v14[3] = v6;
  v13[4] = @"productionStatus";
  v7 = [NSNumber numberWithBool:self->_productionStatus];
  v14[4] = v7;
  v13[5] = @"securityMode";
  v8 = [NSNumber numberWithBool:self->_securityMode];
  v14[5] = v8;
  v13[6] = @"securityDomain";
  v9 = [NSNumber numberWithUnsignedInt:self->_securityDomain];
  v14[6] = v9;
  v13[7] = @"ecid";
  v10 = [NSNumber numberWithUnsignedLongLong:self->_ecid];
  v14[7] = v10;
  v11 = [NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:8];

  return (NSDictionary *)v11;
}

- (id)description
{
  v3 = (void *)MEMORY[0x263F089D8];
  id v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  id v6 = [v3 stringWithFormat:@"%@(\n", v5];

  [v6 appendFormat:@"\tchipID: %u\n", self->_chipID];
  [v6 appendFormat:@"\tchipRev: %u\n", self->_chipRev];
  [v6 appendFormat:@"\tboardID: %u\n", self->_boardID];
  [v6 appendFormat:@"\tsecurityEpoch: %u\n", self->_securityEpoch];
  [v6 appendFormat:@"\tproductionStatus: %u\n", self->_productionStatus];
  [v6 appendFormat:@"\tsecurityMode: %u\n", self->_securityMode];
  [v6 appendFormat:@"\tsecurityDomain: %u\n", self->_securityDomain];
  [v6 appendFormat:@"\tecid: %llu\n", self->_ecid];
  [v6 appendString:@""]);
  v7 = [NSString stringWithString:v6];

  return v7;
}

- (unsigned)chipID
{
  return self->_chipID;
}

- (unsigned)chipRev
{
  return self->_chipRev;
}

- (unsigned)boardID
{
  return self->_boardID;
}

- (unsigned)securityEpoch
{
  return self->_securityEpoch;
}

- (BOOL)productionStatus
{
  return self->_productionStatus;
}

- (BOOL)securityMode
{
  return self->_securityMode;
}

- (unsigned)securityDomain
{
  return self->_securityDomain;
}

- (unint64_t)ecid
{
  return self->_ecid;
}

@end
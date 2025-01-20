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
                v5->_ecid = (unint64_t)[v20 unsignedLongLongValue];
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
  id v6 = a3;
  v39.receiver = self;
  v39.super_class = (Class)MRUHardwareInfo;
  v7 = [(MRUHardwareInfo *)&v39 init];
  if (!v7) {
    goto LABEL_39;
  }
  v8 = [v6 objectForKeyedSubscript:@"chipID"];
  if (!v8)
  {
    if (*a4)
    {
      NSErrorUserInfoKey v54 = NSLocalizedDescriptionKey;
      v25 = +[NSString stringWithFormat:@"No chipID in options dict"];
      v55 = v25;
      v26 = +[NSDictionary dictionaryWithObjects:&v55 forKeys:&v54 count:1];
      *a4 = +[NSError errorWithDomain:@"com.apple.Manta.MantaRestoreUtils" code:1 userInfo:v26];
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
      NSErrorUserInfoKey v52 = NSLocalizedDescriptionKey;
      v27 = +[NSString stringWithFormat:@"No chipRev in options dict"];
      v53 = v27;
      v28 = +[NSDictionary dictionaryWithObjects:&v53 forKeys:&v52 count:1];
      *a4 = +[NSError errorWithDomain:@"com.apple.Manta.MantaRestoreUtils" code:1 userInfo:v28];
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
    NSErrorUserInfoKey v50 = NSLocalizedDescriptionKey;
    v15 = +[NSString stringWithFormat:@"No boardID in options dict"];
    v51 = v15;
    int v24 = 1;
    objc_super v17 = +[NSDictionary dictionaryWithObjects:&v51 forKeys:&v50 count:1];
    *a4 = +[NSError errorWithDomain:@"com.apple.Manta.MantaRestoreUtils" code:1 userInfo:v17];
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
      NSErrorUserInfoKey v46 = NSLocalizedDescriptionKey;
      uint64_t v38 = +[NSString stringWithFormat:@"No productionStatus in options dict"];
      uint64_t v47 = v38;
      int v21 = +[NSDictionary dictionaryWithObjects:&v47 forKeys:&v46 count:1];
      objc_super v17 = 0;
      *a4 = +[NSError errorWithDomain:@"com.apple.Manta.MantaRestoreUtils" code:1 userInfo:v21];
      int v24 = 1;
      goto LABEL_33;
    }
    v7->_productionStatus = [v16 BOOLValue];
    v18 = [v6 objectForKeyedSubscript:@"securityMode"];
    v19 = v18;
    if (v18)
    {
      uint64_t v38 = (uint64_t)v18;
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
          v7->_ecid = (unint64_t)[v22 unsignedLongLongValue];
          v22 = v23;
LABEL_32:

LABEL_33:
          v19 = (void *)v38;
          goto LABEL_34;
        }
        if (!*a4)
        {
          int v24 = 1;
          goto LABEL_32;
        }
        NSErrorUserInfoKey v40 = NSLocalizedDescriptionKey;
        v36 = +[NSString stringWithFormat:@"No ecid in options dict"];
        v41 = v36;
        +[NSDictionary dictionaryWithObjects:&v41 forKeys:&v40 count:1];
        v33 = v32 = v17;
        *a4 = +[NSError errorWithDomain:@"com.apple.Manta.MantaRestoreUtils" code:1 userInfo:v33];

        objc_super v17 = v32;
        v22 = 0;
      }
      else
      {
        if (!*a4)
        {
          int v24 = 1;
          goto LABEL_33;
        }
        NSErrorUserInfoKey v42 = NSLocalizedDescriptionKey;
        uint64_t v30 = +[NSString stringWithFormat:@"No securityDomain in options dict"];
        uint64_t v43 = v30;
        +[NSDictionary dictionaryWithObjects:&v43 forKeys:&v42 count:1];
        v31 = id v37 = v17;
        *a4 = +[NSError errorWithDomain:@"com.apple.Manta.MantaRestoreUtils" code:1 userInfo:v31];

        v22 = (void *)v30;
        objc_super v17 = v37;
      }
    }
    else
    {
      if (!*a4)
      {
        int v24 = 1;
        goto LABEL_34;
      }
      uint64_t v38 = 0;
      NSErrorUserInfoKey v44 = NSLocalizedDescriptionKey;
      int v21 = +[NSString stringWithFormat:@"No securityMode in options dict"];
      v45 = v21;
      uint64_t v29 = +[NSDictionary dictionaryWithObjects:&v45 forKeys:&v44 count:1];
      *a4 = +[NSError errorWithDomain:@"com.apple.Manta.MantaRestoreUtils" code:1 userInfo:v29];
      v22 = (void *)v29;
    }
    int v24 = 1;
    goto LABEL_32;
  }
  if (*a4)
  {
    NSErrorUserInfoKey v48 = NSLocalizedDescriptionKey;
    objc_super v17 = +[NSString stringWithFormat:@"No securityEpoch in options dict"];
    v49 = v17;
    v19 = +[NSDictionary dictionaryWithObjects:&v49 forKeys:&v48 count:1];
    *a4 = +[NSError errorWithDomain:@"com.apple.Manta.MantaRestoreUtils" code:1 userInfo:v19];
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
    v34 = v7;
    goto LABEL_40;
  }
LABEL_38:
  v34 = 0;
LABEL_40:

  return v34;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t chipID = self->_chipID;
  id v5 = a3;
  id v6 = +[NSNumber numberWithUnsignedInt:chipID];
  [v5 encodeObject:v6 forKey:@"chipID"];

  v7 = +[NSNumber numberWithUnsignedInt:self->_chipRev];
  [v5 encodeObject:v7 forKey:@"chipRev"];

  v8 = +[NSNumber numberWithUnsignedInt:self->_boardID];
  [v5 encodeObject:v8 forKey:@"boardID"];

  v9 = +[NSNumber numberWithUnsignedInt:self->_securityEpoch];
  [v5 encodeObject:v9 forKey:@"securityEpoch"];

  v10 = +[NSNumber numberWithBool:self->_productionStatus];
  [v5 encodeObject:v10 forKey:@"productionStatus"];

  v11 = +[NSNumber numberWithBool:self->_securityMode];
  [v5 encodeObject:v11 forKey:@"securityMode"];

  v12 = +[NSNumber numberWithUnsignedInt:self->_securityDomain];
  [v5 encodeObject:v12 forKey:@"securityDomain"];

  id v13 = +[NSNumber numberWithUnsignedLongLong:self->_ecid];
  [v5 encodeObject:v13 forKey:@"ecid"];
}

- (NSDictionary)asDictionary
{
  v13[0] = @"chipID";
  v3 = +[NSNumber numberWithUnsignedInt:self->_chipID];
  v14[0] = v3;
  v13[1] = @"bundlePath";
  id v4 = +[NSNumber numberWithUnsignedInt:self->_chipRev];
  v14[1] = v4;
  v13[2] = @"boardID";
  id v5 = +[NSNumber numberWithUnsignedInt:self->_boardID];
  v14[2] = v5;
  v13[3] = @"securityEpoch";
  id v6 = +[NSNumber numberWithUnsignedInt:self->_securityEpoch];
  v14[3] = v6;
  v13[4] = @"productionStatus";
  v7 = +[NSNumber numberWithBool:self->_productionStatus];
  v14[4] = v7;
  v13[5] = @"securityMode";
  v8 = +[NSNumber numberWithBool:self->_securityMode];
  v14[5] = v8;
  v13[6] = @"securityDomain";
  v9 = +[NSNumber numberWithUnsignedInt:self->_securityDomain];
  v14[6] = v9;
  v13[7] = @"ecid";
  v10 = +[NSNumber numberWithUnsignedLongLong:self->_ecid];
  v14[7] = v10;
  v11 = +[NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:8];

  return (NSDictionary *)v11;
}

- (id)description
{
  v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  id v5 = +[NSMutableString stringWithFormat:](NSMutableString, "stringWithFormat:", @"%@(\n"), v4;

  objc_msgSend(v5, "appendFormat:", @"\tchipID: %u\n", self->_chipID);
  objc_msgSend(v5, "appendFormat:", @"\tchipRev: %u\n", self->_chipRev);
  objc_msgSend(v5, "appendFormat:", @"\tboardID: %u\n", self->_boardID);
  objc_msgSend(v5, "appendFormat:", @"\tsecurityEpoch: %u\n", self->_securityEpoch);
  objc_msgSend(v5, "appendFormat:", @"\tproductionStatus: %u\n", self->_productionStatus);
  objc_msgSend(v5, "appendFormat:", @"\tsecurityMode: %u\n", self->_securityMode);
  objc_msgSend(v5, "appendFormat:", @"\tsecurityDomain: %u\n", self->_securityDomain);
  objc_msgSend(v5, "appendFormat:", @"\tecid: %llu\n", self->_ecid);
  [v5 appendString:@""]);
  id v6 = +[NSString stringWithString:v5];

  return v6;
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
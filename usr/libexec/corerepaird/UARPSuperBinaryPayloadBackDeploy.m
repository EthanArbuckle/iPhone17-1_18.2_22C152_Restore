@interface UARPSuperBinaryPayloadBackDeploy
- (BOOL)expandTLVs;
- (BOOL)getNeedsHostPersonalization;
- (BOOL)needsHostPersonalization;
- (BOOL)queryTatsuSigningServer:(id)a3 ssoOnly:(BOOL)a4 error:(id *)a5;
- (NSArray)measurements;
- (NSArray)tlvs;
- (NSData)manifest;
- (NSData)metaData;
- (NSData)nonce;
- (NSData)payloadData;
- (NSDictionary)tssRequest;
- (NSNumber)demote;
- (NSNumber)trustedOverride;
- (UARPAssetTagBackDeploy)tag;
- (UARPAssetVersionBackDeploy)version;
- (UARPSuperBinaryPayloadBackDeploy)initWithData:(id)a3 metaData:(id)a4 tag:(id)a5 version:(id)a6;
- (id)composeTSSRequest:(unint64_t)a3;
- (id)composeTSSRequest:(unint64_t)a3 asMeasurement:(BOOL)a4;
- (id)description;
- (id)getManifest;
- (id)getMeasurements;
- (id)getTlvs;
- (id)getTssRequest;
- (id)personalizedData;
- (id)personalizedMetaData;
- (id)requiredTSSOptions;
- (id)tatsuMeasurements:(unint64_t)a3;
- (id)tssKeyName:(id)a3 unitNumber:(unint64_t)a4;
- (id)tssRequestAsString;
- (unint64_t)ecID;
- (unsigned)boardID;
- (unsigned)chipID;
- (unsigned)productionMode;
- (unsigned)securityDomain;
- (unsigned)securityMode;
- (void)addSubfile:(id)a3 tag:(id)a4;
- (void)processMeasurementsForTSSOptions:(id)a3 unitNumber:(unint64_t)a4 asMeasurement:(BOOL)a5;
- (void)processTLVsForPersonalization;
- (void)removeSubfile:(id)a3 tag:(id)a4;
- (void)setBoardID:(unsigned int)a3;
- (void)setChipID:(unsigned int)a3;
- (void)setDemote:(id)a3;
- (void)setEcID:(unint64_t)a3;
- (void)setManifest:(id)a3;
- (void)setNonce:(id)a3;
- (void)setProductionMode:(unsigned __int8)a3;
- (void)setSecurityDomain:(unsigned __int8)a3;
- (void)setSecurityMode:(unsigned __int8)a3;
- (void)setTrustedOverride:(id)a3;
@end

@implementation UARPSuperBinaryPayloadBackDeploy

- (UARPSuperBinaryPayloadBackDeploy)initWithData:(id)a3 metaData:(id)a4 tag:(id)a5 version:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v36.receiver = self;
  v36.super_class = (Class)UARPSuperBinaryPayloadBackDeploy;
  v14 = [(UARPSuperBinaryPayloadBackDeploy *)&v36 init];
  if (v14)
  {
    v15 = (UARPAssetTagBackDeploy *)[v12 copy];
    tag = v14->_tag;
    v14->_tag = v15;

    v17 = (UARPAssetVersionBackDeploy *)[v13 copy];
    version = v14->_version;
    v14->_version = v17;

    v19 = (NSData *)[v10 copy];
    payloadData = v14->_payloadData;
    v14->_payloadData = v19;

    v21 = (NSData *)[v11 copy];
    metaData = v14->_metaData;
    v14->_metaData = v21;

    uint64_t v23 = objc_opt_new();
    tlvs = v14->_tlvs;
    v14->_tlvs = (NSMutableArray *)v23;

    uint64_t v25 = objc_opt_new();
    measurements = v14->_measurements;
    v14->_measurements = (NSMutableArray *)v25;

    uint64_t v27 = objc_opt_new();
    tssRequest = v14->_tssRequest;
    v14->_tssRequest = (NSMutableDictionary *)v27;

    uint64_t v29 = objc_opt_new();
    trimmedTlvs = v14->_trimmedTlvs;
    v14->_trimmedTlvs = (NSMutableArray *)v29;

    uint64_t v31 = objc_opt_new();
    subfiles = v14->_subfiles;
    v14->_subfiles = (NSMutableArray *)v31;

    v33 = [[FTABFileBackDeploy alloc] initWithData:v14->_payloadData];
    ftab = v14->_ftab;
    v14->_ftab = v33;
  }
  return v14;
}

- (id)getTlvs
{
  return +[NSArray arrayWithArray:self->_tlvs];
}

- (id)getMeasurements
{
  return +[NSArray arrayWithArray:self->_measurements];
}

- (id)personalizedData
{
  if (self->_ftab)
  {
    if ([(NSMutableArray *)self->_subfiles count]) {
      [(FTABFileBackDeploy *)self->_ftab addSubfiles:self->_subfiles];
    }
    if (self->_manifest) {
      -[FTABFileBackDeploy setManifest:](self->_ftab, "setManifest:");
    }
    v3 = (NSData *)[(FTABFileBackDeploy *)self->_ftab writeToData];
  }
  else
  {
    v3 = self->_payloadData;
  }

  return v3;
}

- (id)personalizedMetaData
{
  [(NSMutableArray *)self->_trimmedTlvs removeAllObjects];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  v20 = self;
  v3 = self->_tlvs;
  id v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v26;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v26 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v25 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0)
                {
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) == 0)
                  {
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) == 0) {
                      [(NSMutableArray *)v20->_trimmedTlvs addObject:v8];
                    }
                  }
                }
              }
            }
          }
        }
      }
      id v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v25 objects:v30 count:16];
    }
    while (v5);
  }

  if (!v20->_ftab)
  {
    manifest = v20->_manifest;
    if (manifest)
    {
      id v10 = +[UARPMetaDataTLVBackDeploy tlvFromType:2293403952 length:[(NSData *)manifest length] value:[(NSData *)v20->_manifest bytes]];
      if (v10) {
        [(NSMutableArray *)v20->_trimmedTlvs addObject:v10];
      }
    }
  }
  id v11 = objc_opt_new();
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v12 = v20->_trimmedTlvs;
  id v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v21 objects:v29 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v22;
    do
    {
      for (j = 0; j != v14; j = (char *)j + 1)
      {
        if (*(void *)v22 != v15) {
          objc_enumerationMutation(v12);
        }
        id v17 = [*(id *)(*((void *)&v21 + 1) + 8 * (void)j) generateTLV];
        [v11 appendData:v17];
      }
      id v14 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v21 objects:v29 count:16];
    }
    while (v14);
  }

  v18 = +[NSData dataWithData:v11];

  return v18;
}

- (BOOL)getNeedsHostPersonalization
{
  return self->_needsHostPersonalization;
}

- (id)getManifest
{
  return self->_manifest;
}

- (id)getTssRequest
{
  return +[NSDictionary dictionaryWithDictionary:self->_tssRequest];
}

- (id)tssRequestAsString
{
  return +[NSString stringWithFormat:@"%@", self->_tssRequest];
}

- (BOOL)expandTLVs
{
  v3 = [(NSData *)self->_metaData bytes];
  if ([(NSData *)self->_metaData length])
  {
    unint64_t v4 = 0;
    do
    {
      if (v4 + 4 > [(NSData *)self->_metaData length]) {
        break;
      }
      uint64_t v5 = uarpNtohl(*(_DWORD *)&v3[v4]);
      unint64_t v6 = v4 + 8;
      if (v4 + 8 > [(NSData *)self->_metaData length]) {
        break;
      }
      uint64_t v7 = uarpNtohl(*(_DWORD *)&v3[v4 + 4]);
      unint64_t v4 = v6 + v7;
      if (v4 > [(NSData *)self->_metaData length]) {
        break;
      }
      id v8 = +[UARPMetaDataTLVBackDeploy tlvFromType:v5 length:v7 value:&v3[v6]];
      if (!v8) {
        break;
      }
      v9 = v8;
      [(NSMutableArray *)self->_tlvs addObject:v8];
    }
    while (v4 < [(NSData *)self->_metaData length]);
  }
  [(UARPSuperBinaryPayloadBackDeploy *)self processTLVsForPersonalization];
  return 1;
}

- (id)requiredTSSOptions
{
  v3 = objc_opt_new();
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  unint64_t v4 = self->_tlvs;
  id v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v15;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v10 = v9;
          if (objc_msgSend(v10, "tssOption", (void)v14) == -2001563388)
          {
            uint64_t v11 = 4;
            goto LABEL_29;
          }
          if ([v10 tssOption] == -2001563387)
          {
            uint64_t v11 = 5;
            goto LABEL_29;
          }
          if ([v10 tssOption] == -2001563386)
          {
            uint64_t v11 = 7;
            goto LABEL_29;
          }
          if ([v10 tssOption] == -2001563339)
          {
            uint64_t v11 = 29;
            goto LABEL_29;
          }
          if ([v10 tssOption] == -2001563385)
          {
            uint64_t v11 = 24;
            goto LABEL_29;
          }
          if ([v10 tssOption] == -2001563383)
          {
            uint64_t v11 = 8;
            goto LABEL_29;
          }
          if ([v10 tssOption] == -2001563382)
          {
            uint64_t v11 = 9;
            goto LABEL_29;
          }
          if ([v10 tssOption] == -2001563381)
          {
            uint64_t v11 = 10;
            goto LABEL_29;
          }
          if ([v10 tssOption] == -2001563343)
          {
            uint64_t v11 = 25;
            goto LABEL_29;
          }
          if ([v10 tssOption] == -2001563342)
          {
            uint64_t v11 = 26;
            goto LABEL_29;
          }
          if ([v10 tssOption] == -2001563341)
          {
            uint64_t v11 = 27;
LABEL_29:
            id v12 = +[NSNumber numberWithUnsignedLong:v11];
            [v3 addObject:v12];
          }
          continue;
        }
      }
      id v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
  }

  return v3;
}

- (id)composeTSSRequest:(unint64_t)a3
{
  return [(UARPSuperBinaryPayloadBackDeploy *)self composeTSSRequest:a3 asMeasurement:0];
}

- (id)composeTSSRequest:(unint64_t)a3 asMeasurement:(BOOL)a4
{
  BOOL v4 = a4;
  manifest = self->_manifest;
  self->_manifest = 0;

  id v8 = (NSMutableDictionary *)objc_opt_new();
  tssRequest = self->_tssRequest;
  self->_tssRequest = v8;

  id v10 = (NSMutableString *)objc_opt_new();
  keyManifest = self->_keyManifest;
  self->_keyManifest = v10;

  [(NSMutableString *)self->_keyManifest appendFormat:@"%@", self->_ticketPrefix];
  if (self->_ticketNeedsUnitNumber) {
    [(NSMutableString *)self->_keyManifest appendFormat:@"%lu", a3];
  }
  [(NSMutableString *)self->_keyManifest appendFormat:@",Ticket"];
  if (!v4)
  {
    id v27 = (id)objc_opt_new();
    [v27 appendFormat:@"@%@", self->_keyManifest];
    [(NSMutableDictionary *)self->_tssRequest setObject:&__kCFBooleanTrue forKeyedSubscript:v27];
    id v28 = [(UARPSuperBinaryPayloadBackDeploy *)self tssKeyName:@"BoardID" unitNumber:a3];
    id v12 = +[NSNumber numberWithUnsignedInt:[(UARPSuperBinaryPayloadBackDeploy *)self boardID]];
    [(NSMutableDictionary *)self->_tssRequest setObject:v12 forKeyedSubscript:v28];

    id v26 = [(UARPSuperBinaryPayloadBackDeploy *)self tssKeyName:@"ChipID" unitNumber:a3];
    id v13 = +[NSNumber numberWithUnsignedInt:[(UARPSuperBinaryPayloadBackDeploy *)self chipID]];
    [(NSMutableDictionary *)self->_tssRequest setObject:v13 forKeyedSubscript:v26];

    id v14 = [(UARPSuperBinaryPayloadBackDeploy *)self tssKeyName:@"ECID" unitNumber:a3];
    long long v15 = +[NSNumber numberWithUnsignedLongLong:[(UARPSuperBinaryPayloadBackDeploy *)self ecID]];
    [(NSMutableDictionary *)self->_tssRequest setObject:v15 forKeyedSubscript:v14];

    id v16 = [(UARPSuperBinaryPayloadBackDeploy *)self tssKeyName:@"Nonce" unitNumber:a3];
    long long v17 = [(UARPSuperBinaryPayloadBackDeploy *)self nonce];
    [(NSMutableDictionary *)self->_tssRequest setObject:v17 forKeyedSubscript:v16];

    id v18 = [(UARPSuperBinaryPayloadBackDeploy *)self tssKeyName:@"ProductionMode" unitNumber:a3];
    if ([(UARPSuperBinaryPayloadBackDeploy *)self productionMode]) {
      v19 = &__kCFBooleanTrue;
    }
    else {
      v19 = &__kCFBooleanFalse;
    }
    [(NSMutableDictionary *)self->_tssRequest setObject:v19 forKeyedSubscript:v18];
    id v20 = [(UARPSuperBinaryPayloadBackDeploy *)self tssKeyName:@"SecurityDomain" unitNumber:a3];
    long long v21 = +[NSNumber numberWithUnsignedChar:[(UARPSuperBinaryPayloadBackDeploy *)self securityDomain]];
    [(NSMutableDictionary *)self->_tssRequest setObject:v21 forKeyedSubscript:v20];

    id v22 = [(UARPSuperBinaryPayloadBackDeploy *)self tssKeyName:@"SecurityMode" unitNumber:a3];
    if ([(UARPSuperBinaryPayloadBackDeploy *)self securityMode]) {
      long long v23 = &__kCFBooleanTrue;
    }
    else {
      long long v23 = &__kCFBooleanFalse;
    }
    [(NSMutableDictionary *)self->_tssRequest setObject:v23 forKeyedSubscript:v22];
  }
  [(UARPSuperBinaryPayloadBackDeploy *)self processMeasurementsForTSSOptions:self->_tssRequest unitNumber:a3 asMeasurement:v4];
  long long v24 = self->_tssRequest;

  return +[NSDictionary dictionaryWithDictionary:v24];
}

- (BOOL)queryTatsuSigningServer:(id)a3 ssoOnly:(BOOL)a4 error:(id *)a5
{
  BOOL v5 = a4;
  uint64_t v7 = (NSURL *)a3;
  if (!v7) {
    uint64_t v7 = +[NSURL URLWithString:@"https://gs.apple.com:443"];
  }
  tssRequest = self->_tssRequest;
  if (v5) {
    id v9 = UARPPersonalizationTSSRequestWithSigningServerSSO(tssRequest, v7);
  }
  else {
    id v9 = UARPPersonalizationTSSRequestWithSigningServer(tssRequest, v7);
  }
  id v10 = v9;
  if (v9)
  {
    uint64_t v11 = (NSData *)[v9 objectForKeyedSubscript:self->_keyManifest];
    manifest = self->_manifest;
    self->_manifest = v11;
  }
  return v10 != 0;
}

- (void)processTLVsForPersonalization
{
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v3 = self->_tlvs;
  id v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v13;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v12 + 1) + 8 * (void)v7);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          self->_needsHostPersonalization = [v8 isRequired] != 0;
        }
        else
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v9 = v8;
            id v10 = (NSString *)[v9 ticketPrefix];
            ticketPrefix = self->_ticketPrefix;
            self->_ticketPrefix = v10;
          }
          else
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              self->_ticketNeedsUnitNumber = [v8 ticketNeedsLogicalUnitNumber] != 0;
            }
            else
            {
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                self->_prefixNeedsUnitNumber = [v8 prefixNeedsLogicalUnitNumber] != 0;
              }
              else
              {
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  self->_suffixNeedsUnitNumber = [v8 suffixNeedsLogicalUnitNumber] != 0;
                }
                else
                {
                  objc_opt_class();
                  if (objc_opt_isKindOfClass()) {
                    -[NSMutableArray addObject:](self->_measurements, "addObject:", v8, (void)v12);
                  }
                }
              }
            }
          }
        }
        uint64_t v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v5);
  }
}

- (void)processMeasurementsForTSSOptions:(id)a3 unitNumber:(unint64_t)a4 asMeasurement:(BOOL)a5
{
  id v26 = a3;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  v30 = self;
  obj = self->_measurements;
  id v27 = [(NSMutableArray *)obj countByEnumeratingWithState:&v36 objects:v41 count:16];
  if (v27)
  {
    uint64_t v25 = *(void *)v37;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v37 != v25) {
          objc_enumerationMutation(obj);
        }
        uint64_t v29 = v6;
        uint64_t v7 = *(void **)(*((void *)&v36 + 1) + 8 * v6);
        id v8 = objc_opt_new();
        long long v32 = 0u;
        long long v33 = 0u;
        long long v34 = 0u;
        long long v35 = 0u;
        id v9 = [v7 tlvs];
        id v10 = [v9 countByEnumeratingWithState:&v32 objects:v40 count:16];
        if (!v10)
        {
          long long v12 = 0;
          goto LABEL_38;
        }
        id v11 = v10;
        long long v12 = 0;
        uint64_t v13 = *(void *)v33;
        do
        {
          for (i = 0; i != v11; i = (char *)i + 1)
          {
            if (*(void *)v33 != v13) {
              objc_enumerationMutation(v9);
            }
            long long v15 = *(void **)(*((void *)&v32 + 1) + 8 * i);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v16 = v15;
              id v17 = [v16 longname];

              long long v12 = v17;
              continue;
            }
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v18 = [v15 digest];
              [v8 setObject:v18 forKeyedSubscript:@"Digest"];

              continue;
            }
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              if (a5) {
                continue;
              }
              if ([(UARPSuperBinaryPayloadBackDeploy *)v30 securityMode]) {
                v19 = &__kCFBooleanTrue;
              }
              else {
                v19 = &__kCFBooleanFalse;
              }
              id v20 = v8;
              CFStringRef v21 = @"ESEC";
              goto LABEL_33;
            }
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              if (a5) {
                continue;
              }
              if ([(UARPSuperBinaryPayloadBackDeploy *)v30 productionMode]) {
                v19 = &__kCFBooleanTrue;
              }
              else {
                v19 = &__kCFBooleanFalse;
              }
              id v20 = v8;
              CFStringRef v21 = @"EPRO";
              goto LABEL_33;
            }
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              unsigned int v22 = [v15 trusted];
              if (!a5)
              {
                if (v22) {
                  v19 = &__kCFBooleanTrue;
                }
                else {
                  v19 = &__kCFBooleanFalse;
                }
                id v20 = v8;
                CFStringRef v21 = @"Trusted";
LABEL_33:
                [v20 setObject:v19 forKeyedSubscript:v21];
                continue;
              }
            }
          }
          id v11 = [v9 countByEnumeratingWithState:&v32 objects:v40 count:16];
        }
        while (v11);
LABEL_38:

        long long v23 = objc_opt_new();
        [v23 appendFormat:@"%@", v30->_ticketPrefix];
        if (v30->_prefixNeedsUnitNumber) {
          [v23 appendFormat:@"%lu", a4];
        }
        [v23 appendFormat:@",%@", v12];
        if (v30->_suffixNeedsUnitNumber) {
          [v23 appendFormat:@",%lu", a4];
        }
        [v26 setObject:v8 forKeyedSubscript:v23];

        uint64_t v6 = v29 + 1;
      }
      while ((id)(v29 + 1) != v27);
      id v27 = [(NSMutableArray *)obj countByEnumeratingWithState:&v36 objects:v41 count:16];
    }
    while (v27);
  }
}

- (id)tssKeyName:(id)a3 unitNumber:(unint64_t)a4
{
  id v6 = a3;
  uint64_t v7 = objc_opt_new();
  [v7 appendFormat:@"%@", self->_ticketPrefix];
  if (self->_prefixNeedsUnitNumber) {
    [v7 appendFormat:@"%lu", a4];
  }
  [v7 appendFormat:@",%@", v6];
  if (self->_suffixNeedsUnitNumber) {
    [v7 appendFormat:@",%lu", a4];
  }
  id v8 = +[NSString stringWithString:v7];

  return v8;
}

- (id)description
{
  v3 = objc_opt_new();
  [v3 appendFormat:@"Payload - 4cc <%@> - Version <%@> - TLVs - %@", self->_tag, self->_version, self->_tlvs];
  id v4 = +[NSString stringWithString:v3];

  return v4;
}

- (id)tatsuMeasurements:(unint64_t)a3
{
  id v5 = [(NSMutableArray *)self->_tlvs count];
  if (v5) {
    id v5 = [(UARPSuperBinaryPayloadBackDeploy *)self composeTSSRequest:a3 asMeasurement:1];
  }

  return v5;
}

- (UARPAssetTagBackDeploy)tag
{
  return (UARPAssetTagBackDeploy *)objc_getProperty(self, a2, 120, 1);
}

- (UARPAssetVersionBackDeploy)version
{
  return (UARPAssetVersionBackDeploy *)objc_getProperty(self, a2, 128, 1);
}

- (NSArray)tlvs
{
  return (NSArray *)objc_getProperty(self, a2, 8, 1);
}

- (NSData)payloadData
{
  return (NSData *)objc_getProperty(self, a2, 136, 1);
}

- (NSData)metaData
{
  return (NSData *)objc_getProperty(self, a2, 144, 1);
}

- (BOOL)needsHostPersonalization
{
  return self->_needsHostPersonalization;
}

- (NSData)manifest
{
  return (NSData *)objc_getProperty(self, a2, 32, 1);
}

- (void)setManifest:(id)a3
{
}

- (unsigned)boardID
{
  return self->_boardID;
}

- (void)setBoardID:(unsigned int)a3
{
  self->_boardID = a3;
}

- (unsigned)chipID
{
  return self->_chipID;
}

- (void)setChipID:(unsigned int)a3
{
  self->_chipID = a3;
}

- (unint64_t)ecID
{
  return self->_ecID;
}

- (void)setEcID:(unint64_t)a3
{
  self->_ecID = a3;
}

- (NSData)nonce
{
  return (NSData *)objc_getProperty(self, a2, 160, 1);
}

- (void)setNonce:(id)a3
{
}

- (unsigned)productionMode
{
  return self->_productionMode;
}

- (void)setProductionMode:(unsigned __int8)a3
{
  self->_productionMode = a3;
}

- (unsigned)securityDomain
{
  return self->_securityDomain;
}

- (void)setSecurityDomain:(unsigned __int8)a3
{
  self->_securityDomain = a3;
}

- (unsigned)securityMode
{
  return self->_securityMode;
}

- (void)setSecurityMode:(unsigned __int8)a3
{
  self->_securityMode = a3;
}

- (NSNumber)trustedOverride
{
  return (NSNumber *)objc_getProperty(self, a2, 168, 1);
}

- (void)setTrustedOverride:(id)a3
{
}

- (NSNumber)demote
{
  return (NSNumber *)objc_getProperty(self, a2, 176, 1);
}

- (void)setDemote:(id)a3
{
}

- (NSDictionary)tssRequest
{
  return (NSDictionary *)objc_getProperty(self, a2, 40, 1);
}

- (NSArray)measurements
{
  return (NSArray *)objc_getProperty(self, a2, 80, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_demote, 0);
  objc_storeStrong((id *)&self->_trustedOverride, 0);
  objc_storeStrong((id *)&self->_nonce, 0);
  objc_storeStrong((id *)&self->_metaData, 0);
  objc_storeStrong((id *)&self->_payloadData, 0);
  objc_storeStrong((id *)&self->_version, 0);
  objc_storeStrong((id *)&self->_tag, 0);
  objc_storeStrong((id *)&self->_subfiles, 0);
  objc_storeStrong((id *)&self->_trimmedTlvs, 0);
  objc_storeStrong((id *)&self->_measurements, 0);
  objc_storeStrong((id *)&self->_ticketPrefix, 0);
  objc_storeStrong((id *)&self->_keyManifest, 0);
  objc_storeStrong((id *)&self->_tssRequest, 0);
  objc_storeStrong((id *)&self->_manifest, 0);
  objc_storeStrong((id *)&self->_ftab, 0);

  objc_storeStrong((id *)&self->_tlvs, 0);
}

- (void)addSubfile:(id)a3 tag:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [[FTABSubfileBackDeploy alloc] initWithTag:v6 data:v7];

  [(NSMutableArray *)self->_subfiles addObject:v8];
}

- (void)removeSubfile:(id)a3 tag:(id)a4
{
  id v5 = a4;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v6 = self->_subfiles;
  id v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v16;
LABEL_3:
    uint64_t v10 = 0;
    while (1)
    {
      if (*(void *)v16 != v9) {
        objc_enumerationMutation(v6);
      }
      id v11 = *(void **)(*((void *)&v15 + 1) + 8 * v10);
      id v12 = [v11 tag:v15];
      id v13 = [v12 compare:v5];

      if (!v13) {
        break;
      }
      if (v8 == (id)++v10)
      {
        id v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
        if (v8) {
          goto LABEL_3;
        }
        goto LABEL_12;
      }
    }
    long long v14 = v11;

    if (!v14) {
      goto LABEL_13;
    }
    [(NSMutableArray *)self->_subfiles removeObject:v14];
    id v6 = v14;
  }
LABEL_12:

LABEL_13:
}

@end
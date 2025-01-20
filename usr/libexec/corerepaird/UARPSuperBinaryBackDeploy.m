@interface UARPSuperBinaryBackDeploy
- (BOOL)expandMetaData:(UARPSuperBinaryHeader *)a3;
- (BOOL)expandSuperBinary;
- (BOOL)expandTLVs;
- (BOOL)generateTatsuMeasurements:(unint64_t)a3 relativeURL:(id)a4;
- (BOOL)needsHostPersonalization;
- (BOOL)preparePayload:(UARPPayloadHeader2 *)a3;
- (BOOL)provisioning;
- (BOOL)queryTatsuSigningServer:(id)a3 ssoOnly:(BOOL)a4 error:(id *)a5;
- (NSArray)payloads;
- (NSArray)tlvs;
- (NSData)ecidData;
- (NSData)nonce;
- (NSNumber)demote;
- (NSNumber)trustedOverride;
- (UARPSuperBinaryBackDeploy)initWithData:(id)a3 delegate:(id)a4 delegateQueue:(id)a5;
- (UARPSuperBinaryBackDeploy)initWithFilePath:(id)a3 delegate:(id)a4 delegateQueue:(id)a5;
- (UARPSuperBinaryBackDeploy)initWithURL:(id)a3 delegate:(id)a4 delegateQueue:(id)a5;
- (id)composeTSSRequest:(unint64_t)a3 asMeasurement:(BOOL)a4;
- (id)generatePersonalizedSuperBinary;
- (id)generatePersonalizedSuperBinaryInternal:(id)a3;
- (id)generatePersonalizedSuperBinaryWithoutRRKO;
- (id)getDataBlock:(unint64_t)a3 offset:(unint64_t)a4;
- (id)getPayloads;
- (id)getTlvs;
- (id)payloadWith4ccTag:(id)a3;
- (id)payloadsWithout4ccTag:(id)a3;
- (id)personalizeSuperBinary:(unint64_t)a3 signingServer:(id)a4 ssoOnly:(BOOL)a5;
- (id)personalizedMetaData;
- (id)requiredTSSOptions;
- (id)tatsuMeasurements:(unint64_t)a3;
- (id)tssKeyName:(id)a3 unitNumber:(unint64_t)a4;
- (unint64_t)ecID;
- (unint64_t)totalBytesRequested;
- (unint64_t)totalLength;
- (unsigned)boardID;
- (unsigned)chipID;
- (unsigned)life;
- (unsigned)manifestEpoch;
- (unsigned)productionMode;
- (unsigned)securityDomain;
- (unsigned)securityMode;
- (void)generateTatsuMeasurements:(unint64_t)a3;
- (void)generateTatsuMeasurementsPerPayload:(unint64_t)a3;
- (void)layer2Context;
- (void)log:(id)a3;
- (void)logInternal:(id)a3 arguments:(char *)a4;
- (void)processMeasurementsForTSSOptions:(id)a3 unitNumber:(unint64_t)a4 asMeasurement:(BOOL)a5;
- (void)processTLVsForPersonalization;
- (void)setBoardID:(unsigned int)a3;
- (void)setChipID:(unsigned int)a3;
- (void)setDemote:(id)a3;
- (void)setEcID:(unint64_t)a3;
- (void)setEcidData:(id)a3;
- (void)setLayer2Context:(void *)a3;
- (void)setLife:(unsigned __int8)a3;
- (void)setManifestEpoch:(unsigned __int8)a3;
- (void)setNonce:(id)a3;
- (void)setProductionMode:(unsigned __int8)a3;
- (void)setProvisioning:(BOOL)a3;
- (void)setSecurityDomain:(unsigned __int8)a3;
- (void)setSecurityMode:(unsigned __int8)a3;
- (void)setTrustedOverride:(id)a3;
@end

@implementation UARPSuperBinaryBackDeploy

- (UARPSuperBinaryBackDeploy)initWithData:(id)a3 delegate:(id)a4 delegateQueue:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v23.receiver = self;
  v23.super_class = (Class)UARPSuperBinaryBackDeploy;
  v11 = [(UARPSuperBinaryBackDeploy *)&v23 init];
  v12 = v11;
  if (!v11) {
    goto LABEL_4;
  }
  if (!v8) {
    goto LABEL_5;
  }
  objc_storeWeak((id *)&v11->_delegate, v9);
  objc_storeStrong((id *)&v12->_delegateQueue, a5);
  v13 = (NSData *)[v8 copy];
  data = v12->_data;
  v12->_data = v13;

  uint64_t v15 = objc_opt_new();
  tlvs = v12->_tlvs;
  v12->_tlvs = (NSMutableArray *)v15;

  uint64_t v17 = objc_opt_new();
  trimmedTlvs = v12->_trimmedTlvs;
  v12->_trimmedTlvs = (NSMutableArray *)v17;

  uint64_t v19 = objc_opt_new();
  measurements = v12->_measurements;
  v12->_measurements = (NSMutableArray *)v19;

  v12->_totalLength = [(NSData *)v12->_data length];
  if ([(UARPSuperBinaryBackDeploy *)v12 expandSuperBinary]) {
LABEL_4:
  }
    v21 = v12;
  else {
LABEL_5:
  }
    v21 = 0;

  return v21;
}

- (UARPSuperBinaryBackDeploy)initWithFilePath:(id)a3 delegate:(id)a4 delegateQueue:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = [a3 stringByExpandingTildeInPath];
  v11 = +[NSData dataWithContentsOfFile:v10];
  v12 = [(UARPSuperBinaryBackDeploy *)self initWithData:v11 delegate:v9 delegateQueue:v8];

  return v12;
}

- (UARPSuperBinaryBackDeploy)initWithURL:(id)a3 delegate:(id)a4 delegateQueue:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = +[NSData dataWithContentsOfURL:a3];
  v11 = [(UARPSuperBinaryBackDeploy *)self initWithData:v10 delegate:v9 delegateQueue:v8];

  return v11;
}

- (BOOL)expandSuperBinary
{
  v3 = (NSMutableArray *)objc_opt_new();
  payloads = self->_payloads;
  self->_payloads = v3;

  data = self->_data;
  if (!data) {
    return 0;
  }
  if ([(NSData *)data length] < 0x2C) {
    return 0;
  }
  memset(v17, 0, 44);
  -[NSData getBytes:range:](self->_data, "getBytes:range:", v17, 0, 44);
  uarpSuperBinaryHeaderEndianSwap((unsigned int *)v17, v17);
  unint64_t v6 = DWORD2(v17[0]);
  if ([(NSData *)self->_data length] < v6) {
    return 0;
  }
  self->_formatVersion = v17[0];
  v7 = [UARPAssetVersionBackDeploy alloc];
  id v8 = [(UARPAssetVersionBackDeploy *)v7 initWithMajorVersion:HIDWORD(v17[0]) minorVersion:LODWORD(v17[1]) releaseVersion:DWORD1(v17[1]) buildVersion:DWORD2(v17[1])];
  version = self->_version;
  self->_version = v8;

  if (![(UARPSuperBinaryBackDeploy *)self expandMetaData:v17]) {
    return 0;
  }
  uint64_t v10 = DWORD1(v17[2]);
  unint64_t v11 = DWORD2(v17[2]);
  do
  {
    BOOL v12 = v11 >= 0x28;
    v11 -= 40;
    BOOL v13 = !v12;
    if (!v12) {
      break;
    }
    uint64_t v16 = 0;
    memset(v15, 0, sizeof(v15));
    -[NSData getBytes:range:](self->_data, "getBytes:range:", v15, v10, 40);
    uarpPayloadHeaderEndianSwap((unsigned int *)v15, v15);
    v10 += 40;
  }
  while ([(UARPSuperBinaryBackDeploy *)self preparePayload:v15]);
  return v13;
}

- (BOOL)expandMetaData:(UARPSuperBinaryHeader *)a3
{
  unsigned int var5 = a3->var5;
  if (!var5) {
    return 1;
  }
  unint64_t v6 = a3->var4 + var5;
  if ([(NSData *)self->_data length] < v6) {
    return 0;
  }
  id v8 = -[NSData subdataWithRange:](self->_data, "subdataWithRange:", a3->var4, a3->var5);
  metaData = self->_metaData;
  self->_metaData = v8;

  return [(UARPSuperBinaryBackDeploy *)self expandTLVs];
}

- (BOOL)preparePayload:(UARPPayloadHeader2 *)a3
{
  v5 = [[UARPAssetTagBackDeploy alloc] initWithChar1:(char)a3->var1.var0 char2:(char)a3->var1.var1 char3:(char)a3->var1.var2 char4:(char)a3->var1.var3];
  unint64_t v6 = [[UARPAssetVersionBackDeploy alloc] initWithMajorVersion:a3->var2.var0 minorVersion:a3->var2.var1 releaseVersion:a3->var2.var2 buildVersion:a3->var2.var3];
  unint64_t v7 = a3->var4 + a3->var3;
  if ([(NSData *)self->_data length] >= v7)
  {
    if (a3->var4) {
      id v9 = [(NSData *)self->_data subdataWithRange:a3->var3];
    }
    else {
      id v9 = 0;
    }
    unint64_t v10 = a3->var6 + a3->var5;
    if ([(NSData *)self->_data length] >= v10)
    {
      if (a3->var6) {
        unint64_t v11 = [(NSData *)self->_data subdataWithRange:a3->var5];
      }
      else {
        unint64_t v11 = 0;
      }
      BOOL v12 = [[UARPSuperBinaryPayloadBackDeploy alloc] initWithData:v11 metaData:v9 tag:v5 version:v6];
      BOOL v13 = v12;
      if (v12 && [(UARPSuperBinaryPayloadBackDeploy *)v12 expandTLVs])
      {
        [(NSMutableArray *)self->_payloads addObject:v13];
        BOOL v8 = 1;
      }
      else
      {
        BOOL v8 = 0;
      }
    }
    else
    {
      BOOL v8 = 0;
    }
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (id)payloadWith4ccTag:(id)a3
{
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v5 = self->_payloads;
  id v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        id v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        id v10 = [v9 tag:v13];
        unsigned __int8 v11 = [v10 isEqual:v4];

        if (v11)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)payloadsWithout4ccTag:(id)a3
{
  id v4 = a3;
  v5 = objc_opt_new();
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v6 = self->_payloads;
  id v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v17;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        unsigned __int8 v11 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        id v12 = [v11 tag:v16];
        unsigned __int8 v13 = [v12 isEqual:v4];

        if ((v13 & 1) == 0) {
          [v5 addObject:v11];
        }
      }
      id v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v8);
  }

  long long v14 = +[NSArray arrayWithArray:v5];

  return v14;
}

- (id)getTlvs
{
  return +[NSArray arrayWithArray:self->_tlvs];
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

  manifest = v20->_manifest;
  if (manifest)
  {
    id v10 = +[UARPMetaDataTLVBackDeploy tlvFromType:2293403952 length:[(NSData *)manifest length] value:[(NSData *)v20->_manifest bytes]];
    if (v10) {
      [(NSMutableArray *)v20->_trimmedTlvs addObject:v10];
    }
  }
  unsigned __int8 v11 = objc_opt_new();
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

  long long v18 = +[NSData dataWithData:v11];

  return v18;
}

- (id)getPayloads
{
  return +[NSArray arrayWithArray:self->_payloads];
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
      uint64_t v9 = v8;
      [(NSMutableArray *)self->_tlvs addObject:v8];
    }
    while (v4 < [(NSData *)self->_metaData length]);
  }
  [(UARPSuperBinaryBackDeploy *)self processTLVsForPersonalization];
  return 1;
}

- (id)personalizeSuperBinary:(unint64_t)a3 signingServer:(id)a4 ssoOnly:(BOOL)a5
{
  BOOL v5 = a5;
  id v22 = a4;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v8 = self->_payloads;
  id v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v24;
    while (2)
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v24 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        if ([v13 needsHostPersonalization])
        {
          [v13 setBoardID:self->_boardID];
          [v13 setChipID:self->_chipID];
          [v13 setEcID:self->_ecID];
          [v13 setNonce:self->_nonce];
          [v13 setProductionMode:self->_productionMode];
          [v13 setSecurityDomain:self->_securityDomain];
          [v13 setSecurityMode:self->_securityMode];
          [v13 setTrustedOverride:self->_trustedOverride];
          [v13 setDemote:self->_demote];
          [(UARPSuperBinaryBackDeploy *)self log:@"Personalizing %@", v13];
          id v14 = [v13 composeTSSRequest:a3];
          if (!v14
            || (id v15 = [v13 tag],
                [(UARPSuperBinaryBackDeploy *)self log:@"TSS Request Options for payload %@", v15],
                v15,
                id v16 = [v13 tssRequest],
                [(UARPSuperBinaryBackDeploy *)self log:@"%@", v16],
                v16,
                ![v13 queryTatsuSigningServer:v22 ssoOnly:v5 error:0]))
          {

            long long v19 = 0;
            goto LABEL_18;
          }
        }
        else
        {
          id v14 = [v13 tag];
          [(UARPSuperBinaryBackDeploy *)self log:@"Host Personalization not required for payload %@", v14];
        }
      }
      id v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v23 objects:v27 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }

  if (![(UARPSuperBinaryBackDeploy *)self needsHostPersonalization]
    || (id v17 = [(UARPSuperBinaryBackDeploy *)self composeTSSRequest:a3 asMeasurement:0], v18 = [(UARPSuperBinaryBackDeploy *)self queryTatsuSigningServer:v22 ssoOnly:v5 error:0], v19 = 0, v18))
  {
    v20 = (NSMutableArray *)[(UARPSuperBinaryBackDeploy *)self generatePersonalizedSuperBinary];
    id v8 = v20;
    if (v20)
    {
      id v8 = v20;
      long long v19 = v8;
    }
    else
    {
      long long v19 = 0;
    }
LABEL_18:
  }

  return v19;
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

- (id)generatePersonalizedSuperBinary
{
  return [(UARPSuperBinaryBackDeploy *)self generatePersonalizedSuperBinaryInternal:self->_payloads];
}

- (id)generatePersonalizedSuperBinaryWithoutRRKO
{
  v3 = [[UARPAssetTagBackDeploy alloc] initWithString:@"RRKO"];
  unint64_t v4 = [[UARPAssetTagBackDeploy alloc] initWithString:@"rrko"];
  id v16 = self;
  id v17 = objc_opt_new();
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  BOOL v5 = self->_payloads;
  id v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v19;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v19 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        id v11 = [v10 tag:v16];
        if ([v11 isEqual:v3])
        {
        }
        else
        {
          id v12 = [v10 tag];
          unsigned __int8 v13 = [v12 isEqual:v4];

          if ((v13 & 1) == 0) {
            [v17 addObject:v10];
          }
        }
      }
      id v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v7);
  }

  id v14 = [(UARPSuperBinaryBackDeploy *)v16 generatePersonalizedSuperBinaryInternal:v17];

  return v14;
}

- (id)generatePersonalizedSuperBinaryInternal:(id)a3
{
  id v4 = a3;
  BOOL v5 = objc_opt_new();
  id v6 = objc_opt_new();
  v33 = objc_opt_new();
  v34[0] = self->_formatVersion;
  v34[1] = 44;
  unsigned int v36 = [(UARPAssetVersionBackDeploy *)self->_version majorVersion];
  unsigned int v37 = [(UARPAssetVersionBackDeploy *)self->_version minorVersion];
  unsigned int v38 = [(UARPAssetVersionBackDeploy *)self->_version releaseVersion];
  unsigned int v39 = [(UARPAssetVersionBackDeploy *)self->_version buildVersion];
  int v42 = 44;
  unsigned int v43 = 40 * [v4 count];
  id v7 = [(UARPSuperBinaryBackDeploy *)self personalizedMetaData];
  unsigned int v40 = v43 + 44;
  unsigned int v8 = [v7 length];
  unsigned int v9 = v43 + 44 + v8;
  unsigned int v41 = v8;
  unsigned int v35 = v9;
  id v32 = v7;
  [v6 appendData:v7];
  id v10 = (unsigned int *)calloc((size_t)[v4 count], 0x28uLL);
  if ([v4 count])
  {
    unint64_t v11 = 0;
    id v12 = v10 + 4;
    do
    {
      id v13 = [v4 objectAtIndex:v11];
      id v14 = [v13 personalizedMetaData];
      *(v12 - 4) = 40;
      id v15 = [v13 tag];
      *((unsigned char *)v12 - 12) = [v15 char1];

      id v16 = [v13 tag];
      *((unsigned char *)v12 - 11) = [v16 char2];

      id v17 = [v13 tag];
      *((unsigned char *)v12 - 10) = [v17 char3];

      id v18 = [v13 tag];
      *((unsigned char *)v12 - 9) = [v18 char4];

      id v19 = [v13 version];
      *(v12 - 2) = [v19 majorVersion];

      id v20 = [v13 version];
      *(v12 - 1) = [v20 minorVersion];

      id v21 = [v13 version];
      _DWORD *v12 = [v21 releaseVersion];

      id v22 = [v13 version];
      v12[1] = [v22 buildVersion];

      v12[2] = v9;
      unsigned int v23 = [v14 length];
      v12[3] = v23;
      v9 += v23;
      [v6 appendData:v14];

      ++v11;
      v12 += 10;
    }
    while (v11 < (unint64_t)[v4 count]);
  }
  if ([v4 count])
  {
    unint64_t v24 = 0;
    long long v25 = v10 + 9;
    long long v26 = v33;
    do
    {
      id v27 = [v4 objectAtIndex:v24];
      id v28 = [v27 personalizedData];
      *(v25 - 1) = v9;
      unsigned int v29 = [v28 length];
      *long long v25 = v29;
      v25 += 10;
      v9 += v29;
      [v33 appendData:v28];

      ++v24;
    }
    while (v24 < (unint64_t)[v4 count]);
  }
  else
  {
    long long v26 = v33;
  }
  unsigned int v35 = v9;
  uarpSuperBinaryHeaderEndianSwap(v34, v34);
  [v5 appendBytes:v34 length:44];
  if ([v4 count])
  {
    unint64_t v30 = 0;
    do
    {
      uarpPayloadHeaderEndianSwap(v10, v10);
      [v5 appendBytes:v10 length:40];
      ++v30;
      v10 += 10;
    }
    while (v30 < (unint64_t)[v4 count]);
  }
  [v5 appendData:v6];
  [v5 appendData:v26];

  return v5;
}

- (BOOL)generateTatsuMeasurements:(unint64_t)a3 relativeURL:(id)a4
{
  id v6 = a4;
  id v7 = (NSMutableDictionary *)objc_opt_new();
  tatsuMeasurements = self->_tatsuMeasurements;
  self->_tatsuMeasurements = v7;

  if ([(UARPSuperBinaryBackDeploy *)self expandTLVs]) {
    [(UARPSuperBinaryBackDeploy *)self processTLVsForPersonalization];
  }
  if (self->_needsHostPersonalization) {
    [(UARPSuperBinaryBackDeploy *)self generateTatsuMeasurements:a3];
  }
  else {
    [(UARPSuperBinaryBackDeploy *)self generateTatsuMeasurementsPerPayload:a3];
  }
  id v9 = [v6 lastPathComponent];
  id v10 = +[NSString stringWithFormat:@"%@.plist", v9];

  id v11 = [v6 URLByDeletingLastPathComponent];
  id v12 = +[NSURL fileURLWithPath:v10 isDirectory:0 relativeToURL:v11];

  unsigned __int8 v13 = [(NSMutableDictionary *)self->_tatsuMeasurements writeToURL:v12 error:0];
  return v13;
}

- (void)generateTatsuMeasurementsPerPayload:(unint64_t)a3
{
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  BOOL v5 = self->_payloads;
  id v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      id v9 = 0;
      do
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        if (a3)
        {
          id v10 = *(void **)(*((void *)&v13 + 1) + 8 * (void)v9);
          unint64_t v11 = 1;
          do
          {
            id v12 = [v10 tatsuMeasurements:v11, v13];
            if (v12) {
              [(NSMutableDictionary *)self->_tatsuMeasurements addEntriesFromDictionary:v12];
            }

            ++v11;
          }
          while (v11 <= a3);
        }
        id v9 = (char *)v9 + 1;
      }
      while (v9 != v7);
      id v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }
}

- (void)generateTatsuMeasurements:(unint64_t)a3
{
  manifest = self->_manifest;
  self->_manifest = 0;

  id v6 = (NSMutableDictionary *)objc_opt_new();
  tssRequest = self->_tssRequest;
  self->_tssRequest = v6;

  if (a3)
  {
    uint64_t v8 = 0;
    do
    {
      id v9 = [(UARPSuperBinaryBackDeploy *)self tatsuMeasurements:v8];
      if (v9) {
        [(NSMutableDictionary *)self->_tatsuMeasurements addEntriesFromDictionary:v9];
      }

      ++v8;
    }
    while (a3 != v8);
  }
}

- (void)processTLVsForPersonalization
{
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v3 = self->_tlvs;
  id v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v15;
    do
    {
      id v7 = 0;
      do
      {
        if (*(void *)v15 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v14 + 1) + 8 * (void)v7);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          self->_needsHostPersonalization = [v8 isRequired] != 0;
          goto LABEL_13;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v9 = v8;
          id v10 = (NSString *)[v9 ticketPrefix];
          ticketPrefix = self->_ticketPrefix;
          self->_ticketPrefix = v10;
LABEL_12:

          goto LABEL_13;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v9 = v8;
          id v12 = (NSString *)[v9 manifestSuffix];
          ticketPrefix = self->_ticketSuffix;
          self->_ticketSuffix = v12;
          goto LABEL_12;
        }
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
            if ((objc_opt_isKindOfClass() & 1) != 0
              || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
              || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
            {
              self->_suffixNeedsUnitNumber = [v8 suffixNeedsLogicalUnitNumber] != 0;
            }
            else
            {
              objc_opt_class();
              if (objc_opt_isKindOfClass()) {
                -[NSMutableArray addObject:](self->_measurements, "addObject:", v8, (void)v14);
              }
            }
          }
        }
LABEL_13:
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          self->_life = [v8 life];
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          self->_provisioning = [v8 provisioning] != 0;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          self->_manifestEpoch = [v8 manifestEpoch];
        }
        id v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v13 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
      id v5 = v13;
    }
    while (v13);
  }
}

- (id)tatsuMeasurements:(unint64_t)a3
{
  id v5 = [(NSMutableArray *)self->_tlvs count];
  if (v5) {
    id v5 = [(UARPSuperBinaryBackDeploy *)self composeTSSRequest:a3 asMeasurement:1];
  }

  return v5;
}

- (id)composeTSSRequest:(unint64_t)a3 asMeasurement:(BOOL)a4
{
  BOOL v28 = a4;
  manifest = self->_manifest;
  self->_manifest = 0;

  id v7 = (NSMutableDictionary *)objc_opt_new();
  tssRequest = self->_tssRequest;
  self->_tssRequest = v7;

  id v9 = [(UARPSuperBinaryBackDeploy *)self requiredTSSOptions];
  id v10 = (NSMutableString *)objc_opt_new();
  keyManifest = self->_keyManifest;
  self->_keyManifest = v10;

  [(NSMutableString *)self->_keyManifest appendFormat:@"%@", self->_ticketPrefix];
  if (self->_ticketNeedsUnitNumber) {
    [(NSMutableString *)self->_keyManifest appendFormat:@"%lu", a3];
  }
  [(NSMutableString *)self->_keyManifest appendFormat:@",Ticket"];
  id v12 = objc_opt_new();
  [v12 appendFormat:@"@%@", self->_keyManifest];
  [(NSMutableDictionary *)self->_tssRequest setObject:&__kCFBooleanTrue forKeyedSubscript:v12];
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v13 = v9;
  id v14 = [v13 countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v14)
  {
    id v15 = v14;
    uint64_t v16 = *(void *)v30;
    do
    {
      for (i = 0; i != v15; i = (char *)i + 1)
      {
        if (*(void *)v30 != v16) {
          objc_enumerationMutation(v13);
        }
        switch([*(id *)(*((void *)&v29 + 1) + 8 * i) unsignedLongValue])
        {
          case 4u:
            id v18 = [(UARPSuperBinaryBackDeploy *)self tssKeyName:@"BoardID" unitNumber:a3];
            uint64_t v19 = [(UARPSuperBinaryBackDeploy *)self boardID];
            goto LABEL_13;
          case 5u:
            id v18 = [(UARPSuperBinaryBackDeploy *)self tssKeyName:@"ChipID" unitNumber:a3];
            uint64_t v19 = [(UARPSuperBinaryBackDeploy *)self chipID];
LABEL_13:
            id v22 = +[NSNumber numberWithUnsignedInt:v19];
            goto LABEL_28;
          case 7u:
            id v18 = [(UARPSuperBinaryBackDeploy *)self tssKeyName:@"ECID" unitNumber:a3];
            id v22 = +[NSNumber numberWithUnsignedLongLong:[(UARPSuperBinaryBackDeploy *)self ecID]];
            goto LABEL_28;
          case 8u:
            id v18 = [(UARPSuperBinaryBackDeploy *)self tssKeyName:@"SecurityDomain" unitNumber:a3];
            uint64_t v23 = [(UARPSuperBinaryBackDeploy *)self securityDomain];
            goto LABEL_27;
          case 9u:
            id v18 = [(UARPSuperBinaryBackDeploy *)self tssKeyName:@"SecurityMode" unitNumber:a3];
            unsigned int v20 = [(UARPSuperBinaryBackDeploy *)self securityMode];
            goto LABEL_17;
          case 0xAu:
            id v18 = [(UARPSuperBinaryBackDeploy *)self tssKeyName:@"ProductionMode" unitNumber:a3];
            unsigned int v20 = [(UARPSuperBinaryBackDeploy *)self productionMode];
LABEL_17:
            if (v20) {
              ecidData = (NSData *)&__kCFBooleanTrue;
            }
            else {
              ecidData = (NSData *)&__kCFBooleanFalse;
            }
            goto LABEL_20;
          case 0x18u:
            id v18 = [(UARPSuperBinaryBackDeploy *)self tssKeyName:@"Nonce" unitNumber:a3];
            id v22 = [(UARPSuperBinaryBackDeploy *)self nonce];
            goto LABEL_28;
          case 0x19u:
            id v18 = [(UARPSuperBinaryBackDeploy *)self tssKeyName:@"Life" unitNumber:a3];
            uint64_t v23 = [(UARPSuperBinaryBackDeploy *)self life];
            goto LABEL_27;
          case 0x1Au:
            id v18 = [(UARPSuperBinaryBackDeploy *)self tssKeyName:@"Provisioning" unitNumber:a3];
            if (![(UARPSuperBinaryBackDeploy *)self provisioning]) {
              goto LABEL_29;
            }
            unint64_t v24 = self->_tssRequest;
            ecidData = (NSData *)&__kCFBooleanTrue;
            goto LABEL_21;
          case 0x1Bu:
            id v18 = [(UARPSuperBinaryBackDeploy *)self tssKeyName:@"ManifestEpoch" unitNumber:a3];
            uint64_t v23 = [(UARPSuperBinaryBackDeploy *)self manifestEpoch];
LABEL_27:
            id v22 = +[NSNumber numberWithUnsignedChar:v23];
LABEL_28:
            long long v25 = v22;
            [(NSMutableDictionary *)self->_tssRequest setObject:v22 forKeyedSubscript:v18];

            goto LABEL_29;
          case 0x1Du:
            id v18 = [(UARPSuperBinaryBackDeploy *)self tssKeyName:@"ECID" unitNumber:a3];
            ecidData = self->_ecidData;
LABEL_20:
            unint64_t v24 = self->_tssRequest;
LABEL_21:
            [(NSMutableDictionary *)v24 setObject:ecidData forKeyedSubscript:v18];
LABEL_29:

            break;
          default:
            continue;
        }
      }
      id v15 = [v13 countByEnumeratingWithState:&v29 objects:v33 count:16];
    }
    while (v15);
  }

  [(UARPSuperBinaryBackDeploy *)self processMeasurementsForTSSOptions:self->_tssRequest unitNumber:a3 asMeasurement:v28];
  long long v26 = +[NSDictionary dictionaryWithDictionary:self->_tssRequest];

  return v26;
}

- (id)tssKeyName:(id)a3 unitNumber:(unint64_t)a4
{
  id v6 = a3;
  id v7 = objc_opt_new();
  [v7 appendFormat:@"%@", self->_ticketPrefix];
  if (self->_prefixNeedsUnitNumber) {
    [v7 appendFormat:@"%lu", a4];
  }
  [v7 appendFormat:@",%@", v6];
  if (self->_suffixNeedsUnitNumber) {
    [v7 appendFormat:@",%lu", a4];
  }
  uint64_t v8 = +[NSString stringWithString:v7];

  return v8;
}

- (void)processMeasurementsForTSSOptions:(id)a3 unitNumber:(unint64_t)a4 asMeasurement:(BOOL)a5
{
  id v25 = a3;
  v34 = self;
  unsigned int v35 = objc_opt_new();
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  obj = self->_payloads;
  id v28 = [(NSMutableArray *)obj countByEnumeratingWithState:&v45 objects:v51 count:16];
  if (v28)
  {
    uint64_t v27 = *(void *)v46;
    do
    {
      for (i = 0; i != v28; i = (char *)i + 1)
      {
        if (*(void *)v46 != v27) {
          objc_enumerationMutation(obj);
        }
        id v7 = [*(id *)(*((void *)&v45 + 1) + 8 * i) measurements];
        long long v41 = 0u;
        long long v42 = 0u;
        long long v43 = 0u;
        long long v44 = 0u;
        id v30 = v7;
        id v32 = [v7 countByEnumeratingWithState:&v41 objects:v50 count:16];
        if (v32)
        {
          long long v29 = i;
          uint64_t v8 = 0;
          id v9 = 0;
          uint64_t v31 = *(void *)v42;
          do
          {
            uint64_t v10 = 0;
            do
            {
              if (*(void *)v42 != v31) {
                objc_enumerationMutation(v30);
              }
              uint64_t v33 = v10;
              unint64_t v11 = *(void **)(*((void *)&v41 + 1) + 8 * v10);
              long long v37 = 0u;
              long long v38 = 0u;
              long long v39 = 0u;
              long long v40 = 0u;
              id v12 = [v11 tlvs];
              id v13 = [v12 countByEnumeratingWithState:&v37 objects:v49 count:16];
              if (v13)
              {
                id v14 = v13;
                uint64_t v15 = *(void *)v38;
                do
                {
                  for (j = 0; j != v14; j = (char *)j + 1)
                  {
                    if (*(void *)v38 != v15) {
                      objc_enumerationMutation(v12);
                    }
                    long long v17 = *(void **)(*((void *)&v37 + 1) + 8 * (void)j);
                    objc_opt_class();
                    if (objc_opt_isKindOfClass())
                    {
                      id v18 = v17;
                      id v19 = [v18 longname];

                      id v9 = v19;
                    }
                    else
                    {
                      objc_opt_class();
                      if (objc_opt_isKindOfClass())
                      {
                        id v20 = v17;
                        id v21 = [v20 digest];

                        uint64_t v8 = v21;
                      }
                      else
                      {
                        objc_opt_class();
                        if ((objc_opt_isKindOfClass() & 1) != 0 && !a5)
                        {
                          if ([(UARPSuperBinaryBackDeploy *)v34 productionMode]) {
                            id v22 = &__kCFBooleanTrue;
                          }
                          else {
                            id v22 = &__kCFBooleanFalse;
                          }
                          [v35 setObject:v22 forKeyedSubscript:@"EPRO"];
                        }
                      }
                    }
                  }
                  id v14 = [v12 countByEnumeratingWithState:&v37 objects:v49 count:16];
                }
                while (v14);
              }

              uint64_t v10 = v33 + 1;
            }
            while ((id)(v33 + 1) != v32);
            id v32 = [v30 countByEnumeratingWithState:&v41 objects:v50 count:16];
          }
          while (v32);
          if (v9)
          {
            i = v29;
            if (v8) {
              [v35 setObject:v8 forKeyedSubscript:v9];
            }
          }
          else
          {
            i = v29;
          }
        }
        else
        {
          id v9 = 0;
          uint64_t v8 = 0;
        }
      }
      id v28 = [(NSMutableArray *)obj countByEnumeratingWithState:&v45 objects:v51 count:16];
    }
    while (v28);
  }

  uint64_t v23 = objc_opt_new();
  [v23 appendFormat:@"%@", v34->_ticketPrefix];
  if (v34->_prefixNeedsUnitNumber) {
    [v23 appendFormat:@"%lu", a4];
  }
  [v23 appendFormat:@",%@", v34->_ticketSuffix];
  [v25 setObject:v35 forKeyedSubscript:v23];
}

- (id)requiredTSSOptions
{
  v3 = objc_opt_new();
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v4 = self->_tlvs;
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
        id v9 = *(void **)(*((void *)&v14 + 1) + 8 * i);
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

- (id)getDataBlock:(unint64_t)a3 offset:(unint64_t)a4
{
  id v5 = -[NSData subdataWithRange:](self->_data, "subdataWithRange:", a4, a3);
  self->_totalBytesRequested += [(NSData *)v5 length];

  return v5;
}

- (void)logInternal:(id)a3 arguments:(char *)a4
{
  id v6 = a3;
  id v7 = [objc_alloc((Class)NSMutableString) initWithFormat:v6 arguments:a4];

  [v7 appendString:@"\n"];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained)
  {
    delegateQueue = self->_delegateQueue;
    if (delegateQueue)
    {
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3254779904;
      v12[2] = sub_100027120;
      v12[3] = &unk_1000596E0;
      v12[4] = self;
      id v13 = v7;
      dispatch_async(delegateQueue, v12);
      id v10 = v13;
    }
    else
    {
      id v11 = objc_loadWeakRetained((id *)&self->_delegate);
      [v11 superbinary:self logString:v7];
      id v10 = v11;
    }
  }
}

- (void)log:(id)a3
{
  [(UARPSuperBinaryBackDeploy *)self logInternal:a3 arguments:&v3];
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

- (NSData)ecidData
{
  return (NSData *)objc_getProperty(self, a2, 184, 1);
}

- (void)setEcidData:(id)a3
{
}

- (NSData)nonce
{
  return (NSData *)objc_getProperty(self, a2, 192, 1);
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

- (unsigned)life
{
  return self->_life;
}

- (void)setLife:(unsigned __int8)a3
{
  self->_life = a3;
}

- (BOOL)provisioning
{
  return self->_provisioning;
}

- (void)setProvisioning:(BOOL)a3
{
  self->_provisioning = a3;
}

- (unsigned)manifestEpoch
{
  return self->_manifestEpoch;
}

- (void)setManifestEpoch:(unsigned __int8)a3
{
  self->_manifestEpoch = a3;
}

- (NSNumber)trustedOverride
{
  return (NSNumber *)objc_getProperty(self, a2, 200, 1);
}

- (void)setTrustedOverride:(id)a3
{
}

- (NSNumber)demote
{
  return (NSNumber *)objc_getProperty(self, a2, 208, 1);
}

- (void)setDemote:(id)a3
{
}

- (BOOL)needsHostPersonalization
{
  return self->_needsHostPersonalization;
}

- (NSArray)tlvs
{
  return (NSArray *)objc_getProperty(self, a2, 64, 1);
}

- (NSArray)payloads
{
  return (NSArray *)objc_getProperty(self, a2, 80, 1);
}

- (void)layer2Context
{
  return self->_layer2Context;
}

- (void)setLayer2Context:(void *)a3
{
  self->_layer2Context = a3;
}

- (unint64_t)totalLength
{
  return self->_totalLength;
}

- (unint64_t)totalBytesRequested
{
  return self->_totalBytesRequested;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_demote, 0);
  objc_storeStrong((id *)&self->_trustedOverride, 0);
  objc_storeStrong((id *)&self->_nonce, 0);
  objc_storeStrong((id *)&self->_ecidData, 0);
  objc_storeStrong((id *)&self->_measurements, 0);
  objc_storeStrong((id *)&self->_ticketSuffix, 0);
  objc_storeStrong((id *)&self->_ticketPrefix, 0);
  objc_storeStrong((id *)&self->_keyManifest, 0);
  objc_storeStrong((id *)&self->_tssRequest, 0);
  objc_storeStrong((id *)&self->_manifest, 0);
  objc_storeStrong((id *)&self->_tatsuMeasurements, 0);
  objc_storeStrong((id *)&self->_payloads, 0);
  objc_storeStrong((id *)&self->_trimmedTlvs, 0);
  objc_storeStrong((id *)&self->_tlvs, 0);
  objc_storeStrong((id *)&self->_metaData, 0);
  objc_storeStrong((id *)&self->_version, 0);
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_delegateQueue, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end
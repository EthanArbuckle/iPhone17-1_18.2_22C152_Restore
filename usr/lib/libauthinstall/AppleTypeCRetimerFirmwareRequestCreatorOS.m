@interface AppleTypeCRetimerFirmwareRequestCreatorOS
- (AppleTypeCRetimerFirmwareRequestCreatorOS)initWithOptions:(id)a3 logFunction:(void *)a4 logContext:(void *)a5;
- (BOOL)parseOptions:(id)a3;
- (NSDictionary)requestDictionary;
- (id)generateHashForSubfile:(id)a3;
- (void)generateRequestDictionary;
@end

@implementation AppleTypeCRetimerFirmwareRequestCreatorOS

- (AppleTypeCRetimerFirmwareRequestCreatorOS)initWithOptions:(id)a3 logFunction:(void *)a4 logContext:(void *)a5
{
  id v8 = a3;
  v13.receiver = self;
  v13.super_class = (Class)AppleTypeCRetimerFirmwareRequestCreatorOS;
  v9 = [(AppleTypeCRetimerRestoreInfoHelperOS *)&v13 initWithOptions:v8 logFunction:a4 logContext:a5];
  v10 = v9;
  if (v9)
  {
    if (![(AppleTypeCRetimerFirmwareRequestCreatorOS *)v9 parseOptions:v8])
    {
      v11 = 0;
      goto LABEL_6;
    }
    [(AppleTypeCRetimerFirmwareRequestCreatorOS *)v10 generateRequestDictionary];
  }
  v11 = v10;
LABEL_6:

  return v11;
}

- (BOOL)parseOptions:(id)a3
{
  id v4 = a3;
  id v5 = (id)[v4 objectForKeyedSubscript:@"FirmwareData"];
  if (!v5)
  {
    v32 = @"Unable to locate firmware data";
LABEL_14:
    [(AppleTypeCRetimerRestoreInfoHelperOS *)self log:v32];
    BOOL v25 = 0;
    goto LABEL_15;
  }
  v6 = [[FTABFileOS alloc] initWithData:v5];
  ftab = self->_ftab;
  self->_ftab = v6;

  id v8 = self->_ftab;
  if (!v8)
  {
    v32 = @"Failed to parse ftab";
    goto LABEL_14;
  }
  v9 = (FTABSubfileOS *)[(FTABFileOS *)v8 subfileWithTag:@"rrko"];
  rrko = self->_rrko;
  self->_rrko = v9;

  if (!self->_rrko)
  {
    v32 = @"Failed to locate rrko file in ftab";
    goto LABEL_14;
  }
  v11 = (FTABSubfileOS *)[(FTABFileOS *)self->_ftab subfileWithTag:@"rkos"];
  rkos = self->_rkos;
  self->_rkos = v11;

  if (!self->_rkos)
  {
    v32 = @"Failed to locate rkos file in ftab";
    goto LABEL_14;
  }
  id v13 = (id)[v4 objectForKeyedSubscript:@"DeviceInfo"];
  v14 = v13;
  if (v13)
  {
    id v15 = (id)[v13 objectForKeyedSubscript:@"TagNumber"];
    v16 = v15;
    if (v15)
    {
      self->_tagNumber = [v15 unsignedCharValue];
      id v17 = (id)[v14 objectForKeyedSubscript:@"HardwareID"];
      v18 = v17;
      if (v17)
      {
        id v19 = (id)[v17 objectForKeyedSubscript:@"ChipID"];
        self->_chipID = [v19 unsignedShortValue];
        id v20 = (id)[v18 objectForKeyedSubscript:@"BoardID"];
        self->_boardID = [v20 unsignedShortValue];
        id v21 = (id)[v18 objectForKeyedSubscript:@"SecurityEpoch"];
        self->_securityEpoch = [v21 unsignedCharValue];
        id v39 = (id)[v18 objectForKeyedSubscript:@"ProductionStatus"];
        self->_productionStatus = [v39 unsignedCharValue];
        id v38 = (id)[v18 objectForKeyedSubscript:@"SecurityMode"];
        self->_securityMode = [v38 unsignedCharValue];
        id v37 = (id)[v18 objectForKeyedSubscript:@"SecurityDomain"];
        self->_securityDomain = [v37 unsignedCharValue];
        id v36 = (id)[v18 objectForKeyedSubscript:@"ECID"];
        self->_ecid = [v36 unsignedLongLongValue];
        v22 = (NSData *)(id)[v18 objectForKeyedSubscript:@"Nonce"];
        nonce = self->_nonce;
        self->_nonce = v22;

        v24 = self->_nonce;
        BOOL v25 = v24 != 0;
        if (v24)
        {
          id v35 = v19;
          id v26 = (id)[v18 objectForKeyedSubscript:@"ChipRev"];
          self->_chipRev = [v26 unsignedCharValue];
          v34 = v16;
          id v27 = v21;
          id v28 = v20;
          id v29 = (id)[v18 objectForKeyedSubscript:@"Demote"];
          self->_demote = [v29 BOOLValue];
          v30 = v29;
          id v20 = v28;
          id v21 = v27;
          v16 = v34;

          v31 = v26;
          id v19 = v35;
        }
        else
        {
          [(AppleTypeCRetimerRestoreInfoHelperOS *)self log:@"Nonce missing from hardware dictionary"];
        }
      }
      else
      {
        [(AppleTypeCRetimerRestoreInfoHelperOS *)self log:@"Unable to locate hardware ID data"];
        BOOL v25 = 0;
      }
    }
    else
    {
      [(AppleTypeCRetimerRestoreInfoHelperOS *)self log:@"Unable to locate tag number in device info"];
      BOOL v25 = 0;
    }
  }
  else
  {
    [(AppleTypeCRetimerRestoreInfoHelperOS *)self log:@"Unable to locate device info"];
    BOOL v25 = 0;
  }

LABEL_15:
  return v25;
}

- (id)generateHashForSubfile:(id)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  memset(&v8, 0, sizeof(v8));
  id v3 = a3;
  CC_SHA384_Init(&v8);
  id v4 = (const void *)[v3 dataPointer:v8.count v8.hash v8.hash[2] v8.hash[4] v8.hash[6] v8.wbuf v8.wbuf[2] v8.wbuf[4] v8.wbuf[6] v8.wbuf[8] v8.wbuf[10] v8.wbuf[12] v8.wbuf[14]];
  CC_LONG v5 = [v3 dataLength];

  CC_SHA384_Update(&v8, v4, v5);
  CC_SHA384_Final(md, &v8);
  id v6 = (id)[MEMORY[0x263EFF8F8] dataWithBytes:md length:48];

  return v6;
}

- (void)generateRequestDictionary
{
  v62[4] = *MEMORY[0x263EF8340];
  uint64_t tagNumber = self->_tagNumber;
  id v4 = (id)[MEMORY[0x263EFF9A0] dictionary];
  uint64_t v49 = tagNumber;
  id v5 = (id)[NSString stringWithValidatedFormat:@"@Timer%u,Ticket" validFormatSpecifiers:@"%u" error:0, tagNumber];
  uint64_t v6 = MEMORY[0x263EFFA88];
  id v45 = v5;
  [v4 setObject:forKeyedSubscript:];
  id v7 = (id)[NSString stringWithValidatedFormat: @"Timer,BoardID,%u" validFormatSpecifiers:@"%u" error:0 tagNumber];
  id v8 = (id)[NSNumber numberWithUnsignedShort:self->_boardID];
  v44 = v7;
  [v4 setObject:v8 forKeyedSubscript:v7];

  id v9 = (id)[NSString stringWithValidatedFormat: @"Timer,ChipID,%u" validFormatSpecifiers:@"%u" error:0, tagNumber];
  id v10 = (id)[NSNumber numberWithUnsignedShort:self->_chipID];
  id v52 = v9;
  [v4 setObject:v10 forKeyedSubscript:v9];

  id v11 = (id)[NSString stringWithValidatedFormat:@"Timer,ECID,%u" validFormatSpecifiers:@"%u" error:0 tagNumber];
  id v12 = (id)[NSNumber numberWithUnsignedLongLong:self->_ecid];
  id v51 = v11;
  [v4 setObject:v12 forKeyedSubscript:v11];

  id v50 = (id)[NSString stringWithValidatedFormat:@"Timer,Nonce,%u" validFormatSpecifiers:@"%u" error:0, tagNumber];
  [v4 setObject:self->_nonce forKeyedSubscript:];
  id v13 = (id)[NSString stringWithValidatedFormat: @"Timer,ProductionMode,%u" validFormatSpecifiers:@"%u" error:nil];
  uint64_t v14 = MEMORY[0x263EFFA80];
  uint64_t v15 = v6;
  if (self->_productionStatus) {
    uint64_t v16 = v6;
  }
  else {
    uint64_t v16 = MEMORY[0x263EFFA80];
  }
  id v48 = v13;
  [v4 setObject:v16 forKeyedSubscript:];
  id v17 = (id)[NSString stringWithValidatedFormat:@"Timer,SecurityDomain,%u" validFormatSpecifiers:@"%u" error:nil];
  id v18 = (id)[NSNumber numberWithUnsignedChar:self->_securityDomain];
  id v47 = v17;
  id v19 = v17;
  uint64_t v20 = v15;
  uint64_t v21 = v14;
  [v4 setObject:v18 forKeyedSubscript:v19];

  id v22 = (id)[NSString stringWithValidatedFormat: @"Timer,SecurityMode,%u" validFormatSpecifiers: @"%u" error: 0 tagNumber];
  if (self->_securityMode) {
    uint64_t v23 = v20;
  }
  else {
    uint64_t v23 = v14;
  }
  id v46 = v22;
  [v4 setObject:v23 forKeyedSubscript:];
  id v54 = [(AppleTypeCRetimerFirmwareRequestCreatorOS *)self generateHashForSubfile:self->_rkos];
  id v53 = (id)[NSString stringWithValidatedFormat:@"Timer,RTKitOS,%u" validFormatSpecifiers:@"%u" error:0, tagNumber];
  int productionStatus = self->_productionStatus;
  if (self->_demote && self->_productionStatus)
  {
    v59[0] = @"Digest";
    v59[1] = @"EPRO";
    v60[0] = v54;
    v60[1] = v14;
    v59[2] = @"DPRO";
    v59[3] = @"ESEC";
    v60[2] = v20;
    v60[3] = v20;
    v59[4] = @"Trusted";
    v60[4] = v14;
    BOOL v25 = NSDictionary;
    id v26 = v60;
    id v27 = v59;
    uint64_t v28 = 5;
  }
  else
  {
    v61[0] = @"Digest";
    v61[1] = @"EPRO";
    if (productionStatus) {
      uint64_t v29 = v20;
    }
    else {
      uint64_t v29 = v14;
    }
    v62[0] = v54;
    v62[1] = v29;
    if (self->_securityMode) {
      uint64_t v30 = v20;
    }
    else {
      uint64_t v30 = v14;
    }
    v61[2] = @"ESEC";
    v61[3] = @"Trusted";
    v62[2] = v30;
    v62[3] = v20;
    BOOL v25 = NSDictionary;
    id v26 = v62;
    id v27 = v61;
    uint64_t v28 = 4;
  }
  id v31 = (id)[v25 dictionaryWithObjects:v26 forKeys:v27 count:v28];
  [v4 setObject:v31 forKeyedSubscript:v53];

  id v32 = [(AppleTypeCRetimerFirmwareRequestCreatorOS *)self generateHashForSubfile:self->_rrko];
  id v33 = (id)[NSString stringWithValidatedFormat:@"Timer,RestoreRTKitOS,%u", @"%u", 0, v49];
  int v34 = self->_productionStatus;
  if (self->_demote && self->_productionStatus)
  {
    v55[0] = @"Digest";
    v55[1] = @"EPRO";
    v56[0] = v32;
    v56[1] = v21;
    v55[2] = @"DPRO";
    v55[3] = @"ESEC";
    v56[2] = v20;
    v56[3] = v20;
    v55[4] = @"Trusted";
    v56[4] = v21;
    id v35 = NSDictionary;
    id v36 = v56;
    id v37 = v55;
    uint64_t v38 = 5;
  }
  else
  {
    v57[0] = @"Digest";
    v57[1] = @"EPRO";
    if (v34) {
      uint64_t v39 = v20;
    }
    else {
      uint64_t v39 = v21;
    }
    v58[0] = v32;
    v58[1] = v39;
    if (self->_securityMode) {
      uint64_t v40 = v20;
    }
    else {
      uint64_t v40 = v21;
    }
    v57[2] = @"ESEC";
    v57[3] = @"Trusted";
    v58[2] = v40;
    v58[3] = v20;
    id v35 = NSDictionary;
    id v36 = v58;
    id v37 = v57;
    uint64_t v38 = 4;
  }
  id v41 = (id)[v35 dictionaryWithObjects:v36 forKeys:v37 count:v38];
  [v4 setObject:v41 forKeyedSubscript:v33];

  v42 = (NSDictionary *)(id)[NSDictionary dictionaryWithDictionary:v4];
  requestDictionary = self->_requestDictionary;
  self->_requestDictionary = v42;

  [(AppleTypeCRetimerRestoreInfoHelperOS *)self verboseLog:@"ATCRT %u: request dictionary = %@", self->_tagNumber - 1, self->_requestDictionary];
}

- (NSDictionary)requestDictionary
{
  return (NSDictionary *)objc_getProperty(self, a2, 96, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestDictionary, 0);
  objc_storeStrong((id *)&self->_nonce, 0);
  objc_storeStrong((id *)&self->_rrko, 0);
  objc_storeStrong((id *)&self->_rkos, 0);

  objc_storeStrong((id *)&self->_ftab, 0);
}

@end
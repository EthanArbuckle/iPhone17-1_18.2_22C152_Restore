@interface AppleTypeCRetimerFirmwareRequestCreatorBackDeploy
- (AppleTypeCRetimerFirmwareRequestCreatorBackDeploy)initWithOptions:(id)a3 logFunction:(void *)a4 logContext:(void *)a5;
- (BOOL)parseOptions:(id)a3;
- (NSDictionary)requestDictionary;
- (id)generateHashForSubfile:(id)a3;
- (void)generateRequestDictionary;
@end

@implementation AppleTypeCRetimerFirmwareRequestCreatorBackDeploy

- (AppleTypeCRetimerFirmwareRequestCreatorBackDeploy)initWithOptions:(id)a3 logFunction:(void *)a4 logContext:(void *)a5
{
  id v8 = a3;
  v13.receiver = self;
  v13.super_class = (Class)AppleTypeCRetimerFirmwareRequestCreatorBackDeploy;
  v9 = [(AppleTypeCRetimerRestoreInfoHelperBackDeploy *)&v13 initWithOptions:v8 logFunction:a4 logContext:a5];
  v10 = v9;
  if (v9)
  {
    if (![(AppleTypeCRetimerFirmwareRequestCreatorBackDeploy *)v9 parseOptions:v8])
    {
      v11 = 0;
      goto LABEL_6;
    }
    [(AppleTypeCRetimerFirmwareRequestCreatorBackDeploy *)v10 generateRequestDictionary];
  }
  v11 = v10;
LABEL_6:

  return v11;
}

- (BOOL)parseOptions:(id)a3
{
  id v4 = a3;
  id v5 = [v4 objectForKeyedSubscript:@"FirmwareData"];
  if (!v5)
  {
    CFStringRef v32 = @"Unable to locate firmware data";
LABEL_14:
    [(AppleTypeCRetimerRestoreInfoHelperBackDeploy *)self log:v32];
    BOOL v25 = 0;
    goto LABEL_15;
  }
  v6 = [[FTABFileBackDeploy alloc] initWithData:v5];
  v7 = *(void **)(&self->super._verbose + 1);
  *(void *)(&self->super._verbose + 1) = v6;

  id v8 = *(void **)(&self->super._verbose + 1);
  if (!v8)
  {
    CFStringRef v32 = @"Failed to parse ftab";
    goto LABEL_14;
  }
  v9 = (FTABSubfileBackDeploy *)[v8 subfileWithTag:@"rrko"];
  v10 = *(FTABSubfileBackDeploy **)((char *)&self->_rkos + 1);
  *(FTABSubfileBackDeploy **)((char *)&self->_rkos + 1) = v9;

  if (!*(FTABSubfileBackDeploy **)((char *)&self->_rkos + 1))
  {
    CFStringRef v32 = @"Failed to locate rrko file in ftab";
    goto LABEL_14;
  }
  v11 = (FTABFileBackDeploy *)[*(id *)(&self->super._verbose + 1) subfileWithTag:@"rkos"];
  v12 = *(FTABFileBackDeploy **)((char *)&self->_ftab + 1);
  *(FTABFileBackDeploy **)((char *)&self->_ftab + 1) = v11;

  if (!*(FTABFileBackDeploy **)((char *)&self->_ftab + 1))
  {
    CFStringRef v32 = @"Failed to locate rkos file in ftab";
    goto LABEL_14;
  }
  id v13 = [v4 objectForKeyedSubscript:@"DeviceInfo"];
  v14 = v13;
  if (v13)
  {
    id v15 = [v13 objectForKeyedSubscript:@"TagNumber"];
    v16 = v15;
    if (v15)
    {
      BYTE1(self->_rrko) = [v15 unsignedCharValue];
      id v17 = [v14 objectForKeyedSubscript:@"HardwareID"];
      v18 = v17;
      if (v17)
      {
        id v19 = [v17 objectForKeyedSubscript:@"ChipID"];
        *(_WORD *)((char *)&self->_rrko + 3) = (unsigned __int16)[v19 unsignedShortValue];
        id v20 = [v18 objectForKeyedSubscript:@"BoardID"];
        *(_WORD *)((char *)&self->_rrko + 5) = (unsigned __int16)[v20 unsignedShortValue];
        id v21 = [v18 objectForKeyedSubscript:@"SecurityEpoch"];
        HIBYTE(self->_rrko) = [v21 unsignedCharValue];
        id v39 = [v18 objectForKeyedSubscript:@"ProductionStatus"];
        self->_tagNumber = [v39 unsignedCharValue];
        id v38 = [v18 objectForKeyedSubscript:@"SecurityMode"];
        *(&self->_tagNumber + 1) = [v38 unsignedCharValue];
        id v37 = [v18 objectForKeyedSubscript:@"SecurityDomain"];
        LOBYTE(self->_chipID) = [v37 unsignedCharValue];
        id v36 = [v18 objectForKeyedSubscript:@"ECID"];
        *(void *)&self->_securityDomain = [v36 unsignedLongLongValue];
        id v22 = [v18 objectForKeyedSubscript:@"Nonce"];
        v23 = *(void **)((char *)&self->_ecid + 1);
        *(unint64_t *)((char *)&self->_ecid + 1) = (unint64_t)v22;

        uint64_t v24 = *(unint64_t *)((char *)&self->_ecid + 1);
        BOOL v25 = v24 != 0;
        if (v24)
        {
          id v35 = v19;
          id v26 = [v18 objectForKeyedSubscript:@"ChipRev"];
          BYTE1(self->_nonce) = [v26 unsignedCharValue];
          v34 = v16;
          id v27 = v21;
          id v28 = v20;
          id v29 = [v18 objectForKeyedSubscript:@"Demote"];
          BYTE2(self->_nonce) = [v29 BOOLValue];
          v30 = v29;
          id v20 = v28;
          id v21 = v27;
          v16 = v34;

          v31 = v26;
          id v19 = v35;
        }
        else
        {
          [(AppleTypeCRetimerRestoreInfoHelperBackDeploy *)self log:@"Nonce missing from hardware dictionary"];
        }
      }
      else
      {
        [(AppleTypeCRetimerRestoreInfoHelperBackDeploy *)self log:@"Unable to locate hardware ID data"];
        BOOL v25 = 0;
      }
    }
    else
    {
      [(AppleTypeCRetimerRestoreInfoHelperBackDeploy *)self log:@"Unable to locate tag number in device info"];
      BOOL v25 = 0;
    }
  }
  else
  {
    [(AppleTypeCRetimerRestoreInfoHelperBackDeploy *)self log:@"Unable to locate device info"];
    BOOL v25 = 0;
  }

LABEL_15:
  return v25;
}

- (id)generateHashForSubfile:(id)a3
{
  memset(&v8, 0, sizeof(v8));
  id v3 = a3;
  CC_SHA384_Init(&v8);
  id v4 = [v3 dataPointer:*(_OWORD *)v8.count, *(_OWORD *)v8.hash, *(_OWORD *)&v8.hash[2], *(_OWORD *)&v8.hash[4], *(_OWORD *)&v8.hash[6], *(_OWORD *)v8.wbuf, *(_OWORD *)&v8.wbuf[2], *(_OWORD *)&v8.wbuf[4], *(_OWORD *)&v8.wbuf[6], *(_OWORD *)&v8.wbuf[8], *(_OWORD *)&v8.wbuf[10], *(_OWORD *)&v8.wbuf[12], *(_OWORD *)&v8.wbuf[14]];
  CC_LONG v5 = [v3 dataLength];

  CC_SHA384_Update(&v8, v4, v5);
  CC_SHA384_Final(md, &v8);
  v6 = +[NSData dataWithBytes:md length:48];

  return v6;
}

- (void)generateRequestDictionary
{
  uint64_t v3 = BYTE1(self->_rrko);
  id v4 = +[NSMutableDictionary dictionary];
  uint64_t v40 = v3;
  id v36 = +[NSString stringWithValidatedFormat:@"@Timer%u,Ticket", @"%u", 0, v3 validFormatSpecifiers error];
  [v4 setObject:forKeyedSubscript:];
  CC_LONG v5 = +[NSString stringWithValidatedFormat:@"Timer,BoardID,%u", @"%u", 0, v3 validFormatSpecifiers error];
  v6 = +[NSNumber numberWithUnsignedShort:*(unsigned __int16 *)((char *)&self->_rrko + 5)];
  id v35 = v5;
  [v4 setObject:v6 forKeyedSubscript:v5];

  v7 = +[NSString stringWithValidatedFormat:@"Timer,ChipID,%u", @"%u", 0, v3 validFormatSpecifiers error];
  CC_SHA512_CTX v8 = +[NSNumber numberWithUnsignedShort:*(unsigned __int16 *)((char *)&self->_rrko + 3)];
  v42 = v7;
  [v4 setObject:v8 forKeyedSubscript:v7];

  v9 = +[NSString stringWithValidatedFormat:@"Timer,ECID,%u", @"%u", 0, v3 validFormatSpecifiers error];
  v10 = +[NSNumber numberWithUnsignedLongLong:*(void *)&self->_securityDomain];
  [v4 setObject:v10 forKeyedSubscript:v9];

  v41 = +[NSString stringWithValidatedFormat:@"Timer,Nonce,%u", @"%u", 0, v3 validFormatSpecifiers error];
  [v4 setObject:*(unint64_t *)((char *)&self->_ecid + 1) forKeyedSubscript:];
  v11 = +[NSString stringWithValidatedFormat:@"Timer,ProductionMode,%u", @"%u", 0, v3 validFormatSpecifiers error];
  if (self->_tagNumber) {
    v12 = &__kCFBooleanTrue;
  }
  else {
    v12 = &__kCFBooleanFalse;
  }
  id v39 = v11;
  [v4 setObject:v12 forKeyedSubscript:];
  id v13 = +[NSString stringWithValidatedFormat:@"Timer,SecurityDomain,%u", @"%u", 0, v3 validFormatSpecifiers error];
  v14 = +[NSNumber numberWithUnsignedChar:LOBYTE(self->_chipID)];
  id v38 = v13;
  [v4 setObject:v14 forKeyedSubscript:v13];

  id v15 = +[NSString stringWithValidatedFormat:@"Timer,SecurityMode,%u", @"%u", 0, v3 validFormatSpecifiers error];
  if (*(&self->_tagNumber + 1)) {
    v16 = &__kCFBooleanTrue;
  }
  else {
    v16 = &__kCFBooleanFalse;
  }
  id v37 = v15;
  [v4 setObject:v16 forKeyedSubscript:];
  id v44 = [(AppleTypeCRetimerFirmwareRequestCreatorBackDeploy *)self generateHashForSubfile:*(FTABFileBackDeploy **)((char *)&self->_ftab + 1)];
  v43 = +[NSString stringWithValidatedFormat:@"Timer,RTKitOS,%u", @"%u", 0, v3 validFormatSpecifiers error];
  int tagNumber = self->_tagNumber;
  if (BYTE2(self->_nonce) && self->_tagNumber)
  {
    v49[0] = @"Digest";
    v49[1] = @"EPRO";
    v50[0] = v44;
    v50[1] = &__kCFBooleanFalse;
    v49[2] = @"DPRO";
    v49[3] = @"ESEC";
    v50[2] = &__kCFBooleanTrue;
    v50[3] = &__kCFBooleanTrue;
    v49[4] = @"Trusted";
    v50[4] = &__kCFBooleanFalse;
    v18 = v50;
    id v19 = v49;
    uint64_t v20 = 5;
  }
  else
  {
    v51[0] = @"Digest";
    v51[1] = @"EPRO";
    if (tagNumber) {
      id v21 = &__kCFBooleanTrue;
    }
    else {
      id v21 = &__kCFBooleanFalse;
    }
    v52[0] = v44;
    v52[1] = v21;
    if (*(&self->_tagNumber + 1)) {
      id v22 = &__kCFBooleanTrue;
    }
    else {
      id v22 = &__kCFBooleanFalse;
    }
    v51[2] = @"ESEC";
    v51[3] = @"Trusted";
    v52[2] = v22;
    v52[3] = &__kCFBooleanTrue;
    v18 = v52;
    id v19 = v51;
    uint64_t v20 = 4;
  }
  v23 = +[NSDictionary dictionaryWithObjects:v18 forKeys:v19 count:v20];
  [v4 setObject:v23 forKeyedSubscript:v43];

  id v24 = [(AppleTypeCRetimerFirmwareRequestCreatorBackDeploy *)self generateHashForSubfile:*(FTABSubfileBackDeploy **)((char *)&self->_rkos + 1)];
  BOOL v25 = +[NSString stringWithValidatedFormat:@"Timer,RestoreRTKitOS,%u", @"%u", 0, v40 validFormatSpecifiers error];
  int v26 = self->_tagNumber;
  if (BYTE2(self->_nonce) && self->_tagNumber)
  {
    v45[0] = @"Digest";
    v45[1] = @"EPRO";
    v46[0] = v24;
    v46[1] = &__kCFBooleanFalse;
    v45[2] = @"DPRO";
    v45[3] = @"ESEC";
    v46[2] = &__kCFBooleanTrue;
    v46[3] = &__kCFBooleanTrue;
    v45[4] = @"Trusted";
    v46[4] = &__kCFBooleanFalse;
    id v27 = v46;
    id v28 = v45;
    uint64_t v29 = 5;
  }
  else
  {
    v47[0] = @"Digest";
    v47[1] = @"EPRO";
    if (v26) {
      v30 = &__kCFBooleanTrue;
    }
    else {
      v30 = &__kCFBooleanFalse;
    }
    v48[0] = v24;
    v48[1] = v30;
    if (*(&self->_tagNumber + 1)) {
      v31 = &__kCFBooleanTrue;
    }
    else {
      v31 = &__kCFBooleanFalse;
    }
    v47[2] = @"ESEC";
    v47[3] = @"Trusted";
    v48[2] = v31;
    v48[3] = &__kCFBooleanTrue;
    id v27 = v48;
    id v28 = v47;
    uint64_t v29 = 4;
  }
  CFStringRef v32 = +[NSDictionary dictionaryWithObjects:v27 forKeys:v28 count:v29];
  [v4 setObject:v32 forKeyedSubscript:v25];

  v33 = +[NSDictionary dictionaryWithDictionary:v4];
  v34 = *(void **)&self->_demote;
  *(void *)&self->_demote = v33;

  [(AppleTypeCRetimerRestoreInfoHelperBackDeploy *)self verboseLog:@"ATCRT %u: request dictionary = %@", BYTE1(self->_rrko) - 1, *(void *)&self->_demote];
}

- (NSDictionary)requestDictionary
{
  return (NSDictionary *)objc_getProperty(self, a2, 89, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_demote, 0);
  objc_storeStrong((id *)((char *)&self->_ecid + 1), 0);
  objc_storeStrong((id *)((char *)&self->_rkos + 1), 0);
  objc_storeStrong((id *)((char *)&self->_ftab + 1), 0);

  objc_storeStrong((id *)(&self->super._verbose + 1), 0);
}

@end
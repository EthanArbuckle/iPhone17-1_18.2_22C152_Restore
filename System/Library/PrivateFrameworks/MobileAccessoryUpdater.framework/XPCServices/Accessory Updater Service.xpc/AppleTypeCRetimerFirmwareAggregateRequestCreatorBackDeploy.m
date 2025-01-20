@interface AppleTypeCRetimerFirmwareAggregateRequestCreatorBackDeploy
- (AppleTypeCRetimerFirmwareAggregateRequestCreatorBackDeploy)initWithOptions:(id)a3 logFunction:(void *)a4 logContext:(void *)a5;
- (BOOL)generateRequestDictionary;
- (BOOL)parseOptions:(id)a3;
- (NSDictionary)requestDictionary;
- (id)generateHashForData:(id)a3;
@end

@implementation AppleTypeCRetimerFirmwareAggregateRequestCreatorBackDeploy

- (AppleTypeCRetimerFirmwareAggregateRequestCreatorBackDeploy)initWithOptions:(id)a3 logFunction:(void *)a4 logContext:(void *)a5
{
  id v8 = a3;
  v13.receiver = self;
  v13.super_class = (Class)AppleTypeCRetimerFirmwareAggregateRequestCreatorBackDeploy;
  v9 = [(AppleTypeCRetimerRestoreInfoHelperBackDeploy *)&v13 initWithOptions:v8 logFunction:a4 logContext:a5];
  v10 = v9;
  if (!v9
    || [(AppleTypeCRetimerFirmwareAggregateRequestCreatorBackDeploy *)v9 parseOptions:v8]
    && [(AppleTypeCRetimerFirmwareAggregateRequestCreatorBackDeploy *)v10 generateRequestDictionary])
  {
    v11 = v10;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (BOOL)parseOptions:(id)a3
{
  id v4 = a3;
  id v5 = [v4 objectForKeyedSubscript:@"FirmwareData"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v6 = [[FTABFileBackDeploy alloc] initWithData:v5];
    v7 = v6;
    if (v6)
    {
      id v8 = [(FTABFileBackDeploy *)v6 subfileWithTag:@"rrko"];
      if (v8)
      {
        v9 = v8;
        v10 = (NSData *)[v8 data];
        v11 = *(NSData **)((char *)&self->_rkosData + 1);
        *(NSData **)((char *)&self->_rkosData + 1) = v10;

        id v12 = [(FTABFileBackDeploy *)v7 subfileWithTag:@"rkos"];
        if (v12)
        {
          objc_super v13 = v12;
          id v14 = [v12 data];
          v15 = *(void **)(&self->super._verbose + 1);
          *(void *)(&self->super._verbose + 1) = v14;

          id v16 = [(FTABFileBackDeploy *)v7 subfileWithTag:@"cphy"];
          v17 = v16;
          if (v16)
          {
            v18 = (NSData *)[v16 data];
            v19 = *(NSData **)((char *)&self->_rrkoData + 1);
            *(NSData **)((char *)&self->_rrkoData + 1) = v18;
          }
          else
          {
            [(AppleTypeCRetimerRestoreInfoHelperBackDeploy *)self log:@"No cphy data found"];
          }

          goto LABEL_32;
        }
        [(AppleTypeCRetimerRestoreInfoHelperBackDeploy *)self log:@"Failed to locate rkos file in ftab"];

        goto LABEL_31;
      }
      CFStringRef v40 = @"Failed to locate rrko file in ftab";
    }
    else
    {
      v21 = [[UARPSuperBinaryBackDeploy alloc] initWithData:v5 delegate:0 delegateQueue:0];
      if (v21)
      {
        v22 = v21;
        v23 = [[UARPAssetTagBackDeploy alloc] initWithString:@"RRKO"];
        id v24 = [(UARPSuperBinaryBackDeploy *)v22 payloadWith4ccTag:v23];
        v25 = v24;
        if (v24)
        {
          v26 = (NSData *)[v24 payloadData];
          v27 = *(NSData **)((char *)&self->_rkosData + 1);
          *(NSData **)((char *)&self->_rkosData + 1) = v26;

          v28 = [[UARPAssetTagBackDeploy alloc] initWithString:@"FIRM"];
          id v29 = [(UARPSuperBinaryBackDeploy *)v22 payloadWith4ccTag:v28];
          if (v29)
          {
            v51 = v28;
            v30 = [FTABFileBackDeploy alloc];
            id v31 = [v29 payloadData];
            v32 = [(FTABFileBackDeploy *)v30 initWithData:v31];

            if (v32)
            {
              id v33 = [(FTABFileBackDeploy *)v32 subfileWithTag:@"rkos"];
              if (v33)
              {
                id v50 = v33;
                id v34 = [v33 data];
                v35 = *(void **)(&self->super._verbose + 1);
                *(void *)(&self->super._verbose + 1) = v34;

                id v36 = [(FTABFileBackDeploy *)v32 subfileWithTag:@"cphy"];
                v37 = v36;
                if (v36)
                {
                  v38 = (NSData *)[v36 data];
                  v39 = *(NSData **)((char *)&self->_rrkoData + 1);
                  *(NSData **)((char *)&self->_rrkoData + 1) = v38;
                }
                else
                {
                  [(AppleTypeCRetimerRestoreInfoHelperBackDeploy *)self log:@"No cphy data found"];
                }

                int v41 = 0;
                v42 = v50;
              }
              else
              {
                [(AppleTypeCRetimerRestoreInfoHelperBackDeploy *)self log:@"Failed to locate rkos file in super binary ftab"];
                v42 = 0;
                int v41 = 1;
              }
            }
            else
            {
              [(AppleTypeCRetimerRestoreInfoHelperBackDeploy *)self log:@"Failed to parse FTAB in super binary"];
              int v41 = 1;
            }

            v28 = v51;
          }
          else
          {
            [(AppleTypeCRetimerRestoreInfoHelperBackDeploy *)self log:@"Failed to locate FTAB in super binary"];
            int v41 = 1;
          }
        }
        else
        {
          [(AppleTypeCRetimerRestoreInfoHelperBackDeploy *)self log:@"Failed to locate rrko file in super binary"];
          int v41 = 1;
        }

        if (!v41)
        {
LABEL_32:
          id v43 = [v4 objectForKeyedSubscript:@"DeviceInfo"];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v44 = (NSData *)[v43 objectForKeyedSubscript:@"InfoArray"];
            v45 = *(NSData **)((char *)&self->_cphyData + 1);
            *(NSData **)((char *)&self->_cphyData + 1) = v44;

            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v46 = (NSArray *)[v43 objectForKeyedSubscript:@"APInfo"];
              v47 = *(NSArray **)((char *)&self->_deviceInfoArray + 1);
              *(NSArray **)((char *)&self->_deviceInfoArray + 1) = v46;

              BOOL v20 = 1;
LABEL_38:

              goto LABEL_39;
            }
            CFStringRef v48 = @"Failed to locate device info array";
          }
          else
          {
            CFStringRef v48 = @"Failed to locate device info";
          }
          [(AppleTypeCRetimerRestoreInfoHelperBackDeploy *)self log:v48];
          BOOL v20 = 0;
          goto LABEL_38;
        }
LABEL_31:
        BOOL v20 = 0;
LABEL_39:

        goto LABEL_40;
      }
      CFStringRef v40 = @"Failed to parse firmware data";
    }
    [(AppleTypeCRetimerRestoreInfoHelperBackDeploy *)self log:v40];
    goto LABEL_31;
  }
  [(AppleTypeCRetimerRestoreInfoHelperBackDeploy *)self log:@"Unable to locate firmware data"];
  BOOL v20 = 0;
LABEL_40:

  return v20;
}

- (id)generateHashForData:(id)a3
{
  memset(&v9, 0, sizeof(v9));
  id v3 = a3;
  CC_SHA384_Init(&v9);
  id v4 = v3;
  id v5 = objc_msgSend(v4, "bytes", *(_OWORD *)v9.count, *(_OWORD *)v9.hash, *(_OWORD *)&v9.hash[2], *(_OWORD *)&v9.hash[4], *(_OWORD *)&v9.hash[6], *(_OWORD *)v9.wbuf, *(_OWORD *)&v9.wbuf[2], *(_OWORD *)&v9.wbuf[4], *(_OWORD *)&v9.wbuf[6], *(_OWORD *)&v9.wbuf[8], *(_OWORD *)&v9.wbuf[10], *(_OWORD *)&v9.wbuf[12], *(_OWORD *)&v9.wbuf[14]);
  CC_LONG v6 = [v4 length];

  CC_SHA384_Update(&v9, v5, v6);
  CC_SHA384_Final(md, &v9);
  v7 = +[NSData dataWithBytes:md length:48];
  return v7;
}

- (BOOL)generateRequestDictionary
{
  v2 = self;
  id v3 = [(AppleTypeCRetimerFirmwareAggregateRequestCreatorBackDeploy *)self generateHashForData:*(void *)(&self->super._verbose + 1)];
  id v4 = [(AppleTypeCRetimerFirmwareAggregateRequestCreatorBackDeploy *)v2 generateHashForData:*(NSData **)((char *)&v2->_rkosData + 1)];
  if (*(NSData **)((char *)&v2->_rrkoData + 1)) {
    id v5 = -[AppleTypeCRetimerFirmwareAggregateRequestCreatorBackDeploy generateHashForData:](v2, "generateHashForData:");
  }
  else {
    id v5 = 0;
  }
  id v6 = +[NSMutableDictionary dictionary];
  long long v85 = 0u;
  long long v86 = 0u;
  long long v87 = 0u;
  long long v88 = 0u;
  id obj = *(id *)((char *)&v2->_cphyData + 1);
  id v80 = [obj countByEnumeratingWithState:&v85 objects:v101 count:16];
  if (v80)
  {
    uint64_t v81 = *(void *)v86;
    v82 = v6;
    id v69 = v4;
    id v70 = v3;
    id v68 = v5;
    v79 = v2;
LABEL_6:
    v7 = 0;
    while (1)
    {
      if (*(void *)v86 != v81) {
        objc_enumerationMutation(obj);
      }
      id v8 = *(void **)(*((void *)&v85 + 1) + 8 * (void)v7);
      id v9 = [v8 objectForKeyedSubscript:@"TagNumber"];
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        break;
      }
      id v10 = [v9 unsignedCharValue];
      id v11 = [v8 objectForKeyedSubscript:@"HardwareID"];
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        [(AppleTypeCRetimerRestoreInfoHelperBackDeploy *)v79 log:@"Unable to locate hardware ID data"];

        goto LABEL_93;
      }
      id v83 = v9;
      v84 = +[NSString stringWithValidatedFormat:@"@Timer%u,Ticket", @"%u", 0, v10 validFormatSpecifiers error];
      objc_msgSend(v6, "setObject:forKeyedSubscript:", &__kCFBooleanTrue);
      id v12 = v6;
      id v13 = [v11 objectForKeyedSubscript:@"BoardID"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v77 = +[NSString stringWithValidatedFormat:@"Timer,BoardID,%u", @"%u", 0, v10 validFormatSpecifiers error];
        id v78 = v13;
        objc_msgSend(v12, "setObject:forKeyedSubscript:", v13);
        id v14 = [v11 objectForKeyedSubscript:@"ChipID"];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v15 = +[NSString stringWithValidatedFormat:@"Timer,ChipID,%u", @"%u", 0, v10 validFormatSpecifiers error];
          [v12 setObject:v14 forKeyedSubscript:v15];
          id v16 = [v11 objectForKeyedSubscript:@"ECID"];
          objc_opt_class();
          id v74 = v16;
          v75 = v15;
          if (objc_opt_isKindOfClass())
          {
            id v72 = v14;
            v71 = +[NSString stringWithValidatedFormat:@"Timer,ECID,%u", @"%u", 0, v10 validFormatSpecifiers error];
            objc_msgSend(v12, "setObject:forKeyedSubscript:", v16);
            id v17 = [v11 objectForKeyedSubscript:@"Nonce"];
            objc_opt_class();
            id v73 = v17;
            if (objc_opt_isKindOfClass())
            {
              v66 = +[NSString stringWithValidatedFormat:@"Timer,Nonce,%u", @"%u", 0, v10 validFormatSpecifiers error];
              objc_msgSend(v12, "setObject:forKeyedSubscript:", v17);
              id v18 = [v11 objectForKeyedSubscript:@"ProductionStatus"];
              objc_opt_class();
              id v67 = v18;
              if (objc_opt_isKindOfClass())
              {
                v19 = +[NSString stringWithValidatedFormat:@"Timer,ProductionMode,%u", @"%u", 0, v10 validFormatSpecifiers error];
                if ([v18 unsignedCharValue]) {
                  BOOL v20 = &__kCFBooleanTrue;
                }
                else {
                  BOOL v20 = &__kCFBooleanFalse;
                }
                v65 = v19;
                [v12 setObject:v20 forKeyedSubscript:v19];
                id v21 = [v11 objectForKeyedSubscript:@"SecurityDomain"];
                objc_opt_class();
                id v14 = v72;
                id v64 = v21;
                if (objc_opt_isKindOfClass())
                {
                  v63 = +[NSString stringWithValidatedFormat:@"Timer,SecurityDomain,%u", @"%u", 0, v10 validFormatSpecifiers error];
                  objc_msgSend(v12, "setObject:forKeyedSubscript:", v21);
                  id v22 = [v11 objectForKeyedSubscript:@"SecurityMode"];
                  objc_opt_class();
                  id v62 = v22;
                  if (objc_opt_isKindOfClass())
                  {
                    v23 = +[NSString stringWithValidatedFormat:@"Timer,SecurityMode,%u", @"%u", 0, v10 validFormatSpecifiers error];
                    if ([v22 unsignedCharValue]) {
                      id v24 = &__kCFBooleanTrue;
                    }
                    else {
                      id v24 = &__kCFBooleanFalse;
                    }
                    [v12 setObject:v24 forKeyedSubscript:v23];
                    v25 = v22;
                    id v26 = [v11 objectForKeyedSubscript:@"Demote"];
                    if (v26 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
                    {
                      v2 = v79;
                      [(AppleTypeCRetimerRestoreInfoHelperBackDeploy *)v79 log:@"Invalid demote setting for tag %u", v10];
                      int v32 = 1;
                      v28 = v83;
                      id v33 = v84;
                    }
                    else
                    {
                      id v27 = [v8 objectForKeyedSubscript:@"Trusted"];
                      objc_opt_class();
                      id v61 = &__kCFBooleanTrue;
                      v28 = v83;
                      if (objc_opt_isKindOfClass()) {
                        id v61 = v27;
                      }
                      v60 = +[NSString stringWithValidatedFormat:@"Timer,RTKitOS,%u", @"%u", 0, v10 validFormatSpecifiers error];
                      if ([v26 BOOLValue]
                        && [v67 unsignedCharValue])
                      {
                        v97[0] = @"Digest";
                        v97[1] = @"EPRO";
                        v98[0] = v70;
                        v98[1] = &__kCFBooleanFalse;
                        v97[2] = @"DPRO";
                        v97[3] = @"ESEC";
                        v98[2] = &__kCFBooleanTrue;
                        v98[3] = &__kCFBooleanTrue;
                        v97[4] = @"Trusted";
                        v98[4] = &__kCFBooleanFalse;
                        id v29 = v98;
                        v30 = v97;
                        uint64_t v31 = 5;
                      }
                      else
                      {
                        v100[0] = v70;
                        v99[0] = @"Digest";
                        v99[1] = @"EPRO";
                        if ([v67 unsignedCharValue]) {
                          id v36 = &__kCFBooleanTrue;
                        }
                        else {
                          id v36 = &__kCFBooleanFalse;
                        }
                        v100[1] = v36;
                        v99[2] = @"ESEC";
                        if ([v25 unsignedCharValue]) {
                          v37 = &__kCFBooleanTrue;
                        }
                        else {
                          v37 = &__kCFBooleanFalse;
                        }
                        v100[2] = v37;
                        v99[3] = @"Trusted";
                        if ([v61 BOOLValue]) {
                          v38 = &__kCFBooleanTrue;
                        }
                        else {
                          v38 = &__kCFBooleanFalse;
                        }
                        v100[3] = v38;
                        id v29 = v100;
                        v30 = v99;
                        uint64_t v31 = 4;
                      }
                      v39 = +[NSDictionary dictionaryWithObjects:v29 forKeys:v30 count:v31];
                      [v82 setObject:v39 forKeyedSubscript:v60];

                      v59 = +[NSString stringWithValidatedFormat:@"Timer,RestoreRTKitOS,%u", @"%u", 0, v10 validFormatSpecifiers error];
                      if ([v26 BOOLValue]
                        && [v67 unsignedCharValue])
                      {
                        v93[0] = @"Digest";
                        v93[1] = @"EPRO";
                        v94[0] = v69;
                        v94[1] = &__kCFBooleanFalse;
                        v93[2] = @"DPRO";
                        v93[3] = @"ESEC";
                        v94[2] = &__kCFBooleanTrue;
                        v94[3] = &__kCFBooleanTrue;
                        v93[4] = @"Trusted";
                        v94[4] = &__kCFBooleanFalse;
                        CFStringRef v40 = v94;
                        int v41 = v93;
                        uint64_t v42 = 5;
                      }
                      else
                      {
                        v96[0] = v69;
                        v95[0] = @"Digest";
                        v95[1] = @"EPRO";
                        if ([v67 unsignedCharValue]) {
                          id v43 = &__kCFBooleanTrue;
                        }
                        else {
                          id v43 = &__kCFBooleanFalse;
                        }
                        v96[1] = v43;
                        v95[2] = @"ESEC";
                        if ([v25 unsignedCharValue]) {
                          v44 = &__kCFBooleanTrue;
                        }
                        else {
                          v44 = &__kCFBooleanFalse;
                        }
                        v96[2] = v44;
                        v95[3] = @"Trusted";
                        if ([v61 BOOLValue]) {
                          v45 = &__kCFBooleanTrue;
                        }
                        else {
                          v45 = &__kCFBooleanFalse;
                        }
                        v96[3] = v45;
                        CFStringRef v40 = v96;
                        int v41 = v95;
                        uint64_t v42 = 4;
                      }
                      v46 = +[NSDictionary dictionaryWithObjects:v40 forKeys:v41 count:v42];
                      [v82 setObject:v46 forKeyedSubscript:v59];

                      if (*(NSData **)((char *)&v79->_rrkoData + 1))
                      {
                        v47 = +[NSString stringWithFormat:@"Timer,AppleTypeCPhyFirmware,%u", v10];
                        if ([v26 BOOLValue]
                          && [v67 unsignedCharValue])
                        {
                          v89[0] = @"Digest";
                          v89[1] = @"EPRO";
                          v90[0] = v68;
                          v90[1] = &__kCFBooleanFalse;
                          v89[2] = @"DPRO";
                          v89[3] = @"ESEC";
                          v90[2] = &__kCFBooleanTrue;
                          v90[3] = &__kCFBooleanTrue;
                          v89[4] = @"Trusted";
                          v90[4] = &__kCFBooleanFalse;
                          CFStringRef v48 = v90;
                          v49 = v89;
                          uint64_t v50 = 5;
                        }
                        else
                        {
                          v92[0] = v68;
                          v91[0] = @"Digest";
                          v91[1] = @"EPRO";
                          if ([v67 unsignedCharValue]) {
                            v51 = &__kCFBooleanTrue;
                          }
                          else {
                            v51 = &__kCFBooleanFalse;
                          }
                          v92[1] = v51;
                          v91[2] = @"ESEC";
                          if ([v25 unsignedCharValue]) {
                            v52 = &__kCFBooleanTrue;
                          }
                          else {
                            v52 = &__kCFBooleanFalse;
                          }
                          v92[2] = v52;
                          v91[3] = @"Trusted";
                          if ([v61 BOOLValue]) {
                            v53 = &__kCFBooleanTrue;
                          }
                          else {
                            v53 = &__kCFBooleanFalse;
                          }
                          v92[3] = v53;
                          CFStringRef v48 = v92;
                          v49 = v91;
                          uint64_t v50 = 4;
                        }
                        v54 = +[NSDictionary dictionaryWithObjects:v48 forKeys:v49 count:v50];
                        [v82 setObject:v54 forKeyedSubscript:v47];
                      }
                      int v32 = 0;
                      v2 = v79;
                      id v33 = v84;
                    }
                  }
                  else
                  {
                    v2 = v79;
                    [(AppleTypeCRetimerRestoreInfoHelperBackDeploy *)v79 log:@"Unable to locate security mode for tag %u", v10];
                    int v32 = 1;
                    v28 = v83;
                    id v33 = v84;
                  }
                  id v13 = v78;
                  id v34 = v77;
                  v35 = v71;
                }
                else
                {
                  v2 = v79;
                  [(AppleTypeCRetimerRestoreInfoHelperBackDeploy *)v79 log:@"Unable to locate security domain for tag %u", v10];
                  int v32 = 1;
                  v28 = v83;
                  id v33 = v84;
                  id v34 = v77;
                  id v13 = v78;
                  v35 = v71;
                }
              }
              else
              {
                v2 = v79;
                [(AppleTypeCRetimerRestoreInfoHelperBackDeploy *)v79 log:@"Unable to locate production status for tag %u", v10];
                int v32 = 1;
                v28 = v83;
                id v33 = v84;
                id v34 = v77;
                id v13 = v78;
                v35 = v71;
                id v14 = v72;
              }
            }
            else
            {
              v2 = v79;
              [(AppleTypeCRetimerRestoreInfoHelperBackDeploy *)v79 log:@"Unable to locate nonce for tag %u", v10];
              int v32 = 1;
              v28 = v83;
              id v33 = v84;
              id v34 = v77;
              id v13 = v78;
              v35 = v71;
              id v14 = v72;
            }
          }
          else
          {
            v2 = v79;
            [(AppleTypeCRetimerRestoreInfoHelperBackDeploy *)v79 log:@"Unable to locate ECID for tag %u", v10];
            int v32 = 1;
            v28 = v83;
            id v33 = v84;
            id v34 = v77;
            id v13 = v78;
          }
        }
        else
        {
          v2 = v79;
          [(AppleTypeCRetimerRestoreInfoHelperBackDeploy *)v79 log:@"Unable to locate board ID for tag %u", v10];
          int v32 = 1;
          v28 = v83;
          id v33 = v84;
          id v34 = v77;
        }
      }
      else
      {
        v2 = v79;
        [(AppleTypeCRetimerRestoreInfoHelperBackDeploy *)v79 log:@"Unable to locate board ID for tag %u", v10];
        int v32 = 1;
        v28 = v83;
        id v33 = v84;
      }

      if (v32) {
        goto LABEL_94;
      }
      v7 = (char *)v7 + 1;
      id v6 = v82;
      if (v80 == v7)
      {
        id v4 = v69;
        id v3 = v70;
        id v5 = v68;
        id v80 = [obj countByEnumeratingWithState:&v85 objects:v101 count:16];
        if (v80) {
          goto LABEL_6;
        }
        goto LABEL_88;
      }
    }
    [(AppleTypeCRetimerRestoreInfoHelperBackDeploy *)v2 log:@"Unable to locate tag number in device info"];
LABEL_93:

LABEL_94:
    BOOL v57 = 0;
    id v4 = v69;
    id v3 = v70;
    id v5 = v68;
    id v6 = v82;
    goto LABEL_95;
  }
LABEL_88:

  if (*(NSArray **)((char *)&v2->_deviceInfoArray + 1)) {
    objc_msgSend(v6, "addEntriesFromDictionary:");
  }
  v55 = +[NSDictionary dictionaryWithDictionary:v6];
  v56 = *(NSDictionary **)((char *)&v2->_apParameters + 1);
  *(NSDictionary **)((char *)&v2->_apParameters + 1) = v55;

  [(AppleTypeCRetimerRestoreInfoHelperBackDeploy *)v2 verboseLog:@"ATCRT request dictionary = %@", *(NSDictionary **)((char *)&v2->_apParameters + 1)];
  BOOL v57 = 1;
LABEL_95:

  return v57;
}

- (NSDictionary)requestDictionary
{
  return (NSDictionary *)objc_getProperty(self, a2, 65, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)((char *)&self->_apParameters + 1), 0);
  objc_storeStrong((id *)((char *)&self->_deviceInfoArray + 1), 0);
  objc_storeStrong((id *)((char *)&self->_cphyData + 1), 0);
  objc_storeStrong((id *)((char *)&self->_rrkoData + 1), 0);
  objc_storeStrong((id *)((char *)&self->_rkosData + 1), 0);
  objc_storeStrong((id *)(&self->super._verbose + 1), 0);
}

@end
@interface AppleTypeCRetimerFirmwareAggregateRequestCreatorOS
- (AppleTypeCRetimerFirmwareAggregateRequestCreatorOS)initWithOptions:(id)a3 logFunction:(void *)a4 logContext:(void *)a5;
- (BOOL)generateRequestDictionary;
- (BOOL)parseOptions:(id)a3;
- (NSDictionary)requestDictionary;
- (id)generateHashForData:(id)a3;
@end

@implementation AppleTypeCRetimerFirmwareAggregateRequestCreatorOS

- (AppleTypeCRetimerFirmwareAggregateRequestCreatorOS)initWithOptions:(id)a3 logFunction:(void *)a4 logContext:(void *)a5
{
  id v8 = a3;
  v13.receiver = self;
  v13.super_class = (Class)AppleTypeCRetimerFirmwareAggregateRequestCreatorOS;
  v9 = [(AppleTypeCRetimerRestoreInfoHelperOS *)&v13 initWithOptions:v8 logFunction:a4 logContext:a5];
  v10 = v9;
  if (!v9
    || [(AppleTypeCRetimerFirmwareAggregateRequestCreatorOS *)v9 parseOptions:v8]
    && [(AppleTypeCRetimerFirmwareAggregateRequestCreatorOS *)v10 generateRequestDictionary])
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
  id v5 = (id)[v4 objectForKeyedSubscript:@"FirmwareData"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v6 = [[FTABFileOS alloc] initWithData:v5];
    v7 = v6;
    if (v6)
    {
      id v8 = [(FTABFileOS *)v6 subfileWithTag:@"rrko"];
      if (v8)
      {
        v9 = v8;
        v10 = (NSData *)(id)[v8 data];
        rrkoData = self->_rrkoData;
        self->_rrkoData = v10;

        id v12 = [(FTABFileOS *)v7 subfileWithTag:@"rkos"];
        if (v12)
        {
          objc_super v13 = v12;
          v14 = (NSData *)(id)[v12 data];
          rkosData = self->_rkosData;
          self->_rkosData = v14;

          id v16 = [(FTABFileOS *)v7 subfileWithTag:@"cphy"];
          v17 = v16;
          if (v16)
          {
            v18 = (NSData *)(id)[v16 data];
            cphyData = self->_cphyData;
            self->_cphyData = v18;
          }
          else
          {
            [(AppleTypeCRetimerRestoreInfoHelperOS *)self log:@"No cphy data found"];
          }

          goto LABEL_32;
        }
        [(AppleTypeCRetimerRestoreInfoHelperOS *)self log:@"Failed to locate rkos file in ftab"];

        goto LABEL_31;
      }
      v40 = @"Failed to locate rrko file in ftab";
    }
    else
    {
      v21 = [[UARPSuperBinaryOS alloc] initWithData:v5 delegate:0 delegateQueue:0];
      if (v21)
      {
        v22 = v21;
        v23 = [[UARPAssetTagOS alloc] initWithString:@"RRKO"];
        id v24 = [(UARPSuperBinaryOS *)v22 payloadWith4ccTag:v23];
        v25 = v24;
        if (v24)
        {
          v26 = (NSData *)(id)[v24 payloadData];
          v27 = self->_rrkoData;
          self->_rrkoData = v26;

          v28 = [[UARPAssetTagOS alloc] initWithString:@"FIRM"];
          id v29 = [(UARPSuperBinaryOS *)v22 payloadWith4ccTag:v28];
          if (v29)
          {
            v51 = v28;
            v30 = [FTABFileOS alloc];
            id v31 = (id)[v29 payloadData];
            v32 = [(FTABFileOS *)v30 initWithData:v31];

            if (v32)
            {
              id v33 = [(FTABFileOS *)v32 subfileWithTag:@"rkos"];
              if (v33)
              {
                id v50 = v33;
                v34 = (NSData *)(id)[v33 data];
                v35 = self->_rkosData;
                self->_rkosData = v34;

                id v36 = [(FTABFileOS *)v32 subfileWithTag:@"cphy"];
                v37 = v36;
                if (v36)
                {
                  v38 = (NSData *)(id)[v36 data];
                  v39 = self->_cphyData;
                  self->_cphyData = v38;
                }
                else
                {
                  [(AppleTypeCRetimerRestoreInfoHelperOS *)self log:@"No cphy data found"];
                }

                int v41 = 0;
                v42 = v50;
              }
              else
              {
                [(AppleTypeCRetimerRestoreInfoHelperOS *)self log:@"Failed to locate rkos file in super binary ftab"];
                v42 = 0;
                int v41 = 1;
              }
            }
            else
            {
              [(AppleTypeCRetimerRestoreInfoHelperOS *)self log:@"Failed to parse FTAB in super binary"];
              int v41 = 1;
            }

            v28 = v51;
          }
          else
          {
            [(AppleTypeCRetimerRestoreInfoHelperOS *)self log:@"Failed to locate FTAB in super binary"];
            int v41 = 1;
          }
        }
        else
        {
          [(AppleTypeCRetimerRestoreInfoHelperOS *)self log:@"Failed to locate rrko file in super binary"];
          int v41 = 1;
        }

        if (!v41)
        {
LABEL_32:
          id v43 = (id)[v4 objectForKeyedSubscript:@"DeviceInfo"];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v44 = (NSArray *)(id)[v43 objectForKeyedSubscript:@"InfoArray"];
            deviceInfoArray = self->_deviceInfoArray;
            self->_deviceInfoArray = v44;

            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v46 = (NSDictionary *)(id)[v43 objectForKeyedSubscript:@"APInfo"];
              apParameters = self->_apParameters;
              self->_apParameters = v46;

              BOOL v20 = 1;
LABEL_38:

              goto LABEL_39;
            }
            v48 = @"Failed to locate device info array";
          }
          else
          {
            v48 = @"Failed to locate device info";
          }
          [(AppleTypeCRetimerRestoreInfoHelperOS *)self log:v48];
          BOOL v20 = 0;
          goto LABEL_38;
        }
LABEL_31:
        BOOL v20 = 0;
LABEL_39:

        goto LABEL_40;
      }
      v40 = @"Failed to parse firmware data";
    }
    [(AppleTypeCRetimerRestoreInfoHelperOS *)self log:v40];
    goto LABEL_31;
  }
  [(AppleTypeCRetimerRestoreInfoHelperOS *)self log:@"Unable to locate firmware data"];
  BOOL v20 = 0;
LABEL_40:

  return v20;
}

- (id)generateHashForData:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  memset(&v9, 0, sizeof(v9));
  id v3 = a3;
  CC_SHA384_Init(&v9);
  id v4 = v3;
  id v5 = (const void *)[v4 bytes:*(_OWORD *)v9.count, *(_OWORD *)v9.hash, *(_OWORD *)&v9.hash[2], *(_OWORD *)&v9.hash[4], *(_OWORD *)&v9.hash[6], *(_OWORD *)v9.wbuf, *(_OWORD *)&v9.wbuf[2], *(_OWORD *)&v9.wbuf[4], *(_OWORD *)&v9.wbuf[6], *(_OWORD *)&v9.wbuf[8], *(_OWORD *)&v9.wbuf[10], *(_OWORD *)&v9.wbuf[12], *(_OWORD *)&v9.wbuf[14]];
  CC_LONG v6 = [v4 length];

  CC_SHA384_Update(&v9, v5, v6);
  CC_SHA384_Final(md, &v9);
  id v7 = (id)[MEMORY[0x263EFF8F8] dataWithBytes:md length:48];

  return v7;
}

- (BOOL)generateRequestDictionary
{
  v2 = self;
  uint64_t v118 = *MEMORY[0x263EF8340];
  id v3 = [(AppleTypeCRetimerFirmwareAggregateRequestCreatorOS *)self generateHashForData:self->_rkosData];
  id v4 = [(AppleTypeCRetimerFirmwareAggregateRequestCreatorOS *)v2 generateHashForData:v2->_rrkoData];
  if (v2->_cphyData) {
    id v5 = -[AppleTypeCRetimerFirmwareAggregateRequestCreatorOS generateHashForData:](v2, "generateHashForData:");
  }
  else {
    id v5 = 0;
  }
  id v6 = (id)[MEMORY[0x263EFF9A0] dictionary];
  long long v101 = 0u;
  long long v102 = 0u;
  long long v103 = 0u;
  long long v104 = 0u;
  obj = v2->_deviceInfoArray;
  uint64_t v96 = [(NSArray *)obj countByEnumeratingWithState:&v101 objects:v117 count:16];
  if (v96)
  {
    uint64_t v97 = *(void *)v102;
    v98 = v6;
    id v85 = v4;
    id v86 = v3;
    id v84 = v5;
    v95 = v2;
LABEL_6:
    uint64_t v7 = 0;
    while (1)
    {
      if (*(void *)v102 != v97) {
        objc_enumerationMutation(obj);
      }
      id v8 = *(void **)(*((void *)&v101 + 1) + 8 * v7);
      id v9 = (id)[v8 objectForKeyedSubscript:@"TagNumber"];
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        break;
      }
      uint64_t v10 = [v9 unsignedCharValue];
      id v11 = (id)[v8 objectForKeyedSubscript:@"HardwareID"];
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        [(AppleTypeCRetimerRestoreInfoHelperOS *)v95 log:@"Unable to locate hardware ID data"];

        goto LABEL_93;
      }
      id v99 = v9;
      id v100 = (id)[NSString stringWithValidatedFormat:@"@Timer%u,Ticket" validFormatSpecifiers:@"%u" error:v10];
      [v6 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:];
      id v12 = v6;
      id v13 = (id)[v11 objectForKeyedSubscript:@"BoardID"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v93 = (id)[NSString stringWithValidatedFormat:@"Timer,BoardID,%u" validFormatSpecifiers:@"%u" error:v10];
        id v94 = v13;
        [v12 setObject:v13 forKeyedSubscript:];
        id v14 = (id)[v11 objectForKeyedSubscript:@"ChipID"];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v15 = (id)[NSString stringWithValidatedFormat:@"Timer,ChipID,%u" validFormatSpecifiers:@"%u" error:0, v10];
          [v12 setObject:v14 forKeyedSubscript:v15];
          id v16 = (id)[v11 objectForKeyedSubscript:@"ECID"];
          objc_opt_class();
          id v90 = v16;
          id v91 = v15;
          if (objc_opt_isKindOfClass())
          {
            id v88 = v14;
            id v87 = (id)[NSString stringWithValidatedFormat:@"Timer,ECID,%u" validFormatSpecifiers:@"%u" error:v10];
            [v12 setObject:v16 forKeyedSubscript:];
            id v17 = (id)[v11 objectForKeyedSubscript:@"Nonce"];
            objc_opt_class();
            id v89 = v17;
            if (objc_opt_isKindOfClass())
            {
              id v82 = (id)[NSString stringWithValidatedFormat:@"Timer,Nonce,%u" validFormatSpecifiers:@"%u" error:v10];
              [v12 setObject:v17 forKeyedSubscript:];
              id v18 = (id)[v11 objectForKeyedSubscript:@"ProductionStatus"];
              objc_opt_class();
              id v83 = v18;
              if (objc_opt_isKindOfClass())
              {
                id v19 = (id)[NSString stringWithValidatedFormat:v10 validFormatSpecifiers:@"Timer,ProductionMode,%u" error:0];
                if ([v18 unsignedCharValue]) {
                  uint64_t v20 = MEMORY[0x263EFFA88];
                }
                else {
                  uint64_t v20 = MEMORY[0x263EFFA80];
                }
                id v81 = v19;
                [v12 setObject:v20 forKeyedSubscript:v19];
                id v21 = (id)[v11 objectForKeyedSubscript:@"SecurityDomain"];
                objc_opt_class();
                id v14 = v88;
                id v80 = v21;
                if (objc_opt_isKindOfClass())
                {
                  id v79 = (id)[NSString stringWithValidatedFormat:v10, @"Timer,SecurityDomain,%u", @"%u"];
                  [v12 setObject:v21 forKeyedSubscript:x0];
                  id v22 = (id)[v11 objectForKeyedSubscript:@"SecurityMode"];
                  objc_opt_class();
                  id v78 = v22;
                  if (objc_opt_isKindOfClass())
                  {
                    id v23 = (id)[NSString stringWithValidatedFormat:v10, @"Timer,SecurityMode,%u", @"%u", 0];
                    if ([v22 unsignedCharValue]) {
                      uint64_t v24 = MEMORY[0x263EFFA88];
                    }
                    else {
                      uint64_t v24 = MEMORY[0x263EFFA80];
                    }
                    [v12 setObject:v24 forKeyedSubscript:v23];
                    v25 = v22;
                    id v26 = (id)[v11 objectForKeyedSubscript:@"Demote"];
                    if (v26 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
                    {
                      v2 = v95;
                      [(AppleTypeCRetimerRestoreInfoHelperOS *)v95 log:@"Invalid demote setting for tag %u", v10];
                      int v35 = 1;
                      id v29 = v99;
                      id v36 = v100;
                    }
                    else
                    {
                      id v27 = (id)[v8 objectForKeyedSubscript:@"Trusted"];
                      objc_opt_class();
                      char isKindOfClass = objc_opt_isKindOfClass();
                      id v77 = (id)MEMORY[0x263EFFA88];
                      id v29 = v99;
                      if (isKindOfClass) {
                        id v77 = v27;
                      }
                      id v73 = v27;
                      id v74 = v23;
                      id v76 = (id)[NSString stringWithValidatedFormat:@"Timer,RTKitOS,%u", @"%u", 0, v10];
                      id v30 = v26;
                      if ([v26 BOOLValue]
                        && [v83 unsignedCharValue])
                      {
                        v113[0] = @"Digest";
                        v113[1] = @"EPRO";
                        v114[0] = v86;
                        v114[1] = MEMORY[0x263EFFA80];
                        v113[2] = @"DPRO";
                        v113[3] = @"ESEC";
                        v114[2] = MEMORY[0x263EFFA88];
                        v114[3] = MEMORY[0x263EFFA88];
                        v113[4] = @"Trusted";
                        v114[4] = MEMORY[0x263EFFA80];
                        id v31 = NSDictionary;
                        v32 = v114;
                        id v33 = v113;
                        uint64_t v34 = 5;
                      }
                      else
                      {
                        v116[0] = v86;
                        v115[0] = @"Digest";
                        v115[1] = @"EPRO";
                        int v39 = [v83 unsignedCharValue];
                        uint64_t v40 = MEMORY[0x263EFFA88];
                        uint64_t v41 = MEMORY[0x263EFFA80];
                        if (v39) {
                          uint64_t v42 = MEMORY[0x263EFFA88];
                        }
                        else {
                          uint64_t v42 = MEMORY[0x263EFFA80];
                        }
                        v116[1] = v42;
                        v115[2] = @"ESEC";
                        if ([v25 unsignedCharValue]) {
                          uint64_t v43 = v40;
                        }
                        else {
                          uint64_t v43 = v41;
                        }
                        v116[2] = v43;
                        v115[3] = @"Trusted";
                        if ([v77 BOOLValue]) {
                          uint64_t v44 = v40;
                        }
                        else {
                          uint64_t v44 = v41;
                        }
                        id v26 = v30;
                        v116[3] = v44;
                        id v31 = NSDictionary;
                        v32 = v116;
                        id v33 = v115;
                        uint64_t v34 = 4;
                      }
                      id v45 = (id)[v31 dictionaryWithObjects:v32 forKeys:v33 count:v34];
                      [v98 setObject:v45 forKeyedSubscript:v76];

                      id v75 = (id)[NSString stringWithValidatedFormat:@"Timer,RestoreRTKitOS,%u", @"%u", 0, v10];
                      if ([v26 BOOLValue]
                        && [v83 unsignedCharValue])
                      {
                        v109[0] = @"Digest";
                        v109[1] = @"EPRO";
                        v110[0] = v85;
                        v110[1] = MEMORY[0x263EFFA80];
                        v109[2] = @"DPRO";
                        v109[3] = @"ESEC";
                        v110[2] = MEMORY[0x263EFFA88];
                        v110[3] = MEMORY[0x263EFFA88];
                        v109[4] = @"Trusted";
                        v110[4] = MEMORY[0x263EFFA80];
                        v46 = NSDictionary;
                        v47 = v110;
                        v48 = v109;
                        uint64_t v49 = 5;
                      }
                      else
                      {
                        v112[0] = v85;
                        v111[0] = @"Digest";
                        v111[1] = @"EPRO";
                        int v50 = [v83 unsignedCharValue];
                        uint64_t v51 = MEMORY[0x263EFFA88];
                        uint64_t v52 = MEMORY[0x263EFFA80];
                        if (v50) {
                          uint64_t v53 = MEMORY[0x263EFFA88];
                        }
                        else {
                          uint64_t v53 = MEMORY[0x263EFFA80];
                        }
                        v112[1] = v53;
                        v111[2] = @"ESEC";
                        if ([v25 unsignedCharValue]) {
                          uint64_t v54 = v51;
                        }
                        else {
                          uint64_t v54 = v52;
                        }
                        v112[2] = v54;
                        v111[3] = @"Trusted";
                        if ([v77 BOOLValue]) {
                          uint64_t v55 = v51;
                        }
                        else {
                          uint64_t v55 = v52;
                        }
                        id v26 = v30;
                        v112[3] = v55;
                        v46 = NSDictionary;
                        v47 = v112;
                        v48 = v111;
                        uint64_t v49 = 4;
                      }
                      id v56 = (id)[v46 dictionaryWithObjects:v47 forKeys:v48 count:v49];
                      id v23 = v74;
                      [v98 setObject:v56 forKeyedSubscript:v75];

                      if (v95->_cphyData)
                      {
                        id v57 = [NSString stringWithFormat:@"Timer,AppleTypeCPhyFirmware,%u", v10];
                        if ([v26 BOOLValue]
                          && [v83 unsignedCharValue])
                        {
                          v105[0] = @"Digest";
                          v105[1] = @"EPRO";
                          v106[0] = v84;
                          v106[1] = MEMORY[0x263EFFA80];
                          v105[2] = @"DPRO";
                          v105[3] = @"ESEC";
                          v106[2] = MEMORY[0x263EFFA88];
                          v106[3] = MEMORY[0x263EFFA88];
                          v105[4] = @"Trusted";
                          v106[4] = MEMORY[0x263EFFA80];
                          v58 = NSDictionary;
                          v59 = v106;
                          v60 = v105;
                          uint64_t v61 = 5;
                        }
                        else
                        {
                          v108[0] = v84;
                          v107[0] = @"Digest";
                          v107[1] = @"EPRO";
                          int v62 = [v83 unsignedCharValue];
                          uint64_t v63 = MEMORY[0x263EFFA88];
                          uint64_t v64 = MEMORY[0x263EFFA80];
                          if (v62) {
                            uint64_t v65 = MEMORY[0x263EFFA88];
                          }
                          else {
                            uint64_t v65 = MEMORY[0x263EFFA80];
                          }
                          v108[1] = v65;
                          v107[2] = @"ESEC";
                          if ([v25 unsignedCharValue]) {
                            uint64_t v66 = v63;
                          }
                          else {
                            uint64_t v66 = v64;
                          }
                          v108[2] = v66;
                          v107[3] = @"Trusted";
                          if ([v77 BOOLValue]) {
                            uint64_t v67 = v63;
                          }
                          else {
                            uint64_t v67 = v64;
                          }
                          id v26 = v30;
                          id v23 = v74;
                          v108[3] = v67;
                          v58 = NSDictionary;
                          v59 = v108;
                          v60 = v107;
                          uint64_t v61 = 4;
                        }
                        id v68 = (id)[v58 dictionaryWithObjects:v59 forKeys:v60 count:v61];
                        [v98 setObject:v68 forKeyedSubscript:v57];
                      }
                      int v35 = 0;
                      v2 = v95;
                      id v36 = v100;
                    }
                  }
                  else
                  {
                    v2 = v95;
                    [(AppleTypeCRetimerRestoreInfoHelperOS *)v95 log:@"Unable to locate security mode for tag %u", v10];
                    int v35 = 1;
                    id v29 = v99;
                    id v36 = v100;
                  }
                  id v13 = v94;
                  v37 = v93;
                  v38 = v87;
                }
                else
                {
                  v2 = v95;
                  [(AppleTypeCRetimerRestoreInfoHelperOS *)v95 log:@"Unable to locate security domain for tag %u", v10];
                  int v35 = 1;
                  id v29 = v99;
                  id v36 = v100;
                  v37 = v93;
                  id v13 = v94;
                  v38 = v87;
                }
              }
              else
              {
                v2 = v95;
                [(AppleTypeCRetimerRestoreInfoHelperOS *)v95 log:@"Unable to locate production status for tag %u", v10];
                int v35 = 1;
                id v29 = v99;
                id v36 = v100;
                v37 = v93;
                id v13 = v94;
                v38 = v87;
                id v14 = v88;
              }
            }
            else
            {
              v2 = v95;
              [(AppleTypeCRetimerRestoreInfoHelperOS *)v95 log:@"Unable to locate nonce for tag %u", v10];
              int v35 = 1;
              id v29 = v99;
              id v36 = v100;
              v37 = v93;
              id v13 = v94;
              v38 = v87;
              id v14 = v88;
            }
          }
          else
          {
            v2 = v95;
            [(AppleTypeCRetimerRestoreInfoHelperOS *)v95 log:@"Unable to locate ECID for tag %u", v10];
            int v35 = 1;
            id v29 = v99;
            id v36 = v100;
            v37 = v93;
            id v13 = v94;
          }
        }
        else
        {
          v2 = v95;
          [(AppleTypeCRetimerRestoreInfoHelperOS *)v95 log:@"Unable to locate board ID for tag %u", v10];
          int v35 = 1;
          id v29 = v99;
          id v36 = v100;
          v37 = v93;
        }
      }
      else
      {
        v2 = v95;
        [(AppleTypeCRetimerRestoreInfoHelperOS *)v95 log:@"Unable to locate board ID for tag %u", v10];
        int v35 = 1;
        id v29 = v99;
        id v36 = v100;
      }

      if (v35) {
        goto LABEL_94;
      }
      ++v7;
      id v6 = v98;
      if (v96 == v7)
      {
        id v4 = v85;
        id v3 = v86;
        id v5 = v84;
        uint64_t v96 = [(NSArray *)obj countByEnumeratingWithState:&v101 objects:v117 count:16];
        if (v96) {
          goto LABEL_6;
        }
        goto LABEL_88;
      }
    }
    [(AppleTypeCRetimerRestoreInfoHelperOS *)v2 log:@"Unable to locate tag number in device info"];
LABEL_93:

LABEL_94:
    BOOL v71 = 0;
    id v4 = v85;
    id v3 = v86;
    id v5 = v84;
    id v6 = v98;
    goto LABEL_95;
  }
LABEL_88:

  if (v2->_apParameters) {
    [v6 addEntriesFromDictionary:];
  }
  v69 = (NSDictionary *)(id)[NSDictionary dictionaryWithDictionary:v6];
  requestDictionary = v2->_requestDictionary;
  v2->_requestDictionary = v69;

  [(AppleTypeCRetimerRestoreInfoHelperOS *)v2 verboseLog:@"ATCRT request dictionary = %@", v2->_requestDictionary];
  BOOL v71 = 1;
LABEL_95:

  return v71;
}

- (NSDictionary)requestDictionary
{
  return (NSDictionary *)objc_getProperty(self, a2, 72, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestDictionary, 0);
  objc_storeStrong((id *)&self->_apParameters, 0);
  objc_storeStrong((id *)&self->_deviceInfoArray, 0);
  objc_storeStrong((id *)&self->_cphyData, 0);
  objc_storeStrong((id *)&self->_rrkoData, 0);

  objc_storeStrong((id *)&self->_rkosData, 0);
}

@end
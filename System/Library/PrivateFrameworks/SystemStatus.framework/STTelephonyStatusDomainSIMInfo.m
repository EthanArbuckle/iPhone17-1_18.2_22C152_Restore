@interface STTelephonyStatusDomainSIMInfo
+ (BOOL)supportsSecureCoding;
- (BOOL)isBootstrap;
- (BOOL)isCallForwardingEnabled;
- (BOOL)isEqual:(id)a3;
- (BOOL)isPreferredForDataConnections;
- (BOOL)isProvidingDataConnection;
- (BOOL)isRegisteredWithoutCellular;
- (BOOL)isSIMPresent;
- (NSString)description;
- (NSString)label;
- (NSString)secondaryServiceDescription;
- (NSString)serviceDescription;
- (NSString)shortLabel;
- (STTelephonyStatusDomainSIMInfo)init;
- (STTelephonyStatusDomainSIMInfo)initWithCoder:(id)a3;
- (id)_descriptionBuilderWithMultilinePrefix:(uint64_t)a3 forDebug:;
- (id)dataByApplyingDiff:(id)a3;
- (id)debugDescriptionWithMultilinePrefix:(id)a3;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)diffFromData:(id)a3;
- (id)initWithSIMInfo:(void *)a1;
- (id)initWithSIMPresent:(char)a3 bootstrap:(void *)a4 label:(void *)a5 shortLabel:(uint64_t)a6 signalStrengthBars:(uint64_t)a7 maxSignalStrengthBars:(uint64_t)a8 serviceState:(uint64_t)a9 cellularServiceState:(void *)a10 serviceDescription:(void *)a11 secondaryServiceDescription:(uint64_t)a12 dataNetworkType:(char)a13 providingDataConnection:(char)a14 preferredForDataConnections:(char)a15 registeredWithoutCellular:(char)a16 callForwardingEnabled:;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (unint64_t)cellularServiceState;
- (unint64_t)dataNetworkType;
- (unint64_t)hash;
- (unint64_t)maxSignalStrengthBars;
- (unint64_t)serviceState;
- (unint64_t)signalStrengthBars;
- (void)encodeWithCoder:(id)a3;
@end

@implementation STTelephonyStatusDomainSIMInfo

- (BOOL)isSIMPresent
{
  return self->_SIMPresent;
}

- (unint64_t)serviceState
{
  return self->_serviceState;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v5 = [MEMORY[0x1E4F4F738] builderWithObject:v4 ofExpectedClass:objc_opt_class()];
  BOOL v6 = [(STTelephonyStatusDomainSIMInfo *)self isSIMPresent];
  v80[0] = MEMORY[0x1E4F143A8];
  v80[1] = 3221225472;
  v80[2] = __42__STTelephonyStatusDomainSIMInfo_isEqual___block_invoke;
  v80[3] = &unk_1E6B630D0;
  id v7 = v4;
  id v81 = v7;
  id v8 = (id)[v5 appendBool:v6 counterpart:v80];
  BOOL v9 = [(STTelephonyStatusDomainSIMInfo *)self isBootstrap];
  v78[0] = MEMORY[0x1E4F143A8];
  v78[1] = 3221225472;
  v78[2] = __42__STTelephonyStatusDomainSIMInfo_isEqual___block_invoke_2;
  v78[3] = &unk_1E6B630D0;
  id v10 = v7;
  id v79 = v10;
  id v11 = (id)[v5 appendBool:v9 counterpart:v78];
  v12 = [(STTelephonyStatusDomainSIMInfo *)self label];
  v76[0] = MEMORY[0x1E4F143A8];
  v76[1] = 3221225472;
  v76[2] = __42__STTelephonyStatusDomainSIMInfo_isEqual___block_invoke_3;
  v76[3] = &unk_1E6B630A8;
  id v13 = v10;
  id v77 = v13;
  id v14 = (id)[v5 appendString:v12 counterpart:v76];

  v15 = [(STTelephonyStatusDomainSIMInfo *)self shortLabel];
  v74[0] = MEMORY[0x1E4F143A8];
  v74[1] = 3221225472;
  v74[2] = __42__STTelephonyStatusDomainSIMInfo_isEqual___block_invoke_4;
  v74[3] = &unk_1E6B630A8;
  id v16 = v13;
  id v75 = v16;
  id v17 = (id)[v5 appendString:v15 counterpart:v74];

  unint64_t v18 = [(STTelephonyStatusDomainSIMInfo *)self signalStrengthBars];
  v72[0] = MEMORY[0x1E4F143A8];
  v72[1] = 3221225472;
  v72[2] = __42__STTelephonyStatusDomainSIMInfo_isEqual___block_invoke_5;
  v72[3] = &unk_1E6B63670;
  id v19 = v16;
  id v73 = v19;
  id v20 = (id)[v5 appendUnsignedInteger:v18 counterpart:v72];
  unint64_t v21 = [(STTelephonyStatusDomainSIMInfo *)self maxSignalStrengthBars];
  v70[0] = MEMORY[0x1E4F143A8];
  v70[1] = 3221225472;
  v70[2] = __42__STTelephonyStatusDomainSIMInfo_isEqual___block_invoke_6;
  v70[3] = &unk_1E6B63670;
  id v22 = v19;
  id v71 = v22;
  id v23 = (id)[v5 appendUnsignedInteger:v21 counterpart:v70];
  unint64_t v24 = [(STTelephonyStatusDomainSIMInfo *)self serviceState];
  v68[0] = MEMORY[0x1E4F143A8];
  v68[1] = 3221225472;
  v68[2] = __42__STTelephonyStatusDomainSIMInfo_isEqual___block_invoke_7;
  v68[3] = &unk_1E6B63670;
  id v25 = v22;
  id v69 = v25;
  id v26 = (id)[v5 appendUnsignedInteger:v24 counterpart:v68];
  unint64_t v27 = [(STTelephonyStatusDomainSIMInfo *)self cellularServiceState];
  v66[0] = MEMORY[0x1E4F143A8];
  v66[1] = 3221225472;
  v66[2] = __42__STTelephonyStatusDomainSIMInfo_isEqual___block_invoke_8;
  v66[3] = &unk_1E6B63670;
  id v28 = v25;
  id v67 = v28;
  id v29 = (id)[v5 appendUnsignedInteger:v27 counterpart:v66];
  v30 = [(STTelephonyStatusDomainSIMInfo *)self serviceDescription];
  v64[0] = MEMORY[0x1E4F143A8];
  v64[1] = 3221225472;
  v64[2] = __42__STTelephonyStatusDomainSIMInfo_isEqual___block_invoke_9;
  v64[3] = &unk_1E6B630A8;
  id v31 = v28;
  id v65 = v31;
  id v32 = (id)[v5 appendString:v30 counterpart:v64];

  v33 = [(STTelephonyStatusDomainSIMInfo *)self secondaryServiceDescription];
  v62[0] = MEMORY[0x1E4F143A8];
  v62[1] = 3221225472;
  v62[2] = __42__STTelephonyStatusDomainSIMInfo_isEqual___block_invoke_10;
  v62[3] = &unk_1E6B630A8;
  id v34 = v31;
  id v63 = v34;
  id v35 = (id)[v5 appendString:v33 counterpart:v62];

  unint64_t v36 = [(STTelephonyStatusDomainSIMInfo *)self dataNetworkType];
  v60[0] = MEMORY[0x1E4F143A8];
  v60[1] = 3221225472;
  v60[2] = __42__STTelephonyStatusDomainSIMInfo_isEqual___block_invoke_11;
  v60[3] = &unk_1E6B63670;
  id v37 = v34;
  id v61 = v37;
  id v38 = (id)[v5 appendUnsignedInteger:v36 counterpart:v60];
  BOOL v39 = [(STTelephonyStatusDomainSIMInfo *)self isProvidingDataConnection];
  v58[0] = MEMORY[0x1E4F143A8];
  v58[1] = 3221225472;
  v58[2] = __42__STTelephonyStatusDomainSIMInfo_isEqual___block_invoke_12;
  v58[3] = &unk_1E6B630D0;
  id v40 = v37;
  id v59 = v40;
  id v41 = (id)[v5 appendBool:v39 counterpart:v58];
  BOOL v42 = [(STTelephonyStatusDomainSIMInfo *)self isPreferredForDataConnections];
  v56[0] = MEMORY[0x1E4F143A8];
  v56[1] = 3221225472;
  v56[2] = __42__STTelephonyStatusDomainSIMInfo_isEqual___block_invoke_13;
  v56[3] = &unk_1E6B630D0;
  id v43 = v40;
  id v57 = v43;
  id v44 = (id)[v5 appendBool:v42 counterpart:v56];
  BOOL v45 = [(STTelephonyStatusDomainSIMInfo *)self isRegisteredWithoutCellular];
  v54[0] = MEMORY[0x1E4F143A8];
  v54[1] = 3221225472;
  v54[2] = __42__STTelephonyStatusDomainSIMInfo_isEqual___block_invoke_14;
  v54[3] = &unk_1E6B630D0;
  id v46 = v43;
  id v55 = v46;
  id v47 = (id)[v5 appendBool:v45 counterpart:v54];
  BOOL v48 = [(STTelephonyStatusDomainSIMInfo *)self isCallForwardingEnabled];
  v52[0] = MEMORY[0x1E4F143A8];
  v52[1] = 3221225472;
  v52[2] = __42__STTelephonyStatusDomainSIMInfo_isEqual___block_invoke_15;
  v52[3] = &unk_1E6B630D0;
  id v53 = v46;
  id v49 = v46;
  id v50 = (id)[v5 appendBool:v48 counterpart:v52];
  LOBYTE(v46) = [v5 isEqual];

  return (char)v46;
}

- (unint64_t)dataNetworkType
{
  return self->_dataNetworkType;
}

- (unint64_t)signalStrengthBars
{
  return self->_signalStrengthBars;
}

- (NSString)shortLabel
{
  return self->_shortLabel;
}

- (NSString)serviceDescription
{
  return self->_serviceDescription;
}

- (NSString)secondaryServiceDescription
{
  return self->_secondaryServiceDescription;
}

- (unint64_t)maxSignalStrengthBars
{
  return self->_maxSignalStrengthBars;
}

- (NSString)label
{
  return self->_label;
}

- (BOOL)isRegisteredWithoutCellular
{
  return self->_registeredWithoutCellular;
}

- (BOOL)isProvidingDataConnection
{
  return self->_providingDataConnection;
}

- (BOOL)isPreferredForDataConnections
{
  return self->_preferredForDataConnections;
}

- (BOOL)isCallForwardingEnabled
{
  return self->_callForwardingEnabled;
}

- (BOOL)isBootstrap
{
  return self->_bootstrap;
}

- (unint64_t)cellularServiceState
{
  return self->_cellularServiceState;
}

uint64_t __42__STTelephonyStatusDomainSIMInfo_isEqual___block_invoke_9(uint64_t a1)
{
  return [*(id *)(a1 + 32) serviceDescription];
}

uint64_t __42__STTelephonyStatusDomainSIMInfo_isEqual___block_invoke_8(uint64_t a1)
{
  return [*(id *)(a1 + 32) cellularServiceState];
}

uint64_t __42__STTelephonyStatusDomainSIMInfo_isEqual___block_invoke_7(uint64_t a1)
{
  return [*(id *)(a1 + 32) serviceState];
}

uint64_t __42__STTelephonyStatusDomainSIMInfo_isEqual___block_invoke_6(uint64_t a1)
{
  return [*(id *)(a1 + 32) maxSignalStrengthBars];
}

uint64_t __42__STTelephonyStatusDomainSIMInfo_isEqual___block_invoke_5(uint64_t a1)
{
  return [*(id *)(a1 + 32) signalStrengthBars];
}

uint64_t __42__STTelephonyStatusDomainSIMInfo_isEqual___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) shortLabel];
}

uint64_t __42__STTelephonyStatusDomainSIMInfo_isEqual___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) label];
}

uint64_t __42__STTelephonyStatusDomainSIMInfo_isEqual___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) isBootstrap];
}

uint64_t __42__STTelephonyStatusDomainSIMInfo_isEqual___block_invoke_15(uint64_t a1)
{
  return [*(id *)(a1 + 32) isCallForwardingEnabled];
}

uint64_t __42__STTelephonyStatusDomainSIMInfo_isEqual___block_invoke_14(uint64_t a1)
{
  return [*(id *)(a1 + 32) isRegisteredWithoutCellular];
}

uint64_t __42__STTelephonyStatusDomainSIMInfo_isEqual___block_invoke_13(uint64_t a1)
{
  return [*(id *)(a1 + 32) isPreferredForDataConnections];
}

uint64_t __42__STTelephonyStatusDomainSIMInfo_isEqual___block_invoke_12(uint64_t a1)
{
  return [*(id *)(a1 + 32) isProvidingDataConnection];
}

uint64_t __42__STTelephonyStatusDomainSIMInfo_isEqual___block_invoke_11(uint64_t a1)
{
  return [*(id *)(a1 + 32) dataNetworkType];
}

uint64_t __42__STTelephonyStatusDomainSIMInfo_isEqual___block_invoke_10(uint64_t a1)
{
  return [*(id *)(a1 + 32) secondaryServiceDescription];
}

uint64_t __42__STTelephonyStatusDomainSIMInfo_isEqual___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) isSIMPresent];
}

- (STTelephonyStatusDomainSIMInfo)init
{
  return (STTelephonyStatusDomainSIMInfo *)-[STTelephonyStatusDomainSIMInfo initWithSIMInfo:](self, 0);
}

- (id)initWithSIMPresent:(char)a3 bootstrap:(void *)a4 label:(void *)a5 shortLabel:(uint64_t)a6 signalStrengthBars:(uint64_t)a7 maxSignalStrengthBars:(uint64_t)a8 serviceState:(uint64_t)a9 cellularServiceState:(void *)a10 serviceDescription:(void *)a11 secondaryServiceDescription:(uint64_t)a12 dataNetworkType:(char)a13 providingDataConnection:(char)a14 preferredForDataConnections:(char)a15 registeredWithoutCellular:(char)a16 callForwardingEnabled:
{
  id v23 = a4;
  id v24 = a5;
  id v25 = a10;
  id v26 = a11;
  if (a1)
  {
    v37.receiver = a1;
    v37.super_class = (Class)STTelephonyStatusDomainSIMInfo;
    unint64_t v27 = objc_msgSendSuper2(&v37, sel_init);
    a1 = v27;
    if (v27)
    {
      v27[8] = a2;
      v27[9] = a3;
      uint64_t v28 = [v23 copy];
      id v29 = (void *)*((void *)a1 + 2);
      *((void *)a1 + 2) = v28;

      uint64_t v30 = [v24 copy];
      id v31 = (void *)*((void *)a1 + 3);
      *((void *)a1 + 3) = v30;

      *((void *)a1 + 4) = a6;
      *((void *)a1 + 5) = a7;
      *((void *)a1 + 6) = a8;
      *((void *)a1 + 7) = a9;
      uint64_t v32 = [v25 copy];
      v33 = (void *)*((void *)a1 + 8);
      *((void *)a1 + 8) = v32;

      uint64_t v34 = [v26 copy];
      id v35 = (void *)*((void *)a1 + 9);
      *((void *)a1 + 9) = v34;

      *((void *)a1 + 10) = a12;
      *((unsigned char *)a1 + 88) = a13;
      *((unsigned char *)a1 + 89) = a14;
      *((unsigned char *)a1 + 90) = a15;
      *((unsigned char *)a1 + 91) = a16;
    }
  }

  return a1;
}

- (id)initWithSIMInfo:(void *)a1
{
  id v2 = a1;
  if (a1)
  {
    id v3 = a2;
    char v19 = [v3 isSIMPresent];
    char v18 = [v3 isBootstrap];
    id v17 = [v3 label];
    id v16 = [v3 shortLabel];
    uint64_t v15 = [v3 signalStrengthBars];
    uint64_t v14 = [v3 maxSignalStrengthBars];
    uint64_t v13 = [v3 serviceState];
    uint64_t v4 = [v3 cellularServiceState];
    v5 = [v3 serviceDescription];
    BOOL v6 = [v3 secondaryServiceDescription];
    uint64_t v7 = [v3 dataNetworkType];
    char v8 = [v3 isProvidingDataConnection];
    char v9 = [v3 isPreferredForDataConnections];
    char v10 = [v3 isRegisteredWithoutCellular];
    char v11 = [v3 isCallForwardingEnabled];

    id v2 = -[STTelephonyStatusDomainSIMInfo initWithSIMPresent:bootstrap:label:shortLabel:signalStrengthBars:maxSignalStrengthBars:serviceState:cellularServiceState:serviceDescription:secondaryServiceDescription:dataNetworkType:providingDataConnection:preferredForDataConnections:registeredWithoutCellular:callForwardingEnabled:](v2, v19, v18, v17, v16, v15, v14, v13, v4, v5, v6, v7, v8, v9, v10, v11);
  }
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secondaryServiceDescription, 0);
  objc_storeStrong((id *)&self->_serviceDescription, 0);
  objc_storeStrong((id *)&self->_shortLabel, 0);

  objc_storeStrong((id *)&self->_label, 0);
}

- (unint64_t)hash
{
  id v3 = [MEMORY[0x1E4F4F758] builder];
  id v4 = (id)objc_msgSend(v3, "appendBool:", -[STTelephonyStatusDomainSIMInfo isSIMPresent](self, "isSIMPresent"));
  id v5 = (id)objc_msgSend(v3, "appendBool:", -[STTelephonyStatusDomainSIMInfo isBootstrap](self, "isBootstrap"));
  BOOL v6 = [(STTelephonyStatusDomainSIMInfo *)self label];
  id v7 = (id)[v3 appendString:v6];

  char v8 = [(STTelephonyStatusDomainSIMInfo *)self shortLabel];
  id v9 = (id)[v3 appendString:v8];

  id v10 = (id)objc_msgSend(v3, "appendUnsignedInteger:", -[STTelephonyStatusDomainSIMInfo signalStrengthBars](self, "signalStrengthBars"));
  id v11 = (id)objc_msgSend(v3, "appendUnsignedInteger:", -[STTelephonyStatusDomainSIMInfo maxSignalStrengthBars](self, "maxSignalStrengthBars"));
  id v12 = (id)objc_msgSend(v3, "appendUnsignedInteger:", -[STTelephonyStatusDomainSIMInfo serviceState](self, "serviceState"));
  id v13 = (id)objc_msgSend(v3, "appendUnsignedInteger:", -[STTelephonyStatusDomainSIMInfo cellularServiceState](self, "cellularServiceState"));
  uint64_t v14 = [(STTelephonyStatusDomainSIMInfo *)self serviceDescription];
  id v15 = (id)[v3 appendString:v14];

  id v16 = [(STTelephonyStatusDomainSIMInfo *)self secondaryServiceDescription];
  id v17 = (id)[v3 appendString:v16];

  id v18 = (id)objc_msgSend(v3, "appendUnsignedInteger:", -[STTelephonyStatusDomainSIMInfo dataNetworkType](self, "dataNetworkType"));
  id v19 = (id)objc_msgSend(v3, "appendBool:", -[STTelephonyStatusDomainSIMInfo isProvidingDataConnection](self, "isProvidingDataConnection"));
  id v20 = (id)objc_msgSend(v3, "appendBool:", -[STTelephonyStatusDomainSIMInfo isPreferredForDataConnections](self, "isPreferredForDataConnections"));
  id v21 = (id)objc_msgSend(v3, "appendBool:", -[STTelephonyStatusDomainSIMInfo isRegisteredWithoutCellular](self, "isRegisteredWithoutCellular"));
  id v22 = (id)objc_msgSend(v3, "appendBool:", -[STTelephonyStatusDomainSIMInfo isCallForwardingEnabled](self, "isCallForwardingEnabled"));
  unint64_t v23 = [v3 hash];

  return v23;
}

- (NSString)description
{
  return (NSString *)[(STTelephonyStatusDomainSIMInfo *)self descriptionWithMultilinePrefix:0];
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id v4 = +[STMutableTelephonyStatusDomainSIMInfo allocWithZone:a3];

  return -[STTelephonyStatusDomainSIMInfo initWithSIMInfo:](v4, self);
}

- (id)succinctDescription
{
  id v2 = [(STTelephonyStatusDomainSIMInfo *)self succinctDescriptionBuilder];
  id v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)[MEMORY[0x1E4F4F718] builderWithObject:self];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  id v3 = [(STTelephonyStatusDomainSIMInfo *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)debugDescriptionWithMultilinePrefix:(id)a3
{
  id v3 = -[STTelephonyStatusDomainSIMInfo _descriptionBuilderWithMultilinePrefix:forDebug:](self, a3, 1);
  id v4 = [v3 build];

  return v4;
}

- (id)_descriptionBuilderWithMultilinePrefix:(uint64_t)a3 forDebug:
{
  id v3 = a1;
  if (a1)
  {
    id v5 = a2;
    BOOL v6 = [v3 succinctDescriptionBuilder];
    [v6 setUseDebugDescription:a3];
    [v6 setActiveMultilinePrefix:v5];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __82__STTelephonyStatusDomainSIMInfo__descriptionBuilderWithMultilinePrefix_forDebug___block_invoke;
    v9[3] = &unk_1E6B63080;
    id v7 = v6;
    id v10 = v7;
    id v11 = v3;
    [v7 appendBodySectionWithName:0 multilinePrefix:v5 block:v9];

    id v3 = v7;
  }

  return v3;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  return -[STTelephonyStatusDomainSIMInfo _descriptionBuilderWithMultilinePrefix:forDebug:](self, a3, 0);
}

id __82__STTelephonyStatusDomainSIMInfo__descriptionBuilderWithMultilinePrefix_forDebug___block_invoke(uint64_t a1)
{
  id v2 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", objc_msgSend(*(id *)(a1 + 40), "isSIMPresent"), @"SIMPresent");
  id v3 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", objc_msgSend(*(id *)(a1 + 40), "isBootstrap"), @"bootstrap");
  id v4 = *(void **)(a1 + 32);
  id v5 = [*(id *)(a1 + 40) label];
  id v6 = (id)[v4 appendObject:v5 withName:@"label"];

  id v7 = *(void **)(a1 + 32);
  char v8 = [*(id *)(a1 + 40) shortLabel];
  id v9 = (id)[v7 appendObject:v8 withName:@"shortLabel"];

  id v10 = (id)objc_msgSend(*(id *)(a1 + 32), "appendUnsignedInteger:withName:", objc_msgSend(*(id *)(a1 + 40), "signalStrengthBars"), @"signalStrengthBars");
  id v11 = (id)objc_msgSend(*(id *)(a1 + 32), "appendUnsignedInteger:withName:", objc_msgSend(*(id *)(a1 + 40), "maxSignalStrengthBars"), @"maxSignalStrengthBars");
  id v12 = *(void **)(a1 + 32);
  unint64_t v13 = [*(id *)(a1 + 40) serviceState] - 1;
  if (v13 > 2) {
    uint64_t v14 = @"No Service";
  }
  else {
    uint64_t v14 = off_1E6B63748[v13];
  }
  id v15 = (id)[v12 appendObject:v14 withName:@"serviceState"];
  id v16 = *(void **)(a1 + 32);
  unint64_t v17 = [*(id *)(a1 + 40) cellularServiceState] - 1;
  if (v17 > 2) {
    id v18 = @"No Service";
  }
  else {
    id v18 = off_1E6B63748[v17];
  }
  id v19 = (id)[v16 appendObject:v18 withName:@"cellularServiceState"];
  id v20 = *(void **)(a1 + 32);
  id v21 = [*(id *)(a1 + 40) serviceDescription];
  id v22 = (id)[v20 appendObject:v21 withName:@"serviceDescription"];

  unint64_t v23 = *(void **)(a1 + 32);
  id v24 = [*(id *)(a1 + 40) secondaryServiceDescription];
  id v25 = (id)[v23 appendObject:v24 withName:@"secondaryServiceDescription"];

  id v26 = *(void **)(a1 + 32);
  unint64_t v27 = STDescriptionForDataNetworkType([*(id *)(a1 + 40) dataNetworkType]);
  id v28 = (id)[v26 appendObject:v27 withName:@"dataNetworkType"];

  id v29 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", objc_msgSend(*(id *)(a1 + 40), "isProvidingDataConnection"), @"providingDataConnection");
  id v30 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", objc_msgSend(*(id *)(a1 + 40), "isPreferredForDataConnections"), @"preferredForDataConnections");
  id v31 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", objc_msgSend(*(id *)(a1 + 40), "isRegisteredWithoutCellular"), @"registeredWithoutCellular");
  return (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", objc_msgSend(*(id *)(a1 + 40), "isCallForwardingEnabled"), @"callForwardingEnabled");
}

- (id)diffFromData:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = +[STTelephonyStatusDomainSIMInfoDiff diffFromInfo:v4 toInfo:self];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (id)dataByApplyingDiff:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if ([v4 isEmpty])
    {
      id v5 = (void *)[(STTelephonyStatusDomainSIMInfo *)self copy];
    }
    else
    {
      id v5 = (void *)[(STTelephonyStatusDomainSIMInfo *)self mutableCopy];
      [v4 applyToMutableInfo:v5];
    }
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v8 = a3;
  objc_msgSend(v8, "encodeBool:forKey:", -[STTelephonyStatusDomainSIMInfo isSIMPresent](self, "isSIMPresent"), @"SIMPresent");
  objc_msgSend(v8, "encodeBool:forKey:", -[STTelephonyStatusDomainSIMInfo isBootstrap](self, "isBootstrap"), @"bootstrap");
  id v4 = [(STTelephonyStatusDomainSIMInfo *)self label];
  [v8 encodeObject:v4 forKey:@"label"];

  id v5 = [(STTelephonyStatusDomainSIMInfo *)self shortLabel];
  [v8 encodeObject:v5 forKey:@"shortLabel"];

  objc_msgSend(v8, "encodeInteger:forKey:", -[STTelephonyStatusDomainSIMInfo signalStrengthBars](self, "signalStrengthBars"), @"signalStrengthBars");
  objc_msgSend(v8, "encodeInteger:forKey:", -[STTelephonyStatusDomainSIMInfo maxSignalStrengthBars](self, "maxSignalStrengthBars"), @"maxSignalStrengthBars");
  objc_msgSend(v8, "encodeInteger:forKey:", -[STTelephonyStatusDomainSIMInfo serviceState](self, "serviceState"), @"serviceState");
  objc_msgSend(v8, "encodeInteger:forKey:", -[STTelephonyStatusDomainSIMInfo cellularServiceState](self, "cellularServiceState"), @"cellularServiceState");
  id v6 = [(STTelephonyStatusDomainSIMInfo *)self serviceDescription];
  [v8 encodeObject:v6 forKey:@"serviceDescription"];

  id v7 = [(STTelephonyStatusDomainSIMInfo *)self secondaryServiceDescription];
  [v8 encodeObject:v7 forKey:@"secondaryServiceDescription"];

  objc_msgSend(v8, "encodeInteger:forKey:", -[STTelephonyStatusDomainSIMInfo dataNetworkType](self, "dataNetworkType"), @"dataNetworkType");
  objc_msgSend(v8, "encodeBool:forKey:", -[STTelephonyStatusDomainSIMInfo isProvidingDataConnection](self, "isProvidingDataConnection"), @"providingDataConnection");
  objc_msgSend(v8, "encodeBool:forKey:", -[STTelephonyStatusDomainSIMInfo isPreferredForDataConnections](self, "isPreferredForDataConnections"), @"preferredForDataConnections");
  objc_msgSend(v8, "encodeBool:forKey:", -[STTelephonyStatusDomainSIMInfo isRegisteredWithoutCellular](self, "isRegisteredWithoutCellular"), @"registeredWithoutCellular");
  objc_msgSend(v8, "encodeBool:forKey:", -[STTelephonyStatusDomainSIMInfo isCallForwardingEnabled](self, "isCallForwardingEnabled"), @"callForwardingEnabled");
}

- (STTelephonyStatusDomainSIMInfo)initWithCoder:(id)a3
{
  id v3 = a3;
  char v20 = [v3 decodeBoolForKey:@"SIMPresent"];
  char v19 = [v3 decodeBoolForKey:@"bootstrap"];
  id v18 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"label"];
  id v4 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"shortLabel"];
  uint64_t v17 = [v3 decodeIntegerForKey:@"signalStrengthBars"];
  uint64_t v16 = [v3 decodeIntegerForKey:@"maxSignalStrengthBars"];
  uint64_t v15 = [v3 decodeIntegerForKey:@"serviceState"];
  uint64_t v5 = [v3 decodeIntegerForKey:@"cellularServiceState"];
  id v6 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"serviceDescription"];
  id v7 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"secondaryServiceDescription"];
  uint64_t v8 = [v3 decodeIntegerForKey:@"dataNetworkType"];
  char v9 = [v3 decodeBoolForKey:@"providingDataConnection"];
  char v10 = [v3 decodeBoolForKey:@"preferredForDataConnections"];
  char v11 = [v3 decodeBoolForKey:@"registeredWithoutCellular"];
  char v12 = [v3 decodeBoolForKey:@"callForwardingEnabled"];

  unint64_t v13 = (STTelephonyStatusDomainSIMInfo *)-[STTelephonyStatusDomainSIMInfo initWithSIMPresent:bootstrap:label:shortLabel:signalStrengthBars:maxSignalStrengthBars:serviceState:cellularServiceState:serviceDescription:secondaryServiceDescription:dataNetworkType:providingDataConnection:preferredForDataConnections:registeredWithoutCellular:callForwardingEnabled:](self, v20, v19, v18, v4, v17, v16, v15, v5, v6, v7, v8, v9, v10, v11, v12);
  return v13;
}

@end
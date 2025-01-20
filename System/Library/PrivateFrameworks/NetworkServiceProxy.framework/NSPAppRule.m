@interface NSPAppRule
+ (BOOL)supportsSecureCoding;
+ (id)copyUUIDsForSigningIdentifier:(id)a3 executablePath:(id)a4;
+ (id)validateRuleDictionary:(id)a3;
+ (void)loadAppRules:(id)a3 withCompletionHandler:(id)a4;
- (BOOL)disabledByRatio;
- (BOOL)isEqual:(id)a3;
- (BOOL)updateNetworkAgent;
- (NSArray)directTLSPorts;
- (NSArray)matchEffectiveApplications;
- (NSData)updateHash;
- (NSDate)enableCheckDate;
- (NSNumber)connectionIdleTimeout;
- (NSNumber)connectionTimeout;
- (NSNumber)disableFallback;
- (NSNumber)divertDNSOnly;
- (NSNumber)enableDirectExtendedValidation;
- (NSNumber)enableDirectMultipath;
- (NSNumber)enableDirectRace;
- (NSNumber)enableDirectTFO;
- (NSNumber)enableMultipath;
- (NSNumber)enableNoTFOCookie;
- (NSNumber)enableOptInPerTask;
- (NSNumber)enableRatio;
- (NSNumber)enableTFO;
- (NSNumber)enableUDPRace;
- (NSNumber)enabled;
- (NSNumber)fallbackBufferLimit;
- (NSNumber)fallbackCountBeforeImmediateFallback;
- (NSNumber)fallbackTimeout;
- (NSNumber)initialWindowSize;
- (NSNumber)noDNSDelegation;
- (NSNumber)reenableInterval;
- (NSNumber)requireTFO;
- (NSNumber)serviceID;
- (NSNumber)shouldComposeInitialData;
- (NSNumber)telemetryRatio;
- (NSNumber)useCustomProtocol;
- (NSNumber)useLocalFlowDivert;
- (NSPAppRule)defaults;
- (NSPAppRule)initWithCoder:(id)a3;
- (NSPNetworkAgent)agent;
- (NSString)edgeSetIdentifier;
- (NSString)label;
- (NSString)locationBundlePath;
- (NSString)proxyEvaluationPath;
- (NSUUID)configurationIdentifier;
- (NWNetworkAgentRegistration)agentRegistration;
- (id)copyAccountIdentifierConditions;
- (id)copyExecutableConditions;
- (id)copyMatchDomainConditions;
- (id)copyMatchEffectiveApplicationConditions;
- (id)copyTLVData;
- (id)copyWithZone:(_NSZone *)a3;
- (id)initFromDictionary:(id)a3;
- (id)initFromTLVs:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)merge:(id)a3;
- (void)saveWithCompletionHandler:(id)a3;
- (void)setAgent:(id)a3;
- (void)setAgentRegistration:(id)a3;
- (void)setConfigurationIdentifier:(id)a3;
- (void)setConnectionIdleTimeout:(id)a3;
- (void)setConnectionTimeout:(id)a3;
- (void)setDefaults:(id)a3;
- (void)setDirectTLSPorts:(id)a3;
- (void)setDisableFallback:(id)a3;
- (void)setDisabledByRatio:(BOOL)a3;
- (void)setDivertDNSOnly:(id)a3;
- (void)setEdgeSetIdentifier:(id)a3;
- (void)setEnableCheckDate:(id)a3;
- (void)setEnableDirectExtendedValidation:(id)a3;
- (void)setEnableDirectMultipath:(id)a3;
- (void)setEnableDirectRace:(id)a3;
- (void)setEnableDirectTFO:(id)a3;
- (void)setEnableMultipath:(id)a3;
- (void)setEnableNoTFOCookie:(id)a3;
- (void)setEnableOptInPerTask:(id)a3;
- (void)setEnableRatio:(id)a3;
- (void)setEnableTFO:(id)a3;
- (void)setEnableUDPRace:(id)a3;
- (void)setEnabled:(id)a3;
- (void)setFallbackBufferLimit:(id)a3;
- (void)setFallbackCountBeforeImmediateFallback:(id)a3;
- (void)setFallbackTimeout:(id)a3;
- (void)setInitialWindowSize:(id)a3;
- (void)setLabel:(id)a3;
- (void)setLocationBundlePath:(id)a3;
- (void)setMatchEffectiveApplications:(id)a3;
- (void)setNoDNSDelegation:(id)a3;
- (void)setProxyEvaluationPath:(id)a3;
- (void)setReenableInterval:(id)a3;
- (void)setRequireTFO:(id)a3;
- (void)setServiceID:(id)a3;
- (void)setShouldComposeInitialData:(id)a3;
- (void)setTelemetryRatio:(id)a3;
- (void)setUpdateHash:(id)a3;
- (void)setUseCustomProtocol:(id)a3;
- (void)setUseLocalFlowDivert:(id)a3;
- (void)teardownNetworkAgent;
@end

@implementation NSPAppRule

+ (id)validateRuleDictionary:(id)a3
{
  uint64_t v123 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = [v3 objectForKeyedSubscript:@"app"];
    objc_opt_class();
    id v116 = v3;
    v117 = v5;
    if (objc_opt_isKindOfClass())
    {
      uint64_t v6 = -[NSDictionary objectForPlatformSpecificKey:](v5, @"label");
      if (v6)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          [v4 appendFormat:@"%@ is not a string: %@\n", @"label", v6];
        }
      }
      uint64_t v7 = -[NSDictionary objectForPlatformSpecificKey:](v5, @"bundle");
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        [v4 appendFormat:@"%@ is not a string: %@\n", @"bundle", v7];
      }
      uint64_t v8 = -[NSDictionary objectForPlatformSpecificKey:](v5, @"ExecutablePath");
      if (v8)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          [v4 appendFormat:@"%@ is not a string: %@\n", @"ExecutablePath", v8];
        }
      }
      uint64_t v9 = -[NSDictionary objectForPlatformSpecificKey:](v5, @"EnableOptIn");
      if (v9)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          [v4 appendFormat:@"%@ is not a number: %@\n", @"EnableOptIn", v9];
        }
      }
      uint64_t v10 = -[NSDictionary objectForPlatformSpecificKey:](v5, @"EnableOptInPerTask");
      if (v10)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          [v4 appendFormat:@"%@ is not a number: %@\n", @"EnableOptInPerTask", v10];
        }
      }
      v105 = (void *)v10;
      uint64_t v11 = -[NSDictionary objectForPlatformSpecificKey:](v5, @"DisableDivertDNS");
      if (v11)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          [v4 appendFormat:@"%@ is not a number: %@\n", @"DisableDivertDNS", v11];
        }
      }
      v104 = (void *)v11;
      uint64_t v12 = -[NSDictionary objectForPlatformSpecificKey:](v5, @"EnableDivertDNSOnly");
      if (v12)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          [v4 appendFormat:@"%@ is not a number: %@\n", @"EnableDivertDNSOnly", v12];
        }
      }
      v103 = (void *)v12;
      uint64_t v13 = -[NSDictionary objectForPlatformSpecificKey:](v5, @"NoDNSDelegation");
      if (v13)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          [v4 appendFormat:@"%@ is not a number: %@\n", @"NoDNSDelegation", v13];
        }
      }
      v102 = (void *)v13;
      uint64_t v14 = -[NSDictionary objectForPlatformSpecificKey:](v5, @"service");
      if (v14)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          [v4 appendFormat:@"%@ is not a string: %@\n", @"service", v14];
        }
      }
      v101 = (void *)v14;
      uint64_t v15 = -[NSDictionary objectForPlatformSpecificKey:](v5, @"edges");
      if (v15)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          [v4 appendFormat:@"%@ is not a string: %@\n", @"edges", v15];
        }
      }
      v100 = (void *)v15;
      uint64_t v16 = -[NSDictionary objectForPlatformSpecificKey:](v5, @"UseCustomProtocol");
      if (v16)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          [v4 appendFormat:@"%@ is not a number: %@\n", @"UseCustomProtocol", v16];
        }
      }
      v99 = (void *)v16;
      uint64_t v17 = -[NSDictionary objectForPlatformSpecificKey:](v5, @"UseLocalFlowDivert");
      if (v17)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          [v4 appendFormat:@"%@ is not a number: %@\n", @"UseLocalFlowDivert", v17];
        }
      }
      v98 = (void *)v17;
      uint64_t v18 = -[NSDictionary objectForPlatformSpecificKey:](v5, @"EnableDirectRace");
      if (v18)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          [v4 appendFormat:@"%@ is not a number: %@\n", @"EnableDirectRace", v18];
        }
      }
      v97 = (void *)v18;
      v107 = (void *)v9;
      v108 = (void *)v8;
      v111 = (void *)v7;
      v114 = (void *)v6;
      uint64_t v19 = -[NSDictionary objectForPlatformSpecificKey:](v5, @"ComposeInitialData");
      if (v19)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          [v4 appendFormat:@"%@ is not a number: %@\n", @"ComposeInitialData", v19];
        }
      }
      v20 = -[NSDictionary objectForPlatformSpecificKey:](v5, @"matchDomains");
      if (v20)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          if ([v20 count])
          {
            unint64_t v21 = 0;
            do
            {
              uint64_t v22 = [v20 objectAtIndexedSubscript:v21];
              if (v22)
              {
                v23 = (void *)v22;
                v24 = [v20 objectAtIndexedSubscript:v21];
                objc_opt_class();
                char isKindOfClass = objc_opt_isKindOfClass();

                if ((isKindOfClass & 1) == 0)
                {
                  v26 = [v20 objectAtIndexedSubscript:v21];
                  [v4 appendFormat:@"%@ does not contain string: %@\n", @"matchDomains", v26];
                }
              }
              ++v21;
            }
            while (v21 < [v20 count]);
          }
        }
        else
        {
          [v4 appendFormat:@"%@ is not an array: %@\n", @"matchDomains", v20];
        }
      }
      v96 = (void *)v19;
      v28 = @"matchEffectiveApplications";
      v29 = -[NSDictionary objectForPlatformSpecificKey:](v117, @"matchEffectiveApplications");
      if (v29)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          if ([v29 count])
          {
            unint64_t v30 = 0;
            v31 = @"matchEffectiveAppSigningIdentifier";
            id v110 = v4;
            do
            {
              uint64_t v32 = [v29 objectAtIndexedSubscript:v30];
              if (v32
                && (v33 = (void *)v32,
                    [v29 objectAtIndexedSubscript:v30],
                    v34 = objc_claimAutoreleasedReturnValue(),
                    objc_opt_class(),
                    char v35 = objc_opt_isKindOfClass(),
                    v34,
                    v33,
                    (v35 & 1) == 0))
              {
                v44 = [v29 objectAtIndexedSubscript:v30];
                [v4 appendFormat:@"%@ does not contain dictionary: %@\n", v28, v44];
              }
              else
              {
                v36 = [v29 objectAtIndexedSubscript:v30];
                v37 = [v36 objectForKeyedSubscript:v31];
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  v38 = [v29 objectAtIndexedSubscript:v30];
                  [v38 objectForKeyedSubscript:@"matchEffectiveAppPath"];
                  v39 = v20;
                  v40 = v28;
                  v42 = v41 = v31;
                  objc_opt_class();
                  char v43 = objc_opt_isKindOfClass();

                  v31 = v41;
                  v28 = v40;
                  v20 = v39;
                  id v4 = v110;

                  if (v43) {
                    goto LABEL_68;
                  }
                }
                else
                {
                }
                v44 = [v29 objectAtIndexedSubscript:v30];
                [v4 appendFormat:@"%@ does not contain dictionary with App signing identifier, designated requirement or path: %@\n", v28, v44];
              }

LABEL_68:
              ++v30;
            }
            while (v30 < [v29 count]);
          }
        }
        else
        {
          [v4 appendFormat:@"%@ is not an array: %@\n", @"matchEffectiveApplications", v29];
        }
      }
      v45 = -[NSDictionary objectForPlatformSpecificKey:](v117, @"locationBundlePath");
      if (v45)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          [v4 appendFormat:@"%@ is not a string: %@\n", @"locationBundlePath", v45];
        }
      }

      id v3 = v116;
      v5 = v117;
    }
    v46 = [v3 objectForKeyedSubscript:@"direct"];
    objc_opt_class();
    v115 = v46;
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
LABEL_117:
      v63 = [v3 objectForKeyedSubscript:@"timer"];
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_137;
      }
      v64 = -[NSDictionary objectForPlatformSpecificKey:](v63, @"fallback");
      if (v64)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          [v64 doubleValue];
          if (v65 >= 0.0) {
            goto LABEL_124;
          }
          v66 = @"%@ must be a positive number or 0: %@";
        }
        else
        {
          v66 = @"%@ is not a number: %@";
        }
        objc_msgSend(v4, "appendFormat:", v66, @"fallback", v64);
      }
LABEL_124:
      v67 = -[NSDictionary objectForPlatformSpecificKey:](v63, @"connection");
      if (!v67) {
        goto LABEL_130;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [v67 doubleValue];
        if (v68 >= 0.0) {
          goto LABEL_130;
        }
        v69 = @"%@ must be a positive number or 0: %@";
      }
      else
      {
        v69 = @"%@ is not a number: %@";
      }
      objc_msgSend(v4, "appendFormat:", v69, @"connection", v67);
LABEL_130:
      v70 = -[NSDictionary objectForPlatformSpecificKey:](v63, @"idle");
      if (v70)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v72 = @"%@ is not a number: %@";
          goto LABEL_135;
        }
        [v70 doubleValue];
        if (v71 < 0.0)
        {
          v72 = @"%@ must be a positive number or 0: %@";
LABEL_135:
          objc_msgSend(v4, "appendFormat:", v72, @"idle", v70);
        }
      }

LABEL_137:
      v73 = [v3 objectForKeyedSubscript:@"transport"];
      objc_opt_class();
      v113 = v63;
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_160;
      }
      v74 = -[NSDictionary objectForPlatformSpecificKey:](v73, @"tfo");
      if (v74)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          [v4 appendFormat:@"%@ is not a number: %@", @"tfo", v74];
        }
      }
      v75 = -[NSDictionary objectForPlatformSpecificKey:](v73, @"notfocookie");
      if (v75)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          [v4 appendFormat:@"%@ is not a number: %@", @"notfocookie", v75];
        }
      }
      v76 = -[NSDictionary objectForPlatformSpecificKey:](v73, @"mptcp");
      if (v76)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          [v4 appendFormat:@"%@ is not a number: %@", @"mptcp", v76];
        }
      }
      v77 = -[NSDictionary objectForPlatformSpecificKey:](v73, @"udp");
      if (v77)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          [v4 appendFormat:@"%@ is not a number: %@", @"udp", v77];
        }
      }
      v78 = -[NSDictionary objectForPlatformSpecificKey:](v73, @"rwnd");
      if (v78)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          if (([v78 integerValue] & 0x8000000000000000) == 0) {
            goto LABEL_156;
          }
          v79 = @"%@ must be a positive number or 0: %@";
        }
        else
        {
          v79 = @"%@ is not a number: %@";
        }
        objc_msgSend(v4, "appendFormat:", v79, @"rwnd", v78);
      }
LABEL_156:
      v80 = -[NSDictionary objectForPlatformSpecificKey:](v73, @"must-tfo");
      if (v80)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          [v4 appendFormat:@"%@ is not a number: %@", @"must-tfo", v80];
        }
      }

      id v3 = v116;
      v5 = v117;
      v63 = v113;
LABEL_160:
      v81 = [v3 objectForKeyedSubscript:@"enable"];
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_177;
      }
      v82 = -[NSDictionary objectForPlatformSpecificKey:](v81, @"Enabled");
      if (v82)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          [v4 appendFormat:@"%@ is not a number: %@", @"Enabled", v82];
        }
      }
      v83 = -[NSDictionary objectForPlatformSpecificKey:](v81, @"ratio");
      if (v83)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          [v83 doubleValue];
          if (v84 < 0.0 || ([v83 doubleValue], v85 > 1.0)) {
            [v4 appendFormat:@"%@ must be a number between 0.0 and 1.0 inclusive", @"ratio", v95];
          }
        }
        else
        {
          [v4 appendFormat:@"%@ is not a number: %@", @"ratio", v83];
        }
      }
      v86 = -[NSDictionary objectForPlatformSpecificKey:](v81, @"interval");
      if (v86)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v88 = @"%@ is not a number: %@";
          goto LABEL_175;
        }
        [v86 doubleValue];
        if (v87 < 0.0)
        {
          v88 = @"%@ must be a positive number or 0: %@";
LABEL_175:
          objc_msgSend(v4, "appendFormat:", v88, @"interval", v86);
        }
      }

      v63 = v113;
LABEL_177:
      v89 = [v3 objectForKeyedSubscript:@"telemetry"];
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
LABEL_186:
        if ([v4 length])
        {
          v27 = [NSString stringWithString:v4];
        }
        else
        {
          v27 = 0;
        }

        goto LABEL_190;
      }
      v90 = -[NSDictionary objectForPlatformSpecificKey:](v89, @"ratio");
      if (v90)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          [v90 doubleValue];
          if (v91 >= 0.0)
          {
            [v90 doubleValue];
            if (v92 <= 1.0) {
              goto LABEL_185;
            }
          }
          v93 = @"%@ must be a positive number or 0: %@";
        }
        else
        {
          v93 = @"%@ is not a number: %@";
        }
        objc_msgSend(v4, "appendFormat:", v93, @"ratio", v90);
      }
LABEL_185:

      goto LABEL_186;
    }
    v47 = -[NSDictionary objectForPlatformSpecificKey:](v46, @"DisableFallback");
    if (v47)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        [v4 appendFormat:@"%@ is not a number: %@\n", @"DisableFallback", v47];
      }
    }
    v48 = -[NSDictionary objectForPlatformSpecificKey:](v46, @"EnableDirectMultipath");
    if (v48)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        [v4 appendFormat:@"%@ is not a number: %@\n", @"EnableDirectMultipath", v48];
      }
    }
    v49 = -[NSDictionary objectForPlatformSpecificKey:](v46, @"EnableDirectTFO");
    if (v49)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        [v4 appendFormat:@"%@ is not a number: %@\n", @"EnableDirectTFO", v49];
      }
    }
    uint64_t v50 = -[NSDictionary objectForPlatformSpecificKey:](v46, @"EnableDirectExtendedValidation");
    if (v50)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        [v4 appendFormat:@"%@ is not a number: %@\n", @"EnableDirectExtendedValidation", v50];
      }
    }
    v112 = (void *)v50;
    v51 = -[NSDictionary objectForPlatformSpecificKey:](v46, @"DirectTLSPorts");
    if (v51)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v106 = v49;
        v109 = v47;
        long long v120 = 0u;
        long long v121 = 0u;
        long long v118 = 0u;
        long long v119 = 0u;
        id v52 = v51;
        uint64_t v53 = [v52 countByEnumeratingWithState:&v118 objects:v122 count:16];
        if (v53)
        {
          uint64_t v54 = v53;
          uint64_t v55 = *(void *)v119;
          do
          {
            for (uint64_t i = 0; i != v54; ++i)
            {
              if (*(void *)v119 != v55) {
                objc_enumerationMutation(v52);
              }
              uint64_t v57 = *(void *)(*((void *)&v118 + 1) + 8 * i);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0) {
                [v4 appendFormat:@"%@ contains a non-number: %@", @"DirectTLSPorts", v57];
              }
            }
            uint64_t v54 = [v52 countByEnumeratingWithState:&v118 objects:v122 count:16];
          }
          while (v54);
        }

        v47 = v109;
        v49 = v106;
      }
      else
      {
        [v4 appendFormat:@"%@ is not an array: %@\n", @"DirectTLSPorts", v51];
      }
    }
    v58 = -[NSDictionary objectForPlatformSpecificKey:](v46, @"FallbackBufferLimit");
    if (v58)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        if (([v58 integerValue] & 0x8000000000000000) == 0) {
          goto LABEL_107;
        }
        v59 = @"%@ must be a positive number or 0: %@\n";
      }
      else
      {
        v59 = @"%@ is not a number: %@\n";
      }
      objc_msgSend(v4, "appendFormat:", v59, @"FallbackBufferLimit", v58);
    }
LABEL_107:
    v60 = -[NSDictionary objectForPlatformSpecificKey:](v46, @"FallbackCountBeforeImmediateFallback");
    if (!v60) {
      goto LABEL_113;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if (([v60 integerValue] & 0x8000000000000000) == 0) {
        goto LABEL_113;
      }
      v61 = @"%@ must be a positive number or 0: %@\n";
    }
    else
    {
      v61 = @"%@ is not a number: %@\n";
    }
    objc_msgSend(v4, "appendFormat:", v61, @"FallbackCountBeforeImmediateFallback", v60);
LABEL_113:
    v62 = -[NSDictionary objectForPlatformSpecificKey:](v46, @"ProxyEvaluationPath");
    if (v62)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        [v4 appendFormat:@"%@ is not a string: %@", @"ProxyEvaluationPath", v62];
      }
    }

    id v3 = v116;
    v5 = v117;
    goto LABEL_117;
  }
  [v4 appendFormat:@"dictionary parameter is not a dictionary: %@", v3];
  v27 = [NSString stringWithString:v4];
LABEL_190:

  return v27;
}

- (id)initFromDictionary:(id)a3
{
  return 0;
}

+ (void)loadAppRules:(id)a3 withCompletionHandler:(id)a4
{
  id v5 = a3;
  uint64_t v6 = (void (**)(id, void))a4;
  uint64_t v7 = getServerConnection();
  if (!v7)
  {
    uint64_t v8 = nplog_obj();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)uint64_t v9 = 0;
      _os_log_error_impl(&dword_1A0FEE000, v8, OS_LOG_TYPE_ERROR, "Failed to create the XPC connection to the server", v9, 2u);
    }

    v6[2](v6, 0);
  }
  [v7 fetchAppRuleForLabel:v5 completionHandler:v6];
}

- (void)saveWithCompletionHandler:(id)a3
{
  id v4 = (void (**)(id, __CFString *))a3;
  id v5 = getServerConnection();
  if (!v5)
  {
    uint64_t v6 = nplog_obj();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)uint64_t v8 = 0;
      _os_log_error_impl(&dword_1A0FEE000, v6, OS_LOG_TYPE_ERROR, "Failed to create the XPC connection to the server", v8, 2u);
    }

    v4[2](v4, @"Failed to connect to networkserviceproxy");
  }
  uint64_t v7 = [(NSPAppRule *)self label];
  [v5 setAppRule:self forLabel:v7 completionHandler:v4];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSPAppRule)initWithCoder:(id)a3
{
  id v4 = a3;
  v85.receiver = self;
  v85.super_class = (Class)NSPAppRule;
  id v5 = [(NEAppRule *)&v85 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"EnableDivertDNSOnly"];
    divertDNSOnly = v5->_divertDNSOnly;
    v5->_divertDNSOnly = (NSNumber *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"NoDNSDelegation"];
    noDNSDelegation = v5->_noDNSDelegation;
    v5->_noDNSDelegation = (NSNumber *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"DisableFallback"];
    disableFallback = v5->_disableFallback;
    v5->_disableFallback = (NSNumber *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"EnableDirectMultipath"];
    enableDirectMultipath = v5->_enableDirectMultipath;
    v5->_enableDirectMultipath = (NSNumber *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"EnableDirectExtendedValidation"];
    enableDirectExtendedValidation = v5->_enableDirectExtendedValidation;
    v5->_enableDirectExtendedValidation = (NSNumber *)v14;

    uint64_t v16 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v17 = objc_opt_class();
    uint64_t v18 = objc_msgSend(v16, "setWithObjects:", v17, objc_opt_class(), 0);
    uint64_t v19 = [v4 decodeObjectOfClasses:v18 forKey:@"DirectTLSPorts"];
    directTLSPorts = v5->_directTLSPorts;
    v5->_directTLSPorts = (NSArray *)v19;

    uint64_t v21 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"EnableDirectTFO"];
    enableDirectTFO = v5->_enableDirectTFO;
    v5->_enableDirectTFO = (NSNumber *)v21;

    uint64_t v23 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ServiceID"];
    serviceID = v5->_serviceID;
    v5->_serviceID = (NSNumber *)v23;

    uint64_t v25 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Enabled"];
    enabled = v5->_enabled;
    v5->_enabled = (NSNumber *)v25;

    uint64_t v27 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"fallback"];
    fallbackTimeout = v5->_fallbackTimeout;
    v5->_fallbackTimeout = (NSNumber *)v27;

    uint64_t v29 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"FallbackBufferLimit"];
    fallbackBufferLimit = v5->_fallbackBufferLimit;
    v5->_fallbackBufferLimit = (NSNumber *)v29;

    uint64_t v31 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"FallbackCountBeforeImmediateFallback"];
    fallbackCountBeforeImmediateFallback = v5->_fallbackCountBeforeImmediateFallback;
    v5->_fallbackCountBeforeImmediateFallback = (NSNumber *)v31;

    uint64_t v33 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ProxyEvaluationPath"];
    proxyEvaluationPath = v5->_proxyEvaluationPath;
    v5->_proxyEvaluationPath = (NSString *)v33;

    uint64_t v35 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"UseCustomProtocol"];
    useCustomProtocol = v5->_useCustomProtocol;
    v5->_useCustomProtocol = (NSNumber *)v35;

    uint64_t v37 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"UseLocalFlowDivert"];
    useLocalFlowDivert = v5->_useLocalFlowDivert;
    v5->_useLocalFlowDivert = (NSNumber *)v37;

    uint64_t v39 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"EnableDirectRace"];
    enableDirectRace = v5->_enableDirectRace;
    v5->_enableDirectRace = (NSNumber *)v39;

    uint64_t v41 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ComposeInitialData"];
    shouldComposeInitialData = v5->_shouldComposeInitialData;
    v5->_shouldComposeInitialData = (NSNumber *)v41;

    uint64_t v43 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"label"];
    label = v5->_label;
    v5->_label = (NSString *)v43;

    uint64_t v45 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"edges"];
    edgeSetIdentifier = v5->_edgeSetIdentifier;
    v5->_edgeSetIdentifier = (NSString *)v45;

    uint64_t v47 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"connection"];
    connectionTimeout = v5->_connectionTimeout;
    v5->_connectionTimeout = (NSNumber *)v47;

    uint64_t v49 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"idle"];
    connectionIdleTimeout = v5->_connectionIdleTimeout;
    v5->_connectionIdleTimeout = (NSNumber *)v49;

    uint64_t v51 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"tfo"];
    enableTFO = v5->_enableTFO;
    v5->_enableTFO = (NSNumber *)v51;

    uint64_t v53 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"must-tfo"];
    requireTFO = v5->_requireTFO;
    v5->_requireTFO = (NSNumber *)v53;

    uint64_t v55 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"notfocookie"];
    enableNoTFOCookie = v5->_enableNoTFOCookie;
    v5->_enableNoTFOCookie = (NSNumber *)v55;

    uint64_t v57 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"mptcp"];
    enableMultipath = v5->_enableMultipath;
    v5->_enableMultipath = (NSNumber *)v57;

    uint64_t v59 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"udp"];
    enableUDPRace = v5->_enableUDPRace;
    v5->_enableUDPRace = (NSNumber *)v59;

    uint64_t v61 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"enable-ratio"];
    enableRatio = v5->_enableRatio;
    v5->_enableRatio = (NSNumber *)v61;

    uint64_t v63 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"interval"];
    reenableInterval = v5->_reenableInterval;
    v5->_reenableInterval = (NSNumber *)v63;

    uint64_t v65 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"telemetry-ratio"];
    telemetryRatio = v5->_telemetryRatio;
    v5->_telemetryRatio = (NSNumber *)v65;

    uint64_t v67 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"configID"];
    configurationIdentifier = v5->_configurationIdentifier;
    v5->_configurationIdentifier = (NSUUID *)v67;

    uint64_t v69 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"EnableOptInPerTask"];
    enableOptInPerTask = v5->_enableOptInPerTask;
    v5->_enableOptInPerTask = (NSNumber *)v69;

    double v71 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v72 = objc_opt_class();
    v73 = objc_msgSend(v71, "setWithObjects:", v72, objc_opt_class(), 0);
    uint64_t v74 = [v4 decodeObjectOfClasses:v73 forKey:@"matchEffectiveApplications"];
    matchEffectiveApplications = v5->_matchEffectiveApplications;
    v5->_matchEffectiveApplications = (NSArray *)v74;

    uint64_t v76 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"enableCheckDate"];
    enableCheckDate = v5->_enableCheckDate;
    v5->_enableCheckDate = (NSDate *)v76;

    v5->_disabledByRatio = [v4 decodeBoolForKey:@"disabledByRatio"];
    uint64_t v78 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"locationBundlePath"];
    locationBundlePath = v5->_locationBundlePath;
    v5->_locationBundlePath = (NSString *)v78;

    uint64_t v80 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"rwnd"];
    initialWindowSize = v5->_initialWindowSize;
    v5->_initialWindowSize = (NSNumber *)v80;

    uint64_t v82 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"appRuleUpdateHash"];
    updateHash = v5->_updateHash;
    v5->_updateHash = (NSData *)v82;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v70.receiver = self;
  v70.super_class = (Class)NSPAppRule;
  [(NEAppRule *)&v70 encodeWithCoder:v4];
  divertDNSOnly = self->_divertDNSOnly;
  uint64_t v6 = [(NSPAppRule *)self->_defaults divertDNSOnly];
  LOBYTE(divertDNSOnly) = myIsEqual(divertDNSOnly, v6);

  if ((divertDNSOnly & 1) == 0) {
    [v4 encodeObject:self->_divertDNSOnly forKey:@"EnableDivertDNSOnly"];
  }
  noDNSDelegation = self->_noDNSDelegation;
  uint64_t v8 = [(NSPAppRule *)self->_defaults noDNSDelegation];
  LOBYTE(noDNSDelegation) = myIsEqual(noDNSDelegation, v8);

  if ((noDNSDelegation & 1) == 0) {
    [v4 encodeObject:self->_noDNSDelegation forKey:@"NoDNSDelegation"];
  }
  disableFallback = self->_disableFallback;
  uint64_t v10 = [(NSPAppRule *)self->_defaults disableFallback];
  LOBYTE(disableFallback) = myIsEqual(disableFallback, v10);

  if ((disableFallback & 1) == 0) {
    [v4 encodeObject:self->_disableFallback forKey:@"DisableFallback"];
  }
  enableDirectMultipath = self->_enableDirectMultipath;
  uint64_t v12 = [(NSPAppRule *)self->_defaults enableDirectMultipath];
  LOBYTE(enableDirectMultipath) = myIsEqual(enableDirectMultipath, v12);

  if ((enableDirectMultipath & 1) == 0) {
    [v4 encodeObject:self->_enableDirectMultipath forKey:@"EnableDirectMultipath"];
  }
  enableDirectExtendedValidation = self->_enableDirectExtendedValidation;
  uint64_t v14 = [(NSPAppRule *)self->_defaults enableDirectExtendedValidation];
  LOBYTE(enableDirectExtendedValidation) = myIsEqual(enableDirectExtendedValidation, v14);

  if ((enableDirectExtendedValidation & 1) == 0) {
    [v4 encodeObject:self->_enableDirectExtendedValidation forKey:@"EnableDirectExtendedValidation"];
  }
  directTLSPorts = self->_directTLSPorts;
  uint64_t v16 = [(NSPAppRule *)self->_defaults directTLSPorts];
  LOBYTE(directTLSPorts) = myIsEqual(directTLSPorts, v16);

  if ((directTLSPorts & 1) == 0) {
    [v4 encodeObject:self->_directTLSPorts forKey:@"DirectTLSPorts"];
  }
  enableDirectTFO = self->_enableDirectTFO;
  uint64_t v18 = [(NSPAppRule *)self->_defaults enableDirectTFO];
  LOBYTE(enableDirectTFO) = myIsEqual(enableDirectTFO, v18);

  if ((enableDirectTFO & 1) == 0) {
    [v4 encodeObject:self->_enableDirectTFO forKey:@"EnableDirectTFO"];
  }
  serviceID = self->_serviceID;
  v20 = [(NSPAppRule *)self->_defaults serviceID];
  LOBYTE(serviceID) = myIsEqual(serviceID, v20);

  if ((serviceID & 1) == 0) {
    [v4 encodeObject:self->_serviceID forKey:@"ServiceID"];
  }
  enabled = self->_enabled;
  uint64_t v22 = [(NSPAppRule *)self->_defaults enabled];
  LOBYTE(enabled) = myIsEqual(enabled, v22);

  if ((enabled & 1) == 0) {
    [v4 encodeObject:self->_enabled forKey:@"Enabled"];
  }
  fallbackTimeout = self->_fallbackTimeout;
  v24 = [(NSPAppRule *)self->_defaults fallbackTimeout];
  LOBYTE(fallbackTimeout) = myIsEqual(fallbackTimeout, v24);

  if ((fallbackTimeout & 1) == 0) {
    [v4 encodeObject:self->_fallbackTimeout forKey:@"fallback"];
  }
  fallbackBufferLimit = self->_fallbackBufferLimit;
  v26 = [(NSPAppRule *)self->_defaults fallbackBufferLimit];
  LOBYTE(fallbackBufferLimit) = myIsEqual(fallbackBufferLimit, v26);

  if ((fallbackBufferLimit & 1) == 0) {
    [v4 encodeObject:self->_fallbackBufferLimit forKey:@"FallbackBufferLimit"];
  }
  fallbackCountBeforeImmediateFallback = self->_fallbackCountBeforeImmediateFallback;
  v28 = [(NSPAppRule *)self->_defaults fallbackCountBeforeImmediateFallback];
  LOBYTE(fallbackCountBeforeImmediateFallback) = myIsEqual(fallbackCountBeforeImmediateFallback, v28);

  if ((fallbackCountBeforeImmediateFallback & 1) == 0) {
    [v4 encodeObject:self->_fallbackCountBeforeImmediateFallback forKey:@"FallbackCountBeforeImmediateFallback"];
  }
  proxyEvaluationPath = self->_proxyEvaluationPath;
  unint64_t v30 = [(NSPAppRule *)self->_defaults proxyEvaluationPath];
  LOBYTE(proxyEvaluationPath) = myIsEqual(proxyEvaluationPath, v30);

  if ((proxyEvaluationPath & 1) == 0) {
    [v4 encodeObject:self->_proxyEvaluationPath forKey:@"ProxyEvaluationPath"];
  }
  useCustomProtocol = self->_useCustomProtocol;
  uint64_t v32 = [(NSPAppRule *)self->_defaults useCustomProtocol];
  LOBYTE(useCustomProtocol) = myIsEqual(useCustomProtocol, v32);

  if ((useCustomProtocol & 1) == 0) {
    [v4 encodeObject:self->_useCustomProtocol forKey:@"UseCustomProtocol"];
  }
  useLocalFlowDivert = self->_useLocalFlowDivert;
  v34 = [(NSPAppRule *)self->_defaults useLocalFlowDivert];
  LOBYTE(useLocalFlowDivert) = myIsEqual(useLocalFlowDivert, v34);

  if ((useLocalFlowDivert & 1) == 0) {
    [v4 encodeObject:self->_useLocalFlowDivert forKey:@"UseLocalFlowDivert"];
  }
  enableDirectRace = self->_enableDirectRace;
  v36 = [(NSPAppRule *)self->_defaults enableDirectRace];
  LOBYTE(enableDirectRace) = myIsEqual(enableDirectRace, v36);

  if ((enableDirectRace & 1) == 0) {
    [v4 encodeObject:self->_enableDirectRace forKey:@"EnableDirectRace"];
  }
  shouldComposeInitialData = self->_shouldComposeInitialData;
  v38 = [(NSPAppRule *)self->_defaults shouldComposeInitialData];
  LOBYTE(shouldComposeInitialData) = myIsEqual(shouldComposeInitialData, v38);

  if ((shouldComposeInitialData & 1) == 0) {
    [v4 encodeObject:self->_shouldComposeInitialData forKey:@"ComposeInitialData"];
  }
  label = self->_label;
  v40 = [(NSPAppRule *)self->_defaults label];
  LOBYTE(label) = myIsEqual(label, v40);

  if ((label & 1) == 0) {
    [v4 encodeObject:self->_label forKey:@"label"];
  }
  [v4 encodeObject:self->_edgeSetIdentifier forKey:@"edges"];
  connectionTimeout = self->_connectionTimeout;
  v42 = [(NSPAppRule *)self->_defaults connectionTimeout];
  LOBYTE(connectionTimeout) = myIsEqual(connectionTimeout, v42);

  if ((connectionTimeout & 1) == 0) {
    [v4 encodeObject:self->_connectionTimeout forKey:@"connection"];
  }
  connectionIdleTimeout = self->_connectionIdleTimeout;
  v44 = [(NSPAppRule *)self->_defaults connectionIdleTimeout];
  LOBYTE(connectionIdleTimeout) = myIsEqual(connectionIdleTimeout, v44);

  if ((connectionIdleTimeout & 1) == 0) {
    [v4 encodeObject:self->_connectionIdleTimeout forKey:@"idle"];
  }
  enableTFO = self->_enableTFO;
  v46 = [(NSPAppRule *)self->_defaults enableTFO];
  LOBYTE(enableTFO) = myIsEqual(enableTFO, v46);

  if ((enableTFO & 1) == 0) {
    [v4 encodeObject:self->_enableTFO forKey:@"tfo"];
  }
  requireTFO = self->_requireTFO;
  v48 = [(NSPAppRule *)self->_defaults requireTFO];
  LOBYTE(requireTFO) = myIsEqual(requireTFO, v48);

  if ((requireTFO & 1) == 0) {
    [v4 encodeObject:self->_requireTFO forKey:@"must-tfo"];
  }
  enableNoTFOCookie = self->_enableNoTFOCookie;
  uint64_t v50 = [(NSPAppRule *)self->_defaults enableNoTFOCookie];
  LOBYTE(enableNoTFOCookie) = myIsEqual(enableNoTFOCookie, v50);

  if ((enableNoTFOCookie & 1) == 0) {
    [v4 encodeObject:self->_enableTFO forKey:@"notfocookie"];
  }
  enableMultipath = self->_enableMultipath;
  id v52 = [(NSPAppRule *)self->_defaults enableMultipath];
  LOBYTE(enableMultipath) = myIsEqual(enableMultipath, v52);

  if ((enableMultipath & 1) == 0) {
    [v4 encodeObject:self->_enableMultipath forKey:@"mptcp"];
  }
  enableUDPRace = self->_enableUDPRace;
  uint64_t v54 = [(NSPAppRule *)self->_defaults enableUDPRace];
  LOBYTE(enableUDPRace) = myIsEqual(enableUDPRace, v54);

  if ((enableUDPRace & 1) == 0) {
    [v4 encodeObject:self->_enableUDPRace forKey:@"udp"];
  }
  enableRatio = self->_enableRatio;
  v56 = [(NSPAppRule *)self->_defaults enableRatio];
  LOBYTE(enableRatio) = myIsEqual(enableRatio, v56);

  if ((enableRatio & 1) == 0) {
    [v4 encodeObject:self->_enableRatio forKey:@"enable-ratio"];
  }
  reenableInterval = self->_reenableInterval;
  v58 = [(NSPAppRule *)self->_defaults reenableInterval];
  LOBYTE(reenableInterval) = myIsEqual(reenableInterval, v58);

  if ((reenableInterval & 1) == 0) {
    [v4 encodeObject:self->_reenableInterval forKey:@"interval"];
  }
  telemetryRatio = self->_telemetryRatio;
  v60 = [(NSPAppRule *)self->_defaults telemetryRatio];
  LOBYTE(telemetryRatio) = myIsEqual(telemetryRatio, v60);

  if ((telemetryRatio & 1) == 0) {
    [v4 encodeObject:self->_telemetryRatio forKey:@"telemetry-ratio"];
  }
  enableOptInPerTask = self->_enableOptInPerTask;
  v62 = [(NSPAppRule *)self->_defaults enableOptInPerTask];
  LOBYTE(enableOptInPerTask) = myIsEqual(enableOptInPerTask, v62);

  if ((enableOptInPerTask & 1) == 0) {
    [v4 encodeObject:self->_enableOptInPerTask forKey:@"EnableOptInPerTask"];
  }
  matchEffectiveApplications = self->_matchEffectiveApplications;
  v64 = [(NSPAppRule *)self->_defaults matchEffectiveApplications];
  LOBYTE(matchEffectiveApplications) = myIsEqual(matchEffectiveApplications, v64);

  if ((matchEffectiveApplications & 1) == 0) {
    [v4 encodeObject:self->_matchEffectiveApplications forKey:@"matchEffectiveApplications"];
  }
  [v4 encodeObject:self->_configurationIdentifier forKey:@"configID"];
  [v4 encodeObject:self->_enableCheckDate forKey:@"enableCheckDate"];
  [v4 encodeBool:self->_disabledByRatio forKey:@"disabledByRatio"];
  locationBundlePath = self->_locationBundlePath;
  v66 = [(NSPAppRule *)self->_defaults locationBundlePath];
  LOBYTE(locationBundlePath) = myIsEqual(locationBundlePath, v66);

  if ((locationBundlePath & 1) == 0) {
    [v4 encodeObject:self->_locationBundlePath forKey:@"locationBundlePath"];
  }
  initialWindowSize = self->_initialWindowSize;
  double v68 = [(NSPAppRule *)self->_defaults initialWindowSize];
  LOBYTE(initialWindowSize) = myIsEqual(initialWindowSize, v68);

  if ((initialWindowSize & 1) == 0) {
    [v4 encodeObject:self->_initialWindowSize forKey:@"rwnd"];
  }
  uint64_t v69 = [(NSPAppRule *)self updateHash];
  [v4 encodeObject:v69 forKey:@"appRuleUpdateHash"];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  id v5 = [(NEAppRule *)self matchSigningIdentifier];
  long long v118 = [v4 matchSigningIdentifier];
  id v119 = v5;
  int IsEqual = myIsEqual(v5, v118);
  if (!IsEqual)
  {
    int v20 = 0;
    uint64_t v120 = 0;
    int v12 = 0;
    int v13 = 0;
    int v114 = 0;
    memset(v115, 0, sizeof(v115));
    int v14 = 0;
    int v15 = 0;
    int v16 = 0;
    uint64_t v113 = 0;
    uint64_t v112 = 0;
    uint64_t v111 = 0;
    BOOL v116 = 0;
    memset(v109, 0, sizeof(v109));
    memset(v110, 0, sizeof(v110));
    int v17 = 0;
    int v18 = 0;
    int v19 = 0;
    int v21 = 0;
    int v22 = 0;
    goto LABEL_10;
  }
  uint64_t v7 = [(NEAppRule *)self matchAccountIdentifiers];
  v107 = [v4 matchAccountIdentifiers];
  v108 = v7;
  if (!myIsEqual(v7, v107))
  {
    uint64_t v120 = 0;
    int v12 = 0;
    int v13 = 0;
    int v114 = 0;
    memset(v115, 0, sizeof(v115));
    int v14 = 0;
    int v15 = 0;
    int v16 = 0;
    uint64_t v113 = 0;
    uint64_t v112 = 0;
    uint64_t v111 = 0;
    BOOL v116 = 0;
    memset(v109, 0, sizeof(v109));
    memset(v110, 0, sizeof(v110));
    int v17 = 0;
    int v18 = 0;
    int v19 = 0;
    int v20 = 0;
    int v21 = 0;
    int v22 = 0;
    goto LABEL_10;
  }
  uint64_t v8 = [(NEAppRule *)self matchPath];
  v104 = [v4 matchPath];
  v105 = v8;
  if (!myIsEqual(v8, v104))
  {
    int v12 = 0;
    int v13 = 0;
    int v114 = 0;
    memset(v115, 0, sizeof(v115));
    int v14 = 0;
    int v15 = 0;
    int v16 = 0;
    uint64_t v113 = 0;
    uint64_t v112 = 0;
    uint64_t v111 = 0;
    BOOL v116 = 0;
    memset(v109, 0, sizeof(v109));
    memset(v110, 0, sizeof(v110));
    int v17 = 0;
    int v18 = 0;
    int v19 = 0;
    int v20 = 0;
    int v21 = 0;
    int v22 = 0;
    uint64_t v120 = 1;
    goto LABEL_10;
  }
  uint64_t v9 = [(NEAppRule *)self matchDomains];
  v102 = [v4 matchDomains];
  v103 = v9;
  if (!myIsEqual(v9, v102))
  {
    *(void *)v115 = 0;
    *(void *)&v115[8] = 0;
    int v12 = 0;
    int v13 = 0;
    int v14 = 0;
    int v15 = 0;
    int v16 = 0;
    uint64_t v113 = 0;
    uint64_t v112 = 0;
    uint64_t v111 = 0;
    BOOL v116 = 0;
    memset(v109, 0, sizeof(v109));
    memset(v110, 0, sizeof(v110));
    int v114 = 0;
    int v17 = 0;
    int v18 = 0;
    int v19 = 0;
    int v20 = 0;
    int v21 = 0;
    int v22 = 0;
    uint64_t v120 = 1;
    *(_DWORD *)&v115[16] = 1;
    goto LABEL_10;
  }
  matchEffectiveApplications = self->_matchEffectiveApplications;
  v101 = [v4 matchEffectiveApplications];
  if (!myIsEqual(matchEffectiveApplications, v101)
    || (int v11 = -[NEAppRule noDivertDNS](self, "noDivertDNS"), v11 != [v4 noDivertDNS]))
  {
    *(void *)v115 = 0;
    int v12 = 0;
    int v13 = 0;
    int v14 = 0;
    int v15 = 0;
    int v16 = 0;
    uint64_t v113 = 0;
    uint64_t v112 = 0;
    uint64_t v111 = 0;
    BOOL v116 = 0;
    memset(v109, 0, sizeof(v109));
    memset(v110, 0, sizeof(v110));
    int v114 = 0;
    int v17 = 0;
    int v18 = 0;
    int v19 = 0;
    int v20 = 0;
    int v21 = 0;
    int v22 = 0;
    uint64_t v120 = 1;
    *(_DWORD *)&v115[16] = 1;
    *(void *)&v115[8] = 1;
    goto LABEL_10;
  }
  disableFallback = self->_disableFallback;
  v100 = [v4 disableFallback];
  if (!myIsEqual(disableFallback, v100))
  {
    *(void *)v115 = 0;
    int v12 = 0;
    int v13 = 0;
    int v14 = 0;
    int v15 = 0;
    int v16 = 0;
    uint64_t v113 = 0;
    uint64_t v112 = 0;
    uint64_t v111 = 0;
    BOOL v116 = 0;
    memset(v109, 0, sizeof(v109));
    memset(v110, 0, sizeof(v110));
    int v114 = 0;
    int v17 = 0;
    int v18 = 0;
    int v19 = 0;
    int v20 = 0;
    int v21 = 0;
    int v22 = 0;
    uint64_t v120 = 1;
    *(_DWORD *)&v115[16] = 1;
    *(void *)&v115[8] = 0x100000001;
    goto LABEL_10;
  }
  divertDNSOnly = self->_divertDNSOnly;
  v99 = [v4 divertDNSOnly];
  if (!myIsEqual(divertDNSOnly, v99))
  {
    int v12 = 0;
    int v13 = 0;
    int v114 = 0;
    *(void *)v115 = 0x100000000;
    int v14 = 0;
    int v15 = 0;
    int v16 = 0;
    uint64_t v113 = 0;
    uint64_t v112 = 0;
    uint64_t v111 = 0;
    BOOL v116 = 0;
    memset(v109, 0, sizeof(v109));
    memset(v110, 0, sizeof(v110));
    int v17 = 0;
    int v18 = 0;
    int v19 = 0;
    int v20 = 0;
    int v21 = 0;
    int v22 = 0;
    uint64_t v120 = 1;
    *(_DWORD *)&v115[16] = 1;
    *(void *)&v115[8] = 0x100000001;
    goto LABEL_10;
  }
  noDNSDelegation = self->_noDNSDelegation;
  v98 = [v4 noDNSDelegation];
  if (!myIsEqual(noDNSDelegation, v98))
  {
    int v13 = 0;
    int v114 = 0;
    *(void *)v115 = 0x100000000;
    int v14 = 0;
    int v15 = 0;
    int v16 = 0;
    uint64_t v113 = 0;
    uint64_t v112 = 0;
    uint64_t v111 = 0;
    BOOL v116 = 0;
    memset(v109, 0, sizeof(v109));
    memset(v110, 0, sizeof(v110));
    int v17 = 0;
    int v18 = 0;
    int v19 = 0;
    int v20 = 0;
    int v21 = 0;
    int v22 = 0;
    uint64_t v120 = 1;
    *(_DWORD *)&v115[16] = 1;
    *(void *)&v115[8] = 0x100000001;
    int v12 = 1;
    goto LABEL_10;
  }
  directTLSPorts = self->_directTLSPorts;
  v97 = [v4 directTLSPorts];
  if (!myIsEqual(directTLSPorts, v97))
  {
    int v114 = 0;
    *(void *)v115 = 0x100000000;
    int v14 = 0;
    int v15 = 0;
    int v16 = 0;
    uint64_t v113 = 0;
    uint64_t v112 = 0;
    uint64_t v111 = 0;
    BOOL v116 = 0;
    memset(v109, 0, sizeof(v109));
    memset(v110, 0, sizeof(v110));
    int v17 = 0;
    int v18 = 0;
    int v19 = 0;
    int v20 = 0;
    int v21 = 0;
    int v22 = 0;
    uint64_t v120 = 1;
    *(_DWORD *)&v115[16] = 1;
    *(void *)&v115[8] = 0x100000001;
    int v12 = 1;
    int v13 = 1;
    goto LABEL_10;
  }
  enableDirectMultipath = self->_enableDirectMultipath;
  v96 = [v4 enableDirectMultipath];
  if (!myIsEqual(enableDirectMultipath, v96))
  {
    int v14 = 0;
    int v15 = 0;
    int v16 = 0;
    uint64_t v113 = 0;
    uint64_t v112 = 0;
    uint64_t v111 = 0;
    BOOL v116 = 0;
    memset(v109, 0, sizeof(v109));
    memset(v110, 0, sizeof(v110));
    int v17 = 0;
    int v18 = 0;
    int v19 = 0;
    int v20 = 0;
    int v21 = 0;
    int v22 = 0;
    uint64_t v120 = 1;
    *(_DWORD *)&v115[16] = 1;
    *(void *)&v115[8] = 0x100000001;
    int v12 = 1;
    int v13 = 1;
    int v114 = 0;
    *(void *)v115 = 0x100000001;
    goto LABEL_10;
  }
  enableDirectTFO = self->_enableDirectTFO;
  uint64_t v95 = [v4 enableDirectTFO];
  if (!myIsEqual(enableDirectTFO, v95))
  {
    int v15 = 0;
    int v16 = 0;
    uint64_t v113 = 0;
    uint64_t v112 = 0;
    uint64_t v111 = 0;
    BOOL v116 = 0;
    memset(v109, 0, sizeof(v109));
    memset(v110, 0, sizeof(v110));
    int v17 = 0;
    int v18 = 0;
    int v19 = 0;
    int v20 = 0;
    int v21 = 0;
    int v22 = 0;
    uint64_t v120 = 1;
    *(_DWORD *)&v115[16] = 1;
    *(void *)&v115[8] = 0x100000001;
    int v12 = 1;
    int v13 = 1;
    int v114 = 0;
    *(void *)v115 = 0x100000001;
    int v14 = 1;
    goto LABEL_10;
  }
  enableDirectExtendedValidation = self->_enableDirectExtendedValidation;
  v94 = [v4 enableDirectExtendedValidation];
  if (!myIsEqual(enableDirectExtendedValidation, v94))
  {
    int v16 = 0;
    uint64_t v113 = 0;
    uint64_t v112 = 0;
    uint64_t v111 = 0;
    BOOL v116 = 0;
    memset(v109, 0, sizeof(v109));
    memset(v110, 0, sizeof(v110));
    int v17 = 0;
    int v18 = 0;
    int v19 = 0;
    int v20 = 0;
    int v21 = 0;
    int v22 = 0;
    uint64_t v120 = 1;
    *(_DWORD *)&v115[16] = 1;
    *(void *)&v115[8] = 0x100000001;
    int v12 = 1;
    int v13 = 1;
    int v114 = 0;
    *(void *)v115 = 0x100000001;
    int v14 = 1;
    int v15 = 1;
    goto LABEL_10;
  }
  serviceID = self->_serviceID;
  v93 = [v4 serviceID];
  if (!myIsEqual(serviceID, v93))
  {
    uint64_t v113 = 0;
    uint64_t v112 = 0;
    uint64_t v111 = 0;
    BOOL v116 = 0;
    memset(v109, 0, sizeof(v109));
    memset(v110, 0, sizeof(v110));
    int v17 = 0;
    int v18 = 0;
    int v19 = 0;
    int v20 = 0;
    int v21 = 0;
    int v22 = 0;
    uint64_t v120 = 1;
    *(_DWORD *)&v115[16] = 1;
    *(void *)&v115[8] = 0x100000001;
    int v12 = 1;
    int v13 = 1;
    int v114 = 0;
    *(void *)v115 = 0x100000001;
    int v14 = 1;
    int v15 = 1;
    int v16 = 1;
    goto LABEL_10;
  }
  fallbackTimeout = self->_fallbackTimeout;
  double v92 = [v4 fallbackTimeout];
  if (!myIsEqual(fallbackTimeout, v92))
  {
    uint64_t v112 = 0;
    uint64_t v111 = 0;
    BOOL v116 = 0;
    memset(v109, 0, sizeof(v109));
    memset(v110, 0, sizeof(v110));
    int v17 = 0;
    int v18 = 0;
    int v19 = 0;
    int v20 = 0;
    int v21 = 0;
    int v22 = 0;
    uint64_t v120 = 1;
    *(_DWORD *)&v115[16] = 1;
    *(void *)&v115[8] = 0x100000001;
    int v12 = 1;
    int v13 = 1;
    int v114 = 0;
    *(void *)v115 = 0x100000001;
    int v14 = 1;
    int v15 = 1;
    int v16 = 1;
    uint64_t v113 = 0x100000000;
    goto LABEL_10;
  }
  fallbackBufferLimit = self->_fallbackBufferLimit;
  double v91 = [v4 fallbackBufferLimit];
  if (!myIsEqual(fallbackBufferLimit, v91))
  {
    uint64_t v111 = 0;
    BOOL v116 = 0;
    memset(v109, 0, sizeof(v109));
    memset(v110, 0, sizeof(v110));
    int v17 = 0;
    int v18 = 0;
    int v19 = 0;
    int v20 = 0;
    int v21 = 0;
    int v22 = 0;
    uint64_t v120 = 1;
    *(_DWORD *)&v115[16] = 1;
    *(void *)&v115[8] = 0x100000001;
    int v12 = 1;
    int v13 = 1;
    int v114 = 0;
    *(void *)v115 = 0x100000001;
    int v14 = 1;
    int v15 = 1;
    int v16 = 1;
    uint64_t v113 = 0x100000000;
    uint64_t v112 = 0x100000000;
    goto LABEL_10;
  }
  fallbackCountBeforeImmediateFallback = self->_fallbackCountBeforeImmediateFallback;
  v90 = [v4 fallbackCountBeforeImmediateFallback];
  if (!myIsEqual(fallbackCountBeforeImmediateFallback, v90))
  {
    BOOL v116 = 0;
    memset(v109, 0, sizeof(v109));
    memset(v110, 0, sizeof(v110));
    uint64_t v111 = 0x100000000;
    int v17 = 0;
    int v18 = 0;
    int v19 = 0;
    int v20 = 0;
    int v21 = 0;
    int v22 = 0;
    uint64_t v120 = 1;
    *(_DWORD *)&v115[16] = 1;
    *(void *)&v115[8] = 0x100000001;
    int v12 = 1;
    int v13 = 1;
    int v114 = 0;
    *(void *)v115 = 0x100000001;
    int v14 = 1;
    int v15 = 1;
    int v16 = 1;
    uint64_t v113 = 0x100000000;
    uint64_t v112 = 0x100000000;
    goto LABEL_10;
  }
  enabled = self->_enabled;
  v89 = [v4 enabled];
  if (!myIsEqual(enabled, v89))
  {
    *(void *)id v110 = 0;
    BOOL v116 = 0;
    memset(v109, 0, sizeof(v109));
    int v17 = 0;
    int v18 = 0;
    int v19 = 0;
    int v20 = 0;
    int v21 = 0;
    int v22 = 0;
    uint64_t v120 = 1;
    *(_DWORD *)&v115[16] = 1;
    *(void *)&v115[8] = 0x100000001;
    int v12 = 1;
    int v13 = 1;
    int v114 = 0;
    *(void *)v115 = 0x100000001;
    int v14 = 1;
    int v15 = 1;
    int v16 = 1;
    uint64_t v113 = 0x100000000;
    uint64_t v112 = 0x100000000;
    uint64_t v111 = 0x100000000;
    *(_DWORD *)&v110[8] = 1;
    goto LABEL_10;
  }
  useCustomProtocol = self->_useCustomProtocol;
  v88 = [v4 useCustomProtocol];
  if (!myIsEqual(useCustomProtocol, v88))
  {
    BOOL v116 = 0;
    memset(v109, 0, sizeof(v109));
    *(void *)id v110 = 0x100000000;
    int v17 = 0;
    int v18 = 0;
    int v19 = 0;
    int v20 = 0;
    int v21 = 0;
    int v22 = 0;
    uint64_t v120 = 1;
    *(_DWORD *)&v115[16] = 1;
    *(void *)&v115[8] = 0x100000001;
    int v12 = 1;
    int v13 = 1;
    int v114 = 0;
    *(void *)v115 = 0x100000001;
    int v14 = 1;
    int v15 = 1;
    int v16 = 1;
    uint64_t v113 = 0x100000000;
    uint64_t v112 = 0x100000000;
    uint64_t v111 = 0x100000000;
    *(_DWORD *)&v110[8] = 1;
    goto LABEL_10;
  }
  useLocalFlowDivert = self->_useLocalFlowDivert;
  double v87 = [v4 useLocalFlowDivert];
  if (!myIsEqual(useLocalFlowDivert, v87))
  {
    BOOL v116 = 0;
    memset(v109, 0, 24);
    *(void *)id v110 = 0x100000000;
    int v17 = 0;
    int v18 = 0;
    int v19 = 0;
    int v20 = 0;
    int v21 = 0;
    int v22 = 0;
    uint64_t v120 = 1;
    *(_DWORD *)&v115[16] = 1;
    *(void *)&v115[8] = 0x100000001;
    int v12 = 1;
    int v13 = 1;
    int v114 = 0;
    *(void *)v115 = 0x100000001;
    int v14 = 1;
    int v15 = 1;
    int v16 = 1;
    uint64_t v113 = 0x100000000;
    uint64_t v112 = 0x100000000;
    uint64_t v111 = 0x100000000;
    *(_DWORD *)&v110[8] = 1;
    *(_DWORD *)&v109[24] = 1;
    goto LABEL_10;
  }
  enableDirectRace = self->_enableDirectRace;
  v86 = [v4 enableDirectRace];
  if (!myIsEqual(enableDirectRace, v86))
  {
    BOOL v116 = 0;
    memset(v109, 0, 20);
    *(void *)id v110 = 0x100000000;
    int v17 = 0;
    int v18 = 0;
    int v19 = 0;
    int v20 = 0;
    int v21 = 0;
    int v22 = 0;
    uint64_t v120 = 1;
    *(_DWORD *)&v115[16] = 1;
    *(void *)&v115[8] = 0x100000001;
    int v12 = 1;
    int v13 = 1;
    int v114 = 0;
    *(void *)v115 = 0x100000001;
    int v14 = 1;
    int v15 = 1;
    int v16 = 1;
    uint64_t v113 = 0x100000000;
    uint64_t v112 = 0x100000000;
    uint64_t v111 = 0x100000000;
    *(_DWORD *)&v110[8] = 1;
    *(_DWORD *)&v109[24] = 1;
    *(_DWORD *)&v109[20] = 1;
    goto LABEL_10;
  }
  proxyEvaluationPath = self->_proxyEvaluationPath;
  HIDWORD(v116) = proxyEvaluationPath == 0;
  if (proxyEvaluationPath
    || ([v4 proxyEvaluationPath], (double v84 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    objc_super v85 = [v4 proxyEvaluationPath];
    if (!v85)
    {
      objc_super v85 = 0;
      memset(v109, 0, 20);
      *(void *)id v110 = 0x100000000;
      uint64_t v111 = 0x100000000;
      int v17 = 0;
      int v18 = 0;
      int v19 = 0;
      int v20 = 0;
      int v21 = 0;
      int v22 = 0;
      uint64_t v120 = 0x100000001;
      *(_DWORD *)&v115[16] = 1;
      LOBYTE(v116) = 0;
      *(void *)&v115[8] = 0x100000001;
      int v12 = 1;
      int v13 = 1;
      int v114 = 0;
      *(void *)v115 = 0x100000001;
      int v14 = 1;
      int v15 = 1;
      int v16 = 1;
      uint64_t v113 = 0x100000000;
      uint64_t v112 = 0x100000000;
      *(_DWORD *)&v110[8] = 1;
      *(_DWORD *)&v109[20] = 1;
      *(_DWORD *)&v109[24] = 1;
      goto LABEL_10;
    }
    uint64_t v51 = self->_proxyEvaluationPath;
    v83 = [v4 proxyEvaluationPath];
    LODWORD(v120) = 1;
    if (!-[NSString isEqualToString:](v51, "isEqualToString:"))
    {
      *(_OWORD *)&v109[4] = 0uLL;
      *(void *)id v110 = 0x100000000;
      int v17 = 0;
      int v18 = 0;
      int v19 = 0;
      int v20 = 0;
      int v21 = 0;
      int v22 = 0;
      *(_DWORD *)&v115[16] = 1;
      LOBYTE(v116) = 0;
      *(void *)&v115[8] = 0x100000001;
      int v12 = 1;
      int v13 = 1;
      int v114 = 0;
      *(void *)v115 = 0x100000001;
      int v14 = 1;
      int v15 = 1;
      int v16 = 1;
      uint64_t v113 = 0x100000000;
      uint64_t v112 = 0x100000000;
      uint64_t v111 = 0x100000000;
      *(_DWORD *)&v110[8] = 1;
      *(_DWORD *)&v109[20] = 1;
      *(_DWORD *)&v109[24] = 1;
      HIDWORD(v120) = 1;
      *(_DWORD *)v109 = 1;
      goto LABEL_10;
    }
    HIDWORD(v120) = 1;
  }
  else
  {
    double v84 = 0;
    HIDWORD(v120) = 0;
  }
  label = self->_label;
  uint64_t v82 = [v4 label];
  if (myIsEqual(label, v82))
  {
    edgeSetIdentifier = self->_edgeSetIdentifier;
    v81 = [v4 edgeSetIdentifier];
    if (myIsEqual(edgeSetIdentifier, v81))
    {
      connectionTimeout = self->_connectionTimeout;
      uint64_t v80 = [v4 connectionTimeout];
      if (myIsEqual(connectionTimeout, v80))
      {
        connectionIdleTimeout = self->_connectionIdleTimeout;
        v79 = [v4 connectionIdleTimeout];
        if (myIsEqual(connectionIdleTimeout, v79))
        {
          enableTFO = self->_enableTFO;
          uint64_t v78 = [v4 enableTFO];
          if (myIsEqual(enableTFO, v78))
          {
            requireTFO = self->_requireTFO;
            v77 = [v4 requireTFO];
            if (myIsEqual(requireTFO, v77))
            {
              enableNoTFOCookie = self->_enableNoTFOCookie;
              uint64_t v76 = [v4 enableNoTFOCookie];
              if (myIsEqual(enableNoTFOCookie, v76))
              {
                enableMultipath = self->_enableMultipath;
                v75 = [v4 enableMultipath];
                if (myIsEqual(enableMultipath, v75))
                {
                  enableUDPRace = self->_enableUDPRace;
                  uint64_t v74 = [v4 enableUDPRace];
                  if (myIsEqual(enableUDPRace, v74))
                  {
                    enableRatio = self->_enableRatio;
                    v73 = [v4 enableRatio];
                    if (myIsEqual(enableRatio, v73))
                    {
                      reenableInterval = self->_reenableInterval;
                      uint64_t v72 = [v4 reenableInterval];
                      if (myIsEqual(reenableInterval, v72))
                      {
                        telemetryRatio = self->_telemetryRatio;
                        double v71 = [v4 telemetryRatio];
                        if (myIsEqual(telemetryRatio, v71))
                        {
                          enableOptInPerTask = self->_enableOptInPerTask;
                          objc_super v70 = [v4 enableOptInPerTask];
                          if (myIsEqual(enableOptInPerTask, v70))
                          {
                            locationBundlePath = self->_locationBundlePath;
                            uint64_t v69 = [v4 locationBundlePath];
                            if (myIsEqual(locationBundlePath, v69))
                            {
                              initialWindowSize = self->_initialWindowSize;
                              uint64_t v67 = [v4 initialWindowSize];
                              char v68 = myIsEqual(initialWindowSize, v67);
                              uint64_t v6 = v67;
                              LODWORD(v120) = 1;
                              *(_DWORD *)&v115[16] = 1;
                              LOBYTE(v116) = v68;
                              *(_DWORD *)&v115[8] = 1;
                              *(_DWORD *)&v115[12] = 1;
                              *(_DWORD *)v115 = 1;
                              *(_DWORD *)&v115[4] = 1;
                              int v12 = 1;
                              int v13 = 1;
                              int v14 = 1;
                              int v15 = 1;
                              int v16 = 1;
                              HIDWORD(v113) = 1;
                              HIDWORD(v112) = 1;
                              HIDWORD(v111) = 1;
                              *(_DWORD *)&v110[4] = 1;
                              *(_DWORD *)&v110[8] = 1;
                              *(_DWORD *)&v109[20] = 1;
                              *(_DWORD *)&v109[24] = 1;
                              int v22 = 1;
                            }
                            else
                            {
                              int v22 = 0;
                              LODWORD(v120) = 1;
                              *(_DWORD *)&v115[16] = 1;
                              LOBYTE(v116) = 0;
                              *(_DWORD *)&v115[8] = 1;
                              *(_DWORD *)&v115[12] = 1;
                              *(_DWORD *)v115 = 1;
                              *(_DWORD *)&v115[4] = 1;
                              int v12 = 1;
                              int v13 = 1;
                              int v14 = 1;
                              int v15 = 1;
                              int v16 = 1;
                              HIDWORD(v113) = 1;
                              HIDWORD(v112) = 1;
                              HIDWORD(v111) = 1;
                              *(_DWORD *)&v110[4] = 1;
                              *(_DWORD *)&v110[8] = 1;
                              *(_DWORD *)&v109[20] = 1;
                              *(_DWORD *)&v109[24] = 1;
                            }
                            *(_DWORD *)v109 = HIDWORD(v120);
                            *(_DWORD *)&v109[4] = 1;
                            *(_DWORD *)&v109[8] = 1;
                            *(_DWORD *)&v109[12] = 1;
                            *(_DWORD *)&v109[16] = 1;
                            *(_DWORD *)id v110 = 1;
                            LODWORD(v111) = 1;
                            LODWORD(v112) = 1;
                            LODWORD(v113) = 1;
                            int v114 = 1;
                            int v17 = 1;
                            int v18 = 1;
                            int v19 = 1;
                            int v20 = 1;
                            int v21 = 1;
                          }
                          else
                          {
                            int v21 = 0;
                            int v22 = 0;
                            LODWORD(v120) = 1;
                            *(_DWORD *)&v115[16] = 1;
                            LOBYTE(v116) = 0;
                            *(void *)&v115[8] = 0x100000001;
                            *(void *)v115 = 0x100000001;
                            int v12 = 1;
                            int v13 = 1;
                            int v14 = 1;
                            int v15 = 1;
                            int v16 = 1;
                            *(_DWORD *)&v110[8] = 1;
                            *(_DWORD *)&v109[24] = 1;
                            uint64_t v6 = (void *)HIDWORD(v120);
                            *(_DWORD *)v109 = HIDWORD(v120);
                            *(_DWORD *)&v109[4] = 1;
                            *(_DWORD *)&v109[8] = 1;
                            *(_DWORD *)&v109[12] = 1;
                            *(void *)&v109[16] = 0x100000001;
                            *(void *)id v110 = 0x100000001;
                            uint64_t v111 = 0x100000001;
                            uint64_t v112 = 0x100000001;
                            uint64_t v113 = 0x100000001;
                            int v114 = 1;
                            int v17 = 1;
                            int v18 = 1;
                            int v19 = 1;
                            int v20 = 1;
                          }
                        }
                        else
                        {
                          int v20 = 0;
                          int v21 = 0;
                          int v22 = 0;
                          LODWORD(v120) = 1;
                          *(_DWORD *)&v115[16] = 1;
                          LOBYTE(v116) = 0;
                          *(void *)&v115[8] = 0x100000001;
                          *(void *)v115 = 0x100000001;
                          int v12 = 1;
                          int v13 = 1;
                          int v14 = 1;
                          int v15 = 1;
                          int v16 = 1;
                          *(_DWORD *)&v110[8] = 1;
                          *(_DWORD *)&v109[24] = 1;
                          uint64_t v6 = (void *)HIDWORD(v120);
                          *(_DWORD *)v109 = HIDWORD(v120);
                          *(_DWORD *)&v109[4] = 1;
                          *(_DWORD *)&v109[8] = 1;
                          *(_DWORD *)&v109[12] = 1;
                          *(void *)&v109[16] = 0x100000001;
                          *(void *)id v110 = 0x100000001;
                          uint64_t v111 = 0x100000001;
                          uint64_t v112 = 0x100000001;
                          uint64_t v113 = 0x100000001;
                          int v114 = 1;
                          int v17 = 1;
                          int v18 = 1;
                          int v19 = 1;
                        }
                      }
                      else
                      {
                        int v19 = 0;
                        int v20 = 0;
                        int v21 = 0;
                        int v22 = 0;
                        LODWORD(v120) = 1;
                        *(_DWORD *)&v115[16] = 1;
                        LOBYTE(v116) = 0;
                        *(void *)&v115[8] = 0x100000001;
                        *(void *)v115 = 0x100000001;
                        int v12 = 1;
                        int v13 = 1;
                        int v14 = 1;
                        int v15 = 1;
                        int v16 = 1;
                        *(_DWORD *)&v110[8] = 1;
                        *(_DWORD *)&v109[24] = 1;
                        uint64_t v6 = (void *)HIDWORD(v120);
                        *(_DWORD *)v109 = HIDWORD(v120);
                        *(_DWORD *)&v109[4] = 1;
                        *(_DWORD *)&v109[8] = 1;
                        *(_DWORD *)&v109[12] = 1;
                        *(void *)&v109[16] = 0x100000001;
                        *(void *)id v110 = 0x100000001;
                        uint64_t v111 = 0x100000001;
                        uint64_t v112 = 0x100000001;
                        uint64_t v113 = 0x100000001;
                        int v114 = 1;
                        int v17 = 1;
                        int v18 = 1;
                      }
                    }
                    else
                    {
                      int v18 = 0;
                      int v19 = 0;
                      int v20 = 0;
                      int v21 = 0;
                      int v22 = 0;
                      LODWORD(v120) = 1;
                      *(_DWORD *)&v115[16] = 1;
                      LOBYTE(v116) = 0;
                      *(void *)&v115[8] = 0x100000001;
                      *(void *)v115 = 0x100000001;
                      int v12 = 1;
                      int v13 = 1;
                      int v14 = 1;
                      int v15 = 1;
                      int v16 = 1;
                      *(_DWORD *)&v110[8] = 1;
                      *(_DWORD *)&v109[24] = 1;
                      uint64_t v6 = (void *)HIDWORD(v120);
                      *(_DWORD *)v109 = HIDWORD(v120);
                      *(_DWORD *)&v109[4] = 1;
                      *(_DWORD *)&v109[8] = 1;
                      *(_DWORD *)&v109[12] = 1;
                      *(void *)&v109[16] = 0x100000001;
                      *(void *)id v110 = 0x100000001;
                      uint64_t v111 = 0x100000001;
                      uint64_t v112 = 0x100000001;
                      uint64_t v113 = 0x100000001;
                      int v114 = 1;
                      int v17 = 1;
                    }
                  }
                  else
                  {
                    int v17 = 0;
                    int v18 = 0;
                    int v19 = 0;
                    int v20 = 0;
                    int v21 = 0;
                    int v22 = 0;
                    LODWORD(v120) = 1;
                    *(_DWORD *)&v115[16] = 1;
                    LOBYTE(v116) = 0;
                    *(void *)&v115[8] = 0x100000001;
                    *(void *)v115 = 0x100000001;
                    int v12 = 1;
                    int v13 = 1;
                    int v14 = 1;
                    int v15 = 1;
                    int v16 = 1;
                    *(_DWORD *)&v110[8] = 1;
                    *(_DWORD *)&v109[24] = 1;
                    uint64_t v6 = (void *)HIDWORD(v120);
                    *(_DWORD *)v109 = HIDWORD(v120);
                    *(_DWORD *)&v109[4] = 1;
                    *(_DWORD *)&v109[8] = 1;
                    *(_DWORD *)&v109[12] = 1;
                    *(void *)&v109[16] = 0x100000001;
                    *(void *)id v110 = 0x100000001;
                    uint64_t v111 = 0x100000001;
                    uint64_t v112 = 0x100000001;
                    uint64_t v113 = 0x100000001;
                    int v114 = 1;
                  }
                }
                else
                {
                  int v17 = 0;
                  int v18 = 0;
                  int v19 = 0;
                  int v20 = 0;
                  int v21 = 0;
                  int v22 = 0;
                  LODWORD(v120) = 1;
                  *(_DWORD *)&v115[16] = 1;
                  LOBYTE(v116) = 0;
                  *(void *)&v115[8] = 0x100000001;
                  int v12 = 1;
                  int v13 = 1;
                  int v114 = 0;
                  *(void *)v115 = 0x100000001;
                  int v14 = 1;
                  int v15 = 1;
                  int v16 = 1;
                  *(_DWORD *)&v110[8] = 1;
                  *(_DWORD *)&v109[24] = 1;
                  uint64_t v6 = (void *)HIDWORD(v120);
                  *(_DWORD *)v109 = HIDWORD(v120);
                  *(_DWORD *)&v109[4] = 1;
                  *(_DWORD *)&v109[8] = 1;
                  *(_DWORD *)&v109[12] = 1;
                  *(void *)&v109[16] = 0x100000001;
                  *(void *)id v110 = 0x100000001;
                  uint64_t v111 = 0x100000001;
                  uint64_t v112 = 0x100000001;
                  uint64_t v113 = 0x100000001;
                }
              }
              else
              {
                int v17 = 0;
                int v18 = 0;
                int v19 = 0;
                int v20 = 0;
                int v21 = 0;
                int v22 = 0;
                LODWORD(v120) = 1;
                *(_DWORD *)&v115[16] = 1;
                LOBYTE(v116) = 0;
                *(void *)&v115[8] = 0x100000001;
                int v12 = 1;
                int v13 = 1;
                int v114 = 0;
                *(void *)v115 = 0x100000001;
                int v14 = 1;
                int v15 = 1;
                int v16 = 1;
                uint64_t v113 = 0x100000000;
                *(_DWORD *)&v110[8] = 1;
                *(_DWORD *)&v109[24] = 1;
                uint64_t v6 = (void *)HIDWORD(v120);
                *(_DWORD *)v109 = HIDWORD(v120);
                *(_DWORD *)&v109[4] = 1;
                *(_DWORD *)&v109[8] = 1;
                *(_DWORD *)&v109[12] = 1;
                *(void *)&v109[16] = 0x100000001;
                *(void *)id v110 = 0x100000001;
                uint64_t v111 = 0x100000001;
                uint64_t v112 = 0x100000001;
              }
            }
            else
            {
              int v17 = 0;
              int v18 = 0;
              int v19 = 0;
              int v20 = 0;
              int v21 = 0;
              int v22 = 0;
              LODWORD(v120) = 1;
              *(_DWORD *)&v115[16] = 1;
              LOBYTE(v116) = 0;
              *(void *)&v115[8] = 0x100000001;
              int v12 = 1;
              int v13 = 1;
              int v114 = 0;
              *(void *)v115 = 0x100000001;
              int v14 = 1;
              int v15 = 1;
              int v16 = 1;
              uint64_t v113 = 0x100000000;
              uint64_t v112 = 0x100000000;
              *(_DWORD *)&v110[8] = 1;
              *(_DWORD *)&v109[24] = 1;
              uint64_t v6 = (void *)HIDWORD(v120);
              *(_DWORD *)v109 = HIDWORD(v120);
              *(_DWORD *)&v109[4] = 1;
              *(_DWORD *)&v109[8] = 1;
              *(_DWORD *)&v109[12] = 1;
              *(void *)&v109[16] = 0x100000001;
              *(void *)id v110 = 0x100000001;
              uint64_t v111 = 0x100000001;
            }
          }
          else
          {
            uint64_t v111 = 0x100000000;
            int v17 = 0;
            int v18 = 0;
            int v19 = 0;
            int v20 = 0;
            int v21 = 0;
            int v22 = 0;
            LODWORD(v120) = 1;
            *(_DWORD *)&v115[16] = 1;
            LOBYTE(v116) = 0;
            *(void *)&v115[8] = 0x100000001;
            int v12 = 1;
            int v13 = 1;
            int v114 = 0;
            *(void *)v115 = 0x100000001;
            int v14 = 1;
            int v15 = 1;
            int v16 = 1;
            uint64_t v113 = 0x100000000;
            uint64_t v112 = 0x100000000;
            *(_DWORD *)&v110[8] = 1;
            *(_DWORD *)&v109[24] = 1;
            uint64_t v6 = (void *)HIDWORD(v120);
            *(_DWORD *)v109 = HIDWORD(v120);
            *(_DWORD *)&v109[4] = 1;
            *(_DWORD *)&v109[8] = 1;
            *(_DWORD *)&v109[12] = 1;
            *(void *)&v109[16] = 0x100000001;
            *(void *)id v110 = 0x100000001;
          }
        }
        else
        {
          *(void *)id v110 = 0x100000000;
          uint64_t v111 = 0x100000000;
          int v17 = 0;
          int v18 = 0;
          int v19 = 0;
          int v20 = 0;
          int v21 = 0;
          int v22 = 0;
          LODWORD(v120) = 1;
          *(_DWORD *)&v115[16] = 1;
          LOBYTE(v116) = 0;
          *(void *)&v115[8] = 0x100000001;
          int v12 = 1;
          int v13 = 1;
          int v114 = 0;
          *(void *)v115 = 0x100000001;
          int v14 = 1;
          int v15 = 1;
          int v16 = 1;
          uint64_t v113 = 0x100000000;
          uint64_t v112 = 0x100000000;
          *(_DWORD *)&v110[8] = 1;
          *(_DWORD *)&v109[24] = 1;
          uint64_t v6 = (void *)HIDWORD(v120);
          *(_DWORD *)v109 = HIDWORD(v120);
          *(_DWORD *)&v109[4] = 1;
          *(_DWORD *)&v109[8] = 1;
          *(_DWORD *)&v109[12] = 1;
          *(void *)&v109[16] = 0x100000001;
        }
      }
      else
      {
        *(void *)&v109[16] = 0x100000000;
        *(void *)id v110 = 0x100000000;
        uint64_t v111 = 0x100000000;
        int v17 = 0;
        int v18 = 0;
        int v19 = 0;
        int v20 = 0;
        int v21 = 0;
        int v22 = 0;
        LODWORD(v120) = 1;
        *(_DWORD *)&v115[16] = 1;
        LOBYTE(v116) = 0;
        *(void *)&v115[8] = 0x100000001;
        int v12 = 1;
        int v13 = 1;
        int v114 = 0;
        *(void *)v115 = 0x100000001;
        int v14 = 1;
        int v15 = 1;
        int v16 = 1;
        uint64_t v113 = 0x100000000;
        uint64_t v112 = 0x100000000;
        *(_DWORD *)&v110[8] = 1;
        *(_DWORD *)&v109[24] = 1;
        uint64_t v6 = (void *)HIDWORD(v120);
        *(_DWORD *)v109 = HIDWORD(v120);
        *(_DWORD *)&v109[4] = 1;
        *(_DWORD *)&v109[8] = 1;
        *(_DWORD *)&v109[12] = 1;
      }
    }
    else
    {
      *(void *)&v109[12] = 0;
      *(void *)id v110 = 0x100000000;
      uint64_t v111 = 0x100000000;
      int v17 = 0;
      int v18 = 0;
      int v19 = 0;
      int v20 = 0;
      int v21 = 0;
      int v22 = 0;
      LODWORD(v120) = 1;
      *(_DWORD *)&v115[16] = 1;
      LOBYTE(v116) = 0;
      *(void *)&v115[8] = 0x100000001;
      int v12 = 1;
      int v13 = 1;
      int v114 = 0;
      *(void *)v115 = 0x100000001;
      int v14 = 1;
      int v15 = 1;
      int v16 = 1;
      uint64_t v113 = 0x100000000;
      uint64_t v112 = 0x100000000;
      *(_DWORD *)&v110[8] = 1;
      *(_DWORD *)&v109[20] = 1;
      *(_DWORD *)&v109[24] = 1;
      uint64_t v6 = (void *)HIDWORD(v120);
      *(_DWORD *)v109 = HIDWORD(v120);
      *(_DWORD *)&v109[4] = 1;
      *(_DWORD *)&v109[8] = 1;
    }
  }
  else
  {
    *(void *)&v109[8] = 0;
    *(void *)&v109[16] = 0x100000000;
    *(void *)id v110 = 0x100000000;
    uint64_t v111 = 0x100000000;
    int v17 = 0;
    int v18 = 0;
    int v19 = 0;
    int v20 = 0;
    int v21 = 0;
    int v22 = 0;
    LODWORD(v120) = 1;
    *(_DWORD *)&v115[16] = 1;
    LOBYTE(v116) = 0;
    *(void *)&v115[8] = 0x100000001;
    int v12 = 1;
    int v13 = 1;
    int v114 = 0;
    *(void *)v115 = 0x100000001;
    int v14 = 1;
    int v15 = 1;
    int v16 = 1;
    uint64_t v113 = 0x100000000;
    uint64_t v112 = 0x100000000;
    *(_DWORD *)&v110[8] = 1;
    *(_DWORD *)&v109[24] = 1;
    *(_DWORD *)v109 = HIDWORD(v120);
    *(_DWORD *)&v109[4] = 1;
  }
LABEL_10:
  if (v22)
  {
    int v106 = v16;
    id v23 = v4;
    int v24 = v15;
    int v25 = v17;
    int v26 = v14;
    int v27 = v18;
    int v28 = v19;
    int v29 = v13;
    int v30 = v20;
    int v31 = v12;
    int v32 = v21;

    int v33 = v32;
    int v12 = v31;
    int v20 = v30;
    int v13 = v29;
    int v19 = v28;
    int v18 = v27;
    int v14 = v26;
    int v17 = v25;
    int v15 = v24;
    id v4 = v23;
    int v16 = v106;
    if (!v33) {
      goto LABEL_12;
    }
  }
  else if (!v21)
  {
LABEL_12:
    if (v20) {
      goto LABEL_13;
    }
    goto LABEL_19;
  }

  if (v20)
  {
LABEL_13:

    if (!v19) {
      goto LABEL_14;
    }
    goto LABEL_20;
  }
LABEL_19:
  if (!v19)
  {
LABEL_14:
    if (v18) {
      goto LABEL_15;
    }
LABEL_21:
    if (!v17) {
      goto LABEL_23;
    }
    goto LABEL_22;
  }
LABEL_20:

  if (!v18) {
    goto LABEL_21;
  }
LABEL_15:

  if (v17) {
LABEL_22:
  }

LABEL_23:
  if (v114) {

  }
  if (v113) {
  if (v112)
  }

  if (v111) {
  if (*(_DWORD *)v110)
  }

  if (*(_DWORD *)&v109[16]) {
  if (*(_DWORD *)&v109[12])
  }

  if (*(_DWORD *)&v109[8]) {
  if (*(_DWORD *)&v109[4])
  }

  if (*(_DWORD *)v109) {
  if (HIDWORD(v120))
  }

  if (HIDWORD(v116)) {
  if (*(_DWORD *)&v109[20])
  }

  if (*(_DWORD *)&v109[24]) {
  if (*(_DWORD *)&v110[4])
  }

  if (*(_DWORD *)&v110[8]) {
  if (HIDWORD(v111))
  }

  if (HIDWORD(v112)) {
  if (HIDWORD(v113))
  }
  {

    if (!v16) {
      goto LABEL_61;
    }
  }
  else if (!v16)
  {
LABEL_61:
    if (v15) {
      goto LABEL_62;
    }
LABEL_66:
    if (!v14) {
      goto LABEL_68;
    }
    goto LABEL_67;
  }

  if (!v15) {
    goto LABEL_66;
  }
LABEL_62:

  if (v14) {
LABEL_67:
  }

LABEL_68:
  if (*(_DWORD *)v115)
  {

    if (!v13) {
      goto LABEL_70;
    }
  }
  else if (!v13)
  {
LABEL_70:
    if (!v12) {
      goto LABEL_72;
    }
    goto LABEL_71;
  }

  if (v12) {
LABEL_71:
  }

LABEL_72:
  if (*(_DWORD *)&v115[4]) {

  }
  if (*(_DWORD *)&v115[12]) {
  if (*(_DWORD *)&v115[8])
  }

  if (*(_DWORD *)&v115[16])
  {
  }
  if (v120)
  {
  }
  if (IsEqual)
  {
  }
  return v116;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)NSPAppRule;
  id v4 = [(NEAppRule *)&v6 copyWithZone:a3];
  [v4 setDisableFallback:self->_disableFallback];
  [v4 setEnableDirectMultipath:self->_enableDirectMultipath];
  [v4 setEnableDirectTFO:self->_enableDirectTFO];
  [v4 setEnableDirectExtendedValidation:self->_enableDirectExtendedValidation];
  [v4 setDirectTLSPorts:self->_directTLSPorts];
  [v4 setDivertDNSOnly:self->_divertDNSOnly];
  [v4 setNoDNSDelegation:self->_noDNSDelegation];
  [v4 setServiceID:self->_serviceID];
  [v4 setEnabled:self->_enabled];
  [v4 setFallbackTimeout:self->_fallbackTimeout];
  [v4 setFallbackBufferLimit:self->_fallbackBufferLimit];
  [v4 setFallbackCountBeforeImmediateFallback:self->_fallbackCountBeforeImmediateFallback];
  [v4 setProxyEvaluationPath:self->_proxyEvaluationPath];
  [v4 setUseCustomProtocol:self->_useCustomProtocol];
  [v4 setUseLocalFlowDivert:self->_useLocalFlowDivert];
  [v4 setEnableDirectRace:self->_enableDirectRace];
  [v4 setShouldComposeInitialData:self->_shouldComposeInitialData];
  [v4 setLabel:self->_label];
  [v4 setEdgeSetIdentifier:self->_edgeSetIdentifier];
  [v4 setConnectionTimeout:self->_connectionTimeout];
  [v4 setConnectionIdleTimeout:self->_connectionIdleTimeout];
  [v4 setEnableTFO:self->_enableTFO];
  [v4 setRequireTFO:self->_requireTFO];
  [v4 setEnableNoTFOCookie:self->_enableNoTFOCookie];
  [v4 setEnableMultipath:self->_enableMultipath];
  [v4 setEnableUDPRace:self->_enableUDPRace];
  [v4 setEnableRatio:self->_enableRatio];
  [v4 setReenableInterval:self->_reenableInterval];
  [v4 setTelemetryRatio:self->_telemetryRatio];
  [v4 setConfigurationIdentifier:self->_configurationIdentifier];
  [v4 setEnableOptInPerTask:self->_enableOptInPerTask];
  [v4 setMatchEffectiveApplications:self->_matchEffectiveApplications];
  [v4 setEnableCheckDate:self->_enableCheckDate];
  [v4 setDisabledByRatio:self->_disabledByRatio];
  [v4 setLocationBundlePath:self->_locationBundlePath];
  [v4 setInitialWindowSize:self->_initialWindowSize];
  [v4 setUpdateHash:self->_updateHash];
  return v4;
}

- (id)copyExecutableConditions
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = [(NEAppRule *)self matchSigningIdentifier];
  id v4 = [(NEAppRule *)self matchPath];
  id v5 = +[NSPAppRule copyUUIDsForSigningIdentifier:v3 executablePath:v4];

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    id v9 = 0;
    uint64_t v10 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v6);
        }
        uint64_t v12 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        if (!v9) {
          id v9 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        }
        int v13 = objc_msgSend(MEMORY[0x1E4F38D28], "effectiveApplication:", v12, (void)v15);
        [v9 addObject:v13];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (id)copyAccountIdentifierConditions
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v3 = [(NEAppRule *)self matchAccountIdentifiers];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    id v6 = 0;
    uint64_t v7 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v3);
        }
        uint64_t v9 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        if (!v6) {
          id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        }
        uint64_t v10 = [MEMORY[0x1E4F38D28] accountIdentifier:v9];
        [v6 addObject:v10];
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v5);
  }
  else
  {
    id v6 = 0;
  }

  int v11 = [(NEAppRule *)self matchSigningIdentifier];
  int v12 = [v11 isEqualToString:@"com.apple.assistantd"];

  if (v12)
  {
    int v13 = [MEMORY[0x1E4F38D28] accountIdentifier:@"ace.siri.apple.com"];
    [v6 addObject:v13];
  }
  return v6;
}

- (id)copyMatchDomainConditions
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v2 = [(NEAppRule *)self matchDomains];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    id v5 = 0;
    uint64_t v6 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v2);
        }
        uint64_t v8 = *(void *)(*((void *)&v11 + 1) + 8 * i);
        if (!v5) {
          id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        }
        uint64_t v9 = [MEMORY[0x1E4F38D28] domain:v8];
        [v5 addObject:v9];
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v4);
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (id)copyMatchEffectiveApplicationConditions
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v2 = [(NSPAppRule *)self matchEffectiveApplications];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    id v5 = 0;
    uint64_t v6 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v2);
        }
        uint64_t v8 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if (!v5) {
          id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        }
        uint64_t v9 = (void *)[v8 copyExecutableConditions];
        [v5 addObjectsFromArray:v9];
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v4);
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

+ (id)copyUUIDsForSigningIdentifier:(id)a3 executablePath:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v14 = 0;
  long long v15 = &v14;
  uint64_t v16 = 0x3032000000;
  long long v17 = __Block_byref_object_copy__1;
  long long v18 = __Block_byref_object_dispose__1;
  id v19 = 0;
  id v7 = v5;
  [v7 UTF8String];
  id v8 = v6;
  [v8 UTF8String];
  uint64_t v9 = NEHelperCacheCopyAppUUIDMapping();
  uint64_t v10 = (void *)v9;
  if (v9 && MEMORY[0x1A622BC50](v9) == MEMORY[0x1E4F14568])
  {
    applier[0] = MEMORY[0x1E4F143A8];
    applier[1] = 3221225472;
    applier[2] = __59__NSPAppRule_copyUUIDsForSigningIdentifier_executablePath___block_invoke;
    applier[3] = &unk_1E5A3BBE0;
    applier[4] = &v14;
    xpc_array_apply(v10, applier);
  }
  id v11 = (id)v15[5];

  _Block_object_dispose(&v14, 8);
  return v11;
}

uint64_t __59__NSPAppRule_copyUUIDsForSigningIdentifier_executablePath___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if (MEMORY[0x1A622BC50]() == MEMORY[0x1E4F14600])
  {
    bytes = xpc_uuid_get_bytes(v4);
    if (bytes)
    {
      id v6 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDBytes:bytes];
      id v7 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
      if (!v7)
      {
        id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 8);
        uint64_t v10 = *(void **)(v9 + 40);
        *(void *)(v9 + 40) = v8;

        id v7 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
      }
      [v7 addObject:v6];
    }
  }

  return 1;
}

- (id)initFromTLVs:(id)a3
{
  id v4 = a3;
  uint64_t v46 = 0;
  uint64_t v47 = &v46;
  uint64_t v48 = 0x3032000000;
  uint64_t v49 = __Block_byref_object_copy__1;
  uint64_t v50 = __Block_byref_object_dispose__1;
  id v51 = 0;
  id v5 = (void *)[v4 mutableCopy];
  v45[0] = MEMORY[0x1E4F143A8];
  v45[1] = 3221225472;
  v45[2] = __27__NSPAppRule_initFromTLVs___block_invoke;
  v45[3] = &unk_1E5A3BC08;
  v45[4] = &v46;
  -[NSMutableData enumerateTLVsUsingBlock:](v5, v45);
  if (v47[5])
  {
    v44.receiver = self;
    v44.super_class = (Class)NSPAppRule;
    id v6 = -[NEAppRule initWithSigningIdentifier:](&v44, sel_initWithSigningIdentifier_);
    id v7 = v6;
    if (v6)
    {
      uint64_t v38 = 0;
      uint64_t v39 = &v38;
      uint64_t v40 = 0x3032000000;
      uint64_t v41 = __Block_byref_object_copy__1;
      v42 = __Block_byref_object_dispose__1;
      id v43 = 0;
      v36[0] = 0;
      v36[1] = v36;
      v36[2] = 0x3032000000;
      v36[3] = __Block_byref_object_copy__1;
      v36[4] = __Block_byref_object_dispose__1;
      id v37 = 0;
      uint64_t v30 = 0;
      int v31 = &v30;
      uint64_t v32 = 0x3032000000;
      int v33 = __Block_byref_object_copy__1;
      v34 = __Block_byref_object_dispose__1;
      id v35 = 0;
      uint64_t v24 = 0;
      int v25 = &v24;
      uint64_t v26 = 0x3032000000;
      int v27 = __Block_byref_object_copy__1;
      int v28 = __Block_byref_object_dispose__1;
      id v29 = 0;
      uint64_t v18 = 0;
      id v19 = &v18;
      uint64_t v20 = 0x3032000000;
      int v21 = __Block_byref_object_copy__1;
      int v22 = __Block_byref_object_dispose__1;
      id v23 = 0;
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __27__NSPAppRule_initFromTLVs___block_invoke_2;
      v11[3] = &unk_1E5A3BC30;
      id v8 = v6;
      long long v12 = v8;
      long long v13 = &v24;
      uint64_t v14 = &v18;
      long long v15 = &v38;
      uint64_t v16 = v36;
      long long v17 = &v30;
      -[NSMutableData enumerateTLVsUsingBlock:](v5, v11);
      objc_storeStrong(v8 + 14, (id)v39[5]);
      [v8 setMatchAccountIdentifiers:v31[5]];
      [v8 setMatchDomains:v25[5]];
      [v8 setMatchEffectiveApplications:v19[5]];

      _Block_object_dispose(&v18, 8);
      _Block_object_dispose(&v24, 8);

      _Block_object_dispose(&v30, 8);
      _Block_object_dispose(v36, 8);

      _Block_object_dispose(&v38, 8);
    }
    self = v7;
    uint64_t v9 = self;
  }
  else
  {
    uint64_t v9 = 0;
  }

  _Block_object_dispose(&v46, 8);
  return v9;
}

BOOL __27__NSPAppRule_initFromTLVs___block_invoke(uint64_t a1, int a2, unsigned int a3, uint64_t a4)
{
  if (a2 == 1)
  {
    uint64_t v6 = [[NSString alloc] initWithBytes:a4 length:a3 encoding:4];
    uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
    id v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;
  }
  return a2 != 1;
}

uint64_t __27__NSPAppRule_initFromTLVs___block_invoke_2(uint64_t a1, int a2, unsigned int a3, double *a4)
{
  switch(a2)
  {
    case 2:
      int v7 = *(_DWORD *)a4;
      id v8 = (void *)MEMORY[0x1E4F1CC38];
      uint64_t v9 = (void *)MEMORY[0x1E4F1CC28];
      if ((*(_DWORD *)a4 & 0x800) != 0) {
        uint64_t v10 = (void *)MEMORY[0x1E4F1CC38];
      }
      else {
        uint64_t v10 = (void *)MEMORY[0x1E4F1CC28];
      }
      objc_storeStrong((id *)(*(void *)(a1 + 32) + 144), v10);
      if (v7) {
        id v11 = v8;
      }
      else {
        id v11 = v9;
      }
      objc_storeStrong((id *)(*(void *)(a1 + 32) + 80), v11);
      if ((v7 & 2) != 0) {
        long long v12 = v8;
      }
      else {
        long long v12 = v9;
      }
      objc_storeStrong((id *)(*(void *)(a1 + 32) + 88), v12);
      if ((v7 & 8) != 0) {
        long long v13 = v8;
      }
      else {
        long long v13 = v9;
      }
      objc_storeStrong((id *)(*(void *)(a1 + 32) + 96), v13);
      if ((v7 & 4) != 0) {
        uint64_t v14 = v8;
      }
      else {
        uint64_t v14 = v9;
      }
      objc_storeStrong((id *)(*(void *)(a1 + 32) + 104), v14);
      if ((v7 & 0x10) != 0) {
        long long v15 = v8;
      }
      else {
        long long v15 = v9;
      }
      objc_storeStrong((id *)(*(void *)(a1 + 32) + 184), v15);
      if ((v7 & 0x100) != 0) {
        uint64_t v16 = v8;
      }
      else {
        uint64_t v16 = v9;
      }
      objc_storeStrong((id *)(*(void *)(a1 + 32) + 304), v16);
      if ((v7 & 0x40) != 0) {
        long long v17 = v8;
      }
      else {
        long long v17 = v9;
      }
      objc_storeStrong((id *)(*(void *)(a1 + 32) + 248), v17);
      if ((v7 & 0x10000) != 0) {
        uint64_t v18 = v8;
      }
      else {
        uint64_t v18 = v9;
      }
      objc_storeStrong((id *)(*(void *)(a1 + 32) + 256), v18);
      if ((v7 & 0x8000) != 0) {
        id v19 = v8;
      }
      else {
        id v19 = v9;
      }
      objc_storeStrong((id *)(*(void *)(a1 + 32) + 264), v19);
      if ((v7 & 0x20) != 0) {
        uint64_t v20 = v8;
      }
      else {
        uint64_t v20 = v9;
      }
      objc_storeStrong((id *)(*(void *)(a1 + 32) + 240), v20);
      if ((v7 & 0x80) != 0) {
        int v21 = v8;
      }
      else {
        int v21 = v9;
      }
      objc_storeStrong((id *)(*(void *)(a1 + 32) + 272), v21);
      if ((v7 & 0x200) != 0) {
        int v22 = v8;
      }
      else {
        int v22 = v9;
      }
      objc_storeStrong((id *)(*(void *)(a1 + 32) + 312), v22);
      if ((v7 & 0x400) != 0) {
        id v23 = v8;
      }
      else {
        id v23 = v9;
      }
      objc_storeStrong((id *)(*(void *)(a1 + 32) + 192), v23);
      if ((v7 & 0x1000) != 0) {
        uint64_t v24 = v8;
      }
      else {
        uint64_t v24 = v9;
      }
      objc_storeStrong((id *)(*(void *)(a1 + 32) + 120), v24);
      if ((v7 & 0x2000) != 0) {
        int v25 = v8;
      }
      else {
        int v25 = v9;
      }
      objc_storeStrong((id *)(*(void *)(a1 + 32) + 128), v25);
      if ((v7 & 0x4000) != 0) {
        uint64_t v26 = v8;
      }
      else {
        uint64_t v26 = v9;
      }
      uint64_t v27 = *(void *)(a1 + 32);
      id v28 = v26;
      id v29 = *(void **)(v27 + 200);
      *(void *)(v27 + 200) = v28;
      goto LABEL_90;
    case 3:
      uint64_t v30 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
      if (!v30)
      {
        id v31 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        uint64_t v32 = *(void *)(*(void *)(a1 + 56) + 8);
        int v33 = *(void **)(v32 + 40);
        *(void *)(v32 + 40) = v31;

        uint64_t v30 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
      }
      uint64_t v34 = [NSNumber numberWithInt:*(unsigned int *)a4];
      goto LABEL_65;
    case 4:
      uint64_t v35 = [objc_alloc(NSNumber) initWithUnsignedLongLong:*(void *)a4];
      uint64_t v36 = *(void *)(a1 + 32);
      uint64_t v37 = 136;
      goto LABEL_89;
    case 5:
      uint64_t v35 = [objc_alloc(NSNumber) initWithDouble:*a4];
      uint64_t v36 = *(void *)(a1 + 32);
      uint64_t v37 = 152;
      goto LABEL_89;
    case 6:
      uint64_t v35 = [objc_alloc(NSNumber) initWithUnsignedInt:*(unsigned int *)a4];
      uint64_t v36 = *(void *)(a1 + 32);
      uint64_t v37 = 160;
      goto LABEL_89;
    case 7:
      uint64_t v35 = [objc_alloc(NSNumber) initWithUnsignedInt:*(unsigned int *)a4];
      uint64_t v36 = *(void *)(a1 + 32);
      uint64_t v37 = 168;
      goto LABEL_89;
    case 8:
      uint64_t v35 = [[NSString alloc] initWithBytes:a4 length:a3 encoding:4];
      uint64_t v36 = *(void *)(a1 + 32);
      uint64_t v37 = 176;
      goto LABEL_89;
    case 9:
      uint64_t v30 = *(void **)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
      if (!v30)
      {
        id v38 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        uint64_t v39 = *(void *)(*(void *)(a1 + 64) + 8);
        uint64_t v40 = *(void **)(v39 + 40);
        *(void *)(v39 + 40) = v38;

        uint64_t v30 = *(void **)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
      }
      uint64_t v34 = [objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDBytes:a4];
LABEL_65:
      id v29 = (void *)v34;
      uint64_t v41 = v30;
      goto LABEL_79;
    case 10:
      if (!*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40))
      {
        id v42 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        uint64_t v43 = *(void *)(*(void *)(a1 + 72) + 8);
        objc_super v44 = *(void **)(v43 + 40);
        *(void *)(v43 + 40) = v42;
      }
      id v29 = (void *)[[NSString alloc] initWithBytes:a4 length:a3 encoding:4];
      if (!v29) {
        goto LABEL_90;
      }
      uint64_t v45 = *(void *)(a1 + 72);
      goto LABEL_78;
    case 12:
      uint64_t v35 = [objc_alloc(NSNumber) initWithDouble:*a4];
      uint64_t v36 = *(void *)(a1 + 32);
      uint64_t v37 = 224;
      goto LABEL_89;
    case 13:
      uint64_t v35 = [objc_alloc(NSNumber) initWithDouble:*a4];
      uint64_t v36 = *(void *)(a1 + 32);
      uint64_t v37 = 232;
      goto LABEL_89;
    case 16:
      uint64_t v35 = [objc_alloc(NSNumber) initWithDouble:*a4];
      uint64_t v36 = *(void *)(a1 + 32);
      uint64_t v37 = 296;
      goto LABEL_89;
    case 17:
      uint64_t v35 = [[NSString alloc] initWithBytes:a4 length:a3 encoding:4];
      uint64_t v36 = *(void *)(a1 + 32);
      uint64_t v37 = 208;
      goto LABEL_89;
    case 18:
      if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
      {
        id v46 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        uint64_t v47 = *(void *)(*(void *)(a1 + 40) + 8);
        uint64_t v48 = *(void **)(v47 + 40);
        *(void *)(v47 + 40) = v46;
      }
      id v29 = (void *)[[NSString alloc] initWithBytes:a4 length:a3 encoding:4];
      if (!v29) {
        goto LABEL_90;
      }
      uint64_t v45 = *(void *)(a1 + 40);
LABEL_78:
      uint64_t v41 = *(void **)(*(void *)(v45 + 8) + 40);
LABEL_79:
      [v41 addObject:v29];
      goto LABEL_90;
    case 19:
      if (!*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
      {
        id v49 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        uint64_t v50 = *(void *)(*(void *)(a1 + 48) + 8);
        id v51 = *(void **)(v50 + 40);
        *(void *)(v50 + 40) = v49;
      }
      id v29 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytesNoCopy:a4 length:a3 freeWhenDone:0];
      id v52 = [[NSPAppRule alloc] initFromTLVs:v29];
      if (v52) {
        [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) addObject:v52];
      }

      goto LABEL_90;
    case 20:
      uint64_t v35 = [[NSString alloc] initWithBytes:a4 length:a3 encoding:4];
      uint64_t v36 = *(void *)(a1 + 32);
      uint64_t v37 = 216;
      goto LABEL_89;
    case 21:
      id v29 = (void *)[[NSString alloc] initWithBytes:a4 length:a3 encoding:4];
      [*(id *)(a1 + 32) setMatchPath:v29];
      goto LABEL_90;
    case 22:
      uint64_t v35 = [objc_alloc(NSNumber) initWithUnsignedInteger:*(void *)a4];
      uint64_t v36 = *(void *)(a1 + 32);
      uint64_t v37 = 336;
      goto LABEL_89;
    case 23:
      uint64_t v35 = [objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:a4 length:a3];
      uint64_t v36 = *(void *)(a1 + 32);
      uint64_t v37 = 384;
LABEL_89:
      id v29 = *(void **)(v36 + v37);
      *(void *)(v36 + v37) = v35;
LABEL_90:

      break;
    default:
      return 1;
  }
  return 1;
}

- (id)copyTLVData
{
  uint64_t v87 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA58]);
  id v4 = [(NEAppRule *)self matchSigningIdentifier];
  id v5 = (const char *)[v4 UTF8String];

  id v6 = [(NEAppRule *)self matchPath];
  int v7 = (const char *)[v6 UTF8String];

  int v82 = 0;
  if (v5)
  {
    unsigned __int16 v8 = strlen(v5);
    -[NSMutableData appendType:length:value:](v3, 1, v8, (uint64_t)v5);
  }
  if (v7)
  {
    unsigned __int16 v9 = strlen(v7);
    -[NSMutableData appendType:length:value:](v3, 21, v9, (uint64_t)v7);
  }
  if ([(NSNumber *)self->_enabled BOOLValue])
  {
    int v10 = 2048;
    int v82 = 2048;
  }
  else
  {
    int v10 = 0;
  }
  if ([(NSNumber *)self->_disableFallback BOOLValue])
  {
    v10 |= 1u;
    int v82 = v10;
  }
  if ([(NSNumber *)self->_enableDirectMultipath BOOLValue])
  {
    v10 |= 2u;
    int v82 = v10;
  }
  if ([(NSNumber *)self->_enableDirectTFO BOOLValue])
  {
    v10 |= 8u;
    int v82 = v10;
  }
  if ([(NSNumber *)self->_enableDirectExtendedValidation BOOLValue])
  {
    v10 |= 4u;
    int v82 = v10;
  }
  if ([(NSNumber *)self->_useCustomProtocol BOOLValue])
  {
    v10 |= 0x10u;
    int v82 = v10;
  }
  if ([(NSNumber *)self->_useLocalFlowDivert BOOLValue])
  {
    v10 |= 0x400u;
    int v82 = v10;
  }
  if ([(NSNumber *)self->_enableDirectRace BOOLValue])
  {
    v10 |= 0x4000u;
    int v82 = v10;
  }
  if ([(NSNumber *)self->_divertDNSOnly BOOLValue])
  {
    v10 |= 0x1000u;
    int v82 = v10;
  }
  if ([(NSNumber *)self->_noDNSDelegation BOOLValue])
  {
    v10 |= 0x2000u;
    int v82 = v10;
  }
  if ([(NSNumber *)self->_shouldComposeInitialData BOOLValue])
  {
    v10 |= 0x100u;
    int v82 = v10;
  }
  if ([(NSNumber *)self->_enableTFO BOOLValue])
  {
    v10 |= 0x40u;
    int v82 = v10;
  }
  if ([(NSNumber *)self->_requireTFO BOOLValue])
  {
    v10 |= 0x10000u;
    int v82 = v10;
  }
  if ([(NSNumber *)self->_enableNoTFOCookie BOOLValue])
  {
    v10 |= 0x8000u;
    int v82 = v10;
  }
  if ([(NSNumber *)self->_enableMultipath BOOLValue])
  {
    v10 |= 0x20u;
    int v82 = v10;
  }
  if ([(NSNumber *)self->_enableUDPRace BOOLValue])
  {
    v10 |= 0x80u;
    int v82 = v10;
  }
  if ([(NSNumber *)self->_enableOptInPerTask BOOLValue]) {
    int v82 = v10 | 0x200;
  }
  -[NSMutableData appendType:length:value:](v3, 2, 4u, (uint64_t)&v82);
  long long v80 = 0u;
  long long v81 = 0u;
  long long v78 = 0u;
  long long v79 = 0u;
  id v11 = self->_directTLSPorts;
  uint64_t v12 = [(NSArray *)v11 countByEnumeratingWithState:&v78 objects:v86 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v79;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v79 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = *(void **)(*((void *)&v78 + 1) + 8 * i);
        LODWORD(v77) = 0;
        LODWORD(v77) = [v16 intValue];
        -[NSMutableData appendType:length:value:](v3, 3, 4u, (uint64_t)&v77);
      }
      uint64_t v13 = [(NSArray *)v11 countByEnumeratingWithState:&v78 objects:v86 count:16];
    }
    while (v13);
  }

  unint64_t v77 = [(NSNumber *)self->_serviceID unsignedLongLongValue];
  -[NSMutableData appendType:length:value:](v3, 4, 8u, (uint64_t)&v77);
  [(NSNumber *)self->_fallbackTimeout doubleValue];
  uint64_t v76 = v17;
  -[NSMutableData appendType:length:value:](v3, 5, 8u, (uint64_t)&v76);
  unsigned int v75 = [(NSNumber *)self->_fallbackBufferLimit unsignedIntValue];
  -[NSMutableData appendType:length:value:](v3, 6, 4u, (uint64_t)&v75);
  unsigned int v74 = [(NSNumber *)self->_fallbackCountBeforeImmediateFallback unsignedIntValue];
  -[NSMutableData appendType:length:value:](v3, 7, 4u, (uint64_t)&v74);
  uint64_t v18 = [(NSString *)self->_proxyEvaluationPath UTF8String];
  if (v18)
  {
    uint64_t v19 = (uint64_t)v18;
    unsigned __int16 v20 = strlen(v18);
    -[NSMutableData appendType:length:value:](v3, 8, v20, v19);
  }
  int v21 = [(NSString *)self->_label UTF8String];
  if (v21)
  {
    uint64_t v22 = (uint64_t)v21;
    unsigned __int16 v23 = strlen(v21);
    -[NSMutableData appendType:length:value:](v3, 17, v23, v22);
  }
  [(NSNumber *)self->_connectionTimeout doubleValue];
  uint64_t v73 = v24;
  -[NSMutableData appendType:length:value:](v3, 12, 8u, (uint64_t)&v73);
  [(NSNumber *)self->_connectionIdleTimeout doubleValue];
  uint64_t v72 = v25;
  -[NSMutableData appendType:length:value:](v3, 13, 8u, (uint64_t)&v72);
  [(NSNumber *)self->_telemetryRatio doubleValue];
  uint64_t v71 = v26;
  -[NSMutableData appendType:length:value:](v3, 16, 8u, (uint64_t)&v71);
  long long v69 = 0u;
  long long v70 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  uint64_t v27 = [(NEAppRule *)self matchAccountIdentifiers];
  uint64_t v28 = [v27 countByEnumeratingWithState:&v67 objects:v85 count:16];
  if (v28)
  {
    uint64_t v29 = v28;
    uint64_t v30 = *(void *)v68;
    do
    {
      for (uint64_t j = 0; j != v29; ++j)
      {
        if (*(void *)v68 != v30) {
          objc_enumerationMutation(v27);
        }
        uint64_t v32 = (const char *)[*(id *)(*((void *)&v67 + 1) + 8 * j) UTF8String];
        unsigned __int16 v33 = strlen(v32);
        -[NSMutableData appendType:length:value:](v3, 10, v33, (uint64_t)v32);
      }
      uint64_t v29 = [v27 countByEnumeratingWithState:&v67 objects:v85 count:16];
    }
    while (v29);
  }

  long long v65 = 0u;
  long long v66 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  uint64_t v34 = [(NEAppRule *)self matchDomains];
  uint64_t v35 = [v34 countByEnumeratingWithState:&v63 objects:v84 count:16];
  if (v35)
  {
    uint64_t v36 = v35;
    uint64_t v37 = *(void *)v64;
    do
    {
      for (uint64_t k = 0; k != v36; ++k)
      {
        if (*(void *)v64 != v37) {
          objc_enumerationMutation(v34);
        }
        uint64_t v39 = (const char *)[*(id *)(*((void *)&v63 + 1) + 8 * k) UTF8String];
        unsigned __int16 v40 = strlen(v39);
        -[NSMutableData appendType:length:value:](v3, 18, v40, (uint64_t)v39);
      }
      uint64_t v36 = [v34 countByEnumeratingWithState:&v63 objects:v84 count:16];
    }
    while (v36);
  }

  long long v61 = 0u;
  long long v62 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  uint64_t v41 = self->_matchEffectiveApplications;
  uint64_t v42 = [(NSArray *)v41 countByEnumeratingWithState:&v59 objects:v83 count:16];
  if (v42)
  {
    uint64_t v43 = v42;
    uint64_t v44 = *(void *)v60;
    do
    {
      for (uint64_t m = 0; m != v43; ++m)
      {
        if (*(void *)v60 != v44) {
          objc_enumerationMutation(v41);
        }
        id v46 = (void *)[*(id *)(*((void *)&v59 + 1) + 8 * m) copyTLVData];
        unsigned __int16 v47 = [v46 length];
        id v48 = v46;
        -[NSMutableData appendType:length:value:](v3, 19, v47, [v48 bytes]);
      }
      uint64_t v43 = [(NSArray *)v41 countByEnumeratingWithState:&v59 objects:v83 count:16];
    }
    while (v43);
  }

  edgeSetIdentifier = self->_edgeSetIdentifier;
  if (edgeSetIdentifier)
  {
    uint64_t v50 = [(NSString *)edgeSetIdentifier UTF8String];
    unsigned __int16 v51 = strlen(v50);
    -[NSMutableData appendType:length:value:](v3, 20, v51, (uint64_t)v50);
  }
  initialWindowSize = self->_initialWindowSize;
  if (initialWindowSize)
  {
    uint64_t v58 = [(NSNumber *)initialWindowSize unsignedIntegerValue];
    -[NSMutableData appendType:length:value:](v3, 22, 8u, (uint64_t)&v58);
  }
  uint64_t v53 = [(NSPAppRule *)self updateHash];

  if (v53)
  {
    uint64_t v54 = [(NSPAppRule *)self updateHash];
    unsigned __int16 v55 = [v54 length];
    id v56 = [(NSPAppRule *)self updateHash];
    -[NSMutableData appendType:length:value:](v3, 23, v55, [v56 bytes]);
  }
  return v3;
}

- (void)merge:(id)a3
{
  id v46 = (BOOL *)a3;
  id v4 = [v46 matchAccountIdentifiers];

  if (v4)
  {
    id v5 = [v46 matchAccountIdentifiers];
    [(NEAppRule *)self setMatchAccountIdentifiers:v5];
  }
  id v6 = [v46 matchDomains];

  if (v6)
  {
    int v7 = [v46 matchDomains];
    [(NEAppRule *)self setMatchDomains:v7];
  }
  unsigned __int16 v8 = [v46 matchPath];

  if (v8)
  {
    unsigned __int16 v9 = [v46 matchPath];
    [(NEAppRule *)self setMatchPath:v9];
  }
  int v10 = v46;
  id v11 = (void *)*((void *)v46 + 10);
  if (v11)
  {
    objc_storeStrong((id *)&self->_disableFallback, v11);
    int v10 = v46;
  }
  uint64_t v12 = (void *)*((void *)v10 + 11);
  if (v12)
  {
    objc_storeStrong((id *)&self->_enableDirectMultipath, v12);
    int v10 = v46;
  }
  uint64_t v13 = (void *)*((void *)v10 + 12);
  if (v13)
  {
    objc_storeStrong((id *)&self->_enableDirectTFO, v13);
    int v10 = v46;
  }
  uint64_t v14 = (void *)*((void *)v10 + 13);
  if (v14)
  {
    objc_storeStrong((id *)&self->_enableDirectExtendedValidation, v14);
    int v10 = v46;
  }
  long long v15 = (void *)*((void *)v10 + 14);
  if (v15)
  {
    objc_storeStrong((id *)&self->_directTLSPorts, v15);
    int v10 = v46;
  }
  uint64_t v16 = (void *)*((void *)v10 + 15);
  if (v16)
  {
    objc_storeStrong((id *)&self->_divertDNSOnly, v16);
    int v10 = v46;
  }
  uint64_t v17 = (void *)*((void *)v10 + 16);
  if (v17)
  {
    objc_storeStrong((id *)&self->_noDNSDelegation, v17);
    int v10 = v46;
  }
  uint64_t v18 = (void *)*((void *)v10 + 17);
  if (v18)
  {
    objc_storeStrong((id *)&self->_serviceID, v18);
    int v10 = v46;
  }
  uint64_t v19 = (void *)*((void *)v10 + 18);
  if (v19)
  {
    objc_storeStrong((id *)&self->_enabled, v19);
    int v10 = v46;
  }
  unsigned __int16 v20 = (void *)*((void *)v10 + 19);
  if (v20)
  {
    objc_storeStrong((id *)&self->_fallbackTimeout, v20);
    int v10 = v46;
  }
  int v21 = (void *)*((void *)v10 + 20);
  if (v21)
  {
    objc_storeStrong((id *)&self->_fallbackBufferLimit, v21);
    int v10 = v46;
  }
  uint64_t v22 = (void *)*((void *)v10 + 21);
  if (v22)
  {
    objc_storeStrong((id *)&self->_fallbackCountBeforeImmediateFallback, v22);
    int v10 = v46;
  }
  unsigned __int16 v23 = (void *)*((void *)v10 + 22);
  if (v23)
  {
    objc_storeStrong((id *)&self->_proxyEvaluationPath, v23);
    int v10 = v46;
  }
  uint64_t v24 = (void *)*((void *)v10 + 23);
  if (v24)
  {
    objc_storeStrong((id *)&self->_useCustomProtocol, v24);
    int v10 = v46;
  }
  uint64_t v25 = (void *)*((void *)v10 + 24);
  if (v25)
  {
    objc_storeStrong((id *)&self->_useLocalFlowDivert, v25);
    int v10 = v46;
  }
  uint64_t v26 = (void *)*((void *)v10 + 25);
  if (v26)
  {
    objc_storeStrong((id *)&self->_enableDirectRace, v26);
    int v10 = v46;
  }
  uint64_t v27 = (void *)*((void *)v10 + 38);
  if (v27)
  {
    objc_storeStrong((id *)&self->_shouldComposeInitialData, v27);
    int v10 = v46;
  }
  uint64_t v28 = (void *)*((void *)v10 + 26);
  if (v28)
  {
    objc_storeStrong((id *)&self->_label, v28);
    int v10 = v46;
  }
  uint64_t v29 = (void *)*((void *)v10 + 27);
  if (v29)
  {
    objc_storeStrong((id *)&self->_edgeSetIdentifier, v29);
    int v10 = v46;
  }
  uint64_t v30 = (void *)*((void *)v10 + 28);
  if (v30)
  {
    objc_storeStrong((id *)&self->_connectionTimeout, v30);
    int v10 = v46;
  }
  id v31 = (void *)*((void *)v10 + 29);
  if (v31)
  {
    objc_storeStrong((id *)&self->_connectionIdleTimeout, v31);
    int v10 = v46;
  }
  uint64_t v32 = (void *)*((void *)v10 + 30);
  if (v32)
  {
    objc_storeStrong((id *)&self->_enableMultipath, v32);
    int v10 = v46;
  }
  unsigned __int16 v33 = (void *)*((void *)v10 + 31);
  if (v33)
  {
    objc_storeStrong((id *)&self->_enableTFO, v33);
    int v10 = v46;
  }
  uint64_t v34 = (void *)*((void *)v10 + 32);
  if (v34)
  {
    objc_storeStrong((id *)&self->_requireTFO, v34);
    int v10 = v46;
  }
  uint64_t v35 = (void *)*((void *)v10 + 33);
  if (v35)
  {
    objc_storeStrong((id *)&self->_enableNoTFOCookie, v35);
    int v10 = v46;
  }
  uint64_t v36 = (void *)*((void *)v10 + 34);
  if (v36)
  {
    objc_storeStrong((id *)&self->_enableUDPRace, v36);
    int v10 = v46;
  }
  uint64_t v37 = (void *)*((void *)v10 + 35);
  if (v37)
  {
    objc_storeStrong((id *)&self->_enableRatio, v37);
    int v10 = v46;
  }
  id v38 = (void *)*((void *)v10 + 36);
  if (v38)
  {
    objc_storeStrong((id *)&self->_reenableInterval, v38);
    int v10 = v46;
  }
  uint64_t v39 = (void *)*((void *)v10 + 37);
  if (v39)
  {
    objc_storeStrong((id *)&self->_telemetryRatio, v39);
    int v10 = v46;
  }
  unsigned __int16 v40 = (void *)*((void *)v10 + 40);
  if (v40)
  {
    objc_storeStrong((id *)&self->_matchEffectiveApplications, v40);
    int v10 = v46;
  }
  uint64_t v41 = (void *)*((void *)v10 + 46);
  if (v41)
  {
    objc_storeStrong((id *)&self->_configurationIdentifier, v41);
    int v10 = v46;
  }
  uint64_t v42 = (void *)*((void *)v10 + 39);
  if (v42)
  {
    objc_storeStrong((id *)&self->_enableOptInPerTask, v42);
    int v10 = v46;
  }
  uint64_t v43 = (void *)*((void *)v10 + 41);
  if (v43)
  {
    objc_storeStrong((id *)&self->_locationBundlePath, v43);
    int v10 = v46;
  }
  uint64_t v44 = (void *)*((void *)v10 + 42);
  if (v44)
  {
    objc_storeStrong((id *)&self->_initialWindowSize, v44);
    int v10 = v46;
  }
  uint64_t v45 = (void *)*((void *)v10 + 48);
  if (v45)
  {
    objc_storeStrong((id *)&self->_updateHash, v45);
    int v10 = v46;
  }
  objc_storeStrong((id *)&self->_enableCheckDate, *((id *)v10 + 47));
  self->_disabledByRatio = v46[72];
}

- (BOOL)updateNetworkAgent
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  if (![(NWNetworkAgentRegistration *)self->_agentRegistration isRegistered])
  {
    *(void *)uint64_t v35 = 0;
    uint64_t v36 = v35;
    uint64_t v37 = 0x3032000000;
    id v38 = __Block_byref_object_copy__1;
    uint64_t v39 = __Block_byref_object_dispose__1;
    id v40 = 0;
    if (self->_configurationIdentifier)
    {
      id v5 = nplog_obj();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      {
        configurationIdentifier = self->_configurationIdentifier;
        *(_DWORD *)buf = 138412290;
        uint64_t v42 = configurationIdentifier;
        _os_log_debug_impl(&dword_1A0FEE000, v5, OS_LOG_TYPE_DEBUG, "Looking for existing config agent registration with configuration ID %@", buf, 0xCu);
      }

      id v6 = [MEMORY[0x1E4F38CD8] sharedMaintainer];
      v34[0] = MEMORY[0x1E4F143A8];
      v34[1] = 3221225472;
      v34[2] = __32__NSPAppRule_updateNetworkAgent__block_invoke;
      v34[3] = &unk_1E5A3BC58;
      v34[4] = self;
      v34[5] = v35;
      [v6 iterateFileHandlesWithBlock:v34];
    }
    else
    {
      int v7 = (NSUUID *)objc_alloc_init(MEMORY[0x1E4F29128]);
      unsigned __int16 v8 = self->_configurationIdentifier;
      self->_configurationIdentifier = v7;

      unsigned __int16 v9 = nplog_obj();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        id v31 = self->_configurationIdentifier;
        *(_DWORD *)buf = 138412290;
        uint64_t v42 = v31;
        _os_log_debug_impl(&dword_1A0FEE000, v9, OS_LOG_TYPE_DEBUG, "Creating a new config agent configuration identifier: %@", buf, 0xCu);
      }
    }
    uint64_t v10 = *((void *)v36 + 5);
    id v11 = nplog_obj();
    BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
    if (v10)
    {
      if (v12)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A0FEE000, v11, OS_LOG_TYPE_DEFAULT, "Re-using existing network agent registration file handle", buf, 2u);
      }

      uint64_t v13 = [*((id *)v36 + 5) handle];
      uint64_t v14 = dup([v13 fileDescriptor]);

      long long v15 = [*((id *)v36 + 5) agentUUID];
      [(NSPNetworkAgent *)self->_agent setAgentUUID:v15];

      uint64_t v16 = nplog_obj();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v30 = [(NSPNetworkAgent *)self->_agent agentUUID];
        *(_DWORD *)buf = 138412290;
        uint64_t v42 = v30;
        _os_log_debug_impl(&dword_1A0FEE000, v16, OS_LOG_TYPE_DEBUG, "Set config agent UUID: %@", buf, 0xCu);
      }
      if (([(NWNetworkAgentRegistration *)self->_agentRegistration setRegisteredNetworkAgent:self->_agent fileDescriptor:v14] & 1) == 0)
      {
        close(v14);
LABEL_29:
        BOOL v4 = 0;
        goto LABEL_30;
      }
    }
    else
    {
      if (v12)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A0FEE000, v11, OS_LOG_TYPE_DEFAULT, "Setting up new network agent registration", buf, 2u);
      }

      uint64_t v17 = [MEMORY[0x1E4F29128] UUID];
      [(NSPNetworkAgent *)self->_agent setAgentUUID:v17];

      uint64_t v18 = nplog_obj();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v32 = [(NSPNetworkAgent *)self->_agent agentUUID];
        *(_DWORD *)buf = 138412290;
        uint64_t v42 = v32;
        _os_log_debug_impl(&dword_1A0FEE000, v18, OS_LOG_TYPE_DEBUG, "Created a new config agent UUID: %@", buf, 0xCu);
      }
      [(NWNetworkAgentRegistration *)self->_agentRegistration registerNetworkAgent:self->_agent];
      if (([(NWNetworkAgentRegistration *)self->_agentRegistration isRegistered] & 1) == 0)
      {
        uint64_t v27 = nplog_obj();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_1A0FEE000, v27, OS_LOG_TYPE_ERROR, "Failed to register configuration network agent", buf, 2u);
        }

        goto LABEL_29;
      }
      id v19 = objc_alloc(MEMORY[0x1E4F38D00]);
      agentRegistration = self->_agentRegistration;
      int v21 = self->_configurationIdentifier;
      uint64_t v22 = [(NSPNetworkAgent *)self->_agent agentUUID];
      uint64_t v23 = [v19 initWithNetworkAgentRegistration:agentRegistration sessionType:&unk_1EF43BD78 configurationIdentifier:v21 agentUUID:v22];
      uint64_t v24 = (void *)*((void *)v36 + 5);
      *((void *)v36 + 5) = v23;

      uint64_t v25 = [MEMORY[0x1E4F38CD8] sharedMaintainer];
      uint64_t v26 = *((void *)v36 + 5);
      v33[0] = MEMORY[0x1E4F143A8];
      v33[1] = 3221225472;
      v33[2] = __32__NSPAppRule_updateNetworkAgent__block_invoke_226;
      v33[3] = &unk_1E5A3BC80;
      v33[4] = self;
      [v25 setFileHandle:v26 matchingPredicate:v33];
    }
    BOOL v4 = 1;
LABEL_30:
    _Block_object_dispose(v35, 8);

    return v4;
  }
  id v3 = nplog_obj();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)uint64_t v35 = 0;
    _os_log_debug_impl(&dword_1A0FEE000, v3, OS_LOG_TYPE_DEBUG, "Updating existing configuration agent", v35, 2u);
  }

  return [(NWNetworkAgentRegistration *)self->_agentRegistration updateNetworkAgent:self->_agent];
}

uint64_t __32__NSPAppRule_updateNetworkAgent__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_6;
  }
  BOOL v4 = [v3 sessionType];
  int v5 = [v4 isEqual:&unk_1EF43BD78];
  if (v5)
  {
    id v6 = [v3 configurationIdentifier];
    int v7 = [v6 isEqual:*(void *)(*(void *)(a1 + 32) + 368)];

    if (v7)
    {
      uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
      id v9 = v3;
      BOOL v4 = *(void **)(v8 + 40);
      *(void *)(v8 + 40) = v9;
      goto LABEL_5;
    }
LABEL_6:
    uint64_t v10 = 1;
    goto LABEL_7;
  }
LABEL_5:
  uint64_t v10 = v5 ^ 1u;

LABEL_7:
  return v10;
}

uint64_t __32__NSPAppRule_updateNetworkAgent__block_invoke_226(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    BOOL v4 = [v3 sessionType];
    if ([v4 isEqual:&unk_1EF43BD78])
    {
      int v5 = [v3 configurationIdentifier];
      uint64_t v6 = [v5 isEqual:*(void *)(*(void *)(a1 + 32) + 368)];
    }
    else
    {
      uint64_t v6 = 0;
    }
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (void)teardownNetworkAgent
{
  agentRegistration = self->_agentRegistration;
  if (agentRegistration)
  {
    [(NWNetworkAgentRegistration *)agentRegistration unregisterNetworkAgent];
    BOOL v4 = [MEMORY[0x1E4F38CD8] sharedMaintainer];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __34__NSPAppRule_teardownNetworkAgent__block_invoke;
    v7[3] = &unk_1E5A3BC80;
    v7[4] = self;
    [v4 removeFileHandleMatchingPredicate:v7];

    agent = self->_agent;
    self->_agent = 0;

    uint64_t v6 = self->_agentRegistration;
    self->_agentRegistration = 0;
  }
}

uint64_t __34__NSPAppRule_teardownNetworkAgent__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    BOOL v4 = [v3 sessionType];
    if ([v4 isEqual:&unk_1EF43BD78])
    {
      int v5 = [v3 configurationIdentifier];
      uint64_t v6 = [v5 isEqual:*(void *)(*(void *)(a1 + 32) + 368)];
    }
    else
    {
      uint64_t v6 = 0;
    }
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (NSNumber)disableFallback
{
  return self->_disableFallback;
}

- (void)setDisableFallback:(id)a3
{
}

- (NSNumber)enableDirectMultipath
{
  return self->_enableDirectMultipath;
}

- (void)setEnableDirectMultipath:(id)a3
{
}

- (NSNumber)enableDirectTFO
{
  return self->_enableDirectTFO;
}

- (void)setEnableDirectTFO:(id)a3
{
}

- (NSNumber)enableDirectExtendedValidation
{
  return self->_enableDirectExtendedValidation;
}

- (void)setEnableDirectExtendedValidation:(id)a3
{
}

- (NSArray)directTLSPorts
{
  return self->_directTLSPorts;
}

- (void)setDirectTLSPorts:(id)a3
{
}

- (NSNumber)divertDNSOnly
{
  return self->_divertDNSOnly;
}

- (void)setDivertDNSOnly:(id)a3
{
}

- (NSNumber)noDNSDelegation
{
  return self->_noDNSDelegation;
}

- (void)setNoDNSDelegation:(id)a3
{
}

- (NSNumber)serviceID
{
  return self->_serviceID;
}

- (void)setServiceID:(id)a3
{
}

- (NSNumber)enabled
{
  return self->_enabled;
}

- (void)setEnabled:(id)a3
{
}

- (NSNumber)fallbackTimeout
{
  return self->_fallbackTimeout;
}

- (void)setFallbackTimeout:(id)a3
{
}

- (NSNumber)fallbackBufferLimit
{
  return self->_fallbackBufferLimit;
}

- (void)setFallbackBufferLimit:(id)a3
{
}

- (NSNumber)fallbackCountBeforeImmediateFallback
{
  return self->_fallbackCountBeforeImmediateFallback;
}

- (void)setFallbackCountBeforeImmediateFallback:(id)a3
{
}

- (NSString)proxyEvaluationPath
{
  return self->_proxyEvaluationPath;
}

- (void)setProxyEvaluationPath:(id)a3
{
}

- (NSNumber)useCustomProtocol
{
  return self->_useCustomProtocol;
}

- (void)setUseCustomProtocol:(id)a3
{
}

- (NSNumber)useLocalFlowDivert
{
  return self->_useLocalFlowDivert;
}

- (void)setUseLocalFlowDivert:(id)a3
{
}

- (NSNumber)enableDirectRace
{
  return self->_enableDirectRace;
}

- (void)setEnableDirectRace:(id)a3
{
}

- (NSString)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
}

- (NSString)edgeSetIdentifier
{
  return self->_edgeSetIdentifier;
}

- (void)setEdgeSetIdentifier:(id)a3
{
}

- (NSNumber)connectionTimeout
{
  return self->_connectionTimeout;
}

- (void)setConnectionTimeout:(id)a3
{
}

- (NSNumber)connectionIdleTimeout
{
  return self->_connectionIdleTimeout;
}

- (void)setConnectionIdleTimeout:(id)a3
{
}

- (NSNumber)enableMultipath
{
  return self->_enableMultipath;
}

- (void)setEnableMultipath:(id)a3
{
}

- (NSNumber)enableTFO
{
  return self->_enableTFO;
}

- (void)setEnableTFO:(id)a3
{
}

- (NSNumber)requireTFO
{
  return self->_requireTFO;
}

- (void)setRequireTFO:(id)a3
{
}

- (NSNumber)enableNoTFOCookie
{
  return self->_enableNoTFOCookie;
}

- (void)setEnableNoTFOCookie:(id)a3
{
}

- (NSNumber)enableUDPRace
{
  return self->_enableUDPRace;
}

- (void)setEnableUDPRace:(id)a3
{
}

- (NSNumber)enableRatio
{
  return self->_enableRatio;
}

- (void)setEnableRatio:(id)a3
{
}

- (NSNumber)reenableInterval
{
  return self->_reenableInterval;
}

- (void)setReenableInterval:(id)a3
{
}

- (NSNumber)telemetryRatio
{
  return self->_telemetryRatio;
}

- (void)setTelemetryRatio:(id)a3
{
}

- (NSNumber)shouldComposeInitialData
{
  return self->_shouldComposeInitialData;
}

- (void)setShouldComposeInitialData:(id)a3
{
}

- (NSNumber)enableOptInPerTask
{
  return self->_enableOptInPerTask;
}

- (void)setEnableOptInPerTask:(id)a3
{
}

- (NSArray)matchEffectiveApplications
{
  return self->_matchEffectiveApplications;
}

- (void)setMatchEffectiveApplications:(id)a3
{
}

- (NSString)locationBundlePath
{
  return self->_locationBundlePath;
}

- (void)setLocationBundlePath:(id)a3
{
}

- (NSNumber)initialWindowSize
{
  return self->_initialWindowSize;
}

- (void)setInitialWindowSize:(id)a3
{
}

- (NSPAppRule)defaults
{
  return self->_defaults;
}

- (void)setDefaults:(id)a3
{
}

- (NSPNetworkAgent)agent
{
  return self->_agent;
}

- (void)setAgent:(id)a3
{
}

- (NWNetworkAgentRegistration)agentRegistration
{
  return self->_agentRegistration;
}

- (void)setAgentRegistration:(id)a3
{
}

- (NSUUID)configurationIdentifier
{
  return self->_configurationIdentifier;
}

- (void)setConfigurationIdentifier:(id)a3
{
}

- (NSDate)enableCheckDate
{
  return self->_enableCheckDate;
}

- (void)setEnableCheckDate:(id)a3
{
}

- (BOOL)disabledByRatio
{
  return self->_disabledByRatio;
}

- (void)setDisabledByRatio:(BOOL)a3
{
  self->_disabledByRatio = a3;
}

- (NSData)updateHash
{
  return self->_updateHash;
}

- (void)setUpdateHash:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updateHash, 0);
  objc_storeStrong((id *)&self->_enableCheckDate, 0);
  objc_storeStrong((id *)&self->_configurationIdentifier, 0);
  objc_storeStrong((id *)&self->_agentRegistration, 0);
  objc_storeStrong((id *)&self->_agent, 0);
  objc_storeStrong((id *)&self->_defaults, 0);
  objc_storeStrong((id *)&self->_initialWindowSize, 0);
  objc_storeStrong((id *)&self->_locationBundlePath, 0);
  objc_storeStrong((id *)&self->_matchEffectiveApplications, 0);
  objc_storeStrong((id *)&self->_enableOptInPerTask, 0);
  objc_storeStrong((id *)&self->_shouldComposeInitialData, 0);
  objc_storeStrong((id *)&self->_telemetryRatio, 0);
  objc_storeStrong((id *)&self->_reenableInterval, 0);
  objc_storeStrong((id *)&self->_enableRatio, 0);
  objc_storeStrong((id *)&self->_enableUDPRace, 0);
  objc_storeStrong((id *)&self->_enableNoTFOCookie, 0);
  objc_storeStrong((id *)&self->_requireTFO, 0);
  objc_storeStrong((id *)&self->_enableTFO, 0);
  objc_storeStrong((id *)&self->_enableMultipath, 0);
  objc_storeStrong((id *)&self->_connectionIdleTimeout, 0);
  objc_storeStrong((id *)&self->_connectionTimeout, 0);
  objc_storeStrong((id *)&self->_edgeSetIdentifier, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_enableDirectRace, 0);
  objc_storeStrong((id *)&self->_useLocalFlowDivert, 0);
  objc_storeStrong((id *)&self->_useCustomProtocol, 0);
  objc_storeStrong((id *)&self->_proxyEvaluationPath, 0);
  objc_storeStrong((id *)&self->_fallbackCountBeforeImmediateFallback, 0);
  objc_storeStrong((id *)&self->_fallbackBufferLimit, 0);
  objc_storeStrong((id *)&self->_fallbackTimeout, 0);
  objc_storeStrong((id *)&self->_enabled, 0);
  objc_storeStrong((id *)&self->_serviceID, 0);
  objc_storeStrong((id *)&self->_noDNSDelegation, 0);
  objc_storeStrong((id *)&self->_divertDNSOnly, 0);
  objc_storeStrong((id *)&self->_directTLSPorts, 0);
  objc_storeStrong((id *)&self->_enableDirectExtendedValidation, 0);
  objc_storeStrong((id *)&self->_enableDirectTFO, 0);
  objc_storeStrong((id *)&self->_enableDirectMultipath, 0);
  objc_storeStrong((id *)&self->_disableFallback, 0);
}

@end
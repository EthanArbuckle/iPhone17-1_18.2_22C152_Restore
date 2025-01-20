@interface NPWaldo
+ (BOOL)supportsSecureCoding;
+ (id)createEndpointFromHostList:(id)a3 defaultPortString:(id)a4 allowIPv6:(BOOL)a5;
- (BOOL)daypassRefreshInProgress;
- (BOOL)hasEdges;
- (BOOL)isEndpointProbed:(id)a3 parameters:(networkParameters *)a4 latencies:(id)a5 checkSampleSize:(BOOL)a6 incompleteLatency:(id *)a7;
- (BOOL)isIPv6Enabled;
- (BOOL)isLatenciesCompleteForNetwork:(id)a3;
- (BOOL)reResolve;
- (BOOL)reprocessCancelled;
- (BOOL)reprocessPending;
- (BOOL)reprocessWithNewRTT:(unint64_t)a3 reProbe:(BOOL *)a4;
- (BOOL)shouldFetchWaldo;
- (BOOL)shouldPerformDayPassRefresh;
- (BOOL)shouldSave;
- (BOOL)validateEdgeList:(id)a3;
- (NPKeyBag)keybag;
- (NPLocation)cachedLocation;
- (NPTuscanyEdge)currentEdge;
- (NPTuscanyEdge)nextEdge;
- (NPWaldo)defaults;
- (NPWaldo)init;
- (NPWaldo)initWithCoder:(id)a3;
- (NPWaldo)initWithIdentifier:(id)a3 timestamp:(id)a4 fromDictionary:(id)a5 source:(int64_t)a6;
- (NPWaldoDelegate)delegate;
- (NPWaldoLocationManager)locationManager;
- (NSArray)allOnRamps;
- (NSArray)currentEdgeList;
- (NSArray)currentEdges;
- (NSArray)dayPassSoftExpiry;
- (NSArray)edges;
- (NSData)updateHash;
- (NSDate)currentNetworkLastUsed;
- (NSDate)expirationDate;
- (NSDate)locationCheckTimestamp;
- (NSDate)locationExpiration;
- (NSMutableDictionary)networkInformation;
- (NSNumber)TFOLeeway;
- (NSNumber)connectionIdleTimeoutMaximum;
- (NSNumber)dayPassEnableSessionTicket;
- (NSNumber)dayPassExtendedValidation;
- (NSNumber)dayPassHostnamePrependLabel;
- (NSNumber)dayPassPort;
- (NSNumber)dayPassRequestTimeout;
- (NSNumber)dayPassRevocationFailClosed;
- (NSNumber)edgeFairnessFactor;
- (NSNumber)edgeSelectionAlpha;
- (NSNumber)edgeSelectionEnabled;
- (NSNumber)edgeSelectionWindowSize;
- (NSNumber)edgesGeneration;
- (NSNumber)enableIPv6;
- (NSNumber)enableLatencyDerivation;
- (NSNumber)latencyFactorA;
- (NSNumber)latencyFactorB;
- (NSNumber)latencyFactorX;
- (NSNumber)locationCheckInterval;
- (NSNumber)locationTTL;
- (NSNumber)locationToleranceDistance;
- (NSNumber)observedRTTSampleSize;
- (NSNumber)probeNoTFOCookie;
- (NSNumber)probePause;
- (NSNumber)probeTFO;
- (NSNumber)probeTimeout;
- (NSNumber)reprocessSampleSize;
- (NSNumber)reprocessSamplingInterval;
- (NSNumber)requireTFO;
- (NSNumber)retryPause;
- (NSNumber)signatureLimit;
- (NSNumber)timestamp;
- (NSNumber)useGeohashFromServer;
- (NSNumber)usedEdgesGeneration;
- (NSNumber)version;
- (NSNumber)viewSize;
- (NSPNetworkAgent)agent;
- (NSString)dayPassHostname;
- (NSString)dayPassLeafOID;
- (NSString)hostname;
- (NSString)identifier;
- (NSString)tag;
- (NSString)telemetryService;
- (NSURL)telemetryURL;
- (NSUUID)configurationIdentifier;
- (NWNetworkAgentRegistration)agentRegistration;
- (OS_dispatch_queue)reprocessQueue;
- (OS_dispatch_source)reprocessSamplingTimer;
- (id)copyEdgeList:(id)a3;
- (id)copyEdgeListRTTAverage:(id)a3 observed:(BOOL)a4 shortDescription:(BOOL)a5;
- (id)copyEdgeSelectionTelemetry;
- (id)copyLatencyInfoDictionary:(BOOL)a3 copyAll:(BOOL)a4;
- (id)copyStateIncludeDistance:(BOOL)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)createEdgeLatenciesToProbeWithEdgeIndex:(unint64_t)a3 startSampleCount:(unint64_t *)a4;
- (id)currentNetworkInfo;
- (id)description;
- (id)edgeAtIndex:(int64_t)a3;
- (id)edgeContainingOnRamp:(id)a3;
- (id)initFromKeychainWithIdentifier:(id)a3;
- (id)latencyComparator;
- (id)onRampForIndex:(id)a3;
- (int64_t)currentEdgeIndex;
- (int64_t)dayPassFetchCount;
- (int64_t)getCurrentNetworkInterfaceType;
- (int64_t)getFallbackReasonForLatencies:(id)a3;
- (int64_t)indexOfBestEdge;
- (int64_t)source;
- (unint64_t)edgeCount;
- (unint64_t)probeSize;
- (unsigned)generation;
- (void)ageOutLatencyMap;
- (void)cancelProbes;
- (void)cleanupStaleKeys;
- (void)encodeWithCoder:(id)a3;
- (void)establishTrustWithCompletionHandler:(id)a3;
- (void)getDayPassRTT;
- (void)handleUsageReport:(id)a3;
- (void)incrementSessionCounters;
- (void)initializeEdgeSelection;
- (void)link;
- (void)linkAllSignatures:(BOOL)a3;
- (void)linkLatenciesAllSignatures:(BOOL)a3;
- (void)loadObservedRTTSamples:(id)a3;
- (void)logEdgeList:(id)a3 debug:(BOOL)a4 toStdout:(BOOL)a5;
- (void)logLatencyInfoToStdout:(BOOL)a3 logAll:(BOOL)a4 logEdgeSelection:(BOOL)a5;
- (void)merge:(id)a3 missingSettingsOnly:(BOOL)a4;
- (void)mergeEdgeList:(id)a3 forNetworkSignature:(id)a4;
- (void)pushKeybagToKernel;
- (void)pushKeybagToKernelCanReuse:(BOOL)a3;
- (void)pushKeybagToKernelUpdateGeneration:(BOOL)a3;
- (void)rebuildLatencyMapAllSignatures:(BOOL)a3;
- (void)refreshDayPassesWithCompletionHandler:(id)a3;
- (void)removeDayPassesFromKernel;
- (void)removeFromKeychain;
- (void)reprocessAdHocWithEdgeIndex:(unint64_t)a3 completionHandler:(id)a4;
- (void)reprocessEdgeAtIndex:(unint64_t)a3 networkSignature:(id)a4 completionHandler:(id)a5;
- (void)reprocessLatencies:(id)a3 sampleCount:(unint64_t)a4 completionHandler:(id)a5;
- (void)reprocessWithCompletionHandler:(id)a3;
- (void)resolveWithCompletionHandler:(id)a3;
- (void)resortEdgeListForCurrentNetworkSignature;
- (void)saveToKeychain;
- (void)setAgent:(id)a3;
- (void)setAgentRegistration:(id)a3;
- (void)setAllOnRamps:(id)a3;
- (void)setCachedLocation:(id)a3;
- (void)setConfigurationIdentifier:(id)a3;
- (void)setConnectionIdleTimeoutMaximum:(id)a3;
- (void)setCurrentEdgeIndex:(int64_t)a3;
- (void)setCurrentNetworkCharacteristics:(id)a3;
- (void)setDayPassEnableSessionTicket:(id)a3;
- (void)setDayPassExtendedValidation:(id)a3;
- (void)setDayPassHostname:(id)a3;
- (void)setDayPassHostnamePrependLabel:(id)a3;
- (void)setDayPassLeafOID:(id)a3;
- (void)setDayPassPort:(id)a3;
- (void)setDayPassRequestTimeout:(id)a3;
- (void)setDayPassRevocationFailClosed:(id)a3;
- (void)setDayPassSoftExpiry:(id)a3;
- (void)setDaypassRefreshInProgress:(BOOL)a3;
- (void)setDefaults:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setEdgeFairnessFactor:(id)a3;
- (void)setEdgeSelectionAlpha:(id)a3;
- (void)setEdgeSelectionEnabled:(id)a3;
- (void)setEdgeSelectionWindowSize:(id)a3;
- (void)setEdges:(id)a3;
- (void)setEdgesGeneration:(id)a3;
- (void)setEnableIPv6:(id)a3;
- (void)setEnableLatencyDerivation:(id)a3;
- (void)setGeneration:(unsigned int)a3;
- (void)setHostname:(id)a3;
- (void)setKeybag:(id)a3;
- (void)setLatencyFactorA:(id)a3;
- (void)setLatencyFactorB:(id)a3;
- (void)setLatencyFactorX:(id)a3;
- (void)setLocationCheckInterval:(id)a3;
- (void)setLocationCheckTimestamp:(id)a3;
- (void)setLocationExpiration:(id)a3;
- (void)setLocationManager:(id)a3;
- (void)setLocationTTL:(id)a3;
- (void)setLocationToleranceDistance:(id)a3;
- (void)setNetworkInformation:(id)a3;
- (void)setObservedRTTSampleSize:(id)a3;
- (void)setProbeNoTFOCookie:(id)a3;
- (void)setProbePause:(id)a3;
- (void)setProbeTFO:(id)a3;
- (void)setProbeTimeout:(id)a3;
- (void)setReResolve:(BOOL)a3;
- (void)setReprocessCancelled:(BOOL)a3;
- (void)setReprocessPending:(BOOL)a3;
- (void)setReprocessSampleSize:(id)a3;
- (void)setReprocessSamplingInterval:(id)a3;
- (void)setReprocessSamplingTimer:(id)a3;
- (void)setRequireTFO:(id)a3;
- (void)setRetryPause:(id)a3;
- (void)setShouldSave:(BOOL)a3;
- (void)setSignatureLimit:(id)a3;
- (void)setTFOLeeway:(id)a3;
- (void)setTag:(id)a3;
- (void)setTelemetryService:(id)a3;
- (void)setTelemetryURL:(id)a3;
- (void)setTimestamp:(id)a3;
- (void)setUpdateHash:(id)a3;
- (void)setUseGeohashFromServer:(id)a3;
- (void)setUsedEdgesGeneration:(id)a3;
- (void)setVersion:(id)a3;
- (void)setViewSize:(id)a3;
- (void)startProbingEdges:(id)a3 atIndex:(unint64_t)a4 doneCount:(unint64_t)a5 sampleCount:(unint64_t)a6 completionHandler:(id)a7;
- (void)teardownNetworkAgent;
- (void)timestampNetworkSignature:(id)a3;
- (void)updateEdgeSelection:(unint64_t)a3;
- (void)updateMetaDataNeedProbe:(BOOL)a3 refresh:(BOOL)a4 push:(BOOL)a5 minRTT:(unint64_t)a6;
- (void)updateNetworkAgentWithKeybag:(id)a3 networkInfo:(id)a4;
@end

@implementation NPWaldo

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NPWaldo)init
{
  v6.receiver = self;
  v6.super_class = (Class)NPWaldo;
  v2 = [(NPWaldo *)&v6 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("Waldo reprocess queue", 0);
    reprocessQueue = v2->_reprocessQueue;
    v2->_reprocessQueue = (OS_dispatch_queue *)v3;
  }
  return v2;
}

- (NPWaldo)initWithIdentifier:(id)a3 timestamp:(id)a4 fromDictionary:(id)a5 source:(int64_t)a6
{
  uint64_t v182 = *MEMORY[0x1E4F143B8];
  id v165 = a3;
  id v11 = a4;
  id v12 = a5;
  v13 = [(NPWaldo *)self init];

  if (!v13)
  {
    v25 = 0;
    goto LABEL_211;
  }
  id v157 = v11;
  objc_storeStrong((id *)&v13->_identifier, a3);
  objc_storeStrong((id *)&v13->_timestamp, a4);
  v13->_source = a6;
  v14 = [v12 objectForKeyedSubscript:@"version"];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    uint64_t v16 = [v12 objectForKeyedSubscript:@"version"];
    version = v13->_version;
    v13->_version = (NSNumber *)v16;
  }
  v18 = [v12 objectForKeyedSubscript:@"nsp"];
  objc_opt_class();
  id v158 = v12;
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_139;
  }
  v19 = [v18 objectForKeyedSubscript:@"pki"];
  objc_opt_class();
  v159 = v19;
  if (objc_opt_isKindOfClass())
  {
    v20 = v18;
    v21 = -[NSDictionary objectForPlatformSpecificKey:](v19, @"session");
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      objc_storeStrong((id *)&v13->_dayPassEnableSessionTicket, v21);
    }
    v22 = -[NSDictionary objectForPlatformSpecificKey:](v19, @"ev");
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      objc_storeStrong((id *)&v13->_dayPassExtendedValidation, v22);
    }
    v23 = -[NSDictionary objectForPlatformSpecificKey:](v159, @"host");
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v24 = +[NPUtilities stripWhitespace:v23];

      if ([v24 length]) {
        objc_storeStrong((id *)&v13->_dayPassHostname, v24);
      }
    }
    else
    {
      v24 = v23;
    }
    v26 = -[NSDictionary objectForPlatformSpecificKey:](v159, @"host-prepend-label");
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      objc_storeStrong((id *)&v13->_dayPassHostnamePrependLabel, v26);
    }
    if (a6 != 1)
    {
      v27 = -[NSDictionary objectForPlatformSpecificKey:](v159, @"leafOID");
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v28 = +[NPUtilities stripWhitespace:v27];

        if ([v28 length]) {
          objc_storeStrong((id *)&v13->_dayPassLeafOID, v28);
        }
      }
      else
      {
        v28 = v27;
      }
      v29 = -[NSDictionary objectForPlatformSpecificKey:](v159, @"revocationFailClosed");
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_storeStrong((id *)&v13->_dayPassRevocationFailClosed, v29);
      }
    }
    v18 = v20;
    v19 = v159;
  }
  v30 = [v18 objectForKeyedSubscript:@"daypass"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v31 = -[NSDictionary objectForPlatformSpecificKey:](v30, @"retry");
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v31 doubleValue];
      if (v32 > 0.0) {
        objc_storeStrong((id *)&v13->_retryPause, v31);
      }
    }
    v33 = -[NSDictionary objectForPlatformSpecificKey:](v30, @"expiry");
    if (!v33) {
      goto LABEL_47;
    }
    objc_opt_class();
    v151 = v33;
    if ((objc_opt_isKindOfClass() & 1) != 0 && [v33 count])
    {
      v149 = v31;
      v154 = v18;
      v34 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      long long v170 = 0u;
      long long v171 = 0u;
      long long v172 = 0u;
      long long v173 = 0u;
      v35 = v33;
      uint64_t v36 = [v35 countByEnumeratingWithState:&v170 objects:v181 count:16];
      if (v36)
      {
        uint64_t v37 = v36;
        uint64_t v38 = *(void *)v171;
        do
        {
          for (uint64_t i = 0; i != v37; ++i)
          {
            if (*(void *)v171 != v38) {
              objc_enumerationMutation(v35);
            }
            v40 = *(NSObject **)(*((void *)&v170 + 1) + 8 * i);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0 && [v40 integerValue] > 0)
            {
              v41 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", 60 * -[NSObject unsignedIntegerValue](v40, "unsignedIntegerValue"));
              [v34 addObject:v41];
            }
            else
            {
              v41 = nplog_obj();
              if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412546;
                id v175 = v165;
                __int16 v176 = 2112;
                v177 = v40;
                _os_log_error_impl(&dword_1A0FEE000, v41, OS_LOG_TYPE_ERROR, "%@: Invalid expiry minutes: %@", buf, 0x16u);
              }
            }
          }
          uint64_t v37 = [v35 countByEnumeratingWithState:&v170 objects:v181 count:16];
        }
        while (v37);
      }

      uint64_t v42 = [v34 count];
      if (v42 == [v35 count])
      {
        objc_storeStrong((id *)&v13->_dayPassSoftExpiry, v34);

        v33 = v151;
        v18 = v154;
        v31 = v149;
LABEL_47:
        v43 = [(NSDictionary *)v30 objectForPlatformSpecificKey:@"request-timeout"];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          [v43 doubleValue];
          if (v44 > 0.0) {
            objc_storeStrong((id *)&v13->_dayPassRequestTimeout, v43);
          }
        }

        v19 = v159;
        goto LABEL_51;
      }
      id v11 = v157;
      id v12 = v158;
      v18 = v154;
      v31 = v149;
    }
    else
    {
      v34 = nplog_obj();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        id v175 = v165;
        __int16 v176 = 2112;
        v177 = v33;
        _os_log_error_impl(&dword_1A0FEE000, v34, OS_LOG_TYPE_ERROR, "%@: Invalid expiry: %@", buf, 0x16u);
      }
      id v11 = v157;
      id v12 = v158;
    }

    v25 = 0;
    v50 = v159;
    goto LABEL_210;
  }
LABEL_51:
  v45 = [v18 objectForKeyedSubscript:@"telemetry"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v46 = v30;
    v47 = v18;
    v48 = -[NSDictionary objectForPlatformSpecificKey:](v45, @"service");
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v49 = +[NPUtilities stripWhitespace:v48];

      if ([v49 length]) {
        objc_storeStrong((id *)&v13->_telemetryService, v49);
      }
    }
    else
    {
      v49 = v48;
    }
    v51 = -[NSDictionary objectForPlatformSpecificKey:](v45, @"url");
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v52 = +[NPUtilities stripWhitespace:v51];

      if ([v52 length])
      {
        uint64_t v53 = [objc_alloc(MEMORY[0x1E4F1CB10]) initWithString:v52];
        telemetryURL = v13->_telemetryURL;
        v13->_telemetryURL = (NSURL *)v53;
      }
    }
    else
    {
      v52 = v51;
    }
    v55 = -[NSDictionary objectForPlatformSpecificKey:](v45, @"tag");
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v56 = +[NPUtilities stripWhitespace:v55];

      if ([v56 length]) {
        objc_storeStrong((id *)&v13->_tag, v56);
      }
    }
    else
    {
      v56 = v55;
    }

    v18 = v47;
    v19 = v159;
    v30 = v46;
  }
  v57 = [v18 objectForKeyedSubscript:@"constraint"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v58 = -[NSDictionary objectForPlatformSpecificKey:](v57, @"LatencyDerivationEnabled");
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      objc_storeStrong((id *)&v13->_enableLatencyDerivation, v58);
    }
    v150 = v58;
    v59 = -[NSDictionary objectForPlatformSpecificKey:](v57, @"useGeoFromServer");
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      objc_storeStrong((id *)&v13->_useGeohashFromServer, v59);
    }
    v60 = -[NSDictionary objectForPlatformSpecificKey:](v57, @"EdgeFairnessFactor");
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && [v60 integerValue] >= 1) {
      objc_storeStrong((id *)&v13->_edgeFairnessFactor, v60);
    }
    v147 = v60;
    v61 = -[NSDictionary objectForPlatformSpecificKey:](v57, @"LatencyFactorX");
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v61 doubleValue];
      if (v62 > 0.0) {
        objc_storeStrong((id *)&v13->_latencyFactorX, v61);
      }
    }
    v144 = v61;
    v63 = -[NSDictionary objectForPlatformSpecificKey:](v57, @"LatencyFactorA");
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v63 doubleValue];
      if (v64 > 1.0) {
        objc_storeStrong((id *)&v13->_latencyFactorA, v63);
      }
    }
    v148 = v59;
    v139 = v63;
    v65 = -[NSDictionary objectForPlatformSpecificKey:](v57, @"LatencyFactorB");
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v65 doubleValue];
      if (v66 > 1.0) {
        objc_storeStrong((id *)&v13->_latencyFactorB, v65);
      }
    }
    v138 = v65;
    v67 = -[NSDictionary objectForPlatformSpecificKey:](v57, @"LocationCheckInterval");
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v67 doubleValue];
      if (v68 >= 0.0) {
        objc_storeStrong((id *)&v13->_locationCheckInterval, v67);
      }
    }
    v137 = v67;
    v69 = -[NSDictionary objectForPlatformSpecificKey:](v57, @"LocationToleranceDistance");
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && ([v69 integerValue] & 0x8000000000000000) == 0) {
      objc_storeStrong((id *)&v13->_locationToleranceDistance, v69);
    }
    v70 = -[NSDictionary objectForPlatformSpecificKey:](v57, @"LocationTTL");
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v70 doubleValue];
      if (v71 >= 0.0) {
        objc_storeStrong((id *)&v13->_locationTTL, v70);
      }
    }
    v135 = v70;
    v72 = -[NSDictionary objectForPlatformSpecificKey:](v57, @"ProbePause");
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v72 doubleValue];
      if (v73 >= 0.0) {
        objc_storeStrong((id *)&v13->_probePause, v72);
      }
    }
    v134 = v72;
    v74 = -[NSDictionary objectForPlatformSpecificKey:](v57, @"ProbeTFO");
    objc_opt_class();
    obj = v74;
    if (objc_opt_isKindOfClass()) {
      objc_storeStrong((id *)&v13->_probeTFO, v74);
    }
    v75 = -[NSDictionary objectForPlatformSpecificKey:](v57, @"ProbeNoTFOCookie");
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      objc_storeStrong((id *)&v13->_probeNoTFOCookie, v75);
    }
    v76 = [(NSDictionary *)v57 objectForPlatformSpecificKey:@"ProbeTimeout"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v76 doubleValue];
      if (v77 >= 0.0) {
        objc_storeStrong((id *)&v13->_probeTimeout, v76);
      }
    }
    v132 = v76;
    v78 = -[NSDictionary objectForPlatformSpecificKey:](v57, @"ViewCount");
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && [v78 integerValue] >= 1) {
      objc_storeStrong((id *)&v13->_viewSize, v78);
    }
    v79 = [(NSDictionary *)v57 objectForPlatformSpecificKey:@"ConnectionIdleTimeoutMaximum"];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && [v79 integerValue] >= 1) {
      objc_storeStrong((id *)&v13->_connectionIdleTimeoutMaximum, v79);
    }
    v130 = v79;
    v80 = -[NSDictionary objectForPlatformSpecificKey:](v57, @"NetworkSignatureLimit");
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && [v80 integerValue] >= 1) {
      objc_storeStrong((id *)&v13->_signatureLimit, v80);
    }
    v155 = v18;
    v81 = -[NSDictionary objectForPlatformSpecificKey:](v57, @"ObservedRTTSampleSize");
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && [v81 integerValue] >= 1) {
      objc_storeStrong((id *)&v13->_observedRTTSampleSize, v81);
    }
    v128 = v81;
    v136 = v69;
    v82 = -[NSDictionary objectForPlatformSpecificKey:](v57, @"ReprocessSamplingInterval");
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v82 doubleValue];
      if (v83 > 0.0) {
        objc_storeStrong((id *)&v13->_reprocessSamplingInterval, v82);
      }
    }
    v131 = v78;
    v84 = -[NSDictionary objectForPlatformSpecificKey:](v57, @"ReprocessSampleSize");
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && [v84 integerValue] >= 1) {
      objc_storeStrong((id *)&v13->_reprocessSampleSize, v84);
    }
    id v161 = v30;
    v85 = -[NSDictionary objectForPlatformSpecificKey:](v57, @"EdgeSelectionEnabled");
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      objc_storeStrong((id *)&v13->_edgeSelectionEnabled, v85);
    }
    v129 = v80;
    v86 = -[NSDictionary objectForPlatformSpecificKey:](v57, @"EdgeSelectionAlpha");
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && [v86 integerValue] >= 1) {
      objc_storeStrong((id *)&v13->_edgeSelectionAlpha, v86);
    }
    v133 = v75;
    v87 = -[NSDictionary objectForPlatformSpecificKey:](v57, @"EdgeSelectionWindowSize");
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && [v87 integerValue] >= 1) {
      objc_storeStrong((id *)&v13->_edgeSelectionWindowSize, v87);
    }
    v152 = v45;
    v88 = -[NSDictionary objectForPlatformSpecificKey:](v57, @"EnableIPv6");
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      objc_storeStrong((id *)&v13->_enableIPv6, v88);
    }
    v89 = -[NSDictionary objectForPlatformSpecificKey:](v57, @"TFOLeeway");
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v89 doubleValue];
      if (v90 >= 0.0)
      {
        [v89 doubleValue];
        if (v91 <= 1.0) {
          objc_storeStrong((id *)&v13->_TFOLeeway, v89);
        }
      }
    }

    v45 = v152;
    v18 = v155;
    v19 = v159;
    v30 = v161;
  }

  id v12 = v158;
LABEL_139:
  v50 = [v12 objectForKeyedSubscript:@"where"];
  objc_opt_class();
  unint64_t v92 = 0x1E5A3A000;
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_205;
  }
  v156 = v18;
  v93 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v50, "count"));
  long long v166 = 0u;
  long long v167 = 0u;
  long long v168 = 0u;
  long long v169 = 0u;
  id v162 = v50;
  uint64_t v94 = [v162 countByEnumeratingWithState:&v166 objects:v180 count:16];
  if (!v94) {
    goto LABEL_202;
  }
  uint64_t v95 = v94;
  uint64_t obja = *(void *)v167;
  v160 = v50;
  v153 = v93;
  do
  {
    uint64_t v96 = 0;
    do
    {
      if (*(void *)v167 != obja) {
        objc_enumerationMutation(v162);
      }
      v97 = *(void **)(*((void *)&v166 + 1) + 8 * v96);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v126 = nplog_obj();
        if (os_log_type_enabled(v126, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          id v175 = v165;
          _os_log_error_impl(&dword_1A0FEE000, v126, OS_LOG_TYPE_ERROR, "%@: Edge specification is not a dictionary", buf, 0xCu);
        }

LABEL_209:
        v50 = v162;

        v25 = 0;
        id v11 = v157;
        id v12 = v158;
        v18 = v156;
        goto LABEL_210;
      }
      v98 = [v97 objectForKeyedSubscript:@"label"];
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v103 = nplog_obj();
        if (os_log_type_enabled(v103, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          id v175 = v165;
          _os_log_error_impl(&dword_1A0FEE000, v103, OS_LOG_TYPE_ERROR, "%@: Label is not a string", buf, 0xCu);
        }
        v101 = 0;
        v104 = 0;
        int v102 = 1;
        v99 = v98;
        goto LABEL_168;
      }
      v99 = +[NPUtilities stripWhitespace:v98];

      v100 = [v97 objectForKeyedSubscript:@"probe"];
      if (v100)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v103 = nplog_obj();
          if (os_log_type_enabled(v103, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            id v175 = v165;
            _os_log_error_impl(&dword_1A0FEE000, v103, OS_LOG_TYPE_ERROR, "%@: Probe hosts is not an array", buf, 0xCu);
          }
          v101 = 0;
          int v102 = 1;
          v104 = v100;
          goto LABEL_168;
        }
      }
      if ([v100 count])
      {
        v101 = +[NPWaldo createEndpointFromHostList:v100 defaultPortString:@"5223" allowIPv6:[(NSNumber *)v13->_enableIPv6 BOOLValue]];
        if (!v101)
        {
          int v102 = 1;
          goto LABEL_170;
        }
      }
      else
      {
        v101 = 0;
      }
      v104 = [v97 objectForKeyedSubscript:@"hosts"];

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0 || ![v104 count])
      {
        v103 = nplog_obj();
        if (os_log_type_enabled(v103, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          id v175 = v165;
          _os_log_error_impl(&dword_1A0FEE000, v103, OS_LOG_TYPE_ERROR, "%@: Edge onramp list is not a non-empty array", buf, 0xCu);
        }
        goto LABEL_167;
      }
      uint64_t v105 = +[NPWaldo createEndpointFromHostList:v104 defaultPortString:@"443" allowIPv6:[(NSNumber *)v13->_enableIPv6 BOOLValue]];
      if (!v105)
      {
        int v102 = 1;
        goto LABEL_169;
      }
      v103 = v105;
      uint64_t v106 = objc_opt_class();
      if (v106 == objc_opt_class())
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
        {
LABEL_181:
          v111 = [v97 objectForKeyedSubscript:@"where"];
          if (v111)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0 && [v111 count] == 2)
            {
              v112 = [v111 objectAtIndexedSubscript:0];
              v146 = v111;
              v113 = [v111 objectAtIndexedSubscript:1];
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  v141 = [NPLocation alloc];
                  [v112 doubleValue];
                  double v115 = v114;
                  [v113 doubleValue];
                  uint64_t v142 = [(NPLocation *)v141 initWithLatitude:0 longtitude:v115 timestamp:v116];

                  v117 = v142;
                  goto LABEL_191;
                }
              }
              v143 = v112;
              v121 = v113;
              v122 = nplog_obj();
              if (os_log_type_enabled(v122, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412802;
                id v175 = v165;
                __int16 v176 = 2112;
                v177 = v143;
                __int16 v178 = 2112;
                v179 = v121;
                _os_log_error_impl(&dword_1A0FEE000, v122, OS_LOG_TYPE_ERROR, "%@: Invalid edge latitude %@, longtitude %@", buf, 0x20u);
              }

              v119 = v143;
              int v102 = 1;
LABEL_195:
              v111 = v146;
            }
            else
            {
              v118 = nplog_obj();
              if (os_log_type_enabled(v118, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412546;
                id v175 = v165;
                __int16 v176 = 2112;
                v177 = v111;
                _os_log_error_impl(&dword_1A0FEE000, v118, OS_LOG_TYPE_ERROR, "%@: Missing edge latitude / longtitude: %@", buf, 0x16u);
              }
              v119 = v118;
              int v102 = 1;
            }

            goto LABEL_168;
          }
          v146 = 0;
          v117 = 0;
LABEL_191:
          v120 = -[NPTuscanyEdge initWithLabel:index:onRampEndpoint:probeEndpoint:location:]([NPTuscanyEdge alloc], "initWithLabel:index:onRampEndpoint:probeEndpoint:location:", v99, [v153 count], v103, v101, v117);
          [(NPTuscanyEdge *)v120 setParentWaldo:v13];
          [v153 addObject:v120];

          v119 = v117;
          int v102 = 0;
          goto LABEL_195;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v145 = [v101 hostname];
          v108 = [v103 hostname];
          char v140 = [v145 isEqualToString:v108];

          if (v140) {
            goto LABEL_181;
          }
          v107 = nplog_obj();
          if (!os_log_type_enabled(v107, OS_LOG_TYPE_ERROR)) {
            goto LABEL_164;
          }
          *(_DWORD *)buf = 138412802;
          id v175 = v165;
          __int16 v176 = 2112;
          v177 = v101;
          __int16 v178 = 2112;
          v179 = v103;
          v109 = v107;
          v110 = "%@: Probe endpoint (%@) is a hostname and does not match the onramp endpoint (%@)";
        }
        else
        {
          if ([v101 isEqual:v103]) {
            goto LABEL_181;
          }
          v107 = nplog_obj();
          if (!os_log_type_enabled(v107, OS_LOG_TYPE_ERROR)) {
            goto LABEL_164;
          }
          *(_DWORD *)buf = 138412802;
          id v175 = v165;
          __int16 v176 = 2112;
          v177 = v101;
          __int16 v178 = 2112;
          v179 = v103;
          v109 = v107;
          v110 = "%@: Probe endpoint (%@) does not equal onramp endpoint (%@)";
        }
        goto LABEL_198;
      }
      v107 = nplog_obj();
      if (os_log_type_enabled(v107, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412802;
        id v175 = v165;
        __int16 v176 = 2112;
        v177 = v101;
        __int16 v178 = 2112;
        v179 = v103;
        v109 = v107;
        v110 = "%@: Probe endpoint (%@) and onRampEndpoint (%@) types do not match";
LABEL_198:
        _os_log_error_impl(&dword_1A0FEE000, v109, OS_LOG_TYPE_ERROR, v110, buf, 0x20u);
      }
LABEL_164:

LABEL_167:
      int v102 = 1;
LABEL_168:

LABEL_169:
      v100 = v104;
LABEL_170:

      if (v102) {
        goto LABEL_209;
      }
      ++v96;
    }
    while (v95 != v96);
    uint64_t v123 = [v162 countByEnumeratingWithState:&v166 objects:v180 count:16];
    uint64_t v95 = v123;
    v50 = v160;
    v93 = v153;
    unint64_t v92 = 0x1E5A3A000uLL;
  }
  while (v123);
LABEL_202:

  if ([v93 count]) {
    objc_storeStrong((id *)&v13->_edges, v93);
  }

  v18 = v156;
LABEL_205:
  uint64_t v124 = [*(id *)(v92 + 2928) getHashForObject:v13];
  updateHash = v13->_updateHash;
  v13->_updateHash = (NSData *)v124;

  v25 = v13;
  id v11 = v157;
  id v12 = v158;
LABEL_210:

LABEL_211:
  return v25;
}

+ (id)createEndpointFromHostList:(id)a3 defaultPortString:(id)a4 allowIPv6:(BOOL)a5
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v26 objects:v32 count:16];
  if (!v9)
  {

    id v11 = 0;
    goto LABEL_24;
  }
  uint64_t v10 = v9;
  id v11 = 0;
  id v12 = 0;
  uint64_t v13 = *(void *)v27;
  id obj = v8;
  while (2)
  {
    for (uint64_t i = 0; i != v10; ++i)
    {
      if (*(void *)v27 != v13) {
        objc_enumerationMutation(obj);
      }
      uint64_t v15 = *(void *)(*((void *)&v26 + 1) + 8 * i);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v17 = nplog_obj();
        if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
          goto LABEL_36;
        }
        *(_WORD *)buf = 0;
        v19 = "host is not a string";
        v20 = v17;
        uint32_t v21 = 2;
LABEL_30:
        _os_log_error_impl(&dword_1A0FEE000, v20, OS_LOG_TYPE_ERROR, v19, buf, v21);
        goto LABEL_36;
      }
      uint64_t v16 = +[NPUtilities endpointFromString:v15 defaultPortString:v7];
      if (!v16)
      {
        v17 = nplog_obj();
        if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
          goto LABEL_36;
        }
        *(_DWORD *)buf = 138412290;
        uint64_t v31 = v15;
        v19 = "Failed to create an endpoint from string: %@";
        v20 = v17;
        uint32_t v21 = 12;
        goto LABEL_30;
      }
      v17 = v16;
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        if (v12)
        {
          v22 = nplog_obj();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
LABEL_42:
            _os_log_error_impl(&dword_1A0FEE000, v22, OS_LOG_TYPE_ERROR, "A hostname endpoint was specified and it is not the only endpoint", buf, 2u);
          }
          goto LABEL_35;
        }
        if (a5 || [v17 addressFamily] != 30)
        {
          if (!v11) {
            id v11 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
          }
          [v11 addObject:v17];
        }
        id v12 = 0;
      }
      else
      {
        if (v12 || [v11 count])
        {
          v22 = nplog_obj();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            goto LABEL_42;
          }
LABEL_35:

LABEL_36:
          id v8 = obj;

          goto LABEL_37;
        }
        id v12 = v17;
      }
    }
    id v8 = obj;
    uint64_t v10 = [obj countByEnumeratingWithState:&v26 objects:v32 count:16];
    if (v10) {
      continue;
    }
    break;
  }

  if (v12)
  {
    id v12 = v12;
    v18 = v12;
    goto LABEL_38;
  }
LABEL_24:
  if ([v11 count])
  {
    v18 = [[NPTunnelTuscanyEndpoint alloc] initWithHosts:v11];
    id v12 = 0;
  }
  else
  {
    id v12 = 0;
LABEL_37:
    v18 = 0;
  }
LABEL_38:

  return v18;
}

- (void)resolveWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x2020000000;
  char v23 = 0;
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__734;
  v20 = __Block_byref_object_dispose__735;
  id v21 = 0;
  v14[0] = 0;
  v14[1] = v14;
  v14[2] = 0x3032000000;
  v14[3] = __Block_byref_object_copy__4;
  v14[4] = __Block_byref_object_dispose__4;
  id v15 = (id)os_transaction_create();
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __40__NPWaldo_resolveWithCompletionHandler___block_invoke;
  v9[3] = &unk_1E5A3C138;
  v9[4] = self;
  id v5 = v4;
  id v10 = v5;
  id v11 = v22;
  id v12 = v14;
  uint64_t v13 = &v16;
  id v6 = (void *)MEMORY[0x1A622B750](v9);
  uint64_t v7 = MEMORY[0x1A622B750]();
  id v8 = (void *)v17[5];
  v17[5] = v7;

  (*(void (**)(void))(v17[5] + 16))();
  _Block_object_dispose(v14, 8);

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(v22, 8);
}

void __40__NPWaldo_resolveWithCompletionHandler___block_invoke(uint64_t a1, uint64_t a2, int a3)
{
  id v6 = [*(id *)(a1 + 32) edges];
  uint64_t v7 = [v6 count];

  id v8 = *(void **)(a1 + 32);
  if (v7 != a2)
  {
    id v11 = [v8 edges];
    id v12 = [v11 objectAtIndexedSubscript:a2];

    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __40__NPWaldo_resolveWithCompletionHandler___block_invoke_2;
    v19[3] = &unk_1E5A3C110;
    uint64_t v13 = *(void *)(a1 + 48);
    v19[4] = *(void *)(a1 + 32);
    v19[5] = v13;
    v19[6] = *(void *)(a1 + 64);
    v19[7] = a2;
    [v12 resolveWithCompletionHandler:v19];

    return;
  }
  uint64_t v9 = [v8 currentNetworkInfo];
  id v18 = v9;
  if (!a3)
  {
    uint64_t v10 = 28;
    goto LABEL_7;
  }
  if ([v9 lastFallbackReason] == 28)
  {
    uint64_t v10 = 0;
    uint64_t v9 = v18;
LABEL_7:
    [v9 setLastFallbackReason:v10];
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  uint64_t v14 = *(void *)(*(void *)(a1 + 56) + 8);
  id v15 = *(void **)(v14 + 40);
  *(void *)(v14 + 40) = 0;

  uint64_t v16 = *(void *)(*(void *)(a1 + 64) + 8);
  v17 = *(void **)(v16 + 40);
  *(void *)(v16 + 40) = 0;
}

uint64_t __40__NPWaldo_resolveWithCompletionHandler___block_invoke_2(uint64_t a1, char a2, int a3)
{
  if ((a2 & 1) == 0)
  {
    id v5 = [*(id *)(a1 + 32) edges];
    [v5 count];

    if (!a3) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  if (a3) {
LABEL_5:
  }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
LABEL_6:
  id v6 = *(uint64_t (**)(void))(*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) + 16);
  return v6();
}

- (void)setReResolve:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    id v5 = nplog_obj();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A0FEE000, v5, OS_LOG_TYPE_DEFAULT, "Re-resolving edge hostnames", buf, 2u);
    }
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v6 = [(NPWaldo *)self edges];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        [*(id *)(*((void *)&v11 + 1) + 8 * v10++) setReResolve:v3];
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v16 count:16];
    }
    while (v8);
  }
}

- (BOOL)reResolve
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v2 = [(NPWaldo *)self edges];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v8;
    while (2)
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v8 != v4) {
          objc_enumerationMutation(v2);
        }
        if ([*(id *)(*((void *)&v7 + 1) + 8 * i) reResolve])
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v3;
}

- (void)linkLatenciesAllSignatures:(BOOL)a3
{
  uint64_t v3 = self;
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    uint64_t v4 = [(NPWaldo *)self networkInformation];
    uint64_t v5 = [v4 allKeys];
LABEL_5:
    id v6 = (void *)v5;
    goto LABEL_6;
  }
  uint64_t v4 = [(NSDictionary *)self->_currentNetworkCharacteristics objectForKeyedSubscript:@"Signature"];
  if (v4)
  {
    uint64_t v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C978]), "initWithObjects:", v4, 0);
    goto LABEL_5;
  }
  id v6 = 0;
LABEL_6:

  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id obj = v6;
  uint64_t v26 = [obj countByEnumeratingWithState:&v43 objects:v49 count:16];
  if (v26)
  {
    uint64_t v25 = *(void *)v44;
    v30 = v3;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v44 != v25) {
          objc_enumerationMutation(obj);
        }
        uint64_t v28 = v7;
        uint64_t v8 = *(void *)(*((void *)&v43 + 1) + 8 * v7);
        long long v9 = [(NPWaldo *)v3 networkInformation];
        long long v10 = [v9 objectForKeyedSubscript:v8];

        long long v41 = 0u;
        long long v42 = 0u;
        long long v39 = 0u;
        long long v40 = 0u;
        long long v27 = v10;
        id v29 = [v10 edgeLatencies];
        uint64_t v32 = [v29 countByEnumeratingWithState:&v39 objects:v48 count:16];
        if (v32)
        {
          uint64_t v31 = *(void *)v40;
          do
          {
            uint64_t v11 = 0;
            do
            {
              if (*(void *)v40 != v31) {
                objc_enumerationMutation(v29);
              }
              uint64_t v33 = v11;
              uint64_t v12 = *(void **)(*((void *)&v39 + 1) + 8 * v11);
              [v12 setEdgeIndex:0xFFFFFFFFLL];
              long long v37 = 0u;
              long long v38 = 0u;
              long long v35 = 0u;
              long long v36 = 0u;
              id v34 = [(NPWaldo *)v3 edges];
              uint64_t v13 = [v34 countByEnumeratingWithState:&v35 objects:v47 count:16];
              if (v13)
              {
                uint64_t v14 = v13;
                uint64_t v15 = *(void *)v36;
                do
                {
                  for (uint64_t i = 0; i != v14; ++i)
                  {
                    if (*(void *)v36 != v15) {
                      objc_enumerationMutation(v34);
                    }
                    uint64_t v17 = *(void **)(*((void *)&v35 + 1) + 8 * i);
                    id v18 = [v17 probeEndpoint];
                    objc_opt_class();
                    char isKindOfClass = objc_opt_isKindOfClass();

                    if (isKindOfClass)
                    {
                      v20 = [v17 probeEndpoint];
                      id v21 = [v20 hosts];
                      v22 = [v12 probeEndpoint];
                      int v23 = [v21 containsObject:v22];

                      if (v23) {
                        objc_msgSend(v12, "setEdgeIndex:", objc_msgSend(v17, "index"));
                      }
                    }
                  }
                  uint64_t v14 = [v34 countByEnumeratingWithState:&v35 objects:v47 count:16];
                }
                while (v14);
              }

              uint64_t v11 = v33 + 1;
              uint64_t v3 = v30;
            }
            while (v33 + 1 != v32);
            uint64_t v32 = [v29 countByEnumeratingWithState:&v39 objects:v48 count:16];
          }
          while (v32);
        }

        uint64_t v7 = v28 + 1;
      }
      while (v28 + 1 != v26);
      uint64_t v26 = [obj countByEnumeratingWithState:&v43 objects:v49 count:16];
    }
    while (v26);
  }

  [(NPWaldo *)v3 rebuildLatencyMapAllSignatures:1];
}

- (void)link
{
}

- (void)linkAllSignatures:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  -[NPWaldo linkLatenciesAllSignatures:](self, "linkLatenciesAllSignatures:");
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v5 = [(NPWaldo *)self edges];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    BOOL v9 = !v3;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v12 + 1) + 8 * i) linkWithOnRampsRetainMissingAddressFamilies:v9];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  int64_t v11 = [(NPWaldo *)self indexOfBestEdge];
  if (v11 != 0x7FFFFFFFFFFFFFFFLL) {
    [(NPWaldo *)self setCurrentEdgeIndex:v11];
  }
}

- (NPWaldo)initWithCoder:(id)a3
{
  uint64_t v131 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(NPWaldo *)self init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Identifier"];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"timestamp"];
    timestamp = v5->_timestamp;
    v5->_timestamp = (NSNumber *)v8;

    v5->_source = [v4 decodeIntegerForKey:@"source"];
    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"waldoHostname"];
    hostname = v5->_hostname;
    v5->_hostname = (NSString *)v10;

    long long v12 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v13 = objc_opt_class();
    long long v14 = objc_msgSend(v12, "setWithObjects:", v13, objc_opt_class(), 0);
    long long v15 = [v4 decodeObjectOfClasses:v14 forKey:@"EdgeList"];
    [(NPWaldo *)v5 setEdges:v15];

    v5->_currentEdgeIndex = [v4 decodeIntegerForKey:@"CurrentEdgeIndex"];
    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"retryPause"];
    retryPause = v5->_retryPause;
    v5->_retryPause = (NSNumber *)v16;

    id v18 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v19 = objc_opt_class();
    uint64_t v20 = objc_opt_class();
    uint64_t v21 = objc_opt_class();
    v22 = objc_msgSend(v18, "setWithObjects:", v19, v20, v21, objc_opt_class(), 0);
    uint64_t v23 = [v4 decodeObjectOfClasses:v22 forKey:@"NetworkInformation"];
    networkInformation = v5->_networkInformation;
    v5->_networkInformation = (NSMutableDictionary *)v23;

    long long v128 = 0u;
    long long v129 = 0u;
    long long v126 = 0u;
    long long v127 = 0u;
    uint64_t v25 = v5->_networkInformation;
    uint64_t v26 = [(NSMutableDictionary *)v25 countByEnumeratingWithState:&v126 objects:v130 count:16];
    if (v26)
    {
      uint64_t v27 = v26;
      uint64_t v28 = *(void *)v127;
      do
      {
        uint64_t v29 = 0;
        do
        {
          if (*(void *)v127 != v28) {
            objc_enumerationMutation(v25);
          }
          v30 = [(NSMutableDictionary *)v5->_networkInformation objectForKeyedSubscript:*(void *)(*((void *)&v126 + 1) + 8 * v29)];
          uint64_t v31 = v30;
          if (v30)
          {
            uint64_t v32 = [v30 edgeSelection];

            if (v32)
            {
              uint64_t v33 = [v31 edgeSelection];
              [v33 setWaldoInfo:v5];
            }
          }

          ++v29;
        }
        while (v27 != v29);
        uint64_t v27 = [(NSMutableDictionary *)v25 countByEnumeratingWithState:&v126 objects:v130 count:16];
      }
      while (v27);
    }

    uint64_t v34 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"request-timeout"];
    dayPassRequestTimeout = v5->_dayPassRequestTimeout;
    v5->_dayPassRequestTimeout = (NSNumber *)v34;

    long long v36 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v37 = objc_opt_class();
    long long v38 = objc_msgSend(v36, "setWithObjects:", v37, objc_opt_class(), 0);
    uint64_t v39 = [v4 decodeObjectOfClasses:v38 forKey:@"DayPassExpiry"];
    dayPassSoftExpiry = v5->_dayPassSoftExpiry;
    v5->_dayPassSoftExpiry = (NSArray *)v39;

    uint64_t v41 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"EnableLatencyDerivation"];
    enableLatencyDerivation = v5->_enableLatencyDerivation;
    v5->_enableLatencyDerivation = (NSNumber *)v41;

    uint64_t v43 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"LatencyFactorX"];
    latencyFactorX = v5->_latencyFactorX;
    v5->_latencyFactorX = (NSNumber *)v43;

    uint64_t v45 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"LatencyFactorA"];
    latencyFactorA = v5->_latencyFactorA;
    v5->_latencyFactorA = (NSNumber *)v45;

    uint64_t v47 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"LatencyFactorB"];
    latencyFactorB = v5->_latencyFactorB;
    v5->_latencyFactorB = (NSNumber *)v47;

    uint64_t v49 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"EdgeFairnessFactor"];
    edgeFairnessFactor = v5->_edgeFairnessFactor;
    v5->_edgeFairnessFactor = (NSNumber *)v49;

    v5->_generation = [v4 decodeInt32ForKey:@"Generation"];
    uint64_t v51 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ObservedRTTSampleSizeKey"];
    observedRTTSampleSize = v5->_observedRTTSampleSize;
    v5->_observedRTTSampleSize = (NSNumber *)v51;

    uint64_t v53 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"NetworkSignatureLimit"];
    signatureLimit = v5->_signatureLimit;
    v5->_signatureLimit = (NSNumber *)v53;

    uint64_t v55 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ReprocessSamplingIntervalKey"];
    reprocessSamplingInterval = v5->_reprocessSamplingInterval;
    v5->_reprocessSamplingInterval = (NSNumber *)v55;

    uint64_t v57 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ReprocessSampleSizeKey"];
    reprocessSampleSize = v5->_reprocessSampleSize;
    v5->_reprocessSampleSize = (NSNumber *)v57;

    uint64_t v59 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ViewSize"];
    viewSize = v5->_viewSize;
    v5->_viewSize = (NSNumber *)v59;

    uint64_t v61 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ConnectionIdleTimeoutMaximum"];
    connectionIdleTimeoutMaximum = v5->_connectionIdleTimeoutMaximum;
    v5->_connectionIdleTimeoutMaximum = (NSNumber *)v61;

    uint64_t v63 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"LocationCheckInterval"];
    locationCheckInterval = v5->_locationCheckInterval;
    v5->_locationCheckInterval = (NSNumber *)v63;

    uint64_t v65 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"LocationToleranceDistance"];
    locationToleranceDistance = v5->_locationToleranceDistance;
    v5->_locationToleranceDistance = (NSNumber *)v65;

    uint64_t v67 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"LocationTTL"];
    locationTTL = v5->_locationTTL;
    v5->_locationTTL = (NSNumber *)v67;

    uint64_t v69 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ProbePause"];
    probePause = v5->_probePause;
    v5->_probePause = (NSNumber *)v69;

    uint64_t v71 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ProbeTFO"];
    probeTFO = v5->_probeTFO;
    v5->_probeTFO = (NSNumber *)v71;

    uint64_t v73 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ProbeNoTFOCookie"];
    probeNoTFOCookie = v5->_probeNoTFOCookie;
    v5->_probeNoTFOCookie = (NSNumber *)v73;

    uint64_t v75 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ProbeTimeout"];
    probeTimeout = v5->_probeTimeout;
    v5->_probeTimeout = (NSNumber *)v75;

    uint64_t v77 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"RequireTFO"];
    requireTFO = v5->_requireTFO;
    v5->_requireTFO = (NSNumber *)v77;

    uint64_t v79 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"CachedLocation"];
    cachedLocation = v5->_cachedLocation;
    v5->_cachedLocation = (NPLocation *)v79;

    uint64_t v81 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"LocationCheckTimestamp"];
    locationCheckTimestamp = v5->_locationCheckTimestamp;
    v5->_locationCheckTimestamp = (NSDate *)v81;

    uint64_t v83 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"DayPassHostname"];
    dayPassHostname = v5->_dayPassHostname;
    v5->_dayPassHostname = (NSString *)v83;

    uint64_t v85 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"host-prepend-label"];
    dayPassHostnamePrependLabel = v5->_dayPassHostnamePrependLabel;
    v5->_dayPassHostnamePrependLabel = (NSNumber *)v85;

    uint64_t v87 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"DayPassEV"];
    dayPassExtendedValidation = v5->_dayPassExtendedValidation;
    v5->_dayPassExtendedValidation = (NSNumber *)v87;

    uint64_t v89 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"session"];
    dayPassEnableSessionTicket = v5->_dayPassEnableSessionTicket;
    v5->_dayPassEnableSessionTicket = (NSNumber *)v89;

    uint64_t v91 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"leafOID"];
    dayPassLeafOID = v5->_dayPassLeafOID;
    v5->_dayPassLeafOID = (NSString *)v91;

    uint64_t v93 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"revocationFailClosed"];
    dayPassRevocationFailClosed = v5->_dayPassRevocationFailClosed;
    v5->_dayPassRevocationFailClosed = (NSNumber *)v93;

    uint64_t v95 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Tag"];
    tag = v5->_tag;
    v5->_tag = (NSString *)v95;

    uint64_t v97 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"TelemetryURL"];
    telemetryURL = v5->_telemetryURL;
    v5->_telemetryURL = (NSURL *)v97;

    uint64_t v99 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"TelemetryService"];
    telemetryService = v5->_telemetryService;
    v5->_telemetryService = (NSString *)v99;

    uint64_t v101 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"UseGeoFromServer"];
    useGeohashFromServer = v5->_useGeohashFromServer;
    v5->_useGeohashFromServer = (NSNumber *)v101;

    uint64_t v103 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"configID"];
    configurationIdentifier = v5->_configurationIdentifier;
    v5->_configurationIdentifier = (NSUUID *)v103;

    uint64_t v105 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"edgeSelectionEnabled"];
    edgeSelectionEnabled = v5->_edgeSelectionEnabled;
    v5->_edgeSelectionEnabled = (NSNumber *)v105;

    uint64_t v107 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"edgeSelectionAlpha"];
    edgeSelectionAlpha = v5->_edgeSelectionAlpha;
    v5->_edgeSelectionAlpha = (NSNumber *)v107;

    uint64_t v109 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"edgeSelectionWindowSize"];
    edgeSelectionWindowSize = v5->_edgeSelectionWindowSize;
    v5->_edgeSelectionWindowSize = (NSNumber *)v109;

    uint64_t v111 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"EnableIPv6"];
    enableIPuint64_t v6 = v5->_enableIPv6;
    v5->_enableIPuint64_t v6 = (NSNumber *)v111;

    uint64_t v113 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"TFOLeeway"];
    TFOLeeway = v5->_TFOLeeway;
    v5->_TFOLeeway = (NSNumber *)v113;

    double v115 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v116 = objc_opt_class();
    v117 = objc_msgSend(v115, "setWithObjects:", v116, objc_opt_class(), 0);
    v118 = [v4 decodeObjectOfClasses:v117 forKey:@"allOnRamps"];
    [(NPWaldo *)v5 setAllOnRamps:v118];

    uint64_t v119 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"edgesGeneration"];
    edgesGeneration = v5->_edgesGeneration;
    v5->_edgesGeneration = (NSNumber *)v119;

    uint64_t v121 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"usedEdgesGeneration"];
    usedEdgesGeneration = v5->_usedEdgesGeneration;
    v5->_usedEdgesGeneration = (NSNumber *)v121;

    uint64_t v123 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"waldoUpdateHash"];
    updateHash = v5->_updateHash;
    v5->_updateHash = (NSData *)v123;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v201 = a3;
  id v4 = [(NPWaldo *)self identifier];
  [v201 encodeObject:v4 forKey:@"Identifier"];

  uint64_t v5 = [(NPWaldo *)self timestamp];
  [v201 encodeObject:v5 forKey:@"timestamp"];

  objc_msgSend(v201, "encodeInteger:forKey:", -[NPWaldo source](self, "source"), @"source");
  uint64_t v6 = [(NPWaldo *)self hostname];
  [v201 encodeObject:v6 forKey:@"waldoHostname"];

  uint64_t v7 = [(NPWaldo *)self edges];
  [v201 encodeObject:v7 forKey:@"EdgeList"];

  objc_msgSend(v201, "encodeInteger:forKey:", -[NPWaldo currentEdgeIndex](self, "currentEdgeIndex"), @"CurrentEdgeIndex");
  uint64_t v8 = [(NPWaldo *)self retryPause];
  BOOL v9 = [(NPWaldo *)self defaults];
  uint64_t v10 = [v9 retryPause];
  char IsEqual = myIsEqual(v8, v10);

  if ((IsEqual & 1) == 0)
  {
    long long v12 = [(NPWaldo *)self retryPause];
    [v201 encodeObject:v12 forKey:@"retryPause"];
  }
  uint64_t v13 = [(NPWaldo *)self probePause];
  long long v14 = [(NPWaldo *)self defaults];
  long long v15 = [v14 probePause];
  char v16 = myIsEqual(v13, v15);

  if ((v16 & 1) == 0)
  {
    uint64_t v17 = [(NPWaldo *)self probePause];
    [v201 encodeObject:v17 forKey:@"ProbePause"];
  }
  id v18 = [(NPWaldo *)self requireTFO];
  uint64_t v19 = [(NPWaldo *)self defaults];
  uint64_t v20 = [v19 requireTFO];
  char v21 = myIsEqual(v18, v20);

  if ((v21 & 1) == 0)
  {
    v22 = [(NPWaldo *)self requireTFO];
    [v201 encodeObject:v22 forKey:@"RequireTFO"];
  }
  uint64_t v23 = [(NPWaldo *)self probeTFO];
  v24 = [(NPWaldo *)self defaults];
  uint64_t v25 = [v24 probeTFO];
  char v26 = myIsEqual(v23, v25);

  if ((v26 & 1) == 0)
  {
    uint64_t v27 = [(NPWaldo *)self probeTFO];
    [v201 encodeObject:v27 forKey:@"ProbeTFO"];
  }
  uint64_t v28 = [(NPWaldo *)self probeNoTFOCookie];
  uint64_t v29 = [(NPWaldo *)self defaults];
  v30 = [v29 probeNoTFOCookie];
  char v31 = myIsEqual(v28, v30);

  if ((v31 & 1) == 0)
  {
    uint64_t v32 = [(NPWaldo *)self probeTFO];
    [v201 encodeObject:v32 forKey:@"ProbeNoTFOCookie"];
  }
  uint64_t v33 = [(NPWaldo *)self probeTimeout];
  uint64_t v34 = [(NPWaldo *)self defaults];
  long long v35 = [v34 probeTimeout];
  char v36 = myIsEqual(v33, v35);

  if ((v36 & 1) == 0)
  {
    uint64_t v37 = [(NPWaldo *)self probeTimeout];
    [v201 encodeObject:v37 forKey:@"ProbeTimeout"];
  }
  long long v38 = [(NPWaldo *)self networkInformation];
  [v201 encodeObject:v38 forKey:@"NetworkInformation"];

  uint64_t v39 = [(NPWaldo *)self dayPassSoftExpiry];
  long long v40 = [(NPWaldo *)self defaults];
  uint64_t v41 = [v40 dayPassSoftExpiry];
  char v42 = myIsEqual(v39, v41);

  if ((v42 & 1) == 0)
  {
    uint64_t v43 = [(NPWaldo *)self dayPassSoftExpiry];
    [v201 encodeObject:v43 forKey:@"DayPassExpiry"];
  }
  long long v44 = [(NPWaldo *)self dayPassRequestTimeout];
  uint64_t v45 = [(NPWaldo *)self defaults];
  long long v46 = [v45 dayPassRequestTimeout];
  char v47 = myIsEqual(v44, v46);

  if ((v47 & 1) == 0)
  {
    v48 = [(NPWaldo *)self dayPassRequestTimeout];
    [v201 encodeObject:v48 forKey:@"request-timeout"];
  }
  uint64_t v49 = [(NPWaldo *)self enableLatencyDerivation];
  uint64_t v50 = [(NPWaldo *)self defaults];
  uint64_t v51 = [v50 enableLatencyDerivation];
  char v52 = myIsEqual(v49, v51);

  if ((v52 & 1) == 0)
  {
    uint64_t v53 = [(NPWaldo *)self enableLatencyDerivation];
    [v201 encodeObject:v53 forKey:@"EnableLatencyDerivation"];
  }
  v54 = [(NPWaldo *)self latencyFactorX];
  uint64_t v55 = [(NPWaldo *)self defaults];
  v56 = [v55 latencyFactorX];
  char v57 = myIsEqual(v54, v56);

  if ((v57 & 1) == 0)
  {
    v58 = [(NPWaldo *)self latencyFactorX];
    [v201 encodeObject:v58 forKey:@"LatencyFactorX"];
  }
  uint64_t v59 = [(NPWaldo *)self latencyFactorA];
  v60 = [(NPWaldo *)self defaults];
  uint64_t v61 = [v60 latencyFactorA];
  char v62 = myIsEqual(v59, v61);

  if ((v62 & 1) == 0)
  {
    uint64_t v63 = [(NPWaldo *)self latencyFactorA];
    [v201 encodeObject:v63 forKey:@"LatencyFactorA"];
  }
  double v64 = [(NPWaldo *)self latencyFactorB];
  uint64_t v65 = [(NPWaldo *)self defaults];
  double v66 = [v65 latencyFactorB];
  char v67 = myIsEqual(v64, v66);

  if ((v67 & 1) == 0)
  {
    double v68 = [(NPWaldo *)self latencyFactorB];
    [v201 encodeObject:v68 forKey:@"LatencyFactorB"];
  }
  uint64_t v69 = [(NPWaldo *)self edgeFairnessFactor];
  v70 = [(NPWaldo *)self defaults];
  uint64_t v71 = [v70 edgeFairnessFactor];
  char v72 = myIsEqual(v69, v71);

  if ((v72 & 1) == 0)
  {
    uint64_t v73 = [(NPWaldo *)self edgeFairnessFactor];
    [v201 encodeObject:v73 forKey:@"EdgeFairnessFactor"];
  }
  objc_msgSend(v201, "encodeInt32:forKey:", -[NPWaldo generation](self, "generation"), @"Generation");
  v74 = [(NPWaldo *)self observedRTTSampleSize];
  uint64_t v75 = [(NPWaldo *)self defaults];
  v76 = [v75 observedRTTSampleSize];
  char v77 = myIsEqual(v74, v76);

  if ((v77 & 1) == 0)
  {
    v78 = [(NPWaldo *)self observedRTTSampleSize];
    [v201 encodeObject:v78 forKey:@"ObservedRTTSampleSizeKey"];
  }
  uint64_t v79 = [(NPWaldo *)self signatureLimit];
  v80 = [(NPWaldo *)self defaults];
  uint64_t v81 = [v80 signatureLimit];
  char v82 = myIsEqual(v79, v81);

  if ((v82 & 1) == 0)
  {
    uint64_t v83 = [(NPWaldo *)self signatureLimit];
    [v201 encodeObject:v83 forKey:@"NetworkSignatureLimit"];
  }
  v84 = [(NPWaldo *)self reprocessSamplingInterval];
  uint64_t v85 = [(NPWaldo *)self defaults];
  v86 = [v85 reprocessSamplingInterval];
  char v87 = myIsEqual(v84, v86);

  if ((v87 & 1) == 0)
  {
    v88 = [(NPWaldo *)self reprocessSamplingInterval];
    [v201 encodeObject:v88 forKey:@"ReprocessSamplingIntervalKey"];
  }
  uint64_t v89 = [(NPWaldo *)self reprocessSampleSize];
  double v90 = [(NPWaldo *)self defaults];
  uint64_t v91 = [v90 reprocessSampleSize];
  char v92 = myIsEqual(v89, v91);

  if ((v92 & 1) == 0)
  {
    uint64_t v93 = [(NPWaldo *)self reprocessSampleSize];
    [v201 encodeObject:v93 forKey:@"ReprocessSampleSizeKey"];
  }
  uint64_t v94 = [(NPWaldo *)self viewSize];
  uint64_t v95 = [(NPWaldo *)self defaults];
  uint64_t v96 = [v95 viewSize];
  char v97 = myIsEqual(v94, v96);

  if ((v97 & 1) == 0)
  {
    v98 = [(NPWaldo *)self viewSize];
    [v201 encodeObject:v98 forKey:@"ViewSize"];
  }
  uint64_t v99 = [(NPWaldo *)self connectionIdleTimeoutMaximum];
  v100 = [(NPWaldo *)self defaults];
  uint64_t v101 = [v100 connectionIdleTimeoutMaximum];
  char v102 = myIsEqual(v99, v101);

  if ((v102 & 1) == 0)
  {
    uint64_t v103 = [(NPWaldo *)self connectionIdleTimeoutMaximum];
    [v201 encodeObject:v103 forKey:@"ConnectionIdleTimeoutMaximum"];
  }
  v104 = [(NPWaldo *)self locationCheckInterval];
  uint64_t v105 = [(NPWaldo *)self defaults];
  uint64_t v106 = [v105 locationCheckInterval];
  char v107 = myIsEqual(v104, v106);

  if ((v107 & 1) == 0)
  {
    v108 = [(NPWaldo *)self locationCheckInterval];
    [v201 encodeObject:v108 forKey:@"LocationCheckInterval"];
  }
  uint64_t v109 = [(NPWaldo *)self locationToleranceDistance];
  v110 = [(NPWaldo *)self defaults];
  uint64_t v111 = [v110 locationToleranceDistance];
  char v112 = myIsEqual(v109, v111);

  if ((v112 & 1) == 0)
  {
    uint64_t v113 = [(NPWaldo *)self locationToleranceDistance];
    [v201 encodeObject:v113 forKey:@"LocationToleranceDistance"];
  }
  double v114 = [(NPWaldo *)self locationTTL];
  double v115 = [(NPWaldo *)self defaults];
  uint64_t v116 = [v115 locationTTL];
  char v117 = myIsEqual(v114, v116);

  if ((v117 & 1) == 0)
  {
    v118 = [(NPWaldo *)self locationTTL];
    [v201 encodeObject:v118 forKey:@"LocationTTL"];
  }
  uint64_t v119 = [(NPWaldo *)self cachedLocation];
  [v201 encodeObject:v119 forKey:@"CachedLocation"];

  v120 = [(NPWaldo *)self locationCheckTimestamp];
  [v201 encodeObject:v120 forKey:@"LocationCheckTimestamp"];

  uint64_t v121 = [(NPWaldo *)self dayPassHostname];
  v122 = [(NPWaldo *)self defaults];
  uint64_t v123 = [v122 dayPassHostname];
  char v124 = myIsEqual(v121, v123);

  if ((v124 & 1) == 0)
  {
    v125 = [(NPWaldo *)self dayPassHostname];
    [v201 encodeObject:v125 forKey:@"DayPassHostname"];
  }
  long long v126 = [(NPWaldo *)self dayPassHostnamePrependLabel];
  long long v127 = [(NPWaldo *)self defaults];
  long long v128 = [v127 dayPassHostnamePrependLabel];
  char v129 = myIsEqual(v126, v128);

  if ((v129 & 1) == 0)
  {
    v130 = [(NPWaldo *)self dayPassHostnamePrependLabel];
    [v201 encodeObject:v130 forKey:@"host-prepend-label"];
  }
  uint64_t v131 = [(NPWaldo *)self dayPassExtendedValidation];
  v132 = [(NPWaldo *)self defaults];
  v133 = [v132 dayPassExtendedValidation];
  char v134 = myIsEqual(v131, v133);

  if ((v134 & 1) == 0)
  {
    v135 = [(NPWaldo *)self dayPassExtendedValidation];
    [v201 encodeObject:v135 forKey:@"DayPassEV"];
  }
  v136 = [(NPWaldo *)self dayPassEnableSessionTicket];
  v137 = [(NPWaldo *)self defaults];
  v138 = [v137 dayPassEnableSessionTicket];
  char v139 = myIsEqual(v136, v138);

  if ((v139 & 1) == 0)
  {
    char v140 = [(NPWaldo *)self dayPassEnableSessionTicket];
    [v201 encodeObject:v140 forKey:@"session"];
  }
  v141 = [(NPWaldo *)self dayPassLeafOID];
  uint64_t v142 = [(NPWaldo *)self defaults];
  v143 = [v142 dayPassLeafOID];
  char v144 = myIsEqual(v141, v143);

  if ((v144 & 1) == 0)
  {
    v145 = [(NPWaldo *)self dayPassLeafOID];
    [v201 encodeObject:v145 forKey:@"leafOID"];
  }
  v146 = [(NPWaldo *)self dayPassRevocationFailClosed];
  v147 = [(NPWaldo *)self defaults];
  v148 = [v147 dayPassRevocationFailClosed];
  char v149 = myIsEqual(v146, v148);

  if ((v149 & 1) == 0)
  {
    v150 = [(NPWaldo *)self dayPassRevocationFailClosed];
    [v201 encodeObject:v150 forKey:@"revocationFailClosed"];
  }
  v151 = [(NPWaldo *)self tag];
  v152 = [(NPWaldo *)self defaults];
  v153 = [v152 tag];
  char v154 = myIsEqual(v151, v153);

  if ((v154 & 1) == 0)
  {
    v155 = [(NPWaldo *)self tag];
    [v201 encodeObject:v155 forKey:@"Tag"];
  }
  v156 = [(NPWaldo *)self telemetryURL];
  id v157 = [(NPWaldo *)self defaults];
  id v158 = [v157 telemetryURL];
  char v159 = myIsEqual(v156, v158);

  if ((v159 & 1) == 0)
  {
    v160 = [(NPWaldo *)self telemetryURL];
    [v201 encodeObject:v160 forKey:@"TelemetryURL"];
  }
  id v161 = [(NPWaldo *)self telemetryService];
  id v162 = [(NPWaldo *)self defaults];
  v163 = [v162 telemetryService];
  char v164 = myIsEqual(v161, v163);

  if ((v164 & 1) == 0)
  {
    id v165 = [(NPWaldo *)self telemetryService];
    [v201 encodeObject:v165 forKey:@"TelemetryService"];
  }
  long long v166 = [(NPWaldo *)self useGeohashFromServer];
  long long v167 = [(NPWaldo *)self defaults];
  long long v168 = [v167 useGeohashFromServer];
  char v169 = myIsEqual(v166, v168);

  if ((v169 & 1) == 0)
  {
    long long v170 = [(NPWaldo *)self useGeohashFromServer];
    [v201 encodeObject:v170 forKey:@"UseGeoFromServer"];
  }
  long long v171 = [(NPWaldo *)self edgeSelectionEnabled];
  long long v172 = [(NPWaldo *)self defaults];
  long long v173 = [v172 edgeSelectionEnabled];
  char v174 = myIsEqual(v171, v173);

  if ((v174 & 1) == 0)
  {
    id v175 = [(NPWaldo *)self edgeSelectionEnabled];
    [v201 encodeObject:v175 forKey:@"edgeSelectionEnabled"];
  }
  __int16 v176 = [(NPWaldo *)self edgeSelectionAlpha];
  v177 = [(NPWaldo *)self defaults];
  __int16 v178 = [v177 edgeSelectionAlpha];
  char v179 = myIsEqual(v176, v178);

  if ((v179 & 1) == 0)
  {
    v180 = [(NPWaldo *)self edgeSelectionAlpha];
    [v201 encodeObject:v180 forKey:@"edgeSelectionAlpha"];
  }
  v181 = [(NPWaldo *)self edgeSelectionWindowSize];
  uint64_t v182 = [(NPWaldo *)self defaults];
  v183 = [v182 edgeSelectionWindowSize];
  char v184 = myIsEqual(v181, v183);

  if ((v184 & 1) == 0)
  {
    v185 = [(NPWaldo *)self edgeSelectionWindowSize];
    [v201 encodeObject:v185 forKey:@"edgeSelectionWindowSize"];
  }
  v186 = [(NPWaldo *)self enableIPv6];
  v187 = [(NPWaldo *)self defaults];
  v188 = [v187 enableIPv6];
  char v189 = myIsEqual(v186, v188);

  if ((v189 & 1) == 0)
  {
    v190 = [(NPWaldo *)self enableIPv6];
    [v201 encodeObject:v190 forKey:@"EnableIPv6"];
  }
  v191 = [(NPWaldo *)self TFOLeeway];
  v192 = [(NPWaldo *)self defaults];
  v193 = [v192 TFOLeeway];
  char v194 = myIsEqual(v191, v193);

  if ((v194 & 1) == 0)
  {
    v195 = [(NPWaldo *)self TFOLeeway];
    [v201 encodeObject:v195 forKey:@"TFOLeeway"];
  }
  v196 = [(NPWaldo *)self configurationIdentifier];
  [v201 encodeObject:v196 forKey:@"configID"];

  v197 = [(NPWaldo *)self allOnRamps];
  [v201 encodeObject:v197 forKey:@"allOnRamps"];

  v198 = [(NPWaldo *)self edgesGeneration];
  [v201 encodeObject:v198 forKey:@"edgesGeneration"];

  v199 = [(NPWaldo *)self usedEdgesGeneration];
  [v201 encodeObject:v199 forKey:@"usedEdgesGeneration"];

  v200 = [(NPWaldo *)self updateHash];
  [v201 encodeObject:v200 forKey:@"waldoUpdateHash"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [+[NPWaldo allocWithZone:a3] init];
  uint64_t v5 = [(NPWaldo *)self identifier];
  identifier = v4->_identifier;
  v4->_identifier = (NSString *)v5;

  v4->_source = [(NPWaldo *)self source];
  uint64_t v7 = [(NPWaldo *)self hostname];
  hostname = v4->_hostname;
  v4->_hostname = (NSString *)v7;

  BOOL v9 = [(NPWaldo *)self timestamp];
  [(NPWaldo *)v4 setTimestamp:v9];

  uint64_t v10 = [(NPWaldo *)self retryPause];
  [(NPWaldo *)v4 setRetryPause:v10];

  int64_t v11 = [(NPWaldo *)self probePause];
  [(NPWaldo *)v4 setProbePause:v11];

  long long v12 = [(NPWaldo *)self probeTFO];
  [(NPWaldo *)v4 setProbeTFO:v12];

  uint64_t v13 = [(NPWaldo *)self probeNoTFOCookie];
  [(NPWaldo *)v4 setProbeNoTFOCookie:v13];

  long long v14 = [(NPWaldo *)self probeTimeout];
  [(NPWaldo *)v4 setProbeTimeout:v14];

  long long v15 = [(NPWaldo *)self dayPassRequestTimeout];
  [(NPWaldo *)v4 setDayPassRequestTimeout:v15];

  char v16 = [(NPWaldo *)self dayPassSoftExpiry];
  [(NPWaldo *)v4 setDayPassSoftExpiry:v16];

  uint64_t v17 = [(NPWaldo *)self enableLatencyDerivation];
  [(NPWaldo *)v4 setEnableLatencyDerivation:v17];

  id v18 = [(NPWaldo *)self latencyFactorX];
  [(NPWaldo *)v4 setLatencyFactorX:v18];

  uint64_t v19 = [(NPWaldo *)self latencyFactorA];
  [(NPWaldo *)v4 setLatencyFactorA:v19];

  uint64_t v20 = [(NPWaldo *)self latencyFactorB];
  [(NPWaldo *)v4 setLatencyFactorB:v20];

  char v21 = [(NPWaldo *)self edgeFairnessFactor];
  [(NPWaldo *)v4 setEdgeFairnessFactor:v21];

  v22 = [(NPWaldo *)self observedRTTSampleSize];
  [(NPWaldo *)v4 setObservedRTTSampleSize:v22];

  uint64_t v23 = [(NPWaldo *)self reprocessSamplingInterval];
  [(NPWaldo *)v4 setReprocessSamplingInterval:v23];

  v24 = [(NPWaldo *)self reprocessSampleSize];
  [(NPWaldo *)v4 setReprocessSampleSize:v24];

  uint64_t v25 = [(NPWaldo *)self viewSize];
  [(NPWaldo *)v4 setViewSize:v25];

  char v26 = [(NPWaldo *)self locationCheckInterval];
  [(NPWaldo *)v4 setLocationCheckInterval:v26];

  uint64_t v27 = [(NPWaldo *)self locationToleranceDistance];
  [(NPWaldo *)v4 setLocationToleranceDistance:v27];

  uint64_t v28 = [(NPWaldo *)self locationTTL];
  [(NPWaldo *)v4 setLocationTTL:v28];

  uint64_t v29 = [(NPWaldo *)self dayPassHostname];
  [(NPWaldo *)v4 setDayPassHostname:v29];

  v30 = [(NPWaldo *)self dayPassHostnamePrependLabel];
  [(NPWaldo *)v4 setDayPassHostnamePrependLabel:v30];

  char v31 = [(NPWaldo *)self dayPassExtendedValidation];
  [(NPWaldo *)v4 setDayPassExtendedValidation:v31];

  uint64_t v32 = [(NPWaldo *)self dayPassEnableSessionTicket];
  [(NPWaldo *)v4 setDayPassEnableSessionTicket:v32];

  uint64_t v33 = [(NPWaldo *)self dayPassLeafOID];
  [(NPWaldo *)v4 setDayPassLeafOID:v33];

  uint64_t v34 = [(NPWaldo *)self dayPassRevocationFailClosed];
  [(NPWaldo *)v4 setDayPassRevocationFailClosed:v34];

  long long v35 = [(NPWaldo *)self tag];
  [(NPWaldo *)v4 setTag:v35];

  char v36 = [(NPWaldo *)self telemetryURL];
  [(NPWaldo *)v4 setTelemetryURL:v36];

  uint64_t v37 = [(NPWaldo *)self telemetryService];
  [(NPWaldo *)v4 setTelemetryService:v37];

  long long v38 = [(NPWaldo *)self useGeohashFromServer];
  [(NPWaldo *)v4 setUseGeohashFromServer:v38];

  uint64_t v39 = [(NPWaldo *)self edgeSelectionEnabled];
  [(NPWaldo *)v4 setEdgeSelectionEnabled:v39];

  long long v40 = [(NPWaldo *)self edgeSelectionAlpha];
  [(NPWaldo *)v4 setEdgeSelectionAlpha:v40];

  uint64_t v41 = [(NPWaldo *)self edgeSelectionWindowSize];
  [(NPWaldo *)v4 setEdgeSelectionWindowSize:v41];

  char v42 = [(NPWaldo *)self enableIPv6];
  [(NPWaldo *)v4 setEnableIPv6:v42];

  uint64_t v43 = [(NPWaldo *)self TFOLeeway];
  [(NPWaldo *)v4 setTFOLeeway:v43];

  id v44 = objc_alloc(MEMORY[0x1E4F1C978]);
  uint64_t v45 = [(NPWaldo *)self edges];
  long long v46 = (void *)[v44 initWithArray:v45 copyItems:1];
  [(NPWaldo *)v4 setEdges:v46];

  id v47 = objc_alloc(MEMORY[0x1E4F1C978]);
  v48 = [(NPWaldo *)self allOnRamps];
  uint64_t v49 = (void *)[v47 initWithArray:v48 copyItems:1];
  [(NPWaldo *)v4 setAllOnRamps:v49];

  uint64_t v50 = [(NPWaldo *)self edgesGeneration];
  [(NPWaldo *)v4 setEdgesGeneration:v50];

  uint64_t v51 = [(NPWaldo *)self usedEdgesGeneration];
  [(NPWaldo *)v4 setUsedEdgesGeneration:v51];

  char v52 = [(NPWaldo *)self updateHash];
  [(NPWaldo *)v4 setUpdateHash:v52];

  return v4;
}

- (void)merge:(id)a3 missingSettingsOnly:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v188 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if ([v6 source] && (!v4 || !-[NPWaldo source](self, "source"))) {
    self->_source = [v6 source];
  }
  uint64_t v7 = [v6 edges];
  uint64_t v8 = v7;
  if (v7 && v4)
  {
    BOOL v9 = [(NPWaldo *)self edges];

    if (!v9) {
      goto LABEL_10;
    }
  }
  else
  {

    if (v8)
    {
LABEL_10:
      uint64_t v10 = [v6 edges];
      [(NPWaldo *)self setEdges:v10];
    }
  }
  int64_t v11 = [v6 allOnRamps];
  long long v12 = v11;
  if (v11 && v4)
  {
    uint64_t v13 = [(NPWaldo *)self allOnRamps];

    if (!v13) {
      goto LABEL_16;
    }
  }
  else
  {

    if (v12)
    {
LABEL_16:
      long long v14 = [v6 allOnRamps];
      [(NPWaldo *)self setAllOnRamps:v14];
    }
  }
  long long v15 = [v6 retryPause];
  char v16 = v15;
  if (v15 && v4)
  {
    uint64_t v17 = [(NPWaldo *)self retryPause];

    if (!v17) {
      goto LABEL_22;
    }
  }
  else
  {

    if (v16)
    {
LABEL_22:
      id v18 = [v6 retryPause];
      [(NPWaldo *)self setRetryPause:v18];
    }
  }
  uint64_t v19 = [v6 probePause];
  uint64_t v20 = v19;
  if (v19 && v4)
  {
    char v21 = [(NPWaldo *)self probePause];

    if (!v21) {
      goto LABEL_28;
    }
  }
  else
  {

    if (v20)
    {
LABEL_28:
      v22 = [v6 probePause];
      [(NPWaldo *)self setProbePause:v22];
    }
  }
  uint64_t v23 = [v6 probeTFO];
  v24 = v23;
  if (v23 && v4)
  {
    uint64_t v25 = [(NPWaldo *)self probeTFO];

    if (!v25) {
      goto LABEL_34;
    }
  }
  else
  {

    if (v24)
    {
LABEL_34:
      char v26 = [v6 probeTFO];
      [(NPWaldo *)self setProbeTFO:v26];
    }
  }
  uint64_t v27 = [v6 probeNoTFOCookie];
  uint64_t v28 = v27;
  if (v27 && v4)
  {
    uint64_t v29 = [(NPWaldo *)self probeNoTFOCookie];

    if (!v29) {
      goto LABEL_40;
    }
  }
  else
  {

    if (v28)
    {
LABEL_40:
      v30 = [v6 probeNoTFOCookie];
      [(NPWaldo *)self setProbeNoTFOCookie:v30];
    }
  }
  char v31 = [v6 probeTimeout];
  uint64_t v32 = v31;
  if (v31 && v4)
  {
    uint64_t v33 = [(NPWaldo *)self probeTimeout];

    if (!v33) {
      goto LABEL_46;
    }
  }
  else
  {

    if (v32)
    {
LABEL_46:
      uint64_t v34 = [v6 probeTimeout];
      [(NPWaldo *)self setProbeTimeout:v34];
    }
  }
  long long v35 = [v6 dayPassRequestTimeout];
  char v36 = v35;
  if (v35 && v4)
  {
    uint64_t v37 = [(NPWaldo *)self dayPassRequestTimeout];

    if (!v37) {
      goto LABEL_52;
    }
  }
  else
  {

    if (v36)
    {
LABEL_52:
      long long v38 = [v6 dayPassRequestTimeout];
      [(NPWaldo *)self setDayPassRequestTimeout:v38];
    }
  }
  uint64_t v39 = [v6 dayPassSoftExpiry];
  long long v40 = v39;
  if (v39 && v4)
  {
    uint64_t v41 = [(NPWaldo *)self dayPassSoftExpiry];

    if (!v41) {
      goto LABEL_58;
    }
  }
  else
  {

    if (v40)
    {
LABEL_58:
      char v42 = [v6 dayPassSoftExpiry];
      [(NPWaldo *)self setDayPassSoftExpiry:v42];
    }
  }
  uint64_t v43 = [v6 enableLatencyDerivation];
  id v44 = v43;
  if (v43 && v4)
  {
    uint64_t v45 = [(NPWaldo *)self enableLatencyDerivation];

    if (!v45) {
      goto LABEL_64;
    }
  }
  else
  {

    if (v44)
    {
LABEL_64:
      long long v46 = [v6 enableLatencyDerivation];
      [(NPWaldo *)self setEnableLatencyDerivation:v46];
    }
  }
  id v47 = [v6 latencyFactorX];
  v48 = v47;
  if (v47 && v4)
  {
    uint64_t v49 = [(NPWaldo *)self latencyFactorX];

    if (!v49) {
      goto LABEL_70;
    }
  }
  else
  {

    if (v48)
    {
LABEL_70:
      uint64_t v50 = [v6 latencyFactorX];
      [(NPWaldo *)self setLatencyFactorX:v50];
    }
  }
  uint64_t v51 = [v6 latencyFactorA];
  char v52 = v51;
  if (v51 && v4)
  {
    uint64_t v53 = [(NPWaldo *)self latencyFactorA];

    if (!v53) {
      goto LABEL_76;
    }
  }
  else
  {

    if (v52)
    {
LABEL_76:
      v54 = [v6 latencyFactorA];
      [(NPWaldo *)self setLatencyFactorA:v54];
    }
  }
  uint64_t v55 = [v6 latencyFactorB];
  v56 = v55;
  if (v55 && v4)
  {
    char v57 = [(NPWaldo *)self latencyFactorB];

    if (!v57) {
      goto LABEL_82;
    }
  }
  else
  {

    if (v56)
    {
LABEL_82:
      v58 = [v6 latencyFactorB];
      [(NPWaldo *)self setLatencyFactorB:v58];
    }
  }
  uint64_t v59 = [v6 edgeFairnessFactor];
  v60 = v59;
  if (v59 && v4)
  {
    uint64_t v61 = [(NPWaldo *)self edgeFairnessFactor];

    if (!v61) {
      goto LABEL_88;
    }
  }
  else
  {

    if (v60)
    {
LABEL_88:
      char v62 = [v6 edgeFairnessFactor];
      [(NPWaldo *)self setEdgeFairnessFactor:v62];
    }
  }
  uint64_t v63 = [v6 observedRTTSampleSize];
  double v64 = v63;
  if (v63 && v4)
  {
    uint64_t v65 = [(NPWaldo *)self observedRTTSampleSize];

    if (!v65) {
      goto LABEL_94;
    }
  }
  else
  {

    if (v64)
    {
LABEL_94:
      double v66 = [v6 observedRTTSampleSize];
      [(NPWaldo *)self setObservedRTTSampleSize:v66];
    }
  }
  char v67 = [v6 signatureLimit];
  double v68 = v67;
  if (v67 && v4)
  {
    uint64_t v69 = [(NPWaldo *)self signatureLimit];

    if (!v69) {
      goto LABEL_100;
    }
  }
  else
  {

    if (v68)
    {
LABEL_100:
      v70 = [v6 signatureLimit];
      [(NPWaldo *)self setSignatureLimit:v70];
    }
  }
  uint64_t v71 = [v6 reprocessSamplingInterval];
  char v72 = v71;
  if (v71 && v4)
  {
    uint64_t v73 = [(NPWaldo *)self reprocessSamplingInterval];

    if (!v73) {
      goto LABEL_106;
    }
  }
  else
  {

    if (v72)
    {
LABEL_106:
      v74 = [v6 reprocessSamplingInterval];
      [(NPWaldo *)self setReprocessSamplingInterval:v74];
    }
  }
  uint64_t v75 = [v6 reprocessSampleSize];
  v76 = v75;
  if (v75 && v4)
  {
    char v77 = [(NPWaldo *)self reprocessSampleSize];

    if (!v77) {
      goto LABEL_112;
    }
  }
  else
  {

    if (v76)
    {
LABEL_112:
      v78 = [v6 reprocessSampleSize];
      [(NPWaldo *)self setReprocessSampleSize:v78];
    }
  }
  uint64_t v79 = [v6 viewSize];
  v80 = v79;
  if (v79 && v4)
  {
    uint64_t v81 = [(NPWaldo *)self viewSize];

    if (!v81) {
      goto LABEL_118;
    }
  }
  else
  {

    if (v80)
    {
LABEL_118:
      char v82 = [v6 viewSize];
      [(NPWaldo *)self setViewSize:v82];
    }
  }
  uint64_t v83 = [v6 connectionIdleTimeoutMaximum];
  v84 = v83;
  if (v83 && v4)
  {
    uint64_t v85 = [(NPWaldo *)self connectionIdleTimeoutMaximum];

    if (!v85) {
      goto LABEL_124;
    }
  }
  else
  {

    if (v84)
    {
LABEL_124:
      v86 = [v6 connectionIdleTimeoutMaximum];
      [(NPWaldo *)self setConnectionIdleTimeoutMaximum:v86];
    }
  }
  char v87 = [v6 locationCheckInterval];
  v88 = v87;
  if (v87 && v4)
  {
    uint64_t v89 = [(NPWaldo *)self locationCheckInterval];

    if (!v89) {
      goto LABEL_130;
    }
  }
  else
  {

    if (v88)
    {
LABEL_130:
      double v90 = [v6 locationCheckInterval];
      [(NPWaldo *)self setLocationCheckInterval:v90];
    }
  }
  uint64_t v91 = [v6 locationToleranceDistance];
  char v92 = v91;
  if (v91 && v4)
  {
    uint64_t v93 = [(NPWaldo *)self locationToleranceDistance];

    if (!v93) {
      goto LABEL_136;
    }
  }
  else
  {

    if (v92)
    {
LABEL_136:
      uint64_t v94 = [v6 locationToleranceDistance];
      [(NPWaldo *)self setLocationToleranceDistance:v94];
    }
  }
  uint64_t v95 = [v6 locationTTL];
  uint64_t v96 = v95;
  if (v95 && v4)
  {
    char v97 = [(NPWaldo *)self locationTTL];

    if (!v97) {
      goto LABEL_142;
    }
  }
  else
  {

    if (v96)
    {
LABEL_142:
      v98 = [v6 locationTTL];
      [(NPWaldo *)self setLocationTTL:v98];
    }
  }
  uint64_t v99 = [v6 dayPassHostname];
  v100 = v99;
  if (v99 && v4)
  {
    uint64_t v101 = [(NPWaldo *)self dayPassHostname];

    if (!v101) {
      goto LABEL_148;
    }
  }
  else
  {

    if (v100)
    {
LABEL_148:
      char v102 = [v6 dayPassHostname];
      [(NPWaldo *)self setDayPassHostname:v102];
    }
  }
  uint64_t v103 = [v6 dayPassHostnamePrependLabel];
  v104 = v103;
  if (v103 && v4)
  {
    uint64_t v105 = [(NPWaldo *)self dayPassHostnamePrependLabel];

    if (!v105) {
      goto LABEL_154;
    }
  }
  else
  {

    if (v104)
    {
LABEL_154:
      uint64_t v106 = [v6 dayPassHostnamePrependLabel];
      [(NPWaldo *)self setDayPassHostnamePrependLabel:v106];
    }
  }
  char v107 = [v6 dayPassExtendedValidation];
  v108 = v107;
  if (v107 && v4)
  {
    uint64_t v109 = [(NPWaldo *)self dayPassExtendedValidation];

    if (!v109) {
      goto LABEL_160;
    }
  }
  else
  {

    if (v108)
    {
LABEL_160:
      v110 = [v6 dayPassExtendedValidation];
      [(NPWaldo *)self setDayPassExtendedValidation:v110];
    }
  }
  uint64_t v111 = [v6 dayPassEnableSessionTicket];
  char v112 = v111;
  if (v111 && v4)
  {
    uint64_t v113 = [(NPWaldo *)self dayPassEnableSessionTicket];

    if (!v113) {
      goto LABEL_166;
    }
  }
  else
  {

    if (v112)
    {
LABEL_166:
      double v114 = [v6 dayPassEnableSessionTicket];
      [(NPWaldo *)self setDayPassEnableSessionTicket:v114];
    }
  }
  double v115 = [v6 dayPassLeafOID];
  uint64_t v116 = v115;
  if (v115 && v4)
  {
    char v117 = [(NPWaldo *)self dayPassLeafOID];

    if (!v117) {
      goto LABEL_172;
    }
  }
  else
  {

    if (v116)
    {
LABEL_172:
      v118 = [v6 dayPassLeafOID];
      [(NPWaldo *)self setDayPassLeafOID:v118];
    }
  }
  uint64_t v119 = [v6 dayPassRevocationFailClosed];
  v120 = v119;
  if (v119 && v4)
  {
    uint64_t v121 = [(NPWaldo *)self dayPassRevocationFailClosed];

    if (!v121) {
      goto LABEL_178;
    }
  }
  else
  {

    if (v120)
    {
LABEL_178:
      v122 = [v6 dayPassRevocationFailClosed];
      [(NPWaldo *)self setDayPassRevocationFailClosed:v122];
    }
  }
  uint64_t v123 = [v6 tag];
  char v124 = v123;
  if (v123 && v4)
  {
    v125 = [(NPWaldo *)self tag];

    if (!v125) {
      goto LABEL_184;
    }
  }
  else
  {

    if (v124)
    {
LABEL_184:
      long long v126 = [v6 tag];
      [(NPWaldo *)self setTag:v126];
    }
  }
  long long v127 = [v6 telemetryService];
  long long v128 = v127;
  if (v127 && v4)
  {
    char v129 = [(NPWaldo *)self telemetryService];

    if (!v129) {
      goto LABEL_190;
    }
  }
  else
  {

    if (v128)
    {
LABEL_190:
      v130 = [v6 telemetryService];
      [(NPWaldo *)self setTelemetryService:v130];
    }
  }
  uint64_t v131 = [v6 telemetryURL];
  v132 = v131;
  if (v131 && v4)
  {
    v133 = [(NPWaldo *)self telemetryURL];

    if (!v133) {
      goto LABEL_196;
    }
  }
  else
  {

    if (v132)
    {
LABEL_196:
      char v134 = [v6 telemetryURL];
      [(NPWaldo *)self setTelemetryURL:v134];
    }
  }
  v135 = [v6 useGeohashFromServer];
  v136 = v135;
  if (v135 && v4)
  {
    v137 = [(NPWaldo *)self useGeohashFromServer];

    if (!v137) {
      goto LABEL_202;
    }
  }
  else
  {

    if (v136)
    {
LABEL_202:
      v138 = [v6 useGeohashFromServer];
      [(NPWaldo *)self setUseGeohashFromServer:v138];
    }
  }
  char v139 = [v6 configurationIdentifier];
  char v140 = v139;
  if (v139 && v4)
  {
    v141 = [(NPWaldo *)self configurationIdentifier];

    if (!v141) {
      goto LABEL_208;
    }
  }
  else
  {

    if (v140)
    {
LABEL_208:
      uint64_t v142 = [v6 configurationIdentifier];
      [(NPWaldo *)self setConfigurationIdentifier:v142];
    }
  }
  v143 = [v6 timestamp];
  char v144 = v143;
  if (v143 && v4)
  {
    v145 = [(NPWaldo *)self timestamp];

    if (!v145) {
      goto LABEL_214;
    }
  }
  else
  {

    if (v144)
    {
LABEL_214:
      v146 = [v6 timestamp];
      [(NPWaldo *)self setTimestamp:v146];
    }
  }
  v147 = [v6 edgeSelectionEnabled];
  v148 = v147;
  if (v147 && v4)
  {
    char v149 = [(NPWaldo *)self edgeSelectionEnabled];

    if (!v149) {
      goto LABEL_220;
    }
  }
  else
  {

    if (v148)
    {
LABEL_220:
      v150 = [v6 edgeSelectionEnabled];
      [(NPWaldo *)self setEdgeSelectionEnabled:v150];
    }
  }
  v151 = [v6 edgeSelectionAlpha];
  v152 = v151;
  if (v151 && v4)
  {
    v153 = [(NPWaldo *)self edgeSelectionAlpha];

    if (!v153) {
      goto LABEL_226;
    }
  }
  else
  {

    if (v152)
    {
LABEL_226:
      char v154 = [v6 edgeSelectionAlpha];
      [(NPWaldo *)self setEdgeSelectionAlpha:v154];
    }
  }
  v155 = [v6 edgeSelectionWindowSize];
  v156 = v155;
  if (v155 && v4)
  {
    id v157 = [(NPWaldo *)self edgeSelectionWindowSize];

    if (!v157) {
      goto LABEL_232;
    }
  }
  else
  {

    if (v156)
    {
LABEL_232:
      id v158 = [v6 edgeSelectionWindowSize];
      [(NPWaldo *)self setEdgeSelectionWindowSize:v158];
    }
  }
  char v159 = [v6 enableIPv6];
  v160 = v159;
  if (v159 && v4)
  {
    id v161 = [(NPWaldo *)self enableIPv6];

    if (!v161) {
      goto LABEL_238;
    }
  }
  else
  {

    if (v160)
    {
LABEL_238:
      id v162 = [v6 enableIPv6];
      [(NPWaldo *)self setEnableIPv6:v162];
    }
  }
  v163 = [v6 requireTFO];
  char v164 = v163;
  if (v163 && v4)
  {
    id v165 = [(NPWaldo *)self requireTFO];

    if (!v165) {
      goto LABEL_244;
    }
  }
  else
  {

    if (v164)
    {
LABEL_244:
      long long v166 = [v6 requireTFO];
      [(NPWaldo *)self setRequireTFO:v166];
    }
  }
  long long v167 = [v6 TFOLeeway];
  long long v168 = v167;
  if (v167 && v4)
  {
    char v169 = [(NPWaldo *)self TFOLeeway];

    if (!v169) {
      goto LABEL_250;
    }
  }
  else
  {

    if (v168)
    {
LABEL_250:
      long long v170 = [v6 TFOLeeway];
      [(NPWaldo *)self setTFOLeeway:v170];
    }
  }
  long long v171 = [v6 updateHash];
  long long v172 = v171;
  if (v171 && v4)
  {
    long long v173 = [(NPWaldo *)self updateHash];

    if (v173) {
      goto LABEL_257;
    }
  }
  else
  {

    if (!v172) {
      goto LABEL_257;
    }
  }
  char v174 = [v6 updateHash];
  [(NPWaldo *)self setUpdateHash:v174];

LABEL_257:
  long long v185 = 0u;
  long long v186 = 0u;
  long long v183 = 0u;
  long long v184 = 0u;
  id v175 = [(NPWaldo *)self networkInformation];
  uint64_t v176 = [v175 countByEnumeratingWithState:&v183 objects:v187 count:16];
  if (v176)
  {
    uint64_t v177 = v176;
    uint64_t v178 = *(void *)v184;
    do
    {
      uint64_t v179 = 0;
      do
      {
        if (*(void *)v184 != v178) {
          objc_enumerationMutation(v175);
        }
        uint64_t v180 = *(void *)(*((void *)&v183 + 1) + 8 * v179);
        v181 = [(NPWaldo *)self networkInformation];
        uint64_t v182 = [v181 objectForKeyedSubscript:v180];

        [v182 setProbeRateLimit:0];
        ++v179;
      }
      while (v177 != v179);
      uint64_t v177 = [v175 countByEnumeratingWithState:&v183 objects:v187 count:16];
    }
    while (v177);
  }

  [(NPWaldo *)self setShouldSave:1];
}

- (NSArray)edges
{
  return self->_edges;
}

- (void)setEdges:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  BOOL v4 = (NSArray *)a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * v8++) setParentWaldo:self];
      }
      while (v6 != v8);
      uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
  edges = self->_edges;
  self->_edges = v4;
}

- (NSArray)allOnRamps
{
  return self->_allOnRamps;
}

- (void)setAllOnRamps:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  BOOL v4 = (NSArray *)a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * v8++) resetParentWaldo:self];
      }
      while (v6 != v8);
      uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
  allOnRamps = self->_allOnRamps;
  self->_allOnRamps = v4;
}

- (void)updateNetworkAgentWithKeybag:(id)a3 networkInfo:(id)a4
{
  uint64_t v139 = *MEMORY[0x1E4F143B8];
  id v124 = a3;
  id v123 = a4;
  uint64_t v6 = [(NPWaldo *)self agent];

  if (!v6)
  {
    uint64_t v7 = nplog_obj();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = [(NPWaldo *)self identifier];
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = v8;
      _os_log_impl(&dword_1A0FEE000, v7, OS_LOG_TYPE_DEFAULT, "%@: Creating a new keybag agent", buf, 0xCu);
    }
    BOOL v9 = objc_alloc_init(NSPNetworkAgent);
    [(NPWaldo *)self setAgent:v9];

    id v10 = objc_alloc(MEMORY[0x1E4F38C00]);
    long long v11 = [(NPWaldo *)self agent];
    long long v12 = (void *)[v10 initWithNetworkAgentClass:objc_opt_class()];
    [(NPWaldo *)self setAgentRegistration:v12];
  }
  long long v13 = [(NPWaldo *)self agentRegistration];
  int v14 = [v13 isRegistered];

  if (!v14)
  {
    *(void *)buf = 0;
    *(void *)&uint8_t buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    *(void *)&buf[24] = __Block_byref_object_copy__4;
    *(void *)&buf[32] = __Block_byref_object_dispose__4;
    id v138 = 0;
    uint64_t v19 = nplog_obj();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      uint64_t v20 = [(NPWaldo *)self identifier];
      char v21 = [(NPWaldo *)self configurationIdentifier];
      *(_DWORD *)v133 = 138412546;
      char v134 = v20;
      __int16 v135 = 2112;
      v136 = v21;
      _os_log_impl(&dword_1A0FEE000, v19, OS_LOG_TYPE_INFO, "%@: Looking for keybag agent registration with configuration ID %@", v133, 0x16u);
    }
    v22 = [MEMORY[0x1E4F38CD8] sharedMaintainer];
    v131[0] = MEMORY[0x1E4F143A8];
    v131[1] = 3221225472;
    v131[2] = __52__NPWaldo_updateNetworkAgentWithKeybag_networkInfo___block_invoke;
    v131[3] = &unk_1E5A3BC58;
    v131[4] = self;
    v131[5] = buf;
    [v22 iterateFileHandlesWithBlock:v131];

    if (*(void *)(*(void *)&buf[8] + 40))
    {
      uint64_t v23 = nplog_obj();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        v24 = [(NPWaldo *)self identifier];
        *(_DWORD *)v133 = 138412290;
        char v134 = v24;
        _os_log_impl(&dword_1A0FEE000, v23, OS_LOG_TYPE_DEFAULT, "%@: Re-using existing keybag network agent registration file handle", v133, 0xCu);
      }
      uint64_t v25 = [*(id *)(*(void *)&buf[8] + 40) handle];
      uint64_t v26 = dup([v25 fileDescriptor]);

      if ((v26 & 0x80000000) != 0)
      {
        id v44 = nplog_obj();
        if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
        {
          double v114 = [(NPWaldo *)self identifier];
          double v115 = __error();
          uint64_t v116 = strerror(*v115);
          *(_DWORD *)v133 = 138412546;
          char v134 = v114;
          __int16 v135 = 2080;
          v136 = v116;
          _os_log_error_impl(&dword_1A0FEE000, v44, OS_LOG_TYPE_ERROR, "%@: Failed to dup the keybag network agent registration file descriptor: %s", v133, 0x16u);
        }
      }
      else
      {
        uint64_t v27 = [*(id *)(*(void *)&buf[8] + 40) agentUUID];
        uint64_t v28 = [(NPWaldo *)self agent];
        [v28 setAgentUUID:v27];

        uint64_t v29 = nplog_obj();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v111 = [(NPWaldo *)self identifier];
          char v112 = [(NPWaldo *)self agent];
          uint64_t v113 = [v112 agentUUID];
          *(_DWORD *)v133 = 138412546;
          char v134 = v111;
          __int16 v135 = 2112;
          v136 = v113;
          _os_log_debug_impl(&dword_1A0FEE000, v29, OS_LOG_TYPE_DEBUG, "%@: Re-set UUID for keybag agent: %@", v133, 0x16u);
        }
        v30 = [(NPWaldo *)self agentRegistration];
        char v31 = [(NPWaldo *)self agent];
        char v32 = [v30 setRegisteredNetworkAgent:v31 fileDescriptor:v26];

        if (v32)
        {
          id v33 = objc_alloc_init(MEMORY[0x1E4F38C10]);
          [v33 setAccount:@"com.apple.NetworkServiceProxy"];
          uint64_t v121 = v33;
          v120 = (void *)[objc_alloc(MEMORY[0x1E4F38C20]) initWithEndpoint:0 parameters:v33];
          uint64_t v34 = [v120 path];
          long long v35 = [v34 networkAgentsOfType:objc_opt_class()];

          long long v129 = 0u;
          long long v130 = 0u;
          long long v127 = 0u;
          long long v128 = 0u;
          id obj = v35;
          uint64_t v36 = [obj countByEnumeratingWithState:&v127 objects:v132 count:16];
          if (v36)
          {
            uint64_t v37 = *(void *)v128;
            while (2)
            {
              for (uint64_t i = 0; i != v36; ++i)
              {
                if (*(void *)v128 != v37) {
                  objc_enumerationMutation(obj);
                }
                uint64_t v39 = *(void **)(*((void *)&v127 + 1) + 8 * i);
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  long long v40 = [v39 agentUUID];
                  uint64_t v41 = [(NPWaldo *)self agent];
                  char v42 = [v41 agentUUID];
                  int v43 = [v40 isEqual:v42];

                  if (v43)
                  {
                    [v39 parseAgentData];
                    long long v46 = [v39 keybag];
                    BOOL v47 = v46 == 0;

                    if (!v47)
                    {
                      v48 = nplog_obj();
                      if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
                      {
                        uint64_t v49 = [(NPWaldo *)self identifier];
                        *(_DWORD *)v133 = 138412290;
                        char v134 = v49;
                        _os_log_impl(&dword_1A0FEE000, v48, OS_LOG_TYPE_DEFAULT, "%@: Setting current keybag to keybag obtained from the kernel", v133, 0xCu);
                      }
                      uint64_t v50 = [v39 keybag];
                      uint64_t v51 = [(NPWaldo *)self agent];
                      [v51 setKeybag:v50];
                    }
                    goto LABEL_39;
                  }
                }
              }
              uint64_t v36 = [obj countByEnumeratingWithState:&v127 objects:v132 count:16];
              if (v36) {
                continue;
              }
              break;
            }
          }
LABEL_39:

          goto LABEL_40;
        }
        uint64_t v45 = nplog_obj();
        if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
        {
          char v117 = [(NPWaldo *)self identifier];
          v118 = [(NPWaldo *)self agent];
          uint64_t v119 = [v118 agentUUID];
          *(_DWORD *)v133 = 138412546;
          char v134 = v117;
          __int16 v135 = 2112;
          v136 = v119;
          _os_log_error_impl(&dword_1A0FEE000, v45, OS_LOG_TYPE_ERROR, "%@: Failed to set the registered network agent for %@", v133, 0x16u);
        }
        close(v26);
      }
      _Block_object_dispose(buf, 8);

      goto LABEL_71;
    }
LABEL_40:
    _Block_object_dispose(buf, 8);

    goto LABEL_41;
  }
  uint64_t v15 = nplog_obj();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    char v16 = [(NPWaldo *)self identifier];
    uint64_t v17 = [(NPWaldo *)self agent];
    id v18 = [v17 agentUUID];
    *(_DWORD *)buf = 138412546;
    *(void *)&uint8_t buf[4] = v16;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v18;
    _os_log_impl(&dword_1A0FEE000, v15, OS_LOG_TYPE_INFO, "%@: Updating existing keybag agent with UUID %@", buf, 0x16u);
  }
LABEL_41:
  char v52 = [(NPWaldo *)self agentRegistration];
  int v53 = [v52 isRegistered];

  if (v53)
  {
    v54 = [NPKeyBag alloc];
    uint64_t v55 = [(NPWaldo *)self agent];
    v56 = [v55 keybag];
    v122 = [(NPKeyBag *)v54 initWithData:v56];

    if (([v123 hasIPv6] & 1) == 0) {
      [(NPKeyBag *)v122 removeIPv6Keys];
    }
    char v57 = [v124 keys];
    if (![v57 count])
    {
      v58 = [v124 updateHash];
      uint64_t v59 = [(NPKeyBag *)v122 updateHash];
      if ([v58 isEqual:v59])
      {
        v60 = [(NPKeyBag *)v122 keys];
        BOOL v61 = [v60 count] == 0;

        if (!v61)
        {
          [(NPKeyBag *)v122 setTFOStatusOverride:3];
          -[NPKeyBag setGeneration:](v122, "setGeneration:", [v124 generation]);
          char v62 = nplog_obj();
          BOOL v63 = os_log_type_enabled(v62, OS_LOG_TYPE_DEBUG);

          if (v63)
          {
            double v64 = [(NPWaldo *)self identifier];
            [(NPKeyBag *)v122 logWithMessage:@"New keybag does not have any keys, re-pushing current keybag with TFO disabled and updated generation" identifier:v64];
          }
          else
          {
            double v64 = nplog_obj();
            if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v109 = [(NPWaldo *)self identifier];
              *(_DWORD *)buf = 138412290;
              *(void *)&uint8_t buf[4] = v109;
              _os_log_impl(&dword_1A0FEE000, v64, OS_LOG_TYPE_DEFAULT, "%@: New keybag does not have any keys, re-pushing current keybag with TFO disabled and updated generation", buf, 0xCu);
            }
          }

          v88 = [(NPKeyBag *)v122 data];
          uint64_t v89 = [(NPWaldo *)self agent];
          [v89 setKeybag:v88];
          goto LABEL_61;
        }
LABEL_60:
        v88 = [v124 data];
        uint64_t v89 = [(NPWaldo *)self agent];
        [v89 setKeybag:v88];
LABEL_61:

        double v90 = [(NPWaldo *)self keybag];
        uint64_t v91 = [v90 keys];
        BOOL v92 = [v91 count] == 0;

        if (!v92)
        {
          uint64_t v93 = 0;
          unsigned int v94 = 1;
          do
          {
            uint64_t v95 = [(NPWaldo *)self keybag];
            uint64_t v96 = [v95 keys];
            char v97 = [v96 objectAtIndexedSubscript:v93];

            v98 = nplog_obj();
            if (os_log_type_enabled(v98, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v99 = [(NPWaldo *)self identifier];
              v100 = [v97 uuid];
              int v101 = objc_msgSend(v97, "session_counter");
              *(_DWORD *)buf = 138413058;
              *(void *)&uint8_t buf[4] = v99;
              *(_WORD *)&buf[12] = 1024;
              *(_DWORD *)&buf[14] = v94 - 1;
              *(_WORD *)&buf[18] = 2112;
              *(void *)&buf[20] = v100;
              *(_WORD *)&buf[28] = 1024;
              *(_DWORD *)&buf[30] = v101;
              _os_log_impl(&dword_1A0FEE000, v98, OS_LOG_TYPE_DEFAULT, "%@: Pushing %u [%@] [%u session counter]", buf, 0x22u);
            }
            char v102 = [(NPWaldo *)self keybag];
            uint64_t v103 = [v102 keys];
            uint64_t v93 = v94;
            BOOL v104 = [v103 count] > (unint64_t)v94;

            ++v94;
          }
          while (v104);
        }
        uint64_t v105 = [(NPWaldo *)self agentRegistration];
        uint64_t v106 = [(NPWaldo *)self agent];
        char v107 = [v105 updateNetworkAgent:v106];

        if ((v107 & 1) == 0)
        {
          v108 = nplog_obj();
          if (os_log_type_enabled(v108, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_error_impl(&dword_1A0FEE000, v108, OS_LOG_TYPE_ERROR, "Failed to update the keybag network agent", buf, 2u);
          }
        }
        goto LABEL_71;
      }
    }
    goto LABEL_60;
  }
  uint64_t v65 = nplog_obj();
  if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
  {
    double v66 = [(NPWaldo *)self identifier];
    *(_DWORD *)buf = 138412290;
    *(void *)&uint8_t buf[4] = v66;
    _os_log_impl(&dword_1A0FEE000, v65, OS_LOG_TYPE_DEFAULT, "%@: Setting up new keybag network agent registration", buf, 0xCu);
  }
  char v67 = [v124 data];
  double v68 = [(NPWaldo *)self agent];
  [v68 setKeybag:v67];

  uint64_t v69 = [MEMORY[0x1E4F29128] UUID];
  v70 = [(NPWaldo *)self agent];
  [v70 setAgentUUID:v69];

  uint64_t v71 = nplog_obj();
  if (os_log_type_enabled(v71, OS_LOG_TYPE_DEFAULT))
  {
    char v72 = [(NPWaldo *)self identifier];
    uint64_t v73 = [(NPWaldo *)self agent];
    v74 = [v73 agentUUID];
    *(_DWORD *)buf = 138412546;
    *(void *)&uint8_t buf[4] = v72;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v74;
    _os_log_impl(&dword_1A0FEE000, v71, OS_LOG_TYPE_DEFAULT, "%@: Created new UUID for keybag agent: %@", buf, 0x16u);
  }
  uint64_t v75 = [(NPWaldo *)self delegate];
  [v75 waldoNeedsPolicyReset];

  uint64_t v76 = [(NPWaldo *)self agentRegistration];
  char v77 = [(NPWaldo *)self agent];
  [(id)v76 registerNetworkAgent:v77];

  v78 = [(NPWaldo *)self agentRegistration];
  LOBYTE(v76) = [v78 isRegistered];

  if (v76)
  {
    id v79 = objc_alloc(MEMORY[0x1E4F38D00]);
    v80 = [(NPWaldo *)self agentRegistration];
    uint64_t v81 = [(NPWaldo *)self configurationIdentifier];
    char v82 = [(NPWaldo *)self agent];
    uint64_t v83 = [v82 agentUUID];
    v84 = (void *)[v79 initWithNetworkAgentRegistration:v80 sessionType:&unk_1EF43BDA8 configurationIdentifier:v81 agentUUID:v83];

    uint64_t v85 = [MEMORY[0x1E4F38CD8] sharedMaintainer];
    v126[0] = MEMORY[0x1E4F143A8];
    v126[1] = 3221225472;
    v126[2] = __52__NPWaldo_updateNetworkAgentWithKeybag_networkInfo___block_invoke_848;
    v126[3] = &unk_1E5A3BC80;
    v126[4] = self;
    [v85 setFileHandle:v84 matchingPredicate:v126];

    v86 = [MEMORY[0x1E4F38CD8] sharedMaintainer];
    [v86 commit];
  }
  else
  {
    char v87 = nplog_obj();
    if (os_log_type_enabled(v87, OS_LOG_TYPE_ERROR))
    {
      v110 = [(NPWaldo *)self identifier];
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = v110;
      _os_log_error_impl(&dword_1A0FEE000, v87, OS_LOG_TYPE_ERROR, "%@: Failed to register keybag network agent", buf, 0xCu);
    }
  }
LABEL_71:
}

uint64_t __52__NPWaldo_updateNetworkAgentWithKeybag_networkInfo___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_6;
  }
  BOOL v4 = [v3 sessionType];
  int v5 = [v4 isEqual:&unk_1EF43BDA8];
  if (v5)
  {
    uint64_t v6 = [v3 configurationIdentifier];
    uint64_t v7 = [*(id *)(a1 + 32) configurationIdentifier];
    int v8 = [v6 isEqual:v7];

    if (v8)
    {
      uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
      id v10 = v3;
      BOOL v4 = *(void **)(v9 + 40);
      *(void *)(v9 + 40) = v10;
      goto LABEL_5;
    }
LABEL_6:
    uint64_t v11 = 1;
    goto LABEL_7;
  }
LABEL_5:
  uint64_t v11 = v5 ^ 1u;

LABEL_7:
  return v11;
}

uint64_t __52__NPWaldo_updateNetworkAgentWithKeybag_networkInfo___block_invoke_848(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    BOOL v4 = [v3 sessionType];
    if ([v4 isEqual:&unk_1EF43BDA8])
    {
      int v5 = [v3 configurationIdentifier];
      uint64_t v6 = [*(id *)(a1 + 32) configurationIdentifier];
      uint64_t v7 = [v5 isEqual:v6];
    }
    else
    {
      uint64_t v7 = 0;
    }
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

- (void)teardownNetworkAgent
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = [(NPWaldo *)self agentRegistration];
  int v4 = [v3 isRegistered];

  if (v4)
  {
    int v5 = [(NPWaldo *)self agentRegistration];
    [v5 unregisterNetworkAgent];

    uint64_t v6 = [MEMORY[0x1E4F38CD8] sharedMaintainer];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __31__NPWaldo_teardownNetworkAgent__block_invoke;
    v17[3] = &unk_1E5A3BC80;
    v17[4] = self;
    [v6 removeFileHandleMatchingPredicate:v17];

    uint64_t v7 = [MEMORY[0x1E4F38CD8] sharedMaintainer];
    [v7 commit];
  }
  [(NPWaldo *)self setAgent:0];
  [(NPWaldo *)self setAgentRegistration:0];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  int v8 = [(NPWaldo *)self edges];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v18 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v14;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v8);
        }
        [*(id *)(*((void *)&v13 + 1) + 8 * v12++) iterateOnRampsForAddressFamily:0 withBlock:&__block_literal_global_850];
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v13 objects:v18 count:16];
    }
    while (v10);
  }
}

uint64_t __31__NPWaldo_teardownNetworkAgent__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int v4 = [v3 sessionType];
    if ([v4 isEqual:&unk_1EF43BDA8])
    {
      int v5 = [v3 configurationIdentifier];
      uint64_t v6 = [*(id *)(a1 + 32) configurationIdentifier];
      uint64_t v7 = [v5 isEqual:v6];
    }
    else
    {
      uint64_t v7 = 0;
    }
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

uint64_t __31__NPWaldo_teardownNetworkAgent__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  return 1;
}

- (id)description
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  int v43 = [(NPWaldo *)self identifier];
  int64_t v34 = [(NPWaldo *)self currentEdgeIndex];
  char v42 = [(NPWaldo *)self retryPause];
  uint64_t v41 = [(NPWaldo *)self probePause];
  uint64_t v36 = [(NPWaldo *)self probeTFO];
  if ([v36 BOOLValue]) {
    int v4 = @"YES";
  }
  else {
    int v4 = @"NO";
  }
  id v33 = v4;
  long long v35 = [(NPWaldo *)self probeNoTFOCookie];
  if ([v35 BOOLValue]) {
    int v5 = @"YES";
  }
  else {
    int v5 = @"NO";
  }
  uint64_t v6 = @"YES";
  char v32 = v5;
  long long v40 = [(NPWaldo *)self enableLatencyDerivation];
  uint64_t v39 = [(NPWaldo *)self latencyFactorX];
  long long v38 = [(NPWaldo *)self latencyFactorA];
  char v31 = [(NPWaldo *)self latencyFactorB];
  v30 = [(NPWaldo *)self edgeFairnessFactor];
  uint64_t v37 = [(NPWaldo *)self locationCheckInterval];
  uint64_t v29 = [(NPWaldo *)self locationToleranceDistance];
  uint64_t v28 = [(NPWaldo *)self locationTTL];
  uint64_t v7 = [(NPWaldo *)self viewSize];
  uint64_t v27 = [(NPWaldo *)self dayPassRequestTimeout];
  uint64_t v26 = [(NPWaldo *)self dayPassSoftExpiry];
  uint64_t v25 = [(NPWaldo *)self generation];
  int v8 = [(NPWaldo *)self cachedLocation];
  uint64_t v9 = [(NPWaldo *)self locationCheckTimestamp];
  uint64_t v10 = [(NPWaldo *)self useGeohashFromServer];
  uint64_t v11 = @"YES";
  if (![v10 BOOLValue]) {
    uint64_t v6 = @"NO";
  }
  if (![(NPWaldo *)self isIPv6Enabled]) {
    uint64_t v11 = @"NO";
  }
  uint64_t v12 = [(NPWaldo *)self requireTFO];
  int v13 = [v12 BOOLValue];
  long long v14 = @"YES";
  if (!v13) {
    long long v14 = @"NO";
  }
  objc_msgSend(v3, "appendFormat:", @"identifier = %@, currentEdgeIndex = %ld, retryPause = %@, probePause = %@, probeTFO = %@, probeNoTFOCookie = %@ enableLatencyDerivation = %@, latencyFactorX = %@, latencyFactorA = %@, latencyFactorB = %@, edgeFairnessFactor = %@, locationCheckInterval = %@, locationToleranceDistance = %@, locationTTL = %@, viewSize = %@, daypassRequestTimeout = %@, daypassSoftExpiry = %@, generation = %u, cachedLocation = %@, locationCheckTimestamp %@, useGeoFromServer %@, enableIPv6 %@, requireTFO %@", v43, v34, v42, v41, v33, v32, v40, v39, v38, v31, v30, v37, v29, v28, v7, v27,
    v26,
    v25,
    v8,
    v9,
    v6,
    v11,
    v14);

  [v3 appendFormat:@"\nEdges (ordered by distance if available) :"];
  long long v15 = [(NPWaldo *)self edges];
  uint64_t v16 = [v15 count];

  if (v16)
  {
    unint64_t v17 = 0;
    do
    {
      id v18 = [(NPWaldo *)self edges];
      uint64_t v19 = [v18 objectAtIndexedSubscript:v17];
      [v3 appendFormat:@"\n\t%@", v19];

      ++v17;
      uint64_t v20 = [(NPWaldo *)self edges];
      unint64_t v21 = [v20 count];
    }
    while (v17 < v21);
  }
  if ([(NPWaldo *)self edgeCount])
  {
    [v3 appendFormat:@"\n\nEdges (current network RTT order):"];
    if ([(NPWaldo *)self edgeCount])
    {
      unint64_t v22 = 0;
      do
      {
        uint64_t v23 = [(NPWaldo *)self edgeAtIndex:v22];
        [v3 appendFormat:@"\n\t%@", v23];

        ++v22;
      }
      while (v22 < [(NPWaldo *)self edgeCount]);
    }
  }
  return v3;
}

- (id)initFromKeychainWithIdentifier:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = (void *)[[NSString alloc] initWithFormat:@"%@.%@", @"com.apple.NetworkServiceProxy.WaldoInfo", v4];
  id v6 = +[NPUtilities copyDataFromKeychainWithIdentifier:v5 accountName:@"waldo"];
  if (v6)
  {
    id v30 = 0;
    uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F28DC0]) initForReadingFromData:v6 error:&v30];
    int v8 = v30;
    if (v7)
    {
      uint64_t v9 = [(NPWaldo *)self initWithCoder:v7];
      uint64_t v10 = nplog_obj();
      uint64_t v11 = v10;
      if (v9)
      {
        v24 = v7;
        uint64_t v25 = v8;
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v12 = [(NPWaldo *)v9 identifier];
          *(_DWORD *)buf = 138412290;
          id v33 = v12;
          _os_log_impl(&dword_1A0FEE000, v11, OS_LOG_TYPE_DEFAULT, "%@: Loaded Waldo from keychain", buf, 0xCu);
        }
        long long v28 = 0u;
        long long v29 = 0u;
        long long v26 = 0u;
        long long v27 = 0u;
        int v13 = [(NPWaldo *)v9 networkInformation];
        uint64_t v14 = [v13 countByEnumeratingWithState:&v26 objects:v31 count:16];
        if (v14)
        {
          uint64_t v15 = v14;
          uint64_t v16 = *(void *)v27;
          do
          {
            for (uint64_t i = 0; i != v15; ++i)
            {
              if (*(void *)v27 != v16) {
                objc_enumerationMutation(v13);
              }
              uint64_t v18 = *(void *)(*((void *)&v26 + 1) + 8 * i);
              uint64_t v19 = [(NPWaldo *)v9 networkInformation];
              uint64_t v20 = [v19 objectForKeyedSubscript:v18];

              if ([v20 isProbeInProgress])
              {
                [v20 setIsProbeInProgress:0];
                [v20 setLastFallbackReason:38];
              }
            }
            uint64_t v15 = [v13 countByEnumeratingWithState:&v26 objects:v31 count:16];
          }
          while (v15);
        }

        self = v9;
        unint64_t v21 = self;
        uint64_t v7 = v24;
        int v8 = v25;
        goto LABEL_26;
      }
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v33 = v4;
        _os_log_error_impl(&dword_1A0FEE000, v11, OS_LOG_TYPE_ERROR, "%@: Failed to decode from the keychain", buf, 0xCu);
      }

      self = 0;
    }
    else
    {
      unint64_t v22 = nplog_obj();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        id v33 = v4;
        __int16 v34 = 2112;
        long long v35 = v8;
        _os_log_error_impl(&dword_1A0FEE000, v22, OS_LOG_TYPE_ERROR, "%@: Failed to create a decoder: %@", buf, 0x16u);
      }
    }
    unint64_t v21 = 0;
LABEL_26:

    goto LABEL_27;
  }
  int v8 = nplog_obj();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v33 = v4;
    _os_log_impl(&dword_1A0FEE000, v8, OS_LOG_TYPE_DEFAULT, "%@: No Waldo info in the keychain", buf, 0xCu);
  }
  unint64_t v21 = 0;
LABEL_27:

  return v21;
}

- (void)saveToKeychain
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  if ([(NPWaldo *)self shouldSave])
  {
    [(NPWaldo *)self setShouldSave:0];
    id v3 = [(NPWaldo *)self delegate];
    [v3 waldoDidSaveToKeychain:self];

    id v4 = nplog_obj();
    BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG);

    if (v5)
    {
      id v6 = nplog_obj();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      {
        unint64_t v21 = [(NPWaldo *)self identifier];
        *(_DWORD *)buf = 138412546;
        long long v28 = v21;
        __int16 v29 = 2112;
        id v30 = self;
        _os_log_debug_impl(&dword_1A0FEE000, v6, OS_LOG_TYPE_DEBUG, "%@: Saving Waldo info to keychain: %@", buf, 0x16u);
      }
    }
    [(NPWaldo *)self ageOutLatencyMap];
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    uint64_t v7 = [(NPWaldo *)self edges];
    uint64_t v8 = [v7 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v23;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v23 != v10) {
            objc_enumerationMutation(v7);
          }
          [*(id *)(*((void *)&v22 + 1) + 8 * v11++) iterateOnRampsForAddressFamily:0 withBlock:&__block_literal_global_880];
        }
        while (v9 != v11);
        uint64_t v9 = [v7 countByEnumeratingWithState:&v22 objects:v26 count:16];
      }
      while (v9);
    }

    uint64_t v12 = +[NSPConfiguration defaultConfiguration];
    int v13 = [v12 edgeSets];
    uint64_t v14 = [(NPWaldo *)self identifier];
    uint64_t v15 = [v13 objectForKeyedSubscript:v14];

    if (v15) {
      [(NPWaldo *)self setDefaults:v15];
    }
    uint64_t v16 = (void *)[objc_alloc(MEMORY[0x1E4F28DB0]) initRequiringSecureCoding:1];
    [(NPWaldo *)self encodeWithCoder:v16];
    [(NPWaldo *)self setDefaults:0];
    id v17 = [NSString alloc];
    uint64_t v18 = [(NPWaldo *)self identifier];
    uint64_t v19 = (void *)[v17 initWithFormat:@"%@.%@", @"com.apple.NetworkServiceProxy.WaldoInfo", v18];

    uint64_t v20 = [v16 encodedData];
    +[NPUtilities saveDataToKeychain:v20 withIdentifier:v19 accountName:@"waldo"];
  }
}

uint64_t __25__NPWaldo_saveToKeychain__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  return 1;
}

- (void)removeFromKeychain
{
  id v3 = [NSString alloc];
  id v4 = [(NPWaldo *)self identifier];
  id v5 = (id)[v3 initWithFormat:@"%@.%@", @"com.apple.NetworkServiceProxy.WaldoInfo", v4];

  +[NPUtilities removeDataFromKeychainWithIdentifier:v5];
}

- (void)establishTrustWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __47__NPWaldo_establishTrustWithCompletionHandler___block_invoke;
  v6[3] = &unk_1E5A3C1F8;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(NPWaldo *)self resolveWithCompletionHandler:v6];
}

void __47__NPWaldo_establishTrustWithCompletionHandler___block_invoke(uint64_t a1, char a2, int a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    if (a3) {
      [*(id *)(a1 + 32) linkAllSignatures:1];
    }
    id v4 = [*(id *)(a1 + 32) locationManager];
    [v4 shouldCheckLocation];

    id v5 = [*(id *)(a1 + 32) locationManager];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __47__NPWaldo_establishTrustWithCompletionHandler___block_invoke_883;
    v10[3] = &unk_1E5A3C1D0;
    id v6 = *(void **)(a1 + 40);
    v10[4] = *(void *)(a1 + 32);
    id v11 = v6;
    [v5 sortEdgesByDistanceWithCompletionHandler:v10];
  }
  else
  {
    id v7 = nplog_obj();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = [*(id *)(a1 + 32) identifier];
      *(_DWORD *)buf = 138412290;
      int v13 = v9;
      _os_log_error_impl(&dword_1A0FEE000, v7, OS_LOG_TYPE_ERROR, "%@: Failed to resolve while establishing trust", buf, 0xCu);
    }
    uint64_t v8 = *(void *)(a1 + 40);
    if (v8) {
      (*(void (**)(uint64_t, void, void))(v8 + 16))(v8, 0, 0);
    }
  }
}

void __47__NPWaldo_establishTrustWithCompletionHandler___block_invoke_883(uint64_t a1, char a2)
{
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __47__NPWaldo_establishTrustWithCompletionHandler___block_invoke_2;
  v10[3] = &unk_1E5A3C180;
  id v4 = *(void **)(a1 + 40);
  v10[4] = *(void *)(a1 + 32);
  id v11 = v4;
  char v12 = a2;
  id v5 = (void *)MEMORY[0x1A622B750](v10);
  if ((a2 & 1) != 0 || ([*(id *)(a1 + 32) isLatenciesCompleteForNetwork:0] & 1) == 0)
  {
    id v6 = *(void **)(a1 + 32);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __47__NPWaldo_establishTrustWithCompletionHandler___block_invoke_884;
    v7[3] = &unk_1E5A3C1A8;
    v7[4] = v6;
    id v8 = v5;
    id v9 = *(id *)(a1 + 40);
    [v6 reprocessWithCompletionHandler:v7];
  }
  else
  {
    [*(id *)(a1 + 32) refreshDayPassesWithCompletionHandler:v5];
  }
}

uint64_t __47__NPWaldo_establishTrustWithCompletionHandler___block_invoke_2(uint64_t a1, uint64_t a2, unsigned int a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if ((a2 & 1) == 0)
  {
    id v6 = nplog_obj();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = [*(id *)(a1 + 32) identifier];
      int v10 = 138412290;
      id v11 = v7;
      _os_log_impl(&dword_1A0FEE000, v6, OS_LOG_TYPE_DEFAULT, "%@: Day Pass refresh failed", (uint8_t *)&v10, 0xCu);
    }
  }
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    if (*(unsigned char *)(a1 + 48)) {
      uint64_t v9 = 1;
    }
    else {
      uint64_t v9 = a3;
    }
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(result + 16))(result, a2, v9);
  }
  return result;
}

uint64_t __47__NPWaldo_establishTrustWithCompletionHandler___block_invoke_884(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) setShouldSave:a2];
  uint64_t v3 = [*(id *)(a1 + 32) edgeCount];
  id v4 = *(void **)(a1 + 32);
  if (v3)
  {
    uint64_t v5 = *(void *)(a1 + 40);
    return [v4 refreshDayPassesWithCompletionHandler:v5];
  }
  else
  {
    [v4 pushKeybagToKernel];
    uint64_t result = *(void *)(a1 + 48);
    if (result)
    {
      id v7 = *(uint64_t (**)(void))(result + 16);
      return v7();
    }
  }
  return result;
}

- (void)pushKeybagToKernelUpdateGeneration:(BOOL)a3
{
  if (a3) {
    ++self->_generation;
  }
  [(NPWaldo *)self pushKeybagToKernelCanReuse:1];
}

- (void)pushKeybagToKernel
{
}

- (void)pushKeybagToKernelCanReuse:(BOOL)a3
{
  uint64_t v5 = [(NPWaldo *)self currentEdgeList];
  id v6 = [(NPWaldo *)self currentNetworkInfo];
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if ([(NPWaldo *)self dayPassFetchCount] >= 1)
  {
    int64_t v8 = 0;
    do
    {
      uint64_t v9 = [(NPWaldo *)self edgeAtIndex:v8];
      if (v9)
      {
        int v10 = [v5 objectAtIndexedSubscript:v8];
        id v11 = [v9 getCurrentOnRamp:v10];
        if (v11 || (id v11 = objc_alloc_init(NPTuscanyOnRamp)) != 0)
        {
          [v7 addObject:v11];
        }
      }

      ++v8;
    }
    while (v8 < [(NPWaldo *)self dayPassFetchCount]);
  }
  if ((![v6 lastFallbackReason] || objc_msgSend(v6, "lastFallbackReason") == 18)
    && ![v7 count])
  {
    uint64_t v12 = [(NPWaldo *)self signatureLimit];
    if (v12)
    {
      int v13 = [(NPWaldo *)self signatureLimit];
      unint64_t v14 = [v13 unsignedIntegerValue];
    }
    else
    {
      unint64_t v14 = 50;
    }

    uint64_t v15 = [(NPWaldo *)self networkInformation];
    unint64_t v16 = [v15 count];

    if (v16 <= v14)
    {
      uint64_t v18 = [(NPWaldo *)self edgesGeneration];
      int v19 = [v18 unsignedIntValue];
      uint64_t v20 = [(NPWaldo *)self usedEdgesGeneration];
      int v21 = [v20 unsignedIntValue];

      if (v19 == v21)
      {
        uint64_t v17 = 18;
      }
      else
      {
        long long v22 = [(NPWaldo *)self edgesGeneration];
        int v23 = [v22 unsignedIntValue];

        if (v23 == 1) {
          uint64_t v17 = 43;
        }
        else {
          uint64_t v17 = 44;
        }
      }
    }
    else
    {
      uint64_t v17 = 42;
    }
    [v6 setLastFallbackReason:v17];
  }
  [(NPWaldo *)self setShouldSave:1];
  [(NPWaldo *)self saveToKeychain];
  long long v24 = [(NPWaldo *)self configurationIdentifier];

  if (!v24)
  {
    id v25 = objc_alloc_init(MEMORY[0x1E4F29128]);
    [(NPWaldo *)self setConfigurationIdentifier:v25];
  }
  long long v26 = [NPKeyBag alloc];
  int64_t v27 = [(NPWaldo *)self currentEdgeIndex];
  uint64_t v28 = [(NPWaldo *)self generation];
  __int16 v29 = [(NPWaldo *)self identifier];
  id v30 = [(NPWaldo *)self updateHash];
  uint64_t v31 = [(NPKeyBag *)v26 initWithOnRamps:v7 currentNetworkInfo:v6 currentEdgeIndex:v27 currentEdgeList:v5 generation:v28 identifier:v29 updateHash:v30];
  [(NPWaldo *)self setKeybag:v31];

  char v32 = [(NPWaldo *)self keybag];

  if (v32)
  {
    if (!a3)
    {
      id v33 = [(NPWaldo *)self agent];
      [v33 setKeybag:0];
    }
    __int16 v34 = [(NPWaldo *)self keybag];
    long long v35 = [(NPWaldo *)self identifier];
    [v34 logWithMessage:@"pushCurrentDayPassesToKernel setting keybag in kernel" identifier:v35];

    uint64_t v36 = [(NPWaldo *)self keybag];
    [(NPWaldo *)self updateNetworkAgentWithKeybag:v36 networkInfo:v6];
  }
  else
  {
    uint64_t v37 = nplog_obj();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1A0FEE000, v37, OS_LOG_TYPE_ERROR, "Failed to create a keybag", buf, 2u);
    }
  }
}

- (void)removeDayPassesFromKernel
{
  uint64_t v3 = [(NPWaldo *)self agentRegistration];
  int v4 = [v3 isRegistered];

  if (v4)
  {
    uint64_t v5 = [NPKeyBag alloc];
    id v6 = [(NPWaldo *)self identifier];
    id v7 = [(NPWaldo *)self updateHash];
    int64_t v8 = [(NPKeyBag *)v5 initWithOnRamps:0 currentNetworkInfo:0 currentEdgeIndex:0 currentEdgeList:0 generation:0 identifier:v6 updateHash:v7];
    [(NPWaldo *)self setKeybag:v8];

    uint64_t v9 = [(NPWaldo *)self keybag];

    if (v9)
    {
      int v10 = [(NPWaldo *)self agent];
      [v10 setKeybag:0];

      id v11 = [(NPWaldo *)self keybag];
      [(NPWaldo *)self updateNetworkAgentWithKeybag:v11 networkInfo:0];
    }
  }
}

- (void)ageOutLatencyMap
{
  v41[2] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(NPWaldo *)self signatureLimit];
  if (v3)
  {
    int v4 = [(NPWaldo *)self signatureLimit];
    unint64_t v5 = [v4 unsignedIntegerValue];
  }
  else
  {
    unint64_t v5 = 50;
  }

  id v6 = [(NPWaldo *)self networkInformation];
  unint64_t v7 = [v6 count];

  if (v7 > v5)
  {
    int64_t v8 = [(NPWaldo *)self networkInformation];
    unint64_t v9 = [v8 count] - v5;

    int v10 = nplog_obj();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      id v11 = [(NPWaldo *)self identifier];
      uint64_t v12 = [(NPWaldo *)self networkInformation];
      *(_DWORD *)buf = 138413058;
      uint64_t v37 = v11;
      __int16 v38 = 2048;
      uint64_t v39 = [v12 count];
      __int16 v40 = 1024;
      LODWORD(v41[0]) = v5;
      WORD2(v41[0]) = 2048;
      *(void *)((char *)v41 + 6) = v9;
      _os_log_impl(&dword_1A0FEE000, v10, OS_LOG_TYPE_DEFAULT, "%@: Stored network signature count (%lu) exceeded max (%d), aging %ld network signature", buf, 0x26u);
    }
    int v13 = [(NPWaldo *)self networkInformation];
    unint64_t v14 = [v13 keysSortedByValueUsingSelector:sel_compareLastVisited_];

    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id v15 = v14;
    uint64_t v16 = [v15 countByEnumeratingWithState:&v31 objects:v35 count:16];
    if (v16)
    {
      uint64_t v18 = v16;
      uint64_t v19 = *(void *)v32;
      *(void *)&long long v17 = 138412802;
      long long v28 = v17;
LABEL_9:
      uint64_t v20 = 0;
      while (1)
      {
        if (*(void *)v32 != v19) {
          objc_enumerationMutation(v15);
        }
        uint64_t v21 = *(void *)(*((void *)&v31 + 1) + 8 * v20);
        long long v22 = [(NPWaldo *)self networkInformation];
        int v23 = [v22 objectForKeyedSubscript:v21];

        if (v23)
        {
          long long v24 = nplog_obj();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
          {
            long long v26 = [(NPWaldo *)self identifier];
            id v30 = [(NPWaldo *)self networkInformation];
            __int16 v29 = [v30 objectForKeyedSubscript:v21];
            int64_t v27 = [v29 lastVisited];
            *(_DWORD *)buf = v28;
            uint64_t v37 = v26;
            __int16 v38 = 2112;
            uint64_t v39 = v21;
            __int16 v40 = 2112;
            v41[0] = v27;
            _os_log_debug_impl(&dword_1A0FEE000, v24, OS_LOG_TYPE_DEBUG, "%@: Aging out network signature %@ (%@)", buf, 0x20u);
          }
          id v25 = [(NPWaldo *)self networkInformation];
          [v25 setObject:0 forKeyedSubscript:v21];

          if (!--v9) {
            break;
          }
        }
        if (v18 == ++v20)
        {
          uint64_t v18 = [v15 countByEnumeratingWithState:&v31 objects:v35 count:16];
          if (v18) {
            goto LABEL_9;
          }
          break;
        }
      }
    }
  }
}

- (BOOL)isLatenciesCompleteForNetwork:(id)a3
{
  uint64_t v70 = *MEMORY[0x1E4F143B8];
  int v4 = a3;
  if (v4
    || ([(NSDictionary *)self->_currentNetworkCharacteristics objectForKeyedSubscript:@"Signature"], (int v4 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    unint64_t v5 = [(NPWaldo *)self networkInformation];
    if (v5)
    {
      id v6 = [(NPWaldo *)self networkInformation];
      unint64_t v7 = [v6 objectForKeyedSubscript:v4];

      if (v7)
      {
        int64_t v8 = [v7 edgeLatencies];
        unint64_t v5 = v8;
        if (v8 && [v8 count])
        {
          unint64_t v9 = [(NPWaldo *)self probeTFO];
          int v10 = [v9 BOOLValue];

          long long v59 = 0u;
          long long v60 = 0u;
          if (v10) {
            id v11 = &unk_1EF43BE08;
          }
          else {
            id v11 = &unk_1EF43BE20;
          }
          long long v57 = 0uLL;
          long long v58 = 0uLL;
          uint64_t v12 = [(NPWaldo *)self edges];
          uint64_t v13 = [v12 countByEnumeratingWithState:&v57 objects:v69 count:16];
          if (v13)
          {
            uint64_t v14 = *(void *)v58;
            while (2)
            {
              uint64_t v15 = 0;
              uint64_t v43 = v13;
              do
              {
                if (*(void *)v58 != v14)
                {
                  uint64_t v16 = v15;
                  objc_enumerationMutation(v12);
                  uint64_t v15 = v16;
                }
                uint64_t v45 = v15;
                long long v17 = *(void **)(*((void *)&v57 + 1) + 8 * v15);
                uint64_t v18 = [v17 probeEndpoint];
                objc_opt_class();
                char isKindOfClass = objc_opt_isKindOfClass();

                if ((isKindOfClass & 1) == 0)
                {
                  BOOL v33 = 0;
                  goto LABEL_47;
                }
                uint64_t v20 = [v17 probeEndpoint];
                long long v53 = 0u;
                long long v54 = 0u;
                long long v55 = 0u;
                long long v56 = 0u;
                v48 = v20;
                uint64_t v21 = [v20 hosts];
                uint64_t v22 = [v21 countByEnumeratingWithState:&v53 objects:v68 count:16];
                if (v22)
                {
                  uint64_t v23 = *(void *)v54;
                  long long v46 = v21;
                  BOOL v47 = v12;
                  uint64_t v40 = *(void *)v54;
                  uint64_t v41 = v14;
                  while (2)
                  {
                    uint64_t v24 = 0;
                    uint64_t v42 = v22;
                    do
                    {
                      if (*(void *)v54 != v23)
                      {
                        uint64_t v25 = v24;
                        objc_enumerationMutation(v21);
                        uint64_t v24 = v25;
                      }
                      uint64_t v44 = v24;
                      id v26 = *(id *)(*((void *)&v53 + 1) + 8 * v24);
                      objc_opt_class();
                      if ((objc_opt_isKindOfClass() & 1) == 0) {
                        goto LABEL_45;
                      }
                      long long v51 = 0u;
                      long long v52 = 0u;
                      long long v49 = 0u;
                      long long v50 = 0u;
                      uint64_t v27 = [v11 countByEnumeratingWithState:&v49 objects:v67 count:16];
                      if (v27)
                      {
                        uint64_t v28 = v27;
                        uint64_t v29 = *(void *)v50;
LABEL_24:
                        uint64_t v30 = 0;
                        while (1)
                        {
                          if (*(void *)v50 != v29) {
                            objc_enumerationMutation(v11);
                          }
                          long long v31 = *(void **)(*((void *)&v49 + 1) + 8 * v30);
                          *(_WORD *)buf = 0;
                          buf[0] = [v31 BOOLValue];
                          long long v32 = [(NPWaldo *)self probeNoTFOCookie];
                          buf[1] = [v32 BOOLValue];

                          if (![(NPWaldo *)self isEndpointProbed:v26 parameters:buf latencies:v5 checkSampleSize:1 incompleteLatency:0])break; {
                          if (v28 == ++v30)
                          }
                          {
                            uint64_t v28 = [v11 countByEnumeratingWithState:&v49 objects:v67 count:16];
                            if (v28) {
                              goto LABEL_24;
                            }
                            goto LABEL_30;
                          }
                        }
LABEL_45:

                        BOOL v33 = 0;
                        uint64_t v12 = v47;
                        goto LABEL_47;
                      }
LABEL_30:

                      uint64_t v24 = v44 + 1;
                      uint64_t v14 = v41;
                      uint64_t v21 = v46;
                      uint64_t v12 = v47;
                      uint64_t v23 = v40;
                    }
                    while (v44 + 1 != v42);
                    uint64_t v22 = [v46 countByEnumeratingWithState:&v53 objects:v68 count:16];
                    if (v22) {
                      continue;
                    }
                    break;
                  }
                }

                uint64_t v15 = v45 + 1;
              }
              while (v45 + 1 != v43);
              uint64_t v13 = [v12 countByEnumeratingWithState:&v57 objects:v69 count:16];
              BOOL v33 = 1;
              if (v13) {
                continue;
              }
              break;
            }
          }
          else
          {
            BOOL v33 = 1;
          }
LABEL_47:

          long long v34 = nplog_obj();
          if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
          {
            uint64_t v36 = [(NPWaldo *)self identifier];
            uint64_t v37 = @"incomplete";
            *(_DWORD *)buf = 138412802;
            char v62 = v36;
            __int16 v63 = 2112;
            if (v33) {
              uint64_t v37 = @"complete";
            }
            double v64 = v37;
            __int16 v65 = 2112;
            double v66 = v4;
            _os_log_debug_impl(&dword_1A0FEE000, v34, OS_LOG_TYPE_DEBUG, "%@: %@ latencies for network %@", buf, 0x20u);
          }
          goto LABEL_40;
        }
      }
      else
      {
        unint64_t v5 = 0;
      }
    }
    else
    {
      unint64_t v7 = 0;
    }
    long long v34 = nplog_obj();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
    {
      __int16 v38 = [(NPWaldo *)self identifier];
      *(_DWORD *)buf = 138412546;
      char v62 = v38;
      __int16 v63 = 2112;
      double v64 = v4;
      _os_log_debug_impl(&dword_1A0FEE000, v34, OS_LOG_TYPE_DEBUG, "%@: No latencies for network %@", buf, 0x16u);
    }
    LOBYTE(v33) = 0;
LABEL_40:

    goto LABEL_41;
  }
  int v4 = nplog_obj();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    uint64_t v39 = [(NPWaldo *)self identifier];
    *(_DWORD *)buf = 138412290;
    char v62 = v39;
    _os_log_error_impl(&dword_1A0FEE000, v4, OS_LOG_TYPE_ERROR, "%@: Failed to check latency completeness, no signature", buf, 0xCu);
  }
  LOBYTE(v33) = 0;
LABEL_41:

  return v33;
}

- (void)handleUsageReport:(id)a3
{
  uint64_t v69 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    unsigned int v5 = [(NPWaldo *)self generation];
    if (v5 == [v4 keybagGeneration])
    {
      [(NPWaldo *)self cleanupStaleKeys];
      uint64_t v44 = [v4 rtt];
      os_log_t log = [v4 geohash];
      if ([log length])
      {
        id v6 = [(NPWaldo *)self locationManager];
        [v6 setCurrentGeohash:log];
      }
      uint64_t v7 = [v4 fallbackReason];
      unsigned int v43 = [v4 addressFamily];
      unsigned int v42 = [v4 edgeIndex];
      *(void *)char v67 = 0;
      *(void *)&v67[8] = v67;
      *(void *)&v67[16] = 0x2020000000;
      char v68 = 0;
      uint64_t v56 = 0;
      long long v57 = &v56;
      uint64_t v58 = 0x2020000000;
      char v59 = 0;
      uint64_t v52 = 0;
      long long v53 = &v52;
      uint64_t v54 = 0x2020000000;
      char v55 = 0;
      uint64_t v45 = v7;
      if (![(NPWaldo *)self isLatenciesCompleteForNetwork:0])
      {
        int64_t v8 = nplog_obj();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          unint64_t v9 = [(NPWaldo *)self identifier];
          *(_DWORD *)buf = 138412290;
          uint64_t v61 = (uint64_t)v9;
          _os_log_impl(&dword_1A0FEE000, v8, OS_LOG_TYPE_DEFAULT, "%@: Latency information incomplete for the current network, re-probing", buf, 0xCu);
        }
        *((unsigned char *)v57 + 24) = 1;
      }
      if (!+[NSPConnectionInfo shouldMoveToNextEdgeForFallbackReason:](NSPConnectionInfo, "shouldMoveToNextEdgeForFallbackReason:", [v4 fallbackReason])|| (objc_msgSend(v4, "dayPassUUID"), v10 = objc_claimAutoreleasedReturnValue(), BOOL v11 = v10 == 0, v10, v11))
      {
        uint64_t v21 = (const char *)v45;
        if (!*((unsigned char *)v57 + 24) && v44 != 0xFFFFFFFFLL)
        {
          BOOL v22 = [(NPWaldo *)self reprocessWithNewRTT:v44 reProbe:v57 + 3];
          *(unsigned char *)(*(void *)&v67[8] + 24) = v22;
          int v23 = *((unsigned char *)v57 + 24) || v22;
          if (v23 == 1)
          {
            uint64_t v24 = nplog_obj();
            if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v25 = [(NPWaldo *)self identifier];
              id v26 = (void *)v25;
              if (*((unsigned char *)v57 + 24)) {
                uint64_t v27 = "re-probing";
              }
              else {
                uint64_t v27 = "";
              }
              if (*(unsigned char *)(*(void *)&v67[8] + 24)) {
                uint64_t v28 = " refreshing day passes";
              }
              else {
                uint64_t v28 = "";
              }
              *(_DWORD *)buf = 138412802;
              uint64_t v61 = v25;
              __int16 v62 = 2080;
              __int16 v63 = v27;
              __int16 v64 = 2080;
              __int16 v65 = v28;
              _os_log_impl(&dword_1A0FEE000, v24, OS_LOG_TYPE_DEFAULT, "%@: Change in observed RTT, %s%s", buf, 0x20u);
            }
            uint64_t v21 = (const char *)v45;
          }
        }
        if (!*(unsigned char *)(*(void *)&v67[8] + 24))
        {
          BOOL v29 = [(NPWaldo *)self shouldPerformDayPassRefresh];
          *(unsigned char *)(*(void *)&v67[8] + 24) = v29;
        }
      }
      else
      {
        long long v50 = 0u;
        long long v51 = 0u;
        long long v48 = 0u;
        long long v49 = 0u;
        uint64_t v12 = [(NPWaldo *)self allOnRamps];
        uint64_t v13 = [v12 countByEnumeratingWithState:&v48 objects:v66 count:16];
        if (v13)
        {
          uint64_t v14 = *(void *)v49;
          while (2)
          {
            for (uint64_t i = 0; i != v13; ++i)
            {
              if (*(void *)v49 != v14) {
                objc_enumerationMutation(v12);
              }
              uint64_t v16 = *(void **)(*((void *)&v48 + 1) + 8 * i);
              long long v17 = [v16 dayPassUUID];
              uint64_t v18 = [v4 dayPassUUID];
              int v19 = [v17 isEqual:v18];

              if (v19)
              {
                if (([v16 isDayPassExpired] & 1) != 0 || v45 == 23 || v45 == 5) {
                  *(unsigned char *)(*(void *)&v67[8] + 24) = 1;
                }
                uint64_t v30 = nplog_obj();
                if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
                {
                  long long v31 = [(NPWaldo *)self identifier];
                  long long v32 = [v4 dayPassUUID];
                  *(_DWORD *)buf = 138412546;
                  uint64_t v61 = (uint64_t)v31;
                  __int16 v62 = 2112;
                  __int16 v63 = v32;
                  _os_log_impl(&dword_1A0FEE000, v30, OS_LOG_TYPE_DEFAULT, "%@: Invalidating day pass %@", buf, 0x16u);
                }
                [v16 invalidateDayPass];
                goto LABEL_46;
              }
            }
            uint64_t v13 = [v12 countByEnumeratingWithState:&v48 objects:v66 count:16];
            if (v13) {
              continue;
            }
            break;
          }
        }
LABEL_46:

        [(NPWaldo *)self setCurrentEdgeIndex:v42];
        BOOL v33 = [(NPWaldo *)self currentNetworkInfo];
        long long v34 = v33;
        if (v33) {
          [v33 setLastFallbackReason:45];
        }
        [(NPWaldo *)self pushKeybagToKernel];
        *((unsigned char *)v53 + 24) = 1;

        uint64_t v21 = (const char *)v45;
      }
      if (v21 == (const char *)26)
      {
        long long v35 = nplog_obj();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v36 = [(NPWaldo *)self identifier];
          *(_DWORD *)buf = 138412546;
          uint64_t v61 = (uint64_t)v36;
          __int16 v62 = 1024;
          LODWORD(v63) = v43;
          _os_log_impl(&dword_1A0FEE000, v35, OS_LOG_TYPE_DEFAULT, "%@: client reports that TFO failed, marking TFO as failed for current latency map where address family = %d", buf, 0x12u);
        }
        uint64_t v37 = [(NPWaldo *)self currentNetworkInfo];
        [v37 handleTFOFailedForAddressFamily:v43];
        [(NPWaldo *)self rebuildLatencyMapAllSignatures:0];
        *((unsigned char *)v53 + 24) = 1;

        uint64_t v21 = (const char *)v45;
      }
      if (+[NSPConnectionInfo shouldResolveForFallbackReason:v21])
      {
        __int16 v38 = nplog_obj();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v39 = [(NPWaldo *)self identifier];
          uint64_t v40 = +[NSPConnectionInfo getFallbackReasonDescription:v21];
          *(_DWORD *)buf = 138412802;
          uint64_t v61 = (uint64_t)v39;
          __int16 v62 = 2048;
          __int16 v63 = v21;
          __int16 v64 = 2112;
          __int16 v65 = v40;
          _os_log_impl(&dword_1A0FEE000, v38, OS_LOG_TYPE_DEFAULT, "%@: usage update contains fallback reason %ld (%@), un-resolving edges", buf, 0x20u);
        }
        [(NPWaldo *)self setReResolve:1];
      }
      if (*((unsigned char *)v57 + 24) || *(unsigned char *)(*(void *)&v67[8] + 24) || *((unsigned char *)v53 + 24)) {
        [(NPWaldo *)self setReResolve:1];
      }
      uint64_t v41 = [(NPWaldo *)self edgesGeneration];
      [(NPWaldo *)self setUsedEdgesGeneration:v41];

      v47[0] = MEMORY[0x1E4F143A8];
      v47[1] = 3221225472;
      v47[2] = __29__NPWaldo_handleUsageReport___block_invoke;
      v47[3] = &unk_1E5A3C220;
      v47[4] = self;
      v47[5] = &v56;
      v47[6] = v67;
      v47[7] = &v52;
      v47[8] = v44;
      [(NPWaldo *)self resolveWithCompletionHandler:v47];
      _Block_object_dispose(&v52, 8);
      _Block_object_dispose(&v56, 8);
      _Block_object_dispose(v67, 8);
    }
    else
    {
      nplog_obj();
      os_log_t log = (os_log_t)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v20 = [(NPWaldo *)self identifier];
        *(_DWORD *)char v67 = 138412802;
        *(void *)&v67[4] = v20;
        *(_WORD *)&v67[12] = 1024;
        *(_DWORD *)&v67[14] = [v4 keybagGeneration];
        *(_WORD *)&v67[18] = 1024;
        *(_DWORD *)&v67[20] = [(NPWaldo *)self generation];
        _os_log_impl(&dword_1A0FEE000, log, OS_LOG_TYPE_DEFAULT, "%@: Usage report keybag generation (%u) != current keybag generation (%u), ignoring report", v67, 0x18u);
      }
    }
  }
}

uint64_t __29__NPWaldo_handleUsageReport___block_invoke(uint64_t a1, int a2, int a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    if (a3)
    {
      [*(id *)(a1 + 32) linkAllSignatures:0];
      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [*(id *)(a1 + 32) isLatenciesCompleteForNetwork:0] ^ 1;
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [*(id *)(a1 + 32) shouldPerformDayPassRefresh];
      *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
    }
    id v4 = *(void **)(a1 + 32);
    uint64_t v5 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
    uint64_t v6 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
    uint64_t v7 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
    uint64_t v8 = *(void *)(a1 + 64);
    return [v4 updateMetaDataNeedProbe:v5 refresh:v6 push:v7 minRTT:v8];
  }
  else
  {
    int v10 = nplog_obj();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      BOOL v11 = [*(id *)(a1 + 32) identifier];
      int v12 = 138412290;
      uint64_t v13 = v11;
      _os_log_error_impl(&dword_1A0FEE000, v10, OS_LOG_TYPE_ERROR, "%@: resolution failed while handling a usage update", (uint8_t *)&v12, 0xCu);
    }
    [*(id *)(a1 + 32) setReResolve:1];
    [*(id *)(a1 + 32) linkAllSignatures:0];
    return [*(id *)(a1 + 32) pushKeybagToKernel];
  }
}

- (void)updateMetaDataNeedProbe:(BOOL)a3 refresh:(BOOL)a4 push:(BOOL)a5 minRTT:(unint64_t)a6
{
  BOOL v7 = a5;
  BOOL v8 = a4;
  BOOL v9 = a3;
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  BOOL v11 = [(NPWaldo *)self locationManager];
  int v12 = [v11 shouldCheckLocation];

  if (v12)
  {
    uint64_t v13 = nplog_obj();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v14 = [(NPWaldo *)self identifier];
      *(_DWORD *)buf = 138412290;
      long long v34 = v14;
      _os_log_impl(&dword_1A0FEE000, v13, OS_LOG_TYPE_DEFAULT, "%@: Location condition changed, re-evaluate view", buf, 0xCu);
    }
    goto LABEL_6;
  }
  if (v9)
  {
LABEL_6:
    uint64_t v15 = [(NPWaldo *)self locationManager];
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __55__NPWaldo_updateMetaDataNeedProbe_refresh_push_minRTT___block_invoke;
    v29[3] = &unk_1E5A3C270;
    BOOL v30 = v9;
    BOOL v31 = v8;
    BOOL v32 = v7;
    v29[4] = self;
    v29[5] = a6;
    [v15 sortEdgesByDistanceWithCompletionHandler:v29];

    char v16 = 1;
    goto LABEL_16;
  }
  if (v8)
  {
    long long v17 = nplog_obj();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v18 = [(NPWaldo *)self identifier];
      *(_DWORD *)buf = 138412290;
      long long v34 = v18;
      _os_log_impl(&dword_1A0FEE000, v17, OS_LOG_TYPE_DEFAULT, "%@: One or more day passes has expired, refreshing", buf, 0xCu);
    }
    [(NPWaldo *)self refreshDayPassesWithCompletionHandler:0];
  }
  else if (v7)
  {
    int v19 = nplog_obj();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v20 = [(NPWaldo *)self identifier];
      *(_DWORD *)buf = 138412290;
      long long v34 = v20;
      _os_log_impl(&dword_1A0FEE000, v19, OS_LOG_TYPE_DEFAULT, "%@: Pushing keybag to the kernel", buf, 0xCu);
    }
    [(NPWaldo *)self pushKeybagToKernel];
  }
  char v16 = 0;
LABEL_16:
  uint64_t v21 = [(NSDictionary *)self->_currentNetworkCharacteristics objectForKeyedSubscript:@"Signature"];
  if (v21)
  {
    BOOL v22 = [(NPWaldo *)self networkInformation];
    int v23 = [v22 objectForKeyedSubscript:v21];

    if (!v23)
    {
      uint64_t v24 = objc_alloc_init(NPNetworkInfo);
      uint64_t v25 = [(NPWaldo *)self networkInformation];
      [v25 setObject:v24 forKeyedSubscript:v21];
    }
    id v26 = [(NPWaldo *)self networkInformation];
    uint64_t v27 = [v26 objectForKeyedSubscript:v21];

    if (v27)
    {
      id v28 = objc_alloc_init(MEMORY[0x1E4F1C9C8]);
      [v27 setLastUsed:v28];
    }
  }
  if ((v16 & 1) == 0) {
    [(NPWaldo *)self updateEdgeSelection:a6];
  }
  [(NPWaldo *)self saveToKeychain];
}

uint64_t __55__NPWaldo_updateMetaDataNeedProbe_refresh_push_minRTT___block_invoke(uint64_t a1, char a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = [*(id *)(a1 + 32) currentEdgeList];
  if (![v4 count] || *(unsigned char *)(a1 + 48) && (a2 & 1) != 0)
  {

LABEL_5:
    uint64_t v5 = *(void **)(a1 + 32);
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __55__NPWaldo_updateMetaDataNeedProbe_refresh_push_minRTT___block_invoke_2;
    v12[3] = &unk_1E5A3C248;
    v12[4] = v5;
    return [v5 reprocessWithCompletionHandler:v12];
  }
  if (*(unsigned char *)(a1 + 48))
  {
    BOOL v7 = [*(id *)(a1 + 32) cachedLocation];

    if (!v7) {
      goto LABEL_5;
    }
  }
  else
  {
  }
  if (*(unsigned char *)(a1 + 49))
  {
    BOOL v8 = nplog_obj();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v9 = [*(id *)(a1 + 32) identifier];
      *(_DWORD *)buf = 138412290;
      uint64_t v14 = v9;
      _os_log_impl(&dword_1A0FEE000, v8, OS_LOG_TYPE_DEFAULT, "%@: Not re-probing, check for day pass refresh", buf, 0xCu);
    }
    [*(id *)(a1 + 32) refreshDayPassesWithCompletionHandler:0];
  }
  else if (*(unsigned char *)(a1 + 50))
  {
    int v10 = nplog_obj();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v11 = [*(id *)(a1 + 32) identifier];
      *(_DWORD *)buf = 138412290;
      uint64_t v14 = v11;
      _os_log_impl(&dword_1A0FEE000, v10, OS_LOG_TYPE_DEFAULT, "%@: Pushing keybag to the kernel", buf, 0xCu);
    }
    [*(id *)(a1 + 32) pushKeybagToKernel];
  }
  return [*(id *)(a1 + 32) updateEdgeSelection:*(void *)(a1 + 40)];
}

uint64_t __55__NPWaldo_updateMetaDataNeedProbe_refresh_push_minRTT___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) edgeCount];
  uint64_t v3 = *(void **)(a1 + 32);
  if (v2)
  {
    return [v3 refreshDayPassesWithCompletionHandler:0];
  }
  else
  {
    return [v3 pushKeybagToKernel];
  }
}

- (int64_t)indexOfBestEdge
{
  uint64_t v3 = [(NPWaldo *)self currentEdgeList];
  if (v3 && [(NPWaldo *)self dayPassFetchCount] >= 1)
  {
    int64_t v4 = 0;
    while (1)
    {
      uint64_t v5 = [(NPWaldo *)self edgeAtIndex:v4];
      uint64_t v6 = [v3 objectAtIndexedSubscript:v4];
      BOOL v7 = [v5 getCurrentOnRamp:v6];

      if (v7)
      {
        if (([v7 isDayPassExpired] & 1) == 0) {
          break;
        }
      }

      if (++v4 >= [(NPWaldo *)self dayPassFetchCount]) {
        goto LABEL_7;
      }
    }
  }
  else
  {
LABEL_7:
    int64_t v4 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v4;
}

- (int64_t)dayPassFetchCount
{
  uint64_t v3 = [(NPWaldo *)self currentEdgeList];
  int64_t v4 = v3;
  if (v3 && [v3 count])
  {
    unint64_t v5 = [v4 count];
    uint64_t v6 = [(NPWaldo *)self dayPassSoftExpiry];
    if (v5 >= [v6 count])
    {
      BOOL v8 = [(NPWaldo *)self dayPassSoftExpiry];
      int64_t v7 = [v8 count];
    }
    else
    {
      int64_t v7 = [v4 count];
    }
  }
  else
  {
    int64_t v7 = 0;
  }

  return v7;
}

- (NPTuscanyEdge)currentEdge
{
  int64_t v3 = [(NPWaldo *)self currentEdgeIndex];
  if (v3 >= [(NPWaldo *)self dayPassFetchCount])
  {
    int64_t v4 = 0;
  }
  else
  {
    int64_t v4 = [(NPWaldo *)self edgeAtIndex:[(NPWaldo *)self currentEdgeIndex]];
  }
  return (NPTuscanyEdge *)v4;
}

- (BOOL)shouldPerformDayPassRefresh
{
  if (![(NPWaldo *)self edgeCount])
  {
LABEL_10:
    LOBYTE(v10) = 1;
    return v10;
  }
  if ([(NPWaldo *)self dayPassFetchCount] >= 1)
  {
    uint64_t v3 = 0;
    while (1)
    {
      int64_t v4 = [(NPWaldo *)self edgeAtIndex:v3];
      unint64_t v5 = [(NPWaldo *)self currentEdgeList];
      uint64_t v6 = [v5 objectAtIndexedSubscript:v3];
      int64_t v7 = [v4 getCurrentOnRamp:v6];

      if (!v7) {
        break;
      }
      BOOL v8 = [(NPWaldo *)self dayPassSoftExpiry];
      BOOL v9 = [v8 objectAtIndexedSubscript:v3];
      [v9 doubleValue];
      int v10 = objc_msgSend(v7, "isDayPassPastExpiry:");

      if (!v10 && ++v3 < [(NPWaldo *)self dayPassFetchCount]) {
        continue;
      }
      return v10;
    }

    goto LABEL_10;
  }
  LOBYTE(v10) = 0;
  return v10;
}

- (void)timestampNetworkSignature:(id)a3
{
  id v20 = a3;
  int64_t v4 = [(NPWaldo *)self networkInformation];

  if (!v4)
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    [(NPWaldo *)self setNetworkInformation:v5];
  }
  uint64_t v6 = [(NSDictionary *)self->_currentNetworkCharacteristics objectForKeyedSubscript:@"Signature"];
  if (v6)
  {
    int64_t v7 = [(NPWaldo *)self networkInformation];
    BOOL v8 = [v7 objectForKeyedSubscript:v6];

    if (v8)
    {
      BOOL v9 = [MEMORY[0x1E4F1C9C8] date];
      int v10 = [(NPWaldo *)self networkInformation];
      BOOL v11 = [v10 objectForKeyedSubscript:v6];
      [v11 setLastVisited:v9];
    }
  }
  if (v20)
  {
    int v12 = [v20 objectForKeyedSubscript:@"Signature"];

    if (v12)
    {
      uint64_t v13 = [(NPWaldo *)self networkInformation];
      uint64_t v14 = [v13 objectForKeyedSubscript:v12];

      if (!v14)
      {
        uint64_t v15 = objc_alloc_init(NPNetworkInfo);
        char v16 = [(NPWaldo *)self networkInformation];
        [v16 setObject:v15 forKeyedSubscript:v12];
      }
      long long v17 = [MEMORY[0x1E4F1C9C8] date];
      uint64_t v18 = [(NPWaldo *)self networkInformation];
      int v19 = [v18 objectForKeyedSubscript:v12];
      [v19 setLastVisited:v17];
    }
  }
  else
  {
    int v12 = v6;
  }
}

- (void)setCurrentNetworkCharacteristics:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = nplog_obj();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int64_t v7 = [(NPWaldo *)self identifier];
    id v8 = +[NPUtilities copyNetworkDescription:v5];
    int v9 = 138412546;
    int v10 = v7;
    __int16 v11 = 2112;
    id v12 = v8;
    _os_log_impl(&dword_1A0FEE000, v6, OS_LOG_TYPE_DEFAULT, "%@: Waldo info setting current network characteristics to %@", (uint8_t *)&v9, 0x16u);
  }
  if (v5)
  {
    [(NPWaldo *)self cancelProbes];
    [(NPWaldo *)self timestampNetworkSignature:v5];
    objc_storeStrong((id *)&self->_currentNetworkCharacteristics, a3);
    [(NPWaldo *)self setReResolve:1];
  }
}

- (int64_t)getCurrentNetworkInterfaceType
{
  currentNetworkCharacteristics = self->_currentNetworkCharacteristics;
  if (!currentNetworkCharacteristics) {
    return 0;
  }
  uint64_t v3 = [(NSDictionary *)currentNetworkCharacteristics objectForKeyedSubscript:@"InterfaceType"];
  int64_t v4 = v3;
  if (v3) {
    int64_t v5 = [v3 integerValue];
  }
  else {
    int64_t v5 = 0;
  }

  return v5;
}

- (void)cancelProbes
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if ([(NPWaldo *)self reprocessPending])
  {
    [(NPWaldo *)self setReprocessCancelled:1];
    uint64_t v3 = [(NSDictionary *)self->_currentNetworkCharacteristics objectForKeyedSubscript:@"Signature"];
    if (v3)
    {
      int64_t v4 = [(NPWaldo *)self networkInformation];
      int64_t v5 = [v4 objectForKeyedSubscript:v3];
      [v5 setProbeRateLimit:0];
    }
    uint64_t v6 = nplog_obj();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      int v9 = [(NPWaldo *)self identifier];
      int v10 = 138412290;
      __int16 v11 = v9;
      _os_log_debug_impl(&dword_1A0FEE000, v6, OS_LOG_TYPE_DEBUG, "%@: Cancelling probe", (uint8_t *)&v10, 0xCu);
    }
  }
  int64_t v7 = [(NPWaldo *)self reprocessSamplingTimer];

  if (v7)
  {
    id v8 = [(NPWaldo *)self reprocessSamplingTimer];
    dispatch_source_cancel(v8);

    [(NPWaldo *)self setReprocessSamplingTimer:0];
  }
}

- (void)initializeEdgeSelection
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(NPWaldo *)self edgeSelectionEnabled];
  int v4 = [v3 BOOLValue];

  if (v4)
  {
    int64_t v5 = [(NSDictionary *)self->_currentNetworkCharacteristics objectForKeyedSubscript:@"Signature"];
    if (v5)
    {
      uint64_t v6 = [(NSDictionary *)self->_currentNetworkCharacteristics objectForKeyedSubscript:@"InterfaceType"];
      int64_t v7 = [[NPEdgeSelection alloc] initWithWaldo:self signature:v5 interfaceType:v6];
      if (v7)
      {
        id v8 = [(NPWaldo *)self networkInformation];
        int v9 = [v8 objectForKeyedSubscript:v5];

        if (!v9)
        {
          int v10 = objc_alloc_init(NPNetworkInfo);
          __int16 v11 = [(NPWaldo *)self networkInformation];
          [v11 setObject:v10 forKeyedSubscript:v5];
        }
        uint64_t v12 = [(NPWaldo *)self networkInformation];
        uint64_t v13 = [v12 objectForKeyedSubscript:v5];
        [v13 setEdgeSelection:v7];
      }
      else
      {
        uint64_t v12 = nplog_obj();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          int v14 = 138412546;
          uint64_t v15 = v5;
          __int16 v16 = 2112;
          long long v17 = v6;
          _os_log_error_impl(&dword_1A0FEE000, v12, OS_LOG_TYPE_ERROR, "Edge selection initialize failed for %@ (%@)", (uint8_t *)&v14, 0x16u);
        }
      }
    }
    else
    {
      uint64_t v6 = nplog_obj();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v14) = 0;
        _os_log_error_impl(&dword_1A0FEE000, v6, OS_LOG_TYPE_ERROR, "Edge selection initialize, no current network characteristics", (uint8_t *)&v14, 2u);
      }
    }
  }
}

- (void)updateEdgeSelection:(unint64_t)a3
{
  int64_t v5 = [(NPWaldo *)self edgeSelectionEnabled];
  int v6 = [v5 BOOLValue];

  if (v6)
  {
    int64_t v7 = [(NSDictionary *)self->_currentNetworkCharacteristics objectForKeyedSubscript:@"Signature"];
    if (v7)
    {
      id v8 = [(NPWaldo *)self networkInformation];
      int v9 = [v8 objectForKeyedSubscript:v7];
      int v10 = [v9 edgeSelection];

      if (v10)
      {
        __int16 v11 = [(NPWaldo *)self networkInformation];
        uint64_t v12 = [v11 objectForKeyedSubscript:v7];
        uint64_t v13 = [v12 edgeSelection];
        [v13 updateEdgeSelection:a3];

LABEL_9:
        return;
      }
      int v14 = nplog_obj();
      if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
LABEL_8:

        goto LABEL_9;
      }
      __int16 v17 = 0;
      uint64_t v15 = "Edge selection update, no edge selection";
      __int16 v16 = (uint8_t *)&v17;
    }
    else
    {
      int v14 = nplog_obj();
      if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        goto LABEL_8;
      }
      __int16 v18 = 0;
      uint64_t v15 = "Edge selection update, no current network characteristics";
      __int16 v16 = (uint8_t *)&v18;
    }
    _os_log_error_impl(&dword_1A0FEE000, v14, OS_LOG_TYPE_ERROR, v15, v16, 2u);
    goto LABEL_8;
  }
}

- (id)copyEdgeSelectionTelemetry
{
  uint64_t v3 = [(NPWaldo *)self edgeSelectionEnabled];
  int v4 = [v3 BOOLValue];

  if (!v4) {
    return 0;
  }
  int64_t v5 = [(NSDictionary *)self->_currentNetworkCharacteristics objectForKeyedSubscript:@"Signature"];
  if (v5)
  {
    int v6 = [(NPWaldo *)self networkInformation];
    int64_t v7 = [v6 objectForKeyedSubscript:v5];
    id v8 = [v7 edgeSelection];
    int v9 = (void *)[v8 copyEdgeSelectionTelemetry];
  }
  else
  {
    int v10 = nplog_obj();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)uint64_t v12 = 0;
      _os_log_error_impl(&dword_1A0FEE000, v10, OS_LOG_TYPE_ERROR, "Edge selection initialize, no current network characteristics", v12, 2u);
    }

    int v9 = 0;
  }

  return v9;
}

- (void)reprocessWithCompletionHandler:(id)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  int v4 = (void (**)(id, void))a3;
  int64_t v5 = [(NPWaldo *)self enableLatencyDerivation];
  char v6 = [v5 BOOLValue];

  if ((v6 & 1) == 0)
  {
    __int16 v16 = nplog_obj();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      __int16 v17 = [(NPWaldo *)self identifier];
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = v17;
      _os_log_impl(&dword_1A0FEE000, v16, OS_LOG_TYPE_INFO, "%@: Latency derivation is disabled, not probing", buf, 0xCu);
    }
    goto LABEL_12;
  }
  currentNetworkCharacteristics = self->_currentNetworkCharacteristics;
  if (!currentNetworkCharacteristics)
  {
    __int16 v16 = nplog_obj();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v18 = [(NPWaldo *)self identifier];
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = v18;
      _os_log_impl(&dword_1A0FEE000, v16, OS_LOG_TYPE_DEFAULT, "%@: No current network characteristics, not probing", buf, 0xCu);
    }
LABEL_12:

    v4[2](v4, 0);
    goto LABEL_28;
  }
  id v8 = [(NSDictionary *)currentNetworkCharacteristics objectForKeyedSubscript:@"Signature"];
  if (v8)
  {
    int v9 = [(NPWaldo *)self networkInformation];
    int v10 = [v9 objectForKeyedSubscript:v8];

    if (v10)
    {
      __int16 v11 = [v10 probeRateLimit];
      if (v11
        && ([MEMORY[0x1E4F1C9C8] date],
            uint64_t v12 = objc_claimAutoreleasedReturnValue(),
            uint64_t v13 = [v11 compare:v12],
            v12,
            v13 == 1))
      {
        int v14 = nplog_obj();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v15 = [(NPWaldo *)self identifier];
          *(_DWORD *)buf = 138412546;
          *(void *)&uint8_t buf[4] = v15;
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = v11;
          _os_log_impl(&dword_1A0FEE000, v14, OS_LOG_TYPE_DEFAULT, "%@: Skipping re-probing of edges because the re-probe date (%@) has not passed", buf, 0x16u);
        }
        v4[2](v4, 0);
      }
      else
      {
        id v20 = nplog_obj();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v21 = [(NPWaldo *)self identifier];
          *(_DWORD *)buf = 138412546;
          *(void *)&uint8_t buf[4] = v21;
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = v11;
          _os_log_impl(&dword_1A0FEE000, v20, OS_LOG_TYPE_DEFAULT, "%@: Re-probe date (%@) has passed, re-probing edges", buf, 0x16u);
        }
        id v22 = objc_alloc(MEMORY[0x1E4F1C9C8]);
        int v23 = [(NPWaldo *)self probePause];
        [v23 doubleValue];
        uint64_t v24 = objc_msgSend(v22, "initWithTimeIntervalSinceNow:");
        [v10 setProbeRateLimit:v24];

        [v10 setIsProbeInProgress:1];
        [(NPWaldo *)self setShouldSave:1];
        [(NPWaldo *)self saveToKeychain];
        *(void *)buf = 0;
        *(void *)&uint8_t buf[8] = buf;
        *(void *)&uint8_t buf[16] = 0x3032000000;
        uint64_t v35 = __Block_byref_object_copy__4;
        uint64_t v36 = __Block_byref_object_dispose__4;
        id v37 = (id)os_transaction_create();
        v28[0] = MEMORY[0x1E4F143A8];
        v28[1] = 3221225472;
        v28[2] = __42__NPWaldo_reprocessWithCompletionHandler___block_invoke;
        v28[3] = &unk_1E5A3C298;
        id v29 = v10;
        BOOL v30 = self;
        id v31 = v8;
        BOOL v32 = v4;
        BOOL v33 = buf;
        [(NPWaldo *)self reprocessEdgeAtIndex:0xFFFFFFFFLL networkSignature:v31 completionHandler:v28];

        _Block_object_dispose(buf, 8);
      }
    }
    else
    {
      uint64_t v25 = nplog_obj();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        uint64_t v27 = [(NPWaldo *)self identifier];
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = v27;
        _os_log_error_impl(&dword_1A0FEE000, v25, OS_LOG_TYPE_ERROR, "%@: No network info available for the current network signature, cannot probe", buf, 0xCu);
      }
      v4[2](v4, 0);
    }
  }
  else
  {
    int v19 = nplog_obj();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      id v26 = [(NPWaldo *)self identifier];
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = v26;
      _os_log_error_impl(&dword_1A0FEE000, v19, OS_LOG_TYPE_ERROR, "%@: No network signature available, cannot probe", buf, 0xCu);
    }
    v4[2](v4, 0);
  }

LABEL_28:
}

void __42__NPWaldo_reprocessWithCompletionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v10 = a2;
  [*(id *)(a1 + 32) setIsProbeInProgress:0];
  int64_t v5 = *(void **)(a1 + 32);
  if (a3)
  {
    [v5 setLastFallbackReason:a3];
    if ([v10 count])
    {
      [*(id *)(a1 + 40) mergeEdgeList:v10 forNetworkSignature:*(void *)(a1 + 48)];
      [*(id *)(a1 + 40) setShouldSave:1];
      [*(id *)(a1 + 40) saveToKeychain];
    }
  }
  else
  {
    [v5 setLastFallbackReason:0];
    if ([v10 count])
    {
      [*(id *)(a1 + 40) loadObservedRTTSamples:v10];
      [*(id *)(a1 + 40) mergeEdgeList:v10 forNetworkSignature:*(void *)(a1 + 48)];
      uint64_t v6 = 1;
      goto LABEL_7;
    }
  }
  uint64_t v6 = 0;
LABEL_7:
  int64_t v7 = [*(id *)(a1 + 40) delegate];
  [v7 waldo:*(void *)(a1 + 40) didFinishProbingWithSuccess:v6];

  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  uint64_t v8 = *(void *)(*(void *)(a1 + 64) + 8);
  int v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = 0;
}

- (void)reprocessAdHocWithEdgeIndex:(unint64_t)a3 completionHandler:(id)a4
{
  id v6 = a4;
  int64_t v7 = [(NSDictionary *)self->_currentNetworkCharacteristics objectForKeyedSubscript:@"Signature"];
  v12[0] = 0;
  v12[1] = v12;
  v12[2] = 0x3032000000;
  v12[3] = __Block_byref_object_copy__4;
  v12[4] = __Block_byref_object_dispose__4;
  id v13 = (id)os_transaction_create();
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __57__NPWaldo_reprocessAdHocWithEdgeIndex_completionHandler___block_invoke;
  v9[3] = &unk_1E5A3C2C0;
  v9[4] = self;
  id v8 = v6;
  id v10 = v8;
  __int16 v11 = v12;
  [(NPWaldo *)self reprocessEdgeAtIndex:a3 networkSignature:v7 completionHandler:v9];

  _Block_object_dispose(v12, 8);
}

void __57__NPWaldo_reprocessAdHocWithEdgeIndex_completionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v10 = v5;
  if (a3 || ![v5 count])
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    id v6 = [*(id *)(a1 + 32) latencyComparator];
    int64_t v7 = [v10 sortedArrayUsingComparator:v6];

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  uint64_t v8 = *(void *)(*(void *)(a1 + 48) + 8);
  int v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = 0;
}

- (void)reprocessEdgeAtIndex:(unint64_t)a3 networkSignature:(id)a4 completionHandler:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = [(NPWaldo *)self reprocessQueue];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __67__NPWaldo_reprocessEdgeAtIndex_networkSignature_completionHandler___block_invoke;
  v13[3] = &unk_1E5A3C310;
  v13[4] = self;
  id v14 = v8;
  id v15 = v9;
  unint64_t v16 = a3;
  id v11 = v8;
  id v12 = v9;
  dispatch_async(v10, v13);
}

void __67__NPWaldo_reprocessEdgeAtIndex_networkSignature_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) reprocessQueue];
  dispatch_suspend(v2);

  uint64_t v3 = NPGetInternalQueue();
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __67__NPWaldo_reprocessEdgeAtIndex_networkSignature_completionHandler___block_invoke_2;
  v6[3] = &unk_1E5A3C310;
  v6[4] = *(void *)(a1 + 32);
  id v8 = *(id *)(a1 + 48);
  id v4 = *(id *)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 56);
  id v7 = v4;
  uint64_t v9 = v5;
  dispatch_async(v3, v6);
}

void __67__NPWaldo_reprocessEdgeAtIndex_networkSignature_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) delegate];
  char v3 = [v2 hasNetworkPath];

  if (v3)
  {
    id v4 = [*(id *)(*(void *)(a1 + 32) + 8) objectForKeyedSubscript:@"Signature"];
    if ([*(id *)(a1 + 40) isEqual:v4])
    {
      uint64_t v22 = 0;
      uint64_t v5 = [*(id *)(a1 + 32) createEdgeLatenciesToProbeWithEdgeIndex:*(void *)(a1 + 56) startSampleCount:&v22];
      uint64_t v6 = [v5 count];
      id v7 = nplog_obj();
      id v8 = v7;
      if (v6)
      {
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
        {
          __int16 v17 = [*(id *)(a1 + 32) identifier];
          *(_DWORD *)buf = 138412802;
          uint64_t v24 = v17;
          __int16 v25 = 2048;
          uint64_t v26 = v22;
          __int16 v27 = 2112;
          id v28 = v5;
          _os_log_debug_impl(&dword_1A0FEE000, v8, OS_LOG_TYPE_DEBUG, "%@: probing latency list starting at %luth sample: %@", buf, 0x20u);
        }
        [*(id *)(a1 + 32) setReprocessPending:1];
        [*(id *)(a1 + 32) setReprocessCancelled:0];
        uint64_t v9 = *(void **)(a1 + 32);
        uint64_t v10 = v22;
        v19[0] = MEMORY[0x1E4F143A8];
        v19[1] = 3221225472;
        v19[2] = __67__NPWaldo_reprocessEdgeAtIndex_networkSignature_completionHandler___block_invoke_909;
        v19[3] = &unk_1E5A3C2E8;
        v19[4] = v9;
        id v20 = v5;
        id v21 = *(id *)(a1 + 48);
        [v9 reprocessLatencies:v20 sampleCount:v10 completionHandler:v19];
      }
      else
      {
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        {
          __int16 v18 = [*(id *)(a1 + 32) identifier];
          *(_DWORD *)buf = 138412290;
          uint64_t v24 = v18;
          _os_log_error_impl(&dword_1A0FEE000, v8, OS_LOG_TYPE_ERROR, "%@: no probe endpoints to probe", buf, 0xCu);
        }
        (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
        unint64_t v16 = [*(id *)(a1 + 32) reprocessQueue];
        dispatch_resume(v16);
      }
    }
    else
    {
      id v13 = nplog_obj();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        id v14 = [*(id *)(a1 + 32) identifier];
        *(_DWORD *)buf = 138412290;
        uint64_t v24 = v14;
        _os_log_impl(&dword_1A0FEE000, v13, OS_LOG_TYPE_DEFAULT, "%@: Network signature has changed since probing was initiated, not probing", buf, 0xCu);
      }
      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
      id v15 = [*(id *)(a1 + 32) reprocessQueue];
      dispatch_resume(v15);
    }
  }
  else
  {
    id v11 = nplog_obj();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      id v12 = [*(id *)(a1 + 32) identifier];
      *(_DWORD *)buf = 138412290;
      uint64_t v24 = v12;
      _os_log_impl(&dword_1A0FEE000, v11, OS_LOG_TYPE_DEFAULT, "%@: Skip RTT reprocess, no usable network path", buf, 0xCu);
    }
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    id v4 = [*(id *)(a1 + 32) reprocessQueue];
    dispatch_resume(v4);
  }
}

void __67__NPWaldo_reprocessEdgeAtIndex_networkSignature_completionHandler___block_invoke_909(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) setReprocessPending:0];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v2 = *(id *)(a1 + 40);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v9 + 1) + 8 * i);
        if (!objc_msgSend(v7, "TFOStatus", (void)v9)) {
          [v7 setTFOStatus:1];
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  id v8 = [*(id *)(a1 + 32) reprocessQueue];
  dispatch_resume(v8);
}

- (BOOL)isEndpointProbed:(id)a3 parameters:(networkParameters *)a4 latencies:(id)a5 checkSampleSize:(BOOL)a6 incompleteLatency:(id *)a7
{
  BOOL v8 = a6;
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  long long v11 = a3;
  id v12 = a5;
  id v13 = v12;
  if (v12)
  {
    uint64_t v14 = [v12 count];
    BOOL v15 = 0;
    if (v11 && v14)
    {
      BOOL v36 = v8;
      if (a7) {
        *a7 = 0;
      }
      uint64_t v35 = a7;
      long long v39 = 0u;
      long long v40 = 0u;
      long long v37 = 0u;
      long long v38 = 0u;
      unint64_t v16 = v13;
      uint64_t v17 = [(__CFString *)v16 countByEnumeratingWithState:&v37 objects:v47 count:16];
      if (v17)
      {
        uint64_t v18 = v17;
        uint64_t v19 = *(void *)v38;
LABEL_8:
        uint64_t v20 = 0;
        while (1)
        {
          if (*(void *)v38 != v19) {
            objc_enumerationMutation(v16);
          }
          id v21 = *(void **)(*((void *)&v37 + 1) + 8 * v20);
          uint64_t v22 = [v21 probeEndpoint];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            if ([v21 isMatched:v11 parameters:a4]) {
              break;
            }
          }

          if (v18 == ++v20)
          {
            uint64_t v18 = [(__CFString *)v16 countByEnumeratingWithState:&v37 objects:v47 count:16];
            if (v18) {
              goto LABEL_8;
            }
            goto LABEL_15;
          }
        }
        if (!v36 || [v21 isComplete:1])
        {
          int v23 = nplog_obj();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
          {
            __int16 v27 = [v21 connectionParametersString];
            id v28 = [v21 roundTripAverage];
            uint64_t v29 = [v28 samples];
            uint64_t v30 = [v29 count];
            *(_DWORD *)buf = 138412802;
            unsigned int v42 = v22;
            __int16 v43 = 2112;
            uint64_t v44 = v27;
            __int16 v45 = 2048;
            uint64_t v46 = v30;
            _os_log_debug_impl(&dword_1A0FEE000, v23, OS_LOG_TYPE_DEBUG, "Found complete latency for %@ <%@, sample size %lu>", buf, 0x20u);
          }
          BOOL v15 = 1;
          goto LABEL_27;
        }
        __int16 v25 = nplog_obj();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
        {
          id v31 = [v21 connectionParametersString];
          BOOL v32 = [v21 roundTripAverage];
          BOOL v33 = [v32 samples];
          uint64_t v34 = [v33 count];
          *(_DWORD *)buf = 138412802;
          unsigned int v42 = v22;
          __int16 v43 = 2112;
          uint64_t v44 = v31;
          __int16 v45 = 2048;
          uint64_t v46 = v34;
          _os_log_debug_impl(&dword_1A0FEE000, v25, OS_LOG_TYPE_DEBUG, "Found incomplete latency for %@ <%@, sample size %lu>", buf, 0x20u);
        }
        if (v35)
        {
          id v26 = v21;
          BOOL v15 = 0;
          id *v35 = v26;
          goto LABEL_27;
        }
      }
      else
      {
LABEL_15:

        if (a4)
        {
          unint64_t v16 = [NSString stringWithFormat:@"<TFO %d, NoCookie %d>", a4->var0, a4->var1];
        }
        else
        {
          unint64_t v16 = &stru_1EF4275C8;
        }
        uint64_t v22 = nplog_obj();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412546;
          unsigned int v42 = v11;
          __int16 v43 = 2112;
          uint64_t v44 = v16;
          _os_log_debug_impl(&dword_1A0FEE000, v22, OS_LOG_TYPE_DEBUG, "Latency not found for %@ %@", buf, 0x16u);
        }
      }
      BOOL v15 = 0;
LABEL_27:
    }
  }
  else
  {
    BOOL v15 = 0;
  }

  return v15;
}

- (id)createEdgeLatenciesToProbeWithEdgeIndex:(unint64_t)a3 startSampleCount:(unint64_t *)a4
{
  uint64_t v85 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = [(NPWaldo *)self reprocessSampleSize];
  unint64_t v66 = [v6 unsignedIntegerValue];

  id v7 = [(NPWaldo *)self currentNetworkInfo];
  char v55 = v7;
  if (v7)
  {
    BOOL v8 = [v7 edgeLatencies];
  }
  else
  {
    BOOL v8 = 0;
  }
  BOOL v9 = 0;
  if (a3)
  {
    if (a3 != 0xFFFFFFFF)
    {
      uint64_t v6 = [(NPWaldo *)self edges];
      BOOL v9 = [v6 count] > a3;
    }
    if (a3 != 0xFFFFFFFF) {
  }
    }
  if (v9)
  {
    unint64_t v10 = a3 + 1;
  }
  else
  {
    unint64_t v10 = [(NPWaldo *)self probeSize];
    a3 = 0;
  }
  long long v11 = [(NPWaldo *)self probeTFO];
  int v12 = [v11 BOOLValue];

  id v13 = &unk_1EF43BE50;
  if (v12) {
    id v13 = &unk_1EF43BE38;
  }
  id v65 = v13;
  if (a3 >= v10)
  {
    id v14 = 0;
LABEL_56:
    uint64_t v52 = 0;
    goto LABEL_57;
  }
  unint64_t v56 = v10;
  id v14 = 0;
  __int16 v63 = v8;
  do
  {
    BOOL v15 = [(NPWaldo *)self edges];
    unint64_t v16 = [v15 objectAtIndexedSubscript:a3];

    uint64_t v17 = [v16 probeEndpoint];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      uint64_t v19 = [v16 probeEndpoint];
      long long v73 = 0u;
      long long v74 = 0u;
      long long v75 = 0u;
      long long v76 = 0u;
      id obj = [v19 hosts];
      uint64_t v61 = [obj countByEnumeratingWithState:&v73 objects:v78 count:16];
      if (v61)
      {
        uint64_t v58 = *(void *)v74;
        char v59 = v19;
        long long v60 = v16;
        do
        {
          uint64_t v20 = 0;
          do
          {
            if (*(void *)v74 != v58) {
              objc_enumerationMutation(obj);
            }
            id v21 = *(id *)(*((void *)&v73 + 1) + 8 * v20);
            objc_opt_class();
            uint64_t v62 = v20;
            if (objc_opt_isKindOfClass())
            {
              long long v71 = 0u;
              long long v72 = 0u;
              long long v69 = 0u;
              long long v70 = 0u;
              uint64_t v67 = [v65 countByEnumeratingWithState:&v69 objects:v77 count:16];
              if (v67)
              {
                uint64_t v22 = *(void *)v70;
                uint64_t v64 = *(void *)v70;
                do
                {
                  for (uint64_t i = 0; i != v67; ++i)
                  {
                    if (*(void *)v70 != v22) {
                      objc_enumerationMutation(v65);
                    }
                    uint64_t v24 = *(void **)(*((void *)&v69 + 1) + 8 * i);
                    *(_WORD *)buf = 0;
                    buf[0] = [v24 BOOLValue];
                    __int16 v25 = [(NPWaldo *)self probeNoTFOCookie];
                    buf[1] = [v25 BOOLValue];

                    id v68 = 0;
                    BOOL v26 = [(NPWaldo *)self isEndpointProbed:v21 parameters:buf latencies:v8 checkSampleSize:1 incompleteLatency:&v68];
                    id v27 = v68;
                    if (!v26)
                    {
                      id v28 = v14;
                      uint64_t v29 = -[NPEdgeLatency initWithProbeEndpoint:probeTFO:]([NPEdgeLatency alloc], "initWithProbeEndpoint:probeTFO:", v21, [v24 BOOLValue]);
                      uint64_t v30 = [(NPWaldo *)self probeNoTFOCookie];
                      -[NPEdgeLatency setProbeNoTFOCookie:](v29, "setProbeNoTFOCookie:", [v30 BOOLValue]);

                      unint64_t v31 = a3;
                      [(NPEdgeLatency *)v29 setEdgeIndex:a3];
                      BOOL v32 = [(NPWaldo *)self reprocessSampleSize];

                      if (v32)
                      {
                        BOOL v33 = [(NPWaldo *)self reprocessSampleSize];
                        uint64_t v34 = [v33 unsignedIntegerValue];
                        uint64_t v35 = [(NPEdgeLatency *)v29 roundTripAverage];
                        [v35 setSize:v34];
                      }
                      BOOL v36 = [(NPWaldo *)self observedRTTSampleSize];

                      if (v36)
                      {
                        long long v37 = [(NPWaldo *)self observedRTTSampleSize];
                        uint64_t v38 = [v37 unsignedIntegerValue];
                        long long v39 = [(NPEdgeLatency *)v29 roundTripAverageObserved];
                        [v39 setSize:v38];
                      }
                      if (v27)
                      {
                        long long v40 = [v27 roundTripAverage];
                        int v41 = [v40 isAnyValid];

                        if (v41)
                        {
                          unsigned int v42 = [(NPEdgeLatency *)v29 roundTripAverage];
                          __int16 v43 = [v27 roundTripAverage];
                          uint64_t v44 = [v43 samples];
                          [v42 addSamples:v44];
                        }
                      }
                      __int16 v45 = [(NPEdgeLatency *)v29 roundTripAverage];
                      uint64_t v46 = [v45 samples];
                      unint64_t v47 = [v46 count];

                      if (v66 > v47)
                      {
                        uint64_t v48 = [(NPEdgeLatency *)v29 roundTripAverage];
                        long long v49 = [v48 samples];
                        unint64_t v66 = [v49 count];
                      }
                      a3 = v31;
                      id v14 = v28;
                      if (!v28) {
                        id v14 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
                      }
                      [v14 addObject:v29];

                      BOOL v8 = v63;
                      uint64_t v22 = v64;
                    }
                  }
                  uint64_t v67 = [v65 countByEnumeratingWithState:&v69 objects:v77 count:16];
                }
                while (v67);
              }
            }

            uint64_t v20 = v62 + 1;
            uint64_t v19 = v59;
            unint64_t v16 = v60;
          }
          while (v62 + 1 != v61);
          uint64_t v61 = [obj countByEnumeratingWithState:&v73 objects:v78 count:16];
        }
        while (v61);
      }
    }
    else
    {
      uint64_t v19 = nplog_obj();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        long long v50 = [(NPWaldo *)self identifier];
        long long v51 = [v16 probeEndpoint];
        *(_DWORD *)buf = 138412802;
        v80 = v50;
        __int16 v81 = 2048;
        unint64_t v82 = a3;
        __int16 v83 = 2112;
        v84 = v51;
        _os_log_impl(&dword_1A0FEE000, v19, OS_LOG_TYPE_DEFAULT, "%@: skipping edge %lu because it has a un-resolved probe endpoint %@", buf, 0x20u);
      }
    }

    ++a3;
  }
  while (a3 != v56);
  if (!v14) {
    goto LABEL_56;
  }
  if (a4) {
    *a4 = v66;
  }
  uint64_t v52 = (void *)[objc_alloc(MEMORY[0x1E4F1C978]) initWithArray:v14];
LABEL_57:

  return v52;
}

- (void)reprocessLatencies:(id)a3 sampleCount:(unint64_t)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __60__NPWaldo_reprocessLatencies_sampleCount_completionHandler___block_invoke;
  v12[3] = &unk_1E5A3C310;
  v12[4] = self;
  id v13 = v8;
  id v14 = v9;
  unint64_t v15 = a4;
  id v10 = v9;
  id v11 = v8;
  [(NPWaldo *)self startProbingEdges:v11 atIndex:0 doneCount:0 sampleCount:a4 completionHandler:v12];
}

void __60__NPWaldo_reprocessLatencies_sampleCount_completionHandler___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) logEdgeList:*(void *)(a1 + 40) debug:0 toStdout:0];
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 waldo:*(void *)(a1 + 32) didFinishSampleProbingWithSuccess:1];

  if (([*(id *)(a1 + 32) reprocessCancelled] & 1) != 0
    || (unint64_t v3 = *(void *)(a1 + 56) + 1,
        [*(id *)(a1 + 32) reprocessSampleSize],
        uint64_t v4 = objc_claimAutoreleasedReturnValue(),
        unint64_t v5 = [v4 unsignedIntegerValue],
        v4,
        v3 >= v5))
  {
    uint64_t v17 = *(void *)(a1 + 48);
    uint64_t v18 = [*(id *)(a1 + 32) getFallbackReasonForLatencies:*(void *)(a1 + 40)];
    uint64_t v19 = *(void (**)(uint64_t, uint64_t))(v17 + 16);
    v19(v17, v18);
  }
  else
  {
    uint64_t v6 = [*(id *)(a1 + 32) reprocessSamplingInterval];
    int64_t v7 = 1000000000 * [v6 unsignedLongLongValue];

    id v8 = NPGetInternalQueue();
    dispatch_source_t v9 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, v8);
    [*(id *)(a1 + 32) setReprocessSamplingTimer:v9];

    id v10 = [*(id *)(a1 + 32) reprocessSamplingTimer];
    dispatch_time_t v11 = dispatch_time(0, v7);
    dispatch_source_set_timer(v10, v11, 0xFFFFFFFFFFFFFFFFLL, 0x2710uLL);

    int v12 = [*(id *)(a1 + 32) reprocessSamplingTimer];
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __60__NPWaldo_reprocessLatencies_sampleCount_completionHandler___block_invoke_2;
    handler[3] = &unk_1E5A3B240;
    handler[4] = *(void *)(a1 + 32);
    dispatch_source_set_event_handler(v12, handler);

    id v13 = [*(id *)(a1 + 32) reprocessSamplingTimer];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __60__NPWaldo_reprocessLatencies_sampleCount_completionHandler___block_invoke_3;
    v20[3] = &unk_1E5A3C310;
    v20[4] = *(void *)(a1 + 32);
    id v22 = *(id *)(a1 + 48);
    id v14 = *(id *)(a1 + 40);
    uint64_t v15 = *(void *)(a1 + 56);
    id v21 = v14;
    uint64_t v23 = v15;
    dispatch_source_set_cancel_handler(v13, v20);

    unint64_t v16 = [*(id *)(a1 + 32) reprocessSamplingTimer];
    dispatch_resume(v16);
  }
}

uint64_t __60__NPWaldo_reprocessLatencies_sampleCount_completionHandler___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) reprocessSamplingTimer];
  dispatch_source_cancel(v2);

  unint64_t v3 = *(void **)(a1 + 32);
  return [v3 setReprocessSamplingTimer:0];
}

uint64_t __60__NPWaldo_reprocessLatencies_sampleCount_completionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  int v2 = [*(id *)(a1 + 32) reprocessCancelled];
  unint64_t v3 = nplog_obj();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
  if (v2)
  {
    if (v4)
    {
      unint64_t v5 = [*(id *)(a1 + 32) identifier];
      int v8 = 138412290;
      dispatch_source_t v9 = v5;
      _os_log_impl(&dword_1A0FEE000, v3, OS_LOG_TYPE_DEFAULT, "%@: Reprocessing has been aborted", (uint8_t *)&v8, 0xCu);
    }
    return (*(uint64_t (**)(void, uint64_t))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), [*(id *)(a1 + 32) getFallbackReasonForLatencies:*(void *)(a1 + 40)]);
  }
  else
  {
    if (v4)
    {
      int64_t v7 = [*(id *)(a1 + 32) identifier];
      int v8 = 138412290;
      dispatch_source_t v9 = v7;
      _os_log_impl(&dword_1A0FEE000, v3, OS_LOG_TYPE_DEFAULT, "%@: Reprocessing due to reprocess sampling timer", (uint8_t *)&v8, 0xCu);
    }
    return [*(id *)(a1 + 32) reprocessLatencies:*(void *)(a1 + 40) sampleCount:*(void *)(a1 + 56) + 1 completionHandler:*(void *)(a1 + 48)];
  }
}

- (int64_t)getFallbackReasonForLatencies:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(NPWaldo *)self reprocessCancelled])
  {
    int64_t v5 = 19;
  }
  else if ([(NPWaldo *)self validateEdgeList:v4])
  {
    int64_t v5 = 0;
  }
  else
  {
    uint64_t v6 = nplog_obj();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      id v13 = [(NPWaldo *)self identifier];
      int v14 = 138412290;
      uint64_t v15 = v13;
      _os_log_error_impl(&dword_1A0FEE000, v6, OS_LOG_TYPE_ERROR, "%@: Failed to measure RTT", (uint8_t *)&v14, 0xCu);
    }
    int64_t v7 = [(NPWaldo *)self delegate];
    int v8 = [v7 currentPath];

    if (v8 && [v8 status] == 1)
    {
      dispatch_source_t v9 = [v8 interface];
      uint64_t v10 = [v9 type];

      uint64_t v11 = 39;
      if (v10 != 2) {
        uint64_t v11 = 40;
      }
      if (v10 == 1) {
        int64_t v5 = 21;
      }
      else {
        int64_t v5 = v11;
      }
    }
    else
    {
      int64_t v5 = 41;
    }
  }
  return v5;
}

- (BOOL)reprocessWithNewRTT:(unint64_t)a3 reProbe:(BOOL *)a4
{
  uint64_t v160 = *MEMORY[0x1E4F143B8];
  int64_t v7 = [(NPWaldo *)self TFOLeeway];
  [v7 doubleValue];
  if (v8 <= 0.0)
  {
    double v11 = 0.66;
  }
  else
  {
    dispatch_source_t v9 = [(NPWaldo *)self TFOLeeway];
    [v9 doubleValue];
    double v11 = v10;
  }
  *a4 = 0;
  int v12 = [(NPWaldo *)self enableLatencyDerivation];
  if ([v12 BOOLValue])
  {
    p_super = &self->_currentNetworkCharacteristics->super;

    if (p_super)
    {
      int v14 = [(NPWaldo *)self currentEdgeList];
      if (!v14
        || [(NPWaldo *)self currentEdgeIndex] < 0
        || (uint64_t v15 = -[NPWaldo currentEdgeIndex](self, "currentEdgeIndex"), v15 >= [v14 count]))
      {
        LOBYTE(p_super) = 0;
LABEL_18:

        return (char)p_super;
      }
      int64_t v16 = [(NPWaldo *)self currentEdgeIndex];
      uint64_t v17 = [(NPWaldo *)self currentEdge];
      uint64_t v18 = [v14 objectAtIndexedSubscript:v16];
      if (!a3)
      {
        uint64_t v23 = nplog_obj();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v24 = [(NPWaldo *)self identifier];
          __int16 v25 = [v17 label];
          *(_DWORD *)buf = 138412802;
          v147 = v24;
          __int16 v148 = 2112;
          char v149 = v25;
          __int16 v150 = 2048;
          unint64_t v151 = 0;
          _os_log_impl(&dword_1A0FEE000, v23, OS_LOG_TYPE_DEFAULT, "%@: Skip re-processing latency to %@ with current connection observed RTT %lu", buf, 0x20u);
          goto LABEL_22;
        }
LABEL_24:
        LOBYTE(p_super) = 0;
LABEL_25:

        goto LABEL_18;
      }
      uint64_t v19 = [(NPWaldo *)self latencyFactorA];
      [v19 doubleValue];
      if (v20 == 0.0) {
        goto LABEL_13;
      }
      id v21 = [(NPWaldo *)self latencyFactorB];
      [v21 doubleValue];
      if (v22 == 0.0)
      {

LABEL_13:
        goto LABEL_14;
      }
      uint64_t v34 = [(NPWaldo *)self latencyFactorX];
      [v34 doubleValue];
      double v36 = v35;

      if (v36 == 0.0)
      {
LABEL_14:
        uint64_t v23 = nplog_obj();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v24 = [(NPWaldo *)self identifier];
          __int16 v25 = [(NPWaldo *)self latencyFactorA];
          [v25 doubleValue];
          id v27 = v26;
          id v28 = [(NPWaldo *)self latencyFactorB];
          [v28 doubleValue];
          unint64_t v30 = v29;
          unint64_t v31 = [(NPWaldo *)self latencyFactorX];
          [v31 doubleValue];
          *(_DWORD *)buf = 138413058;
          v147 = v24;
          __int16 v148 = 2048;
          char v149 = v27;
          __int16 v150 = 2048;
          unint64_t v151 = v30;
          __int16 v152 = 2048;
          unint64_t v153 = v32;
          _os_log_impl(&dword_1A0FEE000, v23, OS_LOG_TYPE_DEFAULT, "%@: Skip re-processing latency because the latency factors are invalid (A = %f, B = %f, X = %f)", buf, 0x2Au);

LABEL_22:
LABEL_23:

          goto LABEL_24;
        }
        goto LABEL_24;
      }
      unint64_t v140 = v16;
      [v18 addRoundTripSampleObserved:a3];
      long long v37 = [v18 roundTripAverageObserved];
      unint64_t v38 = [v37 average];

      unint64_t v39 = [v18 roundTripTime];
      int v40 = [v18 probeTFO];
      unint64_t v41 = (unint64_t)fmax(v11 * (double)v38, 1.0);
      double v42 = fmax(v11 * (double)v39, 1.0);
      if (v40) {
        unint64_t v43 = (unint64_t)v42;
      }
      else {
        unint64_t v43 = v39;
      }
      if (v40) {
        unint64_t v44 = v41;
      }
      else {
        unint64_t v44 = v38;
      }
      __int16 v45 = nplog_obj();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v46 = [(NPWaldo *)self identifier];
        [v17 label];
        v47 = unint64_t v142 = v43;
        *(_DWORD *)buf = 138413058;
        v147 = v46;
        __int16 v148 = 2112;
        char v149 = v47;
        __int16 v150 = 2048;
        unint64_t v151 = a3;
        __int16 v152 = 2048;
        unint64_t v153 = v44;
        _os_log_impl(&dword_1A0FEE000, v45, OS_LOG_TYPE_DEFAULT, "%@: Re-processing latency to %@ with current connection observed RTT %lu (avg RTT %lu)", buf, 0x2Au);

        unint64_t v43 = v142;
      }

      if (!v44)
      {
        uint64_t v23 = nplog_obj();
        if (!os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG)) {
          goto LABEL_24;
        }
        uint64_t v24 = [(NPWaldo *)self identifier];
        *(_DWORD *)buf = 138412290;
        v147 = v24;
        _os_log_debug_impl(&dword_1A0FEE000, v23, OS_LOG_TYPE_DEBUG, "%@: Skip re-processing latency due to insufficient observed RTT samples", buf, 0xCu);
        goto LABEL_23;
      }
      unint64_t v141 = v44;
      long long v130 = v18;
      uint64_t v48 = [MEMORY[0x1E4F1C9C8] date];
      [v17 setLastUsed:v48];

      long long v49 = [(NPWaldo *)self latencyFactorX];
      [v49 doubleValue];
      unint64_t v51 = (unint64_t)(v50 * (double)(unint64_t)[v14 count]);

      uint64_t v52 = [(NPWaldo *)self cachedLocation];
      if (v52)
      {
        long long v53 = (void *)v52;
        uint64_t v54 = [(NPWaldo *)self viewSize];
        uint64_t v55 = [v54 unsignedIntegerValue];

        if (v55)
        {
          unint64_t v56 = [(NPWaldo *)self viewSize];
          unint64_t v51 = [v56 unsignedIntegerValue] - 1;
        }
      }
      if (v140 >= v51)
      {
        char v59 = 0;
      }
      else
      {
        unint64_t v57 = [v14 count];
        uint64_t v58 = v51;
        if (v51 >= v57) {
          uint64_t v58 = objc_msgSend(v14, "count", v51) - 1;
        }
        char v59 = [v14 objectAtIndexedSubscript:v58];
        if (v59)
        {
          long long v60 = [(NPWaldo *)self edgeAtIndex:v51];
          unint64_t v61 = [v59 roundTripTime];
          if ([v59 probeTFO]) {
            unint64_t v61 = (unint64_t)fmax(v11 * (double)v61, 1.0);
          }
          uint64_t v62 = nplog_obj();
          if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
          {
            [(NPWaldo *)self identifier];
            __int16 v63 = v137 = v61;
            [v17 label];
            uint64_t v64 = v143 = v43;
            [(NPWaldo *)self latencyFactorB];
            id v65 = v127 = v59;
            [v65 doubleValue];
            unint64_t v67 = v66;
            [v60 label];
            id v68 = v131 = v17;
            *(_DWORD *)buf = 138413826;
            v147 = v63;
            __int16 v148 = 2112;
            char v149 = v64;
            __int16 v150 = 2048;
            unint64_t v151 = v141;
            __int16 v152 = 2048;
            unint64_t v153 = v67;
            __int16 v154 = 2112;
            unint64_t v155 = (unint64_t)v68;
            __int16 v156 = 2048;
            unint64_t v157 = v137;
            __int16 v158 = 2048;
            unint64_t v159 = v51;
            _os_log_impl(&dword_1A0FEE000, v62, OS_LOG_TYPE_DEFAULT, "%@: Checking to see if new minimum latency to %@ (%lu) is greater than %f times the latency to %@ (rtt %lu) (index %lu)", buf, 0x48u);

            uint64_t v17 = v131;
            char v59 = v127;

            unint64_t v43 = v143;
            unint64_t v61 = v137;
          }

          long long v69 = [(NPWaldo *)self latencyFactorB];
          [v69 doubleValue];
          unint64_t v71 = (unint64_t)(v70 * (double)v61);

          if (v141 > v71)
          {
            uint64_t v18 = v130;
            if ([v130 passedReprobeThreshold])
            {
              unint64_t v72 = v140;
LABEL_63:
              v86 = v59;
              char v87 = nplog_obj();
              if (os_log_type_enabled(v87, OS_LOG_TYPE_DEFAULT))
              {
                v88 = [(NPWaldo *)self identifier];
                uint64_t v89 = [v17 label];
                *(_DWORD *)buf = 138412546;
                v147 = v88;
                __int16 v148 = 2112;
                char v149 = v89;
                _os_log_impl(&dword_1A0FEE000, v87, OS_LOG_TYPE_DEFAULT, "%@: Edge %@ observed RTT has passed reprobe threshold", buf, 0x16u);
              }
              if ([(NPWaldo *)self dayPassFetchCount] < 1)
              {
LABEL_69:
                p_super = nplog_obj();
                if (os_log_type_enabled(p_super, OS_LOG_TYPE_DEFAULT))
                {
                  uint64_t v93 = [(NPWaldo *)self identifier];
                  *(_DWORD *)buf = 138412290;
                  v147 = v93;
                  _os_log_impl(&dword_1A0FEE000, p_super, OS_LOG_TYPE_DEFAULT, "%@: Re-measuring latency due to all top edge observed RTTs exceeded threshold", buf, 0xCu);
                }
                LOBYTE(p_super) = 0;
                BOOL v94 = 1;
                uint64_t v23 = v86;
LABEL_101:
                *a4 = v94;
                goto LABEL_25;
              }
              uint64_t v90 = 0;
              while (1)
              {
                uint64_t v91 = objc_msgSend(v14, "objectAtIndexedSubscript:", v90, v127);
                char v92 = [v91 passedReprobeThreshold];

                if ((v92 & 1) == 0) {
                  break;
                }
                if (++v90 >= [(NPWaldo *)self dayPassFetchCount]) {
                  goto LABEL_69;
                }
              }
              char v59 = v86;
LABEL_76:
              unint64_t v96 = objc_msgSend(v14, "count", v127);
              char v97 = [(NPWaldo *)self dayPassSoftExpiry];
              v132 = v17;
              long long v128 = v59;
              if (v96 >= [v97 count])
              {
                v98 = [(NPWaldo *)self dayPassSoftExpiry];
                unint64_t v138 = [v98 count];
              }
              else
              {
                unint64_t v138 = [v14 count];
              }

              uint64_t v99 = 0;
              do
              {
                uint64_t v100 = v99;
                unint64_t v101 = v72 + v99;
                unint64_t v102 = v72 + v99 + 1;
                if (v102 >= v138) {
                  break;
                }
                uint64_t v103 = [v14 objectAtIndexedSubscript:v102];
                char v144 = [(NPWaldo *)self edgeAtIndex:v102];
                unint64_t v104 = [v103 roundTripTime];
                if ([v103 probeTFO]) {
                  unint64_t v104 = (unint64_t)fmax(v11 * (double)v104, 1.0);
                }
                uint64_t v105 = nplog_obj();
                if (os_log_type_enabled(v105, OS_LOG_TYPE_DEFAULT))
                {
                  [(NPWaldo *)self identifier];
                  uint64_t v106 = v135 = v101;
                  [v132 label];
                  char v107 = v134 = v103;
                  v133 = [(NPWaldo *)self latencyFactorA];
                  [v133 doubleValue];
                  unint64_t v109 = v108;
                  v110 = [v144 label];
                  *(_DWORD *)buf = 138413826;
                  v147 = v106;
                  __int16 v148 = 2112;
                  char v149 = v107;
                  __int16 v150 = 2048;
                  unint64_t v151 = v141;
                  __int16 v152 = 2048;
                  unint64_t v153 = v109;
                  __int16 v154 = 2112;
                  unint64_t v155 = (unint64_t)v110;
                  __int16 v156 = 2048;
                  unint64_t v157 = v104;
                  __int16 v158 = 2048;
                  unint64_t v159 = v102;
                  _os_log_impl(&dword_1A0FEE000, v105, OS_LOG_TYPE_DEFAULT, "%@: Checking to see if new minimum latency to %@ (%lu) is greater than %f times the latency to %@ (rtt %lu) (index %lu)", buf, 0x48u);

                  uint64_t v103 = v134;
                  unint64_t v101 = v135;
                }

                uint64_t v111 = [(NPWaldo *)self latencyFactorA];
                [v111 doubleValue];
                unint64_t v113 = (unint64_t)(v112 * (double)v104);

                uint64_t v99 = v100 + 1;
                unint64_t v72 = v140;
              }
              while (v141 > v113);
              if (v72 && !v100)
              {
                unint64_t v101 = 0;
                unint64_t v114 = v141;
                while (1)
                {
                  double v115 = objc_msgSend(v14, "objectAtIndexedSubscript:", v101, v128);
                  v145 = [(NPWaldo *)self edgeAtIndex:v101];
                  unint64_t v116 = [v115 roundTripTime];
                  if ([v115 probeTFO]) {
                    unint64_t v116 = (unint64_t)fmax(v11 * (double)v116, 1.0);
                  }
                  char v117 = nplog_obj();
                  if (os_log_type_enabled(v117, OS_LOG_TYPE_DEFAULT))
                  {
                    uint64_t v139 = [(NPWaldo *)self identifier];
                    v118 = [v132 label];
                    v136 = [v145 label];
                    uint64_t v119 = [(NPWaldo *)self latencyFactorA];
                    [v119 doubleValue];
                    *(_DWORD *)buf = 138413826;
                    v147 = v139;
                    __int16 v148 = 2112;
                    char v149 = v118;
                    __int16 v150 = 2048;
                    unint64_t v151 = v141;
                    __int16 v152 = 2112;
                    unint64_t v153 = (unint64_t)v136;
                    __int16 v154 = 2048;
                    unint64_t v155 = v116;
                    __int16 v156 = 2048;
                    unint64_t v157 = v120;
                    __int16 v158 = 2048;
                    unint64_t v159 = v101;
                    _os_log_impl(&dword_1A0FEE000, v117, OS_LOG_TYPE_DEFAULT, "%@: Checking to see if new minimum latency to %@ (%lu) is less than the latency to %@ (rtt %lu) divided by %f (index %lu)", buf, 0x48u);

                    unint64_t v114 = v141;
                    unint64_t v72 = v140;
                  }
                  double v121 = (double)v116;
                  v122 = [(NPWaldo *)self latencyFactorA];
                  [v122 doubleValue];
                  unint64_t v124 = (unint64_t)(v121 / v123);

                  if (v114 < v124) {
                    break;
                  }
                  if (v72 == ++v101)
                  {
                    unint64_t v101 = v72;
                    break;
                  }
                }
              }
              v125 = objc_msgSend(v130, "roundTripAverageObserved", v128);
              objc_msgSend(v130, "setRoundTripTime:", objc_msgSend(v125, "average"));

              [(NPWaldo *)self setShouldSave:1];
              uint64_t v17 = v132;
              if (v101 == v72)
              {
                BOOL v94 = 0;
                LOBYTE(p_super) = 0;
                uint64_t v23 = v129;
                uint64_t v18 = v130;
              }
              else
              {
                p_super = nplog_obj();
                uint64_t v23 = v129;
                if (os_log_type_enabled(p_super, OS_LOG_TYPE_DEFAULT))
                {
                  long long v126 = [(NPWaldo *)self identifier];
                  *(_DWORD *)buf = 138412290;
                  v147 = v126;
                  _os_log_impl(&dword_1A0FEE000, p_super, OS_LOG_TYPE_DEFAULT, "%@: Re-sorting edge latencies and rebuilding the latency map for the current network signature", buf, 0xCu);
                }
                [(NPWaldo *)self resortEdgeListForCurrentNetworkSignature];
                [(NPWaldo *)self rebuildLatencyMapAllSignatures:0];
                BOOL v94 = 0;
                LOBYTE(p_super) = 1;
                uint64_t v18 = v130;
              }
              goto LABEL_101;
            }
            BOOL v85 = 1;
            goto LABEL_62;
          }
        }
      }
      uint64_t v18 = v130;
      double v73 = (double)v43;
      long long v74 = [(NPWaldo *)self latencyFactorB];
      [v74 doubleValue];
      if (v75 >= (double)v43)
      {
      }
      else
      {

        if (v43 >= 6)
        {
          long long v127 = v59;
          long long v76 = nplog_obj();
          if (os_log_type_enabled(v76, OS_LOG_TYPE_DEFAULT))
          {
            char v77 = [(NPWaldo *)self identifier];
            v78 = [v17 label];
            [(NPWaldo *)self latencyFactorB];
            v80 = unint64_t v79 = v43;
            [v80 doubleValue];
            *(_DWORD *)buf = 138413314;
            v147 = v77;
            __int16 v148 = 2112;
            char v149 = v78;
            __int16 v150 = 2048;
            unint64_t v151 = v141;
            __int16 v152 = 2048;
            unint64_t v153 = v79;
            __int16 v154 = 2048;
            unint64_t v155 = v81;
            _os_log_impl(&dword_1A0FEE000, v76, OS_LOG_TYPE_DEFAULT, "%@: Checking to see if new minimum latency to %@ (%lu) is less than its current latency (%lu) divided by %f", buf, 0x34u);
          }
          unint64_t v82 = [(NPWaldo *)self latencyFactorB];
          [v82 doubleValue];
          unint64_t v84 = (unint64_t)(v73 / v83);
          BOOL v85 = v141 < v84;

          if ([v130 passedReprobeThreshold] == v85)
          {
            BOOL v95 = v141 >= v84;
            char v59 = v127;
            unint64_t v72 = v140;
            if (v95) {
              goto LABEL_76;
            }
            goto LABEL_63;
          }
          char v59 = v127;
          goto LABEL_62;
        }
      }
      if (([v130 passedReprobeThreshold] & 1) == 0)
      {
        unint64_t v72 = v140;
        goto LABEL_76;
      }
      BOOL v85 = 0;
LABEL_62:
      unint64_t v72 = v140;
      objc_msgSend(v18, "setPassedReprobeThreshold:", v85, v127);
      [(NPWaldo *)self setShouldSave:1];
      if (!v85) {
        goto LABEL_76;
      }
      goto LABEL_63;
    }
  }
  else
  {

    LOBYTE(p_super) = 0;
  }
  return (char)p_super;
}

- (void)startProbingEdges:(id)a3 atIndex:(unint64_t)a4 doneCount:(unint64_t)a5 sampleCount:(unint64_t)a6 completionHandler:(id)a7
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = (void (**)(void))a7;
  if ([v12 count] <= a5)
  {
    v13[2](v13);
  }
  else
  {
    unint64_t v39 = v13;
    uint64_t v14 = [v12 count];
    uint64_t v15 = v14 != a4;
    uint64_t v52 = 0;
    long long v53 = &v52;
    if (v14 == a4) {
      unint64_t v16 = a4;
    }
    else {
      unint64_t v16 = a4 + 1;
    }
    uint64_t v54 = 0x2020000000;
    BOOL v55 = v14 != a4;
    uint64_t v48 = 0;
    long long v49 = &v48;
    uint64_t v50 = 0x2020000000;
    unint64_t v51 = a5;
    unint64_t v38 = v16;
    if (v16 > a4)
    {
      do
      {
        uint64_t v17 = [v12 objectAtIndexedSubscript:a4];
        uint64_t v18 = [v17 roundTripAverage];
        uint64_t v19 = [v18 samples];
        BOOL v20 = [v19 count] > a6;

        id v21 = nplog_obj();
        BOOL v22 = os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG);
        if (v20)
        {
          if (v22)
          {
            uint64_t v34 = [(NPWaldo *)self identifier];
            double v36 = [v17 probeEndpoint];
            id v28 = [v36 description];
            id v29 = +[NPUtilities stripWhitespace:v28];
            unint64_t v30 = [v17 description];
            *(_DWORD *)buf = 138413058;
            unint64_t v57 = v34;
            __int16 v58 = 2112;
            id v59 = v29;
            __int16 v60 = 2112;
            unint64_t v61 = v30;
            __int16 v62 = 2048;
            unint64_t v63 = a6;
            _os_log_debug_impl(&dword_1A0FEE000, v21, OS_LOG_TYPE_DEBUG, "%@: Skip Measuring RTT to edge %@ (current latency %@) at %luth round", buf, 0x2Au);
          }
          uint64_t v23 = v49;
          ++v49[3];
          uint64_t v24 = v53[3] - 1;
          v53[3] = v24;
          if (!v24) {
            [(NPWaldo *)self startProbingEdges:v12 atIndex:v38 doneCount:v23[3] sampleCount:a6 completionHandler:v39];
          }
        }
        else
        {
          if (v22)
          {
            double v35 = [(NPWaldo *)self identifier];
            long long v37 = [v17 probeEndpoint];
            unint64_t v31 = [v37 description];
            id v32 = +[NPUtilities stripWhitespace:v31];
            BOOL v33 = [v17 description];
            *(_DWORD *)buf = 138413058;
            unint64_t v57 = v35;
            __int16 v58 = 2112;
            id v59 = v32;
            __int16 v60 = 2112;
            unint64_t v61 = v33;
            __int16 v62 = 2048;
            unint64_t v63 = a6;
            _os_log_debug_impl(&dword_1A0FEE000, v21, OS_LOG_TYPE_DEBUG, "%@: Measuring RTT to edge %@ (current latency %@) at %luth round", buf, 0x2Au);
          }
          __int16 v25 = +[NSPManager sharedManager];
          [v25 resetTestLatencyMapIndex:a6];

          BOOL v26 = [(NPWaldo *)self probeTimeout];
          v40[0] = MEMORY[0x1E4F143A8];
          v40[1] = 3221225472;
          v40[2] = __77__NPWaldo_startProbingEdges_atIndex_doneCount_sampleCount_completionHandler___block_invoke;
          v40[3] = &unk_1E5A3C338;
          unint64_t v44 = &v52;
          v40[4] = self;
          id v27 = v17;
          id v41 = v27;
          id v43 = v39;
          __int16 v45 = &v48;
          id v42 = v12;
          unint64_t v46 = v38;
          unint64_t v47 = a6;
          [v27 measureLatencyWithTimeout:v26 completionHandler:v40];
        }
        ++a4;
        --v15;
      }
      while (v15);
    }
    _Block_object_dispose(&v48, 8);
    _Block_object_dispose(&v52, 8);
    id v13 = (void (**)(void))v39;
  }
}

void __77__NPWaldo_startProbingEdges_atIndex_doneCount_sampleCount_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24)
    && [*(id *)(a1 + 32) reprocessCancelled])
  {
    int v2 = nplog_obj();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v3 = [*(id *)(a1 + 32) identifier];
      id v4 = [*(id *)(a1 + 40) probeEndpoint];
      int v13 = 138412546;
      uint64_t v14 = v3;
      __int16 v15 = 2112;
      uint64_t v16 = (uint64_t)v4;
      _os_log_impl(&dword_1A0FEE000, v2, OS_LOG_TYPE_DEFAULT, "%@: RTT probe to %@ was aborted", (uint8_t *)&v13, 0x16u);
    }
    *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 0;
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  if (*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24))
  {
    int64_t v5 = nplog_obj();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = [*(id *)(a1 + 32) identifier];
      uint64_t v7 = [*(id *)(a1 + 40) roundTripTime];
      double v8 = [*(id *)(a1 + 40) probeEndpoint];
      dispatch_source_t v9 = [v8 description];
      double v10 = +[NPUtilities stripWhitespace:v9];
      double v11 = [*(id *)(a1 + 40) roundTripAverage];
      id v12 = [v11 description];
      int v13 = 138413058;
      uint64_t v14 = v6;
      __int16 v15 = 2048;
      uint64_t v16 = v7;
      __int16 v17 = 2112;
      uint64_t v18 = v10;
      __int16 v19 = 2112;
      BOOL v20 = v12;
      _os_log_impl(&dword_1A0FEE000, v5, OS_LOG_TYPE_DEFAULT, "%@: Current RTT average is %lu for edge %@, (RTT samples: %@)", (uint8_t *)&v13, 0x2Au);
    }
    ++*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24);
    if (!--*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24)) {
      [*(id *)(a1 + 32) startProbingEdges:*(void *)(a1 + 48) atIndex:*(void *)(a1 + 80) doneCount:*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) sampleCount:*(void *)(a1 + 88) completionHandler:*(void *)(a1 + 56)];
    }
  }
}

- (void)logEdgeList:(id)a3 debug:(BOOL)a4 toStdout:(BOOL)a5
{
  BOOL v55 = a5;
  BOOL v43 = a4;
  uint64_t v68 = *MEMORY[0x1E4F143B8];
  long long v61 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  id obj = a3;
  uint64_t v56 = [obj countByEnumeratingWithState:&v61 objects:v67 count:16];
  if (v56)
  {
    uint64_t v53 = *(void *)v62;
    uint64_t v54 = self;
    do
    {
      for (uint64_t i = 0; i != v56; ++i)
      {
        if (*(void *)v62 != v53) {
          objc_enumerationMutation(obj);
        }
        uint64_t v7 = *(void **)(*((void *)&v61 + 1) + 8 * i);
        unint64_t v8 = [v7 edgeIndex];
        dispatch_source_t v9 = [(NPWaldo *)self edges];
        unint64_t v10 = [v9 count];

        double v11 = @"<inactive>";
        if (v8 < v10)
        {
          id v12 = [(NPWaldo *)self edges];
          int v13 = objc_msgSend(v12, "objectAtIndexedSubscript:", objc_msgSend(v7, "edgeIndex"));

          double v11 = [v13 label];
        }
        uint64_t v14 = [v7 roundTripAverage];
        __int16 v15 = [v14 description];

        uint64_t v16 = [v7 roundTripAverageObserved];
        uint64_t v17 = [v16 description];

        if (v17)
        {
          uint64_t v18 = (__CFString *)objc_alloc_init(MEMORY[0x1E4F28E78]);
          [(__CFString *)v18 appendFormat:@"(observed %@)", v17];
        }
        else
        {
          uint64_t v18 = 0;
        }
        __int16 v58 = (void *)v17;
        id v59 = v11;
        unint64_t v57 = v18;
        if (v55)
        {
          uint64_t v50 = (const char *)[(__CFString *)v11 UTF8String];
          id v60 = [v7 probeEndpoint];
          __int16 v19 = [v60 description];
          id v20 = +[NPUtilities stripWhitespace:v19];
          uint64_t v48 = (const char *)[v20 UTF8String];
          uint64_t v46 = [v7 roundTripTime];
          if (v15) {
            __int16 v45 = (const char *)[v15 UTF8String];
          }
          else {
            __int16 v45 = "null";
          }
          uint64_t v52 = v15;
          if (v18) {
            double v35 = (const char *)[(__CFString *)v18 UTF8String];
          }
          else {
            double v35 = "";
          }
          if ([v7 passedReprobeThreshold]) {
            double v36 = "(passed reprobe threshold)";
          }
          else {
            double v36 = "";
          }
          +[NPUtilities getInterfaceTypeString:](NPUtilities, "getInterfaceTypeString:", [v7 interfaceType]);
          id v37 = objc_claimAutoreleasedReturnValue();
          unint64_t v38 = (const char *)[v37 UTF8String];
          id v39 = [v7 connectionParametersString];
          int v40 = (const char *)[v39 UTF8String];
          id v41 = [v7 TFOStatusString];
          printf("    %s(%s) rtt %lu (%s) %s %s (%s) %s %s\n", v50, v48, v46, v45, v35, v36, v38, v40, (const char *)[v41 UTF8String]);

          self = v54;
          unint64_t v31 = v58;
          BOOL v33 = v59;
          id v29 = v52;
        }
        else
        {
          id v60 = objc_alloc_init(MEMORY[0x1E4F28E78]);
          long long v49 = [(NPWaldo *)self identifier];
          uint64_t v47 = [(__CFString *)v11 UTF8String];
          unint64_t v51 = [v7 probeEndpoint];
          uint64_t v21 = [v51 description];
          BOOL v22 = +[NPUtilities stripWhitespace:v21];
          uint64_t v23 = [v7 roundTripTime];
          uint64_t v24 = &stru_1EF4275C8;
          if (v18) {
            __int16 v25 = v18;
          }
          else {
            __int16 v25 = &stru_1EF4275C8;
          }
          if ([v7 passedReprobeThreshold]) {
            uint64_t v24 = @"(passed reprobe threshold)";
          }
          BOOL v26 = +[NPUtilities getInterfaceTypeString:](NPUtilities, "getInterfaceTypeString:", [v7 interfaceType]);
          id v27 = [v7 connectionParametersString];
          id v28 = [v7 TFOStatusString];
          id v42 = v25;
          id v29 = v15;
          [v60 appendFormat:@"%@:    %s(%@) rtt %lu (%@) %@ %@ (%@) %@ %@", v49, v47, v22, v23, v15, v42, v24, v26, v27, v28];

          unint64_t v30 = nplog_obj();
          __int16 v19 = v30;
          if (v43)
          {
            unint64_t v31 = v58;
            if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              id v32 = v60;
              id v66 = v60;
              _os_log_debug_impl(&dword_1A0FEE000, v19, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
LABEL_24:
              self = v54;
              BOOL v33 = v59;
              uint64_t v34 = v57;
              goto LABEL_35;
            }
          }
          else
          {
            unint64_t v31 = v58;
            if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              id v32 = v60;
              id v66 = v60;
              _os_log_impl(&dword_1A0FEE000, v19, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
              goto LABEL_24;
            }
          }
          self = v54;
          BOOL v33 = v59;
        }
        uint64_t v34 = v57;
        id v32 = v60;
LABEL_35:
      }
      uint64_t v56 = [obj countByEnumeratingWithState:&v61 objects:v67 count:16];
    }
    while (v56);
  }
}

- (id)copyEdgeList:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v23 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id obj = v4;
  uint64_t v5 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v26 != v7) {
          objc_enumerationMutation(obj);
        }
        dispatch_source_t v9 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        unint64_t v10 = [v9 edgeIndex];
        double v11 = [(NPWaldo *)self edges];
        unint64_t v12 = [v11 count];

        if (v10 < v12)
        {
          int v13 = [(NPWaldo *)self edges];
          uint64_t v14 = objc_msgSend(v13, "objectAtIndexedSubscript:", objc_msgSend(v9, "edgeIndex"));

          __int16 v15 = [v14 label];
          uint64_t v16 = [v9 probeEndpoint];
          uint64_t v17 = [v16 hostname];
          uint64_t v18 = [v9 roundTripTime];
          __int16 v19 = [v9 connectionParametersString];
          [v23 appendFormat:@"%@(%@):%lu %@ | ", v15, v17, v18, v19];
        }
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v6);
  }

  if ([v23 length]) {
    id v20 = v23;
  }
  else {
    id v20 = 0;
  }
  id v21 = v20;

  return v21;
}

- (id)copyEdgeListRTTAverage:(id)a3 observed:(BOOL)a4 shortDescription:(BOOL)a5
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v32 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id obj = v6;
  uint64_t v7 = [obj countByEnumeratingWithState:&v36 objects:v40 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v37;
    uint64_t v31 = *(void *)v37;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v37 != v9) {
          objc_enumerationMutation(obj);
        }
        double v11 = *(void **)(*((void *)&v36 + 1) + 8 * i);
        unint64_t v12 = [v11 edgeIndex];
        int v13 = [(NPWaldo *)self edges];
        unint64_t v14 = [v13 count];

        if (v12 < v14)
        {
          __int16 v15 = [(NPWaldo *)self edges];
          uint64_t v16 = objc_msgSend(v15, "objectAtIndexedSubscript:", objc_msgSend(v11, "edgeIndex"));

          if (a5)
          {
            if (a4) {
              [v11 roundTripAverageObserved];
            }
            else {
            uint64_t v17 = [v11 roundTripAverage];
            }
            uint64_t v18 = [v17 shortDescription];
          }
          else
          {
            if (a4) {
              [v11 roundTripAverageObserved];
            }
            else {
            uint64_t v17 = [v11 roundTripAverage];
            }
            uint64_t v18 = [v17 description];
          }
          __int16 v19 = (void *)v18;

          if (v19)
          {
            id v20 = [v16 label];
            id v21 = [v11 probeEndpoint];
            [v21 hostname];
            id v23 = v22 = v8;
            uint64_t v24 = self;
            if ([v11 passedReprobeThreshold]) {
              long long v25 = @"R ";
            }
            else {
              long long v25 = &stru_1EF4275C8;
            }
            long long v26 = [v11 connectionParametersString];
            uint64_t v30 = v25;
            self = v24;
            [v32 appendFormat:@"%@(%@):(%@) %@ %@ | ", v20, v23, v19, v30, v26];

            uint64_t v8 = v22;
            uint64_t v9 = v31;
          }
        }
      }
      uint64_t v8 = [obj countByEnumeratingWithState:&v36 objects:v40 count:16];
    }
    while (v8);
  }

  if ([v32 length]) {
    long long v27 = v32;
  }
  else {
    long long v27 = 0;
  }
  id v28 = v27;

  return v28;
}

- (BOOL)validateEdgeList:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v3 = a3;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v11;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v3);
        }
        uint64_t v7 = objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * i), "roundTripAverage", (void)v10);
        char v8 = [v7 isAnyValid];

        if (v8)
        {
          LOBYTE(v4) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v4;
}

- (void)loadObservedRTTSamples:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v15 != v6) {
          objc_enumerationMutation(v3);
        }
        char v8 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        uint64_t v9 = [v8 roundTripAverage];
        long long v10 = [v9 samples];

        if (v10)
        {
          long long v11 = [v8 roundTripAverageObserved];
          long long v12 = [v8 roundTripAverage];
          long long v13 = [v12 samples];
          [v11 addSamples:v13];
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v5);
  }
}

- (BOOL)shouldFetchWaldo
{
  int v2 = [(NPWaldo *)self edges];
  BOOL v3 = [v2 count] == 0;

  return v3;
}

- (unint64_t)probeSize
{
  BOOL v3 = [(NPWaldo *)self cachedLocation];

  if (v3)
  {
    uint64_t v4 = [(NPWaldo *)self viewSize];
    unint64_t v5 = [v4 unsignedIntegerValue];
    uint64_t v6 = [(NPWaldo *)self edges];
    if (v5 <= [v6 count])
    {
      uint64_t v7 = [(NPWaldo *)self viewSize];
      uint64_t v8 = [v7 unsignedIntegerValue];
    }
    else
    {
      uint64_t v7 = [(NPWaldo *)self edges];
      uint64_t v8 = [v7 count];
    }
    unint64_t v9 = v8;
  }
  else
  {
    uint64_t v4 = [(NPWaldo *)self edges];
    unint64_t v9 = [v4 count];
  }

  return v9;
}

- (NSArray)currentEdgeList
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  currentNetworkCharacteristics = self->_currentNetworkCharacteristics;
  if (!currentNetworkCharacteristics)
  {
    unint64_t v9 = nplog_obj();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_7;
    }
    long long v10 = [(NPWaldo *)self identifier];
    int v13 = 138412290;
    long long v14 = v10;
    long long v11 = "%@: No network characteristics available";
LABEL_12:
    _os_log_debug_impl(&dword_1A0FEE000, v9, OS_LOG_TYPE_DEBUG, v11, (uint8_t *)&v13, 0xCu);

    goto LABEL_7;
  }
  uint64_t v4 = [(NSDictionary *)currentNetworkCharacteristics objectForKeyedSubscript:@"Signature"];
  if (v4)
  {
    unint64_t v5 = (void *)v4;
    uint64_t v6 = [(NPWaldo *)self networkInformation];
    uint64_t v7 = [v6 objectForKeyedSubscript:v5];
    uint64_t v8 = [v7 currentLatencyMap];

    goto LABEL_8;
  }
  unint64_t v9 = nplog_obj();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    long long v10 = [(NPWaldo *)self identifier];
    int v13 = 138412290;
    long long v14 = v10;
    long long v11 = "%@: No network signature available";
    goto LABEL_12;
  }
LABEL_7:

  unint64_t v5 = 0;
  uint64_t v8 = 0;
LABEL_8:

  return (NSArray *)v8;
}

- (id)currentNetworkInfo
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  currentNetworkCharacteristics = self->_currentNetworkCharacteristics;
  if (!currentNetworkCharacteristics)
  {
    unint64_t v9 = nplog_obj();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_7;
    }
    long long v10 = [(NPWaldo *)self identifier];
    int v13 = 138412290;
    long long v14 = v10;
    long long v11 = "%@: No network characteristics available";
LABEL_12:
    _os_log_debug_impl(&dword_1A0FEE000, v9, OS_LOG_TYPE_DEBUG, v11, (uint8_t *)&v13, 0xCu);

    goto LABEL_7;
  }
  uint64_t v4 = [(NSDictionary *)currentNetworkCharacteristics objectForKeyedSubscript:@"Signature"];
  if (v4)
  {
    unint64_t v5 = (void *)v4;
    uint64_t v6 = [(NPWaldo *)self networkInformation];
    uint64_t v7 = [v6 objectForKeyedSubscript:v5];

    uint64_t v8 = [(NSDictionary *)self->_currentNetworkCharacteristics objectForKeyedSubscript:@"HasIPv6"];
    objc_msgSend(v7, "setHasIPv6:", objc_msgSend(v8, "BOOLValue"));

    goto LABEL_8;
  }
  unint64_t v9 = nplog_obj();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    long long v10 = [(NPWaldo *)self identifier];
    int v13 = 138412290;
    long long v14 = v10;
    long long v11 = "%@: No network signature available";
    goto LABEL_12;
  }
LABEL_7:

  unint64_t v5 = 0;
  uint64_t v7 = 0;
LABEL_8:

  return v7;
}

- (void)resortEdgeListForCurrentNetworkSignature
{
  BOOL v3 = [(NSDictionary *)self->_currentNetworkCharacteristics objectForKeyedSubscript:@"Signature"];
  if (v3)
  {
    id v7 = v3;
    uint64_t v4 = [(NPWaldo *)self networkInformation];
    unint64_t v5 = [v4 objectForKeyedSubscript:v7];

    if (v5)
    {
      uint64_t v6 = [(NPWaldo *)self latencyComparator];
      [v5 resortEdgeLatenciesUsingComparator:v6];
    }
    BOOL v3 = v7;
  }
}

- (void)rebuildLatencyMapAllSignatures:(BOOL)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    uint64_t v4 = [(NPWaldo *)self networkInformation];
    uint64_t v5 = [v4 allKeys];
LABEL_5:
    uint64_t v6 = (void *)v5;
    goto LABEL_6;
  }
  uint64_t v4 = [(NSDictionary *)self->_currentNetworkCharacteristics objectForKeyedSubscript:@"Signature"];
  if (v4)
  {
    uint64_t v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C978]), "initWithObjects:", v4, 0);
    goto LABEL_5;
  }
  uint64_t v6 = 0;
LABEL_6:

  if ([v6 count])
  {
    id v7 = [(NPWaldo *)self delegate];
    uint64_t v8 = [v7 waldoRequiresTFO:self];

    if (v8) {
      [(NPWaldo *)self setRequireTFO:v8];
    }
    long long v25 = (void *)v8;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v9 = v6;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v27 objects:v31 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v28;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v28 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = *(void *)(*((void *)&v27 + 1) + 8 * i);
          uint64_t v15 = [(NPWaldo *)self networkInformation];
          long long v16 = [v15 objectForKeyedSubscript:v14];

          __int16 v26 = 0;
          long long v17 = [(NPWaldo *)self requireTFO];
          LOBYTE(v26) = [v17 BOOLValue];

          uint64_t v18 = [(NPWaldo *)self probeNoTFOCookie];
          HIBYTE(v26) = [v18 BOOLValue];

          uint64_t v19 = [(NPWaldo *)self viewSize];
          id v20 = [(NPWaldo *)self edges];
          objc_msgSend(v16, "rebuildLatencyMapWithViewSize:edgeCount:parameters:", v19, objc_msgSend(v20, "count"), &v26);

          id v21 = [v16 currentLatencyMap];
          if (![v21 count])
          {
            uint64_t v22 = [(NPWaldo *)self requireTFO];
            int v23 = [v22 BOOLValue];

            if (!v23) {
              goto LABEL_18;
            }
            id v21 = [(NPWaldo *)self viewSize];
            uint64_t v24 = [(NPWaldo *)self edges];
            objc_msgSend(v16, "rebuildLatencyMapWithViewSize:edgeCount:parameters:", v21, objc_msgSend(v24, "count"), 0);
          }
LABEL_18:
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v27 objects:v31 count:16];
      }
      while (v11);
    }
  }
}

- (void)mergeEdgeList:(id)a3 forNetworkSignature:(id)a4
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (!v7 || ![v6 count]) {
    goto LABEL_22;
  }
  uint64_t v8 = [(NPWaldo *)self delegate];
  id v9 = [v8 waldoRequiresTFO:self];

  if (v9) {
    [(NPWaldo *)self setRequireTFO:v9];
  }
  uint64_t v10 = [(NPWaldo *)self networkInformation];
  uint64_t v11 = [v10 objectForKeyedSubscript:v7];

  if (!v11) {
    uint64_t v11 = objc_alloc_init(NPNetworkInfo);
  }
  uint64_t v12 = [(NPWaldo *)self latencyComparator];
  [(NPNetworkInfo *)v11 mergeNewLatencies:v6 usingComparator:v12];

  int v13 = [(NPWaldo *)self requireTFO];
  v33[0] = [v13 BOOLValue];

  uint64_t v14 = [(NPWaldo *)self probeNoTFOCookie];
  v33[1] = [v14 BOOLValue];

  uint64_t v15 = [(NPWaldo *)self viewSize];
  long long v16 = [(NPWaldo *)self edges];
  -[NPNetworkInfo rebuildLatencyMapWithViewSize:edgeCount:parameters:](v11, "rebuildLatencyMapWithViewSize:edgeCount:parameters:", v15, [v16 count], v33);

  long long v17 = [(NPNetworkInfo *)v11 currentLatencyMap];
  if ([v17 count]) {
    goto LABEL_10;
  }
  uint64_t v18 = [(NPWaldo *)self requireTFO];
  int v19 = [v18 BOOLValue];

  if (v19)
  {
    long long v17 = [(NPWaldo *)self viewSize];
    id v20 = [(NPWaldo *)self edges];
    -[NPNetworkInfo rebuildLatencyMapWithViewSize:edgeCount:parameters:](v11, "rebuildLatencyMapWithViewSize:edgeCount:parameters:", v17, [v20 count], 0);

LABEL_10:
  }
  id v21 = [(NPNetworkInfo *)v11 currentLatencyMap];
  if ([v21 count])
  {
  }
  else
  {
    BOOL v22 = [(NPWaldo *)self reprocessCancelled];

    if (!v22)
    {
      int v23 = nplog_obj();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v24 = [(NPWaldo *)self identifier];
        *(_DWORD *)buf = 138412546;
        double v35 = v24;
        __int16 v36 = 2112;
        id v37 = v7;
        _os_log_impl(&dword_1A0FEE000, v23, OS_LOG_TYPE_DEFAULT, "%@: probing completed for %@ but latency map is empty, un-resolving edges", buf, 0x16u);
      }
      [(NPWaldo *)self setReResolve:1];
    }
  }
  long long v25 = [(NPWaldo *)self networkInformation];

  if (!v25)
  {
    id v26 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    [(NPWaldo *)self setNetworkInformation:v26];
  }
  long long v27 = [(NPWaldo *)self networkInformation];
  [v27 setObject:v11 forKeyedSubscript:v7];

  long long v28 = nplog_obj();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    long long v29 = [(NPWaldo *)self identifier];
    *(_DWORD *)buf = 138412290;
    double v35 = v29;
    _os_log_impl(&dword_1A0FEE000, v28, OS_LOG_TYPE_DEFAULT, "%@: Merged current edge list: ", buf, 0xCu);
  }
  long long v30 = [(NPWaldo *)self networkInformation];
  uint64_t v31 = [v30 objectForKeyedSubscript:v7];
  uint64_t v32 = [v31 currentLatencyMap];
  [(NPWaldo *)self logEdgeList:v32 debug:0 toStdout:0];

LABEL_22:
}

- (id)edgeAtIndex:(int64_t)a3
{
  uint64_t v5 = [(NPWaldo *)self enableLatencyDerivation];
  int v6 = [v5 BOOLValue];

  if (v6)
  {
    id v7 = [(NPWaldo *)self currentEdgeList];
    uint64_t v8 = v7;
    id v9 = 0;
    if (a3 < 0 || !v7) {
      goto LABEL_13;
    }
    if ([v7 count] > a3)
    {
      uint64_t v10 = [v8 objectAtIndexedSubscript:a3];
      unint64_t v11 = [v10 edgeIndex];
      uint64_t v12 = [(NPWaldo *)self edges];
      unint64_t v13 = [v12 count];

      if (v11 < v13)
      {
        uint64_t v14 = [(NPWaldo *)self edges];
        id v9 = objc_msgSend(v14, "objectAtIndexedSubscript:", objc_msgSend(v10, "edgeIndex"));

        goto LABEL_13;
      }
    }
    id v9 = 0;
    goto LABEL_13;
  }
  if (a3 < 0
    || ([(NPWaldo *)self edges],
        uint64_t v15 = objc_claimAutoreleasedReturnValue(),
        int64_t v16 = [v15 count],
        v15,
        v16 <= a3))
  {
    id v9 = 0;
    goto LABEL_14;
  }
  uint64_t v8 = [(NPWaldo *)self edges];
  id v9 = [v8 objectAtIndexedSubscript:a3];
LABEL_13:

LABEL_14:
  return v9;
}

- (unint64_t)edgeCount
{
  BOOL v3 = [(NPWaldo *)self enableLatencyDerivation];
  int v4 = [v3 BOOLValue];

  if (v4) {
    [(NPWaldo *)self currentEdgeList];
  }
  else {
  uint64_t v5 = [(NPWaldo *)self edges];
  }
  unint64_t v6 = [v5 count];

  return v6;
}

- (BOOL)hasEdges
{
  int v2 = [(NPWaldo *)self edges];
  BOOL v3 = [v2 count] != 0;

  return v3;
}

- (void)getDayPassRTT
{
  id v9 = [(NPWaldo *)self currentEdgeList];
  if ([(NPWaldo *)self dayPassFetchCount] >= 1)
  {
    int64_t v3 = 0;
    do
    {
      int v4 = [(NPWaldo *)self edgeAtIndex:v3];
      uint64_t v5 = [v9 objectAtIndexedSubscript:v3];
      unint64_t v6 = [v4 getCurrentOnRamp:v5];
      id v7 = v6;
      if (v4)
      {
        uint64_t v8 = [v6 rtt];
        if (v5)
        {
          if (v8) {
            objc_msgSend(v5, "addRoundTripSampleObserved:", objc_msgSend(v7, "rtt"));
          }
        }
      }

      ++v3;
    }
    while (v3 < [(NPWaldo *)self dayPassFetchCount]);
  }
}

- (void)refreshDayPassesWithCompletionHandler:(id)a3
{
  uint64_t v93 = *MEMORY[0x1E4F143B8];
  id v52 = a3;
  uint64_t v79 = 0;
  v80 = &v79;
  uint64_t v81 = 0x2020000000;
  char v82 = 0;
  unint64_t v51 = [(NPWaldo *)self currentNetworkInfo];
  if ([(NPWaldo *)self edgeCount])
  {
    int v4 = [(NPWaldo *)self currentEdgeList];
    if (v4)
    {
      uint64_t v75 = 0;
      long long v76 = &v75;
      uint64_t v77 = 0x2020000000;
      int64_t v78 = 0;
      int64_t v78 = [(NPWaldo *)self dayPassFetchCount];
      v73[0] = 0;
      v73[1] = v73;
      v73[2] = 0x3032000000;
      v73[3] = __Block_byref_object_copy__4;
      v73[4] = __Block_byref_object_dispose__4;
      id v74 = (id)os_transaction_create();
      uint64_t v67 = 0;
      uint64_t v68 = &v67;
      uint64_t v69 = 0x3032000000;
      double v70 = __Block_byref_object_copy__734;
      unint64_t v71 = __Block_byref_object_dispose__735;
      v63[0] = MEMORY[0x1E4F143A8];
      v63[1] = 3221225472;
      v63[2] = __49__NPWaldo_refreshDayPassesWithCompletionHandler___block_invoke;
      v63[3] = &unk_1E5A3C360;
      v63[4] = self;
      id v64 = v51;
      id v65 = v52;
      id v66 = v73;
      int64_t v5 = 0;
      id v72 = (id)MEMORY[0x1A622B750](v63);
      *(void *)&long long v6 = 138413058;
      long long v50 = v6;
      while (1)
      {
        if (v5 >= [(NPWaldo *)self dayPassFetchCount])
        {
          if (!v76[3])
          {
            uint64_t v44 = v68[5];
            if (v44)
            {
              (*(void (**)(uint64_t, void))(v44 + 16))(v44, *((unsigned __int8 *)v80 + 24));
              __int16 v45 = (void *)v68[5];
              v68[5] = 0;
            }
          }
          _Block_object_dispose(&v67, 8);

          _Block_object_dispose(v73, 8);
          _Block_object_dispose(&v75, 8);
          goto LABEL_48;
        }
        id v7 = [(NPWaldo *)self edgeAtIndex:v5];
        uint64_t v62 = -1;
        uint64_t v8 = [(NPWaldo *)self dayPassSoftExpiry];
        id v9 = [v8 objectAtIndexedSubscript:v5];
        [v9 doubleValue];
        double v11 = v10;

        uint64_t v12 = [v4 objectAtIndexedSubscript:v5];
        unint64_t v13 = (void *)v12;
        if (!v7) {
          break;
        }
        if (!v12)
        {
          int v23 = nplog_obj();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
          {
            uint64_t v41 = [(NPWaldo *)self identifier];
            *(_DWORD *)buf = 138412546;
            unint64_t v84 = v41;
            __int16 v85 = 2048;
            int64_t v86 = v5;
            _os_log_error_impl(&dword_1A0FEE000, v23, OS_LOG_TYPE_ERROR, "%@: Failed to fetch a Day Pass for edge %ld: latency is nil", buf, 0x16u);
          }
LABEL_21:

          --v76[3];
          goto LABEL_22;
        }
        uint64_t v14 = [v7 getCurrentOnRamp:v12];
        uint64_t v15 = v14;
        if (v14 && ([v14 isDayPassPastExpiry:v11] & 1) == 0)
        {
          uint64_t v24 = nplog_obj();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
          {
            long long v25 = [(NPWaldo *)self identifier];
            id v26 = [v7 label];
            *(_DWORD *)buf = 138412802;
            unint64_t v84 = v25;
            __int16 v85 = 2048;
            int64_t v86 = v5;
            __int16 v87 = 2112;
            v88 = v26;
            _os_log_impl(&dword_1A0FEE000, v24, OS_LOG_TYPE_DEFAULT, "%@: Current day pass for edge %ld %@ has not soft expired, sticking with the current onramp", buf, 0x20u);
          }
          --v76[3];
        }
        else
        {
          int64_t v16 = [v7 nextOnRampForLatency:v13 outIndex:&v62];
          long long v17 = v16;
          if (!v16 || v62 == -1)
          {
            id v20 = nplog_obj();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
            {
              id v42 = [(NPWaldo *)self identifier];
              BOOL v43 = [v7 label];
              *(_DWORD *)buf = 138412802;
              unint64_t v84 = v42;
              __int16 v85 = 2048;
              int64_t v86 = v5;
              __int16 v87 = 2112;
              v88 = v43;
              _os_log_error_impl(&dword_1A0FEE000, v20, OS_LOG_TYPE_ERROR, "%@: Failed to fetch a Day Pass for Edge: %ld %@, next onramp is nil", buf, 0x20u);
            }
            goto LABEL_15;
          }
          if ([v16 dayPassPending])
          {
            uint64_t v18 = [v17 dayPassSession];
            BOOL v19 = v18 == 0;

            if (!v19)
            {
              id v20 = nplog_obj();
              if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
              {
                id v21 = [(NPWaldo *)self identifier];
                BOOL v22 = [v7 label];
                *(_DWORD *)buf = v50;
                unint64_t v84 = v21;
                __int16 v85 = 2048;
                int64_t v86 = v5;
                __int16 v87 = 2112;
                v88 = v22;
                __int16 v89 = 2112;
                uint64_t v90 = (uint64_t)v17;
                _os_log_impl(&dword_1A0FEE000, v20, OS_LOG_TYPE_DEFAULT, "%@: Skip, pending for previous day pass response for edge %ld %@ %@", buf, 0x2Au);
              }
LABEL_15:

              --v76[3];
              goto LABEL_22;
            }
          }
          char v27 = [v17 dayPassRefreshAllowed];
          long long v28 = nplog_obj();
          BOOL v29 = os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT);
          if (v27)
          {
            if (v29)
            {
              long long v30 = [(NPWaldo *)self identifier];
              uint64_t v31 = [v7 label];
              *(_DWORD *)buf = 138413314;
              unint64_t v84 = v30;
              __int16 v85 = 2048;
              int64_t v86 = v5;
              __int16 v87 = 2112;
              v88 = v31;
              __int16 v89 = 2048;
              uint64_t v90 = v62;
              __int16 v91 = 2112;
              char v92 = v17;
              _os_log_impl(&dword_1A0FEE000, v28, OS_LOG_TYPE_DEFAULT, "%@: Fetching a new Day Pass for Edge: %ld %@, (onRamp: %ld %@)", buf, 0x34u);
            }
            [v17 setDayPassPending:1];
            uint64_t v32 = [(NPWaldo *)self delegate];
            BOOL v33 = [(NPWaldo *)self retryPause];
            [v33 doubleValue];
            double v35 = v34;
            v53[0] = MEMORY[0x1E4F143A8];
            v53[1] = 3221225472;
            v53[2] = __49__NPWaldo_refreshDayPassesWithCompletionHandler___block_invoke_948;
            v53[3] = &unk_1E5A3C388;
            id v36 = v17;
            id v54 = v36;
            id v37 = v7;
            id v55 = v37;
            id v56 = v13;
            unint64_t v57 = self;
            __int16 v58 = &v79;
            uint64_t v61 = v62;
            id v59 = &v75;
            id v60 = &v67;
            [v36 refreshDayPassWithWaldoDelegate:v32 softExpiry:v37 retryInterval:v53 edge:v11 completionHandler:v35];
          }
          else
          {
            if (v29)
            {
              uint64_t v38 = [(NPWaldo *)self identifier];
              long long v39 = [v17 daypassEndpoint];
              *(_DWORD *)buf = 138412546;
              unint64_t v84 = v38;
              __int16 v85 = 2112;
              int64_t v86 = (int64_t)v39;
              _os_log_impl(&dword_1A0FEE000, v28, OS_LOG_TYPE_DEFAULT, "%@: Skipping Day Pass fetch for %@ because the retry date has not passed", buf, 0x16u);
            }
            --v76[3];
          }
        }
LABEL_22:

        ++v5;
      }
      int v23 = nplog_obj();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        int v40 = [(NPWaldo *)self identifier];
        *(_DWORD *)buf = 138412546;
        unint64_t v84 = v40;
        __int16 v85 = 2048;
        int64_t v86 = v5;
        _os_log_error_impl(&dword_1A0FEE000, v23, OS_LOG_TYPE_ERROR, "%@: Failed to fetch a Day Pass for edge %ld: edge is nil", buf, 0x16u);
      }
      goto LABEL_21;
    }
    uint64_t v48 = nplog_obj();
    if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
    {
      long long v49 = [(NPWaldo *)self identifier];
      *(_DWORD *)buf = 138412290;
      unint64_t v84 = v49;
      _os_log_impl(&dword_1A0FEE000, v48, OS_LOG_TYPE_DEFAULT, "%@: No latency map available, not fetching day passes", buf, 0xCu);
    }
    if (v52) {
      (*((void (**)(id, uint64_t, void))v52 + 2))(v52, 1, 0);
    }
LABEL_48:
  }
  else
  {
    uint64_t v46 = nplog_obj();
    if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v47 = [(NPWaldo *)self identifier];
      *(_DWORD *)buf = 138412290;
      unint64_t v84 = v47;
      _os_log_impl(&dword_1A0FEE000, v46, OS_LOG_TYPE_DEFAULT, "%@: No edges available, not fetching day passes", buf, 0xCu);
    }
    if (v52) {
      (*((void (**)(id, uint64_t, void))v52 + 2))(v52, 1, 0);
    }
  }

  _Block_object_dispose(&v79, 8);
}

void __49__NPWaldo_refreshDayPassesWithCompletionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [*(id *)(a1 + 32) indexOfBestEdge];
  int64_t v5 = nplog_obj();
  long long v6 = v5;
  if (v4 == 0x7FFFFFFFFFFFFFFFLL)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = [*(id *)(a1 + 32) identifier];
      int v12 = 138412290;
      unint64_t v13 = v7;
      _os_log_impl(&dword_1A0FEE000, v6, OS_LOG_TYPE_DEFAULT, "%@: No valid day passes after a day pass refresh", (uint8_t *)&v12, 0xCu);
    }
    [*(id *)(a1 + 40) setLastFallbackReason:17];
    objc_msgSend(*(id *)(a1 + 32), "setCurrentEdgeIndex:", objc_msgSend(*(id *)(a1 + 32), "dayPassFetchCount"));
    [*(id *)(a1 + 32) setShouldSave:1];
    if (!a2) {
      goto LABEL_10;
    }
LABEL_9:
    [*(id *)(a1 + 32) getDayPassRTT];
    [*(id *)(a1 + 32) setShouldSave:1];
    goto LABEL_10;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v8 = [*(id *)(a1 + 32) identifier];
    int v12 = 138412546;
    unint64_t v13 = v8;
    __int16 v14 = 2048;
    uint64_t v15 = v4;
    _os_log_impl(&dword_1A0FEE000, v6, OS_LOG_TYPE_INFO, "%@: Using best edge %ld", (uint8_t *)&v12, 0x16u);
  }
  [*(id *)(a1 + 32) setCurrentEdgeIndex:v4];
  if (a2) {
    goto LABEL_9;
  }
LABEL_10:
  [*(id *)(a1 + 32) pushKeybagToKernel];
  uint64_t v9 = *(void *)(a1 + 48);
  if (v9) {
    (*(void (**)(uint64_t, BOOL, uint64_t))(v9 + 16))(v9, v4 != 0x7FFFFFFFFFFFFFFFLL, a2);
  }
  uint64_t v10 = *(void *)(*(void *)(a1 + 56) + 8);
  double v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = 0;
}

void __49__NPWaldo_refreshDayPassesWithCompletionHandler___block_invoke_948(uint64_t a1, int a2, int a3, char a4)
{
  [*(id *)(a1 + 32) setDayPassPending:0];
  if (a2)
  {
    uint64_t v8 = *(void **)(a1 + 40);
    uint64_t v9 = [*(id *)(a1 + 48) addressFamily];
    uint64_t v10 = [v8 currentIndex:v9];
    uint64_t v11 = *(void *)(a1 + 88);

    if (v10 != v11)
    {
      int v12 = [*(id *)(a1 + 40) getCurrentOnRamp:*(void *)(a1 + 48)];
      unint64_t v13 = v12;
      if (v12 && [v12 isDayPassExpired]) {
        [v13 invalidateDayPass];
      }
    }
    uint64_t v14 = *(void *)(a1 + 88);
    uint64_t v15 = *(void **)(a1 + 40);
    uint64_t v16 = [*(id *)(a1 + 48) addressFamily];
    [v15 setCurrentIndex:v14 addressFamily:v16];
  }
  else
  {
    if (a4) {
      goto LABEL_12;
    }
    uint64_t v17 = *(void *)(a1 + 88);
    uint64_t v18 = *(void **)(a1 + 40);
    BOOL v19 = [*(id *)(a1 + 48) addressFamily];
    uint64_t v16 = [v18 getOnRamp:v17 addressFamily:v19];

    if (v16)
    {
      [v16 setDayPassFailed:1];
      [*(id *)(a1 + 56) setReResolve:1];
    }
  }

LABEL_12:
  if (a3) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 1;
  }
  if (!--*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24))
  {
    uint64_t v20 = *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40);
    if (v20)
    {
      (*(void (**)(uint64_t, void))(v20 + 16))(v20, *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 64) + 8) + 24));
      uint64_t v21 = *(void *)(*(void *)(a1 + 80) + 8);
      BOOL v22 = *(void **)(v21 + 40);
      *(void *)(v21 + 40) = 0;
    }
  }
}

- (void)logLatencyInfoToStdout:(BOOL)a3 logAll:(BOOL)a4 logEdgeSelection:(BOOL)a5
{
  BOOL v33 = a5;
  BOOL v5 = a4;
  BOOL v6 = a3;
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  if (a3
    || (nplog_obj(),
        uint64_t v8 = objc_claimAutoreleasedReturnValue(),
        BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG),
        v8,
        v9))
  {
    currentNetworkCharacteristics = self->_currentNetworkCharacteristics;
    if (currentNetworkCharacteristics)
    {
      uint64_t v11 = [(NSDictionary *)currentNetworkCharacteristics objectForKeyedSubscript:@"Signature"];
      if (v11)
      {
        id v12 = +[NPUtilities copyNetworkDescription:self->_currentNetworkCharacteristics];
        unint64_t v13 = v12;
        if (v6)
        {
          printf("Current Network Signature %s\n\n", (const char *)[v12 UTF8String]);
        }
        else
        {
          uint64_t v14 = nplog_obj();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
          {
            long long v30 = [(NPWaldo *)self identifier];
            *(_DWORD *)buf = 138412546;
            int v40 = v30;
            __int16 v41 = 2112;
            id v42 = v13;
            _os_log_debug_impl(&dword_1A0FEE000, v14, OS_LOG_TYPE_DEBUG, "%@: Current Network Signature %@", buf, 0x16u);
          }
        }
      }
    }
    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    id obj = [(NPWaldo *)self networkInformation];
    uint64_t v15 = [obj countByEnumeratingWithState:&v34 objects:v38 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v35;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v35 != v17) {
            objc_enumerationMutation(obj);
          }
          uint64_t v19 = *(void *)(*((void *)&v34 + 1) + 8 * i);
          id v20 = +[NPUtilities copyDataHexString:v19];
          uint64_t v21 = v20;
          if (v6)
          {
            printf("Latency results for network signature %s:\n", (const char *)[v20 UTF8String]);
          }
          else
          {
            BOOL v22 = nplog_obj();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
            {
              BOOL v29 = [(NPWaldo *)self identifier];
              *(_DWORD *)buf = 138412546;
              int v40 = v29;
              __int16 v41 = 2112;
              id v42 = v21;
              _os_log_debug_impl(&dword_1A0FEE000, v22, OS_LOG_TYPE_DEBUG, "%@: Latency results for network signature %@:", buf, 0x16u);
            }
          }
          int v23 = [(NPWaldo *)self networkInformation];
          uint64_t v24 = [v23 objectForKeyedSubscript:v19];

          if (v5) {
            [v24 edgeLatencies];
          }
          else {
          long long v25 = [v24 currentLatencyMap];
          }
          [(NPWaldo *)self logEdgeList:v25 debug:1 toStdout:v6];

          if (v33 && v24)
          {
            id v26 = [v24 edgeSelection];
            char v27 = v26;
            if (v26)
            {
              if (v6)
              {
                long long v28 = [v26 description];
                printf("\n%s\n", (const char *)[v28 UTF8String]);
              }
              else
              {
                long long v28 = nplog_obj();
                if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
                {
                  uint64_t v31 = [v27 description];
                  *(_DWORD *)buf = 138412290;
                  int v40 = v31;
                  _os_log_debug_impl(&dword_1A0FEE000, v28, OS_LOG_TYPE_DEBUG, "\n%@", buf, 0xCu);
                }
              }
            }
          }
        }
        uint64_t v16 = [obj countByEnumeratingWithState:&v34 objects:v38 count:16];
      }
      while (v16);
    }
  }
}

- (id)copyLatencyInfoDictionary:(BOOL)a3 copyAll:(BOOL)a4
{
  BOOL v4 = a3;
  v59[5] = *MEMORY[0x1E4F143B8];
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v7 = v6;
  if (v4)
  {
    currentNetworkCharacteristics = self->_currentNetworkCharacteristics;
    if (currentNetworkCharacteristics)
    {
      BOOL v9 = [(NSDictionary *)currentNetworkCharacteristics objectForKeyedSubscript:@"InterfaceType"];
      uint64_t v10 = v9;
      if (v9)
      {
        +[NPUtilities getInterfaceTypeString:](NPUtilities, "getInterfaceTypeString:", (int)[v9 intValue]);
        uint64_t v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        uint64_t v11 = @"unknown";
      }
      long long v28 = [(NSDictionary *)self->_currentNetworkCharacteristics objectForKeyedSubscript:@"Signature"];
      if (v28)
      {
        uint64_t v48 = v11;
        BOOL v29 = [(NPWaldo *)self networkInformation];
        long long v30 = [v29 objectForKeyedSubscript:v28];
        uint64_t v31 = v30;
        if (a4) {
          [v30 edgeLatencies];
        }
        else {
        uint64_t v32 = [v30 currentLatencyMap];
        }

        BOOL v33 = [(NPWaldo *)self copyEdgeList:v32];
        long long v34 = self;
        long long v35 = [(NPWaldo *)self copyEdgeListRTTAverage:v32 observed:0 shortDescription:0];
        long long v36 = [(NPWaldo *)v34 copyEdgeListRTTAverage:v32 observed:1 shortDescription:0];
        long long v37 = [(NPWaldo *)v34 copyEdgeListRTTAverage:v32 observed:1 shortDescription:1];
        id v38 = +[NPUtilities copyDataHexString:v28];
        v58[0] = @"InterfaceType";
        v58[1] = @"RTT";
        long long v39 = @"None";
        if (v33) {
          int v40 = v33;
        }
        else {
          int v40 = @"None";
        }
        v59[0] = v48;
        v59[1] = v40;
        if (v35) {
          __int16 v41 = v35;
        }
        else {
          __int16 v41 = @"None";
        }
        v58[2] = @"RTTAverage";
        v58[3] = @"RTTAverageObserved";
        if (v36) {
          id v42 = v36;
        }
        else {
          id v42 = @"None";
        }
        v59[2] = v41;
        v59[3] = v42;
        v58[4] = @"RTTAverageObservedLast";
        if (v37) {
          long long v39 = v37;
        }
        v59[4] = v39;
        uint64_t v43 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v59 forKeys:v58 count:5];
        [v7 setObject:v43 forKeyedSubscript:v38];

        uint64_t v11 = v48;
      }
      id v27 = v7;
    }
    else
    {
      id v27 = 0;
    }
  }
  else
  {
    uint64_t v47 = v6;
    long long v53 = 0u;
    long long v54 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    id obj = [(NPWaldo *)self networkInformation];
    uint64_t v50 = [obj countByEnumeratingWithState:&v51 objects:v57 count:16];
    if (v50)
    {
      uint64_t v46 = *(void *)v52;
      do
      {
        for (uint64_t i = 0; i != v50; ++i)
        {
          if (*(void *)v52 != v46) {
            objc_enumerationMutation(obj);
          }
          uint64_t v13 = *(void *)(*((void *)&v51 + 1) + 8 * i);
          uint64_t v14 = [(NPWaldo *)self networkInformation];
          uint64_t v15 = [v14 objectForKeyedSubscript:v13];

          if (a4) {
            [v15 edgeLatencies];
          }
          else {
          uint64_t v16 = [v15 currentLatencyMap];
          }
          uint64_t v17 = [(NPWaldo *)self copyEdgeList:v16];
          [v15 lastVisitedDesc];
          uint64_t v18 = self;
          uint64_t v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
          id v20 = [v15 lastUsedDesc];
          uint64_t v21 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v15, "lastFallbackReason"));
          id v22 = +[NPUtilities copyDataHexString:v13];
          if (v17) {
            int v23 = v17;
          }
          else {
            int v23 = @"None";
          }
          v55[0] = @"RTT";
          v55[1] = @"LastVisited";
          if (v19) {
            uint64_t v24 = v19;
          }
          else {
            uint64_t v24 = @"None";
          }
          v56[0] = v23;
          v56[1] = v24;
          if (v20) {
            long long v25 = v20;
          }
          else {
            long long v25 = @"None";
          }
          v55[2] = @"LastUsed";
          v55[3] = @"FallbackReason";
          v56[2] = v25;
          v56[3] = v21;
          id v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v56 forKeys:v55 count:4];
          [v47 setObject:v26 forKeyedSubscript:v22];

          self = v18;
        }
        uint64_t v50 = [obj countByEnumeratingWithState:&v51 objects:v57 count:16];
      }
      while (v50);
    }

    id v7 = v47;
    id v27 = v47;
  }

  return v27;
}

- (NSDate)expirationDate
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x3032000000;
  uint64_t v17 = __Block_byref_object_copy__4;
  uint64_t v18 = __Block_byref_object_dispose__4;
  id v19 = 0;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  int v2 = [(NPWaldo *)self edges];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v20 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v11 != v4) {
          objc_enumerationMutation(v2);
        }
        id v6 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        v9[0] = MEMORY[0x1E4F143A8];
        v9[1] = 3221225472;
        v9[2] = __25__NPWaldo_expirationDate__block_invoke;
        v9[3] = &unk_1E5A3C0E8;
        v9[4] = &v14;
        [v6 iterateOnRampsForAddressFamily:0 withBlock:v9];
      }
      uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v20 count:16];
    }
    while (v3);
  }

  id v7 = (id)v15[5];
  _Block_object_dispose(&v14, 8);

  return (NSDate *)v7;
}

uint64_t __25__NPWaldo_expirationDate__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v5 = a4;
  if (([v5 isDayPassExpired] & 1) == 0)
  {
    id v6 = objc_alloc(MEMORY[0x1E4F1C9C8]);
    [v5 dayPassHardExpiry];
    double v8 = v7;
    BOOL v9 = [v5 dayPassCreationDate];
    long long v10 = (void *)[v6 initWithTimeInterval:v9 sinceDate:v8];

    uint64_t v11 = *(void *)(*(void *)(a1 + 32) + 8);
    long long v12 = *(void **)(v11 + 40);
    if (v12)
    {
      uint64_t v13 = [v12 laterDate:v10];
      uint64_t v14 = *(void *)(*(void *)(a1 + 32) + 8);
      uint64_t v15 = *(void **)(v14 + 40);
      *(void *)(v14 + 40) = v13;
    }
    else
    {
      id v16 = v10;
      uint64_t v15 = *(void **)(v11 + 40);
      *(void *)(v11 + 40) = v16;
    }
  }
  return 1;
}

- (NSDate)currentNetworkLastUsed
{
  uint64_t v3 = [(NSDictionary *)self->_currentNetworkCharacteristics objectForKeyedSubscript:@"Signature"];
  if (v3)
  {
    uint64_t v4 = [(NPWaldo *)self networkInformation];
    id v5 = [v4 objectForKeyedSubscript:v3];

    id v6 = [v5 lastUsed];
  }
  else
  {
    id v6 = 0;
  }

  return (NSDate *)v6;
}

- (id)edgeContainingOnRamp:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v21 = 0;
  id v22 = &v21;
  uint64_t v23 = 0x3032000000;
  uint64_t v24 = __Block_byref_object_copy__4;
  long long v25 = __Block_byref_object_dispose__4;
  id v26 = 0;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v5 = [(NPWaldo *)self edges];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v17 objects:v27 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v18;
LABEL_3:
    uint64_t v8 = 0;
    while (1)
    {
      if (*(void *)v18 != v7) {
        objc_enumerationMutation(v5);
      }
      BOOL v9 = *(void **)(*((void *)&v17 + 1) + 8 * v8);
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __32__NPWaldo_edgeContainingOnRamp___block_invoke;
      v13[3] = &unk_1E5A3C3B0;
      id v10 = v4;
      uint64_t v15 = v9;
      id v16 = &v21;
      id v14 = v10;
      [v9 iterateOnRampsForAddressFamily:0 withBlock:v13];
      LOBYTE(v9) = v22[5] == 0;

      if ((v9 & 1) == 0) {
        break;
      }
      if (v6 == ++v8)
      {
        uint64_t v6 = [v5 countByEnumeratingWithState:&v17 objects:v27 count:16];
        if (v6) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  id v11 = (id)v22[5];
  _Block_object_dispose(&v21, 8);

  return v11;
}

uint64_t __32__NPWaldo_edgeContainingOnRamp___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = [a4 tuscanyEndpoint];
  uint64_t v6 = [v5 hosts];

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id obj = v6;
  uint64_t v7 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v20;
    while (2)
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v20 != v9) {
          objc_enumerationMutation(obj);
        }
        id v11 = *(id *)(*((void *)&v19 + 1) + 8 * v10);
        id v12 = [NSString alloc];
        uint64_t v13 = [v11 hostname];
        id v14 = [v11 port];
        uint64_t v15 = (void *)[v12 initWithFormat:@"%@:%@", v13, v14];

        if ([v15 isEqualToString:*(void *)(a1 + 32)])
        {
          objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), *(id *)(a1 + 40));

          uint64_t v16 = 0;
          goto LABEL_11;
        }

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
  uint64_t v16 = 1;
LABEL_11:

  return v16;
}

- (id)copyStateIncludeDistance:(BOOL)a3
{
  BOOL v37 = a3;
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v4 = [(NPWaldo *)self currentEdgeList];
  if ([v4 count])
  {
    id v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v4, "count"));
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    long long v35 = v4;
    id obj = v4;
    uint64_t v39 = [obj countByEnumeratingWithState:&v40 objects:v44 count:16];
    if (v39)
    {
      uint64_t v38 = *(void *)v41;
LABEL_4:
      uint64_t v6 = 0;
      while (1)
      {
        if (*(void *)v41 != v38) {
          objc_enumerationMutation(obj);
        }
        uint64_t v7 = *(void **)(*((void *)&v40 + 1) + 8 * v6);
        unint64_t v8 = [v5 count];
        uint64_t v9 = [(NPWaldo *)self viewSize];
        unint64_t v10 = [v9 unsignedIntegerValue];

        if (v8 >= v10) {
          break;
        }
        id v11 = [(NPWaldo *)self edges];
        id v12 = objc_msgSend(v11, "objectAtIndexedSubscript:", objc_msgSend(v7, "edgeIndex"));

        if (v12)
        {
          id v13 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
          id v14 = [v7 creationDate];
          [v14 timeIntervalSinceNow];
          double v16 = v15;

          if (v37)
          {
            [v12 distance];
            if ((unint64_t)v17 % 0x64 <= 0x32) {
              unint64_t v18 = (unint64_t)v17 / 0x64;
            }
            else {
              unint64_t v18 = (unint64_t)v17 / 0x64 + 1;
            }
            long long v19 = [NSNumber numberWithUnsignedInteger:100 * v18];
            [v13 setObject:v19 forKeyedSubscript:@"distance"];
          }
          long long v20 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v7, "roundTripTime"));
          [v13 setObject:v20 forKeyedSubscript:@"rtt"];

          long long v21 = [v12 label];
          uint64_t v22 = [v21 length];

          if (v22)
          {
            uint64_t v23 = [v12 label];
            [v13 setObject:v23 forKeyedSubscript:@"label"];
          }
          uint64_t v24 = NSNumber;
          long long v25 = [v7 roundTripAverageObserved];
          id v26 = objc_msgSend(v24, "numberWithUnsignedInteger:", objc_msgSend(v25, "size"));
          [v13 setObject:v26 forKeyedSubscript:@"samples"];

          id v27 = [NSNumber numberWithUnsignedInteger:(unint64_t)fabs(v16)];
          [v13 setObject:v27 forKeyedSubscript:@"age"];

          uint64_t v28 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v7, "probeCount"));
          [v13 setObject:v28 forKeyedSubscript:@"probes"];

          BOOL v29 = [v12 lastUsed];
          if (v29)
          {
            long long v30 = NSNumber;
            uint64_t v31 = [v12 lastUsed];
            [v31 timeIntervalSinceNow];
            BOOL v33 = [v30 numberWithUnsignedInteger:(unint64_t)fabs(v32)];
            [v13 setObject:v33 forKeyedSubscript:@"idleSeconds"];
          }
          else
          {
            [v13 setObject:0 forKeyedSubscript:@"idleSeconds"];
          }

          [v5 addObject:v13];
        }

        if (v39 == ++v6)
        {
          uint64_t v39 = [obj countByEnumeratingWithState:&v40 objects:v44 count:16];
          if (v39) {
            goto LABEL_4;
          }
          break;
        }
      }
    }

    id v4 = v35;
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (BOOL)isIPv6Enabled
{
  uint64_t v3 = [(NPWaldo *)self enableIPv6];
  if (v3)
  {
    id v4 = [(NPWaldo *)self enableIPv6];
    char v5 = [v4 BOOLValue];
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

- (id)onRampForIndex:(id)a3
{
  id v4 = a3;
  char v5 = v4;
  if (v4
    && (unint64_t v6 = [v4 unsignedIntegerValue],
        [(NPWaldo *)self allOnRamps],
        uint64_t v7 = objc_claimAutoreleasedReturnValue(),
        unint64_t v8 = [v7 count],
        v7,
        v6 < v8))
  {
    uint64_t v9 = [(NPWaldo *)self allOnRamps];
    unint64_t v10 = objc_msgSend(v9, "objectAtIndexedSubscript:", objc_msgSend(v5, "unsignedIntegerValue"));
  }
  else
  {
    unint64_t v10 = 0;
  }

  return v10;
}

- (id)latencyComparator
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __28__NPWaldo_latencyComparator__block_invoke;
  v5[3] = &unk_1E5A3C3D8;
  v5[4] = self;
  int v2 = (void *)MEMORY[0x1A622B750](v5, a2);
  uint64_t v3 = (void *)MEMORY[0x1A622B750]();

  return v3;
}

uint64_t __28__NPWaldo_latencyComparator__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v5;
  id v8 = v6;
  unint64_t v9 = [v7 roundTripTime];
  unint64_t v10 = [v8 roundTripTime];
  id v11 = [*(id *)(a1 + 32) TFOLeeway];
  [v11 doubleValue];
  if (v12 <= 0.0)
  {
    double v15 = 0.66;
  }
  else
  {
    id v13 = [*(id *)(a1 + 32) TFOLeeway];
    [v13 doubleValue];
    double v15 = v14;
  }
  if ([v7 probeTFO]) {
    unint64_t v9 = (unint64_t)fmax(v15 * (double)v9, 1.0);
  }
  if ([v8 probeTFO]) {
    unint64_t v10 = (unint64_t)fmax(v15 * (double)v10, 1.0);
  }
  if (v9 >= v10)
  {
    if (v9 == v10)
    {
      uint64_t v17 = [v7 TFOStatus];
      if (v17 == [v8 TFOStatus])
      {
        uint64_t v16 = 0;
      }
      else if ([v7 TFOStatus] == 2)
      {
        uint64_t v16 = -1;
      }
      else
      {
        uint64_t v16 = 1;
      }
    }
    else
    {
      uint64_t v16 = 1;
    }
  }
  else
  {
    uint64_t v16 = -1;
  }

  return v16;
}

- (void)cleanupStaleKeys
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  uint64_t v3 = [MEMORY[0x1E4F38CD8] sharedMaintainer];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __27__NPWaldo_cleanupStaleKeys__block_invoke;
  v5[3] = &unk_1E5A3BC58;
  v5[4] = self;
  void v5[5] = &v6;
  [v3 removeFileHandleMatchingPredicate:v5];

  if (*((unsigned char *)v7 + 24))
  {
    id v4 = [MEMORY[0x1E4F38CD8] sharedMaintainer];
    [v4 commit];
  }
  _Block_object_dispose(&v6, 8);
}

uint64_t __27__NPWaldo_cleanupStaleKeys__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_14;
  }
  id v4 = [v3 sessionType];
  if (([v4 isEqual:&unk_1EF43BD90] & 1) == 0)
  {

    goto LABEL_14;
  }
  id v5 = [v3 configurationIdentifier];
  uint64_t v6 = [*(id *)(a1 + 32) configurationIdentifier];
  int v7 = [v5 isEqual:v6];

  if (!v7)
  {
LABEL_14:
    uint64_t v18 = 0;
    goto LABEL_15;
  }
  id v8 = v3;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  uint64_t v35 = a1;
  char v9 = [*(id *)(a1 + 32) allOnRamps];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v36 objects:v44 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v37;
LABEL_6:
    uint64_t v13 = 0;
    while (1)
    {
      if (*(void *)v37 != v12) {
        objc_enumerationMutation(v9);
      }
      double v14 = *(void **)(*((void *)&v36 + 1) + 8 * v13);
      double v15 = [v14 dayPassUUID];
      uint64_t v16 = [v8 agentUUID];
      char v17 = [v15 isEqual:v16];

      if (v17) {
        break;
      }
      if (v11 == ++v13)
      {
        uint64_t v11 = [v9 countByEnumeratingWithState:&v36 objects:v44 count:16];
        if (v11) {
          goto LABEL_6;
        }
        goto LABEL_12;
      }
    }
    long long v20 = [v14 dayPassUUID];

    if (!v20) {
      goto LABEL_18;
    }
    uint64_t v18 = 0;
  }
  else
  {
LABEL_12:

LABEL_18:
    long long v21 = nplog_obj();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v22 = [*(id *)(v35 + 32) identifier];
      uint64_t v23 = [v8 agentUUID];
      *(_DWORD *)buf = 138412546;
      long long v41 = v22;
      __int16 v42 = 2112;
      long long v43 = v23;
      _os_log_impl(&dword_1A0FEE000, v21, OS_LOG_TYPE_DEFAULT, "%@: Removing stale key %@", buf, 0x16u);
    }
    uint64_t v24 = objc_alloc_init(NSPKeyNetworkAgent);
    long long v25 = [v8 agentUUID];
    [(NSPNetworkAgent *)v24 setAgentUUID:v25];

    id v26 = (void *)[objc_alloc(MEMORY[0x1E4F38C00]) initWithNetworkAgentClass:objc_opt_class()];
    id v27 = [v8 handle];
    uint64_t v28 = dup([v27 fileDescriptor]);

    if ((v28 & 0x80000000) != 0)
    {
      BOOL v29 = nplog_obj();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        uint64_t v31 = [*(id *)(v35 + 32) identifier];
        double v32 = [(NSPNetworkAgent *)v24 agentUUID];
        *(_DWORD *)buf = 138412546;
        long long v41 = v31;
        __int16 v42 = 2112;
        long long v43 = v32;
        _os_log_error_impl(&dword_1A0FEE000, v29, OS_LOG_TYPE_ERROR, "%@: While cleaning up stale keys, failed to dup the agent registration file descriptor for agent with UUID %@", buf, 0x16u);
      }
    }
    else if ([v26 setRegisteredNetworkAgent:v24 fileDescriptor:v28])
    {
      [v26 unregisterNetworkAgent];
    }
    else
    {
      long long v30 = nplog_obj();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        BOOL v33 = [*(id *)(v35 + 32) identifier];
        long long v34 = [(NSPNetworkAgent *)v24 agentUUID];
        *(_DWORD *)buf = 138412546;
        long long v41 = v33;
        __int16 v42 = 2112;
        long long v43 = v34;
        _os_log_error_impl(&dword_1A0FEE000, v30, OS_LOG_TYPE_ERROR, "%@: While cleaning up stale keys, failed to register key agent with UUID %@", buf, 0x16u);
      }
      close(v28);
    }
    uint64_t v18 = 1;
    *(unsigned char *)(*(void *)(*(void *)(v35 + 40) + 8) + 24) = 1;

    long long v20 = 0;
  }

LABEL_15:
  return v18;
}

- (void)incrementSessionCounters
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  int v2 = [(NPWaldo *)self allOnRamps];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        int v7 = *(void **)(*((void *)&v9 + 1) + 8 * i);
        int v8 = [v7 dayPassSessionCounter];
        if (v8) {
          [v7 setDayPassSessionCounter:(v8 + 1)];
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }
}

- (NSString)identifier
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (int64_t)source
{
  return self->_source;
}

- (NSNumber)timestamp
{
  return (NSNumber *)objc_getProperty(self, a2, 56, 1);
}

- (void)setTimestamp:(id)a3
{
}

- (NSNumber)version
{
  return (NSNumber *)objc_getProperty(self, a2, 64, 1);
}

- (void)setVersion:(id)a3
{
}

- (NSString)dayPassHostname
{
  return (NSString *)objc_getProperty(self, a2, 72, 1);
}

- (void)setDayPassHostname:(id)a3
{
}

- (NSNumber)dayPassHostnamePrependLabel
{
  return (NSNumber *)objc_getProperty(self, a2, 80, 1);
}

- (void)setDayPassHostnamePrependLabel:(id)a3
{
}

- (NSNumber)dayPassPort
{
  return (NSNumber *)objc_getProperty(self, a2, 88, 1);
}

- (void)setDayPassPort:(id)a3
{
}

- (NSNumber)dayPassRequestTimeout
{
  return (NSNumber *)objc_getProperty(self, a2, 96, 1);
}

- (void)setDayPassRequestTimeout:(id)a3
{
}

- (NSString)dayPassLeafOID
{
  return (NSString *)objc_getProperty(self, a2, 104, 1);
}

- (void)setDayPassLeafOID:(id)a3
{
}

- (NSNumber)dayPassRevocationFailClosed
{
  return (NSNumber *)objc_getProperty(self, a2, 112, 1);
}

- (void)setDayPassRevocationFailClosed:(id)a3
{
}

- (NSNumber)dayPassExtendedValidation
{
  return (NSNumber *)objc_getProperty(self, a2, 120, 1);
}

- (void)setDayPassExtendedValidation:(id)a3
{
}

- (NSNumber)dayPassEnableSessionTicket
{
  return (NSNumber *)objc_getProperty(self, a2, 128, 1);
}

- (void)setDayPassEnableSessionTicket:(id)a3
{
}

- (NSArray)dayPassSoftExpiry
{
  return (NSArray *)objc_getProperty(self, a2, 136, 1);
}

- (void)setDayPassSoftExpiry:(id)a3
{
}

- (NSNumber)enableLatencyDerivation
{
  return (NSNumber *)objc_getProperty(self, a2, 144, 1);
}

- (void)setEnableLatencyDerivation:(id)a3
{
}

- (NSNumber)latencyFactorA
{
  return (NSNumber *)objc_getProperty(self, a2, 152, 1);
}

- (void)setLatencyFactorA:(id)a3
{
}

- (NSNumber)latencyFactorB
{
  return (NSNumber *)objc_getProperty(self, a2, 160, 1);
}

- (void)setLatencyFactorB:(id)a3
{
}

- (NSNumber)latencyFactorX
{
  return (NSNumber *)objc_getProperty(self, a2, 168, 1);
}

- (void)setLatencyFactorX:(id)a3
{
}

- (NSNumber)edgeFairnessFactor
{
  return (NSNumber *)objc_getProperty(self, a2, 176, 1);
}

- (void)setEdgeFairnessFactor:(id)a3
{
}

- (NSNumber)locationCheckInterval
{
  return (NSNumber *)objc_getProperty(self, a2, 184, 1);
}

- (void)setLocationCheckInterval:(id)a3
{
}

- (NSNumber)locationTTL
{
  return (NSNumber *)objc_getProperty(self, a2, 192, 1);
}

- (void)setLocationTTL:(id)a3
{
}

- (NSNumber)locationToleranceDistance
{
  return (NSNumber *)objc_getProperty(self, a2, 200, 1);
}

- (void)setLocationToleranceDistance:(id)a3
{
}

- (NSNumber)viewSize
{
  return (NSNumber *)objc_getProperty(self, a2, 208, 1);
}

- (void)setViewSize:(id)a3
{
}

- (NSNumber)probePause
{
  return (NSNumber *)objc_getProperty(self, a2, 216, 1);
}

- (void)setProbePause:(id)a3
{
}

- (NSNumber)probeTFO
{
  return (NSNumber *)objc_getProperty(self, a2, 224, 1);
}

- (void)setProbeTFO:(id)a3
{
}

- (NSNumber)probeNoTFOCookie
{
  return (NSNumber *)objc_getProperty(self, a2, 232, 1);
}

- (void)setProbeNoTFOCookie:(id)a3
{
}

- (NSNumber)probeTimeout
{
  return (NSNumber *)objc_getProperty(self, a2, 240, 1);
}

- (void)setProbeTimeout:(id)a3
{
}

- (NSNumber)retryPause
{
  return (NSNumber *)objc_getProperty(self, a2, 248, 1);
}

- (void)setRetryPause:(id)a3
{
}

- (NSNumber)signatureLimit
{
  return (NSNumber *)objc_getProperty(self, a2, 256, 1);
}

- (void)setSignatureLimit:(id)a3
{
}

- (NSNumber)observedRTTSampleSize
{
  return (NSNumber *)objc_getProperty(self, a2, 264, 1);
}

- (void)setObservedRTTSampleSize:(id)a3
{
}

- (NSNumber)reprocessSamplingInterval
{
  return (NSNumber *)objc_getProperty(self, a2, 272, 1);
}

- (void)setReprocessSamplingInterval:(id)a3
{
}

- (NSNumber)reprocessSampleSize
{
  return (NSNumber *)objc_getProperty(self, a2, 280, 1);
}

- (void)setReprocessSampleSize:(id)a3
{
}

- (NSNumber)connectionIdleTimeoutMaximum
{
  return (NSNumber *)objc_getProperty(self, a2, 288, 1);
}

- (void)setConnectionIdleTimeoutMaximum:(id)a3
{
}

- (NSString)tag
{
  return (NSString *)objc_getProperty(self, a2, 296, 1);
}

- (void)setTag:(id)a3
{
}

- (NSURL)telemetryURL
{
  return (NSURL *)objc_getProperty(self, a2, 304, 1);
}

- (void)setTelemetryURL:(id)a3
{
}

- (NSString)telemetryService
{
  return (NSString *)objc_getProperty(self, a2, 312, 1);
}

- (void)setTelemetryService:(id)a3
{
}

- (NSNumber)useGeohashFromServer
{
  return (NSNumber *)objc_getProperty(self, a2, 320, 1);
}

- (void)setUseGeohashFromServer:(id)a3
{
}

- (NSNumber)edgeSelectionEnabled
{
  return (NSNumber *)objc_getProperty(self, a2, 328, 1);
}

- (void)setEdgeSelectionEnabled:(id)a3
{
}

- (NSNumber)edgeSelectionAlpha
{
  return (NSNumber *)objc_getProperty(self, a2, 336, 1);
}

- (void)setEdgeSelectionAlpha:(id)a3
{
}

- (NSNumber)edgeSelectionWindowSize
{
  return (NSNumber *)objc_getProperty(self, a2, 344, 1);
}

- (void)setEdgeSelectionWindowSize:(id)a3
{
}

- (NSNumber)enableIPv6
{
  return (NSNumber *)objc_getProperty(self, a2, 352, 1);
}

- (void)setEnableIPv6:(id)a3
{
}

- (NSNumber)requireTFO
{
  return (NSNumber *)objc_getProperty(self, a2, 360, 1);
}

- (void)setRequireTFO:(id)a3
{
}

- (NSNumber)TFOLeeway
{
  return (NSNumber *)objc_getProperty(self, a2, 368, 1);
}

- (void)setTFOLeeway:(id)a3
{
}

- (NSNumber)edgesGeneration
{
  return (NSNumber *)objc_getProperty(self, a2, 376, 1);
}

- (void)setEdgesGeneration:(id)a3
{
}

- (NSNumber)usedEdgesGeneration
{
  return (NSNumber *)objc_getProperty(self, a2, 384, 1);
}

- (void)setUsedEdgesGeneration:(id)a3
{
}

- (int64_t)currentEdgeIndex
{
  return self->_currentEdgeIndex;
}

- (void)setCurrentEdgeIndex:(int64_t)a3
{
  self->_currentEdgeIndex = a3;
}

- (NSString)hostname
{
  return self->_hostname;
}

- (void)setHostname:(id)a3
{
}

- (NPWaldoDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (NPWaldoDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)shouldSave
{
  return self->_shouldSave;
}

- (void)setShouldSave:(BOOL)a3
{
  self->_shouldSave = a3;
}

- (NPLocation)cachedLocation
{
  return self->_cachedLocation;
}

- (void)setCachedLocation:(id)a3
{
}

- (NSDate)locationCheckTimestamp
{
  return self->_locationCheckTimestamp;
}

- (void)setLocationCheckTimestamp:(id)a3
{
}

- (NSDate)locationExpiration
{
  return self->_locationExpiration;
}

- (void)setLocationExpiration:(id)a3
{
}

- (NPWaldo)defaults
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

- (NPKeyBag)keybag
{
  return self->_keybag;
}

- (void)setKeybag:(id)a3
{
}

- (NPWaldoLocationManager)locationManager
{
  return self->_locationManager;
}

- (void)setLocationManager:(id)a3
{
}

- (BOOL)reprocessPending
{
  return self->_reprocessPending;
}

- (void)setReprocessPending:(BOOL)a3
{
  self->_reprocessPending = a3;
}

- (NSMutableDictionary)networkInformation
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 472, 1);
}

- (void)setNetworkInformation:(id)a3
{
}

- (BOOL)daypassRefreshInProgress
{
  return self->_daypassRefreshInProgress;
}

- (void)setDaypassRefreshInProgress:(BOOL)a3
{
  self->_daypassRefreshInProgress = a3;
}

- (NSArray)currentEdges
{
  return (NSArray *)objc_getProperty(self, a2, 480, 1);
}

- (NPTuscanyEdge)nextEdge
{
  return (NPTuscanyEdge *)objc_getProperty(self, a2, 488, 1);
}

- (BOOL)reprocessCancelled
{
  return self->_reprocessCancelled;
}

- (void)setReprocessCancelled:(BOOL)a3
{
  self->_reprocessCancelled = a3;
}

- (unsigned)generation
{
  return self->_generation;
}

- (void)setGeneration:(unsigned int)a3
{
  self->_generation = a3;
}

- (OS_dispatch_source)reprocessSamplingTimer
{
  return (OS_dispatch_source *)objc_getProperty(self, a2, 496, 1);
}

- (void)setReprocessSamplingTimer:(id)a3
{
}

- (NWNetworkAgentRegistration)agentRegistration
{
  return (NWNetworkAgentRegistration *)objc_getProperty(self, a2, 504, 1);
}

- (void)setAgentRegistration:(id)a3
{
}

- (NSUUID)configurationIdentifier
{
  return (NSUUID *)objc_getProperty(self, a2, 512, 1);
}

- (void)setConfigurationIdentifier:(id)a3
{
}

- (OS_dispatch_queue)reprocessQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 520, 1);
}

- (NSData)updateHash
{
  return (NSData *)objc_getProperty(self, a2, 528, 1);
}

- (void)setUpdateHash:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updateHash, 0);
  objc_storeStrong((id *)&self->_reprocessQueue, 0);
  objc_storeStrong((id *)&self->_configurationIdentifier, 0);
  objc_storeStrong((id *)&self->_agentRegistration, 0);
  objc_storeStrong((id *)&self->_reprocessSamplingTimer, 0);
  objc_storeStrong((id *)&self->_nextEdge, 0);
  objc_storeStrong((id *)&self->_currentEdges, 0);
  objc_storeStrong((id *)&self->_networkInformation, 0);
  objc_storeStrong((id *)&self->_locationManager, 0);
  objc_storeStrong((id *)&self->_keybag, 0);
  objc_storeStrong((id *)&self->_agent, 0);
  objc_storeStrong((id *)&self->_defaults, 0);
  objc_storeStrong((id *)&self->_locationExpiration, 0);
  objc_storeStrong((id *)&self->_locationCheckTimestamp, 0);
  objc_storeStrong((id *)&self->_cachedLocation, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_hostname, 0);
  objc_storeStrong((id *)&self->_usedEdgesGeneration, 0);
  objc_storeStrong((id *)&self->_edgesGeneration, 0);
  objc_storeStrong((id *)&self->_TFOLeeway, 0);
  objc_storeStrong((id *)&self->_requireTFO, 0);
  objc_storeStrong((id *)&self->_enableIPv6, 0);
  objc_storeStrong((id *)&self->_edgeSelectionWindowSize, 0);
  objc_storeStrong((id *)&self->_edgeSelectionAlpha, 0);
  objc_storeStrong((id *)&self->_edgeSelectionEnabled, 0);
  objc_storeStrong((id *)&self->_useGeohashFromServer, 0);
  objc_storeStrong((id *)&self->_telemetryService, 0);
  objc_storeStrong((id *)&self->_telemetryURL, 0);
  objc_storeStrong((id *)&self->_tag, 0);
  objc_storeStrong((id *)&self->_connectionIdleTimeoutMaximum, 0);
  objc_storeStrong((id *)&self->_reprocessSampleSize, 0);
  objc_storeStrong((id *)&self->_reprocessSamplingInterval, 0);
  objc_storeStrong((id *)&self->_observedRTTSampleSize, 0);
  objc_storeStrong((id *)&self->_signatureLimit, 0);
  objc_storeStrong((id *)&self->_retryPause, 0);
  objc_storeStrong((id *)&self->_probeTimeout, 0);
  objc_storeStrong((id *)&self->_probeNoTFOCookie, 0);
  objc_storeStrong((id *)&self->_probeTFO, 0);
  objc_storeStrong((id *)&self->_probePause, 0);
  objc_storeStrong((id *)&self->_viewSize, 0);
  objc_storeStrong((id *)&self->_locationToleranceDistance, 0);
  objc_storeStrong((id *)&self->_locationTTL, 0);
  objc_storeStrong((id *)&self->_locationCheckInterval, 0);
  objc_storeStrong((id *)&self->_edgeFairnessFactor, 0);
  objc_storeStrong((id *)&self->_latencyFactorX, 0);
  objc_storeStrong((id *)&self->_latencyFactorB, 0);
  objc_storeStrong((id *)&self->_latencyFactorA, 0);
  objc_storeStrong((id *)&self->_enableLatencyDerivation, 0);
  objc_storeStrong((id *)&self->_dayPassSoftExpiry, 0);
  objc_storeStrong((id *)&self->_dayPassEnableSessionTicket, 0);
  objc_storeStrong((id *)&self->_dayPassExtendedValidation, 0);
  objc_storeStrong((id *)&self->_dayPassRevocationFailClosed, 0);
  objc_storeStrong((id *)&self->_dayPassLeafOID, 0);
  objc_storeStrong((id *)&self->_dayPassRequestTimeout, 0);
  objc_storeStrong((id *)&self->_dayPassPort, 0);
  objc_storeStrong((id *)&self->_dayPassHostnamePrependLabel, 0);
  objc_storeStrong((id *)&self->_dayPassHostname, 0);
  objc_storeStrong((id *)&self->_version, 0);
  objc_storeStrong((id *)&self->_timestamp, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_allOnRamps, 0);
  objc_storeStrong((id *)&self->_edges, 0);
  objc_storeStrong((id *)&self->_currentNetworkCharacteristics, 0);
}

@end
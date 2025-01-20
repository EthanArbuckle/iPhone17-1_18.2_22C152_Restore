@interface AWDNetworkPerformanceMetric
- (BOOL)acceptablePerformanceResult;
- (BOOL)awdlPowerState;
- (BOOL)btIsConnectable;
- (BOOL)btIsDiscoverable;
- (BOOL)btIsPowerOn;
- (BOOL)btIsScanning;
- (BOOL)cellularAllowsVoip;
- (BOOL)cellularDataIsEnabled;
- (BOOL)downloadIsCellular;
- (BOOL)downloadIsConstrained;
- (BOOL)downloadIsExpensive;
- (BOOL)downloadIsMultipath;
- (BOOL)downloadIsProxyConnection;
- (BOOL)downloadIsReusedConnection;
- (BOOL)hasAcceptablePerformanceResult;
- (BOOL)hasAwdlElectionParameters;
- (BOOL)hasAwdlMasterChannel;
- (BOOL)hasAwdlOpMode;
- (BOOL)hasAwdlPowerState;
- (BOOL)hasAwdlSchedule;
- (BOOL)hasAwdlSecondaryMasterChannel;
- (BOOL)hasAwdlSyncChannelSequence;
- (BOOL)hasAwdlSyncState;
- (BOOL)hasBtConnectedDevicesCount;
- (BOOL)hasBtIsConnectable;
- (BOOL)hasBtIsDiscoverable;
- (BOOL)hasBtIsPowerOn;
- (BOOL)hasBtIsScanning;
- (BOOL)hasCallingClient;
- (BOOL)hasCellularActiveContexts;
- (BOOL)hasCellularAggregatedDLBW;
- (BOOL)hasCellularAggregatedULBW;
- (BOOL)hasCellularAllowsVoip;
- (BOOL)hasCellularAttached;
- (BOOL)hasCellularBandinfo;
- (BOOL)hasCellularBandwidth;
- (BOOL)hasCellularCarrierName;
- (BOOL)hasCellularCellid;
- (BOOL)hasCellularDataBearerSoMask;
- (BOOL)hasCellularDataBearerTechnology;
- (BOOL)hasCellularDataIsEnabled;
- (BOOL)hasCellularDataPlanSignalingReductionOverride;
- (BOOL)hasCellularDataPossible;
- (BOOL)hasCellularInHomeCountry;
- (BOOL)hasCellularIndicator;
- (BOOL)hasCellularIndicatorOverride;
- (BOOL)hasCellularIsoCountryCode;
- (BOOL)hasCellularIssa;
- (BOOL)hasCellularLac;
- (BOOL)hasCellularLqm;
- (BOOL)hasCellularLteMaxScheduledLayers;
- (BOOL)hasCellularLteNrConfiguredBw;
- (BOOL)hasCellularMaxDlMod;
- (BOOL)hasCellularMaxNwMimoLyr;
- (BOOL)hasCellularMaxSchdMimoLyr;
- (BOOL)hasCellularMaxUeRank;
- (BOOL)hasCellularMaxUlMod;
- (BOOL)hasCellularMobileCountryCode;
- (BOOL)hasCellularMobileNetworkCode;
- (BOOL)hasCellularNewRadioCoverage;
- (BOOL)hasCellularNewRadioDataBearer;
- (BOOL)hasCellularNewRadioMmwaveDataBearer;
- (BOOL)hasCellularNewRadioNsaCoverage;
- (BOOL)hasCellularNewRadioNsaDataBearer;
- (BOOL)hasCellularNewRadioSaCoverage;
- (BOOL)hasCellularNewRadioSaDataBearer;
- (BOOL)hasCellularNewRadioSub6DataBearer;
- (BOOL)hasCellularNrConfiguredBw;
- (BOOL)hasCellularNrLayers;
- (BOOL)hasCellularNrModulation;
- (BOOL)hasCellularNrRsrp;
- (BOOL)hasCellularNrRsrq;
- (BOOL)hasCellularNrSinr;
- (BOOL)hasCellularNrSnr;
- (BOOL)hasCellularNrarfcn;
- (BOOL)hasCellularPid;
- (BOOL)hasCellularRadioAccessTechnology;
- (BOOL)hasCellularRadioAccessTechnologyCtDataStatus;
- (BOOL)hasCellularRadioFrequency;
- (BOOL)hasCellularRnMobileCountryCode;
- (BOOL)hasCellularRnMobileNetworkCode;
- (BOOL)hasCellularRoamAllowed;
- (BOOL)hasCellularRsrp;
- (BOOL)hasCellularSnr;
- (BOOL)hasCellularTac;
- (BOOL)hasCellularTotalActiveContexts;
- (BOOL)hasCellularTotalBw;
- (BOOL)hasCellularTotalCcs;
- (BOOL)hasCellularTotalDlMimoLayers;
- (BOOL)hasCellularTotalLayers;
- (BOOL)hasCellularTotalNumCcs;
- (BOOL)hasCellularUarfcn;
- (BOOL)hasDownloadCdnPop;
- (BOOL)hasDownloadCdnUuid;
- (BOOL)hasDownloadConnectionTime;
- (BOOL)hasDownloadDomainLookupTime;
- (BOOL)hasDownloadEndCellularEstimate;
- (BOOL)hasDownloadEndDataBearerTechnology;
- (BOOL)hasDownloadEndPrimaryIpv4Interface;
- (BOOL)hasDownloadEndRadioFrequency;
- (BOOL)hasDownloadEndRat;
- (BOOL)hasDownloadError;
- (BOOL)hasDownloadErrorCode;
- (BOOL)hasDownloadErrorDomain;
- (BOOL)hasDownloadFileSize;
- (BOOL)hasDownloadInterfaceName;
- (BOOL)hasDownloadInterfaceServiceName;
- (BOOL)hasDownloadIsCellular;
- (BOOL)hasDownloadIsConstrained;
- (BOOL)hasDownloadIsExpensive;
- (BOOL)hasDownloadIsMultipath;
- (BOOL)hasDownloadIsProxyConnection;
- (BOOL)hasDownloadIsReusedConnection;
- (BOOL)hasDownloadMaxCellularEstimate;
- (BOOL)hasDownloadMaxSpeedObserved;
- (BOOL)hasDownloadNumberOfStreams;
- (BOOL)hasDownloadProtocolName;
- (BOOL)hasDownloadRemoteAddress;
- (BOOL)hasDownloadRemotePort;
- (BOOL)hasDownloadRequestTime;
- (BOOL)hasDownloadRequestToResponseTime;
- (BOOL)hasDownloadResponseTime;
- (BOOL)hasDownloadResponsiveness;
- (BOOL)hasDownloadResponsivenessConfidence;
- (BOOL)hasDownloadResponsivenessRating;
- (BOOL)hasDownloadSecureConnectionTime;
- (BOOL)hasDownloadServer;
- (BOOL)hasDownloadSpeed;
- (BOOL)hasDownloadSpeedConfidence;
- (BOOL)hasDownloadSpeedRating;
- (BOOL)hasDownloadStableSpeed;
- (BOOL)hasDownloadStartCellularEstimate;
- (BOOL)hasDownloadStartDataBearerTechnology;
- (BOOL)hasDownloadStartPrimaryIpv4Interface;
- (BOOL)hasDownloadStartRadioFrequency;
- (BOOL)hasDownloadStartRat;
- (BOOL)hasNetworkIsAppleReachable;
- (BOOL)hasNetworkPrimaryIpv4InterfaceName;
- (BOOL)hasNetworkPrimaryIpv4ServiceName;
- (BOOL)hasNetworkPrimaryIpv6InterfaceName;
- (BOOL)hasNetworkPrimaryIpv6ServiceName;
- (BOOL)hasNetworkQualityDownloadSpeed;
- (BOOL)hasNetworkQualityError;
- (BOOL)hasNetworkQualityErrorCode;
- (BOOL)hasNetworkQualityErrorDomain;
- (BOOL)hasNetworkQualityRating;
- (BOOL)hasNetworkQualityResponsiveness;
- (BOOL)hasNetworkQualityUploadSpeed;
- (BOOL)hasNptkitFrameworkVersion;
- (BOOL)hasPerformanceTestStartTime;
- (BOOL)hasPingAddress;
- (BOOL)hasPingError;
- (BOOL)hasPingErrorCode;
- (BOOL)hasPingErrorDomain;
- (BOOL)hasPingLossPercent;
- (BOOL)hasPingMaxLatency;
- (BOOL)hasPingMeanLatency;
- (BOOL)hasPingMinLatency;
- (BOOL)hasPingStandardDeviation;
- (BOOL)hasPowerBatteryWarningLevel;
- (BOOL)hasPowerSourceType;
- (BOOL)hasPowerStateCaps;
- (BOOL)hasSystemActiveProcessorCount;
- (BOOL)hasSystemBatteryLevel;
- (BOOL)hasSystemBatteryState;
- (BOOL)hasSystemDeviceClass;
- (BOOL)hasSystemDeviceModel;
- (BOOL)hasSystemLowPowerModeEnabled;
- (BOOL)hasSystemName;
- (BOOL)hasSystemOsVariant;
- (BOOL)hasSystemPhysicalMemory;
- (BOOL)hasSystemPowersourceConnected;
- (BOOL)hasSystemProcessorCount;
- (BOOL)hasSystemVersion;
- (BOOL)hasTimestamp;
- (BOOL)hasUploadCdnPop;
- (BOOL)hasUploadCdnUuid;
- (BOOL)hasUploadConnectionTime;
- (BOOL)hasUploadDomainLookupTime;
- (BOOL)hasUploadEndCellularEstimate;
- (BOOL)hasUploadEndDataBearerTechnology;
- (BOOL)hasUploadEndPrimaryIpv4Interface;
- (BOOL)hasUploadEndRadioFrequency;
- (BOOL)hasUploadEndRat;
- (BOOL)hasUploadError;
- (BOOL)hasUploadErrorCode;
- (BOOL)hasUploadErrorDomain;
- (BOOL)hasUploadFileSize;
- (BOOL)hasUploadInterfaceName;
- (BOOL)hasUploadInterfaceServiceName;
- (BOOL)hasUploadIsCellular;
- (BOOL)hasUploadIsConstrained;
- (BOOL)hasUploadIsExpensive;
- (BOOL)hasUploadIsMultipath;
- (BOOL)hasUploadIsProxyConnection;
- (BOOL)hasUploadIsReusedConnection;
- (BOOL)hasUploadMaxCellularEstimate;
- (BOOL)hasUploadMaxSpeedObserved;
- (BOOL)hasUploadNumberOfStreams;
- (BOOL)hasUploadProtocolName;
- (BOOL)hasUploadRemoteAddress;
- (BOOL)hasUploadRemotePort;
- (BOOL)hasUploadRequestTime;
- (BOOL)hasUploadRequestToResponseTime;
- (BOOL)hasUploadResponseTime;
- (BOOL)hasUploadResponsiveness;
- (BOOL)hasUploadResponsivenessConfidence;
- (BOOL)hasUploadResponsivenessRating;
- (BOOL)hasUploadSecureConnectionTime;
- (BOOL)hasUploadServer;
- (BOOL)hasUploadSpeed;
- (BOOL)hasUploadSpeedConfidence;
- (BOOL)hasUploadSpeedRating;
- (BOOL)hasUploadStableSpeed;
- (BOOL)hasUploadStartCellularEstimate;
- (BOOL)hasUploadStartDataBearerTechnology;
- (BOOL)hasUploadStartPrimaryIpv4Interface;
- (BOOL)hasUploadStartRadioFrequency;
- (BOOL)hasUploadStartRat;
- (BOOL)hasUseWifiWasSpecified;
- (BOOL)hasVpnConnectionState;
- (BOOL)hasWifiAveragePhyRateRx;
- (BOOL)hasWifiAverageRssi;
- (BOOL)hasWifiAverageSnr;
- (BOOL)hasWifiAverageTcpRtt;
- (BOOL)hasWifiBtcMode;
- (BOOL)hasWifiCca;
- (BOOL)hasWifiChannel;
- (BOOL)hasWifiChannelBand;
- (BOOL)hasWifiChannelWidth;
- (BOOL)hasWifiCwfCca;
- (BOOL)hasWifiEapolControlMode;
- (BOOL)hasWifiEapolSupplicantState;
- (BOOL)hasWifiGuardInterval;
- (BOOL)hasWifiHiddenState;
- (BOOL)hasWifiIsCaptive;
- (BOOL)hasWifiMcsIndex;
- (BOOL)hasWifiNoise;
- (BOOL)hasWifiNumberOfSpatialStreams;
- (BOOL)hasWifiOpMode;
- (BOOL)hasWifiPhyMode;
- (BOOL)hasWifiRssi;
- (BOOL)hasWifiSecurity;
- (BOOL)hasWifiTxRate;
- (BOOL)hasWrmChannelType;
- (BOOL)isEqual:(id)a3;
- (BOOL)networkIsAppleReachable;
- (BOOL)readFrom:(id)a3;
- (BOOL)systemLowPowerModeEnabled;
- (BOOL)systemPowersourceConnected;
- (BOOL)uploadIsCellular;
- (BOOL)uploadIsConstrained;
- (BOOL)uploadIsExpensive;
- (BOOL)uploadIsMultipath;
- (BOOL)uploadIsProxyConnection;
- (BOOL)uploadIsReusedConnection;
- (BOOL)useWifiWasSpecified;
- (BOOL)wifiIsCaptive;
- (NSString)awdlElectionParameters;
- (NSString)awdlMasterChannel;
- (NSString)awdlOpMode;
- (NSString)awdlSchedule;
- (NSString)awdlSecondaryMasterChannel;
- (NSString)awdlSyncChannelSequence;
- (NSString)awdlSyncState;
- (NSString)btConnectedDevicesCount;
- (NSString)callingClient;
- (NSString)cellularActiveContexts;
- (NSString)cellularAggregatedDLBW;
- (NSString)cellularAggregatedULBW;
- (NSString)cellularAttached;
- (NSString)cellularBandinfo;
- (NSString)cellularBandwidth;
- (NSString)cellularCarrierName;
- (NSString)cellularCellid;
- (NSString)cellularDataBearerSoMask;
- (NSString)cellularDataBearerTechnology;
- (NSString)cellularDataPlanSignalingReductionOverride;
- (NSString)cellularDataPossible;
- (NSString)cellularInHomeCountry;
- (NSString)cellularIndicator;
- (NSString)cellularIndicatorOverride;
- (NSString)cellularIsoCountryCode;
- (NSString)cellularIssa;
- (NSString)cellularLac;
- (NSString)cellularLqm;
- (NSString)cellularLteMaxScheduledLayers;
- (NSString)cellularLteNrConfiguredBw;
- (NSString)cellularMaxDlMod;
- (NSString)cellularMaxNwMimoLyr;
- (NSString)cellularMaxSchdMimoLyr;
- (NSString)cellularMaxUeRank;
- (NSString)cellularMaxUlMod;
- (NSString)cellularMobileCountryCode;
- (NSString)cellularMobileNetworkCode;
- (NSString)cellularNewRadioCoverage;
- (NSString)cellularNewRadioDataBearer;
- (NSString)cellularNewRadioMmwaveDataBearer;
- (NSString)cellularNewRadioNsaCoverage;
- (NSString)cellularNewRadioNsaDataBearer;
- (NSString)cellularNewRadioSaCoverage;
- (NSString)cellularNewRadioSaDataBearer;
- (NSString)cellularNewRadioSub6DataBearer;
- (NSString)cellularNrConfiguredBw;
- (NSString)cellularNrLayers;
- (NSString)cellularNrModulation;
- (NSString)cellularNrRsrp;
- (NSString)cellularNrRsrq;
- (NSString)cellularNrSinr;
- (NSString)cellularNrSnr;
- (NSString)cellularNrarfcn;
- (NSString)cellularPid;
- (NSString)cellularRadioAccessTechnology;
- (NSString)cellularRadioAccessTechnologyCtDataStatus;
- (NSString)cellularRadioFrequency;
- (NSString)cellularRnMobileCountryCode;
- (NSString)cellularRnMobileNetworkCode;
- (NSString)cellularRoamAllowed;
- (NSString)cellularRsrp;
- (NSString)cellularSnr;
- (NSString)cellularTac;
- (NSString)cellularTotalActiveContexts;
- (NSString)cellularTotalBw;
- (NSString)cellularTotalCcs;
- (NSString)cellularTotalDlMimoLayers;
- (NSString)cellularTotalLayers;
- (NSString)cellularTotalNumCcs;
- (NSString)cellularUarfcn;
- (NSString)downloadCdnPop;
- (NSString)downloadCdnUuid;
- (NSString)downloadConnectionTime;
- (NSString)downloadDomainLookupTime;
- (NSString)downloadEndCellularEstimate;
- (NSString)downloadEndDataBearerTechnology;
- (NSString)downloadEndPrimaryIpv4Interface;
- (NSString)downloadEndRadioFrequency;
- (NSString)downloadEndRat;
- (NSString)downloadError;
- (NSString)downloadErrorCode;
- (NSString)downloadErrorDomain;
- (NSString)downloadFileSize;
- (NSString)downloadInterfaceName;
- (NSString)downloadInterfaceServiceName;
- (NSString)downloadMaxCellularEstimate;
- (NSString)downloadMaxSpeedObserved;
- (NSString)downloadNumberOfStreams;
- (NSString)downloadProtocolName;
- (NSString)downloadRemoteAddress;
- (NSString)downloadRemotePort;
- (NSString)downloadRequestTime;
- (NSString)downloadRequestToResponseTime;
- (NSString)downloadResponseTime;
- (NSString)downloadResponsiveness;
- (NSString)downloadResponsivenessConfidence;
- (NSString)downloadResponsivenessRating;
- (NSString)downloadSecureConnectionTime;
- (NSString)downloadServer;
- (NSString)downloadSpeed;
- (NSString)downloadSpeedConfidence;
- (NSString)downloadSpeedRating;
- (NSString)downloadStableSpeed;
- (NSString)downloadStartCellularEstimate;
- (NSString)downloadStartDataBearerTechnology;
- (NSString)downloadStartPrimaryIpv4Interface;
- (NSString)downloadStartRadioFrequency;
- (NSString)downloadStartRat;
- (NSString)networkPrimaryIpv4InterfaceName;
- (NSString)networkPrimaryIpv4ServiceName;
- (NSString)networkPrimaryIpv6InterfaceName;
- (NSString)networkPrimaryIpv6ServiceName;
- (NSString)networkQualityDownloadSpeed;
- (NSString)networkQualityError;
- (NSString)networkQualityErrorCode;
- (NSString)networkQualityErrorDomain;
- (NSString)networkQualityRating;
- (NSString)networkQualityResponsiveness;
- (NSString)networkQualityUploadSpeed;
- (NSString)nptkitFrameworkVersion;
- (NSString)performanceTestStartTime;
- (NSString)pingAddress;
- (NSString)pingError;
- (NSString)pingErrorCode;
- (NSString)pingErrorDomain;
- (NSString)pingLossPercent;
- (NSString)pingMaxLatency;
- (NSString)pingMeanLatency;
- (NSString)pingMinLatency;
- (NSString)pingStandardDeviation;
- (NSString)powerBatteryWarningLevel;
- (NSString)powerSourceType;
- (NSString)powerStateCaps;
- (NSString)systemActiveProcessorCount;
- (NSString)systemBatteryLevel;
- (NSString)systemBatteryState;
- (NSString)systemDeviceClass;
- (NSString)systemDeviceModel;
- (NSString)systemName;
- (NSString)systemOsVariant;
- (NSString)systemPhysicalMemory;
- (NSString)systemProcessorCount;
- (NSString)systemVersion;
- (NSString)uploadCdnPop;
- (NSString)uploadCdnUuid;
- (NSString)uploadConnectionTime;
- (NSString)uploadDomainLookupTime;
- (NSString)uploadEndCellularEstimate;
- (NSString)uploadEndDataBearerTechnology;
- (NSString)uploadEndPrimaryIpv4Interface;
- (NSString)uploadEndRadioFrequency;
- (NSString)uploadEndRat;
- (NSString)uploadError;
- (NSString)uploadErrorCode;
- (NSString)uploadErrorDomain;
- (NSString)uploadFileSize;
- (NSString)uploadInterfaceName;
- (NSString)uploadInterfaceServiceName;
- (NSString)uploadMaxCellularEstimate;
- (NSString)uploadMaxSpeedObserved;
- (NSString)uploadNumberOfStreams;
- (NSString)uploadProtocolName;
- (NSString)uploadRemoteAddress;
- (NSString)uploadRemotePort;
- (NSString)uploadRequestTime;
- (NSString)uploadRequestToResponseTime;
- (NSString)uploadResponseTime;
- (NSString)uploadResponsiveness;
- (NSString)uploadResponsivenessConfidence;
- (NSString)uploadResponsivenessRating;
- (NSString)uploadSecureConnectionTime;
- (NSString)uploadServer;
- (NSString)uploadSpeed;
- (NSString)uploadSpeedConfidence;
- (NSString)uploadSpeedRating;
- (NSString)uploadStableSpeed;
- (NSString)uploadStartCellularEstimate;
- (NSString)uploadStartDataBearerTechnology;
- (NSString)uploadStartPrimaryIpv4Interface;
- (NSString)uploadStartRadioFrequency;
- (NSString)uploadStartRat;
- (NSString)vpnConnectionState;
- (NSString)wifiAveragePhyRateRx;
- (NSString)wifiAverageRssi;
- (NSString)wifiAverageSnr;
- (NSString)wifiAverageTcpRtt;
- (NSString)wifiBtcMode;
- (NSString)wifiCca;
- (NSString)wifiChannel;
- (NSString)wifiChannelBand;
- (NSString)wifiChannelWidth;
- (NSString)wifiCwfCca;
- (NSString)wifiEapolControlMode;
- (NSString)wifiEapolSupplicantState;
- (NSString)wifiGuardInterval;
- (NSString)wifiHiddenState;
- (NSString)wifiMcsIndex;
- (NSString)wifiNoise;
- (NSString)wifiNumberOfSpatialStreams;
- (NSString)wifiOpMode;
- (NSString)wifiPhyMode;
- (NSString)wifiRssi;
- (NSString)wifiSecurity;
- (NSString)wifiTxRate;
- (NSString)wrmChannelType;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unint64_t)timestamp;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAcceptablePerformanceResult:(BOOL)a3;
- (void)setAwdlElectionParameters:(id)a3;
- (void)setAwdlMasterChannel:(id)a3;
- (void)setAwdlOpMode:(id)a3;
- (void)setAwdlPowerState:(BOOL)a3;
- (void)setAwdlSchedule:(id)a3;
- (void)setAwdlSecondaryMasterChannel:(id)a3;
- (void)setAwdlSyncChannelSequence:(id)a3;
- (void)setAwdlSyncState:(id)a3;
- (void)setBtConnectedDevicesCount:(id)a3;
- (void)setBtIsConnectable:(BOOL)a3;
- (void)setBtIsDiscoverable:(BOOL)a3;
- (void)setBtIsPowerOn:(BOOL)a3;
- (void)setBtIsScanning:(BOOL)a3;
- (void)setCallingClient:(id)a3;
- (void)setCellularActiveContexts:(id)a3;
- (void)setCellularAggregatedDLBW:(id)a3;
- (void)setCellularAggregatedULBW:(id)a3;
- (void)setCellularAllowsVoip:(BOOL)a3;
- (void)setCellularAttached:(id)a3;
- (void)setCellularBandinfo:(id)a3;
- (void)setCellularBandwidth:(id)a3;
- (void)setCellularCarrierName:(id)a3;
- (void)setCellularCellid:(id)a3;
- (void)setCellularDataBearerSoMask:(id)a3;
- (void)setCellularDataBearerTechnology:(id)a3;
- (void)setCellularDataIsEnabled:(BOOL)a3;
- (void)setCellularDataPlanSignalingReductionOverride:(id)a3;
- (void)setCellularDataPossible:(id)a3;
- (void)setCellularInHomeCountry:(id)a3;
- (void)setCellularIndicator:(id)a3;
- (void)setCellularIndicatorOverride:(id)a3;
- (void)setCellularIsoCountryCode:(id)a3;
- (void)setCellularIssa:(id)a3;
- (void)setCellularLac:(id)a3;
- (void)setCellularLqm:(id)a3;
- (void)setCellularLteMaxScheduledLayers:(id)a3;
- (void)setCellularLteNrConfiguredBw:(id)a3;
- (void)setCellularMaxDlMod:(id)a3;
- (void)setCellularMaxNwMimoLyr:(id)a3;
- (void)setCellularMaxSchdMimoLyr:(id)a3;
- (void)setCellularMaxUeRank:(id)a3;
- (void)setCellularMaxUlMod:(id)a3;
- (void)setCellularMobileCountryCode:(id)a3;
- (void)setCellularMobileNetworkCode:(id)a3;
- (void)setCellularNewRadioCoverage:(id)a3;
- (void)setCellularNewRadioDataBearer:(id)a3;
- (void)setCellularNewRadioMmwaveDataBearer:(id)a3;
- (void)setCellularNewRadioNsaCoverage:(id)a3;
- (void)setCellularNewRadioNsaDataBearer:(id)a3;
- (void)setCellularNewRadioSaCoverage:(id)a3;
- (void)setCellularNewRadioSaDataBearer:(id)a3;
- (void)setCellularNewRadioSub6DataBearer:(id)a3;
- (void)setCellularNrConfiguredBw:(id)a3;
- (void)setCellularNrLayers:(id)a3;
- (void)setCellularNrModulation:(id)a3;
- (void)setCellularNrRsrp:(id)a3;
- (void)setCellularNrRsrq:(id)a3;
- (void)setCellularNrSinr:(id)a3;
- (void)setCellularNrSnr:(id)a3;
- (void)setCellularNrarfcn:(id)a3;
- (void)setCellularPid:(id)a3;
- (void)setCellularRadioAccessTechnology:(id)a3;
- (void)setCellularRadioAccessTechnologyCtDataStatus:(id)a3;
- (void)setCellularRadioFrequency:(id)a3;
- (void)setCellularRnMobileCountryCode:(id)a3;
- (void)setCellularRnMobileNetworkCode:(id)a3;
- (void)setCellularRoamAllowed:(id)a3;
- (void)setCellularRsrp:(id)a3;
- (void)setCellularSnr:(id)a3;
- (void)setCellularTac:(id)a3;
- (void)setCellularTotalActiveContexts:(id)a3;
- (void)setCellularTotalBw:(id)a3;
- (void)setCellularTotalCcs:(id)a3;
- (void)setCellularTotalDlMimoLayers:(id)a3;
- (void)setCellularTotalLayers:(id)a3;
- (void)setCellularTotalNumCcs:(id)a3;
- (void)setCellularUarfcn:(id)a3;
- (void)setDownloadCdnPop:(id)a3;
- (void)setDownloadCdnUuid:(id)a3;
- (void)setDownloadConnectionTime:(id)a3;
- (void)setDownloadDomainLookupTime:(id)a3;
- (void)setDownloadEndCellularEstimate:(id)a3;
- (void)setDownloadEndDataBearerTechnology:(id)a3;
- (void)setDownloadEndPrimaryIpv4Interface:(id)a3;
- (void)setDownloadEndRadioFrequency:(id)a3;
- (void)setDownloadEndRat:(id)a3;
- (void)setDownloadError:(id)a3;
- (void)setDownloadErrorCode:(id)a3;
- (void)setDownloadErrorDomain:(id)a3;
- (void)setDownloadFileSize:(id)a3;
- (void)setDownloadInterfaceName:(id)a3;
- (void)setDownloadInterfaceServiceName:(id)a3;
- (void)setDownloadIsCellular:(BOOL)a3;
- (void)setDownloadIsConstrained:(BOOL)a3;
- (void)setDownloadIsExpensive:(BOOL)a3;
- (void)setDownloadIsMultipath:(BOOL)a3;
- (void)setDownloadIsProxyConnection:(BOOL)a3;
- (void)setDownloadIsReusedConnection:(BOOL)a3;
- (void)setDownloadMaxCellularEstimate:(id)a3;
- (void)setDownloadMaxSpeedObserved:(id)a3;
- (void)setDownloadNumberOfStreams:(id)a3;
- (void)setDownloadProtocolName:(id)a3;
- (void)setDownloadRemoteAddress:(id)a3;
- (void)setDownloadRemotePort:(id)a3;
- (void)setDownloadRequestTime:(id)a3;
- (void)setDownloadRequestToResponseTime:(id)a3;
- (void)setDownloadResponseTime:(id)a3;
- (void)setDownloadResponsiveness:(id)a3;
- (void)setDownloadResponsivenessConfidence:(id)a3;
- (void)setDownloadResponsivenessRating:(id)a3;
- (void)setDownloadSecureConnectionTime:(id)a3;
- (void)setDownloadServer:(id)a3;
- (void)setDownloadSpeed:(id)a3;
- (void)setDownloadSpeedConfidence:(id)a3;
- (void)setDownloadSpeedRating:(id)a3;
- (void)setDownloadStableSpeed:(id)a3;
- (void)setDownloadStartCellularEstimate:(id)a3;
- (void)setDownloadStartDataBearerTechnology:(id)a3;
- (void)setDownloadStartPrimaryIpv4Interface:(id)a3;
- (void)setDownloadStartRadioFrequency:(id)a3;
- (void)setDownloadStartRat:(id)a3;
- (void)setHasAcceptablePerformanceResult:(BOOL)a3;
- (void)setHasAwdlPowerState:(BOOL)a3;
- (void)setHasBtIsConnectable:(BOOL)a3;
- (void)setHasBtIsDiscoverable:(BOOL)a3;
- (void)setHasBtIsPowerOn:(BOOL)a3;
- (void)setHasBtIsScanning:(BOOL)a3;
- (void)setHasCellularAllowsVoip:(BOOL)a3;
- (void)setHasCellularDataIsEnabled:(BOOL)a3;
- (void)setHasDownloadIsCellular:(BOOL)a3;
- (void)setHasDownloadIsConstrained:(BOOL)a3;
- (void)setHasDownloadIsExpensive:(BOOL)a3;
- (void)setHasDownloadIsMultipath:(BOOL)a3;
- (void)setHasDownloadIsProxyConnection:(BOOL)a3;
- (void)setHasDownloadIsReusedConnection:(BOOL)a3;
- (void)setHasNetworkIsAppleReachable:(BOOL)a3;
- (void)setHasSystemLowPowerModeEnabled:(BOOL)a3;
- (void)setHasSystemPowersourceConnected:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setHasUploadIsCellular:(BOOL)a3;
- (void)setHasUploadIsConstrained:(BOOL)a3;
- (void)setHasUploadIsExpensive:(BOOL)a3;
- (void)setHasUploadIsMultipath:(BOOL)a3;
- (void)setHasUploadIsProxyConnection:(BOOL)a3;
- (void)setHasUploadIsReusedConnection:(BOOL)a3;
- (void)setHasUseWifiWasSpecified:(BOOL)a3;
- (void)setHasWifiIsCaptive:(BOOL)a3;
- (void)setNetworkIsAppleReachable:(BOOL)a3;
- (void)setNetworkPrimaryIpv4InterfaceName:(id)a3;
- (void)setNetworkPrimaryIpv4ServiceName:(id)a3;
- (void)setNetworkPrimaryIpv6InterfaceName:(id)a3;
- (void)setNetworkPrimaryIpv6ServiceName:(id)a3;
- (void)setNetworkQualityDownloadSpeed:(id)a3;
- (void)setNetworkQualityError:(id)a3;
- (void)setNetworkQualityErrorCode:(id)a3;
- (void)setNetworkQualityErrorDomain:(id)a3;
- (void)setNetworkQualityRating:(id)a3;
- (void)setNetworkQualityResponsiveness:(id)a3;
- (void)setNetworkQualityUploadSpeed:(id)a3;
- (void)setNptkitFrameworkVersion:(id)a3;
- (void)setPerformanceTestStartTime:(id)a3;
- (void)setPingAddress:(id)a3;
- (void)setPingError:(id)a3;
- (void)setPingErrorCode:(id)a3;
- (void)setPingErrorDomain:(id)a3;
- (void)setPingLossPercent:(id)a3;
- (void)setPingMaxLatency:(id)a3;
- (void)setPingMeanLatency:(id)a3;
- (void)setPingMinLatency:(id)a3;
- (void)setPingStandardDeviation:(id)a3;
- (void)setPowerBatteryWarningLevel:(id)a3;
- (void)setPowerSourceType:(id)a3;
- (void)setPowerStateCaps:(id)a3;
- (void)setSystemActiveProcessorCount:(id)a3;
- (void)setSystemBatteryLevel:(id)a3;
- (void)setSystemBatteryState:(id)a3;
- (void)setSystemDeviceClass:(id)a3;
- (void)setSystemDeviceModel:(id)a3;
- (void)setSystemLowPowerModeEnabled:(BOOL)a3;
- (void)setSystemName:(id)a3;
- (void)setSystemOsVariant:(id)a3;
- (void)setSystemPhysicalMemory:(id)a3;
- (void)setSystemPowersourceConnected:(BOOL)a3;
- (void)setSystemProcessorCount:(id)a3;
- (void)setSystemVersion:(id)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)setUploadCdnPop:(id)a3;
- (void)setUploadCdnUuid:(id)a3;
- (void)setUploadConnectionTime:(id)a3;
- (void)setUploadDomainLookupTime:(id)a3;
- (void)setUploadEndCellularEstimate:(id)a3;
- (void)setUploadEndDataBearerTechnology:(id)a3;
- (void)setUploadEndPrimaryIpv4Interface:(id)a3;
- (void)setUploadEndRadioFrequency:(id)a3;
- (void)setUploadEndRat:(id)a3;
- (void)setUploadError:(id)a3;
- (void)setUploadErrorCode:(id)a3;
- (void)setUploadErrorDomain:(id)a3;
- (void)setUploadFileSize:(id)a3;
- (void)setUploadInterfaceName:(id)a3;
- (void)setUploadInterfaceServiceName:(id)a3;
- (void)setUploadIsCellular:(BOOL)a3;
- (void)setUploadIsConstrained:(BOOL)a3;
- (void)setUploadIsExpensive:(BOOL)a3;
- (void)setUploadIsMultipath:(BOOL)a3;
- (void)setUploadIsProxyConnection:(BOOL)a3;
- (void)setUploadIsReusedConnection:(BOOL)a3;
- (void)setUploadMaxCellularEstimate:(id)a3;
- (void)setUploadMaxSpeedObserved:(id)a3;
- (void)setUploadNumberOfStreams:(id)a3;
- (void)setUploadProtocolName:(id)a3;
- (void)setUploadRemoteAddress:(id)a3;
- (void)setUploadRemotePort:(id)a3;
- (void)setUploadRequestTime:(id)a3;
- (void)setUploadRequestToResponseTime:(id)a3;
- (void)setUploadResponseTime:(id)a3;
- (void)setUploadResponsiveness:(id)a3;
- (void)setUploadResponsivenessConfidence:(id)a3;
- (void)setUploadResponsivenessRating:(id)a3;
- (void)setUploadSecureConnectionTime:(id)a3;
- (void)setUploadServer:(id)a3;
- (void)setUploadSpeed:(id)a3;
- (void)setUploadSpeedConfidence:(id)a3;
- (void)setUploadSpeedRating:(id)a3;
- (void)setUploadStableSpeed:(id)a3;
- (void)setUploadStartCellularEstimate:(id)a3;
- (void)setUploadStartDataBearerTechnology:(id)a3;
- (void)setUploadStartPrimaryIpv4Interface:(id)a3;
- (void)setUploadStartRadioFrequency:(id)a3;
- (void)setUploadStartRat:(id)a3;
- (void)setUseWifiWasSpecified:(BOOL)a3;
- (void)setVpnConnectionState:(id)a3;
- (void)setWifiAveragePhyRateRx:(id)a3;
- (void)setWifiAverageRssi:(id)a3;
- (void)setWifiAverageSnr:(id)a3;
- (void)setWifiAverageTcpRtt:(id)a3;
- (void)setWifiBtcMode:(id)a3;
- (void)setWifiCca:(id)a3;
- (void)setWifiChannel:(id)a3;
- (void)setWifiChannelBand:(id)a3;
- (void)setWifiChannelWidth:(id)a3;
- (void)setWifiCwfCca:(id)a3;
- (void)setWifiEapolControlMode:(id)a3;
- (void)setWifiEapolSupplicantState:(id)a3;
- (void)setWifiGuardInterval:(id)a3;
- (void)setWifiHiddenState:(id)a3;
- (void)setWifiIsCaptive:(BOOL)a3;
- (void)setWifiMcsIndex:(id)a3;
- (void)setWifiNoise:(id)a3;
- (void)setWifiNumberOfSpatialStreams:(id)a3;
- (void)setWifiOpMode:(id)a3;
- (void)setWifiPhyMode:(id)a3;
- (void)setWifiRssi:(id)a3;
- (void)setWifiSecurity:(id)a3;
- (void)setWifiTxRate:(id)a3;
- (void)setWrmChannelType:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDNetworkPerformanceMetric

- (void)setTimestamp:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 1u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  self->_has = ($0FF3A8E67B3D88A75EBF7BE240CB1B75)(*(_DWORD *)&self->_has & 0xFFFFFFFE | a3);
}

- (BOOL)hasTimestamp
{
  return *(_DWORD *)&self->_has & 1;
}

- (void)setAcceptablePerformanceResult:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 2u;
  self->_acceptablePerformanceResult = a3;
}

- (void)setHasAcceptablePerformanceResult:(BOOL)a3
{
  if (a3) {
    int v3 = 2;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($0FF3A8E67B3D88A75EBF7BE240CB1B75)(*(_DWORD *)&self->_has & 0xFFFFFFFD | v3);
}

- (BOOL)hasAcceptablePerformanceResult
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (BOOL)hasAwdlElectionParameters
{
  return self->_awdlElectionParameters != 0;
}

- (BOOL)hasAwdlMasterChannel
{
  return self->_awdlMasterChannel != 0;
}

- (BOOL)hasAwdlOpMode
{
  return self->_awdlOpMode != 0;
}

- (void)setAwdlPowerState:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 4u;
  self->_awdlPowerState = a3;
}

- (void)setHasAwdlPowerState:(BOOL)a3
{
  if (a3) {
    int v3 = 4;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($0FF3A8E67B3D88A75EBF7BE240CB1B75)(*(_DWORD *)&self->_has & 0xFFFFFFFB | v3);
}

- (BOOL)hasAwdlPowerState
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (BOOL)hasAwdlSchedule
{
  return self->_awdlSchedule != 0;
}

- (BOOL)hasAwdlSecondaryMasterChannel
{
  return self->_awdlSecondaryMasterChannel != 0;
}

- (BOOL)hasAwdlSyncChannelSequence
{
  return self->_awdlSyncChannelSequence != 0;
}

- (BOOL)hasAwdlSyncState
{
  return self->_awdlSyncState != 0;
}

- (BOOL)hasBtConnectedDevicesCount
{
  return self->_btConnectedDevicesCount != 0;
}

- (void)setBtIsConnectable:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 8u;
  self->_btIsConnectable = a3;
}

- (void)setHasBtIsConnectable:(BOOL)a3
{
  if (a3) {
    int v3 = 8;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($0FF3A8E67B3D88A75EBF7BE240CB1B75)(*(_DWORD *)&self->_has & 0xFFFFFFF7 | v3);
}

- (BOOL)hasBtIsConnectable
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setBtIsDiscoverable:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x10u;
  self->_btIsDiscoverable = a3;
}

- (void)setHasBtIsDiscoverable:(BOOL)a3
{
  if (a3) {
    int v3 = 16;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($0FF3A8E67B3D88A75EBF7BE240CB1B75)(*(_DWORD *)&self->_has & 0xFFFFFFEF | v3);
}

- (BOOL)hasBtIsDiscoverable
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setBtIsPowerOn:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x20u;
  self->_btIsPowerOn = a3;
}

- (void)setHasBtIsPowerOn:(BOOL)a3
{
  if (a3) {
    int v3 = 32;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($0FF3A8E67B3D88A75EBF7BE240CB1B75)(*(_DWORD *)&self->_has & 0xFFFFFFDF | v3);
}

- (BOOL)hasBtIsPowerOn
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (void)setBtIsScanning:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x40u;
  self->_btIsScanning = a3;
}

- (void)setHasBtIsScanning:(BOOL)a3
{
  if (a3) {
    int v3 = 64;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($0FF3A8E67B3D88A75EBF7BE240CB1B75)(*(_DWORD *)&self->_has & 0xFFFFFFBF | v3);
}

- (BOOL)hasBtIsScanning
{
  return (*(unsigned char *)&self->_has >> 6) & 1;
}

- (BOOL)hasCallingClient
{
  return self->_callingClient != 0;
}

- (BOOL)hasCellularActiveContexts
{
  return self->_cellularActiveContexts != 0;
}

- (void)setCellularAllowsVoip:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x80u;
  self->_cellularAllowsVoip = a3;
}

- (void)setHasCellularAllowsVoip:(BOOL)a3
{
  if (a3) {
    int v3 = 128;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($0FF3A8E67B3D88A75EBF7BE240CB1B75)(*(_DWORD *)&self->_has & 0xFFFFFF7F | v3);
}

- (BOOL)hasCellularAllowsVoip
{
  return *(unsigned char *)&self->_has >> 7;
}

- (BOOL)hasCellularAttached
{
  return self->_cellularAttached != 0;
}

- (BOOL)hasCellularBandinfo
{
  return self->_cellularBandinfo != 0;
}

- (BOOL)hasCellularBandwidth
{
  return self->_cellularBandwidth != 0;
}

- (BOOL)hasCellularCarrierName
{
  return self->_cellularCarrierName != 0;
}

- (BOOL)hasCellularDataBearerSoMask
{
  return self->_cellularDataBearerSoMask != 0;
}

- (BOOL)hasCellularDataBearerTechnology
{
  return self->_cellularDataBearerTechnology != 0;
}

- (BOOL)hasCellularDataPlanSignalingReductionOverride
{
  return self->_cellularDataPlanSignalingReductionOverride != 0;
}

- (BOOL)hasCellularDataPossible
{
  return self->_cellularDataPossible != 0;
}

- (BOOL)hasCellularInHomeCountry
{
  return self->_cellularInHomeCountry != 0;
}

- (BOOL)hasCellularIndicator
{
  return self->_cellularIndicator != 0;
}

- (BOOL)hasCellularIndicatorOverride
{
  return self->_cellularIndicatorOverride != 0;
}

- (BOOL)hasCellularIsoCountryCode
{
  return self->_cellularIsoCountryCode != 0;
}

- (BOOL)hasCellularLqm
{
  return self->_cellularLqm != 0;
}

- (BOOL)hasCellularLteMaxScheduledLayers
{
  return self->_cellularLteMaxScheduledLayers != 0;
}

- (BOOL)hasCellularMobileCountryCode
{
  return self->_cellularMobileCountryCode != 0;
}

- (BOOL)hasCellularMobileNetworkCode
{
  return self->_cellularMobileNetworkCode != 0;
}

- (BOOL)hasCellularNewRadioCoverage
{
  return self->_cellularNewRadioCoverage != 0;
}

- (BOOL)hasCellularNewRadioDataBearer
{
  return self->_cellularNewRadioDataBearer != 0;
}

- (BOOL)hasCellularNewRadioMmwaveDataBearer
{
  return self->_cellularNewRadioMmwaveDataBearer != 0;
}

- (BOOL)hasCellularNewRadioNsaCoverage
{
  return self->_cellularNewRadioNsaCoverage != 0;
}

- (BOOL)hasCellularNewRadioNsaDataBearer
{
  return self->_cellularNewRadioNsaDataBearer != 0;
}

- (BOOL)hasCellularNewRadioSaCoverage
{
  return self->_cellularNewRadioSaCoverage != 0;
}

- (BOOL)hasCellularNewRadioSaDataBearer
{
  return self->_cellularNewRadioSaDataBearer != 0;
}

- (BOOL)hasCellularNewRadioSub6DataBearer
{
  return self->_cellularNewRadioSub6DataBearer != 0;
}

- (BOOL)hasCellularNrConfiguredBw
{
  return self->_cellularNrConfiguredBw != 0;
}

- (BOOL)hasCellularNrLayers
{
  return self->_cellularNrLayers != 0;
}

- (BOOL)hasCellularNrModulation
{
  return self->_cellularNrModulation != 0;
}

- (BOOL)hasCellularNrRsrp
{
  return self->_cellularNrRsrp != 0;
}

- (BOOL)hasCellularNrRsrq
{
  return self->_cellularNrRsrq != 0;
}

- (BOOL)hasCellularNrSnr
{
  return self->_cellularNrSnr != 0;
}

- (BOOL)hasCellularPid
{
  return self->_cellularPid != 0;
}

- (BOOL)hasCellularRadioAccessTechnology
{
  return self->_cellularRadioAccessTechnology != 0;
}

- (BOOL)hasCellularRadioAccessTechnologyCtDataStatus
{
  return self->_cellularRadioAccessTechnologyCtDataStatus != 0;
}

- (BOOL)hasCellularRoamAllowed
{
  return self->_cellularRoamAllowed != 0;
}

- (BOOL)hasCellularRsrp
{
  return self->_cellularRsrp != 0;
}

- (BOOL)hasCellularSnr
{
  return self->_cellularSnr != 0;
}

- (BOOL)hasCellularTac
{
  return self->_cellularTac != 0;
}

- (BOOL)hasCellularTotalActiveContexts
{
  return self->_cellularTotalActiveContexts != 0;
}

- (BOOL)hasCellularTotalBw
{
  return self->_cellularTotalBw != 0;
}

- (BOOL)hasCellularTotalCcs
{
  return self->_cellularTotalCcs != 0;
}

- (BOOL)hasCellularTotalLayers
{
  return self->_cellularTotalLayers != 0;
}

- (BOOL)hasCellularUarfcn
{
  return self->_cellularUarfcn != 0;
}

- (BOOL)hasDownloadCdnPop
{
  return self->_downloadCdnPop != 0;
}

- (BOOL)hasDownloadCdnUuid
{
  return self->_downloadCdnUuid != 0;
}

- (BOOL)hasDownloadConnectionTime
{
  return self->_downloadConnectionTime != 0;
}

- (BOOL)hasDownloadDomainLookupTime
{
  return self->_downloadDomainLookupTime != 0;
}

- (BOOL)hasDownloadEndDataBearerTechnology
{
  return self->_downloadEndDataBearerTechnology != 0;
}

- (BOOL)hasDownloadEndPrimaryIpv4Interface
{
  return self->_downloadEndPrimaryIpv4Interface != 0;
}

- (BOOL)hasDownloadEndRat
{
  return self->_downloadEndRat != 0;
}

- (BOOL)hasDownloadFileSize
{
  return self->_downloadFileSize != 0;
}

- (BOOL)hasDownloadInterfaceName
{
  return self->_downloadInterfaceName != 0;
}

- (BOOL)hasDownloadInterfaceServiceName
{
  return self->_downloadInterfaceServiceName != 0;
}

- (void)setDownloadIsCellular:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x200u;
  self->_downloadIsCellular = a3;
}

- (void)setHasDownloadIsCellular:(BOOL)a3
{
  if (a3) {
    int v3 = 512;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($0FF3A8E67B3D88A75EBF7BE240CB1B75)(*(_DWORD *)&self->_has & 0xFFFFFDFF | v3);
}

- (BOOL)hasDownloadIsCellular
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 1) & 1;
}

- (void)setDownloadIsConstrained:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x400u;
  self->_downloadIsConstrained = a3;
}

- (void)setHasDownloadIsConstrained:(BOOL)a3
{
  if (a3) {
    int v3 = 1024;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($0FF3A8E67B3D88A75EBF7BE240CB1B75)(*(_DWORD *)&self->_has & 0xFFFFFBFF | v3);
}

- (BOOL)hasDownloadIsConstrained
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 2) & 1;
}

- (void)setDownloadIsExpensive:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x800u;
  self->_downloadIsExpensive = a3;
}

- (void)setHasDownloadIsExpensive:(BOOL)a3
{
  if (a3) {
    int v3 = 2048;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($0FF3A8E67B3D88A75EBF7BE240CB1B75)(*(_DWORD *)&self->_has & 0xFFFFF7FF | v3);
}

- (BOOL)hasDownloadIsExpensive
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 3) & 1;
}

- (void)setDownloadIsMultipath:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x1000u;
  self->_downloadIsMultipath = a3;
}

- (void)setHasDownloadIsMultipath:(BOOL)a3
{
  if (a3) {
    int v3 = 4096;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($0FF3A8E67B3D88A75EBF7BE240CB1B75)(*(_DWORD *)&self->_has & 0xFFFFEFFF | v3);
}

- (BOOL)hasDownloadIsMultipath
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 4) & 1;
}

- (void)setDownloadIsProxyConnection:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x2000u;
  self->_downloadIsProxyConnection = a3;
}

- (void)setHasDownloadIsProxyConnection:(BOOL)a3
{
  if (a3) {
    int v3 = 0x2000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($0FF3A8E67B3D88A75EBF7BE240CB1B75)(*(_DWORD *)&self->_has & 0xFFFFDFFF | v3);
}

- (BOOL)hasDownloadIsProxyConnection
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 5) & 1;
}

- (void)setDownloadIsReusedConnection:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x4000u;
  self->_downloadIsReusedConnection = a3;
}

- (void)setHasDownloadIsReusedConnection:(BOOL)a3
{
  if (a3) {
    int v3 = 0x4000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($0FF3A8E67B3D88A75EBF7BE240CB1B75)(*(_DWORD *)&self->_has & 0xFFFFBFFF | v3);
}

- (BOOL)hasDownloadIsReusedConnection
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 6) & 1;
}

- (BOOL)hasDownloadMaxSpeedObserved
{
  return self->_downloadMaxSpeedObserved != 0;
}

- (BOOL)hasDownloadNumberOfStreams
{
  return self->_downloadNumberOfStreams != 0;
}

- (BOOL)hasDownloadProtocolName
{
  return self->_downloadProtocolName != 0;
}

- (BOOL)hasDownloadRemoteAddress
{
  return self->_downloadRemoteAddress != 0;
}

- (BOOL)hasDownloadRemotePort
{
  return self->_downloadRemotePort != 0;
}

- (BOOL)hasDownloadRequestTime
{
  return self->_downloadRequestTime != 0;
}

- (BOOL)hasDownloadRequestToResponseTime
{
  return self->_downloadRequestToResponseTime != 0;
}

- (BOOL)hasDownloadResponseTime
{
  return self->_downloadResponseTime != 0;
}

- (BOOL)hasDownloadSecureConnectionTime
{
  return self->_downloadSecureConnectionTime != 0;
}

- (BOOL)hasDownloadServer
{
  return self->_downloadServer != 0;
}

- (BOOL)hasDownloadSpeed
{
  return self->_downloadSpeed != 0;
}

- (BOOL)hasDownloadStableSpeed
{
  return self->_downloadStableSpeed != 0;
}

- (BOOL)hasDownloadStartDataBearerTechnology
{
  return self->_downloadStartDataBearerTechnology != 0;
}

- (BOOL)hasDownloadStartPrimaryIpv4Interface
{
  return self->_downloadStartPrimaryIpv4Interface != 0;
}

- (BOOL)hasDownloadStartRat
{
  return self->_downloadStartRat != 0;
}

- (void)setNetworkIsAppleReachable:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x8000u;
  self->_networkIsAppleReachable = a3;
}

- (void)setHasNetworkIsAppleReachable:(BOOL)a3
{
  if (a3) {
    int v3 = 0x8000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($0FF3A8E67B3D88A75EBF7BE240CB1B75)(*(_DWORD *)&self->_has & 0xFFFF7FFF | v3);
}

- (BOOL)hasNetworkIsAppleReachable
{
  return *((unsigned __int8 *)&self->_has + 1) >> 7;
}

- (BOOL)hasNetworkPrimaryIpv4InterfaceName
{
  return self->_networkPrimaryIpv4InterfaceName != 0;
}

- (BOOL)hasNetworkPrimaryIpv4ServiceName
{
  return self->_networkPrimaryIpv4ServiceName != 0;
}

- (BOOL)hasNptkitFrameworkVersion
{
  return self->_nptkitFrameworkVersion != 0;
}

- (BOOL)hasPerformanceTestStartTime
{
  return self->_performanceTestStartTime != 0;
}

- (BOOL)hasPingAddress
{
  return self->_pingAddress != 0;
}

- (BOOL)hasPingLossPercent
{
  return self->_pingLossPercent != 0;
}

- (BOOL)hasPingMaxLatency
{
  return self->_pingMaxLatency != 0;
}

- (BOOL)hasPingMeanLatency
{
  return self->_pingMeanLatency != 0;
}

- (BOOL)hasPingMinLatency
{
  return self->_pingMinLatency != 0;
}

- (BOOL)hasPingStandardDeviation
{
  return self->_pingStandardDeviation != 0;
}

- (BOOL)hasPowerBatteryWarningLevel
{
  return self->_powerBatteryWarningLevel != 0;
}

- (BOOL)hasPowerSourceType
{
  return self->_powerSourceType != 0;
}

- (BOOL)hasPowerStateCaps
{
  return self->_powerStateCaps != 0;
}

- (BOOL)hasSystemActiveProcessorCount
{
  return self->_systemActiveProcessorCount != 0;
}

- (BOOL)hasSystemBatteryLevel
{
  return self->_systemBatteryLevel != 0;
}

- (BOOL)hasSystemBatteryState
{
  return self->_systemBatteryState != 0;
}

- (BOOL)hasSystemDeviceClass
{
  return self->_systemDeviceClass != 0;
}

- (BOOL)hasSystemDeviceModel
{
  return self->_systemDeviceModel != 0;
}

- (void)setSystemLowPowerModeEnabled:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x10000u;
  self->_systemLowPowerModeEnabled = a3;
}

- (void)setHasSystemLowPowerModeEnabled:(BOOL)a3
{
  if (a3) {
    int v3 = 0x10000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($0FF3A8E67B3D88A75EBF7BE240CB1B75)(*(_DWORD *)&self->_has & 0xFFFEFFFF | v3);
}

- (BOOL)hasSystemLowPowerModeEnabled
{
  return *((unsigned char *)&self->_has + 2) & 1;
}

- (BOOL)hasSystemName
{
  return self->_systemName != 0;
}

- (BOOL)hasSystemOsVariant
{
  return self->_systemOsVariant != 0;
}

- (BOOL)hasSystemPhysicalMemory
{
  return self->_systemPhysicalMemory != 0;
}

- (void)setSystemPowersourceConnected:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x20000u;
  self->_systemPowersourceConnected = a3;
}

- (void)setHasSystemPowersourceConnected:(BOOL)a3
{
  if (a3) {
    int v3 = 0x20000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($0FF3A8E67B3D88A75EBF7BE240CB1B75)(*(_DWORD *)&self->_has & 0xFFFDFFFF | v3);
}

- (BOOL)hasSystemPowersourceConnected
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 1) & 1;
}

- (BOOL)hasSystemProcessorCount
{
  return self->_systemProcessorCount != 0;
}

- (BOOL)hasSystemVersion
{
  return self->_systemVersion != 0;
}

- (BOOL)hasUploadCdnPop
{
  return self->_uploadCdnPop != 0;
}

- (BOOL)hasUploadCdnUuid
{
  return self->_uploadCdnUuid != 0;
}

- (BOOL)hasUploadConnectionTime
{
  return self->_uploadConnectionTime != 0;
}

- (BOOL)hasUploadDomainLookupTime
{
  return self->_uploadDomainLookupTime != 0;
}

- (BOOL)hasUploadEndDataBearerTechnology
{
  return self->_uploadEndDataBearerTechnology != 0;
}

- (BOOL)hasUploadEndPrimaryIpv4Interface
{
  return self->_uploadEndPrimaryIpv4Interface != 0;
}

- (BOOL)hasUploadEndRat
{
  return self->_uploadEndRat != 0;
}

- (BOOL)hasUploadFileSize
{
  return self->_uploadFileSize != 0;
}

- (BOOL)hasUploadInterfaceName
{
  return self->_uploadInterfaceName != 0;
}

- (BOOL)hasUploadInterfaceServiceName
{
  return self->_uploadInterfaceServiceName != 0;
}

- (void)setUploadIsCellular:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x40000u;
  self->_uploadIsCellular = a3;
}

- (void)setHasUploadIsCellular:(BOOL)a3
{
  if (a3) {
    int v3 = 0x40000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($0FF3A8E67B3D88A75EBF7BE240CB1B75)(*(_DWORD *)&self->_has & 0xFFFBFFFF | v3);
}

- (BOOL)hasUploadIsCellular
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 2) & 1;
}

- (void)setUploadIsConstrained:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x80000u;
  self->_uploadIsConstrained = a3;
}

- (void)setHasUploadIsConstrained:(BOOL)a3
{
  if (a3) {
    int v3 = 0x80000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($0FF3A8E67B3D88A75EBF7BE240CB1B75)(*(_DWORD *)&self->_has & 0xFFF7FFFF | v3);
}

- (BOOL)hasUploadIsConstrained
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 3) & 1;
}

- (void)setUploadIsExpensive:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x100000u;
  self->_uploadIsExpensive = a3;
}

- (void)setHasUploadIsExpensive:(BOOL)a3
{
  if (a3) {
    int v3 = 0x100000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($0FF3A8E67B3D88A75EBF7BE240CB1B75)(*(_DWORD *)&self->_has & 0xFFEFFFFF | v3);
}

- (BOOL)hasUploadIsExpensive
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 4) & 1;
}

- (void)setUploadIsMultipath:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x200000u;
  self->_uploadIsMultipath = a3;
}

- (void)setHasUploadIsMultipath:(BOOL)a3
{
  if (a3) {
    int v3 = 0x200000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($0FF3A8E67B3D88A75EBF7BE240CB1B75)(*(_DWORD *)&self->_has & 0xFFDFFFFF | v3);
}

- (BOOL)hasUploadIsMultipath
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 5) & 1;
}

- (void)setUploadIsProxyConnection:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x400000u;
  self->_uploadIsProxyConnection = a3;
}

- (void)setHasUploadIsProxyConnection:(BOOL)a3
{
  if (a3) {
    int v3 = 0x400000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($0FF3A8E67B3D88A75EBF7BE240CB1B75)(*(_DWORD *)&self->_has & 0xFFBFFFFF | v3);
}

- (BOOL)hasUploadIsProxyConnection
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 6) & 1;
}

- (void)setUploadIsReusedConnection:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x800000u;
  self->_uploadIsReusedConnection = a3;
}

- (void)setHasUploadIsReusedConnection:(BOOL)a3
{
  if (a3) {
    int v3 = 0x800000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($0FF3A8E67B3D88A75EBF7BE240CB1B75)(*(_DWORD *)&self->_has & 0xFF7FFFFF | v3);
}

- (BOOL)hasUploadIsReusedConnection
{
  return *((unsigned __int8 *)&self->_has + 2) >> 7;
}

- (BOOL)hasUploadMaxSpeedObserved
{
  return self->_uploadMaxSpeedObserved != 0;
}

- (BOOL)hasUploadNumberOfStreams
{
  return self->_uploadNumberOfStreams != 0;
}

- (BOOL)hasUploadProtocolName
{
  return self->_uploadProtocolName != 0;
}

- (BOOL)hasUploadRemoteAddress
{
  return self->_uploadRemoteAddress != 0;
}

- (BOOL)hasUploadRemotePort
{
  return self->_uploadRemotePort != 0;
}

- (BOOL)hasUploadRequestTime
{
  return self->_uploadRequestTime != 0;
}

- (BOOL)hasUploadRequestToResponseTime
{
  return self->_uploadRequestToResponseTime != 0;
}

- (BOOL)hasUploadResponseTime
{
  return self->_uploadResponseTime != 0;
}

- (BOOL)hasUploadSecureConnectionTime
{
  return self->_uploadSecureConnectionTime != 0;
}

- (BOOL)hasUploadServer
{
  return self->_uploadServer != 0;
}

- (BOOL)hasUploadSpeed
{
  return self->_uploadSpeed != 0;
}

- (BOOL)hasUploadStableSpeed
{
  return self->_uploadStableSpeed != 0;
}

- (BOOL)hasUploadStartDataBearerTechnology
{
  return self->_uploadStartDataBearerTechnology != 0;
}

- (BOOL)hasUploadStartPrimaryIpv4Interface
{
  return self->_uploadStartPrimaryIpv4Interface != 0;
}

- (BOOL)hasUploadStartRat
{
  return self->_uploadStartRat != 0;
}

- (void)setUseWifiWasSpecified:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x1000000u;
  self->_useWifiWasSpecified = a3;
}

- (void)setHasUseWifiWasSpecified:(BOOL)a3
{
  if (a3) {
    int v3 = 0x1000000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($0FF3A8E67B3D88A75EBF7BE240CB1B75)(*(_DWORD *)&self->_has & 0xFEFFFFFF | v3);
}

- (BOOL)hasUseWifiWasSpecified
{
  return *((unsigned char *)&self->_has + 3) & 1;
}

- (BOOL)hasWifiAveragePhyRateRx
{
  return self->_wifiAveragePhyRateRx != 0;
}

- (BOOL)hasWifiAverageRssi
{
  return self->_wifiAverageRssi != 0;
}

- (BOOL)hasWifiAverageSnr
{
  return self->_wifiAverageSnr != 0;
}

- (BOOL)hasWifiAverageTcpRtt
{
  return self->_wifiAverageTcpRtt != 0;
}

- (BOOL)hasWifiBtcMode
{
  return self->_wifiBtcMode != 0;
}

- (BOOL)hasWifiCca
{
  return self->_wifiCca != 0;
}

- (BOOL)hasWifiChannel
{
  return self->_wifiChannel != 0;
}

- (BOOL)hasWifiCwfCca
{
  return self->_wifiCwfCca != 0;
}

- (BOOL)hasWifiEapolControlMode
{
  return self->_wifiEapolControlMode != 0;
}

- (BOOL)hasWifiEapolSupplicantState
{
  return self->_wifiEapolSupplicantState != 0;
}

- (BOOL)hasWifiGuardInterval
{
  return self->_wifiGuardInterval != 0;
}

- (BOOL)hasWifiHiddenState
{
  return self->_wifiHiddenState != 0;
}

- (void)setWifiIsCaptive:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x2000000u;
  self->_wifiIsCaptive = a3;
}

- (void)setHasWifiIsCaptive:(BOOL)a3
{
  if (a3) {
    int v3 = 0x2000000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($0FF3A8E67B3D88A75EBF7BE240CB1B75)(*(_DWORD *)&self->_has & 0xFDFFFFFF | v3);
}

- (BOOL)hasWifiIsCaptive
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 1) & 1;
}

- (BOOL)hasWifiMcsIndex
{
  return self->_wifiMcsIndex != 0;
}

- (BOOL)hasWifiNoise
{
  return self->_wifiNoise != 0;
}

- (BOOL)hasWifiNumberOfSpatialStreams
{
  return self->_wifiNumberOfSpatialStreams != 0;
}

- (BOOL)hasWifiOpMode
{
  return self->_wifiOpMode != 0;
}

- (BOOL)hasWifiPhyMode
{
  return self->_wifiPhyMode != 0;
}

- (BOOL)hasWifiRssi
{
  return self->_wifiRssi != 0;
}

- (BOOL)hasWifiSecurity
{
  return self->_wifiSecurity != 0;
}

- (BOOL)hasWifiTxRate
{
  return self->_wifiTxRate != 0;
}

- (BOOL)hasWrmChannelType
{
  return self->_wrmChannelType != 0;
}

- (BOOL)hasCellularCellid
{
  return self->_cellularCellid != 0;
}

- (BOOL)hasNetworkQualityResponsiveness
{
  return self->_networkQualityResponsiveness != 0;
}

- (BOOL)hasCellularAggregatedDLBW
{
  return self->_cellularAggregatedDLBW != 0;
}

- (BOOL)hasCellularAggregatedULBW
{
  return self->_cellularAggregatedULBW != 0;
}

- (BOOL)hasCellularIssa
{
  return self->_cellularIssa != 0;
}

- (BOOL)hasCellularLac
{
  return self->_cellularLac != 0;
}

- (BOOL)hasCellularLteNrConfiguredBw
{
  return self->_cellularLteNrConfiguredBw != 0;
}

- (BOOL)hasCellularMaxDlMod
{
  return self->_cellularMaxDlMod != 0;
}

- (BOOL)hasCellularMaxNwMimoLyr
{
  return self->_cellularMaxNwMimoLyr != 0;
}

- (BOOL)hasCellularMaxSchdMimoLyr
{
  return self->_cellularMaxSchdMimoLyr != 0;
}

- (BOOL)hasCellularMaxUeRank
{
  return self->_cellularMaxUeRank != 0;
}

- (BOOL)hasCellularMaxUlMod
{
  return self->_cellularMaxUlMod != 0;
}

- (BOOL)hasCellularNrSinr
{
  return self->_cellularNrSinr != 0;
}

- (BOOL)hasCellularNrarfcn
{
  return self->_cellularNrarfcn != 0;
}

- (BOOL)hasCellularRadioFrequency
{
  return self->_cellularRadioFrequency != 0;
}

- (BOOL)hasCellularTotalDlMimoLayers
{
  return self->_cellularTotalDlMimoLayers != 0;
}

- (BOOL)hasCellularTotalNumCcs
{
  return self->_cellularTotalNumCcs != 0;
}

- (BOOL)hasDownloadStartRadioFrequency
{
  return self->_downloadStartRadioFrequency != 0;
}

- (BOOL)hasDownloadEndRadioFrequency
{
  return self->_downloadEndRadioFrequency != 0;
}

- (BOOL)hasNetworkPrimaryIpv6InterfaceName
{
  return self->_networkPrimaryIpv6InterfaceName != 0;
}

- (BOOL)hasNetworkPrimaryIpv6ServiceName
{
  return self->_networkPrimaryIpv6ServiceName != 0;
}

- (BOOL)hasUploadStartRadioFrequency
{
  return self->_uploadStartRadioFrequency != 0;
}

- (BOOL)hasUploadEndRadioFrequency
{
  return self->_uploadEndRadioFrequency != 0;
}

- (BOOL)hasDownloadError
{
  return self->_downloadError != 0;
}

- (BOOL)hasNetworkQualityError
{
  return self->_networkQualityError != 0;
}

- (BOOL)hasNetworkQualityDownloadSpeed
{
  return self->_networkQualityDownloadSpeed != 0;
}

- (BOOL)hasNetworkQualityUploadSpeed
{
  return self->_networkQualityUploadSpeed != 0;
}

- (BOOL)hasNetworkQualityRating
{
  return self->_networkQualityRating != 0;
}

- (BOOL)hasVpnConnectionState
{
  return self->_vpnConnectionState != 0;
}

- (BOOL)hasUploadError
{
  return self->_uploadError != 0;
}

- (BOOL)hasUploadErrorDomain
{
  return self->_uploadErrorDomain != 0;
}

- (BOOL)hasUploadErrorCode
{
  return self->_uploadErrorCode != 0;
}

- (BOOL)hasDownloadErrorDomain
{
  return self->_downloadErrorDomain != 0;
}

- (BOOL)hasDownloadErrorCode
{
  return self->_downloadErrorCode != 0;
}

- (BOOL)hasPingError
{
  return self->_pingError != 0;
}

- (BOOL)hasPingErrorDomain
{
  return self->_pingErrorDomain != 0;
}

- (BOOL)hasPingErrorCode
{
  return self->_pingErrorCode != 0;
}

- (BOOL)hasNetworkQualityErrorDomain
{
  return self->_networkQualityErrorDomain != 0;
}

- (BOOL)hasNetworkQualityErrorCode
{
  return self->_networkQualityErrorCode != 0;
}

- (BOOL)hasCellularRnMobileCountryCode
{
  return self->_cellularRnMobileCountryCode != 0;
}

- (BOOL)hasCellularRnMobileNetworkCode
{
  return self->_cellularRnMobileNetworkCode != 0;
}

- (void)setCellularDataIsEnabled:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x100u;
  self->_cellularDataIsEnabled = a3;
}

- (void)setHasCellularDataIsEnabled:(BOOL)a3
{
  if (a3) {
    int v3 = 256;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($0FF3A8E67B3D88A75EBF7BE240CB1B75)(*(_DWORD *)&self->_has & 0xFFFFFEFF | v3);
}

- (BOOL)hasCellularDataIsEnabled
{
  return *((unsigned char *)&self->_has + 1) & 1;
}

- (BOOL)hasDownloadStartCellularEstimate
{
  return self->_downloadStartCellularEstimate != 0;
}

- (BOOL)hasDownloadEndCellularEstimate
{
  return self->_downloadEndCellularEstimate != 0;
}

- (BOOL)hasDownloadMaxCellularEstimate
{
  return self->_downloadMaxCellularEstimate != 0;
}

- (BOOL)hasUploadStartCellularEstimate
{
  return self->_uploadStartCellularEstimate != 0;
}

- (BOOL)hasUploadEndCellularEstimate
{
  return self->_uploadEndCellularEstimate != 0;
}

- (BOOL)hasUploadMaxCellularEstimate
{
  return self->_uploadMaxCellularEstimate != 0;
}

- (BOOL)hasDownloadResponsiveness
{
  return self->_downloadResponsiveness != 0;
}

- (BOOL)hasDownloadResponsivenessConfidence
{
  return self->_downloadResponsivenessConfidence != 0;
}

- (BOOL)hasDownloadResponsivenessRating
{
  return self->_downloadResponsivenessRating != 0;
}

- (BOOL)hasDownloadSpeedConfidence
{
  return self->_downloadSpeedConfidence != 0;
}

- (BOOL)hasDownloadSpeedRating
{
  return self->_downloadSpeedRating != 0;
}

- (BOOL)hasUploadResponsiveness
{
  return self->_uploadResponsiveness != 0;
}

- (BOOL)hasUploadResponsivenessConfidence
{
  return self->_uploadResponsivenessConfidence != 0;
}

- (BOOL)hasUploadResponsivenessRating
{
  return self->_uploadResponsivenessRating != 0;
}

- (BOOL)hasUploadSpeedConfidence
{
  return self->_uploadSpeedConfidence != 0;
}

- (BOOL)hasUploadSpeedRating
{
  return self->_uploadSpeedRating != 0;
}

- (BOOL)hasWifiChannelBand
{
  return self->_wifiChannelBand != 0;
}

- (BOOL)hasWifiChannelWidth
{
  return self->_wifiChannelWidth != 0;
}

- (id)description
{
  int v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)AWDNetworkPerformanceMetric;
  v4 = [(AWDNetworkPerformanceMetric *)&v8 description];
  v5 = [(AWDNetworkPerformanceMetric *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  int v3 = [MEMORY[0x263EFF9A0] dictionary];
  $0FF3A8E67B3D88A75EBF7BE240CB1B75 has = self->_has;
  if (*(unsigned char *)&has)
  {
    v5 = [NSNumber numberWithUnsignedLongLong:self->_timestamp];
    [v3 setObject:v5 forKey:@"timestamp"];

    $0FF3A8E67B3D88A75EBF7BE240CB1B75 has = self->_has;
  }
  if ((*(unsigned char *)&has & 2) != 0)
  {
    v6 = [NSNumber numberWithBool:self->_acceptablePerformanceResult];
    [v3 setObject:v6 forKey:@"acceptable_performance_result"];
  }
  awdlElectionParameters = self->_awdlElectionParameters;
  if (awdlElectionParameters) {
    [v3 setObject:awdlElectionParameters forKey:@"awdl_election_parameters"];
  }
  awdlMasterChannel = self->_awdlMasterChannel;
  if (awdlMasterChannel) {
    [v3 setObject:awdlMasterChannel forKey:@"awdl_master_channel"];
  }
  awdlOpMode = self->_awdlOpMode;
  if (awdlOpMode) {
    [v3 setObject:awdlOpMode forKey:@"awdl_op_mode"];
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    v10 = [NSNumber numberWithBool:self->_awdlPowerState];
    [v3 setObject:v10 forKey:@"awdl_power_state"];
  }
  awdlSchedule = self->_awdlSchedule;
  if (awdlSchedule) {
    [v3 setObject:awdlSchedule forKey:@"awdl_schedule"];
  }
  awdlSecondaryMasterChannel = self->_awdlSecondaryMasterChannel;
  if (awdlSecondaryMasterChannel) {
    [v3 setObject:awdlSecondaryMasterChannel forKey:@"awdl_secondary_master_channel"];
  }
  awdlSyncChannelSequence = self->_awdlSyncChannelSequence;
  if (awdlSyncChannelSequence) {
    [v3 setObject:awdlSyncChannelSequence forKey:@"awdl_sync_channel_sequence"];
  }
  awdlSyncState = self->_awdlSyncState;
  if (awdlSyncState) {
    [v3 setObject:awdlSyncState forKey:@"awdl_sync_state"];
  }
  btConnectedDevicesCount = self->_btConnectedDevicesCount;
  if (btConnectedDevicesCount) {
    [v3 setObject:btConnectedDevicesCount forKey:@"bt_connected_devices_count"];
  }
  $0FF3A8E67B3D88A75EBF7BE240CB1B75 v16 = self->_has;
  if ((*(unsigned char *)&v16 & 8) != 0)
  {
    v228 = [NSNumber numberWithBool:self->_btIsConnectable];
    [v3 setObject:v228 forKey:@"bt_is_connectable"];

    $0FF3A8E67B3D88A75EBF7BE240CB1B75 v16 = self->_has;
    if ((*(unsigned char *)&v16 & 0x10) == 0)
    {
LABEL_25:
      if ((*(unsigned char *)&v16 & 0x20) == 0) {
        goto LABEL_26;
      }
      goto LABEL_453;
    }
  }
  else if ((*(unsigned char *)&v16 & 0x10) == 0)
  {
    goto LABEL_25;
  }
  v229 = [NSNumber numberWithBool:self->_btIsDiscoverable];
  [v3 setObject:v229 forKey:@"bt_is_discoverable"];

  $0FF3A8E67B3D88A75EBF7BE240CB1B75 v16 = self->_has;
  if ((*(unsigned char *)&v16 & 0x20) == 0)
  {
LABEL_26:
    if ((*(unsigned char *)&v16 & 0x40) == 0) {
      goto LABEL_28;
    }
    goto LABEL_27;
  }
LABEL_453:
  v230 = [NSNumber numberWithBool:self->_btIsPowerOn];
  [v3 setObject:v230 forKey:@"bt_is_power_on"];

  if ((*(_DWORD *)&self->_has & 0x40) != 0)
  {
LABEL_27:
    v17 = [NSNumber numberWithBool:self->_btIsScanning];
    [v3 setObject:v17 forKey:@"bt_is_scanning"];
  }
LABEL_28:
  callingClient = self->_callingClient;
  if (callingClient) {
    [v3 setObject:callingClient forKey:@"calling_client"];
  }
  cellularActiveContexts = self->_cellularActiveContexts;
  if (cellularActiveContexts) {
    [v3 setObject:cellularActiveContexts forKey:@"cellular_active_contexts"];
  }
  if ((*(unsigned char *)&self->_has & 0x80) != 0)
  {
    v20 = [NSNumber numberWithBool:self->_cellularAllowsVoip];
    [v3 setObject:v20 forKey:@"cellular_allows_voip"];
  }
  cellularAttached = self->_cellularAttached;
  if (cellularAttached) {
    [v3 setObject:cellularAttached forKey:@"cellular_attached"];
  }
  cellularBandinfo = self->_cellularBandinfo;
  if (cellularBandinfo) {
    [v3 setObject:cellularBandinfo forKey:@"cellular_bandinfo"];
  }
  cellularBandwidth = self->_cellularBandwidth;
  if (cellularBandwidth) {
    [v3 setObject:cellularBandwidth forKey:@"cellular_bandwidth"];
  }
  cellularCarrierName = self->_cellularCarrierName;
  if (cellularCarrierName) {
    [v3 setObject:cellularCarrierName forKey:@"cellular_carrier_name"];
  }
  cellularDataBearerSoMask = self->_cellularDataBearerSoMask;
  if (cellularDataBearerSoMask) {
    [v3 setObject:cellularDataBearerSoMask forKey:@"cellular_data_bearer_so_mask"];
  }
  cellularDataBearerTechnology = self->_cellularDataBearerTechnology;
  if (cellularDataBearerTechnology) {
    [v3 setObject:cellularDataBearerTechnology forKey:@"cellular_data_bearer_technology"];
  }
  cellularDataPlanSignalingReductionOverride = self->_cellularDataPlanSignalingReductionOverride;
  if (cellularDataPlanSignalingReductionOverride) {
    [v3 setObject:cellularDataPlanSignalingReductionOverride forKey:@"cellular_data_plan_signaling_reduction_override"];
  }
  cellularDataPossible = self->_cellularDataPossible;
  if (cellularDataPossible) {
    [v3 setObject:cellularDataPossible forKey:@"cellular_data_possible"];
  }
  cellularInHomeCountry = self->_cellularInHomeCountry;
  if (cellularInHomeCountry) {
    [v3 setObject:cellularInHomeCountry forKey:@"cellular_in_home_country"];
  }
  cellularIndicator = self->_cellularIndicator;
  if (cellularIndicator) {
    [v3 setObject:cellularIndicator forKey:@"cellular_indicator"];
  }
  cellularIndicatorOverride = self->_cellularIndicatorOverride;
  if (cellularIndicatorOverride) {
    [v3 setObject:cellularIndicatorOverride forKey:@"cellular_indicator_override"];
  }
  cellularIsoCountryCode = self->_cellularIsoCountryCode;
  if (cellularIsoCountryCode) {
    [v3 setObject:cellularIsoCountryCode forKey:@"cellular_iso_country_code"];
  }
  cellularLqm = self->_cellularLqm;
  if (cellularLqm) {
    [v3 setObject:cellularLqm forKey:@"cellular_lqm"];
  }
  cellularLteMaxScheduledLayers = self->_cellularLteMaxScheduledLayers;
  if (cellularLteMaxScheduledLayers) {
    [v3 setObject:cellularLteMaxScheduledLayers forKey:@"cellular_lte_max_scheduled_layers"];
  }
  cellularMobileCountryCode = self->_cellularMobileCountryCode;
  if (cellularMobileCountryCode) {
    [v3 setObject:cellularMobileCountryCode forKey:@"cellular_mobile_country_code"];
  }
  cellularMobileNetworkCode = self->_cellularMobileNetworkCode;
  if (cellularMobileNetworkCode) {
    [v3 setObject:cellularMobileNetworkCode forKey:@"cellular_mobile_network_code"];
  }
  cellularNewRadioCoverage = self->_cellularNewRadioCoverage;
  if (cellularNewRadioCoverage) {
    [v3 setObject:cellularNewRadioCoverage forKey:@"cellular_new_radio_coverage"];
  }
  cellularNewRadioDataBearer = self->_cellularNewRadioDataBearer;
  if (cellularNewRadioDataBearer) {
    [v3 setObject:cellularNewRadioDataBearer forKey:@"cellular_new_radio_data_bearer"];
  }
  cellularNewRadioMmwaveDataBearer = self->_cellularNewRadioMmwaveDataBearer;
  if (cellularNewRadioMmwaveDataBearer) {
    [v3 setObject:cellularNewRadioMmwaveDataBearer forKey:@"cellular_new_radio_mmwave_data_bearer"];
  }
  cellularNewRadioNsaCoverage = self->_cellularNewRadioNsaCoverage;
  if (cellularNewRadioNsaCoverage) {
    [v3 setObject:cellularNewRadioNsaCoverage forKey:@"cellular_new_radio_nsa_coverage"];
  }
  cellularNewRadioNsaDataBearer = self->_cellularNewRadioNsaDataBearer;
  if (cellularNewRadioNsaDataBearer) {
    [v3 setObject:cellularNewRadioNsaDataBearer forKey:@"cellular_new_radio_nsa_data_bearer"];
  }
  cellularNewRadioSaCoverage = self->_cellularNewRadioSaCoverage;
  if (cellularNewRadioSaCoverage) {
    [v3 setObject:cellularNewRadioSaCoverage forKey:@"cellular_new_radio_sa_coverage"];
  }
  cellularNewRadioSaDataBearer = self->_cellularNewRadioSaDataBearer;
  if (cellularNewRadioSaDataBearer) {
    [v3 setObject:cellularNewRadioSaDataBearer forKey:@"cellular_new_radio_sa_data_bearer"];
  }
  cellularNewRadioSub6DataBearer = self->_cellularNewRadioSub6DataBearer;
  if (cellularNewRadioSub6DataBearer) {
    [v3 setObject:cellularNewRadioSub6DataBearer forKey:@"cellular_new_radio_sub6_data_bearer"];
  }
  cellularNrConfiguredBw = self->_cellularNrConfiguredBw;
  if (cellularNrConfiguredBw) {
    [v3 setObject:cellularNrConfiguredBw forKey:@"cellular_nr_configured_bw"];
  }
  cellularNrLayers = self->_cellularNrLayers;
  if (cellularNrLayers) {
    [v3 setObject:cellularNrLayers forKey:@"cellular_nr_layers"];
  }
  cellularNrModulation = self->_cellularNrModulation;
  if (cellularNrModulation) {
    [v3 setObject:cellularNrModulation forKey:@"cellular_nr_modulation"];
  }
  cellularNrRsrp = self->_cellularNrRsrp;
  if (cellularNrRsrp) {
    [v3 setObject:cellularNrRsrp forKey:@"cellular_nr_rsrp"];
  }
  cellularNrRsrq = self->_cellularNrRsrq;
  if (cellularNrRsrq) {
    [v3 setObject:cellularNrRsrq forKey:@"cellular_nr_rsrq"];
  }
  cellularNrSnr = self->_cellularNrSnr;
  if (cellularNrSnr) {
    [v3 setObject:cellularNrSnr forKey:@"cellular_nr_snr"];
  }
  cellularPid = self->_cellularPid;
  if (cellularPid) {
    [v3 setObject:cellularPid forKey:@"cellular_pid"];
  }
  cellularRadioAccessTechnology = self->_cellularRadioAccessTechnology;
  if (cellularRadioAccessTechnology) {
    [v3 setObject:cellularRadioAccessTechnology forKey:@"cellular_radio_access_technology"];
  }
  cellularRadioAccessTechnologyCtDataStatus = self->_cellularRadioAccessTechnologyCtDataStatus;
  if (cellularRadioAccessTechnologyCtDataStatus) {
    [v3 setObject:cellularRadioAccessTechnologyCtDataStatus forKey:@"cellular_radio_access_technology_ct_data_status"];
  }
  cellularRoamAllowed = self->_cellularRoamAllowed;
  if (cellularRoamAllowed) {
    [v3 setObject:cellularRoamAllowed forKey:@"cellular_roam_allowed"];
  }
  cellularRsrp = self->_cellularRsrp;
  if (cellularRsrp) {
    [v3 setObject:cellularRsrp forKey:@"cellular_rsrp"];
  }
  cellularSnr = self->_cellularSnr;
  if (cellularSnr) {
    [v3 setObject:cellularSnr forKey:@"cellular_snr"];
  }
  cellularTac = self->_cellularTac;
  if (cellularTac) {
    [v3 setObject:cellularTac forKey:@"cellular_tac"];
  }
  cellularTotalActiveContexts = self->_cellularTotalActiveContexts;
  if (cellularTotalActiveContexts) {
    [v3 setObject:cellularTotalActiveContexts forKey:@"cellular_total_active_contexts"];
  }
  cellularTotalBw = self->_cellularTotalBw;
  if (cellularTotalBw) {
    [v3 setObject:cellularTotalBw forKey:@"cellular_total_bw"];
  }
  cellularTotalCcs = self->_cellularTotalCcs;
  if (cellularTotalCcs) {
    [v3 setObject:cellularTotalCcs forKey:@"cellular_total_ccs"];
  }
  cellularTotalLayers = self->_cellularTotalLayers;
  if (cellularTotalLayers) {
    [v3 setObject:cellularTotalLayers forKey:@"cellular_total_layers"];
  }
  cellularUarfcn = self->_cellularUarfcn;
  if (cellularUarfcn) {
    [v3 setObject:cellularUarfcn forKey:@"cellular_uarfcn"];
  }
  downloadCdnPop = self->_downloadCdnPop;
  if (downloadCdnPop) {
    [v3 setObject:downloadCdnPop forKey:@"download_cdn_pop"];
  }
  downloadCdnUuid = self->_downloadCdnUuid;
  if (downloadCdnUuid) {
    [v3 setObject:downloadCdnUuid forKey:@"download_cdn_uuid"];
  }
  downloadConnectionTime = self->_downloadConnectionTime;
  if (downloadConnectionTime) {
    [v3 setObject:downloadConnectionTime forKey:@"download_connection_time"];
  }
  downloadDomainLookupTime = self->_downloadDomainLookupTime;
  if (downloadDomainLookupTime) {
    [v3 setObject:downloadDomainLookupTime forKey:@"download_domain_lookup_time"];
  }
  downloadEndDataBearerTechnology = self->_downloadEndDataBearerTechnology;
  if (downloadEndDataBearerTechnology) {
    [v3 setObject:downloadEndDataBearerTechnology forKey:@"download_end_data_bearer_technology"];
  }
  downloadEndPrimaryIpv4Interface = self->_downloadEndPrimaryIpv4Interface;
  if (downloadEndPrimaryIpv4Interface) {
    [v3 setObject:downloadEndPrimaryIpv4Interface forKey:@"download_end_primary_ipv4_interface"];
  }
  downloadEndRat = self->_downloadEndRat;
  if (downloadEndRat) {
    [v3 setObject:downloadEndRat forKey:@"download_end_rat"];
  }
  downloadFileSize = self->_downloadFileSize;
  if (downloadFileSize) {
    [v3 setObject:downloadFileSize forKey:@"download_file_size"];
  }
  downloadInterfaceName = self->_downloadInterfaceName;
  if (downloadInterfaceName) {
    [v3 setObject:downloadInterfaceName forKey:@"download_interface_name"];
  }
  downloadInterfaceServiceName = self->_downloadInterfaceServiceName;
  if (downloadInterfaceServiceName) {
    [v3 setObject:downloadInterfaceServiceName forKey:@"download_interface_service_name"];
  }
  $0FF3A8E67B3D88A75EBF7BE240CB1B75 v73 = self->_has;
  if ((*(_WORD *)&v73 & 0x200) != 0)
  {
    v231 = [NSNumber numberWithBool:self->_downloadIsCellular];
    [v3 setObject:v231 forKey:@"download_is_cellular"];

    $0FF3A8E67B3D88A75EBF7BE240CB1B75 v73 = self->_has;
    if ((*(_WORD *)&v73 & 0x400) == 0)
    {
LABEL_140:
      if ((*(_WORD *)&v73 & 0x800) == 0) {
        goto LABEL_141;
      }
      goto LABEL_457;
    }
  }
  else if ((*(_WORD *)&v73 & 0x400) == 0)
  {
    goto LABEL_140;
  }
  v232 = [NSNumber numberWithBool:self->_downloadIsConstrained];
  [v3 setObject:v232 forKey:@"download_is_constrained"];

  $0FF3A8E67B3D88A75EBF7BE240CB1B75 v73 = self->_has;
  if ((*(_WORD *)&v73 & 0x800) == 0)
  {
LABEL_141:
    if ((*(_WORD *)&v73 & 0x1000) == 0) {
      goto LABEL_142;
    }
    goto LABEL_458;
  }
LABEL_457:
  v233 = [NSNumber numberWithBool:self->_downloadIsExpensive];
  [v3 setObject:v233 forKey:@"download_is_expensive"];

  $0FF3A8E67B3D88A75EBF7BE240CB1B75 v73 = self->_has;
  if ((*(_WORD *)&v73 & 0x1000) == 0)
  {
LABEL_142:
    if ((*(_WORD *)&v73 & 0x2000) == 0) {
      goto LABEL_143;
    }
    goto LABEL_459;
  }
LABEL_458:
  v234 = [NSNumber numberWithBool:self->_downloadIsMultipath];
  [v3 setObject:v234 forKey:@"download_is_multipath"];

  $0FF3A8E67B3D88A75EBF7BE240CB1B75 v73 = self->_has;
  if ((*(_WORD *)&v73 & 0x2000) == 0)
  {
LABEL_143:
    if ((*(_WORD *)&v73 & 0x4000) == 0) {
      goto LABEL_145;
    }
    goto LABEL_144;
  }
LABEL_459:
  v235 = [NSNumber numberWithBool:self->_downloadIsProxyConnection];
  [v3 setObject:v235 forKey:@"download_is_proxy_connection"];

  if ((*(_DWORD *)&self->_has & 0x4000) != 0)
  {
LABEL_144:
    v74 = [NSNumber numberWithBool:self->_downloadIsReusedConnection];
    [v3 setObject:v74 forKey:@"download_is_reused_connection"];
  }
LABEL_145:
  downloadMaxSpeedObserved = self->_downloadMaxSpeedObserved;
  if (downloadMaxSpeedObserved) {
    [v3 setObject:downloadMaxSpeedObserved forKey:@"download_max_speed_observed"];
  }
  downloadNumberOfStreams = self->_downloadNumberOfStreams;
  if (downloadNumberOfStreams) {
    [v3 setObject:downloadNumberOfStreams forKey:@"download_number_of_streams"];
  }
  downloadProtocolName = self->_downloadProtocolName;
  if (downloadProtocolName) {
    [v3 setObject:downloadProtocolName forKey:@"download_protocol_name"];
  }
  downloadRemoteAddress = self->_downloadRemoteAddress;
  if (downloadRemoteAddress) {
    [v3 setObject:downloadRemoteAddress forKey:@"download_remote_address"];
  }
  downloadRemotePort = self->_downloadRemotePort;
  if (downloadRemotePort) {
    [v3 setObject:downloadRemotePort forKey:@"download_remote_port"];
  }
  downloadRequestTime = self->_downloadRequestTime;
  if (downloadRequestTime) {
    [v3 setObject:downloadRequestTime forKey:@"download_request_time"];
  }
  downloadRequestToResponseTime = self->_downloadRequestToResponseTime;
  if (downloadRequestToResponseTime) {
    [v3 setObject:downloadRequestToResponseTime forKey:@"download_request_to_response_time"];
  }
  downloadResponseTime = self->_downloadResponseTime;
  if (downloadResponseTime) {
    [v3 setObject:downloadResponseTime forKey:@"download_response_time"];
  }
  downloadSecureConnectionTime = self->_downloadSecureConnectionTime;
  if (downloadSecureConnectionTime) {
    [v3 setObject:downloadSecureConnectionTime forKey:@"download_secure_connection_time"];
  }
  downloadServer = self->_downloadServer;
  if (downloadServer) {
    [v3 setObject:downloadServer forKey:@"download_server"];
  }
  downloadSpeed = self->_downloadSpeed;
  if (downloadSpeed) {
    [v3 setObject:downloadSpeed forKey:@"download_speed"];
  }
  downloadStableSpeed = self->_downloadStableSpeed;
  if (downloadStableSpeed) {
    [v3 setObject:downloadStableSpeed forKey:@"download_stable_speed"];
  }
  downloadStartDataBearerTechnology = self->_downloadStartDataBearerTechnology;
  if (downloadStartDataBearerTechnology) {
    [v3 setObject:downloadStartDataBearerTechnology forKey:@"download_start_data_bearer_technology"];
  }
  downloadStartPrimaryIpv4Interface = self->_downloadStartPrimaryIpv4Interface;
  if (downloadStartPrimaryIpv4Interface) {
    [v3 setObject:downloadStartPrimaryIpv4Interface forKey:@"download_start_primary_ipv4_interface"];
  }
  downloadStartRat = self->_downloadStartRat;
  if (downloadStartRat) {
    [v3 setObject:downloadStartRat forKey:@"download_start_rat"];
  }
  if ((*((unsigned char *)&self->_has + 1) & 0x80) != 0)
  {
    v90 = [NSNumber numberWithBool:self->_networkIsAppleReachable];
    [v3 setObject:v90 forKey:@"network_is_apple_reachable"];
  }
  networkPrimaryIpv4InterfaceName = self->_networkPrimaryIpv4InterfaceName;
  if (networkPrimaryIpv4InterfaceName) {
    [v3 setObject:networkPrimaryIpv4InterfaceName forKey:@"network_primary_ipv4_interface_name"];
  }
  networkPrimaryIpv4ServiceName = self->_networkPrimaryIpv4ServiceName;
  if (networkPrimaryIpv4ServiceName) {
    [v3 setObject:networkPrimaryIpv4ServiceName forKey:@"network_primary_ipv4_service_name"];
  }
  nptkitFrameworkVersion = self->_nptkitFrameworkVersion;
  if (nptkitFrameworkVersion) {
    [v3 setObject:nptkitFrameworkVersion forKey:@"nptkit_framework_version"];
  }
  performanceTestStartTime = self->_performanceTestStartTime;
  if (performanceTestStartTime) {
    [v3 setObject:performanceTestStartTime forKey:@"performance_test_start_time"];
  }
  pingAddress = self->_pingAddress;
  if (pingAddress) {
    [v3 setObject:pingAddress forKey:@"ping_address"];
  }
  pingLossPercent = self->_pingLossPercent;
  if (pingLossPercent) {
    [v3 setObject:pingLossPercent forKey:@"ping_loss_percent"];
  }
  pingMaxLatency = self->_pingMaxLatency;
  if (pingMaxLatency) {
    [v3 setObject:pingMaxLatency forKey:@"ping_max_latency"];
  }
  pingMeanLatency = self->_pingMeanLatency;
  if (pingMeanLatency) {
    [v3 setObject:pingMeanLatency forKey:@"ping_mean_latency"];
  }
  pingMinLatency = self->_pingMinLatency;
  if (pingMinLatency) {
    [v3 setObject:pingMinLatency forKey:@"ping_min_latency"];
  }
  pingStandardDeviation = self->_pingStandardDeviation;
  if (pingStandardDeviation) {
    [v3 setObject:pingStandardDeviation forKey:@"ping_standard_deviation"];
  }
  powerBatteryWarningLevel = self->_powerBatteryWarningLevel;
  if (powerBatteryWarningLevel) {
    [v3 setObject:powerBatteryWarningLevel forKey:@"power_battery_warning_level"];
  }
  powerSourceType = self->_powerSourceType;
  if (powerSourceType) {
    [v3 setObject:powerSourceType forKey:@"power_source_type"];
  }
  powerStateCaps = self->_powerStateCaps;
  if (powerStateCaps) {
    [v3 setObject:powerStateCaps forKey:@"power_state_caps"];
  }
  systemActiveProcessorCount = self->_systemActiveProcessorCount;
  if (systemActiveProcessorCount) {
    [v3 setObject:systemActiveProcessorCount forKey:@"system_active_processor_count"];
  }
  systemBatteryLevel = self->_systemBatteryLevel;
  if (systemBatteryLevel) {
    [v3 setObject:systemBatteryLevel forKey:@"system_battery_level"];
  }
  systemBatteryState = self->_systemBatteryState;
  if (systemBatteryState) {
    [v3 setObject:systemBatteryState forKey:@"system_battery_state"];
  }
  systemDeviceClass = self->_systemDeviceClass;
  if (systemDeviceClass) {
    [v3 setObject:systemDeviceClass forKey:@"system_device_class"];
  }
  systemDeviceModel = self->_systemDeviceModel;
  if (systemDeviceModel) {
    [v3 setObject:systemDeviceModel forKey:@"system_device_model"];
  }
  if (*((unsigned char *)&self->_has + 2))
  {
    v109 = [NSNumber numberWithBool:self->_systemLowPowerModeEnabled];
    [v3 setObject:v109 forKey:@"system_low_power_mode_enabled"];
  }
  systemName = self->_systemName;
  if (systemName) {
    [v3 setObject:systemName forKey:@"system_name"];
  }
  systemOsVariant = self->_systemOsVariant;
  if (systemOsVariant) {
    [v3 setObject:systemOsVariant forKey:@"system_os_variant"];
  }
  systemPhysicalMemory = self->_systemPhysicalMemory;
  if (systemPhysicalMemory) {
    [v3 setObject:systemPhysicalMemory forKey:@"system_physical_memory"];
  }
  if ((*((unsigned char *)&self->_has + 2) & 2) != 0)
  {
    v113 = [NSNumber numberWithBool:self->_systemPowersourceConnected];
    [v3 setObject:v113 forKey:@"system_powersource_connected"];
  }
  systemProcessorCount = self->_systemProcessorCount;
  if (systemProcessorCount) {
    [v3 setObject:systemProcessorCount forKey:@"system_processor_count"];
  }
  systemVersion = self->_systemVersion;
  if (systemVersion) {
    [v3 setObject:systemVersion forKey:@"system_version"];
  }
  uploadCdnPop = self->_uploadCdnPop;
  if (uploadCdnPop) {
    [v3 setObject:uploadCdnPop forKey:@"upload_cdn_pop"];
  }
  uploadCdnUuid = self->_uploadCdnUuid;
  if (uploadCdnUuid) {
    [v3 setObject:uploadCdnUuid forKey:@"upload_cdn_uuid"];
  }
  uploadConnectionTime = self->_uploadConnectionTime;
  if (uploadConnectionTime) {
    [v3 setObject:uploadConnectionTime forKey:@"upload_connection_time"];
  }
  uploadDomainLookupTime = self->_uploadDomainLookupTime;
  if (uploadDomainLookupTime) {
    [v3 setObject:uploadDomainLookupTime forKey:@"upload_domain_lookup_time"];
  }
  uploadEndDataBearerTechnology = self->_uploadEndDataBearerTechnology;
  if (uploadEndDataBearerTechnology) {
    [v3 setObject:uploadEndDataBearerTechnology forKey:@"upload_end_data_bearer_technology"];
  }
  uploadEndPrimaryIpv4Interface = self->_uploadEndPrimaryIpv4Interface;
  if (uploadEndPrimaryIpv4Interface) {
    [v3 setObject:uploadEndPrimaryIpv4Interface forKey:@"upload_end_primary_ipv4_interface"];
  }
  uploadEndRat = self->_uploadEndRat;
  if (uploadEndRat) {
    [v3 setObject:uploadEndRat forKey:@"upload_end_rat"];
  }
  uploadFileSize = self->_uploadFileSize;
  if (uploadFileSize) {
    [v3 setObject:uploadFileSize forKey:@"upload_file_size"];
  }
  uploadInterfaceName = self->_uploadInterfaceName;
  if (uploadInterfaceName) {
    [v3 setObject:uploadInterfaceName forKey:@"upload_interface_name"];
  }
  uploadInterfaceServiceName = self->_uploadInterfaceServiceName;
  if (uploadInterfaceServiceName) {
    [v3 setObject:uploadInterfaceServiceName forKey:@"upload_interface_service_name"];
  }
  $0FF3A8E67B3D88A75EBF7BE240CB1B75 v126 = self->_has;
  if ((*(_DWORD *)&v126 & 0x40000) != 0)
  {
    v236 = [NSNumber numberWithBool:self->_uploadIsCellular];
    [v3 setObject:v236 forKey:@"upload_is_cellular"];

    $0FF3A8E67B3D88A75EBF7BE240CB1B75 v126 = self->_has;
    if ((*(_DWORD *)&v126 & 0x80000) == 0)
    {
LABEL_249:
      if ((*(_DWORD *)&v126 & 0x100000) == 0) {
        goto LABEL_250;
      }
      goto LABEL_463;
    }
  }
  else if ((*(_DWORD *)&v126 & 0x80000) == 0)
  {
    goto LABEL_249;
  }
  v237 = [NSNumber numberWithBool:self->_uploadIsConstrained];
  [v3 setObject:v237 forKey:@"upload_is_constrained"];

  $0FF3A8E67B3D88A75EBF7BE240CB1B75 v126 = self->_has;
  if ((*(_DWORD *)&v126 & 0x100000) == 0)
  {
LABEL_250:
    if ((*(_DWORD *)&v126 & 0x200000) == 0) {
      goto LABEL_251;
    }
    goto LABEL_464;
  }
LABEL_463:
  v238 = [NSNumber numberWithBool:self->_uploadIsExpensive];
  [v3 setObject:v238 forKey:@"upload_is_expensive"];

  $0FF3A8E67B3D88A75EBF7BE240CB1B75 v126 = self->_has;
  if ((*(_DWORD *)&v126 & 0x200000) == 0)
  {
LABEL_251:
    if ((*(_DWORD *)&v126 & 0x400000) == 0) {
      goto LABEL_252;
    }
    goto LABEL_465;
  }
LABEL_464:
  v239 = [NSNumber numberWithBool:self->_uploadIsMultipath];
  [v3 setObject:v239 forKey:@"upload_is_multipath"];

  $0FF3A8E67B3D88A75EBF7BE240CB1B75 v126 = self->_has;
  if ((*(_DWORD *)&v126 & 0x400000) == 0)
  {
LABEL_252:
    if ((*(_DWORD *)&v126 & 0x800000) == 0) {
      goto LABEL_254;
    }
    goto LABEL_253;
  }
LABEL_465:
  v240 = [NSNumber numberWithBool:self->_uploadIsProxyConnection];
  [v3 setObject:v240 forKey:@"upload_is_proxy_connection"];

  if ((*(_DWORD *)&self->_has & 0x800000) != 0)
  {
LABEL_253:
    v127 = [NSNumber numberWithBool:self->_uploadIsReusedConnection];
    [v3 setObject:v127 forKey:@"upload_is_reused_connection"];
  }
LABEL_254:
  uploadMaxSpeedObserved = self->_uploadMaxSpeedObserved;
  if (uploadMaxSpeedObserved) {
    [v3 setObject:uploadMaxSpeedObserved forKey:@"upload_max_speed_observed"];
  }
  uploadNumberOfStreams = self->_uploadNumberOfStreams;
  if (uploadNumberOfStreams) {
    [v3 setObject:uploadNumberOfStreams forKey:@"upload_number_of_streams"];
  }
  uploadProtocolName = self->_uploadProtocolName;
  if (uploadProtocolName) {
    [v3 setObject:uploadProtocolName forKey:@"upload_protocol_name"];
  }
  uploadRemoteAddress = self->_uploadRemoteAddress;
  if (uploadRemoteAddress) {
    [v3 setObject:uploadRemoteAddress forKey:@"upload_remote_address"];
  }
  uploadRemotePort = self->_uploadRemotePort;
  if (uploadRemotePort) {
    [v3 setObject:uploadRemotePort forKey:@"upload_remote_port"];
  }
  uploadRequestTime = self->_uploadRequestTime;
  if (uploadRequestTime) {
    [v3 setObject:uploadRequestTime forKey:@"upload_request_time"];
  }
  uploadRequestToResponseTime = self->_uploadRequestToResponseTime;
  if (uploadRequestToResponseTime) {
    [v3 setObject:uploadRequestToResponseTime forKey:@"upload_request_to_response_time"];
  }
  uploadResponseTime = self->_uploadResponseTime;
  if (uploadResponseTime) {
    [v3 setObject:uploadResponseTime forKey:@"upload_response_time"];
  }
  uploadSecureConnectionTime = self->_uploadSecureConnectionTime;
  if (uploadSecureConnectionTime) {
    [v3 setObject:uploadSecureConnectionTime forKey:@"upload_secure_connection_time"];
  }
  uploadServer = self->_uploadServer;
  if (uploadServer) {
    [v3 setObject:uploadServer forKey:@"upload_server"];
  }
  uploadSpeed = self->_uploadSpeed;
  if (uploadSpeed) {
    [v3 setObject:uploadSpeed forKey:@"upload_speed"];
  }
  uploadStableSpeed = self->_uploadStableSpeed;
  if (uploadStableSpeed) {
    [v3 setObject:uploadStableSpeed forKey:@"upload_stable_speed"];
  }
  uploadStartDataBearerTechnology = self->_uploadStartDataBearerTechnology;
  if (uploadStartDataBearerTechnology) {
    [v3 setObject:uploadStartDataBearerTechnology forKey:@"upload_start_data_bearer_technology"];
  }
  uploadStartPrimaryIpv4Interface = self->_uploadStartPrimaryIpv4Interface;
  if (uploadStartPrimaryIpv4Interface) {
    [v3 setObject:uploadStartPrimaryIpv4Interface forKey:@"upload_start_primary_ipv4_interface"];
  }
  uploadStartRat = self->_uploadStartRat;
  if (uploadStartRat) {
    [v3 setObject:uploadStartRat forKey:@"upload_start_rat"];
  }
  if (*((unsigned char *)&self->_has + 3))
  {
    v143 = [NSNumber numberWithBool:self->_useWifiWasSpecified];
    [v3 setObject:v143 forKey:@"use_wifi_was_specified"];
  }
  wifiAveragePhyRateRx = self->_wifiAveragePhyRateRx;
  if (wifiAveragePhyRateRx) {
    [v3 setObject:wifiAveragePhyRateRx forKey:@"wifi_average_phy_rate_rx"];
  }
  wifiAverageRssi = self->_wifiAverageRssi;
  if (wifiAverageRssi) {
    [v3 setObject:wifiAverageRssi forKey:@"wifi_average_rssi"];
  }
  wifiAverageSnr = self->_wifiAverageSnr;
  if (wifiAverageSnr) {
    [v3 setObject:wifiAverageSnr forKey:@"wifi_average_snr"];
  }
  wifiAverageTcpRtt = self->_wifiAverageTcpRtt;
  if (wifiAverageTcpRtt) {
    [v3 setObject:wifiAverageTcpRtt forKey:@"wifi_average_tcp_rtt"];
  }
  wifiBtcMode = self->_wifiBtcMode;
  if (wifiBtcMode) {
    [v3 setObject:wifiBtcMode forKey:@"wifi_btc_mode"];
  }
  wifiCca = self->_wifiCca;
  if (wifiCca) {
    [v3 setObject:wifiCca forKey:@"wifi_cca"];
  }
  wifiChannel = self->_wifiChannel;
  if (wifiChannel) {
    [v3 setObject:wifiChannel forKey:@"wifi_channel"];
  }
  wifiCwfCca = self->_wifiCwfCca;
  if (wifiCwfCca) {
    [v3 setObject:wifiCwfCca forKey:@"wifi_cwf_cca"];
  }
  wifiEapolControlMode = self->_wifiEapolControlMode;
  if (wifiEapolControlMode) {
    [v3 setObject:wifiEapolControlMode forKey:@"wifi_eapol_control_mode"];
  }
  wifiEapolSupplicantState = self->_wifiEapolSupplicantState;
  if (wifiEapolSupplicantState) {
    [v3 setObject:wifiEapolSupplicantState forKey:@"wifi_eapol_supplicant_state"];
  }
  wifiGuardInterval = self->_wifiGuardInterval;
  if (wifiGuardInterval) {
    [v3 setObject:wifiGuardInterval forKey:@"wifi_guard_interval"];
  }
  wifiHiddenState = self->_wifiHiddenState;
  if (wifiHiddenState) {
    [v3 setObject:wifiHiddenState forKey:@"wifi_hidden_state"];
  }
  if ((*((unsigned char *)&self->_has + 3) & 2) != 0)
  {
    v156 = [NSNumber numberWithBool:self->_wifiIsCaptive];
    [v3 setObject:v156 forKey:@"wifi_is_captive"];
  }
  wifiMcsIndex = self->_wifiMcsIndex;
  if (wifiMcsIndex) {
    [v3 setObject:wifiMcsIndex forKey:@"wifi_mcs_index"];
  }
  wifiNoise = self->_wifiNoise;
  if (wifiNoise) {
    [v3 setObject:wifiNoise forKey:@"wifi_noise"];
  }
  wifiNumberOfSpatialStreams = self->_wifiNumberOfSpatialStreams;
  if (wifiNumberOfSpatialStreams) {
    [v3 setObject:wifiNumberOfSpatialStreams forKey:@"wifi_number_of_spatial_streams"];
  }
  wifiOpMode = self->_wifiOpMode;
  if (wifiOpMode) {
    [v3 setObject:wifiOpMode forKey:@"wifi_op_mode"];
  }
  wifiPhyMode = self->_wifiPhyMode;
  if (wifiPhyMode) {
    [v3 setObject:wifiPhyMode forKey:@"wifi_phy_mode"];
  }
  wifiRssi = self->_wifiRssi;
  if (wifiRssi) {
    [v3 setObject:wifiRssi forKey:@"wifi_rssi"];
  }
  wifiSecurity = self->_wifiSecurity;
  if (wifiSecurity) {
    [v3 setObject:wifiSecurity forKey:@"wifi_security"];
  }
  wifiTxRate = self->_wifiTxRate;
  if (wifiTxRate) {
    [v3 setObject:wifiTxRate forKey:@"wifi_tx_rate"];
  }
  wrmChannelType = self->_wrmChannelType;
  if (wrmChannelType) {
    [v3 setObject:wrmChannelType forKey:@"wrm_channel_type"];
  }
  cellularCellid = self->_cellularCellid;
  if (cellularCellid) {
    [v3 setObject:cellularCellid forKey:@"cellular_cellid"];
  }
  networkQualityResponsiveness = self->_networkQualityResponsiveness;
  if (networkQualityResponsiveness) {
    [v3 setObject:networkQualityResponsiveness forKey:@"network_quality_responsiveness"];
  }
  cellularAggregatedDLBW = self->_cellularAggregatedDLBW;
  if (cellularAggregatedDLBW) {
    [v3 setObject:cellularAggregatedDLBW forKey:@"cellular_aggregated_DL_BW"];
  }
  cellularAggregatedULBW = self->_cellularAggregatedULBW;
  if (cellularAggregatedULBW) {
    [v3 setObject:cellularAggregatedULBW forKey:@"cellular_aggregated_UL_BW"];
  }
  cellularIssa = self->_cellularIssa;
  if (cellularIssa) {
    [v3 setObject:cellularIssa forKey:@"cellular_issa"];
  }
  cellularLac = self->_cellularLac;
  if (cellularLac) {
    [v3 setObject:cellularLac forKey:@"cellular_lac"];
  }
  cellularLteNrConfiguredBw = self->_cellularLteNrConfiguredBw;
  if (cellularLteNrConfiguredBw) {
    [v3 setObject:cellularLteNrConfiguredBw forKey:@"cellular_lte_nr_configured_bw"];
  }
  cellularMaxDlMod = self->_cellularMaxDlMod;
  if (cellularMaxDlMod) {
    [v3 setObject:cellularMaxDlMod forKey:@"cellular_max_dl_mod"];
  }
  cellularMaxNwMimoLyr = self->_cellularMaxNwMimoLyr;
  if (cellularMaxNwMimoLyr) {
    [v3 setObject:cellularMaxNwMimoLyr forKey:@"cellular_max_nw_mimo_lyr"];
  }
  cellularMaxSchdMimoLyr = self->_cellularMaxSchdMimoLyr;
  if (cellularMaxSchdMimoLyr) {
    [v3 setObject:cellularMaxSchdMimoLyr forKey:@"cellular_max_schd_mimo_lyr"];
  }
  cellularMaxUeRank = self->_cellularMaxUeRank;
  if (cellularMaxUeRank) {
    [v3 setObject:cellularMaxUeRank forKey:@"cellular_max_ue_rank"];
  }
  cellularMaxUlMod = self->_cellularMaxUlMod;
  if (cellularMaxUlMod) {
    [v3 setObject:cellularMaxUlMod forKey:@"cellular_max_ul_mod"];
  }
  cellularNrSinr = self->_cellularNrSinr;
  if (cellularNrSinr) {
    [v3 setObject:cellularNrSinr forKey:@"cellular_nr_sinr"];
  }
  cellularNrarfcn = self->_cellularNrarfcn;
  if (cellularNrarfcn) {
    [v3 setObject:cellularNrarfcn forKey:@"cellular_nrarfcn"];
  }
  cellularRadioFrequency = self->_cellularRadioFrequency;
  if (cellularRadioFrequency) {
    [v3 setObject:cellularRadioFrequency forKey:@"cellular_radio_frequency"];
  }
  cellularTotalDlMimoLayers = self->_cellularTotalDlMimoLayers;
  if (cellularTotalDlMimoLayers) {
    [v3 setObject:cellularTotalDlMimoLayers forKey:@"cellular_total_dl_mimo_layers"];
  }
  cellularTotalNumCcs = self->_cellularTotalNumCcs;
  if (cellularTotalNumCcs) {
    [v3 setObject:cellularTotalNumCcs forKey:@"cellular_total_num_ccs"];
  }
  downloadStartRadioFrequency = self->_downloadStartRadioFrequency;
  if (downloadStartRadioFrequency) {
    [v3 setObject:downloadStartRadioFrequency forKey:@"download_start_radio_frequency"];
  }
  downloadEndRadioFrequency = self->_downloadEndRadioFrequency;
  if (downloadEndRadioFrequency) {
    [v3 setObject:downloadEndRadioFrequency forKey:@"download_end_radio_frequency"];
  }
  networkPrimaryIpv6InterfaceName = self->_networkPrimaryIpv6InterfaceName;
  if (networkPrimaryIpv6InterfaceName) {
    [v3 setObject:networkPrimaryIpv6InterfaceName forKey:@"network_primary_ipv6_interface_name"];
  }
  networkPrimaryIpv6ServiceName = self->_networkPrimaryIpv6ServiceName;
  if (networkPrimaryIpv6ServiceName) {
    [v3 setObject:networkPrimaryIpv6ServiceName forKey:@"network_primary_ipv6_service_name"];
  }
  uploadStartRadioFrequency = self->_uploadStartRadioFrequency;
  if (uploadStartRadioFrequency) {
    [v3 setObject:uploadStartRadioFrequency forKey:@"upload_start_radio_frequency"];
  }
  uploadEndRadioFrequency = self->_uploadEndRadioFrequency;
  if (uploadEndRadioFrequency) {
    [v3 setObject:uploadEndRadioFrequency forKey:@"upload_end_radio_frequency"];
  }
  downloadError = self->_downloadError;
  if (downloadError) {
    [v3 setObject:downloadError forKey:@"download_error"];
  }
  networkQualityError = self->_networkQualityError;
  if (networkQualityError) {
    [v3 setObject:networkQualityError forKey:@"network_quality_error"];
  }
  networkQualityDownloadSpeed = self->_networkQualityDownloadSpeed;
  if (networkQualityDownloadSpeed) {
    [v3 setObject:networkQualityDownloadSpeed forKey:@"network_quality_download_speed"];
  }
  networkQualityUploadSpeed = self->_networkQualityUploadSpeed;
  if (networkQualityUploadSpeed) {
    [v3 setObject:networkQualityUploadSpeed forKey:@"network_quality_upload_speed"];
  }
  networkQualityRating = self->_networkQualityRating;
  if (networkQualityRating) {
    [v3 setObject:networkQualityRating forKey:@"network_quality_rating"];
  }
  vpnConnectionState = self->_vpnConnectionState;
  if (vpnConnectionState) {
    [v3 setObject:vpnConnectionState forKey:@"vpn_connection_state"];
  }
  uploadError = self->_uploadError;
  if (uploadError) {
    [v3 setObject:uploadError forKey:@"upload_error"];
  }
  uploadErrorDomain = self->_uploadErrorDomain;
  if (uploadErrorDomain) {
    [v3 setObject:uploadErrorDomain forKey:@"upload_error_domain"];
  }
  uploadErrorCode = self->_uploadErrorCode;
  if (uploadErrorCode) {
    [v3 setObject:uploadErrorCode forKey:@"upload_error_code"];
  }
  downloadErrorDomain = self->_downloadErrorDomain;
  if (downloadErrorDomain) {
    [v3 setObject:downloadErrorDomain forKey:@"download_error_domain"];
  }
  downloadErrorCode = self->_downloadErrorCode;
  if (downloadErrorCode) {
    [v3 setObject:downloadErrorCode forKey:@"download_error_code"];
  }
  pingError = self->_pingError;
  if (pingError) {
    [v3 setObject:pingError forKey:@"ping_error"];
  }
  pingErrorDomain = self->_pingErrorDomain;
  if (pingErrorDomain) {
    [v3 setObject:pingErrorDomain forKey:@"ping_error_domain"];
  }
  pingErrorCode = self->_pingErrorCode;
  if (pingErrorCode) {
    [v3 setObject:pingErrorCode forKey:@"ping_error_code"];
  }
  networkQualityErrorDomain = self->_networkQualityErrorDomain;
  if (networkQualityErrorDomain) {
    [v3 setObject:networkQualityErrorDomain forKey:@"network_quality_error_domain"];
  }
  networkQualityErrorCode = self->_networkQualityErrorCode;
  if (networkQualityErrorCode) {
    [v3 setObject:networkQualityErrorCode forKey:@"network_quality_error_code"];
  }
  cellularRnMobileCountryCode = self->_cellularRnMobileCountryCode;
  if (cellularRnMobileCountryCode) {
    [v3 setObject:cellularRnMobileCountryCode forKey:@"cellular_rn_mobile_country_code"];
  }
  cellularRnMobileNetworkCode = self->_cellularRnMobileNetworkCode;
  if (cellularRnMobileNetworkCode) {
    [v3 setObject:cellularRnMobileNetworkCode forKey:@"cellular_rn_mobile_network_code"];
  }
  if (*((unsigned char *)&self->_has + 1))
  {
    v207 = [NSNumber numberWithBool:self->_cellularDataIsEnabled];
    [v3 setObject:v207 forKey:@"cellular_data_is_enabled"];
  }
  downloadStartCellularEstimate = self->_downloadStartCellularEstimate;
  if (downloadStartCellularEstimate) {
    [v3 setObject:downloadStartCellularEstimate forKey:@"download_start_cellular_estimate"];
  }
  downloadEndCellularEstimate = self->_downloadEndCellularEstimate;
  if (downloadEndCellularEstimate) {
    [v3 setObject:downloadEndCellularEstimate forKey:@"download_end_cellular_estimate"];
  }
  downloadMaxCellularEstimate = self->_downloadMaxCellularEstimate;
  if (downloadMaxCellularEstimate) {
    [v3 setObject:downloadMaxCellularEstimate forKey:@"download_max_cellular_estimate"];
  }
  uploadStartCellularEstimate = self->_uploadStartCellularEstimate;
  if (uploadStartCellularEstimate) {
    [v3 setObject:uploadStartCellularEstimate forKey:@"upload_start_cellular_estimate"];
  }
  uploadEndCellularEstimate = self->_uploadEndCellularEstimate;
  if (uploadEndCellularEstimate) {
    [v3 setObject:uploadEndCellularEstimate forKey:@"upload_end_cellular_estimate"];
  }
  uploadMaxCellularEstimate = self->_uploadMaxCellularEstimate;
  if (uploadMaxCellularEstimate) {
    [v3 setObject:uploadMaxCellularEstimate forKey:@"upload_max_cellular_estimate"];
  }
  downloadResponsiveness = self->_downloadResponsiveness;
  if (downloadResponsiveness) {
    [v3 setObject:downloadResponsiveness forKey:@"download_responsiveness"];
  }
  downloadResponsivenessConfidence = self->_downloadResponsivenessConfidence;
  if (downloadResponsivenessConfidence) {
    [v3 setObject:downloadResponsivenessConfidence forKey:@"download_responsiveness_confidence"];
  }
  downloadResponsivenessRating = self->_downloadResponsivenessRating;
  if (downloadResponsivenessRating) {
    [v3 setObject:downloadResponsivenessRating forKey:@"download_responsiveness_rating"];
  }
  downloadSpeedConfidence = self->_downloadSpeedConfidence;
  if (downloadSpeedConfidence) {
    [v3 setObject:downloadSpeedConfidence forKey:@"download_speed_confidence"];
  }
  downloadSpeedRating = self->_downloadSpeedRating;
  if (downloadSpeedRating) {
    [v3 setObject:downloadSpeedRating forKey:@"download_speed_rating"];
  }
  uploadResponsiveness = self->_uploadResponsiveness;
  if (uploadResponsiveness) {
    [v3 setObject:uploadResponsiveness forKey:@"upload_responsiveness"];
  }
  uploadResponsivenessConfidence = self->_uploadResponsivenessConfidence;
  if (uploadResponsivenessConfidence) {
    [v3 setObject:uploadResponsivenessConfidence forKey:@"upload_responsiveness_confidence"];
  }
  uploadResponsivenessRating = self->_uploadResponsivenessRating;
  if (uploadResponsivenessRating) {
    [v3 setObject:uploadResponsivenessRating forKey:@"upload_responsiveness_rating"];
  }
  uploadSpeedConfidence = self->_uploadSpeedConfidence;
  if (uploadSpeedConfidence) {
    [v3 setObject:uploadSpeedConfidence forKey:@"upload_speed_confidence"];
  }
  uploadSpeedRating = self->_uploadSpeedRating;
  if (uploadSpeedRating) {
    [v3 setObject:uploadSpeedRating forKey:@"upload_speed_rating"];
  }
  wifiChannelBand = self->_wifiChannelBand;
  if (wifiChannelBand) {
    [v3 setObject:wifiChannelBand forKey:@"wifi_channel_band"];
  }
  wifiChannelWidth = self->_wifiChannelWidth;
  if (wifiChannelWidth) {
    [v3 setObject:wifiChannelWidth forKey:@"wifi_channel_width"];
  }
  id v226 = v3;

  return v226;
}

- (BOOL)readFrom:(id)a3
{
  return AWDNetworkPerformanceMetricReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v8 = v4;
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteUint64Field();
    id v4 = v8;
  }
  if (self->_awdlElectionParameters)
  {
    PBDataWriterWriteStringField();
    id v4 = v8;
  }
  if (self->_awdlMasterChannel)
  {
    PBDataWriterWriteStringField();
    id v4 = v8;
  }
  if (self->_awdlOpMode)
  {
    PBDataWriterWriteStringField();
    id v4 = v8;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v8;
  }
  if (self->_awdlSchedule)
  {
    PBDataWriterWriteStringField();
    id v4 = v8;
  }
  if (self->_awdlSecondaryMasterChannel)
  {
    PBDataWriterWriteStringField();
    id v4 = v8;
  }
  if (self->_awdlSyncChannelSequence)
  {
    PBDataWriterWriteStringField();
    id v4 = v8;
  }
  if (self->_awdlSyncState)
  {
    PBDataWriterWriteStringField();
    id v4 = v8;
  }
  if (self->_btConnectedDevicesCount)
  {
    PBDataWriterWriteStringField();
    id v4 = v8;
  }
  $0FF3A8E67B3D88A75EBF7BE240CB1B75 has = self->_has;
  if ((*(unsigned char *)&has & 8) != 0)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v8;
    $0FF3A8E67B3D88A75EBF7BE240CB1B75 has = self->_has;
    if ((*(unsigned char *)&has & 0x10) == 0)
    {
LABEL_23:
      if ((*(unsigned char *)&has & 0x20) == 0) {
        goto LABEL_24;
      }
      goto LABEL_455;
    }
  }
  else if ((*(unsigned char *)&has & 0x10) == 0)
  {
    goto LABEL_23;
  }
  PBDataWriterWriteBOOLField();
  id v4 = v8;
  $0FF3A8E67B3D88A75EBF7BE240CB1B75 has = self->_has;
  if ((*(unsigned char *)&has & 0x20) == 0)
  {
LABEL_24:
    if ((*(unsigned char *)&has & 0x40) == 0) {
      goto LABEL_26;
    }
    goto LABEL_25;
  }
LABEL_455:
  PBDataWriterWriteBOOLField();
  id v4 = v8;
  if ((*(_DWORD *)&self->_has & 0x40) != 0)
  {
LABEL_25:
    PBDataWriterWriteBOOLField();
    id v4 = v8;
  }
LABEL_26:
  if (self->_callingClient)
  {
    PBDataWriterWriteStringField();
    id v4 = v8;
  }
  if (self->_cellularActiveContexts)
  {
    PBDataWriterWriteStringField();
    id v4 = v8;
  }
  if ((*(unsigned char *)&self->_has & 0x80) != 0)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v8;
  }
  if (self->_cellularAttached)
  {
    PBDataWriterWriteStringField();
    id v4 = v8;
  }
  if (self->_cellularBandinfo)
  {
    PBDataWriterWriteStringField();
    id v4 = v8;
  }
  if (self->_cellularBandwidth)
  {
    PBDataWriterWriteStringField();
    id v4 = v8;
  }
  if (self->_cellularCarrierName)
  {
    PBDataWriterWriteStringField();
    id v4 = v8;
  }
  if (self->_cellularDataBearerSoMask)
  {
    PBDataWriterWriteStringField();
    id v4 = v8;
  }
  if (self->_cellularDataBearerTechnology)
  {
    PBDataWriterWriteStringField();
    id v4 = v8;
  }
  if (self->_cellularDataPlanSignalingReductionOverride)
  {
    PBDataWriterWriteStringField();
    id v4 = v8;
  }
  if (self->_cellularDataPossible)
  {
    PBDataWriterWriteStringField();
    id v4 = v8;
  }
  if (self->_cellularInHomeCountry)
  {
    PBDataWriterWriteStringField();
    id v4 = v8;
  }
  if (self->_cellularIndicator)
  {
    PBDataWriterWriteStringField();
    id v4 = v8;
  }
  if (self->_cellularIndicatorOverride)
  {
    PBDataWriterWriteStringField();
    id v4 = v8;
  }
  if (self->_cellularIsoCountryCode)
  {
    PBDataWriterWriteStringField();
    id v4 = v8;
  }
  if (self->_cellularLqm)
  {
    PBDataWriterWriteStringField();
    id v4 = v8;
  }
  if (self->_cellularLteMaxScheduledLayers)
  {
    PBDataWriterWriteStringField();
    id v4 = v8;
  }
  if (self->_cellularMobileCountryCode)
  {
    PBDataWriterWriteStringField();
    id v4 = v8;
  }
  if (self->_cellularMobileNetworkCode)
  {
    PBDataWriterWriteStringField();
    id v4 = v8;
  }
  if (self->_cellularNewRadioCoverage)
  {
    PBDataWriterWriteStringField();
    id v4 = v8;
  }
  if (self->_cellularNewRadioDataBearer)
  {
    PBDataWriterWriteStringField();
    id v4 = v8;
  }
  if (self->_cellularNewRadioMmwaveDataBearer)
  {
    PBDataWriterWriteStringField();
    id v4 = v8;
  }
  if (self->_cellularNewRadioNsaCoverage)
  {
    PBDataWriterWriteStringField();
    id v4 = v8;
  }
  if (self->_cellularNewRadioNsaDataBearer)
  {
    PBDataWriterWriteStringField();
    id v4 = v8;
  }
  if (self->_cellularNewRadioSaCoverage)
  {
    PBDataWriterWriteStringField();
    id v4 = v8;
  }
  if (self->_cellularNewRadioSaDataBearer)
  {
    PBDataWriterWriteStringField();
    id v4 = v8;
  }
  if (self->_cellularNewRadioSub6DataBearer)
  {
    PBDataWriterWriteStringField();
    id v4 = v8;
  }
  if (self->_cellularNrConfiguredBw)
  {
    PBDataWriterWriteStringField();
    id v4 = v8;
  }
  if (self->_cellularNrLayers)
  {
    PBDataWriterWriteStringField();
    id v4 = v8;
  }
  if (self->_cellularNrModulation)
  {
    PBDataWriterWriteStringField();
    id v4 = v8;
  }
  if (self->_cellularNrRsrp)
  {
    PBDataWriterWriteStringField();
    id v4 = v8;
  }
  if (self->_cellularNrRsrq)
  {
    PBDataWriterWriteStringField();
    id v4 = v8;
  }
  if (self->_cellularNrSnr)
  {
    PBDataWriterWriteStringField();
    id v4 = v8;
  }
  if (self->_cellularPid)
  {
    PBDataWriterWriteStringField();
    id v4 = v8;
  }
  if (self->_cellularRadioAccessTechnology)
  {
    PBDataWriterWriteStringField();
    id v4 = v8;
  }
  if (self->_cellularRadioAccessTechnologyCtDataStatus)
  {
    PBDataWriterWriteStringField();
    id v4 = v8;
  }
  if (self->_cellularRoamAllowed)
  {
    PBDataWriterWriteStringField();
    id v4 = v8;
  }
  if (self->_cellularRsrp)
  {
    PBDataWriterWriteStringField();
    id v4 = v8;
  }
  if (self->_cellularSnr)
  {
    PBDataWriterWriteStringField();
    id v4 = v8;
  }
  if (self->_cellularTac)
  {
    PBDataWriterWriteStringField();
    id v4 = v8;
  }
  if (self->_cellularTotalActiveContexts)
  {
    PBDataWriterWriteStringField();
    id v4 = v8;
  }
  if (self->_cellularTotalBw)
  {
    PBDataWriterWriteStringField();
    id v4 = v8;
  }
  if (self->_cellularTotalCcs)
  {
    PBDataWriterWriteStringField();
    id v4 = v8;
  }
  if (self->_cellularTotalLayers)
  {
    PBDataWriterWriteStringField();
    id v4 = v8;
  }
  if (self->_cellularUarfcn)
  {
    PBDataWriterWriteStringField();
    id v4 = v8;
  }
  if (self->_downloadCdnPop)
  {
    PBDataWriterWriteStringField();
    id v4 = v8;
  }
  if (self->_downloadCdnUuid)
  {
    PBDataWriterWriteStringField();
    id v4 = v8;
  }
  if (self->_downloadConnectionTime)
  {
    PBDataWriterWriteStringField();
    id v4 = v8;
  }
  if (self->_downloadDomainLookupTime)
  {
    PBDataWriterWriteStringField();
    id v4 = v8;
  }
  if (self->_downloadEndDataBearerTechnology)
  {
    PBDataWriterWriteStringField();
    id v4 = v8;
  }
  if (self->_downloadEndPrimaryIpv4Interface)
  {
    PBDataWriterWriteStringField();
    id v4 = v8;
  }
  if (self->_downloadEndRat)
  {
    PBDataWriterWriteStringField();
    id v4 = v8;
  }
  if (self->_downloadFileSize)
  {
    PBDataWriterWriteStringField();
    id v4 = v8;
  }
  if (self->_downloadInterfaceName)
  {
    PBDataWriterWriteStringField();
    id v4 = v8;
  }
  if (self->_downloadInterfaceServiceName)
  {
    PBDataWriterWriteStringField();
    id v4 = v8;
  }
  $0FF3A8E67B3D88A75EBF7BE240CB1B75 v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x200) != 0)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v8;
    $0FF3A8E67B3D88A75EBF7BE240CB1B75 v6 = self->_has;
    if ((*(_WORD *)&v6 & 0x400) == 0)
    {
LABEL_138:
      if ((*(_WORD *)&v6 & 0x800) == 0) {
        goto LABEL_139;
      }
      goto LABEL_459;
    }
  }
  else if ((*(_WORD *)&v6 & 0x400) == 0)
  {
    goto LABEL_138;
  }
  PBDataWriterWriteBOOLField();
  id v4 = v8;
  $0FF3A8E67B3D88A75EBF7BE240CB1B75 v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x800) == 0)
  {
LABEL_139:
    if ((*(_WORD *)&v6 & 0x1000) == 0) {
      goto LABEL_140;
    }
    goto LABEL_460;
  }
LABEL_459:
  PBDataWriterWriteBOOLField();
  id v4 = v8;
  $0FF3A8E67B3D88A75EBF7BE240CB1B75 v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x1000) == 0)
  {
LABEL_140:
    if ((*(_WORD *)&v6 & 0x2000) == 0) {
      goto LABEL_141;
    }
    goto LABEL_461;
  }
LABEL_460:
  PBDataWriterWriteBOOLField();
  id v4 = v8;
  $0FF3A8E67B3D88A75EBF7BE240CB1B75 v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x2000) == 0)
  {
LABEL_141:
    if ((*(_WORD *)&v6 & 0x4000) == 0) {
      goto LABEL_143;
    }
    goto LABEL_142;
  }
LABEL_461:
  PBDataWriterWriteBOOLField();
  id v4 = v8;
  if ((*(_DWORD *)&self->_has & 0x4000) != 0)
  {
LABEL_142:
    PBDataWriterWriteBOOLField();
    id v4 = v8;
  }
LABEL_143:
  if (self->_downloadMaxSpeedObserved)
  {
    PBDataWriterWriteStringField();
    id v4 = v8;
  }
  if (self->_downloadNumberOfStreams)
  {
    PBDataWriterWriteStringField();
    id v4 = v8;
  }
  if (self->_downloadProtocolName)
  {
    PBDataWriterWriteStringField();
    id v4 = v8;
  }
  if (self->_downloadRemoteAddress)
  {
    PBDataWriterWriteStringField();
    id v4 = v8;
  }
  if (self->_downloadRemotePort)
  {
    PBDataWriterWriteStringField();
    id v4 = v8;
  }
  if (self->_downloadRequestTime)
  {
    PBDataWriterWriteStringField();
    id v4 = v8;
  }
  if (self->_downloadRequestToResponseTime)
  {
    PBDataWriterWriteStringField();
    id v4 = v8;
  }
  if (self->_downloadResponseTime)
  {
    PBDataWriterWriteStringField();
    id v4 = v8;
  }
  if (self->_downloadSecureConnectionTime)
  {
    PBDataWriterWriteStringField();
    id v4 = v8;
  }
  if (self->_downloadServer)
  {
    PBDataWriterWriteStringField();
    id v4 = v8;
  }
  if (self->_downloadSpeed)
  {
    PBDataWriterWriteStringField();
    id v4 = v8;
  }
  if (self->_downloadStableSpeed)
  {
    PBDataWriterWriteStringField();
    id v4 = v8;
  }
  if (self->_downloadStartDataBearerTechnology)
  {
    PBDataWriterWriteStringField();
    id v4 = v8;
  }
  if (self->_downloadStartPrimaryIpv4Interface)
  {
    PBDataWriterWriteStringField();
    id v4 = v8;
  }
  if (self->_downloadStartRat)
  {
    PBDataWriterWriteStringField();
    id v4 = v8;
  }
  if ((*((unsigned char *)&self->_has + 1) & 0x80) != 0)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v8;
  }
  if (self->_networkPrimaryIpv4InterfaceName)
  {
    PBDataWriterWriteStringField();
    id v4 = v8;
  }
  if (self->_networkPrimaryIpv4ServiceName)
  {
    PBDataWriterWriteStringField();
    id v4 = v8;
  }
  if (self->_nptkitFrameworkVersion)
  {
    PBDataWriterWriteStringField();
    id v4 = v8;
  }
  if (self->_performanceTestStartTime)
  {
    PBDataWriterWriteStringField();
    id v4 = v8;
  }
  if (self->_pingAddress)
  {
    PBDataWriterWriteStringField();
    id v4 = v8;
  }
  if (self->_pingLossPercent)
  {
    PBDataWriterWriteStringField();
    id v4 = v8;
  }
  if (self->_pingMaxLatency)
  {
    PBDataWriterWriteStringField();
    id v4 = v8;
  }
  if (self->_pingMeanLatency)
  {
    PBDataWriterWriteStringField();
    id v4 = v8;
  }
  if (self->_pingMinLatency)
  {
    PBDataWriterWriteStringField();
    id v4 = v8;
  }
  if (self->_pingStandardDeviation)
  {
    PBDataWriterWriteStringField();
    id v4 = v8;
  }
  if (self->_powerBatteryWarningLevel)
  {
    PBDataWriterWriteStringField();
    id v4 = v8;
  }
  if (self->_powerSourceType)
  {
    PBDataWriterWriteStringField();
    id v4 = v8;
  }
  if (self->_powerStateCaps)
  {
    PBDataWriterWriteStringField();
    id v4 = v8;
  }
  if (self->_systemActiveProcessorCount)
  {
    PBDataWriterWriteStringField();
    id v4 = v8;
  }
  if (self->_systemBatteryLevel)
  {
    PBDataWriterWriteStringField();
    id v4 = v8;
  }
  if (self->_systemBatteryState)
  {
    PBDataWriterWriteStringField();
    id v4 = v8;
  }
  if (self->_systemDeviceClass)
  {
    PBDataWriterWriteStringField();
    id v4 = v8;
  }
  if (self->_systemDeviceModel)
  {
    PBDataWriterWriteStringField();
    id v4 = v8;
  }
  if (*((unsigned char *)&self->_has + 2))
  {
    PBDataWriterWriteBOOLField();
    id v4 = v8;
  }
  if (self->_systemName)
  {
    PBDataWriterWriteStringField();
    id v4 = v8;
  }
  if (self->_systemOsVariant)
  {
    PBDataWriterWriteStringField();
    id v4 = v8;
  }
  if (self->_systemPhysicalMemory)
  {
    PBDataWriterWriteStringField();
    id v4 = v8;
  }
  if ((*((unsigned char *)&self->_has + 2) & 2) != 0)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v8;
  }
  if (self->_systemProcessorCount)
  {
    PBDataWriterWriteStringField();
    id v4 = v8;
  }
  if (self->_systemVersion)
  {
    PBDataWriterWriteStringField();
    id v4 = v8;
  }
  if (self->_uploadCdnPop)
  {
    PBDataWriterWriteStringField();
    id v4 = v8;
  }
  if (self->_uploadCdnUuid)
  {
    PBDataWriterWriteStringField();
    id v4 = v8;
  }
  if (self->_uploadConnectionTime)
  {
    PBDataWriterWriteStringField();
    id v4 = v8;
  }
  if (self->_uploadDomainLookupTime)
  {
    PBDataWriterWriteStringField();
    id v4 = v8;
  }
  if (self->_uploadEndDataBearerTechnology)
  {
    PBDataWriterWriteStringField();
    id v4 = v8;
  }
  if (self->_uploadEndPrimaryIpv4Interface)
  {
    PBDataWriterWriteStringField();
    id v4 = v8;
  }
  if (self->_uploadEndRat)
  {
    PBDataWriterWriteStringField();
    id v4 = v8;
  }
  if (self->_uploadFileSize)
  {
    PBDataWriterWriteStringField();
    id v4 = v8;
  }
  if (self->_uploadInterfaceName)
  {
    PBDataWriterWriteStringField();
    id v4 = v8;
  }
  if (self->_uploadInterfaceServiceName)
  {
    PBDataWriterWriteStringField();
    id v4 = v8;
  }
  $0FF3A8E67B3D88A75EBF7BE240CB1B75 v7 = self->_has;
  if ((*(_DWORD *)&v7 & 0x40000) != 0)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v8;
    $0FF3A8E67B3D88A75EBF7BE240CB1B75 v7 = self->_has;
    if ((*(_DWORD *)&v7 & 0x80000) == 0)
    {
LABEL_247:
      if ((*(_DWORD *)&v7 & 0x100000) == 0) {
        goto LABEL_248;
      }
      goto LABEL_465;
    }
  }
  else if ((*(_DWORD *)&v7 & 0x80000) == 0)
  {
    goto LABEL_247;
  }
  PBDataWriterWriteBOOLField();
  id v4 = v8;
  $0FF3A8E67B3D88A75EBF7BE240CB1B75 v7 = self->_has;
  if ((*(_DWORD *)&v7 & 0x100000) == 0)
  {
LABEL_248:
    if ((*(_DWORD *)&v7 & 0x200000) == 0) {
      goto LABEL_249;
    }
    goto LABEL_466;
  }
LABEL_465:
  PBDataWriterWriteBOOLField();
  id v4 = v8;
  $0FF3A8E67B3D88A75EBF7BE240CB1B75 v7 = self->_has;
  if ((*(_DWORD *)&v7 & 0x200000) == 0)
  {
LABEL_249:
    if ((*(_DWORD *)&v7 & 0x400000) == 0) {
      goto LABEL_250;
    }
    goto LABEL_467;
  }
LABEL_466:
  PBDataWriterWriteBOOLField();
  id v4 = v8;
  $0FF3A8E67B3D88A75EBF7BE240CB1B75 v7 = self->_has;
  if ((*(_DWORD *)&v7 & 0x400000) == 0)
  {
LABEL_250:
    if ((*(_DWORD *)&v7 & 0x800000) == 0) {
      goto LABEL_252;
    }
    goto LABEL_251;
  }
LABEL_467:
  PBDataWriterWriteBOOLField();
  id v4 = v8;
  if ((*(_DWORD *)&self->_has & 0x800000) != 0)
  {
LABEL_251:
    PBDataWriterWriteBOOLField();
    id v4 = v8;
  }
LABEL_252:
  if (self->_uploadMaxSpeedObserved)
  {
    PBDataWriterWriteStringField();
    id v4 = v8;
  }
  if (self->_uploadNumberOfStreams)
  {
    PBDataWriterWriteStringField();
    id v4 = v8;
  }
  if (self->_uploadProtocolName)
  {
    PBDataWriterWriteStringField();
    id v4 = v8;
  }
  if (self->_uploadRemoteAddress)
  {
    PBDataWriterWriteStringField();
    id v4 = v8;
  }
  if (self->_uploadRemotePort)
  {
    PBDataWriterWriteStringField();
    id v4 = v8;
  }
  if (self->_uploadRequestTime)
  {
    PBDataWriterWriteStringField();
    id v4 = v8;
  }
  if (self->_uploadRequestToResponseTime)
  {
    PBDataWriterWriteStringField();
    id v4 = v8;
  }
  if (self->_uploadResponseTime)
  {
    PBDataWriterWriteStringField();
    id v4 = v8;
  }
  if (self->_uploadSecureConnectionTime)
  {
    PBDataWriterWriteStringField();
    id v4 = v8;
  }
  if (self->_uploadServer)
  {
    PBDataWriterWriteStringField();
    id v4 = v8;
  }
  if (self->_uploadSpeed)
  {
    PBDataWriterWriteStringField();
    id v4 = v8;
  }
  if (self->_uploadStableSpeed)
  {
    PBDataWriterWriteStringField();
    id v4 = v8;
  }
  if (self->_uploadStartDataBearerTechnology)
  {
    PBDataWriterWriteStringField();
    id v4 = v8;
  }
  if (self->_uploadStartPrimaryIpv4Interface)
  {
    PBDataWriterWriteStringField();
    id v4 = v8;
  }
  if (self->_uploadStartRat)
  {
    PBDataWriterWriteStringField();
    id v4 = v8;
  }
  if (*((unsigned char *)&self->_has + 3))
  {
    PBDataWriterWriteBOOLField();
    id v4 = v8;
  }
  if (self->_wifiAveragePhyRateRx)
  {
    PBDataWriterWriteStringField();
    id v4 = v8;
  }
  if (self->_wifiAverageRssi)
  {
    PBDataWriterWriteStringField();
    id v4 = v8;
  }
  if (self->_wifiAverageSnr)
  {
    PBDataWriterWriteStringField();
    id v4 = v8;
  }
  if (self->_wifiAverageTcpRtt)
  {
    PBDataWriterWriteStringField();
    id v4 = v8;
  }
  if (self->_wifiBtcMode)
  {
    PBDataWriterWriteStringField();
    id v4 = v8;
  }
  if (self->_wifiCca)
  {
    PBDataWriterWriteStringField();
    id v4 = v8;
  }
  if (self->_wifiChannel)
  {
    PBDataWriterWriteStringField();
    id v4 = v8;
  }
  if (self->_wifiCwfCca)
  {
    PBDataWriterWriteStringField();
    id v4 = v8;
  }
  if (self->_wifiEapolControlMode)
  {
    PBDataWriterWriteStringField();
    id v4 = v8;
  }
  if (self->_wifiEapolSupplicantState)
  {
    PBDataWriterWriteStringField();
    id v4 = v8;
  }
  if (self->_wifiGuardInterval)
  {
    PBDataWriterWriteStringField();
    id v4 = v8;
  }
  if (self->_wifiHiddenState)
  {
    PBDataWriterWriteStringField();
    id v4 = v8;
  }
  if ((*((unsigned char *)&self->_has + 3) & 2) != 0)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v8;
  }
  if (self->_wifiMcsIndex)
  {
    PBDataWriterWriteStringField();
    id v4 = v8;
  }
  if (self->_wifiNoise)
  {
    PBDataWriterWriteStringField();
    id v4 = v8;
  }
  if (self->_wifiNumberOfSpatialStreams)
  {
    PBDataWriterWriteStringField();
    id v4 = v8;
  }
  if (self->_wifiOpMode)
  {
    PBDataWriterWriteStringField();
    id v4 = v8;
  }
  if (self->_wifiPhyMode)
  {
    PBDataWriterWriteStringField();
    id v4 = v8;
  }
  if (self->_wifiRssi)
  {
    PBDataWriterWriteStringField();
    id v4 = v8;
  }
  if (self->_wifiSecurity)
  {
    PBDataWriterWriteStringField();
    id v4 = v8;
  }
  if (self->_wifiTxRate)
  {
    PBDataWriterWriteStringField();
    id v4 = v8;
  }
  if (self->_wrmChannelType)
  {
    PBDataWriterWriteStringField();
    id v4 = v8;
  }
  if (self->_cellularCellid)
  {
    PBDataWriterWriteStringField();
    id v4 = v8;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v8;
  }
  if (self->_networkQualityResponsiveness)
  {
    PBDataWriterWriteStringField();
    id v4 = v8;
  }
  if (self->_cellularAggregatedDLBW)
  {
    PBDataWriterWriteStringField();
    id v4 = v8;
  }
  if (self->_cellularAggregatedULBW)
  {
    PBDataWriterWriteStringField();
    id v4 = v8;
  }
  if (self->_cellularIssa)
  {
    PBDataWriterWriteStringField();
    id v4 = v8;
  }
  if (self->_cellularLac)
  {
    PBDataWriterWriteStringField();
    id v4 = v8;
  }
  if (self->_cellularLteNrConfiguredBw)
  {
    PBDataWriterWriteStringField();
    id v4 = v8;
  }
  if (self->_cellularMaxDlMod)
  {
    PBDataWriterWriteStringField();
    id v4 = v8;
  }
  if (self->_cellularMaxNwMimoLyr)
  {
    PBDataWriterWriteStringField();
    id v4 = v8;
  }
  if (self->_cellularMaxSchdMimoLyr)
  {
    PBDataWriterWriteStringField();
    id v4 = v8;
  }
  if (self->_cellularMaxUeRank)
  {
    PBDataWriterWriteStringField();
    id v4 = v8;
  }
  if (self->_cellularMaxUlMod)
  {
    PBDataWriterWriteStringField();
    id v4 = v8;
  }
  if (self->_cellularNrSinr)
  {
    PBDataWriterWriteStringField();
    id v4 = v8;
  }
  if (self->_cellularNrarfcn)
  {
    PBDataWriterWriteStringField();
    id v4 = v8;
  }
  if (self->_cellularRadioFrequency)
  {
    PBDataWriterWriteStringField();
    id v4 = v8;
  }
  if (self->_cellularTotalDlMimoLayers)
  {
    PBDataWriterWriteStringField();
    id v4 = v8;
  }
  if (self->_cellularTotalNumCcs)
  {
    PBDataWriterWriteStringField();
    id v4 = v8;
  }
  if (self->_downloadStartRadioFrequency)
  {
    PBDataWriterWriteStringField();
    id v4 = v8;
  }
  if (self->_downloadEndRadioFrequency)
  {
    PBDataWriterWriteStringField();
    id v4 = v8;
  }
  if (self->_networkPrimaryIpv6InterfaceName)
  {
    PBDataWriterWriteStringField();
    id v4 = v8;
  }
  if (self->_networkPrimaryIpv6ServiceName)
  {
    PBDataWriterWriteStringField();
    id v4 = v8;
  }
  if (self->_uploadStartRadioFrequency)
  {
    PBDataWriterWriteStringField();
    id v4 = v8;
  }
  if (self->_uploadEndRadioFrequency)
  {
    PBDataWriterWriteStringField();
    id v4 = v8;
  }
  if (self->_downloadError)
  {
    PBDataWriterWriteStringField();
    id v4 = v8;
  }
  if (self->_networkQualityError)
  {
    PBDataWriterWriteStringField();
    id v4 = v8;
  }
  if (self->_networkQualityDownloadSpeed)
  {
    PBDataWriterWriteStringField();
    id v4 = v8;
  }
  if (self->_networkQualityUploadSpeed)
  {
    PBDataWriterWriteStringField();
    id v4 = v8;
  }
  if (self->_networkQualityRating)
  {
    PBDataWriterWriteStringField();
    id v4 = v8;
  }
  if (self->_vpnConnectionState)
  {
    PBDataWriterWriteStringField();
    id v4 = v8;
  }
  if (self->_uploadError)
  {
    PBDataWriterWriteStringField();
    id v4 = v8;
  }
  if (self->_uploadErrorDomain)
  {
    PBDataWriterWriteStringField();
    id v4 = v8;
  }
  if (self->_uploadErrorCode)
  {
    PBDataWriterWriteStringField();
    id v4 = v8;
  }
  if (self->_downloadErrorDomain)
  {
    PBDataWriterWriteStringField();
    id v4 = v8;
  }
  if (self->_downloadErrorCode)
  {
    PBDataWriterWriteStringField();
    id v4 = v8;
  }
  if (self->_pingError)
  {
    PBDataWriterWriteStringField();
    id v4 = v8;
  }
  if (self->_pingErrorDomain)
  {
    PBDataWriterWriteStringField();
    id v4 = v8;
  }
  if (self->_pingErrorCode)
  {
    PBDataWriterWriteStringField();
    id v4 = v8;
  }
  if (self->_networkQualityErrorDomain)
  {
    PBDataWriterWriteStringField();
    id v4 = v8;
  }
  if (self->_networkQualityErrorCode)
  {
    PBDataWriterWriteStringField();
    id v4 = v8;
  }
  if (self->_cellularRnMobileCountryCode)
  {
    PBDataWriterWriteStringField();
    id v4 = v8;
  }
  if (self->_cellularRnMobileNetworkCode)
  {
    PBDataWriterWriteStringField();
    id v4 = v8;
  }
  if (*((unsigned char *)&self->_has + 1))
  {
    PBDataWriterWriteBOOLField();
    id v4 = v8;
  }
  if (self->_downloadStartCellularEstimate)
  {
    PBDataWriterWriteStringField();
    id v4 = v8;
  }
  if (self->_downloadEndCellularEstimate)
  {
    PBDataWriterWriteStringField();
    id v4 = v8;
  }
  if (self->_downloadMaxCellularEstimate)
  {
    PBDataWriterWriteStringField();
    id v4 = v8;
  }
  if (self->_uploadStartCellularEstimate)
  {
    PBDataWriterWriteStringField();
    id v4 = v8;
  }
  if (self->_uploadEndCellularEstimate)
  {
    PBDataWriterWriteStringField();
    id v4 = v8;
  }
  if (self->_uploadMaxCellularEstimate)
  {
    PBDataWriterWriteStringField();
    id v4 = v8;
  }
  if (self->_downloadResponsiveness)
  {
    PBDataWriterWriteStringField();
    id v4 = v8;
  }
  if (self->_downloadResponsivenessConfidence)
  {
    PBDataWriterWriteStringField();
    id v4 = v8;
  }
  if (self->_downloadResponsivenessRating)
  {
    PBDataWriterWriteStringField();
    id v4 = v8;
  }
  if (self->_downloadSpeedConfidence)
  {
    PBDataWriterWriteStringField();
    id v4 = v8;
  }
  if (self->_downloadSpeedRating)
  {
    PBDataWriterWriteStringField();
    id v4 = v8;
  }
  if (self->_uploadResponsiveness)
  {
    PBDataWriterWriteStringField();
    id v4 = v8;
  }
  if (self->_uploadResponsivenessConfidence)
  {
    PBDataWriterWriteStringField();
    id v4 = v8;
  }
  if (self->_uploadResponsivenessRating)
  {
    PBDataWriterWriteStringField();
    id v4 = v8;
  }
  if (self->_uploadSpeedConfidence)
  {
    PBDataWriterWriteStringField();
    id v4 = v8;
  }
  if (self->_uploadSpeedRating)
  {
    PBDataWriterWriteStringField();
    id v4 = v8;
  }
  if (self->_wifiChannelBand)
  {
    PBDataWriterWriteStringField();
    id v4 = v8;
  }
  if (self->_wifiChannelWidth)
  {
    PBDataWriterWriteStringField();
    id v4 = v8;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (*(unsigned char *)&self->_has)
  {
    v4[1] = self->_timestamp;
    *((_DWORD *)v4 + 421) |= 1u;
  }
  id v8 = v4;
  if (self->_awdlElectionParameters)
  {
    objc_msgSend(v4, "setAwdlElectionParameters:");
    id v4 = v8;
  }
  if (self->_awdlMasterChannel)
  {
    objc_msgSend(v8, "setAwdlMasterChannel:");
    id v4 = v8;
  }
  if (self->_awdlOpMode)
  {
    objc_msgSend(v8, "setAwdlOpMode:");
    id v4 = v8;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    *((unsigned char *)v4 + 1657) = self->_awdlPowerState;
    *((_DWORD *)v4 + 421) |= 4u;
  }
  if (self->_awdlSchedule)
  {
    objc_msgSend(v8, "setAwdlSchedule:");
    id v4 = v8;
  }
  if (self->_awdlSecondaryMasterChannel)
  {
    objc_msgSend(v8, "setAwdlSecondaryMasterChannel:");
    id v4 = v8;
  }
  if (self->_awdlSyncChannelSequence)
  {
    objc_msgSend(v8, "setAwdlSyncChannelSequence:");
    id v4 = v8;
  }
  if (self->_awdlSyncState)
  {
    objc_msgSend(v8, "setAwdlSyncState:");
    id v4 = v8;
  }
  if (self->_btConnectedDevicesCount)
  {
    objc_msgSend(v8, "setBtConnectedDevicesCount:");
    id v4 = v8;
  }
  $0FF3A8E67B3D88A75EBF7BE240CB1B75 has = self->_has;
  if ((*(unsigned char *)&has & 8) != 0)
  {
    *((unsigned char *)v4 + 1658) = self->_btIsConnectable;
    *((_DWORD *)v4 + 421) |= 8u;
    $0FF3A8E67B3D88A75EBF7BE240CB1B75 has = self->_has;
    if ((*(unsigned char *)&has & 0x10) == 0)
    {
LABEL_23:
      if ((*(unsigned char *)&has & 0x20) == 0) {
        goto LABEL_24;
      }
      goto LABEL_455;
    }
  }
  else if ((*(unsigned char *)&has & 0x10) == 0)
  {
    goto LABEL_23;
  }
  *((unsigned char *)v4 + 1659) = self->_btIsDiscoverable;
  *((_DWORD *)v4 + 421) |= 0x10u;
  $0FF3A8E67B3D88A75EBF7BE240CB1B75 has = self->_has;
  if ((*(unsigned char *)&has & 0x20) == 0)
  {
LABEL_24:
    if ((*(unsigned char *)&has & 0x40) == 0) {
      goto LABEL_26;
    }
    goto LABEL_25;
  }
LABEL_455:
  *((unsigned char *)v4 + 1660) = self->_btIsPowerOn;
  *((_DWORD *)v4 + 421) |= 0x20u;
  if ((*(_DWORD *)&self->_has & 0x40) != 0)
  {
LABEL_25:
    *((unsigned char *)v4 + 1661) = self->_btIsScanning;
    *((_DWORD *)v4 + 421) |= 0x40u;
  }
LABEL_26:
  if (self->_callingClient)
  {
    objc_msgSend(v8, "setCallingClient:");
    id v4 = v8;
  }
  if (self->_cellularActiveContexts)
  {
    objc_msgSend(v8, "setCellularActiveContexts:");
    id v4 = v8;
  }
  if ((*(unsigned char *)&self->_has & 0x80) != 0)
  {
    *((unsigned char *)v4 + 1662) = self->_cellularAllowsVoip;
    *((_DWORD *)v4 + 421) |= 0x80u;
  }
  if (self->_cellularAttached)
  {
    objc_msgSend(v8, "setCellularAttached:");
    id v4 = v8;
  }
  if (self->_cellularBandinfo)
  {
    objc_msgSend(v8, "setCellularBandinfo:");
    id v4 = v8;
  }
  if (self->_cellularBandwidth)
  {
    objc_msgSend(v8, "setCellularBandwidth:");
    id v4 = v8;
  }
  if (self->_cellularCarrierName)
  {
    objc_msgSend(v8, "setCellularCarrierName:");
    id v4 = v8;
  }
  if (self->_cellularDataBearerSoMask)
  {
    objc_msgSend(v8, "setCellularDataBearerSoMask:");
    id v4 = v8;
  }
  if (self->_cellularDataBearerTechnology)
  {
    objc_msgSend(v8, "setCellularDataBearerTechnology:");
    id v4 = v8;
  }
  if (self->_cellularDataPlanSignalingReductionOverride)
  {
    objc_msgSend(v8, "setCellularDataPlanSignalingReductionOverride:");
    id v4 = v8;
  }
  if (self->_cellularDataPossible)
  {
    objc_msgSend(v8, "setCellularDataPossible:");
    id v4 = v8;
  }
  if (self->_cellularInHomeCountry)
  {
    objc_msgSend(v8, "setCellularInHomeCountry:");
    id v4 = v8;
  }
  if (self->_cellularIndicator)
  {
    objc_msgSend(v8, "setCellularIndicator:");
    id v4 = v8;
  }
  if (self->_cellularIndicatorOverride)
  {
    objc_msgSend(v8, "setCellularIndicatorOverride:");
    id v4 = v8;
  }
  if (self->_cellularIsoCountryCode)
  {
    objc_msgSend(v8, "setCellularIsoCountryCode:");
    id v4 = v8;
  }
  if (self->_cellularLqm)
  {
    objc_msgSend(v8, "setCellularLqm:");
    id v4 = v8;
  }
  if (self->_cellularLteMaxScheduledLayers)
  {
    objc_msgSend(v8, "setCellularLteMaxScheduledLayers:");
    id v4 = v8;
  }
  if (self->_cellularMobileCountryCode)
  {
    objc_msgSend(v8, "setCellularMobileCountryCode:");
    id v4 = v8;
  }
  if (self->_cellularMobileNetworkCode)
  {
    objc_msgSend(v8, "setCellularMobileNetworkCode:");
    id v4 = v8;
  }
  if (self->_cellularNewRadioCoverage)
  {
    objc_msgSend(v8, "setCellularNewRadioCoverage:");
    id v4 = v8;
  }
  if (self->_cellularNewRadioDataBearer)
  {
    objc_msgSend(v8, "setCellularNewRadioDataBearer:");
    id v4 = v8;
  }
  if (self->_cellularNewRadioMmwaveDataBearer)
  {
    objc_msgSend(v8, "setCellularNewRadioMmwaveDataBearer:");
    id v4 = v8;
  }
  if (self->_cellularNewRadioNsaCoverage)
  {
    objc_msgSend(v8, "setCellularNewRadioNsaCoverage:");
    id v4 = v8;
  }
  if (self->_cellularNewRadioNsaDataBearer)
  {
    objc_msgSend(v8, "setCellularNewRadioNsaDataBearer:");
    id v4 = v8;
  }
  if (self->_cellularNewRadioSaCoverage)
  {
    objc_msgSend(v8, "setCellularNewRadioSaCoverage:");
    id v4 = v8;
  }
  if (self->_cellularNewRadioSaDataBearer)
  {
    objc_msgSend(v8, "setCellularNewRadioSaDataBearer:");
    id v4 = v8;
  }
  if (self->_cellularNewRadioSub6DataBearer)
  {
    objc_msgSend(v8, "setCellularNewRadioSub6DataBearer:");
    id v4 = v8;
  }
  if (self->_cellularNrConfiguredBw)
  {
    objc_msgSend(v8, "setCellularNrConfiguredBw:");
    id v4 = v8;
  }
  if (self->_cellularNrLayers)
  {
    objc_msgSend(v8, "setCellularNrLayers:");
    id v4 = v8;
  }
  if (self->_cellularNrModulation)
  {
    objc_msgSend(v8, "setCellularNrModulation:");
    id v4 = v8;
  }
  if (self->_cellularNrRsrp)
  {
    objc_msgSend(v8, "setCellularNrRsrp:");
    id v4 = v8;
  }
  if (self->_cellularNrRsrq)
  {
    objc_msgSend(v8, "setCellularNrRsrq:");
    id v4 = v8;
  }
  if (self->_cellularNrSnr)
  {
    objc_msgSend(v8, "setCellularNrSnr:");
    id v4 = v8;
  }
  if (self->_cellularPid)
  {
    objc_msgSend(v8, "setCellularPid:");
    id v4 = v8;
  }
  if (self->_cellularRadioAccessTechnology)
  {
    objc_msgSend(v8, "setCellularRadioAccessTechnology:");
    id v4 = v8;
  }
  if (self->_cellularRadioAccessTechnologyCtDataStatus)
  {
    objc_msgSend(v8, "setCellularRadioAccessTechnologyCtDataStatus:");
    id v4 = v8;
  }
  if (self->_cellularRoamAllowed)
  {
    objc_msgSend(v8, "setCellularRoamAllowed:");
    id v4 = v8;
  }
  if (self->_cellularRsrp)
  {
    objc_msgSend(v8, "setCellularRsrp:");
    id v4 = v8;
  }
  if (self->_cellularSnr)
  {
    objc_msgSend(v8, "setCellularSnr:");
    id v4 = v8;
  }
  if (self->_cellularTac)
  {
    objc_msgSend(v8, "setCellularTac:");
    id v4 = v8;
  }
  if (self->_cellularTotalActiveContexts)
  {
    objc_msgSend(v8, "setCellularTotalActiveContexts:");
    id v4 = v8;
  }
  if (self->_cellularTotalBw)
  {
    objc_msgSend(v8, "setCellularTotalBw:");
    id v4 = v8;
  }
  if (self->_cellularTotalCcs)
  {
    objc_msgSend(v8, "setCellularTotalCcs:");
    id v4 = v8;
  }
  if (self->_cellularTotalLayers)
  {
    objc_msgSend(v8, "setCellularTotalLayers:");
    id v4 = v8;
  }
  if (self->_cellularUarfcn)
  {
    objc_msgSend(v8, "setCellularUarfcn:");
    id v4 = v8;
  }
  if (self->_downloadCdnPop)
  {
    objc_msgSend(v8, "setDownloadCdnPop:");
    id v4 = v8;
  }
  if (self->_downloadCdnUuid)
  {
    objc_msgSend(v8, "setDownloadCdnUuid:");
    id v4 = v8;
  }
  if (self->_downloadConnectionTime)
  {
    objc_msgSend(v8, "setDownloadConnectionTime:");
    id v4 = v8;
  }
  if (self->_downloadDomainLookupTime)
  {
    objc_msgSend(v8, "setDownloadDomainLookupTime:");
    id v4 = v8;
  }
  if (self->_downloadEndDataBearerTechnology)
  {
    objc_msgSend(v8, "setDownloadEndDataBearerTechnology:");
    id v4 = v8;
  }
  if (self->_downloadEndPrimaryIpv4Interface)
  {
    objc_msgSend(v8, "setDownloadEndPrimaryIpv4Interface:");
    id v4 = v8;
  }
  if (self->_downloadEndRat)
  {
    objc_msgSend(v8, "setDownloadEndRat:");
    id v4 = v8;
  }
  if (self->_downloadFileSize)
  {
    objc_msgSend(v8, "setDownloadFileSize:");
    id v4 = v8;
  }
  if (self->_downloadInterfaceName)
  {
    objc_msgSend(v8, "setDownloadInterfaceName:");
    id v4 = v8;
  }
  if (self->_downloadInterfaceServiceName)
  {
    objc_msgSend(v8, "setDownloadInterfaceServiceName:");
    id v4 = v8;
  }
  $0FF3A8E67B3D88A75EBF7BE240CB1B75 v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x200) != 0)
  {
    *((unsigned char *)v4 + 1664) = self->_downloadIsCellular;
    *((_DWORD *)v4 + 421) |= 0x200u;
    $0FF3A8E67B3D88A75EBF7BE240CB1B75 v6 = self->_has;
    if ((*(_WORD *)&v6 & 0x400) == 0)
    {
LABEL_138:
      if ((*(_WORD *)&v6 & 0x800) == 0) {
        goto LABEL_139;
      }
      goto LABEL_459;
    }
  }
  else if ((*(_WORD *)&v6 & 0x400) == 0)
  {
    goto LABEL_138;
  }
  *((unsigned char *)v4 + 1665) = self->_downloadIsConstrained;
  *((_DWORD *)v4 + 421) |= 0x400u;
  $0FF3A8E67B3D88A75EBF7BE240CB1B75 v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x800) == 0)
  {
LABEL_139:
    if ((*(_WORD *)&v6 & 0x1000) == 0) {
      goto LABEL_140;
    }
    goto LABEL_460;
  }
LABEL_459:
  *((unsigned char *)v4 + 1666) = self->_downloadIsExpensive;
  *((_DWORD *)v4 + 421) |= 0x800u;
  $0FF3A8E67B3D88A75EBF7BE240CB1B75 v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x1000) == 0)
  {
LABEL_140:
    if ((*(_WORD *)&v6 & 0x2000) == 0) {
      goto LABEL_141;
    }
    goto LABEL_461;
  }
LABEL_460:
  *((unsigned char *)v4 + 1667) = self->_downloadIsMultipath;
  *((_DWORD *)v4 + 421) |= 0x1000u;
  $0FF3A8E67B3D88A75EBF7BE240CB1B75 v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x2000) == 0)
  {
LABEL_141:
    if ((*(_WORD *)&v6 & 0x4000) == 0) {
      goto LABEL_143;
    }
    goto LABEL_142;
  }
LABEL_461:
  *((unsigned char *)v4 + 1668) = self->_downloadIsProxyConnection;
  *((_DWORD *)v4 + 421) |= 0x2000u;
  if ((*(_DWORD *)&self->_has & 0x4000) != 0)
  {
LABEL_142:
    *((unsigned char *)v4 + 1669) = self->_downloadIsReusedConnection;
    *((_DWORD *)v4 + 421) |= 0x4000u;
  }
LABEL_143:
  if (self->_downloadMaxSpeedObserved)
  {
    objc_msgSend(v8, "setDownloadMaxSpeedObserved:");
    id v4 = v8;
  }
  if (self->_downloadNumberOfStreams)
  {
    objc_msgSend(v8, "setDownloadNumberOfStreams:");
    id v4 = v8;
  }
  if (self->_downloadProtocolName)
  {
    objc_msgSend(v8, "setDownloadProtocolName:");
    id v4 = v8;
  }
  if (self->_downloadRemoteAddress)
  {
    objc_msgSend(v8, "setDownloadRemoteAddress:");
    id v4 = v8;
  }
  if (self->_downloadRemotePort)
  {
    objc_msgSend(v8, "setDownloadRemotePort:");
    id v4 = v8;
  }
  if (self->_downloadRequestTime)
  {
    objc_msgSend(v8, "setDownloadRequestTime:");
    id v4 = v8;
  }
  if (self->_downloadRequestToResponseTime)
  {
    objc_msgSend(v8, "setDownloadRequestToResponseTime:");
    id v4 = v8;
  }
  if (self->_downloadResponseTime)
  {
    objc_msgSend(v8, "setDownloadResponseTime:");
    id v4 = v8;
  }
  if (self->_downloadSecureConnectionTime)
  {
    objc_msgSend(v8, "setDownloadSecureConnectionTime:");
    id v4 = v8;
  }
  if (self->_downloadServer)
  {
    objc_msgSend(v8, "setDownloadServer:");
    id v4 = v8;
  }
  if (self->_downloadSpeed)
  {
    objc_msgSend(v8, "setDownloadSpeed:");
    id v4 = v8;
  }
  if (self->_downloadStableSpeed)
  {
    objc_msgSend(v8, "setDownloadStableSpeed:");
    id v4 = v8;
  }
  if (self->_downloadStartDataBearerTechnology)
  {
    objc_msgSend(v8, "setDownloadStartDataBearerTechnology:");
    id v4 = v8;
  }
  if (self->_downloadStartPrimaryIpv4Interface)
  {
    objc_msgSend(v8, "setDownloadStartPrimaryIpv4Interface:");
    id v4 = v8;
  }
  if (self->_downloadStartRat)
  {
    objc_msgSend(v8, "setDownloadStartRat:");
    id v4 = v8;
  }
  if ((*((unsigned char *)&self->_has + 1) & 0x80) != 0)
  {
    *((unsigned char *)v4 + 1670) = self->_networkIsAppleReachable;
    *((_DWORD *)v4 + 421) |= 0x8000u;
  }
  if (self->_networkPrimaryIpv4InterfaceName)
  {
    objc_msgSend(v8, "setNetworkPrimaryIpv4InterfaceName:");
    id v4 = v8;
  }
  if (self->_networkPrimaryIpv4ServiceName)
  {
    objc_msgSend(v8, "setNetworkPrimaryIpv4ServiceName:");
    id v4 = v8;
  }
  if (self->_nptkitFrameworkVersion)
  {
    objc_msgSend(v8, "setNptkitFrameworkVersion:");
    id v4 = v8;
  }
  if (self->_performanceTestStartTime)
  {
    objc_msgSend(v8, "setPerformanceTestStartTime:");
    id v4 = v8;
  }
  if (self->_pingAddress)
  {
    objc_msgSend(v8, "setPingAddress:");
    id v4 = v8;
  }
  if (self->_pingLossPercent)
  {
    objc_msgSend(v8, "setPingLossPercent:");
    id v4 = v8;
  }
  if (self->_pingMaxLatency)
  {
    objc_msgSend(v8, "setPingMaxLatency:");
    id v4 = v8;
  }
  if (self->_pingMeanLatency)
  {
    objc_msgSend(v8, "setPingMeanLatency:");
    id v4 = v8;
  }
  if (self->_pingMinLatency)
  {
    objc_msgSend(v8, "setPingMinLatency:");
    id v4 = v8;
  }
  if (self->_pingStandardDeviation)
  {
    objc_msgSend(v8, "setPingStandardDeviation:");
    id v4 = v8;
  }
  if (self->_powerBatteryWarningLevel)
  {
    objc_msgSend(v8, "setPowerBatteryWarningLevel:");
    id v4 = v8;
  }
  if (self->_powerSourceType)
  {
    objc_msgSend(v8, "setPowerSourceType:");
    id v4 = v8;
  }
  if (self->_powerStateCaps)
  {
    objc_msgSend(v8, "setPowerStateCaps:");
    id v4 = v8;
  }
  if (self->_systemActiveProcessorCount)
  {
    objc_msgSend(v8, "setSystemActiveProcessorCount:");
    id v4 = v8;
  }
  if (self->_systemBatteryLevel)
  {
    objc_msgSend(v8, "setSystemBatteryLevel:");
    id v4 = v8;
  }
  if (self->_systemBatteryState)
  {
    objc_msgSend(v8, "setSystemBatteryState:");
    id v4 = v8;
  }
  if (self->_systemDeviceClass)
  {
    objc_msgSend(v8, "setSystemDeviceClass:");
    id v4 = v8;
  }
  if (self->_systemDeviceModel)
  {
    objc_msgSend(v8, "setSystemDeviceModel:");
    id v4 = v8;
  }
  if (*((unsigned char *)&self->_has + 2))
  {
    *((unsigned char *)v4 + 1671) = self->_systemLowPowerModeEnabled;
    *((_DWORD *)v4 + 421) |= 0x10000u;
  }
  if (self->_systemName)
  {
    objc_msgSend(v8, "setSystemName:");
    id v4 = v8;
  }
  if (self->_systemOsVariant)
  {
    objc_msgSend(v8, "setSystemOsVariant:");
    id v4 = v8;
  }
  if (self->_systemPhysicalMemory)
  {
    objc_msgSend(v8, "setSystemPhysicalMemory:");
    id v4 = v8;
  }
  if ((*((unsigned char *)&self->_has + 2) & 2) != 0)
  {
    *((unsigned char *)v4 + 1672) = self->_systemPowersourceConnected;
    *((_DWORD *)v4 + 421) |= 0x20000u;
  }
  if (self->_systemProcessorCount)
  {
    objc_msgSend(v8, "setSystemProcessorCount:");
    id v4 = v8;
  }
  if (self->_systemVersion)
  {
    objc_msgSend(v8, "setSystemVersion:");
    id v4 = v8;
  }
  if (self->_uploadCdnPop)
  {
    objc_msgSend(v8, "setUploadCdnPop:");
    id v4 = v8;
  }
  if (self->_uploadCdnUuid)
  {
    objc_msgSend(v8, "setUploadCdnUuid:");
    id v4 = v8;
  }
  if (self->_uploadConnectionTime)
  {
    objc_msgSend(v8, "setUploadConnectionTime:");
    id v4 = v8;
  }
  if (self->_uploadDomainLookupTime)
  {
    objc_msgSend(v8, "setUploadDomainLookupTime:");
    id v4 = v8;
  }
  if (self->_uploadEndDataBearerTechnology)
  {
    objc_msgSend(v8, "setUploadEndDataBearerTechnology:");
    id v4 = v8;
  }
  if (self->_uploadEndPrimaryIpv4Interface)
  {
    objc_msgSend(v8, "setUploadEndPrimaryIpv4Interface:");
    id v4 = v8;
  }
  if (self->_uploadEndRat)
  {
    objc_msgSend(v8, "setUploadEndRat:");
    id v4 = v8;
  }
  if (self->_uploadFileSize)
  {
    objc_msgSend(v8, "setUploadFileSize:");
    id v4 = v8;
  }
  if (self->_uploadInterfaceName)
  {
    objc_msgSend(v8, "setUploadInterfaceName:");
    id v4 = v8;
  }
  if (self->_uploadInterfaceServiceName)
  {
    objc_msgSend(v8, "setUploadInterfaceServiceName:");
    id v4 = v8;
  }
  $0FF3A8E67B3D88A75EBF7BE240CB1B75 v7 = self->_has;
  if ((*(_DWORD *)&v7 & 0x40000) != 0)
  {
    *((unsigned char *)v4 + 1673) = self->_uploadIsCellular;
    *((_DWORD *)v4 + 421) |= 0x40000u;
    $0FF3A8E67B3D88A75EBF7BE240CB1B75 v7 = self->_has;
    if ((*(_DWORD *)&v7 & 0x80000) == 0)
    {
LABEL_247:
      if ((*(_DWORD *)&v7 & 0x100000) == 0) {
        goto LABEL_248;
      }
      goto LABEL_465;
    }
  }
  else if ((*(_DWORD *)&v7 & 0x80000) == 0)
  {
    goto LABEL_247;
  }
  *((unsigned char *)v4 + 1674) = self->_uploadIsConstrained;
  *((_DWORD *)v4 + 421) |= 0x80000u;
  $0FF3A8E67B3D88A75EBF7BE240CB1B75 v7 = self->_has;
  if ((*(_DWORD *)&v7 & 0x100000) == 0)
  {
LABEL_248:
    if ((*(_DWORD *)&v7 & 0x200000) == 0) {
      goto LABEL_249;
    }
    goto LABEL_466;
  }
LABEL_465:
  *((unsigned char *)v4 + 1675) = self->_uploadIsExpensive;
  *((_DWORD *)v4 + 421) |= 0x100000u;
  $0FF3A8E67B3D88A75EBF7BE240CB1B75 v7 = self->_has;
  if ((*(_DWORD *)&v7 & 0x200000) == 0)
  {
LABEL_249:
    if ((*(_DWORD *)&v7 & 0x400000) == 0) {
      goto LABEL_250;
    }
    goto LABEL_467;
  }
LABEL_466:
  *((unsigned char *)v4 + 1676) = self->_uploadIsMultipath;
  *((_DWORD *)v4 + 421) |= 0x200000u;
  $0FF3A8E67B3D88A75EBF7BE240CB1B75 v7 = self->_has;
  if ((*(_DWORD *)&v7 & 0x400000) == 0)
  {
LABEL_250:
    if ((*(_DWORD *)&v7 & 0x800000) == 0) {
      goto LABEL_252;
    }
    goto LABEL_251;
  }
LABEL_467:
  *((unsigned char *)v4 + 1677) = self->_uploadIsProxyConnection;
  *((_DWORD *)v4 + 421) |= 0x400000u;
  if ((*(_DWORD *)&self->_has & 0x800000) != 0)
  {
LABEL_251:
    *((unsigned char *)v4 + 1678) = self->_uploadIsReusedConnection;
    *((_DWORD *)v4 + 421) |= 0x800000u;
  }
LABEL_252:
  if (self->_uploadMaxSpeedObserved)
  {
    objc_msgSend(v8, "setUploadMaxSpeedObserved:");
    id v4 = v8;
  }
  if (self->_uploadNumberOfStreams)
  {
    objc_msgSend(v8, "setUploadNumberOfStreams:");
    id v4 = v8;
  }
  if (self->_uploadProtocolName)
  {
    objc_msgSend(v8, "setUploadProtocolName:");
    id v4 = v8;
  }
  if (self->_uploadRemoteAddress)
  {
    objc_msgSend(v8, "setUploadRemoteAddress:");
    id v4 = v8;
  }
  if (self->_uploadRemotePort)
  {
    objc_msgSend(v8, "setUploadRemotePort:");
    id v4 = v8;
  }
  if (self->_uploadRequestTime)
  {
    objc_msgSend(v8, "setUploadRequestTime:");
    id v4 = v8;
  }
  if (self->_uploadRequestToResponseTime)
  {
    objc_msgSend(v8, "setUploadRequestToResponseTime:");
    id v4 = v8;
  }
  if (self->_uploadResponseTime)
  {
    objc_msgSend(v8, "setUploadResponseTime:");
    id v4 = v8;
  }
  if (self->_uploadSecureConnectionTime)
  {
    objc_msgSend(v8, "setUploadSecureConnectionTime:");
    id v4 = v8;
  }
  if (self->_uploadServer)
  {
    objc_msgSend(v8, "setUploadServer:");
    id v4 = v8;
  }
  if (self->_uploadSpeed)
  {
    objc_msgSend(v8, "setUploadSpeed:");
    id v4 = v8;
  }
  if (self->_uploadStableSpeed)
  {
    objc_msgSend(v8, "setUploadStableSpeed:");
    id v4 = v8;
  }
  if (self->_uploadStartDataBearerTechnology)
  {
    objc_msgSend(v8, "setUploadStartDataBearerTechnology:");
    id v4 = v8;
  }
  if (self->_uploadStartPrimaryIpv4Interface)
  {
    objc_msgSend(v8, "setUploadStartPrimaryIpv4Interface:");
    id v4 = v8;
  }
  if (self->_uploadStartRat)
  {
    objc_msgSend(v8, "setUploadStartRat:");
    id v4 = v8;
  }
  if (*((unsigned char *)&self->_has + 3))
  {
    *((unsigned char *)v4 + 1679) = self->_useWifiWasSpecified;
    *((_DWORD *)v4 + 421) |= 0x1000000u;
  }
  if (self->_wifiAveragePhyRateRx)
  {
    objc_msgSend(v8, "setWifiAveragePhyRateRx:");
    id v4 = v8;
  }
  if (self->_wifiAverageRssi)
  {
    objc_msgSend(v8, "setWifiAverageRssi:");
    id v4 = v8;
  }
  if (self->_wifiAverageSnr)
  {
    objc_msgSend(v8, "setWifiAverageSnr:");
    id v4 = v8;
  }
  if (self->_wifiAverageTcpRtt)
  {
    objc_msgSend(v8, "setWifiAverageTcpRtt:");
    id v4 = v8;
  }
  if (self->_wifiBtcMode)
  {
    objc_msgSend(v8, "setWifiBtcMode:");
    id v4 = v8;
  }
  if (self->_wifiCca)
  {
    objc_msgSend(v8, "setWifiCca:");
    id v4 = v8;
  }
  if (self->_wifiChannel)
  {
    objc_msgSend(v8, "setWifiChannel:");
    id v4 = v8;
  }
  if (self->_wifiCwfCca)
  {
    objc_msgSend(v8, "setWifiCwfCca:");
    id v4 = v8;
  }
  if (self->_wifiEapolControlMode)
  {
    objc_msgSend(v8, "setWifiEapolControlMode:");
    id v4 = v8;
  }
  if (self->_wifiEapolSupplicantState)
  {
    objc_msgSend(v8, "setWifiEapolSupplicantState:");
    id v4 = v8;
  }
  if (self->_wifiGuardInterval)
  {
    objc_msgSend(v8, "setWifiGuardInterval:");
    id v4 = v8;
  }
  if (self->_wifiHiddenState)
  {
    objc_msgSend(v8, "setWifiHiddenState:");
    id v4 = v8;
  }
  if ((*((unsigned char *)&self->_has + 3) & 2) != 0)
  {
    *((unsigned char *)v4 + 1680) = self->_wifiIsCaptive;
    *((_DWORD *)v4 + 421) |= 0x2000000u;
  }
  if (self->_wifiMcsIndex)
  {
    objc_msgSend(v8, "setWifiMcsIndex:");
    id v4 = v8;
  }
  if (self->_wifiNoise)
  {
    objc_msgSend(v8, "setWifiNoise:");
    id v4 = v8;
  }
  if (self->_wifiNumberOfSpatialStreams)
  {
    objc_msgSend(v8, "setWifiNumberOfSpatialStreams:");
    id v4 = v8;
  }
  if (self->_wifiOpMode)
  {
    objc_msgSend(v8, "setWifiOpMode:");
    id v4 = v8;
  }
  if (self->_wifiPhyMode)
  {
    objc_msgSend(v8, "setWifiPhyMode:");
    id v4 = v8;
  }
  if (self->_wifiRssi)
  {
    objc_msgSend(v8, "setWifiRssi:");
    id v4 = v8;
  }
  if (self->_wifiSecurity)
  {
    objc_msgSend(v8, "setWifiSecurity:");
    id v4 = v8;
  }
  if (self->_wifiTxRate)
  {
    objc_msgSend(v8, "setWifiTxRate:");
    id v4 = v8;
  }
  if (self->_wrmChannelType)
  {
    objc_msgSend(v8, "setWrmChannelType:");
    id v4 = v8;
  }
  if (self->_cellularCellid)
  {
    objc_msgSend(v8, "setCellularCellid:");
    id v4 = v8;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *((unsigned char *)v4 + 1656) = self->_acceptablePerformanceResult;
    *((_DWORD *)v4 + 421) |= 2u;
  }
  if (self->_networkQualityResponsiveness)
  {
    objc_msgSend(v8, "setNetworkQualityResponsiveness:");
    id v4 = v8;
  }
  if (self->_cellularAggregatedDLBW)
  {
    objc_msgSend(v8, "setCellularAggregatedDLBW:");
    id v4 = v8;
  }
  if (self->_cellularAggregatedULBW)
  {
    objc_msgSend(v8, "setCellularAggregatedULBW:");
    id v4 = v8;
  }
  if (self->_cellularIssa)
  {
    objc_msgSend(v8, "setCellularIssa:");
    id v4 = v8;
  }
  if (self->_cellularLac)
  {
    objc_msgSend(v8, "setCellularLac:");
    id v4 = v8;
  }
  if (self->_cellularLteNrConfiguredBw)
  {
    objc_msgSend(v8, "setCellularLteNrConfiguredBw:");
    id v4 = v8;
  }
  if (self->_cellularMaxDlMod)
  {
    objc_msgSend(v8, "setCellularMaxDlMod:");
    id v4 = v8;
  }
  if (self->_cellularMaxNwMimoLyr)
  {
    objc_msgSend(v8, "setCellularMaxNwMimoLyr:");
    id v4 = v8;
  }
  if (self->_cellularMaxSchdMimoLyr)
  {
    objc_msgSend(v8, "setCellularMaxSchdMimoLyr:");
    id v4 = v8;
  }
  if (self->_cellularMaxUeRank)
  {
    objc_msgSend(v8, "setCellularMaxUeRank:");
    id v4 = v8;
  }
  if (self->_cellularMaxUlMod)
  {
    objc_msgSend(v8, "setCellularMaxUlMod:");
    id v4 = v8;
  }
  if (self->_cellularNrSinr)
  {
    objc_msgSend(v8, "setCellularNrSinr:");
    id v4 = v8;
  }
  if (self->_cellularNrarfcn)
  {
    objc_msgSend(v8, "setCellularNrarfcn:");
    id v4 = v8;
  }
  if (self->_cellularRadioFrequency)
  {
    objc_msgSend(v8, "setCellularRadioFrequency:");
    id v4 = v8;
  }
  if (self->_cellularTotalDlMimoLayers)
  {
    objc_msgSend(v8, "setCellularTotalDlMimoLayers:");
    id v4 = v8;
  }
  if (self->_cellularTotalNumCcs)
  {
    objc_msgSend(v8, "setCellularTotalNumCcs:");
    id v4 = v8;
  }
  if (self->_downloadStartRadioFrequency)
  {
    objc_msgSend(v8, "setDownloadStartRadioFrequency:");
    id v4 = v8;
  }
  if (self->_downloadEndRadioFrequency)
  {
    objc_msgSend(v8, "setDownloadEndRadioFrequency:");
    id v4 = v8;
  }
  if (self->_networkPrimaryIpv6InterfaceName)
  {
    objc_msgSend(v8, "setNetworkPrimaryIpv6InterfaceName:");
    id v4 = v8;
  }
  if (self->_networkPrimaryIpv6ServiceName)
  {
    objc_msgSend(v8, "setNetworkPrimaryIpv6ServiceName:");
    id v4 = v8;
  }
  if (self->_uploadStartRadioFrequency)
  {
    objc_msgSend(v8, "setUploadStartRadioFrequency:");
    id v4 = v8;
  }
  if (self->_uploadEndRadioFrequency)
  {
    objc_msgSend(v8, "setUploadEndRadioFrequency:");
    id v4 = v8;
  }
  if (self->_downloadError)
  {
    objc_msgSend(v8, "setDownloadError:");
    id v4 = v8;
  }
  if (self->_networkQualityError)
  {
    objc_msgSend(v8, "setNetworkQualityError:");
    id v4 = v8;
  }
  if (self->_networkQualityDownloadSpeed)
  {
    objc_msgSend(v8, "setNetworkQualityDownloadSpeed:");
    id v4 = v8;
  }
  if (self->_networkQualityUploadSpeed)
  {
    objc_msgSend(v8, "setNetworkQualityUploadSpeed:");
    id v4 = v8;
  }
  if (self->_networkQualityRating)
  {
    objc_msgSend(v8, "setNetworkQualityRating:");
    id v4 = v8;
  }
  if (self->_vpnConnectionState)
  {
    objc_msgSend(v8, "setVpnConnectionState:");
    id v4 = v8;
  }
  if (self->_uploadError)
  {
    objc_msgSend(v8, "setUploadError:");
    id v4 = v8;
  }
  if (self->_uploadErrorDomain)
  {
    objc_msgSend(v8, "setUploadErrorDomain:");
    id v4 = v8;
  }
  if (self->_uploadErrorCode)
  {
    objc_msgSend(v8, "setUploadErrorCode:");
    id v4 = v8;
  }
  if (self->_downloadErrorDomain)
  {
    objc_msgSend(v8, "setDownloadErrorDomain:");
    id v4 = v8;
  }
  if (self->_downloadErrorCode)
  {
    objc_msgSend(v8, "setDownloadErrorCode:");
    id v4 = v8;
  }
  if (self->_pingError)
  {
    objc_msgSend(v8, "setPingError:");
    id v4 = v8;
  }
  if (self->_pingErrorDomain)
  {
    objc_msgSend(v8, "setPingErrorDomain:");
    id v4 = v8;
  }
  if (self->_pingErrorCode)
  {
    objc_msgSend(v8, "setPingErrorCode:");
    id v4 = v8;
  }
  if (self->_networkQualityErrorDomain)
  {
    objc_msgSend(v8, "setNetworkQualityErrorDomain:");
    id v4 = v8;
  }
  if (self->_networkQualityErrorCode)
  {
    objc_msgSend(v8, "setNetworkQualityErrorCode:");
    id v4 = v8;
  }
  if (self->_cellularRnMobileCountryCode)
  {
    objc_msgSend(v8, "setCellularRnMobileCountryCode:");
    id v4 = v8;
  }
  if (self->_cellularRnMobileNetworkCode)
  {
    objc_msgSend(v8, "setCellularRnMobileNetworkCode:");
    id v4 = v8;
  }
  if (*((unsigned char *)&self->_has + 1))
  {
    *((unsigned char *)v4 + 1663) = self->_cellularDataIsEnabled;
    *((_DWORD *)v4 + 421) |= 0x100u;
  }
  if (self->_downloadStartCellularEstimate)
  {
    objc_msgSend(v8, "setDownloadStartCellularEstimate:");
    id v4 = v8;
  }
  if (self->_downloadEndCellularEstimate)
  {
    objc_msgSend(v8, "setDownloadEndCellularEstimate:");
    id v4 = v8;
  }
  if (self->_downloadMaxCellularEstimate)
  {
    objc_msgSend(v8, "setDownloadMaxCellularEstimate:");
    id v4 = v8;
  }
  if (self->_uploadStartCellularEstimate)
  {
    objc_msgSend(v8, "setUploadStartCellularEstimate:");
    id v4 = v8;
  }
  if (self->_uploadEndCellularEstimate)
  {
    objc_msgSend(v8, "setUploadEndCellularEstimate:");
    id v4 = v8;
  }
  if (self->_uploadMaxCellularEstimate)
  {
    objc_msgSend(v8, "setUploadMaxCellularEstimate:");
    id v4 = v8;
  }
  if (self->_downloadResponsiveness)
  {
    objc_msgSend(v8, "setDownloadResponsiveness:");
    id v4 = v8;
  }
  if (self->_downloadResponsivenessConfidence)
  {
    objc_msgSend(v8, "setDownloadResponsivenessConfidence:");
    id v4 = v8;
  }
  if (self->_downloadResponsivenessRating)
  {
    objc_msgSend(v8, "setDownloadResponsivenessRating:");
    id v4 = v8;
  }
  if (self->_downloadSpeedConfidence)
  {
    objc_msgSend(v8, "setDownloadSpeedConfidence:");
    id v4 = v8;
  }
  if (self->_downloadSpeedRating)
  {
    objc_msgSend(v8, "setDownloadSpeedRating:");
    id v4 = v8;
  }
  if (self->_uploadResponsiveness)
  {
    objc_msgSend(v8, "setUploadResponsiveness:");
    id v4 = v8;
  }
  if (self->_uploadResponsivenessConfidence)
  {
    objc_msgSend(v8, "setUploadResponsivenessConfidence:");
    id v4 = v8;
  }
  if (self->_uploadResponsivenessRating)
  {
    objc_msgSend(v8, "setUploadResponsivenessRating:");
    id v4 = v8;
  }
  if (self->_uploadSpeedConfidence)
  {
    objc_msgSend(v8, "setUploadSpeedConfidence:");
    id v4 = v8;
  }
  if (self->_uploadSpeedRating)
  {
    objc_msgSend(v8, "setUploadSpeedRating:");
    id v4 = v8;
  }
  if (self->_wifiChannelBand)
  {
    objc_msgSend(v8, "setWifiChannelBand:");
    id v4 = v8;
  }
  if (self->_wifiChannelWidth)
  {
    objc_msgSend(v8, "setWifiChannelWidth:");
    id v4 = v8;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  if (*(unsigned char *)&self->_has)
  {
    *(void *)(v5 + 8) = self->_timestamp;
    *(_DWORD *)(v5 + 1684) |= 1u;
  }
  uint64_t v7 = [(NSString *)self->_awdlElectionParameters copyWithZone:a3];
  id v8 = *(void **)(v6 + 16);
  *(void *)(v6 + 16) = v7;

  uint64_t v9 = [(NSString *)self->_awdlMasterChannel copyWithZone:a3];
  v10 = *(void **)(v6 + 24);
  *(void *)(v6 + 24) = v9;

  uint64_t v11 = [(NSString *)self->_awdlOpMode copyWithZone:a3];
  v12 = *(void **)(v6 + 32);
  *(void *)(v6 + 32) = v11;

  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    *(unsigned char *)(v6 + 1657) = self->_awdlPowerState;
    *(_DWORD *)(v6 + 1684) |= 4u;
  }
  uint64_t v13 = [(NSString *)self->_awdlSchedule copyWithZone:a3];
  v14 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v13;

  uint64_t v15 = [(NSString *)self->_awdlSecondaryMasterChannel copyWithZone:a3];
  $0FF3A8E67B3D88A75EBF7BE240CB1B75 v16 = *(void **)(v6 + 48);
  *(void *)(v6 + 48) = v15;

  uint64_t v17 = [(NSString *)self->_awdlSyncChannelSequence copyWithZone:a3];
  v18 = *(void **)(v6 + 56);
  *(void *)(v6 + 56) = v17;

  uint64_t v19 = [(NSString *)self->_awdlSyncState copyWithZone:a3];
  v20 = *(void **)(v6 + 64);
  *(void *)(v6 + 64) = v19;

  uint64_t v21 = [(NSString *)self->_btConnectedDevicesCount copyWithZone:a3];
  v22 = *(void **)(v6 + 72);
  *(void *)(v6 + 72) = v21;

  $0FF3A8E67B3D88A75EBF7BE240CB1B75 has = self->_has;
  if ((*(unsigned char *)&has & 8) != 0)
  {
    *(unsigned char *)(v6 + 1658) = self->_btIsConnectable;
    *(_DWORD *)(v6 + 1684) |= 8u;
    $0FF3A8E67B3D88A75EBF7BE240CB1B75 has = self->_has;
    if ((*(unsigned char *)&has & 0x10) == 0)
    {
LABEL_7:
      if ((*(unsigned char *)&has & 0x20) == 0) {
        goto LABEL_8;
      }
      goto LABEL_43;
    }
  }
  else if ((*(unsigned char *)&has & 0x10) == 0)
  {
    goto LABEL_7;
  }
  *(unsigned char *)(v6 + 1659) = self->_btIsDiscoverable;
  *(_DWORD *)(v6 + 1684) |= 0x10u;
  $0FF3A8E67B3D88A75EBF7BE240CB1B75 has = self->_has;
  if ((*(unsigned char *)&has & 0x20) == 0)
  {
LABEL_8:
    if ((*(unsigned char *)&has & 0x40) == 0) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
LABEL_43:
  *(unsigned char *)(v6 + 1660) = self->_btIsPowerOn;
  *(_DWORD *)(v6 + 1684) |= 0x20u;
  if ((*(_DWORD *)&self->_has & 0x40) != 0)
  {
LABEL_9:
    *(unsigned char *)(v6 + 1661) = self->_btIsScanning;
    *(_DWORD *)(v6 + 1684) |= 0x40u;
  }
LABEL_10:
  uint64_t v24 = [(NSString *)self->_callingClient copyWithZone:a3];
  v25 = *(void **)(v6 + 80);
  *(void *)(v6 + 80) = v24;

  uint64_t v26 = [(NSString *)self->_cellularActiveContexts copyWithZone:a3];
  v27 = *(void **)(v6 + 88);
  *(void *)(v6 + 88) = v26;

  if ((*(unsigned char *)&self->_has & 0x80) != 0)
  {
    *(unsigned char *)(v6 + 1662) = self->_cellularAllowsVoip;
    *(_DWORD *)(v6 + 1684) |= 0x80u;
  }
  uint64_t v28 = [(NSString *)self->_cellularAttached copyWithZone:a3];
  v29 = *(void **)(v6 + 112);
  *(void *)(v6 + 112) = v28;

  uint64_t v30 = [(NSString *)self->_cellularBandinfo copyWithZone:a3];
  v31 = *(void **)(v6 + 120);
  *(void *)(v6 + 120) = v30;

  uint64_t v32 = [(NSString *)self->_cellularBandwidth copyWithZone:a3];
  v33 = *(void **)(v6 + 128);
  *(void *)(v6 + 128) = v32;

  uint64_t v34 = [(NSString *)self->_cellularCarrierName copyWithZone:a3];
  v35 = *(void **)(v6 + 136);
  *(void *)(v6 + 136) = v34;

  uint64_t v36 = [(NSString *)self->_cellularDataBearerSoMask copyWithZone:a3];
  v37 = *(void **)(v6 + 152);
  *(void *)(v6 + 152) = v36;

  uint64_t v38 = [(NSString *)self->_cellularDataBearerTechnology copyWithZone:a3];
  v39 = *(void **)(v6 + 160);
  *(void *)(v6 + 160) = v38;

  uint64_t v40 = [(NSString *)self->_cellularDataPlanSignalingReductionOverride copyWithZone:a3];
  v41 = *(void **)(v6 + 168);
  *(void *)(v6 + 168) = v40;

  uint64_t v42 = [(NSString *)self->_cellularDataPossible copyWithZone:a3];
  v43 = *(void **)(v6 + 176);
  *(void *)(v6 + 176) = v42;

  uint64_t v44 = [(NSString *)self->_cellularInHomeCountry copyWithZone:a3];
  v45 = *(void **)(v6 + 184);
  *(void *)(v6 + 184) = v44;

  uint64_t v46 = [(NSString *)self->_cellularIndicator copyWithZone:a3];
  v47 = *(void **)(v6 + 192);
  *(void *)(v6 + 192) = v46;

  uint64_t v48 = [(NSString *)self->_cellularIndicatorOverride copyWithZone:a3];
  v49 = *(void **)(v6 + 200);
  *(void *)(v6 + 200) = v48;

  uint64_t v50 = [(NSString *)self->_cellularIsoCountryCode copyWithZone:a3];
  v51 = *(void **)(v6 + 208);
  *(void *)(v6 + 208) = v50;

  uint64_t v52 = [(NSString *)self->_cellularLqm copyWithZone:a3];
  v53 = *(void **)(v6 + 232);
  *(void *)(v6 + 232) = v52;

  uint64_t v54 = [(NSString *)self->_cellularLteMaxScheduledLayers copyWithZone:a3];
  v55 = *(void **)(v6 + 240);
  *(void *)(v6 + 240) = v54;

  uint64_t v56 = [(NSString *)self->_cellularMobileCountryCode copyWithZone:a3];
  v57 = *(void **)(v6 + 296);
  *(void *)(v6 + 296) = v56;

  uint64_t v58 = [(NSString *)self->_cellularMobileNetworkCode copyWithZone:a3];
  v59 = *(void **)(v6 + 304);
  *(void *)(v6 + 304) = v58;

  uint64_t v60 = [(NSString *)self->_cellularNewRadioCoverage copyWithZone:a3];
  v61 = *(void **)(v6 + 312);
  *(void *)(v6 + 312) = v60;

  uint64_t v62 = [(NSString *)self->_cellularNewRadioDataBearer copyWithZone:a3];
  v63 = *(void **)(v6 + 320);
  *(void *)(v6 + 320) = v62;

  uint64_t v64 = [(NSString *)self->_cellularNewRadioMmwaveDataBearer copyWithZone:a3];
  v65 = *(void **)(v6 + 328);
  *(void *)(v6 + 328) = v64;

  uint64_t v66 = [(NSString *)self->_cellularNewRadioNsaCoverage copyWithZone:a3];
  v67 = *(void **)(v6 + 336);
  *(void *)(v6 + 336) = v66;

  uint64_t v68 = [(NSString *)self->_cellularNewRadioNsaDataBearer copyWithZone:a3];
  v69 = *(void **)(v6 + 344);
  *(void *)(v6 + 344) = v68;

  uint64_t v70 = [(NSString *)self->_cellularNewRadioSaCoverage copyWithZone:a3];
  v71 = *(void **)(v6 + 352);
  *(void *)(v6 + 352) = v70;

  uint64_t v72 = [(NSString *)self->_cellularNewRadioSaDataBearer copyWithZone:a3];
  $0FF3A8E67B3D88A75EBF7BE240CB1B75 v73 = *(void **)(v6 + 360);
  *(void *)(v6 + 360) = v72;

  uint64_t v74 = [(NSString *)self->_cellularNewRadioSub6DataBearer copyWithZone:a3];
  v75 = *(void **)(v6 + 368);
  *(void *)(v6 + 368) = v74;

  uint64_t v76 = [(NSString *)self->_cellularNrConfiguredBw copyWithZone:a3];
  v77 = *(void **)(v6 + 376);
  *(void *)(v6 + 376) = v76;

  uint64_t v78 = [(NSString *)self->_cellularNrLayers copyWithZone:a3];
  v79 = *(void **)(v6 + 384);
  *(void *)(v6 + 384) = v78;

  uint64_t v80 = [(NSString *)self->_cellularNrModulation copyWithZone:a3];
  v81 = *(void **)(v6 + 392);
  *(void *)(v6 + 392) = v80;

  uint64_t v82 = [(NSString *)self->_cellularNrRsrp copyWithZone:a3];
  v83 = *(void **)(v6 + 400);
  *(void *)(v6 + 400) = v82;

  uint64_t v84 = [(NSString *)self->_cellularNrRsrq copyWithZone:a3];
  v85 = *(void **)(v6 + 408);
  *(void *)(v6 + 408) = v84;

  uint64_t v86 = [(NSString *)self->_cellularNrSnr copyWithZone:a3];
  v87 = *(void **)(v6 + 424);
  *(void *)(v6 + 424) = v86;

  uint64_t v88 = [(NSString *)self->_cellularPid copyWithZone:a3];
  v89 = *(void **)(v6 + 440);
  *(void *)(v6 + 440) = v88;

  uint64_t v90 = [(NSString *)self->_cellularRadioAccessTechnology copyWithZone:a3];
  v91 = *(void **)(v6 + 448);
  *(void *)(v6 + 448) = v90;

  uint64_t v92 = [(NSString *)self->_cellularRadioAccessTechnologyCtDataStatus copyWithZone:a3];
  v93 = *(void **)(v6 + 456);
  *(void *)(v6 + 456) = v92;

  uint64_t v94 = [(NSString *)self->_cellularRoamAllowed copyWithZone:a3];
  v95 = *(void **)(v6 + 488);
  *(void *)(v6 + 488) = v94;

  uint64_t v96 = [(NSString *)self->_cellularRsrp copyWithZone:a3];
  v97 = *(void **)(v6 + 496);
  *(void *)(v6 + 496) = v96;

  uint64_t v98 = [(NSString *)self->_cellularSnr copyWithZone:a3];
  v99 = *(void **)(v6 + 504);
  *(void *)(v6 + 504) = v98;

  uint64_t v100 = [(NSString *)self->_cellularTac copyWithZone:a3];
  v101 = *(void **)(v6 + 512);
  *(void *)(v6 + 512) = v100;

  uint64_t v102 = [(NSString *)self->_cellularTotalActiveContexts copyWithZone:a3];
  v103 = *(void **)(v6 + 520);
  *(void *)(v6 + 520) = v102;

  uint64_t v104 = [(NSString *)self->_cellularTotalBw copyWithZone:a3];
  v105 = *(void **)(v6 + 528);
  *(void *)(v6 + 528) = v104;

  uint64_t v106 = [(NSString *)self->_cellularTotalCcs copyWithZone:a3];
  v107 = *(void **)(v6 + 536);
  *(void *)(v6 + 536) = v106;

  uint64_t v108 = [(NSString *)self->_cellularTotalLayers copyWithZone:a3];
  v109 = *(void **)(v6 + 552);
  *(void *)(v6 + 552) = v108;

  uint64_t v110 = [(NSString *)self->_cellularUarfcn copyWithZone:a3];
  v111 = *(void **)(v6 + 568);
  *(void *)(v6 + 568) = v110;

  uint64_t v112 = [(NSString *)self->_downloadCdnPop copyWithZone:a3];
  v113 = *(void **)(v6 + 576);
  *(void *)(v6 + 576) = v112;

  uint64_t v114 = [(NSString *)self->_downloadCdnUuid copyWithZone:a3];
  v115 = *(void **)(v6 + 584);
  *(void *)(v6 + 584) = v114;

  uint64_t v116 = [(NSString *)self->_downloadConnectionTime copyWithZone:a3];
  v117 = *(void **)(v6 + 592);
  *(void *)(v6 + 592) = v116;

  uint64_t v118 = [(NSString *)self->_downloadDomainLookupTime copyWithZone:a3];
  v119 = *(void **)(v6 + 600);
  *(void *)(v6 + 600) = v118;

  uint64_t v120 = [(NSString *)self->_downloadEndDataBearerTechnology copyWithZone:a3];
  v121 = *(void **)(v6 + 616);
  *(void *)(v6 + 616) = v120;

  uint64_t v122 = [(NSString *)self->_downloadEndPrimaryIpv4Interface copyWithZone:a3];
  v123 = *(void **)(v6 + 624);
  *(void *)(v6 + 624) = v122;

  uint64_t v124 = [(NSString *)self->_downloadEndRat copyWithZone:a3];
  v125 = *(void **)(v6 + 640);
  *(void *)(v6 + 640) = v124;

  uint64_t v126 = [(NSString *)self->_downloadFileSize copyWithZone:a3];
  v127 = *(void **)(v6 + 672);
  *(void *)(v6 + 672) = v126;

  uint64_t v128 = [(NSString *)self->_downloadInterfaceName copyWithZone:a3];
  v129 = *(void **)(v6 + 680);
  *(void *)(v6 + 680) = v128;

  uint64_t v130 = [(NSString *)self->_downloadInterfaceServiceName copyWithZone:a3];
  v131 = *(void **)(v6 + 688);
  *(void *)(v6 + 688) = v130;

  $0FF3A8E67B3D88A75EBF7BE240CB1B75 v132 = self->_has;
  if ((*(_WORD *)&v132 & 0x200) != 0)
  {
    *(unsigned char *)(v6 + 1664) = self->_downloadIsCellular;
    *(_DWORD *)(v6 + 1684) |= 0x200u;
    $0FF3A8E67B3D88A75EBF7BE240CB1B75 v132 = self->_has;
    if ((*(_WORD *)&v132 & 0x400) == 0)
    {
LABEL_14:
      if ((*(_WORD *)&v132 & 0x800) == 0) {
        goto LABEL_15;
      }
      goto LABEL_47;
    }
  }
  else if ((*(_WORD *)&v132 & 0x400) == 0)
  {
    goto LABEL_14;
  }
  *(unsigned char *)(v6 + 1665) = self->_downloadIsConstrained;
  *(_DWORD *)(v6 + 1684) |= 0x400u;
  $0FF3A8E67B3D88A75EBF7BE240CB1B75 v132 = self->_has;
  if ((*(_WORD *)&v132 & 0x800) == 0)
  {
LABEL_15:
    if ((*(_WORD *)&v132 & 0x1000) == 0) {
      goto LABEL_16;
    }
    goto LABEL_48;
  }
LABEL_47:
  *(unsigned char *)(v6 + 1666) = self->_downloadIsExpensive;
  *(_DWORD *)(v6 + 1684) |= 0x800u;
  $0FF3A8E67B3D88A75EBF7BE240CB1B75 v132 = self->_has;
  if ((*(_WORD *)&v132 & 0x1000) == 0)
  {
LABEL_16:
    if ((*(_WORD *)&v132 & 0x2000) == 0) {
      goto LABEL_17;
    }
    goto LABEL_49;
  }
LABEL_48:
  *(unsigned char *)(v6 + 1667) = self->_downloadIsMultipath;
  *(_DWORD *)(v6 + 1684) |= 0x1000u;
  $0FF3A8E67B3D88A75EBF7BE240CB1B75 v132 = self->_has;
  if ((*(_WORD *)&v132 & 0x2000) == 0)
  {
LABEL_17:
    if ((*(_WORD *)&v132 & 0x4000) == 0) {
      goto LABEL_19;
    }
    goto LABEL_18;
  }
LABEL_49:
  *(unsigned char *)(v6 + 1668) = self->_downloadIsProxyConnection;
  *(_DWORD *)(v6 + 1684) |= 0x2000u;
  if ((*(_DWORD *)&self->_has & 0x4000) != 0)
  {
LABEL_18:
    *(unsigned char *)(v6 + 1669) = self->_downloadIsReusedConnection;
    *(_DWORD *)(v6 + 1684) |= 0x4000u;
  }
LABEL_19:
  uint64_t v133 = [(NSString *)self->_downloadMaxSpeedObserved copyWithZone:a3];
  v134 = *(void **)(v6 + 704);
  *(void *)(v6 + 704) = v133;

  uint64_t v135 = [(NSString *)self->_downloadNumberOfStreams copyWithZone:a3];
  v136 = *(void **)(v6 + 712);
  *(void *)(v6 + 712) = v135;

  uint64_t v137 = [(NSString *)self->_downloadProtocolName copyWithZone:a3];
  v138 = *(void **)(v6 + 720);
  *(void *)(v6 + 720) = v137;

  uint64_t v139 = [(NSString *)self->_downloadRemoteAddress copyWithZone:a3];
  v140 = *(void **)(v6 + 728);
  *(void *)(v6 + 728) = v139;

  uint64_t v141 = [(NSString *)self->_downloadRemotePort copyWithZone:a3];
  v142 = *(void **)(v6 + 736);
  *(void *)(v6 + 736) = v141;

  uint64_t v143 = [(NSString *)self->_downloadRequestTime copyWithZone:a3];
  v144 = *(void **)(v6 + 744);
  *(void *)(v6 + 744) = v143;

  uint64_t v145 = [(NSString *)self->_downloadRequestToResponseTime copyWithZone:a3];
  v146 = *(void **)(v6 + 752);
  *(void *)(v6 + 752) = v145;

  uint64_t v147 = [(NSString *)self->_downloadResponseTime copyWithZone:a3];
  v148 = *(void **)(v6 + 760);
  *(void *)(v6 + 760) = v147;

  uint64_t v149 = [(NSString *)self->_downloadSecureConnectionTime copyWithZone:a3];
  v150 = *(void **)(v6 + 792);
  *(void *)(v6 + 792) = v149;

  uint64_t v151 = [(NSString *)self->_downloadServer copyWithZone:a3];
  v152 = *(void **)(v6 + 800);
  *(void *)(v6 + 800) = v151;

  uint64_t v153 = [(NSString *)self->_downloadSpeed copyWithZone:a3];
  v154 = *(void **)(v6 + 808);
  *(void *)(v6 + 808) = v153;

  uint64_t v155 = [(NSString *)self->_downloadStableSpeed copyWithZone:a3];
  v156 = *(void **)(v6 + 832);
  *(void *)(v6 + 832) = v155;

  uint64_t v157 = [(NSString *)self->_downloadStartDataBearerTechnology copyWithZone:a3];
  v158 = *(void **)(v6 + 848);
  *(void *)(v6 + 848) = v157;

  uint64_t v159 = [(NSString *)self->_downloadStartPrimaryIpv4Interface copyWithZone:a3];
  v160 = *(void **)(v6 + 856);
  *(void *)(v6 + 856) = v159;

  uint64_t v161 = [(NSString *)self->_downloadStartRat copyWithZone:a3];
  v162 = *(void **)(v6 + 872);
  *(void *)(v6 + 872) = v161;

  if ((*((unsigned char *)&self->_has + 1) & 0x80) != 0)
  {
    *(unsigned char *)(v6 + 1670) = self->_networkIsAppleReachable;
    *(_DWORD *)(v6 + 1684) |= 0x8000u;
  }
  uint64_t v163 = [(NSString *)self->_networkPrimaryIpv4InterfaceName copyWithZone:a3];
  v164 = *(void **)(v6 + 880);
  *(void *)(v6 + 880) = v163;

  uint64_t v165 = [(NSString *)self->_networkPrimaryIpv4ServiceName copyWithZone:a3];
  v166 = *(void **)(v6 + 888);
  *(void *)(v6 + 888) = v165;

  uint64_t v167 = [(NSString *)self->_nptkitFrameworkVersion copyWithZone:a3];
  v168 = *(void **)(v6 + 968);
  *(void *)(v6 + 968) = v167;

  uint64_t v169 = [(NSString *)self->_performanceTestStartTime copyWithZone:a3];
  v170 = *(void **)(v6 + 976);
  *(void *)(v6 + 976) = v169;

  uint64_t v171 = [(NSString *)self->_pingAddress copyWithZone:a3];
  v172 = *(void **)(v6 + 984);
  *(void *)(v6 + 984) = v171;

  uint64_t v173 = [(NSString *)self->_pingLossPercent copyWithZone:a3];
  v174 = *(void **)(v6 + 1016);
  *(void *)(v6 + 1016) = v173;

  uint64_t v175 = [(NSString *)self->_pingMaxLatency copyWithZone:a3];
  v176 = *(void **)(v6 + 1024);
  *(void *)(v6 + 1024) = v175;

  uint64_t v177 = [(NSString *)self->_pingMeanLatency copyWithZone:a3];
  v178 = *(void **)(v6 + 1032);
  *(void *)(v6 + 1032) = v177;

  uint64_t v179 = [(NSString *)self->_pingMinLatency copyWithZone:a3];
  v180 = *(void **)(v6 + 1040);
  *(void *)(v6 + 1040) = v179;

  uint64_t v181 = [(NSString *)self->_pingStandardDeviation copyWithZone:a3];
  v182 = *(void **)(v6 + 1048);
  *(void *)(v6 + 1048) = v181;

  uint64_t v183 = [(NSString *)self->_powerBatteryWarningLevel copyWithZone:a3];
  v184 = *(void **)(v6 + 1056);
  *(void *)(v6 + 1056) = v183;

  uint64_t v185 = [(NSString *)self->_powerSourceType copyWithZone:a3];
  v186 = *(void **)(v6 + 1064);
  *(void *)(v6 + 1064) = v185;

  uint64_t v187 = [(NSString *)self->_powerStateCaps copyWithZone:a3];
  v188 = *(void **)(v6 + 1072);
  *(void *)(v6 + 1072) = v187;

  uint64_t v189 = [(NSString *)self->_systemActiveProcessorCount copyWithZone:a3];
  v190 = *(void **)(v6 + 1080);
  *(void *)(v6 + 1080) = v189;

  uint64_t v191 = [(NSString *)self->_systemBatteryLevel copyWithZone:a3];
  v192 = *(void **)(v6 + 1088);
  *(void *)(v6 + 1088) = v191;

  uint64_t v193 = [(NSString *)self->_systemBatteryState copyWithZone:a3];
  v194 = *(void **)(v6 + 1096);
  *(void *)(v6 + 1096) = v193;

  uint64_t v195 = [(NSString *)self->_systemDeviceClass copyWithZone:a3];
  v196 = *(void **)(v6 + 1104);
  *(void *)(v6 + 1104) = v195;

  uint64_t v197 = [(NSString *)self->_systemDeviceModel copyWithZone:a3];
  v198 = *(void **)(v6 + 1112);
  *(void *)(v6 + 1112) = v197;

  if (*((unsigned char *)&self->_has + 2))
  {
    *(unsigned char *)(v6 + 1671) = self->_systemLowPowerModeEnabled;
    *(_DWORD *)(v6 + 1684) |= 0x10000u;
  }
  uint64_t v199 = [(NSString *)self->_systemName copyWithZone:a3];
  v200 = *(void **)(v6 + 1120);
  *(void *)(v6 + 1120) = v199;

  uint64_t v201 = [(NSString *)self->_systemOsVariant copyWithZone:a3];
  v202 = *(void **)(v6 + 1128);
  *(void *)(v6 + 1128) = v201;

  uint64_t v203 = [(NSString *)self->_systemPhysicalMemory copyWithZone:a3];
  v204 = *(void **)(v6 + 1136);
  *(void *)(v6 + 1136) = v203;

  if ((*((unsigned char *)&self->_has + 2) & 2) != 0)
  {
    *(unsigned char *)(v6 + 1672) = self->_systemPowersourceConnected;
    *(_DWORD *)(v6 + 1684) |= 0x20000u;
  }
  uint64_t v205 = [(NSString *)self->_systemProcessorCount copyWithZone:a3];
  v206 = *(void **)(v6 + 1144);
  *(void *)(v6 + 1144) = v205;

  uint64_t v207 = [(NSString *)self->_systemVersion copyWithZone:a3];
  v208 = *(void **)(v6 + 1152);
  *(void *)(v6 + 1152) = v207;

  uint64_t v209 = [(NSString *)self->_uploadCdnPop copyWithZone:a3];
  v210 = *(void **)(v6 + 1160);
  *(void *)(v6 + 1160) = v209;

  uint64_t v211 = [(NSString *)self->_uploadCdnUuid copyWithZone:a3];
  v212 = *(void **)(v6 + 1168);
  *(void *)(v6 + 1168) = v211;

  uint64_t v213 = [(NSString *)self->_uploadConnectionTime copyWithZone:a3];
  v214 = *(void **)(v6 + 1176);
  *(void *)(v6 + 1176) = v213;

  uint64_t v215 = [(NSString *)self->_uploadDomainLookupTime copyWithZone:a3];
  v216 = *(void **)(v6 + 1184);
  *(void *)(v6 + 1184) = v215;

  uint64_t v217 = [(NSString *)self->_uploadEndDataBearerTechnology copyWithZone:a3];
  v218 = *(void **)(v6 + 1200);
  *(void *)(v6 + 1200) = v217;

  uint64_t v219 = [(NSString *)self->_uploadEndPrimaryIpv4Interface copyWithZone:a3];
  v220 = *(void **)(v6 + 1208);
  *(void *)(v6 + 1208) = v219;

  uint64_t v221 = [(NSString *)self->_uploadEndRat copyWithZone:a3];
  v222 = *(void **)(v6 + 1224);
  *(void *)(v6 + 1224) = v221;

  uint64_t v223 = [(NSString *)self->_uploadFileSize copyWithZone:a3];
  v224 = *(void **)(v6 + 1256);
  *(void *)(v6 + 1256) = v223;

  uint64_t v225 = [(NSString *)self->_uploadInterfaceName copyWithZone:a3];
  id v226 = *(void **)(v6 + 1264);
  *(void *)(v6 + 1264) = v225;

  uint64_t v227 = [(NSString *)self->_uploadInterfaceServiceName copyWithZone:a3];
  v228 = *(void **)(v6 + 1272);
  *(void *)(v6 + 1272) = v227;

  $0FF3A8E67B3D88A75EBF7BE240CB1B75 v229 = self->_has;
  if ((*(_DWORD *)&v229 & 0x40000) != 0)
  {
    *(unsigned char *)(v6 + 1673) = self->_uploadIsCellular;
    *(_DWORD *)(v6 + 1684) |= 0x40000u;
    $0FF3A8E67B3D88A75EBF7BE240CB1B75 v229 = self->_has;
    if ((*(_DWORD *)&v229 & 0x80000) == 0)
    {
LABEL_27:
      if ((*(_DWORD *)&v229 & 0x100000) == 0) {
        goto LABEL_28;
      }
      goto LABEL_53;
    }
  }
  else if ((*(_DWORD *)&v229 & 0x80000) == 0)
  {
    goto LABEL_27;
  }
  *(unsigned char *)(v6 + 1674) = self->_uploadIsConstrained;
  *(_DWORD *)(v6 + 1684) |= 0x80000u;
  $0FF3A8E67B3D88A75EBF7BE240CB1B75 v229 = self->_has;
  if ((*(_DWORD *)&v229 & 0x100000) == 0)
  {
LABEL_28:
    if ((*(_DWORD *)&v229 & 0x200000) == 0) {
      goto LABEL_29;
    }
    goto LABEL_54;
  }
LABEL_53:
  *(unsigned char *)(v6 + 1675) = self->_uploadIsExpensive;
  *(_DWORD *)(v6 + 1684) |= 0x100000u;
  $0FF3A8E67B3D88A75EBF7BE240CB1B75 v229 = self->_has;
  if ((*(_DWORD *)&v229 & 0x200000) == 0)
  {
LABEL_29:
    if ((*(_DWORD *)&v229 & 0x400000) == 0) {
      goto LABEL_30;
    }
    goto LABEL_55;
  }
LABEL_54:
  *(unsigned char *)(v6 + 1676) = self->_uploadIsMultipath;
  *(_DWORD *)(v6 + 1684) |= 0x200000u;
  $0FF3A8E67B3D88A75EBF7BE240CB1B75 v229 = self->_has;
  if ((*(_DWORD *)&v229 & 0x400000) == 0)
  {
LABEL_30:
    if ((*(_DWORD *)&v229 & 0x800000) == 0) {
      goto LABEL_32;
    }
    goto LABEL_31;
  }
LABEL_55:
  *(unsigned char *)(v6 + 1677) = self->_uploadIsProxyConnection;
  *(_DWORD *)(v6 + 1684) |= 0x400000u;
  if ((*(_DWORD *)&self->_has & 0x800000) != 0)
  {
LABEL_31:
    *(unsigned char *)(v6 + 1678) = self->_uploadIsReusedConnection;
    *(_DWORD *)(v6 + 1684) |= 0x800000u;
  }
LABEL_32:
  uint64_t v230 = [(NSString *)self->_uploadMaxSpeedObserved copyWithZone:a3];
  v231 = *(void **)(v6 + 1288);
  *(void *)(v6 + 1288) = v230;

  uint64_t v232 = [(NSString *)self->_uploadNumberOfStreams copyWithZone:a3];
  v233 = *(void **)(v6 + 1296);
  *(void *)(v6 + 1296) = v232;

  uint64_t v234 = [(NSString *)self->_uploadProtocolName copyWithZone:a3];
  v235 = *(void **)(v6 + 1304);
  *(void *)(v6 + 1304) = v234;

  uint64_t v236 = [(NSString *)self->_uploadRemoteAddress copyWithZone:a3];
  v237 = *(void **)(v6 + 1312);
  *(void *)(v6 + 1312) = v236;

  uint64_t v238 = [(NSString *)self->_uploadRemotePort copyWithZone:a3];
  v239 = *(void **)(v6 + 1320);
  *(void *)(v6 + 1320) = v238;

  uint64_t v240 = [(NSString *)self->_uploadRequestTime copyWithZone:a3];
  v241 = *(void **)(v6 + 1328);
  *(void *)(v6 + 1328) = v240;

  uint64_t v242 = [(NSString *)self->_uploadRequestToResponseTime copyWithZone:a3];
  v243 = *(void **)(v6 + 1336);
  *(void *)(v6 + 1336) = v242;

  uint64_t v244 = [(NSString *)self->_uploadResponseTime copyWithZone:a3];
  v245 = *(void **)(v6 + 1344);
  *(void *)(v6 + 1344) = v244;

  uint64_t v246 = [(NSString *)self->_uploadSecureConnectionTime copyWithZone:a3];
  v247 = *(void **)(v6 + 1376);
  *(void *)(v6 + 1376) = v246;

  uint64_t v248 = [(NSString *)self->_uploadServer copyWithZone:a3];
  v249 = *(void **)(v6 + 1384);
  *(void *)(v6 + 1384) = v248;

  uint64_t v250 = [(NSString *)self->_uploadSpeed copyWithZone:a3];
  v251 = *(void **)(v6 + 1392);
  *(void *)(v6 + 1392) = v250;

  uint64_t v252 = [(NSString *)self->_uploadStableSpeed copyWithZone:a3];
  v253 = *(void **)(v6 + 1416);
  *(void *)(v6 + 1416) = v252;

  uint64_t v254 = [(NSString *)self->_uploadStartDataBearerTechnology copyWithZone:a3];
  v255 = *(void **)(v6 + 1432);
  *(void *)(v6 + 1432) = v254;

  uint64_t v256 = [(NSString *)self->_uploadStartPrimaryIpv4Interface copyWithZone:a3];
  v257 = *(void **)(v6 + 1440);
  *(void *)(v6 + 1440) = v256;

  uint64_t v258 = [(NSString *)self->_uploadStartRat copyWithZone:a3];
  v259 = *(void **)(v6 + 1456);
  *(void *)(v6 + 1456) = v258;

  if (*((unsigned char *)&self->_has + 3))
  {
    *(unsigned char *)(v6 + 1679) = self->_useWifiWasSpecified;
    *(_DWORD *)(v6 + 1684) |= 0x1000000u;
  }
  uint64_t v260 = [(NSString *)self->_wifiAveragePhyRateRx copyWithZone:a3];
  v261 = *(void **)(v6 + 1472);
  *(void *)(v6 + 1472) = v260;

  uint64_t v262 = [(NSString *)self->_wifiAverageRssi copyWithZone:a3];
  v263 = *(void **)(v6 + 1480);
  *(void *)(v6 + 1480) = v262;

  uint64_t v264 = [(NSString *)self->_wifiAverageSnr copyWithZone:a3];
  v265 = *(void **)(v6 + 1488);
  *(void *)(v6 + 1488) = v264;

  uint64_t v266 = [(NSString *)self->_wifiAverageTcpRtt copyWithZone:a3];
  v267 = *(void **)(v6 + 1496);
  *(void *)(v6 + 1496) = v266;

  uint64_t v268 = [(NSString *)self->_wifiBtcMode copyWithZone:a3];
  v269 = *(void **)(v6 + 1504);
  *(void *)(v6 + 1504) = v268;

  uint64_t v270 = [(NSString *)self->_wifiCca copyWithZone:a3];
  v271 = *(void **)(v6 + 1512);
  *(void *)(v6 + 1512) = v270;

  uint64_t v272 = [(NSString *)self->_wifiChannel copyWithZone:a3];
  v273 = *(void **)(v6 + 1520);
  *(void *)(v6 + 1520) = v272;

  uint64_t v274 = [(NSString *)self->_wifiCwfCca copyWithZone:a3];
  v275 = *(void **)(v6 + 1544);
  *(void *)(v6 + 1544) = v274;

  uint64_t v276 = [(NSString *)self->_wifiEapolControlMode copyWithZone:a3];
  v277 = *(void **)(v6 + 1552);
  *(void *)(v6 + 1552) = v276;

  uint64_t v278 = [(NSString *)self->_wifiEapolSupplicantState copyWithZone:a3];
  v279 = *(void **)(v6 + 1560);
  *(void *)(v6 + 1560) = v278;

  uint64_t v280 = [(NSString *)self->_wifiGuardInterval copyWithZone:a3];
  v281 = *(void **)(v6 + 1568);
  *(void *)(v6 + 1568) = v280;

  uint64_t v282 = [(NSString *)self->_wifiHiddenState copyWithZone:a3];
  v283 = *(void **)(v6 + 1576);
  *(void *)(v6 + 1576) = v282;

  if ((*((unsigned char *)&self->_has + 3) & 2) != 0)
  {
    *(unsigned char *)(v6 + 1680) = self->_wifiIsCaptive;
    *(_DWORD *)(v6 + 1684) |= 0x2000000u;
  }
  uint64_t v284 = [(NSString *)self->_wifiMcsIndex copyWithZone:a3];
  v285 = *(void **)(v6 + 1584);
  *(void *)(v6 + 1584) = v284;

  uint64_t v286 = [(NSString *)self->_wifiNoise copyWithZone:a3];
  v287 = *(void **)(v6 + 1592);
  *(void *)(v6 + 1592) = v286;

  uint64_t v288 = [(NSString *)self->_wifiNumberOfSpatialStreams copyWithZone:a3];
  v289 = *(void **)(v6 + 1600);
  *(void *)(v6 + 1600) = v288;

  uint64_t v290 = [(NSString *)self->_wifiOpMode copyWithZone:a3];
  v291 = *(void **)(v6 + 1608);
  *(void *)(v6 + 1608) = v290;

  uint64_t v292 = [(NSString *)self->_wifiPhyMode copyWithZone:a3];
  v293 = *(void **)(v6 + 1616);
  *(void *)(v6 + 1616) = v292;

  uint64_t v294 = [(NSString *)self->_wifiRssi copyWithZone:a3];
  v295 = *(void **)(v6 + 1624);
  *(void *)(v6 + 1624) = v294;

  uint64_t v296 = [(NSString *)self->_wifiSecurity copyWithZone:a3];
  v297 = *(void **)(v6 + 1632);
  *(void *)(v6 + 1632) = v296;

  uint64_t v298 = [(NSString *)self->_wifiTxRate copyWithZone:a3];
  v299 = *(void **)(v6 + 1640);
  *(void *)(v6 + 1640) = v298;

  uint64_t v300 = [(NSString *)self->_wrmChannelType copyWithZone:a3];
  v301 = *(void **)(v6 + 1648);
  *(void *)(v6 + 1648) = v300;

  uint64_t v302 = [(NSString *)self->_cellularCellid copyWithZone:a3];
  v303 = *(void **)(v6 + 144);
  *(void *)(v6 + 144) = v302;

  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *(unsigned char *)(v6 + 1656) = self->_acceptablePerformanceResult;
    *(_DWORD *)(v6 + 1684) |= 2u;
  }
  uint64_t v304 = [(NSString *)self->_networkQualityResponsiveness copyWithZone:a3];
  v305 = *(void **)(v6 + 952);
  *(void *)(v6 + 952) = v304;

  uint64_t v306 = [(NSString *)self->_cellularAggregatedDLBW copyWithZone:a3];
  v307 = *(void **)(v6 + 96);
  *(void *)(v6 + 96) = v306;

  uint64_t v308 = [(NSString *)self->_cellularAggregatedULBW copyWithZone:a3];
  v309 = *(void **)(v6 + 104);
  *(void *)(v6 + 104) = v308;

  uint64_t v310 = [(NSString *)self->_cellularIssa copyWithZone:a3];
  v311 = *(void **)(v6 + 216);
  *(void *)(v6 + 216) = v310;

  uint64_t v312 = [(NSString *)self->_cellularLac copyWithZone:a3];
  v313 = *(void **)(v6 + 224);
  *(void *)(v6 + 224) = v312;

  uint64_t v314 = [(NSString *)self->_cellularLteNrConfiguredBw copyWithZone:a3];
  v315 = *(void **)(v6 + 248);
  *(void *)(v6 + 248) = v314;

  uint64_t v316 = [(NSString *)self->_cellularMaxDlMod copyWithZone:a3];
  v317 = *(void **)(v6 + 256);
  *(void *)(v6 + 256) = v316;

  uint64_t v318 = [(NSString *)self->_cellularMaxNwMimoLyr copyWithZone:a3];
  v319 = *(void **)(v6 + 264);
  *(void *)(v6 + 264) = v318;

  uint64_t v320 = [(NSString *)self->_cellularMaxSchdMimoLyr copyWithZone:a3];
  v321 = *(void **)(v6 + 272);
  *(void *)(v6 + 272) = v320;

  uint64_t v322 = [(NSString *)self->_cellularMaxUeRank copyWithZone:a3];
  v323 = *(void **)(v6 + 280);
  *(void *)(v6 + 280) = v322;

  uint64_t v324 = [(NSString *)self->_cellularMaxUlMod copyWithZone:a3];
  v325 = *(void **)(v6 + 288);
  *(void *)(v6 + 288) = v324;

  uint64_t v326 = [(NSString *)self->_cellularNrSinr copyWithZone:a3];
  v327 = *(void **)(v6 + 416);
  *(void *)(v6 + 416) = v326;

  uint64_t v328 = [(NSString *)self->_cellularNrarfcn copyWithZone:a3];
  v329 = *(void **)(v6 + 432);
  *(void *)(v6 + 432) = v328;

  uint64_t v330 = [(NSString *)self->_cellularRadioFrequency copyWithZone:a3];
  v331 = *(void **)(v6 + 464);
  *(void *)(v6 + 464) = v330;

  uint64_t v332 = [(NSString *)self->_cellularTotalDlMimoLayers copyWithZone:a3];
  v333 = *(void **)(v6 + 544);
  *(void *)(v6 + 544) = v332;

  uint64_t v334 = [(NSString *)self->_cellularTotalNumCcs copyWithZone:a3];
  v335 = *(void **)(v6 + 560);
  *(void *)(v6 + 560) = v334;

  uint64_t v336 = [(NSString *)self->_downloadStartRadioFrequency copyWithZone:a3];
  v337 = *(void **)(v6 + 864);
  *(void *)(v6 + 864) = v336;

  uint64_t v338 = [(NSString *)self->_downloadEndRadioFrequency copyWithZone:a3];
  v339 = *(void **)(v6 + 632);
  *(void *)(v6 + 632) = v338;

  uint64_t v340 = [(NSString *)self->_networkPrimaryIpv6InterfaceName copyWithZone:a3];
  v341 = *(void **)(v6 + 896);
  *(void *)(v6 + 896) = v340;

  uint64_t v342 = [(NSString *)self->_networkPrimaryIpv6ServiceName copyWithZone:a3];
  v343 = *(void **)(v6 + 904);
  *(void *)(v6 + 904) = v342;

  uint64_t v344 = [(NSString *)self->_uploadStartRadioFrequency copyWithZone:a3];
  v345 = *(void **)(v6 + 1448);
  *(void *)(v6 + 1448) = v344;

  uint64_t v346 = [(NSString *)self->_uploadEndRadioFrequency copyWithZone:a3];
  v347 = *(void **)(v6 + 1216);
  *(void *)(v6 + 1216) = v346;

  uint64_t v348 = [(NSString *)self->_downloadError copyWithZone:a3];
  v349 = *(void **)(v6 + 648);
  *(void *)(v6 + 648) = v348;

  uint64_t v350 = [(NSString *)self->_networkQualityError copyWithZone:a3];
  v351 = *(void **)(v6 + 920);
  *(void *)(v6 + 920) = v350;

  uint64_t v352 = [(NSString *)self->_networkQualityDownloadSpeed copyWithZone:a3];
  v353 = *(void **)(v6 + 912);
  *(void *)(v6 + 912) = v352;

  uint64_t v354 = [(NSString *)self->_networkQualityUploadSpeed copyWithZone:a3];
  v355 = *(void **)(v6 + 960);
  *(void *)(v6 + 960) = v354;

  uint64_t v356 = [(NSString *)self->_networkQualityRating copyWithZone:a3];
  v357 = *(void **)(v6 + 944);
  *(void *)(v6 + 944) = v356;

  uint64_t v358 = [(NSString *)self->_vpnConnectionState copyWithZone:a3];
  v359 = *(void **)(v6 + 1464);
  *(void *)(v6 + 1464) = v358;

  uint64_t v360 = [(NSString *)self->_uploadError copyWithZone:a3];
  v361 = *(void **)(v6 + 1232);
  *(void *)(v6 + 1232) = v360;

  uint64_t v362 = [(NSString *)self->_uploadErrorDomain copyWithZone:a3];
  v363 = *(void **)(v6 + 1248);
  *(void *)(v6 + 1248) = v362;

  uint64_t v364 = [(NSString *)self->_uploadErrorCode copyWithZone:a3];
  v365 = *(void **)(v6 + 1240);
  *(void *)(v6 + 1240) = v364;

  uint64_t v366 = [(NSString *)self->_downloadErrorDomain copyWithZone:a3];
  v367 = *(void **)(v6 + 664);
  *(void *)(v6 + 664) = v366;

  uint64_t v368 = [(NSString *)self->_downloadErrorCode copyWithZone:a3];
  v369 = *(void **)(v6 + 656);
  *(void *)(v6 + 656) = v368;

  uint64_t v370 = [(NSString *)self->_pingError copyWithZone:a3];
  v371 = *(void **)(v6 + 992);
  *(void *)(v6 + 992) = v370;

  uint64_t v372 = [(NSString *)self->_pingErrorDomain copyWithZone:a3];
  v373 = *(void **)(v6 + 1008);
  *(void *)(v6 + 1008) = v372;

  uint64_t v374 = [(NSString *)self->_pingErrorCode copyWithZone:a3];
  v375 = *(void **)(v6 + 1000);
  *(void *)(v6 + 1000) = v374;

  uint64_t v376 = [(NSString *)self->_networkQualityErrorDomain copyWithZone:a3];
  v377 = *(void **)(v6 + 936);
  *(void *)(v6 + 936) = v376;

  uint64_t v378 = [(NSString *)self->_networkQualityErrorCode copyWithZone:a3];
  v379 = *(void **)(v6 + 928);
  *(void *)(v6 + 928) = v378;

  uint64_t v380 = [(NSString *)self->_cellularRnMobileCountryCode copyWithZone:a3];
  v381 = *(void **)(v6 + 472);
  *(void *)(v6 + 472) = v380;

  uint64_t v382 = [(NSString *)self->_cellularRnMobileNetworkCode copyWithZone:a3];
  v383 = *(void **)(v6 + 480);
  *(void *)(v6 + 480) = v382;

  if (*((unsigned char *)&self->_has + 1))
  {
    *(unsigned char *)(v6 + 1663) = self->_cellularDataIsEnabled;
    *(_DWORD *)(v6 + 1684) |= 0x100u;
  }
  uint64_t v384 = [(NSString *)self->_downloadStartCellularEstimate copyWithZone:a3];
  v385 = *(void **)(v6 + 840);
  *(void *)(v6 + 840) = v384;

  uint64_t v386 = [(NSString *)self->_downloadEndCellularEstimate copyWithZone:a3];
  v387 = *(void **)(v6 + 608);
  *(void *)(v6 + 608) = v386;

  uint64_t v388 = [(NSString *)self->_downloadMaxCellularEstimate copyWithZone:a3];
  v389 = *(void **)(v6 + 696);
  *(void *)(v6 + 696) = v388;

  uint64_t v390 = [(NSString *)self->_uploadStartCellularEstimate copyWithZone:a3];
  v391 = *(void **)(v6 + 1424);
  *(void *)(v6 + 1424) = v390;

  uint64_t v392 = [(NSString *)self->_uploadEndCellularEstimate copyWithZone:a3];
  v393 = *(void **)(v6 + 1192);
  *(void *)(v6 + 1192) = v392;

  uint64_t v394 = [(NSString *)self->_uploadMaxCellularEstimate copyWithZone:a3];
  v395 = *(void **)(v6 + 1280);
  *(void *)(v6 + 1280) = v394;

  uint64_t v396 = [(NSString *)self->_downloadResponsiveness copyWithZone:a3];
  v397 = *(void **)(v6 + 768);
  *(void *)(v6 + 768) = v396;

  uint64_t v398 = [(NSString *)self->_downloadResponsivenessConfidence copyWithZone:a3];
  v399 = *(void **)(v6 + 776);
  *(void *)(v6 + 776) = v398;

  uint64_t v400 = [(NSString *)self->_downloadResponsivenessRating copyWithZone:a3];
  v401 = *(void **)(v6 + 784);
  *(void *)(v6 + 784) = v400;

  uint64_t v402 = [(NSString *)self->_downloadSpeedConfidence copyWithZone:a3];
  v403 = *(void **)(v6 + 816);
  *(void *)(v6 + 816) = v402;

  uint64_t v404 = [(NSString *)self->_downloadSpeedRating copyWithZone:a3];
  v405 = *(void **)(v6 + 824);
  *(void *)(v6 + 824) = v404;

  uint64_t v406 = [(NSString *)self->_uploadResponsiveness copyWithZone:a3];
  v407 = *(void **)(v6 + 1352);
  *(void *)(v6 + 1352) = v406;

  uint64_t v408 = [(NSString *)self->_uploadResponsivenessConfidence copyWithZone:a3];
  v409 = *(void **)(v6 + 1360);
  *(void *)(v6 + 1360) = v408;

  uint64_t v410 = [(NSString *)self->_uploadResponsivenessRating copyWithZone:a3];
  v411 = *(void **)(v6 + 1368);
  *(void *)(v6 + 1368) = v410;

  uint64_t v412 = [(NSString *)self->_uploadSpeedConfidence copyWithZone:a3];
  v413 = *(void **)(v6 + 1400);
  *(void *)(v6 + 1400) = v412;

  uint64_t v414 = [(NSString *)self->_uploadSpeedRating copyWithZone:a3];
  v415 = *(void **)(v6 + 1408);
  *(void *)(v6 + 1408) = v414;

  uint64_t v416 = [(NSString *)self->_wifiChannelBand copyWithZone:a3];
  v417 = *(void **)(v6 + 1528);
  *(void *)(v6 + 1528) = v416;

  uint64_t v418 = [(NSString *)self->_wifiChannelWidth copyWithZone:a3];
  v419 = *(void **)(v6 + 1536);
  *(void *)(v6 + 1536) = v418;

  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_617;
  }
  int v5 = *((_DWORD *)v4 + 421);
  if (*(unsigned char *)&self->_has)
  {
    if ((v5 & 1) == 0 || self->_timestamp != *((void *)v4 + 1)) {
      goto LABEL_617;
    }
  }
  else if (v5)
  {
    goto LABEL_617;
  }
  awdlElectionParameters = self->_awdlElectionParameters;
  if ((unint64_t)awdlElectionParameters | *((void *)v4 + 2)
    && !-[NSString isEqual:](awdlElectionParameters, "isEqual:"))
  {
    goto LABEL_617;
  }
  awdlMasterChannel = self->_awdlMasterChannel;
  if ((unint64_t)awdlMasterChannel | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](awdlMasterChannel, "isEqual:")) {
      goto LABEL_617;
    }
  }
  awdlOpMode = self->_awdlOpMode;
  if ((unint64_t)awdlOpMode | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](awdlOpMode, "isEqual:")) {
      goto LABEL_617;
    }
  }
  int v9 = *((_DWORD *)v4 + 421);
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((v9 & 4) == 0) {
      goto LABEL_617;
    }
    if (self->_awdlPowerState)
    {
      if (!*((unsigned char *)v4 + 1657)) {
        goto LABEL_617;
      }
    }
    else if (*((unsigned char *)v4 + 1657))
    {
      goto LABEL_617;
    }
  }
  else if ((v9 & 4) != 0)
  {
    goto LABEL_617;
  }
  awdlSchedule = self->_awdlSchedule;
  if ((unint64_t)awdlSchedule | *((void *)v4 + 5)
    && !-[NSString isEqual:](awdlSchedule, "isEqual:"))
  {
    goto LABEL_617;
  }
  awdlSecondaryMasterChannel = self->_awdlSecondaryMasterChannel;
  if ((unint64_t)awdlSecondaryMasterChannel | *((void *)v4 + 6))
  {
    if (!-[NSString isEqual:](awdlSecondaryMasterChannel, "isEqual:")) {
      goto LABEL_617;
    }
  }
  awdlSyncChannelSequence = self->_awdlSyncChannelSequence;
  if ((unint64_t)awdlSyncChannelSequence | *((void *)v4 + 7))
  {
    if (!-[NSString isEqual:](awdlSyncChannelSequence, "isEqual:")) {
      goto LABEL_617;
    }
  }
  awdlSyncState = self->_awdlSyncState;
  if ((unint64_t)awdlSyncState | *((void *)v4 + 8))
  {
    if (!-[NSString isEqual:](awdlSyncState, "isEqual:")) {
      goto LABEL_617;
    }
  }
  btConnectedDevicesCount = self->_btConnectedDevicesCount;
  if ((unint64_t)btConnectedDevicesCount | *((void *)v4 + 9))
  {
    if (!-[NSString isEqual:](btConnectedDevicesCount, "isEqual:")) {
      goto LABEL_617;
    }
  }
  $0FF3A8E67B3D88A75EBF7BE240CB1B75 has = self->_has;
  int v16 = *((_DWORD *)v4 + 421);
  if ((*(unsigned char *)&has & 8) != 0)
  {
    if ((v16 & 8) == 0) {
      goto LABEL_617;
    }
    if (self->_btIsConnectable)
    {
      if (!*((unsigned char *)v4 + 1658)) {
        goto LABEL_617;
      }
    }
    else if (*((unsigned char *)v4 + 1658))
    {
      goto LABEL_617;
    }
  }
  else if ((v16 & 8) != 0)
  {
    goto LABEL_617;
  }
  if ((*(unsigned char *)&has & 0x10) != 0)
  {
    if ((v16 & 0x10) == 0) {
      goto LABEL_617;
    }
    if (self->_btIsDiscoverable)
    {
      if (!*((unsigned char *)v4 + 1659)) {
        goto LABEL_617;
      }
    }
    else if (*((unsigned char *)v4 + 1659))
    {
      goto LABEL_617;
    }
  }
  else if ((v16 & 0x10) != 0)
  {
    goto LABEL_617;
  }
  if ((*(unsigned char *)&has & 0x20) != 0)
  {
    if ((v16 & 0x20) == 0) {
      goto LABEL_617;
    }
    if (self->_btIsPowerOn)
    {
      if (!*((unsigned char *)v4 + 1660)) {
        goto LABEL_617;
      }
    }
    else if (*((unsigned char *)v4 + 1660))
    {
      goto LABEL_617;
    }
  }
  else if ((v16 & 0x20) != 0)
  {
    goto LABEL_617;
  }
  if ((*(unsigned char *)&has & 0x40) != 0)
  {
    if ((v16 & 0x40) == 0) {
      goto LABEL_617;
    }
    if (self->_btIsScanning)
    {
      if (!*((unsigned char *)v4 + 1661)) {
        goto LABEL_617;
      }
    }
    else if (*((unsigned char *)v4 + 1661))
    {
      goto LABEL_617;
    }
  }
  else if ((v16 & 0x40) != 0)
  {
    goto LABEL_617;
  }
  callingClient = self->_callingClient;
  if ((unint64_t)callingClient | *((void *)v4 + 10)
    && !-[NSString isEqual:](callingClient, "isEqual:"))
  {
    goto LABEL_617;
  }
  cellularActiveContexts = self->_cellularActiveContexts;
  if ((unint64_t)cellularActiveContexts | *((void *)v4 + 11))
  {
    if (!-[NSString isEqual:](cellularActiveContexts, "isEqual:")) {
      goto LABEL_617;
    }
  }
  int v19 = *((_DWORD *)v4 + 421);
  if ((*(unsigned char *)&self->_has & 0x80) != 0)
  {
    if ((v19 & 0x80) == 0) {
      goto LABEL_617;
    }
    if (self->_cellularAllowsVoip)
    {
      if (!*((unsigned char *)v4 + 1662)) {
        goto LABEL_617;
      }
    }
    else if (*((unsigned char *)v4 + 1662))
    {
      goto LABEL_617;
    }
  }
  else if ((v19 & 0x80) != 0)
  {
    goto LABEL_617;
  }
  cellularAttached = self->_cellularAttached;
  if ((unint64_t)cellularAttached | *((void *)v4 + 14)
    && !-[NSString isEqual:](cellularAttached, "isEqual:"))
  {
    goto LABEL_617;
  }
  cellularBandinfo = self->_cellularBandinfo;
  if ((unint64_t)cellularBandinfo | *((void *)v4 + 15))
  {
    if (!-[NSString isEqual:](cellularBandinfo, "isEqual:")) {
      goto LABEL_617;
    }
  }
  cellularBandwidth = self->_cellularBandwidth;
  if ((unint64_t)cellularBandwidth | *((void *)v4 + 16))
  {
    if (!-[NSString isEqual:](cellularBandwidth, "isEqual:")) {
      goto LABEL_617;
    }
  }
  cellularCarrierName = self->_cellularCarrierName;
  if ((unint64_t)cellularCarrierName | *((void *)v4 + 17))
  {
    if (!-[NSString isEqual:](cellularCarrierName, "isEqual:")) {
      goto LABEL_617;
    }
  }
  cellularDataBearerSoMask = self->_cellularDataBearerSoMask;
  if ((unint64_t)cellularDataBearerSoMask | *((void *)v4 + 19))
  {
    if (!-[NSString isEqual:](cellularDataBearerSoMask, "isEqual:")) {
      goto LABEL_617;
    }
  }
  cellularDataBearerTechnology = self->_cellularDataBearerTechnology;
  if ((unint64_t)cellularDataBearerTechnology | *((void *)v4 + 20))
  {
    if (!-[NSString isEqual:](cellularDataBearerTechnology, "isEqual:")) {
      goto LABEL_617;
    }
  }
  cellularDataPlanSignalingReductionOverride = self->_cellularDataPlanSignalingReductionOverride;
  if ((unint64_t)cellularDataPlanSignalingReductionOverride | *((void *)v4 + 21))
  {
    if (!-[NSString isEqual:](cellularDataPlanSignalingReductionOverride, "isEqual:")) {
      goto LABEL_617;
    }
  }
  cellularDataPossible = self->_cellularDataPossible;
  if ((unint64_t)cellularDataPossible | *((void *)v4 + 22))
  {
    if (!-[NSString isEqual:](cellularDataPossible, "isEqual:")) {
      goto LABEL_617;
    }
  }
  cellularInHomeCountry = self->_cellularInHomeCountry;
  if ((unint64_t)cellularInHomeCountry | *((void *)v4 + 23))
  {
    if (!-[NSString isEqual:](cellularInHomeCountry, "isEqual:")) {
      goto LABEL_617;
    }
  }
  cellularIndicator = self->_cellularIndicator;
  if ((unint64_t)cellularIndicator | *((void *)v4 + 24))
  {
    if (!-[NSString isEqual:](cellularIndicator, "isEqual:")) {
      goto LABEL_617;
    }
  }
  cellularIndicatorOverride = self->_cellularIndicatorOverride;
  if ((unint64_t)cellularIndicatorOverride | *((void *)v4 + 25))
  {
    if (!-[NSString isEqual:](cellularIndicatorOverride, "isEqual:")) {
      goto LABEL_617;
    }
  }
  cellularIsoCountryCode = self->_cellularIsoCountryCode;
  if ((unint64_t)cellularIsoCountryCode | *((void *)v4 + 26))
  {
    if (!-[NSString isEqual:](cellularIsoCountryCode, "isEqual:")) {
      goto LABEL_617;
    }
  }
  cellularLqm = self->_cellularLqm;
  if ((unint64_t)cellularLqm | *((void *)v4 + 29))
  {
    if (!-[NSString isEqual:](cellularLqm, "isEqual:")) {
      goto LABEL_617;
    }
  }
  cellularLteMaxScheduledLayers = self->_cellularLteMaxScheduledLayers;
  if ((unint64_t)cellularLteMaxScheduledLayers | *((void *)v4 + 30))
  {
    if (!-[NSString isEqual:](cellularLteMaxScheduledLayers, "isEqual:")) {
      goto LABEL_617;
    }
  }
  cellularMobileCountryCode = self->_cellularMobileCountryCode;
  if ((unint64_t)cellularMobileCountryCode | *((void *)v4 + 37))
  {
    if (!-[NSString isEqual:](cellularMobileCountryCode, "isEqual:")) {
      goto LABEL_617;
    }
  }
  cellularMobileNetworkCode = self->_cellularMobileNetworkCode;
  if ((unint64_t)cellularMobileNetworkCode | *((void *)v4 + 38))
  {
    if (!-[NSString isEqual:](cellularMobileNetworkCode, "isEqual:")) {
      goto LABEL_617;
    }
  }
  cellularNewRadioCoverage = self->_cellularNewRadioCoverage;
  if ((unint64_t)cellularNewRadioCoverage | *((void *)v4 + 39))
  {
    if (!-[NSString isEqual:](cellularNewRadioCoverage, "isEqual:")) {
      goto LABEL_617;
    }
  }
  cellularNewRadioDataBearer = self->_cellularNewRadioDataBearer;
  if ((unint64_t)cellularNewRadioDataBearer | *((void *)v4 + 40))
  {
    if (!-[NSString isEqual:](cellularNewRadioDataBearer, "isEqual:")) {
      goto LABEL_617;
    }
  }
  cellularNewRadioMmwaveDataBearer = self->_cellularNewRadioMmwaveDataBearer;
  if ((unint64_t)cellularNewRadioMmwaveDataBearer | *((void *)v4 + 41))
  {
    if (!-[NSString isEqual:](cellularNewRadioMmwaveDataBearer, "isEqual:")) {
      goto LABEL_617;
    }
  }
  cellularNewRadioNsaCoverage = self->_cellularNewRadioNsaCoverage;
  if ((unint64_t)cellularNewRadioNsaCoverage | *((void *)v4 + 42))
  {
    if (!-[NSString isEqual:](cellularNewRadioNsaCoverage, "isEqual:")) {
      goto LABEL_617;
    }
  }
  cellularNewRadioNsaDataBearer = self->_cellularNewRadioNsaDataBearer;
  if ((unint64_t)cellularNewRadioNsaDataBearer | *((void *)v4 + 43))
  {
    if (!-[NSString isEqual:](cellularNewRadioNsaDataBearer, "isEqual:")) {
      goto LABEL_617;
    }
  }
  cellularNewRadioSaCoverage = self->_cellularNewRadioSaCoverage;
  if ((unint64_t)cellularNewRadioSaCoverage | *((void *)v4 + 44))
  {
    if (!-[NSString isEqual:](cellularNewRadioSaCoverage, "isEqual:")) {
      goto LABEL_617;
    }
  }
  cellularNewRadioSaDataBearer = self->_cellularNewRadioSaDataBearer;
  if ((unint64_t)cellularNewRadioSaDataBearer | *((void *)v4 + 45))
  {
    if (!-[NSString isEqual:](cellularNewRadioSaDataBearer, "isEqual:")) {
      goto LABEL_617;
    }
  }
  cellularNewRadioSub6DataBearer = self->_cellularNewRadioSub6DataBearer;
  if ((unint64_t)cellularNewRadioSub6DataBearer | *((void *)v4 + 46))
  {
    if (!-[NSString isEqual:](cellularNewRadioSub6DataBearer, "isEqual:")) {
      goto LABEL_617;
    }
  }
  cellularNrConfiguredBw = self->_cellularNrConfiguredBw;
  if ((unint64_t)cellularNrConfiguredBw | *((void *)v4 + 47))
  {
    if (!-[NSString isEqual:](cellularNrConfiguredBw, "isEqual:")) {
      goto LABEL_617;
    }
  }
  cellularNrLayers = self->_cellularNrLayers;
  if ((unint64_t)cellularNrLayers | *((void *)v4 + 48))
  {
    if (!-[NSString isEqual:](cellularNrLayers, "isEqual:")) {
      goto LABEL_617;
    }
  }
  cellularNrModulation = self->_cellularNrModulation;
  if ((unint64_t)cellularNrModulation | *((void *)v4 + 49))
  {
    if (!-[NSString isEqual:](cellularNrModulation, "isEqual:")) {
      goto LABEL_617;
    }
  }
  cellularNrRsrp = self->_cellularNrRsrp;
  if ((unint64_t)cellularNrRsrp | *((void *)v4 + 50))
  {
    if (!-[NSString isEqual:](cellularNrRsrp, "isEqual:")) {
      goto LABEL_617;
    }
  }
  cellularNrRsrq = self->_cellularNrRsrq;
  if ((unint64_t)cellularNrRsrq | *((void *)v4 + 51))
  {
    if (!-[NSString isEqual:](cellularNrRsrq, "isEqual:")) {
      goto LABEL_617;
    }
  }
  cellularNrSnr = self->_cellularNrSnr;
  if ((unint64_t)cellularNrSnr | *((void *)v4 + 53))
  {
    if (!-[NSString isEqual:](cellularNrSnr, "isEqual:")) {
      goto LABEL_617;
    }
  }
  cellularPid = self->_cellularPid;
  if ((unint64_t)cellularPid | *((void *)v4 + 55))
  {
    if (!-[NSString isEqual:](cellularPid, "isEqual:")) {
      goto LABEL_617;
    }
  }
  cellularRadioAccessTechnology = self->_cellularRadioAccessTechnology;
  if ((unint64_t)cellularRadioAccessTechnology | *((void *)v4 + 56))
  {
    if (!-[NSString isEqual:](cellularRadioAccessTechnology, "isEqual:")) {
      goto LABEL_617;
    }
  }
  cellularRadioAccessTechnologyCtDataStatus = self->_cellularRadioAccessTechnologyCtDataStatus;
  if ((unint64_t)cellularRadioAccessTechnologyCtDataStatus | *((void *)v4 + 57))
  {
    if (!-[NSString isEqual:](cellularRadioAccessTechnologyCtDataStatus, "isEqual:")) {
      goto LABEL_617;
    }
  }
  cellularRoamAllowed = self->_cellularRoamAllowed;
  if ((unint64_t)cellularRoamAllowed | *((void *)v4 + 61))
  {
    if (!-[NSString isEqual:](cellularRoamAllowed, "isEqual:")) {
      goto LABEL_617;
    }
  }
  cellularRsrp = self->_cellularRsrp;
  if ((unint64_t)cellularRsrp | *((void *)v4 + 62))
  {
    if (!-[NSString isEqual:](cellularRsrp, "isEqual:")) {
      goto LABEL_617;
    }
  }
  cellularSnr = self->_cellularSnr;
  if ((unint64_t)cellularSnr | *((void *)v4 + 63))
  {
    if (!-[NSString isEqual:](cellularSnr, "isEqual:")) {
      goto LABEL_617;
    }
  }
  cellularTac = self->_cellularTac;
  if ((unint64_t)cellularTac | *((void *)v4 + 64))
  {
    if (!-[NSString isEqual:](cellularTac, "isEqual:")) {
      goto LABEL_617;
    }
  }
  cellularTotalActiveContexts = self->_cellularTotalActiveContexts;
  if ((unint64_t)cellularTotalActiveContexts | *((void *)v4 + 65))
  {
    if (!-[NSString isEqual:](cellularTotalActiveContexts, "isEqual:")) {
      goto LABEL_617;
    }
  }
  cellularTotalBw = self->_cellularTotalBw;
  if ((unint64_t)cellularTotalBw | *((void *)v4 + 66))
  {
    if (!-[NSString isEqual:](cellularTotalBw, "isEqual:")) {
      goto LABEL_617;
    }
  }
  cellularTotalCcs = self->_cellularTotalCcs;
  if ((unint64_t)cellularTotalCcs | *((void *)v4 + 67))
  {
    if (!-[NSString isEqual:](cellularTotalCcs, "isEqual:")) {
      goto LABEL_617;
    }
  }
  cellularTotalLayers = self->_cellularTotalLayers;
  if ((unint64_t)cellularTotalLayers | *((void *)v4 + 69))
  {
    if (!-[NSString isEqual:](cellularTotalLayers, "isEqual:")) {
      goto LABEL_617;
    }
  }
  cellularUarfcn = self->_cellularUarfcn;
  if ((unint64_t)cellularUarfcn | *((void *)v4 + 71))
  {
    if (!-[NSString isEqual:](cellularUarfcn, "isEqual:")) {
      goto LABEL_617;
    }
  }
  downloadCdnPop = self->_downloadCdnPop;
  if ((unint64_t)downloadCdnPop | *((void *)v4 + 72))
  {
    if (!-[NSString isEqual:](downloadCdnPop, "isEqual:")) {
      goto LABEL_617;
    }
  }
  downloadCdnUuid = self->_downloadCdnUuid;
  if ((unint64_t)downloadCdnUuid | *((void *)v4 + 73))
  {
    if (!-[NSString isEqual:](downloadCdnUuid, "isEqual:")) {
      goto LABEL_617;
    }
  }
  downloadConnectionTime = self->_downloadConnectionTime;
  if ((unint64_t)downloadConnectionTime | *((void *)v4 + 74))
  {
    if (!-[NSString isEqual:](downloadConnectionTime, "isEqual:")) {
      goto LABEL_617;
    }
  }
  downloadDomainLookupTime = self->_downloadDomainLookupTime;
  if ((unint64_t)downloadDomainLookupTime | *((void *)v4 + 75))
  {
    if (!-[NSString isEqual:](downloadDomainLookupTime, "isEqual:")) {
      goto LABEL_617;
    }
  }
  downloadEndDataBearerTechnology = self->_downloadEndDataBearerTechnology;
  if ((unint64_t)downloadEndDataBearerTechnology | *((void *)v4 + 77))
  {
    if (!-[NSString isEqual:](downloadEndDataBearerTechnology, "isEqual:")) {
      goto LABEL_617;
    }
  }
  downloadEndPrimaryIpv4Interface = self->_downloadEndPrimaryIpv4Interface;
  if ((unint64_t)downloadEndPrimaryIpv4Interface | *((void *)v4 + 78))
  {
    if (!-[NSString isEqual:](downloadEndPrimaryIpv4Interface, "isEqual:")) {
      goto LABEL_617;
    }
  }
  downloadEndRat = self->_downloadEndRat;
  if ((unint64_t)downloadEndRat | *((void *)v4 + 80))
  {
    if (!-[NSString isEqual:](downloadEndRat, "isEqual:")) {
      goto LABEL_617;
    }
  }
  downloadFileSize = self->_downloadFileSize;
  if ((unint64_t)downloadFileSize | *((void *)v4 + 84))
  {
    if (!-[NSString isEqual:](downloadFileSize, "isEqual:")) {
      goto LABEL_617;
    }
  }
  downloadInterfaceName = self->_downloadInterfaceName;
  if ((unint64_t)downloadInterfaceName | *((void *)v4 + 85))
  {
    if (!-[NSString isEqual:](downloadInterfaceName, "isEqual:")) {
      goto LABEL_617;
    }
  }
  downloadInterfaceServiceName = self->_downloadInterfaceServiceName;
  if ((unint64_t)downloadInterfaceServiceName | *((void *)v4 + 86))
  {
    if (!-[NSString isEqual:](downloadInterfaceServiceName, "isEqual:")) {
      goto LABEL_617;
    }
  }
  $0FF3A8E67B3D88A75EBF7BE240CB1B75 v72 = self->_has;
  int v73 = *((_DWORD *)v4 + 421);
  if ((*(_WORD *)&v72 & 0x200) != 0)
  {
    if ((v73 & 0x200) == 0) {
      goto LABEL_617;
    }
    if (self->_downloadIsCellular)
    {
      if (!*((unsigned char *)v4 + 1664)) {
        goto LABEL_617;
      }
    }
    else if (*((unsigned char *)v4 + 1664))
    {
      goto LABEL_617;
    }
  }
  else if ((v73 & 0x200) != 0)
  {
    goto LABEL_617;
  }
  if ((*(_WORD *)&v72 & 0x400) != 0)
  {
    if ((v73 & 0x400) == 0) {
      goto LABEL_617;
    }
    if (self->_downloadIsConstrained)
    {
      if (!*((unsigned char *)v4 + 1665)) {
        goto LABEL_617;
      }
    }
    else if (*((unsigned char *)v4 + 1665))
    {
      goto LABEL_617;
    }
  }
  else if ((v73 & 0x400) != 0)
  {
    goto LABEL_617;
  }
  if ((*(_WORD *)&v72 & 0x800) != 0)
  {
    if ((v73 & 0x800) == 0) {
      goto LABEL_617;
    }
    if (self->_downloadIsExpensive)
    {
      if (!*((unsigned char *)v4 + 1666)) {
        goto LABEL_617;
      }
    }
    else if (*((unsigned char *)v4 + 1666))
    {
      goto LABEL_617;
    }
  }
  else if ((v73 & 0x800) != 0)
  {
    goto LABEL_617;
  }
  if ((*(_WORD *)&v72 & 0x1000) != 0)
  {
    if ((v73 & 0x1000) == 0) {
      goto LABEL_617;
    }
    if (self->_downloadIsMultipath)
    {
      if (!*((unsigned char *)v4 + 1667)) {
        goto LABEL_617;
      }
    }
    else if (*((unsigned char *)v4 + 1667))
    {
      goto LABEL_617;
    }
  }
  else if ((v73 & 0x1000) != 0)
  {
    goto LABEL_617;
  }
  if ((*(_WORD *)&v72 & 0x2000) != 0)
  {
    if ((v73 & 0x2000) == 0) {
      goto LABEL_617;
    }
    if (self->_downloadIsProxyConnection)
    {
      if (!*((unsigned char *)v4 + 1668)) {
        goto LABEL_617;
      }
    }
    else if (*((unsigned char *)v4 + 1668))
    {
      goto LABEL_617;
    }
  }
  else if ((v73 & 0x2000) != 0)
  {
    goto LABEL_617;
  }
  if ((*(_WORD *)&v72 & 0x4000) != 0)
  {
    if ((v73 & 0x4000) == 0) {
      goto LABEL_617;
    }
    if (self->_downloadIsReusedConnection)
    {
      if (!*((unsigned char *)v4 + 1669)) {
        goto LABEL_617;
      }
    }
    else if (*((unsigned char *)v4 + 1669))
    {
      goto LABEL_617;
    }
  }
  else if ((v73 & 0x4000) != 0)
  {
    goto LABEL_617;
  }
  downloadMaxSpeedObserved = self->_downloadMaxSpeedObserved;
  if ((unint64_t)downloadMaxSpeedObserved | *((void *)v4 + 88)
    && !-[NSString isEqual:](downloadMaxSpeedObserved, "isEqual:"))
  {
    goto LABEL_617;
  }
  downloadNumberOfStreams = self->_downloadNumberOfStreams;
  if ((unint64_t)downloadNumberOfStreams | *((void *)v4 + 89))
  {
    if (!-[NSString isEqual:](downloadNumberOfStreams, "isEqual:")) {
      goto LABEL_617;
    }
  }
  downloadProtocolName = self->_downloadProtocolName;
  if ((unint64_t)downloadProtocolName | *((void *)v4 + 90))
  {
    if (!-[NSString isEqual:](downloadProtocolName, "isEqual:")) {
      goto LABEL_617;
    }
  }
  downloadRemoteAddress = self->_downloadRemoteAddress;
  if ((unint64_t)downloadRemoteAddress | *((void *)v4 + 91))
  {
    if (!-[NSString isEqual:](downloadRemoteAddress, "isEqual:")) {
      goto LABEL_617;
    }
  }
  downloadRemotePort = self->_downloadRemotePort;
  if ((unint64_t)downloadRemotePort | *((void *)v4 + 92))
  {
    if (!-[NSString isEqual:](downloadRemotePort, "isEqual:")) {
      goto LABEL_617;
    }
  }
  downloadRequestTime = self->_downloadRequestTime;
  if ((unint64_t)downloadRequestTime | *((void *)v4 + 93))
  {
    if (!-[NSString isEqual:](downloadRequestTime, "isEqual:")) {
      goto LABEL_617;
    }
  }
  downloadRequestToResponseTime = self->_downloadRequestToResponseTime;
  if ((unint64_t)downloadRequestToResponseTime | *((void *)v4 + 94))
  {
    if (!-[NSString isEqual:](downloadRequestToResponseTime, "isEqual:")) {
      goto LABEL_617;
    }
  }
  downloadResponseTime = self->_downloadResponseTime;
  if ((unint64_t)downloadResponseTime | *((void *)v4 + 95))
  {
    if (!-[NSString isEqual:](downloadResponseTime, "isEqual:")) {
      goto LABEL_617;
    }
  }
  downloadSecureConnectionTime = self->_downloadSecureConnectionTime;
  if ((unint64_t)downloadSecureConnectionTime | *((void *)v4 + 99))
  {
    if (!-[NSString isEqual:](downloadSecureConnectionTime, "isEqual:")) {
      goto LABEL_617;
    }
  }
  downloadServer = self->_downloadServer;
  if ((unint64_t)downloadServer | *((void *)v4 + 100))
  {
    if (!-[NSString isEqual:](downloadServer, "isEqual:")) {
      goto LABEL_617;
    }
  }
  downloadSpeed = self->_downloadSpeed;
  if ((unint64_t)downloadSpeed | *((void *)v4 + 101))
  {
    if (!-[NSString isEqual:](downloadSpeed, "isEqual:")) {
      goto LABEL_617;
    }
  }
  downloadStableSpeed = self->_downloadStableSpeed;
  if ((unint64_t)downloadStableSpeed | *((void *)v4 + 104))
  {
    if (!-[NSString isEqual:](downloadStableSpeed, "isEqual:")) {
      goto LABEL_617;
    }
  }
  downloadStartDataBearerTechnology = self->_downloadStartDataBearerTechnology;
  if ((unint64_t)downloadStartDataBearerTechnology | *((void *)v4 + 106))
  {
    if (!-[NSString isEqual:](downloadStartDataBearerTechnology, "isEqual:")) {
      goto LABEL_617;
    }
  }
  downloadStartPrimaryIpv4Interface = self->_downloadStartPrimaryIpv4Interface;
  if ((unint64_t)downloadStartPrimaryIpv4Interface | *((void *)v4 + 107))
  {
    if (!-[NSString isEqual:](downloadStartPrimaryIpv4Interface, "isEqual:")) {
      goto LABEL_617;
    }
  }
  downloadStartRat = self->_downloadStartRat;
  if ((unint64_t)downloadStartRat | *((void *)v4 + 109))
  {
    if (!-[NSString isEqual:](downloadStartRat, "isEqual:")) {
      goto LABEL_617;
    }
  }
  int v89 = *((_DWORD *)v4 + 421);
  if ((*((unsigned char *)&self->_has + 1) & 0x80) != 0)
  {
    if ((v89 & 0x8000) == 0) {
      goto LABEL_617;
    }
    if (self->_networkIsAppleReachable)
    {
      if (!*((unsigned char *)v4 + 1670)) {
        goto LABEL_617;
      }
    }
    else if (*((unsigned char *)v4 + 1670))
    {
      goto LABEL_617;
    }
  }
  else if ((v89 & 0x8000) != 0)
  {
    goto LABEL_617;
  }
  networkPrimaryIpv4InterfaceName = self->_networkPrimaryIpv4InterfaceName;
  if ((unint64_t)networkPrimaryIpv4InterfaceName | *((void *)v4 + 110)
    && !-[NSString isEqual:](networkPrimaryIpv4InterfaceName, "isEqual:"))
  {
    goto LABEL_617;
  }
  networkPrimaryIpv4ServiceName = self->_networkPrimaryIpv4ServiceName;
  if ((unint64_t)networkPrimaryIpv4ServiceName | *((void *)v4 + 111))
  {
    if (!-[NSString isEqual:](networkPrimaryIpv4ServiceName, "isEqual:")) {
      goto LABEL_617;
    }
  }
  nptkitFrameworkVersion = self->_nptkitFrameworkVersion;
  if ((unint64_t)nptkitFrameworkVersion | *((void *)v4 + 121))
  {
    if (!-[NSString isEqual:](nptkitFrameworkVersion, "isEqual:")) {
      goto LABEL_617;
    }
  }
  performanceTestStartTime = self->_performanceTestStartTime;
  if ((unint64_t)performanceTestStartTime | *((void *)v4 + 122))
  {
    if (!-[NSString isEqual:](performanceTestStartTime, "isEqual:")) {
      goto LABEL_617;
    }
  }
  pingAddress = self->_pingAddress;
  if ((unint64_t)pingAddress | *((void *)v4 + 123))
  {
    if (!-[NSString isEqual:](pingAddress, "isEqual:")) {
      goto LABEL_617;
    }
  }
  pingLossPercent = self->_pingLossPercent;
  if ((unint64_t)pingLossPercent | *((void *)v4 + 127))
  {
    if (!-[NSString isEqual:](pingLossPercent, "isEqual:")) {
      goto LABEL_617;
    }
  }
  pingMaxLatency = self->_pingMaxLatency;
  if ((unint64_t)pingMaxLatency | *((void *)v4 + 128))
  {
    if (!-[NSString isEqual:](pingMaxLatency, "isEqual:")) {
      goto LABEL_617;
    }
  }
  pingMeanLatency = self->_pingMeanLatency;
  if ((unint64_t)pingMeanLatency | *((void *)v4 + 129))
  {
    if (!-[NSString isEqual:](pingMeanLatency, "isEqual:")) {
      goto LABEL_617;
    }
  }
  pingMinLatency = self->_pingMinLatency;
  if ((unint64_t)pingMinLatency | *((void *)v4 + 130))
  {
    if (!-[NSString isEqual:](pingMinLatency, "isEqual:")) {
      goto LABEL_617;
    }
  }
  pingStandardDeviation = self->_pingStandardDeviation;
  if ((unint64_t)pingStandardDeviation | *((void *)v4 + 131))
  {
    if (!-[NSString isEqual:](pingStandardDeviation, "isEqual:")) {
      goto LABEL_617;
    }
  }
  powerBatteryWarningLevel = self->_powerBatteryWarningLevel;
  if ((unint64_t)powerBatteryWarningLevel | *((void *)v4 + 132))
  {
    if (!-[NSString isEqual:](powerBatteryWarningLevel, "isEqual:")) {
      goto LABEL_617;
    }
  }
  powerSourceType = self->_powerSourceType;
  if ((unint64_t)powerSourceType | *((void *)v4 + 133))
  {
    if (!-[NSString isEqual:](powerSourceType, "isEqual:")) {
      goto LABEL_617;
    }
  }
  powerStateCaps = self->_powerStateCaps;
  if ((unint64_t)powerStateCaps | *((void *)v4 + 134))
  {
    if (!-[NSString isEqual:](powerStateCaps, "isEqual:")) {
      goto LABEL_617;
    }
  }
  systemActiveProcessorCount = self->_systemActiveProcessorCount;
  if ((unint64_t)systemActiveProcessorCount | *((void *)v4 + 135))
  {
    if (!-[NSString isEqual:](systemActiveProcessorCount, "isEqual:")) {
      goto LABEL_617;
    }
  }
  systemBatteryLevel = self->_systemBatteryLevel;
  if ((unint64_t)systemBatteryLevel | *((void *)v4 + 136))
  {
    if (!-[NSString isEqual:](systemBatteryLevel, "isEqual:")) {
      goto LABEL_617;
    }
  }
  systemBatteryState = self->_systemBatteryState;
  if ((unint64_t)systemBatteryState | *((void *)v4 + 137))
  {
    if (!-[NSString isEqual:](systemBatteryState, "isEqual:")) {
      goto LABEL_617;
    }
  }
  systemDeviceClass = self->_systemDeviceClass;
  if ((unint64_t)systemDeviceClass | *((void *)v4 + 138))
  {
    if (!-[NSString isEqual:](systemDeviceClass, "isEqual:")) {
      goto LABEL_617;
    }
  }
  systemDeviceModel = self->_systemDeviceModel;
  if ((unint64_t)systemDeviceModel | *((void *)v4 + 139))
  {
    if (!-[NSString isEqual:](systemDeviceModel, "isEqual:")) {
      goto LABEL_617;
    }
  }
  int v108 = *((_DWORD *)v4 + 421);
  if (*((unsigned char *)&self->_has + 2))
  {
    if ((v108 & 0x10000) == 0) {
      goto LABEL_617;
    }
    if (self->_systemLowPowerModeEnabled)
    {
      if (!*((unsigned char *)v4 + 1671)) {
        goto LABEL_617;
      }
    }
    else if (*((unsigned char *)v4 + 1671))
    {
      goto LABEL_617;
    }
  }
  else if ((v108 & 0x10000) != 0)
  {
    goto LABEL_617;
  }
  systemName = self->_systemName;
  if ((unint64_t)systemName | *((void *)v4 + 140)
    && !-[NSString isEqual:](systemName, "isEqual:"))
  {
    goto LABEL_617;
  }
  systemOsVariant = self->_systemOsVariant;
  if ((unint64_t)systemOsVariant | *((void *)v4 + 141))
  {
    if (!-[NSString isEqual:](systemOsVariant, "isEqual:")) {
      goto LABEL_617;
    }
  }
  systemPhysicalMemory = self->_systemPhysicalMemory;
  if ((unint64_t)systemPhysicalMemory | *((void *)v4 + 142))
  {
    if (!-[NSString isEqual:](systemPhysicalMemory, "isEqual:")) {
      goto LABEL_617;
    }
  }
  int v112 = *((_DWORD *)v4 + 421);
  if ((*((unsigned char *)&self->_has + 2) & 2) != 0)
  {
    if ((v112 & 0x20000) == 0) {
      goto LABEL_617;
    }
    if (self->_systemPowersourceConnected)
    {
      if (!*((unsigned char *)v4 + 1672)) {
        goto LABEL_617;
      }
    }
    else if (*((unsigned char *)v4 + 1672))
    {
      goto LABEL_617;
    }
  }
  else if ((v112 & 0x20000) != 0)
  {
    goto LABEL_617;
  }
  systemProcessorCount = self->_systemProcessorCount;
  if ((unint64_t)systemProcessorCount | *((void *)v4 + 143)
    && !-[NSString isEqual:](systemProcessorCount, "isEqual:"))
  {
    goto LABEL_617;
  }
  systemVersion = self->_systemVersion;
  if ((unint64_t)systemVersion | *((void *)v4 + 144))
  {
    if (!-[NSString isEqual:](systemVersion, "isEqual:")) {
      goto LABEL_617;
    }
  }
  uploadCdnPop = self->_uploadCdnPop;
  if ((unint64_t)uploadCdnPop | *((void *)v4 + 145))
  {
    if (!-[NSString isEqual:](uploadCdnPop, "isEqual:")) {
      goto LABEL_617;
    }
  }
  uploadCdnUuid = self->_uploadCdnUuid;
  if ((unint64_t)uploadCdnUuid | *((void *)v4 + 146))
  {
    if (!-[NSString isEqual:](uploadCdnUuid, "isEqual:")) {
      goto LABEL_617;
    }
  }
  uploadConnectionTime = self->_uploadConnectionTime;
  if ((unint64_t)uploadConnectionTime | *((void *)v4 + 147))
  {
    if (!-[NSString isEqual:](uploadConnectionTime, "isEqual:")) {
      goto LABEL_617;
    }
  }
  uploadDomainLookupTime = self->_uploadDomainLookupTime;
  if ((unint64_t)uploadDomainLookupTime | *((void *)v4 + 148))
  {
    if (!-[NSString isEqual:](uploadDomainLookupTime, "isEqual:")) {
      goto LABEL_617;
    }
  }
  uploadEndDataBearerTechnology = self->_uploadEndDataBearerTechnology;
  if ((unint64_t)uploadEndDataBearerTechnology | *((void *)v4 + 150))
  {
    if (!-[NSString isEqual:](uploadEndDataBearerTechnology, "isEqual:")) {
      goto LABEL_617;
    }
  }
  uploadEndPrimaryIpv4Interface = self->_uploadEndPrimaryIpv4Interface;
  if ((unint64_t)uploadEndPrimaryIpv4Interface | *((void *)v4 + 151))
  {
    if (!-[NSString isEqual:](uploadEndPrimaryIpv4Interface, "isEqual:")) {
      goto LABEL_617;
    }
  }
  uploadEndRat = self->_uploadEndRat;
  if ((unint64_t)uploadEndRat | *((void *)v4 + 153))
  {
    if (!-[NSString isEqual:](uploadEndRat, "isEqual:")) {
      goto LABEL_617;
    }
  }
  uploadFileSize = self->_uploadFileSize;
  if ((unint64_t)uploadFileSize | *((void *)v4 + 157))
  {
    if (!-[NSString isEqual:](uploadFileSize, "isEqual:")) {
      goto LABEL_617;
    }
  }
  uploadInterfaceName = self->_uploadInterfaceName;
  if ((unint64_t)uploadInterfaceName | *((void *)v4 + 158))
  {
    if (!-[NSString isEqual:](uploadInterfaceName, "isEqual:")) {
      goto LABEL_617;
    }
  }
  uploadInterfaceServiceName = self->_uploadInterfaceServiceName;
  if ((unint64_t)uploadInterfaceServiceName | *((void *)v4 + 159))
  {
    if (!-[NSString isEqual:](uploadInterfaceServiceName, "isEqual:")) {
      goto LABEL_617;
    }
  }
  $0FF3A8E67B3D88A75EBF7BE240CB1B75 v125 = self->_has;
  int v126 = *((_DWORD *)v4 + 421);
  if ((*(_DWORD *)&v125 & 0x40000) != 0)
  {
    if ((v126 & 0x40000) == 0) {
      goto LABEL_617;
    }
    if (self->_uploadIsCellular)
    {
      if (!*((unsigned char *)v4 + 1673)) {
        goto LABEL_617;
      }
    }
    else if (*((unsigned char *)v4 + 1673))
    {
      goto LABEL_617;
    }
  }
  else if ((v126 & 0x40000) != 0)
  {
    goto LABEL_617;
  }
  if ((*(_DWORD *)&v125 & 0x80000) != 0)
  {
    if ((v126 & 0x80000) == 0) {
      goto LABEL_617;
    }
    if (self->_uploadIsConstrained)
    {
      if (!*((unsigned char *)v4 + 1674)) {
        goto LABEL_617;
      }
    }
    else if (*((unsigned char *)v4 + 1674))
    {
      goto LABEL_617;
    }
  }
  else if ((v126 & 0x80000) != 0)
  {
    goto LABEL_617;
  }
  if ((*(_DWORD *)&v125 & 0x100000) != 0)
  {
    if ((v126 & 0x100000) == 0) {
      goto LABEL_617;
    }
    if (self->_uploadIsExpensive)
    {
      if (!*((unsigned char *)v4 + 1675)) {
        goto LABEL_617;
      }
    }
    else if (*((unsigned char *)v4 + 1675))
    {
      goto LABEL_617;
    }
  }
  else if ((v126 & 0x100000) != 0)
  {
    goto LABEL_617;
  }
  if ((*(_DWORD *)&v125 & 0x200000) != 0)
  {
    if ((v126 & 0x200000) == 0) {
      goto LABEL_617;
    }
    if (self->_uploadIsMultipath)
    {
      if (!*((unsigned char *)v4 + 1676)) {
        goto LABEL_617;
      }
    }
    else if (*((unsigned char *)v4 + 1676))
    {
      goto LABEL_617;
    }
  }
  else if ((v126 & 0x200000) != 0)
  {
    goto LABEL_617;
  }
  if ((*(_DWORD *)&v125 & 0x400000) != 0)
  {
    if ((v126 & 0x400000) == 0) {
      goto LABEL_617;
    }
    if (self->_uploadIsProxyConnection)
    {
      if (!*((unsigned char *)v4 + 1677)) {
        goto LABEL_617;
      }
    }
    else if (*((unsigned char *)v4 + 1677))
    {
      goto LABEL_617;
    }
  }
  else if ((v126 & 0x400000) != 0)
  {
    goto LABEL_617;
  }
  if ((*(_DWORD *)&v125 & 0x800000) != 0)
  {
    if ((v126 & 0x800000) == 0) {
      goto LABEL_617;
    }
    if (self->_uploadIsReusedConnection)
    {
      if (!*((unsigned char *)v4 + 1678)) {
        goto LABEL_617;
      }
    }
    else if (*((unsigned char *)v4 + 1678))
    {
      goto LABEL_617;
    }
  }
  else if ((v126 & 0x800000) != 0)
  {
    goto LABEL_617;
  }
  uploadMaxSpeedObserved = self->_uploadMaxSpeedObserved;
  if ((unint64_t)uploadMaxSpeedObserved | *((void *)v4 + 161)
    && !-[NSString isEqual:](uploadMaxSpeedObserved, "isEqual:"))
  {
    goto LABEL_617;
  }
  uploadNumberOfStreams = self->_uploadNumberOfStreams;
  if ((unint64_t)uploadNumberOfStreams | *((void *)v4 + 162))
  {
    if (!-[NSString isEqual:](uploadNumberOfStreams, "isEqual:")) {
      goto LABEL_617;
    }
  }
  uploadProtocolName = self->_uploadProtocolName;
  if ((unint64_t)uploadProtocolName | *((void *)v4 + 163))
  {
    if (!-[NSString isEqual:](uploadProtocolName, "isEqual:")) {
      goto LABEL_617;
    }
  }
  uploadRemoteAddress = self->_uploadRemoteAddress;
  if ((unint64_t)uploadRemoteAddress | *((void *)v4 + 164))
  {
    if (!-[NSString isEqual:](uploadRemoteAddress, "isEqual:")) {
      goto LABEL_617;
    }
  }
  uploadRemotePort = self->_uploadRemotePort;
  if ((unint64_t)uploadRemotePort | *((void *)v4 + 165))
  {
    if (!-[NSString isEqual:](uploadRemotePort, "isEqual:")) {
      goto LABEL_617;
    }
  }
  uploadRequestTime = self->_uploadRequestTime;
  if ((unint64_t)uploadRequestTime | *((void *)v4 + 166))
  {
    if (!-[NSString isEqual:](uploadRequestTime, "isEqual:")) {
      goto LABEL_617;
    }
  }
  uploadRequestToResponseTime = self->_uploadRequestToResponseTime;
  if ((unint64_t)uploadRequestToResponseTime | *((void *)v4 + 167))
  {
    if (!-[NSString isEqual:](uploadRequestToResponseTime, "isEqual:")) {
      goto LABEL_617;
    }
  }
  uploadResponseTime = self->_uploadResponseTime;
  if ((unint64_t)uploadResponseTime | *((void *)v4 + 168))
  {
    if (!-[NSString isEqual:](uploadResponseTime, "isEqual:")) {
      goto LABEL_617;
    }
  }
  uploadSecureConnectionTime = self->_uploadSecureConnectionTime;
  if ((unint64_t)uploadSecureConnectionTime | *((void *)v4 + 172))
  {
    if (!-[NSString isEqual:](uploadSecureConnectionTime, "isEqual:")) {
      goto LABEL_617;
    }
  }
  uploadServer = self->_uploadServer;
  if ((unint64_t)uploadServer | *((void *)v4 + 173))
  {
    if (!-[NSString isEqual:](uploadServer, "isEqual:")) {
      goto LABEL_617;
    }
  }
  uploadSpeed = self->_uploadSpeed;
  if ((unint64_t)uploadSpeed | *((void *)v4 + 174))
  {
    if (!-[NSString isEqual:](uploadSpeed, "isEqual:")) {
      goto LABEL_617;
    }
  }
  uploadStableSpeed = self->_uploadStableSpeed;
  if ((unint64_t)uploadStableSpeed | *((void *)v4 + 177))
  {
    if (!-[NSString isEqual:](uploadStableSpeed, "isEqual:")) {
      goto LABEL_617;
    }
  }
  uploadStartDataBearerTechnology = self->_uploadStartDataBearerTechnology;
  if ((unint64_t)uploadStartDataBearerTechnology | *((void *)v4 + 179))
  {
    if (!-[NSString isEqual:](uploadStartDataBearerTechnology, "isEqual:")) {
      goto LABEL_617;
    }
  }
  uploadStartPrimaryIpv4Interface = self->_uploadStartPrimaryIpv4Interface;
  if ((unint64_t)uploadStartPrimaryIpv4Interface | *((void *)v4 + 180))
  {
    if (!-[NSString isEqual:](uploadStartPrimaryIpv4Interface, "isEqual:")) {
      goto LABEL_617;
    }
  }
  uploadStartRat = self->_uploadStartRat;
  if ((unint64_t)uploadStartRat | *((void *)v4 + 182))
  {
    if (!-[NSString isEqual:](uploadStartRat, "isEqual:")) {
      goto LABEL_617;
    }
  }
  int v142 = *((_DWORD *)v4 + 421);
  if (*((unsigned char *)&self->_has + 3))
  {
    if ((v142 & 0x1000000) == 0) {
      goto LABEL_617;
    }
    if (self->_useWifiWasSpecified)
    {
      if (!*((unsigned char *)v4 + 1679)) {
        goto LABEL_617;
      }
    }
    else if (*((unsigned char *)v4 + 1679))
    {
      goto LABEL_617;
    }
  }
  else if ((v142 & 0x1000000) != 0)
  {
    goto LABEL_617;
  }
  wifiAveragePhyRateRx = self->_wifiAveragePhyRateRx;
  if ((unint64_t)wifiAveragePhyRateRx | *((void *)v4 + 184)
    && !-[NSString isEqual:](wifiAveragePhyRateRx, "isEqual:"))
  {
    goto LABEL_617;
  }
  wifiAverageRssi = self->_wifiAverageRssi;
  if ((unint64_t)wifiAverageRssi | *((void *)v4 + 185))
  {
    if (!-[NSString isEqual:](wifiAverageRssi, "isEqual:")) {
      goto LABEL_617;
    }
  }
  wifiAverageSnr = self->_wifiAverageSnr;
  if ((unint64_t)wifiAverageSnr | *((void *)v4 + 186))
  {
    if (!-[NSString isEqual:](wifiAverageSnr, "isEqual:")) {
      goto LABEL_617;
    }
  }
  wifiAverageTcpRtt = self->_wifiAverageTcpRtt;
  if ((unint64_t)wifiAverageTcpRtt | *((void *)v4 + 187))
  {
    if (!-[NSString isEqual:](wifiAverageTcpRtt, "isEqual:")) {
      goto LABEL_617;
    }
  }
  wifiBtcMode = self->_wifiBtcMode;
  if ((unint64_t)wifiBtcMode | *((void *)v4 + 188))
  {
    if (!-[NSString isEqual:](wifiBtcMode, "isEqual:")) {
      goto LABEL_617;
    }
  }
  wifiCca = self->_wifiCca;
  if ((unint64_t)wifiCca | *((void *)v4 + 189))
  {
    if (!-[NSString isEqual:](wifiCca, "isEqual:")) {
      goto LABEL_617;
    }
  }
  wifiChannel = self->_wifiChannel;
  if ((unint64_t)wifiChannel | *((void *)v4 + 190))
  {
    if (!-[NSString isEqual:](wifiChannel, "isEqual:")) {
      goto LABEL_617;
    }
  }
  wifiCwfCca = self->_wifiCwfCca;
  if ((unint64_t)wifiCwfCca | *((void *)v4 + 193))
  {
    if (!-[NSString isEqual:](wifiCwfCca, "isEqual:")) {
      goto LABEL_617;
    }
  }
  wifiEapolControlMode = self->_wifiEapolControlMode;
  if ((unint64_t)wifiEapolControlMode | *((void *)v4 + 194))
  {
    if (!-[NSString isEqual:](wifiEapolControlMode, "isEqual:")) {
      goto LABEL_617;
    }
  }
  wifiEapolSupplicantState = self->_wifiEapolSupplicantState;
  if ((unint64_t)wifiEapolSupplicantState | *((void *)v4 + 195))
  {
    if (!-[NSString isEqual:](wifiEapolSupplicantState, "isEqual:")) {
      goto LABEL_617;
    }
  }
  wifiGuardInterval = self->_wifiGuardInterval;
  if ((unint64_t)wifiGuardInterval | *((void *)v4 + 196))
  {
    if (!-[NSString isEqual:](wifiGuardInterval, "isEqual:")) {
      goto LABEL_617;
    }
  }
  wifiHiddenState = self->_wifiHiddenState;
  if ((unint64_t)wifiHiddenState | *((void *)v4 + 197))
  {
    if (!-[NSString isEqual:](wifiHiddenState, "isEqual:")) {
      goto LABEL_617;
    }
  }
  int v155 = *((_DWORD *)v4 + 421);
  if ((*((unsigned char *)&self->_has + 3) & 2) != 0)
  {
    if ((v155 & 0x2000000) == 0) {
      goto LABEL_617;
    }
    if (self->_wifiIsCaptive)
    {
      if (!*((unsigned char *)v4 + 1680)) {
        goto LABEL_617;
      }
    }
    else if (*((unsigned char *)v4 + 1680))
    {
      goto LABEL_617;
    }
  }
  else if ((v155 & 0x2000000) != 0)
  {
    goto LABEL_617;
  }
  wifiMcsIndex = self->_wifiMcsIndex;
  if ((unint64_t)wifiMcsIndex | *((void *)v4 + 198)
    && !-[NSString isEqual:](wifiMcsIndex, "isEqual:"))
  {
    goto LABEL_617;
  }
  wifiNoise = self->_wifiNoise;
  if ((unint64_t)wifiNoise | *((void *)v4 + 199))
  {
    if (!-[NSString isEqual:](wifiNoise, "isEqual:")) {
      goto LABEL_617;
    }
  }
  wifiNumberOfSpatialStreams = self->_wifiNumberOfSpatialStreams;
  if ((unint64_t)wifiNumberOfSpatialStreams | *((void *)v4 + 200))
  {
    if (!-[NSString isEqual:](wifiNumberOfSpatialStreams, "isEqual:")) {
      goto LABEL_617;
    }
  }
  wifiOpMode = self->_wifiOpMode;
  if ((unint64_t)wifiOpMode | *((void *)v4 + 201))
  {
    if (!-[NSString isEqual:](wifiOpMode, "isEqual:")) {
      goto LABEL_617;
    }
  }
  wifiPhyMode = self->_wifiPhyMode;
  if ((unint64_t)wifiPhyMode | *((void *)v4 + 202))
  {
    if (!-[NSString isEqual:](wifiPhyMode, "isEqual:")) {
      goto LABEL_617;
    }
  }
  wifiRssi = self->_wifiRssi;
  if ((unint64_t)wifiRssi | *((void *)v4 + 203))
  {
    if (!-[NSString isEqual:](wifiRssi, "isEqual:")) {
      goto LABEL_617;
    }
  }
  wifiSecurity = self->_wifiSecurity;
  if ((unint64_t)wifiSecurity | *((void *)v4 + 204))
  {
    if (!-[NSString isEqual:](wifiSecurity, "isEqual:")) {
      goto LABEL_617;
    }
  }
  wifiTxRate = self->_wifiTxRate;
  if ((unint64_t)wifiTxRate | *((void *)v4 + 205))
  {
    if (!-[NSString isEqual:](wifiTxRate, "isEqual:")) {
      goto LABEL_617;
    }
  }
  wrmChannelType = self->_wrmChannelType;
  if ((unint64_t)wrmChannelType | *((void *)v4 + 206))
  {
    if (!-[NSString isEqual:](wrmChannelType, "isEqual:")) {
      goto LABEL_617;
    }
  }
  cellularCellid = self->_cellularCellid;
  if ((unint64_t)cellularCellid | *((void *)v4 + 18))
  {
    if (!-[NSString isEqual:](cellularCellid, "isEqual:")) {
      goto LABEL_617;
    }
  }
  int v166 = *((_DWORD *)v4 + 421);
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((v166 & 2) == 0) {
      goto LABEL_617;
    }
    if (self->_acceptablePerformanceResult)
    {
      if (!*((unsigned char *)v4 + 1656)) {
        goto LABEL_617;
      }
    }
    else if (*((unsigned char *)v4 + 1656))
    {
      goto LABEL_617;
    }
  }
  else if ((v166 & 2) != 0)
  {
    goto LABEL_617;
  }
  networkQualityResponsiveness = self->_networkQualityResponsiveness;
  if ((unint64_t)networkQualityResponsiveness | *((void *)v4 + 119)
    && !-[NSString isEqual:](networkQualityResponsiveness, "isEqual:"))
  {
    goto LABEL_617;
  }
  cellularAggregatedDLBW = self->_cellularAggregatedDLBW;
  if ((unint64_t)cellularAggregatedDLBW | *((void *)v4 + 12))
  {
    if (!-[NSString isEqual:](cellularAggregatedDLBW, "isEqual:")) {
      goto LABEL_617;
    }
  }
  cellularAggregatedULBW = self->_cellularAggregatedULBW;
  if ((unint64_t)cellularAggregatedULBW | *((void *)v4 + 13))
  {
    if (!-[NSString isEqual:](cellularAggregatedULBW, "isEqual:")) {
      goto LABEL_617;
    }
  }
  cellularIssa = self->_cellularIssa;
  if ((unint64_t)cellularIssa | *((void *)v4 + 27))
  {
    if (!-[NSString isEqual:](cellularIssa, "isEqual:")) {
      goto LABEL_617;
    }
  }
  cellularLac = self->_cellularLac;
  if ((unint64_t)cellularLac | *((void *)v4 + 28))
  {
    if (!-[NSString isEqual:](cellularLac, "isEqual:")) {
      goto LABEL_617;
    }
  }
  cellularLteNrConfiguredBw = self->_cellularLteNrConfiguredBw;
  if ((unint64_t)cellularLteNrConfiguredBw | *((void *)v4 + 31))
  {
    if (!-[NSString isEqual:](cellularLteNrConfiguredBw, "isEqual:")) {
      goto LABEL_617;
    }
  }
  cellularMaxDlMod = self->_cellularMaxDlMod;
  if ((unint64_t)cellularMaxDlMod | *((void *)v4 + 32))
  {
    if (!-[NSString isEqual:](cellularMaxDlMod, "isEqual:")) {
      goto LABEL_617;
    }
  }
  cellularMaxNwMimoLyr = self->_cellularMaxNwMimoLyr;
  if ((unint64_t)cellularMaxNwMimoLyr | *((void *)v4 + 33))
  {
    if (!-[NSString isEqual:](cellularMaxNwMimoLyr, "isEqual:")) {
      goto LABEL_617;
    }
  }
  cellularMaxSchdMimoLyr = self->_cellularMaxSchdMimoLyr;
  if ((unint64_t)cellularMaxSchdMimoLyr | *((void *)v4 + 34))
  {
    if (!-[NSString isEqual:](cellularMaxSchdMimoLyr, "isEqual:")) {
      goto LABEL_617;
    }
  }
  cellularMaxUeRank = self->_cellularMaxUeRank;
  if ((unint64_t)cellularMaxUeRank | *((void *)v4 + 35))
  {
    if (!-[NSString isEqual:](cellularMaxUeRank, "isEqual:")) {
      goto LABEL_617;
    }
  }
  cellularMaxUlMod = self->_cellularMaxUlMod;
  if ((unint64_t)cellularMaxUlMod | *((void *)v4 + 36))
  {
    if (!-[NSString isEqual:](cellularMaxUlMod, "isEqual:")) {
      goto LABEL_617;
    }
  }
  cellularNrSinr = self->_cellularNrSinr;
  if ((unint64_t)cellularNrSinr | *((void *)v4 + 52))
  {
    if (!-[NSString isEqual:](cellularNrSinr, "isEqual:")) {
      goto LABEL_617;
    }
  }
  cellularNrarfcn = self->_cellularNrarfcn;
  if ((unint64_t)cellularNrarfcn | *((void *)v4 + 54))
  {
    if (!-[NSString isEqual:](cellularNrarfcn, "isEqual:")) {
      goto LABEL_617;
    }
  }
  cellularRadioFrequency = self->_cellularRadioFrequency;
  if ((unint64_t)cellularRadioFrequency | *((void *)v4 + 58))
  {
    if (!-[NSString isEqual:](cellularRadioFrequency, "isEqual:")) {
      goto LABEL_617;
    }
  }
  cellularTotalDlMimoLayers = self->_cellularTotalDlMimoLayers;
  if ((unint64_t)cellularTotalDlMimoLayers | *((void *)v4 + 68))
  {
    if (!-[NSString isEqual:](cellularTotalDlMimoLayers, "isEqual:")) {
      goto LABEL_617;
    }
  }
  cellularTotalNumCcs = self->_cellularTotalNumCcs;
  if ((unint64_t)cellularTotalNumCcs | *((void *)v4 + 70))
  {
    if (!-[NSString isEqual:](cellularTotalNumCcs, "isEqual:")) {
      goto LABEL_617;
    }
  }
  downloadStartRadioFrequency = self->_downloadStartRadioFrequency;
  if ((unint64_t)downloadStartRadioFrequency | *((void *)v4 + 108))
  {
    if (!-[NSString isEqual:](downloadStartRadioFrequency, "isEqual:")) {
      goto LABEL_617;
    }
  }
  downloadEndRadioFrequency = self->_downloadEndRadioFrequency;
  if ((unint64_t)downloadEndRadioFrequency | *((void *)v4 + 79))
  {
    if (!-[NSString isEqual:](downloadEndRadioFrequency, "isEqual:")) {
      goto LABEL_617;
    }
  }
  networkPrimaryIpv6InterfaceName = self->_networkPrimaryIpv6InterfaceName;
  if ((unint64_t)networkPrimaryIpv6InterfaceName | *((void *)v4 + 112))
  {
    if (!-[NSString isEqual:](networkPrimaryIpv6InterfaceName, "isEqual:")) {
      goto LABEL_617;
    }
  }
  networkPrimaryIpv6ServiceName = self->_networkPrimaryIpv6ServiceName;
  if ((unint64_t)networkPrimaryIpv6ServiceName | *((void *)v4 + 113))
  {
    if (!-[NSString isEqual:](networkPrimaryIpv6ServiceName, "isEqual:")) {
      goto LABEL_617;
    }
  }
  uploadStartRadioFrequency = self->_uploadStartRadioFrequency;
  if ((unint64_t)uploadStartRadioFrequency | *((void *)v4 + 181))
  {
    if (!-[NSString isEqual:](uploadStartRadioFrequency, "isEqual:")) {
      goto LABEL_617;
    }
  }
  uploadEndRadioFrequency = self->_uploadEndRadioFrequency;
  if ((unint64_t)uploadEndRadioFrequency | *((void *)v4 + 152))
  {
    if (!-[NSString isEqual:](uploadEndRadioFrequency, "isEqual:")) {
      goto LABEL_617;
    }
  }
  downloadError = self->_downloadError;
  if ((unint64_t)downloadError | *((void *)v4 + 81))
  {
    if (!-[NSString isEqual:](downloadError, "isEqual:")) {
      goto LABEL_617;
    }
  }
  networkQualityError = self->_networkQualityError;
  if ((unint64_t)networkQualityError | *((void *)v4 + 115))
  {
    if (!-[NSString isEqual:](networkQualityError, "isEqual:")) {
      goto LABEL_617;
    }
  }
  networkQualityDownloadSpeed = self->_networkQualityDownloadSpeed;
  if ((unint64_t)networkQualityDownloadSpeed | *((void *)v4 + 114))
  {
    if (!-[NSString isEqual:](networkQualityDownloadSpeed, "isEqual:")) {
      goto LABEL_617;
    }
  }
  networkQualityUploadSpeed = self->_networkQualityUploadSpeed;
  if ((unint64_t)networkQualityUploadSpeed | *((void *)v4 + 120))
  {
    if (!-[NSString isEqual:](networkQualityUploadSpeed, "isEqual:")) {
      goto LABEL_617;
    }
  }
  networkQualityRating = self->_networkQualityRating;
  if ((unint64_t)networkQualityRating | *((void *)v4 + 118))
  {
    if (!-[NSString isEqual:](networkQualityRating, "isEqual:")) {
      goto LABEL_617;
    }
  }
  vpnConnectionState = self->_vpnConnectionState;
  if ((unint64_t)vpnConnectionState | *((void *)v4 + 183))
  {
    if (!-[NSString isEqual:](vpnConnectionState, "isEqual:")) {
      goto LABEL_617;
    }
  }
  uploadError = self->_uploadError;
  if ((unint64_t)uploadError | *((void *)v4 + 154))
  {
    if (!-[NSString isEqual:](uploadError, "isEqual:")) {
      goto LABEL_617;
    }
  }
  uploadErrorDomain = self->_uploadErrorDomain;
  if ((unint64_t)uploadErrorDomain | *((void *)v4 + 156))
  {
    if (!-[NSString isEqual:](uploadErrorDomain, "isEqual:")) {
      goto LABEL_617;
    }
  }
  uploadErrorCode = self->_uploadErrorCode;
  if ((unint64_t)uploadErrorCode | *((void *)v4 + 155))
  {
    if (!-[NSString isEqual:](uploadErrorCode, "isEqual:")) {
      goto LABEL_617;
    }
  }
  downloadErrorDomain = self->_downloadErrorDomain;
  if ((unint64_t)downloadErrorDomain | *((void *)v4 + 83))
  {
    if (!-[NSString isEqual:](downloadErrorDomain, "isEqual:")) {
      goto LABEL_617;
    }
  }
  downloadErrorCode = self->_downloadErrorCode;
  if ((unint64_t)downloadErrorCode | *((void *)v4 + 82))
  {
    if (!-[NSString isEqual:](downloadErrorCode, "isEqual:")) {
      goto LABEL_617;
    }
  }
  pingError = self->_pingError;
  if ((unint64_t)pingError | *((void *)v4 + 124))
  {
    if (!-[NSString isEqual:](pingError, "isEqual:")) {
      goto LABEL_617;
    }
  }
  pingErrorDomain = self->_pingErrorDomain;
  if ((unint64_t)pingErrorDomain | *((void *)v4 + 126))
  {
    if (!-[NSString isEqual:](pingErrorDomain, "isEqual:")) {
      goto LABEL_617;
    }
  }
  pingErrorCode = self->_pingErrorCode;
  if ((unint64_t)pingErrorCode | *((void *)v4 + 125))
  {
    if (!-[NSString isEqual:](pingErrorCode, "isEqual:")) {
      goto LABEL_617;
    }
  }
  networkQualityErrorDomain = self->_networkQualityErrorDomain;
  if ((unint64_t)networkQualityErrorDomain | *((void *)v4 + 117))
  {
    if (!-[NSString isEqual:](networkQualityErrorDomain, "isEqual:")) {
      goto LABEL_617;
    }
  }
  networkQualityErrorCode = self->_networkQualityErrorCode;
  if ((unint64_t)networkQualityErrorCode | *((void *)v4 + 116))
  {
    if (!-[NSString isEqual:](networkQualityErrorCode, "isEqual:")) {
      goto LABEL_617;
    }
  }
  cellularRnMobileCountryCode = self->_cellularRnMobileCountryCode;
  if ((unint64_t)cellularRnMobileCountryCode | *((void *)v4 + 59))
  {
    if (!-[NSString isEqual:](cellularRnMobileCountryCode, "isEqual:")) {
      goto LABEL_617;
    }
  }
  cellularRnMobileNetworkCode = self->_cellularRnMobileNetworkCode;
  if ((unint64_t)cellularRnMobileNetworkCode | *((void *)v4 + 60))
  {
    if (!-[NSString isEqual:](cellularRnMobileNetworkCode, "isEqual:")) {
      goto LABEL_617;
    }
  }
  int v207 = *((_DWORD *)v4 + 421);
  if (*((unsigned char *)&self->_has + 1))
  {
    if ((v207 & 0x100) != 0)
    {
      if (self->_cellularDataIsEnabled)
      {
        if (!*((unsigned char *)v4 + 1663)) {
          goto LABEL_617;
        }
        goto LABEL_581;
      }
      if (!*((unsigned char *)v4 + 1663)) {
        goto LABEL_581;
      }
    }
LABEL_617:
    char v226 = 0;
    goto LABEL_618;
  }
  if ((v207 & 0x100) != 0) {
    goto LABEL_617;
  }
LABEL_581:
  downloadStartCellularEstimate = self->_downloadStartCellularEstimate;
  if ((unint64_t)downloadStartCellularEstimate | *((void *)v4 + 105)
    && !-[NSString isEqual:](downloadStartCellularEstimate, "isEqual:"))
  {
    goto LABEL_617;
  }
  downloadEndCellularEstimate = self->_downloadEndCellularEstimate;
  if ((unint64_t)downloadEndCellularEstimate | *((void *)v4 + 76))
  {
    if (!-[NSString isEqual:](downloadEndCellularEstimate, "isEqual:")) {
      goto LABEL_617;
    }
  }
  downloadMaxCellularEstimate = self->_downloadMaxCellularEstimate;
  if ((unint64_t)downloadMaxCellularEstimate | *((void *)v4 + 87))
  {
    if (!-[NSString isEqual:](downloadMaxCellularEstimate, "isEqual:")) {
      goto LABEL_617;
    }
  }
  uploadStartCellularEstimate = self->_uploadStartCellularEstimate;
  if ((unint64_t)uploadStartCellularEstimate | *((void *)v4 + 178))
  {
    if (!-[NSString isEqual:](uploadStartCellularEstimate, "isEqual:")) {
      goto LABEL_617;
    }
  }
  uploadEndCellularEstimate = self->_uploadEndCellularEstimate;
  if ((unint64_t)uploadEndCellularEstimate | *((void *)v4 + 149))
  {
    if (!-[NSString isEqual:](uploadEndCellularEstimate, "isEqual:")) {
      goto LABEL_617;
    }
  }
  uploadMaxCellularEstimate = self->_uploadMaxCellularEstimate;
  if ((unint64_t)uploadMaxCellularEstimate | *((void *)v4 + 160))
  {
    if (!-[NSString isEqual:](uploadMaxCellularEstimate, "isEqual:")) {
      goto LABEL_617;
    }
  }
  downloadResponsiveness = self->_downloadResponsiveness;
  if ((unint64_t)downloadResponsiveness | *((void *)v4 + 96))
  {
    if (!-[NSString isEqual:](downloadResponsiveness, "isEqual:")) {
      goto LABEL_617;
    }
  }
  downloadResponsivenessConfidence = self->_downloadResponsivenessConfidence;
  if ((unint64_t)downloadResponsivenessConfidence | *((void *)v4 + 97))
  {
    if (!-[NSString isEqual:](downloadResponsivenessConfidence, "isEqual:")) {
      goto LABEL_617;
    }
  }
  downloadResponsivenessRating = self->_downloadResponsivenessRating;
  if ((unint64_t)downloadResponsivenessRating | *((void *)v4 + 98))
  {
    if (!-[NSString isEqual:](downloadResponsivenessRating, "isEqual:")) {
      goto LABEL_617;
    }
  }
  downloadSpeedConfidence = self->_downloadSpeedConfidence;
  if ((unint64_t)downloadSpeedConfidence | *((void *)v4 + 102))
  {
    if (!-[NSString isEqual:](downloadSpeedConfidence, "isEqual:")) {
      goto LABEL_617;
    }
  }
  downloadSpeedRating = self->_downloadSpeedRating;
  if ((unint64_t)downloadSpeedRating | *((void *)v4 + 103))
  {
    if (!-[NSString isEqual:](downloadSpeedRating, "isEqual:")) {
      goto LABEL_617;
    }
  }
  uploadResponsiveness = self->_uploadResponsiveness;
  if ((unint64_t)uploadResponsiveness | *((void *)v4 + 169))
  {
    if (!-[NSString isEqual:](uploadResponsiveness, "isEqual:")) {
      goto LABEL_617;
    }
  }
  uploadResponsivenessConfidence = self->_uploadResponsivenessConfidence;
  if ((unint64_t)uploadResponsivenessConfidence | *((void *)v4 + 170))
  {
    if (!-[NSString isEqual:](uploadResponsivenessConfidence, "isEqual:")) {
      goto LABEL_617;
    }
  }
  uploadResponsivenessRating = self->_uploadResponsivenessRating;
  if ((unint64_t)uploadResponsivenessRating | *((void *)v4 + 171))
  {
    if (!-[NSString isEqual:](uploadResponsivenessRating, "isEqual:")) {
      goto LABEL_617;
    }
  }
  uploadSpeedConfidence = self->_uploadSpeedConfidence;
  if ((unint64_t)uploadSpeedConfidence | *((void *)v4 + 175))
  {
    if (!-[NSString isEqual:](uploadSpeedConfidence, "isEqual:")) {
      goto LABEL_617;
    }
  }
  uploadSpeedRating = self->_uploadSpeedRating;
  if ((unint64_t)uploadSpeedRating | *((void *)v4 + 176))
  {
    if (!-[NSString isEqual:](uploadSpeedRating, "isEqual:")) {
      goto LABEL_617;
    }
  }
  wifiChannelBand = self->_wifiChannelBand;
  if ((unint64_t)wifiChannelBand | *((void *)v4 + 191))
  {
    if (!-[NSString isEqual:](wifiChannelBand, "isEqual:")) {
      goto LABEL_617;
    }
  }
  wifiChannelWidth = self->_wifiChannelWidth;
  if ((unint64_t)wifiChannelWidth | *((void *)v4 + 192)) {
    char v226 = -[NSString isEqual:](wifiChannelWidth, "isEqual:");
  }
  else {
    char v226 = 1;
  }
LABEL_618:

  return v226;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    unint64_t v238 = 2654435761u * self->_timestamp;
  }
  else {
    unint64_t v238 = 0;
  }
  NSUInteger v237 = [(NSString *)self->_awdlElectionParameters hash];
  NSUInteger v236 = [(NSString *)self->_awdlMasterChannel hash];
  NSUInteger v235 = [(NSString *)self->_awdlOpMode hash];
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    uint64_t v234 = 2654435761 * self->_awdlPowerState;
  }
  else {
    uint64_t v234 = 0;
  }
  NSUInteger v233 = [(NSString *)self->_awdlSchedule hash];
  NSUInteger v232 = [(NSString *)self->_awdlSecondaryMasterChannel hash];
  NSUInteger v231 = [(NSString *)self->_awdlSyncChannelSequence hash];
  NSUInteger v230 = [(NSString *)self->_awdlSyncState hash];
  NSUInteger v229 = [(NSString *)self->_btConnectedDevicesCount hash];
  $0FF3A8E67B3D88A75EBF7BE240CB1B75 has = self->_has;
  if ((*(unsigned char *)&has & 8) != 0)
  {
    uint64_t v228 = 2654435761 * self->_btIsConnectable;
    if ((*(unsigned char *)&has & 0x10) != 0)
    {
LABEL_9:
      uint64_t v227 = 2654435761 * self->_btIsDiscoverable;
      if ((*(unsigned char *)&has & 0x20) != 0) {
        goto LABEL_10;
      }
LABEL_14:
      uint64_t v226 = 0;
      if ((*(unsigned char *)&has & 0x40) != 0) {
        goto LABEL_11;
      }
      goto LABEL_15;
    }
  }
  else
  {
    uint64_t v228 = 0;
    if ((*(unsigned char *)&has & 0x10) != 0) {
      goto LABEL_9;
    }
  }
  uint64_t v227 = 0;
  if ((*(unsigned char *)&has & 0x20) == 0) {
    goto LABEL_14;
  }
LABEL_10:
  uint64_t v226 = 2654435761 * self->_btIsPowerOn;
  if ((*(unsigned char *)&has & 0x40) != 0)
  {
LABEL_11:
    uint64_t v225 = 2654435761 * self->_btIsScanning;
    goto LABEL_16;
  }
LABEL_15:
  uint64_t v225 = 0;
LABEL_16:
  NSUInteger v224 = [(NSString *)self->_callingClient hash];
  NSUInteger v223 = [(NSString *)self->_cellularActiveContexts hash];
  if ((*(unsigned char *)&self->_has & 0x80) != 0) {
    uint64_t v222 = 2654435761 * self->_cellularAllowsVoip;
  }
  else {
    uint64_t v222 = 0;
  }
  NSUInteger v221 = [(NSString *)self->_cellularAttached hash];
  NSUInteger v220 = [(NSString *)self->_cellularBandinfo hash];
  NSUInteger v219 = [(NSString *)self->_cellularBandwidth hash];
  NSUInteger v218 = [(NSString *)self->_cellularCarrierName hash];
  NSUInteger v217 = [(NSString *)self->_cellularDataBearerSoMask hash];
  NSUInteger v216 = [(NSString *)self->_cellularDataBearerTechnology hash];
  NSUInteger v215 = [(NSString *)self->_cellularDataPlanSignalingReductionOverride hash];
  NSUInteger v214 = [(NSString *)self->_cellularDataPossible hash];
  NSUInteger v213 = [(NSString *)self->_cellularInHomeCountry hash];
  NSUInteger v212 = [(NSString *)self->_cellularIndicator hash];
  NSUInteger v211 = [(NSString *)self->_cellularIndicatorOverride hash];
  NSUInteger v210 = [(NSString *)self->_cellularIsoCountryCode hash];
  NSUInteger v209 = [(NSString *)self->_cellularLqm hash];
  NSUInteger v208 = [(NSString *)self->_cellularLteMaxScheduledLayers hash];
  NSUInteger v207 = [(NSString *)self->_cellularMobileCountryCode hash];
  NSUInteger v206 = [(NSString *)self->_cellularMobileNetworkCode hash];
  NSUInteger v205 = [(NSString *)self->_cellularNewRadioCoverage hash];
  NSUInteger v204 = [(NSString *)self->_cellularNewRadioDataBearer hash];
  NSUInteger v203 = [(NSString *)self->_cellularNewRadioMmwaveDataBearer hash];
  NSUInteger v202 = [(NSString *)self->_cellularNewRadioNsaCoverage hash];
  NSUInteger v201 = [(NSString *)self->_cellularNewRadioNsaDataBearer hash];
  NSUInteger v200 = [(NSString *)self->_cellularNewRadioSaCoverage hash];
  NSUInteger v199 = [(NSString *)self->_cellularNewRadioSaDataBearer hash];
  NSUInteger v198 = [(NSString *)self->_cellularNewRadioSub6DataBearer hash];
  NSUInteger v197 = [(NSString *)self->_cellularNrConfiguredBw hash];
  NSUInteger v196 = [(NSString *)self->_cellularNrLayers hash];
  NSUInteger v195 = [(NSString *)self->_cellularNrModulation hash];
  NSUInteger v194 = [(NSString *)self->_cellularNrRsrp hash];
  NSUInteger v193 = [(NSString *)self->_cellularNrRsrq hash];
  NSUInteger v192 = [(NSString *)self->_cellularNrSnr hash];
  NSUInteger v191 = [(NSString *)self->_cellularPid hash];
  NSUInteger v190 = [(NSString *)self->_cellularRadioAccessTechnology hash];
  NSUInteger v189 = [(NSString *)self->_cellularRadioAccessTechnologyCtDataStatus hash];
  NSUInteger v188 = [(NSString *)self->_cellularRoamAllowed hash];
  NSUInteger v187 = [(NSString *)self->_cellularRsrp hash];
  NSUInteger v186 = [(NSString *)self->_cellularSnr hash];
  NSUInteger v185 = [(NSString *)self->_cellularTac hash];
  NSUInteger v184 = [(NSString *)self->_cellularTotalActiveContexts hash];
  NSUInteger v183 = [(NSString *)self->_cellularTotalBw hash];
  NSUInteger v182 = [(NSString *)self->_cellularTotalCcs hash];
  NSUInteger v181 = [(NSString *)self->_cellularTotalLayers hash];
  NSUInteger v180 = [(NSString *)self->_cellularUarfcn hash];
  NSUInteger v179 = [(NSString *)self->_downloadCdnPop hash];
  NSUInteger v178 = [(NSString *)self->_downloadCdnUuid hash];
  NSUInteger v177 = [(NSString *)self->_downloadConnectionTime hash];
  NSUInteger v176 = [(NSString *)self->_downloadDomainLookupTime hash];
  NSUInteger v175 = [(NSString *)self->_downloadEndDataBearerTechnology hash];
  NSUInteger v174 = [(NSString *)self->_downloadEndPrimaryIpv4Interface hash];
  NSUInteger v173 = [(NSString *)self->_downloadEndRat hash];
  NSUInteger v172 = [(NSString *)self->_downloadFileSize hash];
  NSUInteger v171 = [(NSString *)self->_downloadInterfaceName hash];
  NSUInteger v170 = [(NSString *)self->_downloadInterfaceServiceName hash];
  $0FF3A8E67B3D88A75EBF7BE240CB1B75 v4 = self->_has;
  if ((*(_WORD *)&v4 & 0x200) != 0)
  {
    uint64_t v169 = 2654435761 * self->_downloadIsCellular;
    if ((*(_WORD *)&v4 & 0x400) != 0)
    {
LABEL_21:
      uint64_t v168 = 2654435761 * self->_downloadIsConstrained;
      if ((*(_WORD *)&v4 & 0x800) != 0) {
        goto LABEL_22;
      }
      goto LABEL_28;
    }
  }
  else
  {
    uint64_t v169 = 0;
    if ((*(_WORD *)&v4 & 0x400) != 0) {
      goto LABEL_21;
    }
  }
  uint64_t v168 = 0;
  if ((*(_WORD *)&v4 & 0x800) != 0)
  {
LABEL_22:
    uint64_t v167 = 2654435761 * self->_downloadIsExpensive;
    if ((*(_WORD *)&v4 & 0x1000) != 0) {
      goto LABEL_23;
    }
    goto LABEL_29;
  }
LABEL_28:
  uint64_t v167 = 0;
  if ((*(_WORD *)&v4 & 0x1000) != 0)
  {
LABEL_23:
    uint64_t v166 = 2654435761 * self->_downloadIsMultipath;
    if ((*(_WORD *)&v4 & 0x2000) != 0) {
      goto LABEL_24;
    }
LABEL_30:
    uint64_t v165 = 0;
    if ((*(_WORD *)&v4 & 0x4000) != 0) {
      goto LABEL_25;
    }
    goto LABEL_31;
  }
LABEL_29:
  uint64_t v166 = 0;
  if ((*(_WORD *)&v4 & 0x2000) == 0) {
    goto LABEL_30;
  }
LABEL_24:
  uint64_t v165 = 2654435761 * self->_downloadIsProxyConnection;
  if ((*(_WORD *)&v4 & 0x4000) != 0)
  {
LABEL_25:
    uint64_t v164 = 2654435761 * self->_downloadIsReusedConnection;
    goto LABEL_32;
  }
LABEL_31:
  uint64_t v164 = 0;
LABEL_32:
  NSUInteger v163 = [(NSString *)self->_downloadMaxSpeedObserved hash];
  NSUInteger v162 = [(NSString *)self->_downloadNumberOfStreams hash];
  NSUInteger v161 = [(NSString *)self->_downloadProtocolName hash];
  NSUInteger v160 = [(NSString *)self->_downloadRemoteAddress hash];
  NSUInteger v159 = [(NSString *)self->_downloadRemotePort hash];
  NSUInteger v158 = [(NSString *)self->_downloadRequestTime hash];
  NSUInteger v157 = [(NSString *)self->_downloadRequestToResponseTime hash];
  NSUInteger v156 = [(NSString *)self->_downloadResponseTime hash];
  NSUInteger v155 = [(NSString *)self->_downloadSecureConnectionTime hash];
  NSUInteger v154 = [(NSString *)self->_downloadServer hash];
  NSUInteger v153 = [(NSString *)self->_downloadSpeed hash];
  NSUInteger v152 = [(NSString *)self->_downloadStableSpeed hash];
  NSUInteger v151 = [(NSString *)self->_downloadStartDataBearerTechnology hash];
  NSUInteger v150 = [(NSString *)self->_downloadStartPrimaryIpv4Interface hash];
  NSUInteger v149 = [(NSString *)self->_downloadStartRat hash];
  if ((*((unsigned char *)&self->_has + 1) & 0x80) != 0) {
    uint64_t v148 = 2654435761 * self->_networkIsAppleReachable;
  }
  else {
    uint64_t v148 = 0;
  }
  NSUInteger v147 = [(NSString *)self->_networkPrimaryIpv4InterfaceName hash];
  NSUInteger v146 = [(NSString *)self->_networkPrimaryIpv4ServiceName hash];
  NSUInteger v145 = [(NSString *)self->_nptkitFrameworkVersion hash];
  NSUInteger v144 = [(NSString *)self->_performanceTestStartTime hash];
  NSUInteger v143 = [(NSString *)self->_pingAddress hash];
  NSUInteger v142 = [(NSString *)self->_pingLossPercent hash];
  NSUInteger v141 = [(NSString *)self->_pingMaxLatency hash];
  NSUInteger v140 = [(NSString *)self->_pingMeanLatency hash];
  NSUInteger v139 = [(NSString *)self->_pingMinLatency hash];
  NSUInteger v138 = [(NSString *)self->_pingStandardDeviation hash];
  NSUInteger v137 = [(NSString *)self->_powerBatteryWarningLevel hash];
  NSUInteger v136 = [(NSString *)self->_powerSourceType hash];
  NSUInteger v135 = [(NSString *)self->_powerStateCaps hash];
  NSUInteger v134 = [(NSString *)self->_systemActiveProcessorCount hash];
  NSUInteger v133 = [(NSString *)self->_systemBatteryLevel hash];
  NSUInteger v132 = [(NSString *)self->_systemBatteryState hash];
  NSUInteger v131 = [(NSString *)self->_systemDeviceClass hash];
  NSUInteger v130 = [(NSString *)self->_systemDeviceModel hash];
  if (*((unsigned char *)&self->_has + 2)) {
    uint64_t v129 = 2654435761 * self->_systemLowPowerModeEnabled;
  }
  else {
    uint64_t v129 = 0;
  }
  NSUInteger v128 = [(NSString *)self->_systemName hash];
  NSUInteger v127 = [(NSString *)self->_systemOsVariant hash];
  NSUInteger v126 = [(NSString *)self->_systemPhysicalMemory hash];
  if ((*((unsigned char *)&self->_has + 2) & 2) != 0) {
    uint64_t v125 = 2654435761 * self->_systemPowersourceConnected;
  }
  else {
    uint64_t v125 = 0;
  }
  NSUInteger v124 = [(NSString *)self->_systemProcessorCount hash];
  NSUInteger v123 = [(NSString *)self->_systemVersion hash];
  NSUInteger v122 = [(NSString *)self->_uploadCdnPop hash];
  NSUInteger v121 = [(NSString *)self->_uploadCdnUuid hash];
  NSUInteger v120 = [(NSString *)self->_uploadConnectionTime hash];
  NSUInteger v119 = [(NSString *)self->_uploadDomainLookupTime hash];
  NSUInteger v118 = [(NSString *)self->_uploadEndDataBearerTechnology hash];
  NSUInteger v117 = [(NSString *)self->_uploadEndPrimaryIpv4Interface hash];
  NSUInteger v116 = [(NSString *)self->_uploadEndRat hash];
  NSUInteger v115 = [(NSString *)self->_uploadFileSize hash];
  NSUInteger v114 = [(NSString *)self->_uploadInterfaceName hash];
  NSUInteger v113 = [(NSString *)self->_uploadInterfaceServiceName hash];
  $0FF3A8E67B3D88A75EBF7BE240CB1B75 v5 = self->_has;
  if ((*(_DWORD *)&v5 & 0x40000) != 0)
  {
    uint64_t v112 = 2654435761 * self->_uploadIsCellular;
    if ((*(_DWORD *)&v5 & 0x80000) != 0)
    {
LABEL_43:
      uint64_t v111 = 2654435761 * self->_uploadIsConstrained;
      if ((*(_DWORD *)&v5 & 0x100000) != 0) {
        goto LABEL_44;
      }
      goto LABEL_50;
    }
  }
  else
  {
    uint64_t v112 = 0;
    if ((*(_DWORD *)&v5 & 0x80000) != 0) {
      goto LABEL_43;
    }
  }
  uint64_t v111 = 0;
  if ((*(_DWORD *)&v5 & 0x100000) != 0)
  {
LABEL_44:
    uint64_t v110 = 2654435761 * self->_uploadIsExpensive;
    if ((*(_DWORD *)&v5 & 0x200000) != 0) {
      goto LABEL_45;
    }
    goto LABEL_51;
  }
LABEL_50:
  uint64_t v110 = 0;
  if ((*(_DWORD *)&v5 & 0x200000) != 0)
  {
LABEL_45:
    uint64_t v109 = 2654435761 * self->_uploadIsMultipath;
    if ((*(_DWORD *)&v5 & 0x400000) != 0) {
      goto LABEL_46;
    }
LABEL_52:
    uint64_t v108 = 0;
    if ((*(_DWORD *)&v5 & 0x800000) != 0) {
      goto LABEL_47;
    }
    goto LABEL_53;
  }
LABEL_51:
  uint64_t v109 = 0;
  if ((*(_DWORD *)&v5 & 0x400000) == 0) {
    goto LABEL_52;
  }
LABEL_46:
  uint64_t v108 = 2654435761 * self->_uploadIsProxyConnection;
  if ((*(_DWORD *)&v5 & 0x800000) != 0)
  {
LABEL_47:
    uint64_t v107 = 2654435761 * self->_uploadIsReusedConnection;
    goto LABEL_54;
  }
LABEL_53:
  uint64_t v107 = 0;
LABEL_54:
  NSUInteger v106 = [(NSString *)self->_uploadMaxSpeedObserved hash];
  NSUInteger v105 = [(NSString *)self->_uploadNumberOfStreams hash];
  NSUInteger v104 = [(NSString *)self->_uploadProtocolName hash];
  NSUInteger v103 = [(NSString *)self->_uploadRemoteAddress hash];
  NSUInteger v102 = [(NSString *)self->_uploadRemotePort hash];
  NSUInteger v101 = [(NSString *)self->_uploadRequestTime hash];
  NSUInteger v100 = [(NSString *)self->_uploadRequestToResponseTime hash];
  NSUInteger v99 = [(NSString *)self->_uploadResponseTime hash];
  NSUInteger v98 = [(NSString *)self->_uploadSecureConnectionTime hash];
  NSUInteger v97 = [(NSString *)self->_uploadServer hash];
  NSUInteger v96 = [(NSString *)self->_uploadSpeed hash];
  NSUInteger v95 = [(NSString *)self->_uploadStableSpeed hash];
  NSUInteger v94 = [(NSString *)self->_uploadStartDataBearerTechnology hash];
  NSUInteger v93 = [(NSString *)self->_uploadStartPrimaryIpv4Interface hash];
  NSUInteger v92 = [(NSString *)self->_uploadStartRat hash];
  if (*((unsigned char *)&self->_has + 3)) {
    uint64_t v91 = 2654435761 * self->_useWifiWasSpecified;
  }
  else {
    uint64_t v91 = 0;
  }
  NSUInteger v90 = [(NSString *)self->_wifiAveragePhyRateRx hash];
  NSUInteger v89 = [(NSString *)self->_wifiAverageRssi hash];
  NSUInteger v88 = [(NSString *)self->_wifiAverageSnr hash];
  NSUInteger v87 = [(NSString *)self->_wifiAverageTcpRtt hash];
  NSUInteger v86 = [(NSString *)self->_wifiBtcMode hash];
  NSUInteger v85 = [(NSString *)self->_wifiCca hash];
  NSUInteger v84 = [(NSString *)self->_wifiChannel hash];
  NSUInteger v83 = [(NSString *)self->_wifiCwfCca hash];
  NSUInteger v82 = [(NSString *)self->_wifiEapolControlMode hash];
  NSUInteger v81 = [(NSString *)self->_wifiEapolSupplicantState hash];
  NSUInteger v80 = [(NSString *)self->_wifiGuardInterval hash];
  NSUInteger v79 = [(NSString *)self->_wifiHiddenState hash];
  if ((*((unsigned char *)&self->_has + 3) & 2) != 0) {
    uint64_t v78 = 2654435761 * self->_wifiIsCaptive;
  }
  else {
    uint64_t v78 = 0;
  }
  NSUInteger v77 = [(NSString *)self->_wifiMcsIndex hash];
  NSUInteger v76 = [(NSString *)self->_wifiNoise hash];
  NSUInteger v75 = [(NSString *)self->_wifiNumberOfSpatialStreams hash];
  NSUInteger v74 = [(NSString *)self->_wifiOpMode hash];
  NSUInteger v73 = [(NSString *)self->_wifiPhyMode hash];
  NSUInteger v72 = [(NSString *)self->_wifiRssi hash];
  NSUInteger v71 = [(NSString *)self->_wifiSecurity hash];
  NSUInteger v70 = [(NSString *)self->_wifiTxRate hash];
  NSUInteger v69 = [(NSString *)self->_wrmChannelType hash];
  NSUInteger v68 = [(NSString *)self->_cellularCellid hash];
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    uint64_t v67 = 2654435761 * self->_acceptablePerformanceResult;
  }
  else {
    uint64_t v67 = 0;
  }
  NSUInteger v66 = [(NSString *)self->_networkQualityResponsiveness hash];
  NSUInteger v65 = [(NSString *)self->_cellularAggregatedDLBW hash];
  NSUInteger v64 = [(NSString *)self->_cellularAggregatedULBW hash];
  NSUInteger v63 = [(NSString *)self->_cellularIssa hash];
  NSUInteger v62 = [(NSString *)self->_cellularLac hash];
  NSUInteger v61 = [(NSString *)self->_cellularLteNrConfiguredBw hash];
  NSUInteger v60 = [(NSString *)self->_cellularMaxDlMod hash];
  NSUInteger v59 = [(NSString *)self->_cellularMaxNwMimoLyr hash];
  NSUInteger v58 = [(NSString *)self->_cellularMaxSchdMimoLyr hash];
  NSUInteger v57 = [(NSString *)self->_cellularMaxUeRank hash];
  NSUInteger v56 = [(NSString *)self->_cellularMaxUlMod hash];
  NSUInteger v55 = [(NSString *)self->_cellularNrSinr hash];
  NSUInteger v54 = [(NSString *)self->_cellularNrarfcn hash];
  NSUInteger v53 = [(NSString *)self->_cellularRadioFrequency hash];
  NSUInteger v52 = [(NSString *)self->_cellularTotalDlMimoLayers hash];
  NSUInteger v51 = [(NSString *)self->_cellularTotalNumCcs hash];
  NSUInteger v50 = [(NSString *)self->_downloadStartRadioFrequency hash];
  NSUInteger v49 = [(NSString *)self->_downloadEndRadioFrequency hash];
  NSUInteger v48 = [(NSString *)self->_networkPrimaryIpv6InterfaceName hash];
  NSUInteger v47 = [(NSString *)self->_networkPrimaryIpv6ServiceName hash];
  NSUInteger v46 = [(NSString *)self->_uploadStartRadioFrequency hash];
  NSUInteger v45 = [(NSString *)self->_uploadEndRadioFrequency hash];
  NSUInteger v44 = [(NSString *)self->_downloadError hash];
  NSUInteger v43 = [(NSString *)self->_networkQualityError hash];
  NSUInteger v42 = [(NSString *)self->_networkQualityDownloadSpeed hash];
  NSUInteger v41 = [(NSString *)self->_networkQualityUploadSpeed hash];
  NSUInteger v40 = [(NSString *)self->_networkQualityRating hash];
  NSUInteger v39 = [(NSString *)self->_vpnConnectionState hash];
  NSUInteger v38 = [(NSString *)self->_uploadError hash];
  NSUInteger v37 = [(NSString *)self->_uploadErrorDomain hash];
  NSUInteger v36 = [(NSString *)self->_uploadErrorCode hash];
  NSUInteger v6 = [(NSString *)self->_downloadErrorDomain hash];
  NSUInteger v7 = [(NSString *)self->_downloadErrorCode hash];
  NSUInteger v8 = [(NSString *)self->_pingError hash];
  NSUInteger v9 = [(NSString *)self->_pingErrorDomain hash];
  NSUInteger v10 = [(NSString *)self->_pingErrorCode hash];
  NSUInteger v11 = [(NSString *)self->_networkQualityErrorDomain hash];
  NSUInteger v12 = [(NSString *)self->_networkQualityErrorCode hash];
  NSUInteger v13 = [(NSString *)self->_cellularRnMobileCountryCode hash];
  NSUInteger v14 = [(NSString *)self->_cellularRnMobileNetworkCode hash];
  if (*((unsigned char *)&self->_has + 1)) {
    uint64_t v15 = 2654435761 * self->_cellularDataIsEnabled;
  }
  else {
    uint64_t v15 = 0;
  }
  NSUInteger v16 = v237 ^ v238 ^ v236 ^ v235 ^ v234 ^ v233 ^ v232 ^ v231 ^ v230 ^ v229 ^ v228 ^ v227 ^ v226 ^ v225 ^ v224 ^ v223 ^ v222 ^ v221 ^ v220 ^ v219 ^ v218 ^ v217 ^ v216 ^ v215 ^ v214 ^ v213 ^ v212 ^ v211 ^ v210 ^ v209 ^ v208 ^ v207 ^ v206 ^ v205 ^ v204 ^ v203 ^ v202 ^ v201 ^ v200 ^ v199 ^ v198 ^ v197 ^ v196 ^ v195 ^ v194 ^ v193 ^ v192 ^ v191 ^ v190 ^ v189 ^ v188 ^ v187 ^ v186 ^ v185 ^ v184 ^ v183 ^ v182 ^ v181 ^ v180 ^ v179 ^ v178 ^ v177 ^ v176 ^ v175 ^ v174 ^ v173 ^ v172 ^ v171 ^ v170 ^ v169 ^ v168 ^ v167 ^ v166 ^ v165 ^ v164 ^ v163 ^ v162 ^ v161 ^ v160 ^ v159 ^ v158 ^ v157 ^ v156 ^ v155 ^ v154 ^ v153;
  NSUInteger v17 = v16 ^ v152 ^ v151 ^ v150 ^ v149 ^ v148 ^ v147 ^ v146 ^ v145 ^ v144 ^ v143 ^ v142 ^ v141 ^ v140 ^ v139 ^ v138 ^ v137 ^ v136 ^ v135 ^ v134 ^ v133 ^ v132 ^ v131 ^ v130 ^ v129 ^ v128 ^ v127 ^ v126 ^ v125 ^ v124 ^ v123 ^ v122 ^ v121 ^ v120 ^ v119 ^ v118 ^ v117 ^ v116 ^ v115 ^ v114 ^ v113 ^ v112 ^ v111 ^ v110 ^ v109 ^ v108 ^ v107 ^ v106 ^ v105 ^ v104 ^ v103 ^ v102 ^ v101 ^ v100 ^ v99 ^ v98 ^ v97 ^ v96 ^ v95 ^ v94 ^ v93 ^ v92 ^ v91 ^ v90 ^ v89 ^ v88 ^ v87 ^ v86 ^ v85 ^ v84 ^ v83 ^ v82 ^ v81 ^ v80 ^ v79 ^ v78 ^ v77 ^ v76 ^ v75 ^ v74 ^ v73 ^ v72 ^ v71 ^ v70 ^ v69 ^ v68 ^ v67 ^ v66 ^ v65 ^ v64 ^ v63 ^ v62 ^ v61 ^ v60 ^ v59 ^ v58 ^ v57 ^ v56 ^ v55 ^ v54 ^ v53 ^ v52 ^ v51 ^ v50 ^ v49 ^ v48 ^ v47 ^ v46 ^ v45 ^ v44 ^ v43 ^ v42 ^ v41 ^ v40 ^ v39 ^ v38;
  NSUInteger v18 = v37 ^ v36 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ [(NSString *)self->_downloadStartCellularEstimate hash];
  NSUInteger v19 = v18 ^ [(NSString *)self->_downloadEndCellularEstimate hash];
  NSUInteger v20 = v19 ^ [(NSString *)self->_downloadMaxCellularEstimate hash];
  NSUInteger v21 = v20 ^ [(NSString *)self->_uploadStartCellularEstimate hash];
  NSUInteger v22 = v21 ^ [(NSString *)self->_uploadEndCellularEstimate hash];
  NSUInteger v23 = v22 ^ [(NSString *)self->_uploadMaxCellularEstimate hash];
  NSUInteger v24 = v23 ^ [(NSString *)self->_downloadResponsiveness hash];
  NSUInteger v25 = v17 ^ v24 ^ [(NSString *)self->_downloadResponsivenessConfidence hash];
  NSUInteger v26 = [(NSString *)self->_downloadResponsivenessRating hash];
  NSUInteger v27 = v26 ^ [(NSString *)self->_downloadSpeedConfidence hash];
  NSUInteger v28 = v27 ^ [(NSString *)self->_downloadSpeedRating hash];
  NSUInteger v29 = v28 ^ [(NSString *)self->_uploadResponsiveness hash];
  NSUInteger v30 = v29 ^ [(NSString *)self->_uploadResponsivenessConfidence hash];
  NSUInteger v31 = v30 ^ [(NSString *)self->_uploadResponsivenessRating hash];
  NSUInteger v32 = v31 ^ [(NSString *)self->_uploadSpeedConfidence hash];
  NSUInteger v33 = v32 ^ [(NSString *)self->_uploadSpeedRating hash];
  NSUInteger v34 = v33 ^ [(NSString *)self->_wifiChannelBand hash];
  return v25 ^ v34 ^ [(NSString *)self->_wifiChannelWidth hash];
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  if (*((unsigned char *)v4 + 1684))
  {
    self->_timestamp = *((void *)v4 + 1);
    *(_DWORD *)&self->_has |= 1u;
  }
  id v8 = v4;
  if (*((void *)v4 + 2))
  {
    -[AWDNetworkPerformanceMetric setAwdlElectionParameters:](self, "setAwdlElectionParameters:");
    id v4 = v8;
  }
  if (*((void *)v4 + 3))
  {
    -[AWDNetworkPerformanceMetric setAwdlMasterChannel:](self, "setAwdlMasterChannel:");
    id v4 = v8;
  }
  if (*((void *)v4 + 4))
  {
    -[AWDNetworkPerformanceMetric setAwdlOpMode:](self, "setAwdlOpMode:");
    id v4 = v8;
  }
  if ((*((unsigned char *)v4 + 1684) & 4) != 0)
  {
    self->_awdlPowerState = *((unsigned char *)v4 + 1657);
    *(_DWORD *)&self->_has |= 4u;
  }
  if (*((void *)v4 + 5))
  {
    -[AWDNetworkPerformanceMetric setAwdlSchedule:](self, "setAwdlSchedule:");
    id v4 = v8;
  }
  if (*((void *)v4 + 6))
  {
    -[AWDNetworkPerformanceMetric setAwdlSecondaryMasterChannel:](self, "setAwdlSecondaryMasterChannel:");
    id v4 = v8;
  }
  if (*((void *)v4 + 7))
  {
    -[AWDNetworkPerformanceMetric setAwdlSyncChannelSequence:](self, "setAwdlSyncChannelSequence:");
    id v4 = v8;
  }
  if (*((void *)v4 + 8))
  {
    -[AWDNetworkPerformanceMetric setAwdlSyncState:](self, "setAwdlSyncState:");
    id v4 = v8;
  }
  if (*((void *)v4 + 9))
  {
    -[AWDNetworkPerformanceMetric setBtConnectedDevicesCount:](self, "setBtConnectedDevicesCount:");
    id v4 = v8;
  }
  int v5 = *((_DWORD *)v4 + 421);
  if ((v5 & 8) != 0)
  {
    self->_btIsConnectable = *((unsigned char *)v4 + 1658);
    *(_DWORD *)&self->_has |= 8u;
    int v5 = *((_DWORD *)v4 + 421);
    if ((v5 & 0x10) == 0)
    {
LABEL_23:
      if ((v5 & 0x20) == 0) {
        goto LABEL_24;
      }
      goto LABEL_455;
    }
  }
  else if ((v5 & 0x10) == 0)
  {
    goto LABEL_23;
  }
  self->_btIsDiscoverable = *((unsigned char *)v4 + 1659);
  *(_DWORD *)&self->_has |= 0x10u;
  int v5 = *((_DWORD *)v4 + 421);
  if ((v5 & 0x20) == 0)
  {
LABEL_24:
    if ((v5 & 0x40) == 0) {
      goto LABEL_26;
    }
    goto LABEL_25;
  }
LABEL_455:
  self->_btIsPowerOn = *((unsigned char *)v4 + 1660);
  *(_DWORD *)&self->_has |= 0x20u;
  if ((*((_DWORD *)v4 + 421) & 0x40) != 0)
  {
LABEL_25:
    self->_btIsScanning = *((unsigned char *)v4 + 1661);
    *(_DWORD *)&self->_has |= 0x40u;
  }
LABEL_26:
  if (*((void *)v4 + 10))
  {
    -[AWDNetworkPerformanceMetric setCallingClient:](self, "setCallingClient:");
    id v4 = v8;
  }
  if (*((void *)v4 + 11))
  {
    -[AWDNetworkPerformanceMetric setCellularActiveContexts:](self, "setCellularActiveContexts:");
    id v4 = v8;
  }
  if ((*((unsigned char *)v4 + 1684) & 0x80) != 0)
  {
    self->_cellularAllowsVoip = *((unsigned char *)v4 + 1662);
    *(_DWORD *)&self->_has |= 0x80u;
  }
  if (*((void *)v4 + 14))
  {
    -[AWDNetworkPerformanceMetric setCellularAttached:](self, "setCellularAttached:");
    id v4 = v8;
  }
  if (*((void *)v4 + 15))
  {
    -[AWDNetworkPerformanceMetric setCellularBandinfo:](self, "setCellularBandinfo:");
    id v4 = v8;
  }
  if (*((void *)v4 + 16))
  {
    -[AWDNetworkPerformanceMetric setCellularBandwidth:](self, "setCellularBandwidth:");
    id v4 = v8;
  }
  if (*((void *)v4 + 17))
  {
    -[AWDNetworkPerformanceMetric setCellularCarrierName:](self, "setCellularCarrierName:");
    id v4 = v8;
  }
  if (*((void *)v4 + 19))
  {
    -[AWDNetworkPerformanceMetric setCellularDataBearerSoMask:](self, "setCellularDataBearerSoMask:");
    id v4 = v8;
  }
  if (*((void *)v4 + 20))
  {
    -[AWDNetworkPerformanceMetric setCellularDataBearerTechnology:](self, "setCellularDataBearerTechnology:");
    id v4 = v8;
  }
  if (*((void *)v4 + 21))
  {
    -[AWDNetworkPerformanceMetric setCellularDataPlanSignalingReductionOverride:](self, "setCellularDataPlanSignalingReductionOverride:");
    id v4 = v8;
  }
  if (*((void *)v4 + 22))
  {
    -[AWDNetworkPerformanceMetric setCellularDataPossible:](self, "setCellularDataPossible:");
    id v4 = v8;
  }
  if (*((void *)v4 + 23))
  {
    -[AWDNetworkPerformanceMetric setCellularInHomeCountry:](self, "setCellularInHomeCountry:");
    id v4 = v8;
  }
  if (*((void *)v4 + 24))
  {
    -[AWDNetworkPerformanceMetric setCellularIndicator:](self, "setCellularIndicator:");
    id v4 = v8;
  }
  if (*((void *)v4 + 25))
  {
    -[AWDNetworkPerformanceMetric setCellularIndicatorOverride:](self, "setCellularIndicatorOverride:");
    id v4 = v8;
  }
  if (*((void *)v4 + 26))
  {
    -[AWDNetworkPerformanceMetric setCellularIsoCountryCode:](self, "setCellularIsoCountryCode:");
    id v4 = v8;
  }
  if (*((void *)v4 + 29))
  {
    -[AWDNetworkPerformanceMetric setCellularLqm:](self, "setCellularLqm:");
    id v4 = v8;
  }
  if (*((void *)v4 + 30))
  {
    -[AWDNetworkPerformanceMetric setCellularLteMaxScheduledLayers:](self, "setCellularLteMaxScheduledLayers:");
    id v4 = v8;
  }
  if (*((void *)v4 + 37))
  {
    -[AWDNetworkPerformanceMetric setCellularMobileCountryCode:](self, "setCellularMobileCountryCode:");
    id v4 = v8;
  }
  if (*((void *)v4 + 38))
  {
    -[AWDNetworkPerformanceMetric setCellularMobileNetworkCode:](self, "setCellularMobileNetworkCode:");
    id v4 = v8;
  }
  if (*((void *)v4 + 39))
  {
    -[AWDNetworkPerformanceMetric setCellularNewRadioCoverage:](self, "setCellularNewRadioCoverage:");
    id v4 = v8;
  }
  if (*((void *)v4 + 40))
  {
    -[AWDNetworkPerformanceMetric setCellularNewRadioDataBearer:](self, "setCellularNewRadioDataBearer:");
    id v4 = v8;
  }
  if (*((void *)v4 + 41))
  {
    -[AWDNetworkPerformanceMetric setCellularNewRadioMmwaveDataBearer:](self, "setCellularNewRadioMmwaveDataBearer:");
    id v4 = v8;
  }
  if (*((void *)v4 + 42))
  {
    -[AWDNetworkPerformanceMetric setCellularNewRadioNsaCoverage:](self, "setCellularNewRadioNsaCoverage:");
    id v4 = v8;
  }
  if (*((void *)v4 + 43))
  {
    -[AWDNetworkPerformanceMetric setCellularNewRadioNsaDataBearer:](self, "setCellularNewRadioNsaDataBearer:");
    id v4 = v8;
  }
  if (*((void *)v4 + 44))
  {
    -[AWDNetworkPerformanceMetric setCellularNewRadioSaCoverage:](self, "setCellularNewRadioSaCoverage:");
    id v4 = v8;
  }
  if (*((void *)v4 + 45))
  {
    -[AWDNetworkPerformanceMetric setCellularNewRadioSaDataBearer:](self, "setCellularNewRadioSaDataBearer:");
    id v4 = v8;
  }
  if (*((void *)v4 + 46))
  {
    -[AWDNetworkPerformanceMetric setCellularNewRadioSub6DataBearer:](self, "setCellularNewRadioSub6DataBearer:");
    id v4 = v8;
  }
  if (*((void *)v4 + 47))
  {
    -[AWDNetworkPerformanceMetric setCellularNrConfiguredBw:](self, "setCellularNrConfiguredBw:");
    id v4 = v8;
  }
  if (*((void *)v4 + 48))
  {
    -[AWDNetworkPerformanceMetric setCellularNrLayers:](self, "setCellularNrLayers:");
    id v4 = v8;
  }
  if (*((void *)v4 + 49))
  {
    -[AWDNetworkPerformanceMetric setCellularNrModulation:](self, "setCellularNrModulation:");
    id v4 = v8;
  }
  if (*((void *)v4 + 50))
  {
    -[AWDNetworkPerformanceMetric setCellularNrRsrp:](self, "setCellularNrRsrp:");
    id v4 = v8;
  }
  if (*((void *)v4 + 51))
  {
    -[AWDNetworkPerformanceMetric setCellularNrRsrq:](self, "setCellularNrRsrq:");
    id v4 = v8;
  }
  if (*((void *)v4 + 53))
  {
    -[AWDNetworkPerformanceMetric setCellularNrSnr:](self, "setCellularNrSnr:");
    id v4 = v8;
  }
  if (*((void *)v4 + 55))
  {
    -[AWDNetworkPerformanceMetric setCellularPid:](self, "setCellularPid:");
    id v4 = v8;
  }
  if (*((void *)v4 + 56))
  {
    -[AWDNetworkPerformanceMetric setCellularRadioAccessTechnology:](self, "setCellularRadioAccessTechnology:");
    id v4 = v8;
  }
  if (*((void *)v4 + 57))
  {
    -[AWDNetworkPerformanceMetric setCellularRadioAccessTechnologyCtDataStatus:](self, "setCellularRadioAccessTechnologyCtDataStatus:");
    id v4 = v8;
  }
  if (*((void *)v4 + 61))
  {
    -[AWDNetworkPerformanceMetric setCellularRoamAllowed:](self, "setCellularRoamAllowed:");
    id v4 = v8;
  }
  if (*((void *)v4 + 62))
  {
    -[AWDNetworkPerformanceMetric setCellularRsrp:](self, "setCellularRsrp:");
    id v4 = v8;
  }
  if (*((void *)v4 + 63))
  {
    -[AWDNetworkPerformanceMetric setCellularSnr:](self, "setCellularSnr:");
    id v4 = v8;
  }
  if (*((void *)v4 + 64))
  {
    -[AWDNetworkPerformanceMetric setCellularTac:](self, "setCellularTac:");
    id v4 = v8;
  }
  if (*((void *)v4 + 65))
  {
    -[AWDNetworkPerformanceMetric setCellularTotalActiveContexts:](self, "setCellularTotalActiveContexts:");
    id v4 = v8;
  }
  if (*((void *)v4 + 66))
  {
    -[AWDNetworkPerformanceMetric setCellularTotalBw:](self, "setCellularTotalBw:");
    id v4 = v8;
  }
  if (*((void *)v4 + 67))
  {
    -[AWDNetworkPerformanceMetric setCellularTotalCcs:](self, "setCellularTotalCcs:");
    id v4 = v8;
  }
  if (*((void *)v4 + 69))
  {
    -[AWDNetworkPerformanceMetric setCellularTotalLayers:](self, "setCellularTotalLayers:");
    id v4 = v8;
  }
  if (*((void *)v4 + 71))
  {
    -[AWDNetworkPerformanceMetric setCellularUarfcn:](self, "setCellularUarfcn:");
    id v4 = v8;
  }
  if (*((void *)v4 + 72))
  {
    -[AWDNetworkPerformanceMetric setDownloadCdnPop:](self, "setDownloadCdnPop:");
    id v4 = v8;
  }
  if (*((void *)v4 + 73))
  {
    -[AWDNetworkPerformanceMetric setDownloadCdnUuid:](self, "setDownloadCdnUuid:");
    id v4 = v8;
  }
  if (*((void *)v4 + 74))
  {
    -[AWDNetworkPerformanceMetric setDownloadConnectionTime:](self, "setDownloadConnectionTime:");
    id v4 = v8;
  }
  if (*((void *)v4 + 75))
  {
    -[AWDNetworkPerformanceMetric setDownloadDomainLookupTime:](self, "setDownloadDomainLookupTime:");
    id v4 = v8;
  }
  if (*((void *)v4 + 77))
  {
    -[AWDNetworkPerformanceMetric setDownloadEndDataBearerTechnology:](self, "setDownloadEndDataBearerTechnology:");
    id v4 = v8;
  }
  if (*((void *)v4 + 78))
  {
    -[AWDNetworkPerformanceMetric setDownloadEndPrimaryIpv4Interface:](self, "setDownloadEndPrimaryIpv4Interface:");
    id v4 = v8;
  }
  if (*((void *)v4 + 80))
  {
    -[AWDNetworkPerformanceMetric setDownloadEndRat:](self, "setDownloadEndRat:");
    id v4 = v8;
  }
  if (*((void *)v4 + 84))
  {
    -[AWDNetworkPerformanceMetric setDownloadFileSize:](self, "setDownloadFileSize:");
    id v4 = v8;
  }
  if (*((void *)v4 + 85))
  {
    -[AWDNetworkPerformanceMetric setDownloadInterfaceName:](self, "setDownloadInterfaceName:");
    id v4 = v8;
  }
  if (*((void *)v4 + 86))
  {
    -[AWDNetworkPerformanceMetric setDownloadInterfaceServiceName:](self, "setDownloadInterfaceServiceName:");
    id v4 = v8;
  }
  int v6 = *((_DWORD *)v4 + 421);
  if ((v6 & 0x200) != 0)
  {
    self->_downloadIsCellular = *((unsigned char *)v4 + 1664);
    *(_DWORD *)&self->_has |= 0x200u;
    int v6 = *((_DWORD *)v4 + 421);
    if ((v6 & 0x400) == 0)
    {
LABEL_138:
      if ((v6 & 0x800) == 0) {
        goto LABEL_139;
      }
      goto LABEL_459;
    }
  }
  else if ((v6 & 0x400) == 0)
  {
    goto LABEL_138;
  }
  self->_downloadIsConstrained = *((unsigned char *)v4 + 1665);
  *(_DWORD *)&self->_has |= 0x400u;
  int v6 = *((_DWORD *)v4 + 421);
  if ((v6 & 0x800) == 0)
  {
LABEL_139:
    if ((v6 & 0x1000) == 0) {
      goto LABEL_140;
    }
    goto LABEL_460;
  }
LABEL_459:
  self->_downloadIsExpensive = *((unsigned char *)v4 + 1666);
  *(_DWORD *)&self->_has |= 0x800u;
  int v6 = *((_DWORD *)v4 + 421);
  if ((v6 & 0x1000) == 0)
  {
LABEL_140:
    if ((v6 & 0x2000) == 0) {
      goto LABEL_141;
    }
    goto LABEL_461;
  }
LABEL_460:
  self->_downloadIsMultipath = *((unsigned char *)v4 + 1667);
  *(_DWORD *)&self->_has |= 0x1000u;
  int v6 = *((_DWORD *)v4 + 421);
  if ((v6 & 0x2000) == 0)
  {
LABEL_141:
    if ((v6 & 0x4000) == 0) {
      goto LABEL_143;
    }
    goto LABEL_142;
  }
LABEL_461:
  self->_downloadIsProxyConnection = *((unsigned char *)v4 + 1668);
  *(_DWORD *)&self->_has |= 0x2000u;
  if ((*((_DWORD *)v4 + 421) & 0x4000) != 0)
  {
LABEL_142:
    self->_downloadIsReusedConnection = *((unsigned char *)v4 + 1669);
    *(_DWORD *)&self->_has |= 0x4000u;
  }
LABEL_143:
  if (*((void *)v4 + 88))
  {
    -[AWDNetworkPerformanceMetric setDownloadMaxSpeedObserved:](self, "setDownloadMaxSpeedObserved:");
    id v4 = v8;
  }
  if (*((void *)v4 + 89))
  {
    -[AWDNetworkPerformanceMetric setDownloadNumberOfStreams:](self, "setDownloadNumberOfStreams:");
    id v4 = v8;
  }
  if (*((void *)v4 + 90))
  {
    -[AWDNetworkPerformanceMetric setDownloadProtocolName:](self, "setDownloadProtocolName:");
    id v4 = v8;
  }
  if (*((void *)v4 + 91))
  {
    -[AWDNetworkPerformanceMetric setDownloadRemoteAddress:](self, "setDownloadRemoteAddress:");
    id v4 = v8;
  }
  if (*((void *)v4 + 92))
  {
    -[AWDNetworkPerformanceMetric setDownloadRemotePort:](self, "setDownloadRemotePort:");
    id v4 = v8;
  }
  if (*((void *)v4 + 93))
  {
    -[AWDNetworkPerformanceMetric setDownloadRequestTime:](self, "setDownloadRequestTime:");
    id v4 = v8;
  }
  if (*((void *)v4 + 94))
  {
    -[AWDNetworkPerformanceMetric setDownloadRequestToResponseTime:](self, "setDownloadRequestToResponseTime:");
    id v4 = v8;
  }
  if (*((void *)v4 + 95))
  {
    -[AWDNetworkPerformanceMetric setDownloadResponseTime:](self, "setDownloadResponseTime:");
    id v4 = v8;
  }
  if (*((void *)v4 + 99))
  {
    -[AWDNetworkPerformanceMetric setDownloadSecureConnectionTime:](self, "setDownloadSecureConnectionTime:");
    id v4 = v8;
  }
  if (*((void *)v4 + 100))
  {
    -[AWDNetworkPerformanceMetric setDownloadServer:](self, "setDownloadServer:");
    id v4 = v8;
  }
  if (*((void *)v4 + 101))
  {
    -[AWDNetworkPerformanceMetric setDownloadSpeed:](self, "setDownloadSpeed:");
    id v4 = v8;
  }
  if (*((void *)v4 + 104))
  {
    -[AWDNetworkPerformanceMetric setDownloadStableSpeed:](self, "setDownloadStableSpeed:");
    id v4 = v8;
  }
  if (*((void *)v4 + 106))
  {
    -[AWDNetworkPerformanceMetric setDownloadStartDataBearerTechnology:](self, "setDownloadStartDataBearerTechnology:");
    id v4 = v8;
  }
  if (*((void *)v4 + 107))
  {
    -[AWDNetworkPerformanceMetric setDownloadStartPrimaryIpv4Interface:](self, "setDownloadStartPrimaryIpv4Interface:");
    id v4 = v8;
  }
  if (*((void *)v4 + 109))
  {
    -[AWDNetworkPerformanceMetric setDownloadStartRat:](self, "setDownloadStartRat:");
    id v4 = v8;
  }
  if ((*((unsigned char *)v4 + 1685) & 0x80) != 0)
  {
    self->_networkIsAppleReachable = *((unsigned char *)v4 + 1670);
    *(_DWORD *)&self->_has |= 0x8000u;
  }
  if (*((void *)v4 + 110))
  {
    -[AWDNetworkPerformanceMetric setNetworkPrimaryIpv4InterfaceName:](self, "setNetworkPrimaryIpv4InterfaceName:");
    id v4 = v8;
  }
  if (*((void *)v4 + 111))
  {
    -[AWDNetworkPerformanceMetric setNetworkPrimaryIpv4ServiceName:](self, "setNetworkPrimaryIpv4ServiceName:");
    id v4 = v8;
  }
  if (*((void *)v4 + 121))
  {
    -[AWDNetworkPerformanceMetric setNptkitFrameworkVersion:](self, "setNptkitFrameworkVersion:");
    id v4 = v8;
  }
  if (*((void *)v4 + 122))
  {
    -[AWDNetworkPerformanceMetric setPerformanceTestStartTime:](self, "setPerformanceTestStartTime:");
    id v4 = v8;
  }
  if (*((void *)v4 + 123))
  {
    -[AWDNetworkPerformanceMetric setPingAddress:](self, "setPingAddress:");
    id v4 = v8;
  }
  if (*((void *)v4 + 127))
  {
    -[AWDNetworkPerformanceMetric setPingLossPercent:](self, "setPingLossPercent:");
    id v4 = v8;
  }
  if (*((void *)v4 + 128))
  {
    -[AWDNetworkPerformanceMetric setPingMaxLatency:](self, "setPingMaxLatency:");
    id v4 = v8;
  }
  if (*((void *)v4 + 129))
  {
    -[AWDNetworkPerformanceMetric setPingMeanLatency:](self, "setPingMeanLatency:");
    id v4 = v8;
  }
  if (*((void *)v4 + 130))
  {
    -[AWDNetworkPerformanceMetric setPingMinLatency:](self, "setPingMinLatency:");
    id v4 = v8;
  }
  if (*((void *)v4 + 131))
  {
    -[AWDNetworkPerformanceMetric setPingStandardDeviation:](self, "setPingStandardDeviation:");
    id v4 = v8;
  }
  if (*((void *)v4 + 132))
  {
    -[AWDNetworkPerformanceMetric setPowerBatteryWarningLevel:](self, "setPowerBatteryWarningLevel:");
    id v4 = v8;
  }
  if (*((void *)v4 + 133))
  {
    -[AWDNetworkPerformanceMetric setPowerSourceType:](self, "setPowerSourceType:");
    id v4 = v8;
  }
  if (*((void *)v4 + 134))
  {
    -[AWDNetworkPerformanceMetric setPowerStateCaps:](self, "setPowerStateCaps:");
    id v4 = v8;
  }
  if (*((void *)v4 + 135))
  {
    -[AWDNetworkPerformanceMetric setSystemActiveProcessorCount:](self, "setSystemActiveProcessorCount:");
    id v4 = v8;
  }
  if (*((void *)v4 + 136))
  {
    -[AWDNetworkPerformanceMetric setSystemBatteryLevel:](self, "setSystemBatteryLevel:");
    id v4 = v8;
  }
  if (*((void *)v4 + 137))
  {
    -[AWDNetworkPerformanceMetric setSystemBatteryState:](self, "setSystemBatteryState:");
    id v4 = v8;
  }
  if (*((void *)v4 + 138))
  {
    -[AWDNetworkPerformanceMetric setSystemDeviceClass:](self, "setSystemDeviceClass:");
    id v4 = v8;
  }
  if (*((void *)v4 + 139))
  {
    -[AWDNetworkPerformanceMetric setSystemDeviceModel:](self, "setSystemDeviceModel:");
    id v4 = v8;
  }
  if (*((unsigned char *)v4 + 1686))
  {
    self->_systemLowPowerModeEnabled = *((unsigned char *)v4 + 1671);
    *(_DWORD *)&self->_has |= 0x10000u;
  }
  if (*((void *)v4 + 140))
  {
    -[AWDNetworkPerformanceMetric setSystemName:](self, "setSystemName:");
    id v4 = v8;
  }
  if (*((void *)v4 + 141))
  {
    -[AWDNetworkPerformanceMetric setSystemOsVariant:](self, "setSystemOsVariant:");
    id v4 = v8;
  }
  if (*((void *)v4 + 142))
  {
    -[AWDNetworkPerformanceMetric setSystemPhysicalMemory:](self, "setSystemPhysicalMemory:");
    id v4 = v8;
  }
  if ((*((unsigned char *)v4 + 1686) & 2) != 0)
  {
    self->_systemPowersourceConnected = *((unsigned char *)v4 + 1672);
    *(_DWORD *)&self->_has |= 0x20000u;
  }
  if (*((void *)v4 + 143))
  {
    -[AWDNetworkPerformanceMetric setSystemProcessorCount:](self, "setSystemProcessorCount:");
    id v4 = v8;
  }
  if (*((void *)v4 + 144))
  {
    -[AWDNetworkPerformanceMetric setSystemVersion:](self, "setSystemVersion:");
    id v4 = v8;
  }
  if (*((void *)v4 + 145))
  {
    -[AWDNetworkPerformanceMetric setUploadCdnPop:](self, "setUploadCdnPop:");
    id v4 = v8;
  }
  if (*((void *)v4 + 146))
  {
    -[AWDNetworkPerformanceMetric setUploadCdnUuid:](self, "setUploadCdnUuid:");
    id v4 = v8;
  }
  if (*((void *)v4 + 147))
  {
    -[AWDNetworkPerformanceMetric setUploadConnectionTime:](self, "setUploadConnectionTime:");
    id v4 = v8;
  }
  if (*((void *)v4 + 148))
  {
    -[AWDNetworkPerformanceMetric setUploadDomainLookupTime:](self, "setUploadDomainLookupTime:");
    id v4 = v8;
  }
  if (*((void *)v4 + 150))
  {
    -[AWDNetworkPerformanceMetric setUploadEndDataBearerTechnology:](self, "setUploadEndDataBearerTechnology:");
    id v4 = v8;
  }
  if (*((void *)v4 + 151))
  {
    -[AWDNetworkPerformanceMetric setUploadEndPrimaryIpv4Interface:](self, "setUploadEndPrimaryIpv4Interface:");
    id v4 = v8;
  }
  if (*((void *)v4 + 153))
  {
    -[AWDNetworkPerformanceMetric setUploadEndRat:](self, "setUploadEndRat:");
    id v4 = v8;
  }
  if (*((void *)v4 + 157))
  {
    -[AWDNetworkPerformanceMetric setUploadFileSize:](self, "setUploadFileSize:");
    id v4 = v8;
  }
  if (*((void *)v4 + 158))
  {
    -[AWDNetworkPerformanceMetric setUploadInterfaceName:](self, "setUploadInterfaceName:");
    id v4 = v8;
  }
  if (*((void *)v4 + 159))
  {
    -[AWDNetworkPerformanceMetric setUploadInterfaceServiceName:](self, "setUploadInterfaceServiceName:");
    id v4 = v8;
  }
  int v7 = *((_DWORD *)v4 + 421);
  if ((v7 & 0x40000) != 0)
  {
    self->_uploadIsCellular = *((unsigned char *)v4 + 1673);
    *(_DWORD *)&self->_has |= 0x40000u;
    int v7 = *((_DWORD *)v4 + 421);
    if ((v7 & 0x80000) == 0)
    {
LABEL_247:
      if ((v7 & 0x100000) == 0) {
        goto LABEL_248;
      }
      goto LABEL_465;
    }
  }
  else if ((v7 & 0x80000) == 0)
  {
    goto LABEL_247;
  }
  self->_uploadIsConstrained = *((unsigned char *)v4 + 1674);
  *(_DWORD *)&self->_has |= 0x80000u;
  int v7 = *((_DWORD *)v4 + 421);
  if ((v7 & 0x100000) == 0)
  {
LABEL_248:
    if ((v7 & 0x200000) == 0) {
      goto LABEL_249;
    }
    goto LABEL_466;
  }
LABEL_465:
  self->_uploadIsExpensive = *((unsigned char *)v4 + 1675);
  *(_DWORD *)&self->_has |= 0x100000u;
  int v7 = *((_DWORD *)v4 + 421);
  if ((v7 & 0x200000) == 0)
  {
LABEL_249:
    if ((v7 & 0x400000) == 0) {
      goto LABEL_250;
    }
    goto LABEL_467;
  }
LABEL_466:
  self->_uploadIsMultipath = *((unsigned char *)v4 + 1676);
  *(_DWORD *)&self->_has |= 0x200000u;
  int v7 = *((_DWORD *)v4 + 421);
  if ((v7 & 0x400000) == 0)
  {
LABEL_250:
    if ((v7 & 0x800000) == 0) {
      goto LABEL_252;
    }
    goto LABEL_251;
  }
LABEL_467:
  self->_uploadIsProxyConnection = *((unsigned char *)v4 + 1677);
  *(_DWORD *)&self->_has |= 0x400000u;
  if ((*((_DWORD *)v4 + 421) & 0x800000) != 0)
  {
LABEL_251:
    self->_uploadIsReusedConnection = *((unsigned char *)v4 + 1678);
    *(_DWORD *)&self->_has |= 0x800000u;
  }
LABEL_252:
  if (*((void *)v4 + 161))
  {
    -[AWDNetworkPerformanceMetric setUploadMaxSpeedObserved:](self, "setUploadMaxSpeedObserved:");
    id v4 = v8;
  }
  if (*((void *)v4 + 162))
  {
    -[AWDNetworkPerformanceMetric setUploadNumberOfStreams:](self, "setUploadNumberOfStreams:");
    id v4 = v8;
  }
  if (*((void *)v4 + 163))
  {
    -[AWDNetworkPerformanceMetric setUploadProtocolName:](self, "setUploadProtocolName:");
    id v4 = v8;
  }
  if (*((void *)v4 + 164))
  {
    -[AWDNetworkPerformanceMetric setUploadRemoteAddress:](self, "setUploadRemoteAddress:");
    id v4 = v8;
  }
  if (*((void *)v4 + 165))
  {
    -[AWDNetworkPerformanceMetric setUploadRemotePort:](self, "setUploadRemotePort:");
    id v4 = v8;
  }
  if (*((void *)v4 + 166))
  {
    -[AWDNetworkPerformanceMetric setUploadRequestTime:](self, "setUploadRequestTime:");
    id v4 = v8;
  }
  if (*((void *)v4 + 167))
  {
    -[AWDNetworkPerformanceMetric setUploadRequestToResponseTime:](self, "setUploadRequestToResponseTime:");
    id v4 = v8;
  }
  if (*((void *)v4 + 168))
  {
    -[AWDNetworkPerformanceMetric setUploadResponseTime:](self, "setUploadResponseTime:");
    id v4 = v8;
  }
  if (*((void *)v4 + 172))
  {
    -[AWDNetworkPerformanceMetric setUploadSecureConnectionTime:](self, "setUploadSecureConnectionTime:");
    id v4 = v8;
  }
  if (*((void *)v4 + 173))
  {
    -[AWDNetworkPerformanceMetric setUploadServer:](self, "setUploadServer:");
    id v4 = v8;
  }
  if (*((void *)v4 + 174))
  {
    -[AWDNetworkPerformanceMetric setUploadSpeed:](self, "setUploadSpeed:");
    id v4 = v8;
  }
  if (*((void *)v4 + 177))
  {
    -[AWDNetworkPerformanceMetric setUploadStableSpeed:](self, "setUploadStableSpeed:");
    id v4 = v8;
  }
  if (*((void *)v4 + 179))
  {
    -[AWDNetworkPerformanceMetric setUploadStartDataBearerTechnology:](self, "setUploadStartDataBearerTechnology:");
    id v4 = v8;
  }
  if (*((void *)v4 + 180))
  {
    -[AWDNetworkPerformanceMetric setUploadStartPrimaryIpv4Interface:](self, "setUploadStartPrimaryIpv4Interface:");
    id v4 = v8;
  }
  if (*((void *)v4 + 182))
  {
    -[AWDNetworkPerformanceMetric setUploadStartRat:](self, "setUploadStartRat:");
    id v4 = v8;
  }
  if (*((unsigned char *)v4 + 1687))
  {
    self->_useWifiWasSpecified = *((unsigned char *)v4 + 1679);
    *(_DWORD *)&self->_has |= 0x1000000u;
  }
  if (*((void *)v4 + 184))
  {
    -[AWDNetworkPerformanceMetric setWifiAveragePhyRateRx:](self, "setWifiAveragePhyRateRx:");
    id v4 = v8;
  }
  if (*((void *)v4 + 185))
  {
    -[AWDNetworkPerformanceMetric setWifiAverageRssi:](self, "setWifiAverageRssi:");
    id v4 = v8;
  }
  if (*((void *)v4 + 186))
  {
    -[AWDNetworkPerformanceMetric setWifiAverageSnr:](self, "setWifiAverageSnr:");
    id v4 = v8;
  }
  if (*((void *)v4 + 187))
  {
    -[AWDNetworkPerformanceMetric setWifiAverageTcpRtt:](self, "setWifiAverageTcpRtt:");
    id v4 = v8;
  }
  if (*((void *)v4 + 188))
  {
    -[AWDNetworkPerformanceMetric setWifiBtcMode:](self, "setWifiBtcMode:");
    id v4 = v8;
  }
  if (*((void *)v4 + 189))
  {
    -[AWDNetworkPerformanceMetric setWifiCca:](self, "setWifiCca:");
    id v4 = v8;
  }
  if (*((void *)v4 + 190))
  {
    -[AWDNetworkPerformanceMetric setWifiChannel:](self, "setWifiChannel:");
    id v4 = v8;
  }
  if (*((void *)v4 + 193))
  {
    -[AWDNetworkPerformanceMetric setWifiCwfCca:](self, "setWifiCwfCca:");
    id v4 = v8;
  }
  if (*((void *)v4 + 194))
  {
    -[AWDNetworkPerformanceMetric setWifiEapolControlMode:](self, "setWifiEapolControlMode:");
    id v4 = v8;
  }
  if (*((void *)v4 + 195))
  {
    -[AWDNetworkPerformanceMetric setWifiEapolSupplicantState:](self, "setWifiEapolSupplicantState:");
    id v4 = v8;
  }
  if (*((void *)v4 + 196))
  {
    -[AWDNetworkPerformanceMetric setWifiGuardInterval:](self, "setWifiGuardInterval:");
    id v4 = v8;
  }
  if (*((void *)v4 + 197))
  {
    -[AWDNetworkPerformanceMetric setWifiHiddenState:](self, "setWifiHiddenState:");
    id v4 = v8;
  }
  if ((*((unsigned char *)v4 + 1687) & 2) != 0)
  {
    self->_wifiIsCaptive = *((unsigned char *)v4 + 1680);
    *(_DWORD *)&self->_has |= 0x2000000u;
  }
  if (*((void *)v4 + 198))
  {
    -[AWDNetworkPerformanceMetric setWifiMcsIndex:](self, "setWifiMcsIndex:");
    id v4 = v8;
  }
  if (*((void *)v4 + 199))
  {
    -[AWDNetworkPerformanceMetric setWifiNoise:](self, "setWifiNoise:");
    id v4 = v8;
  }
  if (*((void *)v4 + 200))
  {
    -[AWDNetworkPerformanceMetric setWifiNumberOfSpatialStreams:](self, "setWifiNumberOfSpatialStreams:");
    id v4 = v8;
  }
  if (*((void *)v4 + 201))
  {
    -[AWDNetworkPerformanceMetric setWifiOpMode:](self, "setWifiOpMode:");
    id v4 = v8;
  }
  if (*((void *)v4 + 202))
  {
    -[AWDNetworkPerformanceMetric setWifiPhyMode:](self, "setWifiPhyMode:");
    id v4 = v8;
  }
  if (*((void *)v4 + 203))
  {
    -[AWDNetworkPerformanceMetric setWifiRssi:](self, "setWifiRssi:");
    id v4 = v8;
  }
  if (*((void *)v4 + 204))
  {
    -[AWDNetworkPerformanceMetric setWifiSecurity:](self, "setWifiSecurity:");
    id v4 = v8;
  }
  if (*((void *)v4 + 205))
  {
    -[AWDNetworkPerformanceMetric setWifiTxRate:](self, "setWifiTxRate:");
    id v4 = v8;
  }
  if (*((void *)v4 + 206))
  {
    -[AWDNetworkPerformanceMetric setWrmChannelType:](self, "setWrmChannelType:");
    id v4 = v8;
  }
  if (*((void *)v4 + 18))
  {
    -[AWDNetworkPerformanceMetric setCellularCellid:](self, "setCellularCellid:");
    id v4 = v8;
  }
  if ((*((unsigned char *)v4 + 1684) & 2) != 0)
  {
    self->_acceptablePerformanceResult = *((unsigned char *)v4 + 1656);
    *(_DWORD *)&self->_has |= 2u;
  }
  if (*((void *)v4 + 119))
  {
    -[AWDNetworkPerformanceMetric setNetworkQualityResponsiveness:](self, "setNetworkQualityResponsiveness:");
    id v4 = v8;
  }
  if (*((void *)v4 + 12))
  {
    -[AWDNetworkPerformanceMetric setCellularAggregatedDLBW:](self, "setCellularAggregatedDLBW:");
    id v4 = v8;
  }
  if (*((void *)v4 + 13))
  {
    -[AWDNetworkPerformanceMetric setCellularAggregatedULBW:](self, "setCellularAggregatedULBW:");
    id v4 = v8;
  }
  if (*((void *)v4 + 27))
  {
    -[AWDNetworkPerformanceMetric setCellularIssa:](self, "setCellularIssa:");
    id v4 = v8;
  }
  if (*((void *)v4 + 28))
  {
    -[AWDNetworkPerformanceMetric setCellularLac:](self, "setCellularLac:");
    id v4 = v8;
  }
  if (*((void *)v4 + 31))
  {
    -[AWDNetworkPerformanceMetric setCellularLteNrConfiguredBw:](self, "setCellularLteNrConfiguredBw:");
    id v4 = v8;
  }
  if (*((void *)v4 + 32))
  {
    -[AWDNetworkPerformanceMetric setCellularMaxDlMod:](self, "setCellularMaxDlMod:");
    id v4 = v8;
  }
  if (*((void *)v4 + 33))
  {
    -[AWDNetworkPerformanceMetric setCellularMaxNwMimoLyr:](self, "setCellularMaxNwMimoLyr:");
    id v4 = v8;
  }
  if (*((void *)v4 + 34))
  {
    -[AWDNetworkPerformanceMetric setCellularMaxSchdMimoLyr:](self, "setCellularMaxSchdMimoLyr:");
    id v4 = v8;
  }
  if (*((void *)v4 + 35))
  {
    -[AWDNetworkPerformanceMetric setCellularMaxUeRank:](self, "setCellularMaxUeRank:");
    id v4 = v8;
  }
  if (*((void *)v4 + 36))
  {
    -[AWDNetworkPerformanceMetric setCellularMaxUlMod:](self, "setCellularMaxUlMod:");
    id v4 = v8;
  }
  if (*((void *)v4 + 52))
  {
    -[AWDNetworkPerformanceMetric setCellularNrSinr:](self, "setCellularNrSinr:");
    id v4 = v8;
  }
  if (*((void *)v4 + 54))
  {
    -[AWDNetworkPerformanceMetric setCellularNrarfcn:](self, "setCellularNrarfcn:");
    id v4 = v8;
  }
  if (*((void *)v4 + 58))
  {
    -[AWDNetworkPerformanceMetric setCellularRadioFrequency:](self, "setCellularRadioFrequency:");
    id v4 = v8;
  }
  if (*((void *)v4 + 68))
  {
    -[AWDNetworkPerformanceMetric setCellularTotalDlMimoLayers:](self, "setCellularTotalDlMimoLayers:");
    id v4 = v8;
  }
  if (*((void *)v4 + 70))
  {
    -[AWDNetworkPerformanceMetric setCellularTotalNumCcs:](self, "setCellularTotalNumCcs:");
    id v4 = v8;
  }
  if (*((void *)v4 + 108))
  {
    -[AWDNetworkPerformanceMetric setDownloadStartRadioFrequency:](self, "setDownloadStartRadioFrequency:");
    id v4 = v8;
  }
  if (*((void *)v4 + 79))
  {
    -[AWDNetworkPerformanceMetric setDownloadEndRadioFrequency:](self, "setDownloadEndRadioFrequency:");
    id v4 = v8;
  }
  if (*((void *)v4 + 112))
  {
    -[AWDNetworkPerformanceMetric setNetworkPrimaryIpv6InterfaceName:](self, "setNetworkPrimaryIpv6InterfaceName:");
    id v4 = v8;
  }
  if (*((void *)v4 + 113))
  {
    -[AWDNetworkPerformanceMetric setNetworkPrimaryIpv6ServiceName:](self, "setNetworkPrimaryIpv6ServiceName:");
    id v4 = v8;
  }
  if (*((void *)v4 + 181))
  {
    -[AWDNetworkPerformanceMetric setUploadStartRadioFrequency:](self, "setUploadStartRadioFrequency:");
    id v4 = v8;
  }
  if (*((void *)v4 + 152))
  {
    -[AWDNetworkPerformanceMetric setUploadEndRadioFrequency:](self, "setUploadEndRadioFrequency:");
    id v4 = v8;
  }
  if (*((void *)v4 + 81))
  {
    -[AWDNetworkPerformanceMetric setDownloadError:](self, "setDownloadError:");
    id v4 = v8;
  }
  if (*((void *)v4 + 115))
  {
    -[AWDNetworkPerformanceMetric setNetworkQualityError:](self, "setNetworkQualityError:");
    id v4 = v8;
  }
  if (*((void *)v4 + 114))
  {
    -[AWDNetworkPerformanceMetric setNetworkQualityDownloadSpeed:](self, "setNetworkQualityDownloadSpeed:");
    id v4 = v8;
  }
  if (*((void *)v4 + 120))
  {
    -[AWDNetworkPerformanceMetric setNetworkQualityUploadSpeed:](self, "setNetworkQualityUploadSpeed:");
    id v4 = v8;
  }
  if (*((void *)v4 + 118))
  {
    -[AWDNetworkPerformanceMetric setNetworkQualityRating:](self, "setNetworkQualityRating:");
    id v4 = v8;
  }
  if (*((void *)v4 + 183))
  {
    -[AWDNetworkPerformanceMetric setVpnConnectionState:](self, "setVpnConnectionState:");
    id v4 = v8;
  }
  if (*((void *)v4 + 154))
  {
    -[AWDNetworkPerformanceMetric setUploadError:](self, "setUploadError:");
    id v4 = v8;
  }
  if (*((void *)v4 + 156))
  {
    -[AWDNetworkPerformanceMetric setUploadErrorDomain:](self, "setUploadErrorDomain:");
    id v4 = v8;
  }
  if (*((void *)v4 + 155))
  {
    -[AWDNetworkPerformanceMetric setUploadErrorCode:](self, "setUploadErrorCode:");
    id v4 = v8;
  }
  if (*((void *)v4 + 83))
  {
    -[AWDNetworkPerformanceMetric setDownloadErrorDomain:](self, "setDownloadErrorDomain:");
    id v4 = v8;
  }
  if (*((void *)v4 + 82))
  {
    -[AWDNetworkPerformanceMetric setDownloadErrorCode:](self, "setDownloadErrorCode:");
    id v4 = v8;
  }
  if (*((void *)v4 + 124))
  {
    -[AWDNetworkPerformanceMetric setPingError:](self, "setPingError:");
    id v4 = v8;
  }
  if (*((void *)v4 + 126))
  {
    -[AWDNetworkPerformanceMetric setPingErrorDomain:](self, "setPingErrorDomain:");
    id v4 = v8;
  }
  if (*((void *)v4 + 125))
  {
    -[AWDNetworkPerformanceMetric setPingErrorCode:](self, "setPingErrorCode:");
    id v4 = v8;
  }
  if (*((void *)v4 + 117))
  {
    -[AWDNetworkPerformanceMetric setNetworkQualityErrorDomain:](self, "setNetworkQualityErrorDomain:");
    id v4 = v8;
  }
  if (*((void *)v4 + 116))
  {
    -[AWDNetworkPerformanceMetric setNetworkQualityErrorCode:](self, "setNetworkQualityErrorCode:");
    id v4 = v8;
  }
  if (*((void *)v4 + 59))
  {
    -[AWDNetworkPerformanceMetric setCellularRnMobileCountryCode:](self, "setCellularRnMobileCountryCode:");
    id v4 = v8;
  }
  if (*((void *)v4 + 60))
  {
    -[AWDNetworkPerformanceMetric setCellularRnMobileNetworkCode:](self, "setCellularRnMobileNetworkCode:");
    id v4 = v8;
  }
  if (*((unsigned char *)v4 + 1685))
  {
    self->_cellularDataIsEnabled = *((unsigned char *)v4 + 1663);
    *(_DWORD *)&self->_has |= 0x100u;
  }
  if (*((void *)v4 + 105))
  {
    -[AWDNetworkPerformanceMetric setDownloadStartCellularEstimate:](self, "setDownloadStartCellularEstimate:");
    id v4 = v8;
  }
  if (*((void *)v4 + 76))
  {
    -[AWDNetworkPerformanceMetric setDownloadEndCellularEstimate:](self, "setDownloadEndCellularEstimate:");
    id v4 = v8;
  }
  if (*((void *)v4 + 87))
  {
    -[AWDNetworkPerformanceMetric setDownloadMaxCellularEstimate:](self, "setDownloadMaxCellularEstimate:");
    id v4 = v8;
  }
  if (*((void *)v4 + 178))
  {
    -[AWDNetworkPerformanceMetric setUploadStartCellularEstimate:](self, "setUploadStartCellularEstimate:");
    id v4 = v8;
  }
  if (*((void *)v4 + 149))
  {
    -[AWDNetworkPerformanceMetric setUploadEndCellularEstimate:](self, "setUploadEndCellularEstimate:");
    id v4 = v8;
  }
  if (*((void *)v4 + 160))
  {
    -[AWDNetworkPerformanceMetric setUploadMaxCellularEstimate:](self, "setUploadMaxCellularEstimate:");
    id v4 = v8;
  }
  if (*((void *)v4 + 96))
  {
    -[AWDNetworkPerformanceMetric setDownloadResponsiveness:](self, "setDownloadResponsiveness:");
    id v4 = v8;
  }
  if (*((void *)v4 + 97))
  {
    -[AWDNetworkPerformanceMetric setDownloadResponsivenessConfidence:](self, "setDownloadResponsivenessConfidence:");
    id v4 = v8;
  }
  if (*((void *)v4 + 98))
  {
    -[AWDNetworkPerformanceMetric setDownloadResponsivenessRating:](self, "setDownloadResponsivenessRating:");
    id v4 = v8;
  }
  if (*((void *)v4 + 102))
  {
    -[AWDNetworkPerformanceMetric setDownloadSpeedConfidence:](self, "setDownloadSpeedConfidence:");
    id v4 = v8;
  }
  if (*((void *)v4 + 103))
  {
    -[AWDNetworkPerformanceMetric setDownloadSpeedRating:](self, "setDownloadSpeedRating:");
    id v4 = v8;
  }
  if (*((void *)v4 + 169))
  {
    -[AWDNetworkPerformanceMetric setUploadResponsiveness:](self, "setUploadResponsiveness:");
    id v4 = v8;
  }
  if (*((void *)v4 + 170))
  {
    -[AWDNetworkPerformanceMetric setUploadResponsivenessConfidence:](self, "setUploadResponsivenessConfidence:");
    id v4 = v8;
  }
  if (*((void *)v4 + 171))
  {
    -[AWDNetworkPerformanceMetric setUploadResponsivenessRating:](self, "setUploadResponsivenessRating:");
    id v4 = v8;
  }
  if (*((void *)v4 + 175))
  {
    -[AWDNetworkPerformanceMetric setUploadSpeedConfidence:](self, "setUploadSpeedConfidence:");
    id v4 = v8;
  }
  if (*((void *)v4 + 176))
  {
    -[AWDNetworkPerformanceMetric setUploadSpeedRating:](self, "setUploadSpeedRating:");
    id v4 = v8;
  }
  if (*((void *)v4 + 191))
  {
    -[AWDNetworkPerformanceMetric setWifiChannelBand:](self, "setWifiChannelBand:");
    id v4 = v8;
  }
  if (*((void *)v4 + 192))
  {
    -[AWDNetworkPerformanceMetric setWifiChannelWidth:](self, "setWifiChannelWidth:");
    id v4 = v8;
  }
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (BOOL)acceptablePerformanceResult
{
  return self->_acceptablePerformanceResult;
}

- (NSString)awdlElectionParameters
{
  return self->_awdlElectionParameters;
}

- (void)setAwdlElectionParameters:(id)a3
{
}

- (NSString)awdlMasterChannel
{
  return self->_awdlMasterChannel;
}

- (void)setAwdlMasterChannel:(id)a3
{
}

- (NSString)awdlOpMode
{
  return self->_awdlOpMode;
}

- (void)setAwdlOpMode:(id)a3
{
}

- (BOOL)awdlPowerState
{
  return self->_awdlPowerState;
}

- (NSString)awdlSchedule
{
  return self->_awdlSchedule;
}

- (void)setAwdlSchedule:(id)a3
{
}

- (NSString)awdlSecondaryMasterChannel
{
  return self->_awdlSecondaryMasterChannel;
}

- (void)setAwdlSecondaryMasterChannel:(id)a3
{
}

- (NSString)awdlSyncChannelSequence
{
  return self->_awdlSyncChannelSequence;
}

- (void)setAwdlSyncChannelSequence:(id)a3
{
}

- (NSString)awdlSyncState
{
  return self->_awdlSyncState;
}

- (void)setAwdlSyncState:(id)a3
{
}

- (NSString)btConnectedDevicesCount
{
  return self->_btConnectedDevicesCount;
}

- (void)setBtConnectedDevicesCount:(id)a3
{
}

- (BOOL)btIsConnectable
{
  return self->_btIsConnectable;
}

- (BOOL)btIsDiscoverable
{
  return self->_btIsDiscoverable;
}

- (BOOL)btIsPowerOn
{
  return self->_btIsPowerOn;
}

- (BOOL)btIsScanning
{
  return self->_btIsScanning;
}

- (NSString)callingClient
{
  return self->_callingClient;
}

- (void)setCallingClient:(id)a3
{
}

- (NSString)cellularActiveContexts
{
  return self->_cellularActiveContexts;
}

- (void)setCellularActiveContexts:(id)a3
{
}

- (BOOL)cellularAllowsVoip
{
  return self->_cellularAllowsVoip;
}

- (NSString)cellularAttached
{
  return self->_cellularAttached;
}

- (void)setCellularAttached:(id)a3
{
}

- (NSString)cellularBandinfo
{
  return self->_cellularBandinfo;
}

- (void)setCellularBandinfo:(id)a3
{
}

- (NSString)cellularBandwidth
{
  return self->_cellularBandwidth;
}

- (void)setCellularBandwidth:(id)a3
{
}

- (NSString)cellularCarrierName
{
  return self->_cellularCarrierName;
}

- (void)setCellularCarrierName:(id)a3
{
}

- (NSString)cellularDataBearerSoMask
{
  return self->_cellularDataBearerSoMask;
}

- (void)setCellularDataBearerSoMask:(id)a3
{
}

- (NSString)cellularDataBearerTechnology
{
  return self->_cellularDataBearerTechnology;
}

- (void)setCellularDataBearerTechnology:(id)a3
{
}

- (NSString)cellularDataPlanSignalingReductionOverride
{
  return self->_cellularDataPlanSignalingReductionOverride;
}

- (void)setCellularDataPlanSignalingReductionOverride:(id)a3
{
}

- (NSString)cellularDataPossible
{
  return self->_cellularDataPossible;
}

- (void)setCellularDataPossible:(id)a3
{
}

- (NSString)cellularInHomeCountry
{
  return self->_cellularInHomeCountry;
}

- (void)setCellularInHomeCountry:(id)a3
{
}

- (NSString)cellularIndicator
{
  return self->_cellularIndicator;
}

- (void)setCellularIndicator:(id)a3
{
}

- (NSString)cellularIndicatorOverride
{
  return self->_cellularIndicatorOverride;
}

- (void)setCellularIndicatorOverride:(id)a3
{
}

- (NSString)cellularIsoCountryCode
{
  return self->_cellularIsoCountryCode;
}

- (void)setCellularIsoCountryCode:(id)a3
{
}

- (NSString)cellularLqm
{
  return self->_cellularLqm;
}

- (void)setCellularLqm:(id)a3
{
}

- (NSString)cellularLteMaxScheduledLayers
{
  return self->_cellularLteMaxScheduledLayers;
}

- (void)setCellularLteMaxScheduledLayers:(id)a3
{
}

- (NSString)cellularMobileCountryCode
{
  return self->_cellularMobileCountryCode;
}

- (void)setCellularMobileCountryCode:(id)a3
{
}

- (NSString)cellularMobileNetworkCode
{
  return self->_cellularMobileNetworkCode;
}

- (void)setCellularMobileNetworkCode:(id)a3
{
}

- (NSString)cellularNewRadioCoverage
{
  return self->_cellularNewRadioCoverage;
}

- (void)setCellularNewRadioCoverage:(id)a3
{
}

- (NSString)cellularNewRadioDataBearer
{
  return self->_cellularNewRadioDataBearer;
}

- (void)setCellularNewRadioDataBearer:(id)a3
{
}

- (NSString)cellularNewRadioMmwaveDataBearer
{
  return self->_cellularNewRadioMmwaveDataBearer;
}

- (void)setCellularNewRadioMmwaveDataBearer:(id)a3
{
}

- (NSString)cellularNewRadioNsaCoverage
{
  return self->_cellularNewRadioNsaCoverage;
}

- (void)setCellularNewRadioNsaCoverage:(id)a3
{
}

- (NSString)cellularNewRadioNsaDataBearer
{
  return self->_cellularNewRadioNsaDataBearer;
}

- (void)setCellularNewRadioNsaDataBearer:(id)a3
{
}

- (NSString)cellularNewRadioSaCoverage
{
  return self->_cellularNewRadioSaCoverage;
}

- (void)setCellularNewRadioSaCoverage:(id)a3
{
}

- (NSString)cellularNewRadioSaDataBearer
{
  return self->_cellularNewRadioSaDataBearer;
}

- (void)setCellularNewRadioSaDataBearer:(id)a3
{
}

- (NSString)cellularNewRadioSub6DataBearer
{
  return self->_cellularNewRadioSub6DataBearer;
}

- (void)setCellularNewRadioSub6DataBearer:(id)a3
{
}

- (NSString)cellularNrConfiguredBw
{
  return self->_cellularNrConfiguredBw;
}

- (void)setCellularNrConfiguredBw:(id)a3
{
}

- (NSString)cellularNrLayers
{
  return self->_cellularNrLayers;
}

- (void)setCellularNrLayers:(id)a3
{
}

- (NSString)cellularNrModulation
{
  return self->_cellularNrModulation;
}

- (void)setCellularNrModulation:(id)a3
{
}

- (NSString)cellularNrRsrp
{
  return self->_cellularNrRsrp;
}

- (void)setCellularNrRsrp:(id)a3
{
}

- (NSString)cellularNrRsrq
{
  return self->_cellularNrRsrq;
}

- (void)setCellularNrRsrq:(id)a3
{
}

- (NSString)cellularNrSnr
{
  return self->_cellularNrSnr;
}

- (void)setCellularNrSnr:(id)a3
{
}

- (NSString)cellularPid
{
  return self->_cellularPid;
}

- (void)setCellularPid:(id)a3
{
}

- (NSString)cellularRadioAccessTechnology
{
  return self->_cellularRadioAccessTechnology;
}

- (void)setCellularRadioAccessTechnology:(id)a3
{
}

- (NSString)cellularRadioAccessTechnologyCtDataStatus
{
  return self->_cellularRadioAccessTechnologyCtDataStatus;
}

- (void)setCellularRadioAccessTechnologyCtDataStatus:(id)a3
{
}

- (NSString)cellularRoamAllowed
{
  return self->_cellularRoamAllowed;
}

- (void)setCellularRoamAllowed:(id)a3
{
}

- (NSString)cellularRsrp
{
  return self->_cellularRsrp;
}

- (void)setCellularRsrp:(id)a3
{
}

- (NSString)cellularSnr
{
  return self->_cellularSnr;
}

- (void)setCellularSnr:(id)a3
{
}

- (NSString)cellularTac
{
  return self->_cellularTac;
}

- (void)setCellularTac:(id)a3
{
}

- (NSString)cellularTotalActiveContexts
{
  return self->_cellularTotalActiveContexts;
}

- (void)setCellularTotalActiveContexts:(id)a3
{
}

- (NSString)cellularTotalBw
{
  return self->_cellularTotalBw;
}

- (void)setCellularTotalBw:(id)a3
{
}

- (NSString)cellularTotalCcs
{
  return self->_cellularTotalCcs;
}

- (void)setCellularTotalCcs:(id)a3
{
}

- (NSString)cellularTotalLayers
{
  return self->_cellularTotalLayers;
}

- (void)setCellularTotalLayers:(id)a3
{
}

- (NSString)cellularUarfcn
{
  return self->_cellularUarfcn;
}

- (void)setCellularUarfcn:(id)a3
{
}

- (NSString)downloadCdnPop
{
  return self->_downloadCdnPop;
}

- (void)setDownloadCdnPop:(id)a3
{
}

- (NSString)downloadCdnUuid
{
  return self->_downloadCdnUuid;
}

- (void)setDownloadCdnUuid:(id)a3
{
}

- (NSString)downloadConnectionTime
{
  return self->_downloadConnectionTime;
}

- (void)setDownloadConnectionTime:(id)a3
{
}

- (NSString)downloadDomainLookupTime
{
  return self->_downloadDomainLookupTime;
}

- (void)setDownloadDomainLookupTime:(id)a3
{
}

- (NSString)downloadEndDataBearerTechnology
{
  return self->_downloadEndDataBearerTechnology;
}

- (void)setDownloadEndDataBearerTechnology:(id)a3
{
}

- (NSString)downloadEndPrimaryIpv4Interface
{
  return self->_downloadEndPrimaryIpv4Interface;
}

- (void)setDownloadEndPrimaryIpv4Interface:(id)a3
{
}

- (NSString)downloadEndRat
{
  return self->_downloadEndRat;
}

- (void)setDownloadEndRat:(id)a3
{
}

- (NSString)downloadFileSize
{
  return self->_downloadFileSize;
}

- (void)setDownloadFileSize:(id)a3
{
}

- (NSString)downloadInterfaceName
{
  return self->_downloadInterfaceName;
}

- (void)setDownloadInterfaceName:(id)a3
{
}

- (NSString)downloadInterfaceServiceName
{
  return self->_downloadInterfaceServiceName;
}

- (void)setDownloadInterfaceServiceName:(id)a3
{
}

- (BOOL)downloadIsCellular
{
  return self->_downloadIsCellular;
}

- (BOOL)downloadIsConstrained
{
  return self->_downloadIsConstrained;
}

- (BOOL)downloadIsExpensive
{
  return self->_downloadIsExpensive;
}

- (BOOL)downloadIsMultipath
{
  return self->_downloadIsMultipath;
}

- (BOOL)downloadIsProxyConnection
{
  return self->_downloadIsProxyConnection;
}

- (BOOL)downloadIsReusedConnection
{
  return self->_downloadIsReusedConnection;
}

- (NSString)downloadMaxSpeedObserved
{
  return self->_downloadMaxSpeedObserved;
}

- (void)setDownloadMaxSpeedObserved:(id)a3
{
}

- (NSString)downloadNumberOfStreams
{
  return self->_downloadNumberOfStreams;
}

- (void)setDownloadNumberOfStreams:(id)a3
{
}

- (NSString)downloadProtocolName
{
  return self->_downloadProtocolName;
}

- (void)setDownloadProtocolName:(id)a3
{
}

- (NSString)downloadRemoteAddress
{
  return self->_downloadRemoteAddress;
}

- (void)setDownloadRemoteAddress:(id)a3
{
}

- (NSString)downloadRemotePort
{
  return self->_downloadRemotePort;
}

- (void)setDownloadRemotePort:(id)a3
{
}

- (NSString)downloadRequestTime
{
  return self->_downloadRequestTime;
}

- (void)setDownloadRequestTime:(id)a3
{
}

- (NSString)downloadRequestToResponseTime
{
  return self->_downloadRequestToResponseTime;
}

- (void)setDownloadRequestToResponseTime:(id)a3
{
}

- (NSString)downloadResponseTime
{
  return self->_downloadResponseTime;
}

- (void)setDownloadResponseTime:(id)a3
{
}

- (NSString)downloadSecureConnectionTime
{
  return self->_downloadSecureConnectionTime;
}

- (void)setDownloadSecureConnectionTime:(id)a3
{
}

- (NSString)downloadServer
{
  return self->_downloadServer;
}

- (void)setDownloadServer:(id)a3
{
}

- (NSString)downloadSpeed
{
  return self->_downloadSpeed;
}

- (void)setDownloadSpeed:(id)a3
{
}

- (NSString)downloadStableSpeed
{
  return self->_downloadStableSpeed;
}

- (void)setDownloadStableSpeed:(id)a3
{
}

- (NSString)downloadStartDataBearerTechnology
{
  return self->_downloadStartDataBearerTechnology;
}

- (void)setDownloadStartDataBearerTechnology:(id)a3
{
}

- (NSString)downloadStartPrimaryIpv4Interface
{
  return self->_downloadStartPrimaryIpv4Interface;
}

- (void)setDownloadStartPrimaryIpv4Interface:(id)a3
{
}

- (NSString)downloadStartRat
{
  return self->_downloadStartRat;
}

- (void)setDownloadStartRat:(id)a3
{
}

- (BOOL)networkIsAppleReachable
{
  return self->_networkIsAppleReachable;
}

- (NSString)networkPrimaryIpv4InterfaceName
{
  return self->_networkPrimaryIpv4InterfaceName;
}

- (void)setNetworkPrimaryIpv4InterfaceName:(id)a3
{
}

- (NSString)networkPrimaryIpv4ServiceName
{
  return self->_networkPrimaryIpv4ServiceName;
}

- (void)setNetworkPrimaryIpv4ServiceName:(id)a3
{
}

- (NSString)nptkitFrameworkVersion
{
  return self->_nptkitFrameworkVersion;
}

- (void)setNptkitFrameworkVersion:(id)a3
{
}

- (NSString)performanceTestStartTime
{
  return self->_performanceTestStartTime;
}

- (void)setPerformanceTestStartTime:(id)a3
{
}

- (NSString)pingAddress
{
  return self->_pingAddress;
}

- (void)setPingAddress:(id)a3
{
}

- (NSString)pingLossPercent
{
  return self->_pingLossPercent;
}

- (void)setPingLossPercent:(id)a3
{
}

- (NSString)pingMaxLatency
{
  return self->_pingMaxLatency;
}

- (void)setPingMaxLatency:(id)a3
{
}

- (NSString)pingMeanLatency
{
  return self->_pingMeanLatency;
}

- (void)setPingMeanLatency:(id)a3
{
}

- (NSString)pingMinLatency
{
  return self->_pingMinLatency;
}

- (void)setPingMinLatency:(id)a3
{
}

- (NSString)pingStandardDeviation
{
  return self->_pingStandardDeviation;
}

- (void)setPingStandardDeviation:(id)a3
{
}

- (NSString)powerBatteryWarningLevel
{
  return self->_powerBatteryWarningLevel;
}

- (void)setPowerBatteryWarningLevel:(id)a3
{
}

- (NSString)powerSourceType
{
  return self->_powerSourceType;
}

- (void)setPowerSourceType:(id)a3
{
}

- (NSString)powerStateCaps
{
  return self->_powerStateCaps;
}

- (void)setPowerStateCaps:(id)a3
{
}

- (NSString)systemActiveProcessorCount
{
  return self->_systemActiveProcessorCount;
}

- (void)setSystemActiveProcessorCount:(id)a3
{
}

- (NSString)systemBatteryLevel
{
  return self->_systemBatteryLevel;
}

- (void)setSystemBatteryLevel:(id)a3
{
}

- (NSString)systemBatteryState
{
  return self->_systemBatteryState;
}

- (void)setSystemBatteryState:(id)a3
{
}

- (NSString)systemDeviceClass
{
  return self->_systemDeviceClass;
}

- (void)setSystemDeviceClass:(id)a3
{
}

- (NSString)systemDeviceModel
{
  return self->_systemDeviceModel;
}

- (void)setSystemDeviceModel:(id)a3
{
}

- (BOOL)systemLowPowerModeEnabled
{
  return self->_systemLowPowerModeEnabled;
}

- (NSString)systemName
{
  return self->_systemName;
}

- (void)setSystemName:(id)a3
{
}

- (NSString)systemOsVariant
{
  return self->_systemOsVariant;
}

- (void)setSystemOsVariant:(id)a3
{
}

- (NSString)systemPhysicalMemory
{
  return self->_systemPhysicalMemory;
}

- (void)setSystemPhysicalMemory:(id)a3
{
}

- (BOOL)systemPowersourceConnected
{
  return self->_systemPowersourceConnected;
}

- (NSString)systemProcessorCount
{
  return self->_systemProcessorCount;
}

- (void)setSystemProcessorCount:(id)a3
{
}

- (NSString)systemVersion
{
  return self->_systemVersion;
}

- (void)setSystemVersion:(id)a3
{
}

- (NSString)uploadCdnPop
{
  return self->_uploadCdnPop;
}

- (void)setUploadCdnPop:(id)a3
{
}

- (NSString)uploadCdnUuid
{
  return self->_uploadCdnUuid;
}

- (void)setUploadCdnUuid:(id)a3
{
}

- (NSString)uploadConnectionTime
{
  return self->_uploadConnectionTime;
}

- (void)setUploadConnectionTime:(id)a3
{
}

- (NSString)uploadDomainLookupTime
{
  return self->_uploadDomainLookupTime;
}

- (void)setUploadDomainLookupTime:(id)a3
{
}

- (NSString)uploadEndDataBearerTechnology
{
  return self->_uploadEndDataBearerTechnology;
}

- (void)setUploadEndDataBearerTechnology:(id)a3
{
}

- (NSString)uploadEndPrimaryIpv4Interface
{
  return self->_uploadEndPrimaryIpv4Interface;
}

- (void)setUploadEndPrimaryIpv4Interface:(id)a3
{
}

- (NSString)uploadEndRat
{
  return self->_uploadEndRat;
}

- (void)setUploadEndRat:(id)a3
{
}

- (NSString)uploadFileSize
{
  return self->_uploadFileSize;
}

- (void)setUploadFileSize:(id)a3
{
}

- (NSString)uploadInterfaceName
{
  return self->_uploadInterfaceName;
}

- (void)setUploadInterfaceName:(id)a3
{
}

- (NSString)uploadInterfaceServiceName
{
  return self->_uploadInterfaceServiceName;
}

- (void)setUploadInterfaceServiceName:(id)a3
{
}

- (BOOL)uploadIsCellular
{
  return self->_uploadIsCellular;
}

- (BOOL)uploadIsConstrained
{
  return self->_uploadIsConstrained;
}

- (BOOL)uploadIsExpensive
{
  return self->_uploadIsExpensive;
}

- (BOOL)uploadIsMultipath
{
  return self->_uploadIsMultipath;
}

- (BOOL)uploadIsProxyConnection
{
  return self->_uploadIsProxyConnection;
}

- (BOOL)uploadIsReusedConnection
{
  return self->_uploadIsReusedConnection;
}

- (NSString)uploadMaxSpeedObserved
{
  return self->_uploadMaxSpeedObserved;
}

- (void)setUploadMaxSpeedObserved:(id)a3
{
}

- (NSString)uploadNumberOfStreams
{
  return self->_uploadNumberOfStreams;
}

- (void)setUploadNumberOfStreams:(id)a3
{
}

- (NSString)uploadProtocolName
{
  return self->_uploadProtocolName;
}

- (void)setUploadProtocolName:(id)a3
{
}

- (NSString)uploadRemoteAddress
{
  return self->_uploadRemoteAddress;
}

- (void)setUploadRemoteAddress:(id)a3
{
}

- (NSString)uploadRemotePort
{
  return self->_uploadRemotePort;
}

- (void)setUploadRemotePort:(id)a3
{
}

- (NSString)uploadRequestTime
{
  return self->_uploadRequestTime;
}

- (void)setUploadRequestTime:(id)a3
{
}

- (NSString)uploadRequestToResponseTime
{
  return self->_uploadRequestToResponseTime;
}

- (void)setUploadRequestToResponseTime:(id)a3
{
}

- (NSString)uploadResponseTime
{
  return self->_uploadResponseTime;
}

- (void)setUploadResponseTime:(id)a3
{
}

- (NSString)uploadSecureConnectionTime
{
  return self->_uploadSecureConnectionTime;
}

- (void)setUploadSecureConnectionTime:(id)a3
{
}

- (NSString)uploadServer
{
  return self->_uploadServer;
}

- (void)setUploadServer:(id)a3
{
}

- (NSString)uploadSpeed
{
  return self->_uploadSpeed;
}

- (void)setUploadSpeed:(id)a3
{
}

- (NSString)uploadStableSpeed
{
  return self->_uploadStableSpeed;
}

- (void)setUploadStableSpeed:(id)a3
{
}

- (NSString)uploadStartDataBearerTechnology
{
  return self->_uploadStartDataBearerTechnology;
}

- (void)setUploadStartDataBearerTechnology:(id)a3
{
}

- (NSString)uploadStartPrimaryIpv4Interface
{
  return self->_uploadStartPrimaryIpv4Interface;
}

- (void)setUploadStartPrimaryIpv4Interface:(id)a3
{
}

- (NSString)uploadStartRat
{
  return self->_uploadStartRat;
}

- (void)setUploadStartRat:(id)a3
{
}

- (BOOL)useWifiWasSpecified
{
  return self->_useWifiWasSpecified;
}

- (NSString)wifiAveragePhyRateRx
{
  return self->_wifiAveragePhyRateRx;
}

- (void)setWifiAveragePhyRateRx:(id)a3
{
}

- (NSString)wifiAverageRssi
{
  return self->_wifiAverageRssi;
}

- (void)setWifiAverageRssi:(id)a3
{
}

- (NSString)wifiAverageSnr
{
  return self->_wifiAverageSnr;
}

- (void)setWifiAverageSnr:(id)a3
{
}

- (NSString)wifiAverageTcpRtt
{
  return self->_wifiAverageTcpRtt;
}

- (void)setWifiAverageTcpRtt:(id)a3
{
}

- (NSString)wifiBtcMode
{
  return self->_wifiBtcMode;
}

- (void)setWifiBtcMode:(id)a3
{
}

- (NSString)wifiCca
{
  return self->_wifiCca;
}

- (void)setWifiCca:(id)a3
{
}

- (NSString)wifiChannel
{
  return self->_wifiChannel;
}

- (void)setWifiChannel:(id)a3
{
}

- (NSString)wifiCwfCca
{
  return self->_wifiCwfCca;
}

- (void)setWifiCwfCca:(id)a3
{
}

- (NSString)wifiEapolControlMode
{
  return self->_wifiEapolControlMode;
}

- (void)setWifiEapolControlMode:(id)a3
{
}

- (NSString)wifiEapolSupplicantState
{
  return self->_wifiEapolSupplicantState;
}

- (void)setWifiEapolSupplicantState:(id)a3
{
}

- (NSString)wifiGuardInterval
{
  return self->_wifiGuardInterval;
}

- (void)setWifiGuardInterval:(id)a3
{
}

- (NSString)wifiHiddenState
{
  return self->_wifiHiddenState;
}

- (void)setWifiHiddenState:(id)a3
{
}

- (BOOL)wifiIsCaptive
{
  return self->_wifiIsCaptive;
}

- (NSString)wifiMcsIndex
{
  return self->_wifiMcsIndex;
}

- (void)setWifiMcsIndex:(id)a3
{
}

- (NSString)wifiNoise
{
  return self->_wifiNoise;
}

- (void)setWifiNoise:(id)a3
{
}

- (NSString)wifiNumberOfSpatialStreams
{
  return self->_wifiNumberOfSpatialStreams;
}

- (void)setWifiNumberOfSpatialStreams:(id)a3
{
}

- (NSString)wifiOpMode
{
  return self->_wifiOpMode;
}

- (void)setWifiOpMode:(id)a3
{
}

- (NSString)wifiPhyMode
{
  return self->_wifiPhyMode;
}

- (void)setWifiPhyMode:(id)a3
{
}

- (NSString)wifiRssi
{
  return self->_wifiRssi;
}

- (void)setWifiRssi:(id)a3
{
}

- (NSString)wifiSecurity
{
  return self->_wifiSecurity;
}

- (void)setWifiSecurity:(id)a3
{
}

- (NSString)wifiTxRate
{
  return self->_wifiTxRate;
}

- (void)setWifiTxRate:(id)a3
{
}

- (NSString)wrmChannelType
{
  return self->_wrmChannelType;
}

- (void)setWrmChannelType:(id)a3
{
}

- (NSString)cellularCellid
{
  return self->_cellularCellid;
}

- (void)setCellularCellid:(id)a3
{
}

- (NSString)networkQualityResponsiveness
{
  return self->_networkQualityResponsiveness;
}

- (void)setNetworkQualityResponsiveness:(id)a3
{
}

- (NSString)cellularAggregatedDLBW
{
  return self->_cellularAggregatedDLBW;
}

- (void)setCellularAggregatedDLBW:(id)a3
{
}

- (NSString)cellularAggregatedULBW
{
  return self->_cellularAggregatedULBW;
}

- (void)setCellularAggregatedULBW:(id)a3
{
}

- (NSString)cellularIssa
{
  return self->_cellularIssa;
}

- (void)setCellularIssa:(id)a3
{
}

- (NSString)cellularLac
{
  return self->_cellularLac;
}

- (void)setCellularLac:(id)a3
{
}

- (NSString)cellularLteNrConfiguredBw
{
  return self->_cellularLteNrConfiguredBw;
}

- (void)setCellularLteNrConfiguredBw:(id)a3
{
}

- (NSString)cellularMaxDlMod
{
  return self->_cellularMaxDlMod;
}

- (void)setCellularMaxDlMod:(id)a3
{
}

- (NSString)cellularMaxNwMimoLyr
{
  return self->_cellularMaxNwMimoLyr;
}

- (void)setCellularMaxNwMimoLyr:(id)a3
{
}

- (NSString)cellularMaxSchdMimoLyr
{
  return self->_cellularMaxSchdMimoLyr;
}

- (void)setCellularMaxSchdMimoLyr:(id)a3
{
}

- (NSString)cellularMaxUeRank
{
  return self->_cellularMaxUeRank;
}

- (void)setCellularMaxUeRank:(id)a3
{
}

- (NSString)cellularMaxUlMod
{
  return self->_cellularMaxUlMod;
}

- (void)setCellularMaxUlMod:(id)a3
{
}

- (NSString)cellularNrSinr
{
  return self->_cellularNrSinr;
}

- (void)setCellularNrSinr:(id)a3
{
}

- (NSString)cellularNrarfcn
{
  return self->_cellularNrarfcn;
}

- (void)setCellularNrarfcn:(id)a3
{
}

- (NSString)cellularRadioFrequency
{
  return self->_cellularRadioFrequency;
}

- (void)setCellularRadioFrequency:(id)a3
{
}

- (NSString)cellularTotalDlMimoLayers
{
  return self->_cellularTotalDlMimoLayers;
}

- (void)setCellularTotalDlMimoLayers:(id)a3
{
}

- (NSString)cellularTotalNumCcs
{
  return self->_cellularTotalNumCcs;
}

- (void)setCellularTotalNumCcs:(id)a3
{
}

- (NSString)downloadStartRadioFrequency
{
  return self->_downloadStartRadioFrequency;
}

- (void)setDownloadStartRadioFrequency:(id)a3
{
}

- (NSString)downloadEndRadioFrequency
{
  return self->_downloadEndRadioFrequency;
}

- (void)setDownloadEndRadioFrequency:(id)a3
{
}

- (NSString)networkPrimaryIpv6InterfaceName
{
  return self->_networkPrimaryIpv6InterfaceName;
}

- (void)setNetworkPrimaryIpv6InterfaceName:(id)a3
{
}

- (NSString)networkPrimaryIpv6ServiceName
{
  return self->_networkPrimaryIpv6ServiceName;
}

- (void)setNetworkPrimaryIpv6ServiceName:(id)a3
{
}

- (NSString)uploadStartRadioFrequency
{
  return self->_uploadStartRadioFrequency;
}

- (void)setUploadStartRadioFrequency:(id)a3
{
}

- (NSString)uploadEndRadioFrequency
{
  return self->_uploadEndRadioFrequency;
}

- (void)setUploadEndRadioFrequency:(id)a3
{
}

- (NSString)downloadError
{
  return self->_downloadError;
}

- (void)setDownloadError:(id)a3
{
}

- (NSString)networkQualityError
{
  return self->_networkQualityError;
}

- (void)setNetworkQualityError:(id)a3
{
}

- (NSString)networkQualityDownloadSpeed
{
  return self->_networkQualityDownloadSpeed;
}

- (void)setNetworkQualityDownloadSpeed:(id)a3
{
}

- (NSString)networkQualityUploadSpeed
{
  return self->_networkQualityUploadSpeed;
}

- (void)setNetworkQualityUploadSpeed:(id)a3
{
}

- (NSString)networkQualityRating
{
  return self->_networkQualityRating;
}

- (void)setNetworkQualityRating:(id)a3
{
}

- (NSString)vpnConnectionState
{
  return self->_vpnConnectionState;
}

- (void)setVpnConnectionState:(id)a3
{
}

- (NSString)uploadError
{
  return self->_uploadError;
}

- (void)setUploadError:(id)a3
{
}

- (NSString)uploadErrorDomain
{
  return self->_uploadErrorDomain;
}

- (void)setUploadErrorDomain:(id)a3
{
}

- (NSString)uploadErrorCode
{
  return self->_uploadErrorCode;
}

- (void)setUploadErrorCode:(id)a3
{
}

- (NSString)downloadErrorDomain
{
  return self->_downloadErrorDomain;
}

- (void)setDownloadErrorDomain:(id)a3
{
}

- (NSString)downloadErrorCode
{
  return self->_downloadErrorCode;
}

- (void)setDownloadErrorCode:(id)a3
{
}

- (NSString)pingError
{
  return self->_pingError;
}

- (void)setPingError:(id)a3
{
}

- (NSString)pingErrorDomain
{
  return self->_pingErrorDomain;
}

- (void)setPingErrorDomain:(id)a3
{
}

- (NSString)pingErrorCode
{
  return self->_pingErrorCode;
}

- (void)setPingErrorCode:(id)a3
{
}

- (NSString)networkQualityErrorDomain
{
  return self->_networkQualityErrorDomain;
}

- (void)setNetworkQualityErrorDomain:(id)a3
{
}

- (NSString)networkQualityErrorCode
{
  return self->_networkQualityErrorCode;
}

- (void)setNetworkQualityErrorCode:(id)a3
{
}

- (NSString)cellularRnMobileCountryCode
{
  return self->_cellularRnMobileCountryCode;
}

- (void)setCellularRnMobileCountryCode:(id)a3
{
}

- (NSString)cellularRnMobileNetworkCode
{
  return self->_cellularRnMobileNetworkCode;
}

- (void)setCellularRnMobileNetworkCode:(id)a3
{
}

- (BOOL)cellularDataIsEnabled
{
  return self->_cellularDataIsEnabled;
}

- (NSString)downloadStartCellularEstimate
{
  return self->_downloadStartCellularEstimate;
}

- (void)setDownloadStartCellularEstimate:(id)a3
{
}

- (NSString)downloadEndCellularEstimate
{
  return self->_downloadEndCellularEstimate;
}

- (void)setDownloadEndCellularEstimate:(id)a3
{
}

- (NSString)downloadMaxCellularEstimate
{
  return self->_downloadMaxCellularEstimate;
}

- (void)setDownloadMaxCellularEstimate:(id)a3
{
}

- (NSString)uploadStartCellularEstimate
{
  return self->_uploadStartCellularEstimate;
}

- (void)setUploadStartCellularEstimate:(id)a3
{
}

- (NSString)uploadEndCellularEstimate
{
  return self->_uploadEndCellularEstimate;
}

- (void)setUploadEndCellularEstimate:(id)a3
{
}

- (NSString)uploadMaxCellularEstimate
{
  return self->_uploadMaxCellularEstimate;
}

- (void)setUploadMaxCellularEstimate:(id)a3
{
}

- (NSString)downloadResponsiveness
{
  return self->_downloadResponsiveness;
}

- (void)setDownloadResponsiveness:(id)a3
{
}

- (NSString)downloadResponsivenessConfidence
{
  return self->_downloadResponsivenessConfidence;
}

- (void)setDownloadResponsivenessConfidence:(id)a3
{
}

- (NSString)downloadResponsivenessRating
{
  return self->_downloadResponsivenessRating;
}

- (void)setDownloadResponsivenessRating:(id)a3
{
}

- (NSString)downloadSpeedConfidence
{
  return self->_downloadSpeedConfidence;
}

- (void)setDownloadSpeedConfidence:(id)a3
{
}

- (NSString)downloadSpeedRating
{
  return self->_downloadSpeedRating;
}

- (void)setDownloadSpeedRating:(id)a3
{
}

- (NSString)uploadResponsiveness
{
  return self->_uploadResponsiveness;
}

- (void)setUploadResponsiveness:(id)a3
{
}

- (NSString)uploadResponsivenessConfidence
{
  return self->_uploadResponsivenessConfidence;
}

- (void)setUploadResponsivenessConfidence:(id)a3
{
}

- (NSString)uploadResponsivenessRating
{
  return self->_uploadResponsivenessRating;
}

- (void)setUploadResponsivenessRating:(id)a3
{
}

- (NSString)uploadSpeedConfidence
{
  return self->_uploadSpeedConfidence;
}

- (void)setUploadSpeedConfidence:(id)a3
{
}

- (NSString)uploadSpeedRating
{
  return self->_uploadSpeedRating;
}

- (void)setUploadSpeedRating:(id)a3
{
}

- (NSString)wifiChannelBand
{
  return self->_wifiChannelBand;
}

- (void)setWifiChannelBand:(id)a3
{
}

- (NSString)wifiChannelWidth
{
  return self->_wifiChannelWidth;
}

- (void)setWifiChannelWidth:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wrmChannelType, 0);
  objc_storeStrong((id *)&self->_wifiTxRate, 0);
  objc_storeStrong((id *)&self->_wifiSecurity, 0);
  objc_storeStrong((id *)&self->_wifiRssi, 0);
  objc_storeStrong((id *)&self->_wifiPhyMode, 0);
  objc_storeStrong((id *)&self->_wifiOpMode, 0);
  objc_storeStrong((id *)&self->_wifiNumberOfSpatialStreams, 0);
  objc_storeStrong((id *)&self->_wifiNoise, 0);
  objc_storeStrong((id *)&self->_wifiMcsIndex, 0);
  objc_storeStrong((id *)&self->_wifiHiddenState, 0);
  objc_storeStrong((id *)&self->_wifiGuardInterval, 0);
  objc_storeStrong((id *)&self->_wifiEapolSupplicantState, 0);
  objc_storeStrong((id *)&self->_wifiEapolControlMode, 0);
  objc_storeStrong((id *)&self->_wifiCwfCca, 0);
  objc_storeStrong((id *)&self->_wifiChannelWidth, 0);
  objc_storeStrong((id *)&self->_wifiChannelBand, 0);
  objc_storeStrong((id *)&self->_wifiChannel, 0);
  objc_storeStrong((id *)&self->_wifiCca, 0);
  objc_storeStrong((id *)&self->_wifiBtcMode, 0);
  objc_storeStrong((id *)&self->_wifiAverageTcpRtt, 0);
  objc_storeStrong((id *)&self->_wifiAverageSnr, 0);
  objc_storeStrong((id *)&self->_wifiAverageRssi, 0);
  objc_storeStrong((id *)&self->_wifiAveragePhyRateRx, 0);
  objc_storeStrong((id *)&self->_vpnConnectionState, 0);
  objc_storeStrong((id *)&self->_uploadStartRat, 0);
  objc_storeStrong((id *)&self->_uploadStartRadioFrequency, 0);
  objc_storeStrong((id *)&self->_uploadStartPrimaryIpv4Interface, 0);
  objc_storeStrong((id *)&self->_uploadStartDataBearerTechnology, 0);
  objc_storeStrong((id *)&self->_uploadStartCellularEstimate, 0);
  objc_storeStrong((id *)&self->_uploadStableSpeed, 0);
  objc_storeStrong((id *)&self->_uploadSpeedRating, 0);
  objc_storeStrong((id *)&self->_uploadSpeedConfidence, 0);
  objc_storeStrong((id *)&self->_uploadSpeed, 0);
  objc_storeStrong((id *)&self->_uploadServer, 0);
  objc_storeStrong((id *)&self->_uploadSecureConnectionTime, 0);
  objc_storeStrong((id *)&self->_uploadResponsivenessRating, 0);
  objc_storeStrong((id *)&self->_uploadResponsivenessConfidence, 0);
  objc_storeStrong((id *)&self->_uploadResponsiveness, 0);
  objc_storeStrong((id *)&self->_uploadResponseTime, 0);
  objc_storeStrong((id *)&self->_uploadRequestToResponseTime, 0);
  objc_storeStrong((id *)&self->_uploadRequestTime, 0);
  objc_storeStrong((id *)&self->_uploadRemotePort, 0);
  objc_storeStrong((id *)&self->_uploadRemoteAddress, 0);
  objc_storeStrong((id *)&self->_uploadProtocolName, 0);
  objc_storeStrong((id *)&self->_uploadNumberOfStreams, 0);
  objc_storeStrong((id *)&self->_uploadMaxSpeedObserved, 0);
  objc_storeStrong((id *)&self->_uploadMaxCellularEstimate, 0);
  objc_storeStrong((id *)&self->_uploadInterfaceServiceName, 0);
  objc_storeStrong((id *)&self->_uploadInterfaceName, 0);
  objc_storeStrong((id *)&self->_uploadFileSize, 0);
  objc_storeStrong((id *)&self->_uploadErrorDomain, 0);
  objc_storeStrong((id *)&self->_uploadErrorCode, 0);
  objc_storeStrong((id *)&self->_uploadError, 0);
  objc_storeStrong((id *)&self->_uploadEndRat, 0);
  objc_storeStrong((id *)&self->_uploadEndRadioFrequency, 0);
  objc_storeStrong((id *)&self->_uploadEndPrimaryIpv4Interface, 0);
  objc_storeStrong((id *)&self->_uploadEndDataBearerTechnology, 0);
  objc_storeStrong((id *)&self->_uploadEndCellularEstimate, 0);
  objc_storeStrong((id *)&self->_uploadDomainLookupTime, 0);
  objc_storeStrong((id *)&self->_uploadConnectionTime, 0);
  objc_storeStrong((id *)&self->_uploadCdnUuid, 0);
  objc_storeStrong((id *)&self->_uploadCdnPop, 0);
  objc_storeStrong((id *)&self->_systemVersion, 0);
  objc_storeStrong((id *)&self->_systemProcessorCount, 0);
  objc_storeStrong((id *)&self->_systemPhysicalMemory, 0);
  objc_storeStrong((id *)&self->_systemOsVariant, 0);
  objc_storeStrong((id *)&self->_systemName, 0);
  objc_storeStrong((id *)&self->_systemDeviceModel, 0);
  objc_storeStrong((id *)&self->_systemDeviceClass, 0);
  objc_storeStrong((id *)&self->_systemBatteryState, 0);
  objc_storeStrong((id *)&self->_systemBatteryLevel, 0);
  objc_storeStrong((id *)&self->_systemActiveProcessorCount, 0);
  objc_storeStrong((id *)&self->_powerStateCaps, 0);
  objc_storeStrong((id *)&self->_powerSourceType, 0);
  objc_storeStrong((id *)&self->_powerBatteryWarningLevel, 0);
  objc_storeStrong((id *)&self->_pingStandardDeviation, 0);
  objc_storeStrong((id *)&self->_pingMinLatency, 0);
  objc_storeStrong((id *)&self->_pingMeanLatency, 0);
  objc_storeStrong((id *)&self->_pingMaxLatency, 0);
  objc_storeStrong((id *)&self->_pingLossPercent, 0);
  objc_storeStrong((id *)&self->_pingErrorDomain, 0);
  objc_storeStrong((id *)&self->_pingErrorCode, 0);
  objc_storeStrong((id *)&self->_pingError, 0);
  objc_storeStrong((id *)&self->_pingAddress, 0);
  objc_storeStrong((id *)&self->_performanceTestStartTime, 0);
  objc_storeStrong((id *)&self->_nptkitFrameworkVersion, 0);
  objc_storeStrong((id *)&self->_networkQualityUploadSpeed, 0);
  objc_storeStrong((id *)&self->_networkQualityResponsiveness, 0);
  objc_storeStrong((id *)&self->_networkQualityRating, 0);
  objc_storeStrong((id *)&self->_networkQualityErrorDomain, 0);
  objc_storeStrong((id *)&self->_networkQualityErrorCode, 0);
  objc_storeStrong((id *)&self->_networkQualityError, 0);
  objc_storeStrong((id *)&self->_networkQualityDownloadSpeed, 0);
  objc_storeStrong((id *)&self->_networkPrimaryIpv6ServiceName, 0);
  objc_storeStrong((id *)&self->_networkPrimaryIpv6InterfaceName, 0);
  objc_storeStrong((id *)&self->_networkPrimaryIpv4ServiceName, 0);
  objc_storeStrong((id *)&self->_networkPrimaryIpv4InterfaceName, 0);
  objc_storeStrong((id *)&self->_downloadStartRat, 0);
  objc_storeStrong((id *)&self->_downloadStartRadioFrequency, 0);
  objc_storeStrong((id *)&self->_downloadStartPrimaryIpv4Interface, 0);
  objc_storeStrong((id *)&self->_downloadStartDataBearerTechnology, 0);
  objc_storeStrong((id *)&self->_downloadStartCellularEstimate, 0);
  objc_storeStrong((id *)&self->_downloadStableSpeed, 0);
  objc_storeStrong((id *)&self->_downloadSpeedRating, 0);
  objc_storeStrong((id *)&self->_downloadSpeedConfidence, 0);
  objc_storeStrong((id *)&self->_downloadSpeed, 0);
  objc_storeStrong((id *)&self->_downloadServer, 0);
  objc_storeStrong((id *)&self->_downloadSecureConnectionTime, 0);
  objc_storeStrong((id *)&self->_downloadResponsivenessRating, 0);
  objc_storeStrong((id *)&self->_downloadResponsivenessConfidence, 0);
  objc_storeStrong((id *)&self->_downloadResponsiveness, 0);
  objc_storeStrong((id *)&self->_downloadResponseTime, 0);
  objc_storeStrong((id *)&self->_downloadRequestToResponseTime, 0);
  objc_storeStrong((id *)&self->_downloadRequestTime, 0);
  objc_storeStrong((id *)&self->_downloadRemotePort, 0);
  objc_storeStrong((id *)&self->_downloadRemoteAddress, 0);
  objc_storeStrong((id *)&self->_downloadProtocolName, 0);
  objc_storeStrong((id *)&self->_downloadNumberOfStreams, 0);
  objc_storeStrong((id *)&self->_downloadMaxSpeedObserved, 0);
  objc_storeStrong((id *)&self->_downloadMaxCellularEstimate, 0);
  objc_storeStrong((id *)&self->_downloadInterfaceServiceName, 0);
  objc_storeStrong((id *)&self->_downloadInterfaceName, 0);
  objc_storeStrong((id *)&self->_downloadFileSize, 0);
  objc_storeStrong((id *)&self->_downloadErrorDomain, 0);
  objc_storeStrong((id *)&self->_downloadErrorCode, 0);
  objc_storeStrong((id *)&self->_downloadError, 0);
  objc_storeStrong((id *)&self->_downloadEndRat, 0);
  objc_storeStrong((id *)&self->_downloadEndRadioFrequency, 0);
  objc_storeStrong((id *)&self->_downloadEndPrimaryIpv4Interface, 0);
  objc_storeStrong((id *)&self->_downloadEndDataBearerTechnology, 0);
  objc_storeStrong((id *)&self->_downloadEndCellularEstimate, 0);
  objc_storeStrong((id *)&self->_downloadDomainLookupTime, 0);
  objc_storeStrong((id *)&self->_downloadConnectionTime, 0);
  objc_storeStrong((id *)&self->_downloadCdnUuid, 0);
  objc_storeStrong((id *)&self->_downloadCdnPop, 0);
  objc_storeStrong((id *)&self->_cellularUarfcn, 0);
  objc_storeStrong((id *)&self->_cellularTotalNumCcs, 0);
  objc_storeStrong((id *)&self->_cellularTotalLayers, 0);
  objc_storeStrong((id *)&self->_cellularTotalDlMimoLayers, 0);
  objc_storeStrong((id *)&self->_cellularTotalCcs, 0);
  objc_storeStrong((id *)&self->_cellularTotalBw, 0);
  objc_storeStrong((id *)&self->_cellularTotalActiveContexts, 0);
  objc_storeStrong((id *)&self->_cellularTac, 0);
  objc_storeStrong((id *)&self->_cellularSnr, 0);
  objc_storeStrong((id *)&self->_cellularRsrp, 0);
  objc_storeStrong((id *)&self->_cellularRoamAllowed, 0);
  objc_storeStrong((id *)&self->_cellularRnMobileNetworkCode, 0);
  objc_storeStrong((id *)&self->_cellularRnMobileCountryCode, 0);
  objc_storeStrong((id *)&self->_cellularRadioFrequency, 0);
  objc_storeStrong((id *)&self->_cellularRadioAccessTechnologyCtDataStatus, 0);
  objc_storeStrong((id *)&self->_cellularRadioAccessTechnology, 0);
  objc_storeStrong((id *)&self->_cellularPid, 0);
  objc_storeStrong((id *)&self->_cellularNrarfcn, 0);
  objc_storeStrong((id *)&self->_cellularNrSnr, 0);
  objc_storeStrong((id *)&self->_cellularNrSinr, 0);
  objc_storeStrong((id *)&self->_cellularNrRsrq, 0);
  objc_storeStrong((id *)&self->_cellularNrRsrp, 0);
  objc_storeStrong((id *)&self->_cellularNrModulation, 0);
  objc_storeStrong((id *)&self->_cellularNrLayers, 0);
  objc_storeStrong((id *)&self->_cellularNrConfiguredBw, 0);
  objc_storeStrong((id *)&self->_cellularNewRadioSub6DataBearer, 0);
  objc_storeStrong((id *)&self->_cellularNewRadioSaDataBearer, 0);
  objc_storeStrong((id *)&self->_cellularNewRadioSaCoverage, 0);
  objc_storeStrong((id *)&self->_cellularNewRadioNsaDataBearer, 0);
  objc_storeStrong((id *)&self->_cellularNewRadioNsaCoverage, 0);
  objc_storeStrong((id *)&self->_cellularNewRadioMmwaveDataBearer, 0);
  objc_storeStrong((id *)&self->_cellularNewRadioDataBearer, 0);
  objc_storeStrong((id *)&self->_cellularNewRadioCoverage, 0);
  objc_storeStrong((id *)&self->_cellularMobileNetworkCode, 0);
  objc_storeStrong((id *)&self->_cellularMobileCountryCode, 0);
  objc_storeStrong((id *)&self->_cellularMaxUlMod, 0);
  objc_storeStrong((id *)&self->_cellularMaxUeRank, 0);
  objc_storeStrong((id *)&self->_cellularMaxSchdMimoLyr, 0);
  objc_storeStrong((id *)&self->_cellularMaxNwMimoLyr, 0);
  objc_storeStrong((id *)&self->_cellularMaxDlMod, 0);
  objc_storeStrong((id *)&self->_cellularLteNrConfiguredBw, 0);
  objc_storeStrong((id *)&self->_cellularLteMaxScheduledLayers, 0);
  objc_storeStrong((id *)&self->_cellularLqm, 0);
  objc_storeStrong((id *)&self->_cellularLac, 0);
  objc_storeStrong((id *)&self->_cellularIssa, 0);
  objc_storeStrong((id *)&self->_cellularIsoCountryCode, 0);
  objc_storeStrong((id *)&self->_cellularIndicatorOverride, 0);
  objc_storeStrong((id *)&self->_cellularIndicator, 0);
  objc_storeStrong((id *)&self->_cellularInHomeCountry, 0);
  objc_storeStrong((id *)&self->_cellularDataPossible, 0);
  objc_storeStrong((id *)&self->_cellularDataPlanSignalingReductionOverride, 0);
  objc_storeStrong((id *)&self->_cellularDataBearerTechnology, 0);
  objc_storeStrong((id *)&self->_cellularDataBearerSoMask, 0);
  objc_storeStrong((id *)&self->_cellularCellid, 0);
  objc_storeStrong((id *)&self->_cellularCarrierName, 0);
  objc_storeStrong((id *)&self->_cellularBandwidth, 0);
  objc_storeStrong((id *)&self->_cellularBandinfo, 0);
  objc_storeStrong((id *)&self->_cellularAttached, 0);
  objc_storeStrong((id *)&self->_cellularAggregatedULBW, 0);
  objc_storeStrong((id *)&self->_cellularAggregatedDLBW, 0);
  objc_storeStrong((id *)&self->_cellularActiveContexts, 0);
  objc_storeStrong((id *)&self->_callingClient, 0);
  objc_storeStrong((id *)&self->_btConnectedDevicesCount, 0);
  objc_storeStrong((id *)&self->_awdlSyncState, 0);
  objc_storeStrong((id *)&self->_awdlSyncChannelSequence, 0);
  objc_storeStrong((id *)&self->_awdlSecondaryMasterChannel, 0);
  objc_storeStrong((id *)&self->_awdlSchedule, 0);
  objc_storeStrong((id *)&self->_awdlOpMode, 0);
  objc_storeStrong((id *)&self->_awdlMasterChannel, 0);

  objc_storeStrong((id *)&self->_awdlElectionParameters, 0);
}

@end
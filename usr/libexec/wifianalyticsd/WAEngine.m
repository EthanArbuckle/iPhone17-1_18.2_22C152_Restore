@interface WAEngine
- (AnalyticsProcessor)analyticsProcessor;
- (BOOL)_isDPSQuickRecoveryEngineUsed;
- (BOOL)analyticsProcessorIsReady;
- (BOOL)canProcessWiFiAnalyticsMessageJSONFiles:(id)a3;
- (BOOL)didSymptomsConditionRecoverAfterDecision;
- (BOOL)dnsStudyInProgress;
- (BOOL)dpsCurrentlyGatheringConsecutiveSamples;
- (BOOL)dpsNotificationDuringDnsStudy;
- (BOOL)dpsStudyInProgress;
- (BOOL)everAssociated:(BOOL)a3 assocDoneSuccess:(BOOL)a4;
- (BOOL)fetchConfiguredDnsInfo;
- (BOOL)forceStudyErrorFromMsg;
- (BOOL)isAWDLActivitySuspected;
- (BOOL)isAXAssociatoin;
- (BOOL)isAssociated;
- (BOOL)isAssociatedSinceStudyStart;
- (BOOL)isAssociatedStateKnown;
- (BOOL)isCaptiveServerIPResolved;
- (BOOL)isCriticalAppInUse;
- (BOOL)isGatewayReachable;
- (BOOL)isIPv4Address:(id)a3;
- (BOOL)isInternalInstall;
- (BOOL)isInternalScenario;
- (BOOL)isMemoryPressureRequestDeferred;
- (BOOL)isNWActivityInProgress;
- (BOOL)isPingEnqueueFailing;
- (BOOL)isPoorSymptomsDnsConditions;
- (BOOL)isScoreBelowThreshold:(id)a3 type:(unint64_t)a4 instanceId:(unsigned int)a5;
- (BOOL)isUsingCustomDNSSettings;
- (BOOL)isWiFiAppInstalled;
- (BOOL)isWiFiAssociatedToNetwork;
- (BOOL)isWiFiInterfacePrimary;
- (BOOL)isWiFiNetworkCaptive;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (BOOL)persistFileExistedAtPIDLoad;
- (BOOL)populateApProfile:(id)a3;
- (BOOL)queryInfraInterfaceInstanceAndChip;
- (BOOL)readingPersistFile;
- (BOOL)slowWiFiNotificationDuringDnsStudy;
- (BOOL)slowWiFiStudyInProgress;
- (BOOL)submitterMapCheck:(id)a3 group:(int64_t)a4;
- (BOOL)tmpFilesHaveAttemptedProcessingInDataStreamPath;
- (BOOL)workReportTimerRunning;
- (BOOL)writingPersistFile;
- (CADataTransformEngine)transformEngine;
- (DPSQuickRecoveryRecommendationEngine)dpsQuickRecoveryEngine;
- (DatapathMetricStream)datapathMetricStream;
- (ManagedConfiguration)managedConfiguration;
- (NSDate)lastDateDetermineChannelsPerIORPopulatableQueried;
- (NSDate)lastDateWiFiAppInstalledQueried;
- (NSDate)pidLaunchDate;
- (NSDate)profileMegaDisabledDate;
- (NSDate)profileMegaEnabledDate;
- (NSDictionary)nowCacheUsageForTelemetry;
- (NSDictionary)oldCacheUsageForTelemetry;
- (NSMutableArray)accessPointInfoToAppend;
- (NSMutableArray)assocDiffToAppend;
- (NSMutableArray)dpsapToAppend;
- (NSMutableArray)dpscsToAppend;
- (NSMutableArray)dpsnToAppend;
- (NSMutableArray)pendingUntokenedConnections;
- (NSMutableArray)swfnToAppend;
- (NSMutableArray)usbEventNotificationToAppend;
- (NSMutableDictionary)cachedModelObjectsKeyToMessageMap;
- (NSMutableDictionary)cachedUsage;
- (NSMutableDictionary)interfaceNameToApple80211InstanceMap;
- (NSMutableDictionary)probeContextBE;
- (NSMutableDictionary)probeContextBK;
- (NSMutableDictionary)probeContextVI;
- (NSMutableDictionary)probeContextVO;
- (NSMutableDictionary)processTokenToGroupTypeMap;
- (NSMutableDictionary)processTokenToXPCConnectionMap;
- (NSMutableDictionary)studyTimeStamps;
- (NSMutableDictionary)submitterMap;
- (NSString)appleCaptiveServerIP;
- (NSString)infraInterfaceName;
- (NSString)wifiChipSet;
- (NSURL)wifianalyticsTmpDir;
- (NSXPCListener)listener;
- (OS_dispatch_queue)dnsStudyQueue;
- (OS_dispatch_queue)dpsReadWriteSerialQueue;
- (OS_dispatch_queue)engineQ;
- (OS_dispatch_queue)fileHandlingQ;
- (OS_dispatch_queue)manageConfigQueue;
- (OS_dispatch_queue)mutexQueue;
- (OS_dispatch_queue)peerDiagnosticsStudyQueue;
- (OS_dispatch_queue)studyQueue;
- (OS_dispatch_source)jsonFilerReaderTimer;
- (OS_dispatch_source)workReportTimer;
- (OS_os_transaction)dnsStudyTransaction;
- (OS_os_transaction)dpsStudyTransaction;
- (OS_os_transaction)slowwifiStudyTransaction;
- (RecommendationEngine)recommendationEngine;
- (RecommendationPreferences)preferences;
- (WACoreCapture)coreCaptureControl;
- (WAEngine)init;
- (WAIOReporterMessagePopulator)iorMessagePopulator;
- (WAMessageAWDStore)messageStore;
- (double)analyticsAgeOutTimeIntervalSecs;
- (double)analyticsProcessingTimeIntervalSecs;
- (id)DatapathMetricGetter;
- (id)IPv4SubnetMasks;
- (id)IPv6PrefixLengths;
- (id)_DPSQuickRecoveryEngineObj;
- (id)__IPv4StateConfig;
- (id)__IPv6StateConfig;
- (id)__dnsSetupConfig;
- (id)__dnsStateConfig;
- (id)__ipv4SetupConfig;
- (id)_cachedModelObjectsMessageForGroupType:(int64_t)a3 key:(id)a4;
- (id)_createNextWorkReportSnapshot;
- (id)_createWorkReportDictionaryForTelemetryAndRollBucket;
- (id)_getBasePersistenceKeychainQuery;
- (id)_getDataFromKeychain:(id)a3;
- (id)_getDeviceAnalyticsConfiguration;
- (id)_getMessageByUUID:(id)a3 forProcessToken:(id)a4 error:(id *)a5;
- (id)_getMessagesModelForProcessToken:(id)a3 groupType:(int64_t)a4 andError:(id *)a5;
- (id)_getObscureKey;
- (id)_ingestMessage:(id)a3 forProcessToken:(id)a4;
- (id)_rotateObscureKey;
- (id)_setDeviceAnalyticsConfiguration:(id)a3;
- (id)_submitMessage:(id)a3 groupType:(int64_t)a4 forProcessToken:(id)a5;
- (id)_submitWiFiAnalyticsMessageAdvanced:(id)a3;
- (id)_summarizeDeviceAnalyticsForNetwork:(id)a3 maxAgeInDays:(unint64_t)a4;
- (id)getNewMessageForKey:(id)a3 groupType:(int64_t)a4 forProcessWithToken:(id)a5;
- (id)getNewMessageForKey:(id)a3 groupType:(int64_t)a4 withCopy:(BOOL)a5 forProcessWithToken:(id)a6;
- (id)getValueForKeyFromUserDefaults:(id)a3;
- (id)getW5Client;
- (id)getXPCConnectionForProcessToken:(id)a3;
- (int)dpsAction;
- (int)keybagToken;
- (int)pid;
- (int64_t)dnsServerConfigType;
- (int64_t)driverType;
- (unint64_t)_getTimeInProfileState:(unsigned __int8)a3;
- (unint64_t)abstime_to_ns:(unint64_t)a3;
- (unint64_t)cumulativeAverageCcaSinceStudyStart;
- (unint64_t)dpsNotificationCCA;
- (unint64_t)dpsNotificationTimeInSeconds;
- (unint64_t)impactedServersAtStudyEnd;
- (unint64_t)impactedServersAtStudyStart;
- (unint64_t)netscoreAtStudyEnd;
- (unint64_t)netscoreAtStudyStart;
- (unint64_t)numDataStallScoreBelowThresholdAfterTrap;
- (unint64_t)numDataStallScoreBelowThresholdBeforeTrap;
- (unint64_t)numIPv4DnsServers;
- (unint64_t)numIPv6DnsServers;
- (unint64_t)numLocalDnsServers;
- (unint64_t)numNetScoreBelowThresholdAfterTrap;
- (unint64_t)numNetScoreBelowThresholdBeforeTrap;
- (unint64_t)numRemoteDnsServers;
- (unint64_t)profileMegaDisabledSeconds;
- (unint64_t)profileMegaEnabledSeconds;
- (unint64_t)stallscoreAtStudyEnd;
- (unint64_t)stallscoreAtStudyStart;
- (unint64_t)totalDnsServers;
- (unint64_t)totalLANPingSuccessAfterTrap;
- (unint64_t)totalLANPingSuccessBeforeTrap;
- (unint64_t)totalLANPingsAfterTrap;
- (unint64_t)totalLANPingsBeforeTrap;
- (unint64_t)totalWANPingSuccessAfterTrap;
- (unint64_t)totalWANPingSuccessBeforeTrap;
- (unint64_t)totalWANPingsAfterTrap;
- (unint64_t)totalWANPingsBeforeTrap;
- (unint64_t)workReportSelectingSingleWithinFirstDay;
- (unint64_t)workReportSelectingSingleWithinFirstWeek;
- (unsigned)getIPv4InterfaceNetwork:(unsigned int)a3;
- (unsigned)getIPv4InterfaceSubnet;
- (unsigned)getIPv6InterfacePrefix;
- (unsigned)isMegaEnabled;
- (void)_calculateEstimatedUptime;
- (void)_calculateProcessUsage;
- (void)_calculateProfileUptime;
- (void)_cancelWorkReportRecurringTimer;
- (void)_clearMessageStoreAndReply:(id)a3;
- (void)_convertWiFiStatsIntoPercentile:(id)a3 analysisGroup:(int64_t)a4 groupTarget:(id)a5 forProcessToken:(id)a6 andReply:(id)a7;
- (void)_enableWorkReportRecurringTimer;
- (void)_examinePeerMessageForIntegrity:(id)a3;
- (void)_getNewMessageForKey:(id)a3 groupType:(int64_t)a4 forProcessToken:(id)a5 shouldCheckForPrePopulation:(BOOL)a6 andReply:(id)a7;
- (void)_getNewMessageForKey:(id)a3 groupType:(int64_t)a4 withCopy:(BOOL)a5 forProcessToken:(id)a6 shouldCheckForPrePopulation:(BOOL)a7 andReply:(id)a8;
- (void)_getNewMessageForKeyWithinPopulatorBlock:(id)a3 groupType:(int64_t)a4 forProcessToken:(id)a5 shouldCheckForPrePopulation:(BOOL)a6 andReply:(id)a7;
- (void)_handleUnpersistForUsageData;
- (void)_initSubmitterAndQueryableRegistrationForProcessToken:(id)a3 andGroupType:(int64_t)a4;
- (void)_issueIOReportManagementCommand:(unint64_t)a3 forProcessToken:(id)a4 andReply:(id)a5;
- (void)_killDaemonAndReply:(id)a3;
- (void)_logWorkReport:(id)a3 indent:(int)a4 prefix:(id)a5;
- (void)_lqmCrashTracerNotifyForInterfaceWithName:(id)a3 andReply:(id)a4;
- (void)_lqmCrashTracerReceiveBlock:(id)a3 forInterfaceWithName:(id)a4 andReply:(id)a5;
- (void)_persist;
- (void)_prepareToTerminate;
- (void)_prepareToTerminateViaEagerExit;
- (void)_processWAMessageForLogging:(id)a3;
- (void)_processWAMessageForNewIORPossibility:(id)a3;
- (void)_purgeGroupTypeIfNecessary:(int64_t)a3;
- (void)_removePersistenceFile;
- (void)_reportWorkReportInterval;
- (void)_saveKeyIVData:(id)a3 andTagData:(id)a4;
- (void)_sendMemoryPressureRequestAndReply:(id)a3;
- (void)_trapCrashMiniTracerDumpReadyForInterfaceWithName:(id)a3 andReply:(id)a4;
- (void)_trapFWWithReason:(id)a3 andReply:(id)a4;
- (void)_triggerDPSStudy:(int64_t)a3 forProcessToken:(id)a4 waMessage:(id)a5 andReply:(id)a6;
- (void)_triggerDatapathDiagnosticsAndCollectUpdates:(int64_t)a3 forProcessToken:(id)a4 waMessage:(id)a5 andReply:(id)a6;
- (void)_triggerDeviceAnalyticsStoreMigrationAndReply:(id)a3;
- (void)_triggerQueryForNWActivity:(int64_t)a3 forProcessToken:(id)a4 andReply:(id)a5;
- (void)_triggerSlowWiFiStudy:(int64_t)a3 forProcessToken:(id)a4 waMessage:(id)a5 andReply:(id)a6;
- (void)_unpersist;
- (void)_updateProfileStateDate:(unsigned __int8)a3;
- (void)_writeWiFiAnalyticsMessageToJSONFile:(id)a3 metricInfo:(id)a4;
- (void)clearDnsStudyVariables;
- (void)computeAverageCcaSinceStudyStart:(id)a3;
- (void)convertToIPv6Network:(unsigned int *)a3 prefixLength:(unsigned int)a4;
- (void)createAndStartJsonReaderTimer;
- (void)dealloc;
- (void)fetchSymptomsScores:(unsigned int)a3;
- (void)gatherConsecutiveDatapathReadings:(int64_t)a3 forProcessToken:(id)a4 andReply:(id)a5;
- (void)gatherConsecutiveLinkQualitySamples:(int64_t)a3 forProcessToken:(id)a4 andReply:(id)a5;
- (void)gatherDiscoveredPeerInfo:(id)a3;
- (void)getIPv6InterfaceNetwork:(unsigned int *)a3 prefixLength:(unsigned int)a4;
- (void)handleMemoryWarning:(BOOL)a3;
- (void)initDatapathMetricGetterAndFetcher;
- (void)initializeProbeCxt;
- (void)keyBagLockStateChangeNotification;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)persist;
- (void)populateChannelInfo:(id)a3;
- (void)prepareToTerminateAnyReply:(id)a3;
- (void)prepareToTerminateViaEagerExit;
- (void)processMetricDictOffEngine:(id)a3 data:(id)a4;
- (void)processMetricDictOnEngine:(id)a3 data:(id)a4;
- (void)processWiFiAnalyticsManagedFault:(id)a3;
- (void)processWiFiAnalyticsMessageJSONFilesInTmpDir:(BOOL)a3;
- (void)processWiFiAnalyticsMessageWAMFile:(id)a3 file:(id)a4;
- (void)resolveAppleCaptiveServer;
- (void)run;
- (void)sendWakeUpNotificationForProcessWithName:(id)a3;
- (void)setAccessPointInfoToAppend:(id)a3;
- (void)setAnalyticsAgeOutTimeIntervalSecs:(double)a3;
- (void)setAnalyticsProcessingTimeIntervalSecs:(double)a3;
- (void)setAnalyticsProcessor:(id)a3;
- (void)setAnalyticsProcessorIsReady:(BOOL)a3;
- (void)setAppleCaptiveServerIP:(id)a3;
- (void)setAssocDiffToAppend:(id)a3;
- (void)setCachedModelObjectsKeyToMessageMap:(id)a3;
- (void)setCachedUsage:(id)a3;
- (void)setCoreCaptureControl:(id)a3;
- (void)setCumulativeAverageCcaSinceStudyStart:(unint64_t)a3;
- (void)setDatapathMetricGetter:(id)a3;
- (void)setDatapathMetricStream:(id)a3;
- (void)setDidSymptomsConditionRecoverAfterDecision:(BOOL)a3;
- (void)setDnsServerConfigType:(int64_t)a3;
- (void)setDnsStudyInProgress:(BOOL)a3;
- (void)setDnsStudyQueue:(id)a3;
- (void)setDnsStudyTransaction:(id)a3;
- (void)setDpsAction:(int)a3;
- (void)setDpsCurrentlyGatheringConsecutiveSamples:(BOOL)a3;
- (void)setDpsNotificationCCA:(unint64_t)a3;
- (void)setDpsNotificationDuringDnsStudy:(BOOL)a3;
- (void)setDpsNotificationTimeInSeconds:(unint64_t)a3;
- (void)setDpsQuickRecoveryEngine:(id)a3;
- (void)setDpsReadWriteSerialQueue:(id)a3;
- (void)setDpsStudyInProgress:(BOOL)a3;
- (void)setDpsStudyTransaction:(id)a3;
- (void)setDpsapToAppend:(id)a3;
- (void)setDpscsToAppend:(id)a3;
- (void)setDpsnToAppend:(id)a3;
- (void)setDriverType:(int64_t)a3;
- (void)setEngineQ:(id)a3;
- (void)setFileHandlingQ:(id)a3;
- (void)setForceStudyErrorFromMsg:(BOOL)a3;
- (void)setImpactedServersAtStudyEnd:(unint64_t)a3;
- (void)setImpactedServersAtStudyStart:(unint64_t)a3;
- (void)setInfraInterfaceName:(id)a3;
- (void)setInterfaceNameToApple80211InstanceMap:(id)a3;
- (void)setIorMessagePopulator:(id)a3;
- (void)setIsAWDLActivitySuspected:(BOOL)a3;
- (void)setIsAssociated:(BOOL)a3;
- (void)setIsAssociatedSinceStudyStart:(BOOL)a3;
- (void)setIsAssociatedStateKnown:(BOOL)a3;
- (void)setIsCaptiveServerIPResolved:(BOOL)a3;
- (void)setIsCriticalAppInUse:(BOOL)a3;
- (void)setIsGatewayReachable:(BOOL)a3;
- (void)setIsInternalInstall:(BOOL)a3;
- (void)setIsMegaEnabled:(unsigned __int8)a3;
- (void)setIsMemoryPressureRequestDeferred:(BOOL)a3;
- (void)setIsNWActivityInProgress:(BOOL)a3;
- (void)setIsPingEnqueueFailing:(BOOL)a3;
- (void)setIsPoorSymptomsDnsConditions:(BOOL)a3;
- (void)setIsWiFiAppInstalled:(BOOL)a3;
- (void)setJsonFilerReaderTimer:(id)a3;
- (void)setKeybagToken:(int)a3;
- (void)setLastDateDetermineChannelsPerIORPopulatableQueried:(id)a3;
- (void)setLastDateWiFiAppInstalledQueried:(id)a3;
- (void)setListener:(id)a3;
- (void)setManageConfigQueue:(id)a3;
- (void)setManagedConfiguration:(id)a3;
- (void)setMessageStore:(id)a3;
- (void)setMutexQueue:(id)a3;
- (void)setNetscoreAtStudyEnd:(unint64_t)a3;
- (void)setNetscoreAtStudyStart:(unint64_t)a3;
- (void)setNowCacheUsageForTelemetry:(id)a3;
- (void)setNumDataStallScoreBelowThresholdAfterTrap:(unint64_t)a3;
- (void)setNumDataStallScoreBelowThresholdBeforeTrap:(unint64_t)a3;
- (void)setNumIPv4DnsServers:(unint64_t)a3;
- (void)setNumIPv6DnsServers:(unint64_t)a3;
- (void)setNumLocalDnsServers:(unint64_t)a3;
- (void)setNumNetScoreBelowThresholdAfterTrap:(unint64_t)a3;
- (void)setNumNetScoreBelowThresholdBeforeTrap:(unint64_t)a3;
- (void)setNumRemoteDnsServers:(unint64_t)a3;
- (void)setOldCacheUsageForTelemetry:(id)a3;
- (void)setPeerDiagnosticsStudyQueue:(id)a3;
- (void)setPendingUntokenedConnections:(id)a3;
- (void)setPersistFileExistedAtPIDLoad:(BOOL)a3;
- (void)setPid:(int)a3;
- (void)setPidLaunchDate:(id)a3;
- (void)setPreferences:(id)a3;
- (void)setProbeContextBE:(id)a3;
- (void)setProbeContextBK:(id)a3;
- (void)setProbeContextVI:(id)a3;
- (void)setProbeContextVO:(id)a3;
- (void)setProcessTokenToGroupTypeMap:(id)a3;
- (void)setProcessTokenToXPCConnectionMap:(id)a3;
- (void)setProfileMegaDisabledDate:(id)a3;
- (void)setProfileMegaDisabledSeconds:(unint64_t)a3;
- (void)setProfileMegaEnabledDate:(id)a3;
- (void)setProfileMegaEnabledSeconds:(unint64_t)a3;
- (void)setReadingPersistFile:(BOOL)a3;
- (void)setRecommendationEngine:(id)a3;
- (void)setSlowWiFiNotificationDuringDnsStudy:(BOOL)a3;
- (void)setSlowWiFiStudyInProgress:(BOOL)a3;
- (void)setSlowwifiStudyTransaction:(id)a3;
- (void)setStallscoreAtStudyEnd:(unint64_t)a3;
- (void)setStallscoreAtStudyStart:(unint64_t)a3;
- (void)setStudyQueue:(id)a3;
- (void)setStudyTimeStamps:(id)a3;
- (void)setSubmitterMap:(id)a3;
- (void)setSwfnToAppend:(id)a3;
- (void)setTmpFilesHaveAttemptedProcessingInDataStreamPath:(BOOL)a3;
- (void)setTotalDnsServers:(unint64_t)a3;
- (void)setTotalLANPingSuccessAfterTrap:(unint64_t)a3;
- (void)setTotalLANPingSuccessBeforeTrap:(unint64_t)a3;
- (void)setTotalLANPingsAfterTrap:(unint64_t)a3;
- (void)setTotalLANPingsBeforeTrap:(unint64_t)a3;
- (void)setTotalWANPingSuccessAfterTrap:(unint64_t)a3;
- (void)setTotalWANPingSuccessBeforeTrap:(unint64_t)a3;
- (void)setTotalWANPingsAfterTrap:(unint64_t)a3;
- (void)setTotalWANPingsBeforeTrap:(unint64_t)a3;
- (void)setTransformEngine:(id)a3;
- (void)setUsbEventNotificationToAppend:(id)a3;
- (void)setValueForKeyToUserDefaults:(id)a3 forKey:(id)a4;
- (void)setWifiChipSet:(id)a3;
- (void)setWifianalyticsTmpDir:(id)a3;
- (void)setWorkReportSelectingSingleWithinFirstDay:(unint64_t)a3;
- (void)setWorkReportSelectingSingleWithinFirstWeek:(unint64_t)a3;
- (void)setWorkReportTimer:(id)a3;
- (void)setWorkReportTimerRunning:(BOOL)a3;
- (void)setWritingPersistFile:(BOOL)a3;
- (void)setupAnalyticsProcessorWithCompletionBlock:(id)a3;
- (void)storeWAMessageToDB:(id)a3;
- (void)triggerDeviceAnalyticsStoreMigrationAndReply:(id)a3;
- (void)triggerDiagnosticPingWithrequestId:(unsigned int)a3;
- (void)triggerPeerDiagnosticsStudy:(unint64_t)a3 symptomsDnsStats:(id)a4;
- (void)triggerPeerDiscovery;
- (void)xpcConnection:(id)a3 clearMessageStoreAndReply:(id)a4;
- (void)xpcConnection:(id)a3 convertWiFiStatsIntoPercentile:(id)a4 analysisGroup:(int64_t)a5 groupTarget:(id)a6 andReply:(id)a7;
- (void)xpcConnection:(id)a3 establishConnectionWithToken:(id)a4 andReply:(id)a5;
- (void)xpcConnection:(id)a3 getDeviceAnalyticsConfigurationAndReply:(id)a4;
- (void)xpcConnection:(id)a3 getDpsStatsandReply:(id)a4;
- (void)xpcConnection:(id)a3 getMessagesModelForGroupType:(int64_t)a4 andReply:(id)a5;
- (void)xpcConnection:(id)a3 getNewMessageForKey:(id)a4 groupType:(int64_t)a5 withCopy:(id)a6 andReply:(id)a7;
- (void)xpcConnection:(id)a3 getUsageStatsandReply:(id)a4;
- (void)xpcConnection:(id)a3 issueIOReportManagementCommand:(unint64_t)a4 andReply:(id)a5;
- (void)xpcConnection:(id)a3 killDaemonAndReply:(id)a4;
- (void)xpcConnection:(id)a3 lqmCrashTracerNotifyForInterfaceWithName:(id)a4 andReply:(id)a5;
- (void)xpcConnection:(id)a3 lqmCrashTracerReceiveBlock:(id)a4 forInterfaceWithName:(id)a5 andReply:(id)a6;
- (void)xpcConnection:(id)a3 registerMessageGroup:(int64_t)a4 andReply:(id)a5;
- (void)xpcConnection:(id)a3 sendMemoryPressureRequestAndReply:(id)a4;
- (void)xpcConnection:(id)a3 setDeviceAnalyticsConfiguration:(id)a4 andReply:(id)a5;
- (void)xpcConnection:(id)a3 submitMessage:(id)a4 groupType:(int64_t)a5 andReply:(id)a6;
- (void)xpcConnection:(id)a3 submitWiFiAnalyticsMessageAdvanced:(id)a4 andReply:(id)a5;
- (void)xpcConnection:(id)a3 summarizeDeviceAnalyticsForNetwork:(id)a4 maxAgeInDays:(unint64_t)a5 andReply:(id)a6;
- (void)xpcConnection:(id)a3 trapCrashMiniTracerDumpReadyForInterfaceWithName:(id)a4 andReply:(id)a5;
- (void)xpcConnection:(id)a3 triggerDatapathDiagnosticsAndCollectUpdates:(int64_t)a4 waMessage:(id)a5 andReply:(id)a6;
- (void)xpcConnection:(id)a3 triggerDeviceAnalyticsStoreMigrationAndReply:(id)a4;
- (void)xpcConnection:(id)a3 triggerQueryForNWActivity:(int64_t)a4 andReply:(id)a5;
@end

@implementation WAEngine

- (WAEngine)init
{
  v108.receiver = self;
  v108.super_class = (Class)WAEngine;
  v2 = [(WAEngine *)&v108 init];
  if (!v2) {
    goto LABEL_37;
  }
  id v3 = objc_alloc_init((Class)NSMutableDictionary);
  v4 = (void *)*((void *)v2 + 9);
  *((void *)v2 + 9) = v3;

  v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v6 = dispatch_queue_create("com.apple.wifi.analytics.engineQ", v5);
  v7 = (void *)*((void *)v2 + 11);
  *((void *)v2 + 11) = v6;

  v8 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v9 = dispatch_queue_create(0, v8);
  v10 = (void *)*((void *)v2 + 74);
  *((void *)v2 + 74) = v9;

  id v11 = objc_alloc_init((Class)NSMutableDictionary);
  v12 = (void *)*((void *)v2 + 15);
  *((void *)v2 + 15) = v11;

  id v13 = objc_alloc_init((Class)NSMutableDictionary);
  v14 = (void *)*((void *)v2 + 17);
  *((void *)v2 + 17) = v13;

  id v15 = [objc_alloc((Class)NSXPCListener) initWithMachServiceName:@"com.apple.wifianalyticsd"];
  v16 = (void *)*((void *)v2 + 14);
  *((void *)v2 + 14) = v15;

  v17 = (void *)*((void *)v2 + 14);
  if (!v17) {
    goto LABEL_37;
  }
  [v17 setDelegate:v2];
  v2[53] = 0;
  uint64_t v18 = +[WAUtil wifianalyticsTmpDirectory];
  v19 = (void *)*((void *)v2 + 73);
  *((void *)v2 + 73) = v18;

  if (!*((void *)v2 + 73)) {
    goto LABEL_37;
  }
  v2[32] = 0;
  v2[42] = 0;
  v2[35] = 0;
  v20 = objc_alloc_init(CADataTransformEngine);
  v21 = (void *)*((void *)v2 + 20);
  *((void *)v2 + 20) = v20;

  if (!*((void *)v2 + 20))
  {
    v92 = WALogCategoryDefaultHandle();
    if (!os_log_type_enabled(v92, OS_LOG_TYPE_ERROR)) {
      goto LABEL_36;
    }
    *(_DWORD *)buf = 136446466;
    v110 = "-[WAEngine init]";
    __int16 v111 = 1024;
    int v112 = 419;
    v102 = "%{public}s::%d:Error creating _transformEngine";
LABEL_35:
    _os_log_impl((void *)&_mh_execute_header, v92, OS_LOG_TYPE_ERROR, v102, buf, 0x12u);
    goto LABEL_36;
  }
  v22 = objc_alloc_init(RecommendationEngine);
  v23 = (void *)*((void *)v2 + 22);
  *((void *)v2 + 22) = v22;

  if (!*((void *)v2 + 22))
  {
    v92 = WALogCategoryDefaultHandle();
    if (!os_log_type_enabled(v92, OS_LOG_TYPE_ERROR)) {
      goto LABEL_36;
    }
    *(_DWORD *)buf = 136446466;
    v110 = "-[WAEngine init]";
    __int16 v111 = 1024;
    int v112 = 422;
    v102 = "%{public}s::%d:Error creating _recommendationEngine";
    goto LABEL_35;
  }
  v24 = objc_alloc_init(WACoreCapture);
  v25 = (void *)*((void *)v2 + 63);
  *((void *)v2 + 63) = v24;

  if (!*((void *)v2 + 63))
  {
    v92 = WALogCategoryDefaultHandle();
    if (!os_log_type_enabled(v92, OS_LOG_TYPE_ERROR)) {
      goto LABEL_36;
    }
    *(_DWORD *)buf = 136446466;
    v110 = "-[WAEngine init]";
    __int16 v111 = 1024;
    int v112 = 425;
    v102 = "%{public}s::%d:Error creating _coreCaptureControl";
    goto LABEL_35;
  }
  v26 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v27 = dispatch_queue_create("com.apple.wifi.analytics.dpsQ", v26);
  v28 = (void *)*((void *)v2 + 64);
  *((void *)v2 + 64) = v27;

  v29 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v30 = dispatch_queue_create("com.apple.wifi.analytics.dpsReadWriteQ", v29);
  v31 = (void *)*((void *)v2 + 65);
  *((void *)v2 + 65) = v30;

  v32 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v33 = dispatch_queue_create("com.apple.wifi.analytics.peerDiagnosticsQ", v32);
  v34 = (void *)*((void *)v2 + 66);
  *((void *)v2 + 66) = v33;

  v35 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v36 = dispatch_queue_create("com.apple.wifi.analytics.dnsQ", v35);
  v37 = (void *)*((void *)v2 + 61);
  *((void *)v2 + 61) = v36;

  id v38 = objc_alloc_init((Class)NSMutableArray);
  v39 = (void *)*((void *)v2 + 67);
  *((void *)v2 + 67) = v38;

  id v40 = objc_alloc_init((Class)NSMutableArray);
  v41 = (void *)*((void *)v2 + 68);
  *((void *)v2 + 68) = v40;

  id v42 = objc_alloc_init((Class)NSMutableArray);
  v43 = (void *)*((void *)v2 + 69);
  *((void *)v2 + 69) = v42;

  id v44 = objc_alloc_init((Class)NSMutableArray);
  v45 = (void *)*((void *)v2 + 70);
  *((void *)v2 + 70) = v44;

  id v46 = objc_alloc_init((Class)NSMutableArray);
  v47 = (void *)*((void *)v2 + 60);
  *((void *)v2 + 60) = v46;

  id v48 = objc_alloc_init((Class)NSMutableArray);
  v49 = (void *)*((void *)v2 + 62);
  *((void *)v2 + 62) = v48;

  id v50 = objc_alloc_init((Class)NSMutableDictionary);
  v51 = (void *)*((void *)v2 + 21);
  *((void *)v2 + 21) = v50;

  *((_DWORD *)v2 + 15) = 0;
  id v52 = objc_alloc_init((Class)NSMutableArray);
  v53 = (void *)*((void *)v2 + 71);
  *((void *)v2 + 71) = v52;

  id v54 = [objc_alloc((Class)CWFInterface) initWithServiceType:1];
  v55 = (void *)*((void *)v2 + 1);
  *((void *)v2 + 1) = v54;

  v56 = (void *)*((void *)v2 + 1);
  if (!v56)
  {
    v92 = WALogCategoryDefaultHandle();
    if (!os_log_type_enabled(v92, OS_LOG_TYPE_ERROR)) {
      goto LABEL_36;
    }
    *(_DWORD *)buf = 136446466;
    v110 = "-[WAEngine init]";
    __int16 v111 = 1024;
    int v112 = 444;
    v102 = "%{public}s::%d:Error creating _corewifi";
    goto LABEL_35;
  }
  [v56 resume];
  SCDynamicStoreRef v57 = SCDynamicStoreCreate(kCFAllocatorDefault, @"com.apple.wifianalyticsd.wifi.intf", 0, 0);
  *((void *)v2 + 2) = v57;
  if (!v57)
  {
    v92 = WALogCategoryDefaultHandle();
    if (!os_log_type_enabled(v92, OS_LOG_TYPE_ERROR)) {
      goto LABEL_36;
    }
    *(_DWORD *)buf = 136446466;
    v110 = "-[WAEngine init]";
    __int16 v111 = 1024;
    int v112 = 451;
    v102 = "%{public}s::%d:Error creating _storeRef";
    goto LABEL_35;
  }
  v58 = (void *)*((void *)v2 + 59);
  *((void *)v2 + 59) = 0;

  v2[36] = MGGetBoolAnswer();
  v59 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v60 = dispatch_queue_create("com.apple.wifi.analytics.fileHandlingQ", v59);
  v61 = (void *)*((void *)v2 + 72);
  *((void *)v2 + 72) = v60;

  *((_OWORD *)v2 + 38) = xmmword_100096A30;
  if (+[WAUtil isKeyBagUnlocked])
  {
    v62 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446466;
      v110 = "-[WAEngine init]";
      __int16 v111 = 1024;
      int v112 = 467;
      _os_log_impl((void *)&_mh_execute_header, v62, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:isKeyBagUnlocked is true, attempting setup setupAnalyticsProcessorWithCompletionBlock", buf, 0x12u);
    }

    [v2 setupAnalyticsProcessorWithCompletionBlock:0];
  }
  [v2 createAndStartJsonReaderTimer];
  v2[52] = 0;
  uint64_t v63 = +[NSMutableDictionary dictionary];
  v64 = (void *)*((void *)v2 + 18);
  *((void *)v2 + 18) = v63;

  if (*((void *)v2 + 18))
  {
    uint64_t v65 = +[NSString stringWithFormat:@"dunno"];
    v66 = (void *)*((void *)v2 + 19);
    *((void *)v2 + 19) = v65;

    uint64_t v67 = +[NSString stringWithFormat:&stru_1000D3628];
    v68 = (void *)*((void *)v2 + 24);
    *((void *)v2 + 24) = v67;

    *((void *)v2 + 97) = 0;
    uint64_t v69 = +[ManagedConfiguration sharedInstance];
    v70 = (void *)*((void *)v2 + 80);
    *((void *)v2 + 80) = v69;

    v71 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v72 = dispatch_queue_create("com.apple.wifi.analytics.config", v71);
    v73 = (void *)*((void *)v2 + 79);
    *((void *)v2 + 79) = v72;

    [*((id *)v2 + 80) scheduleWithQueue:*((void *)v2 + 79)];
    [*((id *)v2 + 80) setDbDelegate:v2];
    uint64_t v74 = +[DatapathMetricStream sharedInstance];
    v75 = (void *)*((void *)v2 + 81);
    *((void *)v2 + 81) = v74;

    [v2 initDatapathMetricGetterAndFetcher];
    v76 = (void *)*((void *)v2 + 81);
    uint64_t v77 = *((void *)v2 + 79);
    v78 = [v2 DatapathMetricGetter];
    [v76 setDispatchQueueAndAddObservers:v77 withGetter:v78];

    [*((id *)v2 + 81) setDbDelegate:v2];
    uint64_t v79 = +[NSDate distantPast];
    v80 = (void *)*((void *)v2 + 83);
    *((void *)v2 + 83) = v79;

    uint64_t v81 = +[NSDate distantPast];
    v82 = (void *)*((void *)v2 + 84);
    *((void *)v2 + 84) = v81;

    v2[54] = 0;
    *(_WORD *)(v2 + 49) = 0;
    v2[51] = 0;
    v83 = *((void *)v2 + 72);
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_10004519C;
    handler[3] = &unk_1000D0FA8;
    v84 = v2;
    v107 = v84;
    notify_register_dispatch("com.apple.mobile.keybagd.lock_status", (int *)v2 + 16, v83, handler);
    [v84 keyBagLockStateChangeNotification];

    v84[37] = 0;
    v85 = +[NSProcessInfo processInfo];
    *((_DWORD *)v84 + 17) = [v85 processIdentifier];

    uint64_t v86 = +[NSDate now];
    v87 = (void *)*((void *)v84 + 87);
    *((void *)v84 + 87) = v86;

    uint64_t v88 = +[RecommendationPreferences sharedObject];
    v89 = (void *)*((void *)v84 + 85);
    *((void *)v84 + 85) = v88;

    uint64_t v90 = *((void *)v84 + 85);
    v91 = WALogCategoryDefaultHandle();
    v92 = v91;
    if (v90)
    {
      if (os_log_type_enabled(v91, OS_LOG_TYPE_DEBUG))
      {
        int v93 = *((_DWORD *)v84 + 17);
        v94 = +[NSProcessInfo processInfo];
        v95 = [v94 globallyUniqueString];
        *(_DWORD *)buf = 136446978;
        v110 = "-[WAEngine init]";
        __int16 v111 = 1024;
        int v112 = 520;
        __int16 v113 = 1024;
        int v114 = v93;
        __int16 v115 = 2112;
        v116 = v95;
        _os_log_impl((void *)&_mh_execute_header, v92, OS_LOG_TYPE_DEBUG, "%{public}s::%d:WAEngine init with pid %d uniqueString %@", buf, 0x22u);
      }
      v96 = [v84 managedConfiguration];
      [v96 addObserver:v84 forKeyPath:@"megawifiprofile_diagnostic_metrics_enabled" options:5 context:0];

      *((void *)v84 + 91) = arc4random_uniform(0x18u);
      *((void *)v84 + 92) = arc4random_uniform(0x90u) + 24;
      [v84 _enableWorkReportRecurringTimer];
      v97 = +[WAApple80211Manager sharedObject];
      v98 = [v97 getInfraApple80211];

      if (v98) {
        [v98 setDbDelegate:v84];
      }

      v99 = v84;
      v105 = v99;
      v100 = +[WAActivityManager sharedActivityManager];
      [v100 setExecuteBeforePossibleEagerExit:&v104];

      v2 = (char *)v105;
      goto LABEL_20;
    }
    if (!os_log_type_enabled(v91, OS_LOG_TYPE_ERROR)) {
      goto LABEL_36;
    }
    *(_DWORD *)buf = 136446466;
    v110 = "-[WAEngine init]";
    __int16 v111 = 1024;
    int v112 = 518;
    v102 = "%{public}s::%d:Error RecommendationPreferences init";
    goto LABEL_35;
  }
  v92 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v92, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136446466;
    v110 = "-[WAEngine init]";
    __int16 v111 = 1024;
    int v112 = 477;
    v102 = "%{public}s::%d:Error creating _interfaceNameToApple80211InstanceMap";
    goto LABEL_35;
  }
LABEL_36:

LABEL_37:
  v103 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v103, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136446466;
    v110 = "-[WAEngine init]";
    __int16 v111 = 1024;
    int v112 = 551;
    _os_log_impl((void *)&_mh_execute_header, v103, OS_LOG_TYPE_ERROR, "%{public}s::%d:FAILED to initialize!", buf, 0x12u);
  }

  v99 = 0;
LABEL_20:

  return v99;
}

- (void)dealloc
{
  id v3 = +[NSUserDefaults standardUserDefaults];
  [v3 removeObserver:self forKeyPath:@"megawifiprofile_diagnostic_metrics_enabled"];

  v4.receiver = self;
  v4.super_class = (Class)WAEngine;
  [(WAEngine *)&v4 dealloc];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v8 = a3;
  dispatch_queue_t v9 = [a5 objectForKeyedSubscript:NSKeyValueChangeNewKey];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v10 = v9;
  }
  else {
    v10 = 0;
  }
  id v11 = v10;
  if ([v8 isEqualToString:@"megawifiprofile_diagnostic_metrics_enabled"] && v11)
  {
    engineQ = self->_engineQ;
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_1000453D4;
    v15[3] = &unk_1000D1188;
    id v13 = v11;
    id v16 = v13;
    v17 = self;
    dispatch_async((dispatch_queue_t)engineQ, v15);
    v14 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446978;
      v19 = "-[WAEngine observeValueForKeyPath:ofObject:change:context:]";
      __int16 v20 = 1024;
      int v21 = 576;
      __int16 v22 = 2112;
      id v23 = v8;
      __int16 v24 = 2112;
      id v25 = v13;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:%@ Preference is %@", buf, 0x26u);
    }
  }
}

- (id)_DPSQuickRecoveryEngineObj
{
  dpsQuickRecoveryEngine = self->_dpsQuickRecoveryEngine;
  if (dpsQuickRecoveryEngine) {
    goto LABEL_8;
  }
  if (![(WAEngine *)self _isDPSQuickRecoveryEngineUsed])
  {
    dpsQuickRecoveryEngine = self->_dpsQuickRecoveryEngine;
    goto LABEL_8;
  }
  objc_super v4 = objc_alloc_init(DPSQuickRecoveryRecommendationEngine);
  v5 = self->_dpsQuickRecoveryEngine;
  self->_dpsQuickRecoveryEngine = v4;

  dpsQuickRecoveryEngine = self->_dpsQuickRecoveryEngine;
  if (dpsQuickRecoveryEngine)
  {
LABEL_8:
    v7 = dpsQuickRecoveryEngine;
    goto LABEL_9;
  }
  dispatch_queue_t v6 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    int v9 = 136446466;
    v10 = "-[WAEngine _DPSQuickRecoveryEngineObj]";
    __int16 v11 = 1024;
    int v12 = 588;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "%{public}s::%d:Failed to alloc DPSQuickRecoveryRecommendationEngine", (uint8_t *)&v9, 0x12u);
  }

  v7 = 0;
LABEL_9:

  return v7;
}

- (id)getW5Client
{
  velocityClient = self->_velocityClient;
  if (!velocityClient)
  {
    objc_super v4 = (W5Client *)objc_alloc_init((Class)sub_100045570());
    v5 = self->_velocityClient;
    self->_velocityClient = v4;

    velocityClient = self->_velocityClient;
  }

  return velocityClient;
}

- (BOOL)_isDPSQuickRecoveryEngineUsed
{
  if (self->_driverType) {
    return 1;
  }
  id v3 = +[WAApple80211Manager sharedObject];
  objc_super v4 = [v3 getInfraApple80211];

  if (!v4)
  {
    v7 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v9 = 136446466;
      v10 = "-[WAEngine _isDPSQuickRecoveryEngineUsed]";
      __int16 v11 = 1024;
      int v12 = 616;
      id v8 = "%{public}s::%d:invalid apple80211API";
LABEL_11:
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, v8, (uint8_t *)&v9, 0x12u);
    }
LABEL_12:

    return 0;
  }
  id v5 = [v4 getDriverType];
  self->_driverType = (int64_t)v5;
  if (!v5)
  {
    v7 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v9 = 136446466;
      v10 = "-[WAEngine _isDPSQuickRecoveryEngineUsed]";
      __int16 v11 = 1024;
      int v12 = 619;
      id v8 = "%{public}s::%d:invalid _driverType kWAWIFIDriverUnknown";
      goto LABEL_11;
    }
    goto LABEL_12;
  }

  return 1;
}

- (void)_updateProfileStateDate:(unsigned __int8)a3
{
  int v3 = a3;
  id v5 = +[NSDate now];
  unint64_t v6 = [(WAEngine *)self _getTimeInProfileState:1];
  v7 = [(WAEngine *)self _getTimeInProfileState:0];
  id v8 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v17 = 136446978;
    uint64_t v18 = "-[WAEngine _updateProfileStateDate:]";
    __int16 v19 = 1024;
    int v20 = 642;
    __int16 v21 = 2048;
    unint64_t v22 = v6;
    __int16 v23 = 2048;
    __int16 v24 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:MegaWiFi Profile state change: currentEnabledSeconds %lu currentDisabledSeconds %lu", (uint8_t *)&v17, 0x26u);
  }

  if (v3 == 1 && !self->_isMegaEnabled)
  {
    int v9 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      profileMegaEnabledDate = self->_profileMegaEnabledDate;
      profileMegaDisabledDate = self->_profileMegaDisabledDate;
      int v17 = 136447234;
      uint64_t v18 = "-[WAEngine _updateProfileStateDate:]";
      __int16 v19 = 1024;
      int v20 = 645;
      __int16 v21 = 2112;
      unint64_t v22 = (unint64_t)profileMegaEnabledDate;
      __int16 v23 = 2112;
      __int16 v24 = profileMegaDisabledDate;
      __int16 v25 = 2048;
      unint64_t v26 = (unint64_t)v7;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:MegaWiFi Profile Installed: profileMegaEnabledDate %@ profileMegaDisabledDate %@ - was disabled for %lu seconds", (uint8_t *)&v17, 0x30u);
    }
    unsigned __int8 v12 = 1;
    uint64_t v13 = 744;
    uint64_t v14 = 768;
LABEL_13:

    *(Class *)((char *)&self->super.isa + v14) = v7;
    objc_storeStrong((id *)((char *)&self->super.isa + v13), v5);
    self->_isMegaEnabled = v12;
    goto LABEL_14;
  }
  if (!v3 && self->_isMegaEnabled == 1)
  {
    int v9 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      id v15 = self->_profileMegaEnabledDate;
      id v16 = self->_profileMegaDisabledDate;
      int v17 = 136447234;
      uint64_t v18 = "-[WAEngine _updateProfileStateDate:]";
      __int16 v19 = 1024;
      int v20 = 653;
      __int16 v21 = 2112;
      unint64_t v22 = (unint64_t)v15;
      __int16 v23 = 2112;
      __int16 v24 = v16;
      __int16 v25 = 2048;
      unint64_t v26 = v6;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:MegaWiFi Profile Removed: profileMegaEnabledDate %@ profileMegaDisabledDate %@ - was enabled for %lu seconds", (uint8_t *)&v17, 0x30u);
    }
    unsigned __int8 v12 = 0;
    uint64_t v13 = 752;
    uint64_t v14 = 760;
    v7 = (objc_class *)v6;
    goto LABEL_13;
  }
LABEL_14:
}

- (unint64_t)_getTimeInProfileState:(unsigned __int8)a3
{
  int v3 = a3;
  id v5 = +[NSDate now];
  [(NSDate *)self->_pidLaunchDate timeIntervalSinceDate:v5];
  if (v6 < 0.0) {
    double v6 = -v6;
  }
  profileMegaEnabledDate = self->_profileMegaEnabledDate;
  if (v3)
  {
    if (!profileMegaEnabledDate)
    {
      unint64_t profileMegaEnabledSeconds = 0;
      goto LABEL_22;
    }
    if (self->_profileMegaDisabledDate)
    {
      unint64_t profileMegaEnabledSeconds = self->_profileMegaEnabledSeconds;
      if (!self->_isMegaEnabled) {
        goto LABEL_22;
      }
LABEL_12:
      -[NSDate timeIntervalSinceDate:](profileMegaEnabledDate, "timeIntervalSinceDate:", v5, v6);
      if (v9 < 0.0) {
        double v9 = -v9;
      }
      profileMegaEnabledSeconds += (unint64_t)v9;
      goto LABEL_22;
    }
    -[NSDate timeIntervalSinceDate:](profileMegaEnabledDate, "timeIntervalSinceDate:", v5, v6);
    if (v10 < 0.0) {
      double v10 = -v10;
    }
    unint64_t profileMegaEnabledSeconds = (unint64_t)v10;
  }
  else
  {
    unint64_t profileMegaEnabledSeconds = (unint64_t)v6;
    if (!profileMegaEnabledDate) {
      goto LABEL_22;
    }
    if (self->_profileMegaDisabledDate)
    {
      unint64_t profileMegaEnabledSeconds = self->_profileMegaDisabledSeconds;
      if (self->_isMegaEnabled) {
        goto LABEL_22;
      }
      profileMegaEnabledDate = self->_profileMegaDisabledDate;
      goto LABEL_12;
    }
    [(NSDate *)profileMegaEnabledDate timeIntervalSinceDate:v5];
    if (v11 < 0.0) {
      double v11 = -v11;
    }
    profileMegaEnabledSeconds -= (unint64_t)v11;
  }
LABEL_22:

  return profileMegaEnabledSeconds;
}

- (void)initDatapathMetricGetterAndFetcher
{
  objc_initWeak(&location, self);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100045C18;
  v3[3] = &unk_1000D11D8;
  objc_copyWeak(&v4, &location);
  v3[4] = self;
  [(WAEngine *)self setDatapathMetricGetter:v3];
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

- (void)setupAnalyticsProcessorWithCompletionBlock:(id)a3
{
  id v4 = (void (**)(id, BOOL))a3;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100046168;
  block[3] = &unk_1000D0D98;
  block[4] = self;
  if (qword_1000F1078 != -1) {
    dispatch_once(&qword_1000F1078, block);
  }
  BOOL v5 = [(WAEngine *)self analyticsProcessorIsReady];
  if (v4) {
    v4[2](v4, v5);
  }
}

- (void)_triggerDeviceAnalyticsStoreMigrationAndReply:(id)a3
{
  id v4 = (void (**)(id, id, void))a3;
  if ([(WAEngine *)self analyticsProcessorIsReady])
  {
    id v5 = [objc_alloc((Class)NSNumber) initWithBool:1];
    double v6 = WALogCategoryDeviceStoreHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446466;
      id v15 = "-[WAEngine _triggerDeviceAnalyticsStoreMigrationAndReply:]";
      __int16 v16 = 1024;
      int v17 = 818;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Result for triggerDeviceAnalyticsStoreMigrationAndReply via XPC - AnalyticsProcessor ready", buf, 0x12u);
    }

    if (v4) {
      v4[2](v4, v5, 0);
    }
  }
  else
  {
    v7 = WALogCategoryDeviceStoreHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446466;
      id v15 = "-[WAEngine _triggerDeviceAnalyticsStoreMigrationAndReply:]";
      __int16 v16 = 1024;
      int v17 = 801;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:AnalyticsProcessor not ready yet", buf, 0x12u);
    }

    if (+[WAUtil isKeyBagUnlocked])
    {
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_100046710;
      v10[3] = &unk_1000D1200;
      double v11 = v4;
      [(WAEngine *)self setupAnalyticsProcessorWithCompletionBlock:v10];
      id v5 = v11;
    }
    else
    {
      NSErrorUserInfoKey v12 = NSLocalizedFailureReasonErrorKey;
      CFStringRef v13 = @"WAErrorCodeKeyBagLocked";
      id v8 = +[NSDictionary dictionaryWithObjects:&v13 forKeys:&v12 count:1];
      id v5 = +[NSError errorWithDomain:@"com.apple.wifi.analytics.errordomain" code:9016 userInfo:v8];

      double v9 = WALogCategoryDeviceStoreHandle();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136446466;
        id v15 = "-[WAEngine _triggerDeviceAnalyticsStoreMigrationAndReply:]";
        __int16 v16 = 1024;
        int v17 = 813;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Result for triggerDeviceAnalyticsStoreMigrationAndReply via XPC - Error: WAErrorCodeKeyBagLocked. KeyBag not unlocked", buf, 0x12u);
      }

      if (v4) {
        ((void (**)(id, id, id))v4)[2](v4, 0, v5);
      }
    }
  }
}

- (void)keyBagLockStateChangeNotification
{
  int v3 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136446466;
    double v6 = "-[WAEngine keyBagLockStateChangeNotification]";
    __int16 v7 = 1024;
    int v8 = 825;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Received keyBagLockStateChangeNotification", (uint8_t *)&v5, 0x12u);
  }

  if (+[WAUtil isKeyBagUnlocked])
  {
    id v4 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 136446466;
      double v6 = "-[WAEngine keyBagLockStateChangeNotification]";
      __int16 v7 = 1024;
      int v8 = 828;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Got keyBagLockStateChangeNotification isKeyBagUnlocked is true, attempting setup setupAnalyticsProcessorWithCompletionBlock", (uint8_t *)&v5, 0x12u);
    }

    [(WAEngine *)self setupAnalyticsProcessorWithCompletionBlock:0];
  }
}

- (void)createAndStartJsonReaderTimer
{
  int v3 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)self->_fileHandlingQ);
  jsonFilerReaderTimer = self->_jsonFilerReaderTimer;
  self->_jsonFilerReaderTimer = v3;

  int v5 = self->_jsonFilerReaderTimer;
  if (v5)
  {
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_100046B74;
    handler[3] = &unk_1000D0D98;
    void handler[4] = self;
    dispatch_source_set_event_handler(v5, handler);
    double v6 = WALogCategoryDeviceStoreHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t analyticsProcessingTimeIntervalSecs = (unint64_t)self->_analyticsProcessingTimeIntervalSecs;
      *(_DWORD *)buf = 136446722;
      id v15 = "-[WAEngine createAndStartJsonReaderTimer]";
      __int16 v16 = 1024;
      int v17 = 843;
      __int16 v18 = 2048;
      unint64_t v19 = analyticsProcessingTimeIntervalSecs;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Starting _jsonFilerReaderTimer to fire in %llu s", buf, 0x1Cu);
    }

    int v8 = self->_jsonFilerReaderTimer;
    [(WAEngine *)self analyticsProcessingTimeIntervalSecs];
    dispatch_time_t v10 = dispatch_time(0xFFFFFFFFFFFFFFFELL, (uint64_t)(v9 * 1000000000.0));
    [(WAEngine *)self analyticsProcessingTimeIntervalSecs];
    dispatch_source_set_timer(v8, v10, 1000000000 * (unint64_t)v11, 0x3B9ACA00uLL);
    dispatch_resume((dispatch_object_t)self->_jsonFilerReaderTimer);
  }
  else
  {
    NSErrorUserInfoKey v12 = WALogCategoryDeviceStoreHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      id v15 = "-[WAEngine createAndStartJsonReaderTimer]";
      __int16 v16 = 1024;
      int v17 = 836;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%{public}s::%d:Failed to create _jsonFilerReaderTimer", buf, 0x12u);
    }
  }
}

- (void)run
{
  int v3 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    int v8 = "-[WAEngine run]";
    __int16 v9 = 1024;
    int v10 = 852;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Starting...", buf, 0x12u);
  }

  engineQ = self->_engineQ;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100046D64;
  block[3] = &unk_1000D0D98;
  block[4] = self;
  dispatch_sync((dispatch_queue_t)engineQ, block);
  int v5 = [(WAEngine *)self listener];
  [v5 resume];
}

- (BOOL)queryInfraInterfaceInstanceAndChip
{
  int v3 = +[WAApple80211Manager sharedObject];
  id v4 = [v3 getInfraApple80211];

  if (!v4)
  {
    id v15 = WALogCategoryDefaultHandle();
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      goto LABEL_26;
    }
    int v19 = 136446466;
    int v20 = "-[WAEngine queryInfraInterfaceInstanceAndChip]";
    __int16 v21 = 1024;
    int v22 = 865;
    __int16 v18 = "%{public}s::%d:invalid apple80211API";
    goto LABEL_25;
  }
  [v4 setDbDelegate:self];
  infraInterfaceName = self->_infraInterfaceName;
  if (!infraInterfaceName || [(NSString *)infraInterfaceName isEqualToString:@"dunno"])
  {
    double v6 = [v4 ifName];
    __int16 v7 = self->_infraInterfaceName;
    self->_infraInterfaceName = v6;

    int v8 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      __int16 v9 = self->_infraInterfaceName;
      int v19 = 136446722;
      int v20 = "-[WAEngine queryInfraInterfaceInstanceAndChip]";
      __int16 v21 = 1024;
      int v22 = 871;
      __int16 v23 = 2112;
      __int16 v24 = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "%{public}s::%d:[apple80211 ifName]%@", (uint8_t *)&v19, 0x1Cu);
    }
  }
  int v10 = self->_infraInterfaceName;
  if (!v10 || [(NSString *)v10 isEqualToString:@"dunno"])
  {
    id v15 = WALogCategoryDefaultHandle();
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      goto LABEL_26;
    }
    int v19 = 136446466;
    int v20 = "-[WAEngine queryInfraInterfaceInstanceAndChip]";
    __int16 v21 = 1024;
    int v22 = 874;
    __int16 v18 = "%{public}s::%d:failed to find _infraInterfaceName";
LABEL_25:
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, v18, (uint8_t *)&v19, 0x12u);
    goto LABEL_26;
  }
  double v11 = [(NSMutableDictionary *)self->_interfaceNameToApple80211InstanceMap objectForKeyedSubscript:self->_infraInterfaceName];

  if (!v11) {
    [(NSMutableDictionary *)self->_interfaceNameToApple80211InstanceMap setObject:v4 forKeyedSubscript:self->_infraInterfaceName];
  }
  wifiChipSet = self->_wifiChipSet;
  if (!wifiChipSet || [(NSString *)wifiChipSet isEqualToString:&stru_1000D3628])
  {
    CFStringRef v13 = [v4 getChipSet];
    uint64_t v14 = self->_wifiChipSet;
    self->_wifiChipSet = v13;
  }
  if (!self->_wifiChipSet && [0 isEqualToString:&stru_1000D3628])
  {
    id v15 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      int v19 = 136446466;
      int v20 = "-[WAEngine queryInfraInterfaceInstanceAndChip]";
      __int16 v21 = 1024;
      int v22 = 884;
      __int16 v18 = "%{public}s::%d:failed to find _wifiChipSet";
      goto LABEL_25;
    }
LABEL_26:
    BOOL v16 = 0;
    goto LABEL_18;
  }
  id v15 = WALogCategoryDefaultHandle();
  BOOL v16 = 1;
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    int v19 = 136446722;
    int v20 = "-[WAEngine queryInfraInterfaceInstanceAndChip]";
    __int16 v21 = 1024;
    int v22 = 888;
    __int16 v23 = 1024;
    LODWORD(v24) = 1;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:queryInfraInterfaceInstanceAndChip returning %d", (uint8_t *)&v19, 0x18u);
  }
LABEL_18:

  return v16;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a4;
  double v6 = [v5 valueForEntitlement:@"com.apple.private.wifianalytics"];
  unsigned __int8 v7 = [v6 BOOLValue];

  if (v7)
  {
    int v8 = [objc_alloc((Class)WAXPCConnection) initWithXPCConnection:v5];
    [v8 setDelegate:self];
    __int16 v9 = WAXPCRequestDelegateInterface();
    [v5 setExportedInterface:v9];

    [v5 setExportedObject:v8];
    [v5 resume];
    int v10 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 136447234;
      CFStringRef v13 = "-[WAEngine listener:shouldAcceptNewConnection:]";
      __int16 v14 = 1024;
      int v15 = 914;
      __int16 v16 = 1024;
      unsigned int v17 = [v5 processIdentifier];
      __int16 v18 = 1024;
      unsigned int v19 = [v5 effectiveUserIdentifier];
      __int16 v20 = 1024;
      unsigned int v21 = [v5 effectiveGroupIdentifier];
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:XPC: ADDED XPC CONNECTION [pid=%d, euid=%d, egid=%d]", (uint8_t *)&v12, 0x24u);
    }
  }
  else
  {
    int v8 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v12 = 136446466;
      CFStringRef v13 = "-[WAEngine listener:shouldAcceptNewConnection:]";
      __int16 v14 = 1024;
      int v15 = 904;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "%{public}s::%d:XPC: Connection from client not entitled, will not accept", (uint8_t *)&v12, 0x12u);
    }
  }

  return v7;
}

- (void)xpcConnection:(id)a3 establishConnectionWithToken:(id)a4 andReply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  objc_initWeak(&location, v8);
  objc_initWeak(&v48, self);
  id v11 = v9;
  id v12 = objc_loadWeakRetained(&location);
  CFStringRef v13 = [v12 connection];
  objc_initWeak(&from, v13);

  if (v11)
  {
    v35 = 0;
    __int16 v18 = v11;
  }
  else
  {
    __int16 v14 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      int v15 = [v8 connection];
      unsigned int v16 = [v15 processIdentifier];
      *(_DWORD *)buf = 136446722;
      v51 = "-[WAEngine xpcConnection:establishConnectionWithToken:andReply:]";
      __int16 v52 = 1024;
      int v53 = 933;
      __int16 v54 = 1024;
      LODWORD(v55) = v16;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "%{public}s::%d:XPC: Connection from pid=%d without token. Generating a token for the reply", buf, 0x18u);
    }
    unsigned int v17 = +[NSUUID UUID];
    __int16 v18 = [v17 UUIDString];

    v35 = v18;
  }
  [v8 setToken:v18];
  v44[0] = _NSConcreteStackBlock;
  v44[1] = 3221225472;
  v44[2] = sub_100047844;
  v44[3] = &unk_1000D1228;
  objc_copyWeak(&v45, &location);
  objc_copyWeak(&v46, &from);
  unsigned int v19 = [v8 connection];
  [v19 setInterruptionHandler:v44];

  v40[0] = _NSConcreteStackBlock;
  v40[1] = 3221225472;
  v40[2] = sub_1000479B0;
  v40[3] = &unk_1000D1278;
  v40[4] = self;
  objc_copyWeak(&v41, &location);
  objc_copyWeak(&v42, &from);
  objc_copyWeak(&v43, &v48);
  __int16 v20 = [v8 connection];
  [v20 setInvalidationHandler:v40];

  unsigned int v21 = [(WAEngine *)self engineQ];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100047C94;
  block[3] = &unk_1000D12A0;
  objc_copyWeak(&v39, &v48);
  id v22 = v18;
  id v37 = v22;
  id v23 = v8;
  id v38 = v23;
  dispatch_async(v21, block);

  objc_destroyWeak(&v39);
  __int16 v24 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    id v34 = v10;
    id v33 = v11;
    __int16 v25 = [v23 token];
    id v26 = +[WAUtil trimTokenForLogging:v25];
    dispatch_queue_t v27 = [v23 connection];
    unsigned int v28 = [v27 processIdentifier];
    v29 = [v23 connection];
    unsigned int v30 = [v29 effectiveUserIdentifier];
    v31 = [v23 connection];
    unsigned int v32 = [v31 effectiveGroupIdentifier];
    *(_DWORD *)buf = 136447490;
    v51 = "-[WAEngine xpcConnection:establishConnectionWithToken:andReply:]";
    __int16 v52 = 1024;
    int v53 = 967;
    __int16 v54 = 2112;
    id v55 = v26;
    __int16 v56 = 1024;
    unsigned int v57 = v28;
    __int16 v58 = 1024;
    unsigned int v59 = v30;
    __int16 v60 = 1024;
    unsigned int v61 = v32;
    _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:XPC: Token: %@ is for: [pid=%d, euid=%d, egid=%d]", buf, 0x2Eu);

    id v11 = v33;
    id v10 = v34;
  }
  if (v10) {
    (*((void (**)(id, void *, void))v10 + 2))(v10, v35, 0);
  }
  objc_destroyWeak(&v43);
  objc_destroyWeak(&v42);
  objc_destroyWeak(&v41);
  objc_destroyWeak(&v46);
  objc_destroyWeak(&v45);
  objc_destroyWeak(&from);

  objc_destroyWeak(&v48);
  objc_destroyWeak(&location);
}

- (void)xpcConnection:(id)a3 submitMessage:(id)a4 groupType:(int64_t)a5 andReply:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  objc_initWeak(&location, self);
  CFStringRef v13 = [(WAEngine *)self engineQ];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100047E78;
  v17[3] = &unk_1000D12C8;
  objc_copyWeak(v21, &location);
  id v18 = v10;
  id v19 = v11;
  v21[1] = (id)a5;
  id v20 = v12;
  id v14 = v12;
  id v15 = v11;
  id v16 = v10;
  dispatch_async(v13, v17);

  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
}

- (void)xpcConnection:(id)a3 submitWiFiAnalyticsMessageAdvanced:(id)a4 andReply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  objc_initWeak(&location, self);
  id v11 = [(WAEngine *)self engineQ];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100048250;
  block[3] = &unk_1000D1340;
  objc_copyWeak(&v19, &location);
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(v11, block);

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);
}

- (void)xpcConnection:(id)a3 getMessagesModelForGroupType:(int64_t)a4 andReply:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  objc_initWeak(&location, self);
  id v10 = [(WAEngine *)self engineQ];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000485E4;
  block[3] = &unk_1000D11B0;
  objc_copyWeak(v16, &location);
  v16[1] = (id)a4;
  id v14 = v8;
  id v15 = v9;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(v10, block);

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
}

- (void)xpcConnection:(id)a3 registerMessageGroup:(int64_t)a4 andReply:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  objc_initWeak(&location, self);
  id v10 = [(WAEngine *)self engineQ];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000488EC;
  block[3] = &unk_1000D11B0;
  objc_copyWeak(v16, &location);
  v16[1] = (id)a4;
  id v14 = v8;
  id v15 = v9;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(v10, block);

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
}

- (void)xpcConnection:(id)a3 getNewMessageForKey:(id)a4 groupType:(int64_t)a5 withCopy:(id)a6 andReply:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  id v15 = a7;
  objc_initWeak(&location, self);
  id v16 = [(WAEngine *)self engineQ];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100048FEC;
  block[3] = &unk_1000D1318;
  objc_copyWeak(v26, &location);
  v26[1] = (id)a5;
  id v22 = v12;
  id v23 = v13;
  id v24 = v14;
  id v25 = v15;
  id v17 = v15;
  id v18 = v14;
  id v19 = v13;
  id v20 = v12;
  dispatch_async(v16, block);

  objc_destroyWeak(v26);
  objc_destroyWeak(&location);
}

- (void)xpcConnection:(id)a3 killDaemonAndReply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  id v8 = [v6 connection];
  id v9 = [v8 valueForEntitlement:@"com.apple.private.wifianalytics.test"];
  unsigned __int8 v10 = [v9 BOOLValue];

  id v11 = WALogCategoryDefaultHandle();
  id v12 = v11;
  if (v10)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136446466;
      id v24 = "-[WAEngine xpcConnection:killDaemonAndReply:]";
      __int16 v25 = 1024;
      int v26 = 1098;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "%{public}s::%d:Received killDaemon via XPC - this shouldn't happen outside of unit tests", buf, 0x12u);
    }

    id v13 = [(WAEngine *)self engineQ];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100049608;
    block[3] = &unk_1000D1340;
    void block[4] = self;
    objc_copyWeak(&v21, &location);
    id v19 = v6;
    id v20 = v7;
    dispatch_async(v13, block);

    objc_destroyWeak(&v21);
  }
  else
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      id v14 = [v6 token];
      id v15 = +[WAUtil trimTokenForLogging:v14];
      id v16 = [v6 connection];
      unsigned int v17 = [v16 processIdentifier];
      *(_DWORD *)buf = 136447234;
      id v24 = "-[WAEngine xpcConnection:killDaemonAndReply:]";
      __int16 v25 = 1024;
      int v26 = 1096;
      __int16 v27 = 2112;
      id v28 = v15;
      __int16 v29 = 1024;
      unsigned int v30 = v17;
      __int16 v31 = 2112;
      CFStringRef v32 = @"com.apple.private.wifianalytics";
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%{public}s::%d:XPC: ERROR: %@ (%d) is not entitled with WA_XPC_ENTITLEMENT_TEST  for %@, rejecting connection!!!", buf, 0x2Cu);
    }
  }
  objc_destroyWeak(&location);
}

- (void)xpcConnection:(id)a3 clearMessageStoreAndReply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  id v8 = [v6 connection];
  id v9 = [v8 valueForEntitlement:@"com.apple.private.wifianalytics.test"];
  unsigned __int8 v10 = [v9 BOOLValue];

  id v11 = WALogCategoryDefaultHandle();
  id v12 = v11;
  if (v10)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136446466;
      id v24 = "-[WAEngine xpcConnection:clearMessageStoreAndReply:]";
      __int16 v25 = 1024;
      int v26 = 1122;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "%{public}s::%d:Received clearMessageStoreAndReply via XPC - this shouldn't happen outside of unit tests", buf, 0x12u);
    }

    id v13 = [(WAEngine *)self engineQ];
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_100049A3C;
    v18[3] = &unk_1000D1368;
    objc_copyWeak(&v21, &location);
    id v19 = v6;
    id v20 = v7;
    dispatch_async(v13, v18);

    objc_destroyWeak(&v21);
  }
  else
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      id v14 = [v6 token];
      id v15 = +[WAUtil trimTokenForLogging:v14];
      id v16 = [v6 connection];
      unsigned int v17 = [v16 processIdentifier];
      *(_DWORD *)buf = 136447234;
      id v24 = "-[WAEngine xpcConnection:clearMessageStoreAndReply:]";
      __int16 v25 = 1024;
      int v26 = 1120;
      __int16 v27 = 2112;
      id v28 = v15;
      __int16 v29 = 1024;
      unsigned int v30 = v17;
      __int16 v31 = 2112;
      CFStringRef v32 = @"com.apple.private.wifianalytics";
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%{public}s::%d:XPC: ERROR: %@ (%d) is not entitled with WA_XPC_ENTITLEMENT_TEST  for %@, rejecting connection!!!", buf, 0x2Cu);
    }
  }
  objc_destroyWeak(&location);
}

- (void)xpcConnection:(id)a3 trapCrashMiniTracerDumpReadyForInterfaceWithName:(id)a4 andReply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  objc_initWeak(&location, self);
  id v11 = [v8 connection];
  id v12 = [v11 valueForEntitlement:@"com.apple.private.wifianalytics.fw-trap"];
  unsigned __int8 v13 = [v12 BOOLValue];

  id v14 = WALogCategoryDefaultHandle();
  id v15 = v14;
  if (v13)
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446466;
      id v28 = "-[WAEngine xpcConnection:trapCrashMiniTracerDumpReadyForInterfaceWithName:andReply:]";
      __int16 v29 = 1024;
      int v30 = 1145;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Received trapCrashMiniTracerDumpReady via XPC, usually this due to wifid detecting the kApple80211DriverAvailabilityFlagHasTrapCrashTracerMiniDump flag in a driver availability message", buf, 0x12u);
    }

    id v16 = [(WAEngine *)self engineQ];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100049E84;
    block[3] = &unk_1000D1340;
    objc_copyWeak(&v25, &location);
    id v22 = v8;
    id v23 = v9;
    id v24 = v10;
    dispatch_async(v16, block);

    objc_destroyWeak(&v25);
  }
  else
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      unsigned int v17 = [v8 token];
      id v18 = +[WAUtil trimTokenForLogging:v17];
      id v19 = [v8 connection];
      unsigned int v20 = [v19 processIdentifier];
      *(_DWORD *)buf = 136447234;
      id v28 = "-[WAEngine xpcConnection:trapCrashMiniTracerDumpReadyForInterfaceWithName:andReply:]";
      __int16 v29 = 1024;
      int v30 = 1143;
      __int16 v31 = 2112;
      id v32 = v18;
      __int16 v33 = 1024;
      unsigned int v34 = v20;
      __int16 v35 = 2112;
      CFStringRef v36 = @"com.apple.private.wifianalytics";
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%{public}s::%d:XPC: ERROR: %@ (%d) is not entitled with WA_XPC_ENTITLEMENT_FW_TRAP  for %@, rejecting connection!!!", buf, 0x2Cu);
    }
  }
  objc_destroyWeak(&location);
}

- (void)xpcConnection:(id)a3 lqmCrashTracerNotifyForInterfaceWithName:(id)a4 andReply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  objc_initWeak(&location, self);
  id v11 = [v8 connection];
  id v12 = [v11 valueForEntitlement:@"com.apple.private.wifianalytics.fw-trap"];
  unsigned __int8 v13 = [v12 BOOLValue];

  id v14 = WALogCategoryDefaultHandle();
  id v15 = v14;
  if (v13)
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446466;
      id v28 = "-[WAEngine xpcConnection:lqmCrashTracerNotifyForInterfaceWithName:andReply:]";
      __int16 v29 = 1024;
      int v30 = 1168;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Received lqmCrashTracerNotify via XPC", buf, 0x12u);
    }

    id v16 = [(WAEngine *)self engineQ];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10004A2CC;
    block[3] = &unk_1000D1340;
    objc_copyWeak(&v25, &location);
    id v22 = v8;
    id v23 = v9;
    id v24 = v10;
    dispatch_async(v16, block);

    objc_destroyWeak(&v25);
  }
  else
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      unsigned int v17 = [v8 token];
      id v18 = +[WAUtil trimTokenForLogging:v17];
      id v19 = [v8 connection];
      unsigned int v20 = [v19 processIdentifier];
      *(_DWORD *)buf = 136447234;
      id v28 = "-[WAEngine xpcConnection:lqmCrashTracerNotifyForInterfaceWithName:andReply:]";
      __int16 v29 = 1024;
      int v30 = 1166;
      __int16 v31 = 2112;
      id v32 = v18;
      __int16 v33 = 1024;
      unsigned int v34 = v20;
      __int16 v35 = 2112;
      CFStringRef v36 = @"com.apple.private.wifianalytics";
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%{public}s::%d:XPC: ERROR: %@ (%d) is not entitled with WA_XPC_ENTITLEMENT_FW_TRAP  for %@, rejecting connection!!!", buf, 0x2Cu);
    }
  }
  objc_destroyWeak(&location);
}

- (void)xpcConnection:(id)a3 lqmCrashTracerReceiveBlock:(id)a4 forInterfaceWithName:(id)a5 andReply:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  objc_initWeak(&location, self);
  id v14 = [v10 connection];
  id v15 = [v14 valueForEntitlement:@"com.apple.private.wifianalytics.fw-trap"];
  unsigned __int8 v16 = [v15 BOOLValue];

  unsigned int v17 = WALogCategoryDefaultHandle();
  id v18 = v17;
  if (v16)
  {
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446466;
      id v32 = "-[WAEngine xpcConnection:lqmCrashTracerReceiveBlock:forInterfaceWithName:andReply:]";
      __int16 v33 = 1024;
      int v34 = 1190;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Received lqmCrashTracerReceiveBlock via XPC", buf, 0x12u);
    }

    id v19 = [(WAEngine *)self engineQ];
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_10004A738;
    v24[3] = &unk_1000D1390;
    objc_copyWeak(&v29, &location);
    id v25 = v10;
    id v26 = v11;
    id v27 = v12;
    id v28 = v13;
    dispatch_async(v19, v24);

    objc_destroyWeak(&v29);
  }
  else
  {
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      unsigned int v20 = [v10 token];
      id v21 = +[WAUtil trimTokenForLogging:v20];
      id v22 = [v10 connection];
      unsigned int v23 = [v22 processIdentifier];
      *(_DWORD *)buf = 136447234;
      id v32 = "-[WAEngine xpcConnection:lqmCrashTracerReceiveBlock:forInterfaceWithName:andReply:]";
      __int16 v33 = 1024;
      int v34 = 1188;
      __int16 v35 = 2112;
      id v36 = v21;
      __int16 v37 = 1024;
      unsigned int v38 = v23;
      __int16 v39 = 2112;
      CFStringRef v40 = @"com.apple.private.wifianalytics";
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "%{public}s::%d:XPC: ERROR: %@ (%d) is not entitled with WA_XPC_ENTITLEMENT_FW_TRAP  for %@, rejecting connection!!!", buf, 0x2Cu);
    }
  }
  objc_destroyWeak(&location);
}

- (void)xpcConnection:(id)a3 triggerQueryForNWActivity:(int64_t)a4 andReply:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  objc_initWeak(&location, self);
  id v10 = [(WAEngine *)self engineQ];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10004A9AC;
  block[3] = &unk_1000D11B0;
  objc_copyWeak(v16, &location);
  v16[1] = (id)a4;
  id v14 = v8;
  id v15 = v9;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(v10, block);

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
}

- (void)xpcConnection:(id)a3 convertWiFiStatsIntoPercentile:(id)a4 analysisGroup:(int64_t)a5 groupTarget:(id)a6 andReply:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  id v15 = a7;
  objc_initWeak(&location, self);
  unsigned __int8 v16 = [(WAEngine *)self engineQ];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10004AF00;
  block[3] = &unk_1000D1318;
  objc_copyWeak(v26, &location);
  id v22 = v12;
  id v23 = v13;
  v26[1] = (id)a5;
  id v24 = v14;
  id v25 = v15;
  id v17 = v15;
  id v18 = v14;
  id v19 = v13;
  id v20 = v12;
  dispatch_async(v16, block);

  objc_destroyWeak(v26);
  objc_destroyWeak(&location);
}

- (void)xpcConnection:(id)a3 triggerDatapathDiagnosticsAndCollectUpdates:(int64_t)a4 waMessage:(id)a5 andReply:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  objc_initWeak(&location, self);
  id v13 = [(WAEngine *)self engineQ];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10004B350;
  v17[3] = &unk_1000D12C8;
  objc_copyWeak(v21, &location);
  id v18 = v10;
  id v19 = v11;
  v21[1] = (id)a4;
  id v20 = v12;
  id v14 = v12;
  id v15 = v11;
  id v16 = v10;
  dispatch_async(v13, v17);

  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
}

- (void)xpcConnection:(id)a3 getDpsStatsandReply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  id v8 = [(WAEngine *)self engineQ];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10004B74C;
  v11[3] = &unk_1000D1368;
  objc_copyWeak(&v14, &location);
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

- (void)xpcConnection:(id)a3 getUsageStatsandReply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  id v8 = [(WAEngine *)self engineQ];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10004BB7C;
  block[3] = &unk_1000D1340;
  objc_copyWeak(&v15, &location);
  id v12 = v6;
  id v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

- (void)xpcConnection:(id)a3 setDeviceAnalyticsConfiguration:(id)a4 andReply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  objc_initWeak(&location, self);
  id v11 = [(WAEngine *)self engineQ];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10004C000;
  block[3] = &unk_1000D1340;
  objc_copyWeak(&v19, &location);
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(v11, block);

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);
}

- (void)xpcConnection:(id)a3 getDeviceAnalyticsConfigurationAndReply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  id v8 = [(WAEngine *)self engineQ];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10004C384;
  v11[3] = &unk_1000D1368;
  objc_copyWeak(&v14, &location);
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

- (void)xpcConnection:(id)a3 summarizeDeviceAnalyticsForNetwork:(id)a4 maxAgeInDays:(unint64_t)a5 andReply:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  objc_initWeak(&location, self);
  id v13 = [(WAEngine *)self engineQ];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10004C74C;
  v17[3] = &unk_1000D12C8;
  objc_copyWeak(v21, &location);
  id v18 = v10;
  id v19 = v11;
  v21[1] = (id)a5;
  id v20 = v12;
  id v14 = v12;
  id v15 = v11;
  id v16 = v10;
  dispatch_async(v13, v17);

  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
}

- (void)xpcConnection:(id)a3 triggerDeviceAnalyticsStoreMigrationAndReply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  id v8 = WALogCategoryDeviceStoreHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    id v18 = "-[WAEngine xpcConnection:triggerDeviceAnalyticsStoreMigrationAndReply:]";
    __int16 v19 = 1024;
    int v20 = 1457;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Received triggerDeviceAnalyticsStoreMigrationAndReply via XPC", buf, 0x12u);
  }

  id v9 = [(WAEngine *)self engineQ];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10004CB94;
  v12[3] = &unk_1000D1368;
  objc_copyWeak(&v15, &location);
  id v13 = v6;
  id v14 = v7;
  id v10 = v7;
  id v11 = v6;
  dispatch_async(v9, v12);

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

- (void)xpcConnection:(id)a3 sendMemoryPressureRequestAndReply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  id v8 = [v6 connection];
  id v9 = [v8 valueForEntitlement:@"com.apple.private.wifianalytics.test"];
  unsigned __int8 v10 = [v9 BOOLValue];

  id v11 = WALogCategoryDefaultHandle();
  id v12 = v11;
  if (v10)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136446466;
      id v24 = "-[WAEngine xpcConnection:sendMemoryPressureRequestAndReply:]";
      __int16 v25 = 1024;
      int v26 = 1493;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "%{public}s::%d:Received MemoryPressure request via XPC - this shouldn't happen outside of unit tests", buf, 0x12u);
    }

    id v13 = [(WAEngine *)self engineQ];
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_10004D130;
    v18[3] = &unk_1000D1368;
    objc_copyWeak(&v21, &location);
    id v19 = v6;
    id v20 = v7;
    dispatch_async(v13, v18);

    objc_destroyWeak(&v21);
  }
  else
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      id v14 = [v6 token];
      id v15 = +[WAUtil trimTokenForLogging:v14];
      id v16 = [v6 connection];
      unsigned int v17 = [v16 processIdentifier];
      *(_DWORD *)buf = 136447234;
      id v24 = "-[WAEngine xpcConnection:sendMemoryPressureRequestAndReply:]";
      __int16 v25 = 1024;
      int v26 = 1490;
      __int16 v27 = 2112;
      id v28 = v15;
      __int16 v29 = 1024;
      unsigned int v30 = v17;
      __int16 v31 = 2112;
      CFStringRef v32 = @"com.apple.private.wifianalytics";
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%{public}s::%d:XPC: ERROR: %@ (%d) is not entitled with WA_XPC_ENTITLEMENT_TEST  for %@, rejecting connection!!!", buf, 0x2Cu);
    }
  }
  objc_destroyWeak(&location);
}

- (void)xpcConnection:(id)a3 issueIOReportManagementCommand:(unint64_t)a4 andReply:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  objc_initWeak(&location, self);
  uint64_t v28 = 0;
  __int16 v29 = &v28;
  uint64_t v30 = 0x3032000000;
  __int16 v31 = sub_10004D654;
  CFStringRef v32 = sub_10004D664;
  id v33 = 0;
  unsigned __int8 v10 = [v8 connection];
  id v11 = [v10 valueForEntitlement:@"com.apple.private.wifianalytics.test"];
  unsigned __int8 v12 = [v11 BOOLValue];

  id v13 = WALogCategoryDefaultHandle();
  id v14 = v13;
  if (v12)
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136446466;
      unsigned int v38 = "-[WAEngine xpcConnection:issueIOReportManagementCommand:andReply:]";
      __int16 v39 = 1024;
      int v40 = 1519;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "%{public}s::%d:Received issueIOReportManagementCommand request via XPC - this shouldn't happen outside of unit tests", buf, 0x12u);
    }

    id v15 = [(WAEngine *)self engineQ];
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_10004D66C;
    v23[3] = &unk_1000D13B8;
    objc_copyWeak(v27, &location);
    id v24 = v8;
    int v26 = &v28;
    v27[1] = (id)a4;
    id v25 = v9;
    dispatch_async(v15, v23);

    objc_destroyWeak(v27);
  }
  else
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      id v16 = [v8 token];
      id v17 = +[WAUtil trimTokenForLogging:v16];
      id v18 = [v8 connection];
      unsigned int v19 = [v18 processIdentifier];
      *(_DWORD *)buf = 136447234;
      unsigned int v38 = "-[WAEngine xpcConnection:issueIOReportManagementCommand:andReply:]";
      __int16 v39 = 1024;
      int v40 = 1517;
      __int16 v41 = 2112;
      id v42 = v17;
      __int16 v43 = 1024;
      unsigned int v44 = v19;
      __int16 v45 = 2112;
      CFStringRef v46 = @"com.apple.private.wifianalytics";
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "%{public}s::%d:XPC: ERROR: %@ (%d) is not entitled with WA_XPC_ENTITLEMENT_TEST  for %@, rejecting connection!!!", buf, 0x2Cu);
    }
    NSErrorUserInfoKey v35 = NSLocalizedFailureReasonErrorKey;
    CFStringRef v36 = @"WAErrorCodeClientNotEntitled";
    id v20 = +[NSDictionary dictionaryWithObjects:&v36 forKeys:&v35 count:1];
    uint64_t v21 = +[NSError errorWithDomain:@"com.apple.wifi.analytics.errordomain" code:9030 userInfo:v20];
    id v22 = (void *)v29[5];
    v29[5] = v21;
  }
  if (v9) {
    (*((void (**)(id, void, uint64_t))v9 + 2))(v9, 0, v29[5]);
  }
  _Block_object_dispose(&v28, 8);

  objc_destroyWeak(&location);
}

- (BOOL)submitterMapCheck:(id)a3 group:(int64_t)a4
{
  id v6 = a3;
  submitterMap = self->_submitterMap;
  id v8 = [v6 token];
  id v9 = [(NSMutableDictionary *)submitterMap objectForKeyedSubscript:v8];
  unsigned __int8 v10 = +[NSNumber numberWithInteger:a4];
  id v11 = [v9 objectForKeyedSubscript:v10];

  if (!v11)
  {
    unsigned __int8 v12 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      id v13 = [v6 connection];
      unsigned int v14 = [v13 processIdentifier];
      id v15 = [v6 connection];
      id v16 = [v15 serviceName];
      id v17 = +[WAUtil groupTypeToString:a4];
      int v19 = 136447490;
      id v20 = "-[WAEngine submitterMapCheck:group:]";
      __int16 v21 = 1024;
      int v22 = 1555;
      __int16 v23 = 1024;
      unsigned int v24 = v14;
      __int16 v25 = 2112;
      int v26 = v16;
      __int16 v27 = 2112;
      uint64_t v28 = v17;
      __int16 v29 = 2048;
      int64_t v30 = a4;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:pid %d proc %@ group %@(%ld) not in submitterMap", (uint8_t *)&v19, 0x36u);
    }
  }

  return v11 != 0;
}

- (id)getXPCConnectionForProcessToken:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = sub_10004D654;
  id v16 = sub_10004D664;
  id v17 = 0;
  id v5 = [(WAEngine *)self engineQ];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10004DD00;
  block[3] = &unk_1000D13E0;
  id v10 = v4;
  id v11 = &v12;
  void block[4] = self;
  id v6 = v4;
  dispatch_sync(v5, block);

  id v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

- (void)sendWakeUpNotificationForProcessWithName:(id)a3
{
  id v4 = a3;
  id v5 = [(WAEngine *)self engineQ];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10004DE14;
  v7[3] = &unk_1000D1188;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)prepareToTerminateViaEagerExit
{
  objc_initWeak(&location, self);
  int v3 = [(WAEngine *)self engineQ];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10004E01C;
  v4[3] = &unk_1000D0E30;
  objc_copyWeak(&v5, &location);
  dispatch_async(v3, v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)_prepareToTerminateViaEagerExit
{
  +[WAUtil incrementValueForKey:@"Terminations - Try Eager Exit" inMutableDict:self->_cachedUsage onQueue:self->_engineQ];
  int v3 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136446466;
    id v6 = "-[WAEngine _prepareToTerminateViaEagerExit]";
    __int16 v7 = 1024;
    int v8 = 1603;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:prepareToTerminate...", (uint8_t *)&v5, 0x12u);
  }

  [(WAEngine *)self _prepareToTerminate];
  id v4 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136446466;
    id v6 = "-[WAEngine _prepareToTerminateViaEagerExit]";
    __int16 v7 = 1024;
    int v8 = 1605;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Done", (uint8_t *)&v5, 0x12u);
  }
}

- (void)prepareToTerminateAnyReply:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  int v5 = [(WAEngine *)self engineQ];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10004E340;
  block[3] = &unk_1000D1408;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)_prepareToTerminate
{
  +[WAUtil incrementValueForKey:@"Terminations - Graceful" inMutableDict:self->_cachedUsage onQueue:self->_engineQ];
  [(NSMutableDictionary *)self->_cachedUsage removeObjectForKey:@"Last Graceful Termination Date"];
  cachedUsage = self->_cachedUsage;
  id v4 = +[NSDate date];
  [(NSMutableDictionary *)cachedUsage setObject:v4 forKey:@"Last Graceful Termination Date"];

  int v5 = [(WAEngine *)self listener];
  [v5 suspend];

  id v6 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 136446466;
    id v11 = "-[WAEngine _prepareToTerminate]";
    __int16 v12 = 1024;
    int v13 = 1626;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:_persist", (uint8_t *)&v10, 0x12u);
  }

  [(WAEngine *)self _persist];
  __int16 v7 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 136446466;
    id v11 = "-[WAEngine _prepareToTerminate]";
    __int16 v12 = 1024;
    int v13 = 1628;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:persistIORObjects", (uint8_t *)&v10, 0x12u);
  }

  id v8 = [(WAEngine *)self iorMessagePopulator];
  [v8 persistIORObjects:1];

  id v9 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 136446466;
    id v11 = "-[WAEngine _prepareToTerminate]";
    __int16 v12 = 1024;
    int v13 = 1630;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Done", (uint8_t *)&v10, 0x12u);
  }
}

- (void)handleMemoryWarning:(BOOL)a3
{
  BOOL v3 = a3;
  objc_initWeak(&location, self);
  int v5 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446978;
    __int16 v12 = "-[WAEngine handleMemoryWarning:]";
    __int16 v13 = 1024;
    int v14 = 1637;
    __int16 v15 = 2080;
    id v16 = "-[WAEngine handleMemoryWarning:]";
    __int16 v17 = 1024;
    BOOL v18 = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:%s: critical=%d", buf, 0x22u);
  }

  id v6 = [(WAEngine *)self engineQ];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10004E7E8;
  block[3] = &unk_1000D0E58;
  objc_copyWeak(&v8, &location);
  BOOL v9 = v3;
  dispatch_async(v6, block);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (id)_getBasePersistenceKeychainQuery
{
  v5[0] = kSecAttrAccount;
  v5[1] = kSecAttrService;
  v6[0] = @"com.apple.wifi.analytics.persistence";
  v6[1] = @"WiFiAnalytics";
  v5[2] = kSecAttrAccessGroup;
  v5[3] = kSecClass;
  v6[2] = @"apple";
  v6[3] = kSecClassGenericPassword;
  v2 = +[NSDictionary dictionaryWithObjects:v6 forKeys:v5 count:4];
  id v3 = [v2 mutableCopy];

  return v3;
}

- (id)_rotateObscureKey
{
  id v3 = +[NSUUID UUID];
  id v4 = [v3 UUIDString];

  CFDictionaryRef v5 = [(WAEngine *)self _getBasePersistenceKeychainQuery];
  CFDictionaryRef v6 = v5;
  if (v5)
  {
    SecItemDelete(v5);
    __int16 v7 = [v4 dataUsingEncoding:4];
    [(__CFDictionary *)v6 setObject:v7 forKeyedSubscript:kSecValueData];

    [(__CFDictionary *)v6 setObject:kSecAttrAccessibleAlways forKeyedSubscript:kSecAttrAccessible];
    OSStatus v8 = SecItemAdd(v6, 0);
    if (!v8) {
      goto LABEL_3;
    }
    OSStatus v15 = v8;
    id v11 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)id v16 = 136446722;
      *(void *)&v16[4] = "-[WAEngine _rotateObscureKey]";
      *(_WORD *)&v16[12] = 1024;
      *(_DWORD *)&v16[14] = 1694;
      *(_WORD *)&v16[18] = 1024;
      *(_DWORD *)&v16[20] = v15;
      __int16 v12 = "%{public}s::%d:Error back from SecItemUpdate()/SecItemAdd(): %d";
      __int16 v13 = v11;
      uint32_t v14 = 24;
      goto LABEL_10;
    }
  }
  else
  {
    id v11 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)id v16 = 136446466;
      *(void *)&v16[4] = "-[WAEngine _rotateObscureKey]";
      *(_WORD *)&v16[12] = 1024;
      *(_DWORD *)&v16[14] = 1683;
      __int16 v12 = "%{public}s::%d:Failed to get base keychain query for write op";
      __int16 v13 = v11;
      uint32_t v14 = 18;
LABEL_10:
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, v12, v16, v14);
    }
  }

LABEL_3:
  BOOL v9 = [(WAEngine *)self _getObscureKey];

  return v9;
}

- (id)_getObscureKey
{
  CFTypeRef result = 0;
  CFDictionaryRef v2 = [(WAEngine *)self _getBasePersistenceKeychainQuery];
  CFDictionaryRef v3 = v2;
  if (v2)
  {
    [(__CFDictionary *)v2 setObject:&__kCFBooleanTrue forKeyedSubscript:kSecReturnData];
    OSStatus v4 = SecItemCopyMatching(v3, &result);
    if (v4)
    {
      OSStatus v10 = v4;
      CFDictionaryRef v6 = WALogCategoryDefaultHandle();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446722;
        OSStatus v15 = "-[WAEngine _getObscureKey]";
        __int16 v16 = 1024;
        int v17 = 1712;
        __int16 v18 = 1024;
        OSStatus v19 = v10;
        BOOL v9 = "%{public}s::%d:Error back from SecItemCopyMatching(): %d";
        id v11 = v6;
        uint32_t v12 = 24;
LABEL_15:
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, v9, buf, v12);
      }
    }
    else
    {
      if (result)
      {
        id v5 = objc_alloc((Class)NSString);
        CFDictionaryRef v6 = result;
        id v7 = [v5 initWithData:result encoding:4];
        goto LABEL_5;
      }
      CFDictionaryRef v6 = WALogCategoryDefaultHandle();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446466;
        OSStatus v15 = "-[WAEngine _getObscureKey]";
        __int16 v16 = 1024;
        int v17 = 1713;
        BOOL v9 = "%{public}s::%d:Keychain didn't return any key data";
        goto LABEL_14;
      }
    }
  }
  else
  {
    CFDictionaryRef v6 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      OSStatus v15 = "-[WAEngine _getObscureKey]";
      __int16 v16 = 1024;
      int v17 = 1707;
      BOOL v9 = "%{public}s::%d:Failed to get base keychain query for read op";
LABEL_14:
      id v11 = v6;
      uint32_t v12 = 18;
      goto LABEL_15;
    }
  }
  id v7 = 0;
LABEL_5:

  return v7;
}

- (void)_saveKeyIVData:(id)a3 andTagData:(id)a4
{
  v25[0] = kSecAttrAccount;
  v25[1] = kSecAttrService;
  v26[0] = @"com.apple.wifi.analytics.persistence-iv";
  v26[1] = @"WiFiAnalytics";
  v25[2] = kSecAttrAccessGroup;
  v25[3] = kSecAttrAccessible;
  id v26[2] = @"apple";
  v26[3] = kSecAttrAccessibleAlways;
  v25[4] = kSecClass;
  v26[4] = kSecClassGenericPassword;
  id v16 = a4;
  id v5 = a3;
  CFDictionaryRef v6 = +[NSDictionary dictionaryWithObjects:v26 forKeys:v25 count:5];
  CFDictionaryRef v7 = (const __CFDictionary *)[v6 mutableCopy];

  v23[0] = kSecAttrAccount;
  v23[1] = kSecAttrService;
  v24[0] = @"com.apple.wifi.analytics.persistence-tag";
  v24[1] = @"WiFiAnalytics";
  v23[2] = kSecAttrAccessGroup;
  v23[3] = kSecAttrAccessible;
  v24[2] = @"apple";
  v24[3] = kSecAttrAccessibleAlways;
  void v23[4] = kSecClass;
  void v24[4] = kSecClassGenericPassword;
  OSStatus v8 = +[NSDictionary dictionaryWithObjects:v24 forKeys:v23 count:5];
  CFDictionaryRef v9 = (const __CFDictionary *)[v8 mutableCopy];

  SecItemDelete(v7);
  SecItemDelete(v9);
  [(__CFDictionary *)v7 setObject:v5 forKeyedSubscript:kSecValueData];

  [(__CFDictionary *)v9 setObject:v16 forKeyedSubscript:kSecValueData];
  OSStatus v10 = SecItemAdd(v7, 0);
  if (v10)
  {
    OSStatus v12 = v10;
    __int16 v13 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      __int16 v18 = "-[WAEngine _saveKeyIVData:andTagData:]";
      __int16 v19 = 1024;
      int v20 = 1750;
      __int16 v21 = 1024;
      OSStatus v22 = v12;
      uint32_t v14 = "%{public}s::%d:Error back from SecItemUpdate()/SecItemAdd(): %d for IV data";
LABEL_8:
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, v14, buf, 0x18u);
    }
LABEL_9:

    goto LABEL_3;
  }
  OSStatus v11 = SecItemAdd(v9, 0);
  if (v11)
  {
    OSStatus v15 = v11;
    __int16 v13 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      __int16 v18 = "-[WAEngine _saveKeyIVData:andTagData:]";
      __int16 v19 = 1024;
      int v20 = 1753;
      __int16 v21 = 1024;
      OSStatus v22 = v15;
      uint32_t v14 = "%{public}s::%d:Error back from SecItemUpdate()/SecItemAdd(): %d for Tag data";
      goto LABEL_8;
    }
    goto LABEL_9;
  }
LABEL_3:
}

- (id)_getDataFromKeychain:(id)a3
{
  id v3 = a3;
  CFTypeRef result = 0;
  v21[0] = kSecAttrAccount;
  v21[1] = kSecAttrService;
  v22[0] = v3;
  v22[1] = @"WiFiAnalytics";
  id v21[2] = kSecAttrAccessGroup;
  v21[3] = kSecReturnData;
  v22[2] = @"apple";
  v22[3] = &__kCFBooleanTrue;
  v21[4] = kSecClass;
  v22[4] = kSecClassGenericPassword;
  OSStatus v4 = +[NSDictionary dictionaryWithObjects:v22 forKeys:v21 count:5];
  CFDictionaryRef v5 = (const __CFDictionary *)[v4 mutableCopy];

  OSStatus v6 = SecItemCopyMatching(v5, &result);
  if (v6)
  {
    OSStatus v9 = v6;
    OSStatus v10 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      id v16 = "-[WAEngine _getDataFromKeychain:]";
      __int16 v17 = 1024;
      int v18 = 1773;
      __int16 v19 = 1024;
      LODWORD(v20[0]) = v9;
      WORD2(v20[0]) = 2080;
      *(void *)((char *)v20 + 6) = "-[WAEngine _getDataFromKeychain:]";
      OSStatus v11 = "%{public}s::%d:Error back from SecItemCopyMatching(): %d in %s";
      OSStatus v12 = v10;
      uint32_t v13 = 34;
LABEL_10:
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, v11, buf, v13);
    }
  }
  else
  {
    CFDictionaryRef v7 = (void *)result;
    if (result) {
      goto LABEL_3;
    }
    OSStatus v10 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      id v16 = "-[WAEngine _getDataFromKeychain:]";
      __int16 v17 = 1024;
      int v18 = 1774;
      __int16 v19 = 2112;
      v20[0] = v3;
      OSStatus v11 = "%{public}s::%d:Keychain didn't return any key data for %@";
      OSStatus v12 = v10;
      uint32_t v13 = 28;
      goto LABEL_10;
    }
  }

  CFDictionaryRef v7 = 0;
LABEL_3:

  return v7;
}

- (void)_persist
{
  id v3 = WALogCategoryDefaultHandle();
  if (os_signpost_enabled(v3))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v3, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "WAEngine Persist", "", buf, 2u);
  }

  OSStatus v4 = (void *)os_transaction_create();
  CFDictionaryRef v5 = &OBJC_IVAR___RecommendationPreferences__work_report_seconds;
  OSStatus v6 = +[WAActivityManager sharedActivityManager];
  [v6 osTransactionCreate:"com.apple.wifianalytics.persist" transaction:v4];

  id v7 = v4;
  OSStatus v8 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    uint64_t description = os_transaction_get_description();
    *(_DWORD *)buf = 136446722;
    v175 = "-[WAEngine _persist]";
    __int16 v176 = 1024;
    int v177 = 1785;
    __int16 v178 = 2080;
    v179 = (const char *)description;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "%{public}s::%d:Started transaction %s", buf, 0x1Cu);
  }

  char v173 = 0;
  if (self->_readingPersistFile || self->_writingPersistFile)
  {
    OSStatus v10 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      CFStringRef v11 = @"reading";
      BOOL readingPersistFile = self->_readingPersistFile;
      v175 = "-[WAEngine _persist]";
      *(_DWORD *)buf = 136446722;
      if (!readingPersistFile) {
        CFStringRef v11 = @"writing";
      }
      __int16 v176 = 1024;
      int v177 = 1791;
      __int16 v178 = 2112;
      v179 = (const char *)v11;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "%{public}s::%d:Cannot persist, we're currenlty %@ the persistence file", buf, 0x1Cu);
    }

LABEL_12:
    uint32_t v13 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v14 = os_transaction_get_description();
      *(_DWORD *)buf = 136446722;
      v175 = "-[WAEngine _persist]";
      __int16 v176 = 1024;
      int v177 = 2013;
      __int16 v178 = 2080;
      v179 = (const char *)v14;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "%{public}s::%d:Ending transaction %s", buf, 0x1Cu);
    }

    OSStatus v15 = [v5 + 490 sharedActivityManager];
    [v15 osTransactionComplete:v7];

    id v16 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v175 = "-[WAEngine _persist]";
      __int16 v176 = 1024;
      int v177 = 2015;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "%{public}s::%d:Failed to persist!", buf, 0x12u);
    }

    __int16 v17 = WALogCategoryDefaultHandle();
    if (os_signpost_enabled(v17))
    {
      *(_WORD *)buf = 0;
      int v18 = "Failed";
LABEL_18:
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v17, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "WAEngine Persist", v18, buf, 2u);
      goto LABEL_19;
    }
    goto LABEL_19;
  }
  +[WAUtil incrementValueForKey:@"Persist Calls" inMutableDict:self->_cachedUsage onQueue:self->_engineQ];
  [(NSMutableDictionary *)self->_cachedUsage removeObjectForKey:@"Last Persisted Date"];
  cachedUsage = self->_cachedUsage;
  int v20 = +[NSDate date];
  [(NSMutableDictionary *)cachedUsage setObject:v20 forKey:@"Last Persisted Date"];

  [(NSMutableDictionary *)self->_cachedUsage removeObjectForKey:@"Last Persisted PID"];
  __int16 v21 = self->_cachedUsage;
  OSStatus v22 = +[NSNumber numberWithUnsignedLong:self->_pid];
  [(NSMutableDictionary *)v21 setObject:v22 forKey:@"Last Persisted PID"];

  [(WAEngine *)self _calculateEstimatedUptime];
  [(WAEngine *)self _calculateProfileUptime];
  [(WAEngine *)self _calculateProcessUsage];
  __int16 v23 = +[NSFileManager defaultManager];
  unsigned int v24 = NSHomeDirectory();
  __int16 v25 = +[NSString stringWithFormat:@"%@%@t.out", v24, @"/Library/com.apple.wifianalyticsd/.wa/"];
  unsigned __int8 v26 = [v23 fileExistsAtPath:v25];

  if ((v26 & 1) == 0)
  {
    __int16 v27 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v28 = NSHomeDirectory();
      __int16 v29 = +[NSString stringWithFormat:@"%@%@t.out", v28, @"/Library/com.apple.wifianalyticsd/.wa/"];
      *(_DWORD *)buf = 136446722;
      v175 = "-[WAEngine _persist]";
      __int16 v176 = 1024;
      int v177 = 1806;
      __int16 v178 = 2112;
      v179 = v29;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Persistence file doesnt yet exist %@", buf, 0x1Cu);
    }
    [(NSMutableDictionary *)self->_cachedUsage removeObjectForKey:@"Persist file creation Date"];
    int64_t v30 = self->_cachedUsage;
    __int16 v31 = +[NSDate date];
    [(NSMutableDictionary *)v30 setObject:v31 forKey:@"Persist file creation Date"];
  }
  CFStringRef v32 = +[NSFileManager defaultManager];
  id v33 = NSHomeDirectory();
  int v34 = +[NSString stringWithFormat:@"%@%@", v33, @"/Library/com.apple.wifianalyticsd/.wa/"];
  unsigned __int8 v35 = [v32 fileExistsAtPath:v34 isDirectory:&v173];

  if (v35)
  {
    CFStringRef v36 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136446466;
      v175 = "-[WAEngine _persist]";
      __int16 v176 = 1024;
      int v177 = 1820;
      _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEBUG, "%{public}s::%d:Directory for persistence exists...", buf, 0x12u);
    }
    id v37 = 0;
  }
  else
  {
    unsigned int v38 = +[NSFileManager defaultManager];
    __int16 v39 = NSHomeDirectory();
    int v40 = +[NSString stringWithFormat:@"%@%@", v39, @"/Library/com.apple.wifianalyticsd/.wa/"];
    id v172 = 0;
    unsigned __int8 v41 = [v38 createDirectoryAtPath:v40 withIntermediateDirectories:1 attributes:0 error:&v172];
    id v37 = v172;

    id v42 = WALogCategoryDefaultHandle();
    CFStringRef v36 = v42;
    if (v41)
    {
      if (!os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_34;
      }
      *(_DWORD *)buf = 136446466;
      v175 = "-[WAEngine _persist]";
      __int16 v176 = 1024;
      int v177 = 1816;
      __int16 v43 = "%{public}s::%d:Directory for persistence created...";
      unsigned int v44 = v36;
      os_log_type_t v45 = OS_LOG_TYPE_DEBUG;
    }
    else
    {
      if (!os_log_type_enabled(v42, OS_LOG_TYPE_ERROR)) {
        goto LABEL_34;
      }
      *(_DWORD *)buf = 136446466;
      v175 = "-[WAEngine _persist]";
      __int16 v176 = 1024;
      int v177 = 1814;
      __int16 v43 = "%{public}s::%d:Failed to create directory for persistence file";
      unsigned int v44 = v36;
      os_log_type_t v45 = OS_LOG_TYPE_ERROR;
    }
    _os_log_impl((void *)&_mh_execute_header, v44, v45, v43, buf, 0x12u);
  }
LABEL_34:

  CFStringRef v46 = +[NSMutableDictionary dictionary];
  v47 = [(WAEngine *)self cachedUsage];
  id v171 = v37;
  id v48 = +[NSKeyedArchiver archivedDataWithRootObject:v47 requiringSecureCoding:1 error:&v171];
  v49 = (char *)v171;

  if (v49)
  {
    id v50 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      v175 = "-[WAEngine _persist]";
      __int16 v176 = 1024;
      int v177 = 1829;
      __int16 v178 = 2112;
      v179 = v49;
      _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_ERROR, "%{public}s::%d:Failed to archive cachedUsage: %@", buf, 0x1Cu);
    }
  }
  if (v48)
  {
    v51 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v51, OS_LOG_TYPE_DEBUG))
    {
      __int16 v52 = (const char *)[v48 length];
      *(_DWORD *)buf = 136446722;
      v175 = "-[WAEngine _persist]";
      __int16 v176 = 1024;
      int v177 = 1833;
      __int16 v178 = 2048;
      v179 = v52;
      _os_log_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_DEBUG, "%{public}s::%d:cachedUsage archive size %lu", buf, 0x1Cu);
    }

    [v46 setObject:v48 forKey:@"WA_PERSIST_USAGE"];
  }
  v156 = v48;
  int v53 = [(WAEngine *)self messageStore];
  id v170 = 0;
  __int16 v54 = +[NSKeyedArchiver archivedDataWithRootObject:v53 requiringSecureCoding:1 error:&v170];
  id v55 = (char *)v170;

  if (v55)
  {
    __int16 v56 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      v175 = "-[WAEngine _persist]";
      __int16 v176 = 1024;
      int v177 = 1840;
      __int16 v178 = 2112;
      v179 = v55;
      _os_log_impl((void *)&_mh_execute_header, v56, OS_LOG_TYPE_ERROR, "%{public}s::%d:Failed to archive WAMessageStore: %@", buf, 0x1Cu);
    }
  }
  if (v54)
  {
    unsigned int v57 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v57, OS_LOG_TYPE_DEBUG))
    {
      __int16 v58 = (const char *)[v54 length];
      *(_DWORD *)buf = 136446722;
      v175 = "-[WAEngine _persist]";
      __int16 v176 = 1024;
      int v177 = 1845;
      __int16 v178 = 2048;
      v179 = v58;
      _os_log_impl((void *)&_mh_execute_header, v57, OS_LOG_TYPE_DEBUG, "%{public}s::%d:messageStoreData size: %lu", buf, 0x1Cu);
    }

    [v46 setObject:v54 forKey:@"WA_PERSIST_MESSAGE_STORE"];
  }
  unsigned int v59 = [(WAEngine *)self processTokenToGroupTypeMap];
  id v169 = 0;
  uint64_t v60 = +[NSKeyedArchiver archivedDataWithRootObject:v59 requiringSecureCoding:1 error:&v169];
  unsigned int v61 = (char *)v169;

  if (v61)
  {
    v62 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      v175 = "-[WAEngine _persist]";
      __int16 v176 = 1024;
      int v177 = 1852;
      __int16 v178 = 2112;
      v179 = v61;
      _os_log_impl((void *)&_mh_execute_header, v62, OS_LOG_TYPE_ERROR, "%{public}s::%d:Failed to archive process registration: %@", buf, 0x1Cu);
    }
  }
  if (v60) {
    [v46 setObject:v60 forKey:@"WA_PERSIST_PROCESS_REGISTRATION"];
  }
  uint64_t v63 = [(WAEngine *)self iorMessagePopulator];
  id v168 = 0;
  v64 = +[NSKeyedArchiver archivedDataWithRootObject:v63 requiringSecureCoding:1 error:&v168];
  uint64_t v65 = (char *)v168;

  if (v65)
  {
    v66 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      v175 = "-[WAEngine _persist]";
      __int16 v176 = 1024;
      int v177 = 1862;
      __int16 v178 = 2112;
      v179 = v65;
      _os_log_impl((void *)&_mh_execute_header, v66, OS_LOG_TYPE_ERROR, "%{public}s::%d:Failed to archive WAIOReporterPopuator: %@", buf, 0x1Cu);
    }
  }
  if (v64)
  {
    uint64_t v67 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v67, OS_LOG_TYPE_DEBUG))
    {
      v68 = (const char *)[v64 length];
      *(_DWORD *)buf = 136446722;
      v175 = "-[WAEngine _persist]";
      __int16 v176 = 1024;
      int v177 = 1866;
      __int16 v178 = 2048;
      v179 = v68;
      _os_log_impl((void *)&_mh_execute_header, v67, OS_LOG_TYPE_DEBUG, "%{public}s::%d:WAIOReporterPopuator archive size %lu", buf, 0x1Cu);
    }

    [v46 setObject:v64 forKey:@"WA_PERSIST_IOREPORTER_REGISTRATIONS"];
  }
  v155 = v54;
  uint64_t v69 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v69, OS_LOG_TYPE_DEFAULT))
  {
    v70 = [(WAEngine *)self recommendationEngine];
    v71 = [v70 dpsWDBudgetDict];
    *(_DWORD *)buf = 136446722;
    v175 = "-[WAEngine _persist]";
    __int16 v176 = 1024;
    int v177 = 1871;
    __int16 v178 = 2112;
    v179 = v71;
    _os_log_impl((void *)&_mh_execute_header, v69, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:self.recommendationEngine.dpsWDBudgetDict %@", buf, 0x1Cu);
  }
  dispatch_queue_t v72 = [(WAEngine *)self recommendationEngine];
  v73 = [v72 dpsWDBudgetDict];
  id v167 = 0;
  v159 = +[NSKeyedArchiver archivedDataWithRootObject:v73 requiringSecureCoding:1 error:&v167];
  uint64_t v74 = (char *)v167;

  if (v74)
  {
    v75 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v75, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      v175 = "-[WAEngine _persist]";
      __int16 v176 = 1024;
      int v177 = 1874;
      __int16 v178 = 2112;
      v179 = v74;
      _os_log_impl((void *)&_mh_execute_header, v75, OS_LOG_TYPE_ERROR, "%{public}s::%d:Failed to archive dpsWDBudgetData: %@", buf, 0x1Cu);
    }
  }
  if (v159) {
    [v46 setObject:v159 forKey:@"WA_PERSIST_DPS_WD_BUDGET"];
  }
  appleCaptiveServerIP = self->_appleCaptiveServerIP;
  if (appleCaptiveServerIP)
  {
    id v166 = 0;
    uint64_t v77 = +[NSKeyedArchiver archivedDataWithRootObject:appleCaptiveServerIP requiringSecureCoding:1 error:&v166];
    v78 = (char *)v166;
    uint64_t v79 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v79, OS_LOG_TYPE_DEFAULT))
    {
      v80 = self->_appleCaptiveServerIP;
      *(_DWORD *)buf = 136446722;
      v175 = "-[WAEngine _persist]";
      __int16 v176 = 1024;
      int v177 = 1883;
      __int16 v178 = 2112;
      v179 = (const char *)v80;
      _os_log_impl((void *)&_mh_execute_header, v79, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:dps/dns: persisting self->_appleCaptiveServerIP %@", buf, 0x1Cu);
    }

    if (v78)
    {
      uint64_t v81 = WALogCategoryDefaultHandle();
      if (os_log_type_enabled(v81, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446722;
        v175 = "-[WAEngine _persist]";
        __int16 v176 = 1024;
        int v177 = 1885;
        __int16 v178 = 2112;
        v179 = v78;
        _os_log_impl((void *)&_mh_execute_header, v81, OS_LOG_TYPE_ERROR, "%{public}s::%d:dps/dns: Failed to archive dnsPersistenceData: %@", buf, 0x1Cu);
      }
    }
    if (v77) {
      [v46 setObject:v77 forKey:@"WA_PERSIST_DNS_PERSISTDATA"];
    }
  }
  v82 = [(WAEngine *)self dpsQuickRecoveryEngine];

  v153 = v64;
  v154 = (void *)v60;
  if (v82)
  {
    v83 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v83, OS_LOG_TYPE_DEFAULT))
    {
      v84 = [(WAEngine *)self dpsQuickRecoveryEngine];
      v85 = [v84 dpsQuickRecoveryWDBudgetDict];
      *(_DWORD *)buf = 136446722;
      v175 = "-[WAEngine _persist]";
      __int16 v176 = 1024;
      int v177 = 1894;
      __int16 v178 = 2112;
      v179 = v85;
      _os_log_impl((void *)&_mh_execute_header, v83, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:self.dpsQuickRecoveryEngine.dpsQuickRecoveryWDBudgetDict %@", buf, 0x1Cu);
    }
    uint64_t v86 = [(WAEngine *)self dpsQuickRecoveryEngine];
    v87 = [v86 dpsQuickRecoveryWDBudgetDict];
    id v165 = 0;
    uint64_t v88 = +[NSKeyedArchiver archivedDataWithRootObject:v87 requiringSecureCoding:1 error:&v165];
    v89 = (char *)v165;

    if (v89)
    {
      uint64_t v90 = WALogCategoryDefaultHandle();
      if (os_log_type_enabled(v90, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446722;
        v175 = "-[WAEngine _persist]";
        __int16 v176 = 1024;
        int v177 = 1897;
        __int16 v178 = 2112;
        v179 = v89;
        _os_log_impl((void *)&_mh_execute_header, v90, OS_LOG_TYPE_ERROR, "%{public}s::%d:Failed to archive dpsQuickRecoveryWDBudgetDict: %@", buf, 0x1Cu);
      }
    }
    if (v88) {
      [v46 setObject:v88 forKey:@"WA_PERSIST_DPS_QUICK_RECOVERY_WD_BUDGET"];
    }
    v91 = v46;
    v92 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v92, OS_LOG_TYPE_DEFAULT))
    {
      int v93 = [(WAEngine *)self dpsQuickRecoveryEngine];
      v94 = [v93 dpsStats];
      *(_DWORD *)buf = 136446722;
      v175 = "-[WAEngine _persist]";
      __int16 v176 = 1024;
      int v177 = 1905;
      __int16 v178 = 2112;
      v179 = v94;
      _os_log_impl((void *)&_mh_execute_header, v92, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:self.dpsQuickRecoveryEngine.dpsStats %@", buf, 0x1Cu);
    }
    v95 = [(WAEngine *)self dpsQuickRecoveryEngine];
    v96 = [v95 dpsStats];
    id v164 = 0;
    v97 = +[NSKeyedArchiver archivedDataWithRootObject:v96 requiringSecureCoding:1 error:&v164];
    v98 = (char *)v164;

    CFStringRef v46 = v91;
    if (v98)
    {
      v99 = WALogCategoryDefaultHandle();
      if (os_log_type_enabled(v99, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446722;
        v175 = "-[WAEngine _persist]";
        __int16 v176 = 1024;
        int v177 = 1908;
        __int16 v178 = 2112;
        v179 = v98;
        _os_log_impl((void *)&_mh_execute_header, v99, OS_LOG_TYPE_ERROR, "%{public}s::%d:Failed to archive dpsStats: %@", buf, 0x1Cu);
      }
    }
    if (v97) {
      [v91 setObject:v97 forKey:@"WA_PERSIST_DPS_QUICK_RECOVERY_STATS"];
    }
  }
  if (self->_infraInterfaceName
    && ([(WAEngine *)self infraInterfaceName],
        v100 = objc_claimAutoreleasedReturnValue(),
        unsigned int v101 = [v100 isEqualToString:@"dunno"],
        v100,
        v101))
  {
    v102 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v102, OS_LOG_TYPE_DEBUG))
    {
      v103 = [(WAEngine *)self infraInterfaceName];
      *(_DWORD *)buf = 136446722;
      v175 = "-[WAEngine _persist]";
      __int16 v176 = 1024;
      int v177 = 1918;
      __int16 v178 = 2112;
      v179 = v103;
      _os_log_impl((void *)&_mh_execute_header, v102, OS_LOG_TYPE_DEBUG, "%{public}s::%d:self.infrainterfacename %@", buf, 0x1Cu);
    }
    uint64_t v104 = [(WAEngine *)self infraInterfaceName];
    id v163 = 0;
    v105 = +[NSKeyedArchiver archivedDataWithRootObject:v104 requiringSecureCoding:1 error:&v163];
    v106 = (char *)v163;

    if (v106)
    {
      v107 = WALogCategoryDefaultHandle();
      if (os_log_type_enabled(v107, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446722;
        v175 = "-[WAEngine _persist]";
        __int16 v176 = 1024;
        int v177 = 1921;
        __int16 v178 = 2112;
        v179 = v106;
        _os_log_impl((void *)&_mh_execute_header, v107, OS_LOG_TYPE_ERROR, "%{public}s::%d:Failed to archive infraInterfaceName: %@", buf, 0x1Cu);
      }
    }
    if (v105) {
      [v46 setObject:v105 forKey:@"WA_PERSIST_INFRA_INTERFACE"];
    }
  }
  else
  {
    v105 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v105, OS_LOG_TYPE_DEFAULT))
    {
      objc_super v108 = [(WAEngine *)self infraInterfaceName];
      *(_DWORD *)buf = 136446722;
      v175 = "-[WAEngine _persist]";
      __int16 v176 = 1024;
      int v177 = 1928;
      __int16 v178 = 2112;
      v179 = v108;
      _os_log_impl((void *)&_mh_execute_header, v105, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:self.infrainterfacename is %@, not persisting", buf, 0x1Cu);
    }
  }

  v109 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v109, OS_LOG_TYPE_DEBUG))
  {
    v110 = [(WAEngine *)self wifiChipSet];
    *(_DWORD *)buf = 136446722;
    v175 = "-[WAEngine _persist]";
    __int16 v176 = 1024;
    int v177 = 1932;
    __int16 v178 = 2112;
    v179 = v110;
    _os_log_impl((void *)&_mh_execute_header, v109, OS_LOG_TYPE_DEBUG, "%{public}s::%d:self.wifiChipSet %@", buf, 0x1Cu);
  }
  __int16 v111 = [(WAEngine *)self wifiChipSet];
  id v162 = 0;
  uint64_t v112 = +[NSKeyedArchiver archivedDataWithRootObject:v111 requiringSecureCoding:1 error:&v162];
  __int16 v113 = (char *)v162;

  if (v113)
  {
    int v114 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v114, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      v175 = "-[WAEngine _persist]";
      __int16 v176 = 1024;
      int v177 = 1935;
      __int16 v178 = 2112;
      v179 = v113;
      _os_log_impl((void *)&_mh_execute_header, v114, OS_LOG_TYPE_ERROR, "%{public}s::%d:Failed to archive wifiChipSet: %@", buf, 0x1Cu);
    }
  }
  if (v112) {
    [v46 setObject:v112 forKey:@"WA_PERSIST_CHIPSET"];
  }
  id v115 = [[objc_alloc((Class)NSString) initWithFormat:@"%s%s%s", "WiFiAnalytics_executables-680.21", "\"WiFiAnalytics_executables-680.21\", "Nov 14 2024 22:56:58""];
  [v46 setObject:v115 forKey:@"WA_BUILD_VERSION_PERSIST_KEY"];

  id v161 = 0;
  v157 = v46;
  v116 = +[NSKeyedArchiver archivedDataWithRootObject:v46 requiringSecureCoding:1 error:&v161];
  v117 = (char *)v161;
  if (v117)
  {
    v118 = v117;
    v119 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v119, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      v175 = "-[WAEngine _persist]";
      __int16 v176 = 1024;
      int v177 = 1947;
      __int16 v178 = 2112;
      v179 = v118;
      _os_log_impl((void *)&_mh_execute_header, v119, OS_LOG_TYPE_ERROR, "%{public}s::%d:Failed to archive root persistence dictionary: %@", buf, 0x1Cu);
    }
  }
  v120 = [(WAEngine *)self _rotateObscureKey];
  memset(key, 0, sizeof(key));
  char v185 = 0;
  [v120 getCString:key maxLength:33 encoding:4];
  id v121 = [v116 length];
  id dataOutMoved = 0;
  v122 = malloc_type_malloc((size_t)v121 + 16, 0x61F94CF2uLL);
  v152 = (void *)v112;
  if (!v122)
  {
    v149 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v149, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v175 = "-[WAEngine _persist]";
      __int16 v176 = 1024;
      int v177 = 1965;
      _os_log_impl((void *)&_mh_execute_header, v149, OS_LOG_TYPE_ERROR, "%{public}s::%d:malloc failed during persistence", buf, 0x12u);
    }

    goto LABEL_152;
  }
  dataOut = v122;
  if (CCRandomGenerateBytes(bytes, 0xCuLL))
  {
    v150 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v150, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      v175 = "-[WAEngine _persist]";
      __int16 v176 = 1024;
      int v177 = 1970;
      __int16 v178 = 2080;
      v179 = "-[WAEngine _persist]";
      _os_log_impl((void *)&_mh_execute_header, v150, OS_LOG_TYPE_ERROR, "%{public}s::%d:CCRandomGenerateBytes failed in %s", buf, 0x1Cu);
    }

    free(dataOut);
LABEL_152:
    v129 = v156;
    v130 = v153;
LABEL_153:

    goto LABEL_12;
  }
  v151 = v120;
  id v124 = v116;
  [v124 bytes];
  int v125 = CCCryptorGCMOneshotEncrypt();
  if (v125)
  {
    int v126 = v125;
    v127 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v127, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      v175 = "-[WAEngine _persist]";
      __int16 v176 = 1024;
      int v177 = 1985;
      __int16 v178 = 2080;
      v179 = "-[WAEngine _persist]";
      __int16 v180 = 1024;
      int v181 = v126;
      _os_log_impl((void *)&_mh_execute_header, v127, OS_LOG_TYPE_ERROR, "%{public}s::%d:%s: CCCryptorGCMOneshotEncrypt failed with error %d", buf, 0x22u);
    }

    CFDictionaryRef v5 = &OBJC_IVAR___RecommendationPreferences__work_report_seconds;
    if (CCCrypt(0, 0, 1u, key, 0x20uLL, 0, objc_msgSend(v124, "bytes", v121, dataOut, v182, 16), (size_t)v121, dataOut, (size_t)v121 + 16, (size_t *)&dataOutMoved))
    {
      v128 = WALogCategoryDefaultHandle();
      if (os_log_type_enabled(v128, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446466;
        v175 = "-[WAEngine _persist]";
        __int16 v176 = 1024;
        int v177 = 1990;
        _os_log_impl((void *)&_mh_execute_header, v128, OS_LOG_TYPE_ERROR, "%{public}s::%d:Failed to obscure file", buf, 0x12u);
      }

      free(dataOut);
      v129 = v156;
      v130 = v153;
      v120 = v151;
      goto LABEL_153;
    }
  }
  else
  {
    v131 = +[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", bytes, 12, v121, dataOut, v182, 16);
    v132 = +[NSData dataWithBytes:v182 length:16];
    v133 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v133, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446722;
      v175 = "-[WAEngine _persist]";
      __int16 v176 = 1024;
      int v177 = 1978;
      __int16 v178 = 2080;
      v179 = "-[WAEngine _persist]";
      _os_log_impl((void *)&_mh_execute_header, v133, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:%s: writing IV and tag data", buf, 0x1Cu);
    }

    [(WAEngine *)self _saveKeyIVData:v131 andTagData:v132];
    id dataOutMoved = v121;
  }
  id v134 = objc_alloc((Class)NSData);
  id v135 = [v134 initWithBytes:dataOut length:dataOutMoved];
  free(dataOut);
  self->_writingPersistFile = 1;
  v136 = NSHomeDirectory();
  v137 = +[NSString stringWithFormat:@"%@%@t.out", v136, @"/Library/com.apple.wifianalyticsd/.wa/"];
  unsigned __int8 v138 = [v135 writeToFile:v137 atomically:1];

  v139 = WALogCategoryDefaultHandle();
  v140 = v139;
  if (v138)
  {
    if (!os_log_type_enabled(v139, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_142;
    }
    v141 = NSHomeDirectory();
    v142 = +[NSString stringWithFormat:@"%@%@t.out", v141, @"/Library/com.apple.wifianalyticsd/.wa/"];
    *(_DWORD *)buf = 136446722;
    v175 = "-[WAEngine _persist]";
    __int16 v176 = 1024;
    int v177 = 2001;
    __int16 v178 = 2112;
    v179 = v142;
    v143 = "%{public}s::%d:Wrote persistence file %@";
    v144 = v140;
    os_log_type_t v145 = OS_LOG_TYPE_DEFAULT;
  }
  else
  {
    if (!os_log_type_enabled(v139, OS_LOG_TYPE_ERROR)) {
      goto LABEL_142;
    }
    v141 = NSHomeDirectory();
    v142 = +[NSString stringWithFormat:@"%@%@t.out", v141, @"/Library/com.apple.wifianalyticsd/.wa/"];
    *(_DWORD *)buf = 136446722;
    v175 = "-[WAEngine _persist]";
    __int16 v176 = 1024;
    int v177 = 1999;
    __int16 v178 = 2112;
    v179 = v142;
    v143 = "%{public}s::%d:Failed to write persistence file %@";
    v144 = v140;
    os_log_type_t v145 = OS_LOG_TYPE_ERROR;
  }
  _os_log_impl((void *)&_mh_execute_header, v144, v145, v143, buf, 0x1Cu);

LABEL_142:
  self->_writingPersistFile = 0;

  v146 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v146, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v147 = os_transaction_get_description();
    *(_DWORD *)buf = 136446722;
    v175 = "-[WAEngine _persist]";
    __int16 v176 = 1024;
    int v177 = 2006;
    __int16 v178 = 2080;
    v179 = (const char *)v147;
    _os_log_impl((void *)&_mh_execute_header, v146, OS_LOG_TYPE_DEBUG, "%{public}s::%d:Ending transaction %s", buf, 0x1Cu);
  }

  v148 = [v5 + 490 sharedActivityManager];
  [v148 osTransactionComplete:v7];

  __int16 v17 = WALogCategoryDefaultHandle();
  if (os_signpost_enabled(v17))
  {
    *(_WORD *)buf = 0;
    int v18 = "";
    goto LABEL_18;
  }
LABEL_19:
}

- (void)_unpersist
{
  id v3 = WALogCategoryDefaultHandle();
  if (os_signpost_enabled(v3))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v3, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "WAEngine Unpersist", "", buf, 2u);
  }

  OSStatus v4 = (void *)os_transaction_create();
  CFDictionaryRef v5 = +[WAActivityManager sharedActivityManager];
  [v5 osTransactionCreate:"com.apple.wifianalytics.unpersist" transaction:v4];

  id v6 = v4;
  id v7 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    uint64_t description = os_transaction_get_description();
    *(_DWORD *)buf = 136446722;
    *(void *)&uint8_t buf[4] = "-[WAEngine _unpersist]";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 2023;
    __int16 v252 = 2080;
    v253 = (const char *)description;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "%{public}s::%d:Started transaction %s", buf, 0x1Cu);
  }
  v210 = v6;

  size_t v248 = 0;
  v226 = [(WAEngine *)self _getObscureKey];
  self->_BOOL readingPersistFile = 1;
  OSStatus v10 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v11 = NSHomeDirectory();
    OSStatus v12 = +[NSString stringWithFormat:@"%@%@t.out", v11, @"/Library/com.apple.wifianalyticsd/.wa/"];
    *(_DWORD *)buf = 136446722;
    *(void *)&uint8_t buf[4] = "-[WAEngine _unpersist]";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 2054;
    __int16 v252 = 2112;
    v253 = v12;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Reading persistence file %@", buf, 0x1Cu);
  }
  uint32_t v13 = NSHomeDirectory();
  uint64_t v14 = +[NSString stringWithFormat:@"%@%@t.out", v13, @"/Library/com.apple.wifianalyticsd/.wa/"];
  id v247 = 0;
  OSStatus v15 = +[NSData dataWithContentsOfFile:v14 options:1 error:&v247];
  id v16 = (char *)v247;

  __int16 v17 = v15;
  id v18 = [v15 length];
  char v259 = 0;
  __int16 v19 = &AnalyticsSendEventLazy_ptr;
  memset(key, 0, sizeof(key));
  if (!v15)
  {
    self->_persistFileExistedAtPIDLoad = 0;
    int64_t v30 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446722;
      *(void *)&uint8_t buf[4] = "-[WAEngine _unpersist]";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 2068;
      __int16 v252 = 2112;
      v253 = v16;
      _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:No persistence file, likely first run after boot (err:%@)", buf, 0x1Cu);
    }

    int v20 = v226;
    goto LABEL_16;
  }
  self->_persistFileExistedAtPIDLoad = 1;
  int v20 = v226;
  if (!v226)
  {
    v197 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v197, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      *(void *)&uint8_t buf[4] = "-[WAEngine _unpersist]";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 2069;
      _os_log_impl((void *)&_mh_execute_header, v197, OS_LOG_TYPE_ERROR, "%{public}s::%d:Couldn't get key to unobscure persistence file...", buf, 0x12u);
    }

    [(WAEngine *)self _removePersistenceFile];
    goto LABEL_16;
  }
  size_t v21 = (size_t)v18;
  v222 = v9;
  size_t v22 = (size_t)v18 + 16;
  [v226 getCString:key maxLength:33 encoding:4];
  v224 = malloc_type_malloc(v22, 0xC20AA7E1uLL);
  if (!v224)
  {
    v198 = WALogCategoryDefaultHandle();
    OSStatus v9 = v222;
    if (os_log_type_enabled(v198, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      *(void *)&uint8_t buf[4] = "-[WAEngine _unpersist]";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 2073;
      _os_log_impl((void *)&_mh_execute_header, v198, OS_LOG_TYPE_ERROR, "%{public}s::%d:Couldn't allocate buffer to unobscure persistence data", buf, 0x12u);
    }

LABEL_16:
    __int16 v31 = 0;
    v206 = 0;
    v207 = 0;
    goto LABEL_38;
  }
  __int16 v23 = [(WAEngine *)self _getDataFromKeychain:@"com.apple.wifi.analytics.persistence-iv"];
  uint64_t v24 = [(WAEngine *)self _getDataFromKeychain:@"com.apple.wifi.analytics.persistence-tag"];
  v216 = v23;
  v220 = (void *)v24;
  if (v23 && v24)
  {
    __int16 v25 = (void *)v24;
    unsigned __int8 v26 = [v23 bytes];
    int v27 = v26[2];
    uint64_t v256 = *(void *)v26;
    int v257 = v27;
    *(_OWORD *)buf = *(_OWORD *)[v25 bytes];
    [v17 bytes];
    v203 = buf;
    uint64_t v205 = 16;
    uint64_t v28 = v224;
    dataOut = (void *)v21;
    size_t dataOutAvailable = (size_t)v224;
    int v29 = CCCryptorGCMOneshotDecrypt();
    size_t v248 = v21;
  }
  else
  {
    CFStringRef v32 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446722;
      *(void *)&uint8_t buf[4] = "-[WAEngine _unpersist]";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 2091;
      __int16 v252 = 2080;
      v253 = "-[WAEngine _unpersist]";
      _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:%s: IV and tag not found", buf, 0x1Cu);
    }

    size_t dataOutAvailablea = v22;
    uint64_t v28 = v224;
    int v29 = CCCrypt(1u, 0, 1u, key, 0x20uLL, 0, [v17 bytes], v21, v224, dataOutAvailablea, &v248);
  }
  self->_BOOL readingPersistFile = 0;
  if (v29)
  {
    v199 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v199, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      *(void *)&uint8_t buf[4] = "-[WAEngine _unpersist]";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 2098;
      __int16 v252 = 2080;
      v253 = "-[WAEngine _unpersist]";
      __int16 v254 = 1024;
      int v255 = v29;
      _os_log_impl((void *)&_mh_execute_header, v199, OS_LOG_TYPE_ERROR, "%{public}s::%d:%s: Failed to unobscure: %d", buf, 0x22u);
    }

    free(v28);
    v218 = 0;
    v206 = 0;
    v207 = 0;
    __int16 v31 = 0;
    OSStatus v9 = v222;
  }
  else
  {
    id obj = v17;
    id v33 = objc_alloc((Class)NSData);
    id v34 = [v33 initWithBytes:v28 length:v248];
    uint64_t v211 = objc_opt_class();
    uint64_t v35 = objc_opt_class();
    uint64_t v36 = objc_opt_class();
    id v37 = v16;
    uint64_t v38 = objc_opt_class();
    uint64_t v39 = objc_opt_class();
    uint64_t v40 = objc_opt_class();
    uint64_t v41 = objc_opt_class();
    uint64_t v42 = objc_opt_class();
    uint64_t v204 = v38;
    id v16 = v37;
    __int16 v43 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v211, v35, v36, v204, v39, v40, v41, v42, objc_opt_class(), 0);
    id v246 = 0;
    v218 = v34;
    __int16 v31 = +[NSKeyedUnarchiver unarchivedObjectOfClasses:v43 fromData:v34 error:&v246];
    unsigned int v44 = (char *)v246;

    OSStatus v9 = v222;
    if (v44)
    {
      os_log_type_t v45 = WALogCategoryDefaultHandle();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446722;
        *(void *)&uint8_t buf[4] = "-[WAEngine _unpersist]";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = 2104;
        __int16 v252 = 2112;
        v253 = v44;
        _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_ERROR, "%{public}s::%d:Failed to unarchive root persistence dict: %@", buf, 0x1Cu);
      }
    }
    free(v224);
    __int16 v17 = obj;
    if (v31)
    {
      CFStringRef v46 = [v31 objectForKeyedSubscript:@"WA_BUILD_VERSION_PERSIST_KEY"];

      if (v46)
      {
        id v47 = objc_alloc((Class)NSString);
        id v48 = [v31 objectForKeyedSubscript:@"WA_BUILD_VERSION_PERSIST_KEY"];
        id v49 = [v47 initWithFormat:@"%@", v48];

        id v50 = [[objc_alloc((Class)NSString) initWithFormat:@"%s%s%s", "WiFiAnalytics_executables-680.21", "\"WiFiAnalytics_executables-680.21\", "Nov 14 2024 22:56:58""];
        v207 = v50;
        if (v49)
        {
          v206 = v49;
          unsigned __int8 v51 = [v49 isEqual:v50];
          __int16 v19 = &AnalyticsSendEventLazy_ptr;
          int v20 = v226;
          __int16 v52 = v216;
          if (v51) {
            goto LABEL_37;
          }
LABEL_34:
          [(WAEngine *)self _removePersistenceFile];

          int v53 = WALogCategoryDefaultHandle();
          if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136446466;
            *(void *)&uint8_t buf[4] = "-[WAEngine _unpersist]";
            *(_WORD *)&buf[12] = 1024;
            *(_DWORD *)&buf[14] = 2119;
            _os_log_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_ERROR, "%{public}s::%d:Detected out of date persistence file, removing it and abandoning unpersist attempt...", buf, 0x12u);
          }

          __int16 v31 = 0;
          goto LABEL_37;
        }
      }
      else
      {
        v207 = 0;
      }
      v206 = 0;
      __int16 v19 = &AnalyticsSendEventLazy_ptr;
      int v20 = v226;
      __int16 v52 = v216;
      goto LABEL_34;
    }
    v206 = 0;
    v207 = 0;
    __int16 v19 = &AnalyticsSendEventLazy_ptr;
    int v20 = v226;
  }
  __int16 v52 = v216;
LABEL_37:

LABEL_38:
  self->_BOOL readingPersistFile = 0;
  __int16 v54 = [v31 objectForKeyedSubscript:@"WA_PERSIST_USAGE"];
  id v55 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v55, OS_LOG_TYPE_DEBUG))
  {
    __int16 v56 = (const char *)[v54 length];
    *(_DWORD *)buf = 136446722;
    *(void *)&uint8_t buf[4] = "-[WAEngine _unpersist]";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 2128;
    __int16 v252 = 2048;
    v253 = v56;
    _os_log_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_DEBUG, "%{public}s::%d:usageData size: %lu", buf, 0x1Cu);
  }

  v227 = v31;
  v223 = v54;
  if (!v54) {
    goto LABEL_46;
  }
  unsigned int v57 = v19[278];
  uint64_t v58 = objc_opt_class();
  uint64_t v59 = objc_opt_class();
  uint64_t v60 = objc_opt_class();
  unsigned int v61 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v58, v59, v60, objc_opt_class(), 0);
  id v245 = 0;
  id v62 = [v57 unarchivedObjectOfClasses:v61 fromData:v54 error:&v245];
  uint64_t v63 = (char *)v245;

  if (v63)
  {
    v64 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      *(void *)&uint8_t buf[4] = "-[WAEngine _unpersist]";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 2132;
      __int16 v252 = 2112;
      v253 = v63;
      _os_log_impl((void *)&_mh_execute_header, v64, OS_LOG_TYPE_ERROR, "%{public}s::%d:Failed to unarchive usageData: %@", buf, 0x1Cu);
    }
  }
  __int16 v31 = v227;
  if (!v62) {
LABEL_46:
  }
    id v62 = objc_alloc_init((Class)NSMutableDictionary);
  -[WAEngine setCachedUsage:](self, "setCachedUsage:", v62, dataOut, dataOutAvailable, v203, v205);

  [(WAEngine *)self _handleUnpersistForUsageData];
  +[WAUtil logNestedDictionary:self->_cachedUsage indent:0 prefix:@"Unpersist engine _cachedUsage"];
  uint64_t v65 = [v31 objectForKeyedSubscript:@"WA_PERSIST_CHIPSET"];
  v66 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v66, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v67 = (const char *)[v65 length];
    *(_DWORD *)buf = 136446722;
    *(void *)&uint8_t buf[4] = "-[WAEngine _unpersist]";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 2145;
    __int16 v252 = 2048;
    v253 = v67;
    _os_log_impl((void *)&_mh_execute_header, v66, OS_LOG_TYPE_DEBUG, "%{public}s::%d:wifiChipSetData size: %lu", buf, 0x1Cu);
  }

  v221 = v65;
  if (!v65) {
    goto LABEL_55;
  }
  v68 = v19[278];
  uint64_t v69 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", objc_opt_class(), 0);
  id v244 = 0;
  v70 = [v68 unarchivedObjectOfClasses:v69 fromData:v65 error:&v244];
  v71 = (char *)v244;

  if (v71)
  {
    dispatch_queue_t v72 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v72, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      *(void *)&uint8_t buf[4] = "-[WAEngine _unpersist]";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 2149;
      __int16 v252 = 2112;
      v253 = v71;
      _os_log_impl((void *)&_mh_execute_header, v72, OS_LOG_TYPE_ERROR, "%{public}s::%d:Failed to unarchive wifiChipSet: %@", buf, 0x1Cu);
    }
  }
  if (!v70)
  {
LABEL_55:
    v70 = +[NSString stringWithFormat:&stru_1000D3628];
  }
  [(WAEngine *)self setWifiChipSet:v70];

  v73 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v73, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v74 = [(WAEngine *)self wifiChipSet];
    *(_DWORD *)buf = 136446722;
    *(void *)&uint8_t buf[4] = "-[WAEngine _unpersist]";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 2155;
    __int16 v252 = 2112;
    v253 = v74;
    _os_log_impl((void *)&_mh_execute_header, v73, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:self.wifiChipSet %@", buf, 0x1Cu);
  }
  v75 = [v31 objectForKeyedSubscript:@"WA_PERSIST_INFRA_INTERFACE"];
  v76 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v76, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v77 = (const char *)[v75 length];
    *(_DWORD *)buf = 136446722;
    *(void *)&uint8_t buf[4] = "-[WAEngine _unpersist]";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 2158;
    __int16 v252 = 2048;
    v253 = v77;
    _os_log_impl((void *)&_mh_execute_header, v76, OS_LOG_TYPE_DEBUG, "%{public}s::%d:infraInterfaceNameData size: %lu", buf, 0x1Cu);
  }

  v219 = v75;
  if (!v75) {
    goto LABEL_66;
  }
  v78 = v19[278];
  uint64_t v79 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", objc_opt_class(), 0);
  id v243 = 0;
  v80 = [v78 unarchivedObjectOfClasses:v79 fromData:v75 error:&v243];
  uint64_t v81 = (char *)v243;

  if (v81)
  {
    v82 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v82, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      *(void *)&uint8_t buf[4] = "-[WAEngine _unpersist]";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 2162;
      __int16 v252 = 2112;
      v253 = v81;
      _os_log_impl((void *)&_mh_execute_header, v82, OS_LOG_TYPE_ERROR, "%{public}s::%d:Failed to unarchive infraInterfaceName: %@", buf, 0x1Cu);
    }
  }
  if (!v80)
  {
LABEL_66:
    v80 = +[NSString stringWithFormat:@"dunno"];
  }
  [(WAEngine *)self setInfraInterfaceName:v80];

  v83 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v83, OS_LOG_TYPE_DEFAULT))
  {
    v84 = [(WAEngine *)self infraInterfaceName];
    *(_DWORD *)buf = 136446722;
    *(void *)&uint8_t buf[4] = "-[WAEngine _unpersist]";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 2168;
    __int16 v252 = 2112;
    v253 = v84;
    _os_log_impl((void *)&_mh_execute_header, v83, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:self.infraInterfaceName %@", buf, 0x1Cu);
  }
  v85 = [v31 objectForKeyedSubscript:@"WA_PERSIST_DPS_WD_BUDGET"];
  uint64_t v86 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v86, OS_LOG_TYPE_DEBUG))
  {
    v87 = (const char *)[v85 length];
    *(_DWORD *)buf = 136446722;
    *(void *)&uint8_t buf[4] = "-[WAEngine _unpersist]";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 2172;
    __int16 v252 = 2048;
    v253 = v87;
    _os_log_impl((void *)&_mh_execute_header, v86, OS_LOG_TYPE_DEBUG, "%{public}s::%d:dpsWDBudgetData size: %lu", buf, 0x1Cu);
  }

  v217 = v85;
  if (!v85) {
    goto LABEL_78;
  }
  uint64_t v88 = v19[278];
  uint64_t v89 = objc_opt_class();
  uint64_t v90 = objc_opt_class();
  uint64_t v91 = objc_opt_class();
  v92 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v89, v90, v91, objc_opt_class(), 0);
  id v242 = 0;
  uint64_t v93 = [v88 unarchivedObjectOfClasses:v92 fromData:v217 error:&v242];
  v94 = (char *)v242;

  if (v94)
  {
    v95 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v95, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      *(void *)&uint8_t buf[4] = "-[WAEngine _unpersist]";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 2176;
      __int16 v252 = 2112;
      v253 = v94;
      _os_log_impl((void *)&_mh_execute_header, v95, OS_LOG_TYPE_ERROR, "%{public}s::%d:Failed to unarchive dpsWDBudgetData: %@", buf, 0x1Cu);
    }
  }
  __int16 v31 = v227;
  if (v93)
  {
    int v96 = 0;
    id v97 = (id)v93;
  }
  else
  {
LABEL_78:
    id v97 = objc_alloc_init((Class)NSMutableDictionary);
    uint64_t v93 = 0;
    int v96 = 1;
  }
  v225 = (void *)v93;
  v98 = [(WAEngine *)self recommendationEngine];
  [v98 setDpsWDBudgetDict:v97];

  if (v96) {
  v99 = WALogCategoryDefaultHandle();
  }
  if (os_log_type_enabled(v99, OS_LOG_TYPE_DEFAULT))
  {
    v100 = [(WAEngine *)self recommendationEngine];
    unsigned int v101 = [v100 dpsWDBudgetDict];
    *(_DWORD *)buf = 136446722;
    *(void *)&uint8_t buf[4] = "-[WAEngine _unpersist]";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 2183;
    __int16 v252 = 2112;
    v253 = v101;
    _os_log_impl((void *)&_mh_execute_header, v99, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:self.recommendationEngine.dpsWDBudgetDict %@", buf, 0x1Cu);
  }
  v102 = [v31 objectForKeyedSubscript:@"WA_PERSIST_DNS_PERSISTDATA"];
  v103 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v103, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v104 = (const char *)[v102 length];
    *(_DWORD *)buf = 136446722;
    *(void *)&uint8_t buf[4] = "-[WAEngine _unpersist]";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 2186;
    __int16 v252 = 2048;
    v253 = v104;
    _os_log_impl((void *)&_mh_execute_header, v103, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:dps/dns: unpersisting dnsPersistenceData size: %lu", buf, 0x1Cu);
  }

  if (v102)
  {
    v105 = v19[278];
    v106 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", objc_opt_class(), 0);
    id v241 = 0;
    id obja = [v105 unarchivedObjectOfClasses:v106 fromData:v102 error:&v241];
    v107 = (char *)v241;

    if (v107)
    {
      objc_super v108 = WALogCategoryDefaultHandle();
      if (os_log_type_enabled(v108, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446722;
        *(void *)&uint8_t buf[4] = "-[WAEngine _unpersist]";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = 2190;
        __int16 v252 = 2112;
        v253 = v107;
        _os_log_impl((void *)&_mh_execute_header, v108, OS_LOG_TYPE_ERROR, "%{public}s::%d:dps/dns: Failed to unarchive captiveServerIP: %@", buf, 0x1Cu);
      }
    }
    objc_storeStrong((id *)&self->_appleCaptiveServerIP, obja);
    v109 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v109, OS_LOG_TYPE_DEFAULT))
    {
      appleCaptiveServerIP = self->_appleCaptiveServerIP;
      *(_DWORD *)buf = 136446722;
      *(void *)&uint8_t buf[4] = "-[WAEngine _unpersist]";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 2194;
      __int16 v252 = 2112;
      v253 = (const char *)appleCaptiveServerIP;
      _os_log_impl((void *)&_mh_execute_header, v109, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:dps/dns: setting self->_appleCaptiveServerIP:%@", buf, 0x1Cu);
    }
  }
  else
  {
    [(WAEngine *)self resolveAppleCaptiveServer];
    id obja = 0;
  }
  __int16 v111 = [(WAEngine *)self dpsQuickRecoveryEngine];

  v209 = v102;
  if (v111)
  {
    uint64_t v112 = [v31 objectForKeyedSubscript:@"WA_PERSIST_DPS_QUICK_RECOVERY_WD_BUDGET"];
    __int16 v113 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v113, OS_LOG_TYPE_DEBUG))
    {
      int v114 = (const char *)[v112 length];
      *(_DWORD *)buf = 136446722;
      *(void *)&uint8_t buf[4] = "-[WAEngine _unpersist]";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 2203;
      __int16 v252 = 2048;
      v253 = v114;
      _os_log_impl((void *)&_mh_execute_header, v113, OS_LOG_TYPE_DEBUG, "%{public}s::%d:dpsQuickRecoveryWDBudgetData size: %lu", buf, 0x1Cu);
    }

    if (v112)
    {
      id v115 = v19[278];
      uint64_t v116 = objc_opt_class();
      uint64_t v117 = objc_opt_class();
      uint64_t v118 = objc_opt_class();
      v119 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v116, v117, v118, objc_opt_class(), 0);
      id v240 = 0;
      v120 = [v115 unarchivedObjectOfClasses:v119 fromData:v112 error:&v240];
      id v121 = (char *)v240;

      if (v121)
      {
        v122 = WALogCategoryDefaultHandle();
        if (os_log_type_enabled(v122, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136446722;
          *(void *)&uint8_t buf[4] = "-[WAEngine _unpersist]";
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = 2207;
          __int16 v252 = 2112;
          v253 = v121;
          _os_log_impl((void *)&_mh_execute_header, v122, OS_LOG_TYPE_ERROR, "%{public}s::%d:Failed to unarchive dpsQuickRecoveryWDBudgetData: %@", buf, 0x1Cu);
        }
      }
      __int16 v19 = &AnalyticsSendEventLazy_ptr;
    }
    else
    {
      v120 = v225;
    }
    id v123 = v120;
    if (!v120) {
      id v123 = objc_alloc_init((Class)NSMutableDictionary);
    }
    id v124 = [(WAEngine *)self dpsQuickRecoveryEngine];
    [v124 setDpsQuickRecoveryWDBudgetDict:v123];

    if (!v120) {
    int v125 = WALogCategoryDefaultHandle();
    }
    if (os_log_type_enabled(v125, OS_LOG_TYPE_DEFAULT))
    {
      int v126 = [(WAEngine *)self dpsQuickRecoveryEngine];
      v127 = [v126 dpsQuickRecoveryWDBudgetDict];
      *(_DWORD *)buf = 136446722;
      *(void *)&uint8_t buf[4] = "-[WAEngine _unpersist]";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 2213;
      __int16 v252 = 2112;
      v253 = v127;
      _os_log_impl((void *)&_mh_execute_header, v125, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:self.dpsQuickRecoveryEngine.dpsQuickRecoveryWDBudgetDict %@", buf, 0x1Cu);
    }
    v128 = [v227 objectForKeyedSubscript:@"WA_PERSIST_DPS_QUICK_RECOVERY_STATS"];
    v129 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v129, OS_LOG_TYPE_DEBUG))
    {
      v130 = (const char *)[v128 length];
      *(_DWORD *)buf = 136446722;
      *(void *)&uint8_t buf[4] = "-[WAEngine _unpersist]";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 2216;
      __int16 v252 = 2048;
      v253 = v130;
      _os_log_impl((void *)&_mh_execute_header, v129, OS_LOG_TYPE_DEBUG, "%{public}s::%d:dpsStatsData size: %lu", buf, 0x1Cu);
    }

    if (!v120) {
      goto LABEL_119;
    }
    v131 = v19[278];
    uint64_t v132 = objc_opt_class();
    uint64_t v133 = objc_opt_class();
    uint64_t v134 = objc_opt_class();
    id v135 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v132, v133, v134, objc_opt_class(), 0);
    id v239 = 0;
    v225 = [v131 unarchivedObjectOfClasses:v135 fromData:v128 error:&v239];
    v136 = (char *)v239;

    if (v136)
    {
      v137 = WALogCategoryDefaultHandle();
      if (os_log_type_enabled(v137, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446722;
        *(void *)&uint8_t buf[4] = "-[WAEngine _unpersist]";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = 2220;
        __int16 v252 = 2112;
        v253 = v136;
        _os_log_impl((void *)&_mh_execute_header, v137, OS_LOG_TYPE_ERROR, "%{public}s::%d:Failed to unarchive dpsStats: %@", buf, 0x1Cu);
      }
    }
    __int16 v19 = &AnalyticsSendEventLazy_ptr;
    id v138 = v225;
    if (v225)
    {
      int v139 = 0;
    }
    else
    {
LABEL_119:
      id v138 = objc_alloc_init((Class)NSMutableDictionary);
      v225 = 0;
      int v139 = 1;
    }
    v140 = [(WAEngine *)self dpsQuickRecoveryEngine];
    [v140 setDpsStats:v138];

    if (v139) {
    v141 = WALogCategoryDefaultHandle();
    }
    if (os_log_type_enabled(v141, OS_LOG_TYPE_DEFAULT))
    {
      v142 = [(WAEngine *)self dpsQuickRecoveryEngine];
      v143 = [v142 dpsStats];
      *(_DWORD *)buf = 136446722;
      *(void *)&uint8_t buf[4] = "-[WAEngine _unpersist]";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 2226;
      __int16 v252 = 2112;
      v253 = v143;
      _os_log_impl((void *)&_mh_execute_header, v141, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:self.dpsQuickRecoveryEngine.dpsStats %@", buf, 0x1Cu);
    }
    __int16 v31 = v227;
  }
  v144 = [v31 objectForKeyedSubscript:@"WA_PERSIST_MESSAGE_STORE"];
  os_log_type_t v145 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v145, OS_LOG_TYPE_DEBUG))
  {
    v146 = (const char *)[v144 length];
    *(_DWORD *)buf = 136446722;
    *(void *)&uint8_t buf[4] = "-[WAEngine _unpersist]";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 2230;
    __int16 v252 = 2048;
    v253 = v146;
    _os_log_impl((void *)&_mh_execute_header, v145, OS_LOG_TYPE_DEBUG, "%{public}s::%d:messageStoreData size: %lu", buf, 0x1Cu);
  }

  v213 = v144;
  if (!v144) {
    goto LABEL_133;
  }
  uint64_t v147 = v19[278];
  uint64_t v148 = objc_opt_class();
  uint64_t v149 = objc_opt_class();
  uint64_t v150 = objc_opt_class();
  uint64_t v151 = objc_opt_class();
  uint64_t v152 = objc_opt_class();
  v153 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v148, v149, v150, v151, v152, objc_opt_class(), 0);
  id v238 = 0;
  v154 = [v147 unarchivedObjectOfClasses:v153 fromData:v213 error:&v238];
  v155 = (char *)v238;

  if (v155)
  {
    v156 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v156, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      *(void *)&uint8_t buf[4] = "-[WAEngine _unpersist]";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 2234;
      __int16 v252 = 2112;
      v253 = v155;
      _os_log_impl((void *)&_mh_execute_header, v156, OS_LOG_TYPE_ERROR, "%{public}s::%d:Failed to unarchive WAMessageAWDStore: %@", buf, 0x1Cu);
    }
  }
  __int16 v19 = &AnalyticsSendEventLazy_ptr;
  __int16 v31 = v227;
  if (!v154) {
LABEL_133:
  }
    v154 = objc_alloc_init(WAMessageAWDStore);
  [(WAEngine *)self setMessageStore:v154];

  v157 = [v31 objectForKeyedSubscript:@"WA_PERSIST_PROCESS_REGISTRATION"];
  v158 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v158, OS_LOG_TYPE_DEBUG))
  {
    v159 = (const char *)[v157 length];
    *(_DWORD *)buf = 136446722;
    *(void *)&uint8_t buf[4] = "-[WAEngine _unpersist]";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 2242;
    __int16 v252 = 2048;
    v253 = v159;
    _os_log_impl((void *)&_mh_execute_header, v158, OS_LOG_TYPE_DEBUG, "%{public}s::%d:processRegistrationData size: %lu", buf, 0x1Cu);
  }

  v212 = v157;
  if (!v157) {
    goto LABEL_142;
  }
  v160 = v19[278];
  uint64_t v161 = objc_opt_class();
  uint64_t v162 = objc_opt_class();
  uint64_t v163 = objc_opt_class();
  uint64_t v164 = objc_opt_class();
  uint64_t v165 = objc_opt_class();
  id v166 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v161, v162, v163, v164, v165, objc_opt_class(), 0);
  id v237 = 0;
  id v167 = [v160 unarchivedObjectOfClasses:v166 fromData:v212 error:&v237];
  id v168 = (char *)v237;

  if (v168)
  {
    id v169 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v169, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      *(void *)&uint8_t buf[4] = "-[WAEngine _unpersist]";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 2246;
      __int16 v252 = 2112;
      v253 = v168;
      _os_log_impl((void *)&_mh_execute_header, v169, OS_LOG_TYPE_ERROR, "%{public}s::%d:Failed to unarchive process registration map: %@", buf, 0x1Cu);
    }
  }
  __int16 v19 = &AnalyticsSendEventLazy_ptr;
  if (!v167) {
LABEL_142:
  }
    id v167 = objc_alloc_init((Class)NSMutableDictionary);
  [(WAEngine *)self setProcessTokenToGroupTypeMap:v167];

  id v170 = [v31 objectForKeyedSubscript:@"WA_PERSIST_IOREPORTER_REGISTRATIONS"];
  id v171 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v171, OS_LOG_TYPE_DEBUG))
  {
    id v172 = (const char *)[v170 length];
    *(_DWORD *)buf = 136446722;
    *(void *)&uint8_t buf[4] = "-[WAEngine _unpersist]";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 2255;
    __int16 v252 = 2048;
    v253 = v172;
    _os_log_impl((void *)&_mh_execute_header, v171, OS_LOG_TYPE_DEBUG, "%{public}s::%d:iorReporterWrapperData size: %lu", buf, 0x1Cu);
  }

  v208 = v170;
  if (!v170) {
    goto LABEL_151;
  }
  char v173 = v19[278];
  id v236 = 0;
  v174 = [v173 unarchivedObjectOfClass:objc_opt_class() fromData:v170 error:&v236];
  v175 = (char *)v236;
  if (v175)
  {
    __int16 v176 = v175;
    int v177 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v177, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      *(void *)&uint8_t buf[4] = "-[WAEngine _unpersist]";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 2259;
      __int16 v252 = 2112;
      v253 = v176;
      _os_log_impl((void *)&_mh_execute_header, v177, OS_LOG_TYPE_ERROR, "%{public}s::%d:Failed to unarchive WAIOReporterMessagePopulator: %@", buf, 0x1Cu);
    }
  }
  if (!v174) {
LABEL_151:
  }
    v174 = objc_alloc_init(WAIOReporterMessagePopulator);
  [(WAEngine *)self setIorMessagePopulator:v174];

  __int16 v178 = [(WAEngine *)self iorMessagePopulator];
  [v178 setMessageDelegate:self];

  v179 = [(WAEngine *)self iorMessagePopulator];
  [v179 setPersistenceDelegate:self];

  long long v234 = 0u;
  long long v235 = 0u;
  long long v232 = 0u;
  long long v233 = 0u;
  __int16 v180 = [(WAEngine *)self processTokenToGroupTypeMap];
  int v181 = [v180 allKeys];

  id v182 = [v181 countByEnumeratingWithState:&v232 objects:v250 count:16];
  if (v182)
  {
    id v183 = v182;
    uint64_t v184 = *(void *)v233;
    do
    {
      for (i = 0; i != v183; i = (char *)i + 1)
      {
        if (*(void *)v233 != v184) {
          objc_enumerationMutation(v181);
        }
        uint64_t v186 = *(void *)(*((void *)&v232 + 1) + 8 * i);
        long long v228 = 0u;
        long long v229 = 0u;
        long long v230 = 0u;
        long long v231 = 0u;
        v187 = [(WAEngine *)self processTokenToGroupTypeMap];
        v188 = [v187 objectForKeyedSubscript:v186];

        id v189 = [v188 countByEnumeratingWithState:&v228 objects:v249 count:16];
        if (v189)
        {
          id v190 = v189;
          uint64_t v191 = *(void *)v229;
          do
          {
            for (j = 0; j != v190; j = (char *)j + 1)
            {
              if (*(void *)v229 != v191) {
                objc_enumerationMutation(v188);
              }
              -[WAEngine _initSubmitterAndQueryableRegistrationForProcessToken:andGroupType:](self, "_initSubmitterAndQueryableRegistrationForProcessToken:andGroupType:", v186, [*(id *)(*((void *)&v228 + 1) + 8 * (void)j) integerValue]);
            }
            id v190 = [v188 countByEnumeratingWithState:&v228 objects:v249 count:16];
          }
          while (v190);
        }
      }
      id v183 = [v181 countByEnumeratingWithState:&v232 objects:v250 count:16];
    }
    while (v183);
  }

  v193 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v193, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v194 = os_transaction_get_description();
    *(_DWORD *)buf = 136446722;
    *(void *)&uint8_t buf[4] = "-[WAEngine _unpersist]";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 2274;
    __int16 v252 = 2080;
    v253 = (const char *)v194;
    _os_log_impl((void *)&_mh_execute_header, v193, OS_LOG_TYPE_DEBUG, "%{public}s::%d:Ending transaction %s", buf, 0x1Cu);
  }

  v195 = +[WAActivityManager sharedActivityManager];
  [v195 osTransactionComplete:v210];

  v196 = WALogCategoryDefaultHandle();
  if (os_signpost_enabled(v196))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v196, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "WAEngine Unpersist", "", buf, 2u);
  }
}

- (void)_removePersistenceFile
{
  id v3 = WALogCategoryDefaultHandle();
  if (os_signpost_enabled(v3))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v3, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "WAEngine RemovePersistenceFile", "", buf, 2u);
  }

  if (self->_readingPersistFile || self->_writingPersistFile)
  {
    OSStatus v4 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      CFStringRef v5 = @"reading";
      BOOL readingPersistFile = self->_readingPersistFile;
      id v50 = "-[WAEngine _removePersistenceFile]";
      *(_DWORD *)buf = 136446722;
      if (!readingPersistFile) {
        CFStringRef v5 = @"writing";
      }
      __int16 v51 = 1024;
      int v52 = 2285;
      __int16 v53 = 2112;
      CFStringRef v54 = v5;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "%{public}s::%d:Cannot remove persistence file, we're currenlty %@ it", buf, 0x1Cu);
    }
    id v7 = 0;
    goto LABEL_10;
  }
  OSStatus v10 = +[NSFileManager defaultManager];
  CFStringRef v11 = NSHomeDirectory();
  OSStatus v12 = +[NSString stringWithFormat:@"%@%@t.out", v11, @"/Library/com.apple.wifianalyticsd/.wa/"];
  unsigned int v13 = [v10 isDeletableFileAtPath:v12];

  if (v13)
  {
    uint64_t v14 = +[NSFileManager defaultManager];
    OSStatus v15 = NSHomeDirectory();
    id v16 = +[NSString stringWithFormat:@"%@%@t.out", v15, @"/Library/com.apple.wifianalyticsd/.wa/"];
    id v48 = 0;
    unsigned __int8 v17 = [v14 removeItemAtPath:v16 error:&v48];
    id v18 = v48;

    if ((v17 & 1) == 0)
    {
      __int16 v19 = WALogCategoryDefaultHandle();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        int v20 = [v18 localizedDescription];
        *(_DWORD *)buf = 136446722;
        id v50 = "-[WAEngine _removePersistenceFile]";
        __int16 v51 = 1024;
        int v52 = 2292;
        __int16 v53 = 2112;
        CFStringRef v54 = v20;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "%{public}s::%d:Error removing file at path: %@", buf, 0x1Cu);
      }
    }
  }
  else
  {
    id v18 = 0;
  }
  size_t v21 = +[NSFileManager defaultManager];
  size_t v22 = +[WAIOReporterMessagePopulator getIORPopAvailabeIOReportersTempFile];
  unsigned int v23 = [v21 isDeletableFileAtPath:v22];

  if (v23)
  {
    uint64_t v24 = +[NSFileManager defaultManager];
    __int16 v25 = +[WAIOReporterMessagePopulator getIORPopAvailabeIOReportersTempFile];
    id v47 = v18;
    unsigned __int8 v26 = [v24 removeItemAtPath:v25 error:&v47];
    id v27 = v47;

    if ((v26 & 1) == 0)
    {
      uint64_t v28 = WALogCategoryDefaultHandle();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        int v29 = [v27 localizedDescription];
        *(_DWORD *)buf = 136446722;
        id v50 = "-[WAEngine _removePersistenceFile]";
        __int16 v51 = 1024;
        int v52 = 2299;
        __int16 v53 = 2112;
        CFStringRef v54 = v29;
        _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "%{public}s::%d:Error removing file getIORPopAvailabeIOReportersTempFile at path: %@", buf, 0x1Cu);
      }
    }
  }
  else
  {
    id v27 = v18;
  }
  int64_t v30 = +[NSFileManager defaultManager];
  __int16 v31 = +[WAIOReporterMessagePopulator getUnavailablePredTempFile];
  unsigned int v32 = [v30 isDeletableFileAtPath:v31];

  if (v32)
  {
    id v33 = +[NSFileManager defaultManager];
    id v34 = +[WAIOReporterMessagePopulator getUnavailablePredTempFile];
    id v46 = v27;
    unsigned __int8 v35 = [v33 removeItemAtPath:v34 error:&v46];
    id v8 = v46;

    if ((v35 & 1) == 0)
    {
      uint64_t v36 = WALogCategoryDefaultHandle();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      {
        id v37 = [v8 localizedDescription];
        *(_DWORD *)buf = 136446722;
        id v50 = "-[WAEngine _removePersistenceFile]";
        __int16 v51 = 1024;
        int v52 = 2306;
        __int16 v53 = 2112;
        CFStringRef v54 = v37;
        _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_ERROR, "%{public}s::%d:Error removing file getUnavailablePredTempFile at path: %@", buf, 0x1Cu);
      }
    }
  }
  else
  {
    id v8 = v27;
  }
  uint64_t v38 = +[NSFileManager defaultManager];
  uint64_t v39 = +[WAIOReporterMessagePopulator getUsageTempFile];
  unsigned int v40 = [v38 isDeletableFileAtPath:v39];

  if (v40)
  {
    uint64_t v41 = +[NSFileManager defaultManager];
    uint64_t v42 = +[WAIOReporterMessagePopulator getUsageTempFile];
    id v45 = v8;
    unsigned __int8 v43 = [v41 removeItemAtPath:v42 error:&v45];
    id v7 = v45;

    if (v43) {
      goto LABEL_11;
    }
    OSStatus v4 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      unsigned int v44 = [v7 localizedDescription];
      *(_DWORD *)buf = 136446722;
      id v50 = "-[WAEngine _removePersistenceFile]";
      __int16 v51 = 1024;
      int v52 = 2313;
      __int16 v53 = 2112;
      CFStringRef v54 = v44;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "%{public}s::%d:Error removing file getUsageTempFile at path: %@", buf, 0x1Cu);
    }
LABEL_10:

LABEL_11:
    id v8 = v7;
  }
  OSStatus v9 = WALogCategoryDefaultHandle();
  if (os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v9, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "WAEngine RemovePersistenceFile", "", buf, 2u);
  }
}

- (void)_handleUnpersistForUsageData
{
  CFStringRef v3 = @"Work Bin: Last PID Work";
  [(NSMutableDictionary *)self->_cachedUsage removeObjectForKey:@"Work Bin: Last PID Work"];
  id v55 = objc_alloc_init((Class)NSMutableDictionary);
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_cachedUsage, "setObject:forKeyedSubscript:");
  OSStatus v4 = [(NSMutableDictionary *)self->_cachedUsage objectForKeyedSubscript:@"Work Bin: Previous PIDs Work"];

  if (!v4)
  {
    id v5 = objc_alloc_init((Class)NSMutableDictionary);
    [(NSMutableDictionary *)self->_cachedUsage setObject:v5 forKeyedSubscript:@"Work Bin: Previous PIDs Work"];
  }
  long long v65 = 0u;
  long long v66 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  id v6 = [(NSMutableDictionary *)self->_cachedUsage copy];
  id v7 = [v6 countByEnumeratingWithState:&v63 objects:v78 count:16];
  if (v7)
  {
    id v8 = v7;
    CFStringRef v9 = @"Work Bin: Previous PIDs Work";
    uint64_t v10 = *(void *)v64;
    uint64_t v57 = *(void *)v64;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v64 != v10) {
          objc_enumerationMutation(v6);
        }
        OSStatus v12 = *(__CFString **)(*((void *)&v63 + 1) + 8 * i);
        if (([(__CFString *)v12 isEqualToString:v9] & 1) != 0
          || [(__CFString *)v12 isEqualToString:v3])
        {
          unsigned int v13 = WALogCategoryDefaultHandle();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 136446978;
            v68 = "-[WAEngine _handleUnpersistForUsageData]";
            __int16 v69 = 1024;
            int v70 = 2340;
            __int16 v71 = 2112;
            CFStringRef v72 = v3;
            __int16 v73 = 2112;
            uint64_t v74 = v12;
            _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "%{public}s::%d:Skipping copying key to %@: %@", buf, 0x26u);
          }
        }
        else
        {
          CFStringRef v14 = v9;
          id v15 = v6;
          id v16 = [(NSMutableDictionary *)self->_cachedUsage objectForKey:v12];
          [(NSMutableDictionary *)self->_cachedUsage objectForKeyedSubscript:v3];
          id v18 = v17 = v3;
          [v18 setObject:v16 forKeyedSubscript:v12];

          [(NSMutableDictionary *)self->_cachedUsage removeObjectForKey:v12];
          unsigned int v13 = WALogCategoryDefaultHandle();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
          {
            __int16 v19 = [(NSMutableDictionary *)self->_cachedUsage objectForKeyedSubscript:v17];
            int v20 = [v19 objectForKeyedSubscript:v12];
            *(_DWORD *)buf = 136446978;
            v68 = "-[WAEngine _handleUnpersistForUsageData]";
            __int16 v69 = 1024;
            int v70 = 2347;
            __int16 v71 = 2112;
            CFStringRef v72 = v12;
            __int16 v73 = 2112;
            uint64_t v74 = v20;
            _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "%{public}s::%d:_cachedUsage[kLastPIDBin] now contains key %@ with value %@", buf, 0x26u);
          }
          CFStringRef v3 = v17;
          id v6 = v15;
          CFStringRef v9 = v14;
          uint64_t v10 = v57;
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v63 objects:v78 count:16];
    }
    while (v8);
  }

  if (self->_persistFileExistedAtPIDLoad)
  {
    size_t v21 = [(NSMutableDictionary *)self->_cachedUsage objectForKeyedSubscript:@"Work Bin: Last PID Work"];
    size_t v22 = [v21 objectForKeyedSubscript:@"Terminations - Graceful"];

    if (!v22)
    {
      unsigned int v23 = [(NSMutableDictionary *)self->_cachedUsage objectForKeyedSubscript:@"Work Bin: Last PID Work"];
      +[WAUtil incrementValueForKey:@"Terminations - Unknown" inMutableDict:v23 onQueue:self->_engineQ];
    }
  }
  long long v61 = 0u;
  long long v62 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  uint64_t v24 = [(NSMutableDictionary *)self->_cachedUsage objectForKeyedSubscript:@"Work Bin: Last PID Work"];
  id v25 = [v24 copy];

  id v26 = [v25 countByEnumeratingWithState:&v59 objects:v77 count:16];
  if (v26)
  {
    id v27 = v26;
    uint64_t v58 = *(void *)v60;
    id v56 = v25;
    do
    {
      uint64_t v28 = 0;
      do
      {
        if (*(void *)v60 != v58) {
          objc_enumerationMutation(v25);
        }
        int v29 = *(__CFString **)(*((void *)&v59 + 1) + 8 * (void)v28);
        if ([(__CFString *)v29 isEqualToString:@"Persist file creation Date"])
        {
          int64_t v30 = [(NSMutableDictionary *)self->_cachedUsage objectForKeyedSubscript:@"Work Bin: Last PID Work"];
          __int16 v31 = [v30 objectForKeyedSubscript:v29];
          unsigned int v32 = [(NSMutableDictionary *)self->_cachedUsage objectForKeyedSubscript:@"Work Bin: Previous PIDs Work"];
          [v32 setObject:v31 forKeyedSubscript:v29];
        }
        id v33 = [(NSMutableDictionary *)self->_cachedUsage objectForKeyedSubscript:@"Work Bin: Last PID Work"];
        id v34 = [v33 objectForKeyedSubscript:v29];
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();

        if (isKindOfClass)
        {
          uint64_t v36 = WALogCategoryDefaultHandle();
          if (!os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG)) {
            goto LABEL_35;
          }
          *(_DWORD *)buf = 136446722;
          v68 = "-[WAEngine _handleUnpersistForUsageData]";
          __int16 v69 = 1024;
          int v70 = 2364;
          __int16 v71 = 2112;
          CFStringRef v72 = v29;
          id v37 = v36;
          uint64_t v38 = "%{public}s::%d:Skipping copying to _cachedUsage[kPreviousPIDsBin] key %@: NSDate";
LABEL_34:
          _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEBUG, v38, buf, 0x1Cu);
          goto LABEL_35;
        }
        if (([(__CFString *)v29 isEqualToString:@"Last Persisted PID"] & 1) != 0
          || [(__CFString *)v29 isEqualToString:@"Last Terminated PID"])
        {
          uint64_t v36 = WALogCategoryDefaultHandle();
          if (!os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG)) {
            goto LABEL_35;
          }
          *(_DWORD *)buf = 136446722;
          v68 = "-[WAEngine _handleUnpersistForUsageData]";
          __int16 v69 = 1024;
          int v70 = 2368;
          __int16 v71 = 2112;
          CFStringRef v72 = v29;
          id v37 = v36;
          uint64_t v38 = "%{public}s::%d:Skipping copying to _cachedUsage[kPreviousPIDsBin] key %@: kWAPersistedPidKey or kWATerminationPidKey";
          goto LABEL_34;
        }
        uint64_t v39 = [(NSMutableDictionary *)self->_cachedUsage objectForKeyedSubscript:@"Work Bin: Last PID Work"];
        unsigned int v40 = [v39 objectForKeyedSubscript:v29];
        objc_opt_class();
        char v41 = objc_opt_isKindOfClass();

        uint64_t v36 = WALogCategoryDefaultHandle();
        BOOL v42 = os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG);
        if (v41)
        {
          if (v42)
          {
            unsigned __int8 v43 = [(NSMutableDictionary *)self->_cachedUsage objectForKeyedSubscript:@"Work Bin: Last PID Work"];
            unsigned int v44 = [v43 objectForKeyedSubscript:v29];
            id v45 = [(NSMutableDictionary *)self->_cachedUsage objectForKeyedSubscript:@"Work Bin: Previous PIDs Work"];
            id v46 = [v45 objectForKeyedSubscript:v29];
            *(_DWORD *)buf = 136447234;
            v68 = "-[WAEngine _handleUnpersistForUsageData]";
            __int16 v69 = 1024;
            int v70 = 2373;
            __int16 v71 = 2112;
            CFStringRef v72 = v29;
            __int16 v73 = 2112;
            uint64_t v74 = v44;
            __int16 v75 = 2112;
            v76 = v46;
            _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEBUG, "%{public}s::%d:Summing key %@ of kLastPIDBin %@ to kPreviousPIDsBin %@", buf, 0x30u);
          }
          uint64_t v36 = [(NSMutableDictionary *)self->_cachedUsage objectForKeyedSubscript:@"Work Bin: Previous PIDs Work"];
          id v47 = [(NSMutableDictionary *)self->_cachedUsage objectForKeyedSubscript:@"Work Bin: Last PID Work"];
          +[WAUtil sumNSNumberForKey:v29 dstDict:v36 otherDict:v47];

          id v25 = v56;
        }
        else if (v42)
        {
          id v48 = [(NSMutableDictionary *)self->_cachedUsage objectForKeyedSubscript:@"Work Bin: Last PID Work"];
          id v49 = [v48 objectForKeyedSubscript:v29];
          id v50 = (__CFString *)objc_opt_class();
          *(_DWORD *)buf = 136446978;
          v68 = "-[WAEngine _handleUnpersistForUsageData]";
          __int16 v69 = 1024;
          int v70 = 2376;
          __int16 v71 = 2112;
          CFStringRef v72 = v29;
          __int16 v73 = 2112;
          uint64_t v74 = v50;
          __int16 v51 = v50;
          _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEBUG, "%{public}s::%d:Skipping copying to _cachedUsage[kPreviousPIDsBin] key %@: unknown class %@", buf, 0x26u);

          id v25 = v56;
        }
LABEL_35:

        uint64_t v28 = (char *)v28 + 1;
      }
      while (v27 != v28);
      id v52 = [v25 countByEnumeratingWithState:&v59 objects:v77 count:16];
      id v27 = v52;
    }
    while (v52);
  }

  +[WAUtil incrementValueForKey:@"Unpersisted Count" inMutableDict:self->_cachedUsage onQueue:self->_engineQ];
  cachedUsage = self->_cachedUsage;
  CFStringRef v54 = +[NSDate date];
  [(NSMutableDictionary *)cachedUsage setObject:v54 forKey:@"PID Unpersisted Date"];

  +[WAUtil logNestedDictionary:self->_cachedUsage indent:0 prefix:@"Handle Unpersist Engine _cachedUsage"];
}

- (void)_calculateEstimatedUptime
{
  CFStringRef v3 = [(NSMutableDictionary *)self->_cachedUsage objectForKeyedSubscript:@"PID Unpersisted Date"];

  if (v3)
  {
    OSStatus v4 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      id v5 = [(NSMutableDictionary *)self->_cachedUsage objectForKeyedSubscript:@"PID Unpersisted Date"];
      id v6 = +[NSDate now];
      id v7 = [(NSMutableDictionary *)self->_cachedUsage objectForKeyedSubscript:@"PID Unpersisted Date"];
      [v7 timeIntervalSinceNow];
      double v9 = v8;

      *(_DWORD *)id v25 = 136447234;
      double v10 = -v9;
      *(void *)&v25[4] = "-[WAEngine _calculateEstimatedUptime]";
      if (v9 >= 0.0) {
        double v10 = v9;
      }
      *(_WORD *)&v25[12] = 1024;
      *(_DWORD *)&v25[14] = 2392;
      __int16 v26 = 2112;
      id v27 = v5;
      __int16 v28 = 2112;
      int v29 = v6;
      __int16 v30 = 2048;
      double v31 = v10;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "%{public}s::%d:_cachedUsage[kWAUnpersistedDateKey] %@ now %@ interval %f", v25, 0x30u);
    }
    [(NSMutableDictionary *)self->_cachedUsage removeObjectForKey:@"Estimated Uptime (s)"];
    cachedUsage = self->_cachedUsage;
    OSStatus v12 = [(NSMutableDictionary *)cachedUsage objectForKeyedSubscript:@"PID Unpersisted Date"];
    [v12 timeIntervalSinceNow];
    double v14 = v13;

    double v15 = -v14;
    if (v14 >= 0.0) {
      double v15 = v14;
    }
    id v16 = +[NSNumber numberWithUnsignedLong:](NSNumber, "numberWithUnsignedLong:", (unint64_t)v15, *(_OWORD *)v25);
    CFStringRef v17 = cachedUsage;
LABEL_17:
    [(NSMutableDictionary *)v17 setObject:v16 forKey:@"Estimated Uptime (s)"];
    goto LABEL_18;
  }
  pidLaunchDate = self->_pidLaunchDate;
  __int16 v19 = WALogCategoryDefaultHandle();
  id v16 = v19;
  if (pidLaunchDate)
  {
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
      int v20 = self->_pidLaunchDate;
      size_t v21 = +[NSDate now];
      [(NSDate *)self->_pidLaunchDate timeIntervalSinceNow];
      *(_DWORD *)id v25 = 136447234;
      *(void *)&v25[4] = "-[WAEngine _calculateEstimatedUptime]";
      *(_WORD *)&v25[12] = 1024;
      if (v22 < 0.0) {
        double v22 = -v22;
      }
      *(_DWORD *)&v25[14] = 2397;
      __int16 v26 = 2112;
      id v27 = v20;
      __int16 v28 = 2112;
      int v29 = v21;
      __int16 v30 = 2048;
      double v31 = v22;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "%{public}s::%d:_pidLaunchDate %@ now %@ interval %f", v25, 0x30u);
    }
    [(NSMutableDictionary *)self->_cachedUsage removeObjectForKey:@"Estimated Uptime (s)"];
    unsigned int v23 = self->_cachedUsage;
    [(NSDate *)self->_pidLaunchDate timeIntervalSinceNow];
    if (v24 < 0.0) {
      double v24 = -v24;
    }
    id v16 = +[NSNumber numberWithUnsignedLong:](NSNumber, "numberWithUnsignedLong:", (unint64_t)v24, *(void *)v25, *(void *)&v25[8]);
    CFStringRef v17 = v23;
    goto LABEL_17;
  }
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)id v25 = 136446466;
    *(void *)&v25[4] = "-[WAEngine _calculateEstimatedUptime]";
    *(_WORD *)&v25[12] = 1024;
    *(_DWORD *)&v25[14] = 2402;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "%{public}s::%d: calculating kWACumulativeUptimeKey unavailable", v25, 0x12u);
  }
LABEL_18:
}

- (void)_calculateProfileUptime
{
  [(NSMutableDictionary *)self->_cachedUsage removeObjectForKey:@"Profile: MegaWiFi Enabled (s)"];
  cachedUsage = self->_cachedUsage;
  OSStatus v4 = +[NSNumber numberWithUnsignedLong:[(WAEngine *)self _getTimeInProfileState:1]];
  [(NSMutableDictionary *)cachedUsage setObject:v4 forKey:@"Profile: MegaWiFi Enabled (s)"];

  [(NSMutableDictionary *)self->_cachedUsage removeObjectForKey:@"Profile: MegaWiFi Uninstalled (s)"];
  id v5 = self->_cachedUsage;
  id v6 = +[NSNumber numberWithUnsignedLong:[(WAEngine *)self _getTimeInProfileState:0]];
  [(NSMutableDictionary *)v5 setObject:v6 forKey:@"Profile: MegaWiFi Uninstalled (s)"];
}

- (unint64_t)abstime_to_ns:(unint64_t)a3
{
  if (qword_1000F1080 != -1) {
    dispatch_once(&qword_1000F1080, &stru_1000D1428);
  }
  return (unint64_t)(*(double *)&qword_1000F0BF8 * (double)a3);
}

- (void)_calculateProcessUsage
{
  uint64_t v29 = 0;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  if (!proc_pid_rusage(self->_pid, 4, (rusage_info_t *)&v11))
  {
    [(NSMutableDictionary *)self->_cachedUsage removeObjectForKey:@"Process: current_mem kB"];
    cachedUsage = self->_cachedUsage;
    OSStatus v4 = +[NSNumber numberWithUnsignedLong:*((void *)&v15 + 1) >> 10];
    [(NSMutableDictionary *)cachedUsage setObject:v4 forKey:@"Process: current_mem kB"];

    [(NSMutableDictionary *)self->_cachedUsage removeObjectForKey:@"Process: lifetime_peak kB"];
    id v5 = self->_cachedUsage;
    id v6 = +[NSNumber numberWithUnsignedLong:(unint64_t)v26 >> 10];
    [(NSMutableDictionary *)v5 setObject:v6 forKey:@"Process: lifetime_peak kB"];

    [(NSMutableDictionary *)self->_cachedUsage removeObjectForKey:@"Process: cpu_time ns"];
    id v7 = self->_cachedUsage;
    double v8 = +[NSNumber numberWithUnsignedLong:[(WAEngine *)self abstime_to_ns:*((void *)&v12 + 1) + (void)v12]];
    [(NSMutableDictionary *)v7 setObject:v8 forKey:@"Process: cpu_time ns"];

    [(NSMutableDictionary *)self->_cachedUsage removeObjectForKey:@"Process: storage_dirtied kB"];
    double v9 = self->_cachedUsage;
    double v10 = +[NSNumber numberWithUnsignedLong:*((void *)&v25 + 1) >> 10];
    [(NSMutableDictionary *)v9 setObject:v10 forKey:@"Process: storage_dirtied kB"];
  }
}

- (void)_cancelWorkReportRecurringTimer
{
  if (self->_workReportTimerRunning)
  {
    workReportTimer = self->_workReportTimer;
    if (workReportTimer)
    {
      if (!dispatch_source_testcancel(workReportTimer))
      {
        OSStatus v4 = WALogCategoryDefaultHandle();
        if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
        {
          int v7 = 136446466;
          double v8 = "-[WAEngine _cancelWorkReportRecurringTimer]";
          __int16 v9 = 1024;
          int v10 = 2453;
          _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Timer exists and is valid, Suspending", (uint8_t *)&v7, 0x12u);
        }

        dispatch_suspend((dispatch_object_t)self->_workReportTimer);
        self->_BOOL workReportTimerRunning = 0;
        id v5 = WALogCategoryDefaultHandle();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
        {
          BOOL workReportTimerRunning = self->_workReportTimerRunning;
          int v7 = 136446722;
          double v8 = "-[WAEngine _cancelWorkReportRecurringTimer]";
          __int16 v9 = 1024;
          int v10 = 2456;
          __int16 v11 = 1024;
          BOOL v12 = workReportTimerRunning;
          _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:setting _workReportTimerRunning %d", (uint8_t *)&v7, 0x18u);
        }
      }
    }
  }
}

- (void)_enableWorkReportRecurringTimer
{
  BOOL workReportTimerRunning = self->_workReportTimerRunning;
  OSStatus v4 = WALogCategoryDefaultHandle();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (workReportTimerRunning)
  {
    if (v5)
    {
      *(_DWORD *)buf = 136446466;
      id v37 = "-[WAEngine _enableWorkReportRecurringTimer]";
      __int16 v38 = 1024;
      int v39 = 2463;
      id v6 = "%{public}s::%d:Persist is already scheduled, ignoring additional request";
      int v7 = v4;
      uint32_t v8 = 18;
LABEL_39:
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, v6, buf, v8);
      goto LABEL_40;
    }
    goto LABEL_40;
  }
  if (v5)
  {
    BOOL v9 = self->_workReportTimerRunning;
    unint64_t v10 = [(RecommendationPreferences *)self->_preferences work_report_seconds];
    workReportTimer = self->_workReportTimer;
    BOOL v12 = workReportTimer != 0;
    if (workReportTimer) {
      BOOL v13 = dispatch_source_testcancel(workReportTimer) != 0;
    }
    else {
      BOOL v13 = 0;
    }
    *(_DWORD *)buf = 136447490;
    id v37 = "-[WAEngine _enableWorkReportRecurringTimer]";
    __int16 v38 = 1024;
    int v39 = 2467;
    __int16 v40 = 1024;
    *(_DWORD *)char v41 = v9;
    *(_WORD *)&v41[4] = 2048;
    *(void *)&v41[6] = v10;
    __int16 v42 = 1024;
    BOOL v43 = v12;
    __int16 v44 = 1024;
    BOOL v45 = v13;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:_workReportTimerRunning is %d work_report_seconds is %lu _workReportTimer exists %d testcancel is %d", buf, 0x2Eu);
  }

  if (!self->_workReportTimerRunning)
  {
    long long v14 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136446466;
      id v37 = "-[WAEngine _enableWorkReportRecurringTimer]";
      __int16 v38 = 1024;
      int v39 = 2470;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "%{public}s::%d:Setting timer", buf, 0x12u);
    }

    long long v15 = self->_workReportTimer;
    if (v15)
    {
      if (!dispatch_source_testcancel(v15))
      {
LABEL_25:
        long long v23 = WALogCategoryDefaultHandle();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          unint64_t v24 = [(RecommendationPreferences *)self->_preferences work_report_seconds];
          *(_DWORD *)buf = 136446722;
          id v37 = "-[WAEngine _enableWorkReportRecurringTimer]";
          __int16 v38 = 1024;
          int v39 = 2491;
          __int16 v40 = 2048;
          *(void *)char v41 = v24;
          _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Starting dispatch_source_set_timer fire in %lu s", buf, 0x1Cu);
        }

        long long v25 = self->_workReportTimer;
        dispatch_time_t v26 = dispatch_time(0xFFFFFFFFFFFFFFFELL, 1000000000 * [(RecommendationPreferences *)self->_preferences work_report_seconds]);
        dispatch_source_set_timer(v25, v26, 1000000000 * [(RecommendationPreferences *)self->_preferences work_report_seconds], 0x3B9ACA00uLL);
        long long v27 = WALogCategoryDefaultHandle();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136446466;
          id v37 = "-[WAEngine _enableWorkReportRecurringTimer]";
          __int16 v38 = 1024;
          int v39 = 2493;
          _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Starting dispatch_source_set_timer Done", buf, 0x12u);
        }

        long long v28 = WALogCategoryDefaultHandle();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136446466;
          id v37 = "-[WAEngine _enableWorkReportRecurringTimer]";
          __int16 v38 = 1024;
          int v39 = 2495;
          _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:dispatch_resume _workReportTimer", buf, 0x12u);
        }

        dispatch_resume((dispatch_object_t)self->_workReportTimer);
        self->_BOOL workReportTimerRunning = 1;
        uint64_t v29 = WALogCategoryDefaultHandle();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        {
          BOOL v30 = self->_workReportTimerRunning;
          *(_DWORD *)buf = 136446722;
          id v37 = "-[WAEngine _enableWorkReportRecurringTimer]";
          __int16 v38 = 1024;
          int v39 = 2499;
          __int16 v40 = 1024;
          *(_DWORD *)char v41 = v30;
          _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:setting _workReportTimerRunning %d", buf, 0x18u);
        }

        goto LABEL_34;
      }
    }
    else
    {
      long long v16 = WALogCategoryDefaultHandle();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136446466;
        id v37 = "-[WAEngine _enableWorkReportRecurringTimer]";
        __int16 v38 = 1024;
        int v39 = 2476;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Creating _workReportTimer", buf, 0x12u);
      }

      long long v17 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)self->_engineQ);
      long long v18 = self->_workReportTimer;
      self->_workReportTimer = v17;

      long long v19 = WALogCategoryDefaultHandle();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136446466;
        id v37 = "-[WAEngine _enableWorkReportRecurringTimer]";
        __int16 v38 = 1024;
        int v39 = 2478;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEBUG, "%{public}s::%d:Creating _workReportTimer Done", buf, 0x12u);
      }

      if (!self->_workReportTimer)
      {
        OSStatus v4 = WALogCategoryDefaultHandle();
        if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_fault_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_FAULT, "Failed to create _workReportTimer", buf, 2u);
        }
        goto LABEL_40;
      }
    }
    long long v20 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446466;
      id v37 = "-[WAEngine _enableWorkReportRecurringTimer]";
      __int16 v38 = 1024;
      int v39 = 2482;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Setting dispatch_source_set_event_handler", buf, 0x12u);
    }

    long long v21 = self->_workReportTimer;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_1000554AC;
    handler[3] = &unk_1000D0D98;
    void handler[4] = self;
    dispatch_source_set_event_handler(v21, handler);
    long long v22 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136446466;
      id v37 = "-[WAEngine _enableWorkReportRecurringTimer]";
      __int16 v38 = 1024;
      int v39 = 2488;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEBUG, "%{public}s::%d:Setting block Done", buf, 0x12u);
    }

    goto LABEL_25;
  }
LABEL_34:
  OSStatus v4 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v31 = self->_workReportTimerRunning;
    unint64_t v32 = [(RecommendationPreferences *)self->_preferences work_report_seconds];
    id v33 = self->_workReportTimer;
    if (v33) {
      BOOL v34 = dispatch_source_testcancel(v33) == 0;
    }
    else {
      BOOL v34 = 0;
    }
    *(_DWORD *)buf = 136447234;
    id v37 = "-[WAEngine _enableWorkReportRecurringTimer]";
    __int16 v38 = 1024;
    int v39 = 2503;
    __int16 v40 = 1024;
    *(_DWORD *)char v41 = v31;
    *(_WORD *)&v41[4] = 2048;
    *(void *)&v41[6] = v32;
    __int16 v42 = 1024;
    BOOL v43 = v34;
    id v6 = "%{public}s::%d:Timer State : Enabled %d Period(ms) %lu valid %d";
    int v7 = v4;
    uint32_t v8 = 40;
    goto LABEL_39;
  }
LABEL_40:
}

- (id)_createNextWorkReportSnapshot
{
  CFStringRef v3 = [(WAEngine *)self cachedUsage];
  +[WAUtil incrementValueForKey:@"Telemetry: Work Report Window" inMutableDict:v3 onQueue:self->_engineQ];

  [(WAEngine *)self _calculateEstimatedUptime];
  [(WAEngine *)self _calculateProcessUsage];
  [(WAEngine *)self _calculateProfileUptime];
  OSStatus v4 = [(WAEngine *)self cachedUsage];

  if (v4)
  {
    BOOL v5 = [(WAEngine *)self iorMessagePopulator];
    id v6 = [v5 getCachedUsage];
    id v7 = [v6 copy];

    if (v7)
    {
      v14[0] = @"Module_Engine";
      id v8 = [(WAEngine *)self cachedUsage];
      id v9 = [v8 copy];
      v14[1] = @"Module_IOR";
      v15[0] = v9;
      v15[1] = v7;
      unint64_t v10 = +[NSDictionary dictionaryWithObjects:v15 forKeys:v14 count:2];
    }
    else
    {
      CFStringRef v12 = @"Module_Engine";
      id v7 = [(WAEngine *)self cachedUsage];
      id v8 = [v7 copy];
      id v13 = v8;
      unint64_t v10 = +[NSDictionary dictionaryWithObjects:&v13 forKeys:&v12 count:1];
    }
  }
  else
  {
    unint64_t v10 = 0;
  }

  return v10;
}

- (id)_createWorkReportDictionaryForTelemetryAndRollBucket
{
  id v3 = objc_alloc_init((Class)NSMutableDictionary);
  OSStatus v4 = [(WAEngine *)self nowCacheUsageForTelemetry];
  BOOL v5 = [(WAEngine *)self oldCacheUsageForTelemetry];
  +[WAUtil addDeltaNSNumberForTelemetryKey:@"ap_AgeOutAnalytics" dictKey:@"AnalyticsProcessor: Age Out Analytics" dictModule:@"Module_Engine" telDict:v3 recentDict:v4 oldDict:v5];
  +[WAUtil addDeltaNSNumberForTelemetryKey:@"ap_ApProfileForBSSID" dictKey:@"AnalyticsProcessor: AP Profile For BSSID" dictModule:@"Module_Engine" telDict:v3 recentDict:v4 oldDict:v5];
  +[WAUtil addDeltaNSNumberForTelemetryKey:@"ap_ProcessDatapathMetricsStream" dictKey:@"AnalyticsProcessor: Datapath Metrics Stream" dictModule:@"Module_Engine" telDict:v3 recentDict:v4 oldDict:v5];
  +[WAUtil addDeltaNSNumberForTelemetryKey:@"ap_ProcessWAM" dictKey:@"AnalyticsProcessor: Process WAM File" dictModule:@"Module_Engine" telDict:v3 recentDict:v4 oldDict:v5];
  +[WAUtil addDeltaNSNumberForTelemetryKey:@"ap_ProcessWAMessageMetric" dictKey:@"AnalyticsProcessor: Process WA Message Metric" dictModule:@"Module_Engine" telDict:v3 recentDict:v4 oldDict:v5];
  +[WAUtil addDeltaNSNumberForTelemetryKey:@"ap_Prune" dictKey:@"AnalyticsProcessor: Prune" dictModule:@"Module_Engine" telDict:v3 recentDict:v4 oldDict:v5];
  +[WAUtil addDeltaNSNumberForTelemetryKey:@"ap_SummarizeForNetwork" dictKey:@"AnalyticsProcessor: Summarize Analytics For Network" dictModule:@"Module_Engine" telDict:v3 recentDict:v4 oldDict:v5];
  +[WAUtil addDeltaNSNumberForTelemetryKey:@"client_ClearMessageStore" dictKey:@"Client: Clear Message Store" dictModule:@"Module_Engine" telDict:v3 recentDict:v4 oldDict:v5];
  +[WAUtil addDeltaNSNumberForTelemetryKey:@"client_ClientConfigChangeDelegate" dictKey:@"Client: Client Config Change Deligate" dictModule:@"Module_Engine" telDict:v3 recentDict:v4 oldDict:v5];
  +[WAUtil addDeltaNSNumberForTelemetryKey:@"client_ConvertWiFiStatsIntoPercentile" dictKey:@"Client: Convert WiFi Stats into Percentile" dictModule:@"Module_Engine" telDict:v3 recentDict:v4 oldDict:v5];
  +[WAUtil addDeltaNSNumberForTelemetryKey:@"client_EstablishConnection" dictKey:@"Client: Establish Connection" dictModule:@"Module_Engine" telDict:v3 recentDict:v4 oldDict:v5];
  +[WAUtil addDeltaNSNumberForTelemetryKey:@"client_GetDeviceAnalyticsConfiguration" dictKey:@"Client: Get Device Analytics Config" dictModule:@"Module_Engine" telDict:v3 recentDict:v4 oldDict:v5];
  +[WAUtil addDeltaNSNumberForTelemetryKey:@"client_GetDpsStats" dictKey:@"Client: Get DPS Stats" dictModule:@"Module_Engine" telDict:v3 recentDict:v4 oldDict:v5];
  +[WAUtil addDeltaNSNumberForTelemetryKey:@"client_GetMessageModelForGroup" dictKey:@"Client: Get Message Model For Group" dictModule:@"Module_Engine" telDict:v3 recentDict:v4 oldDict:v5];
  +[WAUtil addDeltaNSNumberForTelemetryKey:@"client_GetNewMessageForKey" dictKey:@"Client: Get New Message For Key" dictModule:@"Module_Engine" telDict:v3 recentDict:v4 oldDict:v5];
  +[WAUtil addDeltaNSNumberForTelemetryKey:@"client_GetUsageStats" dictKey:@"Client: Get Usage Stats" dictModule:@"Module_Engine" telDict:v3 recentDict:v4 oldDict:v5];
  +[WAUtil addDeltaNSNumberForTelemetryKey:@"client_IssueIOReportManagementCommand" dictKey:@"Client: Issue IOReport Managemen Command" dictModule:@"Module_Engine" telDict:v3 recentDict:v4 oldDict:v5];
  +[WAUtil addDeltaNSNumberForTelemetryKey:@"client_KillDaemon" dictKey:@"Client: Kill Daemon" dictModule:@"Module_Engine" telDict:v3 recentDict:v4 oldDict:v5];
  +[WAUtil addDeltaNSNumberForTelemetryKey:@"client_lqmCrashTracerNotify" dictKey:@"Client: LQM Crash Tracer Notify" dictModule:@"Module_Engine" telDict:v3 recentDict:v4 oldDict:v5];
  +[WAUtil addDeltaNSNumberForTelemetryKey:@"client_lqmCrashTracerReceive" dictKey:@"Client: LQM Crash Tracer Receive" dictModule:@"Module_Engine" telDict:v3 recentDict:v4 oldDict:v5];
  +[WAUtil addDeltaNSNumberForTelemetryKey:@"client_RegisterMessageGroup" dictKey:@"Client: Register Message Group" dictModule:@"Module_Engine" telDict:v3 recentDict:v4 oldDict:v5];
  +[WAUtil addDeltaNSNumberForTelemetryKey:@"client_SendMemoryPressureRequest" dictKey:@"Client: Send Memory Pressure Request" dictModule:@"Module_Engine" telDict:v3 recentDict:v4 oldDict:v5];
  +[WAUtil addDeltaNSNumberForTelemetryKey:@"client_SetDeviceAnalyticsConfiguration" dictKey:@"Client: Set Device Analytics Config" dictModule:@"Module_Engine" telDict:v3 recentDict:v4 oldDict:v5];
  +[WAUtil addDeltaNSNumberForTelemetryKey:@"client_SubmitMessage" dictKey:@"Client: Submit Message" dictModule:@"Module_Engine" telDict:v3 recentDict:v4 oldDict:v5];
  +[WAUtil addDeltaNSNumberForTelemetryKey:@"client_SubmitWiFiAnalayticsMessage" dictKey:@"Client: Submit WiFi Analytics Message" dictModule:@"Module_Engine" telDict:v3 recentDict:v4 oldDict:v5];
  +[WAUtil addDeltaNSNumberForTelemetryKey:@"client_SubmitWiFiAnalayticsMessageAdvanced" dictKey:@"Client: Submit WiFi Analytics Message Advanced" dictModule:@"Module_Engine" telDict:v3 recentDict:v4 oldDict:v5];
  +[WAUtil addDeltaNSNumberForTelemetryKey:@"client_SummarizeDeviceAnalyticsForNetwork" dictKey:@"Client: Summarize Device Analytics For Network" dictModule:@"Module_Engine" telDict:v3 recentDict:v4 oldDict:v5];
  +[WAUtil addDeltaNSNumberForTelemetryKey:@"client_TrapCrashMiniTracerDump" dictKey:@"Client: Trap Crash Mini Tracer Dump" dictModule:@"Module_Engine" telDict:v3 recentDict:v4 oldDict:v5];
  +[WAUtil addDeltaNSNumberForTelemetryKey:@"client_Trigger11axPerfStudy" dictKey:@"Client: Trigger 11ax Perf Study" dictModule:@"Module_Engine" telDict:v3 recentDict:v4 oldDict:v5];
  +[WAUtil addDeltaNSNumberForTelemetryKey:@"client_TriggerDatapathDiagnostic" dictKey:@"Client: Trigger Datapath Diagnostic" dictModule:@"Module_Engine" telDict:v3 recentDict:v4 oldDict:v5];
  +[WAUtil addDeltaNSNumberForTelemetryKey:@"client_TriggerDeviceAnalyticsStoreMigration" dictKey:@"Client: Trigger Device Analytics Store Migration" dictModule:@"Module_Engine" telDict:v3 recentDict:v4 oldDict:v5];
  +[WAUtil addDeltaNSNumberForTelemetryKey:@"client_TriggerQueryForNWActivity" dictKey:@"Client: Trigger Query for NW Activity" dictModule:@"Module_Engine" telDict:v3 recentDict:v4 oldDict:v5];
  +[WAUtil addDeltaNSNumberForTelemetryKey:@"debug_profileUptime" dictKey:@"Profile: MegaWiFi Enabled (s)" dictModule:@"Module_Engine" telDict:v3 recentDict:v4 oldDict:v5];
  id v6 = [v3 objectForKeyedSubscript:@"debug_profileUptime"];
  id v7 = [v6 unsignedLongValue];

  if (v7) {
    id v8 = &__kCFBooleanTrue;
  }
  else {
    id v8 = &__kCFBooleanFalse;
  }
  [v3 setObject:v8 forKeyedSubscript:@"debug_profileInstalled"];
  +[WAUtil addDeltaNSNumberForTelemetryKey:@"dispatch_RxMemoryCritical" dictKey:@"Dispatch: Received Memory Critical" dictModule:@"Module_Engine" telDict:v3 recentDict:v4 oldDict:v5];
  +[WAUtil addDeltaNSNumberForTelemetryKey:@"dispatch_RxMemoryWarning" dictKey:@"Dispatch: Received Memory Warning" dictModule:@"Module_Engine" telDict:v3 recentDict:v4 oldDict:v5];
  +[WAUtil addDeltaNSNumberForTelemetryKey:@"engine_PersistCalls" dictKey:@"Persist Calls" dictModule:@"Module_Engine" telDict:v3 recentDict:v4 oldDict:v5];
  +[WAUtil addDeltaNSNumberForTelemetryKey:@"engine_TerminationGraceful" dictKey:@"Terminations - Graceful" dictModule:@"Module_Engine" telDict:v3 recentDict:v4 oldDict:v5];
  +[WAUtil addDeltaNSNumberForTelemetryKey:@"engine_TerminationUnknown" dictKey:@"Terminations - Unknown" dictModule:@"Module_Engine" telDict:v3 recentDict:v4 oldDict:v5];
  +[WAUtil addDeltaNSNumberForTelemetryKey:@"engine_TerminationTryEagerExit" dictKey:@"Terminations - Try Eager Exit" dictModule:@"Module_Engine" telDict:v3 recentDict:v4 oldDict:v5];
  +[WAUtil addDeltaNSNumberForTelemetryKey:@"engine_UnpersistedCalls" dictKey:@"Unpersisted Count" dictModule:@"Module_Engine" telDict:v3 recentDict:v4 oldDict:v5];
  +[WAUtil addDeltaNSNumberForTelemetryKey:@"engine_Uptime" dictKey:@"Estimated Uptime (s)" dictModule:@"Module_Engine" telDict:v3 recentDict:v4 oldDict:v5];
  +[WAUtil addDeltaNSNumberForTelemetryKey:@"ior_BuildStructuredDict" dictKey:@"Build Structured Dict Calls" dictModule:@"Module_IOR" telDict:v3 recentDict:v4 oldDict:v5];
  +[WAUtil addDeltaNSNumberForTelemetryKey:@"ior_CreateSamples" dictKey:@"CreateSamples Calls" dictModule:@"Module_IOR" telDict:v3 recentDict:v4 oldDict:v5];
  +[WAUtil addDeltaNSNumberForTelemetryKey:@"ior_CreateSamplesFailed" dictKey:@"CreateSamples Failed Calls" dictModule:@"Module_IOR" telDict:v3 recentDict:v4 oldDict:v5];
  +[WAUtil addDeltaNSNumberForTelemetryKey:@"ior_CreateSubscription" dictKey:@"CreateSubscription Calls" dictModule:@"Module_IOR" telDict:v3 recentDict:v4 oldDict:v5];
  +[WAUtil addDeltaNSNumberForTelemetryKey:@"ior_CreateSubscriptionFailed" dictKey:@"CreateSubscription Failed Calls" dictModule:@"Module_IOR" telDict:v3 recentDict:v4 oldDict:v5];
  +[WAUtil addDeltaNSNumberForTelemetryKey:@"ior_FindChannels" dictKey:@"Find Channels Calls" dictModule:@"Module_IOR" telDict:v3 recentDict:v4 oldDict:v5];
  +[WAUtil addDeltaNSNumberForTelemetryKey:@"ior_FullTeardown" dictKey:@"IOR Full Teardown Count" dictModule:@"Module_IOR" telDict:v3 recentDict:v4 oldDict:v5];
  +[WAUtil addDeltaNSNumberForTelemetryKey:@"ior_FullTeardownFailed" dictKey:@"IOR Full Teardown Failed Count" dictModule:@"Module_IOR" telDict:v3 recentDict:v4 oldDict:v5];
  +[WAUtil addDeltaNSNumberForTelemetryKey:@"ior_FullTeardownRecovered" dictKey:@"IOR Full Teardown Recovered Count" dictModule:@"Module_IOR" telDict:v3 recentDict:v4 oldDict:v5];
  +[WAUtil addDeltaNSNumberForTelemetryKey:@"ior_LegendQuery" dictKey:@"Legend Query Calls" dictModule:@"Module_IOR" telDict:v3 recentDict:v4 oldDict:v5];
  +[WAUtil addDeltaNSNumberForTelemetryKey:@"ior_LegendQueryFailed" dictKey:@"Legend Query Failed" dictModule:@"Module_IOR" telDict:v3 recentDict:v4 oldDict:v5];
  +[WAUtil addDeltaNSNumberForTelemetryKey:@"ior_PersistCalls" dictKey:@"Persist Calls" dictModule:@"Module_IOR" telDict:v3 recentDict:v4 oldDict:v5];
  +[WAUtil addDeltaNSNumberForTelemetryKey:@"ior_PopulationFailed" dictKey:@"IOR Population Failed Count" dictModule:@"Module_IOR" telDict:v3 recentDict:v4 oldDict:v5];
  +[WAUtil addDeltaNSNumberForTelemetryKey:@"ior_PopulationSuccess" dictKey:@"IOR Population Success Count" dictModule:@"Module_IOR" telDict:v3 recentDict:v4 oldDict:v5];
  +[WAUtil addDeltaNSNumberForTelemetryKey:@"ior_PopulationViaIterator" dictKey:@"IOR Population via Iterate" dictModule:@"Module_IOR" telDict:v3 recentDict:v4 oldDict:v5];
  +[WAUtil addDeltaNSNumberForTelemetryKey:@"ior_PopulationViaDictionary" dictKey:@"IOR Population via Dict" dictModule:@"Module_IOR" telDict:v3 recentDict:v4 oldDict:v5];
  +[WAUtil addDeltaNSNumberForTelemetryKey:@"ior_RequestDetermine" dictKey:@"External: Determine Channels Calls" dictModule:@"Module_IOR" telDict:v3 recentDict:v4 oldDict:v5];
  +[WAUtil addDeltaNSNumberForTelemetryKey:@"ior_RequestPopulate" dictKey:@"Populate IOReporter Calls" dictModule:@"Module_IOR" telDict:v3 recentDict:v4 oldDict:v5];
  +[WAUtil addDeltaNSNumberForTelemetryKey:@"ior_RescanDenied" dictKey:@"Rescan Denied" dictModule:@"Module_IOR" telDict:v3 recentDict:v4 oldDict:v5];
  +[WAUtil addDeltaNSNumberForTelemetryKey:@"ior_RescanExplore" dictKey:@"Rescan Reason: Explore Count" dictModule:@"Module_IOR" telDict:v3 recentDict:v4 oldDict:v5];
  +[WAUtil addDeltaNSNumberForTelemetryKey:@"ior_RescanHintSignals" dictKey:@"Rescan Signal Count" dictModule:@"Module_IOR" telDict:v3 recentDict:v4 oldDict:v5];
  +[WAUtil addDeltaNSNumberForTelemetryKey:@"ior_RescanLowChannel" dictKey:@"Rescan Reason: Low Channel Count" dictModule:@"Module_IOR" telDict:v3 recentDict:v4 oldDict:v5];
  +[WAUtil addDeltaNSNumberForTelemetryKey:@"ior_RescanNewPhy" dictKey:@"IOR Unprepared For Sample Count" dictModule:@"Module_IOR" telDict:v3 recentDict:v4 oldDict:v5];
  +[WAUtil addDeltaNSNumberForTelemetryKey:@"ior_RescanPerformed" dictKey:@"Rescan Permitted: Last Rescan Count" dictModule:@"Module_IOR" telDict:v3 recentDict:v4 oldDict:v5];
  +[WAUtil addDeltaNSNumberForTelemetryKey:@"ior_StaleDriverID" dictKey:@"Fault Detection: Stale DriverID Count" dictModule:@"Module_IOR" telDict:v3 recentDict:v4 oldDict:v5];
  +[WAUtil addDeltaNSNumberForTelemetryKey:@"ior_TerminationGraceful" dictKey:@"Terminations - Graceful" dictModule:@"Module_IOR" telDict:v3 recentDict:v4 oldDict:v5];
  +[WAUtil addDeltaNSNumberForTelemetryKey:@"ior_TerminationUnknown" dictKey:@"Terminations - Unknown" dictModule:@"Module_IOR" telDict:v3 recentDict:v4 oldDict:v5];
  +[WAUtil addDeltaNSNumberForTelemetryKey:@"ior_UnpersistedCalls" dictKey:@"Unpersisted Count" dictModule:@"Module_IOR" telDict:v3 recentDict:v4 oldDict:v5];
  +[WAUtil addDeltaNSNumberForTelemetryKey:@"ior_Unprepared" dictKey:@"IOR Unprepared For Sample Count" dictModule:@"Module_IOR" telDict:v3 recentDict:v4 oldDict:v5];
  +[WAUtil addDeltaNSNumberForTelemetryKey:@"ior_UpdateSamples" dictKey:@"UpdateSamples Calls" dictModule:@"Module_IOR" telDict:v3 recentDict:v4 oldDict:v5];
  +[WAUtil addDeltaNSNumberForTelemetryKey:@"ior_UpdateSamplesFailed" dictKey:@"UpdateSamples Failed Calls" dictModule:@"Module_IOR" telDict:v3 recentDict:v4 oldDict:v5];
  +[WAUtil addDeltaNSNumberForTelemetryKey:@"ior_Uptime" dictKey:@"Estimated Uptime (s)" dictModule:@"Module_IOR" telDict:v3 recentDict:v4 oldDict:v5];
  +[WAUtil addDeltaNSNumberForTelemetryKey:@"log_Datapath" dictKey:@"Log: DatapathMetricStream Trigger" dictModule:@"Module_Engine" telDict:v3 recentDict:v4 oldDict:v5];
  +[WAUtil addDeltaNSNumberForTelemetryKey:@"log_WorkReport" dictKey:@"Log: Work Report" dictModule:@"Module_Engine" telDict:v3 recentDict:v4 oldDict:v5];
  id v9 = [v4 objectForKeyedSubscript:@"Module_Engine"];
  unint64_t v10 = [v9 objectForKeyedSubscript:@"Process: current_mem kB"];
  [v3 setObject:v10 forKeyedSubscript:@"process_CurrentMemory"];

  __int16 v11 = [v4 objectForKeyedSubscript:@"Module_Engine"];
  CFStringRef v12 = [v11 objectForKeyedSubscript:@"Process: lifetime_peak kB"];
  [v3 setObject:v12 forKeyedSubscript:@"process_PeakMemory"];

  +[WAUtil addDeltaNSNumberForTelemetryKey:@"process_StorageDirtied" dictKey:@"Process: storage_dirtied kB" dictModule:@"Module_Engine" telDict:v3 recentDict:v4 oldDict:v5];
  +[WAUtil addDeltaNSNumberForTelemetryKey:@"process_CPUTime" dictKey:@"Process: cpu_time ns" dictModule:@"Module_Engine" telDict:v3 recentDict:v4 oldDict:v5];
  uint64_t v13 = [v3 objectForKeyedSubscript:@"process_CPUTime"];
  if (v13)
  {
    long long v14 = (void *)v13;
    long long v15 = [v3 objectForKeyedSubscript:@"engine_Uptime"];

    if (v15)
    {
      long long v16 = [v3 objectForKeyedSubscript:@"process_CPUTime"];
      float v17 = (float)(unint64_t)[v16 unsignedLongValue] / 1000000.0;
      long long v18 = [v3 objectForKeyedSubscript:@"engine_Uptime"];
      *(float *)&double v19 = v17 / (float)(unint64_t)[v18 unsignedLongValue];
      long long v20 = +[NSNumber numberWithFloat:v19];
      [v3 setObject:v20 forKeyedSubscript:@"process_RunningDuty_ms_per_s"];
    }
  }
  long long v21 = +[NSNumber numberWithUnsignedLong:[(RecommendationPreferences *)self->_preferences work_report_seconds]];
  [v3 setObject:v21 forKeyedSubscript:@"reportingInterval"];

  [v3 setObject:&__kCFBooleanFalse forKeyedSubscript:@"build_Debug"];
  unint64_t workReportSelectingSingleWithinFirstDay = self->_workReportSelectingSingleWithinFirstDay;
  long long v23 = [(NSMutableDictionary *)self->_cachedUsage objectForKeyedSubscript:@"Telemetry: Work Report Window"];
  id v24 = [v23 unsignedIntegerValue];

  if ((id)workReportSelectingSingleWithinFirstDay == v24) {
    long long v25 = &__kCFBooleanTrue;
  }
  else {
    long long v25 = &__kCFBooleanFalse;
  }
  [v3 setObject:v25 forKeyedSubscript:@"singleAgg_InFirstDay"];
  unint64_t workReportSelectingSingleWithinFirstWeek = self->_workReportSelectingSingleWithinFirstWeek;
  long long v27 = [(NSMutableDictionary *)self->_cachedUsage objectForKeyedSubscript:@"Telemetry: Work Report Window"];
  id v28 = [v27 unsignedIntegerValue];

  if ((id)workReportSelectingSingleWithinFirstWeek == v28) {
    uint64_t v29 = &__kCFBooleanTrue;
  }
  else {
    uint64_t v29 = &__kCFBooleanFalse;
  }
  [v3 setObject:v29 forKeyedSubscript:@"singleAgg_InFirstWeek"];

  return v3;
}

- (void)_logWorkReport:(id)a3 indent:(int)a4 prefix:(id)a5
{
  id v7 = a3;
  id v39 = a5;
  id v8 = [objc_alloc((Class)NSSortDescriptor) initWithKey:0 ascending:1];
  id v9 = [v7 allKeys];
  unint64_t v10 = v9;
  if (!v8)
  {
    CFStringRef v12 = WALogCategoryDefaultHandle();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      goto LABEL_26;
    }
    *(_DWORD *)buf = 136446466;
    *(void *)BOOL v45 = "-[WAEngine _logWorkReport:indent:prefix:]";
    *(_WORD *)&v45[8] = 1024;
    *(_DWORD *)&v45[10] = 2666;
    BOOL v30 = "%{public}s::%d:Failed to create NSSortDescriptor";
    BOOL v31 = v12;
    os_log_type_t v32 = OS_LOG_TYPE_ERROR;
    uint32_t v33 = 18;
LABEL_31:
    _os_log_impl((void *)&_mh_execute_header, v31, v32, v30, buf, v33);
    goto LABEL_26;
  }
  if (![v9 count])
  {
    CFStringRef v12 = WALogCategoryDefaultHandle();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_26;
    }
    *(_DWORD *)buf = 136446722;
    *(void *)BOOL v45 = "-[WAEngine _logWorkReport:indent:prefix:]";
    *(_WORD *)&v45[8] = 1024;
    *(_DWORD *)&v45[10] = 2667;
    __int16 v46 = 2112;
    id v47 = v39;
    BOOL v30 = "%{public}s::%d:Zero keys found in dictionary entry %@";
    BOOL v31 = v12;
    os_log_type_t v32 = OS_LOG_TYPE_DEFAULT;
    uint32_t v33 = 28;
    goto LABEL_31;
  }
  id v53 = v8;
  __int16 v11 = +[NSArray arrayWithObjects:&v53 count:1];
  CFStringRef v12 = [v10 sortedArrayUsingDescriptors:v11];

  if ([v12 count])
  {
    unsigned __int8 v35 = v10;
    id v36 = v8;
    long long v42 = 0u;
    long long v43 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    id obj = v12;
    id v13 = [obj countByEnumeratingWithState:&v40 objects:v52 count:16];
    if (!v13) {
      goto LABEL_25;
    }
    id v14 = v13;
    uint64_t v15 = *(void *)v41;
    while (1)
    {
      long long v16 = 0;
      do
      {
        if (*(void *)v41 != v15) {
          objc_enumerationMutation(obj);
        }
        float v17 = *(void **)(*((void *)&v40 + 1) + 8 * (void)v16);
        long long v18 = [v7 objectForKeyedSubscript:v17];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {

LABEL_12:
          long long v21 = +[NSString stringWithFormat:@"%@ %@", v39, v17];
          long long v22 = [v7 objectForKeyedSubscript:v17];
          [(WAEngine *)self _logWorkReport:v22 indent:(a4 + 4) prefix:v21];
LABEL_13:

          goto LABEL_14;
        }
        double v19 = [v7 objectForKeyedSubscript:v17];
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();

        if (isKindOfClass) {
          goto LABEL_12;
        }
        long long v23 = [v7 objectForKeyedSubscript:v17];
        objc_opt_class();
        char v24 = objc_opt_isKindOfClass();

        long long v25 = [v7 objectForKeyedSubscript:v17];
        dispatch_time_t v26 = v25;
        if (v24)
        {
          unsigned __int8 v27 = [v25 isEqualToNumber:&off_1000E4330];

          if ((v27 & 1) == 0)
          {
            long long v21 = WALogWorkReportHandle();
            if (!os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT)) {
              goto LABEL_14;
            }
LABEL_23:
            long long v22 = [v7 objectForKeyedSubscript:v17];
            *(_DWORD *)buf = 67110146;
            *(_DWORD *)BOOL v45 = a4;
            *(_WORD *)&v45[4] = 2080;
            *(void *)&v45[6] = "";
            __int16 v46 = 2112;
            id v47 = v39;
            __int16 v48 = 2112;
            id v49 = v17;
            __int16 v50 = 2112;
            __int16 v51 = v22;
            _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "%*s%@ %@ : %@", buf, 0x30u);
            goto LABEL_13;
          }
        }
        else
        {
          objc_opt_class();
          char v28 = objc_opt_isKindOfClass();

          if (v28)
          {
            long long v21 = WALogWorkReportHandle();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT)) {
              goto LABEL_23;
            }
LABEL_14:
          }
        }
        long long v16 = (char *)v16 + 1;
      }
      while (v14 != v16);
      id v29 = [obj countByEnumeratingWithState:&v40 objects:v52 count:16];
      id v14 = v29;
      if (!v29)
      {
LABEL_25:
        CFStringRef v12 = obj;

        unint64_t v10 = v35;
        id v8 = v36;
        goto LABEL_26;
      }
    }
  }
  BOOL v34 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136446978;
    *(void *)BOOL v45 = "-[WAEngine _logWorkReport:indent:prefix:]";
    *(_WORD *)&v45[8] = 1024;
    *(_DWORD *)&v45[10] = 2670;
    __int16 v46 = 2112;
    id v47 = v39;
    __int16 v48 = 2112;
    id v49 = v10;
    _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_ERROR, "%{public}s::%d:Failed to create sortedKeys on entry %@ keys %@", buf, 0x26u);
  }

LABEL_26:
}

- (void)_reportWorkReportInterval
{
  uint64_t v19 = 0;
  long long v20 = &v19;
  uint64_t v21 = 0x3032000000;
  long long v22 = sub_10004D654;
  long long v23 = sub_10004D664;
  id v24 = 0;
  [(WAEngine *)self setOldCacheUsageForTelemetry:0];
  id v3 = WALogCategoryDefaultHandle();
  if (os_signpost_enabled(v3))
  {
    LOWORD(buf[0]) = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v3, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "Engine reportWorkReportInterval", "", (uint8_t *)buf, 2u);
  }

  OSStatus v4 = [(WAEngine *)self nowCacheUsageForTelemetry];
  BOOL v5 = [v4 objectForKeyedSubscript:@"Module_IOR"];
  [(WAEngine *)self setOldCacheUsageForTelemetry:v5];

  id v6 = [(WAEngine *)self _createNextWorkReportSnapshot];
  [(WAEngine *)self setNowCacheUsageForTelemetry:v6];

  if ([(RecommendationPreferences *)self->_preferences work_report_logs_enabled])
  {
    +[WAUtil incrementValueForKey:@"Log: Work Report" inMutableDict:self->_cachedUsage onQueue:self->_engineQ];
    uint64_t v7 = [(WAEngine *)self _createWorkReportDictionaryForTelemetryAndRollBucket];
    id v8 = (void *)v20[5];
    v20[5] = v7;

    [(WAEngine *)self _logWorkReport:v20[5] indent:0 prefix:@"Interval Work Report"];
    id v9 = [(WAEngine *)self nowCacheUsageForTelemetry];
    [(WAEngine *)self _logWorkReport:v9 indent:0 prefix:@"Current Accumulation"];
  }
  objc_initWeak(buf, self);
  CFStringRef v12 = _NSConcreteStackBlock;
  uint64_t v13 = 3221225472;
  id v14 = sub_100056EC0;
  uint64_t v15 = &unk_1000D1450;
  objc_copyWeak(&v17, buf);
  long long v16 = &v19;
  AnalyticsSendEventLazy();
  unint64_t v10 = WALogCategoryDefaultHandle();
  if (os_signpost_enabled(v10))
  {
    *(_WORD *)__int16 v11 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v10, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "Engine reportWorkReportInterval", "", v11, 2u);
  }

  objc_destroyWeak(&v17);
  objc_destroyWeak(buf);
  _Block_object_dispose(&v19, 8);
}

- (void)_initSubmitterAndQueryableRegistrationForProcessToken:(id)a3 andGroupType:(int64_t)a4
{
  id v6 = a3;
  uint64_t v7 = [(WAEngine *)self submitterMap];
  id v8 = [v7 objectForKeyedSubscript:v6];

  if (!v8)
  {
    id v9 = objc_alloc_init((Class)NSMutableDictionary);
    unint64_t v10 = [(WAEngine *)self submitterMap];
    [v10 setObject:v9 forKeyedSubscript:v6];
  }
  switch(a4)
  {
    case 0:
    case 6:
      __int16 v11 = WALogCategoryDefaultHandle();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        int v37 = 136446466;
        __int16 v38 = "-[WAEngine _initSubmitterAndQueryableRegistrationForProcessToken:andGroupType:]";
        __int16 v39 = 1024;
        int v40 = 2756;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "%{public}s::%d:Unhandled WAGroupType trying to init submitter", (uint8_t *)&v37, 0x12u);
      }

      break;
    case 2:
      CFStringRef v12 = [[WAGeoServicesMessageSubmitter alloc] initWithMessageGroupType:2];
      uint64_t v13 = [(WAEngine *)self submitterMap];
      id v14 = [v13 objectForKeyedSubscript:v6];
      uint64_t v15 = +[NSNumber numberWithInteger:2];
      [v14 setObject:v12 forKeyedSubscript:v15];

      long long v16 = [(WAEngine *)self messageStore];
      id v17 = [(WAEngine *)self submitterMap];
      long long v18 = [v17 objectForKeyedSubscript:v6];
      uint64_t v19 = 2;
      goto LABEL_11;
    case 3:
      long long v20 = [[WANWActivityMessageSubmitter alloc] initWithMessageGroupType:3];
      uint64_t v21 = [(WAEngine *)self submitterMap];
      long long v22 = [v21 objectForKeyedSubscript:v6];
      long long v23 = +[NSNumber numberWithInteger:3];
      [v22 setObject:v20 forKeyedSubscript:v23];

      long long v16 = [(WAEngine *)self messageStore];
      id v17 = [(WAEngine *)self submitterMap];
      long long v18 = [v17 objectForKeyedSubscript:v6];
      uint64_t v19 = 3;
      goto LABEL_11;
    case 4:
      id v24 = [[WADatapathDiagnosticsMessageSubmitter alloc] initWithMessageGroupType:4];
      long long v25 = [(WAEngine *)self submitterMap];
      dispatch_time_t v26 = [v25 objectForKeyedSubscript:v6];
      unsigned __int8 v27 = +[NSNumber numberWithInteger:4];
      [v26 setObject:v24 forKeyedSubscript:v27];

      long long v16 = [(WAEngine *)self messageStore];
      id v17 = [(WAEngine *)self submitterMap];
      long long v18 = [v17 objectForKeyedSubscript:v6];
      uint64_t v19 = 4;
      goto LABEL_11;
    case 5:
      char v28 = [[WAMessageSubmitter alloc] initWithMessageGroupType:5];
      id v29 = [(WAEngine *)self submitterMap];
      BOOL v30 = [v29 objectForKeyedSubscript:v6];
      BOOL v31 = +[NSNumber numberWithInteger:5];
      [v30 setObject:v28 forKeyedSubscript:v31];

      long long v16 = [(WAEngine *)self messageStore];
      id v17 = [(WAEngine *)self submitterMap];
      long long v18 = [v17 objectForKeyedSubscript:v6];
      uint64_t v19 = 5;
LABEL_11:
      os_log_type_t v32 = +[NSNumber numberWithInteger:v19];
      uint32_t v33 = [v18 objectForKeyedSubscript:v32];
      [v33 setSubmissionDelegate:v16];

      break;
    default:
      break;
  }
  BOOL v34 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
  {
    unsigned __int8 v35 = +[WAUtil groupTypeToString:a4];
    id v36 = +[WAUtil trimTokenForLogging:v6];
    int v37 = 136447234;
    __int16 v38 = "-[WAEngine _initSubmitterAndQueryableRegistrationForProcessToken:andGroupType:]";
    __int16 v39 = 1024;
    int v40 = 2760;
    __int16 v41 = 2112;
    long long v42 = v35;
    __int16 v43 = 2048;
    int64_t v44 = a4;
    __int16 v45 = 2112;
    __int16 v46 = v36;
    _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Registered group %@(%lu) for token %@", (uint8_t *)&v37, 0x30u);
  }
}

- (id)_getMessagesModelForProcessToken:(id)a3 groupType:(int64_t)a4 andError:(id *)a5
{
  id v36 = objc_alloc_init((Class)NSMutableDictionary);
  uint64_t v7 = +[WAUtil resourcePath];
  id v8 = +[NSString stringWithFormat:@"%@/%ld/", v7, a4];

  id v9 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    __int16 v43 = "-[WAEngine _getMessagesModelForProcessToken:groupType:andError:]";
    __int16 v44 = 1024;
    int v45 = 2772;
    __int16 v46 = 2112;
    id v47 = v8;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:pathForGrouppathForGroup %@", buf, 0x1Cu);
  }

  if (v8)
  {
    unint64_t v10 = +[NSFileManager defaultManager];
    __int16 v11 = [v10 contentsOfDirectoryAtPath:v8 error:0];

    if ([v11 count])
    {
      long long v40 = 0u;
      long long v41 = 0u;
      long long v38 = 0u;
      long long v39 = 0u;
      id v12 = v11;
      id v13 = [v12 countByEnumeratingWithState:&v38 objects:v50 count:16];
      if (!v13)
      {

        id v17 = 0;
        id v16 = 0;
        uint64_t v15 = 0;
        goto LABEL_27;
      }
      id v14 = v13;
      os_log_type_t v32 = a5;
      uint64_t v15 = 0;
      id v16 = 0;
      id v17 = 0;
      uint64_t v34 = *(void *)v39;
      unsigned __int8 v35 = v8;
      id obj = v12;
      while (2)
      {
        long long v18 = 0;
        uint64_t v19 = v15;
        long long v20 = v16;
        uint64_t v21 = v17;
        do
        {
          if (*(void *)v39 != v34) {
            objc_enumerationMutation(obj);
          }
          long long v22 = [*(id *)(*((void *)&v38 + 1) + 8 * (void)v18) componentsSeparatedByString:@"."];
          long long v23 = [v22 firstObject];

          id v24 = objc_alloc((Class)NSData);
          long long v25 = +[NSString stringWithFormat:@"%@/%@.wam", v35, v23];
          id v26 = [v24 initWithContentsOfFile:v25 options:8 error:0];

          id v16 = v26;
          uint64_t v27 = objc_opt_class();
          id v37 = v21;
          uint64_t v15 = +[NSKeyedUnarchiver unarchivedObjectOfClass:v27 fromData:v16 error:&v37];
          id v17 = v37;

          if (v17)
          {
            char v28 = WALogCategoryDefaultHandle();
            if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136446978;
              __int16 v43 = "-[WAEngine _getMessagesModelForProcessToken:groupType:andError:]";
              __int16 v44 = 1024;
              int v45 = 2783;
              __int16 v46 = 2112;
              id v47 = v23;
              __int16 v48 = 2112;
              id v49 = v17;
              _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "%{public}s::%d:Failed to unarchive a WAMessageAWD instance with key of %@. Error: %@", buf, 0x26u);
            }
          }
          if (!v15)
          {
            BOOL v30 = WALogCategoryDefaultHandle();
            if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136446722;
              __int16 v43 = "-[WAEngine _getMessagesModelForProcessToken:groupType:andError:]";
              __int16 v44 = 1024;
              int v45 = 2785;
              __int16 v46 = 2112;
              id v47 = v23;
              _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "%{public}s::%d:Failed to unobscure message for key: %@", buf, 0x1Cu);
            }

            uint64_t v15 = 0;
            id v29 = obj;
            goto LABEL_22;
          }
          [v36 setObject:v15 forKeyedSubscript:v23];

          long long v18 = (char *)v18 + 1;
          uint64_t v19 = v15;
          long long v20 = v16;
          uint64_t v21 = v17;
        }
        while (v14 != v18);
        id v29 = obj;
        id v14 = [obj countByEnumeratingWithState:&v38 objects:v50 count:16];
        if (v14) {
          continue;
        }
        break;
      }
LABEL_22:
      __int16 v11 = v29;
      id v8 = v35;
      a5 = v32;
    }
    else
    {
      NSErrorUserInfoKey v51 = NSLocalizedFailureReasonErrorKey;
      CFStringRef v52 = @"WAErrorCodeFileSystemError";
      id v29 = +[NSDictionary dictionaryWithObjects:&v52 forKeys:&v51 count:1];
      id v17 = +[NSError errorWithDomain:@"com.apple.wifi.analytics.errordomain" code:9015 userInfo:v29];
      uint64_t v15 = 0;
      id v16 = 0;
    }
  }
  else
  {
    NSErrorUserInfoKey v53 = NSLocalizedFailureReasonErrorKey;
    CFStringRef v54 = @"WAErrorCodeFileSystemError";
    id v29 = +[NSDictionary dictionaryWithObjects:&v54 forKeys:&v53 count:1];
    id v17 = +[NSError errorWithDomain:@"com.apple.wifi.analytics.errordomain" code:9015 userInfo:v29];
    uint64_t v15 = 0;
    id v16 = 0;
    __int16 v11 = 0;
  }

  if (a5 && v17) {
    *a5 = [v17 copy];
  }
  id v12 = v11;
LABEL_27:

  return v36;
}

- (id)_cachedModelObjectsMessageForGroupType:(int64_t)a3 key:(id)a4
{
  id v6 = a4;
  uint64_t v7 = v6;
  id v8 = 0;
  uint64_t v16 = 0;
  id v17 = &v16;
  uint64_t v18 = 0x3032000000;
  uint64_t v19 = sub_10004D654;
  long long v20 = sub_10004D664;
  id v21 = 0;
  if (a3 >= 1 && v6)
  {
    mutexQueue = self->_mutexQueue;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100057BC4;
    v12[3] = &unk_1000D1478;
    id v14 = &v16;
    int64_t v15 = a3;
    void v12[4] = self;
    id v13 = v6;
    dispatch_sync((dispatch_queue_t)mutexQueue, v12);

    id v8 = (void *)v17[5];
  }
  id v10 = v8;
  _Block_object_dispose(&v16, 8);

  return v10;
}

- (void)_getNewMessageForKey:(id)a3 groupType:(int64_t)a4 forProcessToken:(id)a5 shouldCheckForPrePopulation:(BOOL)a6 andReply:(id)a7
{
  BOOL v8 = a6;
  id v12 = a3;
  id v13 = a5;
  id v14 = (void (**)(id, void *, void))a7;
  int64_t v15 = [(WAEngine *)self _cachedModelObjectsMessageForGroupType:a4 key:v12];
  id v16 = +[WAUtil rotateUUIDsForMessage:v15];
  if (!v15)
  {
    long long v25 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      BOOL v30 = "-[WAEngine _getNewMessageForKey:groupType:forProcessToken:shouldCheckForPrePopulation:andReply:]";
      __int16 v31 = 1024;
      int v32 = 2824;
      __int16 v33 = 2112;
      id v34 = v12;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "%{public}s::%d:No model class found for key: %@. This is a CRITICAL error", buf, 0x1Cu);
    }

    goto LABEL_11;
  }
  if (!v8
    || ([(WAEngine *)self iorMessagePopulator],
        id v17 = objc_claimAutoreleasedReturnValue(),
        [v15 originalClassName],
        uint64_t v18 = objc_claimAutoreleasedReturnValue(),
        unsigned int v19 = [v17 doesMessageNeedPrepopulation:v18],
        v18,
        v17,
        !v19))
  {
LABEL_11:
    v14[2](v14, v15, 0);
    goto LABEL_7;
  }
  long long v20 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
  {
    id v21 = [v15 key];
    long long v22 = [v15 originalClassName];
    long long v23 = +[WAUtil trimTokenForLogging:v13];
    *(_DWORD *)buf = 136447234;
    BOOL v30 = "-[WAEngine _getNewMessageForKey:groupType:forProcessToken:shouldCheckForPrePopulation:andReply:]";
    __int16 v31 = 1024;
    int v32 = 2827;
    __int16 v33 = 2112;
    id v34 = v21;
    __int16 v35 = 2112;
    id v36 = v22;
    __int16 v37 = 2112;
    long long v38 = v23;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEBUG, "%{public}s::%d:WAMessageAWD with key: %@ and original classname: %@ requires IOReporter population... (proc token: %@)", buf, 0x30u);
  }
  id v24 = [(WAEngine *)self iorMessagePopulator];
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  id v26[2] = sub_1000580AC;
  v26[3] = &unk_1000D14A0;
  char v28 = v14;
  id v27 = v15;
  [v24 prepopulateMessage:v27 forProcess:v13 groupType:a4 andReply:v26];

LABEL_7:
}

- (void)_getNewMessageForKeyWithinPopulatorBlock:(id)a3 groupType:(int64_t)a4 forProcessToken:(id)a5 shouldCheckForPrePopulation:(BOOL)a6 andReply:(id)a7
{
  BOOL v8 = a6;
  id v12 = a3;
  id v13 = a5;
  id v14 = (void (**)(id, void *, void))a7;
  int64_t v15 = [(WAEngine *)self _cachedModelObjectsMessageForGroupType:a4 key:v12];
  id v16 = +[WAUtil rotateUUIDsForMessage:v15];
  if (!v15)
  {
    long long v25 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      BOOL v30 = "-[WAEngine _getNewMessageForKeyWithinPopulatorBlock:groupType:forProcessToken:shouldCheckForPrePopulation:andReply:]";
      __int16 v31 = 1024;
      int v32 = 2845;
      __int16 v33 = 2112;
      id v34 = v12;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "%{public}s::%d:No model class found for key: %@. This is a CRITICAL error", buf, 0x1Cu);
    }

    goto LABEL_11;
  }
  if (!v8
    || ([(WAEngine *)self iorMessagePopulator],
        id v17 = objc_claimAutoreleasedReturnValue(),
        [v15 originalClassName],
        uint64_t v18 = objc_claimAutoreleasedReturnValue(),
        unsigned int v19 = [v17 doesMessageNeedPrepopulation:v18],
        v18,
        v17,
        !v19))
  {
LABEL_11:
    v14[2](v14, v15, 0);
    goto LABEL_7;
  }
  long long v20 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
  {
    id v21 = [v15 key];
    long long v22 = [v15 originalClassName];
    long long v23 = +[WAUtil trimTokenForLogging:v13];
    *(_DWORD *)buf = 136447234;
    BOOL v30 = "-[WAEngine _getNewMessageForKeyWithinPopulatorBlock:groupType:forProcessToken:shouldCheckForPrePopulation:andReply:]";
    __int16 v31 = 1024;
    int v32 = 2848;
    __int16 v33 = 2112;
    id v34 = v21;
    __int16 v35 = 2112;
    id v36 = v22;
    __int16 v37 = 2112;
    long long v38 = v23;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEBUG, "%{public}s::%d:WAMessageAWD with key: %@ and original classname: %@ requires IOReporter population... (proc token: %@)", buf, 0x30u);
  }
  id v24 = [(WAEngine *)self iorMessagePopulator];
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  id v26[2] = sub_1000583C4;
  v26[3] = &unk_1000D14A0;
  char v28 = v14;
  id v27 = v15;
  [v24 prepopulateMessageWithinPopulatorBlock:v27 forProcess:v13 groupType:a4 andReply:v26];

LABEL_7:
}

- (void)_getNewMessageForKey:(id)a3 groupType:(int64_t)a4 withCopy:(BOOL)a5 forProcessToken:(id)a6 shouldCheckForPrePopulation:(BOOL)a7 andReply:(id)a8
{
  BOOL v9 = a7;
  BOOL v11 = a5;
  id v14 = a3;
  id v15 = a6;
  id v16 = (void (**)(id, void *, void))a8;
  id v17 = [(WAEngine *)self _cachedModelObjectsMessageForGroupType:a4 key:v14];
  uint64_t v18 = v17;
  if (v11)
  {
    id v19 = [v17 copy];

    uint64_t v18 = v19;
  }
  id v20 = +[WAUtil rotateUUIDsForMessage:v18];
  if (!v18)
  {
    id v29 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      id v34 = "-[WAEngine _getNewMessageForKey:groupType:withCopy:forProcessToken:shouldCheckForPrePopulation:andReply:]";
      __int16 v35 = 1024;
      int v36 = 2871;
      __int16 v37 = 2112;
      id v38 = v14;
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, "%{public}s::%d:No model class found for key: %@. This is a CRITICAL error", buf, 0x1Cu);
    }

    goto LABEL_13;
  }
  if (!v9
    || ([(WAEngine *)self iorMessagePopulator],
        id v21 = objc_claimAutoreleasedReturnValue(),
        [v18 originalClassName],
        long long v22 = objc_claimAutoreleasedReturnValue(),
        unsigned int v23 = [v21 doesMessageNeedPrepopulation:v22],
        v22,
        v21,
        !v23))
  {
LABEL_13:
    v16[2](v16, v18, 0);
    goto LABEL_9;
  }
  id v24 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
  {
    long long v25 = [v18 key];
    id v26 = [v18 originalClassName];
    id v27 = +[WAUtil trimTokenForLogging:v15];
    *(_DWORD *)buf = 136447234;
    id v34 = "-[WAEngine _getNewMessageForKey:groupType:withCopy:forProcessToken:shouldCheckForPrePopulation:andReply:]";
    __int16 v35 = 1024;
    int v36 = 2874;
    __int16 v37 = 2112;
    id v38 = v25;
    __int16 v39 = 2112;
    long long v40 = v26;
    __int16 v41 = 2112;
    long long v42 = v27;
    _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEBUG, "%{public}s::%d:WAMessageAWD with key: %@ and original classname: %@ requires IOReporter population... (proc token: %@)", buf, 0x30u);
  }
  char v28 = [(WAEngine *)self iorMessagePopulator];
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  v30[2] = sub_1000586F8;
  v30[3] = &unk_1000D14A0;
  int v32 = v16;
  id v31 = v18;
  [v28 prepopulateMessage:v31 forProcess:v15 groupType:a4 andReply:v30];

LABEL_9:
}

- (id)_ingestMessage:(id)a3 forProcessToken:(id)a4
{
  id v5 = a3;
  id v6 = [(WAEngine *)self messageStore];

  if (v6)
  {
    uint64_t v7 = [(WAEngine *)self messageStore];
    [v7 updateMessage:v5];

    [(WAEngine *)self _persist];
    BOOL v8 = 0;
  }
  else
  {
    NSErrorUserInfoKey v11 = NSLocalizedFailureReasonErrorKey;
    CFStringRef v12 = @"WAErrorCodeInternalError";
    id v10 = +[NSDictionary dictionaryWithObjects:&v12 forKeys:&v11 count:1];
    BOOL v8 = +[NSError errorWithDomain:@"com.apple.wifi.analytics.errordomain" code:9003 userInfo:v10];
  }

  return v8;
}

- (id)_submitMessage:(id)a3 groupType:(int64_t)a4 forProcessToken:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if (v8)
  {
    id v10 = [(WAEngine *)self submitterMap];
    NSErrorUserInfoKey v11 = [v10 objectForKeyedSubscript:v9];
    CFStringRef v12 = +[NSNumber numberWithInteger:a4];
    id v13 = [v11 objectForKeyedSubscript:v12];

    if (v13)
    {
      id v14 = [(WAEngine *)self submitterMap];
      id v15 = [v14 objectForKeyedSubscript:v9];
      id v16 = +[NSNumber numberWithInteger:a4];
      id v17 = [v15 objectForKeyedSubscript:v16];
      uint64_t v18 = [v17 submitMessage:v8];

      goto LABEL_4;
    }
    long long v22 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      char v28 = "-[WAEngine _submitMessage:groupType:forProcessToken:]";
      __int16 v29 = 1024;
      int v30 = 2899;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "%{public}s::%d:no submitter to submit to, has this WAGroupType been registered? ", buf, 0x12u);
    }

    NSErrorUserInfoKey v23 = NSLocalizedFailureReasonErrorKey;
    CFStringRef v24 = @"WAErrorCodeMessageNotRegistered";
    id v14 = +[NSDictionary dictionaryWithObjects:&v24 forKeys:&v23 count:1];
    uint64_t v21 = 9005;
  }
  else
  {
    id v20 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      char v28 = "-[WAEngine _submitMessage:groupType:forProcessToken:]";
      __int16 v29 = 1024;
      int v30 = 2898;
      __int16 v31 = 2112;
      id v32 = v9;
      __int16 v33 = 2048;
      int64_t v34 = a4;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "%{public}s::%d:Process with token: %@ for grouptype: %ld tried to submit a NULL message ", buf, 0x26u);
    }

    NSErrorUserInfoKey v25 = NSLocalizedFailureReasonErrorKey;
    CFStringRef v26 = @"WAErrorCodeLacksRequiredArgument";
    id v14 = +[NSDictionary dictionaryWithObjects:&v26 forKeys:&v25 count:1];
    uint64_t v21 = 9010;
  }
  uint64_t v18 = +[NSError errorWithDomain:@"com.apple.wifi.analytics.errordomain" code:v21 userInfo:v14];
LABEL_4:

  return v18;
}

- (void)_writeWiFiAnalyticsMessageToJSONFile:(id)a3 metricInfo:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unsigned __int8 v8 = +[NSJSONSerialization isValidJSONObject:v7];
  id v9 = WALogCategoryDefaultHandle();
  id v10 = v9;
  if ((v8 & 1) == 0)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      CFStringRef v24 = "-[WAEngine _writeWiFiAnalyticsMessageToJSONFile:metricInfo:]";
      __int16 v25 = 1024;
      int v26 = 2920;
      __int16 v27 = 2112;
      id v28 = v6;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "%{public}s::%d:Invalid data passed to JSON serialization for %@", buf, 0x1Cu);
    }
    id v16 = 0;
    id v18 = 0;
    id v17 = 0;
    id v13 = 0;
    id v11 = 0;
    id v14 = 0;
    goto LABEL_8;
  }
  if (os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v10, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "_writeWiFiAnalyticsMessageToJSONFile", "", buf, 2u);
  }

  id v11 = objc_alloc_init((Class)NSDateFormatter);
  [v11 setDateFormat:@"yyyy'-'MM'-'dd-HHmmssSSS"];
  CFStringRef v12 = +[NSDate date];
  id v13 = [v11 stringFromDate:v12];

  id v14 = +[NSString stringWithFormat:@"wifianalytics_%@.json", v13];
  id v15 = [(WAEngine *)self wifianalyticsTmpDir];
  id v16 = [v15 URLByAppendingPathComponent:v14 isDirectory:0];

  id v22 = 0;
  id v17 = +[NSJSONSerialization dataWithJSONObject:v7 options:3 error:&v22];
  id v18 = v22;
  if (v18
    || (id v19 = [objc_alloc((Class)NSString) initWithData:v17 encoding:4],
        id v21 = 0,
        [v19 writeToURL:v16 atomically:1 encoding:4 error:&v21],
        id v18 = v21,
        v19,
        v18))
  {
    id v10 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      CFStringRef v24 = "-[WAEngine _writeWiFiAnalyticsMessageToJSONFile:metricInfo:]";
      __int16 v25 = 1024;
      int v26 = 2940;
      __int16 v27 = 2112;
      id v28 = v14;
      __int16 v29 = 2112;
      id v30 = v18;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "%{public}s::%d:failed to write to file %@ error %@", buf, 0x26u);
    }
LABEL_8:
  }
  id v20 = WALogCategoryDefaultHandle();
  if (os_signpost_enabled(v20))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v20, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "_writeWiFiAnalyticsMessageToJSONFile", "", buf, 2u);
  }
}

- (void)_processWAMessageForLogging:(id)a3
{
  id v22 = a3;
  id v3 = WALogCategoryDefaultHandle();
  if (os_signpost_enabled(v3))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v3, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "_processWAMessageForLogging", "", buf, 2u);
  }

  id v21 = +[NSMutableDictionary dictionary];
  if (!v21)
  {
    id v18 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      id v28 = "-[WAEngine _processWAMessageForLogging:]";
      __int16 v29 = 1024;
      int v30 = 2957;
      __int16 v31 = 2080;
      id v32 = "-[WAEngine _processWAMessageForLogging:]";
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "%{public}s::%d:%s: Null logDict", buf, 0x1Cu);
    }
    goto LABEL_16;
  }
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  OSStatus v4 = [v22 metricInfo];
  id v5 = [v4 allKeys];

  id v6 = [v5 countByEnumeratingWithState:&v23 objects:v37 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v24;
    uint64_t v9 = kWAMessageOptions;
    uint64_t v10 = kWAMessageValue;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v24 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v12 = *(void *)(*((void *)&v23 + 1) + 8 * i);
        id v13 = [v22 metricInfo:v21];
        id v14 = [v13 objectForKeyedSubscript:v12];

        id v15 = [v14 objectForKeyedSubscript:v9];
        unsigned __int8 v16 = [v15 integerValue];

        if ((v16 & 4) != 0)
        {
          id v17 = [v14 objectForKeyedSubscript:v10];
          [v21 setObject:v17 forKey:v12];
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v23 objects:v37 count:16];
    }
    while (v7);
  }

  if ([v21 count])
  {
    id v18 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      id v19 = [v22 metricName];
      *(_DWORD *)buf = 136447234;
      id v28 = "-[WAEngine _processWAMessageForLogging:]";
      __int16 v29 = 1024;
      int v30 = 2969;
      __int16 v31 = 2080;
      id v32 = "-[WAEngine _processWAMessageForLogging:]";
      __int16 v33 = 2112;
      int64_t v34 = v19;
      __int16 v35 = 2112;
      int v36 = v21;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:%s: metricName %@ with metricInfo %@", buf, 0x30u);
    }
LABEL_16:
  }
  id v20 = WALogCategoryDefaultHandle();
  if (os_signpost_enabled(v20))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v20, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "_processWAMessageForLogging", "", buf, 2u);
  }
}

- (void)_processWAMessageForNewIORPossibility:(id)a3
{
  id v8 = a3;
  if (([v8 options] & 8) == 0)
  {
    OSStatus v4 = [v8 metricName];
    if ([v4 isEqualToString:kWAMessageMetricNameLinkChange])
    {
    }
    else
    {
      id v5 = [v8 metricName];
      unsigned int v6 = [v5 isEqualToString:kWAMessageMetricNameClientAssociation];

      if (!v6) {
        goto LABEL_6;
      }
    }
  }
  id v7 = [(WAEngine *)self iorMessagePopulator];
  [v7 signalPotentialNewIORChannels];

LABEL_6:
}

- (id)_submitWiFiAnalyticsMessageAdvanced:(id)a3
{
  id v4 = a3;
  id v5 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    unsigned int v6 = [v4 metricName];
    *(_DWORD *)buf = 136446722;
    __int16 v37 = "-[WAEngine _submitWiFiAnalyticsMessageAdvanced:]";
    __int16 v38 = 1024;
    int v39 = 2992;
    __int16 v40 = 2112;
    uint64_t v41 = (uint64_t)v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "%{public}s::%d:Received message %@", buf, 0x1Cu);
  }
  if (!v4)
  {
    id v28 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      __int16 v37 = "-[WAEngine _submitWiFiAnalyticsMessageAdvanced:]";
      __int16 v38 = 1024;
      int v39 = 2994;
      __int16 v40 = 2048;
      uint64_t v41 = 5;
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "%{public}s::%d:for grouptype: %ld tried to submit a NULL message ", buf, 0x1Cu);
    }

    NSErrorUserInfoKey v34 = NSLocalizedFailureReasonErrorKey;
    CFStringRef v35 = @"WAErrorCodeLacksRequiredArgument";
    id v15 = &v35;
    unsigned __int8 v16 = &v34;
    goto LABEL_11;
  }
  uint64_t v7 = [v4 metricName];
  if (!v7
    || (id v8 = (void *)v7,
        [v4 metricInfo],
        uint64_t v9 = objc_claimAutoreleasedReturnValue(),
        v9,
        v8,
        !v9))
  {
    id v14 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      __int16 v37 = "-[WAEngine _submitWiFiAnalyticsMessageAdvanced:]";
      __int16 v38 = 1024;
      int v39 = 2995;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "%{public}s::%d:NULL metricName or NULL metricInfo", buf, 0x12u);
    }

    NSErrorUserInfoKey v32 = NSLocalizedFailureReasonErrorKey;
    CFStringRef v33 = @"WAErrorCodeLacksRequiredArgument";
    id v15 = &v33;
    unsigned __int8 v16 = &v32;
LABEL_11:
    id v17 = +[NSDictionary dictionaryWithObjects:v15 forKeys:v16 count:1];
    id v18 = +[NSError errorWithDomain:@"com.apple.wifi.analytics.errordomain" code:9010 userInfo:v17];

    id v11 = 0;
    goto LABEL_30;
  }
  uint64_t v10 = [v4 metricInfo];
  id v11 = [v10 objectForKeyedSubscript:kWAMessageKeyMetricProcessImmediately];

  if (v11)
  {
    uint64_t v12 = [v11 objectForKeyedSubscript:kWAMessageValue];
    unsigned __int8 v13 = [v12 BOOLValue];
  }
  else
  {
    unsigned __int8 v13 = 0;
  }
  if (([v4 options] & 0x10) != 0)
  {
    id v22 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      long long v23 = [v4 metricName];
      *(_DWORD *)buf = 136446722;
      __int16 v37 = "-[WAEngine _submitWiFiAnalyticsMessageAdvanced:]";
      __int16 v38 = 1024;
      int v39 = 3003;
      __int16 v40 = 2112;
      uint64_t v41 = (uint64_t)v23;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Message has option WiFiAnalyticsMessageTypeManagedFault, processing immediately %@", buf, 0x1Cu);
    }
    [(WAEngine *)self _processWAMessageForNewIORPossibility:v4];
  }
  else
  {
    [(WAEngine *)self _processWAMessageForNewIORPossibility:v4];
    if ((v13 & 1) == 0)
    {
      [(WAEngine *)self analyticsProcessingTimeIntervalSecs];
      if (v19 >= 1.0)
      {
        id v20 = WALogCategoryDefaultHandle();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136446466;
          __int16 v37 = "-[WAEngine _submitWiFiAnalyticsMessageAdvanced:]";
          __int16 v38 = 1024;
          int v39 = 3009;
          _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "%{public}s::%d:Error! Journals are not intended to be processed Immediately", buf, 0x12u);
        }

        NSErrorUserInfoKey v30 = NSLocalizedFailureReasonErrorKey;
        CFStringRef v31 = @"WAErrorCodeLacksRequiredArgument";
        id v21 = +[NSDictionary dictionaryWithObjects:&v31 forKeys:&v30 count:1];
        id v18 = +[NSError errorWithDomain:@"com.apple.wifi.analytics.errordomain" code:9010 userInfo:v21];

        goto LABEL_30;
      }
    }
  }
  long long v24 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    long long v25 = [v4 metricName];
    *(_DWORD *)buf = 136446722;
    __int16 v37 = "-[WAEngine _submitWiFiAnalyticsMessageAdvanced:]";
    __int16 v38 = 1024;
    int v39 = 3011;
    __int16 v40 = 2112;
    uint64_t v41 = (uint64_t)v25;
    _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:%@ Process Immediately: read JSON files", buf, 0x1Cu);
  }
  if (+[WAUtil isWritingWAMessageToJsonAllowed]
    && +[WAUtil isAnalyticsProcessorAllowed])
  {
    long long v26 = [(WAEngine *)self fileHandlingQ];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000598E8;
    block[3] = &unk_1000D0D98;
    void block[4] = self;
    dispatch_async(v26, block);
  }
  if (([v4 options] & 0x10) != 0) {
    [(WAEngine *)self processWiFiAnalyticsManagedFault:v4];
  }
  id v18 = 0;
LABEL_30:

  return v18;
}

- (id)_getMessageByUUID:(id)a3 forProcessToken:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  if (v9)
  {
    uint64_t v10 = [(WAEngine *)self messageStore];

    if (v10)
    {
      id v11 = [(WAEngine *)self messageStore];
      uint64_t v12 = [v11 messageForUUID:v8];

      if (v12)
      {
        unsigned __int8 v13 = 0;
        goto LABEL_5;
      }
      NSErrorUserInfoKey v19 = NSLocalizedFailureReasonErrorKey;
      CFStringRef v20 = @"WAErrorCodeMessageNoMessageForUUID";
      id v17 = +[NSDictionary dictionaryWithObjects:&v20 forKeys:&v19 count:1];
      uint64_t v18 = 9004;
    }
    else
    {
      NSErrorUserInfoKey v21 = NSLocalizedFailureReasonErrorKey;
      CFStringRef v22 = @"WAErrorCodeInternalError";
      id v17 = +[NSDictionary dictionaryWithObjects:&v22 forKeys:&v21 count:1];
      uint64_t v18 = 9003;
    }
    unsigned __int8 v13 = +[NSError errorWithDomain:@"com.apple.wifi.analytics.errordomain" code:v18 userInfo:v17];

    uint64_t v12 = 0;
    if (a5 && v13)
    {
      uint64_t v12 = 0;
      *a5 = [v13 copy];
    }
  }
  else
  {
    NSErrorUserInfoKey v23 = NSLocalizedFailureReasonErrorKey;
    CFStringRef v24 = @"WAErrorCodeInternalError";
    id v15 = +[NSDictionary dictionaryWithObjects:&v24 forKeys:&v23 count:1];
    id v16 = +[NSError errorWithDomain:@"com.apple.wifi.analytics.errordomain" code:9003 userInfo:v15];

    unsigned __int8 v13 = 0;
    uint64_t v12 = 0;
  }
LABEL_5:

  return v12;
}

- (void)_killDaemonAndReply:(id)a3
{
  id v4 = a3;
  if (v4) {
    (*((void (**)(id, void, void))v4 + 2))(v4, 0, 0);
  }
  [(WAEngine *)self _prepareToTerminate];
  exit(143);
}

- (void)_clearMessageStoreAndReply:(id)a3
{
  id v6 = a3;
  id v4 = [(WAEngine *)self messageStore];
  [v4 clearMessageStore];

  [(WAEngine *)self _persist];
  id v5 = v6;
  if (v6)
  {
    (*((void (**)(id, void, void))v6 + 2))(v6, 0, 0);
    id v5 = v6;
  }
}

- (void)_purgeGroupTypeIfNecessary:(int64_t)a3
{
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v4 = [(WAEngine *)self processTokenToGroupTypeMap];
  id v5 = [v4 allKeys];

  id v6 = [v5 countByEnumeratingWithState:&v30 objects:v43 count:16];
  if (v6)
  {
    id v7 = v6;
    id v8 = 0;
    uint64_t v9 = *(void *)v31;
    id obj = v5;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v31 != v9) {
          objc_enumerationMutation(obj);
        }
        id v11 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        long long v26 = 0u;
        long long v27 = 0u;
        long long v28 = 0u;
        long long v29 = 0u;
        uint64_t v12 = [(WAEngine *)self processTokenToGroupTypeMap];
        unsigned __int8 v13 = [v12 objectForKeyedSubscript:v11];

        id v14 = [v13 countByEnumeratingWithState:&v26 objects:v42 count:16];
        if (v14)
        {
          id v15 = v14;
          uint64_t v16 = *(void *)v27;
          while (2)
          {
            for (j = 0; j != v15; j = (char *)j + 1)
            {
              if (*(void *)v27 != v16) {
                objc_enumerationMutation(v13);
              }
              if ([*(id *)(*((void *)&v26 + 1) + 8 * (void)j) integerValue] == (id)a3)
              {
                uint64_t v18 = v11;

                id v8 = v18;
                goto LABEL_16;
              }
            }
            id v15 = [v13 countByEnumeratingWithState:&v26 objects:v42 count:16];
            if (v15) {
              continue;
            }
            break;
          }
        }
LABEL_16:
      }
      id v7 = [obj countByEnumeratingWithState:&v30 objects:v43 count:16];
    }
    while (v7);

    if (v8)
    {
      NSErrorUserInfoKey v19 = WALogCategoryDefaultHandle();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        CFStringRef v20 = +[WAUtil trimTokenForLogging:v8];
        *(_DWORD *)buf = 136446978;
        CFStringRef v35 = "-[WAEngine _purgeGroupTypeIfNecessary:]";
        __int16 v36 = 1024;
        int v37 = 3070;
        __int16 v38 = 2048;
        int64_t v39 = a3;
        __int16 v40 = 2112;
        uint64_t v41 = v20;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:XPC: Found an old token for WAGroupType: %ld (%@). Purging it now as a process is trying to register for the same group type", buf, 0x26u);
      }
      NSErrorUserInfoKey v21 = [(WAEngine *)self processTokenToGroupTypeMap];
      [v21 removeObjectForKey:v8];

      CFStringRef v22 = [(WAEngine *)self submitterMap];
      [v22 removeObjectForKey:v8];

      NSErrorUserInfoKey v23 = [(WAEngine *)self processTokenToXPCConnectionMap];
      [v23 removeObjectForKey:v8];

      goto LABEL_25;
    }
  }
  else
  {
  }
  id v8 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136446722;
    CFStringRef v35 = "-[WAEngine _purgeGroupTypeIfNecessary:]";
    __int16 v36 = 1024;
    int v37 = 3069;
    __int16 v38 = 2048;
    int64_t v39 = a3;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "%{public}s::%d:XPC: No old tokens for newly registered WAGroupType: %ld - no purge necessary.", buf, 0x1Cu);
  }
LABEL_25:
}

- (void)_sendMemoryPressureRequestAndReply:(id)a3
{
  id v5 = a3;
  [(WAEngine *)self handleMemoryWarning:1];
  id v4 = v5;
  if (v5)
  {
    (*((void (**)(id, void, void))v5 + 2))(v5, 0, 0);
    id v4 = v5;
  }
}

- (void)_issueIOReportManagementCommand:(unint64_t)a3 forProcessToken:(id)a4 andReply:(id)a5
{
  id v8 = a4;
  id v144 = a5;
  id v9 = objc_alloc_init((Class)NSMutableDictionary);
  uint64_t v10 = +[NSNumber numberWithUnsignedInteger:a3];
  [v9 setObject:v10 forKeyedSubscript:@"Command"];

  [v9 setObject:&__kCFBooleanFalse forKeyedSubscript:@"Success"];
  id v11 = [(WAEngine *)self submitterMap];
  uint64_t v12 = [v11 objectForKeyedSubscript:v8];
  unsigned __int8 v13 = +[NSNumber numberWithInteger:3];
  id v14 = [v12 objectForKeyedSubscript:v13];

  if (!v14)
  {
    id v15 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      *(void *)&uint8_t buf[4] = "-[WAEngine _issueIOReportManagementCommand:forProcessToken:andReply:]";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 3098;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%{public}s::%d:Caller did not register", buf, 0x12u);
    }

    if (v8)
    {
      uint64_t v16 = [(WAEngine *)self processTokenToGroupTypeMap];
      id v17 = [v16 objectForKeyedSubscript:v8];
      uint64_t v18 = +[NSNumber numberWithInteger:3];
      unsigned int v19 = [v17 containsObject:v18];

      if (!v19)
      {
        [(WAEngine *)self _purgeGroupTypeIfNecessary:3];
        CFStringRef v20 = [(WAEngine *)self processTokenToGroupTypeMap];
        NSErrorUserInfoKey v21 = [v20 objectForKeyedSubscript:v8];

        if (!v21)
        {
          id v22 = objc_alloc_init((Class)NSMutableSet);
          NSErrorUserInfoKey v23 = [(WAEngine *)self processTokenToGroupTypeMap];
          [v23 setObject:v22 forKeyedSubscript:v8];
        }
        CFStringRef v24 = [(WAEngine *)self processTokenToGroupTypeMap];
        long long v25 = [v24 objectForKeyedSubscript:v8];
        long long v26 = +[NSNumber numberWithInteger:3];
        [v25 addObject:v26];

        [(WAEngine *)self _persist];
        long long v27 = WALogCategoryDefaultHandle();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
        {
          long long v28 = +[WAUtil trimTokenForLogging:v8];
          *(_DWORD *)buf = 136446978;
          *(void *)&uint8_t buf[4] = "-[WAEngine _issueIOReportManagementCommand:forProcessToken:andReply:]";
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = 3110;
          __int16 v167 = 2048;
          uint64_t v168 = 3;
          __int16 v169 = 2112;
          id v170 = v28;
          _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEBUG, "%{public}s::%d:XPC: registering message group type: %ld for process: %@", buf, 0x26u);
        }
        goto LABEL_11;
      }
      v130 = WALogCategoryDefaultHandle();
      if (os_log_type_enabled(v130, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446722;
        *(void *)&uint8_t buf[4] = "-[WAEngine _issueIOReportManagementCommand:forProcessToken:andReply:]";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = 3100;
        __int16 v167 = 2048;
        uint64_t v168 = 3;
        _os_log_impl((void *)&_mh_execute_header, v130, OS_LOG_TYPE_ERROR, "%{public}s::%d:XPC: processTokenToGroupTypeMap seems to think this process token has already registered group type: %ld", buf, 0x1Cu);
      }

      NSErrorUserInfoKey v127 = NSLocalizedFailureReasonErrorKey;
    }
    else
    {
      int v126 = WALogCategoryDefaultHandle();
      if (os_log_type_enabled(v126, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136446466;
        *(void *)&uint8_t buf[4] = "-[WAEngine _issueIOReportManagementCommand:forProcessToken:andReply:]";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = 3099;
        _os_log_impl((void *)&_mh_execute_header, v126, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:couldn't get process name for connection", buf, 0x12u);
      }

      NSErrorUserInfoKey v127 = NSLocalizedFailureReasonErrorKey;
      NSErrorUserInfoKey v171 = NSLocalizedFailureReasonErrorKey;
      CFStringRef v172 = @"WAErrorCodeInternalError";
      v128 = +[NSDictionary dictionaryWithObjects:&v172 forKeys:&v171 count:1];
      v129 = +[NSError errorWithDomain:@"com.apple.wifi.analytics.errordomain" code:9003 userInfo:v128];
    }
    NSErrorUserInfoKey v148 = v127;
    CFStringRef v149 = @"WAErrorCodeInternalError";
    v131 = +[NSDictionary dictionaryWithObjects:&v149 forKeys:&v148 count:1];
    v76 = +[NSError errorWithDomain:@"com.apple.wifi.analytics.errordomain" code:9003 userInfo:v131];

    id v56 = (void (**)(void, void, void))v144;
    (*((void (**)(id, void, void *))v144 + 2))(v144, 0, v76);
    goto LABEL_133;
  }
LABEL_11:
  switch(a3)
  {
    case 0uLL:
      long long v29 = WALogCategoryDefaultHandle();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136446466;
        *(void *)&uint8_t buf[4] = "-[WAEngine _issueIOReportManagementCommand:forProcessToken:andReply:]";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = 3115;
        _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEBUG, "%{public}s::%d:kWAIORCommandReloadViaUnpersist start", buf, 0x12u);
      }

      [(WAEngine *)self setIorMessagePopulator:0];
      size_t v147 = 0;
      long long v30 = [(WAEngine *)self _getObscureKey];
      self->_BOOL readingPersistFile = 1;
      id v31 = objc_alloc((Class)NSData);
      long long v32 = NSHomeDirectory();
      long long v33 = +[NSString stringWithFormat:@"%@%@t.out", v32, @"/Library/com.apple.wifianalyticsd/.wa/"];
      id v34 = [v31 initWithContentsOfFile:v33 options:1 error:0];

      id v35 = [v34 length];
      memset(key, 0, 33);
      id v143 = v34;
      if (!v34)
      {
        v85 = WALogCategoryDefaultHandle();
        if (os_log_type_enabled(v85, OS_LOG_TYPE_ERROR))
        {
          uint64_t v86 = NSHomeDirectory();
          v87 = +[NSString stringWithFormat:@"%@%@t.out", v86, @"/Library/com.apple.wifianalyticsd/.wa/"];
          *(_DWORD *)buf = 136446722;
          *(void *)&uint8_t buf[4] = "-[WAEngine _issueIOReportManagementCommand:forProcessToken:andReply:]";
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = 3134;
          __int16 v167 = 2112;
          uint64_t v168 = (uint64_t)v87;
          _os_log_impl((void *)&_mh_execute_header, v85, OS_LOG_TYPE_ERROR, "%{public}s::%d:No persistence file %@", buf, 0x1Cu);
        }
        NSErrorUserInfoKey v163 = NSLocalizedFailureReasonErrorKey;
        CFStringRef v164 = @"WAErrorCodeNoPersistenceFile";
        uint64_t v88 = +[NSDictionary dictionaryWithObjects:&v164 forKeys:&v163 count:1];
        v76 = +[NSError errorWithDomain:@"com.apple.wifi.analytics.errordomain" code:9031 userInfo:v88];

        CFStringRef v89 = @"No persistence file";
        goto LABEL_93;
      }
      if (!v30)
      {
        uint64_t v90 = WALogCategoryDefaultHandle();
        if (os_log_type_enabled(v90, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136446466;
          *(void *)&uint8_t buf[4] = "-[WAEngine _issueIOReportManagementCommand:forProcessToken:andReply:]";
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = 3141;
          _os_log_impl((void *)&_mh_execute_header, v90, OS_LOG_TYPE_ERROR, "%{public}s::%d:Couldn't get key to unobscure persistence file, triggering removal of persistence file", buf, 0x12u);
        }

        [(WAEngine *)self _removePersistenceFile];
        NSErrorUserInfoKey v161 = NSLocalizedFailureReasonErrorKey;
        CFStringRef v162 = @"WAErrorCodeNoObscureKeyFile";
        uint64_t v91 = +[NSDictionary dictionaryWithObjects:&v162 forKeys:&v161 count:1];
        v76 = +[NSError errorWithDomain:@"com.apple.wifi.analytics.errordomain" code:9032 userInfo:v91];

        CFStringRef v89 = @"No unobscure persistence file";
        goto LABEL_93;
      }
      size_t v139 = (size_t)v35;
      size_t dataOutAvailable = (size_t)v35 + 16;
      [v30 getCString:key maxLength:33 encoding:4];
      int v37 = WALogCategoryDefaultHandle();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
      {
        id v38 = [v30 length];
        *(_DWORD *)buf = 136446722;
        *(void *)&uint8_t buf[4] = "-[WAEngine _issueIOReportManagementCommand:forProcessToken:andReply:]";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = 3150;
        __int16 v167 = 2048;
        uint64_t v168 = (uint64_t)v38;
        _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:kWAIORCommandReloadViaUnpersist got unobscuring key %lu bytes", buf, 0x1Cu);
      }

      int64_t v39 = malloc_type_malloc(dataOutAvailable, 0xF6A05940uLL);
      __int16 v40 = WALogCategoryDefaultHandle();
      uint64_t v41 = v40;
      dataOut = v39;
      if (!v39)
      {
        if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136446466;
          *(void *)&uint8_t buf[4] = "-[WAEngine _issueIOReportManagementCommand:forProcessToken:andReply:]";
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = 3154;
          _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_ERROR, "%{public}s::%d:Couldn't allocate buffer to unobscure persistence data", buf, 0x12u);
        }

        NSErrorUserInfoKey v159 = NSLocalizedFailureReasonErrorKey;
        CFStringRef v160 = @"WAErrorCodeInternalError";
        v92 = +[NSDictionary dictionaryWithObjects:&v160 forKeys:&v159 count:1];
        v76 = +[NSError errorWithDomain:@"com.apple.wifi.analytics.errordomain" code:9003 userInfo:v92];

        CFStringRef v89 = @"malloc failed";
LABEL_93:
        [v9 setObject:v89 forKeyedSubscript:@"Details"];
        id v47 = v143;
        id v56 = (void (**)(void, void, void))v144;
        goto LABEL_128;
      }
      if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136446722;
        *(void *)&uint8_t buf[4] = "-[WAEngine _issueIOReportManagementCommand:forProcessToken:andReply:]";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = 3160;
        __int16 v167 = 2048;
        uint64_t v168 = dataOutAvailable;
        _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:kWAIORCommandReloadViaUnpersist malloced %lu bytes", buf, 0x1Cu);
      }

      long long v42 = [(WAEngine *)self _getDataFromKeychain:@"com.apple.wifi.analytics.persistence-iv"];
      uint64_t v43 = [(WAEngine *)self _getDataFromKeychain:@"com.apple.wifi.analytics.persistence-tag"];
      v137 = (void *)v43;
      id v138 = v42;
      if (v42 && (__int16 v44 = (void *)v43) != 0)
      {
        int v45 = [v42 bytes];
        int v46 = v45[2];
        v157[1] = *(void *)v45;
        int v158 = v46;
        *(_OWORD *)buf = *(_OWORD *)[v44 bytes];
        id v47 = v143;
        [v143 bytes];
        __int16 v48 = dataOut;
        int v49 = CCCryptorGCMOneshotDecrypt();
        size_t v147 = v139;
      }
      else
      {
        uint64_t v93 = WALogCategoryDefaultHandle();
        if (os_log_type_enabled(v93, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136446722;
          *(void *)&uint8_t buf[4] = "-[WAEngine _issueIOReportManagementCommand:forProcessToken:andReply:]";
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = 3178;
          __int16 v167 = 2080;
          uint64_t v168 = (uint64_t)"-[WAEngine _issueIOReportManagementCommand:forProcessToken:andReply:]";
          _os_log_impl((void *)&_mh_execute_header, v93, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:%s: IV and tag not found", buf, 0x1Cu);
        }

        id v47 = v143;
        __int16 v48 = dataOut;
        int v49 = CCCrypt(1u, 0, 1u, key, 0x20uLL, 0, [v143 bytes], v139, dataOut, dataOutAvailable, &v147);
      }
      self->_BOOL readingPersistFile = 0;
      if (v49)
      {
        v94 = WALogCategoryDefaultHandle();
        if (os_log_type_enabled(v94, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136446978;
          *(void *)&uint8_t buf[4] = "-[WAEngine _issueIOReportManagementCommand:forProcessToken:andReply:]";
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = 3186;
          __int16 v167 = 2080;
          uint64_t v168 = (uint64_t)"-[WAEngine _issueIOReportManagementCommand:forProcessToken:andReply:]";
          __int16 v169 = 1024;
          LODWORD(v170) = v49;
          _os_log_impl((void *)&_mh_execute_header, v94, OS_LOG_TYPE_ERROR, "%{public}s::%d:%s: Failed to unobscure: %d", buf, 0x22u);
        }

        free(v48);
        NSErrorUserInfoKey v156 = NSLocalizedFailureReasonErrorKey;
        v157[0] = @"WAErrorCodeInternalError";
        v95 = +[NSDictionary dictionaryWithObjects:v157 forKeys:&v156 count:1];
        v76 = +[NSError errorWithDomain:@"com.apple.wifi.analytics.errordomain" code:9003 userInfo:v95];

        [v9 setObject:@"CCCrypt failed" forKeyedSubscript:@"Details"];
        id v56 = (void (**)(void, void, void))v144;
        int v96 = v137;
        goto LABEL_127;
      }
      v140 = v30;
      id v97 = objc_alloc((Class)NSData);
      id v98 = [v97 initWithBytes:v48 length:v147];
      uint64_t v135 = objc_opt_class();
      uint64_t v134 = objc_opt_class();
      uint64_t v133 = objc_opt_class();
      uint64_t v132 = objc_opt_class();
      uint64_t v99 = objc_opt_class();
      uint64_t v100 = objc_opt_class();
      uint64_t v101 = objc_opt_class();
      uint64_t v102 = objc_opt_class();
      v103 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v135, v134, v133, v132, v99, v100, v101, v102, objc_opt_class(), 0);
      id v146 = 0;
      v136 = v98;
      uint64_t v104 = +[NSKeyedUnarchiver unarchivedObjectOfClasses:v103 fromData:v98 error:&v146];
      id v105 = v146;

      if (v105)
      {
        v106 = WALogCategoryDefaultHandle();
        if (os_log_type_enabled(v106, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136446722;
          *(void *)&uint8_t buf[4] = "-[WAEngine _issueIOReportManagementCommand:forProcessToken:andReply:]";
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = 3197;
          __int16 v167 = 2112;
          uint64_t v168 = (uint64_t)v105;
          _os_log_impl((void *)&_mh_execute_header, v106, OS_LOG_TYPE_ERROR, "%{public}s::%d:Failed to unarchive root persistence dict: %@", buf, 0x1Cu);
        }

        NSErrorUserInfoKey v154 = NSLocalizedFailureReasonErrorKey;
        CFStringRef v155 = @"WAErrorCodeInternalError";
        v107 = +[NSDictionary dictionaryWithObjects:&v155 forKeys:&v154 count:1];
        v76 = +[NSError errorWithDomain:@"com.apple.wifi.analytics.errordomain" code:9003 userInfo:v107];

        [v9 setObject:@"Failed to unarchive root persistence" forKeyedSubscript:@"Details"];
      }
      else
      {
        v76 = 0;
      }
      free(dataOut);
      objc_super v108 = WALogCategoryDefaultHandle();
      if (os_log_type_enabled(v108, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136446466;
        *(void *)&uint8_t buf[4] = "-[WAEngine _issueIOReportManagementCommand:forProcessToken:andReply:]";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = 3205;
        _os_log_impl((void *)&_mh_execute_header, v108, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:kWAIORCommandReloadViaUnpersist NSKeyedUnarchiver complete", buf, 0x12u);
      }

      v142 = v104;
      v109 = [v104 objectForKeyedSubscript:@"WA_PERSIST_IOREPORTER_REGISTRATIONS"];
      if (!v109) {
        goto LABEL_121;
      }
      v110 = WALogCategoryDefaultHandle();
      if (os_log_type_enabled(v110, OS_LOG_TYPE_DEFAULT))
      {
        id v111 = [v109 length];
        *(_DWORD *)buf = 136446722;
        *(void *)&uint8_t buf[4] = "-[WAEngine _issueIOReportManagementCommand:forProcessToken:andReply:]";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = 3210;
        __int16 v167 = 2048;
        uint64_t v168 = (uint64_t)v111;
        _os_log_impl((void *)&_mh_execute_header, v110, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:iorReporterWrapperData size: %lu", buf, 0x1Cu);
      }

      uint64_t v112 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v109 length]);
      [v9 setObject:v112 forKeyedSubscript:@"iorReporterWrapperData size"];

      id v145 = 0;
      __int16 v113 = v109;
      int v114 = +[NSKeyedUnarchiver unarchivedObjectOfClass:objc_opt_class() fromData:v109 error:&v145];
      id v115 = v145;
      if (v115)
      {
        uint64_t v116 = v115;
        uint64_t v117 = WALogCategoryDefaultHandle();
        if (os_log_type_enabled(v117, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136446722;
          *(void *)&uint8_t buf[4] = "-[WAEngine _issueIOReportManagementCommand:forProcessToken:andReply:]";
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = 3215;
          __int16 v167 = 2112;
          uint64_t v168 = (uint64_t)v116;
          _os_log_impl((void *)&_mh_execute_header, v117, OS_LOG_TYPE_ERROR, "%{public}s::%d:Failed to unarchive WAIOReporterMessagePopulator: %@", buf, 0x1Cu);
        }

        NSErrorUserInfoKey v152 = NSLocalizedFailureReasonErrorKey;
        CFStringRef v153 = @"WAErrorCodeInternalError";
        uint64_t v118 = +[NSDictionary dictionaryWithObjects:&v153 forKeys:&v152 count:1];
        uint64_t v119 = +[NSError errorWithDomain:@"com.apple.wifi.analytics.errordomain" code:9003 userInfo:v118];

        [v9 setObject:@"Failed to unarchive WAIOReporterMessagePopulator" forKeyedSubscript:@"Details"];
        v76 = (void *)v119;
      }
      if (!v114)
      {
        v109 = v113;
LABEL_121:
        __int16 v113 = v109;
        id v121 = WALogCategoryDefaultHandle();
        if (os_log_type_enabled(v121, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136446466;
          *(void *)&uint8_t buf[4] = "-[WAEngine _issueIOReportManagementCommand:forProcessToken:andReply:]";
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = 3227;
          _os_log_impl((void *)&_mh_execute_header, v121, OS_LOG_TYPE_ERROR, "%{public}s::%d:Failed to unpersist, alloc new WAIOReporterMessagePopulator", buf, 0x12u);
        }

        int v114 = objc_alloc_init(WAIOReporterMessagePopulator);
        [(WAEngine *)self setIorMessagePopulator:v114];
        goto LABEL_124;
      }
      v120 = WALogCategoryDefaultHandle();
      if (os_log_type_enabled(v120, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136446466;
        *(void *)&uint8_t buf[4] = "-[WAEngine _issueIOReportManagementCommand:forProcessToken:andReply:]";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = 3223;
        _os_log_impl((void *)&_mh_execute_header, v120, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Unpersisting Success", buf, 0x12u);
      }

      [(WAEngine *)self setIorMessagePopulator:v114];
      [v9 setObject:&__kCFBooleanTrue forKeyedSubscript:@"Success"];
LABEL_124:
      id v56 = (void (**)(void, void, void))v144;

      v122 = [(WAEngine *)self iorMessagePopulator];
      [v122 setMessageDelegate:self];

      id v123 = [(WAEngine *)self iorMessagePopulator];
      [v123 setPersistenceDelegate:self];

      id v124 = WALogCategoryDefaultHandle();
      int v96 = v137;
      if (os_log_type_enabled(v124, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136446466;
        *(void *)&uint8_t buf[4] = "-[WAEngine _issueIOReportManagementCommand:forProcessToken:andReply:]";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = 3234;
        _os_log_impl((void *)&_mh_execute_header, v124, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:kWAIORCommandReloadViaUnpersist end", buf, 0x12u);
      }

      long long v30 = v140;
      id v47 = v143;
LABEL_127:

LABEL_128:
LABEL_129:
      int v125 = WALogCategoryDefaultHandle();
      if (os_log_type_enabled(v125, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136446722;
        *(void *)&uint8_t buf[4] = "-[WAEngine _issueIOReportManagementCommand:forProcessToken:andReply:]";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = 3332;
        __int16 v167 = 2112;
        uint64_t v168 = (uint64_t)v9;
        _os_log_impl((void *)&_mh_execute_header, v125, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Replying Now msg %@", buf, 0x1Cu);
      }

      if (v56) {
        ((void (**)(void, id, void *))v56)[2](v56, v9, v76);
      }
LABEL_133:

      return;
    case 1uLL:
      CFStringRef v54 = WALogCategoryDefaultHandle();
      if (os_log_type_enabled(v54, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136446466;
        *(void *)&uint8_t buf[4] = "-[WAEngine _issueIOReportManagementCommand:forProcessToken:andReply:]";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = 3238;
        _os_log_impl((void *)&_mh_execute_header, v54, OS_LOG_TYPE_DEBUG, "%{public}s::%d:kWAIORCommandBuildSubscription start", buf, 0x12u);
      }

      id v55 = WALogCategoryDefaultHandle();
      id v56 = (void (**)(void, void, void))v144;
      if (os_log_type_enabled(v55, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136446466;
        *(void *)&uint8_t buf[4] = "-[WAEngine _issueIOReportManagementCommand:forProcessToken:andReply:]";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = 3240;
        _os_log_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_DEBUG, "%{public}s::%d:kWAIORCommandBuildSubscription running [self.iorMessagePopulator determineChannelsPerIORPopulatable];",
          buf,
          0x12u);
      }

      uint64_t v57 = [(WAEngine *)self iorMessagePopulator];
      [v57 determineChannelsPerIORPopulatable];

      [v9 setObject:&__kCFBooleanTrue forKeyedSubscript:@"Success"];
      uint64_t v58 = WALogCategoryDefaultHandle();
      if (!os_log_type_enabled(v58, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_71;
      }
      *(_DWORD *)buf = 136446466;
      *(void *)&uint8_t buf[4] = "-[WAEngine _issueIOReportManagementCommand:forProcessToken:andReply:]";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 3244;
      long long v59 = "%{public}s::%d:kWAIORCommandBuildSubscription end";
      goto LABEL_70;
    case 2uLL:
      long long v60 = WALogCategoryDefaultHandle();
      if (os_log_type_enabled(v60, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136446466;
        *(void *)&uint8_t buf[4] = "-[WAEngine _issueIOReportManagementCommand:forProcessToken:andReply:]";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = 3248;
        _os_log_impl((void *)&_mh_execute_header, v60, OS_LOG_TYPE_DEBUG, "%{public}s::%d:kWAIORCommandErrorNextCreateOrUpdateSample start", buf, 0x12u);
      }

      long long v61 = WALogCategoryDefaultHandle();
      id v56 = (void (**)(void, void, void))v144;
      if (os_log_type_enabled(v61, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136446466;
        *(void *)&uint8_t buf[4] = "-[WAEngine _issueIOReportManagementCommand:forProcessToken:andReply:]";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = 3250;
        _os_log_impl((void *)&_mh_execute_header, v61, OS_LOG_TYPE_DEBUG, "%{public}s::%d:kWAIORCommandErrorNextCreateOrUpdateSample running [self.iorMessagePopulator injectErrorOnNextCreateOrUpdateSample];",
          buf,
          0x12u);
      }

      long long v62 = [(WAEngine *)self iorMessagePopulator];
      [v62 injectErrorOnNextCreateOrUpdateSample];

      [v9 setObject:&__kCFBooleanTrue forKeyedSubscript:@"Success"];
      uint64_t v58 = WALogCategoryDefaultHandle();
      if (!os_log_type_enabled(v58, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_71;
      }
      *(_DWORD *)buf = 136446466;
      *(void *)&uint8_t buf[4] = "-[WAEngine _issueIOReportManagementCommand:forProcessToken:andReply:]";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 3254;
      long long v59 = "%{public}s::%d:kWAIORCommandErrorNextCreateOrUpdateSample end";
      goto LABEL_70;
    case 3uLL:
      long long v63 = WALogCategoryDefaultHandle();
      if (os_log_type_enabled(v63, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136446466;
        *(void *)&uint8_t buf[4] = "-[WAEngine _issueIOReportManagementCommand:forProcessToken:andReply:]";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = 3258;
        _os_log_impl((void *)&_mh_execute_header, v63, OS_LOG_TYPE_DEBUG, "%{public}s::%d:kWAIORCommandPersist start", buf, 0x12u);
      }

      long long v64 = WALogCategoryDefaultHandle();
      id v56 = (void (**)(void, void, void))v144;
      if (os_log_type_enabled(v64, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136446466;
        *(void *)&uint8_t buf[4] = "-[WAEngine _issueIOReportManagementCommand:forProcessToken:andReply:]";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = 3260;
        _os_log_impl((void *)&_mh_execute_header, v64, OS_LOG_TYPE_DEBUG, "%{public}s::%d:kWAIORCommandPersist running [self _persist];",
          buf,
          0x12u);
      }

      [(WAEngine *)self _persist];
      long long v65 = WALogCategoryDefaultHandle();
      if (os_log_type_enabled(v65, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136446466;
        *(void *)&uint8_t buf[4] = "-[WAEngine _issueIOReportManagementCommand:forProcessToken:andReply:]";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = 3263;
        _os_log_impl((void *)&_mh_execute_header, v65, OS_LOG_TYPE_DEBUG, "%{public}s::%d:kWAIORCommandPersist running [self.iorMessagePopulator persistIORObjects];",
          buf,
          0x12u);
      }

      long long v66 = [(WAEngine *)self iorMessagePopulator];
      [v66 persistIORObjects:0];

      [v9 setObject:&__kCFBooleanTrue forKeyedSubscript:@"Success"];
      uint64_t v58 = WALogCategoryDefaultHandle();
      if (!os_log_type_enabled(v58, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_71;
      }
      *(_DWORD *)buf = 136446466;
      *(void *)&uint8_t buf[4] = "-[WAEngine _issueIOReportManagementCommand:forProcessToken:andReply:]";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 3267;
      long long v59 = "%{public}s::%d:kWAIORCommandPersist end";
      goto LABEL_70;
    case 4uLL:
      uint64_t v67 = WALogCategoryDefaultHandle();
      if (os_log_type_enabled(v67, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136446466;
        *(void *)&uint8_t buf[4] = "-[WAEngine _issueIOReportManagementCommand:forProcessToken:andReply:]";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = 3271;
        _os_log_impl((void *)&_mh_execute_header, v67, OS_LOG_TYPE_DEBUG, "%{public}s::%d:kWAIORCommandClearCaches start", buf, 0x12u);
      }

      v68 = WALogCategoryDefaultHandle();
      id v56 = (void (**)(void, void, void))v144;
      if (os_log_type_enabled(v68, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136446466;
        *(void *)&uint8_t buf[4] = "-[WAEngine _issueIOReportManagementCommand:forProcessToken:andReply:]";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = 3273;
        _os_log_impl((void *)&_mh_execute_header, v68, OS_LOG_TYPE_DEBUG, "%{public}s::%d:kWAIORCommandClearCaches running [self.iorMessagePopulator freeIORCaches];",
          buf,
          0x12u);
      }

      __int16 v69 = [(WAEngine *)self iorMessagePopulator];
      [v69 freeIORCaches];

      [v9 setObject:&__kCFBooleanTrue forKeyedSubscript:@"Success"];
      uint64_t v58 = WALogCategoryDefaultHandle();
      if (!os_log_type_enabled(v58, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_71;
      }
      *(_DWORD *)buf = 136446466;
      *(void *)&uint8_t buf[4] = "-[WAEngine _issueIOReportManagementCommand:forProcessToken:andReply:]";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 3277;
      long long v59 = "%{public}s::%d:kWAIORCommandClearCaches end";
      goto LABEL_70;
    case 5uLL:
      int v70 = WALogCategoryDefaultHandle();
      if (os_log_type_enabled(v70, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136446466;
        *(void *)&uint8_t buf[4] = "-[WAEngine _issueIOReportManagementCommand:forProcessToken:andReply:]";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = 3281;
        _os_log_impl((void *)&_mh_execute_header, v70, OS_LOG_TYPE_DEBUG, "%{public}s::%d:kWAIORCommandRemovePersistFiles start", buf, 0x12u);
      }

      __int16 v71 = WALogCategoryDefaultHandle();
      id v56 = (void (**)(void, void, void))v144;
      if (os_log_type_enabled(v71, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136446466;
        *(void *)&uint8_t buf[4] = "-[WAEngine _issueIOReportManagementCommand:forProcessToken:andReply:]";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = 3283;
        _os_log_impl((void *)&_mh_execute_header, v71, OS_LOG_TYPE_DEBUG, "%{public}s::%d:kWAIORCommandClearCaches running [self _removePersistenceFile];",
          buf,
          0x12u);
      }

      [(WAEngine *)self _removePersistenceFile];
      [v9 setObject:&__kCFBooleanTrue forKeyedSubscript:@"Success"];
      uint64_t v58 = WALogCategoryDefaultHandle();
      if (!os_log_type_enabled(v58, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_71;
      }
      *(_DWORD *)buf = 136446466;
      *(void *)&uint8_t buf[4] = "-[WAEngine _issueIOReportManagementCommand:forProcessToken:andReply:]";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 3287;
      long long v59 = "%{public}s::%d:kWAIORCommandRemovePersistFiles end";
      goto LABEL_70;
    case 6uLL:
      CFStringRef v72 = WALogCategoryDefaultHandle();
      if (os_log_type_enabled(v72, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136446466;
        *(void *)&uint8_t buf[4] = "-[WAEngine _issueIOReportManagementCommand:forProcessToken:andReply:]";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = 3291;
        _os_log_impl((void *)&_mh_execute_header, v72, OS_LOG_TYPE_DEBUG, "%{public}s::%d:kWAIORCommandRunIOLegendTest start", buf, 0x12u);
      }

      __int16 v73 = WALogCategoryDefaultHandle();
      id v56 = (void (**)(void, void, void))v144;
      if (os_log_type_enabled(v73, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136446466;
        *(void *)&uint8_t buf[4] = "-[WAEngine _issueIOReportManagementCommand:forProcessToken:andReply:]";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = 3293;
        _os_log_impl((void *)&_mh_execute_header, v73, OS_LOG_TYPE_DEBUG, "%{public}s::%d:kWAIORCommandRunIOLegendTest running [self.iorMessagePopulator runIOLegendTest];",
          buf,
          0x12u);
      }

      uint64_t v74 = [(WAEngine *)self iorMessagePopulator];
      unsigned __int8 v75 = [v74 runIOLegendTest];

      if (v75)
      {
        v76 = 0;
        uint64_t v77 = &__kCFBooleanTrue;
      }
      else
      {
        NSErrorUserInfoKey v150 = NSLocalizedFailureReasonErrorKey;
        CFStringRef v151 = @"WAErrorCodeInternalError";
        v83 = +[NSDictionary dictionaryWithObjects:&v151 forKeys:&v150 count:1];
        v76 = +[NSError errorWithDomain:@"com.apple.wifi.analytics.errordomain" code:9003 userInfo:v83];

        uint64_t v77 = &__kCFBooleanFalse;
      }
      [v9 setObject:v77 forKeyedSubscript:@"Success"];
      v84 = WALogCategoryDefaultHandle();
      if (os_log_type_enabled(v84, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136446466;
        *(void *)&uint8_t buf[4] = "-[WAEngine _issueIOReportManagementCommand:forProcessToken:andReply:]";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = 3301;
        _os_log_impl((void *)&_mh_execute_header, v84, OS_LOG_TYPE_DEBUG, "%{public}s::%d:kWAIORCommandRunIOLegendTest end", buf, 0x12u);
      }

      goto LABEL_129;
    case 7uLL:
      v78 = WALogCategoryDefaultHandle();
      if (os_log_type_enabled(v78, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136446466;
        *(void *)&uint8_t buf[4] = "-[WAEngine _issueIOReportManagementCommand:forProcessToken:andReply:]";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = 3305;
        _os_log_impl((void *)&_mh_execute_header, v78, OS_LOG_TYPE_DEBUG, "%{public}s::%d:kWAIORCommandScanPredicatesNotYetFound start", buf, 0x12u);
      }

      uint64_t v79 = WALogCategoryDefaultHandle();
      id v56 = (void (**)(void, void, void))v144;
      if (os_log_type_enabled(v79, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136446466;
        *(void *)&uint8_t buf[4] = "-[WAEngine _issueIOReportManagementCommand:forProcessToken:andReply:]";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = 3307;
        _os_log_impl((void *)&_mh_execute_header, v79, OS_LOG_TYPE_DEBUG, "%{public}s::%d:kWAIORCommandScanPredicatesNotYetFound running [self.iorMessagePopulator scanPredicatesNotYetFound];",
          buf,
          0x12u);
      }

      v80 = [(WAEngine *)self iorMessagePopulator];
      [v80 scanPredicatesNotYetFoundAndMutable];

      [v9 setObject:&__kCFBooleanTrue forKeyedSubscript:@"Success"];
      uint64_t v58 = WALogCategoryDefaultHandle();
      if (!os_log_type_enabled(v58, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_71;
      }
      *(_DWORD *)buf = 136446466;
      *(void *)&uint8_t buf[4] = "-[WAEngine _issueIOReportManagementCommand:forProcessToken:andReply:]";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 3312;
      long long v59 = "%{public}s::%d:kWAIORCommandScanPredicatesNotYetFound end";
LABEL_70:
      _os_log_impl((void *)&_mh_execute_header, v58, OS_LOG_TYPE_DEBUG, v59, buf, 0x12u);
LABEL_71:

      v76 = 0;
      goto LABEL_129;
    case 8uLL:
      uint64_t v81 = WALogCategoryDefaultHandle();
      if (os_log_type_enabled(v81, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136446466;
        *(void *)&uint8_t buf[4] = "-[WAEngine _issueIOReportManagementCommand:forProcessToken:andReply:]";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = 3316;
        _os_log_impl((void *)&_mh_execute_header, v81, OS_LOG_TYPE_DEBUG, "%{public}s::%d:kWAIORCommandForceStudyErrorFromMsg start", buf, 0x12u);
      }

      v82 = WALogCategoryDefaultHandle();
      if (os_log_type_enabled(v82, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136446466;
        *(void *)&uint8_t buf[4] = "-[WAEngine _issueIOReportManagementCommand:forProcessToken:andReply:]";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = 3318;
        _os_log_impl((void *)&_mh_execute_header, v82, OS_LOG_TYPE_DEBUG, "%{public}s::%d:kWAIORCommandForceStudyErrorFromMsg seetting _forceStudyErrorFromMsg true", buf, 0x12u);
      }

      self->_forceStudyErrorFromMsg = 1;
      [v9 setObject:&__kCFBooleanTrue forKeyedSubscript:@"Success"];
      __int16 v50 = WALogCategoryDefaultHandle();
      if (!os_log_type_enabled(v50, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_79;
      }
      *(_DWORD *)buf = 136446466;
      *(void *)&uint8_t buf[4] = "-[WAEngine _issueIOReportManagementCommand:forProcessToken:andReply:]";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 3323;
      NSErrorUserInfoKey v51 = "%{public}s::%d:kWAIORCommandForceStudyErrorFromMsg end";
      CFStringRef v52 = v50;
      os_log_type_t v53 = OS_LOG_TYPE_DEBUG;
      goto LABEL_78;
    default:
      __int16 v50 = WALogCategoryDefaultHandle();
      if (!os_log_type_enabled(v50, OS_LOG_TYPE_ERROR)) {
        goto LABEL_79;
      }
      *(_DWORD *)buf = 136446466;
      *(void *)&uint8_t buf[4] = "-[WAEngine _issueIOReportManagementCommand:forProcessToken:andReply:]";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 3327;
      NSErrorUserInfoKey v51 = "%{public}s::%d:Unknown command";
      CFStringRef v52 = v50;
      os_log_type_t v53 = OS_LOG_TYPE_ERROR;
LABEL_78:
      _os_log_impl((void *)&_mh_execute_header, v52, v53, v51, buf, 0x12u);
LABEL_79:

      v76 = 0;
      id v56 = (void (**)(void, void, void))v144;
      goto LABEL_129;
  }
}

- (void)_trapCrashMiniTracerDumpReadyForInterfaceWithName:(id)a3 andReply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(WAEngine *)self interfaceNameToApple80211InstanceMap];

  if (!v8)
  {
    id v9 = +[NSMutableDictionary dictionary];
    [(WAEngine *)self setInterfaceNameToApple80211InstanceMap:v9];
  }
  uint64_t v10 = [(WAEngine *)self interfaceNameToApple80211InstanceMap];
  id v11 = [v10 objectForKeyedSubscript:v6];

  if (!v11)
  {
    uint64_t v12 = [[WAApple80211 alloc] initWithInterfaceName:v6];
    if (v12)
    {
      unsigned __int8 v13 = [(WAEngine *)self interfaceNameToApple80211InstanceMap];
      [v13 setObject:v12 forKeyedSubscript:v6];
    }
  }
  id v14 = [(WAEngine *)self interfaceNameToApple80211InstanceMap];
  id v15 = [v14 objectForKeyedSubscript:v6];

  if (v15)
  {
    uint64_t v16 = [(WAEngine *)self interfaceNameToApple80211InstanceMap];
    id v17 = [v16 objectForKeyedSubscript:v6];
    [v17 grabAndSubmitFWTrapInfo];
  }
  else
  {
    uint64_t v16 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      int v18 = 136446466;
      unsigned int v19 = "-[WAEngine _trapCrashMiniTracerDumpReadyForInterfaceWithName:andReply:]";
      __int16 v20 = 1024;
      int v21 = 3357;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "%{public}s::%d:No Apple80211 wrapper to process trap crash mini tracer dump with!", (uint8_t *)&v18, 0x12u);
    }
  }

  if (v7) {
    (*((void (**)(id, void, void))v7 + 2))(v7, 0, 0);
  }
}

- (void)_lqmCrashTracerNotifyForInterfaceWithName:(id)a3 andReply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(WAEngine *)self interfaceNameToApple80211InstanceMap];

  if (!v8)
  {
    id v9 = +[NSMutableDictionary dictionary];
    [(WAEngine *)self setInterfaceNameToApple80211InstanceMap:v9];
  }
  uint64_t v10 = [(WAEngine *)self interfaceNameToApple80211InstanceMap];
  id v11 = [v10 objectForKeyedSubscript:v6];

  if (!v11)
  {
    uint64_t v12 = [[WAApple80211 alloc] initWithInterfaceName:v6];
    if (v12)
    {
      unsigned __int8 v13 = [(WAEngine *)self interfaceNameToApple80211InstanceMap];
      [v13 setObject:v12 forKeyedSubscript:v6];
    }
  }
  id v14 = [(WAEngine *)self interfaceNameToApple80211InstanceMap];
  id v15 = [v14 objectForKeyedSubscript:v6];

  if (v15)
  {
    uint64_t v16 = [(WAEngine *)self interfaceNameToApple80211InstanceMap];
    id v17 = [v16 objectForKeyedSubscript:v6];
    [v17 grabAndSubmitLqmMetrics];
  }
  else
  {
    uint64_t v16 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      int v18 = 136446466;
      unsigned int v19 = "-[WAEngine _lqmCrashTracerNotifyForInterfaceWithName:andReply:]";
      __int16 v20 = 1024;
      int v21 = 3376;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "%{public}s::%d:No Apple80211 wrapper to process lqmCrashTracer with!", (uint8_t *)&v18, 0x12u);
    }
  }

  if (v7) {
    (*((void (**)(id, void, void))v7 + 2))(v7, 0, 0);
  }
}

- (void)_lqmCrashTracerReceiveBlock:(id)a3 forInterfaceWithName:(id)a4 andReply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(WAEngine *)self interfaceNameToApple80211InstanceMap];

  if (!v11)
  {
    uint64_t v12 = +[NSMutableDictionary dictionary];
    [(WAEngine *)self setInterfaceNameToApple80211InstanceMap:v12];
  }
  unsigned __int8 v13 = [(WAEngine *)self interfaceNameToApple80211InstanceMap];
  id v14 = [v13 objectForKeyedSubscript:v9];

  if (!v14)
  {
    id v15 = [[WAApple80211 alloc] initWithInterfaceName:v9];
    if (v15)
    {
      uint64_t v16 = [(WAEngine *)self interfaceNameToApple80211InstanceMap];
      [v16 setObject:v15 forKeyedSubscript:v9];
    }
  }
  id v17 = [(WAEngine *)self interfaceNameToApple80211InstanceMap];
  int v18 = [v17 objectForKeyedSubscript:v9];

  if (v18)
  {
    unsigned int v19 = [(WAEngine *)self interfaceNameToApple80211InstanceMap];
    __int16 v20 = [v19 objectForKeyedSubscript:v9];
    [v20 submitLqmMetrics:v8];
  }
  else
  {
    unsigned int v19 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      int v21 = 136446466;
      id v22 = "-[WAEngine _lqmCrashTracerReceiveBlock:forInterfaceWithName:andReply:]";
      __int16 v23 = 1024;
      int v24 = 3395;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "%{public}s::%d:No Apple80211 wrapper to process lqmCrashTracer with!", (uint8_t *)&v21, 0x12u);
    }
  }

  if (v10) {
    (*((void (**)(id, void, void))v10 + 2))(v10, 0, 0);
  }
}

- (void)_trapFWWithReason:(id)a3 andReply:(id)a4
{
  id v6 = (char *)a3;
  id v7 = a4;
  infraInterfaceName = self->_infraInterfaceName;
  if (!infraInterfaceName) {
    goto LABEL_4;
  }
  if ([(NSString *)infraInterfaceName isEqualToString:@"dunno"]) {
    goto LABEL_4;
  }
  id v9 = [(WAEngine *)self interfaceNameToApple80211InstanceMap];
  id v10 = [(WAEngine *)self infraInterfaceName];
  id v11 = [v9 objectForKeyedSubscript:v10];

  if (!v11) {
LABEL_4:
  }
    [(WAEngine *)self queryInfraInterfaceInstanceAndChip];
  if ([(NSString *)self->_infraInterfaceName isEqualToString:@"dunno"]) {
    goto LABEL_8;
  }
  uint64_t v12 = [(WAEngine *)self interfaceNameToApple80211InstanceMap];
  unsigned __int8 v13 = [(WAEngine *)self infraInterfaceName];
  id v14 = [v12 objectForKeyedSubscript:v13];

  if (!v14)
  {
LABEL_8:
    int v18 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      int v20 = 136446466;
      int v21 = "-[WAEngine _trapFWWithReason:andReply:]";
      __int16 v22 = 1024;
      LODWORD(v23) = 3414;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "%{public}s::%d:failed to find _infraInterfaceName", (uint8_t *)&v20, 0x12u);
    }

    id v15 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
    {
      unsigned int v19 = self->_infraInterfaceName;
      int v20 = 138412546;
      int v21 = v6;
      __int16 v22 = 2112;
      __int16 v23 = v19;
      _os_log_fault_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_FAULT, "Failed to initiate FW trap reason %@, interface %@", (uint8_t *)&v20, 0x16u);
    }
  }
  else
  {
    id v15 = [(WAEngine *)self interfaceNameToApple80211InstanceMap];
    uint64_t v16 = [(WAEngine *)self infraInterfaceName];
    id v17 = [v15 objectForKeyedSubscript:v16];
    [v17 triggerDpsReset:@"TrapOnSlowDPS"];
  }
  if (v7) {
    (*((void (**)(id, void, void))v7 + 2))(v7, 0, 0);
  }
}

- (void)_examinePeerMessageForIntegrity:(id)a3
{
  id v3 = a3;
  id v4 = [v3 fieldForKey:@"NWAPS_txLatencyBEs"];
  id v5 = [v4 repeatableValues];

  if (v5)
  {
    id v6 = [v3 fieldForKey:@"NWAPS_txLatencyBEs"];
    id v7 = [v6 repeatableValues];
    id v35 = (char *)[v7 count];
  }
  else
  {
    id v35 = 0;
  }
  id v8 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136446722;
    int v37 = "-[WAEngine _examinePeerMessageForIntegrity:]";
    __int16 v38 = 1024;
    int v39 = 3435;
    __int16 v40 = 2048;
    uint64_t v41 = v35;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "%{public}s::%d:NWAPS_txLatencyBEs bincount %lu", buf, 0x1Cu);
  }

  if ((unint64_t)v35 < 0x10)
  {
    if (!v35) {
      goto LABEL_32;
    }
  }
  else
  {
    id v9 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      int v37 = "-[WAEngine _examinePeerMessageForIntegrity:]";
      __int16 v38 = 1024;
      int v39 = 3438;
      __int16 v40 = 2048;
      uint64_t v41 = v35;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%{public}s::%d:bin count for NWAPS_txLatencyBEs exceeds expected count %lu", buf, 0x1Cu);
    }
  }
  id v10 = 0;
  long long v33 = v3;
  while (2)
  {
    char v31 = 0;
    id v11 = 0;
    id v34 = v10;
LABEL_13:
    uint64_t v12 = v11;
    do
    {
      if (v10 != v12)
      {
        unsigned __int8 v13 = [v3 fieldForKey:@"NWAPS_txLatencyBEs"];
        id v14 = [v13 repeatableValues];
        id v15 = [v14 objectAtIndex:v10];
        uint64_t v16 = [v15 fieldForKey:@"NWAHB_bin"];
        id v17 = [v3 fieldForKey:@"NWAPS_txLatencyBEs"];
        int v18 = [v17 repeatableValues];
        unsigned int v19 = [v18 objectAtIndex:v12];
        int v20 = [v19 fieldForKey:@"NWAHB_bin"];

        id v3 = v33;
        id v10 = v34;

        if (v16 == v20)
        {
          int v21 = WALogCategoryDefaultHandle();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
          {
            long long v32 = [v33 fieldForKey:@"NWAPS_txLatencyBEs"];
            __int16 v22 = [v32 repeatableValues];
            __int16 v23 = [v22 objectAtIndex:v34];
            int v24 = [v23 fieldForKey:@"NWAHB_bin"];
            long long v25 = [v33 fieldForKey:@"NWAPS_txLatencyBEs"];
            long long v26 = [v25 repeatableValues];
            long long v27 = [v26 objectAtIndex:v12];
            long long v28 = [v27 fieldForKey:@"NWAHB_bin"];
            *(_DWORD *)buf = 136447490;
            int v37 = "-[WAEngine _examinePeerMessageForIntegrity:]";
            __int16 v38 = 1024;
            int v39 = 3446;
            __int16 v40 = 2048;
            uint64_t v41 = v34;
            __int16 v42 = 2112;
            uint64_t v43 = v24;
            __int16 v44 = 2048;
            int v45 = v12;
            __int16 v46 = 2112;
            id v47 = v28;
            _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "%{public}s::%d:Duplicate bin name: i %lu %@ j %lu %@", buf, 0x3Au);

            id v10 = v34;
            id v3 = v33;
          }
          id v11 = v12 + 1;
          char v31 = 1;
          if (v35 - 1 == v12) {
            goto LABEL_25;
          }
          goto LABEL_13;
        }
      }
      ++v12;
    }
    while (v35 != v12);
    if (v31)
    {
LABEL_25:
      long long v29 = WALogCategoryDefaultHandle();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_FAULT, "Malformed PeerMessage", buf, 2u);
      }

      break;
    }
    if (++v10 != v35) {
      continue;
    }
    break;
  }
  if ((unint64_t)v35 >= 0x10)
  {
    long long v30 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_FAULT, "Too many txLatencyBE bins in PeerMessage", buf, 2u);
    }
  }
LABEL_32:
}

- (void)_triggerQueryForNWActivity:(int64_t)a3 forProcessToken:(id)a4 andReply:(id)a5
{
  id v8 = a4;
  id v9 = (void (**)(id, void, uint64_t))a5;
  uint64_t v68 = 0;
  __int16 v69 = &v68;
  uint64_t v70 = 0x3032000000;
  __int16 v71 = sub_10004D654;
  CFStringRef v72 = sub_10004D664;
  id v73 = 0;
  uint64_t v62 = 0;
  long long v63 = &v62;
  uint64_t v64 = 0x3032000000;
  long long v65 = sub_10004D654;
  long long v66 = sub_10004D664;
  id v67 = 0;
  if (!a3)
  {
    id v10 = WALogCategoryDefaultHandle();
    if (os_signpost_enabled(v10))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v10, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "Engine NWActivity reply style 0", "", buf, 2u);
    }

    v9[2](v9, 0, v63[5]);
    id v11 = WALogCategoryDefaultHandle();
    if (os_signpost_enabled(v11))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v11, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "Engine NWActivity reply style 0", "", buf, 2u);
    }
  }
  uint64_t v12 = WALogCategoryDefaultHandle();
  if (os_signpost_enabled(v12))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v12, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "Engine NWActivity", "", buf, 2u);
  }

  self->_isNWActivityInProgress = 1;
  if (!a3)
  {
    unsigned __int8 v13 = [(WAEngine *)self submitterMap];
    id v14 = [v13 objectForKeyedSubscript:v8];
    id v15 = +[NSNumber numberWithInteger:3];
    uint64_t v16 = [v14 objectForKeyedSubscript:v15];
    BOOL v17 = v16 == 0;

    if (v17)
    {
      int v18 = WALogCategoryDefaultHandle();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446466;
        uint64_t v77 = "-[WAEngine _triggerQueryForNWActivity:forProcessToken:andReply:]";
        __int16 v78 = 1024;
        int v79 = 3483;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "%{public}s::%d:Caller did not register", buf, 0x12u);
      }

      if (!v8)
      {
        CFStringRef v52 = WALogCategoryDefaultHandle();
        if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136446466;
          uint64_t v77 = "-[WAEngine _triggerQueryForNWActivity:forProcessToken:andReply:]";
          __int16 v78 = 1024;
          int v79 = 3484;
          _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:couldn't get process name for connection", buf, 0x12u);
        }

        NSErrorUserInfoKey v84 = NSLocalizedFailureReasonErrorKey;
        CFStringRef v85 = @"WAErrorCodeInternalError";
        int v24 = +[NSDictionary dictionaryWithObjects:&v85 forKeys:&v84 count:1];
        uint64_t v53 = +[NSError errorWithDomain:@"com.apple.wifi.analytics.errordomain" code:9003 userInfo:v24];
        CFStringRef v54 = (void *)v63[5];
        v63[5] = v53;

        goto LABEL_49;
      }
      unsigned int v19 = [(WAEngine *)self processTokenToGroupTypeMap];
      int v20 = [v19 objectForKeyedSubscript:v8];
      int v21 = +[NSNumber numberWithInteger:3];
      unsigned int v22 = [v20 containsObject:v21];

      __int16 v23 = WALogCategoryDefaultHandle();
      int v24 = v23;
      if (v22)
      {
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136446722;
          uint64_t v77 = "-[WAEngine _triggerQueryForNWActivity:forProcessToken:andReply:]";
          __int16 v78 = 1024;
          int v79 = 3485;
          __int16 v80 = 2048;
          uint64_t v81 = 3;
          _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "%{public}s::%d:XPC: processTokenToGroupTypeMap seems to think this process token has already registered group type: %ld", buf, 0x1Cu);
        }
        goto LABEL_49;
      }
      if (os_signpost_enabled(v23))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v24, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "Engine NWActivity notRegisteredPath", "", buf, 2u);
      }

      [(WAEngine *)self _purgeGroupTypeIfNecessary:3];
      long long v25 = [(WAEngine *)self processTokenToGroupTypeMap];
      long long v26 = [v25 objectForKeyedSubscript:v8];
      BOOL v27 = v26 == 0;

      if (v27)
      {
        id v28 = objc_alloc_init((Class)NSMutableSet);
        long long v29 = [(WAEngine *)self processTokenToGroupTypeMap];
        [v29 setObject:v28 forKeyedSubscript:v8];
      }
      long long v30 = [(WAEngine *)self processTokenToGroupTypeMap];
      char v31 = [v30 objectForKeyedSubscript:v8];
      long long v32 = +[NSNumber numberWithInteger:3];
      [v31 addObject:v32];

      [(WAEngine *)self _initSubmitterAndQueryableRegistrationForProcessToken:v8 andGroupType:3];
      [(WAEngine *)self _persist];
      long long v33 = WALogCategoryDefaultHandle();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
      {
        id v34 = +[WAUtil trimTokenForLogging:v8];
        *(_DWORD *)buf = 136446978;
        uint64_t v77 = "-[WAEngine _triggerQueryForNWActivity:forProcessToken:andReply:]";
        __int16 v78 = 1024;
        int v79 = 3498;
        __int16 v80 = 2048;
        uint64_t v81 = 3;
        __int16 v82 = 2112;
        v83 = v34;
        _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEBUG, "%{public}s::%d:XPC: registering message group type: %ld for process: %@", buf, 0x26u);
      }
      id v35 = WALogCategoryDefaultHandle();
      if (os_signpost_enabled(v35))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v35, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "Engine NWActivity notRegisteredPath", "", buf, 2u);
      }
    }
  }
  uint64_t v36 = [(WAEngine *)self _cachedModelObjectsMessageForGroupType:3 key:@"NWA"];
  int v37 = (void *)v69[5];
  v69[5] = v36;

  if (!v69[5])
  {
    __int16 v48 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      uint64_t v77 = "-[WAEngine _triggerQueryForNWActivity:forProcessToken:andReply:]";
      __int16 v78 = 1024;
      int v79 = 3504;
      __int16 v80 = 2112;
      uint64_t v81 = @"NWA";
      _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_ERROR, "%{public}s::%d:No model class found for key: %@. This is a CRITICAL error", buf, 0x1Cu);
    }

    NSErrorUserInfoKey v74 = NSLocalizedFailureReasonErrorKey;
    CFStringRef v75 = @"WAErrorCodeNotRegistered";
    __int16 v42 = +[NSDictionary dictionaryWithObjects:&v75 forKeys:&v74 count:1];
    uint64_t v49 = +[NSError errorWithDomain:@"com.apple.wifi.analytics.errordomain" code:9009 userInfo:v42];
    __int16 v50 = (void *)v63[5];
    v63[5] = v49;

    goto LABEL_39;
  }
  __int16 v38 = [(WAEngine *)self iorMessagePopulator];
  int v39 = [(id)v69[5] originalClassName];
  unsigned __int8 v40 = [v38 doesMessageNeedPrepopulation:v39];

  uint64_t v41 = WALogCategoryDefaultHandle();
  __int16 v42 = v41;
  if ((v40 & 1) == 0)
  {
    if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      uint64_t v77 = "-[WAEngine _triggerQueryForNWActivity:forProcessToken:andReply:]";
      __int16 v78 = 1024;
      int v79 = 3506;
      _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_ERROR, "%{public}s::%d:doesMessageNeedPrepopulation returned false", buf, 0x12u);
    }
LABEL_39:

    if (a3 != 1)
    {
LABEL_50:
      self->_isNWActivityInProgress = 0;
      id v47 = WALogCategoryDefaultHandle();
      if (!os_signpost_enabled(v47)) {
        goto LABEL_33;
      }
      *(_WORD *)buf = 0;
      goto LABEL_32;
    }
    NSErrorUserInfoKey v51 = WALogCategoryDefaultHandle();
    if (os_signpost_enabled(v51))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v51, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "Engine NWActivity Reply", "", buf, 2u);
    }

    v9[2](v9, v69[5], v63[5]);
    int v24 = WALogCategoryDefaultHandle();
    if (os_signpost_enabled(v24))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v24, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "Engine NWActivity Reply", "", buf, 2u);
    }
LABEL_49:

    goto LABEL_50;
  }
  if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v43 = [(id)v69[5] key];
    *(_DWORD *)buf = 136446722;
    uint64_t v77 = "-[WAEngine _triggerQueryForNWActivity:forProcessToken:andReply:]";
    __int16 v78 = 1024;
    int v79 = 3507;
    __int16 v80 = 2112;
    uint64_t v81 = (uint64_t)v43;
    _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEBUG, "%{public}s::%d:Send WAMessageAWD %@ for population... ", buf, 0x1Cu);
  }
  __int16 v44 = WALogCategoryDefaultHandle();
  if (os_signpost_enabled(v44))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v44, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "Engine NWActivity Poplulate", "", buf, 2u);
  }

  int v45 = [(WAEngine *)self iorMessagePopulator];
  uint64_t v46 = v69[5];
  v55[0] = _NSConcreteStackBlock;
  v55[1] = 3221225472;
  v55[2] = sub_10005DA5C;
  v55[3] = &unk_1000D14F0;
  uint64_t v58 = &v68;
  v55[4] = self;
  long long v59 = &v62;
  id v56 = v8;
  uint64_t v60 = 3;
  int64_t v61 = a3;
  uint64_t v57 = v9;
  [v45 prepopulateMessage:v46 forProcess:v56 groupType:3 andReply:v55];

  self->_isNWActivityInProgress = 0;
  id v47 = WALogCategoryDefaultHandle();
  if (os_signpost_enabled(v47))
  {
    *(_WORD *)buf = 0;
LABEL_32:
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v47, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "Engine NWActivity", "", buf, 2u);
  }
LABEL_33:

  _Block_object_dispose(&v62, 8);
  _Block_object_dispose(&v68, 8);
}

- (void)_convertWiFiStatsIntoPercentile:(id)a3 analysisGroup:(int64_t)a4 groupTarget:(id)a5 forProcessToken:(id)a6 andReply:(id)a7
{
  id v46 = a3;
  id v12 = a5;
  id v13 = a6;
  id v14 = (void (**)(id, void, uint64_t))a7;
  uint64_t v50 = 0;
  NSErrorUserInfoKey v51 = &v50;
  uint64_t v52 = 0x3032000000;
  uint64_t v53 = sub_10004D654;
  CFStringRef v54 = sub_10004D664;
  id v55 = 0;
  id v15 = [(WAEngine *)self submitterMap];
  uint64_t v16 = [v15 objectForKeyedSubscript:v13];
  BOOL v17 = +[NSNumber numberWithInteger:3];
  int v18 = [v16 objectForKeyedSubscript:v17];
  BOOL v19 = v18 == 0;

  if (!v19) {
    goto LABEL_11;
  }
  int v20 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136446466;
    int64_t v61 = "-[WAEngine _convertWiFiStatsIntoPercentile:analysisGroup:groupTarget:forProcessToken:andReply:]";
    __int16 v62 = 1024;
    int v63 = 3720;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "%{public}s::%d:Caller did not register", buf, 0x12u);
  }

  if (!v13)
  {
    unsigned __int8 v40 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446466;
      int64_t v61 = "-[WAEngine _convertWiFiStatsIntoPercentile:analysisGroup:groupTarget:forProcessToken:andReply:]";
      __int16 v62 = 1024;
      int v63 = 3721;
      _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:couldn't get process name for connection", buf, 0x12u);
    }

    NSErrorUserInfoKey v41 = NSLocalizedFailureReasonErrorKey;
    NSErrorUserInfoKey v68 = NSLocalizedFailureReasonErrorKey;
    CFStringRef v69 = @"WAErrorCodeInternalError";
    __int16 v42 = +[NSDictionary dictionaryWithObjects:&v69 forKeys:&v68 count:1];
    uint64_t v43 = +[NSError errorWithDomain:@"com.apple.wifi.analytics.errordomain" code:9003 userInfo:v42];
    __int16 v44 = (void *)v51[5];
    v51[5] = v43;

    goto LABEL_24;
  }
  int v21 = [(WAEngine *)self processTokenToGroupTypeMap];
  unsigned int v22 = [v21 objectForKeyedSubscript:v13];
  __int16 v23 = +[NSNumber numberWithInteger:3];
  unsigned int v24 = [v22 containsObject:v23];

  if (v24)
  {
    int v45 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      int64_t v61 = "-[WAEngine _convertWiFiStatsIntoPercentile:analysisGroup:groupTarget:forProcessToken:andReply:]";
      __int16 v62 = 1024;
      int v63 = 3722;
      __int16 v64 = 2048;
      uint64_t v65 = 3;
      _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_ERROR, "%{public}s::%d:XPC: processTokenToGroupTypeMap seems to think this process token has already registered group type: %ld", buf, 0x1Cu);
    }

    NSErrorUserInfoKey v41 = NSLocalizedFailureReasonErrorKey;
LABEL_24:
    NSErrorUserInfoKey v56 = v41;
    CFStringRef v57 = @"WAErrorCodeInternalError";
    int v37 = +[NSDictionary dictionaryWithObjects:&v57 forKeys:&v56 count:1];
    uint64_t v38 = +[NSError errorWithDomain:@"com.apple.wifi.analytics.errordomain" code:9003 userInfo:v37];
LABEL_16:
    int v39 = (void *)v51[5];
    v51[5] = v38;

    v14[2](v14, 0, v51[5]);
    goto LABEL_17;
  }
  [(WAEngine *)self _purgeGroupTypeIfNecessary:3];
  long long v25 = [(WAEngine *)self processTokenToGroupTypeMap];
  long long v26 = [v25 objectForKeyedSubscript:v13];
  BOOL v27 = v26 == 0;

  if (v27)
  {
    id v28 = objc_alloc_init((Class)NSMutableSet);
    long long v29 = [(WAEngine *)self processTokenToGroupTypeMap];
    [v29 setObject:v28 forKeyedSubscript:v13];
  }
  long long v30 = [(WAEngine *)self processTokenToGroupTypeMap];
  char v31 = [v30 objectForKeyedSubscript:v13];
  long long v32 = +[NSNumber numberWithInteger:3];
  [v31 addObject:v32];

  [(WAEngine *)self _initSubmitterAndQueryableRegistrationForProcessToken:v13 andGroupType:3];
  [(WAEngine *)self _persist];
  long long v33 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
  {
    id v34 = +[WAUtil trimTokenForLogging:v13];
    *(_DWORD *)buf = 136446978;
    int64_t v61 = "-[WAEngine _convertWiFiStatsIntoPercentile:analysisGroup:groupTarget:forProcessToken:andReply:]";
    __int16 v62 = 1024;
    int v63 = 3733;
    __int16 v64 = 2048;
    uint64_t v65 = 3;
    __int16 v66 = 2112;
    id v67 = v34;
    _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEBUG, "%{public}s::%d:XPC: registering message group type: %ld for process: %@", buf, 0x26u);
  }
LABEL_11:
  id v35 = [[NWActivityDistributionStoreDescriptor alloc] _initWithGroupAndOptions:a4 groupTarget:v12];
  if (!v35)
  {
    uint64_t v36 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      int64_t v61 = "-[WAEngine _convertWiFiStatsIntoPercentile:analysisGroup:groupTarget:forProcessToken:andReply:]";
      __int16 v62 = 1024;
      int v63 = 3749;
      _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_ERROR, "%{public}s::%d:Failed to create NWActivityDistributionStoreDescriptor", buf, 0x12u);
    }

    NSErrorUserInfoKey v58 = NSLocalizedFailureReasonErrorKey;
    CFStringRef v59 = @"WAErrorCodeInternalError";
    int v37 = +[NSDictionary dictionaryWithObjects:&v59 forKeys:&v58 count:1];
    uint64_t v38 = +[NSError errorWithDomain:@"com.apple.wifi.analytics.errordomain" code:9003 userInfo:v37];
    goto LABEL_16;
  }
  v47[0] = _NSConcreteStackBlock;
  v47[1] = 3221225472;
  v47[2] = sub_10005FB0C;
  v47[3] = &unk_1000D1518;
  __int16 v48 = v14;
  uint64_t v49 = &v50;
  [v35 findInterpolatedPercentileFromWiFiStats:v46 andReply:v47];

LABEL_17:
  _Block_object_dispose(&v50, 8);
}

- (void)populateChannelInfo:(id)a3
{
  int v17 = 0;
  id v3 = a3;
  id v4 = +[WAApple80211Manager sharedObject];
  id v5 = [v4 getInfraApple80211];

  if (!v5)
  {
    id v9 = WALogCategoryDefaultHandle();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      goto LABEL_15;
    }
    *(_DWORD *)buf = 136446466;
    BOOL v19 = "-[WAEngine populateChannelInfo:]";
    __int16 v20 = 1024;
    int v21 = 3773;
    id v10 = "%{public}s::%d:invalid apple80211API";
    id v11 = v9;
    os_log_type_t v12 = OS_LOG_TYPE_ERROR;
    goto LABEL_14;
  }
  if ([v5 currentChannelInfo:&v16])
  {
    if ((v17 & 0x400) != 0) {
      int v6 = 80;
    }
    else {
      int v6 = (v17 << 20 >> 31) & 0xA0;
    }
    if ((v17 & 4) != 0) {
      unsigned int v7 = 40;
    }
    else {
      unsigned int v7 = v6;
    }
    if ((v17 & 2) != 0) {
      uint64_t v8 = 20;
    }
    else {
      uint64_t v8 = v7;
    }
    goto LABEL_16;
  }
  id v9 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    BOOL v19 = "-[WAEngine populateChannelInfo:]";
    __int16 v20 = 1024;
    int v21 = 3776;
    id v10 = "%{public}s::%d:Error getting channel Info for dpsCounterSample";
    id v11 = v9;
    os_log_type_t v12 = OS_LOG_TYPE_DEFAULT;
LABEL_14:
    _os_log_impl((void *)&_mh_execute_header, v11, v12, v10, buf, 0x12u);
  }
LABEL_15:

  uint64_t v8 = 0;
LABEL_16:
  id v13 = [v3 fieldForKey:@"NWACS_channel"];
  [v13 setUint32Value:HIDWORD(v16)];

  id v14 = [v3 fieldForKey:@"NWACS_channelBandwidth"];

  [v14 setUint32Value:v8];
  id v15 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446978;
    BOOL v19 = "-[WAEngine populateChannelInfo:]";
    __int16 v20 = 1024;
    int v21 = 3790;
    __int16 v22 = 1024;
    int v23 = HIDWORD(v16);
    __int16 v24 = 1024;
    int v25 = v8;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:channel: %u channelBandwidth: %u", buf, 0x1Eu);
  }
}

- (BOOL)populateApProfile:(id)a3
{
  id v4 = a3;
  id v5 = [v4 fieldForKey:@"NWA_apProfile"];
  [v5 setStringValue:&stru_1000D3628];

  int v6 = +[WAApple80211Manager sharedObject];
  unsigned int v7 = [v6 getInfraApple80211];

  if (!v7)
  {
    int v18 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      int v21 = 136446466;
      __int16 v22 = "-[WAEngine populateApProfile:]";
      __int16 v23 = 1024;
      int v24 = 3808;
      BOOL v19 = "%{public}s::%d:invalid apple80211API";
LABEL_12:
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, v19, (uint8_t *)&v21, 0x12u);
    }
LABEL_13:
    id v9 = 0;
    goto LABEL_14;
  }
  uint64_t v8 = [v7 currentBSSIDandSSID];
  if (!v8)
  {
    int v18 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      int v21 = 136446466;
      __int16 v22 = "-[WAEngine populateApProfile:]";
      __int16 v23 = 1024;
      int v24 = 3814;
      BOOL v19 = "%{public}s::%d:currentBSSIDandSSID gave nil";
      goto LABEL_12;
    }
    goto LABEL_13;
  }
  id v9 = (void *)v8;
  +[WAUtil incrementValueForKey:@"AnalyticsProcessor: AP Profile For BSSID" inMutableDict:self->_cachedUsage onQueue:self->_engineQ];
  id v10 = [(WAEngine *)self analyticsProcessor];
  id v11 = [v9 objectForKeyedSubscript:@"bssid"];
  os_log_type_t v12 = [v9 objectForKeyedSubscript:@"ssid"];
  id v13 = [v10 apProfileForBssid:v11 andSSID:v12];

  if (v13)
  {
    id v14 = [v4 fieldForKey:@"NWA_apProfile"];
    [v14 setStringValue:v13];

    id v15 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      int v21 = 136446722;
      __int16 v22 = "-[WAEngine populateApProfile:]";
      __int16 v23 = 1024;
      int v24 = 3825;
      __int16 v25 = 1024;
      LODWORD(v26) = 1;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:returning %d", (uint8_t *)&v21, 0x18u);
    }

    BOOL v16 = 1;
    goto LABEL_7;
  }
  int v18 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
  {
    __int16 v20 = [v9 objectForKeyedSubscript:@"bssid"];
    int v21 = 136446722;
    __int16 v22 = "-[WAEngine populateApProfile:]";
    __int16 v23 = 1024;
    int v24 = 3818;
    __int16 v25 = 2112;
    long long v26 = v20;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "%{public}s::%d:profile for %@ is nil", (uint8_t *)&v21, 0x1Cu);
  }
LABEL_14:

  id v13 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    int v21 = 136446722;
    __int16 v22 = "-[WAEngine populateApProfile:]";
    __int16 v23 = 1024;
    int v24 = 3831;
    __int16 v25 = 1024;
    LODWORD(v26) = 0;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%{public}s::%d:returning %d", (uint8_t *)&v21, 0x18u);
  }
  BOOL v16 = 0;
LABEL_7:

  return v16;
}

- (BOOL)everAssociated:(BOOL)a3 assocDoneSuccess:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  if (a3 || a4)
  {
    unsigned int v7 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 136446978;
      os_log_type_t v12 = "-[WAEngine everAssociated:assocDoneSuccess:]";
      __int16 v13 = 1024;
      int v14 = 3840;
      __int16 v15 = 1024;
      BOOL v16 = v5;
      __int16 v17 = 1024;
      BOOL v18 = v4;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:everAssociated true due to hasLinkChanged %d hasAssocDoneSuccess %d", (uint8_t *)&v11, 0x1Eu);
    }
    unsigned __int8 v8 = 1;
  }
  else
  {
    int v6 = +[WAApple80211Manager sharedObject];
    unsigned int v7 = [v6 getInfraApple80211];

    if (v7)
    {
      unsigned __int8 v8 = [v7 everAssociated];
    }
    else
    {
      id v10 = WALogCategoryDefaultHandle();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        int v11 = 136446466;
        os_log_type_t v12 = "-[WAEngine everAssociated:assocDoneSuccess:]";
        __int16 v13 = 1024;
        int v14 = 3845;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "%{public}s::%d:invalid apple80211API", (uint8_t *)&v11, 0x12u);
      }

      unsigned int v7 = WALogCategoryDefaultHandle();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        int v11 = 136446466;
        os_log_type_t v12 = "-[WAEngine everAssociated:assocDoneSuccess:]";
        __int16 v13 = 1024;
        int v14 = 3854;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "%{public}s::%d:everAssociated failed", (uint8_t *)&v11, 0x12u);
      }
      unsigned __int8 v8 = 0;
    }
  }

  return v8;
}

- (BOOL)isAssociated
{
  CFDictionaryRef v2 = +[WAApple80211Manager sharedObject];
  id v3 = [v2 getInfraApple80211];

  if (v3)
  {
    unsigned __int8 v4 = [v3 isAssociated];
  }
  else
  {
    int v6 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v8 = 136446466;
      id v9 = "-[WAEngine isAssociated]";
      __int16 v10 = 1024;
      int v11 = 3864;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "%{public}s::%d:invalid apple80211API", (uint8_t *)&v8, 0x12u);
    }

    unsigned int v7 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v8 = 136446466;
      id v9 = "-[WAEngine isAssociated]";
      __int16 v10 = 1024;
      int v11 = 3872;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "%{public}s::%d:everAssociated failed", (uint8_t *)&v8, 0x12u);
    }

    unsigned __int8 v4 = 0;
  }

  return v4;
}

- (BOOL)isAXAssociatoin
{
  CFDictionaryRef v2 = +[WAApple80211Manager sharedObject];
  id v3 = [v2 getInfraApple80211];

  if (v3)
  {
    unsigned __int8 v4 = [v3 isAXAssociatoin];
  }
  else
  {
    int v6 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v8 = 136446466;
      id v9 = "-[WAEngine isAXAssociatoin]";
      __int16 v10 = 1024;
      int v11 = 3882;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "%{public}s::%d:invalid apple80211API", (uint8_t *)&v8, 0x12u);
    }

    unsigned int v7 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v8 = 136446466;
      id v9 = "-[WAEngine isAXAssociatoin]";
      __int16 v10 = 1024;
      int v11 = 3890;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "%{public}s::%d:isAXAssociatoin failed", (uint8_t *)&v8, 0x12u);
    }

    unsigned __int8 v4 = 0;
  }

  return v4;
}

- (void)gatherConsecutiveDatapathReadings:(int64_t)a3 forProcessToken:(id)a4 andReply:(id)a5
{
  id v7 = a4;
  id v60 = a5;
  group = dispatch_group_create();
  dispatch_semaphore_t v53 = dispatch_semaphore_create(0);
  dispatch_semaphore_t v8 = dispatch_semaphore_create(0);
  uint64_t v110 = 0;
  id v111 = &v110;
  uint64_t v112 = 0x3032000000;
  __int16 v113 = sub_10004D654;
  int v114 = sub_10004D664;
  id v115 = 0;
  v108[0] = 0;
  v108[1] = v108;
  v108[2] = 0x3032000000;
  v108[3] = sub_10004D654;
  v108[4] = sub_10004D664;
  id v109 = +[NSMutableDictionary dictionary];
  uint64_t v102 = 0;
  v103 = &v102;
  uint64_t v104 = 0x3032000000;
  id v105 = sub_10004D654;
  v106 = sub_10004D664;
  id v107 = 0;
  v100[0] = 0;
  v100[1] = v100;
  v100[2] = 0x3032000000;
  v100[3] = sub_10004D654;
  v100[4] = sub_10004D664;
  id v101 = 0;
  v97[0] = _NSConcreteStackBlock;
  v97[1] = 3221225472;
  v97[2] = sub_10006155C;
  v97[3] = &unk_1000D1540;
  uint64_t v99 = &v110;
  dispatch_semaphore_t dsema = v8;
  dispatch_semaphore_t v98 = dsema;
  NSErrorUserInfoKey v58 = v7;
  [(WAEngine *)self _getNewMessageForKey:@"DPSR" groupType:4 forProcessToken:v7 shouldCheckForPrePopulation:0 andReply:v97];
  dispatch_time_t v9 = dispatch_time(0, 1000000000);
  dispatch_semaphore_wait(dsema, v9);
  __int16 v10 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    uint64_t v117 = "-[WAEngine gatherConsecutiveDatapathReadings:forProcessToken:andReply:]";
    __int16 v118 = 1024;
    int v119 = 3916;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:ensureDPSRexists done", buf, 0x12u);
  }

  if (v111[5])
  {
    if (self->_dnsStudyInProgress)
    {
      unsigned __int8 v57 = [(WAEngine *)self fetchConfiguredDnsInfo];
      [(WAEngine *)self triggerPeerDiscovery];
    }
    else
    {
      unsigned __int8 v57 = 1;
    }
    CFStringRef v59 = [(WAEngine *)self _DPSQuickRecoveryEngineObj];
    int v11 = [(id)v111[5] fieldForKey:@"DPSR_dpsEpiloge"];
    os_log_type_t v12 = [v11 subMessageValue];
    __int16 v13 = [v12 fieldForKey:@"DPSE_qDpsStats"];
    int v14 = [v13 subMessageValue];
    [v59 updateTimeSincePreviousTriggerForQuickDps:v14];

    __int16 v15 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446466;
      uint64_t v117 = "-[WAEngine gatherConsecutiveDatapathReadings:forProcessToken:andReply:]";
      __int16 v118 = 1024;
      int v119 = 3930;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:_dpsStudyInProgress Start", buf, 0x12u);
    }

    dispatch_group_enter(group);
    BOOL v16 = [(RecommendationEngine *)self->_recommendationEngine preferences];
    dispatch_time_t v17 = dispatch_time(0, 1000000000 * [v16 dps_report_sent_after]);
    dpsReadWriteSerialQueue = self->_dpsReadWriteSerialQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10006165C;
    block[3] = &unk_1000D0D98;
    dispatch_group_t v51 = group;
    dispatch_group_t v96 = v51;
    dispatch_after(v17, (dispatch_queue_t)dpsReadWriteSerialQueue, block);

    BOOL v19 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446466;
      uint64_t v117 = "-[WAEngine gatherConsecutiveDatapathReadings:forProcessToken:andReply:]";
      __int16 v118 = 1024;
      int v119 = 3939;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:_dpsCurrentlyGatheringConsecutiveSamples TRUE", buf, 0x12u);
    }

    self->_dpsCurrentlyGatheringConsecutiveSamples = 1;
    v93[0] = 0;
    v93[1] = v93;
    v93[2] = 0x2020000000;
    char v94 = 1;
    v91[0] = 0;
    v91[1] = v91;
    v91[2] = 0x2020000000;
    char v92 = 1;
    __int16 v20 = [(RecommendationEngine *)self->_recommendationEngine preferences];
    id v61 = [v20 dps_duration_between_samples];

    recommendationEngine = self->_recommendationEngine;
    if (self->_dnsStudyInProgress)
    {
      __int16 v22 = [(RecommendationEngine *)recommendationEngine preferences];
      __int16 v62 = (char *)[v22 dns_symptoms_interrogation_sample_count];

      __int16 v23 = [(RecommendationEngine *)self->_recommendationEngine preferences];
      id v61 = [v23 dns_symptoms_duration_between_samples_before_trap];

      int v24 = [(RecommendationEngine *)self->_recommendationEngine preferences];
      uint64_t v25 = (uint64_t)[v24 dns_symptoms_trap_evaluated_at_sample] - 1;
    }
    else
    {
      int v24 = [(RecommendationEngine *)recommendationEngine preferences];
      __int16 v62 = (char *)[v24 dps_interrogation_sample_count];
      uint64_t v25 = 1;
    }
    uint64_t v56 = v25;

    long long v26 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446722;
      uint64_t v117 = "-[WAEngine gatherConsecutiveDatapathReadings:forProcessToken:andReply:]";
      __int16 v118 = 1024;
      int v119 = 3955;
      __int16 v120 = 2048;
      *(void *)id v121 = v62;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:DPS: interrogationCount: %lu", buf, 0x1Cu);
    }

    if (v62)
    {
      unint64_t v27 = 0;
      unsigned int v28 = 1;
      while (1)
      {
        dispatch_semaphore_t v29 = dispatch_semaphore_create(0);
        if (self->_dnsStudyInProgress)
        {
          long long v30 = [(RecommendationEngine *)self->_recommendationEngine preferences];
          BOOL v31 = [(unint64_t)[v30 dns_symptoms_trap_evaluated_at_sample] > v27];

          if (!v31)
          {
            long long v32 = [(RecommendationEngine *)self->_recommendationEngine preferences];
            id v61 = [v32 dns_symptoms_duration_between_samples_after_trap];
          }
        }
        long long v33 = WALogCategoryDefaultHandle();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136446978;
          uint64_t v117 = "-[WAEngine gatherConsecutiveDatapathReadings:forProcessToken:andReply:]";
          __int16 v118 = 1024;
          int v119 = 3964;
          __int16 v120 = 1024;
          *(_DWORD *)id v121 = v28 - 1;
          *(_WORD *)&v121[4] = 2048;
          *(void *)&v121[6] = v61;
          _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:DPS: sample:%u durationBetweenSamples: %lu", buf, 0x22u);
        }

        dispatch_time_t v34 = dispatch_time(0, 1000000 * (void)v61);
        id v35 = self->_dpsReadWriteSerialQueue;
        v80[0] = _NSConcreteStackBlock;
        v80[1] = 3221225472;
        v80[2] = sub_100061720;
        v80[3] = &unk_1000D15E0;
        unsigned int v90 = v28 - 1;
        v80[4] = self;
        v83 = v91;
        NSErrorUserInfoKey v84 = v93;
        uint64_t v87 = v56;
        uint64_t v88 = v62;
        uint64_t v89 = 4;
        id v81 = v58;
        CFStringRef v85 = v100;
        uint64_t v36 = v29;
        __int16 v82 = v36;
        uint64_t v86 = &v110;
        dispatch_after(v34, (dispatch_queue_t)v35, v80);
        dispatch_time_t v37 = dispatch_time(0, 20000000000);
        dispatch_semaphore_wait(v36, v37);
        uint64_t v38 = self->_dpsReadWriteSerialQueue;
        v71[0] = _NSConcreteStackBlock;
        v71[1] = 3221225472;
        v71[2] = sub_100062AB8;
        v71[3] = &unk_1000D1630;
        NSErrorUserInfoKey v74 = &v110;
        v71[4] = self;
        unsigned int v78 = v28 - 1;
        id v72 = v59;
        CFStringRef v75 = v91;
        v76 = v108;
        id v73 = v60;
        uint64_t v77 = v93;
        unsigned __int8 v79 = v57;
        dispatch_async((dispatch_queue_t)v38, v71);

        if (v62 - 1 == (char *)v27) {
          break;
        }

        unint64_t v27 = v28;
        if ((unint64_t)v62 <= v28++) {
          goto LABEL_31;
        }
      }
      unsigned __int8 v40 = WALogCategoryDefaultHandle();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136446466;
        uint64_t v117 = "-[WAEngine gatherConsecutiveDatapathReadings:forProcessToken:andReply:]";
        __int16 v118 = 1024;
        int v119 = 4290;
        _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:kDatapathInterrogationCountMax hit", buf, 0x12u);
      }

      NSErrorUserInfoKey v41 = WALogCategoryDefaultHandle();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136446466;
        uint64_t v117 = "-[WAEngine gatherConsecutiveDatapathReadings:forProcessToken:andReply:]";
        __int16 v118 = 1024;
        int v119 = 4291;
        _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:_dpsCurrentlyGatheringConsecutiveSamples FALSE", buf, 0x12u);
      }

      self->_dpsCurrentlyGatheringConsecutiveSamples = 0;
    }
LABEL_31:
    __int16 v42 = [(WAEngine *)self engineQ];
    v63[0] = _NSConcreteStackBlock;
    v63[1] = 3221225472;
    v63[2] = sub_1000646DC;
    v63[3] = &unk_1000D1680;
    __int16 v66 = &v110;
    v63[4] = self;
    CFStringRef v69 = v62;
    id v64 = v58;
    id v67 = &v102;
    uint64_t v70 = 4;
    NSErrorUserInfoKey v68 = v108;
    uint64_t v43 = v53;
    uint64_t v65 = v43;
    dispatch_group_notify(v51, v42, v63);

    _Block_object_dispose(v91, 8);
    _Block_object_dispose(v93, 8);

    if (a3 == 1)
    {
      __int16 v44 = [(RecommendationEngine *)self->_recommendationEngine preferences];
      dispatch_time_t v45 = dispatch_time(0, 1000000000 * [v44 dps_report_sent_after] + 5000000000);
      dispatch_semaphore_wait(v43, v45);

      id v46 = WALogCategoryDefaultHandle();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136446466;
        uint64_t v117 = "-[WAEngine gatherConsecutiveDatapathReadings:forProcessToken:andReply:]";
        __int16 v118 = 1024;
        int v119 = 4477;
        id v47 = "%{public}s::%d:unblocking is complete... returning";
LABEL_36:
        _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_DEFAULT, v47, buf, 0x12u);
      }
    }
    else
    {
      id v46 = WALogCategoryDefaultHandle();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136446466;
        uint64_t v117 = "-[WAEngine gatherConsecutiveDatapathReadings:forProcessToken:andReply:]";
        __int16 v118 = 1024;
        int v119 = 4479;
        id v47 = "%{public}s::%d:returning immediatley";
        goto LABEL_36;
      }
    }
  }
  else
  {
    __int16 v48 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      uint64_t v117 = "-[WAEngine gatherConsecutiveDatapathReadings:forProcessToken:andReply:]";
      __int16 v118 = 1024;
      int v119 = 3918;
      __int16 v120 = 2112;
      *(void *)id v121 = @"DPSR";
      _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_ERROR, "%{public}s::%d:No model class found for key: %@. This is a CRITICAL error", buf, 0x1Cu);
    }

    NSErrorUserInfoKey v122 = NSLocalizedFailureReasonErrorKey;
    CFStringRef v123 = @"WAErrorCodeNotRegistered";
    id v46 = +[NSDictionary dictionaryWithObjects:&v123 forKeys:&v122 count:1];
    uint64_t v49 = +[NSError errorWithDomain:@"com.apple.wifi.analytics.errordomain" code:9009 userInfo:v46];
    uint64_t v50 = (void *)v103[5];
    v103[5] = v49;

    CFStringRef v59 = 0;
  }

  (*((void (**)(id, uint64_t, uint64_t))v60 + 2))(v60, v111[5], v103[5]);
  _Block_object_dispose(v100, 8);

  _Block_object_dispose(&v102, 8);
  _Block_object_dispose(v108, 8);

  _Block_object_dispose(&v110, 8);
}

- (void)_triggerDPSStudy:(int64_t)a3 forProcessToken:(id)a4 waMessage:(id)a5 andReply:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  dispatch_semaphore_t v105 = dispatch_semaphore_create(0);
  __int16 v13 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    BOOL dpsStudyInProgress = self->_dpsStudyInProgress;
    *(_DWORD *)buf = 136446722;
    id v115 = "-[WAEngine _triggerDPSStudy:forProcessToken:waMessage:andReply:]";
    __int16 v116 = 1024;
    int v117 = 4499;
    __int16 v118 = 1024;
    LODWORD(v119) = dpsStudyInProgress;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:_dpsStudyInProgress is %d", buf, 0x18u);
  }

  __int16 v15 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    id v115 = "-[WAEngine _triggerDPSStudy:forProcessToken:waMessage:andReply:]";
    __int16 v116 = 1024;
    int v117 = 4500;
    __int16 v118 = 2112;
    id v119 = v11;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Got WAMessage %@ ", buf, 0x1Cu);
  }

  BOOL v16 = [v11 key];
  unsigned int v17 = [v16 isEqualToString:@"DPSN"];

  if (!v17)
  {
    BOOL v19 = 0;
    goto LABEL_63;
  }
  id v18 = +[WAUtil getAWDTimestamp];
  BOOL v19 = !self->_dpsStudyInProgress;
  if (self->_dpsStudyInProgress)
  {
    BOOL dpsCurrentlyGatheringConsecutiveSamples = self->_dpsCurrentlyGatheringConsecutiveSamples;
    int v21 = WALogCategoryDefaultHandle();
    BOOL v22 = os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT);
    id v104 = v12;
    if (dpsCurrentlyGatheringConsecutiveSamples)
    {
      if (v22)
      {
        *(_DWORD *)buf = 136446466;
        id v115 = "-[WAEngine _triggerDPSStudy:forProcessToken:waMessage:andReply:]";
        __int16 v116 = 1024;
        int v117 = 4570;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Not adding dpsStatsContainer while _dpsCurrentlyGatheringConsecutiveSamples", buf, 0x12u);
      }
    }
    else
    {
      if (v22)
      {
        *(_DWORD *)buf = 136446466;
        id v115 = "-[WAEngine _triggerDPSStudy:forProcessToken:waMessage:andReply:]";
        __int16 v116 = 1024;
        int v117 = 4559;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Sampling another dpsStatsContainer", buf, 0x12u);
      }

      v111[0] = _NSConcreteStackBlock;
      v111[1] = 3221225472;
      v111[2] = sub_100068144;
      v111[3] = &unk_1000D16D0;
      v111[4] = self;
      [(WAEngine *)self _getNewMessageForKey:@"DPSCS" groupType:4 forProcessToken:v10 shouldCheckForPrePopulation:1 andReply:v111];
    }
  }
  else
  {
    if (self->_slowWiFiStudyInProgress)
    {
      __int16 v23 = WALogCategoryDefaultHandle();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136446466;
        id v115 = "-[WAEngine _triggerDPSStudy:forProcessToken:waMessage:andReply:]";
        __int16 v116 = 1024;
        int v117 = 4507;
        int v24 = "%{public}s::%d:Got Stall Notification when slowWiFiStudyInProgress, exiting";
        uint64_t v25 = v23;
        os_log_type_t v26 = OS_LOG_TYPE_DEBUG;
LABEL_106:
        _os_log_impl((void *)&_mh_execute_header, v25, v26, v24, buf, 0x12u);
        goto LABEL_107;
      }
      goto LABEL_107;
    }
    id v27 = v18;
    unsigned int v28 = [v11 fieldForKey:@"DPSN_symptom"];
    unsigned int v29 = [v28 int32Value];

    unint64_t v102 = __PAIR64__(v19, v29);
    if (v29)
    {
      int64_t v30 = a3;
      BOOL v31 = [v11 fieldForKey:@"DPSN_symptom"];
      unsigned int v32 = [v31 int32Value];

      long long v33 = WALogCategoryDefaultHandle();
      __int16 v23 = v33;
      if (v32 != 4)
      {
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v100 = [v11 fieldForKey:@"DPSN_symptom"];
          unsigned int v101 = [v100 int32Value];
          *(_DWORD *)buf = 136446722;
          id v115 = "-[WAEngine _triggerDPSStudy:forProcessToken:waMessage:andReply:]";
          __int16 v116 = 1024;
          int v117 = 4533;
          __int16 v118 = 1024;
          LODWORD(v119) = v101;
          _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEBUG, "%{public}s::%d:Got Stall Notification for symptom:%d when not currently in study, so ignore..", buf, 0x18u);
        }
        goto LABEL_107;
      }
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136446466;
        id v115 = "-[WAEngine _triggerDPSStudy:forProcessToken:waMessage:andReply:]";
        __int16 v116 = 1024;
        int v117 = 4517;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:DNS Study triggered by Symptoms DNS trigger", buf, 0x12u);
      }

      *(_WORD *)&self->_dpsNotificationDuringDnsStudy = 0;
      self->_BOOL dnsStudyInProgress = 1;
      dispatch_time_t v34 = (void *)os_transaction_create();
      id v35 = +[WAActivityManager sharedActivityManager];
      [v35 osTransactionCreate:"com.apple.wifianalytics.dnsStudyTransaction" transaction:v34];

      [(WAEngine *)self setDnsStudyTransaction:v34];
      [(WAEngine *)self clearDnsStudyVariables];
      dnsStudyQueue = self->_dnsStudyQueue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_1000680B8;
      block[3] = &unk_1000D0D98;
      void block[4] = self;
      dispatch_sync((dispatch_queue_t)dnsStudyQueue, block);
      a3 = v30;
    }
    else
    {
      dispatch_time_t v37 = WALogCategoryDefaultHandle();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136446466;
        id v115 = "-[WAEngine _triggerDPSStudy:forProcessToken:waMessage:andReply:]";
        __int16 v116 = 1024;
        int v117 = 4514;
        _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:DPS Study triggered by stall", buf, 0x12u);
      }
    }
    int64_t v38 = a3;
    int v39 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136446466;
      id v115 = "-[WAEngine _triggerDPSStudy:forProcessToken:waMessage:andReply:]";
      __int16 v116 = 1024;
      int v117 = 4537;
      _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEBUG, "%{public}s::%d:Got Stall Notification when not currently in study, kicking off DPS Study", buf, 0x12u);
    }
    id v104 = v12;

    self->_BOOL dpsStudyInProgress = 1;
    unsigned __int8 v40 = (void *)os_transaction_create();
    NSErrorUserInfoKey v41 = +[WAActivityManager sharedActivityManager];
    [v41 osTransactionCreate:"com.apple.wifianalytics.dpsStudyTransaction" transaction:v40];

    id v42 = v40;
    [(WAEngine *)self setDpsStudyTransaction:v42];

    self->_dpsAction = 0;
    uint64_t v43 = [v11 fieldForKey:@"DPSN_timestamp"];
    self->_dpsNotificationTimeInSeconds = (unint64_t)[v43 uint64Value] / 0x3E8;

    __int16 v44 = [v11 fieldForKey:@"DPSN_cca"];
    self->_dpsNotificationCCA = [v44 uint32Value];

    if (!v102)
    {
      peerDiagnosticsStudyQueue = self->_peerDiagnosticsStudyQueue;
      v112[0] = _NSConcreteStackBlock;
      v112[1] = 3221225472;
      v112[2] = sub_1000680FC;
      v112[3] = &unk_1000D16A8;
      v112[4] = self;
      v112[5] = 1;
      dispatch_async((dispatch_queue_t)peerDiagnosticsStudyQueue, v112);
    }
    id v46 = [v11 fieldForKey:@"DPSN_facetimeCallInProgress" inDictionary:v102];
    self->_isCriticalAppInUse = [v46 BOOLValue];

    id v47 = +[NSDate date];
    [(NSMutableDictionary *)self->_studyTimeStamps setObject:v47 forKeyedSubscript:@"start"];

    __int16 v48 = [v11 fieldForKey:@"DPSN_timestamp"];
    [v48 setUint64Value:v27];

    a3 = v38;
    BOOL v19 = v103;
  }
  uint64_t v49 = [v11 fieldForKey:@"DPSN_symptom"];
  if ([v49 int32Value] == 2)
  {
  }
  else
  {
    uint64_t v50 = [v11 fieldForKey:@"DPSN_symptom"];
    unsigned int v51 = [v50 int32Value];

    if (v51 != 3) {
      goto LABEL_35;
    }
  }
  self->_dpsAction |= 0x20u;
LABEL_35:
  uint64_t v52 = [v11 fieldForKey:@"DPSN_symptom"];
  if ([v52 int32Value] == 2)
  {
    dispatch_semaphore_t v53 = [(NSMutableDictionary *)self->_studyTimeStamps objectForKeyedSubscript:@"userToggle"];

    if (v53) {
      goto LABEL_39;
    }
    uint64_t v52 = +[NSDate date];
    [(NSMutableDictionary *)self->_studyTimeStamps setObject:v52 forKeyedSubscript:@"userToggle"];
  }

LABEL_39:
  CFStringRef v54 = [v11 fieldForKey:@"DPSN_symptom"];
  if ([v54 int32Value] == 2)
  {
    id v55 = [(NSMutableDictionary *)self->_studyTimeStamps objectForKeyedSubscript:@"decisionInstance"];
    if (!v55)
    {
      uint64_t v99 = [(NSMutableDictionary *)self->_studyTimeStamps objectForKeyedSubscript:@"UserToggleBeforeDecision"];

      if (!v99) {
        [(NSMutableDictionary *)self->_studyTimeStamps setObject:&__kCFBooleanTrue forKeyedSubscript:@"UserToggleBeforeDecision"];
      }
      goto LABEL_43;
    }
  }
LABEL_43:
  uint64_t v56 = [v11 fieldForKey:@"DPSN_symptom"];
  if ([v56 int32Value] == 2
    && ([(NSMutableDictionary *)self->_studyTimeStamps objectForKeyedSubscript:@"decisionInstance"], (uint64_t v57 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    NSErrorUserInfoKey v58 = (void *)v57;
    CFStringRef v59 = [(NSMutableDictionary *)self->_studyTimeStamps objectForKeyedSubscript:@"UserToggleBeforeDecision"];

    if (!v59) {
      [(NSMutableDictionary *)self->_studyTimeStamps setObject:&__kCFBooleanTrue forKeyedSubscript:@"UserToggleBeforeDecision"];
    }
  }
  else
  {
  }
  id v60 = [v11 fieldForKey:@"DPSN_symptom"];
  if ([v60 int32Value] == 3)
  {
    id v61 = [(NSMutableDictionary *)self->_studyTimeStamps objectForKeyedSubscript:@"decisionInstance"];

    if (!v61) {
      [(NSMutableDictionary *)self->_studyTimeStamps setObject:&__kCFBooleanTrue forKeyedSubscript:@"LinkUpBeforeDecision"];
    }
  }
  else
  {
  }
  __int16 v62 = [v11 fieldForKey:@"DPSN_symptom"];
  if ([v62 int32Value] == 3)
  {
    int v63 = [(NSMutableDictionary *)self->_studyTimeStamps objectForKeyedSubscript:@"decisionInstance"];

    id v12 = v104;
    if (v63) {
      [(NSMutableDictionary *)self->_studyTimeStamps setObject:&__kCFBooleanTrue forKeyedSubscript:@"LinkUpAfterDecision"];
    }
  }
  else
  {

    id v12 = v104;
  }
  id v64 = [v11 fieldForKey:@"DPSN_symptom"];
  if ([v64 int32Value])
  {
  }
  else
  {
    BOOL dnsStudyInProgress = self->_dnsStudyInProgress;

    if (dnsStudyInProgress) {
      self->_dpsNotificationDuringDnsStudy = 1;
    }
  }
  __int16 v66 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v66, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    id v115 = "-[WAEngine _triggerDPSStudy:forProcessToken:waMessage:andReply:]";
    __int16 v116 = 1024;
    int v117 = 4607;
    _os_log_impl((void *)&_mh_execute_header, v66, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Adding DPSR_stallNotifications", buf, 0x12u);
  }

  [(NSMutableArray *)self->_dpsnToAppend addObject:v11];
LABEL_63:
  if (!self->_dpsStudyInProgress)
  {
    __int16 v23 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      NSErrorUserInfoKey v74 = [v11 key];
      BOOL v75 = self->_dpsStudyInProgress;
      *(_DWORD *)buf = 136446978;
      id v115 = "-[WAEngine _triggerDPSStudy:forProcessToken:waMessage:andReply:]";
      __int16 v116 = 1024;
      int v117 = 4612;
      __int16 v118 = 2112;
      id v119 = v74;
      __int16 v120 = 1024;
      BOOL v121 = v75;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Dropping incomming key %@ because _dpsStudyInProgress is %d", buf, 0x22u);
    }
    goto LABEL_107;
  }
  id v67 = [v11 key];
  unsigned int v68 = [v67 isEqualToString:@"DPSAPS"];

  if (v68)
  {
    CFStringRef v69 = [v11 fieldForKey:@"DPSAPS_timestamp"];
    [v69 setUint64Value:+[WAUtil getAWDTimestamp](WAUtil, "getAWDTimestamp")];

    uint64_t v70 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v70, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446722;
      id v115 = "-[WAEngine _triggerDPSStudy:forProcessToken:waMessage:andReply:]";
      __int16 v116 = 1024;
      int v117 = 4619;
      __int16 v118 = 2112;
      id v119 = v11;
      _os_log_impl((void *)&_mh_execute_header, v70, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Adding DPSR_probeResults %@", buf, 0x1Cu);
    }

    [(NSMutableArray *)self->_dpsapToAppend addObject:v11];
    BOOL v71 = self->_dpsCurrentlyGatheringConsecutiveSamples;
    id v72 = WALogCategoryDefaultHandle();
    BOOL v73 = os_log_type_enabled(v72, OS_LOG_TYPE_DEFAULT);
    if (v71)
    {
      if (v73)
      {
        *(_DWORD *)buf = 136446466;
        id v115 = "-[WAEngine _triggerDPSStudy:forProcessToken:waMessage:andReply:]";
        __int16 v116 = 1024;
        int v117 = 4633;
        _os_log_impl((void *)&_mh_execute_header, v72, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Not adding dpsStatsContainer while _dpsCurrentlyGatheringConsecutiveSamples", buf, 0x12u);
      }
    }
    else
    {
      if (v73)
      {
        *(_DWORD *)buf = 136446466;
        id v115 = "-[WAEngine _triggerDPSStudy:forProcessToken:waMessage:andReply:]";
        __int16 v116 = 1024;
        int v117 = 4623;
        _os_log_impl((void *)&_mh_execute_header, v72, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Sampling another dpsStatsContainer", buf, 0x12u);
      }

      v110[0] = _NSConcreteStackBlock;
      v110[1] = 3221225472;
      v110[2] = sub_100068294;
      v110[3] = &unk_1000D16D0;
      v110[4] = self;
      [(WAEngine *)self _getNewMessageForKey:@"DPSCS" groupType:4 forProcessToken:v10 shouldCheckForPrePopulation:1 andReply:v110];
    }
  }
  v76 = [v11 key];
  unsigned int v77 = [v76 isEqualToString:@"WFAAWDWADAAD"];

  if (v77)
  {
    unsigned int v78 = [v11 fieldForKey:@"WFAAWDWADAAD_timestamp"];
    [v78 setUint64Value:+[WAUtil getAWDTimestamp](WAUtil, "getAWDTimestamp")];

    unsigned __int8 v79 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v79, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446722;
      id v115 = "-[WAEngine _triggerDPSStudy:forProcessToken:waMessage:andReply:]";
      __int16 v116 = 1024;
      int v117 = 4640;
      __int16 v118 = 2112;
      id v119 = v11;
      _os_log_impl((void *)&_mh_execute_header, v79, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Adding DPSE_associationChanges %@", buf, 0x1Cu);
    }

    [(NSMutableArray *)self->_assocDiffToAppend addObject:v11];
    __int16 v80 = [v11 fieldForKey:@"WFAAWDWADAAD_eventType"];
    if ([v80 int32Value] == 5)
    {
      uint64_t v81 = [(NSMutableDictionary *)self->_studyTimeStamps objectForKeyedSubscript:@"decisionInstance"];
      if (v81)
      {
        __int16 v82 = (void *)v81;
        v83 = [(NSMutableDictionary *)self->_studyTimeStamps objectForKeyedSubscript:@"IPConfiguredEventTimeStamp"];

        if (v83) {
          goto LABEL_84;
        }
        NSErrorUserInfoKey v84 = +[NSDate date];
        [(NSMutableDictionary *)self->_studyTimeStamps setObject:v84 forKeyedSubscript:@"IPConfiguredEventTimeStamp"];

        __int16 v80 = [v11 fieldForKey:@"WFAAWDWADAAD_additionalInfo"];
        CFStringRef v85 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [v80 uint32Value]);
        [(NSMutableDictionary *)self->_studyTimeStamps setObject:v85 forKeyedSubscript:@"IPAddressTypeOnInterface"];
      }
    }

LABEL_84:
    BOOL v86 = self->_dpsCurrentlyGatheringConsecutiveSamples;
    uint64_t v87 = WALogCategoryDefaultHandle();
    BOOL v88 = os_log_type_enabled(v87, OS_LOG_TYPE_DEFAULT);
    if (v86)
    {
      if (v88)
      {
        *(_DWORD *)buf = 136446466;
        id v115 = "-[WAEngine _triggerDPSStudy:forProcessToken:waMessage:andReply:]";
        __int16 v116 = 1024;
        int v117 = 4661;
        _os_log_impl((void *)&_mh_execute_header, v87, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Not adding dpsStatsContainer while _dpsCurrentlyGatheringConsecutiveSamples", buf, 0x12u);
      }
    }
    else
    {
      if (v88)
      {
        *(_DWORD *)buf = 136446466;
        id v115 = "-[WAEngine _triggerDPSStudy:forProcessToken:waMessage:andReply:]";
        __int16 v116 = 1024;
        int v117 = 4651;
        _os_log_impl((void *)&_mh_execute_header, v87, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Sampling another dpsStatsContainer", buf, 0x12u);
      }

      v109[0] = _NSConcreteStackBlock;
      v109[1] = 3221225472;
      v109[2] = sub_1000683B4;
      v109[3] = &unk_1000D16D0;
      v109[4] = self;
      [(WAEngine *)self _getNewMessageForKey:@"DPSCS" groupType:4 forProcessToken:v10 shouldCheckForPrePopulation:1 andReply:v109];
    }
  }
  uint64_t v89 = [v11 key];
  unsigned int v90 = [v89 isEqualToString:@"WFAAWDWAAAPI"];

  if (v90)
  {
    uint64_t v91 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v91, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446722;
      id v115 = "-[WAEngine _triggerDPSStudy:forProcessToken:waMessage:andReply:]";
      __int16 v116 = 1024;
      int v117 = 4666;
      __int16 v118 = 2112;
      id v119 = v11;
      _os_log_impl((void *)&_mh_execute_header, v91, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Adding DPSE_accessPointInfo %@", buf, 0x1Cu);
    }

    [(NSMutableArray *)self->_accessPointInfoToAppend addObject:v11];
  }
  char v92 = [v11 key];
  unsigned int v93 = [v92 isEqualToString:@"USBEN"];

  if (v93)
  {
    char v94 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v94, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446722;
      id v115 = "-[WAEngine _triggerDPSStudy:forProcessToken:waMessage:andReply:]";
      __int16 v116 = 1024;
      int v117 = 4671;
      __int16 v118 = 2112;
      id v119 = v11;
      _os_log_impl((void *)&_mh_execute_header, v94, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Adding DPSR_usbEvent %@", buf, 0x1Cu);
    }

    [(NSMutableArray *)self->_usbEventNotificationToAppend addObject:v11];
  }
  if (v19)
  {
    studyQueue = self->_studyQueue;
    v106[0] = _NSConcreteStackBlock;
    v106[1] = 3221225472;
    v106[2] = sub_1000684D4;
    v106[3] = &unk_1000D16F8;
    v106[4] = self;
    id v107 = v10;
    dispatch_group_t v96 = v105;
    objc_super v108 = v96;
    dispatch_async((dispatch_queue_t)studyQueue, v106);

    if (a3 == 1)
    {
      id v97 = [(RecommendationEngine *)self->_recommendationEngine preferences];
      dispatch_time_t v98 = dispatch_time(0, 1000000000 * [v97 dps_report_sent_after] + 5000000000);
      dispatch_semaphore_wait(v96, v98);

      __int16 v23 = WALogCategoryDefaultHandle();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136446466;
        id v115 = "-[WAEngine _triggerDPSStudy:forProcessToken:waMessage:andReply:]";
        __int16 v116 = 1024;
        int v117 = 4688;
        int v24 = "%{public}s::%d:unblocking is complete... returning";
LABEL_105:
        uint64_t v25 = v23;
        os_log_type_t v26 = OS_LOG_TYPE_DEFAULT;
        goto LABEL_106;
      }
    }
    else
    {
      __int16 v23 = WALogCategoryDefaultHandle();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136446466;
        id v115 = "-[WAEngine _triggerDPSStudy:forProcessToken:waMessage:andReply:]";
        __int16 v116 = 1024;
        int v117 = 4690;
        int v24 = "%{public}s::%d:returning immediatley";
        goto LABEL_105;
      }
    }
LABEL_107:
  }
  (*((void (**)(id, void, void))v12 + 2))(v12, 0, 0);
}

- (BOOL)isInternalScenario
{
  sub_100045570();
  if (!objc_opt_class()) {
    return 0;
  }
  id v3 = objc_alloc_init((Class)sub_100045570());
  id v9 = 0;
  unsigned __int8 v4 = [v3 queryDebugConfigurationForPeer:0 error:&v9];
  id v5 = v9;
  int v6 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446978;
    id v11 = "-[WAEngine isInternalScenario]";
    __int16 v12 = 1024;
    int v13 = 4705;
    __int16 v14 = 2112;
    __int16 v15 = v4;
    __int16 v16 = 2112;
    id v17 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Logging:: %@ \n error:%@", buf, 0x26u);
  }

  BOOL v7 = v4 && [v4 megaWiFiProfile] == (id)1 || self->_isInternalInstall;
  return v7;
}

- (void)triggerPeerDiagnosticsStudy:(unint64_t)a3 symptomsDnsStats:(id)a4
{
  id v6 = a4;
  BOOL v7 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    *(void *)&uint8_t buf[4] = "-[WAEngine triggerPeerDiagnosticsStudy:symptomsDnsStats:]";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 4712;
    *(_WORD *)&unsigned char buf[18] = 1024;
    *(_DWORD *)&buf[20] = a3;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:PeerDiagnostics: triggerPeerDiagnosticsStudy with type:%d", buf, 0x18u);
  }

  unsigned __int8 v8 = [(WAEngine *)self isInternalScenario];
  if (a3) {
    char v9 = v8;
  }
  else {
    char v9 = 1;
  }
  if (v9)
  {
    id v10 = dispatch_semaphore_create(0);
    id v11 = (void *)os_transaction_create();
    __int16 v12 = +[WAActivityManager sharedActivityManager];
    [v12 osTransactionCreate:"com.apple.wifianalytics.triggerPeerDiagnosticsStudy" transaction:v11];

    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    uint64_t v57 = sub_10004D654;
    NSErrorUserInfoKey v58 = sub_10004D664;
    id v59 = 0;
    uint64_t v43 = 0;
    __int16 v44 = &v43;
    uint64_t v45 = 0x3032000000;
    id v46 = sub_10004D654;
    id v47 = sub_10004D664;
    id v48 = 0;
    if ([(WAEngine *)self isWiFiAssociatedToNetwork])
    {
      int v13 = [(WAEngine *)self _DPSQuickRecoveryEngineObj];
      __int16 v14 = v13;
      if (v13)
      {
        if ([v13 isPeerDiagnosticsTriggerAllowed:a3])
        {
          sub_100068F7C();
          if (objc_opt_class())
          {
            sub_100045570();
            if (objc_opt_class())
            {
              id v15 = objc_alloc_init((Class)sub_100045570());
              if (v15)
              {
                __int16 v16 = [sub_100068F7C() requestWithTestID:60 configuration:0];
                id v55 = v16;
                id v17 = +[NSArray arrayWithObjects:&v55 count:1];

                v39[0] = _NSConcreteStackBlock;
                v39[1] = 3221225472;
                v39[2] = sub_100069060;
                v39[3] = &unk_1000D1720;
                NSErrorUserInfoKey v41 = buf;
                id v42 = &v43;
                unsigned __int8 v40 = v10;
                id v18 = [v15 runDiagnostics:v17 configuration:0 update:0 reply:v39];
              }
              dispatch_time_t v19 = dispatch_time(0, 6000000000);
              dispatch_semaphore_wait(v10, v19);
              if (!*(void *)(*(void *)&buf[8] + 40))
              {
                __int16 v20 = WALogCategoryDefaultHandle();
                if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
                {
                  uint64_t v21 = v44[5];
                  *(_DWORD *)uint64_t v49 = 136446722;
                  uint64_t v50 = "-[WAEngine triggerPeerDiagnosticsStudy:symptomsDnsStats:]";
                  __int16 v51 = 1024;
                  int v52 = 4745;
                  __int16 v53 = 2112;
                  uint64_t v54 = v21;
                  _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "%{public}s::%d:PeerDiagnostics: Data collection failed with err:%@", v49, 0x1Cu);
                }
              }
            }
          }
        }
      }
      if (a3) {
        goto LABEL_35;
      }
      BOOL v22 = [v6 fieldForKey:@"DPSR_dpsEpiloge"];
      __int16 v23 = [v22 subMessageValue];
      int v24 = [v23 fieldForKey:@"DPSE_symptomsDnsStats"];
      uint64_t v25 = [v24 subMessageValue];
      LODWORD(v38) = self->_cumulativeAverageCcaSinceStudyStart;
      id v26 = [v14 recommendSymptomsDpsRecovery:0 symptomsDnsStats:v25 awdlState:self->_isAWDLActivitySuspected currentSymptomsCondition:self->_isPoorSymptomsDnsConditions isLANPingSuccessful:self->_isGatewayReachable appUsage:self->_isCriticalAppInUse averageCCA:v38];

      id v27 = [(WAEngine *)self interfaceNameToApple80211InstanceMap];
      unsigned int v28 = [(WAEngine *)self infraInterfaceName];
      unsigned int v29 = [v27 objectForKeyedSubscript:v28];
      LODWORD(v24) = v29 == 0;

      if (v24) {
        [(WAEngine *)self queryInfraInterfaceInstanceAndChip];
      }
      [(WAEngine *)self _persist];
      if (v26 == (id)2)
      {
        dispatch_time_t v34 = WALogCategoryDefaultHandle();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)uint64_t v49 = 136446466;
          uint64_t v50 = "-[WAEngine triggerPeerDiagnosticsStudy:symptomsDnsStats:]";
          __int16 v51 = 1024;
          int v52 = 4768;
          _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:PeerDiagnostics: Triggering Reassoc for symptoms-dps", v49, 0x12u);
        }

        self->_dpsAction |= 0x80u;
        BOOL v31 = [(WAEngine *)self interfaceNameToApple80211InstanceMap];
        id v35 = [(WAEngine *)self infraInterfaceName];
        uint64_t v36 = [v31 objectForKeyedSubscript:v35];
        [v36 triggerReassociation:@"ReassociateOnDNSSymptoms"];
      }
      else if (v26 == (id)1)
      {
        int64_t v30 = WALogCategoryDefaultHandle();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)uint64_t v49 = 136446466;
          uint64_t v50 = "-[WAEngine triggerPeerDiagnosticsStudy:symptomsDnsStats:]";
          __int16 v51 = 1024;
          int v52 = 4764;
          _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:PeerDiagnostics: Triggering Trap for symptoms-dps", v49, 0x12u);
        }

        self->_dpsAction |= 0x40u;
        BOOL v31 = [(WAEngine *)self interfaceNameToApple80211InstanceMap];
        unsigned int v32 = [(WAEngine *)self infraInterfaceName];
        long long v33 = [v31 objectForKeyedSubscript:v32];
        [v33 triggerDpsReset:@"TrapOnDNSSymptoms"];
      }
      else
      {
        BOOL v31 = WALogCategoryDefaultHandle();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)uint64_t v49 = 136446466;
          uint64_t v50 = "-[WAEngine triggerPeerDiagnosticsStudy:symptomsDnsStats:]";
          __int16 v51 = 1024;
          int v52 = 4772;
          _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:PeerDiagnostics: No Recovery Action recommended for symptoms-dps", v49, 0x12u);
        }
      }
    }
    else
    {
      BOOL v31 = WALogCategoryDefaultHandle();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)uint64_t v49 = 136446466;
        uint64_t v50 = "-[WAEngine triggerPeerDiagnosticsStudy:symptomsDnsStats:]";
        __int16 v51 = 1024;
        int v52 = 4725;
        _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_ERROR, "%{public}s::%d:WiFi disassocited during study so not continuing...", v49, 0x12u);
      }
      __int16 v14 = 0;
    }

LABEL_35:
    dispatch_time_t v37 = +[WAActivityManager sharedActivityManager];
    [v37 osTransactionComplete:v11];

    _Block_object_dispose(&v43, 8);
    _Block_object_dispose(buf, 8);

    goto LABEL_36;
  }
  id v10 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    *(void *)&uint8_t buf[4] = "-[WAEngine triggerPeerDiagnosticsStudy:symptomsDnsStats:]";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 4714;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:PeerDiagnostics: peerDiagnosticsStudy disabled", buf, 0x12u);
  }
LABEL_36:
}

- (void)gatherConsecutiveLinkQualitySamples:(int64_t)a3 forProcessToken:(id)a4 andReply:(id)a5
{
  id v46 = a4;
  __int16 v44 = (void (**)(id, uint64_t, uint64_t))a5;
  uint64_t v74 = 0;
  BOOL v75 = &v74;
  uint64_t v76 = 0x3032000000;
  unsigned int v77 = sub_10004D654;
  unsigned int v78 = sub_10004D664;
  id v79 = 0;
  group = dispatch_group_create();
  dispatch_semaphore_t v43 = dispatch_semaphore_create(0);
  uint64_t v68 = 0;
  CFStringRef v69 = &v68;
  uint64_t v70 = 0x3032000000;
  BOOL v71 = sub_10004D654;
  id v72 = sub_10004D664;
  id v73 = 0;
  uint64_t v62 = 0;
  int v63 = &v62;
  uint64_t v64 = 0x3032000000;
  uint64_t v65 = sub_10004D654;
  __int16 v66 = sub_10004D664;
  id v67 = 0;
  uint64_t v8 = [(WAEngine *)self _cachedModelObjectsMessageForGroupType:4 key:@"SWFR"];
  char v9 = (void *)v69[5];
  v69[5] = v8;

  id v10 = +[WAUtil rotateUUIDsForMessage:v69[5]];
  id v11 = (void *)v69[5];
  if (v11)
  {
    __int16 v12 = [v11 fieldForKey:@"SWFR_timestamp"];
    [v12 setUint64Value:+[WAUtil getAWDTimestamp](WAUtil, "getAWDTimestamp")];

    dispatch_group_enter(group);
    int v13 = [(RecommendationEngine *)self->_recommendationEngine preferences];
    dispatch_time_t v14 = dispatch_time(0, 1000000000 * [v13 slow_wifi_report_sent_after]);
    dpsReadWriteSerialQueue = self->_dpsReadWriteSerialQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100069934;
    block[3] = &unk_1000D0D98;
    dispatch_group_t v41 = group;
    dispatch_group_t v61 = v41;
    dispatch_after(v14, (dispatch_queue_t)dpsReadWriteSerialQueue, block);

    for (unsigned int i = 0; ; unsigned int i = v18 + 1)
    {
      id v17 = [(RecommendationEngine *)self->_recommendationEngine preferences];
      unint64_t v18 = i;
      BOOL v19 = (unint64_t)[v17 slow_wifi_interrogation_sample_count] > i;

      if (!v19) {
        break;
      }
      dispatch_semaphore_t v21 = dispatch_semaphore_create(0);
      if (v18)
      {
        id v5 = [(RecommendationEngine *)self->_recommendationEngine preferences];
        int64_t v22 = 1000000 * [v5 slow_wifi_duration_between_samples];
      }
      else
      {
        int64_t v22 = 0;
      }
      dispatch_time_t v23 = dispatch_time(0, v22);
      int v24 = self->_dpsReadWriteSerialQueue;
      v54[0] = _NSConcreteStackBlock;
      v54[1] = 3221225472;
      v54[2] = sub_1000699F8;
      v54[3] = &unk_1000D17C0;
      v54[4] = self;
      uint64_t v59 = 4;
      id v55 = v46;
      uint64_t v57 = &v74;
      uint64_t v25 = v21;
      uint64_t v56 = v25;
      NSErrorUserInfoKey v58 = &v68;
      dispatch_after(v23, (dispatch_queue_t)v24, v54);
      if (v18) {

      }
      id v26 = [(RecommendationEngine *)self->_recommendationEngine preferences];
      BOOL v27 = (char *)[v26 slow_wifi_interrogation_sample_count] - 1 == (unsigned char *)v18;

      if (v27)
      {
        unsigned int v28 = WALogCategoryDefaultHandle();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136446466;
          v83 = "-[WAEngine gatherConsecutiveLinkQualitySamples:forProcessToken:andReply:]";
          __int16 v84 = 1024;
          int v85 = 4899;
          _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:slow_wifi_interrogation_sample_count hit", buf, 0x12u);
        }
      }
      dispatch_time_t v29 = dispatch_time(0, 20000000000);
      dispatch_semaphore_wait(v25, v29);
    }
    int64_t v30 = [(WAEngine *)self engineQ];
    v47[0] = _NSConcreteStackBlock;
    v47[1] = 3221225472;
    v47[2] = sub_10006A79C;
    v47[3] = &unk_1000D17E8;
    void v47[4] = self;
    uint64_t v50 = &v68;
    id v48 = v46;
    __int16 v51 = &v62;
    int v52 = &v74;
    uint64_t v53 = 4;
    BOOL v31 = v43;
    uint64_t v49 = v31;
    dispatch_group_notify(v41, v30, v47);

    if (a3 == 1)
    {
      unsigned int v32 = [(RecommendationEngine *)self->_recommendationEngine preferences];
      dispatch_time_t v33 = dispatch_time(0, 1000000000 * [v32 slow_wifi_report_sent_after] + 5000000000);
      dispatch_semaphore_wait(v31, v33);

      dispatch_time_t v34 = WALogCategoryDefaultHandle();
      if (!os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_20;
      }
      *(_DWORD *)buf = 136446466;
      v83 = "-[WAEngine gatherConsecutiveLinkQualitySamples:forProcessToken:andReply:]";
      __int16 v84 = 1024;
      int v85 = 4986;
      id v35 = "%{public}s::%d:unblocking is complete... returning";
    }
    else
    {
      dispatch_time_t v34 = WALogCategoryDefaultHandle();
      if (!os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_20;
      }
      *(_DWORD *)buf = 136446466;
      v83 = "-[WAEngine gatherConsecutiveLinkQualitySamples:forProcessToken:andReply:]";
      __int16 v84 = 1024;
      int v85 = 4988;
      id v35 = "%{public}s::%d:returning immediatley";
    }
    _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, v35, buf, 0x12u);
  }
  else
  {
    uint64_t v38 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      v83 = "-[WAEngine gatherConsecutiveLinkQualitySamples:forProcessToken:andReply:]";
      __int16 v84 = 1024;
      int v85 = 4791;
      __int16 v86 = 2112;
      CFStringRef v87 = @"SWFR";
      _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_ERROR, "%{public}s::%d:No model class found for key: %@. This is a CRITICAL error", buf, 0x1Cu);
    }

    NSErrorUserInfoKey v80 = NSLocalizedFailureReasonErrorKey;
    CFStringRef v81 = @"WAErrorCodeNotRegistered";
    dispatch_time_t v34 = +[NSDictionary dictionaryWithObjects:&v81 forKeys:&v80 count:1];
    uint64_t v39 = +[NSError errorWithDomain:@"com.apple.wifi.analytics.errordomain" code:9009 userInfo:v34];
    unsigned __int8 v40 = (void *)v63[5];
    void v63[5] = v39;
  }
LABEL_20:

  uint64_t v36 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v37 = (const __CFString *)v75[5];
    *(_DWORD *)buf = 136446722;
    v83 = "-[WAEngine gatherConsecutiveLinkQualitySamples:forProcessToken:andReply:]";
    __int16 v84 = 1024;
    int v85 = 4992;
    __int16 v86 = 2112;
    CFStringRef v87 = v37;
    _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:retErr will return %@", buf, 0x1Cu);
  }

  v44[2](v44, v69[5], v75[5]);
  _Block_object_dispose(&v62, 8);

  _Block_object_dispose(&v68, 8);
  _Block_object_dispose(&v74, 8);
}

- (void)_triggerSlowWiFiStudy:(int64_t)a3 forProcessToken:(id)a4 waMessage:(id)a5 andReply:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  __int16 v12 = (void (**)(id, void, uint64_t))a6;
  uint64_t v46 = 0;
  id v47 = &v46;
  uint64_t v48 = 0x3032000000;
  uint64_t v49 = sub_10004D654;
  uint64_t v50 = sub_10004D664;
  id v51 = 0;
  dispatch_semaphore_t v13 = dispatch_semaphore_create(0);
  dispatch_time_t v14 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    id v15 = [v11 key];
    *(_DWORD *)buf = 136446722;
    uint64_t v53 = "-[WAEngine _triggerSlowWiFiStudy:forProcessToken:waMessage:andReply:]";
    __int16 v54 = 1024;
    int v55 = 5006;
    __int16 v56 = 2112;
    id v57 = v15;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Got WAMessageAWD%@ ", buf, 0x1Cu);
  }
  __int16 v16 = [v11 key];
  unsigned int v17 = [v16 isEqualToString:@"WFAAWDSWFN"];

  if (v17)
  {
    unint64_t v18 = [v11 fieldForKey:@"WFAAWDSWFN_timestamp"];
    [v18 setUint64Value:+[WAUtil getAWDTimestamp](WAUtil, "getAWDTimestamp")];

    BOOL v19 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      BOOL slowWiFiStudyInProgress = self->_slowWiFiStudyInProgress;
      *(_DWORD *)buf = 136446722;
      uint64_t v53 = "-[WAEngine _triggerSlowWiFiStudy:forProcessToken:waMessage:andReply:]";
      __int16 v54 = 1024;
      int v55 = 5010;
      __int16 v56 = 1024;
      LODWORD(v57) = slowWiFiStudyInProgress;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:_slowWiFiStudyInProgress is %d", buf, 0x18u);
    }

    BOOL v21 = !self->_slowWiFiStudyInProgress;
    if (!self->_slowWiFiStudyInProgress)
    {
      if (self->_dnsStudyInProgress) {
        self->_slowWiFiNotificationDuringDnsStudy = 1;
      }
      BOOL dpsStudyInProgress = self->_dpsStudyInProgress;
      int64_t v30 = WALogCategoryDefaultHandle();
      BOOL v37 = os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG);
      if (dpsStudyInProgress)
      {
        if (!v37) {
          goto LABEL_24;
        }
        *(_DWORD *)buf = 136446466;
        uint64_t v53 = "-[WAEngine _triggerSlowWiFiStudy:forProcessToken:waMessage:andReply:]";
        __int16 v54 = 1024;
        int v55 = 5018;
        BOOL v31 = "%{public}s::%d:Got Slow WiFi Notification when dpsStudyInProgress, exiting";
        unsigned int v32 = v30;
        os_log_type_t v33 = OS_LOG_TYPE_DEBUG;
        goto LABEL_23;
      }
      if (v37)
      {
        *(_DWORD *)buf = 136446466;
        uint64_t v53 = "-[WAEngine _triggerSlowWiFiStudy:forProcessToken:waMessage:andReply:]";
        __int16 v54 = 1024;
        int v55 = 5022;
        _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEBUG, "%{public}s::%d:Got Slow WiFi Notification when not currently in study, kicking off Study", buf, 0x12u);
      }

      self->_BOOL slowWiFiStudyInProgress = 1;
      uint64_t v38 = (void *)os_transaction_create();
      uint64_t v39 = +[WAActivityManager sharedActivityManager];
      [v39 osTransactionCreate:"com.apple.wifianalytics.slowwifiStudyTransaction" transaction:v38];

      [(WAEngine *)self setSlowwifiStudyTransaction:v38];
      peerDiagnosticsStudyQueue = self->_peerDiagnosticsStudyQueue;
      v45[0] = _NSConcreteStackBlock;
      v45[1] = 3221225472;
      v45[2] = sub_10006BDBC;
      v45[3] = &unk_1000D0D98;
      v45[4] = self;
      dispatch_async((dispatch_queue_t)peerDiagnosticsStudyQueue, v45);
    }
    int64_t v22 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446466;
      uint64_t v53 = "-[WAEngine _triggerSlowWiFiStudy:forProcessToken:waMessage:andReply:]";
      __int16 v54 = 1024;
      int v55 = 5035;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Adding _swfnToAppend", buf, 0x12u);
    }

    [(NSMutableArray *)self->_swfnToAppend addObject:v11];
  }
  else
  {
    BOOL v21 = 0;
  }
  if (self->_slowWiFiStudyInProgress)
  {
    dispatch_time_t v23 = [v11 key];
    unsigned int v24 = [v23 isEqualToString:@"USBEN"];

    if (v24)
    {
      uint64_t v25 = WALogCategoryDefaultHandle();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136446722;
        uint64_t v53 = "-[WAEngine _triggerSlowWiFiStudy:forProcessToken:waMessage:andReply:]";
        __int16 v54 = 1024;
        int v55 = 5040;
        __int16 v56 = 2112;
        id v57 = v11;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Adding _usbEvent %@", buf, 0x1Cu);
      }

      [(NSMutableArray *)self->_usbEventNotificationToAppend addObject:v11];
    }
  }
  if (v21)
  {
    studyQueue = self->_studyQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10006BE08;
    block[3] = &unk_1000D1838;
    void block[4] = self;
    id v42 = v10;
    __int16 v44 = &v46;
    BOOL v27 = v13;
    dispatch_semaphore_t v43 = v27;
    dispatch_async((dispatch_queue_t)studyQueue, block);

    if (a3 == 1)
    {
      unsigned int v28 = [(RecommendationEngine *)self->_recommendationEngine preferences];
      dispatch_time_t v29 = dispatch_time(0, 1000000000 * [v28 slow_wifi_report_sent_after] + 5000000000);
      dispatch_semaphore_wait(v27, v29);

      int64_t v30 = WALogCategoryDefaultHandle();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136446466;
        uint64_t v53 = "-[WAEngine _triggerSlowWiFiStudy:forProcessToken:waMessage:andReply:]";
        __int16 v54 = 1024;
        int v55 = 5060;
        BOOL v31 = "%{public}s::%d:unblocking is complete... returning";
LABEL_22:
        unsigned int v32 = v30;
        os_log_type_t v33 = OS_LOG_TYPE_DEFAULT;
LABEL_23:
        _os_log_impl((void *)&_mh_execute_header, v32, v33, v31, buf, 0x12u);
      }
    }
    else
    {
      int64_t v30 = WALogCategoryDefaultHandle();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136446466;
        uint64_t v53 = "-[WAEngine _triggerSlowWiFiStudy:forProcessToken:waMessage:andReply:]";
        __int16 v54 = 1024;
        int v55 = 5062;
        BOOL v31 = "%{public}s::%d:returning immediatley";
        goto LABEL_22;
      }
    }
LABEL_24:
  }
  dispatch_time_t v34 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
  {
    id v35 = (void *)v47[5];
    *(_DWORD *)buf = 136446722;
    uint64_t v53 = "-[WAEngine _triggerSlowWiFiStudy:forProcessToken:waMessage:andReply:]";
    __int16 v54 = 1024;
    int v55 = 5066;
    __int16 v56 = 2112;
    id v57 = v35;
    _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:gatherConsecutiveLinkQualitySamples reply err %@", buf, 0x1Cu);
  }

  v12[2](v12, 0, v47[5]);
  _Block_object_dispose(&v46, 8);
}

- (void)_triggerDatapathDiagnosticsAndCollectUpdates:(int64_t)a3 forProcessToken:(id)a4 waMessage:(id)a5 andReply:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  uint64_t v25 = 0;
  id v26 = &v25;
  uint64_t v27 = 0x3032000000;
  unsigned int v28 = sub_10004D654;
  dispatch_time_t v29 = sub_10004D664;
  id v30 = 0;
  if (!self->_appleCaptiveServerIP) {
    [(WAEngine *)self resolveAppleCaptiveServer];
  }
  dispatch_semaphore_t v13 = [v11 key];
  if ([v13 isEqualToString:@"DPSN"]) {
    goto LABEL_10;
  }
  dispatch_time_t v14 = [v11 key];
  if ([v14 isEqualToString:@"DPSAPS"])
  {
LABEL_9:

LABEL_10:
LABEL_11:
    unsigned int v17 = v24;
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_10006C2D8;
    v24[3] = &unk_1000D1860;
    void v24[5] = &v25;
    void v24[4] = v12;
    [(WAEngine *)self _triggerDPSStudy:a3 forProcessToken:v10 waMessage:v11 andReply:v24];
    goto LABEL_12;
  }
  id v15 = [v11 key];
  if ([v15 isEqualToString:@"WFAAWDWADAAD"])
  {
LABEL_8:

    goto LABEL_9;
  }
  __int16 v16 = [v11 key];
  if ([v16 isEqualToString:@"WFAAWDWAAAPI"])
  {

    goto LABEL_8;
  }
  unint64_t v18 = [v11 key];
  unsigned __int8 v22 = [v18 isEqualToString:@"USBEN"];

  if (v22) {
    goto LABEL_11;
  }
  BOOL v19 = [v11 key];
  if ([v19 isEqualToString:@"WFAAWDSWFN"])
  {
  }
  else
  {
    __int16 v20 = [v11 key];
    unsigned int v21 = [v20 isEqualToString:@"USBEN"];

    if (!v21) {
      goto LABEL_13;
    }
  }
  unsigned int v17 = v23;
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_10006C364;
  v23[3] = &unk_1000D1860;
  void v23[5] = &v25;
  void v23[4] = v12;
  [(WAEngine *)self _triggerSlowWiFiStudy:a3 forProcessToken:v10 waMessage:v11 andReply:v23];
LABEL_12:

LABEL_13:
  (*((void (**)(id, void, uint64_t))v12 + 2))(v12, 0, v26[5]);
  _Block_object_dispose(&v25, 8);
}

- (id)getNewMessageForKey:(id)a3 groupType:(int64_t)a4 forProcessWithToken:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = WALogCategoryDefaultHandle();
  if (os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v10, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "getNewMessageForKey", "", buf, 2u);
  }

  *(void *)buf = 0;
  unsigned int v21 = buf;
  uint64_t v22 = 0x3032000000;
  dispatch_time_t v23 = sub_10004D654;
  unsigned int v24 = sub_10004D664;
  id v25 = 0;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10006C620;
  v17[3] = &unk_1000D1810;
  BOOL v19 = buf;
  id v11 = dispatch_semaphore_create(0);
  unint64_t v18 = v11;
  [(WAEngine *)self _getNewMessageForKey:v8 groupType:a4 forProcessToken:v9 shouldCheckForPrePopulation:0 andReply:v17];
  dispatch_time_t v12 = dispatch_time(0, 15000000000);
  dispatch_semaphore_wait(v11, v12);
  dispatch_semaphore_t v13 = WALogCategoryDefaultHandle();
  if (os_signpost_enabled(v13))
  {
    *(_WORD *)__int16 v16 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v13, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "getNewMessageForKey", "", v16, 2u);
  }

  id v14 = *((id *)v21 + 5);
  _Block_object_dispose(buf, 8);

  return v14;
}

- (id)getNewMessageForKey:(id)a3 groupType:(int64_t)a4 withCopy:(BOOL)a5 forProcessWithToken:(id)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a6;
  dispatch_time_t v12 = WALogCategoryDefaultHandle();
  if (os_signpost_enabled(v12))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v12, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "getNewMessageForKey withCopy", "", buf, 2u);
  }

  *(void *)buf = 0;
  dispatch_time_t v23 = buf;
  uint64_t v24 = 0x3032000000;
  id v25 = sub_10004D654;
  id v26 = sub_10004D664;
  id v27 = 0;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_10006C8B8;
  v19[3] = &unk_1000D1810;
  unsigned int v21 = buf;
  dispatch_semaphore_t v13 = dispatch_semaphore_create(0);
  __int16 v20 = v13;
  [(WAEngine *)self _getNewMessageForKey:v10 groupType:a4 withCopy:v7 forProcessToken:v11 shouldCheckForPrePopulation:0 andReply:v19];
  dispatch_time_t v14 = dispatch_time(0, 15000000000);
  dispatch_semaphore_wait(v13, v14);
  id v15 = WALogCategoryDefaultHandle();
  if (os_signpost_enabled(v15))
  {
    *(_WORD *)unint64_t v18 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v15, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "getNewMessageForKey withCopy", "", v18, 2u);
  }

  id v16 = *((id *)v23 + 5);
  _Block_object_dispose(buf, 8);

  return v16;
}

- (void)persist
{
  engineQ = self->_engineQ;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10006C98C;
  block[3] = &unk_1000D0D98;
  void block[4] = self;
  dispatch_sync((dispatch_queue_t)engineQ, block);
}

- (id)_setDeviceAnalyticsConfiguration:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (!v4) {
    goto LABEL_35;
  }
  id v6 = [v4 objectForKeyedSubscript:@"WA_DEVICE_ANALYTICS_PROCESSING_INTERVAL"];
  if (v6
    || ([v5 objectForKeyedSubscript:@"WA_DEVICE_ANALYTICS_AGE_OUT_INTERVAL"],
        (id v6 = objc_claimAutoreleasedReturnValue()) != 0)
    || ([v5 objectForKeyedSubscript:@"WA_DEVICE_ANALYTICS_CONFIG_AGE_OUT_TEST_DAYS_DIFF"],
        (id v6 = objc_claimAutoreleasedReturnValue()) != 0)
    || ([v5 objectForKeyedSubscript:@"WA_DEVICE_ANALYTICS_CONFIG_DEPLOYMENT_METRIC_DAYS_DIFF"],
        (id v6 = objc_claimAutoreleasedReturnValue()) != 0))
  {

    goto LABEL_7;
  }
  dispatch_time_t v34 = [v5 objectForKeyedSubscript:@"WA_DEVICE_ANALYTICS_CONFIG_ROAM_SAMPLES"];

  if (!v34)
  {
LABEL_35:
    id v35 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      uint64_t v39 = "-[WAEngine _setDeviceAnalyticsConfiguration:]";
      __int16 v40 = 1024;
      int v41 = 5165;
      __int16 v42 = 2048;
      uint64_t v43 = 5;
      _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_ERROR, "%{public}s::%d:For grouptype: %ld invalid configuration", buf, 0x1Cu);
    }

    NSErrorUserInfoKey v36 = NSLocalizedFailureReasonErrorKey;
    CFStringRef v37 = @"WAErrorCodeLacksRequiredArgument";
    BOOL v31 = +[NSDictionary dictionaryWithObjects:&v37 forKeys:&v36 count:1];
    unsigned int v32 = +[NSError errorWithDomain:@"com.apple.wifi.analytics.errordomain" code:9010 userInfo:v31];
    id v27 = 0;
    goto LABEL_29;
  }
LABEL_7:
  BOOL v7 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136446722;
    uint64_t v39 = "-[WAEngine _setDeviceAnalyticsConfiguration:]";
    __int16 v40 = 1024;
    int v41 = 5167;
    __int16 v42 = 2112;
    uint64_t v43 = (uint64_t)v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "%{public}s::%d:Received configuration: %@", buf, 0x1Cu);
  }

  id v8 = [v5 objectForKeyedSubscript:@"WA_DEVICE_ANALYTICS_PROCESSING_INTERVAL"];
  id v9 = v8;
  if (v8)
  {
    [v8 doubleValue];
    -[WAEngine setAnalyticsProcessingTimeIntervalSecs:](self, "setAnalyticsProcessingTimeIntervalSecs:");
    id v10 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      [(WAEngine *)self analyticsProcessingTimeIntervalSecs];
      *(_DWORD *)buf = 136446722;
      uint64_t v39 = "-[WAEngine _setDeviceAnalyticsConfiguration:]";
      __int16 v40 = 1024;
      int v41 = 5171;
      __int16 v42 = 2048;
      uint64_t v43 = v11;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "%{public}s::%d:Updated analyticsProcessingTimeInterval to %2.2f seconds", buf, 0x1Cu);
    }
  }
  dispatch_time_t v12 = [v5 objectForKeyedSubscript:@"WA_DEVICE_ANALYTICS_AGE_OUT_INTERVAL"];

  if (v12)
  {
    [v12 doubleValue];
    -[WAEngine setAnalyticsAgeOutTimeIntervalSecs:](self, "setAnalyticsAgeOutTimeIntervalSecs:");
    dispatch_semaphore_t v13 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      [(WAEngine *)self analyticsAgeOutTimeIntervalSecs];
      *(_DWORD *)buf = 136446722;
      uint64_t v39 = "-[WAEngine _setDeviceAnalyticsConfiguration:]";
      __int16 v40 = 1024;
      int v41 = 5177;
      __int16 v42 = 2048;
      uint64_t v43 = v14;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "%{public}s::%d:Updated analyticsAgeOutTimeInterval to %2.2f seconds", buf, 0x1Cu);
    }
  }
  id v15 = [v5 objectForKeyedSubscript:@"WA_DEVICE_ANALYTICS_CONFIG_AGE_OUT_TEST_DAYS_DIFF"];

  if (v15)
  {
    id v16 = [v15 unsignedLongValue];
    unsigned int v17 = [(WAEngine *)self analyticsProcessor];
    [v17 setTestDateDiffDays:v16];

    unint64_t v18 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      BOOL v19 = [(WAEngine *)self analyticsProcessor];
      id v20 = [v19 testDateDiffDays];
      *(_DWORD *)buf = 136446722;
      uint64_t v39 = "-[WAEngine _setDeviceAnalyticsConfiguration:]";
      __int16 v40 = 1024;
      int v41 = 5183;
      __int16 v42 = 2048;
      uint64_t v43 = (uint64_t)v20;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEBUG, "%{public}s::%d:Updated testDateDiffDays to %lu days", buf, 0x1Cu);
    }
  }
  unsigned int v21 = [v5 objectForKeyedSubscript:@"WA_DEVICE_ANALYTICS_CONFIG_DEPLOYMENT_METRIC_DAYS_DIFF"];

  if (v21)
  {
    id v22 = [v21 unsignedLongValue];
    dispatch_time_t v23 = [(WAEngine *)self analyticsProcessor];
    [v23 setDeploymentMetricDiffDays:v22];

    uint64_t v24 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
    {
      id v25 = [(WAEngine *)self analyticsProcessor];
      id v26 = [v25 deploymentMetricDiffDays];
      *(_DWORD *)buf = 136446722;
      uint64_t v39 = "-[WAEngine _setDeviceAnalyticsConfiguration:]";
      __int16 v40 = 1024;
      int v41 = 5189;
      __int16 v42 = 2048;
      uint64_t v43 = (uint64_t)v26;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEBUG, "%{public}s::%d:Updated deploymentMetricDiffDays to %lu days", buf, 0x1Cu);
    }
  }
  id v27 = [v5 objectForKeyedSubscript:@"WA_DEVICE_ANALYTICS_CONFIG_ROAM_SAMPLES"];

  if (v27)
  {
    unsigned int v28 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
    {
      id v29 = [v27 unsignedLongValue];
      *(_DWORD *)buf = 136446722;
      uint64_t v39 = "-[WAEngine _setDeviceAnalyticsConfiguration:]";
      __int16 v40 = 1024;
      int v41 = 5194;
      __int16 v42 = 2048;
      uint64_t v43 = (uint64_t)v29;
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEBUG, "%{public}s::%d:Roam Samples %lu ", buf, 0x1Cu);
    }

    id v30 = [v27 unsignedLongValue];
    BOOL v31 = [(WAEngine *)self analyticsProcessor];
    [v31 setNumRoamSamples:v30];
    unsigned int v32 = 0;
LABEL_29:

    goto LABEL_31;
  }
  unsigned int v32 = 0;
LABEL_31:

  return v32;
}

- (id)_getDeviceAnalyticsConfiguration
{
  v11[0] = @"WA_DEVICE_ANALYTICS_PROCESSING_INTERVAL";
  [(WAEngine *)self analyticsProcessingTimeIntervalSecs];
  id v3 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  v12[0] = v3;
  v11[1] = @"WA_DEVICE_ANALYTICS_AGE_OUT_INTERVAL";
  [(WAEngine *)self analyticsAgeOutTimeIntervalSecs];
  id v4 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  v12[1] = v4;
  v11[2] = @"WA_DEVICE_ANALYTICS_CONFIG_AGE_OUT_TEST_DAYS_DIFF";
  id v5 = [(WAEngine *)self analyticsProcessor];
  id v6 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v5 testDateDiffDays]);
  v12[2] = v6;
  v11[3] = @"WA_DEVICE_ANALYTICS_CONFIG_DEPLOYMENT_METRIC_DAYS_DIFF";
  BOOL v7 = [(WAEngine *)self analyticsProcessor];
  id v8 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v7 deploymentMetricDiffDays]);
  v12[3] = v8;
  id v9 = +[NSDictionary dictionaryWithObjects:v12 forKeys:v11 count:4];

  return v9;
}

- (void)triggerDeviceAnalyticsStoreMigrationAndReply:(id)a3
{
}

- (void)setValueForKeyToUserDefaults:(id)a3 forKey:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (!v6)
  {
    id v8 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v9 = 136446466;
      id v10 = "-[WAEngine setValueForKeyToUserDefaults:forKey:]";
      __int16 v11 = 1024;
      int v12 = 5222;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "%{public}s::%d:key is nil", (uint8_t *)&v9, 0x12u);
    }
    goto LABEL_4;
  }
  BOOL v7 = +[NSUserDefaults standardUserDefaults];
  if (v7)
  {
    id v8 = v7;
    [v7 setObject:v5 forKey:v6];
    [v8 synchronize];
LABEL_4:
  }
}

- (id)getValueForKeyFromUserDefaults:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    id v4 = +[NSUserDefaults standardUserDefaults];
    id v5 = [v4 valueForKey:v3];
  }
  else
  {
    BOOL v7 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v8 = 136446466;
      int v9 = "-[WAEngine getValueForKeyFromUserDefaults:]";
      __int16 v10 = 1024;
      int v11 = 5237;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "%{public}s::%d:key is nil", (uint8_t *)&v8, 0x12u);
    }

    id v5 = 0;
  }

  return v5;
}

- (void)storeWAMessageToDB:(id)a3
{
  id v4 = a3;
  if (![(WAEngine *)self analyticsProcessorIsReady])
  {
    int v8 = WALogCategoryDefaultHandle();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_6;
    }
    *(_DWORD *)buf = 136446466;
    unint64_t v18 = "-[WAEngine storeWAMessageToDB:]";
    __int16 v19 = 1024;
    int v20 = 5247;
    dispatch_semaphore_t v13 = "%{public}s::%d:AnalyticsProcessor not ready";
    uint64_t v14 = v8;
    os_log_type_t v15 = OS_LOG_TYPE_DEFAULT;
LABEL_13:
    _os_log_impl((void *)&_mh_execute_header, v14, v15, v13, buf, 0x12u);
    goto LABEL_6;
  }
  id v5 = [(WAEngine *)self analyticsProcessor];

  if (!v5)
  {
    int v8 = WALogCategoryDefaultHandle();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      goto LABEL_6;
    }
    *(_DWORD *)buf = 136446466;
    unint64_t v18 = "-[WAEngine storeWAMessageToDB:]";
    __int16 v19 = 1024;
    int v20 = 5248;
    dispatch_semaphore_t v13 = "%{public}s::%d:analyticsProcessor nil";
    uint64_t v14 = v8;
    os_log_type_t v15 = OS_LOG_TYPE_ERROR;
    goto LABEL_13;
  }
  id v6 = WALogCategoryDeviceStoreHandle();
  if (os_signpost_enabled(v6))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v6, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "storeWAMessageToDB", "", buf, 2u);
  }

  engineQ = self->_engineQ;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10006D634;
  block[3] = &unk_1000D0D98;
  void block[4] = self;
  dispatch_sync((dispatch_queue_t)engineQ, block);
  int v8 = [(WAEngine *)self analyticsProcessor];
  int v9 = [v4 metricName];
  __int16 v10 = [v4 metricInfo];
  int v11 = [v10 objectForKeyedSubscript:kWAMessageValue];
  [v8 processWAMessageMetric:v9 data:v11];

LABEL_6:
  int v12 = WALogCategoryDeviceStoreHandle();
  if (os_signpost_enabled(v12))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v12, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "storeWAMessageToDB", "", buf, 2u);
  }
}

- (void)processMetricDictOffEngine:(id)a3 data:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_engineQ);
  engineQ = self->_engineQ;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10006D728;
  block[3] = &unk_1000D16F8;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync((dispatch_queue_t)engineQ, block);
}

- (void)processMetricDictOnEngine:(id)a3 data:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_engineQ);
  int v8 = WALogCategoryDefaultHandle();
  if (os_signpost_enabled(v8))
  {
    LOWORD(v15) = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v8, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "processMetricDictOnEngine", "", (uint8_t *)&v15, 2u);
  }

  if ([(WAEngine *)self analyticsProcessorIsReady])
  {
    id v9 = [(WAEngine *)self analyticsProcessor];

    if (v9)
    {
      +[WAUtil incrementValueForKey:@"AnalyticsProcessor: Process Metric" inMutableDict:self->_cachedUsage onQueue:self->_engineQ];
      [(AnalyticsProcessor *)self->_analyticsProcessor processWAMessageMetric:v6 data:v7];
      goto LABEL_6;
    }
    int v11 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      int v15 = 136446466;
      id v16 = "-[WAEngine processMetricDictOnEngine:data:]";
      __int16 v17 = 1024;
      int v18 = 5284;
      id v12 = "%{public}s::%d:AnalyticsProcessor nil";
      id v13 = v11;
      os_log_type_t v14 = OS_LOG_TYPE_ERROR;
      goto LABEL_13;
    }
  }
  else
  {
    int v11 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 136446466;
      id v16 = "-[WAEngine processMetricDictOnEngine:data:]";
      __int16 v17 = 1024;
      int v18 = 5283;
      id v12 = "%{public}s::%d:AnalyticsProcessor not ready";
      id v13 = v11;
      os_log_type_t v14 = OS_LOG_TYPE_DEFAULT;
LABEL_13:
      _os_log_impl((void *)&_mh_execute_header, v13, v14, v12, (uint8_t *)&v15, 0x12u);
    }
  }

LABEL_6:
  id v10 = WALogCategoryDefaultHandle();
  if (os_signpost_enabled(v10))
  {
    LOWORD(v15) = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v10, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "processMetricDictOnEngine", "", (uint8_t *)&v15, 2u);
  }
}

- (id)_summarizeDeviceAnalyticsForNetwork:(id)a3 maxAgeInDays:(unint64_t)a4
{
  id v6 = a3;
  id v7 = [(WAEngine *)self fileHandlingQ];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10006DA78;
  block[3] = &unk_1000D0D98;
  void block[4] = self;
  dispatch_sync(v7, block);

  +[WAUtil incrementValueForKey:@"AnalyticsProcessor: Summarize Analytics For Network" inMutableDict:self->_cachedUsage onQueue:self->_engineQ];
  int v8 = [(WAEngine *)self analyticsProcessor];
  id v9 = [v8 summarizeAnalyticsForNetwork:v6 maxAgeInDays:a4];

  return v9;
}

- (void)processWiFiAnalyticsManagedFault:(id)a3
{
  id v4 = a3;
  id v5 = [v4 metricInfo];
  id v6 = [v5 objectForKeyedSubscript:kWAMessageKeyFaultName];
  uint64_t v7 = kWAMessageValue;
  int v8 = [v6 objectForKeyedSubscript:kWAMessageValue];

  id v9 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    os_log_type_t v33 = "-[WAEngine processWiFiAnalyticsManagedFault:]";
    __int16 v34 = 1024;
    int v35 = 5313;
    __int16 v36 = 2112;
    CFStringRef v37 = v8;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:processWiFiAnalyticsManagedFault: FaultName %@", buf, 0x1Cu);
  }

  if (![(WAEngine *)self analyticsProcessorIsReady])
  {
    id v12 = WALogCategoryDefaultHandle();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_30;
    }
    *(_DWORD *)buf = 136446466;
    os_log_type_t v33 = "-[WAEngine processWiFiAnalyticsManagedFault:]";
    __int16 v34 = 1024;
    int v35 = 5316;
    unsigned int v28 = "%{public}s::%d:AnalyticsProcessor not ready";
    id v29 = v12;
    os_log_type_t v30 = OS_LOG_TYPE_DEFAULT;
LABEL_37:
    _os_log_impl((void *)&_mh_execute_header, v29, v30, v28, buf, 0x12u);
    goto LABEL_30;
  }
  id v10 = [(WAEngine *)self analyticsProcessor];

  int v11 = WALogCategoryDefaultHandle();
  id v12 = v11;
  if (!v10)
  {
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      goto LABEL_30;
    }
    *(_DWORD *)buf = 136446466;
    os_log_type_t v33 = "-[WAEngine processWiFiAnalyticsManagedFault:]";
    __int16 v34 = 1024;
    int v35 = 5317;
    unsigned int v28 = "%{public}s::%d:analyticsProcessor nil";
    id v29 = v12;
    os_log_type_t v30 = OS_LOG_TYPE_ERROR;
    goto LABEL_37;
  }
  if (os_signpost_enabled(v11))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v12, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "processWiFiAnalyticsManagedFault", "", buf, 2u);
  }

  +[WAUtil incrementValueForKey:@"Operation: Forwarded Fault" inMutableDict:self->_cachedUsage onQueue:self->_engineQ];
  id v12 = [(WAEngine *)self getW5Client];
  if (v12)
  {
    if ([v8 containsString:@"FaultReasonSiriTimedOut"])
    {
      uint64_t v13 = 3;
    }
    else if ([v8 containsString:@"FaultReasonAirplayRealtimeAudioUnderrun"])
    {
      uint64_t v13 = 1;
    }
    else if ([v8 containsString:@"FaultReasonAirplayBufferedAudioUnderrun"])
    {
      uint64_t v13 = 2;
    }
    else if ([v8 containsString:@"FaultReasonHomeKitFault"])
    {
      uint64_t v13 = 4;
    }
    else if ([v8 containsString:@"FaultReasonAirplayConnectionStall"])
    {
      uint64_t v13 = 6;
    }
    else
    {
      os_log_type_t v14 = WALogCategoryDefaultHandle();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446722;
        os_log_type_t v33 = "-[WAEngine processWiFiAnalyticsManagedFault:]";
        __int16 v34 = 1024;
        int v35 = 5345;
        __int16 v36 = 2112;
        CFStringRef v37 = v8;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "%{public}s::%d:processWiFiAnalyticsManagedFault: Unhnandled FaultName %@", buf, 0x1Cu);
      }

      int v15 = WALogCategoryDefaultHandle();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412290;
        os_log_type_t v33 = v8;
        _os_log_fault_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_FAULT, "processWiFiAnalyticsManagedFault: Unhnandled FaultName %@", buf, 0xCu);
      }

      uint64_t v13 = 0x7FFFFFFFFFFFFFFFLL;
    }
    id v16 = objc_alloc_init((Class)W5Event);
    [v16 setEventID:38];
    __int16 v17 = [v4 metricInfo];
    int v18 = [v17 objectForKeyedSubscript:kWAMessageKeyFaultDate];
    __int16 v19 = [v18 objectForKeyedSubscript:v7];
    [v19 timeIntervalSinceReferenceDate];
    [v16 setTimestamp:];

    CFStringRef v40 = @"FaultType";
    int v20 = +[NSNumber numberWithInteger:v13];
    int v41 = v20;
    unsigned int v21 = +[NSDictionary dictionaryWithObjects:&v41 forKeys:&v40 count:1];
    [v16 setInfo:v21];

    id v31 = 0;
    [v12 submitFaultEvent:v16 error:&v31];
    id v22 = v31;
    dispatch_time_t v23 = WALogCategoryDefaultHandle();
    uint64_t v24 = v23;
    if (v22)
    {
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        id v25 = [v22 description];
        id v26 = (char *)[v25 UTF8String];
        *(_DWORD *)buf = 136446722;
        os_log_type_t v33 = "-[WAEngine processWiFiAnalyticsManagedFault:]";
        __int16 v34 = 1024;
        int v35 = 5357;
        __int16 v36 = 2080;
        CFStringRef v37 = v26;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "%{public}s::%d:[W5Client submitFaultEvent:error:] failed, (error=%s)", buf, 0x1Cu);
      }
    }
    else if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446978;
      os_log_type_t v33 = "-[WAEngine processWiFiAnalyticsManagedFault:]";
      __int16 v34 = 1024;
      int v35 = 5359;
      __int16 v36 = 2112;
      CFStringRef v37 = v8;
      __int16 v38 = 2112;
      id v39 = v16;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:[W5Client submitFaultEvent:error:] FaultName: %@ FaultEventDescription %@", buf, 0x26u);
    }
  }
  else
  {
    id v22 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      os_log_type_t v33 = "-[WAEngine processWiFiAnalyticsManagedFault:]";
      __int16 v34 = 1024;
      int v35 = 5329;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "%{public}s::%d:Unable to create velocity client", buf, 0x12u);
    }
  }

LABEL_30:
  id v27 = WALogCategoryDefaultHandle();
  if (os_signpost_enabled(v27))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v27, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "processWiFiAnalyticsManagedFault", "", buf, 2u);
  }
}

- (BOOL)canProcessWiFiAnalyticsMessageJSONFiles:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    LOBYTE(v6) = 0;
    goto LABEL_20;
  }
  [(WAEngine *)self analyticsProcessingTimeIntervalSecs];
  if (v5 != 0.0
    && (+[WAUtil shouldProcessAnalyticsImmediately] & 1) == 0)
  {
    if ((unint64_t)[v4 count] >= 0x32)
    {
      uint64_t v7 = WALogCategoryDeviceStoreHandle();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        int v16 = 136446466;
        __int16 v17 = "-[WAEngine canProcessWiFiAnalyticsMessageJSONFiles:]";
        __int16 v18 = 1024;
        int v19 = 5389;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "%{public}s::%d:Unprocessed file count crossed the threshold. Should process them.", (uint8_t *)&v16, 0x12u);
      }
      LOBYTE(v6) = 1;
LABEL_19:

      goto LABEL_20;
    }
    int v8 = +[NSDate date];
    id v9 = [(WAEngine *)self getValueForKeyFromUserDefaults:@"WA_LAST_JSON_PROCESSED_DATE"];
    double v10 = 0.0;
    if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      uint64_t v7 = v9;
      [v8 timeIntervalSinceDate:v7];
      double v10 = v11;
      [(WAEngine *)self analyticsProcessingTimeIntervalSecs];
      if (v10 < v12)
      {
        BOOL v6 = 0;
LABEL_16:
        uint64_t v13 = WALogCategoryDeviceStoreHandle();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          [(WAEngine *)self analyticsProcessingTimeIntervalSecs];
          int v16 = 136447746;
          __int16 v17 = "-[WAEngine canProcessWiFiAnalyticsMessageJSONFiles:]";
          __int16 v18 = 1024;
          int v19 = 5413;
          __int16 v20 = 1024;
          BOOL v21 = v6;
          __int16 v22 = 2112;
          dispatch_time_t v23 = v7;
          __int16 v24 = 2048;
          double v25 = v10;
          __int16 v26 = 2048;
          uint64_t v27 = v14;
          __int16 v28 = 2048;
          id v29 = [v4 count];
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:canProcess: %d lastProcessedDate: %@ secondsBetween:%2.2f interval:%2.2f pendingJSONs:%lu", (uint8_t *)&v16, 0x40u);
        }

        goto LABEL_19;
      }
    }
    else
    {
      uint64_t v7 = 0;
    }
    [(WAEngine *)self setValueForKeyToUserDefaults:v8 forKey:@"WA_LAST_JSON_PROCESSED_DATE"];
    BOOL v6 = 1;
    goto LABEL_16;
  }
  LOBYTE(v6) = 1;
LABEL_20:

  return v6;
}

- (void)processWiFiAnalyticsMessageJSONFilesInTmpDir:(BOOL)a3
{
  BOOL v3 = a3;
  if (![(WAEngine *)self analyticsProcessorIsReady])
  {
    id v47 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446466;
      uint64_t v74 = "-[WAEngine processWiFiAnalyticsMessageJSONFilesInTmpDir:]";
      __int16 v75 = 1024;
      int v76 = 5426;
      uint64_t v49 = "%{public}s::%d:AnalyticsProcessor not ready";
      uint64_t v50 = v47;
      os_log_type_t v51 = OS_LOG_TYPE_DEFAULT;
      uint32_t v52 = 18;
LABEL_79:
      _os_log_impl((void *)&_mh_execute_header, v50, v51, v49, buf, v52);
    }
LABEL_80:
    id v10 = 0;
    double v12 = 0;
    __int16 v54 = 0;
    NSErrorUserInfoKey v58 = 0;
    int v8 = 0;
    goto LABEL_72;
  }
  double v5 = [(WAEngine *)self analyticsProcessor];

  if (!v5)
  {
    id v47 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      uint64_t v74 = "-[WAEngine processWiFiAnalyticsMessageJSONFilesInTmpDir:]";
      __int16 v75 = 1024;
      int v76 = 5427;
      __int16 v77 = 1024;
      LODWORD(v78) = v3;
      uint64_t v49 = "%{public}s::%d:analyticsProcessor nil. processImmediately=%d";
      uint64_t v50 = v47;
      os_log_type_t v51 = OS_LOG_TYPE_ERROR;
      uint32_t v52 = 24;
      goto LABEL_79;
    }
    goto LABEL_80;
  }
  BOOL v6 = WALogCategoryDeviceStoreHandle();
  if (os_signpost_enabled(v6))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v6, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "processWiFiAnalyticsMessageJSONFilesInTmpDir", "", buf, 2u);
  }

  uint64_t v7 = [(WAEngine *)self wifianalyticsTmpDir];
  int v8 = [v7 path];

  +[NSFileManager defaultManager];
  NSErrorUserInfoKey v58 = v71 = 0;
  id v9 = [v58 contentsOfDirectoryAtPath:v8 error:&v71];
  id v10 = v71;
  double v11 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446978;
    uint64_t v74 = "-[WAEngine processWiFiAnalyticsMessageJSONFilesInTmpDir:]";
    __int16 v75 = 1024;
    int v76 = 5435;
    __int16 v77 = 2112;
    unsigned int v78 = v8;
    __int16 v79 = 2112;
    id v80 = v9;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:files at %@: %@", buf, 0x26u);
  }

  if (v10)
  {
    id v47 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      uint64_t v74 = "-[WAEngine processWiFiAnalyticsMessageJSONFilesInTmpDir:]";
      __int16 v75 = 1024;
      int v76 = 5436;
      __int16 v77 = 2112;
      unsigned int v78 = v8;
      __int16 v79 = 2112;
      id v80 = v10;
      _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_ERROR, "%{public}s::%d:Unable to list files at %@: %@", buf, 0x26u);
    }
    double v12 = 0;
    __int16 v54 = v9;
  }
  else
  {
    double v12 = +[NSPredicate predicateWithFormat:@"SELF EndsWith '.json'"];
    uint64_t v13 = [v9 filteredArrayUsingPredicate:v12];

    if (v13)
    {
      __int16 v54 = v13;
      if (v3
        || [(WAEngine *)self canProcessWiFiAnalyticsMessageJSONFiles:v13])
      {
        uint64_t v53 = v12;
        engineQ = self->_engineQ;
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_10006F384;
        block[3] = &unk_1000D0D98;
        void block[4] = self;
        dispatch_sync((dispatch_queue_t)engineQ, block);
        int v15 = [(WAEngine *)self analyticsProcessor];
        int v55 = self;
        [(WAEngine *)self analyticsAgeOutTimeIntervalSecs];
        [v15 ageOutAnalytics:];

        long long v68 = 0u;
        long long v69 = 0u;
        long long v66 = 0u;
        long long v67 = 0u;
        id obj = [v13 sortedArrayUsingSelector:"compare:"];
        id v16 = [obj countByEnumeratingWithState:&v66 objects:v72 count:16];
        if (!v16)
        {
          id v10 = 0;
          goto LABEL_69;
        }
        id v17 = v16;
        id v10 = 0;
        uint64_t v60 = *(void *)v67;
        __int16 v56 = v8;
        while (1)
        {
          __int16 v18 = 0;
          id v57 = v17;
          do
          {
            if (*(void *)v67 != v60) {
              objc_enumerationMutation(obj);
            }
            uint64_t v19 = *(void *)(*((void *)&v66 + 1) + 8 * (void)v18);
            __int16 v20 = -[NSObject stringByAppendingPathComponent:](v8, "stringByAppendingPathComponent:", v19, v53, v54);
            BOOL v21 = WALogCategoryDeviceStoreHandle();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136446722;
              uint64_t v74 = "-[WAEngine processWiFiAnalyticsMessageJSONFilesInTmpDir:]";
              __int16 v75 = 1024;
              int v76 = 5458;
              __int16 v77 = 2112;
              unsigned int v78 = v20;
              _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Reading %@", buf, 0x1Cu);
            }

            __int16 v22 = +[NSData dataWithContentsOfFile:v20];
            if (v22)
            {
              id v65 = v10;
              dispatch_time_t v23 = +[NSJSONSerialization JSONObjectWithData:v22 options:0 error:&v65];
              id v24 = v65;

              if (v24)
              {
                uint64_t v43 = WALogCategoryDeviceStoreHandle();
                if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 136446722;
                  uint64_t v74 = "-[WAEngine processWiFiAnalyticsMessageJSONFilesInTmpDir:]";
                  __int16 v75 = 1024;
                  int v76 = 5464;
                  __int16 v77 = 2112;
                  unsigned int v78 = v20;
                  _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_ERROR, "%{public}s::%d:Malformed json from file: %@", buf, 0x1Cu);
                }

                id v10 = v24;
                goto LABEL_53;
              }
              if (v23)
              {
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  dispatch_time_t v23 = v23;
                  double v25 = [v23 allKeys];
                  __int16 v26 = v25;
                  if (v25 && [v25 count] == (id)1)
                  {
                    uint64_t v27 = [v26 objectAtIndex:0];
                    if (v27 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                    {
                      __int16 v28 = WALogCategoryDeviceStoreHandle();
                      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
                      {
                        *(_DWORD *)buf = 136446978;
                        uint64_t v74 = "-[WAEngine processWiFiAnalyticsMessageJSONFilesInTmpDir:]";
                        __int16 v75 = 1024;
                        int v76 = 5475;
                        __int16 v77 = 2112;
                        unsigned int v78 = v20;
                        __int16 v79 = 2112;
                        id v80 = v27;
                        _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:%@ contains %@", buf, 0x26u);
                      }

                      if ([v27 isEqualToString:@"WA_DEVICE_ANALYTICS_DATAPATH_METRIC_STREAM"])
                      {
                        uint64_t v29 = [v23 objectForKeyedSubscript:v27];
                        os_log_type_t v30 = v8;
                        id v31 = (void *)v29;
                        unsigned int v32 = [v30 stringByAppendingPathComponent:v29];

                        if (v32)
                        {
                          os_log_type_t v33 = WALogCategoryDeviceStoreHandle();
                          if (os_signpost_enabled(v33))
                          {
                            *(_WORD *)buf = 0;
                            _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v33, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "processWiFiAnalyticsMessageWAMFile", "", buf, 2u);
                          }

                          [(WAEngine *)v55 processWiFiAnalyticsMessageWAMFile:v32 file:v19];
                          __int16 v34 = WALogCategoryDeviceStoreHandle();
                          if (os_signpost_enabled(v34))
                          {
                            *(_WORD *)buf = 0;
                            _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v34, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "processWiFiAnalyticsMessageWAMFile", "", buf, 2u);
                          }
                        }
                        id v64 = 0;
                        [v58 removeItemAtPath:v32 error:&v64];
                        int v35 = v64;
                        if (v35)
                        {
                          __int16 v36 = WALogCategoryDefaultHandle();
                          if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
                          {
                            *(_DWORD *)buf = 136446722;
                            uint64_t v74 = "-[WAEngine processWiFiAnalyticsMessageJSONFilesInTmpDir:]";
                            __int16 v75 = 1024;
                            int v76 = 5487;
                            __int16 v77 = 2112;
                            unsigned int v78 = v32;
                            _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_ERROR, "%{public}s::%d:Failed to remove file at path: %@", buf, 0x1Cu);
                          }
                        }
                      }
                      else
                      {
                        __int16 v38 = WALogCategoryDeviceStoreHandle();
                        if (os_signpost_enabled(v38))
                        {
                          *(_WORD *)buf = 0;
                          _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v38, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "processWAMessageMetric", "", buf, 2u);
                        }

                        id v39 = v55->_engineQ;
                        v63[0] = _NSConcreteStackBlock;
                        v63[1] = 3221225472;
                        v63[2] = sub_10006F3A8;
                        v63[3] = &unk_1000D0D98;
                        v63[4] = v55;
                        dispatch_sync(v39, v63);
                        CFStringRef v40 = [(WAEngine *)v55 analyticsProcessor];
                        int v41 = [v23 valueForKey:v27];
                        [v40 processWAMessageMetric:v27 data:v41];

                        int v35 = WALogCategoryDeviceStoreHandle();
                        if (os_signpost_enabled(v35))
                        {
                          *(_WORD *)buf = 0;
                          _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v35, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "processWAMessageMetric", "", buf, 2u);
                        }
                      }
                      int v8 = v56;
                    }
                    else
                    {
                      int v35 = WALogCategoryDeviceStoreHandle();
                      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
                      {
                        *(_DWORD *)buf = 136446722;
                        uint64_t v74 = "-[WAEngine processWiFiAnalyticsMessageJSONFilesInTmpDir:]";
                        __int16 v75 = 1024;
                        int v76 = 5474;
                        __int16 v77 = 2112;
                        unsigned int v78 = v23;
                        _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_ERROR, "%{public}s::%d:Object for metricName not NSString %@", buf, 0x1Cu);
                      }
                    }
                  }
                  else
                  {
                    int v35 = WALogCategoryDeviceStoreHandle();
                    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
                    {
                      *(_DWORD *)buf = 136446722;
                      uint64_t v74 = "-[WAEngine processWiFiAnalyticsMessageJSONFilesInTmpDir:]";
                      __int16 v75 = 1024;
                      int v76 = 5471;
                      __int16 v77 = 2112;
                      unsigned int v78 = v23;
                      _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_ERROR, "%{public}s::%d:Unexpected metric dict %@", buf, 0x1Cu);
                    }
                    uint64_t v27 = 0;
                  }

                  id v62 = 0;
                  [v58 removeItemAtPath:v20 error:&v62];
                  id v10 = v62;
                  if (v10)
                  {
                    __int16 v42 = WALogCategoryDefaultHandle();
                    if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
                    {
                      *(_DWORD *)buf = 136446722;
                      uint64_t v74 = "-[WAEngine processWiFiAnalyticsMessageJSONFilesInTmpDir:]";
                      __int16 v75 = 1024;
                      int v76 = 5504;
                      __int16 v77 = 2112;
                      unsigned int v78 = v20;
                      _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_ERROR, "%{public}s::%d:Failed to remove file at path: %@", buf, 0x1Cu);
                    }
                  }
LABEL_53:
                  id v17 = v57;
                  goto LABEL_54;
                }
              }
              CFStringRef v37 = WALogCategoryDefaultHandle();
              if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 136446722;
                uint64_t v74 = "-[WAEngine processWiFiAnalyticsMessageJSONFilesInTmpDir:]";
                __int16 v75 = 1024;
                int v76 = 5507;
                __int16 v77 = 2112;
                unsigned int v78 = v20;
                _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_ERROR, "%{public}s::%d:Cannot get dict from json file: %@", buf, 0x1Cu);
              }

              id v10 = 0;
            }
            else
            {
              dispatch_time_t v23 = WALogCategoryDeviceStoreHandle();
              if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 136446722;
                uint64_t v74 = "-[WAEngine processWiFiAnalyticsMessageJSONFilesInTmpDir:]";
                __int16 v75 = 1024;
                int v76 = 5461;
                __int16 v77 = 2112;
                unsigned int v78 = v20;
                _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "%{public}s::%d:fileData nil: %@", buf, 0x1Cu);
              }
            }
LABEL_54:

            __int16 v18 = (char *)v18 + 1;
          }
          while (v17 != v18);
          id v44 = [obj countByEnumeratingWithState:&v66 objects:v72 count:16];
          id v17 = v44;
          if (!v44)
          {
LABEL_69:

            uint64_t v45 = v55->_engineQ;
            v61[0] = _NSConcreteStackBlock;
            v61[1] = 3221225472;
            v61[2] = sub_10006F3CC;
            v61[3] = &unk_1000D0D98;
            v61[4] = v55;
            dispatch_sync(v45, v61);
            uint64_t v46 = WALogCategoryDeviceStoreHandle();
            if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136446466;
              uint64_t v74 = "-[WAEngine processWiFiAnalyticsMessageJSONFilesInTmpDir:]";
              __int16 v75 = 1024;
              int v76 = 5519;
              _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:performPruneBasedOnStoreSizeAndSave", buf, 0x12u);
            }

            id v47 = [(WAEngine *)v55 analyticsProcessor];
            [v47 performPruneBasedOnStoreSizeAndSave];
            double v12 = v53;
            goto LABEL_72;
          }
        }
      }
      id v47 = WALogCategoryDeviceStoreHandle();
      if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446466;
        uint64_t v74 = "-[WAEngine processWiFiAnalyticsMessageJSONFilesInTmpDir:]";
        __int16 v75 = 1024;
        int v76 = 5444;
        _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_ERROR, "%{public}s::%d:Cannot process the files", buf, 0x12u);
      }
      id v10 = 0;
    }
    else
    {
      id v47 = WALogCategoryDeviceStoreHandle();
      if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446466;
        uint64_t v74 = "-[WAEngine processWiFiAnalyticsMessageJSONFilesInTmpDir:]";
        __int16 v75 = 1024;
        int v76 = 5441;
        _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_ERROR, "%{public}s::%d:No files to process", buf, 0x12u);
      }
      id v10 = 0;
      __int16 v54 = 0;
    }
  }
LABEL_72:

  uint64_t v48 = WALogCategoryDeviceStoreHandle();
  if (os_signpost_enabled(v48))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v48, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "processWiFiAnalyticsMessageJSONFilesInTmpDir", "", buf, 2u);
  }
}

- (void)processWiFiAnalyticsMessageWAMFile:(id)a3 file:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = WALogCategoryDeviceStoreHandle();
  if (os_signpost_enabled(v8))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v8, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "processWiFiAnalyticsMessageWAMFile", "", buf, 2u);
  }

  id v9 = objc_alloc_init((Class)NSDateFormatter);
  [v9 setDateFormat:@"yyyy'-'MM'-'dd-HHmmssSSS"];
  id v10 = [v7 substringFromIndex:[@"wifianalytics_" length]];
  double v11 = [v10 substringToIndex:[@"yyyy-MM-dd-HHmmssSSS" length]];
  double v12 = [v9 dateFromString:v11];

  uint64_t v14 = +[NSData dataWithContentsOfFile:v6];
  int v15 = v14;
  if (v14)
  {
    engineQ = self->_engineQ;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10006F6B4;
    block[3] = &unk_1000D16F8;
    void block[4] = self;
    id v20 = v14;
    id v21 = v12;
    dispatch_async((dispatch_queue_t)engineQ, block);
  }
  else
  {
    id v17 = WALogCategoryDeviceStoreHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      dispatch_time_t v23 = "-[WAEngine processWiFiAnalyticsMessageWAMFile:file:]";
      __int16 v24 = 1024;
      int v25 = 5550;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "%{public}s::%d:Failed to dataWithContentsOfFile", buf, 0x12u);
    }
  }
  __int16 v18 = WALogCategoryDeviceStoreHandle();
  if (os_signpost_enabled(v18))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v18, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "processWiFiAnalyticsMessageWAMFile", "", buf, 2u);
  }
}

- (void)clearDnsStudyVariables
{
  *(_WORD *)&self->_isAWDLActivitySuspected = 256;
  *(_DWORD *)&self->_isCaptiveServerIPResolved = 256;
  self->_isPingEnqueueFailing = 0;
  *(_OWORD *)&self->_cumulativeAverageCcaSinceStudyStart = 0u;
  *(_OWORD *)&self->_totalLANPingSuccessBeforeTrap = 0u;
  *(_OWORD *)&self->_totalWANPingSuccessBeforeTrap = 0u;
  *(_OWORD *)&self->_totalLANPingSuccessAfterTrap = 0u;
  *(_OWORD *)&self->_totalWANPingSuccessAfterTrap = 0u;
  BOOL v3 = [(RecommendationEngine *)self->_recommendationEngine preferences];
  id v4 = [v3 dns_symptoms_interrogation_sample_count];
  double v5 = [(RecommendationEngine *)self->_recommendationEngine preferences];
  self->_numNetScoreBelowThresholdAfterTrap = v4 - (unsigned char *)[v5 dns_symptoms_trap_evaluated_at_sample];

  *(_OWORD *)&self->_impactedServersAtStudyStart = 0u;
  *(_OWORD *)&self->_stallscoreAtStudyEnd = 0u;
  *(_OWORD *)&self->_numRemoteDnsServers = 0u;
  *(_OWORD *)&self->_netscoreAtStudyStart = 0u;
  *(_OWORD *)&self->_totalDnsServers = 0u;
  *(_OWORD *)&self->_numIPv6DnsServers = 0u;
  *(_OWORD *)&self->_numDataStallScoreBelowThresholdBeforeTrap = 0u;
}

- (id)__ipv4SetupConfig
{
  BOOL v3 = [(CWFInterface *)self->_corewifi networkServiceID];
  if (v3
    && (CFStringRef NetworkServiceEntity = SCDynamicStoreKeyCreateNetworkServiceEntity(kCFAllocatorDefault, kSCDynamicStoreDomainSetup, v3, kSCEntNetIPv4)) != 0)
  {
    CFStringRef v5 = NetworkServiceEntity;
    id v6 = (void *)SCDynamicStoreCopyValue(self->_storeRef, NetworkServiceEntity);
    if (v6)
    {
      id v7 = v6;
      id v8 = [v6 copy];
      CFRelease(v7);
    }
    else
    {
      id v8 = 0;
    }
    CFRelease(v5);
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (id)__IPv4StateConfig
{
  BOOL v3 = [(CWFInterface *)self->_corewifi networkServiceID];
  if (v3
    && (CFStringRef NetworkServiceEntity = SCDynamicStoreKeyCreateNetworkServiceEntity(kCFAllocatorDefault, kSCDynamicStoreDomainState, v3, kSCEntNetIPv4)) != 0)
  {
    CFStringRef v5 = NetworkServiceEntity;
    id v6 = (void *)SCDynamicStoreCopyValue(self->_storeRef, NetworkServiceEntity);
    if (v6)
    {
      id v7 = v6;
      id v8 = [v6 copy];
      CFRelease(v7);
    }
    else
    {
      id v8 = 0;
    }
    CFRelease(v5);
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (id)__IPv6StateConfig
{
  BOOL v3 = [(CWFInterface *)self->_corewifi networkServiceID];
  if (v3
    && (CFStringRef NetworkServiceEntity = SCDynamicStoreKeyCreateNetworkServiceEntity(kCFAllocatorDefault, kSCDynamicStoreDomainState, v3, kSCEntNetIPv6)) != 0)
  {
    CFStringRef v5 = NetworkServiceEntity;
    id v6 = (void *)SCDynamicStoreCopyValue(self->_storeRef, NetworkServiceEntity);
    if (v6)
    {
      id v7 = v6;
      id v8 = [v6 copy];
      CFRelease(v7);
    }
    else
    {
      id v8 = 0;
    }
    CFRelease(v5);
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (id)__dnsStateConfig
{
  BOOL v3 = [(CWFInterface *)self->_corewifi networkServiceID];
  if (v3
    && (CFStringRef NetworkServiceEntity = SCDynamicStoreKeyCreateNetworkServiceEntity(kCFAllocatorDefault, kSCDynamicStoreDomainState, v3, kSCEntNetDNS)) != 0)
  {
    CFStringRef v5 = NetworkServiceEntity;
    id v6 = (void *)SCDynamicStoreCopyValue(self->_storeRef, NetworkServiceEntity);
    if (v6)
    {
      id v7 = v6;
      id v8 = [v6 copy];
      CFRelease(v7);
    }
    else
    {
      id v8 = 0;
    }
    CFRelease(v5);
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (id)__dnsSetupConfig
{
  BOOL v3 = [(CWFInterface *)self->_corewifi networkServiceID];
  if (v3
    && (CFStringRef NetworkServiceEntity = SCDynamicStoreKeyCreateNetworkServiceEntity(kCFAllocatorDefault, kSCDynamicStoreDomainSetup, v3, kSCEntNetDNS)) != 0)
  {
    CFStringRef v5 = NetworkServiceEntity;
    id v6 = (void *)SCDynamicStoreCopyValue(self->_storeRef, NetworkServiceEntity);
    if (v6)
    {
      id v7 = v6;
      id v8 = [v6 copy];
      CFRelease(v7);
    }
    else
    {
      id v8 = 0;
    }
    CFRelease(v5);
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (BOOL)isUsingCustomDNSSettings
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  dnsStudyQueue = self->_dnsStudyQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10006FD08;
  v5[3] = &unk_1000D1888;
  void v5[4] = self;
  v5[5] = &v6;
  dispatch_sync((dispatch_queue_t)dnsStudyQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)fetchConfiguredDnsInfo
{
  uint64_t v83 = 0;
  uint64_t v84 = 0;
  uint64_t v56 = 0;
  id v57 = &v56;
  uint64_t v58 = 0x3032000000;
  uint64_t v59 = sub_10004D654;
  uint64_t v60 = sub_10004D664;
  id v61 = 0;
  if ([(WAEngine *)self isUsingCustomDNSSettings])
  {
    self->_dnsServerConfigType = 2;
    char v3 = [(WAEngine *)self __dnsSetupConfig];
    uint64_t v4 = [v3 objectForKeyedSubscript:kSCPropNetDNSServerAddresses];
    CFStringRef v5 = (void *)v57[5];
    v57[5] = v4;
  }
  else
  {
    self->_dnsServerConfigType = 1;
  }
  dnsStudyQueue = self->_dnsStudyQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10007072C;
  block[3] = &unk_1000D0F38;
  void block[4] = self;
  void block[5] = &v56;
  dispatch_sync((dispatch_queue_t)dnsStudyQueue, block);
  id v7 = (void *)v57[5];
  if (v7) {
    uint64_t v8 = (char *)[v7 count];
  }
  else {
    uint64_t v8 = 0;
  }
  unsigned int v44 = [(WAEngine *)self getIPv4InterfaceSubnet];
  unsigned int v43 = [(WAEngine *)self getIPv4InterfaceNetwork:v44];
  uint64_t v9 = [(WAEngine *)self getIPv6InterfacePrefix];
  [(WAEngine *)self getIPv6InterfaceNetwork:&v83 prefixLength:v9];
  unsigned int v42 = v9;
  int v41 = v8;
  uint64_t v49 = self;
  id v10 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    *(void *)&uint8_t buf[4] = "-[WAEngine fetchConfiguredDnsInfo]";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 5797;
    *(_WORD *)&unsigned char buf[18] = 1024;
    *(_DWORD *)&buf[20] = v43;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:DNS-config: interface IPv4 Network: %08x", buf, 0x18u);
  }

  double v11 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136447490;
    *(void *)&uint8_t buf[4] = "-[WAEngine fetchConfiguredDnsInfo]";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 5798;
    *(_WORD *)&unsigned char buf[18] = 1024;
    *(_DWORD *)&buf[20] = v83;
    *(_WORD *)&unsigned char buf[24] = 1024;
    *(_DWORD *)&buf[26] = HIDWORD(v83);
    *(_WORD *)&buf[30] = 1024;
    *(_DWORD *)&buf[32] = v84;
    *(_WORD *)&buf[36] = 1024;
    *(_DWORD *)&buf[38] = HIDWORD(v84);
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:DNS-config: interface IPv6 Network: %08x %08x %08x %08x", buf, 0x2Au);
  }

  double v12 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v13 = v57[5];
    *(_DWORD *)buf = 136446722;
    *(void *)&uint8_t buf[4] = "-[WAEngine fetchConfiguredDnsInfo]";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 5799;
    *(_WORD *)&unsigned char buf[18] = 2112;
    *(void *)&buf[20] = v13;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:DNS-config: dnsServers: %@", buf, 0x1Cu);
  }

  long long v53 = 0u;
  long long v54 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  id obj = (id)v57[5];
  id v14 = [obj countByEnumeratingWithState:&v51 objects:v82 count:16];
  if (v14)
  {
    char v45 = 0;
    unint64_t v46 = 0;
    unint64_t v47 = 0;
    unint64_t v16 = 0;
    uint64_t v17 = 0;
    uint64_t v18 = *(void *)v52;
    *(void *)&long long v15 = 136447490;
    long long v40 = v15;
    for (uint64_t i = *(void *)v52; ; uint64_t i = *(void *)v52)
    {
      if (i != v18) {
        objc_enumerationMutation(obj);
      }
      id v20 = *(void **)(*((void *)&v51 + 1) + 8 * v17);
      if (-[WAEngine isIPv4Address:](v49, "isIPv4Address:", v20, v40))
      {
        id v21 = [v20 componentsSeparatedByString:@"."];
        *(_DWORD *)long long v69 = 0;
        __int16 v22 = [v21 objectAtIndexedSubscript:0];
        if ([v22 integerValue] == (id)127)
        {

          goto LABEL_20;
        }
        int v25 = [v21 objectAtIndexedSubscript:0];
        if ([v25 integerValue] == (id)169)
        {
          __int16 v26 = [v21 objectAtIndexedSubscript:1];
          BOOL v27 = [v26 integerValue] == (id)254;

          if (!v27) {
            goto LABEL_36;
          }
LABEL_20:
          ++v16;
          char v45 = 1;
        }
        else
        {

LABEL_36:
          if (inet_aton((const char *)[v20 UTF8String], (in_addr *)v69))
          {
            unsigned int v28 = bswap32(*(unsigned int *)v69);
            uint64_t v29 = WALogCategoryDefaultHandle();
            if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136446722;
              *(void *)&uint8_t buf[4] = "-[WAEngine fetchConfiguredDnsInfo]";
              *(_WORD *)&buf[12] = 1024;
              *(_DWORD *)&buf[14] = 5813;
              *(_WORD *)&unsigned char buf[18] = 1024;
              *(_DWORD *)&buf[20] = v28;
              _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:DNS-config: IPv4 DNS address:%08x", buf, 0x18u);
            }

            BOOL v30 = v28 - 1 < 0xFFFFFFFE;
            int v31 = v28 & v44;
            unsigned int v32 = WALogCategoryDefaultHandle();
            if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136446722;
              *(void *)&uint8_t buf[4] = "-[WAEngine fetchConfiguredDnsInfo]";
              *(_WORD *)&buf[12] = 1024;
              *(_DWORD *)&buf[14] = 5820;
              *(_WORD *)&unsigned char buf[18] = 1024;
              *(_DWORD *)&buf[20] = v31;
              _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:DNS-config: IPv4 DNS network:%08x", buf, 0x18u);
            }

            v45 |= v30;
            if (v31 == v43) {
              ++v16;
            }
          }
        }

        ++v46;
        goto LABEL_59;
      }
      int8x16_t v81 = 0uLL;
      int8x16_t v50 = 0uLL;
      memset(buf, 0, 47);
      if (([v20 getCString:buf maxLength:47 encoding:4] & 1) == 0)
      {
        __int16 v24 = WALogCategoryDefaultHandle();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)long long v69 = 136446466;
          uint64_t v70 = "-[WAEngine fetchConfiguredDnsInfo]";
          __int16 v71 = 1024;
          int v72 = 5835;
          _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "%{public}s::%d:DNS-config: encoding failed!", v69, 0x12u);
        }

        goto LABEL_58;
      }
      if (inet_pton(30, buf, &v50))
      {
        if (v50.u8[0] == 254 && (v50.u8[1] > 0xBFu || (v50.i8[1] & 0xC0) == 0x80)
          || (__int32 v23 = v50.i32[0] | v50.i32[1] | v50.i32[2]) == 0 && v50.i32[3] == 0x1000000)
        {
          ++v16;
        }
        else
        {
          if (v50.i32[3]) {
            BOOL v33 = 0;
          }
          else {
            BOOL v33 = v23 == 0;
          }
          if (v33) {
            goto LABEL_58;
          }
          int8x16_t v81 = vrev32q_s8(v50);
          __int16 v34 = WALogCategoryDefaultHandle();
          if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)long long v69 = v40;
            uint64_t v70 = "-[WAEngine fetchConfiguredDnsInfo]";
            __int16 v71 = 1024;
            int v72 = 5852;
            __int16 v73 = 1024;
            __int32 v74 = v81.i32[0];
            __int16 v75 = 1024;
            __int32 v76 = v81.i32[1];
            __int16 v77 = 1024;
            __int32 v78 = v81.i32[2];
            __int16 v79 = 1024;
            __int32 v80 = v81.i32[3];
            _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:DNS-config: IPv6 DNS address:%08x %08x %08x %08x", v69, 0x2Au);
          }

          [(WAEngine *)v49 convertToIPv6Network:&v81 prefixLength:v42];
          int v35 = WALogCategoryDefaultHandle();
          if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)long long v69 = v40;
            uint64_t v70 = "-[WAEngine fetchConfiguredDnsInfo]";
            __int16 v71 = 1024;
            int v72 = 5854;
            __int16 v73 = 1024;
            __int32 v74 = v81.i32[0];
            __int16 v75 = 1024;
            __int32 v76 = v81.i32[1];
            __int16 v77 = 1024;
            __int32 v78 = v81.i32[2];
            __int16 v79 = 1024;
            __int32 v80 = v81.i32[3];
            _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:DNS-config: IPv6 DNS network:%08x %08x %08x %08x", v69, 0x2Au);
          }

          if (v81.i64[0] == v83 && v81.i64[1] == v84) {
            ++v16;
          }
        }
        char v45 = 1;
      }
LABEL_58:
      ++v47;
LABEL_59:
      if (++v17 >= (unint64_t)v14)
      {
        id v14 = [obj countByEnumeratingWithState:&v51 objects:v82 count:16];
        if (!v14) {
          goto LABEL_64;
        }
        uint64_t v17 = 0;
      }
    }
  }
  char v45 = 0;
  unint64_t v46 = 0;
  unint64_t v47 = 0;
  unint64_t v16 = 0;
LABEL_64:

  v49->_totalDnsServers = (unint64_t)v41;
  v49->_numIPv4DnsServers = v46;
  v49->_numIPv6DnsServers = v47;
  v49->_numLocalDnsServers = v16;
  v49->_numRemoteDnsServers = (unint64_t)&v41[-v16];
  CFStringRef v37 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v38 = "NO";
    *(_DWORD *)buf = 136448002;
    *(void *)&uint8_t buf[4] = "-[WAEngine fetchConfiguredDnsInfo]";
    *(_WORD *)&buf[12] = 1024;
    if (v45) {
      __int16 v38 = "YES";
    }
    *(_DWORD *)&buf[14] = 5871;
    *(_WORD *)&unsigned char buf[18] = 2080;
    *(void *)&buf[20] = v38;
    *(_WORD *)&buf[28] = 2048;
    *(void *)&buf[30] = v41;
    *(_WORD *)&buf[38] = 2048;
    *(void *)&buf[40] = v46;
    __int16 v63 = 2048;
    unint64_t v64 = v47;
    __int16 v65 = 2048;
    unint64_t v66 = v16;
    __int16 v67 = 2048;
    long long v68 = &v41[-v16];
    _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:DNS-config: validDNSConfig:%s totalDnsServers:%lu numv4DnsServers:%lu numv6DnsServers:%lu numLocalDnsServers:%lu numRemoteDnsServers:%lu", buf, 0x4Eu);
  }

  _Block_object_dispose(&v56, 8);
  return v45 & 1;
}

- (unsigned)getIPv4InterfaceSubnet
{
  v8.s_addr = 0;
  CFDictionaryRef v2 = [(WAEngine *)self IPv4SubnetMasks];
  char v3 = [v2 firstObject];
  uint64_t v4 = v3;
  if (v3)
  {
    v8.s_addr = 0;
    if (inet_aton((const char *)[v3 UTF8String], &v8))
    {
      unsigned int v5 = bswap32(v8.s_addr);
      uint64_t v6 = WALogCategoryDefaultHandle();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136446722;
        id v10 = "-[WAEngine getIPv4InterfaceSubnet]";
        __int16 v11 = 1024;
        int v12 = 5884;
        __int16 v13 = 1024;
        unsigned int v14 = v5;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:DNS-config: interface IPv4 subnet: %08x", buf, 0x18u);
      }
    }
    else
    {
      uint64_t v6 = WALogCategoryDefaultHandle();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446466;
        id v10 = "-[WAEngine getIPv4InterfaceSubnet]";
        __int16 v11 = 1024;
        int v12 = 5886;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "%{public}s::%d:DNS-config: interface IPv4 subnet: invalid conversion logic", buf, 0x12u);
      }
      unsigned int v5 = 0;
    }
  }
  else
  {
    unsigned int v5 = 0;
  }

  return v5;
}

- (unsigned)getIPv4InterfaceNetwork:(unsigned int)a3
{
  v10.s_addr = 0;
  uint64_t v4 = [(CWFInterface *)self->_corewifi IPv4Addresses];
  unsigned int v5 = [v4 firstObject];
  uint64_t v6 = v5;
  if (v5)
  {
    v10.s_addr = 0;
    if (inet_aton((const char *)[v5 UTF8String], &v10))
    {
      unsigned int v7 = bswap32(v10.s_addr);
      in_addr v8 = WALogCategoryDefaultHandle();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136446722;
        int v12 = "-[WAEngine getIPv4InterfaceNetwork:]";
        __int16 v13 = 1024;
        int v14 = 5901;
        __int16 v15 = 1024;
        unsigned int v16 = v7;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:DNS-config: interface IPv4 Address: %08x", buf, 0x18u);
      }
    }
    else
    {
      in_addr v8 = WALogCategoryDefaultHandle();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446466;
        int v12 = "-[WAEngine getIPv4InterfaceNetwork:]";
        __int16 v13 = 1024;
        int v14 = 5903;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "%{public}s::%d:DNS-config: interface IPv4 Address: invalid conversion logic", buf, 0x12u);
      }
      unsigned int v7 = 0;
    }
  }
  else
  {
    unsigned int v7 = 0;
  }

  return v7 & a3;
}

- (unsigned)getIPv6InterfacePrefix
{
  CFDictionaryRef v2 = [(WAEngine *)self IPv6PrefixLengths];
  char v3 = [v2 firstObject];
  uint64_t v4 = v3;
  if (v3)
  {
    unsigned int v5 = [v3 unsignedIntValue];
    uint64_t v6 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 136446722;
      uint64_t v9 = "-[WAEngine getIPv6InterfacePrefix]";
      __int16 v10 = 1024;
      int v11 = 5915;
      __int16 v12 = 1024;
      unsigned int v13 = v5;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:DNS-config: interface IPv6 prefix length: %u", (uint8_t *)&v8, 0x18u);
    }
  }
  else
  {
    unsigned int v5 = 0;
  }

  return v5;
}

- (void)getIPv6InterfaceNetwork:(unsigned int *)a3 prefixLength:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  unsigned int v7 = [(CWFInterface *)self->_corewifi IPv6Addresses];
  int v8 = [v7 firstObject];
  uint64_t v9 = v8;
  if (v8)
  {
    *(void *)a3 = 0;
    *((void *)a3 + 1) = 0;
    int8x16_t v20 = 0uLL;
    memset(v33, 0, 47);
    if ([v8 getCString:v33 maxLength:47 encoding:4])
    {
      if (!inet_pton(30, (const char *)v33, &v20))
      {
LABEL_10:
        [(WAEngine *)self convertToIPv6Network:a3 prefixLength:v4];
        goto LABEL_11;
      }
      *(int8x16_t *)a3 = vrev32q_s8(v20);
      __int16 v10 = WALogCategoryDefaultHandle();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        unsigned int v11 = *a3;
        unsigned int v12 = a3[1];
        unsigned int v13 = a3[2];
        unsigned int v14 = a3[3];
        *(_DWORD *)buf = 136447490;
        __int16 v22 = "-[WAEngine getIPv6InterfaceNetwork:prefixLength:]";
        __int16 v23 = 1024;
        int v24 = 5938;
        __int16 v25 = 1024;
        unsigned int v26 = v11;
        __int16 v27 = 1024;
        unsigned int v28 = v12;
        __int16 v29 = 1024;
        unsigned int v30 = v13;
        __int16 v31 = 1024;
        unsigned int v32 = v14;
        __int16 v15 = "%{public}s::%d:DNS-config: interface IPv6 Address:%08x %08x %08x %08x";
        unsigned int v16 = v10;
        os_log_type_t v17 = OS_LOG_TYPE_DEFAULT;
        uint32_t v18 = 42;
LABEL_8:
        _os_log_impl((void *)&_mh_execute_header, v16, v17, v15, buf, v18);
      }
    }
    else
    {
      __int16 v10 = WALogCategoryDefaultHandle();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446466;
        __int16 v22 = "-[WAEngine getIPv6InterfaceNetwork:prefixLength:]";
        __int16 v23 = 1024;
        int v24 = 5933;
        __int16 v15 = "%{public}s::%d:DNS-config: encoding failed!";
        unsigned int v16 = v10;
        os_log_type_t v17 = OS_LOG_TYPE_ERROR;
        uint32_t v18 = 18;
        goto LABEL_8;
      }
    }

    goto LABEL_10;
  }
  uint64_t v19 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)BOOL v33 = 136446466;
    *(void *)&v33[4] = "-[WAEngine getIPv6InterfaceNetwork:prefixLength:]";
    *(_WORD *)&v33[12] = 1024;
    *(_DWORD *)&v33[14] = 5926;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "%{public}s::%d:DNS-config: No IPv6 address found", v33, 0x12u);
  }

LABEL_11:
}

- (void)convertToIPv6Network:(unsigned int *)a3 prefixLength:(unsigned int)a4
{
  if (a4)
  {
    uint64_t v4 = 3;
    do
    {
      if (a4 <= 0x1F)
      {
        unsigned int v5 = a3[v4];
        if (v5)
        {
          unsigned int v6 = a4;
          do
          {
            unsigned int v7 = v5;
            v5 >>= 1;
            a4 = v6 - 1;
            if (v7 < 2) {
              break;
            }
            --v6;
          }
          while (v6);
        }
      }
      else
      {
        unsigned int v5 = 0;
        a4 -= 32;
      }
      a3[v4] = v5;
      BOOL v8 = v4-- != 0;
    }
    while (v8 && a4);
  }
}

- (BOOL)isIPv4Address:(id)a3
{
  return [a3 rangeOfString:@"."] != (id)0x7FFFFFFFFFFFFFFFLL;
}

- (id)IPv4SubnetMasks
{
  CFDictionaryRef v2 = [(WAEngine *)self __IPv4StateConfig];
  char v3 = [v2 objectForKeyedSubscript:kSCPropNetIPv4SubnetMasks];

  return v3;
}

- (id)IPv6PrefixLengths
{
  CFDictionaryRef v2 = [(WAEngine *)self __IPv6StateConfig];
  char v3 = [v2 objectForKeyedSubscript:kSCPropNetIPv6PrefixLength];

  return v3;
}

- (void)triggerPeerDiscovery
{
  if (![(WAEngine *)self isWiFiAssociatedToNetwork])
  {
    CFDictionaryRef v2 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      BOOL v8 = "-[WAEngine triggerPeerDiscovery]";
      __int16 v9 = 1024;
      int v10 = 5979;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_ERROR, "%{public}s::%d:WiFi disassocited during study so not continuing...", buf, 0x12u);
    }
    goto LABEL_6;
  }
  sub_100068F7C();
  if (objc_opt_class())
  {
    sub_100045570();
    if (objc_opt_class())
    {
      CFDictionaryRef v2 = objc_alloc_init((Class)sub_100045570());
      if (v2)
      {
        char v3 = [sub_100068F7C() requestWithTestID:62 configuration:0];
        unsigned int v6 = v3;
        uint64_t v4 = +[NSArray arrayWithObjects:&v6 count:1];

        id v5 = [v2 runDiagnostics:v4 configuration:0 update:0 reply:&stru_1000D18C8];
      }
LABEL_6:
    }
  }
}

- (void)gatherDiscoveredPeerInfo:(id)a3
{
  id v4 = a3;
  dispatch_semaphore_t v41 = dispatch_semaphore_create(0);
  uint64_t v52 = 0;
  long long v53 = &v52;
  uint64_t v54 = 0x3032000000;
  int v55 = sub_10004D654;
  uint64_t v56 = sub_10004D664;
  id v57 = 0;
  uint64_t v46 = 0;
  unint64_t v47 = &v46;
  uint64_t v48 = 0x3032000000;
  uint64_t v49 = sub_10004D654;
  int8x16_t v50 = sub_10004D664;
  id v51 = 0;
  if (![(WAEngine *)self isWiFiAssociatedToNetwork])
  {
    __int16 v15 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      uint64_t v59 = "-[WAEngine gatherDiscoveredPeerInfo:]";
      __int16 v60 = 1024;
      int v61 = 6007;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%{public}s::%d:WiFi disassocited during study so not continuing...", buf, 0x12u);
    }
    goto LABEL_36;
  }
  sub_100068F7C();
  if (objc_opt_class())
  {
    sub_100045570();
    if (objc_opt_class())
    {
      id v5 = objc_alloc_init((Class)sub_100045570());
      if (v5)
      {
        unsigned int v6 = [sub_100068F7C() requestWithTestID:61 configuration:0];
        long long v68 = v6;
        unsigned int v7 = +[NSArray arrayWithObjects:&v68 count:1];

        v42[0] = _NSConcreteStackBlock;
        v42[1] = 3221225472;
        v42[2] = sub_100071964;
        v42[3] = &unk_1000D1720;
        unsigned int v44 = &v52;
        char v45 = &v46;
        BOOL v8 = v41;
        unsigned int v43 = v8;
        id v9 = [v5 runDiagnostics:v7 configuration:0 update:0 reply:v42];
        dispatch_time_t v10 = dispatch_time(0, 5000000000);
        dispatch_semaphore_wait(v8, v10);
        if (!v53[5])
        {
          unsigned int v11 = WALogCategoryDefaultHandle();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
          {
            unsigned int v12 = v47[5];
            *(_DWORD *)buf = 136446722;
            uint64_t v59 = "-[WAEngine gatherDiscoveredPeerInfo:]";
            __int16 v60 = 1024;
            int v61 = 6021;
            __int16 v62 = 2112;
            __int16 v63 = v12;
            _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "%{public}s::%d:PeerDiscovery: Data collection failed with err:%@", buf, 0x1Cu);
          }
        }
      }
    }
  }
  unsigned int v13 = [(id)v53[5] firstObject];
  unsigned int v14 = [v13 info];
  __int16 v15 = [v14 objectForKeyedSubscript:@"PeerDevicesInfo"];

  unsigned int v16 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    uint64_t v59 = "-[WAEngine gatherDiscoveredPeerInfo:]";
    __int16 v60 = 1024;
    int v61 = 6026;
    __int16 v62 = 2112;
    __int16 v63 = v15;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:PeerDiscovery: parsed result:%@", buf, 0x1Cu);
  }

  if (v15)
  {
    os_log_type_t v17 = +[NSDate date];
    uint32_t v18 = [v15 allKeys];
    if ([v18 containsObject:@"Timestamp"])
    {
      uint64_t v19 = [v15 valueForKey:@"Timestamp"];

      if (v19)
      {
        [v17 timeIntervalSinceDate:v19];
        uint64_t v21 = (int)(v20 / 60.0);
LABEL_19:
        __int16 v22 = WALogCategoryDefaultHandle();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136447234;
          uint64_t v59 = "-[WAEngine gatherDiscoveredPeerInfo:]";
          __int16 v60 = 1024;
          int v61 = 6035;
          __int16 v62 = 2112;
          __int16 v63 = v17;
          __int16 v64 = 2112;
          __int16 v65 = v19;
          __int16 v66 = 2048;
          uint64_t v67 = v21;
          _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:PeerDiscovery: current_time:%@ update_time:%@ minutesBetweenDates:%ld", buf, 0x30u);
        }

        __int16 v23 = [(RecommendationEngine *)self->_recommendationEngine preferences];
        BOOL v24 = v21 < (int)((unint64_t)[v23 dps_report_sent_after] / 0x3C);

        if (v24)
        {
          __int16 v25 = [v15 allKeys];
          if ([v25 containsObject:@"numberOfIOSDevices"])
          {
            unsigned int v26 = [v15 valueForKey:@"numberOfIOSDevices"];
            id v27 = [v26 unsignedIntValue];
          }
          else
          {
            id v27 = 0;
          }

          unsigned int v28 = [v15 allKeys];
          if ([v28 containsObject:@"numberOfMacOSDevices"])
          {
            __int16 v29 = [v15 valueForKey:@"numberOfMacOSDevices"];
            id v30 = [v29 unsignedIntValue];
          }
          else
          {
            id v30 = 0;
          }

          __int16 v31 = [v15 allKeys];
          if ([v31 containsObject:@"numberOfTVOSDevices"])
          {
            unsigned int v32 = [v15 valueForKey:@"numberOfTVOSDevices"];
            id v33 = [v32 unsignedIntValue];
          }
          else
          {
            id v33 = 0;
          }

          __int16 v34 = [v15 allKeys];
          if ([v34 containsObject:@"numberOfWatchOSDevices"])
          {
            int v35 = [v15 valueForKey:@"numberOfTVOSDevices"];
            unsigned int v36 = [v35 unsignedIntValue];
          }
          else
          {
            unsigned int v36 = 0;
          }

          CFStringRef v37 = [v4 fieldForKey:@"WFAAWDWAPDI_numPeersDiscovered"];
          [v37 setUint32Value:v30 + v27 + v33 + v36];

          __int16 v38 = [v4 fieldForKey:@"WFAAWDWAPDI_iOSPeers"];
          [v38 setUint32Value:v27];

          id v39 = [v4 fieldForKey:@"WFAAWDWAPDI_tvOSPeers"];
          [v39 setUint32Value:v33];

          long long v40 = [v4 fieldForKey:@"WFAAWDWAPDI_macOSPeers"];
          [v40 setUint32Value:v30];
        }
LABEL_36:

        goto LABEL_37;
      }
    }
    else
    {

      uint64_t v19 = 0;
    }
    uint64_t v21 = 0x7FFFFFFFLL;
    goto LABEL_19;
  }
LABEL_37:
  _Block_object_dispose(&v46, 8);

  _Block_object_dispose(&v52, 8);
}

- (void)resolveAppleCaptiveServer
{
  objc_initWeak(&location, self);
  if (![(WAEngine *)self isWiFiInterfacePrimary])
  {
    char v3 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      unsigned int v13 = "-[WAEngine resolveAppleCaptiveServer]";
      __int16 v14 = 1024;
      int v15 = 6058;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "%{public}s::%d:WiFi interface not primary...aborting DNS resolution", buf, 0x12u);
    }
    goto LABEL_8;
  }
  sub_100068F7C();
  if (objc_opt_class())
  {
    sub_100045570();
    if (objc_opt_class())
    {
      char v3 = objc_alloc_init((Class)sub_100045570());
      if (v3)
      {
        id v4 = [sub_100068F7C() requestWithTestID:7 configuration:0];
        unsigned int v11 = v4;
        id v5 = +[NSArray arrayWithObjects:&v11 count:1];

        unsigned int v6 = WALogCategoryDefaultHandle();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136446466;
          unsigned int v13 = "-[WAEngine resolveAppleCaptiveServer]";
          __int16 v14 = 1024;
          int v15 = 6065;
          _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:DNSResolution: enqueuing", buf, 0x12u);
        }

        v8[0] = _NSConcreteStackBlock;
        v8[1] = 3221225472;
        v8[2] = sub_100071D10;
        v8[3] = &unk_1000D18F0;
        objc_copyWeak(&v9, &location);
        id v7 = [v3 runDiagnostics:v5 configuration:0 update:0 reply:v8];
        objc_destroyWeak(&v9);
      }
LABEL_8:
    }
  }
  objc_destroyWeak(&location);
}

- (void)initializeProbeCxt
{
  char v3 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    appleCaptiveServerIP = self->_appleCaptiveServerIP;
    int v29 = 136446722;
    id v30 = "-[WAEngine initializeProbeCxt]";
    __int16 v31 = 1024;
    int v32 = 6093;
    __int16 v33 = 2112;
    __int16 v34 = appleCaptiveServerIP;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:initializing ProbeCxt self->_appleCaptiveServerIP:%@", (uint8_t *)&v29, 0x1Cu);
  }

  if (!self->_probeContextBE)
  {
    id v5 = +[NSMutableDictionary dictionary];
    probeContextBE = self->_probeContextBE;
    self->_probeContextBE = v5;

    id v7 = +[NSNumber numberWithInt:1];
    [(NSMutableDictionary *)self->_probeContextBE setObject:v7 forKeyedSubscript:@"PingCount"];

    BOOL v8 = +[NSNumber numberWithInt:1300];
    [(NSMutableDictionary *)self->_probeContextBE setObject:v8 forKeyedSubscript:@"PingDataLength"];

    id v9 = +[NSNumber numberWithInt:1];
    [(NSMutableDictionary *)self->_probeContextBE setObject:v9 forKeyedSubscript:@"PingTimeout"];

    dispatch_time_t v10 = +[NSNumber numberWithInt:0];
    [(NSMutableDictionary *)self->_probeContextBE setObject:v10 forKeyedSubscript:@"PingTrafficClass"];

    [(NSMutableDictionary *)self->_probeContextBE setObject:self->_appleCaptiveServerIP forKeyedSubscript:@"IPAddress"];
  }
  if (!self->_probeContextBK)
  {
    unsigned int v11 = +[NSMutableDictionary dictionary];
    probeContextBK = self->_probeContextBK;
    self->_probeContextBK = v11;

    unsigned int v13 = +[NSNumber numberWithInt:1];
    [(NSMutableDictionary *)self->_probeContextBK setObject:v13 forKeyedSubscript:@"PingCount"];

    __int16 v14 = +[NSNumber numberWithInt:1300];
    [(NSMutableDictionary *)self->_probeContextBK setObject:v14 forKeyedSubscript:@"PingDataLength"];

    int v15 = +[NSNumber numberWithInt:1];
    [(NSMutableDictionary *)self->_probeContextBK setObject:v15 forKeyedSubscript:@"PingTimeout"];

    unsigned int v16 = +[NSNumber numberWithInt:200];
    [(NSMutableDictionary *)self->_probeContextBK setObject:v16 forKeyedSubscript:@"PingTrafficClass"];

    [(NSMutableDictionary *)self->_probeContextBK setObject:self->_appleCaptiveServerIP forKeyedSubscript:@"IPAddress"];
  }
  if (!self->_probeContextVI)
  {
    os_log_type_t v17 = +[NSMutableDictionary dictionary];
    probeContextVI = self->_probeContextVI;
    self->_probeContextVI = v17;

    uint64_t v19 = +[NSNumber numberWithInt:1];
    [(NSMutableDictionary *)self->_probeContextVI setObject:v19 forKeyedSubscript:@"PingCount"];

    double v20 = +[NSNumber numberWithInt:1300];
    [(NSMutableDictionary *)self->_probeContextVI setObject:v20 forKeyedSubscript:@"PingDataLength"];

    uint64_t v21 = +[NSNumber numberWithInt:1];
    [(NSMutableDictionary *)self->_probeContextVI setObject:v21 forKeyedSubscript:@"PingTimeout"];

    __int16 v22 = +[NSNumber numberWithInt:700];
    [(NSMutableDictionary *)self->_probeContextVI setObject:v22 forKeyedSubscript:@"PingTrafficClass"];

    [(NSMutableDictionary *)self->_probeContextVI setObject:self->_appleCaptiveServerIP forKeyedSubscript:@"IPAddress"];
  }
  if (!self->_probeContextVO)
  {
    __int16 v23 = +[NSMutableDictionary dictionary];
    probeContextVO = self->_probeContextVO;
    self->_probeContextVO = v23;

    __int16 v25 = +[NSNumber numberWithInt:1];
    [(NSMutableDictionary *)self->_probeContextVO setObject:v25 forKeyedSubscript:@"PingCount"];

    unsigned int v26 = +[NSNumber numberWithInt:1300];
    [(NSMutableDictionary *)self->_probeContextVO setObject:v26 forKeyedSubscript:@"PingDataLength"];

    id v27 = +[NSNumber numberWithInt:1];
    [(NSMutableDictionary *)self->_probeContextVO setObject:v27 forKeyedSubscript:@"PingTimeout"];

    unsigned int v28 = +[NSNumber numberWithInt:800];
    [(NSMutableDictionary *)self->_probeContextVO setObject:v28 forKeyedSubscript:@"PingTrafficClass"];

    [(NSMutableDictionary *)self->_probeContextVO setObject:self->_appleCaptiveServerIP forKeyedSubscript:@"IPAddress"];
  }
}

- (void)triggerDiagnosticPingWithrequestId:(unsigned int)a3
{
  objc_initWeak(&location, self);
  if (![(WAEngine *)self isWiFiInterfacePrimary])
  {
    id v5 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)uint64_t v58 = 136446722;
      *(void *)&v58[4] = "-[WAEngine triggerDiagnosticPingWithrequestId:]";
      *(_WORD *)&v58[12] = 1024;
      *(_DWORD *)&v58[14] = 6130;
      *(_WORD *)&v58[18] = 1024;
      *(_DWORD *)&v58[20] = a3;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "%{public}s::%d:WiFi interface not primary...aborting ping instance:%d", v58, 0x18u);
    }
    goto LABEL_20;
  }
  sub_100068F7C();
  if (objc_opt_class())
  {
    sub_100045570();
    if (objc_opt_class())
    {
      id v5 = objc_alloc_init((Class)sub_100045570());
      *(void *)uint64_t v58 = 0;
      *(void *)&v58[8] = v58;
      *(void *)&v58[16] = 0x3032000000;
      uint64_t v59 = sub_10004D654;
      __int16 v60 = sub_10004D664;
      id v61 = 0;
      uint64_t v41 = 0;
      unsigned int v42 = &v41;
      uint64_t v43 = 0x3032000000;
      unsigned int v44 = sub_10004D654;
      char v45 = sub_10004D664;
      id v46 = 0;
      uint64_t v35 = 0;
      unsigned int v36 = &v35;
      uint64_t v37 = 0x3032000000;
      __int16 v38 = sub_10004D654;
      id v39 = sub_10004D664;
      id v40 = 0;
      uint64_t v29 = 0;
      id v30 = &v29;
      uint64_t v31 = 0x3032000000;
      int v32 = sub_10004D654;
      __int16 v33 = sub_10004D664;
      id v34 = 0;
      dnsStudyQueue = self->_dnsStudyQueue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100072ADC;
      block[3] = &unk_1000D1918;
      void block[4] = self;
      void block[5] = v58;
      void block[6] = &v41;
      block[7] = &v35;
      block[8] = &v29;
      dispatch_sync((dispatch_queue_t)dnsStudyQueue, block);
      if (!v5)
      {
LABEL_19:
        _Block_object_dispose(&v29, 8);

        _Block_object_dispose(&v35, 8);
        _Block_object_dispose(&v41, 8);

        _Block_object_dispose(v58, 8);
LABEL_20:

        goto LABEL_21;
      }
      id v7 = [sub_100068F7C() requestWithTestID:3 configuration:*(void *)(*(void *)&v58[8] + 40)];
      v57[0] = v7;
      BOOL v8 = [sub_100068F7C() requestWithTestID:3 configuration:v42[5]];
      v57[1] = v8;
      id v9 = [sub_100068F7C() requestWithTestID:3 configuration:v30[5]];
      v57[2] = v9;
      dispatch_time_t v10 = [sub_100068F7C() requestWithTestID:3 configuration:v36[5]];
      v57[3] = v10;
      unsigned int v11 = +[NSArray arrayWithObjects:v57 count:4];

      unsigned int v12 = [sub_100068F7C() requestWithTestID:6 configuration:*(void *)(*(void *)&v58[8] + 40)];
      v56[0] = v12;
      unsigned int v13 = [sub_100068F7C() requestWithTestID:6 configuration:v42[5]];
      v56[1] = v13;
      __int16 v14 = [sub_100068F7C() requestWithTestID:6 configuration:v30[5]];
      v56[2] = v14;
      int v15 = [sub_100068F7C() requestWithTestID:6 configuration:v36[5]];
      v56[3] = v15;
      unsigned int v16 = +[NSArray arrayWithObjects:v56 count:4];

      if (self->_appleCaptiveServerIP)
      {
        id v17 = [v11 arrayByAddingObjectsFromArray:v16];
      }
      else
      {
        id v17 = v11;
      }
      uint32_t v18 = v17;
      if (!a3) {
        self->_isCaptiveServerIPResolved = self->_appleCaptiveServerIP != 0;
      }
      uint64_t v19 = WALogCategoryDefaultHandle();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        appleCaptiveServerIP = self->_appleCaptiveServerIP;
        *(_DWORD *)buf = 136446978;
        uint64_t v49 = "-[WAEngine triggerDiagnosticPingWithrequestId:]";
        __int16 v50 = 1024;
        int v51 = 6158;
        __int16 v52 = 1024;
        unsigned int v53 = a3;
        __int16 v54 = 2112;
        int v55 = appleCaptiveServerIP;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Ping: instanceId:%u equeueing...  CaptiveServerIP:%@", buf, 0x22u);
      }

      uint64_t v21 = [(RecommendationEngine *)self->_recommendationEngine preferences];
      BOOL v22 = [(unint64_t)[v21 dns_symptoms_trap_evaluated_at_sample] > a3];

      if (v22)
      {
        self->_totalLANPingsBeforeTrap += 4;
        if (self->_appleCaptiveServerIP)
        {
          uint64_t v23 = 264;
LABEL_17:
          *(Class *)((char *)&self->super.isa + v23) = (Class)(*(char **)((char *)&self->super.isa + v23) + 4);
        }
      }
      else
      {
        self->_totalLANPingsAfterTrap += 4;
        if (self->_appleCaptiveServerIP)
        {
          uint64_t v23 = 296;
          goto LABEL_17;
        }
      }
      v25[0] = _NSConcreteStackBlock;
      v25[1] = 3221225472;
      v25[2] = sub_100072BC4;
      v25[3] = &unk_1000D1968;
      objc_copyWeak(&v26, &location);
      unsigned int v27 = a3;
      id v24 = [v5 runDiagnostics:v18 configuration:0 update:0 reply:v25];
      objc_destroyWeak(&v26);

      goto LABEL_19;
    }
  }
LABEL_21:
  objc_destroyWeak(&location);
}

- (void)fetchSymptomsScores:(unsigned int)a3
{
  id v5 = WALogCategoryDefaultHandle();
  unsigned int v6 = v5;
  if (&_managed_event_fetch)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446722;
      unsigned int v12 = "-[WAEngine fetchSymptomsScores:]";
      __int16 v13 = 1024;
      int v14 = 6226;
      __int16 v15 = 1024;
      unsigned int v16 = a3;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Netscore: instanceId:%u enqueuing...", buf, 0x18u);
    }

    objc_initWeak(&location, self);
    objc_copyWeak(&v8, &location);
    unsigned int v9 = a3;
    if ((managed_event_fetch() & 1) == 0)
    {
      id v7 = WALogCategoryDefaultHandle();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446466;
        unsigned int v12 = "-[WAEngine fetchSymptomsScores:]";
        __int16 v13 = 1024;
        int v14 = 6272;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "%{public}s::%d:managed_event_fetch failed", buf, 0x12u);
      }
    }
    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      unsigned int v12 = "-[WAEngine fetchSymptomsScores:]";
      __int16 v13 = 1024;
      int v14 = 6222;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "%{public}s::%d:managed_event_fetch not available", buf, 0x12u);
    }
  }
}

- (BOOL)isScoreBelowThreshold:(id)a3 type:(unint64_t)a4 instanceId:(unsigned int)a5
{
  id v8 = a3;
  unsigned int v9 = [v8 objectForKeyedSubscript:@"AWD-info"];
  dispatch_time_t v10 = v9;
  if (v9)
  {
    unsigned int v11 = [v9 objectForKeyedSubscript:@"dns-total"];
    unsigned int v12 = [v11 intValue];

    __int16 v13 = [v10 objectForKeyedSubscript:@"dns-impacted"];
    unsigned int v14 = [v13 intValue];

    if (a4) {
      goto LABEL_3;
    }
  }
  else
  {
    unsigned int v14 = 0;
    unsigned int v12 = 0;
    if (a4)
    {
LABEL_3:
      __int16 v15 = [v10 objectForKeyedSubscript:@"data-stalls-score"];
      unsigned int v16 = [v15 intValue];

      if (a5)
      {
        id v17 = [(RecommendationEngine *)self->_recommendationEngine preferences];
        uint32_t v18 = (char *)[v17 dns_symptoms_interrogation_sample_count] - 1;

        if (v18 != (char *)a5)
        {
LABEL_17:
          unsigned int v24 = v12;
LABEL_18:
          __int16 v25 = [(RecommendationEngine *)self->_recommendationEngine preferences];
          BOOL v23 = (int)v16 <= (int)[v25 reset_score_threshold];

          unsigned int v12 = v24;
          goto LABEL_19;
        }
        uint64_t v19 = 424;
      }
      else
      {
        uint64_t v19 = 400;
      }
      *(Class *)((char *)&self->super.isa + v19) = (Class)v16;
      goto LABEL_17;
    }
  }
  double v20 = [v8 objectForKeyedSubscript:@"net-score"];
  unsigned int v16 = [v20 intValue];

  uint64_t v21 = 416;
  if (!a5) {
    uint64_t v21 = 392;
  }
  uint64_t v22 = 432;
  if (!a5) {
    uint64_t v22 = 408;
  }
  *(Class *)((char *)&self->super.isa + v21) = (Class)v16;
  *(Class *)((char *)&self->super.isa + v22) = (Class)v14;
  if (v12)
  {
    BOOL v23 = 0;
    if (v14)
    {
      unsigned int v24 = v14;
      if (v12 == v14) {
        goto LABEL_18;
      }
    }
  }
  else
  {
    BOOL v23 = 1;
  }
LABEL_19:
  id v26 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v27 = "NO";
    int v29 = 136448002;
    id v30 = "-[WAEngine isScoreBelowThreshold:type:instanceId:]";
    int v32 = 6311;
    __int16 v31 = 1024;
    if (v23) {
      unsigned int v27 = "YES";
    }
    __int16 v33 = 1024;
    unsigned int v34 = a5;
    __int16 v35 = 2048;
    unint64_t v36 = a4;
    __int16 v37 = 1024;
    unsigned int v38 = v16;
    __int16 v39 = 1024;
    unsigned int v40 = v12;
    __int16 v41 = 1024;
    unsigned int v42 = v14;
    __int16 v43 = 2080;
    unsigned int v44 = v27;
    _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:InstanceId:%u scoreType:%lu score:%d totalServers:%d impactedDnsServers:%d isBelowThreshold-result:%s", (uint8_t *)&v29, 0x3Eu);
  }

  return v23;
}

- (BOOL)isWiFiAssociatedToNetwork
{
  CFDictionaryRef v2 = [(CWFInterface *)self->_corewifi networkName];
  char v3 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = "Not Associated";
    id v7 = "-[WAEngine isWiFiAssociatedToNetwork]";
    int v6 = 136446722;
    if (v2) {
      id v4 = "Associated";
    }
    __int16 v8 = 1024;
    int v9 = 6327;
    __int16 v10 = 2080;
    unsigned int v11 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:isWiFiAssociatedToNetwork result: %s", (uint8_t *)&v6, 0x1Cu);
  }

  return v2 != 0;
}

- (void)computeAverageCcaSinceStudyStart:(id)a3
{
  id v27 = a3;
  char v3 = [v27 fieldForKey:@"DPSR_dpsCounterSamples"];
  id v4 = [v3 repeatableValues];
  id v5 = (char *)[v4 count];

  if (v5)
  {
    int v6 = 0;
    double v7 = 0.0;
    for (i = v5; i != v6; id v5 = i)
    {
      __int16 v8 = [v27 fieldForKey:@"DPSR_dpsCounterSamples"];
      int v9 = [v8 repeatableValues];
      __int16 v10 = [v9 objectAtIndex:v6];
      unsigned int v11 = [v10 fieldForKey:@"DPSCS_peerStats"];
      unsigned int v12 = [v11 subMessageValue];
      __int16 v13 = [v12 fieldForKey:@"NWAPS_obssCCA"];
      unsigned int v14 = [v13 uint32Value];

      __int16 v15 = [v27 fieldForKey:@"DPSR_dpsCounterSamples"];
      unsigned int v16 = [v15 repeatableValues];
      id v17 = [v16 objectAtIndex:v6];
      uint32_t v18 = [v17 fieldForKey:@"DPSCS_peerStats"];
      uint64_t v19 = [v18 subMessageValue];
      double v20 = [v19 fieldForKey:@"NWAPS_interferenceCCA"];
      unsigned int v21 = [v20 uint32Value];

      uint64_t v22 = WALogCategoryDefaultHandle();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136447234;
        int v29 = "-[WAEngine computeAverageCcaSinceStudyStart:]";
        __int16 v30 = 1024;
        int v31 = 6343;
        __int16 v32 = 2048;
        *(void *)__int16 v33 = v6;
        *(_WORD *)&v33[8] = 1024;
        *(_DWORD *)unsigned int v34 = v14;
        *(_WORD *)&v34[4] = 1024;
        *(_DWORD *)&v34[6] = v21;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:AvgCCAComputation: instance:%lu obssCCA:%d interferenceCCA:%d", buf, 0x28u);
      }
      double v7 = v7 + (double)(v21 + v14);

      ++v6;
    }
  }
  else
  {
    double v7 = 0.0;
  }
  double v23 = v7 / (double)(unint64_t)v5;
  unsigned int v24 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136447234;
    int v29 = "-[WAEngine computeAverageCcaSinceStudyStart:]";
    __int16 v30 = 1024;
    int v31 = 6346;
    __int16 v32 = 1024;
    *(_DWORD *)__int16 v33 = (int)v23;
    *(_WORD *)&v33[4] = 1024;
    *(_DWORD *)&v33[6] = (int)v7;
    *(_WORD *)unsigned int v34 = 2048;
    *(void *)&v34[2] = v5;
    _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:AvgCCAComputation: result:%d sumCCA:%d count:%lu", buf, 0x28u);
  }

  self->_cumulativeAverageCcaSinceStudyStart = v23;
}

- (BOOL)isWiFiInterfacePrimary
{
  char v3 = [(CWFInterface *)self->_corewifi globalIPv4InterfaceName];
  id v4 = [(CWFInterface *)self->_corewifi globalIPv4NetworkServiceID];
  id v5 = [(CWFInterface *)self->_corewifi globalIPv4InterfaceName];
  int v6 = [(CWFInterface *)self->_corewifi globalIPv6NetworkServiceID];
  double v7 = [(CWFInterface *)self->_corewifi networkServiceID];
  BOOL v8 = ([v7 isEqualToString:v4] & 1) != 0
    || [v7 isEqualToString:v6];
  int v9 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v13 = "-[WAEngine isWiFiInterfacePrimary]";
    __int16 v14 = 1024;
    __int16 v10 = "NO";
    int v15 = 6365;
    __int16 v16 = 2080;
    int v12 = 136447234;
    if (v8) {
      __int16 v10 = "YES";
    }
    id v17 = v10;
    __int16 v18 = 2112;
    uint64_t v19 = v3;
    __int16 v20 = 2112;
    unsigned int v21 = v5;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:isWiFiInterfacePrimary result:%s IPv4interface:%@ IPv6Interface:%@ ", (uint8_t *)&v12, 0x30u);
  }

  return v8;
}

- (BOOL)isWiFiNetworkCaptive
{
  CFDictionaryRef v2 = [(CWFInterface *)self->_corewifi currentKnownNetworkProfile];
  char v3 = v2;
  if (v2) {
    unsigned __int8 v4 = [v2 isCaptive];
  }
  else {
    unsigned __int8 v4 = 0;
  }

  return v4;
}

- (NSMutableDictionary)submitterMap
{
  return self->_submitterMap;
}

- (void)setSubmitterMap:(id)a3
{
}

- (NSMutableDictionary)processTokenToGroupTypeMap
{
  return self->_processTokenToGroupTypeMap;
}

- (void)setProcessTokenToGroupTypeMap:(id)a3
{
}

- (OS_dispatch_queue)engineQ
{
  return self->_engineQ;
}

- (void)setEngineQ:(id)a3
{
}

- (WAMessageAWDStore)messageStore
{
  return self->_messageStore;
}

- (void)setMessageStore:(id)a3
{
}

- (WAIOReporterMessagePopulator)iorMessagePopulator
{
  return self->_iorMessagePopulator;
}

- (void)setIorMessagePopulator:(id)a3
{
}

- (NSXPCListener)listener
{
  return self->_listener;
}

- (void)setListener:(id)a3
{
}

- (NSMutableDictionary)processTokenToXPCConnectionMap
{
  return self->_processTokenToXPCConnectionMap;
}

- (void)setProcessTokenToXPCConnectionMap:(id)a3
{
}

- (NSMutableArray)pendingUntokenedConnections
{
  return self->_pendingUntokenedConnections;
}

- (void)setPendingUntokenedConnections:(id)a3
{
}

- (NSMutableDictionary)cachedModelObjectsKeyToMessageMap
{
  return self->_cachedModelObjectsKeyToMessageMap;
}

- (void)setCachedModelObjectsKeyToMessageMap:(id)a3
{
}

- (NSMutableDictionary)interfaceNameToApple80211InstanceMap
{
  return self->_interfaceNameToApple80211InstanceMap;
}

- (void)setInterfaceNameToApple80211InstanceMap:(id)a3
{
}

- (NSString)infraInterfaceName
{
  return self->_infraInterfaceName;
}

- (void)setInfraInterfaceName:(id)a3
{
}

- (CADataTransformEngine)transformEngine
{
  return self->_transformEngine;
}

- (void)setTransformEngine:(id)a3
{
}

- (NSMutableDictionary)studyTimeStamps
{
  return self->_studyTimeStamps;
}

- (void)setStudyTimeStamps:(id)a3
{
}

- (RecommendationEngine)recommendationEngine
{
  return self->_recommendationEngine;
}

- (void)setRecommendationEngine:(id)a3
{
}

- (BOOL)dpsStudyInProgress
{
  return self->_dpsStudyInProgress;
}

- (void)setDpsStudyInProgress:(BOOL)a3
{
  self->_BOOL dpsStudyInProgress = a3;
}

- (BOOL)dpsCurrentlyGatheringConsecutiveSamples
{
  return self->_dpsCurrentlyGatheringConsecutiveSamples;
}

- (void)setDpsCurrentlyGatheringConsecutiveSamples:(BOOL)a3
{
  self->_BOOL dpsCurrentlyGatheringConsecutiveSamples = a3;
}

- (BOOL)slowWiFiStudyInProgress
{
  return self->_slowWiFiStudyInProgress;
}

- (void)setSlowWiFiStudyInProgress:(BOOL)a3
{
  self->_BOOL slowWiFiStudyInProgress = a3;
}

- (BOOL)isNWActivityInProgress
{
  return self->_isNWActivityInProgress;
}

- (void)setIsNWActivityInProgress:(BOOL)a3
{
  self->_isNWActivityInProgress = a3;
}

- (DPSQuickRecoveryRecommendationEngine)dpsQuickRecoveryEngine
{
  return self->_dpsQuickRecoveryEngine;
}

- (void)setDpsQuickRecoveryEngine:(id)a3
{
}

- (NSString)wifiChipSet
{
  return self->_wifiChipSet;
}

- (void)setWifiChipSet:(id)a3
{
}

- (unint64_t)dpsNotificationTimeInSeconds
{
  return self->_dpsNotificationTimeInSeconds;
}

- (void)setDpsNotificationTimeInSeconds:(unint64_t)a3
{
  self->_dpsNotificationTimeInSeconds = a3;
}

- (unint64_t)dpsNotificationCCA
{
  return self->_dpsNotificationCCA;
}

- (void)setDpsNotificationCCA:(unint64_t)a3
{
  self->_dpsNotificationCCA = a3;
}

- (BOOL)isInternalInstall
{
  return self->_isInternalInstall;
}

- (void)setIsInternalInstall:(BOOL)a3
{
  self->_isInternalInstall = a3;
}

- (BOOL)isMemoryPressureRequestDeferred
{
  return self->_isMemoryPressureRequestDeferred;
}

- (void)setIsMemoryPressureRequestDeferred:(BOOL)a3
{
  self->_isMemoryPressureRequestDeferred = a3;
}

- (OS_os_transaction)dpsStudyTransaction
{
  return self->_dpsStudyTransaction;
}

- (void)setDpsStudyTransaction:(id)a3
{
}

- (OS_os_transaction)dnsStudyTransaction
{
  return self->_dnsStudyTransaction;
}

- (void)setDnsStudyTransaction:(id)a3
{
}

- (OS_os_transaction)slowwifiStudyTransaction
{
  return self->_slowwifiStudyTransaction;
}

- (void)setSlowwifiStudyTransaction:(id)a3
{
}

- (BOOL)dpsNotificationDuringDnsStudy
{
  return self->_dpsNotificationDuringDnsStudy;
}

- (void)setDpsNotificationDuringDnsStudy:(BOOL)a3
{
  self->_dpsNotificationDuringDnsStudy = a3;
}

- (BOOL)slowWiFiNotificationDuringDnsStudy
{
  return self->_slowWiFiNotificationDuringDnsStudy;
}

- (void)setSlowWiFiNotificationDuringDnsStudy:(BOOL)a3
{
  self->_slowWiFiNotificationDuringDnsStudy = a3;
}

- (BOOL)isPingEnqueueFailing
{
  return self->_isPingEnqueueFailing;
}

- (void)setIsPingEnqueueFailing:(BOOL)a3
{
  self->_isPingEnqueueFailing = a3;
}

- (BOOL)isCriticalAppInUse
{
  return self->_isCriticalAppInUse;
}

- (void)setIsCriticalAppInUse:(BOOL)a3
{
  self->_isCriticalAppInUse = a3;
}

- (BOOL)dnsStudyInProgress
{
  return self->_dnsStudyInProgress;
}

- (void)setDnsStudyInProgress:(BOOL)a3
{
  self->_BOOL dnsStudyInProgress = a3;
}

- (BOOL)isCaptiveServerIPResolved
{
  return self->_isCaptiveServerIPResolved;
}

- (void)setIsCaptiveServerIPResolved:(BOOL)a3
{
  self->_isCaptiveServerIPResolved = a3;
}

- (BOOL)isPoorSymptomsDnsConditions
{
  return self->_isPoorSymptomsDnsConditions;
}

- (void)setIsPoorSymptomsDnsConditions:(BOOL)a3
{
  self->_isPoorSymptomsDnsConditions = a3;
}

- (BOOL)didSymptomsConditionRecoverAfterDecision
{
  return self->_didSymptomsConditionRecoverAfterDecision;
}

- (void)setDidSymptomsConditionRecoverAfterDecision:(BOOL)a3
{
  self->_didSymptomsConditionRecoverAfterDecision = a3;
}

- (BOOL)isGatewayReachable
{
  return self->_isGatewayReachable;
}

- (void)setIsGatewayReachable:(BOOL)a3
{
  self->_isGatewayReachable = a3;
}

- (BOOL)isAWDLActivitySuspected
{
  return self->_isAWDLActivitySuspected;
}

- (void)setIsAWDLActivitySuspected:(BOOL)a3
{
  self->_isAWDLActivitySuspected = a3;
}

- (BOOL)isAssociatedSinceStudyStart
{
  return self->_isAssociatedSinceStudyStart;
}

- (void)setIsAssociatedSinceStudyStart:(BOOL)a3
{
  self->_isAssociatedSinceStudyStart = a3;
}

- (BOOL)isAssociatedStateKnown
{
  return self->_isAssociatedStateKnown;
}

- (void)setIsAssociatedStateKnown:(BOOL)a3
{
  self->_isAssociatedStateKnown = a3;
}

- (void)setIsAssociated:(BOOL)a3
{
  self->_isAssociated = a3;
}

- (BOOL)forceStudyErrorFromMsg
{
  return self->_forceStudyErrorFromMsg;
}

- (void)setForceStudyErrorFromMsg:(BOOL)a3
{
  self->_forceStudyErrorFromMsg = a3;
}

- (unint64_t)cumulativeAverageCcaSinceStudyStart
{
  return self->_cumulativeAverageCcaSinceStudyStart;
}

- (void)setCumulativeAverageCcaSinceStudyStart:(unint64_t)a3
{
  self->_cumulativeAverageCcaSinceStudyStart = a3;
}

- (unint64_t)totalLANPingsBeforeTrap
{
  return self->_totalLANPingsBeforeTrap;
}

- (void)setTotalLANPingsBeforeTrap:(unint64_t)a3
{
  self->_totalLANPingsBeforeTrap = a3;
}

- (unint64_t)totalLANPingSuccessBeforeTrap
{
  return self->_totalLANPingSuccessBeforeTrap;
}

- (void)setTotalLANPingSuccessBeforeTrap:(unint64_t)a3
{
  self->_totalLANPingSuccessBeforeTrap = a3;
}

- (unint64_t)totalWANPingsBeforeTrap
{
  return self->_totalWANPingsBeforeTrap;
}

- (void)setTotalWANPingsBeforeTrap:(unint64_t)a3
{
  self->_totalWANPingsBeforeTrap = a3;
}

- (unint64_t)totalWANPingSuccessBeforeTrap
{
  return self->_totalWANPingSuccessBeforeTrap;
}

- (void)setTotalWANPingSuccessBeforeTrap:(unint64_t)a3
{
  self->_totalWANPingSuccessBeforeTrap = a3;
}

- (unint64_t)totalLANPingsAfterTrap
{
  return self->_totalLANPingsAfterTrap;
}

- (void)setTotalLANPingsAfterTrap:(unint64_t)a3
{
  self->_totalLANPingsAfterTrap = a3;
}

- (unint64_t)totalLANPingSuccessAfterTrap
{
  return self->_totalLANPingSuccessAfterTrap;
}

- (void)setTotalLANPingSuccessAfterTrap:(unint64_t)a3
{
  self->_totalLANPingSuccessAfterTrap = a3;
}

- (unint64_t)totalWANPingsAfterTrap
{
  return self->_totalWANPingsAfterTrap;
}

- (void)setTotalWANPingsAfterTrap:(unint64_t)a3
{
  self->_totalWANPingsAfterTrap = a3;
}

- (unint64_t)totalWANPingSuccessAfterTrap
{
  return self->_totalWANPingSuccessAfterTrap;
}

- (void)setTotalWANPingSuccessAfterTrap:(unint64_t)a3
{
  self->_totalWANPingSuccessAfterTrap = a3;
}

- (unint64_t)numNetScoreBelowThresholdBeforeTrap
{
  return self->_numNetScoreBelowThresholdBeforeTrap;
}

- (void)setNumNetScoreBelowThresholdBeforeTrap:(unint64_t)a3
{
  self->_numNetScoreBelowThresholdBeforeTrap = a3;
}

- (unint64_t)numNetScoreBelowThresholdAfterTrap
{
  return self->_numNetScoreBelowThresholdAfterTrap;
}

- (void)setNumNetScoreBelowThresholdAfterTrap:(unint64_t)a3
{
  self->_numNetScoreBelowThresholdAfterTrap = a3;
}

- (unint64_t)numDataStallScoreBelowThresholdBeforeTrap
{
  return self->_numDataStallScoreBelowThresholdBeforeTrap;
}

- (void)setNumDataStallScoreBelowThresholdBeforeTrap:(unint64_t)a3
{
  self->_numDataStallScoreBelowThresholdBeforeTrap = a3;
}

- (unint64_t)numDataStallScoreBelowThresholdAfterTrap
{
  return self->_numDataStallScoreBelowThresholdAfterTrap;
}

- (void)setNumDataStallScoreBelowThresholdAfterTrap:(unint64_t)a3
{
  self->_numDataStallScoreBelowThresholdAfterTrap = a3;
}

- (unint64_t)totalDnsServers
{
  return self->_totalDnsServers;
}

- (void)setTotalDnsServers:(unint64_t)a3
{
  self->_totalDnsServers = a3;
}

- (unint64_t)numIPv4DnsServers
{
  return self->_numIPv4DnsServers;
}

- (void)setNumIPv4DnsServers:(unint64_t)a3
{
  self->_numIPv4DnsServers = a3;
}

- (unint64_t)numIPv6DnsServers
{
  return self->_numIPv6DnsServers;
}

- (void)setNumIPv6DnsServers:(unint64_t)a3
{
  self->_numIPv6DnsServers = a3;
}

- (unint64_t)numLocalDnsServers
{
  return self->_numLocalDnsServers;
}

- (void)setNumLocalDnsServers:(unint64_t)a3
{
  self->_numLocalDnsServers = a3;
}

- (unint64_t)numRemoteDnsServers
{
  return self->_numRemoteDnsServers;
}

- (void)setNumRemoteDnsServers:(unint64_t)a3
{
  self->_numRemoteDnsServers = a3;
}

- (int64_t)dnsServerConfigType
{
  return self->_dnsServerConfigType;
}

- (void)setDnsServerConfigType:(int64_t)a3
{
  self->_dnsServerConfigType = a3;
}

- (unint64_t)netscoreAtStudyStart
{
  return self->_netscoreAtStudyStart;
}

- (void)setNetscoreAtStudyStart:(unint64_t)a3
{
  self->_netscoreAtStudyStart = a3;
}

- (unint64_t)stallscoreAtStudyStart
{
  return self->_stallscoreAtStudyStart;
}

- (void)setStallscoreAtStudyStart:(unint64_t)a3
{
  self->_stallscoreAtStudyStart = a3;
}

- (unint64_t)impactedServersAtStudyStart
{
  return self->_impactedServersAtStudyStart;
}

- (void)setImpactedServersAtStudyStart:(unint64_t)a3
{
  self->_impactedServersAtStudyStart = a3;
}

- (unint64_t)netscoreAtStudyEnd
{
  return self->_netscoreAtStudyEnd;
}

- (void)setNetscoreAtStudyEnd:(unint64_t)a3
{
  self->_netscoreAtStudyEnd = a3;
}

- (unint64_t)stallscoreAtStudyEnd
{
  return self->_stallscoreAtStudyEnd;
}

- (void)setStallscoreAtStudyEnd:(unint64_t)a3
{
  self->_stallscoreAtStudyEnd = a3;
}

- (unint64_t)impactedServersAtStudyEnd
{
  return self->_impactedServersAtStudyEnd;
}

- (void)setImpactedServersAtStudyEnd:(unint64_t)a3
{
  self->_impactedServersAtStudyEnd = a3;
}

- (NSMutableDictionary)probeContextBE
{
  return self->_probeContextBE;
}

- (void)setProbeContextBE:(id)a3
{
}

- (NSMutableDictionary)probeContextBK
{
  return self->_probeContextBK;
}

- (void)setProbeContextBK:(id)a3
{
}

- (NSMutableDictionary)probeContextVI
{
  return self->_probeContextVI;
}

- (void)setProbeContextVI:(id)a3
{
}

- (NSMutableDictionary)probeContextVO
{
  return self->_probeContextVO;
}

- (void)setProbeContextVO:(id)a3
{
}

- (NSString)appleCaptiveServerIP
{
  return self->_appleCaptiveServerIP;
}

- (void)setAppleCaptiveServerIP:(id)a3
{
}

- (NSMutableArray)accessPointInfoToAppend
{
  return self->_accessPointInfoToAppend;
}

- (void)setAccessPointInfoToAppend:(id)a3
{
}

- (OS_dispatch_queue)dnsStudyQueue
{
  return self->_dnsStudyQueue;
}

- (void)setDnsStudyQueue:(id)a3
{
}

- (NSMutableArray)usbEventNotificationToAppend
{
  return self->_usbEventNotificationToAppend;
}

- (void)setUsbEventNotificationToAppend:(id)a3
{
}

- (WACoreCapture)coreCaptureControl
{
  return self->_coreCaptureControl;
}

- (void)setCoreCaptureControl:(id)a3
{
}

- (OS_dispatch_queue)studyQueue
{
  return self->_studyQueue;
}

- (void)setStudyQueue:(id)a3
{
}

- (OS_dispatch_queue)dpsReadWriteSerialQueue
{
  return self->_dpsReadWriteSerialQueue;
}

- (void)setDpsReadWriteSerialQueue:(id)a3
{
}

- (OS_dispatch_queue)peerDiagnosticsStudyQueue
{
  return self->_peerDiagnosticsStudyQueue;
}

- (void)setPeerDiagnosticsStudyQueue:(id)a3
{
}

- (NSMutableArray)dpsnToAppend
{
  return self->_dpsnToAppend;
}

- (void)setDpsnToAppend:(id)a3
{
}

- (NSMutableArray)dpsapToAppend
{
  return self->_dpsapToAppend;
}

- (void)setDpsapToAppend:(id)a3
{
}

- (NSMutableArray)dpscsToAppend
{
  return self->_dpscsToAppend;
}

- (void)setDpscsToAppend:(id)a3
{
}

- (NSMutableArray)assocDiffToAppend
{
  return self->_assocDiffToAppend;
}

- (void)setAssocDiffToAppend:(id)a3
{
}

- (NSMutableArray)swfnToAppend
{
  return self->_swfnToAppend;
}

- (void)setSwfnToAppend:(id)a3
{
}

- (int)dpsAction
{
  return self->_dpsAction;
}

- (void)setDpsAction:(int)a3
{
  self->_dpsAction = a3;
}

- (BOOL)tmpFilesHaveAttemptedProcessingInDataStreamPath
{
  return self->_tmpFilesHaveAttemptedProcessingInDataStreamPath;
}

- (void)setTmpFilesHaveAttemptedProcessingInDataStreamPath:(BOOL)a3
{
  self->_tmpFilesHaveAttemptedProcessingInDataStreamPath = a3;
}

- (OS_dispatch_queue)fileHandlingQ
{
  return self->_fileHandlingQ;
}

- (void)setFileHandlingQ:(id)a3
{
}

- (NSURL)wifianalyticsTmpDir
{
  return self->_wifianalyticsTmpDir;
}

- (void)setWifianalyticsTmpDir:(id)a3
{
}

- (OS_dispatch_queue)mutexQueue
{
  return self->_mutexQueue;
}

- (void)setMutexQueue:(id)a3
{
}

- (AnalyticsProcessor)analyticsProcessor
{
  return self->_analyticsProcessor;
}

- (void)setAnalyticsProcessor:(id)a3
{
}

- (double)analyticsProcessingTimeIntervalSecs
{
  return self->_analyticsProcessingTimeIntervalSecs;
}

- (void)setAnalyticsProcessingTimeIntervalSecs:(double)a3
{
  self->_unint64_t analyticsProcessingTimeIntervalSecs = a3;
}

- (double)analyticsAgeOutTimeIntervalSecs
{
  return self->_analyticsAgeOutTimeIntervalSecs;
}

- (void)setAnalyticsAgeOutTimeIntervalSecs:(double)a3
{
  self->_analyticsAgeOutTimeIntervalSecs = a3;
}

- (BOOL)analyticsProcessorIsReady
{
  return self->_analyticsProcessorIsReady;
}

- (void)setAnalyticsProcessorIsReady:(BOOL)a3
{
  self->_analyticsProcessorIsReady = a3;
}

- (int)keybagToken
{
  return self->_keybagToken;
}

- (void)setKeybagToken:(int)a3
{
  self->_keybagToken = a3;
}

- (OS_dispatch_source)jsonFilerReaderTimer
{
  return (OS_dispatch_source *)objc_getProperty(self, a2, 624, 1);
}

- (void)setJsonFilerReaderTimer:(id)a3
{
}

- (OS_dispatch_queue)manageConfigQueue
{
  return self->_manageConfigQueue;
}

- (void)setManageConfigQueue:(id)a3
{
}

- (ManagedConfiguration)managedConfiguration
{
  return self->_managedConfiguration;
}

- (void)setManagedConfiguration:(id)a3
{
}

- (DatapathMetricStream)datapathMetricStream
{
  return self->_datapathMetricStream;
}

- (void)setDatapathMetricStream:(id)a3
{
}

- (id)DatapathMetricGetter
{
  return self->_DatapathMetricGetter;
}

- (void)setDatapathMetricGetter:(id)a3
{
}

- (NSDate)lastDateDetermineChannelsPerIORPopulatableQueried
{
  return self->_lastDateDetermineChannelsPerIORPopulatableQueried;
}

- (void)setLastDateDetermineChannelsPerIORPopulatableQueried:(id)a3
{
}

- (NSDate)lastDateWiFiAppInstalledQueried
{
  return self->_lastDateWiFiAppInstalledQueried;
}

- (void)setLastDateWiFiAppInstalledQueried:(id)a3
{
}

- (BOOL)isWiFiAppInstalled
{
  return self->_isWiFiAppInstalled;
}

- (void)setIsWiFiAppInstalled:(BOOL)a3
{
  self->_isWiFiAppInstalled = a3;
}

- (RecommendationPreferences)preferences
{
  return self->_preferences;
}

- (void)setPreferences:(id)a3
{
}

- (NSMutableDictionary)cachedUsage
{
  return self->_cachedUsage;
}

- (void)setCachedUsage:(id)a3
{
}

- (int)pid
{
  return self->_pid;
}

- (void)setPid:(int)a3
{
  self->_pid = a3;
}

- (NSDate)pidLaunchDate
{
  return (NSDate *)objc_getProperty(self, a2, 696, 1);
}

- (void)setPidLaunchDate:(id)a3
{
}

- (BOOL)persistFileExistedAtPIDLoad
{
  return self->_persistFileExistedAtPIDLoad;
}

- (void)setPersistFileExistedAtPIDLoad:(BOOL)a3
{
  self->_persistFileExistedAtPIDLoad = a3;
}

- (BOOL)readingPersistFile
{
  return self->_readingPersistFile;
}

- (void)setReadingPersistFile:(BOOL)a3
{
  self->_BOOL readingPersistFile = a3;
}

- (BOOL)writingPersistFile
{
  return self->_writingPersistFile;
}

- (void)setWritingPersistFile:(BOOL)a3
{
  self->_writingPersistFile = a3;
}

- (NSDictionary)nowCacheUsageForTelemetry
{
  return self->_nowCacheUsageForTelemetry;
}

- (void)setNowCacheUsageForTelemetry:(id)a3
{
}

- (NSDictionary)oldCacheUsageForTelemetry
{
  return self->_oldCacheUsageForTelemetry;
}

- (void)setOldCacheUsageForTelemetry:(id)a3
{
}

- (OS_dispatch_source)workReportTimer
{
  return (OS_dispatch_source *)objc_getProperty(self, a2, 720, 1);
}

- (void)setWorkReportTimer:(id)a3
{
}

- (BOOL)workReportTimerRunning
{
  return self->_workReportTimerRunning;
}

- (void)setWorkReportTimerRunning:(BOOL)a3
{
  self->_BOOL workReportTimerRunning = a3;
}

- (unint64_t)workReportSelectingSingleWithinFirstDay
{
  return self->_workReportSelectingSingleWithinFirstDay;
}

- (void)setWorkReportSelectingSingleWithinFirstDay:(unint64_t)a3
{
  self->_unint64_t workReportSelectingSingleWithinFirstDay = a3;
}

- (unint64_t)workReportSelectingSingleWithinFirstWeek
{
  return self->_workReportSelectingSingleWithinFirstWeek;
}

- (void)setWorkReportSelectingSingleWithinFirstWeek:(unint64_t)a3
{
  self->_unint64_t workReportSelectingSingleWithinFirstWeek = a3;
}

- (unsigned)isMegaEnabled
{
  return self->_isMegaEnabled;
}

- (void)setIsMegaEnabled:(unsigned __int8)a3
{
  self->_isMegaEnabled = a3;
}

- (NSDate)profileMegaEnabledDate
{
  return (NSDate *)objc_getProperty(self, a2, 744, 1);
}

- (void)setProfileMegaEnabledDate:(id)a3
{
}

- (NSDate)profileMegaDisabledDate
{
  return (NSDate *)objc_getProperty(self, a2, 752, 1);
}

- (void)setProfileMegaDisabledDate:(id)a3
{
}

- (unint64_t)profileMegaEnabledSeconds
{
  return self->_profileMegaEnabledSeconds;
}

- (void)setProfileMegaEnabledSeconds:(unint64_t)a3
{
  self->_unint64_t profileMegaEnabledSeconds = a3;
}

- (unint64_t)profileMegaDisabledSeconds
{
  return self->_profileMegaDisabledSeconds;
}

- (void)setProfileMegaDisabledSeconds:(unint64_t)a3
{
  self->_profileMegaDisabledSeconds = a3;
}

- (int64_t)driverType
{
  return self->_driverType;
}

- (void)setDriverType:(int64_t)a3
{
  self->_driverType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_profileMegaDisabledDate, 0);
  objc_storeStrong((id *)&self->_profileMegaEnabledDate, 0);
  objc_storeStrong((id *)&self->_workReportTimer, 0);
  objc_storeStrong((id *)&self->_oldCacheUsageForTelemetry, 0);
  objc_storeStrong((id *)&self->_nowCacheUsageForTelemetry, 0);
  objc_storeStrong((id *)&self->_pidLaunchDate, 0);
  objc_storeStrong((id *)&self->_cachedUsage, 0);
  objc_storeStrong((id *)&self->_preferences, 0);
  objc_storeStrong((id *)&self->_lastDateWiFiAppInstalledQueried, 0);
  objc_storeStrong((id *)&self->_lastDateDetermineChannelsPerIORPopulatableQueried, 0);
  objc_storeStrong(&self->_DatapathMetricGetter, 0);
  objc_storeStrong((id *)&self->_datapathMetricStream, 0);
  objc_storeStrong((id *)&self->_managedConfiguration, 0);
  objc_storeStrong((id *)&self->_manageConfigQueue, 0);
  objc_storeStrong((id *)&self->_jsonFilerReaderTimer, 0);
  objc_storeStrong((id *)&self->_analyticsProcessor, 0);
  objc_storeStrong((id *)&self->_mutexQueue, 0);
  objc_storeStrong((id *)&self->_wifianalyticsTmpDir, 0);
  objc_storeStrong((id *)&self->_fileHandlingQ, 0);
  objc_storeStrong((id *)&self->_swfnToAppend, 0);
  objc_storeStrong((id *)&self->_assocDiffToAppend, 0);
  objc_storeStrong((id *)&self->_dpscsToAppend, 0);
  objc_storeStrong((id *)&self->_dpsapToAppend, 0);
  objc_storeStrong((id *)&self->_dpsnToAppend, 0);
  objc_storeStrong((id *)&self->_peerDiagnosticsStudyQueue, 0);
  objc_storeStrong((id *)&self->_dpsReadWriteSerialQueue, 0);
  objc_storeStrong((id *)&self->_studyQueue, 0);
  objc_storeStrong((id *)&self->_coreCaptureControl, 0);
  objc_storeStrong((id *)&self->_usbEventNotificationToAppend, 0);
  objc_storeStrong((id *)&self->_dnsStudyQueue, 0);
  objc_storeStrong((id *)&self->_accessPointInfoToAppend, 0);
  objc_storeStrong((id *)&self->_appleCaptiveServerIP, 0);
  objc_storeStrong((id *)&self->_probeContextVO, 0);
  objc_storeStrong((id *)&self->_probeContextVI, 0);
  objc_storeStrong((id *)&self->_probeContextBK, 0);
  objc_storeStrong((id *)&self->_probeContextBE, 0);
  objc_storeStrong((id *)&self->_slowwifiStudyTransaction, 0);
  objc_storeStrong((id *)&self->_dnsStudyTransaction, 0);
  objc_storeStrong((id *)&self->_dpsStudyTransaction, 0);
  objc_storeStrong((id *)&self->_wifiChipSet, 0);
  objc_storeStrong((id *)&self->_dpsQuickRecoveryEngine, 0);
  objc_storeStrong((id *)&self->_recommendationEngine, 0);
  objc_storeStrong((id *)&self->_studyTimeStamps, 0);
  objc_storeStrong((id *)&self->_transformEngine, 0);
  objc_storeStrong((id *)&self->_infraInterfaceName, 0);
  objc_storeStrong((id *)&self->_interfaceNameToApple80211InstanceMap, 0);
  objc_storeStrong((id *)&self->_cachedModelObjectsKeyToMessageMap, 0);
  objc_storeStrong((id *)&self->_pendingUntokenedConnections, 0);
  objc_storeStrong((id *)&self->_processTokenToXPCConnectionMap, 0);
  objc_storeStrong((id *)&self->_listener, 0);
  objc_storeStrong((id *)&self->_iorMessagePopulator, 0);
  objc_storeStrong((id *)&self->_messageStore, 0);
  objc_storeStrong((id *)&self->_engineQ, 0);
  objc_storeStrong((id *)&self->_processTokenToGroupTypeMap, 0);
  objc_storeStrong((id *)&self->_submitterMap, 0);
  objc_storeStrong((id *)&self->_velocityClient, 0);

  objc_storeStrong((id *)&self->_corewifi, 0);
}

@end
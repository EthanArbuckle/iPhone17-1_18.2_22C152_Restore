@interface SystemDiagnostic
+ (BOOL)_runBlock:(id)a3 withTimeout:(double)a4;
- (BOOL)_processIsTargeted:(id)a3;
- (BOOL)canDisplayTarBall;
- (BOOL)coSysdiagnoseOnly;
- (BOOL)collectWifiDextCoreFiles;
- (BOOL)deShowFeedback;
- (BOOL)didComplete;
- (BOOL)disableStreamTar;
- (BOOL)disableUIFeedback;
- (BOOL)earlyPrompt;
- (BOOL)generatePlist;
- (BOOL)isDeviceUnlockedSinceBoot;
- (BOOL)isPromptEligible;
- (BOOL)isTestingMode;
- (BOOL)logCollectionContainer:(id)a3 shouldContinueAfterEncounteringError:(id)a4 path:(id)a5;
- (BOOL)mailIsTargeted;
- (BOOL)makeOutputDirectory;
- (BOOL)makeTargetDirectory:(id)a3;
- (BOOL)prepareOutput;
- (BOOL)prepareOutputDirectory;
- (BOOL)preparePaths;
- (BOOL)previouslyRunningInstancesOfDiagnostic;
- (BOOL)quickMode;
- (BOOL)safariIsTargeted;
- (BOOL)shouldCreateTarBall;
- (BOOL)shouldDisplayTarBall;
- (BOOL)shouldGetFeedbackData;
- (BOOL)shouldPostProcess;
- (BOOL)shouldRemoveTemporaryDirectory;
- (BOOL)shouldRunIDSDump;
- (BOOL)shouldRunLogCopyTasks;
- (BOOL)shouldRunLogGenerationTasks;
- (BOOL)shouldRunOSLogArchive;
- (BOOL)shouldRunTimeSensitiveTasks;
- (BOOL)shouldRunWifiDextCoreFilesCollection;
- (BOOL)shouldStreamToTar;
- (BOOL)tconNvmDump;
- (BOOL)useParallelCompression;
- (BOOL)verbose;
- (BOOL)waitUntilComplete:(unint64_t)a3;
- (NSArray)onlyRunContainersWithNames;
- (NSArray)targetPIDs;
- (NSDate)oldestDateCreatedCutoff;
- (NSDate)startDiagnosticTime;
- (NSDictionary)capOverride;
- (NSDictionary)overrideContainers;
- (NSFileHandle)summaryHandle;
- (NSMutableArray)pidIndices;
- (NSMutableDictionary)executedContainers;
- (NSMutableDictionary)metricsDict;
- (NSNumber)totalTime;
- (NSString)archiveName;
- (NSString)baseDirectory;
- (NSString)brctl_dir;
- (NSString)changedDiagnosticProperties;
- (NSString)completedOutputDirectory;
- (NSString)completedTarballPath;
- (NSString)defaultBaseDirectory;
- (NSString)diagnosticID;
- (NSString)frontmostBundleID;
- (NSString)outputDirectory;
- (NSString)providedPIDorProcess;
- (NSString)remoteSysdiagnoseID;
- (NSString)rootPath;
- (NSString)tarballPath;
- (NSString)tmpOutputDirectory;
- (NSString)warnProcessAllowlist;
- (OS_dispatch_group)completionDispatchGroup;
- (OS_xpc_object)coSysdiagnoseParameters;
- (SDArchive)archive;
- (SystemDiagnostic)init;
- (__sFILE)summaryFD;
- (id)_copyAccessibilityPreferences;
- (id)_copyAppInstallationLogsContainer;
- (id)_copyAstroLogsContainer;
- (id)_copyBTLogsContainer;
- (id)_copyCompanionSyncContainer;
- (id)_copyCoreCaptureBTLogsContainer;
- (id)_copyHIDFWCrashLogs;
- (id)_copyHangTracerTailspinsContainer;
- (id)_copyMCLogs;
- (id)_copyMobileActivationLogsContainer;
- (id)_copyMobileAssetHistoryLogs;
- (id)_copyMobileInstallationLogsContainer;
- (id)_copyNanoPreferencesSyncLogs;
- (id)_copyOnDemandDaemonLogsContainer;
- (id)_copyParsecdBagLogs;
- (id)_copyProxiedDeviceCrashLogsContainer;
- (id)_copySentryPlistsContainer;
- (id)_copySiriAnalyticsDB;
- (id)_copySiriLogsContainer;
- (id)_copySplatVersioningLogs;
- (id)_copySplunkHistoryLogs;
- (id)_copyTCCLogs;
- (id)_copyThermalLogs;
- (id)_copyVideoProcessingLogs;
- (id)_copyWatchdogTailspins;
- (id)_copyWatchdogdDDTs;
- (id)_createTailspinContainerHelper:(id)a3 isRecent:(BOOL)a4 withSizeMB:(unint64_t)a5 forGlobsBlock:(id)a6;
- (id)_getAGXMTLCompilerCrashLogs;
- (id)_getCalendarPrefLogs;
- (id)_getCloudKitBookmarksContainer;
- (id)_getCrashesAndSpinsContainer;
- (id)_getFscklogs;
- (id)_getMapsSyncJournalContainer;
- (id)_getSocialLayerPlist;
- (id)_getSpindumpMetaContainer:(id)a3;
- (id)_iOSGetTimeSensitiveContainers;
- (id)_iOSgetLogCopyingContainers;
- (id)_iOSgetLogGenerationContainers;
- (id)_internalSpindumpContainers;
- (id)copyCoreaudioReportingLogs;
- (id)createTailspinContainer:(id)a3 withSizeMB:(unint64_t)a4 forGlobsBlock:(id)a5;
- (id)filterDiagnosticContainers:(id)a3;
- (id)getACLogsContainer;
- (id)getACMToolContainer;
- (id)getAHSToolContainer;
- (id)getAOPFirmwareStateContainer;
- (id)getASPMagazineContainer;
- (id)getASPSnapshotContainer;
- (id)getASPSnapshotsContainers;
- (id)getASPTraceContainers;
- (id)getAccessibilityPrefContainer;
- (id)getAirPlayContainer;
- (id)getAopaudctlContainer;
- (id)getApfsStatsContainer;
- (id)getAppleInternalPreferencesLogs;
- (id)getArchiveExtension;
- (id)getArkitctlContainer;
- (id)getAutogenLogCopyingContainers;
- (id)getAutogenLogGenerationContainers;
- (id)getAutogenTimeSensitiveContainers;
- (id)getBTPHYLogsContainer;
- (id)getBaseBandContainer;
- (id)getBatteryUIContainer;
- (id)getBrctlContainer;
- (id)getCADebugContainer;
- (id)getCDDebugContainer;
- (id)getCKKSCTLContainer;
- (id)getCoreCaptureSPIContainer;
- (id)getCoreDuetLogs;
- (id)getDSCSYMContainer;
- (id)getDefaultArchiveName;
- (id)getDiagnosticContainers:(int)a3;
- (id)getDiskTasksContainer;
- (id)getDisplaytoolContainer;
- (id)getEnumerateCrashReporterContainer;
- (id)getExcResourceContainer;
- (id)getExposureNotificationContainer;
- (id)getFDRDiagnosticContainer;
- (id)getFileProviderCTLContainer;
- (id)getFreezerctlContainer;
- (id)getGMSAvailabilityContainer;
- (id)getGNIContainer;
- (id)getGestaltQueryContainer;
- (id)getHIDRecorderdContainer;
- (id)getHIDReportContainers;
- (id)getHomeUtilAccessoryStateContainer;
- (id)getHomeUtilDumpAllContainer;
- (id)getIDSContainer;
- (id)getIOLogsContainer;
- (id)getIOREGContainer;
- (id)getInternalLogsContainer;
- (id)getKCSharingContainer;
- (id)getKeyboardPrefContainer;
- (id)getLGSystemInfoContainer;
- (id)getLGUtilitiesContainer;
- (id)getLibnotifyContainer;
- (id)getLibtraceContainers;
- (id)getLogCopyingContainers;
- (id)getLogGenerationContainers;
- (id)getLogStreamFilterContainer;
- (id)getLogarchiveCollectionContainer;
- (id)getLogarchiveSummaryContainer;
- (id)getMediaContainer;
- (id)getMicrostackshotsWithPostContainers;
- (id)getMultiTouchContainer;
- (id)getOTCTLContainer;
- (id)getPbctlUserprofilesContainer;
- (id)getPersonalizationLogs;
- (id)getPommesStatusContainer;
- (id)getPowerLogContainer;
- (id)getPowermetricsContainer;
- (id)getPredicateForFileTypes:(id)a3 withExcludedPrefixes:(id)a4;
- (id)getPreferencesLogs;
- (id)getProcessesInfoContainer;
- (id)getProximityContainers;
- (id)getRemotectlContainer;
- (id)getRmdContainer;
- (id)getRunningBoardLogs;
- (id)getSPIContainers;
- (id)getSWTransparencyContainer;
- (id)getSampleContainer;
- (id)getSelfCtlContainer;
- (id)getSimpleDirectoryContainer:(id)a3 withContainerName:(id)a4 andDestination:(id)a5;
- (id)getSimplePathArrayContainer:(id)a3 withContainerName:(id)a4 andDestination:(id)a5;
- (id)getSimplePathArrayContainer:(id)a3 withContainerName:(id)a4 andDestination:(id)a5 withOffsets:(id)a6 sizes:(id)a7;
- (id)getSoundAutoConfigContainer;
- (id)getSoundBoardContainer;
- (id)getSpindumpContainers;
- (id)getSpuctlContainer;
- (id)getStackshotContainer;
- (id)getStoreServicesContainer;
- (id)getStspContainer;
- (id)getSubPredicateForFileTypes:(id)a3;
- (id)getSubPredicateForPrefixes:(id)a3;
- (id)getSysCfgContainer;
- (id)getTSProcessSpecificContainers;
- (id)getTSSystemInfoContainer;
- (id)getTailspinContainers;
- (id)getThermHIDContainers;
- (id)getTimeSensitiveContainers;
- (id)getTimezoneDBLogs;
- (id)getTransparencyContainer;
- (id)getTrialRolloutsContainer;
- (id)getTriggerBasebandDumpContainer;
- (id)getUptimeContainer;
- (id)getWifiDextCorefilesContainer;
- (id)getaccountsInternalLogsContainer;
- (id)getc26ToolContainer;
- (id)getclpcContainer;
- (id)getclpcctrlContainer;
- (id)getcontrolbitsContainer;
- (id)getlaunchdAndCTSContainers;
- (id)getlaunchdContainer;
- (id)getmiscInternalLogsContainer;
- (id)getosvariantUtilContainer;
- (id)getsmcDiagnoseContainer;
- (id)getswcutilContainer;
- (id)getsysconfigInternalLogsContainer;
- (id)includeSyncedExtensionForFileTypes:(id)a3;
- (id)prepareCoSysdiagnoseParams;
- (int)dpClass;
- (int)pidForProcessName:(id)a3;
- (int)processCount;
- (int64_t)_sizeOutputDirectoryAndGenerateDiagnosticSummary;
- (int64_t)coSysdiagnose;
- (int64_t)startDiagnosticTimeClockNS;
- (proc_bsdinfo)processes;
- (unsigned)requestSource;
- (void)TSProcessSpecific_preprocess:(id)a3;
- (void)closeTaskSummaryHandle;
- (void)completeTarball;
- (void)createOnlyRunContainersWithNamesArray:(id)a3;
- (void)dealloc;
- (void)endDiagnostics;
- (void)endTaskDepotForPhase:(int)a3;
- (void)executeContainers:(id)a3 inPhase:(int)a4 withCompletionBlock:(id)a5;
- (void)executeContainersInPhase:(int)a3 withCompletionBlock:(id)a4;
- (void)executeDiagnosticContainers;
- (void)executeOSLogArchiveContainers;
- (void)filecoordination_postprocess:(id)a3 withContainerArray:(id)a4;
- (void)footprintAll_postprocess:(id)a3 withContainerArray:(id)a4;
- (void)gatherDiagnostic;
- (void)getCaseInsensitiveMatches:(id)a3 forString:(const char *)a4;
- (void)initStreaming;
- (void)logContainerAsExecuted:(id)a3 inPhase:(int)a4;
- (void)markFoldersAsComplete;
- (void)outputMetrics;
- (void)populateProcessInfoForInput;
- (void)populateProcesses;
- (void)prompt;
- (void)recordDiagnosticsMetrics:(id)a3;
- (void)run;
- (void)sendCoreAnalytics;
- (void)setArchive:(id)a3;
- (void)setArchiveName:(id)a3;
- (void)setBaseDirectory:(id)a3;
- (void)setBrctl_dir:(id)a3;
- (void)setCanDisplayTarBall:(BOOL)a3;
- (void)setCapOverride:(id)a3;
- (void)setChangedDiagnosticProperties:(id)a3;
- (void)setCoSysdiagnose:(int64_t)a3;
- (void)setCoSysdiagnoseOnly:(BOOL)a3;
- (void)setCoSysdiagnoseParameters:(id)a3;
- (void)setCollectWifiDextCoreFiles:(BOOL)a3;
- (void)setCompletedOutputDirectory:(id)a3;
- (void)setCompletedTarballPath:(id)a3;
- (void)setCompletionDispatchGroup:(id)a3;
- (void)setDeShowFeedback:(BOOL)a3;
- (void)setDiagnosticID:(id)a3;
- (void)setDidComplete:(BOOL)a3;
- (void)setDisableStreamTar:(BOOL)a3;
- (void)setDisableUIFeedback:(BOOL)a3;
- (void)setDpClass:(int)a3;
- (void)setEarlyPrompt:(BOOL)a3;
- (void)setExecutedContainers:(id)a3;
- (void)setFrontmostBundleID:(id)a3;
- (void)setGeneratePlist:(BOOL)a3;
- (void)setIsTestingMode:(BOOL)a3;
- (void)setOldestDateCreatedCutoff:(id)a3;
- (void)setOnlyRunContainersWithNames:(id)a3;
- (void)setOutputDirectory:(id)a3;
- (void)setOverrideContainers:(id)a3;
- (void)setPidIndices:(id)a3;
- (void)setProcessCount:(int)a3;
- (void)setProcesses:(proc_bsdinfo *)a3;
- (void)setProvidedPIDorProcess:(id)a3;
- (void)setQuickMode:(BOOL)a3;
- (void)setRemoteSysdiagnoseID:(id)a3;
- (void)setRequestSource:(unsigned __int16)a3;
- (void)setRootPath:(id)a3;
- (void)setShouldCreateTarBall:(BOOL)a3;
- (void)setShouldDisplayTarBall:(BOOL)a3;
- (void)setShouldGetFeedbackData:(BOOL)a3;
- (void)setShouldPostProcess:(BOOL)a3;
- (void)setShouldRemoveTemporaryDirectory:(BOOL)a3;
- (void)setShouldRunIDSDump:(BOOL)a3;
- (void)setShouldRunLogCopyTasks:(BOOL)a3;
- (void)setShouldRunLogGenerationTasks:(BOOL)a3;
- (void)setShouldRunOSLogArchive:(BOOL)a3;
- (void)setShouldRunTimeSensitiveTasks:(BOOL)a3;
- (void)setShouldStreamToTar:(BOOL)a3;
- (void)setSkipBTLogs;
- (void)setStartDiagnosticTime:(id)a3;
- (void)setStartDiagnosticTimeClockNS:(int64_t)a3;
- (void)setSummaryFD:(__sFILE *)a3;
- (void)setSummaryHandle:(id)a3;
- (void)setTarballPath:(id)a3;
- (void)setTargetPIDs:(id)a3;
- (void)setTconNvmDump:(BOOL)a3;
- (void)setTmpOutputDirectory:(id)a3;
- (void)setTotalTime:(id)a3;
- (void)setUseParallelCompression:(BOOL)a3;
- (void)setVerbose:(BOOL)a3;
- (void)setWarnProcessAllowlist:(id)a3;
- (void)setupTaskDepotForPhase:(int)a3;
- (void)streamArchiveFile:(id)a3;
- (void)summarizeErrorsAcrossSDTasks:(id)a3;
- (void)summarizeErrorsForExecutedContainers;
- (void)summarizeErrorsWithinSDTask:(id)a3;
- (void)systemInfoTimeSensitive_postprocess:(id)a3 withContainerArray:(id)a4;
- (void)waitAndCollectAirPodLogs;
- (void)waitForRemoteLogs;
- (void)writeReportForTasks:(id)a3 withTimeout:(double)a4 concurrently:(BOOL)a5 withDepotName:(id)a6;
@end

@implementation SystemDiagnostic

- (id)getAutogenTimeSensitiveContainers
{
  v3 = +[NSMutableArray array];
  v4 = +[SDTask taskWithCommand:@"/usr/bin/ltop" arguments:0 outputFile:@"ltop.txt"];
  v11 = v4;
  v5 = +[NSArray arrayWithObjects:&v11 count:1];

  v6 = +[SDComplexContainer complexContainerWithTasks:v5 withTimeout:&__NSArray0__struct withRules:0 atDestination:self withDelegate:1 isConcurrent:10.0];
  v7 = v6;
  if (v6)
  {
    v8 = [v6 taskContainer];
    [v8 setName:@"utilities-timeSensitive-embedded"];

    [v7 setRuntimeChecks:32];
    v9 = [v7 collectionContainer];
    [v9 setMaximumSizeMB:25];

    [v3 addObject:v7];
  }

  return v3;
}

- (id)getAutogenLogGenerationContainers
{
  v3 = +[NSMutableArray array];
  v4 = +[SDTaskDepotContainer containerWithName:@"SEP Util" destination:0 withTimeout:1 withConcurrency:self withDelegate:5.0];
  v5 = v4;
  if (v4)
  {
    [v4 setRuntimeChecks:17];
    v6 = +[SDTask taskWithCommand:@"/usr/libexec/seputil" arguments:&off_1000AFDF8 outputFile:@"sep_util.log"];
    v205 = v6;
    v7 = +[NSArray arrayWithObjects:&v205 count:1];
    [v5 addSDTasksToContainer:v7];

    [v3 addObject:v5];
  }

  v8 = +[SDComplexContainer complexContainerWithSPITask:36 withTimeout:@"logs/ProactiveInputPredictions" atDestination:self withDelegate:5.0];
  v9 = v8;
  if (v8)
  {
    [v8 setRuntimeChecks:16];
    [v3 addObject:v9];
  }

  v10 = +[SDTaskDepotContainer containerWithName:@"umtool" destination:@"logs/UserManagement" withTimeout:1 withConcurrency:self withDelegate:5.0];
  v11 = v10;
  if (v10)
  {
    [v10 setRuntimeChecks:16];
    v12 = +[SDTask taskWithCommand:@"/usr/bin/umtool" arguments:&off_1000AFE10 outputFile:@"umtool.txt"];
    v204 = v12;
    v13 = +[NSArray arrayWithObjects:&v204 count:1];
    [v11 addSDTasksToContainer:v13];

    [v3 addObject:v11];
  }

  v14 = +[SDTaskDepotContainer containerWithName:@"testIOMFBGPO" destination:@"logs" withTimeout:1 withConcurrency:self withDelegate:1.0];
  v15 = v14;
  if (v14)
  {
    [v14 setRuntimeChecks:17];
    v16 = +[SDTask taskWithCommand:@"/usr/local/bin/testIOMFBGPO" arguments:0 outputFile:@"testIOMFBGPO.txt"];
    v203 = v16;
    v17 = +[NSArray arrayWithObjects:&v203 count:1];
    [v15 addSDTasksToContainer:v17];

    [v3 addObject:v15];
  }

  v18 = +[SDTask taskWithCommand:@"/usr/bin/afktool" arguments:&off_1000AFE28 outputFile:0];
  v202 = v18;
  v19 = +[NSArray arrayWithObjects:&v202 count:1];

  v20 = +[SDComplexContainer complexContainerWithTasks:v19 withTimeout:&__NSArray0__struct withRules:@"logs/AFK" atDestination:self withDelegate:1 isConcurrent:5.0];
  v21 = v20;
  if (v20)
  {
    v22 = [v20 taskContainer];
    [v22 setName:@"AFK"];

    [v21 setRuntimeChecks:16];
    [v3 addObject:v21];
  }

  v23 = +[SDComplexContainer complexContainerWithSPITask:9 withTimeout:@"logs/BatteryHealth" atDestination:self withDelegate:5.0];
  v24 = v23;
  if (v23)
  {
    [v23 setRuntimeChecks:16];
    [v3 addObject:v24];
  }

  v25 = +[SDTaskDepotContainer containerWithName:@"AMSToolCookieExports" destination:@"logs/AMSTool" withTimeout:1 withConcurrency:self withDelegate:2.0];
  v26 = v25;
  if (v25)
  {
    [v25 setRuntimeChecks:17];
    v27 = +[SDTask taskWithCommand:@"/usr/local/bin/amstool" arguments:&off_1000AFE40 outputFile:@"amstool_cookies_list.txt"];
    v201 = v27;
    v28 = +[NSArray arrayWithObjects:&v201 count:1];
    [v26 addSDTasksToContainer:v28];

    [v3 addObject:v26];
  }

  v29 = +[SDComplexContainer complexContainerWithSPITask:28 withTimeout:@"crashes_and_spins/MemoryExceptions" atDestination:self withDelegate:5.0];
  v30 = v29;
  if (v29)
  {
    [v29 setRuntimeChecks:16];
    v31 = [v30 collectionContainer];
    [v31 setMaximumSizeMB:45];

    [v3 addObject:v30];
  }

  v32 = +[SDTaskDepotContainer containerWithName:@"usbctl" destination:@"logs/usbctl" withTimeout:1 withConcurrency:self withDelegate:1.0];
  v33 = v32;
  if (v32)
  {
    [v32 setRuntimeChecks:17];
    v34 = +[SDTask taskWithCommand:@"/usr/local/bin/usbctl" arguments:&off_1000AFE58 outputFile:@"usbctl_list.txt"];
    v200 = v34;
    v35 = +[NSArray arrayWithObjects:&v200 count:1];
    [v33 addSDTasksToContainer:v35];

    [v3 addObject:v33];
  }

  v36 = +[SDTaskDepotContainer containerWithName:@"assistantd state dump" destination:@"logs/assistantd" withTimeout:1 withConcurrency:self withDelegate:1.0];
  v37 = v36;
  if (v36)
  {
    [v36 setRuntimeChecks:17];
    v38 = +[SDTask taskWithCommand:@"/usr/local/bin/assistant_tool" arguments:&off_1000AFE70 outputFile:@"assistant_tool_dump_state.txt"];
    v199 = v38;
    v39 = +[NSArray arrayWithObjects:&v199 count:1];
    [v37 addSDTasksToContainer:v39];

    [v3 addObject:v37];
  }

  v40 = +[SDComplexContainer complexContainerWithSPITask:54 withTimeout:@"logs/UnifiedAsset" atDestination:self withDelegate:2.0];
  v41 = v40;
  if (v40)
  {
    [v40 setRuntimeChecks:16];
    v42 = [v41 collectionContainer];
    [v42 setMaximumSizeMB:1];

    [v3 addObject:v41];
  }

  v43 = +[SDComplexContainer complexContainerWithSPITask:29 withTimeout:@"crashes_and_spins/MemoryExceptions" atDestination:self withDelegate:2.0];
  v44 = v43;
  if (v43)
  {
    [v43 setRuntimeChecks:16];
    v45 = [v44 collectionContainer];
    [v45 setMaximumSizeMB:1];

    [v3 addObject:v44];
  }

  v46 = +[SDTaskDepotContainer containerWithName:@"benchrun_validate" destination:@"logs/benchrun" withTimeout:1 withConcurrency:self withDelegate:2.0];
  v47 = v46;
  if (v46)
  {
    [v46 setRuntimeChecks:17];
    v48 = +[SDTask taskWithCommand:@"/usr/local/bin/benchrun" arguments:&off_1000AFE88 outputFile:@"benchrun_validate.txt"];
    v198 = v48;
    v49 = +[NSArray arrayWithObjects:&v198 count:1];
    [v47 addSDTasksToContainer:v49];

    [v3 addObject:v47];
  }

  v50 = +[SDTaskDepotContainer containerWithName:@"pmudiagnose" destination:@"logs/pmudiagnose" withTimeout:1 withConcurrency:self withDelegate:2.0];
  v51 = v50;
  if (v50)
  {
    [v50 setRuntimeChecks:16];
    v52 = +[SDTask taskWithCommand:@"/usr/libexec/pmudiagnose/pmudiagnose" arguments:0 outputFile:@"pmudiagnose.txt"];
    v197 = v52;
    v53 = +[NSArray arrayWithObjects:&v197 count:1];
    [v51 addSDTasksToContainer:v53];

    [v3 addObject:v51];
  }

  v54 = +[SDTaskDepotContainer containerWithName:@"IOSADiagnose" destination:@"logs/IOSADiagnose" withTimeout:1 withConcurrency:self withDelegate:5.0];
  v55 = v54;
  if (v54)
  {
    [v54 setRuntimeChecks:16];
    v56 = +[SDTask taskWithCommand:@"/System/Library/PrivateFrameworks/IOSurfaceAccelerator.framework/Resources/IOSADiagnose" arguments:0 outputFile:@"IOSADiagnose.log"];
    v196 = v56;
    v57 = +[NSArray arrayWithObjects:&v196 count:1];
    [v55 addSDTasksToContainer:v57];

    [v3 addObject:v55];
  }

  v58 = +[SDTaskDepotContainer containerWithName:@"IOPowerSources" destination:@"logs/IOPowerSources" withTimeout:1 withConcurrency:self withDelegate:1.0];
  v59 = v58;
  if (v58)
  {
    [v58 setRuntimeChecks:17];
    v60 = +[SDTask taskWithCommand:@"/usr/local/bin/iopsutil" arguments:&off_1000AFEA0 outputFile:@"iopsutil-all-dump.txt"];
    v195 = v60;
    v61 = +[NSArray arrayWithObjects:&v195 count:1];
    [v59 addSDTasksToContainer:v61];

    [v3 addObject:v59];
  }

  v62 = +[SDTaskDepotContainer containerWithName:@"CoreAnalytics" destination:@"logs/CoreAnalytics" withTimeout:1 withConcurrency:self withDelegate:1.0];
  v63 = v62;
  if (v62)
  {
    [v62 setRuntimeChecks:17];
    v64 = +[SDTask taskWithCommand:@"/usr/local/bin/analytics_tool" arguments:&off_1000AFEB8 outputFile:@"analytics_transform_counts.txt"];
    v194 = v64;
    v65 = +[NSArray arrayWithObjects:&v194 count:1];
    [v63 addSDTasksToContainer:v65];

    [v3 addObject:v63];
  }

  v66 = +[SDTaskDepotContainer containerWithName:@"cryptexctl" destination:@"logs/libcryptex" withTimeout:1 withConcurrency:self withDelegate:2.0];
  v67 = v66;
  if (v66)
  {
    [v66 setRuntimeChecks:16];
    v68 = +[SDTask taskWithCommand:@"/usr/bin/cryptexctl" arguments:&off_1000AFED0 outputFile:@"cryptexctl-dumpstate.txt"];
    v193 = v68;
    v69 = +[NSArray arrayWithObjects:&v193 count:1];
    [v67 addSDTasksToContainer:v69];

    [v3 addObject:v67];
  }

  v70 = +[SDComplexContainer complexContainerWithSPITask:55 withTimeout:@"logs/IntelligencePlatform" atDestination:self withDelegate:2.0];
  v71 = v70;
  if (v70)
  {
    [v70 setRuntimeChecks:17];
    v72 = [v71 collectionContainer];
    [v72 setMaximumSizeMB:1];

    [v3 addObject:v71];
  }

  v73 = +[SDTaskDepotContainer containerWithName:@"profilectl" destination:@"logs" withTimeout:1 withConcurrency:self withDelegate:5.0];
  v74 = v73;
  if (v73)
  {
    [v73 setRuntimeChecks:17];
    v75 = +[SDTask taskWithCommand:@"/usr/local/bin/profilectl" arguments:&off_1000AFEE8 outputFile:@"profilectl_list.txt"];
    v192 = v75;
    v76 = +[NSArray arrayWithObjects:&v192 count:1];
    [v74 addSDTasksToContainer:v76];

    [v3 addObject:v74];
  }

  v77 = +[SDTaskDepotContainer containerWithName:@"dastool" destination:0 withTimeout:1 withConcurrency:self withDelegate:5.0];
  v78 = v77;
  if (v77)
  {
    [v77 setRuntimeChecks:17];
    v79 = +[SDTask taskWithCommand:@"/usr/local/bin/dastool" arguments:&off_1000AFF00 outputFile:@"dastool.txt"];
    v191[0] = v79;
    v80 = +[SDTask taskWithCommand:@"/usr/local/bin/dastool" arguments:&off_1000AFF18 outputFile:@"dastool_evaluate_all_activities.txt"];
    v191[1] = v80;
    v81 = +[NSArray arrayWithObjects:v191 count:2];
    [v78 addSDTasksToContainer:v81];

    [v3 addObject:v78];
  }

  v82 = +[SDTask taskWithCommand:@"/usr/libexec/atcrtcomm" arguments:&off_1000AFF30 outputFile:@"atcrtcomm.txt"];
  v190 = v82;
  v83 = +[NSArray arrayWithObjects:&v190 count:1];

  v84 = +[SDComplexContainer complexContainerWithTasks:v83 withTimeout:&__NSArray0__struct withRules:@"logs/atcrtcomm" atDestination:self withDelegate:1 isConcurrent:5.0];
  v85 = v84;
  if (v84)
  {
    v86 = [v84 taskContainer];
    [v86 setName:@"AppleTypeCRetimerLogs"];

    [v85 setRuntimeChecks:16];
    v87 = [v85 collectionContainer];
    [v87 setMaximumSizeMB:1];

    [v3 addObject:v85];
  }

  v88 = +[SDTaskDepotContainer containerWithName:@"suggestToolTasks" destination:@"logs/suggest_tool" withTimeout:0 withConcurrency:self withDelegate:10.0];
  v89 = v88;
  if (v88)
  {
    [v88 setRuntimeChecks:16];
    v90 = +[SDTask taskWithCommand:@"/System/Library/PrivateFrameworks/CoreSuggestions.framework/Tools/suggest_tool" arguments:&off_1000AFF48 outputFile:@"dbStats.txt"];
    v189[0] = v90;
    v91 = +[SDTask taskWithCommand:@"/System/Library/PrivateFrameworks/CoreSuggestions.framework/Tools/suggest_tool" arguments:&off_1000AFF60 outputFile:@"fileSystemMetadata.txt"];
    v189[1] = v91;
    v92 = +[SDTask taskWithCommand:@"/System/Library/PrivateFrameworks/CoreSuggestions.framework/Tools/suggest_tool" arguments:&off_1000AFF78 outputFile:@"dbSchema.txt"];
    v189[2] = v92;
    +[SDTask taskWithCommand:@"/System/Library/PrivateFrameworks/CoreSuggestions.framework/Tools/suggest_tool" arguments:&off_1000AFF90 outputFile:@"assetVersion.txt"];
    v93 = v176 = v3;
    v189[3] = v93;
    v94 = +[SDTask taskWithCommand:@"/System/Library/PrivateFrameworks/CoreSuggestions.framework/Tools/suggest_tool" arguments:&off_1000AFFA8 outputFile:@"DictionaryExtractions.txt"];
    v189[4] = v94;
    v95 = +[SDTask taskWithCommand:@"/System/Library/PrivateFrameworks/CoreSuggestions.framework/Tools/suggest_tool" arguments:&off_1000AFFC0 outputFile:@"DictionaryInteractions.txt"];
    v189[5] = v95;
    v96 = +[SDTask taskWithCommand:@"/System/Library/PrivateFrameworks/CoreSuggestions.framework/Tools/suggest_tool" arguments:&off_1000AFFD8 outputFile:@"DictionaryInteractionsSummary.txt"];
    v189[6] = v96;
    v97 = +[NSArray arrayWithObjects:v189 count:7];
    [v89 addSDTasksToContainer:v97];

    v3 = v176;
    [v176 addObject:v89];
  }

  v98 = +[SDTaskDepotContainer containerWithName:@"diagpipectl" destination:@"logs/diagpipectl" withTimeout:1 withConcurrency:self withDelegate:5.0];
  v99 = v98;
  if (v98)
  {
    [v98 setRuntimeChecks:17];
    v100 = +[SDTask taskWithCommand:@"/usr/local/bin/diagpipectl" arguments:&off_1000AFFF0 outputFile:@"diagpipectl.txt"];
    v188 = v100;
    v101 = +[NSArray arrayWithObjects:&v188 count:1];
    [v99 addSDTasksToContainer:v101];

    [v3 addObject:v99];
  }

  v102 = +[SDTask taskWithCommand:@"/System/Library/Frameworks/SensorKit.framework/Support/srsupporttool" arguments:&off_1000B0008 outputFile:@"errors/srsupport_tool_errors.txt"];
  v187 = v102;
  v103 = +[NSArray arrayWithObjects:&v187 count:1];

  v104 = +[SDComplexContainer complexContainerWithTasks:v103 withTimeout:&__NSArray0__struct withRules:@"logs/SensorKit" atDestination:self withDelegate:1 isConcurrent:5.0];
  v105 = v104;
  if (v104)
  {
    v106 = [v104 taskContainer];
    [v106 setName:@"SensorKit"];

    [v105 setRuntimeChecks:16];
    [v3 addObject:v105];
  }

  v107 = +[SDTaskDepotContainer containerWithName:@"ppmctrl" destination:@"logs/ppmctrl" withTimeout:1 withConcurrency:self withDelegate:1.0];
  v108 = v107;
  if (v107)
  {
    [v107 setRuntimeChecks:17];
    v109 = +[SDTask taskWithCommand:@"/usr/local/bin/ppmctrl" arguments:&off_1000B0020 outputFile:@"ppmctrl_getClientState.txt"];
    v186 = v109;
    v110 = +[NSArray arrayWithObjects:&v186 count:1];
    [v108 addSDTasksToContainer:v110];

    [v3 addObject:v108];
  }

  v111 = +[SDTaskDepotContainer containerWithName:@"nightshift" destination:0 withTimeout:1 withConcurrency:self withDelegate:5.0];
  v112 = v111;
  if (v111)
  {
    [v111 setRuntimeChecks:16];
    v113 = +[SDTask taskWithCommand:@"/usr/libexec/corebrightnessdiag" arguments:&off_1000B0038 outputFile:@"night-shift.log"];
    v185 = v113;
    v114 = +[NSArray arrayWithObjects:&v185 count:1];
    [v112 addSDTasksToContainer:v114];

    [v3 addObject:v112];
  }

  v115 = +[SDComplexContainer complexContainerWithSPITask:16 withTimeout:@"logs/CoreRepair" atDestination:self withDelegate:5.0];
  v116 = v115;
  if (v115)
  {
    [v115 setRuntimeChecks:17];
    v117 = [v116 collectionContainer];
    [v117 setMaximumSizeMB:1];

    [v3 addObject:v116];
  }

  v118 = +[SDComplexContainer complexContainerWithSPITask:31 withTimeout:@"logs/OSEligibility" atDestination:self withDelegate:2.0];
  v119 = v118;
  if (v118)
  {
    [v118 setRuntimeChecks:16];
    v120 = [v119 collectionContainer];
    [v120 setMaximumSizeMB:1];

    [v3 addObject:v119];
  }

  v121 = +[SDTaskDepotContainer containerWithName:@"ffctl" destination:0 withTimeout:1 withConcurrency:self withDelegate:5.0];
  v122 = v121;
  if (v121)
  {
    [v121 setRuntimeChecks:17];
    v123 = +[SDTask taskWithCommand:@"/usr/local/bin/ffctl" arguments:&off_1000B0050 outputFile:@"ffctl.json"];
    v184[0] = v123;
    v124 = +[SDTask taskWithCommand:@"/usr/local/bin/ffctl" arguments:&off_1000B0068 outputFile:@"ffctl.txt"];
    v184[1] = v124;
    v125 = +[SDTask taskWithCommand:@"/usr/local/bin/ffctl" arguments:&off_1000B0080 outputFile:@"ffctl_changed.txt"];
    v184[2] = v125;
    v126 = +[SDTask taskWithCommand:@"/usr/local/bin/ffctl" arguments:&off_1000B0098 outputFile:@"ffctl_featureset_list.txt"];
    v184[3] = v126;
    v127 = +[NSArray arrayWithObjects:v184 count:4];
    [v122 addSDTasksToContainer:v127];

    [v3 addObject:v122];
  }

  v128 = +[SDTaskDepotContainer containerWithName:@"ModelManager" destination:@"logs/ModelManager" withTimeout:1 withConcurrency:self withDelegate:2.0];
  v129 = v128;
  if (v128)
  {
    [v128 setRuntimeChecks:16];
    v130 = +[SDTask taskWithCommand:@"/usr/bin/modelmanagerdump" arguments:0 outputFile:@"model_manager_dump.json"];
    v183 = v130;
    v131 = +[NSArray arrayWithObjects:&v183 count:1];
    [v129 addSDTasksToContainer:v131];

    [v3 addObject:v129];
  }

  v132 = +[SDComplexContainer complexContainerWithSPITask:12 withTimeout:@"Preferences" atDestination:self withDelegate:1.0];
  v133 = v132;
  if (v132)
  {
    [v132 setRuntimeChecks:17];
    v134 = [v133 collectionContainer];
    [v134 setMaximumSizeMB:1];

    [v3 addObject:v133];
  }

  v135 = +[SDComplexContainer complexContainerWithSPITask:8 withTimeout:@"logs/powerlogs" atDestination:self withDelegate:2.0];
  v136 = v135;
  if (v135)
  {
    [v135 setRuntimeChecks:16];
    [v3 addObject:v136];
  }

  v137 = +[SDComplexContainer complexContainerWithSPITask:25 withTimeout:@"logs/HIDCrashlogs" atDestination:self withDelegate:5.0];
  v138 = v137;
  if (v137)
  {
    [v137 setRuntimeChecks:16];
    [v3 addObject:v138];
  }

  v139 = +[SDComplexContainer complexContainerWithSPITask:61 withTimeout:@"logs/Siri/Enrollment" atDestination:self withDelegate:2.0];
  v140 = v139;
  if (v139)
  {
    [v139 setRuntimeChecks:16];
    v141 = [v140 collectionContainer];
    [v141 setMaximumSizeMB:3];

    [v3 addObject:v140];
  }

  v142 = +[SDTaskDepotContainer containerWithName:@"agx_util" destination:0 withTimeout:1 withConcurrency:self withDelegate:5.0];
  v143 = v142;
  if (v142)
  {
    [v142 setRuntimeChecks:17];
    v144 = +[SDTask taskWithCommand:@"/usr/local/bin/agx_util" arguments:&off_1000B00B0 outputFile:@"agx_util.txt"];
    v182[0] = v144;
    v145 = +[SDTask taskWithCommand:@"/usr/local/bin/agx_util" arguments:&off_1000B00C8 outputFile:@"agx_diagnosis_report.txt"];
    v182[1] = v145;
    v146 = +[NSArray arrayWithObjects:v182 count:2];
    [v143 addSDTasksToContainer:v146];

    [v3 addObject:v143];
  }

  v147 = +[SDTaskDepotContainer containerWithName:@"ModelCatalog" destination:@"logs/ModelCatalog" withTimeout:1 withConcurrency:self withDelegate:2.0];
  v148 = v147;
  if (v147)
  {
    [v147 setRuntimeChecks:16];
    v149 = +[SDTask taskWithCommand:@"/usr/bin/modelcatalogdump" arguments:0 outputFile:@"model_catalog_dump.txt"];
    v181 = v149;
    v150 = +[NSArray arrayWithObjects:&v181 count:1];
    [v148 addSDTasksToContainer:v150];

    [v3 addObject:v148];
  }

  v151 = +[SDTaskDepotContainer containerWithName:@"CloudSubscriptionFeatures" destination:@"logs/CloudSubscriptionFeatures" withTimeout:1 withConcurrency:self withDelegate:2.0];
  v152 = v151;
  if (v151)
  {
    [v151 setRuntimeChecks:16];
    v153 = +[SDTask taskWithCommand:@"/usr/bin/csfdiagnose" arguments:&off_1000B00E0 outputFile:@"csfdiagnose.json"];
    v180 = v153;
    v154 = +[NSArray arrayWithObjects:&v180 count:1];
    [v152 addSDTasksToContainer:v154];

    [v3 addObject:v152];
  }

  v155 = +[SDComplexContainer complexContainerWithSPITask:23 withTimeout:@"logs/GenerativeExperiences" atDestination:self withDelegate:3.0];
  v156 = v155;
  if (v155)
  {
    [v155 setRuntimeChecks:16];
    v157 = [v156 collectionContainer];
    [v157 setMaximumSizeMB:1];

    [v3 addObject:v156];
  }

  v158 = +[SDTaskDepotContainer containerWithName:@"ProtectedApps" destination:@"logs/ProtectedApps" withTimeout:1 withConcurrency:self withDelegate:1.0];
  v159 = v158;
  if (v158)
  {
    [v158 setRuntimeChecks:16];
    v160 = +[SDTask taskWithCommand:@"/usr/bin/appprotectiondiagnose" arguments:&off_1000B00F8 outputFile:@"appprotectiondiagnose_diagnostics.json"];
    v179 = v160;
    v161 = +[NSArray arrayWithObjects:&v179 count:1];
    [v159 addSDTasksToContainer:v161];

    [v3 addObject:v159];
  }

  v162 = +[SDTask taskWithCommand:@"/usr/bin/IOAccelMemory" arguments:&off_1000B0110 outputFile:@"IOAccelMemory.txt"];
  v178 = v162;
  v163 = +[NSArray arrayWithObjects:&v178 count:1];

  v164 = +[SDComplexContainer complexContainerWithTasks:v163 withTimeout:&__NSArray0__struct withRules:@"logs/IOAccelMemory" atDestination:self withDelegate:1 isConcurrent:5.0];
  v165 = v164;
  if (v164)
  {
    v166 = [v164 taskContainer];
    [v166 setName:@"IOAccelMemory"];

    [v165 setRuntimeChecks:17];
    v167 = [v165 collectionContainer];
    [v167 setMaximumSizeMB:2];

    [v3 addObject:v165];
  }

  v168 = +[SDTask taskWithCommand:@"/usr/local/bin/search_diagnose.sh" arguments:&off_1000B0128 outputFile:@"errors/search_diagnose.txt"];
  v177 = v168;
  v169 = +[NSArray arrayWithObjects:&v177 count:1];

  v170 = +[SDComplexContainer complexContainerWithTasks:v169 withTimeout:&__NSArray0__struct withRules:@"logs/SearchDiagnose" atDestination:self withDelegate:1 isConcurrent:1.0];
  v171 = v170;
  if (v170)
  {
    v172 = [v170 taskContainer];
    [v172 setName:@"SearchDiagnose"];

    [v171 setRuntimeChecks:17];
    v173 = [v171 collectionContainer];
    [v173 setMaximumSizeMB:4];

    [v3 addObject:v171];
  }

  id v174 = v3;
  return v174;
}

- (id)getAutogenLogCopyingContainers
{
  v3 = +[NSMutableArray array];
  v4 = +[SDLogCollectionContainer containerWithName:@"MSU" destination:@"logs/MSU" withDelegate:self];
  v5 = v4;
  if (v4)
  {
    [v4 setRuntimeChecks:8];
    v6 = +[SDUnitLogPathArray logRuleWithPaths:&off_1000B0140];
    v416 = v6;
    v7 = +[NSArray arrayWithObjects:&v416 count:1];
    [v5 addRules:v7];

    [v3 addObject:v5];
  }

  v8 = +[SDLogCollectionContainer containerWithName:@"Mobile Demo" destination:@"logs/MobileDemo" withDelegate:self];
  v9 = v8;
  if (v8)
  {
    [v8 setRuntimeChecks:8];
    v10 = +[SDUnitLogGlob logRuleWithGlob:@"/private/var/logs/MobileDemo/*.log"];
    v415 = v10;
    v11 = +[NSArray arrayWithObjects:&v415 count:1];
    [v9 addRules:v11];

    [v3 addObject:v9];
  }

  v12 = +[SDLogCollectionContainer containerWithName:@"UARP Packet Capture" destination:@"logs" withDelegate:self];
  v13 = v12;
  if (v12)
  {
    [v12 setRuntimeChecks:9];
    v14 = +[SDUnitLogGlob logRuleWithGlob:@"/private/var/tmp/com.apple.locationd/hawkeyeUARPPacketCapture.pcap"];
    v414 = v14;
    v15 = +[NSArray arrayWithObjects:&v414 count:1];
    [v13 addRules:v15];

    [v3 addObject:v13];
  }

  v16 = +[SDLogCollectionContainer containerWithName:@"MobileKeybagLogs" destination:@"logs/MobileKeybag" withDelegate:self];
  v17 = v16;
  if (v16)
  {
    [v16 setRuntimeChecks:9];
    v18 = +[SDUnitLogGlob logRuleWithGlob:@"/private/var/logs/keybagd.log.*"];
    v413 = v18;
    v19 = +[NSArray arrayWithObjects:&v413 count:1];
    [v17 addRules:v19];

    [v3 addObject:v17];
  }

  v20 = +[SDLogCollectionContainer containerWithName:@"usermanagerd logs" destination:@"logs/UserManagement" withDelegate:self];
  v21 = v20;
  if (v20)
  {
    [v20 setRuntimeChecks:8];
    v22 = +[SDUnitLogGlob logRuleWithGlob:@"/private/var/logs/usermanagerd*.log*"];
    v412 = v22;
    v23 = +[NSArray arrayWithObjects:&v412 count:1];
    [v21 addRules:v23];

    [v3 addObject:v21];
  }

  v24 = +[SDLogCollectionContainer containerWithName:@"MailErrorConditions" destination:@"logs/MailErrorConditions" withDelegate:self];
  v25 = v24;
  if (v24)
  {
    [v24 setRuntimeChecks:9];
    [v25 setMaximumSizeMB:30];
    v26 = +[SDUnitLogGlob logRuleWithGlob:@"/private/var/mobile/Library/Logs/CrashReporter/DiagnosticLogs/CoreAnimation/mailspin*tailspin"];
    v411 = v26;
    v27 = +[NSArray arrayWithObjects:&v411 count:1];
    [v25 addRules:v27];

    [v3 addObject:v25];
  }

  v28 = +[SDLogCollectionContainer containerWithName:@"keyboard cache" destination:@"logs/keyboards" withDelegate:self];
  v29 = v28;
  if (v28)
  {
    [v28 setRuntimeChecks:8];
    v30 = +[SDUnitLogPathArray logRuleWithPaths:&off_1000B0158];
    v410 = v30;
    v31 = +[NSArray arrayWithObjects:&v410 count:1];
    [v29 addRules:v31];

    [v3 addObject:v29];
  }

  v32 = +[SDLogCollectionContainer containerWithName:@"BatteryBDC" destination:@"logs/BatteryBDC" withDelegate:self];
  v33 = v32;
  if (v32)
  {
    [v32 setRuntimeChecks:8];
    [v33 setMaximumSizeMB:13];
    v34 = +[SDUnitLogPathArray logRuleWithPaths:&off_1000B0170];
    v409[0] = v34;
    v35 = +[SDUnitLogDirectory logRuleWithDirectory:@"/private/var/db/Battery/BDC"];
    v409[1] = v35;
    v36 = +[NSArray arrayWithObjects:v409 count:2];
    [v33 addRules:v36];

    [v3 addObject:v33];
  }

  v37 = +[SDLogCollectionContainer containerWithName:@"AppSupport" destination:@"logs/AppSupport" withDelegate:self];
  v38 = v37;
  if (v37)
  {
    [v37 setRuntimeChecks:8];
    v39 = +[SDUnitLogPathArray logRuleWithPaths:&off_1000B0188];
    v408 = v39;
    v40 = +[NSArray arrayWithObjects:&v408 count:1];
    [v38 addRules:v40];

    [v3 addObject:v38];
  }

  v41 = +[SDLogCollectionContainer containerWithName:@"MediaserverdBlockageTailspins" destination:@"logs/mediaserverd" withDelegate:self];
  v42 = v41;
  if (v41)
  {
    [v41 setRuntimeChecks:9];
    [v42 setMaximumSizeMB:25];
    v43 = [(SystemDiagnostic *)self startDiagnosticTime];
    v44 = [v43 dateByAddingTimeInterval:-21600.0];
    v45 = +[SDUnitLogGlob logRuleWithGlob:@"/private/var/mobile/Library/Logs/CrashReporter/{mediaserverd,mediaparserd,audiomxd,mediaplaybackd,videocodecd,cameracaptured,deferredmediad,airplayd,avconferenced}_blockage_*.tailspin" withDate:v44 withFilter:0 newestFileCount:1 atInternalDirectory:0 withRuntimeChecks:1];
    v407 = v45;
    v46 = +[NSArray arrayWithObjects:&v407 count:1];
    [v42 addRules:v46];

    [v3 addObject:v42];
  }

  v47 = +[SDLogCollectionContainer containerWithName:@"AVConference" destination:@"logs/AVConference" withDelegate:self];
  v48 = v47;
  if (v47)
  {
    [v47 setRuntimeChecks:8];
    v49 = +[SDUnitLogDirectory logRuleWithDirectory:@"/private/var/mobile/Library/Caches/com.apple.VideoConference/logs/"];
    v406 = v49;
    v50 = +[NSArray arrayWithObjects:&v406 count:1];
    [v48 addRules:v50];

    [v3 addObject:v48];
  }

  v51 = +[SDLogCollectionContainer containerWithName:@"avconferenced-embedded" destination:@"logs/AVConference" withDelegate:self];
  v52 = v51;
  if (v51)
  {
    [v51 setRuntimeChecks:9];
    v53 = +[SDUnitLogGlob logRuleWithGlob:@"/private/var/mobile/Library/Logs/CrashReporter/avconferenced.*.spindump.txt.gz"];
    v405 = v53;
    v54 = +[NSArray arrayWithObjects:&v405 count:1];
    [v52 addRules:v54];

    [v3 addObject:v52];
  }

  v55 = +[SDLogCollectionContainer containerWithName:@"NSURLSession logs" destination:@"logs/NSURLSessiond" withDelegate:self];
  v56 = v55;
  if (v55)
  {
    [v55 setRuntimeChecks:9];
    v57 = +[SDUnitLogDirectory logRuleWithDirectory:@"/private/var/mobile/Library/Logs/CrashReporter/DiagnosticLogs/com.apple.nsurlsessiond"];
    v404 = v57;
    v58 = +[NSArray arrayWithObjects:&v404 count:1];
    [v56 addRules:v58];

    [v3 addObject:v56];
  }

  v59 = +[SDLogCollectionContainer containerWithName:@"CMCaptureTailspins" destination:@"logs/CMCaptureTailspins" withDelegate:self];
  v60 = v59;
  if (v59)
  {
    [v59 setRuntimeChecks:9];
    v61 = +[SDUnitLogDirectory logRuleWithDirectory:@"/private/var/tmp/CMCaptureTailspins"];
    v403 = v61;
    v62 = +[NSArray arrayWithObjects:&v403 count:1];
    [v60 addRules:v62];

    [v3 addObject:v60];
  }

  v63 = +[SDLogCollectionContainer containerWithName:@"Panics" destination:@"crashes_and_spins/Panics" withDelegate:self];
  v64 = v63;
  if (v63)
  {
    [v63 setRuntimeChecks:8];
    v65 = +[SDUnitLogGlob logRuleWithGlob:@"/private/var/mobile/Library/Logs/CrashReporter/panic-*.ips"];
    v402[0] = v65;
    v66 = +[SDUnitLogGlob logRuleWithGlob:@"/private/var/mobile/Library/Logs/CrashReporter/Retired/panic-*.ips"];
    v402[1] = v66;
    v67 = +[NSArray arrayWithObjects:v402 count:2];
    [v64 addRules:v67];

    [v3 addObject:v64];
  }

  v68 = +[SDLogCollectionContainer containerWithName:@"stackshots" destination:@"crashes_and_spins" withDelegate:self];
  v69 = v68;
  v341 = v3;
  if (v68)
  {
    [v68 setRuntimeChecks:8];
    [v69 setMaximumSizeMB:0];
    v339 = [(SystemDiagnostic *)self startDiagnosticTime];
    v337 = [v339 dateByAddingTimeInterval:-30.0];
    v70 = +[SDUnitLogGlob logRuleWithGlob:@"/private/var/logs/CrashReporter/stacks-*" withDate:v337 withFilter:0 newestFileCount:0 atInternalDirectory:0 withRuntimeChecks:0];
    v401[0] = v70;
    v71 = [(SystemDiagnostic *)self startDiagnosticTime];
    v72 = [v71 dateByAddingTimeInterval:-30.0];
    v73 = +[SDUnitLogGlob logRuleWithGlob:@"/private/var/mobile/Library/Logs/CrashReporter/stacks-*" withDate:v72 withFilter:0 newestFileCount:0 atInternalDirectory:0 withRuntimeChecks:0];
    v401[1] = v73;
    v74 = [(SystemDiagnostic *)self startDiagnosticTime];
    v75 = [v74 dateByAddingTimeInterval:-30.0];
    v76 = +[SDUnitLogGlob logRuleWithGlob:@"/private/var/mobile/Library/Logs/CrashReporter/Retired/stacks-*" withDate:v75 withFilter:0 newestFileCount:0 atInternalDirectory:0 withRuntimeChecks:0];
    v401[2] = v76;
    v77 = +[NSArray arrayWithObjects:v401 count:3];
    [v69 addRules:v77];

    v3 = v341;
    [v341 addObject:v69];
  }

  v78 = +[SDLogCollectionContainer containerWithName:@"BluetoothAccessory" destination:@"logs/Bluetooth" withDelegate:self];
  v79 = v78;
  if (v78)
  {
    [v78 setRuntimeChecks:9];
    v80 = +[SDUnitLogPathArray logRuleWithPaths:&off_1000B01A0];
    v400 = v80;
    v81 = +[NSArray arrayWithObjects:&v400 count:1];
    [v79 addRules:v81];

    [v3 addObject:v79];
  }

  v82 = +[SDLogCollectionContainer containerWithName:@"BluetoothCoreDump" destination:@"logs/Bluetooth/CoreDump" withDelegate:self];
  v83 = v82;
  if (v82)
  {
    [v82 setRuntimeChecks:9];
    v84 = +[SDUnitLogGlob logRuleWithGlob:@"/private/var/mobile/Library/Logs/Bluetooth/bluetoothd-FWCOREDUMP*log"];
    v399 = v84;
    v85 = +[NSArray arrayWithObjects:&v399 count:1];
    [v83 addRules:v85];

    [v3 addObject:v83];
  }

  v86 = +[SDLogCollectionContainer containerWithName:@"HCI" destination:@"logs/Bluetooth" withDelegate:self];
  v87 = v86;
  if (v86)
  {
    [v86 setRuntimeChecks:8];
    [v87 setMaximumSizeMB:10];
    v88 = +[SDUnitLogGlob logRuleWithGlob:@"/private/var/mobile/Library/Logs/Bluetooth/bluetoothd-hci*.pklg" withDate:0 withFilter:0 newestFileCount:2 atInternalDirectory:0 withRuntimeChecks:0];
    v398 = v88;
    v89 = +[NSArray arrayWithObjects:&v398 count:1];
    [v87 addRules:v89];

    [v3 addObject:v87];
  }

  v90 = +[SDLogCollectionContainer containerWithName:@"DataMigration" destination:@"logs/DataMigration" withDelegate:self];
  v91 = v90;
  if (v90)
  {
    [v90 setRuntimeChecks:9];
    v92 = +[SDUnitLogDirectory logRuleWithDirectory:@"/private/var/mobile/Library/Logs/CrashReporter/DiagnosticLogs/DataMigration" withDepth:0 withDate:0 withFilter:0 newestFileCount:1 atInternalDirectory:0 withRuntimeChecks:0];
    v397 = v92;
    v93 = +[NSArray arrayWithObjects:&v397 count:1];
    [v91 addRules:v93];

    [v3 addObject:v91];
  }

  v94 = +[SDLogCollectionContainer containerWithName:@"MobileLockdown" destination:@"logs/MobileLockdown" withDelegate:self];
  v95 = v94;
  if (v94)
  {
    [v94 setRuntimeChecks:8];
    v96 = +[SDUnitLogGlob logRuleWithGlob:@"/private/var/logs/lockdownd.log*"];
    v396 = v96;
    v97 = +[NSArray arrayWithObjects:&v396 count:1];
    [v95 addRules:v97];

    [v3 addObject:v95];
  }

  v98 = +[SDLogCollectionContainer containerWithName:@"CoreLocation" destination:@"logs/CoreLocation" withDelegate:self];
  v99 = v98;
  if (v98)
  {
    [v98 setRuntimeChecks:9];
    v100 = +[SDUnitLogPathArray logRuleWithPaths:&off_1000B01B8];
    v395 = v100;
    v101 = +[NSArray arrayWithObjects:&v395 count:1];
    [v99 addRules:v101];

    [v3 addObject:v99];
  }

  v102 = +[SDLogCollectionContainer containerWithName:@"syslog" destination:@"logs/system" withDelegate:self];
  v103 = v102;
  if (v102)
  {
    [v102 setRuntimeChecks:9];
    v104 = +[SDUnitLogGlob logRuleWithGlob:@"/private/var/db/diagnostics/system.log{,.[01].gz}"];
    v394[0] = v104;
    v105 = +[SDUnitLogGlob logRuleWithGlob:@"/private/var/db/diagnostics/system{,.[01]}.log{,.gz}"];
    v394[1] = v105;
    v106 = +[NSArray arrayWithObjects:v394 count:2];
    [v103 addRules:v106];

    [v3 addObject:v103];
  }

  v107 = +[SDLogCollectionContainer containerWithName:@"Networking" destination:@"logs/Networking" withDelegate:self];
  v108 = v107;
  if (v107)
  {
    [v107 setRuntimeChecks:8];
    v109 = +[SDUnitLogPathArray logRuleWithPaths:&off_1000B01D0];
    v393 = v109;
    v110 = +[NSArray arrayWithObjects:&v393 count:1];
    [v108 addRules:v110];

    [v3 addObject:v108];
  }

  v111 = +[SDLogCollectionContainer containerWithName:@"FindMyDevice" destination:@"logs/FindMyDevice" withDelegate:self];
  v112 = v111;
  if (v111)
  {
    [v111 setRuntimeChecks:9];
    v113 = +[SDUnitLogDirectory logRuleWithDirectory:@"/private/tmp/findmydeviced-sysdiagnose"];
    v392 = v113;
    v114 = +[NSArray arrayWithObjects:&v392 count:1];
    [v112 addRules:v114];

    [v3 addObject:v112];
  }

  v115 = +[SDLogCollectionContainer containerWithName:@"itunesstored" destination:@"logs/itunesstored" withDelegate:self];
  v116 = v115;
  if (v115)
  {
    [v115 setRuntimeChecks:8];
    v117 = +[SDUnitLogPathArray logRuleWithPaths:&off_1000B01E8];
    v391[0] = v117;
    v118 = +[SDUnitLogDirectory logRuleWithDirectory:@"/private/var/mobile/Library/Logs/com.apple.itunesstored" withDepth:0 withDate:0 withFilter:0 newestFileCount:0 atInternalDirectory:@"com.apple.itunesstored" withRuntimeChecks:0];
    v391[1] = v118;
    v119 = +[NSArray arrayWithObjects:v391 count:2];
    [v116 addRules:v119];

    [v3 addObject:v116];
  }

  v120 = +[SDLogCollectionContainer containerWithName:@"OTA" destination:@"logs/OTA" withDelegate:self];
  v121 = v120;
  if (v120)
  {
    [v120 setRuntimeChecks:9];
    v122 = +[SDUnitLogPathArray logRuleWithPaths:&off_1000B0200];
    v390[0] = v122;
    v123 = +[SDUnitLogGlob logRuleWithGlob:@"/private/var/mobile/Library/Logs/CrashReporter/DiagnosticLogs/SoftwareUpdateServices.log*" withDate:0 withFilter:0 newestFileCount:3 atInternalDirectory:0 withRuntimeChecks:0];
    v390[1] = v123;
    v124 = +[NSArray arrayWithObjects:v390 count:2];
    [v121 addRules:v124];

    [v3 addObject:v121];
  }

  v125 = +[SDLogCollectionContainer containerWithName:@"LaunchServices" destination:@"logs/LaunchServices" withDelegate:self];
  v126 = v125;
  if (v125)
  {
    [v125 setRuntimeChecks:8];
    v127 = +[SDUnitLogDirectory logRuleWithDirectory:@"/private/var/mobile/Library/Logs/CrashReporter/DiagnosticLogs/LaunchServices"];
    v389 = v127;
    v128 = +[NSArray arrayWithObjects:&v389 count:1];
    [v126 addRules:v128];

    [v3 addObject:v126];
  }

  v129 = +[SDLogCollectionContainer containerWithName:@"AppConduit" destination:@"logs/AppConduit" withDelegate:self];
  v130 = v129;
  if (v129)
  {
    [v129 setRuntimeChecks:8];
    v131 = +[SDUnitLogGlob logRuleWithGlob:@"/private/var/mobile/Library/Logs/AppConduit/AppConduit.log.[0-4]"];
    v388 = v131;
    v132 = +[NSArray arrayWithObjects:&v388 count:1];
    [v130 addRules:v132];

    [v3 addObject:v130];
  }

  v133 = +[SDLogCollectionContainer containerWithName:@"Accounts" destination:@"logs/Accounts" withDelegate:self];
  v134 = v133;
  if (v133)
  {
    [v133 setRuntimeChecks:8];
    v135 = +[SDUnitLogDirectory logRuleWithDirectory:@"/private/var/mobile/Library/Logs/CrashReporter/DiagnosticLogs/Accounts"];
    v387 = v135;
    v136 = +[NSArray arrayWithObjects:&v387 count:1];
    [v134 addRules:v136];

    [v3 addObject:v134];
  }

  v137 = +[SDLogCollectionContainer containerWithName:@"Harmony" destination:@"/logs/harmony" withDelegate:self];
  v138 = v137;
  if (v137)
  {
    [v137 setRuntimeChecks:9];
    v139 = +[SDUnitLogGlob logRuleWithGlob:@"/private/var/mobile/Library/Logs/CrashReporter/harmony/*.csv" withDate:0 withFilter:0 newestFileCount:5 atInternalDirectory:0 withRuntimeChecks:0];
    v386 = v139;
    v140 = +[NSArray arrayWithObjects:&v386 count:1];
    [v138 addRules:v140];

    [v3 addObject:v138];
  }

  v141 = +[SDLogCollectionContainer containerWithName:@"Contacts" destination:@"logs" withDelegate:self];
  v142 = v141;
  if (v141)
  {
    [v141 setRuntimeChecks:9];
    v143 = +[SDUnitLogGlob logRuleWithGlob:@"/private/var/mobile/Library/Logs/CrashReporter/DiagnosticLogs/com.apple.AddressBook*" withDate:0 withFilter:0 newestFileCount:0 atInternalDirectory:@"Contacts" withRuntimeChecks:0];
    v385[0] = v143;
    v144 = +[SDUnitLogGlob logRuleWithGlob:@"/private/var/mobile/Library/Logs/CrashReporter/DiagnosticLogs/DataAccess/CardDAVHTTPTraffic*" withDate:0 withFilter:0 newestFileCount:0 atInternalDirectory:@"DataAccess" withRuntimeChecks:0];
    v385[1] = v144;
    v145 = +[NSArray arrayWithObjects:v385 count:2];
    [v142 addRules:v145];

    [v3 addObject:v142];
  }

  v146 = +[SDLogCollectionContainer containerWithName:@"Burnin" destination:@"logs/Burnin" withDelegate:self];
  v147 = v146;
  if (v146)
  {
    [v146 setRuntimeChecks:11];
    [v147 setMaximumSizeMB:0];
    v340 = +[SDUnitLogPathArray logRuleWithPaths:&off_1000B0218];
    v384[0] = v340;
    v338 = +[SDUnitLogDirectory logRuleWithDirectory:@"/private/var/logs/BurnIn"];
    v384[1] = v338;
    v336 = +[SDUnitLogDirectory logRuleWithDirectory:@"/private/var/logs/Earthbound" withDepth:0 withDate:0 withFilter:0 newestFileCount:0 atInternalDirectory:@"Earthbound" withRuntimeChecks:0];
    v384[2] = v336;
    v335 = +[SDUnitLogDirectory logRuleWithDirectory:@"/private/var/logs/AppleSupport" withDepth:0 withDate:0 withFilter:0 newestFileCount:0 atInternalDirectory:@"AppleSupport" withRuntimeChecks:0];
    v384[3] = v335;
    v148 = +[SDUnitLogDirectory logRuleWithDirectory:@"/private/var/db/Earthbound" withDepth:0 withDate:0 withFilter:0 newestFileCount:0 atInternalDirectory:@"Earthbound/db" withRuntimeChecks:0];
    v384[4] = v148;
    v149 = +[SDUnitLogDirectory logRuleWithDirectory:@"/AppleInternal/Diags/Logs" withDepth:0 withDate:0 withFilter:0 newestFileCount:0 atInternalDirectory:@"AppleInternal/Diags" withRuntimeChecks:0];
    v384[5] = v149;
    v150 = [(SystemDiagnostic *)self baseDirectory];
    v151 = +[NSPredicate predicateWithFormat:@"NOT SELF contains %@", v150];
    v152 = +[SDUnitLogDirectory logRuleWithDirectory:@"/private/var/mobile/Library/Logs/CrashReporter" withDepth:0 withDate:0 withFilter:v151 newestFileCount:0 atInternalDirectory:@"mobile/Library/CrashReporter" withRuntimeChecks:0];
    v384[6] = v152;
    v153 = +[SDUnitLogDirectory logRuleWithDirectory:@"/private/var/logs/CrashReporter" withDepth:0 withDate:0 withFilter:0 newestFileCount:0 atInternalDirectory:@"CrashReporter" withRuntimeChecks:0];
    v384[7] = v153;
    v154 = +[NSArray arrayWithObjects:v384 count:8];
    [v147 addRules:v154];

    v3 = v341;
    [v341 addObject:v147];
  }

  v155 = +[SDLogCollectionContainer containerWithName:@"Buddy" destination:@"logs/Buddy" withDelegate:self];
  v156 = v155;
  if (v155)
  {
    [v155 setRuntimeChecks:9];
    v157 = +[SDUnitLogGlob logRuleWithGlob:@"/private/var/mobile/Library/Logs/CrashReporter/DiagnosticLogs/Buddy_*"];
    v383 = v157;
    v158 = +[NSArray arrayWithObjects:&v383 count:1];
    [v156 addRules:v158];

    [v3 addObject:v156];
  }

  v159 = +[SDLogCollectionContainer containerWithName:@"ProtectedCloudStorage" destination:@"logs/ProtectedCloudStorage" withDelegate:self];
  v160 = v159;
  if (v159)
  {
    [v159 setRuntimeChecks:8];
    v161 = +[SDUnitLogGlob logRuleWithGlob:@"/private/var/mobile/Library/Logs/CrashReporter/DiagnosticLogs/ProtectedCloudStorage*.log"];
    v382 = v161;
    v162 = +[NSArray arrayWithObjects:&v382 count:1];
    [v160 addRules:v162];

    [v3 addObject:v160];
  }

  v163 = +[SDLogCollectionContainer containerWithName:@"MobileBackup" destination:@"logs/MobileBackup" withDelegate:self];
  v164 = v163;
  if (v163)
  {
    [v163 setRuntimeChecks:8];
    v165 = +[SDUnitLogPathArray logRuleWithPaths:&off_1000B0230];
    v381[0] = v165;
    v166 = +[SDUnitLogPathArray logRuleWithPaths:&off_1000B0248 withDate:0 withFilter:0 newestFileCount:0 atInternalDirectory:0 withRuntimeChecks:1];
    v381[1] = v166;
    v167 = +[NSArray arrayWithObjects:v381 count:2];
    [v164 addRules:v167];

    [v3 addObject:v164];
  }

  v168 = +[SDLogCollectionContainer containerWithName:@"NanoRegistry" destination:@"logs/NanoRegistry" withDelegate:self];
  v169 = v168;
  if (v168)
  {
    [v168 setRuntimeChecks:9];
    v170 = +[SDUnitLogPathArray logRuleWithPaths:&off_1000B0260];
    v380 = v170;
    v171 = +[NSArray arrayWithObjects:&v380 count:1];
    [v169 addRules:v171];

    [v3 addObject:v169];
  }

  v172 = +[SDLogCollectionContainer containerWithName:@"ATVUpdateLog" destination:@"logs/ATVUpdateLog" withDelegate:self];
  v173 = v172;
  if (v172)
  {
    [v172 setRuntimeChecks:8];
    id v174 = +[SDUnitLogPathArray logRuleWithPaths:&off_1000B0278];
    v379 = v174;
    v175 = +[NSArray arrayWithObjects:&v379 count:1];
    [v173 addRules:v175];

    [v3 addObject:v173];
  }

  v176 = +[SDLogCollectionContainer containerWithName:@"SUInfo" destination:@"logs" withDelegate:self];
  v177 = v176;
  if (v176)
  {
    [v176 setRuntimeChecks:9];
    v178 = +[SDUnitLogPathArray logRuleWithPaths:&off_1000B0290];
    v378 = v178;
    v179 = +[NSArray arrayWithObjects:&v378 count:1];
    [v177 addRules:v179];

    [v3 addObject:v177];
  }

  v180 = +[SDLogCollectionContainer containerWithName:@"demod" destination:@"logs/demod" withDelegate:self];
  v181 = v180;
  if (v180)
  {
    [v180 setRuntimeChecks:8];
    v182 = +[SDUnitLogGlob logRuleWithGlob:@"/private/var/logs/demod/demod-*"];
    v377[0] = v182;
    v183 = +[SDUnitLogGlob logRuleWithGlob:@"/private/var/logs/demod/demod_helper-*"];
    v377[1] = v183;
    v184 = +[NSArray arrayWithObjects:v377 count:2];
    [v181 addRules:v184];

    [v3 addObject:v181];
  }

  v185 = +[SDLogCollectionContainer containerWithName:@"WatchConnectivity" destination:@"logs/WatchConnectivity" withDelegate:self];
  v186 = v185;
  if (v185)
  {
    [v185 setRuntimeChecks:8];
    v187 = +[SDUnitLogDirectory logRuleWithDirectory:@"/private/var/mobile/Library/Logs/CrashReporter/DiagnosticLogs/WatchConnectivity" withDepth:0 withDate:0 withFilter:0 newestFileCount:10 atInternalDirectory:0 withRuntimeChecks:0];
    v376 = v187;
    v188 = +[NSArray arrayWithObjects:&v376 count:1];
    [v186 addRules:v188];

    [v3 addObject:v186];
  }

  v189 = +[SDLogCollectionContainer containerWithName:@"coremediacapture-afdebug" destination:@"logs/coremediacapture" withDelegate:self];
  v190 = v189;
  if (v189)
  {
    [v189 setRuntimeChecks:9];
    v191 = +[SDUnitLogGlob logRuleWithGlob:](SDUnitLogGlob, "logRuleWithGlob:", @"/private/var/mobile/Library/Logs/CrashReporter/mediaserverd-capture-NOT-A-CRASH.afdebug-[0-9][0-9][0-9][0-9]-[0-9][0-9]-[0-9][0-9].txt");
    v375 = v191;
    v192 = +[NSArray arrayWithObjects:&v375 count:1];
    [v190 addRules:v192];

    [v3 addObject:v190];
  }

  v193 = +[SDLogCollectionContainer containerWithName:@"BridgeActivation" destination:@"logs/BridgeActivation" withDelegate:self];
  v194 = v193;
  if (v193)
  {
    [v193 setRuntimeChecks:9];
    v195 = +[SDUnitLogGlob logRuleWithGlob:@"/private/var/mobile/Library/Logs/CrashReporter/DiagnosticLogs/Bridge-Activation-Re[quest\\|sponse]*.txt"];
    v374 = v195;
    v196 = +[NSArray arrayWithObjects:&v374 count:1];
    [v194 addRules:v196];

    [v3 addObject:v194];
  }

  v197 = +[SDLogCollectionContainer containerWithName:@"BridgeReporting" destination:@"logs/BridgeReporting" withDelegate:self];
  v198 = v197;
  if (v197)
  {
    [v197 setRuntimeChecks:9];
    v199 = +[SDUnitLogGlob logRuleWithGlob:@"/private/var/mobile/Library/Caches/com.apple.Bridge/PairingMetric/pairing_metric*/*MetricDetails.plist" withDate:0 withFilter:0 newestFileCount:10 atInternalDirectory:@"MostRecent" withRuntimeChecks:0];
    v373[0] = v199;
    v200 = +[SDUnitLogGlob logRuleWithGlob:@"/private/var/mobile/Library/Caches/com.apple.Bridge/PairingMetric/Archived/pairing_metric*.plist" withDate:0 withFilter:0 newestFileCount:10 atInternalDirectory:@"Archived" withRuntimeChecks:0];
    v373[1] = v200;
    v201 = +[NSArray arrayWithObjects:v373 count:2];
    [v198 addRules:v201];

    [v3 addObject:v198];
  }

  v202 = +[SDLogCollectionContainer containerWithName:@"HomePodSetUp" destination:@"logs/HomePodSetUp" withDelegate:self];
  v203 = v202;
  if (v202)
  {
    [v202 setRuntimeChecks:9];
    v204 = +[SDUnitLogGlob logRuleWithGlob:@"/private/var/mobile/Library/Logs/com.apple.HomePodLEDPairingData*.bin"];
    v372 = v204;
    v205 = +[NSArray arrayWithObjects:&v372 count:1];
    [v203 addRules:v205];

    [v3 addObject:v203];
  }

  v206 = +[SDLogCollectionContainer containerWithName:@"Frametracer" destination:@"logs/Frametracer" withDelegate:self];
  v207 = v206;
  if (v206)
  {
    [v206 setRuntimeChecks:9];
    v208 = +[SDUnitLogGlob logRuleWithGlob:@"/private/var/mobile/Library/Logs/CrashReporter/CoreAnimation/*tailspin"];
    v371 = v208;
    v209 = +[NSArray arrayWithObjects:&v371 count:1];
    [v207 addRules:v209];

    [v3 addObject:v207];
  }

  v210 = +[SDLogCollectionContainer containerWithName:@"MatchTailspins" destination:@"logs/MatchTailspins" withDelegate:self];
  v211 = v210;
  if (v210)
  {
    [v210 setRuntimeChecks:9];
    v212 = +[SDUnitLogGlob logRuleWithGlob:@"/private/var/mobile/Library/Logs/BioLog/BL*/*seq/*tailspin" withDate:0 withFilter:0 newestFileCount:10 atInternalDirectory:0 withRuntimeChecks:0];
    v370 = v212;
    v213 = +[NSArray arrayWithObjects:&v370 count:1];
    [v211 addRules:v213];

    [v3 addObject:v211];
  }

  v214 = +[SDLogCollectionContainer containerWithName:@"ForceResetTailspins" destination:@"logs/ForceResetTailspins" withDelegate:self];
  v215 = v214;
  if (v214)
  {
    [v214 setRuntimeChecks:8];
    v216 = +[SDUnitLogDirectory logRuleWithDirectory:@"/private/var/mobile/Library/Logs/CrashReporter/ForceResetTailspins"];
    v369 = v216;
    v217 = +[NSArray arrayWithObjects:&v369 count:1];
    [v215 addRules:v217];

    [v3 addObject:v215];
  }

  v218 = +[SDLogCollectionContainer containerWithName:@"TetheredRestore" destination:@"logs/TetheredRestore" withDelegate:self];
  v219 = v218;
  if (v218)
  {
    [v218 setRuntimeChecks:9];
    v220 = +[SDUnitLogPathArray logRuleWithPaths:&off_1000B02A8];
    v368 = v220;
    v221 = +[NSArray arrayWithObjects:&v368 count:1];
    [v219 addRules:v221];

    [v3 addObject:v219];
  }

  v222 = +[SDLogCollectionContainer containerWithName:@"MobileObliteration" destination:@"logs/MobileObliteration" withDelegate:self];
  v223 = v222;
  if (v222)
  {
    [v222 setRuntimeChecks:9];
    v224 = [(SystemDiagnostic *)self startDiagnosticTime];
    v225 = [v224 dateByAddingTimeInterval:-432000.0];
    v226 = +[SDUnitLogPathArray logRuleWithPaths:&off_1000B02C0 withDate:v225 withFilter:0 newestFileCount:0 atInternalDirectory:0 withRuntimeChecks:0];
    v367 = v226;
    v227 = +[NSArray arrayWithObjects:&v367 count:1];
    [v223 addRules:v227];

    [v3 addObject:v223];
  }

  v228 = +[SDLogCollectionContainer containerWithName:@"OTAUpdateLogs" destination:@"logs/OTAUpdateLogs" withDelegate:self];
  v229 = v228;
  if (v228)
  {
    [v228 setRuntimeChecks:8];
    v230 = +[SDUnitLogPathArray logRuleWithPaths:&off_1000B02D8];
    v366 = v230;
    v231 = +[NSArray arrayWithObjects:&v366 count:1];
    [v229 addRules:v231];

    [v3 addObject:v229];
  }

  v232 = +[SDLogCollectionContainer containerWithName:@"CommandAndControl" destination:@"logs/AccessibilityPrefs" withDelegate:self];
  v233 = v232;
  if (v232)
  {
    [v232 setRuntimeChecks:8];
    v234 = +[SDUnitLogPathArray logRuleWithPaths:&off_1000B02F0];
    v365 = v234;
    v235 = +[NSArray arrayWithObjects:&v365 count:1];
    [v233 addRules:v235];

    [v3 addObject:v233];
  }

  v236 = +[SDLogCollectionContainer containerWithName:@"SiriTextToSpeech" destination:@"logs/SiriTextToSpeech" withDelegate:self];
  v237 = v236;
  if (v236)
  {
    [v236 setRuntimeChecks:9];
    v238 = +[SDUnitLogDirectory logRuleWithDirectory:@"/private/var/mobile/Library/Logs/CrashReporter/SiriTTS_AudioDump"];
    v364 = v238;
    v239 = +[NSArray arrayWithObjects:&v364 count:1];
    [v237 addRules:v239];

    [v3 addObject:v237];
  }

  v240 = +[SDLogCollectionContainer containerWithName:@"LivabilityApp" destination:@"logs/LivabilityApp" withDelegate:self];
  v241 = v240;
  if (v240)
  {
    [v240 setRuntimeChecks:9];
    v242 = +[SDUnitLogDirectory logRuleWithDirectory:@"/private/var/mobile/Library/Preferences/com.apple.Livability.plist"];
    v363 = v242;
    v243 = +[NSArray arrayWithObjects:&v363 count:1];
    [v241 addRules:v243];

    [v3 addObject:v241];
  }

  v244 = +[SDLogCollectionContainer containerWithName:@"MobileSlideShow" destination:@"logs/MobileSlideShow" withDelegate:self];
  v245 = v244;
  if (v244)
  {
    [v244 setRuntimeChecks:9];
    v246 = +[SDUnitLogDirectory logRuleWithDirectory:@"/private/var/mobile/Library/Preferences/com.apple.mobileslideshow.plist"];
    v362 = v246;
    v247 = +[NSArray arrayWithObjects:&v362 count:1];
    [v245 addRules:v247];

    [v3 addObject:v245];
  }

  v248 = +[SDLogCollectionContainer containerWithName:@"AlishaLogs" destination:@"logs/AlishaLogs" withDelegate:self];
  v249 = v248;
  if (v248)
  {
    [v248 setRuntimeChecks:9];
    v250 = +[SDUnitLogPathArray logRuleWithPaths:&off_1000B0308];
    v361 = v250;
    v251 = +[NSArray arrayWithObjects:&v361 count:1];
    [v249 addRules:v251];

    [v3 addObject:v249];
  }

  v252 = +[SDLogCollectionContainer containerWithName:@"MobileStoreDemo" destination:@"logs/MobileStoreDemo" withDelegate:self];
  v253 = v252;
  if (v252)
  {
    [v252 setRuntimeChecks:8];
    v254 = +[SDUnitLogPathArray logRuleWithPaths:&off_1000B0320];
    v360 = v254;
    v255 = +[NSArray arrayWithObjects:&v360 count:1];
    [v253 addRules:v255];

    [v3 addObject:v253];
  }

  v256 = +[SDLogCollectionContainer containerWithName:@"SleepCycler" destination:@"logs/SleepCycler" withDelegate:self];
  v257 = v256;
  if (v256)
  {
    [v256 setRuntimeChecks:9];
    v258 = +[SDUnitLogPathArray logRuleWithPaths:&off_1000B0338];
    v359 = v258;
    v259 = +[NSArray arrayWithObjects:&v359 count:1];
    [v257 addRules:v259];

    [v3 addObject:v257];
  }

  v260 = +[SDLogCollectionContainer containerWithName:@"Resource Exhaustion" destination:@"resource_exhaustion" withDelegate:self];
  v261 = v260;
  if (v260)
  {
    [v260 setRuntimeChecks:9];
    v262 = [(SystemDiagnostic *)self startDiagnosticTime];
    v263 = [v262 dateByAddingTimeInterval:-3600.0];
    v264 = +[SDUnitLogGlob logRuleWithGlob:@"/private/var/db/spindump/Exhaustion*" withDate:v263 withFilter:0 newestFileCount:0 atInternalDirectory:0 withRuntimeChecks:0];
    v358 = v264;
    v265 = +[NSArray arrayWithObjects:&v358 count:1];
    [v261 addRules:v265];

    [v3 addObject:v261];
  }

  v266 = +[SDLogCollectionContainer containerWithName:@"SystemVersion" destination:@"logs/SystemVersion" withDelegate:self];
  v267 = v266;
  if (v266)
  {
    [v266 setRuntimeChecks:8];
    v268 = +[SDUnitLogPathArray logRuleWithPaths:&off_1000B0350];
    v357 = v268;
    v269 = +[NSArray arrayWithObjects:&v357 count:1];
    [v267 addRules:v269];

    [v3 addObject:v267];
  }

  v270 = +[SDLogCollectionContainer containerWithName:@"Recoverylogd" destination:@"logs/recoverylogd" withDelegate:self];
  v271 = v270;
  if (v270)
  {
    [v270 setRuntimeChecks:8];
    v272 = +[SDUnitLogDirectory logRuleWithDirectory:@"/private/var/mobile/Library/Logs/recoverylogd"];
    v356[0] = v272;
    v273 = +[SDUnitLogDirectory logRuleWithDirectory:@"/System/Volumes/Hardware/recoverylogd"];
    v356[1] = v273;
    v274 = +[NSArray arrayWithObjects:v356 count:2];
    [v271 addRules:v274];

    [v3 addObject:v271];
  }

  v275 = +[SDLogCollectionContainer containerWithName:@"RunningBoard" destination:@"logs/RunningBoard" withDelegate:self];
  v276 = v275;
  if (v275)
  {
    [v275 setRuntimeChecks:9];
    [v276 setMaximumSizeMB:10];
    v277 = +[SDUnitLogGlob logRuleWithGlob:@"/private/tmp/com.apple.runningboardd/ts-*.tailspin"];
    v355 = v277;
    v278 = +[NSArray arrayWithObjects:&v355 count:1];
    [v276 addRules:v278];

    [v3 addObject:v276];
  }

  v279 = +[SDLogCollectionContainer containerWithName:@"CacheDeleteHistory" destination:@"logs/CacheDelete" withDelegate:self];
  v280 = v279;
  if (v279)
  {
    [v279 setRuntimeChecks:8];
    [v280 setMaximumSizeMB:10];
    v281 = +[SDUnitLogPathArray logRuleWithPaths:&off_1000B0368];
    v354 = v281;
    v282 = +[NSArray arrayWithObjects:&v354 count:1];
    [v280 addRules:v282];

    [v3 addObject:v280];
  }

  v283 = +[SDLogCollectionContainer containerWithName:@"SpaceAttributionTelemetry" destination:@"logs/SpaceAttribution" withDelegate:self];
  v284 = v283;
  if (v283)
  {
    [v283 setRuntimeChecks:9];
    [v284 setMaximumSizeMB:2];
    v285 = +[SDUnitLogPathArray logRuleWithPaths:&off_1000B0380];
    v353 = v285;
    v286 = +[NSArray arrayWithObjects:&v353 count:1];
    [v284 addRules:v286];

    [v3 addObject:v284];
  }

  v287 = +[SDLogCollectionContainer containerWithName:@"AUDeveloperSettings" destination:@"logs/AUDeveloperSettings" withDelegate:self];
  v288 = v287;
  if (v287)
  {
    [v287 setRuntimeChecks:9];
    [v288 setMaximumSizeMB:1];
    v289 = +[SDUnitLogPathArray logRuleWithPaths:&off_1000B0398];
    v352 = v289;
    v290 = +[NSArray arrayWithObjects:&v352 count:1];
    [v288 addRules:v290];

    [v3 addObject:v288];
  }

  v291 = +[SDLogCollectionContainer containerWithName:@"copySpringBoardStateDump" destination:@"logs/SpringBoard" withDelegate:self];
  v292 = v291;
  if (v291)
  {
    [v291 setRuntimeChecks:9];
    [v292 setMaximumSizeMB:1];
    v293 = +[SDUnitLogPathArray logRuleWithPaths:&off_1000B03B0];
    v351 = v293;
    v294 = +[NSArray arrayWithObjects:&v351 count:1];
    [v292 addRules:v294];

    [v3 addObject:v292];
  }

  v295 = +[SDLogCollectionContainer containerWithName:@"WindowServerHangs" destination:@"logs/WindowServer" withDelegate:self];
  v296 = v295;
  if (v295)
  {
    [v295 setRuntimeChecks:9];
    [v296 setMaximumSizeMB:50];
    v297 = [(SystemDiagnostic *)self startDiagnosticTime];
    v298 = [v297 dateByAddingTimeInterval:-1800.0];
    v299 = +[SDUnitLogDirectory logRuleWithDirectory:@"/Library/Logs/WindowServer" withDepth:0 withDate:v298 withFilter:0 newestFileCount:0 atInternalDirectory:0 withRuntimeChecks:0];
    v350 = v299;
    v300 = +[NSArray arrayWithObjects:&v350 count:1];
    [v296 addRules:v300];

    [v3 addObject:v296];
  }

  v301 = +[SDLogCollectionContainer containerWithName:@"UARPEndpointPacketCaptures" destination:@"logs/UARPEndpointPacketCaptures" withDelegate:self];
  v302 = v301;
  if (v301)
  {
    [v301 setRuntimeChecks:8];
    [v302 setMaximumSizeMB:10];
    v303 = +[SDUnitLogDirectory logRuleWithDirectory:@"/private/var/db/accessoryupdater/uarp/pcapfiles"];
    v349 = v303;
    v304 = +[NSArray arrayWithObjects:&v349 count:1];
    [v302 addRules:v304];

    [v3 addObject:v302];
  }

  v305 = +[SDLogCollectionContainer containerWithName:@"CameraCaptureStateDumps" destination:@"logs/CameraCapture" withDelegate:self];
  v306 = v305;
  if (v305)
  {
    [v305 setRuntimeChecks:8];
    [v306 setMaximumSizeMB:3];
    v307 = +[SDUnitLogGlob logRuleWithGlob:@"/private/var/mobile/tmp/com.apple.cameracaptured/CMCaptureStateDumps/*"];
    v348 = v307;
    v308 = +[NSArray arrayWithObjects:&v348 count:1];
    [v306 addRules:v308];

    [v3 addObject:v306];
  }

  v309 = +[SDLogCollectionContainer containerWithName:@"DarwinInit" destination:@"logs/DarwinInit" withDelegate:self];
  v310 = v309;
  if (v309)
  {
    [v309 setRuntimeChecks:8200];
    [v310 setMaximumSizeMB:1];
    v311 = +[SDUnitLogPathArray logRuleWithPaths:&off_1000B03C8];
    v347 = v311;
    v312 = +[NSArray arrayWithObjects:&v347 count:1];
    [v310 addRules:v312];

    [v3 addObject:v310];
  }

  v313 = +[SDLogCollectionContainer containerWithName:@"AirPodPowerMetrics" destination:@"logs/AirPodPowerMetrics" withDelegate:self];
  v314 = v313;
  if (v313)
  {
    [v313 setRuntimeChecks:8];
    [v314 setMaximumSizeMB:1];
    v315 = +[SDUnitLogDirectory logRuleWithDirectory:@"/private/var/db/accessoryupdater/uarp/sysdiagnose/com.apple.Bluetooth.AccessoryCase.pif_daily"];
    v346 = v315;
    v316 = +[NSArray arrayWithObjects:&v346 count:1];
    [v314 addRules:v316];

    [v3 addObject:v314];
  }

  v317 = +[SDLogCollectionContainer containerWithName:@"BatteryIntelligence" destination:@"logs/BatteryIntelligence" withDelegate:self];
  v318 = v317;
  if (v317)
  {
    [v317 setRuntimeChecks:8];
    [v318 setMaximumSizeMB:1];
    v319 = +[SDUnitLogGlob logRuleWithGlob:@"/private/var/db/Battery/BI/com.apple.batteryintelligence.batteryalgorithms/com.apple.batteryintelligence.batteryalgorithms-OnDeviceACAM-{state,meta}.plist"];
    v345 = v319;
    v320 = +[NSArray arrayWithObjects:&v345 count:1];
    [v318 addRules:v320];

    [v3 addObject:v318];
  }

  v321 = +[SDLogCollectionContainer containerWithName:@"MobileSlideShowPrivateData" destination:@"logs/MobileSlideShow" withDelegate:self];
  v322 = v321;
  if (v321)
  {
    [v321 setRuntimeChecks:9];
    [v322 setMaximumSizeMB:1];
    v323 = +[SDUnitLogPathArray logRuleWithPaths:&off_1000B03E0];
    v344 = v323;
    v324 = +[NSArray arrayWithObjects:&v344 count:1];
    [v322 addRules:v324];

    [v3 addObject:v322];
  }

  v325 = +[SDLogCollectionContainer containerWithName:@"MCUCoreDumps" destination:@"crashes_and_spins/Panics" withDelegate:self];
  v326 = v325;
  if (v325)
  {
    [v325 setRuntimeChecks:8200];
    [v326 setMaximumSizeMB:50];
    v327 = +[SDUnitLogGlob logRuleWithGlob:@"/private/var/tmp/manta-cores/*soc_mcu*/*soc-mcu*panic.core"];
    v343 = v327;
    v328 = +[NSArray arrayWithObjects:&v343 count:1];
    [v326 addRules:v328];

    [v3 addObject:v326];
  }

  v329 = +[SDLogCollectionContainer containerWithName:@"NERDArchive" destination:@"logs/MSU" withDelegate:self];
  v330 = v329;
  if (v329)
  {
    [v329 setRuntimeChecks:8];
    [v330 setMaximumSizeMB:20];
    v331 = +[SDUnitLogGlob logRuleWithGlob:withDate:withFilter:newestFileCount:atInternalDirectory:withRuntimeChecks:](SDUnitLogGlob, "logRuleWithGlob:withDate:withFilter:newestFileCount:atInternalDirectory:withRuntimeChecks:", @"/private/var/MobileSoftwareUpdate/Controller/NeRD/RecoveryOS-[0-9-]*.logarchive.zip", 0, 0, 1, 0, 0);
    v342 = v331;
    v332 = +[NSArray arrayWithObjects:&v342 count:1];
    [v330 addRules:v332];

    [v3 addObject:v330];
  }

  id v333 = v3;
  return v333;
}

- (void)TSProcessSpecific_preprocess:(id)a3
{
  id v60 = a3;
  unsigned int v4 = [(SystemDiagnostic *)self requestSource];
  v5 = [(SystemDiagnostic *)self targetPIDs];
  id v6 = [v5 count];

  if (v6)
  {
    if ([(SystemDiagnostic *)self quickMode]
      || [(SystemDiagnostic *)self requestSource] == 1)
    {
      v7 = +[NSMutableArray arrayWithObjects:@"-v", @"-w", 0];
      long long v77 = 0u;
      long long v78 = 0u;
      long long v79 = 0u;
      long long v80 = 0u;
      v8 = [(SystemDiagnostic *)self targetPIDs];
      id v9 = [v8 countByEnumeratingWithState:&v77 objects:v89 count:16];
      if (v9)
      {
        id v10 = v9;
        uint64_t v11 = *(void *)v78;
        do
        {
          for (i = 0; i != v10; i = (char *)i + 1)
          {
            if (*(void *)v78 != v11) {
              objc_enumerationMutation(v8);
            }
            v13 = [*(id *)(*((void *)&v77 + 1) + 8 * i) stringValue];
            [v7 addObject:v13];
          }
          id v10 = [v8 countByEnumeratingWithState:&v77 objects:v89 count:16];
        }
        while (v10);
      }

      v14 = +[SDTaskDepotContainer containerWithName:@"process footprint" destination:0 withTimeout:0 withConcurrency:self withDelegate:25.0];
      v15 = v14;
      if (v14)
      {
        [v14 setRuntimeChecks:32];
        v16 = +[SDTask taskWithCommand:@"/usr/local/bin/footprint" arguments:v7 outputFile:@"footprint.txt"];
        v88 = v16;
        v17 = +[NSArray arrayWithObjects:&v88 count:1];
        [v15 addSDTasksToContainer:v17];

        [v60 addObject:v15];
      }
    }
    v18 = [(SystemDiagnostic *)self targetPIDs];
    unint64_t v19 = (unint64_t)[v18 count];
    unint64_t v20 = v19 >> 2;

    unint64_t v21 = v19 & 0xFFFFFFFFFFFFFFFCLL;
    v22 = [(SystemDiagnostic *)self targetPIDs];
    id v23 = [v22 count];

    if (v21 >= (unint64_t)v23) {
      unint64_t v24 = v20;
    }
    else {
      unint64_t v24 = v20 + 1;
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      unint64_t v87 = v24;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Number of process specific time-sensitive groups: %lu", buf, 0xCu);
    }
    v25 = +[SDResourceManager sharedResourceManager];
    [v25 log:@"Number of process specific time-sensitive groups: %lu", v24];

    if (v24)
    {
      uint64_t v26 = 0;
      uint64_t v27 = 30;
      if (v4 == 2) {
        uint64_t v27 = 120;
      }
      uint64_t v61 = v27;
      v28 = (void **)&AnalyticsSendEventLazy_ptr;
      v66 = self;
      unint64_t v62 = v24;
      do
      {
        uint64_t v29 = (4 * v26);
        v30 = (char *)(v29 + 4);
        v31 = [(SystemDiagnostic *)self targetPIDs];
        id v32 = [v31 count];

        if (v29 + 4 > (unint64_t)v32)
        {
          v33 = [(SystemDiagnostic *)self targetPIDs];
          v30 = (char *)[v33 count];
        }
        unint64_t v67 = (unint64_t)v30;
        v63 = &v30[-v29];
        uint64_t v65 = v26 + 1;
        v64 = [v28[421] stringWithFormat:@"Process specific container group: %d", v26 + 1];
        v34 = &__NSArray0__struct;
        do
        {
          v35 = v34;
          v36 = [(SystemDiagnostic *)self targetPIDs];
          v37 = [v36 objectAtIndex:v29];
          id v38 = [v37 intValue];

          uint64_t v39 = [[v28[421] stringWithFormat:@"%d", v38];
          uint64_t v40 = [(SystemDiagnostic *)self pidIndices];
          uint64_t v75 = v29;
          v76 = v35;
          if (v40
            && (v41 = (void *)v40,
                [(SystemDiagnostic *)self pidIndices],
                v42 = objc_claimAutoreleasedReturnValue(),
                id v43 = [v42 count],
                v42,
                v41,
                v43))
          {
            v44 = [(SystemDiagnostic *)self pidIndices];
            v45 = [v44 objectAtIndex:v29];
            unsigned int v46 = [v45 intValue];

            [&stru_1000A1EA8 stringByAppendingFormat:@"%s", (char *)-[SystemDiagnostic processes](self, "processes") + 136 * (int)v46 + 48];
            v47 = (__CFString *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v47 = &stru_1000A1EA8;
          }
          v74 = [v28[421] stringWithFormat:@"<TMPOUTPUTDIR>/graph-%d-%@.memgraph", v38, v47];
          v73 = [v28[421] stringWithFormat:@"errors/leaks_ts_%d_errors.txt", v38];
          v84[0] = @"-outputGraph";
          v84[1] = v74;
          v84[2] = v39;
          v84[3] = @"-forkCorpse";
          v72 = +[NSArray arrayWithObjects:v84 count:4];
          v71 = +[SDTask taskWithCommand:@"/usr/bin/leaks" arguments:v72 outputFile:v73];
          v85[0] = v71;
          v83[0] = @"-v";
          v83[1] = @"-k";
          v83[2] = v39;
          v69 = +[NSArray arrayWithObjects:v83 count:3];
          v68 = [v28[421] stringWithFormat:@"ddt-%u-%@.txt", v38, v47];
          v48 = +[SDTask taskWithCommand:@"/usr/local/bin/ddt" arguments:v69 outputFile:v68 withRuntimeChecks:1];
          v85[1] = v48;
          v82[0] = @"procinfo";
          v82[1] = v39;
          v49 = +[NSArray arrayWithObjects:v82 count:2];
          [v28[421] stringWithFormat:@"launchctl-procinfo-%u-%@.txt", v38, v47];
          uint64_t v50 = v39;
          v70 = (void *)v39;
          v52 = v51 = v28;
          v53 = +[SDTask taskWithCommand:@"/bin/launchctl" arguments:v49 outputFile:v52];
          v85[2] = v53;
          v81[0] = @"dump-concurrency";
          v81[1] = v50;
          v54 = +[NSArray arrayWithObjects:v81 count:2];
          v55 = [v51[421] stringWithFormat:@"swift-inspect-%u-%@.txt", v38, v47];
          v56 = +[SDTask taskWithCommand:@"/usr/bin/swift-inspect" arguments:v54 outputFile:v55];
          v85[3] = v56;
          v57 = +[NSArray arrayWithObjects:v85 count:4];

          v28 = v51;
          v34 = [v76 arrayByAddingObjectsFromArray:v57];

          uint64_t v29 = v75 + 1;
          self = v66;
        }
        while (v75 + 1 < v67);
        v58 = +[SDComplexContainer complexContainerWithTasks:v34 withTimeout:&__NSArray0__struct withRules:&stru_1000A1EA8 atDestination:v66 withDelegate:1 isConcurrent:(double)(unint64_t)((void)v63 * v61)];
        v59 = v58;
        if (v58)
        {
          [v58 setName:v64];
          [v60 addObject:v59];
        }

        uint64_t v26 = v65;
      }
      while (v65 != v62);
    }
  }
}

- (void)filecoordination_postprocess:(id)a3 withContainerArray:(id)a4
{
  id v8 = a3;
  id v5 = a4;
  if (v8)
  {
    id v6 = [v8 collectionContainer];

    if (v6)
    {
      v7 = [v8 collectionContainer];
      [v7 setDestination:0];
    }
  }
}

- (void)footprintAll_postprocess:(id)a3 withContainerArray:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(SystemDiagnostic *)self quickMode] || [(SystemDiagnostic *)self requestSource] == 1)
  {
    if (v6) {
      [v7 removeObject:v6];
    }
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Creating footprint...", v9, 2u);
    }
    id v8 = +[SDResourceManager sharedResourceManager];
    [v8 log:@"Creating footprint..."];
  }
}

- (void)systemInfoTimeSensitive_postprocess:(id)a3 withContainerArray:(id)a4
{
  if (a3)
  {
    id v4 = a3;
    id v5 = +[SDTask taskWithCommand:@"/usr/bin/kbdebug" arguments:0 outputFile:@"kbdebug.txt"];
    id v7 = v5;
    id v6 = +[NSArray arrayWithObjects:&v7 count:1];
    [v4 addSDTasksToContainer:v6];
  }
}

- (id)_iOSgetLogCopyingContainers
{
  v3 = +[NSMutableArray array];
  id v4 = [(SystemDiagnostic *)self _getCrashesAndSpinsContainer];
  [v3 addObjectsFromArray:v4];

  id v5 = [(SystemDiagnostic *)self _copyOnDemandDaemonLogsContainer];
  [v3 addObjectsFromArray:v5];

  id v6 = [(SystemDiagnostic *)self _copyVideoProcessingLogs];
  [v3 addObjectsFromArray:v6];

  id v7 = [(SystemDiagnostic *)self _copyThermalLogs];
  [v3 addObjectsFromArray:v7];

  id v8 = [(SystemDiagnostic *)self copyCoreaudioReportingLogs];
  [v3 addObjectsFromArray:v8];

  id v9 = [(SystemDiagnostic *)self _copyAccessibilityPreferences];
  [v3 addObjectsFromArray:v9];

  id v10 = [(SystemDiagnostic *)self _copyAstroLogsContainer];
  [v3 addObjectsFromArray:v10];

  uint64_t v11 = [(SystemDiagnostic *)self _getMapsSyncJournalContainer];
  [v3 addObjectsFromArray:v11];

  id v12 = [(SystemDiagnostic *)self _copyCompanionSyncContainer];
  [v3 addObjectsFromArray:v12];

  v13 = [(SystemDiagnostic *)self _getAGXMTLCompilerCrashLogs];
  [v3 addObjectsFromArray:v13];

  id v14 = [(SystemDiagnostic *)self _copyNanoPreferencesSyncLogs];
  [v3 addObjectsFromArray:v14];

  id v15 = [(SystemDiagnostic *)self _copyCoreCaptureBTLogsContainer];
  [v3 addObjectsFromArray:v15];

  v16 = [(SystemDiagnostic *)self _getFscklogs];
  [v3 addObjectsFromArray:v16];

  id v17 = [(SystemDiagnostic *)self _copyMobileInstallationLogsContainer];
  [v3 addObjectsFromArray:v17];

  id v18 = [(SystemDiagnostic *)self _copyMobileActivationLogsContainer];
  [v3 addObjectsFromArray:v18];

  id v19 = [(SystemDiagnostic *)self _copyAppInstallationLogsContainer];
  [v3 addObjectsFromArray:v19];

  id v20 = [(SystemDiagnostic *)self _copyProxiedDeviceCrashLogsContainer];
  [v3 addObjectsFromArray:v20];

  id v21 = [(SystemDiagnostic *)self _copySiriLogsContainer];
  [v3 addObjectsFromArray:v21];

  id v22 = [(SystemDiagnostic *)self _copyMobileAssetHistoryLogs];
  [v3 addObjectsFromArray:v22];

  id v23 = [(SystemDiagnostic *)self _copySplunkHistoryLogs];
  [v3 addObjectsFromArray:v23];

  id v24 = [(SystemDiagnostic *)self _copyParsecdBagLogs];
  [v3 addObjectsFromArray:v24];

  v25 = [(SystemDiagnostic *)self _getCloudKitBookmarksContainer];
  [v3 addObjectsFromArray:v25];

  id v26 = [(SystemDiagnostic *)self _copySiriAnalyticsDB];
  [v3 addObjectsFromArray:v26];

  id v27 = [(SystemDiagnostic *)self _copyHIDFWCrashLogs];
  [v3 addObjectsFromArray:v27];

  id v28 = [(SystemDiagnostic *)self _copySplatVersioningLogs];
  [v3 addObjectsFromArray:v28];

  id v29 = [(SystemDiagnostic *)self _copyHangTracerTailspinsContainer];
  [v3 addObjectsFromArray:v29];

  id v30 = [(SystemDiagnostic *)self _copySentryPlistsContainer];
  [v3 addObjectsFromArray:v30];

  id v31 = [(SystemDiagnostic *)self _copyMCLogs];
  [v3 addObjectsFromArray:v31];

  id v32 = [(SystemDiagnostic *)self _copyWatchdogTailspins];
  [v3 addObjectsFromArray:v32];

  id v33 = [(SystemDiagnostic *)self _copyWatchdogdDDTs];
  [v3 addObjectsFromArray:v33];

  id v34 = [(SystemDiagnostic *)self _copyTCCLogs];
  [v3 addObjectsFromArray:v34];

  v35 = [(SystemDiagnostic *)self _getCalendarPrefLogs];
  [v3 addObjectsFromArray:v35];

  v36 = [(SystemDiagnostic *)self _getSocialLayerPlist];
  [v3 addObjectsFromArray:v36];

  return v3;
}

- (id)_copyProxiedDeviceCrashLogsContainer
{
  v3 = +[NSMutableArray array];
  id v4 = +[SDLogCollectionContainer containerWithName:@"process proxied device logs" destination:@"logs/ProxiedDevice" withDelegate:self];
  id v5 = v4;
  if (v4)
  {
    [v4 setRuntimeChecks:8];
    id v6 = +[SDUnitLogGlob logRuleWithGlob:@"/private/var/mobile/Library/Logs/CrashReporter/ProxiedDevice-*/*"];
    id v7 = [(SystemDiagnostic *)self startDiagnosticTime];
    id v8 = [v7 dateByAddingTimeInterval:-86400.0];
    [v6 setCreatedSince:v8];

    uint64_t v11 = v6;
    id v9 = +[NSArray arrayWithObjects:&v11 count:1];
    [v5 addRules:v9];

    [v3 addObject:v5];
  }

  return v3;
}

- (id)_createTailspinContainerHelper:(id)a3 isRecent:(BOOL)a4 withSizeMB:(unint64_t)a5 forGlobsBlock:(id)a6
{
  BOOL v8 = a4;
  id v10 = a3;
  uint64_t v11 = (void (**)(id, id))a6;
  id v12 = [(SystemDiagnostic *)self startDiagnosticTime];
  v13 = [v12 dateByAddingTimeInterval:-86400.0];

  id v14 = [(SystemDiagnostic *)self startDiagnosticTime];
  id v15 = [v14 dateByAddingTimeInterval:-180.0];

  id v16 = v13;
  id v17 = [@"crashes_and_spins" stringByAppendingPathComponent:v10];
  if (v8)
  {
    uint64_t v18 = [@"Recent" stringByAppendingString:v10];

    id v19 = v15;
    a5 = 0;
    id v10 = (id)v18;
  }
  else
  {
    id v19 = v16;
  }
  id v20 = +[SDLogCollectionContainer containerWithName:v10 destination:v17 withDelegate:self];
  id v21 = v20;
  if (v20)
  {
    [v20 setMaximumSizeMB:a5];
    [v21 setRuntimeChecks:8];
    id v29 = v11;
    id v22 = v11[2](v11, v19);
    id v23 = v22;
    if (!v8)
    {
      long long v32 = 0u;
      long long v33 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      id v24 = [v22 countByEnumeratingWithState:&v30 objects:v34 count:16];
      if (v24)
      {
        id v25 = v24;
        uint64_t v26 = *(void *)v31;
        do
        {
          for (i = 0; i != v25; i = (char *)i + 1)
          {
            if (*(void *)v31 != v26) {
              objc_enumerationMutation(v23);
            }
            [*(id *)(*((void *)&v30 + 1) + 8 * i) setCreatedUntil:v15];
          }
          id v25 = [v23 countByEnumeratingWithState:&v30 objects:v34 count:16];
        }
        while (v25);
      }
    }
    [v21 addRules:v23];

    uint64_t v11 = v29;
  }

  return v21;
}

- (id)createTailspinContainer:(id)a3 withSizeMB:(unint64_t)a4 forGlobsBlock:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = +[NSMutableArray array];
  uint64_t v11 = [(SystemDiagnostic *)self _createTailspinContainerHelper:v8 isRecent:0 withSizeMB:a4 forGlobsBlock:v9];
  if (v11) {
    [v10 addObject:v11];
  }
  id v12 = [(SystemDiagnostic *)self _createTailspinContainerHelper:v8 isRecent:1 withSizeMB:a4 forGlobsBlock:v9];
  if (v12) {
    [v10 addObject:v12];
  }

  return v10;
}

- (id)_copyHangTracerTailspinsContainer
{
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_copyOnDemandDaemonLogsContainer
{
  v3 = +[NSMutableArray array];
  id v4 = +[SDLogCollectionContainer containerWithName:@"ondemandd" destination:@"logs/OnDemandDaemon/" withDelegate:self];
  id v5 = v4;
  if (v4)
  {
    [v4 setRuntimeChecks:9];
    id v6 = +[SDUnitLogDirectory logRuleWithDirectory:@"/private/var/mobile/Library/Logs/CrashReporter/DiagnosticLogs/ondemandd/"];
    id v7 = [(SystemDiagnostic *)self startDiagnosticTime];
    id v8 = [v7 dateByAddingTimeInterval:-86400.0];
    [v6 setCreatedSince:v8];

    uint64_t v11 = v6;
    id v9 = +[NSArray arrayWithObjects:&v11 count:1];
    [v5 addRules:v9];

    [v3 addObject:v5];
  }

  return v3;
}

- (id)_copyCoreCaptureBTLogsContainer
{
  v3 = +[NSMutableArray array];
  id v4 = +[SDLogCollectionContainer containerWithName:@"CoreCaptureBT" destination:@"logs/MarconiBT" withDelegate:self];
  id v5 = v4;
  if (v4)
  {
    [v4 setRuntimeChecks:8];
    [v5 setRuntimeChecks:[v5 runtimeChecks] | 1];
    [v5 setGenerateSummary:1];
    [v5 setResolveHomeDirs:0];
    id v6 = +[SDUnitLogDirectory logRuleWithDirectory:@"/private/var/log/CoreCapture/com.apple.driver.AppleMarconiBTDriver" atInternalDirectory:@"com.apple.driver.AppleMarconiBTDriver"];
    v10[0] = v6;
    id v7 = +[SDUnitLogDirectory logRuleWithDirectory:@"/private/var/mobile/Library/Logs/CrashReporter/CoreCapture/MarconiBT"];
    v10[1] = v7;
    id v8 = +[NSArray arrayWithObjects:v10 count:2];
    [v5 addRules:v8];

    [v3 addObject:v5];
  }

  return v3;
}

- (id)_copyAppInstallationLogsContainer
{
  v3 = +[NSMutableArray array];
  id v4 = +[SDLogCollectionContainer containerWithName:@"appinstallation" destination:@"logs/appinstallation" withDelegate:self];
  id v5 = v4;
  if (v4)
  {
    [v4 setRuntimeChecks:8];
    id v6 = +[SDUnitLogPathArray logRuleWithPaths:&off_1000B0440];
    [v6 setMobileContainer:@"com.apple.appstored"];
    [v6 setMobileContainerClass:3];
    id v7 = +[SDUnitLogDirectory logRuleWithDirectory:@"/private/var/mobile/Library/Logs/com.apple.appstored"];
    v10[0] = v7;
    v10[1] = v6;
    id v8 = +[NSArray arrayWithObjects:v10 count:2];
    [v5 addRules:v8];

    [v3 addObject:v5];
  }

  return v3;
}

- (id)_copyCompanionSyncContainer
{
  v3 = +[NSMutableArray array];
  BOOL v11 = 0;
  sub_1000487D8(@"LogStatistics", @"com.apple.companionsync", &v11);
  if (v11)
  {
    id v4 = +[SDLogCollectionContainer containerWithName:@"CompanionSync" destination:@"logs/CompanionSync/defaults" withDelegate:self];
    id v5 = v4;
    if (v4)
    {
      [v4 setRuntimeChecks:8];
      id v6 = +[SDUnitLogPathArray logRuleWithPaths:&off_1000B0458];
      v13 = v6;
      id v7 = &v13;
LABEL_6:
      id v9 = +[NSArray arrayWithObjects:v7 count:1];
      [v5 addRules:v9];

      [v3 addObject:v5];
    }
  }
  else
  {
    id v8 = +[SDLogCollectionContainer containerWithName:@"CompanionSync" destination:@"logs/CompanionSync/internal" withDelegate:self];
    id v5 = v8;
    if (v8)
    {
      [v8 setRuntimeChecks:9];
      id v6 = +[SDUnitLogPathArray logRuleWithPaths:&off_1000B0470];
      id v12 = v6;
      id v7 = &v12;
      goto LABEL_6;
    }
  }

  return v3;
}

- (id)_copyNanoPreferencesSyncLogs
{
  v3 = +[NSMutableArray array];
  id v4 = +[SDLogCollectionContainer containerWithName:@"NanoPreferencesSync" destination:@"logs/NanoPreferencesSync" withDelegate:self];
  id v5 = v4;
  if (v4)
  {
    [v4 setRuntimeChecks:9];
    id v6 = +[SDUnitLogGlob logRuleWithGlob:@"/private/var/mobile/Library/DeviceRegistry/*/NanoPreferencesSync/NanoDomains/com.apple.nanoprefsyncd"];
    id v7 = +[SDUnitLogGlob logRuleWithGlob:@"/private/var/mobile/Library/DeviceRegistry/*/NanoPreferencesSync/NanoDomains/com.apple.pairedsync", v6];
    v11[1] = v7;
    id v8 = +[SDUnitLogPathArray logRuleWithPaths:&off_1000B0488];
    v11[2] = v8;
    id v9 = +[NSArray arrayWithObjects:v11 count:3];

    if (v9) {
      [v5 addRules:v9];
    }
    [v3 addObject:v5];
  }
  return v3;
}

- (id)_copyMCLogs
{
  v3 = +[NSMutableArray array];
  id v4 = +[SDLogCollectionContainer containerWithName:@"MCState" destination:@"logs/MCState" withDelegate:self];
  id v5 = +[NSMutableArray array];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v6 = [&off_1000B04A0 countByEnumeratingWithState:&v16 objects:v21 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v17;
    do
    {
      id v9 = 0;
      do
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(&off_1000B04A0);
        }
        id v10 = +[NSPredicate predicateWithFormat:@"NOT SELF CONTAINS %@", *(void *)(*((void *)&v16 + 1) + 8 * (void)v9)];
        [v5 addObject:v10];

        id v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [&off_1000B04A0 countByEnumeratingWithState:&v16 objects:v21 count:16];
    }
    while (v7);
  }
  BOOL v11 = +[NSCompoundPredicate andPredicateWithSubpredicates:v5];
  if (v4)
  {
    [v4 setRuntimeChecks:8];
    id v12 = +[SDUnitLogDirectory logRuleWithDirectory:@"/private/var/containers/Shared/SystemGroup/systemgroup.com.apple.configurationprofiles/Library/ConfigurationProfiles/" withDepth:0 withDate:0 withFilter:v11 newestFileCount:0 atInternalDirectory:@"Shared" withRuntimeChecks:0];
    v20[0] = v12;
    v13 = +[SDUnitLogDirectory logRuleWithDirectory:@"/private/var/mobile/Library/UserConfigurationProfiles" atInternalDirectory:@"User"];
    v20[1] = v13;
    id v14 = +[NSArray arrayWithObjects:v20 count:2];
    [v4 addRules:v14];

    [v3 addObject:v4];
  }

  return v3;
}

- (id)_copyMobileAssetHistoryLogs
{
  v3 = +[NSMutableArray array];
  id v4 = +[SDLogCollectionContainer containerWithName:@"MobileAssetHistory" destination:@"logs/MobileAsset/history" withDelegate:self];
  id v5 = v4;
  if (v4)
  {
    [v4 setRuntimeChecks:8];
    id v6 = [@"/private/var/MobileAsset/AssetsV2/history" stringByAppendingPathComponent:@"MAAutoAsset_{Filesystem,Locker,Atomic,Error,Secure,Stager,Scheduler}_History"];
    id v7 = [v6 stringByAppendingString:@".txt"];
    uint64_t v8 = +[SDUnitLogGlob logRuleWithGlob:v7];
    v13[0] = v8;
    id v9 = [v6 stringByAppendingString:@"_0[0-9].log"];
    id v10 = +[SDUnitLogGlob logRuleWithGlob:v9];
    v13[1] = v10;
    BOOL v11 = +[NSArray arrayWithObjects:v13 count:2];
    [v5 addRules:v11];

    [v3 addObject:v5];
  }

  return v3;
}

- (id)_copySplunkHistoryLogs
{
  v3 = +[NSMutableArray array];
  id v4 = +[SDLogCollectionContainer containerWithName:@"SplunkHistory" destination:@"logs/MobileSoftwareUpdate" withDelegate:self];
  id v5 = v4;
  if (v4)
  {
    [v4 setRuntimeChecks:8];
    [v5 setMaximumSizeMB:2];
    id v6 = [@"/private/var/MobileSoftwareUpdate/Controller/SplunkHistory/" stringByAppendingPathComponent:@"SUCoreSplunkHistory.log*"];
    id v7 = +[SDUnitLogGlob logRuleWithGlob:v6];
    id v10 = v7;
    uint64_t v8 = +[NSArray arrayWithObjects:&v10 count:1];
    [v5 addRules:v8];

    [v3 addObject:v5];
  }

  return v3;
}

- (id)_copySiriLogsContainer
{
  v3 = +[NSMutableArray array];
  id v4 = +[SDLogCollectionContainer containerWithName:@"Siri" destination:@"logs/Siri" withDelegate:self];
  id v5 = v4;
  if (v4)
  {
    [v4 setRuntimeChecks:8];
    id v6 = @"self.lastPathComponent MATCHES 'OPUS_.+\\.opx|PCM-.+\\.wav'";
    if (sub_100048604())
    {
      v15[0] = @"self.lastPathComponent MATCHES 'OPUS_.+\\.opx|PCM-.+\\.wav'";
      v15[1] = @"OR";
      v15[2] = @"self.lastPathComponent MATCHES 'PHS-.*\\.wav'";
      id v7 = +[NSArray arrayWithObjects:v15 count:3];
      id v6 = [v7 componentsJoinedByString:@" "];
    }
    uint64_t v8 = +[NSPredicate predicateWithFormat:v6];
    id v9 = +[SDUnitLogDirectory logRuleWithDirectory:@"/private/var/mobile/Library/Logs/CrashReporter/Assistant/SpeechLogs" withDepth:0 withDate:0 withFilter:v8 newestFileCount:0 atInternalDirectory:@"SpeechLogs" withRuntimeChecks:0];
    v14[0] = v9;
    id v10 = +[SDUnitLogGlob logRuleWithGlob:@"/private/var/mobile/Library/Logs/CrashReporter/VoiceTrigger/audio/*.json" withDate:0 withFilter:0 newestFileCount:0 atInternalDirectory:@"VoiceTrigger" withRuntimeChecks:0];
    v14[1] = v10;
    BOOL v11 = +[SDUnitLogGlob logRuleWithGlob:@"/private/var/mobile/Library/Logs/CrashReporter/VoiceTrigger/audio/*.wav" withDate:0 withFilter:0 newestFileCount:0 atInternalDirectory:@"VoiceTrigger" withRuntimeChecks:1];
    v14[2] = v11;
    id v12 = +[NSArray arrayWithObjects:v14 count:3];
    [v5 addRules:v12];

    [v3 addObject:v5];
  }

  return v3;
}

- (id)_copyParsecdBagLogs
{
  v3 = +[NSMutableArray array];
  id v4 = objc_opt_new();
  [v4 addObject:@"/private/var/mobile/Library/Caches/com.apple.parsecd/skapp_data"];
  id v5 = sub_1000285AC(@"group.com.apple.PegasusConfiguration", 0);
  if (v5)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v15 = v5;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Identified app group container path for parsecd: %@", buf, 0xCu);
    }
    id v6 = [v5 stringByAppendingPathComponent:@"config.plist"];
    [v4 addObject:v6];
  }
  if ([v4 count])
  {
    id v7 = [v4 copy];
    uint64_t v8 = +[SDLogCollectionContainer containerWithName:@"parsecd" destination:@"logs/parsecd" withDelegate:self];
    id v9 = v8;
    if (v8)
    {
      [v8 setRuntimeChecks:8];
      id v10 = +[SDUnitLogPathArray logRuleWithPaths:v7];
      v13 = v10;
      BOOL v11 = +[NSArray arrayWithObjects:&v13 count:1];
      [v9 addRules:v11];

      [v3 addObject:v9];
    }
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "No parsecd paths to collect - exiting", buf, 2u);
  }

  return v3;
}

- (id)_getFscklogs
{
  v3 = +[NSMutableArray array];
  id v4 = +[NSMutableArray array];
  [v4 addObject:@"/private/var/log/fsck_apfs.log"];
  id v5 = [v4 copy];
  id v6 = +[SDLogCollectionContainer containerWithName:@"fsck" destination:@"logs/fsck" withDelegate:self];
  id v7 = v6;
  if (v6)
  {
    [v6 setRuntimeChecks:8];
    uint64_t v8 = +[SDUnitLogPathArray logRuleWithPaths:v5];
    BOOL v11 = v8;
    id v9 = +[NSArray arrayWithObjects:&v11 count:1];
    [v7 addRules:v9];

    [v3 addObject:v7];
  }

  return v3;
}

- (id)_copyAccessibilityPreferences
{
  v3 = +[NSMutableArray array];
  id v4 = +[SDLogCollectionContainer containerWithName:@"AccessibilityPrefs" destination:@"logs/AccessibilityPrefs" withDelegate:self];
  id v5 = v4;
  if (v4)
  {
    [v4 setRuntimeChecks:8];
    [v5 setMaximumSizeMB:1];
    id v6 = +[SDUnitLogPathArray logRuleWithPaths:&off_1000B04B8];
    v10[0] = v6;
    id v7 = +[SDUnitLogGlob logRuleWithGlob:@"/private/var/mobile/Library/Preferences/com.apple.ClarityUI*.plist"];
    v10[1] = v7;
    uint64_t v8 = +[NSArray arrayWithObjects:v10 count:2];
    [v5 addRules:v8];

    [v3 addObject:v5];
  }

  return v3;
}

- (id)_copyVideoProcessingLogs
{
  v3 = +[NSMutableArray array];
  id v4 = +[SDLogCollectionContainer containerWithName:@"VideoProcessing" destination:@"logs/VideoProcessing" withDelegate:self];
  id v5 = v4;
  if (v4)
  {
    [v4 setRuntimeChecks:9];
    id v6 = +[SDUnitLogDirectory logRuleWithDirectory:@"/private/var/mobile/Library/Logs/CrashReporter/VideoProcessing/Stats"];
    id v9 = v6;
    id v7 = +[NSArray arrayWithObjects:&v9 count:1];
    [v5 addRules:v7];

    [v3 addObject:v5];
  }

  return v3;
}

- (id)_copyThermalLogs
{
  v3 = +[NSMutableArray array];
  id v4 = +[SDLogCollectionContainer containerWithName:@"ThermalLogs" destination:@"logs/Thermal" withDelegate:self];
  id v5 = v4;
  if (v4)
  {
    [v4 setRuntimeChecks:8];
    [v5 setMaximumSizeMB:10];
    id v6 = +[SDUnitLogPathArray logRuleWithPaths:&off_1000B04D0];
    v10[0] = v6;
    id v7 = +[SDUnitLogPathArray logRuleWithPaths:&off_1000B04E8 withDate:0 withFilter:0 newestFileCount:0 atInternalDirectory:0 withRuntimeChecks:1];
    v10[1] = v7;
    uint64_t v8 = +[NSArray arrayWithObjects:v10 count:2];
    [v5 addRules:v8];

    [v3 addObject:v5];
  }

  return v3;
}

- (id)copyCoreaudioReportingLogs
{
  v3 = +[NSMutableArray array];
  id v4 = +[SDLogCollectionContainer containerWithName:@"coreaudio reporting" destination:@"logs/CoreaudioReporting" withDelegate:self];
  id v5 = v4;
  if (v4)
  {
    [v4 setRuntimeChecks:9];
    id v6 = [(SystemDiagnostic *)self startDiagnosticTime];
    id v7 = [v6 dateByAddingTimeInterval:-21600.0];

    uint64_t v8 = +[SDUnitLogDirectory logRuleWithDirectory:@"/private/var/mobile/Library/Logs/CrashReporter/DiagnosticLogs/Audio/Reporting" withDepth:1 withDate:v7 withFilter:0 newestFileCount:0 atInternalDirectory:0 withRuntimeChecks:0];
    BOOL v11 = v8;
    id v9 = +[NSArray arrayWithObjects:&v11 count:1];
    [v5 addRules:v9];

    [v3 addObject:v5];
  }

  return v3;
}

- (id)getSimplePathArrayContainer:(id)a3 withContainerName:(id)a4 andDestination:(id)a5 withOffsets:(id)a6 sizes:(id)a7
{
  id v12 = a3;
  id v13 = a6;
  id v14 = a7;
  id v15 = a5;
  id v16 = a4;
  long long v17 = +[NSMutableArray array];
  long long v18 = +[SDLogCollectionContainer containerWithName:v16 destination:v15 withDelegate:self];

  if (v18)
  {
    [v18 setMaximumSizeMB:0];
    [v18 setRuntimeChecks:8];
    long long v19 = +[SDUnitLogPathArray logRuleWithPaths:v12];
    [v19 setOffsets:v13];
    [v19 setSizes:v14];
    id v22 = v19;
    id v20 = +[NSArray arrayWithObjects:&v22 count:1];
    [v18 addRules:v20];

    [v17 addObject:v18];
  }

  return v17;
}

- (id)getSimplePathArrayContainer:(id)a3 withContainerName:(id)a4 andDestination:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  BOOL v11 = +[NSNumber numberWithLongLong:0];
  long long v18 = v11;
  id v12 = +[NSArray arrayWithObjects:&v18 count:1];

  id v13 = +[NSNumber numberWithLongLong:5242880];
  long long v17 = v13;
  id v14 = +[NSArray arrayWithObjects:&v17 count:1];

  id v15 = [(SystemDiagnostic *)self getSimplePathArrayContainer:v10 withContainerName:v9 andDestination:v8 withOffsets:v12 sizes:v14];

  return v15;
}

- (id)getSimpleDirectoryContainer:(id)a3 withContainerName:(id)a4 andDestination:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  BOOL v11 = +[NSMutableArray array];
  id v12 = +[SDLogCollectionContainer containerWithName:v10 destination:v9 withDelegate:self];

  if (v12)
  {
    [v12 setRuntimeChecks:8];
    id v13 = +[SDUnitLogDirectory logRuleWithDirectory:v8];
    id v16 = v13;
    id v14 = +[NSArray arrayWithObjects:&v16 count:1];
    [v12 addRules:v14];

    [v11 addObject:v12];
  }

  return v11;
}

- (id)_copyAstroLogsContainer
{
  v3 = +[NSMutableArray array];
  id v4 = +[SDLogCollectionContainer containerWithName:@"astro" destination:@"logs/Astro" withDelegate:self];
  id v5 = v4;
  if (v4)
  {
    [v4 setRuntimeChecks:11];
    [v5 setMaximumSizeMB:100];
    id v6 = +[SDUnitLogDirectory logRuleWithDirectory:@"/private/var/logs/Astro"];
    id v9 = v6;
    id v7 = +[NSArray arrayWithObjects:&v9 count:1];
    [v5 addRules:v7];

    [v3 addObject:v5];
  }

  return v3;
}

- (id)_copySplatVersioningLogs
{
  v3 = +[NSMutableArray array];
  id v4 = +[SDLogCollectionContainer containerWithName:@"Splat Versioning" destination:@"logs/Splat" withDelegate:self];
  id v5 = v4;
  if (v4)
  {
    [v4 setRuntimeChecks:8];
    long long v19 = [@"/private/preboot/Cryptexes" stringByAppendingPathComponent:@"OS/System/Library/CoreServices/SystemVersion.plist"];
    id v23 = v19;
    long long v18 = +[NSArray arrayWithObjects:&v23 count:1];
    long long v17 = +[SDUnitLogPathArray logRuleWithPaths:v18 withDate:0 withFilter:0 newestFileCount:0 atInternalDirectory:@"OS" withRuntimeChecks:0];
    v24[0] = v17;
    id v16 = [@"/private/preboot/Cryptexes" stringByAppendingPathComponent:@"OS/System/Library/CoreServices/RestoreVersion.plist"];
    id v22 = v16;
    id v15 = +[NSArray arrayWithObjects:&v22 count:1];
    id v6 = +[SDUnitLogPathArray logRuleWithPaths:v15 withDate:0 withFilter:0 newestFileCount:0 atInternalDirectory:@"OS" withRuntimeChecks:0];
    v24[1] = v6;
    id v7 = [@"/private/preboot/Cryptexes" stringByAppendingPathComponent:@"App/System/Library/CoreServices/SystemVersion.plist"];
    id v21 = v7;
    id v8 = +[NSArray arrayWithObjects:&v21 count:1];
    id v9 = +[SDUnitLogPathArray logRuleWithPaths:v8 withDate:0 withFilter:0 newestFileCount:0 atInternalDirectory:@"App" withRuntimeChecks:0];
    v24[2] = v9;
    id v10 = [@"/private/preboot/Cryptexes" stringByAppendingPathComponent:@"App/System/Library/CoreServices/RestoreVersion.plist"];
    id v20 = v10;
    BOOL v11 = +[NSArray arrayWithObjects:&v20 count:1];
    id v12 = +[SDUnitLogPathArray logRuleWithPaths:v11 withDate:0 withFilter:0 newestFileCount:0 atInternalDirectory:@"App" withRuntimeChecks:0];
    v24[3] = v12;
    id v13 = +[NSArray arrayWithObjects:v24 count:4];
    [v5 addRules:v13];

    [v3 addObject:v5];
  }

  return v3;
}

- (id)_copyHIDFWCrashLogs
{
  v3 = +[NSMutableArray array];
  id v4 = +[SDLogCollectionContainer containerWithName:@"hidfw-crashlogs" destination:@"logs/hidfw-crashlogs" withDelegate:self];
  id v5 = v4;
  if (v4)
  {
    [v4 setRuntimeChecks:8];
    id v6 = +[SDUnitLogDirectory logRuleWithDirectory:@"/private/var/logs/hidfw-crashlogs/"];
    id v9 = v6;
    id v7 = +[NSArray arrayWithObjects:&v9 count:1];
    [v5 addRules:v7];

    [v3 addObject:v5];
  }

  return v3;
}

- (id)_getSocialLayerPlist
{
  v3 = +[NSMutableArray array];
  id v4 = +[SDLogCollectionContainer containerWithName:@"SocialLayerPlist" destination:@"logs" withDelegate:self];
  id v5 = v4;
  if (v4)
  {
    [v4 setRuntimeChecks:8];
    id v6 = +[SDUnitLogPathArray logRuleWithPaths:&off_1000B0500];
    id v9 = v6;
    id v7 = +[NSArray arrayWithObjects:&v9 count:1];
    [v5 addRules:v7];

    [v3 addObject:v5];
  }

  return v3;
}

- (id)_getCalendarPrefLogs
{
  v3 = +[NSMutableArray array];
  id v4 = +[SDLogCollectionContainer containerWithName:@"CalendarPreferences" destination:@"logs/CalendarPreferences" withDelegate:self];
  id v5 = v4;
  if (v4)
  {
    [v4 setRuntimeChecks:8];
    id v6 = +[SDUnitLogPathArray logRuleWithPaths:&off_1000B0518];
    id v9 = v6;
    id v7 = +[NSArray arrayWithObjects:&v9 count:1];
    [v5 addRules:v7];

    [v3 addObject:v5];
  }

  return v3;
}

- (id)_getAGXMTLCompilerCrashLogs
{
  v3 = +[NSMutableArray array];
  id v4 = +[SDLogCollectionContainer containerWithName:@"AGXMTLCompilerCrash" destination:@"logs/AGXMTLCompiler" withDelegate:self];
  id v5 = v4;
  if (v4)
  {
    [v4 setRuntimeChecks:9];
    id v6 = +[SDUnitLogDirectory logRuleWithDirectory:@"/private/var/mobile/Library/Logs/CrashReporter/DiagnosticLogs/AGX"];
    v10[0] = v6;
    id v7 = +[SDUnitLogDirectory logRuleWithDirectory:@"/private/var/mobile/Library/Logs/CrashReporter/DiagnosticLogs/MTLCompiler/"];
    v10[1] = v7;
    id v8 = +[NSArray arrayWithObjects:v10 count:2];
    [v5 addRules:v8];

    [v3 addObject:v5];
  }

  return v3;
}

- (id)_copyTCCLogs
{
  v3 = +[NSMutableArray array];
  id v4 = +[SDLogCollectionContainer containerWithName:@"Accessibility" destination:@"logs/Accessibility" withDelegate:self];
  id v5 = v4;
  if (v4)
  {
    [v4 setRuntimeChecks:8];
    id v6 = +[SDUnitLogDirectory logRuleWithDirectory:@"/private/var/mobile/Library/TCC"];
    id v9 = v6;
    id v7 = +[NSArray arrayWithObjects:&v9 count:1];
    [v5 addRules:v7];

    [v3 addObject:v5];
  }

  return v3;
}

- (id)_copySiriAnalyticsDB
{
  v3 = +[NSMutableArray array];
  id v4 = +[SDLogCollectionContainer containerWithName:@"SiriAnalytics" destination:@"logs/SiriAnalytics" withDelegate:self];
  id v5 = v4;
  if (v4)
  {
    [v4 setMaximumSizeMB:7];
    [v5 setRuntimeChecks:8];
    CFStringRef v10 = @"/private/var/mobile/Library/Assistant/SiriAnalytics.db";
    id v6 = +[NSArray arrayWithObjects:&v10 count:1];
    id v7 = +[SDUnitLogPathArray logRuleWithPaths:v6];
    BOOL v11 = v7;
    id v8 = +[NSArray arrayWithObjects:&v11 count:1];
    [v5 addRules:v8];

    [v3 addObject:v5];
  }

  return v3;
}

- (id)_getCloudKitBookmarksContainer
{
  v3 = +[NSMutableArray array];
  id v4 = [(SystemDiagnostic *)self startDiagnosticTime];
  id v5 = [v4 dateByAddingTimeInterval:-518400.0];

  id v6 = +[NSPredicate predicateWithFormat:@"(pathExtension IN %@)", &off_1000B0530];
  id v7 = +[SDLogCollectionContainer containerWithName:@"CloudKitBookmarks" destination:@"logs" withDelegate:self];
  id v8 = v7;
  if (v7)
  {
    [v7 setRuntimeChecks:8];
    id v9 = +[SDUnitLogDirectory logRuleWithDirectory:@"/Library/Safari/CloudBookmarksMigrationCoordinator" withDepth:0 withDate:v5 withFilter:v6 newestFileCount:0 atInternalDirectory:@"CloudKitBookmarks" withRuntimeChecks:0];
    [v9 setMobileContainer:@"com.apple.mobilesafari"];
    [v9 setMobileContainerClass:2];
    id v12 = v9;
    CFStringRef v10 = +[NSArray arrayWithObjects:&v12 count:1];
    [v8 addRules:v10];

    [v3 addObject:v8];
  }

  return v3;
}

- (id)_getMapsSyncJournalContainer
{
  v3 = +[NSMutableArray array];
  id v4 = +[SDLogCollectionContainer containerWithName:@"MapsSyncJournal" destination:@"logs" withDelegate:self];
  id v5 = v4;
  if (v4)
  {
    [v4 setRuntimeChecks:9];
    id v6 = +[SDUnitLogPathArray logRuleWithPaths:&off_1000B0548];
    [v6 setMobileContainer:@"com.apple.Maps"];
    [v6 setMobileContainerClass:2];
    id v9 = v6;
    id v7 = +[NSArray arrayWithObjects:&v9 count:1];
    [v5 addRules:v7];

    [v3 addObject:v5];
  }

  return v3;
}

- (id)_copyMobileActivationLogsContainer
{
  v3 = +[NSMutableArray array];
  id v4 = +[SDLogCollectionContainer containerWithName:@"MobileActivation" destination:@"logs/MobileActivation" withDelegate:self];
  id v5 = v4;
  if (v4)
  {
    [v4 setRuntimeChecks:8];
    id v6 = [@"/private/var/mobile/Library/Logs/mobileactivationd" stringByAppendingPathComponent:@"ucrt_oob_request.txt"];
    v26[0] = v6;
    id v7 = [@"/private/var/mobile/Library/Logs/mobileactivationd" stringByAppendingPathComponent:@"ucrt_oob_response.txt"];
    v26[1] = v7;
    id v8 = [@"/private/var/mobile/Library/Logs/mobileactivationd" stringByAppendingPathComponent:@"collection_oob_request.txt"];
    v26[2] = v8;
    id v9 = [@"/private/var/mobile/Library/Logs/mobileactivationd" stringByAppendingPathComponent:@"collection_oob_response.txt"];
    v26[3] = v9;
    CFStringRef v10 = +[NSArray arrayWithObjects:v26 count:4];
    id v23 = +[SDUnitLogPathArray logRuleWithPaths:v10];

    v25[0] = v23;
    id v22 = [@"/private/var/mobile/Library/Logs/mobileactivationd" stringByAppendingPathComponent:@"mobileactivationd.log.*"];
    id v21 = +[SDUnitLogGlob logRuleWithGlob:v22];
    v25[1] = v21;
    BOOL v11 = [@"/private/var/mobile/Library/Logs/mobileactivationd" stringByAppendingPathComponent:@"*baa_request.txt"];
    id v12 = +[SDUnitLogGlob logRuleWithGlob:v11];
    v25[2] = v12;
    id v13 = [@"/private/var/mobile/Library/Logs/mobileactivationd" stringByAppendingPathComponent:@"*baa_response.txt"];
    id v14 = +[SDUnitLogGlob logRuleWithGlob:v13];
    v25[3] = v14;
    id v24 = v3;
    id v15 = [@"/private/var/mobile/Library/Logs/mobileactivationd" stringByAppendingPathComponent:@"*baa_su_request.txt"];
    id v16 = +[SDUnitLogGlob logRuleWithGlob:v15];
    v25[4] = v16;
    long long v17 = [@"/private/var/mobile/Library/Logs/mobileactivationd" stringByAppendingPathComponent:@"*baa_su_response.txt"];
    long long v18 = +[SDUnitLogGlob logRuleWithGlob:v17];
    v25[5] = v18;
    long long v19 = +[NSArray arrayWithObjects:v25 count:6];
    [v5 addRules:v19];

    v3 = v24;
    [v24 addObject:v5];
  }
  return v3;
}

- (id)_copySentryPlistsContainer
{
  v3 = +[NSMutableArray array];
  id v4 = +[SDLogCollectionContainer containerWithName:@"Sentry" destination:@"logs/Sentry/" withDelegate:self];
  if (v4)
  {
    id v5 = +[SDUnitLogPathArray logRuleWithPaths:&off_1000B0560];
    id v8 = v5;
    id v6 = +[NSArray arrayWithObjects:&v8 count:1];
    [v4 addRules:v6];

    [v4 setRuntimeChecks:8];
    [v3 addObject:v4];
  }

  return v3;
}

- (id)_copyWatchdogTailspins
{
  v3 = +[NSMutableArray array];
  id v4 = +[SDLogCollectionContainer containerWithName:@"watchdog" destination:@"logs/watchdog" withDelegate:self];
  id v5 = v4;
  if (v4)
  {
    [v4 setRuntimeChecks:9];
    [v5 setMaximumSizeMB:16];
    id v6 = [(SystemDiagnostic *)self startDiagnosticTime];
    id v7 = [v6 dateByAddingTimeInterval:-3600.0];

    id v8 = +[SDUnitLogGlob logRuleWithGlob:@"/private/var/mobile/Library/Logs/CrashReporter/watchdog*.tailspin" withDate:v7 withFilter:0 newestFileCount:1 atInternalDirectory:0 withRuntimeChecks:0];
    BOOL v11 = v8;
    id v9 = +[NSArray arrayWithObjects:&v11 count:1];
    [v5 addRules:v9];

    [v3 addObject:v5];
  }

  return v3;
}

- (id)_copyWatchdogdDDTs
{
  v3 = +[NSMutableArray array];
  id v4 = +[SDLogCollectionContainer containerWithName:@"watchdogd ddts" destination:@"logs/watchdog" withDelegate:self];
  id v5 = sub_1000280F0(@"watchdog-*-ddt-*.txt");
  if (v4)
  {
    [v4 setRuntimeChecks:9];
    [v4 setMaximumSizeMB:10];
    id v6 = [(SystemDiagnostic *)self startDiagnosticTime];
    id v7 = [v6 dateByAddingTimeInterval:-86400.0];

    id v8 = +[SDUnitLogGlob logRuleWithGlob:v5 withDate:v7 withFilter:0 newestFileCount:0 atInternalDirectory:0 withRuntimeChecks:0];
    BOOL v11 = v8;
    id v9 = +[NSArray arrayWithObjects:&v11 count:1];
    [v4 addRules:v9];

    [v3 addObject:v4];
  }

  return v3;
}

- (id)_getCrashesAndSpinsContainer
{
  id v23 = +[NSMutableArray array];
  v3 = [(SystemDiagnostic *)self startDiagnosticTime];
  id v4 = [v3 dateByAddingTimeInterval:-86400.0];

  if (sub_100048604())
  {
    id v5 = [&off_1000B0590 arrayByAddingObject:@"ips.ca"];
    id v6 = [&off_1000B05A8 arrayByAddingObject:@"ips.ca"];
  }
  else
  {
    id v5 = &off_1000B0590;
    id v6 = &off_1000B05A8;
  }
  id v22 = v5;
  id v25 = [(SystemDiagnostic *)self getPredicateForFileTypes:v5 withExcludedPrefixes:&off_1000B0578];
  id v24 = [(SystemDiagnostic *)self getPredicateForFileTypes:v6 withExcludedPrefixes:&off_1000B0578];
  id v7 = [@"/private/var/mobile/Library/Logs/CrashReporter" stringByAppendingPathComponent:@"Retired"];
  id v8 = [(SystemDiagnostic *)self outputDirectory];
  id v9 = [v8 stringByAppendingPathComponent:@"crashes_and_spins"];

  CFStringRef v10 = +[NSFileManager defaultManager];
  [v10 createDirectoryAtPath:v9 withIntermediateDirectories:0 attributes:0 error:0];

  BOOL v11 = [v9 stringByAppendingPathComponent:@"README.txt"];

  id v12 = [@"The summary of all the files collected is located in <sysdiagnose_dir>/summaries/crashes_and_spins.log" dataUsingEncoding:4];
  id v13 = +[NSFileManager defaultManager];
  NSFileAttributeKey v27 = NSFilePosixPermissions;
  id v28 = &off_1000B1100;
  id v14 = +[NSDictionary dictionaryWithObjects:&v28 forKeys:&v27 count:1];
  [v13 createFileAtPath:v11 contents:v12 attributes:v14];

  id v15 = +[SDLogCollectionContainer containerWithName:@"crashes and spins" destination:@"crashes_and_spins" withDelegate:self];
  id v16 = v15;
  if (v15)
  {
    [v15 setResolveHomeDirs:0];
    [v16 setMaximumSizeMB:20];
    [v16 setMaxVariety:1];
    [v16 setRuntimeChecks:8];
    long long v17 = +[SDUnitLogDirectory logRuleWithDirectory:@"/private/var/mobile/Library/Logs/CrashReporter" withDepth:1 withDate:v4 withFilter:v25 newestFileCount:0 atInternalDirectory:0 withRuntimeChecks:0];
    v26[0] = v17;
    long long v18 = +[SDUnitLogDirectory logRuleWithDirectory:v7 withDepth:1 withDate:v4 withFilter:v24 newestFileCount:0 atInternalDirectory:@"Retired" withRuntimeChecks:0];
    v26[1] = v18;
    long long v19 = +[SDUnitLogGlob logRuleWithGlob:@"/private/var/mobile/Library/Logs/CrashReporter/MemoryGraph_SpringBoard*.memgraph" withDate:0 withFilter:0 newestFileCount:1 atInternalDirectory:0 withRuntimeChecks:1];
    v26[2] = v19;
    id v20 = +[NSArray arrayWithObjects:v26 count:3];
    [v16 addRules:v20];

    [v23 addObject:v16];
  }

  return v23;
}

- (id)includeSyncedExtensionForFileTypes:(id)a3
{
  id v3 = [a3 mutableCopy];
  id v4 = (char *)[v3 count];
  if (v4)
  {
    id v5 = v4;
    for (i = 0; i != v5; ++i)
    {
      id v7 = [v3 objectAtIndexedSubscript:i];
      id v8 = [v7 stringByAppendingPathExtension:@"synced"];
      [v3 addObject:v8];
    }
  }

  return v3;
}

- (id)getPredicateForFileTypes:(id)a3 withExcludedPrefixes:(id)a4
{
  id v6 = a3;
  id v7 = [a4 arrayByAddingObjectsFromArray:&off_1000B05C0];
  if ((sub_100048604() & 1) == 0)
  {
    uint64_t v8 = [v7 arrayByAddingObjectsFromArray:&off_1000B05D8];

    id v7 = (void *)v8;
  }
  id v9 = [(SystemDiagnostic *)self getSubPredicateForPrefixes:v7];
  CFStringRef v10 = [(SystemDiagnostic *)self getSubPredicateForFileTypes:v6];

  BOOL v11 = +[NSString stringWithFormat:@"%@ AND %@", v9, v10];

  id v12 = +[NSPredicate predicateWithFormat:v11];

  return v12;
}

- (id)getSubPredicateForPrefixes:(id)a3
{
  id v3 = a3;
  uint64_t v14 = 0;
  id v15 = &v14;
  uint64_t v16 = 0x3032000000;
  long long v17 = sub_100016BEC;
  long long v18 = sub_100016BFC;
  id v19 = +[NSMutableString string];
  id v7 = _NSConcreteStackBlock;
  uint64_t v8 = 3221225472;
  id v9 = sub_100016C04;
  CFStringRef v10 = &unk_10009D200;
  id v13 = &v14;
  BOOL v11 = @"(NOT (SELF.lastPathComponent BEGINSWITH '%@'))";
  id v4 = v3;
  id v12 = v4;
  [v4 enumerateObjectsUsingBlock:&v7];
  id v5 = +[NSString stringWithFormat:@"(%@)", v15[5], v7, v8, v9, v10];

  _Block_object_dispose(&v14, 8);

  return v5;
}

- (id)getSubPredicateForFileTypes:(id)a3
{
  id v3 = [(SystemDiagnostic *)self includeSyncedExtensionForFileTypes:a3];
  uint64_t v14 = 0;
  id v15 = &v14;
  uint64_t v16 = 0x3032000000;
  long long v17 = sub_100016BEC;
  long long v18 = sub_100016BFC;
  id v19 = +[NSMutableString string];
  id v7 = _NSConcreteStackBlock;
  uint64_t v8 = 3221225472;
  id v9 = sub_100016DF4;
  CFStringRef v10 = &unk_10009D200;
  id v13 = &v14;
  BOOL v11 = @"SELF.lastPathComponent ENDSWITH '%@'";
  id v4 = v3;
  id v12 = v4;
  [v4 enumerateObjectsUsingBlock:&v7];
  id v5 = +[NSString stringWithFormat:@"(%@)", v15[5], v7, v8, v9, v10];

  _Block_object_dispose(&v14, 8);

  return v5;
}

- (id)_copyMobileInstallationLogsContainer
{
  id v3 = +[NSMutableArray array];
  id v4 = +[SDUnitLogDirectory logRuleWithDirectory:@"Library/Logs"];
  [v4 setMobileContainer:@"systemgroup.com.apple.mobile.installationhelperlogs"];
  [v4 setMobileContainerClass:1];
  id v5 = +[SDLogCollectionContainer containerWithName:@"MobileInstallation" destination:@"logs/MobileInstallation" withDelegate:self];
  id v6 = v5;
  if (v5)
  {
    [v5 setRuntimeChecks:8];
    id v7 = +[SDUnitLogGlob logRuleWithGlob:@"/private/var/installd/Library/Logs/MobileInstallation/mobile_installation{,_helper}.log.[01234]"];
    v10[0] = v7;
    v10[1] = v4;
    uint64_t v8 = +[NSArray arrayWithObjects:v10 count:2];
    [v6 addRules:v8];

    [v3 addObject:v6];
  }

  return v3;
}

- (id)getLogCopyingContainers
{
  id v3 = [(SystemDiagnostic *)self _iOSgetLogCopyingContainers];
  id v4 = [(SystemDiagnostic *)self getAutogenLogCopyingContainers];
  [v3 addObjectsFromArray:v4];

  return v3;
}

- (id)_iOSgetLogGenerationContainers
{
  id v3 = +[NSMutableArray array];
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v83 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Log Generation start\n", v83, 2u);
  }
  id v4 = +[SDResourceManager sharedResourceManager];
  [v4 log:@"Log Generation start\n"];

  id v5 = [(SystemDiagnostic *)self getACMToolContainer];
  [v3 addObjectsFromArray:v5];

  id v6 = [(SystemDiagnostic *)self getRemotectlContainer];
  [v3 addObjectsFromArray:v6];

  id v7 = [(SystemDiagnostic *)self getInternalLogsContainer];
  [v3 addObjectsFromArray:v7];

  uint64_t v8 = [(SystemDiagnostic *)self getclpcContainer];
  [v3 addObjectsFromArray:v8];

  id v9 = [(SystemDiagnostic *)self getclpcctrlContainer];
  [v3 addObjectsFromArray:v9];

  CFStringRef v10 = [(SystemDiagnostic *)self getLGSystemInfoContainer];
  [v3 addObjectsFromArray:v10];

  BOOL v11 = [(SystemDiagnostic *)self getGNIContainer];
  [v3 addObjectsFromArray:v11];

  id v12 = [(SystemDiagnostic *)self getCoreDuetLogs];
  [v3 addObjectsFromArray:v12];

  id v13 = [(SystemDiagnostic *)self getASPSnapshotsContainers];
  [v3 addObjectsFromArray:v13];

  uint64_t v14 = [(SystemDiagnostic *)self getProximityContainers];
  [v3 addObjectsFromArray:v14];

  id v15 = [(SystemDiagnostic *)self getSpuctlContainer];
  [v3 addObjectsFromArray:v15];

  uint64_t v16 = [(SystemDiagnostic *)self getASPTraceContainers];
  [v3 addObjectsFromArray:v16];

  long long v17 = [(SystemDiagnostic *)self getGestaltQueryContainer];
  [v3 addObjectsFromArray:v17];

  long long v18 = [(SystemDiagnostic *)self getc26ToolContainer];
  [v3 addObjectsFromArray:v18];

  id v19 = [(SystemDiagnostic *)self getLibnotifyContainer];
  [v3 addObjectsFromArray:v19];

  id v20 = [(SystemDiagnostic *)self getAopaudctlContainer];
  [v3 addObjectsFromArray:v20];

  id v21 = [(SystemDiagnostic *)self getAHSToolContainer];
  [v3 addObjectsFromArray:v21];

  id v22 = [(SystemDiagnostic *)self getSysCfgContainer];
  [v3 addObjectsFromArray:v22];

  id v23 = [(SystemDiagnostic *)self getMediaContainer];
  [v3 addObjectsFromArray:v23];

  id v24 = [(SystemDiagnostic *)self getSoundBoardContainer];
  [v3 addObjectsFromArray:v24];

  id v25 = [(SystemDiagnostic *)self getosvariantUtilContainer];
  [v3 addObjectsFromArray:v25];

  uint64_t v26 = [(SystemDiagnostic *)self getFreezerctlContainer];
  [v3 addObjectsFromArray:v26];

  NSFileAttributeKey v27 = [(SystemDiagnostic *)self getcontrolbitsContainer];
  [v3 addObjectsFromArray:v27];

  id v28 = [(SystemDiagnostic *)self getAOPFirmwareStateContainer];
  [v3 addObjectsFromArray:v28];

  id v29 = [(SystemDiagnostic *)self getCADebugContainer];
  [v3 addObjectsFromArray:v29];

  long long v30 = [(SystemDiagnostic *)self getEnumerateCrashReporterContainer];
  [v3 addObjectsFromArray:v30];

  long long v31 = [(SystemDiagnostic *)self getSelfCtlContainer];
  [v3 addObjectsFromArray:v31];

  long long v32 = [(SystemDiagnostic *)self getHomeUtilDumpAllContainer];
  [v3 addObjectsFromArray:v32];

  long long v33 = [(SystemDiagnostic *)self getHomeUtilAccessoryStateContainer];
  [v3 addObjectsFromArray:v33];

  id v34 = [(SystemDiagnostic *)self getExposureNotificationContainer];
  [v3 addObjectsFromArray:v34];

  v35 = [(SystemDiagnostic *)self getLGUtilitiesContainer];
  [v3 addObjectsFromArray:v35];

  v36 = [(SystemDiagnostic *)self getIDSContainer];
  [v3 addObjectsFromArray:v36];

  v37 = [(SystemDiagnostic *)self getIOREGContainer];
  [v3 addObjectsFromArray:v37];

  id v38 = [(SystemDiagnostic *)self getHIDReportContainers];
  [v3 addObjectsFromArray:v38];

  uint64_t v39 = [(SystemDiagnostic *)self getHIDRecorderdContainer];
  [v3 addObjectsFromArray:v39];

  uint64_t v40 = [(SystemDiagnostic *)self getStoreServicesContainer];
  [v3 addObjectsFromArray:v40];

  v41 = [(SystemDiagnostic *)self getSPIContainers];
  [v3 addObjectsFromArray:v41];

  v42 = [(SystemDiagnostic *)self getCoreCaptureSPIContainer];
  [v3 addObjectsFromArray:v42];

  id v43 = [(SystemDiagnostic *)self getBaseBandContainer];
  [v3 addObjectsFromArray:v43];

  v44 = [(SystemDiagnostic *)self getSoundAutoConfigContainer];
  [v3 addObjectsFromArray:v44];

  v45 = [(SystemDiagnostic *)self getMicrostackshotsWithPostContainers];
  [v3 addObjectsFromArray:v45];

  unsigned int v46 = [(SystemDiagnostic *)self getDSCSYMContainer];
  [v3 addObjectsFromArray:v46];

  v47 = [(SystemDiagnostic *)self getAirPlayContainer];
  [v3 addObjectsFromArray:v47];

  v48 = [(SystemDiagnostic *)self getGMSAvailabilityContainer];
  [v3 addObjectsFromArray:v48];

  v49 = [(SystemDiagnostic *)self getStspContainer];
  [v3 addObjectsFromArray:v49];

  uint64_t v50 = [(SystemDiagnostic *)self getCKKSCTLContainer];
  [v3 addObjectsFromArray:v50];

  v51 = [(SystemDiagnostic *)self getOTCTLContainer];
  [v3 addObjectsFromArray:v51];

  v52 = [(SystemDiagnostic *)self getPreferencesLogs];
  [v3 addObjectsFromArray:v52];

  v53 = [(SystemDiagnostic *)self getAppleInternalPreferencesLogs];
  [v3 addObjectsFromArray:v53];

  v54 = [(SystemDiagnostic *)self getExcResourceContainer];
  [v3 addObjectsFromArray:v54];

  v55 = [(SystemDiagnostic *)self getTimezoneDBLogs];
  [v3 addObjectsFromArray:v55];

  v56 = [(SystemDiagnostic *)self getPersonalizationLogs];
  [v3 addObjectsFromArray:v56];

  v57 = [(SystemDiagnostic *)self getlaunchdAndCTSContainers];
  [v3 addObjectsFromArray:v57];

  v58 = [(SystemDiagnostic *)self getApfsStatsContainer];
  [v3 addObjectsFromArray:v58];

  v59 = [(SystemDiagnostic *)self getRunningBoardLogs];
  [v3 addObjectsFromArray:v59];

  id v60 = [(SystemDiagnostic *)self getKeyboardPrefContainer];
  [v3 addObjectsFromArray:v60];

  uint64_t v61 = [(SystemDiagnostic *)self getAccessibilityPrefContainer];
  [v3 addObjectsFromArray:v61];

  id v62 = [(SystemDiagnostic *)self _copyBTLogsContainer];
  [v3 addObjectsFromArray:v62];

  v63 = [(SystemDiagnostic *)self getFDRDiagnosticContainer];
  [v3 addObjectsFromArray:v63];

  v64 = [(SystemDiagnostic *)self getASPMagazineContainer];
  [v3 addObjectsFromArray:v64];

  uint64_t v65 = [(SystemDiagnostic *)self getBatteryUIContainer];
  [v3 addObjectsFromArray:v65];

  v66 = [(SystemDiagnostic *)self getACLogsContainer];
  [v3 addObjectsFromArray:v66];

  unint64_t v67 = [(SystemDiagnostic *)self getTransparencyContainer];
  [v3 addObjectsFromArray:v67];

  v68 = [(SystemDiagnostic *)self getSWTransparencyContainer];
  [v3 addObjectsFromArray:v68];

  v69 = [(SystemDiagnostic *)self getBTPHYLogsContainer];
  [v3 addObjectsFromArray:v69];

  v70 = [(SystemDiagnostic *)self getswcutilContainer];
  [v3 addObjectsFromArray:v70];

  v71 = [(SystemDiagnostic *)self getTrialRolloutsContainer];
  [v3 addObjectsFromArray:v71];

  v72 = [(SystemDiagnostic *)self getFileProviderCTLContainer];
  [v3 addObjectsFromArray:v72];

  v73 = [(SystemDiagnostic *)self getWifiDextCorefilesContainer];
  [v3 addObjectsFromArray:v73];

  v74 = [(SystemDiagnostic *)self getBrctlContainer];
  [v3 addObjectsFromArray:v74];

  uint64_t v75 = [(SystemDiagnostic *)self getArkitctlContainer];
  [v3 addObjectsFromArray:v75];

  v76 = [(SystemDiagnostic *)self getDisplaytoolContainer];
  [v3 addObjectsFromArray:v76];

  long long v77 = [(SystemDiagnostic *)self getKCSharingContainer];
  [v3 addObjectsFromArray:v77];

  long long v78 = [(SystemDiagnostic *)self getRmdContainer];
  [v3 addObjectsFromArray:v78];

  long long v79 = [(SystemDiagnostic *)self getPommesStatusContainer];
  [v3 addObjectsFromArray:v79];

  long long v80 = [(SystemDiagnostic *)self getDiskTasksContainer];
  [v3 addObjectsFromArray:v80];

  v81 = [(SystemDiagnostic *)self getPowerLogContainer];
  [v3 addObjectsFromArray:v81];

  return v3;
}

- (id)getSelfCtlContainer
{
  uint64_t v2 = +[NSMutableArray array];
  [@"<TMPOUTPUTDIR>" stringByAppendingPathComponent:@"selfctl_tail.json"];
  v16[0] = @"tail";
  v16[1] = @"-r";
  v16[2] = @"1h";
  uint64_t v14 = v16[3] = @"-f";
  v16[4] = v14;
  v16[5] = @"--redact-tier1";
  v16[6] = @"--mobile-stream";
  id v3 = +[NSArray arrayWithObjects:v16 count:7];
  id v4 = +[SDTask taskWithCommand:@"/usr/local/bin/selfctl" arguments:v3 outputFile:@"selfctl_tail_stdout.txt"];
  v17[0] = v4;
  v15[0] = @"turns";
  v15[1] = @"-r";
  v15[2] = @"1h";
  void v15[3] = @"-d";
  v15[4] = @"<TMPOUTPUTDIR>";
  v15[5] = @"--redact-tier1";
  v15[6] = @"--mobile-stream";
  id v5 = (void *)v2;
  id v6 = +[NSArray arrayWithObjects:v15 count:7];
  id v7 = +[SDTask taskWithCommand:@"/usr/local/bin/selfctl" arguments:v6 outputFile:@"selfctl_turns_stdout.txt"];
  v17[1] = v7;
  uint64_t v8 = +[NSArray arrayWithObjects:v17 count:2];

  id v9 = +[SDComplexContainer complexContainerWithTasks:v8 withTimeout:&__NSArray0__struct withRules:@"logs/selfctl" atDestination:self withDelegate:1 isConcurrent:3.0];
  CFStringRef v10 = v9;
  if (v9)
  {
    BOOL v11 = [v9 taskContainer];
    [v11 setName:@"selfctl"];

    [v10 setRuntimeChecks:17];
    [v5 addObject:v10];
  }

  return v5;
}

- (id)getDisplaytoolContainer
{
  id v3 = +[NSMutableArray array];
  if (sub_100048C78())
  {
    id v4 = objc_alloc_init((Class)NSMutableArray);
    id v5 = objc_alloc_init((Class)NSMutableArray);
    if (sub_100048604())
    {
      id v6 = [@"logs/displaytool" stringByAppendingPathComponent:@"displaytool.txt"];
      CFStringRef v7 = @"/usr/local/bin/displaytool";
      uint64_t v8 = &off_1000B05F0;
    }
    else
    {
      id v6 = [@"logs/displaytool" stringByAppendingPathComponent:@"displaytool_rel.txt"];
      CFStringRef v7 = @"/usr/bin/displaytool_rel";
      uint64_t v8 = &off_1000B0608;
    }
    id v9 = +[SDTask taskWithCommand:v7 arguments:v8 outputFile:v6];
    [v4 addObject:v9];

    if ([(SystemDiagnostic *)self tconNvmDump])
    {
      CFStringRef v10 = +[SDTask taskWithCommand:@"/usr/bin/displaytool_rel" arguments:&off_1000B0620 outputFile:@"errors/tconNvmDump_errors.txt"];
      [v4 addObject:v10];

      BOOL v11 = +[SDUnitLogPathArray logRuleWithPaths:&off_1000B0638];
      [v5 addObject:v11];

      uint64_t v12 = 25;
      double v13 = 210.0;
    }
    else
    {
      double v13 = 5.0;
      uint64_t v12 = 5;
    }
    uint64_t v14 = +[SDComplexContainer complexContainerWithTasks:v4 withTimeout:v5 withRules:@"logs/displaytool" atDestination:self withDelegate:v13];
    id v15 = v14;
    if (v14)
    {
      uint64_t v16 = [v14 collectionContainer];
      [v16 setMaximumSizeMB:v12];

      [v15 setRuntimeChecks:16];
      long long v17 = [v15 taskContainer];
      [v17 setName:@"displaytool"];

      [v3 addObject:v15];
    }
  }

  return v3;
}

- (BOOL)shouldRunWifiDextCoreFilesCollection
{
  unsigned int v3 = sub_100048604();
  if (v3)
  {
    uint64_t v6 = 0;
    os_parse_boot_arg_int();
    unsigned int v3 = [(SystemDiagnostic *)self collectWifiDextCoreFiles];
    if (v3)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v5 = 0;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "cli argument passed - running wifi dext log collection", v5, 2u);
      }
      LOBYTE(v3) = 1;
    }
  }
  return v3;
}

- (id)getWifiDextCorefilesContainer
{
  unsigned int v3 = +[NSMutableArray array];
  if ([(SystemDiagnostic *)self shouldRunWifiDextCoreFilesCollection])
  {
    id v4 = +[SDTask taskWithCommand:@"/usr/local/bin/wifi_sysdiagnose.sh" arguments:&off_1000B0650 outputFile:@"errors/wifi_dext_errors.txt"];
    uint64_t v12 = v4;
    id v5 = +[NSArray arrayWithObjects:&v12 count:1];

    uint64_t v6 = +[SDComplexContainer complexContainerWithTasks:v5 withTimeout:&__NSArray0__struct withRules:@"logs/wifi_dext_core_files" atDestination:self withDelegate:5.0];
    CFStringRef v7 = v6;
    if (v6)
    {
      uint64_t v8 = [v6 collectionContainer];
      [v8 setMaximumSizeMB:0];

      [v7 setRuntimeChecks:17];
      id v9 = [v7 taskContainer];
      [v9 setName:@"wifi dext core files"];

      [v3 addObject:v7];
    }
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)BOOL v11 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Skipping wifi dext log collection", v11, 2u);
  }

  return v3;
}

- (id)getArkitctlContainer
{
  unsigned int v3 = +[NSMutableArray array];
  id v4 = +[SDTaskDepotContainer containerWithName:@"arkitctl" destination:0 withTimeout:1 withConcurrency:self withDelegate:5.0];
  id v5 = v4;
  if (v4)
  {
    [v4 setRuntimeChecks:17];
    uint64_t v6 = +[SDTask taskWithCommand:@"/usr/local/bin/arkitctl" arguments:&off_1000B0668 outputFile:@"arkitctl.txt"];
    id v9 = v6;
    CFStringRef v7 = +[NSArray arrayWithObjects:&v9 count:1];
    [v5 addSDTasksToContainer:v7];

    [v3 addObject:v5];
  }

  return v3;
}

- (id)getSPIContainers
{
  unsigned int v3 = +[NSMutableArray array];
  id v4 = +[SDComplexContainer complexContainerWithSPITask:7 withTimeout:@"logs/AWD" atDestination:self withDelegate:10.0];
  id v5 = v4;
  if (v4)
  {
    [v4 setRuntimeChecks:17];
    [v3 addObject:v5];
  }
  uint64_t v6 = +[SDComplexContainer complexContainerWithSPITask:30 withTimeout:@"logs/NetworkRelay" atDestination:self withDelegate:10.0];
  CFStringRef v7 = v6;
  if (v6)
  {
    [v6 setRuntimeChecks:16];
    [v3 addObject:v7];
  }

  return v3;
}

- (id)getHIDRecorderdContainer
{
  unsigned int v3 = +[NSMutableArray array];
  id v4 = +[SDTask taskWithCommand:@"/usr/local/libexec/hidrecorderd.internal" arguments:&off_1000B0680 outputFile:0];
  double v13 = v4;
  id v5 = +[NSArray arrayWithObjects:&v13 count:1];

  uint64_t v6 = +[SDUnitLogDirectory logRuleWithDirectory:@"/private/var/logs/CrashReporter/hidrecorderd"];
  uint64_t v12 = v6;
  CFStringRef v7 = +[NSArray arrayWithObjects:&v12 count:1];

  uint64_t v8 = +[SDComplexContainer complexContainerWithTasks:v5 withTimeout:v7 withRules:@"logs/hidrecorderd" atDestination:self withDelegate:5.0];
  if (v8)
  {
    if (sub_100024970()) {
      uint64_t v9 = 20;
    }
    else {
      uint64_t v9 = 2048;
    }
    if (sub_100048604()) {
      uint64_t v10 = 17;
    }
    else {
      uint64_t v10 = v9;
    }
    [v8 setRuntimeChecks:v10];
    [v3 addObject:v8];
  }

  return v3;
}

- (id)getStspContainer
{
  unsigned int v3 = +[NSMutableArray array];
  id v4 = +[SDTaskDepotContainer containerWithName:@"Stsp" destination:0 withTimeout:1 withConcurrency:self withDelegate:8.0];
  id v5 = v4;
  if (v4)
  {
    [v4 setRuntimeChecks:17];
    uint64_t v6 = +[SDTask taskWithCommand:@"/usr/local/bin/stsp_tool" arguments:&off_1000B0698 outputFile:@"Stsp.txt"];
    uint64_t v9 = v6;
    CFStringRef v7 = +[NSArray arrayWithObjects:&v9 count:1];
    [v5 addSDTasksToContainer:v7];

    [v3 addObject:v5];
  }

  return v3;
}

- (id)getExposureNotificationContainer
{
  unsigned int v3 = +[NSMutableArray array];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10001AF2C;
  v9[3] = &unk_10009D290;
  v9[4] = self;
  id v4 = objc_retainBlock(v9);
  id v5 = +[SDComplexContainer complexContainerWithBlock:v4 withTimeout:@"ExposureNotification" atDestination:self withDelegate:6.0];
  uint64_t v6 = v5;
  if (v5)
  {
    CFStringRef v7 = [v5 collectionContainer];
    [v7 setMaximumSizeMB:100];

    [v3 addObject:v6];
  }

  return v3;
}

- (id)getBaseBandContainer
{
  unsigned int v3 = +[NSMutableArray array];
  if ([(SystemDiagnostic *)self requestSource] == 1)
  {
    +[SDTask taskWithCommand:@"/usr/bin/abmlite" arguments:&off_1000B06B0 outputFile:@"ambtool_output.log"];
    uint64_t v9 = _NSConcreteStackBlock;
    uint64_t v10 = 3221225472;
    BOOL v11 = sub_10001B514;
    uint64_t v12 = &unk_10009D2B8;
    double v13 = self;
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    id v14 = v4;
    id v5 = +[SDTaskDepotContainer containerWithName:@"basebandMeta" destination:@"logs/Baseband" withTimeout:1 withConcurrency:self withDelegate:&v9 withCompletionBlock:7.0];
    if (v5)
    {
      id v15 = v4;
      uint64_t v6 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v15, 1, v9, v10, v11, v12, v13);
      [v5 addSDTasksToContainer:v6];

      if (sub_100048604()) {
        uint64_t v7 = 2064;
      }
      else {
        uint64_t v7 = 16;
      }
      [v5 setRuntimeChecks:v7];
      [v3 addObject:v5];
    }
  }

  return v3;
}

- (id)getSoundAutoConfigContainer
{
  unsigned int v3 = +[NSMutableArray array];
  id v4 = +[SDComplexContainer complexContainerWithBlock:&stru_10009D2F8 withTimeout:@"logs/SoundAutoConfig" atDestination:self withDelegate:5.0];
  id v5 = v4;
  if (v4)
  {
    [v4 setRuntimeChecks:17];
    [v5 setRuntimeChecks:[v5 runtimeChecks] | 0x1000];
    uint64_t v6 = [v5 collectionContainer];
    uint64_t v7 = +[SDUnitLogGlob logRuleWithGlob:@"/private/var/mobile/Library/Logs/CrashReporter/SoundAutoConfig/SoundAutoConfig_StateDump*.plist"];
    uint64_t v10 = v7;
    uint64_t v8 = +[NSArray arrayWithObjects:&v10 count:1];
    [v6 addRules:v8];

    [v3 addObject:v5];
  }

  return v3;
}

- (id)getStoreServicesContainer
{
  unsigned int v3 = +[NSMutableArray array];
  id v4 = +[SDTask taskWithCommand:@"/usr/local/bin/asclient" arguments:&off_1000B06C8 outputFile:0];
  v14[0] = v4;
  id v5 = +[SDTask taskWithCommand:@"/bin/sleep" arguments:&off_1000B06E0 outputFile:0];
  v14[1] = v5;
  uint64_t v6 = +[SDTask taskWithCommand:@"/usr/local/bin/asclient" arguments:&off_1000B06F8 outputFile:@"asclient_dump.txt"];
  v14[2] = v6;
  uint64_t v7 = +[NSArray arrayWithObjects:v14 count:3];

  uint64_t v8 = +[NSPredicate predicateWithFormat:@"pathExtension IN %@", @"har"];
  uint64_t v9 = +[SDUnitLogDirectory logRuleWithDirectory:@"/private/var/mobile/Library/Logs/com.apple.StoreServices/HTTPArchives" withDepth:0 withDate:0 withFilter:v8 newestFileCount:0 atInternalDirectory:0 withRuntimeChecks:1];
  double v13 = v9;
  uint64_t v10 = +[NSArray arrayWithObjects:&v13 count:1];

  BOOL v11 = +[SDComplexContainer complexContainerWithTasks:v7 withTimeout:v10 withRules:@"logs/StoreServices" atDestination:self withDelegate:10.0];
  [v11 setRuntimeChecks:[v11 runtimeChecks] | 0x10];
  if (v11) {
    [v3 addObject:v11];
  }

  return v3;
}

- (id)getHIDReportContainers
{
  unsigned int v3 = +[NSMutableArray array];
  id v4 = +[SDTaskDepotContainer containerWithName:@"hidreport" destination:0 withTimeout:0 withConcurrency:self withDelegate:5.0];
  id v5 = v4;
  if (v4)
  {
    long long v18 = v4;
    [v4 setRuntimeChecks:17];
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v6 = [&off_1000B0710 countByEnumeratingWithState:&v19 objects:v26 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v17 = *(void *)v20;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v20 != v17) {
            objc_enumerationMutation(&off_1000B0710);
          }
          uint64_t v9 = *(void **)(*((void *)&v19 + 1) + 8 * i);
          uint64_t v10 = [v9 stringByAppendingString:@": \n"];
          id v24 = v10;
          BOOL v11 = +[NSArray arrayWithObjects:&v24 count:1];
          uint64_t v12 = +[SDTask taskWithCommand:@"/bin/echo" arguments:v11 outputFile:@"hidreport.log"];
          v25[0] = v12;
          v23[0] = @"--pid";
          v23[1] = @"619";
          v23[2] = @"-u";
          v23[3] = @"0xff00,0x000b";
          v23[4] = @"get";
          v23[5] = v9;
          double v13 = +[NSArray arrayWithObjects:v23 count:6];
          id v14 = +[SDTask taskWithCommand:@"/usr/local/bin/hidreport" arguments:v13 outputFile:@"hidreport.log"];
          v25[1] = v14;
          id v15 = +[NSArray arrayWithObjects:v25 count:2];
          [v18 addSDTasksToContainer:v15];
        }
        id v7 = [&off_1000B0710 countByEnumeratingWithState:&v19 objects:v26 count:16];
      }
      while (v7);
    }
    id v5 = v18;
    [v3 addObject:v18];
  }

  return v3;
}

- (id)getProximityContainers
{
  unsigned int v3 = +[NSMutableArray array];
  id v4 = +[SDComplexContainer complexContainerWithSPITask:38 withTimeout:@"Proximity" atDestination:self withDelegate:5.0];
  if (v4)
  {
    id v5 = objc_alloc((Class)NSMutableArray);
    id v6 = +[SDUnitLogDirectory logRuleWithDirectory:@"/private/var/mobile/Library/Logs/CrashReporter/Rose/"];
    v17[0] = v6;
    id v7 = +[SDUnitLogGlob logRuleWithGlob:@"/private/var/db/nearbyd/nearbyd-*.protobuf.log"];
    v17[1] = v7;
    uint64_t v8 = +[NSArray arrayWithObjects:v17 count:2];
    id v9 = [v5 initWithArray:v8];

    uint64_t v10 = sub_1000284E0(@"systemgroup.com.apple.nearbyd.datastore");
    BOOL v11 = v10;
    if (v10)
    {
      uint64_t v12 = [v10 stringByAppendingString:@"/Library/nearbyd-*.protobuf.log"];
      double v13 = +[SDUnitLogGlob logRuleWithGlob:v12];
      [v9 addObject:v13];
    }
    [v4 setRuntimeChecks:16];
    id v14 = [v4 collectionContainer];
    [v14 addRules:v9];

    id v15 = [v4 collectionContainer];
    [v15 setGenerateSummary:1];

    [v3 addObject:v4];
  }

  return v3;
}

- (id)getSpuctlContainer
{
  unsigned int v3 = +[NSMutableArray array];
  id v4 = +[SDTaskDepotContainer containerWithName:@"spuctl" destination:0 withTimeout:1 withConcurrency:self withDelegate:5.0];
  id v5 = v4;
  if (v4)
  {
    [v4 setRuntimeChecks:16];
    id v6 = +[SDTask taskWithCommand:@"/usr/local/bin/spuctl" arguments:&off_1000B0728 outputFile:@"spuctl.txt"];
    id v9 = v6;
    id v7 = +[NSArray arrayWithObjects:&v9 count:1];
    [v5 addSDTasksToContainer:v7];

    [v3 addObject:v5];
  }

  return v3;
}

- (id)getBTPHYLogsContainer
{
  unsigned int v3 = +[NSMutableArray array];
  id v4 = +[SDComplexContainer complexContainerWithSPITask:11 withTimeout:@"BTPHY" atDestination:self withDelegate:5.0];
  id v5 = v4;
  if (v4)
  {
    [v4 setRuntimeChecks:16];
    id v6 = [v5 collectionContainer];
    id v7 = +[SDUnitLogDirectory logRuleWithDirectory:@"/private/var/mobile/Library/Logs/CrashReporter/CoreCapture/AppleBTC-BTPHY-sysdiagnose"];
    BOOL v11 = v7;
    uint64_t v8 = +[NSArray arrayWithObjects:&v11 count:1];
    [v6 addRules:v8];

    id v9 = [v5 collectionContainer];
    [v9 setGenerateSummary:1];

    [v3 addObject:v5];
  }

  return v3;
}

- (id)getHomeUtilDumpAllContainer
{
  unsigned int v3 = +[NSMutableArray array];
  id v4 = +[SDTaskDepotContainer containerWithName:@"HomeUtilDumpAll" destination:0 withTimeout:1 withConcurrency:self withDelegate:10.0];
  id v5 = v4;
  if (v4)
  {
    [v4 setRuntimeChecks:17];
    id v6 = +[SDTask taskWithCommand:@"/usr/local/bin/homeutil" arguments:&off_1000B0740 outputFile:@"homeutil_dump_all.txt"];
    id v9 = v6;
    id v7 = +[NSArray arrayWithObjects:&v9 count:1];
    [v5 addSDTasksToContainer:v7];

    [v3 addObject:v5];
  }

  return v3;
}

- (id)getHomeUtilAccessoryStateContainer
{
  unsigned int v3 = +[NSMutableArray array];
  id v4 = +[SDTaskDepotContainer containerWithName:@"HomeUtilDumpAccessoryState" destination:0 withTimeout:1 withConcurrency:self withDelegate:10.0];
  id v5 = v4;
  if (v4)
  {
    [v4 setRuntimeChecks:17];
    id v6 = +[SDTask taskWithCommand:@"/usr/local/bin/homeutil" arguments:&off_1000B0758 outputFile:@"homeutil_dump_accessory_state.txt"];
    id v9 = v6;
    id v7 = +[NSArray arrayWithObjects:&v9 count:1];
    [v5 addSDTasksToContainer:v7];

    [v3 addObject:v5];
  }

  return v3;
}

- (id)getASPTraceContainers
{
  unsigned int v3 = +[NSMutableArray array];
  id v4 = +[SDComplexContainer complexContainerWithSPITask:6 withTimeout:@"ASPSnapshots" atDestination:self withDelegate:5.0];
  id v5 = v4;
  if (v4)
  {
    [v4 setRuntimeChecks:17];
    id v6 = [v5 collectionContainer];
    [v6 setGenerateSummary:1];

    [v3 addObject:v5];
  }

  return v3;
}

- (id)getc26ToolContainer
{
  unsigned int v3 = +[NSMutableArray array];
  id v4 = +[SDTaskDepotContainer containerWithName:@"c26tool" destination:0 withTimeout:1 withConcurrency:self withDelegate:5.0];
  id v5 = v4;
  if (v4)
  {
    [v4 setRuntimeChecks:17];
    id v6 = +[SDTask taskWithCommand:@"/usr/local/bin/c26tool" arguments:&off_1000B0770 outputFile:@"c26tool.txt"];
    id v9 = v6;
    id v7 = +[NSArray arrayWithObjects:&v9 count:1];
    [v5 addSDTasksToContainer:v7];

    [v3 addObject:v5];
  }

  return v3;
}

- (id)getAHSToolContainer
{
  unsigned int v3 = +[NSMutableArray array];
  id v4 = +[SDTaskDepotContainer containerWithName:@"AHSTool" destination:0 withTimeout:1 withConcurrency:self withDelegate:5.0];
  id v5 = v4;
  if (v4)
  {
    [v4 setRuntimeChecks:17];
    id v6 = +[SDTask taskWithCommand:@"/usr/local/bin/AHSTool" arguments:&off_1000B0788 outputFile:@"ahstool.txt"];
    id v9 = v6;
    id v7 = +[NSArray arrayWithObjects:&v9 count:1];
    [v5 addSDTasksToContainer:v7];

    [v3 addObject:v5];
  }

  return v3;
}

- (id)getMediaContainer
{
  unsigned int v3 = +[NSMutableArray array];
  id v4 = +[SDTaskDepotContainer containerWithName:@"mediaremotetool" destination:0 withTimeout:1 withConcurrency:self withDelegate:5.0];
  id v5 = v4;
  if (v4)
  {
    [v4 setRuntimeChecks:17];
    id v6 = +[SDTask taskWithCommand:@"/usr/local/bin/mediaremotetool" arguments:&off_1000B07A0 outputFile:@"mediaremote.txt"];
    id v9 = v6;
    id v7 = +[NSArray arrayWithObjects:&v9 count:1];
    [v5 addSDTasksToContainer:v7];

    [v3 addObject:v5];
  }

  return v3;
}

- (id)getSoundBoardContainer
{
  unsigned int v3 = +[NSMutableArray array];
  id v4 = +[SDTaskDepotContainer containerWithName:@"SoundBoard" destination:0 withTimeout:1 withConcurrency:self withDelegate:5.0];
  id v5 = v4;
  if (v4)
  {
    [v4 setRuntimeChecks:17];
    id v6 = +[SDTask taskWithCommand:@"/usr/local/bin/soundboardtool" arguments:&off_1000B07B8 outputFile:@"soundboard_state.txt"];
    id v9 = v6;
    id v7 = +[NSArray arrayWithObjects:&v9 count:1];
    [v5 addSDTasksToContainer:v7];

    [v3 addObject:v5];
  }

  return v3;
}

- (id)getFreezerctlContainer
{
  unsigned int v3 = +[NSMutableArray array];
  id v4 = +[SDTaskDepotContainer containerWithName:@"Freezerctl" destination:0 withTimeout:1 withConcurrency:self withDelegate:5.0];
  id v5 = v4;
  if (v4)
  {
    [v4 setRuntimeChecks:17];
    id v6 = +[SDTask taskWithCommand:@"/usr/local/bin/freezerctl" arguments:0 outputFile:@"freezerctl_status.txt"];
    id v9 = v6;
    id v7 = +[NSArray arrayWithObjects:&v9 count:1];
    [v5 addSDTasksToContainer:v7];

    [v3 addObject:v5];
  }

  return v3;
}

- (id)getAOPFirmwareStateContainer
{
  unsigned int v3 = +[NSMutableArray array];
  id v4 = +[SDTaskDepotContainer containerWithName:@"AOPFirmwareState" destination:0 withTimeout:0 withConcurrency:self withDelegate:5.0];
  id v5 = v4;
  if (v4)
  {
    [v4 setRuntimeChecks:17];
    id v6 = +[SDTask taskWithCommand:@"/usr/local/bin/aopvtctl" arguments:&off_1000B07D0 outputFile:@"aopvtctl_dump.txt"];
    v10[0] = v6;
    id v7 = +[SDTask taskWithCommand:@"/usr/local/bin/aopenvsctl" arguments:&off_1000B07E8 outputFile:@"aopenvsctl_dump.txt"];
    v10[1] = v7;
    uint64_t v8 = +[NSArray arrayWithObjects:v10 count:2];
    [v5 addSDTasksToContainer:v8];

    [v3 addObject:v5];
  }

  return v3;
}

- (id)getPbctlUserprofilesContainer
{
  unsigned int v3 = +[NSMutableArray array];
  id v4 = +[SDTaskDepotContainer containerWithName:@"pbctl" destination:0 withTimeout:1 withConcurrency:self withDelegate:5.0];
  id v5 = v4;
  if (v4)
  {
    [v4 setRuntimeChecks:17];
    id v6 = +[SDTask taskWithCommand:@"/usr/local/bin/pbctl" arguments:&off_1000B0800 outputFile:@"pbctl_userprofiles_list.txt"];
    id v9 = v6;
    id v7 = +[NSArray arrayWithObjects:&v9 count:1];
    [v5 addSDTasksToContainer:v7];

    [v3 addObject:v5];
  }

  return v3;
}

- (id)getAccessibilityPrefContainer
{
  unsigned int v3 = +[NSMutableArray array];
  id v4 = +[SDComplexContainer complexContainerWithSPITask:1 withTimeout:@"Preferences" atDestination:self withDelegate:10.0];
  id v5 = v4;
  if (v4)
  {
    [v4 setRuntimeChecks:16];
    [v3 addObject:v5];
  }

  return v3;
}

- (id)getExcResourceContainer
{
  unsigned int v3 = +[NSMutableArray array];
  id v4 = +[SDComplexContainer complexContainerWithSPITask:20 withTimeout:@"crashes_and_spins" atDestination:self withDelegate:5.0];
  id v5 = v4;
  if (v4)
  {
    [v4 setRuntimeChecks:16];
    id v6 = [v5 collectionContainer];
    [v6 setMaximumSizeMB:10];

    [v3 addObject:v5];
  }

  return v3;
}

- (id)getEnumerateCrashReporterContainer
{
  unsigned int v3 = +[NSMutableArray array];
  id v4 = +[SDTaskDepotContainer containerWithName:@"Enumerate CrashReporter" destination:@"crashes_and_spins" withTimeout:1 withConcurrency:self withDelegate:5.0];
  id v5 = v4;
  if (v4)
  {
    [v4 setRuntimeChecks:16];
    id v6 = sub_1000280F0(0);
    v11[0] = v6;
    v11[1] = @"-ls";
    id v7 = +[NSArray arrayWithObjects:v11 count:2];
    uint64_t v8 = +[SDTask taskWithCommand:@"/usr/bin/find" arguments:v7 outputFile:@"enumerated_CrashReporter.txt"];
    uint64_t v12 = v8;
    id v9 = +[NSArray arrayWithObjects:&v12 count:1];
    [v5 addSDTasksToContainer:v9];

    [v3 addObject:v5];
  }

  return v3;
}

- (id)getDiskTasksContainer
{
  unsigned int v3 = +[NSMutableArray array];
  id v4 = +[SDTaskDepotContainer containerWithName:@"disks-concurrent" destination:0 withTimeout:1 withConcurrency:self withDelegate:5.0];
  id v5 = v4;
  if (v4)
  {
    [v4 setRuntimeChecks:17];
    id v6 = +[SDTask taskWithCommand:@"/usr/local/bin/diskutil" arguments:&off_1000B0818 outputFile:@"diskutil_list.txt"];
    id v9 = v6;
    id v7 = +[NSArray arrayWithObjects:&v9 count:1];
    [v5 addSDTasksToContainer:v7];

    [v3 addObject:v5];
  }

  return v3;
}

- (id)getACLogsContainer
{
  unsigned int v3 = +[NSMutableArray array];
  id v4 = +[SDComplexContainer complexContainerWithSPITask:2 withTimeout:@"logs/ACLogs" atDestination:self withDelegate:5.0];
  id v5 = v4;
  if (v4)
  {
    [v4 setRuntimeChecks:16];
    [v3 addObject:v5];
  }

  return v3;
}

- (id)getAopaudctlContainer
{
  unsigned int v3 = +[NSMutableArray array];
  id v4 = +[SDTaskDepotContainer containerWithName:@"aopaudctl" destination:0 withTimeout:1 withConcurrency:self withDelegate:5.0];
  id v5 = v4;
  if (v4)
  {
    [v4 setRuntimeChecks:17];
    id v6 = +[SDTask taskWithCommand:@"/usr/local/bin/aopaudctl" arguments:&off_1000B0830 outputFile:@"aopaudctl_dump.txt"];
    id v9 = v6;
    id v7 = +[NSArray arrayWithObjects:&v9 count:1];
    [v5 addSDTasksToContainer:v7];

    [v3 addObject:v5];
  }

  return v3;
}

- (id)getACMToolContainer
{
  unsigned int v3 = +[NSMutableArray array];
  id v4 = +[SDTaskDepotContainer containerWithName:@"ACMTool" destination:0 withTimeout:1 withConcurrency:self withDelegate:5.0];
  id v5 = v4;
  if (v4)
  {
    [v4 setRuntimeChecks:17];
    id v6 = +[SDTask taskWithCommand:@"/usr/local/bin/ACMTool" arguments:&off_1000B0848 outputFile:@"ACMTool.txt"];
    id v9 = v6;
    id v7 = +[NSArray arrayWithObjects:&v9 count:1];
    [v5 addSDTasksToContainer:v7];

    [v3 addObject:v5];
  }

  return v3;
}

- (id)_copyBTLogsContainer
{
  unsigned int v3 = +[NSMutableArray array];
  id v4 = +[SDComplexContainer complexContainerWithSPITask:13 withTimeout:@"logs/Bluetooth/CoreCapture" atDestination:self withDelegate:10.0];
  id v5 = v4;
  if (v4)
  {
    [v4 setRuntimeChecks:16];
    id v6 = [v5 collectionContainer];
    [v6 setGenerateSummary:1];

    id v7 = [v5 collectionContainer];
    [v7 setMaximumSizeMB:15];

    [v3 addObject:v5];
  }

  return v3;
}

- (id)getSysCfgContainer
{
  unsigned int v3 = +[NSMutableArray array];
  id v4 = +[SDTaskDepotContainer containerWithName:@"syscfg" destination:0 withTimeout:0 withConcurrency:self withDelegate:5.0];
  id v5 = v4;
  if (v4)
  {
    [v4 setRuntimeChecks:17];
    id v6 = +[SDTask taskWithCommand:@"/usr/local/bin/sysconfig" arguments:&off_1000B0860 outputFile:@"sysconfig.log"];
    v10[0] = v6;
    id v7 = +[SDTask taskWithCommand:@"/usr/local/bin/sysconfig" arguments:&off_1000B0878 outputFile:@"sysconfig_debug.log"];
    v10[1] = v7;
    uint64_t v8 = +[NSArray arrayWithObjects:v10 count:2];
    [v5 addSDTasksToContainer:v8];

    [v3 addObject:v5];
  }

  return v3;
}

- (id)getLibnotifyContainer
{
  unsigned int v3 = +[NSMutableArray array];
  id v4 = +[SDComplexContainer complexContainerWithSPITask:27 withTimeout:@"logs/libnotify" atDestination:self withDelegate:5.0];
  id v5 = v4;
  if (v4)
  {
    [v4 setRuntimeChecks:17];
    [v3 addObject:v5];
  }

  return v3;
}

- (id)getBatteryUIContainer
{
  unsigned int v3 = +[NSMutableArray array];
  id v4 = +[SDComplexContainer complexContainerWithSPITask:10 withTimeout:@"logs/BatteryUIPlist" atDestination:self withDelegate:10.0];
  id v5 = v4;
  if (v4)
  {
    [v4 setRuntimeChecks:16];
    [v3 addObject:v5];
  }

  return v3;
}

- (id)getTrialRolloutsContainer
{
  unsigned int v3 = +[NSMutableArray array];
  id v4 = +[SDComplexContainer complexContainerWithSPITask:52 withTimeout:@"logs/Trial" atDestination:self withDelegate:5.0];
  id v5 = v4;
  if (v4)
  {
    [v4 setRuntimeChecks:16];
    [v3 addObject:v5];
  }

  return v3;
}

- (id)getTimezoneDBLogs
{
  unsigned int v3 = +[NSMutableArray array];
  id v4 = +[SDComplexContainer complexContainerWithSPITask:51 withTimeout:@"TimezoneDB" atDestination:self withDelegate:5.0];
  id v5 = v4;
  if (v4)
  {
    [v4 setRuntimeChecks:16];
    id v6 = [v5 collectionContainer];
    [v6 setGenerateSummary:1];

    [v3 addObject:v5];
  }
  id v7 = +[SDTaskDepotContainer containerWithName:@"timezonedb" destination:@"TimezoneDB" withTimeout:1 withConcurrency:self withDelegate:5.0];
  uint64_t v8 = v7;
  if (v7)
  {
    [v7 setRuntimeChecks:17];
    id v9 = +[SDTask taskWithCommand:@"/bin/ls" arguments:&off_1000B0890 outputFile:@"timezone_db.log"];
    uint64_t v12 = v9;
    uint64_t v10 = +[NSArray arrayWithObjects:&v12 count:1];
    [v8 addSDTasksToContainer:v10];

    [v3 addObject:v8];
  }

  return v3;
}

- (id)getPreferencesLogs
{
  unsigned int v3 = +[NSMutableArray array];
  id v4 = +[SDComplexContainer complexContainerWithSPITask:34 withTimeout:@"Preferences" atDestination:self withDelegate:20.0];
  id v5 = v4;
  if (v4)
  {
    [v4 setRuntimeChecks:16];
    id v6 = [v5 collectionContainer];
    [v6 setGenerateSummary:1];

    id v7 = [v5 collectionContainer];
    uint64_t v8 = +[SDUnitLogPathArray logRuleWithPaths:&off_1000B08A8];
    BOOL v11 = v8;
    id v9 = +[NSArray arrayWithObjects:&v11 count:1];
    [v7 addRules:v9];

    [v3 addObject:v5];
  }

  return v3;
}

- (id)getAppleInternalPreferencesLogs
{
  unsigned int v3 = +[NSMutableArray array];
  id v4 = +[SDComplexContainer complexContainerWithSPITask:35 withTimeout:@"Preferences" atDestination:self withDelegate:20.0];
  id v5 = v4;
  if (v4)
  {
    [v4 setRuntimeChecks:17];
    id v6 = [v5 collectionContainer];
    [v6 setGenerateSummary:1];

    [v3 addObject:v5];
  }

  return v3;
}

- (id)getPersonalizationLogs
{
  unsigned int v3 = +[NSMutableArray array];
  id v4 = +[SDComplexContainer complexContainerWithSPITask:32 withTimeout:@"Personalization" atDestination:self withDelegate:5.0];
  id v5 = v4;
  if (v4)
  {
    [v4 setRuntimeChecks:16];
    id v6 = [v5 collectionContainer];
    [v6 setGenerateSummary:1];

    [v3 addObject:v5];
  }

  return v3;
}

- (id)getRunningBoardLogs
{
  unsigned int v3 = +[NSMutableArray array];
  id v4 = +[SDComplexContainer complexContainerWithSPITask:39 withTimeout:@"RunningBoard" atDestination:self withDelegate:10.0];
  id v5 = v4;
  if (v4)
  {
    [v4 setRuntimeChecks:16];
    id v6 = [v5 collectionContainer];
    [v6 setGenerateSummary:1];

    [v3 addObject:v5];
  }

  return v3;
}

- (id)getRemotectlContainer
{
  unsigned int v3 = +[NSMutableArray array];
  id v4 = +[SDTaskDepotContainer containerWithName:@"remotectl" destination:0 withTimeout:1 withConcurrency:self withDelegate:5.0];
  id v5 = v4;
  if (v4)
  {
    [v4 setRuntimeChecks:16];
    id v6 = +[SDTask taskWithCommand:@"/usr/libexec/remotectl" arguments:&off_1000B08C0 outputFile:@"remotectl_dumpstate.txt"];
    id v9 = v6;
    id v7 = +[NSArray arrayWithObjects:&v9 count:1];
    [v5 addSDTasksToContainer:v7];

    [v3 addObject:v5];
  }

  return v3;
}

- (id)getCoreDuetLogs
{
  unsigned int v3 = +[NSMutableArray array];
  id v4 = +[SDTaskDepotContainer containerWithName:@"coreduet" destination:@"logs/coreduet" withTimeout:1 withConcurrency:self withDelegate:8.0];
  id v5 = v4;
  if (v4)
  {
    [v4 setRuntimeChecks:17];
    id v6 = +[SDTask taskWithCommand:@"/usr/local/bin/cdknowledgetool" arguments:&off_1000B08D8 outputFile:@"cdknowledgetool.log"];
    id v7 = +[SDTask taskWithCommand:@"/usr/local/bin/cdknowledgetool", &off_1000B08F0, @"cdknowledgetool_syncstream.log", v6 arguments outputFile];
    v13[1] = v7;
    uint64_t v8 = +[SDTask taskWithCommand:@"/usr/local/bin/cdknowledgetool" arguments:&off_1000B0908 asUID:sub_100024418() outputFile:@"cdknowledgetool_stats.log"];
    void v13[2] = v8;
    id v9 = +[SDTask taskWithCommand:@"/usr/local/bin/cdcontexttool" arguments:&off_1000B0920 outputFile:@"cdcontexttool_dumpregistrations.log"];
    v13[3] = v9;
    uint64_t v10 = +[SDTask shellTaskWithCommand:@"/usr/local/bin/cdinteracttool summarizeData | /usr/bin/grep -E -v \"Accounts:|Data\" outputFile:@"cdinteracttool.log""];
    v13[4] = v10;
    BOOL v11 = +[NSArray arrayWithObjects:v13 count:5];
    [v5 addSDTasksToContainer:v11];

    [v3 addObject:v5];
  }

  return v3;
}

- (id)getlaunchdContainer
{
  unsigned int v3 = +[NSMutableArray array];
  id v4 = +[SDLogCollectionContainer containerWithName:@"launchdLogs" destination:@"logs/launchd" withDelegate:self];
  id v5 = v4;
  if (v4)
  {
    [v4 setRuntimeChecks:17];
    [v5 setMaximumSizeMB:20];
    id v25 = v3;
    id v24 = [@"/private/var/log/com.apple.xpc.launchd" stringByAppendingPathComponent:@"*.crash"];
    id v23 = +[SDUnitLogGlob logRuleWithGlob:v24];
    v27[0] = v23;
    long long v22 = [@"/private/var/log/com.apple.xpc.launchd" stringByAppendingPathComponent:@"*.ips"];
    long long v21 = +[SDUnitLogGlob logRuleWithGlob:v22];
    v27[1] = v21;
    long long v20 = [@"/private/var/log/com.apple.xpc.launchd" stringByAppendingPathComponent:@"*.shutdowntimeout"];
    long long v19 = +[SDUnitLogGlob logRuleWithGlob:v20];
    v27[2] = v19;
    long long v18 = [@"/private/var/log/com.apple.xpc.launchd" stringByAppendingPathComponent:@"launchd.log"];
    v26[0] = v18;
    uint64_t v17 = [@"/private/var/log/com.apple.xpc.launchd" stringByAppendingPathComponent:@"launchd.log.1"];
    v26[1] = v17;
    uint64_t v16 = [@"/private/var/log/com.apple.xpc.launchd" stringByAppendingPathComponent:@"launchd.log.2"];
    v26[2] = v16;
    id v6 = +[NSArray arrayWithObjects:v26 count:3];
    id v7 = +[SDUnitLogPathArray logRuleWithPaths:v6];
    v27[3] = v7;
    uint64_t v8 = +[NSPredicate predicateWithFormat:@"SELF.lastPathComponent MATCHES %@", @"launches\\.\\d{4}(-\\d{2}){2}(.\\d{2}){3}\\.log"];
    id v9 = +[SDUnitLogDirectory logRuleWithDirectory:@"/private/var/log/com.apple.xpc.launchd" withDepth:0 withDate:0 withFilter:v8 newestFileCount:0 atInternalDirectory:0 withRuntimeChecks:0];
    v27[4] = v9;
    uint64_t v10 = [@"/private/var/log/com.apple.xpc.launchd" stringByAppendingPathComponent:@"*.shutdownstall"];
    BOOL v11 = +[SDUnitLogGlob logRuleWithGlob:v10];
    v27[5] = v11;
    uint64_t v12 = [@"/private/var/log/com.apple.xpc.launchd" stringByAppendingPathComponent:@"*.tailspin"];
    double v13 = +[SDUnitLogGlob logRuleWithGlob:v12];
    v27[6] = v13;
    id v14 = +[NSArray arrayWithObjects:v27 count:7];
    [v5 addRules:v14];

    unsigned int v3 = v25;
    [v25 addObject:v5];
  }

  return v3;
}

- (id)getlaunchdAndCTSContainers
{
  unsigned int v3 = +[NSMutableArray array];
  id v4 = +[SDTaskDepotContainer containerWithName:@"launchCTL" destination:0 withTimeout:0 withConcurrency:self withDelegate:10.0];
  [v4 setRuntimeChecks:16];
  id v5 = +[SDTask taskWithCommand:@"/bin/launchctl" arguments:&off_1000B0938 inBootstrapDomainOfUID:0 outputFile:@"launchctl-list-0.txt"];
  v18[0] = v5;
  id v6 = +[SDTask taskWithCommand:@"/bin/launchctl" arguments:&off_1000B0950 outputFile:@"launchctl-print-system.txt"];
  v18[1] = v6;
  id v7 = +[SDTask taskWithCommand:@"/bin/launchctl" arguments:&off_1000B0968 outputFile:@"launchctl-dumpstate.txt"];
  v18[2] = v7;
  uint64_t v8 = +[NSArray arrayWithObjects:v18 count:3];
  [v4 addSDTasksToContainer:v8];

  if (v4) {
    [v3 addObject:v4];
  }
  id v9 = [(SystemDiagnostic *)self getlaunchdContainer];
  [v3 addObjectsFromArray:v9];

  if (sub_100048604())
  {
    uint64_t v10 = +[SDTask taskWithCommand:@"/usr/local/bin/ctsctl" arguments:&off_1000B0980 inBootstrapDomainOfUID:0 outputFile:@"ctsctl-list-0.txt"];
    uint64_t v17 = v10;
    BOOL v11 = +[NSArray arrayWithObjects:&v17 count:1];
  }
  else
  {
    BOOL v11 = &__NSArray0__struct;
  }
  uint64_t v12 = +[SDUnitLogDirectory logRuleWithDirectory:@"/private/var/log/module/com.apple.xpc.activity"];
  uint64_t v16 = v12;
  double v13 = +[NSArray arrayWithObjects:&v16 count:1];

  id v14 = +[SDComplexContainer complexContainerWithTasks:v11 withTimeout:v13 withRules:&stru_1000A1EA8 atDestination:self withDelegate:6.0];
  [v14 setRuntimeChecks:16];
  if (v14)
  {
    [v14 setName:@"cts"];
    [v3 addObject:v14];
  }

  return v3;
}

- (id)getMicrostackshotsWithPostContainers
{
  unsigned int v3 = +[NSMutableArray array];
  id v4 = [(SystemDiagnostic *)self startDiagnosticTime];
  id v5 = [v4 dateByAddingTimeInterval:-259200.0];

  id v6 = [(SystemDiagnostic *)self startDiagnosticTime];
  [v6 timeIntervalSince1970];
  uint64_t v8 = +[NSString stringWithFormat:@"%ld", (uint64_t)v7];

  [v5 timeIntervalSince1970];
  uint64_t v10 = +[NSString stringWithFormat:@"%ld", (uint64_t)v9];
  v18[0] = @"-oslog";
  v18[1] = @"-microstackshots_only";
  v18[2] = @"-microstackshots_save";
  void v18[3] = @"-microstackshots_datastore";
  v18[4] = @"<TMPOUTPUTDIR>/microstackshots";
  v18[5] = @"-microstackshots_starttime";
  v18[6] = v10;
  v18[7] = @"-microstackshots_endtime";
  v18[8] = v8;
  BOOL v11 = +[NSArray arrayWithObjects:v18 count:9];
  uint64_t v12 = +[SDTask taskWithCommand:@"/usr/sbin/spindump" arguments:v11 outputFile:@"errors/microstackshots_errors.txt"];
  long long v19 = v12;
  double v13 = +[NSArray arrayWithObjects:&v19 count:1];

  id v14 = +[SDComplexContainer complexContainerWithTasks:v13 withTimeout:&__NSArray0__struct withRules:&stru_1000A1EA8 atDestination:self withDelegate:45.0];
  id v15 = v14;
  if (v14)
  {
    [v14 setName:@"microstackshots"];
    uint64_t v16 = [v15 collectionContainer];
    [v16 setMaximumSizeMB:200];

    [v15 setRuntimeChecks:16];
    [v3 addObject:v15];
  }

  return v3;
}

- (id)getIOREGContainer
{
  unsigned int v3 = +[NSMutableArray array];
  id v4 = +[SDTaskDepotContainer containerWithName:@"ioreg" destination:@"ioreg" withTimeout:0 withConcurrency:self withDelegate:30.0];
  id v5 = v4;
  if (v4)
  {
    [v4 setRuntimeChecks:16];
    id v15 = +[SDTask taskWithCommand:@"/usr/sbin/ioreg" arguments:&off_1000B0998 outputFile:@"IOService.txt"];
    v16[0] = v15;
    id v6 = +[SDTask taskWithCommand:@"/usr/sbin/ioreg" arguments:&off_1000B09B0 outputFile:@"IOACPIPlane.txt"];
    v16[1] = v6;
    double v7 = +[SDTask taskWithCommand:@"/usr/sbin/ioreg" arguments:&off_1000B09C8 outputFile:@"IOPower.txt"];
    v16[2] = v7;
    uint64_t v8 = +[SDTask taskWithCommand:@"/usr/sbin/ioreg" arguments:&off_1000B09E0 outputFile:@"IODeviceTree.txt"];
    v16[3] = v8;
    double v9 = +[SDTask taskWithCommand:@"/usr/sbin/ioreg" arguments:&off_1000B09F8 outputFile:@"IOUSB.txt"];
    v16[4] = v9;
    uint64_t v10 = +[SDTask taskWithCommand:@"/usr/sbin/ioreg" arguments:&off_1000B0A10 outputFile:@"IOFireWire.txt"];
    v16[5] = v10;
    BOOL v11 = +[SDTask taskWithCommand:@"/usr/sbin/ioreg" arguments:&off_1000B0A28 outputFile:@"IOPort.txt"];
    v16[6] = v11;
    uint64_t v12 = +[SDTask taskWithCommand:@"/usr/sbin/ioreg" arguments:&off_1000B0A40 outputFile:@"IOReg.xml"];
    void v16[7] = v12;
    double v13 = +[NSArray arrayWithObjects:v16 count:8];
    [v5 addSDTasksToContainer:v13];

    [v3 addObject:v5];
  }

  return v3;
}

- (id)getGNIContainer
{
  unsigned int v3 = +[NSMutableArray array];
  id v4 = +[NSMutableArray array];
  [v4 addObject:@"-s"];
  [v4 addObject:@"<TMPOUTPUTDIR>"];
  id v5 = +[SDTask taskWithCommand:@"/System/Library/Frameworks/SystemConfiguration.framework/get-network-info" arguments:v4 outputFile:@"errors/get_network_info_errors.txt"];
  BOOL v11 = v5;
  id v6 = +[NSArray arrayWithObjects:&v11 count:1];

  double v7 = +[SDComplexContainer complexContainerWithTasks:v6 withTimeout:&__NSArray0__struct withRules:@"logs/Networking" atDestination:self withDelegate:100.0];
  uint64_t v8 = v7;
  if (v7)
  {
    double v9 = [v7 collectionContainer];
    [v9 setMaximumSizeMB:10];

    [v8 setRuntimeChecks:17];
    [v3 addObject:v8];
  }

  return v3;
}

- (id)getsysconfigInternalLogsContainer
{
  unsigned int v3 = +[NSMutableArray array];
  id v4 = +[SDTaskDepotContainer containerWithName:@"sysconfigInternalLogs" destination:0 withTimeout:1 withConcurrency:self withDelegate:15.0];
  id v5 = v4;
  if (v4)
  {
    [v4 setRuntimeChecks:16];
    id v6 = +[SDTask taskWithCommand:@"/usr/sbin/sysctl" arguments:&off_1000B0A58 outputFile:@"sysctl.txt" withRuntimeChecks:17];
    double v7 = +[SDTask taskWithCommand:@"/usr/sbin/nvram", &off_1000B0A70, @"nvram.txt", 17, v6 arguments outputFile withRuntimeChecks];
    v13[1] = v7;
    uint64_t v8 = +[SDTask taskWithCommand:@"/usr/bin/sw_vers" arguments:0 outputFile:@"sw_vers.txt" withRuntimeChecks:17];
    void v13[2] = v8;
    double v9 = +[SDTask taskWithCommand:@"/usr/local/bin/cdcontexttool" arguments:&off_1000B0A88 outputFile:@"cdcontexttool.txt" withRuntimeChecks:17];
    v13[3] = v9;
    uint64_t v10 = +[SDTask taskWithCommand:@"/usr/local/bin/darwinup" arguments:&off_1000B0AA0 outputFile:@"darwinup.txt" withRuntimeChecks:17];
    v13[4] = v10;
    BOOL v11 = +[NSArray arrayWithObjects:v13 count:5];
    [v5 addSDTasksToContainer:v11];

    [v3 addObject:v5];
  }

  return v3;
}

- (id)getIOLogsContainer
{
  unsigned int v3 = +[NSMutableArray array];
  id v4 = +[SDTaskDepotContainer containerWithName:@"IOLogs" destination:0 withTimeout:1 withConcurrency:self withDelegate:10.0];
  id v5 = v4;
  if (v4)
  {
    [v4 setRuntimeChecks:16];
    id v6 = +[SDTask taskWithCommand:@"/usr/local/bin/iordump" arguments:0 outputFile:@"iordump.txt" withRuntimeChecks:17];
    double v7 = +[SDTask taskWithCommand:@"/usr/sbin/ioalloccount", 0, @"ioalloccount.txt", 17, v6 arguments outputFile withRuntimeChecks];
    v13[1] = v7;
    uint64_t v8 = +[SDTask taskWithCommand:@"/usr/sbin/ioclasscount" arguments:0 outputFile:@"ioclasscount.txt" withRuntimeChecks:17];
    void v13[2] = v8;
    double v9 = +[SDTask taskWithCommand:@"/usr/bin/tbtdiagnose" arguments:0 outputFile:@"tbtDiagnose.txt" withRuntimeChecks:16];
    v13[3] = v9;
    uint64_t v10 = +[SDTask taskWithCommand:@"/usr/bin/hpmdiagnose" arguments:0 outputFile:@"hpmDiagnose.txt"];
    v13[4] = v10;
    BOOL v11 = +[NSArray arrayWithObjects:v13 count:5];
    [v5 addSDTasksToContainer:v11];

    [v3 addObject:v5];
  }

  return v3;
}

- (id)getPowerLogContainer
{
  unsigned int v3 = +[NSMutableArray array];
  id v4 = +[SDComplexContainer complexContainerWithSPITask:33 withTimeout:@"logs/powerlogs/" atDestination:self withDelegate:20.0];
  id v5 = v4;
  if (v4)
  {
    [v4 setRuntimeChecks:16];
    id v6 = [v5 collectionContainer];
    [v6 setMaximumSizeMB:0];

    [v3 addObject:v5];
  }

  return v3;
}

- (id)getaccountsInternalLogsContainer
{
  unsigned int v3 = +[NSMutableArray array];
  id v4 = +[SDTaskDepotContainer containerWithName:@"accountInternalLogs" destination:0 withTimeout:1 withConcurrency:self withDelegate:5.0];
  id v5 = v4;
  if (v4)
  {
    [v4 setRuntimeChecks:17];
    id v6 = +[SDTask taskWithCommand:@"/usr/local/bin/accctl" arguments:&off_1000B0AB8 outputFile:@"accctl.txt"];
    v10[0] = v6;
    double v7 = +[SDTask taskWithCommand:@"/usr/local/bin/accounts_tool" arguments:&off_1000B0AD0 outputFile:@"accounts_list.txt"];
    v10[1] = v7;
    uint64_t v8 = +[NSArray arrayWithObjects:v10 count:2];
    [v5 addSDTasksToContainer:v8];

    [v3 addObject:v5];
  }

  return v3;
}

- (id)getmiscInternalLogsContainer
{
  unsigned int v3 = +[NSMutableArray array];
  id v4 = +[SDTaskDepotContainer containerWithName:@"miscInternalLogs" destination:0 withTimeout:1 withConcurrency:self withDelegate:20.0];
  id v5 = v4;
  if (v4)
  {
    [v4 setRuntimeChecks:16];
    id v6 = +[SDTask taskWithCommand:@"/usr/local/bin/keystorectl" arguments:&off_1000B0AE8 outputFile:@"lock_state.txt" withRuntimeChecks:17];
    v17[0] = v6;
    double v7 = +[SDTask taskWithCommand:@"/usr/local/bin/findmydevicetool" arguments:&off_1000B0B00 outputFile:0 withRuntimeChecks:17];
    v17[1] = v7;
    uint64_t v8 = +[SDTask taskWithCommand:@"/usr/local/bin/BacklightdTester" arguments:&off_1000B0B18 outputFile:0 withRuntimeChecks:17];
    void v17[2] = v8;
    double v9 = +[SDTask taskWithCommand:@"/usr/local/bin/mbtool" arguments:&off_1000B0B30 outputFile:@"mbtool.txt" withRuntimeChecks:17];
    v17[3] = v9;
    uint64_t v10 = +[NSArray arrayWithObjects:v17 count:4];
    [v5 addSDTasksToContainer:v10];

    [v3 addObject:v5];
  }
  BOOL v11 = +[SDTaskDepotContainer containerWithName:@"lsawLogs" destination:0 withTimeout:1 withConcurrency:self withDelegate:60.0];
  uint64_t v12 = v11;
  if (v11)
  {
    [v11 setRuntimeChecks:16];
    double v13 = +[SDTask taskWithCommand:@"/usr/bin/lsdiagnose" arguments:&__NSArray0__struct outputFile:@"lsaw.csstoredump" withRuntimeChecks:16];
    uint64_t v16 = v13;
    id v14 = +[NSArray arrayWithObjects:&v16 count:1];
    [v12 addSDTasksToContainer:v14];

    [v3 addObject:v12];
  }

  return v3;
}

- (id)getInternalLogsContainer
{
  unsigned int v3 = +[NSMutableArray array];
  id v4 = [(SystemDiagnostic *)self getsysconfigInternalLogsContainer];
  [v3 addObjectsFromArray:v4];

  id v5 = [(SystemDiagnostic *)self getIOLogsContainer];
  [v3 addObjectsFromArray:v5];

  id v6 = [(SystemDiagnostic *)self getaccountsInternalLogsContainer];
  [v3 addObjectsFromArray:v6];

  double v7 = [(SystemDiagnostic *)self getmiscInternalLogsContainer];
  [v3 addObjectsFromArray:v7];

  return v3;
}

- (id)getLGUtilitiesContainer
{
  unsigned int v3 = +[NSMutableArray array];
  uint64_t v4 = sub_100024418();
  id v5 = +[SDTaskDepotContainer containerWithName:@"utilities-logGen" destination:0 withTimeout:1 withConcurrency:self withDelegate:25.0];
  id v6 = v5;
  if (v5)
  {
    [v5 setRuntimeChecks:16];
    double v7 = +[SDTask taskWithCommand:@"/usr/libexec/security-sysdiagnose" arguments:&__NSArray0__struct inBootstrapDomainOfUID:v4 outputFile:@"security-sysdiagnose.txt"];
    [v7 setRuntimeChecks:0];
    uint64_t v8 = +[SDTask taskWithCommand:@"/usr/bin/buttontool" arguments:&off_1000B0B48 outputFile:@"buttontool.txt" withRuntimeChecks:1];
    long long v18 = v8;
    double v9 = +[NSArray arrayWithObjects:&v18 count:1];
    [v6 addSDTasksToContainer:v9];

    uint64_t v10 = +[SDTask taskWithCommand:@"/usr/bin/codecctl" arguments:&off_1000B0B60 outputFile:@"codecctl.txt"];
    BOOL v11 = +[SDTask taskWithCommand:@"/usr/local/bin/apsclient", &off_1000B0B78, @"apsclient.txt", 1, v10 arguments outputFile withRuntimeChecks];
    v17[1] = v11;
    void v17[2] = v7;
    uint64_t v12 = +[SDTask taskWithCommand:@"/usr/local/bin/audioDeviceDump" arguments:&__NSArray0__struct outputFile:@"audioDeviceDump.txt" withRuntimeChecks:1];
    v17[3] = v12;
    double v13 = +[SDTask taskWithCommand:@"/usr/libexec/pcsstatus" arguments:&off_1000B0B90 inBootstrapDomainOfUID:v4 outputFile:@"pcsstatus.txt"];
    void v17[4] = v13;
    id v14 = +[SDTask taskWithCommand:@"/usr/bin/hidutil" arguments:&off_1000B0BA8 outputFile:@"hidutil.plist"];
    v17[5] = v14;
    id v15 = +[NSArray arrayWithObjects:v17 count:6];
    [v6 addSDTasksToContainer:v15];

    [v3 addObject:v6];
  }

  return v3;
}

- (id)getLGSystemInfoContainer
{
  unsigned int v3 = +[NSMutableArray array];
  uint64_t v4 = +[SDTaskDepotContainer containerWithName:@"systemInfo-logGen" destination:0 withTimeout:1 withConcurrency:self withDelegate:10.0];
  id v5 = v4;
  if (v4)
  {
    [v4 setRuntimeChecks:16];
    id v6 = +[SDTask taskWithCommand:@"/usr/sbin/kextstat" arguments:0 outputFile:@"kextstat.txt"];
    v10[0] = v6;
    double v7 = +[SDTask taskWithCommand:@"/usr/bin/pmset" arguments:&off_1000B0BC0 outputFile:@"pmset_everything.txt" withRuntimeChecks:1];
    v10[1] = v7;
    uint64_t v8 = +[NSArray arrayWithObjects:v10 count:2];
    [v5 addSDTasksToContainer:v8];

    [v3 addObject:v5];
  }

  return v3;
}

- (id)getIDSContainer
{
  unsigned int v3 = +[NSMutableArray array];
  uint64_t v4 = sub_100024418();
  id v5 = +[SDTaskDepotContainer containerWithName:@"idsTasks" destination:0 withTimeout:0 withConcurrency:self withDelegate:20.0];
  id v6 = v5;
  if (v5)
  {
    [v5 setRuntimeChecks:144];
    double v7 = +[SDTask taskWithCommand:@"/usr/local/bin/imtool" arguments:&off_1000B0BD8 outputFile:@"imtool_list.txt"];
    v13[0] = v7;
    uint64_t v8 = +[SDTask taskWithCommand:@"/usr/local/bin/idstool" arguments:&off_1000B0BF0 outputFile:@"idstool_list.txt"];
    v13[1] = v8;
    double v9 = +[SDTask taskWithCommand:@"/usr/local/bin/imtool" arguments:&off_1000B0C08 inBootstrapDomainOfUID:v4 outputFile:@"imtool_info.txt"];
    void v13[2] = v9;
    uint64_t v10 = +[SDTask taskWithCommand:@"/usr/local/bin/idstool" arguments:&off_1000B0C20 inBootstrapDomainOfUID:v4 outputFile:@"idstool_info.txt"];
    v13[3] = v10;
    BOOL v11 = +[NSArray arrayWithObjects:v13 count:4];
    [v6 addSDTasksToContainer:v11];

    [v3 addObject:v6];
  }

  return v3;
}

- (id)getRmdContainer
{
  unsigned int v3 = +[NSMutableArray array];
  uint64_t v4 = sub_100024418();
  id v5 = +[SDTaskDepotContainer containerWithName:@"rmd" destination:@"logs/rmd" withTimeout:0 withConcurrency:self withDelegate:5.0];
  id v6 = v5;
  if (v5)
  {
    [v5 setRuntimeChecks:16];
    double v7 = +[SDTask taskWithCommand:@"/System/Library/PrivateFrameworks/RemoteManagement.framework/rmdinspect" arguments:&off_1000B0C38 outputFile:@"rmd_inspect_system.txt"];
    v11[0] = v7;
    uint64_t v8 = +[SDTask taskWithCommand:@"/System/Library/PrivateFrameworks/RemoteManagement.framework/rmdinspect" arguments:&off_1000B0C50 asUID:v4 outputFile:@"rmd_inspect_user.txt"];
    v11[1] = v8;
    double v9 = +[NSArray arrayWithObjects:v11 count:2];
    [v6 addSDTasksToContainer:v9];

    [v3 addObject:v6];
  }

  return v3;
}

- (id)getKCSharingContainer
{
  unsigned int v3 = +[NSMutableArray array];
  uint64_t v4 = +[SDTaskDepotContainer containerWithName:@"KCSharingDiagnose" destination:@"logs/Security" withTimeout:1 withConcurrency:self withDelegate:10.0];
  id v5 = v4;
  if (v4)
  {
    [v4 setRuntimeChecks:17];
    id v6 = +[SDTask taskWithCommand:@"/usr/local/bin/kcsharingdiagnose.py" arguments:0 outputFile:@"kcsharingdiagnose.txt"];
    double v9 = v6;
    double v7 = +[NSArray arrayWithObjects:&v9 count:1];
    [v5 addSDTasksToContainer:v7];

    [v3 addObject:v5];
  }

  return v3;
}

- (id)getBrctlContainer
{
  long long v18 = +[NSMutableArray array];
  v21[0] = @"diagnose";
  v21[1] = @"--sysdiagnose";
  unsigned int v3 = [(SystemDiagnostic *)self brctl_dir];
  v21[2] = v3;
  uint64_t v4 = +[NSArray arrayWithObjects:v21 count:3];
  id v5 = +[SDTask taskWithCommand:@"/usr/bin/brctl" arguments:v4 outputFile:@"errors/brctl_errors.txt"];
  long long v22 = v5;
  uint64_t v17 = +[NSArray arrayWithObjects:&v22 count:1];

  id v6 = [(SystemDiagnostic *)self brctl_dir];
  double v7 = +[NSPredicate predicateWithFormat:@"NOT SELF.lastPathComponent == %@", @"brctl-dump.txt"];
  uint64_t v8 = +[SDUnitLogDirectory logRuleWithDirectory:v6 withDepth:0 withDate:0 withFilter:v7 newestFileCount:0 atInternalDirectory:0 withRuntimeChecks:0];
  v20[0] = v8;
  double v9 = [(SystemDiagnostic *)self brctl_dir];
  uint64_t v10 = [v9 stringByAppendingPathComponent:@"brctl-dump.txt"];
  long long v19 = v10;
  BOOL v11 = +[NSArray arrayWithObjects:&v19 count:1];
  uint64_t v12 = +[SDUnitLogPathArray logRuleWithPaths:v11];
  v20[1] = v12;
  double v13 = +[NSArray arrayWithObjects:v20 count:2];

  id v14 = +[SDComplexContainer complexContainerWithTasks:v17 withTimeout:v13 withRules:@"brctl" atDestination:self withDelegate:30.0];
  id v15 = v14;
  if (v14)
  {
    [v14 setName:@"brctl"];
    [v15 setRuntimeChecks:16];
    [v15 collectionContainer];

    [v18 addObject:v15];
  }

  return v18;
}

- (id)getFileProviderCTLContainer
{
  unsigned int v3 = +[NSMutableArray array];
  uint64_t v4 = +[SDTask taskWithCommand:@"/usr/bin/fileproviderctl" arguments:&off_1000B0C68 inBootstrapDomainOfUID:sub_100024418() outputFile:@"fileproviderctl.log"];
  v11[0] = v4;
  id v5 = +[SDTask taskWithCommand:@"/usr/bin/fileproviderctl" arguments:&off_1000B0C80 inBootstrapDomainOfUID:sub_100024418() outputFile:@"fileproviderctl.log"];
  v11[1] = v5;
  id v6 = +[NSArray arrayWithObjects:v11 count:2];

  double v7 = +[SDComplexContainer complexContainerWithTasks:v6 withTimeout:&__NSArray0__struct withRules:&stru_1000A1EA8 atDestination:self withDelegate:5.0];
  uint64_t v8 = v7;
  if (v7)
  {
    double v9 = [v7 taskContainer];
    [v9 setName:@"fileproviderctl"];

    [v8 setRuntimeChecks:16];
    [v3 addObject:v8];
  }

  return v3;
}

- (id)getGestaltQueryContainer
{
  unsigned int v3 = +[NSMutableArray array];
  uint64_t v4 = +[SDTaskDepotContainer containerWithName:@"gestalt query" destination:0 withTimeout:1 withConcurrency:self withDelegate:10.0];
  id v5 = v4;
  if (v4)
  {
    [v4 setRuntimeChecks:17];
    if ([(SystemDiagnostic *)self isTestingMode]) {
      CFStringRef v6 = @"-plist";
    }
    else {
      CFStringRef v6 = @" ";
    }
    double v7 = [&off_1000B0C98 componentsJoinedByString:@" || "];
    +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@ %@ $(%@ -listKeys | %@ 'NR == 1 || NR == 2 || %@ {next}; {print $1}')",
      @"/usr/local/bin/gestalt_query",
      v6,
      @"/usr/local/bin/gestalt_query",
      @"/usr/bin/awk",
    uint64_t v8 = v7);
    double v9 = +[SDTask shellTaskWithCommand:v8 outputFile:@"gestalt_query.txt"];
    uint64_t v12 = v9;
    uint64_t v10 = +[NSArray arrayWithObjects:&v12 count:1];
    [v5 addSDTasksToContainer:v10];

    [v3 addObject:v5];
  }

  return v3;
}

- (id)getDSCSYMContainer
{
  unsigned int v3 = +[NSMutableArray array];
  uint64_t v4 = +[SDComplexContainer complexContainerWithSPITask:18 withTimeout:@"logs/olddsc" atDestination:self withDelegate:5.0];
  id v5 = v4;
  if (v4)
  {
    [v4 setRuntimeChecks:16];
    CFStringRef v6 = [v5 collectionContainer];
    [v6 setMaximumSizeMB:10];

    [v3 addObject:v5];
  }

  return v3;
}

- (id)getCoreCaptureSPIContainer
{
  uint64_t v21 = 0;
  long long v22 = (double *)&v21;
  uint64_t v23 = 0x2020000000;
  uint64_t v24 = 0x4030000000000000;
  uint64_t v17 = 0;
  long long v18 = &v17;
  uint64_t v19 = 0x2020000000;
  uint64_t v20 = 10;
  unsigned int v3 = +[NSMutableArray array];
  uint64_t v4 = +[SDComplexContainer complexContainerWithSPITask:15 withTimeout:@"/WiFi" atDestination:self withDelegate:v22[3]];
  id v5 = v4;
  if (v4)
  {
    [v4 setRuntimeChecks:16];
    CFStringRef v6 = [v5 collectionContainer];
    [v6 setGenerateSummary:1];

    double v7 = v22[3];
    uint64_t v8 = [v5 taskContainer];
    [v8 setTimeout:v7];

    uint64_t v9 = v18[3];
    uint64_t v10 = [v5 collectionContainer];
    [v10 setMaximumSizeMB:v9];

    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    void v13[2] = sub_100020C40;
    v13[3] = &unk_10009D320;
    id v14 = v5;
    id v15 = &v21;
    uint64_t v16 = &v17;
    BOOL v11 = +[SDLogAgentContainer containerAtLocation:@"CoreCaptureConfig" forTaskType:14 withTimeout:self withDelegate:0 withMsgContents:v13 withReplyBlock:5.0];
    if (v11) {
      [v3 addObject:v11];
    }
  }
  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v21, 8);

  return v3;
}

- (id)getCDDebugContainer
{
  unsigned int v3 = +[NSMutableArray array];
  uint64_t v4 = +[SDTask taskWithCommand:@"/usr/local/bin/cddebug" arguments:&off_1000B0CB0 outputFile:0];
  uint64_t v12 = v4;
  id v5 = +[NSArray arrayWithObjects:&v12 count:1];

  CFStringRef v6 = +[SDUnitLogPathArray logRuleWithPaths:&off_1000B0CC8];
  BOOL v11 = v6;
  double v7 = +[NSArray arrayWithObjects:&v11 count:1];

  uint64_t v8 = +[SDComplexContainer complexContainerWithTasks:v5 withTimeout:v7 withRules:&stru_1000A1EA8 atDestination:self withDelegate:3.0];
  uint64_t v9 = v8;
  if (v8)
  {
    [v8 setName:@"cdDebug"];
    [v9 setRuntimeChecks:17];
    [v3 addObject:v9];
  }

  return v3;
}

- (id)getAirPlayContainer
{
  unsigned int v3 = +[NSMutableArray array];
  uint64_t v4 = +[SDTaskDepotContainer containerWithName:@"AirPlay" destination:@"logs/AirPlay" withTimeout:0 withConcurrency:self withDelegate:8.0];
  id v5 = v4;
  if (v4)
  {
    [v4 setRuntimeChecks:17];
    CFStringRef v6 = +[SDTask taskWithCommand:@"/usr/local/bin/airplayutil" arguments:&off_1000B0CE0 outputFile:@"AirPlay.txt"];
    v12[0] = v6;
    double v7 = +[SDTask taskWithCommand:@"/usr/local/bin/airplayutil" arguments:&off_1000B0CF8 outputFile:@"AirPlay.txt"];
    v12[1] = v7;
    uint64_t v8 = +[SDTask taskWithCommand:@"/usr/local/bin/airplayutil" arguments:&off_1000B0D10 outputFile:@"AirPlay.txt"];
    v12[2] = v8;
    uint64_t v9 = +[SDTask taskWithCommand:@"/usr/local/bin/airplayutil" arguments:&off_1000B0D28 outputFile:@"AirPlayPrefs.txt"];
    v12[3] = v9;
    uint64_t v10 = +[NSArray arrayWithObjects:v12 count:4];
    [v5 addSDTasksToContainer:v10];

    [v3 addObject:v5];
  }

  return v3;
}

- (id)getGMSAvailabilityContainer
{
  unsigned int v3 = +[NSMutableArray array];
  uint64_t v4 = +[SDTaskDepotContainer containerWithName:@"GMSAvailability" destination:@"logs/GenerativeExperiences" withTimeout:1 withConcurrency:self withDelegate:2.0];
  id v5 = v4;
  if (v4)
  {
    [v4 setRuntimeChecks:17];
    CFStringRef v6 = +[SDTask taskWithCommand:@"/usr/local/bin/gmstool" arguments:&off_1000B0D40 asUID:sub_100024418() outputFile:@"gms_availability.txt"];
    uint64_t v9 = v6;
    double v7 = +[NSArray arrayWithObjects:&v9 count:1];
    [v5 addSDTasksToContainer:v7];

    [v3 addObject:v5];
  }

  return v3;
}

- (id)getCKKSCTLContainer
{
  unsigned int v3 = +[NSMutableArray array];
  uint64_t v4 = +[SDTaskDepotContainer containerWithName:@"CKKSCTL" destination:0 withTimeout:1 withConcurrency:self withDelegate:3.0];
  id v5 = v4;
  if (v4)
  {
    [v4 setRuntimeChecks:16];
    CFStringRef v6 = +[SDTask taskWithCommand:@"/usr/sbin/ckksctl" arguments:&off_1000B0D58 outputFile:@"ckksctl_status.txt"];
    uint64_t v9 = v6;
    double v7 = +[NSArray arrayWithObjects:&v9 count:1];
    [v5 addSDTasksToContainer:v7];

    [v3 addObject:v5];
  }

  return v3;
}

- (id)getOTCTLContainer
{
  unsigned int v3 = +[NSMutableArray array];
  uint64_t v4 = +[SDTaskDepotContainer containerWithName:@"OTCTL" destination:0 withTimeout:1 withConcurrency:self withDelegate:3.0];
  id v5 = v4;
  if (v4)
  {
    [v4 setRuntimeChecks:16];
    CFStringRef v6 = +[SDTask taskWithCommand:@"/usr/sbin/otctl" arguments:&off_1000B0D70 outputFile:@"otctl_status.txt"];
    uint64_t v9 = v6;
    double v7 = +[NSArray arrayWithObjects:&v9 count:1];
    [v5 addSDTasksToContainer:v7];

    [v3 addObject:v5];
  }

  return v3;
}

- (id)getTransparencyContainer
{
  unsigned int v3 = +[NSMutableArray array];
  uint64_t v4 = +[SDTaskDepotContainer containerWithName:@"TRANSPARENCYCTL" destination:0 withTimeout:1 withConcurrency:self withDelegate:3.0];
  id v5 = v4;
  if (v4)
  {
    [v4 setRuntimeChecks:16];
    CFStringRef v6 = +[SDTask taskWithCommand:@"/usr/libexec/transparency-sysdiagnose" arguments:&__NSArray0__struct outputFile:@"transparency.log"];
    uint64_t v9 = v6;
    double v7 = +[NSArray arrayWithObjects:&v9 count:1];
    [v5 addSDTasksToContainer:v7];

    [v3 addObject:v5];
  }

  return v3;
}

- (id)getSWTransparencyContainer
{
  unsigned int v3 = +[NSMutableArray array];
  uint64_t v4 = +[SDTaskDepotContainer containerWithName:@"swtransparency" destination:0 withTimeout:1 withConcurrency:self withDelegate:3.0];
  id v5 = v4;
  if (v4)
  {
    [v4 setRuntimeChecks:16];
    CFStringRef v6 = +[SDTask taskWithCommand:@"/usr/libexec/swtransparency-sysdiagnose" arguments:&__NSArray0__struct outputFile:@"logs/swtransparency.log"];
    uint64_t v9 = v6;
    double v7 = +[NSArray arrayWithObjects:&v9 count:1];
    [v5 addSDTasksToContainer:v7];

    [v3 addObject:v5];
  }

  return v3;
}

- (id)getApfsStatsContainer
{
  unsigned int v3 = +[NSMutableArray array];
  uint64_t v4 = +[SDTaskDepotContainer containerWithName:@"APFS_STATS" destination:0 withTimeout:1 withConcurrency:self withDelegate:3.0];
  id v5 = v4;
  if (v4)
  {
    [v4 setRuntimeChecks:16];
    CFStringRef v6 = +[SDTask taskWithCommand:@"/System/Library/Filesystems/apfs.fs/apfs_stats" arguments:0 outputFile:@"apfs_stats.txt"];
    uint64_t v9 = v6;
    double v7 = +[NSArray arrayWithObjects:&v9 count:1];
    [v5 addSDTasksToContainer:v7];

    [v3 addObject:v5];
  }

  return v3;
}

- (id)getKeyboardPrefContainer
{
  unsigned int v3 = +[NSMutableArray array];
  uint64_t v4 = +[SDComplexContainer complexContainerWithSPITask:26 withTimeout:@"Preferences" atDestination:self withDelegate:10.0];
  id v5 = v4;
  if (v4)
  {
    [v4 setRuntimeChecks:16];
    [v3 addObject:v5];
  }

  return v3;
}

- (id)getswcutilContainer
{
  unsigned int v3 = +[NSMutableArray array];
  uint64_t v4 = +[SDTaskDepotContainer containerWithName:@"SWCUTIL" destination:0 withTimeout:1 withConcurrency:self withDelegate:5.0];
  id v5 = v4;
  if (v4)
  {
    [v4 setRuntimeChecks:16];
    CFStringRef v6 = +[SDTask taskWithCommand:@"/System/Library/PrivateFrameworks/SharedWebCredentials.framework/Support/swcutil" arguments:&off_1000B0D88 outputFile:@"swcutil_show.txt"];
    uint64_t v9 = v6;
    double v7 = +[NSArray arrayWithObjects:&v9 count:1];
    [v5 addSDTasksToContainer:v7];

    [v3 addObject:v5];
  }

  return v3;
}

- (id)getosvariantUtilContainer
{
  unsigned int v3 = +[NSMutableArray array];
  uint64_t v4 = +[SDTaskDepotContainer containerWithName:@"OSVARIANTUTIL" destination:0 withTimeout:1 withConcurrency:self withDelegate:5.0];
  id v5 = v4;
  if (v4)
  {
    [v4 setRuntimeChecks:17];
    CFStringRef v6 = +[SDTask taskWithCommand:@"/usr/local/bin/osvariantutil" arguments:&off_1000B0DA0 outputFile:@"osvariantutil_status.txt"];
    uint64_t v9 = v6;
    double v7 = +[NSArray arrayWithObjects:&v9 count:1];
    [v5 addSDTasksToContainer:v7];

    [v3 addObject:v5];
  }

  return v3;
}

- (id)getcontrolbitsContainer
{
  unsigned int v3 = +[NSMutableArray array];
  uint64_t v4 = +[SDTaskDepotContainer containerWithName:@"controlbits" destination:0 withTimeout:1 withConcurrency:self withDelegate:5.0];
  id v5 = v4;
  if (v4)
  {
    [v4 setRuntimeChecks:17];
    CFStringRef v6 = +[SDTask taskWithCommand:@"/usr/local/bin/controlbits" arguments:&off_1000B0DB8 outputFile:@"controlbits.txt"];
    uint64_t v9 = v6;
    double v7 = +[NSArray arrayWithObjects:&v9 count:1];
    [v5 addSDTasksToContainer:v7];

    [v3 addObject:v5];
  }

  return v3;
}

- (id)getclpcContainer
{
  unsigned int v3 = +[NSMutableArray array];
  uint64_t v4 = +[SDTaskDepotContainer containerWithName:@"clpc" destination:0 withTimeout:1 withConcurrency:self withDelegate:5.0];
  id v5 = v4;
  if (v4)
  {
    [v4 setRuntimeChecks:17];
    CFStringRef v6 = +[SDTask taskWithCommand:@"/usr/local/bin/clpc" arguments:&off_1000B0DD0 outputFile:@"clpc.txt"];
    id v14 = v6;
    double v7 = +[NSArray arrayWithObjects:&v14 count:1];
    [v5 addSDTasksToContainer:v7];

    [v3 addObject:v5];
  }
  uint64_t v8 = +[SDTaskDepotContainer containerWithName:@"clpctop" destination:0 withTimeout:1 withConcurrency:self withDelegate:5.0];
  uint64_t v9 = v8;
  if (v8)
  {
    [v8 setRuntimeChecks:17];
    uint64_t v10 = +[SDTask taskWithCommand:@"/usr/local/bin/clpctop" arguments:&off_1000B0DE8 outputFile:@"clpctop.txt"];
    double v13 = v10;
    BOOL v11 = +[NSArray arrayWithObjects:&v13 count:1];
    [v9 addSDTasksToContainer:v11];

    [v3 addObject:v9];
  }

  return v3;
}

- (id)getclpcctrlContainer
{
  unsigned int v3 = +[NSMutableArray array];
  uint64_t v4 = +[SDTaskDepotContainer containerWithName:@"clpcctrl" destination:0 withTimeout:1 withConcurrency:self withDelegate:5.0];
  id v5 = v4;
  if (v4)
  {
    [v4 setRuntimeChecks:17];
    CFStringRef v6 = +[SDTask taskWithCommand:@"/usr/local/bin/clpcctrl" arguments:&off_1000B0E00 outputFile:@"clpcctrl.txt"];
    uint64_t v9 = v6;
    double v7 = +[NSArray arrayWithObjects:&v9 count:1];
    [v5 addSDTasksToContainer:v7];

    [v3 addObject:v5];
  }

  return v3;
}

- (id)getASPSnapshotsContainers
{
  unsigned int v3 = +[NSMutableArray array];
  uint64_t v4 = +[SDComplexContainer complexContainerWithSPITask:3 withTimeout:@"ASPSnapshots" atDestination:self withDelegate:5.0];
  id v5 = v4;
  if (v4)
  {
    [v4 setRuntimeChecks:16];
    CFStringRef v6 = [v5 collectionContainer];
    [v6 setGenerateSummary:1];

    [v3 addObject:v5];
  }

  return v3;
}

- (id)getCADebugContainer
{
  unsigned int v3 = +[NSMutableArray array];
  uint64_t v4 = +[SDTaskDepotContainer containerWithName:@"cadebug" destination:0 withTimeout:0 withConcurrency:self withDelegate:9.0];
  id v5 = v4;
  if (v4)
  {
    [v4 setRuntimeChecks:17];
    CFStringRef v6 = +[SDTask taskWithCommand:@"/usr/local/bin/CADebug" arguments:&off_1000B0E18 outputFile:@"CADebug_layers.txt"];
    v12[0] = v6;
    double v7 = +[SDTask taskWithCommand:@"/usr/local/bin/CADebug" arguments:&off_1000B0E30 outputFile:@"CADebug_contexts.txt"];
    v12[1] = v7;
    uint64_t v8 = +[SDTask taskWithCommand:@"/usr/local/bin/CADebug" arguments:&off_1000B0E48 outputFile:@"CADebug_displays.txt"];
    v12[2] = v8;
    uint64_t v9 = +[SDTask taskWithCommand:@"/usr/local/bin/CADebug" arguments:&off_1000B0E60 outputFile:@"CADebug_display_trace.txt"];
    v12[3] = v9;
    uint64_t v10 = +[NSArray arrayWithObjects:v12 count:4];
    [v5 addSDTasksToContainer:v10];

    [v3 addObject:v5];
  }

  return v3;
}

- (id)getFDRDiagnosticContainer
{
  unsigned int v3 = +[NSMutableArray array];
  uint64_t v4 = +[SDComplexContainer complexContainerWithSPITask:21 withTimeout:@"logs/FDR" atDestination:self withDelegate:5.0];
  id v5 = v4;
  if (v4)
  {
    [v4 setRuntimeChecks:16];
    [v3 addObject:v5];
  }

  return v3;
}

- (id)getASPMagazineContainer
{
  unsigned int v3 = +[NSMutableArray array];
  uint64_t v4 = +[SDComplexContainer complexContainerWithSPITask:4 withTimeout:@"ASPSnapshots" atDestination:self withDelegate:5.0];
  id v5 = v4;
  if (v4)
  {
    [v4 setRuntimeChecks:16];
    [v3 addObject:v5];
  }

  return v3;
}

- (id)getPommesStatusContainer
{
  unsigned int v3 = +[NSMutableArray array];
  uint64_t v4 = +[SDTaskDepotContainer containerWithName:@"pommes_status" destination:@"logs/pommes" withTimeout:1 withConcurrency:self withDelegate:5.0];
  id v5 = v4;
  if (v4)
  {
    [v4 setRuntimeChecks:17];
    CFStringRef v6 = +[SDTask taskWithCommand:@"/usr/appleinternal/bin/pommes_status.sh" arguments:0 outputFile:@"pommes_status.txt"];
    uint64_t v9 = v6;
    double v7 = +[NSArray arrayWithObjects:&v9 count:1];
    [v5 addSDTasksToContainer:v7];

    [v3 addObject:v5];
  }

  return v3;
}

- (id)getLogGenerationContainers
{
  unsigned int v3 = [(SystemDiagnostic *)self _iOSgetLogGenerationContainers];
  uint64_t v4 = [(SystemDiagnostic *)self getAutogenLogGenerationContainers];
  [v3 addObjectsFromArray:v4];

  return v3;
}

- (BOOL)isDeviceUnlockedSinceBoot
{
  return MKBDeviceUnlockedSinceBoot() != 0;
}

- (id)_iOSGetTimeSensitiveContainers
{
  unsigned int v3 = +[NSMutableArray array];
  uint64_t v4 = [(SystemDiagnostic *)self getSpindumpContainers];
  [v3 addObjectsFromArray:v4];

  id v5 = [(SystemDiagnostic *)self getTriggerBasebandDumpContainer];
  [v3 addObjectsFromArray:v5];

  CFStringRef v6 = [(SystemDiagnostic *)self getProcessesInfoContainer];
  [v3 addObjectsFromArray:v6];

  double v7 = [(SystemDiagnostic *)self getTSSystemInfoContainer];
  [v3 addObjectsFromArray:v7];

  uint64_t v8 = [(SystemDiagnostic *)self getSampleContainer];
  [v3 addObjectsFromArray:v8];

  uint64_t v9 = [(SystemDiagnostic *)self getTSProcessSpecificContainers];
  [v3 addObjectsFromArray:v9];

  uint64_t v10 = [(SystemDiagnostic *)self getMultiTouchContainer];
  [v3 addObjectsFromArray:v10];

  BOOL v11 = [(SystemDiagnostic *)self getsmcDiagnoseContainer];
  [v3 addObjectsFromArray:v11];

  uint64_t v12 = [(SystemDiagnostic *)self getThermHIDContainers];
  [v3 addObjectsFromArray:v12];

  double v13 = [(SystemDiagnostic *)self getPowermetricsContainer];
  [v3 addObjectsFromArray:v13];

  return v3;
}

- (id)getThermHIDContainers
{
  unsigned int v3 = +[NSMutableArray array];
  uint64_t v4 = +[SDTaskDepotContainer containerWithName:@"thermhid" destination:0 withTimeout:0 withConcurrency:self withDelegate:5.0];
  id v5 = v4;
  if (v4)
  {
    [v4 setRuntimeChecks:33];
    [v5 setRunByItself:1];
    CFStringRef v6 = +[SDTask shellTaskWithCommand:@"/usr/local/bin/thermhid | /usr/bin/sort" outputFile:@"thermhid.log"];
    v10[0] = v6;
    double v7 = +[SDTask shellTaskWithCommand:@"/usr/local/bin/thermhid -t -p | /usr/bin/sort" outputFile:@"thermhid.log"];
    v10[1] = v7;
    uint64_t v8 = +[NSArray arrayWithObjects:v10 count:2];
    [v5 addSDTasksToContainer:v8];

    [v3 addObject:v5];
  }

  return v3;
}

- (id)getUptimeContainer
{
  unsigned int v3 = +[NSMutableArray array];
  uint64_t v4 = +[SDTaskDepotContainer containerWithName:@"Uptime" destination:0 withTimeout:1 withConcurrency:self withDelegate:1.0];
  id v5 = v4;
  if (v4)
  {
    [v4 setRuntimeChecks:16];
    CFStringRef v6 = +[SDTask taskWithCommand:@"/usr/bin/uptime" arguments:0 outputFile:@"uptime.txt"];
    uint64_t v9 = v6;
    double v7 = +[NSArray arrayWithObjects:&v9 count:1];
    [v5 addSDTasksToContainer:v7];

    [v3 addObject:v5];
  }

  return v3;
}

- (id)_internalSpindumpContainers
{
  unsigned int v3 = +[NSMutableArray array];
  uint64_t v4 = [(SystemDiagnostic *)self getStackshotContainer];
  [v3 addObjectsFromArray:v4];

  id v5 = [(SystemDiagnostic *)self getUptimeContainer];
  [v3 addObjectsFromArray:v5];

  CFStringRef v6 = [(SystemDiagnostic *)self getTailspinContainers];
  [v3 addObjectsFromArray:v6];
  double v7 = +[NSMutableArray array];
  [v7 addObjectsFromArray:&off_1000B0F08];
  uint64_t v8 = [(SystemDiagnostic *)self _getSpindumpMetaContainer:v7];
  if (v8) {
    [v3 addObject:v8];
  }

  return v3;
}

- (id)getsmcDiagnoseContainer
{
  unsigned int v3 = +[NSMutableArray array];
  uint64_t v4 = +[SDTaskDepotContainer containerWithName:@"smcdiagnose" destination:0 withTimeout:1 withConcurrency:self withDelegate:15.0];
  id v5 = v4;
  if (v4)
  {
    [v4 setRuntimeChecks:32];
    CFStringRef v6 = +[SDTask taskWithCommand:@"/usr/libexec/smcDiagnose" arguments:&__NSArray0__struct outputFile:@"smcDiagnose.txt"];
    uint64_t v9 = v6;
    double v7 = +[NSArray arrayWithObjects:&v9 count:1];
    [v5 addSDTasksToContainer:v7];

    [v3 addObject:v5];
  }

  return v3;
}

- (id)getProcessesInfoContainer
{
  unsigned int v3 = +[NSMutableArray array];
  uint64_t v4 = +[SDTaskDepotContainer containerWithName:@"processesInfo" destination:0 withTimeout:1 withConcurrency:self withDelegate:15.0];
  id v5 = v4;
  if (v4)
  {
    [v4 setRuntimeChecks:32];
    [v5 setBlockUntilFinished:1];
    CFStringRef v6 = +[SDTask taskWithCommand:@"/bin/ps" arguments:&off_1000B0F20 outputFile:@"ps.txt"];
    v14[0] = v6;
    double v7 = +[SDTask taskWithCommand:@"/bin/ps" arguments:&off_1000B0F38 outputFile:@"ps_thread.txt"];
    v14[1] = v7;
    uint64_t v8 = +[SDTask taskWithCommand:@"/usr/libexec/jetsam_priority" arguments:&off_1000B0F50 outputFile:@"jetsam_priority.txt"];
    v14[2] = v8;
    uint64_t v9 = +[SDTask taskWithCommand:@"/usr/libexec/jetsam_priority" arguments:&off_1000B0F68 outputFile:@"jetsam_priority.csv"];
    void v14[3] = v9;
    uint64_t v10 = +[SDTask taskWithCommand:@"/usr/bin/vm_stat" arguments:&off_1000B0F80 outputFile:@"vm_stat.txt"];
    v14[4] = v10;
    BOOL v11 = +[SDTask taskWithCommand:@"/usr/bin/taskinfo" arguments:&off_1000B0F98 outputFile:@"taskinfo.txt"];
    v14[5] = v11;
    uint64_t v12 = +[NSArray arrayWithObjects:v14 count:6];
    [v5 addSDTasksToContainer:v12];

    [v3 addObject:v5];
  }

  return v3;
}

- (id)getTSSystemInfoContainer
{
  unsigned int v3 = +[NSMutableArray array];
  uint64_t v4 = +[SDTaskDepotContainer containerWithName:@"systemInfo-timeSensitive" destination:0 withTimeout:1 withConcurrency:self withDelegate:38.0];
  id v5 = v4;
  if (v4)
  {
    [v4 setRuntimeChecks:32];
    uint64_t v17 = v3;
    uint64_t v16 = +[SDTask taskWithCommand:@"/sbin/mount" arguments:0 outputFile:@"mount.txt"];
    v18[0] = v16;
    CFStringRef v6 = +[SDTask taskWithCommand:@"/bin/df" arguments:&off_1000B0FB0 outputFile:@"disks.txt"];
    v18[1] = v6;
    double v7 = +[SDTask taskWithCommand:@"/usr/bin/kbdebug" arguments:0 outputFile:@"kbdebug.txt"];
    v18[2] = v7;
    uint64_t v8 = +[SDTask taskWithCommand:@"/usr/sbin/lsof" arguments:&off_1000B0FC8 outputFile:@"lsof_parsable.txt" withRuntimeChecks:1];
    void v18[3] = v8;
    uint64_t v9 = +[SDTask taskWithCommand:@"/usr/sbin/lsof" arguments:&off_1000B0FE0 outputFile:@"lsof.txt" withRuntimeChecks:1];
    v18[4] = v9;
    uint64_t v10 = +[SDTask taskWithCommand:@"/usr/bin/lsmp" arguments:&off_1000B0FF8 outputFile:@"lsmp.txt" withRuntimeChecks:1];
    v18[5] = v10;
    BOOL v11 = +[SDTask taskWithCommand:@"/usr/bin/lskq" arguments:&off_1000B1010 outputFile:@"lskq.txt" withRuntimeChecks:1];
    v18[6] = v11;
    uint64_t v12 = +[SDTask taskWithCommand:@"/usr/local/bin/IOSDebug" arguments:&__NSArray0__struct outputFile:@"IOSDebug.txt" withRuntimeChecks:1];
    v18[7] = v12;
    double v13 = +[SDTask taskWithCommand:@"/usr/bin/zprint" arguments:&off_1000B1028 outputFile:@"zprint.txt"];
    v18[8] = v13;
    id v14 = +[NSArray arrayWithObjects:v18 count:9];
    [v5 addSDTasksToContainer:v14];

    unsigned int v3 = v17;
    [v17 addObject:v5];
  }

  return v3;
}

- (id)getTSProcessSpecificContainers
{
  id v60 = +[NSMutableArray array];
  unsigned int v3 = [(SystemDiagnostic *)self requestSource];
  uint64_t v4 = [(SystemDiagnostic *)self targetPIDs];
  id v5 = [v4 count];

  if (v5)
  {
    if ([(SystemDiagnostic *)self quickMode]
      || [(SystemDiagnostic *)self requestSource] == 1)
    {
      CFStringRef v6 = +[NSMutableArray arrayWithObjects:@"-v", @"-w", 0];
      long long v77 = 0u;
      long long v78 = 0u;
      long long v79 = 0u;
      long long v80 = 0u;
      double v7 = [(SystemDiagnostic *)self targetPIDs];
      id v8 = [v7 countByEnumeratingWithState:&v77 objects:v89 count:16];
      if (v8)
      {
        id v9 = v8;
        uint64_t v10 = *(void *)v78;
        do
        {
          for (i = 0; i != v9; i = (char *)i + 1)
          {
            if (*(void *)v78 != v10) {
              objc_enumerationMutation(v7);
            }
            uint64_t v12 = [*(id *)(*((void *)&v77 + 1) + 8 * i) stringValue];
            [v6 addObject:v12];
          }
          id v9 = [v7 countByEnumeratingWithState:&v77 objects:v89 count:16];
        }
        while (v9);
      }

      double v13 = +[SDTaskDepotContainer containerWithName:@"process footprint" destination:0 withTimeout:1 withConcurrency:self withDelegate:25.0];
      id v14 = v13;
      if (v13)
      {
        [v13 setRuntimeChecks:32];
        id v15 = +[SDTask taskWithCommand:@"/usr/local/bin/footprint" arguments:v6 outputFile:@"footprint.txt"];
        v88 = v15;
        uint64_t v16 = +[NSArray arrayWithObjects:&v88 count:1];
        [v14 addSDTasksToContainer:v16];

        [v60 addObject:v14];
      }
    }
    uint64_t v17 = [(SystemDiagnostic *)self targetPIDs];
    unint64_t v18 = (unint64_t)[v17 count];
    unint64_t v19 = v18 >> 2;

    unint64_t v20 = v18 & 0xFFFFFFFFFFFFFFFCLL;
    uint64_t v21 = [(SystemDiagnostic *)self targetPIDs];
    id v22 = [v21 count];

    if (v20 >= (unint64_t)v22) {
      unint64_t v23 = v19;
    }
    else {
      unint64_t v23 = v19 + 1;
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      unint64_t v87 = v23;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Number of process specific time-sensitive groups: %lu", buf, 0xCu);
    }
    uint64_t v24 = +[SDResourceManager sharedResourceManager];
    [v24 log:@"Number of process specific time-sensitive groups: %lu", v23];

    if (v23)
    {
      uint64_t v25 = 0;
      uint64_t v26 = 30;
      if (v3 == 2) {
        uint64_t v26 = 120;
      }
      uint64_t v61 = v26;
      NSFileAttributeKey v27 = (void **)&AnalyticsSendEventLazy_ptr;
      v66 = self;
      unint64_t v62 = v23;
      do
      {
        uint64_t v28 = (4 * v25);
        id v29 = (char *)(v28 + 4);
        long long v30 = [(SystemDiagnostic *)self targetPIDs];
        id v31 = [v30 count];

        if (v28 + 4 > (unint64_t)v31)
        {
          long long v32 = [(SystemDiagnostic *)self targetPIDs];
          id v29 = (char *)[v32 count];
        }
        unint64_t v67 = (unint64_t)v29;
        v63 = &v29[-v28];
        uint64_t v65 = v25 + 1;
        v64 = [v27[421] stringWithFormat:@"Process specific container group: %d", v25 + 1];
        long long v33 = &__NSArray0__struct;
        do
        {
          id v34 = v33;
          v35 = [(SystemDiagnostic *)self targetPIDs];
          v36 = [v35 objectAtIndex:v28];
          id v37 = [v36 intValue];

          uint64_t v38 = [[v27[421] stringWithFormat:@"%d", v37];
          uint64_t v39 = [(SystemDiagnostic *)self pidIndices];
          uint64_t v75 = v28;
          v76 = v34;
          if (v39
            && (uint64_t v40 = (void *)v39,
                [(SystemDiagnostic *)self pidIndices],
                v41 = objc_claimAutoreleasedReturnValue(),
                id v42 = [v41 count],
                v41,
                v40,
                v42))
          {
            id v43 = [(SystemDiagnostic *)self pidIndices];
            v44 = [v43 objectAtIndex:v28];
            unsigned int v45 = [v44 intValue];

            [&stru_1000A1EA8 stringByAppendingFormat:@"%s", (char *)-[SystemDiagnostic processes](self, "processes") + 136 * (int)v45 + 48];
            unsigned int v46 = (__CFString *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            unsigned int v46 = &stru_1000A1EA8;
          }
          v74 = [v27[421] stringWithFormat:@"<TMPOUTPUTDIR>/graph-%d-%@.memgraph", v37, v46];
          v73 = [[v27[421] stringWithFormat:@"errors/leaks_highmem_%d_errors.txt", v37];
          v84[0] = @"-outputGraph";
          v84[1] = v74;
          v84[2] = v38;
          v84[3] = @"-forkCorpse";
          v72 = +[NSArray arrayWithObjects:v84 count:4];
          v71 = +[SDTask taskWithCommand:@"/usr/bin/leaks" arguments:v72 outputFile:v73];
          v85[0] = v71;
          v83[0] = @"-v";
          v83[1] = @"-k";
          v83[2] = v38;
          v69 = +[NSArray arrayWithObjects:v83 count:3];
          v68 = [v27[421] stringWithFormat:@"ddt-%u-%@.txt", v37, v46];
          v47 = +[SDTask taskWithCommand:@"/usr/local/bin/ddt" arguments:v69 outputFile:v68 withRuntimeChecks:1];
          v85[1] = v47;
          v82[0] = @"procinfo";
          v82[1] = v38;
          v48 = +[NSArray arrayWithObjects:v82 count:2];
          [v27[421] stringWithFormat:@"launchctl-procinfo-%u-%@.txt", v37, v46];
          uint64_t v49 = v38;
          v70 = (void *)v38;
          v51 = uint64_t v50 = v27;
          v52 = +[SDTask taskWithCommand:@"/bin/launchctl" arguments:v48 outputFile:v51];
          v85[2] = v52;
          v81[0] = @"dump-concurrency";
          v81[1] = v49;
          v53 = +[NSArray arrayWithObjects:v81 count:2];
          v54 = [v50[421] stringWithFormat:@"swift-inspect-%u-%@.txt", v37, v46];
          v55 = +[SDTask taskWithCommand:@"/usr/bin/swift-inspect" arguments:v53 outputFile:v54];
          v85[3] = v55;
          v56 = +[NSArray arrayWithObjects:v85 count:4];

          NSFileAttributeKey v27 = v50;
          long long v33 = [v76 arrayByAddingObjectsFromArray:v56];

          uint64_t v28 = v75 + 1;
          self = v66;
        }
        while (v75 + 1 < v67);
        v57 = +[SDComplexContainer complexContainerWithTasks:v33 withTimeout:&__NSArray0__struct withRules:&stru_1000A1EA8 atDestination:v66 withDelegate:1 isConcurrent:(double)(unint64_t)((void)v63 * v61)];
        v58 = v57;
        if (v57)
        {
          [v57 setName:v64];
          [v60 addObject:v58];
        }

        uint64_t v25 = v65;
      }
      while (v65 != v62);
    }
  }

  return v60;
}

- (id)getSampleContainer
{
  unsigned int v3 = +[NSMutableArray array];
  uint64_t v4 = [(SystemDiagnostic *)self providedPIDorProcess];
  id v5 = +[NSString stringWithFormat:@"sample-%@.txt", v4];

  v14[0] = @"<PID>";
  v14[1] = @"2";
  v14[2] = @"-f";
  CFStringRef v6 = [@"<TMPOUTPUTDIR>" stringByAppendingPathComponent:v5];
  void v14[3] = v6;
  double v7 = +[NSArray arrayWithObjects:v14 count:4];

  id v8 = +[SDTask taskWithCommand:@"/usr/bin/sample" arguments:v7 outputFile:v5];
  double v13 = v8;
  id v9 = +[NSArray arrayWithObjects:&v13 count:1];

  uint64_t v10 = +[SDComplexContainer complexContainerWithTasks:v9 withTimeout:&__NSArray0__struct withRules:&stru_1000A1EA8 atDestination:self withDelegate:5.0];
  BOOL v11 = v10;
  if (v10)
  {
    [v10 setName:@"sample-targeted"];
    [v11 setRuntimeChecks:544];
    [v3 addObject:v11];
  }

  return v3;
}

- (id)getMultiTouchContainer
{
  unsigned int v3 = +[NSMutableArray array];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10002D6C0;
  v9[3] = &unk_10009D290;
  v9[4] = self;
  uint64_t v4 = objc_retainBlock(v9);
  id v5 = +[SDComplexContainer complexContainerWithBlock:v4 withTimeout:@"mtrecorder" atDestination:self withDelegate:6.0];
  CFStringRef v6 = v5;
  if (v5)
  {
    [v5 setRuntimeChecks:33];
    double v7 = [v6 collectionContainer];
    [v7 setMaximumSizeMB:15];

    [v3 addObject:v6];
  }

  return v3;
}

- (id)getPowermetricsContainer
{
  unsigned int v3 = +[NSMutableArray array];
  uint64_t v4 = +[SDTaskDepotContainer containerWithName:@"powermetrics" destination:0 withTimeout:1 withConcurrency:self withDelegate:10.0];
  id v5 = v4;
  if (v4)
  {
    [v4 setRuntimeChecks:32];
    [v5 setRunByItself:1];
    CFStringRef v6 = +[SDTask taskWithCommand:@"/usr/local/bin/powermetrics" arguments:&off_1000B1058 outputFile:@"powermetrics.txt"];
    id v9 = v6;
    double v7 = +[NSArray arrayWithObjects:&v9 count:1];
    [v5 addSDTasksToContainer:v7];

    [v3 addObject:v5];
  }

  return v3;
}

- (id)getTriggerBasebandDumpContainer
{
  unsigned int v3 = +[NSMutableArray array];
  uint64_t v4 = +[SDComplexContainer complexContainerWithSPITask:57 withTimeout:&stru_1000A1EA8 atDestination:self withDelegate:1.0];
  id v5 = v4;
  if (v4)
  {
    [v4 setRuntimeChecks:32];
    [v3 addObject:v5];
  }

  return v3;
}

- (id)getSpindumpContainers
{
  unsigned int v3 = +[NSMutableArray array];
  uint64_t v4 = [(SystemDiagnostic *)self getASPSnapshotContainer];
  if (v4) {
    [v3 addObject:v4];
  }
  id v5 = [(SystemDiagnostic *)self _internalSpindumpContainers];
  [v3 addObjectsFromArray:v5];

  CFStringRef v6 = +[SDLogCollectionContainer containerWithName:@"tailspin-history" destination:@"logs/tailspindb" withDelegate:self];
  double v7 = v6;
  if (v6)
  {
    [v6 setMaximumSizeMB:0];
    [v7 setRuntimeChecks:32];
    id v8 = [(SystemDiagnostic *)self startDiagnosticTime];
    id v9 = [v8 dateByAddingTimeInterval:-120.0];

    uint64_t v10 = +[SDUnitLogGlob logRuleWithGlob:@"/private/var/db/spindump/tailspin-trace*" withDate:v9 withFilter:0 newestFileCount:0 atInternalDirectory:0 withRuntimeChecks:0];
    double v13 = v10;
    BOOL v11 = +[NSArray arrayWithObjects:&v13 count:1];
    [v7 addRules:v11];

    [v3 addObject:v7];
  }

  return v3;
}

- (id)getASPSnapshotContainer
{
  uint64_t v2 = +[SDComplexContainer complexContainerWithSPITask:5 withTimeout:@"ASPSnapshots" atDestination:self withDelegate:5.0];
  unsigned int v3 = v2;
  if (v2)
  {
    [v2 setRuntimeChecks:32];
    uint64_t v4 = [v3 collectionContainer];
    [v4 setGenerateSummary:1];
  }

  return v3;
}

- (id)getTimeSensitiveContainers
{
  unsigned int v3 = [(SystemDiagnostic *)self _iOSGetTimeSensitiveContainers];
  uint64_t v4 = [(SystemDiagnostic *)self getAutogenTimeSensitiveContainers];
  [v3 addObjectsFromArray:v4];

  return v3;
}

- (id)getTailspinContainers
{
  unsigned int v3 = +[NSMutableArray array];
  uint64_t v4 = +[NSFileManager defaultManager];
  id v5 = [(SystemDiagnostic *)self tmpOutputDirectory];
  CFStringRef v6 = [v5 stringByAppendingPathComponent:@"tailspin-save/"];

  NSFileAttributeKey v23 = NSFilePosixPermissions;
  uint64_t v24 = &off_1000B11A8;
  double v7 = +[NSDictionary dictionaryWithObjects:&v24 forKeys:&v23 count:1];
  id v22 = 0;
  unsigned __int8 v8 = [v4 createDirectoryAtPath:v6 withIntermediateDirectories:0 attributes:v7 error:&v22];
  id v9 = v22;

  if (v8)
  {
    double v10 = (double)sub_100026A18(0);
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    void v20[2] = sub_10002E348;
    v20[3] = &unk_10009DA58;
    v20[4] = self;
    id v21 = v6;
    BOOL v11 = +[SDLogAgentContainer containerAtLocation:v21 forTaskType:50 withTimeout:self withDelegate:0 withMsgContents:v20 withReplyBlock:v10];
    uint64_t v12 = v11;
    if (v11)
    {
      [v11 setRuntimeChecks:32];
      [v12 setName:@"tailspin-save-ts"];
      [v12 setBlockUntilFinished:1];
      [v3 addObject:v12];
    }
    double v13 = +[SDComplexContainer complexContainerWithSPITask:46 withTimeout:&stru_1000A1EA8 atDestination:self withDelegate:10.0];
    id v14 = v13;
    if (v13)
    {
      [v13 setRuntimeChecks:32];
      [v14 setName:@"tailspin-info-ts"];
      unint64_t v15 = sub_100026628(0);
      uint64_t v16 = [v14 collectionContainer];
      [v16 setMaximumSizeMB:v15];

      [v3 addObject:v14];
    }
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100063198();
    }
    uint64_t v17 = +[SDResourceManager sharedResourceManager];
    [v17 stderrWrite:@"Unable to create intermediate tailspin save directory %@: %@", v6, v9];

    unint64_t v18 = +[SDResourceManager sharedResourceManager];
    [v18 log:@"Unable to create intermediate tailspin save directory %@: %@", v6, v9];
  }

  return v3;
}

- (id)getStackshotContainer
{
  unsigned int v3 = +[NSMutableArray array];
  if ([(SystemDiagnostic *)self requestSource] == 1) {
    uint64_t v4 = 41;
  }
  else {
    uint64_t v4 = 40;
  }
  id v5 = +[SDComplexContainer complexContainerWithSPITask:v4 withTimeout:&stru_1000A1EA8 atDestination:self withDelegate:5.0];
  CFStringRef v6 = v5;
  if (v5)
  {
    [v5 setName:@"time-sensitive-stackshot"];
    [v6 setRuntimeChecks:32];
    double v7 = [v6 taskContainer];
    [v7 setBlockUntilFinished:1];

    [v3 addObject:v6];
  }

  return v3;
}

- (id)_getSpindumpMetaContainer:(id)a3
{
  id v4 = a3;
  id v5 = +[NSFileManager defaultManager];
  CFStringRef v6 = [(SystemDiagnostic *)self tmpOutputDirectory];
  double v7 = [v6 stringByAppendingPathComponent:@"spindump/"];

  NSFileAttributeKey v25 = NSFilePosixPermissions;
  uint64_t v26 = &off_1000B11A8;
  unsigned __int8 v8 = +[NSDictionary dictionaryWithObjects:&v26 forKeys:&v25 count:1];
  id v22 = 0;
  unsigned __int8 v9 = [v5 createDirectoryAtPath:v7 withIntermediateDirectories:0 attributes:v8 error:&v22];
  id v10 = v22;

  if (v9)
  {
    BOOL v11 = [@"<TMPOUTPUTDIR>" stringByAppendingPathComponent:@"spindump-nosymbols.txt"];
    v24[0] = @"-file";
    v24[1] = v11;
    uint64_t v12 = +[NSArray arrayWithObjects:v24 count:2];
    [v4 addObjectsFromArray:v12];

    double v13 = +[SDTask taskWithCommand:@"/usr/sbin/spindump" arguments:v4 outputFile:@"errors/spindump_nosym_errors.txt"];
    [v13 setSlowTimeout:1];
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    void v20[2] = sub_10002E864;
    v20[3] = &unk_10009D2B8;
    v20[4] = self;
    id v14 = v7;
    id v21 = v14;
    unint64_t v15 = +[SDTaskDepotContainer containerWithName:@"spindump-meta" destination:&stru_1000A1EA8 withTimeout:1 withConcurrency:self withDelegate:v20 withCompletionBlock:30.0];
    uint64_t v16 = v15;
    if (v15)
    {
      [v15 setRuntimeChecks:32];
      [v16 setBlockUntilFinished:1];
      NSFileAttributeKey v23 = v13;
      uint64_t v17 = +[NSArray arrayWithObjects:&v23 count:1];
      [v16 addSDTasksToContainer:v17 withTmpOutputDir:v14];
    }
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100063214();
    }
    unint64_t v18 = +[SDResourceManager sharedResourceManager];
    [v18 stderrWrite:@"Unable to create intermediate spindump directory %@: %@", v7, v10];

    BOOL v11 = +[SDResourceManager sharedResourceManager];
    [v11 log:@"Unable to create intermediate spindump directory %@: %@", v7, v10];
    uint64_t v16 = 0;
  }

  return v16;
}

- (SystemDiagnostic)init
{
  v31.receiver = self;
  v31.super_class = (Class)SystemDiagnostic;
  uint64_t v2 = [(SystemDiagnostic *)&v31 init];
  unsigned int v3 = v2;
  if (v2)
  {
    rootPath = v2->_rootPath;
    v2->_rootPath = (NSString *)@"/";

    uint64_t v5 = [(SystemDiagnostic *)v3 defaultBaseDirectory];
    baseDirectory = v3->_baseDirectory;
    v3->_baseDirectory = (NSString *)v5;

    v3->_quickMode = 0;
    *(_DWORD *)&v3->_shouldRunTimeSensitiveTasks = 16843009;
    *(_WORD *)&v3->_shouldGetFeedbackData = 0;
    v3->_verbose = 0;
    *(_DWORD *)&v3->_earlyPrompt = 16843009;
    *(_WORD *)&v3->_shouldRemoveTemporaryDirectory = 1;
    v3->_requestSource = 0;
    archive = v3->_archive;
    v3->_archive = 0;

    v3->_shouldStreamToTar = 1;
    unsigned __int8 v8 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    metricsDict = v3->_metricsDict;
    v3->_metricsDict = v8;

    overrideContainers = v3->_overrideContainers;
    v3->_overrideContainers = 0;

    uint64_t v11 = objc_opt_new();
    executedContainers = v3->_executedContainers;
    v3->_executedContainers = (NSMutableDictionary *)v11;

    v3->_disableStreamTar = 0;
    v3->_coSysdiagnose = 0;
    v3->_coSysdiagnoseOnly = 0;
    v3->_disableUIFeedback = 0;
    summaryHandle = v3->_summaryHandle;
    v3->_summaryHandle = 0;

    frontmostBundleID = v3->_frontmostBundleID;
    v3->_frontmostBundleID = 0;

    v3->_shouldPostProcess = 1;
    capOverride = v3->_capOverride;
    v3->_capOverride = 0;

    v3->_didComplete = 0;
    uint64_t v16 = sub_100024FA0();
    diagnosticID = v3->_diagnosticID;
    v3->_diagnosticID = (NSString *)v16;

    coSysdiagnoseParameters = v3->_coSysdiagnoseParameters;
    v3->_coSysdiagnoseParameters = 0;

    changedDiagnosticProperties = v3->_changedDiagnosticProperties;
    v3->_changedDiagnosticProperties = (NSString *)&stru_1000A1EA8;

    v3->_summaryFD = 0;
    v3->_isTestingMode = 0;
    uint64_t v20 = +[NSMutableArray array];
    pidIndices = v3->_pidIndices;
    v3->_pidIndices = (NSMutableArray *)v20;

    v3->_useParallelCompression = 0;
    v3->_deShowFeedback = 0;
    onlyRunContainersWithNames = v3->_onlyRunContainersWithNames;
    v3->_onlyRunContainersWithNames = 0;

    completedOutputDirectory = v3->_completedOutputDirectory;
    v3->_completedOutputDirectory = 0;

    completedTarballPath = v3->_completedTarballPath;
    v3->_completedTarballPath = 0;

    totalTime = v3->_totalTime;
    v3->_totalTime = 0;

    dispatch_group_t v26 = dispatch_group_create();
    completionDispatchGroup = v3->_completionDispatchGroup;
    v3->_completionDispatchGroup = (OS_dispatch_group *)v26;

    sub_100048214(v32, 0x400uLL, "/private/var/mobile/Library/Logs/CrashReporter/Cloud/clouddocs", 0, 0);
    uint64_t v28 = +[NSString stringWithUTF8String:v32];
    brctl_dir = v3->_brctl_dir;
    v3->_brctl_dir = (NSString *)v28;

    *(_WORD *)&v3->_tconNvmDump = 0;
    [(SystemDiagnostic *)v3 populateProcesses];
  }
  return v3;
}

- (void)prompt
{
}

- (void)setSkipBTLogs
{
  id v2 = +[SystemDiagnosticBT sharedInstance];
  [v2 setShouldGatherBTLogs:0];
}

- (id)prepareCoSysdiagnoseParams
{
  xpc_object_t v3 = xpc_dictionary_create(0, 0, 0);
  id v4 = [(SystemDiagnostic *)self coSysdiagnoseParameters];

  if (v4)
  {
    uint64_t v5 = +[NSArray arrayWithObjects:@"stdout", @"stdin", @"stderr", @"coSysdiagnose", @"coSysdiagnoseOnly", @"clientPID", @"SDRequestSourceShell", @"baseDirectory", @"shouldCreateTarBall", @"warnProcAllowlist", @"archiveName", @"remoteUUIDs", 0];
    CFStringRef v6 = [(SystemDiagnostic *)self coSysdiagnoseParameters];
    applier[0] = _NSConcreteStackBlock;
    applier[1] = 3221225472;
    applier[2] = sub_10004A514;
    applier[3] = &unk_10009DE50;
    id v12 = v5;
    id v13 = v3;
    id v7 = v5;
    xpc_dictionary_apply(v6, applier);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "No co-sysdiagnose paramateres exist. Creating now", buf, 2u);
    }
    unsigned __int8 v8 = +[SDResourceManager sharedResourceManager];
    [v8 log:@"No co-sysdiagnose paramateres exist. Creating now"];

    xpc_dictionary_set_BOOL(v3, "generatePlist", [(SystemDiagnostic *)self generatePlist]);
    xpc_dictionary_set_BOOL(v3, "quickMode", [(SystemDiagnostic *)self quickMode]);
    xpc_dictionary_set_BOOL(v3, "shouldRunLogCopyTasks", [(SystemDiagnostic *)self shouldRunLogCopyTasks]);
    xpc_dictionary_set_BOOL(v3, "shouldRunLogGenerationTasks", [(SystemDiagnostic *)self shouldRunLogGenerationTasks]);
    xpc_dictionary_set_BOOL(v3, "shouldRunTimeSensitiveTasks", [(SystemDiagnostic *)self shouldRunTimeSensitiveTasks]);
    xpc_dictionary_set_BOOL(v3, "shouldRunOSLogArchive", [(SystemDiagnostic *)self shouldRunOSLogArchive]);
    xpc_dictionary_set_BOOL(v3, "disableStreamTar", [(SystemDiagnostic *)self disableStreamTar]);
  }

  return v3;
}

- (NSString)defaultBaseDirectory
{
}

- (BOOL)makeOutputDirectory
{
}

- (void)gatherDiagnostic
{
}

- (void)populateProcesses
{
  *(void *)uint64_t v17 = 0x600000001;
  if ([(SystemDiagnostic *)self processes]) {
    return;
  }
  int v16 = 0;
  if (sysctl(v17, 2u, &v16, &v15, 0, 0) == -1)
  {
    id v14 = "sysctl(... kern.maxproc ...)";
LABEL_17:
    perror(v14);
    return;
  }
  xpc_object_t v3 = malloc_type_malloc(4 * v16, 0x100004052888210uLL);
  if (!v3)
  {
    id v14 = "malloc";
    goto LABEL_17;
  }
  id v4 = v3;
  int v5 = proc_listallpids(v3, 4 * v16);
  if (v5 == -1)
  {
    perror("proc_listallpids");
    free(v4);
  }
  else
  {
    LODWORD(v6) = v5;
    id v7 = (char *)malloc_type_malloc(136 * v5, 0x1000040B5CA6940uLL);
    unsigned __int8 v8 = v7;
    if ((int)v6 < 1)
    {
      uint64_t v9 = 0;
    }
    else
    {
      LODWORD(v9) = 0;
      id v10 = (int *)v4;
      uint64_t v11 = v7;
      uint64_t v6 = v6;
      do
      {
        int v12 = *v10++;
        unsigned int v13 = proc_pidinfo(v12, 3, 0, v11, 136);
        if (v13 <= 0x87) {
          uint64_t v9 = v9;
        }
        else {
          uint64_t v9 = (v9 + 1);
        }
        v11 += 136 * (v13 > 0x87);
        --v6;
      }
      while (v6);
    }
    free(v4);
    [(SystemDiagnostic *)self setProcesses:v8];
    [(SystemDiagnostic *)self setProcessCount:v9];
  }
}

- (int)pidForProcessName:(id)a3
{
  id v4 = (const char *)[a3 UTF8String];
  if (![(SystemDiagnostic *)self processCount]) {
    [(SystemDiagnostic *)self populateProcesses];
  }
  if ([(SystemDiagnostic *)self processCount] < 1) {
    return -1;
  }
  uint64_t v5 = 0;
  uint64_t v6 = 0;
  while (strncmp((const char *)[(SystemDiagnostic *)self processes] + v5 + 48, v4, 0xFuLL))
  {
    ++v6;
    v5 += 136;
    if (v6 >= [(SystemDiagnostic *)self processCount]) {
      return -1;
    }
  }
  return *(_DWORD *)((char *)[(SystemDiagnostic *)self processes] + v5 + 12);
}

- (BOOL)_processIsTargeted:(id)a3
{
  id v4 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v5 = [(SystemDiagnostic *)self targetPIDs];
  uint64_t v6 = (char *)[v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v11;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v5);
        }
        if (sub_1000489E8())
        {
          LOBYTE(v6) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v6 = (char *)[v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return (char)v6;
}

- (BOOL)mailIsTargeted
{
  return [(SystemDiagnostic *)self _processIsTargeted:@"/Applications/Mail.app/Contents/MacOS/Mail"];
}

- (BOOL)safariIsTargeted
{
  return [(SystemDiagnostic *)self _processIsTargeted:@"/Applications/Safari.app/Contents/MacOS/Safari"];
}

- (BOOL)prepareOutput
{
  BOOL v3 = [(SystemDiagnostic *)self prepareOutputDirectory];
  if (v3)
  {
    id v4 = +[SDResourceManager sharedResourceManager];
    uint64_t v5 = [(SystemDiagnostic *)self outputDirectory];
    uint64_t v6 = [(SystemDiagnostic *)self diagnosticID];
    unsigned __int8 v7 = [v4 setUpSysdiagnoseLog:v5 withID:v6];

    if ((v7 & 1) == 0)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to set up sysdiagnose.log with SDResourceManager.", buf, 2u);
      }
      unsigned __int8 v8 = +[SDResourceManager sharedResourceManager];
      [v8 log:@"Failed to set up sysdiagnose.log with SDResourceManager."];
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = [(SystemDiagnostic *)self changedDiagnosticProperties];
      *(_DWORD *)buf = 138412290;
      id v37 = v9;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "The following properties were changed from default:\n%@", buf, 0xCu);
    }
    long long v10 = +[SDResourceManager sharedResourceManager];
    long long v11 = [(SystemDiagnostic *)self changedDiagnosticProperties];
    [v10 log:@"The following properties were changed from default:\n%@", v11];

    if (sub_100048604())
    {
      long long v12 = [(SystemDiagnostic *)self warnProcessAllowlist];

      if (v12)
      {
        long long v13 = [(SystemDiagnostic *)self outputDirectory];
        id v14 = [(SystemDiagnostic *)self warnProcessAllowlist];
        size_t v15 = [v13 stringByAppendingPathComponent:v14];
        int v16 = [v15 stringByAppendingString:@"_WARNING.log"];

        id v17 = v16;
        unint64_t v18 = fopen((const char *)[v17 fileSystemRepresentation], "wx");
        if (v18)
        {
          unint64_t v19 = v18;
          fputs(off_1000BD488, v18);
          fclose(v19);
        }
        else
        {
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Unable to create warning for disallowed process", buf, 2u);
          }
          uint64_t v20 = +[SDResourceManager sharedResourceManager];
          [v20 stdoutWrite:@"Unable to create warning for disallowed process"];

          id v21 = +[SDResourceManager sharedResourceManager];
          [v21 log:@"Unable to create warning for disallowed process"];
        }
      }
      id v22 = [(SystemDiagnostic *)self outputDirectory];
      id v23 = [v22 stringByAppendingPathComponent:@"tailspin-README.txt"];
      uint64_t v24 = (const char *)[v23 fileSystemRepresentation];

      NSFileAttributeKey v25 = fopen("/AppleInternal/tailspin/tailspin-README.txt", "r");
      if (v25)
      {
        dispatch_group_t v26 = fopen(v24, "wx");
        if (v26)
        {
          NSFileAttributeKey v27 = v26;
          size_t v28 = fread(v35, 1uLL, 0x400uLL, v25);
          if (v28)
          {
            size_t v29 = v28;
            long long v30 = v35;
            do
            {
              do
              {
                size_t v31 = fwrite(v30, 1uLL, v29, v27);
                v30 += v31;
                v29 -= v31;
              }
              while (v29);
              size_t v29 = fread(v35, 1uLL, 0x400uLL, v25);
              long long v30 = v35;
            }
            while (v29);
          }
          fclose(v27);
        }
        else
        {
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Unable to create tailspin-README.rtf", buf, 2u);
          }
          long long v32 = +[SDResourceManager sharedResourceManager];
          [v32 stdoutWrite:@"Unable to create tailspin-README.rtf"];

          long long v33 = +[SDResourceManager sharedResourceManager];
          [v33 log:@"Unable to create tailspin-README.rtf"];
        }
      }
      fclose(v25);
    }
  }
  return v3;
}

- (void)completeTarball
{
  BOOL v3 = +[NSFileManager defaultManager];
  if ([(SystemDiagnostic *)self shouldCreateTarBall])
  {
    id v4 = [(SystemDiagnostic *)self archive];

    if (!v4)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "The tarball wasn't safely created. Something's wrong.", buf, 2u);
      }
      size_t v28 = +[SDResourceManager sharedResourceManager];
      [v28 stdoutWrite:@"The tarball wasn't safely created. Something's wrong."];

      id v17 = +[SDResourceManager sharedResourceManager];
      [v17 log:@"The tarball wasn't safely created. Something's wrong."];
      goto LABEL_16;
    }
    uint64_t v5 = [(SystemDiagnostic *)self tarballPath];
    unsigned __int8 v6 = [v3 fileExistsAtPath:v5 isDirectory:0];

    if (v6)
    {
      unsigned __int8 v7 = [(SystemDiagnostic *)self didComplete];
      BOOL v8 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
      if (v7)
      {
        if (v8)
        {
          uint64_t v9 = [(SystemDiagnostic *)self tarballPath];
          long long v10 = [(SystemDiagnostic *)self completedTarballPath];
          *(_DWORD *)buf = 138412546;
          id v42 = v9;
          __int16 v43 = 2112;
          v44 = v10;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Moving tarball '%@' to final location '%@'", buf, 0x16u);
        }
        long long v11 = +[SDResourceManager sharedResourceManager];
        long long v12 = [(SystemDiagnostic *)self tarballPath];
        long long v13 = [(SystemDiagnostic *)self completedTarballPath];
        [v11 log:@"Moving tarball '%@' to final location '%@'", v12, v13];

        id v14 = [(SystemDiagnostic *)self tarballPath];
        size_t v15 = [(SystemDiagnostic *)self completedTarballPath];
        id v39 = 0;
        unsigned __int8 v16 = [v3 moveItemAtPath:v14 toPath:v15 error:&v39];
        id v17 = v39;

        if (v16) {
          goto LABEL_12;
        }
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          sub_100065530(self, v17);
        }
        unint64_t v18 = +[SDResourceManager sharedResourceManager];
        unint64_t v19 = [(SystemDiagnostic *)self tarballPath];
        uint64_t v20 = [(SystemDiagnostic *)self completedTarballPath];
        id v21 = [v17 localizedDescription];
        [v18 log:@"Failed to move tarball '%@' to final location '%@': %@", v19, v20, v21];

        id v22 = [(SystemDiagnostic *)self completedTarballPath];
        int v23 = sub_100026EF8((const char *)[v22 fileSystemRepresentation], -[SystemDiagnostic isDeviceUnlockedSinceBoot](self, "isDeviceUnlockedSinceBoot"));

        if (v23 == -1) {
          goto LABEL_26;
        }
        uint64_t v24 = [(SystemDiagnostic *)self archive];
        char v25 = sub_100026C68((int)[v24 archiveFD], v23);

        if (v25)
        {
LABEL_12:
          dispatch_group_t v26 = [(SystemDiagnostic *)self completedTarballPath];
          [(SystemDiagnostic *)self setTarballPath:v26];

          NSFileAttributeKey v27 = [(SystemDiagnostic *)self tarballPath];
          sub_1000282A4();
        }
        else
        {
LABEL_26:
          [(SystemDiagnostic *)self setCanDisplayTarBall:0];
        }
LABEL_16:

        goto LABEL_23;
      }
      if (v8)
      {
        long long v32 = [(SystemDiagnostic *)self tarballPath];
        *(_DWORD *)buf = 138412290;
        id v42 = v32;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Sysdiagnose was cancelled. Remove tarball at %@.", buf, 0xCu);
      }
      long long v33 = +[SDResourceManager sharedResourceManager];
      id v34 = [(SystemDiagnostic *)self tarballPath];
      [v33 log:@"Sysdiagnose was cancelled. Remove tarball at %@.", v34];

      v35 = [(SystemDiagnostic *)self tarballPath];
      id v40 = 0;
      [v3 removeItemAtPath:v35 error:&v40];
      id v36 = v40;

      [(SystemDiagnostic *)self setCanDisplayTarBall:0];
    }
    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        size_t v29 = [(SystemDiagnostic *)self tarballPath];
        *(_DWORD *)buf = 138412290;
        id v42 = v29;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Tarball at %@ doesn't exist. Something's wrong", buf, 0xCu);
      }
      long long v30 = +[SDResourceManager sharedResourceManager];
      size_t v31 = [(SystemDiagnostic *)self tarballPath];
      [v30 log:@"Tarball at %@ doesn't exist. Something's wrong", v31];

      [(SystemDiagnostic *)self setCanDisplayTarBall:0];
    }
  }
LABEL_23:
  id v37 = [(SystemDiagnostic *)self archive];

  if (v37)
  {
    uint64_t v38 = [(SystemDiagnostic *)self archive];
    [v38 closeArchive];
  }
}

- (void)markFoldersAsComplete
{
  BOOL v3 = +[NSFileManager defaultManager];
  id v4 = [(SystemDiagnostic *)self tmpOutputDirectory];
  id v51 = 0;
  unsigned __int8 v5 = [v3 removeItemAtPath:v4 error:&v51];
  id v6 = v51;

  if ((v5 & 1) == 0)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      unsigned __int8 v7 = [(SystemDiagnostic *)self tmpOutputDirectory];
      *(_DWORD *)buf = 138412546;
      v53 = v7;
      __int16 v54 = 2112;
      id v55 = v6;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to remove tmpOutputDir %@ upon completion: %@", buf, 0x16u);
    }
    BOOL v8 = +[SDResourceManager sharedResourceManager];
    uint64_t v9 = [(SystemDiagnostic *)self tmpOutputDirectory];
    [v8 log:@"Failed to remove tmpOutputDir %@ upon completion: %@", v9, v6];

    id v6 = 0;
  }
  if ([(SystemDiagnostic *)self shouldRemoveTemporaryDirectory]) {
    unsigned int v10 = [(SystemDiagnostic *)self shouldCreateTarBall];
  }
  else {
    unsigned int v10 = 0;
  }
  if (![(SystemDiagnostic *)self didComplete] || v10)
  {
    long long v11 = [(SystemDiagnostic *)self outputDirectory];
    id v50 = v6;
    unsigned __int8 v12 = [v3 removeItemAtPath:v11 error:&v50];
    id v13 = v50;

    if (v12)
    {
      id v6 = v13;
    }
    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        id v14 = [(SystemDiagnostic *)self outputDirectory];
        *(_DWORD *)buf = 138412546;
        v53 = v14;
        __int16 v54 = 2112;
        id v55 = v13;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to remove outputDir %@ upon completion: %@", buf, 0x16u);
      }
      size_t v15 = +[SDResourceManager sharedResourceManager];
      unsigned __int8 v16 = [(SystemDiagnostic *)self outputDirectory];
      [v15 log:@"Failed to remove outputDir %@ upon completion: %@", v16, v13];

      id v6 = 0;
    }
  }
  id v17 = [(SystemDiagnostic *)self outputDirectory];
  unsigned int v18 = [v3 fileExistsAtPath:v17 isDirectory:0];

  if (v18)
  {
    unint64_t v19 = [(SystemDiagnostic *)self outputDirectory];
    uint64_t v20 = [(SystemDiagnostic *)self completedOutputDirectory];
    id v49 = v6;
    unsigned __int8 v21 = [v3 moveItemAtPath:v19 toPath:v20 error:&v49];
    id v22 = v49;

    if (v21)
    {
      int v23 = [(SystemDiagnostic *)self completedOutputDirectory];
      [(SystemDiagnostic *)self setOutputDirectory:v23];

      id v6 = v22;
    }
    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        NSFileAttributeKey v27 = [(SystemDiagnostic *)self outputDirectory];
        *(_DWORD *)buf = 138412546;
        v53 = v27;
        __int16 v54 = 2112;
        id v55 = v22;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to rename outputDir %@ upon completion: %@", buf, 0x16u);
      }
      size_t v28 = +[SDResourceManager sharedResourceManager];
      size_t v29 = [(SystemDiagnostic *)self outputDirectory];
      [v28 log:@"Failed to rename outputDir %@ upon completion: %@", v29, v22];

      [(SystemDiagnostic *)self setCanDisplayTarBall:0];
      id v6 = 0;
    }
  }
  else if (((![(SystemDiagnostic *)self didComplete] | v10) & 1) == 0)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v24 = [(SystemDiagnostic *)self outputDirectory];
      *(_DWORD *)buf = 138412290;
      v53 = v24;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Output dir at %@ doesn't exist. Something's wrong", buf, 0xCu);
    }
    char v25 = +[SDResourceManager sharedResourceManager];
    dispatch_group_t v26 = [(SystemDiagnostic *)self outputDirectory];
    [v25 log:@"Output dir at %@ doesn't exist. Something's wrong", v26];

    [(SystemDiagnostic *)self setCanDisplayTarBall:0];
  }
  [(SystemDiagnostic *)self completeTarball];
  long long v30 = [(SystemDiagnostic *)self baseDirectory];
  size_t v31 = [(SystemDiagnostic *)self defaultBaseDirectory];
  unsigned int v32 = [v30 isEqualToString:v31];

  if (v32)
  {
    id v33 = [(SystemDiagnostic *)self baseDirectory];
    int v34 = sub_1000567B0((const char *)[v33 UTF8String], 0x1F5u, 0x1F5u);

    if (v34 == -1)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        v35 = __error();
        id v36 = strerror(*v35);
        *(_DWORD *)buf = 136315138;
        v53 = v36;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to set permissions for base directory: %s", buf, 0xCu);
      }
      id v37 = +[SDResourceManager sharedResourceManager];
      uint64_t v38 = __error();
      [v37 log:@"Failed to set permissions for base directory: %s", strerror(*v38)];
    }
  }
  id v39 = [(SystemDiagnostic *)self brctl_dir];
  id v48 = v6;
  unsigned __int8 v40 = [v3 removeItemAtPath:v39 error:&v48];
  id v41 = v48;

  BOOL v42 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
  if (v40)
  {
    if (v42)
    {
      __int16 v43 = [(SystemDiagnostic *)self brctl_dir];
      *(_DWORD *)buf = 138412290;
      v53 = v43;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Successfully removed brctl dir %@", buf, 0xCu);
    }
    v44 = +[SDResourceManager sharedResourceManager];
    unsigned int v45 = [(SystemDiagnostic *)self brctl_dir];
    [v44 log:@"Successfully removed brctl dir %@", v45, v47];
  }
  else
  {
    if (v42)
    {
      unsigned int v46 = [(SystemDiagnostic *)self brctl_dir];
      *(_DWORD *)buf = 138412546;
      v53 = v46;
      __int16 v54 = 2112;
      id v55 = v41;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to remove brctl dir %@ upon completion: %@", buf, 0x16u);
    }
    v44 = +[SDResourceManager sharedResourceManager];
    unsigned int v45 = [(SystemDiagnostic *)self brctl_dir];
    [v44 log:@"Failed to remove brctl dir %@ upon completion: %@", v45, v41];
  }
}

- (BOOL)isPromptEligible
{
  return ![(SystemDiagnostic *)self disableUIFeedback]
      && ([(SystemDiagnostic *)self requestSource] == 1
       || [(SystemDiagnostic *)self requestSource] == 4);
}

- (void)run
{
  BOOL v3 = +[SDResourceManager sharedResourceManager];
  [v3 registerDiagnosticObject:self];

  id v4 = [(SystemDiagnostic *)self completionDispatchGroup];
  dispatch_group_enter(v4);

  unsigned __int8 v5 = sub_100028174();
  if (os_signpost_enabled(v5))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v5, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "SDObjSetup", "[run] run function begins", buf, 2u);
  }

  nullsub_3(1);
  sub_100027C2C(300.0);
  id v6 = _os_activity_create((void *)&_mh_execute_header, "Directory setup", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v6, &state);
  *(void *)buf = 0;
  v44 = buf;
  uint64_t v45 = 0x2020000000;
  char v46 = 0;
  v42[0] = _NSConcreteStackBlock;
  v42[1] = 3221225472;
  v42[2] = sub_10004C510;
  v42[3] = &unk_10009D008;
  v42[4] = self;
  v42[5] = buf;
  unsigned int v7 = +[SystemDiagnostic _runBlock:v42 withTimeout:3.0];
  if (v44[24])
  {
    unsigned int v8 = v7;
    id v9 = &_os_log_default;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v10 = sub_1000491E8();
      *(_DWORD *)id v48 = 138412290;
      id v49 = v10;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%@", v48, 0xCu);
    }
    long long v11 = +[SDResourceManager sharedResourceManager];
    unsigned __int8 v12 = sub_1000491E8();
    [v11 stdoutWrite:@"%@", v12];

    id v13 = +[SDResourceManager sharedResourceManager];
    id v14 = sub_1000491E8();
    [v13 log:@"%@", v14];

    +[SystemDiagnostic _runBlock:&stru_10009DE70 withTimeout:0.25];
    id v15 = &_os_log_default;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      unsigned __int8 v16 = sub_100024D2C([(SystemDiagnostic *)self requestSource]);
      *(_DWORD *)id v48 = 138412290;
      id v49 = v16;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Request source: %@", v48, 0xCu);
    }
    id v17 = +[SDResourceManager sharedResourceManager];
    unsigned int v18 = sub_100024D2C([(SystemDiagnostic *)self requestSource]);
    [v17 log:@"Request source: %@", v18];

    unint64_t v19 = sub_100028174();
    if (os_signpost_enabled(v19))
    {
      *(_WORD *)id v48 = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v19, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "SDObjSetup", "[run] setup ended! gather diagnostic logs...", v48, 2u);
    }

    if (v8)
    {
      if (![(SystemDiagnostic *)self shouldCreateTarBall])
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)id v48 = 0;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Disabling streaming into tar as we are not creating tarball", v48, 2u);
        }
        uint64_t v20 = +[SDResourceManager sharedResourceManager];
        [v20 log:@"Disabling streaming into tar as we are not creating tarball"];

        [(SystemDiagnostic *)self setDisableStreamTar:1];
      }
      if (![(SystemDiagnostic *)self shouldRunIDSDump]) {
        [(SystemDiagnostic *)self setShouldRunIDSDump:sub_100023FD4()];
      }
      unsigned __int8 v21 = sub_100028174();
      if (os_signpost_enabled(v21))
      {
        *(_WORD *)id v48 = 0;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v21, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "SDObjGatherDiagnostic", "[run] gather diagnostic phase function begins", v48, 2u);
      }

      kdebug_trace();
      [(SystemDiagnostic *)self initStreaming];
      [(SystemDiagnostic *)self gatherDiagnostic];
      kdebug_trace();
      [(SystemDiagnostic *)self markFoldersAsComplete];
      [(SystemDiagnostic *)self sendCoreAnalytics];
      [(SystemDiagnostic *)self closeTaskSummaryHandle];
      if ([(SystemDiagnostic *)self requestSource] == 2)
      {
        id v22 = +[SDResourceManager sharedResourceManager];
        [v22 closeCLI];
      }
      int v23 = sub_100028174();
      if (os_signpost_enabled(v23))
      {
        *(_WORD *)id v48 = 0;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v23, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "SDObjGatherDiagnostic", "[run] gather diagnostic ended!", v48, 2u);
      }

      if (![(SystemDiagnostic *)self earlyPrompt]
        && [(SystemDiagnostic *)self isPromptEligible])
      {
        [(SystemDiagnostic *)self prompt];
      }
    }
    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v48 = 0;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Timed out preparing sysdiagnose output. Cleaning up", v48, 2u);
      }
      char v25 = +[SDResourceManager sharedResourceManager];
      dispatch_group_t v26 = [(SystemDiagnostic *)self diagnosticID];
      [v25 setUpDiagnosticID:v26];

      NSFileAttributeKey v27 = [(SystemDiagnostic *)self baseDirectory];
      size_t v28 = +[SDTaskDepot sharedTaskDepot];
      [v28 setOutputDirectory:v27];

      size_t v29 = +[SDCacheEnumerator sysdiagnoseDirectory];
      long long v30 = +[SDLogAgentContainer containerAtLocation:v29 forTaskType:49 withTimeout:self withDelegate:0 withMsgContents:0 withReplyBlock:10.0];
      size_t v31 = v30;
      if (v30)
      {
        [v30 setRuntimeChecks:0];
        [v31 setName:@"tailspin-save-output-dir-timeout"];
        [v31 execute];
      }
      unsigned int v32 = [v31 paths];
      id v33 = [v32 count];

      if (v33 == (id)1)
      {
        int v34 = [v31 paths];
        v35 = [v34 objectAtIndexedSubscript:0];
      }
      else
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)id v48 = 134217984;
          id v49 = v33;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "output dir timeout tailspin task returned wrong number of paths (%ld)", v48, 0xCu);
        }
        v35 = 0;
      }
      [(SystemDiagnostic *)self setShouldCreateTarBall:1];
      [(SystemDiagnostic *)self setDidComplete:1];
      [(SystemDiagnostic *)self setTarballPath:v35];
      if ([(SystemDiagnostic *)self requestSource] == 2)
      {
        id v36 = +[SDResourceManager sharedResourceManager];
        [v36 closeCLI];
      }
      id v37 = +[SDResourceManager sharedResourceManager];
      [v37 closeSysdiagnoseLog];
    }
    if ([(SystemDiagnostic *)self requestSource] != 2)
    {
      uint64_t v38 = +[SDResourceManager sharedResourceManager];
      [v38 closeSysdiagnoseSession];
    }
    sub_100027D1C();
    uint64_t v24 = +[CSCoordinator sharedInstance];
    id v39 = [(SystemDiagnostic *)self tarballPath];
    unsigned __int8 v40 = [(SystemDiagnostic *)self diagnosticID];
    [v24 transferFileToHostIfNecessary:v39 forDiagnosticID:v40];
  }
  else
  {
    uint64_t v24 = sub_100028174();
    if (os_signpost_enabled(v24))
    {
      *(_WORD *)id v48 = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v24, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "SDObjSetup", "[run] setup ended! gather diagnostic logs...", v48, 2u);
    }
  }

  id v41 = [(SystemDiagnostic *)self completionDispatchGroup];
  dispatch_group_leave(v41);

  nullsub_3(0);
  _Block_object_dispose(buf, 8);
  os_activity_scope_leave(&state);
}

- (id)getDefaultArchiveName
{
  BOOL v3 = [(SystemDiagnostic *)self diagnosticID];
  id v4 = [(SystemDiagnostic *)self providedPIDorProcess];

  if (v4)
  {
    unsigned __int8 v5 = [(SystemDiagnostic *)self providedPIDorProcess];
    id v6 = [v5 stringByReplacingOccurrencesOfString:@" " withString:@"-"];
    uint64_t v7 = +[NSString stringWithFormat:@"%@_%@", v3, v6];

    BOOL v3 = (void *)v7;
  }
  CFDictionaryRef v8 = (const __CFDictionary *)_CFCopySupplementalVersionDictionary();
  if (v8)
  {
    CFDictionaryRef v9 = v8;
    unsigned int v10 = CFDictionaryGetValue(v8, _kCFSystemVersionProductNameKey);
    long long v11 = CFDictionaryGetValue(v9, _kCFSystemVersionBuildVersionKey);
    unsigned __int8 v12 = +[NSMutableArray arrayWithObject:v3];
    if (v10)
    {
      id v13 = [v10 stringByReplacingOccurrencesOfString:@" " withString:@"-"];
      [v12 addObject:v13];
    }
    id v14 = (__CFString *)MGCopyAnswer();
    if ([(__CFString *)v14 isEqualToString:@"AudioAccessory"])
    {

      id v14 = @"HomePod";
    }
    else if (!v14)
    {
LABEL_10:
      if ([(__CFString *)v14 isEqualToString:@"HomePod"])
      {
        id v15 = sub_10002AC68();
        [v12 addObject:v15];
      }
      if (v11) {
        [v12 addObject:v11];
      }
      uint64_t v16 = [v12 componentsJoinedByString:@"_"];

      CFRelease(v9);
      BOOL v3 = (void *)v16;
      goto LABEL_15;
    }
    [v12 addObject:v14];
    goto LABEL_10;
  }
LABEL_15:

  return v3;
}

- (id)getArchiveExtension
{
  if ([(SystemDiagnostic *)self useParallelCompression]) {
    return @".aar";
  }
  else {
    return @".tar.gz";
  }
}

- (BOOL)preparePaths
{
  BOOL v3 = [(SystemDiagnostic *)self getDefaultArchiveName];
  id v4 = [@"IN_PROGRESS_" stringByAppendingString:v3];
  unsigned __int8 v5 = [(SystemDiagnostic *)self getArchiveExtension];
  id v6 = [@"/private/var/db/sysdiagnose/com.apple.sysdiagnose" stringByAppendingPathComponent:v4];
  [(SystemDiagnostic *)self setOutputDirectory:v6];

  uint64_t v7 = +[SDCacheEnumerator sysdiagnoseDirectory];
  CFDictionaryRef v8 = +[NSString stringWithFormat:@"%@/%@.tmp", v7, v4];
  [(SystemDiagnostic *)self setTmpOutputDirectory:v8];

  CFDictionaryRef v9 = [(SystemDiagnostic *)self outputDirectory];
  unsigned int v10 = [v9 stringByAppendingString:v5];
  [(SystemDiagnostic *)self setTarballPath:v10];

  long long v11 = [(SystemDiagnostic *)self archiveName];

  if (!v11)
  {
    [(SystemDiagnostic *)self setArchiveName:v3];
LABEL_9:
    dispatch_group_t v26 = [(SystemDiagnostic *)self baseDirectory];
    NSFileAttributeKey v27 = [(SystemDiagnostic *)self archiveName];
    size_t v28 = [v26 stringByAppendingPathComponent:v27];
    [(SystemDiagnostic *)self setCompletedOutputDirectory:v28];

    size_t v29 = [(SystemDiagnostic *)self archiveName];
    long long v30 = [v29 stringByAppendingString:v5];

    size_t v31 = [(SystemDiagnostic *)self baseDirectory];
    unsigned int v32 = [v31 stringByAppendingPathComponent:v30];
    [(SystemDiagnostic *)self setCompletedTarballPath:v32];

    BOOL v25 = 1;
    goto LABEL_10;
  }
  unsigned __int8 v12 = [(SystemDiagnostic *)self archiveName];
  unsigned int v13 = [v12 hasSuffix:v5];

  if (v13)
  {
    id v14 = [(SystemDiagnostic *)self archiveName];
    id v15 = [(SystemDiagnostic *)self archiveName];
    uint64_t v16 = [v14 substringToIndex:((unsigned char *)[v15 length] - (unsigned char *)[v5 length])];
    [(SystemDiagnostic *)self setArchiveName:v16];
  }
  id v17 = [(SystemDiagnostic *)self archiveName];
  unsigned int v18 = [(SystemDiagnostic *)self archiveName];
  unint64_t v19 = [v18 lastPathComponent];
  unsigned __int8 v20 = [v17 isEqualToString:v19];

  if (v20) {
    goto LABEL_9;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_100065614(self);
  }
  unsigned __int8 v21 = +[SDResourceManager sharedResourceManager];
  id v22 = [(SystemDiagnostic *)self archiveName];
  [v21 stderrWrite:@"Archive name invalid: %@", v22];

  int v23 = +[SDResourceManager sharedResourceManager];
  uint64_t v24 = [(SystemDiagnostic *)self archiveName];
  [v23 log:@"Archive name invalid: %@", v24];

  BOOL v25 = 0;
LABEL_10:

  return v25;
}

- (BOOL)makeTargetDirectory:(id)a3
{
  BOOL v3 = (const char *)[a3 UTF8String];
  int v4 = mkpath_np(v3, 0x1E8u);
  if (v4)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      CFDictionaryRef v9 = v3;
      __int16 v10 = 2080;
      long long v11 = strerror(v4);
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to create %s: %s", buf, 0x16u);
    }
    unsigned __int8 v5 = +[SDResourceManager sharedResourceManager];
    [v5 stdoutWrite:@"Failed to create %s: %s", v3, strerror(v4)];

    id v6 = +[SDResourceManager sharedResourceManager];
    [v6 log:@"Failed to create %s: %s", v3, strerror(v4)];
  }
  return v4 == 0;
}

- (BOOL)prepareOutputDirectory
{
  BOOL v3 = [(SystemDiagnostic *)self outputDirectory];

  if (!v3)
  {
    if (![(SystemDiagnostic *)self preparePaths]) {
      return 0;
    }
    int v4 = +[SDResourceManager sharedResourceManager];
    unsigned __int8 v5 = [(SystemDiagnostic *)self diagnosticID];
    [v4 setUpDiagnosticID:v5];
  }
  id v6 = +[NSFileManager defaultManager];
  uint64_t v7 = [(SystemDiagnostic *)self outputDirectory];
  unsigned int v8 = [v6 fileExistsAtPath:v7 isDirectory:0];

  if (!v8)
  {
    if ([(SystemDiagnostic *)self shouldCreateTarBall])
    {
      id v14 = [(SystemDiagnostic *)self completedTarballPath];
      unsigned int v15 = [v6 fileExistsAtPath:v14 isDirectory:0];

      if (v15)
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          sub_100065724(self);
        }
        uint64_t v16 = +[SDResourceManager sharedResourceManager];
        id v17 = [(SystemDiagnostic *)self completedTarballPath];
        CFStringRef v11 = @"Output archive already exists: %@\n";
        [v16 stderrWrite:@"Output archive already exists: %@\n", v17];

        id v12 = +[SDResourceManager sharedResourceManager];
        uint64_t v13 = [(SystemDiagnostic *)self completedTarballPath];
        goto LABEL_17;
      }
    }
    else
    {
      unsigned int v18 = [(SystemDiagnostic *)self completedOutputDirectory];
      unsigned int v19 = [v6 fileExistsAtPath:v18 isDirectory:0];

      if (v19)
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          sub_100065914(self);
        }
        unsigned __int8 v20 = +[SDResourceManager sharedResourceManager];
        unsigned __int8 v21 = [(SystemDiagnostic *)self completedOutputDirectory];
        CFStringRef v11 = @"Output directory already exists: %@\n";
        [v20 stderrWrite:@"Output directory already exists: %@\n", v21];

        id v12 = +[SDResourceManager sharedResourceManager];
        uint64_t v13 = [(SystemDiagnostic *)self completedOutputDirectory];
        goto LABEL_17;
      }
    }
    if (![(SystemDiagnostic *)self makeOutputDirectory])
    {
      BOOL v23 = 0;
      goto LABEL_20;
    }
    BOOL v25 = [(SystemDiagnostic *)self outputDirectory];
    dispatch_group_t v26 = [v25 stringByAppendingPathComponent:@"errors"];
    NSFileAttributeKey v70 = NSFilePosixPermissions;
    v71 = &off_1000B1238;
    NSFileAttributeKey v27 = +[NSDictionary dictionaryWithObjects:&v71 forKeys:&v70 count:1];
    id v61 = 0;
    unsigned __int8 v28 = [v6 createDirectoryAtPath:v26 withIntermediateDirectories:0 attributes:v27 error:&v61];
    id v12 = v61;

    if ((v28 & 1) == 0)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_1000658A4();
      }
      v52 = +[SDResourceManager sharedResourceManager];
      [v52 stderrWrite:@"Unable to create errors directory: %@", v12];

      id v22 = +[SDResourceManager sharedResourceManager];
      [v22 log:@"Unable to create errors directory: %@", v12];
      goto LABEL_18;
    }
    size_t v29 = [(SystemDiagnostic *)self outputDirectory];
    long long v30 = [v29 stringByAppendingPathComponent:@"summaries"];
    NSFileAttributeKey v68 = NSFilePosixPermissions;
    v69 = &off_1000B1238;
    size_t v31 = +[NSDictionary dictionaryWithObjects:&v69 forKeys:&v68 count:1];
    id v60 = v12;
    unsigned __int8 v32 = [v6 createDirectoryAtPath:v30 withIntermediateDirectories:0 attributes:v31 error:&v60];
    id v33 = v60;

    if (v32)
    {
      int v34 = [(SystemDiagnostic *)self baseDirectory];
      v35 = [(SystemDiagnostic *)self defaultBaseDirectory];
      unsigned int v36 = [v34 isEqualToString:v35];

      if (!v36
        || ([(SystemDiagnostic *)self baseDirectory],
            id v37 = objc_claimAutoreleasedReturnValue(),
            int v38 = sub_1000567B0((const char *)[v37 UTF8String], 0, 0x1F5u),
            v37,
            v38 != -1))
      {
        id v39 = [(SystemDiagnostic *)self outputDirectory];
        id v22 = [v39 stringByAppendingPathComponent:@"README.txt"];

        unsigned __int8 v40 = +[NSData dataWithBytes:off_1000BD480 length:strlen(off_1000BD480)];
        NSFileAttributeKey v66 = NSFilePosixPermissions;
        unint64_t v67 = &off_1000B1250;
        id v41 = +[NSDictionary dictionaryWithObjects:&v67 forKeys:&v66 count:1];
        unsigned __int8 v42 = [v6 createFileAtPath:v22 contents:v40 attributes:v41];

        if ((v42 & 1) == 0)
        {
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            __int16 v43 = __error();
            v44 = strerror(*v43);
            *(_DWORD *)buf = 136315138;
            uint64_t v65 = v44;
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to create README file: %s", buf, 0xCu);
          }
          uint64_t v45 = +[SDResourceManager sharedResourceManager];
          char v46 = __error();
          [v45 log:@"Failed to create README file: %s", strerror(*v46)];
        }
        uint64_t v47 = [(SystemDiagnostic *)self outputDirectory];
        id v48 = [v47 stringByAppendingPathComponent:@"taskSummary.csv"];

        NSFileAttributeKey v62 = NSFilePosixPermissions;
        v63 = &off_1000B1250;
        id v49 = +[NSDictionary dictionaryWithObjects:&v63 forKeys:&v62 count:1];
        unsigned __int8 v50 = [v6 createFileAtPath:v48 contents:0 attributes:v49];

        if (v50)
        {
          id v51 = +[NSFileHandle fileHandleForWritingAtPath:v48];
          [(SystemDiagnostic *)self setSummaryHandle:v51];
        }
        else
        {
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Summary file couldn't be created", buf, 2u);
          }
          id v51 = +[SDResourceManager sharedResourceManager];
          [v51 log:@"Summary file couldn't be created"];
        }

        __int16 v54 = [(SystemDiagnostic *)self summaryHandle];

        if (v54)
        {
          id v55 = [(SystemDiagnostic *)self summaryHandle];
          [v55 seekToEndOfFile];

          v56 = [(SystemDiagnostic *)self summaryHandle];
          sub_100027E00(v56, 0, @"Command,Exit description,Execution Time,Intended Timeout, MAX RSS (MB)\n", @"writing summary file header");
        }
        else
        {
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Couldn't get a valid file handle to write to task summary", buf, 2u);
          }
          v56 = +[SDResourceManager sharedResourceManager];
          [v56 log:@"Couldn't get a valid file handle to write to task summary"];
        }

        BOOL v23 = 1;
        goto LABEL_51;
      }
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_1000657AC(self);
      }
      v57 = +[SDResourceManager sharedResourceManager];
      v58 = [(SystemDiagnostic *)self baseDirectory];
      [v57 stderrWrite:@"Failed to set attributes on %@", v58];

      id v22 = +[SDResourceManager sharedResourceManager];
      v59 = [(SystemDiagnostic *)self baseDirectory];
      [v22 log:@"Failed to set attributes on %@", v59];
    }
    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_100065834();
      }
      v53 = +[SDResourceManager sharedResourceManager];
      [v53 stderrWrite:@"Unable to create summaries directory: %@", v33];

      id v22 = +[SDResourceManager sharedResourceManager];
      [v22 log:@"Unable to create summaries directory: %@", v33];
    }
    BOOL v23 = 0;
LABEL_51:
    id v12 = v33;
    goto LABEL_19;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_10006569C(self);
  }
  CFDictionaryRef v9 = +[SDResourceManager sharedResourceManager];
  __int16 v10 = [(SystemDiagnostic *)self outputDirectory];
  CFStringRef v11 = @"Internal output directory already exists: %@\n";
  [v9 stderrWrite:@"Internal output directory already exists: %@\n", v10];

  id v12 = +[SDResourceManager sharedResourceManager];
  uint64_t v13 = [(SystemDiagnostic *)self outputDirectory];
LABEL_17:
  id v22 = (void *)v13;
  [v12 log:v11, v13];
LABEL_18:
  BOOL v23 = 0;
LABEL_19:

LABEL_20:
  return v23;
}

- (void)closeTaskSummaryHandle
{
  BOOL v3 = +[SDTaskDepot sharedTaskDepot];
  @"\nTotal tasks:", [@"%lu\n" stringByAppendingFormat:objc_msgSend(v3, "totalTasks")];
  id v7 = (id)objc_claimAutoreleasedReturnValue();

  int v4 = [(SystemDiagnostic *)self summaryHandle];
  sub_100027E00(v4, 0, v7, @"writing summary file footer");

  unsigned __int8 v5 = [(SystemDiagnostic *)self summaryHandle];
  [v5 closeFile];

  id v6 = +[SDTaskDepot sharedTaskDepot];
  [v6 setPushBufferDelegate:0];

  [(SystemDiagnostic *)self setSummaryHandle:0];
}

- (BOOL)previouslyRunningInstancesOfDiagnostic
{
  BOOL v3 = getprogname();
  if ([(SystemDiagnostic *)self processCount] < 1) {
    return 0;
  }
  uint64_t v4 = 0;
  uint64_t v5 = 48;
  do
  {
    int v6 = strncmp((const char *)[(SystemDiagnostic *)self processes] + v5, v3, 0x10uLL);
    BOOL v7 = v6 == 0;
    if (!v6) {
      break;
    }
    ++v4;
    v5 += 136;
  }
  while (v4 < [(SystemDiagnostic *)self processCount]);
  return v7;
}

- (void)getCaseInsensitiveMatches:(id)a3 forString:(const char *)a4
{
  id v6 = a3;
  if ([(SystemDiagnostic *)self processCount] >= 1)
  {
    uint64_t v7 = 0;
    uint64_t v8 = 0;
    do
    {
      if (sub_100048970(a4, (const char *)[(SystemDiagnostic *)self processes] + v7 + 48))
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          CFDictionaryRef v9 = (char *)[(SystemDiagnostic *)self processes] + v7 + 48;
          int v10 = *(_DWORD *)((char *)[(SystemDiagnostic *)self processes] + v7 + 12);
          *(_DWORD *)buf = 136315394;
          id v17 = v9;
          __int16 v18 = 1024;
          int v19 = v10;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Found partial match %s, targeting pid [%d]", buf, 0x12u);
        }
        CFStringRef v11 = +[SDResourceManager sharedResourceManager];
        [v11 stdoutWrite:@"Found partial match %s, targeting pid [%d]", (char *)-[SystemDiagnostic processes](self, "processes") + v7 + 48, *(unsigned int *)((char *)-[SystemDiagnostic processes](self, "processes") + v7 + 12)];

        id v12 = +[SDResourceManager sharedResourceManager];
        [v12 log:@"Found partial match %s, targeting pid [%d]", (char *)-[SystemDiagnostic processes](self, "processes") + v7 + 48, *(unsigned int *)((char *)-[SystemDiagnostic processes](self, "processes") + v7 + 12)];

        uint64_t v13 = +[NSNumber numberWithUnsignedInt:*(unsigned int *)((char *)[(SystemDiagnostic *)self processes] + v7 + 12)];
        [v6 addObject:v13];

        id v14 = [(SystemDiagnostic *)self pidIndices];
        unsigned int v15 = +[NSNumber numberWithInt:v8];
        [v14 addObject:v15];
      }
      ++v8;
      v7 += 136;
    }
    while (v8 < [(SystemDiagnostic *)self processCount]);
  }
}

- (void)populateProcessInfoForInput
{
  BOOL v3 = [(SystemDiagnostic *)self providedPIDorProcess];
  if ([v3 isEqualToString:@"0"])
  {

LABEL_4:
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Provided kernel_task as target. Ignored.", buf, 2u);
    }
    id v6 = +[SDResourceManager sharedResourceManager];
    [v6 log:@"Provided kernel_task as target. Ignored."];

    [(SystemDiagnostic *)self setTargetPIDs:&off_1000B1070];
    return;
  }
  uint64_t v4 = [(SystemDiagnostic *)self providedPIDorProcess];
  unsigned int v5 = [v4 isEqualToString:@"kernel_task"];

  if (v5) {
    goto LABEL_4;
  }
  uint64_t v7 = [(SystemDiagnostic *)self providedPIDorProcess];
  if ([v7 hasPrefix:@"launchd"])
  {

LABEL_10:
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v45 = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Warning: Provided no target or launchd and/or its children as targets. Ignored.", v45, 2u);
    }
    int v10 = +[SDResourceManager sharedResourceManager];
    [v10 log:@"Warning: Provided no target or launchd and/or its children as targets. Ignored."];

    return;
  }
  uint64_t v8 = [(SystemDiagnostic *)self providedPIDorProcess];
  unsigned int v9 = [v8 isEqualToString:&stru_1000A1EA8];

  if (v9) {
    goto LABEL_10;
  }
  CFStringRef v11 = +[NSMutableArray array];
  id v12 = [(SystemDiagnostic *)self providedPIDorProcess];
  uint64_t v13 = (unsigned __int8 *)[v12 cStringUsingEncoding:4];

  id v14 = [(SystemDiagnostic *)self providedPIDorProcess];
  id v15 = [v14 length];

  if (v15)
  {
    unint64_t v16 = 0;
    do
    {
      unsigned int v17 = v13[v16] - 58;
      BOOL v18 = v17 < 0xFFFFFFF6;
      if (v17 <= 0xFFFFFFF5) {
        break;
      }
      ++v16;
      int v19 = [(SystemDiagnostic *)self providedPIDorProcess];
      id v20 = [v19 length];
    }
    while ((unint64_t)v20 > v16);
  }
  else
  {
    BOOL v18 = 0;
  }
  unsigned __int8 v21 = [(SystemDiagnostic *)self providedPIDorProcess];
  id v22 = [v21 intValue];

  if (v22 && !v18)
  {
    BOOL v23 = +[NSNumber numberWithInt:v22];
    [v11 addObject:v23];
  }
  if ([v11 count])
  {
    if ([(SystemDiagnostic *)self processCount] >= 1)
    {
      uint64_t v24 = 0;
      uint64_t v25 = 0;
      char v26 = 0;
      do
      {
        if (*(_DWORD *)((char *)[(SystemDiagnostic *)self processes] + v24 + 12) == v22)
        {
          NSFileAttributeKey v27 = [(SystemDiagnostic *)self pidIndices];
          unsigned __int8 v28 = +[NSNumber numberWithInt:v25];
          [v27 addObject:v28];

          if (!strncmp((const char *)[(SystemDiagnostic *)self processes] + v24 + 48, "launchd", 7uLL))
          {
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)v44 = 0;
              _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Warning: Targeting launchd or its children. Ignored.", v44, 2u);
            }
            size_t v29 = +[SDResourceManager sharedResourceManager];
            long long v30 = v29;
            CFStringRef v31 = @"Warning: Targeting launchd or its children. Ignored.";
            goto LABEL_46;
          }
          char v26 = 1;
        }
        ++v25;
        v24 += 136;
      }
      while (v25 < [(SystemDiagnostic *)self processCount]);
      if (v26) {
        goto LABEL_36;
      }
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)__int16 v43 = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Warning: Supplied invalid target pid.", v43, 2u);
    }
    size_t v29 = +[SDResourceManager sharedResourceManager];
    long long v30 = v29;
    CFStringRef v31 = @"Warning: Supplied invalid target pid.";
LABEL_46:
    [v29 log:v31];
  }
  else
  {
    id v32 = [(SystemDiagnostic *)self providedPIDorProcess];
    id v33 = [v32 cStringUsingEncoding:4];

    [(SystemDiagnostic *)self getCaseInsensitiveMatches:v11 forString:v33];
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)unsigned __int8 v42 = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "", v42, 2u);
    }
    int v34 = +[SDResourceManager sharedResourceManager];
    [v34 stdoutWrite:&stru_1000A1EA8];

    v35 = +[SDResourceManager sharedResourceManager];
    [v35 log:&stru_1000A1EA8];

LABEL_36:
    if ([v11 count] && -[SystemDiagnostic requestSource](self, "requestSource") != 1) {
      [(SystemDiagnostic *)self setTargetPIDs:v11];
    }
    unsigned int v36 = [(SystemDiagnostic *)self pidIndices];
    id v37 = [v36 count];
    int v38 = [(SystemDiagnostic *)self targetPIDs];
    id v39 = [v38 count];

    if (v37 != v39)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v41 = 0;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "pindIndices mismatch with targetpids.", v41, 2u);
      }
      unsigned __int8 v40 = +[SDResourceManager sharedResourceManager];
      [v40 log:@"pindIndices mismatch with targetpids."];

      [(SystemDiagnostic *)self setPidIndices:0];
    }
  }
}

+ (BOOL)_runBlock:(id)a3 withTimeout:(double)a4
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10004E0DC;
  block[3] = &unk_10009DE98;
  id v11 = a3;
  id v5 = v11;
  dispatch_block_t v6 = dispatch_block_create(DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  uint64_t v7 = dispatch_get_global_queue(0, 0);
  dispatch_async(v7, v6);

  dispatch_time_t v8 = dispatch_time(0, (uint64_t)(a4 * 1000000000.0));
  LOBYTE(v7) = dispatch_block_wait(v6, v8) == 0;

  return (char)v7;
}

- (BOOL)waitUntilComplete:(unint64_t)a3
{
  uint64_t v4 = self;
  objc_sync_enter(v4);
  dispatch_time_t v5 = dispatch_time(0, 1000000000 * a3);
  dispatch_block_t v6 = [(SystemDiagnostic *)v4 completionDispatchGroup];
  intptr_t v7 = dispatch_group_wait(v6, v5);

  if (v7)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10006599C();
    }
    dispatch_time_t v8 = +[SDResourceManager sharedResourceManager];
    [v8 log:@"Timed out waiting for sysdiagnose to complete. Timeout: %llus", a3];
  }
  objc_sync_exit(v4);

  return v7 == 0;
}

- (int64_t)_sizeOutputDirectoryAndGenerateDiagnosticSummary
{
  id v2 = [(SystemDiagnostic *)self outputDirectory];
  uint64_t v3 = +[NSURL fileURLWithPath:v2 isDirectory:1];

  uint64_t v4 = +[NSFileManager defaultManager];
  v44[0] = NSURLTotalFileSizeKey;
  v44[1] = NSURLIsDirectoryKey;
  v44[2] = NSURLNameKey;
  dispatch_time_t v5 = +[NSArray arrayWithObjects:v44 count:3];
  unsigned __int8 v28 = (void *)v3;
  dispatch_block_t v6 = [v4 enumeratorAtURL:v3 includingPropertiesForKeys:v5 options:0 errorHandler:0];

  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id v7 = v6;
  id v8 = [v7 countByEnumeratingWithState:&v37 objects:v43 count:16];
  if (v8)
  {
    id v9 = v8;
    int64_t v10 = 0;
    uint64_t v11 = *(void *)v38;
    uint64_t v29 = *(void *)v38;
    id v30 = v7;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v38 != v11) {
          objc_enumerationMutation(v7);
        }
        uint64_t v13 = *(void **)(*((void *)&v37 + 1) + 8 * i);
        id v36 = 0;
        [v13 getResourceValue:&v36 forKey:NSURLIsDirectoryKey error:0];
        id v15 = v36;
        id v16 = v13;
        if (sub_1000567B0((const char *)[v16 fileSystemRepresentation], 0x1F5u, 0x1F5u) == -1)
        {
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            id v17 = [v16 fileSystemRepresentation];
            *(_DWORD *)buf = 136315138;
            id v42 = v17;
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to set attributes on %s", buf, 0xCu);
          }
          BOOL v18 = +[SDResourceManager sharedResourceManager];
          [v18 log:@"Failed to set attributes on %s", objc_msgSend(v16, "fileSystemRepresentation")];
        }
        if (([v15 BOOLValue] & 1) == 0)
        {
          id v33 = v14;
          id v35 = 0;
          [v16 getResourceValue:&v35 forKey:NSURLTotalFileSizeKey error:0];
          id v19 = v35;
          id v20 = v19;
          if (v19)
          {
            v10 += (int64_t)[v19 longValue];
            id v34 = 0;
            [v16 getResourceValue:&v34 forKey:NSURLNameKey error:0];
            if (v34)
            {
              id v32 = v34;
              unsigned __int8 v21 = (char *)[v20 longLongValue];
              id v22 = &v21[v10];
              BOOL v23 = [(SystemDiagnostic *)self summaryFD];
              uint64_t v24 = [v16 path];

              uint64_t v25 = [(SystemDiagnostic *)self outputDirectory];
              char v26 = v23;
              int64_t v10 = (int64_t)v22;
              uint64_t v11 = v29;
              sub_100027714(v26, v24, v25, v21, 0);

              id v7 = v30;
            }
          }

          id v14 = v33;
        }
      }
      id v9 = [v7 countByEnumeratingWithState:&v37 objects:v43 count:16];
    }
    while (v9);
  }
  else
  {
    int64_t v10 = 0;
  }

  return v10;
}

- (void)waitAndCollectAirPodLogs
{
  uint64_t v3 = +[SystemDiagnosticBT sharedInstance];
  uint64_t v4 = [v3 waitForAirPodLogsIfAvailable];

  if (v4)
  {
    dispatch_time_t v5 = [(SystemDiagnostic *)self outputDirectory];
    dispatch_block_t v6 = [v5 stringByAppendingPathComponent:@"AirPodLogs"];

    id v7 = +[NSFileManager defaultManager];
    char v30 = 0;
    if (([v7 fileExistsAtPath:v6 isDirectory:&v30] & 1) == 0
      && ([v7 createDirectoryAtPath:v6 withIntermediateDirectories:1 attributes:0 error:0] & 1) == 0)
    {
      NSLog(@"Error: Create folder failed %@", v6);
    }
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    BOOL v23 = v4;
    id v8 = v4;
    id v9 = [v8 countByEnumeratingWithState:&v26 objects:v37 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v27;
      id v24 = v8;
      uint64_t v25 = v7;
      do
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v27 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void **)(*((void *)&v26 + 1) + 8 * i);
          if ([v7 fileExistsAtPath:v13])
          {
            id v14 = [v13 lastPathComponent];
            id v15 = [v6 stringByAppendingPathComponent:v14];

            id v16 = v13;
            id v17 = (const char *)[v16 fileSystemRepresentation];
            id v18 = v15;
            if (sub_100056870(v17, (const char *)[v18 fileSystemRepresentation], 0xFu) == -1)
            {
              int v19 = *__error();
              if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
              {
                id v22 = strerror(v19);
                *(_DWORD *)buf = 138412802;
                id v32 = v16;
                __int16 v33 = 2112;
                id v34 = v18;
                __int16 v35 = 2080;
                id v36 = v22;
                _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Unable to copy file %@ -> %@: %s", buf, 0x20u);
              }
              id v20 = +[SDResourceManager sharedResourceManager];
              [v20 stderrWrite:@"Unable to copy file %@ -> %@: %s", v16, v18, strerror(v19)];

              unsigned __int8 v21 = +[SDResourceManager sharedResourceManager];
              [v21 log:@"Unable to copy file %@ -> %@: %s", v16, v18, strerror(v19)];

              id v8 = v24;
              id v7 = v25;
            }
          }
        }
        id v10 = [v8 countByEnumeratingWithState:&v26 objects:v37 count:16];
      }
      while (v10);
    }

    uint64_t v4 = v23;
  }
}

- (void)waitForRemoteLogs
{
  uint64_t v3 = +[CSCoordinator sharedInstance];
  uint64_t v4 = [(SystemDiagnostic *)self diagnosticID];
  [v3 waitForCoSysdiagnosesForDiagnosticID:v4];

  [(SystemDiagnostic *)self waitAndCollectAirPodLogs];
}

- (void)initStreaming
{
  if (![(SystemDiagnostic *)self shouldCreateTarBall]
    || [(SystemDiagnostic *)self disableStreamTar])
  {
    uint64_t v3 = self;
    uint64_t v4 = 0;
LABEL_4:
    [(SystemDiagnostic *)v3 setShouldStreamToTar:v4];
    goto LABEL_5;
  }
  id v8 = [(SystemDiagnostic *)self tarballPath];
  uint64_t v9 = sub_100026EF8((const char *)[v8 fileSystemRepresentation], -[SystemDiagnostic isDeviceUnlockedSinceBoot](self, "isDeviceUnlockedSinceBoot"));

  BOOL v10 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
  if (v9 != -1)
  {
    if (v10)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Streaming to tar enabled", buf, 2u);
    }
    uint64_t v11 = +[SDResourceManager sharedResourceManager];
    [v11 log:@"Streaming to tar enabled"];

    id v12 = [(SystemDiagnostic *)self archiveName];
    uint64_t v13 = sub_100026A64(v9, 0, v12, 1, [(SystemDiagnostic *)self useParallelCompression]);
    [(SystemDiagnostic *)self setArchive:v13];

    id v14 = [(SystemDiagnostic *)self archive];
    -[SystemDiagnostic setDpClass:](self, "setDpClass:", [v14 getProtectionClass]);

    uint64_t v3 = self;
    uint64_t v4 = 1;
    goto LABEL_4;
  }
  if (v10)
  {
    id v15 = [(SystemDiagnostic *)self tarballPath];
    *(_DWORD *)buf = 138412290;
    int v19 = v15;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Couldn't create archive at location %@", buf, 0xCu);
  }
  id v16 = +[SDResourceManager sharedResourceManager];
  id v17 = [(SystemDiagnostic *)self tarballPath];
  [v16 log:@"Couldn't create archive at location %@", v17];

  [(SystemDiagnostic *)self setShouldStreamToTar:0];
  [(SystemDiagnostic *)self setArchive:0];
LABEL_5:
  if (![(SystemDiagnostic *)self shouldStreamToTar])
  {
    dispatch_time_t v5 = [(SystemDiagnostic *)self outputDirectory];
    dispatch_block_t v6 = [v5 stringByAppendingPathComponent:@"/summaries/diagnostic_summary.log"];

    id v7 = v6;
    self->_summaryFD = fopen((const char *)[v7 fileSystemRepresentation], "wx");
  }
}

- (void)executeOSLogArchiveContainers
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_10004EC48;
  v2[3] = &unk_10009DEC0;
  v2[4] = self;
  [(SystemDiagnostic *)self executeContainersInPhase:3 withCompletionBlock:v2];
}

- (void)sendCoreAnalytics
{
  id v3 = objc_alloc_init((Class)NSMutableDictionary);
  uint64_t v4 = [(SystemDiagnostic *)self metricsDict];
  unint64_t v5 = [v4 objectForKeyedSubscript:metricTotalSize];
  unint64_t v6 = v5 / 0x3E8;

  id v7 = [(SystemDiagnostic *)self totalTime];
  [v3 setValue:v7 forKey:@"totalDuration"];

  id v8 = [(SystemDiagnostic *)self metricsDict];
  uint64_t v9 = [v8 objectForKeyedSubscript:metricTimeSensitive];
  [v3 setValue:v9 forKey:@"timeSensitiveDuration"];

  BOOL v10 = [(SystemDiagnostic *)self metricsDict];
  uint64_t v11 = [v10 objectForKeyedSubscript:metricLogGeneration];
  [v3 setValue:v11 forKey:@"generationDuration"];

  id v12 = [(SystemDiagnostic *)self metricsDict];
  uint64_t v13 = [v12 objectForKeyedSubscript:metricLogCopying];
  [v3 setValue:v13 forKey:@"copyingDuration"];

  id v14 = [(SystemDiagnostic *)self metricsDict];
  id v15 = [v14 objectForKeyedSubscript:metricOSLogarchiveGeneration];
  [v3 setValue:v15 forKey:@"libtraceDuration"];

  id v16 = +[NSNumber numberWithUnsignedLongLong:v6];
  [v3 setValue:v16 forKey:@"size"];

  id v17 = +[NSNumber numberWithBool:[(SystemDiagnostic *)self shouldCreateTarBall]];
  [v3 setValue:v17 forKey:@"isArchived"];

  id v18 = +[NSNumber numberWithBool:[(SystemDiagnostic *)self didComplete] ^ 1];
  [v3 setValue:v18 forKey:@"isCancelled"];

  int v19 = +[NSNumber numberWithUnsignedInt:[(SystemDiagnostic *)self requestSource]];
  [v3 setValue:v19 forKey:@"startedBy"];

  id v20 = +[SDTaskDepot sharedTaskDepot];
  unsigned __int8 v21 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [v20 totalFailedTasks]);
  [v3 setValue:v21 forKey:@"numberOfFailedTasks"];

  id v22 = +[SDTaskDepot sharedTaskDepot];
  BOOL v23 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [v22 totalTimeouts]);
  [v3 setValue:v23 forKey:@"numberOfTimeouts"];

  id v24 = [(SystemDiagnostic *)self metricsDict];
  uint64_t v25 = [v24 objectForKeyedSubscript:metricPersistLookback];
  [v3 setValue:v25 forKey:@"peristLookback"];

  long long v26 = [(SystemDiagnostic *)self metricsDict];
  long long v27 = [v26 objectForKeyedSubscript:metricSpecialLookback];
  [v3 setValue:v27 forKey:@"specialLookback"];

  long long v28 = [(SystemDiagnostic *)self metricsDict];
  long long v29 = [v28 objectForKeyedSubscript:metricSignpostLookback];
  [v3 setValue:v29 forKey:@"signpostLookback"];

  char v30 = [(SystemDiagnostic *)self metricsDict];
  CFStringRef v31 = [v30 objectForKeyedSubscript:metricPersistSize];
  [v3 setValue:v31 forKey:@"peristSize"];

  id v32 = [(SystemDiagnostic *)self metricsDict];
  __int16 v33 = [v32 objectForKeyedSubscript:metricSpecialSize];
  [v3 setValue:v33 forKey:@"specialSize"];

  id v34 = [(SystemDiagnostic *)self metricsDict];
  __int16 v35 = [v34 objectForKeyedSubscript:metricSignpostSize];
  [v3 setValue:v35 forKey:@"signpostSize"];

  long long v37 = v3;
  id v36 = v3;
  AnalyticsSendEventLazy();
}

- (void)outputMetrics
{
  id v3 = +[NSDate date];
  uint64_t v4 = [(SystemDiagnostic *)self startDiagnosticTime];
  [v3 timeIntervalSinceDate:v4];
  double v6 = v5;

  id v7 = +[NSNumber numberWithDouble:v6];
  [(SystemDiagnostic *)self setTotalTime:v7];

  if ([(SystemDiagnostic *)self shouldCreateTarBall])
  {
    id v8 = [(SystemDiagnostic *)self archive];
    id v9 = [v8 getUncompressedSize];
  }
  else
  {
    id v9 = [(SystemDiagnostic *)self _sizeOutputDirectoryAndGenerateDiagnosticSummary];
  }
  id v94 = v9;
  BOOL v10 = +[NSNumber numberWithLongLong:v9];
  uint64_t v11 = [(SystemDiagnostic *)self metricsDict];
  uint64_t v12 = metricTotalSize;
  [v11 setObject:v10 forKeyedSubscript:metricTotalSize];

  uint64_t v93 = v12;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v90 = [(SystemDiagnostic *)self metricsDict];
    uint64_t v13 = metricGetTimeSensitive;
    v88 = [v90 objectForKeyedSubscript:metricGetTimeSensitive];
    [v88 doubleValue];
    double v15 = v14;
    v86 = [(SystemDiagnostic *)self metricsDict];
    uint64_t v16 = metricGetLogGeneration;
    id v17 = [v86 objectForKeyedSubscript:metricGetLogGeneration];
    [v17 doubleValue];
    int v19 = v18;
    id v20 = [(SystemDiagnostic *)self metricsDict];
    uint64_t v21 = metricGetLogCopying;
    id v22 = [v20 objectForKeyedSubscript:metricGetLogCopying];
    [v22 doubleValue];
    uint64_t v24 = v23;
    uint64_t v25 = [(SystemDiagnostic *)self metricsDict];
    uint64_t v26 = metricGetOSLogArchive;
    long long v27 = [v25 objectForKeyedSubscript:metricGetOSLogArchive];
    [v27 doubleValue];
    *(_DWORD *)buf = 134218752;
    double v96 = v15;
    __int16 v97 = 2048;
    id v98 = v19;
    __int16 v99 = 2048;
    uint64_t v100 = v24;
    __int16 v101 = 2048;
    uint64_t v102 = v28;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "\nGetting time sensitive containers: %0.2f\nGetting log generation containers: %0.2f\nGetting log copying containers: %0.2f\nGetting OS log archive containers: %0.2f\n", buf, 0x2Au);
  }
  else
  {
    uint64_t v13 = metricGetTimeSensitive;
    uint64_t v16 = metricGetLogGeneration;
    uint64_t v21 = metricGetLogCopying;
    uint64_t v26 = metricGetOSLogArchive;
  }
  long long v29 = +[SDResourceManager sharedResourceManager];
  char v30 = [(SystemDiagnostic *)self metricsDict];
  CFStringRef v31 = [v30 objectForKeyedSubscript:v13];
  [v31 doubleValue];
  uint64_t v33 = v32;
  id v34 = [(SystemDiagnostic *)self metricsDict];
  __int16 v35 = [v34 objectForKeyedSubscript:v16];
  [v35 doubleValue];
  uint64_t v37 = v36;
  long long v38 = [(SystemDiagnostic *)self metricsDict];
  long long v39 = [v38 objectForKeyedSubscript:v21];
  [v39 doubleValue];
  uint64_t v41 = v40;
  id v42 = [(SystemDiagnostic *)self metricsDict];
  __int16 v43 = [v42 objectForKeyedSubscript:v26];
  [v43 doubleValue];
  [v29 log:@"\nGetting time sensitive containers: %0.2f\nGetting log generation containers: %0.2f\nGetting log copying containers: %0.2f\nGetting OS log archive containers: %0.2f\n", v33, v37, v41, v44];

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v91 = [(SystemDiagnostic *)self metricsDict];
    uint64_t v85 = metricTimeSensitive;
    v89 = [v91 objectForKeyedSubscript:];
    [v89 doubleValue];
    double v46 = v45;
    unint64_t v87 = [(SystemDiagnostic *)self metricsDict];
    uint64_t v47 = metricLogCopying;
    v84 = [v87 objectForKeyedSubscript:metricLogCopying];
    [v84 doubleValue];
    id v49 = v48;
    v83 = [(SystemDiagnostic *)self metricsDict];
    uint64_t v50 = metricLogGeneration;
    id v51 = [v83 objectForKeyedSubscript:metricLogGeneration];
    [v51 doubleValue];
    uint64_t v53 = v52;
    __int16 v54 = [(SystemDiagnostic *)self metricsDict];
    uint64_t v55 = metricOSLogarchiveGeneration;
    v56 = [v54 objectForKeyedSubscript:metricOSLogarchiveGeneration];
    [v56 doubleValue];
    uint64_t v58 = v57;
    v59 = [(SystemDiagnostic *)self metricsDict];
    uint64_t v60 = v93;
    id v61 = [v59 objectForKeyedSubscript:v93];
    id v62 = [v61 longLongValue];
    *(_DWORD *)buf = 134219264;
    double v96 = v46;
    __int16 v97 = 2048;
    id v98 = v49;
    __int16 v99 = 2048;
    uint64_t v100 = v53;
    __int16 v101 = 2048;
    uint64_t v102 = v58;
    __int16 v103 = 2048;
    double v104 = v6;
    __int16 v105 = 2048;
    id v106 = v62;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "\nTime Sensitive: %0.2f \nLog Copying: %0.2f \nLog Generation: %0.2f \nOSLogArchive Generation: %0.2f \nTotal: %0.2f seconds, %llu bytes", buf, 0x3Eu);

    uint64_t v63 = v85;
  }
  else
  {
    uint64_t v63 = metricTimeSensitive;
    uint64_t v47 = metricLogCopying;
    uint64_t v50 = metricLogGeneration;
    uint64_t v55 = metricOSLogarchiveGeneration;
    uint64_t v60 = v93;
  }
  v64 = +[SDResourceManager sharedResourceManager];
  v92 = [(SystemDiagnostic *)self metricsDict];
  uint64_t v65 = [v92 objectForKeyedSubscript:v63];
  [v65 doubleValue];
  uint64_t v67 = v66;
  NSFileAttributeKey v68 = [(SystemDiagnostic *)self metricsDict];
  v69 = [v68 objectForKeyedSubscript:v47];
  [v69 doubleValue];
  uint64_t v71 = v70;
  v72 = [(SystemDiagnostic *)self metricsDict];
  v73 = [v72 objectForKeyedSubscript:v50];
  [v73 doubleValue];
  uint64_t v75 = v74;
  v76 = [(SystemDiagnostic *)self metricsDict];
  long long v77 = [v76 objectForKeyedSubscript:v55];
  [v77 doubleValue];
  uint64_t v79 = v78;
  long long v80 = [(SystemDiagnostic *)self metricsDict];
  v81 = [v80 objectForKeyedSubscript:v60];
  [v64 log:@"\nTime Sensitive: %0.2f \nLog Copying: %0.2f \nLog Generation: %0.2f \nOSLogArchive Generation: %0.2f \nTotal: %0.2f seconds, %llu bytes", v67, v71, v75, v79, *(void *)&v6, [v81 longLongValue]];

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218240;
    double v96 = v6;
    __int16 v97 = 2048;
    id v98 = v94;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Resource Usage: Gathering diagnostics took %f.1 seconds for %lld bytes (uncompressed)", buf, 0x16u);
  }
  v82 = +[SDResourceManager sharedResourceManager];
  [v82 log:@"Resource Usage: Gathering diagnostics took %f.1 seconds for %lld bytes (uncompressed)"];
}

- (void)createOnlyRunContainersWithNamesArray:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    double v5 = [(SystemDiagnostic *)self onlyRunContainersWithNames];

    if (v5)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_100065A98();
      }
      double v6 = +[SDResourceManager sharedResourceManager];
      [v6 stderrWrite:@"Resetting only run containers with names array"];

      id v7 = +[SDResourceManager sharedResourceManager];
      [v7 log:@"Resetting only run containers with names array"];
    }
    uint64_t v21 = self;
    id v8 = +[NSMutableArray array];
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v9 = [v4 componentsSeparatedByString:@","];
    id v10 = [v9 countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v25;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v25 != v12) {
            objc_enumerationMutation(v9);
          }
          double v14 = *(void **)(*((void *)&v24 + 1) + 8 * (void)v13);
          double v15 = +[NSCharacterSet whitespaceAndNewlineCharacterSet];
          uint64_t v16 = [v14 stringByTrimmingCharactersInSet:v15];

          if ([v16 length])
          {
            [v8 addObject:v16];
          }
          else
          {
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
              sub_100065A54(&buf, v23);
            }
            id v17 = +[SDResourceManager sharedResourceManager];
            [v17 stderrWrite:@"Invalid name passed to onlyRunContainersWithNames"];

            id v18 = +[SDResourceManager sharedResourceManager];
            [v18 log:@"Invalid name passed to onlyRunContainersWithNames"];
          }
          uint64_t v13 = (char *)v13 + 1;
        }
        while (v11 != v13);
        id v11 = [v9 countByEnumeratingWithState:&v24 objects:v28 count:16];
      }
      while (v11);
    }

    id v19 = [v8 copy];
    [(SystemDiagnostic *)v21 setOnlyRunContainersWithNames:v19];
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100065A0C();
    }
    id v20 = +[SDResourceManager sharedResourceManager];
    [v20 stderrWrite:@"Nil names string passed to setOnlyRunContainersWithNames"];

    id v8 = +[SDResourceManager sharedResourceManager];
    [v8 log:@"Nil names string passed to setOnlyRunContainersWithNames"];
  }
}

- (id)filterDiagnosticContainers:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SystemDiagnostic *)self onlyRunContainersWithNames];
  if (v5
    && (double v6 = (void *)v5,
        [(SystemDiagnostic *)self onlyRunContainersWithNames],
        id v7 = objc_claimAutoreleasedReturnValue(),
        id v8 = [v7 count],
        v7,
        v6,
        v8))
  {
    id v9 = +[NSMutableArray array];
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v20 = v4;
    id v10 = v4;
    id v11 = [v10 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = *(void *)v22;
      do
      {
        for (i = 0; i != v12; i = (char *)i + 1)
        {
          if (*(void *)v22 != v13) {
            objc_enumerationMutation(v10);
          }
          double v15 = *(void **)(*((void *)&v21 + 1) + 8 * i);
          uint64_t v16 = [(SystemDiagnostic *)self onlyRunContainersWithNames];
          id v17 = [v15 name];
          unsigned int v18 = [v16 containsObject:v17];

          if (v18) {
            [v9 addObject:v15];
          }
        }
        id v12 = [v10 countByEnumeratingWithState:&v21 objects:v25 count:16];
      }
      while (v12);
    }

    id v4 = v20;
  }
  else
  {
    id v9 = v4;
  }

  return v9;
}

- (id)getDiagnosticContainers:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v5 = +[NSMutableArray array];
  double v6 = [(SystemDiagnostic *)self overrideContainers];

  if (v6)
  {
    id v7 = +[SDResourceManager sharedResourceManager];
    id v8 = [v7 stringForPhaseID:v3];

    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = 138412290;
      unsigned int v18 = v8;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "getDiagnosticContainers found override containers. Returning new values for phase '%@'", (uint8_t *)&v17, 0xCu);
    }
    id v9 = [(SystemDiagnostic *)self overrideContainers];
    id v10 = +[NSNumber numberWithInt:v3];
    id v11 = [v9 objectForKey:v10];

    if (v11) {
      id v12 = [v11 mutableCopy];
    }
    else {
      id v12 = v5;
    }
    double v14 = v12;
  }
  else
  {
    switch((int)v3)
    {
      case 0:
        uint64_t v13 = [(SystemDiagnostic *)self getTimeSensitiveContainers];
        goto LABEL_14;
      case 1:
        uint64_t v13 = [(SystemDiagnostic *)self getLogGenerationContainers];
        goto LABEL_14;
      case 2:
        uint64_t v13 = [(SystemDiagnostic *)self getLogCopyingContainers];
        goto LABEL_14;
      case 3:
        uint64_t v13 = [(SystemDiagnostic *)self getLibtraceContainers];
LABEL_14:
        double v15 = (void *)v13;

        double v14 = [(SystemDiagnostic *)self filterDiagnosticContainers:v15];
        id v5 = v15;
        break;
      default:
        id v5 = v5;
        double v14 = v5;
        break;
    }
  }

  return v14;
}

- (void)logContainerAsExecuted:(id)a3 inPhase:(int)a4
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    double v6 = [v5 taskContainer];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      id v8 = [v5 taskContainer];
    }
    else
    {
      id v8 = 0;
    }

    if (!v8) {
      goto LABEL_26;
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_26;
    }
    id v8 = v4;
    if (!v8) {
      goto LABEL_26;
    }
  }
  id v9 = [v4 destination];
  id v10 = v9;
  if (!v9 || [(__CFString *)v9 isEqualToString:@"."])
  {

    id v10 = &stru_1000A1EA8;
  }
  id v11 = objc_opt_new();
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v12 = [v8 units];
  id v13 = [v12 countByEnumeratingWithState:&v28 objects:v34 count:16];
  if (v13)
  {
    uint64_t v14 = *(void *)v29;
    do
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v29 != v14) {
          objc_enumerationMutation(v12);
        }
        uint64_t v16 = [*(id *)(*((void *)&v28 + 1) + 8 * i) stdoutPath];
        if (v16)
        {
          int v17 = [(__CFString *)v10 stringByAppendingPathComponent:v16];

          if ([v17 characterAtIndex:0] == 47)
          {
            do
            {
              unsigned int v18 = [v17 substringFromIndex:1];

              int v17 = v18;
            }
            while ([v18 characterAtIndex:0] == 47);
          }
          else
          {
            unsigned int v18 = v17;
          }
          [v11 addObject:v18];
        }
      }
      id v13 = [v12 countByEnumeratingWithState:&v28 objects:v34 count:16];
    }
    while (v13);
  }

  v32[0] = @"paths";
  id v19 = [v11 copy];
  v33[0] = v19;
  v32[1] = @"isConcurrent";
  id v20 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v8 isConcurrent]);
  v33[1] = v20;
  v32[2] = @"phase";
  long long v21 = +[NSNumber numberWithInt:a4];
  v33[2] = v21;
  long long v22 = +[NSDictionary dictionaryWithObjects:v33 forKeys:v32 count:3];

  long long v23 = [(SystemDiagnostic *)self executedContainers];
  objc_sync_enter(v23);
  long long v24 = [(SystemDiagnostic *)self executedContainers];
  long long v25 = [v4 name];
  [v24 setObject:v22 forKeyedSubscript:v25];

  objc_sync_exit(v23);
LABEL_26:
}

- (void)setupTaskDepotForPhase:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v5 = +[SDTaskDepot sharedTaskDepot];
  double v6 = +[SDResourceManager sharedResourceManager];
  id v11 = _NSConcreteStackBlock;
  uint64_t v12 = 3221225472;
  id v13 = sub_100050608;
  uint64_t v14 = &unk_10009DF10;
  os_activity_t v15 = _os_activity_create((void *)&_mh_execute_header, "Ending task", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
  id v7 = v6;
  id v16 = v7;
  int v17 = self;
  int v18 = v3;
  id v8 = v15;
  [v5 setTaskCompletionBlock:&v11];
  unsigned __int8 v9 = [(SystemDiagnostic *)self isTestingMode];
  double v10 = 0.0;
  if ((v9 & 1) == 0) {
    [v7 getMinimumTimeBeforeTimeoutsForPhaseID:v3];
  }
  [v5 setMinimumTimeBeforeTimeouts:v10];
}

- (void)endTaskDepotForPhase:(int)a3
{
  id v3 = +[SDTaskDepot sharedTaskDepot];
  [v3 setMinimumTimeBeforeTimeouts:0.0];
  [v3 setTaskCompletionBlock:0];
}

- (void)executeContainers:(id)a3 inPhase:(int)a4 withCompletionBlock:(id)a5
{
  uint64_t v6 = *(void *)&a4;
  id v8 = a3;
  unsigned __int8 v9 = (void (**)(id, void *, id))a5;
  if ([v8 count])
  {
    long long v28 = +[SDTaskDepot sharedTaskDepot];
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    id v26 = v8;
    id obj = v8;
    id v10 = [obj countByEnumeratingWithState:&v30 objects:v34 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v31;
      while (2)
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v31 != v12) {
            objc_enumerationMutation(obj);
          }
          uint64_t v14 = *(void **)(*((void *)&v30 + 1) + 8 * i);
          [(SystemDiagnostic *)self logContainerAsExecuted:v14 inPhase:v6];
          if (![v28 mayStartExecuting])
          {
            goto LABEL_23;
          }
          id v16 = [v14 execute];
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              int v17 = [v28 taskCompletionBlock];

              if (v17)
              {
                int v18 = [v28 taskCompletionBlock];
                v18[2]();
              }
            }
          }
          if (v9) {
            v9[2](v9, v14, v16);
          }
        }
        id v11 = [obj countByEnumeratingWithState:&v30 objects:v34 count:16];
        if (v11) {
          continue;
        }
        break;
      }
    }

    id v19 = +[SDResourceManager sharedResourceManager];
    id obj = [v19 stringForPhaseID:v6];

    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint8_t buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Main thread waiting for tasks to finish", buf, 2u);
    }
    id v20 = +[SDResourceManager sharedResourceManager];
    [v20 stdoutWrite:@"Main thread waiting for tasks to finish"];

    long long v21 = +[SDResourceManager sharedResourceManager];
    [v21 log:@"Main thread waiting for tasks to finish"];

    long long v22 = +[SDTaskDepot sharedTaskDepot];
    unsigned __int8 v23 = [v22 waitUntilAllTasksComplete:600];

    if ((v23 & 1) == 0)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_100065AE0();
      }
      long long v24 = +[SDResourceManager sharedResourceManager];
      [v24 stderrWrite:@"[%@ phase] failed to complete in time. The tasks may continue to run, but continuing to the next phase.", obj];

      long long v25 = +[SDResourceManager sharedResourceManager];
      [v25 log:@"[%@ phase] failed to complete in time. The tasks may continue to run, but continuing to the next phase.", obj];
    }
LABEL_23:
    id v8 = v26;
  }
}

- (void)executeContainersInPhase:(int)a3 withCompletionBlock:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v26 = a4;
  uint64_t v6 = +[SDResourceManager sharedResourceManager];
  id v7 = [v6 stringForPhaseID:v4];
  long long v27 = +[NSDate date];
  id v8 = sub_100028174();
  if (os_signpost_enabled(v8))
  {
    *(_DWORD *)uint8_t buf = 138412290;
    long long v29 = v7;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v8, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "Phase", "%@", buf, 0xCu);
  }

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)uint8_t buf = 138412290;
    long long v29 = v7;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Begin %@ Phase", buf, 0xCu);
  }
  unsigned __int8 v9 = +[SDResourceManager sharedResourceManager];
  [v9 stdoutWrite:@"Begin %@ Phase", v7];

  id v10 = +[SDResourceManager sharedResourceManager];
  [v10 log:@"Begin %@ Phase", v7];

  id v11 = [(SystemDiagnostic *)self getDiagnosticContainers:v4];
  uint64_t v12 = [v6 getContainersMetricForPhaseId:v4];
  id v13 = +[NSDate date];
  [v13 timeIntervalSinceDate:v27];
  uint64_t v14 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  os_activity_t v15 = [(SystemDiagnostic *)self metricsDict];
  [v15 setObject:v14 forKeyedSubscript:v12];

  [v6 setupProgressTotal:[v11 count] forPhase:v4];
  id v16 = [(SystemDiagnostic *)self diagnosticID];
  [v6 registerActivityWithID:v16];

  [(SystemDiagnostic *)self setupTaskDepotForPhase:v4];
  [(SystemDiagnostic *)self executeContainers:v11 inPhase:v4 withCompletionBlock:v26];

  [(SystemDiagnostic *)self endTaskDepotForPhase:v4];
  int v17 = [v6 elapsedMetricForPhaseID:v4];
  int v18 = +[NSDate date];
  [v18 timeIntervalSinceDate:v27];
  double v20 = v19;

  long long v21 = +[NSNumber numberWithDouble:v20];
  long long v22 = [(SystemDiagnostic *)self metricsDict];
  [v22 setObject:v21 forKeyedSubscript:v17];

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)uint8_t buf = 138412290;
    long long v29 = v7;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "End %@ Phase", buf, 0xCu);
  }
  unsigned __int8 v23 = +[SDResourceManager sharedResourceManager];
  [v23 stdoutWrite:@"End %@ Phase", v7];

  long long v24 = +[SDResourceManager sharedResourceManager];
  [v24 log:@"End %@ Phase", v7];

  long long v25 = sub_100028174();
  if (os_signpost_enabled(v25))
  {
    *(_WORD *)uint8_t buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v25, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "Phase", "", buf, 2u);
  }
}

- (void)summarizeErrorsWithinSDTask:(id)a3
{
  id v4 = a3;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id v5 = [(SystemDiagnostic *)self executedContainers];
  uint64_t v6 = [v5 allKeys];

  id obj = (id)v6;
  id v7 = (void *)v6;
  id v8 = self;
  id v9 = [v7 countByEnumeratingWithState:&v36 objects:v41 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v37;
    uint64_t v27 = *(void *)v37;
    long long v28 = self;
    do
    {
      uint64_t v12 = 0;
      id v29 = v10;
      do
      {
        if (*(void *)v37 != v11) {
          objc_enumerationMutation(obj);
        }
        uint64_t v31 = v12;
        uint64_t v13 = *(void *)(*((void *)&v36 + 1) + 8 * v12);
        uint64_t v14 = [(SystemDiagnostic *)v8 executedContainers];
        os_activity_t v15 = [v14 objectForKeyedSubscript:v13];

        id v16 = [v15 objectForKeyedSubscript:@"isConcurrent"];
        unsigned int v17 = [v16 BOOLValue];

        if (v17)
        {
          int v18 = objc_opt_new();
          long long v32 = 0u;
          long long v33 = 0u;
          long long v34 = 0u;
          long long v35 = 0u;
          double v19 = [v15 objectForKeyedSubscript:@"paths"];
          id v20 = [v19 countByEnumeratingWithState:&v32 objects:v40 count:16];
          long long v21 = v15;
          if (v20)
          {
            id v22 = v20;
            uint64_t v23 = *(void *)v33;
            do
            {
              for (i = 0; i != v22; i = (char *)i + 1)
              {
                if (*(void *)v33 != v23) {
                  objc_enumerationMutation(v19);
                }
                uint64_t v25 = *(void *)(*((void *)&v32 + 1) + 8 * i);
                if ([v18 containsObject:v25])
                {
                  id v26 = +[NSString stringWithFormat:@"Non-serial container '%@' writes to '%@' in parallel", v13, v25];
                  [v4 addObject:v26];
                }
                else
                {
                  [v18 addObject:v25];
                }
              }
              id v22 = [v19 countByEnumeratingWithState:&v32 objects:v40 count:16];
            }
            while (v22);
          }

          uint64_t v11 = v27;
          id v10 = v29;
          os_activity_t v15 = v21;
          id v8 = v28;
        }

        uint64_t v12 = v31 + 1;
      }
      while ((id)(v31 + 1) != v10);
      id v10 = [obj countByEnumeratingWithState:&v36 objects:v41 count:16];
    }
    while (v10);
  }
}

- (void)summarizeErrorsAcrossSDTasks:(id)a3
{
  id v4 = a3;
  long long v37 = objc_opt_new();
  long long v55 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  id v5 = [(SystemDiagnostic *)self executedContainers];
  uint64_t v6 = [v5 allKeys];

  id obj = v6;
  id v7 = [v6 countByEnumeratingWithState:&v55 objects:v62 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v56;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v56 != v9) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void *)(*((void *)&v55 + 1) + 8 * i);
        uint64_t v12 = [(SystemDiagnostic *)self executedContainers];
        uint64_t v13 = [v12 objectForKeyedSubscript:v11];

        uint64_t v14 = [v13 objectForKeyedSubscript:@"phase"];
        unsigned int v15 = [v14 intValue];

        if (v15)
        {
          id v16 = [v13 objectForKeyedSubscript:@"paths"];
          unsigned int v17 = +[NSSet setWithArray:v16];
          [v37 setObject:v17 forKeyedSubscript:v11];
        }
      }
      id v8 = [obj countByEnumeratingWithState:&v55 objects:v62 count:16];
    }
    while (v8);
  }

  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  id v32 = [v37 copy];
  id v30 = [v32 allKeys];
  id v33 = [v30 countByEnumeratingWithState:&v51 objects:v61 count:16];
  if (v33)
  {
    uint64_t v31 = *(void *)v52;
    do
    {
      uint64_t v18 = 0;
      do
      {
        if (*(void *)v52 != v31) {
          objc_enumerationMutation(v30);
        }
        uint64_t v34 = v18;
        uint64_t v19 = *(void *)(*((void *)&v51 + 1) + 8 * v18);
        long long v38 = [v32 objectForKeyedSubscript:v19];
        [v37 removeObjectForKey:v19];
        long long v49 = 0u;
        long long v50 = 0u;
        long long v47 = 0u;
        long long v48 = 0u;
        id v35 = [v37 allKeys];
        long long v39 = (char *)[v35 countByEnumeratingWithState:&v47 objects:v60 count:16];
        if (v39)
        {
          uint64_t v36 = *(void *)v48;
          do
          {
            id v20 = 0;
            do
            {
              if (*(void *)v48 != v36) {
                objc_enumerationMutation(v35);
              }
              obja = v20;
              uint64_t v21 = *(void *)(*((void *)&v47 + 1) + 8 * (void)v20);
              uint64_t v22 = [v37 objectForKeyedSubscript:v21];
              id v23 = [v38 mutableCopy];
              uint64_t v40 = (void *)v22;
              [v23 intersectSet:v22];
              long long v45 = 0u;
              long long v46 = 0u;
              long long v43 = 0u;
              long long v44 = 0u;
              id v24 = v23;
              id v25 = [v24 countByEnumeratingWithState:&v43 objects:v59 count:16];
              if (v25)
              {
                id v26 = v25;
                uint64_t v27 = *(void *)v44;
                do
                {
                  for (j = 0; j != v26; j = (char *)j + 1)
                  {
                    if (*(void *)v44 != v27) {
                      objc_enumerationMutation(v24);
                    }
                    id v29 = +[NSString stringWithFormat:@"Container '%@' writes to file '%@', which is also written by container '%@'", v19, *(void *)(*((void *)&v43 + 1) + 8 * (void)j), v21];
                    [v4 addObject:v29];
                  }
                  id v26 = [v24 countByEnumeratingWithState:&v43 objects:v59 count:16];
                }
                while (v26);
              }

              id v20 = obja + 1;
            }
            while (obja + 1 != v39);
            long long v39 = (char *)[v35 countByEnumeratingWithState:&v47 objects:v60 count:16];
          }
          while (v39);
        }

        uint64_t v18 = v34 + 1;
      }
      while ((id)(v34 + 1) != v33);
      id v33 = [v30 countByEnumeratingWithState:&v51 objects:v61 count:16];
    }
    while (v33);
  }
}

- (void)summarizeErrorsForExecutedContainers
{
  id v3 = objc_opt_new();
  [(SystemDiagnostic *)self summarizeErrorsWithinSDTask:v3];
  [(SystemDiagnostic *)self summarizeErrorsAcrossSDTasks:v3];
  id v4 = [v3 count];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = [(SystemDiagnostic *)self outputDirectory];
    id v7 = [v6 stringByAppendingPathComponent:@"errors/SDTaskWriteErrors.txt"];

    id v8 = [v3 componentsJoinedByString:@"\n"];
    uint64_t v9 = [v8 dataUsingEncoding:4];
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)uint8_t buf = 134218242;
      id v15 = v5;
      __int16 v16 = 2080;
      id v17 = [v7 fileSystemRepresentation];
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Found %lu SDTask write errors. Adding to error file %s", buf, 0x16u);
    }
    id v13 = 0;
    [v9 writeToFile:v7 options:0 error:&v13];
    id v10 = v13;
    if (v10 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      id v11 = [v10 localizedDescription];
      id v12 = [v11 UTF8String];
      *(_DWORD *)uint8_t buf = 136315138;
      id v15 = v12;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to create error file for writing with error: %s", buf, 0xCu);
    }
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint8_t buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "No executed container errors found, not writing error file", buf, 2u);
  }
}

- (void)executeDiagnosticContainers
{
  id v3 = +[SDResourceManager sharedResourceManager];
  id v4 = +[NSDate date];
  [(SystemDiagnostic *)self setStartDiagnosticTime:v4];

  [(SystemDiagnostic *)self setStartDiagnosticTimeClockNS:clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW)];
  if (![(SystemDiagnostic *)self startDiagnosticTimeClockNS]
    && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_100065B50();
  }
  [v3 initPeerProgressHandler];
  if ([(SystemDiagnostic *)self shouldRunTimeSensitiveTasks]) {
    [(SystemDiagnostic *)self executeContainersInPhase:0 withCompletionBlock:0];
  }
  if ([(SystemDiagnostic *)self earlyPrompt]
    && [(SystemDiagnostic *)self isPromptEligible])
  {
    id v5 = dispatch_get_global_queue(33, 0);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100051A04;
    block[3] = &unk_10009CFE0;
    void block[4] = self;
    dispatch_async(v5, block);
  }
  if ([(SystemDiagnostic *)self shouldRunLogGenerationTasks]) {
    [(SystemDiagnostic *)self executeContainersInPhase:1 withCompletionBlock:0];
  }
  if ([(SystemDiagnostic *)self shouldRunLogCopyTasks]) {
    [(SystemDiagnostic *)self executeContainersInPhase:2 withCompletionBlock:0];
  }
  if ([(SystemDiagnostic *)self shouldRunOSLogArchive]) {
    [(SystemDiagnostic *)self executeOSLogArchiveContainers];
  }
  [(SystemDiagnostic *)self waitForRemoteLogs];
  [(SystemDiagnostic *)self summarizeErrorsForExecutedContainers];
  [v3 sendProgress:3 phase:0 toPeers:100.0];
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "\nCompleted all phases. Wrapping up.", v8, 2u);
  }
  uint64_t v6 = +[SDResourceManager sharedResourceManager];
  [v6 stdoutWrite:@"\nCompleted all phases. Wrapping up."];

  id v7 = +[SDResourceManager sharedResourceManager];
  [v7 log:@"\nCompleted all phases. Wrapping up."];

  [(SystemDiagnostic *)self outputMetrics];
  [(SystemDiagnostic *)self endDiagnostics];
}

- (void)recordDiagnosticsMetrics:(id)a3
{
  id v4 = a3;
  id v5 = +[NSDate date];
  [v5 timeIntervalSinceDate:v4];
  double v7 = v6;

  id v8 = [(SystemDiagnostic *)self startDiagnosticTime];
  [v5 timeIntervalSinceDate:v8];
  double v10 = v9;

  id v11 = +[NSNumber numberWithDouble:v7];
  id v12 = [(SystemDiagnostic *)self metricsDict];
  [v12 setObject:v11 forKeyedSubscript:metricCompression];

  id v13 = +[NSNumber numberWithDouble:v10];
  uint64_t v14 = [(SystemDiagnostic *)self metricsDict];
  [v14 setObject:v13 forKeyedSubscript:metricStartToTar];

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)uint8_t buf = 134217984;
    double v32 = v7;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Took %f seconds for finishing the tar\n", buf, 0xCu);
  }
  id v15 = +[SDResourceManager sharedResourceManager];
  [v15 log:@"Took %f seconds for finishing the tar\n", *(void *)&v7];

  __int16 v16 = +[NSFileManager defaultManager];
  id v17 = [(SystemDiagnostic *)self tarballPath];
  id v30 = 0;
  uint64_t v18 = [v16 attributesOfItemAtPath:v17 error:&v30];
  id v19 = v30;

  if (v18)
  {
    id v20 = [v18 fileSize];
    if (v20)
    {
      unint64_t v21 = (unint64_t)v20;
      uint64_t v22 = [(SystemDiagnostic *)self metricsDict];
      id v23 = [v22 objectForKeyedSubscript:metricTotalSize];
      id v24 = [v23 longLongValue];

      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)uint8_t buf = 134218240;
        double v32 = *(double *)&v21;
        __int16 v33 = 2048;
        double v34 = (double)(uint64_t)v24 / (double)v21;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Resource Usage - post tarring: Gathering diagnostics is %lld bytes (compressed) with %.1fX compression ratio", buf, 0x16u);
      }
      id v25 = +[SDResourceManager sharedResourceManager];
      [v25 log:@"Resource Usage - post tarring: Gathering diagnostics is %lld bytes (compressed) with %.1fX compression ratio", v21, (double)(uint64_t)v24 / (double)v21];
    }
    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint8_t buf = 0;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Unable to read tarball file size post tarring", buf, 2u);
      }
      id v25 = +[SDResourceManager sharedResourceManager];
      [v25 log:@"Unable to read tarball file size post tarring" v28 v29];
    }
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      id v26 = [v19 localizedDescription];
      *(_DWORD *)uint8_t buf = 138412290;
      double v32 = *(double *)&v26;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Unable to read tarball file attributes post tarring: %@", buf, 0xCu);
    }
    id v25 = +[SDResourceManager sharedResourceManager];
    uint64_t v27 = [v19 localizedDescription];
    [v25 log:@"Unable to read tarball file attributes post tarring: %@", v27];
  }
}

- (void)endDiagnostics
{
  if ([(SystemDiagnostic *)self coSysdiagnoseOnly])
  {
    [(SystemDiagnostic *)self setDidComplete:1];
  }
  else
  {
    id v3 = +[SDTaskDepot sharedTaskDepot];
    -[SystemDiagnostic setDidComplete:](self, "setDidComplete:", [v3 mayStartExecuting]);
  }
  if (![(SystemDiagnostic *)self coSysdiagnoseOnly])
  {
    unint64_t v4 = +[SDTaskDepot stopTasks];
    if (v4)
    {
      unint64_t v5 = v4;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_100065BF8();
      }
      double v6 = +[SDResourceManager sharedResourceManager];
      [v6 log:@"%lu tasks were still running after the generation phases ended.", v5];
    }
  }
  if ([(SystemDiagnostic *)self shouldCreateTarBall])
  {
    unsigned int v7 = [(SystemDiagnostic *)self useParallelCompression];
    id v8 = +[NSDate date];
    double v9 = [(SystemDiagnostic *)self outputDirectory];
    double v10 = [(SystemDiagnostic *)self tarballPath];
    id v11 = [(SystemDiagnostic *)self archive];
    if (v7) {
      unsigned int v12 = 5;
    }
    else {
      unsigned int v12 = 1;
    }
    [(SystemDiagnostic *)self setDpClass:sub_1000270A8(v9, v10, v12, v11)];

    id v13 = +[SDResourceManager sharedResourceManager];
    [v13 closeSysdiagnoseLog];

    [(SystemDiagnostic *)self recordDiagnosticsMetrics:v8];
  }
  else
  {
    if ([(SystemDiagnostic *)self summaryFD]) {
      fclose([(SystemDiagnostic *)self summaryFD]);
    }
    id v8 = +[SDResourceManager sharedResourceManager];
    [v8 closeSysdiagnoseLog];
  }

  uint64_t v14 = +[NSFileManager defaultManager];
  id v15 = [(SystemDiagnostic *)self outputDirectory];
  unsigned int v16 = [v14 fileExistsAtPath:v15 isDirectory:0];

  if (v16)
  {
    id v17 = [(SystemDiagnostic *)self outputDirectory];
    if (sub_1000567B0((const char *)[v17 UTF8String], 0x1F5u, 0x1F5u) == -1)
    {
    }
    else
    {
      id v18 = [(SystemDiagnostic *)self outputDirectory];
      int v19 = sub_100056818((const char *)[v18 UTF8String], 0x1EDu);

      if (v19 != -1) {
        goto LABEL_25;
      }
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      id v20 = [(SystemDiagnostic *)self outputDirectory];
      *(_DWORD *)uint8_t buf = 138412290;
      uint64_t v27 = v20;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to set file attributes on %@", buf, 0xCu);
    }
    unint64_t v21 = +[SDResourceManager sharedResourceManager];
    uint64_t v22 = [(SystemDiagnostic *)self outputDirectory];
    [v21 log:@"Failed to set file attributes on %@", v22];
  }
LABEL_25:
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    id v23 = [(SystemDiagnostic *)self completedOutputDirectory];
    *(_DWORD *)uint8_t buf = 138412290;
    uint64_t v27 = v23;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "\nOutput available at '%@'.", buf, 0xCu);
  }
  id v24 = +[SDResourceManager sharedResourceManager];
  id v25 = [(SystemDiagnostic *)self completedOutputDirectory];
  [v24 log:@"\nOutput available at '%@'.", v25];
}

- (id)getLogarchiveSummaryContainer
{
  id v3 = +[NSMutableArray array];
  unint64_t v4 = +[SDTaskDepotContainer containerWithName:@"logarchive summary" destination:0 withTimeout:1 withConcurrency:self withDelegate:35.0];
  unint64_t v5 = v4;
  if (v4)
  {
    [v4 setRuntimeChecks:[v4 runtimeChecks] | 0x40];
    double v6 = +[SDTask taskWithCommand:@"/usr/bin/log" arguments:&off_1000B1088 outputFile:@"libtrace/oslog_status.log"];
    v12[0] = @"-lRsh";
    v12[1] = @"/private/var/db/diagnostics";
    v13[0] = v6;
    unsigned int v7 = +[NSArray arrayWithObjects:v12 count:2];
    id v8 = +[SDTask taskWithCommand:@"/bin/ls" arguments:v7 outputFile:@"libtrace/oslog_contents.log"];
    v13[1] = v8;
    double v9 = +[SDTask taskWithCommand:@"/bin/ls" arguments:&off_1000B10A0 outputFile:@"libtrace/oslog_uuidtext.log"];
    void v13[2] = v9;
    double v10 = +[NSArray arrayWithObjects:v13 count:3];
    [v5 addSDTasksToContainer:v10];

    [v3 addObject:v5];
  }

  return v3;
}

- (id)getLogarchiveCollectionContainer
{
  id v3 = +[NSMutableArray array];
  unint64_t v4 = [(SystemDiagnostic *)self outputDirectory];
  unint64_t v5 = [(SystemDiagnostic *)self archive];
  double v6 = +[SDLogArchiveContainer containerWithName:@"logarchive" destination:v4 withTimeout:v5 withTargetArchive:self withDelegate:300.0];

  if (v6)
  {
    [v6 setRuntimeChecks:64];
    unsigned int v7 = +[NSMutableDictionary dictionary];
    [v7 setValue:&off_1000B1280 forKey:OSLogConstructHighVolumeSizeLimit];
    [v7 setValue:&off_1000B1298 forKey:OSLogConstructSignpostSizeLimit];
    [v7 setValue:&off_1000B12B0 forKey:OSLogConstructSpecialSizeLimit];
    [v7 setValue:&off_1000B12C8 forKey:OSLogConstructPersistSizeLimit];
    [v7 setValue:&off_1000B12E0 forKey:OSLogConstructHighVolumeAgeLimit];
    [v7 setValue:&off_1000B12F8 forKey:OSLogConstructSignpostAgeLimit];
    [v7 setValue:&off_1000B1310 forKey:OSLogConstructSpecialAgeLimit];
    [v7 setValue:&off_1000B1328 forKey:OSLogConstructPersistAgeLimit];
    id v8 = +[SDLogArchiveUnit logArchiveUnitWithDictionary:v7];
    [v6 setLogArchiveUnit:v8];

    [v3 addObject:v6];
  }

  return v3;
}

- (id)getLogStreamFilterContainer
{
  id v3 = +[NSMutableArray array];
  unint64_t v4 = +[SDLogCollectionContainer containerWithName:@"LogStreamFilter" destination:@"libtrace" withDelegate:self];
  unint64_t v5 = v4;
  if (v4)
  {
    [v4 setRuntimeChecks:9];
    double v6 = +[SDUnitLogPathArray logRuleWithPaths:&off_1000B10B8];
    v10[0] = v6;
    unsigned int v7 = +[SDUnitLogGlob logRuleWithGlob:@"/private/var/db/diagnostics/logd.[01].log"];
    v10[1] = v7;
    id v8 = +[NSArray arrayWithObjects:v10 count:2];
    [v5 addRules:v8];

    [v3 addObject:v5];
  }

  return v3;
}

- (id)getLibtraceContainers
{
  id v3 = +[NSMutableArray array];
  unint64_t v4 = [(SystemDiagnostic *)self getLogarchiveSummaryContainer];
  [v3 addObjectsFromArray:v4];

  unint64_t v5 = [(SystemDiagnostic *)self getLogarchiveCollectionContainer];
  [v3 addObjectsFromArray:v5];

  double v6 = [(SystemDiagnostic *)self getLogStreamFilterContainer];
  [v3 addObjectsFromArray:v6];

  return v3;
}

- (void)dealloc
{
  free([(SystemDiagnostic *)self processes]);
  v3.receiver = self;
  v3.super_class = (Class)SystemDiagnostic;
  [(SystemDiagnostic *)&v3 dealloc];
}

- (void)writeReportForTasks:(id)a3 withTimeout:(double)a4 concurrently:(BOOL)a5 withDepotName:(id)a6
{
  BOOL v7 = a5;
  id v9 = a3;
  long long v53 = (__CFString *)a6;
  id v10 = [objc_alloc((Class)NSMutableString) initWithString:&stru_1000A1EA8];
  if ((unint64_t)[v9 count] >= 2)
  {
    if (v7) {
      CFStringRef v11 = @"\nConcurrent ";
    }
    else {
      CFStringRef v11 = @"\nSequential ";
    }
    [v10 appendString:v11];
    [v10 appendFormat:@"group with total timeout %f sec\n", *(void *)&a4];
  }
  long long v54 = +[NSMutableArray array];
  long long v71 = 0u;
  long long v72 = 0u;
  long long v73 = 0u;
  long long v74 = 0u;
  id obj = v9;
  id v12 = [obj countByEnumeratingWithState:&v71 objects:v76 count:16];
  if (v12)
  {
    id v13 = v12;
    CFStringRef v14 = @"\"%@\",";
    uint64_t v15 = *(void *)v72;
    do
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v72 != v15) {
          objc_enumerationMutation(obj);
        }
        id v17 = *(void **)(*((void *)&v71 + 1) + 8 * i);
        if (([v17 started] & 1) == 0)
        {
          CFStringRef v20 = v14;
          unint64_t v21 = [v17 arguments];
          if (v21
            && ([v17 arguments],
                long long v56 = objc_claimAutoreleasedReturnValue(),
                ([v56 isEqualToArray:&__NSArray0__struct] & 1) == 0))
          {
            id v24 = [v17 launchPath];
            id v25 = [v17 arguments];
            id v26 = [v25 componentsJoinedByString:@" "];
            uint64_t v22 = +[NSString stringWithFormat:@"%@ %@", v24, v26];
          }
          else
          {
            uint64_t v22 = [v17 launchPath];
            if (!v21) {
              goto LABEL_25;
            }
          }

LABEL_25:
          CFStringRef v14 = v20;
          [v10 appendFormat:v20, v22];
          [v10 appendString:@"Never got executed,"];
          [v10 appendFormat:@"0.00,%f\n", *(void *)&a4, v50, v51];
          goto LABEL_33;
        }
        id v18 = [v17 executionLine];
        [v10 appendFormat:v14, v18];

        id v19 = [v17 endStatus];
        if ((v19 & 0x7F) != 0)
        {
          if ((v19 & 0x7F) == 0x7F)
          {
            if ((int)v19 >> 8 == 19) {
              +[NSString stringWithFormat:@"Unknown status %04x", v19];
            }
            else {
              +[NSString stringWithFormat:@"stopped due to signal: %s", strsignal((int)v19 >> 8)];
            }
          }
          else
          {
            +[NSString stringWithFormat:@"terminated due to signal: %s", strsignal(v19 & 0x7F)];
          uint64_t v22 = };
          [v10 appendFormat:v14, v22];
        }
        else
        {
          int v23 = BYTE1(v19);
          uint64_t v22 = +[NSString stringWithFormat:@"exited with status %d", BYTE1(v19)];
          [v10 appendFormat:v14, v22];
          if (!v23) {
            goto LABEL_29;
          }
        }
        uint64_t v27 = [v17 executionLine];
        [v17 executionTime];
        uint64_t v29 = +[NSString stringWithFormat:@"%@ %@ in %.1f seconds.\n", v27, v22, v28];

        [v54 addObject:v29];
LABEL_29:
        [v17 executionTime];
        uint64_t v31 = v30;
        if (v17)
        {
          [v17 rusage_details];
          uint64_t v32 = v64;
        }
        else
        {
          uint64_t v32 = 0;
          long long v69 = 0u;
          long long v70 = 0u;
          long long v67 = 0u;
          long long v68 = 0u;
          long long v65 = 0u;
          long long v66 = 0u;
          long long v63 = 0u;
          long long v64 = 0u;
          long long v62 = 0u;
        }
        [v10 appendFormat:@"%f,%f,%f\n", v31, *(void *)&a4, (float)((float)((float)v32 * 0.00097656) * 0.00097656)];
LABEL_33:
      }
      id v13 = [obj countByEnumeratingWithState:&v71 objects:v76 count:16];
    }
    while (v13);
  }

  if ((unint64_t)[obj count] >= 2) {
    [v10 appendString:@"\n"];
  }
  __int16 v33 = [(SystemDiagnostic *)self summaryHandle];
  sub_100027E00(v33, 0, v10, @"writing summary file report");

  if ([v54 count])
  {
    double v34 = v53;
    if (!v53) {
      double v34 = @"unnamed";
    }
    id v35 = [(SystemDiagnostic *)self outputDirectory];
    long long v53 = v34;
    uint64_t v36 = sub_100028C10(v35, v34);

    id v37 = v36;
    uint64_t v38 = sub_1000566DC((const char *)[v37 fileSystemRepresentation], 1, 0x1A4u);
    if (v38 == -1)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_100065C68((uint64_t)v37);
      }
      long long v47 = +[SDResourceManager sharedResourceManager];
      long long v48 = __error();
      [v47 stderrWrite:@"Unable to create %@: %s", v37, strerror(*v48)];

      id v39 = +[SDResourceManager sharedResourceManager];
      long long v49 = __error();
      [v39 log:@"Unable to create %@: %s", v37, strerror(*v49)];
    }
    else
    {
      id v57 = v37;
      id v39 = [objc_alloc((Class)NSFileHandle) initWithFileDescriptor:v38 closeOnDealloc:1];
      long long v58 = 0u;
      long long v59 = 0u;
      long long v60 = 0u;
      long long v61 = 0u;
      id v40 = v54;
      id v41 = [v40 countByEnumeratingWithState:&v58 objects:v75 count:16];
      if (v41)
      {
        id v42 = v41;
        uint64_t v43 = *(void *)v59;
LABEL_43:
        uint64_t v44 = 0;
        while (1)
        {
          if (*(void *)v59 != v43) {
            objc_enumerationMutation(v40);
          }
          long long v45 = *(void **)(*((void *)&v58 + 1) + 8 * v44);
          long long v46 = +[NSString stringWithFormat:@"writing %@'s error report", v53];
          LODWORD(v45) = sub_100027E00(v39, 0, v45, v46);

          if (!v45) {
            break;
          }
          if (v42 == (id)++v44)
          {
            id v42 = [v40 countByEnumeratingWithState:&v58 objects:v75 count:16];
            if (v42) {
              goto LABEL_43;
            }
            break;
          }
        }
      }

      id v37 = v57;
    }
  }
}

- (void)streamArchiveFile:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint8_t buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Invalid archive file", buf, 2u);
    }
    CFStringRef v11 = +[SDResourceManager sharedResourceManager];
    BOOL v7 = v11;
    CFStringRef v12 = @"Invalid archive file";
    goto LABEL_21;
  }
  if (![(SystemDiagnostic *)self shouldStreamToTar])
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint8_t buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Should not stream to tar, something's wrong", buf, 2u);
    }
    CFStringRef v11 = +[SDResourceManager sharedResourceManager];
    BOOL v7 = v11;
    CFStringRef v12 = @"Should not stream to tar, something's wrong";
    goto LABEL_21;
  }
  unint64_t v5 = [(SystemDiagnostic *)self archive];

  if (!v5)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint8_t buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Archive not created before", buf, 2u);
    }
    CFStringRef v11 = +[SDResourceManager sharedResourceManager];
    BOOL v7 = v11;
    CFStringRef v12 = @"Archive not created before";
LABEL_21:
    [v11 log:v12];
    goto LABEL_22;
  }
  double v6 = [(SystemDiagnostic *)self archive];
  BOOL v7 = [v6 tarQueue];

  if (v7)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
      sub_100065D0C(v4);
    }
    CFStringRef v14 = _NSConcreteStackBlock;
    uint64_t v15 = 3221225472;
    unsigned int v16 = sub_1000531E0;
    id v17 = &unk_10009D2B8;
    id v18 = self;
    id v19 = v4;
    dispatch_async(v7, &v14);
    id v8 = [(SystemDiagnostic *)self archive];
    id v9 = [v8 archiveStatus];

    if (v9 == (id)-30)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint8_t buf = 0;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "SDArchive failed, will not remove outputDirectory", buf, 2u);
      }
      id v10 = +[SDResourceManager sharedResourceManager];
      [v10 log:@"SDArchive failed, will not remove outputDirectory"];

      [(SystemDiagnostic *)self setShouldRemoveTemporaryDirectory:0];
    }
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint8_t buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Can't add files to archive, dispatch queue not created\n", buf, 2u);
    }
    id v13 = +[SDResourceManager sharedResourceManager];
    [v13 log:@"Can't add files to archive, dispatch queue not created\n"];
  }
LABEL_22:
}

- (BOOL)logCollectionContainer:(id)a3 shouldContinueAfterEncounteringError:(id)a4 path:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  NSErrorDomain v10 = [v8 domain];
  NSErrorDomain v11 = v10;
  if (v10 != NSCocoaErrorDomain)
  {

LABEL_3:
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      CFStringRef v12 = [v7 name];
      *(_DWORD *)uint8_t buf = 138412802;
      CFStringRef v20 = v12;
      __int16 v21 = 2112;
      id v22 = v8;
      __int16 v23 = 2112;
      id v24 = v9;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "LOGS: %@: error: %@, path: %@", buf, 0x20u);
    }
    id v13 = +[SDResourceManager sharedResourceManager];
    CFStringRef v14 = [v7 name];
    [v13 log:@"LOGS: %@: error: %@, path: %@", v14, v8, v9];
    goto LABEL_12;
  }
  if ([v8 code] == (id)4)
  {
  }
  else
  {
    id v15 = [v8 code];

    if (v15 != (id)260) {
      goto LABEL_3;
    }
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v16 = [v7 name];
    *(_DWORD *)uint8_t buf = 138412546;
    CFStringRef v20 = v16;
    __int16 v21 = 2112;
    id v22 = v9;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "LOGS: %@: file at path '%@' does not exist", buf, 0x16u);
  }
  id v13 = +[SDResourceManager sharedResourceManager];
  CFStringRef v14 = [v7 name];
  [v13 log:@"LOGS: %@: file at path '%@' does not exist", v14, v9, v18];
LABEL_12:

  return 1;
}

- (NSDate)startDiagnosticTime
{
  return self->_startDiagnosticTime;
}

- (void)setStartDiagnosticTime:(id)a3
{
  self->_startDiagnosticTime = (NSDate *)a3;
}

- (int64_t)startDiagnosticTimeClockNS
{
  return self->_startDiagnosticTimeClockNS;
}

- (void)setStartDiagnosticTimeClockNS:(int64_t)a3
{
  self->_startDiagnosticTimeClockNS = a3;
}

- (NSDate)oldestDateCreatedCutoff
{
  return self->_oldestDateCreatedCutoff;
}

- (void)setOldestDateCreatedCutoff:(id)a3
{
  self->_oldestDateCreatedCutoff = (NSDate *)a3;
}

- (__sFILE)summaryFD
{
  return self->_summaryFD;
}

- (void)setSummaryFD:(__sFILE *)a3
{
  self->_summaryFD = a3;
}

- (NSString)outputDirectory
{
  return (NSString *)objc_getProperty(self, a2, 80, 1);
}

- (void)setOutputDirectory:(id)a3
{
}

- (NSString)tmpOutputDirectory
{
  return (NSString *)objc_getProperty(self, a2, 88, 1);
}

- (void)setTmpOutputDirectory:(id)a3
{
}

- (NSString)baseDirectory
{
  return (NSString *)objc_getProperty(self, a2, 96, 1);
}

- (void)setBaseDirectory:(id)a3
{
}

- (NSString)diagnosticID
{
  return (NSString *)objc_getProperty(self, a2, 104, 1);
}

- (void)setDiagnosticID:(id)a3
{
}

- (NSString)archiveName
{
  return (NSString *)objc_getProperty(self, a2, 112, 1);
}

- (void)setArchiveName:(id)a3
{
}

- (NSArray)onlyRunContainersWithNames
{
  return (NSArray *)objc_getProperty(self, a2, 120, 1);
}

- (void)setOnlyRunContainersWithNames:(id)a3
{
}

- (NSString)tarballPath
{
  return (NSString *)objc_getProperty(self, a2, 128, 1);
}

- (void)setTarballPath:(id)a3
{
}

- (NSString)completedOutputDirectory
{
  return (NSString *)objc_getProperty(self, a2, 136, 1);
}

- (void)setCompletedOutputDirectory:(id)a3
{
}

- (NSString)completedTarballPath
{
  return (NSString *)objc_getProperty(self, a2, 144, 1);
}

- (void)setCompletedTarballPath:(id)a3
{
}

- (NSString)rootPath
{
  return (NSString *)objc_getProperty(self, a2, 152, 1);
}

- (void)setRootPath:(id)a3
{
}

- (NSFileHandle)summaryHandle
{
  return (NSFileHandle *)objc_getProperty(self, a2, 160, 1);
}

- (void)setSummaryHandle:(id)a3
{
}

- (NSString)frontmostBundleID
{
  return (NSString *)objc_getProperty(self, a2, 168, 1);
}

- (void)setFrontmostBundleID:(id)a3
{
}

- (NSString)changedDiagnosticProperties
{
  return (NSString *)objc_getProperty(self, a2, 176, 1);
}

- (void)setChangedDiagnosticProperties:(id)a3
{
}

- (OS_dispatch_group)completionDispatchGroup
{
  return (OS_dispatch_group *)objc_getProperty(self, a2, 184, 1);
}

- (void)setCompletionDispatchGroup:(id)a3
{
}

- (NSArray)targetPIDs
{
  return (NSArray *)objc_getProperty(self, a2, 192, 1);
}

- (void)setTargetPIDs:(id)a3
{
}

- (NSMutableArray)pidIndices
{
  return (NSMutableArray *)objc_getProperty(self, a2, 200, 1);
}

- (void)setPidIndices:(id)a3
{
}

- (NSString)warnProcessAllowlist
{
  return (NSString *)objc_getProperty(self, a2, 208, 1);
}

- (void)setWarnProcessAllowlist:(id)a3
{
}

- (NSString)providedPIDorProcess
{
  return (NSString *)objc_getProperty(self, a2, 216, 1);
}

- (void)setProvidedPIDorProcess:(id)a3
{
}

- (NSString)remoteSysdiagnoseID
{
  return (NSString *)objc_getProperty(self, a2, 224, 1);
}

- (void)setRemoteSysdiagnoseID:(id)a3
{
}

- (unsigned)requestSource
{
  return self->_requestSource;
}

- (void)setRequestSource:(unsigned __int16)a3
{
  self->_requestSource = a3;
}

- (NSDictionary)capOverride
{
  return (NSDictionary *)objc_getProperty(self, a2, 232, 1);
}

- (void)setCapOverride:(id)a3
{
}

- (NSNumber)totalTime
{
  return (NSNumber *)objc_getProperty(self, a2, 240, 1);
}

- (void)setTotalTime:(id)a3
{
}

- (NSMutableDictionary)metricsDict
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 248, 1);
}

- (NSDictionary)overrideContainers
{
  return (NSDictionary *)objc_getProperty(self, a2, 256, 1);
}

- (void)setOverrideContainers:(id)a3
{
}

- (SDArchive)archive
{
  return (SDArchive *)objc_getProperty(self, a2, 264, 1);
}

- (void)setArchive:(id)a3
{
}

- (BOOL)didComplete
{
  return self->_didComplete;
}

- (void)setDidComplete:(BOOL)a3
{
  self->_didComplete = a3;
}

- (BOOL)shouldStreamToTar
{
  return self->_shouldStreamToTar;
}

- (void)setShouldStreamToTar:(BOOL)a3
{
  self->_shouldStreamToTar = a3;
}

- (BOOL)disableStreamTar
{
  return self->_disableStreamTar;
}

- (void)setDisableStreamTar:(BOOL)a3
{
  self->_disableStreamTar = a3;
}

- (BOOL)shouldPostProcess
{
  return self->_shouldPostProcess;
}

- (void)setShouldPostProcess:(BOOL)a3
{
  self->_shouldPostProcess = a3;
}

- (BOOL)isTestingMode
{
  return self->_isTestingMode;
}

- (void)setIsTestingMode:(BOOL)a3
{
  self->_isTestingMode = a3;
}

- (BOOL)disableUIFeedback
{
  return self->_disableUIFeedback;
}

- (void)setDisableUIFeedback:(BOOL)a3
{
  self->_disableUIFeedback = a3;
}

- (BOOL)deShowFeedback
{
  return self->_deShowFeedback;
}

- (void)setDeShowFeedback:(BOOL)a3
{
  self->_deShowFeedback = a3;
}

- (proc_bsdinfo)processes
{
  return self->_processes;
}

- (void)setProcesses:(proc_bsdinfo *)a3
{
  self->_processes = a3;
}

- (int)processCount
{
  return self->_processCount;
}

- (void)setProcessCount:(int)a3
{
  self->_processCount = a3;
}

- (OS_xpc_object)coSysdiagnoseParameters
{
  return self->_coSysdiagnoseParameters;
}

- (void)setCoSysdiagnoseParameters:(id)a3
{
}

- (BOOL)quickMode
{
  return self->_quickMode;
}

- (void)setQuickMode:(BOOL)a3
{
  self->_quickMode = a3;
}

- (BOOL)useParallelCompression
{
  return self->_useParallelCompression;
}

- (void)setUseParallelCompression:(BOOL)a3
{
  self->_useParallelCompression = a3;
}

- (BOOL)shouldRunTimeSensitiveTasks
{
  return self->_shouldRunTimeSensitiveTasks;
}

- (void)setShouldRunTimeSensitiveTasks:(BOOL)a3
{
  self->_shouldRunTimeSensitiveTasks = a3;
}

- (BOOL)shouldRunLogGenerationTasks
{
  return self->_shouldRunLogGenerationTasks;
}

- (void)setShouldRunLogGenerationTasks:(BOOL)a3
{
  self->_shouldRunLogGenerationTasks = a3;
}

- (BOOL)shouldRunLogCopyTasks
{
  return self->_shouldRunLogCopyTasks;
}

- (void)setShouldRunLogCopyTasks:(BOOL)a3
{
  self->_shouldRunLogCopyTasks = a3;
}

- (BOOL)shouldRunOSLogArchive
{
  return self->_shouldRunOSLogArchive;
}

- (void)setShouldRunOSLogArchive:(BOOL)a3
{
  self->_shouldRunOSLogArchive = a3;
}

- (BOOL)shouldGetFeedbackData
{
  return self->_shouldGetFeedbackData;
}

- (void)setShouldGetFeedbackData:(BOOL)a3
{
  self->_shouldGetFeedbackData = a3;
}

- (BOOL)shouldRunIDSDump
{
  return self->_shouldRunIDSDump;
}

- (void)setShouldRunIDSDump:(BOOL)a3
{
  self->_shouldRunIDSDump = a3;
}

- (BOOL)verbose
{
  return self->_verbose;
}

- (void)setVerbose:(BOOL)a3
{
  self->_verbose = a3;
}

- (BOOL)earlyPrompt
{
  return self->_earlyPrompt;
}

- (void)setEarlyPrompt:(BOOL)a3
{
  self->_earlyPrompt = a3;
}

- (BOOL)shouldCreateTarBall
{
  return self->_shouldCreateTarBall;
}

- (void)setShouldCreateTarBall:(BOOL)a3
{
  self->_shouldCreateTarBall = a3;
}

- (BOOL)shouldDisplayTarBall
{
  return self->_shouldDisplayTarBall;
}

- (void)setShouldDisplayTarBall:(BOOL)a3
{
  self->_shouldDisplayTarBall = a3;
}

- (BOOL)canDisplayTarBall
{
  return self->_canDisplayTarBall;
}

- (void)setCanDisplayTarBall:(BOOL)a3
{
  self->_canDisplayTarBall = a3;
}

- (BOOL)shouldRemoveTemporaryDirectory
{
  return self->_shouldRemoveTemporaryDirectory;
}

- (void)setShouldRemoveTemporaryDirectory:(BOOL)a3
{
  self->_shouldRemoveTemporaryDirectory = a3;
}

- (BOOL)generatePlist
{
  return self->_generatePlist;
}

- (void)setGeneratePlist:(BOOL)a3
{
  self->_generatePlist = a3;
}

- (int64_t)coSysdiagnose
{
  return self->_coSysdiagnose;
}

- (void)setCoSysdiagnose:(int64_t)a3
{
  self->_coSysdiagnose = a3;
}

- (BOOL)coSysdiagnoseOnly
{
  return self->_coSysdiagnoseOnly;
}

- (void)setCoSysdiagnoseOnly:(BOOL)a3
{
  self->_coSysdiagnoseOnly = a3;
}

- (int)dpClass
{
  return self->_dpClass;
}

- (void)setDpClass:(int)a3
{
  self->_dpClass = a3;
}

- (NSString)brctl_dir
{
  return (NSString *)objc_getProperty(self, a2, 296, 1);
}

- (void)setBrctl_dir:(id)a3
{
}

- (BOOL)tconNvmDump
{
  return self->_tconNvmDump;
}

- (void)setTconNvmDump:(BOOL)a3
{
  self->_tconNvmDump = a3;
}

- (BOOL)collectWifiDextCoreFiles
{
  return self->_collectWifiDextCoreFiles;
}

- (void)setCollectWifiDextCoreFiles:(BOOL)a3
{
  self->_collectWifiDextCoreFiles = a3;
}

- (NSMutableDictionary)executedContainers
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 304, 1);
}

- (void)setExecutedContainers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_executedContainers, 0);
  objc_storeStrong((id *)&self->_brctl_dir, 0);
  objc_storeStrong((id *)&self->_coSysdiagnoseParameters, 0);
  objc_storeStrong((id *)&self->_archive, 0);
  objc_storeStrong((id *)&self->_overrideContainers, 0);
  objc_storeStrong((id *)&self->_metricsDict, 0);
  objc_storeStrong((id *)&self->_totalTime, 0);
  objc_storeStrong((id *)&self->_capOverride, 0);
  objc_storeStrong((id *)&self->_remoteSysdiagnoseID, 0);
  objc_storeStrong((id *)&self->_providedPIDorProcess, 0);
  objc_storeStrong((id *)&self->_warnProcessAllowlist, 0);
  objc_storeStrong((id *)&self->_pidIndices, 0);
  objc_storeStrong((id *)&self->_targetPIDs, 0);
  objc_storeStrong((id *)&self->_completionDispatchGroup, 0);
  objc_storeStrong((id *)&self->_changedDiagnosticProperties, 0);
  objc_storeStrong((id *)&self->_frontmostBundleID, 0);
  objc_storeStrong((id *)&self->_summaryHandle, 0);
  objc_storeStrong((id *)&self->_rootPath, 0);
  objc_storeStrong((id *)&self->_completedTarballPath, 0);
  objc_storeStrong((id *)&self->_completedOutputDirectory, 0);
  objc_storeStrong((id *)&self->_tarballPath, 0);
  objc_storeStrong((id *)&self->_onlyRunContainersWithNames, 0);
  objc_storeStrong((id *)&self->_archiveName, 0);
  objc_storeStrong((id *)&self->_diagnosticID, 0);
  objc_storeStrong((id *)&self->_baseDirectory, 0);
  objc_storeStrong((id *)&self->_tmpOutputDirectory, 0);

  objc_storeStrong((id *)&self->_outputDirectory, 0);
}

@end
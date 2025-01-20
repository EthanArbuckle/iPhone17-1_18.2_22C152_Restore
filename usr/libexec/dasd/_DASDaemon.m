@interface _DASDaemon
+ (_DASDaemon)sharedInstance;
- (BOOL)activityIsTimewiseEligible:(id)a3 atDate:(id)a4;
- (BOOL)addLaunchRequest:(id)a3;
- (BOOL)canSubmitValidatedTaskRequest:(id)a3 withError:(id *)a4;
- (BOOL)evaluateAllActivitiesFor:(id)a3 writingToFile:(id)a4;
- (BOOL)evaluatePoliciesForActivitiesChunk:(id)a3 writingToFile:(id)a4;
- (BOOL)isActivitySuspendable:(id)a3 withStartDate:(id)a4;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (BOOL)pausedParametersApplyToActivity:(id)a3;
- (BOOL)recomEngineDisabled;
- (BOOL)removeTempBGSQLFile:(id)a3;
- (BOOL)shouldEvaluateTask:(id)a3 atDate:(id)a4;
- (BOOL)shouldPreemptActivity:(id)a3 forFastPassActivity:(id)a4;
- (BOOL)shouldRunActivityNow:(id)a3;
- (BOOL)shouldRunActivityNow:(id)a3 withOtherActivities:(id)a4;
- (BOOL)shouldSuspendLongRunningActivity:(id)a3 withStartDate:(id)a4 whileBlockingOtherTasks:(BOOL)a5 atDate:(id)a6;
- (BOOL)taskRegistryMode;
- (BOOL)testModeConstraintsApplyToActivity:(id)a3;
- (BOOL)testModeConstraintsRequireOverridingDecisionWithScores:(id)a3 ignoredPolicies:(id)a4 honoredPolicies:(id)a5;
- (BOOL)validateConfigurationForActivity:(id)a3;
- (NSCountedSet)launchesPerApp;
- (NSDate)timerEarliestFireDate;
- (NSDate)timerLatestFireDate;
- (NSDictionary)pausedParameters;
- (NSDictionary)testModeParameters;
- (NSDictionary)triggerToPolicyMap;
- (NSMutableArray)clients;
- (NSMutableDictionary)activitiesWaitingForBGTaskClients;
- (NSMutableDictionary)activityToIncompatibleActivitiesMap;
- (NSMutableDictionary)applicationLaunchRequests;
- (NSMutableDictionary)applicationsLaunched;
- (NSMutableDictionary)connectedBGTaskClients;
- (NSMutableDictionary)extensionLaunchRequests;
- (NSMutableDictionary)groupToPendingTasks;
- (NSMutableDictionary)groupToPrerunningTasks;
- (NSMutableDictionary)groupToRunningTasks;
- (NSMutableDictionary)groups;
- (NSMutableDictionary)powerAssertions;
- (NSMutableDictionary)recentlyLaunchedApps;
- (NSMutableDictionary)triggerToActivitiesMap;
- (NSMutableSet)pendingTasks;
- (NSMutableSet)prerunningTasks;
- (NSMutableSet)prewarmInvalidationConnections;
- (NSMutableSet)runningTasks;
- (NSMutableSet)signpostActivitiesRunningDeviceActive;
- (NSMutableSet)signpostActivitiesRunningScreenOff;
- (NSSet)taskRegistryProcesses;
- (NSString)description;
- (NSUserDefaults)testingDefaults;
- (NSXPCListener)bgstListener;
- (NSXPCListener)listener;
- (OS_dispatch_queue)activityLaunchQueue;
- (OS_dispatch_queue)evaluationQueue;
- (OS_dispatch_queue)groupMonitoringQueue;
- (OS_dispatch_queue)launchQueue;
- (OS_dispatch_queue)timerSchedulingQueue;
- (OS_dispatch_source)databaseMaintenanceTimer;
- (OS_dispatch_source)groupMonitoringTimer;
- (OS_dispatch_source)launchTimeResetTimer;
- (OS_dispatch_source)optimalScoringTimer;
- (OS_xpc_object)prewarmInvalidationListener;
- (_APRSManager)appResumeManager;
- (_CDContextualKeyPath)maintenanceConstraintsKP;
- (_CDContextualKeyPath)utilityConstraintsKP;
- (_CDLocalContext)context;
- (_DASActivityDependencyManager)dependencyManager;
- (_DASActivityProfiler)profiler;
- (_DASActivityRateLimitManager)rateLimiter;
- (_DASAssertionArbiter)assertionArbiter;
- (_DASBARScheduler)barScheduler;
- (_DASBackgroundAppKillDemo)bgAppKillDemoInstance;
- (_DASBacklightStateMonitor)backlightStateMonitor;
- (_DASBatchingQueue)activityCompletedBatchingQueue;
- (_DASBatchingQueue)networkActivitiesQueue;
- (_DASBatchingQueue)triggerBatchingQueue;
- (_DASBatchingQueue)triggerRecorderBatchingQueue;
- (_DASBlueListManager)blueListManager;
- (_DASBudgetManager)budgetManager;
- (_DASCPMModeMonitor)cpmModeMonitor;
- (_DASClosureManager)closureManager;
- (_DASConfigurationLimiter)configurationLimiter;
- (_DASControlEngine)controlEngine;
- (_DASDataStore)store;
- (_DASDiskSpaceMonitor)diskSpaceMonitor;
- (_DASDock)applicationDock;
- (_DASENManager)enManager;
- (_DASFairScheduleManager)fairScheduleManager;
- (_DASFeatureDurationTracker)featureDurationTracker;
- (_DASNetworkEvaluationMonitor)networkEvaluationMonitor;
- (_DASNotificationManager)notificationManager;
- (_DASRemoteDeviceActivityMonitor)remoteDeviceActivityMonitor;
- (_DASRemoteDeviceNearbyMonitor)remoteDeviceNearbyMonitor;
- (_DASRemoteDeviceWakeMonitor)remoteDeviceWakeMonitor;
- (_DASRuntimeLimiter)runtimeLimiter;
- (_DASSleepWakeMonitor)sleepWakeMonitor;
- (_DASSmartPowerNapMonitor)smartPowerNapMonitor;
- (_DASSwapPredictionManager)swapManager;
- (_DASTimer)schedulingTimer;
- (_DASTrialManager)trialManager;
- (_DASUserRequestedBackupTaskManager)backupTaskManager;
- (id)activityAnalyticsWithActivity:(id)a3 didComplete:(BOOL)a4;
- (id)activityMatchingPredicate:(id)a3;
- (id)activityRunStatistics;
- (id)allPendingBackgroundTasks;
- (id)allPendingPushLaunchTasks;
- (id)allPendingRestartTasks;
- (id)allPendingSyncOnBackupTasks;
- (id)allPendingTasks;
- (id)allPrerunningTasks;
- (id)allTasks;
- (id)allTimewiseEligibleNetworkTasksAllowingCell:(BOOL)a3;
- (id)assertionArbiter:(id)a3 clientWithPID:(int)a4;
- (id)candidateGroupActivityForPreemption:(id)a3;
- (id)clientForActivity:(id)a3;
- (id)createTempBGSQLFile:(id)a3;
- (id)currentReportingConditions;
- (id)earlyToday;
- (id)evaluatePolicies:(id)a3;
- (id)getActivityRunningWithName:(id)a3;
- (id)getActivityRunningWithUUID:(id)a3;
- (id)getActivityWithName:(id)a3;
- (id)getActivityWithUUID:(id)a3;
- (id)initAsAnonymous:(BOOL)a3 withContext:(id)a4;
- (id)sortCandidateActivities:(id)a3;
- (id)startedTasks;
- (id)tasksNoLongerEligible;
- (id)tasksNoLongerEligibleFromTasks:(id)a3;
- (id)widgetRefreshStatisticsWithStore:(id)a3;
- (id)widgetViewsStatisticsWithStore:(id)a3;
- (int64_t)additionalCapacityForActivity:(id)a3 inGroupWithName:(id)a4 shouldTryToSuspend:(BOOL)a5;
- (int64_t)capacityFromGroupMax:(int64_t)a3 forPriority:(unint64_t)a4;
- (int64_t)currentLoadFromActivities:(id)a3 inGroupWithName:(id)a4;
- (os_unfair_lock_s)constraintsLock;
- (os_unfair_lock_s)groupLock;
- (os_unfair_lock_s)prewarmInvalidationLock;
- (os_unfair_lock_s)signpostLock;
- (os_unfair_recursive_lock_s)activityStateLock;
- (os_unfair_recursive_lock_s)applicationLaunchRequestsLock;
- (unint64_t)maintenanceConstraints;
- (unint64_t)photosIsBlocked;
- (unint64_t)requestCountForApplication:(id)a3;
- (unint64_t)submittedTaskCount;
- (unint64_t)utilityConstraints;
- (void)_prewarmSuspendForMessage:(id)a3;
- (void)_prewarmSuspendHandleIncoming:(id)a3 onConnection:(id)a4;
- (void)_resetWidgetBudgets;
- (void)_unexpectedXPCObject:(id)a3 WithLog:(id)a4;
- (void)activity:(id)a3 blockedOnPolicies:(id)a4;
- (void)activity:(id)a3 runWithoutHonoringPolicies:(id)a4;
- (void)activityCanceled:(id)a3;
- (void)activityCompleted:(id)a3;
- (void)activityContainsOverrides:(id)a3 handler:(id)a4;
- (void)activityRunStatisticsWithHandler:(id)a3;
- (void)activityStarted:(id)a3;
- (void)activityStartedWithParameters:(id)a3;
- (void)activityStoppedWithParameters:(id)a3;
- (void)addConstraint:(unint64_t)a3 forSchedulingPriority:(unint64_t)a4;
- (void)addPauseExceptParameter:(id)a3 handler:(id)a4;
- (void)addPendingActivitiesToGroups:(id)a3;
- (void)addPendingActivity:(id)a3 toGroupWithName:(id)a4;
- (void)addPrerunningActivity:(id)a3 toGroupWithName:(id)a4;
- (void)addRunningActivity:(id)a3 toGroupWithName:(id)a4;
- (void)addTriggersToActivity:(id)a3;
- (void)advanceAppLaunchDateIfNecessaryForActivity:(id)a3;
- (void)allBudgetsWithHandler:(id)a3;
- (void)allClientsDo:(id)a3;
- (void)assertionArbiter:(id)a3 didIssueInvalidationFor:(id)a4 serverInitiated:(BOOL)a5;
- (void)assertionArbiter:(id)a3 didIssueWarningFor:(id)a4;
- (void)associateActivity:(id)a3 withTriggerKeys:(id)a4;
- (void)backgroundAppRefreshEnabledForApp:(id)a3 withHandler:(id)a4;
- (void)balanceForBudgetWithName:(id)a3 withHandler:(id)a4;
- (void)beginWorkForActivity:(id)a3;
- (void)blockingPoliciesWithParameters:(id)a3 handler:(id)a4;
- (void)cancelActivities:(id)a3;
- (void)cancelAllBackgroundTasks;
- (void)cancelAllTaskRequestsForApplication:(id)a3;
- (void)cancelAppRefreshTasksForApps:(id)a3;
- (void)cancelBackgroundTasksForApps:(id)a3;
- (void)cancelContactTracingTasksForApps:(id)a3;
- (void)cancelLaunchesOfTypes:(id)a3 forApps:(id)a4;
- (void)cancelPushLaunchTasksForApps:(id)a3;
- (void)cancelTaskRequestWithIdentifier:(id)a3 forApplication:(id)a4;
- (void)chooseActivitiesToRunFromCandidateActivities:(id)a3 toBeRunActivities:(id)a4 toLaunchApplications:(id)a5 toLaunchExtension:(id)a6;
- (void)clasStatusWithHandler:(id)a3;
- (void)cleanupForActivity:(id)a3 wasCompleted:(BOOL)a4;
- (void)clearActivityFromPrerunning:(id)a3;
- (void)clearRecentlyLaunchedApps;
- (void)computeStaticPriorityForActivity:(id)a3;
- (void)createActivityGroup:(id)a3;
- (void)createAssertion:(id)a3;
- (void)createDefaultActivityGroups;
- (void)currentPredictionsWithHandler:(id)a3;
- (void)decrementBy:(double)a3 forBudgetWithName:(id)a4;
- (void)deferActivities:(id)a3 withHandler:(id)a4;
- (void)delayLaunchesOfType:(id)a3 forApps:(id)a4;
- (void)delayedRunningActivitiesWithHandler:(id)a3;
- (void)deleteLimitForActivity:(id)a3 forLimiterWithName:(id)a4 handler:(id)a5;
- (void)determineNextTimerFireDateAndSchedule;
- (void)disableAppRefreshForApps:(id)a3;
- (void)enableTaskRegistryMode:(BOOL)a3 processes:(id)a4 handler:(id)a5;
- (void)endLaunchWithReason:(id)a3 forApp:(id)a4;
- (void)enterTestModeWithParameters:(id)a3 reset:(BOOL)a4 handler:(id)a5;
- (void)establishConnectionFromClient:(id)a3 withCompletionHandler:(id)a4;
- (void)evaluateAllActivities:(id)a3 handler:(id)a4;
- (void)evaluateAssertions;
- (void)evaluatePolicies:(id)a3 handler:(id)a4;
- (void)evaluateScoreAndRunActivities:(id)a3;
- (void)evaluateScoreAndRunAllActivitiesForReason:(id)a3;
- (void)extensionActivity:(id)a3 finishedWithStatus:(unsigned __int8)a4;
- (void)forceRunActivities:(id)a3;
- (void)getActivityTimelines:(id)a3 timeFilter:(id)a4 bgsqlData:(id)a5 handler:(id)a6;
- (void)getBuddyEvents:(id)a3 bgsqlData:(id)a4 handler:(id)a5;
- (void)getConditionsPenalties:(id)a3 handler:(id)a4;
- (void)getDeviceConditionTimelines:(id)a3 bgsqlData:(id)a4 handler:(id)a5;
- (void)getElapsedRuntimes:(id)a3 timeFilter:(id)a4 bgsqlData:(id)a5 handler:(id)a6;
- (void)getEstimatedMADCompletionTimes:(id)a3 endDate:(id)a4 bgsqlData:(id)a5 handler:(id)a6;
- (void)getEstimatedRuntimes:(id)a3 timeFilter:(id)a4 bgsqlData:(id)a5 handler:(id)a6;
- (void)getFeatureTimelines:(id)a3 timeFilter:(id)a4 bgsqlData:(id)a5 handler:(id)a6;
- (void)getInstallTimeline:(id)a3 bgsqlData:(id)a4 handler:(id)a5;
- (void)getLimiterResponseForActivity:(id)a3 handler:(id)a4;
- (void)getPendingTaskRequestsForApplication:(id)a3 withCompletionHandler:(id)a4;
- (void)getRuntimeLimit:(id)a3 handler:(id)a4;
- (void)handleCompletedActivities:(id)a3;
- (void)handleRunningActivities:(id)a3;
- (void)handleSysdiagnoseStartEvent;
- (void)handleTriggers:(id)a3;
- (void)handleTriggersBatched:(id)a3;
- (void)immediatelyBeginWorkForActivity:(id)a3;
- (void)inspect:(id)a3 withHandler:(id)a4;
- (void)launchApplication:(id)a3 applicationURL:(id)a4 additionalOptions:(id)a5 completion:(id)a6;
- (void)loadState;
- (void)loadStateWhenAvailable;
- (void)loadTestingDefaults;
- (void)logLimitations:(id)a3;
- (void)moveActivityToPrerunning:(id)a3;
- (void)moveActivityToRunning:(id)a3;
- (void)pauseWithParameters:(id)a3 handler:(id)a4;
- (void)periodicCalculationForOptimal;
- (void)policiesWithHandler:(id)a3;
- (void)prewarmApplication:(id)a3;
- (void)prewarmSuspendApplication:(id)a3 withHandler:(id)a4;
- (void)recordToTaskRegistry:(id)a3 lifeCycleStateName:(id)a4;
- (void)registerForNetworkPathEvaluation;
- (void)registerForTrial;
- (void)registerTriggersWithContextStoreForPolicies:(id)a3;
- (void)registerWithContextStoreForId:(id)a3 contextualPredicate:(id)a4 dismissalCondition:(id)a5 deviceSet:(unint64_t)a6 mustWake:(BOOL)a7 qualityOfService:(unsigned int)a8;
- (void)releaseAssertion:(id)a3;
- (void)releaseAssertions:(id)a3;
- (void)removeActivityFromGroupToPendingTasks:(id)a3;
- (void)removeActivityFromIncompatibleActivitiesMap:(id)a3;
- (void)removeActivityFromNestedMaps:(id)a3;
- (void)removeActivityFromTriggerMap:(id)a3;
- (void)removeClient:(id)a3;
- (void)removeConstraint:(unint64_t)a3 forSchedulingPriority:(unint64_t)a4;
- (void)removeDuplicateLaunchTasks:(id)a3;
- (void)removeLaunchRequest:(id)a3;
- (void)reportActivity:(id)a3 isBlockedWithDecision:(int64_t)a4;
- (void)reportActivityTiming:(id)a3;
- (void)reportCustomCheckpoint:(unint64_t)a3 forTask:(id)a4 withHandler:(id)a5;
- (void)reportFeatureCheckpoint:(unint64_t)a3 forFeature:(unint64_t)a4 withHandler:(id)a5;
- (void)reportOversizeLoadSymptomForActivity:(id)a3 atStart:(BOOL)a4;
- (void)reportPostRestoreCheckpoint:(unint64_t)a3 withParameters:(id)a4;
- (void)reportSystemWorkload:(unint64_t)a3 ofCategory:(unint64_t)a4 withHandler:(id)a5;
- (void)resetFastPassActivities:(id)a3 resetAll:(BOOL)a4 withHandler:(id)a5;
- (void)resetOnlyPreemptiveSuspend;
- (void)runActivities:(id)a3;
- (void)runActivitiesAndRemoveUnknown:(id)a3;
- (void)runActivitiesWithUrgency:(int64_t)a3 activities:(id)a4;
- (void)runApplicationLaunchActivities:(id)a3;
- (void)runExtensionLaunchActivities:(id)a3;
- (void)runLaunchTasks:(id)a3 forApplication:(id)a4 forApplicationURL:(id)a5 onLaunch:(id)a6 onCompletion:(id)a7 onFailure:(id)a8;
- (void)runLocalActivity:(id)a3;
- (void)runProceedableActivities:(id)a3 handler:(id)a4;
- (void)runningActivitiesWithHandler:(id)a3;
- (void)runningGroupActivitiesWithHandler:(id)a3;
- (void)scheduleConnectionTimeoutForPid:(int)a3;
- (void)scheduleTimerForActivity:(id)a3;
- (void)scheduleTimerOnBehalfOf:(id)a3 between:(double)a4 and:(double)a5 waking:(BOOL)a6;
- (void)schedulingTimerFired;
- (void)scoresForActivityWithName:(id)a3 withHandler:(id)a4;
- (void)setActivitiesWaitingForBGTaskClients:(id)a3;
- (void)setActivityCompletedBatchingQueue:(id)a3;
- (void)setActivityLaunchQueue:(id)a3;
- (void)setActivityStateLock:(os_unfair_recursive_lock_s)a3;
- (void)setActivityToIncompatibleActivitiesMap:(id)a3;
- (void)setAppResumeManager:(id)a3;
- (void)setApplicationDock:(id)a3;
- (void)setApplicationLaunchRequests:(id)a3;
- (void)setApplicationLaunchRequestsLock:(os_unfair_recursive_lock_s)a3;
- (void)setApplicationsLaunched:(id)a3;
- (void)setAssertionArbiter:(id)a3;
- (void)setBacklightStateMonitor:(id)a3;
- (void)setBackupTaskManager:(id)a3;
- (void)setBalance:(double)a3 forBudgetWithName:(id)a4;
- (void)setBarScheduler:(id)a3;
- (void)setBgAppKillDemoInstance:(id)a3;
- (void)setBgstListener:(id)a3;
- (void)setBlueListManager:(id)a3;
- (void)setBudgetManager:(id)a3;
- (void)setCapacity:(double)a3 forBudgetWithName:(id)a4;
- (void)setClients:(id)a3;
- (void)setClosureManager:(id)a3;
- (void)setConfigurationLimiter:(id)a3;
- (void)setConnectedBGTaskClients:(id)a3;
- (void)setConstraintsLock:(os_unfair_lock_s)a3;
- (void)setContext:(id)a3;
- (void)setControlEngine:(id)a3;
- (void)setCpmModeMonitor:(id)a3;
- (void)setDatabaseMaintenanceTimer:(id)a3;
- (void)setDependencyManager:(id)a3;
- (void)setDiskSpaceMonitor:(id)a3;
- (void)setEnManager:(id)a3;
- (void)setEvaluationQueue:(id)a3;
- (void)setExtensionLaunchRequests:(id)a3;
- (void)setFairScheduleManager:(id)a3;
- (void)setFeatureDurationTracker:(id)a3;
- (void)setGroupLock:(os_unfair_lock_s)a3;
- (void)setGroupMonitoringQueue:(id)a3;
- (void)setGroupMonitoringTimer:(id)a3;
- (void)setGroupToPendingTasks:(id)a3;
- (void)setGroupToPrerunningTasks:(id)a3;
- (void)setGroupToRunningTasks:(id)a3;
- (void)setGroups:(id)a3;
- (void)setLaunchQueue:(id)a3;
- (void)setLaunchTimeResetTimer:(id)a3;
- (void)setLaunchesPerApp:(id)a3;
- (void)setListener:(id)a3;
- (void)setMaintenanceConstraints:(unint64_t)a3;
- (void)setMaintenanceConstraintsKP:(id)a3;
- (void)setMinimumBackgroundFetchInterval:(double)a3 forApp:(id)a4;
- (void)setNetworkActivitiesQueue:(id)a3;
- (void)setNetworkEvaluationMonitor:(id)a3;
- (void)setNotificationManager:(id)a3;
- (void)setOptimalScoringTimer:(id)a3;
- (void)setPausedParameters:(id)a3;
- (void)setPendingTasks:(id)a3;
- (void)setPhotosIsBlocked:(unint64_t)a3;
- (void)setPowerAssertions:(id)a3;
- (void)setPrerunningTasks:(id)a3;
- (void)setPrewarmInvalidationConnections:(id)a3;
- (void)setPrewarmInvalidationListener:(id)a3;
- (void)setPrewarmInvalidationLock:(os_unfair_lock_s)a3;
- (void)setProfiler:(id)a3;
- (void)setRateLimiter:(id)a3;
- (void)setRecentlyLaunchedApps:(id)a3;
- (void)setRecomEngineDisabled:(BOOL)a3;
- (void)setRemoteDeviceActivityMonitor:(id)a3;
- (void)setRemoteDeviceNearbyMonitor:(id)a3;
- (void)setRemoteDeviceWakeMonitor:(id)a3;
- (void)setRunningTasks:(id)a3;
- (void)setRuntimeLimiter:(id)a3;
- (void)setSchedulingTimer:(id)a3;
- (void)setSignpostActivitiesRunningDeviceActive:(id)a3;
- (void)setSignpostActivitiesRunningScreenOff:(id)a3;
- (void)setSignpostLock:(os_unfair_lock_s)a3;
- (void)setSleepWakeMonitor:(id)a3;
- (void)setSmartPowerNapMonitor:(id)a3;
- (void)setStore:(id)a3;
- (void)setSwapManager:(id)a3;
- (void)setTaskRegistryMode:(BOOL)a3;
- (void)setTaskRegistryProcesses:(id)a3;
- (void)setTestModeParameters:(id)a3;
- (void)setTestingDefaults:(id)a3;
- (void)setTimerEarliestFireDate:(id)a3;
- (void)setTimerLatestFireDate:(id)a3;
- (void)setTimerSchedulingQueue:(id)a3;
- (void)setTrialManager:(id)a3;
- (void)setTriggerBatchingQueue:(id)a3;
- (void)setTriggerRecorderBatchingQueue:(id)a3;
- (void)setTriggerToActivitiesMap:(id)a3;
- (void)setTriggerToPolicyMap:(id)a3;
- (void)setUtilityConstraints:(unint64_t)a3;
- (void)setUtilityConstraintsKP:(id)a3;
- (void)setupDatabaseMaintenance;
- (void)setupPrewarmSuspendListener;
- (void)setupTimers;
- (void)solicitActivityResubmission;
- (void)start;
- (void)startedActivities:(id)a3;
- (void)statisticsWithHandler:(id)a3;
- (void)submitActivities:(id)a3;
- (void)submitActivity:(id)a3;
- (void)submitActivity:(id)a3 inGroup:(id)a4;
- (void)submitActivity:(id)a3 inGroup:(id)a4 withHandler:(id)a5;
- (void)submitRateLimitConfiguration:(id)a3 handler:(id)a4;
- (void)submittedActivitiesWithHandler:(id)a3;
- (void)suspendActivities:(id)a3;
- (void)suspendActivitiesWithIdentifiers:(id)a3;
- (void)suspendActivity:(id)a3;
- (void)suspendPlugin:(id)a3;
- (void)unprotectedEvaluateScoreAndRunActivities:(id)a3;
- (void)updateActivity:(id)a3 withParameters:(id)a4;
- (void)updateCompletionStatus:(BOOL)a3 forOngoingTask:(id)a4;
- (void)updateLimit:(double)a3 forActivity:(id)a4 forLimiterWithName:(id)a5 handler:(id)a6;
- (void)updateOngoingTask:(id)a3 completionHandler:(id)a4;
- (void)updateOnlyPreemptiveSuspend:(BOOL)a3;
- (void)updateProgressForOngoingTask:(id)a3 completionHandler:(id)a4;
- (void)updateSuspendRequestDate:(id)a3 forActivity:(id)a4 withReason:(id)a5;
- (void)updateSystemConstraintsWithParameters:(id)a3;
- (void)updateTrialParameters;
- (void)updateiCPLTasksBlocked:(unint64_t)a3;
- (void)warnBGTaskClientsForActivitiesAboutToExpire:(id)a3;
@end

@implementation _DASDaemon

- (void)computeStaticPriorityForActivity:(id)a3
{
  uint64_t v3 = 999999999;
  id v4 = a3;
  v5 = [v4 featureCodes];

  if (v5)
  {
    v6 = +[_DASPlistParser sharedInstance];
    v7 = [v6 dictionaryForPlist:2];

    if ([v7 count])
    {
      long long v20 = 0u;
      long long v21 = 0u;
      long long v18 = 0u;
      long long v19 = 0u;
      v8 = [v4 featureCodes];
      id v9 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v9)
      {
        id v10 = v9;
        uint64_t v11 = *(void *)v19;
        do
        {
          for (i = 0; i != v10; i = (char *)i + 1)
          {
            if (*(void *)v19 != v11) {
              objc_enumerationMutation(v8);
            }
            v13 = [*(id *)(*((void *)&v18 + 1) + 8 * i) stringValue];
            v14 = [v7 objectForKeyedSubscript:v13];

            v15 = [v14 objectForKey:@"priority"];
            v16 = v15;
            if (v15) {
              signed int v17 = [v15 intValue];
            }
            else {
              signed int v17 = 999999999;
            }
            if (v3 >= v17) {
              uint64_t v3 = v17;
            }
          }
          id v10 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
        }
        while (v10);
      }
    }
  }
  [v4 setStaticPriority:v3];
}

- (BOOL)validateConfigurationForActivity:(id)a3
{
  id v4 = a3;
  v5 = [(_DASConfigurationLimiter *)self->_configurationLimiter shouldLimitActivityAtSubmission:v4];
  v6 = v5;
  if (v5 && [v5 count])
  {
    [(_DASConfigurationLimiter *)self->_configurationLimiter limitedActivity:v4 withLimitsResponses:v6];
    v7 = [v4 limitationResponse];
    unsigned int v8 = +[_DASLimiterResponse queryActivityDecision:4 fromResponses:v7];

    if (v8)
    {
      uint64_t v9 = [(_DASDaemon *)self testModeParameters];
      if (!v9
        || (id v10 = (void *)v9,
            unsigned __int8 v11 = [(_DASDaemon *)self testModeConstraintsApplyToActivity:v4],
            v10,
            (v11 & 1) == 0))
      {
        v16 = +[_DASDaemonLogger logForCategory:@"ConfigurationLimiter"];
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
          sub_1000FEB58(v4, v16);
        }
        BOOL v14 = 0;
        goto LABEL_17;
      }
      v12 = +[_DASDaemonLogger logForCategory:@"ConfigurationLimiter"];
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
        sub_1000FEC98();
      }
    }
    v13 = [v4 limitationResponse];
    BOOL v14 = 1;
    unsigned int v15 = +[_DASLimiterResponse queryActivityDecision:1 fromResponses:v13];

    if (v15)
    {
      v16 = +[_DASDaemonLogger logForCategory:@"ConfigurationLimiter"];
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        sub_1000FEC0C(v4, v16);
      }
      BOOL v14 = 1;
LABEL_17:
    }
  }
  else
  {
    BOOL v14 = 1;
  }

  return v14;
}

- (BOOL)shouldRunActivityNow:(id)a3
{
  id v4 = a3;
  os_unfair_recursive_lock_lock_with_options();
  v5 = +[NSArray arrayWithObjectsFrom:](NSArray, "arrayWithObjectsFrom:", self->_prerunningTasks, self->_runningTasks, 0);
  os_unfair_recursive_lock_unlock();
  LOBYTE(self) = [(_DASDaemon *)self shouldRunActivityNow:v4 withOtherActivities:v5];

  return (char)self;
}

- (void)addPendingActivity:(id)a3 toGroupWithName:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  os_unfair_lock_lock(&self->_groupLock);
  v7 = [(NSMutableDictionary *)self->_groupToPendingTasks objectForKeyedSubscript:v6];
  if (!v7)
  {
    v7 = +[NSMutableSet set];
    [(NSMutableDictionary *)self->_groupToPendingTasks setObject:v7 forKeyedSubscript:v6];
  }
  [v7 _DAS_addOrReplaceObject:v8];
  os_unfair_lock_unlock(&self->_groupLock);
}

- (void)recordToTaskRegistry:(id)a3 lifeCycleStateName:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 name];
  uint64_t v9 = [v6 serviceName];
  if (!self->_taskRegistryMode || ![(NSSet *)self->_taskRegistryProcesses containsObject:v9]) {
    goto LABEL_29;
  }
  id v10 = +[_DASDaemonLogger logForCategory:@"taskregistry"];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    sub_1000FEF58();
  }

  unsigned __int8 v11 = [(NSUserDefaults *)self->_testingDefaults objectForKey:@"taskRegistry"];
  id v12 = [v11 mutableCopy];

  if (!v12) {
    id v12 = (id)objc_opt_new();
  }
  v13 = objc_opt_new();
  v36 = v9;
  v32 = v8;
  if ([v7 isEqualToString:@"submitted"])
  {
    uint64_t v14 = [v6 submitDate];
  }
  else
  {
    if ([v7 isEqualToString:@"started"])
    {
      uint64_t v34 = [v6 startDate];
      uint64_t v37 = [v6 startConditions];
      unsigned int v15 = [v6 policyResponseMetadata];
      v16 = [v15 objectForKeyedSubscript:@"scoreWhenRun"];
      [v16 score];
      signed int v17 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");

      +[_DASConditionScore thresholdScoreForActivity:v6];
      uint64_t v18 = v34;
      long long v19 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
      [v19 doubleValue];
      uint64_t v21 = v37;
      v22 = +[NSNumber numberWithDouble:v20 * 0.9];
      goto LABEL_15;
    }
    if ([v7 isEqualToString:@"suspended"])
    {
      uint64_t v18 = [v6 suspendRequestDate];
      uint64_t v21 = [(_DASDaemon *)self currentReportingConditions];
      signed int v17 = 0;
      long long v19 = 0;
      v22 = 0;
      goto LABEL_15;
    }
    uint64_t v14 = +[NSDate now];
  }
  uint64_t v18 = v14;
  signed int v17 = 0;
  long long v19 = 0;
  v22 = 0;
  uint64_t v21 = 0;
LABEL_15:
  if (([v7 isEqualToString:@"started"] & 1) != 0
    || [v7 isEqualToString:@"suspended"])
  {
    uint64_t v35 = v18;
    id v23 = v12;
    v24 = v22;
    v25 = v19;
    if ([v6 wasForceRun])
    {
      v26 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v6 wasForceRun]);
      [v13 setValue:v26 forKey:@"wasForceRun"];
    }
    v27 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v6 lastDenialValue]);
    [v13 setValue:v27 forKey:@"lastDenialValue"];

    v28 = [v6 lastScored];
    [v13 setValue:v28 forKey:@"lastScored"];

    [v13 setValue:v21 forKey:@"conditions"];
    long long v19 = v25;
    v22 = v24;
    id v12 = v23;
    uint64_t v18 = v35;
  }
  if (v17) {
    [v13 setValue:v17 forKey:@"scoreWhenRun"];
  }
  if (v19) {
    [v13 setValue:v19 forKey:@"thresholdScore"];
  }
  v33 = v19;
  v38 = (void *)v21;
  if (v22) {
    [v13 setValue:v22 forKey:@"relaxedThresholdScore"];
  }
  [v13 setValue:v18 forKey:@"timestamp"];
  [v13 setValue:v7 forKey:@"state"];
  [v12 objectForKey:v32];
  v30 = v29 = (void *)v18;
  id v31 = [v30 mutableCopy];

  if (!v31) {
    id v31 = (id)objc_opt_new();
  }
  [v31 addObject:v13];
  [v12 setObject:v31 forKey:v32];
  [(NSUserDefaults *)self->_testingDefaults setObject:v12 forKey:@"taskRegistry"];

  id v8 = v32;
  uint64_t v9 = v36;
LABEL_29:
}

- (BOOL)shouldEvaluateTask:(id)a3 atDate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self->_activityToIncompatibleActivitiesMap;
  objc_sync_enter(v8);
  activityToIncompatibleActivitiesMap = self->_activityToIncompatibleActivitiesMap;
  id v10 = [v6 name];
  unsigned __int8 v11 = [(NSMutableDictionary *)activityToIncompatibleActivitiesMap objectForKeyedSubscript:v10];

  id v12 = [v11 count];
  objc_sync_exit(v8);

  if (v12)
  {
    BOOL v13 = 0;
  }
  else if (([v6 hasManyConstraints] & 1) != 0 {
         || ([v6 bypassesPredictions] & 1) != 0)
  }
  {
    BOOL v13 = 1;
  }
  else
  {
    uint64_t v14 = [v6 startBefore];
    [v14 timeIntervalSinceDate:v7];
    BOOL v13 = v15 < 1800.0;
  }
  return v13;
}

- (void)clearActivityFromPrerunning:(id)a3
{
  id v4 = a3;
  os_unfair_recursive_lock_lock_with_options();
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x3032000000;
  double v20 = sub_1000BE040;
  uint64_t v21 = sub_1000BE050;
  id v22 = 0;
  prerunningTasks = self->_prerunningTasks;
  unsigned __int8 v11 = _NSConcreteStackBlock;
  uint64_t v12 = 3221225472;
  BOOL v13 = sub_1000BE058;
  uint64_t v14 = &unk_100177DB0;
  id v6 = v4;
  id v15 = v6;
  v16 = &v17;
  [(NSMutableSet *)prerunningTasks enumerateObjectsUsingBlock:&v11];
  if (v18[5]) {
    -[NSMutableSet removeObject:](self->_prerunningTasks, "removeObject:", v11, v12, v13, v14);
  }
  os_unfair_recursive_lock_unlock();
  p_groupLock = &self->_groupLock;
  os_unfair_lock_lock(&self->_groupLock);
  groupToPrerunningTasks = self->_groupToPrerunningTasks;
  uint64_t v9 = [(id)v18[5] groupName];
  id v10 = [(NSMutableDictionary *)groupToPrerunningTasks objectForKeyedSubscript:v9];
  [v10 removeObject:v18[5]];

  os_unfair_lock_unlock(p_groupLock);
  _Block_object_dispose(&v17, 8);
}

- (BOOL)shouldRunActivityNow:(id)a3 withOtherActivities:(id)a4
{
  id v76 = a3;
  id v73 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_evaluationQueue);
  os_unfair_recursive_lock_lock_with_options();
  v74 = +[NSMutableSet setWithObjectsFrom:](NSMutableSet, "setWithObjectsFrom:", self->_prerunningTasks, self->_runningTasks, 0);
  unsigned int v6 = [v74 containsObject:v76];
  os_unfair_recursive_lock_unlock();
  if (v6)
  {
    id v7 = +[_DASDaemonLogger defaultCategory];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v87 = v76;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%@ is already running. Should not be run again.", buf, 0xCu);
    }
    goto LABEL_15;
  }
  uint64_t v75 = +[NSDate date];
  id v7 = v75;
  if ([(_DASDaemon *)self activityIsTimewiseEligible:v76 atDate:v75])
  {
    id v8 = [v76 lastScored];
    if (!v8)
    {
      if (!+[_DASCheckpointRecorder shouldLogCheckpointForActivity:v76])
      {
LABEL_9:
        uint64_t v9 = [(_DASDaemon *)self pausedParameters];

        if (v9 && [(_DASDaemon *)self pausedParametersApplyToActivity:v76])
        {
          id v10 = +[_DASDaemonLogger defaultCategory];
          if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            id v87 = v76;
            _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Scheduling Paused: Skipping activity: %{public}@", buf, 0xCu);
          }

          goto LABEL_14;
        }
        BOOL v13 = [v76 fastPass];

        if (v13)
        {
          long long v84 = 0u;
          long long v85 = 0u;
          long long v82 = 0u;
          long long v83 = 0u;
          id v14 = v73;
          id v15 = [v14 countByEnumeratingWithState:&v82 objects:v95 count:16];
          if (v15)
          {
            uint64_t v16 = *(void *)v83;
            do
            {
              for (i = 0; i != v15; i = (char *)i + 1)
              {
                if (*(void *)v83 != v16) {
                  objc_enumerationMutation(v14);
                }
                uint64_t v18 = *(void **)(*((void *)&v82 + 1) + 8 * i);
                if ([(_DASDaemon *)self shouldPreemptActivity:v18 forFastPassActivity:v76])
                {
                  uint64_t v19 = +[_DASDaemonLogger defaultCategory];
                  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 138543618;
                    id v87 = v18;
                    __int16 v88 = 2114;
                    double v89 = *(double *)&v76;
                    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Preempting %{public}@ to unblock the associated fast pass %{public}@", buf, 0x16u);
                  }

                  [(_DASDaemon *)self updateSuspendRequestDate:v75 forActivity:v18 withReason:@"Preemption"];
                  [(_DASDaemon *)self suspendActivity:v18];
                }
              }
              id v15 = [v14 countByEnumeratingWithState:&v82 objects:v95 count:16];
            }
            while (v15);
          }
        }
        uint64_t v81 = 0;
        +[_DASConditionScore scoreForActivity:v76 withState:self->_context response:&v81];
        double v21 = v20;
        if (v20 <= 0.0)
        {
          id v22 = +[_DASPolicyDataCollection sharedInstance];
          unsigned int v23 = [v22 shouldReportBlockingReasonsForActivity:v76];

          if (v23)
          {
            v24 = +[_DASPolicyDataCollection sharedInstance];
            [v24 reportBlockingReason:[v76 lastDenialValue] forActivity:v76];
          }
        }
        v25 = [(_DASDaemon *)self testModeParameters];

        if (v25
          && (v81 == 100 || v81 == 33)
          && [(_DASDaemon *)self testModeConstraintsApplyToActivity:v76])
        {
          v26 = +[NSMutableArray array];
          v27 = +[NSMutableArray array];
          v28 = [v76 policyScores];
          unsigned int v29 = [(_DASDaemon *)self testModeConstraintsRequireOverridingDecisionWithScores:v28 ignoredPolicies:v26 honoredPolicies:v27];

          if (v26) {
            [(_DASDaemon *)self activity:v76 runWithoutHonoringPolicies:v26];
          }
          if (v27) {
            [(_DASDaemon *)self activity:v76 blockedOnPolicies:v27];
          }
          if (v29)
          {
            v30 = +[_DASDaemonLogger defaultCategory];
            if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              id v87 = v76;
              _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "Test Mode: Proceeding with activity: %@", buf, 0xCu);
            }

            goto LABEL_87;
          }
        }
        [(_DASDaemon *)self reportActivity:v76 isBlockedWithDecision:v81];
        if (_os_feature_enabled_impl()
          && +[_DASPhotosPolicy isPhotosSyncActivity:v76]
          && !+[_DASPhotosPolicy shouldOverrideForIntentSync:self->_photosIsBlocked activity:v76]&& [(_DASRemoteDeviceActivityMonitor *)self->_remoteDeviceActivityMonitor isRegistered]&& [(_DASRemoteDeviceActivityMonitor *)self->_remoteDeviceActivityMonitor pendingUnregistration])
        {
          [(_DASRemoteDeviceActivityMonitor *)self->_remoteDeviceActivityMonitor unregisterForRemoteDeviceActiveNotifications];
        }
        BOOL v11 = 0;
        if (v81 == 33) {
          goto LABEL_88;
        }
        id v7 = v75;
        if (v81 == 100) {
          goto LABEL_16;
        }
        if (v81 == 67)
        {
          BOOL v11 = 1;
          goto LABEL_16;
        }
        id v31 = [v76 schedulingPriority];
        if ((unint64_t)v31 >= _DASSchedulingPriorityUserInitiated)
        {
          int v33 = 0;
        }
        else
        {
          long long v79 = 0u;
          long long v80 = 0u;
          long long v77 = 0u;
          long long v78 = 0u;
          id v32 = v73;
          int v33 = 0;
          id v34 = [v32 countByEnumeratingWithState:&v77 objects:v94 count:16];
          if (v34)
          {
            uint64_t v35 = *(void *)v78;
            while (2)
            {
              for (j = 0; j != v34; j = (char *)j + 1)
              {
                if (*(void *)v78 != v35) {
                  objc_enumerationMutation(v32);
                }
                uint64_t v37 = *(void **)(*((void *)&v77 + 1) + 8 * (void)j);
                [v76 compatibilityWith:v37];
                double v40 = v39;
                if (+[_DASPhotosPolicy isiCPLActivity:v76])
                {
                  if (+[_DASPhotosPolicy isiCPLActivity:v37])
                  {
                    id v41 = [v76 transferSizeType];
                    id v42 = [v37 transferSizeType];
                    if ((unint64_t)v41 >= 0xB && (unint64_t)v42 > 0xA)
                    {
                      double v40 = -1.0;
LABEL_90:
                      v55 = +[_DASDaemonLogger logForCategory:@"scoring"];
                      if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
                      {
                        uint64_t v56 = [v37 startDate];
                        v57 = (void *)v56;
                        CFStringRef v58 = @"<Not yet started>";
                        *(_DWORD *)buf = 138544130;
                        if (v56) {
                          CFStringRef v58 = (const __CFString *)v56;
                        }
                        id v87 = v76;
                        __int16 v88 = 2048;
                        double v89 = v40;
                        __int16 v90 = 2114;
                        double v91 = *(double *)&v37;
                        __int16 v92 = 2112;
                        CFStringRef v93 = v58;
                        _os_log_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_DEFAULT, "'%{public}@' has compatibility score of %lf with %{public}@ (Started at %@). Bailing out.", buf, 0x2Au);
                      }
                      v59 = +[_DASPolicyDataCollection sharedInstance];
                      unsigned int v60 = [v59 shouldReportBlockingReasonsForActivity:v76];

                      if (v60)
                      {
                        v61 = +[_DASPolicyDataCollection sharedInstance];
                        [v61 reportBlockingReason:+[_DASPolicyManager bitmaskForPolicy:](_DASPolicyManager, "bitmaskForPolicy:", @"Incompatibility") forActivity:v76];
                      }
                      v62 = self->_activityToIncompatibleActivitiesMap;
                      objc_sync_enter(v62);
                      activityToIncompatibleActivitiesMap = self->_activityToIncompatibleActivitiesMap;
                      v64 = [v37 name];
                      v65 = [(NSMutableDictionary *)activityToIncompatibleActivitiesMap objectForKeyedSubscript:v64];

                      if (v65)
                      {
                        [v65 _DAS_addOrReplaceObject:v76];
                      }
                      else
                      {
                        v66 = +[NSMutableSet setWithObject:v76];
                        v67 = self->_activityToIncompatibleActivitiesMap;
                        v68 = [v37 name];
                        [(NSMutableDictionary *)v67 setObject:v66 forKeyedSubscript:v68];
                      }
                      objc_sync_exit(v62);

                      v69 = [v37 startDate];
                      v70 = +[NSDate now];
                      unsigned int v71 = [(_DASDaemon *)self shouldSuspendLongRunningActivity:v37 withStartDate:v69 whileBlockingOtherTasks:1 atDate:v70];

                      if (v71)
                      {
                        v72 = +[_DASDaemonLogger logForCategory:@"runtimeLimiter"];
                        if (os_log_type_enabled(v72, OS_LOG_TYPE_DEFAULT))
                        {
                          *(_DWORD *)buf = 138543362;
                          id v87 = v37;
                          _os_log_impl((void *)&_mh_execute_header, v72, OS_LOG_TYPE_DEFAULT, "Another intensive activity! Found long running activity %{public}@ to suspend", buf, 0xCu);
                        }

                        [(_DASDaemon *)self updateSuspendRequestDate:v75 forActivity:v37 withReason:@"Limitations"];
                        [(_DASDaemon *)self suspendActivity:v37];
                      }

                      goto LABEL_14;
                    }
                  }
                }
                if (v40 < 0.0) {
                  goto LABEL_90;
                }
                if (!v33 && v40 > 0.0)
                {
                  v43 = +[_DASDaemonLogger logForCategory:@"scoring"];
                  if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 138543874;
                    id v87 = v76;
                    __int16 v88 = 2048;
                    double v89 = v40;
                    __int16 v90 = 2114;
                    double v91 = *(double *)&v37;
                    _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_DEFAULT, "'%{public}@' has compatibility score of %lf with '%{public}@'. Relaxing scores.", buf, 0x20u);
                  }

                  int v33 = 1;
                }
              }
              id v34 = [v32 countByEnumeratingWithState:&v77 objects:v94 count:16];
              if (v34) {
                continue;
              }
              break;
            }
          }
        }
        +[_DASConditionScore thresholdScoreForActivity:v76];
        if (v33) {
          double v45 = v44 * 0.9;
        }
        else {
          double v45 = v44;
        }
        unsigned int v46 = [v76 bypassesPredictions];
        v47 = +[_DASDaemonLogger logForCategory:@"scoring"];
        BOOL v48 = os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT);
        if (v46)
        {
          if (v48)
          {
            *(_DWORD *)buf = 138543618;
            id v87 = v76;
            __int16 v88 = 1024;
            LODWORD(v89) = v21 > v45;
            v49 = "'%{public}@' DecisionToRun: %d (Bypasses Predictions)";
            v50 = v47;
            uint32_t v51 = 18;
LABEL_84:
            _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_DEFAULT, v49, buf, v51);
          }
        }
        else if (v48)
        {
          *(_DWORD *)buf = 138544130;
          id v87 = v76;
          __int16 v88 = 2048;
          double v89 = v21;
          __int16 v90 = 2048;
          double v91 = v45;
          __int16 v92 = 1024;
          LODWORD(v93) = v21 > v45;
          v49 = "'%{public}@' CurrentScore: %lf, ThresholdScore: %lf DecisionToRun:%d";
          v50 = v47;
          uint32_t v51 = 38;
          goto LABEL_84;
        }

        if (v21 <= v45)
        {
LABEL_14:
          BOOL v11 = 0;
LABEL_88:
          id v7 = v75;
          goto LABEL_16;
        }
        id v52 = v76;
        objc_sync_enter(v52);
        v53 = +[_DASInternalPolicyEvaluationMetadata metadataWithScore:v21];
        v54 = [v52 policyResponseMetadata];
        [v54 setObject:v53 forKeyedSubscript:@"scoreWhenRun"];

        objc_sync_exit(v52);
LABEL_87:
        BOOL v11 = 1;
        goto LABEL_88;
      }
      id v8 = +[_DASCheckpointRecorder sharedInstance];
      [v8 reportTaskCheckpoint:15 forTask:v76 error:0];
    }

    goto LABEL_9;
  }
LABEL_15:
  BOOL v11 = 0;
LABEL_16:

  return v11;
}

- (void)activityStartedWithParameters:(id)a3
{
  id v5 = a3;
  id v4 = [v5 objectForKeyedSubscript:kBGSTKeyFeatureCode];

  if (v4) {
    [(_DASDaemon *)self reportPostRestoreCheckpoint:20 withParameters:v5];
  }
  [(_DASBudgetManager *)self->_budgetManager reportActivityRunningWithParameters:v5];
}

- (BOOL)pausedParametersApplyToActivity:(id)a3
{
  id v4 = a3;
  id v5 = [(_DASDaemon *)self pausedParameters];

  if (!v5)
  {
    BOOL v11 = 0;
    goto LABEL_82;
  }
  unsigned int v6 = [(_DASDaemon *)self pausedParameters];
  id v7 = [v6 objectForKeyedSubscript:@"validUntil"];
  [v7 doubleValue];
  id v8 = +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:");

  [v8 timeIntervalSinceNow];
  if (v9 < 0.0)
  {
    id v10 = +[_DASDaemonLogger defaultCategory];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "No longer pausing activities!", buf, 2u);
    }

    [(NSUserDefaults *)self->_testingDefaults removeObjectForKey:@"pausedParameters"];
    [(_DASDaemon *)self setPausedParameters:0];
    BOOL v11 = 0;
    goto LABEL_81;
  }
  uint64_t v12 = [(_DASDaemon *)self pausedParameters];
  BOOL v13 = [v12 objectForKeyedSubscript:@"activities"];

  id v14 = [v4 name];
  unsigned int v15 = [v13 containsObject:v14];

  if (v15)
  {
    uint64_t v16 = +[_DASDaemonLogger defaultCategory];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v75 = v4;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Scheduling paused for activity: %@", buf, 0xCu);
    }
    BOOL v11 = 1;
    goto LABEL_80;
  }
  uint64_t v56 = v13;
  uint64_t v17 = [(_DASDaemon *)self pausedParameters];
  uint64_t v18 = [v17 objectForKeyedSubscript:@"anyTypes"];

  uint64_t v19 = [(_DASDaemon *)self pausedParameters];
  double v20 = [v19 objectForKeyedSubscript:@"allTypes"];

  double v21 = [(_DASDaemon *)self pausedParameters];
  v57 = [v21 objectForKeyedSubscript:@"exceptTypes"];

  long long v69 = 0u;
  long long v70 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  uint64_t v16 = v18;
  id v22 = [v16 countByEnumeratingWithState:&v67 objects:v73 count:16];
  CFStringRef v58 = v20;
  if (v22)
  {
    id v23 = v22;
    uint64_t v24 = *(void *)v68;
    do
    {
      for (i = 0; i != v23; i = (char *)i + 1)
      {
        if (*(void *)v68 != v24) {
          objc_enumerationMutation(v16);
        }
        v26 = *(void **)(*((void *)&v67 + 1) + 8 * i);
        if (![v26 isEqualToString:@"network"]
          || ([v4 requiresNetwork] & 1) == 0)
        {
          if (![v26 isEqualToString:@"userinitiated"]
            || (id v27 = [v4 schedulingPriority],
                (unint64_t)v27 > _DASSchedulingPriorityUserInitiatedOvercommit))
          {
            if (![v26 isEqualToString:@"utility"]
              || (id v28 = [v4 schedulingPriority], (unint64_t)v28 > _DASSchedulingPriorityDefault))
            {
              if (![v26 isEqualToString:@"maintenance"]
                || (id v29 = [v4 schedulingPriority],
                    (unint64_t)v29 > _DASSchedulingPriorityMaintenance))
              {
                if (![v26 isEqualToString:@"background"]
                  || (id v30 = [v4 schedulingPriority],
                      (unint64_t)v30 > _DASSchedulingPriorityBackground))
                {
                  if ((![v26 isEqualToString:@"intensive"]
                     || ([v4 isIntensive] & 1) == 0)
                    && (![v26 isEqualToString:@"icpl"]
                     || !+[_DASPhotosPolicy isiCPLActivity:v4])
                    && (![v26 isEqualToString:@"plugin"]
                     || ([v4 requiresPlugin] & 1) == 0)
                    && (![v26 isEqualToString:@"inactivity"]
                     || ([v4 requiresDeviceInactivity] & 1) == 0))
                  {
                    if (![v26 isEqualToString:@"fastpass"]) {
                      continue;
                    }
                    id v31 = [v4 fastPass];

                    if (!v31) {
                      continue;
                    }
                  }
                }
              }
            }
          }
        }

        BOOL v11 = 1;
LABEL_78:
        v43 = v57;
        double v20 = v58;
        goto LABEL_79;
      }
      id v23 = [v16 countByEnumeratingWithState:&v67 objects:v73 count:16];
      double v20 = v58;
    }
    while (v23);
  }

  long long v65 = 0u;
  long long v66 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  id v32 = v20;
  id v33 = [v32 countByEnumeratingWithState:&v63 objects:v72 count:16];
  if (!v33) {
    goto LABEL_65;
  }
  id v34 = v33;
  uint64_t v35 = *(void *)v64;
  do
  {
    for (j = 0; j != v34; j = (char *)j + 1)
    {
      if (*(void *)v64 != v35) {
        objc_enumerationMutation(v32);
      }
      uint64_t v37 = *(void **)(*((void *)&v63 + 1) + 8 * (void)j);
      if (![v37 isEqualToString:@"network"]
        || [v4 requiresNetwork])
      {
        if (![v37 isEqualToString:@"userinitiated"]
          || (id v38 = [v4 schedulingPriority],
              (unint64_t)v38 <= _DASSchedulingPriorityUserInitiatedOvercommit))
        {
          if (![v37 isEqualToString:@"utility"]
            || (id v39 = [v4 schedulingPriority], (unint64_t)v39 <= _DASSchedulingPriorityDefault))
          {
            if (![v37 isEqualToString:@"maintenance"]
              || (id v40 = [v4 schedulingPriority],
                  (unint64_t)v40 <= _DASSchedulingPriorityMaintenance))
            {
              if (![v37 isEqualToString:@"background"]
                || (id v41 = [v4 schedulingPriority],
                    (unint64_t)v41 <= _DASSchedulingPriorityBackground))
              {
                if ((![v37 isEqualToString:@"intensive"]
                   || [v4 isIntensive])
                  && (![v37 isEqualToString:@"icpl"]
                   || !+[_DASPhotosPolicy isiCPLActivity:v4])
                  && (![v37 isEqualToString:@"plugin"]
                   || [v4 requiresPlugin])
                  && (![v37 isEqualToString:@"inactivity"]
                   || [v4 requiresDeviceInactivity]))
                {
                  if (![v37 isEqualToString:@"fastpass"]) {
                    continue;
                  }
                  id v42 = [v4 fastPass];

                  if (v42) {
                    continue;
                  }
                }
              }
            }
          }
        }
      }

      BOOL v11 = 0;
      goto LABEL_78;
    }
    id v34 = [v32 countByEnumeratingWithState:&v63 objects:v72 count:16];
    double v20 = v58;
  }
  while (v34);
LABEL_65:

  v43 = v57;
  if (![v57 count])
  {
    BOOL v11 = [v32 count] != 0;
    goto LABEL_79;
  }
  long long v61 = 0u;
  long long v62 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  id v44 = v57;
  id v45 = [v44 countByEnumeratingWithState:&v59 objects:v71 count:16];
  if (!v45)
  {
    BOOL v11 = 1;
    goto LABEL_91;
  }
  id v46 = v45;
  uint64_t v47 = *(void *)v60;
  while (2)
  {
    uint64_t v48 = 0;
    while (2)
    {
      if (*(void *)v60 != v47) {
        objc_enumerationMutation(v44);
      }
      uint64_t v49 = *(void *)(*((void *)&v59 + 1) + 8 * v48);
      v50 = [v4 activityType];
      unsigned int v51 = [v50 isEqualToString:v49];

      if (v51)
      {
        v55 = +[_DASDaemonLogger defaultCategory];
        if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v75 = v4;
LABEL_89:
          _os_log_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_DEFAULT, "Not pausing for: %@", buf, 0xCu);
        }
LABEL_90:
        v43 = v57;

        BOOL v11 = 0;
        goto LABEL_91;
      }
      id v52 = [v4 name];
      unsigned int v53 = [v52 containsString:v49];

      if (v53)
      {
        v55 = +[_DASDaemonLogger defaultCategory];
        if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v75 = v4;
          goto LABEL_89;
        }
        goto LABEL_90;
      }
      if (v46 != (id)++v48) {
        continue;
      }
      break;
    }
    id v46 = [v44 countByEnumeratingWithState:&v59 objects:v71 count:16];
    BOOL v11 = 1;
    v43 = v57;
    if (v46) {
      continue;
    }
    break;
  }
LABEL_91:

  double v20 = v58;
LABEL_79:

  BOOL v13 = v56;
LABEL_80:

LABEL_81:
LABEL_82:

  return v11;
}

- (NSDictionary)pausedParameters
{
  return (NSDictionary *)objc_getProperty(self, a2, 568, 1);
}

- (void)submitActivity:(id)a3 inGroup:(id)a4 withHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void, void *))a5;
  v105 = (void *)os_transaction_create();
  v104 = v9;
  if (![(_DASDaemon *)self validateConfigurationForActivity:v8])
  {
    uint64_t v17 = +[NSError errorWithDomain:_DASActivitySchedulerErrorDomain code:3 userInfo:&off_100187BB8];
    v10[2](v10, 0, v17);

    goto LABEL_92;
  }
  if (v9)
  {
    [(_DASDaemon *)self createActivityGroup:v9];
    BOOL v11 = [v9 name];
    [v8 setGroupName:v11];
  }
  if (![(_DASRuntimeLimiter *)self->_runtimeLimiter featureHasNoRemainingRuntimeForActivity:v8])
  {
    uint64_t v18 = self;
    objc_sync_enter(v18);
    [(_DASActivityRateLimitManager *)v18->_rateLimiter submitActivity:v8];
    [v8 interval];
    if (v19 <= 0.0)
    {
      if (+[_DASConfig isInternalBuild])
      {
        double v20 = +[_DASDaemonLogger defaultCategory];
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
LABEL_16:
          double v21 = [v8 debugDescription];
          *(_DWORD *)buf = 138412290;
          *(void *)&uint8_t buf[4] = v21;
          _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Submitted: %@", buf, 0xCu);
        }
      }
      else
      {
        double v20 = +[_DASDaemonLogger defaultCategory];
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          id v27 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v8 schedulingPriority]);
          id v28 = [v8 startAfter];
          id v29 = [v8 startBefore];
          *(_DWORD *)buf = 138544130;
          *(void *)&uint8_t buf[4] = v8;
          *(_WORD *)&buf[12] = 2114;
          *(void *)&buf[14] = v27;
          *(_WORD *)&buf[22] = 2114;
          v121 = v28;
          *(_WORD *)v122 = 2114;
          *(void *)&v122[2] = v29;
          _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Submitted: %{public}@ at priority %{public}@ (%{public}@ - %{public}@)", buf, 0x2Au);
        }
      }
    }
    else
    {
      if (+[_DASConfig isInternalBuild])
      {
        double v20 = +[_DASDaemonLogger defaultCategory];
        if (!os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_24;
        }
        goto LABEL_16;
      }
      double v20 = +[_DASDaemonLogger defaultCategory];
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        id v22 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v8 schedulingPriority]);
        [v8 interval];
        uint64_t v24 = v23;
        v25 = [v8 startAfter];
        v26 = [v8 startBefore];
        *(_DWORD *)buf = 138544386;
        *(void *)&uint8_t buf[4] = v8;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v22;
        *(_WORD *)&buf[22] = 2048;
        v121 = v24;
        *(_WORD *)v122 = 2114;
        *(void *)&v122[2] = v25;
        *(_WORD *)&v122[10] = 2114;
        *(void *)&v122[12] = v26;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Submitted: %{public}@ at priority %{public}@ with interval %.0f (%{public}@ - %{public}@)", buf, 0x34u);
      }
    }
LABEL_24:

    +[_DASMetricRecorder incrementOccurrencesForKey:@"com.apple.das.submitcount.all" byCount:1];
    v103 = +[NSDate date];
    id v30 = [v8 submitDate];
    BOOL v31 = v30 == 0;

    if (v31) {
      [v8 setSubmitDate:v103];
    }
    if (+[_DASCheckpointRecorder shouldLogCheckpointForActivity:v8])
    {
      id v32 = +[_DASCheckpointRecorder sharedInstance];
      [v32 reportTaskCheckpoint:10 forTask:v8 error:0];
    }
    id v33 = [v8 featureCodes];
    if (v33)
    {
    }
    else
    {
      id v34 = [v8 fastPass];
      BOOL v35 = v34 == 0;

      if (v35) {
        goto LABEL_32;
      }
    }
    v36 = +[_DASCheckpointRecorder sharedInstance];
    uint64_t v37 = [v8 name];
    id v38 = [v8 featureCodes];
    id v39 = [v8 fastPass];
    [v36 addFeatureCodesForTask:v37 featureCodes:v38 semanticVersion:[v39 semanticVersion]];

LABEL_32:
    id v40 = [v8 producedResultIdentifiers];
    if (v40)
    {
    }
    else
    {
      id v41 = [v8 dependencies];
      BOOL v42 = v41 == 0;

      if (v42) {
        goto LABEL_43;
      }
    }
    v43 = +[NSMutableSet set];
    long long v117 = 0u;
    long long v118 = 0u;
    long long v116 = 0u;
    long long v115 = 0u;
    id v44 = [v8 dependencies];
    id v45 = [v44 countByEnumeratingWithState:&v115 objects:v119 count:16];
    if (v45)
    {
      uint64_t v46 = *(void *)v116;
      do
      {
        for (i = 0; i != v45; i = (char *)i + 1)
        {
          if (*(void *)v116 != v46) {
            objc_enumerationMutation(v44);
          }
          uint64_t v48 = [*(id *)(*((void *)&v115 + 1) + 8 * i) identifier];
          [v43 addObject:v48];
        }
        id v45 = [v44 countByEnumeratingWithState:&v115 objects:v119 count:16];
      }
      while (v45);
    }

    uint64_t v49 = +[_DASCheckpointRecorder sharedInstance];
    v50 = [v8 name];
    unsigned int v51 = [v8 producedResultIdentifiers];
    [v49 addDependencyInfoForTask:v50 producedResultIdentifiers:v51 dependencyIdentifiers:v43];

LABEL_43:
    [(_DASRuntimeLimiter *)self->_runtimeLimiter maximumRuntimeForActivity:v8];
    [v8 setMaximumRuntime:(uint64_t)v52];
    [(_DASDaemon *)v18 computeStaticPriorityForActivity:v8];
    [(_DASDaemon *)v18 clearActivityFromPrerunning:v8];
    +[_DASConditionScore setActivityShouldBypassPredictions:v8];
    if ([v8 requestsApplicationLaunch])
    {
      unsigned int v53 = [v8 launchReason];
      unsigned int v54 = [v53 isEqualToString:_DASLaunchReasonBackgroundRemoteNotification];

      if (v54)
      {
        unsigned int v55 = [v8 isSilentPush];
        +[_DASMetricRecorder incrementOccurrencesForKey:@"com.apple.das.push.count" byCount:1];
        id v56 = [v8 schedulingPriority];
        if ((unint64_t)v56 >= _DASSchedulingPriorityBackground)
        {
          +[_DASMetricRecorder incrementOccurrencesForKey:@"com.apple.das.highprioritypush" byCount:1];
          if (v55)
          {
            +[_DASMetricRecorder incrementOccurrencesForKey:@"com.apple.das.silentpush.highprioritycount" byCount:1];
            +[_DASMetricRecorder incrementOccurrencesForKey:@"com.apple.das.silentpush.count" byCount:1];
            v57 = +[_DASDaemonLogger logForCategory:@"bar"];
            if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
            {
              CFStringRef v58 = [v8 relatedApplications];
              long long v59 = [v58 firstObject];
              sub_1000FF090(v59, (uint64_t)buf, v57, v58);
            }

            long long v60 = +[NSSet setWithObject:v8];
            [(_DASDaemon *)v18 cancelActivities:v60];

            long long v61 = +[NSError errorWithDomain:_DASActivitySchedulerErrorDomain code:3 userInfo:&off_100187BE0];
            v10[2](v10, 0, v61);

            goto LABEL_91;
          }
        }
        else
        {
          +[_DASMetricRecorder incrementOccurrencesForKey:@"com.apple.das.lowprioritypush" byCount:1];
          if (v55) {
            +[_DASMetricRecorder incrementOccurrencesForKey:@"com.apple.das.silentpush.count" byCount:1];
          }
        }
        buf[0] = 0;
        barScheduler = v18->_barScheduler;
        long long v63 = [v8 relatedApplications];
        long long v64 = [v63 firstObject];
        unsigned int v65 = [(_DASBARScheduler *)barScheduler pushLaunchAllowedForApp:v64 immediately:buf];

        if (buf[0]) {
          unsigned int v66 = v65;
        }
        else {
          unsigned int v66 = 0;
        }
        if (v66 == 1)
        {
          v10[2](v10, 1, 0);
          [(_DASDaemon *)v18 addLaunchRequest:v8];
          [(_DASDaemon *)v18 immediatelyBeginWorkForActivity:v8];
          goto LABEL_91;
        }
        id v67 = [v8 schedulingPriority];
        if (v67 == (id)_DASSchedulingPriorityMaintenance) {
          [(_DASBlueListManager *)v18->_blueListManager decrementPushBudgetRemaining];
        }
        if (((v65 | v55 ^ 1) & 1) == 0) {
          +[_DASMetricRecorder recordOccurrenceForKey:@"com.apple.das.silentpush.pushnotallowedcount"];
        }
        long long v68 = v18->_barScheduler;
        long long v69 = [v8 relatedApplications];
        long long v70 = [v69 firstObject];
        LODWORD(v68) = [(_DASBARScheduler *)v68 isNewsstandApp:v70];

        if (v68) {
          [v8 setRequestsNewsstandLaunch:1];
        }
      }
    }
    if (([v8 requestsApplicationLaunch] & 1) != 0
      || [v8 requestsExtensionLaunch])
    {
      if (![(_DASDaemon *)v18 addLaunchRequest:v8])
      {
        v97 = +[_DASDaemonLogger logForCategory:@"bar"];
        if (os_log_type_enabled(v97, OS_LOG_TYPE_ERROR))
        {
          v98 = [v8 relatedApplications];
          v99 = [v98 firstObject];
          sub_1000FF038(v99, (uint64_t)buf, v97, v98);
        }

        v100 = +[NSSet setWithObject:v8];
        [(_DASDaemon *)v18 cancelActivities:v100];

        v101 = +[NSError errorWithDomain:_DASActivitySchedulerErrorDomain code:5 userInfo:&off_100187C08];
        v10[2](v10, 0, v101);

        goto LABEL_91;
      }
      if ([v8 requestsApplicationLaunch])
      {
        +[_DASMetricRecorder incrementOccurrencesForKey:@"com.apple.das.submitcount.launch" byCount:1];
        unsigned int v71 = [v8 relatedApplications];
        id v72 = [v71 count];

        if (v72) {
          [(_DASDaemon *)v18 advanceAppLaunchDateIfNecessaryForActivity:v8];
        }
      }
      if ([v8 shouldBePersisted]) {
        [(_DASDataStore *)v18->_store saveActivity:v8];
      }
    }
    if ([v8 userRequestedBackupTask]) {
      [(_DASUserRequestedBackupTaskManager *)v18->_backupTaskManager activitySubmitted:v8];
    }
    [(_DASActivityDependencyManager *)v18->_dependencyManager beginDependencyMonitoringForActivity:v8];
    id v73 = [v8 remoteDevice];
    if (v73)
    {
      BOOL v74 = [v8 targetDevice] == (id)3;

      if (v74) {
        [(_DASRemoteDeviceNearbyMonitor *)v18->_remoteDeviceNearbyMonitor registerForRemoteDeviceWithActivity:v8];
      }
    }
    id v75 = [v8 remoteDevice];
    if (v75)
    {
      unsigned int v76 = [v8 requiresRemoteDeviceWake];

      if (v76) {
        [(_DASRemoteDeviceWakeMonitor *)v18->_remoteDeviceWakeMonitor registerRemoteDeviceWakeStateWithActivity:v8];
      }
    }
    long long v77 = [v8 diskVolume];

    if (v77) {
      [(_DASDiskSpaceMonitor *)v18->_diskSpaceMonitor registerForPurgeableSpaceWithActivity:v8];
    }
    if ([(_DASNetworkEvaluationMonitor *)v18->_networkEvaluationMonitor requiresNetworkPathMonitoring:v8])
    {
      +[_DASMetricRecorder incrementOccurrencesForKey:@"com.apple.das.submitcount.network" byCount:1];
      networkEvaluationMonitor = v18->_networkEvaluationMonitor;
      long long v79 = [v8 uuid];
      long long v80 = +[_DASNetworkEvaluationMonitor nwParametersForActivity:v8];
      uint64_t v81 = [v8 userInfo];
      long long v82 = [v81 objectForKeyedSubscript:kNWEndpointKey];
      [(_DASNetworkEvaluationMonitor *)networkEvaluationMonitor startMonitoringActivity:v79 withNetworkParameters:v80 withEndpoint:v82];
    }
    [(_DASDaemon *)v18 recordToTaskRegistry:v8 lifeCycleStateName:@"submitted"];
    v10[2](v10, 1, 0);
    evaluationQueue = v18->_evaluationQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100004A44;
    block[3] = &unk_100175548;
    id v84 = v8;
    id v112 = v84;
    v113 = v18;
    id v85 = v103;
    id v114 = v85;
    dispatch_async(evaluationQueue, block);
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    v121 = sub_1000BE040;
    *(void *)v122 = sub_1000BE050;
    *(void *)&v122[8] = 0;
    timerSchedulingQueue = v18->_timerSchedulingQueue;
    v106[0] = _NSConcreteStackBlock;
    v106[1] = 3221225472;
    v106[2] = sub_100008A60;
    v106[3] = &unk_100177E88;
    id v87 = v85;
    id v107 = v87;
    id v88 = v84;
    id v108 = v88;
    v109 = v18;
    v110 = buf;
    dispatch_sync(timerSchedulingQueue, v106);
    if (*(void *)(*(void *)&buf[8] + 40))
    {
      double v89 = +[_DASDaemonLogger defaultCategory];
      if (os_log_type_enabled(v89, OS_LOG_TYPE_DEBUG)) {
        sub_1000FEFD0();
      }

      __int16 v90 = [v88 name];
      [*(id *)(*(void *)&buf[8] + 40) timeIntervalSinceDate:v87];
      double v92 = v91;
      CFStringRef v93 = [v88 startBefore];
      [v93 timeIntervalSinceDate:v87];
      double v95 = v94;
      id v96 = [v88 schedulingPriority];
      [(_DASDaemon *)v18 scheduleTimerOnBehalfOf:v90 between:(unint64_t)v96 > _DASSchedulingPriorityUtility and:v92 waking:v95];
    }
    _Block_object_dispose(buf, 8);

LABEL_91:
    objc_sync_exit(v18);

    goto LABEL_92;
  }
  CFStringRef v123 = @"exhaustedRuntimeFeatureCodes";
  uint64_t v12 = [(_DASRuntimeLimiter *)self->_runtimeLimiter exhaustedRuntimeFeatureCodesAssociatedWithActivity:v8];
  BOOL v13 = v12;
  if (!v12)
  {
    BOOL v13 = +[NSNull null];
  }
  v124 = v13;
  id v14 = +[NSDictionary dictionaryWithObjects:&v124 forKeys:&v123 count:1];
  unsigned int v15 = +[NSError errorWithDomain:_DASActivitySchedulerErrorDomain code:7 userInfo:v14];

  if (!v12) {
  uint64_t v16 = +[_DASDaemonLogger logForCategory:@"featureDurationTracker"];
  }
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    *(void *)&uint8_t buf[4] = v8;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v15;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Rejecting submission of %@ with error: %@!", buf, 0x16u);
  }

  v10[2](v10, 0, v15);
LABEL_92:
}

- (void)addTriggersToActivity:(id)a3
{
  id v27 = self;
  id v3 = a3;
  id v4 = +[NSMutableSet set];
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id obj = +[_DASPolicyManager allPoliciesForPlatform];
  id v5 = [obj countByEnumeratingWithState:&v39 objects:v44 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v40;
    CFStringRef v8 = @"com.apple.das.fileprotectionpolicy.statuschanged";
    uint64_t v28 = *(void *)v40;
    do
    {
      id v9 = 0;
      id v29 = v6;
      do
      {
        if (*(void *)v40 != v7) {
          objc_enumerationMutation(obj);
        }
        id v10 = *(void **)(*((void *)&v39 + 1) + 8 * (void)v9);
        if (objc_msgSend(v10, "appliesToActivity:", v3, v27))
        {
          BOOL v31 = v9;
          [v10 triggers];
          BOOL v11 = &AnalyticsSendEvent_ptr;
          id v34 = (id)objc_claimAutoreleasedReturnValue();
          if (v34)
          {
            long long v37 = 0u;
            long long v38 = 0u;
            long long v35 = 0u;
            long long v36 = 0u;
            id v12 = [v34 countByEnumeratingWithState:&v35 objects:v43 count:16];
            if (v12)
            {
              id v13 = v12;
              uint64_t v14 = *(void *)v36;
              uint64_t v32 = *(void *)v36;
              do
              {
                unsigned int v15 = 0;
                id v33 = v13;
                do
                {
                  if (*(void *)v36 != v14) {
                    objc_enumerationMutation(v34);
                  }
                  uint64_t v16 = [*(id *)(*((void *)&v35 + 1) + 8 * (void)v15) objectForKeyedSubscript:@"identifier"];
                  uint64_t v17 = v16;
                  if (v16)
                  {
                    if (![v16 isEqualToString:v8]) {
                      goto LABEL_35;
                    }
                    uint64_t v18 = [v3 fileProtection];
                    double v19 = [v11[469] none];
                    if ([v18 isEqual:v19])
                    {

                      uint64_t v14 = v32;
                      id v13 = v33;
                      goto LABEL_25;
                    }
                    double v20 = [v3 fileProtection];
                    [v11[469] completeUntilFirstUserAuthentication];
                    CFStringRef v21 = v8;
                    id v22 = v3;
                    v24 = id v23 = v4;
                    unsigned __int8 v25 = [v20 isEqual:v24];

                    id v4 = v23;
                    id v3 = v22;
                    CFStringRef v8 = v21;
                    BOOL v11 = &AnalyticsSendEvent_ptr;

                    uint64_t v14 = v32;
                    id v13 = v33;
                    if ((v25 & 1) == 0)
                    {
LABEL_35:
                      if (([v17 isEqualToString:@"com.apple.duetactivityscheduler.cpuusagepolicy.cpuusagelevelchange"] & 1) == 0&& !objc_msgSend(v17, "isEqualToString:", @"com.apple.duetactivityscheduler.thermalpolicypolicy.thermalpressurechange")|| (objc_msgSend(v3, "bypassesPredictions") & 1) != 0|| (id v26 = objc_msgSend(v3, "schedulingPriority"), (unint64_t)v26 >= _DASSchedulingPriorityUtility)|| (objc_msgSend(v3, "isIntensive") & 1) != 0|| objc_msgSend(v3, "triggersRestart"))
                      {
                        [v4 addObject:v17];
                      }
                    }
                  }
LABEL_25:

                  unsigned int v15 = (char *)v15 + 1;
                }
                while (v13 != v15);
                id v13 = [v34 countByEnumeratingWithState:&v35 objects:v43 count:16];
              }
              while (v13);
            }
          }

          uint64_t v7 = v28;
          id v6 = v29;
          id v9 = v31;
        }
        id v9 = (char *)v9 + 1;
      }
      while (v9 != v6);
      id v6 = [obj countByEnumeratingWithState:&v39 objects:v44 count:16];
    }
    while (v6);
  }

  if ([v4 count]) {
    [(_DASDaemon *)v27 associateActivity:v3 withTriggerKeys:v4];
  }
}

- (void)associateActivity:(id)a3 withTriggerKeys:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  CFStringRef v8 = self->_triggerToActivitiesMap;
  objc_sync_enter(v8);
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v9 = v7;
  id v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v19;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v19 != v11) {
          objc_enumerationMutation(v9);
        }
        uint64_t v13 = *(void *)(*((void *)&v18 + 1) + 8 * i);
        uint64_t v14 = -[NSMutableDictionary objectForKeyedSubscript:](self->_triggerToActivitiesMap, "objectForKeyedSubscript:", v13, (void)v18);
        BOOL v15 = v14 == 0;

        if (v15)
        {
          uint64_t v16 = +[NSMutableSet set];
          [(NSMutableDictionary *)self->_triggerToActivitiesMap setObject:v16 forKeyedSubscript:v13];
        }
        uint64_t v17 = [(NSMutableDictionary *)self->_triggerToActivitiesMap objectForKeyedSubscript:v13];
        [v17 _DAS_addOrReplaceObject:v6];
      }
      id v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v10);
  }

  objc_sync_exit(v8);
}

- (void)submitActivity:(id)a3
{
}

- (void)setMinimumBackgroundFetchInterval:(double)a3 forApp:(id)a4
{
}

- (BOOL)activityIsTimewiseEligible:(id)a3 atDate:(id)a4
{
  return [a3 timewiseEligibleAtDate:a4];
}

+ (_DASDaemon)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000AE6EC;
  block[3] = &unk_1001753E0;
  void block[4] = a1;
  if (qword_1001C43B8 != -1) {
    dispatch_once(&qword_1001C43B8, block);
  }
  v2 = (void *)qword_1001C43C0;

  return (_DASDaemon *)v2;
}

- (id)initAsAnonymous:(BOOL)a3 withContext:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  v157.receiver = self;
  v157.super_class = (Class)_DASDaemon;
  id v7 = [(_DASDaemon *)&v157 init];
  CFStringRef v8 = v7;
  if (v7)
  {
    BOOL v144 = v4;
    [(_DASDaemon *)v7 setupPrewarmSuspendListener];
    id v9 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v10 = dispatch_queue_create("com.apple.dasscheduler.batchingqueue.taskevaluation", v9);
    evaluationQueue = v8->_evaluationQueue;
    v8->_evaluationQueue = (OS_dispatch_queue *)v10;

    uint64_t v12 = +[NSMutableArray array];
    clients = v8->_clients;
    v8->_clients = (NSMutableArray *)v12;

    uint64_t v14 = +[NSMutableDictionary dictionary];
    connectedBGTaskClients = v8->_connectedBGTaskClients;
    v8->_connectedBGTaskClients = (NSMutableDictionary *)v14;

    uint64_t v16 = +[NSMutableDictionary dictionary];
    activitiesWaitingForBGTaskClients = v8->_activitiesWaitingForBGTaskClients;
    v8->_activitiesWaitingForBGTaskClients = (NSMutableDictionary *)v16;

    v8->_activityStateLock = 0;
    uint64_t v18 = +[NSMutableSet set];
    pendingTasks = v8->_pendingTasks;
    v8->_pendingTasks = (NSMutableSet *)v18;

    uint64_t v20 = +[NSMutableSet set];
    prerunningTasks = v8->_prerunningTasks;
    v8->_prerunningTasks = (NSMutableSet *)v20;

    uint64_t v22 = +[NSMutableSet set];
    runningTasks = v8->_runningTasks;
    v8->_runningTasks = (NSMutableSet *)v22;

    v8->_recomEngineDisabled = 0;
    v8->_groupLock._os_unfair_lock_opaque = 0;
    uint64_t v24 = +[NSMutableDictionary dictionary];
    groups = v8->_groups;
    v8->_groups = (NSMutableDictionary *)v24;

    uint64_t v26 = +[NSMutableDictionary dictionary];
    groupToPendingTasks = v8->_groupToPendingTasks;
    v8->_groupToPendingTasks = (NSMutableDictionary *)v26;

    uint64_t v28 = +[NSMutableDictionary dictionary];
    groupToRunningTasks = v8->_groupToRunningTasks;
    v8->_groupToRunningTasks = (NSMutableDictionary *)v28;

    uint64_t v30 = +[NSMutableDictionary dictionary];
    groupToPrerunningTasks = v8->_groupToPrerunningTasks;
    v8->_groupToPrerunningTasks = (NSMutableDictionary *)v30;

    v8->_applicationLaunchRequestsLock = 0;
    uint64_t v32 = +[NSMutableDictionary dictionary];
    applicationLaunchRequests = v8->_applicationLaunchRequests;
    v8->_applicationLaunchRequests = (NSMutableDictionary *)v32;

    uint64_t v34 = +[NSMutableDictionary dictionary];
    applicationsLaunched = v8->_applicationsLaunched;
    v8->_applicationsLaunched = (NSMutableDictionary *)v34;

    uint64_t v36 = +[NSMutableDictionary dictionary];
    extensionLaunchRequests = v8->_extensionLaunchRequests;
    v8->_extensionLaunchRequests = (NSMutableDictionary *)v36;

    uint64_t v38 = +[NSMutableDictionary dictionary];
    recentlyLaunchedApps = v8->_recentlyLaunchedApps;
    v8->_recentlyLaunchedApps = (NSMutableDictionary *)v38;

    long long v40 = (NSUserDefaults *)[objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.dasd.testingDefaults"];
    testingDefaults = v8->_testingDefaults;
    v8->_testingDefaults = v40;

    uint64_t v42 = +[NSMutableDictionary dictionary];
    powerAssertions = v8->_powerAssertions;
    v8->_powerAssertions = (NSMutableDictionary *)v42;

    [(_DASDaemon *)v8 loadTestingDefaults];
    id v145 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.duetactivityscheduler"];
    uint64_t v44 = (uint64_t)[v145 integerForKey:@"enRelaunchInterval"];
    if (v44 >= 1 && *(double *)&qword_1001C31C0 > (double)v44) {
      *(double *)&qword_1001C31C0 = (double)((unint64_t)v44 >> 2);
    }
    if ((_set_user_dir_suffix() & 1) == 0)
    {
      id v45 = +[_DASDaemonLogger defaultCategory];
      if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_DEFAULT, "Unable to set temporary file directory", buf, 2u);
      }
    }
    id v46 = NSTemporaryDirectory();
    v8->_signpostLock._os_unfair_lock_opaque = 0;
    uint64_t v47 = +[NSMutableSet set];
    signpostActivitiesRunningDeviceActive = v8->_signpostActivitiesRunningDeviceActive;
    v8->_signpostActivitiesRunningDeviceActive = (NSMutableSet *)v47;

    uint64_t v49 = +[NSMutableSet set];
    signpostActivitiesRunningScreenOff = v8->_signpostActivitiesRunningScreenOff;
    v8->_signpostActivitiesRunningScreenOff = (NSMutableSet *)v49;

    uint64_t v51 = +[NSCountedSet set];
    launchesPerApp = v8->_launchesPerApp;
    v8->_launchesPerApp = (NSCountedSet *)v51;

    unsigned int v53 = dispatch_get_global_queue(-32768, 0);
    dispatch_source_t v54 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, v53);
    launchTimeResetTimer = v8->_launchTimeResetTimer;
    v8->_launchTimeResetTimer = (OS_dispatch_source *)v54;

    id v56 = v8->_launchTimeResetTimer;
    dispatch_time_t v57 = dispatch_walltime(0, 3600000000000);
    dispatch_source_set_timer(v56, v57, 0x34630B8A000uLL, 0xDF8475800uLL);
    dispatch_set_qos_class_fallback();
    CFStringRef v58 = v8->_launchTimeResetTimer;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_1000AF2DC;
    handler[3] = &unk_1001754F8;
    long long v59 = v8;
    v155 = v59;
    dispatch_source_set_event_handler(v58, handler);
    dispatch_resume((dispatch_object_t)v8->_launchTimeResetTimer);
    long long v60 = v8->_evaluationQueue;
    v152[0] = _NSConcreteStackBlock;
    v152[1] = 3221225472;
    v152[2] = sub_1000AF360;
    v152[3] = &unk_100176C78;
    long long v61 = v59;
    v153 = v61;
    uint64_t v62 = +[_DASBatchingQueue queueWithName:@"com.apple.dasscheduler.triggerbatchingqueue" maxBatchingDelay:10 maxQueueDepth:v60 queue:v152 workItemsHandler:2.0];
    triggerBatchingQueue = v61->_triggerBatchingQueue;
    v61->_triggerBatchingQueue = (_DASBatchingQueue *)v62;

    uint64_t v64 = +[_DASBatchingQueue queueWithName:@"com.apple.dasscheduler.triggerRecorder" maxBatchingDelay:30 maxQueueDepth:v8->_evaluationQueue queue:&stru_100177AE0 workItemsHandler:5.0];
    triggerRecorderBatchingQueue = v61->_triggerRecorderBatchingQueue;
    v61->_triggerRecorderBatchingQueue = (_DASBatchingQueue *)v64;

    unsigned int v66 = v8->_evaluationQueue;
    v150[0] = _NSConcreteStackBlock;
    v150[1] = 3221225472;
    v150[2] = sub_1000AF36C;
    v150[3] = &unk_100176C78;
    id v67 = v61;
    v151 = v67;
    uint64_t v68 = +[_DASBatchingQueue queueWithName:@"com.apple.dasscheduler.activitycompletionbatchingqueue" maxBatchingDelay:15 maxQueueDepth:v66 queue:v150 workItemsHandler:15.0];
    activityCompletedBatchingQueue = v67->_activityCompletedBatchingQueue;
    v67->_activityCompletedBatchingQueue = (_DASBatchingQueue *)v68;

    long long v70 = v8->_evaluationQueue;
    v148[0] = _NSConcreteStackBlock;
    v148[1] = 3221225472;
    v148[2] = sub_1000AF378;
    v148[3] = &unk_100176C78;
    unsigned int v71 = v67;
    v149 = v71;
    uint64_t v72 = +[_DASBatchingQueue queueWithName:@"com.apple.das.networkActivitiesQueue" maxBatchingDelay:256 maxQueueDepth:v70 queue:v148 workItemsHandler:1.0];
    networkActivitiesQueue = v71->_networkActivitiesQueue;
    v71->_networkActivitiesQueue = (_DASBatchingQueue *)v72;

    if (v6)
    {
      BOOL v74 = (_CDLocalContext *)v6;
    }
    else
    {
      BOOL v74 = +[_CDClientContext userContext];
    }
    context = v71->_context;
    v71->_context = v74;

    unsigned int v76 = +[_DASDaemonLogger defaultCategory];
    if (os_log_type_enabled(v76, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v76, OS_LOG_TYPE_DEFAULT, "Initializing DASDaemon...", buf, 2u);
    }

    uint64_t v77 = +[_DASUserRequestedBackupTaskManager managerWithContext:v71->_context];
    backupTaskManager = v71->_backupTaskManager;
    v71->_backupTaskManager = (_DASUserRequestedBackupTaskManager *)v77;

    uint64_t v79 = +[_DASNetworkEvaluationMonitor sharedInstance];
    networkEvaluationMonitor = v71->_networkEvaluationMonitor;
    v71->_networkEvaluationMonitor = (_DASNetworkEvaluationMonitor *)v79;

    uint64_t v81 = +[_DASSleepWakeMonitor sharedMonitorWithDaemon:v71];
    sleepWakeMonitor = v71->_sleepWakeMonitor;
    v71->_sleepWakeMonitor = (_DASSleepWakeMonitor *)v81;

    [(_DASDaemon *)v71 registerForNetworkPathEvaluation];
    long long v83 = +[_DASPolicyManager allPoliciesForPlatform];
    [(_DASDaemon *)v71 registerTriggersWithContextStoreForPolicies:v83];
    uint64_t v84 = +[NSMutableDictionary dictionary];
    triggerToActivitiesMap = v71->_triggerToActivitiesMap;
    v71->_triggerToActivitiesMap = (NSMutableDictionary *)v84;

    uint64_t v86 = +[NSMutableDictionary dictionary];
    activityToIncompatibleActivitiesMap = v71->_activityToIncompatibleActivitiesMap;
    v71->_activityToIncompatibleActivitiesMap = (NSMutableDictionary *)v86;

    id v88 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v89 = dispatch_queue_create("com.apple.duetactivityscheduler.timeschedulingqueue", v88);
    timerSchedulingQueue = v71->_timerSchedulingQueue;
    v71->_timerSchedulingQueue = (OS_dispatch_queue *)v89;

    uint64_t v91 = +[NSDate distantPast];
    timerEarliestFireDate = v71->_timerEarliestFireDate;
    v71->_timerEarliestFireDate = (NSDate *)v91;

    uint64_t v93 = +[NSDate distantFuture];
    timerLatestFireDate = v71->_timerLatestFireDate;
    v71->_timerLatestFireDate = (NSDate *)v93;

    uint64_t v95 = +[_DASTrialManager sharedInstance];
    trialManager = v71->_trialManager;
    v71->_trialManager = (_DASTrialManager *)v95;

    [(_DASTrialManager *)v71->_trialManager addDelegate:v71];
    id v97 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.duetactivityscheduler"];
    unsigned __int8 v98 = [v97 BOOLForKey:@"clasDisabled"];

    if ((v98 & 1) == 0)
    {
      uint64_t v99 = objc_opt_new();
      controlEngine = v71->_controlEngine;
      v71->_controlEngine = (_DASControlEngine *)v99;
    }
    v146[0] = _NSConcreteStackBlock;
    v146[1] = 3221225472;
    v146[2] = sub_1000AF464;
    v146[3] = &unk_1001754F8;
    v101 = v71;
    v147 = v101;
    uint64_t v102 = +[_DASTimer timerWithCallback:v146];
    id v103 = v101[24];
    v101[24] = (id)v102;

    [v101 setupTimers];
    uint64_t v104 = +[_DASCoreDataStore storageWithDirectory:@"/var/mobile/Library/DuetActivityScheduler" readOnly:0];
    id v105 = v101[37];
    v101[37] = (id)v104;

    if (v144)
    {
      id v106 = +[NSXPCListener anonymousListener];
    }
    else
    {
      id v107 = objc_alloc((Class)NSXPCListener);
      id v106 = [v107 initWithMachServiceName:_DASDaemonServiceName];
    }
    id v108 = v101[21];
    v101[21] = v106;

    [v101[21] setDelegate:v101];
    uint64_t v109 = +[NSXPCListener anonymousListener];
    id v110 = v101[22];
    v101[22] = (id)v109;

    [v101[22] setDelegate:v101];
    +[_DASMetricRecorder incrementOccurrencesForKey:@"com.apple.das.startup" byCount:1];
    v111 = dispatch_queue_attr_make_with_autorelease_frequency((dispatch_queue_attr_t)&_dispatch_queue_attr_concurrent, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v112 = dispatch_queue_create("com.apple.duetactivityscheduler.backgroundLaunchQueue", v111);
    id v113 = v101[55];
    v101[55] = v112;

    id v114 = v71->_context;
    long long v115 = +[_DASPhotosPolicy keyPathForPhotosIsBlocked];
    long long v116 = [(_CDLocalContext *)v114 objectForKeyedSubscript:v115];

    if (v116) {
      v101[65] = [v116 unsignedIntegerValue];
    }
    else {
      [v101 updateiCPLTasksBlocked:0];
    }
    *((_DWORD *)v101 + 4) = 0;
    uint64_t v117 = +[_CDContextualKeyPath keyPathWithKey:@"/das/utilityConstraints"];
    id v118 = v101[66];
    v101[66] = (id)v117;

    uint64_t v119 = +[_CDContextualKeyPath keyPathWithKey:@"/das/maintenanceConstraints"];
    id v120 = v101[67];
    v101[67] = (id)v119;

    v121 = [(_CDLocalContext *)v71->_context objectForKeyedSubscript:v101[66]];
    v122 = v121;
    if (v121) {
      v101[68] = [v121 unsignedIntegerValue];
    }
    CFStringRef v123 = [(_CDLocalContext *)v71->_context objectForKeyedSubscript:v101[67]];
    v124 = v123;
    if (v123) {
      v101[69] = [v123 unsignedIntegerValue];
    }
    uint64_t v125 = +[_DASBudgetManager sharedInstance];
    id v126 = v101[62];
    v101[62] = (id)v125;

    uint64_t v127 = +[_DASActivityDependencyManager sharedInstance];
    id v128 = v101[63];
    v101[63] = (id)v127;

    v129 = [[_DASAssertionArbiter alloc] initWithDelegate:v101];
    id v130 = v101[64];
    v101[64] = v129;

    uint64_t v131 = objc_opt_new();
    id v132 = v101[46];
    v101[46] = (id)v131;

    v133 = +[_DASBatteryTemperatureRecorder sharedInstance];
    uint64_t v134 = +[_DASDock dockManager];
    id v135 = v101[87];
    v101[87] = (id)v134;

    uint64_t v136 = +[_DASBackgroundAppKillDemo sharedInstance];
    id v137 = v101[78];
    v101[78] = (id)v136;

    uint64_t v138 = +[_DASNotificationManager sharedManager];
    id v139 = v101[83];
    v101[83] = (id)v138;

    uint64_t v140 = +[_DASFeatureDurationTracker sharedInstance];
    id v141 = v101[51];
    v101[51] = (id)v140;

    v142 = +[_DASIssueDetector sharedInstance];
    [v142 schedule];
  }
  return v8;
}

- (void)solicitActivityResubmission
{
  v2 = +[_DASDaemonLogger defaultCategory];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Soliciting activities for resubmission.", v3, 2u);
  }

  notify_post((const char *)[@"com.appple.duet.activityscheduler.requestActivityResubmission" UTF8String]);
}

- (void)registerForTrial
{
  id v3 = +[_DASTrialManager sharedInstance];
  [v3 addDelegate:self];
}

- (void)updateTrialParameters
{
  id v3 = [(_DASTrialManager *)self->_trialManager factorWithName:@"APRS_Disabled"];
  BOOL v4 = +[_DASDaemonLogger defaultCategory];
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      v13[0] = 67109120;
      v13[1] = [v3 BOOLeanValue];
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Trial: recomEngineDisabled set to %d", (uint8_t *)v13, 8u);
    }

    self->_recomEngineDisabled = [v3 BOOLeanValue];
  }
  else
  {
    if (v5)
    {
      LOWORD(v13[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Trial: Failed to load recomEngineDisabled", (uint8_t *)v13, 2u);
    }
  }
  id v6 = [(_DASTrialManager *)self->_trialManager factorWithName:@"Sched_MaxAllowableDurationSeconds"];
  id v7 = v6;
  if (v6) {
    [v6 doubleValue];
  }
  uint64_t v8 = qword_1001C31C8;
  id v9 = [(_DASTrialManager *)self->_trialManager factorWithName:@"Sched_DefaultGroupMax"];

  if (v9) {
    qword_1001C31C8 = (uint64_t)[v9 longValue];
  }
  uint64_t v10 = qword_1001C31D0;
  uint64_t v11 = [(_DASTrialManager *)self->_trialManager factorWithName:@"Sched_NetworkDefaultGroupMax"];

  if (v11)
  {
    id v12 = [v11 longValue];
    qword_1001C31D0 = (uint64_t)v12;
  }
  else
  {
    id v12 = (id)qword_1001C31D0;
  }
  if (qword_1001C31C8 != v8 || v12 != (id)v10) {
    [(_DASDaemon *)self createDefaultActivityGroups];
  }
}

- (void)assertionArbiter:(id)a3 didIssueWarningFor:(id)a4
{
  id v4 = a4;
  BOOL v5 = +[_DASDaemonLogger defaultCategory];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Received assertion warning for %@", (uint8_t *)&v6, 0xCu);
  }
}

- (void)assertionArbiter:(id)a3 didIssueInvalidationFor:(id)a4 serverInitiated:(BOOL)a5
{
  id v5 = a4;
  int v6 = +[_DASDaemonLogger defaultCategory];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    id v8 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Received assertion invalidation for %@", (uint8_t *)&v7, 0xCu);
  }
}

- (id)assertionArbiter:(id)a3 clientWithPID:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  int v7 = [(_DASDaemon *)self connectedBGTaskClients];
  objc_sync_enter(v7);
  id v8 = [(_DASDaemon *)self connectedBGTaskClients];
  id v9 = +[NSNumber numberWithInt:v4];
  uint64_t v10 = [v8 objectForKeyedSubscript:v9];

  objc_sync_exit(v7);

  return v10;
}

- (void)createAssertion:(id)a3
{
  id v4 = a3;
  if (_os_feature_enabled_impl())
  {
    if (([v4 requestsApplicationLaunch] & 1) == 0)
    {
      unsigned int v5 = +[_DASSystemContext isPluggedIn:self->_context];
      if ((v5 & 1) != 0 || [v4 preventDeviceSleep])
      {
        id v6 = +[_DASDaemonLogger logForCategory:@"lifecycle"];
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        {
          int v7 = [v4 name];
          *(_DWORD *)buf = 138412802;
          uint64_t v34 = v7;
          __int16 v35 = 1024;
          *(_DWORD *)uint64_t v36 = [v4 preventDeviceSleep];
          *(_WORD *)&v36[4] = 1024;
          *(_DWORD *)&v36[6] = v5;
          _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Activity %@ has preventDeviceSleep %d. PluggedIn state: %d", buf, 0x18u);
        }
        if ([v4 preventDeviceSleep]) {
          CFStringRef v8 = @"-ClientRequested";
        }
        else {
          CFStringRef v8 = &stru_100179948;
        }
        id v9 = [v4 name];
        uint64_t v10 = +[NSString stringWithFormat:@"DASActivity%@:%@", v8, v9];

        id v11 = objc_alloc((Class)NSMutableDictionary);
        v31[0] = @"AssertType";
        v31[1] = @"AssertName";
        v32[0] = @"PreventUserIdleSystemSleep";
        v32[1] = v10;
        id v12 = +[NSDictionary dictionaryWithObjects:v32 forKeys:v31 count:2];
        id v13 = [v11 initWithDictionary:v12];

        if ([v4 pid])
        {
          uint64_t v14 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v4 pid]);
          [v13 setObject:v14 forKeyedSubscript:@"AssertionOnBehalfOfPID"];
        }
        [v13 setObject:&__kCFBooleanTrue forKeyedSubscript:@"AllowsDeviceRestart"];
        BOOL v15 = [(_DASDaemon *)self powerAssertions];
        objc_sync_enter(v15);
        uint64_t v16 = [(_DASDaemon *)self powerAssertions];
        uint64_t v17 = [v4 uuid];
        uint64_t v18 = [v16 objectForKeyedSubscript:v17];

        if (v18)
        {
          long long v19 = +[_DASDaemonLogger logForCategory:@"lifecycle"];
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v20 = [v4 uuid];
            long long v21 = [(_DASDaemon *)self powerAssertions];
            uint64_t v22 = [v4 uuid];
            id v23 = [v21 objectForKeyedSubscript:v22];
            *(_DWORD *)buf = 138412546;
            uint64_t v34 = v20;
            __int16 v35 = 2112;
            *(void *)uint64_t v36 = v23;
            _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Assertion already exists for UUID %@ %@", buf, 0x16u);
          }
          goto LABEL_23;
        }
        IOPMAssertionID AssertionID = 0;
        IOReturn v24 = IOPMAssertionCreateWithProperties((CFDictionaryRef)v13, &AssertionID);
        if (v24)
        {
          unsigned __int8 v25 = +[_DASDaemonLogger logForCategory:@"lifecycle"];
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 67109120;
            LODWORD(v34) = v24;
            _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Failed to create an assertion 0x%x", buf, 8u);
          }
        }
        else
        {
          uint64_t v26 = +[NSNumber numberWithUnsignedInt:AssertionID];
          id v27 = [(_DASDaemon *)self powerAssertions];
          uint64_t v28 = [v4 uuid];
          [v27 setObject:v26 forKeyedSubscript:v28];

          if (![v4 preventDeviceSleep])
          {
LABEL_23:
            objc_sync_exit(v15);

            goto LABEL_24;
          }
          unsigned __int8 v25 = +[_DASDaemonLogger logForCategory:@"lifecycle"];
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
          {
            id v29 = [v4 name];
            *(_DWORD *)buf = 138412546;
            uint64_t v34 = v29;
            __int16 v35 = 1024;
            *(_DWORD *)uint64_t v36 = AssertionID;
            _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Creating assertion for  %@ %u", buf, 0x12u);
          }
        }

        goto LABEL_23;
      }
    }
  }
LABEL_24:
}

- (void)releaseAssertion:(id)a3
{
  id v4 = a3;
  if (_os_feature_enabled_impl())
  {
    unsigned int v5 = [(_DASDaemon *)self powerAssertions];
    objc_sync_enter(v5);
    id v6 = [(_DASDaemon *)self powerAssertions];
    int v7 = [v4 uuid];
    CFStringRef v8 = [v6 objectForKeyedSubscript:v7];

    if (v8)
    {
      IOPMAssertionID v9 = [v8 unsignedIntValue];
      if ([v4 preventDeviceSleep])
      {
        uint64_t v10 = +[_DASDaemonLogger logForCategory:@"lifecycle"];
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          id v11 = [v4 name];
          int v14 = 138412546;
          BOOL v15 = v11;
          __int16 v16 = 1024;
          IOPMAssertionID v17 = v9;
          _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Releasing assertion for %@ %u", (uint8_t *)&v14, 0x12u);
        }
      }
      IOPMAssertionRelease(v9);
      id v12 = [(_DASDaemon *)self powerAssertions];
      id v13 = [v4 uuid];
      [v12 removeObjectForKey:v13];
    }
    objc_sync_exit(v5);
  }
}

- (void)releaseAssertions:(id)a3
{
  id v4 = a3;
  if (_os_feature_enabled_impl())
  {
    id v18 = v4;
    id obj = [(_DASDaemon *)self powerAssertions];
    objc_sync_enter(obj);
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v5 = v4;
    id v6 = [v5 countByEnumeratingWithState:&v20 objects:v28 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v21;
      do
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v21 != v7) {
            objc_enumerationMutation(v5);
          }
          IOPMAssertionID v9 = *(void **)(*((void *)&v20 + 1) + 8 * i);
          uint64_t v10 = [(_DASDaemon *)self powerAssertions];
          id v11 = [v9 uuid];
          id v12 = [v10 objectForKeyedSubscript:v11];

          if (v12)
          {
            IOPMAssertionID v13 = [v12 unsignedIntValue];
            int v14 = +[_DASDaemonLogger logForCategory:@"lifecycle"];
            if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
            {
              BOOL v15 = [v9 name];
              *(_DWORD *)buf = 138412546;
              unsigned __int8 v25 = v15;
              __int16 v26 = 1024;
              IOPMAssertionID v27 = v13;
              _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Releasing assertion for %@ %u", buf, 0x12u);
            }
            IOPMAssertionRelease(v13);
            __int16 v16 = [(_DASDaemon *)self powerAssertions];
            IOPMAssertionID v17 = [v9 uuid];
            [v16 removeObjectForKey:v17];
          }
        }
        id v6 = [v5 countByEnumeratingWithState:&v20 objects:v28 count:16];
      }
      while (v6);
    }

    objc_sync_exit(obj);
    id v4 = v18;
  }
}

- (void)evaluateAssertions
{
  if (_os_feature_enabled_impl()
    && (+[_DASSystemContext isPluggedIn:self->_context] & 1) == 0)
  {
    id v3 = +[_DASDaemonLogger logForCategory:@"lifecycle"];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Evaluating assertions on pluggedIn state change", buf, 2u);
    }

    id v4 = +[NSMutableSet set];
    id v5 = [(_DASDaemon *)self powerAssertions];
    objc_sync_enter(v5);
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v6 = [(_DASDaemon *)self powerAssertions];
    id v7 = [v6 countByEnumeratingWithState:&v20 objects:v26 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v21;
      do
      {
        IOPMAssertionID v9 = 0;
        do
        {
          if (*(void *)v21 != v8) {
            objc_enumerationMutation(v6);
          }
          uint64_t v10 = [(_DASDaemon *)self getActivityRunningWithUUID:*(void *)(*((void *)&v20 + 1) + 8 * (void)v9)];
          id v11 = v10;
          if (v10 && ([v10 preventDeviceSleep] & 1) == 0) {
            [v4 addObject:v11];
          }

          IOPMAssertionID v9 = (char *)v9 + 1;
        }
        while (v7 != v9);
        id v7 = [v6 countByEnumeratingWithState:&v20 objects:v26 count:16];
      }
      while (v7);
    }

    objc_sync_exit(v5);
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v12 = v4;
    id v13 = [v12 countByEnumeratingWithState:&v16 objects:v25 count:16];
    if (v13)
    {
      uint64_t v14 = *(void *)v17;
      do
      {
        BOOL v15 = 0;
        do
        {
          if (*(void *)v17 != v14) {
            objc_enumerationMutation(v12);
          }
          -[_DASDaemon releaseAssertion:](self, "releaseAssertion:", *(void *)(*((void *)&v16 + 1) + 8 * (void)v15), (void)v16);
          BOOL v15 = (char *)v15 + 1;
        }
        while (v13 != v15);
        id v13 = [v12 countByEnumeratingWithState:&v16 objects:v25 count:16];
      }
      while (v13);
    }
  }
}

- (void)setupTimers
{
  id v3 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)self->_evaluationQueue);
  optimalScoringTimer = self->_optimalScoringTimer;
  self->_optimalScoringTimer = v3;

  dispatch_set_qos_class_fallback();
  id v5 = self->_optimalScoringTimer;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_1000B0780;
  handler[3] = &unk_1001754F8;
  void handler[4] = self;
  dispatch_source_set_event_handler(v5, handler);
  id v6 = self->_optimalScoringTimer;
  dispatch_time_t v7 = dispatch_walltime(0, 21600000000000);
  dispatch_source_set_timer(v6, v7, 0x13A52453C000uLL, 0x34630B8A000uLL);
  dispatch_resume((dispatch_object_t)self->_optimalScoringTimer);
  [(_DASDaemon *)self setupDatabaseMaintenance];
  uint64_t v8 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.dasd.groupsqueue", 0);
  groupMonitoringQueue = self->_groupMonitoringQueue;
  self->_groupMonitoringQueue = v8;

  uint64_t v10 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)self->_groupMonitoringQueue);
  groupMonitoringTimer = self->_groupMonitoringTimer;
  self->_groupMonitoringTimer = v10;

  dispatch_set_qos_class_fallback();
  id v12 = self->_groupMonitoringTimer;
  dispatch_time_t v13 = dispatch_walltime(0, 180000000000);
  dispatch_source_set_timer(v12, v13, 0x29E8D60800uLL, 0x3B9ACA00uLL);
  uint64_t v14 = self->_groupMonitoringTimer;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1000B0788;
  v15[3] = &unk_1001754F8;
  v15[4] = self;
  dispatch_source_set_event_handler(v14, v15);
  dispatch_activate((dispatch_object_t)self->_groupMonitoringTimer);
}

- (void)scheduleTimerForActivity:(id)a3
{
  id v4 = a3;
  id v13 = +[NSDate date];
  id v5 = [v4 name];
  id v6 = [v4 predictedOptimalStartDate];
  [v6 timeIntervalSinceDate:v13];
  double v8 = v7;
  IOPMAssertionID v9 = [v4 startBefore];
  [v9 timeIntervalSinceDate:v13];
  double v11 = v10;
  id v12 = [v4 schedulingPriority];

  [(_DASDaemon *)self scheduleTimerOnBehalfOf:v5 between:(unint64_t)v12 > _DASSchedulingPriorityUtility and:v8 waking:v11];
}

- (void)scheduleTimerOnBehalfOf:(id)a3 between:(double)a4 and:(double)a5 waking:(BOOL)a6
{
  id v10 = a3;
  timerSchedulingQueue = self->_timerSchedulingQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000B0DC0;
  block[3] = &unk_100177B08;
  double v15 = a4;
  double v16 = a5;
  BOOL v17 = a6;
  void block[4] = self;
  id v14 = v10;
  id v12 = v10;
  dispatch_sync(timerSchedulingQueue, block);
}

- (void)setupDatabaseMaintenance
{
  id v3 = dispatch_get_global_queue(0, 0);
  id v4 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, v3);
  databaseMaintenanceTimer = self->_databaseMaintenanceTimer;
  self->_databaseMaintenanceTimer = v4;

  dispatch_set_qos_class_fallback();
  id v6 = self->_databaseMaintenanceTimer;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_1000B114C;
  handler[3] = &unk_1001754F8;
  void handler[4] = self;
  dispatch_source_set_event_handler(v6, handler);
  double v7 = self->_databaseMaintenanceTimer;
  dispatch_time_t v8 = dispatch_walltime(0, 86400000000000);
  dispatch_source_set_timer(v7, v8, 0x4E94914F0000uLL, 0x4E94914F0000uLL);
  dispatch_resume((dispatch_object_t)self->_databaseMaintenanceTimer);
}

- (void)removeDuplicateLaunchTasks:(id)a3
{
  id v3 = a3;
  id v4 = +[NSMutableSet set];
  id v29 = +[NSMutableDictionary dictionary];
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  id obj = v3;
  id v30 = [obj countByEnumeratingWithState:&v42 objects:v48 count:16];
  if (v30)
  {
    uint64_t v28 = *(void *)v43;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v43 != v28) {
          objc_enumerationMutation(obj);
        }
        id v6 = *(void **)(*((void *)&v42 + 1) + 8 * v5);
        if ([v6 isBackgroundTaskActivity]) {
          [v6 clientProvidedIdentifier];
        }
        else {
        BOOL v31 = [v6 name];
        }
        uint64_t v32 = v5;
        double v7 = [v29 objectForKeyedSubscript:v31];
        if (!v7)
        {
          double v7 = +[NSMutableArray array];
        }
        long long v40 = 0u;
        long long v41 = 0u;
        long long v38 = 0u;
        long long v39 = 0u;
        id v8 = v7;
        id v9 = [v8 countByEnumeratingWithState:&v38 objects:v47 count:16];
        if (v9)
        {
          id v10 = v9;
          uint64_t v11 = *(void *)v39;
          do
          {
            for (i = 0; i != v10; i = (char *)i + 1)
            {
              if (*(void *)v39 != v11) {
                objc_enumerationMutation(v8);
              }
              id v13 = *(void **)(*((void *)&v38 + 1) + 8 * i);
              if ([v6 isBackgroundTaskActivity])
              {
                if ([v13 isBackgroundTaskActivity])
                {
                  unsigned __int8 v37 = 0;
                  if ([v6 shouldReplaceActivity:v13 andKeepsSubmitted:&v37])
                  {
                    int v14 = v37;
                    double v15 = [v6 submitDate];
                    double v16 = [v13 submitDate];
                    [v15 timeIntervalSinceDate:v16];
                    if (v14) {
                      double v18 = -v17;
                    }
                    else {
                      double v18 = v17;
                    }

                    if (v18 <= 0.0) {
                      long long v19 = v6;
                    }
                    else {
                      long long v19 = v13;
                    }
                    [v4 addObject:v19];
                  }
                }
              }
            }
            id v10 = [v8 countByEnumeratingWithState:&v38 objects:v47 count:16];
          }
          while (v10);
        }

        uint64_t v5 = v32 + 1;
      }
      while ((id)(v32 + 1) != v30);
      id v30 = [obj countByEnumeratingWithState:&v42 objects:v48 count:16];
    }
    while (v30);
  }

  [obj minusSet:v4];
  long long v20 = +[_DASDaemonLogger logForCategory:@"persistence"];
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
    sub_1000FE53C();
  }

  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v21 = v4;
  id v22 = [v21 countByEnumeratingWithState:&v33 objects:v46 count:16];
  if (v22)
  {
    id v23 = v22;
    uint64_t v24 = *(void *)v34;
    do
    {
      for (j = 0; j != v23; j = (char *)j + 1)
      {
        if (*(void *)v34 != v24) {
          objc_enumerationMutation(v21);
        }
        [(_DASDataStore *)self->_store deleteActivity:*(void *)(*((void *)&v33 + 1) + 8 * (void)j)];
      }
      id v23 = [v21 countByEnumeratingWithState:&v33 objects:v46 count:16];
    }
    while (v23);
  }
}

- (void)loadState
{
  id v3 = objc_alloc_init(_DASDataProtectionStateMonitor);
  uint64_t v14 = 0;
  double v15 = &v14;
  uint64_t v16 = 0x2020000000;
  char v17 = 0;
  uint64_t v9 = 0;
  id v10 = (os_unfair_lock_s *)&v9;
  uint64_t v11 = 0x2810000000;
  id v12 = "";
  int v13 = 0;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000B16B4;
  v8[3] = &unk_100177B30;
  v8[5] = &v9;
  v8[6] = &v14;
  v8[4] = self;
  [(_DASDataProtectionStateMonitor *)v3 setChangeHandler:v8];
  id v4 = +[_DASDataProtectionStateMonitor dataProtectionClassC];
  unsigned __int8 v5 = [(_DASDataProtectionStateMonitor *)v3 isDataAvailableFor:v4];

  if (v5)
  {
    os_unfair_lock_lock(v10 + 8);
    if (!*((unsigned char *)v15 + 24))
    {
      [(_DASDaemon *)self loadStateWhenAvailable];
      *((unsigned char *)v15 + 24) = 1;
    }
    os_unfair_lock_unlock(v10 + 8);
  }
  else
  {
    id v6 = +[_DASDaemonLogger defaultCategory];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)double v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Class C not yet available. Not loading activities", v7, 2u);
    }
  }
  _Block_object_dispose(&v9, 8);
  _Block_object_dispose(&v14, 8);
}

- (void)loadStateWhenAvailable
{
  id v3 = (void *)os_transaction_create();
  unsigned __int8 v5 = +[NSMutableSet set];
  id v6 = +[NSMutableSet set];
  double v7 = +[_DASDaemonLogger defaultCategory];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Loading saved activities.", buf, 2u);
  }

  [(_DASDataStore *)self->_store deleteActivitiesIfRequired];
  [(_DASDataStore *)self->_store loadPendingLaunchTasks:v5];
  [(_DASDataStore *)self->_store loadAllGroups:v6];
  [(_DASDaemon *)self removeDuplicateLaunchTasks:v5];
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v8 = v6;
  id v9 = [v8 countByEnumeratingWithState:&v30 objects:v38 count:16];
  if (!v9)
  {

LABEL_20:
    [(_DASDaemon *)self createDefaultActivityGroups];
    goto LABEL_21;
  }
  id v10 = v9;
  unsigned __int8 v25 = v5;
  __int16 v26 = v4;
  IOPMAssertionID v27 = v3;
  int v28 = 0;
  uint64_t v29 = 0;
  uint64_t v11 = *(void *)v31;
  do
  {
    for (i = 0; i != v10; i = (char *)i + 1)
    {
      if (*(void *)v31 != v11) {
        objc_enumerationMutation(v8);
      }
      int v13 = *(void **)(*((void *)&v30 + 1) + 8 * i);
      uint64_t v14 = +[_DASDaemonLogger defaultCategory];
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        double v15 = [v13 name];
        id v16 = [v13 maxConcurrent];
        *(_DWORD *)buf = 138412546;
        long long v35 = v15;
        __int16 v36 = 2048;
        id v37 = v16;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Loading group %@ (capacity=%lld).", buf, 0x16u);
      }
      os_unfair_lock_lock(&self->_groupLock);
      groups = self->_groups;
      uint64_t v18 = [v13 name];
      [(NSMutableDictionary *)groups setObject:v13 forKeyedSubscript:v18];

      os_unfair_lock_unlock(&self->_groupLock);
      long long v19 = [v13 name];
      LOBYTE(v18) = [v19 isEqualToString:_DASDefaultNetworkGroupName];

      if (v18)
      {
        LODWORD(v29) = 1;
      }
      else
      {
        long long v20 = [v13 name];
        unsigned __int8 v21 = [v20 isEqualToString:_DASDefaultGroupName];

        if (v21)
        {
          int v28 = 1;
        }
        else
        {
          id v22 = [v13 name];
          unsigned int v23 = [v22 isEqualToString:_DASDefaultRemoteGroupName];

          HIDWORD(v29) |= v23;
        }
      }
    }
    id v10 = [v8 countByEnumeratingWithState:&v30 objects:v38 count:16];
  }
  while (v10);

  id v4 = v26;
  id v3 = v27;
  unsigned __int8 v5 = v25;
  if ((v29 & v28 & HIDWORD(v29) & 1) == 0) {
    goto LABEL_20;
  }
LABEL_21:
  uint64_t v24 = [v5 allObjects];
  [(_DASDaemon *)self submitActivities:v24];
}

- (void)loadTestingDefaults
{
  id v3 = [(NSUserDefaults *)self->_testingDefaults objectForKey:@"testModeParameters"];
  testModeParameters = self->_testModeParameters;
  self->_testModeParameters = v3;

  uint64_t v5 = [(NSUserDefaults *)self->_testingDefaults objectForKey:@"testModeLastUpdated"];
  id v6 = (void *)v5;
  if (self->_testModeParameters) {
    BOOL v7 = v5 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (!v7)
  {
    id v8 = +[NSDate date];
    [v8 timeIntervalSinceDate:v6];
    if (v9 > 86400.0)
    {
      id v10 = self->_testModeParameters;
      self->_testModeParameters = 0;

      [(NSUserDefaults *)self->_testingDefaults setObject:0 forKey:@"testModeParameters"];
    }
    uint64_t v11 = +[_DASDaemonLogger defaultCategory];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      id v12 = self->_testModeParameters;
      int v24 = 138412290;
      unsigned __int8 v25 = v12;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Test mode parameters: %@", (uint8_t *)&v24, 0xCu);
    }
  }
  int v13 = [(NSUserDefaults *)self->_testingDefaults objectForKey:@"pausedParameters"];
  pausedParameters = self->_pausedParameters;
  self->_pausedParameters = v13;

  if (self->_pausedParameters)
  {
    double v15 = +[_DASDaemonLogger defaultCategory];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      id v16 = self->_pausedParameters;
      int v24 = 138412290;
      unsigned __int8 v25 = v16;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Paused parameters: %@", (uint8_t *)&v24, 0xCu);
    }
  }
  char v17 = [(NSUserDefaults *)self->_testingDefaults objectForKey:@"taskRegistryMode"];
  self->_BOOL taskRegistryMode = v17 != 0;

  if (self->_taskRegistryMode)
  {
    uint64_t v18 = +[_DASDaemonLogger defaultCategory];
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      BOOL taskRegistryMode = self->_taskRegistryMode;
      int v24 = 67109120;
      LODWORD(v25) = taskRegistryMode;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Task Registry Mode: %i", (uint8_t *)&v24, 8u);
    }
  }
  long long v20 = [(NSUserDefaults *)self->_testingDefaults objectForKey:@"taskRegistryProcesses"];
  taskRegistryProcesses = self->_taskRegistryProcesses;
  self->_taskRegistryProcesses = v20;

  if (self->_taskRegistryProcesses)
  {
    id v22 = +[_DASDaemonLogger defaultCategory];
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v23 = self->_taskRegistryProcesses;
      int v24 = 138412290;
      unsigned __int8 v25 = v23;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Task Registry Processes: %@", (uint8_t *)&v24, 0xCu);
    }
  }
}

- (int64_t)capacityFromGroupMax:(int64_t)a3 forPriority:(unint64_t)a4
{
  if (_DASSchedulingPriorityUserInitiatedOvercommit <= a4) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  else {
    return a3 << (_DASSchedulingPriorityUserInitiated <= a4);
  }
}

- (int64_t)currentLoadFromActivities:(id)a3 inGroupWithName:(id)a4
{
  id v5 = a3;
  if ([a4 hasPrefix:@"com.apple.dasd"])
  {
    id v6 = +[NSDate date];
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id v28 = v5;
    id v7 = v5;
    id v8 = [v7 countByEnumeratingWithState:&v29 objects:v37 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v30;
      double v11 = 0.0;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v30 != v10) {
            objc_enumerationMutation(v7);
          }
          int v13 = *(void **)(*((void *)&v29 + 1) + 8 * i);
          uint64_t v14 = [v13 startDate];
          [v14 timeIntervalSinceDate:v6];
          double v16 = v15;

          if (v16 > 0.0)
          {
            char v17 = +[_DASDaemonLogger logForCategory:@"lifecycle(activityGroup)"];
            if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
            {
              unsigned int v23 = [v13 startDate];
              *(_DWORD *)buf = 138412546;
              long long v34 = v13;
              __int16 v35 = 2112;
              __int16 v36 = v23;
              _os_log_debug_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEBUG, "Adjusting start date for %@ to %@", buf, 0x16u);
            }
            uint64_t v18 = [v6 dateByAddingTimeInterval:-300.0];
            [v13 setStartDate:v18];
          }
          long long v19 = [v13 startDate];
          if (v19)
          {
            long long v20 = [v13 startDate];
            [v6 timeIntervalSinceDate:v20];
            double v22 = v21;
          }
          else
          {
            double v22 = 0.0;
          }

          double v11 = v11 + exp(v22 * -0.6931472 / 2700.0);
        }
        id v9 = [v7 countByEnumeratingWithState:&v29 objects:v37 count:16];
      }
      while (v9);
    }
    else
    {
      double v11 = 0.0;
    }

    id v25 = [v7 count];
    double v26 = ceil(v11);
    if (v26 > (double)(unint64_t)v25) {
      double v26 = (double)(unint64_t)v25;
    }
    id v24 = (id)(uint64_t)v26;

    id v5 = v28;
  }
  else
  {
    id v24 = [v5 count];
  }

  return (int64_t)v24;
}

- (int64_t)additionalCapacityForActivity:(id)a3 inGroupWithName:(id)a4 shouldTryToSuspend:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  if (v9)
  {
    os_unfair_lock_lock(&self->_groupLock);
    uint64_t v10 = [(NSMutableDictionary *)self->_groups objectForKeyedSubscript:v9];
    uint64_t v62 = v10;
    if (v10) {
      int64_t v11 = (int64_t)[v10 maxConcurrent];
    }
    else {
      int64_t v11 = 0x7FFFFFFFFFFFFFFFLL;
    }
    os_unfair_lock_unlock(&self->_groupLock);
    os_unfair_lock_lock(&self->_groupLock);
    int v13 = [(NSMutableDictionary *)self->_groupToPrerunningTasks objectForKeyedSubscript:v9];
    id v14 = [v13 copy];
    double v15 = v14;
    if (v14)
    {
      id v16 = v14;
    }
    else
    {
      id v16 = +[NSSet set];
    }
    id v17 = v16;

    uint64_t v18 = [(NSMutableDictionary *)self->_groupToRunningTasks objectForKeyedSubscript:v9];
    id v19 = [v18 copy];
    long long v20 = v19;
    if (v19)
    {
      id v21 = v19;
    }
    else
    {
      id v21 = +[NSSet set];
    }
    double v22 = v21;

    uint64_t v64 = v22;
    unsigned int v65 = v17;
    unsigned int v23 = [v22 setByAddingObjectsFromSet:v17];
    unsigned __int8 v24 = [v23 containsObject:v8];
    long long v63 = v23;
    int64_t v25 = [(_DASDaemon *)self currentLoadFromActivities:v23 inGroupWithName:v9];
    double v26 = +[_DASDaemonLogger logForCategory:@"lifecycle(activityGroup)"];
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412802;
      id v73 = v9;
      __int16 v74 = 2048;
      int64_t v75 = v25;
      __int16 v76 = 2048;
      id v77 = [v65 count];
      _os_log_debug_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEBUG, "%@: Current Load=%lld (Pre-running=%lld)", buf, 0x20u);
    }

    os_unfair_lock_unlock(&self->_groupLock);
    if (v24)
    {
      int64_t v12 = 1;
      id v28 = v22;
      IOPMAssertionID v27 = v65;
      long long v29 = v63;
    }
    else
    {
      if ([v8 requiresNetwork])
      {
        uint64_t v30 = (uint64_t)+[_CDNetworkContext wifiQuality:self->_context];
        id v31 = +[_CDNetworkContext cellQuality:self->_context];
        id v32 = +[_CDNetworkContext cellInterfaceClass:self->_context];
        char v35 = v30 < 1 && (uint64_t)v31 > 0 && v32 == (id)3;
        v11 <<= v35;
      }
      if ([v8 requiresNetwork]
        && ((uint64_t)+[_CDNetworkContext wifiQuality:self->_context] > 50
         || (uint64_t)+[_CDNetworkContext cellQuality:self->_context] > 50
         || (uint64_t)+[_CDNetworkContext wiredQuality:self->_context] >= 51))
      {
        int64_t v11 = -[_DASDaemon capacityFromGroupMax:forPriority:](self, "capacityFromGroupMax:forPriority:", v11, [v8 schedulingPriority]);
      }
      int64_t v12 = v11 - v25;
      unsigned int v66 = +[NSDate now];
      long long v29 = v63;
      id v36 = [v63 mutableCopy];
      id v28 = v22;
      IOPMAssertionID v27 = v65;
      if (v5 && v12 <= 0)
      {
        id v60 = v9;
        id v61 = v36;
        int64_t v59 = v12;
        long long v69 = 0u;
        long long v70 = 0u;
        long long v67 = 0u;
        long long v68 = 0u;
        id v37 = v63;
        id v38 = [v37 countByEnumeratingWithState:&v67 objects:v71 count:16];
        if (v38)
        {
          id v39 = v38;
          uint64_t v40 = *(void *)v68;
          do
          {
            long long v41 = 0;
            do
            {
              if (*(void *)v68 != v40) {
                objc_enumerationMutation(v37);
              }
              long long v42 = *(void **)(*((void *)&v67 + 1) + 8 * (void)v41);
              long long v43 = [v42 suspendRequestDate];

              if (!v43)
              {
                long long v44 = [v42 startDate];
                long long v45 = +[NSDate now];
                unsigned int v46 = [(_DASDaemon *)self shouldSuspendLongRunningActivity:v42 withStartDate:v44 whileBlockingOtherTasks:1 atDate:v45];

                if (v46)
                {
                  uint64_t v47 = +[_DASDaemonLogger logForCategory:@"runtimeLimiter"];
                  if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 138543362;
                    id v73 = v42;
                    _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_DEFAULT, "Group full! Found long running activity %{public}@ to suspend", buf, 0xCu);
                  }

                  [(_DASDaemon *)self updateSuspendRequestDate:v66 forActivity:v42 withReason:@"Limitations"];
                  [(_DASDaemon *)self suspendActivity:v42];
                }
                uint64_t v48 = [v8 fastPass];
                if (v48)
                {
                  uint64_t v49 = (void *)v48;
                  unsigned int v50 = [(_DASDaemon *)self shouldPreemptActivity:v42 forFastPassActivity:v8];

                  if (v50)
                  {
                    uint64_t v51 = +[_DASDaemonLogger defaultCategory];
                    if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)buf = 138543618;
                      id v73 = v42;
                      __int16 v74 = 2114;
                      int64_t v75 = (int64_t)v8;
                      _os_log_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_DEFAULT, "Preempting %{public}@ to unblock the associated fast pass %{public}@", buf, 0x16u);
                    }

                    double v52 = +[NSDate date];
                    [(_DASDaemon *)self updateSuspendRequestDate:v52 forActivity:v42 withReason:@"Preemption"];

                    [(_DASDaemon *)self suspendActivity:v42];
                  }
                }
              }
              long long v41 = (char *)v41 + 1;
            }
            while (v39 != v41);
            id v53 = [v37 countByEnumeratingWithState:&v67 objects:v71 count:16];
            id v39 = v53;
          }
          while (v53);
        }

        id v54 = [v8 schedulingPriority];
        if ((unint64_t)v54 <= _DASSchedulingPriorityDefault)
        {
          unsigned int v55 = 0;
          int64_t v12 = v59;
          id v9 = v60;
          id v28 = v64;
          IOPMAssertionID v27 = v65;
        }
        else
        {
          unsigned int v55 = [(_DASDaemon *)self candidateGroupActivityForPreemption:v37];
          int64_t v12 = v59;
          id v9 = v60;
          id v28 = v64;
          IOPMAssertionID v27 = v65;
          if (v55)
          {
            id v56 = [v8 suspendRequestDate];

            if (!v56)
            {
              dispatch_time_t v57 = +[_DASDaemonLogger defaultCategory];
              if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138543618;
                id v73 = v55;
                __int16 v74 = 2114;
                int64_t v75 = (int64_t)v8;
                _os_log_impl((void *)&_mh_execute_header, v57, OS_LOG_TYPE_DEFAULT, "Preempting %{public}@ to unblock high priority %{public}@", buf, 0x16u);
              }

              [(_DASDaemon *)self updateSuspendRequestDate:v66 forActivity:v55 withReason:@"Preemption"];
              [(_DASDaemon *)self suspendActivity:v55];
            }
          }
        }
        long long v29 = v63;

        id v36 = v61;
      }
    }
  }
  else
  {
    int64_t v12 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v12;
}

- (void)cancelLaunchesOfTypes:(id)a3 forApps:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[NSMutableSet set];
  id v21 = self;
  os_unfair_recursive_lock_lock_with_options();
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id obj = v7;
  id v22 = [obj countByEnumeratingWithState:&v27 objects:v32 count:16];
  if (v22)
  {
    uint64_t v20 = *(void *)v28;
    do
    {
      for (i = 0; i != v22; i = (char *)i + 1)
      {
        if (*(void *)v28 != v20) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void *)(*((void *)&v27 + 1) + 8 * i);
        long long v23 = 0u;
        long long v24 = 0u;
        long long v25 = 0u;
        long long v26 = 0u;
        int64_t v11 = [(NSMutableDictionary *)v21->_applicationLaunchRequests objectForKeyedSubscript:v10];
        id v12 = [v11 countByEnumeratingWithState:&v23 objects:v31 count:16];
        if (v12)
        {
          id v13 = v12;
          uint64_t v14 = *(void *)v24;
          do
          {
            for (j = 0; j != v13; j = (char *)j + 1)
            {
              if (*(void *)v24 != v14) {
                objc_enumerationMutation(v11);
              }
              id v16 = *(void **)(*((void *)&v23 + 1) + 8 * (void)j);
              if (([v16 isContactTracingBackgroundActivity] & 1) == 0)
              {
                id v17 = [v16 launchReason];
                unsigned int v18 = [v6 containsObject:v17];

                if (v18) {
                  [v8 addObject:v16];
                }
              }
            }
            id v13 = [v11 countByEnumeratingWithState:&v23 objects:v31 count:16];
          }
          while (v13);
        }
      }
      id v22 = [obj countByEnumeratingWithState:&v27 objects:v32 count:16];
    }
    while (v22);
  }

  os_unfair_recursive_lock_unlock();
  [(_DASDaemon *)v21 cancelActivities:v8];
}

- (void)cancelPushLaunchTasksForApps:(id)a3
{
  uint64_t v4 = _DASLaunchReasonBackgroundRemoteNotification;
  id v5 = a3;
  id v6 = +[NSSet setWithObject:v4];
  [(_DASDaemon *)self cancelLaunchesOfTypes:v6 forApps:v5];
}

- (void)cancelAppRefreshTasksForApps:(id)a3
{
  uint64_t v4 = _DASLaunchReasonBackgroundRefresh;
  id v5 = a3;
  id v6 = +[NSSet setWithObject:v4];
  [(_DASDaemon *)self cancelLaunchesOfTypes:v6 forApps:v5];
}

- (void)cancelBackgroundTasksForApps:(id)a3
{
  uint64_t v4 = _DASLaunchReasonBackgroundRefresh;
  uint64_t v5 = _DASLaunchReasonBackgroundProcessing;
  uint64_t v6 = _DASLaunchReasonHealthResearch;
  id v7 = a3;
  +[NSSet setWithObjects:](NSSet, "setWithObjects:", v4, v5, v6, 0);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  [(_DASDaemon *)self cancelLaunchesOfTypes:v8 forApps:v7];
}

- (void)cancelContactTracingTasksForApps:(id)a3
{
  id v4 = a3;
  uint64_t v5 = +[NSMutableSet set];
  p_applicationLaunchRequestsLock = &self->_applicationLaunchRequestsLock;
  os_unfair_recursive_lock_lock_with_options();
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id obj = v4;
  id v6 = [obj countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v24;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v24 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void *)(*((void *)&v23 + 1) + 8 * i);
        long long v19 = 0u;
        long long v20 = 0u;
        long long v21 = 0u;
        long long v22 = 0u;
        int64_t v11 = -[NSMutableDictionary objectForKeyedSubscript:](self->_applicationLaunchRequests, "objectForKeyedSubscript:", v10, p_applicationLaunchRequestsLock);
        id v12 = [v11 countByEnumeratingWithState:&v19 objects:v27 count:16];
        if (v12)
        {
          id v13 = v12;
          uint64_t v14 = *(void *)v20;
          do
          {
            for (j = 0; j != v13; j = (char *)j + 1)
            {
              if (*(void *)v20 != v14) {
                objc_enumerationMutation(v11);
              }
              id v16 = *(void **)(*((void *)&v19 + 1) + 8 * (void)j);
              if ([v16 isContactTracingBackgroundActivity]) {
                [v5 addObject:v16];
              }
            }
            id v13 = [v11 countByEnumeratingWithState:&v19 objects:v27 count:16];
          }
          while (v13);
        }
      }
      id v7 = [obj countByEnumeratingWithState:&v23 objects:v28 count:16];
    }
    while (v7);
  }

  os_unfair_recursive_lock_unlock();
  [(_DASDaemon *)self cancelActivities:v5];
}

- (void)cancelAllBackgroundTasks
{
  id v3 = +[NSMutableSet set];
  os_unfair_recursive_lock_lock_with_options();
  applicationLaunchRequests = self->_applicationLaunchRequests;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000B2ED8;
  v6[3] = &unk_100177B58;
  id v7 = v3;
  id v5 = v3;
  [(NSMutableDictionary *)applicationLaunchRequests enumerateKeysAndObjectsUsingBlock:v6];

  os_unfair_recursive_lock_unlock();
  [(_DASDaemon *)self cancelActivities:v5];
}

- (void)delayLaunchesOfType:(id)a3 forApps:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = +[NSDate date];
  long long v33 = self;
  p_applicationLaunchRequestsLock = &self->_applicationLaunchRequestsLock;
  uint64_t v10 = (void *)v8;
  id v31 = p_applicationLaunchRequestsLock;
  os_unfair_recursive_lock_lock_with_options();
  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id v11 = v7;
  id v34 = [v11 countByEnumeratingWithState:&v43 objects:v48 count:16];
  if (v34)
  {
    uint64_t v32 = *(void *)v44;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v44 != v32) {
          objc_enumerationMutation(v11);
        }
        uint64_t v35 = v12;
        uint64_t v13 = *(void *)(*((void *)&v43 + 1) + 8 * v12);
        uint64_t v14 = -[NSMutableDictionary objectForKeyedSubscript:](v33->_applicationLaunchRequests, "objectForKeyedSubscript:", v13, v31);
        long long v39 = 0u;
        long long v40 = 0u;
        long long v41 = 0u;
        long long v42 = 0u;
        id v38 = [v14 countByEnumeratingWithState:&v39 objects:v47 count:16];
        if (v38)
        {
          uint64_t v15 = *(void *)v40;
          id v36 = v14;
          uint64_t v37 = *(void *)v40;
          do
          {
            for (i = 0; i != v38; i = (char *)i + 1)
            {
              if (*(void *)v40 != v15) {
                objc_enumerationMutation(v14);
              }
              id v17 = *(void **)(*((void *)&v39 + 1) + 8 * i);
              unsigned int v18 = [v17 launchReason];
              unsigned int v19 = [v18 isEqualToString:v6];

              if (v19)
              {
                long long v20 = [v17 startAfter];
                long long v21 = [v11 objectForKeyedSubscript:v13];
                [v21 doubleValue];
                long long v22 = [v10 dateByAddingTimeInterval:];

                [v22 timeIntervalSinceDate:v20];
                if (v23 > 0.0)
                {
                  double v24 = v23;
                  [v17 setStartAfter:v22];
                  long long v25 = [v17 startBefore];
                  [v25 dateByAddingTimeInterval:v24];
                  uint64_t v26 = v13;
                  id v27 = v6;
                  id v28 = v11;
                  v30 = long long v29 = v10;
                  [v17 setStartBefore:v30];

                  uint64_t v10 = v29;
                  id v11 = v28;
                  id v6 = v27;
                  uint64_t v13 = v26;
                  uint64_t v14 = v36;
                }
                uint64_t v15 = v37;
              }
            }
            id v38 = [v14 countByEnumeratingWithState:&v39 objects:v47 count:16];
          }
          while (v38);
        }

        uint64_t v12 = v35 + 1;
      }
      while ((id)(v35 + 1) != v34);
      id v34 = [v11 countByEnumeratingWithState:&v43 objects:v48 count:16];
    }
    while (v34);
  }

  os_unfair_recursive_lock_unlock();
}

- (BOOL)addLaunchRequest:(id)a3
{
  id v4 = a3;
  id v5 = [v4 relatedApplications];
  id v6 = [v5 count];

  if (!v6)
  {
    BOOL v28 = 1;
    goto LABEL_48;
  }
  id v7 = [v4 relatedApplications];
  uint64_t v8 = [v7 firstObject];

  p_applicationLaunchRequestsLock = &self->_applicationLaunchRequestsLock;
  os_unfair_recursive_lock_lock_with_options();
  unsigned int v10 = [v4 requestsExtensionLaunch];
  uint64_t v11 = 136;
  if (v10) {
    uint64_t v11 = 152;
  }
  id v12 = *(id *)((char *)&self->super.isa + v11);
  uint64_t v13 = +[_DASDaemonLogger defaultCategory];
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v14 = [v4 launchReason];
    *(_DWORD *)buf = 138412802;
    uint64_t v51 = v14;
    __int16 v52 = 2112;
    id v53 = v8;
    __int16 v54 = 2112;
    id v55 = v4;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Adding a launch request (%@) for application %@ by activity %@", buf, 0x20u);
  }
  uint64_t v15 = [v12 objectForKeyedSubscript:v8];
  id v16 = +[_DASDaemonLogger defaultCategory];
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    uint64_t v51 = v8;
    __int16 v52 = 2112;
    id v53 = v15;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Pre-existing launch requests for %@: %@", buf, 0x16u);
  }

  if (!v15)
  {
    uint64_t v15 = +[NSMutableSet set];
    [v12 setObject:v15 forKeyedSubscript:v8];
  }
  buf[0] = 1;
  if (![v4 isBackgroundTaskActivity])
  {
    long long v42 = 0uLL;
    long long v43 = 0uLL;
    long long v40 = 0uLL;
    long long v41 = 0uLL;
    id v29 = v15;
    id v35 = [v29 countByEnumeratingWithState:&v40 objects:v48 count:16];
    if (!v35) {
      goto LABEL_37;
    }
    id v38 = &self->_applicationLaunchRequestsLock;
    uint64_t v30 = *(void *)v41;
    while (1)
    {
      for (i = 0; i != v35; i = (char *)i + 1)
      {
        if (*(void *)v41 != v30) {
          objc_enumerationMutation(v29);
        }
        uint64_t v32 = *(void **)(*((void *)&v40 + 1) + 8 * i);
        if (objc_msgSend(v32, "isIdenticalLaunchTo:", v4, v38))
        {
          if (![v4 overwritesPrevious])
          {
            os_unfair_recursive_lock_unlock();

            id v35 = 0;
            BOOL v28 = 0;
            goto LABEL_47;
          }
          id v35 = v32;
          long long v33 = [v35 startAfter];
          [v4 setStartAfter:v33];

          id v34 = [v35 startBefore];
          [v4 setStartBefore:v34];

LABEL_37:
          goto LABEL_43;
        }
      }
      id v35 = [v29 countByEnumeratingWithState:&v40 objects:v48 count:16];
      if (!v35) {
        goto LABEL_37;
      }
    }
  }
  long long v46 = 0uLL;
  long long v47 = 0uLL;
  long long v44 = 0uLL;
  long long v45 = 0uLL;
  id v17 = v15;
  id v18 = [v17 countByEnumeratingWithState:&v44 objects:v49 count:16];
  if (!v18)
  {
    id v35 = 0;
    goto LABEL_42;
  }
  id v19 = v18;
  uint64_t v20 = *(void *)v45;
  long long v39 = v8;
  while (2)
  {
    long long v21 = self;
    id v22 = v12;
    double v23 = p_applicationLaunchRequestsLock;
    for (j = 0; j != v19; j = (char *)j + 1)
    {
      if (*(void *)v45 != v20) {
        objc_enumerationMutation(v17);
      }
      long long v25 = *(void **)(*((void *)&v44 + 1) + 8 * (void)j);
      unsigned int v26 = [v4 shouldReplaceActivity:v25 andKeepsSubmitted:buf];
      if (buf[0]) {
        BOOL v27 = v26 == 0;
      }
      else {
        BOOL v27 = 1;
      }
      if (!v27)
      {
        id v35 = v25;
LABEL_41:
        id v12 = v22;
        self = v21;
        uint64_t v8 = v39;
        goto LABEL_42;
      }
      if (!buf[0])
      {
        id v35 = 0;
        goto LABEL_41;
      }
    }
    id v19 = [v17 countByEnumeratingWithState:&v44 objects:v49 count:16];
    id v35 = 0;
    p_applicationLaunchRequestsLock = v23;
    id v12 = v22;
    self = v21;
    uint64_t v8 = v39;
    if (v19) {
      continue;
    }
    break;
  }
LABEL_42:

  if (buf[0]) {
LABEL_43:
  }
    [v15 _DAS_addOrReplaceObject:v4];
  os_unfair_recursive_lock_unlock();
  if (v35)
  {
    id v36 = +[NSSet setWithObject:v35];
    [(_DASDaemon *)self cancelActivities:v36];
  }
  BOOL v28 = buf[0] != 0;
LABEL_47:

LABEL_48:
  return v28;
}

- (void)removeLaunchRequest:(id)a3
{
  id v4 = a3;
  id v5 = [v4 relatedApplications];
  id v6 = [v5 count];

  if (v6)
  {
    id v7 = [v4 relatedApplications];
    uint64_t v8 = [v7 firstObject];

    os_unfair_recursive_lock_lock_with_options();
    unsigned int v9 = [v4 requestsExtensionLaunch];
    uint64_t v10 = 136;
    if (v9) {
      uint64_t v10 = 152;
    }
    id v11 = *(id *)((char *)&self->super.isa + v10);
    id v12 = +[_DASDaemonLogger defaultCategory];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 138412546;
      id v17 = v8;
      __int16 v18 = 2112;
      id v19 = v4;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Removing a launch request for application %@ by activity %@", (uint8_t *)&v16, 0x16u);
    }

    uint64_t v13 = [v11 objectForKeyedSubscript:v8];
    [v13 removeObject:v4];

    uint64_t v14 = [v11 objectForKeyedSubscript:v8];
    id v15 = [v14 count];

    if (!v15) {
      [v11 removeObjectForKey:v8];
    }

    os_unfair_recursive_lock_unlock();
  }
}

- (unint64_t)requestCountForApplication:(id)a3
{
  id v4 = a3;
  os_unfair_recursive_lock_lock_with_options();
  id v5 = [(NSMutableDictionary *)self->_applicationLaunchRequests objectForKeyedSubscript:v4];

  id v6 = [v5 count];
  os_unfair_recursive_lock_unlock();
  return (unint64_t)v6;
}

- (void)start
{
  [(_DASDaemon *)self loadState];
  id v3 = +[_DASDaemonLogger defaultCategory];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Creating _DASBGSystemTaskHelper", buf, 2u);
  }

  id v4 = +[_DASBGSystemTaskHelper sharedInstance];
  [v4 startWithListener:self->_bgstListener];

  id v5 = +[_DASDaemonLogger defaultCategory];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Activating listener", buf, 2u);
  }

  [(NSXPCListener *)self->_listener activate];
  [(_DASDaemon *)self solicitActivityResubmission];
  +[_DASDataCollectionTasks schedule];
  +[_DASAutoBugCaptureHelper schedule];
  id v6 = +[_DASSmartPowerNapMonitor sharedMonitorWithDaemon:self];
  smartPowerNapMonitor = self->_smartPowerNapMonitor;
  self->_smartPowerNapMonitor = v6;

  if (+[_DASConfig isiPhone])
  {
    uint64_t v8 = +[_DASCPMModeMonitor sharedMonitor];
    cpmModeMonitor = self->_cpmModeMonitor;
    self->_cpmModeMonitor = v8;
  }
  uint64_t v10 = +[_DASRemoteDeviceNearbyMonitor sharedMonitorWithDaemon:self];
  remoteDeviceNearbyMonitor = self->_remoteDeviceNearbyMonitor;
  self->_remoteDeviceNearbyMonitor = v10;

  id v12 = +[_DASRemoteDeviceWakeMonitor sharedMonitorWithDaemon:self];
  remoteDeviceWakeMonitor = self->_remoteDeviceWakeMonitor;
  self->_remoteDeviceWakeMonitor = v12;

  uint64_t v14 = +[_DASDiskSpaceMonitor sharedMonitorWithDaemon:self];
  diskSpaceMonitor = self->_diskSpaceMonitor;
  self->_diskSpaceMonitor = v14;

  int v16 = +[_DASRemoteDeviceActivityMonitor sharedMonitorWithDaemon:self];
  remoteDeviceActivityMonitor = self->_remoteDeviceActivityMonitor;
  self->_remoteDeviceActivityMonitor = v16;

  __int16 v18 = +[_DASBacklightStateMonitor sharedInstance];
  backlightStateMonitor = self->_backlightStateMonitor;
  self->_backlightStateMonitor = v18;

  uint64_t v20 = +[_DASActivityRateLimitManager sharedLimiter];
  rateLimiter = self->_rateLimiter;
  self->_rateLimiter = v20;

  id v22 = +[_DASRuntimeLimiter sharedLimiter];
  runtimeLimiter = self->_runtimeLimiter;
  self->_runtimeLimiter = v22;

  double v24 = +[_DASConfigurationLimiter sharedLimiter];
  configurationLimiter = self->_configurationLimiter;
  self->_configurationLimiter = v24;

  *(_DWORD *)buf = 0;
  evaluationQueue = self->_evaluationQueue;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_1000B3DF8;
  handler[3] = &unk_1001759D0;
  void handler[4] = self;
  notify_register_dispatch("com.apple.sysdiagnose.sysdiagnoseStarted", (int *)buf, evaluationQueue, handler);
  BOOL v27 = dlopen_preflight("/System/Library/Frameworks/UIKit.framework/UIKit");
  byte_1001C43C8 = v27;
  if (v27)
  {
    BOOL v28 = +[_DASBlueListManager managerWithContext:self->_context];
    blueListManager = self->_blueListManager;
    self->_blueListManager = v28;

    uint64_t v30 = dispatch_queue_attr_make_with_autorelease_frequency((dispatch_queue_attr_t)&_dispatch_queue_attr_concurrent, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    id v31 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.duetactivityscheduler.activityLaunchQueue", v30);
    activityLaunchQueue = self->_activityLaunchQueue;
    self->_activityLaunchQueue = v31;

    long long v33 = +[_DASBARScheduler barSchedulerWithScheduler:self];
    barScheduler = self->_barScheduler;
    self->_barScheduler = v33;

    id v35 = os_transaction_create();
    [(_DASBARScheduler *)self->_barScheduler start];
    [(_DASDaemon *)self registerForTrial];
    [(_DASDaemon *)self updateTrialParameters];
    if (self->_recomEngineDisabled)
    {
      id v36 = +[_DASSwapPredictionManager sharedInstance];
      swapManager = self->_swapManager;
      self->_swapManager = v36;

      [(_DASSwapPredictionManager *)self->_swapManager start];
    }
    else
    {
      id v38 = +[_APRSManager sharedInstance];
      appResumeManager = self->_appResumeManager;
      self->_appResumeManager = v38;
    }
    long long v40 = objc_alloc_init(_DASClosureManager);
    closureManager = self->_closureManager;
    self->_closureManager = v40;
  }
  else
  {
    id v35 = +[_DASDaemonLogger logForCategory:@"bar"];
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long v46 = 0;
      _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "UIKit framework not found...", v46, 2u);
    }
  }

  long long v42 = +[_DASENManager manager];
  enManager = self->_enManager;
  self->_enManager = v42;

  +[_DASENManager schedulePeriodicRelaunchTask];
  long long v44 = +[_DASCheckpointRecorder sharedInstance];
  [v44 registerReportTaskInfoTask];

  long long v45 = +[_DASCheckpointRecorder sharedInstance];
  [v45 registerFeatureStatusTask];
}

- (void)handleSysdiagnoseStartEvent
{
  id v3 = +[_DASDaemonLogger defaultCategory];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Sysdiagnose started, suspending running tasks if any", buf, 2u);
  }

  os_unfair_recursive_lock_lock_with_options();
  id v4 = +[NSMutableSet set];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = self->_runningTasks;
  id v6 = [(NSMutableSet *)v5 countByEnumeratingWithState:&v14 objects:v19 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        id v11 = [v10 suspendRequestDate];
        if (v11)
        {
        }
        else
        {
          id v12 = [v10 schedulingPriority];
          if ((unint64_t)v12 < _DASSchedulingPriorityUserInitiated
            || [v10 isIntensive])
          {
            uint64_t v13 = +[NSDate now];
            [(_DASDaemon *)self updateSuspendRequestDate:v13 forActivity:v10 withReason:@"Sysdiagnose"];

            [v4 addObject:v10];
          }
        }
      }
      id v7 = [(NSMutableSet *)v5 countByEnumeratingWithState:&v14 objects:v19 count:16];
    }
    while (v7);
  }

  if ([v4 count]) {
    [(_DASDaemon *)self suspendActivities:v4];
  }
  os_unfair_recursive_lock_unlock();
}

- (unint64_t)submittedTaskCount
{
  os_unfair_recursive_lock_lock_with_options();
  id v3 = [(NSMutableSet *)self->_pendingTasks count];
  os_unfair_recursive_lock_unlock();
  return (unint64_t)v3;
}

- (id)allPendingTasks
{
  os_unfair_recursive_lock_lock_with_options();
  id v3 = [(NSMutableSet *)self->_pendingTasks copy];
  os_unfair_recursive_lock_unlock();

  return v3;
}

- (id)allPendingRestartTasks
{
  id v3 = +[NSMutableSet set];
  id v4 = self->_triggerToActivitiesMap;
  objc_sync_enter(v4);
  id v5 = [(NSMutableDictionary *)self->_triggerToActivitiesMap objectForKeyedSubscript:@"com.apple.duetactivityscheduler.restartpolicy.assertionsheld"];
  if (v5) {
    [v3 unionSet:v5];
  }

  objc_sync_exit(v4);

  return v3;
}

- (id)allPendingPushLaunchTasks
{
  id v3 = +[NSMutableSet set];
  os_unfair_recursive_lock_lock_with_options();
  applicationLaunchRequests = self->_applicationLaunchRequests;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000B423C;
  v7[3] = &unk_100177B58;
  id v5 = v3;
  id v8 = v5;
  [(NSMutableDictionary *)applicationLaunchRequests enumerateKeysAndObjectsUsingBlock:v7];

  os_unfair_recursive_lock_unlock();

  return v5;
}

- (id)allPendingBackgroundTasks
{
  id v3 = +[NSMutableSet set];
  os_unfair_recursive_lock_lock_with_options();
  applicationLaunchRequests = self->_applicationLaunchRequests;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000B4448;
  v7[3] = &unk_100177B58;
  id v5 = v3;
  id v8 = v5;
  [(NSMutableDictionary *)applicationLaunchRequests enumerateKeysAndObjectsUsingBlock:v7];

  os_unfair_recursive_lock_unlock();

  return v5;
}

- (id)allPendingSyncOnBackupTasks
{
  id v3 = +[NSMutableSet set];
  os_unfair_recursive_lock_lock_with_options();
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v4 = self->_pendingTasks;
  id v5 = [(NSMutableSet *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        unsigned int v9 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if (objc_msgSend(v9, "userRequestedBackupTask", (void)v11)) {
          [v3 addObject:v9];
        }
      }
      id v6 = [(NSMutableSet *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  os_unfair_recursive_lock_unlock();

  return v3;
}

- (id)allTimewiseEligibleNetworkTasksAllowingCell:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = +[NSMutableSet set];
  id v6 = +[NSDate date];
  uint64_t v7 = self->_triggerToActivitiesMap;
  objc_sync_enter(v7);
  id v8 = [(NSMutableDictionary *)self->_triggerToActivitiesMap objectForKeyedSubscript:@"com.apple.duetactivityscheduler.nwstatus.wifi"];
  unsigned int v9 = v8;
  if (v8)
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v10 = v8;
    id v11 = [v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v17;
      do
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v17 != v12) {
            objc_enumerationMutation(v10);
          }
          long long v14 = *(void **)(*((void *)&v16 + 1) + 8 * i);
          if ((objc_msgSend(v14, "timewiseEligibleAtDate:", v6, (void)v16) & v3) == 1
            && ([v14 requiresInexpensiveNetworking] & 1) == 0)
          {
            [v5 addObject:v14];
          }
        }
        id v11 = [v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v11);
    }
  }
  objc_sync_exit(v7);

  return v5;
}

- (id)startedTasks
{
  os_unfair_recursive_lock_lock_with_options();
  id v3 = [(NSMutableSet *)self->_runningTasks copy];
  os_unfair_recursive_lock_unlock();

  return v3;
}

- (id)allPrerunningTasks
{
  os_unfair_recursive_lock_lock_with_options();
  id v3 = [(NSMutableSet *)self->_prerunningTasks copy];
  os_unfair_recursive_lock_unlock();

  return v3;
}

- (id)allTasks
{
  id v3 = +[NSMutableSet set];
  os_unfair_recursive_lock_lock_with_options();
  [v3 unionSet:self->_prerunningTasks];
  [v3 unionSet:self->_runningTasks];
  [v3 unionSet:self->_pendingTasks];
  os_unfair_recursive_lock_unlock();
  id v4 = [v3 copy];

  return v4;
}

- (void)createDefaultActivityGroups
{
  id v3 = +[_DASDaemonLogger defaultCategory];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412290;
    uint64_t v10 = _DASDefaultNetworkGroupName;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Creating %@", (uint8_t *)&v9, 0xCu);
  }

  id v4 = +[_DASActivityGroup groupWithName:_DASDefaultNetworkGroupName maxConcurrent:qword_1001C31D0];
  [(_DASDaemon *)self createActivityGroup:v4];
  id v5 = +[_DASDaemonLogger defaultCategory];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412290;
    uint64_t v10 = _DASDefaultGroupName;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Creating %@", (uint8_t *)&v9, 0xCu);
  }

  id v6 = +[_DASActivityGroup groupWithName:_DASDefaultGroupName maxConcurrent:qword_1001C31C8];
  [(_DASDaemon *)self createActivityGroup:v6];
  uint64_t v7 = +[_DASDaemonLogger defaultCategory];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412290;
    uint64_t v10 = _DASDefaultRemoteGroupName;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Creating %@", (uint8_t *)&v9, 0xCu);
  }

  id v8 = +[_DASActivityGroup groupWithName:_DASDefaultRemoteGroupName maxConcurrent:10];
  [(_DASDaemon *)self createActivityGroup:v8];
}

- (NSString)description
{
  os_unfair_recursive_lock_lock_with_options();
  id v3 = [(NSMutableSet *)self->_runningTasks description];
  os_unfair_recursive_lock_unlock();
  id v4 = +[NSString stringWithFormat:@"<%@: Listener: %@, Clients: %@, Started Tasks: %@", objc_opt_class(), self->_listener, self->_clients, v3];

  return (NSString *)v4;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  objc_sync_enter(v8);
  if ([v6 isEqual:v8->_listener])
  {
    int v9 = [v7 valueForEntitlement:@"com.apple.duet.activityscheduler.allow"];
    uint64_t v10 = [v7 valueForEntitlement:@"application-identifier"];
    if (+[_DASConfig isInternalBuild]
      && ([v10 isEqualToString:@"com.apple.Preferences"] & 1) != 0
      || v9 && ([v9 BOOLValue] & 1) != 0)
    {
      uint64_t v11 = 0;
    }
    else
    {
      uint64_t v12 = +[_DASDaemonLogger defaultCategory];
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        int v16 = 138412290;
        id v17 = v7;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "Creating restricted client for connection %@", (uint8_t *)&v16, 0xCu);
      }

      uint64_t v11 = 1;
    }
  }
  else
  {
    if (![v6 isEqual:v8->_bgstListener])
    {
      uint64_t v11 = 0;
      goto LABEL_17;
    }
    int v9 = +[_DASDaemonLogger defaultCategory];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 138412290;
      id v17 = v7;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Creating unrestricted client connection for BGSTHelper %@", (uint8_t *)&v16, 0xCu);
    }
    uint64_t v11 = 0;
  }

LABEL_17:
  long long v13 = +[_DASDaemonClient clientForDaemon:v8 withConnection:v7 isRestricted:v11];
  long long v14 = v8->_clients;
  objc_sync_enter(v14);
  [(NSMutableArray *)v8->_clients addObject:v13];
  objc_sync_exit(v14);

  objc_sync_exit(v8);
  return 1;
}

- (void)removeClient:(id)a3
{
  id v12 = a3;
  id v4 = self->_clients;
  objc_sync_enter(v4);
  [(NSMutableArray *)self->_clients removeObject:v12];
  objc_sync_exit(v4);

  id v5 = self->_connectedBGTaskClients;
  objc_sync_enter(v5);
  id v6 = [v12 connection];
  id v7 = [v6 processIdentifier];

  connectedBGTaskClients = self->_connectedBGTaskClients;
  int v9 = +[NSNumber numberWithInt:v7];
  [(NSMutableDictionary *)connectedBGTaskClients removeObjectForKey:v9];

  activitiesWaitingForBGTaskClients = self->_activitiesWaitingForBGTaskClients;
  uint64_t v11 = +[NSNumber numberWithInt:v7];
  [(NSMutableDictionary *)activitiesWaitingForBGTaskClients removeObjectForKey:v11];

  objc_sync_exit(v5);
}

- (void)allClientsDo:(id)a3
{
  id v4 = (void (**)(id, void))a3;
  id v5 = self->_clients;
  objc_sync_enter(v5);
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v6 = self->_clients;
  id v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v11;
    do
    {
      int v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v6);
        }
        v4[2](v4, *(void *)(*((void *)&v10 + 1) + 8 * (void)v9));
        int v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }

  objc_sync_exit(v5);
}

- (id)clientForActivity:(id)a3
{
  id v4 = a3;
  id v5 = self->_clients;
  objc_sync_enter(v5);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v6 = self->_clients;
  id v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v16;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v6);
        }
        long long v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        long long v11 = [v10 startedTasks:v15];
        objc_sync_enter(v11);
        long long v12 = [v10 startedTasks];
        unsigned int v13 = [v12 containsObject:v4];

        if (v13)
        {
          id v7 = v10;
          objc_sync_exit(v11);

          goto LABEL_11;
        }
        objc_sync_exit(v11);
      }
      id v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  objc_sync_exit(v5);

  return v7;
}

- (void)runLocalActivity:(id)a3
{
  id v4 = a3;
  id v5 = +[NSSet setWithObject:v4];
  [(_DASDaemon *)self handleRunningActivities:v5];

  id v6 = [v4 handlerQueue];
  launchQueue = v6;
  if (!v6) {
    launchQueue = self->_launchQueue;
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000B540C;
  block[3] = &unk_1001754F8;
  id v10 = v4;
  id v8 = v4;
  dispatch_async(launchQueue, block);
}

- (void)runActivities:(id)a3
{
  id v3 = a3;
  id v4 = +[_DASDaemonLogger logForCategory:@"lifecycle"];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v72 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Running activities : %@", buf, 0xCu);
  }

  long long v40 = +[NSMutableSet set];
  long long v44 = +[NSMutableSet set];
  long long v68 = 0u;
  long long v69 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  id obj = v3;
  id v5 = [obj countByEnumeratingWithState:&v66 objects:v76 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v67;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v67 != v6) {
          objc_enumerationMutation(obj);
        }
        id v8 = *(void **)(*((void *)&v66 + 1) + 8 * i);
        [(_DASDaemon *)self reportActivityTiming:v8];
        [(_DASDaemon *)self reportOversizeLoadSymptomForActivity:v8 atStart:1];
        unsigned int v9 = [v8 delayedStart];
        id v10 = v44;
        if (v9)
        {
          long long v11 = +[_DASDaemonLogger logForCategory:@"lifecycle"];
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            id v72 = v8;
            _os_log_debug_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "Activity %@ has delayed start", buf, 0xCu);
          }

          id v10 = v40;
        }
        [v10 addObject:v8];
      }
      id v5 = [obj countByEnumeratingWithState:&v66 objects:v76 count:16];
    }
    while (v5);
  }

  if ([v44 count])
  {
    v64[0] = _NSConcreteStackBlock;
    v64[1] = 3221225472;
    v64[2] = sub_1000B5F64;
    v64[3] = &unk_100177B80;
    id v12 = v44;
    id v65 = v12;
    [(_DASDaemon *)self allClientsDo:v64];
    long long v62 = 0u;
    long long v63 = 0u;
    long long v60 = 0u;
    long long v61 = 0u;
    id v42 = v12;
    id v13 = [v42 countByEnumeratingWithState:&v60 objects:v75 count:16];
    if (!v13) {
      goto LABEL_37;
    }
    uint64_t v14 = *(void *)v61;
    while (1)
    {
      for (j = 0; j != v13; j = (char *)j + 1)
      {
        if (*(void *)v61 != v14) {
          objc_enumerationMutation(v42);
        }
        long long v16 = *(void **)(*((void *)&v60 + 1) + 8 * (void)j);
        if (![v16 isContinuedProcessingTask])
        {
LABEL_34:
          [(_DASDaemon *)self createAssertion:v16];
          continue;
        }
        long long v17 = -[_DASAssertionArbiter createUnmanagedAssertionForActivity:targetPID:](self->_assertionArbiter, "createUnmanagedAssertionForActivity:targetPID:", v16, [v16 pid]);
        if (v17)
        {
          objc_initWeak(&location, v17);
          v57[0] = _NSConcreteStackBlock;
          v57[1] = 3221225472;
          v57[2] = sub_1000B5F70;
          v57[3] = &unk_100177BA8;
          objc_copyWeak(&v58, &location);
          v57[4] = self;
          v57[5] = v16;
          [v17 setWarningHandler:v57];
          v55[0] = _NSConcreteStackBlock;
          v55[1] = 3221225472;
          v55[2] = sub_1000B6064;
          v55[3] = &unk_100177BD0;
          objc_copyWeak(&v56, &location);
          v55[4] = self;
          v55[5] = v16;
          [v17 setInvalidationHandler:v55];
          id v54 = 0;
          unsigned __int8 v18 = [v17 acquireWithError:&v54];
          id v19 = v54;
          if (v19) {
            unsigned __int8 v20 = 0;
          }
          else {
            unsigned __int8 v20 = v18;
          }
          if (v20)
          {
            [v16 setAssertion:v17];
            long long v21 = +[_DASDaemonLogger logForCategory:@"BackgroundTasks"];
            if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412546;
              id v72 = v17;
              __int16 v73 = 2112;
              id v74 = v16;
              _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Successfully acquired %@ for %@", buf, 0x16u);
            }
          }
          else
          {
            long long v21 = +[_DASDaemonLogger logForCategory:@"BackgroundTasks"];
            if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412546;
              id v72 = v17;
              __int16 v73 = 2112;
              id v74 = v19;
              _os_log_error_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "Failed to acquire %@ with error: %@", buf, 0x16u);
            }
          }

          objc_destroyWeak(&v56);
          objc_destroyWeak(&v58);
          objc_destroyWeak(&location);

          if (v20) {
            goto LABEL_34;
          }
        }
        else
        {
          id v22 = +[_DASDaemonLogger logForCategory:@"BackgroundTasks"];
          if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            id v72 = v16;
            _os_log_error_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "Unable to create assertion for %@", buf, 0xCu);
          }
        }
      }
      id v13 = [v42 countByEnumeratingWithState:&v60 objects:v75 count:16];
      if (!v13)
      {
LABEL_37:

        break;
      }
    }
  }
  if ([v40 count])
  {
    v52[0] = _NSConcreteStackBlock;
    v52[1] = 3221225472;
    v52[2] = sub_1000B62FC;
    v52[3] = &unk_100177B80;
    id v53 = v40;
    [(_DASDaemon *)self allClientsDo:v52];
  }
  long long v50 = 0u;
  long long v51 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  id v41 = obj;
  id obja = [v41 countByEnumeratingWithState:&v48 objects:v70 count:16];
  if (obja)
  {
    uint64_t v43 = *(void *)v49;
    do
    {
      for (k = 0; k != obja; k = (char *)k + 1)
      {
        if (*(void *)v49 != v43) {
          objc_enumerationMutation(v41);
        }
        double v24 = *(void **)(*((void *)&v48 + 1) + 8 * (void)k);
        long long v25 = [v24 startHandler];

        if (v25)
        {
          [(_DASDaemon *)self runLocalActivity:v24];
        }
        else if (([v24 requestsApplicationLaunch] & 1) == 0)
        {
          unsigned int v26 = [v24 widgetID];
          if (v26)
          {
          }
          else if (([v24 delayedStart] & 1) == 0)
          {
            BOOL v27 = +[_DASPLLogger sharedInstance];
            [v27 recordActivityLifeCycleStart:v24];

            [(_DASDaemon *)self recordToTaskRegistry:v24 lifeCycleStateName:@"started"];
          }
        }
        if (+[_DASPhotosPolicy isiCPLActivity:v24])
        {
          BOOL v28 = +[_DASDaemonLogger defaultCategory];
          if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
          {
            id v29 = +[NSNumber numberWithUnsignedInteger:self->_photosIsBlocked];
            *(_DWORD *)buf = 138543618;
            id v72 = v24;
            __int16 v73 = 2112;
            id v74 = v29;
            _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "Reporting photos activity no longer blocked: %{public}@ (was %@)", buf, 0x16u);
          }
          [(_DASDaemon *)self updateiCPLTasksBlocked:0];
          if (_os_feature_enabled_impl()
            && +[_DASPhotosPolicy isPhotosSyncActivity:v24]
            && [(_DASRemoteDeviceActivityMonitor *)self->_remoteDeviceActivityMonitor isRegistered])
          {
            [(_DASRemoteDeviceActivityMonitor *)self->_remoteDeviceActivityMonitor unregisterForRemoteDeviceActiveNotifications];
          }
        }
        if ([v24 isContinuedProcessingTask])
        {
          uint64_t v30 = +[_DASContinuedProcessingTaskUIClient sharedClient];
          id v31 = [v24 uuid];
          uint64_t v32 = [v24 relatedApplications];
          long long v33 = [v32 firstObject];
          id v34 = [v24 clientProvidedIconBundleIdentifier];
          id v35 = [v24 clientProvidedTitle];
          id v36 = [v24 clientProvidedReason];
          uint64_t v37 = [v24 progress];
          [v30 startActivityForIdentifier:v31 bundleIdentifier:v33 imageUTI:v34 activityName:v35 activityDescription:v36 progress:v37];
        }
        id v38 = +[NSDate date];
        if ([v24 overdueAtDate:v38])
        {
          if (([v24 requiresPlugin] & 1) == 0) {
            +[_DASMetricRecorder incrementOccurrencesForKey:@"com.apple.das.missedDeadlineCount.nonPlugin" byCount:1];
          }
          if (([v24 requiresNetwork] & 1) == 0) {
            +[_DASMetricRecorder incrementOccurrencesForKey:@"com.apple.das.missedDeadlineCount.nonNetwork" byCount:1];
          }
          if (([v24 requiresNetwork] & 1) == 0
            && ([v24 requiresPlugin] & 1) == 0)
          {
            +[_DASMetricRecorder incrementOccurrencesForKey:@"com.apple.das.missedDeadlineCount.nonPluginNetwork" byCount:1];
          }
          +[_DASMetricRecorder incrementOccurrencesForKey:@"com.apple.das.missedDeadlineCount" byCount:1];
        }
      }
      id obja = [v41 countByEnumeratingWithState:&v48 objects:v70 count:16];
    }
    while (obja);
  }
}

- (void)runActivitiesAndRemoveUnknown:(id)a3
{
  id v4 = a3;
  [(_DASDaemon *)self runActivities:v4];
  id v5 = +[NSMutableSet set];
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v45 objects:v54 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v46;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v46 != v9) {
          objc_enumerationMutation(v6);
        }
        long long v11 = *(void **)(*((void *)&v45 + 1) + 8 * i);
        if (([v11 delayedStart] & 1) == 0)
        {
          if ([v11 requestsApplicationLaunch])
          {
            id v12 = [(_DASDaemon *)self clientForActivity:v11];

            if (!v12)
            {
              id v13 = +[_DASDaemonLogger logForCategory:@"lifecycle"];
              if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                id v53 = v11;
                _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Launch Task %@ has no known client", buf, 0xCu);
              }

              [(_DASDaemon *)self activityCompleted:v11];
              [v5 addObject:v11];
            }
          }
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v45 objects:v54 count:16];
    }
    while (v8);
  }

  [v6 minusSet:v5];
  os_unfair_recursive_lock_lock_with_options();
  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  uint64_t v14 = self->_runningTasks;
  id v15 = [(NSMutableSet *)v14 countByEnumeratingWithState:&v41 objects:v51 count:16];
  if (v15)
  {
    id v16 = v15;
    uint64_t v17 = *(void *)v42;
LABEL_16:
    uint64_t v18 = 0;
    while (1)
    {
      if (*(void *)v42 != v17) {
        objc_enumerationMutation(v14);
      }
      [v6 removeObject:*(void *)(*((void *)&v41 + 1) + 8 * v18)];
      if (![v6 count]) {
        break;
      }
      if (v16 == (id)++v18)
      {
        id v16 = [(NSMutableSet *)v14 countByEnumeratingWithState:&v41 objects:v51 count:16];
        if (v16) {
          goto LABEL_16;
        }
        break;
      }
    }
  }

  os_unfair_recursive_lock_unlock();
  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id v19 = [v6 copy];
  id v20 = [v19 countByEnumeratingWithState:&v37 objects:v50 count:16];
  if (v20)
  {
    id v21 = v20;
    uint64_t v22 = *(void *)v38;
    do
    {
      for (j = 0; j != v21; j = (char *)j + 1)
      {
        if (*(void *)v38 != v22) {
          objc_enumerationMutation(v19);
        }
        double v24 = *(void **)(*((void *)&v37 + 1) + 8 * (void)j);
        if ([v24 delayedStart]) {
          [v6 removeObject:v24];
        }
      }
      id v21 = [v19 countByEnumeratingWithState:&v37 objects:v50 count:16];
    }
    while (v21);
  }

  if ([v6 count])
  {
    long long v25 = +[_DASDaemonLogger logForCategory:@"lifecycle"];
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v53 = v6;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "No XPC Connection to client for activities: %@", buf, 0xCu);
    }

    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    id v26 = v6;
    id v27 = [v26 countByEnumeratingWithState:&v33 objects:v49 count:16];
    if (v27)
    {
      id v28 = v27;
      uint64_t v29 = *(void *)v34;
      do
      {
        for (k = 0; k != v28; k = (char *)k + 1)
        {
          if (*(void *)v34 != v29) {
            objc_enumerationMutation(v26);
          }
          id v31 = *(void **)(*((void *)&v33 + 1) + 8 * (void)k);
          if ([v31 requestsApplicationLaunch])
          {
            [(_DASDaemon *)self activityCompleted:v31];
          }
          else if (([v31 requestsExtensionLaunch] & 1) == 0)
          {
            [(_DASDaemon *)self activityCanceled:v31];
          }
        }
        id v28 = [v26 countByEnumeratingWithState:&v33 objects:v49 count:16];
      }
      while (v28);
    }
  }
}

- (void)clearRecentlyLaunchedApps
{
  id v3 = self->_recentlyLaunchedApps;
  objc_sync_enter(v3);
  if ((unint64_t)[(NSMutableDictionary *)self->_recentlyLaunchedApps count] >= 0x1A)
  {
    id v4 = [(NSMutableDictionary *)self->_recentlyLaunchedApps allKeys];
    id v5 = +[NSDate date];
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id v6 = v4;
    id v7 = [v6 countByEnumeratingWithState:&v29 objects:v34 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v30;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v30 != v8) {
            objc_enumerationMutation(v6);
          }
          uint64_t v10 = *(void *)(*((void *)&v29 + 1) + 8 * i);
          long long v11 = [(NSMutableDictionary *)self->_recentlyLaunchedApps objectForKeyedSubscript:v10];
          [v5 timeIntervalSinceDate:v11];
          BOOL v13 = v12 > 450.0;

          if (v13)
          {
            [(NSMutableDictionary *)self->_recentlyLaunchedApps removeObjectForKey:v10];
            [(NSCountedSet *)self->_launchesPerApp removeObject:v10];
          }
        }
        id v7 = [v6 countByEnumeratingWithState:&v29 objects:v34 count:16];
      }
      while (v7);
    }

    if ((unint64_t)[(NSMutableDictionary *)self->_recentlyLaunchedApps count] >= 0x1A)
    {
      uint64_t v14 = [(NSMutableDictionary *)self->_recentlyLaunchedApps allKeys];

      long long v27 = 0u;
      long long v28 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      id v6 = v14;
      id v15 = [v6 countByEnumeratingWithState:&v25 objects:v33 count:16];
      if (v15)
      {
        uint64_t v16 = *(void *)v26;
        do
        {
          for (j = 0; j != v15; j = (char *)j + 1)
          {
            if (*(void *)v26 != v16) {
              objc_enumerationMutation(v6);
            }
            uint64_t v18 = *(void *)(*((void *)&v25 + 1) + 8 * (void)j);
            id v19 = [(NSMutableDictionary *)self->_recentlyLaunchedApps objectForKeyedSubscript:v18];
            [v5 timeIntervalSinceDate:v19];
            BOOL v21 = v20 > 225.0;

            if (v21)
            {
              [(NSMutableDictionary *)self->_recentlyLaunchedApps removeObjectForKey:v18];
              [(NSCountedSet *)self->_launchesPerApp removeObject:v18];
            }
          }
          id v15 = [v6 countByEnumeratingWithState:&v25 objects:v33 count:16];
        }
        while (v15);
      }

      while ((unint64_t)[(NSMutableDictionary *)self->_recentlyLaunchedApps count] >= 0x1A)
      {
        uint64_t v22 = [(NSMutableDictionary *)self->_recentlyLaunchedApps allKeys];

        double v23 = [v22 objectAtIndex:arc4random_uniform((uint32_t)[v22 count])];
        [(NSMutableDictionary *)self->_recentlyLaunchedApps removeObjectForKey:v23];
        [(NSCountedSet *)self->_launchesPerApp removeObject:v23];

        id v6 = v22;
      }
    }
  }
  objc_sync_exit(v3);
}

- (void)runLaunchTasks:(id)a3 forApplication:(id)a4 forApplicationURL:(id)a5 onLaunch:(id)a6 onCompletion:(id)a7 onFailure:(id)a8
{
  id v14 = a3;
  id v87 = a4;
  id v15 = a5;
  id v16 = a6;
  uint64_t v17 = (void (**)(void))a7;
  id v18 = a8;
  id v19 = (void *)os_transaction_create();
  oslog = +[_DASDaemonLogger logForCategory:@"bar"];
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    id v119 = v14;
    __int16 v120 = 2112;
    id v121 = v87;
    _os_log_impl((void *)&_mh_execute_header, oslog, OS_LOG_TYPE_INFO, "Running launch tasks: %@ for application: %@", buf, 0x16u);
  }
  dispatch_group_t v85 = dispatch_group_create();
  double v20 = +[NSMutableDictionary dictionary];
  uint64_t v84 = +[NSMutableSet set];
  if (byte_1001C43C8)
  {
    long long v69 = v20;
    uint64_t v64 = v19;
    id v65 = v18;
    long long v66 = v17;
    long long v67 = v15;
    id v88 = +[NSMutableDictionary dictionary];
    id v77 = +[NSMutableDictionary dictionary];
    long long v108 = 0u;
    long long v109 = 0u;
    long long v110 = 0u;
    long long v111 = 0u;
    id v68 = v14;
    id obj = v14;
    id v21 = [obj countByEnumeratingWithState:&v108 objects:v116 count:16];
    if (!v21) {
      goto LABEL_30;
    }
    id v23 = v21;
    uint64_t v83 = *(void *)v109;
    uint64_t v24 = _DASLaunchReasonBackgroundFetch;
    uint64_t v81 = _DASLaunchReasonBackgroundRemoteNotification;
    uint64_t v80 = _DASLaunchReasonNSURLSessionComplete;
    uint64_t v76 = _DASLaunchReasonSignificantLocationChange;
    uint64_t v75 = _DASLaunchReasonHealthKit;
    uint64_t v73 = _DASLaunchReasonBackgroundRefresh;
    uint64_t v72 = _DASLaunchReasonBackgroundProcessing;
    uint64_t v71 = _DASLaunchReasonHealthResearch;
    uint64_t v74 = _DASLaunchOptionsSignificantLocationChange;
    long long v78 = (void *)_DASLaunchOptionsNSURLSession;
    uint64_t v79 = _DASRemoteNotificationPayloadKey;
    *(void *)&long long v22 = 138412546;
    long long v63 = v22;
    while (1)
    {
      long long v25 = 0;
      do
      {
        if (*(void *)v109 != v83) {
          objc_enumerationMutation(obj);
        }
        long long v26 = *(void **)(*((void *)&v108 + 1) + 8 * (void)v25);
        -[_DASDaemon moveActivityToPrerunning:](self, "moveActivityToPrerunning:", v26, v63);
        v102[0] = _NSConcreteStackBlock;
        v102[1] = 3221225472;
        v102[2] = sub_1000B7450;
        v102[3] = &unk_100177BF8;
        long long v27 = oslog;
        id v103 = v27;
        id v104 = v87;
        id v105 = v26;
        id v106 = v85;
        id v107 = self;
        long long v28 = objc_retainBlock(v102);
        long long v29 = [v26 launchReason];
        unsigned int v30 = [v29 isEqualToString:v24];

        if (v30)
        {
          id v31 = [objc_alloc((Class)UISFetchContentInBackgroundAction) initWithHandler:v28];
          long long v32 = [v26 uuid];
          long long v33 = v88;
          id v34 = v31;
          long long v35 = v32;
          goto LABEL_11;
        }
        long long v36 = [v26 launchReason];
        unsigned int v37 = [v36 isEqualToString:v81];

        if (v37)
        {
          long long v38 = [v26 userInfo];
          long long v32 = [v38 objectForKeyedSubscript:v79];

          id v31 = [objc_alloc((Class)UISHandleRemoteNotificationAction) initWithRemoteNotificationPayload:v32 withHandler:v28];
          long long v39 = [v26 uuid];
          [v88 setObject:v31 forKeyedSubscript:v39];

          goto LABEL_19;
        }
        long long v40 = [v26 launchReason];
        unsigned int v41 = [v40 isEqualToString:v80];

        if (v41)
        {
          long long v42 = [v26 userInfo];
          long long v43 = [v42 objectForKeyedSubscript:v78];

          if (v43)
          {
            id v31 = [v26 userInfo];
            long long v32 = [v31 objectForKeyedSubscript:v78];
            long long v33 = v77;
            id v34 = v32;
            long long v35 = v78;
LABEL_11:
            [v33 setObject:v34 forKeyedSubscript:v35];
LABEL_19:
          }
LABEL_20:
          long long v46 = [v26 launchReason];
          [v84 addObject:v46];
          goto LABEL_21;
        }
        long long v44 = [v26 launchReason];
        unsigned int v45 = [v44 isEqualToString:v76];

        if (v45)
        {
          id v31 = [v26 userInfo];
          long long v32 = [v31 objectForKeyedSubscript:v74];
          [v77 addEntriesFromDictionary:v32];
          goto LABEL_19;
        }
        long long v47 = [v26 launchReason];
        int v48 = [v47 isEqualToString:v75];

        if (v48) {
          goto LABEL_20;
        }
        long long v49 = [v26 launchReason];
        unsigned __int8 v50 = [v49 isEqualToString:v73];

        if (v50) {
          goto LABEL_20;
        }
        long long v51 = [v26 launchReason];
        unsigned __int8 v52 = [v51 isEqualToString:v72];

        if (v52) {
          goto LABEL_20;
        }
        id v53 = [v26 launchReason];
        unsigned __int8 v54 = [v53 isEqualToString:v71];

        if (v54) {
          goto LABEL_20;
        }
        long long v46 = v27;
        if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
        {
          id v55 = [v26 launchReason];
          *(_DWORD *)buf = v63;
          id v119 = v55;
          __int16 v120 = 2112;
          id v121 = v87;
          _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_INFO, "Encountered unexpected launch reason %@ for %@", buf, 0x16u);
        }
LABEL_21:

        long long v25 = (char *)v25 + 1;
      }
      while (v23 != v25);
      id v56 = [obj countByEnumeratingWithState:&v108 objects:v116 count:16];
      id v23 = v56;
      if (!v56)
      {
LABEL_30:

        dispatch_time_t v57 = [v88 allValues];
        double v20 = v69;
        [v69 setObject:v57 forKeyedSubscript:FBSOpenApplicationOptionKeyActions];

        if (!-[_DASBARScheduler applicationStateRequiresImmediateDelivery:](self->_barScheduler, "applicationStateRequiresImmediateDelivery:", v87))[v69 setObject:&off_100187348 forKeyedSubscript:FBSOpenApplicationOptionKeyLaunchIntent]; {
        [v69 setObject:v77 forKeyedSubscript:FBSOpenApplicationOptionKeyPayloadOptions];
        }
        id v15 = v67;
        id v18 = v65;
        uint64_t v17 = v66;
        id v19 = v64;
        if ([v84 count])
        {
          activityLaunchQueue = self->_activityLaunchQueue;
          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472;
          block[2] = sub_1000B76AC;
          block[3] = &unk_100177CC0;
          id v90 = v64;
          uint64_t v91 = v85;
          double v92 = self;
          id v93 = v87;
          id v94 = v67;
          id v95 = v69;
          id v96 = oslog;
          id v99 = v65;
          id v100 = v16;
          id v97 = obj;
          id v98 = v88;
          v101 = v66;
          dispatch_async(activityLaunchQueue, block);
        }
        else
        {
          if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR)) {
            sub_1000FE610();
          }
          v66[2](v66);
        }
        id v14 = v68;

        goto LABEL_48;
      }
    }
  }
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, oslog, OS_LOG_TYPE_INFO, "UIKit is not enabled!", buf, 2u);
  }
  long long v114 = 0u;
  long long v115 = 0u;
  long long v112 = 0u;
  long long v113 = 0u;
  id v88 = v14;
  id v59 = [v88 countByEnumeratingWithState:&v112 objects:v117 count:16];
  if (v59)
  {
    id v60 = v59;
    long long v70 = v20;
    uint64_t v61 = *(void *)v113;
    do
    {
      for (i = 0; i != v60; i = (char *)i + 1)
      {
        if (*(void *)v113 != v61) {
          objc_enumerationMutation(v88);
        }
        [(_DASDaemon *)self activityCanceled:*(void *)(*((void *)&v112 + 1) + 8 * i)];
      }
      id v60 = [v88 countByEnumeratingWithState:&v112 objects:v117 count:16];
    }
    while (v60);
    double v20 = v70;
  }
LABEL_48:
}

- (void)launchApplication:(id)a3 applicationURL:(id)a4 additionalOptions:(id)a5 completion:(id)a6
{
  id v8 = a3;
  id v9 = a6;
  id v10 = a5;
  long long v11 = +[_DASDaemonLogger logForCategory:@"bar"];
  double v12 = +[NSMutableDictionary dictionaryWithDictionary:v10];

  uint64_t v25 = FBSOpenApplicationOptionKeyActivateSuspended;
  long long v26 = &__kCFBooleanTrue;
  BOOL v13 = +[NSDictionary dictionaryWithObjects:&v26 forKeys:&v25 count:1];
  [v12 addEntriesFromDictionary:v13];

  id v14 = +[FBSOpenApplicationOptions optionsWithDictionary:v12];
  id v15 = +[FBSOpenApplicationService serviceWithDefaultShellEndpoint];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v24 = v8;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Launching with FBSOpenApplicationService for application %@", buf, 0xCu);
  }
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_1000B883C;
  v19[3] = &unk_100177CE8;
  double v20 = v11;
  id v21 = v8;
  id v22 = v9;
  id v16 = v9;
  id v17 = v8;
  id v18 = v11;
  [v15 openApplication:v17 withOptions:v14 completion:v19];
}

- (void)runExtensionLaunchActivities:(id)a3
{
  id v4 = a3;
  id v23 = (void *)os_transaction_create();
  id v5 = +[NSDate date];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v25 objects:v33 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v26;
    uint64_t v10 = _DASExtensionLaunchReasonMLCompute;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v26 != v9) {
          objc_enumerationMutation(v6);
        }
        double v12 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        [(_DASDaemon *)self prepareActivityForStart:v12 atTime:v5];
        BOOL v13 = [v12 launchReason];
        unsigned int v14 = [v13 isEqualToString:v10];

        if (v14)
        {
          id v15 = [v12 extensionIdentifier];
          id v16 = +[_DASPlugin pluginForIdentifier:v15 ofType:@"com.apple.ml-extension"];

          if (v16)
          {
            [v16 setPluginDelegate:self];
            id v17 = +[_DASDaemonLogger logForCategory:@"lifecycle"];
            if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412546;
              unsigned int v30 = v12;
              __int16 v31 = 2112;
              long long v32 = v16;
              _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "Activity: %@ requesting launch of extension: %@", buf, 0x16u);
            }

            [v16 performActivity:v12];
            if ((int)[v12 pid] > 0)
            {
              double v18 = (double)(unint64_t)[v12 duration] * 1.5;
              if (v18 >= (double)_DASActivityDurationLong) {
                double v18 = (double)_DASActivityDurationLong;
              }
              dispatch_time_t v19 = dispatch_time(0, (uint64_t)(v18 * 1000000000.0));
              evaluationQueue = self->_evaluationQueue;
              block[0] = _NSConcreteStackBlock;
              block[1] = 3221225472;
              block[2] = sub_1000B8DBC;
              block[3] = &unk_100175570;
              void block[4] = v12;
              void block[5] = self;
              dispatch_after(v19, evaluationQueue, block);
              goto LABEL_21;
            }
            id v22 = +[_DASDaemonLogger logForCategory:@"lifecycle"];
            if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              unsigned int v30 = v12;
              _os_log_error_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "Extension failed to launch for activity %@", buf, 0xCu);
            }

            [v16 unload];
          }
          else
          {
            id v21 = +[_DASDaemonLogger logForCategory:@"lifecycle"];
            if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              unsigned int v30 = v12;
              _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "Unable to find extension for activity %@", buf, 0xCu);
            }
          }
          [(_DASDaemon *)self activityCompleted:v12];
LABEL_21:

          continue;
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v25 objects:v33 count:16];
    }
    while (v8);
  }
}

- (void)runApplicationLaunchActivities:(id)a3
{
  id v4 = a3;
  long long v46 = (void *)os_transaction_create();
  id v5 = +[NSMutableSet set];
  id v6 = +[NSDate date];
  long long v86 = 0u;
  long long v87 = 0u;
  long long v84 = 0u;
  long long v85 = 0u;
  id obj = v4;
  id v7 = [obj countByEnumeratingWithState:&v84 objects:v97 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v85;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v85 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void **)(*((void *)&v84 + 1) + 8 * i);
        if ([v10 requestsApplicationLaunch])
        {
          long long v11 = [v10 relatedApplications];
          double v12 = [v11 firstObject];

          if (v12) {
            [v5 addObject:v12];
          }
        }
      }
      id v7 = [obj countByEnumeratingWithState:&v84 objects:v97 count:16];
    }
    while (v7);
  }

  id v47 = [obj mutableCopy];
  id v56 = +[NSMutableSet set];
  long long v82 = 0u;
  long long v83 = 0u;
  long long v80 = 0u;
  long long v81 = 0u;
  id v45 = v5;
  id v49 = [v45 countByEnumeratingWithState:&v80 objects:v96 count:16];
  if (v49)
  {
    uint64_t v48 = *(void *)v81;
    do
    {
      for (j = 0; j != v49; j = (char *)j + 1)
      {
        if (*(void *)v81 != v48) {
          objc_enumerationMutation(v45);
        }
        id v52 = *(id *)(*((void *)&v80 + 1) + 8 * (void)j);
        dispatch_time_t v57 = +[NSMutableSet set];
        os_unfair_recursive_lock_lock_with_options();
        id v54 = [(NSMutableSet *)self->_runningTasks copy];
        os_unfair_recursive_lock_unlock();
        os_unfair_recursive_lock_lock_with_options();
        BOOL v13 = [(NSMutableDictionary *)self->_applicationLaunchRequests objectForKeyedSubscript:v52];
        id v14 = [v13 copy];

        os_unfair_recursive_lock_unlock();
        long long v78 = 0u;
        long long v79 = 0u;
        long long v76 = 0u;
        long long v77 = 0u;
        id v15 = v14;
        id v16 = [v15 countByEnumeratingWithState:&v76 objects:v95 count:16];
        if (v16)
        {
          uint64_t v17 = *(void *)v77;
          do
          {
            for (k = 0; k != v16; k = (char *)k + 1)
            {
              if (*(void *)v77 != v17) {
                objc_enumerationMutation(v15);
              }
              dispatch_time_t v19 = *(NSMutableSet **)(*((void *)&v76 + 1) + 8 * (void)k);
              if ([(NSMutableSet *)v19 wasForceRun])
              {
LABEL_23:
                if ([(_DASBARScheduler *)self->_barScheduler backgroundLaunchAllowedForBGTaskActivity:v19])
                {
                  [v57 addObject:v19];
                  [(NSMutableSet *)v19 setStartDate:v6];
                  double v20 = +[_DASDaemonLogger logForCategory:@"lifecycle"];
                  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 138412546;
                    dispatch_queue_t v89 = v19;
                    __int16 v90 = 2112;
                    id v91 = v52;
                    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Activity: %@ requesting launch of application: %@", buf, 0x16u);
                  }
                }
                else
                {
                  [v56 addObject:v19];
                  double v20 = +[_DASDaemonLogger logForCategory:@"lifecycle"];
                  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 138412290;
                    dispatch_queue_t v89 = v19;
                    _os_log_error_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "Background launch not allowed for %@, cancelling", buf, 0xCu);
                  }
                }
                goto LABEL_41;
              }
              if ([(NSMutableSet *)v19 timewiseEligibleAtDate:v6])
              {
                if ([v54 containsObject:v19])
                {
                  double v20 = +[_DASDaemonLogger logForCategory:@"lifecycle"];
                  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 138412290;
                    dispatch_queue_t v89 = v19;
                    _os_log_error_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "Skipping activity %@ because it's already running", buf, 0xCu);
                  }
                }
                else
                {
                  uint64_t v75 = 0;
                  +[_DASConditionScore scoreForActivity:v19 withState:self->_context response:&v75];
                  if (v21 != 0.0) {
                    goto LABEL_23;
                  }
                  double v20 = +[_DASDaemonLogger logForCategory:@"lifecycle"];
                  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 138412290;
                    dispatch_queue_t v89 = v19;
                    _os_log_error_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "Skipping activity %@ because it was scored too low", buf, 0xCu);
                  }
                }
              }
              else
              {
                double v20 = +[_DASDaemonLogger logForCategory:@"lifecycle"];
                if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138412290;
                  dispatch_queue_t v89 = v19;
                  _os_log_error_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "Skipping activity %@ because it's not timewise eligible", buf, 0xCu);
                }
              }
LABEL_41:
            }
            id v16 = [v15 countByEnumeratingWithState:&v76 objects:v95 count:16];
          }
          while (v16);
        }

        if ([v57 count])
        {
          [v47 minusSet:v57];
          v73[0] = _NSConcreteStackBlock;
          v73[1] = 3221225472;
          v73[2] = sub_1000B99C8;
          v73[3] = &unk_100175548;
          v73[4] = self;
          v73[5] = v52;
          id v22 = v57;
          id v74 = v22;
          id v23 = objc_retainBlock(v73);
          v68[0] = _NSConcreteStackBlock;
          v68[1] = 3221225472;
          v68[2] = sub_1000B9CB4;
          v68[3] = &unk_100175C78;
          id v24 = v46;
          id v69 = v24;
          long long v70 = self;
          id v71 = v52;
          id v25 = v22;
          id v72 = v25;
          long long v26 = objc_retainBlock(v68);
          v63[0] = _NSConcreteStackBlock;
          v63[1] = 3221225472;
          v63[2] = sub_1000B9FEC;
          v63[3] = &unk_100175C78;
          id v64 = v24;
          id v27 = v25;
          id v65 = v27;
          long long v66 = self;
          id v67 = v52;
          long long v28 = objc_retainBlock(v63);
          [(_DASDaemon *)self runLaunchTasks:v27 forApplication:v52 forApplicationURL:0 onLaunch:v23 onCompletion:v26 onFailure:v28];
          long long v29 = self->_recentlyLaunchedApps;
          objc_sync_enter(v29);
          [(NSMutableDictionary *)self->_recentlyLaunchedApps setObject:v6 forKeyedSubscript:v52];
          [(NSCountedSet *)self->_launchesPerApp addObject:v52];
          objc_sync_exit(v29);

          [(_DASDaemon *)self clearRecentlyLaunchedApps];
        }
      }
      id v49 = [v45 countByEnumeratingWithState:&v80 objects:v96 count:16];
    }
    while (v49);
  }

  long long v61 = 0u;
  long long v62 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  id v53 = v47;
  id v58 = [v53 countByEnumeratingWithState:&v59 objects:v94 count:16];
  if (v58)
  {
    uint64_t v55 = *(void *)v60;
    do
    {
      for (m = 0; m != v58; m = (char *)m + 1)
      {
        if (*(void *)v60 != v55) {
          objc_enumerationMutation(v53);
        }
        __int16 v31 = *(NSMutableSet **)(*((void *)&v59 + 1) + 8 * (void)m);
        long long v32 = [(NSMutableSet *)v31 groupName];

        if (v32)
        {
          long long v33 = [(NSMutableSet *)v31 groupName];
          os_unfair_lock_lock(&self->_groupLock);
          id v34 = [(NSMutableDictionary *)self->_groupToRunningTasks objectForKeyedSubscript:v33];
          [v34 removeObject:v31];

          long long v35 = [(NSMutableDictionary *)self->_groupToPrerunningTasks objectForKeyedSubscript:v33];
          [v35 removeObject:v31];

          long long v36 = +[_DASDaemonLogger logForCategory:@"lifecycle(activityGroup)"];
          if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
          {
            unsigned int v37 = [(NSMutableSet *)v31 groupName];
            long long v38 = [(NSMutableDictionary *)self->_groupToRunningTasks objectForKeyedSubscript:v33];
            id v39 = [v38 count];
            *(_DWORD *)buf = 138543874;
            dispatch_queue_t v89 = v31;
            __int16 v90 = 2112;
            id v91 = v37;
            __int16 v92 = 2048;
            id v93 = v39;
            _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "NO LONGER RUNNING [Not in application -> activity mapping] %{public}@ ...Tasks running in group [%@] are %ld!", buf, 0x20u);
          }
          long long v40 = [(NSMutableDictionary *)self->_groupToPendingTasks objectForKeyedSubscript:v33];
          unsigned int v41 = v40;
          if (v40)
          {
            [v40 addObject:v31];
          }
          else
          {
            unsigned int v41 = +[NSMutableSet setWithObject:v31];
            [(NSMutableDictionary *)self->_groupToPendingTasks setObject:v41 forKeyedSubscript:v33];
          }
          os_unfair_lock_unlock(&self->_groupLock);
          os_unfair_recursive_lock_lock_with_options();
          BOOL v42 = [(NSMutableSet *)self->_runningTasks count] == 0;
          [(NSMutableSet *)self->_prerunningTasks removeObject:v31];
          [(NSMutableSet *)self->_runningTasks removeObject:v31];
          [(NSMutableSet *)self->_pendingTasks addObject:v31];
          if (!v42) {
            [(NSMutableSet *)self->_runningTasks count];
          }
          long long v43 = +[_DASDaemonLogger logForCategory:@"runningTasks"];
          if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG))
          {
            runningTasks = self->_runningTasks;
            *(_DWORD *)buf = 138543362;
            dispatch_queue_t v89 = runningTasks;
            _os_log_debug_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_DEBUG, "%{public}@", buf, 0xCu);
          }

          os_unfair_recursive_lock_unlock();
        }
      }
      id v58 = [v53 countByEnumeratingWithState:&v59 objects:v94 count:16];
    }
    while (v58);
  }

  [(_DASDaemon *)self cancelActivities:v56];
}

- (void)suspendPlugin:(id)a3
{
  id v4 = a3;
  id v5 = [v4 extensionIdentifier];
  id v6 = +[_DASPlugin existingPluginForIdentifier:v5 ofType:@"com.apple.ml-extension"];

  id v7 = +[_DASDaemonLogger logForCategory:@"lifecycle"];
  uint64_t v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      sub_1000FE8AC(v6, v8);
    }

    [v6 suspend];
    dispatch_time_t v9 = dispatch_time(0, 10000000000);
    evaluationQueue = self->_evaluationQueue;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_1000BA5FC;
    v11[3] = &unk_100175570;
    double v12 = v4;
    id v13 = v6;
    dispatch_after(v9, evaluationQueue, v11);

    uint64_t v8 = v12;
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v15 = v4;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Not suspending activity %{public}@ - extension already gone", buf, 0xCu);
  }
}

- (void)warnBGTaskClientsForActivitiesAboutToExpire:(id)a3
{
  id v4 = a3;
  id v5 = [(_DASDaemon *)self connectedBGTaskClients];
  objc_sync_enter(v5);
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v6 = [(_DASDaemon *)self connectedBGTaskClients];
  id v7 = [v6 allValues];

  id v8 = [v7 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v12;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v7);
        }
        [*(id *)(*((void *)&v11 + 1) + 8 * (void)v10) willExpireBGTaskActivities:v4];
        uint64_t v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v7 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }

  objc_sync_exit(v5);
}

- (void)deferActivities:(id)a3 withHandler:(id)a4
{
  id v6 = a3;
  dispatch_time_t v19 = (void (**)(id, BOOL))a4;
  id v7 = +[_DASDaemonLogger defaultCategory];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    id v26 = [v6 count];
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Deferring %lu activities", buf, 0xCu);
  }

  id v8 = +[NSMutableSet set];
  uint64_t v9 = +[NSDate now];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v10 = v6;
  id v11 = [v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v21;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v21 != v13) {
          objc_enumerationMutation(v10);
        }
        id v15 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        id v16 = [(_DASDaemon *)self getActivityRunningWithName:v15];
        if (v16)
        {
          [v8 addObject:v16];
          [(_DASDaemon *)self updateSuspendRequestDate:v9 forActivity:v16 withReason:0];
        }
        else
        {
          uint64_t v17 = +[_DASDaemonLogger defaultCategory];
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            id v26 = v15;
            _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Unable to find activity %@ to defer", buf, 0xCu);
          }
        }
      }
      id v12 = [v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v12);
  }

  BOOL v18 = [v8 count] != 0;
  [(_DASDaemon *)self suspendActivities:v8];
  v19[2](v19, v18);
}

- (void)resetFastPassActivities:(id)a3 resetAll:(BOOL)a4 withHandler:(id)a5
{
}

- (void)inspect:(id)a3 withHandler:(id)a4
{
}

- (void)suspendActivity:(id)a3
{
  id v4 = a3;
  [(_DASDaemon *)self recordToTaskRegistry:v4 lifeCycleStateName:@"suspended"];
  id v5 = +[NSSet setWithObject:v4];

  [(_DASDaemon *)self suspendActivities:v5];
}

- (void)suspendActivitiesWithIdentifiers:(id)a3
{
  id v4 = a3;
  id v5 = +[NSMutableSet set];
  os_unfair_recursive_lock_lock_with_options();
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v6 = self->_runningTasks;
  id v7 = [(NSMutableSet *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        id v12 = [v11 uuid];
        unsigned int v13 = [v4 containsObject:v12];

        if (v13) {
          [v5 addObject:v11];
        }
      }
      id v8 = [(NSMutableSet *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  os_unfair_recursive_lock_unlock();
  [(_DASDaemon *)self suspendActivities:v5];
}

- (void)suspendActivities:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    id v5 = +[_DASDaemonLogger logForCategory:@"lifecycle"];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v42 = v4;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Suspending: %{public}@", buf, 0xCu);
    }

    v38[0] = _NSConcreteStackBlock;
    v38[1] = 3221225472;
    v38[2] = sub_1000BB03C;
    v38[3] = &unk_100177B80;
    id v6 = v4;
    id v39 = v6;
    [(_DASDaemon *)self allClientsDo:v38];
    id v7 = [(_DASDaemon *)self connectedBGTaskClients];
    id v8 = [v7 count];

    if (v8)
    {
      [(_DASDaemon *)self warnBGTaskClientsForActivitiesAboutToExpire:v6];
      id v9 = [v6 copy];
      dispatch_time_t v10 = dispatch_time(0, 5000000000);
      evaluationQueue = self->_evaluationQueue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_1000BB048;
      block[3] = &unk_100175570;
      void block[4] = self;
      id v37 = v9;
      id v12 = v9;
      dispatch_after(v10, evaluationQueue, block);
    }
    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    id v13 = v6;
    id v14 = [v13 countByEnumeratingWithState:&v32 objects:v40 count:16];
    if (v14)
    {
      id v15 = v14;
      uint64_t v16 = *(void *)v33;
      do
      {
        for (i = 0; i != v15; i = (char *)i + 1)
        {
          if (*(void *)v33 != v16) {
            objc_enumerationMutation(v13);
          }
          BOOL v18 = *(void **)(*((void *)&v32 + 1) + 8 * i);
          if ([v18 requestsExtensionLaunch]) {
            [(_DASDaemon *)self suspendPlugin:v18];
          }
        }
        id v15 = [v13 countByEnumeratingWithState:&v32 objects:v40 count:16];
      }
      while (v15);
    }

    id v19 = [v13 copy];
    long long v20 = +[NSDate date];
    long long v21 = +[_DASBootTimePolicy getDeviceBootTime];
    [v20 timeIntervalSinceDate:v21];
    double v23 = v22;

    unsigned int v24 = +[_DASConfig isInternalBuild];
    dispatch_time_t v25 = dispatch_time(0, 10000000000);
    id v26 = self->_evaluationQueue;
    if (v24 && v23 >= 300.0)
    {
      id v27 = v31;
      v31[0] = _NSConcreteStackBlock;
      v31[1] = 3221225472;
      long long v28 = sub_1000BB3F8;
    }
    else
    {
      id v27 = v30;
      v30[0] = _NSConcreteStackBlock;
      v30[1] = 3221225472;
      long long v28 = sub_1000BB9C8;
    }
    v27[2] = v28;
    v27[3] = &unk_100175570;
    v27[4] = self;
    v27[5] = v19;
    id v29 = v19;
    dispatch_after(v25, v26, v27);
  }
}

- (void)cancelActivities:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    id v5 = +[_DASDaemonLogger logForCategory:@"lifecycle"];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v19 = v4;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Daemon Canceling Activities: %{public}@", buf, 0xCu);
    }

    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v6 = v4;
    id v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v14;
      do
      {
        dispatch_time_t v10 = 0;
        do
        {
          if (*(void *)v14 != v9) {
            objc_enumerationMutation(v6);
          }
          [(_DASDaemon *)self activityCanceled:*(void *)(*((void *)&v13 + 1) + 8 * (void)v10)];
          dispatch_time_t v10 = (char *)v10 + 1;
        }
        while (v8 != v10);
        id v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v8);
    }

    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_1000BBBA0;
    v11[3] = &unk_100177B80;
    id v12 = v6;
    [(_DASDaemon *)self allClientsDo:v11];
  }
}

- (void)activity:(id)a3 blockedOnPolicies:(id)a4
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000BBC68;
  v8[3] = &unk_100177D38;
  id v9 = a3;
  id v10 = a4;
  id v6 = v10;
  id v7 = v9;
  [(_DASDaemon *)self allClientsDo:v8];
}

- (void)activity:(id)a3 runWithoutHonoringPolicies:(id)a4
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000BBD30;
  v8[3] = &unk_100177D38;
  id v9 = a3;
  id v10 = a4;
  id v6 = v10;
  id v7 = v9;
  [(_DASDaemon *)self allClientsDo:v8];
}

- (id)activityMatchingPredicate:(id)a3
{
  id v4 = a3;
  os_unfair_recursive_lock_lock_with_options();
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v5 = self->_pendingTasks;
  id v6 = [(NSMutableSet *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v12;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v5);
        }
        id v9 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if (objc_msgSend(v4, "evaluateWithObject:", v9, (void)v11))
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = [(NSMutableSet *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  os_unfair_recursive_lock_unlock();

  return v6;
}

- (id)getActivityWithUUID:(id)a3
{
  id v4 = +[NSPredicate predicateWithFormat:@"self.uuid = %@", a3];
  id v5 = [(_DASDaemon *)self activityMatchingPredicate:v4];

  return v5;
}

- (id)getActivityWithName:(id)a3
{
  id v4 = +[NSPredicate predicateWithFormat:@"self.name = %@", a3];
  id v5 = [(_DASDaemon *)self activityMatchingPredicate:v4];

  return v5;
}

- (id)getActivityRunningWithName:(id)a3
{
  id v4 = a3;
  os_unfair_recursive_lock_lock_with_options();
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = self->_runningTasks;
  id v6 = [(NSMutableSet *)v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    id v7 = v6;
    id v8 = 0;
    uint64_t v9 = *(void *)v17;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v5);
        }
        long long v11 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        long long v12 = [v11 name:v16];
        unsigned int v13 = [v12 isEqualToString:v4];

        if (v13)
        {
          id v14 = v11;

          id v8 = v14;
        }
      }
      id v7 = [(NSMutableSet *)v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v7);
  }
  else
  {
    id v8 = 0;
  }

  os_unfair_recursive_lock_unlock();

  return v8;
}

- (id)getActivityRunningWithUUID:(id)a3
{
  id v4 = a3;
  os_unfair_recursive_lock_lock_with_options();
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = self->_runningTasks;
  id v6 = [(NSMutableSet *)v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    id v7 = v6;
    id v8 = 0;
    uint64_t v9 = *(void *)v17;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v5);
        }
        long long v11 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        long long v12 = [v11 uuid:v16];
        unsigned int v13 = [v12 isEqual:v4];

        if (v13)
        {
          id v14 = v11;

          id v8 = v14;
        }
      }
      id v7 = [(NSMutableSet *)v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v7);
  }
  else
  {
    id v8 = 0;
  }

  os_unfair_recursive_lock_unlock();

  return v8;
}

- (void)addConstraint:(unint64_t)a3 forSchedulingPriority:(unint64_t)a4
{
  p_constraintsLock = &self->_constraintsLock;
  os_unfair_lock_lock(&self->_constraintsLock);
  if (_DASSchedulingPriorityBackground >= a4)
  {
    unint64_t maintenanceConstraints = self->_maintenanceConstraints;
    if ((maintenanceConstraints & a3) != 0) {
      goto LABEL_7;
    }
    self->_unint64_t maintenanceConstraints = maintenanceConstraints | a3;
    uint64_t v9 = 536;
  }
  else
  {
    unint64_t utilityConstraints = self->_utilityConstraints;
    if ((utilityConstraints & a3) != 0) {
      goto LABEL_7;
    }
    self->_unint64_t utilityConstraints = utilityConstraints | a3;
    uint64_t v9 = 528;
  }
  long long v11 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:");
  [(_CDLocalContext *)self->_context setObject:v11 forKeyedSubscript:*(Class *)((char *)&self->super.isa + v9)];

LABEL_7:

  os_unfair_lock_unlock(p_constraintsLock);
}

- (void)removeConstraint:(unint64_t)a3 forSchedulingPriority:(unint64_t)a4
{
  p_constraintsLock = &self->_constraintsLock;
  os_unfair_lock_lock(&self->_constraintsLock);
  if (_DASSchedulingPriorityBackground >= a4)
  {
    unint64_t maintenanceConstraints = self->_maintenanceConstraints;
    if ((maintenanceConstraints & a3) == 0) {
      goto LABEL_7;
    }
    self->_unint64_t maintenanceConstraints = maintenanceConstraints & ~a3;
    uint64_t v9 = 536;
  }
  else
  {
    unint64_t utilityConstraints = self->_utilityConstraints;
    if ((utilityConstraints & a3) == 0) {
      goto LABEL_7;
    }
    self->_unint64_t utilityConstraints = utilityConstraints & ~a3;
    uint64_t v9 = 528;
  }
  long long v11 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:");
  [(_CDLocalContext *)self->_context setObject:v11 forKeyedSubscript:*(Class *)((char *)&self->super.isa + v9)];

LABEL_7:

  os_unfair_lock_unlock(p_constraintsLock);
}

- (void)updateiCPLTasksBlocked:(unint64_t)a3
{
  id v5 = +[_DASPhotosPolicy keyPathForPhotosIsBlocked];
  id v6 = +[_DASPhotosPolicy keyPathForBlockedStartDate];
  id v7 = +[_DASPhotosPolicy keyPathForPhotosIsUnBlocked];
  id v8 = v5;
  objc_sync_enter(v8);
  unint64_t photosIsBlocked = self->_photosIsBlocked;
  if (a3)
  {
    if (!photosIsBlocked)
    {
      id v10 = +[NSDate date];
      [(_CDLocalContext *)self->_context setObject:v10 forKeyedSubscript:v6];
    }
  }
  else if (photosIsBlocked)
  {
    long long v11 = [(_CDLocalContext *)self->_context objectForKeyedSubscript:v6];
    long long v12 = +[NSDate date];
    [v12 timeIntervalSinceDate:v11];
    double v14 = v13;

    double v15 = fmax(v14, 0.0);
    +[_DASMetricRecorder incrementOccurrencesForKey:@"com.apple.dasd.icpl-blocked" byCount:llround(v15)];
    long long v16 = +[_DASDaemonLogger logForCategory:@"stats"];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      int v28 = 134217984;
      double v29 = v15 / 60.0;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "iCPL gated for %5.2f mins", (uint8_t *)&v28, 0xCu);
    }

    long long v17 = +[NSDate distantFuture];
    [(_CDLocalContext *)self->_context setObject:v17 forKeyedSubscript:v6];
  }
  long long v18 = +[NSNumber numberWithUnsignedInteger:a3];
  [(_CDLocalContext *)self->_context setObject:v18 forKeyedSubscript:v8];
  BOOL v19 = a3 == 0;

  self->_unint64_t photosIsBlocked = a3;
  objc_sync_exit(v8);

  id v20 = v7;
  objc_sync_enter(v20);
  if (v19)
  {
    if (+[_DASPhotosPolicy isPhotosSyncOverriddenWithContext:self->_context])
    {
      [(_CDLocalContext *)self->_context setObject:&off_100187378 forKeyedSubscript:v20];
      *(double *)&CFStringRef v21 = COERCE_DOUBLE(@"Sync Now Override");
    }
    else
    {
      double v22 = +[_DASPhotosPolicy policyInstance];
      unsigned int v23 = [v22 intentSyncIsEngaged];

      context = self->_context;
      if (v23)
      {
        [(_CDLocalContext *)context setObject:&off_100187390 forKeyedSubscript:v20];
        *(double *)&CFStringRef v21 = COERCE_DOUBLE(@"Remote Device Intent");
      }
      else
      {
        [(_CDLocalContext *)context setObject:&off_1001873A8 forKeyedSubscript:v20];
        *(double *)&CFStringRef v21 = COERCE_DOUBLE(@"DAS");
      }
    }
    dispatch_time_t v25 = +[_DASDaemonLogger defaultCategory];
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      int v28 = 138412290;
      double v29 = *(double *)&v21;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Reporting photos activity no longer blocked due to: %@", (uint8_t *)&v28, 0xCu);
    }
  }
  else
  {
    [(_CDLocalContext *)self->_context setObject:&off_1001873C0 forKeyedSubscript:v20];
  }
  id v26 = +[_DASDaemonLogger defaultCategory];
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    double v27 = [(_CDLocalContext *)self->_context objectForKeyedSubscript:v20];
    int v28 = 138412290;
    double v29 = v27;
    _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Reporting photos activity unBlockedOptions: %@", (uint8_t *)&v28, 0xCu);
  }
  objc_sync_exit(v20);
}

- (void)reportActivity:(id)a3 isBlockedWithDecision:(int64_t)a4
{
  id v6 = a3;
  if (!+[_DASPolicyResponse isPolicyDecisionProceedable:](_DASPolicyResponse, "isPolicyDecisionProceedable:", a4)&& +[_DASPhotosPolicy isiCPLActivity:v6])
  {
    id v49 = self;
    uint64_t v63 = 0;
    id v64 = &v63;
    uint64_t v65 = 0x2020000000;
    uint64_t v66 = 0;
    id v7 = v6;
    objc_sync_enter(v7);
    id v8 = objc_alloc((Class)NSDictionary);
    uint64_t v9 = [v7 policyResponseMetadata];
    id v10 = [v8 initWithDictionary:v9 copyItems:1];

    objc_sync_exit(v7);
    long long v11 = +[_DASLowPowerModePolicy policyInstance];
    long long v12 = [v11 policyName];
    double v13 = [v10 objectForKeyedSubscript:v12];
    unsigned __int8 v48 = [v13 reason];

    double v14 = +[_DASPhotosPolicy policyInstance];
    double v15 = [v14 policyName];
    long long v16 = [v10 objectForKeyedSubscript:v15];
    unsigned __int8 v47 = [v16 reason];

    long long v17 = +[_DASPhotosPolicy policyInstance];
    long long v18 = [v17 policyName];
    BOOL v19 = [v10 objectForKeyedSubscript:v18];
    unsigned __int8 v46 = [v19 reason];

    id v20 = +[_DASNetworkQualityPolicy policyInstance];
    CFStringRef v21 = [v20 policyName];
    double v22 = [v10 objectForKeyedSubscript:v21];
    unsigned __int8 v45 = [v22 reason];

    unsigned int v23 = +[_DASNetworkQualityPolicy policyInstance];
    unsigned int v24 = [v23 policyName];
    dispatch_time_t v25 = [v10 objectForKeyedSubscript:v24];
    unsigned __int8 v26 = [v25 reason];

    double v27 = +[_DASThermalPolicy policyInstance];
    int v28 = [v27 policyName];
    double v29 = [v10 objectForKeyedSubscript:v28];
    BOOL v30 = ((unint64_t)[v29 reason] & 0x18) != 0;

    uint64_t v31 = +[_DASRequiresPluggedInPolicy policyInstance];
    long long v32 = [(id)v31 policyName];
    long long v33 = [v10 objectForKeyedSubscript:v32];
    unsigned __int8 v34 = [v33 reason];

    long long v35 = +[_DASDeviceActivityPolicy policyInstance];
    long long v36 = [v35 policyName];
    id v37 = [v10 objectForKeyedSubscript:v36];
    LOBYTE(v31) = [v37 reason];

    v52[0] = _NSConcreteStackBlock;
    v52[1] = 3221225472;
    v52[2] = sub_1000BCEB0;
    v52[3] = &unk_100177D60;
    char v55 = v48 & 1;
    id v54 = &v63;
    char v56 = v47 & 1;
    BOOL v57 = (v46 & 2) != 0;
    BOOL v58 = (v45 & 2) != 0;
    BOOL v59 = (v26 & 4) != 0;
    id v38 = v10;
    id v53 = v38;
    BOOL v60 = v30;
    char v61 = v34 & 1;
    char v62 = v31 & 1;
    [v38 enumerateKeysAndObjectsUsingBlock:v52];
    uint64_t v39 = v64[3];
    if (v39 != v49->_photosIsBlocked)
    {
      if (v39)
      {
        long long v40 = +[_DASDaemonLogger defaultCategory];
        if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
        {
          unsigned int v41 = +[NSNumber numberWithUnsignedInteger:v64[3]];
          *(_DWORD *)buf = 138412802;
          id v68 = v41;
          __int16 v69 = 2114;
          id v70 = v7;
          __int16 v71 = 2112;
          id v72 = v38;
          _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, "Reporting photos activity blocked: %@ %{public}@ %@", buf, 0x20u);
        }
        [(_DASDaemon *)v49 updateiCPLTasksBlocked:v64[3]];
        if (_os_feature_enabled_impl()
          && +[_DASPhotosPolicy isPhotosSyncActivity:v7]
          && +[_DASPhotosPolicy shouldOverrideForIntentSync:v64[3] activity:v7]&& ![(_DASRemoteDeviceActivityMonitor *)v49->_remoteDeviceActivityMonitor isRegistered])
        {
          remoteDeviceActivityMonitor = v49->_remoteDeviceActivityMonitor;
          v50[0] = _NSConcreteStackBlock;
          v50[1] = 3221225472;
          v50[2] = sub_1000BD570;
          v50[3] = &unk_100175570;
          v50[4] = v49;
          id v51 = v7;
          [(_DASRemoteDeviceActivityMonitor *)remoteDeviceActivityMonitor registerForRemoteDeviceActiveNotificationsWithChange:v50];
        }
      }
      else
      {
        long long v43 = +[_DASDaemonLogger defaultCategory];
        if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
        {
          long long v44 = +[NSNumber numberWithUnsignedInteger:v49->_photosIsBlocked];
          *(_DWORD *)buf = 138543874;
          id v68 = v7;
          __int16 v69 = 2112;
          id v70 = v38;
          __int16 v71 = 2112;
          id v72 = v44;
          _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_DEFAULT, "Reporting photos activity no longer blocked: %{public}@ %@ (was %@)", buf, 0x20u);
        }
        [(_DASDaemon *)v49 updateiCPLTasksBlocked:v64[3]];
        if (_os_feature_enabled_impl()
          && +[_DASPhotosPolicy isPhotosSyncActivity:v7]
          && [(_DASRemoteDeviceActivityMonitor *)v49->_remoteDeviceActivityMonitor isRegistered])
        {
          [(_DASRemoteDeviceActivityMonitor *)v49->_remoteDeviceActivityMonitor unregisterForRemoteDeviceActiveNotifications];
        }
      }
    }

    _Block_object_dispose(&v63, 8);
  }
}

- (BOOL)testModeConstraintsApplyToActivity:(id)a3
{
  id v4 = a3;
  id v5 = [(_DASDaemon *)self testModeParameters];
  id v6 = [v5 objectForKeyedSubscript:@"activities"];

  id v7 = [v4 name];
  unsigned int v8 = [v6 containsObject:v7];

  if (v8)
  {
    uint64_t v9 = +[_DASDaemonLogger defaultCategory];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v38 = v4;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Test Mode Applies To Activity: %@", buf, 0xCu);
    }
    BOOL v10 = 1;
    goto LABEL_27;
  }
  long long v11 = [(_DASDaemon *)self testModeParameters];
  long long v12 = [v11 objectForKeyedSubscript:@"activityClasses"];

  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  uint64_t v9 = v12;
  id v13 = [v9 countByEnumeratingWithState:&v33 objects:v41 count:16];
  if (!v13)
  {
    BOOL v10 = 0;
    goto LABEL_26;
  }
  id v14 = v13;
  uint64_t v31 = v6;
  id v32 = v4;
  uint64_t v15 = *(void *)v34;
  p_superclass = &OBJC_METACLASS____DASBootTimePolicy.superclass;
  CFStringRef v17 = @"photos";
LABEL_7:
  uint64_t v18 = 0;
  while (1)
  {
    if (*(void *)v34 != v15) {
      objc_enumerationMutation(v9);
    }
    BOOL v19 = *(void **)(*((void *)&v33 + 1) + 8 * v18);
    if ((objc_msgSend(v19, "isEqualToString:", @"icpl", v31) & 1) != 0
      || [v19 isEqualToString:v17])
    {
      if ([p_superclass + 354 isiCPLActivity:v4])
      {
        int v28 = +[_DASDaemonLogger defaultCategory];
        if (!os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_24;
        }
        goto LABEL_23;
      }
      goto LABEL_13;
    }
    if ([v19 isEqualToString:@"network"]) {
      break;
    }
    [v4 name];
    id v20 = p_superclass;
    v22 = CFStringRef v21 = v9;
    [v22 lowercaseString];
    v24 = CFStringRef v23 = v17;
    unsigned int v25 = [v24 containsString:v19];

    CFStringRef v17 = v23;
    uint64_t v9 = v21;
    p_superclass = v20;
    id v4 = v32;
    if (v25)
    {
      int v28 = +[_DASDaemonLogger defaultCategory];
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_23;
      }
      goto LABEL_24;
    }
LABEL_13:
    if (v14 == (id)++v18)
    {
      id v26 = [v9 countByEnumeratingWithState:&v33 objects:v41 count:16];
      id v14 = v26;
      if (!v26)
      {
        BOOL v10 = 0;
        id v6 = v31;
        goto LABEL_26;
      }
      goto LABEL_7;
    }
  }
  if (![v4 requiresNetwork]) {
    goto LABEL_13;
  }
  int v28 = +[_DASDaemonLogger defaultCategory];
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
LABEL_23:
    *(_DWORD *)buf = 138412546;
    id v38 = v19;
    __int16 v39 = 2112;
    id v40 = v4;
    _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "Test Mode (%@) Applies To Activity: %@", buf, 0x16u);
  }
LABEL_24:
  id v6 = v31;

  BOOL v10 = 1;
LABEL_26:

LABEL_27:
  return v10;
}

- (BOOL)testModeConstraintsRequireOverridingDecisionWithScores:(id)a3 ignoredPolicies:(id)a4 honoredPolicies:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = a3;
  long long v11 = [(_DASDaemon *)self testModeParameters];
  long long v12 = [v11 objectForKeyedSubscript:@"overrides"];

  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_1000BDD64;
  v20[3] = &unk_100177D88;
  id v13 = v12;
  id v21 = v13;
  id v14 = v8;
  id v22 = v14;
  id v15 = v9;
  id v23 = v15;
  [v10 enumerateKeysAndObjectsUsingBlock:v20];

  long long v16 = +[_DASDaemonLogger defaultCategory];
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v25 = v14;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Ignored policies: %@", buf, 0xCu);
  }

  CFStringRef v17 = +[_DASDaemonLogger defaultCategory];
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v25 = v15;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Honored policies: %@", buf, 0xCu);
  }

  BOOL v18 = [v15 count] == 0;
  return v18;
}

- (void)moveActivityToPrerunning:(id)a3
{
  id v4 = a3;
  [(_DASDaemon *)self removeActivityFromTriggerMap:v4];
  if ([(_DASNetworkEvaluationMonitor *)self->_networkEvaluationMonitor requiresNetworkPathMonitoring:v4])
  {
    networkEvaluationMonitor = self->_networkEvaluationMonitor;
    id v6 = [v4 uuid];
    [(_DASNetworkEvaluationMonitor *)networkEvaluationMonitor stopMonitoringActivity:v6];
  }
  os_unfair_recursive_lock_lock_with_options();
  [(NSMutableSet *)self->_pendingTasks removeObject:v4];
  [(NSMutableSet *)self->_prerunningTasks addObject:v4];
  os_unfair_recursive_lock_unlock();
  [(_DASDaemon *)self recordToTaskRegistry:v4 lifeCycleStateName:@"prerunning"];
  id v7 = [v4 groupName];

  if (v7)
  {
    id v8 = [v4 groupName];
    [(_DASDaemon *)self addPrerunningActivity:v4 toGroupWithName:v8];
  }
  dispatch_time_t v9 = dispatch_time(0, 61000000000);
  evaluationQueue = self->_evaluationQueue;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1000BDF7C;
  v12[3] = &unk_100175570;
  v12[4] = self;
  id v13 = v4;
  id v11 = v4;
  dispatch_after(v9, evaluationQueue, v12);
}

- (void)moveActivityToRunning:(id)a3
{
  id v4 = a3;
  os_unfair_recursive_lock_lock_with_options();
  if ([(NSMutableSet *)self->_runningTasks containsObject:v4])
  {
    os_unfair_recursive_lock_unlock();
  }
  else
  {
    [(NSMutableSet *)self->_prerunningTasks removeObject:v4];
    [(NSMutableSet *)self->_pendingTasks removeObject:v4];
    [(NSMutableSet *)self->_runningTasks count];
    [(NSMutableSet *)self->_runningTasks addObject:v4];
    id v5 = +[_DASDaemonLogger logForCategory:@"runningTasks"];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      sub_1000FEAF0();
    }

    os_unfair_recursive_lock_unlock();
    id v6 = +[NSDate date];
    [v4 setStartDate:v6];

    if (+[_DASCheckpointRecorder shouldLogCheckpointForActivity:v4])
    {
      id v7 = +[_DASCheckpointRecorder sharedInstance];
      [v7 reportTaskCheckpoint:20 forTask:v4 error:0];
    }
    id v8 = [v4 groupName];

    if (v8)
    {
      dispatch_time_t v9 = [v4 groupName];
      [(_DASDaemon *)self addRunningActivity:v4 toGroupWithName:v9];
    }
    if (([v4 requestsApplicationLaunch] & 1) == 0) {
      [(_DASBudgetManager *)self->_budgetManager reportActivityRunning:v4];
    }
    if ([v4 isIntensive]) {
      [(_DASFairScheduleManager *)self->_fairScheduleManager activityStarted:v4];
    }
    if ([v4 userRequestedBackupTask]) {
      [(_DASUserRequestedBackupTaskManager *)self->_backupTaskManager reportActivityRunning:v4];
    }
  }
}

- (void)beginWorkForActivity:(id)a3
{
  id v6 = a3;
  if ([v6 requestsApplicationLaunch])
  {
    id v4 = +[NSMutableSet setWithObject:v6];
    [(_DASDaemon *)self runApplicationLaunchActivities:v4];
  }
  else
  {
    unsigned int v5 = [v6 requestsExtensionLaunch];
    id v4 = +[NSMutableSet setWithObject:v6];
    if (v5) {
      [(_DASDaemon *)self runExtensionLaunchActivities:v4];
    }
    else {
      [(_DASDaemon *)self runActivitiesAndRemoveUnknown:v4];
    }
  }
}

- (void)immediatelyBeginWorkForActivity:(id)a3
{
  id v4 = a3;
  os_unfair_recursive_lock_lock_with_options();
  unsigned int v5 = +[NSMutableSet setWithObjectsFrom:](NSMutableSet, "setWithObjectsFrom:", self->_prerunningTasks, self->_runningTasks, 0);
  unsigned int v6 = [v5 containsObject:v4];
  os_unfair_recursive_lock_unlock();
  if (v6)
  {
    id v7 = +[_DASDaemonLogger defaultCategory];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v9 = v4;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%@ is already running, cannot begin work for it.", buf, 0xCu);
    }
  }
  else
  {
    [(_DASDaemon *)self moveActivityToPrerunning:v4];
    [(_DASDaemon *)self beginWorkForActivity:v4];
  }
}

- (void)advanceAppLaunchDateIfNecessaryForActivity:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [v4 userInfo];
  unsigned int v6 = [v5 objectForKeyedSubscript:_DASNonRateLimitedLaunchKey];
  unsigned __int8 v7 = [v6 BOOLValue];

  if ((v7 & 1) == 0)
  {
    id v8 = [v4 relatedApplications];
    if ([v8 count]
      && (id v9 = [v4 schedulingPriority], (unint64_t)v9 <= _DASSchedulingPriorityUtility))
    {
      id v10 = [v4 widgetID];

      if (!v10)
      {
        id v11 = +[_DASApplicationPolicy focalApplicationsWithContext:self->_context];
        long long v37 = 0u;
        long long v38 = 0u;
        long long v35 = 0u;
        long long v36 = 0u;
        [v4 relatedApplications];
        long long v12 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
        id v13 = [(NSMutableDictionary *)v12 countByEnumeratingWithState:&v35 objects:v45 count:16];
        if (v13)
        {
          uint64_t v14 = *(void *)v36;
LABEL_8:
          uint64_t v15 = 0;
          while (1)
          {
            if (*(void *)v36 != v14) {
              objc_enumerationMutation(v12);
            }
            if ([v11 containsObject:*(void *)(*((void *)&v35 + 1) + 8 * v15)]) {
              break;
            }
            if (v13 == (id)++v15)
            {
              id v13 = [(NSMutableDictionary *)v12 countByEnumeratingWithState:&v35 objects:v45 count:16];
              if (v13) {
                goto LABEL_8;
              }
              goto LABEL_14;
            }
          }
        }
        else
        {
LABEL_14:

          long long v12 = self->_recentlyLaunchedApps;
          objc_sync_enter(v12);
          long long v16 = [v4 relatedApplications];
          CFStringRef v17 = [v16 firstObject];

          BOOL v18 = [(NSMutableDictionary *)self->_recentlyLaunchedApps objectForKeyedSubscript:v17];
          BOOL v19 = [v4 startAfter];
          if ([(NSCountedSet *)self->_launchesPerApp countForObject:v17] > 9
            || ([v4 launchReason],
                id v20 = objc_claimAutoreleasedReturnValue(),
                BOOL v21 = v20 == (void *)_DASLaunchReasonBackgroundProcessing,
                v20,
                v21))
          {
            id v22 = [v4 launchReason];
            BOOL v23 = v22 == (void *)_DASLaunchReasonBackgroundProcessing;

            double v24 = v23 ? *(double *)&qword_1001C31C0 : 450.0;
            if (v18)
            {
              id v25 = [v4 startAfter];
              [v25 timeIntervalSinceDate:v18];
              BOOL v27 = v26 < v24;

              if (v27)
              {
                int v28 = [v18 dateByAddingTimeInterval:v24];
                [v4 setStartAfter:v28];

                double v29 = [v4 startAfter];
                [v4 setStartBefore:v29];

                BOOL v30 = +[_DASDaemonLogger logForCategory:@"bar"];
                if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
                {
                  uint64_t v31 = [v4 startAfter];
                  [v31 timeIntervalSinceDate:v19];
                  double v33 = v32;
                  long long v34 = [v4 startAfter];
                  *(_DWORD *)buf = 138412802;
                  id v40 = v4;
                  __int16 v41 = 2048;
                  double v42 = v33 / 60.0;
                  __int16 v43 = 2112;
                  long long v44 = v34;
                  _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "Advancing start date for %@ by %3.1lf minutes to %@", buf, 0x20u);
                }
              }
            }
          }

          objc_sync_exit(v12);
        }
      }
    }
    else
    {
    }
  }
}

- (void)startedActivities:(id)a3
{
  id v4 = a3;
  unsigned int v5 = (void *)os_transaction_create();
  unsigned int v6 = self;
  objc_sync_enter(v6);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v8 = v4;
  id v9 = [v8 countByEnumeratingWithState:&v15 objects:v21 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v16;
    do
    {
      id v11 = 0;
      do
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v8);
        }
        [(_DASDaemon *)v6 moveActivityToRunning:*(void *)(*((void *)&v15 + 1) + 8 * (void)v11)];
        id v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      id v9 = [v8 countByEnumeratingWithState:&v15 objects:v21 count:16];
    }
    while (v9);
  }

  objc_sync_exit(v6);

  evaluationQueue = v6->_evaluationQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000BEB50;
  block[3] = &unk_1001754F8;
  void block[4] = v6;
  dispatch_sync(evaluationQueue, block);
  id v13 = +[_DASDaemonLogger defaultCategory];
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v20 = v8;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Started activities: %{public}@", buf, 0xCu);
  }
}

- (void)submitActivities:(id)a3
{
  id v4 = a3;
  uint64_t v70 = os_transaction_create();
  unsigned int v5 = self;
  objc_sync_enter(v5);
  unsigned int v6 = +[_DASDaemonLogger defaultCategory];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v98 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Submitted activities: %{public}@", buf, 0xCu);
  }

  id v7 = [v4 count];
  long long v81 = +[NSMutableDictionary dictionaryWithCapacity:v7];
  uint64_t v73 = +[NSMutableDictionary dictionaryWithCapacity:[(NSMutableDictionary *)v5->_groups count]];
  id v74 = +[NSMutableSet setWithCapacity:v7];
  long long v78 = +[NSMutableSet setWithCapacity:v7];
  long long v77 = +[NSMutableSet setWithCapacity:v7];
  uint64_t v75 = +[NSMutableSet setWithCapacity:v7];
  long long v85 = +[NSDate date];
  long long v93 = 0u;
  long long v94 = 0u;
  long long v91 = 0u;
  long long v92 = 0u;
  id obj = v4;
  id v8 = [obj countByEnumeratingWithState:&v91 objects:v96 count:16];
  if (v8)
  {
    uint64_t v83 = *(void *)v92;
    uint64_t v79 = _DASLaunchReasonBackgroundRemoteNotification;
    lock = &v5->_groupLock;
    uint64_t v76 = kNWEndpointKey;
    do
    {
      id v84 = v8;
      for (i = 0; i != v84; i = (char *)i + 1)
      {
        if (*(void *)v92 != v83) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void **)(*((void *)&v91 + 1) + 8 * i);
        id v11 = [v10 remoteDevice:v70];
        if (v11)
        {
          BOOL v12 = [v10 targetDevice] == (id)3;

          if (v12) {
            [(_DASRemoteDeviceNearbyMonitor *)v5->_remoteDeviceNearbyMonitor registerForRemoteDeviceWithActivity:v10];
          }
        }
        id v13 = [v10 remoteDevice];
        if (v13)
        {
          unsigned int v14 = [v10 requiresRemoteDeviceWake];

          if (v14) {
            [(_DASRemoteDeviceWakeMonitor *)v5->_remoteDeviceWakeMonitor registerRemoteDeviceWakeStateWithActivity:v10];
          }
        }
        long long v15 = [v10 diskVolume];

        if (v15) {
          [(_DASDiskSpaceMonitor *)v5->_diskSpaceMonitor registerForPurgeableSpaceWithActivity:v10];
        }
        [(_DASDaemon *)v5 clearActivityFromPrerunning:v10];
        long long v16 = [v10 submitDate];
        BOOL v17 = v16 == 0;

        if (v17) {
          [v10 setSubmitDate:v85];
        }
        if (+[_DASCheckpointRecorder shouldLogCheckpointForActivity:v10])
        {
          long long v18 = +[_DASCheckpointRecorder sharedInstance];
          [v18 reportTaskCheckpoint:10 forTask:v10 error:0];
        }
        BOOL v19 = [v10 featureCodes];
        if (v19)
        {
        }
        else
        {
          id v20 = [v10 fastPass];
          BOOL v21 = v20 == 0;

          if (v21) {
            goto LABEL_24;
          }
        }
        id v22 = +[_DASCheckpointRecorder sharedInstance];
        BOOL v23 = [v10 name];
        double v24 = [v10 featureCodes];
        id v25 = [v10 fastPass];
        [v22 addFeatureCodesForTask:v23 featureCodes:v24 semanticVersion:[v25 semanticVersion]];

LABEL_24:
        double v26 = [v10 producedResultIdentifiers];
        if (v26)
        {
        }
        else
        {
          BOOL v27 = [v10 dependencies];
          BOOL v28 = v27 == 0;

          if (v28) {
            goto LABEL_35;
          }
        }
        double v29 = +[NSMutableSet set];
        long long v89 = 0u;
        long long v90 = 0u;
        long long v87 = 0u;
        long long v88 = 0u;
        BOOL v30 = [v10 dependencies];
        id v31 = [v30 countByEnumeratingWithState:&v87 objects:v95 count:16];
        if (v31)
        {
          uint64_t v32 = *(void *)v88;
          do
          {
            for (j = 0; j != v31; j = (char *)j + 1)
            {
              if (*(void *)v88 != v32) {
                objc_enumerationMutation(v30);
              }
              long long v34 = [*(id *)(*((void *)&v87 + 1) + 8 * (void)j) identifier];
              [v29 addObject:v34];
            }
            id v31 = [v30 countByEnumeratingWithState:&v87 objects:v95 count:16];
          }
          while (v31);
        }

        long long v35 = +[_DASCheckpointRecorder sharedInstance];
        long long v36 = [v10 name];
        long long v37 = [v10 producedResultIdentifiers];
        [v35 addDependencyInfoForTask:v36 producedResultIdentifiers:v37 dependencyIdentifiers:v29];

LABEL_35:
        [(_DASDaemon *)v5 computeStaticPriorityForActivity:v10];
        +[_DASConditionScore setActivityShouldBypassPredictions:v10];
        [(_DASDaemon *)v5 addTriggersToActivity:v10];
        if ([v10 requestsApplicationLaunch])
        {
          long long v38 = [v10 launchReason];
          unsigned int v39 = [v38 isEqualToString:v79];

          if (v39)
          {
            unsigned int v40 = [v10 isSilentPush];
            id v41 = [v10 schedulingPriority];
            if ((unint64_t)v41 >= _DASSchedulingPriorityBackground) {
              unsigned int v42 = v40;
            }
            else {
              unsigned int v42 = 0;
            }
            if (v42 == 1)
            {
              __int16 v43 = +[_DASDaemonLogger logForCategory:@"bar"];
              if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
              {
                id v67 = [v10 relatedApplications];
                id v68 = [v67 firstObject];
                *(_DWORD *)buf = 138412290;
                id v98 = v68;
                _os_log_error_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_ERROR, "High-priority silent push for %@", buf, 0xCu);
              }
              [v75 addObject:v10];
              goto LABEL_75;
            }
            buf[0] = 0;
            barScheduler = v5->_barScheduler;
            unsigned __int8 v45 = [v10 relatedApplications];
            unsigned __int8 v46 = [v45 firstObject];
            unsigned int v47 = [(_DASBARScheduler *)barScheduler pushLaunchAllowedForApp:v46 immediately:buf];

            if (buf[0]) {
              unsigned int v48 = v47;
            }
            else {
              unsigned int v48 = 0;
            }
            if (v48 == 1)
            {
              [(_DASDaemon *)v5 addLaunchRequest:v10];
              [(_DASDaemon *)v5 immediatelyBeginWorkForActivity:v10];
              goto LABEL_75;
            }
            id v49 = v5->_barScheduler;
            unsigned __int8 v50 = [v10 relatedApplications];
            id v51 = [v50 firstObject];
            LODWORD(v49) = [(_DASBARScheduler *)v49 isNewsstandApp:v51];

            if (v49) {
              [v10 setRequestsNewsstandLaunch:1];
            }
          }
          if (![(_DASDaemon *)v5 addLaunchRequest:v10])
          {
            [v75 addObject:v10];
            goto LABEL_75;
          }
        }
        if (([v10 requestsApplicationLaunch] & 1) != 0
          || [v10 requestsExtensionLaunch])
        {
          if ([v10 shouldBePersisted]) {
            [v74 addObject:v10];
          }
          id v52 = [v10 groupName];

          if (v52)
          {
            os_unfair_lock_lock(lock);
            groups = v5->_groups;
            id v54 = [v10 groupName];
            char v55 = [(NSMutableDictionary *)groups objectForKeyedSubscript:v54];

            if (v55)
            {
              char v56 = [v10 name];
              [v73 setObject:v55 forKey:v56];
            }
            os_unfair_lock_unlock(lock);
          }
        }
        if ([v10 userRequestedBackupTask]) {
          [(_DASUserRequestedBackupTaskManager *)v5->_backupTaskManager activitySubmitted:v10];
        }
        BOOL v57 = [v10 groupName];
        if (v57)
        {
          BOOL v58 = [v81 objectForKeyedSubscript:v57];
          BOOL v59 = v58;
          if (v58)
          {
            [v58 addObject:v10];
          }
          else
          {
            BOOL v60 = +[NSMutableSet setWithObject:v10];
            [v81 setObject:v60 forKeyedSubscript:v57];
          }
        }
        +[_DASConditionScore computeOptimalScoreAndDateForActivity:v10];
        os_unfair_recursive_lock_lock_with_options();
        [(NSMutableSet *)v5->_pendingTasks addObject:v10];
        os_unfair_recursive_lock_unlock();
        if ([(_DASDaemon *)v5 shouldEvaluateTask:v10 atDate:v85]) {
          [v78 addObject:v10];
        }
        if ([(_DASNetworkEvaluationMonitor *)v5->_networkEvaluationMonitor requiresNetworkPathMonitoring:v10])
        {
          networkEvaluationMonitor = v5->_networkEvaluationMonitor;
          uint64_t v63 = [v10 uuid];
          id v64 = +[_DASNetworkEvaluationMonitor nwParametersForActivity:v10];
          uint64_t v65 = [v10 userInfo];
          uint64_t v66 = [v65 objectForKeyedSubscript:v76];
          [(_DASNetworkEvaluationMonitor *)networkEvaluationMonitor startMonitoringActivity:v63 withNetworkParameters:v64 withEndpoint:v66];
        }
        if ([v10 triggersRestart]) {
          [v77 addObject:v10];
        }

LABEL_75:
      }
      id v8 = [obj countByEnumeratingWithState:&v91 objects:v96 count:16];
    }
    while (v8);
  }

  [(_DASDaemon *)v5 addPendingActivitiesToGroups:v81];
  if ([v74 count])
  {
    [(_DASDataStore *)v5->_store saveActivities:v74];
  }
  -[_DASDaemon cancelActivities:](v5, "cancelActivities:", v75, v70);
  [(_DASDaemon *)v5 evaluateScoreAndRunActivities:v78];
  [(_DASDaemon *)v5 determineNextTimerFireDateAndSchedule];

  objc_sync_exit(v5);
}

- (void)handleRunningActivities:(id)a3
{
  id v4 = a3;
  unsigned int v5 = +[NSDate date];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        -[_DASDaemon prepareActivityForStart:atTime:](self, "prepareActivityForStart:atTime:", *(void *)(*((void *)&v11 + 1) + 8 * (void)v10), v5, (void)v11);
        uint64_t v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (void)cleanupForActivity:(id)a3 wasCompleted:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = v6;
  if (!v6) {
    goto LABEL_72;
  }
  id v8 = [v6 assertion];

  p_vtable = &OBJC_METACLASS____DASPolicyResponseRationale.vtable;
  if (v8)
  {
    uint64_t v10 = +[_DASDaemonLogger logForCategory:@"assertions"];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      sub_1000FED70();
    }

    long long v11 = [v7 assertion];
    id v103 = 0;
    unsigned __int8 v12 = [v11 invalidateWithError:&v103];
    id v13 = v103;

    if ((v12 & 1) == 0 && v13)
    {
      long long v14 = +[_DASDaemonLogger logForCategory:@"bar"];
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        sub_1000FED00();
      }
    }
  }
  os_unfair_recursive_lock_lock_with_options();
  [(NSMutableSet *)self->_runningTasks removeObject:v7];
  [(NSMutableSet *)self->_pendingTasks removeObject:v7];
  [(NSMutableSet *)self->_prerunningTasks removeObject:v7];
  [(_DASDaemon *)self removeActivityFromNestedMaps:v7];
  long long v15 = +[_DASDaemonLogger logForCategory:@"runningTasks"];
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
    sub_1000FEAF0();
  }

  os_unfair_recursive_lock_unlock();
  [(_DASDaemon *)self releaseAssertion:v7];
  long long v16 = +[_DASPLLogger sharedInstance];
  [v16 recordActivity:v7];

  [(_DASDaemon *)self reportOversizeLoadSymptomForActivity:v7 atStart:0];
  if (([v7 requestsApplicationLaunch] & 1) == 0) {
    [(_DASBudgetManager *)self->_budgetManager reportActivityNoLongerRunning:v7];
  }
  [(_DASActivityDependencyManager *)self->_dependencyManager endDependencyMonitoringForActivity:v7];
  if ([(_DASNetworkEvaluationMonitor *)self->_networkEvaluationMonitor requiresNetworkPathMonitoring:v7])
  {
    networkEvaluationMonitor = self->_networkEvaluationMonitor;
    long long v18 = [v7 uuid];
    [(_DASNetworkEvaluationMonitor *)networkEvaluationMonitor stopMonitoringActivity:v18];
  }
  uint64_t v19 = [v7 remoteDevice];
  if (v19)
  {
    id v20 = (void *)v19;
    id v21 = [v7 targetDevice];

    if (v21 == (id)3) {
      [(_DASRemoteDeviceNearbyMonitor *)self->_remoteDeviceNearbyMonitor unregisterForRemoteDeviceWithActivity:v7];
    }
  }
  uint64_t v22 = [v7 remoteDevice];
  if (v22)
  {
    BOOL v23 = (void *)v22;
    unsigned int v24 = [v7 requiresRemoteDeviceWake];

    if (v24) {
      [(_DASRemoteDeviceWakeMonitor *)self->_remoteDeviceWakeMonitor unregisterRemoteDeviceWakeStateWithActivity:v7];
    }
  }
  id v25 = [v7 diskVolume];

  if (v25) {
    [(_DASDiskSpaceMonitor *)self->_diskSpaceMonitor unregisterForPurgeableSpaceWithActivity:v7];
  }
  [(_DASActivityRateLimitManager *)self->_rateLimiter completeActivity:v7];
  double v26 = [v7 groupName];

  if (!v26) {
    goto LABEL_35;
  }
  os_unfair_lock_lock(&self->_groupLock);
  groupToPrerunningTasks = self->_groupToPrerunningTasks;
  BOOL v28 = [v7 groupName];
  double v29 = [(NSMutableDictionary *)groupToPrerunningTasks objectForKeyedSubscript:v28];
  [v29 removeObject:v7];

  groupToPendingTasks = self->_groupToPendingTasks;
  id v31 = [v7 groupName];
  uint64_t v32 = [(NSMutableDictionary *)groupToPendingTasks objectForKeyedSubscript:v31];
  [v32 removeObject:v7];

  groupToRunningTasks = self->_groupToRunningTasks;
  long long v34 = [v7 groupName];
  long long v35 = [(NSMutableDictionary *)groupToRunningTasks objectForKeyedSubscript:v34];
  unsigned int v36 = [v35 containsObject:v7];

  if (!v36)
  {
    os_unfair_lock_unlock(&self->_groupLock);
LABEL_35:
    int v48 = 0;
    goto LABEL_36;
  }
  long long v37 = self->_groupToRunningTasks;
  long long v38 = [v7 groupName];
  unsigned int v39 = [(NSMutableDictionary *)v37 objectForKeyedSubscript:v38];
  [v39 removeObject:v7];

  unsigned int v40 = +[_DASDaemonLogger logForCategory:@"lifecycle(activityGroup)"];
  if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
  {
    id v41 = [v7 groupName];
    unsigned int v42 = self->_groupToRunningTasks;
    __int16 v43 = [v7 groupName];
    long long v44 = [(NSMutableDictionary *)v42 objectForKeyedSubscript:v43];
    id v45 = [v44 count];
    *(_DWORD *)buf = 138543874;
    id v106 = v7;
    __int16 v107 = 2112;
    double v108 = *(double *)&v41;
    __int16 v109 = 2048;
    id v110 = v45;
    _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, "NO LONGER RUNNING %{public}@ ...Tasks running in group [%@] are %ld!", buf, 0x20u);
  }
  os_unfair_lock_unlock(&self->_groupLock);
  unsigned __int8 v46 = [v7 groupName];
  if ([v46 isEqualToString:_DASDefaultGroupName]) {
    goto LABEL_32;
  }
  unsigned int v47 = [v7 groupName];
  if ([v47 isEqualToString:_DASDefaultNetworkGroupName])
  {

LABEL_32:
LABEL_33:
    int v48 = 1;
    goto LABEL_36;
  }
  uint64_t v79 = [v7 groupName];
  unsigned __int8 v80 = [v79 isEqualToString:_DASDefaultRemoteGroupName];

  if (v80) {
    goto LABEL_33;
  }
  long long v81 = +[NSMutableSet set];
  os_unfair_lock_lock(&self->_groupLock);
  long long v82 = self->_groupToPendingTasks;
  uint64_t v83 = [v7 groupName];
  id v84 = [(NSMutableDictionary *)v82 objectForKeyedSubscript:v83];
  id v85 = [v84 copy];

  long long v101 = 0u;
  long long v102 = 0u;
  long long v99 = 0u;
  long long v100 = 0u;
  id v86 = v85;
  id v87 = [v86 countByEnumeratingWithState:&v99 objects:v104 count:16];
  if (v87)
  {
    id v88 = v87;
    uint64_t v89 = *(void *)v100;
    do
    {
      for (i = 0; i != v88; i = (char *)i + 1)
      {
        if (*(void *)v100 != v89) {
          objc_enumerationMutation(v86);
        }
        long long v91 = *(void **)(*((void *)&v99 + 1) + 8 * i);
        if (([v91 isIntensive] & 1) == 0) {
          [v81 addObject:v91];
        }
      }
      id v88 = [v86 countByEnumeratingWithState:&v99 objects:v104 count:16];
    }
    while (v88);
  }

  os_unfair_lock_unlock(&self->_groupLock);
  if ([v81 count])
  {
    evaluationQueue = self->_evaluationQueue;
    block = _NSConcreteStackBlock;
    uint64_t v94 = 3221225472;
    id v95 = sub_1000C0244;
    id v96 = &unk_100175570;
    id v97 = self;
    id v98 = v81;
    dispatch_async(evaluationQueue, &block);
  }
  int v48 = 1;
  p_vtable = (void **)(&OBJC_METACLASS____DASPolicyResponseRationale + 24);
LABEL_36:
  if (([v7 requestsApplicationLaunch] & 1) != 0
    || [v7 requestsExtensionLaunch])
  {
    [(_DASDaemon *)self removeLaunchRequest:v7];
    if ([v7 shouldBePersisted]) {
      [(_DASDataStore *)self->_store deleteActivity:v7];
    }
  }
  id v49 = +[NSDate date];
  if ([v7 isIntensive])
  {
    unsigned __int8 v50 = [v7 startDate];

    if (v50)
    {
      id v51 = [v7 startDate];
      [v49 timeIntervalSinceDate:v51];
      unint64_t v53 = llround(v52 / 60.0);

      +[_DASMetricRecorder incrementOccurrencesForKey:@"com.apple.das.runtimemins.intensive" byCount:v53];
      id v54 = [v7 name];
      unsigned __int8 v55 = [v54 isEqualToString:@"com.apple.photoanalysisd.backgroundanalysis"];

      if (v55)
      {
        char v56 = &off_100177338;
      }
      else
      {
        BOOL v57 = [v7 name];
        unsigned int v58 = [v57 isEqualToString:@"com.apple.mediaanalysisd.fullanalysis"];

        if (!v58) {
          goto LABEL_47;
        }
        char v56 = &off_100177340;
      }
      +[_DASMetricRecorder incrementOccurrencesForKey:*v56 byCount:v53];
LABEL_47:
      id v59 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.duetactivityscheduler"];
      unsigned int v60 = [v59 BOOLForKey:@"postIntensiveActivityNotifications"];

      if (v60)
      {
        char v61 = [v7 suspendRequestDate];

        if (v61) {
          CFStringRef v62 = @"Intensive Activity Suspended";
        }
        else {
          CFStringRef v62 = @"Intensive Activity Completed";
        }
        uint64_t v63 = [v7 name];
        id v64 = [v7 startDate];
        [v49 timeIntervalSinceDate:v64];
        if (v4) {
          CFStringRef v66 = @"%@ completed after running for %.0f minutes";
        }
        else {
          CFStringRef v66 = @"%@ deferred after running for %.0f minutes";
        }
        id v67 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v66, v63, v65 / 60.0, block, v94, v95, v96, v97);

        [(_DASNotificationManager *)self->_notificationManager postNotificationAtDate:0 withTitle:v62 withTextContent:v67 icon:0 url:0 expirationDate:0];
      }
    }
  }
  id v68 = [v7 startDate];

  if (v68)
  {
    __int16 v69 = [v7 startDate];
    [v49 timeIntervalSinceDate:v69];
    double v71 = v70 / 60.0;

    if (v71 > 60.0)
    {
      id v72 = [p_vtable + 447 logForCategory:@"lifecycle"];
      if (os_log_type_enabled(v72, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        id v106 = v7;
        __int16 v107 = 2048;
        double v108 = v71;
        _os_log_impl((void *)&_mh_execute_header, v72, OS_LOG_TYPE_DEFAULT, "Activity %{public}@ ran for %lf minutes", buf, 0x16u);
      }
    }
  }
  uint64_t v73 = [v7 startDate];
  if (v73)
  {
    id v74 = [v7 suspendRequestDate];
    if (v74)
    {

LABEL_68:
      goto LABEL_69;
    }
  }
  uint64_t v75 = +[_DASUrgencyOverridePolicy policyInstance];
  unsigned int v76 = [v75 appliesToActivity:v7];

  if (v73)
  {

    if ((v76 & 1) == 0) {
      goto LABEL_69;
    }
    goto LABEL_67;
  }
  if (v76)
  {
LABEL_67:
    long long v77 = +[_DASUrgencyOverridePolicy policyInstance];
    long long v78 = [v7 name];
    [v77 removeActivity:v78];

    uint64_t v73 = +[_DASPhotosPolicy policyInstance];
    [v73 setIntentSyncIsEngaged:0];
    goto LABEL_68;
  }
LABEL_69:
  [(_DASDaemon *)self logLimitations:v7];
  if (v48) {
    [(_DASBatchingQueue *)self->_activityCompletedBatchingQueue addWorkItem:v7];
  }

LABEL_72:
}

- (void)removeActivityFromNestedMaps:(id)a3
{
  id v4 = a3;
  [(_DASDaemon *)self removeActivityFromTriggerMap:v4];
  [(_DASDaemon *)self removeActivityFromGroupToPendingTasks:v4];
  [(_DASDaemon *)self removeActivityFromIncompatibleActivitiesMap:v4];
}

- (void)removeActivityFromTriggerMap:(id)a3
{
  id v4 = a3;
  unsigned int v5 = self->_triggerToActivitiesMap;
  objc_sync_enter(v5);
  triggerToActivitiesMap = self->_triggerToActivitiesMap;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000C038C;
  v8[3] = &unk_100177B58;
  id v7 = v4;
  id v9 = v7;
  [(NSMutableDictionary *)triggerToActivitiesMap enumerateKeysAndObjectsUsingBlock:v8];

  objc_sync_exit(v5);
}

- (void)removeActivityFromGroupToPendingTasks:(id)a3
{
  id v4 = a3;
  p_groupLock = &self->_groupLock;
  os_unfair_lock_lock(&self->_groupLock);
  groupToPendingTasks = self->_groupToPendingTasks;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000C0454;
  v8[3] = &unk_100177B58;
  id v9 = v4;
  id v7 = v4;
  [(NSMutableDictionary *)groupToPendingTasks enumerateKeysAndObjectsUsingBlock:v8];
  os_unfair_lock_unlock(p_groupLock);
}

- (void)removeActivityFromIncompatibleActivitiesMap:(id)a3
{
  id v4 = a3;
  unsigned int v5 = self->_activityToIncompatibleActivitiesMap;
  objc_sync_enter(v5);
  activityToIncompatibleActivitiesMap = self->_activityToIncompatibleActivitiesMap;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000C0538;
  v8[3] = &unk_100177B58;
  id v7 = v4;
  id v9 = v7;
  [(NSMutableDictionary *)activityToIncompatibleActivitiesMap enumerateKeysAndObjectsUsingBlock:v8];

  objc_sync_exit(v5);
}

- (void)activityStarted:(id)a3
{
  id v4 = a3;
  if ([v4 delayedStart])
  {
    unsigned int v5 = (void *)os_transaction_create();
    id v6 = +[_DASDaemonLogger logForCategory:@"lifecycle"];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = [v4 shortDescription];
      *(_DWORD *)buf = 138543362;
      id v21 = v7;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "STARTING %{public}@!", buf, 0xCu);
    }
    os_unfair_recursive_lock_lock_with_options();
    prerunningTasks = self->_prerunningTasks;
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_1000C0800;
    v18[3] = &unk_100177E18;
    id v9 = v4;
    id v19 = v9;
    uint64_t v10 = [(NSMutableSet *)prerunningTasks objectsPassingTest:v18];
    if ([v10 count])
    {
      long long v11 = [v10 anyObject];
      [v9 reconcileWithActivity:v11];
    }
    unsigned __int8 v12 = [(_DASDaemon *)self currentReportingConditions];
    [v9 setStartConditions:v12];

    os_unfair_recursive_lock_unlock();
    [(_DASDaemon *)self createAssertion:v9];
    id v13 = +[_DASPLLogger sharedInstance];
    [v13 recordActivityLifeCycleStart:v9];

    long long v14 = +[NSSet setWithObject:v9];
    [(_DASDaemon *)self handleRunningActivities:v14];

    [(_DASDaemon *)self recordToTaskRegistry:v9 lifeCycleStateName:@"started"];
    if (([v9 wasForceRun] & 1) == 0)
    {
      evaluationQueue = self->_evaluationQueue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_1000C0874;
      block[3] = &unk_100175570;
      void block[4] = self;
      id v17 = v9;
      dispatch_sync(evaluationQueue, block);
    }
  }
}

- (id)currentReportingConditions
{
  uint64_t v29 = 0;
  int64_t v3 = +[_DASNetworkQualityPolicy currentNetworkQualityWithContext:self->_context interface:&v29];
  context = self->_context;
  unsigned int v5 = +[_CDContextQueries keyPathForBatteryStateDataDictionary];
  id v6 = [(_CDLocalContext *)context objectForKeyedSubscript:v5];

  v30[0] = @"batteryLevel";
  BOOL v28 = +[_CDContextQueries batteryPercentageKey];
  uint64_t v7 = [v6 objectForKeyedSubscript:v28];
  id v8 = (void *)v7;
  if (v7) {
    id v9 = (_UNKNOWN **)v7;
  }
  else {
    id v9 = &off_1001873D8;
  }
  v31[0] = v9;
  v30[1] = @"onCharger";
  BOOL v27 = +[_CDContextQueries batteryExternalConnectedKey];
  uint64_t v10 = [v6 objectForKeyedSubscript:v27];
  long long v11 = (void *)v10;
  if (v10) {
    unsigned __int8 v12 = (_UNKNOWN **)v10;
  }
  else {
    unsigned __int8 v12 = &off_1001873D8;
  }
  v31[1] = v12;
  v30[2] = @"nwInterface";
  id v13 = +[NSNumber numberWithInteger:v29];
  void v31[2] = v13;
  v30[3] = @"nwQuality";
  long long v14 = +[NSNumber numberWithInteger:v3];
  v31[3] = v14;
  v30[4] = @"idle";
  long long v15 = self->_context;
  long long v16 = +[_CDContextQueries keyPathForInUseStatus];
  uint64_t v17 = [(_CDLocalContext *)v15 objectForKeyedSubscript:v16];
  long long v18 = (void *)v17;
  if (v17) {
    id v19 = (_UNKNOWN **)v17;
  }
  else {
    id v19 = &off_1001873D8;
  }
  v31[4] = v19;
  v30[5] = @"thermalLevel";
  id v20 = self->_context;
  id v21 = +[_CDContextQueries keyPathForThermalPressureLevel];
  uint64_t v22 = [(_CDLocalContext *)v20 objectForKeyedSubscript:v21];
  BOOL v23 = (void *)v22;
  if (v22) {
    unsigned int v24 = (_UNKNOWN **)v22;
  }
  else {
    unsigned int v24 = &off_1001873D8;
  }
  v31[5] = v24;
  id v25 = +[NSDictionary dictionaryWithObjects:v31 forKeys:v30 count:6];

  return v25;
}

- (void)logLimitations:(id)a3
{
  id v4 = a3;
  if (([v4 requestsApplicationLaunch] & 1) == 0)
  {
    unsigned int v5 = [v4 startDate];
    if (v5)
    {
    }
    else
    {
      uint64_t v10 = [v4 limitationResponse];
      if (!v10) {
        goto LABEL_8;
      }
      long long v11 = (void *)v10;
      unsigned __int8 v12 = [v4 limitationResponse];
      id v13 = [v12 count];

      if (!v13) {
        goto LABEL_8;
      }
    }
    id v6 = v4;
    AnalyticsSendEventLazy();
    uint64_t v7 = [v6 startDate];
    if (v7)
    {
      id v8 = (void *)v7;
      unsigned int v9 = [(_DASRuntimeLimiter *)self->_runtimeLimiter limitsApplyToActivity:v6];

      if (v9)
      {
        id v14 = v6;
        AnalyticsSendEventLazy();
      }
    }
  }
LABEL_8:
}

- (id)activityAnalyticsWithActivity:(id)a3 didComplete:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  double v108 = [v6 startDate];
  uint64_t v7 = +[NSDate date];
  id v8 = [v6 startBefore];
  unsigned int v9 = [v6 startAfter];
  [v8 timeIntervalSinceDate:v9];
  uint64_t v11 = (uint64_t)v10;

  id v106 = [v6 startConditions];
  id v105 = [(_DASDaemon *)self currentReportingConditions];
  unsigned __int8 v12 = [v6 name];
  if ([(__CFString *)v12 hasPrefix:@"com.apple.CFNetwork-cc"])
  {
    CFStringRef v13 = @"com.apple.CFNetwork";
  }
  else
  {
    if (![(__CFString *)v12 containsString:@"x-coredata"])
    {
      id v110 = v12;
      goto LABEL_7;
    }
    CFStringRef v13 = [(__CFString *)v12 substringWithRange:0, [(__CFString *)v12 rangeOfString:@".x-coredata"]];
  }

  id v110 = (__CFString *)v13;
LABEL_7:
  uint64_t v14 = 0;
  while (1)
  {
    [v6 interval];
    uint64_t v16 = qword_100126E88[v14];
    if (v16 == (uint64_t)v15) {
      break;
    }
    [v6 interval];
    if (v17 < (double)v16) {
      break;
    }
    if (++v14 == 120) {
      goto LABEL_13;
    }
  }
  +[NSNumber numberWithLong:](NSNumber, "numberWithLong:");
  long long v18 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue();
  if (v18) {
    goto LABEL_14;
  }
LABEL_13:
  long long v18 = &off_100187408;
LABEL_14:
  __int16 v109 = v18;
  uint64_t v19 = 0;
  while (1)
  {
    uint64_t v20 = qword_100126E88[v19];
    if (v20 == v11) {
      break;
    }
    if (v20 > v11)
    {
      uint64_t v21 = v20 - 1;
      goto LABEL_21;
    }
    if (++v19 == 120) {
      goto LABEL_22;
    }
  }
  uint64_t v21 = v11;
LABEL_21:
  uint64_t v22 = +[NSNumber numberWithLong:v21];
  if (v22) {
    goto LABEL_23;
  }
LABEL_22:
  uint64_t v22 = &off_100187408;
LABEL_23:
  BOOL v23 = [v6 startDate];
  unsigned int v24 = [v6 startBefore];
  [v23 timeIntervalSinceDate:v24];
  int v26 = llround(v25);
  uint64_t v27 = v26;

  if (v26 < 1)
  {
    int v31 = 120;
    uint64_t v32 = v22;
    while (1)
    {
      if (!v31)
      {
        unsigned int v36 = 0;
        goto LABEL_41;
      }
      if (!(v26 + qword_100126E88[v31 - 1])) {
        break;
      }
      uint64_t v33 = qword_100126E88[v31--];
      if (v33 < -(uint64_t)v26)
      {
        uint64_t v34 = 1 - v33;
        goto LABEL_40;
      }
    }
    uint64_t v34 = -qword_100126E88[v31];
LABEL_40:
    unsigned int v36 = +[NSNumber numberWithLong:v34];
LABEL_41:

    uint64_t v29 = &off_1001873D8;
  }
  else
  {
    uint64_t v28 = 0;
    uint64_t v29 = v22;
    while (1)
    {
      uint64_t v30 = qword_100126E88[v28];
      if (v30 == v27) {
        break;
      }
      if (v30 > v27)
      {
        uint64_t v35 = v30 - 1;
        goto LABEL_36;
      }
      if (++v28 == 120) {
        goto LABEL_37;
      }
    }
    uint64_t v35 = v27;
LABEL_36:
    unsigned int v36 = +[NSNumber numberWithLong:v35];
    if (v36) {
      goto LABEL_42;
    }
LABEL_37:
    unsigned int v36 = &off_100187408;
  }
LABEL_42:
  long long v37 = [v6 startDate];
  long long v38 = [v6 startAfter];
  [v37 timeIntervalSinceDate:v38];
  double v40 = round(v39 / (double)v11 * 5.0) * 20.0;

  double v41 = 1000.0;
  if (v40 <= 1000.0) {
    double v41 = v40;
  }
  double v42 = fmax(v41, 0.0);
  __int16 v43 = +[NSCalendar currentCalendar];
  long long v44 = [v43 components:28 fromDate:v7];
  long long v102 = v43;
  uint64_t v45 = [v43 dateFromComponents:v44];

  long long v101 = (void *)v45;
  [v7 timeIntervalSinceDate:v45];
  unsigned int v97 = (int)(v46 / 3600.0) % 24;
  v112[0] = v110;
  v111[0] = @"Name";
  v111[1] = @"Priority";
  long long v100 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v6 schedulingPriority]);
  v112[1] = v100;
  v111[2] = @"RuntimeMins";
  long long v99 = [v6 startDate];
  __int16 v107 = v7;
  if (v99)
  {
    [v7 timeIntervalSinceDate:v108];
    CFStringRef v48 = +[NSNumber numberWithDouble:round(v47 / 60.0)];
  }
  else
  {
    CFStringRef v48 = &stru_100179948;
  }
  v112[2] = v48;
  v112[3] = v109;
  v111[3] = @"Interval";
  v111[4] = @"Completed";
  id v98 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v4, v48);
  v112[4] = v98;
  v111[5] = @"Backlogged";
  id v96 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v6 backlogged]);
  v112[5] = v96;
  v111[6] = @"AppLaunch";
  id v95 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v6 requestsApplicationLaunch]);
  v112[6] = v95;
  v111[7] = @"LaunchType";
  uint64_t v49 = [v6 launchReason];
  uint64_t v94 = (void *)v49;
  if (v49) {
    CFStringRef v50 = (const __CFString *)v49;
  }
  else {
    CFStringRef v50 = &stru_100179948;
  }
  v112[7] = v50;
  v111[8] = @"SuspendRequested";
  long long v93 = [v6 suspendRequestDate];
  long long v92 = +[NSNumber numberWithInt:v93 != 0];
  v112[8] = v92;
  v111[9] = @"RequiresInactivity";
  long long v91 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v6 requiresDeviceInactivity]);
  v112[9] = v91;
  v111[10] = @"RequiresPlugin";
  long long v90 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v6 requiresPlugin]);
  v112[10] = v90;
  v111[11] = @"RequiresInexpensive";
  id v51 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v6 requiresInexpensiveNetworking]);
  v112[11] = v51;
  v111[12] = @"RequiresNetworking";
  double v52 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v6 requiresNetwork]);
  v112[12] = v52;
  v111[13] = @"IsIntensive";
  unint64_t v53 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v6 isIntensive]);
  v112[13] = v53;
  v112[14] = v29;
  id v103 = v36;
  id v104 = v29;
  v111[14] = @"TimeWindow";
  v111[15] = @"DeadlineDelta";
  v112[15] = v36;
  v111[16] = @"DeadlinePct";
  id v54 = +[NSNumber numberWithDouble:v42];
  v112[16] = v54;
  v111[17] = @"DeadlinePctHist";
  unsigned __int8 v55 = +[NSNumber numberWithDouble:v42];
  v112[17] = v55;
  v111[18] = @"RecentlyUpdated";
  char v56 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", +[_DASConfig hasRecentlyUpdated]);
  v112[18] = v56;
  v111[19] = @"TimeSlot";
  BOOL v57 = +[NSNumber numberWithInt:v97];
  v112[19] = v57;
  unsigned int v58 = +[NSDictionary dictionaryWithObjects:v112 forKeys:v111 count:20];
  id v59 = [v58 mutableCopy];

  if (v99) {
  if ([v6 lastDenialValue])
  }
  {
    unsigned int v60 = +[_DASConditionScore lastDenialResponses:v6];
    if ([v60 count])
    {
      char v61 = +[NSSet setWithArray:v60];
      CFStringRef v62 = [v61 anyObject];
      [v59 setObject:v62 forKeyedSubscript:@"SuspensionReason"];
    }
  }
  uint64_t v63 = [v106 objectForKeyedSubscript:@"batteryLevel"];

  if (v63)
  {
    id v64 = [v106 objectForKeyedSubscript:@"batteryLevel"];
    [v59 setObject:v64 forKeyedSubscript:@"StartBatteryLevel"];
  }
  double v65 = [v106 objectForKeyedSubscript:@"nwInterface"];

  if (v65)
  {
    CFStringRef v66 = [v106 objectForKeyedSubscript:@"nwInterface"];
    [v59 setObject:v66 forKeyedSubscript:@"StartNWInterface"];
  }
  id v67 = [v106 objectForKeyedSubscript:@"nwQuality"];

  if (v67)
  {
    id v68 = [v106 objectForKeyedSubscript:@"nwQuality"];
    [v59 setObject:v68 forKeyedSubscript:@"StartNWQuality"];
  }
  __int16 v69 = [v106 objectForKeyedSubscript:@"onCharger"];

  if (v69)
  {
    double v70 = [v106 objectForKeyedSubscript:@"onCharger"];
    [v59 setObject:v70 forKeyedSubscript:@"StartedOnCharger"];
  }
  double v71 = [v106 objectForKeyedSubscript:@"idle"];

  if (v71)
  {
    id v72 = [v106 objectForKeyedSubscript:@"idle"];
    [v59 setObject:v72 forKeyedSubscript:@"StartIdle"];
  }
  uint64_t v73 = [v105 objectForKeyedSubscript:@"thermalLevel"];

  if (v73)
  {
    id v74 = [v105 objectForKeyedSubscript:@"thermalLevel"];
    [v59 setObject:v74 forKeyedSubscript:@"EndingThermalPressure"];
  }
  uint64_t v75 = [v105 objectForKeyedSubscript:@"batteryLevel"];

  if (v75)
  {
    unsigned int v76 = [v105 objectForKeyedSubscript:@"batteryLevel"];
    [v59 setObject:v76 forKeyedSubscript:@"EndBatteryLevel"];
  }
  long long v77 = [v105 objectForKeyedSubscript:@"nwInterface"];

  if (v77)
  {
    long long v78 = [v105 objectForKeyedSubscript:@"nwInterface"];
    [v59 setObject:v78 forKeyedSubscript:@"EndNWInterface"];
  }
  uint64_t v79 = [v105 objectForKeyedSubscript:@"nwQuality"];

  if (v79)
  {
    unsigned __int8 v80 = [v105 objectForKeyedSubscript:@"nwQuality"];
    [v59 setObject:v80 forKeyedSubscript:@"EndNWQuality"];
  }
  long long v81 = [v105 objectForKeyedSubscript:@"onCharger"];

  if (v81)
  {
    long long v82 = [v105 objectForKeyedSubscript:@"onCharger"];
    [v59 setObject:v82 forKeyedSubscript:@"EndedOnCharger"];
  }
  uint64_t v83 = [v105 objectForKeyedSubscript:@"idle"];

  if (v83)
  {
    id v84 = [v105 objectForKeyedSubscript:@"idle"];
    [v59 setObject:v84 forKeyedSubscript:@"EndIdle"];
  }
  id v85 = [v105 objectForKeyedSubscript:@"thermalLevel"];

  if (v85)
  {
    id v86 = [v105 objectForKeyedSubscript:@"thermalLevel"];
    [v59 setObject:v86 forKeyedSubscript:@"EndingThermalPressure"];
  }
  id v87 = [v59 copy];

  return v87;
}

- (void)activityCompleted:(id)a3
{
  id v4 = a3;
  uint64_t v21 = (void *)os_transaction_create();
  unsigned int v5 = +[_DASDaemonLogger logForCategory:@"lifecycle"];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [v4 shortDescription];
    *(_DWORD *)buf = 138543362;
    uint64_t v29 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "COMPLETED %{public}@", buf, 0xCu);
  }
  p_activityStateLock = &self->_activityStateLock;
  os_unfair_recursive_lock_lock_with_options();
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v7 = self->_runningTasks;
  id v8 = [(NSMutableSet *)v7 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v24;
    while (2)
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v24 != v10) {
          objc_enumerationMutation(v7);
        }
        unsigned __int8 v12 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        CFStringRef v13 = [v12 uuid:p_activityStateLock];
        uint64_t v14 = [v4 uuid];
        unsigned int v15 = [v13 isEqual:v14];

        if (v15)
        {
          [v4 reconcileWithActivity:v12];
          goto LABEL_13;
        }
      }
      id v9 = [(NSMutableSet *)v7 countByEnumeratingWithState:&v23 objects:v27 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
LABEL_13:

  os_unfair_recursive_lock_unlock();
  uint64_t v16 = +[_DASPLLogger sharedInstance];
  [v16 recordActivityLifeCycleEnd:v4];

  [(_DASDaemon *)self recordToTaskRegistry:v4 lifeCycleStateName:@"completed"];
  [(_DASDaemon *)self cleanupForActivity:v4 wasCompleted:1];
  if ([v4 isIntensive]) {
    [(_DASFairScheduleManager *)self->_fairScheduleManager activityCompleted:v4];
  }
  double v17 = +[_DASActivityDurationTracker sharedInstance];
  [v17 activityCompleted:v4];

  [(_DASActivityDependencyManager *)self->_dependencyManager reportActivityDidFinishRunning:v4];
  if ([(_DASSleepWakeMonitor *)self->_sleepWakeMonitor inADarkWake]) {
    [(_DASSleepWakeMonitor *)self->_sleepWakeMonitor recordNoLongerRunningActivity:v4];
  }
  if ([v4 userRequestedBackupTask]) {
    [(_DASUserRequestedBackupTaskManager *)self->_backupTaskManager reportActivityNoLongerRunning:v4];
  }
  long long v18 = +[NSDate date];
  [v4 setEndTime:v18];

  if (+[_DASCheckpointRecorder shouldLogCheckpointForActivity:v4])
  {
    uint64_t v19 = +[_DASCheckpointRecorder sharedInstance];
    [v19 reportTaskCheckpoint:30 forTask:v4 error:0];
  }
  if ([v4 isContinuedProcessingTask]) {
    [(_DASDaemon *)self updateCompletionStatus:1 forOngoingTask:v4];
  }
  [(_DASFeatureDurationTracker *)self->_featureDurationTracker updateFeatureDurationActivityCompleted:v4];
  if (arc4random_uniform(0x64u) == 1)
  {
    id v22 = v4;
    AnalyticsSendEventLazy();
  }
}

- (void)activityCanceled:(id)a3
{
  id v4 = a3;
  double v39 = (void *)os_transaction_create();
  unsigned int v5 = +[_DASConfig isInternalBuild];
  id v6 = +[_DASDaemonLogger logForCategory:@"lifecycle"];
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (!v7) {
      goto LABEL_7;
    }
    id v8 = [v4 shortDescription];
    *(_DWORD *)buf = 138412290;
    id v47 = v8;
    id v9 = "CANCELED: %@";
    uint64_t v10 = v6;
    uint32_t v11 = 12;
  }
  else
  {
    if (!v7) {
      goto LABEL_7;
    }
    id v8 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v4 schedulingPriority]);
    *(_DWORD *)buf = 138543618;
    id v47 = v4;
    __int16 v48 = 2114;
    uint64_t v49 = v8;
    id v9 = "CANCELED: %{public}@ at priority %{public}@";
    uint64_t v10 = v6;
    uint32_t v11 = 22;
  }
  _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, v9, buf, v11);

LABEL_7:
  p_activityStateLock = &self->_activityStateLock;
  os_unfair_recursive_lock_lock_with_options();
  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  unsigned __int8 v12 = self->_runningTasks;
  id v13 = [(NSMutableSet *)v12 countByEnumeratingWithState:&v41 objects:v45 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v42;
    while (2)
    {
      for (i = 0; i != v14; i = (char *)i + 1)
      {
        if (*(void *)v42 != v15) {
          objc_enumerationMutation(v12);
        }
        double v17 = *(void **)(*((void *)&v41 + 1) + 8 * i);
        long long v18 = [v17 uuid:p_activityStateLock];
        uint64_t v19 = [v4 uuid];
        unsigned int v20 = [v18 isEqual:v19];

        if (v20)
        {
          [v4 reconcileWithActivity:v17];
          goto LABEL_17;
        }
      }
      id v14 = [(NSMutableSet *)v12 countByEnumeratingWithState:&v41 objects:v45 count:16];
      if (v14) {
        continue;
      }
      break;
    }
  }
LABEL_17:

  if ([(NSMutableSet *)self->_runningTasks containsObject:v4])
  {
    uint64_t v21 = [v4 suspendRequestDate];
    if (v21
      || ([v4 startDate], (uint64_t v21 = objc_claimAutoreleasedReturnValue()) == 0)
      || ([v4 requestsApplicationLaunch] & 1) != 0)
    {
LABEL_19:

      goto LABEL_20;
    }
    uint64_t v35 = [v4 clientName];
    unsigned __int8 v36 = [v35 isEqualToString:_DASClientNameBGST];

    if ((v36 & 1) == 0)
    {
      uint64_t v21 = +[_DASDaemonLogger logForCategory:@"misuse"];
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        long long v37 = [v4 name];
        *(_DWORD *)buf = 138412290;
        id v47 = v37;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Please file a bug for %@ – the activity deferred without being asked to defer", buf, 0xCu);
      }
      goto LABEL_19;
    }
  }
LABEL_20:
  if (!-[NSMutableSet containsObject:](self->_runningTasks, "containsObject:", v4, p_activityStateLock))
  {
    if (!+[_DASCheckpointRecorder shouldLogCheckpointForActivity:v4])
    {
      BOOL v23 = 0;
      goto LABEL_28;
    }
    goto LABEL_25;
  }
  id v22 = [v4 suspendRequestDate];
  BOOL v23 = v22 != 0;

  if (+[_DASCheckpointRecorder shouldLogCheckpointForActivity:v4])
  {
    if (v22)
    {
      long long v24 = +[_DASCheckpointRecorder sharedInstance];
      [v24 reportTaskCheckpoint:40 forTask:v4 error:0];
      BOOL v23 = 1;
LABEL_26:

      goto LABEL_28;
    }
LABEL_25:
    long long v24 = +[_DASCheckpointRecorder sharedInstance];
    [v24 reportTaskCheckpoint:50 forTask:v4 error:0];
    BOOL v23 = 0;
    goto LABEL_26;
  }
LABEL_28:
  uint64_t v25 = [v4 fastPass];
  if (v25)
  {
    long long v26 = (void *)v25;
    unsigned int v27 = [(_DASRuntimeLimiter *)self->_runtimeLimiter featureHasNoRemainingRuntimeForActivity:v4];

    if (v27)
    {
      uint64_t v28 = +[_DASPostRestoreBUILogger sharedInstance];
      [v28 reportState:30 forActivity:v4];
    }
  }
  os_unfair_recursive_lock_unlock();
  if (v23) {
    [(_DASDaemon *)self recordToTaskRegistry:v4 lifeCycleStateName:@"suspended"];
  }
  uint64_t v29 = +[_DASPLLogger sharedInstance];
  [v29 recordActivityLifeCycleEnd:v4];

  [(_DASDaemon *)self recordToTaskRegistry:v4 lifeCycleStateName:@"canceled"];
  [(_DASDaemon *)self cleanupForActivity:v4 wasCompleted:0];
  if ([v4 isIntensive]) {
    [(_DASFairScheduleManager *)self->_fairScheduleManager activityCanceled:v4];
  }
  if ([v4 isContinuedProcessingTask]) {
    [(_DASDaemon *)self updateCompletionStatus:0 forOngoingTask:v4];
  }
  uint64_t v30 = +[_DASActivityDurationTracker sharedInstance];
  [v30 activityCanceled:v4];

  if ([v4 userRequestedBackupTask])
  {
    [v4 setCompletionStatus:3];
    [(_DASUserRequestedBackupTaskManager *)self->_backupTaskManager reportActivityNoLongerRunning:v4];
  }
  int v31 = +[NSDate date];
  [v4 setEndTime:v31];

  [(_DASFeatureDurationTracker *)self->_featureDurationTracker updateFeatureDurationActivityCompleted:v4];
  if (arc4random_uniform(0xFA0u) == 1)
  {
    id v40 = v4;
    AnalyticsSendEventLazy();
  }
  if (+[_DASPhotosPolicy isiCPLActivity:v4])
  {
    uint64_t v32 = [v4 suspendRequestDate];

    if (!v32)
    {
      uint64_t v33 = +[_DASDaemonLogger defaultCategory];
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v34 = +[NSNumber numberWithUnsignedInteger:self->_photosIsBlocked];
        *(_DWORD *)buf = 138543618;
        id v47 = v4;
        __int16 v48 = 2112;
        uint64_t v49 = v34;
        _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "Reporting photos activity no longer blocked: %{public}@ (was %@)", buf, 0x16u);
      }
      [(_DASDaemon *)self updateiCPLTasksBlocked:0];
      if (_os_feature_enabled_impl()
        && +[_DASPhotosPolicy isPhotosSyncActivity:v4]
        && [(_DASRemoteDeviceActivityMonitor *)self->_remoteDeviceActivityMonitor isRegistered])
      {
        [(_DASRemoteDeviceActivityMonitor *)self->_remoteDeviceActivityMonitor unregisterForRemoteDeviceActiveNotifications];
      }
    }
  }
}

- (void)updateActivity:(id)a3 withParameters:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [(_DASBudgetManager *)self->_budgetManager reportUpdateForActivity:v6 withDataConsumed:v7];
  uint64_t v8 = _DASUpdateActivityPercentCompletedKey;
  uint64_t v21 = v7;
  id v9 = [v7 objectForKeyedSubscript:_DASUpdateActivityPercentCompletedKey];

  if (v9)
  {
    p_activityStateLock = &self->_activityStateLock;
    os_unfair_recursive_lock_lock_with_options();
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    uint64_t v10 = self->_runningTasks;
    id v11 = [(NSMutableSet *)v10 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = *(void *)v23;
      do
      {
        for (i = 0; i != v12; i = (char *)i + 1)
        {
          if (*(void *)v23 != v13) {
            objc_enumerationMutation(v10);
          }
          uint64_t v15 = *(void **)(*((void *)&v22 + 1) + 8 * i);
          uint64_t v16 = [v15 uuid:p_activityStateLock];
          double v17 = [v6 uuid];
          unsigned int v18 = [v16 isEqual:v17];

          if (v18)
          {
            uint64_t v19 = [v21 objectForKeyedSubscript:v8];
            [v19 doubleValue];
            [v15 setPercentCompleted:];
          }
        }
        id v12 = [(NSMutableSet *)v10 countByEnumeratingWithState:&v22 objects:v26 count:16];
      }
      while (v12);
    }

    os_unfair_recursive_lock_unlock();
  }
}

- (void)_resetWidgetBudgets
{
  id v2 = +[_DASWidgetRefreshBudgetManager sharedInstance];
  [v2 resetBudgets];
}

- (void)updateSystemConstraintsWithParameters:(id)a3
{
  uint64_t v4 = kDASSystemContextKeyHeavyDiskUsage;
  id v5 = a3;
  id v12 = [v5 objectForKeyedSubscript:v4];
  id v6 = [v5 objectForKeyedSubscript:kDASSystemContextNonDASCriticalWorkloadRunning];
  id v7 = [v5 objectForKeyedSubscript:kDASSystemContextGPWorkloadRunningState];
  uint64_t v8 = [v5 objectForKeyedSubscript:kDASSystemContextMCWorkloadRunningState];

  if (v12)
  {
    id v9 = +[_DASCustomSystemConstraintsPolicy policyInstance];
    [v9 updateSystemConstraint:kDASSystemContextKeyHeavyDiskUsage withState:[v12 BOOLValue] withDaemon:0];
LABEL_5:

    uint64_t v10 = [(_DASDaemon *)self tasksNoLongerEligible];
    [(_DASDaemon *)self suspendActivities:v10];
LABEL_6:

    goto LABEL_7;
  }
  if (v6)
  {
    id v9 = +[_DASFastPassPolicy policyInstance];
    [v9 updateFastPassShallYield:[v6 BOOLValue]];
    goto LABEL_5;
  }
  if (v7)
  {
    id v11 = +[_DASCustomSystemConstraintsPolicy policyInstance];
    [v11 updateSystemConstraint:kDASSystemContextGPWorkloadRunningState withState:[v7 BOOLValue] withDaemon:self];
  }
  if (v8)
  {
    uint64_t v10 = +[_DASCustomSystemConstraintsPolicy policyInstance];
    [v10 updateSystemConstraint:kDASSystemContextMCWorkloadRunningState withState:[v8 BOOLValue] withDaemon:self];
    goto LABEL_6;
  }
LABEL_7:
}

- (void)addPrerunningActivity:(id)a3 toGroupWithName:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  p_groupLock = &self->_groupLock;
  os_unfair_lock_lock(&self->_groupLock);
  id v9 = [(NSMutableDictionary *)self->_groupToPendingTasks objectForKeyedSubscript:v7];
  [v9 removeObject:v6];

  uint64_t v10 = [(NSMutableDictionary *)self->_groupToPrerunningTasks objectForKeyedSubscript:v7];
  if (!v10)
  {
    uint64_t v10 = +[NSMutableSet set];
    groupToPrerunningTasks = self->_groupToPrerunningTasks;
    id v12 = [v6 groupName];
    [(NSMutableDictionary *)groupToPrerunningTasks setObject:v10 forKeyedSubscript:v12];
  }
  [v10 _DAS_addOrReplaceObject:v6];
  uint64_t v13 = +[_DASDaemonLogger logForCategory:@"lifecycle(activityGroup)"];
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 138412802;
    id v15 = v6;
    __int16 v16 = 2112;
    id v17 = v7;
    __int16 v18 = 2048;
    id v19 = [v10 count];
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "With %@ ...Tasks pre-running in group [%@] are %ld!", (uint8_t *)&v14, 0x20u);
  }

  os_unfair_lock_unlock(p_groupLock);
}

- (void)addRunningActivity:(id)a3 toGroupWithName:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  p_groupLock = &self->_groupLock;
  os_unfair_lock_lock(&self->_groupLock);
  id v9 = [(NSMutableDictionary *)self->_groupToPrerunningTasks objectForKeyedSubscript:v7];
  [v9 removeObject:v6];

  uint64_t v10 = [(NSMutableDictionary *)self->_groupToPendingTasks objectForKeyedSubscript:v7];
  [v10 removeObject:v6];

  id v11 = [(NSMutableDictionary *)self->_groupToRunningTasks objectForKeyedSubscript:v7];
  if (!v11)
  {
    id v11 = +[NSMutableSet set];
    groupToRunningTasks = self->_groupToRunningTasks;
    uint64_t v13 = [v6 groupName];
    [(NSMutableDictionary *)groupToRunningTasks setObject:v11 forKeyedSubscript:v13];
  }
  [v11 _DAS_addOrReplaceObject:v6];
  int v14 = +[_DASDaemonLogger logForCategory:@"lifecycle(activityGroup)"];
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 138412802;
    id v16 = v6;
    __int16 v17 = 2112;
    id v18 = v7;
    __int16 v19 = 2048;
    id v20 = [v11 count];
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "With %@ ...Tasks running in group [%@] are %ld!", (uint8_t *)&v15, 0x20u);
  }

  os_unfair_lock_unlock(p_groupLock);
}

- (void)addPendingActivitiesToGroups:(id)a3
{
  p_groupLock = &self->_groupLock;
  id v5 = a3;
  os_unfair_lock_lock(p_groupLock);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000C334C;
  v6[3] = &unk_100177B58;
  void v6[4] = self;
  [v5 enumerateKeysAndObjectsUsingBlock:v6];

  os_unfair_lock_unlock(p_groupLock);
}

- (void)createActivityGroup:(id)a3
{
  id v10 = a3;
  os_unfair_lock_lock(&self->_groupLock);
  groups = self->_groups;
  id v5 = [v10 name];
  id v6 = [(NSMutableDictionary *)groups objectForKeyedSubscript:v5];

  if (!v6 || (id v7 = [v6 maxConcurrent], v7 != objc_msgSend(v10, "maxConcurrent")))
  {
    uint64_t v8 = self->_groups;
    id v9 = [v10 name];
    [(NSMutableDictionary *)v8 setObject:v10 forKeyedSubscript:v9];

    [(_DASDataStore *)self->_store saveGroup:v10];
  }
  os_unfair_lock_unlock(&self->_groupLock);
}

- (void)submitActivity:(id)a3 inGroup:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = +[_DASDaemonLogger logForCategory:@"lifecycle"];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = [v7 name];
    int v10 = 138412802;
    id v11 = v6;
    __int16 v12 = 2112;
    uint64_t v13 = v9;
    __int16 v14 = 2048;
    id v15 = [v7 maxConcurrent];
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Submit activity: %@ in group: %@ with capacity: %ld", (uint8_t *)&v10, 0x20u);
  }
  [(_DASDaemon *)self submitActivity:v6 inGroup:v7 withHandler:&stru_100177E60];
}

- (void)endLaunchWithReason:(id)a3 forApp:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = v7;
  if (v6 && v7)
  {
    evaluationQueue = self->_evaluationQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000C3730;
    block[3] = &unk_100175548;
    __int16 v12 = v7;
    id v13 = v6;
    __int16 v14 = self;
    dispatch_async(evaluationQueue, block);

    int v10 = v12;
  }
  else
  {
    int v10 = +[_DASDaemonLogger defaultCategory];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "endLaunchWithReason: launchReason or appName is null", buf, 2u);
    }
  }
}

- (void)backgroundAppRefreshEnabledForApp:(id)a3 withHandler:(id)a4
{
  barScheduler = self->_barScheduler;
  int v10 = (void (**)(id, id, BOOL))a4;
  id v7 = a3;
  BOOL v8 = [(_DASBARScheduler *)barScheduler backgroundAppRefreshEnabled];
  BOOL v9 = [(_DASBARScheduler *)self->_barScheduler backgroundAppRefreshEnabledForApp:v7];

  v10[2](v10, (id)v8, v9);
}

- (void)disableAppRefreshForApps:(id)a3
{
  barScheduler = self->_barScheduler;
  id v4 = +[NSSet setWithArray:a3];
  [(_DASBARScheduler *)barScheduler disableAppRefreshForApps:v4];
}

- (BOOL)canSubmitValidatedTaskRequest:(id)a3 withError:(id *)a4
{
  id v6 = (_DASDaemon *)a3;
  if ([(_DASDaemon *)v6 isContinuedProcessingTask])
  {
    char v7 = 1;
    goto LABEL_77;
  }
  BOOL v8 = [(_DASDaemon *)v6 relatedApplications];
  BOOL v9 = [v8 firstObject];

  if (([(_DASDaemon *)v6 isContactTracingBackgroundActivity] & 1) == 0
    && ![(_DASBARScheduler *)self->_barScheduler backgroundLaunchAllowedForApp:v9])
  {
    int v10 = [(_DASDaemon *)v6 launchReason];
    unsigned __int8 v11 = [v10 isEqualToString:_DASLaunchReasonHealthResearch];

    if ((v11 & 1) == 0)
    {
      if (a4)
      {
        uint64_t v16 = _DASActivitySchedulerErrorDomain;
        uint64_t v17 = 0;
        goto LABEL_64;
      }
LABEL_65:
      char v7 = 0;
      goto LABEL_76;
    }
  }
  if (![(_DASBARScheduler *)self->_barScheduler backgroundLaunchAllowedForBGTaskActivity:v6])
  {
    if (a4)
    {
      uint64_t v16 = _DASActivitySchedulerErrorDomain;
      uint64_t v17 = 2;
LABEL_64:
      +[NSError errorWithDomain:v16 code:v17 userInfo:0];
      char v7 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_76;
    }
    goto LABEL_65;
  }
  char v56 = a4;
  os_unfair_recursive_lock_lock_with_options();
  unsigned __int8 v55 = self;
  BOOL v57 = v9;
  __int16 v12 = [(NSMutableDictionary *)self->_applicationLaunchRequests objectForKeyedSubscript:v9];
  id v13 = [v12 mutableCopy];
  __int16 v14 = v13;
  char v61 = v6;
  if (v13)
  {
    id v15 = v13;
  }
  else
  {
    id v15 = +[NSMutableSet set];
  }
  id v18 = v15;

  os_unfair_recursive_lock_unlock();
  id v59 = +[NSMutableSet set];
  long long v67 = 0u;
  long long v68 = 0u;
  long long v69 = 0u;
  long long v70 = 0u;
  id v19 = v18;
  id v20 = [v19 countByEnumeratingWithState:&v67 objects:v74 count:16];
  if (v20)
  {
    id v21 = v20;
    uint64_t v22 = *(void *)v68;
    do
    {
      long long v23 = 0;
      do
      {
        if (*(void *)v68 != v22) {
          objc_enumerationMutation(v19);
        }
        long long v24 = *(void **)(*((void *)&v67 + 1) + 8 * (void)v23);
        if ([v24 isBackgroundTaskActivity])
        {
          long long v25 = [v24 clientProvidedIdentifier];
          self = [(_DASDaemon *)v61 clientProvidedIdentifier];
          unsigned int v26 = [v25 isEqualToString:self];

          unsigned int v27 = [(_DASDaemon *)v61 isContactTracingBackgroundActivity];
          if (v26)
          {
            if (v27 && [v24 isContactTracingBackgroundActivity])
            {
              uint64_t v28 = [v24 clientProvidedStartDate];
              if (v28) {
                goto LABEL_24;
              }
              uint64_t v28 = [(_DASDaemon *)v61 clientProvidedStartDate];
              if (v28) {
                goto LABEL_24;
              }
              self = (_DASDaemon *)[v24 requiresPlugin];
              if (self != [(_DASDaemon *)v61 requiresPlugin]) {
                goto LABEL_24;
              }
              unsigned int v30 = [v24 requiresNetwork];
              if (v30 == [(_DASDaemon *)v61 requiresNetwork])
              {
                int v31 = [v24 startAfter];
                self = v61;
                [(_DASDaemon *)v61 setStartAfter:v31];

                uint64_t v32 = [v24 startBefore];
                [(_DASDaemon *)v61 setStartBefore:v32];

                uint64_t v28 = +[_DASDaemonLogger logForCategory:@"exposure-notification"];
                if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "Pending identical task", buf, 2u);
                }
LABEL_24:
              }
            }
            [v59 addObject:v24];
            goto LABEL_31;
          }
          if (v27 && [v24 isContactTracingBackgroundActivity])
          {
            [v59 addObject:v24];
            uint64_t v29 = +[_DASDaemonLogger logForCategory:@"exposure-notification"];
            if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "Replacing similar task", buf, 2u);
            }
          }
        }
LABEL_31:
        long long v23 = (char *)v23 + 1;
      }
      while (v21 != v23);
      id v33 = [v19 countByEnumeratingWithState:&v67 objects:v74 count:16];
      id v21 = v33;
    }
    while (v33);
  }

  [v19 minusSet:v59];
  [v19 addObject:v61];
  long long v65 = 0u;
  long long v66 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  id obj = v19;
  id v34 = [obj countByEnumeratingWithState:&v63 objects:v73 count:16];
  if (!v34)
  {
    unint64_t v36 = 0;
    unint64_t v60 = 0;
    goto LABEL_51;
  }
  id v35 = v34;
  unint64_t v36 = 0;
  unint64_t v60 = 0;
  uint64_t v37 = *(void *)v64;
  uint64_t v38 = _DASLaunchReasonBackgroundProcessing;
  uint64_t v39 = _DASLaunchReasonHealthResearch;
  uint64_t v58 = _DASLaunchReasonBackgroundRefresh;
  do
  {
    for (i = 0; i != v35; i = (char *)i + 1)
    {
      if (*(void *)v64 != v37) {
        objc_enumerationMutation(obj);
      }
      long long v41 = *(void **)(*((void *)&v63 + 1) + 8 * i);
      long long v42 = [v41 launchReason];
      if ([v42 isEqualToString:v38])
      {

LABEL_45:
        ++v36;
        continue;
      }
      self = [v41 launchReason];
      unsigned int v43 = [(_DASDaemon *)self isEqualToString:v39];

      if (v43) {
        goto LABEL_45;
      }
      long long v44 = [v41 launchReason];
      self = (_DASDaemon *)[v44 isEqualToString:v58];

      v60 += self;
    }
    id v35 = [obj countByEnumeratingWithState:&v63 objects:v73 count:16];
  }
  while (v35);
LABEL_51:

  id v6 = v61;
  if ([v59 count])
  {
    uint64_t v45 = +[_DASDaemonLogger logForCategory:@"BackgroundTasks"];
    if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v72 = v59;
      _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_DEFAULT, "Removing pending tasks: %@", buf, 0xCu);
    }

    id v46 = [v59 copy];
    [(_DASDaemon *)v55 cancelActivities:v46];
  }
  id v47 = [(_DASDaemon *)v61 launchReason];
  unsigned __int8 v48 = [v47 isEqualToString:_DASLaunchReasonBackgroundProcessing];
  if (v48)
  {
    BOOL v49 = v36 > 0xA;
    CFStringRef v50 = v56;
    BOOL v9 = v57;
    if (v49)
    {
      int v51 = 1;
    }
    else
    {
LABEL_67:
      double v52 = [(_DASDaemon *)v61 launchReason];
      unsigned int v53 = [v52 isEqualToString:_DASLaunchReasonBackgroundRefresh];
      if (v60 > 1) {
        int v51 = v53;
      }
      else {
        int v51 = 0;
      }

      if ((v48 & 1) == 0) {
        goto LABEL_71;
      }
    }
  }
  else
  {
    self = [(_DASDaemon *)v61 launchReason];
    if (![(_DASDaemon *)self isEqualToString:_DASLaunchReasonHealthResearch]
      || v36 <= 0xA)
    {
      CFStringRef v50 = v56;
      BOOL v9 = v57;
      goto LABEL_67;
    }
    int v51 = 1;
    CFStringRef v50 = v56;
    BOOL v9 = v57;
LABEL_71:
  }
  char v7 = v51 ^ 1;
  if (v50 && v51)
  {
    id *v50 = +[NSError errorWithDomain:_DASActivitySchedulerErrorDomain code:4 userInfo:0];
  }

LABEL_76:
LABEL_77:

  return v7;
}

- (void)cancelAllTaskRequestsForApplication:(id)a3
{
  id v4 = a3;
  id v5 = +[NSMutableSet set];
  os_unfair_recursive_lock_lock_with_options();
  id v6 = [(NSMutableDictionary *)self->_applicationLaunchRequests objectForKeyedSubscript:v4];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        unsigned __int8 v11 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if ([v11 isBackgroundTaskActivity]) {
          [v5 addObject:v11];
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }

  os_unfair_recursive_lock_unlock();
  [(_DASDaemon *)self cancelActivities:v5];
}

- (void)cancelTaskRequestWithIdentifier:(id)a3 forApplication:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[NSMutableSet set];
  os_unfair_recursive_lock_lock_with_options();
  id v18 = v7;
  id v19 = self;
  uint64_t v9 = [(NSMutableDictionary *)self->_applicationLaunchRequests objectForKeyedSubscript:v7];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v10 = [v9 countByEnumeratingWithState:&v20 objects:v28 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v21;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v21 != v12) {
          objc_enumerationMutation(v9);
        }
        long long v14 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        if ([v14 isBackgroundTaskActivity])
        {
          long long v15 = [v14 clientProvidedIdentifier];
          unsigned int v16 = [v15 isEqualToString:v6];

          if (v16) {
            [v8 addObject:v14];
          }
        }
      }
      id v11 = [v9 countByEnumeratingWithState:&v20 objects:v28 count:16];
    }
    while (v11);
  }

  os_unfair_recursive_lock_unlock();
  uint64_t v17 = +[_DASDaemonLogger defaultCategory];
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v25 = v6;
    __int16 v26 = 2112;
    unsigned int v27 = v18;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Canceling task request %{public}@ for %@", buf, 0x16u);
  }

  [(_DASDaemon *)v19 cancelActivities:v8];
}

- (void)getPendingTaskRequestsForApplication:(id)a3 withCompletionHandler:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, id))a4;
  id v8 = +[NSMutableArray array];
  os_unfair_recursive_lock_lock_with_options();
  os_unfair_recursive_lock_lock_with_options();
  unsigned int v16 = v6;
  uint64_t v9 = [(NSMutableDictionary *)self->_applicationLaunchRequests objectForKeyedSubscript:v6];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v10 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v18;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v18 != v12) {
          objc_enumerationMutation(v9);
        }
        long long v14 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        if ([v14 isBackgroundTaskActivity]
          && ([(NSMutableSet *)self->_runningTasks containsObject:v14] & 1) == 0)
        {
          [v8 addObject:v14];
        }
      }
      id v11 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v11);
  }

  os_unfair_recursive_lock_unlock();
  os_unfair_recursive_lock_unlock();
  id v15 = [v8 copy];
  v7[2](v7, v15);
}

- (void)scheduleConnectionTimeoutForPid:(int)a3
{
  id v5 = +[_DASDaemonLogger logForCategory:@"bar"];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_1000FF0E8(a3, v5);
  }

  dispatch_time_t v6 = dispatch_time(0, 10000000000);
  activityLaunchQueue = self->_activityLaunchQueue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000C4838;
  v8[3] = &unk_100177EB0;
  int v9 = a3;
  void v8[4] = self;
  dispatch_after(v6, activityLaunchQueue, v8);
}

- (void)establishConnectionFromClient:(id)a3 withCompletionHandler:(id)a4
{
  id v6 = a3;
  uint64_t v29 = (void (**)(void))a4;
  id v7 = +[_DASDaemonLogger logForCategory:@"bar"];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = [v6 connection];
    *(_DWORD *)buf = 138412546;
    id v36 = v6;
    __int16 v37 = 1024;
    LODWORD(v38) = [v8 processIdentifier];
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Establishing connection from client %@ with pid %d", buf, 0x12u);
  }
  int v9 = self->_connectedBGTaskClients;
  objc_sync_enter(v9);
  id v10 = [v6 connection];
  id v11 = [v10 processIdentifier];

  uint64_t v12 = [(_DASDaemon *)self connectedBGTaskClients];
  long long v13 = +[NSNumber numberWithInt:v11];
  [v12 setObject:v6 forKeyedSubscript:v13];

  long long v14 = [(_DASDaemon *)self activitiesWaitingForBGTaskClients];
  id v15 = +[NSNumber numberWithInt:v11];
  unsigned int v16 = [v14 objectForKeyedSubscript:v15];

  long long v17 = [(_DASDaemon *)self activitiesWaitingForBGTaskClients];
  long long v18 = +[NSNumber numberWithInt:v11];
  [v17 removeObjectForKey:v18];

  objc_sync_exit(v9);
  if ([v16 count])
  {
    long long v19 = +[_DASDaemonLogger logForCategory:@"bar"];
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v36 = v16;
      __int16 v37 = 2112;
      id v38 = v6;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Delivering pending activities %@ to client %@", buf, 0x16u);
    }

    [v6 handleLaunchFromDaemonForActivities:v16];
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id v20 = v16;
    long long v21 = 0;
    id v22 = [v20 countByEnumeratingWithState:&v30 objects:v34 count:16];
    if (v22)
    {
      uint64_t v23 = *(void *)v31;
      do
      {
        for (i = 0; i != v22; i = (char *)i + 1)
        {
          if (*(void *)v31 != v23) {
            objc_enumerationMutation(v20);
          }
          id v25 = *(void **)(*((void *)&v30 + 1) + 8 * i);
          __int16 v26 = [v25 suspendRequestDate];
          BOOL v27 = v26 == 0;

          if (!v27)
          {
            if (!v21)
            {
              long long v21 = +[NSMutableSet set];
            }
            [v21 addObject:v25];
          }
        }
        id v22 = [v20 countByEnumeratingWithState:&v30 objects:v34 count:16];
      }
      while (v22);
    }

    if ([v21 count])
    {
      id v28 = [v21 copy];
      [v6 willExpireBGTaskActivities:v28];
    }
  }
  v29[2]();
}

- (void)updateCompletionStatus:(BOOL)a3 forOngoingTask:(id)a4
{
  BOOL v4 = a3;
  id v5 = a4;
  id v6 = [v5 progress];
  if (!v6) {
    id v6 = objc_alloc_init((Class)NSProgress);
  }
  id v7 = +[_DASDaemonLogger logForCategory:@"ActivityProgress"];
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG);
  if (v4)
  {
    if (v8) {
      sub_1000FF258();
    }

    if ((uint64_t)[v6 completedUnitCount] < 1) {
      uint64_t v9 = 1;
    }
    else {
      uint64_t v9 = (uint64_t)[v6 completedUnitCount];
    }
    [v6 setCompletedUnitCount:v9];
    [v6 setTotalUnitCount:[v6 completedUnitCount]];
  }
  else
  {
    if (v8) {
      sub_1000FF2C0();
    }

    [v6 cancel];
  }
  id v10 = +[_DASDaemonLogger logForCategory:@"ActivityProgress"];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v11 = @"incomplete";
    int v14 = 138412802;
    if (v4) {
      CFStringRef v11 = @"completed";
    }
    CFStringRef v15 = v11;
    __int16 v16 = 2112;
    id v17 = v6;
    __int16 v18 = 2112;
    id v19 = v5;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Finishing progress (%@) to %@ for %@", (uint8_t *)&v14, 0x20u);
  }

  [v5 setProgress:v6];
  uint64_t v12 = +[_DASContinuedProcessingTaskUIClient sharedClient];
  long long v13 = [v5 uuid];
  [v12 updateProgress:v6 forIdentifier:v13];
}

- (void)updateOngoingTask:(id)a3 completionHandler:(id)a4
{
  id v6 = (void (**)(void))a4;
  id v7 = a3;
  BOOL v8 = [(_DASDaemon *)self clientForActivity:v7];
  id v15 = [v8 connection];

  uint64_t v9 = [v15 valueForEntitlement:@"com.apple.developer.web-browser-engine.networking"];
  uint64_t v10 = [v9 BOOLValue] ^ 1;

  CFStringRef v11 = +[_DASContinuedProcessingTaskUIClient sharedClient];
  uint64_t v12 = [v7 clientProvidedTitle];
  long long v13 = [v7 clientProvidedReason];
  int v14 = [v7 uuid];

  [v11 updateTitle:v12 andDescription:v13 forIdentifier:v14 playHaptics:v10];
  v6[2](v6);
}

- (void)updateProgressForOngoingTask:(id)a3 completionHandler:(id)a4
{
  uint64_t v9 = (void (**)(void))a4;
  id v5 = a3;
  id v6 = +[_DASContinuedProcessingTaskUIClient sharedClient];
  id v7 = [v5 progress];
  BOOL v8 = [v5 uuid];

  [v6 updateProgress:v7 forIdentifier:v8];
  v9[2]();
}

- (void)submittedActivitiesWithHandler:(id)a3
{
  BOOL v4 = (void (**)(id, void *))a3;
  os_unfair_recursive_lock_lock_with_options();
  id v5 = [(NSMutableSet *)self->_pendingTasks allObjects];
  id v7 = [v5 mutableCopy];

  os_unfair_recursive_lock_unlock();
  [v7 sortUsingComparator:&stru_100177EF0];
  id v6 = +[NSArray arrayWithArray:v7];
  v4[2](v4, v6);
}

- (void)delayedRunningActivitiesWithHandler:(id)a3
{
  BOOL v4 = (void (**)(id, id))a3;
  os_unfair_recursive_lock_lock_with_options();
  id v5 = [(NSMutableSet *)self->_prerunningTasks allObjects];
  id v7 = [v5 mutableCopy];

  os_unfair_recursive_lock_unlock();
  [v7 sortUsingComparator:&stru_100177F10];
  id v6 = [v7 copy];
  v4[2](v4, v6);
}

- (void)runningActivitiesWithHandler:(id)a3
{
  BOOL v4 = (void (**)(id, void *))a3;
  +[NSMutableArray array];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000C56DC;
  v7[3] = &unk_100177B80;
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  id v5 = v8;
  [(_DASDaemon *)self allClientsDo:v7];
  [v5 sortUsingComparator:&stru_100177F30];
  id v6 = +[NSArray arrayWithArray:v5];
  v4[2](v4, v6);
}

- (void)runningGroupActivitiesWithHandler:(id)a3
{
  BOOL v4 = (void (**)(id, void *))a3;
  id v5 = +[NSMutableArray array];
  p_groupLock = &self->_groupLock;
  os_unfair_lock_lock(&self->_groupLock);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v7 = [(NSMutableDictionary *)self->_groupToRunningTasks allValues];
  id v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v15;
    do
    {
      CFStringRef v11 = 0;
      do
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = [*(id *)(*((void *)&v14 + 1) + 8 * (void)v11) allObjects];
        [v5 addObjectsFromArray:v12];

        CFStringRef v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      id v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v9);
  }

  os_unfair_lock_unlock(p_groupLock);
  long long v13 = +[NSArray arrayWithArray:v5];
  v4[2](v4, v13);
}

- (void)scoresForActivityWithName:(id)a3 withHandler:(id)a4
{
}

- (void)activityRunStatisticsWithHandler:(id)a3
{
}

- (id)activityRunStatistics
{
  return 0;
}

- (void)forceRunActivities:(id)a3
{
  id v4 = a3;
  id v5 = +[_DASDaemonLogger defaultCategory];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    id v21 = [v4 count];
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Force Running %lu activities", buf, 0xCu);
  }

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v16;
    while (2)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        CFStringRef v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        uint64_t v12 = -[_DASDaemon getActivityWithName:](self, "getActivityWithName:", v11, (void)v15);
        if (!v12)
        {
          long long v14 = +[_DASDaemonLogger defaultCategory];
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            id v21 = v11;
            _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Force run activities unable to find activity %@", buf, 0xCu);
          }

          goto LABEL_15;
        }
        long long v13 = v12;
        [v12 setWasForceRun:1];
        [(_DASDaemon *)self immediatelyBeginWorkForActivity:v13];
      }
      id v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
LABEL_15:
}

- (void)runActivitiesWithUrgency:(int64_t)a3 activities:(id)a4
{
  id v6 = a4;
  id v7 = +[_DASDaemonLogger defaultCategory];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)long long v31 = a3;
    *(_WORD *)&v31[4] = 2112;
    *(void *)&void v31[6] = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "With %i urgency level, Running %@ activities", buf, 0x12u);
  }

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v8 = v6;
  id v9 = [v8 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v9)
  {
    id v11 = v9;
    uint64_t v12 = *(void *)v26;
    *(void *)&long long v10 = 138412290;
    long long v20 = v10;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v26 != v12) {
          objc_enumerationMutation(v8);
        }
        uint64_t v14 = *(void *)(*((void *)&v25 + 1) + 8 * i);
        long long v15 = -[_DASDaemon getActivityWithName:](self, "getActivityWithName:", v14, v20);
        if (v15)
        {
          long long v16 = +[_DASUrgencyOverridePolicy policyInstance];
          [v16 addActivity:v14 urgencyLevel:a3];

          evaluationQueue = self->_evaluationQueue;
          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472;
          block[2] = sub_1000C5E34;
          block[3] = &unk_100176F40;
          void block[4] = self;
          id v18 = v15;
          uint64_t v23 = v14;
          int64_t v24 = a3;
          id v22 = v18;
          dispatch_async(evaluationQueue, block);
        }
        else
        {
          id v19 = +[_DASDaemonLogger defaultCategory];
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v20;
            *(void *)long long v31 = v14;
            _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "With urgency level, run activities unable to find activity %@", buf, 0xCu);
          }
        }
      }
      id v11 = [v8 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v11);
  }
}

- (void)currentPredictionsWithHandler:(id)a3
{
  id v4 = a3;
  id v5 = +[_DASPredictionManager currentPredictions];
  (*((void (**)(id, id))a3 + 2))(v4, v5);
}

- (id)earlyToday
{
  id v2 = +[NSCalendar currentCalendar];
  int64_t v3 = +[NSDate now];
  id v4 = [v2 components:28 fromDate:v3];

  [v4 setHour:3];
  id v5 = [v2 dateFromComponents:v4];

  return v5;
}

- (id)widgetViewsStatisticsWithStore:(id)a3
{
  id v4 = a3;
  id v5 = +[NSCountedSet set];
  long long v42 = [(_DASDaemon *)self earlyToday];
  uint64_t v6 = +[_DKEventQuery predicateForEventsWithStartDateAfter:](_DKEventQuery, "predicateForEventsWithStartDateAfter:");
  id v7 = +[_DKEventStream eventStreamWithName:kDASWidgetViewStreamName];
  long long v63 = v7;
  id v8 = +[NSArray arrayWithObjects:&v63 count:1];
  id v9 = +[NSSortDescriptor sortDescriptorWithKey:@"startDate" ascending:0];
  CFStringRef v62 = v9;
  long long v10 = +[NSArray arrayWithObjects:&v62 count:1];
  long long v41 = (void *)v6;
  uint64_t v11 = +[_DKEventQuery eventQueryWithPredicate:v6 eventStreams:v8 offset:0 limit:0 sortDescriptors:v10];

  uint64_t v12 = +[NSMutableDictionary dictionary];
  unsigned int v43 = v4;
  id v40 = (void *)v11;
  long long v13 = [v4 executeQuery:v11 error:0];
  long long v54 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  id v14 = [v13 countByEnumeratingWithState:&v54 objects:v61 count:16];
  if (v14)
  {
    id v15 = v14;
    uint64_t v16 = *(void *)v55;
    do
    {
      for (i = 0; i != v15; i = (char *)i + 1)
      {
        if (*(void *)v55 != v16) {
          objc_enumerationMutation(v13);
        }
        id v18 = *(void **)(*((void *)&v54 + 1) + 8 * i);
        id v19 = [v18 stringValue];
        [v5 addObject:v19];

        long long v20 = [v18 startDate];
        id v21 = [v18 stringValue];
        [v12 setObject:v20 forKeyedSubscript:v21];
      }
      id v15 = [v13 countByEnumeratingWithState:&v54 objects:v61 count:16];
    }
    while (v15);
  }
  uint64_t v39 = v12;
  +[NSMutableDictionary dictionary];
  v51[0] = _NSConcreteStackBlock;
  v51[1] = 3221225472;
  v51[2] = sub_1000C6524;
  v51[3] = &unk_100177F58;
  id v22 = (id)objc_claimAutoreleasedReturnValue();
  id v52 = v22;
  id v23 = v5;
  id v53 = v23;
  [v23 enumerateObjectsUsingBlock:v51];
  id v38 = v23;
  int64_t v24 = [v23 allObjects];
  id v25 = [v24 mutableCopy];

  v49[0] = _NSConcreteStackBlock;
  v49[1] = 3221225472;
  v49[2] = sub_1000C65B0;
  v49[3] = &unk_100176080;
  id v26 = v22;
  id v50 = v26;
  [v25 sortUsingComparator:v49];
  long long v27 = +[NSMutableArray array];
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  id obj = v25;
  id v28 = [obj countByEnumeratingWithState:&v45 objects:v60 count:16];
  if (v28)
  {
    id v29 = v28;
    uint64_t v30 = *(void *)v46;
    do
    {
      for (j = 0; j != v29; j = (char *)j + 1)
      {
        if (*(void *)v46 != v30) {
          objc_enumerationMutation(obj);
        }
        uint64_t v32 = *(void *)(*((void *)&v45 + 1) + 8 * (void)j);
        v58[0] = @"name";
        v58[1] = @"count";
        v59[0] = v32;
        long long v33 = [v26 objectForKeyedSubscript:];
        [v33 doubleValue];
        id v35 = +[NSNumber numberWithDouble:round(v34)];
        v59[1] = v35;
        id v36 = +[NSDictionary dictionaryWithObjects:v59 forKeys:v58 count:2];
        [v27 addObject:v36];
      }
      id v29 = [obj countByEnumeratingWithState:&v45 objects:v60 count:16];
    }
    while (v29);
  }

  return v27;
}

- (id)widgetRefreshStatisticsWithStore:(id)a3
{
  id v4 = a3;
  id v5 = +[NSCountedSet set];
  uint64_t v6 = +[NSCountedSet set];
  id v50 = [(_DASDaemon *)self earlyToday];
  uint64_t v7 = +[_DKEventQuery predicateForEventsWithStartDateAfter:](_DKEventQuery, "predicateForEventsWithStartDateAfter:");
  id v8 = +[_DKEventStream eventStreamWithName:kDASWidgetRefreshStreamName];
  long long v77 = v8;
  id v9 = +[NSArray arrayWithObjects:&v77 count:1];
  long long v10 = +[NSSortDescriptor sortDescriptorWithKey:@"startDate" ascending:0];
  unsigned int v76 = v10;
  uint64_t v11 = +[NSArray arrayWithObjects:&v76 count:1];
  BOOL v49 = (void *)v7;
  uint64_t v12 = +[_DKEventQuery eventQueryWithPredicate:v7 eventStreams:v9 offset:0 limit:0 sortDescriptors:v11];

  long long v56 = +[NSMutableDictionary dictionary];
  int v51 = v4;
  long long v48 = (void *)v12;
  [v4 executeQuery:v12 error:0];
  long long v68 = 0u;
  long long v69 = 0u;
  long long v70 = 0u;
  long long v71 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  id v13 = [obj countByEnumeratingWithState:&v68 objects:v75 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v69;
    uint64_t v16 = kDASWidgetMetadataDASInitiated;
    do
    {
      for (i = 0; i != v14; i = (char *)i + 1)
      {
        if (*(void *)v69 != v15) {
          objc_enumerationMutation(obj);
        }
        id v18 = *(void **)(*((void *)&v68 + 1) + 8 * i);
        id v19 = [v18 stringValue];
        [v5 addObject:v19];

        long long v20 = [v18 metadata];
        id v21 = [v20 objectForKeyedSubscript:v16];
        unsigned int v22 = [v21 BOOLValue];

        if (v22)
        {
          id v23 = [v18 stringValue];
          [v6 addObject:v23];
        }
        int64_t v24 = [v18 startDate];
        id v25 = [v18 stringValue];
        [v56 setObject:v24 forKeyedSubscript:v25];
      }
      id v14 = [obj countByEnumeratingWithState:&v68 objects:v75 count:16];
    }
    while (v14);
  }
  id v26 = +[NSMutableDictionary dictionary];
  long long v27 = +[NSMutableDictionary dictionary];
  v63[0] = _NSConcreteStackBlock;
  v63[1] = 3221225472;
  v63[2] = sub_1000C6C34;
  v63[3] = &unk_100177F80;
  id v28 = v26;
  id v64 = v28;
  id v29 = v5;
  id v65 = v29;
  id v55 = v27;
  id v66 = v55;
  id v46 = v6;
  id v67 = v46;
  [v29 enumerateObjectsUsingBlock:v63];
  long long v47 = v29;
  uint64_t v30 = [v29 allObjects];
  id v31 = [v30 mutableCopy];

  v61[0] = _NSConcreteStackBlock;
  v61[1] = 3221225472;
  v61[2] = sub_1000C6D00;
  v61[3] = &unk_100176080;
  id v32 = v28;
  id v62 = v32;
  [v31 sortUsingComparator:v61];
  id v54 = +[NSMutableArray array];
  long long v57 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  id v52 = v31;
  id v33 = [v52 countByEnumeratingWithState:&v57 objects:v74 count:16];
  if (v33)
  {
    id v34 = v33;
    uint64_t v35 = *(void *)v58;
    do
    {
      for (j = 0; j != v34; j = (char *)j + 1)
      {
        if (*(void *)v58 != v35) {
          objc_enumerationMutation(v52);
        }
        uint64_t v37 = *(void *)(*((void *)&v57 + 1) + 8 * (void)j);
        v73[0] = v37;
        v72[0] = @"name";
        v72[1] = @"count";
        id v38 = [v32 objectForKeyedSubscript:v37];
        [v38 doubleValue];
        id v40 = +[NSNumber numberWithDouble:round(v39)];
        v73[1] = v40;
        v72[2] = @"dasRefreshes";
        long long v41 = [v55 objectForKeyedSubscript:v37];
        [v41 doubleValue];
        unsigned int v43 = +[NSNumber numberWithDouble:round(v42)];
        v73[2] = v43;
        long long v44 = +[NSDictionary dictionaryWithObjects:v73 forKeys:v72 count:3];
        [v54 addObject:v44];
      }
      id v34 = [v52 countByEnumeratingWithState:&v57 objects:v74 count:16];
    }
    while (v34);
  }

  return v54;
}

- (void)statisticsWithHandler:(id)a3
{
  v16[0] = @"widgetViews";
  v14[0] = @"name";
  v14[1] = @"data";
  v15[0] = @"Widget Views";
  id v4 = (void (**)(id, void *))a3;
  id v5 = +[_DASPredictionManager sharedKnowledgeStore];
  uint64_t v6 = [(_DASDaemon *)self widgetViewsStatisticsWithStore:v5];
  v15[1] = v6;
  uint64_t v7 = +[NSDictionary dictionaryWithObjects:v15 forKeys:v14 count:2];
  v16[1] = @"widgetRefreshes";
  v17[0] = v7;
  v12[1] = @"data";
  v13[0] = @"Widget Refreshes";
  v12[0] = @"name";
  id v8 = +[_DASPredictionManager sharedKnowledgeStore];
  id v9 = [(_DASDaemon *)self widgetRefreshStatisticsWithStore:v8];
  v13[1] = v9;
  long long v10 = +[NSDictionary dictionaryWithObjects:v13 forKeys:v12 count:2];
  v17[1] = v10;
  uint64_t v11 = +[NSDictionary dictionaryWithObjects:v17 forKeys:v16 count:2];

  v4[2](v4, v11);
}

- (void)allBudgetsWithHandler:(id)a3
{
  budgetManager = self->_budgetManager;
  id v5 = a3;
  id v6 = [(_DASBudgetManager *)budgetManager allBudgets];
  (*((void (**)(id, id))a3 + 2))(v5, v6);
}

- (void)balanceForBudgetWithName:(id)a3 withHandler:(id)a4
{
  budgetManager = self->_budgetManager;
  id v7 = a4;
  [(_DASBudgetManager *)budgetManager balanceForBudgetWithName:a3];
  (*((void (**)(id))a4 + 2))(v7);
}

- (void)setBalance:(double)a3 forBudgetWithName:(id)a4
{
}

- (void)decrementBy:(double)a3 forBudgetWithName:(id)a4
{
}

- (void)setCapacity:(double)a3 forBudgetWithName:(id)a4
{
}

- (void)policiesWithHandler:(id)a3
{
  id v18 = (void (**)(id, id))a3;
  int64_t v3 = +[NSMutableDictionary dictionary];
  +[_DASPolicyManager allPoliciesForPlatform];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  id v4 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v21;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v21 != v6) {
          objc_enumerationMutation(obj);
        }
        id v8 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        id v9 = [v8 policyName];
        unint64_t v10 = +[_DASPolicyManager bitmaskForPolicy:v9];

        uint64_t v11 = +[NSMutableDictionary dictionary];
        uint64_t v12 = [v8 policyName];
        [v11 setValue:v12 forKey:@"policyName"];

        id v13 = [v8 policyDescription];
        if (v13)
        {
          id v14 = [v8 policyDescription];
          [v11 setValue:v14 forKey:@"policyDescription"];
        }
        else
        {
          [v11 setValue:&stru_100179948 forKey:@"policyDescription"];
        }

        uint64_t v15 = +[NSNumber numberWithUnsignedLong:v10];
        uint64_t v16 = [v15 stringValue];
        [v3 setValue:v11 forKey:v16];
      }
      id v5 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v5);
  }
  id v17 = [v3 copy];
  v18[2](v18, v17);
}

- (void)clasStatusWithHandler:(id)a3
{
  controlEngine = self->_controlEngine;
  id v4 = (void (**)(id, id))a3;
  id v6 = [(_DASControlEngine *)controlEngine status];
  id v5 = [v6 copy];
  v4[2](v4, v5);
}

- (id)evaluatePolicies:(id)a3
{
  id v4 = a3;
  id v5 = +[NSMutableDictionary dictionary];
  os_unfair_recursive_lock_lock_with_options();
  long long v86 = 0u;
  long long v87 = 0u;
  long long v84 = 0u;
  long long v85 = 0u;
  long long v69 = self;
  id v6 = [(_DASDaemon *)self pendingTasks];
  id v7 = [v6 countByEnumeratingWithState:&v84 objects:v93 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v85;
    while (2)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v85 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v84 + 1) + 8 * i);
        uint64_t v12 = [v11 name];
        unsigned int v13 = [v4 isEqualToString:v12];

        if (v13)
        {
          id v14 = v11;
          unsigned int v67 = 1;
          goto LABEL_11;
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v84 objects:v93 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
  unsigned int v67 = 0;
  id v14 = 0;
LABEL_11:

  long long v82 = 0u;
  long long v83 = 0u;
  long long v80 = 0u;
  long long v81 = 0u;
  uint64_t v15 = [(_DASDaemon *)v69 prerunningTasks];
  id v16 = [v15 countByEnumeratingWithState:&v80 objects:v92 count:16];
  if (v16)
  {
    id v17 = v16;
    uint64_t v18 = *(void *)v81;
    while (2)
    {
      for (j = 0; j != v17; j = (char *)j + 1)
      {
        if (*(void *)v81 != v18) {
          objc_enumerationMutation(v15);
        }
        long long v20 = *(void **)(*((void *)&v80 + 1) + 8 * (void)j);
        long long v21 = [v20 name];
        unsigned int v22 = [v4 isEqualToString:v21];

        if (v22)
        {
          id v23 = v20;

          unsigned int v66 = 1;
          id v14 = v23;
          goto LABEL_21;
        }
      }
      id v17 = [v15 countByEnumeratingWithState:&v80 objects:v92 count:16];
      if (v17) {
        continue;
      }
      break;
    }
  }
  unsigned int v66 = 0;
LABEL_21:

  long long v78 = 0u;
  long long v79 = 0u;
  long long v76 = 0u;
  long long v77 = 0u;
  int64_t v24 = [(_DASDaemon *)v69 runningTasks];
  id v25 = [v24 countByEnumeratingWithState:&v76 objects:v91 count:16];
  if (v25)
  {
    id v26 = v25;
    uint64_t v27 = *(void *)v77;
    while (2)
    {
      for (k = 0; k != v26; k = (char *)k + 1)
      {
        if (*(void *)v77 != v27) {
          objc_enumerationMutation(v24);
        }
        id v29 = *(void **)(*((void *)&v76 + 1) + 8 * (void)k);
        uint64_t v30 = [v29 name];
        unsigned int v31 = [v4 isEqualToString:v30];

        if (v31)
        {
          id v33 = v29;

          int v32 = 1;
          id v14 = v33;
          goto LABEL_31;
        }
      }
      id v26 = [v24 countByEnumeratingWithState:&v76 objects:v91 count:16];
      if (v26) {
        continue;
      }
      break;
    }
  }
  int v32 = 0;
LABEL_31:

  os_unfair_recursive_lock_unlock();
  if (v14)
  {
    id v65 = v5;
    id v34 = +[_DASDaemonLogger defaultCategory];
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v90 = v4;
      _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "Evaluating policies for %@", buf, 0xCu);
    }
    unsigned int v64 = v32;

    uint64_t v35 = &AnalyticsSendEvent_ptr;
    long long v68 = +[NSMutableDictionary dictionary];
    +[_DASPolicyManager allPoliciesForPlatform];
    long long v72 = 0u;
    long long v73 = 0u;
    long long v74 = 0u;
    long long v75 = 0u;
    id obj = (id)objc_claimAutoreleasedReturnValue();
    id v36 = [obj countByEnumeratingWithState:&v72 objects:v88 count:16];
    if (v36)
    {
      id v37 = v36;
      uint64_t v38 = *(void *)v73;
      do
      {
        double v39 = 0;
        id v70 = v37;
        do
        {
          if (*(void *)v73 != v38) {
            objc_enumerationMutation(obj);
          }
          id v40 = *(void **)(*((void *)&v72 + 1) + 8 * (void)v39);
          double v42 = [v35[394] dictionary];
          if ([v40 appliesToActivity:v14])
          {
            [v40 weightForActivity:v14];
            double v44 = v43;
            long long v45 = [(_DASDaemon *)v69 context];
            id v46 = v14;
            long long v47 = [v40 responseForActivity:v14 withState:v45];

            long long v48 = [v47 rationale];
            BOOL v49 = +[NSNumber numberWithDouble:v44];
            [v42 setValue:v49 forKey:@"weightForActivity"];

            [v47 score];
            id v50 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
            [v42 setValue:v50 forKey:@"score"];

            int v51 = +[NSNumber numberWithLong:](NSNumber, "numberWithLong:", [v47 policyDecision]);
            [v42 setValue:v51 forKey:@"policyDecision"];

            [v47 validityDuration];
            id v52 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
            [v42 setValue:v52 forKey:@"validityDuration"];

            id v53 = +[NSNumber numberWithLong:](NSNumber, "numberWithLong:", [v48 responseOptions]);
            [v42 setValue:v53 forKey:@"rationaleResponseOptions"];

            if (objc_opt_respondsToSelector())
            {
              id v54 = [v40 blockReasons:v47];
              [v42 setValue:v54 forKey:@"blockReasons"];
            }
            id v55 = [v48 description];
            [v42 setValue:v55 forKey:@"rationaleDescription"];

            long long v56 = [v40 policyName];
            [v68 setValue:v42 forKey:v56];

            uint64_t v35 = &AnalyticsSendEvent_ptr;
            id v14 = v46;
            id v37 = v70;
          }

          double v39 = (char *)v39 + 1;
        }
        while (v37 != v39);
        id v37 = [obj countByEnumeratingWithState:&v72 objects:v88 count:16];
      }
      while (v37);
    }

    long long v57 = +[NSNumber numberWithBool:v67];
    unsigned int v58 = [v57 unsignedIntValue];
    long long v59 = +[NSNumber numberWithBool:v66];
    unsigned int v60 = v58 | (2 * [v59 unsignedIntValue]);
    char v61 = +[NSNumber numberWithBool:v64];
    id v62 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v60 | (4 * [v61 unsignedIntValue]));

    id v5 = v65;
    [v65 setValue:v62 forKey:@"taskStatus"];
    [v65 setValue:v68 forKey:@"policyEvaluations"];
  }

  return v5;
}

- (void)evaluatePolicies:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, id))a4;
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x3032000000;
  id v17 = sub_1000BE040;
  uint64_t v18 = sub_1000BE050;
  id v19 = 0;
  evaluationQueue = self->_evaluationQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000C7B9C;
  block[3] = &unk_100175B30;
  unsigned int v13 = &v14;
  void block[4] = self;
  id v9 = v6;
  id v12 = v9;
  dispatch_sync(evaluationQueue, block);
  id v10 = [(id)v15[5] copy];
  v7[2](v7, v10);

  _Block_object_dispose(&v14, 8);
}

- (void)evaluateAllActivities:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void))a4;
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x2020000000;
  char v16 = 1;
  evaluationQueue = self->_evaluationQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000C7D00;
  block[3] = &unk_100176988;
  void block[4] = self;
  id v12 = &v13;
  id v9 = v6;
  id v11 = v9;
  dispatch_sync(evaluationQueue, block);
  v7[2](v7, *((unsigned __int8 *)v14 + 24));

  _Block_object_dispose(&v13, 8);
}

- (BOOL)evaluateAllActivitiesFor:(id)a3 writingToFile:(id)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000C7EBC;
  v7[3] = &unk_100177FA8;
  void v7[4] = self;
  id v8 = a4;
  id v5 = v8;
  LOBYTE(a3) = [a3 enumerateObjectsInChunksOfSize:5 block:v7];

  return (char)a3;
}

- (BOOL)evaluatePoliciesForActivitiesChunk:(id)a3 writingToFile:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[NSMutableDictionary dictionary];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v9 = v6;
  id v10 = [v9 countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v29;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v29 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        uint64_t v15 = [v14 name];
        char v16 = [(_DASDaemon *)self evaluatePolicies:v15];
        id v17 = [v14 name];
        [v8 setValue:v16 forKey:v17];
      }
      id v11 = [v9 countByEnumeratingWithState:&v28 objects:v32 count:16];
    }
    while (v11);
  }

  id v27 = 0;
  uint64_t v18 = +[NSJSONSerialization dataWithJSONObject:v8 options:0 error:&v27];
  id v19 = v27;
  if (v19)
  {
    long long v20 = v19;
    long long v21 = +[_DASDaemonLogger defaultCategory];
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      sub_1000FF400();
    }
LABEL_16:

    BOOL v24 = 0;
    goto LABEL_17;
  }
  id v26 = 0;
  unsigned int v22 = [v7 writeData:v18 error:&v26];
  id v23 = v26;
  long long v20 = v23;
  if (!v22 || v23)
  {
    long long v21 = +[_DASDaemonLogger defaultCategory];
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      sub_1000FF394();
    }
    goto LABEL_16;
  }
  BOOL v24 = 1;
LABEL_17:

  return v24;
}

- (void)runProceedableActivities:(id)a3 handler:(id)a4
{
  id v5 = a3;
  id v26 = (void (**)(id, void *))a4;
  long long v30 = +[NSMutableDictionary dictionary];
  id v27 = objc_opt_new();
  id v6 = [(_DASDaemon *)self testModeParameters];
  uint64_t v38 = [v6 objectForKeyedSubscript:@"activities"];

  id v7 = [(_DASDaemon *)self testModeParameters];
  id v36 = [v7 objectForKeyedSubscript:@"overrides"];

  long long v52 = 0u;
  long long v53 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  id obj = v5;
  id v32 = [obj countByEnumeratingWithState:&v50 objects:v57 count:16];
  if (v32)
  {
    uint64_t v29 = *(void *)v51;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v51 != v29)
        {
          uint64_t v9 = v8;
          objc_enumerationMutation(obj);
          uint64_t v8 = v9;
        }
        uint64_t v33 = v8;
        uint64_t v10 = *(void *)(*((void *)&v50 + 1) + 8 * v8);
        id v37 = objc_opt_new();
        uint64_t v44 = 0;
        long long v45 = &v44;
        uint64_t v46 = 0x3032000000;
        long long v47 = sub_1000BE040;
        long long v48 = sub_1000BE050;
        id v49 = 0;
        evaluationQueue = self->_evaluationQueue;
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_1000C87B0;
        block[3] = &unk_100175B30;
        void block[5] = v10;
        void block[6] = &v44;
        void block[4] = self;
        dispatch_sync(evaluationQueue, block);
        id v34 = [(id)v45[5] objectForKey:@"taskStatus"];
        unsigned __int8 v12 = [v34 unsignedIntegerValue];
        uint64_t v13 = +[NSMutableDictionary dictionary];
        [v13 setObject:v37 forKeyedSubscript:@"blockingPolicies"];
        [v13 setObject:&__kCFBooleanFalse forKeyedSubscript:@"foundActivity"];
        uint64_t v35 = v13;
        if ([(id)v45[5] count] && (v12 & 1) != 0)
        {
          [v13 setObject:&__kCFBooleanTrue forKeyedSubscript:@"foundActivity"];
          uint64_t v14 = [(id)v45[5] objectForKeyedSubscript:@"policyEvaluations"];
          uint64_t v15 = [v14 allKeys];
          char v16 = [v15 sortedArrayUsingSelector:"localizedCaseInsensitiveCompare:"];

          long long v41 = 0u;
          long long v42 = 0u;
          long long v39 = 0u;
          long long v40 = 0u;
          id v17 = v16;
          id v18 = [v17 countByEnumeratingWithState:&v39 objects:v56 count:16];
          if (v18)
          {
            uint64_t v19 = *(void *)v40;
            do
            {
              for (i = 0; i != v18; i = (char *)i + 1)
              {
                if (*(void *)v40 != v19) {
                  objc_enumerationMutation(v17);
                }
                uint64_t v21 = *(void *)(*((void *)&v39 + 1) + 8 * i);
                unsigned int v22 = [v14 objectForKeyedSubscript:v21];
                id v23 = [v22 objectForKeyedSubscript:@"policyDecision"];
                id v24 = [v23 longValue];

                if ((![v38 containsObject:v10]
                   || ([v36 containsObject:v21] & 1) == 0)
                  && (v24 == (id)100 || v24 == (id)33))
                {
                  [v37 addObject:v21];
                }
              }
              id v18 = [v17 countByEnumeratingWithState:&v39 objects:v56 count:16];
            }
            while (v18);
          }

          if (![v37 count])
          {
            id v25 = +[_DASDaemonLogger defaultCategory];
            if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              uint64_t v55 = v10;
              _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "%@ is a proceedable activity!", buf, 0xCu);
            }

            [v27 addObject:v10];
          }
        }
        [v30 setObject:v35 forKeyedSubscript:v10];

        _Block_object_dispose(&v44, 8);
        uint64_t v8 = v33 + 1;
      }
      while ((id)(v33 + 1) != v32);
      id v32 = [obj countByEnumeratingWithState:&v50 objects:v57 count:16];
    }
    while (v32);
  }

  [(_DASDaemon *)self forceRunActivities:v27];
  v26[2](v26, v30);
}

- (void)activityContainsOverrides:(id)a3 handler:(id)a4
{
  id v5 = a4;
  id v7 = +[_DASPlistParser sharedInstance];
  id v6 = [v7 loadOverrides];
  (*((void (**)(id, void *))a4 + 2))(v5, v6);
}

- (void)blockingPoliciesWithParameters:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v36 = a4;
  id v37 = [v6 objectForKeyedSubscript:@"activity"];
  os_unfair_recursive_lock_lock_with_options();
  long long v53 = 0u;
  long long v54 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  long long v39 = self;
  id v7 = [(NSMutableSet *)self->_pendingTasks allObjects];
  id v8 = [v7 countByEnumeratingWithState:&v51 objects:v59 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v52;
    while (2)
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v52 != v10) {
          objc_enumerationMutation(v7);
        }
        unsigned __int8 v12 = *(void **)(*((void *)&v51 + 1) + 8 * i);
        uint64_t v13 = [v12 name];
        unsigned int v14 = [v13 isEqualToString:v37];

        if (v14)
        {
          id v15 = v12;
          goto LABEL_11;
        }
      }
      id v9 = [v7 countByEnumeratingWithState:&v51 objects:v59 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
  id v15 = 0;
LABEL_11:

  [v6 objectForKeyedSubscript:@"activityClasses"];
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  id v16 = [obj countByEnumeratingWithState:&v47 objects:v58 count:16];
  if (v16)
  {
    id v17 = v16;
    uint64_t v18 = *(void *)v48;
    uint64_t v38 = *(void *)v48;
    do
    {
      uint64_t v19 = 0;
      id v40 = v17;
      do
      {
        if (*(void *)v48 != v18) {
          objc_enumerationMutation(obj);
        }
        if ([*(id *)(*((void *)&v47 + 1) + 8 * (void)v19) isEqualToString:@"icpl"])
        {
          long long v42 = v19;
          long long v20 = +[NSDate distantPast];
          long long v43 = 0u;
          long long v44 = 0u;
          long long v45 = 0u;
          long long v46 = 0u;
          uint64_t v21 = [(NSMutableSet *)v39->_pendingTasks allObjects];
          id v22 = [v21 countByEnumeratingWithState:&v43 objects:v57 count:16];
          if (v22)
          {
            id v23 = v22;
            uint64_t v24 = *(void *)v44;
            do
            {
              for (j = 0; j != v23; j = (char *)j + 1)
              {
                if (*(void *)v44 != v24) {
                  objc_enumerationMutation(v21);
                }
                id v26 = *(void **)(*((void *)&v43 + 1) + 8 * (void)j);
                if (+[_DASPhotosPolicy isiCPLActivity:v26])
                {
                  id v27 = [v26 lastScored];
                  if (v27)
                  {
                    [v20 timeIntervalSinceDate:v27];
                    if (v28 < 0.0)
                    {
                      id v29 = v27;

                      id v30 = v26;
                      long long v20 = v29;
                      id v15 = v30;
                    }
                  }
                }
              }
              id v23 = [v21 countByEnumeratingWithState:&v43 objects:v57 count:16];
            }
            while (v23);
          }

          uint64_t v18 = v38;
          id v17 = v40;
          uint64_t v19 = v42;
        }
        uint64_t v19 = (char *)v19 + 1;
      }
      while (v19 != v17);
      id v17 = [obj countByEnumeratingWithState:&v47 objects:v58 count:16];
    }
    while (v17);
  }
  os_unfair_recursive_lock_unlock();
  if (v15)
  {
    long long v31 = +[_DASConditionScore lastDenialResponses:v15];
    id v32 = v36;
    (*((void (**)(id, void *))v36 + 2))(v36, v31);

    uint64_t v33 = v6;
  }
  else
  {
    id v34 = +[_DASDaemonLogger defaultCategory];
    id v32 = v36;
    uint64_t v33 = v6;
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v35 = [v6 description];
      *(_DWORD *)buf = 138412290;
      long long v56 = v35;
      _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "No blocked activity was found for %@", buf, 0xCu);
    }
    (*((void (**)(id, void *))v36 + 2))(v36, &__NSArray0__struct);
  }
}

- (void)updateOnlyPreemptiveSuspend:(BOOL)a3
{
}

- (void)resetOnlyPreemptiveSuspend
{
}

- (void)enterTestModeWithParameters:(id)a3 reset:(BOOL)a4 handler:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = (void (**)(id, uint64_t))a5;
  uint64_t v10 = +[_DASDaemonLogger defaultCategory];
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v11)
    {
      LOWORD(v13) = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Resetting test mode parameters", (uint8_t *)&v13, 2u);
    }

    [(NSUserDefaults *)self->_testingDefaults setObject:0 forKey:@"testModeParameters"];
    [(_DASDaemon *)self setTestModeParameters:0];
  }
  else
  {
    if (v11)
    {
      int v13 = 138412290;
      id v14 = v8;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Entering test mode with parameters: %@", (uint8_t *)&v13, 0xCu);
    }

    [(NSUserDefaults *)self->_testingDefaults setObject:v8 forKey:@"testModeParameters"];
    [(_DASDaemon *)self setTestModeParameters:v8];
    unsigned __int8 v12 = +[NSDate date];
    [(NSUserDefaults *)self->_testingDefaults setObject:v12 forKey:@"testModeLastUpdated"];
  }
  v9[2](v9, 1);
}

- (void)enableTaskRegistryMode:(BOOL)a3 processes:(id)a4 handler:(id)a5
{
  BOOL v6 = a3;
  id v8 = (NSSet *)a4;
  id v9 = (void (**)(id, uint64_t))a5;
  uint64_t v10 = +[_DASDaemonLogger defaultCategory];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 67109120;
    LODWORD(v16) = v6;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Setting task registry mode to: %i", (uint8_t *)&v15, 8u);
  }

  BOOL v11 = +[_DASDaemonLogger defaultCategory];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 138412290;
    id v16 = v8;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Setting processes to: %@", (uint8_t *)&v15, 0xCu);
  }

  self->_BOOL taskRegistryMode = v6;
  taskRegistryProcesses = self->_taskRegistryProcesses;
  self->_taskRegistryProcesses = v8;
  int v13 = v8;

  id v14 = [(NSSet *)v13 allObjects];
  [(NSUserDefaults *)self->_testingDefaults setBool:v6 forKey:@"taskRegistryMode"];
  [(NSUserDefaults *)self->_testingDefaults setObject:v14 forKey:@"taskRegistryProcesses"];

  v9[2](v9, 1);
}

- (void)submitRateLimitConfiguration:(id)a3 handler:(id)a4
{
  id v7 = (void (**)(id, uint64_t))a4;
  id v5 = a3;
  BOOL v6 = +[_DASActivityRateLimitManager sharedLimiter];
  [v6 submitRateLimitConfiguration:v5];

  v7[2](v7, 1);
}

- (void)pauseWithParameters:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, uint64_t))a4;
  id v8 = +[_DASDaemonLogger defaultCategory];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 138412290;
    id v14 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Pausing scheduling with parameters: %@", (uint8_t *)&v13, 0xCu);
  }

  if ([v6 count])
  {
    id v9 = [v6 mutableCopy];
    uint64_t v10 = +[NSDate dateWithTimeIntervalSinceNow:86400.0];
    [v10 timeIntervalSinceReferenceDate];
    BOOL v11 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    [v9 setObject:v11 forKeyedSubscript:@"validUntil"];

    [(NSUserDefaults *)self->_testingDefaults setObject:v9 forKey:@"pausedParameters"];
    [(_DASDaemon *)self setPausedParameters:v9];
    unsigned __int8 v12 = [(_DASDaemon *)self tasksNoLongerEligible];
    [(_DASDaemon *)self suspendActivities:v12];
  }
  else
  {
    [(NSUserDefaults *)self->_testingDefaults removeObjectForKey:@"pausedParameters"];
    [(_DASDaemon *)self setPausedParameters:0];
  }
  v7[2](v7, 1);
}

- (void)addPauseExceptParameter:(id)a3 handler:(id)a4
{
  id v6 = (void (**)(id, uint64_t))a4;
  if (a3)
  {
    testingDefaults = self->_testingDefaults;
    id v8 = a3;
    id v9 = [(NSUserDefaults *)testingDefaults objectForKey:@"pausedParameters"];
    uint64_t v10 = v9;
    if (v9)
    {
      id v11 = [v9 mutableCopy];
    }
    else
    {
      id v11 = +[NSMutableDictionary dictionary];
    }
    unsigned __int8 v12 = v11;
    int v13 = [v11 objectForKeyedSubscript:@"exceptTypes"];
    if (v13)
    {
      id v14 = [v10 objectForKeyedSubscript:@"exceptTypes"];
      id v15 = [v14 mutableCopy];
    }
    else
    {
      id v15 = +[NSMutableArray array];
    }

    [v15 addObject:v8];
    id v16 = +[NSArray arrayWithArray:v15];
    [v12 setObject:v16 forKeyedSubscript:@"exceptTypes"];

    id v17 = +[NSDictionary dictionaryWithDictionary:v12];
    [(_DASDaemon *)self setPausedParameters:v17];

    uint64_t v18 = self->_testingDefaults;
    uint64_t v19 = [(_DASDaemon *)self pausedParameters];
    [(NSUserDefaults *)v18 setObject:v19 forKey:@"pausedParameters"];

    long long v20 = +[_DASDaemonLogger defaultCategory];
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v21 = [(_DASDaemon *)self pausedParameters];
      int v22 = 138412290;
      id v23 = v21;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Adding pause parameter: %@", (uint8_t *)&v22, 0xCu);
    }
  }
  v6[2](v6, 1);
}

- (void)deleteLimitForActivity:(id)a3 forLimiterWithName:(id)a4 handler:(id)a5
{
  id v17 = a3;
  id v8 = a4;
  id v9 = (void (**)(id, id))a5;
  uint64_t v10 = [(_DASRuntimeLimiter *)self->_runtimeLimiter limitationName];
  id v11 = [v10 lowercaseString];
  unsigned __int8 v12 = [v11 isEqualToString:v8];

  if (v12)
  {
    p_runtimeLimiter = (id *)&self->_runtimeLimiter;
  }
  else
  {
    id v14 = [(_DASConfigurationLimiter *)self->_configurationLimiter limitationName];
    id v15 = [v14 lowercaseString];
    unsigned int v16 = [v15 isEqualToString:v8];

    if (!v16) {
      goto LABEL_6;
    }
    p_runtimeLimiter = (id *)&self->_configurationLimiter;
  }
  v9[2](v9, [*p_runtimeLimiter deleteLimitForActivity:v17]);
LABEL_6:
  v9[2](v9, 0);
}

- (void)updateLimit:(double)a3 forActivity:(id)a4 forLimiterWithName:(id)a5 handler:(id)a6
{
  id v21 = a4;
  id v10 = a5;
  id v11 = (void (**)(id, id))a6;
  unsigned __int8 v12 = [(_DASRuntimeLimiter *)self->_runtimeLimiter limitationName];
  int v13 = [v12 lowercaseString];
  id v14 = [v10 lowercaseString];
  unsigned int v15 = [v13 isEqualToString:v14];

  if (v15)
  {
    id v16 = (id)[(_DASRuntimeLimiter *)self->_runtimeLimiter setLimit:v21 forActivity:a3];
  }
  else
  {
    id v17 = [(_DASConfigurationLimiter *)self->_configurationLimiter limitationName];
    uint64_t v18 = [v17 lowercaseString];
    uint64_t v19 = [v10 lowercaseString];
    unsigned int v20 = [v18 isEqualToString:v19];

    if (!v20) {
      goto LABEL_6;
    }
    id v16 = [(_DASConfigurationLimiter *)self->_configurationLimiter setLimitForActivity:v21];
  }
  v11[2](v11, v16);
LABEL_6:
  v11[2](v11, 0);
}

- (void)getLimiterResponseForActivity:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, id))a4;
  [(_DASDaemon *)self allTasks];
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  id v9 = [v8 countByEnumeratingWithState:&v40 objects:v47 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v41;
LABEL_3:
    uint64_t v12 = 0;
    while (1)
    {
      if (*(void *)v41 != v11) {
        objc_enumerationMutation(v8);
      }
      int v13 = *(void **)(*((void *)&v40 + 1) + 8 * v12);
      id v14 = [v13 name];
      unsigned __int8 v15 = [v6 isEqualToString:v14];

      if (v15) {
        break;
      }
      if (v10 == (id)++v12)
      {
        id v10 = [v8 countByEnumeratingWithState:&v40 objects:v47 count:16];
        if (v10) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
    uint64_t v19 = [v13 limitationResponse];

    id v17 = +[NSMutableArray array];
    if (!v19)
    {
      id v16 = 0;
      goto LABEL_22;
    }
    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    id v18 = v19;
    id v20 = [v18 countByEnumeratingWithState:&v36 objects:v46 count:16];
    if (v20)
    {
      id v21 = v20;
      id v34 = v6;
      id obj = v18;
      id v32 = v8;
      uint64_t v33 = v7;
      uint64_t v22 = *(void *)v37;
      do
      {
        for (i = 0; i != v21; i = (char *)i + 1)
        {
          if (*(void *)v37 != v22) {
            objc_enumerationMutation(obj);
          }
          uint64_t v24 = *(void **)(*((void *)&v36 + 1) + 8 * i);
          id v25 = +[NSMutableDictionary dictionary];
          id v26 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v24 decision]);
          [v24 validityDuration];
          id v27 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
          [v25 setObject:v26 forKey:@"decision"];
          double v28 = [v24 rationale];
          [v25 setObject:v28 forKey:@"rationale"];

          id v29 = [v24 limiterName];
          [v25 setObject:v29 forKey:@"limiterName"];

          [v25 setObject:v27 forKey:@"validityDuration"];
          [v17 addObject:v25];
        }
        id v21 = [obj countByEnumeratingWithState:&v36 objects:v46 count:16];
      }
      while (v21);
      id v6 = v34;
      id v18 = obj;
      id v16 = obj;
      id v8 = v32;
      id v7 = v33;
    }
    else
    {
      id v16 = v18;
    }
  }
  else
  {
LABEL_9:
    id v16 = 0;
    id v17 = 0;
    id v18 = v8;
  }

LABEL_22:
  id v30 = +[_DASDaemonLogger defaultCategory];
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    long long v45 = v17;
    _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "Limiter Response: %@", buf, 0xCu);
  }

  id v31 = [v17 copy];
  v7[2](v7, v31);
}

- (void)getRuntimeLimit:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(void, double))a4;
  [(_DASDaemon *)self allTasks];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  id v9 = [v8 countByEnumeratingWithState:&v19 objects:v25 count:16];
  double v10 = -1.0;
  if (v9)
  {
    id v11 = v9;
    uint64_t v12 = *(void *)v20;
    while (2)
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v20 != v12) {
          objc_enumerationMutation(v8);
        }
        id v14 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        unsigned __int8 v15 = [v14 name];
        unsigned int v16 = [v6 isEqualToString:v15];

        if (v16)
        {
          [(_DASRuntimeLimiter *)self->_runtimeLimiter maximumRuntimeForActivity:v14];
          double v10 = v17;
          goto LABEL_11;
        }
      }
      id v11 = [v8 countByEnumeratingWithState:&v19 objects:v25 count:16];
      if (v11) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  id v18 = +[_DASDaemonLogger defaultCategory];
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    double v24 = v10;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Maximum Allowable Runtime: %lf", buf, 0xCu);
  }

  v7[2](v7, v10);
}

- (id)createTempBGSQLFile:(id)a3
{
  if (a3)
  {
    id v3 = a3;
    id v4 = NSTemporaryDirectory();
    id v5 = +[NSUUID UUID];
    id v6 = +[NSString stringWithFormat:@"%@tempSQL_%@.BGSQL", v4, v5];
    id v7 = +[_DASDaemonLogger defaultCategory];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      id v12 = [v6 UTF8String];
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "File Path: %s", buf, 0xCu);
    }

    id v8 = +[NSFileManager defaultManager];
    [v8 createFileAtPath:v6 contents:v3 attributes:0];

    id v9 = +[NSURL fileURLWithPath:v6 isDirectory:0];
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (BOOL)removeTempBGSQLFile:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    id v4 = +[_DASDaemonLogger defaultCategory];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      id v5 = [v3 path];
      *(_DWORD *)buf = 136315138;
      id v14 = [v5 UTF8String];
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Removing temporary BGSQL file at %s", buf, 0xCu);
    }
    id v6 = +[NSFileManager defaultManager];
    id v12 = 0;
    unsigned __int8 v7 = [v6 removeItemAtURL:v3 error:&v12];
    id v8 = v12;

    if ((v7 & 1) == 0)
    {
      id v9 = +[_DASDaemonLogger defaultCategory];
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        sub_1000FF46C(v8, v9);
      }
    }
    BOOL v10 = v8 == 0;
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (void)getElapsedRuntimes:(id)a3 timeFilter:(id)a4 bgsqlData:(id)a5 handler:(id)a6
{
  BOOL v10 = (void (**)(id, id))a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v17 = +[_DASLatencyProjector sharedInstance];
  id v14 = [(_DASDaemon *)self createTempBGSQLFile:v11];

  unsigned __int8 v15 = [v17 computeElapsedRunTimes:v13 timeFilter:v12 filepath:v14];

  [(_DASDaemon *)self removeTempBGSQLFile:v14];
  id v16 = [v15 copy];
  v10[2](v10, v16);
}

- (void)getEstimatedRuntimes:(id)a3 timeFilter:(id)a4 bgsqlData:(id)a5 handler:(id)a6
{
  BOOL v10 = (void (**)(id, id))a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v17 = +[_DASLatencyProjector sharedInstance];
  id v14 = [(_DASDaemon *)self createTempBGSQLFile:v11];

  unsigned __int8 v15 = [v17 computeEstimatedRunTimes:v13 timeFilter:v12 filepath:v14];

  [(_DASDaemon *)self removeTempBGSQLFile:v14];
  id v16 = [v15 copy];
  v10[2](v10, v16);
}

- (void)getConditionsPenalties:(id)a3 handler:(id)a4
{
  id v5 = (void (**)(id, id))a4;
  id v6 = a3;
  id v9 = +[_DASLatencyProjector sharedInstance];
  unsigned __int8 v7 = [v9 getConditionsPenalties:v6];

  id v8 = [v7 copy];
  v5[2](v5, v8);
}

- (void)getFeatureTimelines:(id)a3 timeFilter:(id)a4 bgsqlData:(id)a5 handler:(id)a6
{
  BOOL v10 = (void (**)(id, id))a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v17 = +[_DASLatencyProjector sharedInstance];
  id v14 = [(_DASDaemon *)self createTempBGSQLFile:v11];

  unsigned __int8 v15 = [v17 getFeatureTimelines:v13 timeFilter:v12 filepath:v14];

  [(_DASDaemon *)self removeTempBGSQLFile:v14];
  id v16 = [v15 copy];
  v10[2](v10, v16);
}

- (void)getActivityTimelines:(id)a3 timeFilter:(id)a4 bgsqlData:(id)a5 handler:(id)a6
{
  BOOL v10 = (void (**)(id, id))a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v17 = +[_DASLatencyProjector sharedInstance];
  id v14 = [(_DASDaemon *)self createTempBGSQLFile:v11];

  unsigned __int8 v15 = [v17 getActivityTimelines:v13 timeFilter:v12 filepath:v14];

  [(_DASDaemon *)self removeTempBGSQLFile:v14];
  id v16 = [v15 copy];
  v10[2](v10, v16);
}

- (void)getDeviceConditionTimelines:(id)a3 bgsqlData:(id)a4 handler:(id)a5
{
  id v8 = (void (**)(id, id))a5;
  id v9 = a4;
  id v10 = a3;
  id v14 = +[_DASLatencyProjector sharedInstance];
  id v11 = [(_DASDaemon *)self createTempBGSQLFile:v9];

  id v12 = [v14 getDeviceConditionTimelines:v10 filepath:v11];

  [(_DASDaemon *)self removeTempBGSQLFile:v11];
  id v13 = [v12 copy];
  v8[2](v8, v13);
}

- (void)getInstallTimeline:(id)a3 bgsqlData:(id)a4 handler:(id)a5
{
  id v8 = (void (**)(id, id))a5;
  id v9 = a4;
  id v10 = a3;
  id v14 = +[_DASLatencyProjector sharedInstance];
  id v11 = [(_DASDaemon *)self createTempBGSQLFile:v9];

  id v12 = [v14 getInstallTimeline:v10 filepath:v11];

  [(_DASDaemon *)self removeTempBGSQLFile:v11];
  id v13 = [v12 copy];
  v8[2](v8, v13);
}

- (void)getBuddyEvents:(id)a3 bgsqlData:(id)a4 handler:(id)a5
{
  id v8 = (void (**)(id, id))a5;
  id v9 = a4;
  id v10 = a3;
  id v14 = +[_DASLatencyProjector sharedInstance];
  id v11 = [(_DASDaemon *)self createTempBGSQLFile:v9];

  id v12 = [v14 getBuddyData:v10 filepath:v11];

  [(_DASDaemon *)self removeTempBGSQLFile:v11];
  id v13 = [v12 copy];
  v8[2](v8, v13);
}

- (void)getEstimatedMADCompletionTimes:(id)a3 endDate:(id)a4 bgsqlData:(id)a5 handler:(id)a6
{
  id v10 = (void (**)(id, id))a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v17 = +[_DASLatencyProjector sharedInstance];
  id v14 = [(_DASDaemon *)self createTempBGSQLFile:v11];

  unsigned __int8 v15 = [v17 computeEstimatedMADCompletionTimes:v13 endDate:v12 filepath:v14];

  [(_DASDaemon *)self removeTempBGSQLFile:v14];
  id v16 = [v15 copy];
  v10[2](v10, v16);
}

- (void)registerForNetworkPathEvaluation
{
  networkEvaluationMonitor = self->_networkEvaluationMonitor;
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1000CA884;
  v3[3] = &unk_100177FD0;
  v3[4] = self;
  [(_DASNetworkEvaluationMonitor *)networkEvaluationMonitor registerForNetworkEvaluationWithCallback:v3];
}

- (void)handleTriggersBatched:(id)a3
{
}

- (void)handleTriggers:(id)a3
{
  id v3 = a3;
  long long v52 = (void *)os_transaction_create();
  id v4 = +[_DASDaemonLogger logForCategory:@"lifecycle"];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = [v3 description];
    id v6 = [v5 stringByReplacingOccurrencesOfString:@"\n" withString:@" "];
    *(_DWORD *)buf = 138543362;
    id v88 = v6;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Attempting to suspend based on triggers: %{public}@", buf, 0xCu);
  }
  unsigned __int8 v7 = [(_DASDaemon *)self tasksNoLongerEligible];
  [(_DASDaemon *)self suspendActivities:v7];

  long long v57 = +[NSMutableSet set];
  long long v63 = +[NSMutableSet set];
  long long v85 = 0u;
  long long v86 = 0u;
  long long v83 = 0u;
  long long v84 = 0u;
  id obj = v3;
  id v55 = [obj countByEnumeratingWithState:&v83 objects:v94 count:16];
  if (v55)
  {
    uint64_t v54 = *(void *)v84;
    uint64_t v8 = _DASLaunchReasonNSURLSessionComplete;
    uint64_t v70 = _DASLaunchReasonWatchConnectivityPendingData;
    uint64_t v69 = _DASLaunchReasonBackgroundRemoteNotification;
    do
    {
      for (i = 0; i != v55; i = (char *)i + 1)
      {
        if (*(void *)v84 != v54) {
          objc_enumerationMutation(obj);
        }
        long long v59 = *(void **)(*((void *)&v83 + 1) + 8 * i);
        if ((objc_msgSend(v57, "containsObject:") & 1) == 0)
        {
          [v57 addObject:v59];
          long long v56 = [(NSDictionary *)self->_triggerToPolicyMap objectForKeyedSubscript:v59];
          if ([v56 shouldIgnoreTrigger:v59 withState:self->_context])
          {
            p_super = +[_DASDaemonLogger defaultCategory];
            if (os_log_type_enabled(p_super, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543362;
              id v88 = v59;
              _os_log_impl((void *)&_mh_execute_header, p_super, OS_LOG_TYPE_DEFAULT, "Ignoring trigger %{public}@, conditions are worse", buf, 0xCu);
            }
            goto LABEL_54;
          }
          if (![v59 isEqualToString:@"com.apple.das.apppolicy.appchanged"]) {
            goto LABEL_37;
          }
          id v60 = +[_DASApplicationPolicy focalApplicationsWithContext:self->_context];
          long long v81 = 0u;
          long long v82 = 0u;
          long long v79 = 0u;
          long long v80 = 0u;
          id v62 = (char *)[v60 countByEnumeratingWithState:&v79 objects:v93 count:16];
          if (!v62) {
            goto LABEL_36;
          }
          uint64_t v61 = *(void *)v80;
          while (2)
          {
            id v10 = 0;
            while (2)
            {
              if (*(void *)v80 != v61)
              {
                id v11 = v10;
                objc_enumerationMutation(v60);
                id v10 = v11;
              }
              unsigned int v64 = v10;
              id v67 = *(id *)(*((void *)&v79 + 1) + 8 * (void)v10);
              id v12 = +[NSMutableSet set];
              os_unfair_recursive_lock_lock_with_options();
              id v13 = [(NSMutableDictionary *)self->_applicationLaunchRequests objectForKeyedSubscript:v67];
              long long v77 = 0u;
              long long v78 = 0u;
              long long v75 = 0u;
              long long v76 = 0u;
              id v14 = [v13 countByEnumeratingWithState:&v75 objects:v92 count:16];
              if (v14)
              {
                uint64_t v15 = *(void *)v76;
                do
                {
                  id v16 = 0;
                  do
                  {
                    if (*(void *)v76 != v15) {
                      objc_enumerationMutation(v13);
                    }
                    id v17 = *(void **)(*((void *)&v75 + 1) + 8 * (void)v16);
                    id v18 = [v17 launchReason];
                    if ([v18 isEqualToString:v8])
                    {

LABEL_26:
                      [v12 addObject:v17];
                      goto LABEL_27;
                    }
                    long long v19 = [v17 launchReason];
                    unsigned int v20 = [v19 isEqualToString:v70];

                    if (v20) {
                      goto LABEL_26;
                    }
                    long long v21 = [v17 launchReason];
                    unsigned int v22 = [v21 isEqualToString:v69];

                    if (v22)
                    {
                      id v23 = +[NSDate date];
                      double v24 = [v17 startAfter];
                      [v24 timeIntervalSinceDate:v23];
                      BOOL v26 = v25 > 0.0;

                      if (v26) {
                        [v17 setStartAfter:v23];
                      }
                    }
LABEL_27:
                    id v16 = (char *)v16 + 1;
                  }
                  while (v14 != v16);
                  id v27 = [v13 countByEnumeratingWithState:&v75 objects:v92 count:16];
                  id v14 = v27;
                }
                while (v27);
              }

              os_unfair_recursive_lock_unlock();
              [(_DASDaemon *)self cancelActivities:v12];
              double v28 = +[_DASApplicationPolicy policyInstance];
              [v28 updateAppLaunchedRecently:v67];

              id v10 = v64 + 1;
              if (v64 + 1 != v62) {
                continue;
              }
              break;
            }
            id v62 = (char *)[v60 countByEnumeratingWithState:&v79 objects:v93 count:16];
            if (v62) {
              continue;
            }
            break;
          }
LABEL_36:

LABEL_37:
          id v65 = self->_triggerToActivitiesMap;
          objc_sync_enter(v65);
          id v29 = [(NSMutableDictionary *)self->_triggerToActivitiesMap objectForKeyedSubscript:v59];

          if (v29)
          {
            unsigned int v30 = [v59 isEqualToString:@"com.apple.das.fileprotectionpolicy.statuschanged"];
            triggerToActivitiesMap = self->_triggerToActivitiesMap;
            if (v30)
            {
              id v32 = [(NSMutableDictionary *)triggerToActivitiesMap objectForKeyedSubscript:v59];
              long long v73 = 0u;
              long long v74 = 0u;
              long long v71 = 0u;
              long long v72 = 0u;
              id v68 = v32;
              id v33 = [v68 countByEnumeratingWithState:&v71 objects:v91 count:16];
              if (!v33) {
                goto LABEL_50;
              }
              uint64_t v34 = *(void *)v72;
              while (1)
              {
                for (j = 0; j != v33; j = (char *)j + 1)
                {
                  if (*(void *)v72 != v34) {
                    objc_enumerationMutation(v68);
                  }
                  long long v36 = *(void **)(*((void *)&v71 + 1) + 8 * (void)j);
                  long long v37 = [v36 fileProtection];
                  long long v38 = +[_DASFileProtection complete];
                  if ([v37 isEqual:v38])
                  {
                  }
                  else
                  {
                    long long v39 = [v36 fileProtection];
                    long long v40 = +[_DASFileProtection completeUnlessOpen];
                    unsigned int v41 = [v39 isEqual:v40];

                    if (!v41) {
                      continue;
                    }
                  }
                  [v63 addObject:v36];
                }
                id v33 = [v68 countByEnumeratingWithState:&v71 objects:v91 count:16];
                if (!v33)
                {
LABEL_50:

                  long long v42 = v68;
                  goto LABEL_52;
                }
              }
            }
            long long v42 = [(NSMutableDictionary *)triggerToActivitiesMap objectForKeyedSubscript:v59];
            [v63 unionSet:v42];
LABEL_52:
          }
          p_super = &v65->super.super;
          objc_sync_exit(v65);
LABEL_54:

          continue;
        }
      }
      id v55 = [obj countByEnumeratingWithState:&v83 objects:v94 count:16];
    }
    while (v55);
  }

  long long v43 = +[_DASDaemonLogger logForCategory:@"lifecycle"];
  if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
  {
    id v44 = [v63 count];
    *(_DWORD *)buf = 134217984;
    id v88 = v44;
    _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_DEFAULT, "Evaluating %llu activities based on triggers", buf, 0xCu);
  }

  context = self->_context;
  long long v46 = +[_CDContextQueries keyPathForCallInProgressStatus];
  long long v47 = [(_CDLocalContext *)context objectForKeyedSubscript:v46];
  LOBYTE(context) = [v47 BOOLValue];

  if ((context & 1) == 0) {
    [(_DASDaemon *)self unprotectedEvaluateScoreAndRunActivities:v63];
  }
  if ([v57 containsObject:@"com.apple.duetactivityscheduler.pluggedinpolicy.ispluggedin"])
  {
    [(_DASDaemon *)self determineNextTimerFireDateAndSchedule];
    [(_DASDaemon *)self evaluateAssertions];
  }
  if (([v57 containsObject:@"com.apple.duetactivityscheduler.databudgetpolicy.status"] & 1) != 0|| (objc_msgSend(v57, "containsObject:", @"com.apple.duetactivityscheduler.energybudgetpolicy.status") & 1) != 0|| objc_msgSend(v57, "containsObject:", @"com.apple.dueatctivityscheduler.photospolicy.photoswork"))
  {
    if (self->_photosIsBlocked)
    {
      if (+[_DASDataBudgetPolicy budgetIsPositive:self->_context])
      {
        if (+[_DASEnergyBudgetPolicy budgetIsPositive:self->_context])
        {
          long long v48 = +[_DASPhotosPolicy policyInstance];
          unsigned __int8 v49 = [v48 haveSignificantWorkRemaining:self->_context];

          if ((v49 & 1) == 0)
          {
            long long v50 = +[_DASDaemonLogger defaultCategory];
            if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
            {
              long long v51 = +[NSNumber numberWithUnsignedInteger:self->_photosIsBlocked];
              *(_DWORD *)buf = 138543618;
              id v88 = obj;
              __int16 v89 = 2112;
              id v90 = v51;
              _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_DEFAULT, "Reporting photos activity no longer blocked: %{public}@ (was %@)", buf, 0x16u);
            }
            [(_DASDaemon *)self updateiCPLTasksBlocked:0];
          }
        }
      }
    }
  }
  +[_DASMetricRecorder incrementOccurrencesForKey:@"com.apple.das.triggercount" byCount:1];
}

- (void)handleCompletedActivities:(id)a3
{
  id v4 = a3;
  uint64_t v35 = (void *)os_transaction_create();
  id v5 = +[NSMutableSet set];
  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id obj = v4;
  id v38 = [obj countByEnumeratingWithState:&v43 objects:v48 count:16];
  if (v38)
  {
    uint64_t v37 = *(void *)v44;
    do
    {
      for (i = 0; i != v38; i = (char *)i + 1)
      {
        if (*(void *)v44 != v37) {
          objc_enumerationMutation(obj);
        }
        unsigned __int8 v7 = *(void **)(*((void *)&v43 + 1) + 8 * i);
        uint64_t v8 = self->_activityToIncompatibleActivitiesMap;
        objc_sync_enter(v8);
        activityToIncompatibleActivitiesMap = self->_activityToIncompatibleActivitiesMap;
        id v10 = [v7 name];
        id v11 = [(NSMutableDictionary *)activityToIncompatibleActivitiesMap objectForKeyedSubscript:v10];

        if (v11)
        {
          [v5 unionSet:v11];
          id v12 = self->_activityToIncompatibleActivitiesMap;
          id v13 = [v7 name];
          [(NSMutableDictionary *)v12 removeObjectForKey:v13];
        }
        objc_sync_exit(v8);

        id v14 = [v7 groupName];
        if (([v14 isEqualToString:_DASDefaultGroupName] & 1) == 0)
        {
          uint64_t v15 = [v7 groupName];
          if (![v15 isEqualToString:_DASDefaultNetworkGroupName])
          {
            id v23 = [v7 groupName];
            unsigned __int8 v24 = [v23 isEqualToString:_DASDefaultRemoteGroupName];

            if ((v24 & 1) == 0) {
              goto LABEL_15;
            }
            goto LABEL_12;
          }
        }
LABEL_12:
        os_unfair_lock_lock(&self->_groupLock);
        groupToPendingTasks = self->_groupToPendingTasks;
        id v17 = [v7 groupName];
        id v18 = [(NSMutableDictionary *)groupToPendingTasks objectForKeyedSubscript:v17];
        id v19 = [v18 copy];

        os_unfair_lock_unlock(&self->_groupLock);
        if (v19) {
          [v5 unionSet:v19];
        }

LABEL_15:
        id v20 = [v7 groupName];
        if (!v20) {
          continue;
        }
        long long v21 = [v7 groupName];
        if (([v21 isEqualToString:_DASDefaultGroupName] & 1) == 0)
        {
          unsigned int v22 = [v7 groupName];
          if ([v22 isEqualToString:_DASDefaultNetworkGroupName])
          {
          }
          else
          {
            double v25 = [v7 groupName];
            unsigned __int8 v26 = [v25 isEqualToString:_DASDefaultRemoteGroupName];

            if (v26) {
              continue;
            }
            long long v21 = +[NSMutableSet set];
            os_unfair_lock_lock(&self->_groupLock);
            id v27 = self->_groupToPendingTasks;
            double v28 = [v7 groupName];
            id v29 = [(NSMutableDictionary *)v27 objectForKeyedSubscript:v28];
            id v30 = [v29 copy];

            long long v41 = 0u;
            long long v42 = 0u;
            long long v39 = 0u;
            long long v40 = 0u;
            id v20 = v30;
            id v31 = [v20 countByEnumeratingWithState:&v39 objects:v47 count:16];
            if (v31)
            {
              uint64_t v32 = *(void *)v40;
              do
              {
                for (j = 0; j != v31; j = (char *)j + 1)
                {
                  if (*(void *)v40 != v32) {
                    objc_enumerationMutation(v20);
                  }
                  uint64_t v34 = *(void **)(*((void *)&v39 + 1) + 8 * (void)j);
                  if ([v34 isIntensive]) {
                    [v21 addObject:v34];
                  }
                }
                id v31 = [v20 countByEnumeratingWithState:&v39 objects:v47 count:16];
              }
              while (v31);
            }

            os_unfair_lock_unlock(&self->_groupLock);
            if ([v21 count]) {
              [v5 unionSet:v21];
            }
          }
        }
      }
      id v38 = [obj countByEnumeratingWithState:&v43 objects:v48 count:16];
    }
    while (v38);
  }

  [(_DASDaemon *)self unprotectedEvaluateScoreAndRunActivities:v5];
}

- (void)registerWithContextStoreForId:(id)a3 contextualPredicate:(id)a4 dismissalCondition:(id)a5 deviceSet:(unint64_t)a6 mustWake:(BOOL)a7 qualityOfService:(unsigned int)a8
{
  BOOL v9 = a7;
  id v14 = a3;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_100010988;
  v19[3] = &unk_100177FF8;
  id v20 = a4;
  long long v21 = self;
  id v22 = v14;
  id v15 = v14;
  id v16 = v20;
  LODWORD(v18) = a8;
  id v17 = +[_CDContextualChangeRegistration registrationWithIdentifier:v15 contextualPredicate:v16 dismissalPolicy:a5 deviceSet:a6 clientIdentifier:@"com.apple.dasd.trigger" mustWake:v9 qualityOfService:v18 callback:v19];
  [(_CDLocalContext *)self->_context registerCallback:v17];
}

- (void)registerTriggersWithContextStoreForPolicies:(id)a3
{
  id v3 = a3;
  id v30 = [&__NSDictionary0__struct mutableCopy];
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id obj = v3;
  id v24 = [obj countByEnumeratingWithState:&v37 objects:v42 count:16];
  if (v24)
  {
    uint64_t v23 = *(void *)v38;
    do
    {
      uint64_t v4 = 0;
      do
      {
        if (*(void *)v38 != v23) {
          objc_enumerationMutation(obj);
        }
        uint64_t v25 = v4;
        id v31 = *(void **)(*((void *)&v37 + 1) + 8 * v4);
        id v29 = [v31 triggers];
        if (v29)
        {
          long long v35 = 0u;
          long long v36 = 0u;
          long long v33 = 0u;
          long long v34 = 0u;
          id v5 = [v29 countByEnumeratingWithState:&v33 objects:v41 count:16];
          if (v5)
          {
            id v6 = v5;
            uint64_t v7 = *(void *)v34;
            uint64_t v27 = *(void *)v34;
            do
            {
              uint64_t v8 = 0;
              id v28 = v6;
              do
              {
                if (*(void *)v34 != v7) {
                  objc_enumerationMutation(v29);
                }
                BOOL v9 = *(void **)(*((void *)&v33 + 1) + 8 * (void)v8);
                id v10 = [v9 objectForKeyedSubscript:@"identifier"];
                if (v10)
                {
                  id v11 = [v9 objectForKeyedSubscript:@"predicate"];

                  if (v11)
                  {
                    uint64_t v32 = [v9 objectForKeyedSubscript:@"predicate"];
                    id v12 = [v9 objectForKeyedSubscript:@"dismissalCondition"];
                    id v13 = [v9 objectForKeyedSubscript:@"deviceSet"];
                    id v14 = [v13 unsignedIntegerValue];
                    id v15 = [v9 objectForKeyedSubscript:@"mustWake"];
                    id v16 = [v15 BOOLValue];
                    id v17 = [v9 objectForKeyedSubscript:@"qualityOfService"];
                    if (v17)
                    {
                      uint64_t v18 = [v9 objectForKeyedSubscript:@"qualityOfService"];
                      id v19 = (void *)v32;
                      -[_DASDaemon registerWithContextStoreForId:contextualPredicate:dismissalCondition:deviceSet:mustWake:qualityOfService:](self, "registerWithContextStoreForId:contextualPredicate:dismissalCondition:deviceSet:mustWake:qualityOfService:", v10, v32, v12, v14, v16, [v18 unsignedIntegerValue]);
                    }
                    else
                    {
                      id v19 = (void *)v32;
                      [(_DASDaemon *)self registerWithContextStoreForId:v10 contextualPredicate:v32 dismissalCondition:v12 deviceSet:v14 mustWake:v16 qualityOfService:17];
                    }

                    uint64_t v7 = v27;
                    id v6 = v28;
                  }
                  [v30 setObject:v31 forKeyedSubscript:v10];
                }

                uint64_t v8 = (char *)v8 + 1;
              }
              while (v6 != v8);
              id v6 = [v29 countByEnumeratingWithState:&v33 objects:v41 count:16];
            }
            while (v6);
          }
        }

        uint64_t v4 = v25 + 1;
      }
      while ((id)(v25 + 1) != v24);
      id v24 = [obj countByEnumeratingWithState:&v37 objects:v42 count:16];
    }
    while (v24);
  }

  id v20 = +[NSDictionary dictionaryWithDictionary:v30];
  triggerToPolicyMap = self->_triggerToPolicyMap;
  self->_triggerToPolicyMap = v20;
}

- (void)periodicCalculationForOptimal
{
  id v3 = +[_DASDaemonLogger defaultCategory];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Periodic scoring of activities for optimal date", buf, 2u);
  }

  os_unfair_recursive_lock_lock_with_options();
  uint64_t v4 = +[NSDate date];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = self->_pendingTasks;
  id v6 = [(NSMutableSet *)v5 countByEnumeratingWithState:&v14 objects:v19 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        id v11 = [v10 startBefore:v14];
        [v11 timeIntervalSinceDate:v4];
        double v13 = v12;

        if (v13 > 0.0) {
          +[_DASConditionScore computeOptimalScoreAndDateForActivity:v10];
        }
      }
      id v7 = [(NSMutableSet *)v5 countByEnumeratingWithState:&v14 objects:v19 count:16];
    }
    while (v7);
  }

  os_unfair_recursive_lock_unlock();
}

- (void)schedulingTimerFired
{
  id v7 = (id)os_transaction_create();
  id v3 = +[NSDate date];
  uint64_t v4 = +[NSLocale currentLocale];
  id v5 = [v3 descriptionWithLocale:v4];
  id v6 = +[NSString stringWithFormat:@"Periodic timer fired (%@)", v5];

  [(_DASDaemon *)self evaluateScoreAndRunAllActivitiesForReason:v6];
  [(_DASDaemon *)self determineNextTimerFireDateAndSchedule];
}

- (void)determineNextTimerFireDateAndSchedule
{
  id v3 = +[NSDate date];
  os_unfair_recursive_lock_lock_with_options();
  id v68 = +[NSMutableArray arrayWithCapacity:[(NSMutableSet *)self->_pendingTasks count]];
  long long v74 = 0u;
  long long v75 = 0u;
  long long v76 = 0u;
  long long v77 = 0u;
  uint64_t v4 = self->_pendingTasks;
  id v5 = [(NSMutableSet *)v4 countByEnumeratingWithState:&v74 objects:v79 count:16];
  if (!v5)
  {
    id v69 = 0;
    goto LABEL_32;
  }
  id v6 = v5;
  id v69 = 0;
  uint64_t v7 = *(void *)v75;
  do
  {
    uint64_t v8 = 0;
    do
    {
      if (*(void *)v75 != v7) {
        objc_enumerationMutation(v4);
      }
      BOOL v9 = *(void **)(*((void *)&v74 + 1) + 8 * (void)v8);
      if (([v9 triggersRestart] & 1) != 0
        || ([v9 startBefore],
            id v10 = objc_claimAutoreleasedReturnValue(),
            [v10 timeIntervalSinceDate:v3],
            double v12 = v11,
            v10,
            v12 > 0.0))
      {
        if (![v9 requiresNetwork]
          || [(_DASNetworkEvaluationMonitor *)self->_networkEvaluationMonitor isNetworkPathAvailableForActivity:v9])
        {
          unsigned int v13 = +[_DASSystemContext isPluggedIn:self->_context];
          if (![v9 requiresPlugin] || v13 != 0)
          {
            long long v15 = +[_DASSmartPowerNapPolicy policyInstance];
            unsigned int v16 = [v15 appliesToActivity:v9];

            if (v16)
            {
              long long v17 = +[_DASSmartPowerNapPolicy policyInstance];
              uint64_t v18 = [v17 responseForActivity:v9 withState:self->_context];

              if ([v18 policyDecision] == (id)33 || objc_msgSend(v18, "policyDecision") == (id)100)
              {
LABEL_21:

                goto LABEL_22;
              }
            }
            id v19 = +[_DASLowPowerModePolicy policyInstance];
            unsigned int v20 = [v19 appliesToActivity:v9];

            if (v20)
            {
              long long v21 = +[_DASLowPowerModePolicy policyInstance];
              uint64_t v18 = [v21 responseForActivity:v9 withState:self->_context];

              if ([v18 policyDecision] == (id)33 || objc_msgSend(v18, "policyDecision") == (id)100) {
                goto LABEL_21;
              }
            }
            [v68 addObject:v9];
            if (v69)
            {
              id v22 = [v69 startBefore];
              uint64_t v23 = [v9 startBefore];
              [v22 timeIntervalSinceDate:v23];
              double v25 = v24;

              if (v25 >= 0.0)
              {
                id v26 = v9;

                id v69 = v26;
              }
            }
            else
            {
              id v69 = v9;
            }
          }
        }
      }
LABEL_22:
      uint64_t v8 = (char *)v8 + 1;
    }
    while (v6 != v8);
    id v27 = [(NSMutableSet *)v4 countByEnumeratingWithState:&v74 objects:v79 count:16];
    id v6 = v27;
  }
  while (v27);
LABEL_32:

  os_unfair_recursive_lock_unlock();
  if ([v68 count])
  {
    id v28 = [v69 schedulingPriority];
    unint64_t v29 = _DASSchedulingPriorityUtility;
    id v30 = [v69 startBefore];
    [v30 timeIntervalSinceDate:v3];
    double v32 = v31;

    if (v32 <= 0.0)
    {
      long long v39 = [v69 name];
      [(_DASDaemon *)self scheduleTimerOnBehalfOf:v39 between:(unint64_t)v28 > v29 and:600.0 waking:900.0];
    }
    else
    {
      long long v33 = [v69 startBefore];
      long long v34 = [v69 predictedOptimalStartDate];
      [v33 timeIntervalSinceDate:v34];
      if (v35 >= 90.0)
      {
      }
      else
      {
        long long v36 = [v69 predictedOptimalStartDate];
        [v36 timeIntervalSinceDate:v3];
        double v38 = v37;

        if (v38 > 0.0)
        {
          [(_DASDaemon *)self scheduleTimerForActivity:v69];
          goto LABEL_56;
        }
      }
      unint64_t v67 = (unint64_t)v28;
      long long v39 = [v69 predictedOptimalStartDate];
      long long v70 = 0u;
      long long v71 = 0u;
      long long v72 = 0u;
      long long v73 = 0u;
      id v40 = v68;
      id v41 = [v40 countByEnumeratingWithState:&v70 objects:v78 count:16];
      unint64_t v66 = v29;
      if (v41)
      {
        id v42 = v41;
        uint64_t v43 = *(void *)v71;
        do
        {
          for (i = 0; i != v42; i = (char *)i + 1)
          {
            if (*(void *)v71 != v43) {
              objc_enumerationMutation(v40);
            }
            long long v45 = *(void **)(*((void *)&v70 + 1) + 8 * i);
            long long v46 = [v45 predictedOptimalStartDate:v66];
            long long v47 = v46;
            if (v46)
            {
              [v46 timeIntervalSinceDate:v3];
              if (v48 >= 0.0)
              {
                unsigned __int8 v49 = [v69 startBefore];
                [v47 timeIntervalSinceDate:v49];
                double v51 = v50;

                if (v51 <= 0.0)
                {
                  [v47 timeIntervalSinceDate:v39];
                  if (v52 > 0.0)
                  {
                    uint64_t v53 = [v45 predictedOptimalStartDate];

                    long long v39 = (void *)v53;
                  }
                }
              }
            }
          }
          id v42 = [v40 countByEnumeratingWithState:&v70 objects:v78 count:16];
        }
        while (v42);
      }

      [v39 timeIntervalSinceDate:v3];
      double v55 = v54;
      long long v56 = [v69 startBefore];
      [v56 timeIntervalSinceDate:v3];
      double v58 = v57;

      [v39 timeIntervalSinceDate:v3];
      double v60 = v59;
      uint64_t v61 = [v69 name];
      if (v60 >= 0.0)
      {
        long long v63 = self;
        unsigned int v64 = v61;
        double v65 = v55;
        double v62 = v58;
      }
      else
      {
        double v62 = v58 + 90.0;
        long long v63 = self;
        unsigned int v64 = v61;
        double v65 = v58;
      }
      -[_DASDaemon scheduleTimerOnBehalfOf:between:and:waking:](v63, "scheduleTimerOnBehalfOf:between:and:waking:", v64, v67 > v66, v65, v62, v66);
    }
  }
LABEL_56:
}

- (void)chooseActivitiesToRunFromCandidateActivities:(id)a3 toBeRunActivities:(id)a4 toLaunchApplications:(id)a5 toLaunchExtension:(id)a6
{
  id v33 = a4;
  id v36 = a5;
  id v34 = a6;
  id v10 = [(_DASDaemon *)self sortCandidateActivities:a3];
  os_unfair_recursive_lock_lock_with_options();
  long long v39 = +[NSMutableArray arrayWithObjectsFrom:](NSMutableArray, "arrayWithObjectsFrom:", self->_prerunningTasks, self->_runningTasks, 0);
  os_unfair_recursive_lock_unlock();
  double v37 = +[NSMutableSet set];
  double v32 = +[NSMutableSet set];
  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id obj = v10;
  id v11 = [obj countByEnumeratingWithState:&v41 objects:v52 count:16];
  if (!v11)
  {
    LOBYTE(v35) = 0;
    goto LABEL_38;
  }
  int v35 = 0;
  uint64_t v12 = *(void *)v42;
  do
  {
    unsigned int v13 = 0;
    do
    {
      if (*(void *)v42 != v12) {
        objc_enumerationMutation(obj);
      }
      long long v14 = *(void **)(*((void *)&v41 + 1) + 8 * (void)v13);
      if (+[_DASPhotosPolicy isActivity:consideredNonDiscretionary:](_DASPhotosPolicy, "isActivity:consideredNonDiscretionary:", v14, self->_context)|| ([v14 isIntensive] & 1) != 0)
      {
        goto LABEL_13;
      }
      long long v15 = [v14 fastPass];
      if (v15
        || ([v14 triggersRestart] & 1) != 0
        || ([v14 groupName], (long long v15 = objc_claimAutoreleasedReturnValue()) == 0)
        || (id v16 = [v14 schedulingPriority], (unint64_t)v16 > _DASSchedulingPriorityDefault))
      {

LABEL_13:
        os_unfair_recursive_lock_lock_with_options();
        if ([(NSMutableSet *)self->_pendingTasks containsObject:v14])
        {
          os_unfair_recursive_lock_unlock();
          if ([(_DASDaemon *)self shouldRunActivityNow:v14 withOtherActivities:v39])
          {
            if ([(_DASActivityRateLimitManager *)self->_rateLimiter executeActivity:v14])
            {
              [v39 addObject:v14];
              if ([v14 requestsApplicationLaunch])
              {
                [v36 addObject:v14];
              }
              else if ([v14 requestsExtensionLaunch])
              {
                [v34 addObject:v14];
              }
              else
              {
                [v33 addObject:v14];
                v35 |= [v14 triggersRestart];
              }
              [(_DASDaemon *)self moveActivityToPrerunning:v14];
            }
            else
            {
              [v37 addObject:v14];
            }
          }
        }
        else
        {
          long long v17 = +[_DASDaemonLogger logForCategory:@"lifecycle"];
          if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
          {
            LODWORD(buf) = 138412290;
            *(void *)((char *)&buf + 4) = v14;
            _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "%@ previously run or canceled", (uint8_t *)&buf, 0xCu);
          }

          os_unfair_recursive_lock_unlock();
        }
        goto LABEL_21;
      }
      uint64_t v18 = [v14 groupName];
      BOOL v19 = [(_DASDaemon *)self additionalCapacityForActivity:v14 inGroupWithName:v18 shouldTryToSuspend:0] == 0;

      if (!v19) {
        goto LABEL_13;
      }
      unsigned int v20 = [v14 groupName];
      if ([v20 isEqualToString:_DASDefaultGroupName])
      {
      }
      else
      {
        long long v21 = [v14 groupName];
        if ([v21 isEqualToString:_DASDefaultNetworkGroupName])
        {
        }
        else
        {
          id v22 = [v14 groupName];
          unsigned __int8 v31 = [v22 isEqualToString:_DASDefaultRemoteGroupName];

          if ((v31 & 1) == 0) {
            [v32 addObject:v14];
          }
        }
      }
LABEL_21:
      unsigned int v13 = (char *)v13 + 1;
    }
    while (v11 != v13);
    id v23 = [obj countByEnumeratingWithState:&v41 objects:v52 count:16];
    id v11 = v23;
  }
  while (v23);
LABEL_38:

  if ([v32 count])
  {
    double v24 = +[_DASDaemonLogger logForCategory:@"scoring"];
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v32;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Skipping processing for %@ since their group is full", (uint8_t *)&buf, 0xCu);
    }
  }
  if ([v37 count])
  {
    double v25 = +[_DASDaemonLogger logForCategory:@"scoring"];
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v37;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Skipping processing for %@ due to rate limiting", (uint8_t *)&buf, 0xCu);
    }
  }
  if (v35)
  {
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v50 = 0x2020000000;
    int v51 = 0;
    id v26 = +[_DASDaemonLogger defaultCategory];
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long v45 = 0;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Taking an assertion", v45, 2u);
    }

    v47[0] = @"AssertType";
    v47[1] = @"AssertName";
    v48[0] = @"PreventUserIdleSystemSleep";
    v48[1] = @"com.apple.duetactivityscheduler.triggersRestart";
    v47[2] = @"AllowsDeviceRestart";
    v48[2] = kCFBooleanTrue;
    CFDictionaryRef v27 = +[NSDictionary dictionaryWithObjects:v48 forKeys:v47 count:3];
    IOReturn v28 = IOPMAssertionCreateWithProperties(v27, (IOPMAssertionID *)(*((void *)&buf + 1) + 24));
    if (v28)
    {
      unint64_t v29 = +[_DASDaemonLogger defaultCategory];
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long v45 = 67109120;
        IOReturn v46 = v28;
        _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "Failed to create SystemActive assertion. ret:0x%x", v45, 8u);
      }
    }
    else
    {
      dispatch_time_t v30 = dispatch_time(0, 30000000000);
      unint64_t v29 = dispatch_queue_create("com.apple.duetactivityscheduler.assertion", 0);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_1000CCD00;
      block[3] = &unk_100175628;
      void block[4] = &buf;
      dispatch_after(v30, v29, block);
    }

    _Block_object_dispose(&buf, 8);
  }
}

- (id)sortCandidateActivities:(id)a3
{
  context = self->_context;
  id v5 = a3;
  id v6 = +[_DASUserRequestedBackupTaskManager userRequestedBackupKeyPath];
  uint64_t v7 = [(_CDLocalContext *)context objectForKeyedSubscript:v6];
  unsigned __int8 v8 = [v7 BOOLValue];

  unsigned __int8 v9 = +[_DASPhotosPolicy isPhotosForegroundWithContext:self->_context];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  void v14[2] = sub_1000CCE78;
  v14[3] = &unk_100178020;
  unsigned __int8 v15 = v8;
  unsigned __int8 v16 = v9;
  v14[4] = self;
  id v10 = objc_retainBlock(v14);
  id v11 = [v5 sortedArrayUsingComparator:v10];

  uint64_t v12 = +[NSMutableArray arrayWithArray:v11];

  return v12;
}

- (void)evaluateScoreAndRunActivities:(id)a3
{
  id v4 = a3;
  id v5 = (void *)os_transaction_create();
  evaluationQueue = self->_evaluationQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000CD4E8;
  block[3] = &unk_100175548;
  id v10 = v5;
  id v11 = self;
  id v12 = v4;
  id v7 = v4;
  id v8 = v5;
  dispatch_sync(evaluationQueue, block);
}

- (void)unprotectedEvaluateScoreAndRunActivities:(id)a3
{
  id v4 = a3;
  if (![v4 count]) {
    goto LABEL_49;
  }
  uint64_t v53 = v5;
  id v6 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v4 count]);
  double v52 = +[NSMutableSet set];
  int v51 = +[NSMutableSet set];
  uint64_t v50 = +[NSMutableSet set];
  double v57 = +[NSMutableSet set];
  double v60 = +[NSDate date];
  unsigned __int8 v59 = +[_DASSystemContext isPluggedIn:self->_context];
  context = self->_context;
  id v8 = +[_DASUserRequestedBackupTaskManager userRequestedBackupKeyPath];
  unsigned __int8 v9 = [(_CDLocalContext *)context objectForKeyedSubscript:v8];
  unsigned int v10 = [v9 BOOLValue];

  unsigned int v11 = [(_DASSleepWakeMonitor *)self->_sleepWakeMonitor inADarkWake];
  [(_DASSleepWakeMonitor *)self->_sleepWakeMonitor wakeState];
  IOPMAllowsBackgroundTask();
  id v12 = +[_DASLowPowerModePolicy policyInstance];
  double v58 = self;
  unsigned int v56 = [v12 isLowPowerModePolicyEnforced:self->_context];

  long long v63 = 0u;
  long long v64 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  id v54 = v4;
  id v13 = v4;
  id v14 = [v13 countByEnumeratingWithState:&v61 objects:v65 count:16];
  if (!v14) {
    goto LABEL_40;
  }
  id v15 = v14;
  uint64_t v16 = *(void *)v62;
  do
  {
    long long v17 = 0;
    do
    {
      if (*(void *)v62 != v16) {
        objc_enumerationMutation(v13);
      }
      uint64_t v18 = *(void **)(*((void *)&v61 + 1) + 8 * (void)v17);
      if (v11)
      {
        unsigned __int8 v19 = [*(id *)(*((void *)&v61 + 1) + 8 * (void)v17) darkWakeEligible];
        unsigned int v20 = v6;
        if (v19) {
          goto LABEL_13;
        }
        unsigned __int8 v21 = [v18 triggersRestart];
        unsigned int v20 = v6;
        if (v21) {
          goto LABEL_13;
        }
      }
      else
      {
        if (v10)
        {
          unsigned __int8 v22 = [*(id *)(*((void *)&v61 + 1) + 8 * (void)v17) userRequestedBackupTask];
          unsigned int v20 = v6;
          if (v22) {
            goto LABEL_13;
          }
        }
        if (([v18 userRequestedBackupTask] & 1) == 0
          && ((v59 & 1) != 0 || ([v18 skipEvaluationIfUnplugged] & 1) == 0)
          && [(_DASDaemon *)v58 activityIsTimewiseEligible:v18 atDate:v60])
        {
          if ([v18 cancelAfterDeadline])
          {
            id v23 = [v18 startBefore];
            [v60 timeIntervalSinceDate:v23];
            double v25 = v24;

            unsigned int v20 = v57;
            if (v25 > 0.0) {
              goto LABEL_13;
            }
          }
          unsigned __int8 v26 = [v18 bypassesPredictions];
          unsigned int v20 = v6;
          if (v26) {
            goto LABEL_13;
          }
          if (!v56) {
            goto LABEL_52;
          }
          id v27 = [v18 schedulingPriority];
          if ((unint64_t)v27 >= _DASSchedulingPriorityUserInitiated
            || +[_DASPhotosPolicy isiCPLActivity:v18])
          {
            goto LABEL_52;
          }
          IOReturn v28 = [v18 startBefore];
          unint64_t v29 = [v18 startAfter];
          [v28 timeIntervalSinceDate:v29];
          double v31 = v30;

          double v32 = [v18 startAfter];
          [v32 timeIntervalSinceNow];
          double v34 = v33;

          id v35 = [v18 schedulingPriority];
          if ((unint64_t)v35 >= _DASSchedulingPriorityUtility)
          {
            double v36 = v31 >= 1.0 ? v31 : 1.0;
            if (-v34 / v36 >= 0.9)
            {
LABEL_52:
              uint64_t v37 = [v18 remoteDevice];
              if (!v37
                || (v38 = (void *)v37, id v39 = [v18 targetDevice], v38, v39 != (id)3)
                || ([v18 remoteDevice],
                    id v40 = objc_claimAutoreleasedReturnValue(),
                    unsigned int v41 = [(_DASRemoteDeviceNearbyMonitor *)v58->_remoteDeviceNearbyMonitor isRemoteDeviceNearby:v40], v40, v41))
              {
                unsigned __int8 v42 = [v18 hasManyConstraints];
                unsigned int v20 = v6;
                if (v42) {
                  goto LABEL_13;
                }
                long long v43 = [v18 startBefore];
                [v43 timeIntervalSinceDate:v60];
                if (v44 <= 1800.0
                  || ([v18 lastScored], (uint64_t v45 = objc_claimAutoreleasedReturnValue()) == 0))
                {

                  unsigned int v20 = v6;
LABEL_13:
                  [v20 addObject:v18];
                  goto LABEL_36;
                }
                IOReturn v46 = (void *)v45;
                double v55 = [v18 lastScored];
                [v60 timeIntervalSinceDate:v55];
                double v48 = v47;

                unsigned int v20 = v6;
                if (v48 >= 300.0) {
                  goto LABEL_13;
                }
              }
            }
          }
        }
      }
LABEL_36:
      long long v17 = (char *)v17 + 1;
    }
    while (v15 != v17);
    id v49 = [v13 countByEnumeratingWithState:&v61 objects:v65 count:16];
    id v15 = v49;
  }
  while (v49);
LABEL_40:

  +[_DASMetricRecorder incrementOccurrencesForKey:byCount:](_DASMetricRecorder, "incrementOccurrencesForKey:byCount:", @"com.apple.das.evaluationCount", [v6 count]);
  [(_DASDaemon *)v58 chooseActivitiesToRunFromCandidateActivities:v6 toBeRunActivities:v50 toLaunchApplications:v52 toLaunchExtension:v51];
  if ([v50 count]) {
    [(_DASDaemon *)v58 runActivitiesAndRemoveUnknown:v50];
  }
  id v5 = v53;
  id v4 = v54;
  if ([v52 count]) {
    [(_DASDaemon *)v58 runApplicationLaunchActivities:v52];
  }
  if ([v51 count]) {
    [(_DASDaemon *)v58 runExtensionLaunchActivities:v51];
  }
  if ([v57 count]) {
    [(_DASDaemon *)v58 cancelActivities:v57];
  }

LABEL_49:
}

- (void)evaluateScoreAndRunAllActivitiesForReason:(id)a3
{
  id v4 = a3;
  id v5 = (void *)os_transaction_create();
  evaluationQueue = self->_evaluationQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000CDB80;
  block[3] = &unk_100175548;
  id v10 = v5;
  unsigned int v11 = self;
  id v12 = v4;
  id v7 = v4;
  id v8 = v5;
  dispatch_sync(evaluationQueue, block);
}

- (BOOL)shouldSuspendLongRunningActivity:(id)a3 withStartDate:(id)a4 whileBlockingOtherTasks:(BOOL)a5 atDate:(id)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  if ([(_DASDaemon *)self isActivitySuspendable:v10 withStartDate:v11]
    && (![(_DASRuntimeLimiter *)self->_runtimeLimiter onlyPreemptiveSuspend] || v7))
  {
    id v14 = [(_DASRuntimeLimiter *)self->_runtimeLimiter shouldLimitActivityAtRuntime:v10 withStartDate:v11 atDate:v12 withContext:self->_context];
    id v15 = v14;
    if (v14) {
      BOOL v13 = [v14 decision] == (id)3;
    }
    else {
      BOOL v13 = 0;
    }
  }
  else
  {
    BOOL v13 = 0;
  }

  return v13;
}

- (BOOL)shouldPreemptActivity:(id)a3 forFastPassActivity:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 startDate];
  if (![(_DASDaemon *)self isActivitySuspendable:v6 withStartDate:v8])
  {
    BOOL v15 = 0;
LABEL_12:

    goto LABEL_13;
  }
  unsigned __int8 v9 = [v7 fastPass];

  if (v9)
  {
    id v8 = [v7 fastPass];
    id v10 = [v8 processingTaskIdentifiers];
    if (v10)
    {
      id v11 = [v7 fastPass];
      id v12 = [v11 processingTaskIdentifiers];
      BOOL v13 = [v6 name];
      if ([v12 containsObject:v13])
      {
        id v14 = [v6 fastPass];
        BOOL v15 = v14 == 0;
      }
      else
      {
        BOOL v15 = 0;
      }
    }
    else
    {
      BOOL v15 = 0;
    }

    goto LABEL_12;
  }
  BOOL v15 = 0;
LABEL_13:

  return v15;
}

- (BOOL)isActivitySuspendable:(id)a3 withStartDate:(id)a4
{
  id v6 = a3;
  id v7 = [v6 suspendRequestDate];
  if (v7
    || (id v10 = [v6 schedulingPriority], !a4)
    || (unint64_t)v10 > _DASSchedulingPriorityDefault)
  {
  }
  else
  {
    id v11 = [v6 name];

    if (v11
      && (!+[_DASPhotosPolicy isiCPLActivity:v6]
       || !+[_DASPhotosPolicy isPhotosSyncOverriddenWithContext:self->_context]))
    {
      uint64_t v12 = [(_DASDaemon *)self testModeParameters];
      if (!v12
        || (BOOL v13 = (void *)v12,
            unsigned __int8 v14 = [(_DASDaemon *)self testModeConstraintsApplyToActivity:v6],
            v13,
            (v14 & 1) == 0))
      {
        BOOL v8 = 1;
        goto LABEL_4;
      }
    }
  }
  BOOL v8 = 0;
LABEL_4:

  return v8;
}

- (id)candidateGroupActivityForPreemption:(id)a3
{
  id v3 = a3;
  id v4 = +[NSDate distantPast];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v23 objects:v29 count:16];
  if (!v6)
  {
    BOOL v8 = 0;
    unsigned __int8 v21 = v5;
LABEL_18:

    goto LABEL_19;
  }
  id v7 = v6;
  BOOL v8 = 0;
  uint64_t v9 = *(void *)v24;
  do
  {
    for (i = 0; i != v7; i = (char *)i + 1)
    {
      if (*(void *)v24 != v9) {
        objc_enumerationMutation(v5);
      }
      id v11 = *(void **)(*((void *)&v23 + 1) + 8 * i);
      id v12 = [v11 schedulingPriority:v23];
      if ((unint64_t)v12 <= _DASSchedulingPriorityDefault)
      {
        if ([v11 suspendable])
        {
          uint64_t v13 = [v11 startDate];
          if (v13)
          {
            unsigned __int8 v14 = (void *)v13;
            BOOL v15 = [v11 suspendRequestDate];

            if (!v15)
            {
              uint64_t v16 = [v11 startDate];
              [v16 timeIntervalSinceDate:v4];
              double v18 = v17;

              if (v18 > 0.0)
              {
                uint64_t v19 = [v11 startDate];

                id v20 = v11;
                BOOL v8 = v20;
                id v4 = (void *)v19;
              }
            }
          }
        }
      }
    }
    id v7 = [v5 countByEnumeratingWithState:&v23 objects:v29 count:16];
  }
  while (v7);

  if (v8)
  {
    unsigned __int8 v21 = +[_DASDaemonLogger logForCategory:@"lifecycle"];
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138543362;
      IOReturn v28 = v8;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Suspending %{public}@ as it may block other high priority activities.", buf, 0xCu);
    }
    goto LABEL_18;
  }
LABEL_19:

  return v8;
}

- (id)tasksNoLongerEligibleFromTasks:(id)a3
{
  id v4 = a3;
  double v52 = +[NSDate date];
  uint64_t v50 = +[NSMutableSet set];
  long long v54 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  id v5 = v4;
  id v6 = [v5 countByEnumeratingWithState:&v54 objects:v67 count:16];
  if (v6)
  {
    id v8 = v6;
    p_vtable = &OBJC_METACLASS____DASPolicyResponseRationale.vtable;
    uint64_t v10 = *(void *)v55;
    *(void *)&long long v7 = 138412290;
    long long v49 = v7;
    id v51 = v5;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v55 != v10) {
          objc_enumerationMutation(v5);
        }
        id v12 = *(void **)(*((void *)&v54 + 1) + 8 * i);
        if (objc_msgSend(v12, "suspendable", v49))
        {
          if ([(_DASDaemon *)self pausedParametersApplyToActivity:v12])
          {
            uint64_t v13 = [p_vtable + 447 defaultCategory];
            if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)long long buf = 138543362;
              double v60 = v12;
              _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Scheduling Paused: Suspending activity: %{public}@", buf, 0xCu);
            }
          }
          unsigned __int8 v14 = [v12 startDate];

          if (v14)
          {
            BOOL v15 = [v12 startDate];
            [v52 timeIntervalSinceDate:v15];
            double v17 = v16 / 60.0;

            if (v17 > 60.0 && v17 < 70.0)
            {
              double v18 = [p_vtable + 447 logForCategory:@"lifecycle"];
              if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
              {
                uint64_t v19 = [v12 suspendRequestDate];
                [(_DASRuntimeLimiter *)self->_runtimeLimiter maximumRuntimeForActivity:v12];
                unsigned __int8 v21 = +[NSNumber numberWithDouble:v20 / 60.0];
                *(_DWORD *)long long buf = 138544130;
                double v60 = v12;
                __int16 v61 = 2048;
                double v62 = v17;
                __int16 v63 = 1024;
                BOOL v64 = v19 != 0;
                __int16 v65 = 2112;
                unint64_t v66 = v21;
                _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "%{public}@ running for %lf mins (suspendRequested=%u), Max runtime: %@ mins", buf, 0x26u);
              }
              id v5 = v51;
            }
            if (v17 > 90.0 && v17 < 100.0)
            {
              long long v23 = [p_vtable + 447 logForCategory:@"lifecycle"];
              if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
              {
                long long v24 = [v12 suspendRequestDate];
                *(_DWORD *)long long buf = 138543874;
                double v60 = v12;
                __int16 v61 = 2048;
                double v62 = v17;
                __int16 v63 = 1024;
                BOOL v64 = v24 != 0;
                _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "%{public}@ running for %lf mins (suspendRequested=%u)", buf, 0x1Cu);
              }
            }
            if (v17 > 120.0 && v17 < 130.0)
            {
              long long v25 = [p_vtable + 447 logForCategory:@"lifecycle"];
              if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
              {
                long long v26 = [v12 suspendRequestDate];
                *(_DWORD *)long long buf = 138543874;
                double v60 = v12;
                __int16 v61 = 2048;
                double v62 = v17;
                __int16 v63 = 1024;
                BOOL v64 = v26 != 0;
                _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "%{public}@ running for %lf mins (suspendRequested=%u)", buf, 0x1Cu);
              }
            }
          }
          id v27 = [v12 suspendRequestDate];

          if (!v27)
          {
            runtimeLimiter = self->_runtimeLimiter;
            unint64_t v29 = [v12 startDate];
            double v30 = [(_DASRuntimeLimiter *)runtimeLimiter shouldLimitActivityAtRuntime:v12 withStartDate:v29 atDate:v52 withContext:self->_context];

            if (v30 && [v30 decision] == (id)3)
            {
              double v31 = self->_runtimeLimiter;
              double v58 = v30;
              double v32 = +[NSArray arrayWithObjects:&v58 count:1];
              LODWORD(v31) = [(_DASRuntimeLimiter *)v31 limitedActivity:v12 withLimitsResponses:v32];

              if (v31)
              {
                uint64_t v33 = [(_DASDaemon *)self testModeParameters];
                if (v33)
                {
                  double v34 = (void *)v33;
                  unsigned __int8 v35 = [(_DASDaemon *)self testModeConstraintsApplyToActivity:v12];

                  if (v35)
                  {
                    double v36 = +[_DASDaemonLogger logForCategory:@"runtimeLimiter"];
                    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
                    {
                      *(_DWORD *)long long buf = 138543362;
                      double v60 = v12;
                      _os_log_debug_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEBUG, "WARNING: Test mode is on so activity %{public}@ is not being suspended for running too long", buf, 0xCu);
                    }

                    goto LABEL_55;
                  }
                }
                uint64_t v45 = +[_DASDaemonLogger logForCategory:@"runtimeLimiter"];
                if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)long long buf = 138543362;
                  double v60 = v12;
                  _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_DEFAULT, "Suspending %{public}@ - running for too long", buf, 0xCu);
                }

                [(_DASDaemon *)self updateSuspendRequestDate:v52 forActivity:v12 withReason:@"Limitations"];
LABEL_54:
                [v50 addObject:v12];
              }
            }
            else
            {
              uint64_t v53 = 0;
              +[_DASConditionScore scoreForActivity:v12 withState:self->_context response:&v53];
              if (v53 == 100 || v53 == 33)
              {
                uint64_t v37 = [(_DASDaemon *)self testModeParameters];
                if (v37)
                {
                  double v38 = (void *)v37;
                  unsigned int v39 = [(_DASDaemon *)self testModeConstraintsApplyToActivity:v12];

                  if (v39)
                  {
                    id v40 = +[NSMutableArray array];
                    unsigned int v41 = +[NSMutableArray array];
                    unsigned __int8 v42 = [v12 policyScores];
                    unsigned int v43 = [(_DASDaemon *)self testModeConstraintsRequireOverridingDecisionWithScores:v42 ignoredPolicies:v40 honoredPolicies:v41];

                    if (v43)
                    {
                      double v44 = +[_DASDaemonLogger defaultCategory];
                      if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
                      {
                        *(_DWORD *)long long buf = v49;
                        double v60 = v12;
                        _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_DEFAULT, "Test Mode: Not suspending: %@", buf, 0xCu);
                      }

                      id v5 = v51;
                      goto LABEL_55;
                    }

                    id v5 = v51;
                  }
                }
                IOReturn v46 = +[_DASDaemonLogger logForCategory:@"lifecycle"];
                if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)long long buf = 138543362;
                  double v60 = v12;
                  _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_DEFAULT, "Suspending %{public}@ - required criterion is not satisfied.", buf, 0xCu);
                }

                double v47 = +[NSDate now];
                [(_DASDaemon *)self updateSuspendRequestDate:v47 forActivity:v12 withReason:0];

                goto LABEL_54;
              }
            }
LABEL_55:

            p_vtable = (void **)(&OBJC_METACLASS____DASPolicyResponseRationale + 24);
            continue;
          }
        }
      }
      id v8 = [v5 countByEnumeratingWithState:&v54 objects:v67 count:16];
    }
    while (v8);
  }

  +[_DASMetricRecorder incrementOccurrencesForKey:byCount:](_DASMetricRecorder, "incrementOccurrencesForKey:byCount:", @"com.apple.das.suspensioncount", [v50 count]);

  return v50;
}

- (id)tasksNoLongerEligible
{
  os_unfair_recursive_lock_lock_with_options();
  id v3 = [(NSMutableSet *)self->_runningTasks allObjects];
  os_unfair_recursive_lock_unlock();
  id v4 = [(_DASDaemon *)self tasksNoLongerEligibleFromTasks:v3];

  return v4;
}

- (void)updateSuspendRequestDate:(id)a3 forActivity:(id)a4 withReason:(id)a5
{
  id v11 = a4;
  id v7 = a5;
  [v11 setSuspendRequestDate:a3];
  id v8 = +[_DASPLLogger sharedInstance];
  [v8 recordActivityLifeCycleSuspend:v11];

  +[_DASMetricRecorder incrementOccurrencesForKey:@"com.apple.das.suspensioncount" byCount:1];
  if ([v7 isEqualToString:@"Limitations"])
  {
    [v11 setLastDenialValue:((unint64_t)[v11 lastDenialValue] | +[_DASPolicyManager bitmaskForPolicy:](_DASPolicyManager, "bitmaskForPolicy:", @"Limitations"))];
    if (+[_DASCheckpointRecorder shouldLogCheckpointForActivity:v11])
    {
      uint64_t v9 = +[_DASCheckpointRecorder sharedInstance];
      [v9 reportTaskCheckpoint:45 forTask:v11 error:0];
    }
  }
  else
  {
    CFStringRef v10 = @"Sysdiagnose";
    if ([v7 isEqualToString:@"Sysdiagnose"]
      || (CFStringRef v10 = @"Preemption", [v7 isEqualToString:@"Preemption"])
      || (CFStringRef v10 = @"Incompatibility", [v7 isEqualToString:@"Incompatibility"]))
    {
      [v11 setLastDenialValue:((unint64_t)[v11 lastDenialValue] | [_DASPolicyManager bitmaskForPolicy:](_DASPolicyManager, "bitmaskForPolicy:", v10))];
    }
  }
}

- (void)reportPostRestoreCheckpoint:(unint64_t)a3 withParameters:(id)a4
{
  id v5 = a4;
  id v6 = +[NSMutableArray array];
  id v7 = +[NSMutableArray array];
  uint64_t v8 = kBGSTKeyTaskName;
  uint64_t v9 = [v5 objectForKeyedSubscript:kBGSTKeyTaskName];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  id v11 = [v5 objectForKeyedSubscript:v8];
  id v12 = v11;
  if (isKindOfClass)
  {
    uint64_t v13 = [v11 firstObject];
  }
  else
  {
    objc_opt_class();
    char v14 = objc_opt_isKindOfClass();

    if (v14)
    {
      uint64_t v13 = [v5 objectForKeyedSubscript:v8];
    }
    else
    {
      uint64_t v13 = 0;
    }
  }
  uint64_t v15 = kBGSTKeyFeatureCode;
  double v16 = [v5 objectForKeyedSubscript:kBGSTKeyFeatureCode];
  objc_opt_class();
  char v17 = objc_opt_isKindOfClass();

  uint64_t v18 = [v5 objectForKeyedSubscript:v15];
  uint64_t v19 = (void *)v18;
  if (v17)
  {
  }
  else
  {
    uint64_t v30 = v18;
    uint64_t v20 = +[NSArray arrayWithObjects:&v30 count:1];

    uint64_t v19 = (void *)v20;
  }
  uint64_t v21 = kBGSTKeyInvolvedProcesses;
  unsigned __int8 v22 = [v5 objectForKeyedSubscript:kBGSTKeyInvolvedProcesses];
  objc_opt_class();
  char v23 = objc_opt_isKindOfClass();

  uint64_t v24 = [v5 objectForKeyedSubscript:v21];
  long long v25 = (void *)v24;
  if ((v23 & 1) == 0)
  {
    uint64_t v29 = v24;
    uint64_t v26 = +[NSArray arrayWithObjects:&v29 count:1];

    id v7 = v25;
    long long v25 = (void *)v26;
  }

  if (a3 == 30)
  {
    id v27 = [v5 objectForKeyedSubscript:kBGSTKeyPaused];
    [v27 BOOLValue];
  }
  IOReturn v28 = +[_DASPostRestoreBUILogger sharedInstance];
  [v28 reportState:a3 forTaskName:v13 featureCode:v19 involvedProcesses:v25];
}

- (void)activityStoppedWithParameters:(id)a3
{
  id v4 = a3;
  id v5 = [v4 objectForKeyedSubscript:kBGSTKeyFeatureCode];

  if (v5) {
    [(_DASDaemon *)self reportPostRestoreCheckpoint:30 withParameters:v4];
  }
  [(_DASBudgetManager *)self->_budgetManager reportActivityNoLongerRunningWithParameters:v4];
  v11[0] = 0;
  v11[1] = v11;
  v11[2] = 0x3032000000;
  v11[3] = sub_1000BE040;
  void v11[4] = sub_1000BE050;
  id v12 = 0;
  v9[0] = 0;
  v9[1] = v9;
  v9[2] = 0x3032000000;
  v9[3] = sub_1000BE040;
  v9[4] = sub_1000BE050;
  id v10 = 0;
  v7[0] = 0;
  v7[1] = v7;
  v7[2] = 0x3032000000;
  v7[3] = sub_1000BE040;
  void v7[4] = sub_1000BE050;
  id v8 = 0;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000CF0A8;
  v6[3] = &unk_100178048;
  void v6[4] = v11;
  void v6[5] = v7;
  v6[6] = v9;
  [v4 enumerateKeysAndObjectsUsingBlock:v6];
  _Block_object_dispose(v7, 8);

  _Block_object_dispose(v9, 8);
  _Block_object_dispose(v11, 8);
}

- (void)reportOversizeLoadSymptomForActivity:(id)a3 atStart:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = (char *)[v6 uploadSize];
  id v8 = [v6 downloadSize];
  if ([v6 noTransferSizeSpecified]) {
    id v8 = (id)_DASActivityTransferSizeSmall;
  }
  if (+[_DASNetworkQualityPolicy shouldReportOversizeLoadForTransferSize:&v7[(void)v8] withContext:self->_context])
  {
    id v9 = [v6 name];
    id v10 = (const char *)[v9 UTF8String];
    symptom_create();
    symptom_set_qualifier();
    symptom_set_qualifier();
    symptom_set_qualifier();
    strlen(v10);
    symptom_set_additional_qualifier();
    int v11 = symptom_send();
    id v12 = +[_DASDaemonLogger logForCategory:@"networkbudgeting"];
    uint64_t v13 = v12;
    if (v11)
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        sub_1000FF500(v6, v13);
      }
    }
    else if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      char v14 = [v6 name];
      uint64_t v15 = +[NSNumber numberWithUnsignedInteger:v7];
      uint64_t v16 = +[NSNumber numberWithUnsignedInteger:v8];
      char v17 = (void *)v16;
      CFStringRef v18 = @"end";
      int v19 = 138413058;
      uint64_t v20 = v14;
      __int16 v21 = 2112;
      if (v4) {
        CFStringRef v18 = @"start";
      }
      unsigned __int8 v22 = v15;
      __int16 v23 = 2112;
      uint64_t v24 = v16;
      __int16 v25 = 2112;
      CFStringRef v26 = v18;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Reported to symptoms %@ with upload %@ and download %@ at %@", (uint8_t *)&v19, 0x2Au);
    }
  }
}

- (void)reportActivityTiming:(id)a3
{
  id v3 = a3;
  id v6 = +[NSDate date];
  id v7 = v3;
  id v4 = v3;
  id v5 = v6;
  AnalyticsSendEventLazy();
}

- (void)reportSystemWorkload:(unint64_t)a3 ofCategory:(unint64_t)a4 withHandler:(id)a5
{
  id v7 = (void (**)(id, id, id))a5;
  id v8 = +[_DASSystemWorkloadRecorder sharedInstance];
  id v11 = 0;
  id v9 = [v8 recordWorkload:a3 ofCategory:a4 error:&v11];
  id v10 = v11;

  v7[2](v7, v9, v10);
}

- (void)reportFeatureCheckpoint:(unint64_t)a3 forFeature:(unint64_t)a4 withHandler:(id)a5
{
  id v7 = (void (**)(id, id, id))a5;
  id v8 = +[_DASCheckpointRecorder sharedInstance];
  id v11 = 0;
  id v9 = [v8 reportFeatureCheckpoint:a3 forFeature:a4 error:&v11];
  id v10 = v11;

  v7[2](v7, v9, v10);
}

- (void)reportCustomCheckpoint:(unint64_t)a3 forTask:(id)a4 withHandler:(id)a5
{
  id v7 = (void (**)(id, id, id))a5;
  id v8 = a4;
  id v9 = +[_DASCheckpointRecorder sharedInstance];
  id v12 = 0;
  id v10 = [v9 reportCustomCheckpoint:a3 forTask:v8 error:&v12];

  id v11 = v12;
  v7[2](v7, v10, v11);
}

- (void)extensionActivity:(id)a3 finishedWithStatus:(unsigned __int8)a4
{
  int v4 = a4;
  id v6 = a3;
  id v7 = +[_DASDaemonLogger logForCategory:@"lifecycle"];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138543618;
    id v11 = v6;
    __int16 v12 = 1024;
    int v13 = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ finished with status %hhu", (uint8_t *)&v10, 0x12u);
  }

  id v8 = [v6 extensionIdentifier];
  id v9 = +[_DASPlugin existingPluginForIdentifier:v8 ofType:@"com.apple.ml-extension"];

  [v9 unload];
  if (v4 == 2)
  {
    [(_DASDaemon *)self activityCanceled:v6];
    [(_DASDaemon *)self submitActivity:v6];
  }
  else
  {
    [(_DASDaemon *)self activityCompleted:v6];
  }
}

- (void)prewarmApplication:(id)a3
{
  id v5 = a3;
  id v3 = +[_APRSPrewarmInterface sharedInstance];
  id v4 = [v3 prewarmLaunchAppFromBundleID:v5];
}

- (void)prewarmSuspendApplication:(id)a3 withHandler:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = +[_APRSPrewarmInterface sharedInstance];
  [v7 invalidatePrewarmAssertionForApplication:v6 onInvalidation:v5];
}

- (void)_unexpectedXPCObject:(id)a3 WithLog:(id)a4
{
  id v4 = a4;
  id v5 = (void *)xpc_dictionary_copy_basic_description();
  id v6 = +[_DASDaemonLogger logForCategory:@"lifecycle"];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    sub_1000FF58C();
  }

  free(v5);
}

- (void)_prewarmSuspendForMessage:(id)a3
{
  id v4 = a3;
  *(void *)&long long v5 = -1;
  *((void *)&v5 + 1) = -1;
  long long v16 = v5;
  long long v17 = v5;
  xpc_dictionary_get_audit_token();
  if (DWORD1(v17) == -1)
  {
    [(_DASDaemon *)self _unexpectedXPCObject:v4 WithLog:@"Prewarm suspend failed to fetch audit token"];
  }
  else
  {
    id v6 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:");
    id v15 = 0;
    id v7 = +[RBSProcessHandle handleForIdentifier:v6 error:&v15];
    id v8 = v15;

    id v9 = +[_DASDaemonLogger logForCategory:@"lifecycle"];
    BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
    if (v7)
    {
      if (v10)
      {
        id v11 = [v7 bundle];
        __int16 v12 = [v11 identifier];
        *(_DWORD *)long long buf = 138412290;
        id v19 = v12;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Suspending prewarm for %@", buf, 0xCu);
      }
      id v9 = +[_APRSPrewarmInterface sharedInstance];
      int v13 = [v7 bundle];
      char v14 = [v13 identifier];
      [v9 invalidatePrewarmAssertionForApplication:v14];
    }
    else if (v10)
    {
      *(_DWORD *)long long buf = 138412290;
      id v19 = v8;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Prewarm suspend failed to fetch handle with error %@", buf, 0xCu);
    }
  }
}

- (void)_prewarmSuspendHandleIncoming:(id)a3 onConnection:(id)a4
{
  id v6 = a3;
  id v7 = (_xpc_connection_s *)a4;
  p_prewarmInvalidationLock = &self->_prewarmInvalidationLock;
  os_unfair_lock_lock(&self->_prewarmInvalidationLock);
  if (xpc_get_type(v6) == (xpc_type_t)&_xpc_type_dictionary)
  {
    [(_DASDaemon *)self _prewarmSuspendForMessage:v6];
    xpc_object_t reply = xpc_dictionary_create_reply(v6);
    BOOL v10 = reply;
    if (v7 && reply)
    {
      xpc_connection_send_message(v7, reply);
    }
    else
    {
      int v13 = +[_DASDaemonLogger logForCategory:@"lifecycle"];
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        sub_1000FF608();
      }
    }
  }
  else if (v6 == &_xpc_error_connection_invalid)
  {
    [(NSMutableSet *)self->_prewarmInvalidationConnections removeObject:v7];
    id v11 = +[_DASDaemonLogger logForCategory:@"lifecycle"];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      unsigned int v12 = [(NSMutableSet *)self->_prewarmInvalidationConnections count];
      v14[0] = 67109120;
      v14[1] = v12;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "setupPrewarmSuspendListener connection invalidated (outstanding connections: %d)", (uint8_t *)v14, 8u);
    }
  }
  else
  {
    [(_DASDaemon *)self _unexpectedXPCObject:v6 WithLog:@"Prewarm suspend connection received unexpected message"];
  }
  os_unfair_lock_unlock(p_prewarmInvalidationLock);
}

- (void)setupPrewarmSuspendListener
{
  self->_prewarmInvalidationLock._os_unfair_lock_opaque = 0;
  p_prewarmInvalidationLock = &self->_prewarmInvalidationLock;
  os_unfair_lock_lock(&self->_prewarmInvalidationLock);
  id v4 = +[NSMutableSet set];
  prewarmInvalidationConnections = self->_prewarmInvalidationConnections;
  self->_prewarmInvalidationConnections = v4;

  id v6 = dispatch_get_global_queue(25, 0);
  mach_service = xpc_connection_create_mach_service("com.apple.dasd.end-prewarm", v6, 1uLL);
  prewarmInvalidationListener = self->_prewarmInvalidationListener;
  self->_prewarmInvalidationListener = mach_service;

  id v9 = self->_prewarmInvalidationListener;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_1000D0558;
  handler[3] = &unk_100178098;
  void handler[4] = self;
  xpc_connection_set_event_handler(v9, handler);
  xpc_connection_activate(self->_prewarmInvalidationListener);
  os_unfair_lock_unlock(p_prewarmInvalidationLock);
  BOOL v10 = +[_DASDaemonLogger logForCategory:@"lifecycle"];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v11 = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "setupPrewarmSuspendListener complete", v11, 2u);
  }
}

- (NSMutableArray)clients
{
  return self->_clients;
}

- (void)setClients:(id)a3
{
}

- (os_unfair_recursive_lock_s)activityStateLock
{
  return self->_activityStateLock;
}

- (void)setActivityStateLock:(os_unfair_recursive_lock_s)a3
{
  self->_activityStateLock = a3;
}

- (NSMutableSet)pendingTasks
{
  return self->_pendingTasks;
}

- (void)setPendingTasks:(id)a3
{
}

- (NSMutableSet)prerunningTasks
{
  return self->_prerunningTasks;
}

- (void)setPrerunningTasks:(id)a3
{
}

- (NSMutableSet)runningTasks
{
  return self->_runningTasks;
}

- (void)setRunningTasks:(id)a3
{
}

- (NSDictionary)triggerToPolicyMap
{
  return self->_triggerToPolicyMap;
}

- (void)setTriggerToPolicyMap:(id)a3
{
}

- (NSMutableDictionary)triggerToActivitiesMap
{
  return self->_triggerToActivitiesMap;
}

- (void)setTriggerToActivitiesMap:(id)a3
{
}

- (NSMutableDictionary)activityToIncompatibleActivitiesMap
{
  return self->_activityToIncompatibleActivitiesMap;
}

- (void)setActivityToIncompatibleActivitiesMap:(id)a3
{
}

- (os_unfair_lock_s)groupLock
{
  return self->_groupLock;
}

- (void)setGroupLock:(os_unfair_lock_s)a3
{
  self->_groupLock = a3;
}

- (NSMutableDictionary)groups
{
  return self->_groups;
}

- (void)setGroups:(id)a3
{
}

- (NSMutableDictionary)groupToPendingTasks
{
  return self->_groupToPendingTasks;
}

- (void)setGroupToPendingTasks:(id)a3
{
}

- (NSMutableDictionary)groupToRunningTasks
{
  return self->_groupToRunningTasks;
}

- (void)setGroupToRunningTasks:(id)a3
{
}

- (NSMutableDictionary)groupToPrerunningTasks
{
  return self->_groupToPrerunningTasks;
}

- (void)setGroupToPrerunningTasks:(id)a3
{
}

- (os_unfair_recursive_lock_s)applicationLaunchRequestsLock
{
  return self->_applicationLaunchRequestsLock;
}

- (void)setApplicationLaunchRequestsLock:(os_unfair_recursive_lock_s)a3
{
  self->_applicationLaunchRequestsLock = a3;
}

- (NSMutableDictionary)applicationLaunchRequests
{
  return self->_applicationLaunchRequests;
}

- (void)setApplicationLaunchRequests:(id)a3
{
}

- (NSMutableDictionary)applicationsLaunched
{
  return self->_applicationsLaunched;
}

- (void)setApplicationsLaunched:(id)a3
{
}

- (NSMutableDictionary)extensionLaunchRequests
{
  return self->_extensionLaunchRequests;
}

- (void)setExtensionLaunchRequests:(id)a3
{
}

- (_DASUserRequestedBackupTaskManager)backupTaskManager
{
  return self->_backupTaskManager;
}

- (void)setBackupTaskManager:(id)a3
{
}

- (NSXPCListener)listener
{
  return self->_listener;
}

- (void)setListener:(id)a3
{
}

- (NSXPCListener)bgstListener
{
  return self->_bgstListener;
}

- (void)setBgstListener:(id)a3
{
}

- (OS_dispatch_queue)timerSchedulingQueue
{
  return self->_timerSchedulingQueue;
}

- (void)setTimerSchedulingQueue:(id)a3
{
}

- (_DASTimer)schedulingTimer
{
  return self->_schedulingTimer;
}

- (void)setSchedulingTimer:(id)a3
{
}

- (NSDate)timerEarliestFireDate
{
  return self->_timerEarliestFireDate;
}

- (void)setTimerEarliestFireDate:(id)a3
{
}

- (NSDate)timerLatestFireDate
{
  return self->_timerLatestFireDate;
}

- (void)setTimerLatestFireDate:(id)a3
{
}

- (_DASNetworkEvaluationMonitor)networkEvaluationMonitor
{
  return self->_networkEvaluationMonitor;
}

- (void)setNetworkEvaluationMonitor:(id)a3
{
}

- (_DASSleepWakeMonitor)sleepWakeMonitor
{
  return self->_sleepWakeMonitor;
}

- (void)setSleepWakeMonitor:(id)a3
{
}

- (_DASRemoteDeviceNearbyMonitor)remoteDeviceNearbyMonitor
{
  return self->_remoteDeviceNearbyMonitor;
}

- (void)setRemoteDeviceNearbyMonitor:(id)a3
{
}

- (_DASRemoteDeviceWakeMonitor)remoteDeviceWakeMonitor
{
  return self->_remoteDeviceWakeMonitor;
}

- (void)setRemoteDeviceWakeMonitor:(id)a3
{
}

- (_DASRemoteDeviceActivityMonitor)remoteDeviceActivityMonitor
{
  return self->_remoteDeviceActivityMonitor;
}

- (void)setRemoteDeviceActivityMonitor:(id)a3
{
}

- (_DASSmartPowerNapMonitor)smartPowerNapMonitor
{
  return self->_smartPowerNapMonitor;
}

- (void)setSmartPowerNapMonitor:(id)a3
{
}

- (_DASCPMModeMonitor)cpmModeMonitor
{
  return self->_cpmModeMonitor;
}

- (void)setCpmModeMonitor:(id)a3
{
}

- (_DASBacklightStateMonitor)backlightStateMonitor
{
  return self->_backlightStateMonitor;
}

- (void)setBacklightStateMonitor:(id)a3
{
}

- (_DASENManager)enManager
{
  return self->_enManager;
}

- (void)setEnManager:(id)a3
{
}

- (_DASDiskSpaceMonitor)diskSpaceMonitor
{
  return self->_diskSpaceMonitor;
}

- (void)setDiskSpaceMonitor:(id)a3
{
}

- (_DASDataStore)store
{
  return self->_store;
}

- (void)setStore:(id)a3
{
}

- (OS_dispatch_source)optimalScoringTimer
{
  return self->_optimalScoringTimer;
}

- (void)setOptimalScoringTimer:(id)a3
{
}

- (OS_dispatch_source)databaseMaintenanceTimer
{
  return self->_databaseMaintenanceTimer;
}

- (void)setDatabaseMaintenanceTimer:(id)a3
{
}

- (OS_dispatch_source)groupMonitoringTimer
{
  return self->_groupMonitoringTimer;
}

- (void)setGroupMonitoringTimer:(id)a3
{
}

- (OS_dispatch_queue)evaluationQueue
{
  return self->_evaluationQueue;
}

- (void)setEvaluationQueue:(id)a3
{
}

- (_DASBatchingQueue)triggerBatchingQueue
{
  return self->_triggerBatchingQueue;
}

- (void)setTriggerBatchingQueue:(id)a3
{
}

- (_DASBatchingQueue)triggerRecorderBatchingQueue
{
  return self->_triggerRecorderBatchingQueue;
}

- (void)setTriggerRecorderBatchingQueue:(id)a3
{
}

- (_DASBatchingQueue)activityCompletedBatchingQueue
{
  return self->_activityCompletedBatchingQueue;
}

- (void)setActivityCompletedBatchingQueue:(id)a3
{
}

- (_DASBatchingQueue)networkActivitiesQueue
{
  return self->_networkActivitiesQueue;
}

- (void)setNetworkActivitiesQueue:(id)a3
{
}

- (_DASFairScheduleManager)fairScheduleManager
{
  return self->_fairScheduleManager;
}

- (void)setFairScheduleManager:(id)a3
{
}

- (_DASActivityRateLimitManager)rateLimiter
{
  return self->_rateLimiter;
}

- (void)setRateLimiter:(id)a3
{
}

- (_DASControlEngine)controlEngine
{
  return self->_controlEngine;
}

- (void)setControlEngine:(id)a3
{
}

- (_DASRuntimeLimiter)runtimeLimiter
{
  return self->_runtimeLimiter;
}

- (void)setRuntimeLimiter:(id)a3
{
}

- (_DASConfigurationLimiter)configurationLimiter
{
  return self->_configurationLimiter;
}

- (void)setConfigurationLimiter:(id)a3
{
}

- (_DASFeatureDurationTracker)featureDurationTracker
{
  return self->_featureDurationTracker;
}

- (void)setFeatureDurationTracker:(id)a3
{
}

- (NSMutableDictionary)recentlyLaunchedApps
{
  return self->_recentlyLaunchedApps;
}

- (void)setRecentlyLaunchedApps:(id)a3
{
}

- (NSCountedSet)launchesPerApp
{
  return self->_launchesPerApp;
}

- (void)setLaunchesPerApp:(id)a3
{
}

- (OS_dispatch_source)launchTimeResetTimer
{
  return self->_launchTimeResetTimer;
}

- (void)setLaunchTimeResetTimer:(id)a3
{
}

- (OS_dispatch_queue)launchQueue
{
  return self->_launchQueue;
}

- (void)setLaunchQueue:(id)a3
{
}

- (OS_dispatch_queue)groupMonitoringQueue
{
  return self->_groupMonitoringQueue;
}

- (void)setGroupMonitoringQueue:(id)a3
{
}

- (_DASBlueListManager)blueListManager
{
  return self->_blueListManager;
}

- (void)setBlueListManager:(id)a3
{
}

- (OS_dispatch_queue)activityLaunchQueue
{
  return self->_activityLaunchQueue;
}

- (void)setActivityLaunchQueue:(id)a3
{
}

- (_DASSwapPredictionManager)swapManager
{
  return self->_swapManager;
}

- (void)setSwapManager:(id)a3
{
}

- (_APRSManager)appResumeManager
{
  return self->_appResumeManager;
}

- (void)setAppResumeManager:(id)a3
{
}

- (_DASClosureManager)closureManager
{
  return self->_closureManager;
}

- (void)setClosureManager:(id)a3
{
}

- (_DASBudgetManager)budgetManager
{
  return self->_budgetManager;
}

- (void)setBudgetManager:(id)a3
{
}

- (_DASActivityDependencyManager)dependencyManager
{
  return self->_dependencyManager;
}

- (void)setDependencyManager:(id)a3
{
}

- (_DASAssertionArbiter)assertionArbiter
{
  return self->_assertionArbiter;
}

- (void)setAssertionArbiter:(id)a3
{
}

- (unint64_t)photosIsBlocked
{
  return self->_photosIsBlocked;
}

- (void)setPhotosIsBlocked:(unint64_t)a3
{
  self->_unint64_t photosIsBlocked = a3;
}

- (os_unfair_lock_s)constraintsLock
{
  return self->_constraintsLock;
}

- (void)setConstraintsLock:(os_unfair_lock_s)a3
{
  self->_constraintsLock = a3;
}

- (_CDContextualKeyPath)utilityConstraintsKP
{
  return self->_utilityConstraintsKP;
}

- (void)setUtilityConstraintsKP:(id)a3
{
}

- (_CDContextualKeyPath)maintenanceConstraintsKP
{
  return self->_maintenanceConstraintsKP;
}

- (void)setMaintenanceConstraintsKP:(id)a3
{
}

- (unint64_t)utilityConstraints
{
  return self->_utilityConstraints;
}

- (void)setUtilityConstraints:(unint64_t)a3
{
  self->_unint64_t utilityConstraints = a3;
}

- (unint64_t)maintenanceConstraints
{
  return self->_maintenanceConstraints;
}

- (void)setMaintenanceConstraints:(unint64_t)a3
{
  self->_unint64_t maintenanceConstraints = a3;
}

- (NSDictionary)testModeParameters
{
  return (NSDictionary *)objc_getProperty(self, a2, 560, 1);
}

- (void)setTestModeParameters:(id)a3
{
}

- (void)setPausedParameters:(id)a3
{
}

- (NSUserDefaults)testingDefaults
{
  return self->_testingDefaults;
}

- (void)setTestingDefaults:(id)a3
{
}

- (os_unfair_lock_s)signpostLock
{
  return self->_signpostLock;
}

- (void)setSignpostLock:(os_unfair_lock_s)a3
{
  self->_signpostLock = a3;
}

- (NSMutableSet)signpostActivitiesRunningDeviceActive
{
  return self->_signpostActivitiesRunningDeviceActive;
}

- (void)setSignpostActivitiesRunningDeviceActive:(id)a3
{
}

- (NSMutableSet)signpostActivitiesRunningScreenOff
{
  return self->_signpostActivitiesRunningScreenOff;
}

- (void)setSignpostActivitiesRunningScreenOff:(id)a3
{
}

- (NSMutableDictionary)activitiesWaitingForBGTaskClients
{
  return self->_activitiesWaitingForBGTaskClients;
}

- (void)setActivitiesWaitingForBGTaskClients:(id)a3
{
}

- (NSMutableDictionary)connectedBGTaskClients
{
  return self->_connectedBGTaskClients;
}

- (void)setConnectedBGTaskClients:(id)a3
{
}

- (_DASActivityProfiler)profiler
{
  return self->_profiler;
}

- (void)setProfiler:(id)a3
{
}

- (_DASBackgroundAppKillDemo)bgAppKillDemoInstance
{
  return self->_bgAppKillDemoInstance;
}

- (void)setBgAppKillDemoInstance:(id)a3
{
}

- (NSMutableDictionary)powerAssertions
{
  return self->_powerAssertions;
}

- (void)setPowerAssertions:(id)a3
{
}

- (_DASTrialManager)trialManager
{
  return self->_trialManager;
}

- (void)setTrialManager:(id)a3
{
}

- (BOOL)recomEngineDisabled
{
  return self->_recomEngineDisabled;
}

- (void)setRecomEngineDisabled:(BOOL)a3
{
  self->_recomEngineDisabled = a3;
}

- (OS_xpc_object)prewarmInvalidationListener
{
  return self->_prewarmInvalidationListener;
}

- (void)setPrewarmInvalidationListener:(id)a3
{
}

- (NSMutableSet)prewarmInvalidationConnections
{
  return self->_prewarmInvalidationConnections;
}

- (void)setPrewarmInvalidationConnections:(id)a3
{
}

- (os_unfair_lock_s)prewarmInvalidationLock
{
  return self->_prewarmInvalidationLock;
}

- (void)setPrewarmInvalidationLock:(os_unfair_lock_s)a3
{
  self->_prewarmInvalidationLock = a3;
}

- (_DASNotificationManager)notificationManager
{
  return self->_notificationManager;
}

- (void)setNotificationManager:(id)a3
{
}

- (BOOL)taskRegistryMode
{
  return self->_taskRegistryMode;
}

- (void)setTaskRegistryMode:(BOOL)a3
{
  self->_BOOL taskRegistryMode = a3;
}

- (NSSet)taskRegistryProcesses
{
  return self->_taskRegistryProcesses;
}

- (void)setTaskRegistryProcesses:(id)a3
{
}

- (_CDLocalContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
}

- (_DASBARScheduler)barScheduler
{
  return self->_barScheduler;
}

- (void)setBarScheduler:(id)a3
{
}

- (_DASDock)applicationDock
{
  return self->_applicationDock;
}

- (void)setApplicationDock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_applicationDock, 0);
  objc_storeStrong((id *)&self->_barScheduler, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_taskRegistryProcesses, 0);
  objc_storeStrong((id *)&self->_notificationManager, 0);
  objc_storeStrong((id *)&self->_prewarmInvalidationConnections, 0);
  objc_storeStrong((id *)&self->_prewarmInvalidationListener, 0);
  objc_storeStrong((id *)&self->_trialManager, 0);
  objc_storeStrong((id *)&self->_powerAssertions, 0);
  objc_storeStrong((id *)&self->_bgAppKillDemoInstance, 0);
  objc_storeStrong((id *)&self->_profiler, 0);
  objc_storeStrong((id *)&self->_connectedBGTaskClients, 0);
  objc_storeStrong((id *)&self->_activitiesWaitingForBGTaskClients, 0);
  objc_storeStrong((id *)&self->_signpostActivitiesRunningScreenOff, 0);
  objc_storeStrong((id *)&self->_signpostActivitiesRunningDeviceActive, 0);
  objc_storeStrong((id *)&self->_testingDefaults, 0);
  objc_storeStrong((id *)&self->_pausedParameters, 0);
  objc_storeStrong((id *)&self->_testModeParameters, 0);
  objc_storeStrong((id *)&self->_maintenanceConstraintsKP, 0);
  objc_storeStrong((id *)&self->_utilityConstraintsKP, 0);
  objc_storeStrong((id *)&self->_assertionArbiter, 0);
  objc_storeStrong((id *)&self->_dependencyManager, 0);
  objc_storeStrong((id *)&self->_budgetManager, 0);
  objc_storeStrong((id *)&self->_closureManager, 0);
  objc_storeStrong((id *)&self->_appResumeManager, 0);
  objc_storeStrong((id *)&self->_swapManager, 0);
  objc_storeStrong((id *)&self->_activityLaunchQueue, 0);
  objc_storeStrong((id *)&self->_blueListManager, 0);
  objc_storeStrong((id *)&self->_groupMonitoringQueue, 0);
  objc_storeStrong((id *)&self->_launchQueue, 0);
  objc_storeStrong((id *)&self->_launchTimeResetTimer, 0);
  objc_storeStrong((id *)&self->_launchesPerApp, 0);
  objc_storeStrong((id *)&self->_recentlyLaunchedApps, 0);
  objc_storeStrong((id *)&self->_featureDurationTracker, 0);
  objc_storeStrong((id *)&self->_configurationLimiter, 0);
  objc_storeStrong((id *)&self->_runtimeLimiter, 0);
  objc_storeStrong((id *)&self->_controlEngine, 0);
  objc_storeStrong((id *)&self->_rateLimiter, 0);
  objc_storeStrong((id *)&self->_fairScheduleManager, 0);
  objc_storeStrong((id *)&self->_networkActivitiesQueue, 0);
  objc_storeStrong((id *)&self->_activityCompletedBatchingQueue, 0);
  objc_storeStrong((id *)&self->_triggerRecorderBatchingQueue, 0);
  objc_storeStrong((id *)&self->_triggerBatchingQueue, 0);
  objc_storeStrong((id *)&self->_evaluationQueue, 0);
  objc_storeStrong((id *)&self->_groupMonitoringTimer, 0);
  objc_storeStrong((id *)&self->_databaseMaintenanceTimer, 0);
  objc_storeStrong((id *)&self->_optimalScoringTimer, 0);
  objc_storeStrong((id *)&self->_store, 0);
  objc_storeStrong((id *)&self->_diskSpaceMonitor, 0);
  objc_storeStrong((id *)&self->_enManager, 0);
  objc_storeStrong((id *)&self->_backlightStateMonitor, 0);
  objc_storeStrong((id *)&self->_cpmModeMonitor, 0);
  objc_storeStrong((id *)&self->_smartPowerNapMonitor, 0);
  objc_storeStrong((id *)&self->_remoteDeviceActivityMonitor, 0);
  objc_storeStrong((id *)&self->_remoteDeviceWakeMonitor, 0);
  objc_storeStrong((id *)&self->_remoteDeviceNearbyMonitor, 0);
  objc_storeStrong((id *)&self->_sleepWakeMonitor, 0);
  objc_storeStrong((id *)&self->_networkEvaluationMonitor, 0);
  objc_storeStrong((id *)&self->_timerLatestFireDate, 0);
  objc_storeStrong((id *)&self->_timerEarliestFireDate, 0);
  objc_storeStrong((id *)&self->_schedulingTimer, 0);
  objc_storeStrong((id *)&self->_timerSchedulingQueue, 0);
  objc_storeStrong((id *)&self->_bgstListener, 0);
  objc_storeStrong((id *)&self->_listener, 0);
  objc_storeStrong((id *)&self->_backupTaskManager, 0);
  objc_storeStrong((id *)&self->_extensionLaunchRequests, 0);
  objc_storeStrong((id *)&self->_applicationsLaunched, 0);
  objc_storeStrong((id *)&self->_applicationLaunchRequests, 0);
  objc_storeStrong((id *)&self->_groupToPrerunningTasks, 0);
  objc_storeStrong((id *)&self->_groupToRunningTasks, 0);
  objc_storeStrong((id *)&self->_groupToPendingTasks, 0);
  objc_storeStrong((id *)&self->_groups, 0);
  objc_storeStrong((id *)&self->_activityToIncompatibleActivitiesMap, 0);
  objc_storeStrong((id *)&self->_triggerToActivitiesMap, 0);
  objc_storeStrong((id *)&self->_triggerToPolicyMap, 0);
  objc_storeStrong((id *)&self->_runningTasks, 0);
  objc_storeStrong((id *)&self->_prerunningTasks, 0);
  objc_storeStrong((id *)&self->_pendingTasks, 0);

  objc_storeStrong((id *)&self->_clients, 0);
}

@end
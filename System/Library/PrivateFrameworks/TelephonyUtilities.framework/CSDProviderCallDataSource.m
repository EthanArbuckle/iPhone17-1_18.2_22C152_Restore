@interface CSDProviderCallDataSource
+ (BOOL)_isSystemProviderForIdentifier:(id)a3;
+ (Class)callClass;
- (BOOL)_actionRequiresReasonableUserIntent:(id)a3;
- (BOOL)_activeStandardCallExists;
- (BOOL)_allowRevertingStateForCompletedTransactionGroup:(id)a3;
- (BOOL)_channelSourceAssertionsContainsPTTTransmissionIntent:(id)a3;
- (BOOL)_isChannelSourceAppForeground:(id)a3;
- (BOOL)_isChannelSourceAppRunningPTTTransmissionAppIntent:(id)a3;
- (BOOL)_meetsRequirementsToBeginTransmitting:(id)a3;
- (BOOL)_shouldAllowAction:(id)a3 forChannelSource:(id)a4 shouldValidateUserIntent:(BOOL)a5 error:(id *)a6;
- (BOOL)_shouldAllowRequestedAction:(id)a3 forCallSource:(id)a4 shouldValidateUserIntent:(BOOL)a5 error:(id *)a6;
- (BOOL)_shouldAllowRequestedTransaction:(id)a3 forCallSource:(id)a4 error:(id *)a5;
- (BOOL)_shouldAllowTransaction:(id)a3 forChannelSource:(id)a4 shouldValidateUserIntent:(BOOL)a5 error:(id *)a6;
- (BOOL)_shouldBlockIfScreenSharing;
- (BOOL)callSource:(id)a3 shouldProcessAction:(id)a4 error:(id *)a5;
- (BOOL)channelSource:(id)a3 shouldProcessAction:(id)a4 error:(id *)a5;
- (BOOL)deferCommittingTransactions;
- (BOOL)isScreenTimeDisabledByOtherFeatures;
- (BOOL)sharingModeEnabled;
- (BOOL)shouldRestrictAddresses:(id)a3 forBundleIdentifier:(id)a4 performSynchronously:(BOOL)a5;
- (BOOL)transactionContainsChannelActions:(id)a3;
- (CSDAssistantServicesObserver)assistantServicesObserver;
- (CSDBluetoothHangupCommandObserver)btHangupObserver;
- (CSDCallFilterController)callFilterController;
- (CSDCallProviderManager)callProviderManager;
- (CSDCallSourceFetcher)callSourceFetcher;
- (CSDChannelProviderManager)channelProviderManager;
- (CSDClarityUICallFilter)clarityUICallFilter;
- (CSDCoreTelephonyClient)coreTelephonyClient;
- (CSDFaceTimeProviderDelegate)faceTimeProviderDelegate;
- (CSDProcessObserverProtocol)processObserver;
- (CSDProtectedAppsUtilitiesProtocol)protectedAppsUtilities;
- (CSDProviderCallDataSource)initWithCallStateController:(id)a3 queue:(id)a4 assistantServicesObserver:(id)a5 coreTelephonyClient:(id)a6 chManager:(id)a7 callSourceManager:(id)a8 protectedAppsUtilities:(id)a9;
- (CSDRelayCallDataSource)relayCallDataSource;
- (CSDRouteManager)routeManager;
- (CSDScreenTimeCallFilter)screenTimeCallFilter;
- (CSDVoIPProcessAssertionManager)processAssertionManager;
- (CXCallControllerHost)callControllerHost;
- (CXCallSource)telephonyCallSource;
- (CXCallSourceManager)callSourceManager;
- (CXChannelSourceManager)channelSourceManager;
- (CXInProcessCallSource)faceTimeCallSource;
- (CXInProcessCallSource)superboxCallSource;
- (CXInProcessCallSource)tinCanCallSource;
- (CXProviderDelegatePrivate)tinCanProviderDelegate;
- (NSMutableDictionary)pendingCallsToChatUUIDs;
- (NSMutableDictionary)pendingPulledCallContexts;
- (OS_dispatch_queue)processObserverQueue;
- (_TtC13callservicesd27CSDSuperboxProviderDelegate)superboxProviderDelegate;
- (double)dispatchDelay;
- (id)_ISOCountryCodeForCall:(id)a3;
- (id)_ISOCountryCodeForCallWithUUID:(id)a3 provider:(id)a4 callUpdate:(id)a5;
- (id)_callGroupsWithBackingCallSource:(id)a3;
- (id)_callWithUUID:(id)a3;
- (id)_callWithUUID:(id)a3 backingCallSource:(id)a4;
- (id)_callWithUUID:(id)a3 controllableByCallSource:(id)a4;
- (id)_callWithUUID:(id)a3 providerIdentifier:(id)a4;
- (id)_endMutuallyExclusiveCalls:(id)a3;
- (id)_identifiersForCalls:(id)a3;
- (id)_localProviderForCallSource:(id)a3;
- (id)_providerForCallSource:(id)a3;
- (id)_relayCallWithUUID:(id)a3;
- (id)blockedByExtension;
- (id)callDirectoryAllowsCallFromSourceAddress;
- (id)callGroupUUIDToCalls;
- (id)callSourceForDialRequest:(id)a3;
- (id)callSourceWithIdentifier:(id)a3;
- (id)channelProviderForIdentifier:(id)a3;
- (id)conduit;
- (id)dndAllowsCall;
- (id)lowPowerModeEnabledBlock;
- (id)policyForAddresses:(id)a3 forBundleIdentifier:(id)a4;
- (id)providerWithIdentifier:(id)a3;
- (id)shouldFilterCall;
- (id)shouldPreferRelayOverDirectSecondaryCalling;
- (id)supportsPrimaryCalling;
- (void)_addSupplementalActionsForRequestedTransaction:(id)a3 onCallSource:(id)a4;
- (void)_commitUncommittedTransactions;
- (void)_deferCommittingTransactionsUntilAfterRunningBlock:(id)a3;
- (void)_endCall:(id)a3;
- (void)_performRequestedTransaction:(id)a3 onCallSource:(id)a4;
- (void)_performTransaction:(id)a3 onChannelSource:(id)a4;
- (void)_processCompletedCallAction:(id)a3 forCall:(id)a4 allowRevertingState:(BOOL)a5 isOnenessActive:(BOOL)a6;
- (void)_processCompletedChannelAction:(id)a3 forCall:(id)a4;
- (void)_processPushToTalkAppStateChangedForCall:(id)a3 withPID:(int)a4 processState:(int64_t)a5;
- (void)_processRequestedTransaction:(id)a3 fromCallSource:(id)a4 completion:(id)a5;
- (void)_processRequestedTransaction:(id)a3 fromProviderSource:(id)a4 completionHandler:(id)a5;
- (void)_startMonitoringAppForCall:(id)a3;
- (void)_stopMonitoringPushToTalkAppProcess;
- (void)acquireIndefiniteProcessAssertionForCall:(id)a3;
- (void)acquireTemporaryProcessAssertionForCall:(id)a3;
- (void)answerCall:(id)a3 withRequest:(id)a4 whileDisconnectingCalls:(id)a5 andHoldingCalls:(id)a6;
- (void)callControllerHost:(id)a3 clientWithIdentifier:(id)a4 requestedTransaction:(id)a5 completion:(id)a6;
- (void)callSource:(id)a3 registeredWithConfiguration:(id)a4;
- (void)callSource:(id)a3 reportedAudioFinishedForCallWithUUID:(id)a4;
- (void)callSource:(id)a3 reportedCallWithUUID:(id)a4 changedFrequencyData:(id)a5 forDirection:(int64_t)a6;
- (void)callSource:(id)a3 reportedCallWithUUID:(id)a4 changedMeterLevel:(float)a5 forDirection:(int64_t)a6;
- (void)callSource:(id)a3 reportedCallWithUUID:(id)a4 crossDeviceIdentifier:(id)a5 changedBytesOfDataUsed:(int64_t)a6;
- (void)callSource:(id)a3 reportedCallWithUUID:(id)a4 endedAtDate:(id)a5 privateReason:(int64_t)a6 failureContext:(id)a7;
- (void)callSource:(id)a3 reportedCallWithUUID:(id)a4 receivedDTMFUpdate:(id)a5;
- (void)callSource:(id)a3 reportedCallWithUUID:(id)a4 updated:(id)a5;
- (void)callSource:(id)a3 reportedNewIncomingCallWithUUID:(id)a4 update:(id)a5 completion:(id)a6;
- (void)callSource:(id)a3 reportedNewOutgoingCallWithUUID:(id)a4 update:(id)a5;
- (void)callSource:(id)a3 reportedOutgoingCallWithUUID:(id)a4 connectedAtDate:(id)a5;
- (void)callSource:(id)a3 reportedOutgoingCallWithUUID:(id)a4 sentInvitationAtDate:(id)a5;
- (void)callSource:(id)a3 reportedOutgoingCallWithUUID:(id)a4 startedConnectingAtDate:(id)a5;
- (void)callSource:(id)a3 requestedTransaction:(id)a4 completion:(id)a5;
- (void)callSourceManager:(id)a3 completedTransactionGroup:(id)a4;
- (void)callSourcesChangedForCallSourceManager:(id)a3;
- (void)channelSourceManager:(id)a3 completedTransactionGroup:(id)a4;
- (void)channelSourcesChangedForChannelSourceManager:(id)a3;
- (void)didObserveBluetoothHangupCommand;
- (void)disconnectCalls:(id)a3 whileHoldingCalls:(id)a4 andUnholdingCalls:(id)a5 andUngroupingCalls:(id)a6;
- (void)groupCalls:(id)a3 withCalls:(id)a4;
- (void)holdCalls:(id)a3 whileUnholdingCalls:(id)a4;
- (void)holdOrEndOtherCallsBecauseCallWillBeginOutgoing:(id)a3;
- (void)invalidateIndefiniteProcessAssertionForCall:(id)a3;
- (void)invalidateProcessAssertionForBundleIdentifier:(id)a3;
- (void)performCallAction:(id)a3 forCall:(id)a4;
- (void)performCallActions:(id)a3 forCall:(id)a4;
- (void)performChannelAction:(id)a3 forCall:(id)a4;
- (void)performStartCallAction:(id)a3 forCall:(id)a4;
- (void)presentAccessoryButtonEventsEnabledNotice;
- (void)presentIncomingTransmissionNotice;
- (void)providerSource:(id)a3 registeredWithConfiguration:(id)a4;
- (void)providerSource:(id)a3 reportedChannelWithUUID:(id)a4 connectedAtDate:(id)a5;
- (void)providerSource:(id)a3 reportedChannelWithUUID:(id)a4 disconnectedAtDate:(id)a5 disconnectedReason:(int64_t)a6;
- (void)providerSource:(id)a3 reportedChannelWithUUID:(id)a4 startedConnectingAtDate:(id)a5;
- (void)providerSource:(id)a3 reportedChannelWithUUID:(id)a4 updated:(id)a5;
- (void)providerSource:(id)a3 reportedIncomingTransmissionEndedForChannelWithUUID:(id)a4 reason:(int64_t)a5 completionHandler:(id)a6;
- (void)providerSource:(id)a3 reportedIncomingTransmissionStartedForChannelWithUUID:(id)a4 update:(id)a5 shouldReplaceOutgoingTransmission:(BOOL)a6 completionHandler:(id)a7;
- (void)providerSource:(id)a3 requestedTransaction:(id)a4 completionHandler:(id)a5;
- (void)providersChangedForProviderManager:(id)a3;
- (void)pullCallWithHandoffActivityUserInfo:(id)a3 completion:(id)a4;
- (void)registerCall:(id)a3;
- (void)restorePersistedBargeCallsIfNecessary;
- (void)screenTimeCallFilter:(id)a3 didChangeAllowed:(BOOL)a4 forCallUUID:(id)a5;
- (void)sendMMIOrUSSDCodeWithRequest:(id)a3;
- (void)setBlockedByExtension:(id)a3;
- (void)setCallDirectoryAllowsCallFromSourceAddress:(id)a3;
- (void)setCallFilterController:(id)a3;
- (void)setCallProviderManager:(id)a3;
- (void)setChannelProviderManager:(id)a3;
- (void)setClarityUICallFilter:(id)a3;
- (void)setDeferCommittingTransactions:(BOOL)a3;
- (void)setDispatchDelay:(double)a3;
- (void)setDndAllowsCall:(id)a3;
- (void)setLowPowerModeEnabledBlock:(id)a3;
- (void)setProtectedAppsUtilities:(id)a3;
- (void)setRelayCallDataSource:(id)a3;
- (void)setRouteManager:(id)a3;
- (void)setScreenTimeCallFilter:(id)a3;
- (void)setSharingModeEnabled:(BOOL)a3;
- (void)setShouldFilterCall:(id)a3;
- (void)setShouldPreferRelayOverDirectSecondaryCalling:(id)a3;
- (void)setSupportsPrimaryCalling:(id)a3;
- (void)setTTYType:(int)a3 forCalls:(id)a4;
- (void)setUplinkMuted:(BOOL)a3 forCalls:(id)a4;
- (void)startObservingBluetoothHangupCommands;
- (void)startTrackingCall:(id)a3;
- (void)stopObservingBluetoothHangupCommands;
- (void)stopTrackingCall:(id)a3;
- (void)ungroupCall:(id)a3 fromOtherCallsInGroup:(id)a4;
- (void)updateFilteredOutReasonForCall:(id)a3 WithError:(id)a4;
@end

@implementation CSDProviderCallDataSource

- (id)_callWithUUID:(id)a3 providerIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  v8 = [(CSDCallDataSource *)self calls];
  id v9 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v9)
  {
    id v10 = v9;
    id v11 = 0;
    uint64_t v12 = *(void *)v20;
    do
    {
      v13 = 0;
      v14 = v11;
      do
      {
        if (*(void *)v20 != v12) {
          objc_enumerationMutation(v8);
        }
        id v11 = *(id *)(*((void *)&v19 + 1) + 8 * (void)v13);

        v15 = [v11 uniqueProxyIdentifierUUID];
        if ([v15 isEqual:v6])
        {
          v16 = [v11 providerIdentifier];
          unsigned __int8 v17 = [v16 isEqualToString:v7];

          if (v17) {
            goto LABEL_14;
          }
        }
        else
        {
        }
        v13 = (char *)v13 + 1;
        v14 = v11;
      }
      while (v10 != v13);
      id v10 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v10);
  }
  id v11 = 0;
LABEL_14:

  return v11;
}

- (BOOL)_activeStandardCallExists
{
  v2 = [(CSDCallDataSource *)self calls];
  unsigned __int8 v3 = objc_msgSend(v2, "tu_containsObjectPassingTest:", &stru_100506AF0);

  return v3;
}

- (void)_performTransaction:(id)a3 onChannelSource:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(CSDCallDataSource *)self callStateController];
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  v25 = v6;
  id v9 = [v6 actions];
  id v10 = [v9 countByEnumeratingWithState:&v30 objects:v37 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v31;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v31 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void *)(*((void *)&v30 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v15 = sub_100008DCC();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v36 = v14;
            _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Creating new call due to requested action: %@", buf, 0xCu);
          }

          v16 = +[CSDProviderBargeCall callForChannelSource:v7 joinAction:v14];
          [v8 setCallDelegatesIfNeeded:v16];
          [v8 propertiesChangedForCall:v16];
        }
      }
      id v11 = [v9 countByEnumeratingWithState:&v30 objects:v37 count:16];
    }
    while (v11);
  }

  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  unsigned __int8 v17 = [v25 actions];
  id v18 = [v17 countByEnumeratingWithState:&v26 objects:v34 count:16];
  if (v18)
  {
    id v19 = v18;
    uint64_t v20 = *(void *)v27;
    do
    {
      for (j = 0; j != v19; j = (char *)j + 1)
      {
        if (*(void *)v27 != v20) {
          objc_enumerationMutation(v17);
        }
        uint64_t v22 = *(void *)(*((void *)&v26 + 1) + 8 * (void)j);
        v23 = [(CSDProviderCallDataSource *)self channelSourceManager];
        [v23 addAction:v22 toUncommittedTransactionForChannelSource:v7];
      }
      id v19 = [v17 countByEnumeratingWithState:&v26 objects:v34 count:16];
    }
    while (v19);
  }

  v24 = [(CSDProviderCallDataSource *)self channelSourceManager];
  [v24 commitUncommittedTransactions];
}

- (void)_processCompletedChannelAction:(id)a3 forCall:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v14 = sub_100008DCC();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_1003A9EC0((uint64_t)v6, (uint64_t)v7, v14);
    }
    id v8 = 0;
    goto LABEL_56;
  }
  id v8 = v7;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v9 = [v6 state];
    id v10 = sub_100008DCC();
    id v11 = v10;
    if (v9 == (id)1)
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        int v36 = 138412290;
        v37 = v6;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Fulfilled channel connect action %@", (uint8_t *)&v36, 0xCu);
      }

      uint64_t v12 = +[CSDPersistedChannelRegistry sharedInstance];
      [v12 notePushToTalkChannelConnectedForCall:v8];

      [v8 setTransmissionState:1];
      v13 = +[NSDate date];
      [v8 setDateConnected:v13];

      [v8 setHeld:1];
      [(CSDProviderCallDataSource *)self startObservingBluetoothHangupCommands];
      [(CSDProviderCallDataSource *)self _startMonitoringAppForCall:v8];
      [v8 playSoundForSoundType:18 completion:0];
    }
    else
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        sub_1003A9CB8();
      }

      [v8 setTransmissionState:0];
      long long v21 = +[NSDate date];
      [v8 setDateEnded:v21];
    }
    goto LABEL_54;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v15 = v6;
    id v16 = [v15 state];
    unsigned __int8 v17 = sub_100008DCC();
    id v18 = v17;
    if (v16 == (id)1)
    {
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        int v36 = 138412290;
        v37 = v15;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Fulfilled channel leave action %@", (uint8_t *)&v36, 0xCu);
      }

      [(CSDProviderCallDataSource *)self stopObservingBluetoothHangupCommands];
      [(CSDProviderCallDataSource *)self _stopMonitoringPushToTalkAppProcess];
      [v8 setTransmissionState:0];
      id v19 = [v15 leaveDate];
      [v8 setDateEnded:v19];

      uint64_t v20 = +[CSDPersistedChannelRegistry sharedInstance];
      [v20 tearDownPersistedChannelForCall:v8 teardownType:1];

      [v8 playSoundForSoundType:19 completion:0];
    }
    else
    {
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        sub_1003A9D20();
      }

      [v8 setTransmissionState:0];
      long long v26 = +[NSDate date];
      [v8 setDateEnded:v26];

      [v8 setEndedReason:1];
      long long v27 = +[CSDPersistedChannelRegistry sharedInstance];
      [v27 tearDownPersistedChannelForCall:v8 teardownType:3];
    }
LABEL_27:

    goto LABEL_54;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v22 = [v6 state];
    v23 = sub_100008DCC();
    v24 = v23;
    if (v22 == (id)1)
    {
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        int v36 = 138412290;
        v37 = v6;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Fufilled channel transmit start action %@", (uint8_t *)&v36, 0xCu);
      }

      if ([v8 transmissionState] == (id)2) {
        unint64_t v25 = (unint64_t)[v8 transmissionState] | 0xC;
      }
      else {
        unint64_t v25 = 12;
      }
      [v8 setTransmissionState:v25];
      [v8 setUnderlyingUplinkMuted:1];
      [v8 setHeld:0];
    }
    else
    {
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
        sub_1003A9D88();
      }

      if (([v8 transmissionState] & 2) != 0)
      {
        [v8 setTransmissionState:2];
      }
      else
      {
        [v8 setTransmissionState:1];
        [v8 setHeld:1];
      }
      [(CSDProviderCallDataSource *)self invalidateIndefiniteProcessAssertionForCall:v8];
      [v8 playSoundForSoundType:22 completion:0];
    }
    [v8 setDeferredTransmitStartAction:0];
  }
  else
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    id v29 = [v6 state];
    long long v30 = sub_100008DCC();
    v15 = v30;
    if ((isKindOfClass & 1) == 0)
    {
      if (v29 == (id)1)
      {
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
        {
          int v36 = 138412290;
          v37 = v6;
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Fulfilled action %@", (uint8_t *)&v36, 0xCu);
        }
      }
      else if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        sub_1003A9E58();
      }
      goto LABEL_27;
    }
    if (v29 == (id)1)
    {
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        int v36 = 138412290;
        v37 = v6;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Fufilled channel transmit stop action %@", (uint8_t *)&v36, 0xCu);
      }

      unsigned __int8 v31 = [v8 transmissionState];
      BOOL v32 = (v31 & 2) == 0;
      if ((v31 & 2) != 0) {
        uint64_t v33 = 10;
      }
      else {
        uint64_t v33 = 9;
      }
      [v8 setTransmissionState:v33];
      objc_msgSend(v8, "playSoundForTransmissionState:completion:", objc_msgSend(v8, "transmissionState"), 0);
      objc_msgSend(v8, "setTransmissionState:", (unint64_t)objc_msgSend(v8, "transmissionState") & 0xFFFFFFFFFFFFFFF7);
      [v8 setHeld:v32];
    }
    else
    {
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
        sub_1003A9DF0();
      }

      [v8 disconnectWithReason:14];
    }
    [(CSDProviderCallDataSource *)self invalidateIndefiniteProcessAssertionForCall:v8];
  }
LABEL_54:
  if ([v6 state] == (id)2)
  {
    uint64_t v14 = +[CSDReportingController sharedInstance];
    [v14 reportProviderFailedWithAction:v6 forCall:v8];
LABEL_56:
  }
}

- (void)_processRequestedTransaction:(id)a3 fromProviderSource:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, id))a5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v11 = v9;
    id v16 = 0;
    unsigned int v12 = [(CSDProviderCallDataSource *)self _shouldAllowTransaction:v8 forChannelSource:v11 shouldValidateUserIntent:1 error:&v16];
    id v13 = v16;
    uint64_t v14 = sub_100008DCC();
    BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
    if (v12)
    {
      if (v15)
      {
        *(_DWORD *)buf = 138412290;
        id v18 = v8;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Allowing transaction %@", buf, 0xCu);
      }

      [(CSDProviderCallDataSource *)self _performTransaction:v8 onChannelSource:v11];
    }
    else
    {
      if (v15)
      {
        *(_DWORD *)buf = 138412290;
        id v18 = v8;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "[WARN] Denying transaction %@", buf, 0xCu);
      }
    }
  }
  else
  {
    id v13 = 0;
  }
  v10[2](v10, v13);
}

- (BOOL)_shouldAllowAction:(id)a3 forChannelSource:(id)a4 shouldValidateUserIntent:(BOOL)a5 error:(id *)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v12 = v10;
    id v13 = [v12 channelUUID];
    uint64_t v14 = [v11 identifier];
    BOOL v15 = [(CSDProviderCallDataSource *)self _callWithUUID:v13 providerIdentifier:v14];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v16 = +[CSDPersistedChannelRegistry sharedInstance];
      unsigned __int8 v17 = [v16 activePersistedChannelIdentity];

      unsigned __int8 v18 = [(CSDProviderCallDataSource *)self _isChannelSourceAppForeground:v11];
      if (v17)
      {
        v49 = a6;
        id v19 = v15;
        uint64_t v20 = v13;
        long long v21 = [v17 bundleIdentifier];
        id v22 = [v11 bundleIdentifier];
        unsigned int v23 = [v21 isEqualToString:v22];

        v24 = sub_100008DCC();
        BOOL v25 = os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT);
        id v13 = v20;
        if (v23)
        {
          if (v25)
          {
            *(_DWORD *)buf = 138412290;
            id v53 = v20;
            _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Allowing join action to proceed for UUID %@. App has a persisted channel on file.", buf, 0xCu);
          }

          long long v26 = 0;
          BOOL v15 = v19;
        }
        else
        {
          if (v25)
          {
            *(_DWORD *)buf = 138412290;
            id v53 = v20;
            _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "[WARN] Denying join action for UUID %@. There is some other app with the channel.", buf, 0xCu);
          }

          BOOL v15 = v19;
          if (v18) {
            uint64_t v33 = 3;
          }
          else {
            uint64_t v33 = 11;
          }
          long long v26 = +[NSError cx_channelErrorWithCode:v33];
        }
        a6 = v49;
      }
      else
      {
        unsigned __int8 v31 = sub_100008DCC();
        BOOL v32 = os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT);
        if (v18)
        {
          if (v32)
          {
            *(_DWORD *)buf = 138412290;
            id v53 = v13;
            _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "Allowing join action to proceed for UUID %@. No persisted channel on file and app is FG", buf, 0xCu);
          }

          long long v26 = 0;
        }
        else
        {
          if (v32)
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "Denying channel join because app not foreground.", buf, 2u);
          }

          long long v26 = +[NSError cx_channelErrorWithCode:11];
        }
      }
      v35 = [v15 dateConnected];

      if (v35)
      {
        int v36 = sub_100008DCC();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v53 = v13;
          _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "[WARN] Denying join action; found existing joined channel with UUID %@",
            buf,
            0xCu);
        }

        uint64_t v37 = +[NSError cx_channelErrorWithCode:3];

        long long v26 = (void *)v37;
      }

      goto LABEL_46;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if (!v15
        || ([v15 dateConnected],
            long long v28 = objc_claimAutoreleasedReturnValue(),
            v28,
            !v28))
      {
        id v29 = sub_100008DCC();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v53 = v13;
          _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "[WARN] Denying leave action; could not find a joined channel with UUID %@",
            buf,
            0xCu);
        }

        long long v26 = +[NSError cx_channelErrorWithCode:4];
        goto LABEL_46;
      }
LABEL_34:
      long long v26 = 0;
      goto LABEL_46;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if (v15
        && ([v15 dateConnected], long long v30 = objc_claimAutoreleasedReturnValue(),
                                                v30,
                                                v30))
      {
        long long v26 = 0;
      }
      else
      {
        v39 = sub_100008DCC();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v53 = v13;
          _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "[WARN] Denying transmit start action; could not find a joined channel with UUID %@",
            buf,
            0xCu);
        }

        long long v26 = +[NSError cx_channelErrorWithCode:4];
      }
      if ([v15 transmissionMode] == (id)2)
      {
        v50 = v13;
        v40 = sub_100008DCC();
        if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, "[WARN] Denying transmit start action; channel is is in listen only mode.",
            buf,
            2u);
        }

        uint64_t v41 = +[NSError cx_channelErrorWithCode:12];

        long long v26 = (void *)v41;
        id v13 = v50;
      }
      if ([v15 isReceivingTransmission] && objc_msgSend(v15, "transmissionMode"))
      {
        v51 = v13;
        v42 = sub_100008DCC();
        if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEFAULT, "[WARN] Denying transmit start action; channel is already receiving transmission and mode is not full-duplex.",
            buf,
            2u);
        }

        uint64_t v43 = +[NSError cx_channelErrorWithCode:6];

        long long v26 = (void *)v43;
        id v13 = v51;
      }
      if (v7
        && ![(CSDProviderCallDataSource *)self _meetsRequirementsToBeginTransmitting:v11])
      {
        v44 = sub_100008DCC();
        if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v53 = v13;
          _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_DEFAULT, "[WARN] Denying transmit start action; app not foreground %@",
            buf,
            0xCu);
        }

        uint64_t v45 = 11;
LABEL_74:
        uint64_t v48 = +[NSError cx_channelErrorWithCode:v45];

        long long v26 = (void *)v48;
      }
LABEL_46:

      if (!a6) {
        goto LABEL_49;
      }
      goto LABEL_47;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_34;
    }
    if (v15
      && ([v15 dateConnected], v34 = objc_claimAutoreleasedReturnValue(), v34, v34))
    {
      long long v26 = 0;
    }
    else
    {
      v46 = sub_100008DCC();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v53 = v13;
        _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_DEFAULT, "[WARN] Denying transmit start action; could not find a joined channel with UUID %@",
          buf,
          0xCu);
      }

      long long v26 = +[NSError cx_channelErrorWithCode:4];
      if (!v15) {
        goto LABEL_46;
      }
    }
    if ([v15 isSendingTransmission]) {
      goto LABEL_46;
    }
    v47 = sub_100008DCC();
    if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v53 = v13;
      _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_DEFAULT, "[WARN] Denying transmit stop action; channel was not in a transmitting state %@",
        buf,
        0xCu);
    }

    uint64_t v45 = 7;
    goto LABEL_74;
  }
  long long v27 = sub_100008DCC();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v53 = v10;
    _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "[WARN] Denying invalid action %@", buf, 0xCu);
  }

  long long v26 = +[NSError cx_requestTransactionErrorWithCode:6];
  if (a6)
  {
LABEL_47:
    if (v26) {
      *a6 = v26;
    }
  }
LABEL_49:

  return v26 == 0;
}

- (BOOL)_shouldAllowTransaction:(id)a3 forChannelSource:(id)a4 shouldValidateUserIntent:(BOOL)a5 error:(id *)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a4;
  id v12 = [v10 actions];
  id v13 = [v12 count];

  if (v13)
  {
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    uint64_t v14 = [v10 actions];
    id v15 = [v14 countByEnumeratingWithState:&v25 objects:v31 count:16];
    if (v15)
    {
      id v16 = v15;
      uint64_t v17 = *(void *)v26;
      while (2)
      {
        unsigned __int8 v18 = 0;
        do
        {
          if (*(void *)v26 != v17) {
            objc_enumerationMutation(v14);
          }
          uint64_t v19 = *(void *)(*((void *)&v25 + 1) + 8 * (void)v18);
          id v24 = 0;
          [(CSDProviderCallDataSource *)self _shouldAllowAction:v19 forChannelSource:v11 shouldValidateUserIntent:v7 error:&v24];
          id v20 = v24;
          if (v20)
          {
            long long v21 = v20;
            goto LABEL_12;
          }
          unsigned __int8 v18 = (char *)v18 + 1;
        }
        while (v16 != v18);
        id v16 = [v14 countByEnumeratingWithState:&v25 objects:v31 count:16];
        if (v16) {
          continue;
        }
        break;
      }
    }
    long long v21 = 0;
LABEL_12:

    if (a6) {
      goto LABEL_13;
    }
  }
  else
  {
    unsigned int v23 = sub_100008DCC();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v30 = v10;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "[WARN] Not allowing requested transaction because it is empty: %@", buf, 0xCu);
    }

    long long v21 = +[NSError cx_requestTransactionErrorWithCode:3];
    if (a6) {
LABEL_13:
    }
      *a6 = v21;
  }

  return v21 == 0;
}

- (void)restorePersistedBargeCallsIfNecessary
{
  unsigned __int8 v3 = +[CSDPersistedChannelRegistry sharedInstance];
  v4 = [v3 activePersistedChannelIdentity];

  if (v4)
  {
    v5 = [v4 channelUUID];
    id v6 = [(CSDProviderCallDataSource *)self _callWithUUID:v5];

    BOOL v7 = sub_100008DCC();
    BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
    if (v6)
    {
      if (v8)
      {
        id v9 = [0 uniqueProxyIdentifier];
        int v27 = 138412546;
        long long v28 = v9;
        __int16 v29 = 2112;
        uint64_t v30 = (uint64_t)v4;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Found existing call with identifier %@; will not attempt to restore a call from persisted channel identity %@",
          (uint8_t *)&v27,
          0x16u);
      }
    }
    else
    {
      if (v8)
      {
        int v27 = 138412290;
        long long v28 = v4;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Attempting to restore a call from persisted channel identity %@", (uint8_t *)&v27, 0xCu);
      }

      BOOL v7 = +[CSDProviderBargeCall callForChannelIdentity:v4];
      id v10 = [v7 applicationRecord];
      id v11 = sub_100008DCC();
      id v12 = v11;
      if (v10)
      {
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          id v13 = [v7 uniqueProxyIdentifier];
          int v27 = 138412546;
          long long v28 = v13;
          __int16 v29 = 2112;
          uint64_t v30 = (uint64_t)v4;
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Restoring call with identifier %@ from persisted channel identity %@", (uint8_t *)&v27, 0x16u);
        }
        uint64_t v14 = [(CSDProviderCallDataSource *)self channelSourceManager];
        id v15 = [v7 providerIdentifier];
        uint64_t v16 = [v14 channelSourceForIdentifier:v15];

        uint64_t v17 = [v7 provider];
        uint64_t v18 = v17 | v16;

        if (v18)
        {
          uint64_t v19 = [v7 provider];

          if (!v19 && v16)
          {
            id v20 = sub_100008DCC();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
            {
              long long v21 = [v7 uniqueProxyIdentifierUUID];
              int v27 = 138412546;
              long long v28 = v21;
              __int16 v29 = 2112;
              uint64_t v30 = v16;
              _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Adding channel source %@ to restored channel with UUID %@", (uint8_t *)&v27, 0x16u);
            }
            [v7 setProviderSource:v16];
          }
        }
        else
        {
          unsigned int v23 = sub_100008DCC();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
          {
            int v27 = 138412290;
            long long v28 = v4;
            _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Synthesizing and registering persisted barge call's provider %@", (uint8_t *)&v27, 0xCu);
          }

          id v24 = [[CSDChannelProvider alloc] initWithApplicationRecord:v10];
          long long v25 = [(CSDProviderCallDataSource *)self channelProviderManager];
          [v25 registerProvider:v24];
        }
        id v22 = [(CSDCallDataSource *)self callStateController];
        [v22 setCallDelegatesIfNeeded:v7];
        [v22 propertiesChangedForCall:v7];
        [v7 setTransmissionState:1];
        long long v26 = +[NSDate date];
        [v7 setDateConnected:v26];

        [v7 setHeld:1];
        [(CSDProviderCallDataSource *)self startObservingBluetoothHangupCommands];
        [(CSDProviderCallDataSource *)self _startMonitoringAppForCall:v7];
      }
      else
      {
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
          sub_1003A9F94();
        }

        uint64_t v16 = +[CSDPersistedChannelRegistry sharedInstance];
        id v22 = [v4 bundleIdentifier];
        [(id)v16 tearDownPersistedChannelForBundleIdentifier:v22 teardownType:2];
      }
    }
  }
  else
  {
    id v6 = sub_100008DCC();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v27) = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "A persisted channel identity was not found, no call restoration will be attempted", (uint8_t *)&v27, 2u);
    }
  }
}

- (BOOL)transactionContainsChannelActions:(id)a3
{
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  unsigned __int8 v3 = objc_msgSend(a3, "actions", 0, 0);
  v4 = (char *)[v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v9;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v3);
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          LOBYTE(v4) = 1;
          goto LABEL_11;
        }
      }
      v4 = (char *)[v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return (char)v4;
}

- (void)channelSourceManager:(id)a3 completedTransactionGroup:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  long long v8 = [(CSDCallDataSource *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000B2FC0;
  block[3] = &unk_100504FE0;
  id v12 = v6;
  id v13 = v7;
  uint64_t v14 = self;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

- (void)channelSourcesChangedForChannelSourceManager:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CSDCallDataSource *)self queue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000B32F8;
  v7[3] = &unk_100504F10;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (BOOL)channelSource:(id)a3 shouldProcessAction:(id)a4 error:(id *)a5
{
  return [(CSDProviderCallDataSource *)self _shouldAllowAction:a4 forChannelSource:a3 shouldValidateUserIntent:0 error:a5];
}

- (void)providerSource:(id)a3 requestedTransaction:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  long long v11 = sub_100008DCC();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138412546;
    id v13 = v8;
    __int16 v14 = 2112;
    id v15 = v9;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Provider source %@ received requested transaction %@", (uint8_t *)&v12, 0x16u);
  }

  [(CSDProviderCallDataSource *)self _processRequestedTransaction:v9 fromProviderSource:v8 completionHandler:v10];
}

- (void)providerSource:(id)a3 registeredWithConfiguration:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = sub_100008DCC();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v21 = 138412546;
    id v22 = v6;
    __int16 v23 = 2112;
    id v24 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Channel source %@ registered with configuration %@", (uint8_t *)&v21, 0x16u);
  }

  id v9 = [[CSDChannelProvider alloc] initWithSource:v6 configuration:v7];
  id v10 = [(CSDProviderCallDataSource *)self channelProviderManager];
  [v10 registerProvider:v9];

  long long v11 = +[CSDPersistedChannelRegistry sharedInstance];
  int v12 = [v11 activePersistedChannelIdentity];

  id v13 = [(CSDChannelProvider *)v9 identifier];
  __int16 v14 = [v12 applicationIdentifier];
  unsigned int v15 = [v13 isEqualToString:v14];

  if (v15)
  {
    [(CSDProviderCallDataSource *)self restorePersistedBargeCallsIfNecessary];
    uint64_t v16 = [v12 channelUUID];
    uint64_t v17 = [v12 applicationIdentifier];
    uint64_t v18 = [(CSDProviderCallDataSource *)self _callWithUUID:v16 providerIdentifier:v17];

    uint64_t v19 = sub_100008DCC();
    BOOL v20 = os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT);
    if (v18)
    {
      if (v20)
      {
        int v21 = 138412546;
        id v22 = v6;
        __int16 v23 = 2112;
        id v24 = v18;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Channel source flushing properties %@ for restored call %@", (uint8_t *)&v21, 0x16u);
      }

      uint64_t v19 = [(CSDCallDataSource *)self callStateController];
      [v19 propertiesChangedForCall:v18];
    }
    else if (v20)
    {
      LOWORD(v21) = 0;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Channel source couldn't find call to flush properties", (uint8_t *)&v21, 2u);
    }
  }
}

- (void)providerSource:(id)a3 reportedChannelWithUUID:(id)a4 startedConnectingAtDate:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  long long v11 = sub_100008DCC();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v17 = 138412802;
    id v18 = v8;
    __int16 v19 = 2112;
    id v20 = v9;
    __int16 v21 = 2112;
    id v22 = v10;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Channel source %@ started connecting channel with UUID %@ at date %@", (uint8_t *)&v17, 0x20u);
  }

  int v12 = [v8 identifier];
  id v13 = [(CSDProviderCallDataSource *)self _callWithUUID:v9 providerIdentifier:v12];

  if (!v13)
  {
    unsigned int v15 = sub_100008DCC();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = 138412546;
      id v18 = v8;
      __int16 v19 = 2112;
      id v20 = v9;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "[WARN] No call found for channel source %@ and UUID %@", (uint8_t *)&v17, 0x16u);
    }
    goto LABEL_12;
  }
  __int16 v14 = [v13 dateStartedConnecting];

  if (v14)
  {
    unsigned int v15 = sub_100008DCC();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v16 = [v13 uniqueProxyIdentifier];
      int v17 = 138412290;
      id v18 = v16;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "[WARN] Call with UUID %@ already has a started connecting date.", (uint8_t *)&v17, 0xCu);
    }
    goto LABEL_12;
  }
  if (!v10)
  {
    unsigned int v15 = +[NSDate date];
    [v13 setDateStartedConnecting:v15];
LABEL_12:

    goto LABEL_13;
  }
  [v13 setDateStartedConnecting:v10];
LABEL_13:
}

- (void)providerSource:(id)a3 reportedChannelWithUUID:(id)a4 connectedAtDate:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  long long v11 = sub_100008DCC();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v17 = 138412802;
    id v18 = v8;
    __int16 v19 = 2112;
    id v20 = v9;
    __int16 v21 = 2112;
    id v22 = v10;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Channel source %@ connected channel with UUID %@ at date %@", (uint8_t *)&v17, 0x20u);
  }

  int v12 = [v8 identifier];
  id v13 = [(CSDProviderCallDataSource *)self _callWithUUID:v9 providerIdentifier:v12];

  if (!v13)
  {
    unsigned int v15 = sub_100008DCC();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = 138412546;
      id v18 = v8;
      __int16 v19 = 2112;
      id v20 = v9;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "[WARN] No call found for channel source %@ and UUID %@", (uint8_t *)&v17, 0x16u);
    }
    goto LABEL_12;
  }
  __int16 v14 = [v13 dateConnected];

  if (v14)
  {
    unsigned int v15 = sub_100008DCC();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v16 = [v13 uniqueProxyIdentifier];
      int v17 = 138412290;
      id v18 = v16;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "[WARN] Call with UUID %@ already has a connected date.", (uint8_t *)&v17, 0xCu);
    }
    goto LABEL_12;
  }
  if (!v10)
  {
    unsigned int v15 = +[NSDate date];
    [v13 setDateConnected:v15];
LABEL_12:

    goto LABEL_13;
  }
  [v13 setDateConnected:v10];
LABEL_13:
}

- (void)providerSource:(id)a3 reportedChannelWithUUID:(id)a4 disconnectedAtDate:(id)a5 disconnectedReason:(int64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = sub_100008DCC();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    int v20 = 138413058;
    id v21 = v10;
    __int16 v22 = 2112;
    id v23 = v11;
    __int16 v24 = 2048;
    int64_t v25 = a6;
    __int16 v26 = 2112;
    id v27 = v12;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Channel source %@ disconnected channel with UUID %@ with reason %ld at date %@", (uint8_t *)&v20, 0x2Au);
  }

  __int16 v14 = [v10 identifier];
  unsigned int v15 = [(CSDProviderCallDataSource *)self _callWithUUID:v11 providerIdentifier:v14];

  if (!v15)
  {
    int v17 = sub_100008DCC();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      int v20 = 138412546;
      id v21 = v10;
      __int16 v22 = 2112;
      id v23 = v11;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "[WARN] No call found for channel source %@ and UUID %@", (uint8_t *)&v20, 0x16u);
    }
    goto LABEL_9;
  }
  uint64_t v16 = [v15 dateEnded];

  if (v16)
  {
    int v17 = sub_100008DCC();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      id v18 = [v15 uniqueProxyIdentifier];
      int v20 = 138412290;
      id v21 = v18;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "[WARN] Call with UUID %@ already has a disconnected date.", (uint8_t *)&v20, 0xCu);
    }
LABEL_9:

    goto LABEL_16;
  }
  if (a6 != 1) {
    a6 = -1;
  }
  if (v12)
  {
    [v15 setDateEnded:v12];
  }
  else
  {
    __int16 v19 = +[NSDate date];
    [v15 setDateEnded:v19];
  }
  [v15 setEndedReason:a6];
LABEL_16:
}

- (void)providerSource:(id)a3 reportedChannelWithUUID:(id)a4 updated:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = sub_100008DCC();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v17 = 138412802;
    id v18 = v8;
    __int16 v19 = 2112;
    id v20 = v9;
    __int16 v21 = 2112;
    id v22 = v10;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Channel source %@ updated channel with UUID %@ with update %@", (uint8_t *)&v17, 0x20u);
  }

  id v12 = [v8 identifier];
  id v13 = [(CSDProviderCallDataSource *)self _callWithUUID:v9 providerIdentifier:v12];

  if ([v13 isSendingTransmission]
    && ([v10 hasSet] & 0x200) != 0)
  {
    id v14 = v13;
    if ([v10 transmissionMode] == (id)2
      || [v14 isReceivingTransmission] && objc_msgSend(v10, "transmissionMode") == (id)1)
    {
      [v14 stopTransmissionWithOriginator:2];
    }
  }
  if (v13)
  {
    if (([v10 hasSet] & 0x400) != 0)
    {
      unsigned int v15 = [v10 accessoryButtonEventsEnabled];
      if (v15 != [v13 accessoryButtonEventsEnabled]) {
        [(CSDProviderCallDataSource *)self presentAccessoryButtonEventsEnabledNotice];
      }
    }
    uint64_t v16 = objc_msgSend(v10, "csd_callUpdate");
    [v13 updateWithCallUpdate:v16];
  }
  else
  {
    uint64_t v16 = sub_100008DCC();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = 138412546;
      id v18 = v8;
      __int16 v19 = 2112;
      id v20 = v9;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "[WARN] No call found for channel source %@ and UUID %@", (uint8_t *)&v17, 0x16u);
    }
  }
}

- (void)providerSource:(id)a3 reportedIncomingTransmissionEndedForChannelWithUUID:(id)a4 reason:(int64_t)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = (void (**)(id, void *))a6;
  id v13 = sub_100008DCC();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    id v14 = [v11 UUIDString];
    int v20 = 138412802;
    id v21 = v10;
    __int16 v22 = 2112;
    id v23 = v14;
    __int16 v24 = 2048;
    int64_t v25 = a5;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Channel source %@ reported a channel with UUID %@ ended an incoming transmission with reason %ld", (uint8_t *)&v20, 0x20u);
  }
  unsigned int v15 = [v10 identifier];
  uint64_t v16 = [(CSDProviderCallDataSource *)self _callWithUUID:v11 providerIdentifier:v15];

  if (v16)
  {
    if (([v16 transmissionState] & 2) != 0)
    {
      [v16 setActiveRemoteParticipant:0];
      if (![v16 transmissionMode] && (objc_msgSend(v16, "transmissionState") & 4) != 0)
      {
        [v16 setTransmissionState:12];
      }
      else
      {
        [v16 setTransmissionState:1];
        [v16 hold];
        [v16 setHeld:1];
      }
      __int16 v19 = 0;
      if (v12) {
        goto LABEL_10;
      }
      goto LABEL_11;
    }
    uint64_t v17 = 7;
  }
  else
  {
    id v18 = sub_100008DCC();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      int v20 = 138412546;
      id v21 = v10;
      __int16 v22 = 2112;
      id v23 = v11;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "[WARN] No call found for channel source %@ and UUID %@", (uint8_t *)&v20, 0x16u);
    }

    uint64_t v17 = 4;
  }
  __int16 v19 = +[NSError cx_channelErrorWithCode:v17];
  if (v12) {
LABEL_10:
  }
    v12[2](v12, v19);
LABEL_11:
}

- (void)providerSource:(id)a3 reportedIncomingTransmissionStartedForChannelWithUUID:(id)a4 update:(id)a5 shouldReplaceOutgoingTransmission:(BOOL)a6 completionHandler:(id)a7
{
  BOOL v8 = a6;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  unsigned int v15 = (void (**)(id, void *))a7;
  uint64_t v16 = sub_100008DCC();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v17 = [v13 UUIDString];
    int v37 = 138412802;
    id v38 = v12;
    __int16 v39 = 2112;
    id v40 = v17;
    __int16 v41 = 2112;
    id v42 = v14;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Channel source %@ reported a channel with UUID %@ started an incoming transmission with update %@", (uint8_t *)&v37, 0x20u);
  }
  id v18 = [v12 identifier];
  __int16 v19 = [(CSDProviderCallDataSource *)self _callWithUUID:v13 providerIdentifier:v18];

  int v20 = [v14 activeRemoteParticipant];
  id v21 = [v20 name];
  id v22 = [v21 length];

  if (v22)
  {
    id v23 = +[NSNotificationCenter defaultCenter];
    [v23 postNotificationName:@"CSDBargeCallSetValidActiveRemoteParticipantNameNotification" object:v19];
  }
  if ([(CSDProviderCallDataSource *)self _activeStandardCallExists])
  {
    uint64_t v24 = 2;
    goto LABEL_29;
  }
  if (v19)
  {
    if ([v19 transmissionState])
    {
      [v19 setTransmissionState:2];
      BOOL v32 = objc_msgSend(v14, "csd_callUpdate");
      [v19 updateWithCallUpdate:v32 notifyDelegate:0];

      [v19 unhold];
      [v19 setHeld:0];
      goto LABEL_21;
    }
    if (([v19 transmissionState] & 2) != 0)
    {
      v35 = objc_msgSend(v14, "csd_callUpdate");
      [v19 updateWithCallUpdate:v35 notifyDelegate:1];

      goto LABEL_24;
    }
    if ([v19 transmissionMode] == (id)1
      && ([v19 transmissionState] & 4) != 0
      && v8)
    {
      int64_t v25 = sub_100008DCC();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v37) = 0;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Replacing outgoing PTT transmission with incoming active remote speaker.", (uint8_t *)&v37, 2u);
      }

      objc_msgSend(v19, "setTransmissionState:", (unint64_t)objc_msgSend(v19, "transmissionState") | 2);
      __int16 v26 = objc_msgSend(v14, "csd_callUpdate");
      [v19 updateWithCallUpdate:v26 notifyDelegate:0];

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_21;
      }
      id v27 = v19;
      id v28 = objc_alloc((Class)CXChannelTransmitStopAction);
      __int16 v29 = [v27 uniqueProxyIdentifierUUID];
      id v30 = [v28 initWithChannelUUID:v29];

      [v30 setOriginator:2];
      [(CSDProviderCallDataSource *)self performChannelAction:v30 forCall:v27];

      goto LABEL_33;
    }
    if (![v19 transmissionMode] && (objc_msgSend(v19, "transmissionState") & 4) != 0)
    {
      objc_msgSend(v19, "setTransmissionState:", (unint64_t)objc_msgSend(v19, "transmissionState") | 2);
      objc_msgSend(v14, "csd_callUpdate");
      id v30 = (id)objc_claimAutoreleasedReturnValue();
      [v19 updateWithCallUpdate:v30 notifyDelegate:0];
LABEL_33:

LABEL_21:
      uint64_t v33 = [v19 providerDisplayMonitor];
      unsigned __int8 v34 = [v33 isVisible];

      if ((v34 & 1) == 0) {
        [(CSDProviderCallDataSource *)self presentIncomingTransmissionNotice];
      }
LABEL_24:
      int v36 = 0;
      if (!v15) {
        goto LABEL_31;
      }
      goto LABEL_30;
    }
    uint64_t v24 = 6;
  }
  else
  {
    unsigned __int8 v31 = sub_100008DCC();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      int v37 = 138412546;
      id v38 = v12;
      __int16 v39 = 2112;
      id v40 = v13;
      _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "[WARN] No call found for channel source %@ and UUID %@", (uint8_t *)&v37, 0x16u);
    }

    uint64_t v24 = 4;
  }
LABEL_29:
  int v36 = +[NSError cx_channelErrorWithCode:v24];
  if (v15) {
LABEL_30:
  }
    v15[2](v15, v36);
LABEL_31:
}

- (void)presentIncomingTransmissionNotice
{
  unsigned __int8 v3 = +[NSURL faceTimeShowIncomingTransmissionNoticeUIURL];
  id v2 = v3;
  TUOpenURLWithCompletion();
}

- (void)presentAccessoryButtonEventsEnabledNotice
{
  unsigned __int8 v3 = +[NSURL faceTimeShowAccessoryButtonEventsNoticeUIURL];
  id v2 = v3;
  TUOpenURLWithCompletion();
}

- (BOOL)_meetsRequirementsToBeginTransmitting:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = [(CSDProviderCallDataSource *)self _isChannelSourceAppForeground:v4];
  unsigned __int8 v6 = [v4 isPermittedToUseBluetoothAccessories];
  LOBYTE(self) = [(CSDProviderCallDataSource *)self _isChannelSourceAppRunningPTTTransmissionAppIntent:v4];

  return self | v6 | v5;
}

- (BOOL)_isChannelSourceAppForeground:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = [(CSDProviderCallDataSource *)self processObserver];
  uint64_t v14 = 0;
  unsigned int v15 = &v14;
  uint64_t v16 = 0x2020000000;
  char v17 = 0;
  unsigned __int8 v6 = [(CSDProviderCallDataSource *)self processObserverQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000B4ECC;
  block[3] = &unk_100505DC0;
  id v11 = v5;
  id v12 = v4;
  id v13 = &v14;
  id v7 = v4;
  id v8 = v5;
  dispatch_sync(v6, block);

  LOBYTE(v6) = *((unsigned char *)v15 + 24);
  _Block_object_dispose(&v14, 8);
  return (char)v6;
}

- (BOOL)_isChannelSourceAppRunningPTTTransmissionAppIntent:(id)a3
{
  id v4 = [a3 bundleIdentifier];
  unsigned __int8 v5 = +[RBSProcessPredicate predicateMatchingBundleIdentifier:v4];

  id v14 = 0;
  unsigned __int8 v6 = +[RBSProcessHandle handleForPredicate:v5 error:&v14];
  id v7 = v14;
  if (v7)
  {
    id v8 = sub_100008DCC();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_1003AA06C();
    }
    LOBYTE(v9) = 0;
  }
  else
  {
    id v10 = [v6 currentState];
    id v8 = [v10 assertions];

    if (v8)
    {
      id v11 = [v8 valueForKey:@"domain"];
      BOOL v9 = [(CSDProviderCallDataSource *)self _channelSourceAssertionsContainsPTTTransmissionIntent:v11];
    }
    else
    {
      BOOL v9 = 0;
    }
    id v12 = sub_100008DCC();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      BOOL v16 = v9;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "ChannelSource has PushToTalkTransmissionIntent assertion: %d", buf, 8u);
    }
  }
  return v9;
}

- (BOOL)_channelSourceAssertionsContainsPTTTransmissionIntent:(id)a3
{
  if (a3) {
    return [a3 containsObject:@"com.apple.siri.pushtotalk:PTTActivation"];
  }
  else {
    return 0;
  }
}

- (void)startObservingBluetoothHangupCommands
{
  unsigned __int8 v3 = [(CSDProviderCallDataSource *)self btHangupObserver];
  [v3 setDelegate:self];

  id v4 = [(CSDProviderCallDataSource *)self btHangupObserver];
  [v4 startObservingHangupCommands];
}

- (void)stopObservingBluetoothHangupCommands
{
  id v2 = [(CSDProviderCallDataSource *)self btHangupObserver];
  [v2 stopObservingHangupCommands];
}

- (void)didObserveBluetoothHangupCommand
{
  unsigned __int8 v3 = +[CSDPersistedChannelRegistry sharedInstance];
  id v11 = [v3 activePersistedChannelIdentity];

  id v4 = [v11 channelUUID];
  unsigned __int8 v5 = [(CSDProviderCallDataSource *)self _callWithUUID:v4];
  unsigned __int8 v6 = [v5 provider];
  id v7 = [v6 bundleIdentifier];
  id v8 = [v11 bundleIdentifier];
  unsigned int v9 = [v7 isEqualToString:v8];

  if (v9)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v10 = v5;
      if ([v10 transmissionMode] != (id)2)
      {
        if ([v10 isSendingTransmission])
        {
          [v10 stopTransmissionWithOriginator:1];
        }
        else if (([v10 isHeld] & 1) != 0 {
               || [v10 isReceivingTransmission] && !objc_msgSend(v10, "transmissionMode"))
        }
        {
          [v10 startTransmissionWithOriginator:1];
        }
      }
    }
  }
}

- (void)acquireTemporaryProcessAssertionForCall:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = [v4 applicationRecord];
  unsigned __int8 v6 = [v5 bundleIdentifier];
  id v7 = +[CSDVoIPProcessAssertion processAssertionWithBundleIdentifier:v6];

  LODWORD(v6) = [v7 acquire];
  id v8 = sub_100008DCC();
  unsigned int v9 = v8;
  if (v6)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = [v4 uniqueProxyIdentifier];
      *(_DWORD *)buf = 134218242;
      char v17 = v7;
      __int16 v18 = 2112;
      __int16 v19 = v10;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Taking temporary process assertion %p for barge call with identifier %@", buf, 0x16u);
    }
    dispatch_time_t v11 = dispatch_time(0, 15000000000);
    id v12 = [(CSDCallDataSource *)self queue];
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_1000B55E4;
    v13[3] = &unk_100504F10;
    id v14 = v7;
    id v15 = v4;
    dispatch_after(v11, v12, v13);

    unsigned int v9 = v14;
  }
  else if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    sub_1003AA0D4((uint64_t)v7, v4);
  }
}

- (void)acquireIndefiniteProcessAssertionForCall:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = [v4 applicationRecord];
  unsigned __int8 v6 = [v5 bundleIdentifier];

  if ([v6 length])
  {
    id v7 = [(CSDProviderCallDataSource *)self processAssertionManager];
    [v7 acquireProcessAssertionForBundleIdentifier:v6];
  }
  else
  {
    id v7 = sub_100008DCC();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = [v4 uniqueProxyIdentifier];
      int v9 = 138412290;
      id v10 = v8;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Cannot obtain process assertion; bundle identifier not found for call with identifier %@.",
        (uint8_t *)&v9,
        0xCu);
    }
  }
}

- (void)invalidateIndefiniteProcessAssertionForCall:(id)a3
{
  id v4 = [a3 applicationRecord];
  id v5 = [v4 bundleIdentifier];

  [(CSDProviderCallDataSource *)self invalidateProcessAssertionForBundleIdentifier:v5];
}

- (void)invalidateProcessAssertionForBundleIdentifier:(id)a3
{
  id v5 = a3;
  if ([v5 length])
  {
    id v4 = [(CSDProviderCallDataSource *)self processAssertionManager];
    [v4 invalidateProcessAssertionForBundleIdentifier:v5];
  }
}

- (id)channelProviderForIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(CSDProviderCallDataSource *)self channelProviderManager];
  unsigned __int8 v6 = [v5 providerForIdentifier:v4];

  return v6;
}

- (void)performChannelAction:(id)a3 forCall:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = sub_100008DCC();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v31 = v6;
    __int16 v32 = 2112;
    id v33 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Asked to perform action %@ for call %@", buf, 0x16u);
  }

  int v9 = [v7 providerSource];

  if (v9)
  {
    id v10 = [v7 providerSource];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      id v12 = [v7 providerSource];
      if ([v6 originator] != (id)2
        && [(CSDProviderCallDataSource *)self channelSource:v12 shouldProcessAction:v6 error:0])
      {
        [(CSDProviderCallDataSource *)self acquireTemporaryProcessAssertionForCall:v7];
      }
      id v13 = [(CSDProviderCallDataSource *)self channelSourceManager];
      [v13 addAction:v6 toUncommittedTransactionForChannelSource:v12];

      id v14 = [(CSDProviderCallDataSource *)self channelSourceManager];
      [v14 commitUncommittedTransactions];

LABEL_23:
      goto LABEL_24;
    }
    id v15 = sub_100008DCC();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v16 = [v7 providerSource];
      *(_DWORD *)buf = 138412290;
      id v31 = v16;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "[WARN] Provider source was not of type CXChannelSource: %@", buf, 0xCu);
    }
LABEL_18:

    goto LABEL_24;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v12 = v6;
      id v17 = objc_alloc_init((Class)_LSOpenConfiguration);
      uint64_t v28 = FBSOpenApplicationOptionKeyActivateSuspended;
      __int16 v29 = &__kCFBooleanTrue;
      __int16 v18 = +[NSDictionary dictionaryWithObjects:&v29 forKeys:&v28 count:1];
      [v17 setFrontBoardOptions:v18];

      __int16 v19 = [v7 applicationRecord];
      int v20 = [v19 bundleIdentifier];

      if ([v20 length])
      {
        id v21 = +[LSApplicationWorkspace defaultWorkspace];
        v23[0] = _NSConcreteStackBlock;
        v23[1] = 3221225472;
        v23[2] = sub_1000B5D08;
        v23[3] = &unk_100506B40;
        v23[4] = self;
        id v24 = v7;
        id v25 = v12;
        id v26 = v20;
        id v27 = v25;
        [v21 openApplicationWithBundleIdentifier:v26 configuration:v17 completionHandler:v23];
      }
      else
      {
        id v22 = sub_100008DCC();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v31 = v12;
          _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Could not obtain bundle identifier; cannot process action %@",
            buf,
            0xCu);
        }

        [(CSDProviderCallDataSource *)self invalidateIndefiniteProcessAssertionForCall:v7];
      }

      goto LABEL_23;
    }
    id v15 = sub_100008DCC();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v31 = v6;
      __int16 v32 = 2112;
      id v33 = v7;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "[WARN] Ignoring action %@ until a provider source connects to call %@", buf, 0x16u);
    }
    goto LABEL_18;
  }
  [v6 fulfill];
  [(CSDProviderCallDataSource *)self _processCompletedChannelAction:v6 forCall:v7];
LABEL_24:
}

- (void)_startMonitoringAppForCall:(id)a3
{
  id v4 = a3;
  id v5 = [v4 providerSource];
  uint64_t v6 = [v5 bundleIdentifier];
  if (v6)
  {
    id v7 = (void *)v6;
    id v8 = [v4 providerSource];
    int v9 = [v8 bundleIdentifier];
    id v10 = [v9 length];

    if (v10)
    {
      dispatch_time_t v11 = [(CSDProviderCallDataSource *)self processObserverQueue];
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_1000B60DC;
      block[3] = &unk_100504F10;
      void block[4] = self;
      id v12 = v4;
      id v20 = v12;
      dispatch_async(v11, block);

      objc_initWeak(location, self);
      objc_copyWeak(&v17, location);
      id v16 = v12;
      id v13 = [(CSDProviderCallDataSource *)self processObserver];
      [v13 setProcessStateChanged:&v15];

      objc_destroyWeak(&v17);
      objc_destroyWeak(location);

      goto LABEL_8;
    }
  }
  else
  {
  }
  id v14 = sub_100008DCC();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(location[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "BargeCall provider bundle identifier was empty so we are not able to start monitoring the process.", (uint8_t *)location, 2u);
  }

LABEL_8:
}

- (void)_processPushToTalkAppStateChangedForCall:(id)a3 withPID:(int)a4 processState:(int64_t)a5
{
  uint64_t v6 = *(void *)&a4;
  id v8 = a3;
  int v9 = [(CSDProviderCallDataSource *)self processObserver];
  id v10 = [v8 providerSource];
  dispatch_time_t v11 = [v10 bundleIdentifier];
  id v12 = [v9 processIdentifiersForBundleIdentifier:v11];

  if ((unint64_t)[v12 count] >= 2)
  {
    id v13 = sub_100008DCC();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      int64_t v21 = (int64_t)v12;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "[WARN] BargeCall provider source has multiple process identifiers: %@", buf, 0xCu);
    }
  }
  id v14 = +[NSNumber numberWithInt:v6];
  if (![v12 containsObject:v14]) {
    goto LABEL_12;
  }
  if ([v8 isSendingTransmission])
  {

LABEL_9:
    id v16 = sub_100008DCC();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      int64_t v21 = a5;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "BargeCall provider source has changed process state to: %ld", buf, 0xCu);
    }

    id v17 = [(CSDCallDataSource *)self queue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000B6410;
    block[3] = &unk_100504EC0;
    id v19 = v8;
    dispatch_async(v17, block);

    id v14 = v19;
LABEL_12:

    goto LABEL_13;
  }
  unsigned __int8 v15 = [v8 isReceivingTransmission];

  if (v15) {
    goto LABEL_9;
  }
LABEL_13:
}

- (void)_stopMonitoringPushToTalkAppProcess
{
  id v2 = [(CSDProviderCallDataSource *)self processObserver];
  [v2 setProcessStateChanged:0];
}

- (CSDProviderCallDataSource)initWithCallStateController:(id)a3 queue:(id)a4 assistantServicesObserver:(id)a5 coreTelephonyClient:(id)a6 chManager:(id)a7 callSourceManager:(id)a8 protectedAppsUtilities:(id)a9
{
  id v15 = a3;
  id v16 = a4;
  id v91 = a5;
  id v17 = (CSDCoreTelephonyClient *)a6;
  id v92 = a7;
  id v18 = a8;
  id v19 = (CSDProtectedAppsUtilities *)a9;
  v104.receiver = self;
  v104.super_class = (Class)CSDProviderCallDataSource;
  id v20 = [(CSDCallDataSource *)&v104 initWithCallStateController:v15 queue:v16];
  int64_t v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_assistantServicesObserver, a5);
    id v22 = v17;
    if (!v17) {
      id v22 = [[CSDCoreTelephonyClient alloc] initWithQueue:v16 shouldRegisterForECBMNotification:0];
    }
    objc_storeStrong((id *)&v21->_coreTelephonyClient, v22);
    if (!v17) {

    }
    id v23 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    pendingCallsToChatUUIDs = v21->_pendingCallsToChatUUIDs;
    v21->_pendingCallsToChatUUIDs = v23;

    id dndAllowsCall = v21->_dndAllowsCall;
    v21->_id dndAllowsCall = &stru_10050A550;

    v102[0] = _NSConcreteStackBlock;
    v102[1] = 3221225472;
    v102[2] = sub_1001D95C0;
    v102[3] = &unk_10050A578;
    id v90 = v15;
    id v26 = v15;
    id v103 = v26;
    id v27 = objc_retainBlock(v102);
    id callDirectoryAllowsCallFromSourceAddress = v21->_callDirectoryAllowsCallFromSourceAddress;
    v21->_id callDirectoryAllowsCallFromSourceAddress = v27;

    v100[0] = _NSConcreteStackBlock;
    v100[1] = 3221225472;
    v100[2] = sub_1001D9628;
    v100[3] = &unk_10050A5A0;
    id v29 = v26;
    id v101 = v29;
    id v30 = objc_retainBlock(v100);
    id blockedByExtension = v21->_blockedByExtension;
    v21->_id blockedByExtension = v30;

    id supportsPrimaryCalling = v21->_supportsPrimaryCalling;
    v21->_id supportsPrimaryCalling = &stru_10050A5C0;

    v98[0] = _NSConcreteStackBlock;
    v98[1] = 3221225472;
    v98[2] = sub_1001D96B0;
    v98[3] = &unk_10050A5E8;
    id v33 = v29;
    id v99 = v33;
    unsigned __int8 v34 = objc_retainBlock(v98);
    id shouldPreferRelayOverDirectSecondaryCalling = v21->_shouldPreferRelayOverDirectSecondaryCalling;
    v21->_id shouldPreferRelayOverDirectSecondaryCalling = v34;

    int v36 = [[CSDVoIPProcessAssertionManager alloc] initWithSerialQueue:v16];
    processAssertionManager = v21->_processAssertionManager;
    v21->_processAssertionManager = v36;

    id v38 = objc_alloc_init(CSDCallFilterController);
    callFilterController = v21->_callFilterController;
    v21->_callFilterController = v38;

    id v40 = v21->_callFilterController;
    __int16 v41 = [[CSDCallHistoryCallFilter alloc] initWithChManager:v92];
    [(CSDCallFilterController *)v40 addCallFilter:v41];

    id v42 = v21->_callFilterController;
    uint64_t v43 = objc_alloc_init(CSDContactsCallFilter);
    [(CSDCallFilterController *)v42 addCallFilter:v43];

    v44 = v21->_callFilterController;
    uint64_t v45 = [[CSDOwnNumberCallFilter alloc] initWithQueue:v16];
    [(CSDCallFilterController *)v44 addCallFilter:v45];

    v21->_isScreenTimeDisabledByOtherFeatures = 0;
    v46 = objc_opt_new();
    LODWORD(v45) = [v46 isClarityBoardEnabled];

    if (v45)
    {
      v21->_isScreenTimeDisabledByOtherFeatures = 1;
      v47 = [[CSDClarityUICallFilter alloc] initWithQueue:v16];
      clarityUICallFilter = v21->_clarityUICallFilter;
      v21->_clarityUICallFilter = v47;

      [(CSDCallFilterController *)v21->_callFilterController addCallFilter:v21->_clarityUICallFilter];
    }
    if (!v21->_isScreenTimeDisabledByOtherFeatures)
    {
      v49 = [CSDScreenTimeCallFilter alloc];
      v50 = [v33 callProviderManager];
      v51 = [(CSDScreenTimeCallFilter *)v49 initWithCallProviderManager:v50 delegate:v21 queue:v16];
      screenTimeCallFilter = v21->_screenTimeCallFilter;
      v21->_screenTimeCallFilter = v51;

      [(CSDCallFilterController *)v21->_callFilterController addCallFilter:v21->_screenTimeCallFilter];
    }
    objc_initWeak(&location, v21);
    v95[0] = _NSConcreteStackBlock;
    v95[1] = 3221225472;
    v95[2] = sub_1001D9710;
    v95[3] = &unk_10050A610;
    objc_copyWeak(&v96, &location);
    id v53 = objc_retainBlock(v95);
    id shouldFilterCall = v21->_shouldFilterCall;
    v21->_id shouldFilterCall = v53;

    id lowPowerModeEnabledBlock = v21->_lowPowerModeEnabledBlock;
    v21->_id lowPowerModeEnabledBlock = &stru_10050A630;

    v21->_dispatchDelay = 1.0;
    id v56 = v18;
    if (!v18) {
      id v56 = [objc_alloc((Class)CXCallSourceManager) initWithDelegate:v21 queue:v16];
    }
    p_callSourceManager = (id *)&v21->_callSourceManager;
    objc_storeStrong((id *)&v21->_callSourceManager, v56);
    if (!v18) {

    }
    v58 = (CXCallControllerHost *)[objc_alloc((Class)CXCallControllerHost) initWithDelegate:v21 delegateQueue:v16];
    callControllerHost = v21->_callControllerHost;
    v21->_callControllerHost = v58;

    v60 = [[CSDCallSourceFetcher alloc] initWithSerialQueue:v16];
    callSourceFetcher = v21->_callSourceFetcher;
    v21->_callSourceFetcher = v60;

    [(CSDCallSourceFetcher *)v21->_callSourceFetcher setDataSource:v21];
    uint64_t v62 = +[NSMutableDictionary dictionary];
    pendingPulledCallContexts = v21->_pendingPulledCallContexts;
    v21->_pendingPulledCallContexts = (NSMutableDictionary *)v62;

    id v64 = objc_alloc((Class)CXInProcessCallSource);
    v65 = TUPreferredFaceTimeBundleIdentifier();
    v66 = TUBundle();
    v67 = [v66 localizedStringForKey:@"FACETIME" value:&stru_100517F40 table:@"TelephonyUtilities"];
    v68 = (CXInProcessCallSource *)[v64 initWithIdentifier:@"com.apple.telephonyutilities.callservicesd.FaceTimeProvider" bundleIdentifier:v65 fallbackLocalizedName:v67];
    faceTimeCallSource = v21->_faceTimeCallSource;
    v21->_faceTimeCallSource = v68;

    v70 = [[CSDFaceTimeProviderDelegate alloc] initWithCallSource:v21->_faceTimeCallSource queue:v16 chManager:v92];
    faceTimeProviderDelegate = v21->_faceTimeProviderDelegate;
    v21->_faceTimeProviderDelegate = v70;

    [(CSDFaceTimeProviderDelegate *)v21->_faceTimeProviderDelegate setCallDataSource:v21];
    [(CSDProviderCallDataSource *)v21 setSharingModeEnabled:0];
    [*p_callSourceManager addCallSource:v21->_faceTimeCallSource];
    id v72 = objc_alloc((Class)CXInProcessCallSource);
    v73 = (CXInProcessCallSource *)[v72 initWithIdentifier:@"com.apple.telephonyutilities.callservicesd.TinCan" bundleIdentifier:TUBundleIdentifierTinCan];
    tinCanCallSource = v21->_tinCanCallSource;
    v21->_tinCanCallSource = v73;

    v75 = [[CSDTinCanIDSProviderDelegate alloc] initWithCallSource:v21->_tinCanCallSource queue:v16];
    tinCanProviderDelegate = v21->_tinCanProviderDelegate;
    v21->_tinCanProviderDelegate = (CXProviderDelegatePrivate *)v75;

    [*p_callSourceManager addCallSource:v21->_tinCanCallSource];
    v77 = (CXChannelSourceManager *)[objc_alloc((Class)CXChannelSourceManager) initWithDelegate:v21 queue:v16];
    channelSourceManager = v21->_channelSourceManager;
    v21->_channelSourceManager = v77;

    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1001D97E0;
    block[3] = &unk_100504EC0;
    v79 = v21;
    v94 = v79;
    dispatch_async(v16, block);
    if (TUShouldCreateSuperboxProvider())
    {
      id v80 = [objc_alloc((Class)CXInProcessCallSource) initWithIdentifier:@"com.apple.Superbox" bundleIdentifier:@"com.apple.Superbox" fallbackLocalizedName:@"Superbox"];
      id v81 = v79[18];
      v79[18] = v80;

      v82 = [_TtC13callservicesd27CSDSuperboxProviderDelegate alloc];
      v83 = [v79 superboxCallSource];
      v84 = [(CSDSuperboxProviderDelegate *)v82 initWithCallSource:v83];
      id v85 = v79[19];
      v79[19] = v84;

      v86 = [v79 callSourceManager];
      v87 = [v79 superboxCallSource];
      [v86 addCallSource:v87];
    }
    v88 = v19;
    if (!v19) {
      v88 = objc_alloc_init(CSDProtectedAppsUtilities);
    }
    objc_storeStrong(v79 + 40, v88);
    if (!v19) {

    }
    objc_destroyWeak(&v96);
    objc_destroyWeak(&location);

    id v15 = v90;
  }

  return v21;
}

+ (Class)callClass
{
  return (Class)objc_opt_class();
}

- (void)registerCall:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CSDProviderCallDataSource;
  [(CSDCallDataSource *)&v11 registerCall:v4];
  if (![(CSDCallDataSource *)self shouldTrackCall:v4])
  {
    int v9 = [(CSDProviderCallDataSource *)self callControllerHost];
    id v10 = [v4 cxCall];
    [v9 removeCall:v10];
    goto LABEL_6;
  }
  id v5 = [v4 provider];
  unsigned int v6 = [v5 isTinCanProvider];

  unsigned int v7 = [v4 isPTT];
  unsigned int v8 = v7;
  if ((v6 & 1) == 0 && (v7 & 1) == 0)
  {
    int v9 = [(CSDProviderCallDataSource *)self callControllerHost];
    id v10 = [v4 cxCall];
    [v9 addOrUpdateCall:v10];
LABEL_6:

    goto LABEL_7;
  }
  int v9 = sub_100008DCC();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    id v13 = v4;
    __int16 v14 = 1024;
    unsigned int v15 = v6;
    __int16 v16 = 1024;
    unsigned int v17 = v8;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Ignoring to add %@ call since it is TinCan (%d) or PTT Barge Call (%d).", buf, 0x18u);
  }
LABEL_7:
}

- (void)startTrackingCall:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CSDProviderCallDataSource;
  [(CSDCallDataSource *)&v10 startTrackingCall:v4];
  id v5 = [v4 provider];
  if ([v5 isSystemProvider]) {
    goto LABEL_4;
  }
  unsigned __int8 v6 = [v4 isPTT];

  if ((v6 & 1) == 0)
  {
    id v5 = [(CSDProviderCallDataSource *)self processAssertionManager];
    unsigned int v7 = [v4 provider];
    unsigned int v8 = [v7 bundleIdentifier];
    [v5 acquireProcessAssertionForBundleIdentifier:v8];

LABEL_4:
  }
  int v9 = [(CSDProviderCallDataSource *)self screenTimeCallFilter];
  [v9 startMonitoringCall:v4];
}

- (void)stopTrackingCall:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CSDProviderCallDataSource;
  [(CSDCallDataSource *)&v13 stopTrackingCall:v4];
  id v5 = [v4 provider];
  unsigned __int8 v6 = [v5 isSystemProvider];

  if ((v6 & 1) == 0)
  {
    unsigned int v7 = [(CSDProviderCallDataSource *)self processAssertionManager];
    unsigned int v8 = [v4 provider];
    int v9 = [v8 bundleIdentifier];
    [v7 invalidateProcessAssertionForBundleIdentifier:v9];
  }
  objc_super v10 = [(CSDProviderCallDataSource *)self callSourceManager];
  objc_super v11 = [v4 uniqueProxyIdentifierUUID];
  [v10 failOutstandingActionsForCallWithUUID:v11];

  id v12 = [(CSDProviderCallDataSource *)self screenTimeCallFilter];
  [v12 stopMonitoringCall:v4];
}

- (id)conduit
{
  id v2 = [(CSDProviderCallDataSource *)self faceTimeProviderDelegate];
  unsigned __int8 v3 = [v2 conduit];

  return v3;
}

- (CSDRouteManager)routeManager
{
  routeManager = self->_routeManager;
  if (!routeManager)
  {
    id v4 = +[CSDRouteManager sharedInstance];
    id v5 = self->_routeManager;
    self->_routeManager = v4;

    routeManager = self->_routeManager;
  }

  return routeManager;
}

- (void)setCallProviderManager:(id)a3
{
  p_callProviderManager = &self->_callProviderManager;
  objc_storeStrong((id *)&self->_callProviderManager, a3);
  id v6 = a3;
  unsigned int v7 = *p_callProviderManager;
  id v8 = [(CSDCallDataSource *)self queue];
  [(CSDCallProviderManager *)v7 addDelegate:self queue:v8];
}

- (id)callGroupUUIDToCalls
{
  unsigned __int8 v3 = +[NSMutableDictionary dictionary];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v4 = [(CSDCallDataSource *)self calls];
  id v5 = [v4 countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v20;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v20 != v7) {
          objc_enumerationMutation(v4);
        }
        int v9 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        objc_super v10 = [v9 callGroupUUID];

        if (v10)
        {
          objc_super v11 = [v9 callGroupUUID];
          id v12 = [v3 objectForKeyedSubscript:v11];

          if (v12)
          {
            objc_super v13 = [v9 callGroupUUID];
            __int16 v14 = [v3 objectForKeyedSubscript:v13];
            unsigned int v15 = [v14 arrayByAddingObject:v9];
            __int16 v16 = [v9 callGroupUUID];
            [v3 setObject:v15 forKeyedSubscript:v16];
          }
          else
          {
            id v23 = v9;
            objc_super v13 = +[NSArray arrayWithObjects:&v23 count:1];
            __int16 v14 = [v9 callGroupUUID];
            [v3 setObject:v13 forKeyedSubscript:v14];
          }
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v19 objects:v24 count:16];
    }
    while (v6);
  }

  id v17 = [v3 copy];

  return v17;
}

- (CXCallSource)telephonyCallSource
{
  id v2 = [(CSDProviderCallDataSource *)self callSourceManager];
  unsigned __int8 v3 = [v2 callSourceWithIdentifier:@"com.apple.coretelephony"];

  return (CXCallSource *)v3;
}

- (id)_callWithUUID:(id)a3
{
  id v4 = [a3 UUIDString];
  id v5 = [(CSDCallDataSource *)self callWithUniqueProxyIdentifier:v4];

  return v5;
}

- (id)_relayCallWithUUID:(id)a3
{
  id v4 = a3;
  id v5 = [(CSDProviderCallDataSource *)self relayCallDataSource];
  id v6 = [v4 UUIDString];

  uint64_t v7 = [v5 callWithUniqueProxyIdentifier:v6];

  return v7;
}

- (id)_callWithUUID:(id)a3 backingCallSource:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v8 = [(CSDCallDataSource *)self calls];
  id v9 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v9)
  {
    id v10 = v9;
    id v11 = 0;
    uint64_t v12 = *(void *)v19;
    do
    {
      objc_super v13 = 0;
      __int16 v14 = v11;
      do
      {
        if (*(void *)v19 != v12) {
          objc_enumerationMutation(v8);
        }
        id v11 = *(id *)(*((void *)&v18 + 1) + 8 * (void)v13);

        unsigned int v15 = [v11 uniqueProxyIdentifierUUID];
        if ([v15 isEqual:v6])
        {
          id v16 = [v11 backingCallSource];

          if (v16 == v7) {
            goto LABEL_14;
          }
        }
        else
        {
        }
        objc_super v13 = (char *)v13 + 1;
        __int16 v14 = v11;
      }
      while (v10 != v13);
      id v10 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v10);
  }
  id v11 = 0;
LABEL_14:

  return v11;
}

- (id)_callWithUUID:(id)a3 controllableByCallSource:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v8 = [(CSDCallDataSource *)self calls];
  id v9 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v9)
  {
    id v10 = v9;
    id v11 = 0;
    uint64_t v12 = *(void *)v20;
    do
    {
      objc_super v13 = 0;
      __int16 v14 = v11;
      do
      {
        if (*(void *)v20 != v12) {
          objc_enumerationMutation(v8);
        }
        id v11 = *(id *)(*((void *)&v19 + 1) + 8 * (void)v13);

        id v15 = [v11 backingCallSource];
        if (v15 == v7)
        {
          id v16 = [v11 uniqueProxyIdentifierUUID];
          unsigned __int8 v17 = [v16 isEqual:v6];

          if (v17) {
            goto LABEL_13;
          }
        }
        else
        {
        }
        objc_super v13 = (char *)v13 + 1;
        __int16 v14 = v11;
      }
      while (v10 != v13);
      id v10 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v10);
  }
  id v11 = 0;
LABEL_13:

  return v11;
}

- (id)_callGroupsWithBackingCallSource:(id)a3
{
  id v4 = a3;
  id v5 = +[NSMutableArray array];
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v6 = [(CSDCallDataSource *)self calls];
  id v7 = [v6 countByEnumeratingWithState:&v30 objects:v36 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v31;
    do
    {
      id v10 = 0;
      do
      {
        if (*(void *)v31 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v30 + 1) + 8 * (void)v10);
        uint64_t v12 = [v11 callGroupUUID];
        if (v12) {
          goto LABEL_7;
        }
        id v13 = [v11 backingCallSource];

        if (v13 == v4)
        {
          v35 = v11;
          uint64_t v12 = +[NSArray arrayWithObjects:&v35 count:1];
          [v5 addObject:v12];
LABEL_7:
        }
        id v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v14 = [v6 countByEnumeratingWithState:&v30 objects:v36 count:16];
      id v8 = v14;
    }
    while (v14);
  }

  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v15 = [(CSDProviderCallDataSource *)self callGroupUUIDToCalls];
  id v16 = [v15 allValues];

  id v17 = [v16 countByEnumeratingWithState:&v26 objects:v34 count:16];
  if (v17)
  {
    id v18 = v17;
    uint64_t v19 = *(void *)v27;
    do
    {
      for (i = 0; i != v18; i = (char *)i + 1)
      {
        if (*(void *)v27 != v19) {
          objc_enumerationMutation(v16);
        }
        long long v21 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        long long v22 = [v21 firstObject];
        id v23 = [v22 backingCallSource];

        if (v23 == v4) {
          [v5 addObject:v21];
        }
      }
      id v18 = [v16 countByEnumeratingWithState:&v26 objects:v34 count:16];
    }
    while (v18);
  }

  id v24 = [v5 copy];

  return v24;
}

- (id)_providerForCallSource:(id)a3
{
  id v4 = a3;
  id v5 = [(CSDProviderCallDataSource *)self callProviderManager];
  id v6 = [v5 providersByIdentifierForRemoteClients:0];
  id v7 = [v4 identifier];

  id v8 = [v6 objectForKeyedSubscript:v7];

  return v8;
}

- (id)_localProviderForCallSource:(id)a3
{
  id v4 = a3;
  id v5 = [(CSDProviderCallDataSource *)self callProviderManager];
  id v6 = [v5 localProvidersByIdentifierForRemoteClients:0];
  id v7 = [v4 identifier];

  id v8 = [v6 objectForKeyedSubscript:v7];

  return v8;
}

- (id)_ISOCountryCodeForCall:(id)a3
{
  id v4 = a3;
  id v5 = [v4 provider];
  if ([v5 isFaceTimeProvider])
  {
    id v6 = [(CSDProviderCallDataSource *)self faceTimeProviderDelegate];
    id v7 = [v4 uniqueProxyIdentifierUUID];
    uint64_t v8 = [v6 ISOCountryCodeForCallWithUUID:v7];
    goto LABEL_6;
  }
  if ([v5 isTelephonyProvider])
  {
    id v6 = [v4 localSenderIdentityUUID];
    if (!v6)
    {
      uint64_t v9 = 0;
      goto LABEL_7;
    }
    id v7 = [(CSDProviderCallDataSource *)self coreTelephonyClient];
    uint64_t v8 = [v7 ISOCountryCodeForSubscriptionUUID:v6];
LABEL_6:
    uint64_t v9 = (void *)v8;

LABEL_7:
    goto LABEL_9;
  }
  uint64_t v9 = 0;
LABEL_9:

  return v9;
}

- (id)_ISOCountryCodeForCallWithUUID:(id)a3 provider:(id)a4 callUpdate:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v9 isFaceTimeProvider])
  {
    id v11 = [(CSDProviderCallDataSource *)self faceTimeProviderDelegate];
    uint64_t v12 = [v11 ISOCountryCodeForCallWithUUID:v8];
  }
  else
  {
    if (![v9 isTelephonyProvider])
    {
      uint64_t v12 = 0;
      goto LABEL_9;
    }
    id v11 = [v10 localSenderIdentityUUID];
    if (v11)
    {
      id v13 = [(CSDProviderCallDataSource *)self coreTelephonyClient];
      uint64_t v12 = [v13 ISOCountryCodeForSubscriptionUUID:v11];
    }
    else
    {
      uint64_t v12 = 0;
    }
  }

LABEL_9:

  return v12;
}

- (id)_identifiersForCalls:(id)a3
{
  id v3 = a3;
  id v4 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v3, "count"));
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "uniqueProxyIdentifier", (void)v12);
        [v4 addObject:v10];
      }
      id v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  return v4;
}

- (BOOL)_shouldBlockIfScreenSharing
{
  if (TUAllowCallsDuringScreenSharing())
  {
    LOBYTE(v3) = 0;
  }
  else
  {
    long long v10 = 0u;
    long long v11 = 0u;
    long long v8 = 0u;
    long long v9 = 0u;
    id v4 = [(CSDCallDataSource *)self calls];
    id v3 = [v4 countByEnumeratingWithState:&v8 objects:v12 count:16];
    if (v3)
    {
      uint64_t v5 = *(void *)v9;
      while (2)
      {
        for (i = 0; i != v3; i = (char *)i + 1)
        {
          if (*(void *)v9 != v5) {
            objc_enumerationMutation(v4);
          }
          if ([*(id *)(*((void *)&v8 + 1) + 8 * i) isSharingScreen])
          {
            LOBYTE(v3) = 1;
            goto LABEL_13;
          }
        }
        id v3 = [v4 countByEnumeratingWithState:&v8 objects:v12 count:16];
        if (v3) {
          continue;
        }
        break;
      }
    }
LABEL_13:
  }
  return (char)v3;
}

- (void)_deferCommittingTransactionsUntilAfterRunningBlock:(id)a3
{
  id v4 = (void (**)(void))a3;
  [(CSDProviderCallDataSource *)self setDeferCommittingTransactions:1];
  v4[2](v4);

  [(CSDProviderCallDataSource *)self setDeferCommittingTransactions:0];

  [(CSDProviderCallDataSource *)self _commitUncommittedTransactions];
}

- (void)_commitUncommittedTransactions
{
  id v2 = [(CSDProviderCallDataSource *)self callSourceManager];
  [v2 commitUncommittedTransactions];
}

- (BOOL)_allowRevertingStateForCompletedTransactionGroup:(id)a3
{
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v3 = objc_msgSend(a3, "allActions", 0);
  id v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v11;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        if ([*(id *)(*((void *)&v10 + 1) + 8 * i) state] == (id)1)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            BOOL v8 = 0;
            goto LABEL_12;
          }
        }
      }
      id v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  BOOL v8 = 1;
LABEL_12:

  return v8;
}

- (void)_endCall:(id)a3
{
  id v4 = a3;
  id v5 = sub_100008DCC();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = [v4 uniqueProxyIdentifier];
    int v10 = 138412290;
    long long v11 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[WARN] Ending mutually exclusive call with uPI %@ because we have a newer incoming call that can not co-exist with it.", (uint8_t *)&v10, 0xCu);
  }
  id v7 = objc_alloc((Class)CXEndCallAction);
  BOOL v8 = [v4 uniqueProxyIdentifierUUID];
  id v9 = [v7 initWithCallUUID:v8];

  [(CSDProviderCallDataSource *)self performCallAction:v9 forCall:v4];
}

- (id)_endMutuallyExclusiveCalls:(id)a3
{
  id v4 = a3;
  id v5 = sub_100008DCC();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v23 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "_endMutuallyExclusiveCalls: update=%@", buf, 0xCu);
  }

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v6 = [(CSDCallDataSource *)self calls];
  id v7 = [v6 countByEnumeratingWithState:&v18 objects:v26 count:16];
  if (!v7)
  {

    id v9 = 0;
LABEL_24:
    long long v15 = 0;
    goto LABEL_25;
  }
  id v8 = v7;
  id v9 = 0;
  uint64_t v10 = *(void *)v19;
  do
  {
    for (i = 0; i != v8; i = (char *)i + 1)
    {
      if (*(void *)v19 != v10) {
        objc_enumerationMutation(v6);
      }
      long long v12 = *(void **)(*((void *)&v18 + 1) + 8 * i);
      if ([v12 isMutuallyExclusiveCall])
      {
        if (v9)
        {
          long long v13 = sub_100008DCC();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            id v23 = v12;
            _os_log_error_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "Found multiple existing mutually exclusive calls.  Ending call %@", buf, 0xCu);
          }

          [(CSDProviderCallDataSource *)self _endCall:v12];
        }
        else
        {
          id v9 = v12;
        }
      }
    }
    id v8 = [v6 countByEnumeratingWithState:&v18 objects:v26 count:16];
  }
  while (v8);

  if (!v9)
  {
    long long v15 = 0;
    goto LABEL_25;
  }
  if (![v4 isMutuallyExclusiveCall])
  {
    [(CSDProviderCallDataSource *)self _endCall:v9];
    goto LABEL_24;
  }
  long long v14 = sub_100008DCC();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Ignoring mutually exclusive update", buf, 2u);
  }

  long long v15 = +[NSError cx_incomingCallErrorWithCode:102];
LABEL_25:
  id v16 = sub_100008DCC();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v23 = v9;
    __int16 v24 = 2112;
    id v25 = v15;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "_endMutuallyExclusiveCalls: mutuallyExclusiveCall=%@, error=%@", buf, 0x16u);
  }

  return v15;
}

- (void)_processCompletedCallAction:(id)a3 forCall:(id)a4 allowRevertingState:(BOOL)a5 isOnenessActive:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a4;
  long long v12 = [(CSDCallDataSource *)self callStateController];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v13 = v10;
    id v14 = [v13 state];
    long long v15 = sub_100008DCC();
    id v16 = v15;
    if (v14 == (id)1)
    {
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v75 = 138412290;
        *(void *)&v75[4] = v13;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Start call action fulfilled: %@", v75, 0xCu);
      }

      id v17 = [v13 dateStarted];
      [v11 setDateStartedOutgoing:v17];

      long long v18 = [v11 provider];
      unsigned int v19 = [v18 isTinCanProvider];

      if (v19) {
        [v11 setUnderlyingUplinkMuted:1];
      }
      goto LABEL_44;
    }
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_1003B1F34();
    }

    if (v6) {
      [v11 disconnectWithReason:51];
    }
    long long v21 = +[NSDate date];
    [v11 setDateEnded:v21];
LABEL_17:

LABEL_44:
    goto LABEL_108;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v13 = v10;
    if ([v13 state] != (id)1)
    {
      unsigned int v31 = [v11 faceTimeIDStatus];
      long long v32 = sub_100008DCC();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
        sub_1003B1F9C();
      }

      if (v31 == 1) {
        uint64_t v33 = 531;
      }
      else {
        uint64_t v33 = 508;
      }
      [v11 setProviderFailureReasonIfNecessary:v33];
      if (v6) {
        uint64_t v34 = 51;
      }
      else {
        uint64_t v34 = 14;
      }
      [v11 disconnectWithReason:v34];
      goto LABEL_44;
    }
    long long v20 = sub_100008DCC();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v75 = 138412290;
      *(void *)&v75[4] = v13;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Join call action fulfilled: %@", v75, 0xCu);
    }

    long long v21 = [v13 dateStarted];
    [v11 setDateStartedOutgoing:v21];
    goto LABEL_17;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v22 = v10;
    id v23 = [v22 state];
    __int16 v24 = sub_100008DCC();
    id v25 = v24;
    if (v23 == (id)1)
    {
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v75 = 138412290;
        *(void *)&v75[4] = v22;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Answer call action fulfilled: %@", v75, 0xCu);
      }

      long long v26 = [v22 dateConnected];
      [v11 setDateConnected:v26];

      long long v27 = [v11 provider];
      unsigned int v28 = [v27 isTinCanProvider];

      if (!v28) {
        goto LABEL_107;
      }
      long long v29 = v11;
      uint64_t v30 = 1;
      goto LABEL_24;
    }
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      sub_1003B2020();
    }

    __int16 v39 = v11;
    uint64_t v40 = 509;
LABEL_41:
    [v39 setProviderFailureReasonIfNecessary:v40];
    [v11 disconnectWithReason:14];
    goto LABEL_107;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v22 = v10;
    id v35 = [v22 state];
    int v36 = sub_100008DCC();
    int v37 = v36;
    if (v35 != (id)1)
    {
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
        sub_1003B2088();
      }

      [v11 setEndedReason:1];
      v44 = +[NSDate date];
      [v11 setDateEnded:v44];

      [v11 setProviderFailureReasonIfNecessary:520];
      goto LABEL_107;
    }
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v75 = 138412290;
      *(void *)&v75[4] = v22;
      _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "End call action fulfilled: %@", v75, 0xCu);
    }

    id v38 = [v22 dateEnded];
    [v11 setDateEnded:v38];
    goto LABEL_37;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v22 = v10;
    id v41 = [v22 state];
    id v42 = sub_100008DCC();
    uint64_t v43 = v42;
    if (v41 == (id)1)
    {
      if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v75 = 138412290;
        *(void *)&v75[4] = v22;
        _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_DEFAULT, "Set held call action fulfilled: %@", v75, 0xCu);
      }

      objc_msgSend(v11, "setHeld:", -[NSObject isOnHold](v22, "isOnHold"));
      goto LABEL_107;
    }
    if (!v7)
    {
      if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR)) {
        sub_1003B20F0();
      }

      __int16 v39 = v11;
      uint64_t v40 = 512;
      goto LABEL_41;
    }
    if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v75 = 138412290;
      *(void *)&v75[4] = v22;
      v52 = "[WARN] Set held call action failed but reverting state is allowed: %@";
LABEL_72:
      _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_DEFAULT, v52, v75, 0xCu);
      goto LABEL_73;
    }
    goto LABEL_73;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v22 = v10;
    if ([v22 state] == (id)1)
    {
      uint64_t v45 = [v22 callUUIDToGroupWith];

      if (v45)
      {
        v46 = [v22 callUUIDToGroupWith];
        v47 = [(CSDProviderCallDataSource *)self _callWithUUID:v46];

        uint64_t v48 = sub_100008DCC();
        v49 = v48;
        if (v47)
        {
          if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)v75 = 138412290;
            *(void *)&v75[4] = v22;
            _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_DEFAULT, "Set group call action fulfilled: %@", v75, 0xCu);
          }

          v50 = [v47 callGroupUUID];

          if (!v50)
          {
            v51 = +[NSUUID UUID];
            [v47 setCallGroupUUID:v51];
          }
          v49 = [v47 callGroupUUID];
          [v11 setCallGroupUUID:v49];
        }
        else if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
        {
          sub_1003B2158((uint64_t)v22, self);
        }
      }
      else
      {
        [v11 setCallGroupUUID:0];
      }
      goto LABEL_107;
    }
    id v56 = sub_100008DCC();
    uint64_t v43 = v56;
    if (!v7)
    {
      if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR)) {
        sub_1003B20F0();
      }

      __int16 v39 = v11;
      uint64_t v40 = 513;
      goto LABEL_41;
    }
    if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v75 = 138412290;
      *(void *)&v75[4] = v22;
      v52 = "[WARN] Set group call action failed but reverting state is allowed: %@";
      goto LABEL_72;
    }
LABEL_73:

    [v12 resetClientCallProvisionalStates];
    goto LABEL_107;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v22 = v10;
    id v53 = [v22 state];
    v54 = sub_100008DCC();
    v55 = v54;
    if (v53 == (id)1)
    {
      if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v75 = 138412290;
        *(void *)&v75[4] = v22;
        _os_log_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_DEFAULT, "Play DTMF call action fulfilled: %@", v75, 0xCu);
      }
    }
    else if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
    {
      sub_1003B21FC();
    }

    if ([v22 type] == (id)2 || [v22 type] == (id)3) {
      [v11 dequeueNextPauseDigits];
    }
    goto LABEL_107;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v22 = v10;
    id v57 = [v22 state];
    v58 = sub_100008DCC();
    id v38 = v58;
    if (v57 == (id)1)
    {
      if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v75 = 138412290;
        *(void *)&v75[4] = v22;
        _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, "Set sending video call action fulfilled: %@", v75, 0xCu);
      }

      objc_msgSend(v11, "setSendingVideo:", -[NSObject isSendingVideo](v22, "isSendingVideo"));
      goto LABEL_107;
    }
    if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR)) {
      sub_1003B2264();
    }
    goto LABEL_37;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v22 = v10;
    id v59 = [v22 state];
    v60 = sub_100008DCC();
    v61 = v60;
    if (v59 == (id)1)
    {
      if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v75 = 138412290;
        *(void *)&v75[4] = v22;
        _os_log_impl((void *)&_mh_execute_header, v61, OS_LOG_TYPE_DEFAULT, "Set muted call action fulfilled: %@", v75, 0xCu);
      }

      objc_msgSend(v11, "setUnderlyingUplinkMuted:bottomUpMute:", -[NSObject isMuted](v22, "isMuted"), -[NSObject isBottomUpMute](v22, "isBottomUpMute"));
      if ([v22 isMuted]) {
        [v11 setUplinkWasExplicitlyMuted:1];
      }
      goto LABEL_107;
    }
    if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR)) {
      sub_1003B22CC();
    }

    if ([v22 isBottomUpMute]) {
      goto LABEL_107;
    }
    uint64_t v30 = [v22 isMuted] ^ 1;
    long long v29 = v11;
LABEL_24:
    [v29 setUnderlyingUplinkMuted:v30];
LABEL_107:

    goto LABEL_108;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v22 = v10;
    id v62 = [v22 state];
    v63 = sub_100008DCC();
    id v38 = v63;
    if (v62 == (id)1)
    {
      if (os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v75 = 138412290;
        *(void *)&v75[4] = v22;
        _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, "Set tty call action fulfilled: %@", v75, 0xCu);
      }

      objc_msgSend(v11, "setTtyType:", sub_1000BF250((uint64_t)-[NSObject ttyType](v22, "ttyType")));
      goto LABEL_107;
    }
    if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR)) {
      sub_1003B2390();
    }
    goto LABEL_37;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v22 = v10;
      id v69 = [v22 state];
      v70 = sub_100008DCC();
      id v38 = v70;
      if (v69 == (id)1)
      {
        if (os_log_type_enabled(v70, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v75 = 138412290;
          *(void *)&v75[4] = v22;
          _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, "Set screening call action fulfilled: %@", v75, 0xCu);
        }

        objc_msgSend(v11, "setScreening:", -[NSObject isScreening](v22, "isScreening"));
        goto LABEL_107;
      }
      if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR)) {
        sub_1003B23F8();
      }
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        id v73 = [v10 state];
        v74 = sub_100008DCC();
        long long v22 = v74;
        if (v73 == (id)1)
        {
          if (os_log_type_enabled(v74, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)v75 = 138412290;
            *(void *)&v75[4] = v10;
            _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Action fulfilled: %@", v75, 0xCu);
          }
        }
        else if (os_log_type_enabled(v74, OS_LOG_TYPE_ERROR))
        {
          sub_1003B24C8();
        }
        goto LABEL_107;
      }
      long long v22 = v10;
      id v71 = [v22 state];
      id v72 = sub_100008DCC();
      id v38 = v72;
      if (v71 == (id)1)
      {
        if (os_log_type_enabled(v72, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v75 = 138412290;
          *(void *)&v75[4] = v22;
          _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, "Allow audio injection action fulfilled: %@", v75, 0xCu);
        }

        objc_msgSend(v11, "setInjectingAudio:", -[NSObject willInject](v22, "willInject"));
        goto LABEL_107;
      }
      if (os_log_type_enabled(v72, OS_LOG_TYPE_ERROR)) {
        sub_1003B2460();
      }
    }
LABEL_37:

    goto LABEL_107;
  }
  if ([v10 state] == (id)2)
  {
    v65 = sub_100008DCC();
    if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v75 = 138412290;
      *(void *)&v75[4] = v10;
      _os_log_impl((void *)&_mh_execute_header, v65, OS_LOG_TYPE_DEFAULT, "Set relaying call action failed: %@", v75, 0xCu);
    }

    v66 = [v11 provider];
    unsigned int v67 = [v66 isTinCanProvider];

    if (v67)
    {
      v68 = sub_100008DCC();
      if (os_log_type_enabled(v68, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v75 = 138412290;
        *(void *)&v75[4] = v10;
        _os_log_impl((void *)&_mh_execute_header, v68, OS_LOG_TYPE_DEFAULT, "[WARN] Set relaying call action failed: %@", v75, 0xCu);
      }

      [v11 setProviderFailureReasonIfNecessary:514];
      [v11 disconnectWithReason:14];
    }
  }
LABEL_108:
  if (objc_msgSend(v10, "state", *(_OWORD *)v75) == (id)2)
  {
    id v64 = +[CSDReportingController sharedInstance];
    [v64 reportProviderFailedWithAction:v10 forCall:v11];
  }
}

- (BOOL)_actionRequiresReasonableUserIntent:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_opt_class();
  id v5 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v4, objc_opt_class(), 0);
  uint64_t v6 = objc_opt_class();

  LOBYTE(v6) = [v5 containsObject:v6];
  return v6;
}

- (BOOL)_shouldAllowRequestedAction:(id)a3 forCallSource:(id)a4 shouldValidateUserIntent:(BOOL)a5 error:(id *)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a4;
  long long v12 = [(CSDProviderCallDataSource *)self _providerForCallSource:v11];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v13 = v10;
    id v14 = [v13 callUUID];
    long long v15 = [(CSDProviderCallDataSource *)self _callWithUUID:v14 controllableByCallSource:v11];

    id v16 = [v13 callUUID];
    id v17 = [(CSDProviderCallDataSource *)self _callWithUUID:v16];

    long long v18 = [v13 callUUID];
    uint64_t v58 = [(CSDProviderCallDataSource *)self _relayCallWithUUID:v18];

    if (-[CSDProviderCallDataSource _actionRequiresReasonableUserIntent:](self, "_actionRequiresReasonableUserIntent:", v13)&& v7&& (-[CSDProviderCallDataSource callProviderManager](self, "callProviderManager"), unsigned int v19 = objc_claimAutoreleasedReturnValue(), v20 = [v19 validateUserIntentForCallSource:v11], v19, (v20 & 1) == 0))
    {
      uint64_t v40 = sub_100008DCC();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v41 = objc_opt_class();
        id v42 = [v11 identifier];
        *(_DWORD *)buf = 138412546;
        uint64_t v60 = v41;
        __int16 v61 = 2112;
        id v62 = v42;
        _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, "[WARN] Not allowing requested %@ because user intent could not be validated for call source with identifier: %@", buf, 0x16u);
      }
      +[CSDCrashReporter simulateCrashReportFromPID:withKillCode:usingReasonWithFormat:](CSDCrashReporter, "simulateCrashReportFromPID:withKillCode:usingReasonWithFormat:", [v11 processIdentifier], 3735931409, @"Not allowing requested %@ because user intent could not be reasonably validated to gain access to the microphone while in the background.", objc_opt_class());
      uint64_t v43 = 6;
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        unint64_t v55 = (unint64_t)v17;
        id v56 = a6;
        id v57 = [(CSDProviderCallDataSource *)self _callGroupsWithBackingCallSource:v11];
        long long v21 = [(CSDCallDataSource *)self callStateController];
        long long v22 = [v21 featureFlags];
        if ([v22 appProtectionEnabled])
        {
          id v23 = [(CSDProviderCallDataSource *)self protectedAppsUtilities];
          __int16 v24 = v12;
          [v12 bundleIdentifier];
          long long v26 = v25 = v15;
          unsigned int v27 = [v23 shouldBlockCallWithBundleIdentifier:v26];

          long long v15 = v25;
          if (v27)
          {
            unsigned int v28 = sub_100008DCC();
            long long v29 = (void *)v58;
            if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
            {
              long long v12 = v24;
              uint64_t v30 = [v24 bundleIdentifier];
              *(_DWORD *)buf = 138412290;
              uint64_t v60 = (uint64_t)v30;
              _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "[WARN] Blocking outgoing call because the originating app [Bundle Identifier: %@] responsible for the call is hidden and currently not foregrounded", buf, 0xCu);

              uint64_t v31 = 8;
            }
            else
            {
              uint64_t v31 = 8;
              long long v12 = v24;
            }
            id v17 = (void *)v55;
            a6 = v56;
            goto LABEL_49;
          }
        }
        else
        {
          __int16 v24 = v12;
        }
        id v17 = (void *)v55;
        long long v29 = (void *)v58;
        if (v55 | v58)
        {
          unsigned int v28 = sub_100008DCC();
          long long v12 = v24;
          if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            uint64_t v60 = v55;
            __int16 v61 = 2112;
            id v62 = (id)v58;
            _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "[WARN] Not allowing requested start call action because a call with same UUID already exists callWithUUID: %@, relayCallWithUUID: %@", buf, 0x16u);
          }
          uint64_t v31 = 5;
        }
        else
        {
          id v44 = [v57 count];
          long long v12 = v24;
          if (v44 < [v24 maximumCallGroups])
          {
            uint64_t v34 = 0;
            a6 = v56;
LABEL_50:

            goto LABEL_56;
          }
          unsigned int v28 = sub_100008DCC();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412802;
            uint64_t v60 = (uint64_t)v11;
            __int16 v61 = 2048;
            id v62 = [v24 maximumCallGroups];
            __int16 v63 = 2112;
            id v64 = v57;
            _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "[WARN] Not allowing requested start call action because call source %@ is at the maximum call group count of %lu: %@", buf, 0x20u);
          }
          uint64_t v31 = 7;
        }
        a6 = v56;
LABEL_49:

        uint64_t v34 = +[NSError cx_requestTransactionErrorWithCode:v31];
        goto LABEL_50;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        int v36 = [v13 callUUIDToGroupWith];

        if (v36)
        {
          int v37 = [v13 callUUIDToGroupWith];
          id v38 = [(CSDProviderCallDataSource *)self _callWithUUID:v37 controllableByCallSource:v11];

          if (v38)
          {
            uint64_t v34 = 0;
          }
          else
          {
            v50 = sub_100008DCC();
            if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
            {
              [(CSDCallDataSource *)self calls];
              v51 = v17;
              id v53 = v52 = v15;
              *(_DWORD *)buf = 138412802;
              uint64_t v60 = (uint64_t)v13;
              __int16 v61 = 2112;
              id v62 = v11;
              __int16 v63 = 2112;
              id v64 = v53;
              _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_DEFAULT, "[WARN] Not allowing requested action because no call was found to group with for action %@ and call source %@. All calls: %@", buf, 0x20u);

              long long v15 = v52;
              id v17 = v51;
            }

            uint64_t v34 = +[NSError cx_requestTransactionErrorWithCode:4];
          }

          goto LABEL_55;
        }
      }
      objc_opt_class();
      long long v29 = (void *)v58;
      if ((objc_opt_isKindOfClass() & 1) != 0 && v58)
      {
        __int16 v39 = sub_100008DCC();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v60 = (uint64_t)v17;
          _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "[WARN] Not allowing requested answer call action because a relay call with same UUID already exists: %@", buf, 0xCu);
        }

        uint64_t v34 = +[NSError cx_requestTransactionErrorWithCode:5];
LABEL_56:

        if (a6) {
          goto LABEL_57;
        }
        goto LABEL_58;
      }
      if (v15)
      {
        uint64_t v34 = 0;
        goto LABEL_56;
      }
      uint64_t v45 = sub_100008DCC();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
      {
        v46 = [v13 callUUID];
        v47 = [v46 UUIDString];
        [(CSDCallDataSource *)self calls];
        v49 = uint64_t v48 = v17;
        *(_DWORD *)buf = 138412802;
        uint64_t v60 = (uint64_t)v47;
        __int16 v61 = 2112;
        id v62 = v11;
        __int16 v63 = 2112;
        id v64 = v49;
        _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_DEFAULT, "[WARN] Not allowing requested action because no call was found for call UUID %@ and call source %@. All calls: %@", buf, 0x20u);

        id v17 = v48;
        long long v15 = 0;
      }
      uint64_t v43 = 4;
    }
    uint64_t v34 = +[NSError cx_requestTransactionErrorWithCode:v43];
LABEL_55:
    long long v29 = (void *)v58;
    goto LABEL_56;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v32 = [v11 identifier];
    unsigned __int8 v33 = [v32 isEqualToString:@"com.apple.coretelephony"];

    if (v33)
    {
      uint64_t v34 = 0;
      if (!a6) {
        goto LABEL_58;
      }
      goto LABEL_57;
    }
  }
  id v35 = sub_100008DCC();
  if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v60 = (uint64_t)v10;
    _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "[WARN] Not allowing requested action because action is not allowed to be requested: %@", buf, 0xCu);
  }

  uint64_t v34 = +[NSError cx_requestTransactionErrorWithCode:6];
  if (a6) {
LABEL_57:
  }
    *a6 = v34;
LABEL_58:

  return v34 == 0;
}

- (BOOL)_shouldAllowRequestedTransaction:(id)a3 forCallSource:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = [v8 actions];
  id v11 = [v10 count];

  if (v11)
  {
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v12 = [v8 actions];
    id v13 = [v12 countByEnumeratingWithState:&v23 objects:v29 count:16];
    if (v13)
    {
      id v14 = v13;
      uint64_t v15 = *(void *)v24;
      while (2)
      {
        id v16 = 0;
        do
        {
          if (*(void *)v24 != v15) {
            objc_enumerationMutation(v12);
          }
          uint64_t v17 = *(void *)(*((void *)&v23 + 1) + 8 * (void)v16);
          id v22 = 0;
          [(CSDProviderCallDataSource *)self _shouldAllowRequestedAction:v17 forCallSource:v9 shouldValidateUserIntent:1 error:&v22];
          id v18 = v22;
          if (v18)
          {
            unsigned int v19 = v18;
            goto LABEL_12;
          }
          id v16 = (char *)v16 + 1;
        }
        while (v14 != v16);
        id v14 = [v12 countByEnumeratingWithState:&v23 objects:v29 count:16];
        if (v14) {
          continue;
        }
        break;
      }
    }
    unsigned int v19 = 0;
LABEL_12:

    if (a5) {
      goto LABEL_13;
    }
  }
  else
  {
    long long v21 = sub_100008DCC();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v28 = v8;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "[WARN] Not allowing requested transaction because it is empty: %@", buf, 0xCu);
    }

    unsigned int v19 = +[NSError cx_requestTransactionErrorWithCode:3];
    if (a5) {
LABEL_13:
    }
      *a5 = v19;
  }

  return v19 == 0;
}

- (void)_processRequestedTransaction:(id)a3 fromCallSource:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v15 = 0;
  id v10 = (void (**)(id, id))a5;
  unsigned int v11 = [(CSDProviderCallDataSource *)self _shouldAllowRequestedTransaction:v8 forCallSource:v9 error:&v15];
  id v12 = v15;
  id v13 = sub_100008DCC();
  BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
  if (v11)
  {
    if (v14)
    {
      *(_DWORD *)buf = 138412290;
      id v17 = v8;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Allowing requested transaction: %@", buf, 0xCu);
    }

    [(CSDProviderCallDataSource *)self _performRequestedTransaction:v8 onCallSource:v9];
  }
  else
  {
    if (v14)
    {
      *(_DWORD *)buf = 138412290;
      id v17 = v8;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "[WARN] Not allowing requested transaction: %@", buf, 0xCu);
    }
  }
  v10[2](v10, v12);
}

- (void)_performRequestedTransaction:(id)a3 onCallSource:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(CSDCallDataSource *)self callStateController];
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v29 = v6;
  id v9 = [v6 actions];
  id v10 = [v9 countByEnumeratingWithState:&v35 objects:v42 count:16];
  uint64_t v30 = v7;
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v36;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v36 != v12) {
          objc_enumerationMutation(v9);
        }
        BOOL v14 = *(void **)(*((void *)&v35 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v15 = sub_100008DCC();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v41 = v14;
            _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Dialing new call due to requested start call action: %@", buf, 0xCu);
          }

          id v16 = v14;
          id v17 = [[CSDProviderCall alloc] initOutgoingWithRequestedStartCallAction:v16 backingCallSource:v30];

          [v8 setCallDelegatesIfNeeded:v17];
          [v8 propertiesChangedForCall:v17];
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0) {
            continue;
          }
          id v18 = v14;
          unsigned int v19 = [v18 callUUID];
          id v17 = [(CSDProviderCallDataSource *)self _callWithUUID:v19 backingCallSource:v30];

          uint64_t v20 = [v17 backingCallSource];

          id v7 = (id)v20;
        }
      }
      id v11 = [v9 countByEnumeratingWithState:&v35 objects:v42 count:16];
    }
    while (v11);
  }

  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v21 = [v29 actions];
  id v22 = [v21 countByEnumeratingWithState:&v31 objects:v39 count:16];
  if (v22)
  {
    id v23 = v22;
    uint64_t v24 = *(void *)v32;
    do
    {
      for (j = 0; j != v23; j = (char *)j + 1)
      {
        if (*(void *)v32 != v24) {
          objc_enumerationMutation(v21);
        }
        uint64_t v26 = *(void *)(*((void *)&v31 + 1) + 8 * (void)j);
        unsigned int v27 = [(CSDProviderCallDataSource *)self callSourceManager];
        [v27 addAction:v26 toUncommittedTransactionForCallSource:v7];
      }
      id v23 = [v21 countByEnumeratingWithState:&v31 objects:v39 count:16];
    }
    while (v23);
  }

  [(CSDProviderCallDataSource *)self _addSupplementalActionsForRequestedTransaction:v29 onCallSource:v7];
  id v28 = [(CSDProviderCallDataSource *)self callSourceManager];
  [v28 commitUncommittedTransactions];
}

- (void)_addSupplementalActionsForRequestedTransaction:(id)a3 onCallSource:(id)a4
{
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id obj = [a3 actions];
  id v4 = [obj countByEnumeratingWithState:&v35 objects:v42 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v36;
    uint64_t v26 = *(void *)v36;
    do
    {
      id v7 = 0;
      id v27 = v5;
      do
      {
        if (*(void *)v36 != v6) {
          objc_enumerationMutation(obj);
        }
        id v8 = *(void **)(*((void *)&v35 + 1) + 8 * (void)v7);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v9 = v8;
          id v10 = [v9 callUUID];
          id v11 = [(CSDProviderCallDataSource *)self _callWithUUID:v10];

          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0
            || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
            || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
            && ([v9 isOnHold] & 1) == 0)
          {
            long long v29 = v7;
            long long v33 = 0u;
            long long v34 = 0u;
            long long v31 = 0u;
            long long v32 = 0u;
            uint64_t v12 = [(CSDCallDataSource *)self calls];
            id v13 = [v12 countByEnumeratingWithState:&v31 objects:v41 count:16];
            if (!v13) {
              goto LABEL_28;
            }
            id v14 = v13;
            uint64_t v15 = *(void *)v32;
            while (1)
            {
              for (i = 0; i != v14; i = (char *)i + 1)
              {
                if (*(void *)v32 != v15) {
                  objc_enumerationMutation(v12);
                }
                id v17 = *(void **)(*((void *)&v31 + 1) + 8 * i);
                if (v17 != v11)
                {
                  id v18 = [*(id *)(*((void *)&v31 + 1) + 8 * i) provider];
                  unsigned int v19 = [v11 provider];
                  if (([v18 isEqualToCallProvider:v19] & 1) == 0
                    && ([v17 isOnHold] & 1) == 0)
                  {
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) == 0
                      || ([v11 isVideoUpgradeFromCall:v17] & 1) == 0)
                    {
                      unsigned __int8 v20 = [v17 isPTT];

                      if (v20) {
                        continue;
                      }
                      id v21 = objc_alloc((Class)CXSetHeldCallAction);
                      id v22 = [v17 uniqueProxyIdentifierUUID];
                      id v18 = [v21 initWithCallUUID:v22 onHold:1];

                      id v23 = sub_100008DCC();
                      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
                      {
                        *(_DWORD *)buf = 138412290;
                        uint64_t v40 = v17;
                        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Adding supplemental set held call action for existing call %@", buf, 0xCu);
                      }

                      unsigned int v19 = [(CSDProviderCallDataSource *)self callSourceManager];
                      uint64_t v24 = [v17 backingCallSource];
                      [v19 addAction:v18 toUncommittedTransactionForCallSource:v24];
                    }
                  }
                }
              }
              id v14 = [v12 countByEnumeratingWithState:&v31 objects:v41 count:16];
              if (!v14)
              {
LABEL_28:

                long long v25 = [(CSDCallDataSource *)self callStateController];
                [v25 deactivatePTTBargeCalls];

                uint64_t v6 = v26;
                id v5 = v27;
                id v7 = v29;
                break;
              }
            }
          }
        }
        id v7 = (char *)v7 + 1;
      }
      while (v7 != v5);
      id v5 = [obj countByEnumeratingWithState:&v35 objects:v42 count:16];
    }
    while (v5);
  }
}

- (void)answerCall:(id)a3 withRequest:(id)a4 whileDisconnectingCalls:(id)a5 andHoldingCalls:(id)a6
{
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1001DD3EC;
  v14[3] = &unk_1005053A8;
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  unsigned int v19 = self;
  id v10 = v18;
  id v11 = v17;
  id v12 = v16;
  id v13 = v15;
  [(CSDProviderCallDataSource *)self _deferCommittingTransactionsUntilAfterRunningBlock:v14];
}

- (void)holdCalls:(id)a3 whileUnholdingCalls:(id)a4
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1001DD4F0;
  v8[3] = &unk_100504FE0;
  id v9 = a3;
  id v10 = a4;
  id v11 = self;
  id v6 = v10;
  id v7 = v9;
  [(CSDProviderCallDataSource *)self _deferCommittingTransactionsUntilAfterRunningBlock:v8];
}

- (void)groupCalls:(id)a3 withCalls:(id)a4
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1001DD5F0;
  v8[3] = &unk_100504FE0;
  id v9 = a3;
  id v10 = a4;
  id v11 = self;
  id v6 = v10;
  id v7 = v9;
  [(CSDProviderCallDataSource *)self _deferCommittingTransactionsUntilAfterRunningBlock:v8];
}

- (void)ungroupCall:(id)a3 fromOtherCallsInGroup:(id)a4
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1001DD6F0;
  v8[3] = &unk_100504FE0;
  id v9 = a3;
  id v10 = a4;
  id v11 = self;
  id v6 = v10;
  id v7 = v9;
  [(CSDProviderCallDataSource *)self _deferCommittingTransactionsUntilAfterRunningBlock:v8];
}

- (void)disconnectCalls:(id)a3 whileHoldingCalls:(id)a4 andUnholdingCalls:(id)a5 andUngroupingCalls:(id)a6
{
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1001DD83C;
  v14[3] = &unk_1005053A8;
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  unsigned int v19 = self;
  id v10 = v18;
  id v11 = v17;
  id v12 = v16;
  id v13 = v15;
  [(CSDProviderCallDataSource *)self _deferCommittingTransactionsUntilAfterRunningBlock:v14];
}

- (void)setUplinkMuted:(BOOL)a3 forCalls:(id)a4
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1001DD91C;
  v6[3] = &unk_1005050D0;
  BOOL v9 = a3;
  id v7 = a4;
  id v8 = self;
  id v5 = v7;
  [(CSDProviderCallDataSource *)self _deferCommittingTransactionsUntilAfterRunningBlock:v6];
}

- (void)setTTYType:(int)a3 forCalls:(id)a4
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1001DD9F8;
  v6[3] = &unk_100507B08;
  int v9 = a3;
  id v7 = a4;
  id v8 = self;
  id v5 = v7;
  [(CSDProviderCallDataSource *)self _deferCommittingTransactionsUntilAfterRunningBlock:v6];
}

- (void)sendMMIOrUSSDCodeWithRequest:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1001DDACC;
  v4[3] = &unk_100504F10;
  id v5 = self;
  id v6 = a3;
  id v3 = v6;
  [(CSDProviderCallDataSource *)v5 _deferCommittingTransactionsUntilAfterRunningBlock:v4];
}

- (void)pullCallWithHandoffActivityUserInfo:(id)a3 completion:(id)a4
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1001DDCB8;
  v8[3] = &unk_100505EA0;
  id v9 = a3;
  id v10 = self;
  id v11 = a4;
  id v6 = v11;
  id v7 = v9;
  [(CSDProviderCallDataSource *)self _deferCommittingTransactionsUntilAfterRunningBlock:v8];
}

- (id)callSourceForDialRequest:(id)a3
{
  id v4 = a3;
  id v5 = [v4 provider];
  unsigned int v6 = [v5 isTelephonyProvider];

  if (v6)
  {
    uint64_t v7 = [(CSDProviderCallDataSource *)self telephonyCallSource];
LABEL_9:
    id v14 = (void *)v7;
    goto LABEL_10;
  }
  id v8 = [v4 provider];
  unsigned int v9 = [v8 isFaceTimeProvider];

  if (v9)
  {
    uint64_t v7 = [(CSDProviderCallDataSource *)self faceTimeCallSource];
    goto LABEL_9;
  }
  id v10 = [v4 provider];
  unsigned int v11 = [v10 isTinCanProvider];

  if (v11)
  {
    uint64_t v7 = [(CSDProviderCallDataSource *)self tinCanCallSource];
    goto LABEL_9;
  }
  id v12 = [v4 provider];
  unsigned int v13 = [v12 isSuperboxProvider];

  if (v13)
  {
    uint64_t v7 = [(CSDProviderCallDataSource *)self superboxCallSource];
    goto LABEL_9;
  }
  id v16 = sub_100008DCC();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    id v17 = [(CSDProviderCallDataSource *)self callSourceManager];
    id v18 = [v17 callSources];
    int v19 = 138412546;
    id v20 = v4;
    __int16 v21 = 2112;
    id v22 = v18;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "[WARN] Could not determine call source for dial request: %@. All call sources: %@", (uint8_t *)&v19, 0x16u);
  }
  id v14 = 0;
LABEL_10:

  return v14;
}

- (id)providerWithIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(CSDProviderCallDataSource *)self callProviderManager];
  unsigned int v6 = [v5 providersByIdentifierForRemoteClients:0];
  uint64_t v7 = [v6 objectForKeyedSubscript:v4];

  return v7;
}

- (void)performCallAction:(id)a3 forCall:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = sub_100008DCC();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v18 = 138412546;
    id v19 = v6;
    __int16 v20 = 2112;
    id v21 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Asked to perform action %@ for call %@", (uint8_t *)&v18, 0x16u);
  }

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [(CSDProviderCallDataSource *)self holdOrEndOtherCallsBecauseCallWillBeginOutgoing:v7];
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_12;
    }
  }
  if ([v7 isIncoming]) {
    goto LABEL_12;
  }
  unsigned int v9 = [(CSDCallDataSource *)self callStateController];
  id v10 = [v9 callCenter];
  unsigned int v11 = [v10 isOnenessActiveBlock];
  int v12 = v11[2]();

  if (v12)
  {
    unsigned int v13 = sub_100008DCC();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      int v18 = 138412290;
      id v19 = v6;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Failing join call action %@ since device has active oneness session", (uint8_t *)&v18, 0xCu);
    }

    [v6 fail];
    [(CSDProviderCallDataSource *)self _processCompletedCallAction:v6 forCall:v7 allowRevertingState:0 isOnenessActive:1];
  }
  else
  {
LABEL_12:
    id v14 = [v7 backingCallSource];

    if (v14)
    {
      id v15 = [(CSDProviderCallDataSource *)self callSourceManager];
      id v16 = [v7 backingCallSource];
      [v15 addAction:v6 toUncommittedTransactionForCallSource:v16];

      if (![(CSDProviderCallDataSource *)self deferCommittingTransactions]) {
        [(CSDProviderCallDataSource *)self _commitUncommittedTransactions];
      }
    }
    else
    {
      id v17 = sub_100008DCC();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v18) = 0;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "[WARN] Dropping to add action since there is no backing call source", (uint8_t *)&v18, 2u);
      }
    }
  }
}

- (void)performCallActions:(id)a3 forCall:(id)a4
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1001DE450;
  v8[3] = &unk_100504FE0;
  id v9 = a3;
  id v10 = self;
  id v11 = a4;
  id v6 = v11;
  id v7 = v9;
  [(CSDProviderCallDataSource *)self _deferCommittingTransactionsUntilAfterRunningBlock:v8];
}

- (void)holdOrEndOtherCallsBecauseCallWillBeginOutgoing:(id)a3
{
  id v3 = a3;
  [v3 callCenter];
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v38 = v50 = 0u;
  id obj = [v38 currentCallGroups];
  id v4 = [obj countByEnumeratingWithState:&v47 objects:v60 count:16];
  if (v4)
  {
    id v5 = v4;
    unint64_t v6 = 0;
    uint64_t v7 = *(void *)v48;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v48 != v7) {
          objc_enumerationMutation(obj);
        }
        id v9 = [*(id *)(*((void *)&v47 + 1) + 8 * i) calls];
        id v10 = [v9 firstObject];
        id v11 = [v10 provider];
        int v12 = [v3 provider];
        unsigned int v13 = [v11 isEqualToCallProvider:v12];

        v6 += v13;
      }
      id v5 = [obj countByEnumeratingWithState:&v47 objects:v60 count:16];
    }
    while (v5);
  }
  else
  {
    unint64_t v6 = 0;
  }

  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id v14 = [(CSDCallDataSource *)self calls];
  id v15 = [v14 countByEnumeratingWithState:&v43 objects:v59 count:16];
  if (v15)
  {
    id v16 = v15;
    uint64_t v17 = *(void *)v44;
    id obja = v14;
    do
    {
      for (j = 0; j != v16; j = (char *)j + 1)
      {
        if (*(void *)v44 != v17) {
          objc_enumerationMutation(v14);
        }
        id v19 = *(id *)(*((void *)&v43 + 1) + 8 * (void)j);
        if (v19 != v3
          && ([*(id *)(*((void *)&v43 + 1) + 8 * (void)j) isOnHold] & 1) == 0
          && [v19 status] == 1
          && ([v3 isVideoUpgradeFromCall:v19] & 1) == 0
          && ([v19 isPTT] & 1) == 0)
        {
          __int16 v20 = [v19 provider];
          id v21 = [v3 provider];
          unsigned int v22 = [v20 isEqualToCallProvider:v21];

          if (v22)
          {
            id v23 = [v3 provider];
            BOOL v24 = v6 >= (unint64_t)[v23 maximumCallGroups];
          }
          else
          {
            BOOL v24 = 0;
          }
          if (([v19 isScreening] & 1) != 0
            || (([v19 isMutuallyExclusiveCall] | v24) & 1) != 0
            || ([v19 model],
                long long v25 = objc_claimAutoreleasedReturnValue(),
                unsigned int v26 = [v25 supportsHolding],
                v25,
                !v26))
          {
            id v30 = objc_alloc((Class)CXEndCallAction);
            id v28 = [v19 uniqueProxyIdentifierUUID];
            id v29 = [v30 initWithCallUUID:v28];
          }
          else
          {
            id v27 = objc_alloc((Class)CXSetHeldCallAction);
            id v28 = [v19 uniqueProxyIdentifierUUID];
            id v29 = [v27 initWithCallUUID:v28 onHold:1];
          }
          long long v31 = v29;

          long long v32 = sub_100008DCC();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
          {
            long long v33 = [v19 uniqueProxyIdentifierUUID];
            [v19 model];
            long long v34 = v39 = v24;
            unsigned int v35 = [v34 supportsHolding];
            *(_DWORD *)buf = 138413058;
            v52 = v31;
            __int16 v53 = 2112;
            v54 = v33;
            __int16 v55 = 1024;
            BOOL v56 = v39;
            __int16 v57 = 1024;
            unsigned int v58 = v35;
            _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "Sending action %@ for existing call with uniqueProxyIdentifierUUID=%@ maximumCallGroupsReachedForProvider=%d supportsHolding=%d", buf, 0x22u);
          }
          long long v36 = [(CSDProviderCallDataSource *)self callSourceManager];
          long long v37 = [v19 backingCallSource];
          [v36 addAction:v31 toUncommittedTransactionForCallSource:v37];

          id v14 = obja;
        }
      }
      id v16 = [v14 countByEnumeratingWithState:&v43 objects:v59 count:16];
    }
    while (v16);
  }
}

- (void)performStartCallAction:(id)a3 forCall:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [(CSDProviderCallDataSource *)self holdOrEndOtherCallsBecauseCallWillBeginOutgoing:v7];
  id v8 = [(CSDCallDataSource *)self callStateController];
  [v8 deactivatePTTBargeCalls];

  id v9 = [v7 isoCountryCode];

  if (!v9)
  {
    id v10 = [(CSDProviderCallDataSource *)self _ISOCountryCodeForCall:v7];
    if ([v10 length])
    {
      id v11 = objc_alloc_init((Class)CXCallUpdate);
      [v11 setISOCountryCode:v10];
      [v7 updateWithCallUpdate:v11];
    }
  }
  int v12 = sub_100008DCC();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 138412546;
    id v14 = v6;
    __int16 v15 = 2112;
    id v16 = v7;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Asked to perform start call action %@ for call %@", (uint8_t *)&v13, 0x16u);
  }

  [(CSDProviderCallDataSource *)self performCallAction:v6 forCall:v7];
}

- (void)callSource:(id)a3 registeredWithConfiguration:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = sub_100008DCC();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v20 = 138412546;
    id v21 = v6;
    __int16 v22 = 2112;
    id v23 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Call source %@ registered with configuration %@", (uint8_t *)&v20, 0x16u);
  }

  id v9 = [objc_alloc((Class)TUCallProvider) initWithCallSource:v6 configuration:v7];
  id v10 = [v6 identifier];
  unsigned int v11 = [v10 isEqualToString:@"com.apple.coretelephony"];

  if (v11)
  {
    [v9 setBundleIdentifier:TUBundleIdentifierPhoneApplication];
    int v12 = [v9 localizedName];
    if (v12)
    {
      [v9 setLocalizedName:v12];
    }
    else
    {
      int v13 = TUBundle();
      id v14 = [v13 localizedStringForKey:@"PHONE" value:&stru_100517F40 table:@"TelephonyUtilities"];
      [v9 setLocalizedName:v14];
    }
  }
  __int16 v15 = [(CSDProviderCallDataSource *)self callProviderManager];
  [v15 registerLocalProvider:v9];

  id v16 = [v6 identifier];
  unsigned int v17 = [v16 isEqualToString:@"com.apple.coretelephony"];

  if (v17)
  {
    int v18 = [(CSDProviderCallDataSource *)self faceTimeProviderDelegate];
    id v19 = [v7 prioritizedSenderIdentities];
    [v18 updateProviderConfigurationWithSenderIdentities:v19];
  }
}

- (BOOL)callSource:(id)a3 shouldProcessAction:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v14 = 0;
  BOOL v10 = [(CSDProviderCallDataSource *)self _shouldAllowRequestedAction:v9 forCallSource:v8 shouldValidateUserIntent:0 error:&v14];
  id v11 = v14;
  if (v11)
  {
    int v12 = sub_100008DCC();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_1003B25A0();
    }
  }
  if (a5) {
    *a5 = v11;
  }

  return v10;
}

- (void)updateFilteredOutReasonForCall:(id)a3 WithError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (!v7) {
    goto LABEL_17;
  }
  if ([v7 code] == (id)4)
  {
    if (![v6 filteredOutReason])
    {
      id v9 = v6;
      uint64_t v10 = 1;
LABEL_13:
      [v9 setFilteredOutReason:v10];
    }
  }
  else if ([v8 code] == (id)3)
  {
    if (![v6 filteredOutReason])
    {
      id v11 = [(CSDProviderCallDataSource *)self callDirectoryAllowsCallFromSourceAddress];
      int v12 = [v6 handle];
      int v13 = [v12 value];
      char v14 = ((uint64_t (**)(void, void *))v11)[2](v11, v13);

      id v9 = v6;
      if ((v14 & 1) == 0)
      {
        [v6 setFilteredOutReason:4];
        id v16 = [(CSDProviderCallDataSource *)self blockedByExtension];
        unsigned int v17 = [v6 handle];
        int v18 = [v17 value];
        id v19 = ((void (**)(void, void *))v16)[2](v16, v18);
        [v6 setBlockedByExtension:v19];

        goto LABEL_14;
      }
      uint64_t v10 = 6;
      goto LABEL_13;
    }
  }
  else
  {
    if ([v8 code] == (id)104)
    {
      id v9 = v6;
      uint64_t v10 = 7;
      goto LABEL_13;
    }
    if ([v8 code] == (id)105)
    {
      id v9 = v6;
      uint64_t v10 = 8;
      goto LABEL_13;
    }
  }
LABEL_14:
  __int16 v15 = sub_100008DCC();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    v20[0] = 67109120;
    v20[1] = [v6 filteredOutReason];
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Updated filtered out reason to %d", (uint8_t *)v20, 8u);
  }

LABEL_17:
}

- (void)callSource:(id)a3 reportedNewIncomingCallWithUUID:(id)a4 update:(id)a5 completion:(id)a6
{
  id v173 = a3;
  id v175 = a4;
  id v9 = (__CFString *)a5;
  v170 = (void (**)(id, void *))a6;
  uint64_t v10 = sub_100008DCC();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    id v11 = [v175 UUIDString];
    *(_DWORD *)buf = 138412802;
    *(void *)v206 = v173;
    *(_WORD *)&v206[8] = 2112;
    CFStringRef v207 = v11;
    __int16 v208 = 2112;
    CFStringRef v209 = v9;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Received add incoming call request from call source %@ with UUID %@ update %@", buf, 0x20u);
  }
  +[CSDSignposts trace:4];
  v172 = [(CSDProviderCallDataSource *)self _callWithUUID:v175];
  uint64_t v12 = [(CSDProviderCallDataSource *)self _relayCallWithUUID:v175];
  v171 = (__CFString *)v12;
  if (__PAIR128__((unint64_t)v172, v12) != 0)
  {
    int v13 = sub_100008DCC();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      *(void *)v206 = v172;
      *(_WORD *)&v206[8] = 2112;
      CFStringRef v207 = v171;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "[WARN] Ignoring add incoming call request because a call already exists with the same UUID: existingCall: %@, relayCallWithUUID: %@", buf, 0x16u);
    }

    v174 = +[NSError cx_incomingCallErrorWithCode:2];
    v170[2](v170, v174);
    goto LABEL_134;
  }
  v174 = [(CSDProviderCallDataSource *)self _providerForCallSource:v173];
  v166 = [(CSDCallDataSource *)self callStateController];
  uint64_t v199 = 0;
  v200 = &v199;
  uint64_t v201 = 0x3032000000;
  v202 = sub_1001E0748;
  v203 = sub_1001E0758;
  id v204 = 0;
  char v14 = [v166 answeringMachineController];
  unsigned int v163 = [v14 isAvailable];

  __int16 v15 = [(CSDProviderCallDataSource *)self assistantServicesObserver];
  id v16 = [v15 announceCallsProviderIdentifier];
  [(__CFString *)v9 setAnnounceProviderIdentifier:v16];

  v165 = [(__CFString *)v9 account];
  v169 = [(__CFString *)v9 localSenderIdentityUUID];
  unsigned int v17 = self;
  if (!v165 && v169)
  {
    int v18 = [v174 senderIdentityForUUID:v169];
    id v19 = v18;
    if (!v18)
    {
LABEL_24:

      unsigned int v17 = self;
      goto LABEL_25;
    }
    int v20 = [v18 handle];
    if (v20)
    {
      id v21 = +[CXHandle handleWithTUHandle:v20];
    }
    else
    {
      id v21 = 0;
    }
    __int16 v22 = [v19 ISOCountryCode];
    if (![v22 length])
    {
      id v23 = [(CSDProviderCallDataSource *)self coreTelephonyClient];
      uint64_t v24 = [v23 accountISOCountryCodeForSubscriptionUUID:v169];

      __int16 v22 = (void *)v24;
    }
    long long v25 = [v19 accountUUID];
    unsigned int v26 = [v19 localizedName];
    id v27 = [v19 localizedServiceName];
    uint64_t v28 = [v19 localizedShortName];
    id v29 = (void *)v28;
    if (v25 && v26 && v27 && v22 && v28)
    {
      id v30 = [objc_alloc((Class)CXAccount) initWithUUID:v25 description:v26 serviceName:v27 isoCountryCode:v22 handle:v21 shortLabel:v28];
      [(__CFString *)v9 setAccount:v30];
    }
    else if (!v25)
    {
LABEL_23:

      goto LABEL_24;
    }
    long long v31 = [v25 UUIDString];
    [(__CFString *)v9 setLocalSenderSubscriptionIdentifier:v31];

    goto LABEL_23;
  }
LABEL_25:
  unsigned int v32 = [v174 isTelephonyProvider];
  if (v169) {
    unsigned int v33 = v32;
  }
  else {
    unsigned int v33 = 0;
  }
  if (v33 == 1)
  {
    long long v34 = [(CSDProviderCallDataSource *)v17 coreTelephonyClient];
    unsigned int v162 = [v34 isInHomeCountryForSubscriptionUUID:v169];

    unsigned int v35 = [(__CFString *)v9 localizedCallerName];
    BOOL v36 = [v35 length] == 0;

    if (v36)
    {
      unsigned int v161 = 0;
    }
    else
    {
      long long v37 = [(CSDProviderCallDataSource *)self coreTelephonyClient];
      long long v38 = [v37 spamIdentifiersForSubscriptionUUID:v169];

      long long v197 = 0u;
      long long v198 = 0u;
      long long v195 = 0u;
      long long v196 = 0u;
      id v39 = v38;
      id v40 = [v39 countByEnumeratingWithState:&v195 objects:v217 count:16];
      if (v40)
      {
        uint64_t v41 = *(void *)v196;
        while (2)
        {
          for (i = 0; i != v40; i = (char *)i + 1)
          {
            if (*(void *)v196 != v41) {
              objc_enumerationMutation(v39);
            }
            uint64_t v43 = *(void *)(*((void *)&v195 + 1) + 8 * i);
            long long v44 = [(__CFString *)v9 localizedCallerName];
            LOBYTE(v43) = [v44 rangeOfString:v43 options:1] == (id)0x7FFFFFFFFFFFFFFFLL;

            if ((v43 & 1) == 0)
            {
              unsigned int v161 = 1;
              goto LABEL_41;
            }
          }
          id v40 = [v39 countByEnumeratingWithState:&v195 objects:v217 count:16];
          if (v40) {
            continue;
          }
          break;
        }
      }
      unsigned int v161 = 0;
LABEL_41:
    }
    unsigned int v17 = self;
  }
  else
  {
    unsigned int v161 = 0;
    unsigned int v162 = 0;
  }
  long long v45 = [(__CFString *)v9 localMemberHandleValue];
  if (v45)
  {
    long long v46 = [(__CFString *)v9 localSenderSubscriptionIdentifier];
    BOOL v47 = v46 == 0;

    unsigned int v17 = self;
    if (v47)
    {
      long long v48 = [(CSDProviderCallDataSource *)self coreTelephonyClient];
      long long v49 = [v48 telephonySubscriptions];

      long long v193 = 0u;
      long long v194 = 0u;
      long long v191 = 0u;
      long long v192 = 0u;
      id v50 = v49;
      id v51 = [v50 countByEnumeratingWithState:&v191 objects:v216 count:16];
      if (v51)
      {
        uint64_t v52 = *(void *)v192;
        do
        {
          for (j = 0; j != v51; j = (char *)j + 1)
          {
            if (*(void *)v192 != v52) {
              objc_enumerationMutation(v50);
            }
            v54 = *(void **)(*((void *)&v191 + 1) + 8 * (void)j);
            __int16 v55 = [v54 phoneNumber];
            if (v55)
            {
              BOOL v56 = [v54 phoneNumber];
              int v57 = _FTAreIDsEquivalent();

              if (v57)
              {
                unsigned int v58 = [v54 labelID];
                [(__CFString *)v9 setLocalSenderSubscriptionIdentifier:v58];
              }
            }
          }
          id v51 = [v50 countByEnumeratingWithState:&v191 objects:v216 count:16];
        }
        while (v51);
      }

      unsigned int v17 = self;
    }
  }
  v168 = [(__CFString *)v9 ISOCountryCode];
  if (!v168)
  {
    v168 = [(CSDProviderCallDataSource *)v17 _ISOCountryCodeForCallWithUUID:v175 provider:v174 callUpdate:v9];
    if (v168) {
      -[__CFString setISOCountryCode:](v9, "setISOCountryCode:");
    }
    else {
      v168 = 0;
    }
  }
  if (+[SOSUtilities shouldBlockNonEmergencyCalls])
  {
    id v59 = sub_100008DCC();
    if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v59, OS_LOG_TYPE_DEFAULT, "[WARN] Returning error for add incoming call request because SOS is active", buf, 2u);
    }

    uint64_t v60 = +[NSError cx_incomingCallErrorWithCode:3];
    BOOL v61 = 0;
    id v62 = (id)v200[5];
    v200[5] = v60;
    char v63 = 1;
LABEL_65:
    char v64 = 1;
LABEL_110:

LABEL_111:
    v177[0] = _NSConcreteStackBlock;
    v177[1] = 3221225472;
    v177[2] = sub_1001E0760;
    v177[3] = &unk_10050A658;
    id v106 = v166;
    id v178 = v106;
    id v107 = v175;
    BOOL v185 = v61;
    id v179 = v107;
    v180 = self;
    v184 = &v199;
    v183 = v170;
    char v186 = v64;
    id v108 = v173;
    id v181 = v108;
    v167 = v9;
    v182 = v167;
    char v187 = v63;
    char v188 = v162;
    char v189 = v163;
    char v190 = v161;
    v109 = objc_retainBlock(v177);
    v110 = sub_100008DCC();
    if (os_log_type_enabled(v110, OS_LOG_TYPE_DEFAULT))
    {
      id v158 = v107;
      if (v61) {
        CFStringRef v111 = @"YES";
      }
      else {
        CFStringRef v111 = @"NO";
      }
      v112 = objc_msgSend(v106, "callContainer", v108, v158);
      v113 = [v112 _allCalls];
      if ([v113 count]) {
        CFStringRef v114 = @"NO";
      }
      else {
        CFStringRef v114 = @"YES";
      }
      *(_DWORD *)buf = 138413314;
      if (v162) {
        CFStringRef v115 = @"YES";
      }
      else {
        CFStringRef v115 = @"NO";
      }
      *(void *)v206 = v111;
      *(_WORD *)&v206[8] = 2112;
      if (v161) {
        CFStringRef v116 = @"YES";
      }
      else {
        CFStringRef v116 = @"NO";
      }
      CFStringRef v207 = v114;
      if (v163) {
        CFStringRef v117 = @"YES";
      }
      else {
        CFStringRef v117 = @"NO";
      }
      __int16 v208 = 2112;
      CFStringRef v209 = v115;
      __int16 v210 = 2112;
      CFStringRef v211 = v116;
      __int16 v212 = 2112;
      CFStringRef v213 = v117;
      _os_log_impl((void *)&_mh_execute_header, v110, OS_LOG_TYPE_DEFAULT, "Should we screen? shouldSendToScreening=%@ noOtherCalls=%@ homeCountry=%@ hasSpamIdentifierInCarrierName=%@ isAnsweringMachineAvailable=%@", buf, 0x34u);

      id v107 = v159;
      id v108 = v157;
    }
    v118 = [v106 featureFlags];
    if (([v118 callScreeningEnabledM3] & v61) != 1) {
      goto LABEL_131;
    }
    v119 = [v106 callContainer];
    v120 = [v119 _allCalls];
    if ([v120 count])
    {
LABEL_130:

LABEL_131:
      goto LABEL_132;
    }
    if ([v174 isTelephonyProvider])
    {
      if ((v161 | v162 ^ 1) & 1) != 0 || ((v163 ^ 1)) {
        goto LABEL_130;
      }
    }
    else if (!v163)
    {
      goto LABEL_130;
    }
    v121 = [(CSDProviderCallDataSource *)self lowPowerModeEnabledBlock];
    char v164 = v121[2]();

    if ((v164 & 1) == 0)
    {
      v122 = sub_100008DCC();
      if (os_log_type_enabled(v122, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v122, OS_LOG_TYPE_DEFAULT, "Sending update to see if it should be screened", buf, 2u);
      }

      [v106 screenUpdate:v167 withProvider:v174 callSource:v108 callUUID:v107];
      [(CSDProviderCallDataSource *)self dispatchDelay];
      dispatch_time_t v124 = dispatch_time(0, (uint64_t)(v123 * 1000000000.0));
      v125 = [(CSDCallDataSource *)self queue];
      dispatch_after(v124, v125, v109);

      goto LABEL_133;
    }
LABEL_132:
    ((void (*)(void *))v109[2])(v109);
LABEL_133:

    _Block_object_dispose(&v199, 8);
    goto LABEL_134;
  }
  if (-[__CFString priority](v9, "priority") == (id)2 && [v174 isTelephonyProvider])
  {
    uint64_t v65 = [(CSDProviderCallDataSource *)v17 _endMutuallyExclusiveCalls:v9];
    v66 = (void *)v200[5];
    v200[5] = v65;

    if (v200[5])
    {
      BOOL v61 = 0;
      char v63 = 0;
      char v64 = 0;
      goto LABEL_111;
    }
    id v62 = [[CSDProviderCall alloc] initIncomingWithBackingCallSource:v173 UUID:v175 update:v9];
    [v62 setLocalUserInHomeCountry:v162];
    [v62 setAnsweringMachineAvailable:v163];
    [v62 setIdentifiedSpamInCallerName:v161];
    [v166 setCallDelegatesIfNeeded:v62];
    [v166 propertiesChangedForCall:v62];
    BOOL v61 = 0;
    char v63 = 0;
    goto LABEL_65;
  }
  id v62 = [(CSDProviderCallDataSource *)v17 routeManager];
  unsigned int v67 = [(CSDProviderCallDataSource *)v17 dndAllowsCall];
  v68 = [(__CFString *)v9 remoteHandle];
  id v69 = [v68 value];
  v70 = [v173 identifier];
  v160 = ((void (**)(void, void *, void *))v67)[2](v67, v69, v70);

  id v71 = sub_100008DCC();
  if (os_log_type_enabled(v71, OS_LOG_TYPE_DEFAULT))
  {
    id v72 = [(__CFString *)v9 remoteHandle];
    id v73 = [v72 value];
    TULoggableStringForHandle();
    v74 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();
    v75 = [v173 identifier];
    *(_DWORD *)buf = 138412802;
    *(void *)v206 = v160;
    *(_WORD *)&v206[8] = 2112;
    CFStringRef v207 = v74;
    __int16 v208 = 2112;
    CFStringRef v209 = v75;
    _os_log_impl((void *)&_mh_execute_header, v71, OS_LOG_TYPE_DEFAULT, "Query result: %@ for handle: %@ callSource: %@", buf, 0x20u);
  }
  unsigned int v76 = [v160 allowCallForDestinationID];
  unsigned int v77 = [v62 isCarModeActive];
  if ([v62 isAnyVehicleRouteAvailableForAnyCall]) {
    unsigned int v78 = 1;
  }
  else {
    unsigned int v78 = [v62 isAnyBluetoothHeadphoneRouteAvailableForAnyCall];
  }
  int v79 = v77 & v78;
  if ((v77 & v78 & 1) == 0 && ((v77 ^ 1) & 1) == 0) {
    int v79 = [v62 isCarPlayRouteAvailable];
  }
  if (!v174 || ([v174 isSystemProvider] & 1) != 0)
  {
LABEL_82:
    v84 = [(CSDProviderCallDataSource *)self protectedAppsUtilities];
    id v85 = [v173 bundleIdentifier];
    unsigned int v86 = [v84 shouldBlockCallWithBundleIdentifier:v85];

    if (v86)
    {
      v87 = sub_100008DCC();
      if (os_log_type_enabled(v87, OS_LOG_TYPE_DEFAULT))
      {
        v88 = [v173 bundleIdentifier];
        *(_DWORD *)buf = 138412290;
        *(void *)v206 = v88;
        _os_log_impl((void *)&_mh_execute_header, v87, OS_LOG_TYPE_DEFAULT, "[WARN] Blocking incoming call UI because the originating app [Bundle Identifier: %@] responsible for the call is hidden and currently not foregrounded", buf, 0xCu);
      }
      uint64_t v89 = +[NSError cx_incomingCallErrorWithCode:6];
      id v90 = (void *)v200[5];
      v200[5] = v89;

LABEL_90:
      BOOL v61 = 0;
      char v63 = 0;
LABEL_109:

      char v64 = v63;
      goto LABEL_110;
    }
    if ([v160 isFromBlockList])
    {
      id v91 = sub_100008DCC();
      if (os_log_type_enabled(v91, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v91, OS_LOG_TYPE_DEFAULT, "[WARN] Returning error for add incoming call request because it was on the block list", buf, 2u);
      }

      uint64_t v92 = +[NSError cx_incomingCallErrorWithCode:4];
      v93 = (void *)v200[5];
      v200[5] = v92;

      goto LABEL_90;
    }
    if ([(CSDProviderCallDataSource *)self _shouldBlockIfScreenSharing])
    {
      v94 = sub_100008DCC();
      if (os_log_type_enabled(v94, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v94, OS_LOG_TYPE_DEFAULT, "[WARN] Blocking call because we are screen sharing and don't want to let that notification come through", buf, 2u);
      }

      uint64_t v95 = +[NSError cx_incomingCallErrorWithCode:104];
      id v96 = (void *)v200[5];
      v200[5] = v95;
    }
    else
    {
      if (((v76 | v79) & 1) == 0)
      {
        v102 = sub_100008DCC();
        if (os_log_type_enabled(v102, OS_LOG_TYPE_DEFAULT))
        {
          unsigned int v103 = [v62 isCarPlayRouteAvailable];
          *(_DWORD *)buf = 67109632;
          *(_DWORD *)v206 = v77;
          *(_WORD *)&v206[4] = 1024;
          *(_DWORD *)&v206[6] = v78;
          LOWORD(v207) = 1024;
          *(_DWORD *)((char *)&v207 + 2) = v103;
          _os_log_impl((void *)&_mh_execute_header, v102, OS_LOG_TYPE_DEFAULT, "[WARN] Returning error for add incoming call request because call did not pass DND filter. CarMode (%d) BT Audio Route (%d), CarPlay (%d)", buf, 0x14u);
        }

        uint64_t v104 = +[NSError cx_incomingCallErrorWithCode:3];
        v105 = (void *)v200[5];
        v200[5] = v104;

        BOOL v61 = 1;
        goto LABEL_108;
      }
      if (!self->_sharingModeEnabled)
      {
        v126 = [(CSDProviderCallDataSource *)self supportsPrimaryCalling];
        if (v126[2]())
        {
        }
        else
        {
          v127 = [(CSDProviderCallDataSource *)self shouldPreferRelayOverDirectSecondaryCalling];
          int v128 = ((uint64_t (**)(void, void *, id))v127)[2](v127, v174, [(__CFString *)v9 hasVideo]);

          if (v128)
          {
            v129 = sub_100008DCC();
            if (os_log_type_enabled(v129, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v129, OS_LOG_TYPE_DEFAULT, "[WARN] Returning error for add incoming call request because it is a direct call to a secondary device and relay calling is preferred over direct calling", buf, 2u);
            }

            uint64_t v130 = +[NSError cx_incomingCallErrorWithCode:100];
            v131 = (void *)v200[5];
            v200[5] = v130;

            goto LABEL_90;
          }
        }
        v132 = [(CSDProviderCallDataSource *)self shouldFilterCall];
        int v133 = ((uint64_t (**)(void, __CFString *, void *))v132)[2](v132, v9, v174);

        if (!v133)
        {
          if ([(__CFString *)v9 requiresAuthentication])
          {
            v136 = sub_100008DCC();
            if (os_log_type_enabled(v136, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v136, OS_LOG_TYPE_DEFAULT, "[WARN] Update requires additional authentication before it can be answered", buf, 2u);
            }

            v137 = [CSDIDSPendingChat alloc];
            v138 = [(__CFString *)v9 UUID];
            id v139 = [(__CFString *)v9 hasVideo];
            v140 = [(__CFString *)v9 remoteHandle];
            v141 = [v140 tuHandle];
            v142 = [(CSDIDSPendingChat *)v137 initWithUUID:v138 isVideo:v139 handle:v141];

            id v143 = [[CSDProviderCall alloc] initIncomingWithBackingCallSource:v173 UUID:v175 update:v9];
            [v143 setLocalUserInHomeCountry:v162];
            [v143 setAnsweringMachineAvailable:v163];
            [v143 setIdentifiedSpamInCallerName:v161];
            v144 = [v166 answeringMachineController];
            if (v144) {
              char v145 = v163;
            }
            else {
              char v145 = 1;
            }

            if (v145)
            {
              if ((TUCallScreeningEnabled() & 1) == 0) {
                [v143 setLiveVoicemailUnavailableReason:5];
              }
            }
            else
            {
              v151 = [v166 answeringMachineController];
              objc_msgSend(v143, "setLiveVoicemailUnavailableReason:", objc_msgSend(v151, "liveVoicemailUnavailableReason"));
            }
            [v166 setCallDelegatesIfNeeded:v143];
            v152 = [(CSDProviderCallDataSource *)self pendingCallsToChatUUIDs];
            v153 = [(CSDIDSPendingChat *)v142 uuid];
            [v152 setObject:v143 forKeyedSubscript:v153];

            v154 = +[NSNotificationCenter defaultCenter];
            CFStringRef v214 = @"CSDIDSPendingChatKey";
            v215 = v142;
            v155 = +[NSDictionary dictionaryWithObjects:&v215 forKeys:&v214 count:1];
            [v154 postNotificationName:@"CSDIDSPendingMessageDidReceiveInviteNotification" object:0 userInfo:v155];
          }
          else
          {
            uint64_t v146 = [(CSDProviderCallDataSource *)self _endMutuallyExclusiveCalls:v9];
            v147 = (void *)v200[5];
            v200[5] = v146;

            if (!v200[5])
            {
              id v148 = [[CSDProviderCall alloc] initIncomingWithBackingCallSource:v173 UUID:v175 update:v9];
              [v148 setLocalUserInHomeCountry:v162];
              [v148 setAnsweringMachineAvailable:v163];
              [v148 setIdentifiedSpamInCallerName:v161];
              v149 = [v166 answeringMachineController];
              if (v149) {
                char v150 = v163;
              }
              else {
                char v150 = 1;
              }

              if (v150)
              {
                if ((TUCallScreeningEnabled() & 1) == 0) {
                  [v148 setLiveVoicemailUnavailableReason:5];
                }
              }
              else
              {
                v156 = [v166 answeringMachineController];
                objc_msgSend(v148, "setLiveVoicemailUnavailableReason:", objc_msgSend(v156, "liveVoicemailUnavailableReason"));
              }
              [v166 setCallDelegatesIfNeeded:v148];
              [v166 propertiesChangedForCall:v148];
            }
          }
          goto LABEL_90;
        }
        uint64_t v134 = +[NSError cx_incomingCallErrorWithCode:4];
        v135 = (void *)v200[5];
        v200[5] = v134;

        BOOL v61 = [(__CFString *)v9 filteredOutReason] != 5;
LABEL_108:
        char v63 = 1;
        goto LABEL_109;
      }
      id v99 = sub_100008DCC();
      if (os_log_type_enabled(v99, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v99, OS_LOG_TYPE_DEFAULT, "[WARN] Returning error for add incoming call request because device is currently in sharing mode", buf, 2u);
      }

      uint64_t v100 = +[NSError cx_incomingCallErrorWithCode:5];
      id v101 = (void *)v200[5];
      v200[5] = v100;
    }
    BOOL v61 = 0;
    goto LABEL_108;
  }
  id v80 = [v174 bundleIdentifier];
  id v81 = [v166 voipApplicationController];
  unsigned int v82 = [v81 shouldAllowIncomingCall:v80];

  if (v82)
  {
    v83 = [v166 voipApplicationController];
    [v83 noteReportedNewIncomingVoIPCallForBundleIdentifier:v80];

    goto LABEL_82;
  }
  v97 = sub_100008DCC();
  if (os_log_type_enabled(v97, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v97, OS_LOG_TYPE_DEFAULT, "[WARN] Ignoring add incoming call request because we are not allowing the app to receive calls: ", buf, 2u);
  }

  v98 = +[NSError cx_incomingCallErrorWithCode:106];
  v170[2](v170, v98);

  _Block_object_dispose(&v199, 8);
LABEL_134:
}

- (void)callSource:(id)a3 reportedCallWithUUID:(id)a4 updated:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = sub_100008DCC();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = [v9 UUIDString];
    *(_DWORD *)buf = 138412802;
    id v41 = v8;
    __int16 v42 = 2112;
    id v43 = v12;
    __int16 v44 = 2112;
    id v45 = v10;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Call source %@ updated call with UUID %@ with update %@", buf, 0x20u);
  }
  int v13 = [(CSDProviderCallDataSource *)self _callWithUUID:v9 controllableByCallSource:v8];
  if (([v13 isMutuallyExclusiveCall] & 1) != 0
    || [v10 isMutuallyExclusiveCall])
  {
    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    id v14 = [(CSDCallDataSource *)self calls];
    id v15 = [v14 countByEnumeratingWithState:&v36 objects:v48 count:16];
    if (v15)
    {
      id v16 = v15;
      id v34 = v10;
      id v35 = v8;
      uint64_t v17 = *(void *)v37;
      while (2)
      {
        for (i = 0; i != v16; i = (char *)i + 1)
        {
          if (*(void *)v37 != v17) {
            objc_enumerationMutation(v14);
          }
          id v19 = *(void **)(*((void *)&v36 + 1) + 8 * i);
          int v20 = [v13 uniqueProxyIdentifierUUID];
          id v21 = [v19 uniqueProxyIdentifierUUID];
          unsigned int v22 = [v20 isEqual:v21];

          if (!v22)
          {

            id v14 = [objc_alloc((Class)CXEndCallAction) initWithCallUUID:v9];
            id v23 = sub_100008DCC();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412546;
              id v41 = v14;
              __int16 v42 = 2112;
              id v43 = v9;
              _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "[WARN] Sending %@ for existing call with uniqueProxyIdentifierUUID=%@ since it cannot co-exist with ongoing calls.", buf, 0x16u);
            }

            [(CSDProviderCallDataSource *)self performCallAction:v14 forCall:v13];
            goto LABEL_17;
          }
        }
        id v16 = [v14 countByEnumeratingWithState:&v36 objects:v48 count:16];
        if (v16) {
          continue;
        }
        break;
      }
LABEL_17:
      id v10 = v34;
      id v8 = v35;
    }
  }
  if (v13) {
    goto LABEL_21;
  }
  uint64_t v24 = [(CSDProviderCallDataSource *)self pendingPulledCallContexts];
  long long v25 = [v24 objectForKeyedSubscript:v9];

  int v13 = [v25 call];

  if (v13)
  {
LABEL_21:
    unsigned int v26 = [v13 isoCountryCode];
    if (!v26)
    {
      id v27 = [v10 ISOCountryCode];

      if (v27) {
        goto LABEL_24;
      }
      unsigned int v26 = [(CSDProviderCallDataSource *)self _ISOCountryCodeForCall:v13];
      unsigned int v32 = [v10 ISOCountryCode];
      char v33 = TUStringsAreEqualOrNil();

      if ((v33 & 1) == 0) {
        [v10 setISOCountryCode:v26];
      }
    }

LABEL_24:
    [v13 updateWithCallUpdate:v10];
    uint64_t v28 = sub_100008DCC();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      id v29 = [v9 UUIDString];
      *(_DWORD *)buf = 138413058;
      id v41 = v8;
      __int16 v42 = 2112;
      id v43 = v29;
      __int16 v44 = 2112;
      id v45 = v10;
      __int16 v46 = 2112;
      BOOL v47 = v13;
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "Call source %@ updated call with UUID %@ with update %@ => %@", buf, 0x2Au);
    }
    goto LABEL_27;
  }
  int v13 = sub_100008DCC();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    id v30 = [v9 UUIDString];
    long long v31 = [(CSDCallDataSource *)self calls];
    *(_DWORD *)buf = 138412802;
    id v41 = v8;
    __int16 v42 = 2112;
    id v43 = v30;
    __int16 v44 = 2112;
    id v45 = v31;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "[WARN] No call found for call source %@ and UUID %@. All calls: %@", buf, 0x20u);
  }
LABEL_27:
}

- (void)callSource:(id)a3 reportedCallWithUUID:(id)a4 receivedDTMFUpdate:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = sub_100008DCC();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = [v9 UUIDString];
    int v20 = 138412802;
    id v21 = v8;
    __int16 v22 = 2112;
    id v23 = v12;
    __int16 v24 = 2112;
    id v25 = v10;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Call source %@ updated call with UUID %@ with DTMFUpdate %@", (uint8_t *)&v20, 0x20u);
  }
  int v13 = [(CSDProviderCallDataSource *)self _callWithUUID:v9 controllableByCallSource:v8];
  if (v13
    && ([v10 digits],
        id v14 = objc_claimAutoreleasedReturnValue(),
        id v15 = [v14 length],
        v14,
        v15))
  {
    id v16 = [(CSDCallDataSource *)self callStateController];
    uint64_t v17 = [v10 tuCallDTMFUpdate];
    [v16 handleReceivedCallDTMFUpdate:v17 forCall:v13];
  }
  else
  {
    id v16 = sub_100008DCC();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      int v18 = [v9 UUIDString];
      id v19 = [(CSDCallDataSource *)self calls];
      int v20 = 138412802;
      id v21 = v8;
      __int16 v22 = 2112;
      id v23 = v18;
      __int16 v24 = 2112;
      id v25 = v19;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "[WARN] No call found for call source %@ and UUID %@. All calls: %@", (uint8_t *)&v20, 0x20u);
    }
  }
}

- (void)callSource:(id)a3 reportedCallWithUUID:(id)a4 endedAtDate:(id)a5 privateReason:(int64_t)a6 failureContext:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  id v16 = sub_100008DCC();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v17 = [v13 UUIDString];
    *(_DWORD *)buf = 138413314;
    id v75 = v12;
    __int16 v76 = 2112;
    unsigned int v77 = v17;
    __int16 v78 = 2112;
    id v79 = v14;
    __int16 v80 = 2048;
    int64_t v81 = a6;
    __int16 v82 = 2112;
    id v83 = v15;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Call source %@ ended call with UUID %@ with ended at date %@ with reason %ld failure context %@", buf, 0x34u);
  }
  int v18 = [(CSDProviderCallDataSource *)self _callWithUUID:v13 backingCallSource:v12];
  id v19 = [(CSDProviderCallDataSource *)self _providerForCallSource:v12];
  uint64_t v60 = v15;
  if (!v18)
  {
    id v27 = [(CSDProviderCallDataSource *)self pendingCallsToChatUUIDs];
    uint64_t v28 = [v27 objectForKeyedSubscript:v13];

    if (v28)
    {
      id v29 = +[NSNotificationCenter defaultCenter];
      v71[0] = @"CSDIDSPendingChatUUIDKey";
      v71[1] = @"CSDIDSPendingCallKey";
      v72[0] = v13;
      v72[1] = v28;
      +[NSDictionary dictionaryWithObjects:v72 forKeys:v71 count:2];
      v31 = id v30 = v19;
      [v29 postNotificationName:@"CSDIDSPendingMessageDidReceiveCancelNotification" object:0 userInfo:v31];

      id v19 = v30;
      unsigned int v32 = [(CSDProviderCallDataSource *)self pendingCallsToChatUUIDs];
      [v32 setObject:0 forKeyedSubscript:v13];
    }
    else
    {
      unsigned int v32 = sub_100008DCC();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        id v34 = [v13 UUIDString];
        id v35 = [(CSDCallDataSource *)self calls];
        *(_DWORD *)buf = 138412802;
        id v75 = v12;
        __int16 v76 = 2112;
        unsigned int v77 = v34;
        __int16 v78 = 2112;
        id v79 = v35;
        _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "[WARN] No call found for call source %@ and UUID %@. All calls: %@", buf, 0x20u);
      }
    }

    goto LABEL_19;
  }
  if ([v18 isIncoming]
    && v19
    && ([v19 isSystemProvider] & 1) == 0
    && (+[NSDate timeIntervalSinceReferenceDate],
        double v21 = v20,
        [v18 dateCreated],
        __int16 v22 = objc_claimAutoreleasedReturnValue(),
        [v22 timeIntervalSinceReferenceDate],
        double v24 = v21 - v23,
        v22,
        v24 < 2.0))
  {
    long long v36 = v14;
    long long v37 = sub_100008DCC();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
    {
      long long v38 = [v13 UUIDString];
      *(_DWORD *)buf = 138412290;
      id v75 = v38;
      _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "[WARN] Deferring acknowledgement of VoIP call with UUID %@ ended until minimum ring duration has passed", buf, 0xCu);
    }
    dispatch_time_t v39 = dispatch_time(0, (uint64_t)((2.0 - v24 + 0.01) * 1000000000.0));
    id v40 = [(CSDCallDataSource *)self queue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1001E16E8;
    block[3] = &unk_100507F60;
    void block[4] = self;
    id v66 = v12;
    id v67 = v13;
    id v68 = v36;
    int64_t v70 = a6;
    char v33 = v60;
    id v69 = v60;
    dispatch_after(v39, v40, block);

    id v14 = v36;
  }
  else
  {
    id v25 = [v18 dateEnded];

    if (v25)
    {
      unsigned int v26 = sub_100008DCC();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v75 = v18;
        _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "[WARN] Call %@ already has a date ended", buf, 0xCu);
      }

LABEL_19:
      char v33 = v60;
      goto LABEL_20;
    }
    [v18 setEndedReason:a6];
    char v33 = v15;
    [v18 setFailureContext:v15];
    if (v14)
    {
      [v18 setDateEnded:v14];
    }
    else
    {
      id v41 = +[NSDate date];
      [v18 setDateEnded:v41];
    }
    __int16 v42 = [v18 callGroupUUID];

    if (v42)
    {
      BOOL v56 = v19;
      id v57 = v14;
      id v58 = v13;
      id v59 = v12;
      id v43 = +[NSMutableArray array];
      long long v61 = 0u;
      long long v62 = 0u;
      long long v63 = 0u;
      long long v64 = 0u;
      __int16 v44 = [(CSDCallDataSource *)self calls];
      id v45 = [v44 countByEnumeratingWithState:&v61 objects:v73 count:16];
      if (v45)
      {
        id v46 = v45;
        uint64_t v47 = *(void *)v62;
        do
        {
          for (i = 0; i != v46; i = (char *)i + 1)
          {
            if (*(void *)v62 != v47) {
              objc_enumerationMutation(v44);
            }
            long long v49 = *(void **)(*((void *)&v61 + 1) + 8 * i);
            if (v49 != v18)
            {
              id v50 = [*(id *)(*((void *)&v61 + 1) + 8 * i) callGroupUUID];
              id v51 = [v18 callGroupUUID];
              unsigned int v52 = [v50 isEqual:v51];

              if (v52) {
                [v43 addObject:v49];
              }
            }
          }
          id v46 = [v44 countByEnumeratingWithState:&v61 objects:v73 count:16];
        }
        while (v46);
      }

      id v13 = v58;
      id v12 = v59;
      id v19 = v56;
      id v14 = v57;
      char v33 = v60;
      if ([v43 count] == (id)1)
      {
        __int16 v53 = sub_100008DCC();
        if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
        {
          v54 = [v43 firstObject];
          *(_DWORD *)buf = 138412290;
          id v75 = v54;
          _os_log_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_DEFAULT, "Setting callGroupUUID to nil for orphaned grouped call %@", buf, 0xCu);
        }
        __int16 v55 = [v43 firstObject];
        [v55 setCallGroupUUID:0];
      }
    }
  }
LABEL_20:
}

- (void)callSource:(id)a3 reportedOutgoingCallWithUUID:(id)a4 sentInvitationAtDate:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = sub_100008DCC();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v21 = 138412802;
    id v22 = v8;
    __int16 v23 = 2112;
    id v24 = v9;
    __int16 v25 = 2112;
    id v26 = v10;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Call source %@ sent invitation for outgoing call with UUID %@ at date %@", (uint8_t *)&v21, 0x20u);
  }

  id v12 = [(CSDProviderCallDataSource *)self _callWithUUID:v9 backingCallSource:v8];
  id v13 = v12;
  if (v12)
  {
    if ([v12 isOutgoing])
    {
      id v14 = [v13 dateSentInvitation];

      if (!v14)
      {
        if (v10)
        {
          [v13 setDateSentInvitation:v10];
          goto LABEL_15;
        }
        id v15 = +[NSDate date];
        [v13 setDateSentInvitation:v15];
        goto LABEL_14;
      }
      id v15 = sub_100008DCC();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        id v16 = [v13 uniqueProxyIdentifier];
        int v21 = 138412290;
        id v22 = v16;
        uint64_t v17 = "[WARN] Call with UUID %@ already has a date started outgoing";
LABEL_13:
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, v17, (uint8_t *)&v21, 0xCu);
      }
    }
    else
    {
      id v15 = sub_100008DCC();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        id v16 = [v13 uniqueProxyIdentifier];
        int v21 = 138412290;
        id v22 = v16;
        uint64_t v17 = "[WARN] Call with UUID %@ is not outgoing";
        goto LABEL_13;
      }
    }
LABEL_14:

    goto LABEL_15;
  }
  int v18 = sub_100008DCC();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    id v19 = [(CSDCallDataSource *)self calls];
    double v20 = [(CSDProviderCallDataSource *)self _identifiersForCalls:v19];
    int v21 = 138412802;
    id v22 = v8;
    __int16 v23 = 2112;
    id v24 = v9;
    __int16 v25 = 2112;
    id v26 = v20;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "[WARN] No call found for call source %@ and UUID %@. All calls: %@", (uint8_t *)&v21, 0x20u);
  }
LABEL_15:
}

- (void)callSource:(id)a3 reportedOutgoingCallWithUUID:(id)a4 startedConnectingAtDate:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = sub_100008DCC();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v21 = 138412802;
    id v22 = v8;
    __int16 v23 = 2112;
    id v24 = v9;
    __int16 v25 = 2112;
    id v26 = v10;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Call source %@ started connecting call with UUID %@ at date %@", (uint8_t *)&v21, 0x20u);
  }

  id v12 = [(CSDProviderCallDataSource *)self _callWithUUID:v9 backingCallSource:v8];
  id v13 = v12;
  if (v12)
  {
    if ([v12 isOutgoing])
    {
      id v14 = [v13 dateStartedConnecting];

      if (!v14)
      {
        if (v10)
        {
          [v13 setDateStartedConnecting:v10];
          goto LABEL_15;
        }
        id v15 = +[NSDate date];
        [v13 setDateStartedConnecting:v15];
        goto LABEL_14;
      }
      id v15 = sub_100008DCC();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        id v16 = [v13 uniqueProxyIdentifier];
        int v21 = 138412290;
        id v22 = v16;
        uint64_t v17 = "[WARN] Call with UUID %@ already has a date started connecting";
LABEL_13:
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, v17, (uint8_t *)&v21, 0xCu);
      }
    }
    else
    {
      id v15 = sub_100008DCC();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        id v16 = [v13 uniqueProxyIdentifier];
        int v21 = 138412290;
        id v22 = v16;
        uint64_t v17 = "[WARN] Call with UUID %@ is not outgoing";
        goto LABEL_13;
      }
    }
LABEL_14:

    goto LABEL_15;
  }
  int v18 = sub_100008DCC();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    id v19 = [(CSDCallDataSource *)self calls];
    double v20 = [(CSDProviderCallDataSource *)self _identifiersForCalls:v19];
    int v21 = 138412802;
    id v22 = v8;
    __int16 v23 = 2112;
    id v24 = v9;
    __int16 v25 = 2112;
    id v26 = v20;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "[WARN] No call found for call source %@ and UUID %@. All calls: %@", (uint8_t *)&v21, 0x20u);
  }
LABEL_15:
}

- (void)callSource:(id)a3 reportedOutgoingCallWithUUID:(id)a4 connectedAtDate:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = sub_100008DCC();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v21 = 138412802;
    id v22 = v8;
    __int16 v23 = 2112;
    id v24 = v9;
    __int16 v25 = 2112;
    id v26 = v10;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Call source %@ connected outgoing call with UUID %@ at date %@", (uint8_t *)&v21, 0x20u);
  }

  id v12 = [(CSDProviderCallDataSource *)self _callWithUUID:v9 backingCallSource:v8];
  id v13 = v12;
  if (v12)
  {
    if (([v12 isOutgoing] & 1) == 0
      && ![v13 shouldAcceptDateConnectedProviderUpdates])
    {
      id v15 = sub_100008DCC();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        id v16 = [v13 uniqueProxyIdentifier];
        int v21 = 138412290;
        id v22 = v16;
        uint64_t v17 = "[WARN] Call with %@ is not outgoing";
        goto LABEL_16;
      }
LABEL_18:

      goto LABEL_19;
    }
    id v14 = [v13 dateConnected];

    if (v14)
    {
      id v15 = sub_100008DCC();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        id v16 = [v13 uniqueProxyIdentifier];
        int v21 = 138412290;
        id v22 = v16;
        uint64_t v17 = "[WARN] Call with UUID %@ already has a date connected";
LABEL_16:
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, v17, (uint8_t *)&v21, 0xCu);

        goto LABEL_18;
      }
      goto LABEL_18;
    }
    if (!v10)
    {
      id v15 = +[NSDate date];
      [v13 setDateConnected:v15];
      goto LABEL_18;
    }
    [v13 setDateConnected:v10];
  }
  else
  {
    int v18 = sub_100008DCC();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      id v19 = [(CSDCallDataSource *)self calls];
      double v20 = [(CSDProviderCallDataSource *)self _identifiersForCalls:v19];
      int v21 = 138412802;
      id v22 = v8;
      __int16 v23 = 2112;
      id v24 = v9;
      __int16 v25 = 2112;
      id v26 = v20;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "[WARN] No call found for call source %@ and UUID %@. All calls: %@", (uint8_t *)&v21, 0x20u);
    }
  }
LABEL_19:
}

- (void)callSource:(id)a3 reportedNewOutgoingCallWithUUID:(id)a4 update:(id)a5
{
  id v13 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = [(CSDProviderCallDataSource *)self _callWithUUID:v8 backingCallSource:v13];
  if (!v10)
  {
    id v11 = [[CSDProviderCall alloc] initOutgoingWithUpdate:v9 callUUID:v8 backingCallSource:v13 isExpanseProvider:1];
    id v12 = [(CSDCallDataSource *)self callStateController];
    [v12 setCallDelegatesIfNeeded:v11];
    [v12 propertiesChangedForCall:v11];
  }
}

- (void)callSource:(id)a3 reportedAudioFinishedForCallWithUUID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = sub_100008DCC();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = [v7 UUIDString];
    int v17 = 138412546;
    id v18 = v6;
    __int16 v19 = 2112;
    double v20 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Call source %@ finished audio for call with UUID %@", (uint8_t *)&v17, 0x16u);
  }
  id v10 = [(CSDProviderCallDataSource *)self _callWithUUID:v7 backingCallSource:v6];
  id v11 = sub_100008DCC();
  BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
  if (v10)
  {
    if (v12)
    {
      id v13 = [v7 UUIDString];
      int v17 = 138412546;
      id v18 = v10;
      __int16 v19 = 2112;
      double v20 = v13;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Found call %@ for UUID %@, so setting hasAudioFinished", (uint8_t *)&v17, 0x16u);
    }
    [v10 setHasAudioFinished:1];
  }
  else
  {
    if (v12)
    {
      id v14 = [v7 UUIDString];
      int v17 = 138412290;
      id v18 = v14;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Did not find a call for UUID %@, so expediting deferred end interruption instead", (uint8_t *)&v17, 0xCu);
    }
    id v15 = [(CSDCallDataSource *)self callStateController];
    id v16 = [v15 audioController];
    [v16 expediteDeferredEndInterruptionForCallWithUUID:v7];
  }
}

- (void)callSource:(id)a3 reportedCallWithUUID:(id)a4 changedFrequencyData:(id)a5 forDirection:(int64_t)a6
{
  id v10 = a5;
  uint64_t v11 = [(CSDProviderCallDataSource *)self _callWithUUID:a4 backingCallSource:a3];
  BOOL v12 = (void *)v11;
  if (v11)
  {
    if (a6 == 2)
    {
      uint64_t v17 = v11;
      id v13 = +[NSArray arrayWithObjects:&v17 count:1];
      id v14 = self;
      id v15 = v10;
      uint64_t v16 = 2;
      goto LABEL_6;
    }
    if (a6 == 1)
    {
      uint64_t v18 = v11;
      id v13 = +[NSArray arrayWithObjects:&v18 count:1];
      id v14 = self;
      id v15 = v10;
      uint64_t v16 = 1;
LABEL_6:
      [(CSDCallDataSource *)v14 handleFrequencyDataChanged:v15 inDirection:v16 forCalls:v13];
    }
  }
}

- (void)callSource:(id)a3 reportedCallWithUUID:(id)a4 changedMeterLevel:(float)a5 forDirection:(int64_t)a6
{
  uint64_t v9 = [(CSDProviderCallDataSource *)self _callWithUUID:a4 backingCallSource:a3];
  id v10 = (void *)v9;
  if (v9)
  {
    if (a6 == 2)
    {
      uint64_t v15 = v9;
      uint64_t v11 = +[NSArray arrayWithObjects:&v15 count:1];
      BOOL v12 = self;
      *(float *)&double v13 = a5;
      uint64_t v14 = 2;
      goto LABEL_6;
    }
    if (a6 == 1)
    {
      uint64_t v16 = v9;
      uint64_t v11 = +[NSArray arrayWithObjects:&v16 count:1];
      BOOL v12 = self;
      *(float *)&double v13 = a5;
      uint64_t v14 = 1;
LABEL_6:
      [(CSDCallDataSource *)v12 handleMeterLevelChanged:v14 inDirection:v11 forCalls:v13];
    }
  }
}

- (void)callSource:(id)a3 reportedCallWithUUID:(id)a4 crossDeviceIdentifier:(id)a5 changedBytesOfDataUsed:(int64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  double v13 = sub_100008DCC();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v14 = [v11 UUIDString];
    int v16 = 138413058;
    id v17 = v10;
    __int16 v18 = 2112;
    __int16 v19 = v14;
    __int16 v20 = 2112;
    id v21 = v12;
    __int16 v22 = 2048;
    int64_t v23 = a6;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Call source %@ received call with UUID: %@ crossDeviceIdentifier %@ bytesOfDataUsed %ld", (uint8_t *)&v16, 0x2Au);
  }
  uint64_t v15 = [v11 UUIDString];
  [(CSDCallDataSource *)self handleBytesOfDataUsedChanged:a6 forCallWithUniqueProxyIdentifier:v15 callHistoryIdentifier:v12];
}

- (void)callSource:(id)a3 requestedTransaction:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = sub_100008DCC();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138412546;
    id v13 = v8;
    __int16 v14 = 2112;
    id v15 = v9;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Call source %@ received requested transaction %@", (uint8_t *)&v12, 0x16u);
  }

  [(CSDProviderCallDataSource *)self _processRequestedTransaction:v9 fromCallSource:v8 completion:v10];
}

- (void)callSourceManager:(id)a3 completedTransactionGroup:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(CSDCallDataSource *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001E2764;
  block[3] = &unk_100504FE0;
  id v12 = v6;
  id v13 = v7;
  __int16 v14 = self;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

- (void)callSourcesChangedForCallSourceManager:(id)a3
{
  id v4 = [(CSDCallDataSource *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001E2D3C;
  block[3] = &unk_100504EC0;
  void block[4] = self;
  dispatch_async(v4, block);
}

- (void)callControllerHost:(id)a3 clientWithIdentifier:(id)a4 requestedTransaction:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  __int16 v14 = sub_100008DCC();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    id v23 = v10;
    __int16 v24 = 2112;
    id v25 = v12;
    __int16 v26 = 2112;
    id v27 = v11;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Call controller host %@ requested transaction %@ for connection with identifier: %@", buf, 0x20u);
  }

  id v15 = [(CSDProviderCallDataSource *)self channelSourceManager];
  int v16 = [v15 channelSourceForIdentifier:v11];

  if (v16
    && [(CSDProviderCallDataSource *)self transactionContainsChannelActions:v12])
  {
    [(CSDProviderCallDataSource *)self _processRequestedTransaction:v12 fromProviderSource:v16 completionHandler:v13];
  }
  else
  {
    id v17 = [(CSDProviderCallDataSource *)self callSourceFetcher];
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_1001E31B8;
    v18[3] = &unk_10050A680;
    id v19 = v12;
    __int16 v20 = self;
    id v21 = v13;
    [v17 fetchCallSourceForIdentifier:v11 completion:v18];
  }
}

- (void)providersChangedForProviderManager:(id)a3
{
  id v4 = sub_100008DCC();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Marking all calls as changed because providers changed", buf, 2u);
  }

  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v5 = [(CSDCallDataSource *)self calls];
  id v6 = [v5 countByEnumeratingWithState:&v10 objects:v15 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      id v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * (void)v9) propertiesChanged];
        id v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v10 objects:v15 count:16];
    }
    while (v7);
  }
}

- (id)callSourceWithIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(CSDProviderCallDataSource *)self callSourceManager];
  id v6 = [v5 callSourceWithIdentifier:v4];

  return v6;
}

+ (BOOL)_isSystemProviderForIdentifier:(id)a3
{
  id v3 = a3;
  unsigned __int8 v4 = [v3 isEqualToString:@"com.apple.coretelephony"];
  unsigned __int8 v5 = [v3 isEqualToString:@"com.apple.telephonyutilities.callservicesd.FaceTimeProvider"];
  unsigned int v6 = [v3 isEqualToString:@"com.apple.Superbox"];
  unsigned __int8 v7 = [v3 isEqualToString:@"com.apple.telephonyutilities.callservicesd.TinCan"];

  if (!_TUIsInternalInstall() || !v6) {
    return v4 | v5 | v7;
  }
  uint64_t v8 = sub_100008DCC();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long v10 = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Because this is an internal install, com.apple.Superbox (aka Speakerbox) is acting as a system provider", v10, 2u);
  }

  return 1;
}

- (id)policyForAddresses:(id)a3 forBundleIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(CSDProviderCallDataSource *)self isScreenTimeDisabledByOtherFeatures])
  {
    uint64_t v8 = &__NSDictionary0__struct;
  }
  else
  {
    id v9 = [(CSDProviderCallDataSource *)self screenTimeCallFilter];
    uint64_t v8 = [v9 policyForAddresses:v6 forBundleIdentifier:v7];
  }

  return v8;
}

- (BOOL)shouldRestrictAddresses:(id)a3 forBundleIdentifier:(id)a4 performSynchronously:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  if ([(CSDProviderCallDataSource *)self isScreenTimeDisabledByOtherFeatures])
  {
    unsigned __int8 v10 = 0;
  }
  else
  {
    long long v11 = [(CSDProviderCallDataSource *)self screenTimeCallFilter];
    long long v12 = [v8 allObjects];
    unsigned __int8 v10 = [v11 shouldRestrictAddresses:v12 forBundleIdentifier:v9 performSynchronously:v5];
  }
  return v10;
}

- (void)screenTimeCallFilter:(id)a3 didChangeAllowed:(BOOL)a4 forCallUUID:(id)a5
{
  BOOL v5 = a4;
  id v7 = a5;
  id v8 = [(CSDCallDataSource *)self queue];
  dispatch_assert_queue_V2(v8);

  id v9 = sub_100008DCC();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)id v27 = v5;
    *(_WORD *)&v27[4] = 2112;
    *(void *)&v27[6] = v7;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Changed ScreenTime allowed %d for call with UUID %@", buf, 0x12u);
  }

  if (!v5)
  {
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    unsigned __int8 v10 = [(CSDCallDataSource *)self calls];
    id v11 = [v10 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v11)
    {
      id v13 = v11;
      uint64_t v14 = *(void *)v22;
      *(void *)&long long v12 = 138412290;
      long long v20 = v12;
      do
      {
        for (i = 0; i != v13; i = (char *)i + 1)
        {
          if (*(void *)v22 != v14) {
            objc_enumerationMutation(v10);
          }
          int v16 = *(void **)(*((void *)&v21 + 1) + 8 * i);
          if ((objc_msgSend(v16, "isEmergency", v20) & 1) == 0)
          {
            id v17 = [v16 uniqueProxyIdentifierUUID];
            unsigned int v18 = [v17 isEqual:v7];

            if (v18)
            {
              id v19 = sub_100008DCC();
              if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = v20;
                *(void *)id v27 = v7;
                _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Call is not allowed by ScreenTime; disconnecting call with UUID: %@",
                  buf,
                  0xCu);
              }

              [v16 disconnectWithReason:25];
            }
          }
        }
        id v13 = [v10 countByEnumeratingWithState:&v21 objects:v25 count:16];
      }
      while (v13);
    }
  }
}

- (OS_dispatch_queue)processObserverQueue
{
  processObserverQueue = self->_processObserverQueue;
  if (!processObserverQueue)
  {
    unsigned __int8 v4 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.csd.providerdatasource.processobserver", 0);
    BOOL v5 = self->_processObserverQueue;
    self->_processObserverQueue = v4;

    processObserverQueue = self->_processObserverQueue;
  }

  return processObserverQueue;
}

- (CSDProcessObserverProtocol)processObserver
{
  processObserver = self->_processObserver;
  if (!processObserver)
  {
    unsigned __int8 v4 = [CSDProcessObserver alloc];
    BOOL v5 = [(CSDProviderCallDataSource *)self processObserverQueue];
    id v6 = [(CSDProcessObserver *)v4 initWithQueue:v5];
    id v7 = self->_processObserver;
    self->_processObserver = v6;

    processObserver = self->_processObserver;
  }

  return processObserver;
}

- (CSDBluetoothHangupCommandObserver)btHangupObserver
{
  btHangupObserver = self->_btHangupObserver;
  if (!btHangupObserver)
  {
    unsigned __int8 v4 = [CSDBluetoothHangupCommandObserver alloc];
    BOOL v5 = [(CSDCallDataSource *)self queue];
    id v6 = [(CSDBluetoothHangupCommandObserver *)v4 initWithQueue:v5];
    id v7 = self->_btHangupObserver;
    self->_btHangupObserver = v6;

    btHangupObserver = self->_btHangupObserver;
  }

  return btHangupObserver;
}

- (CSDCoreTelephonyClient)coreTelephonyClient
{
  return self->_coreTelephonyClient;
}

- (CSDFaceTimeProviderDelegate)faceTimeProviderDelegate
{
  return self->_faceTimeProviderDelegate;
}

- (CSDCallProviderManager)callProviderManager
{
  return self->_callProviderManager;
}

- (CSDCallFilterController)callFilterController
{
  return self->_callFilterController;
}

- (void)setCallFilterController:(id)a3
{
}

- (CSDChannelProviderManager)channelProviderManager
{
  return self->_channelProviderManager;
}

- (void)setChannelProviderManager:(id)a3
{
}

- (CSDAssistantServicesObserver)assistantServicesObserver
{
  return self->_assistantServicesObserver;
}

- (CXCallControllerHost)callControllerHost
{
  return self->_callControllerHost;
}

- (BOOL)deferCommittingTransactions
{
  return self->_deferCommittingTransactions;
}

- (void)setDeferCommittingTransactions:(BOOL)a3
{
  self->_deferCommittingTransactions = a3;
}

- (CXInProcessCallSource)faceTimeCallSource
{
  return self->_faceTimeCallSource;
}

- (CXInProcessCallSource)superboxCallSource
{
  return self->_superboxCallSource;
}

- (_TtC13callservicesd27CSDSuperboxProviderDelegate)superboxProviderDelegate
{
  return self->_superboxProviderDelegate;
}

- (CXInProcessCallSource)tinCanCallSource
{
  return self->_tinCanCallSource;
}

- (CXProviderDelegatePrivate)tinCanProviderDelegate
{
  return self->_tinCanProviderDelegate;
}

- (CSDCallSourceFetcher)callSourceFetcher
{
  return self->_callSourceFetcher;
}

- (NSMutableDictionary)pendingCallsToChatUUIDs
{
  return self->_pendingCallsToChatUUIDs;
}

- (NSMutableDictionary)pendingPulledCallContexts
{
  return self->_pendingPulledCallContexts;
}

- (CSDClarityUICallFilter)clarityUICallFilter
{
  return self->_clarityUICallFilter;
}

- (void)setClarityUICallFilter:(id)a3
{
}

- (CSDScreenTimeCallFilter)screenTimeCallFilter
{
  return self->_screenTimeCallFilter;
}

- (void)setScreenTimeCallFilter:(id)a3
{
}

- (BOOL)isScreenTimeDisabledByOtherFeatures
{
  return self->_isScreenTimeDisabledByOtherFeatures;
}

- (CXCallSourceManager)callSourceManager
{
  return self->_callSourceManager;
}

- (CXChannelSourceManager)channelSourceManager
{
  return self->_channelSourceManager;
}

- (CSDVoIPProcessAssertionManager)processAssertionManager
{
  return self->_processAssertionManager;
}

- (CSDRelayCallDataSource)relayCallDataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_relayCallDataSource);

  return (CSDRelayCallDataSource *)WeakRetained;
}

- (void)setRelayCallDataSource:(id)a3
{
}

- (BOOL)sharingModeEnabled
{
  return self->_sharingModeEnabled;
}

- (void)setSharingModeEnabled:(BOOL)a3
{
  self->_sharingModeEnabled = a3;
}

- (void)setRouteManager:(id)a3
{
}

- (id)dndAllowsCall
{
  return self->_dndAllowsCall;
}

- (void)setDndAllowsCall:(id)a3
{
}

- (id)supportsPrimaryCalling
{
  return self->_supportsPrimaryCalling;
}

- (void)setSupportsPrimaryCalling:(id)a3
{
}

- (id)shouldPreferRelayOverDirectSecondaryCalling
{
  return self->_shouldPreferRelayOverDirectSecondaryCalling;
}

- (void)setShouldPreferRelayOverDirectSecondaryCalling:(id)a3
{
}

- (id)shouldFilterCall
{
  return self->_shouldFilterCall;
}

- (void)setShouldFilterCall:(id)a3
{
}

- (id)lowPowerModeEnabledBlock
{
  return self->_lowPowerModeEnabledBlock;
}

- (void)setLowPowerModeEnabledBlock:(id)a3
{
}

- (id)callDirectoryAllowsCallFromSourceAddress
{
  return self->_callDirectoryAllowsCallFromSourceAddress;
}

- (void)setCallDirectoryAllowsCallFromSourceAddress:(id)a3
{
}

- (id)blockedByExtension
{
  return self->_blockedByExtension;
}

- (void)setBlockedByExtension:(id)a3
{
}

- (double)dispatchDelay
{
  return self->_dispatchDelay;
}

- (void)setDispatchDelay:(double)a3
{
  self->_dispatchDelay = a3;
}

- (CSDProtectedAppsUtilitiesProtocol)protectedAppsUtilities
{
  return self->_protectedAppsUtilities;
}

- (void)setProtectedAppsUtilities:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_protectedAppsUtilities, 0);
  objc_storeStrong(&self->_blockedByExtension, 0);
  objc_storeStrong(&self->_callDirectoryAllowsCallFromSourceAddress, 0);
  objc_storeStrong(&self->_lowPowerModeEnabledBlock, 0);
  objc_storeStrong(&self->_shouldFilterCall, 0);
  objc_storeStrong(&self->_shouldPreferRelayOverDirectSecondaryCalling, 0);
  objc_storeStrong(&self->_supportsPrimaryCalling, 0);
  objc_storeStrong(&self->_dndAllowsCall, 0);
  objc_storeStrong((id *)&self->_routeManager, 0);
  objc_destroyWeak((id *)&self->_relayCallDataSource);
  objc_storeStrong((id *)&self->_processAssertionManager, 0);
  objc_storeStrong((id *)&self->_channelSourceManager, 0);
  objc_storeStrong((id *)&self->_callSourceManager, 0);
  objc_storeStrong((id *)&self->_screenTimeCallFilter, 0);
  objc_storeStrong((id *)&self->_clarityUICallFilter, 0);
  objc_storeStrong((id *)&self->_pendingPulledCallContexts, 0);
  objc_storeStrong((id *)&self->_pendingCallsToChatUUIDs, 0);
  objc_storeStrong((id *)&self->_callSourceFetcher, 0);
  objc_storeStrong((id *)&self->_tinCanProviderDelegate, 0);
  objc_storeStrong((id *)&self->_tinCanCallSource, 0);
  objc_storeStrong((id *)&self->_superboxProviderDelegate, 0);
  objc_storeStrong((id *)&self->_superboxCallSource, 0);
  objc_storeStrong((id *)&self->_faceTimeCallSource, 0);
  objc_storeStrong((id *)&self->_callControllerHost, 0);
  objc_storeStrong((id *)&self->_assistantServicesObserver, 0);
  objc_storeStrong((id *)&self->_channelProviderManager, 0);
  objc_storeStrong((id *)&self->_callFilterController, 0);
  objc_storeStrong((id *)&self->_callProviderManager, 0);
  objc_storeStrong((id *)&self->_faceTimeProviderDelegate, 0);
  objc_storeStrong((id *)&self->_btHangupObserver, 0);
  objc_storeStrong((id *)&self->_processObserver, 0);
  objc_storeStrong((id *)&self->_processObserverQueue, 0);

  objc_storeStrong((id *)&self->_coreTelephonyClient, 0);
}

@end
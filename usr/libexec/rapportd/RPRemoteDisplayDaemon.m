@interface RPRemoteDisplayDaemon
- (BOOL)_clientBLEDiscoveryShouldRun;
- (BOOL)_clientBLENearbyActionV2AdvertiserShouldRun;
- (BOOL)_clientBLENeedsAWDLAdvertiserShouldRun;
- (BOOL)_clientBonjourAWDLBrowserShouldRun;
- (BOOL)_clientBonjourFoundDevice:(id)a3 reevaluate:(BOOL)a4;
- (BOOL)_deviceSupportsLaguna:(id)a3;
- (BOOL)_discoveriCloudDevicesOnly;
- (BOOL)_needToHoldPowerAssertion;
- (BOOL)_onenessEnabled;
- (BOOL)_serverBLEDiscoveryShouldStart;
- (BOOL)_serverBLENearbyActionV2DiscoveryShouldRun;
- (BOOL)_serverBLENeedsAWDLScannerScreenOff;
- (BOOL)_serverBonjourAWDLNeeded;
- (BOOL)addXPCMatchingToken:(unint64_t)a3 event:(id)a4 handler:(id)a5;
- (BOOL)diagnosticCommand:(id)a3 params:(id)a4;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (BOOL)removeXPCMatchingToken:(unint64_t)a3;
- (NSString)deviceConfirmedIdentifier;
- (OS_dispatch_queue)dispatchQueue;
- (RPRemoteDisplayDaemon)init;
- (RPRemoteDisplayDevice)dedicatedDevice;
- (id)_acquireRBSAssertionForEntry:(id)a3 error:(id *)a4;
- (id)_findMatchingDeviceWithIdentifier:(id)a3;
- (id)_serverBonjourAuthTagString;
- (id)_serverBonjourAuthTagStringWithData:(id)a3;
- (id)descriptionWithLevel:(int)a3;
- (unsigned)_serverDirectLinkInterfaceIndex;
- (void)_activate;
- (void)_bleDiscoveryEnsureStarted:(BOOL)a3;
- (void)_bleDiscoveryEnsureStopped;
- (void)_bleDiscoveryTriggerEnhancedDiscovery:(id)a3 useCase:(unsigned int)a4;
- (void)_bluetoothUseCaseFromWombatState:(unsigned int)a3 resultBlock:(id)a4;
- (void)_btAddressChanged;
- (void)_btAddressMonitorEnsureStarted;
- (void)_btAddressMonitorEnsureStopped;
- (void)_cameraCapabilitiesChanged:(id)a3;
- (void)_changeDiscoverySessionStateForDevice:(id)a3 startReason:(unsigned __int8)a4;
- (void)_clearCameraCapabilitiesUpdateCache;
- (void)_clearConfirmationClientCache;
- (void)_clientAWDLPairingSessionWithDevice:(id)a3;
- (void)_clientBLEDiscoveryDeviceFound:(id)a3;
- (void)_clientBLEDiscoveryDeviceLost:(id)a3;
- (void)_clientBLEDiscoveryEnsureStarted;
- (void)_clientBLEDiscoveryEnsureStopped;
- (void)_clientBLENearbyActionV2AdvertiserEnsureStarted;
- (void)_clientBLENearbyActionV2AdvertiserEnsureStopped;
- (void)_clientBLENearbyActionV2AdvertiserUpdate;
- (void)_clientBLENeedsAWDLAdvertiserEnsureStarted;
- (void)_clientBLENeedsAWDLAdvertiserEnsureStopped;
- (void)_clientBonjourAWDLBrowserEnsureStarted;
- (void)_clientBonjourAWDLBrowserEnsureStopped;
- (void)_clientBonjourAWDLBrowserFoundDevice:(id)a3;
- (void)_clientBonjourAWDLBrowserLostDevice:(id)a3;
- (void)_clientBonjourEnsureStarted;
- (void)_clientBonjourEnsureStopped;
- (void)_clientBonjourFoundUnresolvedDevice:(id)a3;
- (void)_clientBonjourLostDevice:(id)a3;
- (void)_clientBonjourLostUnresolvedDevice:(id)a3;
- (void)_clientBonjourReconfirmDevice:(id)a3 reason:(const char *)a4;
- (void)_clientBonjourReevaluateDevices;
- (void)_clientEnsureStarted;
- (void)_clientEnsureStopped;
- (void)_clientLostAllDevices;
- (void)_clientSendNeedsAWDLOverWiFi:(BOOL)a3;
- (void)_connectionConfigureCommon:(id)a3;
- (void)_deliverBufferedConnectionsToServer:(id)a3;
- (void)_handleConfirmationResult:(id)a3 fromDevice:(id)a4;
- (void)_handleServerActivation:(id)a3;
- (void)_invalidate;
- (void)_invalidated;
- (void)_localDeviceUpdate;
- (void)_postNotificationForWombatActivity:(unsigned int)a3;
- (void)_powerAssertionEnsureHeld;
- (void)_powerAssertionEnsureReleased;
- (void)_processDiscoverySessionStateChangeForDevice:(id)a3 startReason:(unsigned __int8)a4;
- (void)_processPendingLostDevices;
- (void)_receivedCameraCapabilitiesMessage:(id)a3 fromDevice:(id)a4 isFirstUpdate:(BOOL)a5;
- (void)_receivedCameraExitEvent:(id)a3 from:(id)a4;
- (void)_registerForCameraCapabilitiesRequest;
- (void)_registerForIncomingMessages;
- (void)_registerForWombatStateNotifications;
- (void)_requestCameraCapabilitiesForDevice:(id)a3;
- (void)_requestConfirmationFromDevice:(id)a3 forDedicated:(BOOL)a4;
- (void)_requestConfirmationFromDevicesMatching:(id)a3 forDedicated:(BOOL)a4;
- (void)_requestConfirmationFromPerson:(id)a3 forDedicated:(BOOL)a4;
- (void)_scheduleCameraCapabilitiesRequest:(id)a3 interval:(unint64_t)a4;
- (void)_schedulePendingLostDeviceTimer;
- (void)_sendCameraCapabilitiesUpdateEventForDevice:(id)a3;
- (void)_sendConfirmationCancelToAllDevices;
- (void)_sendDiscoverySessionExitWithReason:(id)a3;
- (void)_serverBLEDiscoveryEnsureStarted;
- (void)_serverBLEDiscoveryEnsureStopped;
- (void)_serverBLENearbyActionV2DiscoveryEnsureStarted;
- (void)_serverBLENearbyActionV2DiscoveryEnsureStopped;
- (void)_serverBLENeedsAWDLScannerDeviceFound:(id)a3;
- (void)_serverBLENeedsAWDLScannerDeviceLost:(id)a3;
- (void)_serverBLENeedsAWDLScannerEnsureStarted;
- (void)_serverBLENeedsAWDLScannerEnsureStopped;
- (void)_serverBonjourAWDLAdvertiserEnsureStarted;
- (void)_serverBonjourAWDLAdvertiserEnsureStopped;
- (void)_serverBonjourAWDLAdvertiserUpdateTXT;
- (void)_serverBonjourEnsureStarted;
- (void)_serverBonjourEnsureStopped;
- (void)_serverBonjourUpdateTXT;
- (void)_serverEnsureStarted;
- (void)_serverEnsureStopped;
- (void)_serverHandleSessionStartWithID:(id)a3 netCnx:(id)a4 completion:(id)a5;
- (void)_serverProximityGetDeviceIdentifiers;
- (void)_serverReceivedNeedsAWDLEvent:(id)a3;
- (void)_serverRegisterForIncomingMessages;
- (void)_serverTCPEnsureStarted;
- (void)_serverTCPEnsureStopped;
- (void)_serverTCPHandleConnectionStarted:(id)a3;
- (void)_startDiscoverySessionExpirationTimer;
- (void)_startInSessionDeviceLostTimer;
- (void)_startObservingOnenessEnabledState;
- (void)_startPairingServerWithPassword:(id)a3 completion:(id)a4;
- (void)_stopObservingOnenessEnabledState;
- (void)_stopPairingServer;
- (void)_unregisterWombatStateNotifications;
- (void)_update;
- (void)_updateCameraCapabilities;
- (void)_updateForXPCClientChange;
- (void)_updateXPCMatchingDiscovery;
- (void)_xpcConnectionInvalidated:(id)a3;
- (void)activate;
- (void)addNeedsAWDLPeer:(id)a3;
- (void)daemonInfoChanged:(unint64_t)a3;
- (void)invalidate;
- (void)prefsChanged;
- (void)saveDedicatedDevice:(id)a3;
- (void)setDeviceConfirmedIdentifier:(id)a3;
- (void)setDispatchQueue:(id)a3;
@end

@implementation RPRemoteDisplayDaemon

- (RPRemoteDisplayDaemon)init
{
  v6.receiver = self;
  v6.super_class = (Class)RPRemoteDisplayDaemon;
  v2 = [(RPRemoteDisplayDaemon *)&v6 init];
  v3 = v2;
  if (v2)
  {
    objc_storeStrong((id *)&v2->_dispatchQueue, &_dispatch_main_q);
    *(void *)&v3->_wombatStateReadyToken = 0xFFFFFFFFLL;
    v4 = v3;
  }

  return v3;
}

- (id)descriptionWithLevel:(int)a3
{
  if (a3 < 21)
  {
    uint64_t v197 = 0;
    v198 = &v197;
    uint64_t v199 = 0x3032000000;
    v200 = sub_1000A2B54;
    v201 = sub_1000A2B64;
    id v202 = 0;
    id obj = 0;
    NSAppendPrintF();
    objc_storeStrong(&v202, 0);
    if (a3 >= 11) {
      int v6 = 50;
    }
    else {
      int v6 = 30;
    }
    int v132 = v6;
    v7 = self->_systemMonitor;
    v8 = v7;
    if (v7)
    {
      v9 = (id *)(v198 + 5);
      id v195 = (id)v198[5];
      unsigned int v10 = [(CUSystemMonitor *)v7 firstUnlocked];
      v11 = "no";
      if (v10) {
        v11 = "yes";
      }
      deviceConfirmedIdentifier = (void *)v11;
      NSAppendPrintF();
      objc_storeStrong(v9, v195);
    }

    v12 = self->_bleDiscovery;
    if (v12)
    {
      v13 = (id *)(v198 + 5);
      id v194 = (id)v198[5];
      deviceConfirmedIdentifier = CUDescriptionWithLevel();
      NSAppendPrintF();
      objc_storeStrong(v13, v194);
    }
    v14 = self->_bleNearbyActionV2Advertiser;
    v15 = v14;
    if (v14)
    {
      v16 = (id *)(v198 + 5);
      id v193 = (id)v198[5];
      deviceConfirmedIdentifier = v14;
      NSAppendPrintF();
      objc_storeStrong(v16, v193);
    }

    v17 = self->_bleNearbyActionV2AdvertiserProcessName;
    v18 = v17;
    if (v17)
    {
      v19 = (id *)(v198 + 5);
      id v192 = (id)v198[5];
      deviceConfirmedIdentifier = v17;
      NSAppendPrintF();
      objc_storeStrong(v19, v192);
    }

    v20 = self->_bleNearbyActionV2Discovery;
    v21 = v20;
    if (v20)
    {
      v22 = (id *)(v198 + 5);
      id v191 = (id)v198[5];
      deviceConfirmedIdentifier = v20;
      NSAppendPrintF();
      objc_storeStrong(v22, v191);
    }

    v23 = self->_bleNeedsAWDLAdvertiser;
    if (v23)
    {
      v24 = (id *)(v198 + 5);
      id v190 = (id)v198[5];
      deviceConfirmedIdentifier = CUDescriptionWithLevel();
      NSAppendPrintF();
      objc_storeStrong(v24, v190);
    }
    v25 = self->_bleNeedsAWDLAdvertiserProcessName;
    v26 = v25;
    if (v25)
    {
      v27 = (id *)(v198 + 5);
      id v189 = (id)v198[5];
      deviceConfirmedIdentifier = v25;
      NSAppendPrintF();
      objc_storeStrong(v27, v189);
    }

    v28 = self->_bleNeedsAWDLScanner;
    if (v28)
    {
      v29 = (id *)(v198 + 5);
      id v188 = (id)v198[5];
      deviceConfirmedIdentifier = CUDescriptionWithLevel();
      NSAppendPrintF();
      objc_storeStrong(v29, v188);
    }
    v30 = self->_bonjourAdvertiser;
    if (v30)
    {
      v31 = (id *)(v198 + 5);
      id v187 = (id)v198[5];
      deviceConfirmedIdentifier = CUDescriptionWithLevel();
      NSAppendPrintF();
      objc_storeStrong(v31, v187);
    }
    v32 = self->_bonjourAWDLAdvertiser;
    if (v32)
    {
      v33 = (id *)(v198 + 5);
      id v186 = (id)v198[5];
      deviceConfirmedIdentifier = CUDescriptionWithLevel();
      NSAppendPrintF();
      objc_storeStrong(v33, v186);
    }
    if (self->_bonjourAWDLAdvertiserForce)
    {
      v34 = (id *)(v198 + 5);
      id v185 = (id)v198[5];
      NSAppendPrintF();
      objc_storeStrong(v34, v185);
    }
    v35 = self->_bonjourBrowser;
    if (v35)
    {
      v36 = (id *)(v198 + 5);
      id v184 = (id)v198[5];
      deviceConfirmedIdentifier = CUDescriptionWithLevel();
      NSAppendPrintF();
      objc_storeStrong(v36, v184);
    }
    v37 = self->_bonjourBrowserAWDL;
    if (v37)
    {
      v38 = (id *)(v198 + 5);
      id v183 = (id)v198[5];
      deviceConfirmedIdentifier = CUDescriptionWithLevel();
      NSAppendPrintF();
      objc_storeStrong(v38, v183);
    }
    if (self->_bonjourBrowserAWDLForce)
    {
      v39 = (id *)(v198 + 5);
      id v182 = (id)v198[5];
      NSAppendPrintF();
      objc_storeStrong(v39, v182);
    }
    v40 = self->_bonjourBrowserAWDLProcess;
    v41 = v40;
    if (v40)
    {
      v42 = (id *)(v198 + 5);
      id v181 = (id)v198[5];
      deviceConfirmedIdentifier = v40;
      NSAppendPrintF();
      objc_storeStrong(v42, v181);
    }

    v43 = self->_tcpServer;
    v44 = v43;
    if (v43)
    {
      v45 = (id *)(v198 + 5);
      id v180 = (id)v198[5];
      v46 = v43;
      if (objc_opt_respondsToSelector())
      {
        uint64_t v47 = [(CUTCPServer *)v46 detailedDescription];
      }
      else
      {
        if (objc_opt_respondsToSelector()) {
          [(CUTCPServer *)v46 descriptionWithLevel:20];
        }
        else {
        uint64_t v47 = NSPrintF();
        }
      }
      v48 = (void *)v47;

      deviceConfirmedIdentifier = v48;
      NSAppendPrintF();
      objc_storeStrong(v45, v180);
    }
    v49 = self->_deviceConfirmedIdentifier;
    if (v49)
    {
      v50 = (id *)(v198 + 5);
      id v179 = (id)v198[5];
      deviceConfirmedIdentifier = self->_deviceConfirmedIdentifier;
      NSAppendPrintF();
      objc_storeStrong(v50, v179);
    }

    v51 = self->_deviceSessionPaired;
    if (v51)
    {
      v52 = (id *)(v198 + 5);
      id v178 = (id)v198[5];
      deviceConfirmedIdentifier = self->_deviceSessionPaired;
      NSAppendPrintF();
      objc_storeStrong(v52, v178);
    }

    v53 = [(RPRemoteDisplayDaemon *)self dedicatedDevice];
    v54 = v53;
    if (v53)
    {
      v55 = (id *)(v198 + 5);
      id v177 = (id)v198[5];
      id v56 = v53;
      if (objc_opt_respondsToSelector())
      {
        uint64_t v57 = [v56 detailedDescription];
      }
      else
      {
        if (objc_opt_respondsToSelector()) {
          [v56 descriptionWithLevel:20];
        }
        else {
        uint64_t v57 = NSPrintF();
        }
      }
      v58 = (void *)v57;

      deviceConfirmedIdentifier = v58;
      NSAppendPrintF();
      objc_storeStrong(v55, v177);
    }
    v59 = [(NSMutableDictionary *)self->_activatedServerXPCCnxMap allValues];
    id v60 = [v59 count];
    if (v60)
    {
      v61 = (id *)(v198 + 5);
      id v176 = (id)v198[5];
      deviceConfirmedIdentifier = v60;
      NSAppendPrintF();
      objc_storeStrong(v61, v176);
    }
    long long v174 = 0u;
    long long v175 = 0u;
    long long v172 = 0u;
    long long v173 = 0u;
    id v131 = v59;
    v62 = (char *)[v131 countByEnumeratingWithState:&v172 objects:v206 count:16];
    if (v62)
    {
      uint64_t v63 = *(void *)v173;
      do
      {
        for (i = 0; i != v62; ++i)
        {
          if (*(void *)v173 != v63) {
            objc_enumerationMutation(v131);
          }
          v65 = (id *)(v198 + 5);
          id v171 = (id)v198[5];
          v114 = CUDescriptionWithLevel();
          NSAppendPrintF();
          objc_storeStrong(v65, v171);
        }
        v62 = (char *)[v131 countByEnumeratingWithState:&v172 objects:v206 count:16];
      }
      while (v62);
    }

    id v66 = [(NSMutableSet *)self->_bufferedConnections count];
    if (v66)
    {
      v67 = (id *)(v198 + 5);
      id v170 = (id)v198[5];
      deviceConfirmedIdentifier = v66;
      NSAppendPrintF();
      objc_storeStrong(v67, v170);
    }
    long long v168 = 0u;
    long long v169 = 0u;
    long long v166 = 0u;
    long long v167 = 0u;
    v68 = self->_bufferedConnections;
    v69 = (char *)[(NSMutableSet *)v68 countByEnumeratingWithState:&v166 objects:v205 count:16];
    if (v69)
    {
      uint64_t v70 = *(void *)v167;
      do
      {
        for (j = 0; j != v69; ++j)
        {
          if (*(void *)v167 != v70) {
            objc_enumerationMutation(v68);
          }
          v72 = (id *)(v198 + 5);
          id v165 = (id)v198[5];
          v115 = CUDescriptionWithLevel();
          NSAppendPrintF();
          objc_storeStrong(v72, v165);
        }
        v69 = (char *)-[NSMutableSet countByEnumeratingWithState:objects:count:](v68, "countByEnumeratingWithState:objects:count:", &v166, v205, 16, v115);
      }
      while (v69);
    }

    id v73 = [(NSMutableDictionary *)self->_tcpServerConnections count];
    if (v73)
    {
      v74 = (id *)(v198 + 5);
      id v164 = (id)v198[5];
      deviceConfirmedIdentifier = v73;
      NSAppendPrintF();
      objc_storeStrong(v74, v164);
    }
    tcpServerConnections = self->_tcpServerConnections;
    v162[0] = _NSConcreteStackBlock;
    v162[1] = 3221225472;
    v162[2] = sub_1000A2B6C;
    v162[3] = &unk_100124988;
    v162[4] = &v197;
    int v163 = v132;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](tcpServerConnections, "enumerateKeysAndObjectsUsingBlock:", v162, deviceConfirmedIdentifier);
    unint64_t v76 = (unint64_t)[(NSMutableDictionary *)self->_discoveredDevices count];
    unint64_t v77 = (unint64_t)[(NSMutableDictionary *)self->_unresolvedDevices count];
    if (v76 | v77)
    {
      v78 = (id *)(v198 + 5);
      id v161 = (id)v198[5];
      unint64_t v116 = v76;
      unint64_t v127 = v77;
      NSAppendPrintF();
      objc_storeStrong(v78, v161);
    }
    discoveredDevices = self->_discoveredDevices;
    v159[0] = _NSConcreteStackBlock;
    v159[1] = 3221225472;
    v159[2] = sub_1000A2BD8;
    v159[3] = &unk_1001249B0;
    v159[4] = &v197;
    int v160 = v132;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](discoveredDevices, "enumerateKeysAndObjectsUsingBlock:", v159, v116, v127);
    id v80 = [(NSMutableDictionary *)self->_needsAWDLDevices count];
    if (v80)
    {
      v81 = (id *)(v198 + 5);
      id v158 = (id)v198[5];
      id v117 = v80;
      NSAppendPrintF();
      objc_storeStrong(v81, v158);
    }
    v156[0] = 0;
    v156[1] = v156;
    v156[2] = 0x2020000000;
    int v157 = 0;
    needsAWDLDevices = self->_needsAWDLDevices;
    v154[0] = _NSConcreteStackBlock;
    v154[1] = 3221225472;
    v154[2] = sub_1000A2C60;
    v154[3] = &unk_1001249D8;
    int v155 = v132;
    v154[4] = &v197;
    v154[5] = v156;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](needsAWDLDevices, "enumerateKeysAndObjectsUsingBlock:", v154, v117);
    if ([(NSMutableSet *)self->_xpcConnections count]
      || [(NSMutableDictionary *)self->_xpcMatchingDiscoveryMap count]
      || [(NSMutableDictionary *)self->_xpcMatchingServerMap count])
    {
      v83 = (id *)(v198 + 5);
      id v153 = (id)v198[5];
      id v118 = [(NSMutableDictionary *)self->_xpcMatchingDiscoveryMap count];
      NSAppendPrintF();
      objc_storeStrong(v83, v153);
      xpcMatchingDiscoveryMap = self->_xpcMatchingDiscoveryMap;
      v152[0] = _NSConcreteStackBlock;
      v152[1] = 3221225472;
      v152[2] = sub_1000A2D54;
      v152[3] = &unk_1001215E0;
      v152[4] = &v197;
      -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](xpcMatchingDiscoveryMap, "enumerateKeysAndObjectsUsingBlock:", v152, v118);
      v85 = (id *)(v198 + 5);
      id v151 = (id)v198[5];
      id v119 = [(NSMutableDictionary *)self->_xpcMatchingServerMap count];
      NSAppendPrintF();
      objc_storeStrong(v85, v151);
      xpcMatchingServerMap = self->_xpcMatchingServerMap;
      v150[0] = _NSConcreteStackBlock;
      v150[1] = 3221225472;
      v150[2] = sub_1000A2E3C;
      v150[3] = &unk_1001215E0;
      v150[4] = &v197;
      -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](xpcMatchingServerMap, "enumerateKeysAndObjectsUsingBlock:", v150, v119);
      v87 = (id *)(v198 + 5);
      id v149 = (id)v198[5];
      id v120 = [(NSMutableSet *)self->_xpcConnections count];
      NSAppendPrintF();
      objc_storeStrong(v87, v149);
      long long v147 = 0u;
      long long v148 = 0u;
      long long v145 = 0u;
      long long v146 = 0u;
      v128 = self->_xpcConnections;
      id v88 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v128, "countByEnumeratingWithState:objects:count:", &v145, v204, 16, v120);
      if (v88)
      {
        uint64_t v129 = *(void *)v146;
        do
        {
          id v130 = v88;
          for (k = 0; k != v130; k = (char *)k + 1)
          {
            if (*(void *)v146 != v129) {
              objc_enumerationMutation(v128);
            }
            v90 = *(void **)(*((void *)&v145 + 1) + 8 * (void)k);
            v91 = (id *)(v198 + 5);
            id v144 = (id)v198[5];
            v92 = [v90 xpcCnx];
            id v121 = [v92 processIdentifier];
            NSAppendPrintF();
            objc_storeStrong(v91, v144);

            v93 = [v90 activatedDiscovery:v121];

            if (v93)
            {
              v94 = (id *)(v198 + 5);
              id v143 = (id)v198[5];
              v95 = [v90 activatedDiscovery];
              v122 = CUDescriptionWithLevel();
              NSAppendPrintF();
              objc_storeStrong(v94, v143);
            }
            v96 = [v90 activatedServer:v122];

            if (v96)
            {
              v97 = (id *)(v198 + 5);
              id v142 = (id)v198[5];
              v98 = [v90 activatedServer];
              v123 = CUDescriptionWithLevel();
              NSAppendPrintF();
              objc_storeStrong(v97, v142);
            }
            v99 = [v90 activatedSession:v123];

            if (v99)
            {
              v100 = (id *)(v198 + 5);
              id v141 = (id)v198[5];
              v101 = [v90 activatedSession];
              v124 = CUDescriptionWithLevel();
              NSAppendPrintF();
              objc_storeStrong(v100, v141);
            }
            v102 = [v90 activeNetCnx:v124];
            v103 = [v90 clientNetCnx];
            if (v102)
            {
              v104 = (id *)(v198 + 5);
              id v140 = (id)v198[5];
              v125 = CUDescriptionWithLevel();
              NSAppendPrintF();
              objc_storeStrong(v104, v140);
            }
            if (v103 && v103 != v102)
            {
              v105 = (id *)(v198 + 5);
              id v139 = (id)v198[5];
              v125 = CUDescriptionWithLevel();
              NSAppendPrintF();
              objc_storeStrong(v105, v139);
            }
            long long v137 = 0u;
            long long v138 = 0u;
            long long v135 = 0u;
            long long v136 = 0u;
            v106 = [v90 serverNetCnxs:v125];
            v107 = (char *)[v106 countByEnumeratingWithState:&v135 objects:v203 count:16];
            if (v107)
            {
              uint64_t v108 = *(void *)v136;
              do
              {
                for (m = 0; m != v107; ++m)
                {
                  if (*(void *)v136 != v108) {
                    objc_enumerationMutation(v106);
                  }
                  v110 = (id *)(v198 + 5);
                  id v134 = (id)v198[5];
                  v126 = CUDescriptionWithLevel();
                  NSAppendPrintF();
                  objc_storeStrong(v110, v134);
                }
                v107 = (char *)[v106 countByEnumeratingWithState:&v135 objects:v203 count:16];
              }
              while (v107);
            }

            v111 = (id *)(v198 + 5);
            id v133 = (id)v198[5];
            NSAppendPrintF();
            objc_storeStrong(v111, v133);
          }
          id v88 = [(NSMutableSet *)v128 countByEnumeratingWithState:&v145 objects:v204 count:16];
        }
        while (v88);
      }
    }
    id v4 = (id)v198[5];
    _Block_object_dispose(v156, 8);

    _Block_object_dispose(&v197, 8);
  }
  else
  {
    NSPrintF();
    id v4 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v4;
}

- (void)activate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000A2F98;
  block[3] = &unk_100121158;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_activate
{
  if (dword_1001426A0 <= 30 && (dword_1001426A0 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  RandomBytes();
  if (!self->_systemMonitor)
  {
    v3 = (CUSystemMonitor *)objc_alloc_init((Class)CUSystemMonitor);
    systemMonitor = self->_systemMonitor;
    self->_systemMonitor = v3;

    [(CUSystemMonitor *)self->_systemMonitor setDispatchQueue:self->_dispatchQueue];
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_1000A31F0;
    v11[3] = &unk_100121158;
    v11[4] = self;
    [(CUSystemMonitor *)self->_systemMonitor setFirstUnlockHandler:v11];
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_1000A31F8;
    v10[3] = &unk_100121158;
    v10[4] = self;
    [(CUSystemMonitor *)self->_systemMonitor setNetFlagsChangedHandler:v10];
    v5 = self->_systemMonitor;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_1000A3200;
    v9[3] = &unk_100121158;
    v9[4] = self;
    [(CUSystemMonitor *)v5 activateWithCompletion:v9];
  }
  if (!self->_xpcListener)
  {
    if (dword_1001426A0 <= 30 && (dword_1001426A0 != -1 || _LogCategory_Initialize()))
    {
      CFStringRef v8 = @"com.apple.RemoteDisplay";
      LogPrintF();
    }
    int v6 = (NSXPCListener *)[objc_alloc((Class)NSXPCListener) initWithMachServiceName:@"com.apple.RemoteDisplay"];
    xpcListener = self->_xpcListener;
    self->_xpcListener = v6;

    [(NSXPCListener *)self->_xpcListener setDelegate:self];
    [(NSXPCListener *)self->_xpcListener _setQueue:self->_dispatchQueue];
    [(NSXPCListener *)self->_xpcListener resume];
  }
  [(RPRemoteDisplayDaemon *)self _registerForWombatStateNotifications];
  [(RPRemoteDisplayDaemon *)self prefsChanged];
}

- (void)invalidate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000A327C;
  block[3] = &unk_100121158;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_invalidate
{
  if (!self->_invalidateCalled)
  {
    self->_invalidateCalled = 1;
    if (dword_1001426A0 <= 30 && (dword_1001426A0 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    [(NSXPCListener *)self->_xpcListener invalidate];
    xpcListener = self->_xpcListener;
    self->_xpcListener = 0;

    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v4 = self->_xpcConnections;
    id v5 = [(NSMutableSet *)v4 countByEnumeratingWithState:&v25 objects:v29 count:16];
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = *(void *)v26;
      do
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v26 != v7) {
            objc_enumerationMutation(v4);
          }
          v9 = [*(id *)(*((void *)&v25 + 1) + 8 * i) xpcCnx:v25];
          [v9 invalidate];
        }
        id v6 = [(NSMutableSet *)v4 countByEnumeratingWithState:&v25 objects:v29 count:16];
      }
      while (v6);
    }

    [(NSMutableDictionary *)self->_xpcMatchingDiscoveryMap removeAllObjects];
    [(NSMutableDictionary *)self->_xpcMatchingServerMap removeAllObjects];
    [(RPRemoteDisplayDaemon *)self _clientEnsureStopped];
    [(RPRemoteDisplayDaemon *)self _serverEnsureStopped];
    [(NSMutableSet *)self->_needsAWDLNewPeers removeAllObjects];
    needsAWDLNewPeers = self->_needsAWDLNewPeers;
    self->_needsAWDLNewPeers = 0;

    [(NSMutableSet *)self->_needsAWDLSentToPeers removeAllObjects];
    needsAWDLSentToPeers = self->_needsAWDLSentToPeers;
    self->_needsAWDLSentToPeers = 0;

    [(NSMutableSet *)self->_needsAWDLRequestIdentifiers removeAllObjects];
    needsAWDLRequestIdentifiers = self->_needsAWDLRequestIdentifiers;
    self->_needsAWDLRequestIdentifiers = 0;

    needsAWDLRequestTimer = self->_needsAWDLRequestTimer;
    if (needsAWDLRequestTimer)
    {
      v14 = needsAWDLRequestTimer;
      dispatch_source_cancel(v14);
      v15 = self->_needsAWDLRequestTimer;
      self->_needsAWDLRequestTimer = 0;
    }
    [(RPRemoteDisplayDaemon *)self _unregisterWombatStateNotifications];
    [(RPRemoteDisplayDaemon *)self _btAddressMonitorEnsureStopped];
    [(CUSystemMonitor *)self->_systemMonitor invalidate];
    systemMonitor = self->_systemMonitor;
    self->_systemMonitor = 0;

    personSelected = self->_personSelected;
    self->_personSelected = 0;

    discoverySessionExpirationTimer = self->_discoverySessionExpirationTimer;
    if (discoverySessionExpirationTimer)
    {
      v19 = discoverySessionExpirationTimer;
      dispatch_source_cancel(v19);
      v20 = self->_discoverySessionExpirationTimer;
      self->_discoverySessionExpirationTimer = 0;
    }
    inSessionDeviceLost = self->_inSessionDeviceLost;
    if (inSessionDeviceLost)
    {
      v22 = inSessionDeviceLost;
      dispatch_source_cancel(v22);
      v23 = self->_inSessionDeviceLost;
      self->_inSessionDeviceLost = 0;
    }
    [(RPRemoteDisplayDaemon *)self _clearConfirmationClientCache];
    [(RPRemoteDisplayDaemon *)self setDeviceConfirmedIdentifier:0];
    if (GestaltGetDeviceClass() == 1)
    {
      [(RPRemoteDisplayDaemon *)self _stopObservingOnenessEnabledState];
      authenticationManager = self->_authenticationManager;
      self->_authenticationManager = 0;
    }
    [(RPRemoteDisplayDaemon *)self _invalidated];
  }
}

- (void)_invalidated
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (self->_invalidateCalled
    && !self->_invalidateDone
    && ![(NSMutableDictionary *)self->_tcpServerConnections count]
    && !self->_tcpServer
    && ![(NSMutableSet *)self->_xpcConnections count]
    && !self->_xpcListener)
  {
    self->_invalidateDone = 1;
    if (dword_1001426A0 <= 30 && (dword_1001426A0 != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
}

- (void)daemonInfoChanged:(unint64_t)a3
{
  char v3 = a3;
  if ((a3 & 0x10) != 0)
  {
    if (dword_1001426A0 <= 30 && (dword_1001426A0 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    [(RPRemoteDisplayDaemon *)self _clientEnsureStopped];
    [(RPRemoteDisplayDaemon *)self _serverEnsureStopped];
    [(RPRemoteDisplayDaemon *)self _update];
    if ((v3 & 0x40) == 0)
    {
LABEL_3:
      if ((v3 & 4) == 0) {
        goto LABEL_24;
      }
      goto LABEL_11;
    }
  }
  else if ((a3 & 0x40) == 0)
  {
    goto LABEL_3;
  }
  [(RPRemoteDisplayDaemon *)self _update];
  if ((v3 & 4) == 0) {
    goto LABEL_24;
  }
LABEL_11:
  if (self->_deviceAuthTagStr)
  {
    if (dword_1001426A0 <= 30 && (dword_1001426A0 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    deviceAuthTagStr = self->_deviceAuthTagStr;
    self->_deviceAuthTagStr = 0;
  }
  if (self->_deviceAWDLRandomID)
  {
    if (dword_1001426A0 <= 30 && (dword_1001426A0 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    deviceAWDLRandomID = self->_deviceAWDLRandomID;
    self->_deviceAWDLRandomID = 0;
  }
  [(RPRemoteDisplayDaemon *)self _update];
LABEL_24:
  if ((v3 & 9) != 0)
  {
    [(RPRemoteDisplayDaemon *)self _clientBonjourReevaluateDevices];
    [(RPRemoteDisplayDaemon *)self _update];
  }
  if ((v3 & 0x20) != 0)
  {
    uint64_t v7 = +[RPDaemon sharedDaemon];
    id v8 = [v7 errorFlags];

    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    v9 = self->_xpcConnections;
    id v10 = [(NSMutableSet *)v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v15;
      do
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v15 != v12) {
            objc_enumerationMutation(v9);
          }
          [*(id *)(*((void *)&v14 + 1) + 8 * i) updateErrorFlags:v8, (void)v14];
        }
        id v11 = [(NSMutableSet *)v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v11);
    }
  }
}

- (BOOL)diagnosticCommand:(id)a3 params:(id)a4
{
  id v5 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if ([v5 rangeOfString:@"rdAWDLa" options:9] != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    BOOL bonjourAWDLAdvertiserForce = self->_bonjourAWDLAdvertiserForce;
    if (dword_1001426A0 <= 30 && (dword_1001426A0 != -1 || _LogCategory_Initialize()))
    {
      id v8 = "yes";
      if (bonjourAWDLAdvertiserForce) {
        v9 = "yes";
      }
      else {
        v9 = "no";
      }
      if (bonjourAWDLAdvertiserForce) {
        id v8 = "no";
      }
      long long v14 = v9;
      long long v15 = v8;
      LogPrintF();
    }
    self->_BOOL bonjourAWDLAdvertiserForce = !bonjourAWDLAdvertiserForce;
    goto LABEL_28;
  }
  if ([v5 rangeOfString:@"rdAWDLb" options:9] != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    BOOL bonjourBrowserAWDLForce = self->_bonjourBrowserAWDLForce;
    if (dword_1001426A0 <= 30 && (dword_1001426A0 != -1 || _LogCategory_Initialize()))
    {
      id v11 = "yes";
      if (bonjourBrowserAWDLForce) {
        uint64_t v12 = "yes";
      }
      else {
        uint64_t v12 = "no";
      }
      if (bonjourBrowserAWDLForce) {
        id v11 = "no";
      }
      long long v14 = v12;
      long long v15 = v11;
      LogPrintF();
    }
    self->_BOOL bonjourBrowserAWDLForce = !bonjourBrowserAWDLForce;
LABEL_28:
    [(RPRemoteDisplayDaemon *)self _update];
LABEL_29:
    BOOL v6 = 1;
    goto LABEL_30;
  }
  if (![v5 caseInsensitiveCompare:@"rdEval"])
  {
    if (dword_1001426A0 <= 30 && (dword_1001426A0 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    [(RPRemoteDisplayDaemon *)self _clientBonjourReevaluateDevices];
    goto LABEL_29;
  }
  BOOL v6 = 0;
LABEL_30:

  return v6;
}

- (void)prefsChanged
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  GestaltGetDeviceClass();
  BOOL v3 = CFPrefs_GetInt64() != 0;
  if (self->_prefBLEClient != v3)
  {
    if (dword_1001426A0 <= 30 && (dword_1001426A0 != -1 || _LogCategory_Initialize()))
    {
      id v4 = "yes";
      if (v3) {
        id v5 = "no";
      }
      else {
        id v5 = "yes";
      }
      if (!v3) {
        id v4 = "no";
      }
      unint64_t v60 = (unint64_t)v5;
      unint64_t v61 = (unint64_t)v4;
      LogPrintF();
    }
    self->_prefBLEClient = v3;
  }
  BOOL v6 = CFPrefs_GetInt64() != 0;
  if (self->_prefBLEServer != v6)
  {
    if (dword_1001426A0 <= 30 && (dword_1001426A0 != -1 || _LogCategory_Initialize()))
    {
      uint64_t v7 = "yes";
      if (v6) {
        id v8 = "no";
      }
      else {
        id v8 = "yes";
      }
      if (!v6) {
        uint64_t v7 = "no";
      }
      unint64_t v60 = (unint64_t)v8;
      unint64_t v61 = (unint64_t)v7;
      LogPrintF();
    }
    self->_prefBLEServer = v6;
  }
  BOOL v9 = CFPrefs_GetInt64() != 0;
  if (self->_prefClientEnabled != v9)
  {
    if (dword_1001426A0 <= 30 && (dword_1001426A0 != -1 || _LogCategory_Initialize()))
    {
      id v10 = "yes";
      if (v9) {
        id v11 = "no";
      }
      else {
        id v11 = "yes";
      }
      if (!v9) {
        id v10 = "no";
      }
      unint64_t v60 = (unint64_t)v11;
      unint64_t v61 = (unint64_t)v10;
      LogPrintF();
    }
    self->_prefClientEnabled = v9;
  }
  uint64_t Int64 = CFPrefs_GetInt64();
  BOOL v13 = Int64 != 0;
  if (self->_prefIgnoreRemoteDisplayChecks != v13)
  {
    if (dword_1001426A0 <= 30)
    {
      uint64_t v14 = Int64;
      if (dword_1001426A0 != -1 || _LogCategory_Initialize())
      {
        long long v15 = "yes";
        if (v14) {
          long long v16 = "no";
        }
        else {
          long long v16 = "yes";
        }
        if (!v14) {
          long long v15 = "no";
        }
        unint64_t v60 = (unint64_t)v16;
        unint64_t v61 = (unint64_t)v15;
        LogPrintF();
      }
    }
    self->_prefIgnoreRemoteDisplayChecks = v13;
  }
  BOOL v17 = CFPrefs_GetInt64() != 0;
  if (self->_prefNearbyActionV2 != v17)
  {
    if (dword_1001426A0 <= 30 && (dword_1001426A0 != -1 || _LogCategory_Initialize()))
    {
      v18 = "yes";
      if (v17) {
        v19 = "no";
      }
      else {
        v19 = "yes";
      }
      if (!v17) {
        v18 = "no";
      }
      unint64_t v60 = (unint64_t)v19;
      unint64_t v61 = (unint64_t)v18;
      LogPrintF();
    }
    self->_prefNearbyActionV2 = v17;
  }
  uint64_t v20 = CFPrefs_GetInt64();
  BOOL v21 = v20 != 0;
  if (self->_prefNoInfra != v21)
  {
    if (dword_1001426A0 <= 30)
    {
      uint64_t v22 = v20;
      if (dword_1001426A0 != -1 || _LogCategory_Initialize())
      {
        v23 = "yes";
        if (v22) {
          v24 = "no";
        }
        else {
          v24 = "yes";
        }
        if (!v22) {
          v23 = "no";
        }
        unint64_t v60 = (unint64_t)v24;
        unint64_t v61 = (unint64_t)v23;
        LogPrintF();
      }
    }
    self->_prefNoInfra = v21;
  }
  uint64_t v25 = CFPrefs_GetInt64();
  BOOL v26 = v25 != 0;
  if (self->_prefNoUSB != v26)
  {
    if (dword_1001426A0 <= 30)
    {
      uint64_t v27 = v25;
      if (dword_1001426A0 != -1 || _LogCategory_Initialize())
      {
        long long v28 = "yes";
        if (v27) {
          v29 = "no";
        }
        else {
          v29 = "yes";
        }
        if (!v27) {
          long long v28 = "no";
        }
        unint64_t v60 = (unint64_t)v29;
        unint64_t v61 = (unint64_t)v28;
        LogPrintF();
      }
    }
    self->_prefNoUSB = v26;
  }
  uint64_t v30 = CFPrefs_GetInt64();
  BOOL v31 = v30 != 0;
  if (self->_prefAllowPairingServer != v31)
  {
    if (dword_1001426A0 <= 30)
    {
      uint64_t v32 = v30;
      if (dword_1001426A0 != -1 || _LogCategory_Initialize())
      {
        v33 = "yes";
        if (v32) {
          v34 = "no";
        }
        else {
          v34 = "yes";
        }
        if (!v32) {
          v33 = "no";
        }
        unint64_t v60 = (unint64_t)v34;
        unint64_t v61 = (unint64_t)v33;
        LogPrintF();
      }
    }
    self->_prefAllowPairingServer = v31;
  }
  uint64_t v35 = CFPrefs_GetInt64();
  BOOL v36 = v35 != 0;
  if (self->_prefServerEnabled != v36)
  {
    if (dword_1001426A0 <= 30)
    {
      uint64_t v37 = v35;
      if (dword_1001426A0 != -1 || _LogCategory_Initialize())
      {
        v38 = "yes";
        if (v37) {
          v39 = "no";
        }
        else {
          v39 = "yes";
        }
        if (!v37) {
          v38 = "no";
        }
        unint64_t v60 = (unint64_t)v39;
        unint64_t v61 = (unint64_t)v38;
        LogPrintF();
      }
    }
    self->_prefServerEnabled = v36;
  }
  uint64_t v40 = CFPrefs_GetInt64();
  BOOL v41 = v40 != 0;
  if (self->_prefServerBonjourInfra != v41)
  {
    if (dword_1001426A0 <= 30)
    {
      uint64_t v42 = v40;
      if (dword_1001426A0 != -1 || _LogCategory_Initialize())
      {
        v43 = "yes";
        if (v42) {
          v44 = "no";
        }
        else {
          v44 = "yes";
        }
        if (!v42) {
          v43 = "no";
        }
        unint64_t v60 = (unint64_t)v44;
        unint64_t v61 = (unint64_t)v43;
        LogPrintF();
      }
    }
    self->_prefServerBonjourInfra = v41;
  }
  unint64_t v45 = CFPrefs_GetInt64();
  if (v45 <= 0x3E8 && v45 != 0) {
    unint64_t v48 = v45;
  }
  else {
    unint64_t v48 = 60;
  }
  unint64_t prefCameraCapabilitiesRetrySeconds = self->_prefCameraCapabilitiesRetrySeconds;
  if (v48 != prefCameraCapabilitiesRetrySeconds)
  {
    if (dword_1001426A0 <= 30)
    {
      if (dword_1001426A0 == -1)
      {
        if (!_LogCategory_Initialize()) {
          goto LABEL_125;
        }
        unint64_t prefCameraCapabilitiesRetrySeconds = self->_prefCameraCapabilitiesRetrySeconds;
      }
      unint64_t v60 = prefCameraCapabilitiesRetrySeconds;
      unint64_t v61 = v48;
      LogPrintF();
    }
LABEL_125:
    self->_unint64_t prefCameraCapabilitiesRetrySeconds = v48;
  }
  unint64_t v50 = CFPrefs_GetInt64();
  if (v50 <= 0x7080 && v50 != 0) {
    unint64_t v53 = v50;
  }
  else {
    unint64_t v53 = 28800;
  }
  unint64_t prefDiscoverySessionExpirationSeconds = self->_prefDiscoverySessionExpirationSeconds;
  if (v53 != prefDiscoverySessionExpirationSeconds)
  {
    if (dword_1001426A0 <= 30)
    {
      if (dword_1001426A0 == -1)
      {
        if (!_LogCategory_Initialize()) {
          goto LABEL_140;
        }
        unint64_t prefDiscoverySessionExpirationSeconds = self->_prefDiscoverySessionExpirationSeconds;
      }
      unint64_t v60 = prefDiscoverySessionExpirationSeconds;
      unint64_t v61 = v53;
      LogPrintF();
    }
LABEL_140:
    self->_unint64_t prefDiscoverySessionExpirationSeconds = v53;
  }
  unint64_t v55 = CFPrefs_GetInt64();
  if (v55 <= 0x5A && v55 != 0) {
    unint64_t v58 = v55;
  }
  else {
    unint64_t v58 = 90;
  }
  unint64_t prefInSessionDeviceLostSeconds = self->_prefInSessionDeviceLostSeconds;
  if (v58 != prefInSessionDeviceLostSeconds)
  {
    if (dword_1001426A0 <= 30)
    {
      if (dword_1001426A0 == -1)
      {
        if (!_LogCategory_Initialize()) {
          goto LABEL_155;
        }
        unint64_t prefInSessionDeviceLostSeconds = self->_prefInSessionDeviceLostSeconds;
      }
      unint64_t v60 = prefInSessionDeviceLostSeconds;
      unint64_t v61 = v58;
      LogPrintF();
    }
LABEL_155:
    self->_unint64_t prefInSessionDeviceLostSeconds = v58;
  }
  [(RPRemoteDisplayDaemon *)self _update];
}

- (BOOL)addXPCMatchingToken:(unint64_t)a3 event:(id)a4 handler:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  CFStringGetTypeID();
  uint64_t v9 = CFDictionaryGetTypedValue();
  if (v9) {
    id v10 = (__CFString *)v9;
  }
  else {
    id v10 = @"_rdlink._tcp";
  }
  CFDictionaryGetTypeID();
  id v11 = CFDictionaryGetTypedValue();
  uint64_t v12 = 0;
  BOOL v13 = 0;
  uint64_t v14 = 0;
  if (!v11)
  {
LABEL_8:
    CFStringGetTypeID();
    long long v16 = CFDictionaryGetTypedValue();
    if ([v16 isEqual:@"discovery"])
    {
      uint64_t v35 = v11;
      BOOL v36 = v10;
      BOOL v17 = objc_alloc_init(RPXPCMatchingEntry);
      [(RPXPCMatchingEntry *)v17 setEvent:v7];
      id v37 = v8;
      [(RPXPCMatchingEntry *)v17 setHandler:v8];
      [(RPXPCMatchingEntry *)v17 setToken:a3];
      [(RPXPCMatchingEntry *)v17 setAngelJobLabel:v14];
      [(RPXPCMatchingEntry *)v17 setAngelAssertionName:v13];
      xpcMatchingDiscoveryMap = self->_xpcMatchingDiscoveryMap;
      if (!xpcMatchingDiscoveryMap)
      {
        v19 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
        uint64_t v20 = self->_xpcMatchingDiscoveryMap;
        self->_xpcMatchingDiscoveryMap = v19;

        xpcMatchingDiscoveryMap = self->_xpcMatchingDiscoveryMap;
      }
      BOOL v21 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", a3, v29, v31);
      [(NSMutableDictionary *)xpcMatchingDiscoveryMap setObject:v17 forKeyedSubscript:v21];

      if (dword_1001426A0 <= 30 && (dword_1001426A0 != -1 || _LogCategory_Initialize()))
      {
        CFStringRef v22 = &stru_100125378;
        if (v12) {
          CFStringRef v22 = v12;
        }
        CFStringRef v33 = v22;
        LogPrintF();
        [(RPRemoteDisplayDaemon *)self _updateXPCMatchingDiscovery];
      }
      else
      {
        [(RPRemoteDisplayDaemon *)self _updateXPCMatchingDiscovery];
      }
    }
    else
    {
      if (([v16 isEqual:@"server"] & 1) == 0
        && ![v16 isEqual:@"rdserver"])
      {
        BOOL v27 = 0;
LABEL_32:

        goto LABEL_37;
      }
      uint64_t v35 = v11;
      BOOL v17 = objc_alloc_init(RPXPCMatchingEntry);
      [(RPXPCMatchingEntry *)v17 setEvent:v7];
      id v37 = v8;
      [(RPXPCMatchingEntry *)v17 setHandler:v8];
      [(RPXPCMatchingEntry *)v17 setToken:a3];
      BOOL v36 = v10;
      [(RPXPCMatchingEntry *)v17 setServiceType:v10];
      [(RPXPCMatchingEntry *)v17 setAngelJobLabel:v14];
      [(RPXPCMatchingEntry *)v17 setAngelAssertionName:v13];
      xpcMatchingServerMap = self->_xpcMatchingServerMap;
      if (!xpcMatchingServerMap)
      {
        v24 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
        uint64_t v25 = self->_xpcMatchingServerMap;
        self->_xpcMatchingServerMap = v24;

        xpcMatchingServerMap = self->_xpcMatchingServerMap;
      }
      BOOL v26 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", a3, v29, v31);
      [(NSMutableDictionary *)xpcMatchingServerMap setObject:v17 forKeyedSubscript:v26];

      if (dword_1001426A0 > 30)
      {
        id v10 = v36;
        id v8 = v37;
LABEL_31:
        id v11 = v35;

        [(RPRemoteDisplayDaemon *)self _update];
        BOOL v27 = 1;
        goto LABEL_32;
      }
      if (dword_1001426A0 != -1 || _LogCategory_Initialize()) {
        LogPrintF();
      }
    }
    id v10 = v36;
    id v8 = v37;
    goto LABEL_31;
  }
  CFStringGetTypeID();
  uint64_t v14 = CFDictionaryGetTypedValue();
  CFStringGetTypeID();
  uint64_t v15 = CFDictionaryGetTypedValue();
  BOOL v13 = (void *)v15;
  if (v14 && v15)
  {
    v29 = v14;
    uint64_t v31 = v15;
    NSAppendPrintF();
    uint64_t v12 = (__CFString *)0;
    goto LABEL_8;
  }
  if (dword_1001426A0 <= 30 && (dword_1001426A0 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  BOOL v27 = 0;
LABEL_37:

  return v27;
}

- (BOOL)removeXPCMatchingToken:(unint64_t)a3
{
  id v5 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:");
  BOOL v6 = [(NSMutableDictionary *)self->_xpcMatchingDiscoveryMap objectForKeyedSubscript:v5];

  if (v6)
  {
    [(NSMutableDictionary *)self->_xpcMatchingDiscoveryMap setObject:0 forKeyedSubscript:v5];
    if (dword_1001426A0 > 30 || dword_1001426A0 == -1 && !_LogCategory_Initialize()) {
      goto LABEL_13;
    }
    goto LABEL_8;
  }
  id v7 = [(NSMutableDictionary *)self->_xpcMatchingServerMap objectForKeyedSubscript:v5];

  if (v7)
  {
    [(NSMutableDictionary *)self->_xpcMatchingServerMap setObject:0 forKeyedSubscript:v5];
    if (dword_1001426A0 > 30 || dword_1001426A0 == -1 && !_LogCategory_Initialize()) {
      goto LABEL_13;
    }
LABEL_8:
    unint64_t v10 = a3;
    LogPrintF();
LABEL_13:
    [(RPRemoteDisplayDaemon *)self _update];
    BOOL v8 = 1;
    goto LABEL_14;
  }
  BOOL v8 = 0;
LABEL_14:

  return v8;
}

- (void)_update
{
  BOOL v3 = self->_prefClientEnabled
    || [(NSMutableSet *)self->_activatedDiscoverySet count]
    || [(NSMutableSet *)self->_activatedSessionSet count]
    || [(NSMutableDictionary *)self->_xpcMatchingDiscoveryMap count] != 0;
  if (self->_prefServerEnabled || [(NSMutableDictionary *)self->_activatedServerXPCCnxMap count])
  {
    BOOL v4 = 1;
LABEL_8:
    [(RPRemoteDisplayDaemon *)self _localDeviceUpdate];
    [(RPRemoteDisplayDaemon *)self _btAddressMonitorEnsureStarted];
    goto LABEL_9;
  }
  id v10 = [(NSMutableDictionary *)self->_xpcMatchingServerMap count];
  BOOL v4 = v10 != 0;
  if (v10) {
    int v11 = 1;
  }
  else {
    int v11 = v3;
  }
  if (v11 == 1) {
    goto LABEL_8;
  }
  [(RPRemoteDisplayDaemon *)self _btAddressMonitorEnsureStopped];
  BOOL v4 = 0;
LABEL_9:
  if (v3) {
    [(RPRemoteDisplayDaemon *)self _clientEnsureStarted];
  }
  else {
    [(RPRemoteDisplayDaemon *)self _clientEnsureStopped];
  }
  id v5 = +[RPIdentityDaemon sharedIdentityDaemon];
  id v13 = [v5 identitiesOfType:13 error:0];

  BOOL v6 = +[RPIdentityDaemon sharedIdentityDaemon];
  id v7 = [v6 identitiesOfType:12 error:0];

  if (v4)
  {
    BOOL v8 = +[RPCloudDaemon sharedCloudDaemon];
    uint64_t v9 = [v8 idsDeviceArray];
    if ([v9 count] || objc_msgSend(v13, "count"))
    {

LABEL_16:
      [(RPRemoteDisplayDaemon *)self _serverEnsureStarted];
      goto LABEL_24;
    }
    id v12 = [v7 count];

    if (v12) {
      goto LABEL_16;
    }
  }
  [(RPRemoteDisplayDaemon *)self _serverEnsureStopped];
LABEL_24:
  if ([(RPRemoteDisplayDaemon *)self _needToHoldPowerAssertion]) {
    [(RPRemoteDisplayDaemon *)self _powerAssertionEnsureHeld];
  }
  else {
    [(RPRemoteDisplayDaemon *)self _powerAssertionEnsureReleased];
  }
}

- (void)_updateXPCMatchingDiscovery
{
  BOOL v3 = [(NSMutableDictionary *)self->_discoveredDevices count] == 0;
  xpcMatchingDiscoveryMap = self->_xpcMatchingDiscoveryMap;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000A4BD0;
  v6[3] = &unk_100124A28;
  char v5 = !v3;
  char v7 = v5;
  v6[4] = self;
  [(NSMutableDictionary *)xpcMatchingDiscoveryMap enumerateKeysAndObjectsUsingBlock:v6];
}

- (void)_bluetoothUseCaseFromWombatState:(unsigned int)a3 resultBlock:(id)a4
{
  uint64_t v6 = 131078;
  id v7 = a4;
  id v11 = v7;
  if (a3 == 2)
  {
    uint64_t v8 = 40;
    uint64_t v9 = 40;
  }
  else if (a3 == 3)
  {
    uint64_t v6 = 131080;
    uint64_t v8 = 30;
    uint64_t v9 = 30;
  }
  else
  {
    BOOL v10 = ![(RPRemoteDisplayDaemon *)self _onenessEnabled];
    id v7 = v11;
    if (v10) {
      uint64_t v6 = 0x20000;
    }
    else {
      uint64_t v6 = 131101;
    }
    uint64_t v9 = 20;
    uint64_t v8 = 30;
  }
  (*((void (**)(id, uint64_t, uint64_t, uint64_t))v7 + 2))(v7, v6, v8, v9);
}

- (void)_connectionConfigureCommon:(id)a3
{
  id v4 = a3;
  [(NSMutableDictionary *)self->_activatedServerXPCCnxMap allValues];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  id v6 = [v5 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v21;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v21 != v8) {
          objc_enumerationMutation(v5);
        }
        BOOL v10 = [*(id *)(*((void *)&v20 + 1) + 8 * i) activatedServer];
        unsigned int v11 = [v10 passwordType];
        if (v11 > 4 || ((1 << v11) & 0x19) == 0)
        {
          id v13 = [v10 password];
          [v4 setPassword:v13];

          [v4 setPasswordType:[v10 passwordType]];
          unsigned __int8 v14 = [v10 internalAuthFlags];
          if (v14)
          {
            v19[0] = _NSConcreteStackBlock;
            v19[1] = 3221225472;
            v19[2] = sub_1000A5184;
            v19[3] = &unk_100121CF0;
            v19[4] = v10;
            [v4 setShowPasswordHandler:v19];
          }
          if ((v14 & 2) != 0)
          {
            v18[0] = _NSConcreteStackBlock;
            v18[1] = 3221225472;
            v18[2] = sub_1000A51FC;
            v18[3] = &unk_100121D18;
            v18[4] = v10;
            [v4 setHidePasswordHandler:v18];
          }

          goto LABEL_18;
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v20 objects:v24 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_18:

  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_1000A525C;
  v16[3] = &unk_1001222C0;
  v16[4] = self;
  id v17 = v4;
  id v15 = v4;
  [v15 setAuthCompletionHandler:v16];
}

- (void)_updateForXPCClientChange
{
  if (GestaltGetDeviceClass() == 4) {
    int64_t v3 = -75;
  }
  else {
    int64_t v3 = -60;
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v4 = self->_activatedDiscoverySet;
  id v5 = [(NSMutableSet *)v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    id v6 = v5;
    char v7 = 0;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v4);
        }
        BOOL v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        id v11 = [v10 rssiThreshold:v13];
        if ((uint64_t)v11 >= v3) {
          int64_t v12 = v3;
        }
        else {
          int64_t v12 = (int64_t)v11;
        }
        if (v11) {
          int64_t v3 = v12;
        }
        if ([v10 triggerEnhancedDiscovery])
        {
          [v10 setTriggerEnhancedDiscovery:0];
          char v7 = 1;
        }
      }
      id v6 = [(NSMutableSet *)v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);

    self->_bleRSSIThreshold = v3;
    if (v7) {
      [(RPRemoteDisplayDaemon *)self _bleDiscoveryTriggerEnhancedDiscovery:@"RemoteDisplayDiscovery" useCase:131076];
    }
  }
  else
  {

    self->_bleRSSIThreshold = v3;
  }
  [(RPRemoteDisplayDaemon *)self _update];
}

- (void)_clientEnsureStarted
{
  int DeviceClass = GestaltGetDeviceClass();
  if ([(CUSystemMonitor *)self->_systemMonitor firstUnlocked])
  {
    [(RPRemoteDisplayDaemon *)self _clientBonjourEnsureStarted];
    if ([(RPRemoteDisplayDaemon *)self _clientBLEDiscoveryShouldRun]) {
      [(RPRemoteDisplayDaemon *)self _clientBLEDiscoveryEnsureStarted];
    }
    else {
      [(RPRemoteDisplayDaemon *)self _clientBLEDiscoveryEnsureStopped];
    }
    if ([(RPRemoteDisplayDaemon *)self _clientBLENearbyActionV2AdvertiserShouldRun])
    {
      [(RPRemoteDisplayDaemon *)self _clientBLENearbyActionV2AdvertiserEnsureStarted];
    }
    else
    {
      [(RPRemoteDisplayDaemon *)self _clientBLENearbyActionV2AdvertiserEnsureStopped];
    }
    if ([(RPRemoteDisplayDaemon *)self _clientBLENeedsAWDLAdvertiserShouldRun]) {
      [(RPRemoteDisplayDaemon *)self _clientBLENeedsAWDLAdvertiserEnsureStarted];
    }
    else {
      [(RPRemoteDisplayDaemon *)self _clientBLENeedsAWDLAdvertiserEnsureStopped];
    }
    if ([(RPRemoteDisplayDaemon *)self _clientBonjourAWDLBrowserShouldRun]) {
      [(RPRemoteDisplayDaemon *)self _clientBonjourAWDLBrowserEnsureStarted];
    }
    else {
      [(RPRemoteDisplayDaemon *)self _clientBonjourAWDLBrowserEnsureStopped];
    }
    if (DeviceClass == 100 || DeviceClass == 4)
    {
      [(RPRemoteDisplayDaemon *)self _registerForIncomingMessages];
    }
  }
  else if (dword_1001426A0 <= 30 && (dword_1001426A0 != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
}

- (void)_clientEnsureStopped
{
  [(RPRemoteDisplayDaemon *)self _clientLostAllDevices];
  [(RPRemoteDisplayDaemon *)self _clientBLEDiscoveryEnsureStopped];
  [(RPRemoteDisplayDaemon *)self _clientBLENeedsAWDLAdvertiserEnsureStopped];
  [(RPRemoteDisplayDaemon *)self _clientBonjourAWDLBrowserEnsureStopped];
  [(RPRemoteDisplayDaemon *)self _clientBonjourEnsureStopped];
  clientIncomingMessageCLinkClient = self->_clientIncomingMessageCLinkClient;
  if (clientIncomingMessageCLinkClient)
  {
    [(RPCompanionLinkClient *)clientIncomingMessageCLinkClient invalidate];
    id v4 = self->_clientIncomingMessageCLinkClient;
    self->_clientIncomingMessageCLinkClient = 0;
  }
}

- (void)_bleDiscoveryEnsureStarted:(BOOL)a3
{
  BOOL v3 = a3;
  bleDiscovery = self->_bleDiscovery;
  if (!bleDiscovery)
  {
    bleDiscoveryID = (const char *)self->_bleDiscoveryID;
    if (dword_1001426A0 <= 30 && (dword_1001426A0 != -1 || _LogCategory_Initialize()))
    {
      long long v15 = bleDiscoveryID;
      LogPrintF();
    }
    id v11 = (SFDeviceDiscovery *)objc_alloc_init((Class)off_100142710[0]());
    int64_t v12 = self->_bleDiscovery;
    self->_bleDiscovery = v11;

    [(SFDeviceDiscovery *)self->_bleDiscovery setChangeFlags:1];
    [(SFDeviceDiscovery *)self->_bleDiscovery setDiscoveryFlags:1];
    if ([(RPRemoteDisplayDaemon *)self _discoveriCloudDevicesOnly]) {
      [(SFDeviceDiscovery *)self->_bleDiscovery setDiscoveryFlags:(unint64_t)[(SFDeviceDiscovery *)self->_bleDiscovery discoveryFlags] | 0x20];
    }
    -[SFDeviceDiscovery setDispatchQueue:](self->_bleDiscovery, "setDispatchQueue:", self->_dispatchQueue, v15);
    [(SFDeviceDiscovery *)self->_bleDiscovery setPurpose:@"RDLink"];
    [(SFDeviceDiscovery *)self->_bleDiscovery setRssiChangeDetection:1];
    if (GestaltGetDeviceClass() == 4)
    {
      int64_t bleRSSIThreshold = -75;
    }
    else if (self->_bleRSSIThreshold)
    {
      int64_t bleRSSIThreshold = self->_bleRSSIThreshold;
    }
    else
    {
      int64_t bleRSSIThreshold = -60;
    }
    [(SFDeviceDiscovery *)self->_bleDiscovery setRssiThreshold:bleRSSIThreshold];
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_1000A5A6C;
    v24[3] = &unk_100121890;
    v24[4] = self;
    int v25 = (int)bleDiscoveryID;
    [(SFDeviceDiscovery *)self->_bleDiscovery setDeviceFoundHandler:v24];
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_1000A5A90;
    v22[3] = &unk_100121890;
    v22[4] = self;
    int v23 = (int)bleDiscoveryID;
    [(SFDeviceDiscovery *)self->_bleDiscovery setDeviceLostHandler:v22];
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_1000A5AB4;
    v20[3] = &unk_1001218B8;
    v20[4] = self;
    int v21 = (int)bleDiscoveryID;
    [(SFDeviceDiscovery *)self->_bleDiscovery setDeviceChangedHandler:v20];
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_1000A5AD8;
    v18[3] = &unk_1001218E0;
    v18[4] = self;
    int v19 = (int)bleDiscoveryID;
    [(SFDeviceDiscovery *)self->_bleDiscovery setInterruptionHandler:v18];
    if (v3) {
      goto LABEL_27;
    }
LABEL_7:
    if (bleDiscovery) {
      return;
    }
LABEL_32:
    long long v14 = self->_bleDiscovery;
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_1000A5B70;
    v17[3] = &unk_100121908;
    v17[4] = self;
    [(SFDeviceDiscovery *)v14 activateWithCompletion:v17];
    return;
  }
  unsigned int v6 = [(RPRemoteDisplayDaemon *)self _discoveriCloudDevicesOnly];
  char v7 = self->_bleDiscovery;
  unint64_t v8 = (unint64_t)[(SFDeviceDiscovery *)v7 discoveryFlags];
  if (v6) {
    uint64_t v9 = v8 | 0x20;
  }
  else {
    uint64_t v9 = v8 & 0xFFFFFFDF;
  }
  [(SFDeviceDiscovery *)v7 setDiscoveryFlags:v9];
  if ([(SFDeviceDiscovery *)self->_bleDiscovery rssiThreshold] != self->_bleRSSIThreshold)
  {
    if (dword_1001426A0 <= 30 && (dword_1001426A0 != -1 || _LogCategory_Initialize()))
    {
      long long v15 = (const char *)[(SFDeviceDiscovery *)self->_bleDiscovery rssiThreshold];
      int64_t v16 = self->_bleRSSIThreshold;
      LogPrintF();
    }
    -[SFDeviceDiscovery setRssiThreshold:](self->_bleDiscovery, "setRssiThreshold:", self->_bleRSSIThreshold, v15, v16);
    if (v3) {
      goto LABEL_27;
    }
    goto LABEL_7;
  }
  if (!v3) {
    goto LABEL_7;
  }
LABEL_27:
  if (dword_1001426A0 <= 30 && (dword_1001426A0 != -1 || _LogCategory_Initialize()))
  {
    long long v15 = "yes";
    LogPrintF();
  }
  -[SFDeviceDiscovery setOverrideScreenOff:](self->_bleDiscovery, "setOverrideScreenOff:", 1, v15);
  if (!bleDiscovery) {
    goto LABEL_32;
  }
}

- (void)_bleDiscoveryEnsureStopped
{
  if (self->_bleDiscovery)
  {
    if (dword_1001426A0 <= 30 && (dword_1001426A0 != -1 || _LogCategory_Initialize()))
    {
      uint64_t bleDiscoveryID = self->_bleDiscoveryID;
      LogPrintF();
    }
    [(SFDeviceDiscovery *)self->_bleDiscovery invalidate];
    bleDiscovery = self->_bleDiscovery;
    self->_bleDiscovery = 0;

    ++self->_bleDiscoveryID;
  }
}

- (void)_bleDiscoveryTriggerEnhancedDiscovery:(id)a3 useCase:(unsigned int)a4
{
  bleDiscovery = self->_bleDiscovery;
  if (bleDiscovery)
  {
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_1000A5DA0;
    v5[3] = &unk_100124A48;
    unsigned int v6 = a4;
    [(SFDeviceDiscovery *)bleDiscovery triggerEnhancedDiscovery:a3 useCase:*(void *)&a4 completion:v5];
  }
}

- (BOOL)_discoveriCloudDevicesOnly
{
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v2 = self->_activatedDiscoverySet;
  id v3 = [(NSMutableSet *)v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = 0;
    uint64_t v6 = *(void *)v11;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v2);
        }
        unint64_t v8 = (unint64_t)[*(id *)(*((void *)&v10 + 1) + 8 * i) discoveryFlags:v10];
        if (v8) {
          v5 |= v8;
        }
      }
      id v4 = [(NSMutableSet *)v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v4);
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5 == 0;
}

- (void)_clientBLEDiscoveryEnsureStarted
{
  self->_clientBLEDiscoveryStarted = 1;
}

- (void)_clientBLEDiscoveryEnsureStopped
{
  if (self->_clientBLEDiscoveryStarted) {
    [(RPRemoteDisplayDaemon *)self _bleDiscoveryEnsureStopped];
  }
}

- (void)_clientBLEDiscoveryDeviceFound:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 model];
  uint64_t v6 = v5;
  if (v5)
  {
    if (([v5 hasPrefix:@"iPhone"] & 1) != 0
      || ([v6 hasPrefix:@"iPad"] & 1) != 0
      || ([v6 hasPrefix:@"iPod"] & 1) != 0
      || ([v6 hasPrefix:@"RealityDevice"] & 1) != 0
      || self->_prefIgnoreRemoteDisplayChecks)
    {
      char v7 = [v4 idsIdentifier];
      if (!v7)
      {
        if (dword_1001426A0 <= 90 && (dword_1001426A0 != -1 || _LogCategory_Initialize())) {
          LogPrintF();
        }
        goto LABEL_97;
      }
      unint64_t v8 = +[RPCloudDaemon sharedCloudDaemon];
      uint64_t v9 = [v8 idsDeviceMap];
      long long v10 = [v9 objectForKeyedSubscript:v7];

      if (([v4 deviceFlags] & 8) == 0 || v10)
      {
        int v11 = GestaltProductTypeStringToDeviceClass();
        uint64_t v63 = 0;
        uint64_t v64 = 0;
        uint64_t v65 = 0;
        if (v10
          && (int v12 = v11, [v10 operatingSystemVersion], v12)
          && (wInTP56r94EFs9NAAi() & 1) == 0
          && !self->_prefIgnoreRemoteDisplayChecks)
        {
          if (dword_1001426A0 > 30 || dword_1001426A0 == -1 && !_LogCategory_Initialize()) {
            goto LABEL_96;
          }
        }
        else if (GestaltGetDeviceClass() == 4 {
               && ![(RPRemoteDisplayDaemon *)self _deviceSupportsLaguna:v4])
        }
        {
          if (dword_1001426A0 > 20 || dword_1001426A0 == -1 && !_LogCategory_Initialize()) {
            goto LABEL_96;
          }
        }
        else
        {
          if (((unsigned __int16)[v4 deviceFlags] & 0xC008) != 0)
          {
            uint64_t v13 = [(RPRemoteDisplayDaemon *)self _findMatchingDeviceWithIdentifier:v7];
            if (v13)
            {
              long long v14 = (void *)v13;
              if (dword_1001426A0 <= 30 && (dword_1001426A0 != -1 || _LogCategory_Initialize()))
              {
                uint64_t v47 = CUDescriptionWithLevel();
                LogPrintF();
              }
              unsigned __int16 v15 = (unsigned __int16)[v14 statusFlags:v47];
              id v16 = [v14 updateWithSFDevice:v4];
              [v14 setIdsDeviceIdentifier:v7];
              [(RPRemoteDisplayDaemon *)self _requestCameraCapabilitiesForDevice:v14];
              if (v16)
              {
                unsigned __int16 v48 = v15;
                v49 = self;
                v51 = v10;
                unint64_t v53 = v7;
                unint64_t v50 = v6;
                long long v61 = 0u;
                long long v62 = 0u;
                long long v59 = 0u;
                long long v60 = 0u;
                id v17 = self->_xpcConnections;
                id v18 = [(NSMutableSet *)v17 countByEnumeratingWithState:&v59 objects:v69 count:16];
                if (v18)
                {
                  id v19 = v18;
                  uint64_t v20 = *(void *)v60;
                  do
                  {
                    for (i = 0; i != v19; i = (char *)i + 1)
                    {
                      if (*(void *)v60 != v20) {
                        objc_enumerationMutation(v17);
                      }
                      long long v22 = *(void **)(*((void *)&v59 + 1) + 8 * i);
                      int v23 = [v22 activatedDiscovery];
                      unsigned int v24 = [v23 shouldReportDevice:v14];

                      if (v24)
                      {
                        int v25 = [v22 xpcCnx];
                        BOOL v26 = [v25 remoteObjectProxy];
                        [v26 remoteDisplayChangedDevice:v14 changes:v16];
                      }
                    }
                    id v19 = [(NSMutableSet *)v17 countByEnumeratingWithState:&v59 objects:v69 count:16];
                  }
                  while (v19);
                }

                if ((v48 & 0x200) != 0 && ([v14 statusFlags] & 0x200) == 0) {
                  [(RPRemoteDisplayDaemon *)v49 _clientBonjourReconfirmDevice:v14 reason:"WiFiP2P lost"];
                }
                uint64_t v6 = v50;
                long long v10 = v51;
                char v7 = v53;
                if ((v16 & 1) != 0
                  && [(RPRemoteDisplayDevice *)v49->_bleNearbyActionV2Device isEqualToDevice:v14])
                {
                  [(RPRemoteDisplayDevice *)v49->_bleNearbyActionV2Device updateWithSFDevice:v4];
                  [(RPRemoteDisplayDaemon *)v49 _clientBLENearbyActionV2AdvertiserUpdate];
                }
                if (((unsigned __int16)v16 & 0x400) != 0)
                {
                  deviceConfirmedIdentifier = v49->_deviceConfirmedIdentifier;
                  if (deviceConfirmedIdentifier)
                  {
                    if ([(NSString *)deviceConfirmedIdentifier isEqualToString:v53]
                      && ([v14 inDiscoverySession] & 1) == 0)
                    {
                      [(RPRemoteDisplayDaemon *)v49 _startInSessionDeviceLostTimer];
                    }
                  }
                }
              }
            }
            else
            {
              if (dword_1001426A0 <= 30 && (dword_1001426A0 != -1 || _LogCategory_Initialize()))
              {
                uint64_t v47 = CUDescriptionWithLevel();
                LogPrintF();
              }
              long long v28 = sub_1000A71C0();
              v29 = sub_1000A71C0();
              os_signpost_id_t v30 = os_signpost_id_make_with_pointer(v29, self);

              if (v30 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v28))
              {
                uint64_t v31 = CUDescriptionWithLevel();
                *(_DWORD *)buf = 138412290;
                v68 = v31;
                _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v28, OS_SIGNPOST_EVENT, v30, "BLE device found", "BLE device found: %@\n", buf, 0xCu);
              }
              id v32 = objc_alloc_init((Class)RPRemoteDisplayDevice);
              [v32 setIdentifier:v7];
              [v32 setIdsDevice:v10];
              [v32 setPersistentIdentifier:v7];
              [v32 updateWithSFDevice:v4];
              [v32 setIdsDeviceIdentifier:v7];
              if (self->_prefIgnoreRemoteDisplayChecks)
              {
                CFStringRef v33 = RPVersionToSourceVersionString();
                [v32 setSourceVersion:v33];
              }
              v52 = v10;
              discoveredDevices = self->_discoveredDevices;
              if (!discoveredDevices)
              {
                uint64_t v35 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
                BOOL v36 = self->_discoveredDevices;
                self->_discoveredDevices = v35;

                discoveredDevices = self->_discoveredDevices;
              }
              v54 = v7;
              -[NSMutableDictionary setObject:forKeyedSubscript:](discoveredDevices, "setObject:forKeyedSubscript:", v32, v7, v47);
              [(RPRemoteDisplayDaemon *)self _requestCameraCapabilitiesForDevice:v32];
              [(RPRemoteDisplayDaemon *)self _updateXPCMatchingDiscovery];
              long long v57 = 0u;
              long long v58 = 0u;
              long long v55 = 0u;
              long long v56 = 0u;
              id v37 = self->_xpcConnections;
              id v38 = [(NSMutableSet *)v37 countByEnumeratingWithState:&v55 objects:v66 count:16];
              if (v38)
              {
                id v39 = v38;
                uint64_t v40 = *(void *)v56;
                do
                {
                  for (j = 0; j != v39; j = (char *)j + 1)
                  {
                    if (*(void *)v56 != v40) {
                      objc_enumerationMutation(v37);
                    }
                    uint64_t v42 = *(void **)(*((void *)&v55 + 1) + 8 * (void)j);
                    v43 = [v42 activatedDiscovery];
                    unsigned int v44 = [v43 shouldReportDevice:v32];

                    if (v44)
                    {
                      unint64_t v45 = [v42 xpcCnx];
                      v46 = [v45 remoteObjectProxy];
                      [v46 remoteDisplayFoundDevice:v32];
                    }
                  }
                  id v39 = [(NSMutableSet *)v37 countByEnumeratingWithState:&v55 objects:v66 count:16];
                }
                while (v39);
              }

              long long v10 = v52;
              char v7 = v54;
            }
            goto LABEL_96;
          }
          if (dword_1001426A0 > 20 || dword_1001426A0 == -1 && !_LogCategory_Initialize())
          {
LABEL_96:

LABEL_97:
            goto LABEL_98;
          }
        }
      }
      else if (dword_1001426A0 > 90 || dword_1001426A0 == -1 && !_LogCategory_Initialize())
      {
        goto LABEL_96;
      }
      LogPrintF();
      goto LABEL_96;
    }
    if (dword_1001426A0 <= 20 && (dword_1001426A0 != -1 || _LogCategory_Initialize())) {
      goto LABEL_15;
    }
  }
  else if (dword_1001426A0 <= 10 && (dword_1001426A0 != -1 || _LogCategory_Initialize()))
  {
LABEL_15:
    LogPrintF();
  }
LABEL_98:
}

- (void)_clientBLEDiscoveryDeviceLost:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 idsIdentifier];
  if (v5)
  {
    uint64_t v6 = [(RPRemoteDisplayDaemon *)self _findMatchingDeviceWithIdentifier:v5];
    char v7 = v6;
    if (!v6)
    {
LABEL_56:

      goto LABEL_57;
    }
    unint64_t v8 = [v6 bleDevice];
    uint64_t v9 = [v8 identifier];
    long long v10 = [v9 UUIDString];

    int v11 = [v4 bleDevice];
    int v12 = [v11 identifier];
    uint64_t v13 = [v12 UUIDString];

    if (v10 && v13 && ([v10 isEqual:v13] & 1) == 0)
    {
      if (dword_1001426A0 > 30 || dword_1001426A0 == -1 && !_LogCategory_Initialize()) {
        goto LABEL_55;
      }
    }
    else
    {
      if (![v4 isBLEDeviceReplaced])
      {
        unsigned __int16 v38 = (unsigned __int16)[v7 statusFlags];
        uint64_t v40 = v13;
        BOOL v41 = v10;
        id v39 = self;
        if ([v7 removeSFDevice:v4])
        {
          if (dword_1001426A0 <= 30 && (dword_1001426A0 != -1 || _LogCategory_Initialize()))
          {
            id v37 = CUDescriptionWithLevel();
            LogPrintF();
          }
          -[NSMutableDictionary setObject:forKeyedSubscript:](self->_discoveredDevices, "setObject:forKeyedSubscript:", 0, v5, v37);
          [v7 clearCameraCapabilitiesRefetchTimer];
          long long v48 = 0u;
          long long v49 = 0u;
          long long v46 = 0u;
          long long v47 = 0u;
          long long v14 = self->_xpcConnections;
          id v15 = [(NSMutableSet *)v14 countByEnumeratingWithState:&v46 objects:v51 count:16];
          if (v15)
          {
            id v16 = v15;
            uint64_t v17 = *(void *)v47;
            do
            {
              for (i = 0; i != v16; i = (char *)i + 1)
              {
                if (*(void *)v47 != v17) {
                  objc_enumerationMutation(v14);
                }
                id v19 = *(void **)(*((void *)&v46 + 1) + 8 * i);
                uint64_t v20 = [v19 activatedDiscovery];
                unsigned int v21 = [v20 shouldReportDevice:v7];

                if (v21)
                {
                  long long v22 = [v19 xpcCnx];
                  int v23 = [v22 remoteObjectProxy];
                  [v23 remoteDisplayLostDevice:v7];
                }
              }
              id v16 = [(NSMutableSet *)v14 countByEnumeratingWithState:&v46 objects:v51 count:16];
            }
            while (v16);
          }

          unsigned int v24 = v39;
          int v25 = [(RPRemoteDisplayDaemon *)v39 deviceConfirmedIdentifier];
          unsigned int v26 = [v5 isEqualToString:v25];

          if (v26) {
            [(RPRemoteDisplayDaemon *)v39 _startInSessionDeviceLostTimer];
          }
        }
        else
        {
          if (dword_1001426A0 <= 30 && (dword_1001426A0 != -1 || _LogCategory_Initialize()))
          {
            id v37 = CUDescriptionWithLevel();
            LogPrintF();
          }
          long long v44 = 0u;
          long long v45 = 0u;
          long long v42 = 0u;
          long long v43 = 0u;
          BOOL v27 = self->_xpcConnections;
          id v28 = [(NSMutableSet *)v27 countByEnumeratingWithState:&v42 objects:v50 count:16];
          if (v28)
          {
            id v29 = v28;
            uint64_t v30 = *(void *)v43;
            do
            {
              for (j = 0; j != v29; j = (char *)j + 1)
              {
                if (*(void *)v43 != v30) {
                  objc_enumerationMutation(v27);
                }
                id v32 = *(void **)(*((void *)&v42 + 1) + 8 * (void)j);
                CFStringRef v33 = [v32 activatedDiscovery:v37];
                unsigned int v34 = [v33 shouldReportDevice:v7];

                if (v34)
                {
                  uint64_t v35 = [v32 xpcCnx];
                  BOOL v36 = [v35 remoteObjectProxy];
                  [v36 remoteDisplayChangedDevice:v7 changes:2];
                }
              }
              id v29 = [(NSMutableSet *)v27 countByEnumeratingWithState:&v42 objects:v50 count:16];
            }
            while (v29);
          }

          unsigned int v24 = v39;
        }
        [(RPRemoteDisplayDaemon *)v24 _updateXPCMatchingDiscovery];
        uint64_t v13 = v40;
        long long v10 = v41;
        if ((v38 & 0x200) != 0 && ([v7 statusFlags] & 0x200) == 0) {
          [(RPRemoteDisplayDaemon *)v24 _clientBonjourReconfirmDevice:v7 reason:"BLE device lost"];
        }
        goto LABEL_55;
      }
      if (dword_1001426A0 > 30 || dword_1001426A0 == -1 && !_LogCategory_Initialize())
      {
LABEL_55:

        goto LABEL_56;
      }
    }
    LogPrintF();
    goto LABEL_55;
  }
  if (dword_1001426A0 <= 10 && (dword_1001426A0 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
LABEL_57:
}

- (BOOL)_clientBLEDiscoveryShouldRun
{
  if (!self->_prefBLEClient) {
    return 0;
  }
  if (GestaltGetDeviceClass() != 4) {
    return 1;
  }
  id v3 = [(RPCompanionLinkDevice *)self->_localDeviceInfo model];
  BOOL v4 = (int)sub_10000DF44(v3) > 10;

  return v4;
}

- (void)_clientBLENeedsAWDLAdvertiserEnsureStarted
{
  if (!self->_bleNeedsAWDLAdvertiser)
  {
    if (dword_1001426A0 <= 30 && (dword_1001426A0 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    id v3 = (SFService *)objc_alloc_init((Class)off_100142718[0]());
    bleNeedsAWDLAdvertiser = self->_bleNeedsAWDLAdvertiser;
    self->_bleNeedsAWDLAdvertiser = v3;

    [(SFService *)self->_bleNeedsAWDLAdvertiser setAdvertiseRate:60];
    [(SFService *)self->_bleNeedsAWDLAdvertiser setDeviceActionType:50];
    [(SFService *)self->_bleNeedsAWDLAdvertiser setDispatchQueue:self->_dispatchQueue];
    uint64_t v5 = off_100142720();
    [(SFService *)self->_bleNeedsAWDLAdvertiser setIdentifier:v5];

    [(SFService *)self->_bleNeedsAWDLAdvertiser setLabel:@"RDLink"];
    [(SFService *)self->_bleNeedsAWDLAdvertiser setNeedsKeyboard:1];
    [(SFService *)self->_bleNeedsAWDLAdvertiser setPairSetupDisabled:1];
    uint64_t v6 = self->_bleNeedsAWDLAdvertiser;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_1000A794C;
    v7[3] = &unk_100121908;
    v7[4] = self;
    [(SFService *)v6 activateWithCompletion:v7];
    [(RPRemoteDisplayDaemon *)self _clientSendNeedsAWDLOverWiFi:1];
  }
}

- (void)_clientBLENeedsAWDLAdvertiserEnsureStopped
{
  if (self->_bleNeedsAWDLAdvertiser)
  {
    if (dword_1001426A0 <= 30 && (dword_1001426A0 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    [(SFService *)self->_bleNeedsAWDLAdvertiser invalidate];
    bleNeedsAWDLAdvertiser = self->_bleNeedsAWDLAdvertiser;
    self->_bleNeedsAWDLAdvertiser = 0;

    bleNeedsAWDLAdvertiserProcessName = self->_bleNeedsAWDLAdvertiserProcessName;
    self->_bleNeedsAWDLAdvertiserProcessName = 0;

    [(RPRemoteDisplayDaemon *)self _clientSendNeedsAWDLOverWiFi:0];
  }
}

- (BOOL)_clientBLENeedsAWDLAdvertiserShouldRun
{
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v3 = self->_xpcConnections;
  id v4 = [(NSMutableSet *)v3 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v21;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v21 != v6) {
          objc_enumerationMutation(v3);
        }
        unint64_t v8 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        uint64_t v9 = [v8 clientNetCnx:v20];
        unsigned int v10 = [v9 state];

        if (v10 != 1)
        {
          int v11 = [v8 activatedSession];
          unsigned int v12 = [v11 needsAWDL];

          if (v12)
          {
            if (([v8 usingNearbyActionV2] & 1) == 0)
            {
              uint64_t v13 = [v8 activatedSession];
              long long v14 = [v13 bonjourDevice];

              if (!v14)
              {
                id v16 = [v8 xpcCnx];
                sub_10000E944((uint64_t)[v16 processIdentifier]);
                uint64_t v17 = (NSString *)objc_claimAutoreleasedReturnValue();
                bleNeedsAWDLAdvertiserProcessName = self->_bleNeedsAWDLAdvertiserProcessName;
                self->_bleNeedsAWDLAdvertiserProcessName = v17;

                BOOL v15 = 1;
                goto LABEL_14;
              }
            }
          }
        }
      }
      id v5 = [(NSMutableSet *)v3 countByEnumeratingWithState:&v20 objects:v24 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  BOOL v15 = 0;
LABEL_14:

  return v15;
}

- (void)_clientBLENearbyActionV2AdvertiserEnsureStarted
{
  if (self->_bleNearbyActionV2Device)
  {
    if (self->_bleNearbyActionV2Advertiser)
    {
      [(RPRemoteDisplayDaemon *)self _clientSendNeedsAWDLOverWiFi:1];
    }
    else
    {
      if (dword_1001426A0 <= 30 && (dword_1001426A0 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
      id v3 = sub_1000A71C0();
      id v4 = sub_1000A71C0();
      os_signpost_id_t v5 = os_signpost_id_make_with_pointer(v4, self);

      if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
      {
        bleNearbyActionV2Device = self->_bleNearbyActionV2Device;
        *(_DWORD *)buf = 138412290;
        uint64_t v13 = bleNearbyActionV2Device;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v3, OS_SIGNPOST_INTERVAL_BEGIN, v5, "BLE NearbyActionV2 advertisement", "BLE NearbyActionV2 advertiser start for device %@\n signpost_begin:begin_time", buf, 0xCu);
      }

      char v7 = objc_alloc_init(RPNearbyActionV2Advertiser);
      bleNearbyActionV2Advertiser = self->_bleNearbyActionV2Advertiser;
      self->_bleNearbyActionV2Advertiser = v7;

      [(RPNearbyActionV2Advertiser *)self->_bleNearbyActionV2Advertiser setDispatchQueue:self->_dispatchQueue];
      uint64_t v9 = [(RPRemoteDisplayDevice *)self->_bleNearbyActionV2Device bleTargetData];
      [(RPNearbyActionV2Advertiser *)self->_bleNearbyActionV2Advertiser setTargetData:v9];

      [(RPNearbyActionV2Advertiser *)self->_bleNearbyActionV2Advertiser setNearbyActionType:[(RPRemoteDisplayDevice *)self->_bleNearbyActionV2Device nearbyActionV2Type]];
      unsigned int v10 = self->_bleNearbyActionV2Advertiser;
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_1000A7F4C;
      v11[3] = &unk_100121908;
      v11[4] = self;
      [(RPNearbyActionV2Advertiser *)v10 activateWithCompletion:v11];
      [(RPRemoteDisplayDaemon *)self _clientSendNeedsAWDLOverWiFi:1];
    }
  }
}

- (void)_clientBLENearbyActionV2AdvertiserEnsureStopped
{
  bleNearbyActionV2Advertiser = self->_bleNearbyActionV2Advertiser;
  if (bleNearbyActionV2Advertiser)
  {
    [(RPNearbyActionV2Advertiser *)bleNearbyActionV2Advertiser invalidate];
    id v4 = self->_bleNearbyActionV2Advertiser;
    self->_bleNearbyActionV2Advertiser = 0;

    bleNearbyActionV2AdvertiserProcessName = self->_bleNearbyActionV2AdvertiserProcessName;
    self->_bleNearbyActionV2AdvertiserProcessName = 0;

    bleNearbyActionV2Device = self->_bleNearbyActionV2Device;
    self->_bleNearbyActionV2Device = 0;

    if (dword_1001426A0 <= 30 && (dword_1001426A0 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    [(RPRemoteDisplayDaemon *)self _clientSendNeedsAWDLOverWiFi:0];
    char v7 = sub_1000A71C0();
    unint64_t v8 = sub_1000A71C0();
    os_signpost_id_t v9 = os_signpost_id_make_with_pointer(v8, self);

    if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
    {
      *(_WORD *)unsigned int v10 = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v7, OS_SIGNPOST_INTERVAL_END, v9, "BLE NearbyActionV2 advertisement", "BLE NearbyActionV2 advertiser stopped\n signpost_end:end_time", v10, 2u);
    }
  }
}

- (BOOL)_clientBLENearbyActionV2AdvertiserShouldRun
{
  id v3 = +[RPCompanionLinkDaemon sharedCompanionLinkDaemon];
  unsigned int v4 = [v3 isNearbyActionV2AdvertiserActive];

  if (v4)
  {
    if (dword_1001426A0 <= 30 && (dword_1001426A0 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
  }
  else
  {
    long long v40 = 0u;
    long long v41 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    BOOL v36 = self;
    os_signpost_id_t v5 = self->_xpcConnections;
    id v6 = [(NSMutableSet *)v5 countByEnumeratingWithState:&v38 objects:v42 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v39;
      p_bleNearbyActionV2Device = (id *)&self->_bleNearbyActionV2Device;
      while (2)
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v39 != v8) {
            objc_enumerationMutation(v5);
          }
          int v11 = *(void **)(*((void *)&v38 + 1) + 8 * i);
          unsigned int v12 = [v11 clientNetCnx];
          unsigned int v13 = [v12 state];

          if (v13 != 1)
          {
            long long v14 = [v11 activatedSession];

            if (v14)
            {
              BOOL v15 = [v11 activatedSession];
              unsigned int v16 = [v15 needsAWDL];

              if (v16)
              {
                uint64_t v17 = [v11 activatedSession];
                id v18 = [v17 bonjourDevice];

                if (!v18)
                {
                  id v19 = [v11 activatedSession];
                  long long v20 = [v19 daemonDevice];

                  uint64_t v21 = [v20 idsDeviceIdentifier];
                  long long v22 = +[RPCloudDaemon sharedCloudDaemon];
                  long long v23 = [v22 idsDeviceMap];
                  id v37 = (void *)v21;
                  unsigned int v24 = [v23 objectForKeyedSubscript:v21];

                  if (([v20 statusFlags] & 0x80000) != 0)
                  {
                    if (!v24)
                    {
                      if (dword_1001426A0 <= 90)
                      {
                        CFStringRef v33 = v37;
                        if (dword_1001426A0 != -1 || _LogCategory_Initialize()) {
                          LogPrintF();
                        }
                        unsigned int v24 = 0;
                        goto LABEL_57;
                      }
                      unsigned int v24 = 0;
                      goto LABEL_46;
                    }
                    int v25 = [v24 modelIdentifier];
                    int v26 = GestaltProductTypeStringToDeviceClass();

                    if ((v26 & 0xFFFFFFFD) != 1)
                    {
                      if (dword_1001426A0 <= 30)
                      {
                        CFStringRef v33 = v37;
                        if (dword_1001426A0 != -1 || _LogCategory_Initialize())
                        {
                          uint64_t v35 = [v24 modelIdentifier];
                          LogPrintF();
                        }
                        goto LABEL_57;
                      }
                      goto LABEL_46;
                    }
                    [v24 operatingSystemVersion];
                    if ((DeviceOSVersionAtOrLater() & 1) == 0)
                    {
                      CFStringRef v33 = v37;
                      if (dword_1001426A0 <= 30 && (dword_1001426A0 != -1 || _LogCategory_Initialize())) {
LABEL_44:
                      }
                        LogPrintF();
LABEL_57:
                      BOOL v32 = 0;
LABEL_58:

                      return v32;
                    }
                  }
                  else if (((unint64_t)[v20 statusFlags] & 0x3000000000) == 0)
                  {
                    if (dword_1001426A0 <= 30)
                    {
                      CFStringRef v33 = v37;
                      if (dword_1001426A0 != -1 || _LogCategory_Initialize()) {
                        goto LABEL_44;
                      }
                      goto LABEL_57;
                    }
                    goto LABEL_46;
                  }
                  if (*p_bleNearbyActionV2Device) {
                    goto LABEL_27;
                  }
                  uint64_t v27 = [v20 bleTargetData];
                  if (!v27)
                  {
                    if (dword_1001426A0 <= 30)
                    {
                      CFStringRef v33 = v37;
                      if (dword_1001426A0 != -1 || _LogCategory_Initialize()) {
                        goto LABEL_44;
                      }
                      goto LABEL_57;
                    }
LABEL_46:
                    BOOL v32 = 0;
LABEL_47:
                    CFStringRef v33 = v37;
                    goto LABEL_58;
                  }
                  id v28 = (void *)v27;
                  objc_storeStrong(p_bleNearbyActionV2Device, v20);
                  [*p_bleNearbyActionV2Device setNearbyActionV2Type:50];
                  [v11 setUsingNearbyActionV2:1];

                  if (*p_bleNearbyActionV2Device)
                  {
LABEL_27:
                    id v29 = [v11 xpcCnx];
                    uint64_t v30 = sub_10000E944((uint64_t)[v29 processIdentifier]);
                    bleNearbyActionV2AdvertiserProcessName = v36->_bleNearbyActionV2AdvertiserProcessName;
                    v36->_bleNearbyActionV2AdvertiserProcessName = (NSString *)v30;

                    BOOL v32 = 1;
                    goto LABEL_47;
                  }
                }
              }
            }
          }
        }
        id v7 = [(NSMutableSet *)v5 countByEnumeratingWithState:&v38 objects:v42 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }
  }
  return 0;
}

- (void)_clientBLENearbyActionV2AdvertiserUpdate
{
  bleNearbyActionV2Advertiser = self->_bleNearbyActionV2Advertiser;
  if (!bleNearbyActionV2Advertiser || !self->_bleNearbyActionV2Device) {
    return;
  }
  unsigned int v4 = [(RPNearbyActionV2Advertiser *)bleNearbyActionV2Advertiser targetData];
  os_signpost_id_t v5 = [(RPRemoteDisplayDevice *)self->_bleNearbyActionV2Device bleTargetData];
  id v10 = v4;
  id v6 = v5;
  if (v10 != v6)
  {
    if ((v10 == 0) != (v6 != 0))
    {
      unsigned __int8 v7 = [v10 isEqual:v6];

      if (v7) {
        goto LABEL_15;
      }
    }
    else
    {
    }
    if (dword_1001426A0 <= 30 && (dword_1001426A0 != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
      -[RPNearbyActionV2Advertiser setTargetData:](self->_bleNearbyActionV2Advertiser, "setTargetData:", v6, v10, v6);
    }
    else
    {
      -[RPNearbyActionV2Advertiser setTargetData:](self->_bleNearbyActionV2Advertiser, "setTargetData:", v6, v8, v9);
    }
    goto LABEL_15;
  }

LABEL_15:
}

- (void)_clientBonjourEnsureStarted
{
  if (!self->_bonjourBrowser)
  {
    if (self->_btAdvAddrData)
    {
      if (dword_1001426A0 <= 30 && (dword_1001426A0 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
      id v3 = (CUBonjourBrowser *)objc_alloc_init((Class)CUBonjourBrowser);
      bonjourBrowser = self->_bonjourBrowser;
      self->_bonjourBrowser = v3;

      if (self->_prefNoInfra) {
        uint64_t v5 = 0x8000000000000;
      }
      else {
        uint64_t v5 = 0x20000000000000;
      }
      [(CUBonjourBrowser *)self->_bonjourBrowser setBrowseFlags:v5];
      [(CUBonjourBrowser *)self->_bonjourBrowser setChangeFlags:0xFFFFFFFFLL];
      [(CUBonjourBrowser *)self->_bonjourBrowser setControlFlags:1];
      [(CUBonjourBrowser *)self->_bonjourBrowser setDispatchQueue:self->_dispatchQueue];
      [(CUBonjourBrowser *)self->_bonjourBrowser setDomain:@"local."];
      [(CUBonjourBrowser *)self->_bonjourBrowser setLabel:@"RDLink"];
      [(CUBonjourBrowser *)self->_bonjourBrowser setServiceType:@"_rdlink._tcp"];
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472;
      v8[2] = sub_1000A8AA0;
      v8[3] = &unk_100121980;
      v8[4] = self;
      [(CUBonjourBrowser *)self->_bonjourBrowser setDeviceFoundHandler:v8];
      v7[0] = _NSConcreteStackBlock;
      v7[1] = 3221225472;
      v7[2] = sub_1000A8ABC;
      v7[3] = &unk_100121980;
      v7[4] = self;
      [(CUBonjourBrowser *)self->_bonjourBrowser setDeviceLostHandler:v7];
      v6[0] = _NSConcreteStackBlock;
      v6[1] = 3221225472;
      v6[2] = sub_1000A8B34;
      v6[3] = &unk_1001219A8;
      v6[4] = self;
      [(CUBonjourBrowser *)self->_bonjourBrowser setDeviceChangedHandler:v6];
      [(CUBonjourBrowser *)self->_bonjourBrowser activate];
    }
    else if (dword_1001426A0 <= 20 && (dword_1001426A0 != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
}

- (void)_clientBonjourEnsureStopped
{
  if (self->_bonjourBrowser)
  {
    if (dword_1001426A0 <= 30 && (dword_1001426A0 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    [(CUBonjourBrowser *)self->_bonjourBrowser invalidate];
    bonjourBrowser = self->_bonjourBrowser;
    self->_bonjourBrowser = 0;

    pendingLostDevicesTimer = self->_pendingLostDevicesTimer;
    if (pendingLostDevicesTimer)
    {
      dispatch_source_cancel(pendingLostDevicesTimer);
      uint64_t v5 = self->_pendingLostDevicesTimer;
      self->_pendingLostDevicesTimer = 0;
    }
    [(RPRemoteDisplayDaemon *)self _updateXPCMatchingDiscovery];
  }
}

- (BOOL)_clientBonjourFoundDevice:(id)a3 reevaluate:(BOOL)a4
{
  id v6 = a3;
  unsigned __int8 v7 = [v6 txtDictionary];
  if (!self->_btAdvAddrStr) {
    goto LABEL_11;
  }
  CFStringGetTypeID();
  uint64_t v8 = CFDictionaryGetTypedValue();
  uint64_t v9 = v8;
  if (v8)
  {
    if ([v8 isEqual:self->_btAdvAddrStr])
    {
      if (dword_1001426A0 > 10 || dword_1001426A0 == -1 && !_LogCategory_Initialize()) {
        goto LABEL_41;
      }
      goto LABEL_9;
    }

LABEL_11:
    if (CFDictionaryGetInt64())
    {
      if (dword_1001426A0 > 20 || dword_1001426A0 == -1 && !_LogCategory_Initialize()) {
        goto LABEL_42;
      }
      goto LABEL_32;
    }
    if ((CFDictionaryGetInt64() & 0x800) != 0)
    {
      if (dword_1001426A0 > 10 || dword_1001426A0 == -1 && !_LogCategory_Initialize()) {
        goto LABEL_42;
      }
LABEL_32:
      uint64_t v9 = CUDescriptionWithLevel();
      LogPrintF();
      goto LABEL_41;
    }
    int v11 = +[RPIdentityDaemon sharedIdentityDaemon];
    unsigned int v12 = [v11 resolveIdentityForBonjourDevice:v6 typeFlags:3074];
    unsigned int v13 = v12;
    if (!v12)
    {
      if (dword_1001426A0 <= 10 && (dword_1001426A0 != -1 || _LogCategory_Initialize()))
      {
        v54 = CUDescriptionWithLevel();
        LogPrintF();
      }
      -[RPRemoteDisplayDaemon _clientBonjourFoundUnresolvedDevice:](self, "_clientBonjourFoundUnresolvedDevice:", v6, v54);
      BOOL v15 = 0;
      goto LABEL_100;
    }
    long long v14 = [v12 idsDeviceID];
    BOOL v15 = v14 != 0;
    if (!v14)
    {
      if (dword_1001426A0 <= 90 && (dword_1001426A0 != -1 || _LogCategory_Initialize()))
      {
        v54 = CUDescriptionWithLevel();
        LogPrintF();
      }
      -[RPRemoteDisplayDaemon _clientBonjourFoundUnresolvedDevice:](self, "_clientBonjourFoundUnresolvedDevice:", v6, v54);
      goto LABEL_99;
    }
    if (!a4) {
      [(RPRemoteDisplayDaemon *)self _clientBonjourReevaluateDevices];
    }
    uint64_t v63 = [v13 model];
    unsigned int v16 = +[RPCloudDaemon sharedCloudDaemon];
    uint64_t v17 = [v16 idsDeviceMap];
    id v18 = [v17 objectForKeyedSubscript:v14];

    long long v61 = v18;
    if (v18)
    {
      id v19 = [v18 modelIdentifier];
      long long v20 = v19;
      if (v19)
      {
        id v21 = v19;

        uint64_t v63 = v21;
      }
    }
    [(NSMutableDictionary *)self->_pendingLostDevices setObject:0 forKeyedSubscript:v14];
    long long v62 = v14;
    long long v22 = [(RPRemoteDisplayDaemon *)self _findMatchingDeviceWithIdentifier:v14];
    if (v22)
    {
      long long v23 = v22;
      id v24 = [v22 updateWithBonjourDevice:v6];
      if (v63)
      {
        id v25 = [v23 model];
        id v26 = v63;
        uint64_t v27 = v26;
        if (v25 == v26)
        {
        }
        else
        {
          if (!v25)
          {

LABEL_60:
            [v23 setModel:v27];
            id v24 = (id)(v24 | 2);
            [(RPRemoteDisplayDaemon *)self _requestCameraCapabilitiesForDevice:v23];
LABEL_61:
            if (dword_1001426A0 <= 30 && (dword_1001426A0 != -1 || _LogCategory_Initialize()))
            {
              CUDescriptionWithLevel();
              long long v55 = v54 = v62;
              LogPrintF();
            }
            long long v70 = 0u;
            long long v71 = 0u;
            long long v68 = 0u;
            long long v69 = 0u;
            id v29 = self->_xpcConnections;
            id v30 = [(NSMutableSet *)v29 countByEnumeratingWithState:&v68 objects:v73 count:16];
            if (v30)
            {
              id v31 = v30;
              BOOL v56 = v15;
              long long v57 = v13;
              long long v58 = v11;
              long long v60 = v7;
              uint64_t v32 = *(void *)v69;
              do
              {
                for (i = 0; i != v31; i = (char *)i + 1)
                {
                  if (*(void *)v69 != v32) {
                    objc_enumerationMutation(v29);
                  }
                  unsigned int v34 = *(void **)(*((void *)&v68 + 1) + 8 * i);
                  uint64_t v35 = [v34 activatedDiscovery:v54, v55];
                  unsigned int v36 = [v35 shouldReportDevice:v23];

                  if (v36)
                  {
                    id v37 = [v34 xpcCnx];
                    long long v38 = [v37 remoteObjectProxy];
                    [v38 remoteDisplayChangedDevice:v23 changes:v24];
                  }
                }
                id v31 = [(NSMutableSet *)v29 countByEnumeratingWithState:&v68 objects:v73 count:16];
              }
              while (v31);

LABEL_97:
              int v11 = v58;
              unsigned __int8 v7 = v60;
              unsigned int v13 = v57;
              BOOL v15 = v56;
              goto LABEL_98;
            }

LABEL_76:
LABEL_98:

            long long v14 = v62;
LABEL_99:

LABEL_100:
            goto LABEL_43;
          }
          unsigned __int8 v59 = [v25 isEqual:v26];

          if ((v59 & 1) == 0) {
            goto LABEL_60;
          }
        }
      }
      [(RPRemoteDisplayDaemon *)self _requestCameraCapabilitiesForDevice:v23];
      if (!v24) {
        goto LABEL_76;
      }
      goto LABEL_61;
    }
    if (dword_1001426A0 <= 30 && (dword_1001426A0 != -1 || _LogCategory_Initialize()))
    {
      CUDescriptionWithLevel();
      long long v55 = v54 = v14;
      LogPrintF();
    }
    id v39 = objc_alloc_init((Class)RPRemoteDisplayDevice);
    [v39 setIdentifier:v62];
    [v39 setIdsDevice:v18];
    [v39 setIdsDeviceIdentifier:v62];
    [v39 setModel:v63];
    [v39 setPersistentIdentifier:v62];
    long long v58 = v11;
    if ([v13 type] == 2)
    {
      uint64_t v40 = 0x80000;
    }
    else if ([v13 type] == 12)
    {
      uint64_t v40 = 0x1000000000;
    }
    else
    {
      if ([v13 type] != 13)
      {
LABEL_85:
        BOOL v56 = v15;
        long long v57 = v13;
        long long v60 = v7;
        [v39 updateWithBonjourDevice:v6, v54];
        discoveredDevices = self->_discoveredDevices;
        if (!discoveredDevices)
        {
          long long v42 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
          long long v43 = self->_discoveredDevices;
          self->_discoveredDevices = v42;

          discoveredDevices = self->_discoveredDevices;
        }
        [(NSMutableDictionary *)discoveredDevices setObject:v39 forKeyedSubscript:v62];
        [(RPRemoteDisplayDaemon *)self _requestCameraCapabilitiesForDevice:v39];
        long long v66 = 0u;
        long long v67 = 0u;
        long long v64 = 0u;
        long long v65 = 0u;
        long long v44 = self->_xpcConnections;
        id v45 = [(NSMutableSet *)v44 countByEnumeratingWithState:&v64 objects:v72 count:16];
        if (v45)
        {
          id v46 = v45;
          uint64_t v47 = *(void *)v65;
          do
          {
            for (j = 0; j != v46; j = (char *)j + 1)
            {
              if (*(void *)v65 != v47) {
                objc_enumerationMutation(v44);
              }
              long long v49 = *(void **)(*((void *)&v64 + 1) + 8 * (void)j);
              unint64_t v50 = [v49 activatedDiscovery];
              unsigned int v51 = [v50 shouldReportDevice:v39];

              if (v51)
              {
                v52 = [v49 xpcCnx];
                unint64_t v53 = [v52 remoteObjectProxy];
                [v53 remoteDisplayFoundDevice:v39];
              }
            }
            id v46 = [(NSMutableSet *)v44 countByEnumeratingWithState:&v64 objects:v72 count:16];
          }
          while (v46);
        }

        [(RPRemoteDisplayDaemon *)self _updateXPCMatchingDiscovery];
        goto LABEL_97;
      }
      uint64_t v40 = 0x2000000000;
    }
    [v39 setStatusFlags:((unint64_t)[v39 statusFlags:v54, v55] | v40)];
    goto LABEL_85;
  }
  if (dword_1001426A0 > 10 || dword_1001426A0 == -1 && !_LogCategory_Initialize()) {
    goto LABEL_41;
  }
LABEL_9:
  id v10 = CUDescriptionWithLevel();
  LogPrintF();

LABEL_41:
LABEL_42:
  BOOL v15 = 0;
LABEL_43:

  return v15;
}

- (void)_clientBonjourLostDevice:(id)a3
{
  id v12 = a3;
  unsigned int v4 = +[RPIdentityDaemon sharedIdentityDaemon];
  uint64_t v5 = [v4 resolveIdentityForBonjourDevice:v12 typeFlags:2];
  id v6 = v5;
  if (v5)
  {
    unsigned __int8 v7 = [v5 idsDeviceID];
    if (v7)
    {
      uint64_t v8 = [(RPRemoteDisplayDaemon *)self _findMatchingDeviceWithIdentifier:v7];
      if (v8)
      {
        pendingLostDevices = self->_pendingLostDevices;
        if (!pendingLostDevices)
        {
          id v10 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
          int v11 = self->_pendingLostDevices;
          self->_pendingLostDevices = v10;

          pendingLostDevices = self->_pendingLostDevices;
        }
        [(NSMutableDictionary *)pendingLostDevices setObject:v12 forKeyedSubscript:v7];
        [(RPRemoteDisplayDaemon *)self _schedulePendingLostDeviceTimer];
      }
    }
    else
    {
      if (dword_1001426A0 > 90 || dword_1001426A0 == -1 && !_LogCategory_Initialize()) {
        goto LABEL_11;
      }
      uint64_t v8 = CUDescriptionWithLevel();
      LogPrintF();
    }

LABEL_11:
  }
}

- (void)_schedulePendingLostDeviceTimer
{
  if (!self->_pendingLostDevicesTimer)
  {
    if (dword_1001426A0 <= 30 && (dword_1001426A0 != -1 || _LogCategory_Initialize()))
    {
      [(NSMutableDictionary *)self->_pendingLostDevices count];
      LogPrintF();
    }
    id v3 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)self->_dispatchQueue);
    pendingLostDevicesTimer = self->_pendingLostDevicesTimer;
    self->_pendingLostDevicesTimer = v3;

    uint64_t v5 = self->_pendingLostDevicesTimer;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_1000A97E4;
    handler[3] = &unk_100121158;
    handler[4] = self;
    dispatch_source_set_event_handler(v5, handler);
    CUDispatchTimerSet();
    dispatch_activate((dispatch_object_t)self->_pendingLostDevicesTimer);
  }
}

- (void)_processPendingLostDevices
{
  v2 = self;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (dword_1001426A0 <= 30 && (dword_1001426A0 != -1 || _LogCategory_Initialize()))
  {
    id v27 = [(NSMutableDictionary *)v2->_pendingLostDevices count];
    LogPrintF();
  }
  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id obj = [(NSMutableDictionary *)v2->_pendingLostDevices allKeys];
  id v33 = [obj countByEnumeratingWithState:&v42 objects:v48 count:16];
  if (v33)
  {
    id v31 = v2;
    uint64_t v32 = *(void *)v43;
    do
    {
      for (i = 0; i != v33; i = (char *)i + 1)
      {
        if (*(void *)v43 != v32) {
          objc_enumerationMutation(obj);
        }
        uint64_t v4 = *(void *)(*((void *)&v42 + 1) + 8 * i);
        uint64_t v5 = -[NSMutableDictionary objectForKeyedSubscript:](v2->_pendingLostDevices, "objectForKeyedSubscript:", v4, v28);
        id v6 = [(RPRemoteDisplayDaemon *)v2 _findMatchingDeviceWithIdentifier:v4];
        if ([v6 removeBonjourDevice:v5])
        {
          if (dword_1001426A0 <= 30 && (dword_1001426A0 != -1 || _LogCategory_Initialize()))
          {
            CUDescriptionWithLevel();
            v29 = uint64_t v28 = v4;
            LogPrintF();
          }
          -[NSMutableDictionary setObject:forKeyedSubscript:](v2->_discoveredDevices, "setObject:forKeyedSubscript:", 0, v4, v28, v29);
          [v6 clearCameraCapabilitiesRefetchTimer];
          long long v40 = 0u;
          long long v41 = 0u;
          long long v38 = 0u;
          long long v39 = 0u;
          unsigned __int8 v7 = v2->_xpcConnections;
          id v8 = [(NSMutableSet *)v7 countByEnumeratingWithState:&v38 objects:v47 count:16];
          if (v8)
          {
            id v9 = v8;
            uint64_t v10 = *(void *)v39;
            do
            {
              for (j = 0; j != v9; j = (char *)j + 1)
              {
                if (*(void *)v39 != v10) {
                  objc_enumerationMutation(v7);
                }
                id v12 = *(void **)(*((void *)&v38 + 1) + 8 * (void)j);
                unsigned int v13 = [v12 activatedDiscovery];
                unsigned int v14 = [v13 shouldReportDevice:v6];

                if (v14)
                {
                  BOOL v15 = [v12 xpcCnx];
                  unsigned int v16 = [v15 remoteObjectProxy];
                  [v16 remoteDisplayLostDevice:v6];
                }
              }
              id v9 = [(NSMutableSet *)v7 countByEnumeratingWithState:&v38 objects:v47 count:16];
            }
            while (v9);
LABEL_38:
            v2 = v31;
          }
        }
        else
        {
          if (dword_1001426A0 <= 30 && (dword_1001426A0 != -1 || _LogCategory_Initialize()))
          {
            CUDescriptionWithLevel();
            v29 = uint64_t v28 = v4;
            LogPrintF();
          }
          long long v36 = 0u;
          long long v37 = 0u;
          long long v34 = 0u;
          long long v35 = 0u;
          unsigned __int8 v7 = v2->_xpcConnections;
          id v17 = [(NSMutableSet *)v7 countByEnumeratingWithState:&v34 objects:v46 count:16];
          if (v17)
          {
            id v18 = v17;
            uint64_t v19 = *(void *)v35;
            do
            {
              for (k = 0; k != v18; k = (char *)k + 1)
              {
                if (*(void *)v35 != v19) {
                  objc_enumerationMutation(v7);
                }
                id v21 = *(void **)(*((void *)&v34 + 1) + 8 * (void)k);
                long long v22 = [v21 activatedDiscovery:v28];
                unsigned int v23 = [v22 shouldReportDevice:v6];

                if (v23)
                {
                  id v24 = [v21 xpcCnx];
                  id v25 = [v24 remoteObjectProxy];
                  [v25 remoteDisplayChangedDevice:v6 changes:2];
                }
              }
              id v18 = [(NSMutableSet *)v7 countByEnumeratingWithState:&v34 objects:v46 count:16];
            }
            while (v18);
            goto LABEL_38;
          }
        }
      }
      id v33 = [obj countByEnumeratingWithState:&v42 objects:v48 count:16];
    }
    while (v33);
  }

  [(NSMutableDictionary *)v2->_pendingLostDevices removeAllObjects];
  pendingLostDevices = v2->_pendingLostDevices;
  v2->_pendingLostDevices = 0;

  [(RPRemoteDisplayDaemon *)v2 _updateXPCMatchingDiscovery];
}

- (void)_clientBonjourFoundUnresolvedDevice:(id)a3
{
  id v9 = a3;
  uint64_t v4 = [v9 identifier];
  uint64_t v5 = [v4 UUIDString];

  if (v5)
  {
    unresolvedDevices = self->_unresolvedDevices;
    if (!unresolvedDevices)
    {
      unsigned __int8 v7 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
      id v8 = self->_unresolvedDevices;
      self->_unresolvedDevices = v7;

      unresolvedDevices = self->_unresolvedDevices;
    }
    [(NSMutableDictionary *)unresolvedDevices setObject:v9 forKeyedSubscript:v5];
  }
}

- (void)_clientBonjourLostUnresolvedDevice:(id)a3
{
  uint64_t v4 = [a3 identifier];
  id v6 = [v4 UUIDString];

  uint64_t v5 = v6;
  if (v6)
  {
    [(NSMutableDictionary *)self->_unresolvedDevices setObject:0 forKeyedSubscript:v6];
    uint64_t v5 = v6;
  }
}

- (void)_clientBonjourReconfirmDevice:(id)a3 reason:(const char *)a4
{
  id v5 = a3;
  id v11 = v5;
  if (dword_1001426A0 <= 30)
  {
    if (dword_1001426A0 != -1 || (int v6 = _LogCategory_Initialize(), v5 = v11, v6))
    {
      id v9 = a4;
      id v10 = v5;
      LogPrintF();
      id v5 = v11;
    }
  }
  unsigned __int8 v7 = [v5 bonjourDevice:v9, v10];
  id v8 = v7;
  if (v7) {
    [v7 reconfirm];
  }
}

- (void)_clientBonjourReevaluateDevices
{
  if ([(NSMutableDictionary *)self->_unresolvedDevices count]
    && dword_1001426A0 <= 30
    && (dword_1001426A0 != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v3 = [(NSMutableDictionary *)self->_discoveredDevices allValues];
  id v4 = [v3 countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v21;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v21 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = [*(id *)(*((void *)&v20 + 1) + 8 * i) bonjourDevice];
        if (v8) {
          [(RPRemoteDisplayDaemon *)self _clientBonjourFoundDevice:v8 reevaluate:1];
        }
      }
      id v5 = [v3 countByEnumeratingWithState:&v20 objects:v25 count:16];
    }
    while (v5);
  }

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v9 = [(NSMutableDictionary *)self->_unresolvedDevices allValues];
  id v10 = [v9 countByEnumeratingWithState:&v16 objects:v24 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v17;
    do
    {
      for (j = 0; j != v11; j = (char *)j + 1)
      {
        if (*(void *)v17 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void *)(*((void *)&v16 + 1) + 8 * (void)j);
        if ([(RPRemoteDisplayDaemon *)self _clientBonjourFoundDevice:v14 reevaluate:1])
        {
          if (dword_1001426A0 <= 30 && (dword_1001426A0 != -1 || _LogCategory_Initialize()))
          {
            LogPrintF();
            -[RPRemoteDisplayDaemon _clientBonjourLostUnresolvedDevice:](self, "_clientBonjourLostUnresolvedDevice:", v14, v14);
          }
          else
          {
            -[RPRemoteDisplayDaemon _clientBonjourLostUnresolvedDevice:](self, "_clientBonjourLostUnresolvedDevice:", v14, v15);
          }
        }
      }
      id v11 = [v9 countByEnumeratingWithState:&v16 objects:v24 count:16];
    }
    while (v11);
  }
}

- (void)_clientBonjourAWDLBrowserEnsureStarted
{
  if (!self->_bonjourBrowserAWDL)
  {
    if (dword_1001426A0 <= 30 && (dword_1001426A0 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    id v3 = +[RPWiFiP2PTransaction sharedInstance];
    [v3 activateForClient:@"Sidecar"];

    id v4 = (CUBonjourBrowser *)objc_alloc_init((Class)CUBonjourBrowser);
    bonjourBrowserAWDL = self->_bonjourBrowserAWDL;
    self->_bonjourBrowserAWDL = v4;

    [(CUBonjourBrowser *)self->_bonjourBrowserAWDL setChangeFlags:0xFFFFFFFFLL];
    [(CUBonjourBrowser *)self->_bonjourBrowserAWDL setDispatchQueue:self->_dispatchQueue];
    [(CUBonjourBrowser *)self->_bonjourBrowserAWDL setDomain:@"local."];
    [(CUBonjourBrowser *)self->_bonjourBrowserAWDL setInterfaceName:@"awdl0"];
    [(CUBonjourBrowser *)self->_bonjourBrowserAWDL setLabel:@"RDLink"];
    [(CUBonjourBrowser *)self->_bonjourBrowserAWDL setServiceType:@"_rdlink._tcp"];
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_1000AA354;
    v11[3] = &unk_100121980;
    v11[4] = self;
    [(CUBonjourBrowser *)self->_bonjourBrowserAWDL setDeviceFoundHandler:v11];
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_1000AA36C;
    v10[3] = &unk_100121980;
    v10[4] = self;
    [(CUBonjourBrowser *)self->_bonjourBrowserAWDL setDeviceLostHandler:v10];
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_1000AA384;
    v9[3] = &unk_1001219A8;
    v9[4] = self;
    [(CUBonjourBrowser *)self->_bonjourBrowserAWDL setDeviceChangedHandler:v9];
    [(CUBonjourBrowser *)self->_bonjourBrowserAWDL activate];
    bonjourBrowserAWDLProcess = self->_bonjourBrowserAWDLProcess;
    if (bonjourBrowserAWDLProcess)
    {
      unsigned __int8 v7 = bonjourBrowserAWDLProcess;
      id v8 = +[RPMetrics sharedMetrics];
      [v8 logAWDLBrowseClient:v7];
    }
  }
}

- (void)_clientBonjourAWDLBrowserEnsureStopped
{
  if (self->_bonjourBrowserAWDL)
  {
    if (dword_1001426A0 <= 30 && (dword_1001426A0 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    [(CUBonjourBrowser *)self->_bonjourBrowserAWDL invalidate];
    bonjourBrowserAWDL = self->_bonjourBrowserAWDL;
    self->_bonjourBrowserAWDL = 0;

    bonjourBrowserAWDLProcess = self->_bonjourBrowserAWDLProcess;
    self->_bonjourBrowserAWDLProcess = 0;

    if (!self->_bonjourAWDLAdvertiser)
    {
      id v5 = +[RPWiFiP2PTransaction sharedInstance];
      [v5 invalidateForClient:@"Sidecar"];
    }
    [(NSMutableDictionary *)self->_bonjourAWDLDevices removeAllObjects];
    bonjourAWDLDevices = self->_bonjourAWDLDevices;
    self->_bonjourAWDLDevices = 0;
  }
}

- (BOOL)_clientBonjourAWDLBrowserShouldRun
{
  if (self->_bonjourBrowserAWDLForce) {
    return 1;
  }
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = self->_activatedSessionSet;
  id v5 = [(NSMutableSet *)v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v15;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if (objc_msgSend(v9, "needsAWDL", (void)v14))
        {
          id v10 = [v9 xpcCnx];
          sub_10000E944((uint64_t)[v10 processIdentifier]);
          id v11 = (NSString *)objc_claimAutoreleasedReturnValue();
          bonjourBrowserAWDLProcess = self->_bonjourBrowserAWDLProcess;
          self->_bonjourBrowserAWDLProcess = v11;

          BOOL v2 = 1;
          goto LABEL_13;
        }
      }
      id v6 = [(NSMutableSet *)v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  BOOL v2 = 0;
LABEL_13:

  return v2;
}

- (void)_clientBonjourAWDLBrowserFoundDevice:(id)a3
{
  id v4 = a3;
  id v5 = [v4 txtDictionary];
  if (!CFDictionaryGetInt64())
  {
    uint64_t Int64 = CFDictionaryGetInt64();
    if ((Int64 & 0x800) == 0)
    {
      if (dword_1001426A0 <= 30 && (dword_1001426A0 != -1 || _LogCategory_Initialize())) {
        goto LABEL_8;
      }
      goto LABEL_70;
    }
    if ((Int64 & 0x80000) != 0)
    {
      [(RPRemoteDisplayDaemon *)self _clientAWDLPairingSessionWithDevice:v4];
      goto LABEL_70;
    }
    BOOL v56 = self;
    id v8 = +[RPIdentityDaemon sharedIdentityDaemon];
    id v9 = [v8 resolveIdentityForBonjourDevice:v4 typeFlags:3074];
    id v10 = v9;
    if (v9)
    {
      long long v58 = [v9 idsDeviceID];
      if (v58)
      {
        if (dword_1001426A0 <= 30 && (dword_1001426A0 != -1 || _LogCategory_Initialize()))
        {
          id v11 = CUDescriptionWithLevel();
          uint64_t v12 = [(NSMutableDictionary *)v56->_bonjourAWDLDevices objectForKeyedSubscript:v58];
          unsigned int v13 = "(update)";
          if (!v12) {
            unsigned int v13 = "(new)";
          }
          long long v49 = v11;
          unsigned int v51 = v13;
          long long v45 = v58;
          LogPrintF();
        }
        unint64_t v53 = v10;
        v54 = v8;
        long long v55 = v5;
        long long v14 = v56;
        bonjourAWDLDevices = v56->_bonjourAWDLDevices;
        if (!bonjourAWDLDevices)
        {
          long long v16 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
          long long v17 = v56->_bonjourAWDLDevices;
          v56->_bonjourAWDLDevices = v16;

          bonjourAWDLDevices = v56->_bonjourAWDLDevices;
        }
        long long v18 = v58;
        -[NSMutableDictionary setObject:forKeyedSubscript:](bonjourAWDLDevices, "setObject:forKeyedSubscript:", v4, v58, v45, v49, v51);
        long long v63 = 0u;
        long long v64 = 0u;
        long long v61 = 0u;
        long long v62 = 0u;
        long long v19 = v56->_xpcConnections;
        id v20 = [(NSMutableSet *)v19 countByEnumeratingWithState:&v61 objects:v69 count:16];
        if (v20)
        {
          id v21 = v20;
          uint64_t v22 = *(void *)v62;
          long long v57 = v19;
          do
          {
            long long v23 = 0;
            do
            {
              if (*(void *)v62 != v22) {
                objc_enumerationMutation(v19);
              }
              id v24 = *(void **)(*((void *)&v61 + 1) + 8 * (void)v23);
              id v25 = [v24 clientNetCnx:v48, v50, v52];
              unsigned __int8 v26 = [v25 present];

              if ((v26 & 1) == 0)
              {
                uint64_t v27 = v22;
                uint64_t v28 = [v24 activatedSession];
                id v29 = v28;
                if (!v28 || ![v28 needsAWDL]) {
                  goto LABEL_61;
                }
                id v30 = [v29 daemonDevice];
                id v31 = [v30 identifier];
                unsigned __int8 v59 = v30;
                if ([v31 isEqual:v18])
                {

LABEL_42:
                  [v29 setBonjourDevice:v4];
                  if (dword_1001426A0 <= 30 && (dword_1001426A0 != -1 || _LogCategory_Initialize()))
                  {
                    [v29 serviceType];
                    v50 = long long v48 = v59;
                    LogPrintF();
                  }
                  long long v39 = sub_1000A71C0();
                  long long v40 = sub_1000A71C0();
                  os_signpost_id_t v41 = os_signpost_id_make_with_pointer(v40, v14);

                  if (v41 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v39))
                  {
                    long long v42 = [v29 serviceType];
                    *(_DWORD *)buf = 138412546;
                    long long v66 = v59;
                    __int16 v67 = 2112;
                    long long v68 = v42;
                    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v39, OS_SIGNPOST_EVENT, v41, "Found AWDL device", "Start connection to found AWDL device (%@) for service type %@ \n", buf, 0x16u);
                  }
                  id v60 = 0;
                  long long v36 = v59;
                  unsigned __int8 v43 = [v24 netConnectionStartWithDevice:v59 session:v29 error:&v60];
                  id v37 = v60;
                  if (v43)
                  {
                    long long v19 = v57;
                    long long v18 = v58;
                    goto LABEL_59;
                  }
                  long long v19 = v57;
                  if (dword_1001426A0 <= 90)
                  {
                    long long v18 = v58;
                    if (dword_1001426A0 != -1 || _LogCategory_Initialize())
                    {
                      long long v48 = v59;
                      unint64_t v50 = v37;
                      LogPrintF();
                    }
LABEL_59:

LABEL_60:
LABEL_61:

                    uint64_t v22 = v27;
                    goto LABEL_62;
                  }
                }
                else
                {
                  uint64_t v32 = [v30 bleDevice];
                  [v32 rapportIdentifier];
                  v34 = id v33 = v4;
                  unsigned __int8 v35 = [v34 isEqual:v18];

                  id v4 = v33;
                  long long v14 = v56;

                  if (v35) {
                    goto LABEL_42;
                  }
                  long long v19 = v57;
                  long long v18 = v58;
                  long long v36 = v59;
                  if (dword_1001426A0 > 30 || dword_1001426A0 == -1 && !_LogCategory_Initialize()) {
                    goto LABEL_60;
                  }
                  id v37 = [v59 identifier];
                  long long v38 = [v59 bleDevice];
                  [v38 rapportIdentifier];
                  v52 = unint64_t v50 = v37;
                  long long v48 = v58;
                  LogPrintF();

                  long long v36 = v59;
                }
                long long v18 = v58;
                goto LABEL_59;
              }
LABEL_62:
              long long v23 = (char *)v23 + 1;
            }
            while (v21 != v23);
            id v44 = [(NSMutableSet *)v19 countByEnumeratingWithState:&v61 objects:v69 count:16];
            id v21 = v44;
          }
          while (v44);
        }

        id v8 = v54;
        id v5 = v55;
        id v10 = v53;
      }
      else if (dword_1001426A0 <= 90 && (dword_1001426A0 != -1 || _LogCategory_Initialize()))
      {
        uint64_t v47 = CUDescriptionWithLevel();
        LogPrintF();
      }
    }
    else if (dword_1001426A0 <= 30 && (dword_1001426A0 != -1 || _LogCategory_Initialize()))
    {
      id v46 = CUDescriptionWithLevel();
      LogPrintF();
    }
    goto LABEL_70;
  }
  if (dword_1001426A0 <= 30 && (dword_1001426A0 != -1 || _LogCategory_Initialize()))
  {
LABEL_8:
    uint64_t v7 = CUDescriptionWithLevel();
    LogPrintF();
  }
LABEL_70:
}

- (void)_clientAWDLPairingSessionWithDevice:(id)a3
{
  id v4 = a3;
  id v5 = [v4 txtDictionary];
  CFStringGetTypeID();
  id v6 = CFDictionaryGetTypedValue();
  uint64_t v7 = v6;
  if (v6 && (unint64_t)[v6 length] > 0xF)
  {
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id v8 = self->_xpcConnections;
    id v9 = [(NSMutableSet *)v8 countByEnumeratingWithState:&v30 objects:v34 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v31;
      while (2)
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v31 != v11) {
            objc_enumerationMutation(v8);
          }
          unsigned int v13 = *(void **)(*((void *)&v30 + 1) + 8 * i);
          long long v14 = [v13 clientNetCnx];
          unsigned __int8 v15 = [v14 present];

          if ((v15 & 1) == 0)
          {
            long long v16 = [v13 activatedSession];
            long long v17 = v16;
            if (v16)
            {
              if ([v16 needsAWDL])
              {
                long long v18 = [v17 pairingInfo];

                if (v18)
                {
                  long long v19 = [v17 pairingInfo];
                  id v29 = 0;
                  id v20 = +[NSJSONSerialization JSONObjectWithData:v19 options:16 error:&v29];
                  id v21 = v29;

                  if (v21
                    && dword_1001426A0 <= 30
                    && (dword_1001426A0 != -1 || _LogCategory_Initialize()))
                  {
                    id v25 = v21;
                    LogPrintF();
                  }
                  CFStringGetTypeID();
                  uint64_t v22 = CFDictionaryGetTypedValue();
                  if (dword_1001426A0 <= 30 && (dword_1001426A0 != -1 || _LogCategory_Initialize()))
                  {
                    id v25 = v7;
                    unsigned __int8 v26 = v22;
                    LogPrintF();
                  }
                  if (v22 && ([v22 isEqualToString:v7] & 1) != 0)
                  {
                    uint64_t v27 = [v17 daemonDevice];
                    [v17 setBonjourDevice:v4];
                    if (dword_1001426A0 <= 30 && (dword_1001426A0 != -1 || _LogCategory_Initialize()))
                    {
                      [v17 serviceType:v25, v26];
                      v26 = id v25 = v4;
                      LogPrintF();
                    }
                    id v28 = 0;
                    unsigned __int8 v23 = [v13 netConnectionStartWithDevice:v27 session:v17 error:&v28];
                    id v24 = v28;
                    if ((v23 & 1) == 0
                      && dword_1001426A0 <= 90
                      && (dword_1001426A0 != -1 || _LogCategory_Initialize()))
                    {
                      LogPrintF();
                    }
                  }
                  else if (dword_1001426A0 <= 90 && (dword_1001426A0 != -1 || _LogCategory_Initialize()))
                  {
                    LogPrintF();
                  }

                  goto LABEL_48;
                }
              }
            }
          }
        }
        id v10 = [(NSMutableSet *)v8 countByEnumeratingWithState:&v30 objects:v34 count:16];
        if (v10) {
          continue;
        }
        break;
      }
    }
LABEL_48:
  }
  else if (dword_1001426A0 <= 90 && (dword_1001426A0 != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
}

- (void)_clientBonjourAWDLBrowserLostDevice:(id)a3
{
  id v12 = a3;
  id v4 = +[RPIdentityDaemon sharedIdentityDaemon];
  id v5 = [v4 resolveIdentityForBonjourDevice:v12 typeFlags:2];
  id v6 = v5;
  if (v5)
  {
    uint64_t v7 = [v5 idsDeviceID];
    if (v7)
    {
      if (dword_1001426A0 <= 30 && (dword_1001426A0 != -1 || _LogCategory_Initialize()))
      {
        uint64_t v11 = CUDescriptionWithLevel();
        LogPrintF();

        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_bonjourAWDLDevices, "setObject:forKeyedSubscript:", 0, v7, v7, v11);
      }
      else
      {
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_bonjourAWDLDevices, "setObject:forKeyedSubscript:", 0, v7, v8, v10);
      }
    }
    else if (dword_1001426A0 <= 90 && (dword_1001426A0 != -1 || _LogCategory_Initialize()))
    {
      id v9 = CUDescriptionWithLevel();
      LogPrintF();
    }
    goto LABEL_14;
  }
  if (dword_1001426A0 <= 30 && (dword_1001426A0 != -1 || _LogCategory_Initialize()))
  {
    uint64_t v7 = CUDescriptionWithLevel();
    LogPrintF();
LABEL_14:
  }
}

- (void)_clientLostAllDevices
{
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id obj = [(NSMutableDictionary *)self->_discoveredDevices allValues];
  id v2 = [obj countByEnumeratingWithState:&v24 objects:v29 count:16];
  if (v2)
  {
    id v3 = v2;
    uint64_t v18 = *(void *)v25;
    do
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(void *)v25 != v18) {
          objc_enumerationMutation(obj);
        }
        id v5 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        [v5 clearCameraCapabilitiesRefetchTimer];
        long long v22 = 0u;
        long long v23 = 0u;
        long long v20 = 0u;
        long long v21 = 0u;
        id v6 = self->_xpcConnections;
        id v7 = [(NSMutableSet *)v6 countByEnumeratingWithState:&v20 objects:v28 count:16];
        if (v7)
        {
          id v8 = v7;
          uint64_t v9 = *(void *)v21;
          do
          {
            for (j = 0; j != v8; j = (char *)j + 1)
            {
              if (*(void *)v21 != v9) {
                objc_enumerationMutation(v6);
              }
              uint64_t v11 = *(void **)(*((void *)&v20 + 1) + 8 * (void)j);
              id v12 = [v11 activatedDiscovery];
              unsigned int v13 = [v12 shouldReportDevice:v5];

              if (v13)
              {
                long long v14 = [v11 xpcCnx];
                unsigned __int8 v15 = [v14 remoteObjectProxy];
                [v15 remoteDisplayLostDevice:v5];
              }
            }
            id v8 = [(NSMutableSet *)v6 countByEnumeratingWithState:&v20 objects:v28 count:16];
          }
          while (v8);
        }
      }
      id v3 = [obj countByEnumeratingWithState:&v24 objects:v29 count:16];
    }
    while (v3);
  }

  [(NSMutableDictionary *)self->_discoveredDevices removeAllObjects];
  discoveredDevices = self->_discoveredDevices;
  self->_discoveredDevices = 0;

  [(RPRemoteDisplayDaemon *)self _updateXPCMatchingDiscovery];
}

- (void)_clientSendNeedsAWDLOverWiFi:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = 392;
  if (a3) {
    uint64_t v5 = 376;
  }
  id v6 = *(id *)((char *)&self->super.isa + v5);
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id obj = v6;
  id v7 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v20 = *(void *)v27;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v27 != v20) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void *)(*((void *)&v26 + 1) + 8 * (void)v9);
        id v11 = objc_alloc_init((Class)RPCompanionLinkClient);
        [v11 setDispatchQueue:self->_dispatchQueue];
        id v12 = objc_alloc_init((Class)RPCompanionLinkDevice);
        [v12 setIdentifier:v10];
        [v11 setDestinationDevice:v12];
        [v11 setControlFlags:((unint64_t)[v11 controlFlags] | 0x400000)];
        unsigned int v13 = +[NSMutableDictionary dictionary];
        long long v14 = [(RPCompanionLinkDevice *)self->_localDeviceInfo identifier];
        [v13 setObject:v14 forKeyedSubscript:@"_i"];

        unsigned __int8 v15 = +[NSNumber numberWithBool:v3];
        [v13 setObject:v15 forKeyedSubscript:@"_ena"];

        v21[0] = _NSConcreteStackBlock;
        v21[1] = 3221225472;
        v21[2] = sub_1000AB898;
        v21[3] = &unk_100124A70;
        v21[4] = v10;
        v21[5] = v11;
        BOOL v24 = v3;
        id v22 = v13;
        long long v23 = self;
        BOOL v25 = v3;
        id v16 = v13;
        [v11 activateWithCompletion:v21];

        uint64_t v9 = (char *)v9 + 1;
      }
      while (v8 != v9);
      id v8 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v8);
  }

  if (!v3)
  {
    needsAWDLSentToPeers = self->_needsAWDLSentToPeers;
    self->_needsAWDLSentToPeers = 0;
  }
  needsAWDLNewPeers = self->_needsAWDLNewPeers;
  self->_needsAWDLNewPeers = 0;
}

- (void)_serverEnsureStarted
{
  if ([(CUSystemMonitor *)self->_systemMonitor firstUnlocked])
  {
    if (self->_prefServerBonjourInfra)
    {
      unsigned int v3 = [(RPRemoteDisplayDaemon *)self _serverBonjourAWDLNeeded];
      [(RPRemoteDisplayDaemon *)self _serverTCPEnsureStarted];
LABEL_4:
      [(RPRemoteDisplayDaemon *)self _serverBonjourEnsureStarted];
LABEL_17:
      if ([(RPRemoteDisplayDaemon *)self _serverBLEDiscoveryShouldStart]) {
        [(RPRemoteDisplayDaemon *)self _serverBLEDiscoveryEnsureStarted];
      }
      else {
        [(RPRemoteDisplayDaemon *)self _serverBLEDiscoveryEnsureStopped];
      }
      if (self->_prefBLEServer
        && [(RPRemoteDisplayDaemon *)self _serverBLENearbyActionV2DiscoveryShouldRun])
      {
        [(RPRemoteDisplayDaemon *)self _serverBLENearbyActionV2DiscoveryEnsureStarted];
      }
      else
      {
        [(RPRemoteDisplayDaemon *)self _serverBLENearbyActionV2DiscoveryEnsureStopped];
      }
      if (self->_prefBLEServer || self->_awdlPairingID) {
        [(RPRemoteDisplayDaemon *)self _serverBLENeedsAWDLScannerEnsureStarted];
      }
      else {
        [(RPRemoteDisplayDaemon *)self _serverBLENeedsAWDLScannerEnsureStopped];
      }
      if (v3) {
        [(RPRemoteDisplayDaemon *)self _serverBonjourAWDLAdvertiserEnsureStarted];
      }
      else {
        [(RPRemoteDisplayDaemon *)self _serverBonjourAWDLAdvertiserEnsureStopped];
      }
      if ((GestaltGetDeviceClass() == 1 || GestaltGetDeviceClass() == 3)
        && objc_opt_class())
      {
        [(RPRemoteDisplayDaemon *)self _registerForCameraCapabilitiesRequest];
      }
      if (!self->_serverIncomingMessageCLinkClient)
      {
        [(RPRemoteDisplayDaemon *)self _serverRegisterForIncomingMessages];
      }
      return;
    }
    unsigned __int8 v4 = [(CUSystemMonitor *)self->_systemMonitor netFlags];
    unsigned int v5 = [(RPRemoteDisplayDaemon *)self _serverBonjourAWDLNeeded];
    unsigned int v3 = v5;
    if (v4 & 1) != 0 || (v5)
    {
      [(RPRemoteDisplayDaemon *)self _serverTCPEnsureStarted];
      if (v4) {
        goto LABEL_4;
      }
    }
    else
    {
      [(RPRemoteDisplayDaemon *)self _serverTCPEnsureStopped];
    }
    [(RPRemoteDisplayDaemon *)self _serverBonjourEnsureStopped];
    goto LABEL_17;
  }
  if (dword_1001426A0 <= 30 && (dword_1001426A0 != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
}

- (void)_serverEnsureStopped
{
  [(RPRemoteDisplayDaemon *)self _serverBLENeedsAWDLScannerEnsureStopped];
  [(RPRemoteDisplayDaemon *)self _serverBonjourAWDLAdvertiserEnsureStopped];
  [(RPRemoteDisplayDaemon *)self _serverBonjourEnsureStopped];
  [(RPRemoteDisplayDaemon *)self _serverTCPEnsureStopped];
  clinkClient = self->_clinkClient;
  if (clinkClient)
  {
    [(RPCompanionLinkClient *)clinkClient invalidate];
    unsigned __int8 v4 = self->_clinkClient;
    self->_clinkClient = 0;
  }
  if (self->_cameraCapabilityNotificationRegistered)
  {
    unsigned int v5 = +[NSNotificationCenter defaultCenter];
    [v5 removeObserver:self name:AVCaptureDeviceContinuityCaptureCameraCapabilitiesChangedNotification object:0];
    self->_cameraCapabilityNotificationRegistered = 0;
  }
  cameraCapabilities = self->_cameraCapabilities;
  self->_cameraCapabilities = 0;

  serverIncomingMessageCLinkClient = self->_serverIncomingMessageCLinkClient;
  if (serverIncomingMessageCLinkClient)
  {
    [(RPCompanionLinkClient *)serverIncomingMessageCLinkClient invalidate];
    id v8 = self->_serverIncomingMessageCLinkClient;
    self->_serverIncomingMessageCLinkClient = 0;

    needsAWDLRequestTimer = self->_needsAWDLRequestTimer;
    if (needsAWDLRequestTimer)
    {
      id v11 = needsAWDLRequestTimer;
      dispatch_source_cancel(v11);
      uint64_t v10 = self->_needsAWDLRequestTimer;
      self->_needsAWDLRequestTimer = 0;
    }
  }
}

- (void)_serverBLEDiscoveryEnsureStarted
{
  if (!self->_bleDiscovery)
  {
    [(RPRemoteDisplayDaemon *)self _bleDiscoveryEnsureStarted:1];
    self->_serverBLEDiscoveryStarted = 1;
    [(RPRemoteDisplayDaemon *)self _bleDiscoveryTriggerEnhancedDiscovery:@"StartWombatStream" useCase:131087];
  }
}

- (void)_serverBLEDiscoveryEnsureStopped
{
  if (self->_serverBLEDiscoveryStarted) {
    [(RPRemoteDisplayDaemon *)self _bleDiscoveryEnsureStopped];
  }
}

- (BOOL)_serverBLEDiscoveryShouldStart
{
  if (GestaltGetDeviceClass() != 1 && GestaltGetDeviceClass() != 3) {
    return 0;
  }
  unsigned int v3 = [(RPNearbyActionV2Discovery *)self->_bleNearbyActionV2Discovery actionV2Devices];
  BOOL v4 = [v3 count] != 0;

  return v4;
}

- (void)_serverBLENeedsAWDLScannerEnsureStarted
{
  if (self->_bleNeedsAWDLScanner)
  {
    BOOL v3 = [(RPRemoteDisplayDaemon *)self _serverBLENeedsAWDLScannerScreenOff];
    if (v3 != [(SFDeviceDiscovery *)self->_bleNeedsAWDLScanner overrideScreenOff])
    {
      bleNeedsAWDLScanner = self->_bleNeedsAWDLScanner;
      [(SFDeviceDiscovery *)bleNeedsAWDLScanner setOverrideScreenOff:v3];
    }
  }
  else
  {
    uint64_t bleNeedsAWDLScannerID = self->_bleNeedsAWDLScannerID;
    if (dword_1001426A0 <= 30 && (dword_1001426A0 != -1 || _LogCategory_Initialize()))
    {
      uint64_t v10 = bleNeedsAWDLScannerID;
      LogPrintF();
    }
    id v6 = (SFDeviceDiscovery *)objc_alloc_init((Class)off_100142710[0]());
    id v7 = self->_bleNeedsAWDLScanner;
    self->_bleNeedsAWDLScanner = v6;

    [(SFDeviceDiscovery *)self->_bleNeedsAWDLScanner setChangeFlags:1];
    [(SFDeviceDiscovery *)self->_bleNeedsAWDLScanner setDiscoveryFlags:131136];
    [(SFDeviceDiscovery *)self->_bleNeedsAWDLScanner setDispatchQueue:self->_dispatchQueue];
    [(SFDeviceDiscovery *)self->_bleNeedsAWDLScanner setOverrideScreenOff:[(RPRemoteDisplayDaemon *)self _serverBLENeedsAWDLScannerScreenOff]];
    [(SFDeviceDiscovery *)self->_bleNeedsAWDLScanner setPurpose:@"RDLink"];
    if (GestaltGetDeviceClass() == 4) {
      uint64_t v8 = -75;
    }
    else {
      uint64_t v8 = -60;
    }
    -[SFDeviceDiscovery setRssiThreshold:](self->_bleNeedsAWDLScanner, "setRssiThreshold:", v8, v10);
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_1000AC174;
    v16[3] = &unk_100121890;
    v16[4] = self;
    int v17 = bleNeedsAWDLScannerID;
    [(SFDeviceDiscovery *)self->_bleNeedsAWDLScanner setDeviceFoundHandler:v16];
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_1000AC198;
    v14[3] = &unk_100121890;
    v14[4] = self;
    int v15 = bleNeedsAWDLScannerID;
    [(SFDeviceDiscovery *)self->_bleNeedsAWDLScanner setDeviceLostHandler:v14];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_1000AC1BC;
    v12[3] = &unk_1001218B8;
    v12[4] = self;
    int v13 = bleNeedsAWDLScannerID;
    [(SFDeviceDiscovery *)self->_bleNeedsAWDLScanner setDeviceChangedHandler:v12];
    uint64_t v9 = self->_bleNeedsAWDLScanner;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_1000AC1E0;
    v11[3] = &unk_100121908;
    v11[4] = self;
    [(SFDeviceDiscovery *)v9 activateWithCompletion:v11];
  }
}

- (void)_serverBLENeedsAWDLScannerEnsureStopped
{
  if (self->_bleNeedsAWDLScanner)
  {
    if (dword_1001426A0 <= 30 && (dword_1001426A0 != -1 || _LogCategory_Initialize()))
    {
      uint64_t bleNeedsAWDLScannerID = self->_bleNeedsAWDLScannerID;
      LogPrintF();
    }
    [(SFDeviceDiscovery *)self->_bleNeedsAWDLScanner invalidate];
    bleNeedsAWDLScanner = self->_bleNeedsAWDLScanner;
    self->_bleNeedsAWDLScanner = 0;

    ++self->_bleNeedsAWDLScannerID;
    [(NSMutableDictionary *)self->_needsAWDLDevices removeAllObjects];
    needsAWDLDevices = self->_needsAWDLDevices;
    self->_needsAWDLDevices = 0;
  }
}

- (BOOL)_serverBLENeedsAWDLScannerScreenOff
{
  return (GestaltGetDeviceClass() & 0xFFFFFFFD) == 1;
}

- (void)_serverBLENeedsAWDLScannerDeviceFound:(id)a3
{
  id v11 = a3;
  BOOL v4 = [v11 idsIdentifier];
  if (v4
    || ([v11 identifier],
        unsigned int v5 = objc_claimAutoreleasedReturnValue(),
        [v5 UUIDString],
        BOOL v4 = objc_claimAutoreleasedReturnValue(),
        v5,
        v4))
  {
    if (((unsigned __int16)[v11 deviceFlags] & 0xC008) != 0)
    {
      id v6 = [(NSMutableDictionary *)self->_needsAWDLDevices objectForKeyedSubscript:v4];
      if ([v11 deviceActionType] == 50)
      {
        needsAWDLDevices = self->_needsAWDLDevices;
        if (!needsAWDLDevices)
        {
          uint64_t v8 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
          uint64_t v9 = self->_needsAWDLDevices;
          self->_needsAWDLDevices = v8;

          needsAWDLDevices = self->_needsAWDLDevices;
        }
        [(NSMutableDictionary *)needsAWDLDevices setObject:v11 forKeyedSubscript:v4];
        if (v6)
        {
          if (dword_1001426A0 > 30 || dword_1001426A0 == -1 && !_LogCategory_Initialize()) {
            goto LABEL_25;
          }
          id v10 = v11;
        }
        else
        {
          if (dword_1001426A0 > 30 || dword_1001426A0 == -1 && !_LogCategory_Initialize()) {
            goto LABEL_25;
          }
          id v10 = v11;
        }
      }
      else
      {
        if (!v6) {
          goto LABEL_25;
        }
        [(NSMutableDictionary *)self->_needsAWDLDevices setObject:0 forKeyedSubscript:v4];
        if (dword_1001426A0 > 30 || dword_1001426A0 == -1 && !_LogCategory_Initialize()) {
          goto LABEL_25;
        }
        id v10 = v6;
      }
      LogPrintF();
LABEL_25:
      [(RPRemoteDisplayDaemon *)self _update];

      goto LABEL_34;
    }
    if (dword_1001426A0 <= 20 && (dword_1001426A0 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
  }
  else
  {
    if (dword_1001426A0 <= 30 && (dword_1001426A0 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    BOOL v4 = 0;
  }
LABEL_34:
}

- (void)_serverBLENeedsAWDLScannerDeviceLost:(id)a3
{
  id v8 = a3;
  BOOL v4 = [v8 idsIdentifier];
  if (v4
    || ([v8 identifier],
        unsigned int v5 = objc_claimAutoreleasedReturnValue(),
        [v5 UUIDString],
        BOOL v4 = objc_claimAutoreleasedReturnValue(),
        v5,
        v4))
  {
    id v6 = [(NSMutableDictionary *)self->_needsAWDLDevices objectForKeyedSubscript:v4];
    if (v6)
    {
      [(NSMutableDictionary *)self->_needsAWDLDevices setObject:0 forKeyedSubscript:v4];
      if (dword_1001426A0 <= 30 && (dword_1001426A0 != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
        [(RPRemoteDisplayDaemon *)self _update];
      }
      else
      {
        [(RPRemoteDisplayDaemon *)self _update];
      }
    }
  }
  else if (dword_1001426A0 <= 30 && (dword_1001426A0 != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
}

- (BOOL)_serverBLENearbyActionV2DiscoveryShouldRun
{
  BOOL v3 = +[RPCloudDaemon sharedCloudDaemon];
  BOOL v4 = [v3 idsIsSignedIn]
    && self->_prefNearbyActionV2
    && ((GestaltGetDeviceClass() & 0xFFFFFFFD) == 1 || [v3 idsHasMac]);

  return v4;
}

- (void)_serverBLENearbyActionV2DiscoveryEnsureStarted
{
  if (!self->_bleNearbyActionV2Discovery)
  {
    BOOL v3 = objc_alloc_init(RPNearbyActionV2Discovery);
    bleNearbyActionV2Discovery = self->_bleNearbyActionV2Discovery;
    self->_bleNearbyActionV2Discovery = v3;

    [(RPNearbyActionV2Discovery *)self->_bleNearbyActionV2Discovery setDiscoveryFlags:33554688];
    [(RPNearbyActionV2Discovery *)self->_bleNearbyActionV2Discovery setDispatchQueue:self->_dispatchQueue];
    uint64_t wombatState = self->_wombatState;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_1000AC9E4;
    v9[3] = &unk_100124A98;
    v9[4] = self;
    [(RPRemoteDisplayDaemon *)self _bluetoothUseCaseFromWombatState:wombatState resultBlock:v9];
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_1000ACA78;
    v8[3] = &unk_100121158;
    v8[4] = self;
    [(RPNearbyActionV2Discovery *)self->_bleNearbyActionV2Discovery setUpdateHandler:v8];
    id v6 = self->_bleNearbyActionV2Discovery;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_1000ACAB8;
    v7[3] = &unk_100121908;
    v7[4] = self;
    [(RPNearbyActionV2Discovery *)v6 activateWithCompletion:v7];
  }
}

- (void)_serverBLENearbyActionV2DiscoveryEnsureStopped
{
  bleNearbyActionV2Discovery = self->_bleNearbyActionV2Discovery;
  if (bleNearbyActionV2Discovery)
  {
    [(RPNearbyActionV2Discovery *)bleNearbyActionV2Discovery invalidate];
    BOOL v4 = self->_bleNearbyActionV2Discovery;
    self->_bleNearbyActionV2Discovery = 0;

    if (dword_1001426A0 <= 30 && (dword_1001426A0 != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
}

- (void)_serverBonjourEnsureStarted
{
  if (self->_bonjourAdvertiser)
  {
    [(RPRemoteDisplayDaemon *)self _serverBonjourUpdateTXT];
    return;
  }
  if (self->_btAdvAddrData)
  {
    id v3 = [(CUTCPServer *)self->_tcpServer tcpListeningPort];
    if ((int)v3 > 0)
    {
      id v4 = v3;
      if (dword_1001426A0 <= 30 && (dword_1001426A0 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
      unsigned int v5 = (CUBonjourAdvertiser *)objc_alloc_init((Class)CUBonjourAdvertiser);
      bonjourAdvertiser = self->_bonjourAdvertiser;
      self->_bonjourAdvertiser = v5;

      [(CUBonjourAdvertiser *)self->_bonjourAdvertiser setDispatchQueue:self->_dispatchQueue];
      [(CUBonjourAdvertiser *)self->_bonjourAdvertiser setDomain:@"local."];
      [(CUBonjourAdvertiser *)self->_bonjourAdvertiser setLabel:@"RDLink"];
      [(CUBonjourAdvertiser *)self->_bonjourAdvertiser setPort:v4];
      [(CUBonjourAdvertiser *)self->_bonjourAdvertiser setServiceType:@"_rdlink._tcp"];
      if (!sub_10000DD3C()) {
        [(CUBonjourAdvertiser *)self->_bonjourAdvertiser setInterfaceIndex:[(RPRemoteDisplayDaemon *)self _serverDirectLinkInterfaceIndex]];
      }
      [(RPRemoteDisplayDaemon *)self _serverBonjourUpdateTXT];
      uint64_t v7 = self->_bonjourAdvertiser;
      [(CUBonjourAdvertiser *)v7 activate];
      return;
    }
    if (dword_1001426A0 > 20 || dword_1001426A0 == -1 && !_LogCategory_Initialize()) {
      return;
    }
  }
  else if (dword_1001426A0 > 20 || dword_1001426A0 == -1 && !_LogCategory_Initialize())
  {
    return;
  }

  LogPrintF();
}

- (void)_serverBonjourEnsureStopped
{
  if (self->_bonjourAdvertiser)
  {
    if (dword_1001426A0 <= 30 && (dword_1001426A0 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    [(CUBonjourAdvertiser *)self->_bonjourAdvertiser invalidate];
    bonjourAdvertiser = self->_bonjourAdvertiser;
    self->_bonjourAdvertiser = 0;
  }
}

- (id)_serverBonjourAuthTagString
{
  if (!self->_deviceAuthTagStr)
  {
    id v3 = [(RPRemoteDisplayDaemon *)self _serverBonjourAuthTagStringWithData:self->_btAdvAddrData];
    deviceAuthTagStr = self->_deviceAuthTagStr;
    self->_deviceAuthTagStr = v3;

    if (dword_1001426A0 <= 30 && (dword_1001426A0 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
  }
  unsigned int v5 = self->_deviceAuthTagStr;

  return v5;
}

- (id)_serverBonjourAuthTagStringWithData:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (v3)
  {
    unsigned int v5 = +[RPIdentityDaemon sharedIdentityDaemon];
    id v6 = [v5 identityOfSelfAndReturnError:0];

    if (v6)
    {
      uint64_t v7 = [v6 authTagForData:v4 type:1 error:0];
      id v8 = v7;
      if (v7)
      {
        id v9 = v7;
        [v9 bytes];
        [v9 length];
        [v9 length];
        id v10 = NSPrintF();
      }
      else
      {
        id v10 = 0;
      }
    }
    else
    {
      id v10 = 0;
    }
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

- (void)_serverBonjourUpdateTXT
{
  id v5 = objc_alloc_init((Class)NSMutableDictionary);
  [(RPRemoteDisplayDaemon *)self _localDeviceUpdate];
  id v3 = [(RPRemoteDisplayDaemon *)self _serverBonjourAuthTagString];
  if (v3) {
    [v5 setObject:v3 forKeyedSubscript:@"rpAD"];
  }

  btAdvAddrStr = self->_btAdvAddrStr;
  if (btAdvAddrStr) {
    [v5 setObject:btAdvAddrStr forKeyedSubscript:@"rpBA"];
  }
  [v5 setObject:@"630.42.2" forKeyedSubscript:@"rpVr"];
  [(CUBonjourAdvertiser *)self->_bonjourAdvertiser setTxtDictionary:v5];
}

- (void)_serverBonjourAWDLAdvertiserEnsureStarted
{
  if (!self->_bonjourAWDLAdvertiser)
  {
    id v3 = self->_btAdvAddrData;
    if (v3)
    {
      id v4 = [(CUTCPServer *)self->_tcpServer tcpListeningPort];
      if ((int)v4 > 0)
      {
        id v5 = v4;
        id v6 = +[RPWiFiP2PTransaction sharedInstance];
        [v6 activateForClient:@"Sidecar"];

        uint64_t v7 = (CUBonjourAdvertiser *)objc_alloc_init((Class)CUBonjourAdvertiser);
        bonjourAWDLAdvertiser = self->_bonjourAWDLAdvertiser;
        self->_bonjourAWDLAdvertiser = v7;

        [(CUBonjourAdvertiser *)self->_bonjourAWDLAdvertiser setAdvertiseFlags:2048];
        [(CUBonjourAdvertiser *)self->_bonjourAWDLAdvertiser setDispatchQueue:self->_dispatchQueue];
        [(CUBonjourAdvertiser *)self->_bonjourAWDLAdvertiser setDomain:@"local."];
        [(CUBonjourAdvertiser *)self->_bonjourAWDLAdvertiser setInterfaceName:@"awdl0"];
        [(CUBonjourAdvertiser *)self->_bonjourAWDLAdvertiser setLabel:@"RDLink"];
        id v9 = NSPrintF();
        -[CUBonjourAdvertiser setName:](self->_bonjourAWDLAdvertiser, "setName:", v9, v3);

        [(CUBonjourAdvertiser *)self->_bonjourAWDLAdvertiser setPort:v5];
        [(CUBonjourAdvertiser *)self->_bonjourAWDLAdvertiser setServiceType:@"_rdlink._tcp"];
        [(RPRemoteDisplayDaemon *)self _serverBonjourAWDLAdvertiserUpdateTXT];
        if (dword_1001426A0 <= 30 && (dword_1001426A0 != -1 || _LogCategory_Initialize()))
        {
          long long v14 = CUDescriptionWithLevel();
          LogPrintF();
        }
        id v10 = sub_1000A71C0();
        id v11 = sub_1000A71C0();
        os_signpost_id_t v12 = os_signpost_id_make_with_pointer(v11, self);

        if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
        {
          int v13 = CUDescriptionWithLevel();
          *(_DWORD *)buf = 138412290;
          id v16 = v13;
          _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v10, OS_SIGNPOST_EVENT, v12, "Bonjour AWDL advertiser start", "Bonjour AWDL advertiser start: %@\n", buf, 0xCu);
        }
        [(CUBonjourAdvertiser *)self->_bonjourAWDLAdvertiser activate];
        goto LABEL_21;
      }
      if (dword_1001426A0 > 20 || dword_1001426A0 == -1 && !_LogCategory_Initialize())
      {
LABEL_21:

        return;
      }
    }
    else if (dword_1001426A0 > 20 || dword_1001426A0 == -1 && !_LogCategory_Initialize())
    {
      goto LABEL_21;
    }
    LogPrintF();
    goto LABEL_21;
  }

  [(RPRemoteDisplayDaemon *)self _serverBonjourAWDLAdvertiserUpdateTXT];
}

- (void)_serverBonjourAWDLAdvertiserEnsureStopped
{
  bonjourAWDLAdvertiser = self->_bonjourAWDLAdvertiser;
  if (bonjourAWDLAdvertiser)
  {
    if (dword_1001426A0 <= 30)
    {
      if (dword_1001426A0 != -1
        || (int v4 = _LogCategory_Initialize(), bonjourAWDLAdvertiser = self->_bonjourAWDLAdvertiser, v4))
      {
        id v8 = CUDescriptionWithLevel();
        LogPrintF();

        bonjourAWDLAdvertiser = self->_bonjourAWDLAdvertiser;
      }
    }
    [(CUBonjourAdvertiser *)bonjourAWDLAdvertiser invalidate];
    id v5 = self->_bonjourAWDLAdvertiser;
    self->_bonjourAWDLAdvertiser = 0;

    if (!self->_bonjourBrowserAWDL)
    {
      id v6 = +[RPWiFiP2PTransaction sharedInstance];
      [v6 invalidateForClient:@"Sidecar"];
    }
    deviceAWDLRandomID = self->_deviceAWDLRandomID;
    self->_deviceAWDLRandomID = 0;
  }
}

- (void)_serverBonjourAWDLAdvertiserUpdateTXT
{
  if (self->_deviceAWDLRandomID
    || (NSRandomData(),
        id v3 = (NSData *)objc_claimAutoreleasedReturnValue(),
        deviceAWDLRandomID = self->_deviceAWDLRandomID,
        self->_deviceAWDLRandomID = v3,
        deviceAWDLRandomID,
        (id)[(NSData *)self->_deviceAWDLRandomID length] == (id)6))
  {
    id v14 = objc_alloc_init((Class)NSMutableDictionary);
    id v5 = self->_deviceAWDLRandomID;
    id v6 = v5;
    if (v5)
    {
      id v12 = [(NSData *)v5 bytes];
      uint64_t v7 = NSPrintF();
      if (v7) {
        [v14 setObject:v7 forKeyedSubscript:@"rpBA"];
      }
      id v8 = -[RPRemoteDisplayDaemon _serverBonjourAuthTagStringWithData:](self, "_serverBonjourAuthTagStringWithData:", self->_deviceAWDLRandomID, v12);
      if (v8) {
        [v14 setObject:v8 forKeyedSubscript:@"rpAD"];
      }
      if (dword_1001426A0 <= 30 && (dword_1001426A0 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
      awdlPairingID = self->_awdlPairingID;
      if (awdlPairingID)
      {
        [v14 setObject:awdlPairingID forKeyedSubscript:@"rpPI"];
        uint64_t v10 = 526336;
      }
      else
      {
        uint64_t v10 = 2048;
      }
      uint64_t v13 = v10;
      id v11 = NSPrintF();
      [v14 setObject:v11 forKeyedSubscript:@"rpFl"];

      [v14 setObject:@"630.42.2" forKeyedSubscript:@"rpVr"];
      [(CUBonjourAdvertiser *)self->_bonjourAWDLAdvertiser setTxtDictionary:v14];
    }
  }
}

- (BOOL)_serverBonjourAWDLNeeded
{
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x2020000000;
  BOOL v12 = 0;
  if ([(NSMutableDictionary *)self->_needsAWDLDevices count])
  {
    BOOL v3 = 1;
  }
  else
  {
    int v4 = [(RPNearbyActionV2Discovery *)self->_bleNearbyActionV2Discovery actionV2Devices];
    BOOL v3 = [v4 count] || self->_bonjourAWDLAdvertiserForce || self->_awdlPairingID != 0;
  }
  BOOL v12 = v3;
  if (*((unsigned char *)v10 + 24) || [(NSMutableSet *)self->_needsAWDLRequestIdentifiers count])
  {
    BOOL v5 = 1;
  }
  else
  {
    tcpServerConnections = self->_tcpServerConnections;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_1000AD8E0;
    v8[3] = &unk_100124AC0;
    v8[4] = &v9;
    [(NSMutableDictionary *)tcpServerConnections enumerateKeysAndObjectsUsingBlock:v8];
    BOOL v5 = *((unsigned char *)v10 + 24) != 0;
  }
  _Block_object_dispose(&v9, 8);
  return v5;
}

- (void)_serverTCPEnsureStarted
{
  if (!self->_tcpServer)
  {
    if (dword_1001426A0 <= 30 && (dword_1001426A0 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    BOOL v3 = (CUTCPServer *)objc_alloc_init((Class)CUTCPServer);
    tcpServer = self->_tcpServer;
    self->_tcpServer = v3;

    [(CUTCPServer *)self->_tcpServer setDispatchQueue:self->_dispatchQueue];
    [(CUTCPServer *)self->_tcpServer setFlags:9];
    [(CUTCPServer *)self->_tcpServer setLabel:@"RDLink"];
    [(CUTCPServer *)self->_tcpServer setMaxConnectionCount:8];
    if (self->_awdlPairingID)
    {
      memset(v16, 0, sizeof(v16));
      uint64_t v15 = 0;
      unsigned int v5 = if_nametoindex("awdl0");
      [(CUTCPServer *)self->_tcpServer setMaxConnectionCount:1];
      id v6 = self->_tcpServer;
      __int16 v14 = 7708;
      unsigned int v17 = v5;
      [(CUTCPServer *)v6 setInterfaceAddress:&v14];
    }
    [(CUTCPServer *)self->_tcpServer setConnectionPrepareHandler:&stru_100124AE0];
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_1000ADB90;
    v13[3] = &unk_100121BE8;
    v13[4] = self;
    [(CUTCPServer *)self->_tcpServer setConnectionStartedHandler:v13];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_1000ADBA8;
    v12[3] = &unk_100124B08;
    v12[4] = self;
    [(CUTCPServer *)self->_tcpServer setConnectionEndedHandler:v12];
    uint64_t v7 = self->_tcpServer;
    id v11 = 0;
    [(CUTCPServer *)v7 activateDirectAndReturnError:&v11];
    id v8 = v11;
    if (v8)
    {
      if (dword_1001426A0 <= 90 && (dword_1001426A0 != -1 || _LogCategory_Initialize()))
      {
        id v10 = v8;
        LogPrintF();
      }
      [(CUTCPServer *)self->_tcpServer invalidate];
      uint64_t v9 = self->_tcpServer;
      self->_tcpServer = 0;
    }
  }
}

- (void)_serverTCPEnsureStopped
{
  if (self->_tcpServer)
  {
    if (dword_1001426A0 <= 30 && (dword_1001426A0 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    long long v11 = 0u;
    long long v12 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    BOOL v3 = self->_bufferedConnections;
    id v4 = [(NSMutableSet *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (v4)
    {
      id v5 = v4;
      uint64_t v6 = *(void *)v10;
      do
      {
        for (i = 0; i != v5; i = (char *)i + 1)
        {
          if (*(void *)v10 != v6) {
            objc_enumerationMutation(v3);
          }
          [*(id *)(*((void *)&v9 + 1) + 8 * i) invalidate:v9];
        }
        id v5 = [(NSMutableSet *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
      }
      while (v5);
    }

    [(NSMutableSet *)self->_bufferedConnections removeAllObjects];
    [(NSMutableDictionary *)self->_tcpServerConnections enumerateKeysAndObjectsUsingBlock:&stru_100124B48];
    [(NSMutableDictionary *)self->_tcpServerConnections removeAllObjects];
    [(CUTCPServer *)self->_tcpServer invalidate];
    tcpServer = self->_tcpServer;
    self->_tcpServer = 0;
  }
}

- (void)_serverTCPHandleConnectionStarted:(id)a3
{
  uint64_t sessionIDLast = self->_sessionIDLast;
  self->_uint64_t sessionIDLast = sessionIDLast + 1;
  id v5 = a3;
  uint64_t v6 = +[NSNumber numberWithUnsignedInt:sessionIDLast];
  id v7 = objc_alloc_init((Class)RPConnection);
  [v7 setControlFlags:0x400000000240];
  [v7 setDispatchQueue:self->_dispatchQueue];
  id v8 = +[RPIdentityDaemon sharedIdentityDaemon];
  [v7 setIdentityDaemon:v8];

  [v7 setKeepAliveSeconds:10];
  id v9 = objc_alloc((Class)NSString);
  uint64_t v10 = self->_cnxIDLast + 1;
  self->_cnxIDLast = v10;
  id v11 = [v9 initWithFormat:@"%@Cnx-%u", @"RDLink", v10];
  [v7 setLabel:v11];

  [v7 setLocalDeviceInfo:self->_localDeviceInfo];
  [v7 setTcpConnection:v5];

  [(RPRemoteDisplayDaemon *)self _connectionConfigureCommon:v7];
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_1000AE218;
  v22[3] = &unk_100121770;
  v22[4] = self;
  void v22[5] = v6;
  v22[6] = v7;
  [v7 setInvalidationHandler:v22];
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_1000AE284;
  v21[3] = &unk_1001219F8;
  v21[4] = v7;
  v21[5] = v6;
  [v7 setReceivedEventHandler:v21];
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_1000AE388;
  v20[3] = &unk_100121A20;
  v20[4] = v7;
  void v20[5] = v6;
  [v7 setReceivedRequestHandler:v20];
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_1000AE4A0;
  v19[3] = &unk_100124B70;
  v19[4] = self;
  void v19[5] = v6;
  v19[6] = v7;
  [v7 setSessionStartHandler:v19];
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_1000AE4E4;
  v18[3] = &unk_100121A48;
  v18[4] = v7;
  void v18[5] = self;
  [v7 setStateChangedHandler:v18];
  bufferedConnections = self->_bufferedConnections;
  if (!bufferedConnections)
  {
    uint64_t v13 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    __int16 v14 = self->_bufferedConnections;
    self->_bufferedConnections = v13;

    bufferedConnections = self->_bufferedConnections;
  }
  [(NSMutableSet *)bufferedConnections addObject:v7];
  tcpServerConnections = self->_tcpServerConnections;
  if (!tcpServerConnections)
  {
    id v16 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    unsigned int v17 = self->_tcpServerConnections;
    self->_tcpServerConnections = v16;

    tcpServerConnections = self->_tcpServerConnections;
  }
  [(NSMutableDictionary *)tcpServerConnections setObject:v7 forKeyedSubscript:v6];
  [v7 activate];
}

- (void)_serverHandleSessionStartWithID:(id)a3 netCnx:(id)a4 completion:(id)a5
{
  id v42 = a3;
  id v7 = a4;
  v55[0] = _NSConcreteStackBlock;
  v55[1] = 3221225472;
  v55[2] = sub_1000AEE38;
  v55[3] = &unk_100124B98;
  id v43 = a5;
  id v58 = v43;
  id v56 = 0;
  id v8 = v7;
  id v57 = v8;
  id v44 = objc_retainBlock(v55);
  id v9 = [v8 serviceType];
  LODWORD(a5) = v9 == 0;

  if (a5)
  {
    if (dword_1001426A0 <= 30 && (dword_1001426A0 != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
      [v8 setServiceType:@"_rdlink._tcp" serviceType:@"_rdlink._tcp"];
    }
    else
    {
      [v8 setServiceType:@"_rdlink._tcp" v41];
    }
  }
  uint64_t v10 = [v8 serviceType];
  id v11 = [v8 peerDeviceInfo];
  long long v12 = [v11 model];
  int v13 = GestaltProductTypeStringToDeviceClass();

  if (v13 == 4 && [v10 isEqualToString:@"com.apple.continuitycapture"])
  {
    __int16 v14 = [v8 peerDeviceInfo];
    id v15 = [v14 verifiedIdentity];

    deviceConfirmedIdentifier = self->_deviceConfirmedIdentifier;
    if (!deviceConfirmedIdentifier || ![(NSString *)deviceConfirmedIdentifier isEqualToString:v15])
    {
      if (dword_1001426A0 <= 90 && (dword_1001426A0 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
      uint64_t v39 = RPErrorF();
LABEL_57:
      id v34 = (id)v39;
      goto LABEL_69;
    }
  }
  unsigned int v17 = [(NSMutableDictionary *)self->_xpcMatchingServerMap allValues];
  long long v53 = 0u;
  long long v54 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  id v15 = v17;
  id v18 = [v15 countByEnumeratingWithState:&v51 objects:v59 count:16];
  if (!v18)
  {
LABEL_25:

LABEL_29:
    long long v31 = [(NSMutableDictionary *)self->_activatedServerXPCCnxMap objectForKeyedSubscript:v10];
    BOOL v32 = v31 == 0;

    if (!v32)
    {
      id v29 = 0;
      char v30 = 1;
      goto LABEL_31;
    }
    if (dword_1001426A0 <= 30 && (dword_1001426A0 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    uint64_t v39 = RPErrorF();
    goto LABEL_57;
  }
  uint64_t v19 = *(void *)v52;
LABEL_14:
  uint64_t v20 = 0;
  while (1)
  {
    if (*(void *)v52 != v19) {
      objc_enumerationMutation(v15);
    }
    long long v21 = *(void **)(*((void *)&v51 + 1) + 8 * v20);
    id v22 = [v21 serviceType];
    BOOL v23 = v22 == 0;

    if (v23) {
      goto LABEL_23;
    }
    BOOL v24 = [v21 serviceType];
    id v25 = v10;
    id v26 = v24;
    if (v25 == v26) {
      break;
    }
    long long v27 = v26;
    if ((v10 == 0) != (v26 != 0))
    {
      unsigned __int8 v28 = [v25 isEqual:v26];

      if (v28) {
        goto LABEL_27;
      }
    }
    else
    {
    }
LABEL_23:
    if (v18 == (id)++v20)
    {
      id v18 = [v15 countByEnumeratingWithState:&v51 objects:v59 count:16];
      if (v18) {
        goto LABEL_14;
      }
      goto LABEL_25;
    }
  }

LABEL_27:
  id v29 = v21;

  if (!v29) {
    goto LABEL_29;
  }
  char v30 = 0;
LABEL_31:
  if ((unint64_t)[(NSMutableSet *)self->_bufferedConnections count] < 6)
  {
    if (v30)
    {
      long long v33 = 0;
    }
    else
    {
      id v50 = 0;
      long long v33 = [(RPRemoteDisplayDaemon *)self _acquireRBSAssertionForEntry:v29 error:&v50];
      id v34 = v50;
      if (v34)
      {
LABEL_67:

        goto LABEL_68;
      }
    }
    unsigned __int8 v35 = [(NSMutableDictionary *)self->_activatedServerXPCCnxMap objectForKeyedSubscript:v10];
    long long v36 = v35;
    if (v35)
    {
      id v37 = [v35 serverNetCnxs];
      if (!v37)
      {
        id v37 = objc_alloc_init((Class)NSMutableSet);
        [v36 setServerNetCnxs:v37];
      }
      [v37 addObject:v8];
      [v8 setClient:v36];
      long long v38 = v46;
      v46[0] = _NSConcreteStackBlock;
      v46[1] = 3221225472;
      v46[2] = sub_1000AEF60;
      v46[3] = &unk_1001236F8;
      v46[4] = v33;
      id v47 = v43;
      [v36 sessionStartWithID:v42 netCnx:v8 completion:v46];
      [(NSMutableSet *)self->_bufferedConnections removeObject:v8];
    }
    else
    {
      if (dword_1001426A0 <= 30)
      {
        if (dword_1001426A0 != -1 || _LogCategory_Initialize())
        {
          os_signpost_id_t v41 = v8;
          LogPrintF();
        }
        if (dword_1001426A0 <= 30 && (dword_1001426A0 != -1 || _LogCategory_Initialize()))
        {
          os_signpost_id_t v41 = [(NSMutableDictionary *)self->_activatedServerXPCCnxMap allKeys];
          LogPrintF();
        }
      }
      [v29 handler:v41];
      id v37 = (id)objc_claimAutoreleasedReturnValue();
      if (!v37) {
        goto LABEL_66;
      }
      long long v38 = v48;
      v48[0] = _NSConcreteStackBlock;
      v48[1] = 3221225472;
      v48[2] = sub_1000AEE98;
      v48[3] = &unk_100124BC0;
      v48[4] = v29;
      v48[5] = self;
      id v49 = v33;
      (*((void (**)(id, void, void, void *))v37 + 2))(v37, 0, 0, v48);
    }
LABEL_66:

    id v34 = 0;
    goto LABEL_67;
  }
  if (dword_1001426A0 <= 30 && (dword_1001426A0 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  RPErrorF();
  id v34 = (id)objc_claimAutoreleasedReturnValue();
LABEL_68:

LABEL_69:
  ((void (*)(void *, uint64_t))v44[2])(v44, v40);
}

- (void)_serverProximityGetDeviceIdentifiers
{
  BOOL v3 = +[NSMutableSet set];
  needsAWDLDevices = self->_needsAWDLDevices;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000AF0E4;
  v10[3] = &unk_100124820;
  id v5 = v3;
  id v11 = v5;
  [(NSMutableDictionary *)needsAWDLDevices enumerateKeysAndObjectsUsingBlock:v10];
  tcpServerConnections = self->_tcpServerConnections;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000AF160;
  v8[3] = &unk_100124BE8;
  id v9 = v5;
  id v7 = v5;
  [(NSMutableDictionary *)tcpServerConnections enumerateKeysAndObjectsUsingBlock:v8];
}

- (unsigned)_serverDirectLinkInterfaceIndex
{
  if (!CreateUsableInterfaceList())
  {
    ReleaseUsableInterfaceList();
    return 0;
  }
  if (dword_1001426A0 > 30) {
    return 0;
  }
  if (dword_1001426A0 != -1 || (unsigned int result = _LogCategory_Initialize()) != 0)
  {
    LogPrintF();
    return 0;
  }
  return result;
}

- (void)_serverRegisterForIncomingMessages
{
  if (!self->_serverIncomingMessageCLinkClient)
  {
    id v3 = objc_alloc_init((Class)RPCompanionLinkClient);
    [v3 setDispatchQueue:self->_dispatchQueue];
    serverIncomingMessageCLinkClient = self->_serverIncomingMessageCLinkClient;
    self->_serverIncomingMessageCLinkClient = (RPCompanionLinkClient *)v3;
    id v5 = v3;

    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_1000AF3E4;
    v6[3] = &unk_1001222C0;
    v6[4] = v5;
    void v6[5] = self;
    [v5 activateWithCompletion:v6];
  }
}

- (void)_serverReceivedNeedsAWDLEvent:(id)a3
{
  id v4 = a3;
  CFStringGetTypeID();
  id v5 = CFDictionaryGetTypedValue();
  if (v5)
  {
    uint64_t v6 = NSDictionaryGetNSNumber();
    unsigned int v7 = [v6 BOOLValue];

    if (dword_1001426A0 <= 30 && (dword_1001426A0 != -1 || _LogCategory_Initialize()))
    {
      id v8 = "disable";
      if (v7) {
        id v8 = "enable";
      }
      id v18 = v8;
      uint64_t v19 = v5;
      LogPrintF();
    }
    needsAWDLRequestIdentifiers = self->_needsAWDLRequestIdentifiers;
    if (v7)
    {
      if (!needsAWDLRequestIdentifiers)
      {
        uint64_t v10 = +[NSMutableSet set];
        id v11 = self->_needsAWDLRequestIdentifiers;
        self->_needsAWDLRequestIdentifiers = v10;

        needsAWDLRequestIdentifiers = self->_needsAWDLRequestIdentifiers;
      }
      -[NSMutableSet addObject:](needsAWDLRequestIdentifiers, "addObject:", v5, v18, v19);
      if (self->_needsAWDLRequestTimer) {
        goto LABEL_20;
      }
      long long v12 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)self->_dispatchQueue);
      needsAWDLRequestTimer = self->_needsAWDLRequestTimer;
      self->_needsAWDLRequestTimer = v12;
      __int16 v14 = v12;

      handler[0] = _NSConcreteStackBlock;
      handler[1] = 3221225472;
      handler[2] = sub_1000AF7D0;
      handler[3] = &unk_100121158;
      handler[4] = self;
      dispatch_source_set_event_handler(v14, handler);
      CUDispatchTimerSet();
      dispatch_activate(v14);
    }
    else
    {
      [(NSMutableSet *)needsAWDLRequestIdentifiers removeObject:v5];
      if ([(NSMutableSet *)self->_needsAWDLRequestIdentifiers count]) {
        goto LABEL_20;
      }
      id v15 = self->_needsAWDLRequestIdentifiers;
      self->_needsAWDLRequestIdentifiers = 0;

      id v16 = self->_needsAWDLRequestTimer;
      if (!v16) {
        goto LABEL_20;
      }
      __int16 v14 = v16;
      dispatch_source_cancel(v14);
      unsigned int v17 = self->_needsAWDLRequestTimer;
      self->_needsAWDLRequestTimer = 0;
    }
LABEL_20:
    [(RPRemoteDisplayDaemon *)self _update];
    goto LABEL_21;
  }
  if (dword_1001426A0 <= 90 && (dword_1001426A0 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
LABEL_21:
}

- (void)_btAddressMonitorEnsureStarted
{
  if (!self->_btAdvAddrMonitor)
  {
    if (dword_1001426A0 <= 30 && (dword_1001426A0 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    id v3 = (CUSystemMonitor *)objc_alloc_init((Class)CUSystemMonitor);
    btAdvAddrMonitor = self->_btAdvAddrMonitor;
    self->_btAdvAddrMonitor = v3;

    [(CUSystemMonitor *)self->_btAdvAddrMonitor setDispatchQueue:self->_dispatchQueue];
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_1000AF9EC;
    v7[3] = &unk_100121158;
    v7[4] = self;
    [(CUSystemMonitor *)self->_btAdvAddrMonitor setRotatingIdentifierChangedHandler:v7];
    id v5 = self->_btAdvAddrMonitor;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_1000AF9F4;
    v6[3] = &unk_100121158;
    v6[4] = self;
    [(CUSystemMonitor *)v5 activateWithCompletion:v6];
  }
}

- (void)_btAddressMonitorEnsureStopped
{
  if (self->_btAdvAddrMonitor)
  {
    if (dword_1001426A0 <= 30 && (dword_1001426A0 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    [(CUSystemMonitor *)self->_btAdvAddrMonitor invalidate];
    btAdvAddrMonitor = self->_btAdvAddrMonitor;
    self->_btAdvAddrMonitor = 0;
  }
}

- (void)_btAddressChanged
{
  id obj = [(CUSystemMonitor *)self->_btAdvAddrMonitor rotatingIdentifierData];
  if ([obj length] == (id)6
    && ([(NSData *)self->_btAdvAddrData isEqual:obj] & 1) == 0)
  {
    objc_storeStrong((id *)&self->_btAdvAddrData, obj);
    uint64_t v6 = (NSString *)[obj bytes];
    NSPrintF();
    id v3 = (NSString *)objc_claimAutoreleasedReturnValue();
    btAdvAddrStr = self->_btAdvAddrStr;
    self->_btAdvAddrStr = v3;

    if (dword_1001426A0 <= 30 && (dword_1001426A0 != -1 || _LogCategory_Initialize()))
    {
      uint64_t v6 = self->_btAdvAddrStr;
      LogPrintF();
    }
    deviceAuthTagStr = self->_deviceAuthTagStr;
    self->_deviceAuthTagStr = 0;

    [(RPRemoteDisplayDaemon *)self _update];
  }
}

- (BOOL)_deviceSupportsLaguna:(id)a3
{
  id v3 = a3;
  id v4 = [v3 model];
  int v5 = GestaltProductTypeStringToDeviceClass();

  uint64_t v6 = +[RPCloudDaemon sharedCloudDaemon];
  unsigned int v7 = [v6 idsDeviceMap];
  id v8 = [v3 idsIdentifier];
  id v9 = [v7 objectForKeyedSubscript:v8];

  if (v9) {
    [v9 operatingSystemVersion];
  }
  if ((v5 & 0xFFFFFFFD) == 1)
  {
    if (v5 == 3)
    {
      uint64_t v10 = [v3 model];
      if ((int)sub_10000DE10(v10) > 7)
      {
        BOOL v12 = 1;
      }
      else
      {
        id v11 = [v3 model];
        BOOL v12 = (int)sub_10000DEBC(v11) > 12;
      }
    }
    else
    {
      BOOL v12 = 1;
    }
  }
  else
  {
    BOOL v12 = 0;
  }

  return v12;
}

- (id)_findMatchingDeviceWithIdentifier:(id)a3
{
  id v4 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  int v5 = [(NSMutableDictionary *)self->_discoveredDevices allValues];
  id v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
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
        if ([v9 compareWithDeviceIdentifier:v4])
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (RPRemoteDisplayDevice)dedicatedDevice
{
  if (!_os_feature_enabled_impl())
  {
    id v9 = 0;
    goto LABEL_17;
  }
  id v2 = objc_alloc_init((Class)CUKeychainItem);
  [v2 setAccessGroup:@"com.apple.rapport"];
  [v2 setSyncType:1];
  [v2 setType:@"RPIdentity-PairedDevice"];
  [v2 setIdentifier:@"RPRemoteDisplayDevice-Dedicated"];
  id v3 = objc_alloc_init((Class)CUKeychainManager);
  id v11 = 0;
  id v4 = [v3 copyItemMatchingItem:v2 flags:0 error:&v11];
  id v5 = v11;
  id v6 = v5;
  if (!v4)
  {
    if ([v5 code] == (id)-25300
      || dword_1001426A0 > 90
      || dword_1001426A0 == -1 && !_LogCategory_Initialize())
    {
      goto LABEL_15;
    }
LABEL_11:
    LogPrintF();
LABEL_15:
    id v9 = 0;
    goto LABEL_16;
  }
  id v7 = objc_alloc((Class)RPRemoteDisplayDevice);
  id v8 = [v4 metadata];
  id v9 = [v7 initWithKeychainDictionaryRepresentation:v8];

  if (!v9)
  {
    if (dword_1001426A0 > 90 || dword_1001426A0 == -1 && !_LogCategory_Initialize()) {
      goto LABEL_15;
    }
    goto LABEL_11;
  }
LABEL_16:

LABEL_17:

  return (RPRemoteDisplayDevice *)v9;
}

- (void)saveDedicatedDevice:(id)a3
{
  id v4 = a3;
  if (_os_feature_enabled_impl())
  {
    id v5 = [(RPRemoteDisplayDaemon *)self dedicatedDevice];
    id v6 = v5;
    if (v5 == v4 || ([v5 isEqualToDevice:v4] & 1) != 0)
    {
LABEL_38:

      goto LABEL_39;
    }
    id v7 = objc_alloc_init((Class)CUKeychainManager);
    id v8 = objc_alloc_init((Class)CUKeychainItem);
    [v8 setAccessGroup:@"com.apple.rapport"];
    BOOL v24 = v7;
    id v25 = v6;
    if (v4)
    {
      [v8 setAccessibleType:7];
      [v8 setInvisible:1];
      [v8 setSyncType:1];
      [v8 setType:@"RPIdentity-PairedDevice"];
      [v8 setIdentifier:@"RPRemoteDisplayDevice-Dedicated"];
      id v9 = [v4 keychainDictionaryRepresentation];
      [v8 setMetadata:v9];

      id v31 = 0;
      [v7 addOrUpdateOrReAddItem:v8 logCategory:&dword_1001426A0 logLabel:@"DedicatedDevice" error:&v31];
      id v10 = v31;
      if (v10)
      {
        if (dword_1001426A0 > 90 || dword_1001426A0 == -1 && !_LogCategory_Initialize()) {
          goto LABEL_20;
        }
        id v22 = v8;
        id v23 = v10;
      }
      else if (dword_1001426A0 > 30 || dword_1001426A0 == -1 && !_LogCategory_Initialize())
      {
        goto LABEL_20;
      }
    }
    else
    {
      [v8 setSyncType:1];
      [v8 setType:@"RPIdentity-PairedDevice"];
      [v8 setIdentifier:@"RPRemoteDisplayDevice-Dedicated"];
      id v30 = 0;
      [v7 removeItemMatchingItem:v8 error:&v30];
      id v10 = v30;
      if (v10)
      {
        if (dword_1001426A0 > 90 || dword_1001426A0 == -1 && !_LogCategory_Initialize()) {
          goto LABEL_20;
        }
        id v22 = v8;
        id v23 = v10;
      }
      else if (dword_1001426A0 > 30 || dword_1001426A0 == -1 && !_LogCategory_Initialize())
      {
        goto LABEL_20;
      }
    }
    LogPrintF();
LABEL_20:

    if (dword_1001426A0 <= 30 && (dword_1001426A0 != -1 || _LogCategory_Initialize()))
    {
      id v22 = v4;
      LogPrintF();
    }
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v11 = self->_xpcConnections;
    id v12 = [(NSMutableSet *)v11 countByEnumeratingWithState:&v26 objects:v32 count:16];
    if (v12)
    {
      id v13 = v12;
      uint64_t v14 = *(void *)v27;
      do
      {
        for (i = 0; i != v13; i = (char *)i + 1)
        {
          if (*(void *)v27 != v14) {
            objc_enumerationMutation(v11);
          }
          id v16 = *(void **)(*((void *)&v26 + 1) + 8 * i);
          unsigned int v17 = [v16 activatedDiscovery:v22, v23];

          if (v17)
          {
            id v18 = [v16 xpcCnx];
            uint64_t v19 = [v18 valueForEntitlement:@"com.apple.RemoteDisplay.Dedicated"];

            if (v19)
            {
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                if ([v19 BOOLValue])
                {
                  uint64_t v20 = [v16 xpcCnx];
                  long long v21 = [v20 remoteObjectProxy];
                  [v21 remoteDisplayDedicatedDeviceChanged:v4];
                }
              }
            }
          }
        }
        id v13 = [(NSMutableSet *)v11 countByEnumeratingWithState:&v26 objects:v32 count:16];
      }
      while (v13);
    }

    id v6 = v25;
    goto LABEL_38;
  }
LABEL_39:
}

- (void)_localDeviceUpdate
{
  unsigned int v3 = [(RPCompanionLinkDevice *)self->_localDeviceInfo changed];
  localDeviceInfo = self->_localDeviceInfo;
  if (!localDeviceInfo)
  {
    id v5 = (RPCompanionLinkDevice *)objc_alloc_init((Class)RPCompanionLinkDevice);
    id v6 = self->_localDeviceInfo;
    self->_localDeviceInfo = v5;

    [(RPCompanionLinkDevice *)self->_localDeviceInfo setDaemon:1];
    [(RPCompanionLinkDevice *)self->_localDeviceInfo setFlags:[(RPCompanionLinkDevice *)self->_localDeviceInfo flags] | 0x48];
    localDeviceInfo = self->_localDeviceInfo;
  }
  id v18 = [(RPCompanionLinkDevice *)localDeviceInfo identifier];
  if (!v18)
  {
    id v7 = +[RPCloudDaemon sharedCloudDaemon];
    id v8 = [v7 idsDeviceIDSelf];
    [(RPCompanionLinkDevice *)self->_localDeviceInfo setIdentifier:v8];

    unsigned int v3 = 1;
  }
  id v9 = [(RPCompanionLinkDevice *)self->_localDeviceInfo model];

  if (!v9)
  {
    id v10 = (void *)GestaltCopyAnswer();
    [(RPCompanionLinkDevice *)self->_localDeviceInfo setModel:v10];

    unsigned int v3 = 1;
  }
  btAdvAddrStr = self->_btAdvAddrStr;
  if (!btAdvAddrStr) {
    goto LABEL_13;
  }
  id v12 = [(RPCompanionLinkDevice *)self->_localDeviceInfo publicIdentifier];
  id v13 = btAdvAddrStr;
  uint64_t v14 = v12;
  if (v13 == v14)
  {

    goto LABEL_13;
  }
  id v15 = v14;
  if (v14)
  {
    unsigned __int8 v16 = [(NSString *)v13 isEqual:v14];

    if ((v16 & 1) == 0) {
      goto LABEL_16;
    }
LABEL_13:
    if (!v3) {
      goto LABEL_21;
    }
    goto LABEL_17;
  }

LABEL_16:
  [(RPCompanionLinkDevice *)self->_localDeviceInfo setPublicIdentifier:self->_btAdvAddrStr];
LABEL_17:
  if (dword_1001426A0 <= 30 && (dword_1001426A0 != -1 || _LogCategory_Initialize()))
  {
    unsigned int v17 = CUDescriptionWithLevel();
    LogPrintF();
  }
LABEL_21:
  -[RPCompanionLinkDevice setChanged:](self->_localDeviceInfo, "setChanged:", 0, v17);
}

- (void)_startPairingServerWithPassword:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  uint64_t v28 = 0;
  long long v29 = &v28;
  uint64_t v30 = 0x3032000000;
  id v31 = sub_1000A2B54;
  BOOL v32 = sub_1000A2B64;
  id v33 = 0;
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_1000B0A40;
  v23[3] = &unk_100124C10;
  id v24 = 0;
  id v25 = self;
  long long v27 = &v28;
  id v8 = v7;
  id v26 = v8;
  id v9 = objc_retainBlock(v23);
  if (GestaltGetDeviceClass() == 4 || self->_prefAllowPairingServer)
  {
    if (dword_1001426A0 <= 30 && (dword_1001426A0 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    id v11 = +[NSUUID UUID];
    id v12 = [v11 UUIDString];
    awdlPairingID = self->_awdlPairingID;
    self->_awdlPairingID = v12;

    uint64_t v14 = +[RPIdentityDaemon sharedIdentityDaemon];
    id v15 = [v14 sessionPairingIdentifier];

    unsigned __int8 v16 = [v15 UUIDString];
    unsigned int v17 = +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v16, self->_awdlPairingID, v6, 0);

    id v18 = +[NSArray arrayWithObjects:@"_pubID", @"_pi", @"_pinC", 0];
    uint64_t v19 = +[NSDictionary dictionaryWithObjects:v17 forKeys:v18];
    id v22 = 0;
    uint64_t v20 = +[NSJSONSerialization dataWithJSONObject:v19 options:4 error:&v22];
    id v10 = v22;
    long long v21 = (void *)v29[5];
    v29[5] = v20;

    [(RPRemoteDisplayDaemon *)self _update];
  }
  else
  {
    RPErrorF();
    id v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  ((void (*)(void *))v9[2])(v9);

  _Block_object_dispose(&v28, 8);
}

- (void)_stopPairingServer
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (dword_1001426A0 <= 30 && (dword_1001426A0 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  awdlPairingID = self->_awdlPairingID;
  self->_awdlPairingID = 0;

  [(RPRemoteDisplayDaemon *)self _update];
}

- (id)_acquireRBSAssertionForEntry:(id)a3 error:(id *)a4
{
  id v5 = a3;
  uint64_t v6 = [v5 angelJobLabel];
  if (v6
    && (id v7 = (void *)v6,
        [v5 angelAssertionName],
        id v8 = objc_claimAutoreleasedReturnValue(),
        v8,
        v7,
        v8))
  {
    id v9 = [v5 angelJobLabel];
    id v10 = +[RBSProcessIdentity identityForAngelJobLabel:v9];
    id v11 = +[RBSTarget targetWithProcessIdentity:v10];

    id v12 = [v5 angelAssertionName];
    id v13 = +[RBSDomainAttribute attributeWithDomain:@"com.apple.rapportd" name:v12];

    id v14 = objc_alloc((Class)RBSAssertion);
    id v23 = v13;
    id v15 = +[NSArray arrayWithObjects:&v23 count:1];
    id v16 = [v14 initWithExplanation:@"Rapport remote display" target:v11 attributes:v15];

    id v22 = 0;
    unsigned __int8 v17 = [v16 acquireWithError:&v22];
    id v18 = v22;
    if (v17)
    {
      id v19 = v16;
    }
    else
    {
      if (dword_1001426A0 <= 90 && (dword_1001426A0 != -1 || _LogCategory_Initialize()))
      {
        long long v21 = [v5 angelJobLabel];
        LogPrintF();
      }
      RPErrorF();
      id v19 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    id v19 = 0;
  }

  return v19;
}

- (void)_scheduleCameraCapabilitiesRequest:(id)a3 interval:(unint64_t)a4
{
  id v5 = a3;
  uint64_t v6 = [v5 cameraCapabilitiesRefetchTimer];

  if (!v6)
  {
    dispatch_source_t v7 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)self->_dispatchQueue);
    [v5 setCameraCapabilitiesRefetchTimer:v7];

    id v8 = [v5 cameraCapabilitiesRefetchTimer];
    id v12 = _NSConcreteStackBlock;
    uint64_t v13 = 3221225472;
    id v14 = sub_1000B0F5C;
    id v15 = &unk_1001219D0;
    id v9 = v5;
    id v16 = v9;
    unsigned __int8 v17 = self;
    dispatch_source_set_event_handler(v8, &v12);

    id v10 = [v9 cameraCapabilitiesRefetchTimer:v12, v13, v14, v15];
    CUDispatchTimerSet();

    id v11 = [v9 cameraCapabilitiesRefetchTimer];
    dispatch_activate(v11);
  }
}

- (void)_receivedCameraCapabilitiesMessage:(id)a3 fromDevice:(id)a4 isFirstUpdate:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  int v34 = 0;
  CFDictionaryGetTypeID();
  uint64_t v10 = CFDictionaryGetTypedValue();
  uint64_t v28 = v8;
  if (v10)
  {
    id v11 = (void *)v10;
    if (dword_1001426A0 <= 30 && (dword_1001426A0 != -1 || _LogCategory_Initialize()))
    {
      id v12 = [v9 identifier];
      id v26 = v12;
      LogPrintF();
LABEL_8:
    }
  }
  else
  {
    if (dword_1001426A0 <= 50 && (dword_1001426A0 != -1 || _LogCategory_Initialize()))
    {
      id v12 = [v9 identifier];
      id v26 = v12;
      LogPrintF();
      id v11 = &__NSDictionary0__struct;
      goto LABEL_8;
    }
    id v11 = &__NSDictionary0__struct;
  }
  long long v29 = v11;
  [v9 setCameraCapabilities:v11, v26];
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  uint64_t v13 = self;
  id v14 = self->_xpcConnections;
  id v15 = [(NSMutableSet *)v14 countByEnumeratingWithState:&v30 objects:v35 count:16];
  if (v15)
  {
    id v16 = v15;
    uint64_t v17 = *(void *)v31;
    do
    {
      for (i = 0; i != v16; i = (char *)i + 1)
      {
        if (*(void *)v31 != v17) {
          objc_enumerationMutation(v14);
        }
        id v19 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        uint64_t v20 = [v19 activatedDiscovery];
        unsigned int v21 = [v20 shouldReportDevice:v9];

        if (v21)
        {
          id v22 = [v19 xpcCnx];
          id v23 = [v22 remoteObjectProxy];
          [v23 remoteDisplayChangedDevice:v9 changes:2];
        }
      }
      id v16 = [(NSMutableSet *)v14 countByEnumeratingWithState:&v30 objects:v35 count:16];
    }
    while (v16);
  }

  if (dword_1001426A0 <= 30 && (dword_1001426A0 != -1 || _LogCategory_Initialize()))
  {
    long long v27 = [v9 identifier];
    LogPrintF();
  }
  if (v5 && ((unint64_t)[v9 statusFlags] & 0x2000000000) != 0)
  {
    if (dword_1001426A0 <= 30 && (dword_1001426A0 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    deviceSessionPaired = v13->_deviceSessionPaired;
    v13->_deviceSessionPaired = 0;

    id v25 = [v9 identifier];
    [(RPRemoteDisplayDaemon *)v13 _changeDiscoverySessionStateForDevice:v25 startReason:1];
  }
}

- (void)_receivedCameraExitEvent:(id)a3 from:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  CFStringGetTypeID();
  id v8 = CFDictionaryGetTypedValue();

  if (![v8 length])
  {
    if (dword_1001426A0 > 50 || dword_1001426A0 == -1 && !_LogCategory_Initialize()) {
      goto LABEL_28;
    }
LABEL_25:
    LogPrintF();
    goto LABEL_28;
  }
  if (dword_1001426A0 <= 30 && (dword_1001426A0 != -1 || _LogCategory_Initialize()))
  {
    id v12 = v8;
    id v14 = v6;
    LogPrintF();
  }
  if (objc_msgSend(v8, "isEqualToString:", @"User disconnect", v12, v14))
  {
    id v9 = [(RPRemoteDisplayDaemon *)self dedicatedDevice];
    uint64_t v10 = [v9 idsDeviceIdentifier];
    unsigned int v11 = [v6 isEqualToString:v10];

    if (v11)
    {
      if (dword_1001426A0 <= 30 && (dword_1001426A0 != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
        -[RPRemoteDisplayDaemon saveDedicatedDevice:](self, "saveDedicatedDevice:", 0, v8, v6);
      }
      else
      {
        -[RPRemoteDisplayDaemon saveDedicatedDevice:](self, "saveDedicatedDevice:", 0, v13, v15);
      }
    }
  }
  if (![v6 isEqualToString:self->_deviceConfirmedIdentifier])
  {
    if (dword_1001426A0 > 90 || dword_1001426A0 == -1 && !_LogCategory_Initialize()) {
      goto LABEL_28;
    }
    goto LABEL_25;
  }
  if (dword_1001426A0 <= 30 && (dword_1001426A0 != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
    -[RPRemoteDisplayDaemon _changeDiscoverySessionStateForDevice:startReason:](self, "_changeDiscoverySessionStateForDevice:startReason:", 0, 0, v6);
  }
  else
  {
    -[RPRemoteDisplayDaemon _changeDiscoverySessionStateForDevice:startReason:](self, "_changeDiscoverySessionStateForDevice:startReason:", 0, 0, v13);
  }
LABEL_28:
}

- (void)_registerForIncomingMessages
{
  if (!self->_clientIncomingMessageCLinkClient)
  {
    unsigned int v3 = (RPCompanionLinkClient *)objc_alloc_init((Class)RPCompanionLinkClient);
    clientIncomingMessageCLinkClient = self->_clientIncomingMessageCLinkClient;
    self->_clientIncomingMessageCLinkClient = v3;
    BOOL v5 = v3;

    [(RPCompanionLinkClient *)v5 setDispatchQueue:self->_dispatchQueue];
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_1000B16AC;
    v6[3] = &unk_1001222C0;
    v6[4] = v5;
    void v6[5] = self;
    [(RPCompanionLinkClient *)v5 activateWithCompletion:v6];
  }
}

- (void)_requestCameraCapabilitiesForDevice:(id)a3
{
  id v4 = a3;
  int DeviceClass = GestaltGetDeviceClass();
  int v6 = DeviceClass;
  if (DeviceClass == 100 || DeviceClass == 4)
  {
    id v7 = [v4 cameraCapabilities];
    if (!v7 && ![v4 cameraCapabilityRequestIsActive])
    {
      id v8 = [v4 cameraCapabilitiesRefetchTimer];

      if (v8) {
        goto LABEL_6;
      }
      id v7 = [v4 idsDeviceIdentifier];
      if (v7)
      {
        id v9 = +[RPCloudDaemon sharedCloudDaemon];
        uint64_t v10 = [v9 idsDeviceMap];
        unsigned int v11 = [v10 objectForKeyedSubscript:v7];

        if (v11 || ((unint64_t)[v4 statusFlags] & 0x3000000000) != 0)
        {
          id v12 = [v11 modelIdentifier];
          uint64_t v13 = v12;
          if (v12)
          {
            id v14 = v12;
          }
          else
          {
            id v14 = [v4 model];
          }
          uint64_t v15 = v14;

          uint64_t v27 = 0;
          uint64_t v28 = 0;
          uint64_t v29 = 0;
          if (v11) {
            [v11 operatingSystemVersion];
          }
          int v16 = GestaltProductTypeStringToDeviceClass();
          if ((v16 | 2) == 3)
          {
            BOOL v17 = v6 == 100 && v16 == 1;
            BOOL v18 = !v17;
            if (v6 == 4 || !v18)
            {
              if (dword_1001426A0 <= 30 && (dword_1001426A0 != -1 || _LogCategory_Initialize()))
              {
                id v22 = v4;
                LogPrintF();
              }
              id v19 = [v4 idsDeviceIdentifier:v22];
              [v4 setCameraCapabilityRequestIsActive:1];
              id v20 = objc_alloc_init((Class)RPCompanionLinkClient);
              id v21 = objc_alloc_init((Class)RPCompanionLinkDevice);
              [v21 setIdentifier:v19];
              [v20 setDispatchQueue:self->_dispatchQueue];
              [v20 setDestinationDevice:v21];
              [v20 setControlFlags:6];
              v23[0] = _NSConcreteStackBlock;
              v23[1] = 3221225472;
              v23[2] = sub_1000B203C;
              v23[3] = &unk_100124CB0;
              void v23[4] = v20;
              id v24 = v4;
              id v25 = self;
              id v26 = v19;
              [v20 activateWithCompletion:v23];
            }
          }
        }
        else if (dword_1001426A0 <= 90 && (dword_1001426A0 != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
      }
      else if (dword_1001426A0 <= 90 && (dword_1001426A0 != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
    }
  }
LABEL_6:
}

- (void)_sendCameraCapabilitiesUpdateEventForDevice:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  BOOL v5 = [v4 uniqueIDOverride];
  int v6 = [v4 modelIdentifier];
  int v7 = GestaltProductTypeStringToDeviceClass();

  uint64_t v21 = 0;
  uint64_t v22 = 0;
  uint64_t v23 = 0;
  if (v4) {
    [v4 operatingSystemVersion];
  }
  if (v5 && (v7 == 100 || v7 == 4) && DeviceOSVersionAtOrLater())
  {
    if (dword_1001426A0 <= 30 && (dword_1001426A0 != -1 || _LogCategory_Initialize()))
    {
      id v15 = v4;
      LogPrintF();
    }
    uint64_t v8 = -[NSMutableDictionary objectForKeyedSubscript:](self->_cameraCapabilitiesUpdateSendMap, "objectForKeyedSubscript:", v5, v15);
    id v9 = (id)v8;
    if (!v8)
    {
      id v9 = objc_alloc_init((Class)RPCompanionLinkClient);
      [v9 setDispatchQueue:self->_dispatchQueue];
      [v9 setControlFlags:6];
      cameraCapabilitiesUpdateSendMap = self->_cameraCapabilitiesUpdateSendMap;
      if (!cameraCapabilitiesUpdateSendMap)
      {
        unsigned int v11 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
        id v12 = self->_cameraCapabilitiesUpdateSendMap;
        self->_cameraCapabilitiesUpdateSendMap = v11;

        cameraCapabilitiesUpdateSendMap = self->_cameraCapabilitiesUpdateSendMap;
      }
      [(NSMutableDictionary *)cameraCapabilitiesUpdateSendMap setObject:v9 forKeyedSubscript:v5];
    }
    id v13 = [v9 destinationDevice];
    if (!v13)
    {
      id v13 = objc_alloc_init((Class)RPCompanionLinkDevice);
      [v13 setIdentifier:v5];
      [v9 setDestinationDevice:v13];
    }
    if (!v8)
    {
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_1000B2808;
      v17[3] = &unk_100124CD8;
      id v18 = v9;
      id v19 = self;
      id v20 = v5;
      [v18 activateWithCompletion:v17];
    }
    ++self->_cameraCapabilitiesUpdatesOutstanding;
    id v14 = +[NSDictionary dictionaryWithObject:self->_cameraCapabilities forKey:@"_cCap"];
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_1000B28CC;
    v16[3] = &unk_1001222C0;
    v16[4] = self;
    void v16[5] = v5;
    [v9 sendEventID:@"_camCapUpdate" event:v14 options:0 completion:v16];
  }
}

- (void)_clearCameraCapabilitiesUpdateCache
{
  unsigned int v3 = [(NSMutableDictionary *)self->_cameraCapabilitiesUpdateSendMap allValues];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      int v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * (void)v7) invalidate];
        int v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }
  [(NSMutableDictionary *)self->_cameraCapabilitiesUpdateSendMap removeAllObjects];
  cameraCapabilitiesUpdateSendMap = self->_cameraCapabilitiesUpdateSendMap;
  self->_cameraCapabilitiesUpdateSendMap = 0;
}

- (void)_cameraCapabilitiesChanged:(id)a3
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000B2BB0;
  block[3] = &unk_100121158;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_updateCameraCapabilities
{
  unsigned int v3 = +[AVCaptureDevice continuityCaptureCameraCapabilities];
  if (!v3)
  {
    if (dword_1001426A0 <= 50 && (dword_1001426A0 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    unsigned int v3 = (NSDictionary *)&__NSDictionary0__struct;
  }
  if (off_100142800[0]())
  {
    id v4 = [(RPRemoteDisplayDaemon *)self dedicatedDevice];

    if (v4)
    {
      if (dword_1001426A0 <= 30 && (dword_1001426A0 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
      [(RPRemoteDisplayDaemon *)self saveDedicatedDevice:0];
    }
  }
  cameraCapabilities = self->_cameraCapabilities;
  self->_cameraCapabilities = v3;
}

- (void)_registerForCameraCapabilitiesRequest
{
  if (!self->_cameraCapabilityNotificationRegistered)
  {
    if (dword_1001426A0 <= 30 && (dword_1001426A0 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    unsigned int v3 = +[NSNotificationCenter defaultCenter];
    [v3 addObserver:self selector:"_cameraCapabilitiesChanged:" name:AVCaptureDeviceContinuityCaptureCameraCapabilitiesChangedNotification object:0];
    self->_cameraCapabilityNotificationRegistered = 1;
  }
  if (!self->_cameraCapabilities) {
    [(RPRemoteDisplayDaemon *)self _updateCameraCapabilities];
  }
  if (!self->_clinkClient)
  {
    id v4 = objc_alloc_init((Class)RPCompanionLinkClient);
    objc_storeStrong((id *)&self->_clinkClient, v4);
    [v4 setDispatchQueue:self->_dispatchQueue];
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_1000B30F4;
    v5[3] = &unk_1001222C0;
    void v5[4] = v4;
    v5[5] = self;
    [v4 activateWithCompletion:v5];
    if (dword_1001426A0 <= 30 && (dword_1001426A0 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
  }
}

- (void)_postNotificationForWombatActivity:(unsigned int)a3
{
  if (dword_100142728 == -1) {
    notify_register_check("com.apple.rapport.wombat-activity", &dword_100142728);
  }
  if (dword_1001426A0 <= 30 && (dword_1001426A0 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  notify_set_state(dword_100142728, a3);

  notify_post("com.apple.rapport.wombat-activity");
}

- (void)_registerForWombatStateNotifications
{
  if (self->_wombatStateReadyToken == -1)
  {
    if (dword_1001426A0 <= 20 && (dword_1001426A0 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    dispatchQueue = self->_dispatchQueue;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_1000B37DC;
    handler[3] = &unk_100121630;
    handler[4] = self;
    notify_register_dispatch("com.apple.sharing.wombat-state", &self->_wombatStateReadyToken, dispatchQueue, handler);
    int wombatStateReadyToken = self->_wombatStateReadyToken;
    uint64_t state64 = 0;
    notify_get_state(wombatStateReadyToken, &state64);
    uint64_t wombatState = state64;
    self->_uint64_t wombatState = state64;
    if (dword_1001426A0 <= 30)
    {
      if (dword_1001426A0 != -1 || (int v7 = _LogCategory_Initialize(), wombatState = self->_wombatState, v7))
      {
        if (wombatState > 3) {
          uint64_t v6 = "?";
        }
        else {
          uint64_t v6 = (&off_100124F58)[(int)wombatState];
        }
        uint64_t v8 = v6;
        uint64_t v9 = wombatState;
        LogPrintF();
        uint64_t wombatState = self->_wombatState;
      }
    }
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_1000B39A0;
    v10[3] = &unk_100124A98;
    void v10[4] = self;
    -[RPRemoteDisplayDaemon _bluetoothUseCaseFromWombatState:resultBlock:](self, "_bluetoothUseCaseFromWombatState:resultBlock:", wombatState, v10, v8, v9);
  }
  [(RPRemoteDisplayDaemon *)self _postNotificationForWombatActivity:5];
}

- (void)_unregisterWombatStateNotifications
{
  if (self->_wombatStateReadyToken != -1)
  {
    if (dword_1001426A0 <= 20 && (dword_1001426A0 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    notify_cancel(self->_wombatStateReadyToken);
    self->_int wombatStateReadyToken = -1;
  }
}

- (BOOL)_onenessEnabled
{
  if (GestaltGetDeviceClass() != 1) {
    return 0;
  }
  authenticationManager = self->_authenticationManager;
  if (!authenticationManager)
  {
    id v4 = (SFAuthenticationManager *)[objc_alloc(off_100142730()) initWithQueue:self->_dispatchQueue];
    id v5 = self->_authenticationManager;
    self->_authenticationManager = v4;

    [(RPRemoteDisplayDaemon *)self _startObservingOnenessEnabledState];
    authenticationManager = self->_authenticationManager;
  }
  unsigned __int8 v6 = [(SFAuthenticationManager *)authenticationManager isEnabledForType:5];
  if (dword_1001426A0 <= 30 && (dword_1001426A0 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  return v6;
}

- (void)_startObservingOnenessEnabledState
{
  if (self->_authenticationManager)
  {
    if (dword_1001426A0 <= 20 && (dword_1001426A0 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    authenticationManager = self->_authenticationManager;
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472;
    v4[2] = sub_1000B3C88;
    v4[3] = &unk_100121158;
    v4[4] = self;
    [(SFAuthenticationManager *)authenticationManager startObservingForAuthenticationStateChanges:v4 queue:self->_dispatchQueue];
  }
}

- (void)_stopObservingOnenessEnabledState
{
  if (self->_authenticationManager)
  {
    if (dword_1001426A0 <= 20 && (dword_1001426A0 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    [(SFAuthenticationManager *)self->_authenticationManager stopObservingForAuthenticationStateChanges];
    uint64_t wombatState = self->_wombatState;
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472;
    v4[2] = sub_1000B3ECC;
    v4[3] = &unk_100124A98;
    v4[4] = self;
    [(RPRemoteDisplayDaemon *)self _bluetoothUseCaseFromWombatState:wombatState resultBlock:v4];
  }
}

- (BOOL)_needToHoldPowerAssertion
{
  if (GestaltGetDeviceClass() == 1 || GestaltGetDeviceClass() == 3)
  {
    unsigned int v3 = [(RPNearbyActionV2Discovery *)self->_bleNearbyActionV2Discovery actionV2Devices];
    id v4 = [v3 count];

    if (v4 || [(NSMutableSet *)self->_needsAWDLRequestIdentifiers count])
    {
      LOBYTE(v5) = 1;
    }
    else
    {
      long long v13 = 0u;
      long long v14 = 0u;
      long long v11 = 0u;
      long long v12 = 0u;
      unsigned __int8 v6 = [(NSMutableDictionary *)self->_tcpServerConnections allValues];
      id v5 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v5)
      {
        int v7 = 0;
        uint64_t v8 = *(void *)v12;
        do
        {
          for (i = 0; i != v5; i = (char *)i + 1)
          {
            if (*(void *)v12 != v8) {
              objc_enumerationMutation(v6);
            }
            if ([*(id *)(*((void *)&v11 + 1) + 8 * i) linkType] == 4) {
              ++v7;
            }
          }
          id v5 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
        }
        while (v5);
        LOBYTE(v5) = v7 != 0;
      }
    }
  }
  else
  {
    LOBYTE(v5) = 0;
  }
  return (char)v5;
}

- (void)_powerAssertionEnsureHeld
{
  if (!self->_powerAssertion)
  {
    v4[0] = @"AssertType";
    v4[1] = @"AssertLevel";
    v5[0] = @"PreventUserIdleSystemSleep";
    v5[1] = &off_10012B318;
    v4[2] = @"AssertName";
    v4[3] = @"TimeoutSeconds";
    v5[2] = @"com.apple.rapport.RPRemoteDisplayDaemon.Wombat";
    v5[3] = &off_10012B330;
    v4[4] = @"TimeoutAction";
    void v5[4] = @"TimeoutActionTurnOff";
    p_powerAssertion = &self->_powerAssertion;
    CFDictionaryRef v3 = +[NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:5];
    if (IOPMAssertionCreateWithProperties(v3, p_powerAssertion) || !*p_powerAssertion)
    {
      if (dword_1001426A0 <= 30 && (dword_1001426A0 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
      unsigned int *p_powerAssertion = 0;
    }
    else if (dword_1001426A0 <= 30 && (dword_1001426A0 != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
}

- (void)_powerAssertionEnsureReleased
{
  IOPMAssertionID powerAssertion = self->_powerAssertion;
  if (powerAssertion)
  {
    IOPMAssertionRelease(powerAssertion);
    self->_IOPMAssertionID powerAssertion = 0;
    if (dword_1001426A0 <= 30 && (dword_1001426A0 != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  unsigned __int8 v6 = [[RPRemoteDisplayXPCConnection alloc] initWithDaemon:self xpcCnx:v5];
  [(RPRemoteDisplayXPCConnection *)v6 setDispatchQueue:self->_dispatchQueue];
  ++self->_xpcLastID;
  -[RPRemoteDisplayXPCConnection setXpcID:](v6, "setXpcID:");
  xpcConnections = self->_xpcConnections;
  if (!xpcConnections)
  {
    uint64_t v8 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    uint64_t v9 = self->_xpcConnections;
    self->_xpcConnections = v8;

    xpcConnections = self->_xpcConnections;
  }
  [(NSMutableSet *)xpcConnections addObject:v6];
  [v5 _setQueue:self->_dispatchQueue];
  long long v10 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___RPRemoteDisplayXPCDaemonInterface];
  [v5 setExportedInterface:v10];

  [v5 setExportedObject:v6];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1000B44E8;
  v14[3] = &unk_1001219D0;
  v14[4] = self;
  long long v11 = v6;
  id v15 = v11;
  [v5 setInvalidationHandler:v14];
  long long v12 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___RPRemoteDisplayXPCClientInterface];
  [v5 setRemoteObjectInterface:v12];

  [v5 resume];
  if (dword_1001426A0 <= 20 && (dword_1001426A0 != -1 || _LogCategory_Initialize()))
  {
    [v5 processIdentifier];
    LogPrintF();
  }

  return 1;
}

- (void)_handleServerActivation:(id)a3
{
  id v10 = a3;
  id v4 = [v10 activatedServer];
  uint64_t v5 = [v4 serviceType];

  activatedServerXPCCnxMap = self->_activatedServerXPCCnxMap;
  if (!activatedServerXPCCnxMap)
  {
    int v7 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    uint64_t v8 = self->_activatedServerXPCCnxMap;
    self->_activatedServerXPCCnxMap = v7;

    activatedServerXPCCnxMap = self->_activatedServerXPCCnxMap;
  }
  if (v5) {
    uint64_t v9 = (__CFString *)v5;
  }
  else {
    uint64_t v9 = @"_rdlink._tcp";
  }
  [(NSMutableDictionary *)activatedServerXPCCnxMap setObject:v10 forKeyedSubscript:v9];
}

- (void)_deliverBufferedConnectionsToServer:(id)a3
{
  id v23 = a3;
  id v4 = [v23 activatedServer];
  uint64_t v5 = [v4 serviceType];

  id v6 = [(NSMutableSet *)self->_bufferedConnections copy];
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v7 = v6;
  id v8 = [v7 countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (!v8) {
    goto LABEL_22;
  }
  uint64_t v9 = *(void *)v30;
  while (2)
  {
    for (i = 0; i != v8; i = (char *)i + 1)
    {
      if (*(void *)v30 != v9) {
        objc_enumerationMutation(v7);
      }
      long long v11 = *(void **)(*((void *)&v29 + 1) + 8 * i);
      id v12 = [v11 serviceType];
      id v13 = v5;
      long long v14 = v13;
      if (v12 == v13)
      {

LABEL_15:
        uint64_t v25 = 0;
        id v26 = &v25;
        uint64_t v27 = 0x2020000000;
        int v28 = 0;
        tcpServerConnections = self->_tcpServerConnections;
        v24[0] = _NSConcreteStackBlock;
        v24[1] = 3221225472;
        v24[2] = sub_1000B4888;
        v24[3] = &unk_100124D00;
        v24[4] = v11;
        void v24[5] = &v25;
        [(NSMutableDictionary *)tcpServerConnections enumerateKeysAndObjectsUsingBlock:v24];
        BOOL v17 = v26;
        uint64_t v18 = *((unsigned int *)v26 + 6);
        if (!v18)
        {
LABEL_21:
          _Block_object_dispose(&v25, 8);
          goto LABEL_22;
        }
        if (dword_1001426A0 <= 30)
        {
          if (dword_1001426A0 == -1)
          {
            int v19 = _LogCategory_Initialize();
            BOOL v17 = v26;
            if (!v19) {
              goto LABEL_20;
            }
            uint64_t v18 = *((unsigned int *)v26 + 6);
          }
          uint64_t v21 = v11;
          uint64_t v22 = v18;
          LogPrintF();
          BOOL v17 = v26;
        }
LABEL_20:
        id v20 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", *((unsigned int *)v17 + 6), v21, v22);
        [(RPRemoteDisplayDaemon *)self _serverHandleSessionStartWithID:v20 netCnx:v11 completion:0];

        goto LABEL_21;
      }
      if ((v5 != 0) != (v12 == 0))
      {
        unsigned int v15 = [v12 isEqual:v13];

        if (v15) {
          goto LABEL_15;
        }
      }
      else
      {
      }
    }
    id v8 = [v7 countByEnumeratingWithState:&v29 objects:v33 count:16];
    if (v8) {
      continue;
    }
    break;
  }
LABEL_22:
}

- (void)_xpcConnectionInvalidated:(id)a3
{
  id v7 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  id v4 = [v7 activatedServer];
  uint64_t v5 = [v4 serviceType];

  if (v5) {
    id v6 = (__CFString *)v5;
  }
  else {
    id v6 = @"_rdlink._tcp";
  }
  [v7 connectionInvalidated];
  [(NSMutableDictionary *)self->_activatedServerXPCCnxMap setObject:0 forKeyedSubscript:v6];
  [(NSMutableSet *)self->_xpcConnections removeObject:v7];
  [(RPRemoteDisplayDaemon *)self _updateForXPCClientChange];
}

- (void)addNeedsAWDLPeer:(id)a3
{
  id v8 = a3;
  id v4 = [v8 identifier];
  if (v4 || ([v8 idsDeviceIdentifier], (id v4 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    needsAWDLNewPeers = self->_needsAWDLNewPeers;
    if (!needsAWDLNewPeers)
    {
      id v6 = (NSMutableSet *)objc_opt_new();
      id v7 = self->_needsAWDLNewPeers;
      self->_needsAWDLNewPeers = v6;

      needsAWDLNewPeers = self->_needsAWDLNewPeers;
    }
    [(NSMutableSet *)needsAWDLNewPeers addObject:v4];
  }
  else if (dword_1001426A0 <= 30 && (dword_1001426A0 != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
}

- (void)_requestConfirmationFromPerson:(id)a3 forDedicated:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = a3;
  id v8 = +[NSUUID UUID];
  personConfirmationSessionID = self->_personConfirmationSessionID;
  self->_personConfirmationSessionID = v8;

  objc_storeStrong((id *)&self->_personSelected, a3);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000B4B50;
  v11[3] = &unk_100124D28;
  id v12 = v7;
  id v10 = v7;
  [(RPRemoteDisplayDaemon *)self _requestConfirmationFromDevicesMatching:v11 forDedicated:v4];
}

- (void)_requestConfirmationFromDevice:(id)a3 forDedicated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = +[NSUUID UUID];
  personConfirmationSessionID = self->_personConfirmationSessionID;
  self->_personConfirmationSessionID = v7;

  personSelected = self->_personSelected;
  self->_personSelected = 0;

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000B4D48;
  v11[3] = &unk_100124D28;
  id v12 = v6;
  id v10 = v6;
  [(RPRemoteDisplayDaemon *)self _requestConfirmationFromDevicesMatching:v11 forDedicated:v4];
}

- (void)_requestConfirmationFromDevicesMatching:(id)a3 forDedicated:(BOOL)a4
{
  id v6 = a3;
  if (dword_1001426A0 <= 30 && (dword_1001426A0 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  [(RPRemoteDisplayDaemon *)self _changeDiscoverySessionStateForDevice:0 startReason:0];
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000B4E5C;
  block[3] = &unk_100124DC8;
  block[4] = self;
  id v10 = v6;
  BOOL v11 = a4;
  id v8 = v6;
  dispatch_async(dispatchQueue, block);
}

- (void)_handleConfirmationResult:(id)a3 fromDevice:(id)a4
{
  id v6 = (char *)a3;
  id v7 = a4;
  if (dword_1001426A0 <= 30 && (dword_1001426A0 != -1 || _LogCategory_Initialize()))
  {
    int v34 = v6;
    LogPrintF();
  }
  CFDictionaryGetTypeID();
  id v8 = CFDictionaryGetTypedValue();
  CFDictionaryGetTypeID();
  uint64_t v9 = CFDictionaryGetTypedValue();
  id v10 = NSDictionaryGetNSNumber();
  BOOL v11 = [(RPRemoteDisplayDaemon *)self dedicatedDevice];
  id v12 = v11;
  if (!v10)
  {
    if (dword_1001426A0 > 90 || dword_1001426A0 == -1 && !_LogCategory_Initialize()) {
      goto LABEL_52;
    }
LABEL_35:
    LogPrintF();
    goto LABEL_52;
  }
  if (self->_personSelected) {
    goto LABEL_7;
  }
  if (!v11)
  {
LABEL_33:
    if (dword_1001426A0 > 90 || dword_1001426A0 == -1 && !_LogCategory_Initialize()) {
      goto LABEL_52;
    }
    goto LABEL_35;
  }
  unsigned int v15 = v11;
  id v16 = [v11 idsDeviceIdentifier];
  id v17 = v7;
  uint64_t v18 = v17;
  if (v16 == v17)
  {

    id v12 = v15;
    goto LABEL_7;
  }
  if ((v17 != 0) == (v16 == 0))
  {

    id v12 = v15;
    goto LABEL_33;
  }
  unsigned __int8 v40 = [v16 isEqual:v17];

  id v12 = v15;
  if ((v40 & 1) == 0) {
    goto LABEL_33;
  }
LABEL_7:
  if (self->_personConfirmationSessionID)
  {
    unint64_t v13 = (unint64_t)[v10 unsignedIntegerValue];
    if (dword_1001426A0 <= 30 && (dword_1001426A0 != -1 || _LogCategory_Initialize()))
    {
      if (v13 > 7) {
        long long v14 = "?";
      }
      else {
        long long v14 = (&off_100124F78)[v13];
      }
      int v34 = v14;
      id v36 = v7;
      LogPrintF();
    }
    os_signpost_id_t v41 = v12;
    int v19 = -[RPRemoteDisplayDaemon _findMatchingDeviceWithIdentifier:](self, "_findMatchingDeviceWithIdentifier:", v7, v34, v36);
    if (v13 == 1)
    {
      [(RPRemoteDisplayDaemon *)self _sendConfirmationCancelToAllDevices];
      if (!v19)
      {
        if (dword_1001426A0 <= 90 && (dword_1001426A0 != -1 || _LogCategory_Initialize())) {
          LogPrintF();
        }
        personSelected = self->_personSelected;
        self->_personSelected = 0;

        goto LABEL_51;
      }
      id v20 = self;
      id v21 = v7;
      uint64_t v22 = 1;
    }
    else
    {
      if (![(NSMutableDictionary *)self->_personConfirmationClientMap count])
      {
        id v37 = v9;
        long long v38 = v8;
        uint64_t v39 = v6;
        if (dword_1001426A0 <= 30 && (dword_1001426A0 != -1 || _LogCategory_Initialize()))
        {
          unsigned __int8 v35 = [(RPRemoteDisplayPerson *)self->_personSelected accountID];
          LogPrintF();
        }
        long long v44 = 0u;
        long long v45 = 0u;
        long long v42 = 0u;
        long long v43 = 0u;
        id v23 = self->_xpcConnections;
        id v24 = [(NSMutableSet *)v23 countByEnumeratingWithState:&v42 objects:v46 count:16];
        if (v24)
        {
          id v25 = v24;
          uint64_t v26 = *(void *)v43;
          do
          {
            for (i = 0; i != v25; i = (char *)i + 1)
            {
              if (*(void *)v43 != v26) {
                objc_enumerationMutation(v23);
              }
              int v28 = *(void **)(*((void *)&v42 + 1) + 8 * i);
              long long v29 = [v28 activatedDiscovery:v35];

              if (v29)
              {
                long long v30 = [v28 xpcCnx];
                long long v31 = [v30 remoteObjectProxy];
                [v31 remoteDisplayPersonDeclined];
              }
            }
            id v25 = [(NSMutableSet *)v23 countByEnumeratingWithState:&v42 objects:v46 count:16];
          }
          while (v25);
        }

        long long v32 = self->_personSelected;
        self->_personSelected = 0;

        id v8 = v38;
        id v6 = v39;
        uint64_t v9 = v37;
      }
      id v20 = self;
      id v21 = 0;
      uint64_t v22 = 0;
    }
    -[RPRemoteDisplayDaemon _processDiscoverySessionStateChangeForDevice:startReason:](v20, "_processDiscoverySessionStateChangeForDevice:startReason:", v21, v22, v35);
LABEL_51:

    id v12 = v41;
    goto LABEL_52;
  }
  if (dword_1001426A0 <= 90 && (dword_1001426A0 != -1 || _LogCategory_Initialize())) {
    goto LABEL_35;
  }
LABEL_52:
}

- (void)_sendConfirmationCancelToAllDevices
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  personConfirmationClientMap = self->_personConfirmationClientMap;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000B5B48;
  v6[3] = &unk_100124E18;
  v6[4] = self;
  [(NSMutableDictionary *)personConfirmationClientMap enumerateKeysAndObjectsUsingBlock:v6];
  [(NSMutableDictionary *)self->_personConfirmationClientMap removeAllObjects];
  BOOL v4 = self->_personConfirmationClientMap;
  self->_personConfirmationClientMap = 0;

  personConfirmationSessionID = self->_personConfirmationSessionID;
  self->_personConfirmationSessionID = 0;
}

- (void)_clearConfirmationClientCache
{
  CFDictionaryRef v3 = [(NSMutableDictionary *)self->_personConfirmationClientMap allValues];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      id v7 = 0;
      do
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * (void)v7) invalidate];
        id v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }
  [(NSMutableDictionary *)self->_personConfirmationClientMap removeAllObjects];
  personConfirmationClientMap = self->_personConfirmationClientMap;
  self->_personConfirmationClientMap = 0;

  personConfirmationSessionID = self->_personConfirmationSessionID;
  self->_personConfirmationSessionID = 0;
}

- (void)_sendDiscoverySessionExitWithReason:(id)a3
{
  id v4 = a3;
  if (self->_deviceConfirmedIdentifier)
  {
    id v5 = -[RPRemoteDisplayDaemon _findMatchingDeviceWithIdentifier:](self, "_findMatchingDeviceWithIdentifier:");
    uint64_t v6 = v5;
    if (v5 && [v5 inDiscoverySession])
    {
      if (dword_1001426A0 <= 30 && (dword_1001426A0 != -1 || _LogCategory_Initialize()))
      {
        id v13 = v4;
        long long v14 = v6;
        LogPrintF();
      }
      id v7 = [v6 idsDeviceIdentifier:v13, v14];
      id v8 = objc_alloc_init((Class)RPCompanionLinkClient);
      id v9 = objc_alloc_init((Class)RPCompanionLinkDevice);
      [v9 setIdentifier:v7];
      [v8 setDispatchQueue:self->_dispatchQueue];
      [v8 setDestinationDevice:v9];
      [v8 setControlFlags:2097162];
      long long v10 = +[NSMutableDictionary dictionary];
      long long v11 = [(RPCompanionLinkDevice *)self->_localDeviceInfo identifier];
      [v10 setObject:v11 forKeyedSubscript:@"_i"];

      [v10 setObject:v4 forKeyedSubscript:@"_cExitReson"];
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = sub_1000B60F0;
      v15[3] = &unk_100124CB0;
      v15[4] = v8;
      v15[5] = v7;
      id v16 = v10;
      id v17 = self;
      id v12 = v10;
      [v8 activateWithCompletion:v15];
    }
  }
}

- (void)setDeviceConfirmedIdentifier:(id)a3
{
  id v4 = (NSString *)a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (dword_1001426A0 <= 30 && (dword_1001426A0 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  deviceConfirmedIdentifier = self->_deviceConfirmedIdentifier;
  self->_deviceConfirmedIdentifier = v4;
}

- (void)_changeDiscoverySessionStateForDevice:(id)a3 startReason:(unsigned __int8)a4
{
  uint64_t v4 = a4;
  id v10 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  id v6 = v10;
  if (v10
    && self->_deviceConfirmedIdentifier
    && (v7 = objc_msgSend(v10, "isEqualToString:"), id v6 = v10, !v7))
  {
    [(RPRemoteDisplayDaemon *)self _processDiscoverySessionStateChangeForDevice:0 startReason:0];
    id v8 = self;
    id v9 = v10;
  }
  else
  {
    id v8 = self;
    id v9 = v6;
  }
  [(RPRemoteDisplayDaemon *)v8 _processDiscoverySessionStateChangeForDevice:v9 startReason:v4];
}

- (void)_processDiscoverySessionStateChangeForDevice:(id)a3 startReason:(unsigned __int8)a4
{
  uint64_t v4 = a4;
  id v6 = a3;
  deviceConfirmedIdentifier = self->_deviceConfirmedIdentifier;
  BOOL v8 = v6 != 0;
  if (v8 != (deviceConfirmedIdentifier != 0))
  {
    if (dword_1001426A0 <= 30 && (dword_1001426A0 != -1 || _LogCategory_Initialize()))
    {
      id v9 = "OutOfSession";
      if (deviceConfirmedIdentifier) {
        id v10 = "InSession";
      }
      else {
        id v10 = "OutOfSession";
      }
      if (v6) {
        id v9 = "InSession";
      }
      if (v4 > 2) {
        long long v11 = "?";
      }
      else {
        long long v11 = (&off_100124FB8)[(char)v4];
      }
      id v33 = v6;
      int v34 = v11;
      long long v31 = v10;
      long long v32 = v9;
      LogPrintF();
    }
    unsigned __int8 v35 = self->_deviceConfirmedIdentifier;
    id v36 = v35;
    [(RPRemoteDisplayDaemon *)self setDeviceConfirmedIdentifier:v6];
    if (v6)
    {
      id v12 = v6;
      long long v38 = [(RPRemoteDisplayDaemon *)self _findMatchingDeviceWithIdentifier:v6];
    }
    else
    {
      id v12 = 0;
      long long v38 = 0;
    }
    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    id v37 = self;
    id v13 = self->_xpcConnections;
    id v14 = [(NSMutableSet *)v13 countByEnumeratingWithState:&v39 objects:v43 count:16];
    if (v14)
    {
      id v15 = v14;
      uint64_t v16 = *(void *)v40;
      do
      {
        for (i = 0; i != v15; i = (char *)i + 1)
        {
          if (*(void *)v40 != v16) {
            objc_enumerationMutation(v13);
          }
          uint64_t v18 = *(void **)(*((void *)&v39 + 1) + 8 * i);
          int v19 = [v18 activatedDiscovery:v31, v32, v33, v34];

          if (v19)
          {
            id v20 = [v18 xpcCnx];
            id v21 = [v20 remoteObjectProxy];
            [v21 remoteDisplayDeviceSelected:v38];

            uint64_t v22 = [v18 xpcCnx];
            id v23 = [v22 remoteObjectProxy];
            [v23 remoteDisplayNotifyDiscoverySessionState:v8 forDevice:v12 startReason:v4];
          }
        }
        id v15 = [(NSMutableSet *)v13 countByEnumeratingWithState:&v39 objects:v43 count:16];
      }
      while (v15);
    }

    id v6 = v12;
    if (v12)
    {
      [(RPRemoteDisplayDaemon *)v37 _postNotificationForWombatActivity:4];
      id v24 = +[RPDaemon sharedDaemon];
      [v24 postDaemonInfoChanges:0x8000];

      [(RPRemoteDisplayDaemon *)v37 _startDiscoverySessionExpirationTimer];
      id v25 = v36;
    }
    else
    {
      id v25 = v36;
      if (v35)
      {
        uint64_t v26 = +[RPIdentityDaemon sharedIdentityDaemon];
        [v26 removeSessionPairedIdentityWithIdentifier:v36];
      }
      -[RPRemoteDisplayDaemon _postNotificationForWombatActivity:](v37, "_postNotificationForWombatActivity:", 5, v31, v32, v33, v34);
      uint64_t v27 = +[RPDaemon sharedDaemon];
      [v27 postDaemonInfoChanges:0x10000];

      discoverySessionExpirationTimer = v37->_discoverySessionExpirationTimer;
      if (discoverySessionExpirationTimer)
      {
        long long v29 = discoverySessionExpirationTimer;
        dispatch_source_cancel(v29);
        long long v30 = v37->_discoverySessionExpirationTimer;
        v37->_discoverySessionExpirationTimer = 0;
      }
    }
  }
}

- (void)_startDiscoverySessionExpirationTimer
{
  discoverySessionExpirationTimer = self->_discoverySessionExpirationTimer;
  if (discoverySessionExpirationTimer)
  {
    uint64_t v4 = discoverySessionExpirationTimer;
    dispatch_source_cancel(v4);
    id v5 = self->_discoverySessionExpirationTimer;
    self->_discoverySessionExpirationTimer = 0;
  }
  id v6 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)self->_dispatchQueue);
  unsigned int v7 = self->_discoverySessionExpirationTimer;
  self->_discoverySessionExpirationTimer = v6;

  BOOL v8 = self->_discoverySessionExpirationTimer;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_1000B687C;
  handler[3] = &unk_100121158;
  handler[4] = self;
  dispatch_source_set_event_handler(v8, handler);
  CUDispatchTimerSet();
  dispatch_activate((dispatch_object_t)self->_discoverySessionExpirationTimer);
}

- (void)_startInSessionDeviceLostTimer
{
  if (self->_deviceConfirmedIdentifier)
  {
    inSessionDeviceLost = self->_inSessionDeviceLost;
    if (inSessionDeviceLost)
    {
      uint64_t v4 = inSessionDeviceLost;
      dispatch_source_cancel(v4);
      id v5 = self->_inSessionDeviceLost;
      self->_inSessionDeviceLost = 0;
    }
    if (dword_1001426A0 <= 30 && (dword_1001426A0 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    id v6 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)self->_dispatchQueue);
    unsigned int v7 = self->_inSessionDeviceLost;
    self->_inSessionDeviceLost = v6;

    BOOL v8 = self->_inSessionDeviceLost;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_1000B6A78;
    handler[3] = &unk_100121158;
    handler[4] = self;
    dispatch_source_set_event_handler(v8, handler);
    CUDispatchTimerSet();
    dispatch_activate((dispatch_object_t)self->_inSessionDeviceLost);
  }
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
}

- (NSString)deviceConfirmedIdentifier
{
  return self->_deviceConfirmedIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceConfirmedIdentifier, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_personSelected, 0);
  objc_storeStrong((id *)&self->_personConfirmationSessionID, 0);
  objc_storeStrong((id *)&self->_personConfirmationClientMap, 0);
  objc_storeStrong((id *)&self->_pendingLostDevicesTimer, 0);
  objc_storeStrong((id *)&self->_pendingLostDevices, 0);
  objc_storeStrong((id *)&self->_xpcMatchingServerMap, 0);
  objc_storeStrong((id *)&self->_xpcMatchingDiscoveryMap, 0);
  objc_storeStrong((id *)&self->_xpcListener, 0);
  objc_storeStrong((id *)&self->_xpcConnections, 0);
  objc_storeStrong((id *)&self->_unresolvedDevices, 0);
  objc_storeStrong((id *)&self->_tcpServer, 0);
  objc_storeStrong((id *)&self->_tcpServerConnections, 0);
  objc_storeStrong((id *)&self->_systemMonitor, 0);
  objc_storeStrong((id *)&self->_serverIncomingMessageCLinkClient, 0);
  objc_storeStrong((id *)&self->_needsAWDLRequestTimer, 0);
  objc_storeStrong((id *)&self->_needsAWDLSentToPeers, 0);
  objc_storeStrong((id *)&self->_needsAWDLRequestIdentifiers, 0);
  objc_storeStrong((id *)&self->_needsAWDLNewPeers, 0);
  objc_storeStrong((id *)&self->_needsAWDLDevices, 0);
  objc_storeStrong((id *)&self->_localDeviceInfo, 0);
  objc_storeStrong((id *)&self->_inSessionDeviceLost, 0);
  objc_storeStrong((id *)&self->_discoverySessionExpirationTimer, 0);
  objc_storeStrong((id *)&self->_discoveredDevices, 0);
  objc_storeStrong((id *)&self->_deviceSessionPaired, 0);
  objc_storeStrong((id *)&self->_devicesInProximity, 0);
  objc_storeStrong((id *)&self->_deviceAWDLRandomID, 0);
  objc_storeStrong((id *)&self->_deviceAuthTagStr, 0);
  objc_storeStrong((id *)&self->_clinkClient, 0);
  objc_storeStrong((id *)&self->_cameraCapabilitiesUpdateSendMap, 0);
  objc_storeStrong((id *)&self->_clientIncomingMessageCLinkClient, 0);
  objc_storeStrong((id *)&self->_cameraCapabilities, 0);
  objc_storeStrong((id *)&self->_bufferedConnections, 0);
  objc_storeStrong((id *)&self->_btAdvAddrStr, 0);
  objc_storeStrong((id *)&self->_btAdvAddrData, 0);
  objc_storeStrong((id *)&self->_btAdvAddrMonitor, 0);
  objc_storeStrong((id *)&self->_bonjourBrowserAWDLProcess, 0);
  objc_storeStrong((id *)&self->_bonjourBrowserAWDL, 0);
  objc_storeStrong((id *)&self->_bonjourBrowser, 0);
  objc_storeStrong((id *)&self->_bonjourAWDLDevices, 0);
  objc_storeStrong((id *)&self->_bonjourAWDLAdvertiser, 0);
  objc_storeStrong((id *)&self->_bonjourAdvertiser, 0);
  objc_storeStrong((id *)&self->_bleNeedsAWDLScanner, 0);
  objc_storeStrong((id *)&self->_bleNeedsAWDLAdvertiserProcessName, 0);
  objc_storeStrong((id *)&self->_bleNeedsAWDLAdvertiser, 0);
  objc_storeStrong((id *)&self->_bleNearbyActionV2Discovery, 0);
  objc_storeStrong((id *)&self->_bleNearbyActionV2Device, 0);
  objc_storeStrong((id *)&self->_bleNearbyActionV2AdvertiserProcessName, 0);
  objc_storeStrong((id *)&self->_bleNearbyActionV2Advertiser, 0);
  objc_storeStrong((id *)&self->_bleDiscovery, 0);
  objc_storeStrong((id *)&self->_awdlPairingID, 0);
  objc_storeStrong((id *)&self->_authenticationManager, 0);
  objc_storeStrong((id *)&self->_activatedSessionSet, 0);
  objc_storeStrong((id *)&self->_activatedServerXPCCnxMap, 0);

  objc_storeStrong((id *)&self->_activatedDiscoverySet, 0);
}

@end
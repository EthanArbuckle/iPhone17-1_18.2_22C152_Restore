@interface _NFReaderSession
- (BOOL)_findAppFromSet:(id)a3 tag:(id)a4 foundApp:(id *)a5 outError:(id *)a6;
- (BOOL)_getKeyVersionForNodes:(id)a3;
- (BOOL)_isAIDStringValid:(id)a3;
- (BOOL)_isCoreNFCSession;
- (BOOL)_isFelicaPollingCommand:(id)a3 systemCode:(id *)a4;
- (BOOL)_isPayloadConnectionHandover:(id)a3;
- (BOOL)_mifareCheck:(id)a3;
- (BOOL)_processRawTagsForCoreNFC:(id)a3 requireDiscoveryRestart:(BOOL *)a4 supportedTags:(id)a5 caEvents:(id)a6 outError:(id *)a7 outConnectedTagIndex:(unint64_t *)a8;
- (BOOL)_processRawTagsForInternalSession:(id)a3 supportedTags:(id)a4 outError:(id *)a5;
- (BOOL)_processRawTagsForNDEF:(id)a3 ndefMessages:(id)a4 supportedTags:(id)a5 caEvents:(id)a6 outError:(id *)a7;
- (BOOL)_readEFCardAccessFromTag:(id)a3 buffer:(id)a4 outError:(id *)a5;
- (BOOL)_requiresMifareUpdate:(id)a3;
- (BOOL)_requiresTypeFUpdate:(id)a3;
- (BOOL)_selectEF:(unsigned __int16)a3 p2:(unsigned __int8)a4 tag:(id)a5 outResponse:(id *)a6 outError:(id *)a7;
- (BOOL)_selectEF:(unsigned __int16)a3 tag:(id)a4 outError:(id *)a5;
- (BOOL)_selectFromTag:(id)a3 aid:(id)a4 resolvedAid:(id *)a5 error:(id *)a6;
- (BOOL)_selectMFFromTag:(id)a3 outError:(id *)a4;
- (BOOL)_updateFelicaTagInfo:(id)a3 outError:(id *)a4;
- (BOOL)_updateMifareTagInfo:(id)a3 outError:(id *)a4;
- (BOOL)_validateMifareAPDU:(id)a3 response:(id)a4;
- (BOOL)activateTag:(id)a3 outError:(id *)a4;
- (BOOL)isPRCIDSupported:(id)a3;
- (BOOL)isPaceSupported:(id)a3;
- (BOOL)selectPRCIDApp:(id)a3 fromTag:(id)a4 resolvedAid:(id *)a5 outError:(id *)a6;
- (BOOL)selectPaceApp:(id)a3 fromTag:(id)a4 outError:(id *)a5;
- (BOOL)selectPaceApp:(id)a3 fromTag:(id)a4 resolvedAid:(id *)a5 outError:(id *)a6;
- (BOOL)shouldHandleSecureElementTransactionData;
- (BOOL)skipMifareClassification;
- (BOOL)suspendWithInfo:(id)a3;
- (BOOL)timeLimitedSession;
- (BOOL)uiActivated;
- (BOOL)uiShown;
- (BOOL)validateAID:(id)a3 withSelectResponse:(id)a4 outRealAid:(id *)a5;
- (BOOL)validateSystemCode:(id)a3;
- (BOOL)willStartSession;
- (NFDriverWrapper)driverWrapper;
- (NFServiceWhitelistChecker)whitelistChecker;
- (NFSystemPowerConsumptionMonitor)powerConsumptionReporter;
- (NFTag)currentTag;
- (NSMutableArray)feliCaSystemCodeList;
- (NSMutableOrderedSet)iso7816AppList;
- (_NFDriverTagDiscoveryNtf)_getTagNotificationConfig;
- (_NFReaderSession)initWithRemoteObject:(id)a3 workQueue:(id)a4 expressModeManager:(id)a5 allowsBackgroundMode:(BOOL)a6;
- (_NFReaderSession)initWithRemoteObject:(id)a3 workQueue:(id)a4 whitelist:(id)a5 serviceType:(unint64_t)a6 showSharingUI:(unint64_t)a7 coreNFCSessionType:(unint64_t)a8 scanText:(id)a9;
- (id)_RequestService:(id)a3;
- (id)_RequestService:(id)a3 forSystemCode:(id)a4;
- (id)_activateAppOnConnect:(id)a3;
- (id)_disconnectWithCardRemoval:(BOOL)a3;
- (id)_getApplicationNameFromFciTemplate:(id)a3;
- (id)_getFCITemplate:(id)a3;
- (id)_getIDMFromTag:(id)a3 systemCode:(id)a4 outIdm:(id *)a5 outPmm:(id *)a6;
- (id)_getNodeList;
- (id)_getSystemCodeListFromTag:(id)a3 outError:(id *)a4;
- (id)_getSystemInfo:(id)a3 outError:(id *)a4;
- (id)_performType4AppSelect:(id)a3 tag:(id)a4;
- (id)_processFelicaTagForCoreNFC:(id)a3 outError:(id *)a4;
- (id)_processISO14443TagForCoreNFC:(id)a3 tagIsConnected:(BOOL *)a4 outError:(id *)a5;
- (id)_processISO15693TagForCoreNFC:(id)a3 outError:(id *)a4;
- (id)_processIso14Tag:(id)a3 connected:(BOOL *)a4 appFound:(id *)a5 updatedTag:(id *)a6;
- (id)_processMifareTag:(id)a3 connected:(BOOL *)a4 isMifare:(BOOL *)a5;
- (id)_processNDEFTagForCoreNFC:(id)a3 outError:(id *)a4;
- (id)_readFromTag:(id)a3 offset:(unsigned __int16)a4 outError:(id *)a5;
- (id)_readNdefMessageFromTag:(id)a3 rawLength:(unint64_t *)a4 error:(id *)a5;
- (id)_selectTag:(id)a3 aid:(id)a4 p1:(unsigned __int8)a5 p2:(unsigned __int8)a6 shortLe:(char)a7 error:(id *)a8;
- (id)detectPaceAppOnTag:(id)a3 appFound:(id *)a4;
- (id)getPermissible7816AppsFromInfoPlist:(id)a3;
- (id)getPermissibleFelicaSystemCodeFromInfoPlist:(id)a3;
- (id)uiInvalidationHandler;
- (int64_t)validateAID:(id)a3 allowsPrefixMatch:(BOOL)a4;
- (unint64_t)sessionConfig;
- (unint64_t)sessionType;
- (unsigned)_getTagTypeFromTag:(id)a3;
- (unsigned)_queryMifareType:(id)a3 outError:(id *)a4;
- (unsigned)_refreshNdefTagConnection;
- (unsigned)_validateAPDU:(id)a3 outCheckFciResponse:(BOOL *)a4;
- (unsigned)_validateFelicaCommand:(id)a3;
- (unsigned)_validateISO15693Packet:(id)a3;
- (void)_initialize7816AidList:(id)a3;
- (void)_sync_connect:(id)a3 completion:(id)a4;
- (void)_sync_execRemoteAdminScript:(id)a3 completion:(id)a4;
- (void)_sync_felicaStateForSystemCode:(id)a3 withRequestService:(id)a4 performSearchServiceCode:(BOOL)a5 completion:(id)a6;
- (void)_sync_restartPolling:(id)a3;
- (void)_sync_setECPPayload:(id)a3 completion:(id)a4;
- (void)_sync_startPollingForNDEFMessagesWithSessionConfig:(unint64_t)a3 completion:(id)a4;
- (void)_sync_startPollingForTags:(unint64_t)a3 sessionConfig:(unint64_t)a4 completion:(id)a5;
- (void)_sync_startPollingWithConfig:(id)a3 completion:(id)a4;
- (void)_sync_stopPolling:(id)a3;
- (void)_sync_transceive:(id)a3 completion:(id)a4;
- (void)_tagRemovalDetect:(id)a3;
- (void)_updateReaderSettingsBasedOnConfig:(unint64_t)a3;
- (void)activateUIControllerWithCompletion:(id)a3;
- (void)checkNdefSupportWithCompletion:(id)a3;
- (void)checkPresenceWithCompletion:(id)a3;
- (void)cleanup;
- (void)cleanupUI;
- (void)clearUIControllerInvalidationHandler;
- (void)configurePollingProfile:(int64_t)a3 completion:(id)a4;
- (void)connect:(id)a3 completion:(id)a4;
- (void)coreDuetActivityRevoked;
- (void)didStartSession:(id)a3;
- (void)disconnectWithCardRemoval:(BOOL)a3 completion:(id)a4;
- (void)enableContinuousWave:(BOOL)a3 withFrequencySweep:(BOOL)a4 completion:(id)a5;
- (void)execRemoteAdminScript:(id)a3 completion:(id)a4;
- (void)felicaRequestService:(id)a3 completion:(id)a4;
- (void)felicaRequestService:(id)a3 forSystemCode:(id)a4 completion:(id)a5;
- (void)felicaStateForSystemCode:(id)a3 withRequestService:(id)a4 performSearchServiceCode:(BOOL)a5 completion:(id)a6;
- (void)formatNdefWithKey:(id)a3 completion:(id)a4;
- (void)handleFilteredFieldNotification:(id)a3;
- (void)handleInvalidatedXPCWithConnectionUserInfo:(id)a3;
- (void)handleReaderBurnoutCleared;
- (void)handleReaderBurnoutTimer;
- (void)handleRemoteTagsDetected:(id)a3;
- (void)ndefReadWithCompletion:(id)a3;
- (void)ndefWrite:(id)a3 completion:(id)a4;
- (void)performVAS:(id)a3 completion:(id)a4;
- (void)restartPollingWithCompletion:(id)a3;
- (void)resume;
- (void)setCurrentTag:(id)a3;
- (void)setDriverWrapper:(id)a3;
- (void)setECPPayload:(id)a3 completion:(id)a4;
- (void)setFeliCaSystemCodeList:(id)a3;
- (void)setIso7816AppList:(id)a3;
- (void)setPowerConsumptionReporter:(id)a3;
- (void)setUiInvalidationHandler:(id)a3;
- (void)skipMifareClassificationWithCompletion:(id)a3;
- (void)startPollingForNDEFMessagesWithSessionConfig:(unint64_t)a3 completion:(id)a4;
- (void)startPollingForTags:(unint64_t)a3 sessionConfig:(unint64_t)a4 completion:(id)a5;
- (void)startPollingWithConfig:(id)a3 completion:(id)a4;
- (void)stopPollingWithCompletion:(id)a3;
- (void)transceive:(id)a3 completion:(id)a4;
- (void)updateSharingUIScanText:(id)a3 completion:(id)a4;
- (void)updateSharingUIStateOnInvalidation:(int64_t)a3 completion:(id)a4;
- (void)writeProtectNDEFTagWithCompletion:(id)a3;
@end

@implementation _NFReaderSession

- (BOOL)isPRCIDSupported:(id)a3
{
  v3 = [a3 NF_asHexString];
  unsigned __int8 v4 = [v3 isEqualToString:@"F049442E43484E"];

  return v4;
}

- (BOOL)selectPRCIDApp:(id)a3 fromTag:(id)a4 resolvedAid:(id *)a5 outError:(id *)a6
{
  id v11 = a3;
  id v12 = a4;
  if ((unint64_t)[v11 length] > 0xFF) {
    goto LABEL_12;
  }
  id v13 = v12;
  if ([v13 type] != 5)
  {

    goto LABEL_12;
  }
  v128 = a6;
  sel = a2;
  *(_DWORD *)buf = 0;
  v14 = [v13 tagB];
  v15 = [v14 pupi];
  id v16 = [objc_alloc((Class)NSData) initWithBytes:buf length:4];
  unsigned int v17 = [v15 isEqualToData:v16];

  if (!v17)
  {
LABEL_12:
    BOOL v31 = 0;
    goto LABEL_13;
  }
  v18 = [v11 NF_asHexString];
  unsigned __int8 v19 = [v18 isEqualToString:@"F049442E43484E"];

  if ((v19 & 1) == 0)
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      v34 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(sel);
      uint64_t v38 = 45;
      if (isMetaClass) {
        uint64_t v38 = 43;
      }
      v34(3, "%c[%{public}s %{public}s]:%i Unexpected AID value", v38, ClassName, Name, 39);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v39 = NFSharedLogGetLogger();
    v40 = v128;
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
    {
      v41 = object_getClass(self);
      if (class_isMetaClass(v41)) {
        int v42 = 43;
      }
      else {
        int v42 = 45;
      }
      v43 = object_getClassName(self);
      v44 = sel_getName(sel);
      *(_DWORD *)buf = 67109890;
      *(_DWORD *)&buf[4] = v42;
      __int16 v163 = 2082;
      v164 = v43;
      __int16 v165 = 2082;
      v166 = v44;
      __int16 v167 = 1024;
      int v168 = 39;
      _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Unexpected AID value", buf, 0x22u);
    }

    if (!v128) {
      goto LABEL_12;
    }
    id v45 = objc_alloc((Class)NSError);
    v46 = +[NSString stringWithUTF8String:"nfcd"];
    v160[0] = NSLocalizedDescriptionKey;
    v47 = +[NSString stringWithUTF8String:"Invalid State"];
    v161[0] = v47;
    v161[1] = &off_10031BF28;
    v160[1] = @"Line";
    v160[2] = @"Method";
    id v48 = [objc_alloc((Class)NSString) initWithFormat:@"%s", sel_getName(sel)];
    v161[2] = v48;
    v160[3] = NSDebugDescriptionErrorKey;
    id v49 = [objc_alloc((Class)NSString) initWithFormat:@"%s:%d", sel_getName(sel), 40];
    v161[3] = v49;
    v50 = v161;
    v51 = v160;
LABEL_36:
    +[NSDictionary dictionaryWithObjects:v50 forKeys:v51 count:4];
    v64 = id v63 = v11;
    id *v40 = [v45 initWithDomain:v46 code:12 userInfo:v64];

    id v11 = v63;
    goto LABEL_12;
  }
  id v127 = v12;
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v52 = NFLogGetLogger();
    if (v52)
    {
      v53 = (void (*)(uint64_t, const char *, ...))v52;
      v54 = object_getClass(self);
      BOOL v55 = class_isMetaClass(v54);
      v56 = object_getClassName(self);
      v113 = sel_getName(sel);
      uint64_t v57 = 45;
      if (v55) {
        uint64_t v57 = 43;
      }
      v53(3, "%c[%{public}s %{public}s]:%i Unable to read NFC settings from ATL", v57, v56, v113, 46);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v58 = NFSharedLogGetLogger();
    v40 = v128;
    if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
    {
      v59 = object_getClass(self);
      if (class_isMetaClass(v59)) {
        int v60 = 43;
      }
      else {
        int v60 = 45;
      }
      v61 = object_getClassName(self);
      v62 = sel_getName(sel);
      *(_DWORD *)buf = 67109890;
      *(_DWORD *)&buf[4] = v60;
      __int16 v163 = 2082;
      v164 = v61;
      __int16 v165 = 2082;
      v166 = v62;
      __int16 v167 = 1024;
      int v168 = 46;
      _os_log_impl((void *)&_mh_execute_header, v58, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Unable to read NFC settings from ATL", buf, 0x22u);
    }

    if (!v128) {
      goto LABEL_12;
    }
    id v45 = objc_alloc((Class)NSError);
    v46 = +[NSString stringWithUTF8String:"nfcd"];
    v158[0] = NSLocalizedDescriptionKey;
    v47 = +[NSString stringWithUTF8String:"Invalid State"];
    v159[0] = v47;
    v159[1] = &off_10031BF40;
    v158[1] = @"Line";
    v158[2] = @"Method";
    id v48 = [objc_alloc((Class)NSString) initWithFormat:@"%s", sel_getName(sel)];
    v159[2] = v48;
    v158[3] = NSDebugDescriptionErrorKey;
    id v49 = [[objc_alloc((Class)NSString) initWithFormat:@"%s:%d", sel_getName(sel), 47];
    v159[3] = v49;
    v50 = v159;
    v51 = v158;
    goto LABEL_36;
  }
  LOBYTE(v163) = 8;
  *(void *)buf = 0x10800000000001DLL;
  v20 = [(_NFReaderSession *)self driverWrapper];
  id v21 = [objc_alloc((Class)NSData) initWithBytes:buf length:9];
  v22 = [(_NFReaderSession *)self whitelistChecker];
  [v22 sessionTimeLimit];
  id v141 = 0;
  v23 = sub_100195A20(v20, v21, v13, &v141);
  id v24 = v141;

  if (!v24)
  {
    if (![v23 length])
    {
      if (v128)
      {
        id v89 = objc_alloc((Class)NSError);
        v28 = +[NSString stringWithUTF8String:"nfcd"];
        v150[0] = NSLocalizedDescriptionKey;
        v76 = +[NSString stringWithUTF8String:"Tag Error"];
        v151[0] = v76;
        v151[1] = &off_10031BF88;
        v150[1] = @"Line";
        v150[2] = @"Method";
        id v152 = [objc_alloc((Class)NSString) initWithFormat:@"%s", sel_getName(sel)];
        v150[3] = NSDebugDescriptionErrorKey;
        v80 = v152;
        id v78 = [objc_alloc((Class)NSString) initWithFormat:@"%s:%d", sel_getName(sel), 68];
        id v153 = v78;
        v90 = +[NSDictionary dictionaryWithObjects:v151 forKeys:v150 count:4];
        id *v128 = [v89 initWithDomain:v28 code:29 userInfo:v90];

        id v24 = 0;
        BOOL v31 = 0;
        id v12 = v127;
        goto LABEL_89;
      }
      id v24 = 0;
      BOOL v31 = 0;
      goto LABEL_90;
    }
    v65 = +[AppletTranslator getNFCSettings];
    v66 = objc_opt_new();
    v115 = v65;
    uint64_t v67 = [v65 objectForKeyedSubscript:@"PRCID_SELECT_APP_LIST"];
    v116 = (void *)v67;
    if (v67 && (v68 = (void *)v67, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      long long v139 = 0u;
      long long v140 = 0u;
      long long v137 = 0u;
      long long v138 = 0u;
      id v69 = v68;
      id v70 = [v69 countByEnumeratingWithState:&v137 objects:v149 count:16];
      if (v70)
      {
        id v71 = v70;
        id v122 = v11;
        uint64_t v72 = *(void *)v138;
        do
        {
          for (i = 0; i != v71; i = (char *)i + 1)
          {
            if (*(void *)v138 != v72) {
              objc_enumerationMutation(v69);
            }
            uint64_t v74 = *(void *)(*((void *)&v137 + 1) + 8 * i);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v75 = +[NSData NF_dataWithHexString:v74];
              [v66 addObject:v75];
            }
          }
          id v71 = [v69 countByEnumeratingWithState:&v137 objects:v149 count:16];
        }
        while (v71);
        id v12 = v127;
        id v11 = v122;
      }
    }
    else
    {
      id v69 = [objc_alloc((Class)NSData) initWithBytes:&unk_1002840CE length:2];
      [v66 addObject:v69];
    }

    long long v135 = 0u;
    long long v136 = 0u;
    long long v133 = 0u;
    long long v134 = 0u;
    id v78 = v66;
    id v120 = [v78 countByEnumeratingWithState:&v133 objects:v148 count:16];
    if (!v120) {
      goto LABEL_63;
    }
    uint64_t v123 = *(void *)v134;
    id obj = v78;
LABEL_55:
    v81 = 0;
    v82 = v23;
    v83 = v11;
    while (1)
    {
      if (*(void *)v134 != v123) {
        objc_enumerationMutation(obj);
      }
      id v11 = *(id *)(*((void *)&v133 + 1) + 8 * (void)v81);

      int v131 = 41984;
      unsigned __int8 v132 = [v11 length];
      id v84 = [objc_alloc((Class)NSMutableData) initWithBytes:&v131 length:5];
      [v84 appendData:v11];
      v85 = [(_NFReaderSession *)self driverWrapper];
      v86 = [(_NFReaderSession *)self whitelistChecker];
      [v86 sessionTimeLimit];
      id v130 = 0;
      v126 = v84;
      v23 = sub_100195A20(v85, v84, v13, &v130);
      id v24 = v130;

      if (v24) {
        break;
      }
      if (![v23 length])
      {
        id v12 = v127;
        v93 = v128;
        if (v128)
        {
          id v97 = 0;
          v119 = v23;
          id v124 = v11;
          id v98 = objc_alloc((Class)NSError);
          uint64_t v99 = +[NSString stringWithUTF8String:"nfcd"];
          v142[0] = NSLocalizedDescriptionKey;
          v100 = +[NSString stringWithUTF8String:"Tag Error"];
          v143[0] = v100;
          v143[1] = &off_10031BFD0;
          v142[1] = @"Line";
          v142[2] = @"Method";
          id v101 = [[objc_alloc((Class)NSString) initWithFormat:@"%s", sel_getName(sel)];
          v143[2] = v101;
          v142[3] = NSDebugDescriptionErrorKey;
          v102 = (void *)v99;
          id v103 = [objc_alloc((Class)NSString) initWithFormat:@"%s:%d", sel_getName(sel), 106];
          v143[3] = v103;
          v104 = v143;
          v105 = v142;
          uint64_t v106 = 4;
          goto LABEL_81;
        }
        id v24 = 0;
LABEL_83:
        v28 = v115;
        goto LABEL_87;
      }
      v87 = +[NFResponseAPDU responseWithData:v23];
      id v12 = v127;
      if ([v87 status] == 36864)
      {
        if (a5)
        {
          *a5 = +[NSData NF_dataWithHexString:@"F049442E43484E"];
        }

        id v24 = 0;
        BOOL v31 = 1;
        id v78 = obj;
        goto LABEL_78;
      }

      v81 = (char *)v81 + 1;
      v82 = v23;
      v88 = v23;
      v83 = v11;
      if (v120 == v81)
      {
        id v78 = obj;
        v23 = v88;
        id v120 = [obj countByEnumeratingWithState:&v133 objects:v148 count:16];
        if (v120) {
          goto LABEL_55;
        }
LABEL_63:

        id v24 = 0;
        id v11 = 0;
        BOOL v31 = 0;
LABEL_78:
        v76 = v78;
        v28 = v115;
LABEL_88:
        v80 = v116;
LABEL_89:

        goto LABEL_90;
      }
    }
    if ([v24 code] == (id)64)
    {
      id v12 = v127;
      v93 = v128;
      if (!v128) {
        goto LABEL_83;
      }
      id v124 = v11;
      id v94 = objc_alloc((Class)NSError);
      uint64_t v121 = +[NSString stringWithUTF8String:"nfcd"];
      id v95 = [v24 code];
      v146[0] = NSLocalizedDescriptionKey;
      v119 = v23;
      uint64_t v114 = (uint64_t)v95;
      if ((uint64_t)[v24 code] > 70) {
        uint64_t v96 = 71;
      }
      else {
        uint64_t v96 = (uint64_t)[v24 code];
      }
      v100 = +[NSString stringWithUTF8String:off_100304AB8[v96]];
      v147[0] = v100;
      v147[1] = v24;
      id v97 = v24;
      v146[1] = NSUnderlyingErrorKey;
      v146[2] = @"Line";
      v147[2] = &off_10031BFA0;
      v146[3] = @"Method";
      id v101 = [objc_alloc((Class)NSString) initWithFormat:@"%s", sel_getName(sel)];
      v147[3] = v101;
      v146[4] = NSDebugDescriptionErrorKey;
      id v103 = [objc_alloc((Class)NSString) initWithFormat:@"%s:%d", sel_getName(sel), 100];
      v147[4] = v103;
      v108 = +[NSDictionary dictionaryWithObjects:v147 forKeys:v146 count:5];
      v109 = v94;
      v102 = (void *)v121;
      v110 = (void *)v121;
      uint64_t v111 = v114;
    }
    else
    {
      id v12 = v127;
      v93 = v128;
      if (!v128) {
        goto LABEL_83;
      }
      v119 = v23;
      id v124 = v11;
      id v98 = objc_alloc((Class)NSError);
      uint64_t v107 = +[NSString stringWithUTF8String:"nfcd"];
      v144[0] = NSLocalizedDescriptionKey;
      v100 = +[NSString stringWithUTF8String:"Tag Error"];
      v145[0] = v100;
      v145[1] = v24;
      id v97 = v24;
      v144[1] = NSUnderlyingErrorKey;
      v144[2] = @"Line";
      v145[2] = &off_10031BFB8;
      v144[3] = @"Method";
      id v101 = [[objc_alloc((Class)NSString) initWithFormat:@"%s", sel_getName(sel)];
      v145[3] = v101;
      v144[4] = NSDebugDescriptionErrorKey;
      v102 = (void *)v107;
      id v103 = [objc_alloc((Class)NSString) initWithFormat:@"%s:%d", sel_getName(sel), 102];
      v145[4] = v103;
      v104 = v145;
      v105 = v144;
      uint64_t v106 = 5;
LABEL_81:
      v108 = +[NSDictionary dictionaryWithObjects:v104 forKeys:v105 count:v106];
      v109 = v98;
      v110 = v102;
      uint64_t v111 = 29;
    }
    id *v93 = [v109 initWithDomain:v110 code:v111 userInfo:v108];

    id v11 = v124;
    v23 = v119;
    v28 = v115;
    id v24 = v97;
LABEL_87:

    BOOL v31 = 0;
    id v78 = obj;
    v76 = obj;
    goto LABEL_88;
  }
  if (v128)
  {
    v118 = v23;
    v25 = v24;
    id v26 = [v24 code];
    id v27 = objc_alloc((Class)NSError);
    v28 = +[NSString stringWithUTF8String:"nfcd"];
    if (v26 == (id)64)
    {
      id v125 = [v25 code];
      v156[0] = NSLocalizedDescriptionKey;
      v29 = v27;
      if ((uint64_t)[v25 code] > 70) {
        uint64_t v30 = 71;
      }
      else {
        uint64_t v30 = (uint64_t)[v25 code];
      }
      v76 = +[NSString stringWithUTF8String:off_100304AB8[v30]];
      v157[0] = v76;
      v157[1] = v25;
      v156[1] = NSUnderlyingErrorKey;
      v156[2] = @"Line";
      v157[2] = &off_10031BF58;
      v156[3] = @"Method";
      id v91 = [[objc_alloc((Class)NSString) initWithFormat:@"%s", sel_getName(sel)];
      v157[3] = v91;
      v156[4] = NSDebugDescriptionErrorKey;
      id v78 = [objc_alloc((Class)NSString) initWithFormat:@"%s:%d", sel_getName(sel), 63];
      v157[4] = v78;
      v92 = +[NSDictionary dictionaryWithObjects:v157 forKeys:v156 count:5];
      id *v128 = [v29 initWithDomain:v28 code:v125 userInfo:v92];
      v80 = v91;

      id v24 = v25;
      BOOL v31 = 0;
      v23 = v118;
    }
    else
    {
      v154[0] = NSLocalizedDescriptionKey;
      v76 = +[NSString stringWithUTF8String:"Tag Error"];
      v155[0] = v76;
      v155[1] = v25;
      v154[1] = NSUnderlyingErrorKey;
      v154[2] = @"Line";
      v155[2] = &off_10031BF70;
      v154[3] = @"Method";
      id v77 = [objc_alloc((Class)NSString) initWithFormat:@"%s", sel_getName(sel)];
      v155[3] = v77;
      v154[4] = NSDebugDescriptionErrorKey;
      id v78 = [objc_alloc((Class)NSString) initWithFormat:@"%s:%d", sel_getName(sel), 65];
      v155[4] = v78;
      v79 = +[NSDictionary dictionaryWithObjects:v155 forKeys:v154 count:5];
      id *v128 = [v27 initWithDomain:v28 code:29 userInfo:v79];
      v80 = v77;

      BOOL v31 = 0;
      v23 = v118;
      id v24 = v25;
    }
    goto LABEL_89;
  }
  BOOL v31 = 0;
LABEL_90:

LABEL_13:
  return v31;
}

- (BOOL)activateTag:(id)a3 outError:(id *)a4
{
  id v7 = a3;
  id v8 = [objc_alloc((Class)NSData) initWithBytes:&qword_1002840C5 length:9];
  v9 = [(_NFReaderSession *)self driverWrapper];
  v10 = [(_NFReaderSession *)self whitelistChecker];
  [v10 sessionTimeLimit];
  id v31 = 0;
  id v11 = sub_100195A20(v9, v8, v7, &v31);

  id v12 = v31;
  if (v12)
  {
    if (a4)
    {
      id v13 = [v12 code];
      id v14 = objc_alloc((Class)NSError);
      v15 = +[NSString stringWithUTF8String:"nfcd"];
      if (v13 == (id)64)
      {
        id v30 = [v12 code];
        v38[0] = NSLocalizedDescriptionKey;
        if ((uint64_t)[v12 code] > 70) {
          uint64_t v16 = 71;
        }
        else {
          uint64_t v16 = (uint64_t)[v12 code];
        }
        unsigned __int8 v19 = +[NSString stringWithUTF8String:off_100304AB8[v16]];
        v39[0] = v19;
        v39[1] = v12;
        v38[1] = NSUnderlyingErrorKey;
        v38[2] = @"Line";
        v39[2] = &off_10031BFE8;
        v38[3] = @"Method";
        id v20 = [objc_alloc((Class)NSString) initWithFormat:@"%s", sel_getName(a2)];
        v39[3] = v20;
        v38[4] = NSDebugDescriptionErrorKey;
        id v21 = [objc_alloc((Class)NSString) initWithFormat:@"%s:%d", sel_getName(a2), 138];
        v39[4] = v21;
        v25 = +[NSDictionary dictionaryWithObjects:v39 forKeys:v38 count:5];
        id v26 = v14;
        id v27 = v15;
        uint64_t v28 = (uint64_t)v30;
        goto LABEL_17;
      }
      v36[0] = NSLocalizedDescriptionKey;
      unsigned __int8 v19 = +[NSString stringWithUTF8String:"Tag Error"];
      v37[0] = v19;
      v37[1] = v12;
      v36[1] = NSUnderlyingErrorKey;
      v36[2] = @"Line";
      v37[2] = &off_10031C000;
      v36[3] = @"Method";
      id v20 = [objc_alloc((Class)NSString) initWithFormat:@"%s", sel_getName(a2)];
      v37[3] = v20;
      v36[4] = NSDebugDescriptionErrorKey;
      id v21 = [objc_alloc((Class)NSString) initWithFormat:@"%s:%d", sel_getName(a2), 140];
      v37[4] = v21;
      v22 = v37;
      v23 = v36;
      uint64_t v24 = 5;
LABEL_14:
      v25 = +[NSDictionary dictionaryWithObjects:v22 forKeys:v23 count:v24];
      id v26 = v14;
      id v27 = v15;
      uint64_t v28 = 29;
LABEL_17:
      *a4 = [v26 initWithDomain:v27 code:v28 userInfo:v25];
    }
LABEL_18:
    BOOL v18 = 0;
    goto LABEL_19;
  }
  if (![v11 length])
  {
    if (!a4) {
      goto LABEL_18;
    }
    id v14 = objc_alloc((Class)NSError);
    v15 = +[NSString stringWithUTF8String:"nfcd"];
    v34[0] = NSLocalizedDescriptionKey;
    unsigned __int8 v19 = +[NSString stringWithUTF8String:"Tag Error"];
    v35[0] = v19;
    v35[1] = &off_10031C018;
    v34[1] = @"Line";
    v34[2] = @"Method";
    id v20 = [objc_alloc((Class)NSString) initWithFormat:@"%s", sel_getName(a2)];
    v35[2] = v20;
    v34[3] = NSDebugDescriptionErrorKey;
    id v21 = [objc_alloc((Class)NSString) initWithFormat:@"%s:%d", sel_getName(a2), 143];
    v35[3] = v21;
    v22 = v35;
    v23 = v34;
LABEL_13:
    uint64_t v24 = 4;
    goto LABEL_14;
  }
  int v17 = *(unsigned __int8 *)[v11 bytes];
  BOOL v18 = v17 == 8;
  if (a4 && v17 != 8)
  {
    id v14 = objc_alloc((Class)NSError);
    v15 = +[NSString stringWithUTF8String:"nfcd"];
    v32[0] = NSLocalizedDescriptionKey;
    unsigned __int8 v19 = +[NSString stringWithUTF8String:"Tag Error"];
    v33[0] = v19;
    v33[1] = &off_10031C030;
    v32[1] = @"Line";
    v32[2] = @"Method";
    id v20 = [objc_alloc((Class)NSString) initWithFormat:@"%s", sel_getName(a2)];
    v33[2] = v20;
    v32[3] = NSDebugDescriptionErrorKey;
    id v21 = [objc_alloc((Class)NSString) initWithFormat:@"%s:%d", sel_getName(a2), 152];
    v33[3] = v21;
    v22 = v33;
    v23 = v32;
    goto LABEL_13;
  }
LABEL_19:

  return v18;
}

- (id)getPermissible7816AppsFromInfoPlist:(id)a3
{
  id v4 = a3;
  id v115 = (id)objc_opt_new();
  v5 = [v4 objectForKey:@"com.apple.developer.nfc.readersession.iso7816.select-identifiers"];
  if (v5)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v114 = v5;
      long long v118 = 0u;
      long long v119 = 0u;
      long long v120 = 0u;
      long long v121 = 0u;
      id obj = v5;
      id v6 = [obj countByEnumeratingWithState:&v118 objects:v122 count:16];
      if (!v6) {
        goto LABEL_115;
      }
      id v7 = v6;
      uint64_t v8 = *(void *)v119;
      p_cache = NFAssertSuppressPresentmentIntentToDefaultApp.cache;
      while (1)
      {
        v10 = 0;
        do
        {
          if (*(void *)v119 != v8) {
            objc_enumerationMutation(obj);
          }
          id v11 = *(NSObject **)(*((void *)&v118 + 1) + 8 * (void)v10);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
            uint64_t Logger = NFLogGetLogger();
            if (Logger)
            {
              id v26 = (void (*)(uint64_t, const char *, ...))Logger;
              Class = object_getClass(self);
              BOOL isMetaClass = class_isMetaClass(Class);
              ClassName = object_getClassName(self);
              Name = sel_getName(a2);
              uint64_t v29 = 45;
              if (isMetaClass) {
                uint64_t v29 = 43;
              }
              v26(5, "%c[%{public}s %{public}s]:%i Invalid identifier type: %{public}@", v29, ClassName, Name, 78, v11);
            }
            dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
            id v12 = NFSharedLogGetLogger();
            if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
            {
              id v30 = object_getClass(self);
              if (class_isMetaClass(v30)) {
                int v31 = 43;
              }
              else {
                int v31 = 45;
              }
              v32 = object_getClassName(self);
              v33 = sel_getName(a2);
              *(_DWORD *)buf = 67110146;
              int v124 = v31;
              __int16 v125 = 2082;
              v126 = v32;
              __int16 v127 = 2082;
              v128 = v33;
              __int16 v129 = 1024;
              int v130 = 78;
              __int16 v131 = 2114;
              unsigned __int8 v132 = v11;
              _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Invalid identifier type: %{public}@", buf, 0x2Cu);
            }
            goto LABEL_99;
          }
          id v12 = v11;
          if (self)
          {
            id v13 = NFSharedSignpostLog();
            if (os_signpost_enabled(v13))
            {
              *(_WORD *)buf = 0;
              _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v13, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "_validateInfoPlistSelectIdentifier", (const char *)&unk_100286819, buf, 2u);
            }

            if ((char *)[v12 lengthOfBytesUsingEncoding:4] - 33 <= (char *)0xFFFFFFFFFFFFFFDFLL)
            {
              dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
              uint64_t v14 = NFLogGetLogger();
              if (v14)
              {
                v15 = (void (*)(uint64_t, const char *, ...))v14;
                uint64_t v16 = object_getClass(self);
                BOOL v17 = class_isMetaClass(v16);
                uint64_t v99 = object_getClassName(self);
                uint64_t v106 = sel_getName("_validateInfoPlistSelectIdentifier:");
                uint64_t v18 = 45;
                if (v17) {
                  uint64_t v18 = 43;
                }
                v15(5, "%c[%{public}s %{public}s]:%i Invalid AID length: %{public}@", v18, v99, v106, 164, v12);
              }
              dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
              unsigned __int8 v19 = NFSharedLogGetLogger();
              if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
              {
                id v20 = object_getClass(self);
                if (class_isMetaClass(v20)) {
                  int v21 = 43;
                }
                else {
                  int v21 = 45;
                }
                v22 = object_getClassName(self);
                v23 = sel_getName("_validateInfoPlistSelectIdentifier:");
                *(_DWORD *)buf = 67110146;
                int v124 = v21;
                __int16 v125 = 2082;
                v126 = v22;
                __int16 v127 = 2082;
                v128 = v23;
                __int16 v129 = 1024;
                int v130 = 164;
                __int16 v131 = 2114;
                unsigned __int8 v132 = v12;
                _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Invalid AID length: %{public}@", buf, 0x2Cu);
              }

              uint64_t v24 = NFSharedSignpostLog();
              if (os_signpost_enabled(v24))
              {
                *(_WORD *)buf = 0;
                _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v24, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "_validateInfoPlistSelectIdentifier", (const char *)&unk_100286819, buf, 2u);
              }
              goto LABEL_98;
            }
            v34 = [v12 uppercaseString];

            if ([p_cache + 393 findAID:v34 filterType:3])
            {
              dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
              uint64_t v35 = NFLogGetLogger();
              if (v35)
              {
                v36 = (void (*)(uint64_t, const char *, ...))v35;
                v37 = object_getClass(self);
                BOOL v38 = class_isMetaClass(v37);
                id v101 = object_getClassName(self);
                v108 = sel_getName("_validateInfoPlistSelectIdentifier:");
                uint64_t v39 = 45;
                if (v38) {
                  uint64_t v39 = 43;
                }
                v36(5, "%c[%{public}s %{public}s]:%i PACE app identifier: %{public}@", v39, v101, v108, 174, v34);
              }
              dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
              v40 = NFSharedLogGetLogger();
              if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
              {
                v41 = object_getClass(self);
                if (class_isMetaClass(v41)) {
                  int v42 = 43;
                }
                else {
                  int v42 = 45;
                }
                v43 = object_getClassName(self);
                v44 = sel_getName("_validateInfoPlistSelectIdentifier:");
                *(_DWORD *)buf = 67110146;
                int v124 = v42;
                __int16 v125 = 2082;
                v126 = v43;
                __int16 v127 = 2082;
                v128 = v44;
                __int16 v129 = 1024;
                int v130 = 174;
                __int16 v131 = 2114;
                unsigned __int8 v132 = v34;
                _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i PACE app identifier: %{public}@", buf, 0x2Cu);
              }

              id v45 = NFSharedSignpostLog();
              if (os_signpost_enabled(v45))
              {
                *(_WORD *)buf = 0;
                _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v45, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "_validateInfoPlistSelectIdentifier", (const char *)&unk_100286819, buf, 2u);
              }
              uint64_t v46 = 2;
LABEL_59:

              if (![(_NFReaderSession *)self _isAIDStringValid:v12]) {
                goto LABEL_100;
              }
              id v12 = +[NSData NF_dataWithHexString:v12];
              uint64_t v24 = +[NF7816App appWithAid:v12 type:v46];
              [v115 addObject:v24];
              goto LABEL_98;
            }
            if ([p_cache + 393 findAID:v34 filterType:4])
            {
              dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
              uint64_t v47 = NFLogGetLogger();
              if (v47)
              {
                id v48 = (void (*)(uint64_t, const char *, ...))v47;
                id v49 = object_getClass(self);
                BOOL v50 = class_isMetaClass(v49);
                v102 = object_getClassName(self);
                v109 = sel_getName("_validateInfoPlistSelectIdentifier:");
                uint64_t v51 = 45;
                if (v50) {
                  uint64_t v51 = 43;
                }
                v48(5, "%c[%{public}s %{public}s]:%i PRCID app identifier: %{public}@", v51, v102, v109, 181, v34);
              }
              dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
              uint64_t v52 = NFSharedLogGetLogger();
              if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
              {
                v53 = object_getClass(self);
                if (class_isMetaClass(v53)) {
                  int v54 = 43;
                }
                else {
                  int v54 = 45;
                }
                BOOL v55 = object_getClassName(self);
                v56 = sel_getName("_validateInfoPlistSelectIdentifier:");
                *(_DWORD *)buf = 67110146;
                int v124 = v54;
                __int16 v125 = 2082;
                v126 = v55;
                __int16 v127 = 2082;
                v128 = v56;
                __int16 v129 = 1024;
                int v130 = 181;
                __int16 v131 = 2114;
                unsigned __int8 v132 = v34;
                _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i PRCID app identifier: %{public}@", buf, 0x2Cu);
              }

              id v45 = NFSharedSignpostLog();
              if (os_signpost_enabled(v45))
              {
                *(_WORD *)buf = 0;
                _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v45, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "_validateInfoPlistSelectIdentifier", (const char *)&unk_100286819, buf, 2u);
              }
              uint64_t v46 = 3;
              goto LABEL_59;
            }
            if ([p_cache + 393 findAID:v34 filterType:0])
            {
              dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
              uint64_t v57 = NFLogGetLogger();
              if (v57)
              {
                v58 = (void (*)(uint64_t, const char *, ...))v57;
                v59 = object_getClass(self);
                BOOL v60 = class_isMetaClass(v59);
                id v103 = object_getClassName(self);
                v110 = sel_getName("_validateInfoPlistSelectIdentifier:");
                uint64_t v61 = 45;
                if (v60) {
                  uint64_t v61 = 43;
                }
                v58(5, "%c[%{public}s %{public}s]:%i Non-permissible identifier: %{public}@", v61, v103, v110, 188, v34);
              }
              dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
              v62 = NFSharedLogGetLogger();
              if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
              {
                id v63 = object_getClass(self);
                if (class_isMetaClass(v63)) {
                  int v64 = 43;
                }
                else {
                  int v64 = 45;
                }
                v65 = object_getClassName(self);
                v66 = sel_getName("_validateInfoPlistSelectIdentifier:");
                *(_DWORD *)buf = 67110146;
                int v124 = v64;
                __int16 v125 = 2082;
                v126 = v65;
                __int16 v127 = 2082;
                v128 = v66;
                __int16 v129 = 1024;
                int v130 = 188;
                __int16 v131 = 2114;
                unsigned __int8 v132 = v34;
                _os_log_impl((void *)&_mh_execute_header, v62, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Non-permissible identifier: %{public}@", buf, 0x2Cu);
              }

              uint64_t v24 = NFSharedSignpostLog();
              if (os_signpost_enabled(v24)) {
                goto LABEL_96;
              }
LABEL_97:
              id v12 = v34;
LABEL_98:

              goto LABEL_99;
            }
            if ([p_cache + 393 findAID:v34 filterType:1])
            {
              dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
              uint64_t v67 = NFLogGetLogger();
              if (v67)
              {
                v68 = (void (*)(uint64_t, const char *, ...))v67;
                id v69 = object_getClass(self);
                BOOL v70 = class_isMetaClass(v69);
                v104 = object_getClassName(self);
                uint64_t v111 = sel_getName("_validateInfoPlistSelectIdentifier:");
                uint64_t v71 = 45;
                if (v70) {
                  uint64_t v71 = 43;
                }
                v68(5, "%c[%{public}s %{public}s]:%i Non-permissible identifier: %{public}@", v71, v104, v111, 194, v34);
              }
              dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
              uint64_t v72 = NFSharedLogGetLogger();
              if (os_log_type_enabled(v72, OS_LOG_TYPE_DEFAULT))
              {
                v73 = object_getClass(self);
                if (class_isMetaClass(v73)) {
                  int v74 = 43;
                }
                else {
                  int v74 = 45;
                }
                v75 = object_getClassName(self);
                v76 = sel_getName("_validateInfoPlistSelectIdentifier:");
                *(_DWORD *)buf = 67110146;
                int v124 = v74;
                __int16 v125 = 2082;
                v126 = v75;
                __int16 v127 = 2082;
                v128 = v76;
                __int16 v129 = 1024;
                int v130 = 194;
                __int16 v131 = 2114;
                unsigned __int8 v132 = v34;
                _os_log_impl((void *)&_mh_execute_header, v72, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Non-permissible identifier: %{public}@", buf, 0x2Cu);
              }

              uint64_t v24 = NFSharedSignpostLog();
              if (!os_signpost_enabled(v24)) {
                goto LABEL_97;
              }
            }
            else
            {
              unsigned int v77 = [p_cache + 393 findAID:v34 filterType:2];
              dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
              uint64_t v78 = NFLogGetLogger();
              v79 = (void (*)(uint64_t, const char *, ...))v78;
              if (!v77)
              {
                if (v78)
                {
                  v88 = object_getClass(self);
                  BOOL v89 = class_isMetaClass(v88);
                  v90 = object_getClassName(self);
                  v113 = sel_getName("_validateInfoPlistSelectIdentifier:");
                  uint64_t v91 = 45;
                  if (v89) {
                    uint64_t v91 = 43;
                  }
                  v79(5, "%c[%{public}s %{public}s]:%i Regular", v91, v90, v113, 207);
                }
                dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
                v92 = NFSharedLogGetLogger();
                if (os_log_type_enabled(v92, OS_LOG_TYPE_DEFAULT))
                {
                  v93 = object_getClass(self);
                  if (class_isMetaClass(v93)) {
                    int v94 = 43;
                  }
                  else {
                    int v94 = 45;
                  }
                  id v95 = object_getClassName(self);
                  uint64_t v96 = sel_getName("_validateInfoPlistSelectIdentifier:");
                  *(_DWORD *)buf = 67109890;
                  int v124 = v94;
                  __int16 v125 = 2082;
                  v126 = v95;
                  __int16 v127 = 2082;
                  v128 = v96;
                  __int16 v129 = 1024;
                  int v130 = 207;
                  _os_log_impl((void *)&_mh_execute_header, v92, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Regular", buf, 0x22u);
                }

                id v45 = NFSharedSignpostLog();
                if (os_signpost_enabled(v45))
                {
                  *(_WORD *)buf = 0;
                  _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v45, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "_validateInfoPlistSelectIdentifier", (const char *)&unk_100286819, buf, 2u);
                }
                uint64_t v46 = 1;
                goto LABEL_59;
              }
              if (v78)
              {
                v80 = object_getClass(self);
                BOOL v81 = class_isMetaClass(v80);
                v105 = object_getClassName(self);
                v112 = sel_getName("_validateInfoPlistSelectIdentifier:");
                uint64_t v82 = 45;
                if (v81) {
                  uint64_t v82 = 43;
                }
                v79(5, "%c[%{public}s %{public}s]:%i Non-permissible identifier: %{public}@", v82, v105, v112, 201, v34);
              }
              dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
              v83 = NFSharedLogGetLogger();
              if (os_log_type_enabled(v83, OS_LOG_TYPE_DEFAULT))
              {
                id v84 = object_getClass(self);
                if (class_isMetaClass(v84)) {
                  int v85 = 43;
                }
                else {
                  int v85 = 45;
                }
                v86 = object_getClassName(self);
                v87 = sel_getName("_validateInfoPlistSelectIdentifier:");
                *(_DWORD *)buf = 67110146;
                int v124 = v85;
                __int16 v125 = 2082;
                v126 = v86;
                __int16 v127 = 2082;
                v128 = v87;
                __int16 v129 = 1024;
                int v130 = 201;
                __int16 v131 = 2114;
                unsigned __int8 v132 = v34;
                _os_log_impl((void *)&_mh_execute_header, v83, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Non-permissible identifier: %{public}@", buf, 0x2Cu);
              }

              uint64_t v24 = NFSharedSignpostLog();
              if (!os_signpost_enabled(v24)) {
                goto LABEL_97;
              }
            }
LABEL_96:
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v24, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "_validateInfoPlistSelectIdentifier", (const char *)&unk_100286819, buf, 2u);
            goto LABEL_97;
          }
LABEL_99:

LABEL_100:
          v10 = (char *)v10 + 1;
          p_cache = (void **)(NFAssertSuppressPresentmentIntentToDefaultApp + 16);
        }
        while (v7 != v10);
        id v97 = [obj countByEnumeratingWithState:&v118 objects:v122 count:16];
        id v7 = v97;
        if (!v97)
        {
LABEL_115:

          v5 = v114;
          break;
        }
      }
    }
  }

  return v115;
}

- (id)getPermissibleFelicaSystemCodeFromInfoPlist:(id)a3
{
  id v5 = a3;
  id v53 = (id)objc_opt_new();
  id v6 = [v5 objectForKeyedSubscript:@"com.apple.developer.nfc.readersession.felica.systemcodes"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v51 = v6;
    id v52 = v5;
    long long v57 = 0u;
    long long v58 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    id obj = v6;
    id v7 = [obj countByEnumeratingWithState:&v55 objects:v69 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v56;
      do
      {
        v10 = 0;
        do
        {
          if (*(void *)v56 != v9) {
            objc_enumerationMutation(obj);
          }
          id v11 = *(NSObject **)(*((void *)&v55 + 1) + 8 * (void)v10);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v12 = v11;
            if (([v12 length] & 1) == 0
              && [v12 length] == (id)4
              && [v12 compare:@"FF", 1, 0, 2 options range]
              && [v12 compare:@"FF", 1, 2, 2 options range])
            {
              uint64_t v13 = +[NSData NF_dataWithHexString:v12];
              if (v13)
              {
                uint64_t v14 = v13;
                [v53 addObject:v13];
              }
              else
              {
                dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
                uint64_t Logger = NFLogGetLogger();
                if (Logger)
                {
                  v34 = (void (*)(uint64_t, const char *, ...))Logger;
                  Class = object_getClass(self);
                  BOOL isMetaClass = class_isMetaClass(Class);
                  ClassName = object_getClassName(self);
                  Name = sel_getName(a2);
                  uint64_t v37 = 45;
                  if (isMetaClass) {
                    uint64_t v37 = 43;
                  }
                  v34(3, "%c[%{public}s %{public}s]:%i Invalid AID entry: %{public}@", v37, ClassName, Name, 120, 0);
                }
                dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
                BOOL v38 = NFSharedLogGetLogger();
                if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
                {
                  uint64_t v39 = object_getClass(self);
                  if (class_isMetaClass(v39)) {
                    int v40 = 43;
                  }
                  else {
                    int v40 = 45;
                  }
                  v41 = object_getClassName(self);
                  int v42 = sel_getName(a2);
                  *(_DWORD *)buf = 67110146;
                  int v60 = v40;
                  __int16 v61 = 2082;
                  v62 = v41;
                  __int16 v63 = 2082;
                  int v64 = v42;
                  __int16 v65 = 1024;
                  int v66 = 120;
                  __int16 v67 = 2114;
                  v68 = 0;
                  _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Invalid AID entry: %{public}@", buf, 0x2Cu);
                }

                uint64_t v14 = 0;
              }
            }
            else
            {
              dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
              uint64_t v24 = NFLogGetLogger();
              if (v24)
              {
                v25 = (void (*)(uint64_t, const char *, ...))v24;
                id v26 = object_getClass(self);
                BOOL v27 = class_isMetaClass(v26);
                uint64_t v46 = object_getClassName(self);
                id v49 = sel_getName(a2);
                uint64_t v28 = 45;
                if (v27) {
                  uint64_t v28 = 43;
                }
                v25(3, "%c[%{public}s %{public}s]:%i Invalid system code entry: %{public}@", v28, v46, v49, 112, v12);
              }
              dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
              uint64_t v14 = NFSharedLogGetLogger();
              if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
              {
                uint64_t v29 = object_getClass(self);
                if (class_isMetaClass(v29)) {
                  int v30 = 43;
                }
                else {
                  int v30 = 45;
                }
                int v31 = object_getClassName(self);
                v32 = sel_getName(a2);
                *(_DWORD *)buf = 67110146;
                int v60 = v30;
                __int16 v61 = 2082;
                v62 = v31;
                __int16 v63 = 2082;
                int v64 = v32;
                __int16 v65 = 1024;
                int v66 = 112;
                __int16 v67 = 2114;
                v68 = v12;
                _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Invalid system code entry: %{public}@", buf, 0x2Cu);
              }
            }
          }
          else
          {
            dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
            uint64_t v15 = NFLogGetLogger();
            if (v15)
            {
              uint64_t v16 = (void (*)(uint64_t, const char *, ...))v15;
              BOOL v17 = object_getClass(self);
              BOOL v18 = class_isMetaClass(v17);
              id v45 = object_getClassName(self);
              id v48 = sel_getName(a2);
              uint64_t v19 = 45;
              if (v18) {
                uint64_t v19 = 43;
              }
              v16(5, "%c[%{public}s %{public}s]:%i Invalid identifier type: %{public}@", v19, v45, v48, 101, v11);
            }
            dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
            id v12 = NFSharedLogGetLogger();
            if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
            {
              id v20 = object_getClass(self);
              if (class_isMetaClass(v20)) {
                int v21 = 43;
              }
              else {
                int v21 = 45;
              }
              v22 = object_getClassName(self);
              v23 = sel_getName(a2);
              *(_DWORD *)buf = 67110146;
              int v60 = v21;
              __int16 v61 = 2082;
              v62 = v22;
              __int16 v63 = 2082;
              int v64 = v23;
              __int16 v65 = 1024;
              int v66 = 101;
              __int16 v67 = 2114;
              v68 = v11;
              _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Invalid identifier type: %{public}@", buf, 0x2Cu);
            }
          }

          v10 = (char *)v10 + 1;
        }
        while (v8 != v10);
        id v43 = [obj countByEnumeratingWithState:&v55 objects:v69 count:16];
        id v8 = v43;
      }
      while (v43);
    }

    id v6 = v51;
    id v5 = v52;
  }

  return v53;
}

- (BOOL)_isAIDStringValid:(id)a3
{
  id v5 = a3;
  id v6 = +[NSCharacterSet characterSetWithCharactersInString:@"0123456789ABCDEF"];
  id v7 = [v5 uppercaseString];

  if ((unint64_t)[v7 length] <= 9)
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      uint64_t v9 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      uint64_t v12 = 45;
      if (isMetaClass) {
        uint64_t v12 = 43;
      }
      v9(5, "%c[%{public}s %{public}s]:%i Identifier string does not meet the minimum required length, %{public}@", v12, ClassName, Name, 137, v7);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v13 = NFSharedLogGetLogger();
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_37;
    }
    uint64_t v14 = object_getClass(self);
    if (class_isMetaClass(v14)) {
      int v15 = 43;
    }
    else {
      int v15 = 45;
    }
    *(_DWORD *)buf = 67110146;
    int v41 = v15;
    __int16 v42 = 2082;
    id v43 = object_getClassName(self);
    __int16 v44 = 2082;
    id v45 = sel_getName(a2);
    __int16 v46 = 1024;
    int v47 = 137;
    __int16 v48 = 2114;
    id v49 = v7;
    uint64_t v16 = "%c[%{public}s %{public}s]:%i Identifier string does not meet the minimum required length, %{public}@";
LABEL_36:
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, v16, buf, 0x2Cu);
LABEL_37:

    unsigned __int8 v25 = 0;
    goto LABEL_38;
  }
  if ((unint64_t)[v7 length] >= 0x21)
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v17 = NFLogGetLogger();
    if (v17)
    {
      BOOL v18 = (void (*)(uint64_t, const char *, ...))v17;
      uint64_t v19 = object_getClass(self);
      BOOL v20 = class_isMetaClass(v19);
      uint64_t v35 = object_getClassName(self);
      BOOL v38 = sel_getName(a2);
      uint64_t v21 = 45;
      if (v20) {
        uint64_t v21 = 43;
      }
      v18(5, "%c[%{public}s %{public}s]:%i Identifier string exceeds the maximum length, %{public}@", v21, v35, v38, 140, v7);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v13 = NFSharedLogGetLogger();
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_37;
    }
    v22 = object_getClass(self);
    if (class_isMetaClass(v22)) {
      int v23 = 43;
    }
    else {
      int v23 = 45;
    }
    *(_DWORD *)buf = 67110146;
    int v41 = v23;
    __int16 v42 = 2082;
    id v43 = object_getClassName(self);
    __int16 v44 = 2082;
    id v45 = sel_getName(a2);
    __int16 v46 = 1024;
    int v47 = 140;
    __int16 v48 = 2114;
    id v49 = v7;
    uint64_t v16 = "%c[%{public}s %{public}s]:%i Identifier string exceeds the maximum length, %{public}@";
    goto LABEL_36;
  }
  if ([v7 length])
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v26 = NFLogGetLogger();
    if (v26)
    {
      BOOL v27 = (void (*)(uint64_t, const char *, ...))v26;
      uint64_t v28 = object_getClass(self);
      BOOL v29 = class_isMetaClass(v28);
      v36 = object_getClassName(self);
      uint64_t v39 = sel_getName(a2);
      uint64_t v30 = 45;
      if (v29) {
        uint64_t v30 = 43;
      }
      v27(5, "%c[%{public}s %{public}s]:%i Invalid AID entry: %{public}@", v30, v36, v39, 143, v7);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v13 = NFSharedLogGetLogger();
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_37;
    }
    int v31 = object_getClass(self);
    if (class_isMetaClass(v31)) {
      int v32 = 43;
    }
    else {
      int v32 = 45;
    }
    *(_DWORD *)buf = 67110146;
    int v41 = v32;
    __int16 v42 = 2082;
    id v43 = object_getClassName(self);
    __int16 v44 = 2082;
    id v45 = sel_getName(a2);
    __int16 v46 = 1024;
    int v47 = 143;
    __int16 v48 = 2114;
    id v49 = v7;
    uint64_t v16 = "%c[%{public}s %{public}s]:%i Invalid AID entry: %{public}@";
    goto LABEL_36;
  }
  if ([v7 length])
  {
    unint64_t v24 = 0;
    do
    {
      unsigned __int8 v25 = [v6 characterIsMember:[v7 characterAtIndex:v24]];
      if ((v25 & 1) == 0) {
        break;
      }
      ++v24;
    }
    while (v24 < (unint64_t)[v7 length]);
  }
  else
  {
    unsigned __int8 v25 = 1;
  }
LABEL_38:

  return v25;
}

- (int64_t)validateAID:(id)a3 allowsPrefixMatch:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  long long v108 = 0u;
  long long v109 = 0u;
  long long v110 = 0u;
  long long v111 = 0u;
  id v7 = [(_NFReaderSession *)self iso7816AppList];
  int64_t v8 = (int64_t)[v7 countByEnumeratingWithState:&v108 objects:v112 count:16];
  uint64_t v107 = self;
  if (!v8)
  {
    int v21 = 0;
    goto LABEL_18;
  }
  uint64_t v9 = *(void *)v109;
  while (2)
  {
    for (uint64_t i = 0; i != v8; ++i)
    {
      if (*(void *)v109 != v9) {
        objc_enumerationMutation(v7);
      }
      id v11 = *(void **)(*((void *)&v108 + 1) + 8 * i);
      uint64_t v12 = [v11 aid];
      unsigned int v13 = [v12 isEqualToData:v6];

      if (v13)
      {
        int64_t v8 = (int64_t)[v11 type];
        goto LABEL_15;
      }
      if (v4)
      {
        id v14 = [v6 length];
        int v15 = [v11 aid];
        id v16 = [v15 length];

        if (v14 > v16)
        {
          uint64_t v17 = [v11 aid];
          BOOL v18 = [v6 subdataWithRange:0, [v17 length]];

          uint64_t v19 = [v11 aid];
          unsigned int v20 = [v19 isEqualToData:v18];

          if (!v20)
          {

            continue;
          }
          int64_t v8 = (int64_t)[v11 type];

LABEL_15:
          int v21 = 1;
          goto LABEL_16;
        }
      }
    }
    int64_t v8 = (int64_t)[v7 countByEnumeratingWithState:&v108 objects:v112 count:16];
    if (v8) {
      continue;
    }
    break;
  }
  int v21 = 0;
LABEL_16:
  self = v107;
LABEL_18:

  v22 = [v6 NF_asHexString];
  if (![(_NFReaderSession *)self _isAIDStringValid:v22])
  {
LABEL_105:
    int64_t v8 = 0;
    goto LABEL_106;
  }
  id v23 = v22;
  unint64_t v24 = v23;
  id v105 = v23;
  if (!self)
  {

    if ((v21 & 1) == 0) {
      goto LABEL_95;
    }
    goto LABEL_106;
  }
  unsigned __int8 v25 = NFSharedSignpostLog();
  if (os_signpost_enabled(v25))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v25, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "isIdentifierPermissible", (const char *)&unk_100286819, buf, 2u);
  }

  uint64_t v26 = [v24 uppercaseString];

  if (!+[NFATLMobileSettings findAID:v26 filterType:3])
  {
    if (+[NFATLMobileSettings findAID:v26 filterType:4])
    {
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      uint64_t Logger = NFLogGetLogger();
      if (Logger)
      {
        int v41 = (void (*)(uint64_t, const char *, ...))Logger;
        Class = object_getClass(v107);
        BOOL isMetaClass = class_isMetaClass(Class);
        ClassName = object_getClassName(v107);
        Name = sel_getName("_isIdentifierPermissible:");
        uint64_t v44 = 45;
        if (isMetaClass) {
          uint64_t v44 = 43;
        }
        v41(5, "%c[%{public}s %{public}s]:%i PRCID app identifier: %{public}@", v44, ClassName, Name, 226, v26);
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      id v45 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v46 = object_getClass(v107);
        if (class_isMetaClass(v46)) {
          int v47 = 43;
        }
        else {
          int v47 = 45;
        }
        __int16 v48 = object_getClassName(v107);
        id v49 = sel_getName("_isIdentifierPermissible:");
        *(_DWORD *)buf = 67110146;
        int v114 = v47;
        __int16 v115 = 2082;
        v116 = v48;
        __int16 v117 = 2082;
        long long v118 = v49;
        __int16 v119 = 1024;
        int v120 = 226;
        __int16 v121 = 2114;
        id v122 = v26;
        _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i PRCID app identifier: %{public}@", buf, 0x2Cu);
      }

      uint64_t v37 = NFSharedSignpostLog();
      if (os_signpost_enabled(v37))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v37, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "isIdentifierPermissible", (const char *)&unk_100286819, buf, 2u);
      }
      int v39 = 0;
      char v50 = 1;
      uint64_t v38 = 3;
      goto LABEL_88;
    }
    if (+[NFATLMobileSettings findAID:v26 filterType:0])
    {
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      uint64_t v51 = NFLogGetLogger();
      if (v51)
      {
        id v52 = (void (*)(uint64_t, const char *, ...))v51;
        id v53 = object_getClass(v107);
        BOOL v54 = class_isMetaClass(v53);
        id v95 = object_getClassName(v107);
        id v101 = sel_getName("_isIdentifierPermissible:");
        uint64_t v55 = 45;
        if (v54) {
          uint64_t v55 = 43;
        }
        v52(5, "%c[%{public}s %{public}s]:%i Non-permissible identifier: %{public}@", v55, v95, v101, 234, v26);
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      long long v56 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
      {
        long long v57 = object_getClass(v107);
        if (class_isMetaClass(v57)) {
          int v58 = 43;
        }
        else {
          int v58 = 45;
        }
        v59 = object_getClassName(v107);
        int v60 = sel_getName("_isIdentifierPermissible:");
        *(_DWORD *)buf = 67110146;
        int v114 = v58;
        __int16 v115 = 2082;
        v116 = v59;
        __int16 v117 = 2082;
        long long v118 = v60;
        __int16 v119 = 1024;
        int v120 = 234;
        __int16 v121 = 2114;
        id v122 = v26;
        _os_log_impl((void *)&_mh_execute_header, v56, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Non-permissible identifier: %{public}@", buf, 0x2Cu);
      }

      uint64_t v37 = NFSharedSignpostLog();
      if (os_signpost_enabled(v37))
      {
        *(_WORD *)buf = 0;
LABEL_85:
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v37, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "_validateInfoPlistSelectIdentifier", (const char *)&unk_100286819, buf, 2u);
      }
    }
    else
    {
      if (!+[NFATLMobileSettings findAID:v26 filterType:1])
      {
        if (!+[NFATLMobileSettings findAID:v26 filterType:2])
        {
          uint64_t v37 = NFSharedSignpostLog();
          if (os_signpost_enabled(v37))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v37, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "isIdentifierPermissible", (const char *)&unk_100286819, buf, 2u);
          }
          int v39 = 0;
          char v50 = 0;
          uint64_t v38 = 0;
          goto LABEL_88;
        }
        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        uint64_t v71 = NFLogGetLogger();
        if (v71)
        {
          uint64_t v72 = (void (*)(uint64_t, const char *, ...))v71;
          v73 = object_getClass(v107);
          BOOL v74 = class_isMetaClass(v73);
          id v97 = object_getClassName(v107);
          id v103 = sel_getName("_isIdentifierPermissible:");
          uint64_t v75 = 45;
          if (v74) {
            uint64_t v75 = 43;
          }
          v72(5, "%c[%{public}s %{public}s]:%i Non-permissible identifier: %{public}@", v75, v97, v103, 247, v26);
        }
        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v76 = NFSharedLogGetLogger();
        if (os_log_type_enabled(v76, OS_LOG_TYPE_DEFAULT))
        {
          unsigned int v77 = object_getClass(v107);
          if (class_isMetaClass(v77)) {
            int v78 = 43;
          }
          else {
            int v78 = 45;
          }
          v79 = object_getClassName(v107);
          v80 = sel_getName("_isIdentifierPermissible:");
          *(_DWORD *)buf = 67110146;
          int v114 = v78;
          __int16 v115 = 2082;
          v116 = v79;
          __int16 v117 = 2082;
          long long v118 = v80;
          __int16 v119 = 1024;
          int v120 = 247;
          __int16 v121 = 2114;
          id v122 = v26;
          _os_log_impl((void *)&_mh_execute_header, v76, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Non-permissible identifier: %{public}@", buf, 0x2Cu);
        }

        uint64_t v37 = NFSharedSignpostLog();
        if (!os_signpost_enabled(v37)) {
          goto LABEL_86;
        }
        *(_WORD *)buf = 0;
        goto LABEL_85;
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      uint64_t v61 = NFLogGetLogger();
      if (v61)
      {
        v62 = (void (*)(uint64_t, const char *, ...))v61;
        __int16 v63 = object_getClass(v107);
        BOOL v64 = class_isMetaClass(v63);
        uint64_t v96 = object_getClassName(v107);
        v102 = sel_getName("_isIdentifierPermissible:");
        uint64_t v65 = 45;
        if (v64) {
          uint64_t v65 = 43;
        }
        v62(5, "%c[%{public}s %{public}s]:%i Non-permissible identifier: %{public}@", v65, v96, v102, 240, v26);
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      int v66 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v66, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v67 = object_getClass(v107);
        if (class_isMetaClass(v67)) {
          int v68 = 43;
        }
        else {
          int v68 = 45;
        }
        id v69 = object_getClassName(v107);
        BOOL v70 = sel_getName("_isIdentifierPermissible:");
        *(_DWORD *)buf = 67110146;
        int v114 = v68;
        __int16 v115 = 2082;
        v116 = v69;
        __int16 v117 = 2082;
        long long v118 = v70;
        __int16 v119 = 1024;
        int v120 = 240;
        __int16 v121 = 2114;
        id v122 = v26;
        _os_log_impl((void *)&_mh_execute_header, v66, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Non-permissible identifier: %{public}@", buf, 0x2Cu);
      }

      uint64_t v37 = NFSharedSignpostLog();
      if (os_signpost_enabled(v37))
      {
        *(_WORD *)buf = 0;
        goto LABEL_85;
      }
    }
LABEL_86:
    int v39 = 1;
    uint64_t v38 = 4;
LABEL_87:
    char v50 = 1;
    goto LABEL_88;
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t v27 = NFLogGetLogger();
  if (v27)
  {
    uint64_t v28 = (void (*)(uint64_t, const char *, ...))v27;
    BOOL v29 = object_getClass(v107);
    BOOL v30 = class_isMetaClass(v29);
    v93 = object_getClassName(v107);
    uint64_t v99 = sel_getName("_isIdentifierPermissible:");
    uint64_t v31 = 45;
    if (v30) {
      uint64_t v31 = 43;
    }
    v28(5, "%c[%{public}s %{public}s]:%i PACE app identifier: %{public}@", v31, v93, v99, 219, v26);
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  int v32 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
  {
    v33 = object_getClass(v107);
    if (class_isMetaClass(v33)) {
      int v34 = 43;
    }
    else {
      int v34 = 45;
    }
    uint64_t v35 = object_getClassName(v107);
    v36 = sel_getName("_isIdentifierPermissible:");
    *(_DWORD *)buf = 67110146;
    int v114 = v34;
    __int16 v115 = 2082;
    v116 = v35;
    __int16 v117 = 2082;
    long long v118 = v36;
    __int16 v119 = 1024;
    int v120 = 219;
    __int16 v121 = 2114;
    id v122 = v26;
    _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i PACE app identifier: %{public}@", buf, 0x2Cu);
  }

  uint64_t v37 = NFSharedSignpostLog();
  if (os_signpost_enabled(v37))
  {
    *(_WORD *)buf = 0;
    uint64_t v38 = 2;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v37, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "isIdentifierPermissible", (const char *)&unk_100286819, buf, 2u);
    int v39 = 0;
    goto LABEL_87;
  }
  int v39 = 0;
  char v50 = 1;
  uint64_t v38 = 2;
LABEL_88:

  if (v21) {
    int64_t v81 = v8;
  }
  else {
    int64_t v81 = v38;
  }
  if (v39) {
    int64_t v8 = 4;
  }
  else {
    int64_t v8 = v81;
  }
  if (((v39 | (v50 | v21)) & 1) == 0)
  {
LABEL_95:
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v82 = NFLogGetLogger();
    if (v82)
    {
      v83 = (void (*)(uint64_t, const char *, ...))v82;
      id v84 = object_getClass(v107);
      BOOL v85 = class_isMetaClass(v84);
      id v98 = object_getClassName(v107);
      v104 = sel_getName(a2);
      uint64_t v86 = 45;
      if (v85) {
        uint64_t v86 = 43;
      }
      v83(5, "%c[%{public}s %{public}s]:%i Non-permissible identifier: %{public}@", v86, v98, v104, 298, v105);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v87 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v87, OS_LOG_TYPE_DEFAULT))
    {
      v88 = object_getClass(v107);
      if (class_isMetaClass(v88)) {
        int v89 = 43;
      }
      else {
        int v89 = 45;
      }
      v90 = object_getClassName(v107);
      uint64_t v91 = sel_getName(a2);
      *(_DWORD *)buf = 67110146;
      int v114 = v89;
      __int16 v115 = 2082;
      v116 = v90;
      __int16 v117 = 2082;
      long long v118 = v91;
      __int16 v119 = 1024;
      int v120 = 298;
      __int16 v121 = 2114;
      id v122 = v105;
      _os_log_impl((void *)&_mh_execute_header, v87, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Non-permissible identifier: %{public}@", buf, 0x2Cu);
    }

    goto LABEL_105;
  }
LABEL_106:

  return v8;
}

- (BOOL)validateSystemCode:(id)a3
{
  id v4 = a3;
  id v5 = [(_NFReaderSession *)self feliCaSystemCodeList];
  unsigned __int8 v6 = [v5 containsObject:v4];

  return v6;
}

- (id)_getFCITemplate:(id)a3
{
  v3 = +[NFTLV TLVWithData:a3];
  id v4 = v3;
  if (v3)
  {
    if ([v3 tag] == 111) {
      v3 = v4;
    }
    else {
      v3 = 0;
    }
  }
  id v5 = v3;

  return v5;
}

- (id)_getApplicationNameFromFciTemplate:(id)a3
{
  v3 = [a3 childWithTag:132];
  id v4 = v3;
  if (v3
    && ([v3 value],
        id v5 = objc_claimAutoreleasedReturnValue(),
        id v6 = [v5 length],
        v5,
        v6))
  {
    id v7 = [v4 value];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (BOOL)validateAID:(id)a3 withSelectResponse:(id)a4 outRealAid:(id *)a5
{
  id v9 = a3;
  id v10 = a4;
  if ((unint64_t)[v9 length] > 4)
  {
    if ((unint64_t)[v10 length] >= 2)
    {
      unsigned int v20 = +[NFResponseAPDU responseWithData:v10];
      if ([v20 status] == 36864
        && ([v20 response],
            int v21 = objc_claimAutoreleasedReturnValue(),
            id v22 = [v21 length],
            v21,
            v22))
      {
        id v23 = [v20 response];
        unint64_t v24 = [(_NFReaderSession *)self _getFCITemplate:v23];
        unsigned __int8 v25 = [(_NFReaderSession *)self _getApplicationNameFromFciTemplate:v24];
        if ([v25 length])
        {
          if (a5) {
            *a5 = v25;
          }
          BOOL v19 = ([(_NFReaderSession *)self validateAID:v25 allowsPrefixMatch:1] & 0xFFFFFFFFFFFFFFFBLL) != 0;
        }
        else
        {
          BOOL v19 = 1;
        }
      }
      else
      {
        BOOL v19 = 1;
      }
    }
    else
    {
      BOOL v19 = 1;
    }
  }
  else
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      uint64_t v12 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      uint64_t v15 = 45;
      if (isMetaClass) {
        uint64_t v15 = 43;
      }
      v12(3, "%c[%{public}s %{public}s]:%i Incorrect length aid=%{public}@", v15, ClassName, Name, 331, v9);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    id v16 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      uint64_t v17 = object_getClass(self);
      if (class_isMetaClass(v17)) {
        int v18 = 43;
      }
      else {
        int v18 = 45;
      }
      *(_DWORD *)buf = 67110146;
      int v30 = v18;
      __int16 v31 = 2082;
      int v32 = object_getClassName(self);
      __int16 v33 = 2082;
      int v34 = sel_getName(a2);
      __int16 v35 = 1024;
      int v36 = 331;
      __int16 v37 = 2114;
      id v38 = v9;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Incorrect length aid=%{public}@", buf, 0x2Cu);
    }

    BOOL v19 = 0;
  }

  return v19;
}

- (_NFReaderSession)initWithRemoteObject:(id)a3 workQueue:(id)a4 expressModeManager:(id)a5 allowsBackgroundMode:(BOOL)a6
{
  return 0;
}

- (_NFReaderSession)initWithRemoteObject:(id)a3 workQueue:(id)a4 whitelist:(id)a5 serviceType:(unint64_t)a6 showSharingUI:(unint64_t)a7 coreNFCSessionType:(unint64_t)a8 scanText:(id)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a9;
  if ([v17 internalAccess]) {
    id v19 = [v17 allowBackgroundedSession];
  }
  else {
    id v19 = 0;
  }
  v34.receiver = self;
  v34.super_class = (Class)_NFReaderSession;
  unsigned int v20 = [(_NFXPCSession *)&v34 initWithRemoteObject:v15 workQueue:v16 expressModeManager:0 allowsBackgroundMode:v19];
  if (v20)
  {
    int v21 = (NFServiceWhitelistChecker *)[v17 copy];
    tagWhiteList = v20->_tagWhiteList;
    v20->_tagWhiteList = v21;

    v20->_uiStateOnInvalidation = 0;
    v20->_sharingUIMode = a7;
    objc_storeStrong((id *)&v20->_initialScanText, a9);
    id v23 = +[NFCALogger sharedCALogger];
    uint64_t v24 = [v23 generateUUID];
    sessionUUID = v20->_sessionUUID;
    v20->_sessionUUID = (NSData *)v24;

    v20->_sessionType = a8;
    v20->_exitReason = 0;
    v20->_serviceType = a6;
    uint64_t v26 = [v17 getAppInfoDictionary];
    [(_NFReaderSession *)v20 _initialize7816AidList:v26];
    id v27 = objc_alloc((Class)NSMutableArray);
    uint64_t v28 = [(_NFReaderSession *)v20 getPermissibleFelicaSystemCodeFromInfoPlist:v26];
    BOOL v29 = (NSMutableArray *)[v27 initWithArray:v28];
    feliCaSystemCodeList = v20->_feliCaSystemCodeList;
    v20->_feliCaSystemCodeList = v29;

    uint64_t v31 = objc_opt_new();
    nonstandard7816TagsFound = v20->_nonstandard7816TagsFound;
    v20->_nonstandard7816TagsFound = (NSMutableArray *)v31;

    v20->_continuousWaveState = 0;
  }

  return v20;
}

- (void)_initialize7816AidList:(id)a3
{
  id v4 = a3;
  id v5 = (NSMutableOrderedSet *)objc_opt_new();
  iso7816AppList = self->_iso7816AppList;
  self->_iso7816AppList = v5;

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v7 = [(NFServiceWhitelistChecker *)self->_tagWhiteList trustedISO7816AidList];
  id v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v9; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        if (![(_NFReaderSession *)self isPRCIDSupported:v12])
        {
          if ([(_NFReaderSession *)self isPaceSupported:v12]) {
            uint64_t v13 = 2;
          }
          else {
            uint64_t v13 = 1;
          }
          id v14 = +[NF7816App appWithAid:v12 type:v13];
          if (v14) {
            [(NSMutableOrderedSet *)self->_iso7816AppList addObject:v14];
          }
        }
      }
      id v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v9);
  }

  id v15 = [(_NFReaderSession *)self getPermissible7816AppsFromInfoPlist:v4];
  [(NSMutableOrderedSet *)self->_iso7816AppList addObjectsFromArray:v15];
}

- (BOOL)uiShown
{
  return self->_uiService != 0;
}

- (void)setUiInvalidationHandler:(id)a3
{
  id v4 = objc_retainBlock(a3);
  id uiInvalidationHandler = self->_uiInvalidationHandler;
  self->_id uiInvalidationHandler = v4;

  _objc_release_x1(v4, uiInvalidationHandler);
}

- (void)clearUIControllerInvalidationHandler
{
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    id v5 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    uint64_t v10 = [(_NFSession *)self sessionUID];
    uint64_t v11 = 45;
    if (isMetaClass) {
      uint64_t v11 = 43;
    }
    v5(6, "%c[%{public}s %{public}s]:%i Clearing Invalidation Handler on session %@", v11, ClassName, Name, 179, v10);
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t v12 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v13 = object_getClass(self);
    if (class_isMetaClass(v13)) {
      int v14 = 43;
    }
    else {
      int v14 = 45;
    }
    id v15 = object_getClassName(self);
    long long v16 = sel_getName(a2);
    long long v17 = [(_NFSession *)self sessionUID];
    *(_DWORD *)buf = 67110146;
    int v21 = v14;
    __int16 v22 = 2082;
    id v23 = v15;
    __int16 v24 = 2082;
    unsigned __int8 v25 = v16;
    __int16 v26 = 1024;
    int v27 = 179;
    __int16 v28 = 2112;
    BOOL v29 = v17;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Clearing Invalidation Handler on session %@", buf, 0x2Cu);
  }
  id uiInvalidationHandler = self->_uiInvalidationHandler;
  self->_id uiInvalidationHandler = 0;

  [(NFUIService *)self->_uiService coreNFCUISetInvalidationHandler:0];
  [(NFUIService *)self->_uiService disconnect];
  uiService = self->_uiService;
  self->_uiService = 0;

  self->_uiControllerStarted = 0;
}

- (void)activateUIControllerWithCompletion:(id)a3
{
  id v5 = a3;
  if (self->_uiService && self->_uiInvalidationHandler)
  {
    id v6 = self;
    id v7 = [(_NFXPCSession *)v6 remoteObject];
    uiService = self->_uiService;
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_1001B24F8;
    v21[3] = &unk_100306BC0;
    id v9 = v6;
    __int16 v22 = v9;
    id v23 = v9;
    id v24 = v7;
    SEL v25 = a2;
    id v10 = v7;
    [(NFUIService *)uiService coreNFCUISetInvalidationHandler:v21];
    uint64_t v11 = self->_uiService;
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_1001B2DF0;
    v16[3] = &unk_100306C10;
    SEL v20 = a2;
    long long v17 = v9;
    long long v18 = v9;
    id v19 = v5;
    uint64_t v12 = v9;
    [(NFUIService *)v11 coreNFCUIActivateWithCompletion:v16];

    uint64_t v13 = v22;
  }
  else
  {
    id v14 = objc_alloc((Class)NSError);
    id v10 = +[NSString stringWithUTF8String:"nfcd"];
    NSErrorUserInfoKey v26 = NSLocalizedDescriptionKey;
    uint64_t v12 = +[NSString stringWithUTF8String:"Unexpected Result"];
    int v27 = v12;
    uint64_t v13 = +[NSDictionary dictionaryWithObjects:&v27 forKeys:&v26 count:1];
    id v15 = [v14 initWithDomain:v10 code:13 userInfo:v13];
    (*((void (**)(id, id))v5 + 2))(v5, v15);
  }
}

- (BOOL)uiActivated
{
  return self->_uiInvalidationHandler && self->_uiControllerStarted && self->_uiService != 0;
}

- (NFServiceWhitelistChecker)whitelistChecker
{
  return self->_tagWhiteList;
}

- (BOOL)timeLimitedSession
{
  [(NFServiceWhitelistChecker *)self->_tagWhiteList sessionTimeLimit];
  return v2 > 0.0;
}

- (BOOL)willStartSession
{
  sub_1002535C4();
  if (self->_sharingUIMode)
  {
    v3 = (NFUIService *)objc_opt_new();
    uiService = self->_uiService;
    self->_uiService = v3;

    id v5 = [(_NFSession *)self sessionUID];
    [(NFUIService *)self->_uiService setDebugContext:v5];

    unint64_t sharingUIMode = self->_sharingUIMode;
    switch(sharingUIMode)
    {
      case 3uLL:
        [(NFUIService *)self->_uiService coreNFCUISetMode:1];
        self->_uiStateOnInvalidation = 1;
        break;
      case 2uLL:
        id v7 = self->_uiService;
        uint64_t v8 = 2;
        goto LABEL_8;
      case 1uLL:
        id v7 = self->_uiService;
        uint64_t v8 = 1;
LABEL_8:
        [(NFUIService *)v7 coreNFCUISetMode:v8];
        break;
    }
    [(NFUIService *)self->_uiService coreNFCUISetScanText:self->_initialScanText];
  }
  v10.receiver = self;
  v10.super_class = (Class)_NFReaderSession;
  return [(_NFSession *)&v10 willStartSession];
}

- (void)didStartSession:(id)a3
{
  id v5 = a3;
  v37.receiver = self;
  v37.super_class = (Class)_NFReaderSession;
  [(_NFSession *)&v37 didStartSession:v5];
  if (v5)
  {
    id v6 = [(_NFXPCSession *)self remoteObject];
    [v6 didStartSession:v5];
  }
  else
  {
    id v6 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.stockholm"];
    if ([v6 BOOLForKey:@"skipMifareDetection"])
    {
      self->_skipMifareClassification = 1;
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      uint64_t Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
      if (Logger)
      {
        Class = object_getClass(self);
        if (class_isMetaClass(Class)) {
          uint64_t v9 = 43;
        }
        else {
          uint64_t v9 = 45;
        }
        ClassName = object_getClassName(self);
        Name = sel_getName(a2);
        Logger(5, "%c[%{public}s %{public}s]:%i disabling mifare detection", v9, ClassName, Name, 326);
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      uint64_t v12 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v13 = object_getClass(self);
        if (class_isMetaClass(v13)) {
          int v14 = 43;
        }
        else {
          int v14 = 45;
        }
        id v15 = object_getClassName(self);
        long long v16 = sel_getName(a2);
        LODWORD(buf) = 67109890;
        HIDWORD(buf) = v14;
        __int16 v39 = 2082;
        int v40 = v15;
        __int16 v41 = 2082;
        __int16 v42 = v16;
        __int16 v43 = 1024;
        int v44 = 326;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i disabling mifare detection", (uint8_t *)&buf, 0x22u);
      }
    }
    if ([(_NFReaderSession *)self timeLimitedSession])
    {
      objc_initWeak(&buf, self);
      id v17 = objc_alloc((Class)NFTimer);
      v35[0] = _NSConcreteStackBlock;
      v35[1] = 3221225472;
      v35[2] = sub_1001B3920;
      v35[3] = &unk_1003022A0;
      objc_copyWeak(v36, &buf);
      v36[1] = (id)a2;
      long long v18 = [(_NFSession *)self workQueue];
      id v19 = (NFTimer *)[v17 initWithCallback:v35 queue:v18];
      sessionTimer = self->_sessionTimer;
      self->_sessionTimer = v19;

      int v21 = self->_sessionTimer;
      [(NFServiceWhitelistChecker *)self->_tagWhiteList sessionTimeLimit];
      -[NFTimer startTimer:leeway:](v21, "startTimer:leeway:");
      objc_destroyWeak(v36);
      objc_destroyWeak(&buf);
    }
    else
    {
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      __int16 v22 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
      if (v22)
      {
        id v23 = object_getClass(self);
        if (class_isMetaClass(v23)) {
          uint64_t v24 = 43;
        }
        else {
          uint64_t v24 = 45;
        }
        SEL v25 = object_getClassName(self);
        NSErrorUserInfoKey v26 = sel_getName(a2);
        v22(5, "%c[%{public}s %{public}s]:%i Session is not time limited!", v24, v25, v26, 353);
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      int v27 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v28 = object_getClass(self);
        if (class_isMetaClass(v28)) {
          int v29 = 43;
        }
        else {
          int v29 = 45;
        }
        int v30 = object_getClassName(self);
        uint64_t v31 = sel_getName(a2);
        LODWORD(buf) = 67109890;
        HIDWORD(buf) = v29;
        __int16 v39 = 2082;
        int v40 = v30;
        __int16 v41 = 2082;
        __int16 v42 = v31;
        __int16 v43 = 1024;
        int v44 = 353;
        _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Session is not time limited!", (uint8_t *)&buf, 0x22u);
      }
    }
    int v32 = [(_NFXPCSession *)self remoteObject];
    [v32 didStartSession:0];

    __int16 v33 = sub_10023D968();
    objc_super v34 = [(NSData *)self->_sessionUUID NF_asHexString];
    sub_10023E1CC((uint64_t)v33, v34, self->_sessionType);
  }
}

- (void)cleanupUI
{
  if (self->_uiControllerStarted)
  {
    v3 = NFSharedSignpostLog();
    if (os_signpost_enabled(v3))
    {
      int64_t uiStateOnInvalidation = self->_uiStateOnInvalidation;
      int v8 = 134349056;
      int64_t v9 = uiStateOnInvalidation;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v3, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "UIControllerInvalidation", "state=%{public,signpost.description:attribute}ld", (uint8_t *)&v8, 0xCu);
    }

    int64_t v5 = self->_uiStateOnInvalidation;
    if (v5 == 1)
    {
      uiService = self->_uiService;
      uint64_t v7 = 1;
    }
    else
    {
      if (v5 != 2)
      {
LABEL_9:
        [(NFUIService *)self->_uiService coreNFCUIInvalidate];
        return;
      }
      uiService = self->_uiService;
      uint64_t v7 = 0;
    }
    [(NFUIService *)uiService coreNFCUITagScannedCount:v7];
    goto LABEL_9;
  }
}

- (void)cleanup
{
  id v4 = NFSharedSignpostLog();
  if (os_signpost_enabled(v4))
  {
    *(_WORD *)id buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v4, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "cleanup", "_NFReaderSession", buf, 2u);
  }

  if ([(_NFSession *)self needsCleanup] && ![(_NFSession *)self isSuspended])
  {
    int64_t v5 = +[_NFHardwareManager sharedHardwareManager];
    unsigned int v6 = sub_10012B21C(v5);
    currentTag = self->_currentTag;
    if (currentTag)
    {
      sub_1001900C4(self->_driverWrapper, currentTag, 0);
      if ([(NFTag *)self->_currentTag type]) {
        unsigned int v8 = [(NFTag *)self->_currentTag type];
      }
      else {
        unsigned int v8 = sub_10018F854((uint64_t)self->_driverWrapper, self->_currentTag);
      }
      unsigned int v9 = v8;
      objc_super v10 = sub_10023D968();
      sub_10023DAD0((uint64_t)v10, self->_currentTag, v9);

      uint64_t v11 = self->_currentTag;
      self->_currentTag = 0;
    }
    uint64_t v12 = sub_10023D968();
    sub_10023E284((uint64_t)v12, self->_exitReason);

    if (self->_continuousWaveState)
    {
      id v13 = sub_1001EC2F4(self->_driverWrapper, 0);
      self->_continuousWaveState = 0;
    }
    id WeakRetained = objc_loadWeakRetained((id *)&self->_powerConsumptionReporter);
    sub_1001B03F0((uint64_t)WeakRetained, self);

    [v5 notifyReaderModeActivityEnd];
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      long long v16 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      int v21 = [(_NFXPCSession *)self clientName];
      uint64_t v22 = 45;
      if (isMetaClass) {
        uint64_t v22 = 43;
      }
      v16(6, "%c[%{public}s %{public}s]:%i NFC Reader mode terminated: %@", v22, ClassName, Name, 409, v21);
    }
    id v23 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v24 = object_getClass(self);
      if (class_isMetaClass(v24)) {
        int v25 = 43;
      }
      else {
        int v25 = 45;
      }
      NSErrorUserInfoKey v26 = object_getClassName(self);
      int v27 = sel_getName(a2);
      __int16 v28 = [(_NFXPCSession *)self clientName];
      *(_DWORD *)id buf = 67110146;
      int v72 = v25;
      __int16 v73 = 2082;
      BOOL v74 = v26;
      __int16 v75 = 2082;
      v76 = v27;
      __int16 v77 = 1024;
      int v78 = 409;
      __int16 v79 = 2112;
      v80 = v28;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i NFC Reader mode terminated: %@", buf, 0x2Cu);
    }
    int v29 = +[NFRoutingConfig routingOffWithFD:0];
    id v30 = [v5 setRoutingConfig:v29];

    if (self->_didEnableDynamicBBA)
    {
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      uint64_t v31 = NFLogGetLogger();
      if (v31)
      {
        int v32 = (void (*)(uint64_t, const char *, ...))v31;
        __int16 v33 = object_getClass(self);
        BOOL v34 = class_isMetaClass(v33);
        __int16 v35 = object_getClassName(self);
        __int16 v67 = sel_getName(a2);
        uint64_t v36 = 45;
        if (v34) {
          uint64_t v36 = 43;
        }
        v32(6, "%c[%{public}s %{public}s]:%i Disabling dynamic BBA", v36, v35, v67, 417);
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      objc_super v37 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
      {
        id v38 = object_getClass(self);
        if (class_isMetaClass(v38)) {
          int v39 = 43;
        }
        else {
          int v39 = 45;
        }
        int v40 = object_getClassName(self);
        __int16 v41 = sel_getName(a2);
        *(_DWORD *)id buf = 67109890;
        int v72 = v39;
        __int16 v73 = 2082;
        BOOL v74 = v40;
        __int16 v75 = 2082;
        v76 = v41;
        __int16 v77 = 1024;
        int v78 = 417;
        _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Disabling dynamic BBA", buf, 0x22u);
      }

      id v42 = sub_1001E0EB8(self->_driverWrapper);
      self->_didEnableDynamicBBA = 0;
    }
    self->_vasECP = 0;
    self->_isConnectionHandover = 0;
    if (([v5 configureECPPolling:0] & 1) == 0)
    {
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      uint64_t v43 = NFLogGetLogger();
      if (v43)
      {
        int v44 = (void (*)(uint64_t, const char *, ...))v43;
        id v45 = object_getClass(self);
        BOOL v46 = class_isMetaClass(v45);
        int v47 = object_getClassName(self);
        int v68 = sel_getName(a2);
        uint64_t v48 = 45;
        if (v46) {
          uint64_t v48 = 43;
        }
        v44(3, "%c[%{public}s %{public}s]:%i Failed to restore ECP", v48, v47, v68, 427);
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      id v49 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
      {
        char v50 = object_getClass(self);
        if (class_isMetaClass(v50)) {
          int v51 = 43;
        }
        else {
          int v51 = 45;
        }
        id v52 = object_getClassName(self);
        id v53 = sel_getName(a2);
        *(_DWORD *)id buf = 67109890;
        int v72 = v51;
        __int16 v73 = 2082;
        BOOL v74 = v52;
        __int16 v75 = 2082;
        v76 = v53;
        __int16 v77 = 1024;
        int v78 = 427;
        _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to restore ECP", buf, 0x22u);
      }
    }
    if ([(NFServiceWhitelistChecker *)self->_tagWhiteList pollingProfileUpdate]
      && self->_pollingProfile)
    {
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      uint64_t v54 = NFLogGetLogger();
      if (v54)
      {
        uint64_t v55 = (void (*)(uint64_t, const char *, ...))v54;
        long long v56 = object_getClass(self);
        BOOL v57 = class_isMetaClass(v56);
        int v58 = object_getClassName(self);
        id v69 = sel_getName(a2);
        uint64_t v59 = 45;
        if (v57) {
          uint64_t v59 = 43;
        }
        v55(6, "%c[%{public}s %{public}s]:%i Reset default", v59, v58, v69, 432);
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      int v60 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v61 = object_getClass(self);
        if (class_isMetaClass(v61)) {
          int v62 = 43;
        }
        else {
          int v62 = 45;
        }
        __int16 v63 = object_getClassName(self);
        BOOL v64 = sel_getName(a2);
        *(_DWORD *)id buf = 67109890;
        int v72 = v62;
        __int16 v73 = 2082;
        BOOL v74 = v63;
        __int16 v75 = 2082;
        v76 = v64;
        __int16 v77 = 1024;
        int v78 = 432;
        _os_log_impl((void *)&_mh_execute_header, v60, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Reset default", buf, 0x22u);
      }

      sub_1001E05E0(self->_driverWrapper);
    }
    [(_NFReaderSession *)self cleanupUI];
    [(NFTimer *)self->_sessionTimer stopTimer];
    if (v6)
    {
      uint64_t v65 = NFSharedSignpostLog();
      if (os_signpost_enabled(v65))
      {
        *(_WORD *)id buf = 0;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v65, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "Polling", (const char *)&unk_100286819, buf, 2u);
      }
    }
  }
  v70.receiver = self;
  v70.super_class = (Class)_NFReaderSession;
  [(_NFSession *)&v70 cleanup];
  int v66 = NFSharedSignpostLog();
  if (os_signpost_enabled(v66))
  {
    *(_WORD *)id buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v66, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "cleanup", "_NFReaderSession", buf, 2u);
  }
}

- (void)coreDuetActivityRevoked
{
  v6.receiver = self;
  v6.super_class = (Class)_NFReaderSession;
  id v4 = [(_NFSession *)&v6 workQueue];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1001B46F0;
  v5[3] = &unk_100301C40;
  v5[4] = self;
  v5[5] = a2;
  dispatch_async(v4, v5);
}

- (BOOL)shouldHandleSecureElementTransactionData
{
  return 1;
}

- (void)handleRemoteTagsDetected:(id)a3
{
  id v121 = a3;
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    objc_super v6 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    uint64_t v9 = 45;
    if (isMetaClass) {
      uint64_t v9 = 43;
    }
    v6(6, "%c[%{public}s %{public}s]:%i tags: %{public}@", v9, ClassName, Name, 477, v121);
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  objc_super v10 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = object_getClass(self);
    if (class_isMetaClass(v11)) {
      int v12 = 43;
    }
    else {
      int v12 = 45;
    }
    *(_DWORD *)id buf = 67110146;
    int v137 = v12;
    __int16 v138 = 2082;
    long long v139 = object_getClassName(self);
    __int16 v140 = 2082;
    id v141 = sel_getName(a2);
    __int16 v142 = 1024;
    int v143 = 477;
    __int16 v144 = 2114;
    id v145 = v121;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i tags: %{public}@", buf, 0x2Cu);
  }

  id v13 = objc_opt_new();
  int v14 = objc_opt_new();
  uint64_t v15 = objc_opt_new();
  BOOL v132 = 0;
  uint64_t v131 = 0x7FFFFFFFFFFFFFFFLL;
  long long v16 = sub_10023D968();
  sub_10023E798((uint64_t)v16);

  id v17 = +[_NFHardwareManager sharedHardwareManager];
  [v17 notifyReaderModeActivityStart];

  int v120 = (void *)v15;
  if ([(_NFReaderSession *)self _isCoreNFCSession]
    || ![(NFServiceWhitelistChecker *)self->_tagWhiteList internalAccess])
  {
    if ((self->_pollOption & 2) != 0
      && [(NFServiceWhitelistChecker *)self->_tagWhiteList nfcNDEFReaderAccess]
      && (self->_sessionConfig & 0x10) == 0)
    {
      long long v18 = a2;
      id v129 = 0;
      [(_NFReaderSession *)self _processRawTagsForNDEF:v121 ndefMessages:v14 supportedTags:v13 caEvents:v15 outError:&v129];
      id v19 = v129;
      int v20 = [v14 count] != 0;
      int v21 = 1;
      goto LABEL_20;
    }
    long long v18 = a2;
    id v128 = 0;
    [(_NFReaderSession *)self _processRawTagsForCoreNFC:v121 requireDiscoveryRestart:&v132 supportedTags:v13 caEvents:v15 outError:&v128 outConnectedTagIndex:&v131];
    id v19 = v128;
    if ([v13 count])
    {
      int v21 = 0;
      int v20 = (LOBYTE(self->_pollOption) >> 1) & 1;
      goto LABEL_20;
    }
  }
  else
  {
    long long v18 = a2;
    id v130 = 0;
    [(_NFReaderSession *)self _processRawTagsForInternalSession:v121 supportedTags:v13 outError:&v130];
    id v19 = v130;
  }
  int v21 = 0;
  int v20 = 0;
LABEL_20:
  __int16 v117 = v19;
  BOOL v132 = [v19 code] == (id)51;
  uint64_t v22 = NFSharedSignpostLog();
  if (os_signpost_enabled(v22))
  {
    BOOL v23 = [v13 count] != 0;
    *(_DWORD *)id buf = 67240448;
    int v137 = v20;
    __int16 v138 = 1026;
    LODWORD(v139) = v23;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v22, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "handleRemoteTagsDetected", "didDetectNDEF=%{public,signpost.description:attribute}u didDetectTags=%{public,signpost.description:attribute}u", buf, 0xEu);
  }

  char v118 = v20;
  if (v20)
  {
    int v116 = v21;
    if ([v14 count])
    {
      uint64_t v24 = v14;
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      uint64_t v25 = NFLogGetLogger();
      if (v25)
      {
        NSErrorUserInfoKey v26 = (void (*)(uint64_t, const char *, ...))v25;
        int v27 = object_getClass(self);
        BOOL v28 = class_isMetaClass(v27);
        int v29 = object_getClassName(self);
        id v30 = sel_getName(v18);
        id v113 = [v24 count];
        uint64_t v31 = 45;
        if (v28) {
          uint64_t v31 = 43;
        }
        v26(6, "%c[%{public}s %{public}s]:%i %lu NDEF messages found", v31, v29, v30, 529, v113);
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      int v32 = NFSharedLogGetLogger();
      if (!os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        int v14 = v24;
        goto LABEL_58;
      }
      __int16 v33 = object_getClass(self);
      if (class_isMetaClass(v33)) {
        int v34 = 43;
      }
      else {
        int v34 = 45;
      }
      __int16 v35 = object_getClassName(self);
      uint64_t v36 = sel_getName(v18);
      id v37 = [v24 count];
      *(_DWORD *)id buf = 67110146;
      int v137 = v34;
      int v14 = v24;
      __int16 v138 = 2082;
      long long v139 = v35;
      __int16 v140 = 2082;
      id v141 = v36;
      __int16 v142 = 1024;
      int v143 = 529;
      __int16 v144 = 2048;
      id v145 = v37;
      id v38 = "%c[%{public}s %{public}s]:%i %lu NDEF messages found";
    }
    else
    {
      id v57 = [v13 count];
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      uint64_t v58 = NFLogGetLogger();
      uint64_t v59 = (void (*)(uint64_t, const char *, ...))v58;
      if (!v57)
      {
        if (v58)
        {
          id v97 = object_getClass(self);
          BOOL v98 = class_isMetaClass(v97);
          uint64_t v99 = v14;
          v100 = object_getClassName(self);
          v112 = sel_getName(v18);
          uint64_t v101 = 45;
          if (v98) {
            uint64_t v101 = 43;
          }
          long long v110 = v100;
          int v14 = v99;
          v59(3, "%c[%{public}s %{public}s]:%i Unexpected state", v101, v110, v112, 533);
        }
        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        int v32 = NFSharedLogGetLogger();
        if (!os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
          goto LABEL_58;
        }
        v102 = object_getClass(self);
        id v103 = v14;
        if (class_isMetaClass(v102)) {
          int v104 = 43;
        }
        else {
          int v104 = 45;
        }
        id v105 = object_getClassName(self);
        uint64_t v106 = sel_getName(v18);
        *(_DWORD *)id buf = 67109890;
        int v137 = v104;
        int v14 = v103;
        __int16 v138 = 2082;
        long long v139 = v105;
        __int16 v140 = 2082;
        id v141 = v106;
        __int16 v142 = 1024;
        int v143 = 533;
        id v38 = "%c[%{public}s %{public}s]:%i Unexpected state";
        int v72 = v32;
        os_log_type_t v73 = OS_LOG_TYPE_ERROR;
        uint32_t v74 = 34;
        goto LABEL_56;
      }
      if (v58)
      {
        int v60 = object_getClass(self);
        BOOL v61 = class_isMetaClass(v60);
        int v62 = v14;
        __int16 v63 = object_getClassName(self);
        BOOL v64 = sel_getName(v18);
        id v115 = [v13 count];
        long long v109 = v63;
        uint64_t v65 = 45;
        if (v61) {
          uint64_t v65 = 43;
        }
        int v14 = v62;
        v59(6, "%c[%{public}s %{public}s]:%i %lu NDEF tags found", v65, v109, v64, 531, v115);
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      int v32 = NFSharedLogGetLogger();
      if (!os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_58;
      }
      int v66 = object_getClass(self);
      __int16 v67 = v14;
      if (class_isMetaClass(v66)) {
        int v68 = 43;
      }
      else {
        int v68 = 45;
      }
      id v69 = object_getClassName(self);
      objc_super v70 = sel_getName(v18);
      id v71 = [v13 count];
      *(_DWORD *)id buf = 67110146;
      int v137 = v68;
      int v14 = v67;
      __int16 v138 = 2082;
      long long v139 = v69;
      __int16 v140 = 2082;
      id v141 = v70;
      __int16 v142 = 1024;
      int v143 = 531;
      __int16 v144 = 2048;
      id v145 = v71;
      id v38 = "%c[%{public}s %{public}s]:%i %lu NDEF tags found";
    }
    int v72 = v32;
    os_log_type_t v73 = OS_LOG_TYPE_DEFAULT;
    uint32_t v74 = 44;
LABEL_56:
    _os_log_impl((void *)&_mh_execute_header, v72, v73, v38, buf, v74);
LABEL_58:

    __int16 v75 = [(_NFXPCSession *)self remoteObject];
    id v76 = [objc_alloc((Class)NSArray) initWithArray:v14];
    uint64_t v77 = v131;
    v126[0] = _NSConcreteStackBlock;
    v126[1] = 3221225472;
    v126[2] = sub_1001B55EC;
    v126[3] = &unk_100306C38;
    v126[4] = self;
    id v127 = v14;
    [v75 didDetectNDEFMessages:v76 fromTags:v13 connectedTagIndex:v77 updateUICallback:v126];

LABEL_59:
    int v39 = v116;
    goto LABEL_60;
  }
  int v39 = 1;
  if ([v13 count] && !v132)
  {
    int v116 = v21;
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v40 = NFLogGetLogger();
    if (v40)
    {
      __int16 v41 = (void (*)(uint64_t, const char *, ...))v40;
      id v42 = object_getClass(self);
      BOOL v43 = class_isMetaClass(v42);
      int v44 = v14;
      id v45 = object_getClassName(self);
      BOOL v46 = sel_getName(v18);
      id v114 = [v13 count];
      long long v108 = v45;
      uint64_t v47 = 45;
      if (v43) {
        uint64_t v47 = 43;
      }
      int v14 = v44;
      v41(6, "%c[%{public}s %{public}s]:%i %lu tags found", v47, v108, v46, 546, v114);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v48 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
    {
      id v49 = object_getClass(self);
      char v50 = v14;
      if (class_isMetaClass(v49)) {
        int v51 = 43;
      }
      else {
        int v51 = 45;
      }
      id v52 = object_getClassName(self);
      id v53 = sel_getName(v18);
      id v54 = [v13 count];
      *(_DWORD *)id buf = 67110146;
      int v137 = v51;
      int v14 = v50;
      __int16 v138 = 2082;
      long long v139 = v52;
      __int16 v140 = 2082;
      id v141 = v53;
      __int16 v142 = 1024;
      int v143 = 546;
      __int16 v144 = 2048;
      id v145 = v54;
      _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i %lu tags found", buf, 0x2Cu);
    }

    uint64_t v55 = [(_NFXPCSession *)self remoteObject];
    id v56 = [v13 copy];
    [v55 didDetectTags:v56 connectedTagIndex:v131];

    goto LABEL_59;
  }
LABEL_60:
  if (self->_currentTag)
  {
    int v78 = sub_10023D968();
    sub_10023D9FC((uint64_t)v78, self->_currentTag);

    if (self->_isConnectionHandover)
    {
      sub_10023D968();
      __int16 v79 = (unsigned char *)objc_claimAutoreleasedReturnValue();
      if (v79) {
        v79[157] = 1;
      }
    }
  }
  if (v117 && [v117 code] == (id)64)
  {
    [(_NFXPCSession *)self endSession:0];
    v80 = [(_NFXPCSession *)self remoteObject];
    id v81 = objc_alloc((Class)NSError);
    uint64_t v82 = +[NSString stringWithUTF8String:"nfcd"];
    NSErrorUserInfoKey v134 = NSLocalizedDescriptionKey;
    v83 = +[NSString stringWithUTF8String:"Reader mode prohibit timer"];
    long long v135 = v83;
    +[NSDictionary dictionaryWithObjects:&v135 forKeys:&v134 count:1];
    v85 = id v84 = v14;
    id v86 = [v81 initWithDomain:v82 code:64 userInfo:v85];
    [v80 didTerminate:v86];

    int v14 = v84;
    v87 = sub_10023D968();
    sub_10023E114((uint64_t)v87, v117);

LABEL_70:
    char v88 = v118;
    goto LABEL_71;
  }
  if (v132)
  {
    sub_1002128B4(self->_driverWrapper);
    goto LABEL_70;
  }
  char v88 = v118;
  if (v39)
  {
    uint64_t v96 = [v121 firstObject];
    [(_NFReaderSession *)self _tagRemovalDetect:v96];
  }
LABEL_71:
  if ((v88 & 1) == 0 && ![v13 count])
  {
    __int16 v119 = v14;
    long long v124 = 0u;
    long long v125 = 0u;
    long long v122 = 0u;
    long long v123 = 0u;
    id v89 = v121;
    id v90 = [v89 countByEnumeratingWithState:&v122 objects:v133 count:16];
    if (v90)
    {
      id v91 = v90;
      uint64_t v92 = *(void *)v123;
      do
      {
        for (uint64_t i = 0; i != v91; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v123 != v92) {
            objc_enumerationMutation(v89);
          }
          int v94 = *(void **)(*((void *)&v122 + 1) + 8 * i);
          id v95 = sub_10023D968();
          sub_10023DFEC((uint64_t)v95, v94);
        }
        id v91 = [v89 countByEnumeratingWithState:&v122 objects:v133 count:16];
      }
      while (v91);
    }

    int v14 = v119;
  }
}

- (void)handleReaderBurnoutTimer
{
  v3 = [(_NFSession *)self workQueue];
  dispatch_assert_queue_V2(v3);

  if (self->_currentTag)
  {
    sub_10023D968();
    id v4 = (unsigned char *)objc_claimAutoreleasedReturnValue();
    if (v4) {
      v4[155] = 1;
    }
  }
  id v5 = [(_NFReaderSession *)self _disconnectWithCardRemoval:0];
  self->_exitReason = 1;
  self->_int64_t uiStateOnInvalidation = 0;
  objc_super v6 = NFSharedSignpostLog();
  if (os_signpost_enabled(v6))
  {
    *(_WORD *)id v13 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v6, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "handleReaderBurnoutTimer", (const char *)&unk_100286819, v13, 2u);
  }

  [(_NFXPCSession *)self endSession:0];
  uint64_t v7 = [(_NFXPCSession *)self remoteObject];
  id v8 = objc_alloc((Class)NSError);
  uint64_t v9 = +[NSString stringWithUTF8String:"nfcd"];
  NSErrorUserInfoKey v14 = NSLocalizedDescriptionKey;
  objc_super v10 = +[NSString stringWithUTF8String:"Reader mode temporarily disabled"];
  uint64_t v15 = v10;
  uint64_t v11 = +[NSDictionary dictionaryWithObjects:&v15 forKeys:&v14 count:1];
  id v12 = [v8 initWithDomain:v9 code:47 userInfo:v11];
  [v7 didTerminate:v12];
}

- (void)handleReaderBurnoutCleared
{
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    id v5 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    uint64_t v9 = 45;
    if (isMetaClass) {
      uint64_t v9 = 43;
    }
    v5(6, "%c[%{public}s %{public}s]:%i Warning : message received - session should be gone.", v9, ClassName, Name, 600);
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  objc_super v10 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = object_getClass(self);
    if (class_isMetaClass(v11)) {
      int v12 = 43;
    }
    else {
      int v12 = 45;
    }
    *(_DWORD *)id buf = 67109890;
    int v15 = v12;
    __int16 v16 = 2082;
    id v17 = object_getClassName(self);
    __int16 v18 = 2082;
    id v19 = sel_getName(a2);
    __int16 v20 = 1024;
    int v21 = 600;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Warning : message received - session should be gone.", buf, 0x22u);
  }
}

- (void)handleFilteredFieldNotification:(id)a3
{
  id v5 = a3;
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    uint64_t v7 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    uint64_t v10 = 45;
    if (isMetaClass) {
      uint64_t v10 = 43;
    }
    v7(6, "%c[%{public}s %{public}s]:%i %{public}@", v10, ClassName, Name, 615, v5);
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t v11 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = object_getClass(self);
    if (class_isMetaClass(v12)) {
      int v13 = 43;
    }
    else {
      int v13 = 45;
    }
    *(_DWORD *)id buf = 67110146;
    int v55 = v13;
    __int16 v56 = 2082;
    id v57 = object_getClassName(self);
    __int16 v58 = 2082;
    uint64_t v59 = sel_getName(a2);
    __int16 v60 = 1024;
    int v61 = 615;
    __int16 v62 = 2114;
    id v63 = v5;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }

  if ([(_NFReaderSession *)self _isCoreNFCSession])
  {
    if ([v5 notificationType] == (id)2)
    {
      id v14 = v5;
      unint64_t sessionConfig = self->_sessionConfig;
      unsigned int v16 = [v14 terminalMode];
      if ((sessionConfig & 8) != 0)
      {
        if (v16 == 4 && [v14 terminalType] == 15)
        {
          dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          uint64_t v39 = NFLogGetLogger();
          if (v39)
          {
            uint64_t v40 = (void (*)(uint64_t, const char *, ...))v39;
            __int16 v41 = object_getClass(self);
            BOOL v42 = class_isMetaClass(v41);
            BOOL v43 = object_getClassName(self);
            id v53 = sel_getName(a2);
            uint64_t v44 = 45;
            if (v42) {
              uint64_t v44 = 43;
            }
            v40(5, "%c[%{public}s %{public}s]:%i Ignoring non ECP/VAS/Payment reader field", v44, v43, v53, 622);
          }
          dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          BOOL v23 = NFSharedLogGetLogger();
          if (!os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_48;
          }
          id v45 = object_getClass(self);
          if (class_isMetaClass(v45)) {
            int v46 = 43;
          }
          else {
            int v46 = 45;
          }
          uint64_t v47 = object_getClassName(self);
          uint64_t v48 = sel_getName(a2);
          *(_DWORD *)id buf = 67109890;
          int v55 = v46;
          __int16 v56 = 2082;
          id v57 = v47;
          __int16 v58 = 2082;
          uint64_t v59 = v48;
          __int16 v60 = 1024;
          int v61 = 622;
          BOOL v28 = "%c[%{public}s %{public}s]:%i Ignoring non ECP/VAS/Payment reader field";
          goto LABEL_47;
        }
      }
      else if (v16 == 4 && [v14 terminalType] == 15)
      {
        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        uint64_t v17 = NFLogGetLogger();
        if (v17)
        {
          __int16 v18 = (void (*)(uint64_t, const char *, ...))v17;
          id v19 = object_getClass(self);
          BOOL v20 = class_isMetaClass(v19);
          int v21 = object_getClassName(self);
          int v51 = sel_getName(a2);
          uint64_t v22 = 45;
          if (v20) {
            uint64_t v22 = 43;
          }
          v18(5, "%c[%{public}s %{public}s]:%i Ignore Other field", v22, v21, v51, 630);
        }
        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        BOOL v23 = NFSharedLogGetLogger();
        if (!os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_48;
        }
        uint64_t v24 = object_getClass(self);
        if (class_isMetaClass(v24)) {
          int v25 = 43;
        }
        else {
          int v25 = 45;
        }
        NSErrorUserInfoKey v26 = object_getClassName(self);
        int v27 = sel_getName(a2);
        *(_DWORD *)id buf = 67109890;
        int v55 = v25;
        __int16 v56 = 2082;
        id v57 = v26;
        __int16 v58 = 2082;
        uint64_t v59 = v27;
        __int16 v60 = 1024;
        int v61 = 630;
        BOOL v28 = "%c[%{public}s %{public}s]:%i Ignore Other field";
LABEL_47:
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, v28, buf, 0x22u);
LABEL_48:

        goto LABEL_51;
      }
    }
    else
    {
      if ([v5 notificationType] != (id)3)
      {
LABEL_50:
        id v14 = [(_NFXPCSession *)self remoteObject];
        [v14 didDetectExternalReader];
        goto LABEL_51;
      }
      id v14 = v5;
      if ([v14 chFieldType] != (id)1)
      {
        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        uint64_t v29 = NFLogGetLogger();
        if (v29)
        {
          id v30 = (void (*)(uint64_t, const char *, ...))v29;
          uint64_t v31 = object_getClass(self);
          BOOL v32 = class_isMetaClass(v31);
          __int16 v33 = object_getClassName(self);
          id v52 = sel_getName(a2);
          uint64_t v34 = 45;
          if (v32) {
            uint64_t v34 = 43;
          }
          v30(5, "%c[%{public}s %{public}s]:%i Ignore CH field", v34, v33, v52, 637);
        }
        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        BOOL v23 = NFSharedLogGetLogger();
        if (!os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_48;
        }
        __int16 v35 = object_getClass(self);
        if (class_isMetaClass(v35)) {
          int v36 = 43;
        }
        else {
          int v36 = 45;
        }
        id v37 = object_getClassName(self);
        id v38 = sel_getName(a2);
        *(_DWORD *)id buf = 67109890;
        int v55 = v36;
        __int16 v56 = 2082;
        id v57 = v37;
        __int16 v58 = 2082;
        uint64_t v59 = v38;
        __int16 v60 = 1024;
        int v61 = 637;
        BOOL v28 = "%c[%{public}s %{public}s]:%i Ignore CH field";
        goto LABEL_47;
      }
    }

    goto LABEL_50;
  }
  id v14 = [(_NFXPCSession *)self remoteObject];
  [v14 didDetectExternalReaderWithNotification:v5];
LABEL_51:
}

- (void)handleInvalidatedXPCWithConnectionUserInfo:(id)a3
{
  self->_exitReason = 2;
  self->_currentTag = 0;
  _objc_release_x1();
}

- (id)_activateAppOnConnect:(id)a3
{
  id v5 = a3;
  unsigned int v6 = [v5 type];
  unsigned int v7 = [v5 type];
  unsigned int v8 = [v5 type];
  if ((v6 == 3 || v7 == 6) && (self->_pollOption & 8) != 0)
  {
    if (v6 == 3) {
      [v5 tagA];
    }
    else {
    id v19 = [v5 tagB];
    }
    BOOL v20 = [v19 selectedAID];

    int v21 = [(_NFReaderSession *)self _performType4AppSelect:v20 tag:v5];
    if (v21)
    {
      id v22 = v21;

      goto LABEL_17;
    }

    goto LABEL_16;
  }
  if (v8 != 7 || (self->_pollOption & 0x10) == 0)
  {
LABEL_16:
    id v22 = 0;
    goto LABEL_17;
  }
  uint64_t v9 = [v5 tagF];
  uint64_t v10 = [v9 SystemCode];
  unsigned __int8 v11 = [(_NFReaderSession *)self validateSystemCode:v10];

  if (v11)
  {
    int v12 = [v5 tagF];
    int v13 = [v12 SystemCode];
    id v64 = 0;
    id v14 = [(_NFReaderSession *)self _getIDMFromTag:v5 systemCode:v13 outIdm:&v64 outPmm:0];
    id v15 = v64;

    if (v14
      || ([v5 tagF],
          unsigned int v16 = objc_claimAutoreleasedReturnValue(),
          [v16 IDm],
          uint64_t v17 = objc_claimAutoreleasedReturnValue(),
          unsigned __int8 v18 = [v15 isEqual:v17],
          v17,
          v16,
          (v18 & 1) != 0))
    {

      goto LABEL_16;
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      uint64_t v47 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      id v52 = [v15 NF_asHexString];
      uint64_t v53 = 45;
      if (isMetaClass) {
        uint64_t v53 = 43;
      }
      v47(6, "%c[%{public}s %{public}s]:%i IDm of requested tag (%{public}@) does not match physical card", v53, ClassName, Name, 682, v52);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    id v54 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
    {
      int v55 = object_getClass(self);
      if (class_isMetaClass(v55)) {
        int v56 = 43;
      }
      else {
        int v56 = 45;
      }
      id v57 = object_getClassName(self);
      __int16 v58 = sel_getName(a2);
      uint64_t v59 = [v15 NF_asHexString];
      *(_DWORD *)id buf = 67110146;
      int v70 = v56;
      __int16 v71 = 2082;
      int v72 = v57;
      __int16 v73 = 2082;
      uint32_t v74 = v58;
      __int16 v75 = 1024;
      int v76 = 682;
      __int16 v77 = 2114;
      int v78 = v59;
      _os_log_impl((void *)&_mh_execute_header, v54, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i IDm of requested tag (%{public}@) does not match physical card", buf, 0x2Cu);
    }
    id v60 = objc_alloc((Class)NSError);
    int v61 = +[NSString stringWithUTF8String:"nfcd"];
    NSErrorUserInfoKey v65 = NSLocalizedDescriptionKey;
    __int16 v62 = +[NSString stringWithUTF8String:"Tag Not Found"];
    int v66 = v62;
    id v63 = +[NSDictionary dictionaryWithObjects:&v66 forKeys:&v65 count:1];
    id v22 = [v60 initWithDomain:v61 code:28 userInfo:v63];
  }
  else
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v24 = NFLogGetLogger();
    if (v24)
    {
      int v25 = (void (*)(uint64_t, const char *, ...))v24;
      NSErrorUserInfoKey v26 = object_getClass(self);
      BOOL v27 = class_isMetaClass(v26);
      BOOL v28 = object_getClassName(self);
      uint64_t v29 = sel_getName(a2);
      id v30 = [v5 tagF];
      uint64_t v31 = [v30 SystemCode];
      BOOL v32 = [v31 NF_asHexString];
      uint64_t v33 = 45;
      if (v27) {
        uint64_t v33 = 43;
      }
      v25(6, "%c[%{public}s %{public}s]:%i Service code (%{public}@) not in the whitelist", v33, v28, v29, 674, v32);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v34 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v35 = object_getClass(self);
      if (class_isMetaClass(v35)) {
        int v36 = 43;
      }
      else {
        int v36 = 45;
      }
      id v37 = object_getClassName(self);
      id v38 = sel_getName(a2);
      uint64_t v39 = [v5 tagF];
      uint64_t v40 = [v39 SystemCode];
      __int16 v41 = [v40 NF_asHexString];
      *(_DWORD *)id buf = 67110146;
      int v70 = v36;
      __int16 v71 = 2082;
      int v72 = v37;
      __int16 v73 = 2082;
      uint32_t v74 = v38;
      __int16 v75 = 1024;
      int v76 = 674;
      __int16 v77 = 2114;
      int v78 = v41;
      _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Service code (%{public}@) not in the whitelist", buf, 0x2Cu);
    }
    id v42 = objc_alloc((Class)NSError);
    BOOL v43 = +[NSString stringWithUTF8String:"nfcd"];
    NSErrorUserInfoKey v67 = NSLocalizedDescriptionKey;
    uint64_t v44 = +[NSString stringWithUTF8String:"Not entitled"];
    int v68 = v44;
    id v45 = +[NSDictionary dictionaryWithObjects:&v68 forKeys:&v67 count:1];
    id v22 = [v42 initWithDomain:v43 code:32 userInfo:v45];
  }
LABEL_17:

  return v22;
}

- (id)_performType4AppSelect:(id)a3 tag:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  int64_t v9 = [(_NFReaderSession *)self validateAID:v7 allowsPrefixMatch:0];
  if (v9 == 4)
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      unsigned __int8 v11 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      [v7 NF_asHexString];
      v17 = unsigned int v16 = a2;
      uint64_t v18 = 45;
      if (isMetaClass) {
        uint64_t v18 = 43;
      }
      v11(6, "%c[%{public}s %{public}s]:%i Application (%{public}@) not in the allowedlist", v18, ClassName, Name, 696, v17);

      a2 = v16;
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    id v19 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v20 = object_getClass(self);
      if (class_isMetaClass(v20)) {
        int v21 = 43;
      }
      else {
        int v21 = 45;
      }
      id v22 = object_getClassName(self);
      BOOL v23 = sel_getName(a2);
      uint64_t v24 = [v7 NF_asHexString];
      *(_DWORD *)id buf = 67110146;
      int v114 = v21;
      __int16 v115 = 2082;
      int v116 = v22;
      __int16 v117 = 2082;
      char v118 = v23;
      __int16 v119 = 1024;
      int v120 = 696;
      __int16 v121 = 2114;
      id v122 = v24;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Application (%{public}@) not in the allowedlist", buf, 0x2Cu);
    }
    id v25 = objc_alloc((Class)NSError);
    NSErrorUserInfoKey v26 = +[NSString stringWithUTF8String:"nfcd"];
    NSErrorUserInfoKey v111 = NSLocalizedDescriptionKey;
    BOOL v27 = +[NSString stringWithUTF8String:"Not entitled"];
    v112 = v27;
    BOOL v28 = +[NSDictionary dictionaryWithObjects:&v112 forKeys:&v111 count:1];
    id v29 = [v25 initWithDomain:v26 code:32 userInfo:v28];

    goto LABEL_72;
  }
  int64_t v30 = v9;
  uint64_t v99 = self;
  if ([(NSMutableArray *)self->_nonstandard7816TagsFound count])
  {
    long long v106 = 0u;
    long long v107 = 0u;
    long long v104 = 0u;
    long long v105 = 0u;
    id obj = self->_nonstandard7816TagsFound;
    id v31 = [(NSMutableArray *)obj countByEnumeratingWithState:&v104 objects:v110 count:16];
    if (v31)
    {
      id v32 = v31;
      id v97 = a2;
      id v98 = v7;
      uint64_t v33 = *(void *)v105;
LABEL_15:
      uint64_t v34 = 0;
      while (1)
      {
        if (*(void *)v105 != v33) {
          objc_enumerationMutation(obj);
        }
        __int16 v35 = *(void **)(*((void *)&v104 + 1) + 8 * v34);
        int v36 = [v8 UID];
        id v37 = [v35 objectForKeyedSubscript:@"uid"];
        unsigned int v38 = [v36 isEqualToData:v37];

        if (v38) {
          break;
        }
        if (v32 == (id)++v34)
        {
          id v32 = [(NSMutableArray *)obj countByEnumeratingWithState:&v104 objects:v110 count:16];
          if (v32) {
            goto LABEL_15;
          }
          a2 = v97;
          id v7 = v98;
          goto LABEL_46;
        }
      }
      uint64_t v39 = [v35 objectForKeyedSubscript:@"type"];
      int64_t v30 = (int64_t)[v39 integerValue];

      id v7 = v98;
      if (v30 == 3)
      {
        id v102 = 0;
        unsigned __int8 v52 = [(_NFReaderSession *)v99 selectPRCIDApp:v98 fromTag:v8 resolvedAid:0 outError:&v102];
        id v41 = v102;
        if ((v52 & 1) == 0)
        {
          dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          uint64_t v81 = NFLogGetLogger();
          if (v81)
          {
            uint64_t v82 = (void (*)(uint64_t, const char *, ...))v81;
            v83 = object_getClass(v99);
            BOOL v84 = class_isMetaClass(v83);
            v93 = object_getClassName(v99);
            uint64_t v96 = sel_getName(v97);
            uint64_t v85 = 45;
            if (v84) {
              uint64_t v85 = 43;
            }
            v82(3, "%c[%{public}s %{public}s]:%i %{public}@", v85, v93, v96, 720, v41);
          }
          dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          uint64_t v47 = NFSharedLogGetLogger();
          if (!os_log_type_enabled(v47, OS_LOG_TYPE_ERROR)) {
            goto LABEL_70;
          }
          id v86 = object_getClass(v99);
          if (class_isMetaClass(v86)) {
            int v87 = 43;
          }
          else {
            int v87 = 45;
          }
          char v88 = object_getClassName(v99);
          id v89 = sel_getName(v97);
          *(_DWORD *)id buf = 67110146;
          int v114 = v87;
          __int16 v115 = 2082;
          int v116 = v88;
          __int16 v117 = 2082;
          char v118 = v89;
          __int16 v119 = 1024;
          int v120 = 720;
          __int16 v121 = 2114;
          id v122 = v41;
          goto LABEL_69;
        }
      }
      else
      {
        a2 = v97;
        if (v30 != 2)
        {
          dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          uint64_t v53 = NFLogGetLogger();
          if (v53)
          {
            id v54 = (void (*)(uint64_t, const char *, ...))v53;
            int v55 = object_getClass(v99);
            BOOL v56 = class_isMetaClass(v55);
            uint64_t v92 = object_getClassName(v99);
            id v95 = sel_getName(v97);
            uint64_t v57 = 45;
            if (v56) {
              uint64_t v57 = 43;
            }
            v54(4, "%c[%{public}s %{public}s]:%i Unexpected tag type found: %{public}@", v57, v92, v95, 726, v8);
          }
          dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          __int16 v58 = NFSharedLogGetLogger();
          if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
          {
            uint64_t v59 = object_getClass(v99);
            if (class_isMetaClass(v59)) {
              int v60 = 43;
            }
            else {
              int v60 = 45;
            }
            int v61 = object_getClassName(v99);
            __int16 v62 = sel_getName(v97);
            *(_DWORD *)id buf = 67110146;
            int v114 = v60;
            __int16 v115 = 2082;
            int v116 = v61;
            __int16 v117 = 2082;
            char v118 = v62;
            __int16 v119 = 1024;
            int v120 = 726;
            __int16 v121 = 2114;
            id v122 = v8;
            _os_log_impl((void *)&_mh_execute_header, v58, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Unexpected tag type found: %{public}@", buf, 0x2Cu);
          }

LABEL_46:
          self = v99;
          goto LABEL_47;
        }
        id v103 = 0;
        unsigned __int8 v40 = [(_NFReaderSession *)v99 selectPaceApp:v98 fromTag:v8 outError:&v103];
        id v41 = v103;
        if ((v40 & 1) == 0)
        {
          dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          uint64_t v42 = NFLogGetLogger();
          if (v42)
          {
            BOOL v43 = (void (*)(uint64_t, const char *, ...))v42;
            uint64_t v44 = object_getClass(v99);
            BOOL v45 = class_isMetaClass(v44);
            id v91 = object_getClassName(v99);
            int v94 = sel_getName(v97);
            uint64_t v46 = 45;
            if (v45) {
              uint64_t v46 = 43;
            }
            v43(3, "%c[%{public}s %{public}s]:%i %{public}@", v46, v91, v94, 714, v41);
          }
          dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          uint64_t v47 = NFSharedLogGetLogger();
          if (!os_log_type_enabled(v47, OS_LOG_TYPE_ERROR)) {
            goto LABEL_70;
          }
          uint64_t v48 = object_getClass(v99);
          if (class_isMetaClass(v48)) {
            int v49 = 43;
          }
          else {
            int v49 = 45;
          }
          char v50 = object_getClassName(v99);
          int v51 = sel_getName(v97);
          *(_DWORD *)id buf = 67110146;
          int v114 = v49;
          __int16 v115 = 2082;
          int v116 = v50;
          __int16 v117 = 2082;
          char v118 = v51;
          __int16 v119 = 1024;
          int v120 = 714;
          __int16 v121 = 2114;
          id v122 = v41;
LABEL_69:
          _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
LABEL_70:

          id v41 = v41;
          id v29 = v41;
          goto LABEL_71;
        }
      }
      id v29 = 0;
LABEL_71:

      goto LABEL_72;
    }
LABEL_47:
  }
  if ((v30 & 0xFFFFFFFFFFFFFFFBLL) != 0)
  {
    id v101 = 0;
    [(_NFReaderSession *)self _selectFromTag:v8 aid:v7 resolvedAid:0 error:&v101];
    id v29 = v101;
  }
  else
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v63 = NFLogGetLogger();
    if (v63)
    {
      id v64 = (void (*)(uint64_t, const char *, ...))v63;
      NSErrorUserInfoKey v65 = object_getClass(v99);
      BOOL v66 = class_isMetaClass(v65);
      NSErrorUserInfoKey v67 = object_getClassName(v99);
      int v68 = sel_getName(a2);
      id v69 = [v7 NF_asHexString];
      uint64_t v70 = 45;
      if (v66) {
        uint64_t v70 = 43;
      }
      v64(6, "%c[%{public}s %{public}s]:%i Application (%{public}@) not in the allowedlist", v70, v67, v68, 733, v69);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    __int16 v71 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v71, OS_LOG_TYPE_DEFAULT))
    {
      int v72 = object_getClass(v99);
      if (class_isMetaClass(v72)) {
        int v73 = 43;
      }
      else {
        int v73 = 45;
      }
      uint32_t v74 = object_getClassName(v99);
      __int16 v75 = sel_getName(a2);
      int v76 = [v7 NF_asHexString];
      *(_DWORD *)id buf = 67110146;
      int v114 = v73;
      __int16 v115 = 2082;
      int v116 = v74;
      __int16 v117 = 2082;
      char v118 = v75;
      __int16 v119 = 1024;
      int v120 = 733;
      __int16 v121 = 2114;
      id v122 = v76;
      _os_log_impl((void *)&_mh_execute_header, v71, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Application (%{public}@) not in the allowedlist", buf, 0x2Cu);
    }
    id v77 = objc_alloc((Class)NSError);
    int v78 = +[NSString stringWithUTF8String:"nfcd"];
    NSErrorUserInfoKey v108 = NSLocalizedDescriptionKey;
    __int16 v79 = +[NSString stringWithUTF8String:"Not entitled"];
    long long v109 = v79;
    v80 = +[NSDictionary dictionaryWithObjects:&v109 forKeys:&v108 count:1];
    id v29 = [v77 initWithDomain:v78 code:32 userInfo:v80];
  }
LABEL_72:

  return v29;
}

- (void)_sync_connect:(id)a3 completion:(id)a4
{
  id v85 = a3;
  BOOL v84 = (void (**)(id, void, id))a4;
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    id v8 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    int v13 = [(_NFXPCSession *)self clientName];
    id v14 = [(_NFXPCSession *)self connection];
    id v15 = [v14 processIdentifier];
    unsigned int v16 = [(_NFSession *)self sessionUID];
    uint64_t v17 = 43;
    if (!isMetaClass) {
      uint64_t v17 = 45;
    }
    v8(6, "%c[%{public}s %{public}s]:%i %{public}@ (%d) %{public}@", v17, ClassName, Name, 744, v13, v15, v16);
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t v18 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    id v19 = object_getClass(self);
    if (class_isMetaClass(v19)) {
      int v20 = 43;
    }
    else {
      int v20 = 45;
    }
    int v21 = object_getClassName(self);
    id v22 = sel_getName(a2);
    BOOL v23 = [(_NFXPCSession *)self clientName];
    uint64_t v24 = [(_NFXPCSession *)self connection];
    unsigned int v25 = [v24 processIdentifier];
    NSErrorUserInfoKey v26 = [(_NFSession *)self sessionUID];
    *(_DWORD *)id buf = 67110658;
    int v94 = v20;
    __int16 v95 = 2082;
    uint64_t v96 = v21;
    __int16 v97 = 2082;
    id v98 = v22;
    __int16 v99 = 1024;
    int v100 = 744;
    __int16 v101 = 2114;
    id v102 = v23;
    __int16 v103 = 1024;
    unsigned int v104 = v25;
    __int16 v105 = 2114;
    long long v106 = v26;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i %{public}@ (%d) %{public}@", buf, 0x3Cu);
  }
  unint64_t pollOption = self->_pollOption;
  if ((pollOption & 2) == 0)
  {
    unsigned int v28 = 0;
    if ((pollOption & 8) != 0) {
      goto LABEL_12;
    }
LABEL_15:
    unsigned int v30 = 0;
    unsigned int v29 = 0;
    goto LABEL_17;
  }
  unsigned int v28 = [(NFServiceWhitelistChecker *)self->_tagWhiteList nfcNDEFReaderAccess];
  unint64_t pollOption = self->_pollOption;
  if ((pollOption & 8) == 0) {
    goto LABEL_15;
  }
LABEL_12:
  unsigned int v29 = [(NFServiceWhitelistChecker *)self->_tagWhiteList nfcTagReaderAccess];
  unint64_t pollOption = self->_pollOption;
  if ((pollOption & 8) == 0)
  {
    unsigned int v30 = 0;
    goto LABEL_17;
  }
  unsigned int v30 = [(NFServiceWhitelistChecker *)self->_tagWhiteList nfcTagReaderAccess];
  unint64_t pollOption = self->_pollOption;
  if ((pollOption & 8) == 0)
  {
LABEL_17:
    unsigned int v31 = 0;
    if ((pollOption & 0x10) == 0) {
      goto LABEL_18;
    }
    goto LABEL_23;
  }
  unsigned int v31 = [(NFServiceWhitelistChecker *)self->_tagWhiteList nfcVASReaderAccess];
  unint64_t pollOption = self->_pollOption;
  if ((pollOption & 0x10) == 0)
  {
LABEL_18:
    unsigned int v32 = 0;
    if ((pollOption & 4) != 0) {
      goto LABEL_19;
    }
LABEL_24:
    unsigned __int8 v33 = 0;
    goto LABEL_25;
  }
LABEL_23:
  unsigned int v32 = [(NFServiceWhitelistChecker *)self->_tagWhiteList nfcTagReaderAccess];
  if ((self->_pollOption & 4) == 0) {
    goto LABEL_24;
  }
LABEL_19:
  if ([(NFServiceWhitelistChecker *)self->_tagWhiteList nfcTagReaderAccess]) {
    unsigned __int8 v33 = 1;
  }
  else {
    unsigned __int8 v33 = [(NFServiceWhitelistChecker *)self->_tagWhiteList nfcISO15693ReaderAccess];
  }
LABEL_25:
  if ((([(NFServiceWhitelistChecker *)self->_tagWhiteList internalAccess] | v28 | v29 | v30 | v31 | v32) & 1) != 0
    || (v33 & 1) != 0)
  {
    id v54 = sub_10023D968();
    sub_10023D9FC((uint64_t)v54, v85);

    if (self->_isConnectionHandover)
    {
      sub_10023D968();
      int v55 = (unsigned char *)objc_claimAutoreleasedReturnValue();
      if (v55) {
        v55[157] = 1;
      }

      +[NFGeneralStatisticsCALogger updateAnalyticsGeneralTransactionStatistics:&off_1003235A0];
    }
    driverWrapper = self->_driverWrapper;
    id v86 = 0;
    unsigned int v57 = sub_10018FAE8(driverWrapper, v85, &v86);
    id v58 = v86;
    if (v57)
    {
      id v59 = objc_alloc((Class)NSError);
      int v60 = +[NSString stringWithUTF8String:"nfcd"];
      uint64_t v61 = v57;
      v89[0] = NSLocalizedDescriptionKey;
      if (v57 >= 0x47) {
        int v62 = 71;
      }
      else {
        int v62 = v57;
      }
      uint64_t v63 = +[NSString stringWithUTF8String:off_100306978[v62]];
      v90[0] = v63;
      v90[1] = &off_10031D830;
      v89[1] = @"Line";
      v89[2] = @"Method";
      id v64 = [objc_alloc((Class)NSString) initWithFormat:@"%s", sel_getName(a2)];
      v90[2] = v64;
      v89[3] = NSDebugDescriptionErrorKey;
      id v65 = [objc_alloc((Class)NSString) initWithFormat:@"%s:%d", sel_getName(a2), 776];
      v90[3] = v65;
      BOOL v66 = +[NSDictionary dictionaryWithObjects:v90 forKeys:v89 count:4];
      id v67 = [v59 initWithDomain:v60 code:v61 userInfo:v66];
      v84[2](v84, 0, v67);

      id v51 = 0;
    }
    else if ((self->_sessionConfig & 2) != 0 {
           && ([(_NFReaderSession *)self _activateAppOnConnect:v85],
    }
               (uint64_t v68 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      id v51 = (id)v68;
      v84[2](v84, 0, (id)v68);
      +[NFExceptionsCALogger postAnalyticsReaderModeExceptionForType:tagType:rfFrameInterface:withErrorCode:](NFExceptionsCALogger, "postAnalyticsReaderModeExceptionForType:tagType:rfFrameInterface:withErrorCode:", 1, -[_NFReaderSession _getTagTypeFromTag:](self, "_getTagTypeFromTag:", v85), (self->_pollingConfig >> 12) & 1, [v51 code]);
      sub_100223B0C((uint64_t)NFDailyStatisticsCALogger, @"readerModeConnectErrorCount");
      id v69 = sub_10023D968();
      sub_10023E114((uint64_t)v69, v51);

      if ([v85 type]) {
        unsigned int v70 = [v85 type];
      }
      else {
        unsigned int v70 = sub_10018F854((uint64_t)self->_driverWrapper, v85);
      }
      unsigned int v71 = v70;
      int v72 = sub_10023D968();
      sub_10023DAD0((uint64_t)v72, v85, v71);

      int v73 = [v51 domain];
      uint32_t v74 = +[NSString stringWithUTF8String:"nfcd"];
      if ([v73 isEqualToString:v74])
      {
        id v75 = [v51 code];

        if (v75 == (id)32)
        {
          [(_NFXPCSession *)self endSession:0];
          int v76 = [(_NFXPCSession *)self remoteObject];
          id v77 = objc_alloc((Class)NSError);
          int v78 = +[NSString stringWithUTF8String:"nfcd"];
          NSErrorUserInfoKey v87 = NSLocalizedDescriptionKey;
          __int16 v79 = +[NSString stringWithUTF8String:"Not entitled"];
          char v88 = v79;
          v80 = +[NSDictionary dictionaryWithObjects:&v88 forKeys:&v87 count:1];
          id v81 = [v77 initWithDomain:v78 code:32 userInfo:v80];
          [v76 didTerminate:v81];
        }
      }
      else
      {
      }
    }
    else
    {
      objc_storeStrong((id *)&self->_currentTag, a3);
      ((void (**)(id, id, id))v84)[2](v84, v58, 0);
      id v51 = 0;
      ++self->_totalTagRead;
      self->_int64_t uiStateOnInvalidation = 1;
    }

    unsigned __int8 v52 = v84;
    uint64_t v53 = v85;
  }
  else
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v34 = NFLogGetLogger();
    if (v34)
    {
      __int16 v35 = (void (*)(uint64_t, const char *, ...))v34;
      int v36 = object_getClass(self);
      BOOL v37 = class_isMetaClass(v36);
      unsigned int v38 = object_getClassName(self);
      uint64_t v82 = sel_getName(a2);
      uint64_t v39 = 45;
      if (v37) {
        uint64_t v39 = 43;
      }
      v35(6, "%c[%{public}s %{public}s]:%i Missing required entitlements", v39, v38, v82, 757);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    unsigned __int8 v40 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
    {
      id v41 = object_getClass(self);
      if (class_isMetaClass(v41)) {
        int v42 = 43;
      }
      else {
        int v42 = 45;
      }
      BOOL v43 = object_getClassName(self);
      uint64_t v44 = sel_getName(a2);
      *(_DWORD *)id buf = 67109890;
      int v94 = v42;
      __int16 v95 = 2082;
      uint64_t v96 = v43;
      __int16 v97 = 2082;
      id v98 = v44;
      __int16 v99 = 1024;
      int v100 = 757;
      _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Missing required entitlements", buf, 0x22u);
    }

    id v45 = objc_alloc((Class)NSError);
    uint64_t v46 = +[NSString stringWithUTF8String:"nfcd"];
    v91[0] = NSLocalizedDescriptionKey;
    uint64_t v47 = +[NSString stringWithUTF8String:"Not entitled"];
    v92[0] = v47;
    v92[1] = &off_10031D800;
    v91[1] = @"Line";
    v91[2] = @"Method";
    id v48 = [objc_alloc((Class)NSString) initWithFormat:@"%s", sel_getName(a2)];
    v92[2] = v48;
    v91[3] = NSDebugDescriptionErrorKey;
    id v49 = [objc_alloc((Class)NSString) initWithFormat:@"%s:%d", sel_getName(a2), 758];
    v92[3] = v49;
    char v50 = +[NSDictionary dictionaryWithObjects:v92 forKeys:v91 count:4];
    id v51 = [v45 initWithDomain:v46 code:32 userInfo:v50];

    unsigned __int8 v52 = v84;
    v84[2](v84, 0, v51);
    uint64_t v53 = v85;
    +[NFExceptionsCALogger postAnalyticsReaderModeExceptionForType:tagType:rfFrameInterface:withErrorCode:](NFExceptionsCALogger, "postAnalyticsReaderModeExceptionForType:tagType:rfFrameInterface:withErrorCode:", 1, -[_NFReaderSession _getTagTypeFromTag:](self, "_getTagTypeFromTag:", v85), (self->_pollingConfig >> 12) & 1, [v51 code]);
  }
}

- (void)connect:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)_NFReaderSession;
  int64_t v9 = [(_NFSession *)&v16 workQueue];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1001B7BC4;
  v12[3] = &unk_100302278;
  id v14 = v8;
  SEL v15 = a2;
  v12[4] = self;
  id v13 = v7;
  id v10 = v7;
  id v11 = v8;
  dispatch_async(v9, v12);
}

- (id)_disconnectWithCardRemoval:(BOOL)a3
{
  currentTag = self->_currentTag;
  if (!currentTag)
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      int64_t v9 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      uint64_t v13 = 45;
      if (isMetaClass) {
        uint64_t v13 = 43;
      }
      v9(3, "%c[%{public}s %{public}s]:%i Invalid tag state", v13, ClassName, Name, 838);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    id v14 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      SEL v15 = object_getClass(self);
      if (class_isMetaClass(v15)) {
        int v16 = 43;
      }
      else {
        int v16 = 45;
      }
      *(_DWORD *)id buf = 67109890;
      int v39 = v16;
      __int16 v40 = 2082;
      id v41 = object_getClassName(self);
      __int16 v42 = 2082;
      BOOL v43 = sel_getName(a2);
      __int16 v44 = 1024;
      int v45 = 838;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Invalid tag state", buf, 0x22u);
    }

    id v17 = objc_alloc((Class)NSError);
    uint64_t v18 = +[NSString stringWithUTF8String:"nfcd"];
    NSErrorUserInfoKey v36 = NSLocalizedDescriptionKey;
    id v19 = +[NSString stringWithUTF8String:"Invalid State"];
    BOOL v37 = v19;
    int v20 = +[NSDictionary dictionaryWithObjects:&v37 forKeys:&v36 count:1];
    int v21 = v17;
    id v22 = v18;
    uint64_t v23 = 12;
    goto LABEL_20;
  }
  unsigned int v5 = a3;
  if ([(NFTag *)currentTag type]) {
    unsigned int v6 = [(NFTag *)self->_currentTag type];
  }
  else {
    unsigned int v6 = sub_10018F854((uint64_t)self->_driverWrapper, self->_currentTag);
  }
  unsigned int v24 = v6;
  unsigned int v25 = sub_10023D968();
  sub_10023DAD0((uint64_t)v25, self->_currentTag, v24);

  unsigned int v26 = sub_1001900C4(self->_driverWrapper, self->_currentTag, v5);
  BOOL v27 = self->_currentTag;
  self->_currentTag = 0;

  if (v26)
  {
    id v28 = objc_alloc((Class)NSError);
    uint64_t v18 = +[NSString stringWithUTF8String:"nfcd"];
    uint64_t v29 = v26;
    NSErrorUserInfoKey v34 = NSLocalizedDescriptionKey;
    if (v26 >= 0x47) {
      int v30 = 71;
    }
    else {
      int v30 = v26;
    }
    id v19 = +[NSString stringWithUTF8String:off_100306978[v30]];
    __int16 v35 = v19;
    int v20 = +[NSDictionary dictionaryWithObjects:&v35 forKeys:&v34 count:1];
    int v21 = v28;
    id v22 = v18;
    uint64_t v23 = v29;
LABEL_20:
    id v31 = [v21 initWithDomain:v22 code:v23 userInfo:v20];

    goto LABEL_22;
  }
  id v31 = 0;
LABEL_22:

  return v31;
}

- (void)disconnectWithCardRemoval:(BOOL)a3 completion:(id)a4
{
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)_NFReaderSession;
  id v8 = [(_NFSession *)&v14 workQueue];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1001B82F8;
  v10[3] = &unk_100302E40;
  id v11 = v7;
  SEL v12 = a2;
  v10[4] = self;
  BOOL v13 = a3;
  id v9 = v7;
  dispatch_async(v8, v10);
}

- (void)_sync_transceive:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = (void (**)(id, NFTag *, void, id))a4;
  id v9 = v7;
  unsigned int v10 = [(_NFReaderSession *)self _isCoreNFCSession];
  tagWhiteList = self->_tagWhiteList;
  if (v10)
  {
    if (([(NFServiceWhitelistChecker *)tagWhiteList nfcTagReaderAccess] & 1) == 0
      && ([(NFServiceWhitelistChecker *)self->_tagWhiteList nfcISO15693ReaderAccess] & 1) == 0&& ([(NFServiceWhitelistChecker *)self->_tagWhiteList nfcVASReaderAccess] & 1) == 0)
    {
      goto LABEL_5;
    }
  }
  else if (([(NFServiceWhitelistChecker *)tagWhiteList internalAccess] & 1) == 0)
  {
LABEL_5:
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      BOOL v13 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      uint64_t v17 = 45;
      if (isMetaClass) {
        uint64_t v17 = 43;
      }
      v13(3, "%c[%{public}s %{public}s]:%i Invalid entitlement configuration.", v17, ClassName, Name, 888);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v18 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      id v19 = object_getClass(self);
      if (class_isMetaClass(v19)) {
        int v20 = 43;
      }
      else {
        int v20 = 45;
      }
      *(_DWORD *)id buf = 67109890;
      *(_DWORD *)uint64_t v92 = v20;
      *(_WORD *)&void v92[4] = 2082;
      *(void *)&v92[6] = object_getClassName(self);
      *(_WORD *)&v92[14] = 2082;
      *(void *)&v92[16] = sel_getName(a2);
      __int16 v93 = 1024;
      int v94 = 888;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Invalid entitlement configuration.", buf, 0x22u);
    }

    id v21 = objc_alloc((Class)NSError);
    id v22 = +[NSString stringWithUTF8String:"nfcd"];
    NSErrorUserInfoKey v99 = NSLocalizedDescriptionKey;
    uint64_t v23 = +[NSString stringWithUTF8String:"Not entitled"];
    int v100 = v23;
    unsigned int v24 = +[NSDictionary dictionaryWithObjects:&v100 forKeys:&v99 count:1];
    id v25 = [v21 initWithDomain:v22 code:32 userInfo:v24];

    v8[2](v8, self->_currentTag, 0, v25);
    +[NFExceptionsCALogger postAnalyticsReaderModeExceptionForType:tagType:rfFrameInterface:withErrorCode:](NFExceptionsCALogger, "postAnalyticsReaderModeExceptionForType:tagType:rfFrameInterface:withErrorCode:", 3, -[_NFReaderSession _getTagTypeFromTag:](self, "_getTagTypeFromTag:", self->_currentTag), (self->_pollingConfig >> 12) & 1, [v25 code]);
    sub_100223B0C((uint64_t)NFDailyStatisticsCALogger, @"readerModeTransceiveErrorCount");
    goto LABEL_77;
  }
  char v88 = 0;
  if ([(_NFReaderSession *)self _isCoreNFCSession])
  {
    v86[0] = _NSConcreteStackBlock;
    v86[1] = 3221225472;
    v86[2] = sub_1001B9384;
    v86[3] = &unk_100306C60;
    v86[4] = self;
    NSErrorUserInfoKey v87 = v8;
    unsigned int v26 = objc_retainBlock(v86);
    if ([(NFTag *)self->_currentTag type] == 8)
    {
      uint64_t v27 = [(_NFReaderSession *)self _validateISO15693Packet:v9];
      if (v27)
      {
LABEL_19:
        ((void (*)(void *, uint64_t))v26[2])(v26, v27);
LABEL_25:

        id v25 = 0;
        goto LABEL_77;
      }
    }
    else if ([(NFTag *)self->_currentTag type] == 3 {
           || [(NFTag *)self->_currentTag type] == 6)
    }
    {
      id v28 = [objc_alloc((Class)NFCommandAPDU) initWithData:v9];
      uint64_t v29 = [(_NFReaderSession *)self _validateAPDU:v28 outCheckFciResponse:&v88];
      if (v29)
      {
        ((void (*)(void *, uint64_t))v26[2])(v26, v29);

        goto LABEL_25;
      }
    }
    else if ([(NFTag *)self->_currentTag type] == 7)
    {
      uint64_t v27 = [(_NFReaderSession *)self _validateFelicaCommand:v9];
      if (v27) {
        goto LABEL_19;
      }
    }
  }
  if (self->_currentTag)
  {
    int v30 = NFSharedSignpostLog();
    if (os_signpost_enabled(v30))
    {
      *(_WORD *)id buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v30, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "TRANSCEIVE", (const char *)&unk_100286819, buf, 2u);
    }
    sel = a2;

    driverWrapper = self->_driverWrapper;
    currentTag = self->_currentTag;
    [(NFServiceWhitelistChecker *)self->_tagWhiteList sessionTimeLimit];
    id v85 = 0;
    unsigned __int8 v33 = sub_100195A20(driverWrapper, v9, currentTag, &v85);
    id v25 = v85;
    NSErrorUserInfoKey v34 = NFSharedSignpostLog();
    if (os_signpost_enabled(v34))
    {
      id v35 = [v9 length];
      id v36 = [v33 length];
      *(_DWORD *)id buf = 134349312;
      *(void *)uint64_t v92 = v35;
      *(_WORD *)&v92[8] = 2050;
      *(void *)&v92[10] = v36;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v34, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "TRANSCEIVE", "send=%{public,signpost.description:attribute}lu, receive=%{public,signpost.description:attribute}lu", buf, 0x16u);
    }

    id v37 = [v25 code];
    if (v9)
    {
      id v38 = [v9 length];
      if (v33)
      {
LABEL_37:
        int v39 = (char *)[v33 length];
LABEL_50:
        uint64_t v55 = sub_10023D968();
        if (v55 && *(void *)(v55 + 40))
        {
          ++*(_DWORD *)(v55 + 24);
          BOOL v56 = &v39[*(void *)(v55 + 16)];
          *(void *)(v55 + 8) += v38;
          *(void *)(v55 + 16) = v56;
        }

        if (([(NFServiceWhitelistChecker *)self->_tagWhiteList internalAccess] & 1) == 0
          && [(NFTag *)self->_currentTag type] == 7)
        {
          id v84 = 0;
          unsigned int v57 = [(_NFReaderSession *)self _isFelicaPollingCommand:v9 systemCode:&v84];
          id v58 = v84;
          if (v57 && (unint64_t)[v33 length] >= 0x12)
          {
            id v59 = [objc_alloc((Class)NFTagInternal) initWithNFTag:self->_currentTag];
            [v59 _setSystemCode:v58];
            int v60 = [v33 subdataWithRange:2, 8];
            [v59 _setIDm:v60];

            uint64_t v61 = [v33 subdataWithRange:NSMakeRange(10, 8)];
            [v59 _setPMm:v61];

            int v62 = self->_currentTag;
            self->_currentTag = (NFTag *)v59;
          }
        }
        if (v37 == (id)64) {
          goto LABEL_63;
        }
        if ([(NFTag *)self->_currentTag type] == 15
          || [(NFTag *)self->_currentTag type] == 16)
        {
          if ([(_NFReaderSession *)self _validateMifareAPDU:v9 response:v33])
          {
LABEL_63:
            ((void (**)(id, NFTag *, void *, id))v8)[2](v8, self->_currentTag, v33, v25);
LABEL_76:

            goto LABEL_77;
          }
        }
        else if (!v88 {
               || [(_NFReaderSession *)self validateAID:v9 withSelectResponse:v33 outRealAid:0])
        }
        {
          goto LABEL_63;
        }
        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        uint64_t v63 = NFLogGetLogger();
        if (v63)
        {
          id v64 = (void (*)(uint64_t, const char *, ...))v63;
          id v65 = object_getClass(self);
          BOOL v66 = class_isMetaClass(v65);
          __int16 v79 = object_getClassName(self);
          uint64_t v82 = sel_getName(sel);
          uint64_t v67 = 45;
          if (v66) {
            uint64_t v67 = 43;
          }
          v64(3, "%c[%{public}s %{public}s]:%i Invalid AID selection: %{public}@, forcing disconnect", v67, v79, v82, 996, v9);
        }
        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        uint64_t v68 = NFSharedLogGetLogger();
        if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR))
        {
          id v69 = object_getClass(self);
          if (class_isMetaClass(v69)) {
            int v70 = 43;
          }
          else {
            int v70 = 45;
          }
          unsigned int v71 = object_getClassName(self);
          int v72 = sel_getName(sel);
          *(_DWORD *)id buf = 67110146;
          *(_DWORD *)uint64_t v92 = v70;
          *(_WORD *)&void v92[4] = 2082;
          *(void *)&v92[6] = v71;
          *(_WORD *)&v92[14] = 2082;
          *(void *)&v92[16] = v72;
          __int16 v93 = 1024;
          int v94 = 996;
          __int16 v95 = 2114;
          id v96 = v9;
          _os_log_impl((void *)&_mh_execute_header, v68, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Invalid AID selection: %{public}@, forcing disconnect", buf, 0x2Cu);
        }

        id v73 = [(_NFReaderSession *)self _disconnectWithCardRemoval:0];
        id v74 = objc_alloc((Class)NSError);
        id v75 = +[NSString stringWithUTF8String:"nfcd"];
        NSErrorUserInfoKey v89 = NSLocalizedDescriptionKey;
        int v76 = +[NSString stringWithUTF8String:"Not entitled"];
        id v90 = v76;
        id v77 = +[NSDictionary dictionaryWithObjects:&v90 forKeys:&v89 count:1];
        id v78 = [v74 initWithDomain:v75 code:32 userInfo:v77];
        v8[2](v8, 0, 0, v78);

        +[NFExceptionsCALogger postAnalyticsReaderModeExceptionForType:3 tagType:[(_NFReaderSession *)self _getTagTypeFromTag:self->_currentTag] rfFrameInterface:(self->_pollingConfig >> 12) & 1 withErrorCode:8];
        sub_100223B0C((uint64_t)NFDailyStatisticsCALogger, @"readerModeTransceiveErrorCount");
        goto LABEL_76;
      }
    }
    else
    {
      id v38 = 0;
      if (v33) {
        goto LABEL_37;
      }
    }
    int v39 = 0;
    goto LABEL_50;
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t v40 = NFLogGetLogger();
  if (v40)
  {
    id v41 = (void (*)(uint64_t, const char *, ...))v40;
    __int16 v42 = object_getClass(self);
    BOOL v43 = class_isMetaClass(v42);
    __int16 v44 = object_getClassName(self);
    id v81 = sel_getName(a2);
    uint64_t v45 = 45;
    if (v43) {
      uint64_t v45 = 43;
    }
    v41(3, "%c[%{public}s %{public}s]:%i No tag is connected", v45, v44, v81, 956);
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t v46 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
  {
    uint64_t v47 = object_getClass(self);
    if (class_isMetaClass(v47)) {
      int v48 = 43;
    }
    else {
      int v48 = 45;
    }
    id v49 = object_getClassName(self);
    char v50 = sel_getName(a2);
    *(_DWORD *)id buf = 67109890;
    *(_DWORD *)uint64_t v92 = v48;
    *(_WORD *)&void v92[4] = 2082;
    *(void *)&v92[6] = v49;
    *(_WORD *)&v92[14] = 2082;
    *(void *)&v92[16] = v50;
    __int16 v93 = 1024;
    int v94 = 956;
    _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i No tag is connected", buf, 0x22u);
  }

  id v51 = objc_alloc((Class)NSError);
  unsigned __int8 v52 = +[NSString stringWithUTF8String:"nfcd"];
  NSErrorUserInfoKey v97 = NSLocalizedDescriptionKey;
  uint64_t v53 = +[NSString stringWithUTF8String:"Tag Not Found"];
  id v98 = v53;
  id v54 = +[NSDictionary dictionaryWithObjects:&v98 forKeys:&v97 count:1];
  id v25 = [v51 initWithDomain:v52 code:28 userInfo:v54];

  v8[2](v8, self->_currentTag, 0, v25);
LABEL_77:
}

- (void)transceive:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)_NFReaderSession;
  id v9 = [(_NFSession *)&v16 workQueue];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1001B96FC;
  v12[3] = &unk_100302278;
  id v14 = v8;
  SEL v15 = a2;
  v12[4] = self;
  id v13 = v7;
  id v10 = v7;
  id v11 = v8;
  dispatch_async(v9, v12);
}

- (void)checkNdefSupportWithCompletion:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_NFReaderSession;
  unsigned int v6 = [(_NFSession *)&v11 workQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001B9AC4;
  block[3] = &unk_100301D38;
  id v9 = v5;
  SEL v10 = a2;
  block[4] = self;
  id v7 = v5;
  dispatch_async(v6, block);
}

- (void)ndefReadWithCompletion:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_NFReaderSession;
  unsigned int v6 = [(_NFSession *)&v11 workQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001BA240;
  block[3] = &unk_100301D38;
  id v9 = v5;
  SEL v10 = a2;
  block[4] = self;
  id v7 = v5;
  dispatch_async(v6, block);
}

- (void)ndefWrite:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)_NFReaderSession;
  id v9 = [(_NFSession *)&v16 workQueue];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1001BAFA4;
  v12[3] = &unk_100302278;
  id v14 = v8;
  SEL v15 = a2;
  v12[4] = self;
  id v13 = v7;
  id v10 = v7;
  id v11 = v8;
  dispatch_async(v9, v12);
}

- (void)formatNdefWithKey:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)_NFReaderSession;
  id v9 = [(_NFSession *)&v16 workQueue];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1001BBDD8;
  v12[3] = &unk_100302278;
  id v14 = v8;
  SEL v15 = a2;
  v12[4] = self;
  id v13 = v7;
  id v10 = v7;
  id v11 = v8;
  dispatch_async(v9, v12);
}

- (void)checkPresenceWithCompletion:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_NFReaderSession;
  unsigned int v6 = [(_NFSession *)&v11 workQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001BC680;
  block[3] = &unk_100301D38;
  id v9 = v5;
  SEL v10 = a2;
  block[4] = self;
  id v7 = v5;
  dispatch_async(v6, block);
}

- (void)_updateReaderSettingsBasedOnConfig:(unint64_t)a3
{
  unint64_t sessionConfig = self->_sessionConfig;
  if ((sessionConfig & 0x400) != 0)
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      id v7 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      uint64_t v11 = 45;
      if (isMetaClass) {
        uint64_t v11 = 43;
      }
      v7(6, "%c[%{public}s %{public}s]:%i PACE support declared by SessionConfig", v11, ClassName, Name, 1228);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    SEL v12 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      id v13 = object_getClass(self);
      if (class_isMetaClass(v13)) {
        int v14 = 43;
      }
      else {
        int v14 = 45;
      }
      *(_DWORD *)id buf = 67109890;
      int v69 = v14;
      __int16 v70 = 2082;
      unsigned int v71 = object_getClassName(self);
      __int16 v72 = 2082;
      id v73 = sel_getName(a2);
      __int16 v74 = 1024;
      int v75 = 1228;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i PACE support declared by SessionConfig", buf, 0x22u);
    }
  }
  uint64_t v15 = (sessionConfig >> 10) & 1;
  BOOL v16 = (a3 & 8) != 0 || a3 == 1;
  int v17 = !v16;
  if (v16)
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v18 = NFLogGetLogger();
    if (v18)
    {
      id v19 = (void (*)(uint64_t, const char *, ...))v18;
      int v20 = object_getClass(self);
      BOOL v21 = class_isMetaClass(v20);
      id v22 = object_getClassName(self);
      id v59 = sel_getName(a2);
      uint64_t v23 = 45;
      if (v21) {
        uint64_t v23 = 43;
      }
      v19(6, "%c[%{public}s %{public}s]:%i Polling options are PACE compatible", v23, v22, v59, 1235);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    unsigned int v24 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      id v25 = object_getClass(self);
      if (class_isMetaClass(v25)) {
        int v26 = 43;
      }
      else {
        int v26 = 45;
      }
      uint64_t v27 = object_getClassName(self);
      id v28 = sel_getName(a2);
      *(_DWORD *)id buf = 67109890;
      int v69 = v26;
      __int16 v70 = 2082;
      unsigned int v71 = v27;
      __int16 v72 = 2082;
      id v73 = v28;
      __int16 v74 = 1024;
      int v75 = 1235;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Polling options are PACE compatible", buf, 0x22u);
    }
  }
  long long v65 = 0u;
  long long v66 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  uint64_t v29 = self->_iso7816AppList;
  id v30 = [(NSMutableOrderedSet *)v29 countByEnumeratingWithState:&v63 objects:v67 count:16];
  if (v30)
  {
    id v31 = v30;
    uint64_t v32 = *(void *)v64;
    do
    {
      for (uint64_t i = 0; i != v31; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v64 != v32) {
          objc_enumerationMutation(v29);
        }
        NSErrorUserInfoKey v34 = *(void **)(*((void *)&v63 + 1) + 8 * i);
        if ([v34 type] == (id)2)
        {
          if (((v17 | v15) & 1) == 0)
          {
            dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
            uint64_t v35 = NFLogGetLogger();
            if (v35)
            {
              id v36 = (void (*)(uint64_t, const char *, ...))v35;
              id v37 = object_getClass(self);
              BOOL v38 = class_isMetaClass(v37);
              int v39 = object_getClassName(self);
              int v60 = sel_getName(a2);
              uint64_t v40 = 45;
              if (v38) {
                uint64_t v40 = 43;
              }
              v36(6, "%c[%{public}s %{public}s]:%i PACE support enabled by polling compatibility and AID list in app", v40, v39, v60, 1241);
            }
            dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
            id v41 = NFSharedLogGetLogger();
            if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
            {
              __int16 v42 = object_getClass(self);
              if (class_isMetaClass(v42)) {
                int v43 = 43;
              }
              else {
                int v43 = 45;
              }
              __int16 v44 = object_getClassName(self);
              uint64_t v45 = sel_getName(a2);
              *(_DWORD *)id buf = 67109890;
              int v69 = v43;
              __int16 v70 = 2082;
              unsigned int v71 = v44;
              __int16 v72 = 2082;
              id v73 = v45;
              __int16 v74 = 1024;
              int v75 = 1241;
              _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i PACE support enabled by polling compatibility and AID list in app", buf, 0x22u);
            }

            LODWORD(v15) = 1;
          }
        }
        else if ([v34 type] == (id)3)
        {
          self->_sessionConfig |= 0x100uLL;
        }
      }
      id v31 = [(NSMutableOrderedSet *)v29 countByEnumeratingWithState:&v63 objects:v67 count:16];
    }
    while (v31);
  }

  if (v15)
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v46 = NFLogGetLogger();
    if (v46)
    {
      uint64_t v47 = (void (*)(uint64_t, const char *, ...))v46;
      int v48 = object_getClass(self);
      BOOL v49 = class_isMetaClass(v48);
      char v50 = object_getClassName(self);
      uint64_t v61 = sel_getName(a2);
      uint64_t v51 = 45;
      if (v49) {
        uint64_t v51 = 43;
      }
      v47(6, "%c[%{public}s %{public}s]:%i Enabling dynamic bba for PACE", v51, v50, v61, 1253);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    unsigned __int8 v52 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v53 = object_getClass(self);
      if (class_isMetaClass(v53)) {
        int v54 = 43;
      }
      else {
        int v54 = 45;
      }
      uint64_t v55 = object_getClassName(self);
      BOOL v56 = sel_getName(a2);
      *(_DWORD *)id buf = 67109890;
      int v69 = v54;
      __int16 v70 = 2082;
      unsigned int v71 = v55;
      __int16 v72 = 2082;
      id v73 = v56;
      __int16 v74 = 1024;
      int v75 = 1253;
      _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Enabling dynamic bba for PACE", buf, 0x22u);
    }

    unsigned int v57 = sub_1001E0EB8(self->_driverWrapper);

    if (!v57) {
      self->_didEnableDynamicBBA = 1;
    }
  }
}

- (void)_sync_startPollingForTags:(unint64_t)a3 sessionConfig:(unint64_t)a4 completion:(id)a5
{
  id v131 = a5;
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t Logger = NFLogGetLogger();
  unint64_t v132 = a4;
  if (Logger)
  {
    id v9 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    id v13 = self;
    Name = sel_getName(a2);
    uint64_t v15 = [(_NFXPCSession *)v13 clientName];
    BOOL v16 = [(_NFXPCSession *)v13 connection];
    unint64_t v17 = a3;
    id v18 = [v16 processIdentifier];
    id v19 = [(_NFSession *)v13 sessionUID];
    id v129 = v18;
    a3 = v17;
    id v122 = Name;
    self = v13;
    uint64_t v20 = 43;
    if (!isMetaClass) {
      uint64_t v20 = 45;
    }
    __int16 v119 = ClassName;
    a4 = v132;
    v9(6, "%c[%{public}s %{public}s]:%i %{public}@ (%d) %{public}@", v20, v119, v122, 1262, v15, v129, v19);
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  BOOL v21 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    id v22 = object_getClass(self);
    if (class_isMetaClass(v22)) {
      int v23 = 43;
    }
    else {
      int v23 = 45;
    }
    unsigned int v24 = object_getClassName(self);
    unint64_t v25 = a3;
    int v26 = sel_getName(a2);
    uint64_t v27 = [(_NFXPCSession *)self clientName];
    id v28 = [(_NFXPCSession *)self connection];
    unsigned int v29 = [v28 processIdentifier];
    [(_NFSession *)self sessionUID];
    id v30 = v130 = self;
    *(_DWORD *)id buf = 67110658;
    int v149 = v23;
    __int16 v150 = 2082;
    v151 = v24;
    __int16 v152 = 2082;
    id v153 = v26;
    a3 = v25;
    __int16 v154 = 1024;
    int v155 = 1262;
    __int16 v156 = 2114;
    v157 = v27;
    __int16 v158 = 1024;
    unsigned int v159 = v29;
    __int16 v160 = 2114;
    v161 = v30;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i %{public}@ (%d) %{public}@", buf, 0x3Cu);

    self = v130;
    a4 = v132;
  }
  self->_pollingConfig = 0;
  if (a4 & 0xFFFFFFFFFFFFF380 | a3 & 0xFFFFFFFFFFFFFFE2)
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v31 = NFLogGetLogger();
    if (v31)
    {
      uint64_t v32 = (void (*)(uint64_t, const char *, ...))v31;
      unsigned __int8 v33 = object_getClass(self);
      BOOL v34 = class_isMetaClass(v33);
      uint64_t v35 = object_getClassName(self);
      long long v123 = sel_getName(a2);
      uint64_t v36 = 45;
      if (v34) {
        uint64_t v36 = 43;
      }
      v32(4, "%c[%{public}s %{public}s]:%i Invalid parameters", v36, v35, v123, 1269);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    id v37 = NFSharedLogGetLogger();
    BOOL v38 = (void (**)(void, void))v131;
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
    {
      int v39 = object_getClass(self);
      if (class_isMetaClass(v39)) {
        int v40 = 43;
      }
      else {
        int v40 = 45;
      }
      id v41 = object_getClassName(self);
      __int16 v42 = sel_getName(a2);
      *(_DWORD *)id buf = 67109890;
      int v149 = v40;
      __int16 v150 = 2082;
      v151 = v41;
      __int16 v152 = 2082;
      id v153 = v42;
      __int16 v154 = 1024;
      int v155 = 1269;
      _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Invalid parameters", buf, 0x22u);
    }

    id v43 = objc_alloc((Class)NSError);
    __int16 v44 = +[NSString stringWithUTF8String:"nfcd"];
    NSErrorUserInfoKey v146 = NSLocalizedDescriptionKey;
    uint64_t v45 = +[NSString stringWithUTF8String:"Invalid Parameter"];
    v147 = v45;
    uint64_t v46 = &v147;
    uint64_t v47 = &v146;
LABEL_21:
    int v48 = +[NSDictionary dictionaryWithObjects:v46 forKeys:v47 count:1];
    BOOL v49 = v43;
    char v50 = v44;
    uint64_t v51 = 10;
LABEL_22:
    id v52 = [v49 initWithDomain:v50 code:v51 userInfo:v48];
    ((void (**)(void, id))v38)[2](v38, v52);

    goto LABEL_99;
  }
  unsigned __int8 v53 = [(_NFReaderSession *)self _isCoreNFCSession];
  if (a3 != 1
    || (v53 & 1) != 0
    || ![(NFServiceWhitelistChecker *)self->_tagWhiteList internalAccess])
  {
    if (![(_NFReaderSession *)self _isCoreNFCSession]) {
      goto LABEL_69;
    }
    if ((a3 & 4) != 0
      && ((a4 & 0x20) != 0
       && ([(NFServiceWhitelistChecker *)self->_tagWhiteList nfcISO15693ReaderAccess] & 1) != 0|| [(NFServiceWhitelistChecker *)self->_tagWhiteList nfcTagReaderAccess]))
    {
      self->_pollingConfig |= 8u;
    }
    if ((a4 & 0x400) != 0)
    {
      unsigned int v66 = [(NFServiceWhitelistChecker *)self->_tagWhiteList nfcTagReaderPACEPollingAllow];
      if ((a3 & 8) == 0) {
        goto LABEL_51;
      }
    }
    else
    {
      unsigned int v66 = 1;
      if ((a3 & 8) == 0) {
        goto LABEL_51;
      }
    }
    if ([(NFServiceWhitelistChecker *)self->_tagWhiteList nfcTagReaderAccess] && v66) {
      self->_pollingConfig |= 3u;
    }
LABEL_51:
    if ((a3 & 0x10) != 0
      && [(NFServiceWhitelistChecker *)self->_tagWhiteList nfcTagReaderAccess])
    {
      if (![(NSMutableArray *)self->_feliCaSystemCodeList count])
      {
        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        uint64_t v108 = NFLogGetLogger();
        if (v108)
        {
          long long v109 = (void (*)(uint64_t, const char *, ...))v108;
          long long v110 = object_getClass(self);
          BOOL v111 = class_isMetaClass(v110);
          v112 = object_getClassName(self);
          id v128 = sel_getName(a2);
          uint64_t v113 = 45;
          if (v111) {
            uint64_t v113 = 43;
          }
          v109(6, "%c[%{public}s %{public}s]:%i \"com.apple.developer.nfc.readersession.felica.systemcodes\" must contain at least 1 valid entry", v113, v112, v128, 1316);
        }
        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        int v114 = NFSharedLogGetLogger();
        BOOL v38 = (void (**)(void, void))v131;
        if (os_log_type_enabled(v114, OS_LOG_TYPE_DEFAULT))
        {
          __int16 v115 = object_getClass(self);
          if (class_isMetaClass(v115)) {
            int v116 = 43;
          }
          else {
            int v116 = 45;
          }
          __int16 v117 = object_getClassName(self);
          char v118 = sel_getName(a2);
          *(_DWORD *)id buf = 67109890;
          int v149 = v116;
          __int16 v150 = 2082;
          v151 = v117;
          __int16 v152 = 2082;
          id v153 = v118;
          __int16 v154 = 1024;
          int v155 = 1316;
          _os_log_impl((void *)&_mh_execute_header, v114, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i \"com.apple.developer.nfc.readersession.felica.systemcodes\" must contain at least 1 valid entry", buf, 0x22u);
        }

        id v104 = objc_alloc((Class)NSError);
        __int16 v44 = +[NSString stringWithUTF8String:"nfcd"];
        NSErrorUserInfoKey v142 = NSLocalizedDescriptionKey;
        uint64_t v45 = +[NSString stringWithUTF8String:"Not entitled"];
        int v143 = v45;
        __int16 v105 = &v143;
        long long v106 = &v142;
        goto LABEL_96;
      }
      self->_pollingConfig |= 4u;
    }
    self->_unint64_t sessionConfig = a4;
    [(_NFReaderSession *)self _updateReaderSettingsBasedOnConfig:a3];
    if ((a3 & 8) != 0
      && (self->_sessionConfig & 8) != 0
      && (([(NFServiceWhitelistChecker *)self->_tagWhiteList internalAccess] & 1) != 0
       || [(NFServiceWhitelistChecker *)self->_tagWhiteList nfcVASReaderAccess]))
    {
      self->_pollingConfig |= 0x10u;
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      uint64_t v67 = NFLogGetLogger();
      if (v67)
      {
        uint64_t v68 = (void (*)(uint64_t, const char *, ...))v67;
        int v69 = object_getClass(self);
        BOOL v70 = class_isMetaClass(v69);
        unint64_t v71 = a3;
        __int16 v72 = object_getClassName(self);
        long long v125 = sel_getName(a2);
        uint64_t v73 = 45;
        if (v70) {
          uint64_t v73 = 43;
        }
        int v120 = v72;
        a3 = v71;
        v68(6, "%c[%{public}s %{public}s]:%i Enabling VAS polling", v73, v120, v125, 1331);
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      __int16 v74 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v74, OS_LOG_TYPE_DEFAULT))
      {
        int v75 = object_getClass(self);
        unint64_t v76 = a3;
        if (class_isMetaClass(v75)) {
          int v77 = 43;
        }
        else {
          int v77 = 45;
        }
        id v78 = object_getClassName(self);
        __int16 v79 = sel_getName(a2);
        *(_DWORD *)id buf = 67109890;
        int v149 = v77;
        a3 = v76;
        __int16 v150 = 2082;
        v151 = v78;
        __int16 v152 = 2082;
        id v153 = v79;
        __int16 v154 = 1024;
        int v155 = 1331;
        _os_log_impl((void *)&_mh_execute_header, v74, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Enabling VAS polling", buf, 0x22u);
      }

      char v80 = 1;
      goto LABEL_83;
    }
LABEL_69:
    char v80 = 0;
    goto LABEL_83;
  }
  self->_pollingConfig = 15;
  BOOL vasECP = self->_vasECP;
  if (self->_pollingProfile == 4)
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v55 = NFLogGetLogger();
    BOOL v56 = (void (*)(uint64_t, const char *, ...))v55;
    if (vasECP)
    {
      if (v55)
      {
        unsigned int v57 = object_getClass(self);
        BOOL v58 = class_isMetaClass(v57);
        id v59 = object_getClassName(self);
        long long v124 = sel_getName(a2);
        uint64_t v60 = 45;
        if (v58) {
          uint64_t v60 = 43;
        }
        v56(6, "%c[%{public}s %{public}s]:%i Can't use ECP and non ecp profile", v60, v59, v124, 1282);
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      uint64_t v61 = NFSharedLogGetLogger();
      BOOL v38 = (void (**)(void, void))v131;
      if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
      {
        int v62 = object_getClass(self);
        if (class_isMetaClass(v62)) {
          int v63 = 43;
        }
        else {
          int v63 = 45;
        }
        long long v64 = object_getClassName(self);
        long long v65 = sel_getName(a2);
        *(_DWORD *)id buf = 67109890;
        int v149 = v63;
        __int16 v150 = 2082;
        v151 = v64;
        __int16 v152 = 2082;
        id v153 = v65;
        __int16 v154 = 1024;
        int v155 = 1282;
        _os_log_impl((void *)&_mh_execute_header, v61, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Can't use ECP and non ecp profile", buf, 0x22u);
      }

      id v43 = objc_alloc((Class)NSError);
      __int16 v44 = +[NSString stringWithUTF8String:"nfcd"];
      NSErrorUserInfoKey v144 = NSLocalizedDescriptionKey;
      uint64_t v45 = +[NSString stringWithUTF8String:"Invalid Parameter"];
      id v145 = v45;
      uint64_t v46 = &v145;
      uint64_t v47 = &v144;
      goto LABEL_21;
    }
    if (v55)
    {
      id v81 = object_getClass(self);
      BOOL v82 = class_isMetaClass(v81);
      v83 = object_getClassName(self);
      v126 = sel_getName(a2);
      uint64_t v84 = 45;
      if (v82) {
        uint64_t v84 = 43;
      }
      __int16 v121 = v83;
      a3 = 1;
      v56(6, "%c[%{public}s %{public}s]:%i Using non ecp polling", v84, v121, v126, 1286);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    id v85 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v85, OS_LOG_TYPE_DEFAULT))
    {
      id v86 = object_getClass(self);
      unint64_t v87 = a3;
      if (class_isMetaClass(v86)) {
        int v88 = 43;
      }
      else {
        int v88 = 45;
      }
      NSErrorUserInfoKey v89 = object_getClassName(self);
      id v90 = sel_getName(a2);
      *(_DWORD *)id buf = 67109890;
      int v149 = v88;
      a3 = v87;
      __int16 v150 = 2082;
      v151 = v89;
      __int16 v152 = 2082;
      id v153 = v90;
      __int16 v154 = 1024;
      int v155 = 1286;
      _os_log_impl((void *)&_mh_execute_header, v85, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Using non ecp polling", buf, 0x22u);
    }

    sub_1001E05E0(self->_driverWrapper);
  }
  else if (self->_vasECP)
  {
    self->_pollingConfig = 31;
  }
  char v80 = 0;
  self->_unint64_t sessionConfig = a4 | 1;
LABEL_83:
  if (!self->_pollingConfig)
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v93 = NFLogGetLogger();
    if (v93)
    {
      int v94 = (void (*)(uint64_t, const char *, ...))v93;
      __int16 v95 = object_getClass(self);
      BOOL v96 = class_isMetaClass(v95);
      NSErrorUserInfoKey v97 = object_getClassName(self);
      id v127 = sel_getName(a2);
      uint64_t v98 = 45;
      if (v96) {
        uint64_t v98 = 43;
      }
      v94(6, "%c[%{public}s %{public}s]:%i Missing required entitlements", v98, v97, v127, 1346);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    NSErrorUserInfoKey v99 = NFSharedLogGetLogger();
    BOOL v38 = (void (**)(void, void))v131;
    if (os_log_type_enabled(v99, OS_LOG_TYPE_DEFAULT))
    {
      int v100 = object_getClass(self);
      if (class_isMetaClass(v100)) {
        int v101 = 43;
      }
      else {
        int v101 = 45;
      }
      id v102 = object_getClassName(self);
      __int16 v103 = sel_getName(a2);
      *(_DWORD *)id buf = 67109890;
      int v149 = v101;
      __int16 v150 = 2082;
      v151 = v102;
      __int16 v152 = 2082;
      id v153 = v103;
      __int16 v154 = 1024;
      int v155 = 1346;
      _os_log_impl((void *)&_mh_execute_header, v99, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Missing required entitlements", buf, 0x22u);
    }

    id v104 = objc_alloc((Class)NSError);
    __int16 v44 = +[NSString stringWithUTF8String:"nfcd"];
    NSErrorUserInfoKey v140 = NSLocalizedDescriptionKey;
    uint64_t v45 = +[NSString stringWithUTF8String:"Not entitled"];
    id v141 = v45;
    __int16 v105 = &v141;
    long long v106 = &v140;
LABEL_96:
    int v48 = +[NSDictionary dictionaryWithObjects:v105 forKeys:v106 count:1];
    BOOL v49 = v104;
    char v50 = v44;
    uint64_t v51 = 32;
    goto LABEL_22;
  }
  v138[0] = _NSConcreteStackBlock;
  v138[1] = 3221225472;
  v138[2] = sub_1001BE448;
  v138[3] = &unk_100306C88;
  v138[4] = self;
  v138[5] = a2;
  v138[6] = a3;
  v138[7] = a4;
  char v139 = v80;
  id v91 = objc_retainBlock(v138);
  uint64_t v92 = v91;
  if (self->_uiService)
  {
    v134[0] = _NSConcreteStackBlock;
    v134[1] = 3221225472;
    v134[2] = sub_1001BE9C4;
    v134[3] = &unk_1003021D8;
    v134[4] = self;
    SEL v137 = a2;
    BOOL v38 = (void (**)(void, void))v131;
    id v135 = v131;
    id v136 = v92;
    [(_NFReaderSession *)self activateUIControllerWithCompletion:v134];
  }
  else
  {
    long long v107 = ((void (*)(void *))v91[2])(v91);
    BOOL v38 = (void (**)(void, void))v131;
    (*((void (**)(id, void *))v131 + 2))(v131, v107);
  }
LABEL_99:
}

- (void)_sync_setECPPayload:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = (void (**)(id, void))a4;
  id v9 = +[_NFHardwareManager sharedHardwareManager];
  unsigned __int8 v10 = [v9 configureECPPolling:v7];

  if (v10)
  {
    if ([(_NFReaderSession *)self _isPayloadConnectionHandover:v7]) {
      self->_isConnectionHandover = 1;
    }
    self->_BOOL vasECP = [v7 length] != 0;
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      SEL v12 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      if (self->_vasECP) {
        unint64_t v17 = "VAS ECP set";
      }
      else {
        unint64_t v17 = "VAS ECP not set";
      }
      uint64_t v18 = 45;
      if (isMetaClass) {
        uint64_t v18 = 43;
      }
      v12(6, "%c[%{public}s %{public}s]:%i %s", v18, ClassName, Name, 1425, v17);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    id v19 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v20 = object_getClass(self);
      if (class_isMetaClass(v20)) {
        int v21 = 43;
      }
      else {
        int v21 = 45;
      }
      id v22 = object_getClassName(self);
      int v23 = sel_getName(a2);
      unsigned int v24 = "VAS ECP not set";
      if (self->_vasECP) {
        unsigned int v24 = "VAS ECP set";
      }
      *(_DWORD *)id buf = 67110146;
      int v31 = v21;
      __int16 v32 = 2082;
      unsigned __int8 v33 = v22;
      __int16 v34 = 2082;
      uint64_t v35 = v23;
      __int16 v36 = 1024;
      int v37 = 1425;
      __int16 v38 = 2080;
      int v39 = v24;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i %s", buf, 0x2Cu);
    }

    v8[2](v8, 0);
  }
  else
  {
    self->_BOOL vasECP = 0;
    self->_isConnectionHandover = 0;
    id v25 = objc_alloc((Class)NSError);
    uint64_t v26 = +[NSString stringWithUTF8String:"nfcd"];
    NSErrorUserInfoKey v40 = NSLocalizedDescriptionKey;
    uint64_t v27 = +[NSString stringWithUTF8String:"Stack Error"];
    id v41 = v27;
    id v28 = +[NSDictionary dictionaryWithObjects:&v41 forKeys:&v40 count:1];
    id v29 = [v25 initWithDomain:v26 code:15 userInfo:v28];
    ((void (**)(id, id))v8)[2](v8, v29);

    id v8 = (void (**)(id, void))v26;
  }
}

- (void)setECPPayload:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)_NFReaderSession;
  id v9 = [(_NFSession *)&v16 workQueue];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1001BF080;
  v12[3] = &unk_100302278;
  id v14 = v8;
  SEL v15 = a2;
  v12[4] = self;
  id v13 = v7;
  id v10 = v7;
  id v11 = v8;
  dispatch_async(v9, v12);
}

- (BOOL)_isPayloadConnectionHandover:(id)a3
{
  v3 = [a3 bytes];
  BOOL v4 = *v3 == 106 && v3[1] == 2;
  BOOL v5 = v3[3] == 5 && !v3[4] && v3[5] == 1;
  return v4 && v5;
}

- (void)startPollingForTags:(unint64_t)a3 sessionConfig:(unint64_t)a4 completion:(id)a5
{
  id v9 = a5;
  v17.receiver = self;
  v17.super_class = (Class)_NFReaderSession;
  id v10 = [(_NFSession *)&v17 workQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001BF4C0;
  block[3] = &unk_100306CB0;
  block[4] = self;
  id v13 = v9;
  SEL v14 = a2;
  unint64_t v15 = a3;
  unint64_t v16 = a4;
  id v11 = v9;
  dispatch_async(v10, block);
}

- (void)skipMifareClassificationWithCompletion:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_NFReaderSession;
  unsigned int v6 = [(_NFSession *)&v11 workQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001BF880;
  block[3] = &unk_100301D38;
  id v9 = v5;
  SEL v10 = a2;
  block[4] = self;
  id v7 = v5;
  dispatch_async(v6, block);
}

- (void)startPollingWithConfig:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)_NFReaderSession;
  id v9 = [(_NFSession *)&v16 workQueue];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1001BFD58;
  v12[3] = &unk_100302278;
  id v14 = v8;
  SEL v15 = a2;
  v12[4] = self;
  id v13 = v7;
  id v10 = v7;
  id v11 = v8;
  dispatch_async(v9, v12);
}

- (void)_sync_startPollingWithConfig:(id)a3 completion:(id)a4
{
  id v7 = a3;
  __int16 v150 = (void (**)(id, id))a4;
  int v8 = NFIsInternalBuild();
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t Logger = NFLogGetLogger();
  id v10 = (void (*)(uint64_t, const char *, ...))Logger;
  sel = a2;
  if (v8)
  {
    if (Logger)
    {
      Class = object_getClass(self);
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      SEL v15 = [(_NFXPCSession *)self clientName];
      objc_super v16 = [(_NFXPCSession *)self connection];
      id v17 = [v16 processIdentifier];
      uint64_t v18 = [(_NFSession *)self sessionUID];
      uint64_t v19 = 43;
      if (!isMetaClass) {
        uint64_t v19 = 45;
      }
      v10(6, "%c[%{public}s %{public}s]:%i %{public}@ (%d) %{public}@, config=%{public}@", v19, ClassName, Name, 1494, v15, v17, v18, v7);

      a2 = sel;
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v20 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      int v21 = object_getClass(self);
      if (class_isMetaClass(v21)) {
        int v22 = 43;
      }
      else {
        int v22 = 45;
      }
      int v23 = object_getClassName(self);
      unsigned int v24 = sel_getName(a2);
      id v25 = [(_NFXPCSession *)self clientName];
      uint64_t v26 = [(_NFXPCSession *)self connection];
      unsigned int v27 = [v26 processIdentifier];
      id v28 = [(_NFSession *)self sessionUID];
      *(_DWORD *)id buf = 67110914;
      int v169 = v22;
      __int16 v170 = 2082;
      v171 = v23;
      __int16 v172 = 2082;
      v173 = v24;
      __int16 v174 = 1024;
      int v175 = 1494;
      __int16 v176 = 2114;
      v177 = v25;
      __int16 v178 = 1024;
      unsigned int v179 = v27;
      __int16 v180 = 2114;
      v181 = v28;
      __int16 v182 = 2114;
      id v183 = v7;
      id v29 = "%c[%{public}s %{public}s]:%i %{public}@ (%d) %{public}@, config=%{public}@";
      id v30 = v20;
      uint32_t v31 = 70;
LABEL_20:
      _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, v29, buf, v31);

      a2 = sel;
    }
  }
  else
  {
    if (Logger)
    {
      __int16 v32 = object_getClass(self);
      BOOL v33 = class_isMetaClass(v32);
      __int16 v34 = object_getClassName(self);
      uint64_t v35 = sel_getName(a2);
      __int16 v36 = [(_NFXPCSession *)self clientName];
      int v37 = [(_NFXPCSession *)self connection];
      id v38 = [v37 processIdentifier];
      int v39 = [(_NFSession *)self sessionUID];
      id v146 = v38;
      a2 = sel;
      uint64_t v40 = 43;
      if (!v33) {
        uint64_t v40 = 45;
      }
      v10(6, "%c[%{public}s %{public}s]:%i %{public}@ (%d) %{public}@", v40, v34, v35, 1497, v36, v146, v39);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v20 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      id v41 = object_getClass(self);
      if (class_isMetaClass(v41)) {
        int v42 = 43;
      }
      else {
        int v42 = 45;
      }
      id v43 = object_getClassName(self);
      __int16 v44 = sel_getName(a2);
      id v25 = [(_NFXPCSession *)self clientName];
      uint64_t v26 = [(_NFXPCSession *)self connection];
      unsigned int v45 = [v26 processIdentifier];
      id v28 = [(_NFSession *)self sessionUID];
      *(_DWORD *)id buf = 67110658;
      int v169 = v42;
      __int16 v170 = 2082;
      v171 = v43;
      __int16 v172 = 2082;
      v173 = v44;
      __int16 v174 = 1024;
      int v175 = 1497;
      __int16 v176 = 2114;
      v177 = v25;
      __int16 v178 = 1024;
      unsigned int v179 = v45;
      __int16 v180 = 2114;
      v181 = v28;
      id v29 = "%c[%{public}s %{public}s]:%i %{public}@ (%d) %{public}@";
      id v30 = v20;
      uint32_t v31 = 60;
      goto LABEL_20;
    }
  }

  if ([(NFServiceWhitelistChecker *)self->_tagWhiteList internalAccess])
  {
    uint64_t v46 = [v7 NF_numberForKey:@"tech"];
    if (v46)
    {
      uint64_t v47 = [v7 NF_numberForKey:@"pollDuration"];
      int v48 = [v7 NF_dataForKey:@"ecp"];
      BOOL v49 = v48;
      if (v48)
      {
        if ([v48 length])
        {
          self->_BOOL vasECP = 1;
          self->_isConnectionHandover = [(_NFReaderSession *)self _isPayloadConnectionHandover:v49];
        }
        else
        {
          self->_BOOL vasECP = 0;
          self->_isConnectionHandover = 0;
        }
      }
      unsigned int v66 = [v7 NF_numberForKey:@"skipMifareClassify"];
      id v62 = v66;
      if (v66) {
        self->_skipMifareClassification = [v66 BOOLValue];
      }
      int v149 = [v7 NF_numberForKey:@"lpcd"];
      uint64_t v67 = [v7 NF_numberForKey:@"fd"];
      v148 = v67;
      if (v67)
      {
        unsigned int v68 = [v67 BOOLValue];
        uint64_t v69 = 2;
        if (!v68) {
          uint64_t v69 = 0;
        }
      }
      else
      {
        uint64_t v69 = 2;
      }
      uint64_t v147 = v69;
      self->_unint64_t pollOption = 1;
      self->_unint64_t sessionConfig = 1;
      id WeakRetained = objc_loadWeakRetained((id *)&self->_powerConsumptionReporter);
      sub_1001B0E88((uint64_t)WeakRetained, self);

      unint64_t v71 = +[_NFHardwareManager sharedHardwareManager];
      [v71 notifyReaderModeActivityEnd];

      self->_pollingConfig = 0;
      if ([v46 unsignedIntValue]) {
        self->_pollingConfig |= 1u;
      }
      if (([v46 unsignedIntValue] & 2) != 0) {
        self->_pollingConfig |= 2u;
      }
      if (([v46 unsignedIntValue] & 4) != 0) {
        self->_pollingConfig |= 4u;
      }
      if (([v46 unsignedIntValue] & 0x10) != 0) {
        self->_pollingConfig |= 8u;
      }
      if (self->_vasECP) {
        self->_pollingConfig |= 0x10u;
      }
      __int16 v72 = sel;
      if ([(NFServiceWhitelistChecker *)self->_tagWhiteList pollingProfileUpdate])
      {
        switch(self->_pollingProfile)
        {
          case 0:
            goto LABEL_99;
          case 1:
            if ((self->_pollingConfig & 0x13) == 0)
            {
              dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
              uint64_t v124 = NFLogGetLogger();
              if (v124)
              {
                long long v125 = (void (*)(uint64_t, const char *, ...))v124;
                v126 = object_getClass(self);
                BOOL v127 = class_isMetaClass(v126);
                id v128 = object_getClassName(self);
                id v145 = sel_getName(sel);
                uint64_t v129 = 45;
                if (v127) {
                  uint64_t v129 = 43;
                }
                v125(3, "%c[%{public}s %{public}s]:%i Invalid technology for the specific polling profile", v129, v128, v145, 1553);
              }
              dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
              id v130 = NFSharedLogGetLogger();
              if (os_log_type_enabled(v130, OS_LOG_TYPE_ERROR))
              {
                id v131 = object_getClass(self);
                if (class_isMetaClass(v131)) {
                  int v132 = 43;
                }
                else {
                  int v132 = 45;
                }
                long long v133 = object_getClassName(self);
                NSErrorUserInfoKey v134 = sel_getName(sel);
                *(_DWORD *)id buf = 67109890;
                int v169 = v132;
                __int16 v170 = 2082;
                v171 = v133;
                __int16 v172 = 2082;
                v173 = v134;
                __int16 v174 = 1024;
                int v175 = 1553;
                _os_log_impl((void *)&_mh_execute_header, v130, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Invalid technology for the specific polling profile", buf, 0x22u);
              }

              id v135 = objc_alloc((Class)NSError);
              id v136 = +[NSString stringWithUTF8String:"nfcd"];
              NSErrorUserInfoKey v162 = NSLocalizedDescriptionKey;
              SEL v137 = +[NSString stringWithUTF8String:"Invalid Parameter"];
              __int16 v163 = v137;
              __int16 v138 = +[NSDictionary dictionaryWithObjects:&v163 forKeys:&v162 count:1];
              id v139 = [v135 initWithDomain:v136 code:10 userInfo:v138];
              v150[2](v150, v139);

              id v65 = v149;
              goto LABEL_104;
            }
            uint64_t v73 = 1;
LABEL_89:
            dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
            uint64_t v107 = NFLogGetLogger();
            if (v107)
            {
              uint64_t v108 = (void (*)(uint64_t, const char *, ...))v107;
              long long v109 = object_getClass(self);
              BOOL v110 = class_isMetaClass(v109);
              BOOL v111 = object_getClassName(self);
              NSErrorUserInfoKey v144 = sel_getName(sel);
              uint64_t v112 = 45;
              if (v110) {
                uint64_t v112 = 43;
              }
              v108(6, "%c[%{public}s %{public}s]:%i pollingProfile=%u", v112, v111, v144, 1570, v73);
            }
            dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
            uint64_t v113 = NFSharedLogGetLogger();
            if (os_log_type_enabled(v113, OS_LOG_TYPE_DEFAULT))
            {
              int v114 = object_getClass(self);
              if (class_isMetaClass(v114)) {
                int v115 = 43;
              }
              else {
                int v115 = 45;
              }
              int v116 = object_getClassName(self);
              __int16 v117 = sel_getName(sel);
              *(_DWORD *)id buf = 67110146;
              int v169 = v115;
              __int16 v170 = 2082;
              v171 = v116;
              __int16 v172 = 2082;
              v173 = v117;
              __int16 v174 = 1024;
              int v175 = 1570;
              __int16 v176 = 1024;
              LODWORD(v177) = v73;
              _os_log_impl((void *)&_mh_execute_header, v113, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i pollingProfile=%u", buf, 0x28u);
            }

            __int16 v72 = sel;
LABEL_99:
            char v118 = +[_NFHardwareManager sharedHardwareManager];
            __int16 v119 = +[NFRoutingConfig routingOffWithFD:0];
            id v120 = [v118 setRoutingConfig:v119];

            sub_1001E05E0(self->_driverWrapper);
            break;
          case 2:
            dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
            uint64_t v74 = NFLogGetLogger();
            if (v74)
            {
              int v75 = (void (*)(uint64_t, const char *, ...))v74;
              unint64_t v76 = object_getClass(self);
              BOOL v77 = class_isMetaClass(v76);
              id v78 = object_getClassName(self);
              id v141 = sel_getName(sel);
              uint64_t v79 = 45;
              if (v77) {
                uint64_t v79 = 43;
              }
              v75(6, "%c[%{public}s %{public}s]:%i Forcing TRANSAC_B", v79, v78, v141, 1559);
            }
            dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
            char v80 = NFSharedLogGetLogger();
            if (os_log_type_enabled(v80, OS_LOG_TYPE_DEFAULT))
            {
              id v81 = object_getClass(self);
              if (class_isMetaClass(v81)) {
                int v82 = 43;
              }
              else {
                int v82 = 45;
              }
              v83 = object_getClassName(self);
              uint64_t v84 = sel_getName(sel);
              *(_DWORD *)id buf = 67109890;
              int v169 = v82;
              __int16 v170 = 2082;
              v171 = v83;
              __int16 v172 = 2082;
              v173 = v84;
              __int16 v174 = 1024;
              int v175 = 1559;
              _os_log_impl((void *)&_mh_execute_header, v80, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Forcing TRANSAC_B", buf, 0x22u);
            }

            uint64_t v73 = 2;
            self->_pollingConfig = 2;
            goto LABEL_89;
          case 3:
            dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
            uint64_t v85 = NFLogGetLogger();
            if (v85)
            {
              id v86 = (void (*)(uint64_t, const char *, ...))v85;
              unint64_t v87 = object_getClass(self);
              BOOL v88 = class_isMetaClass(v87);
              NSErrorUserInfoKey v89 = object_getClassName(self);
              NSErrorUserInfoKey v142 = sel_getName(sel);
              uint64_t v90 = 45;
              if (v88) {
                uint64_t v90 = 43;
              }
              v86(6, "%c[%{public}s %{public}s]:%i Forcing TRANSAC_A", v90, v89, v142, 1563);
            }
            dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
            id v91 = NFSharedLogGetLogger();
            if (os_log_type_enabled(v91, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v92 = object_getClass(self);
              if (class_isMetaClass(v92)) {
                int v93 = 43;
              }
              else {
                int v93 = 45;
              }
              int v94 = object_getClassName(self);
              __int16 v95 = sel_getName(sel);
              *(_DWORD *)id buf = 67109890;
              int v169 = v93;
              __int16 v170 = 2082;
              v171 = v94;
              __int16 v172 = 2082;
              v173 = v95;
              __int16 v174 = 1024;
              int v175 = 1563;
              _os_log_impl((void *)&_mh_execute_header, v91, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Forcing TRANSAC_A", buf, 0x22u);
            }

            uint64_t v73 = 3;
            goto LABEL_89;
          default:
            dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
            uint64_t v96 = NFLogGetLogger();
            if (v96)
            {
              NSErrorUserInfoKey v97 = (void (*)(uint64_t, const char *, ...))v96;
              uint64_t v98 = object_getClass(self);
              BOOL v99 = class_isMetaClass(v98);
              int v100 = object_getClassName(self);
              int v143 = sel_getName(sel);
              uint64_t v101 = 45;
              if (v99) {
                uint64_t v101 = 43;
              }
              v97(6, "%c[%{public}s %{public}s]:%i Forcing No ECP", v101, v100, v143, 1566);
            }
            dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
            id v102 = NFSharedLogGetLogger();
            if (os_log_type_enabled(v102, OS_LOG_TYPE_DEFAULT))
            {
              __int16 v103 = object_getClass(self);
              if (class_isMetaClass(v103)) {
                int v104 = 43;
              }
              else {
                int v104 = 45;
              }
              __int16 v105 = object_getClassName(self);
              long long v106 = sel_getName(sel);
              *(_DWORD *)id buf = 67109890;
              int v169 = v104;
              __int16 v170 = 2082;
              v171 = v105;
              __int16 v172 = 2082;
              v173 = v106;
              __int16 v174 = 1024;
              int v175 = 1566;
              _os_log_impl((void *)&_mh_execute_header, v102, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Forcing No ECP", buf, 0x22u);
            }

            uint64_t v73 = 4;
            goto LABEL_89;
        }
      }
      v156[0] = _NSConcreteStackBlock;
      v156[1] = 3221225472;
      v156[2] = sub_1001C11C4;
      v156[3] = &unk_100306CD8;
      v156[4] = self;
      __int16 v160 = v72;
      id v65 = v149;
      id v157 = v149;
      uint64_t v161 = v147;
      id v158 = v47;
      id v159 = v49;
      __int16 v121 = objc_retainBlock(v156);
      id v122 = v121;
      if (self->_uiService)
      {
        v152[0] = _NSConcreteStackBlock;
        v152[1] = 3221225472;
        v152[2] = sub_1001C168C;
        v152[3] = &unk_1003021D8;
        v152[4] = self;
        int v155 = v72;
        id v153 = v150;
        id v154 = v122;
        [(_NFReaderSession *)self activateUIControllerWithCompletion:v152];
      }
      else
      {
        long long v123 = ((void (*)(void *))v121[2])(v121);
        v150[2](v150, v123);
      }
LABEL_104:

      int v63 = v150;
    }
    else
    {
      id v64 = objc_alloc((Class)NSError);
      uint64_t v47 = +[NSString stringWithUTF8String:"nfcd"];
      NSErrorUserInfoKey v164 = NSLocalizedDescriptionKey;
      BOOL v49 = +[NSString stringWithUTF8String:"Invalid Parameter"];
      __int16 v165 = v49;
      id v62 = +[NSDictionary dictionaryWithObjects:&v165 forKeys:&v164 count:1];
      id v65 = [v64 initWithDomain:v47 code:10 userInfo:v62];
      int v63 = v150;
      v150[2](v150, v65);
    }
  }
  else
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v50 = NFLogGetLogger();
    if (v50)
    {
      uint64_t v51 = (void (*)(uint64_t, const char *, ...))v50;
      id v52 = object_getClass(self);
      BOOL v53 = class_isMetaClass(v52);
      int v54 = object_getClassName(self);
      NSErrorUserInfoKey v140 = sel_getName(a2);
      uint64_t v55 = 45;
      if (v53) {
        uint64_t v55 = 43;
      }
      v51(6, "%c[%{public}s %{public}s]:%i Missing required entitlements", v55, v54, v140, 1501);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    BOOL v56 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v57 = object_getClass(self);
      if (class_isMetaClass(v57)) {
        int v58 = 43;
      }
      else {
        int v58 = 45;
      }
      id v59 = object_getClassName(self);
      uint64_t v60 = sel_getName(a2);
      *(_DWORD *)id buf = 67109890;
      int v169 = v58;
      __int16 v170 = 2082;
      v171 = v59;
      __int16 v172 = 2082;
      v173 = v60;
      __int16 v174 = 1024;
      int v175 = 1501;
      _os_log_impl((void *)&_mh_execute_header, v56, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Missing required entitlements", buf, 0x22u);
    }

    id v61 = objc_alloc((Class)NSError);
    uint64_t v46 = +[NSString stringWithUTF8String:"nfcd"];
    NSErrorUserInfoKey v166 = NSLocalizedDescriptionKey;
    uint64_t v47 = +[NSString stringWithUTF8String:"Not entitled"];
    __int16 v167 = v47;
    BOOL v49 = +[NSDictionary dictionaryWithObjects:&v167 forKeys:&v166 count:1];
    id v62 = [v61 initWithDomain:v46 code:32 userInfo:v49];
    int v63 = v150;
    v150[2](v150, v62);
  }
}

- (void)startPollingForNDEFMessagesWithSessionConfig:(unint64_t)a3 completion:(id)a4
{
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)_NFReaderSession;
  int v8 = [(_NFSession *)&v14 workQueue];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1001C19EC;
  v10[3] = &unk_100302648;
  v10[4] = self;
  id v11 = v7;
  SEL v12 = a2;
  unint64_t v13 = a3;
  id v9 = v7;
  dispatch_async(v8, v10);
}

- (void)_sync_startPollingForNDEFMessagesWithSessionConfig:(unint64_t)a3 completion:(id)a4
{
  id v50 = a4;
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    id v7 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    id v11 = a2;
    Name = sel_getName(a2);
    unint64_t v13 = [(_NFXPCSession *)self clientName];
    objc_super v14 = [(_NFXPCSession *)self connection];
    id v15 = [v14 processIdentifier];
    objc_super v16 = [(_NFSession *)self sessionUID];
    uint64_t v46 = Name;
    a2 = v11;
    uint64_t v17 = 43;
    if (!isMetaClass) {
      uint64_t v17 = 45;
    }
    v7(6, "%c[%{public}s %{public}s]:%i %{public}@ (%d) %{public}@", v17, ClassName, v46, 1633, v13, v15, v16);
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t v18 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v19 = object_getClass(self);
    if (class_isMetaClass(v19)) {
      int v20 = 43;
    }
    else {
      int v20 = 45;
    }
    int v48 = object_getClassName(self);
    int v21 = sel_getName(a2);
    int v22 = [(_NFXPCSession *)self clientName];
    int v23 = [(_NFXPCSession *)self connection];
    unsigned int v24 = a2;
    unsigned int v25 = [v23 processIdentifier];
    uint64_t v26 = [(_NFSession *)self sessionUID];
    *(_DWORD *)id buf = 67110658;
    int v59 = v20;
    __int16 v60 = 2082;
    id v61 = v48;
    __int16 v62 = 2082;
    int v63 = v21;
    __int16 v64 = 1024;
    int v65 = 1633;
    __int16 v66 = 2114;
    uint64_t v67 = v22;
    __int16 v68 = 1024;
    unsigned int v69 = v25;
    a2 = v24;
    __int16 v70 = 2114;
    unint64_t v71 = v26;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i %{public}@ (%d) %{public}@", buf, 0x3Cu);
  }
  if ([(NFServiceWhitelistChecker *)self->_tagWhiteList nfcNDEFReaderAccess])
  {
    v55[0] = _NSConcreteStackBlock;
    v55[1] = 3221225472;
    v55[2] = sub_1001C2270;
    v55[3] = &unk_100306D00;
    v55[4] = self;
    v55[5] = a2;
    v55[6] = a3;
    unsigned int v27 = objc_retainBlock(v55);
    if ([(_NFReaderSession *)self _isCoreNFCSession] && self->_uiService)
    {
      v51[0] = _NSConcreteStackBlock;
      v51[1] = 3221225472;
      v51[2] = sub_1001C2788;
      v51[3] = &unk_1003021D8;
      v51[4] = self;
      SEL v54 = a2;
      id v28 = v50;
      id v52 = v50;
      BOOL v53 = v27;
      [(_NFReaderSession *)self activateUIControllerWithCompletion:v51];
    }
    else
    {
      unsigned int v45 = ((void (*)(void *))v27[2])(v27);
      id v28 = v50;
      (*((void (**)(id, void *))v50 + 2))(v50, v45);
    }
  }
  else
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v29 = NFLogGetLogger();
    if (v29)
    {
      id v30 = (void (*)(uint64_t, const char *, ...))v29;
      uint32_t v31 = object_getClass(self);
      BOOL v32 = class_isMetaClass(v31);
      BOOL v33 = object_getClassName(self);
      uint64_t v47 = sel_getName(a2);
      uint64_t v34 = 45;
      if (v32) {
        uint64_t v34 = 43;
      }
      v30(6, "%c[%{public}s %{public}s]:%i Missing required entitlements", v34, v33, v47, 1637);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v35 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v36 = object_getClass(self);
      if (class_isMetaClass(v36)) {
        int v37 = 43;
      }
      else {
        int v37 = 45;
      }
      id v38 = object_getClassName(self);
      int v39 = sel_getName(a2);
      *(_DWORD *)id buf = 67109890;
      int v59 = v37;
      __int16 v60 = 2082;
      id v61 = v38;
      __int16 v62 = 2082;
      int v63 = v39;
      __int16 v64 = 1024;
      int v65 = 1637;
      _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Missing required entitlements", buf, 0x22u);
    }

    id v40 = objc_alloc((Class)NSError);
    id v41 = +[NSString stringWithUTF8String:"nfcd"];
    NSErrorUserInfoKey v56 = NSLocalizedDescriptionKey;
    int v42 = +[NSString stringWithUTF8String:"Not entitled"];
    unsigned int v57 = v42;
    id v43 = +[NSDictionary dictionaryWithObjects:&v57 forKeys:&v56 count:1];
    id v44 = [v40 initWithDomain:v41 code:32 userInfo:v43];
    id v28 = v50;
    (*((void (**)(id, id))v50 + 2))(v50, v44);
  }
}

- (void)stopPollingWithCompletion:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_NFReaderSession;
  unsigned int v6 = [(_NFSession *)&v11 workQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001C2ADC;
  block[3] = &unk_100301D38;
  id v9 = v5;
  SEL v10 = a2;
  block[4] = self;
  id v7 = v5;
  dispatch_async(v6, block);
}

- (void)_sync_stopPolling:(id)a3
{
  uint64_t v51 = (void (**)(id, id))a3;
  id v5 = sub_10023D968();
  sub_10023E798((uint64_t)v5);

  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    id v7 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    [(_NFXPCSession *)self clientName];
    SEL v12 = v50 = a2;
    unint64_t v13 = [(_NFXPCSession *)self connection];
    id v14 = [v13 processIdentifier];
    id v15 = [(_NFSession *)self sessionUID];
    uint64_t v16 = 43;
    if (!isMetaClass) {
      uint64_t v16 = 45;
    }
    v7(6, "%c[%{public}s %{public}s]:%i %{public}@ (%d) %{public}@", v16, ClassName, Name, 1709, v12, v14, v15);

    a2 = v50;
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t v17 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v18 = object_getClass(self);
    if (class_isMetaClass(v18)) {
      int v19 = 43;
    }
    else {
      int v19 = 45;
    }
    int v20 = object_getClassName(self);
    int v21 = sel_getName(a2);
    int v22 = [(_NFXPCSession *)self clientName];
    int v23 = [(_NFXPCSession *)self connection];
    unsigned int v24 = [v23 processIdentifier];
    unsigned int v25 = [(_NFSession *)self sessionUID];
    *(_DWORD *)id buf = 67110658;
    int v55 = v19;
    __int16 v56 = 2082;
    unsigned int v57 = v20;
    __int16 v58 = 2082;
    int v59 = v21;
    __int16 v60 = 1024;
    int v61 = 1709;
    __int16 v62 = 2114;
    int v63 = v22;
    __int16 v64 = 1024;
    unsigned int v65 = v24;
    __int16 v66 = 2114;
    uint64_t v67 = v25;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i %{public}@ (%d) %{public}@", buf, 0x3Cu);
  }
  currentTag = self->_currentTag;
  self->_currentTag = 0;

  [(NSMutableArray *)self->_nonstandard7816TagsFound removeAllObjects];
  unsigned int v27 = +[_NFHardwareManager sharedHardwareManager];
  id v28 = +[NFRoutingConfig routingOff];
  uint64_t v29 = [v27 setRoutingConfig:v28];

  if (v29)
  {
    id v30 = objc_alloc((Class)NSError);
    uint32_t v31 = +[NSString stringWithUTF8String:"nfcd"];
    NSErrorUserInfoKey v52 = NSLocalizedDescriptionKey;
    BOOL v32 = +[NSString stringWithUTF8String:"Stack Error"];
    BOOL v53 = v32;
    BOOL v33 = +[NSDictionary dictionaryWithObjects:&v53 forKeys:&v52 count:1];
    id v34 = [v30 initWithDomain:v31 code:15 userInfo:v33];
    v51[2](v51, v34);
  }
  else
  {
    v51[2](v51, 0);
    uint64_t v35 = NFLogGetLogger();
    if (v35)
    {
      __int16 v36 = (void (*)(uint64_t, const char *, ...))v35;
      int v37 = object_getClass(self);
      BOOL v38 = class_isMetaClass(v37);
      int v39 = object_getClassName(self);
      id v40 = sel_getName(a2);
      id v41 = [(_NFXPCSession *)self clientName];
      uint64_t v42 = 45;
      if (v38) {
        uint64_t v42 = 43;
      }
      v36(6, "%c[%{public}s %{public}s]:%i NFC Reader mode terminated: %@", v42, v39, v40, 1715, v41);
    }
    id v43 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
    {
      id v44 = object_getClass(self);
      if (class_isMetaClass(v44)) {
        int v45 = 43;
      }
      else {
        int v45 = 45;
      }
      uint64_t v46 = object_getClassName(self);
      uint64_t v47 = sel_getName(a2);
      int v48 = [(_NFXPCSession *)self clientName];
      *(_DWORD *)id buf = 67110146;
      int v55 = v45;
      __int16 v56 = 2082;
      unsigned int v57 = v46;
      __int16 v58 = 2082;
      int v59 = v47;
      __int16 v60 = 1024;
      int v61 = 1715;
      __int16 v62 = 2112;
      int v63 = v48;
      _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i NFC Reader mode terminated: %@", buf, 0x2Cu);
    }
    uint32_t v31 = NFSharedSignpostLog();
    if (os_signpost_enabled(v31))
    {
      *(_WORD *)id buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v31, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "Polling", (const char *)&unk_100286819, buf, 2u);
    }
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_powerConsumptionReporter);
  sub_1001B03F0((uint64_t)WeakRetained, self);
}

- (void)restartPollingWithCompletion:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_NFReaderSession;
  unsigned int v6 = [(_NFSession *)&v11 workQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001C3404;
  block[3] = &unk_100301D38;
  id v9 = v5;
  SEL v10 = a2;
  block[4] = self;
  id v7 = v5;
  dispatch_async(v6, block);
}

- (void)_sync_restartPolling:(id)a3
{
  id v5 = (void (**)(id, id))a3;
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    id v7 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    objc_super v11 = [(_NFXPCSession *)self clientName];
    SEL v12 = [(_NFXPCSession *)self connection];
    unint64_t v13 = v5;
    id v14 = [v12 processIdentifier];
    id v15 = [(_NFSession *)self sessionUID];
    id v36 = v14;
    id v5 = v13;
    uint64_t v16 = 43;
    if (!isMetaClass) {
      uint64_t v16 = 45;
    }
    v7(6, "%c[%{public}s %{public}s]:%i %{public}@ (%d) %{public}@", v16, ClassName, Name, 1735, v11, v36, v15);
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t v17 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v18 = object_getClass(self);
    if (class_isMetaClass(v18)) {
      int v19 = 43;
    }
    else {
      int v19 = 45;
    }
    int v20 = object_getClassName(self);
    int v21 = sel_getName(a2);
    int v22 = [(_NFXPCSession *)self clientName];
    int v23 = [(_NFXPCSession *)self connection];
    unsigned int v24 = [v23 processIdentifier];
    unsigned int v25 = [(_NFSession *)self sessionUID];
    *(_DWORD *)id buf = 67110658;
    int v41 = v19;
    __int16 v42 = 2082;
    id v43 = v20;
    __int16 v44 = 2082;
    int v45 = v21;
    __int16 v46 = 1024;
    int v47 = 1735;
    __int16 v48 = 2114;
    BOOL v49 = v22;
    __int16 v50 = 1024;
    unsigned int v51 = v24;
    __int16 v52 = 2114;
    BOOL v53 = v25;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i %{public}@ (%d) %{public}@", buf, 0x3Cu);
  }
  if ([(_NFReaderSession *)self _isCoreNFCSession])
  {
    currentTag = self->_currentTag;
    self->_currentTag = 0;

    [(NSMutableArray *)self->_nonstandard7816TagsFound removeAllObjects];
    unsigned int v27 = +[_NFHardwareManager sharedHardwareManager];
    id v28 = +[NFRoutingConfig routingOff];
    id v29 = [v27 setRoutingConfig:v28];

    if (!v29)
    {
      if ((self->_sessionConfig & 0x100) != 0)
      {
        int pollingConfig = self->_pollingConfig;
        if ((pollingConfig & 0x1000) != 0)
        {
          self->_int pollingConfig = pollingConfig & 0xFFFFEFFF;
          driverWrapper = self->_driverWrapper;
          [(_NFReaderSession *)self _getTagNotificationConfig];
          sub_1001E0544(driverWrapper);
        }
      }
      BOOL v32 = +[NFRoutingConfig readerModeWithFD:2];
      BOOL v33 = +[_NFHardwareManager sharedHardwareManager];
      id v29 = [v33 setRoutingConfig:v32];
      goto LABEL_19;
    }
  }
  else
  {
    if ((sub_1002128B4(self->_driverWrapper) & 1) == 0)
    {
      id v34 = objc_alloc((Class)NSError);
      BOOL v32 = +[NSString stringWithUTF8String:"nfcd"];
      NSErrorUserInfoKey v38 = NSLocalizedDescriptionKey;
      BOOL v33 = +[NSString stringWithUTF8String:"Stack Error"];
      int v39 = v33;
      uint64_t v35 = +[NSDictionary dictionaryWithObjects:&v39 forKeys:&v38 count:1];
      id v29 = [v34 initWithDomain:v32 code:15 userInfo:v35];

LABEL_19:
      goto LABEL_20;
    }
    id v29 = 0;
  }
LABEL_20:
  v5[2](v5, v29);
}

- (void)execRemoteAdminScript:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)_NFReaderSession;
  id v9 = [(_NFSession *)&v16 workQueue];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1001C3C1C;
  v12[3] = &unk_100302278;
  id v14 = v8;
  SEL v15 = a2;
  v12[4] = self;
  id v13 = v7;
  id v10 = v7;
  id v11 = v8;
  dispatch_async(v9, v12);
}

- (void)_sync_execRemoteAdminScript:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v244 = a4;
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    id v8 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    id v13 = [(_NFXPCSession *)self clientName];
    id v14 = [(_NFXPCSession *)self connection];
    id v15 = [v14 processIdentifier];
    objc_super v16 = [(_NFSession *)self sessionUID];
    uint64_t v17 = 43;
    if (!isMetaClass) {
      uint64_t v17 = 45;
    }
    v8(6, "%c[%{public}s %{public}s]:%i %{public}@ (%d) %{public}@", v17, ClassName, Name, 1781, v13, v15, v16);
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t v18 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    int v19 = object_getClass(self);
    id v20 = v6;
    if (class_isMetaClass(v19)) {
      int v21 = 43;
    }
    else {
      int v21 = 45;
    }
    int v22 = object_getClassName(self);
    int v23 = sel_getName(a2);
    unsigned int v24 = [(_NFXPCSession *)self clientName];
    unsigned int v25 = [(_NFXPCSession *)self connection];
    unsigned int v26 = [v25 processIdentifier];
    unsigned int v27 = [(_NFSession *)self sessionUID];
    *(_DWORD *)id buf = 67110658;
    int v275 = v21;
    id v6 = v20;
    __int16 v276 = 2082;
    v277 = v22;
    __int16 v278 = 2082;
    v279 = v23;
    __int16 v280 = 1024;
    int v281 = 1781;
    __int16 v282 = 2114;
    v283 = v24;
    __int16 v284 = 1024;
    *(_DWORD *)v285 = v26;
    *(_WORD *)&v285[4] = 2114;
    *(void *)&v285[6] = v27;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i %{public}@ (%d) %{public}@", buf, 0x3Cu);
  }
  id v28 = NFSharedSignpostLog();
  if (os_signpost_enabled(v28))
  {
    *(_WORD *)id buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v28, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "execRemoteAdminScript", (const char *)&unk_100286819, buf, 2u);
  }

  id v29 = [v6 objectForKey:@"kBatchId"];
  id v30 = [v6 objectForKey:@"kCommands"];
  uint32_t v31 = &AMFDRSealingMapCopyLocalData_ptr;
  if (!v29 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v105 = NFLogGetLogger();
    if (v105)
    {
      long long v106 = (void (*)(uint64_t, const char *, ...))v105;
      uint64_t v107 = object_getClass(self);
      BOOL v108 = class_isMetaClass(v107);
      long long v109 = object_getClassName(self);
      v223 = sel_getName(a2);
      uint64_t v110 = 45;
      if (v108) {
        uint64_t v110 = 43;
      }
      v106(3, "%c[%{public}s %{public}s]:%i Missing batch ID", v110, v109, v223, 1789);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    BOOL v111 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v111, OS_LOG_TYPE_ERROR))
    {
      uint64_t v112 = object_getClass(self);
      if (class_isMetaClass(v112)) {
        int v113 = 43;
      }
      else {
        int v113 = 45;
      }
      int v114 = object_getClassName(self);
      int v115 = sel_getName(a2);
      *(_DWORD *)id buf = 67109890;
      int v275 = v113;
      __int16 v276 = 2082;
      v277 = v114;
      __int16 v278 = 2082;
      v279 = v115;
      __int16 v280 = 1024;
      int v281 = 1789;
      _os_log_impl((void *)&_mh_execute_header, v111, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Missing batch ID", buf, 0x22u);
    }

    int v116 = NFSharedSignpostLog();
    if (os_signpost_enabled(v116))
    {
      *(_WORD *)id buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v116, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "execRemoteAdminScript", (const char *)&unk_100286819, buf, 2u);
    }

    id v117 = objc_alloc((Class)NSError);
    char v118 = +[NSString stringWithUTF8String:"nfcd"];
    NSErrorUserInfoKey v272 = NSLocalizedDescriptionKey;
    __int16 v119 = +[NSString stringWithUTF8String:"Missing Parameter"];
    v273 = v119;
    id v120 = &v273;
    __int16 v121 = &v272;
    goto LABEL_120;
  }
  if (!v30 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v122 = NFLogGetLogger();
    if (v122)
    {
      long long v123 = (void (*)(uint64_t, const char *, ...))v122;
      uint64_t v124 = object_getClass(self);
      BOOL v125 = class_isMetaClass(v124);
      v126 = object_getClassName(self);
      v224 = sel_getName(a2);
      uint64_t v127 = 45;
      if (v125) {
        uint64_t v127 = 43;
      }
      v123(3, "%c[%{public}s %{public}s]:%i Missing commands", v127, v126, v224, 1797);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    id v128 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v128, OS_LOG_TYPE_ERROR))
    {
      uint64_t v129 = object_getClass(self);
      if (class_isMetaClass(v129)) {
        int v130 = 43;
      }
      else {
        int v130 = 45;
      }
      id v131 = object_getClassName(self);
      int v132 = sel_getName(a2);
      *(_DWORD *)id buf = 67109890;
      int v275 = v130;
      __int16 v276 = 2082;
      v277 = v131;
      __int16 v278 = 2082;
      v279 = v132;
      __int16 v280 = 1024;
      int v281 = 1797;
      _os_log_impl((void *)&_mh_execute_header, v128, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Missing commands", buf, 0x22u);
    }

    long long v133 = NFSharedSignpostLog();
    if (os_signpost_enabled(v133))
    {
      *(_WORD *)id buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v133, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "execRemoteAdminScript", (const char *)&unk_100286819, buf, 2u);
    }

    id v117 = objc_alloc((Class)NSError);
    char v118 = +[NSString stringWithUTF8String:"nfcd"];
    NSErrorUserInfoKey v270 = NSLocalizedDescriptionKey;
    __int16 v119 = +[NSString stringWithUTF8String:"Missing Parameter"];
    v271 = v119;
    id v120 = &v271;
    __int16 v121 = &v270;
LABEL_120:
    NSErrorUserInfoKey v134 = +[NSDictionary dictionaryWithObjects:v120 forKeys:v121 count:1];
    id v135 = [v117 initWithDomain:v118 code:9 userInfo:v134];
    id v136 = (void (**)(void, void, void, void, double))v244;
    (*((void (**)(id, void, void, id, double))v244 + 2))(v244, 0, 0, v135, 0.0);
    BOOL v33 = 0;
    goto LABEL_121;
  }
  uint64_t v32 = [v6 objectForKey:@"kTaskId"];
  objc_opt_class();
  v235 = (void *)v32;
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v137 = NFLogGetLogger();
    if (v137)
    {
      __int16 v138 = (void (*)(uint64_t, const char *, ...))v137;
      id v139 = object_getClass(self);
      BOOL v140 = class_isMetaClass(v139);
      id v141 = object_getClassName(self);
      v225 = sel_getName(a2);
      uint64_t v142 = 45;
      if (v140) {
        uint64_t v142 = 43;
      }
      v138(3, "%c[%{public}s %{public}s]:%i Invalide parameter type : Task ID", v142, v141, v225, 1806);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    int v143 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v143, OS_LOG_TYPE_ERROR))
    {
      NSErrorUserInfoKey v144 = object_getClass(self);
      if (class_isMetaClass(v144)) {
        int v145 = 43;
      }
      else {
        int v145 = 45;
      }
      id v146 = object_getClassName(self);
      uint64_t v147 = sel_getName(a2);
      *(_DWORD *)id buf = 67109890;
      int v275 = v145;
      __int16 v276 = 2082;
      v277 = v146;
      __int16 v278 = 2082;
      v279 = v147;
      __int16 v280 = 1024;
      int v281 = 1806;
      _os_log_impl((void *)&_mh_execute_header, v143, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Invalide parameter type : Task ID", buf, 0x22u);
    }

    v148 = NFSharedSignpostLog();
    if (os_signpost_enabled(v148))
    {
      *(_WORD *)id buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v148, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "execRemoteAdminScript", (const char *)&unk_100286819, buf, 2u);
    }

    id v149 = objc_alloc((Class)NSError);
    __int16 v119 = +[NSString stringWithUTF8String:"nfcd"];
    NSErrorUserInfoKey v268 = NSLocalizedDescriptionKey;
    NSErrorUserInfoKey v134 = +[NSString stringWithUTF8String:"Invalid Parameter"];
    v269 = v134;
    id v135 = +[NSDictionary dictionaryWithObjects:&v269 forKeys:&v268 count:1];
    id v150 = [v149 initWithDomain:v119 code:10 userInfo:v135];
    id v136 = (void (**)(void, void, void, void, double))v244;
    (*((void (**)(id, void, void, id, double))v244 + 2))(v244, 0, 0, v150, 0.0);

    BOOL v33 = 0;
    char v118 = v235;
    goto LABEL_121;
  }
  v233 = v6;
  v231 = objc_opt_new();
  long long v247 = 0u;
  long long v248 = 0u;
  long long v249 = 0u;
  long long v250 = 0u;
  id obj = v30;
  v232 = v29;
  v230 = v30;
  id v236 = [obj countByEnumeratingWithState:&v247 objects:v267 count:16];
  BOOL v33 = 0;
  unint64_t v34 = 0;
  if (!v236) {
    goto LABEL_177;
  }
  uint64_t v237 = *(void *)v248;
  while (2)
  {
    uint64_t v35 = 0;
    do
    {
      if (*(void *)v248 != v237) {
        objc_enumerationMutation(obj);
      }
      id v36 = *(void **)(*((void *)&v247 + 1) + 8 * v35);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        uint64_t v151 = NFLogGetLogger();
        if (v151)
        {
          __int16 v152 = (void (*)(uint64_t, const char *, ...))v151;
          id v153 = object_getClass(self);
          BOOL v154 = class_isMetaClass(v153);
          int v155 = object_getClassName(self);
          v226 = sel_getName(a2);
          uint64_t v156 = 45;
          if (v154) {
            uint64_t v156 = 43;
          }
          v152(5, "%c[%{public}s %{public}s]:%i Invalid parameter - expecting dictionary", v156, v155, v226, 1818);
        }
        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        id v157 = NFSharedLogGetLogger();
        if (os_log_type_enabled(v157, OS_LOG_TYPE_DEFAULT))
        {
          id v158 = object_getClass(self);
          if (class_isMetaClass(v158)) {
            int v159 = 43;
          }
          else {
            int v159 = 45;
          }
          __int16 v160 = object_getClassName(self);
          uint64_t v161 = sel_getName(a2);
          *(_DWORD *)id buf = 67109890;
          int v275 = v159;
          __int16 v276 = 2082;
          v277 = v160;
          __int16 v278 = 2082;
          v279 = v161;
          __int16 v280 = 1024;
          int v281 = 1818;
          _os_log_impl((void *)&_mh_execute_header, v157, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Invalid parameter - expecting dictionary", buf, 0x22u);
        }

        id v162 = objc_alloc((Class)NSError);
        __int16 v163 = [v31[466] stringWithUTF8String:"nfcd"];
        NSErrorUserInfoKey v265 = NSLocalizedDescriptionKey;
        NSErrorUserInfoKey v164 = [v31[466] stringWithUTF8String:"Invalid Parameter"];
        v266 = v164;
        __int16 v165 = +[NSDictionary dictionaryWithObjects:&v266 forKeys:&v265 count:1];
        NSErrorUserInfoKey v166 = v162;
        __int16 v167 = v163;
        uint64_t v168 = 10;
        goto LABEL_155;
      }
      if ([(_NFSession *)self didEnd])
      {
        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        uint64_t v169 = NFLogGetLogger();
        if (v169)
        {
          __int16 v170 = (void (*)(uint64_t, const char *, ...))v169;
          v171 = object_getClass(self);
          BOOL v172 = class_isMetaClass(v171);
          v173 = object_getClassName(self);
          v227 = sel_getName(a2);
          uint64_t v174 = 45;
          if (v172) {
            uint64_t v174 = 43;
          }
          v170(5, "%c[%{public}s %{public}s]:%i Aborted", v174, v173, v227, 1825);
        }
        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        int v175 = NFSharedLogGetLogger();
        if (os_log_type_enabled(v175, OS_LOG_TYPE_DEFAULT))
        {
          __int16 v176 = object_getClass(self);
          if (class_isMetaClass(v176)) {
            int v177 = 43;
          }
          else {
            int v177 = 45;
          }
          __int16 v178 = object_getClassName(self);
          unsigned int v179 = sel_getName(a2);
          *(_DWORD *)id buf = 67109890;
          int v275 = v177;
          __int16 v276 = 2082;
          v277 = v178;
          __int16 v278 = 2082;
          v279 = v179;
          __int16 v280 = 1024;
          int v281 = 1825;
          _os_log_impl((void *)&_mh_execute_header, v175, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Aborted", buf, 0x22u);
        }

        id v180 = objc_alloc((Class)NSError);
        __int16 v163 = [v31[466] stringWithUTF8String:"nfcd"];
        NSErrorUserInfoKey v263 = NSLocalizedDescriptionKey;
        NSErrorUserInfoKey v164 = [v31[466] stringWithUTF8String:"Aborted"];
        v264 = v164;
        __int16 v165 = +[NSDictionary dictionaryWithObjects:&v264 forKeys:&v263 count:1];
        NSErrorUserInfoKey v166 = v180;
        __int16 v167 = v163;
        uint64_t v168 = 3;
        goto LABEL_155;
      }
      if (!self->_currentTag)
      {
        id v181 = objc_alloc((Class)NSError);
        __int16 v163 = [v31[466] stringWithUTF8String:"nfcd"];
        NSErrorUserInfoKey v261 = NSLocalizedDescriptionKey;
        NSErrorUserInfoKey v164 = [v31[466] stringWithUTF8String:"Tag Not Found"];
        v262 = v164;
        __int16 v165 = +[NSDictionary dictionaryWithObjects:&v262 forKeys:&v261 count:1];
        NSErrorUserInfoKey v166 = v181;
        __int16 v167 = v163;
        uint64_t v168 = 28;
LABEL_155:
        id v182 = [v166 initWithDomain:v167 code:v168 userInfo:v165];
LABEL_176:

        BOOL v33 = v182;
        goto LABEL_177;
      }
      uint64_t v37 = [v36 objectForKey:@"kMessageName"];
      objc_opt_class();
      v242 = (void *)v37;
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        uint64_t v183 = NFLogGetLogger();
        if (v183)
        {
          v184 = (void (*)(uint64_t, const char *, ...))v183;
          v185 = object_getClass(self);
          BOOL v186 = class_isMetaClass(v185);
          v187 = object_getClassName(self);
          v228 = sel_getName(a2);
          uint64_t v188 = 45;
          if (v186) {
            uint64_t v188 = 43;
          }
          v184(5, "%c[%{public}s %{public}s]:%i Invalid parameter - expecting String name", v188, v187, v228, 1838);
        }
        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v189 = NFSharedLogGetLogger();
        if (os_log_type_enabled(v189, OS_LOG_TYPE_DEFAULT))
        {
          v190 = object_getClass(self);
          if (class_isMetaClass(v190)) {
            int v191 = 43;
          }
          else {
            int v191 = 45;
          }
          v192 = object_getClassName(self);
          v193 = sel_getName(a2);
          *(_DWORD *)id buf = 67109890;
          int v275 = v191;
          __int16 v276 = 2082;
          v277 = v192;
          __int16 v278 = 2082;
          v279 = v193;
          __int16 v280 = 1024;
          int v281 = 1838;
          _os_log_impl((void *)&_mh_execute_header, v189, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Invalid parameter - expecting String name", buf, 0x22u);
        }

        id v194 = objc_alloc((Class)NSError);
        NSErrorUserInfoKey v164 = [v31[466] stringWithUTF8String:"nfcd"];
        NSErrorUserInfoKey v259 = NSLocalizedDescriptionKey;
        __int16 v165 = [v31[466] stringWithUTF8String:"Invalid Parameter"];
        v260 = v165;
        uint64_t v195 = +[NSDictionary dictionaryWithObjects:&v260 forKeys:&v259 count:1];
        id v182 = [v194 initWithDomain:v164 code:10 userInfo:v195];

        BOOL v33 = (void *)v195;
        __int16 v163 = v242;
        goto LABEL_176;
      }
      NSErrorUserInfoKey v38 = [v36 objectForKey:@"kData"];
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        uint64_t v196 = NFLogGetLogger();
        if (v196)
        {
          v197 = (void (*)(uint64_t, const char *, ...))v196;
          v198 = object_getClass(self);
          BOOL v199 = class_isMetaClass(v198);
          v200 = object_getClassName(self);
          v229 = sel_getName(a2);
          uint64_t v201 = 45;
          if (v199) {
            uint64_t v201 = 43;
          }
          v197(5, "%c[%{public}s %{public}s]:%i Invalid parameter - expecting String capdu", v201, v200, v229, 1847);
        }
        v202 = v38;
        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v203 = NFSharedLogGetLogger();
        if (os_log_type_enabled(v203, OS_LOG_TYPE_DEFAULT))
        {
          v204 = object_getClass(self);
          if (class_isMetaClass(v204)) {
            int v205 = 43;
          }
          else {
            int v205 = 45;
          }
          v206 = object_getClassName(self);
          v207 = sel_getName(a2);
          *(_DWORD *)id buf = 67109890;
          int v275 = v205;
          __int16 v276 = 2082;
          v277 = v206;
          __int16 v278 = 2082;
          v279 = v207;
          __int16 v280 = 1024;
          int v281 = 1847;
          _os_log_impl((void *)&_mh_execute_header, v203, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Invalid parameter - expecting String capdu", buf, 0x22u);
        }

        id v208 = objc_alloc((Class)NSError);
        __int16 v165 = [v31[466] stringWithUTF8String:"nfcd"];
        NSErrorUserInfoKey v257 = NSLocalizedDescriptionKey;
        uint64_t v209 = [v31[466] stringWithUTF8String:"Invalid Parameter"];
        uint64_t v258 = v209;
        v210 = +[NSDictionary dictionaryWithObjects:&v258 forKeys:&v257 count:1];
        id v182 = [v208 initWithDomain:v165 code:10 userInfo:v210];

        BOOL v33 = (void *)v209;
        __int16 v163 = v242;
        NSErrorUserInfoKey v164 = v202;
        goto LABEL_176;
      }
      uint64_t v239 = v35;
      if (([(NFTag *)self->_currentTag technology] & 4) != 0)
      {
        id v39 = [objc_alloc((Class)v31[466]) initWithFormat:@"%02X%@", ((unint64_t)objc_msgSend(v38, "lengthOfBytesUsingEncoding:", 4) >> 1) + 1, v38];

        NSErrorUserInfoKey v38 = v39;
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      uint64_t v40 = NFLogGetLogger();
      if (v40)
      {
        int v41 = (void (*)(uint64_t, const char *, ...))v40;
        __int16 v42 = object_getClass(self);
        BOOL v43 = class_isMetaClass(v42);
        v217 = object_getClassName(self);
        v220 = sel_getName(a2);
        uint64_t v44 = 45;
        if (v43) {
          uint64_t v44 = 43;
        }
        v41(6, "%c[%{public}s %{public}s]:%i C-APDU > %{public}@", v44, v217, v220, 1859, v38);
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      int v45 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v46 = object_getClass(self);
        if (class_isMetaClass(v46)) {
          int v47 = 43;
        }
        else {
          int v47 = 45;
        }
        __int16 v48 = object_getClassName(self);
        BOOL v49 = sel_getName(a2);
        *(_DWORD *)id buf = 67110146;
        int v275 = v47;
        __int16 v276 = 2082;
        v277 = v48;
        __int16 v278 = 2082;
        v279 = v49;
        __int16 v280 = 1024;
        int v281 = 1859;
        __int16 v282 = 2114;
        v283 = v38;
        _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i C-APDU > %{public}@", buf, 0x2Cu);
      }

      v243 = +[NSData NF_dataWithHexString:v38];
      v240 = v38;
      if (v243)
      {
        v234 = v36;
        __int16 v50 = 0;
        int v51 = -4;
        while (!__CFADD__(v51++, 1))
        {
          mach_continuous_time();
          driverWrapper = self->_driverWrapper;
          currentTag = self->_currentTag;
          [(NFServiceWhitelistChecker *)self->_tagWhiteList sessionTimeLimit];
          id v246 = v33;
          int v55 = sub_100195A20(driverWrapper, v243, currentTag, &v246);
          id v56 = v246;

          mach_continuous_time();
          v34 += GetElapsedTimeInMillisecondsFromMachTime();
          if (!v56) {
            goto LABEL_77;
          }
          BOOL v33 = v56;
          dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          uint64_t v57 = NFLogGetLogger();
          if (v57)
          {
            __int16 v58 = (void (*)(uint64_t, const char *, ...))v57;
            int v59 = object_getClass(self);
            if (class_isMetaClass(v59)) {
              uint64_t v60 = 43;
            }
            else {
              uint64_t v60 = 45;
            }
            int v61 = object_getClassName(self);
            __int16 v62 = sel_getName(a2);
            int v63 = v62;
            if (v242)
            {
              v58(3, "%c[%{public}s %{public}s]:%i Failed to execute C-APDU %{public}@, error %{public}@", v60, v61, v62, 1882, v242, v33);
            }
            else
            {
              __int16 v64 = [v243 description];
              v58(3, "%c[%{public}s %{public}s]:%i Failed to execute C-APDU %{public}@, error %{public}@", v60, v61, v63, 1882, v64, v33);
            }
          }
          dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          unsigned int v65 = NFSharedLogGetLogger();
          if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
          {
            __int16 v66 = object_getClass(self);
            if (class_isMetaClass(v66)) {
              int v67 = 43;
            }
            else {
              int v67 = 45;
            }
            __int16 v68 = object_getClassName(self);
            unsigned int v69 = sel_getName(a2);
            __int16 v70 = v242;
            if (!v242)
            {
              v241 = [v243 description];
              __int16 v70 = v241;
            }
            *(_DWORD *)id buf = 67110402;
            int v275 = v67;
            __int16 v276 = 2082;
            v277 = v68;
            __int16 v278 = 2082;
            v279 = v69;
            __int16 v280 = 1024;
            int v281 = 1882;
            __int16 v282 = 2114;
            v283 = v70;
            __int16 v284 = 2114;
            *(void *)v285 = v33;
            _os_log_impl((void *)&_mh_execute_header, v65, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to execute C-APDU %{public}@, error %{public}@", buf, 0x36u);
            if (!v242) {
          }
            }
          unint64_t v71 = [v33 userInfo];
          __int16 v72 = [v71 objectForKeyedSubscript:NSUnderlyingErrorKey];

          id v73 = [v33 code];
          BOOL v74 = 0;
          if ([v33 code] == (id)29 && v72) {
            BOOL v74 = [v72 code] == (id)20;
          }

          __int16 v50 = v55;
          if (v73 != (id)28)
          {
            __int16 v50 = v55;
            if (!v74)
            {
              int v75 = 2;
LABEL_75:
              uint32_t v31 = &AMFDRSealingMapCopyLocalData_ptr;
              goto LABEL_92;
            }
          }
        }
        if (v33)
        {
          int v75 = 2;
          int v55 = v50;
          goto LABEL_75;
        }
        int v55 = v50;
LABEL_77:
        uint64_t v90 = v234;
        unint64_t v87 = [v55 NF_asHexString];
        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        uint64_t v91 = NFLogGetLogger();
        if (v91)
        {
          uint64_t v92 = (void (*)(uint64_t, const char *, ...))v91;
          int v93 = object_getClass(self);
          BOOL v94 = class_isMetaClass(v93);
          v219 = object_getClassName(self);
          v222 = sel_getName(a2);
          uint64_t v95 = 45;
          if (v94) {
            uint64_t v95 = 43;
          }
          uint64_t v90 = v234;
          v92(6, "%c[%{public}s %{public}s]:%i R-APDU < %{public}@", v95, v219, v222, 1899, v87);
        }
        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        uint64_t v96 = NFSharedLogGetLogger();
        if (os_log_type_enabled(v96, OS_LOG_TYPE_DEFAULT))
        {
          NSErrorUserInfoKey v97 = object_getClass(self);
          if (class_isMetaClass(v97)) {
            int v98 = 43;
          }
          else {
            int v98 = 45;
          }
          BOOL v99 = object_getClassName(self);
          int v100 = sel_getName(a2);
          *(_DWORD *)id buf = 67110146;
          int v275 = v98;
          __int16 v276 = 2082;
          v277 = v99;
          __int16 v278 = 2082;
          v279 = v100;
          __int16 v280 = 1024;
          int v281 = 1899;
          __int16 v282 = 2114;
          v283 = v87;
          _os_log_impl((void *)&_mh_execute_header, v96, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i R-APDU < %{public}@", buf, 0x2Cu);
        }

        if (([(NFTag *)self->_currentTag technology] & 4) != 0)
        {
          uint64_t v101 = [v87 substringFromIndex:2];

          unint64_t v87 = (void *)v101;
        }
        v253[0] = @"kData";
        v253[1] = @"kMessageId";
        v254[0] = v87;
        id v102 = [v90 objectForKeyedSubscript:];
        v254[1] = v102;
        __int16 v103 = +[NSDictionary dictionaryWithObjects:v254 forKeys:v253 count:2];
        BOOL v88 = +[NSMutableDictionary dictionaryWithDictionary:v103];

        if (v242)
        {
          int v104 = [v242 stringByAppendingString:@"_RESP"];
          [v88 setObject:v104 forKeyedSubscript:@"kMessageName"];
        }
        [v231 addObject:v88];
        int v75 = 0;
        id v89 = 0;
        uint32_t v31 = &AMFDRSealingMapCopyLocalData_ptr;
      }
      else
      {
        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        uint64_t v76 = NFLogGetLogger();
        if (v76)
        {
          BOOL v77 = (void (*)(uint64_t, const char *, ...))v76;
          id v78 = object_getClass(self);
          BOOL v79 = class_isMetaClass(v78);
          v218 = object_getClassName(self);
          v221 = sel_getName(a2);
          uint64_t v80 = 45;
          if (v79) {
            uint64_t v80 = 43;
          }
          v77(3, "%c[%{public}s %{public}s]:%i Invalid C-APDU %{public}@", v80, v218, v221, 1862, v242);
        }
        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        id v81 = NFSharedLogGetLogger();
        if (os_log_type_enabled(v81, OS_LOG_TYPE_ERROR))
        {
          int v82 = object_getClass(self);
          if (class_isMetaClass(v82)) {
            int v83 = 43;
          }
          else {
            int v83 = 45;
          }
          uint64_t v84 = object_getClassName(self);
          uint64_t v85 = sel_getName(a2);
          *(_DWORD *)id buf = 67110146;
          int v275 = v83;
          __int16 v276 = 2082;
          v277 = v84;
          __int16 v278 = 2082;
          v279 = v85;
          __int16 v280 = 1024;
          int v281 = 1862;
          __int16 v282 = 2114;
          v283 = v242;
          _os_log_impl((void *)&_mh_execute_header, v81, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Invalid C-APDU %{public}@", buf, 0x2Cu);
        }

        id v86 = objc_alloc((Class)NSError);
        int v55 = [v31[466] stringWithUTF8String:"nfcd"];
        NSErrorUserInfoKey v255 = NSLocalizedDescriptionKey;
        unint64_t v87 = [v31[466] stringWithUTF8String:"Decoding Error"];
        v256 = v87;
        BOOL v88 = +[NSDictionary dictionaryWithObjects:&v256 forKeys:&v255 count:1];
        id v89 = [v86 initWithDomain:v55 code:23 userInfo:v88];

        int v75 = 2;
      }

      BOOL v33 = v89;
LABEL_92:

      if (v75) {
        goto LABEL_177;
      }
      uint64_t v35 = v239 + 1;
    }
    while ((id)(v239 + 1) != v236);
    id v236 = [obj countByEnumeratingWithState:&v247 objects:v267 count:16];
    if (v236) {
      continue;
    }
    break;
  }
LABEL_177:

  NSErrorUserInfoKey v134 = [v233 objectForKeyedSubscript:@"kVersion"];
  if (v134)
  {
    objc_opt_class();
    id v136 = (void (**)(void, void, void, void, double))v244;
    char v118 = v235;
    __int16 v119 = v231;
    if ((objc_opt_isKindOfClass() & 1) != 0 || (uint64_t)[v134 integerValue] < 3) {
      uint64_t v211 = 2;
    }
    else {
      uint64_t v211 = (uint64_t)[v134 integerValue];
    }
  }
  else
  {
    uint64_t v211 = 2;
    id v136 = (void (**)(void, void, void, void, double))v244;
    char v118 = v235;
    __int16 v119 = v231;
  }
  id v212 = objc_alloc((Class)NSMutableDictionary);
  v251[0] = @"kVersion";
  v213 = +[NSNumber numberWithInteger:v211];
  v252[0] = v213;
  v252[1] = v232;
  v251[1] = @"kBatchId";
  v251[2] = @"kTaskId";
  v251[3] = @"kCommandsResponse";
  v252[2] = v118;
  v252[3] = v119;
  v214 = +[NSDictionary dictionaryWithObjects:v252 forKeys:v251 count:4];
  id v135 = [v212 initWithDictionary:v214];

  id v215 = [v119 count];
  if (v215 != [obj count]) {
    [v135 setValue:&__kCFBooleanTrue forKey:@"incompletedExecution"];
  }
  v216 = NFSharedSignpostLog();
  id v30 = v230;
  if (os_signpost_enabled(v216))
  {
    *(_WORD *)id buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v216, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "execRemoteAdminScript", (const char *)&unk_100286819, buf, 2u);
  }

  ((void (**)(void, id, void, void *, double))v136)[2](v136, v135, 0, v33, (double)v34 / 1000.0);
  id v29 = v232;
  id v6 = v233;
LABEL_121:
}

- (void)felicaStateForSystemCode:(id)a3 withRequestService:(id)a4 performSearchServiceCode:(BOOL)a5 completion:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  v24.receiver = self;
  v24.super_class = (Class)_NFReaderSession;
  id v14 = [(_NFSession *)&v24 workQueue];
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_1001C5D50;
  v18[3] = &unk_100306D28;
  id v21 = v13;
  SEL v22 = a2;
  v18[4] = self;
  id v19 = v11;
  id v20 = v12;
  BOOL v23 = a5;
  id v15 = v12;
  id v16 = v11;
  id v17 = v13;
  dispatch_async(v14, v18);
}

- (void)_sync_felicaStateForSystemCode:(id)a3 withRequestService:(id)a4 performSearchServiceCode:(BOOL)a5 completion:(id)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a4;
  id v12 = (void (**)(id, void, id))a6;
  currentTag = self->_currentTag;
  if (currentTag
    && ([(NFTag *)currentTag tagF], id v14 = objc_claimAutoreleasedReturnValue(), v14, v14))
  {
    id v15 = [(NFTag *)self->_currentTag tagF];
    id v16 = v15;
    if (!v7)
    {
      id v63 = v11;
      long long v68 = 0u;
      long long v69 = 0u;
      long long v66 = 0u;
      long long v67 = 0u;
      SEL v22 = [v15 allSystemCodes];
      id v26 = [v22 countByEnumeratingWithState:&v66 objects:v78 count:16];
      if (v26)
      {
        id v27 = v26;
        uint64_t v28 = *(void *)v67;
        while (2)
        {
          for (uint64_t i = 0; i != v27; uint64_t i = (char *)i + 1)
          {
            if (*(void *)v67 != v28) {
              objc_enumerationMutation(v22);
            }
            id v30 = *(void **)(*((void *)&v66 + 1) + 8 * i);
            if ([v30 isEqualToData:v10])
            {
              int v61 = v12;
              id v24 = (id)objc_opt_new();
              uint32_t v31 = [v30 NF_asHexString];
              [v24 setObject:v31 forKeyedSubscript:@"systemCode"];

              uint64_t v32 = self->_currentTag;
              id v64 = 0;
              id v65 = 0;
              uint64_t v33 = [(_NFReaderSession *)self _getIDMFromTag:v32 systemCode:v30 outIdm:&v65 outPmm:&v64];
              id v34 = v65;
              id v35 = v64;
              int v59 = (void *)v33;
              uint64_t v60 = v16;
              if (v33)
              {
                uint64_t v36 = [v16 IDm];

                uint64_t v37 = [v16 PMm];
                NSErrorUserInfoKey v38 = v35;
                id v35 = (id)v37;

                id v34 = (id)v36;
              }
              id v11 = v63;
              __int16 v58 = v34;
              id v39 = [v34 NF_asHexString];
              [v24 setObject:v39 forKeyedSubscript:@"idm"];

              uint64_t v57 = v35;
              uint64_t v40 = [v35 NF_asHexString];
              [v24 setObject:v40 forKeyedSubscript:@"pmm"];

              id v62 = v10;
              int v41 = [(_NFReaderSession *)self _RequestService:v63 forSystemCode:v10];
              __int16 v42 = objc_opt_new();
              if ([v41 count])
              {
                unint64_t v43 = 0;
                do
                {
                  id v44 = objc_alloc((Class)NSDictionary);
                  int v45 = [v11 objectAtIndex:v43];
                  __int16 v46 = [v45 NF_asHexString];
                  int v47 = [v41 objectAtIndex:v43];
                  __int16 v48 = [v47 NF_asHexString];
                  id v49 = [v44 initWithObjectsAndKeys:v46, @"areaCode", v48, @"keyVersion", 0];
                  [v42 addObject:v49];

                  id v11 = v63;
                  ++v43;
                }
                while ((unint64_t)[v41 count] > v43);
              }
              [v24 setObject:v42 forKeyedSubscript:@"areaCodeList"];
              id v12 = v61;
              ((void (**)(id, id, id))v61)[2](v61, v24, 0);

              id v10 = v62;
              id v16 = v60;
              goto LABEL_36;
            }
          }
          id v27 = [v22 countByEnumeratingWithState:&v66 objects:v78 count:16];
          if (v27) {
            continue;
          }
          break;
        }
      }
      id v11 = v63;
      goto LABEL_35;
    }
    if (v10)
    {
      long long v73 = 0u;
      long long v74 = 0u;
      long long v71 = 0u;
      long long v72 = 0u;
      id v17 = [v15 allSystemCodes];
      id v18 = [v17 countByEnumeratingWithState:&v71 objects:v79 count:16];
      if (v18)
      {
        id v19 = v18;
        uint64_t v20 = *(void *)v72;
        while (2)
        {
          for (j = 0; j != v19; j = (char *)j + 1)
          {
            if (*(void *)v72 != v20) {
              objc_enumerationMutation(v17);
            }
            if ([*(id *)(*((void *)&v71 + 1) + 8 * (void)j) isEqualToData:v10])
            {
              uint64_t v70 = 0;
              __int16 v50 = (id *)&v70;
              int v51 = &v70;
              __int16 v52 = self;
              id v53 = v10;
              goto LABEL_32;
            }
          }
          id v19 = [v17 countByEnumeratingWithState:&v71 objects:v79 count:16];
          if (v19) {
            continue;
          }
          break;
        }
      }

      SEL v22 = 0;
      goto LABEL_35;
    }
    id v17 = [v15 SystemCode];
    uint64_t v75 = 0;
    __int16 v50 = (id *)&v75;
    int v51 = &v75;
    __int16 v52 = self;
    id v53 = v17;
LABEL_32:
    SEL v22 = [(_NFReaderSession *)v52 _getSystemInfo:v53 outError:v51];
    id v24 = *v50;

    if (!v22)
    {
      SEL v22 = v24;
LABEL_35:

      id v54 = objc_alloc((Class)NSError);
      SEL v22 = +[NSString stringWithUTF8String:"nfcd"];
      NSErrorUserInfoKey v76 = NSLocalizedDescriptionKey;
      id v24 = +[NSString stringWithUTF8String:"Tag Not Found"];
      id v77 = v24;
      int v55 = +[NSDictionary dictionaryWithObjects:&v77 forKeys:&v76 count:1];
      id v56 = [v54 initWithDomain:v22 code:28 userInfo:v55];
      v12[2](v12, 0, v56);

      goto LABEL_36;
    }
    ((void (**)(id, void *, id))v12)[2](v12, v22, v24);
  }
  else
  {
    id v23 = objc_alloc((Class)NSError);
    id v16 = +[NSString stringWithUTF8String:"nfcd"];
    NSErrorUserInfoKey v80 = NSLocalizedDescriptionKey;
    SEL v22 = +[NSString stringWithUTF8String:"Invalid State"];
    id v81 = v22;
    id v24 = +[NSDictionary dictionaryWithObjects:&v81 forKeys:&v80 count:1];
    id v25 = [v23 initWithDomain:v16 code:12 userInfo:v24];
    v12[2](v12, 0, v25);
  }
LABEL_36:
}

- (void)updateSharingUIScanText:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = (void (**)(id, id))a4;
  if (![(_NFSession *)self didStart]
    || [(_NFSession *)self isSuspended]
    || [(_NFSession *)self didEnd])
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      id v10 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      id v15 = [(_NFSession *)self sessionUID];
      uint64_t v16 = 45;
      if (isMetaClass) {
        uint64_t v16 = 43;
      }
      v10(3, "%c[%{public}s %{public}s]:%i Session %{public}@ is not active", v16, ClassName, Name, 2027, v15);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    id v17 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      id v18 = object_getClass(self);
      if (class_isMetaClass(v18)) {
        int v19 = 43;
      }
      else {
        int v19 = 45;
      }
      uint64_t v20 = object_getClassName(self);
      id v21 = sel_getName(a2);
      SEL v22 = [(_NFSession *)self sessionUID];
      *(_DWORD *)id buf = 67110146;
      int v31 = v19;
      __int16 v32 = 2082;
      uint64_t v33 = v20;
      __int16 v34 = 2082;
      id v35 = v21;
      __int16 v36 = 1024;
      int v37 = 2027;
      __int16 v38 = 2114;
      id v39 = v22;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Session %{public}@ is not active", buf, 0x2Cu);
    }
    if (v8)
    {
      id v23 = objc_alloc((Class)NSError);
      id v24 = +[NSString stringWithUTF8String:"nfcd"];
      NSErrorUserInfoKey v28 = NSLocalizedDescriptionKey;
      id v25 = +[NSString stringWithUTF8String:"Session not active"];
      id v29 = v25;
      id v26 = +[NSDictionary dictionaryWithObjects:&v29 forKeys:&v28 count:1];
      id v27 = [v23 initWithDomain:v24 code:54 userInfo:v26];
      v8[2](v8, v27);
    }
  }
  else
  {
    [(NFUIService *)self->_uiService coreNFCUISetScanText:v7];
    v8[2](v8, 0);
  }
}

- (void)updateSharingUIStateOnInvalidation:(int64_t)a3 completion:(id)a4
{
  id v7 = (void (**)(id, id))a4;
  if (![(_NFSession *)self didStart]
    || [(_NFSession *)self isSuspended]
    || [(_NFSession *)self didEnd])
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      id v9 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      id v14 = [(_NFSession *)self sessionUID];
      uint64_t v15 = 45;
      if (isMetaClass) {
        uint64_t v15 = 43;
      }
      v9(3, "%c[%{public}s %{public}s]:%i Session %{public}@ is not active", v15, ClassName, Name, 2041, v14);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v16 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      id v17 = object_getClass(self);
      if (class_isMetaClass(v17)) {
        int v18 = 43;
      }
      else {
        int v18 = 45;
      }
      int v19 = object_getClassName(self);
      uint64_t v20 = sel_getName(a2);
      id v21 = [(_NFSession *)self sessionUID];
      *(_DWORD *)id buf = 67110146;
      int v30 = v18;
      __int16 v31 = 2082;
      __int16 v32 = v19;
      __int16 v33 = 2082;
      __int16 v34 = v20;
      __int16 v35 = 1024;
      int v36 = 2041;
      __int16 v37 = 2114;
      __int16 v38 = v21;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Session %{public}@ is not active", buf, 0x2Cu);
    }
    if (v7)
    {
      id v22 = objc_alloc((Class)NSError);
      id v23 = +[NSString stringWithUTF8String:"nfcd"];
      NSErrorUserInfoKey v27 = NSLocalizedDescriptionKey;
      id v24 = +[NSString stringWithUTF8String:"Session not active"];
      NSErrorUserInfoKey v28 = v24;
      id v25 = +[NSDictionary dictionaryWithObjects:&v28 forKeys:&v27 count:1];
      id v26 = [v22 initWithDomain:v23 code:54 userInfo:v25];
      v7[2](v7, v26);
    }
  }
  else
  {
    self->_int64_t uiStateOnInvalidation = a3;
    v7[2](v7, 0);
  }
}

- (void)felicaRequestService:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)_NFReaderSession;
  id v9 = [(_NFSession *)&v16 workQueue];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1001C6D84;
  v12[3] = &unk_100302278;
  id v14 = v8;
  SEL v15 = a2;
  v12[4] = self;
  id v13 = v7;
  id v10 = v7;
  id v11 = v8;
  dispatch_async(v9, v12);
}

- (void)felicaRequestService:(id)a3 forSystemCode:(id)a4 completion:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v21.receiver = self;
  v21.super_class = (Class)_NFReaderSession;
  id v12 = [(_NFSession *)&v21 workQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001C7248;
  block[3] = &unk_100302250;
  id v19 = v11;
  SEL v20 = a2;
  block[4] = self;
  id v17 = v9;
  id v18 = v10;
  id v13 = v10;
  id v14 = v9;
  id v15 = v11;
  dispatch_async(v12, block);
}

- (void)writeProtectNDEFTagWithCompletion:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_NFReaderSession;
  id v6 = [(_NFSession *)&v11 workQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001C76C4;
  block[3] = &unk_100301D38;
  id v9 = v5;
  SEL v10 = a2;
  block[4] = self;
  id v7 = v5;
  dispatch_async(v6, block);
}

- (void)performVAS:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)_NFReaderSession;
  id v9 = [(_NFSession *)&v16 workQueue];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1001C7D9C;
  v12[3] = &unk_100302278;
  id v14 = v8;
  SEL v15 = a2;
  v12[4] = self;
  id v13 = v7;
  id v10 = v7;
  id v11 = v8;
  dispatch_async(v9, v12);
}

- (void)configurePollingProfile:(int64_t)a3 completion:(id)a4
{
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)_NFReaderSession;
  id v8 = [(_NFSession *)&v14 workQueue];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1001C8A14;
  v10[3] = &unk_100302648;
  v10[4] = self;
  id v11 = v7;
  SEL v12 = a2;
  int64_t v13 = a3;
  id v9 = v7;
  dispatch_async(v8, v10);
}

- (void)enableContinuousWave:(BOOL)a3 withFrequencySweep:(BOOL)a4 completion:(id)a5
{
  id v9 = (void (**)(id, id))a5;
  if (![(_NFSession *)self didStart]
    || [(_NFSession *)self isSuspended]
    || [(_NFSession *)self didEnd])
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      id v11 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      objc_super v16 = [(_NFSession *)self sessionUID];
      uint64_t v17 = 45;
      if (isMetaClass) {
        uint64_t v17 = 43;
      }
      v11(3, "%c[%{public}s %{public}s]:%i Session %{public}@ is not active", v17, ClassName, Name, 2194, v16);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    id v18 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      id v19 = object_getClass(self);
      if (class_isMetaClass(v19)) {
        int v20 = 43;
      }
      else {
        int v20 = 45;
      }
      objc_super v21 = object_getClassName(self);
      id v22 = sel_getName(a2);
      id v23 = [(_NFSession *)self sessionUID];
      *(_DWORD *)id buf = 67110146;
      int v39 = v20;
      __int16 v40 = 2082;
      int v41 = v21;
      __int16 v42 = 2082;
      unint64_t v43 = v22;
      __int16 v44 = 1024;
      int v45 = 2194;
      __int16 v46 = 2114;
      int v47 = v23;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Session %{public}@ is not active", buf, 0x2Cu);
    }
    if (v9)
    {
      id v24 = objc_alloc((Class)NSError);
      id v25 = +[NSString stringWithUTF8String:"nfcd"];
      NSErrorUserInfoKey v36 = NSLocalizedDescriptionKey;
      id v26 = +[NSString stringWithUTF8String:"Session not active"];
      __int16 v37 = v26;
      NSErrorUserInfoKey v27 = +[NSDictionary dictionaryWithObjects:&v37 forKeys:&v36 count:1];
      id v28 = [v24 initWithDomain:v25 code:54 userInfo:v27];
      v9[2](v9, v28);
    }
  }
  else
  {
    v35.receiver = self;
    v35.super_class = (Class)_NFReaderSession;
    id v29 = [(_NFSession *)&v35 workQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1001C94E0;
    block[3] = &unk_100302368;
    block[4] = self;
    SEL v32 = a2;
    __int16 v31 = v9;
    BOOL v33 = a3;
    BOOL v34 = a4;
    dispatch_async(v29, block);
  }
}

- (BOOL)suspendWithInfo:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)_NFReaderSession;
  BOOL v5 = [(_NFXPCSession *)&v18 suspendWithInfo:v4];
  if (v5)
  {
    currentTag = self->_currentTag;
    if (currentTag)
    {
      sub_1001900C4(self->_driverWrapper, currentTag, 0);
      id v7 = self->_currentTag;
      self->_currentTag = 0;
    }
    id WeakRetained = objc_loadWeakRetained((id *)&self->_powerConsumptionReporter);
    sub_1001B03F0((uint64_t)WeakRetained, self);

    id v9 = +[_NFHardwareManager sharedHardwareManager];
    [v9 notifyReaderModeActivityEnd];

    self->_int pollingConfig = 0;
    if (self->_continuousWaveState) {
      id v10 = sub_1001EC2F4(self->_driverWrapper, 0);
    }
    id v11 = [v4 NF_numberForKey:@"ReasonCode"];
    SEL v12 = [(_NFSession *)self suspendOnFieldList];
    if ([v12 count] && v11 && objc_msgSend(v11, "integerValue") == (id)2)
    {
      int64_t v13 = sub_10020EC44((id *)&self->_driverWrapper->super.isa);
      unsigned int v14 = [v13 wantsReader];

      if (!v14)
      {
LABEL_12:
        [(_NFReaderSession *)self cleanupUI];

        goto LABEL_13;
      }
      SEL v12 = +[_NFHardwareManager sharedHardwareManager];
      SEL v15 = +[NFRoutingConfig routingOff];
      id v16 = [v12 setRoutingConfig:v15];
    }
    goto LABEL_12;
  }
LABEL_13:

  return v5;
}

- (void)resume
{
  v33.receiver = self;
  v33.super_class = (Class)_NFReaderSession;
  [(_NFXPCSession *)&v33 resume];
  unint64_t continuousWaveState = self->_continuousWaveState;
  if (continuousWaveState)
  {
    BOOL v5 = +[_NFHardwareManager sharedHardwareManager];
    id v6 = +[NFRoutingConfig routingOffWithFD:0];
    id v7 = [v5 setRoutingConfig:v6];

    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t Logger = NFLogGetLogger();
    id v9 = (void (*)(uint64_t, const char *, ...))Logger;
    if (v7)
    {
      if (Logger)
      {
        Class = object_getClass(self);
        BOOL isMetaClass = class_isMetaClass(Class);
        ClassName = object_getClassName(self);
        Name = sel_getName(a2);
        uint64_t v12 = 45;
        if (isMetaClass) {
          uint64_t v12 = 43;
        }
        v9(3, "%c[%{public}s %{public}s]:%i Failed to resume Continous Wave - %{public}@", v12, ClassName, Name, 2268, v7);
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      int64_t v13 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        unsigned int v14 = object_getClass(self);
        if (class_isMetaClass(v14)) {
          int v15 = 43;
        }
        else {
          int v15 = 45;
        }
        id v16 = object_getClassName(self);
        uint64_t v17 = sel_getName(a2);
        *(_DWORD *)id buf = 67110146;
        int v35 = v15;
        __int16 v36 = 2082;
        __int16 v37 = v16;
        __int16 v38 = 2082;
        int v39 = v17;
        __int16 v40 = 1024;
        int v41 = 2268;
        __int16 v42 = 2114;
        unint64_t v43 = v7;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to resume Continous Wave - %{public}@", buf, 0x2Cu);
      }
    }
    else
    {
      if (Logger)
      {
        objc_super v18 = object_getClass(self);
        BOOL v19 = class_isMetaClass(v18);
        int v20 = object_getClassName(self);
        objc_super v21 = sel_getName(a2);
        if (continuousWaveState == 2) {
          id v22 = "with";
        }
        else {
          id v22 = "without";
        }
        uint64_t v23 = 45;
        if (v19) {
          uint64_t v23 = 43;
        }
        v9(6, "%c[%{public}s %{public}s]:%i Resuming ContinuousWave %s freq sweep", v23, v20, v21, 2270, v22);
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      id v24 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        id v25 = object_getClass(self);
        if (class_isMetaClass(v25)) {
          int v26 = 43;
        }
        else {
          int v26 = 45;
        }
        NSErrorUserInfoKey v27 = object_getClassName(self);
        id v28 = sel_getName(a2);
        *(_DWORD *)id buf = 67110146;
        if (continuousWaveState == 2) {
          id v29 = "with";
        }
        else {
          id v29 = "without";
        }
        int v35 = v26;
        __int16 v36 = 2082;
        __int16 v37 = v27;
        __int16 v38 = 2082;
        int v39 = v28;
        __int16 v40 = 1024;
        int v41 = 2270;
        __int16 v42 = 2080;
        unint64_t v43 = v29;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Resuming ContinuousWave %s freq sweep", buf, 0x2Cu);
      }

      id v30 = sub_1001EC2F4(self->_driverWrapper, 1u);
    }
  }
}

- (void)_tagRemovalDetect:(id)a3
{
  id v4 = a3;
  BOOL v5 = +[_NFHardwareManager sharedHardwareManager];
  id v6 = [v5 controllerInfo];
  id v7 = [v6 siliconName];

  if ((unint64_t)v7 >= 7)
  {
    id v8 = NFSharedSignpostLog();
    if (os_signpost_enabled(v8))
    {
      *(_WORD *)id buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v8, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "tagRemovalDetect", (const char *)&unk_100286819, buf, 2u);
    }

    driverWrapper = self->_driverWrapper;
    if (driverWrapper)
    {
      int v10 = sub_10018FAE8(driverWrapper, v4, 0);
      if (v10) {
        goto LABEL_8;
      }
      driverWrapper = self->_driverWrapper;
    }
    int v10 = sub_1001900C4(driverWrapper, v4, 1u);
LABEL_8:
    if (v10 != 51) {
      goto LABEL_15;
    }
    goto LABEL_14;
  }
  id v11 = self->_driverWrapper;
  if (!v11) {
    goto LABEL_13;
  }
  int v12 = sub_10018FAE8(v11, v4, 0);
  if (v12 == 51)
  {
LABEL_14:
    sub_1002128B4(self->_driverWrapper);
    goto LABEL_15;
  }
  if (!v12)
  {
LABEL_13:
    objc_initWeak(&location, self);
    *(void *)id buf = 0;
    NSErrorUserInfoKey v27 = buf;
    uint64_t v28 = 0x3032000000;
    id v29 = sub_10000B8F8;
    id v30 = sub_1001CA3C8;
    id v31 = v4;
    uint64_t v20 = 0;
    objc_super v21 = &v20;
    uint64_t v22 = 0x3032000000;
    uint64_t v23 = sub_10000B8F8;
    id v24 = sub_1001CA3C8;
    id v25 = 0;
    id v13 = objc_alloc((Class)NFTimer);
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_1001CA3D0;
    v18[3] = &unk_100306D50;
    objc_copyWeak(&v19, &location);
    v18[4] = buf;
    void v18[5] = &v20;
    v17.receiver = self;
    v17.super_class = (Class)_NFReaderSession;
    unsigned int v14 = [(_NFSession *)&v17 workQueue];
    id v15 = [v13 initWithCallback:v18 queue:v14];
    id v16 = (void *)v21[5];
    v21[5] = (uint64_t)v15;

    [(id)v21[5] startTimer:0.5];
    _Block_object_dispose(&v20, 8);

    objc_destroyWeak(&v19);
    _Block_object_dispose(buf, 8);

    objc_destroyWeak(&location);
  }
LABEL_15:
}

- (unsigned)_getTagTypeFromTag:(id)a3
{
  unsigned int v3 = [a3 type];
  if (v3 > 0x10) {
    return 0;
  }
  else {
    return dword_100284348[v3];
  }
}

- (BOOL)_isCoreNFCSession
{
  return self->_serviceType == 2;
}

- (_NFDriverTagDiscoveryNtf)_getTagNotificationConfig
{
  return (_NFDriverTagDiscoveryNtf)(((self->_sessionConfig & 4) == 0) | 0x6FE);
}

- (BOOL)_processRawTagsForInternalSession:(id)a3 supportedTags:(id)a4 outError:(id *)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = v10;
  if ((self->_pollingProfile - 1) <= 2)
  {
    [v10 addObjectsFromArray:v9];
    BOOL v12 = 1;
    goto LABEL_38;
  }
  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id v13 = v9;
  id v14 = [v13 countByEnumeratingWithState:&v39 objects:v47 count:16];
  BOOL v12 = 1;
  if (!v14) {
    goto LABEL_37;
  }
  id v15 = v14;
  sel = a2;
  id v37 = v9;
  uint64_t v16 = *(void *)v40;
  __int16 v38 = v11;
LABEL_5:
  uint64_t v17 = 0;
  while (1)
  {
    if (*(void *)v40 != v16) {
      objc_enumerationMutation(v13);
    }
    objc_super v18 = *(void **)(*((void *)&v39 + 1) + 8 * v17);
    if ([v18 type])
    {
      if ([v18 type] != 10) {
        break;
      }
    }
LABEL_28:
    if (v15 == (id)++v17)
    {
      id v15 = [v13 countByEnumeratingWithState:&v39 objects:v47 count:16];
      if (v15) {
        goto LABEL_5;
      }
LABEL_30:
      BOOL v12 = 1;
LABEL_34:
      id v9 = v37;
      goto LABEL_37;
    }
  }
  if (![(_NFReaderSession *)self _requiresTypeFUpdate:v18]
    && ![(_NFReaderSession *)self _requiresMifareUpdate:v18])
  {
    [v11 addObject:v18];
LABEL_26:
    if ([v11 count] && (self->_sessionConfig & 0x40) != 0) {
      goto LABEL_30;
    }
    goto LABEL_28;
  }
  driverWrapper = self->_driverWrapper;
  if (!driverWrapper
    || ((unsigned int v20 = sub_10018FAE8(driverWrapper, v18, 0), v20 - 35 <= 0x1D)
      ? (BOOL v21 = ((1 << (v20 - 35)) & 0x20010001) == 0)
      : (BOOL v21 = 1),
        v21))
  {
    id v11 = v38;
    if ([(_NFReaderSession *)self _updateFelicaTagInfo:v18 outError:a5]
      && [(_NFReaderSession *)self _updateMifareTagInfo:v18 outError:a5])
    {
      [v38 addObject:v18];
    }
    if ([*a5 code] == (id)51 || objc_msgSend(*a5, "code") == (id)64)
    {
      BOOL v12 = 0;
      goto LABEL_34;
    }
    if (sub_1001900C4(self->_driverWrapper, v18, 0) == 51)
    {
      id v24 = objc_alloc((Class)NSError);
      uint64_t v25 = +[NSString stringWithUTF8String:"nfcd"];
      v43[0] = NSLocalizedDescriptionKey;
      int v26 = +[NSString stringWithUTF8String:"RF Deactivated"];
      v44[0] = v26;
      v44[1] = &off_10031D8D8;
      v43[1] = @"Line";
      v43[2] = @"Method";
      id v27 = [objc_alloc((Class)NSString) initWithFormat:@"%s", sel_getName(sel)];
      v44[2] = v27;
      v43[3] = NSDebugDescriptionErrorKey;
      uint64_t v28 = (void *)v25;
      id v29 = [objc_alloc((Class)NSString) initWithFormat:@"%s:%d", sel_getName(sel), 2421];
      v44[3] = v29;
      id v30 = +[NSDictionary dictionaryWithObjects:v44 forKeys:v43 count:4];
      id v31 = v24;
      SEL v32 = v28;
      uint64_t v33 = 51;
      goto LABEL_35;
    }
    goto LABEL_26;
  }
  if (!a5) {
    goto LABEL_36;
  }
  unsigned int v22 = v20;
  id v35 = objc_alloc((Class)NSError);
  uint64_t v23 = +[NSString stringWithUTF8String:"nfcd"];
  v45[0] = NSLocalizedDescriptionKey;
  int v26 = +[NSString stringWithUTF8String:off_100306978[v22]];
  v46[0] = v26;
  v46[1] = &off_10031D8C0;
  v45[1] = @"Line";
  v45[2] = @"Method";
  id v27 = [objc_alloc((Class)NSString) initWithFormat:@"%s", sel_getName(sel)];
  v46[2] = v27;
  v45[3] = NSDebugDescriptionErrorKey;
  uint64_t v28 = (void *)v23;
  id v29 = [objc_alloc((Class)NSString) initWithFormat:@"%s:%d", sel_getName(sel), 2407];
  v46[3] = v29;
  id v30 = +[NSDictionary dictionaryWithObjects:v46 forKeys:v45 count:4];
  id v31 = v35;
  SEL v32 = v28;
  uint64_t v33 = v22;
LABEL_35:
  *a5 = [v31 initWithDomain:v32 code:v33 userInfo:v30];

LABEL_36:
  BOOL v12 = 0;
  id v9 = v37;
  id v11 = v38;
LABEL_37:

LABEL_38:
  return v12;
}

- (BOOL)_processRawTagsForNDEF:(id)a3 ndefMessages:(id)a4 supportedTags:(id)a5 caEvents:(id)a6 outError:(id *)a7
{
  id v12 = a3;
  id v58 = a4;
  id v56 = a5;
  id v55 = a6;
  long long v64 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  id v13 = v12;
  id v14 = [v13 countByEnumeratingWithState:&v64 objects:v72 count:16];
  if (!v14)
  {
    id v36 = 0;
    id v37 = v13;
    __int16 v38 = a7;
    goto LABEL_51;
  }
  id v15 = v14;
  sel = a2;
  BOOL v59 = 0;
  id v16 = 0;
  uint64_t v17 = *(void *)v65;
  uint64_t v60 = v13;
  uint64_t v57 = *(void *)v65;
  while (2)
  {
    for (uint64_t i = 0; i != v15; uint64_t i = (char *)i + 1)
    {
      if (*(void *)v65 != v17) {
        objc_enumerationMutation(v13);
      }
      id v19 = *(void **)(*((void *)&v64 + 1) + 8 * i);
      if ([v19 type] && objc_msgSend(v19, "type") != 10)
      {
        driverWrapper = self->_driverWrapper;
        if (driverWrapper)
        {
          unsigned int v21 = sub_10018FAE8(driverWrapper, v19, 0);
          unsigned int v22 = v21;
          switch(v21)
          {
            case '@':
              goto LABEL_41;
            case '3':
              goto LABEL_46;
            case '#':
LABEL_41:
              id v39 = objc_alloc((Class)NSError);
              long long v40 = +[NSString stringWithUTF8String:"nfcd"];
              uint64_t v41 = v22;
              v70[0] = NSLocalizedDescriptionKey;
              long long v42 = +[NSString stringWithUTF8String:off_100306978[v22]];
              v71[0] = v42;
              v71[1] = &off_10031D8F0;
              v70[1] = @"Line";
              v70[2] = @"Method";
              id v43 = [objc_alloc((Class)NSString) initWithFormat:@"%s", sel_getName(sel)];
              v71[2] = v43;
              v70[3] = NSDebugDescriptionErrorKey;
              id v44 = [objc_alloc((Class)NSString) initWithFormat:@"%s:%d", sel_getName(sel), 2455];
              v71[3] = v44;
              int v45 = +[NSDictionary dictionaryWithObjects:v71 forKeys:v70 count:4];
              id v46 = [v39 initWithDomain:v40 code:v41 userInfo:v45];

              id v13 = v60;
              id v16 = v46;
              goto LABEL_49;
          }
        }
        id v63 = v16;
        [(_NFReaderSession *)self _updateFelicaTagInfo:v19 outError:&v63];
        id v23 = v63;

        if (v23)
        {
          if ([v23 code] == (id)51)
          {
            id v16 = v23;
LABEL_46:
            id v13 = v60;
            goto LABEL_47;
          }
          if ([v23 code] == (id)64)
          {
            id v13 = v60;

            id v16 = v23;
            goto LABEL_49;
          }
        }
        id v24 = sub_10023D968();
        sub_10023D9FC((uint64_t)v24, v19);

        id v61 = v23;
        uint64_t v62 = 0;
        uint64_t v25 = [(_NFReaderSession *)self _readNdefMessageFromTag:v19 rawLength:&v62 error:&v61];
        id v16 = v61;

        if (v25) {
          BOOL v26 = v16 == 0;
        }
        else {
          BOOL v26 = 0;
        }
        int v27 = v26;
        if (v16 && [v16 code] == (id)64)
        {
LABEL_42:

          id v13 = v60;
          goto LABEL_43;
        }
        if (v25)
        {
          uint64_t v28 = [v25 asData];
          id v29 = [v28 length];

          id v30 = sub_10023D968();
          sub_10023DF68((uint64_t)v30, (uint64_t)v29);
        }
        int v31 = sub_1001900C4(self->_driverWrapper, v19, 0);
        if ([v19 type]) {
          unsigned int v32 = [v19 type];
        }
        else {
          unsigned int v32 = sub_10018F854((uint64_t)self->_driverWrapper, v19);
        }
        unsigned int v33 = v32;
        BOOL v34 = sub_10023D968();
        sub_10023DAD0((uint64_t)v34, v19, v33);

        BOOL v59 = v31 == 51;
        id v13 = v60;
        if (v25)
        {
          ++self->_totalTagRead;
          [v58 addObject:v25];
          id v35 = [objc_alloc((Class)NFTagInternal) initWithNFTagForUIDOnly:v19];
          if (v35) {
            [v56 addObject:v35];
          }

          if (v27)
          {
            if ((self->_sessionConfig & 0x40) != 0 || v31 == 51) {
              goto LABEL_42;
            }
            goto LABEL_36;
          }
        }
        if (v31 != 51)
        {
LABEL_36:

          uint64_t v17 = v57;
          continue;
        }

LABEL_47:
        __int16 v38 = a7;
        goto LABEL_50;
      }
    }
    id v15 = [v13 countByEnumeratingWithState:&v64 objects:v72 count:16];
    if (v15) {
      continue;
    }
    break;
  }
LABEL_43:

LABEL_49:
  __int16 v38 = a7;
  if (!v59) {
    goto LABEL_52;
  }
LABEL_50:
  id v47 = objc_alloc((Class)NSError);
  id v37 = +[NSString stringWithUTF8String:"nfcd"];
  v68[0] = NSLocalizedDescriptionKey;
  __int16 v48 = +[NSString stringWithUTF8String:"RF Deactivated"];
  v69[0] = v48;
  v69[1] = &off_10031D908;
  v68[1] = @"Line";
  v68[2] = @"Method";
  id v49 = [objc_alloc((Class)NSString) initWithFormat:@"%s", sel_getName(sel)];
  v69[2] = v49;
  v68[3] = NSDebugDescriptionErrorKey;
  id v50 = [objc_alloc((Class)NSString) initWithFormat:@"%s:%d", sel_getName(sel), 2508];
  v69[3] = v50;
  int v51 = +[NSDictionary dictionaryWithObjects:v69 forKeys:v68 count:4];
  id v36 = [v47 initWithDomain:v37 code:51 userInfo:v51];

  id v13 = v60;
LABEL_51:

  id v16 = v36;
LABEL_52:
  if (v38) {
    *__int16 v38 = v16;
  }

  return v16 == 0;
}

- (BOOL)_processRawTagsForCoreNFC:(id)a3 requireDiscoveryRestart:(BOOL *)a4 supportedTags:(id)a5 caEvents:(id)a6 outError:(id *)a7 outConnectedTagIndex:(unint64_t *)a8
{
  id v12 = a3;
  id v97 = a5;
  id v13 = a6;
  if (a7) {
    *a7 = 0;
  }
  id v95 = v13;
  long long v106 = 0u;
  long long v107 = 0u;
  long long v104 = 0u;
  long long v105 = 0u;
  id v14 = v12;
  id v15 = [v14 countByEnumeratingWithState:&v104 objects:v122 count:16];
  id v98 = v14;
  if (!v15)
  {
    id v17 = 0;
    goto LABEL_79;
  }
  id v16 = v15;
  uint64_t v96 = a7;
  id v17 = 0;
  uint64_t v18 = *(void *)v105;
  while (2)
  {
    for (uint64_t i = 0; i != v16; uint64_t i = (char *)i + 1)
    {
      if (*(void *)v105 != v18) {
        objc_enumerationMutation(v14);
      }
      unsigned int v20 = *(void **)(*((void *)&v104 + 1) + 8 * i);
      if (![v20 type] || objc_msgSend(v20, "type") == 10) {
        continue;
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      uint64_t Logger = NFLogGetLogger();
      if (Logger)
      {
        unsigned int v22 = (void (*)(uint64_t, const char *, ...))Logger;
        Class = object_getClass(self);
        BOOL isMetaClass = class_isMetaClass(Class);
        ClassName = object_getClassName(self);
        Name = sel_getName(a2);
        uint64_t v25 = 45;
        if (isMetaClass) {
          uint64_t v25 = 43;
        }
        v22(6, "%c[%{public}s %{public}s]:%i tag: %{public}@", v25, ClassName, Name, 2532, v20);
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      BOOL v26 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        int v27 = object_getClass(self);
        if (class_isMetaClass(v27)) {
          int v28 = 43;
        }
        else {
          int v28 = 45;
        }
        id v29 = object_getClassName(self);
        id v30 = sel_getName(a2);
        *(_DWORD *)id buf = 67110146;
        int v113 = v28;
        id v14 = v98;
        __int16 v114 = 2082;
        int v115 = v29;
        __int16 v116 = 2082;
        id v117 = v30;
        __int16 v118 = 1024;
        int v119 = 2532;
        __int16 v120 = 2114;
        __int16 v121 = v20;
        _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i tag: %{public}@", buf, 0x2Cu);
      }

      if (v17)
      {
        int v31 = sub_1001900C4(self->_driverWrapper, v17, 0);
        if (v31)
        {
          if (v31 == 51)
          {
            dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
            uint64_t v70 = NFLogGetLogger();
            if (v70)
            {
              long long v71 = (void (*)(uint64_t, const char *, ...))v70;
              long long v72 = object_getClass(self);
              BOOL v73 = class_isMetaClass(v72);
              long long v74 = object_getClassName(self);
              int v93 = sel_getName(a2);
              uint64_t v75 = 45;
              if (v73) {
                uint64_t v75 = 43;
              }
              v71(6, "%c[%{public}s %{public}s]:%i Tag deactivated", v75, v74, v93, 2539);
            }
            dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
            NSErrorUserInfoKey v76 = NFSharedLogGetLogger();
            if (os_log_type_enabled(v76, OS_LOG_TYPE_DEFAULT))
            {
              id v77 = object_getClass(self);
              if (class_isMetaClass(v77)) {
                int v78 = 43;
              }
              else {
                int v78 = 45;
              }
              BOOL v79 = object_getClassName(self);
              NSErrorUserInfoKey v80 = sel_getName(a2);
              *(_DWORD *)id buf = 67109890;
              int v113 = v78;
              __int16 v114 = 2082;
              int v115 = v79;
              __int16 v116 = 2082;
              id v117 = v80;
              __int16 v118 = 1024;
              int v119 = 2539;
              _os_log_impl((void *)&_mh_execute_header, v76, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Tag deactivated", buf, 0x22u);
            }

            if (v96)
            {
              id v81 = objc_alloc((Class)NSError);
              int v82 = +[NSString stringWithUTF8String:"nfcd"];
              v110[0] = NSLocalizedDescriptionKey;
              int v83 = +[NSString stringWithUTF8String:"RF Deactivated"];
              v111[0] = v83;
              v111[1] = &off_10031D920;
              v110[1] = @"Line";
              v110[2] = @"Method";
              id v84 = [objc_alloc((Class)NSString) initWithFormat:@"%s", sel_getName(a2)];
              v111[2] = v84;
              v110[3] = NSDebugDescriptionErrorKey;
              id v85 = [objc_alloc((Class)NSString) initWithFormat:@"%s:%d", sel_getName(a2), 2540];
              v111[3] = v85;
              id v86 = +[NSDictionary dictionaryWithObjects:v111 forKeys:v110 count:4];
              *uint64_t v96 = [v81 initWithDomain:v82 code:51 userInfo:v86];
            }
            goto LABEL_109;
          }
          dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          uint64_t v32 = NFLogGetLogger();
          if (v32)
          {
            unsigned int v33 = (void (*)(uint64_t, const char *, ...))v32;
            BOOL v34 = object_getClass(self);
            BOOL v35 = class_isMetaClass(v34);
            id v36 = object_getClassName(self);
            uint64_t v91 = sel_getName(a2);
            uint64_t v37 = 45;
            if (v35) {
              uint64_t v37 = 43;
            }
            v33(3, "%c[%{public}s %{public}s]:%i Failed to disconnect tag", v37, v36, v91, 2544);
          }
          dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          __int16 v38 = NFSharedLogGetLogger();
          if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
          {
            id v39 = object_getClass(self);
            if (class_isMetaClass(v39)) {
              int v40 = 43;
            }
            else {
              int v40 = 45;
            }
            uint64_t v41 = object_getClassName(self);
            long long v42 = sel_getName(a2);
            *(_DWORD *)id buf = 67109890;
            int v113 = v40;
            id v14 = v98;
            __int16 v114 = 2082;
            int v115 = v41;
            __int16 v116 = 2082;
            id v117 = v42;
            __int16 v118 = 1024;
            int v119 = 2544;
            _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to disconnect tag", buf, 0x22u);
          }
        }
      }
      buf[0] = 0;
      unint64_t pollOption = self->_pollOption;
      if ((pollOption & 4) != 0)
      {
        if ([v20 type] == 8)
        {
          __int16 v103 = 0;
          id v44 = [(_NFReaderSession *)self _processISO15693TagForCoreNFC:v20 outError:&v103];
          int v45 = v103;
          goto LABEL_60;
        }
        unint64_t pollOption = self->_pollOption;
      }
      if ((pollOption & 8) != 0
        && [(NFServiceWhitelistChecker *)self->_tagWhiteList nfcTagReaderAccess]
        && ([v20 type] == 3
         || [v20 type] == 6
         || [v20 type] == 2
         || [v20 type] == 5
         || [v20 type] == 9)
        && (self->_sessionConfig & 8) == 0)
      {
        id v102 = 0;
        id v44 = [(_NFReaderSession *)self _processISO14443TagForCoreNFC:v20 tagIsConnected:buf outError:&v102];
        id v46 = v102;
        if (!v44) {
          goto LABEL_72;
        }
        goto LABEL_61;
      }
      if ((self->_pollOption & 0x10) != 0
        && [(NFServiceWhitelistChecker *)self->_tagWhiteList nfcTagReaderAccess]
        && [v20 type] == 7)
      {
        uint64_t v101 = 0;
        id v44 = [(_NFReaderSession *)self _processFelicaTagForCoreNFC:v20 outError:&v101];
        int v45 = v101;
        goto LABEL_60;
      }
      if ((self->_pollOption & 8) == 0
        || ![(NFServiceWhitelistChecker *)self->_tagWhiteList nfcVASReaderAccess]
        || [v20 type] != 3
        || (self->_sessionConfig & 8) == 0)
      {
        if ((self->_pollOption & 2) == 0
          || ![(NFServiceWhitelistChecker *)self->_tagWhiteList nfcNDEFReaderAccess]
          || (self->_sessionConfig & 0x10) == 0)
        {
          id v44 = 0;
          id v17 = 0;
LABEL_73:

          continue;
        }
        int v100 = 0;
        id v44 = [(_NFReaderSession *)self _processNDEFTagForCoreNFC:v20 outError:&v100];
        int v45 = v100;
LABEL_60:
        id v46 = v45;
        buf[0] = v44 != 0;
        if (!v44) {
          goto LABEL_72;
        }
        goto LABEL_61;
      }
      id v50 = objc_alloc((Class)NFTagInternal);
      v108[0] = @"type";
      int v51 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [v20 type]);
      v109[0] = v51;
      v108[1] = @"technology";
      __int16 v52 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [v20 technology]);
      v109[1] = v52;
      v108[2] = @"UID";
      id v53 = [v20 UID];
      v109[2] = v53;
      id v54 = +[NSDictionary dictionaryWithObjects:v109 forKeys:v108 count:3];
      id v44 = [v50 initWithDictionary:v54];

      id v14 = v98;
      id v46 = 0;
      if (!v44)
      {
LABEL_72:
        id v17 = 0;
        if (!v46) {
          goto LABEL_73;
        }
        goto LABEL_66;
      }
LABEL_61:
      if (buf[0]) {
        id v47 = v44;
      }
      else {
        id v47 = 0;
      }
      id v17 = v47;
      [v97 addObject:v44];
      if ((self->_sessionConfig & 0x40) != 0)
      {

        goto LABEL_79;
      }
      if (!v46) {
        goto LABEL_73;
      }
LABEL_66:
      if ([v46 code] == (id)51)
      {
        if (v96) {
LABEL_96:
        }
          *uint64_t v96 = v46;

LABEL_109:
        BOOL v69 = 0;
        long long v68 = v95;
        goto LABEL_110;
      }
      id v48 = [v46 code];
      id v49 = v48;
      if (v96 && v48 == (id)64) {
        goto LABEL_96;
      }

      if (v49 == (id)64) {
        goto LABEL_109;
      }
    }
    id v16 = [v14 countByEnumeratingWithState:&v104 objects:v122 count:16];
    if (v16) {
      continue;
    }
    break;
  }
LABEL_79:

  if (![v97 count])
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v56 = NFLogGetLogger();
    if (v56)
    {
      uint64_t v57 = (void (*)(uint64_t, const char *, ...))v56;
      id v58 = object_getClass(self);
      BOOL v59 = class_isMetaClass(v58);
      uint64_t v60 = object_getClassName(self);
      uint64_t v92 = sel_getName(a2);
      uint64_t v61 = 45;
      if (v59) {
        uint64_t v61 = 43;
      }
      id v89 = v60;
      id v14 = v98;
      v57(6, "%c[%{public}s %{public}s]:%i No supported tag found", v61, v89, v92, 2604);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v62 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
    {
      id v63 = object_getClass(self);
      if (class_isMetaClass(v63)) {
        int v64 = 43;
      }
      else {
        int v64 = 45;
      }
      long long v65 = object_getClassName(self);
      long long v66 = sel_getName(a2);
      *(_DWORD *)id buf = 67109890;
      int v113 = v64;
      __int16 v114 = 2082;
      int v115 = v65;
      __int16 v116 = 2082;
      id v117 = v66;
      __int16 v118 = 1024;
      int v119 = 2604;
      _os_log_impl((void *)&_mh_execute_header, v62, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i No supported tag found", buf, 0x22u);
    }

    goto LABEL_93;
  }
  if (!v17)
  {
    currentTag = self->_currentTag;
    self->_currentTag = 0;

LABEL_93:
    unint64_t v55 = 0x7FFFFFFFFFFFFFFFLL;
    goto LABEL_94;
  }
  ++self->_totalTagRead;
  self->_int64_t uiStateOnInvalidation = 1;
  objc_storeStrong((id *)&self->_currentTag, v17);
  unint64_t v55 = (unint64_t)[v97 indexOfObject:v17];
LABEL_94:
  long long v68 = v95;
  *a8 = v55;
  BOOL v69 = 1;
LABEL_110:

  return v69;
}

- (id)_processISO15693TagForCoreNFC:(id)a3 outError:(id *)a4
{
  id v7 = a3;
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    id v9 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    uint64_t v13 = 45;
    if (isMetaClass) {
      uint64_t v13 = 43;
    }
    v9(6, "%c[%{public}s %{public}s]:%i ", v13, ClassName, Name, 2622);
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  id v14 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    id v15 = object_getClass(self);
    if (class_isMetaClass(v15)) {
      int v16 = 43;
    }
    else {
      int v16 = 45;
    }
    *(_DWORD *)id buf = 67109890;
    int v92 = v16;
    __int16 v93 = 2082;
    BOOL v94 = object_getClassName(self);
    __int16 v95 = 2082;
    uint64_t v96 = sel_getName(a2);
    __int16 v97 = 1024;
    int v98 = 2622;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i ", buf, 0x22u);
  }

  driverWrapper = self->_driverWrapper;
  if (!driverWrapper || (unsigned int v18 = sub_10018FAE8(driverWrapper, v7, 0)) == 0)
  {
    tagWhiteList = self->_tagWhiteList;
    if ((self->_sessionConfig & 0x20) == 0)
    {
      if ([(NFServiceWhitelistChecker *)tagWhiteList nfcTagReaderAccess])
      {
        int v82 = a4;
        id v29 = objc_alloc((Class)NFTagInternal);
        v85[0] = @"type";
        id v30 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [v7 type]);
        v86[0] = v30;
        v85[1] = @"technology";
        int v31 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [v7 technology]);
        v86[1] = v31;
        v85[2] = @"identifier";
        uint64_t v32 = [v7 tagID];
        v86[2] = v32;
        v85[3] = @"UID";
        unsigned int v33 = [v7 UID];
        v86[3] = v33;
        BOOL v34 = v86;
        BOOL v35 = v85;
        goto LABEL_40;
      }
LABEL_41:
      unsigned int v62 = sub_1001900C4(self->_driverWrapper, v7, 0);
      if (!v62) {
        goto LABEL_57;
      }
      unsigned int v63 = v62;
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      uint64_t v64 = NFLogGetLogger();
      if (v64)
      {
        long long v65 = (void (*)(uint64_t, const char *, ...))v64;
        long long v66 = object_getClass(self);
        BOOL v67 = class_isMetaClass(v66);
        long long v68 = object_getClassName(self);
        id v81 = sel_getName(a2);
        uint64_t v69 = 45;
        if (v67) {
          uint64_t v69 = 43;
        }
        v65(3, "%c[%{public}s %{public}s]:%i Failed to disconnect tag", v69, v68, v81, 2658);
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      uint64_t v70 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR))
      {
        long long v71 = object_getClass(self);
        if (class_isMetaClass(v71)) {
          int v72 = 43;
        }
        else {
          int v72 = 45;
        }
        BOOL v73 = object_getClassName(self);
        long long v74 = sel_getName(a2);
        *(_DWORD *)id buf = 67109890;
        int v92 = v72;
        __int16 v93 = 2082;
        BOOL v94 = v73;
        __int16 v95 = 2082;
        uint64_t v96 = v74;
        __int16 v97 = 1024;
        int v98 = 2658;
        _os_log_impl((void *)&_mh_execute_header, v70, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to disconnect tag", buf, 0x22u);
      }

      if (!a4) {
        goto LABEL_57;
      }
      id v20 = objc_alloc((Class)NSError);
      unsigned int v21 = +[NSString stringWithUTF8String:"nfcd"];
      uint64_t v22 = v63;
      v83[0] = NSLocalizedDescriptionKey;
      if (v63 >= 0x47) {
        int v75 = 71;
      }
      else {
        int v75 = v63;
      }
      id v23 = +[NSString stringWithUTF8String:off_100306978[v75]];
      v84[0] = v23;
      v84[1] = &off_10031D950;
      v83[1] = @"Line";
      v83[2] = @"Method";
      id v24 = [objc_alloc((Class)NSString) initWithFormat:@"%s", sel_getName(a2)];
      v84[2] = v24;
      v83[3] = NSDebugDescriptionErrorKey;
      id v25 = [objc_alloc((Class)NSString) initWithFormat:@"%s:%d", sel_getName(a2), 2659];
      v84[3] = v25;
      BOOL v26 = v84;
      int v27 = v83;
      goto LABEL_56;
    }
    if ([(NFServiceWhitelistChecker *)tagWhiteList nfcISO15693ReaderAccess])
    {
      id v36 = self->_tagWhiteList;
      uint64_t v37 = [v7 tagID];
      LODWORD(v36) = [(NFServiceWhitelistChecker *)v36 validateISO15693TagAcesssWithUID:v37];

      if (!v36)
      {
        int v82 = a4;
        id v29 = objc_alloc((Class)NFTagInternal);
        v87[0] = @"type";
        id v30 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [v7 type]);
        v88[0] = v30;
        v87[1] = @"technology";
        int v31 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [v7 technology]);
        v88[1] = v31;
        v87[2] = @"identifier";
        uint64_t v32 = [v7 tagID];
        v88[2] = v32;
        v87[3] = @"UID";
        unsigned int v33 = [v7 UID];
        v88[3] = v33;
        BOOL v34 = v88;
        BOOL v35 = v87;
LABEL_40:
        uint64_t v60 = +[NSDictionary dictionaryWithObjects:v34 forKeys:v35 count:4];
        id v61 = [v29 initWithDictionary:v60];

        a4 = v82;
        if (v61) {
          goto LABEL_58;
        }
        goto LABEL_41;
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      uint64_t v38 = NFLogGetLogger();
      if (v38)
      {
        id v39 = (void (*)(uint64_t, const char *, ...))v38;
        int v40 = object_getClass(self);
        BOOL v41 = class_isMetaClass(v40);
        long long v42 = object_getClassName(self);
        BOOL v79 = sel_getName(a2);
        uint64_t v43 = 45;
        if (v41) {
          uint64_t v43 = 43;
        }
        v39(3, "%c[%{public}s %{public}s]:%i Tag and entitlement value do not match", v43, v42, v79, 2642);
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      id v44 = NFSharedLogGetLogger();
      if (!os_log_type_enabled(v44, OS_LOG_TYPE_ERROR)) {
        goto LABEL_38;
      }
      int v45 = object_getClass(self);
      if (class_isMetaClass(v45)) {
        int v46 = 43;
      }
      else {
        int v46 = 45;
      }
      id v47 = object_getClassName(self);
      id v48 = sel_getName(a2);
      *(_DWORD *)id buf = 67109890;
      int v92 = v46;
      __int16 v93 = 2082;
      BOOL v94 = v47;
      __int16 v95 = 2082;
      uint64_t v96 = v48;
      __int16 v97 = 1024;
      int v98 = 2642;
      id v49 = "%c[%{public}s %{public}s]:%i Tag and entitlement value do not match";
    }
    else
    {
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      uint64_t v50 = NFLogGetLogger();
      if (v50)
      {
        int v51 = (void (*)(uint64_t, const char *, ...))v50;
        __int16 v52 = object_getClass(self);
        BOOL v53 = class_isMetaClass(v52);
        id v54 = object_getClassName(self);
        NSErrorUserInfoKey v80 = sel_getName(a2);
        uint64_t v55 = 45;
        if (v53) {
          uint64_t v55 = 43;
        }
        v51(3, "%c[%{public}s %{public}s]:%i Missing required entitlement for NFCISO15693ReaderSession", v55, v54, v80, 2645);
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      id v44 = NFSharedLogGetLogger();
      if (!os_log_type_enabled(v44, OS_LOG_TYPE_ERROR)) {
        goto LABEL_38;
      }
      uint64_t v56 = object_getClass(self);
      if (class_isMetaClass(v56)) {
        int v57 = 43;
      }
      else {
        int v57 = 45;
      }
      id v58 = object_getClassName(self);
      BOOL v59 = sel_getName(a2);
      *(_DWORD *)id buf = 67109890;
      int v92 = v57;
      __int16 v93 = 2082;
      BOOL v94 = v58;
      __int16 v95 = 2082;
      uint64_t v96 = v59;
      __int16 v97 = 1024;
      int v98 = 2645;
      id v49 = "%c[%{public}s %{public}s]:%i Missing required entitlement for NFCISO15693ReaderSession";
    }
    _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_ERROR, v49, buf, 0x22u);
LABEL_38:

    goto LABEL_41;
  }
  if (a4)
  {
    unsigned int v19 = v18;
    id v20 = objc_alloc((Class)NSError);
    unsigned int v21 = +[NSString stringWithUTF8String:"nfcd"];
    uint64_t v22 = v19;
    v89[0] = NSLocalizedDescriptionKey;
    id v23 = +[NSString stringWithUTF8String:off_100306978[v19]];
    v90[0] = v23;
    v90[1] = &off_10031D938;
    v89[1] = @"Line";
    v89[2] = @"Method";
    id v24 = [objc_alloc((Class)NSString) initWithFormat:@"%s", sel_getName(a2)];
    v90[2] = v24;
    v89[3] = NSDebugDescriptionErrorKey;
    id v25 = [objc_alloc((Class)NSString) initWithFormat:@"%s:%d", sel_getName(a2), 2626];
    v90[3] = v25;
    BOOL v26 = v90;
    int v27 = v89;
LABEL_56:
    NSErrorUserInfoKey v76 = +[NSDictionary dictionaryWithObjects:v26 forKeys:v27 count:4];
    *a4 = [v20 initWithDomain:v21 code:v22 userInfo:v76];
  }
LABEL_57:
  id v61 = 0;
LABEL_58:

  return v61;
}

- (id)_processIso14Tag:(id)a3 connected:(BOOL *)a4 appFound:(id *)a5 updatedTag:(id *)a6
{
  id v10 = a3;
  *a4 = 0;
  id v11 = self->_iso7816AppList;
  char v12 = 0;
  if ((self->_sessionConfig & 0x100) == 0)
  {
LABEL_39:
    unsigned int v65 = sub_10018FAE8(self->_driverWrapper, v10, a6);
    if (v65 - 35 <= 0x1D && ((1 << (v65 - 35)) & 0x20010001) != 0)
    {
      unsigned int v67 = v65;
      id v68 = objc_alloc((Class)NSError);
      id v49 = +[NSString stringWithUTF8String:"nfcd"];
      uint64_t v69 = v67;
      v97[0] = NSLocalizedDescriptionKey;
      uint64_t v70 = +[NSString stringWithUTF8String:off_100306978[v67]];
      v98[0] = v70;
      v98[1] = &off_10031D968;
      v97[1] = @"Line";
      v97[2] = @"Method";
      id v71 = [objc_alloc((Class)NSString) initWithFormat:@"%s", sel_getName(a2)];
      v98[2] = v71;
      v97[3] = NSDebugDescriptionErrorKey;
      id v72 = [objc_alloc((Class)NSString) initWithFormat:@"%s:%d", sel_getName(a2), 2706];
      v98[3] = v72;
      BOOL v73 = +[NSDictionary dictionaryWithObjects:v98 forKeys:v97 count:4];
      id v34 = [v68 initWithDomain:v49 code:v69 userInfo:v73];

      goto LABEL_44;
    }
    *a4 = 1;
    if ((v12 & 1) != 0 || (self->_sessionConfig & 0x400) == 0)
    {
      id v94 = 0;
      [(_NFReaderSession *)self _findAppFromSet:v11 tag:v10 foundApp:a5 outError:&v94];
      id v75 = v94;
LABEL_54:
      id v34 = v75;
      goto LABEL_45;
    }
    if ([v10 type] == 3 || objc_msgSend(v10, "type") == 6)
    {
      id v75 = [(_NFReaderSession *)self detectPaceAppOnTag:v10 appFound:a5];
      goto LABEL_54;
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      id v77 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      uint64_t v81 = 45;
      if (isMetaClass) {
        uint64_t v81 = 43;
      }
      v77(6, "%c[%{public}s %{public}s]:%i Only ISODEP tag supports PACE", v81, ClassName, Name, 2716);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    int v82 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v82, OS_LOG_TYPE_DEFAULT))
    {
      int v83 = object_getClass(self);
      if (class_isMetaClass(v83)) {
        int v84 = 43;
      }
      else {
        int v84 = 45;
      }
      id v85 = object_getClassName(self);
      id v86 = sel_getName(a2);
      *(_DWORD *)id buf = 67109890;
      int v104 = v84;
      __int16 v105 = 2082;
      long long v106 = v85;
      __int16 v107 = 2082;
      BOOL v108 = v86;
      __int16 v109 = 1024;
      int v110 = 2716;
      _os_log_impl((void *)&_mh_execute_header, v82, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Only ISODEP tag supports PACE", buf, 0x22u);
    }

    id v87 = objc_alloc((Class)NSError);
    id v49 = +[NSString stringWithUTF8String:"nfcd"];
    NSErrorUserInfoKey v95 = NSLocalizedDescriptionKey;
    uint64_t v50 = +[NSString stringWithUTF8String:"Tag Not Found"];
    uint64_t v96 = v50;
    int v51 = +[NSDictionary dictionaryWithObjects:&v96 forKeys:&v95 count:1];
    __int16 v52 = v87;
    BOOL v53 = v49;
    uint64_t v54 = 28;
LABEL_27:
    id v34 = [v52 initWithDomain:v53 code:v54 userInfo:v51];

LABEL_44:
    goto LABEL_45;
  }
  if ([v10 type] != 5) {
    goto LABEL_15;
  }
  *(_DWORD *)id buf = 0;
  uint64_t v13 = [v10 tagB];
  id v14 = [v13 pupi];
  int v92 = v11;
  id v15 = [objc_alloc((Class)NSData) initWithBytes:buf length:4];
  unsigned int v16 = [v14 isEqualToData:v15];

  id v11 = v92;
  if (!v16)
  {
LABEL_15:
    if ((self->_pollingConfig & 0x1000) != 0)
    {
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      uint64_t v36 = NFLogGetLogger();
      if (v36)
      {
        uint64_t v37 = (void (*)(uint64_t, const char *, ...))v36;
        uint64_t v38 = object_getClass(self);
        BOOL v39 = class_isMetaClass(v38);
        int v40 = object_getClassName(self);
        id v89 = sel_getName(a2);
        uint64_t v41 = 45;
        if (v39) {
          uint64_t v41 = 43;
        }
        v37(4, "%c[%{public}s %{public}s]:%i Expected a different tag type.  Removing RF frame from polling config.", v41, v40, v89, 2690);
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      long long v42 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
      {
        uint64_t v43 = object_getClass(self);
        if (class_isMetaClass(v43)) {
          int v44 = 43;
        }
        else {
          int v44 = 45;
        }
        int v45 = object_getClassName(self);
        int v46 = sel_getName(a2);
        *(_DWORD *)id buf = 67109890;
        int v104 = v44;
        __int16 v105 = 2082;
        long long v106 = v45;
        __int16 v107 = 2082;
        BOOL v108 = v46;
        __int16 v109 = 1024;
        int v110 = 2690;
        _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Expected a different tag type.  Removing RF frame from polling config.", buf, 0x22u);
      }

      self->_pollingConfig &= ~0x1000u;
      driverWrapper = self->_driverWrapper;
      [(_NFReaderSession *)self _getTagNotificationConfig];
      sub_1001E0544(driverWrapper);
      id v48 = objc_alloc((Class)NSError);
      id v49 = +[NSString stringWithUTF8String:"nfcd"];
      NSErrorUserInfoKey v99 = NSLocalizedDescriptionKey;
      uint64_t v50 = +[NSString stringWithUTF8String:"RF Deactivated"];
      int v100 = v50;
      int v51 = +[NSDictionary dictionaryWithObjects:&v100 forKeys:&v99 count:1];
      __int16 v52 = v48;
      BOOL v53 = v49;
      uint64_t v54 = 51;
      goto LABEL_27;
    }
    char v12 = 0;
    BOOL v35 = &stru_100306DB0;
    goto LABEL_38;
  }
  int pollingConfig = self->_pollingConfig;
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t v18 = NFLogGetLogger();
  unsigned int v19 = (void (*)(uint64_t, const char *, ...))v18;
  if ((pollingConfig & 0x1000) != 0)
  {
    if (v18)
    {
      uint64_t v55 = object_getClass(self);
      BOOL v56 = class_isMetaClass(v55);
      int v57 = object_getClassName(self);
      uint64_t v90 = sel_getName(a2);
      uint64_t v58 = 45;
      if (v56) {
        uint64_t v58 = 43;
      }
      v19(5, "%c[%{public}s %{public}s]:%i Found zeros PUPI tag", v58, v57, v90, 2682);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    BOOL v59 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v60 = object_getClass(self);
      if (class_isMetaClass(v60)) {
        int v61 = 43;
      }
      else {
        int v61 = 45;
      }
      unsigned int v62 = object_getClassName(self);
      unsigned int v63 = sel_getName(a2);
      *(_DWORD *)id buf = 67109890;
      int v104 = v61;
      __int16 v105 = 2082;
      long long v106 = v62;
      __int16 v107 = 2082;
      BOOL v108 = v63;
      __int16 v109 = 1024;
      int v110 = 2682;
      _os_log_impl((void *)&_mh_execute_header, v59, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Found zeros PUPI tag", buf, 0x22u);
    }

    char v12 = 1;
    BOOL v35 = &stru_100306D90;
    id v11 = v92;
LABEL_38:
    uint64_t v64 = +[NSPredicate predicateWithBlock:v35];
    [(NSMutableOrderedSet *)v11 filterUsingPredicate:v64];

    goto LABEL_39;
  }
  if (v18)
  {
    id v20 = object_getClass(self);
    BOOL v21 = class_isMetaClass(v20);
    uint64_t v22 = object_getClassName(self);
    BOOL v88 = sel_getName(a2);
    uint64_t v23 = 45;
    if (v21) {
      uint64_t v23 = 43;
    }
    v19(5, "%c[%{public}s %{public}s]:%i Switching to RF frame", v23, v22, v88, 2676);
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  id v24 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    id v25 = object_getClass(self);
    if (class_isMetaClass(v25)) {
      int v26 = 43;
    }
    else {
      int v26 = 45;
    }
    int v27 = object_getClassName(self);
    int v28 = sel_getName(a2);
    *(_DWORD *)id buf = 67109890;
    int v104 = v26;
    __int16 v105 = 2082;
    long long v106 = v27;
    __int16 v107 = 2082;
    BOOL v108 = v28;
    __int16 v109 = 1024;
    int v110 = 2676;
    _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Switching to RF frame", buf, 0x22u);
  }

  self->_pollingConfig |= 0x1000u;
  id v29 = self->_driverWrapper;
  [(_NFReaderSession *)self _getTagNotificationConfig];
  sub_1001E0544(v29);
  id v30 = objc_alloc((Class)NSError);
  int v31 = +[NSString stringWithUTF8String:"nfcd"];
  NSErrorUserInfoKey v101 = NSLocalizedDescriptionKey;
  uint64_t v32 = +[NSString stringWithUTF8String:"RF Deactivated"];
  id v102 = v32;
  unsigned int v33 = +[NSDictionary dictionaryWithObjects:&v102 forKeys:&v101 count:1];
  id v34 = [v30 initWithDomain:v31 code:51 userInfo:v33];

  id v11 = v92;
LABEL_45:

  return v34;
}

- (id)_processMifareTag:(id)a3 connected:(BOOL *)a4 isMifare:(BOOL *)a5
{
  id v9 = a3;
  if (*a4)
  {
    unsigned int v10 = sub_1001900C4(self->_driverWrapper, v9, 0);
    *a4 = 0;
    if (v10)
    {
      unsigned int v11 = v10;
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      uint64_t Logger = NFLogGetLogger();
      if (Logger)
      {
        uint64_t v13 = (void (*)(uint64_t, const char *, ...))Logger;
        Class = object_getClass(self);
        BOOL isMetaClass = class_isMetaClass(Class);
        ClassName = object_getClassName(self);
        Name = sel_getName(a2);
        uint64_t v17 = 45;
        if (isMetaClass) {
          uint64_t v17 = 43;
        }
        v13(3, "%c[%{public}s %{public}s]:%i Failed to disconnect tag", v17, ClassName, Name, 2737);
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      uint64_t v18 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        unsigned int v19 = object_getClass(self);
        if (class_isMetaClass(v19)) {
          int v20 = 43;
        }
        else {
          int v20 = 45;
        }
        *(_DWORD *)id buf = 67109890;
        int v66 = v20;
        __int16 v67 = 2082;
        id v68 = object_getClassName(self);
        __int16 v69 = 2082;
        uint64_t v70 = sel_getName(a2);
        __int16 v71 = 1024;
        int v72 = 2737;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to disconnect tag", buf, 0x22u);
      }

      id v21 = objc_alloc((Class)NSError);
      id v22 = +[NSString stringWithUTF8String:"nfcd"];
      uint64_t v23 = v11;
      v77[0] = NSLocalizedDescriptionKey;
      if (v11 >= 0x47) {
        int v24 = 71;
      }
      else {
        int v24 = v11;
      }
      id v25 = +[NSString stringWithUTF8String:off_100306978[v24]];
      v78[0] = v25;
      v78[1] = &off_10031D980;
      v77[1] = @"Line";
      v77[2] = @"Method";
      id v26 = [objc_alloc((Class)NSString) initWithFormat:@"%s", sel_getName(a2)];
      v78[2] = v26;
      v77[3] = NSDebugDescriptionErrorKey;
      id v27 = [objc_alloc((Class)NSString) initWithFormat:@"%s:%d", sel_getName(a2), 2738];
      v78[3] = v27;
      int v28 = +[NSDictionary dictionaryWithObjects:v78 forKeys:v77 count:4];
      id v29 = [v21 initWithDomain:v22 code:v23 userInfo:v28];

LABEL_34:
      goto LABEL_35;
    }
  }
  driverWrapper = self->_driverWrapper;
  if (driverWrapper)
  {
    int v31 = sub_10018FAE8(driverWrapper, v9, 0);
    if (v31)
    {
      LODWORD(v32) = v31;
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      uint64_t v33 = NFLogGetLogger();
      if (v33)
      {
        id v34 = (void (*)(uint64_t, const char *, ...))v33;
        BOOL v35 = object_getClass(self);
        BOOL v36 = class_isMetaClass(v35);
        uint64_t v37 = object_getClassName(self);
        unsigned int v62 = sel_getName(a2);
        uint64_t v38 = 45;
        if (v36) {
          uint64_t v38 = 43;
        }
        v34(3, "%c[%{public}s %{public}s]:%i Failed to reconnect tag after check", v38, v37, v62, 2745);
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      BOOL v39 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
      {
        int v40 = object_getClass(self);
        if (class_isMetaClass(v40)) {
          int v41 = 43;
        }
        else {
          int v41 = 45;
        }
        *(_DWORD *)id buf = 67109890;
        int v66 = v41;
        __int16 v67 = 2082;
        id v68 = object_getClassName(self);
        __int16 v69 = 2082;
        uint64_t v70 = sel_getName(a2);
        __int16 v71 = 1024;
        int v72 = 2745;
        _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to reconnect tag after check", buf, 0x22u);
      }

      *a4 = 0;
      id v42 = objc_alloc((Class)NSError);
      id v22 = +[NSString stringWithUTF8String:"nfcd"];
      if (v32 == 35 || v32 == 64) {
        uint64_t v32 = v32;
      }
      else {
        uint64_t v32 = 51;
      }
      v75[0] = NSLocalizedDescriptionKey;
      id v25 = +[NSString stringWithUTF8String:off_100306978[v32]];
      v76[0] = v25;
      v76[1] = &off_10031D998;
      v75[1] = @"Line";
      v75[2] = @"Method";
      id v44 = [objc_alloc((Class)NSString) initWithFormat:@"%s", sel_getName(a2)];
      v76[2] = v44;
      v75[3] = NSDebugDescriptionErrorKey;
      id v45 = [objc_alloc((Class)NSString) initWithFormat:@"%s:%d", sel_getName(a2), 2750];
      v76[3] = v45;
      int v46 = +[NSDictionary dictionaryWithObjects:v76 forKeys:v75 count:4];
      id v29 = [v42 initWithDomain:v22 code:v32 userInfo:v46];

      goto LABEL_34;
    }
  }
  *a4 = 1;
  id v64 = 0;
  uint64_t v48 = [(_NFReaderSession *)self _queryMifareType:v9 outError:&v64];
  id v49 = v64;
  id v22 = v49;
  if (v49 && [v49 code])
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v50 = NFLogGetLogger();
    if (v50)
    {
      int v51 = (void (*)(uint64_t, const char *, ...))v50;
      __int16 v52 = object_getClass(self);
      BOOL v53 = class_isMetaClass(v52);
      uint64_t v60 = object_getClassName(self);
      unsigned int v63 = sel_getName(a2);
      uint64_t v54 = 45;
      if (v53) {
        uint64_t v54 = 43;
      }
      v51(4, "%c[%{public}s %{public}s]:%i Failed to query for MiFare tag.  Will assume it isnt one - error=%{public}@", v54, v60, v63, 2758, v22);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v55 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
    {
      BOOL v56 = object_getClass(self);
      if (class_isMetaClass(v56)) {
        int v57 = 43;
      }
      else {
        int v57 = 45;
      }
      uint64_t v58 = object_getClassName(self);
      BOOL v59 = sel_getName(a2);
      *(_DWORD *)id buf = 67110146;
      int v66 = v57;
      __int16 v67 = 2082;
      id v68 = v58;
      __int16 v69 = 2082;
      uint64_t v70 = v59;
      __int16 v71 = 1024;
      int v72 = 2758;
      __int16 v73 = 2114;
      id v74 = v22;
      _os_log_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to query for MiFare tag.  Will assume it isnt one - error=%{public}@", buf, 0x2Cu);
    }

    if ([v22 code] != (id)51)
    {
      sub_1001900C4(self->_driverWrapper, v9, 0);
      *a4 = 0;
    }
    id v22 = v22;
    id v29 = v22;
  }
  else if (v48 && ([v9 _setType:v48], v48 == 13))
  {
    id v29 = 0;
  }
  else
  {
    id v29 = 0;
    *a5 = 1;
  }
LABEL_35:

  return v29;
}

- (id)_processISO14443TagForCoreNFC:(id)a3 tagIsConnected:(BOOL *)a4 outError:(id *)a5
{
  id v9 = a3;
  char v74 = 0;
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    unsigned int v11 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    uint64_t v15 = 45;
    if (isMetaClass) {
      uint64_t v15 = 43;
    }
    v11(6, "%c[%{public}s %{public}s]:%i ", v15, ClassName, Name, 2783);
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  unsigned int v16 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v17 = object_getClass(self);
    if (class_isMetaClass(v17)) {
      int v18 = 43;
    }
    else {
      int v18 = 45;
    }
    *(_DWORD *)id buf = 67109890;
    int v80 = v18;
    __int16 v81 = 2082;
    int v82 = object_getClassName(self);
    __int16 v83 = 2082;
    int v84 = sel_getName(a2);
    __int16 v85 = 1024;
    int v86 = 2783;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i ", buf, 0x22u);
  }

  *a4 = 0;
  unint64_t sessionConfig = self->_sessionConfig;
  if ([v9 type] == 9)
  {
    id v20 = 0;
LABEL_19:
    if ((sessionConfig & 0x400) == 0)
    {
      if ([v9 type] == 3 || objc_msgSend(v9, "type") == 9)
      {
        id v26 = [(_NFReaderSession *)self _processMifareTag:v9 connected:a4 isMifare:&v74];
        if (v26)
        {
          id v27 = v26;
          id v24 = 0;
          if (a5) {
            *a5 = v26;
          }
          id v20 = v27;
          goto LABEL_53;
        }
      }
LABEL_32:
      sel = a2;
      if (v74)
      {
        id v67 = v20;
        id v35 = objc_alloc((Class)NFTagInternal);
        v77[0] = @"type";
        BOOL v36 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [v9 type]);
        v78[0] = v36;
        v77[1] = @"technology";
        uint64_t v37 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [v9 technology]);
        v78[1] = v37;
        v77[2] = @"identifier";
        [v9 tagID];
        uint64_t v38 = v70 = a5;
        v78[2] = v38;
        v77[3] = @"UID";
        BOOL v39 = [v9 UID];
        v78[3] = v39;
        void v77[4] = @"historicalBytes";
        [v9 historicalBytes];
        v41 = int v40 = a4;
        void v78[4] = v41;
        id v42 = +[NSDictionary dictionaryWithObjects:v78 forKeys:v77 count:5];
        id v24 = [v35 initWithDictionary:v42];

        a4 = v40;
        a5 = v70;

        goto LABEL_35;
      }
LABEL_34:
      id v67 = v20;
      id v24 = 0;
      if (!*a4)
      {
LABEL_51:
        id v20 = v67;
        goto LABEL_53;
      }
LABEL_35:
      unsigned int v43 = sub_1001900C4(self->_driverWrapper, v9, 0);
      if (v43)
      {
        unsigned int v44 = v43;
        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        uint64_t v45 = NFLogGetLogger();
        if (v45)
        {
          int v46 = (void (*)(uint64_t, const char *, ...))v45;
          id v47 = object_getClass(self);
          BOOL v48 = class_isMetaClass(v47);
          id v49 = object_getClassName(self);
          unsigned int v65 = sel_getName(sel);
          uint64_t v50 = 45;
          if (v48) {
            uint64_t v50 = 43;
          }
          v46(3, "%c[%{public}s %{public}s]:%i Failed to disconnect tag", v50, v49, v65, 2834);
        }
        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        int v51 = NFSharedLogGetLogger();
        if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
        {
          __int16 v52 = object_getClass(self);
          if (class_isMetaClass(v52)) {
            int v53 = 43;
          }
          else {
            int v53 = 45;
          }
          uint64_t v54 = object_getClassName(self);
          uint64_t v55 = sel_getName(sel);
          *(_DWORD *)id buf = 67109890;
          int v80 = v53;
          __int16 v81 = 2082;
          int v82 = v54;
          __int16 v83 = 2082;
          int v84 = v55;
          __int16 v85 = 1024;
          int v86 = 2834;
          _os_log_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to disconnect tag", buf, 0x22u);
        }

        if (a5)
        {
          id v66 = objc_alloc((Class)NSError);
          BOOL v56 = +[NSString stringWithUTF8String:"nfcd"];
          __int16 v71 = a5;
          uint64_t v57 = v44;
          v75[0] = NSLocalizedDescriptionKey;
          if (v44 >= 0x47) {
            int v58 = 71;
          }
          else {
            int v58 = v44;
          }
          BOOL v59 = +[NSString stringWithUTF8String:off_100306978[v58]];
          v76[0] = v59;
          v76[1] = &off_10031D9B0;
          v75[1] = @"Line";
          v75[2] = @"Method";
          id v60 = [objc_alloc((Class)NSString) initWithFormat:@"%s", sel_getName(sel)];
          v76[2] = v60;
          v75[3] = NSDebugDescriptionErrorKey;
          id v61 = [objc_alloc((Class)NSString) initWithFormat:@"%s:%d", sel_getName(sel), 2835];
          v76[3] = v61;
          unsigned int v62 = +[NSDictionary dictionaryWithObjects:v76 forKeys:v75 count:4];
          *__int16 v71 = [v66 initWithDomain:v56 code:v57 userInfo:v62];
        }
      }
      *a4 = 0;
      goto LABEL_51;
    }
    goto LABEL_25;
  }
  id v72 = 0;
  id v73 = 0;
  id v21 = [(_NFReaderSession *)self _processIso14Tag:v9 connected:a4 appFound:&v73 updatedTag:&v72];
  id v20 = v73;
  id v22 = v72;
  uint64_t v23 = v22;
  if (v21)
  {
    if (a5) {
      *a5 = v21;
    }

    id v24 = 0;
    goto LABEL_53;
  }
  if (v22)
  {
    id v25 = v22;

    id v9 = v25;
  }

  if (!v20) {
    goto LABEL_19;
  }
LABEL_25:
  if (!v20) {
    goto LABEL_32;
  }
  sel = a2;
  __int16 v69 = a5;
  id v28 = objc_alloc((Class)NSMutableDictionary);
  id v29 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [v9 type]);
  id v30 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [v9 technology]);
  int v31 = [v9 tagID];
  uint64_t v32 = [v9 UID];
  id v33 = [v28 initWithObjectsAndKeys:v29, @"type", v30, @"technology", v31, @"identifier", v32, @"UID", 0];

  [v33 setObject:v20 forKey:@"selectedAID"];
  if ([v9 type] == 3
    || [v9 type] == 2
    || [v9 type] == 1)
  {
    id v34 = [v9 historicalBytes];
    [v33 setObject:v34 forKey:@"historicalBytes"];
  }
  id v24 = [objc_alloc((Class)NFTagInternal) initWithDictionary:v33];

  a5 = v69;
  if (!v24) {
    goto LABEL_34;
  }
LABEL_53:

  return v24;
}

- (id)_processFelicaTagForCoreNFC:(id)a3 outError:(id *)a4
{
  id v106 = a3;
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    id v8 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    uint64_t v12 = 45;
    if (isMetaClass) {
      uint64_t v12 = 43;
    }
    v8(6, "%c[%{public}s %{public}s]:%i ", v12, ClassName, Name, 2844);
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t v13 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    id v14 = object_getClass(self);
    if (class_isMetaClass(v14)) {
      int v15 = 43;
    }
    else {
      int v15 = 45;
    }
    *(_DWORD *)id buf = 67109890;
    int v124 = v15;
    __int16 v125 = 2082;
    v126 = object_getClassName(self);
    __int16 v127 = 2082;
    id v128 = sel_getName(a2);
    __int16 v129 = 1024;
    int v130 = 2844;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i ", buf, 0x22u);
  }

  driverWrapper = self->_driverWrapper;
  if (driverWrapper)
  {
    unsigned int v17 = sub_10018FAE8(driverWrapper, v106, 0);
    if (v17)
    {
      unsigned int v18 = v17;
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      uint64_t v19 = NFLogGetLogger();
      if (v19)
      {
        id v20 = (void (*)(uint64_t, const char *, ...))v19;
        id v21 = object_getClass(self);
        BOOL v22 = class_isMetaClass(v21);
        uint64_t v23 = object_getClassName(self);
        NSErrorUserInfoKey v99 = sel_getName(a2);
        uint64_t v24 = 45;
        if (v22) {
          uint64_t v24 = 43;
        }
        v20(3, "%c[%{public}s %{public}s]:%i Failed to connect tag", v24, v23, v99, 2848);
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      id v25 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        id v26 = object_getClass(self);
        if (class_isMetaClass(v26)) {
          int v27 = 43;
        }
        else {
          int v27 = 45;
        }
        id v28 = object_getClassName(self);
        id v29 = sel_getName(a2);
        *(_DWORD *)id buf = 67109890;
        int v124 = v27;
        __int16 v125 = 2082;
        v126 = v28;
        __int16 v127 = 2082;
        id v128 = v29;
        __int16 v129 = 1024;
        int v130 = 2848;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to connect tag", buf, 0x22u);
      }

      if (!a4)
      {
        id v52 = 0;
        goto LABEL_88;
      }
      id v30 = objc_alloc((Class)NSError);
      int v31 = +[NSString stringWithUTF8String:"nfcd"];
      uint64_t v32 = v18;
      v121[0] = NSLocalizedDescriptionKey;
      id v33 = +[NSString stringWithUTF8String:off_100306978[v18]];
      v122[0] = v33;
      v122[1] = &off_10031D9C8;
      v121[1] = @"Line";
      v121[2] = @"Method";
      id v34 = [objc_alloc((Class)NSString) initWithFormat:@"%s", sel_getName(a2)];
      v122[2] = v34;
      v121[3] = NSDebugDescriptionErrorKey;
      id v35 = [objc_alloc((Class)NSString) initWithFormat:@"%s:%d", sel_getName(a2), 2849];
      v122[3] = v35;
      id v36 = +[NSDictionary dictionaryWithObjects:v122 forKeys:v121 count:4];
      *a4 = [v30 initWithDomain:v31 code:v32 userInfo:v36];
      goto LABEL_85;
    }
  }
  id v113 = 0;
  [(_NFReaderSession *)self _updateFelicaTagInfo:v106 outError:&v113];
  id v37 = v113;
  int v31 = v37;
  if (!v37 || [v37 code] != (id)51 && objc_msgSend(v31, "code") != (id)64)
  {
    sel = a2;
    long long v111 = 0u;
    long long v112 = 0u;
    long long v109 = 0u;
    long long v110 = 0u;
    id obj = self->_feliCaSystemCodeList;
    id v53 = [(NSMutableArray *)obj countByEnumeratingWithState:&v109 objects:v118 count:16];
    int v104 = a4;
    if (v53)
    {
      id v54 = v53;
      uint64_t v55 = *(void *)v110;
LABEL_41:
      BOOL v56 = 0;
      uint64_t v57 = v31;
      while (1)
      {
        if (*(void *)v110 != v55) {
          objc_enumerationMutation(obj);
        }
        uint64_t v58 = *(void *)(*((void *)&v109 + 1) + 8 * (void)v56);
        id v107 = 0;
        id v108 = 0;
        int v31 = [(_NFReaderSession *)self _getIDMFromTag:v106 systemCode:v58 outIdm:&v108 outPmm:&v107];
        id v59 = v108;
        id v60 = v107;

        BOOL v61 = v31 || v60 == 0;
        if (!v61 && v59 != 0) {
          break;
        }
        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        uint64_t v63 = NFLogGetLogger();
        if (v63)
        {
          id v64 = (void (*)(uint64_t, const char *, ...))v63;
          unsigned int v65 = object_getClass(self);
          BOOL v66 = class_isMetaClass(v65);
          id v67 = object_getClassName(self);
          NSErrorUserInfoKey v101 = sel_getName(sel);
          uint64_t v68 = 45;
          if (v66) {
            uint64_t v68 = 43;
          }
          v64(3, "%c[%{public}s %{public}s]:%i Failed to read IDM info", v68, v67, v101, 2880);
        }
        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        __int16 v69 = NFSharedLogGetLogger();
        if (os_log_type_enabled(v69, OS_LOG_TYPE_ERROR))
        {
          uint64_t v70 = object_getClass(self);
          if (class_isMetaClass(v70)) {
            int v71 = 43;
          }
          else {
            int v71 = 45;
          }
          id v72 = object_getClassName(self);
          id v73 = sel_getName(sel);
          *(_DWORD *)id buf = 67109890;
          int v124 = v71;
          __int16 v125 = 2082;
          v126 = v72;
          __int16 v127 = 2082;
          id v128 = v73;
          __int16 v129 = 1024;
          int v130 = 2880;
          _os_log_impl((void *)&_mh_execute_header, v69, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to read IDM info", buf, 0x22u);
        }

        if (v104) {
          id *v104 = v31;
        }

        BOOL v56 = (char *)v56 + 1;
        uint64_t v57 = v31;
        if (v54 == v56)
        {
          id v54 = [(NSMutableArray *)obj countByEnumeratingWithState:&v109 objects:v118 count:16];
          if (v54) {
            goto LABEL_41;
          }
          goto LABEL_65;
        }
      }
      id v74 = objc_alloc((Class)NFTagInternal);
      v116[0] = @"type";
      id v75 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [v106 type]);
      v117[0] = v75;
      v116[1] = @"technology";
      NSErrorUserInfoKey v76 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [v106 technology]);
      v117[1] = v76;
      v117[2] = v59;
      v116[2] = @"identifier";
      v116[3] = @"PMm";
      v117[3] = v60;
      v116[4] = @"UID";
      id v77 = [v106 UID];
      v116[5] = @"SystemCode";
      v117[4] = v77;
      v117[5] = v58;
      int v78 = +[NSDictionary dictionaryWithObjects:v117 forKeys:v116 count:6];
      id v52 = [v74 initWithDictionary:v78];

      int v31 = 0;
      if (v52) {
        goto LABEL_87;
      }
    }
    else
    {
LABEL_65:
    }
    unsigned int v79 = sub_1001900C4(self->_driverWrapper, v106, 0);
    if (!v79) {
      goto LABEL_86;
    }
    unsigned int v80 = v79;
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v81 = NFLogGetLogger();
    if (v81)
    {
      int v82 = (void (*)(uint64_t, const char *, ...))v81;
      __int16 v83 = object_getClass(self);
      BOOL v84 = class_isMetaClass(v83);
      __int16 v85 = object_getClassName(self);
      id v102 = sel_getName(sel);
      uint64_t v86 = 45;
      if (v84) {
        uint64_t v86 = 43;
      }
      v82(3, "%c[%{public}s %{public}s]:%i Failed to disconnect tag", v86, v85, v102, 2888);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    id v87 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v87, OS_LOG_TYPE_ERROR))
    {
      BOOL v88 = object_getClass(self);
      if (class_isMetaClass(v88)) {
        int v89 = 43;
      }
      else {
        int v89 = 45;
      }
      uint64_t v90 = object_getClassName(self);
      uint64_t v91 = sel_getName(sel);
      *(_DWORD *)id buf = 67109890;
      int v124 = v89;
      __int16 v125 = 2082;
      v126 = v90;
      __int16 v127 = 2082;
      id v128 = v91;
      __int16 v129 = 1024;
      int v130 = 2888;
      _os_log_impl((void *)&_mh_execute_header, v87, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to disconnect tag", buf, 0x22u);
    }

    if (!v104) {
      goto LABEL_86;
    }
    id v49 = objc_alloc((Class)NSError);
    id v33 = +[NSString stringWithUTF8String:"nfcd"];
    id v50 = (id)v80;
    v114[0] = NSLocalizedDescriptionKey;
    if (v80 >= 0x47) {
      int v92 = 71;
    }
    else {
      int v92 = v80;
    }
    id v34 = +[NSString stringWithUTF8String:off_100306978[v92]];
    v115[0] = v34;
    v115[1] = &off_10031D9F8;
    v114[1] = @"Line";
    v114[2] = @"Method";
    id v35 = [objc_alloc((Class)NSString) initWithFormat:@"%s", sel_getName(sel)];
    v115[2] = v35;
    v114[3] = NSDebugDescriptionErrorKey;
    a4 = v104;
    id v36 = [objc_alloc((Class)NSString) initWithFormat:@"%s:%d", sel_getName(sel), 2889];
    v115[3] = v36;
    __int16 v93 = v115;
    id v94 = v114;
    uint64_t v95 = 4;
    goto LABEL_84;
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t v38 = NFLogGetLogger();
  if (v38)
  {
    BOOL v39 = (void (*)(uint64_t, const char *, ...))v38;
    int v40 = object_getClass(self);
    BOOL v41 = class_isMetaClass(v40);
    id v42 = object_getClassName(self);
    int v100 = sel_getName(a2);
    uint64_t v43 = 45;
    if (v41) {
      uint64_t v43 = 43;
    }
    v39(3, "%c[%{public}s %{public}s]:%i Tag deactivated or failed to retrieve info", v43, v42, v100, 2859);
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  unsigned int v44 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
  {
    uint64_t v45 = object_getClass(self);
    if (class_isMetaClass(v45)) {
      int v46 = 43;
    }
    else {
      int v46 = 45;
    }
    id v47 = object_getClassName(self);
    BOOL v48 = sel_getName(a2);
    *(_DWORD *)id buf = 67109890;
    int v124 = v46;
    __int16 v125 = 2082;
    v126 = v47;
    __int16 v127 = 2082;
    id v128 = v48;
    __int16 v129 = 1024;
    int v130 = 2859;
    _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Tag deactivated or failed to retrieve info", buf, 0x22u);
  }

  if (a4)
  {
    id v49 = objc_alloc((Class)NSError);
    id v33 = +[NSString stringWithUTF8String:"nfcd"];
    id v50 = [v31 code];
    v119[0] = NSLocalizedDescriptionKey;
    if ((uint64_t)[v31 code] > 70) {
      uint64_t v51 = 71;
    }
    else {
      uint64_t v51 = (uint64_t)[v31 code];
    }
    id v34 = +[NSString stringWithUTF8String:off_100306978[v51]];
    v120[0] = v34;
    v120[1] = v31;
    v119[1] = NSUnderlyingErrorKey;
    v119[2] = @"Line";
    v120[2] = &off_10031D9E0;
    v119[3] = @"Method";
    id v35 = [objc_alloc((Class)NSString) initWithFormat:@"%s", sel_getName(a2)];
    v120[3] = v35;
    v119[4] = NSDebugDescriptionErrorKey;
    id v36 = [objc_alloc((Class)NSString) initWithFormat:@"%s:%d", sel_getName(a2), 2860];
    v120[4] = v36;
    __int16 v93 = v120;
    id v94 = v119;
    uint64_t v95 = 5;
LABEL_84:
    uint64_t v96 = +[NSDictionary dictionaryWithObjects:v93 forKeys:v94 count:v95];
    *a4 = [v49 initWithDomain:v33 code:v50 userInfo:v96];

LABEL_85:
  }
LABEL_86:
  id v52 = 0;
LABEL_87:

LABEL_88:

  return v52;
}

- (id)_processNDEFTagForCoreNFC:(id)a3 outError:(id *)a4
{
  id v7 = a3;
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    id v9 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    uint64_t v13 = 45;
    if (isMetaClass) {
      uint64_t v13 = 43;
    }
    v9(6, "%c[%{public}s %{public}s]:%i ", v13, ClassName, Name, 2897);
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  id v14 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = object_getClass(self);
    if (class_isMetaClass(v15)) {
      int v16 = 43;
    }
    else {
      int v16 = 45;
    }
    *(_DWORD *)id buf = 67109890;
    int v105 = v16;
    __int16 v106 = 2082;
    id v107 = object_getClassName(self);
    __int16 v108 = 2082;
    long long v109 = sel_getName(a2);
    __int16 v110 = 1024;
    int v111 = 2897;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i ", buf, 0x22u);
  }

  driverWrapper = self->_driverWrapper;
  if (!driverWrapper || (unsigned int v18 = sub_10018FAE8(driverWrapper, v7, 0)) == 0)
  {
    uint64_t v95 = 0;
    uint64_t v96 = 0;
    uint64_t v97 = 0;
    id v94 = 0;
    [(_NFReaderSession *)self _updateFelicaTagInfo:v7 outError:&v94];
    id v40 = v94;
    BOOL v41 = v40;
    if (v40 && ([v40 code] == (id)51 || objc_msgSend(v41, "code") == (id)64))
    {
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      uint64_t v42 = NFLogGetLogger();
      if (v42)
      {
        uint64_t v43 = (void (*)(uint64_t, const char *, ...))v42;
        unsigned int v44 = object_getClass(self);
        BOOL v45 = class_isMetaClass(v44);
        int v46 = object_getClassName(self);
        uint64_t v90 = sel_getName(a2);
        uint64_t v47 = 45;
        if (v45) {
          uint64_t v47 = 43;
        }
        v43(3, "%c[%{public}s %{public}s]:%i Tag deactivated or failed to retrieve info", v47, v46, v90, 2913);
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      BOOL v48 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
      {
        id v49 = object_getClass(self);
        if (class_isMetaClass(v49)) {
          int v50 = 43;
        }
        else {
          int v50 = 45;
        }
        uint64_t v51 = object_getClassName(self);
        id v52 = sel_getName(a2);
        *(_DWORD *)id buf = 67109890;
        int v105 = v50;
        __int16 v106 = 2082;
        id v107 = v51;
        __int16 v108 = 2082;
        long long v109 = v52;
        __int16 v110 = 1024;
        int v111 = 2913;
        _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Tag deactivated or failed to retrieve info", buf, 0x22u);
      }

      if (!a4) {
        goto LABEL_74;
      }
      int v92 = a4;
      id v53 = objc_alloc((Class)NSError);
      id v54 = +[NSString stringWithUTF8String:"nfcd"];
      id v55 = [v41 code];
      v100[0] = NSLocalizedDescriptionKey;
      if ((uint64_t)[v41 code] > 70) {
        uint64_t v56 = 71;
      }
      else {
        uint64_t v56 = (uint64_t)[v41 code];
      }
      unsigned int v79 = +[NSString stringWithUTF8String:off_100306978[v56]];
      v101[0] = v79;
      v101[1] = v41;
      v100[1] = NSUnderlyingErrorKey;
      v100[2] = @"Line";
      v101[2] = &off_10031DA28;
      v100[3] = @"Method";
      id v80 = [objc_alloc((Class)NSString) initWithFormat:@"%s", sel_getName(a2)];
      v101[3] = v80;
      v100[4] = NSDebugDescriptionErrorKey;
      id v81 = [objc_alloc((Class)NSString) initWithFormat:@"%s:%d", sel_getName(a2), 2914];
      v101[4] = v81;
      int v82 = v101;
      __int16 v83 = v100;
      uint64_t v84 = 5;
    }
    else
    {
      uint64_t v57 = sub_10023D968();
      sub_10023D9FC((uint64_t)v57, v7);

      if (sub_100190624(self->_driverWrapper, v7, &v95, (uint64_t)a4))
      {
        BOOL v58 = v95 != 0;
        int v59 = v97;
        if (!(_BYTE)v97) {
          BOOL v58 = 1;
        }
        if (BYTE1(v97)) {
          int v60 = v58;
        }
        else {
          int v60 = 1;
        }
        if (BYTE1(v97)) {
          unsigned int v61 = 4;
        }
        else {
          unsigned int v61 = 3;
        }
        if (!(_BYTE)v97) {
          unsigned int v61 = 0;
        }
        uint64_t v62 = v60 ? v61 : 2;
        [v7 _setNDEFAvailability:v62];
        [v7 _setNDEFContainerSize:v96];
        [v7 _setNDEFMessageSize:v95];
        if (v60 != 1 || v59)
        {
          id v39 = [objc_alloc((Class)NFTagInternal) initWithNFTagForUIDOnly:v7];
          if (v39) {
            goto LABEL_75;
          }
        }
      }
      unsigned int v63 = sub_1001900C4(self->_driverWrapper, v7, 0);
      if (!v63) {
        goto LABEL_74;
      }
      unsigned int v64 = v63;
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      uint64_t v65 = NFLogGetLogger();
      if (v65)
      {
        BOOL v66 = (void (*)(uint64_t, const char *, ...))v65;
        id v67 = object_getClass(self);
        BOOL v68 = class_isMetaClass(v67);
        unsigned int v93 = v64;
        __int16 v69 = v41;
        uint64_t v70 = a4;
        int v71 = object_getClassName(self);
        uint64_t v91 = sel_getName(a2);
        uint64_t v72 = 45;
        if (v68) {
          uint64_t v72 = 43;
        }
        id v87 = v71;
        a4 = v70;
        BOOL v41 = v69;
        unsigned int v64 = v93;
        v66(3, "%c[%{public}s %{public}s]:%i Failed to disconnect tag", v72, v87, v91, 2943);
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      id v73 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v73, OS_LOG_TYPE_ERROR))
      {
        id v74 = object_getClass(self);
        if (class_isMetaClass(v74)) {
          int v75 = 43;
        }
        else {
          int v75 = 45;
        }
        NSErrorUserInfoKey v76 = object_getClassName(self);
        id v77 = sel_getName(a2);
        *(_DWORD *)id buf = 67109890;
        int v105 = v75;
        __int16 v106 = 2082;
        id v107 = v76;
        __int16 v108 = 2082;
        long long v109 = v77;
        __int16 v110 = 1024;
        int v111 = 2943;
        _os_log_impl((void *)&_mh_execute_header, v73, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to disconnect tag", buf, 0x22u);
      }

      if (!a4)
      {
LABEL_74:
        id v39 = 0;
LABEL_75:

        goto LABEL_76;
      }
      int v92 = a4;
      id v53 = objc_alloc((Class)NSError);
      id v54 = +[NSString stringWithUTF8String:"nfcd"];
      id v55 = (id)v64;
      v98[0] = NSLocalizedDescriptionKey;
      if (v64 >= 0x47) {
        int v78 = 71;
      }
      else {
        int v78 = v64;
      }
      unsigned int v79 = +[NSString stringWithUTF8String:off_100306978[v78]];
      v99[0] = v79;
      v99[1] = &off_10031DA40;
      v98[1] = @"Line";
      v98[2] = @"Method";
      id v80 = [objc_alloc((Class)NSString) initWithFormat:@"%s", sel_getName(a2)];
      v99[2] = v80;
      v98[3] = NSDebugDescriptionErrorKey;
      id v81 = [objc_alloc((Class)NSString) initWithFormat:@"%s:%d", sel_getName(a2), 2944];
      v99[3] = v81;
      int v82 = v99;
      __int16 v83 = v98;
      uint64_t v84 = 4;
    }
    __int16 v85 = +[NSDictionary dictionaryWithObjects:v82 forKeys:v83 count:v84];
    id *v92 = [v53 initWithDomain:v54 code:v55 userInfo:v85];

    goto LABEL_74;
  }
  unsigned int v19 = v18;
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t v20 = NFLogGetLogger();
  if (v20)
  {
    id v21 = (void (*)(uint64_t, const char *, ...))v20;
    BOOL v22 = object_getClass(self);
    BOOL v23 = class_isMetaClass(v22);
    uint64_t v24 = object_getClassName(self);
    int v89 = sel_getName(a2);
    uint64_t v25 = 45;
    if (v23) {
      uint64_t v25 = 43;
    }
    v21(3, "%c[%{public}s %{public}s]:%i Failed to connect tag", v25, v24, v89, 2901);
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  id v26 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
  {
    int v27 = object_getClass(self);
    if (class_isMetaClass(v27)) {
      int v28 = 43;
    }
    else {
      int v28 = 45;
    }
    id v29 = object_getClassName(self);
    id v30 = sel_getName(a2);
    *(_DWORD *)id buf = 67109890;
    int v105 = v28;
    __int16 v106 = 2082;
    id v107 = v29;
    __int16 v108 = 2082;
    long long v109 = v30;
    __int16 v110 = 1024;
    int v111 = 2901;
    _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to connect tag", buf, 0x22u);
  }

  if (a4)
  {
    id v31 = objc_alloc((Class)NSError);
    uint64_t v32 = +[NSString stringWithUTF8String:"nfcd"];
    uint64_t v33 = v19;
    v102[0] = NSLocalizedDescriptionKey;
    id v34 = +[NSString stringWithUTF8String:off_100306978[v19]];
    v103[0] = v34;
    v103[1] = &off_10031DA10;
    v102[1] = @"Line";
    v102[2] = @"Method";
    id v35 = [objc_alloc((Class)NSString) initWithFormat:@"%s", sel_getName(a2)];
    v103[2] = v35;
    v102[3] = NSDebugDescriptionErrorKey;
    id v36 = a4;
    id v37 = [objc_alloc((Class)NSString) initWithFormat:@"%s:%d", sel_getName(a2), 2902];
    v103[3] = v37;
    uint64_t v38 = +[NSDictionary dictionaryWithObjects:v103 forKeys:v102 count:4];
    id *v36 = [v31 initWithDomain:v32 code:v33 userInfo:v38];
  }
  id v39 = 0;
LABEL_76:

  return v39;
}

- (id)_getNodeList
{
  double v2 = self;
  id v53 = objc_opt_new();
  unsigned int v3 = 0;
  while (1)
  {
    v55[0] = v3;
    v55[1] = 0;
    id v4 = [objc_alloc((Class)NSMutableData) initWithBytes:&unk_100284339 length:2];
    BOOL v5 = [(_NFReaderSession *)v2 currentTag];
    id v6 = [v5 tagID];
    [v4 appendData:v6];

    [v4 appendBytes:v55 length:2];
    id v7 = [(_NFReaderSession *)v2 driverWrapper];
    id v8 = [(_NFReaderSession *)v2 currentTag];
    id v9 = [(_NFReaderSession *)v2 whitelistChecker];
    [v9 sessionTimeLimit];
    id v54 = 0;
    unsigned int v10 = sub_100195A20(v7, v4, v8, &v54);
    id v11 = v54;

    if (v11 || !v10) {
      break;
    }
    if (![v10 length])
    {
      id v11 = 0;
      break;
    }
    id v12 = v10;
    uint64_t v13 = (unsigned __int16 *)[v12 bytes];
    uint64_t v14 = v13[5];
    if (v14 == 0xFFFF)
    {

LABEL_26:
      id v35 = v53;
      if ([(_NFReaderSession *)v2 _getKeyVersionForNodes:v53])
      {
        id v34 = [v53 allValues];
      }
      else
      {
        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        uint64_t Logger = NFLogGetLogger();
        if (Logger)
        {
          id v37 = (void (*)(uint64_t, const char *, ...))Logger;
          Class = object_getClass(v2);
          BOOL isMetaClass = class_isMetaClass(Class);
          ClassName = object_getClassName(v2);
          Name = sel_getName(a2);
          uint64_t v41 = 45;
          if (isMetaClass) {
            uint64_t v41 = 43;
          }
          v37(3, "%c[%{public}s %{public}s]:%i Failed to get key version for nodes", v41, ClassName, Name, 3009);
        }
        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        uint64_t v42 = NFSharedLogGetLogger();
        if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
        {
          uint64_t v43 = object_getClass(v2);
          if (class_isMetaClass(v43)) {
            int v44 = 43;
          }
          else {
            int v44 = 45;
          }
          BOOL v45 = object_getClassName(v2);
          int v46 = sel_getName(a2);
          *(_DWORD *)id buf = 67109890;
          int v57 = v44;
          __int16 v58 = 2082;
          int v59 = v45;
          __int16 v60 = 2082;
          unsigned int v61 = v46;
          __int16 v62 = 1024;
          int v63 = 3009;
          _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to get key version for nodes", buf, 0x22u);
        }

        id v34 = 0;
      }
      goto LABEL_38;
    }
    int v15 = v13;
    if ([v12 length] == (id)12)
    {
      int v16 = objc_opt_new();
      id v17 = [objc_alloc((Class)NSString) initWithFormat:@"%04X", __rev16(v14)];
      unsigned int v18 = v16;
      id v19 = v17;
      CFStringRef v20 = @"areaCode";
LABEL_10:
      [v18 setObject:v19 forKeyedSubscript:v20];

      BOOL v22 = +[NSNumber numberWithUnsignedShort:v14];
      [v53 setObject:v16 forKey:v22];

      goto LABEL_11;
    }
    if ([v12 length] == (id)14)
    {
      int v16 = objc_opt_new();
      id v21 = [objc_alloc((Class)NSString) initWithFormat:@"%04X", __rev16(v14)];
      [v16 setObject:v21 forKeyedSubscript:@"areaCode"];

      double v2 = self;
      id v17 = [objc_alloc((Class)NSString) initWithFormat:@"%04X", __rev16(v15[6])];
      unsigned int v18 = v16;
      id v19 = v17;
      CFStringRef v20 = @"endServiceCode";
      goto LABEL_10;
    }
LABEL_11:

    if (v3++ >= 0xFE) {
      goto LABEL_26;
    }
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t v24 = NFLogGetLogger();
  if (v24)
  {
    uint64_t v25 = (void (*)(uint64_t, const char *, ...))v24;
    id v26 = object_getClass(v2);
    BOOL v27 = class_isMetaClass(v26);
    BOOL v48 = object_getClassName(v2);
    id v49 = sel_getName(a2);
    uint64_t v28 = 45;
    if (v27) {
      uint64_t v28 = 43;
    }
    v25(3, "%c[%{public}s %{public}s]:%i Failed to search service codes, error %{public}@", v28, v48, v49, 2980, v11);
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  id v29 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
  {
    id v30 = object_getClass(v2);
    if (class_isMetaClass(v30)) {
      int v31 = 43;
    }
    else {
      int v31 = 45;
    }
    uint64_t v32 = object_getClassName(v2);
    uint64_t v33 = sel_getName(a2);
    *(_DWORD *)id buf = 67110146;
    int v57 = v31;
    __int16 v58 = 2082;
    int v59 = v32;
    __int16 v60 = 2082;
    unsigned int v61 = v33;
    __int16 v62 = 1024;
    int v63 = 2980;
    __int16 v64 = 2114;
    id v65 = v11;
    _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to search service codes, error %{public}@", buf, 0x2Cu);
  }

  id v34 = 0;
  id v35 = v53;
LABEL_38:

  return v34;
}

- (BOOL)_getKeyVersionForNodes:(id)a3
{
  id v4 = a3;
  char v90 = 0;
  BOOL v5 = objc_opt_new();
  id v80 = v4;
  [v4 allKeys];
  long long v86 = 0u;
  long long v87 = 0u;
  long long v88 = 0u;
  long long v89 = 0u;
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  id v7 = [v6 countByEnumeratingWithState:&v86 objects:v101 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = 0;
    uint64_t v10 = *(void *)v87;
    int v71 = a2;
    uint64_t v72 = *(void *)v87;
    id v81 = v6;
    while (2)
    {
      id v11 = 0;
      id v73 = v8;
      do
      {
        if (*(void *)v87 != v10) {
          objc_enumerationMutation(v6);
        }
        id v12 = *(void **)(*((void *)&v86 + 1) + 8 * (void)v11);
        if (!v5) {
          BOOL v5 = objc_opt_new();
        }
        v85[0] = [v12 unsignedShortValue];
        v85[1] = (unsigned __int16)[v12 unsignedShortValue] >> 8;
        [v5 appendBytes:v85 length:2];
        if (++v90 >= 0x1Eu)
        {
          NSErrorUserInfoKey v76 = v11;
          uint64_t v13 = objc_opt_new();
          char v84 = 2;
          [v13 appendBytes:&v84 length:1];
          uint64_t v14 = [(_NFReaderSession *)self currentTag];
          int v15 = [v14 tagID];
          [v13 appendData:v15];

          [v13 appendBytes:&v90 length:1];
          [v13 appendData:v5];
          char v84 = [v13 length] + 1;
          id v16 = [objc_alloc((Class)NSMutableData) initWithBytes:&v84 length:1];
          [v16 appendData:v13];
          id v17 = [(_NFReaderSession *)self driverWrapper];
          unsigned int v18 = [(_NFReaderSession *)self currentTag];
          id v19 = [(_NFReaderSession *)self whitelistChecker];
          [v19 sessionTimeLimit];
          id v83 = 0;
          CFStringRef v20 = sub_100195A20(v17, v16, v18, &v83);
          id v21 = v83;

          int v78 = v16;
          unsigned int v79 = v5;
          if (v21 || !v20) {
            goto LABEL_31;
          }
          if (![v20 length])
          {
            id v21 = 0;
LABEL_31:
            id v57 = v21;
            dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
            uint64_t Logger = NFLogGetLogger();
            if (Logger)
            {
              int v59 = (void (*)(uint64_t, const char *, ...))Logger;
              Class = object_getClass(self);
              BOOL isMetaClass = class_isMetaClass(Class);
              ClassName = object_getClassName(self);
              Name = sel_getName(v71);
              uint64_t v62 = 45;
              if (isMetaClass) {
                uint64_t v62 = 43;
              }
              v59(3, "%c[%{public}s %{public}s]:%i Failed to get key versions, error %{public}@", v62, ClassName, Name, 3053, v21);
            }
            dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
            int v63 = NFSharedLogGetLogger();
            int v44 = v80;
            if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
            {
              __int16 v64 = object_getClass(self);
              if (class_isMetaClass(v64)) {
                int v65 = 43;
              }
              else {
                int v65 = 45;
              }
              BOOL v66 = object_getClassName(self);
              id v67 = sel_getName(v71);
              *(_DWORD *)id buf = 67110146;
              int v92 = v65;
              __int16 v93 = 2082;
              id v94 = v66;
              __int16 v95 = 2082;
              uint64_t v96 = v67;
              __int16 v97 = 1024;
              int v98 = 3053;
              __int16 v99 = 2114;
              id v100 = v57;
              _os_log_impl((void *)&_mh_execute_header, v63, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to get key versions, error %{public}@", buf, 0x2Cu);
            }

            BOOL v56 = 0;
            uint64_t v33 = v6;
            id v41 = v57;
            goto LABEL_42;
          }
          id v75 = v20;
          BOOL v22 = (unsigned __int8 *)[v75 bytes];
          unsigned int v23 = v22[10];
          if (v22[10])
          {
            unsigned int v24 = 0;
            uint64_t v25 = (unsigned __int16 *)(v22 + 11);
            do
            {
              uint64_t v26 = (v9 + 1);
              unsigned int v27 = *v25++;
              uint64_t v28 = [v81 objectAtIndex:v9];
              id v29 = [v28 unsignedShortValue];

              id v30 = +[NSNumber numberWithUnsignedShort:v29];
              int v31 = [v80 objectForKey:v30];

              id v32 = [objc_alloc((Class)NSString) initWithFormat:@"%04X", __rev16(v27)];
              [v31 setObject:v32 forKeyedSubscript:@"keyVersion"];

              ++v24;
              LODWORD(v9) = v9 + 1;
            }
            while (v24 < v23);
          }
          else
          {
            uint64_t v26 = v9;
          }
          char v90 = 0;
          BOOL v5 = objc_opt_new();

          uint64_t v9 = v26;
          id v6 = v81;
          uint64_t v10 = v72;
          id v8 = v73;
          id v11 = v76;
        }
        id v11 = (char *)v11 + 1;
      }
      while (v11 != v8);
      id v8 = [v6 countByEnumeratingWithState:&v86 objects:v101 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
  else
  {
    LODWORD(v9) = 0;
  }

  if (v90)
  {
    uint64_t v33 = objc_opt_new();
    buf[0] = 2;
    [v33 appendBytes:buf length:1];
    id v34 = [(_NFReaderSession *)self currentTag];
    id v35 = [v34 tagID];
    [v33 appendData:v35];

    [v33 appendBytes:&v90 length:1];
    unsigned int v79 = v5;
    [v33 appendData:v5];
    buf[0] = [v33 length] + 1;
    id v36 = [objc_alloc((Class)NSMutableData) initWithBytes:buf length:1];
    [v36 appendData:v33];
    id v37 = [(_NFReaderSession *)self driverWrapper];
    uint64_t v38 = [(_NFReaderSession *)self currentTag];
    id v39 = [(_NFReaderSession *)self whitelistChecker];
    [v39 sessionTimeLimit];
    id v82 = 0;
    id v40 = sub_100195A20(v37, v36, v38, &v82);
    id v41 = v82;

    if (!v41 && v40 && [v40 length])
    {
      id v77 = v40;
      uint64_t v42 = (unsigned __int8 *)[v77 bytes];
      unsigned int v43 = v42[10];
      int v44 = v80;
      BOOL v45 = v6;
      if (v42[10])
      {
        unsigned int v46 = 0;
        uint64_t v47 = (unsigned __int16 *)(v42 + 11);
        int v48 = v9;
        do
        {
          int v49 = v48 + 1;
          unsigned int v50 = *v47++;
          uint64_t v51 = [v45 objectAtIndex:v48];
          id v52 = [v51 unsignedShortValue];

          id v53 = +[NSNumber numberWithUnsignedShort:v52];
          id v54 = [v80 objectForKey:v53];

          id v55 = [objc_alloc((Class)NSString) initWithFormat:@"%04X", __rev16(v50)];
          [v54 setObject:v55 forKeyedSubscript:@"keyVersion"];

          ++v46;
          int v48 = v49;
        }
        while (v46 < v43);
      }
      char v90 = 0;

      id v41 = 0;
      BOOL v56 = 1;
      id v6 = v45;
    }
    else
    {

      BOOL v56 = 0;
      int v44 = v80;
    }
LABEL_42:

    BOOL v5 = v79;
  }
  else
  {
    id v41 = 0;
    BOOL v56 = 1;
    int v44 = v80;
  }

  return v56;
}

- (id)_getSystemCodeListFromTag:(id)a3 outError:(id *)a4
{
  id v7 = a3;
  id v62 = (id)objc_opt_new();
  char v67 = 10;
  id v8 = [objc_alloc((Class)NSMutableData) initWithBytes:&v67 length:1];
  char v67 = 12;
  [v8 appendBytes:&v67 length:1];
  uint64_t v9 = [v7 tagID];
  [v8 appendData:v9];

  uint64_t v10 = [(_NFReaderSession *)self driverWrapper];
  id v11 = [(_NFReaderSession *)self whitelistChecker];
  [v11 sessionTimeLimit];
  id v66 = 0;
  sub_100195A20(v10, v8, v7, &v66);
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  id v13 = v66;

  if ([v13 code] != (id)64)
  {
    if (!v13 && (unint64_t)[v12 length] >= 0xB)
    {
      id v17 = v12;
      unsigned int v18 = (unsigned __int8 *)[v17 bytes];
      int v19 = v18[10];
      id v12 = v17;
      id v20 = [v12 bytes];
      id v21 = [v12 length];
      id v13 = 0;
      if (!v19) {
        goto LABEL_36;
      }
      unint64_t v22 = (unint64_t)v21 + (void)v20;
      if ((unint64_t)(v18 + 12) >= v22) {
        goto LABEL_36;
      }
      unsigned int v23 = (char *)(v18 + 11);
      do
      {
        id v24 = [objc_alloc((Class)NSData) initWithBytes:v23 length:2];
        [v62 addObject:v24];

        if (!(_BYTE)--v19) {
          break;
        }
        unint64_t v25 = (unint64_t)(v23 + 3);
        v23 += 2;
      }
      while (v25 < v22);
LABEL_16:
      id v13 = 0;
      goto LABEL_36;
    }
    sela = a2;
    unsigned int v61 = a4;
    __int16 v65 = 1;
    int v64 = -65530;
    id v26 = [objc_alloc((Class)NSData) initWithBytes:&v64 length:6];
    [v8 setData:v26];

    unsigned int v27 = [(_NFReaderSession *)self driverWrapper];
    uint64_t v28 = [(_NFReaderSession *)self whitelistChecker];
    [v28 sessionTimeLimit];
    id v63 = v13;
    id v29 = sub_100195A20(v27, v8, v7, &v63);
    id v30 = v63;

    if (!v30 && [v29 length] == (id)20)
    {
      id v12 = v29;
      id v31 = [objc_alloc((Class)NSData) initWithBytes:(char *)[v12 bytes] + 18 length:2];
      [v62 addObject:v31];

      goto LABEL_16;
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      uint64_t v33 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(sela);
      uint64_t v37 = 45;
      if (isMetaClass) {
        uint64_t v37 = 43;
      }
      v33(5, "%c[%{public}s %{public}s]:%i Unable to identify tag's system code", v37, ClassName, Name, 3165);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v38 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
    {
      id v39 = object_getClass(self);
      if (class_isMetaClass(v39)) {
        int v40 = 43;
      }
      else {
        int v40 = 45;
      }
      id v41 = object_getClassName(self);
      uint64_t v42 = sel_getName(sela);
      *(_DWORD *)id buf = 67109890;
      int v71 = v40;
      __int16 v72 = 2082;
      id v73 = v41;
      __int16 v74 = 2082;
      id v75 = v42;
      __int16 v76 = 1024;
      int v77 = 3165;
      _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Unable to identify tag's system code", buf, 0x22u);
    }

    if (v61)
    {
      id v12 = v29;
      if (!v30)
      {
LABEL_35:
        id v13 = v30;
        goto LABEL_36;
      }
      id v43 = objc_alloc((Class)NSError);
      int v44 = +[NSString stringWithUTF8String:"nfcd"];
      id v45 = [v30 code];
      v68[0] = NSLocalizedDescriptionKey;
      id v57 = v45;
      if ((uint64_t)[v30 code] > 70) {
        uint64_t v46 = 71;
      }
      else {
        uint64_t v46 = (uint64_t)[v30 code];
      }
      uint64_t v51 = +[NSString stringWithUTF8String:off_100306978[v46]];
      v69[0] = v51;
      v69[1] = v30;
      v68[1] = NSUnderlyingErrorKey;
      v68[2] = @"Line";
      v69[2] = &off_10031DA70;
      v68[3] = @"Method";
      id v52 = [objc_alloc((Class)NSString) initWithFormat:@"%s", sel_getName(sela)];
      v69[3] = v52;
      void v68[4] = NSDebugDescriptionErrorKey;
      id v53 = [objc_alloc((Class)NSString) initWithFormat:@"%s:%d", sel_getName(sela), 3173];
      void v69[4] = v53;
      id v54 = +[NSDictionary dictionaryWithObjects:v69 forKeys:v68 count:5];
      id *v61 = [v43 initWithDomain:v44 code:v57 userInfo:v54];
    }
    id v12 = v29;
    goto LABEL_35;
  }
  if (a4)
  {
    __int16 v60 = a4;
    sel = (char *)objc_alloc((Class)NSError);
    uint64_t v14 = +[NSString stringWithUTF8String:"nfcd"];
    id v15 = [v13 code];
    v78[0] = NSLocalizedDescriptionKey;
    if ((uint64_t)[v13 code] > 70) {
      uint64_t v16 = 71;
    }
    else {
      uint64_t v16 = (uint64_t)[v13 code];
    }
    uint64_t v47 = +[NSString stringWithUTF8String:off_100306978[v16]];
    v79[0] = v47;
    v79[1] = v13;
    v78[1] = NSUnderlyingErrorKey;
    v78[2] = @"Line";
    v79[2] = &off_10031DA58;
    v78[3] = @"Method";
    id v48 = [objc_alloc((Class)NSString) initWithFormat:@"%s", sel_getName(a2)];
    v79[3] = v48;
    void v78[4] = NSDebugDescriptionErrorKey;
    id v49 = [objc_alloc((Class)NSString) initWithFormat:@"%s:%d", sel_getName(a2), 3138];
    v79[4] = v49;
    unsigned int v50 = +[NSDictionary dictionaryWithObjects:v79 forKeys:v78 count:5];
    *__int16 v60 = [sel initWithDomain:v14 code:v15 userInfo:v50];
  }
LABEL_36:

  return v62;
}

- (id)_RequestService:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    unsigned __int8 v35 = 0;
    id v5 = [objc_alloc((Class)NSMutableData) initWithBytes:&v35 length:1];
    unsigned __int8 v35 = 2;
    [v5 appendBytes:&v35 length:1];
    id v6 = [(_NFReaderSession *)self currentTag];
    id v7 = [v6 tagID];
    [v5 appendData:v7];

    unsigned __int8 v35 = [v4 count];
    [v5 appendBytes:&v35 length:1];
    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id v8 = v4;
    id v9 = [v8 countByEnumeratingWithState:&v31 objects:v36 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v32;
      do
      {
        for (uint64_t i = 0; i != v10; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v32 != v11) {
            objc_enumerationMutation(v8);
          }
          [v5 appendData:*(void *)(*((void *)&v31 + 1) + 8 * i)];
        }
        id v10 = [v8 countByEnumeratingWithState:&v31 objects:v36 count:16];
      }
      while (v10);
    }

    unsigned __int8 v35 = [v5 length];
    [v5 replaceBytesInRange:0 withBytes:&v35 length:1];
    id v13 = [(_NFReaderSession *)self driverWrapper];
    uint64_t v14 = [(_NFReaderSession *)self currentTag];
    id v15 = [(_NFReaderSession *)self whitelistChecker];
    [v15 sessionTimeLimit];
    id v30 = 0;
    uint64_t v16 = sub_100195A20(v13, v5, v14, &v30);
    id v17 = v30;

    unsigned int v18 = objc_opt_new();
    if (!v17 && (unint64_t)[v16 length] >= 0xB)
    {
      id v19 = v16;
      id v20 = (unsigned __int8 *)[v19 bytes];
      int v21 = v20[10];
      id v22 = v19;
      id v23 = [v22 bytes];
      id v24 = (char *)[v22 length];
      if (v21)
      {
        unint64_t v25 = &v24[(void)v23];
        if ((char *)(v20 + 12) < &v24[(void)v23])
        {
          id v26 = (char *)(v20 + 11);
          do
          {
            id v27 = [objc_alloc((Class)NSData) initWithBytes:v26 length:2];
            [v18 addObject:v27];

            if (!(_BYTE)--v21) {
              break;
            }
            uint64_t v28 = v26 + 3;
            v26 += 2;
          }
          while (v28 < v25);
        }
      }
    }
  }
  else
  {
    unsigned int v18 = objc_opt_new();
  }

  return v18;
}

- (id)_RequestService:(id)a3 forSystemCode:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if ([v8 length] == (id)2)
  {
    if ([v7 count])
    {
      id v9 = [(_NFReaderSession *)self currentTag];
      id v53 = 0;
      id v10 = [(_NFReaderSession *)self _getIDMFromTag:v9 systemCode:v8 outIdm:&v53 outPmm:0];
      id v11 = v53;

      if (v10)
      {
        id v12 = [(_NFReaderSession *)self currentTag];
        uint64_t v13 = [v12 tagID];

        id v11 = (id)v13;
      }
      buf[0] = 0;
      id v14 = [objc_alloc((Class)NSMutableData) initWithBytes:buf length:1];
      buf[0] = 2;
      [v14 appendBytes:buf length:1];
      uint64_t v46 = v11;
      [v14 appendData:v11];
      buf[0] = [v7 count];
      [v14 appendBytes:buf length:1];
      long long v51 = 0u;
      long long v52 = 0u;
      long long v49 = 0u;
      long long v50 = 0u;
      id v15 = v7;
      id v16 = [v15 countByEnumeratingWithState:&v49 objects:v54 count:16];
      if (v16)
      {
        id v17 = v16;
        uint64_t v18 = *(void *)v50;
        do
        {
          for (uint64_t i = 0; i != v17; uint64_t i = (char *)i + 1)
          {
            if (*(void *)v50 != v18) {
              objc_enumerationMutation(v15);
            }
            [v14 appendData:*(void *)(*((void *)&v49 + 1) + 8 * i)];
          }
          id v17 = [v15 countByEnumeratingWithState:&v49 objects:v54 count:16];
        }
        while (v17);
      }

      buf[0] = [v14 length];
      [v14 replaceBytesInRange:0 withBytes:buf length:1];
      id v20 = [(_NFReaderSession *)self driverWrapper];
      int v21 = [(_NFReaderSession *)self currentTag];
      id v22 = [(_NFReaderSession *)self whitelistChecker];
      [v22 sessionTimeLimit];
      id v48 = v10;
      sub_100195A20(v20, v14, v21, &v48);
      id v47 = (id)objc_claimAutoreleasedReturnValue();
      id v23 = v48;

      id v24 = objc_opt_new();
      if (!v23 && (unint64_t)[v47 length] >= 0xC)
      {
        id v25 = v47;
        id v26 = (unsigned __int8 *)[v25 bytes];
        int v27 = v26[10];
        id v28 = v25;
        id v29 = [v28 bytes];
        id v30 = (char *)[v28 length];
        if (v27)
        {
          long long v31 = &v30[(void)v29];
          if ((char *)(v26 + 12) < &v30[(void)v29])
          {
            long long v32 = (char *)(v26 + 11);
            do
            {
              id v33 = [objc_alloc((Class)NSData) initWithBytes:v32 length:2];
              [v24 addObject:v33];

              if (!(_BYTE)--v27) {
                break;
              }
              long long v34 = v32 + 3;
              v32 += 2;
            }
            while (v34 < v31);
          }
        }
      }
    }
    else
    {
      id v24 = objc_opt_new();
    }
  }
  else
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      id v36 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      uint64_t v40 = 45;
      if (isMetaClass) {
        uint64_t v40 = 43;
      }
      v36(3, "%c[%{public}s %{public}s]:%i Invalid systemCode. ", v40, ClassName, Name, 3226);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    id v41 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
    {
      uint64_t v42 = object_getClass(self);
      if (class_isMetaClass(v42)) {
        int v43 = 43;
      }
      else {
        int v43 = 45;
      }
      *(_DWORD *)id buf = 67109890;
      int v56 = v43;
      __int16 v57 = 2082;
      __int16 v58 = object_getClassName(self);
      __int16 v59 = 2082;
      __int16 v60 = sel_getName(a2);
      __int16 v61 = 1024;
      int v62 = 3226;
      _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Invalid systemCode. ", buf, 0x22u);
    }

    id v24 = 0;
  }

  return v24;
}

- (id)_getIDMFromTag:(id)a3 systemCode:(id)a4 outIdm:(id *)a5 outPmm:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  if ([v11 length] == (id)2)
  {
    id v12 = (char *)[v11 bytes];
    __int16 v31 = 6;
    char v32 = *v12;
    char v33 = v12[1];
    __int16 v34 = 0;
    uint64_t v13 = [(_NFReaderSession *)self driverWrapper];
    id v14 = [objc_alloc((Class)NSData) initWithBytes:&v31 length:6];
    id v15 = [(_NFReaderSession *)self whitelistChecker];
    [v15 sessionTimeLimit];
    id v30 = 0;
    id v16 = sub_100195A20(v13, v14, v10, &v30);
    id v17 = v30;

    if (v17)
    {
      id v18 = v17;
    }
    else
    {
      id v23 = v16;
      id v24 = [v23 bytes];
      if ([v23 length] == (id)18 && *v24 == 18 && v24[1] == 1)
      {
        if (a5)
        {
          [v23 subdataWithRange:2, 8];
          *a5 = (id)objc_claimAutoreleasedReturnValue();
        }
        if (a6)
        {
          [v23 subdataWithRange:NSMakeRange(10, 8)];
          id v18 = 0;
          *a6 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          id v18 = 0;
        }
      }
      else
      {
        id v25 = objc_alloc((Class)NSError);
        id v26 = +[NSString stringWithUTF8String:"nfcd"];
        NSErrorUserInfoKey v35 = NSLocalizedDescriptionKey;
        int v27 = +[NSString stringWithUTF8String:"Unexpected Result"];
        id v36 = v27;
        id v28 = +[NSDictionary dictionaryWithObjects:&v36 forKeys:&v35 count:1];
        id v18 = [v25 initWithDomain:v26 code:13 userInfo:v28];
      }
    }
  }
  else
  {
    id v19 = objc_alloc((Class)NSError);
    id v20 = +[NSString stringWithUTF8String:"nfcd"];
    NSErrorUserInfoKey v37 = NSLocalizedDescriptionKey;
    int v21 = +[NSString stringWithUTF8String:"Invalid Parameter"];
    uint64_t v38 = v21;
    id v22 = +[NSDictionary dictionaryWithObjects:&v38 forKeys:&v37 count:1];
    id v18 = [v19 initWithDomain:v20 code:10 userInfo:v22];
  }

  return v18;
}

- (id)_getSystemInfo:(id)a3 outError:(id *)a4
{
  id v7 = a3;
  if ([v7 length])
  {
    int v43 = a4;
    __int16 v50 = 1;
    int v49 = 6;
    id v8 = v7;
    id v9 = (unsigned __int8 *)[v8 bytes];
    int v10 = *v9;
    BYTE2(v49) = *v9;
    int v11 = v9[1];
    HIBYTE(v49) = v9[1];
    id v12 = [objc_alloc((Class)NSData) initWithBytes:&v49 length:6];
    uint64_t v13 = [(_NFReaderSession *)self driverWrapper];
    id v14 = [(_NFReaderSession *)self currentTag];
    id v15 = [(_NFReaderSession *)self whitelistChecker];
    [v15 sessionTimeLimit];
    id v48 = 0;
    id v45 = v12;
    int v44 = sub_100195A20(v13, v12, v14, &v48);
    id v16 = v48;

    if (v16)
    {
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      uint64_t Logger = NFLogGetLogger();
      if (Logger)
      {
        id v18 = (void (*)(uint64_t, const char *, ...))Logger;
        Class = object_getClass(self);
        BOOL isMetaClass = class_isMetaClass(Class);
        ClassName = object_getClassName(self);
        Name = sel_getName(a2);
        uint64_t v21 = 45;
        if (isMetaClass) {
          uint64_t v21 = 43;
        }
        v18(3, "%c[%{public}s %{public}s]:%i System switch error: %{public}@", v21, ClassName, Name, 3341, v16);
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      id v22 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        id v23 = object_getClass(self);
        if (class_isMetaClass(v23)) {
          int v24 = 43;
        }
        else {
          int v24 = 45;
        }
        id v25 = object_getClassName(self);
        id v26 = sel_getName(a2);
        *(_DWORD *)id buf = 67110146;
        int v52 = v24;
        __int16 v53 = 2082;
        id v54 = v25;
        __int16 v55 = 2082;
        int v56 = v26;
        __int16 v57 = 1024;
        int v58 = 3341;
        __int16 v59 = 2114;
        id v60 = v16;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i System switch error: %{public}@", buf, 0x2Cu);
      }

      if (v43)
      {
        id v16 = v16;
        int v27 = 0;
        id *v43 = v16;
      }
      else
      {
        int v27 = 0;
      }
    }
    else
    {
      id v28 = [(_NFReaderSession *)self _getNodeList];
      if (v28)
      {
        int v27 = objc_opt_new();
        id v29 = [objc_alloc((Class)NSString) initWithFormat:@"%04x", v11 | (v10 << 8)];
        [v27 setObject:v29 forKeyedSubscript:@"systemCode"];

        id v30 = [(_NFReaderSession *)self currentTag];
        id v46 = 0;
        id v47 = 0;
        id v16 = [(_NFReaderSession *)self _getIDMFromTag:v30 systemCode:v8 outIdm:&v47 outPmm:&v46];
        id v31 = v47;
        id v32 = v46;

        if (v16)
        {
          char v33 = [(_NFReaderSession *)self currentTag];
          [v33 tagF];
          NSErrorUserInfoKey v35 = v34 = v28;
          uint64_t v36 = [v35 IDm];

          NSErrorUserInfoKey v37 = [(_NFReaderSession *)self currentTag];
          uint64_t v38 = [v37 tagF];
          uint64_t v39 = [v38 PMm];

          id v31 = (id)v36;
          id v32 = (id)v39;
          id v28 = v34;
        }
        [v27 setObject:v31 forKeyedSubscript:@"idm"];
        [v27 setObject:v32 forKeyedSubscript:@"pmm"];
        [v27 setObject:v28 forKeyedSubscript:@"areaCodeList"];
      }
      else
      {
        id v16 = 0;
        int v27 = 0;
      }
    }
  }
  else
  {
    int v27 = 0;
  }

  return v27;
}

- (BOOL)_isFelicaPollingCommand:(id)a3 systemCode:(id *)a4
{
  id v5 = a3;
  id v6 = (unsigned __int8 *)[v5 bytes];
  if (v6 && (id v7 = v6, v8 = (id)*v6, [v5 length] == v8) && !v7[1])
  {
    if (a4)
    {
      [v5 subdataWithRange:2, 2];
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    BOOL v9 = 1;
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (unsigned)_validateFelicaCommand:(id)a3
{
  id v5 = a3;
  id v6 = (unsigned __int8 *)[v5 bytes];
  id v7 = (id)*v6;
  if ([v5 length] == v7)
  {
    if (v6[1])
    {
      HIDWORD(v9) = v6[1];
      LODWORD(v9) = HIDWORD(v9) - 2;
      unsigned int v8 = v9 >> 1;
      BOOL v10 = v8 > 0x20;
      uint64_t v11 = (1 << v8) & 0x1F90001BFLL;
      if (!v10 && v11 != 0)
      {
        if ((unint64_t)[v5 length] <= 8)
        {
          dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          uint64_t Logger = NFLogGetLogger();
          if (Logger)
          {
            id v14 = (void (*)(uint64_t, const char *, ...))Logger;
            Class = object_getClass(self);
            BOOL isMetaClass = class_isMetaClass(Class);
            ClassName = object_getClassName(self);
            Name = sel_getName(a2);
            uint64_t v17 = 45;
            if (isMetaClass) {
              uint64_t v17 = 43;
            }
            v14(3, "%c[%{public}s %{public}s]:%i Invalid minimum length, packet: %{public}@", v17, ClassName, Name, 3422, v5);
          }
          dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          id v18 = NFSharedLogGetLogger();
          if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
            goto LABEL_50;
          }
          id v19 = object_getClass(self);
          if (class_isMetaClass(v19)) {
            int v20 = 43;
          }
          else {
            int v20 = 45;
          }
          *(_DWORD *)id buf = 67110146;
          int v60 = v20;
          __int16 v61 = 2082;
          int v62 = object_getClassName(self);
          __int16 v63 = 2082;
          int v64 = sel_getName(a2);
          __int16 v65 = 1024;
          int v66 = 3422;
          __int16 v67 = 2114;
          id v68 = v5;
          uint64_t v21 = "%c[%{public}s %{public}s]:%i Invalid minimum length, packet: %{public}@";
LABEL_49:
          _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, v21, buf, 0x2Cu);
LABEL_50:
          unsigned int v31 = 10;
LABEL_51:

          goto LABEL_52;
        }
        id v32 = [(_NFReaderSession *)self currentTag];
        char v33 = [v32 tagID];
        __int16 v34 = [v5 subdataWithRange:2, 8];
        unsigned __int8 v35 = [v33 isEqualToData:v34];

        if ((v35 & 1) == 0)
        {
          dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          uint64_t v43 = NFLogGetLogger();
          if (v43)
          {
            int v44 = (void (*)(uint64_t, const char *, ...))v43;
            id v45 = object_getClass(self);
            BOOL v46 = class_isMetaClass(v45);
            id v54 = object_getClassName(self);
            int v58 = sel_getName(a2);
            uint64_t v47 = 45;
            if (v46) {
              uint64_t v47 = 43;
            }
            v44(3, "%c[%{public}s %{public}s]:%i Invalid IDM, packet: %{public}@", v47, v54, v58, 3427, v5);
          }
          dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          id v18 = NFSharedLogGetLogger();
          if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
            goto LABEL_50;
          }
          id v48 = object_getClass(self);
          if (class_isMetaClass(v48)) {
            int v49 = 43;
          }
          else {
            int v49 = 45;
          }
          *(_DWORD *)id buf = 67110146;
          int v60 = v49;
          __int16 v61 = 2082;
          int v62 = object_getClassName(self);
          __int16 v63 = 2082;
          int v64 = sel_getName(a2);
          __int16 v65 = 1024;
          int v66 = 3427;
          __int16 v67 = 2114;
          id v68 = v5;
          uint64_t v21 = "%c[%{public}s %{public}s]:%i Invalid IDM, packet: %{public}@";
          goto LABEL_49;
        }
      }
    }
    else
    {
      if ([v5 length] != (id)6)
      {
        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        uint64_t v36 = NFLogGetLogger();
        if (v36)
        {
          NSErrorUserInfoKey v37 = (void (*)(uint64_t, const char *, ...))v36;
          uint64_t v38 = object_getClass(self);
          BOOL v39 = class_isMetaClass(v38);
          __int16 v53 = object_getClassName(self);
          __int16 v57 = sel_getName(a2);
          uint64_t v40 = 45;
          if (v39) {
            uint64_t v40 = 43;
          }
          v37(3, "%c[%{public}s %{public}s]:%i Invalid length, packet: %{public}@", v40, v53, v57, 3395, v5);
        }
        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        id v18 = NFSharedLogGetLogger();
        if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
          goto LABEL_50;
        }
        id v41 = object_getClass(self);
        if (class_isMetaClass(v41)) {
          int v42 = 43;
        }
        else {
          int v42 = 45;
        }
        *(_DWORD *)id buf = 67110146;
        int v60 = v42;
        __int16 v61 = 2082;
        int v62 = object_getClassName(self);
        __int16 v63 = 2082;
        int v64 = sel_getName(a2);
        __int16 v65 = 1024;
        int v66 = 3395;
        __int16 v67 = 2114;
        id v68 = v5;
        uint64_t v21 = "%c[%{public}s %{public}s]:%i Invalid length, packet: %{public}@";
        goto LABEL_49;
      }
      id v22 = [v5 subdataWithRange:2, 2];
      unsigned __int8 v23 = [(_NFReaderSession *)self validateSystemCode:v22];

      if ((v23 & 1) == 0)
      {
        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        uint64_t v24 = NFLogGetLogger();
        if (v24)
        {
          id v25 = (void (*)(uint64_t, const char *, ...))v24;
          id v26 = object_getClass(self);
          BOOL v27 = class_isMetaClass(v26);
          int v52 = object_getClassName(self);
          int v56 = sel_getName(a2);
          uint64_t v28 = 45;
          if (v27) {
            uint64_t v28 = 43;
          }
          v25(3, "%c[%{public}s %{public}s]:%i Invalid system code, packet: %{public}@", v28, v52, v56, 3400, v5);
        }
        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        id v18 = NFSharedLogGetLogger();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          id v29 = object_getClass(self);
          if (class_isMetaClass(v29)) {
            int v30 = 43;
          }
          else {
            int v30 = 45;
          }
          *(_DWORD *)id buf = 67110146;
          int v60 = v30;
          __int16 v61 = 2082;
          int v62 = object_getClassName(self);
          __int16 v63 = 2082;
          int v64 = sel_getName(a2);
          __int16 v65 = 1024;
          int v66 = 3400;
          __int16 v67 = 2114;
          id v68 = v5;
          _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Invalid system code, packet: %{public}@", buf, 0x2Cu);
        }
        unsigned int v31 = 32;
        goto LABEL_51;
      }
    }
  }
  unsigned int v31 = 0;
LABEL_52:

  return v31;
}

- (BOOL)_requiresTypeFUpdate:(id)a3
{
  id v4 = a3;
  if ([(_NFReaderSession *)self sessionConfig]) {
    unsigned int v5 = ([v4 technology] >> 2) & 1;
  }
  else {
    LOBYTE(v5) = 0;
  }

  return v5;
}

- (BOOL)_updateFelicaTagInfo:(id)a3 outError:(id *)a4
{
  id v6 = a3;
  if ([(_NFReaderSession *)self _requiresTypeFUpdate:v6])
  {
    id v7 = [(_NFReaderSession *)self _getSystemCodeListFromTag:v6 outError:a4];
    if ([v7 count])
    {
      [v6 _setSystemCodes:v7];
      unsigned int v8 = [v7 firstObject];
      [v6 _setSystemCode:v8];
    }
    if (a4) {
      LOBYTE(a4) = *a4 == 0;
    }
  }
  else
  {
    LOBYTE(a4) = 1;
  }

  return (char)a4;
}

- (unsigned)_refreshNdefTagConnection
{
  unsigned int v3 = sub_10018F854((uint64_t)self->_driverWrapper, self->_currentTag);
  if (v3 > 9 || ((1 << v3) & 0x248) == 0)
  {
    LODWORD(driverWrapper) = 0;
  }
  else
  {
    LODWORD(driverWrapper) = sub_1001900C4(self->_driverWrapper, self->_currentTag, 0);
    if (!driverWrapper)
    {
      driverWrapper = self->_driverWrapper;
      if (driverWrapper)
      {
        currentTag = self->_currentTag;
        LODWORD(driverWrapper) = sub_10018FAE8(driverWrapper, currentTag, 0);
      }
    }
  }
  return driverWrapper;
}

- (id)_readNdefMessageFromTag:(id)a3 rawLength:(unint64_t *)a4 error:(id *)a5
{
  id v9 = a3;
  if (a5) {
    *a5 = 0;
  }
  driverWrapper = self->_driverWrapper;
  if (driverWrapper)
  {
    int v11 = sub_10018FAE8(driverWrapper, v9, 0);
    if (v11)
    {
      if (!a5) {
        goto LABEL_50;
      }
      LODWORD(v12) = v11;
      int v13 = v11 & 0x6F;
      id v14 = objc_alloc((Class)NSError);
      id v15 = +[NSString stringWithUTF8String:"nfcd"];
      if (v13 == 35 || v12 == 64) {
        uint64_t v12 = v12;
      }
      else {
        uint64_t v12 = 21;
      }
      v46[0] = NSLocalizedDescriptionKey;
      uint64_t v17 = +[NSString stringWithUTF8String:off_100306978[v12]];
      v47[0] = v17;
      v47[1] = &off_10031DA88;
      v46[1] = @"Line";
      v46[2] = @"Method";
      id v18 = [objc_alloc((Class)NSString) initWithFormat:@"%s", sel_getName(a2)];
      v47[2] = v18;
      v46[3] = NSDebugDescriptionErrorKey;
      id v19 = [objc_alloc((Class)NSString) initWithFormat:@"%s:%d", sel_getName(a2), 3484];
      v47[3] = v19;
      int v20 = +[NSDictionary dictionaryWithObjects:v47 forKeys:v46 count:4];
      *a5 = [v14 initWithDomain:v15 code:v12 userInfo:v20];

      goto LABEL_48;
    }
    driverWrapper = self->_driverWrapper;
  }
  uint64_t v41 = 0;
  uint64_t v42 = 0;
  uint64_t v43 = 0;
  if (sub_100190624(driverWrapper, v9, &v41, (uint64_t)a5))
  {
    if ((_BYTE)v43)
    {
      id v15 = sub_100191E30(self->_driverWrapper, v9, v41, a5);
    }
    else
    {
      id v15 = 0;
    }
    uint64_t v22 = v41;
    BOOL v23 = v41 == 0;
    if (v41 && a5)
    {
      BOOL v23 = [*a5 code] == (id)49;
      uint64_t v22 = v41;
    }
    int v24 = !v23;
    if (!(_BYTE)v43) {
      int v24 = 1;
    }
    if (BYTE1(v43))
    {
      int v25 = 4;
    }
    else
    {
      int v24 = 1;
      int v25 = 3;
    }
    if ((_BYTE)v43) {
      unsigned int v26 = v25;
    }
    else {
      unsigned int v26 = 1;
    }
    if (v24) {
      uint64_t v21 = v26;
    }
    else {
      uint64_t v21 = 2;
    }
    if (v23) {
      uint64_t v27 = 0;
    }
    else {
      uint64_t v27 = v22;
    }
    [v9 _setNDEFMessageSize:v27];
    [v9 _setNDEFContainerSize:v42];
  }
  else
  {
    id v15 = 0;
    uint64_t v21 = 0;
  }
  [v9 _setNDEFAvailability:v21];
  if (!a5 || [*a5 code] != 51)
  {
    unsigned int v28 = sub_1001900C4(self->_driverWrapper, v9, 0);
    if (a5)
    {
      unsigned int v29 = v28;
      if (v28)
      {
        id v40 = objc_alloc((Class)NSError);
        int v30 = +[NSString stringWithUTF8String:"nfcd"];
        uint64_t v31 = v29;
        v44[0] = NSLocalizedDescriptionKey;
        if (v29 >= 0x47) {
          int v32 = 71;
        }
        else {
          int v32 = v29;
        }
        char v33 = +[NSString stringWithUTF8String:off_100306978[v32]];
        v45[0] = v33;
        v45[1] = &off_10031DAA0;
        v44[1] = @"Line";
        v44[2] = @"Method";
        id v34 = [objc_alloc((Class)NSString) initWithFormat:@"%s", sel_getName(a2)];
        v45[2] = v34;
        v44[3] = NSDebugDescriptionErrorKey;
        id v35 = [objc_alloc((Class)NSString) initWithFormat:@"%s:%d", sel_getName(a2), 3518];
        v45[3] = v35;
        uint64_t v36 = +[NSDictionary dictionaryWithObjects:v45 forKeys:v44 count:4];
        *a5 = [v40 initWithDomain:v30 code:v31 userInfo:v36];
      }
    }
  }
  if (v15)
  {
    id v37 = objc_alloc((Class)NFNdefMessageInternal);
    id v38 = v15;
    a5 = (id *)[v37 initWithBytes:[v38 bytes] length:[v38 length]];
    if (a4) {
      *a4 = (unint64_t)[v38 length];
    }
    goto LABEL_49;
  }
LABEL_48:
  a5 = 0;
LABEL_49:

LABEL_50:

  return a5;
}

- (BOOL)_selectFromTag:(id)a3 aid:(id)a4 resolvedAid:(id *)a5 error:(id *)a6
{
  id v11 = a3;
  id v12 = a4;
  if (a6) {
    *a6 = 0;
  }
  id v75 = 0;
  int v13 = [(_NFReaderSession *)self _selectTag:v11 aid:v12 p1:4 p2:0 shortLe:0 error:&v75];
  id v14 = v75;
  id v15 = v14;
  id v73 = a5;
  if (!v13 || v14)
  {
    id v69 = v12;
    id v72 = v11;
    if (v14)
    {
      __int16 v65 = a6;
      id v21 = [v14 code];
      id v22 = objc_alloc((Class)NSError);
      +[NSString stringWithUTF8String:"nfcd"];
      int v24 = v23 = v15;
      if (v21 == (id)64)
      {
        __int16 v63 = v22;
        id v25 = [v23 code];
        v86[0] = NSLocalizedDescriptionKey;
        if ((uint64_t)[v23 code] > 70) {
          uint64_t v26 = 71;
        }
        else {
          uint64_t v26 = (uint64_t)[v23 code];
        }
        __int16 v53 = +[NSString stringWithUTF8String:off_100306978[v26]];
        v87[0] = v53;
        v87[1] = v23;
        v86[1] = NSUnderlyingErrorKey;
        v86[2] = @"Line";
        v87[2] = &off_10031DAB8;
        v86[3] = @"Method";
        id v54 = [objc_alloc((Class)NSString) initWithFormat:@"%s", sel_getName(a2)];
        v87[3] = v54;
        void v86[4] = NSDebugDescriptionErrorKey;
        id v55 = [objc_alloc((Class)NSString) initWithFormat:@"%s:%d", sel_getName(a2), 3546];
        void v87[4] = v55;
        int v56 = +[NSDictionary dictionaryWithObjects:v87 forKeys:v86 count:5];
        id v20 = [v63 initWithDomain:v24 code:v25 userInfo:v56];

        id v17 = 0;
        id v12 = v69;
        id v35 = v73;
      }
      else
      {
        v84[0] = NSLocalizedDescriptionKey;
        uint64_t v43 = +[NSString stringWithUTF8String:"Tag Error"];
        v85[0] = v43;
        v85[1] = v23;
        v84[1] = NSUnderlyingErrorKey;
        v84[2] = @"Line";
        unsigned char v85[2] = &off_10031DAD0;
        v84[3] = @"Method";
        id v44 = [objc_alloc((Class)NSString) initWithFormat:@"%s", sel_getName(a2)];
        v85[3] = v44;
        void v84[4] = NSDebugDescriptionErrorKey;
        id v45 = [objc_alloc((Class)NSString) initWithFormat:@"%s:%d", sel_getName(a2), 3548];
        void v85[4] = v45;
        BOOL v46 = +[NSDictionary dictionaryWithObjects:v85 forKeys:v84 count:5];
        id v20 = [v22 initWithDomain:v24 code:29 userInfo:v46];

        id v35 = v73;
        id v12 = v69;

        id v17 = 0;
      }
      id v15 = v23;
      a6 = v65;
    }
    else
    {
      id v36 = objc_alloc((Class)NSError);
      id v37 = +[NSString stringWithUTF8String:"nfcd"];
      v82[0] = NSLocalizedDescriptionKey;
      id v38 = +[NSString stringWithUTF8String:"Tag Error"];
      v83[0] = v38;
      v83[1] = &off_10031DAE8;
      v82[1] = @"Line";
      v82[2] = @"Method";
      id v39 = [objc_alloc((Class)NSString) initWithFormat:@"%s", sel_getName(a2)];
      v83[2] = v39;
      v82[3] = NSDebugDescriptionErrorKey;
      id v40 = [objc_alloc((Class)NSString) initWithFormat:@"%s:%d", sel_getName(a2), 3551];
      v83[3] = v40;
      uint64_t v41 = +[NSDictionary dictionaryWithObjects:v83 forKeys:v82 count:4];
      uint64_t v42 = v36;
      id v12 = v69;
      id v20 = [v42 initWithDomain:v37 code:29 userInfo:v41];

      id v35 = v73;
      id v17 = 0;
    }
    goto LABEL_26;
  }
  if ((unint64_t)[v13 length] < 2)
  {
    id v72 = v11;
    int v66 = v13;
    id v27 = v12;
    id v28 = objc_alloc((Class)NSError);
    unsigned int v29 = +[NSString stringWithUTF8String:"nfcd"];
    v76[0] = NSLocalizedDescriptionKey;
    int v30 = +[NSString stringWithUTF8String:"Tag Error"];
    v77[0] = v30;
    v77[1] = &off_10031DB30;
    v76[1] = @"Line";
    v76[2] = @"Method";
    id v31 = [objc_alloc((Class)NSString) initWithFormat:@"%s", sel_getName(a2)];
    v77[2] = v31;
    v76[3] = NSDebugDescriptionErrorKey;
    id v32 = [objc_alloc((Class)NSString) initWithFormat:@"%s:%d", sel_getName(a2), 3570];
    v77[3] = v32;
    char v33 = +[NSDictionary dictionaryWithObjects:v77 forKeys:v76 count:4];
    id v34 = v28;
    id v12 = v27;
    int v13 = v66;
    id v20 = [v34 initWithDomain:v29 code:29 userInfo:v33];

    id v17 = 0;
LABEL_16:
    id v35 = v73;
LABEL_26:
    if (v35) {
      *id v35 = v17;
    }
    id v11 = v72;
    if (a6) {
      *a6 = v20;
    }
    BOOL v52 = v20 == 0;
    goto LABEL_31;
  }
  id v74 = 0;
  unsigned __int8 v16 = [(_NFReaderSession *)self validateAID:v12 withSelectResponse:v13 outRealAid:&v74];
  id v17 = v74;
  if (v16)
  {
    id v18 = v13;
    id v19 = (char *)[v18 bytes];
    id v72 = v11;
    if (*(_WORD *)&v19[(void)[v18 length] - 2] == 144)
    {
      if (!v17) {
        id v17 = v12;
      }
      id v20 = 0;
    }
    else
    {
      id v68 = objc_alloc((Class)NSError);
      int v58 = +[NSString stringWithUTF8String:"nfcd"];
      v78[0] = NSLocalizedDescriptionKey;
      +[NSString stringWithUTF8String:"Tag Not Found"];
      v59 = id v71 = v12;
      v79[0] = v59;
      v79[1] = &off_10031DB18;
      v78[1] = @"Line";
      v78[2] = @"Method";
      id v60 = [objc_alloc((Class)NSString) initWithFormat:@"%s", sel_getName(a2)];
      v79[2] = v60;
      v78[3] = NSDebugDescriptionErrorKey;
      id v61 = [objc_alloc((Class)NSString) initWithFormat:@"%s:%d", sel_getName(a2), 3565];
      v79[3] = v61;
      int v62 = +[NSDictionary dictionaryWithObjects:v79 forKeys:v78 count:4];
      id v20 = [v68 initWithDomain:v58 code:28 userInfo:v62];

      id v12 = v71;
    }
    goto LABEL_16;
  }
  if (a6)
  {
    id v67 = objc_alloc((Class)NSError);
    int v64 = +[NSString stringWithUTF8String:"nfcd"];
    v80[0] = NSLocalizedDescriptionKey;
    +[NSString stringWithUTF8String:"Security Violation"];
    v47 = id v70 = v12;
    v81[0] = v47;
    v81[1] = &off_10031DB00;
    v80[1] = @"Line";
    v80[2] = @"Method";
    id v48 = v11;
    id v49 = [objc_alloc((Class)NSString) initWithFormat:@"%s", sel_getName(a2)];
    v81[2] = v49;
    v80[3] = NSDebugDescriptionErrorKey;
    id v50 = [objc_alloc((Class)NSString) initWithFormat:@"%s:%d", sel_getName(a2), 3557];
    v81[3] = v50;
    long long v51 = +[NSDictionary dictionaryWithObjects:v81 forKeys:v80 count:4];
    *a6 = [v67 initWithDomain:v64 code:8 userInfo:v51];

    id v11 = v48;
    id v12 = v70;
  }
  if (v73)
  {
    id v17 = v17;
    id v20 = 0;
    BOOL v52 = 0;
    id *v73 = v17;
  }
  else
  {
    id v20 = 0;
    BOOL v52 = 0;
  }
LABEL_31:

  return v52;
}

- (id)_selectTag:(id)a3 aid:(id)a4 p1:(unsigned __int8)a5 p2:(unsigned __int8)a6 shortLe:(char)a7 error:(id *)a8
{
  int v9 = a7;
  if (a8) {
    *a8 = 0;
  }
  __int16 v38 = -23552;
  unsigned __int8 v39 = a5;
  unsigned __int8 v40 = a6;
  id v13 = a4;
  id v14 = a3;
  unsigned __int8 v41 = [v13 length];
  id v15 = [objc_alloc((Class)NSMutableData) initWithBytes:&v38 length:5];
  [v15 appendData:v13];

  if ((v9 & 0x80000000) == 0)
  {
    char v37 = v9;
    [v15 appendBytes:&v37 length:1];
  }
  unsigned __int8 v16 = [(_NFReaderSession *)self driverWrapper];
  id v17 = [(_NFReaderSession *)self whitelistChecker];
  [v17 sessionTimeLimit];
  id v36 = 0;
  id v18 = sub_100195A20(v16, v15, v14, &v36);

  id v19 = v36;
  if (a8 && (!v18 || v19))
  {
    if (v19)
    {
      id v20 = [v19 code];
      id v21 = objc_alloc((Class)NSError);
      id v22 = +[NSString stringWithUTF8String:"nfcd"];
      if (v20 == (id)64)
      {
        id v35 = [v19 code];
        v46[0] = NSLocalizedDescriptionKey;
        if ((uint64_t)[v19 code] > 70) {
          uint64_t v23 = 71;
        }
        else {
          uint64_t v23 = (uint64_t)[v19 code];
        }
        int v24 = +[NSString stringWithUTF8String:off_100306978[v23]];
        v47[0] = v24;
        v47[1] = v19;
        v46[1] = NSUnderlyingErrorKey;
        v46[2] = @"Line";
        v47[2] = &off_10031DB48;
        v46[3] = @"Method";
        id v25 = [objc_alloc((Class)NSString) initWithFormat:@"%s", sel_getName(a2)];
        v47[3] = v25;
        void v46[4] = NSDebugDescriptionErrorKey;
        id v26 = [objc_alloc((Class)NSString) initWithFormat:@"%s:%d", sel_getName(a2), 3607];
        void v47[4] = v26;
        int v30 = +[NSDictionary dictionaryWithObjects:v47 forKeys:v46 count:5];
        id v31 = v21;
        id v32 = v22;
        uint64_t v33 = (uint64_t)v35;
        goto LABEL_17;
      }
      v44[0] = NSLocalizedDescriptionKey;
      int v24 = +[NSString stringWithUTF8String:"Tag Error"];
      v45[0] = v24;
      v45[1] = v19;
      v44[1] = NSUnderlyingErrorKey;
      v44[2] = @"Line";
      v45[2] = &off_10031DB60;
      v44[3] = @"Method";
      id v25 = [objc_alloc((Class)NSString) initWithFormat:@"%s", sel_getName(a2)];
      v45[3] = v25;
      void v44[4] = NSDebugDescriptionErrorKey;
      id v26 = [objc_alloc((Class)NSString) initWithFormat:@"%s:%d", sel_getName(a2), 3609];
      void v45[4] = v26;
      id v27 = v45;
      id v28 = v44;
      uint64_t v29 = 5;
    }
    else
    {
      id v21 = objc_alloc((Class)NSError);
      id v22 = +[NSString stringWithUTF8String:"nfcd"];
      v42[0] = NSLocalizedDescriptionKey;
      int v24 = +[NSString stringWithUTF8String:"Tag Error"];
      v43[0] = v24;
      v43[1] = &off_10031DB78;
      v42[1] = @"Line";
      v42[2] = @"Method";
      id v25 = [objc_alloc((Class)NSString) initWithFormat:@"%s", sel_getName(a2)];
      v43[2] = v25;
      v42[3] = NSDebugDescriptionErrorKey;
      id v26 = [objc_alloc((Class)NSString) initWithFormat:@"%s:%d", sel_getName(a2), 3612];
      v43[3] = v26;
      id v27 = v43;
      id v28 = v42;
      uint64_t v29 = 4;
    }
    int v30 = +[NSDictionary dictionaryWithObjects:v27 forKeys:v28 count:v29];
    id v31 = v21;
    id v32 = v22;
    uint64_t v33 = 29;
LABEL_17:
    *a8 = [v31 initWithDomain:v32 code:v33 userInfo:v30];
  }

  return v18;
}

- (unsigned)_validateAPDU:(id)a3 outCheckFciResponse:(BOOL *)a4
{
  id v7 = a3;
  if (!v7)
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      id v31 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      id v36 = [0 description];
      uint64_t v37 = 45;
      if (isMetaClass) {
        uint64_t v37 = 43;
      }
      v31(3, "%c[%{public}s %{public}s]:%i Invalid APDU: %{public}@", v37, ClassName, Name, 3624, v36);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    __int16 v38 = NFSharedLogGetLogger();
    if (!os_log_type_enabled(v38, OS_LOG_TYPE_ERROR)) {
      goto LABEL_69;
    }
    unsigned __int8 v39 = object_getClass(self);
    if (class_isMetaClass(v39)) {
      int v40 = 43;
    }
    else {
      int v40 = 45;
    }
    unsigned __int8 v41 = object_getClassName(self);
    uint64_t v42 = sel_getName(a2);
    uint64_t v43 = [0 description];
    *(_DWORD *)id buf = 67110146;
    int v124 = v40;
    __int16 v125 = 2082;
    v126 = v41;
    __int16 v127 = 2082;
    id v128 = v42;
    __int16 v129 = 1024;
    int v130 = 3624;
    __int16 v131 = 2114;
    int v132 = v43;
    id v44 = "%c[%{public}s %{public}s]:%i Invalid APDU: %{public}@";
    goto LABEL_67;
  }
  unsigned __int8 v8 = [(_NFReaderSession *)self sessionConfig];
  unsigned int v9 = [v7 clss];
  char v10 = v9;
  if ((v8 & 8) != 0)
  {
    if (v9 || [v7 instruction] != 164)
    {
      if ([v7 clss] == 128 && objc_msgSend(v7, "instruction") == 202)
      {
        if ([v7 p1] == 1)
        {
          if (![v7 p2] || objc_msgSend(v7, "p2") == 1) {
            goto LABEL_90;
          }
          dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          uint64_t v57 = NFLogGetLogger();
          if (v57)
          {
            int v58 = (void (*)(uint64_t, const char *, ...))v57;
            __int16 v59 = object_getClass(self);
            BOOL v60 = class_isMetaClass(v59);
            id v61 = object_getClassName(self);
            int v62 = sel_getName(a2);
            __int16 v63 = [v7 description];
            uint64_t v64 = 45;
            if (v60) {
              uint64_t v64 = 43;
            }
            v58(3, "%c[%{public}s %{public}s]:%i Invalid P2 parameter: %{public}@", v64, v61, v62, 3652, v63);
          }
          dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          __int16 v38 = NFSharedLogGetLogger();
          if (!os_log_type_enabled(v38, OS_LOG_TYPE_ERROR)) {
            goto LABEL_69;
          }
          __int16 v65 = object_getClass(self);
          if (class_isMetaClass(v65)) {
            int v66 = 43;
          }
          else {
            int v66 = 45;
          }
          id v67 = object_getClassName(self);
          id v68 = sel_getName(a2);
          uint64_t v43 = [v7 description];
          *(_DWORD *)id buf = 67110146;
          int v124 = v66;
          __int16 v125 = 2082;
          v126 = v67;
          __int16 v127 = 2082;
          id v128 = v68;
          __int16 v129 = 1024;
          int v130 = 3652;
          __int16 v131 = 2114;
          int v132 = v43;
          id v44 = "%c[%{public}s %{public}s]:%i Invalid P2 parameter: %{public}@";
        }
        else
        {
          dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          uint64_t v81 = NFLogGetLogger();
          if (v81)
          {
            id v82 = (void (*)(uint64_t, const char *, ...))v81;
            id v83 = object_getClass(self);
            BOOL v84 = class_isMetaClass(v83);
            __int16 v85 = object_getClassName(self);
            long long v86 = sel_getName(a2);
            long long v87 = [v7 description];
            uint64_t v88 = 45;
            if (v84) {
              uint64_t v88 = 43;
            }
            v82(3, "%c[%{public}s %{public}s]:%i Invalid P1 parameter: %{public}@", v88, v85, v86, 3648, v87);
          }
          dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          __int16 v38 = NFSharedLogGetLogger();
          if (!os_log_type_enabled(v38, OS_LOG_TYPE_ERROR)) {
            goto LABEL_69;
          }
          long long v89 = object_getClass(self);
          if (class_isMetaClass(v89)) {
            int v90 = 43;
          }
          else {
            int v90 = 45;
          }
          uint64_t v91 = object_getClassName(self);
          int v92 = sel_getName(a2);
          uint64_t v43 = [v7 description];
          *(_DWORD *)id buf = 67110146;
          int v124 = v90;
          __int16 v125 = 2082;
          v126 = v91;
          __int16 v127 = 2082;
          id v128 = v92;
          __int16 v129 = 1024;
          int v130 = 3648;
          __int16 v131 = 2114;
          int v132 = v43;
          id v44 = "%c[%{public}s %{public}s]:%i Invalid P1 parameter: %{public}@";
        }
      }
      else
      {
        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        uint64_t v69 = NFLogGetLogger();
        if (v69)
        {
          id v70 = (void (*)(uint64_t, const char *, ...))v69;
          id v71 = object_getClass(self);
          BOOL v72 = class_isMetaClass(v71);
          id v73 = object_getClassName(self);
          id v74 = sel_getName(a2);
          id v75 = [v7 description];
          uint64_t v76 = 45;
          if (v72) {
            uint64_t v76 = 43;
          }
          v70(3, "%c[%{public}s %{public}s]:%i Invalid APDU: %{public}@", v76, v73, v74, 3656, v75);
        }
        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        __int16 v38 = NFSharedLogGetLogger();
        if (!os_log_type_enabled(v38, OS_LOG_TYPE_ERROR)) {
          goto LABEL_69;
        }
        int v77 = object_getClass(self);
        if (class_isMetaClass(v77)) {
          int v78 = 43;
        }
        else {
          int v78 = 45;
        }
        unsigned int v79 = object_getClassName(self);
        id v80 = sel_getName(a2);
        uint64_t v43 = [v7 description];
        *(_DWORD *)id buf = 67110146;
        int v124 = v78;
        __int16 v125 = 2082;
        v126 = v79;
        __int16 v127 = 2082;
        id v128 = v80;
        __int16 v129 = 1024;
        int v130 = 3656;
        __int16 v131 = 2114;
        int v132 = v43;
        id v44 = "%c[%{public}s %{public}s]:%i Invalid APDU: %{public}@";
      }
    }
    else
    {
      if ([v7 p1] == 4)
      {
        if ([v7 p2])
        {
          dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          uint64_t v45 = NFLogGetLogger();
          if (v45)
          {
            BOOL v46 = (void (*)(uint64_t, const char *, ...))v45;
            uint64_t v47 = object_getClass(self);
            BOOL v48 = class_isMetaClass(v47);
            id v49 = object_getClassName(self);
            id v50 = sel_getName(a2);
            long long v51 = [v7 description];
            uint64_t v52 = 45;
            if (v48) {
              uint64_t v52 = 43;
            }
            v46(3, "%c[%{public}s %{public}s]:%i Invalid P2 parameter: %{public}@", v52, v49, v50, 3635, v51);
          }
          dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          __int16 v38 = NFSharedLogGetLogger();
          if (!os_log_type_enabled(v38, OS_LOG_TYPE_ERROR)) {
            goto LABEL_69;
          }
          __int16 v53 = object_getClass(self);
          if (class_isMetaClass(v53)) {
            int v54 = 43;
          }
          else {
            int v54 = 45;
          }
          id v55 = object_getClassName(self);
          int v56 = sel_getName(a2);
          uint64_t v43 = [v7 description];
          *(_DWORD *)id buf = 67110146;
          int v124 = v54;
          __int16 v125 = 2082;
          v126 = v55;
          __int16 v127 = 2082;
          id v128 = v56;
          __int16 v129 = 1024;
          int v130 = 3635;
          __int16 v131 = 2114;
          int v132 = v43;
          id v44 = "%c[%{public}s %{public}s]:%i Invalid P2 parameter: %{public}@";
          goto LABEL_67;
        }
        __int16 v122 = 12592;
        uint64_t v121 = *(void *)"OSE.VAS.01";
        __int16 v38 = [objc_alloc((Class)NSData) initWithBytes:&v121 length:10];
        int v105 = [v7 payload];
        unsigned __int8 v106 = [v105 isEqualToData:v38];

        if ((v106 & 1) == 0)
        {
          dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          uint64_t v108 = NFLogGetLogger();
          if (v108)
          {
            long long v109 = (void (*)(uint64_t, const char *, ...))v108;
            __int16 v110 = object_getClass(self);
            BOOL v111 = class_isMetaClass(v110);
            long long v112 = object_getClassName(self);
            id v113 = sel_getName(a2);
            __int16 v114 = [v7 description];
            uint64_t v115 = 45;
            if (v111) {
              uint64_t v115 = 43;
            }
            v109(3, "%c[%{public}s %{public}s]:%i Invalid AID for selection: %{public}@", v115, v112, v113, 3643, v114);
          }
          dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          uint64_t v43 = NFSharedLogGetLogger();
          if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
          {
            __int16 v116 = object_getClass(self);
            if (class_isMetaClass(v116)) {
              int v117 = 43;
            }
            else {
              int v117 = 45;
            }
            __int16 v118 = object_getClassName(self);
            int v119 = sel_getName(a2);
            __int16 v120 = [v7 description];
            *(_DWORD *)id buf = 67110146;
            int v124 = v117;
            __int16 v125 = 2082;
            v126 = v118;
            __int16 v127 = 2082;
            id v128 = v119;
            __int16 v129 = 1024;
            int v130 = 3643;
            __int16 v131 = 2114;
            int v132 = v120;
            _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Invalid AID for selection: %{public}@", buf, 0x2Cu);
          }
          goto LABEL_68;
        }

LABEL_90:
        unsigned int v15 = 0;
        goto LABEL_91;
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      uint64_t v93 = NFLogGetLogger();
      if (v93)
      {
        id v94 = (void (*)(uint64_t, const char *, ...))v93;
        __int16 v95 = object_getClass(self);
        BOOL v96 = class_isMetaClass(v95);
        __int16 v97 = object_getClassName(self);
        int v98 = sel_getName(a2);
        __int16 v99 = [v7 description];
        uint64_t v100 = 45;
        if (v96) {
          uint64_t v100 = 43;
        }
        v94(3, "%c[%{public}s %{public}s]:%i Invalid P1 parameter: %{public}@", v100, v97, v98, 3631, v99);
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      __int16 v38 = NFSharedLogGetLogger();
      if (!os_log_type_enabled(v38, OS_LOG_TYPE_ERROR)) {
        goto LABEL_69;
      }
      NSErrorUserInfoKey v101 = object_getClass(self);
      if (class_isMetaClass(v101)) {
        int v102 = 43;
      }
      else {
        int v102 = 45;
      }
      __int16 v103 = object_getClassName(self);
      int v104 = sel_getName(a2);
      uint64_t v43 = [v7 description];
      *(_DWORD *)id buf = 67110146;
      int v124 = v102;
      __int16 v125 = 2082;
      v126 = v103;
      __int16 v127 = 2082;
      id v128 = v104;
      __int16 v129 = 1024;
      int v130 = 3631;
      __int16 v131 = 2114;
      int v132 = v43;
      id v44 = "%c[%{public}s %{public}s]:%i Invalid P1 parameter: %{public}@";
    }
LABEL_67:
    _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_ERROR, v44, buf, 0x2Cu);
LABEL_68:

LABEL_69:
    unsigned int v15 = 10;
    goto LABEL_91;
  }
  unsigned int v11 = [v7 clss];
  if ((v10 & 0x40) != 0) {
    int v12 = 32;
  }
  else {
    int v12 = 12;
  }
  if ((v11 & v12) != 0
    || [v7 instruction] != 164
    || [v7 p1] != 4)
  {
    goto LABEL_90;
  }
  if (a4) {
    *a4 = ([v7 p2] & 0xC) == 0;
  }
  id v13 = [v7 payload];
  int64_t v14 = [(_NFReaderSession *)self validateAID:v13 allowsPrefixMatch:0];

  unsigned int v15 = 0;
  if ((v14 & 0xFFFFFFFFFFFFFFFBLL) == 0)
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v16 = NFLogGetLogger();
    if (v16)
    {
      id v17 = (void (*)(uint64_t, const char *, ...))v16;
      id v18 = object_getClass(self);
      BOOL v19 = class_isMetaClass(v18);
      id v20 = object_getClassName(self);
      id v21 = sel_getName(a2);
      id v22 = [v7 description];
      uint64_t v23 = 45;
      if (v19) {
        uint64_t v23 = 43;
      }
      v17(3, "%c[%{public}s %{public}s]:%i Invalid AID selection: %{public}@", v23, v20, v21, 3684, v22);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    int v24 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      id v25 = object_getClass(self);
      if (class_isMetaClass(v25)) {
        int v26 = 43;
      }
      else {
        int v26 = 45;
      }
      id v27 = object_getClassName(self);
      id v28 = sel_getName(a2);
      uint64_t v29 = [v7 description];
      *(_DWORD *)id buf = 67110146;
      int v124 = v26;
      __int16 v125 = 2082;
      v126 = v27;
      __int16 v127 = 2082;
      id v128 = v28;
      __int16 v129 = 1024;
      int v130 = 3684;
      __int16 v131 = 2114;
      int v132 = v29;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Invalid AID selection: %{public}@", buf, 0x2Cu);
    }
    unsigned int v15 = 32;
  }
LABEL_91:

  return v15;
}

- (BOOL)_findAppFromSet:(id)a3 tag:(id)a4 foundApp:(id *)a5 outError:(id *)a6
{
  id v11 = a3;
  id v12 = a4;
  if (![v11 count]
    || [v12 type] == 14
    || [v12 type] == 13
    || [v12 type] == 9)
  {
    LOBYTE(v13) = 0;
    goto LABEL_6;
  }
  sel = a2;
  __int16 v63 = a6;
  long long v76 = 0u;
  long long v77 = 0u;
  long long v74 = 0u;
  long long v75 = 0u;
  id obj = v11;
  id v15 = [obj countByEnumeratingWithState:&v74 objects:v92 count:16];
  BOOL v13 = v15 != 0;
  id v67 = self;
  if (!v15)
  {
    uint64_t v23 = 0;
LABEL_34:

    goto LABEL_40;
  }
  id v16 = v15;
  id v61 = a5;
  id v17 = 0;
  uint64_t v65 = *(void *)v75;
LABEL_9:
  uint64_t v18 = 0;
  while (1)
  {
    if (*(void *)v75 != v65) {
      objc_enumerationMutation(obj);
    }
    BOOL v19 = *(void **)(*((void *)&v74 + 1) + 8 * v18);
    if ([v19 type] == (id)2) {
      break;
    }
    if ([v19 type] == (id)3)
    {
      int v24 = [v19 aid];
      id v70 = 0;
      id v71 = v17;
      unsigned int v25 = [(_NFReaderSession *)self selectPRCIDApp:v24 fromTag:v12 resolvedAid:&v71 outError:&v70];
      id v22 = v71;

      uint64_t v23 = v70;
      if (v25)
      {
        nonstandard7816TagsFound = v67->_nonstandard7816TagsFound;
        v88[0] = @"type";
        v88[1] = @"uid";
        v89[0] = &off_10031DBA8;
        uint64_t v33 = [v12 UID];
        v89[1] = v33;
        id v35 = +[NSDictionary dictionaryWithObjects:v89 forKeys:v88 count:2];
        [(NSMutableArray *)nonstandard7816TagsFound addObject:v35];

        goto LABEL_38;
      }
      goto LABEL_17;
    }
    if ([v19 type] == (id)1)
    {
      int v26 = [v19 aid];
      id v68 = 0;
      id v69 = v17;
      unsigned int v27 = [(_NFReaderSession *)self _selectFromTag:v12 aid:v26 resolvedAid:&v69 error:&v68];
      id v22 = v69;

      uint64_t v23 = v68;
      if (v27 && !v23)
      {
        BOOL v13 = 1;
        goto LABEL_32;
      }

      if (v27)
      {
        a5 = v61;
        goto LABEL_34;
      }
      id v17 = 0;
      goto LABEL_18;
    }
    uint64_t v23 = 0;
LABEL_19:
    if ([v23 code] == (id)51 || [v23 code] == (id)64) {
      goto LABEL_31;
    }

    if (v16 == (id)++v18)
    {
      id v28 = [obj countByEnumeratingWithState:&v74 objects:v92 count:16];
      id v16 = v28;
      if (!v28)
      {
        uint64_t v23 = 0;
LABEL_31:
        BOOL v13 = 0;
        id v22 = v17;
LABEL_32:
        a5 = v61;
        goto LABEL_39;
      }
      goto LABEL_9;
    }
  }
  id v20 = [v19 aid];
  id v72 = 0;
  id v73 = v17;
  unsigned int v21 = [(_NFReaderSession *)self selectPaceApp:v20 fromTag:v12 resolvedAid:&v73 outError:&v72];
  id v22 = v73;

  uint64_t v23 = v72;
  if (!v21)
  {
LABEL_17:
    id v17 = v22;
LABEL_18:
    self = v67;
    goto LABEL_19;
  }
  uint64_t v29 = v67->_nonstandard7816TagsFound;
  v91[0] = &off_10031DB90;
  v90[0] = @"type";
  v90[1] = @"uid";
  int v30 = [v12 UID];
  v91[1] = v30;
  id v31 = +[NSDictionary dictionaryWithObjects:v91 forKeys:v90 count:2];
  [(NSMutableArray *)v29 addObject:v31];

  uint64_t v32 = sub_10023D968();
  uint64_t v33 = (void *)v32;
  if (v32) {
    *(unsigned char *)(v32 + 156) = 1;
  }
LABEL_38:
  a5 = v61;

  BOOL v13 = 1;
LABEL_39:

  id v36 = v23;
  if (v22) {
    goto LABEL_52;
  }
LABEL_40:
  if ([v23 code] == (id)28)
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      __int16 v38 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(v67);
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(v67);
      Name = sel_getName(sel);
      uint64_t v42 = 45;
      if (isMetaClass) {
        uint64_t v42 = 43;
      }
      v38(6, "%c[%{public}s %{public}s]:%i Application(s) not found", v42, ClassName, Name, 3741);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v43 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
    {
      id v44 = object_getClass(v67);
      if (class_isMetaClass(v44)) {
        int v45 = 43;
      }
      else {
        int v45 = 45;
      }
      BOOL v46 = object_getClassName(v67);
      uint64_t v47 = sel_getName(sel);
      *(_DWORD *)id buf = 67109890;
      int v79 = v45;
      __int16 v80 = 2082;
      uint64_t v81 = v46;
      __int16 v82 = 2082;
      id v83 = v47;
      __int16 v84 = 1024;
      int v85 = 3741;
      _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Application(s) not found", buf, 0x22u);
    }

    id v22 = 0;
    id v36 = 0;
    goto LABEL_63;
  }
  id v22 = 0;
  id v36 = v23;
LABEL_52:
  if (v13)
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v48 = NFLogGetLogger();
    if (v48)
    {
      id v49 = (void (*)(uint64_t, const char *, ...))v48;
      id v50 = object_getClass(v67);
      BOOL v51 = class_isMetaClass(v50);
      int v66 = object_getClassName(v67);
      uint64_t v52 = sel_getName(sel);
      __int16 v53 = [v22 NF_asHexString];
      uint64_t v54 = 45;
      if (v51) {
        uint64_t v54 = 43;
      }
      v49(6, "%c[%{public}s %{public}s]:%i Found app: %{public}@", v54, v66, v52, 3744, v53);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v23 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      id v55 = object_getClass(v67);
      if (class_isMetaClass(v55)) {
        int v56 = 43;
      }
      else {
        int v56 = 45;
      }
      uint64_t v57 = object_getClassName(v67);
      int v58 = sel_getName(sel);
      __int16 v59 = [v22 NF_asHexString];
      *(_DWORD *)id buf = 67110146;
      int v79 = v56;
      __int16 v80 = 2082;
      uint64_t v81 = v57;
      __int16 v82 = 2082;
      id v83 = v58;
      __int16 v84 = 1024;
      int v85 = 3744;
      __int16 v86 = 2114;
      long long v87 = v59;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Found app: %{public}@", buf, 0x2Cu);
    }
    LOBYTE(v13) = 1;
LABEL_63:
  }
  if (v63) {
    *__int16 v63 = v36;
  }
  if (a5) {
    *a5 = v22;
  }

LABEL_6:
  return v13;
}

- (unsigned)_validateISO15693Packet:(id)a3
{
  id v5 = a3;
  id v6 = (char *)[v5 bytes];
  if ((unint64_t)[v5 length] < 2)
  {
LABEL_2:
    unsigned int v7 = 0;
    goto LABEL_146;
  }
  char v8 = *v6;
  uint64_t v9 = v6[1];
  uint64_t v10 = v6[2];
  uint64_t v11 = 8 * ((*v6 & 0x24) == 32);
  switch(v6[1])
  {
    case 1:
      __int16 v63 = [(_NFReaderSession *)self whitelistChecker];
      unsigned int v64 = [v63 nfcISO15693ReaderAccess];

      if (v64) {
        unsigned int v7 = 0;
      }
      else {
        unsigned int v7 = 32;
      }
      goto LABEL_146;
    case 2:
    case 37:
      if ([v5 length] == (id)10) {
        goto LABEL_132;
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      uint64_t Logger = NFLogGetLogger();
      if (Logger)
      {
        uint64_t v57 = (void (*)(uint64_t, const char *, ...))Logger;
        Class = object_getClass(self);
        BOOL isMetaClass = class_isMetaClass(Class);
        ClassName = object_getClassName(self);
        Name = sel_getName(a2);
        uint64_t v60 = 45;
        if (isMetaClass) {
          uint64_t v60 = 43;
        }
        v57(3, "%c[%{public}s %{public}s]:%i Invalid packet length ,packet: %{public}@", v60, ClassName, Name, 3819, v5);
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      id v17 = NFSharedLogGetLogger();
      if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        goto LABEL_145;
      }
      id v61 = object_getClass(self);
      if (class_isMetaClass(v61)) {
        int v62 = 43;
      }
      else {
        int v62 = 45;
      }
      *(_DWORD *)id buf = 67110146;
      int v144 = v62;
      __int16 v145 = 2082;
      id v146 = object_getClassName(self);
      __int16 v147 = 2082;
      v148 = sel_getName(a2);
      __int16 v149 = 1024;
      int v150 = 3819;
      __int16 v151 = 2114;
      *(void *)__int16 v152 = v5;
      id v20 = "%c[%{public}s %{public}s]:%i Invalid packet length ,packet: %{public}@";
      goto LABEL_118;
    case 32:
    case 34:
    case 39:
    case 41:
      if ([v5 length] == (id)(v11 | 3)) {
        goto LABEL_132;
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      uint64_t v28 = NFLogGetLogger();
      if (v28)
      {
        uint64_t v29 = (void (*)(uint64_t, const char *, ...))v28;
        int v30 = object_getClass(self);
        BOOL v31 = class_isMetaClass(v30);
        uint64_t v121 = object_getClassName(self);
        int v132 = sel_getName(a2);
        uint64_t v32 = 45;
        if (v31) {
          uint64_t v32 = 43;
        }
        v29(3, "%c[%{public}s %{public}s]:%i Invalid packet length ,packet: %{public}@", v32, v121, v132, 3853, v5);
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      id v17 = NFSharedLogGetLogger();
      if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        goto LABEL_145;
      }
      uint64_t v33 = object_getClass(self);
      if (class_isMetaClass(v33)) {
        int v34 = 43;
      }
      else {
        int v34 = 45;
      }
      *(_DWORD *)id buf = 67110146;
      int v144 = v34;
      __int16 v145 = 2082;
      id v146 = object_getClassName(self);
      __int16 v147 = 2082;
      v148 = sel_getName(a2);
      __int16 v149 = 1024;
      int v150 = 3853;
      __int16 v151 = 2114;
      *(void *)__int16 v152 = v5;
      id v20 = "%c[%{public}s %{public}s]:%i Invalid packet length ,packet: %{public}@";
      goto LABEL_118;
    case 33:
    case 53:
    case 54:
    case 57:
      if ((unint64_t)[v5 length] >= (v11 | 3uLL)) {
        goto LABEL_132;
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      uint64_t v35 = NFLogGetLogger();
      if (v35)
      {
        id v36 = (void (*)(uint64_t, const char *, ...))v35;
        uint64_t v37 = object_getClass(self);
        BOOL v38 = class_isMetaClass(v37);
        __int16 v122 = object_getClassName(self);
        long long v133 = sel_getName(a2);
        uint64_t v39 = 45;
        if (v38) {
          uint64_t v39 = 43;
        }
        v36(3, "%c[%{public}s %{public}s]:%i Invalid packet length ,packet: %{public}@", v39, v122, v133, 3865, v5);
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      id v17 = NFSharedLogGetLogger();
      if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        goto LABEL_145;
      }
      int v40 = object_getClass(self);
      if (class_isMetaClass(v40)) {
        int v41 = 43;
      }
      else {
        int v41 = 45;
      }
      *(_DWORD *)id buf = 67110146;
      int v144 = v41;
      __int16 v145 = 2082;
      id v146 = object_getClassName(self);
      __int16 v147 = 2082;
      v148 = sel_getName(a2);
      __int16 v149 = 1024;
      int v150 = 3865;
      __int16 v151 = 2114;
      *(void *)__int16 v152 = v5;
      id v20 = "%c[%{public}s %{public}s]:%i Invalid packet length ,packet: %{public}@";
      goto LABEL_118;
    case 35:
    case 44:
    case 45:
    case 48:
    case 50:
      if ([v5 length] == (id)(v11 | 4)) {
        goto LABEL_132;
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      uint64_t v12 = NFLogGetLogger();
      if (v12)
      {
        BOOL v13 = (void (*)(uint64_t, const char *, ...))v12;
        int64_t v14 = object_getClass(self);
        BOOL v15 = class_isMetaClass(v14);
        int v119 = object_getClassName(self);
        int v130 = sel_getName(a2);
        uint64_t v16 = 45;
        if (v15) {
          uint64_t v16 = 43;
        }
        v13(3, "%c[%{public}s %{public}s]:%i Invalid packet length ,packet: %{public}@", v16, v119, v130, 3878, v5);
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      id v17 = NFSharedLogGetLogger();
      if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        goto LABEL_145;
      }
      uint64_t v18 = object_getClass(self);
      if (class_isMetaClass(v18)) {
        int v19 = 43;
      }
      else {
        int v19 = 45;
      }
      *(_DWORD *)id buf = 67110146;
      int v144 = v19;
      __int16 v145 = 2082;
      id v146 = object_getClassName(self);
      __int16 v147 = 2082;
      v148 = sel_getName(a2);
      __int16 v149 = 1024;
      int v150 = 3878;
      __int16 v151 = 2114;
      *(void *)__int16 v152 = v5;
      id v20 = "%c[%{public}s %{public}s]:%i Invalid packet length ,packet: %{public}@";
      goto LABEL_118;
    case 36:
    case 49:
    case 56:
      if ((unint64_t)[v5 length] >= (v11 | 4uLL)) {
        goto LABEL_132;
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      uint64_t v42 = NFLogGetLogger();
      if (v42)
      {
        uint64_t v43 = (void (*)(uint64_t, const char *, ...))v42;
        id v44 = object_getClass(self);
        BOOL v45 = class_isMetaClass(v44);
        long long v123 = object_getClassName(self);
        NSErrorUserInfoKey v134 = sel_getName(a2);
        uint64_t v46 = 45;
        if (v45) {
          uint64_t v46 = 43;
        }
        v43(3, "%c[%{public}s %{public}s]:%i Invalid packet length ,packet: %{public}@", v46, v123, v134, 3889, v5);
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      id v17 = NFSharedLogGetLogger();
      if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        goto LABEL_145;
      }
      uint64_t v47 = object_getClass(self);
      if (class_isMetaClass(v47)) {
        int v48 = 43;
      }
      else {
        int v48 = 45;
      }
      *(_DWORD *)id buf = 67110146;
      int v144 = v48;
      __int16 v145 = 2082;
      id v146 = object_getClassName(self);
      __int16 v147 = 2082;
      v148 = sel_getName(a2);
      __int16 v149 = 1024;
      int v150 = 3889;
      __int16 v151 = 2114;
      *(void *)__int16 v152 = v5;
      id v20 = "%c[%{public}s %{public}s]:%i Invalid packet length ,packet: %{public}@";
      goto LABEL_118;
    case 38:
    case 40:
    case 42:
    case 43:
    case 58:
      if ([v5 length] == (id)(v11 | 2)) {
        goto LABEL_132;
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      uint64_t v21 = NFLogGetLogger();
      if (v21)
      {
        id v22 = (void (*)(uint64_t, const char *, ...))v21;
        uint64_t v23 = object_getClass(self);
        BOOL v24 = class_isMetaClass(v23);
        __int16 v120 = object_getClassName(self);
        __int16 v131 = sel_getName(a2);
        uint64_t v25 = 45;
        if (v24) {
          uint64_t v25 = 43;
        }
        v22(3, "%c[%{public}s %{public}s]:%i Invalid packet length ,packet: %{public}@", v25, v120, v131, 3832, v5);
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      id v17 = NFSharedLogGetLogger();
      if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        goto LABEL_145;
      }
      int v26 = object_getClass(self);
      if (class_isMetaClass(v26)) {
        int v27 = 43;
      }
      else {
        int v27 = 45;
      }
      *(_DWORD *)id buf = 67110146;
      int v144 = v27;
      __int16 v145 = 2082;
      id v146 = object_getClassName(self);
      __int16 v147 = 2082;
      v148 = sel_getName(a2);
      __int16 v149 = 1024;
      int v150 = 3832;
      __int16 v151 = 2114;
      *(void *)__int16 v152 = v5;
      id v20 = "%c[%{public}s %{public}s]:%i Invalid packet length ,packet: %{public}@";
      goto LABEL_118;
    case 51:
    case 60:
    case 61:
      if ([v5 length] == (id)(v11 | 6)) {
        goto LABEL_132;
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      uint64_t v49 = NFLogGetLogger();
      if (v49)
      {
        id v50 = (void (*)(uint64_t, const char *, ...))v49;
        BOOL v51 = object_getClass(self);
        BOOL v52 = class_isMetaClass(v51);
        int v124 = object_getClassName(self);
        id v135 = sel_getName(a2);
        uint64_t v53 = 45;
        if (v52) {
          uint64_t v53 = 43;
        }
        v50(3, "%c[%{public}s %{public}s]:%i Invalid packet length ,packet: %{public}@", v53, v124, v135, 3900, v5);
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      id v17 = NFSharedLogGetLogger();
      if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        goto LABEL_145;
      }
      uint64_t v54 = object_getClass(self);
      if (class_isMetaClass(v54)) {
        int v55 = 43;
      }
      else {
        int v55 = 45;
      }
      *(_DWORD *)id buf = 67110146;
      int v144 = v55;
      __int16 v145 = 2082;
      id v146 = object_getClassName(self);
      __int16 v147 = 2082;
      v148 = sel_getName(a2);
      __int16 v149 = 1024;
      int v150 = 3900;
      __int16 v151 = 2114;
      *(void *)__int16 v152 = v5;
      id v20 = "%c[%{public}s %{public}s]:%i Invalid packet length ,packet: %{public}@";
      goto LABEL_118;
    case 52:
      if ((unint64_t)[v5 length] >= (v11 | 6uLL)) {
        goto LABEL_132;
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      uint64_t v75 = NFLogGetLogger();
      if (v75)
      {
        long long v76 = (void (*)(uint64_t, const char *, ...))v75;
        long long v77 = object_getClass(self);
        BOOL v78 = class_isMetaClass(v77);
        v126 = object_getClassName(self);
        __int16 v138 = sel_getName(a2);
        uint64_t v79 = 45;
        if (v78) {
          uint64_t v79 = 43;
        }
        v76(3, "%c[%{public}s %{public}s]:%i Invalid packet length ,packet: %{public}@", v79, v126, v138, 3909, v5);
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      id v17 = NFSharedLogGetLogger();
      if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        goto LABEL_145;
      }
      __int16 v80 = object_getClass(self);
      if (class_isMetaClass(v80)) {
        int v81 = 43;
      }
      else {
        int v81 = 45;
      }
      *(_DWORD *)id buf = 67110146;
      int v144 = v81;
      __int16 v145 = 2082;
      id v146 = object_getClassName(self);
      __int16 v147 = 2082;
      v148 = sel_getName(a2);
      __int16 v149 = 1024;
      int v150 = 3909;
      __int16 v151 = 2114;
      *(void *)__int16 v152 = v5;
      id v20 = "%c[%{public}s %{public}s]:%i Invalid packet length ,packet: %{public}@";
      goto LABEL_118;
    case 55:
      if ((unint64_t)[v5 length] >= (v11 | 2uLL)) {
        goto LABEL_132;
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      uint64_t v82 = NFLogGetLogger();
      if (v82)
      {
        id v83 = (void (*)(uint64_t, const char *, ...))v82;
        __int16 v84 = object_getClass(self);
        BOOL v85 = class_isMetaClass(v84);
        __int16 v127 = object_getClassName(self);
        id v139 = sel_getName(a2);
        uint64_t v86 = 45;
        if (v85) {
          uint64_t v86 = 43;
        }
        v83(3, "%c[%{public}s %{public}s]:%i Invalid packet length ,packet: %{public}@", v86, v127, v139, 3841, v5);
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      id v17 = NFSharedLogGetLogger();
      if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        goto LABEL_145;
      }
      long long v87 = object_getClass(self);
      if (class_isMetaClass(v87)) {
        int v88 = 43;
      }
      else {
        int v88 = 45;
      }
      *(_DWORD *)id buf = 67110146;
      int v144 = v88;
      __int16 v145 = 2082;
      id v146 = object_getClassName(self);
      __int16 v147 = 2082;
      v148 = sel_getName(a2);
      __int16 v149 = 1024;
      int v150 = 3841;
      __int16 v151 = 2114;
      *(void *)__int16 v152 = v5;
      id v20 = "%c[%{public}s %{public}s]:%i Invalid packet length ,packet: %{public}@";
      goto LABEL_118;
    case 59:
      if ([v5 length] == (id)(v11 | 3) || objc_msgSend(v5, "length") == (id)(v11 | 4)) {
        goto LABEL_132;
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      uint64_t v89 = NFLogGetLogger();
      if (v89)
      {
        int v90 = (void (*)(uint64_t, const char *, ...))v89;
        uint64_t v91 = object_getClass(self);
        BOOL v92 = class_isMetaClass(v91);
        id v128 = object_getClassName(self);
        BOOL v140 = sel_getName(a2);
        uint64_t v93 = 45;
        if (v92) {
          uint64_t v93 = 43;
        }
        v90(3, "%c[%{public}s %{public}s]:%i Invalid packet length ,packet: %{public}@", v93, v128, v140, 3924, v5);
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      id v17 = NFSharedLogGetLogger();
      if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        goto LABEL_145;
      }
      id v94 = object_getClass(self);
      if (class_isMetaClass(v94)) {
        int v95 = 43;
      }
      else {
        int v95 = 45;
      }
      *(_DWORD *)id buf = 67110146;
      int v144 = v95;
      __int16 v145 = 2082;
      id v146 = object_getClassName(self);
      __int16 v147 = 2082;
      v148 = sel_getName(a2);
      __int16 v149 = 1024;
      int v150 = 3924;
      __int16 v151 = 2114;
      *(void *)__int16 v152 = v5;
      id v20 = "%c[%{public}s %{public}s]:%i Invalid packet length ,packet: %{public}@";
LABEL_118:
      id v73 = v17;
      uint32_t v74 = 44;
      goto LABEL_119;
    default:
      if ((v9 + 32) <= 0xBFu)
      {
        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        uint64_t v65 = NFLogGetLogger();
        if (v65)
        {
          int v66 = (void (*)(uint64_t, const char *, ...))v65;
          id v67 = object_getClass(self);
          BOOL v68 = class_isMetaClass(v67);
          id v69 = object_getClassName(self);
          uint64_t v137 = sel_getName(a2);
          uint64_t v70 = 45;
          if (v68) {
            uint64_t v70 = 43;
          }
          v66(3, "%c[%{public}s %{public}s]:%i Invalid custom command code: 0x%X ,packet: %{public}@", v70, v69, v137, 3932, v9, v5);
        }
        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        id v17 = NFSharedLogGetLogger();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          id v71 = object_getClass(self);
          if (class_isMetaClass(v71)) {
            int v72 = 43;
          }
          else {
            int v72 = 45;
          }
          *(_DWORD *)id buf = 67110402;
          int v144 = v72;
          __int16 v145 = 2082;
          id v146 = object_getClassName(self);
          __int16 v147 = 2082;
          v148 = sel_getName(a2);
          __int16 v149 = 1024;
          int v150 = 3932;
          __int16 v151 = 1024;
          *(_DWORD *)__int16 v152 = v9;
          *(_WORD *)&v152[4] = 2114;
          *(void *)&v152[6] = v5;
          id v20 = "%c[%{public}s %{public}s]:%i Invalid custom command code: 0x%X ,packet: %{public}@";
          id v73 = v17;
          uint32_t v74 = 50;
LABEL_119:
          _os_log_impl((void *)&_mh_execute_header, v73, OS_LOG_TYPE_ERROR, v20, buf, v74);
        }
LABEL_145:

        unsigned int v7 = 10;
        goto LABEL_146;
      }
      if ((id)[(_NFReaderSession *)self sessionType] != (id)1
        || ([(_NFReaderSession *)self whitelistChecker],
            BOOL v96 = objc_claimAutoreleasedReturnValue(),
            unsigned int v97 = [v96 validateISO15693TagAccessWithManufacturerCode:v10],
            v96,
            !v97))
      {
LABEL_132:
        if ((v8 & 0x20) == 0) {
          goto LABEL_2;
        }
        id v17 = [objc_alloc((Class)NSData) initWithBytes:v6 + 2 length:8];
        unsigned __int8 v106 = [(_NFReaderSession *)self currentTag];
        id v107 = [v106 tagID];
        unsigned __int8 v108 = [v107 isEqual:v17];

        if (v108)
        {

          goto LABEL_2;
        }
        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        uint64_t v109 = NFLogGetLogger();
        if (v109)
        {
          __int16 v110 = (void (*)(uint64_t, const char *, ...))v109;
          BOOL v111 = object_getClass(self);
          BOOL v112 = class_isMetaClass(v111);
          id v113 = object_getClassName(self);
          uint64_t v142 = sel_getName(a2);
          uint64_t v114 = 45;
          if (v112) {
            uint64_t v114 = 43;
          }
          v110(3, "%c[%{public}s %{public}s]:%i Invalid tag ID: %{public}@, packet: %{public}@", v114, v113, v142, 3944, v17, v5);
        }
        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        uint64_t v115 = NFSharedLogGetLogger();
        if (os_log_type_enabled(v115, OS_LOG_TYPE_ERROR))
        {
          __int16 v116 = object_getClass(self);
          if (class_isMetaClass(v116)) {
            int v117 = 43;
          }
          else {
            int v117 = 45;
          }
          *(_DWORD *)id buf = 67110402;
          int v144 = v117;
          __int16 v145 = 2082;
          id v146 = object_getClassName(self);
          __int16 v147 = 2082;
          v148 = sel_getName(a2);
          __int16 v149 = 1024;
          int v150 = 3944;
          __int16 v151 = 2114;
          *(void *)__int16 v152 = v17;
          *(_WORD *)&v152[8] = 2114;
          *(void *)&v152[10] = v5;
          _os_log_impl((void *)&_mh_execute_header, v115, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Invalid tag ID: %{public}@, packet: %{public}@", buf, 0x36u);
        }

        goto LABEL_145;
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      uint64_t v98 = NFLogGetLogger();
      if (v98)
      {
        __int16 v99 = (void (*)(uint64_t, const char *, ...))v98;
        uint64_t v100 = object_getClass(self);
        BOOL v101 = class_isMetaClass(v100);
        __int16 v129 = object_getClassName(self);
        id v141 = sel_getName(a2);
        uint64_t v102 = 45;
        if (v101) {
          uint64_t v102 = 43;
        }
        v99(3, "%c[%{public}s %{public}s]:%i Invalid manufacturer code, packet: %{public}@", v102, v129, v141, 3935, v5);
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      __int16 v103 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v103, OS_LOG_TYPE_ERROR))
      {
        int v104 = object_getClass(self);
        if (class_isMetaClass(v104)) {
          int v105 = 43;
        }
        else {
          int v105 = 45;
        }
        *(_DWORD *)id buf = 67110146;
        int v144 = v105;
        __int16 v145 = 2082;
        id v146 = object_getClassName(self);
        __int16 v147 = 2082;
        v148 = sel_getName(a2);
        __int16 v149 = 1024;
        int v150 = 3935;
        __int16 v151 = 2114;
        *(void *)__int16 v152 = v5;
        _os_log_impl((void *)&_mh_execute_header, v103, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Invalid manufacturer code, packet: %{public}@", buf, 0x2Cu);
      }

      unsigned int v7 = 32;
LABEL_146:

      return v7;
  }
}

- (BOOL)_mifareCheck:(id)a3
{
  id v4 = a3;
  id v5 = [(_NFReaderSession *)self driverWrapper];
  if (!v5 || (v6 = v5, int v7 = sub_10018FAE8(v5, v4, 0), v6, !v7))
  {
    char v22 = 96;
    while (1)
    {
      uint64_t v9 = [(_NFReaderSession *)self driverWrapper];
      id v10 = [objc_alloc((Class)NSData) initWithBytes:&v22 length:1];
      uint64_t v11 = [(_NFReaderSession *)self whitelistChecker];
      [v11 sessionTimeLimit];
      id v21 = 0;
      uint64_t v12 = sub_100195A20(v9, v10, v4, &v21);
      id v13 = v21;

      if (v13 || ![v12 length]) {
        goto LABEL_22;
      }
      id v14 = v12;
      int v15 = *(unsigned __int8 *)[v14 bytes];
      if (v15 != 175) {
        break;
      }
      char v22 = -81;
    }
    BOOL v8 = 1;
    if (v15 <= 125)
    {
      BOOL v16 = v15 > 0x1E;
      int v17 = (1 << v15) & 0x40001901;
      if (!v16 && v17 != 0) {
        goto LABEL_23;
      }
LABEL_22:
      BOOL v8 = 0;
      goto LABEL_23;
    }
    if (v15 > 201)
    {
      if (v15 != 202 && v15 != 238) {
        goto LABEL_22;
      }
    }
    else if (v15 != 126 && v15 != 144)
    {
      goto LABEL_22;
    }
LABEL_23:

    int v19 = [(_NFReaderSession *)self driverWrapper];
    sub_1001900C4(v19, v4, 0);

    goto LABEL_24;
  }
  BOOL v8 = 0;
LABEL_24:

  return v8;
}

- (unsigned)_queryMifareType:(id)a3 outError:(id *)a4
{
  id v7 = a3;
  if ([(_NFReaderSession *)self skipMifareClassification] || (self->_pollOption & 0x20) != 0)
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      uint64_t v11 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      uint64_t v15 = 45;
      if (isMetaClass) {
        uint64_t v15 = 43;
      }
      v11(6, "%c[%{public}s %{public}s]:%i Skipping mifare classification", v15, ClassName, Name, 3993);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    BOOL v16 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = object_getClass(self);
      if (class_isMetaClass(v17)) {
        int v18 = 43;
      }
      else {
        int v18 = 45;
      }
      *(_DWORD *)id buf = 67109890;
      int v22 = v18;
      __int16 v23 = 2082;
      BOOL v24 = object_getClassName(self);
      __int16 v25 = 2082;
      int v26 = sel_getName(a2);
      __int16 v27 = 1024;
      int v28 = 3993;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Skipping mifare classification", buf, 0x22u);
    }

    goto LABEL_16;
  }
  if ([v7 type] != 9 && objc_msgSend(v7, "type") != 3)
  {
LABEL_16:
    unsigned int v9 = 0;
    goto LABEL_17;
  }
  BOOL v8 = [(_NFReaderSession *)self driverWrapper];
  unsigned int v9 = sub_100191378(v8, v7, (unint64_t)a4);

LABEL_17:
  return v9;
}

- (BOOL)_validateMifareAPDU:(id)a3 response:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [objc_alloc((Class)NFCommandAPDU) initWithData:v7];

  if (v8
    && [v8 clss] != 144
    && [v8 instruction] == 164
    && [v8 p1] == 4)
  {
    unsigned int v9 = [v8 payload];
    BOOL v10 = [(_NFReaderSession *)self validateAID:v9 withSelectResponse:v6 outRealAid:0];
  }
  else
  {
    BOOL v10 = 1;
  }

  return v10;
}

- (BOOL)_requiresMifareUpdate:(id)a3
{
  id v4 = a3;
  BOOL v5 = ([v4 type] == 3 || objc_msgSend(v4, "type") == 9)
    && !self->_skipMifareClassification;

  return v5;
}

- (BOOL)_updateMifareTagInfo:(id)a3 outError:(id *)a4
{
  id v7 = a3;
  if ([(_NFReaderSession *)self _requiresMifareUpdate:v7])
  {
    id v24 = 0;
    uint64_t v8 = [(_NFReaderSession *)self _queryMifareType:v7 outError:&v24];
    id v9 = v24;
    if ((v8 - 13) <= 3)
    {
      [v7 _setType:v8];
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      uint64_t Logger = NFLogGetLogger();
      if (Logger)
      {
        uint64_t v11 = (void (*)(uint64_t, const char *, ...))Logger;
        Class = object_getClass(self);
        BOOL isMetaClass = class_isMetaClass(Class);
        ClassName = object_getClassName(self);
        Name = sel_getName(a2);
        uint64_t v14 = 45;
        if (isMetaClass) {
          uint64_t v14 = 43;
        }
        v11(6, "%c[%{public}s %{public}s]:%i Resetting tag to %{public}@", v14, ClassName, Name, 4043, v7);
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      uint64_t v15 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        BOOL v16 = object_getClass(self);
        if (class_isMetaClass(v16)) {
          int v17 = 43;
        }
        else {
          int v17 = 45;
        }
        int v18 = object_getClassName(self);
        int v19 = sel_getName(a2);
        *(_DWORD *)id buf = 67110146;
        int v26 = v17;
        __int16 v27 = 2082;
        int v28 = v18;
        __int16 v29 = 2082;
        int v30 = v19;
        __int16 v31 = 1024;
        int v32 = 4043;
        __int16 v33 = 2114;
        id v34 = v7;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Resetting tag to %{public}@", buf, 0x2Cu);
      }
    }
    if (a4) {
      *a4 = v9;
    }
    BOOL v20 = [v9 code] != (id)51 && [v9 code] != (id)64;
  }
  else
  {
    BOOL v20 = 1;
  }

  return v20;
}

- (NFDriverWrapper)driverWrapper
{
  return (NFDriverWrapper *)objc_getProperty(self, a2, 312, 1);
}

- (void)setDriverWrapper:(id)a3
{
}

- (NFSystemPowerConsumptionMonitor)powerConsumptionReporter
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_powerConsumptionReporter);

  return (NFSystemPowerConsumptionMonitor *)WeakRetained;
}

- (void)setPowerConsumptionReporter:(id)a3
{
}

- (id)uiInvalidationHandler
{
  return self->_uiInvalidationHandler;
}

- (NSMutableArray)feliCaSystemCodeList
{
  return self->_feliCaSystemCodeList;
}

- (void)setFeliCaSystemCodeList:(id)a3
{
}

- (NSMutableOrderedSet)iso7816AppList
{
  return self->_iso7816AppList;
}

- (void)setIso7816AppList:(id)a3
{
}

- (NFTag)currentTag
{
  return self->_currentTag;
}

- (void)setCurrentTag:(id)a3
{
}

- (unint64_t)sessionConfig
{
  return self->_sessionConfig;
}

- (unint64_t)sessionType
{
  return self->_sessionType;
}

- (BOOL)skipMifareClassification
{
  return self->_skipMifareClassification;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentTag, 0);
  objc_storeStrong((id *)&self->_iso7816AppList, 0);
  objc_storeStrong((id *)&self->_feliCaSystemCodeList, 0);
  objc_destroyWeak((id *)&self->_powerConsumptionReporter);
  objc_storeStrong((id *)&self->_driverWrapper, 0);
  objc_storeStrong((id *)&self->_nonstandard7816TagsFound, 0);
  objc_storeStrong((id *)&self->_initialScanText, 0);
  objc_storeStrong(&self->_uiInvalidationHandler, 0);
  objc_storeStrong((id *)&self->_uiService, 0);
  objc_storeStrong((id *)&self->_sessionUUID, 0);
  objc_storeStrong((id *)&self->_sessionTimer, 0);

  objc_storeStrong((id *)&self->_tagWhiteList, 0);
}

- (id)_readFromTag:(id)a3 offset:(unsigned __int16)a4 outError:(id *)a5
{
  char v33 = 0;
  int v32 = 45056;
  id v8 = a3;
  id v9 = [objc_alloc((Class)NSData) initWithBytes:&v32 length:5];
  BOOL v10 = [(_NFReaderSession *)self driverWrapper];
  uint64_t v11 = [(_NFReaderSession *)self whitelistChecker];
  [v11 sessionTimeLimit];
  id v31 = 0;
  uint64_t v12 = sub_100195A20(v10, v9, v8, &v31);

  id v13 = v31;
  if (a5 && !v12)
  {
    if (v13)
    {
      id v14 = [v13 code];
      id v15 = objc_alloc((Class)NSError);
      BOOL v16 = +[NSString stringWithUTF8String:"nfcd"];
      if (v14 == (id)64)
      {
        id v17 = [v13 code];
        v38[0] = NSLocalizedDescriptionKey;
        uint64_t v30 = (uint64_t)v17;
        if ((uint64_t)[v13 code] > 70) {
          uint64_t v18 = 71;
        }
        else {
          uint64_t v18 = (uint64_t)[v13 code];
        }
        int v19 = +[NSString stringWithUTF8String:off_1003075E0[v18]];
        v39[0] = v19;
        v39[1] = v13;
        v38[1] = NSUnderlyingErrorKey;
        v38[2] = @"Line";
        v39[2] = &off_10031F840;
        v38[3] = @"Method";
        id v20 = [objc_alloc((Class)NSString) initWithFormat:@"%s", sel_getName(a2)];
        v39[3] = v20;
        v38[4] = NSDebugDescriptionErrorKey;
        id v21 = [objc_alloc((Class)NSString) initWithFormat:@"%s:%d", sel_getName(a2), 112];
        v39[4] = v21;
        __int16 v25 = +[NSDictionary dictionaryWithObjects:v39 forKeys:v38 count:5];
        int v26 = v15;
        __int16 v27 = v16;
        uint64_t v28 = v30;
        goto LABEL_12;
      }
      v36[0] = NSLocalizedDescriptionKey;
      int v19 = +[NSString stringWithUTF8String:"Tag Error"];
      v37[0] = v19;
      v37[1] = v13;
      v36[1] = NSUnderlyingErrorKey;
      id v36[2] = @"Line";
      v37[2] = &off_10031F858;
      v36[3] = @"Method";
      id v20 = [objc_alloc((Class)NSString) initWithFormat:@"%s", sel_getName(a2)];
      v37[3] = v20;
      v36[4] = NSDebugDescriptionErrorKey;
      id v21 = [objc_alloc((Class)NSString) initWithFormat:@"%s:%d", sel_getName(a2), 114];
      v37[4] = v21;
      int v22 = v37;
      __int16 v23 = v36;
      uint64_t v24 = 5;
    }
    else
    {
      id v15 = objc_alloc((Class)NSError);
      BOOL v16 = +[NSString stringWithUTF8String:"nfcd"];
      v34[0] = NSLocalizedDescriptionKey;
      int v19 = +[NSString stringWithUTF8String:"Tag Error"];
      v35[0] = v19;
      v35[1] = &off_10031F870;
      v34[1] = @"Line";
      v34[2] = @"Method";
      id v20 = [objc_alloc((Class)NSString) initWithFormat:@"%s", sel_getName(a2)];
      v35[2] = v20;
      v34[3] = NSDebugDescriptionErrorKey;
      id v21 = [objc_alloc((Class)NSString) initWithFormat:@"%s:%d", sel_getName(a2), 117];
      v35[3] = v21;
      int v22 = v35;
      __int16 v23 = v34;
      uint64_t v24 = 4;
    }
    __int16 v25 = +[NSDictionary dictionaryWithObjects:v22 forKeys:v23 count:v24];
    int v26 = v15;
    __int16 v27 = v16;
    uint64_t v28 = 29;
LABEL_12:
    *a5 = [v26 initWithDomain:v27 code:v28 userInfo:v25];
  }

  return v12;
}

- (BOOL)_selectMFFromTag:(id)a3 outError:(id *)a4
{
  id v7 = a3;
  id v8 = [objc_alloc((Class)NSData) initWithBytes:&unk_100284484 length:2];
  id v25 = 0;
  id v9 = [(_NFReaderSession *)self _selectTag:v7 aid:v8 p1:0 p2:12 shortLe:0xFFFFFFFFLL error:&v25];

  id v10 = v25;
  if (v10 || (sub_10020B708(v9) & 1) == 0)
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      id v13 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      uint64_t v17 = 45;
      if (isMetaClass) {
        uint64_t v17 = 43;
      }
      v13(4, "%c[%{public}s %{public}s]:%i SELECT MF failed", v17, ClassName, Name, 131);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v18 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      int v19 = object_getClass(self);
      if (class_isMetaClass(v19)) {
        int v20 = 43;
      }
      else {
        int v20 = 45;
      }
      id v21 = object_getClassName(self);
      int v22 = sel_getName(a2);
      *(_DWORD *)id buf = 67109890;
      int v27 = v20;
      __int16 v28 = 2082;
      __int16 v29 = v21;
      __int16 v30 = 2082;
      id v31 = v22;
      __int16 v32 = 1024;
      int v33 = 131;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i SELECT MF failed", buf, 0x22u);
    }

    BOOL v11 = 0;
    if (a4) {
      *a4 = v10;
    }
  }
  else
  {
    BOOL v11 = 1;
  }

  return v11;
}

- (BOOL)_selectEF:(unsigned __int16)a3 tag:(id)a4 outError:(id *)a5
{
  return [(_NFReaderSession *)self _selectEF:a3 p2:12 tag:a4 outResponse:0 outError:a5];
}

- (BOOL)_selectEF:(unsigned __int16)a3 p2:(unsigned __int8)a4 tag:(id)a5 outResponse:(id *)a6 outError:(id *)a7
{
  uint64_t v9 = a4;
  uint64_t v10 = a3;
  id v12 = a5;
  __int16 v33 = __rev16(v10);
  id v13 = [objc_alloc((Class)NSData) initWithBytes:&v33 length:2];
  id v32 = 0;
  if (v9 == 12) {
    uint64_t v14 = 0xFFFFFFFFLL;
  }
  else {
    uint64_t v14 = 0;
  }
  id v15 = [(_NFReaderSession *)self _selectTag:v12 aid:v13 p1:2 p2:v9 shortLe:v14 error:&v32];

  id v16 = v32;
  if (a6) {
    *a6 = v15;
  }
  if (v16 || (sub_10020B708(v15) & 1) == 0)
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      int v19 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      uint64_t v22 = 45;
      if (isMetaClass) {
        uint64_t v22 = 43;
      }
      v19(4, "%c[%{public}s %{public}s]:%i SELECT EF(0x%x) failed", v22, ClassName, Name, 157, v10);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    __int16 v23 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      uint64_t v24 = object_getClass(self);
      if (class_isMetaClass(v24)) {
        int v25 = 43;
      }
      else {
        int v25 = 45;
      }
      int v26 = object_getClassName(self);
      int v27 = sel_getName(a2);
      *(_DWORD *)id buf = 67110146;
      int v35 = v25;
      __int16 v36 = 2082;
      uint64_t v37 = v26;
      __int16 v38 = 2082;
      uint64_t v39 = v27;
      __int16 v40 = 1024;
      int v41 = 157;
      __int16 v42 = 1024;
      int v43 = v10;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i SELECT EF(0x%x) failed", buf, 0x28u);
    }

    BOOL v17 = 0;
    if (a7) {
      *a7 = v16;
    }
  }
  else
  {
    BOOL v17 = 1;
  }

  return v17;
}

- (BOOL)_readEFCardAccessFromTag:(id)a3 buffer:(id)a4 outError:(id *)a5
{
  id v9 = a3;
  id v10 = a4;
  id v78 = 0;
  unsigned int v11 = [(_NFReaderSession *)self _selectEF:284 p2:0 tag:v9 outResponse:&v78 outError:a5];
  id v12 = v78;
  char v13 = 0;
  if (v11)
  {
    sel = a2;
    id v76 = v12;
    id v14 = v12;
    id v15 = +[NFTLV TLVWithData:v14];
    id v16 = v15;
    uint32_t v74 = a5;
    if (v15
      && ([v15 tag] == 111 || objc_msgSend(v16, "tag") == 98)
      && ([v16 children],
          BOOL v17 = objc_claimAutoreleasedReturnValue(),
          id v18 = [v17 count],
          v17,
          v18))
    {
      int v72 = v14;
      id v73 = v10;
      long long v81 = 0u;
      long long v82 = 0u;
      long long v79 = 0u;
      long long v80 = 0u;
      id v71 = v16;
      int v19 = [v16 children];
      id v20 = [v19 countByEnumeratingWithState:&v79 objects:buf count:16];
      if (v20)
      {
        id v21 = v20;
        unint64_t j = 0;
        uint64_t v23 = *(void *)v80;
        do
        {
          for (uint64_t i = 0; i != v21; uint64_t i = (char *)i + 1)
          {
            if (*(void *)v80 != v23) {
              objc_enumerationMutation(v19);
            }
            int v25 = *(void **)(*((void *)&v79 + 1) + 8 * i);
            if ([v25 tag] == 131)
            {
              int v26 = [v25 value];
              id v27 = [v26 length];

              if (v27 == (id)2)
              {
                id v28 = [v25 value];
                [v28 bytes];
              }
            }
            if ([v25 tag] == 128)
            {
              __int16 v29 = [v25 value];
              id v30 = [v29 length];

              if (v30)
              {
                id v31 = [v25 value];
                id v32 = (unsigned __int8 *)[v31 bytes];

                __int16 v33 = [v25 value];
                id v34 = (char *)[v33 length];

                for (unint64_t j = 0; v34; --v34)
                {
                  unsigned int v35 = *v32++;
                  unint64_t j = v35 | (j << 8);
                }
              }
            }
          }
          id v21 = [v19 countByEnumeratingWithState:&v79 objects:buf count:16];
        }
        while (v21);
      }
      else
      {
        unint64_t j = 0;
      }

      if (j)
      {
        id v10 = v73;
        if (j >= 0x10000)
        {
          dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          uint64_t Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
          if (Logger) {
            Logger(3, "%s:%i File size > UINT16_MAX; apply limit",
          }
              "-[_NFReaderSession(PACE) _readEFCardAccessFromTag:buffer:outError:]",
              180);
          dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          BOOL v68 = NFSharedLogGetLogger();
          if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)id buf = 136446466;
            *(void *)__int16 v84 = "-[_NFReaderSession(PACE) _readEFCardAccessFromTag:buffer:outError:]";
            *(_WORD *)&v84[8] = 1024;
            *(_DWORD *)&v84[10] = 180;
            _os_log_impl((void *)&_mh_execute_header, v68, OS_LOG_TYPE_ERROR, "%{public}s:%i File size > UINT16_MAX; apply limit",
              buf,
              0x12u);
          }

          unint64_t j = 0xFFFFLL;
        }
      }
      else
      {
        unint64_t j = 1;
        id v10 = v73;
      }
    }
    else
    {

      unint64_t j = 1;
    }
    unsigned __int16 v36 = 0;
    id v37 = 0;
    while (1)
    {
      __int16 v38 = v37;
      id v77 = v37;
      uint64_t v39 = [(_NFReaderSession *)self _readFromTag:v9 offset:v36 outError:&v77];
      id v37 = v77;

      char v13 = sub_10020B708(v39);
      if ((v13 & 1) == 0) {
        break;
      }
      __int16 v40 = (char *)[v39 length];
      unint64_t v41 = (unint64_t)(v40 - 2);
      if (v40 == (char *)2)
      {
        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        uint64_t v44 = NFLogGetLogger();
        if (v44)
        {
          BOOL v45 = (void (*)(uint64_t, const char *, ...))v44;
          Class = object_getClass(self);
          BOOL isMetaClass = class_isMetaClass(Class);
          ClassName = object_getClassName(self);
          Name = sel_getName(sel);
          uint64_t v49 = 45;
          if (isMetaClass) {
            uint64_t v49 = 43;
          }
          v45(4, "%c[%{public}s %{public}s]:%i error: missing data", v49, ClassName, Name, 195);
        }
        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        id v50 = NFSharedLogGetLogger();
        if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
        {
          BOOL v51 = object_getClass(self);
          if (class_isMetaClass(v51)) {
            int v52 = 43;
          }
          else {
            int v52 = 45;
          }
          uint64_t v53 = object_getClassName(self);
          uint64_t v54 = sel_getName(sel);
          *(_DWORD *)id buf = 67109890;
          *(_DWORD *)__int16 v84 = v52;
          *(_WORD *)&void v84[4] = 2082;
          *(void *)&v84[6] = v53;
          __int16 v85 = 2082;
          uint64_t v86 = v54;
          __int16 v87 = 1024;
          int v88 = 195;
          int v55 = "%c[%{public}s %{public}s]:%i error: missing data";
LABEL_49:
          _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_ERROR, v55, buf, 0x22u);
        }
LABEL_50:

        goto LABEL_51;
      }
      id v42 = v39;
      [v10 appendBytes:[v42 bytes] length:v41];
      BOOL v43 = j >= v41;
      j -= v41;
      if (!v43)
      {
        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        uint64_t v56 = NFLogGetLogger();
        if (v56)
        {
          uint64_t v57 = (void (*)(uint64_t, const char *, ...))v56;
          int v58 = object_getClass(self);
          BOOL v59 = class_isMetaClass(v58);
          uint64_t v60 = object_getClassName(self);
          uint64_t v70 = sel_getName(sel);
          uint64_t v61 = 45;
          if (v59) {
            uint64_t v61 = 43;
          }
          v57(4, "%c[%{public}s %{public}s]:%i Excess data returned from tag", v61, v60, v70, 200);
        }
        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        id v50 = NFSharedLogGetLogger();
        if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
        {
          int v62 = object_getClass(self);
          if (class_isMetaClass(v62)) {
            int v63 = 43;
          }
          else {
            int v63 = 45;
          }
          unsigned int v64 = object_getClassName(self);
          uint64_t v65 = sel_getName(sel);
          *(_DWORD *)id buf = 67109890;
          *(_DWORD *)__int16 v84 = v63;
          *(_WORD *)&void v84[4] = 2082;
          *(void *)&v84[6] = v64;
          __int16 v85 = 2082;
          uint64_t v86 = v65;
          __int16 v87 = 1024;
          int v88 = 200;
          int v55 = "%c[%{public}s %{public}s]:%i Excess data returned from tag";
          goto LABEL_49;
        }
        goto LABEL_50;
      }
      v36 += v41;

      if (!j) {
        goto LABEL_52;
      }
    }
    if (v74) {
      *uint32_t v74 = v37;
    }
LABEL_51:

LABEL_52:
    id v12 = v76;
  }

  return v13;
}

- (BOOL)isPaceSupported:(id)a3
{
  unsigned int v3 = [a3 NF_asHexString];
  if (v3) {
    BOOL v4 = +[NFATLMobileSettings findAID:v3 filterType:3];
  }
  else {
    BOOL v4 = 0;
  }

  return v4;
}

- (BOOL)selectPaceApp:(id)a3 fromTag:(id)a4 resolvedAid:(id *)a5 outError:(id *)a6
{
  id v11 = a3;
  id v12 = a4;
  if (a5) {
    *a5 = 0;
  }
  id v108 = 0;
  char v13 = [(_NFReaderSession *)self _selectTag:v12 aid:v11 p1:4 p2:12 shortLe:0xFFFFFFFFLL error:&v108];
  id v14 = v108;
  id v15 = v14;
  if (!v13 || v14) {
    goto LABEL_45;
  }
  unsigned int v16 = sub_10020CA8C(v13, 0);
  if (v16 == 27266)
  {
    id v15 = 0;
    goto LABEL_48;
  }
  if (v16 == 36864)
  {
    id v15 = 0;
    if (a5) {
      *a5 = v11;
    }
    LOBYTE(v51) = 1;
    goto LABEL_89;
  }
  id v107 = 0;
  [(_NFReaderSession *)self _selectMFFromTag:v12 outError:&v107];
  id v17 = v107;
  id v15 = v17;
  if (v17)
  {
    if ([v17 code] != (id)28)
    {
LABEL_45:
      if (a6)
      {
        int v52 = v15;
LABEL_47:
        id v15 = v52;
        LOBYTE(v51) = 0;
        *a6 = v15;
        goto LABEL_89;
      }
LABEL_48:
      LOBYTE(v51) = 0;
      goto LABEL_89;
    }
  }
  id v106 = v15;
  unsigned __int8 v18 = [(_NFReaderSession *)self _selectEF:12032 tag:v12 outError:&v106];
  id v19 = v106;

  if ((v18 & 1) == 0)
  {
    if (!a6)
    {
      LOBYTE(v51) = 0;
      id v15 = v19;
      goto LABEL_89;
    }
    int v52 = v19;
    goto LABEL_47;
  }
  id v105 = v19;
  id v20 = [(_NFReaderSession *)self _readFromTag:v12 offset:0 outError:&v105];
  id v15 = v105;

  uint64_t v93 = v20;
  if (v15 || (sub_10020B708(v20) & 1) == 0)
  {
    uint64_t v53 = a2;
    BOOL v51 = a6;
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      int v55 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(v53);
      uint64_t v59 = 45;
      if (isMetaClass) {
        uint64_t v59 = 43;
      }
      v55(4, "%c[%{public}s %{public}s]:%i Read EF.DIR failed", v59, ClassName, Name, 255);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v60 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
    {
      uint64_t v61 = object_getClass(self);
      if (class_isMetaClass(v61)) {
        int v62 = 43;
      }
      else {
        int v62 = 45;
      }
      int v63 = object_getClassName(self);
      unsigned int v64 = sel_getName(v53);
      *(_DWORD *)id buf = 67109890;
      int v112 = v62;
      __int16 v113 = 2082;
      uint64_t v114 = v63;
      __int16 v115 = 2082;
      __int16 v116 = v64;
      __int16 v117 = 1024;
      int v118 = 255;
      _os_log_impl((void *)&_mh_execute_header, v60, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Read EF.DIR failed", buf, 0x22u);
    }

    if (v51)
    {
      uint64_t v65 = v51;
      id v15 = v15;
      LOBYTE(v51) = 0;
      id *v65 = v15;
    }
    char v13 = v93;
  }
  else
  {
    id v21 = [v20 subdataWithRange:0, (char *)[v20 length] - 2];
    uint64_t v22 = +[NFTLV TLVsWithData:v21];

    long long v103 = 0u;
    long long v104 = 0u;
    long long v101 = 0u;
    long long v102 = 0u;
    id obj = v22;
    id v94 = v11;
    uint64_t v23 = v20;
    id v90 = [obj countByEnumeratingWithState:&v101 objects:v110 count:16];
    if (v90)
    {
      uint64_t v24 = *(void *)v102;
      int v88 = a6;
      sel = a2;
      uint64_t v87 = *(void *)v102;
      do
      {
        for (uint64_t i = 0; i != v90; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v102 != v24) {
            objc_enumerationMutation(obj);
          }
          int v26 = *(void **)(*((void *)&v101 + 1) + 8 * i);
          if ([v26 tag] == 97)
          {
            [v26 children];
            id v27 = v91 = i;
            id v28 = [v27 count];

            uint64_t i = v91;
            if (v28)
            {
              long long v99 = 0u;
              long long v100 = 0u;
              long long v97 = 0u;
              long long v98 = 0u;
              __int16 v29 = [v26 children];
              id v30 = [v29 countByEnumeratingWithState:&v97 objects:v109 count:16];
              if (v30)
              {
                id v31 = v30;
                uint64_t v32 = *(void *)v98;
                while (2)
                {
                  for (unint64_t j = 0; j != v31; unint64_t j = (char *)j + 1)
                  {
                    if (*(void *)v98 != v32) {
                      objc_enumerationMutation(v29);
                    }
                    id v34 = *(void **)(*((void *)&v97 + 1) + 8 * (void)j);
                    if ([v34 tag] == 79)
                    {
                      unsigned int v35 = [v34 value];
                      id v36 = [v35 length];

                      if (v36)
                      {
                        id v37 = [v34 value];
                        unsigned int v38 = [v94 isEqualToData:v37];

                        if (v38)
                        {

                          id v96 = 0;
                          unsigned __int8 v66 = [(_NFReaderSession *)self _selectEF:284 tag:v12 outError:&v96];
                          id v67 = v96;
                          id v15 = v67;
                          if (v66)
                          {
                            id v95 = v67;
                            BOOL v68 = [(_NFReaderSession *)self _readFromTag:v12 offset:0 outError:&v95];
                            id v69 = v95;

                            id v11 = v94;
                            if (v69 || (sub_10020B708(v68) & 1) == 0)
                            {
                              dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
                              uint64_t v70 = NFLogGetLogger();
                              if (v70)
                              {
                                id v71 = (void (*)(uint64_t, const char *, ...))v70;
                                int v72 = object_getClass(self);
                                BOOL v73 = class_isMetaClass(v72);
                                uint32_t v74 = v68;
                                uint64_t v75 = object_getClassName(self);
                                uint64_t v86 = sel_getName(sel);
                                uint64_t v76 = 45;
                                if (v73) {
                                  uint64_t v76 = 43;
                                }
                                id v83 = v75;
                                BOOL v68 = v74;
                                v71(4, "%c[%{public}s %{public}s]:%i Read EF.CardAccess failed", v76, v83, v86, 292);
                              }
                              dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
                              id v77 = NFSharedLogGetLogger();
                              if (os_log_type_enabled(v77, OS_LOG_TYPE_ERROR))
                              {
                                id v78 = object_getClass(self);
                                if (class_isMetaClass(v78)) {
                                  int v79 = 43;
                                }
                                else {
                                  int v79 = 45;
                                }
                                long long v80 = object_getClassName(self);
                                long long v81 = sel_getName(sel);
                                *(_DWORD *)id buf = 67109890;
                                int v112 = v79;
                                __int16 v113 = 2082;
                                uint64_t v114 = v80;
                                __int16 v115 = 2082;
                                __int16 v116 = v81;
                                __int16 v117 = 1024;
                                int v118 = 292;
                                _os_log_impl((void *)&_mh_execute_header, v77, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Read EF.CardAccess failed", buf, 0x22u);
                              }

                              if (v88)
                              {
                                id v15 = v69;
                                LOBYTE(v51) = 0;
                                id *v88 = v15;
                              }
                              else
                              {
                                LOBYTE(v51) = 0;
                                id v15 = v69;
                              }
                            }
                            else
                            {
                              id v15 = 0;
                              if (a5) {
                                *a5 = [objc_alloc((Class)NSData) initWithBytes:&unk_100284484 length:2];
                              }
                              LOBYTE(v51) = 1;
                            }
                            uint64_t v23 = v68;
                          }
                          else
                          {
                            id v11 = v94;
                            if (v88)
                            {
                              id v15 = v67;
                              LOBYTE(v51) = 0;
                              id *v88 = v15;
                            }
                            else
                            {
                              LOBYTE(v51) = 0;
                            }
                            uint64_t v23 = v93;
                          }
                          goto LABEL_88;
                        }
                      }
                    }
                  }
                  id v31 = [v29 countByEnumeratingWithState:&v97 objects:v109 count:16];
                  if (v31) {
                    continue;
                  }
                  break;
                }
              }

              a2 = sel;
              uint64_t v24 = v87;
              uint64_t i = v91;
            }
          }
        }
        uint64_t v23 = v93;
        id v90 = [obj countByEnumeratingWithState:&v101 objects:v110 count:16];
      }
      while (v90);
    }
    uint64_t v39 = a2;

    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v40 = NFLogGetLogger();
    if (v40)
    {
      unint64_t v41 = (void (*)(uint64_t, const char *, ...))v40;
      id v42 = object_getClass(self);
      BOOL v43 = class_isMetaClass(v42);
      uint64_t v44 = object_getClassName(self);
      __int16 v84 = sel_getName(v39);
      uint64_t v45 = 45;
      if (v43) {
        uint64_t v45 = 43;
      }
      v41(4, "%c[%{public}s %{public}s]:%i Requested app not found in EF.DIR", v45, v44, v84, 279);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v46 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
    {
      uint64_t v47 = object_getClass(self);
      if (class_isMetaClass(v47)) {
        int v48 = 43;
      }
      else {
        int v48 = 45;
      }
      uint64_t v49 = object_getClassName(self);
      id v50 = sel_getName(v39);
      *(_DWORD *)id buf = 67109890;
      int v112 = v48;
      __int16 v113 = 2082;
      uint64_t v114 = v49;
      __int16 v115 = 2082;
      __int16 v116 = v50;
      __int16 v117 = 1024;
      int v118 = 279;
      _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Requested app not found in EF.DIR", buf, 0x22u);
    }

    id v15 = 0;
    LOBYTE(v51) = 0;
    id v11 = v94;
LABEL_88:

    char v13 = v23;
  }
LABEL_89:

  return (char)v51;
}

- (BOOL)selectPaceApp:(id)a3 fromTag:(id)a4 outError:(id *)a5
{
  id v8 = a4;
  id v9 = a3;
  id v10 = [objc_alloc((Class)NSData) initWithBytes:&unk_100284484 length:2];
  if ([v9 isEqualToData:v10])
  {
    uint64_t v23 = 0;
    id v11 = (id *)&v23;
    id v12 = &v23;
    char v13 = self;
    id v14 = v8;
    id v15 = v9;
    uint64_t v16 = 0;
  }
  else
  {
    uint64_t v22 = 0;
    id v11 = (id *)&v22;
    id v12 = &v22;
    char v13 = self;
    id v14 = v8;
    id v15 = v9;
    uint64_t v16 = 4;
  }
  id v17 = -[_NFReaderSession _selectTag:aid:p1:p2:shortLe:error:](v13, "_selectTag:aid:p1:p2:shortLe:error:", v14, v15, v16, 12, 0xFFFFFFFFLL, v12, v22, v23);

  id v18 = *v11;
  id v19 = v18;
  if (v17 && !v18 && (sub_10020B708(v17) & 1) != 0)
  {
    BOOL v20 = 1;
  }
  else
  {
    BOOL v20 = 0;
    if (a5) {
      *a5 = v19;
    }
  }

  return v20;
}

- (id)detectPaceAppOnTag:(id)a3 appFound:(id *)a4
{
  id v7 = a3;
  id v51 = 0;
  unsigned __int8 v8 = [(_NFReaderSession *)self _selectMFFromTag:v7 outError:&v51];
  id v9 = v51;
  id v10 = v9;
  if ((v8 & 1) == 0)
  {
    id v28 = v9;
LABEL_16:
    id v15 = v28;
    id v27 = v28;
    goto LABEL_34;
  }
  id v50 = v9;
  unsigned __int8 v11 = [(_NFReaderSession *)self _selectEF:284 tag:v7 outError:&v50];
  id v12 = v50;

  if ((v11 & 1) == 0)
  {
    id v28 = v12;
    goto LABEL_16;
  }
  char v13 = objc_opt_new();
  id v49 = v12;
  unsigned __int8 v14 = [(_NFReaderSession *)self _readEFCardAccessFromTag:v7 buffer:v13 outError:&v49];
  id v15 = v49;

  if (v14)
  {
    uint64_t v44 = v13;
    +[SecurityInfo securityInfoArrayFromData:v13];
    long long v45 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    id v16 = (id)objc_claimAutoreleasedReturnValue();
    id v17 = [v16 countByEnumeratingWithState:&v45 objects:v62 count:16];
    if (v17)
    {
      id v18 = v17;
      uint64_t v19 = *(void *)v46;
      while (2)
      {
        for (uint64_t i = 0; i != v18; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v46 != v19) {
            objc_enumerationMutation(v16);
          }
          id v21 = *(void **)(*((void *)&v45 + 1) + 8 * i);
          if (![v21 type] || objc_msgSend(v21, "type") == (id)1)
          {
            dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
            uint64_t Logger = NFLogGetLogger();
            if (Logger)
            {
              id v30 = (void (*)(uint64_t, const char *, ...))Logger;
              Class = object_getClass(self);
              BOOL isMetaClass = class_isMetaClass(Class);
              ClassName = object_getClassName(self);
              Name = sel_getName(a2);
              uint64_t v34 = 45;
              if (isMetaClass) {
                uint64_t v34 = 43;
              }
              v30(6, "%c[%{public}s %{public}s]:%i PACE tag found!", v34, ClassName, Name, 348);
            }
            dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
            unsigned int v35 = NFSharedLogGetLogger();
            if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
            {
              id v36 = object_getClass(self);
              if (class_isMetaClass(v36)) {
                int v37 = 43;
              }
              else {
                int v37 = 45;
              }
              unsigned int v38 = object_getClassName(self);
              uint64_t v39 = sel_getName(a2);
              *(_DWORD *)id buf = 67109890;
              int v55 = v37;
              __int16 v56 = 2082;
              uint64_t v57 = v38;
              __int16 v58 = 2082;
              uint64_t v59 = v39;
              __int16 v60 = 1024;
              int v61 = 348;
              _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i PACE tag found!", buf, 0x22u);
            }

            sub_10023D968();
            uint64_t v40 = (unsigned char *)objc_claimAutoreleasedReturnValue();
            char v13 = v44;
            if (v40) {
              v40[156] = 1;
            }

            id v27 = 0;
            if (a4) {
              *a4 = [objc_alloc((Class)NSData) initWithBytes:&unk_100284484 length:2];
            }
            uint64_t v22 = v16;
            goto LABEL_32;
          }
        }
        id v18 = [v16 countByEnumeratingWithState:&v45 objects:v62 count:16];
        if (v18) {
          continue;
        }
        break;
      }
    }

    id v43 = objc_alloc((Class)NSError);
    uint64_t v22 = +[NSString stringWithUTF8String:"nfcd"];
    v52[0] = NSLocalizedDescriptionKey;
    uint64_t v23 = +[NSString stringWithUTF8String:"Tag Not Found"];
    v53[0] = v23;
    v53[1] = &off_10031F888;
    v52[1] = @"Line";
    v52[2] = @"Method";
    id v24 = [objc_alloc((Class)NSString) initWithFormat:@"%s", sel_getName(a2)];
    v53[2] = v24;
    v52[3] = NSDebugDescriptionErrorKey;
    id v25 = [objc_alloc((Class)NSString) initWithFormat:@"%s:%d", sel_getName(a2), 356];
    v53[3] = v25;
    int v26 = +[NSDictionary dictionaryWithObjects:v53 forKeys:v52 count:4];
    id v27 = [v43 initWithDomain:v22 code:28 userInfo:v26];

    char v13 = v44;
LABEL_32:
  }
  else
  {
    id v27 = v15;
  }

LABEL_34:

  return v27;
}

@end
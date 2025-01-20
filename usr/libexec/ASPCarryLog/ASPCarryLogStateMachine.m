@interface ASPCarryLogStateMachine
- (ASPCarryLogStateMachine)initWithStateManager:(id)a3 TaskingManager:(id)a4 NANDDriver:(id)a5 UploadDriver:(id)a6 WorkDirectory:(id)a7;
- (BOOL)_DATaskingNotInHist;
- (BOOL)_activeLegacyTaskingDisabled;
- (BOOL)_activeTaskingExpired;
- (BOOL)_canInspectNewDATasking;
- (BOOL)_canJoinTaskingPerStatsDriver:(id)a3;
- (BOOL)_checkSnBuildVariantMatch;
- (BOOL)_curTaskingisActiveOnServer;
- (BOOL)_hasActiveTasking;
- (BOOL)_hasPendingDSReplyTasking;
- (BOOL)_isAfterTaskingInspectionCoolDown;
- (BOOL)_passDATaskingCriteria:(id)a3;
- (BOOL)isInternal;
- (BOOL)isInternalBuild;
- (BOOL)isLegacyUI_IOLogEnabled;
- (BOOL)isLegacyUI_TaskingDisabled;
- (CarryLog_NANDDriver)nandDriver;
- (CarryLog_UploadDriver)uploadDriver;
- (NSMutableArray)taskingIdHistory;
- (NSMutableDictionary)currentTaskingInfo;
- (NSString)DATaskingID;
- (NSString)workDir;
- (StateMgr)stateMgr;
- (TaskingManager)DATaskingMgr;
- (id)_genUniqueDeviceId;
- (id)_getDeviceId;
- (int64_t)taskingDuration;
- (int64_t)taskingSizeLimit;
- (void)_addDATaskingToHist;
- (void)_checkLegacyUI;
- (void)_cleanUpAfterTasking;
- (void)_cleanUpWorkDir;
- (void)_deleteUploadInfo;
- (void)_markDATaskingDSReply_Pending;
- (void)_markTaskingActive;
- (void)_resetDaemonUserDefaults;
- (void)_setNextTaskingInspectionMinTime;
- (void)_tryActivateTasking;
- (void)_unmarkCurrentTasking;
- (void)bootCheck;
- (void)dailyCheckWithStatsProvider:(id)a3;
- (void)setCurrentTaskingInfo:(id)a3;
- (void)setDATaskingID:(id)a3;
- (void)setDATaskingMgr:(id)a3;
- (void)setIsInternal:(BOOL)a3;
- (void)setIsLegacyUI_IOLogEnabled:(BOOL)a3;
- (void)setIsLegacyUI_TaskingDisabled:(BOOL)a3;
- (void)setNandDriver:(id)a3;
- (void)setStateMgr:(id)a3;
- (void)setTaskingDuration:(int64_t)a3;
- (void)setTaskingIdHistory:(id)a3;
- (void)setTaskingSizeLimit:(int64_t)a3;
- (void)setUploadDriver:(id)a3;
- (void)setWorkDir:(id)a3;
@end

@implementation ASPCarryLogStateMachine

- (ASPCarryLogStateMachine)initWithStateManager:(id)a3 TaskingManager:(id)a4 NANDDriver:(id)a5 UploadDriver:(id)a6 WorkDirectory:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v30 = a6;
  id v29 = a7;
  v32.receiver = self;
  v32.super_class = (Class)ASPCarryLogStateMachine;
  v16 = [(ASPCarryLogStateMachine *)&v32 init];
  if (!v16) {
    goto LABEL_20;
  }
  id v28 = v15;
  v17 = [v13 getValueForKey:@"tasking_id_history" expectedType:3];
  v18 = [v13 getValueForKey:@"current_tasking_info" expectedType:2];
  v16->_isInternal = checkInternalBuild(v13);
  objc_storeStrong((id *)&v16->_stateMgr, a3);
  if ((validateCurTaskingInfo(v18) & 1) == 0)
  {

    [v13 deleteKey:@"current_tasking_info"];
    v18 = 0;
  }
  *(_WORD *)&v16->_isLegacyUI_IOLogEnabled = 0;
  [(ASPCarryLogStateMachine *)v16 _checkLegacyUI];
  if (v18) {
    v19 = (NSMutableDictionary *)[objc_alloc((Class)NSMutableDictionary) initWithDictionary:v18 copyItems:1];
  }
  else {
    v19 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  }
  currentTaskingInfo = v16->_currentTaskingInfo;
  v16->_currentTaskingInfo = v19;

  if (v17) {
    v21 = (NSMutableArray *)[objc_alloc((Class)NSMutableArray) initWithArray:v17 copyItems:1];
  }
  else {
    v21 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
  }
  taskingIdHistory = v16->_taskingIdHistory;
  v16->_taskingIdHistory = v21;

  objc_storeStrong((id *)&v16->_DATaskingMgr, a4);
  if (v16->_isLegacyUI_TaskingDisabled)
  {
    v16->_taskingDuration = -1;
    v16->_taskingSizeLimit = -1;
  }
  else
  {
    if ([(ASPCarryLogStateMachine *)v16 isLegacyUI_IOLogEnabled])
    {
      *(_OWORD *)&v16->_taskingDuration = xmmword_10008A2B0;
      DATaskingID = v16->_DATaskingID;
      v16->_DATaskingID = (NSString *)@"TASKING_LEGACY_INT_IOS";
      goto LABEL_17;
    }
    v16->_taskingDuration = (int64_t)[v14 getTaskingDurationInSeconds];
    v16->_taskingSizeLimit = (int64_t)[v14 getTaskingSizeLimitInBytes];
    if ((v16->_taskingDuration & 0x8000000000000000) == 0)
    {
      uint64_t v24 = [v14 getTaskingID];
      DATaskingID = v16->_DATaskingID;
      v16->_DATaskingID = (NSString *)v24;
      goto LABEL_17;
    }
  }
  DATaskingID = v16->_DATaskingID;
  v16->_DATaskingID = 0;
LABEL_17:

  objc_storeStrong((id *)&v16->_nandDriver, a5);
  objc_storeStrong((id *)&v16->_uploadDriver, a6);
  objc_storeStrong((id *)&v16->_workDir, a7);
  v25 = oslog;
  if (os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "ASPCarryLog state machine initialized", buf, 2u);
  }
  v26 = v16;

  id v15 = v28;
LABEL_20:

  return v16;
}

- (BOOL)isInternalBuild
{
  return [(ASPCarryLogStateMachine *)self isInternal];
}

- (void)_checkLegacyUI
{
  if ([(ASPCarryLogStateMachine *)self isInternalBuild])
  {
    v3 = [(ASPCarryLogStateMachine *)self stateMgr];
    id v8 = [v3 getValueForKey:@"enable_iolog_collection" inDomain:@"/var/mobile/Library/Preferences/com.apple.nandCarryLogs.plist" expectedType:1];

    v4 = [(ASPCarryLogStateMachine *)self stateMgr];
    v5 = [v4 getValueForKey:@"enable_iolog_tasking" inDomain:@"/var/mobile/Library/Preferences/com.apple.nandCarryLogs.plist" expectedType:1];

    if (v8) {
      BOOL v6 = [v8 intValue] == 1;
    }
    else {
      BOOL v6 = 0;
    }
    [(ASPCarryLogStateMachine *)self setIsLegacyUI_IOLogEnabled:v6];
    if (v5) {
      BOOL v7 = [v5 intValue] != 1;
    }
    else {
      BOOL v7 = 0;
    }
    [(ASPCarryLogStateMachine *)self setIsLegacyUI_TaskingDisabled:v7];
  }
  else
  {
    [(ASPCarryLogStateMachine *)self setIsLegacyUI_IOLogEnabled:0];
    [(ASPCarryLogStateMachine *)self setIsLegacyUI_TaskingDisabled:0];
  }
}

- (id)_genUniqueDeviceId
{
  v3 = +[NSUUID UUID];
  v4 = [v3 UUIDString];
  v5 = +[NSDate date];
  BOOL v6 = [(ASPCarryLogStateMachine *)self DATaskingID];
  BOOL v7 = +[NSUUID UUID];
  id v8 = [v7 UUIDString];
  v9 = +[NSString stringWithFormat:@"%@%@%@%@", v4, v5, v6, v8];

  v10 = +[NSMutableString stringWithCapacity:40];
  id v11 = v9;
  CC_SHA1([v11 UTF8String], (CC_LONG)[v11 length], md);
  for (uint64_t i = 0; i != 20; ++i)
    [v10 appendFormat:@"%02x", md[i]];
  id v13 = (void *)oslog;
  if (os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_DEFAULT))
  {
    id v14 = v13;
    id v15 = [(ASPCarryLogStateMachine *)self DATaskingID];
    *(_DWORD *)buf = 136315394;
    id v18 = [v15 UTF8String];
    __int16 v19 = 2080;
    id v20 = [v10 UTF8String];
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "TaskingId: %s, Generated unique deviceId: %s", buf, 0x16u);
  }

  return v10;
}

- (id)_getDeviceId
{
  if (![(ASPCarryLogStateMachine *)self isInternalBuild]
    || (getDeviceSerialNumber(), (v3 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    v3 = [(ASPCarryLogStateMachine *)self _genUniqueDeviceId];
  }

  return v3;
}

- (BOOL)_hasActiveTasking
{
  v2 = [(ASPCarryLogStateMachine *)self currentTaskingInfo];
  v3 = [v2 objectForKeyedSubscript:@"dsreply_pending"];
  unsigned __int8 v4 = [v3 isEqualToString:@"no"];

  return v4;
}

- (BOOL)_hasPendingDSReplyTasking
{
  v2 = [(ASPCarryLogStateMachine *)self currentTaskingInfo];
  v3 = [v2 objectForKeyedSubscript:@"dsreply_pending"];
  unsigned __int8 v4 = [v3 isEqualToString:@"yes"];

  return v4;
}

- (void)_markDATaskingDSReply_Pending
{
  v3 = [(ASPCarryLogStateMachine *)self currentTaskingInfo];
  unsigned __int8 v4 = [(ASPCarryLogStateMachine *)self DATaskingID];
  [v3 setValue:v4 forKey:@"id"];

  v5 = [(ASPCarryLogStateMachine *)self currentTaskingInfo];
  BOOL v6 = +[NSNumber numberWithLongLong:[(ASPCarryLogStateMachine *)self taskingSizeLimit]];
  [v5 setValue:v6 forKey:@"upload_size_limit_bytes"];

  BOOL v7 = [(ASPCarryLogStateMachine *)self currentTaskingInfo];
  [v7 setValue:@"yes" forKey:@"dsreply_pending"];

  id v8 = [(ASPCarryLogStateMachine *)self currentTaskingInfo];
  v9 = [(ASPCarryLogStateMachine *)self _getDeviceId];
  [v8 setValue:v9 forKey:@"device_id"];

  id v11 = [(ASPCarryLogStateMachine *)self stateMgr];
  v10 = [(ASPCarryLogStateMachine *)self currentTaskingInfo];
  [v11 setValue:v10 forKey:@"current_tasking_info"];
}

- (void)_markTaskingActive
{
  v3 = +[NSDate dateWithTimeIntervalSinceNow:(double)[(ASPCarryLogStateMachine *)self taskingDuration]];
  DateTimeToStr(v3);
  id v17 = (id)objc_claimAutoreleasedReturnValue();

  unsigned __int8 v4 = [(ASPCarryLogStateMachine *)self currentTaskingInfo];
  v5 = [v4 objectForKeyedSubscript:@"id"];

  BOOL v6 = uploadInfoKeyFromTaskingId((uint64_t)v5);
  BOOL v7 = [(ASPCarryLogStateMachine *)self currentTaskingInfo];
  [v7 setValue:v17 forKey:@"endtime"];

  id v8 = [(ASPCarryLogStateMachine *)self currentTaskingInfo];
  [v8 setValue:@"no" forKey:@"dsreply_pending"];

  v9 = [(ASPCarryLogStateMachine *)self currentTaskingInfo];
  v10 = +[NSNumber numberWithLongLong:[(ASPCarryLogStateMachine *)self taskingSizeLimit]];
  [v9 setValue:v10 forKey:@"upload_size_limit_bytes"];

  id v11 = [(ASPCarryLogStateMachine *)self stateMgr];
  [v11 setValue:&off_1000C14E0 forKey:v6];

  v12 = [(ASPCarryLogStateMachine *)self stateMgr];
  id v13 = [(ASPCarryLogStateMachine *)self currentTaskingInfo];
  [v12 setValue:v13 forKey:@"current_tasking_info"];

  id v14 = [(ASPCarryLogStateMachine *)self stateMgr];
  id v15 = currentDateTimeStr();
  [v14 setValue:v15 forKey:@"last_extract_time"];

  v16 = [(ASPCarryLogStateMachine *)self stateMgr];
  setTaskingInfoToLegacyUIDomain(v16, v5, v17, 0, @"None", [(ASPCarryLogStateMachine *)self isInternalBuild]);
}

- (void)_unmarkCurrentTasking
{
  v3 = [(ASPCarryLogStateMachine *)self currentTaskingInfo];
  unsigned __int8 v4 = [v3 objectForKeyedSubscript:@"id"];
  uploadInfoKeyFromTaskingId((uint64_t)v4);
  id v9 = (id)objc_claimAutoreleasedReturnValue();

  v5 = [(ASPCarryLogStateMachine *)self stateMgr];
  [v5 deleteKey:v9];

  BOOL v6 = [(ASPCarryLogStateMachine *)self stateMgr];
  [v6 deleteKey:@"current_tasking_info"];

  BOOL v7 = [(ASPCarryLogStateMachine *)self stateMgr];
  [v7 deleteKey:@"last_extract_time"];

  id v8 = [(ASPCarryLogStateMachine *)self currentTaskingInfo];
  [v8 removeAllObjects];
}

- (BOOL)_activeTaskingExpired
{
  if (![(ASPCarryLogStateMachine *)self isLegacyUI_TaskingDisabled]
    && ![(ASPCarryLogStateMachine *)self _activeLegacyTaskingDisabled])
  {
    unsigned __int8 v4 = +[NSDate date];
    v5 = [(ASPCarryLogStateMachine *)self currentTaskingInfo];
    BOOL v6 = [v5 objectForKeyedSubscript:@"endtime"];
    BOOL v7 = StringToDateTime(v6);

    id v8 = [(ASPCarryLogStateMachine *)self currentTaskingInfo];
    id v9 = [v8 objectForKeyedSubscript:@"upload_size_limit_bytes"];

    v10 = [(ASPCarryLogStateMachine *)self currentTaskingInfo];
    id v11 = [v10 objectForKeyedSubscript:@"id"];
    v12 = uploadInfoKeyFromTaskingId((uint64_t)v11);

    id v13 = [(ASPCarryLogStateMachine *)self stateMgr];
    id v14 = [v13 getValueForKey:v12 expectedType:2];

    id v15 = [v14 objectForKeyedSubscript:@"total_upload_size"];
    v16 = [v14 objectForKeyedSubscript:@"enough_disk_space"];
    if (!v7 || [v4 compare:v7] != (id)-1) {
      goto LABEL_6;
    }
    objc_opt_class();
    LOBYTE(v3) = 1;
    if ((objc_opt_isKindOfClass() & 1) == 0 || !v9) {
      goto LABEL_7;
    }
    id v18 = [v15 longLongValue];
    if ((uint64_t)v18 < (uint64_t)[v9 longLongValue]
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [v16 BOOLValue])
    {
      unsigned int v3 = ![(ASPCarryLogStateMachine *)self _curTaskingisActiveOnServer];
    }
    else
    {
LABEL_6:
      LOBYTE(v3) = 1;
    }
LABEL_7:

    return v3;
  }
  LOBYTE(v3) = 1;
  return v3;
}

- (BOOL)_curTaskingisActiveOnServer
{
  unsigned int v3 = [(ASPCarryLogStateMachine *)self currentTaskingInfo];
  unsigned __int8 v4 = [v3 objectForKeyedSubscript:@"id"];

  v5 = [(ASPCarryLogStateMachine *)self currentTaskingInfo];
  BOOL v6 = [v5 objectForKeyedSubscript:@"device_id"];

  BOOL v7 = 0;
  if (v4 && v6)
  {
    if (os_variant_has_internal_content())
    {
      id v8 = [(ASPCarryLogStateMachine *)self stateMgr];
      id v9 = [v8 getValueForKey:@"test_force_ds_reply_tasking_continue" expectedType:0];

      if (v9
        && ([&off_1000C1508 objectForKey:v9],
            v10 = objc_claimAutoreleasedReturnValue(),
            v10,
            v10))
      {
        id v11 = [&off_1000C1508 objectForKeyedSubscript:v9];
        unsigned int v12 = [v11 unsignedIntValue];

        if (v12 != 3) {
          goto LABEL_10;
        }
      }
      else
      {
      }
    }
    id v13 = [(ASPCarryLogStateMachine *)self uploadDriver];
    unsigned int v12 = [v13 allowToContinueTaskingId:v4 DeviceId:v6];

LABEL_10:
    BOOL v7 = v12 != 0;
  }

  return v7;
}

- (BOOL)_activeLegacyTaskingDisabled
{
  if ([(ASPCarryLogStateMachine *)self isInternalBuild])
  {
    unsigned int v3 = [(ASPCarryLogStateMachine *)self currentTaskingInfo];
    unsigned __int8 v4 = [v3 objectForKeyedSubscript:@"id"];

    if ([v4 isEqualToString:@"TASKING_LEGACY_INT_IOS"]) {
      unsigned int v5 = ![(ASPCarryLogStateMachine *)self isLegacyUI_IOLogEnabled];
    }
    else {
      LOBYTE(v5) = 0;
    }
  }
  else
  {
    LOBYTE(v5) = 0;
  }
  return v5;
}

- (BOOL)_DATaskingNotInHist
{
  unsigned int v3 = [(ASPCarryLogStateMachine *)self DATaskingID];

  if (v3)
  {
    unsigned __int8 v4 = [(ASPCarryLogStateMachine *)self taskingIdHistory];
    unsigned int v5 = [(ASPCarryLogStateMachine *)self DATaskingID];
    unsigned int v6 = [v4 containsObject:v5] ^ 1;
  }
  else
  {
    LOBYTE(v6) = 0;
  }
  BOOL v7 = oslog;
  if (os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_DEBUG)) {
    sub_100046B40(v3 == 0, v6, v7);
  }
  return v6;
}

- (BOOL)_isAfterTaskingInspectionCoolDown
{
  v2 = [(ASPCarryLogStateMachine *)self stateMgr];
  unsigned int v3 = [v2 getValueForKey:@"next_tasking_inspection_time" expectedType:0];

  if (v3)
  {
    unsigned __int8 v4 = StringToDateTime(v3);
    unsigned int v5 = +[NSDate date];
    BOOL v6 = [v4 compare:v5] == (id)-1;
  }
  else
  {
    BOOL v6 = 1;
  }

  return v6;
}

- (void)_setNextTaskingInspectionMinTime
{
  id v5 = +[NSDate dateWithTimeIntervalSinceNow:2592000.0];
  unsigned int v3 = [(ASPCarryLogStateMachine *)self stateMgr];
  unsigned __int8 v4 = DateTimeToStr(v5);
  [v3 setValue:v4 forKey:@"next_tasking_inspection_time"];
}

- (BOOL)_canInspectNewDATasking
{
  if ([(ASPCarryLogStateMachine *)self isInternalBuild]) {
    goto LABEL_4;
  }
  BOOL v3 = [(ASPCarryLogStateMachine *)self _isAfterTaskingInspectionCoolDown];
  if (v3)
  {
    [(ASPCarryLogStateMachine *)self _setNextTaskingInspectionMinTime];
LABEL_4:
    LOBYTE(v3) = 1;
  }
  return v3;
}

- (BOOL)_passDATaskingCriteria:(id)a3
{
  id v4 = a3;
  if ([(ASPCarryLogStateMachine *)self isLegacyUI_IOLogEnabled])
  {
    unsigned int v5 = 1;
  }
  else
  {
    BOOL v6 = [(ASPCarryLogStateMachine *)self DATaskingMgr];
    if (v6)
    {
      BOOL v7 = [(ASPCarryLogStateMachine *)self DATaskingMgr];
      unsigned int v5 = [v7 evaluateTaskingCriteria:v4 doWhiteListCheck:-[ASPCarryLogStateMachine isInternalBuild](self, "isInternalBuild") ^ 1];
    }
    else
    {
      unsigned int v5 = 0;
    }
  }
  id v8 = (void *)oslog;
  if (os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_DEFAULT))
  {
    if (v5) {
      id v9 = "PASS";
    }
    else {
      id v9 = "FAIL";
    }
    v10 = v8;
    id v11 = [(ASPCarryLogStateMachine *)self DATaskingMgr];
    id v12 = [v11 getTaskingID];
    int v14 = 136315394;
    id v15 = v9;
    __int16 v16 = 2080;
    id v17 = [v12 UTF8String];
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%s criteria for tasking id %s", (uint8_t *)&v14, 0x16u);
  }
  return v5;
}

- (void)_addDATaskingToHist
{
  if (![(ASPCarryLogStateMachine *)self isLegacyUI_IOLogEnabled])
  {
    BOOL v3 = [(ASPCarryLogStateMachine *)self taskingIdHistory];
    id v4 = [(ASPCarryLogStateMachine *)self DATaskingID];
    [v3 addObject:v4];

    unsigned int v5 = [(ASPCarryLogStateMachine *)self taskingIdHistory];
    id v6 = [v5 count];

    if ((unint64_t)v6 >= 0xD)
    {
      do
      {
        BOOL v7 = [(ASPCarryLogStateMachine *)self taskingIdHistory];
        [v7 removeObjectAtIndex:0];

        id v8 = [(ASPCarryLogStateMachine *)self taskingIdHistory];
        id v9 = [v8 count];
      }
      while ((unint64_t)v9 > 0xC);
    }
    id v11 = [(ASPCarryLogStateMachine *)self stateMgr];
    v10 = [(ASPCarryLogStateMachine *)self taskingIdHistory];
    [v11 setValue:v10 forKey:@"tasking_id_history"];
  }
}

- (BOOL)_canJoinTaskingPerStatsDriver:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(ASPCarryLogStateMachine *)self isInternalBuild] || !diskFreeSpaceBelowLimit(0x80000000uLL);
  if (![(ASPCarryLogStateMachine *)self _DATaskingNotInHist])
  {
    LOBYTE(v5) = 0;
    goto LABEL_15;
  }
  if ([(ASPCarryLogStateMachine *)self _canInspectNewDATasking])
  {
    if (!v5) {
      goto LABEL_13;
    }
    if ([(ASPCarryLogStateMachine *)self _passDATaskingCriteria:v4])
    {
      [(ASPCarryLogStateMachine *)self _markDATaskingDSReply_Pending];
      LOBYTE(v5) = 1;
      goto LABEL_13;
    }
  }
  else
  {
    id v6 = oslog;
    LOBYTE(v5) = 0;
    if (!os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_13;
    }
    LOWORD(v12) = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "DA tasking inspection at cool down", (uint8_t *)&v12, 2u);
  }
  LOBYTE(v5) = 0;
LABEL_13:
  [(ASPCarryLogStateMachine *)self _addDATaskingToHist];
  BOOL v7 = (void *)oslog;
  if (os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = v7;
    id v9 = [(ASPCarryLogStateMachine *)self DATaskingID];
    id v10 = [v9 UTF8String];
    int v12 = 136315138;
    id v13 = v10;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "TaskingId %s added to history.\n", (uint8_t *)&v12, 0xCu);
  }
LABEL_15:

  return v5;
}

- (void)_tryActivateTasking
{
  BOOL v3 = [(ASPCarryLogStateMachine *)self currentTaskingInfo];
  id v4 = [v3 objectForKeyedSubscript:@"id"];
  id v5 = [v4 UTF8String];

  if (!os_variant_has_internal_content()) {
    goto LABEL_7;
  }
  id v6 = [(ASPCarryLogStateMachine *)self stateMgr];
  BOOL v7 = [v6 getValueForKey:@"test_force_ds_reply" expectedType:0];

  if (!v7
    || ([&off_1000C1530 objectForKey:v7],
        id v8 = objc_claimAutoreleasedReturnValue(),
        v8,
        !v8))
  {

    goto LABEL_7;
  }
  id v9 = [&off_1000C1530 objectForKeyedSubscript:v7];
  int v10 = [v9 unsignedIntValue];

  if (v10 == 3)
  {
LABEL_7:
    id v11 = [(ASPCarryLogStateMachine *)self uploadDriver];
    int v12 = [(ASPCarryLogStateMachine *)self currentTaskingInfo];
    id v13 = [v12 objectForKeyedSubscript:@"id"];
    int v14 = [(ASPCarryLogStateMachine *)self currentTaskingInfo];
    id v15 = [v14 objectForKeyedSubscript:@"device_id"];
    int v10 = [v11 allowToParticipateTaskingId:v13 DeviceId:v15];
  }
  if (v10)
  {
    if (v10 == 2)
    {
      id v18 = oslog;
      if (os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_DEFAULT))
      {
        int v20 = 136315138;
        id v21 = v5;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "DA taskingId %s pending decision server reply", (uint8_t *)&v20, 0xCu);
      }
    }
    else if (v10 == 1)
    {
      __int16 v16 = oslog;
      if (os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_DEFAULT))
      {
        int v20 = 136315138;
        id v21 = v5;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "DA taskingId %s permitted by decision server", (uint8_t *)&v20, 0xCu);
      }
      [(ASPCarryLogStateMachine *)self registerIOLoggingXPCforInternalBuild:[(ASPCarryLogStateMachine *)self isInternalBuild]];
      [(ASPCarryLogStateMachine *)self _markTaskingActive];
    }
    else
    {
      __int16 v19 = oslog;
      if (os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_ERROR)) {
        sub_100046BE8((uint64_t)v5, v10, v19);
      }
    }
  }
  else
  {
    id v17 = oslog;
    if (os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_DEFAULT))
    {
      int v20 = 136315138;
      id v21 = v5;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "DA taskingId %s denied by decision server", (uint8_t *)&v20, 0xCu);
    }
    [(ASPCarryLogStateMachine *)self _unmarkCurrentTasking];
  }
}

- (void)_cleanUpAfterTasking
{
  BOOL v3 = [(ASPCarryLogStateMachine *)self workDir];
  id v7 = [v3 stringByAppendingPathComponent:@"iolog.iolog"];

  id v4 = [(ASPCarryLogStateMachine *)self nandDriver];
  [v4 iolog_disable];

  id v5 = [(ASPCarryLogStateMachine *)self nandDriver];
  [v5 iolog_export:v7 max_export_size:0];

  [(ASPCarryLogStateMachine *)self _cleanUpWorkDir];
  [(ASPCarryLogStateMachine *)self _deleteUploadInfo];
  id v6 = [(ASPCarryLogStateMachine *)self stateMgr];
  [v6 deleteKey:@"extractupload_pendingfile"];
}

- (void)_cleanUpWorkDir
{
  BOOL v3 = [(ASPCarryLogStateMachine *)self workDir];
  id v4 = [v3 stringByAppendingPathComponent:@"tar_in_process"];

  id v5 = +[NSFileManager defaultManager];
  if ([v5 fileExistsAtPath:v4])
  {
    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    id v6 = [v5 contentsOfDirectoryAtPath:v4 error:0];
    id v7 = [v6 countByEnumeratingWithState:&v33 objects:v38 count:16];
    if (v7)
    {
      id v8 = v7;
      id v9 = 0;
      uint64_t v10 = *(void *)v34;
      do
      {
        id v11 = 0;
        int v12 = v9;
        do
        {
          if (*(void *)v34 != v10) {
            objc_enumerationMutation(v6);
          }
          id v9 = [v4 stringByAppendingPathComponent:*(void *)(*((void *)&v33 + 1) + 8 * (void)v11)];

          [v5 removeItemAtPath:v9 error:0];
          id v11 = (char *)v11 + 1;
          int v12 = v9;
        }
        while (v8 != v11);
        id v8 = [v6 countByEnumeratingWithState:&v33 objects:v38 count:16];
      }
      while (v8);
    }
    else
    {
      id v9 = 0;
    }
  }
  else
  {
    id v9 = 0;
  }
  id v13 = [(ASPCarryLogStateMachine *)self workDir];
  unsigned int v14 = [v5 fileExistsAtPath:v13];

  if (v14)
  {
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id v15 = [(ASPCarryLogStateMachine *)self workDir];
    __int16 v16 = [v5 contentsOfDirectoryAtPath:v15 error:0];

    id obj = v16;
    id v17 = [v16 countByEnumeratingWithState:&v29 objects:v37 count:16];
    if (v17)
    {
      id v18 = v17;
      __int16 v19 = self;
      v27 = v4;
      int v20 = 0;
      uint64_t v21 = *(void *)v30;
      do
      {
        for (uint64_t i = 0; i != v18; uint64_t i = (char *)i + 1)
        {
          v23 = v9;
          uint64_t v24 = v20;
          if (*(void *)v30 != v21) {
            objc_enumerationMutation(obj);
          }
          uint64_t v25 = *(void *)(*((void *)&v29 + 1) + 8 * i);
          v26 = [(ASPCarryLogStateMachine *)v19 workDir];
          id v9 = [v26 stringByAppendingPathComponent:v25];

          int v20 = [v9 lastPathComponent];

          if (([v20 isEqualToString:@"tar_in_process"] & 1) == 0
            && ([v20 isEqualToString:@"dp_tasking_payload.plist"] & 1) == 0)
          {
            [v5 removeItemAtPath:v9 error:0];
          }
        }
        id v18 = [obj countByEnumeratingWithState:&v29 objects:v37 count:16];
      }
      while (v18);

      id v4 = v27;
    }
  }
}

- (void)_deleteUploadInfo
{
  BOOL v3 = [(ASPCarryLogStateMachine *)self stateMgr];
  id v4 = [v3 getAllKeys];

  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = v4;
  id v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      id v9 = 0;
      do
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v12 + 1) + 8 * (void)v9);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0
          && objc_msgSend(v10, "hasPrefix:", @"aspcarry_uploadinfo", (void)v12))
        {
          id v11 = [(ASPCarryLogStateMachine *)self stateMgr];
          [v11 deleteKey:v10];
        }
        id v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }
}

- (void)_resetDaemonUserDefaults
{
  [(ASPCarryLogStateMachine *)self _deleteUploadInfo];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v3 = [&off_1000C1648 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v12;
    do
    {
      id v6 = 0;
      do
      {
        if (*(void *)v12 != v5) {
          objc_enumerationMutation(&off_1000C1648);
        }
        uint64_t v7 = *(void *)(*((void *)&v11 + 1) + 8 * (void)v6);
        uint64_t v8 = [(ASPCarryLogStateMachine *)self stateMgr];
        id v9 = [v8 getValueForKey:v7 expectedType:4];

        if (v9)
        {
          uint64_t v10 = [(ASPCarryLogStateMachine *)self stateMgr];
          [v10 deleteKey:v7];
        }
        id v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      id v4 = [&off_1000C1648 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v4);
  }
}

- (BOOL)_checkSnBuildVariantMatch
{
  id v3 = [(ASPCarryLogStateMachine *)self stateMgr];
  id v4 = [v3 getValueForKey:@"device_serialnumber" expectedType:0];

  uint64_t v5 = [(ASPCarryLogStateMachine *)self stateMgr];
  id v6 = [v5 getValueForKey:@"device_is_internal_build" expectedType:0];
  unsigned int v7 = [v6 isEqualToString:@"yes"];

  uint64_t v8 = getDeviceSerialNumber();
  int has_internal_content = os_variant_has_internal_content();
  if (v4 && (![v8 isEqualToString:v4] || v7 != has_internal_content))
  {
    long long v11 = oslog;
    if (os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v21 = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "SN and/or build variant mismatch. Reseting defaults", v21, 2u);
    }
    [(ASPCarryLogStateMachine *)self _resetDaemonUserDefaults];
    long long v12 = [(ASPCarryLogStateMachine *)self stateMgr];
    long long v13 = v12;
    if (has_internal_content) {
      [v12 setValue:@"No active tasking and no iolog collection ongoing" forKey:@"aspcarrylog_tasking_info" inDomain:@"/var/mobile/Library/Preferences/com.apple.nandCarryLogs.plist"];
    }

    BOOL v10 = 0;
  }
  else
  {
    BOOL v10 = 1;
  }
  long long v14 = [(ASPCarryLogStateMachine *)self stateMgr];
  long long v15 = [v14 getValueForKey:@"device_serialnumber" expectedType:0];

  if (!v15)
  {
    __int16 v16 = [(ASPCarryLogStateMachine *)self stateMgr];
    [v16 setValue:v8 forKey:@"device_serialnumber"];
  }
  id v17 = [(ASPCarryLogStateMachine *)self stateMgr];
  id v18 = [v17 getValueForKey:@"device_is_internal_build" expectedType:0];
  if (v18) {
    int has_internal_content = 0;
  }

  if (has_internal_content == 1)
  {
    __int16 v19 = [(ASPCarryLogStateMachine *)self stateMgr];
    [v19 setValue:@"yes" forKey:@"device_is_internal_build"];
  }
  return v10;
}

- (void)dailyCheckWithStatsProvider:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(ASPCarryLogStateMachine *)self stateMgr];
  uint64_t v6 = [v5 getValueForKey:@"daily_check_tasking_status" expectedType:0];

  if (v6) {
    unsigned int v7 = (__CFString *)v6;
  }
  else {
    unsigned int v7 = @"inactive";
  }
  if (![(ASPCarryLogStateMachine *)self _hasActiveTasking])
  {
    if ([(ASPCarryLogStateMachine *)self _hasPendingDSReplyTasking]) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
  unsigned int v8 = [(ASPCarryLogStateMachine *)self _activeTaskingExpired];
  id v9 = (void *)oslog;
  BOOL v10 = os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_DEFAULT);
  if (v8)
  {
    if (v10)
    {
      long long v11 = v9;
      long long v12 = [(ASPCarryLogStateMachine *)self currentTaskingInfo];
      id v13 = [v12 objectForKeyedSubscript:@"id"];
      int v20 = 136315138;
      id v21 = [v13 UTF8String];
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "TaskingId %s Ending.\n", (uint8_t *)&v20, 0xCu);
    }
    long long v14 = [(ASPCarryLogStateMachine *)self nandDriver];
    [v14 iolog_disable];

    [(ASPCarryLogStateMachine *)self unregisterIOLoggingXPC];
    [(ASPCarryLogStateMachine *)self _unmarkCurrentTasking];
LABEL_10:
    if (![(ASPCarryLogStateMachine *)self _canJoinTaskingPerStatsDriver:v4])
    {
LABEL_12:
      if ([(ASPCarryLogStateMachine *)self _hasActiveTasking])
      {
        CFStringRef v15 = @"active";
      }
      else
      {
        [(ASPCarryLogStateMachine *)self unregisterIOLoggingXPC];
        if ([(__CFString *)v7 isEqualToString:@"active"])
        {
          CFStringRef v15 = @"just_ended";
        }
        else
        {
          if ([(__CFString *)v7 isEqualToString:@"just_ended"]) {
            [(ASPCarryLogStateMachine *)self _cleanUpAfterTasking];
          }
          CFStringRef v15 = @"inactive";
        }
        __int16 v19 = [(ASPCarryLogStateMachine *)self stateMgr];
        if ([(ASPCarryLogStateMachine *)self isInternalBuild]) {
          [v19 setValue:@"No active tasking and no iolog collection ongoing" forKey:@"aspcarrylog_tasking_info" inDomain:@"/var/mobile/Library/Preferences/com.apple.nandCarryLogs.plist"];
        }
      }
      id v17 = [(ASPCarryLogStateMachine *)self stateMgr];
      [v17 setValue:v15 forKey:@"daily_check_tasking_status"];
      goto LABEL_25;
    }
LABEL_11:
    [(ASPCarryLogStateMachine *)self _tryActivateTasking];
    goto LABEL_12;
  }
  if (v10)
  {
    __int16 v16 = v9;
    id v17 = [(ASPCarryLogStateMachine *)self currentTaskingInfo];
    id v18 = [v17 objectForKeyedSubscript:@"id"];
    int v20 = 136315138;
    id v21 = [v18 UTF8String];
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "TaskingId %s continue.\n", (uint8_t *)&v20, 0xCu);

LABEL_25:
  }
}

- (void)bootCheck
{
  if ([(ASPCarryLogStateMachine *)self _checkSnBuildVariantMatch]
    && [(ASPCarryLogStateMachine *)self _hasActiveTasking])
  {
    if ([(ASPCarryLogStateMachine *)self _activeTaskingExpired])
    {
      id v3 = (void *)oslog;
      if (os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_DEFAULT))
      {
        id v4 = v3;
        uint64_t v5 = [(ASPCarryLogStateMachine *)self currentTaskingInfo];
        id v6 = [v5 objectForKeyedSubscript:@"id"];
        int v20 = 136315138;
        id v21 = [v6 UTF8String];
        _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "TaskingId %s Ending.\n", (uint8_t *)&v20, 0xCu);
      }
      unsigned int v7 = [(ASPCarryLogStateMachine *)self nandDriver];
      [v7 iolog_disable];

      [(ASPCarryLogStateMachine *)self _unmarkCurrentTasking];
      unsigned int v8 = [(ASPCarryLogStateMachine *)self stateMgr];
      if ([(ASPCarryLogStateMachine *)self isInternalBuild]) {
        [v8 setValue:@"No active tasking and no iolog collection ongoing" forKey:@"aspcarrylog_tasking_info" inDomain:@"/var/mobile/Library/Preferences/com.apple.nandCarryLogs.plist"];
      }
    }
    else
    {
      BOOL v10 = [(ASPCarryLogStateMachine *)self currentTaskingInfo];
      unsigned int v8 = [v10 objectForKeyedSubscript:@"id"];

      long long v11 = [(ASPCarryLogStateMachine *)self stateMgr];
      long long v12 = uploadInfoKeyFromTaskingId((uint64_t)v8);
      id v13 = [v11 getValueForKey:v12 expectedType:2];

      if (v13)
      {
        long long v14 = [v13 objectForKey:@"spd_state"];

        if (!v14)
        {
          CFStringRef v15 = [(ASPCarryLogStateMachine *)self nandDriver];
          [v15 iolog_enable];
        }
      }
      [(ASPCarryLogStateMachine *)self registerIOLoggingXPCforInternalBuild:[(ASPCarryLogStateMachine *)self isInternalBuild]];
      __int16 v16 = (void *)oslog;
      if (os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_DEFAULT))
      {
        id v17 = v16;
        id v18 = [(ASPCarryLogStateMachine *)self currentTaskingInfo];
        id v19 = [v18 objectForKeyedSubscript:@"id"];
        int v20 = 136315138;
        id v21 = [v19 UTF8String];
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "TaskingId %s running.\n", (uint8_t *)&v20, 0xCu);
      }
    }
  }
  else
  {
    id v9 = oslog;
    if (os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v20) = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "No active tasking at boot", (uint8_t *)&v20, 2u);
    }
  }
}

- (NSString)workDir
{
  return self->_workDir;
}

- (void)setWorkDir:(id)a3
{
}

- (StateMgr)stateMgr
{
  return self->_stateMgr;
}

- (void)setStateMgr:(id)a3
{
}

- (NSMutableDictionary)currentTaskingInfo
{
  return self->_currentTaskingInfo;
}

- (void)setCurrentTaskingInfo:(id)a3
{
}

- (NSMutableArray)taskingIdHistory
{
  return self->_taskingIdHistory;
}

- (void)setTaskingIdHistory:(id)a3
{
}

- (TaskingManager)DATaskingMgr
{
  return self->_DATaskingMgr;
}

- (void)setDATaskingMgr:(id)a3
{
}

- (NSString)DATaskingID
{
  return self->_DATaskingID;
}

- (void)setDATaskingID:(id)a3
{
}

- (int64_t)taskingDuration
{
  return self->_taskingDuration;
}

- (void)setTaskingDuration:(int64_t)a3
{
  self->_taskingDuration = a3;
}

- (int64_t)taskingSizeLimit
{
  return self->_taskingSizeLimit;
}

- (void)setTaskingSizeLimit:(int64_t)a3
{
  self->_taskingSizeLimit = a3;
}

- (BOOL)isLegacyUI_IOLogEnabled
{
  return self->_isLegacyUI_IOLogEnabled;
}

- (void)setIsLegacyUI_IOLogEnabled:(BOOL)a3
{
  self->_isLegacyUI_IOLogEnabled = a3;
}

- (BOOL)isLegacyUI_TaskingDisabled
{
  return self->_isLegacyUI_TaskingDisabled;
}

- (void)setIsLegacyUI_TaskingDisabled:(BOOL)a3
{
  self->_isLegacyUI_TaskingDisabled = a3;
}

- (BOOL)isInternal
{
  return self->_isInternal;
}

- (void)setIsInternal:(BOOL)a3
{
  self->_isInternal = a3;
}

- (CarryLog_NANDDriver)nandDriver
{
  return self->_nandDriver;
}

- (void)setNandDriver:(id)a3
{
}

- (CarryLog_UploadDriver)uploadDriver
{
  return self->_uploadDriver;
}

- (void)setUploadDriver:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uploadDriver, 0);
  objc_storeStrong((id *)&self->_nandDriver, 0);
  objc_storeStrong((id *)&self->_DATaskingID, 0);
  objc_storeStrong((id *)&self->_DATaskingMgr, 0);
  objc_storeStrong((id *)&self->_taskingIdHistory, 0);
  objc_storeStrong((id *)&self->_currentTaskingInfo, 0);
  objc_storeStrong((id *)&self->_stateMgr, 0);

  objc_storeStrong((id *)&self->_workDir, 0);
}

@end
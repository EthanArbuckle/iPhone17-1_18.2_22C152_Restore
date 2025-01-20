@interface CLDurianClientAdapter
- (BOOL)valid;
- (CLDurianClientAdapter)initWithClient:(CLDurianManagementClient *)a3;
- (CLDurianManagementClient)client;
- (NSString)clientname;
- (id)clientIdentifier;
- (void)dealloc;
- (void)didCompleteAggressiveAdvertisingOnDevice:(id)a3 withError:(id)a4;
- (void)didCompleteHawkeyeTaskWithOpcode:(unsigned __int16)a3 fromDevice:(id)a4 withError:(id)a5;
- (void)didCompletePlayingSoundOnTag:(id)a3 withError:(id)a4;
- (void)didCompletePlayingUnauthorizedSoundOnTag:(id)a3 withError:(id)a4;
- (void)didCompleteRangingOnTag:(id)a3 withStatus:(unsigned int)a4 endReason:(unsigned __int8)a5 error:(id)a6;
- (void)didConfigureRangingOnTag:(id)a3 withStatus:(unsigned int)a4 error:(id)a5;
- (void)didConnectToTag:(id)a3 withMacAddress:(id)a4 withError:(id)a5;
- (void)didDeinitRangingOnTag:(id)a3 withStatus:(unsigned int)a4 error:(id)a5;
- (void)didDetectCrashOnTag:(id)a3;
- (void)didDisconnectFromTag:(id)a3 withError:(id)a4;
- (void)didDumpLogs:(id)a3 ofType:(unint64_t)a4 fromTag:(id)a5 withError:(id)a6;
- (void)didFailRangingEventCounterActionForTag:(id)a3 error:(id)a4;
- (void)didFetchAISAccessoryCapabilitiesFromDevice:(id)a3 accessoryCapabilities:(id)a4 error:(id)a5;
- (void)didFetchAISAccessoryCategoryFromDevice:(id)a3 accessoryCategory:(unsigned __int8)a4 error:(id)a5;
- (void)didFetchAISBatteryLevelFromDevice:(id)a3 batteryLevel:(unsigned __int8)a4 error:(id)a5;
- (void)didFetchAISBatteryTypeFromDevice:(id)a3 batteryType:(unsigned __int8)a4 error:(id)a5;
- (void)didFetchAISFirmwareVersionFromDevice:(id)a3 firmwareVersion:(id)a4 error:(id)a5;
- (void)didFetchAISManufacturerNameFromDevice:(id)a3 manufacturerName:(id)a4 error:(id)a5;
- (void)didFetchAISModelNameFromDevice:(id)a3 modelName:(id)a4 error:(id)a5;
- (void)didFetchAISNetworkIDFromDevice:(id)a3 networkID:(unsigned __int8)a4 error:(id)a5;
- (void)didFetchAISProductDataFromDevice:(id)a3 productData:(id)a4 error:(id)a5;
- (void)didFetchAISProtocolImplementationFromDevice:(id)a3 protocolImplementation:(unsigned int)a4 error:(id)a5;
- (void)didFetchAISSerialNumberFromDevice:(id)a3 serialNumber:(id)a4 error:(id)a5;
- (void)didFetchAccelerometerMode:(unsigned __int8)a3 onTag:(id)a4 error:(id)a5;
- (void)didFetchAccelerometerOrientationModeConfiguration:(id)a3 onTag:(id)a4 error:(id)a5;
- (void)didFetchAccelerometerSlopeModeConfiguration:(id)a3 onTag:(id)a4 error:(id)a5;
- (void)didFetchBatteryStatus:(unint64_t)a3 fromTag:(id)a4 withError:(id)a5;
- (void)didFetchConnectionState:(unint64_t)a3 forTag:(id)a4 withError:(id)a5;
- (void)didFetchFirmwareVersion:(id)a3 fromTag:(id)a4 withError:(id)a5;
- (void)didFetchHawkeyeAISAccessoryCapabilitiesFromDevice:(id)a3 accessoryCapabilities:(id)a4 error:(id)a5;
- (void)didFetchHawkeyeAISAccessoryCategoryFromDevice:(id)a3 accessoryCategory:(id)a4 error:(id)a5;
- (void)didFetchHawkeyeAISBatteryTypeFromDevice:(id)a3 batteryType:(id)a4 error:(id)a5;
- (void)didFetchHawkeyeAISFindMyVersionFromDevice:(id)a3 findMyVersion:(unsigned int)a4 error:(id)a5;
- (void)didFetchHawkeyeAISManufacturerNameFromDevice:(id)a3 manufacturerName:(id)a4 error:(id)a5;
- (void)didFetchHawkeyeAISModelColorCodeFromDevice:(id)a3 modelColorCode:(id)a4 error:(id)a5;
- (void)didFetchHawkeyeAISModelNameFromDevice:(id)a3 modelName:(id)a4 error:(id)a5;
- (void)didFetchHawkeyeAISProductDataFromDevice:(id)a3 productData:(id)a4 error:(id)a5;
- (void)didFetchHawkeyeCurrentPrimaryKeyFromDevice:(id)a3 currentPrimaryKey:(id)a4 error:(id)a5;
- (void)didFetchHawkeyeSerialNumberFromDevice:(id)a3 serialNumber:(id)a4 error:(id)a5;
- (void)didFetchHawkeyeiCloudIdentifierFromDevice:(id)a3 iCloudIdentifier:(id)a4 error:(id)a5;
- (void)didFetchStatusOfUTEnablementRequirementsWithStatus:(id)a3;
- (void)didFetchTxPower:(id)a3 fromDevice:(id)a4 withError:(id)a5;
- (void)didFetchUserStats:(id)a3 fromTag:(id)a4 withError:(id)a5;
- (void)didFetchUserStats_Deprecated:(id)a3 fromTag:(id)a4 withError:(id)a5;
- (void)didFetchWhetherLocalFirmwareAssetIsInUseForProductGroup:(id)a3 andProductNumber:(id)a4 withResult:(BOOL)a5;
- (void)didGetMultiStatus:(unint64_t)a3 forTag:(id)a4 withError:(id)a5;
- (void)didHaveRangingMovementOnTag:(id)a3;
- (void)didInitRangingOnTag:(id)a3 withStatus:(unsigned int)a4 error:(id)a5;
- (void)didPrepareRangingOnTag:(id)a3 error:(id)a4;
- (void)didReceiveGroupRelationStatus:(unsigned __int8)a3 maintenanceStatus:(unsigned __int8)a4 onTag:(id)a5 withError:(id)a6;
- (void)didReceiveHawkeyeDataFragment:(id)a3 withOpcode:(unsigned __int16)a4 fromDevice:(id)a5 error:(id)a6;
- (void)didReceiveKeyRollIndex:(unsigned int)a3 onTag:(id)a4;
- (void)didReceiveRangingErrorFromTag:(id)a3 withStatus:(unsigned int)a4;
- (void)didReceiveRangingTimestampsFromTag:(id)a3 eventStatus:(unsigned __int16)a4 rtt:(unint64_t)a5 tat:(unint64_t)a6 cycleIndex:(unsigned __int16)a7;
- (void)didRetrievePersonalizationInformation:(id)a3 forTag:(id)a4 error:(id)a5;
- (void)didRollWildKeyOnTag:(id)a3 withError:(id)a4;
- (void)didSetAccelerometerOrientationModeConfigurationOnTag:(id)a3 error:(id)a4;
- (void)didSetAccelerometerSlopeModeConfigurationOnTag:(id)a3 error:(id)a4;
- (void)didSetBatteryStatusOnTag:(id)a3 error:(id)a4;
- (void)didSetHawkeyeUTMotionConfigForDevice:(id)a3 withError:(id)a4;
- (void)didSetNearOwnerTimeoutOnTag:(id)a3 withError:(id)a4;
- (void)didSetObfuscatedIdentifierOnTag:(id)a3 withError:(id)a4;
- (void)didSetTagTypeOnTag:(id)a3 withError:(id)a4;
- (void)didSetUnauthorizedPlaySoundRateLimitFromTag:(id)a3 error:(id)a4;
- (void)didSetWildModeConfigruationOnTag:(id)a3 withError:(id)a4;
- (void)didStartAggressiveAdvertisingOnDevice:(id)a3 withError:(id)a4;
- (void)didStartPlayingSoundOnTag:(id)a3 withError:(id)a4;
- (void)didStartPlayingUnauthorizedSoundOnTag:(id)a3 withError:(id)a4;
- (void)didStartRangingOnTag:(id)a3 error:(id)a4;
- (void)didStartUnauthorizedAggressiveAdvertisingOnDevice:(id)a3 withError:(id)a4;
- (void)didStopAggressiveAdvertisingOnDevice:(id)a3 withError:(id)a4;
- (void)didStopPlayingSoundOnTag:(id)a3 withError:(id)a4;
- (void)didStopPlayingUnauthorizedSoundOnTag:(id)a3 withError:(id)a4;
- (void)didUnpairFromTag:(id)a3 withError:(id)a4;
- (void)didUpdateFirmwareForTag:(id)a3 error:(id)a4;
- (void)didUseDefaultFirmwareAssetRequestForProductGroup:(id)a3 andProductNumber:(id)a4 withError:(id)a5;
- (void)didUseLocalFirmwareAssetRequestForProductGroup:(id)a3 andProductNumber:(id)a4 withError:(id)a5;
- (void)onAvengerAdvertisement:(id)a3 reconciledInformation:(id)a4;
- (void)onUpdatedPowerState;
- (void)sendMessage:()basic_string<char forTag:()std:(std::allocator<char>> *)a3 :char_traits<char> withError:;
- (void)sendMessage:()basic_string<char forTag:()std:(std::allocator<char>> *)a3 :char_traits<char> withPayload:;
- (void)setClient:(CLDurianManagementClient *)a3;
- (void)setValid:(BOOL)a3;
@end

@implementation CLDurianClientAdapter

- (CLDurianClientAdapter)initWithClient:(CLDurianManagementClient *)a3
{
  v10.receiver = self;
  v10.super_class = (Class)CLDurianClientAdapter;
  v4 = [(CLDurianClientAdapter *)&v10 init];
  v5 = v4;
  if (v4)
  {
    v4->_valid = 1;
    v4->_client = a3;
    (*((void (**)(void **__return_ptr, CLDurianManagementClient *))a3->var0 + 3))(&__p, a3);
    if (SBYTE3(v15) >= 0) {
      p_p = &__p;
    }
    else {
      p_p = __p;
    }
    v5->_clientname = (NSString *)[(NSArray *)[+[NSString stringWithUTF8String:p_p] componentsSeparatedByString:@"/"] lastObject];
    if (SBYTE3(v15) < 0) {
      operator delete(__p);
    }
    if (qword_102419390 != -1) {
      dispatch_once(&qword_102419390, &stru_1022BCAF8);
    }
    v7 = qword_102419398;
    if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
    {
      clientname = v5->_clientname;
      __p = (void *)68289282;
      __int16 v12 = 2082;
      v13 = "";
      __int16 v14 = 2114;
      v15 = clientname;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #client init\", \"name\":%{public, location:escape_only}@}", (uint8_t *)&__p, 0x1Cu);
    }
  }
  return v5;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)CLDurianClientAdapter;
  [(CLDurianClientAdapter *)&v3 dealloc];
}

- (void)sendMessage:()basic_string<char forTag:()std:(std::allocator<char>> *)a3 :char_traits<char> withError:
{
  v5 = v4;
  v6 = v3;
  v25 = 0;
  if (v4)
  {
    v40[0] = @"CLDurianIdentifier";
    v40[1] = @"CLDurianError";
    v41[0] = v3;
    v41[1] = v4;
    v8 = +[NSDictionary dictionaryWithObjects:v41 forKeys:v40 count:2];
  }
  else
  {
    CFStringRef v38 = @"CLDurianIdentifier";
    v39 = v3;
    v8 = +[NSDictionary dictionaryWithObjects:&v39 forKeys:&v38 count:1];
  }
  v25 = v8;
  sub_1005A5B04(&v23);
  uint64_t v9 = CLConnectionMessage::name(v23);
  if (*(char *)(v9 + 23) >= 0) {
    uint64_t v10 = v9;
  }
  else {
    uint64_t v10 = *(void *)v9;
  }
  id v11 = [(NSArray *)[+[NSString stringWithUTF8String:v10] componentsSeparatedByString:@"/"] lastObject];
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_1022BCAF8);
  }
  __int16 v12 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    id v13 = [[objc_msgSend(v6, "description") substringToIndex:8];
    clientname = self->_clientname;
    id v15 = [v5 description];
    *(_DWORD *)buf = 68290051;
    __int16 v28 = 2082;
    int v27 = 0;
    v29 = "";
    __int16 v30 = 2114;
    id v31 = v11;
    __int16 v32 = 2113;
    id v33 = v13;
    __int16 v34 = 2114;
    v35 = clientname;
    __int16 v36 = 2114;
    id v37 = v15;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #client sendMessage\", \"name\":%{public, location:escape_only}@, \"item\":%{private, location:escape_only}@, \"client\":%{public, location:escape_only}@, \"error\":%{public, location:escape_only}@}", buf, 0x3Au);
  }
  if ([(CLDurianClientAdapter *)self client])
  {
    v16 = [(CLDurianClientAdapter *)self client];
    v17 = v24;
    v22[0] = v23;
    v22[1] = v24;
    if (v24) {
      atomic_fetch_add_explicit(&v24->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    sub_1005993EC((uint64_t)v16, (uint64_t)v22);
    if (v17) {
      sub_1000DB0A0(v17);
    }
  }
  else
  {
    if (qword_102419390 != -1) {
      dispatch_once(&qword_102419390, &stru_1022BCAF8);
    }
    v18 = qword_102419398;
    if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_ERROR))
    {
      id v19 = [[objc_msgSend(v6, "description") substringToIndex:8];
      *(_DWORD *)buf = 68289283;
      int v27 = 0;
      __int16 v28 = 2082;
      v29 = "";
      __int16 v30 = 2113;
      id v31 = v19;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#durian #client invalid\", \"item\":%{private, location:escape_only}@}", buf, 0x1Cu);
      if (qword_102419390 != -1) {
        dispatch_once(&qword_102419390, &stru_1022BCAF8);
      }
    }
    v20 = qword_102419398;
    if (os_signpost_enabled((os_log_t)qword_102419398))
    {
      id v21 = [[objc_msgSend(v6, "description") substringToIndex:8];
      *(_DWORD *)buf = 68289283;
      int v27 = 0;
      __int16 v28 = 2082;
      v29 = "";
      __int16 v30 = 2113;
      id v31 = v21;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v20, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#durian #client invalid", "{\"msg%{public}.0s\":\"#durian #client invalid\", \"item\":%{private, location:escape_only}@}", buf, 0x1Cu);
    }
  }
  if (v24) {
    sub_1000DB0A0(v24);
  }
}

- (void)sendMessage:()basic_string<char forTag:()std:(std::allocator<char>> *)a3 :char_traits<char> withPayload:
{
  v5 = v3;
  id v24 = v4;
  sub_1005A5B04(&v22);
  id v7 = [v24 objectForKey:@"CLDurianError"];
  uint64_t v8 = CLConnectionMessage::name(v22);
  if (*(char *)(v8 + 23) >= 0) {
    uint64_t v9 = v8;
  }
  else {
    uint64_t v9 = *(void *)v8;
  }
  id v10 = [(NSArray *)[+[NSString stringWithUTF8String:v9] componentsSeparatedByString:@"/"] lastObject];
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_1022BCAF8);
  }
  id v11 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    id v12 = [[[v5 description] substringToIndex:8];
    clientname = self->_clientname;
    id v14 = [v7 description];
    *(_DWORD *)buf = 68290307;
    int v26 = 0;
    __int16 v27 = 2082;
    __int16 v28 = "";
    __int16 v29 = 2114;
    id v30 = v10;
    __int16 v31 = 2113;
    id v32 = v12;
    __int16 v33 = 2114;
    __int16 v34 = clientname;
    __int16 v35 = 2114;
    id v36 = v14;
    __int16 v37 = 2113;
    id v38 = v24;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #client sendMessage\", \"name\":%{public, location:escape_only}@, \"item\":%{private, location:escape_only}@, \"client\":%{public, location:escape_only}@, \"error\":%{public, location:escape_only}@, \"payload\":%{private, location:escape_only}@}", buf, 0x44u);
  }
  if ([(CLDurianClientAdapter *)self client])
  {
    id v15 = [(CLDurianClientAdapter *)self client];
    v16 = v23;
    v21[0] = v22;
    v21[1] = v23;
    if (v23) {
      atomic_fetch_add_explicit(&v23->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    sub_1005993EC((uint64_t)v15, (uint64_t)v21);
    if (v16) {
      sub_1000DB0A0(v16);
    }
  }
  else
  {
    if (qword_102419390 != -1) {
      dispatch_once(&qword_102419390, &stru_1022BCAF8);
    }
    v17 = qword_102419398;
    if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_ERROR))
    {
      id v18 = [[objc_msgSend(v5, "description") substringToIndex:8];
      *(_DWORD *)buf = 68289283;
      int v26 = 0;
      __int16 v27 = 2082;
      __int16 v28 = "";
      __int16 v29 = 2113;
      id v30 = v18;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#durian #client invalid\", \"item\":%{private, location:escape_only}@}", buf, 0x1Cu);
      if (qword_102419390 != -1) {
        dispatch_once(&qword_102419390, &stru_1022BCAF8);
      }
    }
    id v19 = qword_102419398;
    if (os_signpost_enabled((os_log_t)qword_102419398))
    {
      id v20 = [[[v5 description] substringToIndex:8];
      *(_DWORD *)buf = 68289283;
      int v26 = 0;
      __int16 v27 = 2082;
      __int16 v28 = "";
      __int16 v29 = 2113;
      id v30 = v20;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v19, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#durian #client invalid", "{\"msg%{public}.0s\":\"#durian #client invalid\", \"item\":%{private, location:escape_only}@}", buf, 0x1Cu);
    }
  }
  if (v23) {
    sub_1000DB0A0(v23);
  }
}

- (void)onAvengerAdvertisement:(id)a3 reconciledInformation:(id)a4
{
  if (_os_feature_enabled_impl() && ([a3 isApple] & 1) == 0)
  {
    if (qword_102419390 != -1) {
      dispatch_once(&qword_102419390, &stru_1022BCAF8);
    }
    uint64_t v13 = qword_102419398;
    if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 68289026;
      int v17 = 0;
      __int16 v18 = 2082;
      id v19 = "";
      id v10 = "{\"msg%{public}.0s\":\"#durian #client dropping non-Apple advertisement\"}";
      id v11 = v13;
      uint32_t v12 = 18;
      goto LABEL_23;
    }
  }
  else
  {
    if (a4 && [a4 uuid])
    {
      id v7 = +[NSMutableDictionary dictionary];
      if ([a3 scanDate]) {
        [v7 setObject:[a3 scanDate] forKeyedSubscript:@"CLAvengerAdvertisementScanDateKey"];
      }
      if ([a3 address]) {
        [v7 setObject:[a3 address] forKeyedSubscript:@"CLAvengerAdvertisementAddressKey"];
      }
      if ([a3 advertisementData]) {
        [v7 setObject:objc_msgSend(a3, "advertisementData") forKeyedSubscript:@"CLAvengerAdvertisementDataKey"];
      }
      if ([a3 reserved]) {
        [v7 setObject:objc_msgSend(a3, "reserved") forKeyedSubscript:@"CLAvengerAdvertisementReservedKey"];
      }
      [v7 setObject:+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [a4 type]) forKeyedSubscript:@"CLAvengerAdvertisementOwnershipTypeKey"];
      [v7 setObject:+[NSNumber numberWithUnsignedChar:](NSNumber, "numberWithUnsignedChar:", [a3 status]) forKeyedSubscript:@"CLAvengerAdvertisementStatusKey"];
      [v7 setObject:[+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(a3, "rssi"))] forKeyedSubscript:@"CLAvengerAdvertisementRSSIKey"];
      [v7 setObject:objc_msgSend(a4, "uuid") forKeyedSubscript:@"CLDurianIdentifier"];
      if ([a3 channel]) {
        uint64_t v8 = (_UNKNOWN **)[a3 channel];
      }
      else {
        uint64_t v8 = &off_102392750;
      }
      [v7 setObject:v8 forKeyedSubscript:@"CLAvengerAdvertisementChannelKey"];
      sub_100134750(__p, "DurianManagement/DidObserveAdvertisement");
      -[CLDurianClientAdapter sendMessage:forTag:withPayload:](self, "sendMessage:forTag:withPayload:", __p, [a4 uuid], v7);
      if (v15 < 0) {
        operator delete(__p[0]);
      }
      return;
    }
    if (qword_102419390 != -1) {
      dispatch_once(&qword_102419390, &stru_1022BCAF8);
    }
    uint64_t v9 = qword_102419398;
    if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 68290563;
      int v17 = 0;
      __int16 v18 = 2082;
      id v19 = "";
      __int16 v20 = 2113;
      id v21 = [a3 address];
      __int16 v22 = 2113;
      id v23 = [a3 advertisementData];
      __int16 v24 = 2113;
      id v25 = [a3 scanDate];
      __int16 v26 = 1025;
      unsigned int v27 = [a3 status];
      __int16 v28 = 2049;
      id v29 = [a3 rssi];
      __int16 v30 = 2113;
      id v31 = [a3 reserved];
      id v10 = "{\"msg%{public}.0s\":\"#durian #client skipping unreconciled advertisement\", \"address\":%{private, locatio"
            "n:escape_only}@, \"advertisementData\":%{private, location:escape_only}@, \"scanDate\":%{private, location:e"
            "scape_only}@, \"status\":%{private}u, \"rssi\":%{private}ld, \"reserved\":%{private, location:escape_only}@}";
      id v11 = v9;
      uint32_t v12 = 74;
LABEL_23:
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, v10, buf, v12);
    }
  }
}

- (id)clientIdentifier
{
  return self->_clientname;
}

- (void)onUpdatedPowerState
{
  v2 = [(CLDurianClientAdapter *)self client];

  sub_100599C7C((uint64_t)v2);
}

- (void)didStartPlayingSoundOnTag:(id)a3 withError:(id)a4
{
  sub_100134750(__p, "DurianManagement/DidStartPlayingSound");
  [(CLDurianClientAdapter *)self sendMessage:__p forTag:a3 withError:a4];
  if (v8 < 0) {
    operator delete(__p[0]);
  }
}

- (void)didCompletePlayingSoundOnTag:(id)a3 withError:(id)a4
{
  sub_100134750(__p, "DurianManagement/DidCompletePlayingSound");
  [(CLDurianClientAdapter *)self sendMessage:__p forTag:a3 withError:a4];
  if (v8 < 0) {
    operator delete(__p[0]);
  }
}

- (void)didStopPlayingSoundOnTag:(id)a3 withError:(id)a4
{
  sub_100134750(__p, "DurianManagement/DidStopPlayingSound");
  [(CLDurianClientAdapter *)self sendMessage:__p forTag:a3 withError:a4];
  if (v8 < 0) {
    operator delete(__p[0]);
  }
}

- (void)didCompletePlayingUnauthorizedSoundOnTag:(id)a3 withError:(id)a4
{
  sub_100134750(__p, "DurianManagement/DidCompletePlayingUnauthorizedSound");
  [(CLDurianClientAdapter *)self sendMessage:__p forTag:a3 withError:a4];
  if (v8 < 0) {
    operator delete(__p[0]);
  }
}

- (void)didStartPlayingUnauthorizedSoundOnTag:(id)a3 withError:(id)a4
{
  sub_100134750(__p, "DurianManagement/DidStartPlayingUnauthorizedSound");
  [(CLDurianClientAdapter *)self sendMessage:__p forTag:a3 withError:a4];
  if (v8 < 0) {
    operator delete(__p[0]);
  }
}

- (void)didStopPlayingUnauthorizedSoundOnTag:(id)a3 withError:(id)a4
{
  sub_100134750(__p, "DurianManagement/DidStopPlayingUnauthorizedSound");
  [(CLDurianClientAdapter *)self sendMessage:__p forTag:a3 withError:a4];
  if (v8 < 0) {
    operator delete(__p[0]);
  }
}

- (void)didConnectToTag:(id)a3 withMacAddress:(id)a4 withError:(id)a5
{
  if (a5)
  {
    v16[0] = @"CLDurianIdentifier";
    v16[1] = @"CLDurianError";
    v17[0] = a3;
    v17[1] = a5;
    id v7 = +[NSDictionary dictionaryWithObjects:v17 forKeys:v16 count:2];
    sub_100134750(v12, "DurianManagement/DidConnect");
    [(CLDurianClientAdapter *)self sendMessage:v12 forTag:a3 withPayload:v7];
    if ((v13 & 0x80000000) == 0) {
      return;
    }
    char v8 = (void **)v12;
  }
  else
  {
    v14[0] = @"CLDurianIdentifier";
    v14[1] = @"CLDurianMacAddress";
    v15[0] = a3;
    v15[1] = a4;
    uint64_t v9 = +[NSDictionary dictionaryWithObjects:v15 forKeys:v14 count:2];
    sub_100134750(v10, "DurianManagement/DidConnect");
    [(CLDurianClientAdapter *)self sendMessage:v10 forTag:a3 withPayload:v9];
    if ((v11 & 0x80000000) == 0) {
      return;
    }
    char v8 = (void **)v10;
  }
  operator delete(*v8);
}

- (void)didDisconnectFromTag:(id)a3 withError:(id)a4
{
  sub_100134750(__p, "DurianManagement/DidDisconnect");
  [(CLDurianClientAdapter *)self sendMessage:__p forTag:a3 withError:a4];
  if (v8 < 0) {
    operator delete(__p[0]);
  }
}

- (void)didReceiveKeyRollIndex:(unsigned int)a3 onTag:(id)a4
{
  v9[0] = @"CLDurianIdentifier";
  v9[1] = @"CLDurianKeyRollIndex";
  v10[0] = a4;
  v10[1] = +[NSNumber numberWithUnsignedInt:*(void *)&a3];
  v6 = +[NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:2];
  sub_100134750(__p, "DurianManagement/DidReceiveKeyRollIndex");
  [(CLDurianClientAdapter *)self sendMessage:__p forTag:a4 withPayload:v6];
  if (v8 < 0) {
    operator delete(__p[0]);
  }
}

- (void)didFetchConnectionState:(unint64_t)a3 forTag:(id)a4 withError:(id)a5
{
  v10[0] = @"CLDurianIdentifier";
  v10[1] = @"CLDurianConnectionState";
  v11[0] = a4;
  v11[1] = +[NSNumber numberWithUnsignedInteger:a3];
  id v7 = +[NSDictionary dictionaryWithObjects:v11 forKeys:v10 count:2];
  sub_100134750(__p, "DurianManagement/DidFetchConnectionState");
  [(CLDurianClientAdapter *)self sendMessage:__p forTag:a4 withPayload:v7];
  if (v9 < 0) {
    operator delete(__p[0]);
  }
}

- (void)didGetMultiStatus:(unint64_t)a3 forTag:(id)a4 withError:(id)a5
{
  CFStringRef v13 = @"CLDurianIdentifier";
  id v14 = a4;
  char v9 = +[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", +[NSDictionary dictionaryWithObjects:&v14 forKeys:&v13 count:1]);
  id v10 = v9;
  if (a5)
  {
    [(NSMutableDictionary *)v9 setObject:a5 forKey:@"CLDurianError"];
  }
  else if (a3)
  {
    [(NSMutableDictionary *)v9 setObject:+[NSNumber numberWithUnsignedInteger:a3] forKey:@"CLDurianMultiStatus"];
  }
  sub_100134750(__p, "DurianManagement/DidGetMultiStatus");
  [(CLDurianClientAdapter *)self sendMessage:__p forTag:a4 withPayload:v10];
  if (v12 < 0) {
    operator delete(__p[0]);
  }
}

- (void)didReceiveGroupRelationStatus:(unsigned __int8)a3 maintenanceStatus:(unsigned __int8)a4 onTag:(id)a5 withError:(id)a6
{
  uint64_t v7 = a4;
  v13[0] = a5;
  v12[0] = @"CLDurianIdentifier";
  v12[1] = @"CLDurianGroupRelation";
  v13[1] = +[NSNumber numberWithUnsignedChar:a3];
  void v12[2] = @"CLDurianGroupMaintenance";
  v13[2] = +[NSNumber numberWithUnsignedChar:v7];
  char v9 = +[NSDictionary dictionaryWithObjects:v13 forKeys:v12 count:3];
  sub_100134750(__p, "DurianManagement/DidReceiveGroupStatus");
  [(CLDurianClientAdapter *)self sendMessage:__p forTag:a5 withPayload:v9];
  if (v11 < 0) {
    operator delete(__p[0]);
  }
}

- (void)didDetectCrashOnTag:(id)a3
{
  CFStringRef v8 = @"CLDurianIdentifier";
  id v9 = a3;
  v5 = +[NSDictionary dictionaryWithObjects:&v9 forKeys:&v8 count:1];
  sub_100134750(__p, "DurianManagement/DidDetectCrash");
  [(CLDurianClientAdapter *)self sendMessage:__p forTag:a3 withPayload:v5];
  if (v7 < 0) {
    operator delete(__p[0]);
  }
}

- (void)didDumpLogs:(id)a3 ofType:(unint64_t)a4 fromTag:(id)a5 withError:(id)a6
{
  v15[0] = @"CLDurianIdentifier";
  v15[1] = @"CLDurianLogType";
  v16[0] = a5;
  v16[1] = +[NSNumber numberWithUnsignedInteger:a4];
  id v10 = +[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", +[NSDictionary dictionaryWithObjects:v16 forKeys:v15 count:2]);
  char v11 = v10;
  if (a6)
  {
    char v12 = &off_1022B5558;
  }
  else
  {
    if (!a3) {
      goto LABEL_6;
    }
    char v12 = &off_1022B5560;
    a6 = a3;
  }
  [(NSMutableDictionary *)v10 setObject:a6 forKey:*v12];
LABEL_6:
  sub_100134750(__p, "DurianManagement/DidDumpLogs");
  [(CLDurianClientAdapter *)self sendMessage:__p forTag:a5 withPayload:v11];
  if (v14 < 0) {
    operator delete(__p[0]);
  }
}

- (void)didFetchFirmwareVersion:(id)a3 fromTag:(id)a4 withError:(id)a5
{
  CFStringRef v14 = @"CLDurianIdentifier";
  id v15 = a4;
  id v9 = +[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", +[NSDictionary dictionaryWithObjects:&v15 forKeys:&v14 count:1]);
  id v10 = v9;
  if (a5)
  {
    char v11 = &off_1022B5558;
  }
  else
  {
    if (!a3) {
      goto LABEL_6;
    }
    char v11 = &off_1022B5570;
    a5 = a3;
  }
  [(NSMutableDictionary *)v9 setObject:a5 forKey:*v11];
LABEL_6:
  sub_100134750(__p, "DurianManagement/DidFetchFirmwareVersion");
  [(CLDurianClientAdapter *)self sendMessage:__p forTag:a4 withPayload:v10];
  if (v13 < 0) {
    operator delete(__p[0]);
  }
}

- (void)didFetchUserStats_Deprecated:(id)a3 fromTag:(id)a4 withError:(id)a5
{
  CFStringRef v14 = @"CLDurianIdentifier";
  id v15 = a4;
  id v9 = +[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", +[NSDictionary dictionaryWithObjects:&v15 forKeys:&v14 count:1]);
  id v10 = v9;
  if (a5)
  {
    char v11 = &off_1022B5558;
  }
  else
  {
    if (!a3) {
      goto LABEL_6;
    }
    char v11 = &off_1022B55D0;
    a5 = a3;
  }
  [(NSMutableDictionary *)v9 setObject:a5 forKey:*v11];
LABEL_6:
  sub_100134750(__p, "DurianManagement/DidFetchUserStats_Deprecated");
  [(CLDurianClientAdapter *)self sendMessage:__p forTag:a4 withPayload:v10];
  if (v13 < 0) {
    operator delete(__p[0]);
  }
}

- (void)didFetchUserStats:(id)a3 fromTag:(id)a4 withError:(id)a5
{
  CFStringRef v14 = @"CLDurianIdentifier";
  id v15 = a4;
  id v9 = +[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", +[NSDictionary dictionaryWithObjects:&v15 forKeys:&v14 count:1]);
  id v10 = v9;
  if (a5)
  {
    char v11 = &off_1022B5558;
  }
  else
  {
    if (!a3) {
      goto LABEL_6;
    }
    char v11 = &off_1022B55D0;
    a5 = a3;
  }
  [(NSMutableDictionary *)v9 setObject:a5 forKey:*v11];
LABEL_6:
  sub_100134750(__p, "DurianManagement/DidFetchUserStats");
  [(CLDurianClientAdapter *)self sendMessage:__p forTag:a4 withPayload:v10];
  if (v13 < 0) {
    operator delete(__p[0]);
  }
}

- (void)didUnpairFromTag:(id)a3 withError:(id)a4
{
  CFStringRef v11 = @"CLDurianIdentifier";
  id v12 = a3;
  char v7 = +[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", +[NSDictionary dictionaryWithObjects:&v12 forKeys:&v11 count:1]);
  CFStringRef v8 = v7;
  if (a4) {
    [(NSMutableDictionary *)v7 setObject:a4 forKey:@"CLDurianError"];
  }
  sub_100134750(__p, "DurianManagement/DidUnpair");
  [(CLDurianClientAdapter *)self sendMessage:__p forTag:a3 withPayload:v8];
  if (v10 < 0) {
    operator delete(__p[0]);
  }
}

- (void)didSetTagTypeOnTag:(id)a3 withError:(id)a4
{
  sub_100134750(__p, "DurianManagement/DidSetTagType");
  [(CLDurianClientAdapter *)self sendMessage:__p forTag:a3 withError:a4];
  if (v8 < 0) {
    operator delete(__p[0]);
  }
}

- (void)didSetObfuscatedIdentifierOnTag:(id)a3 withError:(id)a4
{
  sub_100134750(__p, "DurianManagement/DidSetObfuscatedIdentifier");
  [(CLDurianClientAdapter *)self sendMessage:__p forTag:a3 withError:a4];
  if (v8 < 0) {
    operator delete(__p[0]);
  }
}

- (void)didSetNearOwnerTimeoutOnTag:(id)a3 withError:(id)a4
{
  sub_100134750(__p, "DurianManagement/DidSetNearOwnerTimeout");
  [(CLDurianClientAdapter *)self sendMessage:__p forTag:a3 withError:a4];
  if (v8 < 0) {
    operator delete(__p[0]);
  }
}

- (void)didSetWildModeConfigruationOnTag:(id)a3 withError:(id)a4
{
  sub_100134750(__p, "DurianManagement/DidSetWildConfiguration");
  [(CLDurianClientAdapter *)self sendMessage:__p forTag:a3 withError:a4];
  if (v8 < 0) {
    operator delete(__p[0]);
  }
}

- (void)didRollWildKeyOnTag:(id)a3 withError:(id)a4
{
  sub_100134750(__p, "DurianManagement/DidRollWildKey");
  [(CLDurianClientAdapter *)self sendMessage:__p forTag:a3 withError:a4];
  if (v8 < 0) {
    operator delete(__p[0]);
  }
}

- (void)didInitRangingOnTag:(id)a3 withStatus:(unsigned int)a4 error:(id)a5
{
  uint64_t v6 = *(void *)&a4;
  CFStringRef v13 = @"CLDurianIdentifier";
  id v14 = a3;
  id v9 = +[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", +[NSDictionary dictionaryWithObjects:&v14 forKeys:&v13 count:1]);
  char v10 = v9;
  if (a5) {
    [(NSMutableDictionary *)v9 setObject:a5 forKey:@"CLDurianError"];
  }
  else {
    [(NSMutableDictionary *)v9 setObject:+[NSNumber numberWithUnsignedInt:v6] forKey:@"CLDurianRangingStatus"];
  }
  sub_100134750(__p, "DurianManagement/DidInitRanging");
  [(CLDurianClientAdapter *)self sendMessage:__p forTag:a3 withPayload:v10];
  if (v12 < 0) {
    operator delete(__p[0]);
  }
}

- (void)didDeinitRangingOnTag:(id)a3 withStatus:(unsigned int)a4 error:(id)a5
{
  uint64_t v6 = *(void *)&a4;
  CFStringRef v13 = @"CLDurianIdentifier";
  id v14 = a3;
  id v9 = +[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", +[NSDictionary dictionaryWithObjects:&v14 forKeys:&v13 count:1]);
  char v10 = v9;
  if (a5) {
    [(NSMutableDictionary *)v9 setObject:a5 forKey:@"CLDurianError"];
  }
  else {
    [(NSMutableDictionary *)v9 setObject:+[NSNumber numberWithUnsignedInt:v6] forKey:@"CLDurianRangingStatus"];
  }
  sub_100134750(__p, "DurianManagement/DidDeinitRanging");
  [(CLDurianClientAdapter *)self sendMessage:__p forTag:a3 withPayload:v10];
  if (v12 < 0) {
    operator delete(__p[0]);
  }
}

- (void)didConfigureRangingOnTag:(id)a3 withStatus:(unsigned int)a4 error:(id)a5
{
  uint64_t v6 = *(void *)&a4;
  CFStringRef v13 = @"CLDurianIdentifier";
  id v14 = a3;
  id v9 = +[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", +[NSDictionary dictionaryWithObjects:&v14 forKeys:&v13 count:1]);
  char v10 = v9;
  if (a5) {
    [(NSMutableDictionary *)v9 setObject:a5 forKey:@"CLDurianError"];
  }
  else {
    [(NSMutableDictionary *)v9 setObject:+[NSNumber numberWithUnsignedInt:v6] forKey:@"CLDurianRangingStatus"];
  }
  sub_100134750(__p, "DurianManagement/DidConfigureRanging");
  [(CLDurianClientAdapter *)self sendMessage:__p forTag:a3 withPayload:v10];
  if (v12 < 0) {
    operator delete(__p[0]);
  }
}

- (void)didPrepareRangingOnTag:(id)a3 error:(id)a4
{
  CFStringRef v11 = @"CLDurianIdentifier";
  id v12 = a3;
  char v7 = +[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", +[NSDictionary dictionaryWithObjects:&v12 forKeys:&v11 count:1]);
  char v8 = v7;
  if (a4) {
    [(NSMutableDictionary *)v7 setObject:a4 forKey:@"CLDurianError"];
  }
  sub_100134750(__p, "DurianManagement/DidPrepareRanging");
  [(CLDurianClientAdapter *)self sendMessage:__p forTag:a3 withPayload:v8];
  if (v10 < 0) {
    operator delete(__p[0]);
  }
}

- (void)didStartRangingOnTag:(id)a3 error:(id)a4
{
  CFStringRef v11 = @"CLDurianIdentifier";
  id v12 = a3;
  char v7 = +[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", +[NSDictionary dictionaryWithObjects:&v12 forKeys:&v11 count:1]);
  char v8 = v7;
  if (a4) {
    [(NSMutableDictionary *)v7 setObject:a4 forKey:@"CLDurianError"];
  }
  sub_100134750(__p, "DurianManagement/DidStartRanging");
  [(CLDurianClientAdapter *)self sendMessage:__p forTag:a3 withPayload:v8];
  if (v10 < 0) {
    operator delete(__p[0]);
  }
}

- (void)didCompleteRangingOnTag:(id)a3 withStatus:(unsigned int)a4 endReason:(unsigned __int8)a5 error:(id)a6
{
  uint64_t v7 = a5;
  uint64_t v8 = *(void *)&a4;
  CFStringRef v15 = @"CLDurianIdentifier";
  id v16 = a3;
  CFStringRef v11 = +[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", +[NSDictionary dictionaryWithObjects:&v16 forKeys:&v15 count:1]);
  id v12 = v11;
  if (a6) {
    [(NSMutableDictionary *)v11 setObject:a6 forKey:@"CLDurianError"];
  }
  [(NSMutableDictionary *)v12 setObject:+[NSNumber numberWithUnsignedInt:v8] forKey:@"CLDurianRangingStatus"];
  [(NSMutableDictionary *)v12 setObject:+[NSNumber numberWithUnsignedChar:v7] forKey:@"CLDurianRangingEndReason"];
  sub_100134750(__p, "DurianManagement/DidCompleteRanging");
  [(CLDurianClientAdapter *)self sendMessage:__p forTag:a3 withPayload:v12];
  if (v14 < 0) {
    operator delete(__p[0]);
  }
}

- (void)didReceiveRangingErrorFromTag:(id)a3 withStatus:(unsigned int)a4
{
  v9[0] = @"CLDurianIdentifier";
  v9[1] = @"CLDurianRangingStatus";
  v10[0] = a3;
  v10[1] = +[NSNumber numberWithUnsignedInt:*(void *)&a4];
  uint64_t v6 = +[NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:2];
  sub_100134750(__p, "DurianManagement/DidReceiveRangingError");
  [(CLDurianClientAdapter *)self sendMessage:__p forTag:a3 withPayload:v6];
  if (v8 < 0) {
    operator delete(__p[0]);
  }
}

- (void)didReceiveRangingTimestampsFromTag:(id)a3 eventStatus:(unsigned __int16)a4 rtt:(unint64_t)a5 tat:(unint64_t)a6 cycleIndex:(unsigned __int16)a7
{
  uint64_t v7 = a7;
  v16[0] = a3;
  v15[0] = @"CLDurianIdentifier";
  v15[1] = @"CLDurianRangingTimestampStatus";
  v16[1] = +[NSNumber numberWithUnsignedShort:a4];
  void v15[2] = @"CLDurianRangingRtt";
  void v16[2] = +[NSNumber numberWithUnsignedLongLong:a5];
  v15[3] = @"CLDurianRangingTat";
  v16[3] = +[NSNumber numberWithUnsignedLongLong:a6];
  v15[4] = @"CLDurianRangingCycleIndex";
  v16[4] = +[NSNumber numberWithUnsignedShort:v7];
  id v12 = +[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", +[NSDictionary dictionaryWithObjects:v16 forKeys:v15 count:5]);
  sub_100134750(__p, "DurianManagement/DidReceiveRangingTimestamps");
  [(CLDurianClientAdapter *)self sendMessage:__p forTag:a3 withPayload:v12];
  if (v14 < 0) {
    operator delete(__p[0]);
  }
}

- (void)didFailRangingEventCounterActionForTag:(id)a3 error:(id)a4
{
  CFStringRef v11 = @"CLDurianIdentifier";
  id v12 = a3;
  uint64_t v7 = +[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", +[NSDictionary dictionaryWithObjects:&v12 forKeys:&v11 count:1]);
  char v8 = v7;
  if (a4) {
    [(NSMutableDictionary *)v7 setObject:a4 forKey:@"CLDurianError"];
  }
  sub_100134750(__p, "DurianManagement/DidFailRangingEventCounterAction");
  [(CLDurianClientAdapter *)self sendMessage:__p forTag:a3 withPayload:v8];
  if (v10 < 0) {
    operator delete(__p[0]);
  }
}

- (void)didHaveRangingMovementOnTag:(id)a3
{
  CFStringRef v8 = @"CLDurianIdentifier";
  id v9 = a3;
  v5 = +[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", +[NSDictionary dictionaryWithObjects:&v9 forKeys:&v8 count:1]);
  sub_100134750(__p, "DurianManagement/DidHaveRangingMovement");
  [(CLDurianClientAdapter *)self sendMessage:__p forTag:a3 withPayload:v5];
  if (v7 < 0) {
    operator delete(__p[0]);
  }
}

- (void)didSetAccelerometerSlopeModeConfigurationOnTag:(id)a3 error:(id)a4
{
  CFStringRef v11 = @"CLDurianIdentifier";
  id v12 = a3;
  char v7 = +[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", +[NSDictionary dictionaryWithObjects:&v12 forKeys:&v11 count:1]);
  CFStringRef v8 = v7;
  if (a4) {
    [(NSMutableDictionary *)v7 setObject:a4 forKey:@"CLDurianError"];
  }
  sub_100134750(__p, "DurianManagement/DidSetAccelerometerSlopeMode");
  [(CLDurianClientAdapter *)self sendMessage:__p forTag:a3 withPayload:v8];
  if (v10 < 0) {
    operator delete(__p[0]);
  }
}

- (void)didSetAccelerometerOrientationModeConfigurationOnTag:(id)a3 error:(id)a4
{
  CFStringRef v11 = @"CLDurianIdentifier";
  id v12 = a3;
  char v7 = +[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", +[NSDictionary dictionaryWithObjects:&v12 forKeys:&v11 count:1]);
  CFStringRef v8 = v7;
  if (a4) {
    [(NSMutableDictionary *)v7 setObject:a4 forKey:@"CLDurianError"];
  }
  sub_100134750(__p, "DurianManagement/DidSetAccelerometerOrientationMode");
  [(CLDurianClientAdapter *)self sendMessage:__p forTag:a3 withPayload:v8];
  if (v10 < 0) {
    operator delete(__p[0]);
  }
}

- (void)didFetchAccelerometerSlopeModeConfiguration:(id)a3 onTag:(id)a4 error:(id)a5
{
  CFStringRef v13 = @"CLDurianIdentifier";
  id v14 = a4;
  id v9 = +[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", +[NSDictionary dictionaryWithObjects:&v14 forKeys:&v13 count:1]);
  char v10 = v9;
  if (a5) {
    [(NSMutableDictionary *)v9 setObject:a5 forKey:@"CLDurianError"];
  }
  else {
    [(NSMutableDictionary *)v9 setObject:a3 forKey:@"CLDurianAccelerometerSlopeModeConfigurationKey"];
  }
  sub_100134750(__p, "DurianManagement/DidGetAccelerometerSlopeModeConfiguration");
  [(CLDurianClientAdapter *)self sendMessage:__p forTag:a4 withPayload:v10];
  if (v12 < 0) {
    operator delete(__p[0]);
  }
}

- (void)didFetchAccelerometerOrientationModeConfiguration:(id)a3 onTag:(id)a4 error:(id)a5
{
  CFStringRef v13 = @"CLDurianIdentifier";
  id v14 = a4;
  id v9 = +[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", +[NSDictionary dictionaryWithObjects:&v14 forKeys:&v13 count:1]);
  char v10 = v9;
  if (a5) {
    [(NSMutableDictionary *)v9 setObject:a5 forKey:@"CLDurianError"];
  }
  else {
    [(NSMutableDictionary *)v9 setObject:a3 forKey:@"CLDurianAccelerometerOrientationModeConfigurationKey"];
  }
  sub_100134750(__p, "DurianManagement/DidSetAccelerometerOrientationMode");
  [(CLDurianClientAdapter *)self sendMessage:__p forTag:a4 withPayload:v10];
  if (v12 < 0) {
    operator delete(__p[0]);
  }
}

- (void)didFetchAccelerometerMode:(unsigned __int8)a3 onTag:(id)a4 error:(id)a5
{
  uint64_t v7 = a3;
  CFStringRef v13 = @"CLDurianIdentifier";
  id v14 = a4;
  id v9 = +[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", +[NSDictionary dictionaryWithObjects:&v14 forKeys:&v13 count:1]);
  char v10 = v9;
  if (a5) {
    [(NSMutableDictionary *)v9 setObject:a5 forKey:@"CLDurianError"];
  }
  else {
    [(NSMutableDictionary *)v9 setObject:+[NSNumber numberWithUnsignedChar:v7] forKey:@"CLDurianAccelerometerModeKey"];
  }
  sub_100134750(__p, "DurianManagement/DidGetAccelerometerMode");
  [(CLDurianClientAdapter *)self sendMessage:__p forTag:a4 withPayload:v10];
  if (v12 < 0) {
    operator delete(__p[0]);
  }
}

- (void)didFetchBatteryStatus:(unint64_t)a3 fromTag:(id)a4 withError:(id)a5
{
  CFStringRef v13 = @"CLDurianIdentifier";
  id v14 = a4;
  id v9 = +[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", +[NSDictionary dictionaryWithObjects:&v14 forKeys:&v13 count:1]);
  char v10 = v9;
  if (a5) {
    [(NSMutableDictionary *)v9 setObject:a5 forKey:@"CLDurianError"];
  }
  else {
    [(NSMutableDictionary *)v9 setObject:+[NSNumber numberWithUnsignedInteger:a3] forKey:@"CLDurianBatteryStatus"];
  }
  sub_100134750(__p, "DurianManagement/DidFetchBatteryStatus");
  [(CLDurianClientAdapter *)self sendMessage:__p forTag:a4 withPayload:v10];
  if (v12 < 0) {
    operator delete(__p[0]);
  }
}

- (void)didRetrievePersonalizationInformation:(id)a3 forTag:(id)a4 error:(id)a5
{
  CFStringRef v13 = @"CLDurianIdentifier";
  id v14 = a4;
  id v9 = +[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", +[NSDictionary dictionaryWithObjects:&v14 forKeys:&v13 count:1]);
  char v10 = v9;
  if (a5) {
    [(NSMutableDictionary *)v9 setObject:a5 forKey:@"CLDurianError"];
  }
  else {
    [(NSMutableDictionary *)v9 setObject:a3 forKey:@"CLDurianPersonalizationInfo"];
  }
  sub_100134750(__p, "DurianManagement/DidFetchPersonalizationInformation");
  [(CLDurianClientAdapter *)self sendMessage:__p forTag:a4 withPayload:v10];
  if (v12 < 0) {
    operator delete(__p[0]);
  }
}

- (void)didUpdateFirmwareForTag:(id)a3 error:(id)a4
{
  CFStringRef v11 = @"CLDurianIdentifier";
  id v12 = a3;
  uint64_t v7 = +[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", +[NSDictionary dictionaryWithObjects:&v12 forKeys:&v11 count:1]);
  CFStringRef v8 = v7;
  if (a4) {
    [(NSMutableDictionary *)v7 setObject:a4 forKey:@"CLDurianError"];
  }
  sub_100134750(__p, "DurianManagement/DidUpdateFirmware");
  [(CLDurianClientAdapter *)self sendMessage:__p forTag:a3 withPayload:v8];
  if (v10 < 0) {
    operator delete(__p[0]);
  }
}

- (void)didSetUnauthorizedPlaySoundRateLimitFromTag:(id)a3 error:(id)a4
{
  sub_100134750(__p, "DurianManagement/DidSetUnauthorizedPlaySoundRateLimit");
  [(CLDurianClientAdapter *)self sendMessage:__p forTag:a3 withError:a4];
  if (v8 < 0) {
    operator delete(__p[0]);
  }
}

- (void)didSetBatteryStatusOnTag:(id)a3 error:(id)a4
{
  sub_100134750(__p, "DurianManagement/DidSetBatteryStatus");
  [(CLDurianClientAdapter *)self sendMessage:__p forTag:a3 withError:a4];
  if (v8 < 0) {
    operator delete(__p[0]);
  }
}

- (void)didCompleteHawkeyeTaskWithOpcode:(unsigned __int16)a3 fromDevice:(id)a4 withError:(id)a5
{
  uint64_t v7 = a3;
  CFStringRef v13 = @"CLDurianIdentifier";
  id v14 = a4;
  id v9 = +[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", +[NSDictionary dictionaryWithObjects:&v14 forKeys:&v13 count:1]);
  char v10 = v9;
  if (a5) {
    [(NSMutableDictionary *)v9 setObject:a5 forKey:@"CLDurianError"];
  }
  [(NSMutableDictionary *)v10 setObject:+[NSNumber numberWithInt:v7] forKey:@"CLHawkeyeTaskOpcodeKey"];
  sub_100134750(__p, "DurianManagement/DidCompleteHawkeyeTask");
  [(CLDurianClientAdapter *)self sendMessage:__p forTag:a4 withPayload:v10];
  if (v12 < 0) {
    operator delete(__p[0]);
  }
}

- (void)didSetHawkeyeUTMotionConfigForDevice:(id)a3 withError:(id)a4
{
  CFStringRef v10 = @"CLDurianIdentifier";
  id v11 = a3;
  uint64_t v7 = +[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", +[NSDictionary dictionaryWithObjects:&v11 forKeys:&v10 count:1]);
  if (a4) {
    [(NSMutableDictionary *)v7 setObject:a4 forKey:@"CLDurianError"];
  }
  sub_100134750(__p, "DurianManagement/DidSetHawkeyeUTMotionConfig");
  [(CLDurianClientAdapter *)self sendMessage:__p forTag:a3 withError:a4];
  if (v9 < 0) {
    operator delete(__p[0]);
  }
}

- (void)didFetchTxPower:(id)a3 fromDevice:(id)a4 withError:(id)a5
{
  CFStringRef v13 = @"CLDurianIdentifier";
  id v14 = a4;
  char v9 = +[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", +[NSDictionary dictionaryWithObjects:&v14 forKeys:&v13 count:1]);
  CFStringRef v10 = v9;
  if (a5) {
    [(NSMutableDictionary *)v9 setObject:a5 forKey:@"CLDurianError"];
  }
  [(NSMutableDictionary *)v10 setObject:a3 forKey:@"CLHawkeyeTxPowerKey"];
  sub_100134750(__p, "DurianManagement/DidFetchTxPower");
  [(CLDurianClientAdapter *)self sendMessage:__p forTag:a4 withPayload:v10];
  if (v12 < 0) {
    operator delete(__p[0]);
  }
}

- (void)didStartAggressiveAdvertisingOnDevice:(id)a3 withError:(id)a4
{
  CFStringRef v11 = @"CLDurianIdentifier";
  id v12 = a3;
  uint64_t v7 = +[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", +[NSDictionary dictionaryWithObjects:&v12 forKeys:&v11 count:1]);
  char v8 = v7;
  if (a4) {
    [(NSMutableDictionary *)v7 setObject:a4 forKey:@"CLDurianError"];
  }
  sub_100134750(__p, "DurianManagement/DidStartAggressiveAdvertising");
  [(CLDurianClientAdapter *)self sendMessage:__p forTag:a3 withPayload:v8];
  if (v10 < 0) {
    operator delete(__p[0]);
  }
}

- (void)didStopAggressiveAdvertisingOnDevice:(id)a3 withError:(id)a4
{
  CFStringRef v11 = @"CLDurianIdentifier";
  id v12 = a3;
  uint64_t v7 = +[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", +[NSDictionary dictionaryWithObjects:&v12 forKeys:&v11 count:1]);
  char v8 = v7;
  if (a4) {
    [(NSMutableDictionary *)v7 setObject:a4 forKey:@"CLDurianError"];
  }
  sub_100134750(__p, "DurianManagement/DidStopAggressiveAdvertising");
  [(CLDurianClientAdapter *)self sendMessage:__p forTag:a3 withPayload:v8];
  if (v10 < 0) {
    operator delete(__p[0]);
  }
}

- (void)didCompleteAggressiveAdvertisingOnDevice:(id)a3 withError:(id)a4
{
  CFStringRef v11 = @"CLDurianIdentifier";
  id v12 = a3;
  uint64_t v7 = +[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", +[NSDictionary dictionaryWithObjects:&v12 forKeys:&v11 count:1]);
  char v8 = v7;
  if (a4) {
    [(NSMutableDictionary *)v7 setObject:a4 forKey:@"CLDurianError"];
  }
  sub_100134750(__p, "DurianManagement/DidCompleteAggressiveAdvertising");
  [(CLDurianClientAdapter *)self sendMessage:__p forTag:a3 withPayload:v8];
  if (v10 < 0) {
    operator delete(__p[0]);
  }
}

- (void)didStartUnauthorizedAggressiveAdvertisingOnDevice:(id)a3 withError:(id)a4
{
  CFStringRef v11 = @"CLDurianIdentifier";
  id v12 = a3;
  uint64_t v7 = +[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", +[NSDictionary dictionaryWithObjects:&v12 forKeys:&v11 count:1]);
  char v8 = v7;
  if (a4) {
    [(NSMutableDictionary *)v7 setObject:a4 forKey:@"CLDurianError"];
  }
  sub_100134750(__p, "DurianManagement/DidStartUnauthorizedAggressiveAdvertising");
  [(CLDurianClientAdapter *)self sendMessage:__p forTag:a3 withPayload:v8];
  if (v10 < 0) {
    operator delete(__p[0]);
  }
}

- (void)didFetchHawkeyeAISProductDataFromDevice:(id)a3 productData:(id)a4 error:(id)a5
{
  CFStringRef v13 = @"CLDurianIdentifier";
  id v14 = a3;
  char v9 = +[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", +[NSDictionary dictionaryWithObjects:&v14 forKeys:&v13 count:1]);
  char v10 = v9;
  if (a5) {
    [(NSMutableDictionary *)v9 setObject:a5 forKey:@"CLDurianError"];
  }
  else {
    [(NSMutableDictionary *)v9 setObject:a4 forKey:@"CLHawkeyeAISProductDataKey"];
  }
  sub_100134750(__p, "DurianManagement/DidFetchHawkeyeAISProductData");
  [(CLDurianClientAdapter *)self sendMessage:__p forTag:a3 withPayload:v10];
  if (v12 < 0) {
    operator delete(__p[0]);
  }
}

- (void)didFetchHawkeyeAISManufacturerNameFromDevice:(id)a3 manufacturerName:(id)a4 error:(id)a5
{
  CFStringRef v13 = @"CLDurianIdentifier";
  id v14 = a3;
  char v9 = +[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", +[NSDictionary dictionaryWithObjects:&v14 forKeys:&v13 count:1]);
  char v10 = v9;
  if (a5) {
    [(NSMutableDictionary *)v9 setObject:a5 forKey:@"CLDurianError"];
  }
  else {
    [(NSMutableDictionary *)v9 setObject:a4 forKey:@"CLHawkeyeAISManufacturerNameKey"];
  }
  sub_100134750(__p, "DurianManagement/DidFetchHawkeyeAISManufacturerName");
  [(CLDurianClientAdapter *)self sendMessage:__p forTag:a3 withPayload:v10];
  if (v12 < 0) {
    operator delete(__p[0]);
  }
}

- (void)didFetchHawkeyeAISModelNameFromDevice:(id)a3 modelName:(id)a4 error:(id)a5
{
  CFStringRef v13 = @"CLDurianIdentifier";
  id v14 = a3;
  char v9 = +[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", +[NSDictionary dictionaryWithObjects:&v14 forKeys:&v13 count:1]);
  char v10 = v9;
  if (a5) {
    [(NSMutableDictionary *)v9 setObject:a5 forKey:@"CLDurianError"];
  }
  else {
    [(NSMutableDictionary *)v9 setObject:a4 forKey:@"CLHawkeyeAISModelNameKey"];
  }
  sub_100134750(__p, "DurianManagement/DidFetchHawkeyeAISModelName");
  [(CLDurianClientAdapter *)self sendMessage:__p forTag:a3 withPayload:v10];
  if (v12 < 0) {
    operator delete(__p[0]);
  }
}

- (void)didFetchHawkeyeAISModelColorCodeFromDevice:(id)a3 modelColorCode:(id)a4 error:(id)a5
{
  CFStringRef v13 = @"CLDurianIdentifier";
  id v14 = a3;
  char v9 = +[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", +[NSDictionary dictionaryWithObjects:&v14 forKeys:&v13 count:1]);
  char v10 = v9;
  if (a5) {
    [(NSMutableDictionary *)v9 setObject:a5 forKey:@"CLDurianError"];
  }
  else {
    [(NSMutableDictionary *)v9 setObject:a4 forKey:@"CLHawkeyeAISModelColorCodeKey"];
  }
  sub_100134750(__p, "DurianManagement/DidFetchHawkeyeAISModelColorCode");
  [(CLDurianClientAdapter *)self sendMessage:__p forTag:a3 withPayload:v10];
  if (v12 < 0) {
    operator delete(__p[0]);
  }
}

- (void)didFetchHawkeyeAISAccessoryCategoryFromDevice:(id)a3 accessoryCategory:(id)a4 error:(id)a5
{
  CFStringRef v13 = @"CLDurianIdentifier";
  id v14 = a3;
  char v9 = +[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", +[NSDictionary dictionaryWithObjects:&v14 forKeys:&v13 count:1]);
  char v10 = v9;
  if (a5) {
    [(NSMutableDictionary *)v9 setObject:a5 forKey:@"CLDurianError"];
  }
  else {
    [(NSMutableDictionary *)v9 setObject:a4 forKey:@"CLHawkeyeAISAccessoryCategoryKey"];
  }
  sub_100134750(__p, "DurianManagement/DidFetchHawkeyeAISAccessoryCategory");
  [(CLDurianClientAdapter *)self sendMessage:__p forTag:a3 withPayload:v10];
  if (v12 < 0) {
    operator delete(__p[0]);
  }
}

- (void)didFetchHawkeyeAISAccessoryCapabilitiesFromDevice:(id)a3 accessoryCapabilities:(id)a4 error:(id)a5
{
  CFStringRef v13 = @"CLDurianIdentifier";
  id v14 = a3;
  char v9 = +[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", +[NSDictionary dictionaryWithObjects:&v14 forKeys:&v13 count:1]);
  char v10 = v9;
  if (a5) {
    [(NSMutableDictionary *)v9 setObject:a5 forKey:@"CLDurianError"];
  }
  else {
    [(NSMutableDictionary *)v9 setObject:a4 forKey:@"CLHawkeyeAISAccessoryCapabilitiesKey"];
  }
  sub_100134750(__p, "DurianManagement/DidFetchHawkeyeAISAccessoryCapabilities");
  [(CLDurianClientAdapter *)self sendMessage:__p forTag:a3 withPayload:v10];
  if (v12 < 0) {
    operator delete(__p[0]);
  }
}

- (void)didFetchHawkeyeAISFindMyVersionFromDevice:(id)a3 findMyVersion:(unsigned int)a4 error:(id)a5
{
  uint64_t v6 = *(void *)&a4;
  CFStringRef v13 = @"CLDurianIdentifier";
  id v14 = a3;
  char v9 = +[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", +[NSDictionary dictionaryWithObjects:&v14 forKeys:&v13 count:1]);
  char v10 = v9;
  if (a5) {
    [(NSMutableDictionary *)v9 setObject:a5 forKey:@"CLDurianError"];
  }
  else {
    [(NSMutableDictionary *)v9 setObject:+[NSNumber numberWithUnsignedInt:v6] forKey:@"CLHawkeyeAISFindMyVersionKey"];
  }
  sub_100134750(__p, "DurianManagement/DidFetchHawkeyeAISFindMyVersion");
  [(CLDurianClientAdapter *)self sendMessage:__p forTag:a3 withPayload:v10];
  if (v12 < 0) {
    operator delete(__p[0]);
  }
}

- (void)didFetchHawkeyeAISBatteryTypeFromDevice:(id)a3 batteryType:(id)a4 error:(id)a5
{
  CFStringRef v13 = @"CLDurianIdentifier";
  id v14 = a3;
  char v9 = +[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", +[NSDictionary dictionaryWithObjects:&v14 forKeys:&v13 count:1]);
  char v10 = v9;
  if (a5) {
    [(NSMutableDictionary *)v9 setObject:a5 forKey:@"CLDurianError"];
  }
  else {
    [(NSMutableDictionary *)v9 setObject:a4 forKey:@"CLHawkeyeAISBatteryTypeKey"];
  }
  sub_100134750(__p, "DurianManagement/DidFetchHawkeyeAISBatteryType");
  [(CLDurianClientAdapter *)self sendMessage:__p forTag:a3 withPayload:v10];
  if (v12 < 0) {
    operator delete(__p[0]);
  }
}

- (void)didFetchHawkeyeSerialNumberFromDevice:(id)a3 serialNumber:(id)a4 error:(id)a5
{
  CFStringRef v13 = @"CLDurianIdentifier";
  id v14 = a3;
  char v9 = +[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", +[NSDictionary dictionaryWithObjects:&v14 forKeys:&v13 count:1]);
  char v10 = v9;
  if (a5) {
    [(NSMutableDictionary *)v9 setObject:a5 forKey:@"CLDurianError"];
  }
  else {
    [(NSMutableDictionary *)v9 setObject:a4 forKey:@"CLHawkeyeSerialNumberKey"];
  }
  sub_100134750(__p, "DurianManagement/DidFetchHawkeyeSerialNumber");
  [(CLDurianClientAdapter *)self sendMessage:__p forTag:a3 withPayload:v10];
  if (v12 < 0) {
    operator delete(__p[0]);
  }
}

- (void)didFetchHawkeyeCurrentPrimaryKeyFromDevice:(id)a3 currentPrimaryKey:(id)a4 error:(id)a5
{
  CFStringRef v13 = @"CLDurianIdentifier";
  id v14 = a3;
  char v9 = +[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", +[NSDictionary dictionaryWithObjects:&v14 forKeys:&v13 count:1]);
  char v10 = v9;
  if (a5) {
    [(NSMutableDictionary *)v9 setObject:a5 forKey:@"CLDurianError"];
  }
  else {
    [(NSMutableDictionary *)v9 setObject:a4 forKey:@"CLHawkeyeCurrentPrimaryKeyKey"];
  }
  sub_100134750(__p, "DurianManagement/DidFetchHawkeyeCurrentPrimaryKey");
  [(CLDurianClientAdapter *)self sendMessage:__p forTag:a3 withPayload:v10];
  if (v12 < 0) {
    operator delete(__p[0]);
  }
}

- (void)didFetchHawkeyeiCloudIdentifierFromDevice:(id)a3 iCloudIdentifier:(id)a4 error:(id)a5
{
  CFStringRef v13 = @"CLDurianIdentifier";
  id v14 = a3;
  char v9 = +[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", +[NSDictionary dictionaryWithObjects:&v14 forKeys:&v13 count:1]);
  char v10 = v9;
  if (a5) {
    [(NSMutableDictionary *)v9 setObject:a5 forKey:@"CLDurianError"];
  }
  else {
    [(NSMutableDictionary *)v9 setObject:a4 forKey:@"CLHawkeyeiCloudIdentifierKey"];
  }
  sub_100134750(__p, "DurianManagement/DidFetchHawkeyeiCloudIdentifier");
  [(CLDurianClientAdapter *)self sendMessage:__p forTag:a3 withPayload:v10];
  if (v12 < 0) {
    operator delete(__p[0]);
  }
}

- (void)didReceiveHawkeyeDataFragment:(id)a3 withOpcode:(unsigned __int16)a4 fromDevice:(id)a5 error:(id)a6
{
  uint64_t v8 = a4;
  CFStringRef v15 = @"CLDurianIdentifier";
  id v16 = a5;
  CFStringRef v11 = +[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", +[NSDictionary dictionaryWithObjects:&v16 forKeys:&v15 count:1]);
  char v12 = v11;
  if (a6)
  {
    [(NSMutableDictionary *)v11 setObject:a6 forKey:@"CLDurianError"];
  }
  else
  {
    [(NSMutableDictionary *)v11 setObject:a3 forKey:@"CLHawkeyeDataFragmentKey"];
    [(NSMutableDictionary *)v12 setObject:+[NSNumber numberWithUnsignedShort:v8] forKey:@"CLHawkeyeTaskOpcodeKey"];
  }
  sub_100134750(__p, "DurianManagement/DidReceiveDataFragment");
  [(CLDurianClientAdapter *)self sendMessage:__p forTag:a5 withPayload:v12];
  if (v14 < 0) {
    operator delete(__p[0]);
  }
}

- (void)didUseLocalFirmwareAssetRequestForProductGroup:(id)a3 andProductNumber:(id)a4 withError:(id)a5
{
  v11[0] = @"CLHawkeyeProductGroupKey";
  v11[1] = @"CLHawkeyeProductNumberKey";
  v12[0] = a3;
  v12[1] = a4;
  uint64_t v7 = +[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", +[NSDictionary dictionaryWithObjects:v12 forKeys:v11 count:2]);
  uint64_t v8 = v7;
  if (a5) {
    [(NSMutableDictionary *)v7 setObject:a5 forKey:@"CLDurianError"];
  }
  sub_100134750(__p, "DurianManagement/DidUseLocalAssetRequest");
  [(CLDurianClientAdapter *)self sendMessage:__p forTag:0 withPayload:v8];
  if (v10 < 0) {
    operator delete(__p[0]);
  }
}

- (void)didUseDefaultFirmwareAssetRequestForProductGroup:(id)a3 andProductNumber:(id)a4 withError:(id)a5
{
  v11[0] = @"CLHawkeyeProductGroupKey";
  v11[1] = @"CLHawkeyeProductNumberKey";
  v12[0] = a3;
  v12[1] = a4;
  uint64_t v7 = +[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", +[NSDictionary dictionaryWithObjects:v12 forKeys:v11 count:2]);
  uint64_t v8 = v7;
  if (a5) {
    [(NSMutableDictionary *)v7 setObject:a5 forKey:@"CLDurianError"];
  }
  sub_100134750(__p, "DurianManagement/DidUseDefaultAssetRequest");
  [(CLDurianClientAdapter *)self sendMessage:__p forTag:0 withPayload:v8];
  if (v10 < 0) {
    operator delete(__p[0]);
  }
}

- (void)didFetchWhetherLocalFirmwareAssetIsInUseForProductGroup:(id)a3 andProductNumber:(id)a4 withResult:(BOOL)a5
{
  v9[0] = @"CLHawkeyeProductGroupKey";
  v9[1] = @"CLHawkeyeProductNumberKey";
  v10[0] = a3;
  v10[1] = a4;
  void v9[2] = @"CLHawkeyeLocalFirmwareInUseResultKey";
  void v10[2] = +[NSNumber numberWithBool:a5];
  uint64_t v6 = +[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", +[NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:3]);
  sub_100134750(__p, "DurianManagement/DidFetchWhetherLocalFirmwareAssetIsInUse");
  [(CLDurianClientAdapter *)self sendMessage:__p forTag:0 withPayload:v6];
  if (v8 < 0) {
    operator delete(__p[0]);
  }
}

- (void)didFetchAISProductDataFromDevice:(id)a3 productData:(id)a4 error:(id)a5
{
  CFStringRef v13 = @"CLDurianIdentifier";
  id v14 = a3;
  char v9 = +[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", +[NSDictionary dictionaryWithObjects:&v14 forKeys:&v13 count:1]);
  char v10 = v9;
  if (a5) {
    [(NSMutableDictionary *)v9 setObject:a5 forKey:@"CLDurianError"];
  }
  else {
    [(NSMutableDictionary *)v9 setObject:a4 forKey:@"CLAISProductDataKey"];
  }
  sub_100134750(__p, "DurianManagement/DidFetchAISProductData");
  [(CLDurianClientAdapter *)self sendMessage:__p forTag:a3 withPayload:v10];
  if (v12 < 0) {
    operator delete(__p[0]);
  }
}

- (void)didFetchAISManufacturerNameFromDevice:(id)a3 manufacturerName:(id)a4 error:(id)a5
{
  CFStringRef v13 = @"CLDurianIdentifier";
  id v14 = a3;
  char v9 = +[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", +[NSDictionary dictionaryWithObjects:&v14 forKeys:&v13 count:1]);
  char v10 = v9;
  if (a5) {
    [(NSMutableDictionary *)v9 setObject:a5 forKey:@"CLDurianError"];
  }
  else {
    [(NSMutableDictionary *)v9 setObject:a4 forKey:@"CLAISManufacturerNameKey"];
  }
  sub_100134750(__p, "DurianManagement/DidFetchAISManufacturerName");
  [(CLDurianClientAdapter *)self sendMessage:__p forTag:a3 withPayload:v10];
  if (v12 < 0) {
    operator delete(__p[0]);
  }
}

- (void)didFetchAISModelNameFromDevice:(id)a3 modelName:(id)a4 error:(id)a5
{
  CFStringRef v13 = @"CLDurianIdentifier";
  id v14 = a3;
  char v9 = +[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", +[NSDictionary dictionaryWithObjects:&v14 forKeys:&v13 count:1]);
  char v10 = v9;
  if (a5) {
    [(NSMutableDictionary *)v9 setObject:a5 forKey:@"CLDurianError"];
  }
  else {
    [(NSMutableDictionary *)v9 setObject:a4 forKey:@"CLAISModelNameKey"];
  }
  sub_100134750(__p, "DurianManagement/DidFetchAISModelName");
  [(CLDurianClientAdapter *)self sendMessage:__p forTag:a3 withPayload:v10];
  if (v12 < 0) {
    operator delete(__p[0]);
  }
}

- (void)didFetchAISProtocolImplementationFromDevice:(id)a3 protocolImplementation:(unsigned int)a4 error:(id)a5
{
  uint64_t v6 = *(void *)&a4;
  CFStringRef v13 = @"CLDurianIdentifier";
  id v14 = a3;
  char v9 = +[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", +[NSDictionary dictionaryWithObjects:&v14 forKeys:&v13 count:1]);
  char v10 = v9;
  if (a5) {
    [(NSMutableDictionary *)v9 setObject:a5 forKey:@"CLDurianError"];
  }
  else {
    [(NSMutableDictionary *)v9 setObject:+[NSNumber numberWithUnsignedInt:v6] forKey:@"CLAISProtocolImplementationKey"];
  }
  sub_100134750(__p, "DurianManagement/DidFetchAISProtocolImplementation");
  [(CLDurianClientAdapter *)self sendMessage:__p forTag:a3 withPayload:v10];
  if (v12 < 0) {
    operator delete(__p[0]);
  }
}

- (void)didFetchAISAccessoryCategoryFromDevice:(id)a3 accessoryCategory:(unsigned __int8)a4 error:(id)a5
{
  uint64_t v6 = a4;
  CFStringRef v13 = @"CLDurianIdentifier";
  id v14 = a3;
  char v9 = +[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", +[NSDictionary dictionaryWithObjects:&v14 forKeys:&v13 count:1]);
  char v10 = v9;
  if (a5) {
    [(NSMutableDictionary *)v9 setObject:a5 forKey:@"CLDurianError"];
  }
  else {
    [(NSMutableDictionary *)v9 setObject:+[NSNumber numberWithUnsignedChar:v6] forKey:@"CLAISAccessoryCategoryKey"];
  }
  sub_100134750(__p, "DurianManagement/DidFetchAISAccessoryCategory");
  [(CLDurianClientAdapter *)self sendMessage:__p forTag:a3 withPayload:v10];
  if (v12 < 0) {
    operator delete(__p[0]);
  }
}

- (void)didFetchAISAccessoryCapabilitiesFromDevice:(id)a3 accessoryCapabilities:(id)a4 error:(id)a5
{
  CFStringRef v13 = @"CLDurianIdentifier";
  id v14 = a3;
  char v9 = +[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", +[NSDictionary dictionaryWithObjects:&v14 forKeys:&v13 count:1]);
  char v10 = v9;
  if (a5) {
    [(NSMutableDictionary *)v9 setObject:a5 forKey:@"CLDurianError"];
  }
  else {
    [(NSMutableDictionary *)v9 setObject:a4 forKey:@"CLAISAccessoryCapabilitiesKey"];
  }
  sub_100134750(__p, "DurianManagement/DidFetchAISAccessoryCapabilities");
  [(CLDurianClientAdapter *)self sendMessage:__p forTag:a3 withPayload:v10];
  if (v12 < 0) {
    operator delete(__p[0]);
  }
}

- (void)didFetchAISNetworkIDFromDevice:(id)a3 networkID:(unsigned __int8)a4 error:(id)a5
{
  uint64_t v6 = a4;
  CFStringRef v13 = @"CLDurianIdentifier";
  id v14 = a3;
  char v9 = +[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", +[NSDictionary dictionaryWithObjects:&v14 forKeys:&v13 count:1]);
  char v10 = v9;
  if (a5) {
    [(NSMutableDictionary *)v9 setObject:a5 forKey:@"CLDurianError"];
  }
  else {
    [(NSMutableDictionary *)v9 setObject:+[NSNumber numberWithUnsignedChar:v6] forKey:@"CLAISNetworkIDKey"];
  }
  sub_100134750(__p, "DurianManagement/DidFetchAISNetworkID");
  [(CLDurianClientAdapter *)self sendMessage:__p forTag:a3 withPayload:v10];
  if (v12 < 0) {
    operator delete(__p[0]);
  }
}

- (void)didFetchAISFirmwareVersionFromDevice:(id)a3 firmwareVersion:(id)a4 error:(id)a5
{
  CFStringRef v13 = @"CLDurianIdentifier";
  id v14 = a3;
  char v9 = +[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", +[NSDictionary dictionaryWithObjects:&v14 forKeys:&v13 count:1]);
  char v10 = v9;
  if (a5) {
    [(NSMutableDictionary *)v9 setObject:a5 forKey:@"CLDurianError"];
  }
  else {
    [(NSMutableDictionary *)v9 setObject:a4 forKey:@"CLAISFirmwareVersionKey"];
  }
  sub_100134750(__p, "DurianManagement/DidFetchAISFirmwareVersion");
  [(CLDurianClientAdapter *)self sendMessage:__p forTag:a3 withPayload:v10];
  if (v12 < 0) {
    operator delete(__p[0]);
  }
}

- (void)didFetchAISBatteryTypeFromDevice:(id)a3 batteryType:(unsigned __int8)a4 error:(id)a5
{
  uint64_t v6 = a4;
  CFStringRef v13 = @"CLDurianIdentifier";
  id v14 = a3;
  char v9 = +[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", +[NSDictionary dictionaryWithObjects:&v14 forKeys:&v13 count:1]);
  char v10 = v9;
  if (a5) {
    [(NSMutableDictionary *)v9 setObject:a5 forKey:@"CLDurianError"];
  }
  else {
    [(NSMutableDictionary *)v9 setObject:+[NSNumber numberWithUnsignedChar:v6] forKey:@"CLAISBatteryTypeKey"];
  }
  sub_100134750(__p, "DurianManagement/DidFetchAISBatteryType");
  [(CLDurianClientAdapter *)self sendMessage:__p forTag:a3 withPayload:v10];
  if (v12 < 0) {
    operator delete(__p[0]);
  }
}

- (void)didFetchAISBatteryLevelFromDevice:(id)a3 batteryLevel:(unsigned __int8)a4 error:(id)a5
{
  uint64_t v6 = a4;
  CFStringRef v13 = @"CLDurianIdentifier";
  id v14 = a3;
  char v9 = +[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", +[NSDictionary dictionaryWithObjects:&v14 forKeys:&v13 count:1]);
  char v10 = v9;
  if (a5) {
    [(NSMutableDictionary *)v9 setObject:a5 forKey:@"CLDurianError"];
  }
  else {
    [(NSMutableDictionary *)v9 setObject:+[NSNumber numberWithUnsignedChar:v6] forKey:@"CLAISBatteryLevelKey"];
  }
  sub_100134750(__p, "DurianManagement/DidFetchAISBatteryLevel");
  [(CLDurianClientAdapter *)self sendMessage:__p forTag:a3 withPayload:v10];
  if (v12 < 0) {
    operator delete(__p[0]);
  }
}

- (void)didFetchAISSerialNumberFromDevice:(id)a3 serialNumber:(id)a4 error:(id)a5
{
  CFStringRef v13 = @"CLDurianIdentifier";
  id v14 = a3;
  char v9 = +[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", +[NSDictionary dictionaryWithObjects:&v14 forKeys:&v13 count:1]);
  char v10 = v9;
  if (a5) {
    [(NSMutableDictionary *)v9 setObject:a5 forKey:@"CLDurianError"];
  }
  else {
    [(NSMutableDictionary *)v9 setObject:a4 forKey:@"CLAISSerialNumberKey"];
  }
  sub_100134750(__p, "DurianManagement/DidFetchAISSerialNumber");
  [(CLDurianClientAdapter *)self sendMessage:__p forTag:a3 withPayload:v10];
  if (v12 < 0) {
    operator delete(__p[0]);
  }
}

- (void)didFetchStatusOfUTEnablementRequirementsWithStatus:(id)a3
{
  CFStringRef v7 = @"CLTAEnablementRequirementsStatusKey";
  id v8 = a3;
  v4 = +[NSDictionary dictionaryWithObjects:&v8 forKeys:&v7 count:1];
  sub_100134750(__p, "DurianManagement/DidFetchStatusOfUTEnablementRequirements");
  [(CLDurianClientAdapter *)self sendMessage:__p forTag:0 withPayload:v4];
  if (v6 < 0) {
    operator delete(__p[0]);
  }
}

- (BOOL)valid
{
  return self->_valid;
}

- (void)setValid:(BOOL)a3
{
  self->_valid = a3;
}

- (CLDurianManagementClient)client
{
  return self->_client;
}

- (void)setClient:(CLDurianManagementClient *)a3
{
  self->_client = a3;
}

- (NSString)clientname
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

@end
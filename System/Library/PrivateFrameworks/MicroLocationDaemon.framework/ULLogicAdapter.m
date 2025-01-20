@interface ULLogicAdapter
+ (id)_newULServiceDescriptorFromInternalDescriptor:(const void *)a3;
- (BOOL)isDataAvailable;
- (BOOL)purgeMicroLocationData;
- (NSMutableArray)sleepWakeEventsQueue;
- (ULEnvironment)environment;
- (ULLogicAdapter)init;
- (ULLogicAdapter)initWithEnvironment:(id)a3 delegate:(id)a4;
- (ULOdometryProvider)_startSensors;
- (ULWiFiScanProvider)_startSensors;
- (id).cxx_construct;
- (id)_startSensors;
- (id)deleteServiceWithIdentifier:(id)a3 clientIdentifier:(id)a4;
- (id)diagnosticInfo;
- (id)donateMicroLocationTruthTagWithTagUUID:(id)a3 correspondingToTriggerUUID:(id)a4 handler:(id)a5 clientId:(id)a6;
- (id)donateMicroLocationTruthTagWithTagUUID:(id)a3 forRecordingEventsBetweenDate:(id)a4 andDate:(id)a5 handler:(id)a6 clientId:(id)a7;
- (id)exportDatabase;
- (id)getMicroLocationInternalVersion;
- (id)getRecordingTriggerUUIDAndRequestMicroLocationRecordingScanWithAdditionalInformation:(id)a3 shouldForceRecording:(BOOL)a4 handler:(id)a5 clientId:(id)a6;
- (id)purgeDatabase;
- (id)queryServicesForClient:(id)a3;
- (uint64_t)_analyticsExecute:;
- (uint64_t)_exportiCloudBackupExecute:;
- (uint64_t)_learnExecute:;
- (uint64_t)_maintenanceExecute:;
- (uint64_t)_routineStateAnalyzerExecute:;
- (uint64_t)_startSensors;
- (uint64_t)_wifiAnalyticsExecute:;
- (void)_analyticsExecute:;
- (void)_analyticsExecute:(id)a3;
- (void)_exportiCloudBackupExecute:;
- (void)_exportiCloudBackupExecute:(id)a3;
- (void)_handleULAirplaneModeMonitorEventAirplaneMode:(id)a3;
- (void)_handleULBatteryModeMonitorEventLowPowerMode:(id)a3;
- (void)_handleULBatteryModeMonitorEventUnlimitedPower:(id)a3;
- (void)_handleULBluetoothMonitorEventPowerOn:(id)a3;
- (void)_handleULBuddyMonitorEventBuddyComplete:(id)a3;
- (void)_handleULDataProtectionMonitorEventDataAvailable:(id)a3;
- (void)_handleULDisplayMonitorEventDisplayState:(id)a3;
- (void)_handleULDisplayMonitorEventDisplayState_OSX:(id)a3;
- (void)_handleULInternalNotifyMonitorEventLocalize:(id)a3;
- (void)_handleULInternalNotifyMonitorEventPurge:(id)a3;
- (void)_handleULInternalNotifyMonitorEventRecord:(id)a3;
- (void)_handleULInternalNotifyMonitorEventSettingsRefrsh:(id)a3;
- (void)_handleULPrivacyMonitorEventLocationServices:(id)a3;
- (void)_handleULRapportMonitorEventDeviceFound:(id)a3;
- (void)_handleULRapportMonitorEventIdentities:(id)a3;
- (void)_handleULSleepWakeMonitorEvent:(id)a3;
- (void)_learnExecute:;
- (void)_learnExecute:(id)a3;
- (void)_maintenanceExecute:;
- (void)_maintenanceExecute:(id)a3;
- (void)_registerOnDatabaseValidNotification;
- (void)_registerOrUnregisterForActivities:(BOOL)a3;
- (void)_registerOrUnregisterForBackgroundTaskWithRequest:(id)a3 withSelector:(SEL)a4 requiresMiLoEnabled:(BOOL)a5 isRegister:(BOOL)a6;
- (void)_routineStateAnalyzerExecute:;
- (void)_routineStateAnalyzerExecute:(id)a3;
- (void)_start;
- (void)_startMonitoringEvents;
- (void)_startSensors;
- (void)_stop;
- (void)_stopMonitoringEvents;
- (void)_wifiAnalyticsExecute:;
- (void)_wifiAnalyticsExecute:(id)a3;
- (void)connectWithServiceIdentifier:(id)a3 legacyServiceIdentifier:(id)a4 clientIdentifier:(id)a5 connectionToken:(id)a6 requestIdentifier:(id)a7;
- (void)createCustomLoiAtCurrentLocationForConnectionToken:(id)a3 withConfiguration:(id)a4;
- (void)dealloc;
- (void)disconnectWithConnectionToken:(id)a3 clientIdentifier:(id)a4 requestIdentifier:(id)a5;
- (void)labelObservationForConnectionToken:(id)a3 withRequestIdentifier:(id)a4 andPlaceIdentifier:(id)a5 andReturnIdentifier:(id)a6;
- (void)removeCustomLoiWithIdentifier:(id)a3 forConnectionToken:(id)a4;
- (void)removePendingConnectionRequestsByConnectionToken:(id)a3;
- (void)requestCurrentMicroLocationWithAdditionalInformation:(id)a3 clientId:(id)a4;
- (void)requestMicroLocationRecordingScanWithAdditionalInformation:(id)a3 clientId:(id)a4;
- (void)requestModelLearningForConnectionToken:(id)a3 requestIdentifier:(id)a4;
- (void)requestObservationForConnectionToken:(id)a3 clientIdentifier:(id)a4 requestIdentifier:(id)a5;
- (void)requestPredictionForConnectionToken:(id)a3 clientIdentifier:(id)a4 requestIdentifier:(id)a5;
- (void)setEnvironment:(id)a3;
- (void)setSleepWakeEventsQueue:(id)a3;
- (void)startRapportSession;
- (void)startUpdatingForConnectionToken:(id)a3 updateConfiguration:(id)a4 requestIdentifier:(id)a5;
- (void)stopRapportSession;
- (void)stopUpdatingForConnectionToken:(id)a3 requestIdentifier:(id)a4;
@end

@implementation ULLogicAdapter

- (void)_handleULDisplayMonitorEventDisplayState:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  id v5 = v4;
  if (objc_opt_isKindOfClass()) {
    v6 = v5;
  }
  else {
    v6 = 0;
  }
  id v7 = v6;

  v8 = [(ULLogicAdapter *)self environment];
  v9 = [v8 queue];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __59__ULLogicAdapter__handleULDisplayMonitorEventDisplayState___block_invoke;
  v11[3] = &unk_2653FA348;
  id v12 = v7;
  v13 = self;
  id v10 = v7;
  dispatch_async(v9, v11);
}

- (ULEnvironment)environment
{
  return self->_environment;
}

void __59__ULLogicAdapter__handleULDisplayMonitorEventDisplayState___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  CFAbsoluteTime v14 = cl::chrono::CFAbsoluteTimeClock::now();
  if ([*(id *)(a1 + 32) displayOnChanged])
  {
    if (onceToken_MicroLocation_Default != -1) {
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_903);
    }
    v2 = (id)logObject_MicroLocation_Default;
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      int v3 = [*(id *)(a1 + 32) displayOn];
      id v4 = @"Off";
      if (v3) {
        id v4 = @"On";
      }
      *(_DWORD *)buf = 138412290;
      *(void *)&buf[4] = v4;
      _os_log_impl(&dword_25631F000, v2, OS_LOG_TYPE_DEFAULT, "_handleULDisplayMonitorEventDisplayState: display: %@", buf, 0xCu);
    }

    CLMicroLocationLogic::setDisplayState((unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 224), [*(id *)(a1 + 32) displayOn], &v14);
    CLMicroLocationLegacyClient::onDisplayState(*(void *)(*(void *)(a1 + 40) + 8) + 2848, [*(id *)(a1 + 32) displayOn], &v14);
  }
  if ([*(id *)(a1 + 32) screenLockedChanged])
  {
    if (onceToken_MicroLocation_Default != -1) {
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_903);
    }
    id v5 = (id)logObject_MicroLocation_Default;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = [*(id *)(a1 + 32) screenLocked];
      id v7 = @"Unlocked";
      if (v6) {
        id v7 = @"Locked";
      }
      *(_DWORD *)buf = 138412290;
      *(void *)&buf[4] = v7;
      _os_log_impl(&dword_25631F000, v5, OS_LOG_TYPE_DEFAULT, "_handleULDisplayMonitorEventDisplayState: screen: %@", buf, 0xCu);
    }

    CLMicroLocationLogic::setLockScreenState((CLMicroLocationLogic *)(*(void *)(*(void *)(a1 + 40) + 8) + 224), [*(id *)(a1 + 32) screenLocked]);
  }
  if ([*(id *)(a1 + 32) appInFocusChanged])
  {
    if (onceToken_MicroLocation_Default != -1) {
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_903);
    }
    v8 = (id)logObject_MicroLocation_Default;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = [*(id *)(a1 + 32) appInFocus];
      *(_DWORD *)buf = 138412290;
      *(void *)&buf[4] = v9;
      _os_log_impl(&dword_25631F000, v8, OS_LOG_TYPE_DEFAULT, "_handleULDisplayMonitorEventDisplayState: appInFocus: %@", buf, 0xCu);
    }
    id v10 = [*(id *)(a1 + 32) appInFocus];
    BOOL v11 = v10 == 0;

    if (!v11)
    {
      uint64_t v12 = *(void *)(*(void *)(a1 + 40) + 8);
      id v13 = [*(id *)(a1 + 32) appInFocus];
      std::string::basic_string[abi:ne180100]<0>(buf, (char *)[v13 UTF8String]);
      CLMicroLocationLegacyClient::onAppLaunch((CLMicroLocationLegacyClient *)(v12 + 2848), (uint64_t)buf, &v14);
      if (v16 < 0) {
        operator delete(*(void **)buf);
      }
    }
  }
}

- (ULLogicAdapter)init
{
  uint64_t v2 = objc_opt_class();
  _ULRequireInitializer(v2, sel_initWithEnvironment_delegate_);
}

- (ULLogicAdapter)initWithEnvironment:(id)a3 delegate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [v6 queue];
  dispatch_assert_queue_V2(v8);

  v11.receiver = self;
  v11.super_class = (Class)ULLogicAdapter;
  v9 = [(ULLogicAdapter *)&v11 init];
  if (v9)
  {
    [(ULLogicAdapter *)v9 setEnvironment:v6];
    [v6 queue];
    objc_claimAutoreleasedReturnValue();
    operator new();
  }

  return 0;
}

void __47__ULLogicAdapter_initWithEnvironment_delegate___block_invoke(uint64_t a1)
{
  if (onceToken_MicroLocation_Default != -1) {
    dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_903);
  }
  uint64_t v2 = logObject_MicroLocation_Default;
  if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_25631F000, v2, OS_LOG_TYPE_DEFAULT, "databaseValid - log daemon started", v4, 2u);
  }
  int v3 = +[ULHomeSlamAnalytics shared];
  [v3 logEventDaemonStartedAtTimestamp:*(double *)(a1 + 32)];
}

- (void)dealloc
{
  [(ULLogicAdapter *)self _stop];
  [(ULLogicAdapter *)self setEnvironment:0];
  v3.receiver = self;
  v3.super_class = (Class)ULLogicAdapter;
  [(ULLogicAdapter *)&v3 dealloc];
}

- (BOOL)purgeMicroLocationData
{
  objc_super v3 = [(ULLogicAdapter *)self environment];
  id v4 = [v3 queue];
  dispatch_assert_queue_V2(v4);

  char v5 = CLMicroLocationLogic::onResetLocationData((CLMicroLocationLogic *)((char *)self->logicAdapterImpl.__ptr_.__value_
                                                                        + 224));
  if (([MEMORY[0x263F55810] isMac] & 1) == 0) {
    +[ULCoreDuetPublisher clearMicroLocationVisitStream];
  }
  return v5;
}

- (void)_startSensors
{
}

- (id)deleteServiceWithIdentifier:(id)a3 clientIdentifier:(id)a4
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v6 = (CLMicroLocationProtobufHelper *)a3;
  id v7 = a4;
  v8 = [(ULLogicAdapter *)self environment];
  v9 = [v8 queue];
  dispatch_assert_queue_V2(v9);

  std::string::basic_string[abi:ne180100]<0>(__p, "");
  CLMicroLocationProtobufHelper::boostUuidFromNSUUID(v6, (uint64_t)&v36);
  if (!v37)
  {
    -[ULLogicAdapter deleteServiceWithIdentifier:clientIdentifier:](&__str);

    abort_report_np();
    __break(1u);
  }
  CLMicroLocationProto::ServiceDelete::ServiceDelete((CLMicroLocationProto::ServiceDelete *)&v24);
  id v10 = v7;
  std::string::basic_string[abi:ne180100]<0>(&__str, (char *)[v10 UTF8String]);
  v27 |= 2u;
  objc_super v11 = (std::string *)MEMORY[0x263F8C740];
  if (v25 == (std::string *)MEMORY[0x263F8C740]) {
    operator new();
  }
  std::string::operator=(v25, &__str);
  if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__str.__r_.__value_.__l.__data_);
  }
  if (!v37) {
    std::__throw_bad_optional_access[abi:ne180100]();
  }
  memset(&v35, 0, sizeof(v35));
  if ((boost::conversion::detail::try_lexical_convert<std::string,boost::uuids::uuid>((uint64_t)&v36, &v35) & 1) == 0)
  {
    std::bad_cast::bad_cast((std::bad_cast *)&__str);
    __str.__r_.__value_.__r.__words[0] = (std::string::size_type)&unk_2704DAAD0;
    boost::throw_exception<boost::bad_lexical_cast>((uint64_t)&__str);
  }
  v27 |= 4u;
  if (v26 == v11) {
    operator new();
  }
  std::string::operator=(v26, &v35);
  if (SHIBYTE(v35.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v35.__r_.__value_.__l.__data_);
  }
  value = self->logicAdapterImpl.__ptr_.__value_;
  int v23 = 0;
  boost::uuids::detail::random_provider_base::random_provider_base((boost::uuids::detail::random_provider_base *)&v23);
  v35.__r_.__value_.__r.__words[0] = boost::uuids::random_generator_pure::operator()((uint64_t)&v23);
  v35.__r_.__value_.__l.__size_ = v13;
  double v14 = cl::chrono::CFAbsoluteTimeClock::now();
  CLMicroLocationProtobufHelper::createLoggedEvent<CLMicroLocationProto::ServiceDelete>(&v35, &v24, (uint64_t)&__str, v14);
  (*(void (**)(ULLogicAdapterImpl *, std::string *))(*(void *)value + 72))(value, &__str);
  CLMicroLocationProto::ReceivedEvent::~ReceivedEvent((CLMicroLocationProto::ReceivedEvent *)v33);
  boost::uuids::detail::random_provider_base::destroy((boost::uuids::detail::random_provider_base *)&v23);
  v15 = self->logicAdapterImpl.__ptr_.__value_;
  id v16 = v10;
  std::string::basic_string[abi:ne180100]<0>(&v35, (char *)[v16 UTF8String]);
  if (!v37) {
    std::__throw_bad_optional_access[abi:ne180100]();
  }
  CLMicroLocationLogic::deleteService((uint64_t)v15 + 224, (unsigned __int8 *)&v35, v36, (uint64_t *)__p, (uint64_t)&__str);
  if (SHIBYTE(v35.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v35.__r_.__value_.__l.__data_);
  }
  uint64_t v17 = objc_opt_new();
  if (v33[0])
  {
    id v18 = +[ULLogicAdapter _newULServiceDescriptorFromInternalDescriptor:&__str];
    [v17 setServiceDescriptor:v18];
  }
  if (v34 != -1)
  {
    uint64_t v30 = *MEMORY[0x263F08320];
    v31 = @"deleteServiceWithIdentifier failed internally";
    v19 = [NSDictionary dictionaryWithObjects:&v31 forKeys:&v30 count:1];
    id v20 = objc_alloc(MEMORY[0x263F087E8]);
    v21 = (void *)[v20 initWithDomain:@"ULLogicDomain" code:v34 userInfo:v19];
    [v17 setError:v21];
  }
  CLMicroLocationProto::ServiceDelete::~ServiceDelete((CLMicroLocationProto::ServiceDelete *)&v24);
  if (v29 < 0) {
    operator delete(__p[0]);
  }

  return v17;
}

- (id)queryServicesForClient:(id)a3
{
  id v4 = a3;
  char v5 = [(ULLogicAdapter *)self environment];
  id v6 = [v5 queue];
  dispatch_assert_queue_V2(v6);

  std::string::basic_string[abi:ne180100]<0>(v19, "");
  value = self->logicAdapterImpl.__ptr_.__value_;
  id v8 = v4;
  std::string::basic_string[abi:ne180100]<0>(__p, (char *)[v8 UTF8String]);
  CLMicroLocationLogic::queryServices((uint64_t)value + 224, (uint64_t *)__p, (uint64_t)v19, (uint64_t)&v17);
  if (v16 < 0) {
    operator delete(__p[0]);
  }
  v9 = objc_opt_new();
  id v10 = (char *)v17;
  objc_super v11 = v18;
  if (v17 != v18)
  {
    do
    {
      id v12 = +[ULLogicAdapter _newULServiceDescriptorFromInternalDescriptor:v10];
      [v9 addObject:v12];

      v10 += 32;
    }
    while (v10 != v11);
  }
  std::string::size_type v13 = [MEMORY[0x263EFF8C0] arrayWithArray:v9];

  if (v17)
  {
    id v18 = (char *)v17;
    operator delete(v17);
  }
  if (v20 < 0) {
    operator delete(v19[0]);
  }

  return v13;
}

- (void)connectWithServiceIdentifier:(id)a3 legacyServiceIdentifier:(id)a4 clientIdentifier:(id)a5 connectionToken:(id)a6 requestIdentifier:(id)a7
{
  uint64_t v54 = *MEMORY[0x263EF8340];
  id v12 = (CLMicroLocationProtobufHelper *)a3;
  std::string::size_type v13 = (CLMicroLocationProtobufHelper *)a4;
  id v14 = a5;
  v15 = (CLMicroLocationProtobufHelper *)a6;
  id v16 = a7;
  uint64_t v17 = [(ULLogicAdapter *)self environment];
  id v18 = [v17 queue];
  dispatch_assert_queue_V2(v18);

  CLMicroLocationProtobufHelper::boostUuidFromNSUUID(v12, (uint64_t)v52);
  CLMicroLocationProtobufHelper::boostUuidFromNSUUID(v15, (uint64_t)v50);
  if (!v53)
  {
    uint64_t v30 = _CLLogObjectForCategory_MicroLocation_Default();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_FAULT))
    {
      *(void *)std::string __str = 68289539;
      *(_WORD *)&__str[8] = 2082;
      *(void *)&__str[10] = "";
      *(_WORD *)&__str[18] = 2082;
      *(void *)&__str[20] = "assert";
      __int16 v47 = 2081;
      v48 = "serviceId.has_value()";
      _os_log_impl(&dword_25631F000, v30, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"Connect to service without identifier\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", __str, 0x26u);
    }

    v31 = _CLLogObjectForCategory_MicroLocation_Default();
    if (os_signpost_enabled(v31))
    {
      *(void *)std::string __str = 68289539;
      *(_WORD *)&__str[8] = 2082;
      *(void *)&__str[10] = "";
      *(_WORD *)&__str[18] = 2082;
      *(void *)&__str[20] = "assert";
      __int16 v47 = 2081;
      v48 = "serviceId.has_value()";
      _os_signpost_emit_with_name_impl(&dword_25631F000, v31, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Connect to service without identifier", "{\"msg%{public}.0s\":\"Connect to service without identifier\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", __str, 0x26u);
    }

    v32 = _CLLogObjectForCategory_MicroLocation_Default();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
    {
      *(void *)std::string __str = 68289539;
      *(_WORD *)&__str[8] = 2082;
      *(void *)&__str[10] = "";
      *(_WORD *)&__str[18] = 2082;
      *(void *)&__str[20] = "assert";
      __int16 v47 = 2081;
      v48 = "serviceId.has_value()";
      _os_log_impl(&dword_25631F000, v32, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"Connect to service without identifier\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", __str, 0x26u);
    }
LABEL_38:

    abort_report_np();
    __break(1u);
  }
  if (!v51)
  {
    v33 = _CLLogObjectForCategory_MicroLocation_Default();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_FAULT))
    {
      *(void *)std::string __str = 68289539;
      *(_WORD *)&__str[8] = 2082;
      *(void *)&__str[10] = "";
      *(_WORD *)&__str[18] = 2082;
      *(void *)&__str[20] = "assert";
      __int16 v47 = 2081;
      v48 = "connectionId.has_value()";
      _os_log_impl(&dword_25631F000, v33, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"Connect to service without connectionToken\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", __str, 0x26u);
    }

    uint64_t v34 = _CLLogObjectForCategory_MicroLocation_Default();
    if (os_signpost_enabled(v34))
    {
      *(void *)std::string __str = 68289539;
      *(_WORD *)&__str[8] = 2082;
      *(void *)&__str[10] = "";
      *(_WORD *)&__str[18] = 2082;
      *(void *)&__str[20] = "assert";
      __int16 v47 = 2081;
      v48 = "connectionId.has_value()";
      _os_signpost_emit_with_name_impl(&dword_25631F000, v34, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Connect to service without connectionToken", "{\"msg%{public}.0s\":\"Connect to service without connectionToken\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", __str, 0x26u);
    }

    v32 = _CLLogObjectForCategory_MicroLocation_Default();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
    {
      *(void *)std::string __str = 68289539;
      *(_WORD *)&__str[8] = 2082;
      *(void *)&__str[10] = "";
      *(_WORD *)&__str[18] = 2082;
      *(void *)&__str[20] = "assert";
      __int16 v47 = 2081;
      v48 = "connectionId.has_value()";
      _os_log_impl(&dword_25631F000, v32, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"Connect to service without connectionToken\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", __str, 0x26u);
    }
    goto LABEL_38;
  }
  std::string::basic_string[abi:ne180100]<0>(__p, "");
  CLMicroLocationProto::ServiceConnect::ServiceConnect((CLMicroLocationProto::ServiceConnect *)&v36);
  id v19 = v14;
  std::string::basic_string[abi:ne180100]<0>(__str, (char *)[v19 UTF8String]);
  v39 |= 2u;
  char v20 = (std::string *)MEMORY[0x263F8C740];
  if (v37 == (std::string *)MEMORY[0x263F8C740]) {
    operator new();
  }
  std::string::operator=(v37, (const std::string *)__str);
  if ((__str[23] & 0x80000000) != 0) {
    operator delete(*(void **)__str);
  }
  if (!v53) {
    std::__throw_bad_optional_access[abi:ne180100]();
  }
  memset(&v49, 0, sizeof(v49));
  if ((boost::conversion::detail::try_lexical_convert<std::string,boost::uuids::uuid>((uint64_t)v52, &v49) & 1) == 0)
  {
    std::bad_cast::bad_cast((std::bad_cast *)__str);
    *(void *)std::string __str = &unk_2704DAAD0;
    boost::throw_exception<boost::bad_lexical_cast>((uint64_t)__str);
  }
  v39 |= 4u;
  if (v38 == v20) {
    operator new();
  }
  std::string::operator=(v38, &v49);
  if (SHIBYTE(v49.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v49.__r_.__value_.__l.__data_);
  }
  value = self->logicAdapterImpl.__ptr_.__value_;
  int v35 = 0;
  boost::uuids::detail::random_provider_base::random_provider_base((boost::uuids::detail::random_provider_base *)&v35);
  v49.__r_.__value_.__r.__words[0] = boost::uuids::random_generator_pure::operator()((uint64_t)&v35);
  v49.__r_.__value_.__l.__size_ = v22;
  double v23 = cl::chrono::CFAbsoluteTimeClock::now();
  CLMicroLocationProtobufHelper::createLoggedEvent<CLMicroLocationProto::ServiceConnect>(&v49, &v36, (uint64_t)__str, v23);
  (*(void (**)(ULLogicAdapterImpl *, unsigned char *))(*(void *)value + 72))(value, __str);
  CLMicroLocationProto::ReceivedEvent::~ReceivedEvent((CLMicroLocationProto::ReceivedEvent *)((char *)&v48 + 2));
  boost::uuids::detail::random_provider_base::destroy((boost::uuids::detail::random_provider_base *)&v35);
  if (v13)
  {
    CLMicroLocationProtobufHelper::boostUuidFromNSUUID(v13, (uint64_t)&v49);
  }
  else
  {
    v49.__r_.__value_.__s.__data_[0] = 0;
    v49.__r_.__value_.__s.__data_[16] = 0;
  }
  int v24 = self->logicAdapterImpl.__ptr_.__value_;
  id v25 = v19;
  std::string::basic_string[abi:ne180100]<0>(__str, (char *)[v25 UTF8String]);
  if (!v53 || (long long v44 = *(_OWORD *)&v49.__r_.__value_.__l.__data_, v45 = v49.__r_.__value_.__s.__data_[16], !v51)) {
    std::__throw_bad_optional_access[abi:ne180100]();
  }
  uint64_t v26 = CLMicroLocationLogic::connectToService((uint64_t)v24 + 224, (uint64_t)__str, v52[0], v52[1], &v44, v50[0], v50[1], (uint64_t)__p);
  if ((__str[23] & 0x80000000) != 0) {
    operator delete(*(void **)__str);
  }
  if (v26 != -1)
  {
    int v27 = (void *)MEMORY[0x263F087E8];
    uint64_t v42 = *MEMORY[0x263F08320];
    v43 = @"connectWithServiceIdentifier failed internally";
    v28 = [NSDictionary dictionaryWithObjects:&v43 forKeys:&v42 count:1];
    char v29 = [v27 errorWithDomain:@"ULLogicDomain" code:v26 userInfo:v28];

    [*((id *)self->logicAdapterImpl.__ptr_.__value_ + 374) didFailWithError:v29 toConnection:v15];
  }
  CLMicroLocationProto::ServiceConnect::~ServiceConnect((CLMicroLocationProto::ServiceConnect *)&v36);
  if (v41 < 0) {
    operator delete(__p[0]);
  }
}

- (void)disconnectWithConnectionToken:(id)a3 clientIdentifier:(id)a4 requestIdentifier:(id)a5
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v8 = (CLMicroLocationProtobufHelper *)a3;
  id v9 = a4;
  id v10 = a5;
  objc_super v11 = [(ULLogicAdapter *)self environment];
  id v12 = [v11 queue];
  dispatch_assert_queue_V2(v12);

  CLMicroLocationProtobufHelper::boostUuidFromNSUUID(v8, (uint64_t)v23);
  if (!v24)
  {
    -[ULLogicAdapter disconnectWithConnectionToken:clientIdentifier:requestIdentifier:](v19);

    abort_report_np();
    __break(1u);
  }
  std::string::basic_string[abi:ne180100]<0>(v19, "");
  value = self->logicAdapterImpl.__ptr_.__value_;
  id v14 = v9;
  std::string::basic_string[abi:ne180100]<0>(&__p, (char *)[v14 UTF8String]);
  if (!v24) {
    std::__throw_bad_optional_access[abi:ne180100]();
  }
  uint64_t v15 = CLMicroLocationLogic::disconnectFromService((uint64_t)value + 224, &__p, v23[0], v23[1], (unsigned __int8 *)v19);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
  if (v15 != -1)
  {
    uint64_t v21 = *MEMORY[0x263F08320];
    std::string::size_type v22 = @"disconnect service failed internally";
    id v16 = [NSDictionary dictionaryWithObjects:&v22 forKeys:&v21 count:1];
    uint64_t v17 = (void *)[objc_alloc(MEMORY[0x263F087E8]) initWithDomain:@"ULLogicDomain" code:v15 userInfo:v16];
    [*((id *)self->logicAdapterImpl.__ptr_.__value_ + 374) didCompleteRequest:v10 withError:v17 toConnection:v8];
  }
  if (v20 < 0) {
    operator delete(v19[0]);
  }
}

- (void)requestObservationForConnectionToken:(id)a3 clientIdentifier:(id)a4 requestIdentifier:(id)a5
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v8 = (CLMicroLocationProtobufHelper *)a3;
  id v9 = a4;
  id v10 = (CLMicroLocationProtobufHelper *)a5;
  objc_super v11 = [(ULLogicAdapter *)self environment];
  id v12 = [v11 queue];
  dispatch_assert_queue_V2(v12);

  CLMicroLocationProtobufHelper::boostUuidFromNSUUID(v8, (uint64_t)&v34);
  CLMicroLocationProtobufHelper::boostUuidFromNSUUID(v10, (uint64_t)v32);
  if (!v35)
  {
    id v16 = _CLLogObjectForCategory_MicroLocation_Default();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 68289539;
      *(_DWORD *)&buf[4] = 0;
      __int16 v26 = 2082;
      int v27 = "";
      __int16 v28 = 2082;
      char v29 = "assert";
      __int16 v30 = 2081;
      v31 = "connectionId.has_value()";
      _os_log_impl(&dword_25631F000, v16, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"request observation without connectionToken\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }

    uint64_t v17 = _CLLogObjectForCategory_MicroLocation_Default();
    if (os_signpost_enabled(v17))
    {
      *(_DWORD *)buf = 68289539;
      *(_DWORD *)&buf[4] = 0;
      __int16 v26 = 2082;
      int v27 = "";
      __int16 v28 = 2082;
      char v29 = "assert";
      __int16 v30 = 2081;
      v31 = "connectionId.has_value()";
      _os_signpost_emit_with_name_impl(&dword_25631F000, v17, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "request observation without connectionToken", "{\"msg%{public}.0s\":\"request observation without connectionToken\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }

    id v18 = _CLLogObjectForCategory_MicroLocation_Default();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 68289539;
      *(_DWORD *)&buf[4] = 0;
      __int16 v26 = 2082;
      int v27 = "";
      __int16 v28 = 2082;
      char v29 = "assert";
      __int16 v30 = 2081;
      v31 = "connectionId.has_value()";
      _os_log_impl(&dword_25631F000, v18, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"request observation without connectionToken\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }
LABEL_21:

    abort_report_np();
    __break(1u);
  }
  if (!v33)
  {
    id v19 = _CLLogObjectForCategory_MicroLocation_Default();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 68289539;
      *(_DWORD *)&buf[4] = 0;
      __int16 v26 = 2082;
      int v27 = "";
      __int16 v28 = 2082;
      char v29 = "assert";
      __int16 v30 = 2081;
      v31 = "requestId.has_value()";
      _os_log_impl(&dword_25631F000, v19, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"request observation without requestIdentifier\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }

    char v20 = _CLLogObjectForCategory_MicroLocation_Default();
    if (os_signpost_enabled(v20))
    {
      *(_DWORD *)buf = 68289539;
      *(_DWORD *)&buf[4] = 0;
      __int16 v26 = 2082;
      int v27 = "";
      __int16 v28 = 2082;
      char v29 = "assert";
      __int16 v30 = 2081;
      v31 = "requestId.has_value()";
      _os_signpost_emit_with_name_impl(&dword_25631F000, v20, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "request observation without requestIdentifier", "{\"msg%{public}.0s\":\"request observation without requestIdentifier\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }

    id v18 = _CLLogObjectForCategory_MicroLocation_Default();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 68289539;
      *(_DWORD *)&buf[4] = 0;
      __int16 v26 = 2082;
      int v27 = "";
      __int16 v28 = 2082;
      char v29 = "assert";
      __int16 v30 = 2081;
      v31 = "requestId.has_value()";
      _os_log_impl(&dword_25631F000, v18, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"request observation without requestIdentifier\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }
    goto LABEL_21;
  }
  *(void *)buf = cl::chrono::CFAbsoluteTimeClock::now();
  if (!v35 || !v33) {
    std::__throw_bad_optional_access[abi:ne180100]();
  }
  std::string::size_type v13 = (char *)self->logicAdapterImpl.__ptr_.__value_ + 224;
  LOBYTE(v23) = 0;
  char v24 = 0;
  if ((CLMicroLocationLogic::requestObservation((uint64_t)v13, v34, v32[0], v32[1], &v23, (double *)buf) & 1) == 0)
  {
    uint64_t v21 = *MEMORY[0x263F08320];
    std::string::size_type v22 = @"request observation failed internally";
    id v14 = [NSDictionary dictionaryWithObjects:&v22 forKeys:&v21 count:1];
    uint64_t v15 = (void *)[objc_alloc(MEMORY[0x263F087E8]) initWithDomain:@"ULLogicDomain" code:12 userInfo:v14];
    [*((id *)self->logicAdapterImpl.__ptr_.__value_ + 374) didCompleteRequest:v10 withError:v15 toConnection:v8];
  }
}

- (void)requestPredictionForConnectionToken:(id)a3 clientIdentifier:(id)a4 requestIdentifier:(id)a5
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v8 = (CLMicroLocationProtobufHelper *)a3;
  id v9 = a4;
  id v10 = (CLMicroLocationProtobufHelper *)a5;
  objc_super v11 = [(ULLogicAdapter *)self environment];
  id v12 = [v11 queue];
  dispatch_assert_queue_V2(v12);

  CLMicroLocationProtobufHelper::boostUuidFromNSUUID(v8, (uint64_t)&v31);
  CLMicroLocationProtobufHelper::boostUuidFromNSUUID(v10, (uint64_t)&v29);
  if (!v32)
  {
    uint64_t v15 = _CLLogObjectForCategory_MicroLocation_Default();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 68289539;
      *(_DWORD *)&buf[4] = 0;
      __int16 v23 = 2082;
      char v24 = "";
      __int16 v25 = 2082;
      __int16 v26 = "assert";
      __int16 v27 = 2081;
      __int16 v28 = "connectionId.has_value()";
      _os_log_impl(&dword_25631F000, v15, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"request prediction without connectionToken\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }

    id v16 = _CLLogObjectForCategory_MicroLocation_Default();
    if (os_signpost_enabled(v16))
    {
      *(_DWORD *)buf = 68289539;
      *(_DWORD *)&buf[4] = 0;
      __int16 v23 = 2082;
      char v24 = "";
      __int16 v25 = 2082;
      __int16 v26 = "assert";
      __int16 v27 = 2081;
      __int16 v28 = "connectionId.has_value()";
      _os_signpost_emit_with_name_impl(&dword_25631F000, v16, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "request prediction without connectionToken", "{\"msg%{public}.0s\":\"request prediction without connectionToken\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }

    uint64_t v17 = _CLLogObjectForCategory_MicroLocation_Default();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 68289539;
      *(_DWORD *)&buf[4] = 0;
      __int16 v23 = 2082;
      char v24 = "";
      __int16 v25 = 2082;
      __int16 v26 = "assert";
      __int16 v27 = 2081;
      __int16 v28 = "connectionId.has_value()";
      _os_log_impl(&dword_25631F000, v17, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"request prediction without connectionToken\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }
LABEL_21:

    abort_report_np();
    __break(1u);
  }
  if (!v30)
  {
    id v18 = _CLLogObjectForCategory_MicroLocation_Default();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 68289539;
      *(_DWORD *)&buf[4] = 0;
      __int16 v23 = 2082;
      char v24 = "";
      __int16 v25 = 2082;
      __int16 v26 = "assert";
      __int16 v27 = 2081;
      __int16 v28 = "requestId.has_value()";
      _os_log_impl(&dword_25631F000, v18, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"request prediction without requestIdentifier\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }

    id v19 = _CLLogObjectForCategory_MicroLocation_Default();
    if (os_signpost_enabled(v19))
    {
      *(_DWORD *)buf = 68289539;
      *(_DWORD *)&buf[4] = 0;
      __int16 v23 = 2082;
      char v24 = "";
      __int16 v25 = 2082;
      __int16 v26 = "assert";
      __int16 v27 = 2081;
      __int16 v28 = "requestId.has_value()";
      _os_signpost_emit_with_name_impl(&dword_25631F000, v19, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "request prediction without requestIdentifier", "{\"msg%{public}.0s\":\"request prediction without requestIdentifier\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }

    uint64_t v17 = _CLLogObjectForCategory_MicroLocation_Default();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 68289539;
      *(_DWORD *)&buf[4] = 0;
      __int16 v23 = 2082;
      char v24 = "";
      __int16 v25 = 2082;
      __int16 v26 = "assert";
      __int16 v27 = 2081;
      __int16 v28 = "requestId.has_value()";
      _os_log_impl(&dword_25631F000, v17, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"request prediction without requestIdentifier\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }
    goto LABEL_21;
  }
  *(void *)buf = cl::chrono::CFAbsoluteTimeClock::now();
  if (!v32 || !v30) {
    std::__throw_bad_optional_access[abi:ne180100]();
  }
  if ((CLMicroLocationLogic::predictionRequest((uint64_t)self->logicAdapterImpl.__ptr_.__value_ + 224, v31, &v29, (double *)buf, 1) & 1) == 0)
  {
    uint64_t v20 = *MEMORY[0x263F08320];
    uint64_t v21 = @"request prediction failed internally";
    std::string::size_type v13 = [NSDictionary dictionaryWithObjects:&v21 forKeys:&v20 count:1];
    id v14 = (void *)[objc_alloc(MEMORY[0x263F087E8]) initWithDomain:@"ULLogicDomain" code:29 userInfo:v13];
    [*((id *)self->logicAdapterImpl.__ptr_.__value_ + 374) didCompleteRequest:v10 withError:v14 toConnection:v8];
  }
}

- (void)labelObservationForConnectionToken:(id)a3 withRequestIdentifier:(id)a4 andPlaceIdentifier:(id)a5 andReturnIdentifier:(id)a6
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v10 = (CLMicroLocationProtobufHelper *)a3;
  objc_super v11 = (CLMicroLocationProtobufHelper *)a4;
  id v12 = (CLMicroLocationProtobufHelper *)a5;
  id v13 = a6;
  id v14 = [(ULLogicAdapter *)self environment];
  uint64_t v15 = [v14 queue];
  dispatch_assert_queue_V2(v15);

  CLMicroLocationProtobufHelper::boostUuidFromNSUUID(v10, (uint64_t)&v37);
  CLMicroLocationProtobufHelper::boostUuidFromNSUUID(v11, (uint64_t)&v35);
  CLMicroLocationProtobufHelper::boostUuidFromNSUUID(v12, (uint64_t)&v33);
  if (!v38)
  {
    id v18 = _CLLogObjectForCategory_MicroLocation_Default();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 68289539;
      int v26 = 0;
      __int16 v27 = 2082;
      __int16 v28 = "";
      __int16 v29 = 2082;
      char v30 = "assert";
      __int16 v31 = 2081;
      char v32 = "connectionId.has_value()";
      _os_log_impl(&dword_25631F000, v18, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"request observation without connectionToken\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }

    id v19 = _CLLogObjectForCategory_MicroLocation_Default();
    if (os_signpost_enabled(v19))
    {
      *(_DWORD *)buf = 68289539;
      int v26 = 0;
      __int16 v27 = 2082;
      __int16 v28 = "";
      __int16 v29 = 2082;
      char v30 = "assert";
      __int16 v31 = 2081;
      char v32 = "connectionId.has_value()";
      _os_signpost_emit_with_name_impl(&dword_25631F000, v19, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "request observation without connectionToken", "{\"msg%{public}.0s\":\"request observation without connectionToken\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }

    uint64_t v20 = _CLLogObjectForCategory_MicroLocation_Default();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 68289539;
      int v26 = 0;
      __int16 v27 = 2082;
      __int16 v28 = "";
      __int16 v29 = 2082;
      char v30 = "assert";
      __int16 v31 = 2081;
      char v32 = "connectionId.has_value()";
      _os_log_impl(&dword_25631F000, v20, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"request observation without connectionToken\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }
LABEL_20:

    abort_report_np();
    __break(1u);
  }
  if (!v36)
  {
    uint64_t v21 = _CLLogObjectForCategory_MicroLocation_Default();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 68289539;
      int v26 = 0;
      __int16 v27 = 2082;
      __int16 v28 = "";
      __int16 v29 = 2082;
      char v30 = "assert";
      __int16 v31 = 2081;
      char v32 = "requestId.has_value()";
      _os_log_impl(&dword_25631F000, v21, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"request observation without requestIdentifier\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }

    std::string::size_type v22 = _CLLogObjectForCategory_MicroLocation_Default();
    if (os_signpost_enabled(v22))
    {
      *(_DWORD *)buf = 68289539;
      int v26 = 0;
      __int16 v27 = 2082;
      __int16 v28 = "";
      __int16 v29 = 2082;
      char v30 = "assert";
      __int16 v31 = 2081;
      char v32 = "requestId.has_value()";
      _os_signpost_emit_with_name_impl(&dword_25631F000, v22, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "request observation without requestIdentifier", "{\"msg%{public}.0s\":\"request observation without requestIdentifier\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }

    uint64_t v20 = _CLLogObjectForCategory_MicroLocation_Default();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 68289539;
      int v26 = 0;
      __int16 v27 = 2082;
      __int16 v28 = "";
      __int16 v29 = 2082;
      char v30 = "assert";
      __int16 v31 = 2081;
      char v32 = "requestId.has_value()";
      _os_log_impl(&dword_25631F000, v20, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"request observation without requestIdentifier\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }
    goto LABEL_20;
  }
  if (!v34) {
    std::__throw_bad_optional_access[abi:ne180100]();
  }
  if (!CLMicroLocationLogic::labelObservation((CLMicroLocationLogic *)((char *)self->logicAdapterImpl.__ptr_.__value_ + 224), v37, v35, v33))
  {
    uint64_t v23 = *MEMORY[0x263F08320];
    char v24 = @"request label single observation failed internally";
    id v16 = [NSDictionary dictionaryWithObjects:&v24 forKeys:&v23 count:1];
    uint64_t v17 = (void *)[objc_alloc(MEMORY[0x263F087E8]) initWithDomain:@"ULLogicDomain" code:13 userInfo:v16];
    [*((id *)self->logicAdapterImpl.__ptr_.__value_ + 374) didCompleteRequest:v13 withError:v17 toConnection:v10];
  }
}

- (void)startUpdatingForConnectionToken:(id)a3 updateConfiguration:(id)a4 requestIdentifier:(id)a5
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v8 = (CLMicroLocationProtobufHelper *)a3;
  id v9 = a4;
  id v10 = a5;
  objc_super v11 = [(ULLogicAdapter *)self environment];
  id v12 = [v11 queue];
  dispatch_assert_queue_V2(v12);

  CLMicroLocationProtobufHelper::boostUuidFromNSUUID(v8, (uint64_t)v22);
  if (!v23)
  {
    -[ULLogicAdapter startUpdatingForConnectionToken:updateConfiguration:requestIdentifier:](&v19);

    abort_report_np();
    __break(1u);
  }
  value = self->logicAdapterImpl.__ptr_.__value_;
  uint64_t v14 = v22[0];
  uint64_t v15 = v22[1];
  int v16 = [v9 isLowLatency];
  *(void *)v25.var0 = v14;
  *(void *)&v25.var0[8] = v15;
  if (CLMicroLocationLogic::startUpdating((CLMicroLocationLogic *)((char *)value + 224), v25, v16))
  {
    uint64_t v17 = 0;
  }
  else
  {
    uint64_t v20 = *MEMORY[0x263F08320];
    uint64_t v21 = @"start updating failed internally";
    id v18 = [NSDictionary dictionaryWithObjects:&v21 forKeys:&v20 count:1];
    uint64_t v17 = (void *)[objc_alloc(MEMORY[0x263F087E8]) initWithDomain:@"ULLogicDomain" code:16 userInfo:v18];
  }
  [*((id *)self->logicAdapterImpl.__ptr_.__value_ + 374) didCompleteRequest:v10 withError:v17 toConnection:v8];
}

- (void)stopUpdatingForConnectionToken:(id)a3 requestIdentifier:(id)a4
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v6 = (CLMicroLocationProtobufHelper *)a3;
  id v7 = a4;
  CLMicroLocationProtobufHelper::boostUuidFromNSUUID(v6, (uint64_t)&v13);
  if (!v14)
  {
    -[ULLogicAdapter stopUpdatingForConnectionToken:requestIdentifier:](&v10);

    abort_report_np();
    __break(1u);
  }
  if (CLMicroLocationLogic::stopUpdating((CLMicroLocationLogic *)((char *)self->logicAdapterImpl.__ptr_.__value_ + 224), &v13))
  {
    id v8 = 0;
  }
  else
  {
    uint64_t v11 = *MEMORY[0x263F08320];
    id v12 = @"stop updating failed internally";
    id v9 = [NSDictionary dictionaryWithObjects:&v12 forKeys:&v11 count:1];
    id v8 = (void *)[objc_alloc(MEMORY[0x263F087E8]) initWithDomain:@"ULLogicDomain" code:17 userInfo:v9];
  }
  [*((id *)self->logicAdapterImpl.__ptr_.__value_ + 374) didCompleteRequest:v7 withError:v8 toConnection:v6];
}

- (void)createCustomLoiAtCurrentLocationForConnectionToken:(id)a3 withConfiguration:(id)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v6 = (CLMicroLocationProtobufHelper *)a3;
  id v7 = a4;
  if (onceToken_MicroLocation_Default != -1) {
    dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_903);
  }
  id v8 = logObject_MicroLocation_Default;
  if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    uint64_t v17 = v6;
    __int16 v18 = 2112;
    id v19 = v7;
    _os_log_impl(&dword_25631F000, v8, OS_LOG_TYPE_DEFAULT, "createCustomLoiAtCurrentLocationForConnectionToken: %@ withConfiguration: %@", buf, 0x16u);
  }
  id v9 = [(ULLogicAdapter *)self environment];
  id v10 = [v9 queue];
  dispatch_assert_queue_V2(v10);

  CLMicroLocationProtobufHelper::boostUuidFromNSUUID(v6, (uint64_t)buf);
  if (!BYTE2(v19))
  {
    -[ULLogicAdapter createCustomLoiAtCurrentLocationForConnectionToken:withConfiguration:](&v13);

    abort_report_np();
    __break(1u);
  }
  if ((CLMicroLocationLogic::createCustomLoiAtCurrentLocation((uint64_t)self->logicAdapterImpl.__ptr_.__value_ + 224, (const uuid *)buf, v7) & 1) == 0)
  {
    uint64_t v14 = *MEMORY[0x263F08320];
    uint64_t v15 = @"Enable MicroLocation at current location failed";
    uint64_t v11 = [NSDictionary dictionaryWithObjects:&v15 forKeys:&v14 count:1];
    id v12 = (void *)[objc_alloc(MEMORY[0x263F087E8]) initWithDomain:@"ULLogicDomain" code:34 userInfo:v11];
    [*((id *)self->logicAdapterImpl.__ptr_.__value_ + 374) didCreateCustomLoiAtCurrentLocationWithError:v12 forConnection:v6];
  }
}

- (void)removeCustomLoiWithIdentifier:(id)a3 forConnectionToken:(id)a4
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = (CLMicroLocationProtobufHelper *)a4;
  if (onceToken_MicroLocation_Default != -1) {
    dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_903);
  }
  id v8 = logObject_MicroLocation_Default;
  if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    *(void *)&uint8_t buf[4] = v6;
    __int16 v17 = 2112;
    __int16 v18 = v7;
    _os_log_impl(&dword_25631F000, v8, OS_LOG_TYPE_DEFAULT, "removeCustomLoiWithIdentifier: %@, forConnectionToken: %@", buf, 0x16u);
  }
  id v9 = [(ULLogicAdapter *)self environment];
  id v10 = [v9 queue];
  dispatch_assert_queue_V2(v10);

  CLMicroLocationProtobufHelper::boostUuidFromNSUUID(v7, (uint64_t)&v22);
  if (!v23)
  {
    -[ULLogicAdapter removeCustomLoiWithIdentifier:forConnectionToken:](buf);

    abort_report_np();
    goto LABEL_17;
  }
  id v11 = v6;
  std::string::basic_string[abi:ne180100]<0>(buf, (char *)[v11 UTF8String]);
  CLMicroLocationProtobufHelper::uuidFromStdString((uint64_t)buf, (uint64_t)&v20);
  if (v19 < 0) {
    operator delete(*(void **)buf);
  }
  if (!v21)
  {
    -[ULLogicAdapter removeCustomLoiWithIdentifier:forConnectionToken:](buf);

    abort_report_np();
LABEL_17:
    __break(1u);
  }
  if (!v23) {
    std::__throw_bad_optional_access[abi:ne180100]();
  }
  if (CLMicroLocationLogic::removeCustomLoiWithIdentifier((CLMicroLocationLogic *)((char *)self->logicAdapterImpl.__ptr_.__value_ + 224), &v20, v22))
  {
    id v12 = 0;
  }
  else
  {
    uint64_t v14 = *MEMORY[0x263F08320];
    uint64_t v15 = @"Remove Custom Loi failed";
    id v13 = [NSDictionary dictionaryWithObjects:&v15 forKeys:&v14 count:1];
    id v12 = (void *)[objc_alloc(MEMORY[0x263F087E8]) initWithDomain:@"ULLogicDomain" code:0 userInfo:v13];
  }
  [*((id *)self->logicAdapterImpl.__ptr_.__value_ + 374) didRemoveCustomLoiWithIdentifier:v11 forConnection:v7 withError:v12];
}

- (void)removePendingConnectionRequestsByConnectionToken:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = (CLMicroLocationProtobufHelper *)a3;
  if (onceToken_MicroLocation_Default != -1) {
    dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_903);
  }
  char v5 = logObject_MicroLocation_Default;
  if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf.var0 = 138412290;
    *(void *)&buf.var0[4] = v4;
    _os_log_impl(&dword_25631F000, v5, OS_LOG_TYPE_DEFAULT, "remove pending connection requests by ConnectionToken: %@", buf.var0, 0xCu);
  }
  id v6 = [(ULLogicAdapter *)self environment];
  id v7 = [v6 queue];
  dispatch_assert_queue_V2(v7);

  CLMicroLocationProtobufHelper::boostUuidFromNSUUID(v4, (uint64_t)&buf);
  if (!v10)
  {
    -[ULLogicAdapter removePendingConnectionRequestsByConnectionToken:](&v8);

    abort_report_np();
    __break(1u);
  }
  CLMicroLocationLogic::removePendingConnectionRequestsByConnectionToken((CLMicroLocationLogic *)((char *)self->logicAdapterImpl.__ptr_.__value_ + 224), buf);
}

- (id)exportDatabase
{
  v11[1] = *MEMORY[0x263EF8340];
  objc_super v3 = objc_opt_new();
  id v4 = ULDatabase::exportDatabase((ULDatabase *)((char *)self->logicAdapterImpl.__ptr_.__value_ + 40));
  [v3 setExportedURLs:v4];

  char v5 = [v3 exportedURLs];
  uint64_t v6 = [v5 count];

  if (!v6)
  {
    uint64_t v10 = *MEMORY[0x263F08320];
    v11[0] = @"export database failed internally";
    id v7 = [NSDictionary dictionaryWithObjects:v11 forKeys:&v10 count:1];
    id v8 = (void *)[objc_alloc(MEMORY[0x263F087E8]) initWithDomain:@"ULLogicDomain" code:36 userInfo:v7];
    [v3 setError:v8];
  }
  return v3;
}

- (id)purgeDatabase
{
  v6[1] = *MEMORY[0x263EF8340];
  if ([(ULLogicAdapter *)self purgeMicroLocationData])
  {
    uint64_t v2 = 0;
  }
  else
  {
    uint64_t v5 = *MEMORY[0x263F08320];
    v6[0] = @"purge database failed internally";
    objc_super v3 = [NSDictionary dictionaryWithObjects:v6 forKeys:&v5 count:1];
    uint64_t v2 = (void *)[objc_alloc(MEMORY[0x263F087E8]) initWithDomain:@"ULLogicDomain" code:37 userInfo:v3];
  }
  return v2;
}

- (void)requestModelLearningForConnectionToken:(id)a3 requestIdentifier:(id)a4
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  uint64_t v6 = (CLMicroLocationProtobufHelper *)a3;
  id v7 = (CLMicroLocationProtobufHelper *)a4;
  CLMicroLocationProtobufHelper::boostUuidFromNSUUID(v6, (uint64_t)v13);
  if (!v14)
  {
    -[ULLogicAdapter requestModelLearningForConnectionToken:requestIdentifier:](__p);

    abort_report_np();
    goto LABEL_10;
  }
  CLMicroLocationProtobufHelper::boostUuidFromNSUUID(v7, (uint64_t)&v11);
  if (!v12)
  {
    -[ULLogicAdapter requestModelLearningForConnectionToken:requestIdentifier:](__p);

    abort_report_np();
LABEL_10:
    __break(1u);
  }
  value = self->logicAdapterImpl.__ptr_.__value_;
  __p[0] = 0;
  __p[1] = 0;
  uint64_t v10 = 0;
  if (!v14) {
    std::__throw_bad_optional_access[abi:ne180100]();
  }
  CLMicroLocationLogic::requestMicroLocationLearning((uint64_t)value + 224, (uint64_t)__p, v13[0], v13[1], &v11);
  if (SHIBYTE(v10) < 0) {
    operator delete(__p[0]);
  }
}

- (id)getRecordingTriggerUUIDAndRequestMicroLocationRecordingScanWithAdditionalInformation:(id)a3 shouldForceRecording:(BOOL)a4 handler:(id)a5 clientId:(id)a6
{
  BOOL v8 = a4;
  uint64_t v32 = *MEMORY[0x263EF8340];
  uint64_t v10 = (NSDictionary *)a3;
  id v11 = a5;
  id v12 = a6;
  if (onceToken_MicroLocation_Default != -1) {
    dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_903);
  }
  id v13 = (id)logObject_MicroLocation_Default;
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    char v14 = [NSNumber numberWithBool:v8];
    *(_DWORD *)uuid buf = 138412546;
    *(void *)&uint8_t buf[4] = v12;
    __int16 v29 = 2112;
    char v30 = v14;
    _os_log_impl(&dword_25631F000, v13, OS_LOG_TYPE_DEFAULT, "received recording scan request, clientId: %@, forced: %@", buf, 0x16u);
  }
  if (CLMicroLocationLegacyClient::isHomeKitRequest((CLMicroLocationLegacyClient *)((char *)self->logicAdapterImpl.__ptr_.__value_ + 2848), v10))
  {
    uint64_t v15 = (void *)[objc_alloc(MEMORY[0x263EFF9A0]) initWithDictionary:v10 copyItems:1];
    [v15 setObject:&unk_2704F23A0 forKeyedSubscript:@"shouldTriggerRecordingScan"];
    value = self->logicAdapterImpl.__ptr_.__value_;
    *(void *)uuid buf = cl::chrono::CFAbsoluteTimeClock::now();
    LOBYTE(value) = CLMicroLocationLegacyClient::onHomeKit((CLMicroLocationLegacyClient *)((char *)value + 2848), v15, (double *)buf);

    if ((value & 1) == 0)
    {
LABEL_7:
      id v17 = objc_alloc(MEMORY[0x263F087E8]);
      uint64_t v26 = *MEMORY[0x263F08320];
      __int16 v18 = [NSString stringWithFormat:@"requestMicroLocationRecordingScan failed internally, MiLo is not at right state"];
      __int16 v27 = v18;
      char v19 = [NSDictionary dictionaryWithObjects:&v27 forKeys:&v26 count:1];
      uuid v20 = (void *)[v17 initWithDomain:@"ULLogicDomain" code:39 userInfo:v19];

      goto LABEL_11;
    }
  }
  else
  {
    char v21 = self->logicAdapterImpl.__ptr_.__value_;
    std::string::basic_string[abi:ne180100]<0>(buf, (char *)[v12 UTF8String]);
    CFAbsoluteTime v25 = cl::chrono::CFAbsoluteTimeClock::now();
    char v22 = CLMicroLocationLegacyClient::onRecordingRequest((CLMicroLocationLegacyClient *)((char *)v21 + 2848), (uint64_t)buf, v10, &v25);
    char v23 = v22;
    if (v31 < 0)
    {
      operator delete(*(void **)buf);
      if ((v23 & 1) == 0) {
        goto LABEL_7;
      }
    }
    else if ((v22 & 1) == 0)
    {
      goto LABEL_7;
    }
  }
  uuid v20 = 0;
LABEL_11:

  return v20;
}

- (id)donateMicroLocationTruthTagWithTagUUID:(id)a3 correspondingToTriggerUUID:(id)a4 handler:(id)a5 clientId:(id)a6
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  uint64_t v10 = (CLMicroLocationProtobufHelper *)a3;
  id v11 = (CLMicroLocationProtobufHelper *)a4;
  id v12 = a5;
  id v13 = a6;
  std::string::basic_string[abi:ne180100]<0>(__p, (char *)[v13 UTF8String]);
  CLMicroLocationProtobufHelper::boostUuidFromNSUUID(v10, (uint64_t)v24);
  CLMicroLocationProtobufHelper::boostUuidFromNSUUID(v11, (uint64_t)v22);
  if (!v25 || !v23) {
    std::__throw_bad_optional_access[abi:ne180100]();
  }
  if (CLMicroLocationLegacyClient::donateTruthTagLabel((uint64_t)self->logicAdapterImpl.__ptr_.__value_ + 2848, (uint64_t)__p, v24, v22))
  {
    char v14 = 0;
  }
  else
  {
    id v15 = objc_alloc(MEMORY[0x263F087E8]);
    uint64_t v20 = *MEMORY[0x263F08320];
    char v21 = @"donateTruthTagLabelForClient failed internally";
    int v16 = [NSDictionary dictionaryWithObjects:&v21 forKeys:&v20 count:1];
    char v14 = (void *)[v15 initWithDomain:@"ULLogicDomain" code:40 userInfo:v16];
  }
  if (v19 < 0) {
    operator delete(__p[0]);
  }

  return v14;
}

- (id)donateMicroLocationTruthTagWithTagUUID:(id)a3 forRecordingEventsBetweenDate:(id)a4 andDate:(id)a5 handler:(id)a6 clientId:(id)a7
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v12 = (CLMicroLocationProtobufHelper *)a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  std::string::basic_string[abi:ne180100]<0>(__p, (char *)[v16 UTF8String]);
  CLMicroLocationProtobufHelper::boostUuidFromNSUUID(v12, (uint64_t)v25);
  if (!v25[16]) {
    std::__throw_bad_optional_access[abi:ne180100]();
  }
  if (CLMicroLocationLegacyClient::donateTruthTagLabelForRecordingEventsBetweenDates((uint64_t)self->logicAdapterImpl.__ptr_.__value_ + 2848, (uint64_t)__p, (uint64_t)v25, v13, v14))
  {
    id v17 = 0;
  }
  else
  {
    id v18 = objc_alloc(MEMORY[0x263F087E8]);
    uint64_t v23 = *MEMORY[0x263F08320];
    uint64_t v24 = @"donateTruthTagLabelForClient failed internally";
    char v19 = [NSDictionary dictionaryWithObjects:&v24 forKeys:&v23 count:1];
    id v17 = (void *)[v18 initWithDomain:@"ULLogicDomain" code:40 userInfo:v19];
  }
  if (v22 < 0) {
    operator delete(__p[0]);
  }

  return v17;
}

- (void)requestCurrentMicroLocationWithAdditionalInformation:(id)a3 clientId:(id)a4
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  uint64_t v6 = (NSDictionary *)a3;
  id v7 = a4;
  if (onceToken_MicroLocation_Default != -1) {
    dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_903);
  }
  BOOL v8 = logObject_MicroLocation_Default;
  if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf.__r_.__value_.__l.__data_) = 138412290;
    *(std::string::size_type *)((char *)buf.__r_.__value_.__r.__words + 4) = (std::string::size_type)v7;
    _os_log_impl(&dword_25631F000, v8, OS_LOG_TYPE_DEFAULT, "Client request Current microlocation, clientIdentifier: %@", (uint8_t *)&buf, 0xCu);
  }
  id v9 = v7;
  std::string::basic_string[abi:ne180100]<0>(&buf, (char *)[v9 UTF8String]);
  if (CLMicroLocationLegacyClient::isHomeKitRequest((CLMicroLocationLegacyClient *)((char *)self->logicAdapterImpl.__ptr_.__value_ + 2848), v6))
  {
    uint64_t v10 = (void *)[objc_alloc(MEMORY[0x263EFF9A0]) initWithDictionary:v6 copyItems:1];
    [v10 setObject:&unk_2704F23A0 forKeyedSubscript:@"shouldTriggerLocalizationScan"];
    value = self->logicAdapterImpl.__ptr_.__value_;
    CFAbsoluteTime v13 = cl::chrono::CFAbsoluteTimeClock::now();
    CLMicroLocationLegacyClient::onHomeKit((CLMicroLocationLegacyClient *)((char *)value + 2848), v10, &v13);
  }
  else
  {
    id v12 = self->logicAdapterImpl.__ptr_.__value_;
    CFAbsoluteTime v13 = cl::chrono::CFAbsoluteTimeClock::now();
    CLMicroLocationLegacyClient::onLocalizationRequest((CLMicroLocationLegacyClient *)((char *)v12 + 2848), &buf, &v13);
  }
  if (SHIBYTE(buf.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(buf.__r_.__value_.__l.__data_);
  }
}

- (void)requestMicroLocationRecordingScanWithAdditionalInformation:(id)a3 clientId:(id)a4
{
  uint64_t v6 = (NSDictionary *)a3;
  id v7 = a4;
  std::string::basic_string[abi:ne180100]<0>(__p, (char *)[v7 UTF8String]);
  if (CLMicroLocationLegacyClient::isHomeKitRequest((CLMicroLocationLegacyClient *)((char *)self->logicAdapterImpl.__ptr_.__value_ + 2848), v6))
  {
    BOOL v8 = (void *)[objc_alloc(MEMORY[0x263EFF9A0]) initWithDictionary:v6 copyItems:1];
    [v8 setObject:&unk_2704F23A0 forKeyedSubscript:@"shouldTriggerRecordingScan"];
    value = self->logicAdapterImpl.__ptr_.__value_;
    CFAbsoluteTime v11 = cl::chrono::CFAbsoluteTimeClock::now();
    CLMicroLocationLegacyClient::onHomeKit((CLMicroLocationLegacyClient *)((char *)value + 2848), v8, &v11);
  }
  else
  {
    uint64_t v10 = self->logicAdapterImpl.__ptr_.__value_;
    CFAbsoluteTime v11 = cl::chrono::CFAbsoluteTimeClock::now();
    CLMicroLocationLegacyClient::onRecordingRequest((CLMicroLocationLegacyClient *)((char *)v10 + 2848), (uint64_t)__p, v6, &v11);
  }
  if (v13 < 0) {
    operator delete(__p[0]);
  }
}

- (id)getMicroLocationInternalVersion
{
  uint64_t v2 = NSString;
  ULSettings::get<ULSettings::Version>((uint64_t)__p);
  if (v7 >= 0) {
    objc_super v3 = __p;
  }
  else {
    objc_super v3 = (void **)__p[0];
  }
  id v4 = [v2 stringWithUTF8String:v3];
  if (v7 < 0) {
    operator delete(__p[0]);
  }
  return v4;
}

- (void)startRapportSession
{
  id v7 = [(ULLogicAdapter *)self environment];
  objc_super v3 = [v7 rapportMonitor];
  id v4 = +[ULEvent eventName];
  [v3 addObserver:self selector:sel__handleULRapportMonitorEventIdentities_ eventName:v4];

  id v8 = [(ULLogicAdapter *)self environment];
  uint64_t v5 = [v8 rapportMonitor];
  uint64_t v6 = +[ULEvent eventName];
  [v5 addObserver:self selector:sel__handleULRapportMonitorEventDeviceFound_ eventName:v6];
}

- (void)stopRapportSession
{
  id v4 = [(ULLogicAdapter *)self environment];
  objc_super v3 = [v4 rapportMonitor];
  [v3 removeObserver:self];
}

- (BOOL)isDataAvailable
{
  uint64_t v2 = [(ULLogicAdapter *)self environment];
  objc_super v3 = [v2 dataProtectionMonitor];
  char v4 = [v3 isDataAvailable];

  return v4;
}

- (void)_start
{
  [(ULLogicAdapter *)self _registerOnDatabaseValidNotification];
  [(ULLogicAdapter *)self _startMonitoringEvents];
  objc_super v3 = [(ULLogicAdapter *)self environment];
  char v4 = [v3 diagnostics];
  [v4 addProvider:self];

  [(ULLogicAdapter *)self _startSensors];
  [(ULLogicAdapter *)self _registerOrUnregisterForActivities:1];
}

- (void)_registerOnDatabaseValidNotification
{
  uint64_t v2 = (void *)((char *)self->logicAdapterImpl.__ptr_.__value_ + 40);
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __54__ULLogicAdapter__registerOnDatabaseValidNotification__block_invoke;
  v3[3] = &unk_2653F97F8;
  v3[4] = self;
  ULDatabase::registerDatabaseValidCallback(v2, v3);
}

void __54__ULLogicAdapter__registerOnDatabaseValidNotification__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) environment];
  objc_super v3 = [v2 queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __54__ULLogicAdapter__registerOnDatabaseValidNotification__block_invoke_2;
  block[3] = &unk_2653F97F8;
  block[4] = *(void *)(a1 + 32);
  dispatch_async(v3, block);
}

uint64_t __54__ULLogicAdapter__registerOnDatabaseValidNotification__block_invoke_2(uint64_t a1)
{
  if (onceToken_MicroLocation_Default != -1) {
    dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_903);
  }
  uint64_t v2 = logObject_MicroLocation_Default;
  if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)char v4 = 0;
    _os_log_impl(&dword_25631F000, v2, OS_LOG_TYPE_DEFAULT, "handling database valid notification", v4, 2u);
  }
  CLMicroLocationLogic::onDatabaseBecameValid((CLMicroLocationLogic *)(*(void *)(*(void *)(a1 + 32) + 8) + 224));
  CLMicroLocationLegacyClient::databaseAvailable((CLMicroLocationLegacyClient *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                               + 2848));
  return notify_post((const char *)[(id)*MEMORY[0x263F55800] UTF8String]);
}

- (void)_stop
{
  [(ULLogicAdapter *)self _stopMonitoringEvents];
  [(ULLogicAdapter *)self _registerOrUnregisterForActivities:0];
  id v4 = [(ULLogicAdapter *)self environment];
  objc_super v3 = [v4 diagnostics];
  [v3 removeProvider:self];
}

- (void)_startMonitoringEvents
{
  objc_super v3 = [(ULLogicAdapter *)self environment];
  id v4 = [v3 dataProtectionMonitor];
  uint64_t v5 = +[ULEvent eventName];
  [v4 addObserver:self selector:sel__handleULDataProtectionMonitorEventDataAvailable_ eventName:v5];

  uint64_t v6 = [(ULLogicAdapter *)self environment];
  id v7 = [v6 airplaneModeMonitor];
  id v8 = +[ULEvent eventName];
  [v7 addObserver:self selector:sel__handleULAirplaneModeMonitorEventAirplaneMode_ eventName:v8];

  id v9 = [(ULLogicAdapter *)self environment];
  uint64_t v10 = [v9 batteryModeMonitor];
  CFAbsoluteTime v11 = +[ULEvent eventName];
  [v10 addObserver:self selector:sel__handleULBatteryModeMonitorEventUnlimitedPower_ eventName:v11];

  id v12 = [(ULLogicAdapter *)self environment];
  char v13 = [v12 batteryModeMonitor];
  id v14 = +[ULEvent eventName];
  [v13 addObserver:self selector:sel__handleULBatteryModeMonitorEventLowPowerMode_ eventName:v14];

  uint64_t v15 = [(ULLogicAdapter *)self environment];
  id v16 = [v15 bluetoothMonitor];
  id v17 = +[ULEvent eventName];
  [v16 addObserver:self selector:sel__handleULBluetoothMonitorEventPowerOn_ eventName:v17];

  id v18 = [(ULLogicAdapter *)self environment];
  char v19 = [v18 displayMonitor];
  uint64_t v20 = +[ULEvent eventName];
  [v19 addObserver:self selector:sel__handleULDisplayMonitorEventDisplayState_ eventName:v20];

  char v21 = [(ULLogicAdapter *)self environment];
  char v22 = objc_msgSend(v21, "displayMonitor_OSX");
  uint64_t v23 = +[ULEvent eventName];
  [v22 addObserver:self selector:sel__handleULDisplayMonitorEventDisplayState_OSX_ eventName:v23];

  uint64_t v24 = [(ULLogicAdapter *)self environment];
  char v25 = [v24 internalNotifyMonitor];
  uint64_t v26 = +[ULEvent eventName];
  [v25 addObserver:self selector:sel__handleULInternalNotifyMonitorEventLocalize_ eventName:v26];

  __int16 v27 = [(ULLogicAdapter *)self environment];
  __int16 v28 = [v27 internalNotifyMonitor];
  __int16 v29 = +[ULEvent eventName];
  [v28 addObserver:self selector:sel__handleULInternalNotifyMonitorEventRecord_ eventName:v29];

  char v30 = [(ULLogicAdapter *)self environment];
  char v31 = [v30 internalNotifyMonitor];
  uint64_t v32 = +[ULEvent eventName];
  [v31 addObserver:self selector:sel__handleULInternalNotifyMonitorEventPurge_ eventName:v32];

  uuid v33 = [(ULLogicAdapter *)self environment];
  char v34 = [v33 internalNotifyMonitor];
  uuid v35 = +[ULEvent eventName];
  [v34 addObserver:self selector:sel__handleULInternalNotifyMonitorEventSettingsRefrsh_ eventName:v35];

  char v36 = [(ULLogicAdapter *)self environment];
  uuid v37 = [v36 privacyMonitor];
  char v38 = +[ULEvent eventName];
  [v37 addObserver:self selector:sel__handleULPrivacyMonitorEventLocationServices_ eventName:v38];

  uint64_t v39 = [(ULLogicAdapter *)self environment];
  v40 = [v39 buddyMonitor];
  char v41 = +[ULEvent eventName];
  [v40 addObserver:self selector:sel__handleULBuddyMonitorEventBuddyComplete_ eventName:v41];

  if (ULSettings::get<ULSettings::OffScreenScanEnabled>())
  {
    uint64_t v42 = [(ULLogicAdapter *)self environment];
    v43 = [v42 sleepWakeMonitor];
    long long v44 = +[ULEvent eventName];
    [v43 addObserver:self selector:sel__handleULSleepWakeMonitorEvent_ eventName:v44];

    std::string::value_type v45 = +[ULHomeSlamAnalytics shared];
    [v45 logEventSleepStateRegisterAtTimestamp:cl::chrono::CFAbsoluteTimeClock::now()];

    v46 = (CLMicroLocationLogic *)((char *)self->logicAdapterImpl.__ptr_.__value_ + 224);
    CLMicroLocationLogic::setAPWakeState(v46, 1);
  }
}

- (void)_stopMonitoringEvents
{
  id v12 = [(ULLogicAdapter *)self environment];
  objc_super v3 = [v12 dataProtectionMonitor];
  [v3 removeObserver:self];

  id v13 = [(ULLogicAdapter *)self environment];
  id v4 = [v13 airplaneModeMonitor];
  [v4 removeObserver:self];

  id v14 = [(ULLogicAdapter *)self environment];
  uint64_t v5 = [v14 batteryModeMonitor];
  [v5 removeObserver:self];

  id v15 = [(ULLogicAdapter *)self environment];
  uint64_t v6 = [v15 bluetoothMonitor];
  [v6 removeObserver:self];

  id v16 = [(ULLogicAdapter *)self environment];
  id v7 = [v16 displayMonitor];
  [v7 removeObserver:self];

  id v17 = [(ULLogicAdapter *)self environment];
  id v8 = objc_msgSend(v17, "displayMonitor_OSX");
  [v8 removeObserver:self];

  id v18 = [(ULLogicAdapter *)self environment];
  id v9 = [v18 internalNotifyMonitor];
  [v9 removeObserver:self];

  id v19 = [(ULLogicAdapter *)self environment];
  uint64_t v10 = [v19 privacyMonitor];
  [v10 removeObserver:self];

  id v20 = [(ULLogicAdapter *)self environment];
  CFAbsoluteTime v11 = [v20 buddyMonitor];
  [v11 removeObserver:self];
}

- (void)_registerOrUnregisterForActivities:(BOOL)a3
{
  id v4 = +[ULBGRepeatingSystemTaskRequest learningULBGRepeatingSystemTaskRequest];
  -[ULLogicAdapter _registerOrUnregisterForBackgroundTaskWithRequest:withSelector:requiresMiLoEnabled:isRegister:](self, "_registerOrUnregisterForBackgroundTaskWithRequest:withSelector:requiresMiLoEnabled:isRegister:");

  id v5 = +[ULBGRepeatingSystemTaskRequest maintenanceULBGRepeatingSystemTaskRequest];
  -[ULLogicAdapter _registerOrUnregisterForBackgroundTaskWithRequest:withSelector:requiresMiLoEnabled:isRegister:](self, "_registerOrUnregisterForBackgroundTaskWithRequest:withSelector:requiresMiLoEnabled:isRegister:");

  id v6 = +[ULBGRepeatingSystemTaskRequest routineStateAnalyzerULBGRepeatingSystemTaskRequest];
  -[ULLogicAdapter _registerOrUnregisterForBackgroundTaskWithRequest:withSelector:requiresMiLoEnabled:isRegister:](self, "_registerOrUnregisterForBackgroundTaskWithRequest:withSelector:requiresMiLoEnabled:isRegister:");

  id v7 = +[ULBGRepeatingSystemTaskRequest analyticsULBGRepeatingSystemTaskRequest];
  -[ULLogicAdapter _registerOrUnregisterForBackgroundTaskWithRequest:withSelector:requiresMiLoEnabled:isRegister:](self, "_registerOrUnregisterForBackgroundTaskWithRequest:withSelector:requiresMiLoEnabled:isRegister:");

  id v8 = +[ULBGRepeatingSystemTaskRequest wifiAnalyzerULBGRepeatingSystemTaskRequest];
  -[ULLogicAdapter _registerOrUnregisterForBackgroundTaskWithRequest:withSelector:requiresMiLoEnabled:isRegister:](self, "_registerOrUnregisterForBackgroundTaskWithRequest:withSelector:requiresMiLoEnabled:isRegister:");

  id v9 = +[ULBGRepeatingSystemTaskRequest exportBackupULBGRepeatingSystemTaskRequest];
  -[ULLogicAdapter _registerOrUnregisterForBackgroundTaskWithRequest:withSelector:requiresMiLoEnabled:isRegister:](self, "_registerOrUnregisterForBackgroundTaskWithRequest:withSelector:requiresMiLoEnabled:isRegister:");
}

- (void)_registerOrUnregisterForBackgroundTaskWithRequest:(id)a3 withSelector:(SEL)a4 requiresMiLoEnabled:(BOOL)a5 isRegister:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v10 = a3;
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    id v18 = _CLLogObjectForCategory_MicroLocation_Default();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
    {
      NSStringFromSelector(a4);
      id v19 = objc_claimAutoreleasedReturnValue();
      id location = (id)68289795;
      __int16 v30 = 2082;
      char v31 = "";
      __int16 v32 = 2082;
      uint64_t v33 = [v19 UTF8String];
      __int16 v34 = 2082;
      uuid v35 = "assert";
      __int16 v36 = 2081;
      uuid v37 = "[self respondsToSelector:selector]";
      _os_log_impl(&dword_25631F000, v18, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"ULLogicAdapter does not respond to selector\", \"selector\":%{public, location:escape_only}s, \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", (uint8_t *)&location, 0x30u);
    }
    id v20 = _CLLogObjectForCategory_MicroLocation_Default();
    if (os_signpost_enabled(v20))
    {
      NSStringFromSelector(a4);
      id v21 = objc_claimAutoreleasedReturnValue();
      uint64_t v22 = [v21 UTF8String];
      id location = (id)68289795;
      __int16 v30 = 2082;
      char v31 = "";
      __int16 v32 = 2082;
      uint64_t v33 = v22;
      __int16 v34 = 2082;
      uuid v35 = "assert";
      __int16 v36 = 2081;
      uuid v37 = "[self respondsToSelector:selector]";
      _os_signpost_emit_with_name_impl(&dword_25631F000, v20, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "ULLogicAdapter does not respond to selector", "{\"msg%{public}.0s\":\"ULLogicAdapter does not respond to selector\", \"selector\":%{public, location:escape_only}s, \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", (uint8_t *)&location, 0x30u);
    }
    uint64_t v23 = _CLLogObjectForCategory_MicroLocation_Default();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      NSStringFromSelector(a4);
      id v24 = objc_claimAutoreleasedReturnValue();
      -[ULLogicAdapter _registerOrUnregisterForBackgroundTaskWithRequest:withSelector:requiresMiLoEnabled:isRegister:]([v24 UTF8String], (uint8_t *)&location, v23, v24);
    }

    abort_report_np();
    __break(1u);
  }
  if (v6)
  {
    objc_initWeak(&location, self);
    CFAbsoluteTime v11 = [(ULLogicAdapter *)self environment];
    id v12 = [v11 backgroundSystemTaskManager];
    id v13 = [(ULLogicAdapter *)self environment];
    id v14 = [v13 queue];
    v25[0] = MEMORY[0x263EF8330];
    v25[1] = 3221225472;
    v25[2] = __112__ULLogicAdapter__registerOrUnregisterForBackgroundTaskWithRequest_withSelector_requiresMiLoEnabled_isRegister___block_invoke;
    v25[3] = &unk_2653FA320;
    objc_copyWeak(v27, &location);
    BOOL v28 = a5;
    id v26 = v10;
    v27[1] = (id)a4;
    [v12 registerAndSubmitTaskWithRequest:v26 usingQueue:v14 launchHandler:v25];

    objc_destroyWeak(v27);
    objc_destroyWeak(&location);
  }
  else
  {
    id v15 = [(ULLogicAdapter *)self environment];
    id v16 = [v15 backgroundSystemTaskManager];
    id v17 = [v10 identifier];
    [v16 deregisterAndCancelTaskWithIdentifier:v17];
  }
}

void __112__ULLogicAdapter__registerOrUnregisterForBackgroundTaskWithRequest_withSelector_requiresMiLoEnabled_isRegister___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v5 = WeakRetained;
  if (WeakRetained)
  {
    BOOL v6 = [WeakRetained environment];
    id v7 = [v6 queue];
    dispatch_assert_queue_V2(v7);

    if (*(unsigned char *)(a1 + 56) && (CLMicroLocationLogic::enabled((CLMicroLocationLogic *)(v5[1] + 224)) & 1) == 0)
    {
      if (onceToken_MicroLocation_Default != -1) {
        dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_903);
      }
      id v10 = (id)logObject_MicroLocation_Default;
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        CFAbsoluteTime v11 = [*(id *)(a1 + 32) identifier];
        *(_DWORD *)std::string buf = 138412290;
        id v16 = v11;
        _os_log_impl(&dword_25631F000, v10, OS_LOG_TYPE_INFO, "Skipping run of background system task %@ due to Microlocations disabled.", buf, 0xCu);
      }
    }
    else
    {
      id v8 = +[ULTransactionManager shared];
      v12[0] = MEMORY[0x263EF8330];
      v12[1] = 3221225472;
      v12[2] = __112__ULLogicAdapter__registerOrUnregisterForBackgroundTaskWithRequest_withSelector_requiresMiLoEnabled_isRegister___block_invoke_196;
      v12[3] = &unk_2653F97D0;
      uint64_t v9 = *(void *)(a1 + 48);
      v12[4] = v5;
      uint64_t v14 = v9;
      id v13 = v3;
      [v8 performUnderTransaction:@"com.apple.milod.backgroundTasks" block:v12];
    }
  }
}

uint64_t __112__ULLogicAdapter__registerOrUnregisterForBackgroundTaskWithRequest_withSelector_requiresMiLoEnabled_isRegister___block_invoke_196(uint64_t a1)
{
  return [*(id *)(a1 + 32) performSelector:*(void *)(a1 + 48) withObject:*(void *)(a1 + 40)];
}

- (void)_learnExecute:(id)a3
{
  v8[4] = *MEMORY[0x263EF8340];
  id v6 = a3;
  CLMicroLocationLearner::CLMicroLocationLearner(v4, (char *)self->logicAdapterImpl.__ptr_.__value_ + 8, (char *)self->logicAdapterImpl.__ptr_.__value_ + 40);
  v8[0] = &unk_2704E2740;
  v8[1] = &v6;
  v8[3] = v8;
  CLMicroLocationLearner::executeWorkItems(v4, (uint64_t)v8);
  std::__function::__value_func<BOOL ()(void)>::~__value_func[abi:ne180100](v8);
  id v7 = (void **)&v5;
  std::vector<std::function<void ()(std::function<BOOL ()(void)>)>>::__destroy_vector::operator()[abi:ne180100](&v7);
}

- (void)_maintenanceExecute:(id)a3
{
  v8[4] = *MEMORY[0x263EF8340];
  id v6 = a3;
  CLMicroLocationMaintenance::CLMicroLocationMaintenance((CLMicroLocationMaintenance *)&v4, (ULDatabase *)((char *)self->logicAdapterImpl.__ptr_.__value_ + 40));
  v8[0] = &unk_2704E27C0;
  v8[1] = &v6;
  v8[3] = v8;
  CLMicroLocationMaintenance::executeWorkItems(&v4, (uint64_t)v8);
  std::__function::__value_func<BOOL ()(void)>::~__value_func[abi:ne180100](v8);
  id v7 = (void **)&v5;
  std::vector<std::function<void ()(std::function<BOOL ()(void)>)>>::__destroy_vector::operator()[abi:ne180100](&v7);
}

- (void)_routineStateAnalyzerExecute:(id)a3
{
  v8[4] = *MEMORY[0x263EF8340];
  id v6 = a3;
  CLMicroLocationRoutineStateAnalyzer::CLMicroLocationRoutineStateAnalyzer(&v4, (char *)self->logicAdapterImpl.__ptr_.__value_ + 16);
  v8[0] = &unk_2704E2840;
  v8[1] = &v6;
  v8[3] = v8;
  CLMicroLocationRoutineStateAnalyzer::executeWorkItems(&v4, (uint64_t)v8);
  std::__function::__value_func<BOOL ()(void)>::~__value_func[abi:ne180100](v8);
  id v7 = (void **)&v5;
  std::vector<std::function<void ()(std::function<BOOL ()(void)>)>>::__destroy_vector::operator()[abi:ne180100](&v7);
}

- (void)_analyticsExecute:(id)a3
{
  v8[4] = *MEMORY[0x263EF8340];
  id v6 = a3;
  CLMicroLocationAnalytics::CLMicroLocationAnalytics(v4, (char *)self->logicAdapterImpl.__ptr_.__value_ + 24, (char *)self->logicAdapterImpl.__ptr_.__value_ + 40);
  v8[0] = &unk_2704E28C0;
  v8[1] = &v6;
  v8[3] = v8;
  CLMicroLocationAnalytics::executeWorkItems(v4, (uint64_t)v8);
  std::__function::__value_func<BOOL ()(void)>::~__value_func[abi:ne180100](v8);
  id v7 = (void **)&v5;
  std::vector<std::function<void ()(std::function<BOOL ()(void)>)>>::__destroy_vector::operator()[abi:ne180100](&v7);
}

- (void)_wifiAnalyticsExecute:(id)a3
{
  v7[4] = *MEMORY[0x263EF8340];
  id v4 = a3;
  ULWiFiHistogramAnalyzer::ULWiFiHistogramAnalyzer(v6, (uint64_t)self->logicAdapterImpl.__ptr_.__value_ + 32, (uint64_t)self->logicAdapterImpl.__ptr_.__value_ + 40);
  v5[0] = &unk_2704E2940;
  v5[1] = &v4;
  v5[3] = v5;
  ULWiFiHistogramAnalyzer::executeWiFiItem((uint64_t)v6, (uint64_t)v5);
  std::__function::__value_func<BOOL ()(void)>::~__value_func[abi:ne180100](v5);
  std::__function::__value_func<void ()(std::function<BOOL ()(void)>)>::~__value_func[abi:ne180100](v7);
}

- (void)_exportiCloudBackupExecute:(id)a3
{
  v6[4] = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v4 = [[ULBackupAndRestore alloc] initWithDatabase:(char *)self->logicAdapterImpl.__ptr_.__value_ + 40 andEventLogger:(char *)self->logicAdapterImpl.__ptr_.__value_ + 192];
  v6[0] = &unk_2704E29C0;
  v6[1] = &v5;
  v6[3] = v6;
  [(ULBackupAndRestore *)v4 exportiCloudBackupWithCancelFunc:v6];
  std::__function::__value_func<BOOL ()(void)>::~__value_func[abi:ne180100](v6);
}

- (void)_handleULDataProtectionMonitorEventDataAvailable:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  objc_opt_class();
  id v5 = v4;
  if (objc_opt_isKindOfClass()) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }
  id v7 = v6;

  if (onceToken_MicroLocation_Default != -1) {
    dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_903);
  }
  id v8 = (id)logObject_MicroLocation_Default;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = [v7 dataAvailable];
    id v10 = @"NO";
    if (v9) {
      id v10 = @"YES";
    }
    *(_DWORD *)std::string buf = 138412290;
    id v15 = v10;
    _os_log_impl(&dword_25631F000, v8, OS_LOG_TYPE_DEFAULT, "_handleULDataProtectionMonitorEventDataAvailable: dataAvailable: %@", buf, 0xCu);
  }

  if ([v7 dataAvailable])
  {
    CFAbsoluteTime v11 = [(ULLogicAdapter *)self environment];
    id v12 = [v11 queue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __67__ULLogicAdapter__handleULDataProtectionMonitorEventDataAvailable___block_invoke;
    block[3] = &unk_2653F97F8;
    block[4] = self;
    dispatch_async(v12, block);
  }
}

void __67__ULLogicAdapter__handleULDataProtectionMonitorEventDataAvailable___block_invoke(uint64_t a1)
{
}

- (void)_handleULAirplaneModeMonitorEventAirplaneMode:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  objc_opt_class();
  id v5 = v4;
  if (objc_opt_isKindOfClass()) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }
  id v7 = v6;

  if (onceToken_MicroLocation_Default != -1) {
    dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_903);
  }
  id v8 = (id)logObject_MicroLocation_Default;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = [v7 airplaneMode];
    id v10 = @"NO";
    if (v9) {
      id v10 = @"YES";
    }
    *(_DWORD *)std::string buf = 138412290;
    uint64_t v17 = v10;
    _os_log_impl(&dword_25631F000, v8, OS_LOG_TYPE_DEFAULT, "_handleULAirplaneModeMonitorEventAirplaneMode: airplaneMode: %@", buf, 0xCu);
  }

  CFAbsoluteTime v11 = [(ULLogicAdapter *)self environment];
  id v12 = [v11 queue];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __64__ULLogicAdapter__handleULAirplaneModeMonitorEventAirplaneMode___block_invoke;
  v14[3] = &unk_2653FA348;
  v14[4] = self;
  id v15 = v7;
  id v13 = v7;
  dispatch_async(v12, v14);
}

void __64__ULLogicAdapter__handleULAirplaneModeMonitorEventAirplaneMode___block_invoke(uint64_t a1)
{
  CLMicroLocationLegacyClient::setAirplaneMode(*(void *)(*(void *)(a1 + 32) + 8) + 2848, [*(id *)(a1 + 40) airplaneMode]);
  uint64_t v2 = *(void **)(a1 + 40);
  id v3 = (CLMicroLocationLogic *)(*(void *)(*(void *)(a1 + 32) + 8) + 224);
  char v4 = [v2 airplaneMode];
  CLMicroLocationLogic::setAirplaneMode(v3, v4);
}

- (void)_handleULBatteryModeMonitorEventUnlimitedPower:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  objc_opt_class();
  id v5 = v4;
  if (objc_opt_isKindOfClass()) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }
  id v7 = v6;

  if (onceToken_MicroLocation_Default != -1) {
    dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_903);
  }
  id v8 = (id)logObject_MicroLocation_Default;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = [v7 unlimitedPower];
    id v10 = @"NO";
    if (v9) {
      id v10 = @"YES";
    }
    *(_DWORD *)std::string buf = 138412290;
    uint64_t v17 = v10;
    _os_log_impl(&dword_25631F000, v8, OS_LOG_TYPE_DEFAULT, "_handleULBatteryModeMonitorEventUnlimitedPower: unlimitedPower: %@", buf, 0xCu);
  }

  CFAbsoluteTime v11 = [(ULLogicAdapter *)self environment];
  id v12 = [v11 queue];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __65__ULLogicAdapter__handleULBatteryModeMonitorEventUnlimitedPower___block_invoke;
  v14[3] = &unk_2653FA348;
  v14[4] = self;
  id v15 = v7;
  id v13 = v7;
  dispatch_async(v12, v14);
}

uint64_t __65__ULLogicAdapter__handleULBatteryModeMonitorEventUnlimitedPower___block_invoke(uint64_t a1)
{
  uint64_t v2 = (CLMicroLocationLegacyClient *)(*(void *)(*(void *)(a1 + 32) + 8) + 2848);
  char v3 = [*(id *)(a1 + 40) unlimitedPower];
  CFAbsoluteTime v5 = cl::chrono::CFAbsoluteTimeClock::now();
  CLMicroLocationLegacyClient::onBatteryState(v2, v3, &v5);
  return CLMicroLocationLogic::onMacPowerChange((CLMicroLocationLogic *)(*(void *)(*(void *)(a1 + 32) + 8) + 224), [*(id *)(a1 + 40) unlimitedPower]);
}

- (void)_handleULBatteryModeMonitorEventLowPowerMode:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  objc_opt_class();
  id v5 = v4;
  if (objc_opt_isKindOfClass()) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }
  id v7 = v6;

  if (onceToken_MicroLocation_Default != -1) {
    dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_903);
  }
  id v8 = (id)logObject_MicroLocation_Default;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = [v7 lowPowerMode];
    id v10 = @"NO";
    if (v9) {
      id v10 = @"YES";
    }
    *(_DWORD *)std::string buf = 138412290;
    uint64_t v17 = v10;
    _os_log_impl(&dword_25631F000, v8, OS_LOG_TYPE_DEFAULT, "_handleULBatteryModeMonitorEventLowPowerMode: lowPowerMode: %@", buf, 0xCu);
  }

  CFAbsoluteTime v11 = [(ULLogicAdapter *)self environment];
  id v12 = [v11 queue];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __63__ULLogicAdapter__handleULBatteryModeMonitorEventLowPowerMode___block_invoke;
  v14[3] = &unk_2653FA348;
  v14[4] = self;
  id v15 = v7;
  id v13 = v7;
  dispatch_async(v12, v14);
}

void __63__ULLogicAdapter__handleULBatteryModeMonitorEventLowPowerMode___block_invoke(uint64_t a1)
{
  CLMicroLocationLegacyClient::setLowPowerMode(*(void *)(*(void *)(a1 + 32) + 8) + 2848, [*(id *)(a1 + 40) lowPowerMode]);
  uint64_t v2 = *(void **)(a1 + 40);
  char v3 = (CLMicroLocationLogic *)(*(void *)(*(void *)(a1 + 32) + 8) + 224);
  char v4 = [v2 lowPowerMode];
  CLMicroLocationLogic::setPowerMode(v3, v4);
}

- (void)_handleULBluetoothMonitorEventPowerOn:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  objc_opt_class();
  id v5 = v4;
  if (objc_opt_isKindOfClass()) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }
  id v7 = v6;

  if (onceToken_MicroLocation_Default != -1) {
    dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_903);
  }
  id v8 = (id)logObject_MicroLocation_Default;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = [v7 powerOn];
    id v10 = @"NO";
    if (v9) {
      id v10 = @"YES";
    }
    *(_DWORD *)std::string buf = 138412290;
    uint64_t v17 = v10;
    _os_log_impl(&dword_25631F000, v8, OS_LOG_TYPE_DEFAULT, "_handleULBluetoothMonitorEventPowerOn: powerOn: %@", buf, 0xCu);
  }

  CFAbsoluteTime v11 = [(ULLogicAdapter *)self environment];
  id v12 = [v11 queue];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __56__ULLogicAdapter__handleULBluetoothMonitorEventPowerOn___block_invoke;
  v14[3] = &unk_2653FA348;
  v14[4] = self;
  id v15 = v7;
  id v13 = v7;
  dispatch_async(v12, v14);
}

uint64_t __56__ULLogicAdapter__handleULBluetoothMonitorEventPowerOn___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 32) + 8) + 224;
  char v2 = [*(id *)(a1 + 40) powerOn];
  return CLMicroLocationLogic::setBluetoothPower(v1, v2);
}

- (void)_handleULRapportMonitorEventIdentities:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  objc_opt_class();
  id v5 = v4;
  if (objc_opt_isKindOfClass()) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }
  id v7 = v6;

  if (onceToken_MicroLocation_Default != -1) {
    dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_903);
  }
  id v8 = (id)logObject_MicroLocation_Default;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = [v7 identities];
    *(_DWORD *)std::string buf = 138412290;
    uint64_t v17 = v9;
    _os_log_impl(&dword_25631F000, v8, OS_LOG_TYPE_DEFAULT, "_handleULRapportMonitorEventIdentities: identities: %@", buf, 0xCu);
  }
  id v10 = [(ULLogicAdapter *)self environment];
  CFAbsoluteTime v11 = [v10 queue];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  uint64_t v13[2] = __57__ULLogicAdapter__handleULRapportMonitorEventIdentities___block_invoke;
  v13[3] = &unk_2653FA348;
  id v14 = v7;
  id v15 = self;
  id v12 = v7;
  dispatch_async(v11, v13);
}

void __57__ULLogicAdapter__handleULRapportMonitorEventIdentities___block_invoke(uint64_t a1)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  char v2 = [MEMORY[0x263EFF980] array];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  char v3 = objc_msgSend(*(id *)(a1 + 32), "identities", 0);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v16 objects:v26 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v17 != v5) {
          objc_enumerationMutation(v3);
        }
        id v7 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        id v8 = [v7 btAddress];
        if (v8)
        {
          int v9 = [v7 btIRKData];
          BOOL v10 = v9 == 0;

          if (!v10)
          {
            id v11 = objc_alloc_init(MEMORY[0x263EFEF50]);
            id v12 = [v7 btAddress];
            [v11 setBtAddressData:v12];

            id v13 = [v7 btIRKData];
            [v11 setIrkData:v13];

            [v2 addObject:v11];
          }
        }
      }
      uint64_t v4 = [v3 countByEnumeratingWithState:&v16 objects:v26 count:16];
    }
    while (v4);
  }

  if (onceToken_MicroLocation_Default != -1) {
    dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_903);
  }
  id v14 = (id)logObject_MicroLocation_Default;
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    uint64_t v15 = [v2 count];
    *(_DWORD *)std::string buf = 68289282;
    int v21 = 0;
    __int16 v22 = 2082;
    uint64_t v23 = "";
    __int16 v24 = 2050;
    uint64_t v25 = v15;
    _os_log_impl(&dword_25631F000, v14, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"BLE oobkey updated\", \"key array size\":%{public}lu}", buf, 0x1Cu);
  }

  CLMicroLocationLogic::updateBleOobKeys(*(void *)(*(void *)(a1 + 40) + 8) + 224, v2);
}

- (void)_handleULRapportMonitorEventDeviceFound:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  objc_opt_class();
  id v5 = v4;
  if (objc_opt_isKindOfClass()) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }
  id v7 = v6;

  if (onceToken_MicroLocation_Default != -1) {
    dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_903);
  }
  id v8 = (id)logObject_MicroLocation_Default;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = [v7 device];
    *(_DWORD *)std::string buf = 138412290;
    long long v17 = v9;
    _os_log_impl(&dword_25631F000, v8, OS_LOG_TYPE_DEFAULT, "_handleULRapportMonitorEventDeviceFound: new device: %@", buf, 0xCu);
  }
  BOOL v10 = [(ULLogicAdapter *)self environment];
  id v11 = [v10 queue];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  uint64_t v13[2] = __58__ULLogicAdapter__handleULRapportMonitorEventDeviceFound___block_invoke;
  v13[3] = &unk_2653FA348;
  id v14 = v7;
  uint64_t v15 = self;
  id v12 = v7;
  dispatch_async(v11, v13);
}

void __58__ULLogicAdapter__handleULRapportMonitorEventDeviceFound___block_invoke(uint64_t a1)
{
  id v14 = [*(id *)(a1 + 32) device];
  char v2 = [v14 idsDeviceIdentifier];
  if (v2)
  {
    char v3 = [*(id *)(a1 + 32) device];
    id v4 = [v3 model];
    if (v4)
    {
      id v5 = [*(id *)(a1 + 32) device];
      id v6 = [v5 name];

      if (v6)
      {
        uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
        id v8 = [*(id *)(a1 + 32) device];
        id v9 = [v8 idsDeviceIdentifier];
        std::string::basic_string[abi:ne180100]<0>(v19, (char *)[v9 UTF8String]);
        BOOL v10 = [*(id *)(a1 + 32) device];
        id v11 = [v10 model];
        std::string::basic_string[abi:ne180100]<0>(v17, (char *)[v11 UTF8String]);
        id v12 = [*(id *)(a1 + 32) device];
        id v13 = [v12 name];
        std::string::basic_string[abi:ne180100]<0>(__p, (char *)[v13 UTF8String]);
        CLMicroLocationLogic::onRapportCompanionDeviceFound(v7 + 224, (uint64_t)v19, (uint64_t)v17, (long long *)__p);
        if (v16 < 0) {
          operator delete(__p[0]);
        }

        if (v18 < 0) {
          operator delete(v17[0]);
        }

        if (v20 < 0) {
          operator delete(v19[0]);
        }
      }
      return;
    }
  }
}

- (void)_handleULDisplayMonitorEventDisplayState_OSX:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  id v5 = v4;
  if (objc_opt_isKindOfClass()) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }
  id v7 = v6;

  id v8 = [(ULLogicAdapter *)self environment];
  id v9 = [v8 queue];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  void v11[2] = __63__ULLogicAdapter__handleULDisplayMonitorEventDisplayState_OSX___block_invoke;
  v11[3] = &unk_2653FA348;
  id v12 = v7;
  id v13 = self;
  id v10 = v7;
  dispatch_async(v9, v11);
}

void __63__ULLogicAdapter__handleULDisplayMonitorEventDisplayState_OSX___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  if ([*(id *)(a1 + 32) screenOnChanged]) {
    CLMicroLocationLogic::onDisplayStateChange_OSX((CLMicroLocationLogic *)(*(void *)(*(void *)(a1 + 40) + 8) + 224), [*(id *)(a1 + 32) screenOn]);
  }
  if ([*(id *)(a1 + 32) clamshellModeChanged])
  {
    if (onceToken_MicroLocation_Default != -1) {
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_903);
    }
    char v2 = (id)logObject_MicroLocation_Default;
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      int v3 = [*(id *)(a1 + 32) clamshellMode];
      id v4 = @"Off";
      if (v3) {
        id v4 = @"On";
      }
      int v8 = 138412290;
      id v9 = v4;
      _os_log_impl(&dword_25631F000, v2, OS_LOG_TYPE_DEFAULT, "_handleULDisplayMonitorEventDisplayState_OSX: clamshellMode: %@", (uint8_t *)&v8, 0xCu);
    }

    CLMicroLocationLogic::onMacExternalScreenChange((CLMicroLocationLogic *)(*(void *)(*(void *)(a1 + 40) + 8) + 224), [*(id *)(a1 + 32) clamshellMode]);
  }
  if ([*(id *)(a1 + 32) screenLockedChanged])
  {
    if (onceToken_MicroLocation_Default != -1) {
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_903);
    }
    id v5 = (id)logObject_MicroLocation_Default;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = [*(id *)(a1 + 32) screenLocked];
      id v7 = @"Off";
      if (v6) {
        id v7 = @"On";
      }
      int v8 = 138412290;
      id v9 = v7;
      _os_log_impl(&dword_25631F000, v5, OS_LOG_TYPE_DEFAULT, "_handleULDisplayMonitorEventDisplayState_OSX: screenLock: %@", (uint8_t *)&v8, 0xCu);
    }

    CLMicroLocationLogic::setLockScreenState((CLMicroLocationLogic *)(*(void *)(*(void *)(a1 + 40) + 8) + 224), [*(id *)(a1 + 32) screenLocked]);
  }
}

- (void)_handleULInternalNotifyMonitorEventLocalize:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  id v5 = v4;
  objc_opt_isKindOfClass();

  if (onceToken_MicroLocation_Default != -1) {
    dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_903);
  }
  int v6 = logObject_MicroLocation_Default;
  if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)std::string buf = 0;
    _os_log_impl(&dword_25631F000, v6, OS_LOG_TYPE_DEFAULT, "_handleULInternalNotifyMonitorEventLocalize: localize", buf, 2u);
  }
  id v7 = [(ULLogicAdapter *)self environment];
  int v8 = [v7 queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __62__ULLogicAdapter__handleULInternalNotifyMonitorEventLocalize___block_invoke;
  block[3] = &unk_2653F97F8;
  block[4] = self;
  dispatch_async(v8, block);
}

void __62__ULLogicAdapter__handleULInternalNotifyMonitorEventLocalize___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 32) + 8);
  std::string::basic_string[abi:ne180100]<0>(&__p, "NotificationCenter");
  CFAbsoluteTime v2 = cl::chrono::CFAbsoluteTimeClock::now();
  CLMicroLocationLegacyClient::onLocalizationRequest((CLMicroLocationLegacyClient *)(v1 + 2848), &__p, &v2);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
}

- (void)_handleULInternalNotifyMonitorEventRecord:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  id v5 = v4;
  objc_opt_isKindOfClass();

  if (onceToken_MicroLocation_Default != -1) {
    dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_903);
  }
  int v6 = logObject_MicroLocation_Default;
  if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)std::string buf = 0;
    _os_log_impl(&dword_25631F000, v6, OS_LOG_TYPE_DEFAULT, "_handleULInternalNotifyMonitorEventRecord: record", buf, 2u);
  }
  id v7 = [(ULLogicAdapter *)self environment];
  int v8 = [v7 queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __60__ULLogicAdapter__handleULInternalNotifyMonitorEventRecord___block_invoke;
  block[3] = &unk_2653F97F8;
  block[4] = self;
  dispatch_async(v8, block);
}

void __60__ULLogicAdapter__handleULInternalNotifyMonitorEventRecord___block_invoke(uint64_t a1)
{
  uint64_t v1 = (CLMicroLocationLegacyClient *)(*(void *)(*(void *)(a1 + 32) + 8) + 2848);
  CFAbsoluteTime v2 = cl::chrono::CFAbsoluteTimeClock::now();
  CLMicroLocationLegacyClient::onForcedRecording(v1, &v2);
}

- (void)_handleULInternalNotifyMonitorEventPurge:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  id v5 = v4;
  objc_opt_isKindOfClass();

  if (onceToken_MicroLocation_Default != -1) {
    dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_903);
  }
  int v6 = logObject_MicroLocation_Default;
  if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)std::string buf = 0;
    _os_log_impl(&dword_25631F000, v6, OS_LOG_TYPE_DEFAULT, "_handleULInternalNotifyMonitorEventPurge: purge", buf, 2u);
  }
  id v7 = [(ULLogicAdapter *)self environment];
  int v8 = [v7 queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __59__ULLogicAdapter__handleULInternalNotifyMonitorEventPurge___block_invoke;
  block[3] = &unk_2653F97F8;
  block[4] = self;
  dispatch_async(v8, block);
}

uint64_t __59__ULLogicAdapter__handleULInternalNotifyMonitorEventPurge___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) purgeMicroLocationData];
}

- (void)_handleULInternalNotifyMonitorEventSettingsRefrsh:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  id v5 = v4;
  objc_opt_isKindOfClass();

  if (onceToken_MicroLocation_Default != -1) {
    dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_903);
  }
  int v6 = logObject_MicroLocation_Default;
  if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)std::string buf = 0;
    _os_log_impl(&dword_25631F000, v6, OS_LOG_TYPE_DEFAULT, "_handleULInternalNotifyMonitorEventSettingsRefrsh: refresh", buf, 2u);
  }
  id v7 = [(ULLogicAdapter *)self environment];
  int v8 = [v7 queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __68__ULLogicAdapter__handleULInternalNotifyMonitorEventSettingsRefrsh___block_invoke;
  block[3] = &unk_2653F97F8;
  block[4] = self;
  dispatch_async(v8, block);
}

void __68__ULLogicAdapter__handleULInternalNotifyMonitorEventSettingsRefrsh___block_invoke(ULSettings *a1)
{
  ULSettings::refresh(a1);
  CFAbsoluteTime v2 = (CLMicroLocationLogic *)(*(void *)(*((void *)a1 + 4) + 8) + 224);
  CLMicroLocationLogic::refreshSettings(v2);
}

- (void)_handleULPrivacyMonitorEventLocationServices:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  objc_opt_class();
  id v5 = v4;
  if (objc_opt_isKindOfClass()) {
    int v6 = v5;
  }
  else {
    int v6 = 0;
  }
  id v7 = v6;

  if (onceToken_MicroLocation_Default != -1) {
    dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_903);
  }
  int v8 = (id)logObject_MicroLocation_Default;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = [v7 locationServicesEnabled];
    uint64_t v10 = @"NO";
    if (v9) {
      uint64_t v10 = @"YES";
    }
    *(_DWORD *)std::string buf = 138412290;
    long long v17 = v10;
    _os_log_impl(&dword_25631F000, v8, OS_LOG_TYPE_DEFAULT, "_handleULPrivacyMonitorEventLocationServices: locationServicesEnabled: %@", buf, 0xCu);
  }

  id v11 = [(ULLogicAdapter *)self environment];
  id v12 = [v11 queue];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __63__ULLogicAdapter__handleULPrivacyMonitorEventLocationServices___block_invoke;
  v14[3] = &unk_2653FA348;
  v14[4] = self;
  id v15 = v7;
  id v13 = v7;
  dispatch_async(v12, v14);
}

void __63__ULLogicAdapter__handleULPrivacyMonitorEventLocationServices___block_invoke(uint64_t a1)
{
  CLMicroLocationLogic::setLocationServicesEnabled((CLMicroLocationLogic *)(*(void *)(*(void *)(a1 + 32) + 8) + 224), [*(id *)(a1 + 40) locationServicesEnabled]);
  CFAbsoluteTime v2 = *(void **)(a1 + 40);
  int v3 = (CLMicroLocationLogic *)(*(void *)(*(void *)(a1 + 32) + 8) + 224);
  int v4 = [v2 locationServicesEnabled];
  CLMicroLocationLogic::setSignificantLocationsEnabled(v3, v4);
}

- (void)_handleULBuddyMonitorEventBuddyComplete:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  objc_opt_class();
  id v5 = v4;
  if (objc_opt_isKindOfClass()) {
    int v6 = v5;
  }
  else {
    int v6 = 0;
  }
  id v7 = v6;

  if (onceToken_MicroLocation_Default != -1) {
    dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_903);
  }
  int v8 = (id)logObject_MicroLocation_Default;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = [v7 buddyComplete];
    uint64_t v10 = @"NO";
    if (v9) {
      uint64_t v10 = @"YES";
    }
    *(_DWORD *)std::string buf = 138412290;
    long long v17 = v10;
    _os_log_impl(&dword_25631F000, v8, OS_LOG_TYPE_DEFAULT, "_handleULBuddyMonitorEventBuddyComplete: buddyComplete: %@", buf, 0xCu);
  }

  id v11 = [(ULLogicAdapter *)self environment];
  id v12 = [v11 queue];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __58__ULLogicAdapter__handleULBuddyMonitorEventBuddyComplete___block_invoke;
  v14[3] = &unk_2653FA348;
  v14[4] = self;
  id v15 = v7;
  id v13 = v7;
  dispatch_async(v12, v14);
}

void __58__ULLogicAdapter__handleULBuddyMonitorEventBuddyComplete___block_invoke(uint64_t a1)
{
  CLMicroLocationLegacyClient::setBuddyComplete(*(void *)(*(void *)(a1 + 32) + 8) + 2848, [*(id *)(a1 + 40) buddyComplete]);
  CLMicroLocationLogic::onBuddyComplete((CLMicroLocationLogic *)(*(void *)(*(void *)(a1 + 32) + 8) + 224), [*(id *)(a1 + 40) buddyComplete]);
  if ([*(id *)(a1 + 40) buddyComplete])
  {
    id v3 = [*(id *)(a1 + 32) environment];
    CFAbsoluteTime v2 = [v3 buddyMonitor];
    [v2 removeObserver:*(void *)(a1 + 32)];
  }
}

- (void)_handleULSleepWakeMonitorEvent:(id)a3
{
  id v4 = a3;
  if (ULSettings::get<ULSettings::OffScreenScanEnabled>())
  {
    objc_opt_class();
    id v5 = v4;
    if (objc_opt_isKindOfClass()) {
      int v6 = v5;
    }
    else {
      int v6 = 0;
    }
    id v7 = v6;

    int v8 = [(ULLogicAdapter *)self environment];
    int v9 = [v8 queue];
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    void v11[2] = __49__ULLogicAdapter__handleULSleepWakeMonitorEvent___block_invoke;
    v11[3] = &unk_2653FA348;
    id v12 = v7;
    id v13 = self;
    id v10 = v7;
    dispatch_async(v9, v11);
  }
}

void __49__ULLogicAdapter__handleULSleepWakeMonitorEvent___block_invoke(uint64_t a1)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  uint64_t v2 = [*(id *)(a1 + 32) sleepWakeState];
  uint64_t v3 = v2;
  if (v2 == 30 || v2 == 20)
  {
    int v5 = 1;
  }
  else
  {
    if (v2 != 10) {
      goto LABEL_10;
    }
    int v5 = 0;
  }
  CLMicroLocationLogic::setAPWakeState((CLMicroLocationLogic *)(*(void *)(*(void *)(a1 + 40) + 8) + 224), v5);
LABEL_10:
  int v6 = [*(id *)(a1 + 40) sleepWakeEventsQueue];
  id v7 = [[ULSleepWakeEventAndDate alloc] initWithSleepWakeEvent:v3 andDate:cl::chrono::CFAbsoluteTimeClock::now()];
  [v6 addObject:v7];

  if (onceToken_MicroLocation_Default != -1) {
    dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_903);
  }
  int v8 = (id)logObject_MicroLocation_Default;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = [NSNumber numberWithInt:v3];
    id v10 = NSNumber;
    id v11 = [*(id *)(a1 + 40) sleepWakeEventsQueue];
    id v12 = objc_msgSend(v10, "numberWithUnsignedInteger:", objc_msgSend(v11, "count"));
    *(_DWORD *)std::string buf = 138412546;
    uint64_t v27 = v9;
    __int16 v28 = 2112;
    __int16 v29 = v12;
    _os_log_impl(&dword_25631F000, v8, OS_LOG_TYPE_DEFAULT, "Adding event:%@, num in queue:%@", buf, 0x16u);
  }
  if (v3 == 30 || v3 == 20)
  {
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v13 = objc_msgSend(*(id *)(a1 + 40), "sleepWakeEventsQueue", 0);
    uint64_t v14 = [v13 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v14)
    {
      uint64_t v15 = *(void *)v22;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v22 != v15) {
            objc_enumerationMutation(v13);
          }
          long long v17 = *(void **)(*((void *)&v21 + 1) + 8 * i);
          uint64_t v18 = +[ULHomeSlamAnalytics shared];
          uint64_t v19 = [v17 sleepWakeState];
          [v17 time];
          objc_msgSend(v18, "logSleepStateEvent:atTimestamp:", v19);
        }
        uint64_t v14 = [v13 countByEnumeratingWithState:&v21 objects:v25 count:16];
      }
      while (v14);
    }

    char v20 = [*(id *)(a1 + 40) sleepWakeEventsQueue];
    [v20 removeAllObjects];
  }
}

+ (id)_newULServiceDescriptorFromInternalDescriptor:(const void *)a3
{
  id v4 = objc_opt_new();
  for (uint64_t i = 0; i != 32; ++i)
  {
    if ((*((void *)a3 + 3) >> i))
    {
      int v6 = (void *)[objc_alloc(MEMORY[0x263F557A8]) initWithLocationTypeEnum:i];
      [v4 addObject:v6];
    }
  }
  id v7 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDBytes:a3];
  id v8 = objc_alloc(MEMORY[0x263F557C0]);
  uint64_t v9 = *((void *)a3 + 2);
  id v10 = [MEMORY[0x263EFF8C0] arrayWithArray:v4];
  id v11 = (void *)[v8 initWithServiceIdentifier:v7 serviceType:v9 locationTypes:v10];

  return v11;
}

- (void)setEnvironment:(id)a3
{
}

- (NSMutableArray)sleepWakeEventsQueue
{
  return self->_sleepWakeEventsQueue;
}

- (void)setSleepWakeEventsQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sleepWakeEventsQueue, 0);
  objc_storeStrong((id *)&self->_environment, 0);
  objc_storeStrong((id *)&self->_loiBridge, 0);
  value = self->logicAdapterImpl.__ptr_.__value_;
  self->logicAdapterImpl.__ptr_.__value_ = 0;
  if (value)
  {
    id v4 = *(void (**)(void))(*(void *)value + 8);
    v4();
  }
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  return self;
}

- (id)diagnosticInfo
{
  uint64_t v3 = [(ULLogicAdapter *)self environment];
  id v4 = [v3 queue];
  dispatch_assert_queue_not_V2(v4);

  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x3032000000;
  id v13 = __Block_byref_object_copy__22;
  uint64_t v14 = __Block_byref_object_dispose__22;
  id v15 = [MEMORY[0x263EFF9A0] dictionary];
  int v5 = [(ULLogicAdapter *)self environment];
  int v6 = [v5 queue];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __55__ULLogicAdapter_ULDiagnosticsProvider__diagnosticInfo__block_invoke;
  v9[3] = &unk_2653F9670;
  v9[4] = self;
  v9[5] = &v10;
  dispatch_sync(v6, v9);

  id v7 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v7;
}

void __55__ULLogicAdapter_ULDiagnosticsProvider__diagnosticInfo__block_invoke(uint64_t a1)
{
  v7[1] = *MEMORY[0x263EF8340];
  int v6 = @"Date";
  uint64_t v2 = [MEMORY[0x263EFF910] date];
  v7[0] = v2;
  uint64_t v3 = [NSDictionary dictionaryWithObjects:v7 forKeys:&v6 count:1];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  int v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  CLMicroLocationLogic::logState((CLMicroLocationLogic *)(*(void *)(*(void *)(a1 + 32) + 8) + 224));
}

- (uint64_t)_startSensors
{
    return a1 + 8;
  else {
    return 0;
  }
}

- (id)_startSensors
{
  *a2 = &unk_2704E26B0;
  id result = *(id *)(a1 + 8);
  a2[1] = result;
  return result;
}

- (ULWiFiScanProvider)_startSensors
{
  id v3 = *a2;
  uint64_t v4 = [[ULWiFiScanProvider alloc] initWithDelegate:v3 andQueue:*(void *)(a1 + 8)];

  return v4;
}

- (ULOdometryProvider)_startSensors
{
  id v3 = *a2;
  uint64_t v4 = [[ULOdometryProvider alloc] initWithQueue:*(void *)(a1 + 8) delegate:v3];

  return v4;
}

- (void)_learnExecute:
{
}

- (uint64_t)_learnExecute:
{
    return a1 + 8;
  else {
    return 0;
  }
}

- (void)_maintenanceExecute:
{
}

- (uint64_t)_maintenanceExecute:
{
    return a1 + 8;
  else {
    return 0;
  }
}

- (void)_routineStateAnalyzerExecute:
{
}

- (uint64_t)_routineStateAnalyzerExecute:
{
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

- (void)_analyticsExecute:
{
}

- (uint64_t)_analyticsExecute:
{
    return a1 + 8;
  else {
    return 0;
  }
}

- (void)_wifiAnalyticsExecute:
{
}

- (uint64_t)_wifiAnalyticsExecute:
{
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

- (void)_exportiCloudBackupExecute:
{
}

- (uint64_t)_exportiCloudBackupExecute:
{
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

- (void)_registerOrUnregisterForBackgroundTaskWithRequest:(uint64_t)a1 withSelector:(uint8_t *)buf requiresMiLoEnabled:(os_log_t)log isRegister:(void *)a4 .cold.1(uint64_t a1, uint8_t *buf, os_log_t log, void *a4)
{
  *(void *)std::string buf = 68289795;
  *((_WORD *)buf + 4) = 2082;
  *(void *)(buf + 10) = "";
  *((_WORD *)buf + 9) = 2082;
  *(void *)(buf + 20) = a1;
  *((_WORD *)buf + 14) = 2082;
  *(void *)(buf + 30) = "assert";
  *((_WORD *)buf + 19) = 2081;
  *((void *)buf + 5) = "[self respondsToSelector:selector]";
  _os_log_impl(&dword_25631F000, log, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"ULLogicAdapter does not respond to selector\", \"selector\":%{public, location:escape_only}s, \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x30u);
}

@end
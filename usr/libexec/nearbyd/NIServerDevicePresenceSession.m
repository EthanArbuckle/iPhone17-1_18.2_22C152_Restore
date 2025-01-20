@interface NIServerDevicePresenceSession
- (BOOL)airPodsProxCardSampleTooOld:(id)a3;
- (BOOL)isAirPods:(unsigned int)a3;
- (BOOL)isInteresetedInSample:(id)a3;
- (BOOL)isInterestedInSamplesForDevice:(id)a3;
- (BOOL)supportsCameraAssistance;
- (BOOL)supportsDevicePresence;
- (BOOL)supportsSessionObservers;
- (NIDevicePresenceConfiguration)configuration;
- (NIServerDevicePresenceSession)initWithResourcesManager:(id)a3 configuration:(id)a4 error:(id *)a5;
- (duration<long)nominalCycleRate;
- (id).cxx_construct;
- (id)_disableAllServicesAndSendHangupSignal:(BOOL)a3;
- (id)configure;
- (id)description;
- (id)disableAllServices;
- (id)discoveryTokenFromIdentifier:(unint64_t)a3;
- (id)getQueueForInputingData;
- (id)lastConfiguration;
- (id)objectFromIdentifier:(unint64_t)a3;
- (id)pauseWithSource:(int64_t)a3;
- (id)run;
- (int64_t)_roseMotionStateToNIMotionActivityState:(int)a3;
- (optional<unsigned)identifierFromDiscoveryToken:(id)a3;
- (void)_handleMotionStateChange:(int)a3;
- (void)consumeBluetoothSample:(id)a3;
- (void)invalidate;
- (void)processVisionInput:(id)a3;
- (void)updatesEngine:(id)a3 didUpdateNearbyObjects:(id)a4;
- (void)updatesEngine:(id)a3 object:(id)a4 didUpdateRegion:(id)a5 previousRegion:(id)a6 regionTransitionSuppressed:(BOOL)a7;
@end

@implementation NIServerDevicePresenceSession

- (id)description
{
  id v3 = [objc_alloc((Class)NSMutableString) initWithFormat:@"NIServerDevicePresenceSession"];
  v4 = (void *)*((void *)self + 43);
  if (v4)
  {
    v5 = [v4 description];
    [v3 appendFormat:@" with Configuration: %@", v5];
  }
  else
  {
    [v3 appendFormat:@" with Configuration: nil"];
  }

  return v3;
}

- (NIServerDevicePresenceSession)initWithResourcesManager:(id)a3 configuration:(id)a4 error:(id *)a5
{
  id v9 = a3;
  id v10 = a4;
  uint64_t v11 = objc_opt_class();
  if (v11 != objc_opt_class())
  {
    v44 = +[NSAssertionHandler currentHandler];
    [v44 handleFailureInMethod:a2 object:self file:@"NIServerDevicePresenceSession.mm" lineNumber:89 description:@"NIServerDevicePresenceSession given invalid configuration."];
  }
  v12 = [v9 serverSessionIdentifier];

  if (!v12)
  {
    v45 = +[NSAssertionHandler currentHandler];
    [v45 handleFailureInMethod:a2, self, @"NIServerDevicePresenceSession.mm", 90, @"Invalid parameter not satisfying: %@", @"resourcesManager.serverSessionIdentifier" object file lineNumber description];
  }
  v52.receiver = self;
  v52.super_class = (Class)NIServerDevicePresenceSession;
  id v13 = [(NIServerBaseSession *)&v52 initWithResourcesManager:v9 configuration:v10 error:a5];
  v14 = v13;
  if (v13)
  {
    id v15 = [v10 copy];
    v16 = (void *)*((void *)v13 + 43);
    *((void *)v13 + 43) = v15;

    if (([*((id *)v13 + 43) monitoringOption] & 2) == 0)
    {
      if (v9)
      {
        [v9 protobufLogger];
        long long v17 = *(_OWORD *)location;
      }
      else
      {
        long long v17 = 0uLL;
      }
      location[0] = 0;
      location[1] = 0;
      v19 = (std::__shared_weak_count *)*((void *)v13 + 7);
      *((_OWORD *)v13 + 3) = v17;
      if (v19) {
        sub_10001A970(v19);
      }
      if (location[1]) {
        sub_10001A970((std::__shared_weak_count *)location[1]);
      }
      uint64_t v20 = [v9 clientConnectionQueue];
      v21 = (void *)*((void *)v13 + 10);
      *((void *)v13 + 10) = v20;

      v22 = [v9 serverSessionIdentifier];
      uint64_t v23 = [v22 UUIDString];
      v24 = (void *)*((void *)v13 + 11);
      *((void *)v13 + 11) = v23;

      *((void *)v13 + 39) = 0;
      id v25 = objc_alloc_init((Class)SFDeviceDiscovery);
      v26 = (void *)*((void *)v13 + 12);
      *((void *)v13 + 12) = v25;

      if ([*((id *)v13 + 43) allowedDevices] == (id)2)
      {
        v27 = [*((id *)v13 + 43) innerBoundary];
        if ([v27 devicePresencePreset] == (id)3)
        {

LABEL_21:
          objc_initWeak(location, v13);
          v30 = (void *)*((void *)v13 + 12);
          v50[0] = _NSConcreteStackBlock;
          v50[1] = 3221225472;
          v50[2] = sub_1001A3210;
          v50[3] = &unk_100846110;
          objc_copyWeak(&v51, location);
          [v30 activateWithCompletion:v50];
          objc_destroyWeak(&v51);
          objc_destroyWeak(location);
          goto LABEL_22;
        }
        v28 = [*((id *)v13 + 43) innerBoundary];
        BOOL v29 = [v28 devicePresencePreset] == (id)2;

        if (v29) {
          goto LABEL_21;
        }
      }
LABEL_22:
      uint64_t v49 = 0x3FF0000000000000;
      int v47 = 16843009;
      __int16 v48 = 0;
      id v31 = v13;
      v32 = operator new(0x118uLL);
      v32[1] = 0;
      v32[2] = 0;
      void *v32 = off_1008565F8;
      id v33 = v31;
      location[0] = off_100856648;
      location[1] = v33;
      v58 = location;
      uint64_t v34 = *((void *)v13 + 10);
      uint64_t v35 = *((void *)v13 + 11);
      id v36 = v33;
      v56[0] = off_1008566D8;
      v56[1] = v36;
      v56[3] = v56;
      v37 = (char *)v36;
      v55[0] = off_100856768;
      v55[1] = v37;
      v55[3] = v55;
      sub_10028CDFC(v32 + 3, &v47, location, v34, v35, v56, v55);
      sub_1001A6274(v55);
      sub_1001A62F8(v56);
      sub_1001A637C(location);
      *(void *)&long long v46 = v32 + 3;
      *((void *)&v46 + 1) = v32;
      sub_10001ABCC((uint64_t)&v46, (void *)v46, v46);
      long long v38 = v46;
      long long v46 = 0uLL;
      v39 = (std::__shared_weak_count *)*((void *)v37 + 14);
      *(_OWORD *)(v37 + 104) = v38;
      if (v39)
      {
        sub_10001A970(v39);
        if (*((void *)&v46 + 1)) {
          sub_10001A970(*((std::__shared_weak_count **)&v46 + 1));
        }
      }
      unsigned int v40 = +[NSUserDefaults standardUserDefaults];
      v41 = qword_1008ABDE0;
      BOOL v42 = os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT);
      if (v40)
      {
        if (v42)
        {
          LOWORD(location[0]) = 0;
          _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEFAULT, "#ses-devicepresence,Motion detection enabled by defaults write", (uint8_t *)location, 2u);
        }
        sub_10028D19C(*((uint64_t **)v37 + 13));
      }
      else if (v42)
      {
        LOWORD(location[0]) = 0;
        _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEFAULT, "#ses-devicepresence,no defaults write present for motion detection; motion detection will not be enabled",
          (uint8_t *)location,
          2u);
      }
      operator new();
    }
    if (a5)
    {
      v53[0] = NSLocalizedFailureReasonErrorKey;
      v53[1] = NSLocalizedRecoverySuggestionErrorKey;
      v54[0] = @"Invalid monitoring option.";
      v54[1] = @"AlwaysOn is not currently supported, remove from configuration.";
      v18 = +[NSDictionary dictionaryWithObjects:v54 forKeys:v53 count:2];
      *a5 = +[NSError errorWithDomain:@"com.apple.NearbyInteraction" code:-5888 userInfo:v18];
    }
  }

  return 0;
}

- (duration<long)nominalCycleRate
{
  return (duration<long long, std::ratio<1, 1000>>)2000;
}

- (id)lastConfiguration
{
  return *((id *)self + 43);
}

- (id)getQueueForInputingData
{
  return *((id *)self + 10);
}

- (int64_t)_roseMotionStateToNIMotionActivityState:(int)a3
{
  if (a3 == 1) {
    return 2;
  }
  else {
    return a3 == 2;
  }
}

- (void)_handleMotionStateChange:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  dispatch_assert_queue_V2(*((dispatch_queue_t *)self + 10));
  v5 = (id)qword_1008ABDE0;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    sub_1001F00B4(v3, __p);
    v6 = v14 >= 0 ? __p : (void **)__p[0];
    *(_DWORD *)buf = 136315138;
    v16 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#ses-devicepresence,received new motion state %s", buf, 0xCu);
    if (v14 < 0) {
      operator delete(__p[0]);
    }
  }

  int64_t v7 = [(NIServerDevicePresenceSession *)self _roseMotionStateToNIMotionActivityState:v3];
  int64_t v8 = v7;
  uint64_t v9 = *((void *)self + 39);
  if (v9 != v7)
  {
    if (v7 == 1 && v9 == 2)
    {
      char v10 = objc_opt_respondsToSelector();
      uint64_t v11 = qword_1008ABDE0;
      BOOL v12 = os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT);
      if (v10)
      {
        if (v12)
        {
          LOWORD(__p[0]) = 0;
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "#ses-devicepresence,Stationary transition detected, starting double boost.", (uint8_t *)__p, 2u);
        }
        [*((id *)self + 12) triggerEnhancedDiscovery:@"device presence session configuration" useCase:131084 completion:&stru_100856578];
      }
      else if (v12)
      {
        LOWORD(__p[0]) = 0;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "#ses-devicepresence,double boost not available", (uint8_t *)__p, 2u);
      }
    }
    *((void *)self + 39) = v8;
  }
}

- (void)consumeBluetoothSample:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2(*((dispatch_queue_t *)self + 10));
  v5 = [v4 identifier];

  if (v5)
  {
    v6 = [v4 model];

    if (v6)
    {
      if (([*((id *)self + 43) allowedDevices] & 8) != 0
        && +[NIPlatformInfo isInternalBuild]
        && os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEBUG))
      {
        sub_100416B7C();
      }
      int64_t v7 = [*((id *)self + 43) token];
      BOOL v8 = v7 == 0;

      if (v8)
      {
        BOOL v12 = [NIDiscoveryToken alloc];
        id v13 = [v4 identifier];
        char v14 = [v13 dataUsingEncoding:4];
        id v15 = [(NIDiscoveryToken *)v12 initWithBytes:v14];
      }
      else
      {
        uint64_t v9 = [v4 model];
        unsigned int v10 = [v9 isEqualToString:@"NONE"];

        if (v10)
        {
          uint64_t v11 = qword_1008ABDE0;
          if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            *(void *)&uint8_t buf[4] = v4;
            _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "#ses-devicepresence,No model information while bt finding for sample: %@", buf, 0xCu);
          }
          goto LABEL_63;
        }
        id v15 = [*((id *)self + 43) token];
      }
      v16 = [*((id *)self + 43) innerBoundary];
      if ([v16 devicePresencePreset] == (id)3)
      {
        [v4 rssi];
        BOOL v18 = v17 < -61.0;

        if (v18)
        {
          v19 = (id)qword_1008ABDE0;
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          {
            [v4 rssi];
            uint64_t v21 = v20;
            unsigned int v22 = [v4 channel];
            uint64_t v23 = [v4 identifier];
            *(_DWORD *)buf = 134218754;
            *(void *)&uint8_t buf[4] = v21;
            __int16 v78 = 1024;
            unsigned int v79 = v22;
            __int16 v80 = 2112;
            *(void *)v81 = v23;
            *(_WORD *)&v81[8] = 2048;
            *(void *)&v81[10] = [(NIDiscoveryToken *)v15 hash];
            _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "#ses-devicepresence,Ignoring weak RSSI %f on channel %d for device: %@ (device hash: 0x%lx) because we cannot trust weak RSSI due to a BT FW bug", buf, 0x26u);
          }
          goto LABEL_63;
        }
      }
      else
      {
      }
      v73 = 0;
      v74 = 0;
      uint64_t v75 = 0;
      v24 = [v4 identifier];
      id v25 = [v24 dataUsingEncoding:4];

      id v26 = [v25 length];
      v27 = 0;
      if (v26)
      {
        sub_10003F834((unint64_t *)&v73, (size_t)v26);
        v27 = v73;
      }
      else if (v74 != v73)
      {
        v74 = v73;
      }
      [v25 getBytes:v27 length:[v25 length]];
      std::mutex::lock((std::mutex *)((char *)self + 208));
      *(void *)buf = [(NIDiscoveryToken *)v15 hash];
      if (!sub_100056B3C((void *)self + 21, (unint64_t *)buf))
      {
        v28 = [[NINearbyObject alloc] initWithToken:v15];
        BOOL v29 = [v4 identifier];
        [(NINearbyObject *)v28 setDeviceIdentifier:v29];

        v30 = [v4 name];
        [(NINearbyObject *)v28 setName:v30];

        v76 = [(NIDiscoveryToken *)v15 hash];
        *(void *)buf = &v76;
        id v31 = sub_1001A64C8((uint64_t)self + 168, (unint64_t *)&v76, (uint64_t)&unk_1004BC2F8, (void **)buf);
        v32 = (void *)v31[3];
        v31[3] = v28;
      }
      std::mutex::unlock((std::mutex *)((char *)self + 208));
      id v33 = [v4 partIdentifier];
      if ([v33 isEqualToString:&stru_100869B68])
      {
        id v34 = [(NIDiscoveryToken *)v15 hash];
      }
      else
      {
        uint64_t v35 = [v4 partIdentifier];
        id v34 = [v35 hash];
      }
      if (!v34
        && +[NIPlatformInfo isInternalBuild]
        && os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEBUG))
      {
        sub_100416B08();
      }
      if (![(NIServerDevicePresenceSession *)self airPodsProxCardSampleTooOld:v4])
      {
        [v4 machContinuousTimeSeconds];
        double v37 = v36;
        [v4 rssi];
        double v39 = v38;
        int v40 = [v4 channel];
        id v41 = [v4 model];
        sub_100004950(__p, (char *)[v41 UTF8String]);
        sub_1001A5B8C((uint64_t)buf, v40, (long long *)__p, (uint64_t)&v73, [(NIDiscoveryToken *)v15 hash], (uint64_t)v34, v37, v39);
        if (v72 < 0) {
          operator delete(__p[0]);
        }

        [*((id *)self + 8) acceptBluetoothSample:buf coarseEstimation:0 regionCategory:0];
        sub_100240BF8(*((std::string **)self + 15), (const std::string *)buf);
        BOOL v42 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, *((dispatch_queue_t *)self + 10));
        v43 = [*((id *)self + 43) innerBoundary];
        BOOL v44 = [v43 devicePresencePreset] == (id)3;

        if (v44) {
          double v45 = 120.0;
        }
        else {
          double v45 = 60.0;
        }
        long long v46 = [*((id *)self + 43) token];
        BOOL v47 = v46 == 0;

        double v48 = 10.0;
        if (v47)
        {
          uint64_t v49 = [*((id *)self + 43) innerBoundary];
          if ([v49 devicePresencePreset] == (id)1)
          {
            v50 = [v4 model];
            unsigned int v51 = [(NIServerDevicePresenceSession *)self isAirPods:CBProductIDFromNSString()];

            if (v51) {
              double v48 = 5.0;
            }
            else {
              double v48 = v45;
            }
          }
          else
          {

            double v48 = v45;
          }
        }
        objc_super v52 = +[NSUserDefaults standardUserDefaults];
        [v52 doubleForKey:@"NIDevicePresenceSampleTimeoutOverrideSeconds"];
        if (v53 >= 300.0 || v53 <= 1.0) {
          double v55 = v48;
        }
        else {
          double v55 = v53;
        }
        dispatch_time_t v56 = dispatch_walltime(0, (uint64_t)(v55 * 1000000000.0));
        dispatch_source_set_timer(v42, v56, (uint64_t)(v55 * 1000000000.0), 0);
        objc_initWeak(&location, self);
        handler[0] = _NSConcreteStackBlock;
        handler[1] = 3221225472;
        handler[2] = sub_1001A4154;
        handler[3] = &unk_1008565A0;
        objc_copyWeak(v69, &location);
        v69[1] = *(id *)&v55;
        v57 = v15;
        v66 = v57;
        v58 = v42;
        v67 = v58;
        v68 = self;
        dispatch_source_set_event_handler(v58, handler);
        v59 = (void *)((char *)self + 272);
        v76 = [(NIDiscoveryToken *)v57 hash];
        v60 = sub_100056B3C(v59, (unint64_t *)&v76);
        if (v60) {
          dispatch_source_cancel((dispatch_source_t)v60[3]);
        }
        unint64_t v64 = [(NIDiscoveryToken *)v57 hash];
        v76 = (id *)&v64;
        v61 = sub_1001A67C4((uint64_t)v59, &v64, (uint64_t)&unk_1004BC2F8, &v76);
        v62 = (void *)v61[3];
        v61[3] = v58;
        v63 = v58;

        dispatch_resume(v63);
        objc_destroyWeak(v69);
        objc_destroyWeak(&location);

        if (v83)
        {
          v84 = v83;
          operator delete(v83);
        }
        if (v82 < 0) {
          operator delete(*(void **)&v81[4]);
        }
      }

      if (v73)
      {
        v74 = v73;
        operator delete(v73);
      }
    }
    else if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR))
    {
      sub_100416AA0();
    }
  }
  else if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR))
  {
    sub_100416A38();
  }
LABEL_63:
}

- (BOOL)isInteresetedInSample:(id)a3
{
  id v4 = a3;
  unint64_t v5 = (unint64_t)[*((id *)self + 43) allowedDevices];
  if (v5 < 6 && ((0x33u >> v5) & 1) != 0) {
    goto LABEL_8;
  }
  v6 = [v4 model];
  if ([v6 isEqualToString:&stru_100869B68])
  {

LABEL_8:
    LOBYTE(self) = 0;
    goto LABEL_9;
  }
  int64_t v7 = [v4 model];

  if (!v7) {
    goto LABEL_8;
  }
  BOOL v8 = [v4 model];
  uint64_t v9 = CBProductIDFromNSString();

  if ([*((id *)self + 43) allowedDevices] == (id)8)
  {
    LOBYTE(self) = [(NIServerDevicePresenceSession *)self isAirPods:v9];
    goto LABEL_9;
  }
  if (([*((id *)self + 43) allowedDevices] & 8) != 0)
  {
    LOBYTE(self) = 1;
    goto LABEL_9;
  }
  LOBYTE(self) = 0;
  if ((int)v9 <= 8193)
  {
    if ((v9 - 801) >= 2 && v9 != 666 && v9 != 671) {
      goto LABEL_19;
    }
  }
  else if ((v9 - 8194) > 0x24 || ((1 << (v9 - 2)) & 0x1C7BB7FF9BLL) == 0)
  {
LABEL_19:
    LODWORD(self) = sub_1001A4528(v9) ^ 1;
  }
LABEL_9:

  return (char)self;
}

- (BOOL)isInterestedInSamplesForDevice:(id)a3
{
  id v4 = a3;
  unint64_t v5 = (unint64_t)[*((id *)self + 43) allowedDevices];
  if (v5 < 6 && ((0x33u >> v5) & 1) != 0) {
    goto LABEL_12;
  }
  if (![v4 rssi])
  {
    char v14 = (id)qword_1008ABDE0;
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      id v15 = [v4 idsDeviceID];
      v16 = [v4 model];
      int v24 = 138412546;
      id v25 = v15;
      __int16 v26 = 2112;
      v27 = v16;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "#ses-devicepresence,Dropping BT RSSI sample for device: %@ which is of model: %@ because reported RSSI is UNKNOWN", (uint8_t *)&v24, 0x16u);
    }
    goto LABEL_11;
  }
  v6 = [*((id *)self + 43) token];

  int64_t v7 = (void *)*((void *)self + 43);
  if (v6)
  {
    BOOL v8 = [v7 token];
    uint64_t v9 = [v8 objectInRawTokenOPACKDictForKey:&off_1008786D0];

    id v10 = [v9 length];
    if (v10 != (id)6)
    {
      if (v10 != (id)7)
      {
        if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
          sub_100416BF0();
        }
        unsigned __int8 v13 = 0;
        goto LABEL_20;
      }
      uint64_t v11 = [v9 subdataWithRange:1, [v9 length] - 1];

      uint64_t v9 = (void *)v11;
    }
    BOOL v12 = [v4 btAddressData];
    unsigned __int8 v13 = [v9 isEqualToData:v12];

LABEL_20:
    goto LABEL_29;
  }
  if (([v7 allowedDevices] & 8) == 0)
  {
    double v17 = [v4 idsDeviceID];

    if (!v17) {
      goto LABEL_12;
    }
    BOOL v18 = [v4 model];

    if (v18)
    {
      BOOL v19 = ((unint64_t)[v4 deviceFlags] & 0x380) == 0;
LABEL_26:
      unsigned __int8 v13 = !v19;
      goto LABEL_29;
    }
    char v14 = (id)qword_1008ABDE0;
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v23 = [v4 idsDeviceID];
      int v24 = 138412290;
      id v25 = v23;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "#ses-devicepresence,Dropping BT RSSI sample for device: %@ which does not have model info", (uint8_t *)&v24, 0xCu);
    }
LABEL_11:

LABEL_12:
    unsigned __int8 v13 = 0;
    goto LABEL_29;
  }
  unsigned __int8 v13 = 0;
  unsigned int v20 = [v4 productID] - 8194;
  if (v20 <= 0x22 && ((1 << v20) & 0x472863101) != 0)
  {
    unsigned int v21 = [v4 productID];
    BOOL v19 = v21 == 8223 || v21 == 8202;
    goto LABEL_26;
  }
LABEL_29:

  return v13;
}

- (BOOL)supportsCameraAssistance
{
  return +[NIPlatformInfo supportsARKit];
}

- (BOOL)supportsDevicePresence
{
  return 1;
}

- (BOOL)supportsSessionObservers
{
  return 1;
}

- (id)configure
{
  dispatch_assert_queue_V2(*((dispatch_queue_t *)self + 10));
  if (!*((void *)self + 43)) {
    sub_100416C58();
  }
  uint64_t v3 = qword_1008ABDE0;
  if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *((void *)self + 43);
    *(_DWORD *)buf = 138412290;
    uint64_t v20 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "#ses-devicepresence,Configure. Configuration given: %@", buf, 0xCu);
  }
  v18.receiver = self;
  v18.super_class = (Class)NIServerDevicePresenceSession;
  unint64_t v5 = [(NIServerBaseSession *)&v18 resourcesManager];
  if (*((void *)self + 8)) {
    goto LABEL_11;
  }
  v6 = [NINearbyUpdatesEngine alloc];
  uint64_t v7 = *((void *)self + 43);
  uint64_t v8 = *((void *)self + 10);
  uint64_t v9 = [v5 analytics];
  id v10 = (std::__shared_weak_count *)*((void *)self + 7);
  uint64_t v16 = *((void *)self + 6);
  double v17 = v10;
  if (v10) {
    atomic_fetch_add_explicit(&v10->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  id v15 = 0;
  uint64_t v11 = [(NINearbyUpdatesEngine *)v6 initWithConfiguration:v7 queue:v8 delegate:self dataSource:self analyticsManager:v9 protobufLogger:&v16 error:&v15];
  id v12 = v15;
  unsigned __int8 v13 = (void *)*((void *)self + 8);
  *((void *)self + 8) = v11;

  if (v17) {
    sub_10001A970(v17);
  }

  if (*((void *)self + 8))
  {

LABEL_11:
    id v12 = 0;
  }

  return v12;
}

- (id)run
{
  dispatch_assert_queue_V2(*((dispatch_queue_t *)self + 10));
  v15.receiver = self;
  v15.super_class = (Class)NIServerDevicePresenceSession;
  uint64_t v3 = [(NIServerBaseSession *)&v15 resourcesManager];
  uint64_t v4 = (char *)[*((id *)self + 43) allowedDevices];
  if ((unint64_t)(v4 - 6) < 0xA || (unint64_t)(v4 - 2) < 2)
  {
    unint64_t v5 = [*((id *)self + 43) token];

    [v3 devicePresenceResource];
    if (v5) {
      v6 = {;
    }
      uint64_t v7 = [v6 internalObserver];
      uint64_t v8 = [*((id *)self + 43) token];
      [v7 startHighPriorityScanningForToken:v8 forConsumer:self];
    }
    else {
      v6 = {;
    }
      uint64_t v7 = [v6 internalObserver];
      [v7 startLeechingForConsumer:self];
    }
  }
  uint64_t v9 = [v3 lifecycleSupervisor];
  [v9 runWithConfigurationCalled];

  id v10 = (std::string *)*((void *)self + 15);
  double v11 = sub_100006C38();
  id v12 = [v3 clientProcessNameBestGuess];
  sub_100004950(&__p, (char *)[v12 UTF8String]);
  sub_100240BEC(v10, &__p, v11);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }

  *((unsigned char *)self + 72) = 1;
  return 0;
}

- (id)pauseWithSource:(int64_t)a3
{
  dispatch_assert_queue_V2(*((dispatch_queue_t *)self + 10));
  *((unsigned char *)self + 72) = 0;
  sub_1001A4EE8((uint64_t)self + 128);
  uint64_t v4 = [(NIServerDevicePresenceSession *)self _disableAllServicesAndSendHangupSignal:0];
  v16.receiver = self;
  v16.super_class = (Class)NIServerDevicePresenceSession;
  unint64_t v5 = [(NIServerBaseSession *)&v16 resourcesManager];
  v6 = [v5 lifecycleSupervisor];
  [v6 pauseCalled];

  uint64_t v7 = [v5 devicePresenceResource];
  uint64_t v8 = [v7 internalObserver];
  [v8 stopLeechingForConsumer:self];

  uint64_t v9 = [*((id *)self + 43) token];

  if (v9)
  {
    id v10 = [v5 devicePresenceResource];
    double v11 = [v10 internalObserver];
    [v11 stopHighPriorityScanning];
  }
  id v12 = [*((id *)self + 43) token];

  if (v12)
  {
    uint64_t v13 = *((void *)self + 15);
    double v14 = sub_100006C38();
    sub_100240DEC(v13, v14);
  }

  return v4;
}

- (id)disableAllServices
{
  v8.receiver = self;
  v8.super_class = (Class)NIServerDevicePresenceSession;
  uint64_t v3 = [(NIServerBaseSession *)&v8 resourcesManager];
  uint64_t v4 = [v3 devicePresenceResource];
  unint64_t v5 = [v4 internalObserver];
  [v5 stopLeechingForConsumer:self];

  v6 = [(NIServerDevicePresenceSession *)self _disableAllServicesAndSendHangupSignal:1];

  return v6;
}

- (void)invalidate
{
  dispatch_assert_queue_V2(*((dispatch_queue_t *)self + 10));
  *((unsigned char *)self + 72) = 0;
  sub_1001A4EE8((uint64_t)self + 128);
  [*((id *)self + 12) invalidate];
  sub_10028CF34(*((void *)self + 13));
  id v3 = [(NIServerDevicePresenceSession *)self disableAllServices];
  uint64_t v4 = [*((id *)self + 43) token];

  if (v4)
  {
    uint64_t v5 = *((void *)self + 15);
    double v6 = sub_100006C38();
    sub_100240DEC(v5, v6);
  }
  v7.receiver = self;
  v7.super_class = (Class)NIServerDevicePresenceSession;
  [(NIServerBaseSession *)&v7 invalidate];
}

- (id)_disableAllServicesAndSendHangupSignal:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)NIServerDevicePresenceSession;
  uint64_t v4 = [(NIServerBaseSession *)&v7 disableAllServices];
  sub_1001A4EE8((uint64_t)self + 128);
  [*((id *)self + 8) invalidate];
  uint64_t v5 = (void *)*((void *)self + 8);
  *((void *)self + 8) = 0;

  return v4;
}

- (id)discoveryTokenFromIdentifier:(unint64_t)a3
{
  id v3 = [(NIServerDevicePresenceSession *)self objectFromIdentifier:a3];
  uint64_t v4 = [v3 discoveryToken];

  return v4;
}

- (optional<unsigned)identifierFromDiscoveryToken:(id)a3
{
  id v3 = [a3 hash];
  BOOL v4 = 1;
  result.__engaged_ = v4;
  result.var0 = ($BEC950A715106DE229A2E4BA1089E24D)v3;
  return result;
}

- (id)objectFromIdentifier:(unint64_t)a3
{
  unint64_t v15 = a3;
  BOOL v4 = (std::mutex *)((char *)self + 208);
  std::mutex::lock((std::mutex *)((char *)self + 208));
  uint64_t v5 = sub_100056B3C((void *)self + 21, &v15);
  if (v5)
  {
    id v6 = (id)v5[3];
  }
  else
  {
    objc_super v7 = qword_1008ABDE0;
    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
      sub_100416C84((uint64_t)&v15, v7, v8, v9, v10, v11, v12, v13);
    }
    id v6 = 0;
  }
  std::mutex::unlock(v4);

  return v6;
}

- (void)processVisionInput:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2(*((dispatch_queue_t *)self + 10));
  [*((id *)self + 8) acceptVisionInput:v4];
}

- (void)updatesEngine:(id)a3 object:(id)a4 didUpdateRegion:(id)a5 previousRegion:(id)a6 regionTransitionSuppressed:(BOOL)a7
{
  id v12 = a3;
  id v13 = a4;
  unint64_t v14 = (unint64_t)a5;
  unint64_t v15 = (unint64_t)a6;
  objc_super v16 = (void *)v15;
  if (*((id *)self + 8) != v12) {
    __assert_rtn("-[NIServerDevicePresenceSession updatesEngine:object:didUpdateRegion:previousRegion:regionTransitionSuppressed:]", "NIServerDevicePresenceSession.mm", 750, "engine == _updatesEngine");
  }
  if (v14 | v15 && !a7)
  {
    double v17 = *((void *)self + 10);
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_1001A5498;
    v18[3] = &unk_1008565C8;
    v18[4] = self;
    id v19 = (id)v14;
    id v20 = v16;
    id v21 = v13;
    dispatch_async(v17, v18);
  }
}

- (void)updatesEngine:(id)a3 didUpdateNearbyObjects:(id)a4
{
  id v5 = a4;
  id v6 = [*((id *)self + 43) token];

  if (v6)
  {
    objc_super v7 = *((void *)self + 10);
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_1001A56B0;
    v8[3] = &unk_100846588;
    v8[4] = self;
    id v9 = v5;
    dispatch_async(v7, v8);
  }
}

- (BOOL)airPodsProxCardSampleTooOld:(id)a3
{
  id v4 = a3;
  id v5 = [*((id *)self + 43) innerBoundary];
  if ([v5 devicePresencePreset] == (id)1)
  {
    id v6 = [v4 model];
    BOOL v7 = [(NIServerDevicePresenceSession *)self isAirPods:CBProductIDFromNSString()];

    if (v7)
    {
      uint64_t v8 = +[NSUserDefaults standardUserDefaults];
      [v8 doubleForKey:@"NIDevicePresenceMaxSampleAgeOverrideSeconds"];
      if (v9 >= 600.0 || v9 <= 1.0) {
        double v11 = 5.0;
      }
      else {
        double v11 = v9;
      }
      double v12 = sub_100006C38();
      [v4 machContinuousTimeSeconds];
      double v14 = v13;
      LOBYTE(v7) = v13 < v12 - v11;
      if (v13 < v12 - v11)
      {
        unint64_t v15 = qword_1008ABDE0;
        if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_INFO))
        {
          int v17 = 134218240;
          double v18 = v14;
          __int16 v19 = 2048;
          double v20 = v11;
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "#ses-devicepresence,Ignoring sample with a timestamp of %f, which is more than %f seconds old.", (uint8_t *)&v17, 0x16u);
        }
      }
    }
  }
  else
  {

    LOBYTE(v7) = 0;
  }

  return v7;
}

- (BOOL)isAirPods:(unsigned int)a3
{
  return (a3 - 8194 < 0x23) & (0x452863001uLL >> (a3 - 2));
}

- (NIDevicePresenceConfiguration)configuration
{
  return (NIDevicePresenceConfiguration *)objc_getProperty(self, a2, 344, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)self + 43, 0);
  objc_storeStrong((id *)self + 40, 0);
  sub_1001A6A10((uint64_t)self + 272);
  std::mutex::~mutex((std::mutex *)((char *)self + 208));
  sub_1001A6A10((uint64_t)self + 168);
  sub_1001A5C38((uint64_t)self + 128);
  uint64_t v3 = *((void *)self + 15);
  *((void *)self + 15) = 0;
  if (v3) {
    sub_1001A6400((uint64_t)self + 120, v3);
  }
  id v4 = (std::__shared_weak_count *)*((void *)self + 14);
  if (v4) {
    sub_10001A970(v4);
  }
  objc_storeStrong((id *)self + 12, 0);
  objc_storeStrong((id *)self + 11, 0);
  objc_storeStrong((id *)self + 10, 0);
  objc_storeStrong((id *)self + 8, 0);
  id v5 = (std::__shared_weak_count *)*((void *)self + 7);
  if (v5)
  {
    sub_10001A970(v5);
  }
}

- (id).cxx_construct
{
  *((void *)self + 6) = 0;
  *((void *)self + 7) = 0;
  *((void *)self + 13) = 0;
  *((void *)self + 14) = 0;
  *((void *)self + 15) = 0;
  *((unsigned char *)self + 128) = 0;
  *((unsigned char *)self + 160) = 0;
  *(_OWORD *)((char *)self + 168) = 0u;
  *(_OWORD *)((char *)self + 184) = 0u;
  *((_DWORD *)self + 50) = 1065353216;
  *((void *)self + 26) = 850045863;
  *(_OWORD *)((char *)self + 216) = 0u;
  *(_OWORD *)((char *)self + 232) = 0u;
  *(_OWORD *)((char *)self + 248) = 0u;
  *((void *)self + 33) = 0;
  *((_OWORD *)self + 17) = 0u;
  *((_OWORD *)self + 18) = 0u;
  *((_DWORD *)self + 76) = 1065353216;
  *((unsigned char *)self + 328) = 0;
  *((unsigned char *)self + 336) = 0;
  return self;
}

@end
@interface _FindingAdvertiser
+ (id)sharedInstance;
- (id)_configureAdvertiserForType:(int)a3 toPeer:(id)a4 withAdvertisement:(id)a5;
- (id)_configureNearbyActionNoWakeAdvertiserWithPeer:(id)a3 advertisement:(id)a4;
- (id)_configureSpatialInteractionAdvertiserWithPeer:(id)a3 advertisement:(id)a4;
- (id)_initInternal;
- (id)payloadChangeObserverQueue;
- (id)printableState;
- (id)startAdvertisingAsFinder:(BOOL)a3 toPeer:(id)a4 withAdvertisement:(id)a5;
- (id)stopAdvertisingAsFinder:(BOOL)a3 toPeer:(id)a4;
- (unint64_t)_peerIndexReferenceForAdvertisementType:(int)a3 outPeers:(id *)a4 outAdvertisements:(id *)a5;
- (unint64_t)_totalPeers;
- (void)_cbAdvertisingAddressChanged;
- (void)_resetAdvertiserForType:(int)a3;
- (void)_resetNearbyActionNoWakeAdvertiser;
- (void)_resetSpatialInteractionAdvertiser;
- (void)_roundRobinTimerHandler;
- (void)_startRoundRobinTimer;
- (void)_stopRoundRobinTimer;
- (void)_updateAdvertisementAfterActivationForType:(int)a3;
- (void)payloadDidChange;
@end

@implementation _FindingAdvertiser

+ (id)sharedInstance
{
  if (qword_1008A9E18 != -1) {
    dispatch_once(&qword_1008A9E18, &stru_100861000);
  }
  v2 = (void *)qword_1008A9E10;

  return v2;
}

- (id)startAdvertisingAsFinder:(BOOL)a3 toPeer:(id)a4 withAdvertisement:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  if (!v8)
  {
    v15 = "token";
    int v16 = 125;
    goto LABEL_8;
  }
  if (!v9)
  {
    v15 = "advertisement";
    int v16 = 126;
LABEL_8:
    __assert_rtn("-[_FindingAdvertiser startAdvertisingAsFinder:toPeer:withAdvertisement:]", "NIServerFindingDiscovery.mm", v16, v15);
  }
  uint64_t v22 = 0;
  v23 = &v22;
  uint64_t v24 = 0x3032000000;
  v25 = sub_100308028;
  v26 = sub_100308038;
  id v27 = 0;
  selfQueue = self->_selfQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100308040;
  block[3] = &unk_100861028;
  BOOL v21 = a3;
  block[4] = self;
  id v18 = v8;
  id v19 = v9;
  v20 = &v22;
  id v11 = v9;
  id v12 = v8;
  dispatch_sync((dispatch_queue_t)selfQueue, block);
  id v13 = (id)v23[5];

  _Block_object_dispose(&v22, 8);

  return v13;
}

- (id)stopAdvertisingAsFinder:(BOOL)a3 toPeer:(id)a4
{
  id v6 = a4;
  if (!v6) {
    sub_10042F02C();
  }
  uint64_t v15 = 0;
  int v16 = &v15;
  uint64_t v17 = 0x3032000000;
  id v18 = sub_100308028;
  id v19 = sub_100308038;
  id v20 = 0;
  selfQueue = self->_selfQueue;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100308324;
  v11[3] = &unk_100861050;
  BOOL v14 = a3;
  v11[4] = self;
  id v12 = v6;
  id v13 = &v15;
  id v8 = v6;
  dispatch_sync((dispatch_queue_t)selfQueue, v11);
  id v9 = (id)v16[5];

  _Block_object_dispose(&v15, 8);

  return v9;
}

- (id)printableState
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  v10 = sub_100308028;
  id v11 = sub_100308038;
  id v12 = (id)objc_opt_new();
  selfQueue = self->_selfQueue;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1003085E4;
  v6[3] = &unk_100856C00;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync((dispatch_queue_t)selfQueue, v6);
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (id)_initInternal
{
  v18.receiver = self;
  v18.super_class = (Class)_FindingAdvertiser;
  v2 = [(_FindingAdvertiser *)&v18 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.nearbyd.finding.advertiser-self", v3);
    selfQueue = v2->_selfQueue;
    v2->_selfQueue = (OS_dispatch_queue *)v4;

    roundRobinTimer = v2->_roundRobinTimer;
    v2->_roundRobinTimer = 0;

    nearbyActionNoWakeAdvertiser = v2->_nearbyActionNoWakeAdvertiser;
    v2->_nearbyActionNoWakeAdvertiser = 0;

    v2->_activatedNearbyActionNoWake = 0;
    spatialInteractionAdvertiser = v2->_spatialInteractionAdvertiser;
    v2->_spatialInteractionAdvertiser = 0;

    v2->_activatedSpatialInteraction = 0;
    uint64_t v9 = objc_opt_new();
    nearbyActionNoWakePeers = v2->_nearbyActionNoWakePeers;
    v2->_nearbyActionNoWakePeers = (NSMutableArray *)v9;

    uint64_t v11 = objc_opt_new();
    nearbyActionNoWakeAdvertisements = v2->_nearbyActionNoWakeAdvertisements;
    v2->_nearbyActionNoWakeAdvertisements = (NSMutableArray *)v11;

    v2->_nearbyActionNoWakeCurrentPeerIndex = 0;
    uint64_t v13 = objc_opt_new();
    spatialInteractionPeers = v2->_spatialInteractionPeers;
    v2->_spatialInteractionPeers = (NSMutableArray *)v13;

    uint64_t v15 = objc_opt_new();
    spatialInteractionAdvertisements = v2->_spatialInteractionAdvertisements;
    v2->_spatialInteractionAdvertisements = (NSMutableArray *)v15;

    v2->_spatialInteractionCurrentPeerIndex = 0;
  }
  return v2;
}

- (unint64_t)_peerIndexReferenceForAdvertisementType:(int)a3 outPeers:(id *)a4 outAdvertisements:(id *)a5
{
  uint64_t v7 = self;
  if (a3 == 26)
  {
    *a4 = self[7];
    *a5 = (id) v7[8];
    id v10 = [*a4 count];
    if (v10 != [*a5 count]) {
      sub_10042F0DC();
    }
    if ([*a4 count])
    {
      unint64_t v11 = v7[9];
      if (v11 >= (unint64_t)[*a4 count]) {
        sub_10042F0B0();
      }
    }
    return v7 + 9;
  }
  else if (a3 == 19)
  {
    *a4 = self[10];
    *a5 = (id) v7[11];
    id v8 = [*a4 count];
    if (v8 != [*a5 count]) {
      sub_10042F084();
    }
    if ([*a4 count])
    {
      unint64_t v9 = v7[12];
      if (v9 >= (unint64_t)[*a4 count]) {
        sub_10042F058();
      }
    }
    return v7 + 12;
  }
  return self;
}

- (unint64_t)_totalPeers
{
  id v3 = [(NSMutableArray *)self->_nearbyActionNoWakePeers count];
  return (unint64_t)v3 + (void)[(NSMutableArray *)self->_spatialInteractionPeers count];
}

- (id)_configureAdvertiserForType:(int)a3 toPeer:(id)a4 withAdvertisement:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  if (a3 == 26)
  {
    uint64_t v11 = [(_FindingAdvertiser *)self _configureNearbyActionNoWakeAdvertiserWithPeer:v9 advertisement:v10];
  }
  else
  {
    if (a3 != 19) {
      goto LABEL_6;
    }
    uint64_t v11 = [(_FindingAdvertiser *)self _configureSpatialInteractionAdvertiserWithPeer:v9 advertisement:v10];
  }
  v5 = (void *)v11;
LABEL_6:

  return v5;
}

- (void)_resetAdvertiserForType:(int)a3
{
  if (a3 == 26)
  {
    [(_FindingAdvertiser *)self _resetNearbyActionNoWakeAdvertiser];
  }
  else if (a3 == 19)
  {
    [(_FindingAdvertiser *)self _resetSpatialInteractionAdvertiser];
  }
}

- (id)_configureNearbyActionNoWakeAdvertiserWithPeer:(id)a3 advertisement:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_selfQueue);
  if (!v6)
  {
    v31 = "peerToken";
    int v32 = 388;
    goto LABEL_39;
  }
  if (!v7)
  {
    v31 = "advertisement";
    int v32 = 389;
LABEL_39:
    __assert_rtn("-[_FindingAdvertiser _configureNearbyActionNoWakeAdvertiserWithPeer:advertisement:]", "NIServerFindingDiscovery.mm", v32, v31);
  }
  nearbyActionNoWakeAdvertiser = self->_nearbyActionNoWakeAdvertiser;
  if (!nearbyActionNoWakeAdvertiser)
  {
    id v19 = (CBAdvertiser *)objc_opt_new();
    id v20 = self->_nearbyActionNoWakeAdvertiser;
    self->_nearbyActionNoWakeAdvertiser = v19;

    [(CBAdvertiser *)self->_nearbyActionNoWakeAdvertiser setDispatchQueue:self->_selfQueue];
    [(CBAdvertiser *)self->_nearbyActionNoWakeAdvertiser setLabel:@"nearbydFinding"];
    [(CBAdvertiser *)self->_nearbyActionNoWakeAdvertiser setAdvertiseRate:50];
    [(CBAdvertiser *)self->_nearbyActionNoWakeAdvertiser setEnableEPAForLEAdvertisement:1];
    [(CBAdvertiser *)self->_nearbyActionNoWakeAdvertiser setUseCase:458752];
    objc_initWeak(location, self);
    v37[0] = _NSConcreteStackBlock;
    v37[1] = 3221225472;
    v37[2] = sub_1003097D4;
    v37[3] = &unk_1008460E8;
    objc_copyWeak(&v38, location);
    [(CBAdvertiser *)self->_nearbyActionNoWakeAdvertiser setAdvertisingAddressChangedHandler:v37];
    self->_activatedNearbyActionNoWake = 0;
    BOOL v21 = qword_1008ABDE0;
    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "#find-disc,NearbyActionNoWake: activating advertiser", buf, 2u);
    }
    double v22 = sub_100006C38();
    v23 = self->_nearbyActionNoWakeAdvertiser;
    v34[0] = _NSConcreteStackBlock;
    v34[1] = 3221225472;
    v34[2] = sub_100309830;
    v34[3] = &unk_100846178;
    v35[1] = *(id *)&v22;
    objc_copyWeak(v35, location);
    v34[4] = self;
    [(CBAdvertiser *)v23 activateWithCompletion:v34];
    objc_destroyWeak(v35);
    objc_destroyWeak(&v38);
    objc_destroyWeak(location);
    goto LABEL_23;
  }
  if (!self->_activatedNearbyActionNoWake)
  {
    uint64_t v24 = qword_1008ABDE0;
    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(location[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "#find-disc,NearbyActionNoWake: advertiser still activating", (uint8_t *)location, 2u);
    }
LABEL_23:
    v25 = 0;
    goto LABEL_34;
  }
  id v9 = [(CBAdvertiser *)nearbyActionNoWakeAdvertiser advertisingAddressDataConnectable];
  id v10 = v9;
  if (!v9 || (unint64_t)[v9 length] <= 5)
  {
    WORD2(location[0]) = 0;
    LODWORD(location[0]) = 0;
    uint64_t v11 = +[NSData dataWithBytes:location length:6];

    id v10 = (void *)v11;
  }
  id v12 = sub_10030997C(v6, v10);
  if (!v12)
  {
    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_FAULT)) {
      sub_10042F108();
    }
    v25 = +[NSError errorWithDomain:@"com.apple.NearbyInteraction" code:-10020 userInfo:0];
    goto LABEL_33;
  }
  if ([(CBAdvertiser *)self->_nearbyActionNoWakeAdvertiser nearbyActionNoWakeType] != 1)[(CBAdvertiser *)self->_nearbyActionNoWakeAdvertiser setNearbyActionNoWakeType:1]; {
  uint64_t v13 = [(CBAdvertiser *)self->_nearbyActionNoWakeAdvertiser nearbyActionNoWakeAuthTagData];
  }
  uint64_t v14 = (uint64_t)[v12 isEqualToData:v13];

  if ((v14 & 1) == 0) {
    [(CBAdvertiser *)self->_nearbyActionNoWakeAdvertiser setNearbyActionNoWakeAuthTagData:v12];
  }
  uint64_t v15 = [v7 payload];
  if (v15
    || ([(CBAdvertiser *)self->_nearbyActionNoWakeAdvertiser nearbyActionNoWakeConfigData], (uint64_t v14 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    int v16 = [v7 payload:v14];
    uint64_t v17 = [(CBAdvertiser *)self->_nearbyActionNoWakeAdvertiser nearbyActionNoWakeConfigData];
    unsigned int v18 = [v16 isEqualToData:v17];

    if (v15)
    {

      if (!v18) {
        goto LABEL_29;
      }
    }
    else
    {

      if ((v18 & 1) == 0)
      {
LABEL_29:
        [(CBAdvertiser *)self->_nearbyActionNoWakeAdvertiser setNearbyActionNWPrecisionFindingStatus:0];
        id v27 = [v7 payload];
        [(CBAdvertiser *)self->_nearbyActionNoWakeAdvertiser setNearbyActionNoWakeConfigData:v27];

        -[CBAdvertiser setNearbyActionNWPrecisionFindingStatus:](self->_nearbyActionNoWakeAdvertiser, "setNearbyActionNWPrecisionFindingStatus:", -[CBAdvertiser nearbyActionNWPrecisionFindingStatus](self->_nearbyActionNoWakeAdvertiser, "nearbyActionNWPrecisionFindingStatus") | [v7 statusFlags]);
        goto LABEL_30;
      }
    }
  }
  unsigned int v26 = [(CBAdvertiser *)self->_nearbyActionNoWakeAdvertiser nearbyActionNWPrecisionFindingStatus];
  if (v26 != [v7 statusFlags]) {
    goto LABEL_29;
  }
LABEL_30:
  v28 = qword_1008ABDE0;
  if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
  {
    v29 = self->_nearbyActionNoWakeAdvertiser;
    LODWORD(location[0]) = 138477827;
    *(id *)((char *)location + 4) = v29;
    _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "#find-disc,NearbyActionNoWake: configured advertiser: %{private}@", (uint8_t *)location, 0xCu);
  }
  v25 = 0;
LABEL_33:

LABEL_34:

  return v25;
}

- (id)_configureSpatialInteractionAdvertiserWithPeer:(id)a3 advertisement:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_selfQueue);
  if (!v6)
  {
    v45 = "peerToken";
    int v46 = 485;
    goto LABEL_36;
  }
  if (!v7)
  {
    v45 = "advertisement";
    int v46 = 486;
LABEL_36:
    __assert_rtn("-[_FindingAdvertiser _configureSpatialInteractionAdvertiserWithPeer:advertisement:]", "NIServerFindingDiscovery.mm", v46, v45);
  }
  id v8 = [v6 getIRK];
  if (v8)
  {
    id v9 = [v6 getSessionIdentifier];
    if (v9)
    {
      char v51 = 0;
      int v50 = 0;
      id v10 = [v7 payload];

      if (v10)
      {
        for (unsigned __int8 i = 0; ; ++i)
        {
          id v12 = [v7 payload];
          id v13 = [v12 length];

          if ((unint64_t)v13 <= i) {
            break;
          }
          id v14 = [v7 payload];
          *((unsigned char *)&v50 + i) = *((unsigned char *)[v14 bytes] + i);
        }
      }
      id v15 = [v7 statusFlags];
      int v16 = +[NIServerSpatialInteractionPayloadAggregator sharedInstance];
      [v16 setFindingStatus:v15];

      uint64_t v17 = v50;
      unsigned int v18 = +[NIServerSpatialInteractionPayloadAggregator sharedInstance];
      [v18 setFindingConfig:v17];

      uint64_t v19 = BYTE1(v50);
      id v20 = +[NIServerSpatialInteractionPayloadAggregator sharedInstance];
      [v20 setFindingConfig2:v19];

      BOOL v21 = +[NIServerSpatialInteractionPayloadAggregator sharedInstance];
      [v21 setFindingEnabled:1];

      double v22 = +[NIServerSpatialInteractionPayloadAggregator sharedInstance];
      [v22 commitChange];

      v23 = +[NIServerSpatialInteractionPayloadAggregator sharedInstance];
      uint64_t v24 = [v23 aggregatedUWBData];

      spatialInteractionAdvertiser = self->_spatialInteractionAdvertiser;
      if (spatialInteractionAdvertiser)
      {
        unsigned int v26 = [(CBSpatialInteractionSession *)spatialInteractionAdvertiser clientIrkData];
        if ([v26 isEqualToData:v8])
        {
          id v27 = [(CBSpatialInteractionSession *)self->_spatialInteractionAdvertiser clientIdentifierData];
          unsigned __int8 v28 = [v27 isEqual:v9];

          if (v28)
          {
            if (self->_activatedSpatialInteraction)
            {
              v29 = [(CBSpatialInteractionSession *)self->_spatialInteractionAdvertiser uwbConfigData];
              unsigned __int8 v30 = [v24 isEqualToData:v29];

              if ((v30 & 1) == 0)
              {
                [(CBSpatialInteractionSession *)self->_spatialInteractionAdvertiser setControlFlags:[(CBSpatialInteractionSession *)self->_spatialInteractionAdvertiser controlFlags] | 8];
                [(CBSpatialInteractionSession *)self->_spatialInteractionAdvertiser setUwbConfigData:v24];
                [(CBSpatialInteractionSession *)self->_spatialInteractionAdvertiser setControlFlags:(unint64_t)[(CBSpatialInteractionSession *)self->_spatialInteractionAdvertiser controlFlags] & 0xFFFFFFF7];
              }
              uint64_t v31 = qword_1008ABDE0;
              if (!os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT)) {
                goto LABEL_27;
              }
              int v32 = self->_spatialInteractionAdvertiser;
              LODWORD(location[0]) = 138477827;
              *(id *)((char *)location + 4) = v32;
              v33 = "#find-disc,SpatialInteraction: configured advertiser: %{private}@";
              v34 = v31;
              uint32_t v35 = 12;
            }
            else
            {
              uint64_t v44 = qword_1008ABDE0;
              if (!os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
              {
LABEL_27:

                v36 = 0;
                goto LABEL_28;
              }
              LOWORD(location[0]) = 0;
              v33 = "#find-disc,SpatialInteraction: advertiser still activating";
              v34 = v44;
              uint32_t v35 = 2;
            }
            _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, v33, (uint8_t *)location, v35);
            goto LABEL_27;
          }
        }
        else
        {
        }
      }
      [(CBSpatialInteractionSession *)self->_spatialInteractionAdvertiser invalidate];
      id v38 = (CBSpatialInteractionSession *)objc_opt_new();
      v39 = self->_spatialInteractionAdvertiser;
      self->_spatialInteractionAdvertiser = v38;

      [(CBSpatialInteractionSession *)self->_spatialInteractionAdvertiser setDispatchQueue:self->_selfQueue];
      [(CBSpatialInteractionSession *)self->_spatialInteractionAdvertiser setLabel:@"nearbydFinding"];
      [(CBSpatialInteractionSession *)self->_spatialInteractionAdvertiser setClientIrkData:v8];
      [(CBSpatialInteractionSession *)self->_spatialInteractionAdvertiser setClientIdentifierData:v9];
      [(CBSpatialInteractionSession *)self->_spatialInteractionAdvertiser setControlFlags:4115];
      [(CBSpatialInteractionSession *)self->_spatialInteractionAdvertiser setEnableEPAForLEAdvertisement:1];
      [(CBSpatialInteractionSession *)self->_spatialInteractionAdvertiser setAdvertiseRate:50];
      [(CBSpatialInteractionSession *)self->_spatialInteractionAdvertiser setUwbConfigData:v24];
      self->_activatedSpatialInteraction = 0;
      objc_initWeak(location, self);
      v40 = qword_1008ABDE0;
      if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, "#find-disc,SpatialInteraction: activating advertiser", buf, 2u);
      }
      double v41 = sub_100006C38();
      v42 = self->_spatialInteractionAdvertiser;
      v47[0] = _NSConcreteStackBlock;
      v47[1] = 3221225472;
      v47[2] = sub_10030A254;
      v47[3] = &unk_100846178;
      v48[1] = *(id *)&v41;
      objc_copyWeak(v48, location);
      v47[4] = self;
      [(CBSpatialInteractionSession *)v42 activateWithCompletion:v47];
      objc_destroyWeak(v48);
      objc_destroyWeak(location);
      goto LABEL_27;
    }
    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_FAULT)) {
      sub_10042F1D8();
    }
    NSErrorUserInfoKey v53 = NSLocalizedFailureReasonErrorKey;
    CFStringRef v54 = @"Discovery token doesn't contain valid session identifier";
    v37 = +[NSDictionary dictionaryWithObjects:&v54 forKeys:&v53 count:1];
    v36 = +[NSError errorWithDomain:@"com.apple.NearbyInteraction" code:-10020 userInfo:v37];
  }
  else
  {
    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_FAULT)) {
      sub_10042F1D8();
    }
    NSErrorUserInfoKey v55 = NSLocalizedFailureReasonErrorKey;
    CFStringRef v56 = @"Discovery token doesn't contain valid IRK";
    id v9 = +[NSDictionary dictionaryWithObjects:&v56 forKeys:&v55 count:1];
    v36 = +[NSError errorWithDomain:@"com.apple.NearbyInteraction" code:-10020 userInfo:v9];
  }
LABEL_28:

  return v36;
}

- (void)_resetNearbyActionNoWakeAdvertiser
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_selfQueue);
  id v3 = qword_1008ABDE0;
  if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "#find-disc,NearbyActionNoWake: reset advertising", v5, 2u);
  }
  [(CBAdvertiser *)self->_nearbyActionNoWakeAdvertiser invalidate];
  nearbyActionNoWakeAdvertiser = self->_nearbyActionNoWakeAdvertiser;
  self->_nearbyActionNoWakeAdvertiser = 0;

  self->_activatedNearbyActionNoWake = 0;
}

- (void)_resetSpatialInteractionAdvertiser
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_selfQueue);
  id v3 = qword_1008ABDE0;
  if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "#find-disc,SpatialInteraction: reset advertising", v7, 2u);
  }
  [(CBSpatialInteractionSession *)self->_spatialInteractionAdvertiser invalidate];
  spatialInteractionAdvertiser = self->_spatialInteractionAdvertiser;
  self->_spatialInteractionAdvertiser = 0;

  self->_activatedSpatialInteraction = 0;
  v5 = +[NIServerSpatialInteractionPayloadAggregator sharedInstance];
  [v5 setFindingEnabled:0];

  id v6 = +[NIServerSpatialInteractionPayloadAggregator sharedInstance];
  [v6 commitChange];
}

- (void)_updateAdvertisementAfterActivationForType:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_selfQueue);
  id v12 = 0;
  id v13 = 0;
  v5 = [(_FindingAdvertiser *)self _peerIndexReferenceForAdvertisementType:v3 outPeers:&v13 outAdvertisements:&v12];
  id v6 = v13;
  id v7 = v12;
  unint64_t v8 = *v5;
  if (v8 < (unint64_t)[v6 count])
  {
    id v9 = [v6 objectAtIndexedSubscript:*v5];
    id v10 = [v7 objectAtIndexedSubscript:*v5];
    id v11 = [(_FindingAdvertiser *)self _configureAdvertiserForType:v3 toPeer:v9 withAdvertisement:v10];
  }
}

- (void)_startRoundRobinTimer
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_selfQueue);
  roundRobinTimer = self->_roundRobinTimer;
  if (roundRobinTimer)
  {
    dispatch_source_cancel((dispatch_source_t)roundRobinTimer);
    dispatch_queue_t v4 = self->_roundRobinTimer;
    self->_roundRobinTimer = 0;
  }
  v5 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)self->_selfQueue);
  id v6 = self->_roundRobinTimer;
  self->_roundRobinTimer = v5;

  id v7 = self->_roundRobinTimer;
  dispatch_time_t v8 = dispatch_time(0, 5000000000);
  dispatch_source_set_timer((dispatch_source_t)v7, v8, 0x12A05F200uLL, 0x989680uLL);
  objc_initWeak(&location, self);
  id v9 = self->_roundRobinTimer;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10030A7A0;
  v10[3] = &unk_1008460E8;
  objc_copyWeak(&v11, &location);
  dispatch_source_set_event_handler((dispatch_source_t)v9, v10);
  dispatch_resume((dispatch_object_t)self->_roundRobinTimer);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

- (void)_stopRoundRobinTimer
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_selfQueue);
  roundRobinTimer = self->_roundRobinTimer;
  if (roundRobinTimer)
  {
    dispatch_source_cancel((dispatch_source_t)roundRobinTimer);
    dispatch_queue_t v4 = self->_roundRobinTimer;
    self->_roundRobinTimer = 0;
  }
}

- (void)_roundRobinTimerHandler
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_selfQueue);
  uint64_t v3 = operator new(8uLL);
  uint64_t v4 = 0;
  void *v3 = 0x1A00000013;
  *(void *)&long long v5 = 136315651;
  long long v16 = v5;
  do
  {
    uint64_t v6 = *(unsigned int *)((char *)v3 + v4);
    id v17 = 0;
    id v18 = 0;
    id v7 = -[_FindingAdvertiser _peerIndexReferenceForAdvertisementType:outPeers:outAdvertisements:](self, "_peerIndexReferenceForAdvertisementType:outPeers:outAdvertisements:", v6, &v18, &v17, v16);
    id v8 = v18;
    id v9 = v17;
    if ((unint64_t)[v8 count] >= 2)
    {
      unint64_t v10 = *v7;
      *id v7 = (v10 + 1) % (unint64_t)[v8 count];
      id v11 = [v8 objectAtIndexedSubscript:];
      id v12 = [v9 objectAtIndexedSubscript:*v7];
      id v13 = [(_FindingAdvertiser *)self _configureAdvertiserForType:v6 toPeer:v11 withAdvertisement:v12];
      id v14 = (id)qword_1008ABDE0;
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        id v15 = sub_1002E1AA0(v6);
        *(_DWORD *)buf = v16;
        id v20 = v15;
        __int16 v21 = 2113;
        double v22 = v11;
        __int16 v23 = 2113;
        uint64_t v24 = v12;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "#find-disc,Round robin: re-configured advertiser (%s). New peer: %{private}@. New advertisement: %{private}@.", buf, 0x20u);
      }
    }
    v4 += 4;
  }
  while (v4 != 8);
  operator delete(v3);
}

- (void)_cbAdvertisingAddressChanged
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_selfQueue);
  uint64_t v3 = qword_1008ABDE0;
  if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "#find-disc,BT adv address changed", buf, 2u);
  }
  id v10 = 0;
  id v11 = 0;
  uint64_t v4 = [(_FindingAdvertiser *)self _peerIndexReferenceForAdvertisementType:26 outPeers:&v11 outAdvertisements:&v10];
  id v5 = v11;
  id v6 = v10;
  if ([v5 count])
  {
    id v7 = [v5 objectAtIndexedSubscript:*v4];
    id v8 = [v6 objectAtIndexedSubscript:*v4];
    id v9 = [(_FindingAdvertiser *)self _configureAdvertiserForType:26 toPeer:v7 withAdvertisement:v8];
  }
}

- (id)payloadChangeObserverQueue
{
  return self->_selfQueue;
}

- (void)payloadDidChange
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_selfQueue);
  if (self->_spatialInteractionAdvertiser)
  {
    uint64_t v3 = +[NIServerSpatialInteractionPayloadAggregator sharedInstance];
    uint64_t v4 = [v3 aggregatedUWBData];

    id v5 = [(CBSpatialInteractionSession *)self->_spatialInteractionAdvertiser uwbConfigData];
    unsigned __int8 v6 = [v5 isEqualToData:v4];

    if ((v6 & 1) == 0)
    {
      if (([(CBSpatialInteractionSession *)self->_spatialInteractionAdvertiser controlFlags] & 8) != 0)
      {
        [(CBSpatialInteractionSession *)self->_spatialInteractionAdvertiser setUwbConfigData:v4];
        id v8 = qword_1008ABDE0;
        if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
        {
          int v9 = 138412290;
          id v10 = v4;
          _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "#find-disc,SpatialInteraction: payload did change: %@. Advertiser updated, but not currently advertising", (uint8_t *)&v9, 0xCu);
        }
      }
      else
      {
        [(CBSpatialInteractionSession *)self->_spatialInteractionAdvertiser setControlFlags:[(CBSpatialInteractionSession *)self->_spatialInteractionAdvertiser controlFlags] | 8];
        [(CBSpatialInteractionSession *)self->_spatialInteractionAdvertiser setUwbConfigData:v4];
        id v7 = qword_1008ABDE0;
        if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
        {
          int v9 = 138412290;
          id v10 = v4;
          _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "#find-disc,SpatialInteraction: payload did change: %@. Advertiser updated, and control flags toggled for it to take effect", (uint8_t *)&v9, 0xCu);
        }
        [(CBSpatialInteractionSession *)self->_spatialInteractionAdvertiser setControlFlags:(unint64_t)[(CBSpatialInteractionSession *)self->_spatialInteractionAdvertiser controlFlags] & 0xFFFFFFF7];
      }
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_spatialInteractionAdvertisements, 0);
  objc_storeStrong((id *)&self->_spatialInteractionPeers, 0);
  objc_storeStrong((id *)&self->_nearbyActionNoWakeAdvertisements, 0);
  objc_storeStrong((id *)&self->_nearbyActionNoWakePeers, 0);
  objc_storeStrong((id *)&self->_spatialInteractionAdvertiser, 0);
  objc_storeStrong((id *)&self->_nearbyActionNoWakeAdvertiser, 0);
  objc_storeStrong((id *)&self->_roundRobinTimer, 0);

  objc_storeStrong((id *)&self->_selfQueue, 0);
}

@end
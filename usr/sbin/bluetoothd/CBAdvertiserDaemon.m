@interface CBAdvertiserDaemon
- (BOOL)_wiProxUpdateLinger:(id *)a3 active:(BOOL)a4;
- (BOOL)advertiserEnableEPA;
- (BOOL)needsToRun;
- (CBAdvertiserDaemon)init;
- (CBDaemonServer)daemonServer;
- (CBStackAdaptor)stackAdaptor;
- (NSArray)advertiserArray;
- (NSArray)spatialInteractionIdentifiers;
- (NSData)selfAuthTag;
- (NSData)spatialInteractionPresenceConfigData;
- (NSData)spatialInteractionUWBConfigData;
- (OS_dispatch_queue)dispatchQueue;
- (id)_encryptInvitationPayload:(const void *)a3 payloadLength:(unint64_t)a4 authTag:(id)a5 irkData:(id)a6 keyInfo:(const void *)a7 keyInfoLength:(unint64_t)a8;
- (id)description;
- (id)descriptionWithLevel:(int)a3;
- (id)invalidationHandler;
- (id)stateChangedHandler;
- (int)spatialInteractionAdvertiseRate;
- (unsigned)spatialInteractionConfigFlags;
- (unsigned)spatialInteractionFlags;
- (void)_activateWithCompletion:(id)a3;
- (void)_invalidate;
- (void)_invalidated;
- (void)_stackAppleTypeUpdateAdvertising:(id *)a3;
- (void)_update;
- (void)_updateAirDropPayload:(id *)a3;
- (void)_updateAirPlaySourcePayload:(id *)a3;
- (void)_updateAirPlayTargetPayload:(id *)a3;
- (void)_updateDSInfoPayload:(id *)a3;
- (void)_updateFIDOAdvertising;
- (void)_updateFIDOPayload;
- (void)_updateHeySiriPayload:(id *)a3;
- (void)_updateIfNeededWithBlock:(id)a3;
- (void)_updateNearbyActionNoWakePayload:(id *)a3;
- (void)_updateNearbyActionV1Payload:(id *)a3;
- (void)_updateNearbyActionV2Payload:(id *)a3;
- (void)_updateNearbyInfoPayload:(id *)a3;
- (void)_updateNearbyInfoV2Payload:(id *)a3;
- (void)_updateSafetyAlertsAdvertising;
- (void)_updateSafetyAlertsPayload;
- (void)_updateSpatialInteractionAdvertising:(id *)a3;
- (void)_updateSpatialInteractionPayload:(id *)a3;
- (void)_updateWatchSetupAdvertising;
- (void)_updateWatchSetupPayload;
- (void)_wiProxInvalidate:(id *)a3;
- (void)_wiProxUpdateAdvertising:(id *)a3;
- (void)_wiProxUpdatePayload:(id *)a3 payloadData:(id)a4 advertiseRate:(int)a5 advertiseEnableEPA:(BOOL)a6;
- (void)_wiproxAppendDescription:(id *)a3 context:(id *)a4 verbose:(BOOL)a5;
- (void)_wiproxChanged:(id)a3;
- (void)activateWithCompletion:(id)a3;
- (void)advertisingAddressChanged;
- (void)invalidate;
- (void)setAdvertiserArray:(id)a3;
- (void)setAdvertiserEnableEPA:(BOOL)a3;
- (void)setDaemonServer:(id)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setInvalidationHandler:(id)a3;
- (void)setSelfAuthTag:(id)a3;
- (void)setSpatialInteractionAdvertiseRate:(int)a3;
- (void)setSpatialInteractionConfigFlags:(unsigned __int8)a3;
- (void)setSpatialInteractionFlags:(unsigned __int8)a3;
- (void)setSpatialInteractionIdentifiers:(id)a3;
- (void)setSpatialInteractionPresenceConfigData:(id)a3;
- (void)setSpatialInteractionUWBConfigData:(id)a3;
- (void)setStackAdaptor:(id)a3;
- (void)setStateChangedHandler:(id)a3;
@end

@implementation CBAdvertiserDaemon

- (NSArray)advertiserArray
{
  return self->_advertiserArray;
}

- (NSData)selfAuthTag
{
  return self->_selfAuthTag;
}

- (CBAdvertiserDaemon)init
{
  v16.receiver = self;
  v16.super_class = (Class)CBAdvertiserDaemon;
  v2 = [(CBAdvertiserDaemon *)&v16 init];
  if (v2)
  {
    v2->_clientID = CBXPCGetNextClientID();
    objc_storeStrong((id *)&v2->_dispatchQueue, &_dispatch_main_q);
    label = v2->_airdropWiProxContext.label;
    v2->_airdropWiProxContext.label = (NSString *)@"AirDrop";

    v2->_airdropWiProxContext.payloadType = 5;
    v4 = v2->_airplaySourceWiProxContext.label;
    v2->_airplaySourceWiProxContext.label = (NSString *)@"AirPlaySource";

    v2->_airplaySourceWiProxContext.payloadType = 10;
    v5 = v2->_airplayTargetWiProxContext.label;
    v2->_airplayTargetWiProxContext.label = (NSString *)@"AirPlayTarget";

    v2->_airplayTargetWiProxContext.payloadType = 9;
    v2->_dsInfoWiProxContext.connectable = 1;
    v6 = v2->_dsInfoWiProxContext.label;
    v2->_dsInfoWiProxContext.label = (NSString *)@"DSInfo";

    v2->_dsInfoWiProxContext.payloadType = 24;
    v7 = v2->_heySiriWiProxContext.label;
    v2->_heySiriWiProxContext.label = (NSString *)@"HeySiri";

    v2->_heySiriWiProxContext.payloadType = 8;
    v2->_nearbyActionV1WiProxContext.connectable = 1;
    v8 = v2->_nearbyActionV1WiProxContext.label;
    v2->_nearbyActionV1WiProxContext.label = (NSString *)@"NearbyActionV1";

    v2->_nearbyActionV1WiProxContext.payloadType = 15;
    v9 = v2->_nearbyActionV2WiProxContext.label;
    v2->_nearbyActionV2WiProxContext.label = (NSString *)@"NearbyActionV2";

    v2->_nearbyActionV2WiProxContext.payloadType = 21;
    v2->_nearbyInfoWiProxContext.connectable = 1;
    v10 = v2->_nearbyInfoWiProxContext.label;
    v2->_nearbyInfoWiProxContext.label = (NSString *)@"NearbyInfo";

    v2->_nearbyInfoWiProxContext.payloadType = 16;
    v11 = v2->_nearbyInfoV2WiProxContext.label;
    v2->_nearbyInfoV2WiProxContext.label = (NSString *)@"NearbyInfoV2";

    v2->_nearbyInfoV2WiProxContext.payloadType = 22;
    v2->_nearbyActionNoWakeWiProxContext.connectable = 1;
    v12 = v2->_nearbyActionNoWakeWiProxContext.label;
    v2->_nearbyActionNoWakeWiProxContext.label = (NSString *)@"NearbyActionNoWake";

    v2->_nearbyActionNoWakeWiProxContext.payloadType = 26;
    v2->_spatialInteractionWiProxContext.advertiseEnableEPA = 0;
    v13 = v2->_spatialInteractionWiProxContext.label;
    v2->_spatialInteractionWiProxContext.label = (NSString *)@"SpatialInteraction";

    v2->_spatialInteractionWiProxContext.payloadType = 19;
    v14 = v2;
  }

  return v2;
}

- (id)description
{
  return [(CBAdvertiserDaemon *)self descriptionWithLevel:50];
}

- (id)descriptionWithLevel:(int)a3
{
  unsigned int v4 = a3;
  v5 = [(id)objc_opt_class() description];
  clientID = (const char *)self->_clientID;
  NSUInteger v36 = [(NSArray *)self->_advertiserArray count];
  v28 = v5;
  NSAppendPrintF_safe();
  id v6 = 0;
  id location = v6;

  fidoPayloadData = self->_fidoPayloadData;
  if (fidoPayloadData)
  {
    v45 = v6;
    v8 = fidoPayloadData;
    uint64_t v9 = CUPrintNSDataHex();
    v10 = (void *)v9;
    int fidoAdvertiseRate = self->_fidoAdvertiseRate;
    if (fidoAdvertiseRate <= 39)
    {
      if (fidoAdvertiseRate > 19)
      {
        if (fidoAdvertiseRate == 20)
        {
          v12 = "350 ms";
          goto LABEL_22;
        }
      }
      else
      {
        if (fidoAdvertiseRate == 10)
        {
          v12 = "2 seconds";
          goto LABEL_22;
        }
        if (fidoAdvertiseRate == 15)
        {
          v12 = "1022.5 ms";
          goto LABEL_22;
        }
      }
    }
    else if (fidoAdvertiseRate <= 44)
    {
      if (fidoAdvertiseRate == 40)
      {
        v12 = "181.25 ms";
        goto LABEL_22;
      }
      if (fidoAdvertiseRate == 42)
      {
        v12 = "120 ms";
        goto LABEL_22;
      }
    }
    else
    {
      switch(fidoAdvertiseRate)
      {
        case '-':
          v12 = "60 ms";
          goto LABEL_22;
        case '2':
          v12 = "30 ms";
          goto LABEL_22;
        case '<':
          v12 = "20 ms";
LABEL_22:
          v28 = (void *)v9;
          clientID = v12;
          NSAppendPrintF_safe();
          objc_storeStrong(&location, v45);

          goto LABEL_23;
      }
    }
    v12 = "270 ms";
    goto LABEL_22;
  }
LABEL_23:
  -[CBAdvertiserDaemon _wiproxAppendDescription:context:verbose:](self, "_wiproxAppendDescription:context:verbose:", &location, &self->_airdropWiProxContext, v4 < 0x1F, v28, clientID, v36);
  [(CBAdvertiserDaemon *)self _wiproxAppendDescription:&location context:&self->_airplaySourceWiProxContext verbose:v4 < 0x1F];
  [(CBAdvertiserDaemon *)self _wiproxAppendDescription:&location context:&self->_airplayTargetWiProxContext verbose:v4 < 0x1F];
  [(CBAdvertiserDaemon *)self _wiproxAppendDescription:&location context:&self->_dsInfoWiProxContext verbose:v4 < 0x1F];
  [(CBAdvertiserDaemon *)self _wiproxAppendDescription:&location context:&self->_heySiriWiProxContext verbose:v4 < 0x1F];
  [(CBAdvertiserDaemon *)self _wiproxAppendDescription:&location context:&self->_nearbyActionV1WiProxContext verbose:v4 < 0x1F];
  [(CBAdvertiserDaemon *)self _wiproxAppendDescription:&location context:&self->_nearbyActionV2WiProxContext verbose:v4 < 0x1F];
  [(CBAdvertiserDaemon *)self _wiproxAppendDescription:&location context:&self->_nearbyInfoWiProxContext verbose:v4 < 0x1F];
  [(CBAdvertiserDaemon *)self _wiproxAppendDescription:&location context:&self->_nearbyInfoV2WiProxContext verbose:v4 < 0x1F];
  [(CBAdvertiserDaemon *)self _wiproxAppendDescription:&location context:&self->_nearbyActionNoWakeWiProxContext verbose:v4 < 0x1F];
  [(CBAdvertiserDaemon *)self _wiproxAppendDescription:&location context:&self->_spatialInteractionWiProxContext verbose:v4 < 0x1F];
  saAdvAddresses = self->_saAdvAddresses;
  if (saAdvAddresses)
  {
    id v44 = location;
    v14 = saAdvAddresses;
    v29 = CUPrintNSObjectOneLine();
    NSAppendPrintF_safe();
    objc_storeStrong(&location, v44);
  }
  saPayloadSegments = self->_saPayloadSegments;
  if (saPayloadSegments)
  {
    id obj = location;
    objc_super v16 = saPayloadSegments;
    v17 = CUPrintNSObjectOneLine();
    NSAppendPrintF_safe();
    objc_storeStrong(&location, obj);
  }
  if (self->_spatialInteractionFlags)
  {
    id v42 = location;
    v30 = CUPrintFlags32();
    NSAppendPrintF_safe();
    objc_storeStrong(&location, v42);
  }
  spatialInteractionIdentifiers = self->_spatialInteractionIdentifiers;
  if (spatialInteractionIdentifiers)
  {
    id v41 = location;
    v19 = spatialInteractionIdentifiers;
    v31 = CUPrintNSObjectOneLine();
    NSAppendPrintF_safe();
    objc_storeStrong(&location, v41);
  }
  spatialInteractionPayloadData = self->_spatialInteractionPayloadData;
  if (spatialInteractionPayloadData)
  {
    id v40 = location;
    v32 = spatialInteractionPayloadData;
    NSAppendPrintF_safe();
    objc_storeStrong(&location, v40);
  }
  spatialInteractionUWBConfigData = self->_spatialInteractionUWBConfigData;
  if (spatialInteractionUWBConfigData)
  {
    id v39 = location;
    v33 = spatialInteractionUWBConfigData;
    NSAppendPrintF_safe();
    objc_storeStrong(&location, v39);
  }
  if (v4 <= 0x1E)
  {
    spatialInteractionWiProxUUID = self->_spatialInteractionWiProxUUID;
    if (spatialInteractionWiProxUUID)
    {
      id v38 = location;
      v34 = spatialInteractionWiProxUUID;
      NSAppendPrintF_safe();
      objc_storeStrong(&location, v38);
    }
  }
  watchSetupPayloadData = self->_watchSetupPayloadData;
  if (watchSetupPayloadData)
  {
    id v37 = location;
    v24 = watchSetupPayloadData;
    v25 = CUPrintNSDataHex();
    NSAppendPrintF_safe();
    objc_storeStrong(&location, v37);
  }
  id v26 = location;

  return v26;
}

- (void)advertisingAddressChanged
{
  if (dword_1009F8420 <= 30 && (dword_1009F8420 != -1 || _LogCategory_Initialize())) {
    LogPrintF_safe();
  }
  self->_addressChanged = 1;

  [(CBAdvertiserDaemon *)self _updateIfNeededWithBlock:&stru_100998920];
}

- (void)setAdvertiserArray:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100094C04;
  v5[3] = &unk_100998948;
  id v6 = [a3 copy];
  v7 = self;
  id v4 = v6;
  [(CBAdvertiserDaemon *)self _updateIfNeededWithBlock:v5];
}

- (void)setSpatialInteractionAdvertiseRate:(int)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100094D2C;
  v3[3] = &unk_100998970;
  int v4 = a3;
  v3[4] = self;
  [(CBAdvertiserDaemon *)self _updateIfNeededWithBlock:v3];
}

- (void)setSpatialInteractionFlags:(unsigned __int8)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100094DCC;
  v3[3] = &unk_100998998;
  unsigned __int8 v4 = a3;
  v3[4] = self;
  [(CBAdvertiserDaemon *)self _updateIfNeededWithBlock:v3];
}

- (void)setSpatialInteractionIdentifiers:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100094E88;
  v5[3] = &unk_100998948;
  id v6 = [a3 copy];
  v7 = self;
  id v4 = v6;
  [(CBAdvertiserDaemon *)self _updateIfNeededWithBlock:v5];
}

- (void)setSpatialInteractionUWBConfigData:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100094FD8;
  v5[3] = &unk_100998948;
  id v6 = [a3 copy];
  v7 = self;
  id v4 = v6;
  [(CBAdvertiserDaemon *)self _updateIfNeededWithBlock:v5];
}

- (void)setSpatialInteractionPresenceConfigData:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100095128;
  v5[3] = &unk_100998948;
  id v6 = [a3 copy];
  v7 = self;
  id v4 = v6;
  [(CBAdvertiserDaemon *)self _updateIfNeededWithBlock:v5];
}

- (void)activateWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (!self->_activateCalled)
  {
    self->_activateCalled = 1;
    dispatchQueue = self->_dispatchQueue;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100095294;
    v7[3] = &unk_1009989C0;
    v7[4] = self;
    id v8 = v4;
    dispatch_async(dispatchQueue, v7);
  }
}

- (void)_activateWithCompletion:(id)a3
{
  id v8 = (void (**)(id, void *))a3;
  if (self->_invalidateCalled)
  {
    id v4 = CBErrorF();
    if (dword_1009F8420 <= 90 && (dword_1009F8420 != -1 || _LogCategory_Initialize()))
    {
      v7 = CUPrintNSError();
      LogPrintF_safe();
    }
    v8[2](v8, v4);
  }
  else
  {
    if (dword_1009F8420 <= 30 && (dword_1009F8420 != -1 || _LogCategory_Initialize()))
    {
      uint64_t clientID = self->_clientID;
      LogPrintF_safe();
    }
    if (!self->_wiproxObservering)
    {
      v5 = +[NSNotificationCenter defaultCenter];
      [v5 addObserver:self selector:"_wiproxChanged:" name:@"WPDaemonServerStateChanged" object:0];
      self->_wiproxObservering = 1;
    }
    [(CBAdvertiserDaemon *)self _update];
    v8[2](v8, 0);
  }
}

- (void)invalidate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000954D0;
  block[3] = &unk_100997230;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_invalidate
{
  if (self->_wiproxObservering)
  {
    v3 = +[NSNotificationCenter defaultCenter];
    [v3 removeObserver:self name:@"WPDaemonServerStateChanged" object:0];
    self->_wiproxObservering = 0;
  }
  id v11 = [(id)qword_100A147E0 advertisingManager];
  [(CBStackBLEAdvertiser *)self->_fidoStackAdvertiser invalidate];
  fidoStackAdvertiser = self->_fidoStackAdvertiser;
  self->_fidoStackAdvertiser = 0;

  [(CBAdvertiserDaemon *)self _wiProxInvalidate:&self->_airdropWiProxContext];
  [(CBAdvertiserDaemon *)self _wiProxInvalidate:&self->_airplaySourceWiProxContext];
  [(CBAdvertiserDaemon *)self _wiProxInvalidate:&self->_airplayTargetWiProxContext];
  [(CBAdvertiserDaemon *)self _wiProxInvalidate:&self->_dsInfoWiProxContext];
  [(CBAdvertiserDaemon *)self _wiProxInvalidate:&self->_heySiriWiProxContext];
  [(CBAdvertiserDaemon *)self _wiProxInvalidate:&self->_nearbyActionV1WiProxContext];
  [(CBAdvertiserDaemon *)self _wiProxInvalidate:&self->_nearbyActionV2WiProxContext];
  [(CBAdvertiserDaemon *)self _wiProxInvalidate:&self->_nearbyInfoWiProxContext];
  [(CBAdvertiserDaemon *)self _wiProxInvalidate:&self->_nearbyInfoV2WiProxContext];
  [(CBAdvertiserDaemon *)self _wiProxInvalidate:&self->_nearbyActionNoWakeWiProxContext];
  [(CBAdvertiserDaemon *)self _wiProxInvalidate:&self->_spatialInteractionWiProxContext];
  [(CBStackBLEAdvertiser *)self->_saStackAdvertiser invalidate];
  saStackAdvertiser = self->_saStackAdvertiser;
  self->_saStackAdvertiser = 0;

  id v6 = self->_spatialInteractionWiProxUUID;
  v7 = self->_spatialInteractionAdvertisingRequest;
  if (v7)
  {
    if (v11 && v6)
    {
      if (dword_1009F8420 <= 30 && (dword_1009F8420 != -1 || _LogCategory_Initialize())) {
        LogPrintF_safe();
      }
      [v11 removeAdvertisingRequest:v7 forDaemon:v6];
    }
    spatialInteractionAdvertisingRequest = self->_spatialInteractionAdvertisingRequest;
    self->_spatialInteractionAdvertisingRequest = 0;
  }
  [(CBStackBLEAdvertiser *)self->_appleTypeStackAdvertiser invalidate];
  appleTypeStackAdvertiser = self->_appleTypeStackAdvertiser;
  self->_appleTypeStackAdvertiser = 0;

  [(CBStackBLEAdvertiser *)self->_watchSetupStackAdvertiser invalidate];
  watchSetupStackAdvertiser = self->_watchSetupStackAdvertiser;
  self->_watchSetupStackAdvertiser = 0;

  [(CBAdvertiserDaemon *)self _invalidated];
}

- (void)_invalidated
{
  if (self->_invalidateCalled && !self->_invalidateDone)
  {
    self->_invalidateCalled = 1;
    id v7 = objc_retainBlock(self->_invalidationHandler);
    id invalidationHandler = self->_invalidationHandler;
    self->_id invalidationHandler = 0;

    id stateChangedHandler = self->_stateChangedHandler;
    self->_id stateChangedHandler = 0;

    v5 = v7;
    if (v7)
    {
      (*((void (**)(id))v7 + 2))(v7);
      v5 = v7;
    }
    self->_invalidateDone = 1;
    if (dword_1009F8420 <= 30)
    {
      if (dword_1009F8420 != -1 || (int v6 = _LogCategory_Initialize(), v5 = v7, v6))
      {
        LogPrintF_safe();
        v5 = v7;
      }
    }
  }
}

- (BOOL)needsToRun
{
  return self->_airdropWiProxContext.payloadData
      || self->_airplaySourceWiProxContext.payloadData
      || self->_airplayTargetWiProxContext.payloadData
      || self->_nearbyActionV1WiProxContext.payloadData
      || self->_nearbyActionV2WiProxContext.payloadData
      || self->_nearbyInfoWiProxContext.payloadData
      || self->_nearbyInfoV2WiProxContext.payloadData
      || self->_nearbyActionNoWakeWiProxContext.payloadData
      || [(NSArray *)self->_saPayloadSegments count] != 0;
}

- (void)_updateIfNeededWithBlock:(id)a3
{
  if ((*((unsigned int (**)(id, SEL))a3 + 2))(a3, a2) && self->_activateCalled && !self->_changesPending)
  {
    self->_changesPending = 1;
    dispatchQueue = self->_dispatchQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000959A8;
    block[3] = &unk_100997230;
    block[4] = self;
    dispatch_async(dispatchQueue, block);
  }
}

- (void)_update
{
  if (!self->_invalidateCalled)
  {
    if (self->_changesPending)
    {
      self->_changesPending = 0;
      [(CBAdvertiserDaemon *)self _updateFIDOPayload];
      [(CBAdvertiserDaemon *)self _updateAirDropPayload:&self->_airdropWiProxContext];
      [(CBAdvertiserDaemon *)self _updateAirPlaySourcePayload:&self->_airplaySourceWiProxContext];
      [(CBAdvertiserDaemon *)self _updateAirPlayTargetPayload:&self->_airplayTargetWiProxContext];
      [(CBAdvertiserDaemon *)self _updateDSInfoPayload:&self->_dsInfoWiProxContext];
      [(CBAdvertiserDaemon *)self _updateHeySiriPayload:&self->_heySiriWiProxContext];
      [(CBAdvertiserDaemon *)self _updateNearbyActionV1Payload:&self->_nearbyActionV1WiProxContext];
      [(CBAdvertiserDaemon *)self _updateNearbyActionV2Payload:&self->_nearbyActionV2WiProxContext];
      [(CBAdvertiserDaemon *)self _updateNearbyInfoPayload:&self->_nearbyInfoWiProxContext];
      [(CBAdvertiserDaemon *)self _updateNearbyInfoV2Payload:&self->_nearbyInfoV2WiProxContext];
      [(CBAdvertiserDaemon *)self _updateNearbyActionNoWakePayload:&self->_nearbyActionNoWakeWiProxContext];
      if (_os_feature_enabled_impl() && GestaltGetDeviceClass() == 1) {
        [(CBAdvertiserDaemon *)self _updateSafetyAlertsPayload];
      }
      [(CBAdvertiserDaemon *)self _updateSpatialInteractionPayload:&self->_spatialInteractionWiProxContext];
      [(CBAdvertiserDaemon *)self _updateWatchSetupPayload];
    }
    [(CBAdvertiserDaemon *)self _updateFIDOAdvertising];
    [(CBAdvertiserDaemon *)self _wiProxUpdateAdvertising:&self->_airdropWiProxContext];
    [(CBAdvertiserDaemon *)self _wiProxUpdateAdvertising:&self->_airplaySourceWiProxContext];
    [(CBAdvertiserDaemon *)self _wiProxUpdateAdvertising:&self->_airplayTargetWiProxContext];
    [(CBAdvertiserDaemon *)self _wiProxUpdateAdvertising:&self->_dsInfoWiProxContext];
    [(CBAdvertiserDaemon *)self _wiProxUpdateAdvertising:&self->_heySiriWiProxContext];
    [(CBAdvertiserDaemon *)self _wiProxUpdateAdvertising:&self->_nearbyActionV1WiProxContext];
    [(CBAdvertiserDaemon *)self _wiProxUpdateAdvertising:&self->_nearbyActionV2WiProxContext];
    [(CBAdvertiserDaemon *)self _wiProxUpdateAdvertising:&self->_nearbyInfoWiProxContext];
    [(CBAdvertiserDaemon *)self _wiProxUpdateAdvertising:&self->_nearbyInfoV2WiProxContext];
    if (_os_feature_enabled_impl() && GestaltGetDeviceClass() == 1) {
      [(CBAdvertiserDaemon *)self _updateSafetyAlertsAdvertising];
    }
    [(CBAdvertiserDaemon *)self _updateSpatialInteractionAdvertising:&self->_spatialInteractionWiProxContext];
    [(CBAdvertiserDaemon *)self _wiProxUpdateAdvertising:&self->_nearbyActionNoWakeWiProxContext];
    [(CBAdvertiserDaemon *)self _updateWatchSetupAdvertising];
    self->_addressChanged = 0;
    if (self->_stateChanged)
    {
      self->_stateChanged = 0;
      v3 = (void (**)(void))objc_retainBlock(self->_stateChangedHandler);
      if (v3)
      {
        id v4 = v3;
        v3[2]();
        v3 = v4;
      }
    }
  }
}

- (id)_encryptInvitationPayload:(const void *)a3 payloadLength:(unint64_t)a4 authTag:(id)a5 irkData:(id)a6 keyInfo:(const void *)a7 keyInfoLength:(unint64_t)a8
{
  id v11 = a5;
  id v12 = a6;
  if (!a3) {
    goto LABEL_33;
  }
  if (![v11 length])
  {
    if (dword_1009F8420 > 90 || dword_1009F8420 == -1 && !_LogCategory_Initialize()) {
      goto LABEL_33;
    }
LABEL_19:
    LogPrintF_safe();
LABEL_33:
    v17 = 0;
    goto LABEL_11;
  }
  if (![v12 length])
  {
    if (dword_1009F8420 > 90 || dword_1009F8420 == -1 && !_LogCategory_Initialize()) {
      goto LABEL_33;
    }
    goto LABEL_19;
  }
  if (a4 >= 2) {
    a4 = 2;
  }
  long long v25 = 0u;
  long long v26 = 0u;
  id v20 = v12;
  id v13 = v12;
  [v13 bytes];
  [v13 length];
  id v14 = v11;
  id v15 = v11;
  [v15 bytes];
  [v15 length];
  CryptoHKDF();
  __int16 v24 = 0;
  __memcpy_chk();
  ccaes_ecb_encrypt_mode();
  uint64_t v16 = ccecb_context_size();
  bzero((char *)&v19 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0), (v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (ccecb_init())
  {
    if (dword_1009F8420 > 90)
    {
      v17 = 0;
      id v11 = v14;
      goto LABEL_10;
    }
    id v11 = v14;
    if (dword_1009F8420 != -1 || _LogCategory_Initialize()) {
      LogPrintF_safe();
    }
    goto LABEL_35;
  }
  uint64_t v23 = 0;
  long long v21 = 0u;
  long long v22 = 0u;
  if (cclr_aes_init())
  {
    id v11 = v14;
    if (dword_1009F8420 <= 90)
    {
      id v12 = v20;
      if (dword_1009F8420 == -1 && !_LogCategory_Initialize()) {
        goto LABEL_39;
      }
      goto LABEL_28;
    }
LABEL_35:
    v17 = 0;
    goto LABEL_10;
  }
  id v11 = v14;
  if (!cclr_encrypt_block())
  {
    ccecb_context_size();
    cc_clear();
    v17 = +[NSData dataWithBytes:&v24 length:a4];
LABEL_10:
    id v12 = v20;
    goto LABEL_11;
  }
  id v12 = v20;
  if (dword_1009F8420 > 90 || dword_1009F8420 == -1 && !_LogCategory_Initialize()) {
    goto LABEL_39;
  }
LABEL_28:
  LogPrintF_safe();
LABEL_39:
  v17 = 0;
LABEL_11:

  return v17;
}

- (void)_stackAppleTypeUpdateAdvertising:(id *)a3
{
  id v5 = a3->var10;
  p_appleTypeStackAdvertiser = &self->_appleTypeStackAdvertiser;
  appleTypeStackAdvertiser = self->_appleTypeStackAdvertiser;
  id v24 = v5;
  if (!v5)
  {
    if (!appleTypeStackAdvertiser)
    {
LABEL_65:
      a3->var7 = 0;
      goto LABEL_66;
    }
    if (dword_1009F8420 <= 30 && (dword_1009F8420 != -1 || _LogCategory_Initialize()))
    {
      id var2 = a3->var2;
      LogPrintF_safe();
    }
    [(CBStackBLEAdvertiser *)*p_appleTypeStackAdvertiser invalidate];
    uint64_t v9 = *p_appleTypeStackAdvertiser;
    *p_appleTypeStackAdvertiser = 0;
LABEL_64:

    goto LABEL_65;
  }
  id v8 = appleTypeStackAdvertiser;
  if (v8)
  {
    uint64_t v9 = v8;
    if (dword_1009F8420 > 30 || dword_1009F8420 == -1 && !_LogCategory_Initialize()) {
      goto LABEL_61;
    }
    id v10 = a3->var2;
    uint64_t v11 = CUPrintNSDataHex();
    id v12 = (void *)v11;
    int var5 = a3->var5;
    if (var5 <= 39)
    {
      if (var5 > 19)
      {
        if (var5 == 20)
        {
          id v14 = "350 ms";
          goto LABEL_52;
        }
      }
      else
      {
        if (var5 == 10)
        {
          id v14 = "2 seconds";
          goto LABEL_52;
        }
        if (var5 == 15)
        {
          id v14 = "1022.5 ms";
          goto LABEL_52;
        }
      }
    }
    else if (var5 <= 44)
    {
      if (var5 == 40)
      {
        id v14 = "181.25 ms";
        goto LABEL_52;
      }
      if (var5 == 42)
      {
        id v14 = "120 ms";
        goto LABEL_52;
      }
    }
    else
    {
      switch(var5)
      {
        case '-':
          id v14 = "60 ms";
          goto LABEL_52;
        case '2':
          id v14 = "30 ms";
          goto LABEL_52;
        case '<':
          id v14 = "20 ms";
LABEL_52:
          uint64_t v22 = v11;
          uint64_t v23 = v14;
          id var2 = v10;
          LogPrintF_safe();

LABEL_61:
          -[CBStackBLEAdvertiser setAdvertiseRate:](v9, "setAdvertiseRate:", a3->var5, var2, v22, v23);
          [(CBStackBLEAdvertiser *)v9 setAdvertiseEnableEPA:a3->var4];
          if (a3->var3 == 15) {
            [(CBStackBLEAdvertiser *)v9 setNearbyActionData:v24];
          }
          [(CBStackBLEAdvertiser *)v9 activate];
          goto LABEL_64;
      }
    }
    id v14 = "270 ms";
    goto LABEL_52;
  }
  if (dword_1009F8420 <= 30 && (dword_1009F8420 != -1 || _LogCategory_Initialize()))
  {
    id v15 = a3->var2;
    uint64_t v16 = CUPrintNSDataHex();
    v17 = (void *)v16;
    int v18 = a3->var5;
    if (v18 <= 39)
    {
      if (v18 > 19)
      {
        if (v18 == 20)
        {
          uint64_t v19 = "350 ms";
          goto LABEL_58;
        }
      }
      else
      {
        if (v18 == 10)
        {
          uint64_t v19 = "2 seconds";
          goto LABEL_58;
        }
        if (v18 == 15)
        {
          uint64_t v19 = "1022.5 ms";
          goto LABEL_58;
        }
      }
    }
    else if (v18 <= 44)
    {
      if (v18 == 40)
      {
        uint64_t v19 = "181.25 ms";
        goto LABEL_58;
      }
      if (v18 == 42)
      {
        uint64_t v19 = "120 ms";
        goto LABEL_58;
      }
    }
    else
    {
      switch(v18)
      {
        case '-':
          uint64_t v19 = "60 ms";
          goto LABEL_58;
        case '2':
          uint64_t v19 = "30 ms";
          goto LABEL_58;
        case '<':
          uint64_t v19 = "20 ms";
LABEL_58:
          uint64_t v22 = v16;
          uint64_t v23 = v19;
          id var2 = v15;
          LogPrintF_safe();

          goto LABEL_59;
      }
    }
    uint64_t v19 = "270 ms";
    goto LABEL_58;
  }
LABEL_59:
  [(CBStackAdaptor *)self->_stackAdaptor bleAdvertiserClass];
  id v20 = (CBStackBLEAdvertiser *)objc_alloc_init((Class)objc_opt_class());
  if (v20)
  {
    uint64_t v9 = v20;
    objc_storeStrong((id *)&self->_appleTypeStackAdvertiser, v20);
    [(CBStackBLEAdvertiser *)v9 setDispatchQueue:self->_dispatchQueue];
    goto LABEL_61;
  }
  if (dword_1009F8420 <= 90 && (dword_1009F8420 != -1 || _LogCategory_Initialize())) {
    LogPrintF_safe();
  }
LABEL_66:
}

- (void)_wiproxAppendDescription:(id *)a3 context:(id *)a4 verbose:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a4->var10;
  if (v8)
  {
    id v16 = *a3;
    id v9 = *a3;
    id v10 = CUPrintNSDataHex();
    NSAppendPrintF_safe();
    id v11 = v16;

    if (v5)
    {
      id var11 = a4->var11;
      if (var11)
      {
        id v15 = var11;
        NSAppendPrintF_safe();
        id v13 = v11;

        id v11 = v13;
      }
    }
    id v14 = *a3;
    *a3 = v11;
  }
}

- (void)_wiproxChanged:(id)a3
{
  id v4 = a3;
  if (dword_1009F8420 <= 30 && (dword_1009F8420 != -1 || _LogCategory_Initialize())) {
    LogPrintF_safe();
  }
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100096698;
  block[3] = &unk_100997230;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_wiProxInvalidate:(id *)a3
{
  if (a3->var8 && dword_1009F8420 <= 30 && (dword_1009F8420 != -1 || _LogCategory_Initialize()))
  {
    id var2 = a3->var2;
    LogPrintF_safe();
  }
  a3->var8 = 0;
  id var9 = a3->var9;
  if (var9)
  {
    BOOL v5 = var9;
    dispatch_source_cancel(v5);
    id v6 = a3->var9;
    a3->id var9 = 0;
  }
  id v13 = a3->var11;
  id v7 = a3->var6;
  if (v7)
  {
    id v8 = [(id)qword_100A147E0 advertisingManager];
    if (v8) {
      BOOL v9 = v13 == 0;
    }
    else {
      BOOL v9 = 1;
    }
    if (!v9)
    {
      if (dword_1009F8420 <= 30 && (dword_1009F8420 != -1 || _LogCategory_Initialize()))
      {
        id v12 = a3->var2;
        LogPrintF_safe();
        [v8 removeAdvertisingRequest:v7 forDaemon:v13];
      }
      else
      {
        [v8 removeAdvertisingRequest:v7 forDaemon:v13];
      }
    }
    id var6 = a3->var6;
    a3->id var6 = 0;
  }
}

- (void)_wiProxUpdateAdvertising:(id *)a3
{
  if (a3->var7 || self->_addressChanged)
  {
    if ([(CBDaemonServer *)self->_daemonServer prefWiProxAdvertising]
      && ([(id)qword_100A147E0 advertisingManager],
          (BOOL v5 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      id v29 = v5;
      if ([v5 state] == (id)3)
      {
        id v6 = a3->var11;
        if (!v6)
        {
          id v6 = +[NSUUID UUID];
          objc_storeStrong(&a3->var11, v6);
        }
        id v7 = a3->var10;
        p_id var6 = &a3->var6;
        id v9 = a3->var6;
        if (v9)
        {
          if (v7) {
            id v10 = "for restart";
          }
          else {
            id v10 = "";
          }
          if (dword_1009F8420 < 31 && (dword_1009F8420 != -1 || _LogCategory_Initialize()))
          {
            if (self->_addressChanged) {
              id v11 = "for address change";
            }
            else {
              id v11 = v10;
            }
            id var2 = a3->var2;
            v27 = v11;
            LogPrintF_safe();
          }
          [v29 removeAdvertisingRequest:v9 forDaemon:v6 var2:v27];
          id v13 = *p_var6;
          *p_id var6 = 0;
        }
        if (v7)
        {
          id v14 = +[WPAdvertisingRequest requestForClientType:a3->var3];
          objc_storeStrong(&a3->var6, v14);
          [v14 setAdvertisingData:v7];
          int var5 = a3->var5;
          uint64_t v16 = 290;
          uint64_t v17 = 48;
          uint64_t v18 = 32;
          if (var5 != 60) {
            uint64_t v18 = 290;
          }
          if (var5 != 50) {
            uint64_t v17 = v18;
          }
          uint64_t v19 = 192;
          uint64_t v20 = 96;
          if (var5 != 45) {
            uint64_t v20 = 290;
          }
          if (var5 != 42) {
            uint64_t v19 = v20;
          }
          if (var5 <= 49) {
            uint64_t v17 = v19;
          }
          uint64_t v21 = 996;
          uint64_t v22 = 432;
          if (var5 != 30) {
            uint64_t v22 = 290;
          }
          if (var5 != 20) {
            uint64_t v21 = v22;
          }
          if (var5 == 15) {
            uint64_t v16 = 1636;
          }
          if (var5 == 10) {
            uint64_t v16 = 3200;
          }
          if (var5 > 19) {
            uint64_t v16 = v21;
          }
          if (var5 <= 41) {
            uint64_t v23 = v16;
          }
          else {
            uint64_t v23 = v17;
          }
          [v14 setAdvertisingRate:v23];
          [v14 setConnectable:a3->var0];
          [v14 setIsRanging:a3->var1];
          [v14 setEnableEPAForAdvertising:a3->var4];
          [v14 setStopOnAdvertisingAddressChange:1];
          if (dword_1009F8420 <= 30 && (dword_1009F8420 != -1 || _LogCategory_Initialize()))
          {
            id v24 = a3->var2;
            CUPrintNSDataHex();
            long long v25 = (char *)objc_claimAutoreleasedReturnValue();
            double v28 = (double)(uint64_t)[v14 advertisingRate] * 0.625;
            id var2 = v24;
            v27 = v25;
            LogPrintF_safe();
          }
          [v29 addAdvertisingRequest:v14 forDaemon:v6 var2:v27 v28];
        }
        a3->var7 = 0;
      }
      else if (dword_1009F8420 <= 30 && (dword_1009F8420 != -1 || _LogCategory_Initialize()))
      {
        LogPrintF_safe();
      }
      id v12 = v29;
    }
    else
    {
      if (a3->var3 == 15) {
        [(CBAdvertiserDaemon *)self _stackAppleTypeUpdateAdvertising:a3];
      }
      id v12 = 0;
    }
  }
}

- (BOOL)_wiProxUpdateLinger:(id *)a3 active:(BOOL)a4
{
  if (a4)
  {
    if (a3->var8 && dword_1009F8420 <= 30 && (dword_1009F8420 != -1 || _LogCategory_Initialize())) {
      LogPrintF_safe();
    }
    a3->var8 = 0;
    id var9 = a3->var9;
    if (var9)
    {
      id v8 = var9;
      dispatch_source_cancel(v8);
      id v9 = a3->var9;
      a3->id var9 = 0;
    }
    return 0;
  }
  if (a3->var8)
  {
    if (!a3->var9)
    {
      if (dword_1009F8420 <= 30 && (dword_1009F8420 != -1 || _LogCategory_Initialize())) {
        LogPrintF_safe();
      }
      BOOL v6 = 0;
      a3->var8 = 0;
      self->_stateChanged = 1;
      return v6;
    }
    return 1;
  }
  if (!a3->var10) {
    return 0;
  }
  if (a3->var9) {
    return 1;
  }
  if (dword_1009F8420 <= 30 && (dword_1009F8420 != -1 || _LogCategory_Initialize())) {
    LogPrintF_safe();
  }
  BOOL v6 = 1;
  a3->var8 = 1;
  dispatch_source_t v11 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)self->_dispatchQueue);
  id v12 = a3->var9;
  a3->id var9 = v11;
  id v13 = v11;

  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_100096EBC;
  handler[3] = &unk_1009989E8;
  handler[5] = self;
  handler[6] = a3;
  handler[4] = v13;
  dispatch_source_set_event_handler(v13, handler);
  CUDispatchTimerSet();
  dispatch_activate(v13);

  return v6;
}

- (void)_wiProxUpdatePayload:(id *)a3 payloadData:(id)a4 advertiseRate:(int)a5 advertiseEnableEPA:(BOOL)a6
{
  id v10 = a4;
  id var10 = a3->var10;
  id v17 = v10;
  id v12 = var10;
  if (v12 == v17)
  {
  }
  else
  {
    if ((v17 == 0) == (v12 != 0))
    {

      goto LABEL_11;
    }
    unsigned int v13 = [v17 isEqual:v12];

    if (!v13)
    {
LABEL_11:
      if (dword_1009F8420 <= 30 && (dword_1009F8420 != -1 || _LogCategory_Initialize()))
      {
        id v14 = CUPrintNSDataHex();
        id v15 = CUPrintNSDataHex();
        LogPrintF_safe();
      }
      a3->int var5 = a5;
      objc_storeStrong(&a3->var10, a4);
      a3->var7 = 1;
      a3->var4 = a6;
      goto LABEL_19;
    }
  }
  if (a3->var5 != a5) {
    goto LABEL_11;
  }
  if (dword_1009F8420 <= 10 && (dword_1009F8420 != -1 || _LogCategory_Initialize()))
  {
    uint64_t v16 = CUPrintNSDataHex();
    LogPrintF_safe();
  }
LABEL_19:
}

- (void)_updateAirPlaySourcePayload:(id *)a3
{
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  BOOL v5 = self->_advertiserArray;
  id v6 = [(NSArray *)v5 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v23;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v23 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        unsigned int v11 = [v10 airplaySourceFlags];
        if (v11)
        {
          char v17 = v11;
          id v14 = [v10 airplaySourceUWBConfigData];
          id v15 = [v10 advertiseRate];
          unsigned int v13 = [v10 airplaySourceAuthTagData];

          id v16 = objc_alloc_init((Class)NSMutableData);
          if ([v13 length] == (id)3) {
            char v18 = v17 | 0x10;
          }
          else {
            char v18 = v17 & 0xEF;
          }
          char v21 = v18;
          [v16 appendBytes:&v21 length:1];
          if ((v18 & 8) != 0 && [v14 length] == (id)1) {
            [v16 appendData:v14];
          }
          if ([v13 length] == (id)3) {
            [v16 appendData:v13];
          }
          uint64_t v12 = 1;
          goto LABEL_19;
        }
      }
      id v7 = [(NSArray *)v5 countByEnumeratingWithState:&v22 objects:v26 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }

  uint64_t v12 = 0;
  unsigned int v13 = 0;
  id v14 = 0;
  id v15 = 0;
  id v16 = 0;
LABEL_19:
  if ([(CBAdvertiserDaemon *)self _wiProxUpdateLinger:a3 active:v12])
  {
    char v20 = 0x80;
    id v19 = [objc_alloc((Class)NSData) initWithBytes:&v20 length:1];

    id v16 = v19;
  }
  [(CBAdvertiserDaemon *)self _wiProxUpdatePayload:a3 payloadData:v16 advertiseRate:v15 advertiseEnableEPA:0];
}

- (void)_updateAirPlayTargetPayload:(id *)a3
{
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  BOOL v5 = self->_advertiserArray;
  id v6 = [(NSArray *)v5 countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v22;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v22 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        unsigned int v11 = [v10 airplayTargetFlags:v21];
        if (v11)
        {
          unsigned __int8 v15 = v11;
          unsigned __int8 v16 = [v10 airplayTargetConfigSeed];
          unsigned int v17 = [v10 airplayTargetIPv4];
          unsigned int v18 = [v10 airplayTargetPort];
          id v13 = [v10 advertiseRate];

          uint64_t v25 = v15;
          BYTE1(v25) = v16;
          BYTE2(v25) = HIBYTE(v17);
          BYTE3(v25) = BYTE2(v17);
          BYTE4(v25) = BYTE1(v17);
          BYTE5(v25) = v17;
          if ((v15 & 0x10) != 0)
          {
            HIWORD(v25) = __rev16(v18);
            uint64_t v19 = 8;
          }
          else
          {
            uint64_t v19 = 6;
          }
          id v14 = [objc_alloc((Class)NSData) initWithBytes:&v25 length:v19];
          uint64_t v12 = 1;
          goto LABEL_14;
        }
      }
      id v7 = [(NSArray *)v5 countByEnumeratingWithState:&v21 objects:v26 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }

  uint64_t v12 = 0;
  id v13 = 0;
  id v14 = 0;
LABEL_14:
  if (-[CBAdvertiserDaemon _wiProxUpdateLinger:active:](self, "_wiProxUpdateLinger:active:", a3, v12, (void)v21))
  {
    LOBYTE(v25) = 0x80;
    id v20 = [objc_alloc((Class)NSData) initWithBytes:&v25 length:1];

    id v14 = v20;
  }
  [(CBAdvertiserDaemon *)self _wiProxUpdatePayload:a3 payloadData:v14 advertiseRate:v13 advertiseEnableEPA:0];
}

- (void)_updateDSInfoPayload:(id *)a3
{
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  BOOL v5 = self->_advertiserArray;
  id v6 = [(NSArray *)v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v16;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v5);
        }
        id v9 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        unsigned int v10 = [v9 dsInfoVehicleConfidence];
        unsigned int v11 = [v9 dsInfoVehicleState];
        if (v10 | v11)
        {
          unsigned int v12 = v11;
          id v6 = [v9 advertiseRate];
          goto LABEL_11;
        }
      }
      id v6 = [(NSArray *)v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  unsigned int v10 = 0;
  unsigned int v12 = 0;
LABEL_11:

  if (v10 | v12)
  {
    char v14 = v12 & 3 | (4 * (v10 & 0xF));
    id v13 = [objc_alloc((Class)NSData) initWithBytes:&v14 length:1];
  }
  else
  {
    id v13 = 0;
  }
  [(CBAdvertiserDaemon *)self _wiProxUpdatePayload:a3 payloadData:v13 advertiseRate:v6 advertiseEnableEPA:0];
}

- (void)_updateFIDOAdvertising
{
  if (self->_fidoChanged)
  {
    v3 = self->_fidoPayloadData;
    if (!v3)
    {
      if (dword_1009F8420 <= 30 && (dword_1009F8420 != -1 || _LogCategory_Initialize())) {
        LogPrintF_safe();
      }
      [(CBStackBLEAdvertiser *)self->_fidoStackAdvertiser invalidate];
      fidoStackAdvertiser = self->_fidoStackAdvertiser;
      self->_fidoStackAdvertiser = 0;

      goto LABEL_62;
    }
    id v4 = self->_fidoStackAdvertiser;
    if (v4)
    {
      BOOL v5 = v4;
      if (dword_1009F8420 > 30 || dword_1009F8420 == -1 && !_LogCategory_Initialize()) {
        goto LABEL_61;
      }
      uint64_t v6 = CUPrintNSDataHex();
      uint64_t v7 = (void *)v6;
      int fidoAdvertiseRate = self->_fidoAdvertiseRate;
      if (fidoAdvertiseRate <= 39)
      {
        if (fidoAdvertiseRate > 19)
        {
          if (fidoAdvertiseRate == 20)
          {
            id v9 = "350 ms";
            goto LABEL_52;
          }
        }
        else
        {
          if (fidoAdvertiseRate == 10)
          {
            id v9 = "2 seconds";
            goto LABEL_52;
          }
          if (fidoAdvertiseRate == 15)
          {
            id v9 = "1022.5 ms";
            goto LABEL_52;
          }
        }
      }
      else if (fidoAdvertiseRate <= 44)
      {
        if (fidoAdvertiseRate == 40)
        {
          id v9 = "181.25 ms";
          goto LABEL_52;
        }
        if (fidoAdvertiseRate == 42)
        {
          id v9 = "120 ms";
          goto LABEL_52;
        }
      }
      else
      {
        switch(fidoAdvertiseRate)
        {
          case '-':
            id v9 = "60 ms";
            goto LABEL_52;
          case '2':
            id v9 = "30 ms";
            goto LABEL_52;
          case '<':
            id v9 = "20 ms";
LABEL_52:
            uint64_t v18 = v6;
            uint64_t v19 = v9;
            LogPrintF_safe();

LABEL_61:
            -[CBStackBLEAdvertiser setAdvertiseRate:](v5, "setAdvertiseRate:", self->_fidoAdvertiseRate, v18, v19);
            id v16 = objc_alloc_init((Class)CBBLEServiceDataInfo);
            [v16 setServiceUUID16:65529];
            [v16 setServiceData:v3];
            id v20 = v16;
            long long v17 = +[NSArray arrayWithObjects:&v20 count:1];
            [(CBStackBLEAdvertiser *)v5 setServiceDataArray:v17];

            [(CBStackBLEAdvertiser *)v5 activate];
LABEL_62:
            self->_fidoChanged = 0;
LABEL_63:

            return;
        }
      }
      id v9 = "270 ms";
      goto LABEL_52;
    }
    if (dword_1009F8420 > 30 || dword_1009F8420 == -1 && !_LogCategory_Initialize())
    {
LABEL_59:
      [(CBStackAdaptor *)self->_stackAdaptor bleAdvertiserClass];
      long long v15 = (CBStackBLEAdvertiser *)objc_alloc_init((Class)objc_opt_class());
      if (!v15)
      {
        if (dword_1009F8420 <= 90 && (dword_1009F8420 != -1 || _LogCategory_Initialize())) {
          LogPrintF_safe();
        }
        goto LABEL_63;
      }
      BOOL v5 = v15;
      objc_storeStrong((id *)&self->_fidoStackAdvertiser, v15);
      [(CBStackBLEAdvertiser *)v5 setDispatchQueue:self->_dispatchQueue];
      goto LABEL_61;
    }
    uint64_t v10 = CUPrintNSDataHex();
    unsigned int v11 = (void *)v10;
    int v12 = self->_fidoAdvertiseRate;
    if (v12 <= 39)
    {
      if (v12 > 19)
      {
        if (v12 == 20)
        {
          id v13 = "350 ms";
          goto LABEL_58;
        }
      }
      else
      {
        if (v12 == 10)
        {
          id v13 = "2 seconds";
          goto LABEL_58;
        }
        if (v12 == 15)
        {
          id v13 = "1022.5 ms";
          goto LABEL_58;
        }
      }
    }
    else if (v12 <= 44)
    {
      if (v12 == 40)
      {
        id v13 = "181.25 ms";
        goto LABEL_58;
      }
      if (v12 == 42)
      {
        id v13 = "120 ms";
        goto LABEL_58;
      }
    }
    else
    {
      switch(v12)
      {
        case '-':
          id v13 = "60 ms";
          goto LABEL_58;
        case '2':
          id v13 = "30 ms";
          goto LABEL_58;
        case '<':
          id v13 = "20 ms";
LABEL_58:
          uint64_t v18 = v10;
          uint64_t v19 = v13;
          LogPrintF_safe();

          goto LABEL_59;
      }
    }
    id v13 = "270 ms";
    goto LABEL_58;
  }
}

- (void)_updateFIDOPayload
{
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  v3 = self->_advertiserArray;
  id v4 = [(NSArray *)v3 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v19;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v19 != v5) {
          objc_enumerationMutation(v3);
        }
        uint64_t v7 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        uint64_t v8 = [v7 fidoPayloadData];
        if (v8)
        {
          id v9 = (void *)v8;
          LODWORD(v4) = [v7 advertiseRate];
          goto LABEL_11;
        }
      }
      id v4 = [(NSArray *)v3 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
  id v9 = 0;
LABEL_11:

  fidoPayloadData = self->_fidoPayloadData;
  unsigned int v11 = v9;
  int v12 = fidoPayloadData;
  if (v11 == v12)
  {
  }
  else
  {
    id v13 = v12;
    if ((v11 == 0) == (v12 != 0))
    {

      goto LABEL_21;
    }
    unsigned int v14 = [(NSData *)v11 isEqual:v12];

    if (!v14)
    {
LABEL_21:
      if (dword_1009F8420 <= 30 && (dword_1009F8420 != -1 || _LogCategory_Initialize()))
      {
        long long v15 = CUPrintNSDataHex();
        id v16 = CUPrintNSDataHex();
        LogPrintF_safe();
      }
      self->_int fidoAdvertiseRate = (int)v4;
      objc_storeStrong((id *)&self->_fidoPayloadData, v9);
      self->_fidoChanged = 1;
      goto LABEL_29;
    }
  }
  if (v4 != self->_fidoAdvertiseRate) {
    goto LABEL_21;
  }
  if (dword_1009F8420 <= 10 && (dword_1009F8420 != -1 || _LogCategory_Initialize()))
  {
    long long v17 = CUPrintNSDataHex();
    LogPrintF_safe();
  }
LABEL_29:
}

- (void)_updateHeySiriPayload:(id *)a3
{
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v5 = self->_advertiserArray;
  id v6 = [(NSArray *)v5 countByEnumeratingWithState:&v20 objects:v25 count:16];
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
        uint64_t v10 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        unsigned int v11 = [v10 heySiriDeviceClass:v20];
        if (v11)
        {
          __int16 v14 = v11;
          id v12 = [v10 advertiseRate];
          unsigned __int8 v15 = [v10 heySiriConfidence];
          unsigned __int16 v16 = (unsigned __int16)[v10 heySiriPerceptualHash];
          unsigned __int8 v17 = [v10 heySiriProductType];
          unsigned __int8 v18 = [v10 heySiriRandom];
          unsigned __int8 v19 = [v10 heySiriSNR];

          v24[0] = HIBYTE(v16);
          v24[1] = v16;
          v24[2] = v19;
          v24[3] = v15;
          v24[4] = HIBYTE(v14);
          v24[5] = v14;
          v24[6] = v18;
          v24[7] = v17;
          id v13 = [objc_alloc((Class)NSData) initWithBytes:v24 length:8];
          goto LABEL_11;
        }
      }
      id v7 = [(NSArray *)v5 countByEnumeratingWithState:&v20 objects:v25 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }

  id v12 = 0;
  id v13 = 0;
LABEL_11:
  -[CBAdvertiserDaemon _wiProxUpdatePayload:payloadData:advertiseRate:advertiseEnableEPA:](self, "_wiProxUpdatePayload:payloadData:advertiseRate:advertiseEnableEPA:", a3, v13, v12, 0, (void)v20);
}

- (void)_updateNearbyActionV1Payload:(id *)a3
{
  int v42 = 0;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  uint64_t v5 = self->_advertiserArray;
  id v6 = [(NSArray *)v5 countByEnumeratingWithState:&v38 objects:v43 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v39;
LABEL_3:
    uint64_t v8 = 0;
    while (1)
    {
      if (*(void *)v39 != v7) {
        objc_enumerationMutation(v5);
      }
      id v9 = *(void **)(*((void *)&v38 + 1) + 8 * v8);
      unsigned int v10 = [v9 nearbyActionType];
      if (v10) {
        break;
      }
      if (v6 == (id)++v8)
      {
        id v6 = [(NSArray *)v5 countByEnumeratingWithState:&v38 objects:v43 count:16];
        if (v6) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
    unsigned int v17 = v10;
    double v28 = a3;
    unsigned int v18 = [v9 nearbyActionFlags];
    __int16 v19 = v18;
    int v20 = (v18 >> 8) & 0xF;
    int v42 = v20;
    uint64_t v15 = (uint64_t)[v9 advertiseRate];
    long long v21 = [v9 nearbyActionAuthTagData];
    if ([v21 length] == (id)3)
    {
      id v22 = v21;
    }
    else
    {
      id v22 = [(CBAdvertiserDaemon *)self selfAuthTag];
    }
    id v6 = v22;
    uint64_t v29 = [v9 nearbyActionTargetData];
    id v13 = v9;
    uint64_t v30 = [v13 watchSetupData];

    id v16 = objc_alloc_init((Class)NSMutableData);
    char v37 = v19;
    [v16 appendBytes:&v37 length:1];
    char v36 = v17;
    [v16 appendBytes:&v36 length:1];
    if (([v13 nearbyActionFlags] & 0x80) != 0 && v6) {
      [v16 appendData:v6];
    }
    uint64_t v23 = v17 - 37;
    if (v23 <= 0x30)
    {
      if (((1 << (v17 - 37)) & 0x1000000000581) != 0)
      {
LABEL_18:
        unsigned int v24 = MGGetSInt32Answer();
        char v25 = 16 * v24;
        if (v24 > 0xF) {
          char v25 = 0;
        }
        char v35 = v25;
        long long v26 = (unsigned __int8 *)&v35;
        goto LABEL_21;
      }
      if (v23 == 17)
      {
        unsigned __int8 v34 = [v13 dsActionFlags];
        [v16 appendBytes:&v34 length:1];
        unsigned __int8 v33 = [v13 dsActionMeasuredPower];
        [v16 appendBytes:&v33 length:1];
        unsigned __int8 v32 = [v13 dsActionTieBreaker];
        long long v26 = &v32;
LABEL_21:
        [v16 appendBytes:v26 length:1];
LABEL_22:
        uint64_t v5 = [v13 nearbyActionExtraData];
        if (v5) {
          [v16 appendData:v5];
        }
        uint64_t v11 = 1;
        if (v20 && ([v16 appendBytes:&v42 length:1], v17 == 56))
        {
          __int16 v14 = (void *)v29;
          id v12 = (void *)v30;
          if ((v19 & 0x200) != 0 && v29)
          {
            [v16 appendData:v29];
            uint64_t v11 = 1;
          }
          a3 = v28;
        }
        else
        {
          a3 = v28;
          __int16 v14 = (void *)v29;
          id v12 = (void *)v30;
        }
        goto LABEL_31;
      }
    }
    if (v17 != 2)
    {
      if (v17 == 5 && v30) {
        [v16 appendData:v30];
      }
      goto LABEL_22;
    }
    goto LABEL_18;
  }
LABEL_9:
  uint64_t v11 = 0;
  id v12 = 0;
  id v13 = 0;
  __int16 v14 = 0;
  uint64_t v15 = 0;
  id v16 = 0;
LABEL_31:

  if ([(CBAdvertiserDaemon *)self _wiProxUpdateLinger:a3 active:v11])
  {
    __int16 v31 = 13312;
    id v27 = [objc_alloc((Class)NSData) initWithBytes:&v31 length:2];

    uint64_t v15 = 50;
    id v16 = v27;
  }
  [(CBAdvertiserDaemon *)self _wiProxUpdatePayload:a3 payloadData:v16 advertiseRate:v15 advertiseEnableEPA:0];
}

- (void)_updateNearbyActionV2Payload:(id *)a3
{
  id v4 = self;
  char v40 = 0;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  uint64_t v5 = self->_advertiserArray;
  id v6 = [(NSArray *)v5 countByEnumeratingWithState:&v36 objects:v42 count:16];
  if (v6)
  {
    id v7 = v6;
    char v8 = 0;
    char v9 = 0;
    uint64_t v10 = *(void *)v37;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v37 != v10) {
          objc_enumerationMutation(v5);
        }
        unsigned int v12 = [*(id *)(*((void *)&v36 + 1) + 8 * i) nearbyActionV2Type];
        unsigned int v13 = v12;
        char v40 = v12;
        if (v12)
        {
          if (v12 == 41) {
            char v8 = 1;
          }
          else {
            char v9 = 1;
          }
        }
      }
      id v7 = [(NSArray *)v5 countByEnumeratingWithState:&v36 objects:v42 count:16];
    }
    while (v7);
  }
  else
  {
    unsigned int v13 = 0;
    char v8 = 0;
    char v9 = 0;
  }

  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  __int16 v14 = v4->_advertiserArray;
  id v15 = [(NSArray *)v14 countByEnumeratingWithState:&v32 objects:v41 count:16];
  if (v15)
  {
    id v16 = v15;
    uint64_t v29 = v4;
    uint64_t v17 = *(void *)v33;
    unsigned __int8 v18 = v8 & v9;
    while (2)
    {
      for (j = 0; j != v16; j = (char *)j + 1)
      {
        if (*(void *)v33 != v17) {
          objc_enumerationMutation(v14);
        }
        int v20 = *(void **)(*((void *)&v32 + 1) + 8 * (void)j);
        unsigned int v21 = [v20 nearbyActionV2Type];
        unsigned int v13 = v21;
        char v40 = v21;
        if (v21)
        {
          if ((v18 & (v21 == 41)) != 1)
          {
            unsigned __int8 v27 = [v20 nearbyActionV2Flags];
            uint64_t v24 = (uint64_t)[v20 advertiseRate];
            uint64_t v23 = [v20 nearbyActionV2TargetData];
            char v22 = v27 & 0xFE;

            BOOL v26 = 1;
            id v4 = v29;
            goto LABEL_31;
          }
          if (dword_1009F8420 <= 90 && (dword_1009F8420 != -1 || _LogCategory_Initialize())) {
            LogPrintF_safe();
          }
        }
      }
      id v16 = [(NSArray *)v14 countByEnumeratingWithState:&v32 objects:v41 count:16];
      if (v16) {
        continue;
      }
      break;
    }
    id v4 = v29;
  }

  char v22 = 0;
  uint64_t v23 = 0;
  uint64_t v24 = 0;
  id v25 = 0;
  BOOL v26 = v13 != 0;
  if (v13)
  {
LABEL_31:
    id v25 = objc_alloc_init((Class)NSMutableData);
    char v31 = v22 | ([v23 length] == (id)3);
    [v25 appendBytes:&v31 length:1];
    [v25 appendBytes:&v40 length:1];
    if ([v23 length] == (id)3) {
      [v25 appendData:v23];
    }
  }
  if ([(CBAdvertiserDaemon *)v4 _wiProxUpdateLinger:a3 active:v26])
  {
    __int16 v30 = 13312;
    id v28 = [objc_alloc((Class)NSData) initWithBytes:&v30 length:2];

    uint64_t v24 = 50;
    id v25 = v28;
  }
  [(CBAdvertiserDaemon *)v4 _wiProxUpdatePayload:a3 payloadData:v25 advertiseRate:v24 advertiseEnableEPA:0];
}

- (void)_updateNearbyInfoPayload:(id *)a3
{
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  uint64_t v5 = self->_advertiserArray;
  id v6 = [(NSArray *)v5 countByEnumeratingWithState:&v23 objects:v27 count:16];
  double v7 = 0.0;
  if (v6)
  {
    uint64_t v8 = *(void *)v24;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v24 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        unsigned int v11 = [v10 nearbyInfoFlags];
        unsigned int v12 = [v10 nearbyInfoStatusType];
        if (v11 | v12)
        {
          unsigned int v14 = v12;
          id v6 = [v10 advertiseRate];
          [v10 nearbyInfoStatusProgress];
          double v7 = v15;
          unsigned __int8 v13 = [v10 nearbyInfoStatusTime];
          goto LABEL_11;
        }
      }
      id v6 = [(NSArray *)v5 countByEnumeratingWithState:&v23 objects:v27 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  unsigned int v11 = 0;
  unsigned __int8 v13 = 0;
  unsigned int v14 = 0;
LABEL_11:

  if (v11 | v14)
  {
    id v16 = objc_alloc_init((Class)NSMutableData);
    LOBYTE(v22) = (__rbit32(v11) >> 25) & 0x70;
    [v16 appendBytes:&v22 length:1];
    LOBYTE(v22) = (v11 >> 6) & 4 | (v11 >> 4) & 8 | v11 & 0x20 | (16 * v11) & 0x80 | (((v11 & 0x10) != 0) << 6);
    if (v14)
    {
      LOBYTE(v22) = (v11 >> 6) & 4 | (v11 >> 4) & 8 | v11 & 0x20 | (16 * v11) & 0x80 | (((v11 & 0x10) != 0) << 6) | 1;
      [v16 appendBytes:&v22 length:1];
      LOBYTE(v22) = 4;
      [v16 appendBytes:&v22 length:1];
      LOBYTE(v22) = v14;
      [v16 appendBytes:&v22 length:1];
      double v17 = 1.0;
      if (v7 <= 1.0) {
        double v17 = v7;
      }
      double v18 = v17 * 100.0;
      BOOL v19 = v17 < 0.0;
      double v20 = 0.0;
      if (!v19) {
        double v20 = v18;
      }
      LOBYTE(v22) = (int)v20;
      [v16 appendBytes:&v22 length:1];
      LOBYTE(v22) = v13;
    }
    [v16 appendBytes:&v22 length:1];
  }
  else
  {
    id v16 = 0;
  }
  if ([(CBAdvertiserDaemon *)self _wiProxUpdateLinger:a3 active:(v11 | v14) != 0])
  {
    __int16 v22 = 0;
    id v21 = [objc_alloc((Class)NSData) initWithBytes:&v22 length:2];

    id v16 = v21;
  }
  [(CBAdvertiserDaemon *)self _wiProxUpdatePayload:a3 payloadData:v16 advertiseRate:v6 advertiseEnableEPA:0];
}

- (void)_updateNearbyInfoV2Payload:(id *)a3
{
  long long v34 = a3;
  __int16 v47 = 0;
  __int16 v46 = 0;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  id obj = self->_advertiserArray;
  id v3 = [(NSArray *)obj countByEnumeratingWithState:&v42 objects:v48 count:16];
  if (v3)
  {
    id v4 = v3;
    int v5 = 0;
    unsigned int v6 = 0;
    unsigned int v36 = 0;
    unsigned int v7 = 0;
    unsigned int v8 = 0;
    uint64_t v9 = 0;
    long long v41 = 0;
    int v40 = 0;
    uint64_t v38 = *(void *)v43;
    long long v39 = 0;
    while (1)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v43 != v38) {
          objc_enumerationMutation(obj);
        }
        unsigned int v11 = *(void **)(*((void *)&v42 + 1) + 8 * i);
        v6 |= [v11 nearbyInfoV2DecryptedFlags:v34];
        HIBYTE(v47) = v6;
        if (([v11 nearbyInfoV2Flags] & 4) != 0)
        {
          v5 |= 4u;
          LOBYTE(v47) = v5;
        }
        else if (!v5 && !(_BYTE)v6)
        {
          int v5 = 0;
          continue;
        }
        uint64_t v12 = v9;
        if ((int)[v11 advertiseRate] > v40) {
          int v40 = [v11 advertiseRate];
        }
        unsigned __int8 v13 = [v11 nearbyInfoV2AuthTagData];
        id v14 = [v13 length];

        uint64_t v15 = (uint64_t)v41;
        if (!v41 && v14 == (id)3)
        {
          uint64_t v15 = [v11 nearbyInfoV2AuthTagData];
        }
        long long v41 = (void *)v15;
        id v16 = [v11 nearbyInfoV2AuthIntegrityTagData];
        id v17 = [v16 length];

        uint64_t v9 = v12;
        if (!v12 && v17 == (id)3)
        {
          uint64_t v9 = [v11 nearbyInfoV2AuthIntegrityTagData];
        }
        if (v39)
        {
          if (!v8) {
            goto LABEL_27;
          }
        }
        else
        {
          double v18 = [v11 nearbyInfoV2RapportIRKData];
          id v19 = [v18 length];

          if (v19)
          {
            long long v39 = [v11 nearbyInfoV2RapportIRKData];
            if (!v8) {
              goto LABEL_27;
            }
          }
          else
          {
            long long v39 = 0;
            if (!v8)
            {
LABEL_27:
              unsigned int v8 = [v11 nearbyInfoV2InvitationCounter];
              HIBYTE(v46) = v8;
              if (v7) {
                continue;
              }
              goto LABEL_28;
            }
          }
        }
        if (v7) {
          continue;
        }
LABEL_28:
        if ([v11 nearbyInfoV2InvitationRouteType])
        {
          unsigned int v7 = [v11 nearbyInfoV2InvitationRouteType];
          LOBYTE(v46) = v7;
          unsigned int v36 = v7;
        }
        else
        {
          unsigned int v7 = 0;
        }
      }
      id v4 = [(NSArray *)obj countByEnumeratingWithState:&v42 objects:v48 count:16];
      if (!v4) {
        goto LABEL_35;
      }
    }
  }
  unsigned int v36 = 0;
  unsigned int v8 = 0;
  unsigned int v6 = 0;
  int v5 = 0;
  long long v39 = 0;
  uint64_t v9 = 0;
  long long v41 = 0;
  int v40 = 0;
LABEL_35:

  if (!v5 && !(_BYTE)v6)
  {
    double v20 = (void *)v9;
    id v21 = 0;
    __int16 v22 = 0;
    long long v23 = v34;
    long long v24 = self;
LABEL_55:
    -[CBAdvertiserDaemon _wiProxUpdatePayload:payloadData:advertiseRate:advertiseEnableEPA:](v24, "_wiProxUpdatePayload:payloadData:advertiseRate:advertiseEnableEPA:", v23, v22, v40, 0, v34);

    __int16 v22 = v21;
    goto LABEL_56;
  }
  id v25 = objc_alloc_init((Class)NSMutableData);
  __int16 v22 = v25;
  if (v8) {
    BOOL v26 = v36 == 0;
  }
  else {
    BOOL v26 = 1;
  }
  char v27 = !v26;
  double v20 = (void *)v9;
  char v28 = v6 & 0xFC | v27;
  if (((v41 != 0) & (v6 >> 1) & (v9 != 0)) != 0) {
    char v29 = 2;
  }
  else {
    char v29 = 0;
  }
  HIBYTE(v47) = v28 | v29;
  [v25 appendBytes:&v47 length:1 v34];
  long long v24 = self;
  uint64_t v30 = [(CBAdvertiserDaemon *)self _encryptInvitationPayload:(char *)&v47 + 1 payloadLength:1 authTag:v41 irkData:v39 keyInfo:"BT_CBNearbyInfoV2EncryptedFlagsV1" keyInfoLength:33];
  if (v30)
  {
    id v21 = (void *)v30;
    [v22 appendData:v30];
    if (v41) {
      [v22 appendData:v41];
    }
    long long v23 = v34;
    if (v20) {
      [v22 appendData:v20];
    }
    char v31 = +[NSMutableData dataWithCapacity:2];
    long long v32 = v31;
    if (HIBYTE(v46))
    {
      [v31 appendBytes:(char *)&v46 + 1 length:1];
      [v32 appendBytes:&v46 length:1];
      long long v33 = -[CBAdvertiserDaemon _encryptInvitationPayload:payloadLength:authTag:irkData:keyInfo:keyInfoLength:](self, "_encryptInvitationPayload:payloadLength:authTag:irkData:keyInfo:keyInfoLength:", [v32 bytes], 2, v41, v39, "BT_CBNearbyInfoV2EncryptedPayloadV1", 35);
      [v22 appendData:v33];
    }
    goto LABEL_55;
  }
LABEL_56:
}

- (void)_updateAirDropPayload:(id *)a3
{
  id v4 = self;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  int v5 = self->_advertiserArray;
  id v6 = [(NSArray *)v5 countByEnumeratingWithState:&v33 objects:v38 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v34;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v34 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v33 + 1) + 8 * i);
        unsigned int v11 = [v10 airdropVersion];
        if (v11)
        {
          char v15 = v11;
          char v31 = v4;
          long long v32 = a3;
          unsigned __int8 v16 = [v10 airdropFlags];
          uint64_t v12 = [v10 airdropTempAuthTagData];
          unsigned int v17 = [v10 airdropModel];
          unsigned __int16 v18 = (unsigned __int16)[v10 airdropHash1];
          unsigned __int16 v19 = (unsigned __int16)[v10 airdropHash2];
          unsigned __int16 v20 = (unsigned __int16)[v10 airdropHash3];
          unsigned __int16 v21 = (unsigned __int16)[v10 airdropHash4];
          unsigned int v30 = [v10 advertiseRate];
          unsigned int v22 = [v10 airdropConfigData];

          memset(&v37[1], 0, 7);
          id v23 = [v12 length];
          char v24 = v16 | 0x40;
          if (v23 != (id)3) {
            char v24 = v16 & 0xBF;
          }
          char v25 = v24 | 0x80;
          char v26 = v24 & 0x7F;
          if (v17) {
            char v26 = v25;
          }
          v37[0] = v26;
          if ([v12 length] == (id)3)
          {
            char v27 = [v12 bytes];
            char v28 = v27[2];
            *(_WORD *)&v37[1] = *(_WORD *)v27;
            v37[3] = v28;
          }
          v37[4] = v17;
          v37[8] = v15;
          v37[9] = HIBYTE(v18);
          v37[10] = v18;
          v37[11] = HIBYTE(v19);
          v37[12] = v19;
          v37[13] = HIBYTE(v20);
          v37[14] = v20;
          v37[15] = HIBYTE(v21);
          v37[16] = v21;
          char v29 = v22 | 1;
          if (!v22) {
            char v29 = 0;
          }
          v37[17] = v29;
          id v14 = [objc_alloc((Class)NSData) initWithBytes:v37 length:18];
          id v4 = v31;
          a3 = v32;
          uint64_t v13 = v30;
          goto LABEL_19;
        }
      }
      id v7 = [(NSArray *)v5 countByEnumeratingWithState:&v33 objects:v38 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }

  uint64_t v12 = 0;
  uint64_t v13 = 0;
  id v14 = 0;
LABEL_19:
  [(CBAdvertiserDaemon *)v4 _wiProxUpdatePayload:a3 payloadData:v14 advertiseRate:v13 advertiseEnableEPA:0];
}

- (void)_updateSafetyAlertsAdvertising
{
  if (self->_saChanged)
  {
    id v3 = self->_saAdvAddresses;
    id v4 = self->_saPayloadSegments;
    if ((id)[(NSArray *)v3 count] != (id)3 || (id)[(NSArray *)v4 count] != (id)3)
    {
      if (dword_1009F8420 <= 30 && (dword_1009F8420 != -1 || _LogCategory_Initialize())) {
        LogPrintF_safe();
      }
      [(CBStackBLEAdvertiser *)self->_saStackAdvertiser invalidate];
      saStackAdvertiser = self->_saStackAdvertiser;
      self->_saStackAdvertiser = 0;

      goto LABEL_49;
    }
    int v5 = self->_saStackAdvertiser;
    if (!v5)
    {
      if (dword_1009F8420 <= 30 && (dword_1009F8420 != -1 || _LogCategory_Initialize()))
      {
        uint64_t v13 = CUPrintNSObjectOneLine();
        char v24 = CUPrintNSObjectOneLine();
        char v25 = sub_100094A08(self->_saAdvertiseRate);
        id v23 = v13;
        LogPrintF_safe();
      }
      [(CBStackAdaptor *)self->_stackAdaptor bleAdvertiserClass];
      id v14 = (CBStackBLEAdvertiser *)objc_alloc_init((Class)objc_opt_class());
      if (!v14)
      {
        if (dword_1009F8420 <= 90 && (dword_1009F8420 != -1 || _LogCategory_Initialize())) {
          LogPrintF_safe();
        }
        goto LABEL_50;
      }
      id v6 = v14;
      objc_storeStrong((id *)&self->_saStackAdvertiser, v14);
      [(CBStackBLEAdvertiser *)v6 setDispatchQueue:self->_dispatchQueue];
      goto LABEL_41;
    }
    id v6 = v5;
    if (dword_1009F8420 > 30 || dword_1009F8420 == -1 && !_LogCategory_Initialize())
    {
LABEL_41:
      -[CBStackBLEAdvertiser setAdvertiseRate:](v6, "setAdvertiseRate:", self->_saAdvertiseRate, v23, v24, v25);
      char v26 = v3;
      [(CBStackBLEAdvertiser *)v6 setSaAddressDataArray:v3];
      id v15 = objc_alloc_init((Class)NSMutableArray);
      long long v27 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      unsigned __int8 v16 = v4;
      id v17 = [(NSArray *)v16 countByEnumeratingWithState:&v27 objects:v31 count:16];
      if (v17)
      {
        id v18 = v17;
        uint64_t v19 = *(void *)v28;
        do
        {
          for (i = 0; i != v18; i = (char *)i + 1)
          {
            if (*(void *)v28 != v19) {
              objc_enumerationMutation(v16);
            }
            uint64_t v21 = *(void *)(*((void *)&v27 + 1) + 8 * i);
            id v22 = objc_alloc_init((Class)CBBLEServiceDataInfo);
            [v22 setServiceUUID16:64672];
            [v22 setServiceData:v21];
            [v15 addObject:v22];
          }
          id v18 = [(NSArray *)v16 countByEnumeratingWithState:&v27 objects:v31 count:16];
        }
        while (v18);
      }

      [(CBStackBLEAdvertiser *)v6 setSaServiceDataArray:v15];
      [(CBStackBLEAdvertiser *)v6 activate];

      id v3 = v26;
LABEL_49:
      self->_saChanged = 0;
LABEL_50:

      return;
    }
    id v7 = CUPrintNSObjectOneLine();
    uint64_t v8 = CUPrintNSObjectOneLine();
    uint64_t v9 = (void *)v8;
    int saAdvertiseRate = self->_saAdvertiseRate;
    if (saAdvertiseRate <= 39)
    {
      if (saAdvertiseRate > 19)
      {
        if (saAdvertiseRate == 20)
        {
          unsigned int v11 = "350 ms";
          goto LABEL_40;
        }
      }
      else
      {
        if (saAdvertiseRate == 10)
        {
          unsigned int v11 = "2 seconds";
          goto LABEL_40;
        }
        if (saAdvertiseRate == 15)
        {
          unsigned int v11 = "1022.5 ms";
          goto LABEL_40;
        }
      }
    }
    else if (saAdvertiseRate <= 44)
    {
      if (saAdvertiseRate == 40)
      {
        unsigned int v11 = "181.25 ms";
        goto LABEL_40;
      }
      if (saAdvertiseRate == 42)
      {
        unsigned int v11 = "120 ms";
        goto LABEL_40;
      }
    }
    else
    {
      switch(saAdvertiseRate)
      {
        case '-':
          unsigned int v11 = "60 ms";
          goto LABEL_40;
        case '2':
          unsigned int v11 = "30 ms";
          goto LABEL_40;
        case '<':
          unsigned int v11 = "20 ms";
LABEL_40:
          char v24 = (void *)v8;
          char v25 = v11;
          id v23 = v7;
          LogPrintF_safe();

          goto LABEL_41;
      }
    }
    unsigned int v11 = "270 ms";
    goto LABEL_40;
  }
}

- (void)_updateSafetyAlertsPayload
{
  v2 = self;
  long long v67 = 0u;
  long long v68 = 0u;
  long long v69 = 0u;
  long long v70 = 0u;
  id obj = self->_advertiserArray;
  id v3 = [(NSArray *)obj countByEnumeratingWithState:&v67 objects:v71 count:16];
  v57 = v2;
  if (v3)
  {
    id v4 = v3;
    int v5 = 0;
    id v6 = 0;
    id v7 = 0;
    uint64_t v8 = *(void *)v68;
    do
    {
      uint64_t v9 = 0;
      uint64_t v10 = v5;
      unsigned int v11 = v6;
      do
      {
        if (*(void *)v68 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v12 = *(void **)(*((void *)&v67 + 1) + 8 * (void)v9);
        uint64_t v13 = [v12 safetyAlertsAlertData];

        id v6 = [v12 safetyAlertsAlertID];

        id v14 = [v12 safetyAlertsSignature];

        unsigned int v15 = [v12 safetyAlertsVersion];
        unsigned int v16 = v15;
        if (v13) {
          BOOL v17 = v6 == 0;
        }
        else {
          BOOL v17 = 1;
        }
        if (!v17 && v14 != 0 && v15 != 0)
        {
          unsigned int v20 = [v12 advertiseRate];
          v2 = v57;
          goto LABEL_21;
        }
        uint64_t v9 = (char *)v9 + 1;
        uint64_t v10 = v14;
        unsigned int v11 = v6;
        int v5 = v14;
        id v7 = v13;
      }
      while (v4 != v9);
      id v4 = [(NSArray *)obj countByEnumeratingWithState:&v67 objects:v71 count:16];
      id v7 = v13;
    }
    while (v4);
    unsigned int v20 = 0;
    v2 = v57;
    id v14 = v5;
  }
  else
  {
    unsigned int v16 = 0;
    id v14 = 0;
    id v6 = 0;
    uint64_t v13 = 0;
    unsigned int v20 = 0;
  }
LABEL_21:

  id v58 = v13;
  id v21 = [v13 length];
  id v22 = [v6 length];
  id v23 = [v14 length];
  char v24 = 0;
  v56 = v14;
  if ((unint64_t)v21 <= 0x1C && v22 == (id)3 && v23 == (id)56)
  {
    char v25 = 0;
    if (v16 - 32 >= 0xFFFFFFE1)
    {
      unsigned int v54 = v20;
      id obja = objc_alloc_init((Class)NSMutableArray);
      id v26 = objc_alloc_init((Class)NSMutableArray);
      id v27 = v58;
      long long v28 = (char *)[v27 bytes];
      v61 = (char *)[v27 length] + (void)v28;
      id v29 = v14;
      long long v30 = (char *)[v29 bytes];
      v59 = (char *)[v29 length] + (void)v30;
      unsigned int v31 = 1;
      do
      {
        +[NSMutableData dataWithBytes:v30 length:6];
        long long v32 = v30 + 6;
        id v33 = objc_claimAutoreleasedReturnValue();
        long long v34 = [v33 mutableBytes];
        char v35 = *v34 & 0xC0;
        *v34 |= 0xC0u;
        [obja addObject:v33];
        id v36 = objc_alloc_init((Class)NSMutableData);
        char v66 = v35 | v16;
        [v36 appendBytes:&v66 length:1];
        char v65 = (16 * v31) | 3;
        [v36 appendBytes:&v65 length:1];
        [v36 appendBytes:[v6 bytes] length:3];
        if (((_BYTE)v59 - (_BYTE)v32) >= 0xDu) {
          uint64_t v37 = 13;
        }
        else {
          uint64_t v37 = ((_BYTE)v59 - (_BYTE)v32);
        }
        [v36 appendBytes:v32 length:v37];
        unsigned __int8 v38 = [v36 length];
        unsigned __int8 v39 = (_BYTE)v61 - (_BYTE)v28;
        if (27 - v38 < ((_BYTE)v61 - (_BYTE)v28)) {
          unsigned __int8 v39 = 27 - [v36 length];
        }
        long long v30 = &v32[v37];
        uint64_t v40 = v39;
        [v36 appendBytes:v28 length:v40];
        v28 += v40;
        [v26 addObject:v36];
      }
      while (v31++ < 3);
      v2 = v57;
      unsigned int v20 = v54;
      char v25 = v26;
      char v24 = obja;
    }
  }
  else
  {
    char v25 = 0;
  }
  saAdvAddresses = v2->_saAdvAddresses;
  long long v43 = v24;
  long long v44 = saAdvAddresses;
  if (v43 == v44)
  {
  }
  else
  {
    long long v45 = v44;
    if ((v43 == 0) == (v44 != 0))
    {
      v48 = v43;
      goto LABEL_45;
    }
    unsigned int v46 = [(NSArray *)v43 isEqual:v44];

    if (!v46) {
      goto LABEL_51;
    }
  }
  saPayloadSegments = v2->_saPayloadSegments;
  v48 = v25;
  v49 = saPayloadSegments;
  if (v48 == v49)
  {

    goto LABEL_47;
  }
  long long v45 = v49;
  if ((v48 == 0) == (v49 != 0))
  {
LABEL_45:

    goto LABEL_51;
  }
  unsigned int v50 = [(NSArray *)v48 isEqual:v49];

  if (!v50)
  {
LABEL_51:
    id objb = v24;
    v51 = v56;
    if (dword_1009F8420 <= 30 && (dword_1009F8420 != -1 || _LogCategory_Initialize()))
    {
      v55 = CUPrintNSObjectOneLine();
      v60 = CUPrintNSObjectOneLine();
      v52 = CUPrintNSObjectOneLine();
      v53 = CUPrintNSObjectOneLine();
      LogPrintF_safe();
    }
    v2->_int saAdvertiseRate = v20;
    objc_storeStrong((id *)&v2->_saAdvAddresses, objb);
    objc_storeStrong((id *)&v2->_saPayloadSegments, v25);
    v2->_saChanged = 1;
    goto LABEL_59;
  }
LABEL_47:
  if (v20 != v2->_saAdvertiseRate) {
    goto LABEL_51;
  }
  v51 = v56;
  if (dword_1009F8420 <= 10 && (dword_1009F8420 != -1 || _LogCategory_Initialize())) {
    LogPrintF_safe();
  }
LABEL_59:
}

- (void)_updateSpatialInteractionAdvertising:(id *)a3
{
  if (!self->_spatialInteractionChanged) {
    return;
  }
  int v5 = [(id)qword_100A147E0 advertisingManager];
  id v24 = v5;
  if (v5)
  {
    if ([v5 state] == (id)3)
    {
      id v6 = self->_spatialInteractionWiProxUUID;
      if (!v6)
      {
        id v6 = +[NSUUID UUID];
        objc_storeStrong((id *)&self->_spatialInteractionWiProxUUID, v6);
      }
      id v7 = self->_spatialInteractionPayloadData;
      p_spatialInteractionAdvertisingRequest = &self->_spatialInteractionAdvertisingRequest;
      uint64_t v9 = self->_spatialInteractionAdvertisingRequest;
      if (v9)
      {
        if (v7) {
          uint64_t v10 = "for restart";
        }
        else {
          uint64_t v10 = "";
        }
        if (dword_1009F8420 < 31 && (dword_1009F8420 != -1 || _LogCategory_Initialize()))
        {
          id v22 = (void *)v10;
          LogPrintF_safe();
        }
        [v24 removeAdvertisingRequest:v9 forDaemon:v6];
        unsigned int v11 = *p_spatialInteractionAdvertisingRequest;
        *p_spatialInteractionAdvertisingRequest = 0;
      }
      if (v7)
      {
        uint64_t v12 = +[WPAdvertisingRequest requestForClientType:19];
        objc_storeStrong((id *)&self->_spatialInteractionAdvertisingRequest, v12);
        [v12 setAdvertisingData:v7];
        int spatialInteractionAdvertiseRate = self->_spatialInteractionAdvertiseRate;
        uint64_t v14 = 290;
        uint64_t v15 = 48;
        uint64_t v16 = 32;
        if (spatialInteractionAdvertiseRate != 60) {
          uint64_t v16 = 290;
        }
        if (spatialInteractionAdvertiseRate != 50) {
          uint64_t v15 = v16;
        }
        uint64_t v17 = 192;
        uint64_t v18 = 96;
        if (spatialInteractionAdvertiseRate != 45) {
          uint64_t v18 = 290;
        }
        if (spatialInteractionAdvertiseRate != 42) {
          uint64_t v17 = v18;
        }
        if (spatialInteractionAdvertiseRate <= 49) {
          uint64_t v15 = v17;
        }
        uint64_t v19 = 996;
        uint64_t v20 = 432;
        if (spatialInteractionAdvertiseRate != 30) {
          uint64_t v20 = 290;
        }
        if (spatialInteractionAdvertiseRate != 20) {
          uint64_t v19 = v20;
        }
        if (spatialInteractionAdvertiseRate == 15) {
          uint64_t v14 = 1636;
        }
        if (spatialInteractionAdvertiseRate == 10) {
          uint64_t v14 = 3200;
        }
        if (spatialInteractionAdvertiseRate > 19) {
          uint64_t v14 = v19;
        }
        if (spatialInteractionAdvertiseRate <= 41) {
          uint64_t v21 = v14;
        }
        else {
          uint64_t v21 = v15;
        }
        [v12 setAdvertisingRate:v21];
        [v12 setConnectable:0];
        [v12 setIsRanging:1];
        [v12 setStopOnAdvertisingAddressChange:1];
        [v12 setEnableEPAForAdvertising:a3->var4];
        if (dword_1009F8420 <= 30 && (dword_1009F8420 != -1 || _LogCategory_Initialize()))
        {
          double v23 = (double)(uint64_t)[v12 advertisingRate] * 0.625;
          id v22 = v7;
          LogPrintF_safe();
        }
        [v24 addAdvertisingRequest:v12 forDaemon:v6];
      }
      self->_spatialInteractionChanged = 0;

      goto LABEL_46;
    }
    if (dword_1009F8420 <= 30 && (dword_1009F8420 != -1 || _LogCategory_Initialize())) {
      goto LABEL_54;
    }
  }
  else if (dword_1009F8420 <= 90 && (dword_1009F8420 != -1 || _LogCategory_Initialize()))
  {
LABEL_54:
    LogPrintF_safe();
  }
LABEL_46:
}

- (void)_updateSpatialInteractionPayload:(id *)a3
{
  BOOL advertiserEnableEPA = self->_advertiserEnableEPA;
  id v6 = self->_spatialInteractionIdentifiers;
  if (v6)
  {
    id v7 = objc_alloc_init((Class)NSMutableData);
    p_spatialInteractionFlags = &self->_spatialInteractionFlags;
    [v7 appendBytes:&self->_spatialInteractionFlags length:1];
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    uint64_t v9 = self->_spatialInteractionIdentifiers;
    id v10 = [(NSArray *)v9 countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v25;
      do
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v25 != v12) {
            objc_enumerationMutation(v9);
          }
          [v7 appendData:*(void *)(*((void *)&v24 + 1) + 8 * i)];
        }
        id v11 = [(NSArray *)v9 countByEnumeratingWithState:&v24 objects:v28 count:16];
      }
      while (v11);
    }

    uint64_t v14 = self->_spatialInteractionUWBConfigData;
    if (v14)
    {
      [v7 appendData:v14];
      if ((char *)[(NSData *)v14 length] - 1 > (char *)4)
      {
        if (((char)*p_spatialInteractionFlags & 0x80000000) == 0) {
          goto LABEL_24;
        }
        char v23 = 0;
        int v15 = 5;
        do
        {
LABEL_22:
          [v7 appendBytes:&v23 length:1];
          --v15;
        }
        while (v15);
LABEL_23:
        [v7 appendBytes:&self->_spatialInteractionConfigFlags length:1];
LABEL_24:
        uint64_t v16 = self->_spatialInteractionPresenceConfigData;
        if (v16) {
          [v7 appendData:v16];
        }
        spatialInteractionPayloadData = self->_spatialInteractionPayloadData;
        uint64_t v18 = (NSData *)v7;
        uint64_t v19 = spatialInteractionPayloadData;
        if (v18 == v19)
        {
        }
        else
        {
          uint64_t v20 = v19;
          if ((v18 == 0) == (v19 != 0))
          {

            goto LABEL_35;
          }
          unsigned int v21 = [(NSData *)v18 isEqual:v19];

          if (!v21)
          {
LABEL_35:
            if (dword_1009F8420 <= 30 && (dword_1009F8420 != -1 || _LogCategory_Initialize())) {
              LogPrintF_safe();
            }
            objc_storeStrong((id *)&self->_spatialInteractionPayloadData, v7);
            self->_spatialInteractionChanged = 1;
            [(CBAdvertiserDaemon *)self _wiProxUpdatePayload:a3 payloadData:v18 advertiseRate:0 advertiseEnableEPA:advertiserEnableEPA];
LABEL_42:

            goto LABEL_45;
          }
        }
        if (dword_1009F8420 <= 10 && (dword_1009F8420 != -1 || _LogCategory_Initialize())) {
          LogPrintF_safe();
        }
        goto LABEL_42;
      }
      int v15 = (5 - [(NSData *)v14 length]);
    }
    else
    {
      int v15 = 0;
    }
    if (((char)*p_spatialInteractionFlags & 0x80000000) == 0) {
      goto LABEL_24;
    }
    char v23 = 0;
    if (!v15) {
      goto LABEL_23;
    }
    goto LABEL_22;
  }
  if (self->_spatialInteractionPayloadData)
  {
    if (dword_1009F8420 <= 30 && (dword_1009F8420 != -1 || _LogCategory_Initialize())) {
      LogPrintF_safe();
    }
    id v22 = self->_spatialInteractionPayloadData;
    self->_spatialInteractionPayloadData = 0;

    self->_spatialInteractionChanged = 1;
  }
LABEL_45:
}

- (void)_updateNearbyActionNoWakePayload:(id *)a3
{
  __int16 v22 = 0;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  int v5 = self->_advertiserArray;
  id v6 = [(NSArray *)v5 countByEnumeratingWithState:&v18 objects:v23 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v19;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v19 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        unsigned int v11 = [v10 nearbyActionNoWakeType:v18];
        LOBYTE(v22) = v11;
        if (v11)
        {
          unsigned __int8 v17 = [v10 nearbyActionNWPrecisionFindingStatus];
          int v15 = [v10 nearbyActionNoWakeAuthTagData];
          uint64_t v14 = [v10 nearbyActionNoWakeConfigData];
          id v13 = [v10 advertiseRate];
          id v12 = [v10 enableEPAForLEAdvertisement];

          id v16 = objc_alloc_init((Class)NSMutableData);
          HIBYTE(v22) = v17 & 0xFE | ([v14 length] == (id)1);
          [v16 appendBytes:&v22 length:1];
          [v16 appendBytes:(char *)&v22 + 1 length:1];
          if ([v15 length] == (id)3) {
            [v16 appendData:v15];
          }
          if ([v14 length] == (id)1) {
            [v16 appendData:v14];
          }
          goto LABEL_14;
        }
      }
      id v7 = [(NSArray *)v5 countByEnumeratingWithState:&v18 objects:v23 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }

  id v12 = 0;
  id v13 = 0;
  uint64_t v14 = 0;
  int v15 = 0;
  id v16 = 0;
LABEL_14:
  -[CBAdvertiserDaemon _wiProxUpdatePayload:payloadData:advertiseRate:advertiseEnableEPA:](self, "_wiProxUpdatePayload:payloadData:advertiseRate:advertiseEnableEPA:", a3, v16, v13, v12, (void)v18);
}

- (void)_updateWatchSetupAdvertising
{
  if (self->_watchSetupChanged)
  {
    id v3 = self->_watchSetupPayloadData;
    if (!v3)
    {
      if (dword_1009F8420 <= 30 && (dword_1009F8420 != -1 || _LogCategory_Initialize())) {
        LogPrintF_safe();
      }
      [(CBStackBLEAdvertiser *)self->_watchSetupStackAdvertiser invalidate];
      watchSetupStackAdvertiser = self->_watchSetupStackAdvertiser;
      self->_watchSetupStackAdvertiser = 0;

      goto LABEL_62;
    }
    id v4 = self->_watchSetupStackAdvertiser;
    if (v4)
    {
      int v5 = v4;
      if (dword_1009F8420 > 30 || dword_1009F8420 == -1 && !_LogCategory_Initialize()) {
        goto LABEL_61;
      }
      uint64_t v6 = CUPrintNSDataHex();
      id v7 = (void *)v6;
      int watchSetupAdvertiseRate = self->_watchSetupAdvertiseRate;
      if (watchSetupAdvertiseRate <= 39)
      {
        if (watchSetupAdvertiseRate > 19)
        {
          if (watchSetupAdvertiseRate == 20)
          {
            uint64_t v9 = "350 ms";
            goto LABEL_52;
          }
        }
        else
        {
          if (watchSetupAdvertiseRate == 10)
          {
            uint64_t v9 = "2 seconds";
            goto LABEL_52;
          }
          if (watchSetupAdvertiseRate == 15)
          {
            uint64_t v9 = "1022.5 ms";
            goto LABEL_52;
          }
        }
      }
      else if (watchSetupAdvertiseRate <= 44)
      {
        if (watchSetupAdvertiseRate == 40)
        {
          uint64_t v9 = "181.25 ms";
          goto LABEL_52;
        }
        if (watchSetupAdvertiseRate == 42)
        {
          uint64_t v9 = "120 ms";
          goto LABEL_52;
        }
      }
      else
      {
        switch(watchSetupAdvertiseRate)
        {
          case '-':
            uint64_t v9 = "60 ms";
            goto LABEL_52;
          case '2':
            uint64_t v9 = "30 ms";
            goto LABEL_52;
          case '<':
            uint64_t v9 = "20 ms";
LABEL_52:
            uint64_t v19 = v6;
            long long v20 = v9;
            LogPrintF_safe();

LABEL_61:
            -[CBStackBLEAdvertiser setAdvertiseRate:](v5, "setAdvertiseRate:", self->_watchSetupAdvertiseRate, v19, v20);
            id v16 = objc_alloc_init((Class)NSMutableData);
            char v21 = 6;
            [v16 appendBytes:&v21 length:1];
            [v16 appendData:v3];
            id v17 = objc_alloc_init((Class)CBBLEServiceDataInfo);
            [v17 setServiceUUID16:65061];
            [v17 setServiceData:v16];
            [v17 setConnectable:1];
            id v22 = v17;
            long long v18 = +[NSArray arrayWithObjects:&v22 count:1];
            [(CBStackBLEAdvertiser *)v5 setServiceDataArray:v18];

            [(CBStackBLEAdvertiser *)v5 activate];
LABEL_62:
            self->_watchSetupChanged = 0;
LABEL_63:

            return;
        }
      }
      uint64_t v9 = "270 ms";
      goto LABEL_52;
    }
    if (dword_1009F8420 > 30 || dword_1009F8420 == -1 && !_LogCategory_Initialize())
    {
LABEL_59:
      [(CBStackAdaptor *)self->_stackAdaptor bleAdvertiserClass];
      int v15 = (CBStackBLEAdvertiser *)objc_alloc_init((Class)objc_opt_class());
      if (!v15)
      {
        if (dword_1009F8420 <= 90 && (dword_1009F8420 != -1 || _LogCategory_Initialize())) {
          LogPrintF_safe();
        }
        goto LABEL_63;
      }
      int v5 = v15;
      objc_storeStrong((id *)&self->_watchSetupStackAdvertiser, v15);
      [(CBStackBLEAdvertiser *)v5 setDispatchQueue:self->_dispatchQueue];
      goto LABEL_61;
    }
    uint64_t v10 = CUPrintNSDataHex();
    unsigned int v11 = (void *)v10;
    int v12 = self->_watchSetupAdvertiseRate;
    if (v12 <= 39)
    {
      if (v12 > 19)
      {
        if (v12 == 20)
        {
          id v13 = "350 ms";
          goto LABEL_58;
        }
      }
      else
      {
        if (v12 == 10)
        {
          id v13 = "2 seconds";
          goto LABEL_58;
        }
        if (v12 == 15)
        {
          id v13 = "1022.5 ms";
          goto LABEL_58;
        }
      }
    }
    else if (v12 <= 44)
    {
      if (v12 == 40)
      {
        id v13 = "181.25 ms";
        goto LABEL_58;
      }
      if (v12 == 42)
      {
        id v13 = "120 ms";
        goto LABEL_58;
      }
    }
    else
    {
      switch(v12)
      {
        case '-':
          id v13 = "60 ms";
          goto LABEL_58;
        case '2':
          id v13 = "30 ms";
          goto LABEL_58;
        case '<':
          id v13 = "20 ms";
LABEL_58:
          uint64_t v19 = v10;
          long long v20 = v13;
          LogPrintF_safe();

          goto LABEL_59;
      }
    }
    id v13 = "270 ms";
    goto LABEL_58;
  }
}

- (void)_updateWatchSetupPayload
{
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v3 = self->_advertiserArray;
  id v4 = [(NSArray *)v3 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v19;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v19 != v5) {
          objc_enumerationMutation(v3);
        }
        id v7 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        if ([v7 nearbyActionType] != 5)
        {
          uint64_t v8 = [v7 watchSetupData];
          if (v8)
          {
            uint64_t v9 = (void *)v8;
            LODWORD(v4) = [v7 advertiseRate];
            goto LABEL_12;
          }
        }
      }
      id v4 = [(NSArray *)v3 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
  uint64_t v9 = 0;
LABEL_12:

  watchSetupPayloadData = self->_watchSetupPayloadData;
  unsigned int v11 = v9;
  int v12 = watchSetupPayloadData;
  if (v11 == v12)
  {
  }
  else
  {
    id v13 = v12;
    if ((v11 == 0) == (v12 != 0))
    {

      goto LABEL_22;
    }
    unsigned int v14 = [(NSData *)v11 isEqual:v12];

    if (!v14)
    {
LABEL_22:
      if (dword_1009F8420 <= 30 && (dword_1009F8420 != -1 || _LogCategory_Initialize()))
      {
        int v15 = CUPrintNSDataHex();
        id v16 = CUPrintNSDataHex();
        LogPrintF_safe();
      }
      self->_int watchSetupAdvertiseRate = (int)v4;
      objc_storeStrong((id *)&self->_watchSetupPayloadData, v9);
      self->_watchSetupChanged = 1;
      goto LABEL_30;
    }
  }
  if (v4 != self->_watchSetupAdvertiseRate) {
    goto LABEL_22;
  }
  if (dword_1009F8420 <= 10 && (dword_1009F8420 != -1 || _LogCategory_Initialize()))
  {
    id v17 = CUPrintNSDataHex();
    LogPrintF_safe();
  }
LABEL_30:
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (void)setInvalidationHandler:(id)a3
{
}

- (BOOL)advertiserEnableEPA
{
  return self->_advertiserEnableEPA;
}

- (void)setAdvertiserEnableEPA:(BOOL)a3
{
  self->_BOOL advertiserEnableEPA = a3;
}

- (CBDaemonServer)daemonServer
{
  return self->_daemonServer;
}

- (void)setDaemonServer:(id)a3
{
}

- (void)setSelfAuthTag:(id)a3
{
}

- (CBStackAdaptor)stackAdaptor
{
  return self->_stackAdaptor;
}

- (void)setStackAdaptor:(id)a3
{
}

- (id)stateChangedHandler
{
  return self->_stateChangedHandler;
}

- (void)setStateChangedHandler:(id)a3
{
}

- (int)spatialInteractionAdvertiseRate
{
  return self->_spatialInteractionAdvertiseRate;
}

- (unsigned)spatialInteractionConfigFlags
{
  return self->_spatialInteractionConfigFlags;
}

- (void)setSpatialInteractionConfigFlags:(unsigned __int8)a3
{
  self->_spatialInteractionConfigFlags = a3;
}

- (unsigned)spatialInteractionFlags
{
  return self->_spatialInteractionFlags;
}

- (NSArray)spatialInteractionIdentifiers
{
  return self->_spatialInteractionIdentifiers;
}

- (NSData)spatialInteractionPresenceConfigData
{
  return self->_spatialInteractionPresenceConfigData;
}

- (NSData)spatialInteractionUWBConfigData
{
  return self->_spatialInteractionUWBConfigData;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_spatialInteractionUWBConfigData, 0);
  objc_storeStrong((id *)&self->_spatialInteractionPresenceConfigData, 0);
  objc_storeStrong((id *)&self->_spatialInteractionIdentifiers, 0);
  objc_storeStrong(&self->_stateChangedHandler, 0);
  objc_storeStrong((id *)&self->_stackAdaptor, 0);
  objc_storeStrong((id *)&self->_selfAuthTag, 0);
  objc_storeStrong((id *)&self->_daemonServer, 0);
  objc_storeStrong((id *)&self->_advertiserArray, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_watchSetupStackAdvertiser, 0);
  objc_storeStrong((id *)&self->_watchSetupPayloadData, 0);
  objc_storeStrong((id *)&self->_spatialInteractionWiProxUUID, 0);
  objc_storeStrong((id *)&self->_spatialInteractionPayloadData, 0);
  objc_storeStrong((id *)&self->_spatialInteractionAdvertisingRequest, 0);
  sub_10009B574((uint64_t)&self->_spatialInteractionWiProxContext);
  sub_10009B574((uint64_t)&self->_nearbyActionNoWakeWiProxContext);
  sub_10009B574((uint64_t)&self->_nearbyInfoV2WiProxContext);
  sub_10009B574((uint64_t)&self->_nearbyInfoWiProxContext);
  sub_10009B574((uint64_t)&self->_nearbyActionV2WiProxContext);
  sub_10009B574((uint64_t)&self->_nearbyActionV1WiProxContext);
  sub_10009B574((uint64_t)&self->_heySiriWiProxContext);
  sub_10009B574((uint64_t)&self->_dsInfoWiProxContext);
  sub_10009B574((uint64_t)&self->_airplayTargetWiProxContext);
  sub_10009B574((uint64_t)&self->_airplaySourceWiProxContext);
  sub_10009B574((uint64_t)&self->_airdropWiProxContext);
  objc_storeStrong((id *)&self->_saStackAdvertiser, 0);
  objc_storeStrong((id *)&self->_saPayloadSegments, 0);
  objc_storeStrong((id *)&self->_saAdvAddresses, 0);
  objc_storeStrong((id *)&self->_fidoStackAdvertiser, 0);
  objc_storeStrong((id *)&self->_fidoPayloadData, 0);

  objc_storeStrong((id *)&self->_appleTypeStackAdvertiser, 0);
}

@end
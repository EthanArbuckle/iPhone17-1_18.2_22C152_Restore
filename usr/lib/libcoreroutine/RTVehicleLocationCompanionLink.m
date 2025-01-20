@interface RTVehicleLocationCompanionLink
- (BOOL)_companionLinkConnected;
- (OS_dispatch_queue)queue;
- (RPCompanionLinkClient)client;
- (RTVehicleLocationCompanionLink)init;
- (RTVehicleLocationCompanionLink)initWithQueue:(id)a3 companionLinkClient:(id)a4 vehicleEventHandler:(id)a5 deviceConnectionUpdateHandler:(id)a6;
- (RTVehicleLocationCompanionLink)initWithQueue:(id)a3 deviceConnectionUpdateHandler:(id)a4;
- (RTVehicleLocationCompanionLink)initWithQueue:(id)a3 vehicleEventHandler:(id)a4;
- (id)decodeVehicleEvent:(id)a3;
- (id)encodeVehicleEvent:(id)a3;
- (id)vehicleEventHandler;
- (void)registerEventHandlers;
- (void)sendVehicleEvent:(id)a3 handler:(id)a4;
- (void)setClient:(id)a3;
- (void)setQueue:(id)a3;
- (void)setVehicleEventHandler:(id)a3;
@end

@implementation RTVehicleLocationCompanionLink

- (RTVehicleLocationCompanionLink)init
{
  uint64_t v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithQueue_companionLinkClient_vehicleEventHandler_deviceConnectionUpdateHandler_);
}

- (RTVehicleLocationCompanionLink)initWithQueue:(id)a3 vehicleEventHandler:(id)a4
{
  v6 = (objc_class *)MEMORY[0x1E4F946E0];
  id v7 = a4;
  id v8 = a3;
  id v9 = objc_alloc_init(v6);
  v10 = [(RTVehicleLocationCompanionLink *)self initWithQueue:v8 companionLinkClient:v9 vehicleEventHandler:v7 deviceConnectionUpdateHandler:0];

  return v10;
}

- (RTVehicleLocationCompanionLink)initWithQueue:(id)a3 deviceConnectionUpdateHandler:(id)a4
{
  v6 = (objc_class *)MEMORY[0x1E4F946E0];
  id v7 = a4;
  id v8 = a3;
  id v9 = objc_alloc_init(v6);
  v10 = [(RTVehicleLocationCompanionLink *)self initWithQueue:v8 companionLinkClient:v9 vehicleEventHandler:0 deviceConnectionUpdateHandler:v7];

  return v10;
}

- (RTVehicleLocationCompanionLink)initWithQueue:(id)a3 companionLinkClient:(id)a4 vehicleEventHandler:(id)a5 deviceConnectionUpdateHandler:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  if (!v11)
  {
    v24 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
LABEL_9:

      v23 = 0;
      goto LABEL_10;
    }
    LOWORD(location[0]) = 0;
    v25 = "Invalid parameter not satisfying: queue";
LABEL_12:
    _os_log_error_impl(&dword_1D9BFA000, v24, OS_LOG_TYPE_ERROR, v25, (uint8_t *)location, 2u);
    goto LABEL_9;
  }
  if (!v12)
  {
    v24 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      goto LABEL_9;
    }
    LOWORD(location[0]) = 0;
    v25 = "Invalid parameter not satisfying: companionLinkClient";
    goto LABEL_12;
  }
  v34.receiver = self;
  v34.super_class = (Class)RTVehicleLocationCompanionLink;
  v15 = [(RTVehicleLocationCompanionLink *)&v34 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_queue, a3);
    uint64_t v17 = MEMORY[0x1E016DB00](v13);
    id vehicleEventHandler = v16->_vehicleEventHandler;
    v16->_id vehicleEventHandler = (id)v17;

    objc_storeStrong((id *)&v16->_client, a4);
    [(RPCompanionLinkClient *)v16->_client setDispatchQueue:v11];
    [(RPCompanionLinkClient *)v16->_client setControlFlags:32];
    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = __118__RTVehicleLocationCompanionLink_initWithQueue_companionLinkClient_vehicleEventHandler_deviceConnectionUpdateHandler___block_invoke;
    v32[3] = &unk_1E6B9B2A0;
    id v19 = v14;
    id v33 = v19;
    v20 = [(RTVehicleLocationCompanionLink *)v16 client];
    [v20 setDeviceFoundHandler:v32];

    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __118__RTVehicleLocationCompanionLink_initWithQueue_companionLinkClient_vehicleEventHandler_deviceConnectionUpdateHandler___block_invoke_22;
    v30[3] = &unk_1E6B9B2A0;
    id v31 = v19;
    v21 = [(RTVehicleLocationCompanionLink *)v16 client];
    [v21 setDeviceLostHandler:v30];

    objc_initWeak(location, v16);
    v22 = [(RTVehicleLocationCompanionLink *)v16 client];
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __118__RTVehicleLocationCompanionLink_initWithQueue_companionLinkClient_vehicleEventHandler_deviceConnectionUpdateHandler___block_invoke_23;
    v27[3] = &unk_1E6B9B2C8;
    objc_copyWeak(&v28, location);
    [v22 activateWithCompletion:v27];

    objc_destroyWeak(&v28);
    objc_destroyWeak(location);
  }
  self = v16;
  v23 = self;
LABEL_10:

  return v23;
}

void __118__RTVehicleLocationCompanionLink_initWithQueue_companionLinkClient_vehicleEventHandler_deviceConnectionUpdateHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4) {
    (*(void (**)(uint64_t, uint64_t))(v4 + 16))(v4, 1);
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    v5 = [v3 model];
    if (v5)
    {
      v6 = [v3 model];
    }
    else
    {
      v6 = @"Unknown Model";
    }

    id v7 = [v3 name];
    if (v7)
    {
      id v8 = [v3 name];
    }
    else
    {
      id v8 = @"Unknown Name";
    }

    id v9 = _rt_log_facility_get_os_log(RTLogFacilityVehicleLocation);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      v10 = [v3 effectiveIdentifier];
      int v11 = 138412802;
      id v12 = v10;
      __int16 v13 = 2112;
      id v14 = v8;
      __int16 v15 = 2112;
      v16 = v6;
      _os_log_debug_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_DEBUG, "RTVehicleLocationCompanionLink, onDeviceFound, id, %@, name, %@, model, %@", (uint8_t *)&v11, 0x20u);
    }
  }
}

void __118__RTVehicleLocationCompanionLink_initWithQueue_companionLinkClient_vehicleEventHandler_deviceConnectionUpdateHandler___block_invoke_22(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4) {
    (*(void (**)(uint64_t, void))(v4 + 16))(v4, 0);
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    v5 = [v3 model];
    if (v5)
    {
      v6 = [v3 model];
    }
    else
    {
      v6 = @"Unknown Model";
    }

    id v7 = [v3 name];
    if (v7)
    {
      id v8 = [v3 name];
    }
    else
    {
      id v8 = @"Unknown Name";
    }

    id v9 = _rt_log_facility_get_os_log(RTLogFacilityVehicleLocation);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      v10 = [v3 effectiveIdentifier];
      int v11 = 138412802;
      id v12 = v10;
      __int16 v13 = 2112;
      id v14 = v8;
      __int16 v15 = 2112;
      v16 = v6;
      _os_log_debug_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_DEBUG, "RTVehicleLocationCompanionLink, onDeviceLost, id, %@, name, %@, model, %@", (uint8_t *)&v11, 0x20u);
    }
  }
}

void __118__RTVehicleLocationCompanionLink_initWithQueue_companionLinkClient_vehicleEventHandler_deviceConnectionUpdateHandler___block_invoke_23(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = _rt_log_facility_get_os_log(RTLogFacilityVehicleLocation);
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v8 = 138412290;
      id v9 = v3;
      _os_log_error_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_ERROR, "RTVehicleLocationCompanionLink, Failed to activate RPCompanionLinkClient with error %@", (uint8_t *)&v8, 0xCu);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    LOWORD(v8) = 0;
    _os_log_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_INFO, "RTVehicleLocationCompanionLink, rapport session ready to listen for incoming devices", (uint8_t *)&v8, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v7 = [WeakRetained vehicleEventHandler];

  if (v7) {
    [WeakRetained registerEventHandlers];
  }
}

- (id)encodeVehicleEvent:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = objc_opt_new();
  v5 = v4;
  if (!v3)
  {
    [v4 setObject:@"clear" forKeyedSubscript:@"type"];
LABEL_8:
    id v10 = v5;
    goto LABEL_9;
  }
  id v12 = 0;
  v6 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v3 requiringSecureCoding:1 error:&v12];
  id v7 = v12;
  if (!v7)
  {
    [v5 setObject:@"update" forKeyedSubscript:@"type"];
    [v5 setObject:v6 forKeyedSubscript:@"payload"];

    goto LABEL_8;
  }
  int v8 = v7;
  id v9 = _rt_log_facility_get_os_log(RTLogFacilityVehicleLocation);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    id v14 = v8;
    _os_log_error_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_ERROR, "RTVehicleLocationCompanionLink, Encoding error, %@", buf, 0xCu);
  }

  id v10 = 0;
LABEL_9:

  return v10;
}

- (id)decodeVehicleEvent:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = [v3 objectForKeyedSubscript:@"type"];
  if (![@"update" isEqualToString:v4])
  {
    if ([@"clear" isEqualToString:v4])
    {
      id v7 = 0;
      v6 = 0;
      goto LABEL_13;
    }
    v5 = _rt_log_facility_get_os_log(RTLogFacilityVehicleLocation);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v12 = v4;
      _os_log_error_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_ERROR, "RTVehicleLocationCompanionLink, Decoding error, unknown event type, %@", buf, 0xCu);
    }
    id v7 = 0;
    goto LABEL_11;
  }
  v5 = [v3 objectForKeyedSubscript:@"payload"];
  id v10 = 0;
  v6 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v5 error:&v10];
  id v7 = v10;
  if (v7)
  {
    int v8 = _rt_log_facility_get_os_log(RTLogFacilityVehicleLocation);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v12 = v7;
      _os_log_error_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_ERROR, "RTVehicleLocationCompanionLink, Decoding error, %@", buf, 0xCu);
    }

    v5 = v6;
LABEL_11:
    v6 = 0;
  }

LABEL_13:

  return v6;
}

- (void)registerEventHandlers
{
  id v3 = _rt_log_facility_get_os_log(RTLogFacilityVehicleLocation);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D9BFA000, v3, OS_LOG_TYPE_INFO, "RTVehicleLocationCompanionLink, registering request handlers", buf, 2u);
  }

  client = self->_client;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __55__RTVehicleLocationCompanionLink_registerEventHandlers__block_invoke;
  v5[3] = &unk_1E6B9B2F0;
  v5[4] = self;
  [(RPCompanionLinkClient *)client registerEventID:@"com.apple.routined.rapport.vehicleEventUpdate" options:0 handler:v5];
}

void __55__RTVehicleLocationCompanionLink_registerEventHandlers__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = _rt_log_facility_get_os_log(RTLogFacilityVehicleLocation);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)int v8 = 0;
    _os_log_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_INFO, "RTVehicleLocationCompanionLink, received an event update from a nearby device", v8, 2u);
  }

  v5 = [*(id *)(a1 + 32) vehicleEventHandler];

  if (v5)
  {
    v6 = [*(id *)(a1 + 32) decodeVehicleEvent:v3];
    id v7 = [*(id *)(a1 + 32) vehicleEventHandler];
    ((void (**)(void, void *))v7)[2](v7, v6);
  }
}

- (BOOL)_companionLinkConnected
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v2 = [(RPCompanionLinkClient *)self->_client activeDevices];
  id v3 = [v2 countByEnumeratingWithState:&v8 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v9;
    while (2)
    {
      for (i = 0; i != v3; i = ((char *)i + 1))
      {
        if (*(void *)v9 != v4) {
          objc_enumerationMutation(v2);
        }
        v6 = *(void **)(*((void *)&v8 + 1) + 8 * i);
        if ([v6 statusFlags])
        {
          id v3 = _rt_log_facility_get_os_log(RTLogFacilityVehicleLocation);
          if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v13 = v6;
            _os_log_impl(&dword_1D9BFA000, v3, OS_LOG_TYPE_INFO, "RTVehicleLocationCompanionLink, companion link connected device %@", buf, 0xCu);
          }

          LOBYTE(v3) = 1;
          goto LABEL_13;
        }
      }
      id v3 = [v2 countByEnumeratingWithState:&v8 objects:v14 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_13:

  return (char)v3;
}

- (void)sendVehicleEvent:(id)a3 handler:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ([(RTVehicleLocationCompanionLink *)self _companionLinkConnected])
  {
    long long v8 = [(RTVehicleLocationCompanionLink *)self encodeVehicleEvent:v6];
    if (v8)
    {
      long long v9 = [(RTVehicleLocationCompanionLink *)self client];
      uint64_t v10 = *MEMORY[0x1E4F94748];
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __59__RTVehicleLocationCompanionLink_sendVehicleEvent_handler___block_invoke;
      v14[3] = &unk_1E6B90C18;
      id v15 = v7;
      [v9 sendEventID:@"com.apple.routined.rapport.vehicleEventUpdate" event:v8 destinationID:v10 options:0 completion:v14];
    }
    else
    {
      id v12 = _rt_log_facility_get_os_log(RTLogFacilityVehicleLocation);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v17 = v6;
        _os_log_error_impl(&dword_1D9BFA000, v12, OS_LOG_TYPE_ERROR, "RTVehicleLocationCompanionLink, invalid payload, %@", buf, 0xCu);
      }

      (*((void (**)(id, void))v7 + 2))(v7, 0);
    }
  }
  else
  {
    long long v11 = _rt_log_facility_get_os_log(RTLogFacilityVehicleLocation);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      uint64_t v13 = [(RPCompanionLinkClient *)self->_client activeDevices];
      *(_DWORD *)buf = 138412290;
      id v17 = v13;
      _os_log_error_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_ERROR, "RTVehicleLocationCompanionLink, no connected clients, %@", buf, 0xCu);
    }
    (*((void (**)(id, void))v7 + 2))(v7, 0);
  }
}

void __59__RTVehicleLocationCompanionLink_sendVehicleEvent_handler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = _rt_log_facility_get_os_log(RTLogFacilityVehicleLocation);
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v6 = 138412290;
      id v7 = v3;
      _os_log_error_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_ERROR, "RTVehicleLocationCompanionLink, failed to post a vehicle event, err, %@", (uint8_t *)&v6, 0xCu);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    LOWORD(v6) = 0;
    _os_log_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_INFO, "RTVehicleLocationCompanionLink, send a vehicle event to paried companion device", (uint8_t *)&v6, 2u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (RPCompanionLinkClient)client
{
  return self->_client;
}

- (void)setClient:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (id)vehicleEventHandler
{
  return self->_vehicleEventHandler;
}

- (void)setVehicleEventHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_vehicleEventHandler, 0);
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong((id *)&self->_client, 0);
}

@end
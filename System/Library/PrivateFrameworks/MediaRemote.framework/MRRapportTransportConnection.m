@interface MRRapportTransportConnection
- (BOOL)_targetDeviceMatch:(id)a3 deviceUID:(id)a4;
- (BOOL)isValid;
- (MRRapportTransportConnection)initWithCompanionLinkClient:(id)a3 device:(id)a4 sessionUID:(id)a5;
- (MRRapportTransportConnection)initWithDeviceUID:(id)a3 sessionUID:(id)a4 targetDevice:(id *)a5 error:(id *)a6;
- (NSString)eventID;
- (NSString)sessionUID;
- (RPCompanionLinkClient)connection;
- (id)runLoop;
- (unint64_t)sendTransportData:(id)a3 options:(id)a4;
- (void)_registerCallbacks;
- (void)closeWithError:(id)a3;
- (void)setConnection:(id)a3;
@end

@implementation MRRapportTransportConnection

- (MRRapportTransportConnection)initWithCompanionLinkClient:(id)a3 device:(id)a4 sessionUID:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v18.receiver = self;
  v18.super_class = (Class)MRRapportTransportConnection;
  v12 = [(MRExternalDeviceTransportConnection *)&v18 init];
  v13 = v12;
  if (v12)
  {
    p_sessionUID = &v12->_sessionUID;
    objc_storeStrong((id *)&v12->_sessionUID, a5);
    objc_storeStrong((id *)&v13->_connection, a3);
    [(RPCompanionLinkClient *)v13->_connection setDestinationDevice:v10];
    uint64_t v15 = [[NSString alloc] initWithFormat:@"com.apple.mediaremote.remotecontrol.event.%@", *p_sessionUID];
    eventID = v13->_eventID;
    v13->_eventID = (NSString *)v15;

    [(MRRapportTransportConnection *)v13 _registerCallbacks];
  }

  return v13;
}

- (MRRapportTransportConnection)initWithDeviceUID:(id)a3 sessionUID:(id)a4 targetDevice:(id *)a5 error:(id *)a6
{
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  id v35 = a3;
  id v32 = a4;
  uint64_t v54 = 0;
  v55 = &v54;
  uint64_t v56 = 0x3032000000;
  v57 = __Block_byref_object_copy__50;
  v58 = __Block_byref_object_dispose__50;
  id v59 = 0;
  uint64_t v48 = 0;
  v49 = (id *)&v48;
  uint64_t v50 = 0x3032000000;
  v51 = __Block_byref_object_copy__50;
  v52 = __Block_byref_object_dispose__50;
  id v53 = 0;
  id v7 = objc_alloc_init(MEMORY[0x1E4F946E0]);
  v8 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v9 = dispatch_queue_create("com.apple.mediaremote.MRRapportTransportConnection.rapport", v8);
  [v7 setDispatchQueue:v9];

  dispatch_semaphore_t v10 = dispatch_semaphore_create(0);
  v45[0] = MEMORY[0x1E4F143A8];
  v45[1] = 3221225472;
  v45[2] = __80__MRRapportTransportConnection_initWithDeviceUID_sessionUID_targetDevice_error___block_invoke;
  v45[3] = &unk_1E57D05E0;
  v47 = &v54;
  id v11 = v10;
  v46 = v11;
  [v7 activateWithCompletion:v45];
  dispatch_time_t v12 = dispatch_time(0, 7000000000);
  if (dispatch_semaphore_wait(v11, v12) >= 1)
  {
    uint64_t v13 = objc_msgSend(objc_alloc(MEMORY[0x1E4F28C58]), "initWithMRError:format:", 26, @"Failed to activate companionLinkClient in %d seconds", 7);
    v14 = (void *)v55[5];
    v55[5] = v13;
  }
  if (v55[5]) {
    goto LABEL_16;
  }
  dispatch_semaphore_t v15 = dispatch_semaphore_create(0);
  v40[0] = MEMORY[0x1E4F143A8];
  v40[1] = 3221225472;
  v40[2] = __80__MRRapportTransportConnection_initWithDeviceUID_sessionUID_targetDevice_error___block_invoke_2;
  v40[3] = &unk_1E57D9FC0;
  v16 = self;
  v41 = v16;
  id v17 = v35;
  id v42 = v17;
  v44 = &v48;
  objc_super v18 = v15;
  v43 = v18;
  [v7 setDeviceFoundHandler:v40];
  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  v19 = [v7 activeDevices];
  uint64_t v20 = [v19 countByEnumeratingWithState:&v36 objects:v64 count:16];
  if (v20)
  {
    uint64_t v21 = *(void *)v37;
    do
    {
      for (uint64_t i = 0; i != v20; ++i)
      {
        if (*(void *)v37 != v21) {
          objc_enumerationMutation(v19);
        }
        v23 = *(void **)(*((void *)&v36 + 1) + 8 * i);
        if ([(MRRapportTransportConnection *)v16 _targetDeviceMatch:v23 deviceUID:v17])
        {
          objc_storeStrong(v49 + 5, v23);
          dispatch_semaphore_signal(v18);
        }
      }
      uint64_t v20 = [v19 countByEnumeratingWithState:&v36 objects:v64 count:16];
    }
    while (v20);
  }

  dispatch_time_t v24 = dispatch_time(0, 7000000000);
  if (dispatch_semaphore_wait(v18, v24) >= 1)
  {
    uint64_t v25 = [objc_alloc(MEMORY[0x1E4F28C58]) initWithMRError:26, @"Failed to discover companionLinkDevice for %@ in %d seconds", v17, 7 format];
    v26 = (void *)v55[5];
    v55[5] = v25;
  }
  if (v55[5])
  {
LABEL_16:
    v27 = MRLogCategoryConnections();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      uint64_t v28 = v55[5];
      *(_DWORD *)buf = 138543618;
      uint64_t v61 = v28;
      __int16 v62 = 2112;
      id v63 = v35;
      _os_log_impl(&dword_194F3C000, v27, OS_LOG_TYPE_ERROR, "[MRRapportTransportConnection] Error %{public}@ creating rapportTransportConnection for %@", buf, 0x16u);
    }

    v29 = 0;
    if (a6) {
      *a6 = (id) v55[5];
    }
  }
  else
  {
    if (a5) {
      *a5 = v49[5];
    }
    v29 = [(MRRapportTransportConnection *)v16 initWithCompanionLinkClient:v7 device:v49[5] sessionUID:v32];
    self = v29;
  }

  _Block_object_dispose(&v48, 8);
  _Block_object_dispose(&v54, 8);

  return v29;
}

void __80__MRRapportTransportConnection_initWithDeviceUID_sessionUID_targetDevice_error___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __80__MRRapportTransportConnection_initWithDeviceUID_sessionUID_targetDevice_error___block_invoke_2(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "_targetDeviceMatch:deviceUID:"))
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), a2);
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
  }
}

- (BOOL)isValid
{
  return 1;
}

- (id)runLoop
{
  return 0;
}

- (unint64_t)sendTransportData:(id)a3 options:(id)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v22 = a4;
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [v7 setObject:v6 forKeyedSubscript:@"data"];
  v8 = MRLogCategoryConnections();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = [v6 length];
    uint64_t v21 = [(RPCompanionLinkClient *)self->_connection destinationDevice];
    dispatch_semaphore_t v10 = [v21 effectiveIdentifier];
    id v11 = [(RPCompanionLinkClient *)self->_connection destinationDevice];
    dispatch_time_t v12 = [v11 name];
    uint64_t v13 = [(MRExternalDeviceTransportConnection *)self destinationOutputDeviceUID];
    v14 = [(MRRapportTransportConnection *)self sessionUID];
    *(_DWORD *)buf = 134219010;
    uint64_t v26 = v9;
    __int16 v27 = 2114;
    uint64_t v28 = v10;
    __int16 v29 = 2114;
    v30 = v12;
    __int16 v31 = 2114;
    id v32 = v13;
    __int16 v33 = 2114;
    v34 = v14;
    _os_log_impl(&dword_194F3C000, v8, OS_LOG_TYPE_DEFAULT, "[MRRapportTransportConnection] Writing %llu bytes to device=%{public}@(%{public}@) destination=%{public}@, session=%{public}@", buf, 0x34u);
  }
  objc_initWeak((id *)buf, self);
  connection = self->_connection;
  v16 = [(MRRapportTransportConnection *)self eventID];
  id v17 = [(RPCompanionLinkClient *)self->_connection destinationDevice];
  objc_super v18 = [v17 effectiveIdentifier];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __58__MRRapportTransportConnection_sendTransportData_options___block_invoke;
  v23[3] = &unk_1E57D8B18;
  objc_copyWeak(&v24, (id *)buf);
  [(RPCompanionLinkClient *)connection sendEventID:v16 event:v7 destinationID:v18 options:0 completion:v23];

  unint64_t v19 = [v6 length];
  objc_destroyWeak(&v24);
  objc_destroyWeak((id *)buf);

  return v19;
}

void __58__MRRapportTransportConnection_sendTransportData_options___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (v5)
  {
    id v4 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithMRError:121, @"companionLinkClient.sendEvent error %@", v5 format];
    [WeakRetained closeWithError:v4];
  }
}

- (void)closeWithError:(id)a3
{
  connection = self->_connection;
  id v5 = a3;
  [(RPCompanionLinkClient *)connection invalidate];
  [(MRExternalDeviceTransportConnection *)self _notifyDelegateDidCloseWithError:v5];
}

- (BOOL)_targetDeviceMatch:(id)a3 deviceUID:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [v5 effectiveIdentifier];
  if ([v7 isEqualToString:v6])
  {
    char v8 = 1;
  }
  else
  {
    uint64_t v9 = [v5 mediaRouteIdentifier];
    char v8 = [v9 isEqualToString:v6];
  }
  return v8;
}

- (void)_registerCallbacks
{
  objc_initWeak(&location, self);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __50__MRRapportTransportConnection__registerCallbacks__block_invoke;
  v9[3] = &unk_1E57D12D0;
  objc_copyWeak(&v10, &location);
  [(RPCompanionLinkClient *)self->_connection setInvalidationHandler:v9];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __50__MRRapportTransportConnection__registerCallbacks__block_invoke_2;
  v7[3] = &unk_1E57D9FE8;
  objc_copyWeak(&v8, &location);
  [(RPCompanionLinkClient *)self->_connection setDeviceLostHandler:v7];
  connection = self->_connection;
  id v4 = [(MRRapportTransportConnection *)self eventID];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __50__MRRapportTransportConnection__registerCallbacks__block_invoke_3;
  v5[3] = &unk_1E57DA010;
  objc_copyWeak(&v6, &location);
  [(RPCompanionLinkClient *)connection registerEventID:v4 options:0 handler:v5];

  objc_destroyWeak(&v6);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __50__MRRapportTransportConnection__registerCallbacks__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v1 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithMRError:121 description:@"companionLinkClient.invalidation"];
    [WeakRetained closeWithError:v1];
  }
}

void __50__MRRapportTransportConnection__registerCallbacks__block_invoke_2(uint64_t a1, void *a2)
{
  id v9 = a2;
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = WeakRetained;
  if (WeakRetained)
  {
    id v5 = [WeakRetained[9] destinationDevice];
    id v6 = [v5 effectiveIdentifier];
    int v7 = [v4 _targetDeviceMatch:v9 deviceUID:v6];

    if (v7)
    {
      id v8 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithMRError:121 description:@"companionLinkClient.deviceLost"];
      [v4 closeWithError:v8];
    }
  }
}

void __50__MRRapportTransportConnection__registerCallbacks__block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v5 = [v3 objectForKeyedSubscript:@"data"];
    if (v5)
    {
      id v6 = MRLogCategoryConnections();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v7 = [v5 length];
        uint64_t v13 = [WeakRetained[9] destinationDevice];
        id v8 = [v13 effectiveIdentifier];
        id v9 = [WeakRetained[9] destinationDevice];
        id v10 = [v9 name];
        id v11 = [WeakRetained destinationOutputDeviceUID];
        dispatch_time_t v12 = [WeakRetained sessionUID];
        *(_DWORD *)buf = 134219010;
        uint64_t v15 = v7;
        __int16 v16 = 2114;
        id v17 = v8;
        __int16 v18 = 2114;
        unint64_t v19 = v10;
        __int16 v20 = 2114;
        uint64_t v21 = v11;
        __int16 v22 = 2114;
        v23 = v12;
        _os_log_impl(&dword_194F3C000, v6, OS_LOG_TYPE_DEFAULT, "[MRRapportTransportConnection] Reading %llu bytes from device=%{public}@(%{public}@) destination=%{public}@, session=%{public}@", buf, 0x34u);
      }
      [WeakRetained _notifyDelegateDidReceiveData:v5];
    }
  }
}

- (NSString)sessionUID
{
  return self->_sessionUID;
}

- (NSString)eventID
{
  return self->_eventID;
}

- (RPCompanionLinkClient)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_eventID, 0);

  objc_storeStrong((id *)&self->_sessionUID, 0);
}

@end
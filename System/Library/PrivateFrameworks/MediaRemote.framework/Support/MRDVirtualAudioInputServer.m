@interface MRDVirtualAudioInputServer
- (MRDVirtualAudioInputServer)init;
- (MRDVirtualAudioInputServerDelegate)delegate;
- (NSArray)recordingEndpointClients;
- (NSArray)registeredDevices;
- (id)registeredDeviceWithID:(unsigned int)a3;
- (void)_handleGetDevicesMessage:(id)a3 fromClient:(id)a4;
- (void)_handleInputDeviceConnectedMessage:(id)a3 fromClient:(id)a4;
- (void)_handleInputDeviceDisconnectedMessage:(id)a3 fromClient:(id)a4;
- (void)_handleRecordingEndpointAvailabilityMessage:(id)a3 fromClient:(id)a4;
- (void)_handleRecordingStateChangedMessage:(id)a3 fromClient:(id)a4;
- (void)_handleVoiceDataReceivedMessage:(id)a3 fromClient:(id)a4;
- (void)clearRecordingEndpointsForClient:(id)a3;
- (void)clearRegisteredDevicesForClient:(id)a3;
- (void)collectDiagnostic:(id)a3;
- (void)handleXPCMessage:(id)a3 fromClient:(id)a4;
- (void)setDelegate:(id)a3;
@end

@implementation MRDVirtualAudioInputServer

- (MRDVirtualAudioInputServer)init
{
  v13.receiver = self;
  v13.super_class = (Class)MRDVirtualAudioInputServer;
  v2 = [(MRDVirtualAudioInputServer *)&v13 init];
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    recordingEndpointClients = v2->_recordingEndpointClients;
    v2->_recordingEndpointClients = v3;

    v5 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    registeredDevices = v2->_registeredDevices;
    v2->_registeredDevices = v5;

    v7 = (objc_class *)objc_opt_class();
    Name = class_getName(v7);
    v9 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v10 = dispatch_queue_create(Name, v9);
    serialQueue = v2->_serialQueue;
    v2->_serialQueue = (OS_dispatch_queue *)v10;
  }
  return v2;
}

- (NSArray)recordingEndpointClients
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = sub_10014D13C;
  dispatch_queue_t v10 = sub_10014D14C;
  id v11 = 0;
  serialQueue = self->_serialQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10014D154;
  v5[3] = &unk_100415CF0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync((dispatch_queue_t)serialQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSArray *)v3;
}

- (NSArray)registeredDevices
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = sub_10014D13C;
  dispatch_queue_t v10 = sub_10014D14C;
  id v11 = 0;
  serialQueue = self->_serialQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10014D290;
  v5[3] = &unk_100415CF0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync((dispatch_queue_t)serialQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSArray *)v3;
}

- (id)registeredDeviceWithID:(unsigned int)a3
{
  uint64_t v8 = 0;
  v9 = &v8;
  uint64_t v10 = 0x3032000000;
  id v11 = sub_10014D13C;
  v12 = sub_10014D14C;
  id v13 = 0;
  serialQueue = self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10014D3D0;
  block[3] = &unk_10041E848;
  unsigned int v7 = a3;
  block[4] = self;
  block[5] = &v8;
  dispatch_sync((dispatch_queue_t)serialQueue, block);
  id v4 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v4;
}

- (void)clearRegisteredDevicesForClient:(id)a3
{
  id v4 = a3;
  serialQueue = self->_serialQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10014D58C;
  v7[3] = &unk_1004158D8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync((dispatch_queue_t)serialQueue, v7);
}

- (void)clearRecordingEndpointsForClient:(id)a3
{
  id v4 = a3;
  serialQueue = self->_serialQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10014D75C;
  v7[3] = &unk_1004158D8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync((dispatch_queue_t)serialQueue, v7);
}

- (void)handleXPCMessage:(id)a3 fromClient:(id)a4
{
  xpc_object_t xdict = a3;
  id v6 = a4;
  switch(xpc_dictionary_get_uint64(xdict, "MRXPC_MESSAGE_ID_KEY"))
  {
    case 0x900000000000001uLL:
      [(MRDVirtualAudioInputServer *)self _handleGetDevicesMessage:xdict fromClient:v6];
      break;
    case 0x900000000000002uLL:
      [(MRDVirtualAudioInputServer *)self _handleInputDeviceConnectedMessage:xdict fromClient:v6];
      break;
    case 0x900000000000003uLL:
      [(MRDVirtualAudioInputServer *)self _handleInputDeviceDisconnectedMessage:xdict fromClient:v6];
      break;
    case 0x900000000000004uLL:
      [(MRDVirtualAudioInputServer *)self _handleRecordingStateChangedMessage:xdict fromClient:v6];
      break;
    case 0x900000000000005uLL:
      [(MRDVirtualAudioInputServer *)self _handleVoiceDataReceivedMessage:xdict fromClient:v6];
      break;
    case 0x900000000000006uLL:
      [(MRDVirtualAudioInputServer *)self _handleRecordingEndpointAvailabilityMessage:xdict fromClient:v6];
      break;
    default:
      break;
  }
}

- (void)collectDiagnostic:(id)a3
{
  id v4 = a3;
  serialQueue = self->_serialQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10014DA28;
  v7[3] = &unk_1004158D8;
  id v8 = v4;
  v9 = self;
  id v6 = v4;
  dispatch_sync((dispatch_queue_t)serialQueue, v7);
}

- (void)_handleGetDevicesMessage:(id)a3 fromClient:(id)a4
{
  id v5 = a3;
  id v6 = objc_alloc_init((Class)NSMutableArray);
  serialQueue = self->_serialQueue;
  uint64_t v10 = _NSConcreteStackBlock;
  uint64_t v11 = 3221225472;
  v12 = sub_10014DB64;
  id v13 = &unk_1004158D8;
  v14 = self;
  id v15 = v6;
  id v8 = v6;
  dispatch_sync((dispatch_queue_t)serialQueue, &v10);
  v9 = +[NSPropertyListSerialization dataWithPropertyList:format:options:error:](NSPropertyListSerialization, "dataWithPropertyList:format:options:error:", v8, 200, 0, 0, v10, v11, v12, v13, v14);
  sub_1001678A4(v5, (uint64_t)"MRXPC_VOICE_INPUT_DEVICES_DATA_KEY", v9, 0);
}

- (void)_handleInputDeviceConnectedMessage:(id)a3 fromClient:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)MRCreateDataFromXPCMessage();
  if (v8)
  {
    v9 = (void *)MRVirtualVoiceInputDeviceDescriptorCreateFromExternalRepresentation();
    uint64_t v10 = [[MRDVirtualAudioInputServerDevice alloc] initWithOwningClient:v7];
    [(MRDVirtualAudioInputServerDevice *)v10 setDescriptor:v9];
    unsigned int v25 = [(MRDVirtualAudioInputServerDevice *)v10 deviceID];
    uint64_t v11 = _MRLogForCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      sub_100330A68((uint64_t)v9, v11);
    }

    v12 = [(MRDVirtualAudioInputServer *)self recordingEndpointClients];
    id v13 = _MRLogForCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      sub_1003309DC(v12, v13);
    }

    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v14 = v12;
    id v15 = [v14 countByEnumeratingWithState:&v28 objects:v32 count:16];
    if (v15)
    {
      id v16 = v15;
      uint64_t v17 = *(void *)v29;
      do
      {
        for (i = 0; i != v16; i = (char *)i + 1)
        {
          if (*(void *)v29 != v17) {
            objc_enumerationMutation(v14);
          }
          [*(id *)(*((void *)&v28 + 1) + 8 * i) relayXPCMessage:v6 andReply:0];
        }
        id v16 = [v14 countByEnumeratingWithState:&v28 objects:v32 count:16];
      }
      while (v16);
    }

    serialQueue = self->_serialQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10014DF74;
    block[3] = &unk_1004158D8;
    block[4] = self;
    v27 = v10;
    v20 = v10;
    dispatch_sync((dispatch_queue_t)serialQueue, block);

    uint64_t v21 = v25;
  }
  else
  {
    v22 = _MRLogForCategory();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      sub_100330998(v22);
    }

    uint64_t v21 = 0;
  }
  xpc_dictionary_get_remote_connection(v6);
  v23 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  if (v23)
  {
    xpc_object_t reply = xpc_dictionary_create_reply(v6);
    xpc_dictionary_set_uint64(reply, "MRXPC_VOICE_INPUT_DEVICE_ID_KEY", v21);
    MRAddErrorToXPCMessage();
    xpc_connection_send_message(v23, reply);
  }
}

- (void)_handleInputDeviceDisconnectedMessage:(id)a3 fromClient:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int uint64 = xpc_dictionary_get_uint64(v6, "MRXPC_VOICE_INPUT_DEVICE_ID_KEY");
  v9 = _MRLogForCategory();
  uint64_t v10 = v9;
  if (uint64)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      sub_100330BE0();
    }

    uint64_t v25 = 0;
    v26 = &v25;
    uint64_t v27 = 0x2020000000;
    char v28 = 0;
    serialQueue = self->_serialQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10014E250;
    block[3] = &unk_10041E848;
    int v24 = uint64;
    block[4] = self;
    void block[5] = &v25;
    dispatch_sync((dispatch_queue_t)serialQueue, block);
    if (*((unsigned char *)v26 + 24))
    {
      v12 = [(MRDVirtualAudioInputServer *)self recordingEndpointClients];
      id v13 = _MRLogForCategory();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
        sub_100330B98(buf, (uint64_t)[v12 count], v13);
      }

      long long v21 = 0u;
      long long v22 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      id v14 = v12;
      id v15 = [v14 countByEnumeratingWithState:&v19 objects:v29 count:16];
      if (v15)
      {
        uint64_t v16 = *(void *)v20;
        do
        {
          for (i = 0; i != v15; i = (char *)i + 1)
          {
            if (*(void *)v20 != v16) {
              objc_enumerationMutation(v14);
            }
            objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * i), "relayXPCMessage:andReply:", v6, 0, (void)v19);
          }
          id v15 = [v14 countByEnumeratingWithState:&v19 objects:v29 count:16];
        }
        while (v15);
      }

      unsigned int v18 = 0;
    }
    else
    {
      id v14 = _MRLogForCategory();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        sub_100330B24();
      }
      unsigned int v18 = 22;
    }

    _Block_object_dispose(&v25, 8);
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_100330AE0(v10);
    }

    unsigned int v18 = 22;
  }
  sub_1001679D8(v6, v18);
}

- (void)_handleRecordingStateChangedMessage:(id)a3 fromClient:(id)a4
{
  id v5 = a3;
  id v6 = [(MRDVirtualAudioInputServer *)self registeredDeviceWithID:xpc_dictionary_get_uint64(v5, "MRXPC_VOICE_INPUT_DEVICE_ID_KEY")];
  id v7 = _MRLogForCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    sub_100330CC8();
  }

  if (v6)
  {
    uint64_t uint64 = xpc_dictionary_get_uint64(v5, "MRXPC_VOICE_RECORDING_STATE");
    [v6 setRecordingState:uint64];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    char v10 = objc_opt_respondsToSelector();

    if ((v10 & 1) == 0)
    {
      unsigned int v12 = 0;
      goto LABEL_11;
    }
    uint64_t v11 = objc_loadWeakRetained((id *)&self->_delegate);
    [v11 virtualAudioInputServer:self didUpdateRecordingState:uint64 forDevice:v6];
    unsigned int v12 = 0;
  }
  else
  {
    uint64_t v11 = _MRLogForCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_100330C54();
    }
    unsigned int v12 = 22;
  }

LABEL_11:
  sub_1001679D8(v5, v12);
}

- (void)_handleVoiceDataReceivedMessage:(id)a3 fromClient:(id)a4
{
  id v5 = a3;
  id v6 = [(MRDVirtualAudioInputServer *)self recordingEndpointClients];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      char v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        [*(id *)(*((void *)&v11 + 1) + 8 * (void)v10) relayXPCMessage:v5 andReply:0];
        char v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (void)_handleRecordingEndpointAvailabilityMessage:(id)a3 fromClient:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  BOOL v8 = xpc_dictionary_get_BOOL(v7, "MRXPC_VOICE_RECORDING_ENDPOINT_AVAILABLE_KEY");
  serialQueue = self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10014E6C0;
  block[3] = &unk_100417770;
  BOOL v13 = v8;
  block[4] = self;
  id v12 = v6;
  id v10 = v6;
  dispatch_sync((dispatch_queue_t)serialQueue, block);
  sub_1001679D8(v7, 0);
}

- (MRDVirtualAudioInputServerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MRDVirtualAudioInputServerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_registeredDevices, 0);

  objc_storeStrong((id *)&self->_recordingEndpointClients, 0);
}

@end
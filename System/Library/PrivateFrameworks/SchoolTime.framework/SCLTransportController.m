@interface SCLTransportController
- (BOOL)sendSchedule:(id)a3 identifier:(id *)a4 error:(id *)a5;
- (IDSDevice)device;
- (IDSService)service;
- (NRDevice)NRDevice;
- (NRPairedDeviceRegistry)deviceRegistry;
- (NSString)IDSDeviceIdentifier;
- (SCLSettingsSyncCoordinator)settingsSyncCoordinator;
- (SCLTransportController)initWithNRDevice:(id)a3 deviceRegistry:(id)a4 service:(id)a5 deviceIdentifier:(id)a6;
- (SCLTransportControllerDelegate)delegate;
- (SCLTransportService)transportService;
- (void)addUnlockHistoryItem:(id)a3;
- (void)applySchedule:(id)a3;
- (void)device;
- (void)handleIncomingHistoryItem:(id)a3;
- (void)handleIncomingSchedule:(id)a3 forType:(int)a4;
- (void)handleRemoteScheduleSettingsRequest;
- (void)requestRemoteSettings;
- (void)service:(id)a3 didDeliverMessageWithIdentifier:(id)a4;
- (void)service:(id)a3 identifier:(id)a4 didSendWithSuccess:(BOOL)a5 error:(id)a6;
- (void)service:(id)a3 incomingProtobuf:(id)a4 fromID:(id)a5 context:(id)a6;
- (void)setDelegate:(id)a3;
- (void)setSettingsSyncCoordinator:(id)a3;
- (void)setTransportService:(id)a3;
@end

@implementation SCLTransportController

- (SCLTransportController)initWithNRDevice:(id)a3 deviceRegistry:(id)a4 service:(id)a5 deviceIdentifier:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v20.receiver = self;
  v20.super_class = (Class)SCLTransportController;
  v15 = [(SCLTransportController *)&v20 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_NRDevice, a3);
    objc_storeStrong((id *)&v16->_deviceRegistry, a4);
    objc_storeStrong((id *)&v16->_service, a5);
    uint64_t v17 = [v14 copy];
    IDSDeviceIdentifier = v16->_IDSDeviceIdentifier;
    v16->_IDSDeviceIdentifier = (NSString *)v17;
  }
  return v16;
}

- (IDSDevice)device
{
  v3 = [(SCLTransportController *)self service];
  v4 = [v3 linkedDevicesWithRelationship:2];

  v5 = [(SCLTransportController *)self deviceRegistry];
  v6 = [(SCLTransportController *)self NRDevice];
  v7 = [v5 deviceForNRDevice:v6 fromIDSDevices:v4];

  if (!v7)
  {
    v8 = scl_pairing_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
      [(SCLTransportController *)self device];
    }
  }
  v9 = scl_pairing_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    -[SCLTransportController device]();
  }

  return (IDSDevice *)v7;
}

- (void)service:(id)a3 incomingProtobuf:(id)a4 fromID:(id)a5 context:(id)a6
{
  id v7 = a4;
  v8 = [(SCLTransportController *)self delegate];

  if (!v8)
  {
    v9 = scl_transport_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
      -[SCLTransportController service:incomingProtobuf:fromID:context:](self, v9);
    }
  }
  switch([v7 type])
  {
    case 1u:
      v10 = [SCLPBScheduleSettings alloc];
      id v11 = [v7 data];
      id v12 = [(SCLPBScheduleSettings *)v10 initWithData:v11];

      -[SCLTransportController handleIncomingSchedule:forType:](self, "handleIncomingSchedule:forType:", v12, [v7 type]);
      goto LABEL_14;
    case 2u:
      id v14 = [SCLPBUnlockHistoryItem alloc];
      v15 = [v7 data];
      id v12 = [(SCLPBUnlockHistoryItem *)v14 initWithData:v15];

      [(SCLTransportController *)self handleIncomingHistoryItem:v12];
      goto LABEL_14;
    case 3u:
      [(SCLTransportController *)self handleRemoteScheduleSettingsRequest];
      break;
    case 4u:
      v16 = [SCLPBScheduleRequestResponse alloc];
      uint64_t v17 = [v7 data];
      id v12 = [(SCLPBScheduleRequestResponse *)v16 initWithData:v17];

      if ([(SCLPBScheduleSettings *)v12 hasScheduleSettings])
      {
        v18 = [(SCLPBScheduleSettings *)v12 scheduleSettings];
        -[SCLTransportController handleIncomingSchedule:forType:](self, "handleIncomingSchedule:forType:", v18, [v7 type]);
      }
LABEL_14:

      break;
    default:
      id v13 = scl_transport_log();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        -[SCLTransportController service:incomingProtobuf:fromID:context:](v7, v13);
      }

      break;
  }
}

- (void)service:(id)a3 didDeliverMessageWithIdentifier:(id)a4
{
  id v5 = a4;
  id v6 = [(SCLTransportController *)self settingsSyncCoordinator];
  [v6 didDeliverMessageWithIdentifier:v5];
}

- (void)service:(id)a3 identifier:(id)a4 didSendWithSuccess:(BOOL)a5 error:(id)a6
{
  BOOL v6 = a5;
  id v9 = a6;
  id v10 = a4;
  id v11 = [(SCLTransportController *)self settingsSyncCoordinator];
  [v11 identifier:v10 didSendWithSuccess:v6 error:v9];
}

- (void)addUnlockHistoryItem:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  v4 = SCLPBUnlockHistoryItemFromSCLUnlockHistoryItem(a3);
  id v5 = [v4 data];
  BOOL v6 = (void *)[objc_alloc(MEMORY[0x263F4A098]) initWithProtobufData:v5 type:2 isResponse:0];
  id v7 = [(SCLTransportController *)self transportService];
  v8 = [(SCLTransportController *)self device];
  id v14 = 0;
  id v15 = 0;
  char v9 = [v7 sendProtobuf:v6 toDevice:v8 options:0 identifier:&v15 error:&v14];
  id v10 = v15;
  id v11 = v14;

  id v12 = scl_transport_log();
  id v13 = v12;
  if (v9)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v17 = v10;
      _os_log_impl(&dword_22B7B4000, v13, OS_LOG_TYPE_DEFAULT, "Sent history item with identifier %@", buf, 0xCu);
    }
  }
  else if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    -[SCLTransportController addUnlockHistoryItem:]();
  }
}

- (void)handleIncomingSchedule:(id)a3 forType:(int)a4
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  BOOL v6 = SCLScheduleSettingsFromSCLPBScheduleSettings(a3);
  id v7 = scl_transport_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412546;
    id v10 = v6;
    __int16 v11 = 1024;
    BOOL v12 = a4 == 4;
    _os_log_impl(&dword_22B7B4000, v7, OS_LOG_TYPE_DEFAULT, "Received incoming schedule: %@ forInitialSync: %{BOOL}u", (uint8_t *)&v9, 0x12u);
  }

  v8 = [(SCLTransportController *)self delegate];
  [v8 transportController:self didReceiveSchedule:v6 forInitialSync:a4 == 4];
}

- (void)handleIncomingHistoryItem:(id)a3
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  v4 = SCLUnlockHistoryItemFromSCLPBUnlockHistoryItem(a3);
  id v5 = scl_transport_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v7 = 138412290;
    v8 = v4;
    _os_log_impl(&dword_22B7B4000, v5, OS_LOG_TYPE_INFO, "Handle incoming history item %@", (uint8_t *)&v7, 0xCu);
  }

  BOOL v6 = [(SCLTransportController *)self delegate];
  [v6 transportController:self didReceiveUnlockHistoryItem:v4];
}

- (void)handleRemoteScheduleSettingsRequest
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_22B7B4000, v0, v1, "Failed to send remote schedule response: %@", v2, v3, v4, v5, v6);
}

- (BOOL)sendSchedule:(id)a3 identifier:(id *)a4 error:(id *)a5
{
  v16[1] = *MEMORY[0x263EF8340];
  v8 = SCLPBScheduleSettingsFromSCLScheduleSettings(a3);
  uint64_t v9 = [v8 data];
  id v10 = (void *)[objc_alloc(MEMORY[0x263F4A098]) initWithProtobufData:v9 type:1 isResponse:0];
  uint64_t v15 = *MEMORY[0x263F49F90];
  v16[0] = MEMORY[0x263EFFA88];
  __int16 v11 = [NSDictionary dictionaryWithObjects:v16 forKeys:&v15 count:1];
  BOOL v12 = [(SCLTransportController *)self transportService];
  uint64_t v13 = [(SCLTransportController *)self device];
  LOBYTE(a5) = [v12 sendProtobuf:v10 toDevice:v13 options:v11 identifier:a4 error:a5];

  return (char)a5;
}

- (void)applySchedule:(id)a3
{
  v20[1] = *MEMORY[0x263EF8340];
  uint64_t v4 = SCLPBScheduleSettingsFromSCLScheduleSettings(a3);
  uint64_t v5 = [v4 data];
  uint8_t v6 = (void *)[objc_alloc(MEMORY[0x263F4A098]) initWithProtobufData:v5 type:1 isResponse:0];
  uint64_t v19 = *MEMORY[0x263F49F90];
  v20[0] = MEMORY[0x263EFFA88];
  int v7 = [NSDictionary dictionaryWithObjects:v20 forKeys:&v19 count:1];
  v8 = [(SCLTransportController *)self transportService];
  uint64_t v9 = [(SCLTransportController *)self device];
  id v15 = 0;
  id v16 = 0;
  char v10 = [v8 sendProtobuf:v6 toDevice:v9 options:v7 identifier:&v16 error:&v15];
  id v11 = v16;
  id v12 = v15;

  uint64_t v13 = scl_transport_log();
  id v14 = v13;
  if (v10)
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v18 = v11;
      _os_log_impl(&dword_22B7B4000, v14, OS_LOG_TYPE_DEFAULT, "Sent schedule with identifier %@", buf, 0xCu);
    }
  }
  else if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    -[SCLTransportController applySchedule:]();
  }
}

- (void)requestRemoteSettings
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_22B7B4000, v0, v1, "Failed to send remote schedule request: %@", v2, v3, v4, v5, v6);
}

- (NRDevice)NRDevice
{
  return self->_NRDevice;
}

- (NRPairedDeviceRegistry)deviceRegistry
{
  return self->_deviceRegistry;
}

- (IDSService)service
{
  return self->_service;
}

- (NSString)IDSDeviceIdentifier
{
  return self->_IDSDeviceIdentifier;
}

- (SCLTransportService)transportService
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_transportService);
  return (SCLTransportService *)WeakRetained;
}

- (void)setTransportService:(id)a3
{
}

- (SCLTransportControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SCLTransportControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (SCLSettingsSyncCoordinator)settingsSyncCoordinator
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_settingsSyncCoordinator);
  return (SCLSettingsSyncCoordinator *)WeakRetained;
}

- (void)setSettingsSyncCoordinator:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_settingsSyncCoordinator);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_transportService);
  objc_storeStrong((id *)&self->_IDSDeviceIdentifier, 0);
  objc_storeStrong((id *)&self->_service, 0);
  objc_storeStrong((id *)&self->_deviceRegistry, 0);
  objc_storeStrong((id *)&self->_NRDevice, 0);
}

- (void)device
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  uint8_t v6 = [a1 NRDevice];
  int v7 = [v6 pairingID];
  v8 = [a1 IDSDeviceIdentifier];
  int v9 = 138412802;
  char v10 = v7;
  __int16 v11 = 2112;
  id v12 = v8;
  __int16 v13 = 2112;
  uint64_t v14 = a2;
  _os_log_fault_impl(&dword_22B7B4000, a3, OS_LOG_TYPE_FAULT, "No linked IDS device for NRDevice with pairingID %@; deviceIdentifier: %@; devices: %@ ",
    (uint8_t *)&v9,
    0x20u);
}

- (void)service:(void *)a1 incomingProtobuf:(NSObject *)a2 fromID:context:.cold.1(void *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v3 = objc_msgSend(NSNumber, "numberWithUnsignedShort:", objc_msgSend(a1, "type"));
  OUTLINED_FUNCTION_0_0();
  _os_log_error_impl(&dword_22B7B4000, a2, OS_LOG_TYPE_ERROR, "Unhandled protobuf message %@", v4, 0xCu);
}

- (void)service:(void *)a1 incomingProtobuf:(NSObject *)a2 fromID:context:.cold.2(void *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v3 = [a1 device];
  OUTLINED_FUNCTION_0_0();
  _os_log_fault_impl(&dword_22B7B4000, a2, OS_LOG_TYPE_FAULT, "No delegate for handling incoming protobuf for %@", v4, 0xCu);
}

- (void)addUnlockHistoryItem:.cold.1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_22B7B4000, v0, v1, "Failed to send history item: %@", v2, v3, v4, v5, v6);
}

- (void)applySchedule:.cold.1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_22B7B4000, v0, v1, "Failed to apply schedule: %@", v2, v3, v4, v5, v6);
}

@end